--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.9
-- Dumped by pg_dump version 9.3.9
-- Started on 2015-08-26 15:56:53 CEST

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
-- TOC entry 2979 (class 0 OID 0)
-- Dependencies: 241
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_with_oids = false;

--
-- TOC entry 177 (class 1259 OID 15727887)
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
-- TOC entry 223 (class 1259 OID 15728401)
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
-- TOC entry 222 (class 1259 OID 15728384)
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
-- TOC entry 216 (class 1259 OID 15728296)
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
-- TOC entry 239 (class 1259 OID 15728650)
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
-- TOC entry 191 (class 1259 OID 15728065)
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
-- TOC entry 194 (class 1259 OID 15728099)
-- Name: dogodekizven; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodekizven (
    id uuid NOT NULL
);


--
-- TOC entry 230 (class 1259 OID 15728552)
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
-- TOC entry 186 (class 1259 OID 15728008)
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
-- TOC entry 224 (class 1259 OID 15728414)
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
-- TOC entry 210 (class 1259 OID 15728231)
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
-- TOC entry 189 (class 1259 OID 15728045)
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
-- TOC entry 193 (class 1259 OID 15728093)
-- Name: gostujoca; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE gostujoca (
    id uuid NOT NULL,
    uprizoritev_id uuid
);


--
-- TOC entry 187 (class 1259 OID 15728025)
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
-- TOC entry 199 (class 1259 OID 15728146)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 237 (class 1259 OID 15728631)
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
-- TOC entry 238 (class 1259 OID 15728643)
-- Name: mapa_zapis; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE mapa_zapis (
    mapa_id uuid NOT NULL,
    zapis_id uuid NOT NULL
);


--
-- TOC entry 240 (class 1259 OID 15728665)
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
-- TOC entry 203 (class 1259 OID 15728171)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 184 (class 1259 OID 15727982)
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
-- TOC entry 178 (class 1259 OID 15727896)
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
-- TOC entry 179 (class 1259 OID 15727907)
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
-- TOC entry 174 (class 1259 OID 15727861)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 176 (class 1259 OID 15727880)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 204 (class 1259 OID 15728178)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 208 (class 1259 OID 15728211)
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
-- TOC entry 219 (class 1259 OID 15728335)
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
-- TOC entry 181 (class 1259 OID 15727940)
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
-- TOC entry 183 (class 1259 OID 15727974)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 200 (class 1259 OID 15728152)
-- Name: postavkaracuna; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE postavkaracuna (
    id uuid NOT NULL,
    racun_id uuid
);


--
-- TOC entry 182 (class 1259 OID 15727959)
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
-- TOC entry 188 (class 1259 OID 15728037)
-- Name: predstava; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE predstava (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    gostovanje_id uuid,
    gostujoc_id uuid
);


--
-- TOC entry 202 (class 1259 OID 15728164)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 226 (class 1259 OID 15728513)
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
-- TOC entry 227 (class 1259 OID 15728523)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    sifra character varying(4) NOT NULL,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 225 (class 1259 OID 15728469)
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
-- TOC entry 228 (class 1259 OID 15728531)
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
-- TOC entry 206 (class 1259 OID 15728193)
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
-- TOC entry 198 (class 1259 OID 15728137)
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
-- TOC entry 197 (class 1259 OID 15728127)
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
-- TOC entry 218 (class 1259 OID 15728324)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying,
    status character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 213 (class 1259 OID 15728263)
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
-- TOC entry 171 (class 1259 OID 15727832)
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
-- TOC entry 170 (class 1259 OID 15727830)
-- Name: revizije_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE revizije_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2980 (class 0 OID 0)
-- Dependencies: 170
-- Name: revizije_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE revizije_id_seq OWNED BY revizije.id;


--
-- TOC entry 207 (class 1259 OID 15728205)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 175 (class 1259 OID 15727870)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 173 (class 1259 OID 15727854)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 209 (class 1259 OID 15728219)
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
-- TOC entry 201 (class 1259 OID 15728158)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 195 (class 1259 OID 15728104)
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
-- TOC entry 233 (class 1259 OID 15728572)
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
-- TOC entry 232 (class 1259 OID 15728564)
-- Name: stevilcenjekonfig; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjekonfig (
    id uuid NOT NULL,
    stevilcenje_id uuid,
    dok character varying(100) DEFAULT NULL::character varying
);


--
-- TOC entry 231 (class 1259 OID 15728559)
-- Name: stevilcenjestanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjestanje (
    id uuid NOT NULL,
    objid uuid NOT NULL,
    leto integer NOT NULL,
    stevilka integer
);


--
-- TOC entry 214 (class 1259 OID 15728273)
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
-- TOC entry 180 (class 1259 OID 15727932)
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
-- TOC entry 196 (class 1259 OID 15728114)
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
-- TOC entry 217 (class 1259 OID 15728313)
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
-- TOC entry 229 (class 1259 OID 15728541)
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
-- TOC entry 185 (class 1259 OID 15727994)
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
-- TOC entry 172 (class 1259 OID 15727841)
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
-- TOC entry 221 (class 1259 OID 15728361)
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
-- TOC entry 190 (class 1259 OID 15728056)
-- Name: vaja; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE vaja (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    zaporedna integer,
    porocilo text
);


--
-- TOC entry 205 (class 1259 OID 15728185)
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
-- TOC entry 215 (class 1259 OID 15728287)
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
-- TOC entry 235 (class 1259 OID 15728611)
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
-- TOC entry 234 (class 1259 OID 15728583)
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
-- TOC entry 236 (class 1259 OID 15728623)
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
-- TOC entry 212 (class 1259 OID 15728256)
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
-- TOC entry 192 (class 1259 OID 15728088)
-- Name: zasedenost; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zasedenost (
    id uuid NOT NULL
);


--
-- TOC entry 220 (class 1259 OID 15728351)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 211 (class 1259 OID 15728246)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 2175 (class 2604 OID 15727835)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 2909 (class 0 OID 15727887)
-- Dependencies: 177
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
\.


--
-- TOC entry 2955 (class 0 OID 15728401)
-- Dependencies: 223
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, zaposlitev_id, oseba_id, pogodba_id, sifra, zaposlen, zacetek, konec, opomba, sort, privzeti, aktivna, imapogodbo, pomembna) FROM stdin;
000c0000-55dd-c5a4-7403-59de0675f569	000d0000-55dd-c5a3-b5ed-c67b7143032f	\N	00090000-55dd-c5a3-9085-89b2965f1e41	000b0000-55dd-c5a3-372d-e89d4c3b744e	0001	f	\N	\N	\N	3	\N	\N	t	t
000c0000-55dd-c5a4-6a3e-37ffb7564ab0	000d0000-55dd-c5a3-ccc7-7e7e4ee1d782	00100000-55dd-c5a4-f3b0-862601ee0506	00090000-55dd-c5a3-41a5-99a18dd73c8c	\N	0002	t	2016-01-01	\N	\N	8	\N	\N	f	f
000c0000-55dd-c5a4-e9af-ea2af70a0358	000d0000-55dd-c5a3-aa58-2f35b67e2a03	00100000-55dd-c5a4-0c77-a9972a1bbe12	00090000-55dd-c5a3-1424-f63eaa57a754	\N	0003	t	\N	2015-08-26	\N	2	\N	\N	f	f
000c0000-55dd-c5a4-6662-65b6296fb096	000d0000-55dd-c5a3-d48d-8f92119b220b	\N	00090000-55dd-c5a3-5325-f3599bded35d	\N	0004	f	2016-01-01	2016-01-01	\N	26	\N	\N	f	f
000c0000-55dd-c5a4-cc5d-dfb3c4e2b81e	000d0000-55dd-c5a3-bb8b-383133e3edb7	\N	00090000-55dd-c5a3-d8e7-3dcd51d7e62a	\N	0005	f	2016-01-01	2016-01-01	\N	7	\N	\N	f	f
000c0000-55dd-c5a4-e611-18626c772a1f	000d0000-55dd-c5a3-ecfd-ce40a91ec51f	\N	00090000-55dd-c5a3-80a8-0a2276b8f05c	000b0000-55dd-c5a3-e6aa-7abbc3f1e7b9	0006	f	2016-01-01	2016-01-01	\N	1	\N	\N	t	t
000c0000-55dd-c5a4-39c8-205a22c63707	000d0000-55dd-c5a3-73e1-15a5823a40f1	00100000-55dd-c5a4-3766-b8e41b7f981b	00090000-55dd-c5a3-5e82-d2ca98f65e6e	\N	0007	t	2016-01-01	2016-01-01	\N	14	\N	\N	f	t
000c0000-55dd-c5a4-e10d-a7b90e60544a	000d0000-55dd-c5a3-98a1-e8e2522aa059	\N	00090000-55dd-c5a3-6be3-066f343dc568	000b0000-55dd-c5a3-ddb1-fcba8a2217a4	0008	f	2016-01-01	2016-01-01	\N	12	\N	\N	t	t
000c0000-55dd-c5a4-6095-2fb5b887120b	000d0000-55dd-c5a3-73e1-15a5823a40f1	00100000-55dd-c5a4-383d-18eca8a00c59	00090000-55dd-c5a3-2ddb-a7f3c7631b3a	\N	0009	t	2017-01-01	2017-01-01	\N	15	\N	\N	f	t
000c0000-55dd-c5a4-8d4c-5bccc10994b6	000d0000-55dd-c5a3-73e1-15a5823a40f1	00100000-55dd-c5a4-3798-54c88b6b93a2	00090000-55dd-c5a3-b297-3e5b71129a04	\N	0010	t	\N	2015-08-26	\N	16	\N	\N	f	t
000c0000-55dd-c5a4-7ac2-195b478710c5	000d0000-55dd-c5a3-73e1-15a5823a40f1	00100000-55dd-c5a4-2c3e-b8e3294a68c8	00090000-55dd-c5a3-4b67-6ee987e9c0a7	\N	0011	t	2017-01-01	\N	\N	17	\N	\N	f	t
\.


--
-- TOC entry 2954 (class 0 OID 15728384)
-- Dependencies: 222
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 2948 (class 0 OID 15728296)
-- Dependencies: 216
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, stevilka, naslov, avtor, podnaslov, jezik, naslovizvirnika, internacionalninaslov, datumprejema, moskevloge, zenskevloge, prevajalec, povzetekvsebine, letoizida, krajizida, zaloznik) FROM stdin;
00160000-55dd-c5a3-b393-12e6c426c552	0001	Sen kresne noči	William Shakespeare		slovenščina	A Midsummer Night's Dream	\N	2015-04-26	5	5	Milan Jesih	Nastopajo Titanija, Hipolita, Oberon, ...	\N	\N	\N
00160000-55dd-c5a3-dbff-0d8c725fefe7	0002	Bratje Karamazovi	Fjodor Mihajlovič Dostojevski		slovenščina	Bratja Karamazjovji	\N	2015-12-04	4	1	Vladimir Levstik	Svetovna uspešnica	\N	\N	\N
00160000-55dd-c5a3-c0e9-1ab411c84b65	0003	Smoletov Vrt	Berta Hočevar		slovenščina		\N	2015-05-26	2	8			\N	\N	\N
\.


--
-- TOC entry 2971 (class 0 OID 15728650)
-- Dependencies: 239
-- Data for Name: datoteka; Type: TABLE DATA; Schema: public; Owner: -
--

COPY datoteka (id, owner_id, filename, transfers, size, format, hash, createdat, uploadedat, upor, datknj) FROM stdin;
\.


--
-- TOC entry 2923 (class 0 OID 15728065)
-- Dependencies: 191
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_izven_id, prostor_id, sezona_id, planiranzacetek, zacetek, konec, status, razred, termin, ime) FROM stdin;
00180000-55dd-c5a4-df55-917f573a9239	\N	\N	00200000-55dd-c5a3-7b96-0452a05cf796	\N	\N	\N	\N	2015-06-26 10:00:00	2015-06-26 10:00:00	2015-06-26 12:00:00	3			
00180000-55dd-c5a4-f8eb-745aa73e6a62	\N	\N	00200000-55dd-c5a3-bafe-2cfe420100bc	\N	\N	\N	\N	2015-06-27 10:00:00	2015-06-27 10:00:00	2015-06-27 12:00:00	4			
00180000-55dd-c5a4-e7da-5db8735e0597	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	5			
00180000-55dd-c5a4-9650-1457d6d9280a	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	2			
00180000-55dd-c5a4-495b-4aed89982c5f	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	7			
\.


--
-- TOC entry 2926 (class 0 OID 15728099)
-- Dependencies: 194
-- Data for Name: dogodekizven; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodekizven (id) FROM stdin;
\.


--
-- TOC entry 2962 (class 0 OID 15728552)
-- Dependencies: 230
-- Data for Name: drugivir; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drugivir (id, znesek, opis, mednarodni, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 2918 (class 0 OID 15728008)
-- Dependencies: 186
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-55dd-c5a2-aa72-8192cc02ca8b	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-55dd-c5a2-fc0c-169acf8a44be	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-55dd-c5a2-9303-56427d6a9191	AL	ALB	008	Albania 	Albanija	\N
00040000-55dd-c5a2-690e-cdb793313f55	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-55dd-c5a2-2523-3e2accbc1fc1	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-55dd-c5a2-1772-3391ccb763c3	AD	AND	020	Andorra 	Andora	\N
00040000-55dd-c5a2-4cba-63af2b3781d6	AO	AGO	024	Angola 	Angola	\N
00040000-55dd-c5a2-9b06-4ce8a926e04a	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-55dd-c5a2-8196-65c545b9e258	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-55dd-c5a2-a2ca-194c88dead75	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-55dd-c5a2-6563-9f131e8f7a03	AR	ARG	032	Argentina 	Argenitna	\N
00040000-55dd-c5a2-2458-1b3d6ebe45bf	AM	ARM	051	Armenia 	Armenija	\N
00040000-55dd-c5a2-cb27-3ce9024f1f30	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-55dd-c5a2-7544-76a02a01e2fc	AU	AUS	036	Australia 	Avstralija	\N
00040000-55dd-c5a2-9b5a-57fc1cb8d89b	AT	AUT	040	Austria 	Avstrija	\N
00040000-55dd-c5a2-e3f9-299656cdb52e	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-55dd-c5a2-8c0d-6acecccd90b9	BS	BHS	044	Bahamas 	Bahami	\N
00040000-55dd-c5a2-814a-aaeffc885f43	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-55dd-c5a2-c582-4e995b9bb1ff	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-55dd-c5a2-ab00-708226085ebd	BB	BRB	052	Barbados 	Barbados	\N
00040000-55dd-c5a2-87dd-46a928827e40	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-55dd-c5a2-e24f-5639ed867c8b	BE	BEL	056	Belgium 	Belgija	\N
00040000-55dd-c5a2-0241-5a5567396d9f	BZ	BLZ	084	Belize 	Belize	\N
00040000-55dd-c5a2-d0a7-95748a11fcdd	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-55dd-c5a2-b4ce-38ce5ad89344	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-55dd-c5a2-723c-627d5934edfd	BT	BTN	064	Bhutan 	Butan	\N
00040000-55dd-c5a2-10f6-7e34169ee19f	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-55dd-c5a2-36b4-46c0eb14b6bf	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-55dd-c5a2-b6a0-bbaa4d7dcf11	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-55dd-c5a2-a5d5-edcd0a199fc8	BW	BWA	072	Botswana 	Bocvana	\N
00040000-55dd-c5a2-4222-af9245516f17	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-55dd-c5a2-4bca-a6b069243f72	BR	BRA	076	Brazil 	Brazilija	\N
00040000-55dd-c5a2-ce08-1a72b19d046c	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-55dd-c5a2-2130-989ec4754410	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-55dd-c5a2-af7e-b875a38679ac	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-55dd-c5a2-41c0-b45df61a02cf	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-55dd-c5a2-190a-00ea1d7bbee1	BI	BDI	108	Burundi 	Burundi 	\N
00040000-55dd-c5a2-b256-adda1a8706b1	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-55dd-c5a2-c02f-da968ef503cb	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-55dd-c5a2-4c1a-07f52327cc13	CA	CAN	124	Canada 	Kanada	\N
00040000-55dd-c5a2-521f-2be9fd94f9d6	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-55dd-c5a2-0390-ee3ee8b602ba	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-55dd-c5a2-28fc-1431fd2e278b	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-55dd-c5a2-498c-9fcf6732c620	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-55dd-c5a2-8141-9e014f0440f6	CL	CHL	152	Chile 	Čile	\N
00040000-55dd-c5a2-f365-3d0809bcd052	CN	CHN	156	China 	Kitajska	\N
00040000-55dd-c5a2-99bd-dc35bb2089ce	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-55dd-c5a2-2764-682128e0c0b0	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-55dd-c5a2-91a9-e960b800837c	CO	COL	170	Colombia 	Kolumbija	\N
00040000-55dd-c5a2-9952-b6bbfa2b402c	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-55dd-c5a2-7a0e-aa2d34dfd6f1	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-55dd-c5a2-f7b1-1befbfe16869	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-55dd-c5a2-a0d6-b528b28d622d	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-55dd-c5a2-045c-6f58fc1f8786	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-55dd-c5a2-f9d2-d1785ab97f46	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-55dd-c5a2-3c20-b652725556b7	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-55dd-c5a2-0709-f047158ef1ef	CU	CUB	192	Cuba 	Kuba	\N
00040000-55dd-c5a2-e4ef-14f2e4b0abd2	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-55dd-c5a2-3177-5edd7baf3eb1	CY	CYP	196	Cyprus 	Ciper	\N
00040000-55dd-c5a2-62d3-a9b9e0c6f67d	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-55dd-c5a2-d3b3-62a0ad98be9b	DK	DNK	208	Denmark 	Danska	\N
00040000-55dd-c5a2-c1c1-0ab1fd7eac1f	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-55dd-c5a2-dfee-0c6654c505a5	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-55dd-c5a2-2b21-887f043f1f25	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-55dd-c5a2-dd8e-1f888ee77139	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-55dd-c5a2-08c8-76343b746885	EG	EGY	818	Egypt 	Egipt	\N
00040000-55dd-c5a2-f85a-88d7ddf69043	SV	SLV	222	El Salvador 	Salvador	\N
00040000-55dd-c5a2-4949-16639edf9d98	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-55dd-c5a2-1afd-a490e12b8284	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-55dd-c5a2-7fca-febcac37571f	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-55dd-c5a2-b47b-16deed2ed5f3	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-55dd-c5a2-bf12-98139ec79227	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-55dd-c5a2-53f1-c07d7b67a6ae	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-55dd-c5a2-cfac-e629b02eda74	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-55dd-c5a2-1497-945b30b0ef03	FI	FIN	246	Finland 	Finska	\N
00040000-55dd-c5a2-227a-0cbf3fd5004f	FR	FRA	250	France 	Francija	\N
00040000-55dd-c5a2-318a-59e1834bb2bd	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-55dd-c5a2-48c3-eb8677daab64	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-55dd-c5a2-f250-c4d7e57e5c8a	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-55dd-c5a2-c52d-ce209b9cde4e	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-55dd-c5a2-472f-a5d6b0460c1e	GA	GAB	266	Gabon 	Gabon	\N
00040000-55dd-c5a2-9a7d-67c8e15efc6b	GM	GMB	270	Gambia 	Gambija	\N
00040000-55dd-c5a2-5c3d-c21a1d345560	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-55dd-c5a2-9601-dac42dd1a71a	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-55dd-c5a2-6973-28fc890b819b	GH	GHA	288	Ghana 	Gana	\N
00040000-55dd-c5a2-3026-76af62e7fe2e	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-55dd-c5a2-05c9-17288c7fb116	GR	GRC	300	Greece 	Grčija	\N
00040000-55dd-c5a2-68af-5b9e6c981954	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-55dd-c5a2-d895-5db502762d68	GD	GRD	308	Grenada 	Grenada	\N
00040000-55dd-c5a2-bc86-1ef5b2a92cfb	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-55dd-c5a2-18a9-12950cbd3631	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-55dd-c5a2-e39c-12d0aecc76a0	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-55dd-c5a2-a092-e195bfd5b753	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-55dd-c5a2-dac1-6254aebb0740	GN	GIN	324	Guinea 	Gvineja	\N
00040000-55dd-c5a2-0ae8-48875bf3a977	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-55dd-c5a2-056c-ff5623e783fb	GY	GUY	328	Guyana 	Gvajana	\N
00040000-55dd-c5a2-7752-2acbf581f297	HT	HTI	332	Haiti 	Haiti	\N
00040000-55dd-c5a2-24f5-a95f3969f553	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-55dd-c5a2-6d10-322083e9ac57	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-55dd-c5a2-5401-fab832a2c478	HN	HND	340	Honduras 	Honduras	\N
00040000-55dd-c5a2-eefa-8c07e49f8e95	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-55dd-c5a2-a9cd-1217c530708e	HU	HUN	348	Hungary 	Madžarska	\N
00040000-55dd-c5a2-b1f9-7f124f5dca9c	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-55dd-c5a2-eb9c-723a18160e92	IN	IND	356	India 	Indija	\N
00040000-55dd-c5a2-7c12-2d64d57d0492	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-55dd-c5a2-826e-a08c9311db34	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-55dd-c5a2-5271-a3b67a61b46e	IQ	IRQ	368	Iraq 	Irak	\N
00040000-55dd-c5a2-0ba1-268613a1c213	IE	IRL	372	Ireland 	Irska	\N
00040000-55dd-c5a2-b966-c3c134b63701	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-55dd-c5a2-10bf-1aedf1ca3796	IL	ISR	376	Israel 	Izrael	\N
00040000-55dd-c5a2-00ad-55801e825ba8	IT	ITA	380	Italy 	Italija	\N
00040000-55dd-c5a2-0311-22258defc3e9	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-55dd-c5a2-c882-ed1526416361	JP	JPN	392	Japan 	Japonska	\N
00040000-55dd-c5a2-68ae-10cfa1f3fa8b	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-55dd-c5a2-0b8e-545b9d57db60	JO	JOR	400	Jordan 	Jordanija	\N
00040000-55dd-c5a2-f406-6db5948c86e5	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-55dd-c5a2-cfdf-bf6b1bacf4c0	KE	KEN	404	Kenya 	Kenija	\N
00040000-55dd-c5a2-6b4a-69ea8d945b4a	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-55dd-c5a2-f039-be06436be642	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-55dd-c5a2-ffbb-eaacd162b11a	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-55dd-c5a2-e835-969988bdf7d0	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-55dd-c5a2-3486-ee22708da6de	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-55dd-c5a2-7261-4b9facab5e97	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-55dd-c5a2-0625-fd7e6648facc	LV	LVA	428	Latvia 	Latvija	\N
00040000-55dd-c5a2-cb02-9e241d102751	LB	LBN	422	Lebanon 	Libanon	\N
00040000-55dd-c5a2-8184-0cc8e82e320d	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-55dd-c5a2-350e-90d095786d71	LR	LBR	430	Liberia 	Liberija	\N
00040000-55dd-c5a2-b13e-d827eca00123	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-55dd-c5a2-8c93-9269c2cfa6fc	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-55dd-c5a2-e70c-6130656c52e7	LT	LTU	440	Lithuania 	Litva	\N
00040000-55dd-c5a2-c6ec-f91f87007789	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-55dd-c5a2-897b-4a8efcb02f9d	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-55dd-c5a2-87d5-3c802ede0ca6	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-55dd-c5a2-5c31-74cc41a7d165	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-55dd-c5a2-e4d1-3aeba019cef2	MW	MWI	454	Malawi 	Malavi	\N
00040000-55dd-c5a2-3a0b-e6230a8bebfb	MY	MYS	458	Malaysia 	Malezija	\N
00040000-55dd-c5a2-41df-8234d87a94da	MV	MDV	462	Maldives 	Maldivi	\N
00040000-55dd-c5a2-4749-3240a2422090	ML	MLI	466	Mali 	Mali	\N
00040000-55dd-c5a2-382e-006e8eac7abf	MT	MLT	470	Malta 	Malta	\N
00040000-55dd-c5a2-6eb1-19c5c4b2ca32	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-55dd-c5a2-7fbb-3dcd95af1b49	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-55dd-c5a2-684a-af8e1f183eea	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-55dd-c5a2-7e6e-6adfb728c579	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-55dd-c5a2-2dc1-48309eac82f1	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-55dd-c5a2-a194-78ab4d0f0d68	MX	MEX	484	Mexico 	Mehika	\N
00040000-55dd-c5a2-914c-008332eee7bb	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-55dd-c5a2-c68d-98a841ebc7e5	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-55dd-c5a2-7d54-da7829abf157	MC	MCO	492	Monaco 	Monako	\N
00040000-55dd-c5a2-aca6-924852e0fdcd	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-55dd-c5a2-39aa-7d71b70eb4a1	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-55dd-c5a2-b3a7-164126fc91b6	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-55dd-c5a2-98c8-bd5efd4e4d38	MA	MAR	504	Morocco 	Maroko	\N
00040000-55dd-c5a2-484d-c208d029a713	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-55dd-c5a2-e4ad-e1be147dae6f	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-55dd-c5a2-f24e-7972065ade22	NA	NAM	516	Namibia 	Namibija	\N
00040000-55dd-c5a2-2216-ec1c0cd6f173	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-55dd-c5a2-00be-2fb493fa8193	NP	NPL	524	Nepal 	Nepal	\N
00040000-55dd-c5a2-1f83-504117182479	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-55dd-c5a2-ddd6-bfbe0624e07e	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-55dd-c5a2-709c-1296f2ca9d5f	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-55dd-c5a2-3bfd-13ec441f201f	NE	NER	562	Niger 	Niger 	\N
00040000-55dd-c5a2-f0d3-44fb39f5caea	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-55dd-c5a2-d2d9-c1560cc0fa76	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-55dd-c5a2-7ea0-ddff526c3f24	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-55dd-c5a2-42ba-ed93796d9c3c	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-55dd-c5a2-41f9-1553605d343a	NO	NOR	578	Norway 	Norveška	\N
00040000-55dd-c5a2-40fe-b5264c91dba0	OM	OMN	512	Oman 	Oman	\N
00040000-55dd-c5a2-03ec-3ee1e237c6ae	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-55dd-c5a2-8e7c-8c2411beefdb	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-55dd-c5a2-e970-1fb6c693949d	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-55dd-c5a2-7a46-d351cbab5a7a	PA	PAN	591	Panama 	Panama	\N
00040000-55dd-c5a2-cd61-d81f8ba0c541	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-55dd-c5a2-597c-2886a6902d36	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-55dd-c5a2-03bd-c5c98b757f69	PE	PER	604	Peru 	Peru	\N
00040000-55dd-c5a2-219a-ed15d5404d3c	PH	PHL	608	Philippines 	Filipini	\N
00040000-55dd-c5a2-fec6-6165d2544c82	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-55dd-c5a2-33f3-355673a40fe8	PL	POL	616	Poland 	Poljska	\N
00040000-55dd-c5a2-3e38-ee1cfb8ab6ac	PT	PRT	620	Portugal 	Portugalska	\N
00040000-55dd-c5a2-890f-e1a1a5813067	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-55dd-c5a2-c437-59d71145a332	QA	QAT	634	Qatar 	Katar	\N
00040000-55dd-c5a2-d088-cc0bac0aff59	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-55dd-c5a2-01df-7a32c8ecad0c	RO	ROU	642	Romania 	Romunija	\N
00040000-55dd-c5a2-8627-53da1573ca82	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-55dd-c5a2-a013-6183d85544e0	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-55dd-c5a2-e712-30ce4da57ed9	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-55dd-c5a2-e561-a2182590b8e7	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-55dd-c5a2-b0ab-baf0ebeee6fc	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-55dd-c5a2-2655-684b012b559c	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-55dd-c5a2-9550-8adef14b5b38	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-55dd-c5a2-d98c-81b17bb7cda7	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-55dd-c5a2-aa2c-5444a3a73479	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-55dd-c5a2-000e-ab51ea4ff048	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-55dd-c5a2-bb6c-c62d620a4315	SM	SMR	674	San Marino 	San Marino	\N
00040000-55dd-c5a2-6291-3a0547a7a0eb	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-55dd-c5a2-36f8-99e4de521c1f	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-55dd-c5a2-22f4-dae77f4d9e35	SN	SEN	686	Senegal 	Senegal	\N
00040000-55dd-c5a2-44bb-7a1e5eda2178	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-55dd-c5a2-5a1f-73df021d42ba	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-55dd-c5a2-65b6-9976563c0723	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-55dd-c5a2-2e44-f5c1390164f3	SG	SGP	702	Singapore 	Singapur	\N
00040000-55dd-c5a2-f101-6c65b2b24cf5	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-55dd-c5a2-d2f1-4e4b3a15fc97	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-55dd-c5a2-fc95-2d32b7ce352a	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-55dd-c5a2-e2d9-ca7026b04171	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-55dd-c5a2-4a91-96c75aef43df	SO	SOM	706	Somalia 	Somalija	\N
00040000-55dd-c5a2-6557-e09878657030	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-55dd-c5a2-9f28-e432ae894341	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-55dd-c5a2-e0f9-9f6fbb70ecbc	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-55dd-c5a2-0bca-273dbf6748a3	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-55dd-c5a2-7672-e49316968c10	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-55dd-c5a2-7ede-67fda274aaf9	SD	SDN	729	Sudan 	Sudan	\N
00040000-55dd-c5a2-2d5d-f11f843b0293	SR	SUR	740	Suriname 	Surinam	\N
00040000-55dd-c5a2-8c90-605b78a7a2c7	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-55dd-c5a2-e058-813838ab0863	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-55dd-c5a2-5cde-9b33a160c271	SE	SWE	752	Sweden 	Švedska	\N
00040000-55dd-c5a2-1952-80f0b520f7d1	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-55dd-c5a2-bef0-f0c9f9da3fa5	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-55dd-c5a2-e876-b1e6353f64b5	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-55dd-c5a2-5513-ff2d5f113b95	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-55dd-c5a2-68a1-07aed65121c0	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-55dd-c5a2-45b8-5e7b3acbc231	TH	THA	764	Thailand 	Tajska	\N
00040000-55dd-c5a2-e6a4-7ce8ebd677d4	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-55dd-c5a2-0700-954753fc312c	TG	TGO	768	Togo 	Togo	\N
00040000-55dd-c5a2-4a14-7e79fb58da53	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-55dd-c5a2-3b1b-e0d5264279df	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-55dd-c5a2-c164-d51a51583652	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-55dd-c5a2-5181-c93a834d9ee8	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-55dd-c5a2-aeea-efae26f84a20	TR	TUR	792	Turkey 	Turčija	\N
00040000-55dd-c5a2-ef6c-819b3892f26b	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-55dd-c5a2-0690-a2d145cd4ecb	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-55dd-c5a2-590a-7389cea5439b	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-55dd-c5a2-61d5-81a6ebf17e1a	UG	UGA	800	Uganda 	Uganda	\N
00040000-55dd-c5a2-6b3d-42607a75953a	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-55dd-c5a2-8dca-30c0f2a86200	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-55dd-c5a2-7fca-dc23d4680612	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-55dd-c5a2-2f55-027139703fd8	US	USA	840	United States 	Združene države Amerike	\N
00040000-55dd-c5a2-0087-1e31bcfc2b50	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-55dd-c5a2-84eb-85fc335ddda8	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-55dd-c5a2-ee5c-7cf67b412209	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-55dd-c5a2-34af-439f91cd541d	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-55dd-c5a2-3f81-952989ccbcc1	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-55dd-c5a2-cbfa-92b38e85ade3	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-55dd-c5a2-f957-b1b2b225a4ed	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-55dd-c5a2-1009-685f2f9bf064	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-55dd-c5a2-0e98-cf0c6146fb84	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-55dd-c5a2-3868-1d139e1d04b1	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-55dd-c5a2-3059-a925048d6127	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-55dd-c5a2-4ec7-9b19e787625d	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-55dd-c5a2-ad01-82e152bc23ab	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 2956 (class 0 OID 15728414)
-- Dependencies: 224
-- Data for Name: enotaprograma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY enotaprograma (id, uprizoritev_id, program_dela_id, gostitelj_id, celotnavrednost, nasdelez, celotnavrednostmat, celotnavrednostgostovsz, zaproseno, lastnasredstva, avtorskihonorarji, avtorskihonorarjisamoz, tantieme, avtorskepravice, materialni, imakoprodukcije, vlozekgostitelja, drugijavni, stzaposlenih, stzaposumet, stzaposdrug, sthonorarnih, sthonorarnihigr, sthonorarnihigrtujjz, sthonorarnihigrsamoz, obiskdoma, obiskkopr, obiskgost, obiskzamejo, obiskint, obiskkoprint, ponovidoma, ponovikopr, ponovizamejo, ponovigost, ponovikoprint, ponoviint, naziv, kpe, sort, tipprogramskeenote_id, tip, strosekodkpred, stroskiostali, krajgostovanja, ustanova, datumgostovanja, transportnistroski, dnevprvzad, drzavagostovanja_id, stpe, zvrst, stpredstav, stokroglihmiz, stpredstavitev, stdelavnic, stdrugidogodki, stprodukcij, caspriprave, casizvedbe, prizorisca, umetvodja, programskotelo, sttujihselektorjev) FROM stdin;
002f0000-55dd-c5a3-6986-cfc0349f2673	000e0000-55dd-c5a3-adc3-1a44a8036f8f	\N	\N	9000.30	9000.30	9000.30	0.00	3600.12	5299.98	4000.40	1000.40	200.20	200.30	4599.40	\N	0.00	100.20	0	2	2	2	2	2	\N	40	0	0	0	0	0	1	0	0	0	0	0		0.00	\N	002b0000-55dd-c5a2-e9cd-8a0fcdfd6fb8	premiera	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-55dd-c5a3-d398-6abed338f431	000e0000-55dd-c5a3-144a-2db7fff03210	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	\N	60	0	0	0	0	0	1	0	0	0	0	0		0.00	\N	002b0000-55dd-c5a2-aaa4-d11772435849	premiera	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-55dd-c5a3-464f-15eccc0f7edb	000e0000-55dd-c5a3-3192-21452a882e62	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	\N	60	0	0	0	0	0	1	0	0	0	0	0		0.00	\N	002b0000-55dd-c5a2-e9cd-8a0fcdfd6fb8	premiera	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-55dd-c5a4-9429-58e4115f6334	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-54.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	54.20	5	0	0	3	0	0	\N	22	0	0	0	0	0	0	0	0	0	0	0	Urejanje portala	0.00	10	\N	razno	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-55dd-c5a4-d44f-75dcc77df271	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-31.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	31.20	5	0	0	3	0	0	\N	202	0	0	0	0	0	0	0	0	0	0	0	Delavnice otroci	0.00	8	\N	razno	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 2942 (class 0 OID 15728231)
-- Dependencies: 210
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, podrocje, vodjaekipe, naziv, komentar, velikost, pomembna, sort, seplanira, dovoliprekrivanje, maxprekrivanj, tipfunkcije_id) FROM stdin;
000d0000-55dd-c5a3-73e1-15a5823a40f1	000e0000-55dd-c5a3-144a-2db7fff03210	\N	igralec	\N	Hipolita	glavna vloga	velika	t	6	t	t	\N	000f0000-55dd-c5a2-fc50-e4e1ef1ec965
000d0000-55dd-c5a3-b5ed-c67b7143032f	000e0000-55dd-c5a3-144a-2db7fff03210	\N	igralec	\N	Tezej	glavna vloga	velika	t	5	t	t	\N	000f0000-55dd-c5a2-fc50-e4e1ef1ec965
000d0000-55dd-c5a3-ccc7-7e7e4ee1d782	000e0000-55dd-c5a3-144a-2db7fff03210	\N	umetnik	\N	Režija		velika	t	8	t	t	\N	000f0000-55dd-c5a2-0bab-f50c9afbe446
000d0000-55dd-c5a3-aa58-2f35b67e2a03	000e0000-55dd-c5a3-144a-2db7fff03210	\N	inspicient	t	Inšpicient			t	8	t	t	\N	000f0000-55dd-c5a2-e1aa-ad14f2aca41e
000d0000-55dd-c5a3-d48d-8f92119b220b	000e0000-55dd-c5a3-144a-2db7fff03210	\N	tehnik	t	Tehnični vodja			t	8	t	t	\N	000f0000-55dd-c5a2-64e2-626b008191a1
000d0000-55dd-c5a3-bb8b-383133e3edb7	000e0000-55dd-c5a3-144a-2db7fff03210	\N	tehnik	\N	Razsvetljava			t	3	t	t	\N	000f0000-55dd-c5a2-64e2-626b008191a1
000d0000-55dd-c5a3-ecfd-ce40a91ec51f	000e0000-55dd-c5a3-144a-2db7fff03210	\N	igralec	\N	Helena	glavna vloga	velika	t	5	t	t	\N	000f0000-55dd-c5a2-fc50-e4e1ef1ec965
000d0000-55dd-c5a3-98a1-e8e2522aa059	000e0000-55dd-c5a3-144a-2db7fff03210	\N	umetnik	\N	Lektoriranje			t	22	t	t	\N	000f0000-55dd-c5a2-9300-9eb721d99e7f
\.


--
-- TOC entry 2921 (class 0 OID 15728045)
-- Dependencies: 189
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta, zamejstvo, kraj) FROM stdin;
\.


--
-- TOC entry 2925 (class 0 OID 15728093)
-- Dependencies: 193
-- Data for Name: gostujoca; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostujoca (id, uprizoritev_id) FROM stdin;
\.


--
-- TOC entry 2919 (class 0 OID 15728025)
-- Dependencies: 187
-- Data for Name: kontaktnaoseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kontaktnaoseba (id, popa_id, oseba_id, status, funkcija, opis) FROM stdin;
00260000-55dd-c5a3-ea8c-4662a9e325f3	00080000-55dd-c5a3-0591-434262187c09	00090000-55dd-c5a3-b297-3e5b71129a04	AK		
\.


--
-- TOC entry 2931 (class 0 OID 15728146)
-- Dependencies: 199
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 2969 (class 0 OID 15728631)
-- Dependencies: 237
-- Data for Name: mapa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa (id, lastnik_id, parent_id, ime, komentar, caskreiranja, casspremembe, javnidostop, upor, datknj) FROM stdin;
\.


--
-- TOC entry 2970 (class 0 OID 15728643)
-- Dependencies: 238
-- Data for Name: mapa_zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa_zapis (mapa_id, zapis_id) FROM stdin;
\.


--
-- TOC entry 2972 (class 0 OID 15728665)
-- Dependencies: 240
-- Data for Name: mapaacl; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapaacl (id, mapa_id, perm_id, dostop, upor, datknj) FROM stdin;
\.


--
-- TOC entry 2935 (class 0 OID 15728171)
-- Dependencies: 203
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 2916 (class 0 OID 15727982)
-- Dependencies: 184
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-55dd-c5a2-26c4-fe7329a4ad3e	popa.stakli	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-55dd-c5a2-a7d7-28f0e2bb7546	oseba.spol	array	a:2:{s:1:"M";a:1:{s:5:"label";s:6:"Moški";}s:1:"Z";a:1:{s:5:"label";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-55dd-c5a2-9dfc-99a3230148ff	telefonska.vrsta	array	a:3:{s:7:"mobilna";a:1:{s:5:"label";s:7:"Mobilni";}s:6:"domaca";a:1:{s:5:"label";s:6:"Domač";}s:6:"fiksna";a:1:{s:5:"label";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-55dd-c5a2-1dbf-614ff00a702b	kontaktnaoseba.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status kontaktne osebe
00000000-55dd-c5a2-1f91-e1430ab1ea0f	dogodek.status	array	a:2:{s:7:"osnutek";a:1:{s:5:"label";s:11:"Dolgoročno";}s:8:"planiran";a:1:{s:5:"label";s:8:"Planiran";}}	f	f	t	\N	Tabela statusa dogodkov
00000000-55dd-c5a2-7e6e-b12e1ca3ff6d	uprizoritev.faza	array	a:6:{s:20:"predprodukcija-ideja";a:1:{s:5:"label";s:16:"Dolgoročni plan";}s:20:"predprodukcija-poziv";a:1:{s:5:"label";s:29:"Predprodukcija, v fazi poziva";}s:30:"predprodukcija-potrjen_program";a:1:{s:5:"label";s:34:"Predprodukcija, program je potrjen";}s:10:"produkcija";a:1:{s:5:"label";s:10:"Produkcija";}s:14:"postprodukcija";a:1:{s:5:"label";s:14:"Postprodukcija";}s:5:"arhiv";a:1:{s:5:"label";s:10:"Arhivirana";}}	f	t	f	\N	Faza uprizoritve
00000000-55dd-c5a2-febc-f8f8ebddd716	funkcija.podrocje	array	a:4:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}}	f	t	f	\N	Področje funkcije
00000000-55dd-c5a2-4883-537af45b1148	tipfunkcije.podrocje	array	a:3:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}}	f	t	f	\N	Področje funkcije
00000000-55dd-c5a2-f299-54a472c37710	funkcija.velikost	array	a:4:{s:7:"stataza";a:1:{s:5:"label";s:8:"Stataža";}s:4:"mala";a:1:{s:5:"label";s:21:"Mala vloga / funkcija";}s:7:"srednja";a:1:{s:5:"label";s:24:"Srednja vloga / funkcija";}s:6:"velika";a:1:{s:5:"label";s:23:"Velika vloga / funkcija";}}	f	t	f	\N	Velikost funkcije
00000000-55dd-c5a2-0885-2fa5e7fdbeb8	zaposlitev.status	array	a:2:{s:1:"A";a:1:{s:5:"label";s:7:"Aktivna";}s:1:"N";a:1:{s:5:"label";s:9:"Neaktivna";}}	f	t	f	\N	Status zaposlitve
00000000-55dd-c5a2-5305-01d25a780305	produkcijskahisa.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktivna";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktivna";}}	f	t	f	\N	Status produkcijske hiše
00000000-55dd-c5a2-b487-e8ae1a9540f3	strosekuprizoritve.tipstroska	array	a:2:{s:10:"materialni";a:1:{s:5:"label";s:19:"Materialni strošek";}s:9:"avtorprav";a:1:{s:5:"label";s:32:"Strošek odkupa avtorskih pravic";}}	f	t	f	\N	Tip stroška
00000000-55dd-c5a2-175f-1d1c0f10cdcf	fsacl.dostop	array	a:4:{s:1:"X";a:1:{s:5:"label";s:12:"Brez dostopa";}s:1:"R";a:1:{s:5:"label";s:11:"Samo branje";}s:2:"RW";a:1:{s:5:"label";s:17:"Branje in pisanje";}s:3:"RWD";a:1:{s:5:"label";s:26:"Branje pisanje in brisanje";}}	f	t	f	\N	ACL Javni dostop
00000000-55dd-c5a3-7412-1f065bcee3b5	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-55dd-c5a3-fa3a-9ba7e55f83c5	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-55dd-c5a3-c59d-6fe8a72ee98b	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-55dd-c5a3-b1e6-1ae4fb58e0e8	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-55dd-c5a3-52e5-15f71855108c	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
00000000-55dd-c5a4-da32-0649bec6ace5	application.tenant.maticnopodjetje	string	s:4:"1001";	f	t	f		Šifra matičnega podjetja v Popa in ProdukcijskaHisa
\.


--
-- TOC entry 2910 (class 0 OID 15727896)
-- Dependencies: 178
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-55dd-c5a3-cc37-160fb040698a	00000000-55dd-c5a3-7412-1f065bcee3b5	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-55dd-c5a3-826d-2305578f8cbe	00000000-55dd-c5a3-7412-1f065bcee3b5	00010000-55dd-c5a2-3d7b-ed3b48aaf5e0	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-55dd-c5a3-b32c-fd411716f494	00000000-55dd-c5a3-fa3a-9ba7e55f83c5	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 2911 (class 0 OID 15727907)
-- Dependencies: 179
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naslov_id, sifra, naziv, ime, priimek, funkcija, srednjeime, polnoime, psevdonim, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
00090000-55dd-c5a3-9085-89b2965f1e41	\N	\N	0001	g.	Janez	Novak	a	Peter	Janez Peter Novak	Jani	jani.novak@xxx.xx	1958-01-06	0601958000000	123456789	M	Jani Janez	Slovenija	Slovenija	Ljubljana
00090000-55dd-c5a3-5325-f3599bded35d	00010000-55dd-c5a3-5e81-2080f8e23be9	\N	0002	dr.	Anton	Horvat	b		Anton  Horvat	Tona	anton.horvat@xxx.xx	1968-02-12	1202968111111	234567890	M		Slovenija	Slovenija	Maribor
00090000-55dd-c5a3-1424-f63eaa57a754	00010000-55dd-c5a3-da5e-b4d39f0fe340	\N	0003		Ivan	Kovačič	c		Ivan  Kovačič	Ivo	ivan.kovacic@xxx.xx	1975-03-26	2603976222222	345678901	M		Slovenija	Slovenija	Celje
00090000-55dd-c5a3-2ddb-a7f3c7631b3a	00010000-55dd-c5a3-9bee-d5fb4ccf3d97	\N	0004	prof.	Jožef	Krajnc	d		Jožef  Krajnc	Joža	jozef.krajnc@xxx.xx	1971-04-30	3004971333333	456789012	M		Slovenija	Slovenija	Kranj
00090000-55dd-c5a3-0334-f0f184e21f05	\N	\N	0005		Marko	Zupančič	e		Marko  Zupančič		marko.zupancic@xxx.xx	1984-05-07	0705984444444	567890123	M		Slovenija	Slovenija	Koper
00090000-55dd-c5a3-80a8-0a2276b8f05c	\N	\N	0006	ga.	Marija	Kovač	f		Marija  Kovač		marija.kovac@xxx.xx	1962-06-19	1906962444444	678901234	Z		Slovenija	Slovenija	Murska Sobota
00090000-55dd-c5a3-4b67-6ee987e9c0a7	\N	\N	0007	ga.	Ana	Potočnik	g		Ana  Potočnik		ana.potocnik@xxx.xx	1975-07-24	2407975555555	789012345	Z		Slovenija	Slovenija	Novo Mesto
00090000-55dd-c5a3-5e82-d2ca98f65e6e	\N	\N	0008	ga.	Maja	Mlakar	h		Maja  Mlakar		maja.mlakar@xxx.xx	1986-08-02	0208986666666	890123456	Z		Slovenija	Slovenija	Nova Gorica
00090000-55dd-c5a3-b297-3e5b71129a04	00010000-55dd-c5a3-be7c-9de19df692fc	\N	0009		Irena	Kos	i		Irena  Kos		irena.kos@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Ptuj
00090000-55dd-c5a3-41a5-99a18dd73c8c	\N	\N	0010		Mojca	Vidmar	J		Mojca  Vidmar		mojca.vidmar@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Idrija
00090000-55dd-c5a3-121b-f920f27d8e0e	\N	\N	0011		xx	write protected12345	a		xx  write protected12345		xx@xxx.xx	\N	\N	\N	Z		\N	\N	\N
00090000-55dd-c5a3-d8e7-3dcd51d7e62a	\N	\N	0012		Luka	Golob	luč	a	Luka a Golob		luka.golob@xxx.xx	\N	\N	\N	M		\N	\N	\N
00090000-55dd-c5a3-6be3-066f343dc568	00010000-55dd-c5a3-1e17-74fe167e2832	\N	0013		Tatjana	Božič	tajnica	a	Tatjana a Božič		tatjana.bozic@xxx.xx	\N	\N	\N	Z		\N	\N	\N
\.


--
-- TOC entry 2906 (class 0 OID 15727861)
-- Dependencies: 174
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-55dd-c5a2-9ebf-4c85fecc2f48	Aaa-read	Aaa (User,Role,Permission) - branje	f
00030000-55dd-c5a2-8c51-b86494f4ecf7	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	f
00030000-55dd-c5a2-c82a-3a5bb512e7b8	TerminStoritve-vse	TerminStoritve - spreminjanje vseh zapisov	f
00030000-55dd-c5a2-6e72-a8760ac8ff2f	Dogodek-readVse	Dogodek - branje vseh, ne glede na status dogodka	f
00030000-55dd-c5a2-da7d-0ff9930708a6	Oseba-vse	Oseba - vse - za testiranje assert	f
00030000-55dd-c5a2-c883-d2a9fea5dd8f	ProgramDela-lock	ProgramDela - zaklepanje	f
00030000-55dd-c5a2-470e-fc45b5a79008	ProgramDela-unlock	ProgramDela - odklepanje	f
00030000-55dd-c5a2-560c-edbb5038210e	Abonma-read	Abonma - branje	f
00030000-55dd-c5a2-d50f-d32a59a0b8bd	Abonma-write	Abonma - spreminjanje	f
00030000-55dd-c5a2-7378-03a770f363da	Alternacija-read	Alternacija - branje	f
00030000-55dd-c5a2-f910-af4345c2745f	Alternacija-write	Alternacija - spreminjanje	f
00030000-55dd-c5a2-a443-3868656f8bcf	Arhivalija-read	Arhivalija - branje	f
00030000-55dd-c5a2-17b6-70282154db75	Arhivalija-write	Arhivalija - spreminjanje	f
00030000-55dd-c5a2-d7a6-909d6d5dee75	Besedilo-read	Besedilo - branje	f
00030000-55dd-c5a2-957f-412923f27b3c	Besedilo-write	Besedilo - spreminjanje	f
00030000-55dd-c5a2-1b4b-5557a26af9ad	DogodekIzven-read	DogodekIzven - branje	f
00030000-55dd-c5a2-46b0-a9872127099a	DogodekIzven-write	DogodekIzven - spreminjanje	f
00030000-55dd-c5a2-c35e-fcf69c4b4692	Dogodek-read	Dogodek - branje	f
00030000-55dd-c5a2-5c41-7d7ac427f7f0	Dogodek-write	Dogodek - spreminjanje	f
00030000-55dd-c5a2-f323-4913c0714066	DrugiVir-read	DrugiVir - branje	f
00030000-55dd-c5a2-b366-2752aa7d6c8a	DrugiVir-write	DrugiVir - spreminjanje	f
00030000-55dd-c5a2-de10-9cab960fda6f	Drzava-read	Drzava - branje	f
00030000-55dd-c5a2-5b48-3c3e0213a9ed	Drzava-write	Drzava - spreminjanje	f
00030000-55dd-c5a2-635b-6e73e1cbdc2b	EnotaPrograma-read	EnotaPrograma - branje	f
00030000-55dd-c5a2-4d63-72712c35c68b	EnotaPrograma-write	EnotaPrograma - spreminjanje	f
00030000-55dd-c5a2-04eb-9b4bbf6f632d	Funkcija-read	Funkcija - branje	f
00030000-55dd-c5a2-bebe-8a6ddd149f8d	Funkcija-write	Funkcija - spreminjanje	f
00030000-55dd-c5a2-2957-7367d3725165	Gostovanje-read	Gostovanje - branje	f
00030000-55dd-c5a2-2738-c5061391d0a4	Gostovanje-write	Gostovanje - spreminjanje	f
00030000-55dd-c5a2-298d-3f9475a28569	Gostujoca-read	Gostujoca - branje	f
00030000-55dd-c5a2-6805-a7895f50ffe3	Gostujoca-write	Gostujoca - spreminjanje	f
00030000-55dd-c5a2-b30f-a2fabb5ff602	KontaktnaOseba-read	KontaktnaOseba - branje	f
00030000-55dd-c5a2-8c1c-b4a2e3dd26fb	KontaktnaOseba-write	KontaktnaOseba - spreminjanje	f
00030000-55dd-c5a2-fb00-9698a0604cb8	Kupec-read	Kupec - branje	f
00030000-55dd-c5a2-e02d-c5c48d1de35a	Kupec-write	Kupec - spreminjanje	f
00030000-55dd-c5a2-f900-46ca0c8f8223	NacinPlacina-read	NacinPlacina - branje	f
00030000-55dd-c5a2-1c16-73dd393307f3	NacinPlacina-write	NacinPlacina - spreminjanje	f
00030000-55dd-c5a2-b658-e1d6c6dab973	Option-read	Option - branje	f
00030000-55dd-c5a2-8d42-3aab1fd2a08c	Option-write	Option - spreminjanje	f
00030000-55dd-c5a2-5dc4-6bf9bc3d64e8	OptionValue-read	OptionValue - branje	f
00030000-55dd-c5a2-ff87-815d3b779c6c	OptionValue-write	OptionValue - spreminjanje	f
00030000-55dd-c5a2-ec39-2ab96587e439	Oseba-read	Oseba - branje	f
00030000-55dd-c5a2-7c76-0b461a85df6f	Oseba-write	Oseba - spreminjanje	f
00030000-55dd-c5a2-5383-e5a685f419e4	PlacilniInstrument-read	PlacilniInstrument - branje	f
00030000-55dd-c5a2-5f81-25637e53f6df	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	f
00030000-55dd-c5a2-0ff1-3a8dfa6ad989	PodrocjeSedenja-read	PodrocjeSedenja - branje	f
00030000-55dd-c5a2-a93c-66428b412504	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	f
00030000-55dd-c5a2-fba8-e7f9391c15b9	Pogodba-read	Pogodba - branje	f
00030000-55dd-c5a2-8228-431681e24f43	Pogodba-write	Pogodba - spreminjanje	f
00030000-55dd-c5a2-5250-ba70c0293394	Popa-read	Popa - branje	f
00030000-55dd-c5a2-93af-99d1d70a4383	Popa-write	Popa - spreminjanje	f
00030000-55dd-c5a2-6e26-82489b6e27ef	Posta-read	Posta - branje	f
00030000-55dd-c5a2-3f74-a9ba518671f0	Posta-write	Posta - spreminjanje	f
00030000-55dd-c5a2-d390-35a4ce123ef6	PostavkaRacuna-read	PostavkaRacuna - branje	f
00030000-55dd-c5a2-fac2-21e40dfc7f4e	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	f
00030000-55dd-c5a2-776d-cd6fb5003c9d	PostniNaslov-read	PostniNaslov - branje	f
00030000-55dd-c5a2-ae6e-255271a24d7c	PostniNaslov-write	PostniNaslov - spreminjanje	f
00030000-55dd-c5a2-2915-4e5d97d5d3f0	Predstava-read	Predstava - branje	f
00030000-55dd-c5a2-30c4-233e82b431b4	Predstava-write	Predstava - spreminjanje	f
00030000-55dd-c5a2-3944-25b6f48207aa	ProdajaPredstave-read	ProdajaPredstave - branje	f
00030000-55dd-c5a2-bd54-2ce94cc49261	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	f
00030000-55dd-c5a2-6088-8b7ca8bc5b4e	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	f
00030000-55dd-c5a2-8c1e-8d9b731be379	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	f
00030000-55dd-c5a2-1eac-3bbce45692ba	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	f
00030000-55dd-c5a2-7223-98c4ff317421	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	f
00030000-55dd-c5a2-1a7c-ce0f6be98131	ProgramDela-read	ProgramDela - branje	f
00030000-55dd-c5a2-056d-8fd286f5b236	ProgramDela-write	ProgramDela - spreminjanje	f
00030000-55dd-c5a2-6764-1b45eef2430e	ProgramFestival-read	ProgramFestival - branje	f
00030000-55dd-c5a2-08c5-f3b2a92dbbf3	ProgramFestival-write	ProgramFestival - spreminjanje	f
00030000-55dd-c5a2-c36d-92fc54b78507	ProgramGostovanje-read	ProgramGostovanje - branje	f
00030000-55dd-c5a2-bdea-5627c7774325	ProgramGostovanje-write	ProgramGostovanje - spreminjanje	f
00030000-55dd-c5a2-d5c4-88ee5f538eb9	ProgramGostujoca-read	ProgramGostujoca - branje	f
00030000-55dd-c5a2-2d77-bb1ce4dc879d	ProgramGostujoca-write	ProgramGostujoca - spreminjanje	f
00030000-55dd-c5a2-ef68-3105dd05fd0f	ProgramIzjemni-read	ProgramIzjemni - branje	f
00030000-55dd-c5a2-d0ba-c280df6db5b3	ProgramIzjemni-write	ProgramIzjemni - spreminjanje	f
00030000-55dd-c5a2-d1c8-212ed05daa5a	ProgramPonovitevPrejsnjih-read	ProgramPonovitevPrejsnjih - branje	f
00030000-55dd-c5a2-1ab8-91a8fcdb4501	ProgramPonovitevPrejsnjih-write	ProgramPonovitevPrejsnjih - spreminjanje	f
00030000-55dd-c5a2-b164-35e723e038c2	ProgramPonovitevPremiere-read	ProgramPonovitevPremiere - branje	f
00030000-55dd-c5a2-e4e9-f35d5ef33018	ProgramPonovitevPremiere-write	ProgramPonovitevPremiere - spreminjanje	f
00030000-55dd-c5a2-3c7b-d21d0441434d	ProgramPremiera-read	ProgramPremiera - branje	f
00030000-55dd-c5a2-86b6-1ec4450b444b	ProgramPremiera-write	ProgramPremiera - spreminjanje	f
00030000-55dd-c5a2-f083-4145f81c19c6	ProgramRazno-read	ProgramRazno - branje	f
00030000-55dd-c5a2-228e-047ea6ec6a89	ProgramRazno-write	ProgramRazno - spreminjanje	f
00030000-55dd-c5a2-03e9-c2ced091041d	ProgramskaEnotaSklopa-read	ProgramskaEnotaSklopa - branje	f
00030000-55dd-c5a2-791c-43411b77d37e	ProgramskaEnotaSklopa-write	ProgramskaEnotaSklopa - spreminjanje	f
00030000-55dd-c5a2-a37b-3010ea35e5f5	Prostor-read	Prostor - branje	f
00030000-55dd-c5a2-1c4b-c9640c68018a	Prostor-write	Prostor - spreminjanje	f
00030000-55dd-c5a2-635d-90cb4fed9887	Racun-read	Racun - branje	f
00030000-55dd-c5a2-ad85-30f7f9f83f8a	Racun-write	Racun - spreminjanje	f
00030000-55dd-c5a2-37ab-e9f7f499f598	RazpisanSedez-read	RazpisanSedez - branje	f
00030000-55dd-c5a2-7ab8-d6c855759314	RazpisanSedez-write	RazpisanSedez - spreminjanje	f
00030000-55dd-c5a2-5dea-3378db137392	Rekviziterstvo-read	Rekviziterstvo - branje	f
00030000-55dd-c5a2-8504-bd048c19ca52	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	f
00030000-55dd-c5a2-ccbf-301e06d1407a	Rekvizit-read	Rekvizit - branje	f
00030000-55dd-c5a2-7f51-7449b6d791c9	Rekvizit-write	Rekvizit - spreminjanje	f
00030000-55dd-c5a2-8ce1-2f3e986ae50d	Revizija-read	Revizija - branje	f
00030000-55dd-c5a2-f3c8-f4ba0000d55a	Revizija-write	Revizija - spreminjanje	f
00030000-55dd-c5a2-7046-fd4c937bb3d5	Rezervacija-read	Rezervacija - branje	f
00030000-55dd-c5a2-736b-230fbf21594e	Rezervacija-write	Rezervacija - spreminjanje	f
00030000-55dd-c5a2-a418-ed0207ef0d55	SedezniRed-read	SedezniRed - branje	f
00030000-55dd-c5a2-bf6c-269407f0e020	SedezniRed-write	SedezniRed - spreminjanje	f
00030000-55dd-c5a2-438a-21ed98b6e952	Sedez-read	Sedez - branje	f
00030000-55dd-c5a2-93bd-608579d2ee97	Sedez-write	Sedez - spreminjanje	f
00030000-55dd-c5a2-322d-deda6d4f2b2d	Sezona-read	Sezona - branje	f
00030000-55dd-c5a2-a1f7-93781e9e50b7	Sezona-write	Sezona - spreminjanje	f
00030000-55dd-c5a2-f52c-7f820005d28f	StevilcenjeKonfig-read	StevilcenjeKonfig - branje	f
00030000-55dd-c5a2-dc99-c1657eae23a0	StevilcenjeKonfig-write	StevilcenjeKonfig - spreminjanje	f
00030000-55dd-c5a2-740a-53421dbab13c	Stevilcenje-read	Stevilcenje - branje	f
00030000-55dd-c5a2-18ce-91eb824d0aab	Stevilcenje-write	Stevilcenje - spreminjanje	f
00030000-55dd-c5a2-0056-7d4167aba6c4	StevilcenjeStanje-read	StevilcenjeStanje - branje	f
00030000-55dd-c5a2-d742-82d8915d7a6a	StevilcenjeStanje-write	StevilcenjeStanje - spreminjanje	f
00030000-55dd-c5a2-8593-06d6cef71ea0	StrosekUprizoritve-read	StrosekUprizoritve - branje	f
00030000-55dd-c5a2-559f-53daa6205349	StrosekUprizoritve-write	StrosekUprizoritve - spreminjanje	f
00030000-55dd-c5a2-e97e-ef65ef4a1883	Telefonska-read	Telefonska - branje	f
00030000-55dd-c5a2-ea1b-bd8da0347a07	Telefonska-write	Telefonska - spreminjanje	f
00030000-55dd-c5a2-ba0e-5c8efa747c55	TerminStoritve-read	TerminStoritve - branje	f
00030000-55dd-c5a2-36ef-139d2e35e241	TerminStoritve-write	TerminStoritve - spreminjanje	f
00030000-55dd-c5a2-a752-682abbf1a988	TipFunkcije-read	TipFunkcije - branje	f
00030000-55dd-c5a2-67bc-1b6344d02676	TipFunkcije-write	TipFunkcije - spreminjanje	f
00030000-55dd-c5a2-ded9-5682a52575ff	TipProgramskeEnote-read	TipProgramskeEnote - branje	f
00030000-55dd-c5a2-8dd8-3c73006428b9	TipProgramskeEnote-write	TipProgramskeEnote - spreminjanje	f
00030000-55dd-c5a2-3348-0e07dce3f176	Trr-read	Trr - branje	f
00030000-55dd-c5a2-dbc7-e8351856f317	Trr-write	Trr - spreminjanje	f
00030000-55dd-c5a2-cbd5-52ee2b9ed82d	Uprizoritev-read	Uprizoritev - branje	f
00030000-55dd-c5a2-0cf6-d5a0c57c2ee9	Uprizoritev-write	Uprizoritev - spreminjanje	f
00030000-55dd-c5a2-71fd-171dbe06c7a3	Vaja-read	Vaja - branje	f
00030000-55dd-c5a2-b119-4ee81658a17d	Vaja-write	Vaja - spreminjanje	f
00030000-55dd-c5a2-f98e-decbd9c39e97	VrstaSedezev-read	VrstaSedezev - branje	f
00030000-55dd-c5a2-8153-4755e5ca33da	VrstaSedezev-write	VrstaSedezev - spreminjanje	f
00030000-55dd-c5a2-70d6-10afb0c6cdba	VrstaStroska-read	VrstaStroska - branje	f
00030000-55dd-c5a2-25d4-7d68798172d1	VrstaStroska-write	VrstaStroska - spreminjanje	f
00030000-55dd-c5a2-6367-2470f82e4725	Zaposlitev-read	Zaposlitev - branje	f
00030000-55dd-c5a2-826a-b0af47ecd4f5	Zaposlitev-write	Zaposlitev - spreminjanje	f
00030000-55dd-c5a2-4d1d-85c006994ef3	Zasedenost-read	Zasedenost - branje	f
00030000-55dd-c5a2-357e-722ccc460f38	Zasedenost-write	Zasedenost - spreminjanje	f
00030000-55dd-c5a2-769c-e682f8f99651	ZvrstSurs-read	ZvrstSurs - branje	f
00030000-55dd-c5a2-3c42-7f5c00d9735e	ZvrstSurs-write	ZvrstSurs - spreminjanje	f
00030000-55dd-c5a2-9882-69414343d5d1	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	f
00030000-55dd-c5a2-c674-e2abf908c8e3	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	f
00030000-55dd-c5a2-1753-55db5ac37462	Mapa-write	Mapa - osnovno dovoljenje za pisanje	f
00030000-55dd-c5a2-8548-4828aaab6d68	Mapa-read	Mapa - osnovno dovoljenje za branje	f
00030000-55dd-c5a2-8577-4cf7df16a2bd	MapaAcl-write	MapaAcl - dovoljenje za dostop pisanje ACL-jev mape	f
00030000-55dd-c5a2-c1d5-10239ec74d22	MapaAcl-read	MapaAcl - dovoljenje za dostop branje ACL-jev mape	f
00030000-55dd-c5a2-428b-3a9c03deb054	Zapis-write	Zapis - dovoljenje za pisanje zapisov	f
00030000-55dd-c5a2-d130-48bfd347d641	Zapis-read	Zapis - dovoljenje za pisanje zapisov	f
00030000-55dd-c5a2-668a-b81c50b94a99	ZapisLastnik-write	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	f
00030000-55dd-c5a2-7bfb-07aefb01ecad	ZapisLastnik-read	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	f
00030000-55dd-c5a2-61bf-8f0a85aff0ef	VrstaZapisa-write	Šifrant vrst zapisa - spreminjanje	f
00030000-55dd-c5a2-d385-f69e17b3431e	VrstaZapisa-read	Šifrant vrst zapisa - branje	f
00030000-55dd-c5a2-749b-7404a8728062	Datoteka-write	Datoteka - spreminjanje	f
00030000-55dd-c5a2-7f81-6f36634435de	Datoteka-read	Datoteke - branje	f
\.


--
-- TOC entry 2908 (class 0 OID 15727880)
-- Dependencies: 176
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-55dd-c5a2-950f-3fe4d5117c83	00030000-55dd-c5a2-8c51-b86494f4ecf7
00020000-55dd-c5a2-b6cd-5f7dd6e90be6	00030000-55dd-c5a2-de10-9cab960fda6f
00020000-55dd-c5a2-1741-3e40f2b61369	00030000-55dd-c5a2-560c-edbb5038210e
00020000-55dd-c5a2-1741-3e40f2b61369	00030000-55dd-c5a2-d50f-d32a59a0b8bd
00020000-55dd-c5a2-1741-3e40f2b61369	00030000-55dd-c5a2-7378-03a770f363da
00020000-55dd-c5a2-1741-3e40f2b61369	00030000-55dd-c5a2-f910-af4345c2745f
00020000-55dd-c5a2-1741-3e40f2b61369	00030000-55dd-c5a2-a443-3868656f8bcf
00020000-55dd-c5a2-1741-3e40f2b61369	00030000-55dd-c5a2-c35e-fcf69c4b4692
00020000-55dd-c5a2-1741-3e40f2b61369	00030000-55dd-c5a2-6e72-a8760ac8ff2f
00020000-55dd-c5a2-1741-3e40f2b61369	00030000-55dd-c5a2-5c41-7d7ac427f7f0
00020000-55dd-c5a2-1741-3e40f2b61369	00030000-55dd-c5a2-de10-9cab960fda6f
00020000-55dd-c5a2-1741-3e40f2b61369	00030000-55dd-c5a2-5b48-3c3e0213a9ed
00020000-55dd-c5a2-1741-3e40f2b61369	00030000-55dd-c5a2-04eb-9b4bbf6f632d
00020000-55dd-c5a2-1741-3e40f2b61369	00030000-55dd-c5a2-bebe-8a6ddd149f8d
00020000-55dd-c5a2-1741-3e40f2b61369	00030000-55dd-c5a2-2957-7367d3725165
00020000-55dd-c5a2-1741-3e40f2b61369	00030000-55dd-c5a2-2738-c5061391d0a4
00020000-55dd-c5a2-1741-3e40f2b61369	00030000-55dd-c5a2-298d-3f9475a28569
00020000-55dd-c5a2-1741-3e40f2b61369	00030000-55dd-c5a2-6805-a7895f50ffe3
00020000-55dd-c5a2-1741-3e40f2b61369	00030000-55dd-c5a2-b30f-a2fabb5ff602
00020000-55dd-c5a2-1741-3e40f2b61369	00030000-55dd-c5a2-8c1c-b4a2e3dd26fb
00020000-55dd-c5a2-1741-3e40f2b61369	00030000-55dd-c5a2-b658-e1d6c6dab973
00020000-55dd-c5a2-1741-3e40f2b61369	00030000-55dd-c5a2-5dc4-6bf9bc3d64e8
00020000-55dd-c5a2-1741-3e40f2b61369	00030000-55dd-c5a2-ec39-2ab96587e439
00020000-55dd-c5a2-1741-3e40f2b61369	00030000-55dd-c5a2-7c76-0b461a85df6f
00020000-55dd-c5a2-1741-3e40f2b61369	00030000-55dd-c5a2-5250-ba70c0293394
00020000-55dd-c5a2-1741-3e40f2b61369	00030000-55dd-c5a2-93af-99d1d70a4383
00020000-55dd-c5a2-1741-3e40f2b61369	00030000-55dd-c5a2-6e26-82489b6e27ef
00020000-55dd-c5a2-1741-3e40f2b61369	00030000-55dd-c5a2-3f74-a9ba518671f0
00020000-55dd-c5a2-1741-3e40f2b61369	00030000-55dd-c5a2-776d-cd6fb5003c9d
00020000-55dd-c5a2-1741-3e40f2b61369	00030000-55dd-c5a2-ae6e-255271a24d7c
00020000-55dd-c5a2-1741-3e40f2b61369	00030000-55dd-c5a2-2915-4e5d97d5d3f0
00020000-55dd-c5a2-1741-3e40f2b61369	00030000-55dd-c5a2-30c4-233e82b431b4
00020000-55dd-c5a2-1741-3e40f2b61369	00030000-55dd-c5a2-1eac-3bbce45692ba
00020000-55dd-c5a2-1741-3e40f2b61369	00030000-55dd-c5a2-7223-98c4ff317421
00020000-55dd-c5a2-1741-3e40f2b61369	00030000-55dd-c5a2-a37b-3010ea35e5f5
00020000-55dd-c5a2-1741-3e40f2b61369	00030000-55dd-c5a2-1c4b-c9640c68018a
00020000-55dd-c5a2-1741-3e40f2b61369	00030000-55dd-c5a2-5dea-3378db137392
00020000-55dd-c5a2-1741-3e40f2b61369	00030000-55dd-c5a2-8504-bd048c19ca52
00020000-55dd-c5a2-1741-3e40f2b61369	00030000-55dd-c5a2-ccbf-301e06d1407a
00020000-55dd-c5a2-1741-3e40f2b61369	00030000-55dd-c5a2-7f51-7449b6d791c9
00020000-55dd-c5a2-1741-3e40f2b61369	00030000-55dd-c5a2-322d-deda6d4f2b2d
00020000-55dd-c5a2-1741-3e40f2b61369	00030000-55dd-c5a2-a1f7-93781e9e50b7
00020000-55dd-c5a2-1741-3e40f2b61369	00030000-55dd-c5a2-a752-682abbf1a988
00020000-55dd-c5a2-1741-3e40f2b61369	00030000-55dd-c5a2-cbd5-52ee2b9ed82d
00020000-55dd-c5a2-1741-3e40f2b61369	00030000-55dd-c5a2-0cf6-d5a0c57c2ee9
00020000-55dd-c5a2-1741-3e40f2b61369	00030000-55dd-c5a2-71fd-171dbe06c7a3
00020000-55dd-c5a2-1741-3e40f2b61369	00030000-55dd-c5a2-b119-4ee81658a17d
00020000-55dd-c5a2-1741-3e40f2b61369	00030000-55dd-c5a2-4d1d-85c006994ef3
00020000-55dd-c5a2-1741-3e40f2b61369	00030000-55dd-c5a2-357e-722ccc460f38
00020000-55dd-c5a2-1741-3e40f2b61369	00030000-55dd-c5a2-769c-e682f8f99651
00020000-55dd-c5a2-1741-3e40f2b61369	00030000-55dd-c5a2-9882-69414343d5d1
00020000-55dd-c5a2-5036-8a9cf864b3df	00030000-55dd-c5a2-560c-edbb5038210e
00020000-55dd-c5a2-5036-8a9cf864b3df	00030000-55dd-c5a2-a443-3868656f8bcf
00020000-55dd-c5a2-5036-8a9cf864b3df	00030000-55dd-c5a2-c35e-fcf69c4b4692
00020000-55dd-c5a2-5036-8a9cf864b3df	00030000-55dd-c5a2-de10-9cab960fda6f
00020000-55dd-c5a2-5036-8a9cf864b3df	00030000-55dd-c5a2-2957-7367d3725165
00020000-55dd-c5a2-5036-8a9cf864b3df	00030000-55dd-c5a2-298d-3f9475a28569
00020000-55dd-c5a2-5036-8a9cf864b3df	00030000-55dd-c5a2-b30f-a2fabb5ff602
00020000-55dd-c5a2-5036-8a9cf864b3df	00030000-55dd-c5a2-8c1c-b4a2e3dd26fb
00020000-55dd-c5a2-5036-8a9cf864b3df	00030000-55dd-c5a2-b658-e1d6c6dab973
00020000-55dd-c5a2-5036-8a9cf864b3df	00030000-55dd-c5a2-5dc4-6bf9bc3d64e8
00020000-55dd-c5a2-5036-8a9cf864b3df	00030000-55dd-c5a2-ec39-2ab96587e439
00020000-55dd-c5a2-5036-8a9cf864b3df	00030000-55dd-c5a2-7c76-0b461a85df6f
00020000-55dd-c5a2-5036-8a9cf864b3df	00030000-55dd-c5a2-5250-ba70c0293394
00020000-55dd-c5a2-5036-8a9cf864b3df	00030000-55dd-c5a2-6e26-82489b6e27ef
00020000-55dd-c5a2-5036-8a9cf864b3df	00030000-55dd-c5a2-776d-cd6fb5003c9d
00020000-55dd-c5a2-5036-8a9cf864b3df	00030000-55dd-c5a2-ae6e-255271a24d7c
00020000-55dd-c5a2-5036-8a9cf864b3df	00030000-55dd-c5a2-2915-4e5d97d5d3f0
00020000-55dd-c5a2-5036-8a9cf864b3df	00030000-55dd-c5a2-a37b-3010ea35e5f5
00020000-55dd-c5a2-5036-8a9cf864b3df	00030000-55dd-c5a2-5dea-3378db137392
00020000-55dd-c5a2-5036-8a9cf864b3df	00030000-55dd-c5a2-ccbf-301e06d1407a
00020000-55dd-c5a2-5036-8a9cf864b3df	00030000-55dd-c5a2-322d-deda6d4f2b2d
00020000-55dd-c5a2-5036-8a9cf864b3df	00030000-55dd-c5a2-e97e-ef65ef4a1883
00020000-55dd-c5a2-5036-8a9cf864b3df	00030000-55dd-c5a2-ea1b-bd8da0347a07
00020000-55dd-c5a2-5036-8a9cf864b3df	00030000-55dd-c5a2-3348-0e07dce3f176
00020000-55dd-c5a2-5036-8a9cf864b3df	00030000-55dd-c5a2-dbc7-e8351856f317
00020000-55dd-c5a2-5036-8a9cf864b3df	00030000-55dd-c5a2-6367-2470f82e4725
00020000-55dd-c5a2-5036-8a9cf864b3df	00030000-55dd-c5a2-826a-b0af47ecd4f5
00020000-55dd-c5a2-5036-8a9cf864b3df	00030000-55dd-c5a2-769c-e682f8f99651
00020000-55dd-c5a2-5036-8a9cf864b3df	00030000-55dd-c5a2-9882-69414343d5d1
00020000-55dd-c5a2-7b46-ded0de3d260b	00030000-55dd-c5a2-560c-edbb5038210e
00020000-55dd-c5a2-7b46-ded0de3d260b	00030000-55dd-c5a2-7378-03a770f363da
00020000-55dd-c5a2-7b46-ded0de3d260b	00030000-55dd-c5a2-a443-3868656f8bcf
00020000-55dd-c5a2-7b46-ded0de3d260b	00030000-55dd-c5a2-17b6-70282154db75
00020000-55dd-c5a2-7b46-ded0de3d260b	00030000-55dd-c5a2-d7a6-909d6d5dee75
00020000-55dd-c5a2-7b46-ded0de3d260b	00030000-55dd-c5a2-1b4b-5557a26af9ad
00020000-55dd-c5a2-7b46-ded0de3d260b	00030000-55dd-c5a2-c35e-fcf69c4b4692
00020000-55dd-c5a2-7b46-ded0de3d260b	00030000-55dd-c5a2-de10-9cab960fda6f
00020000-55dd-c5a2-7b46-ded0de3d260b	00030000-55dd-c5a2-04eb-9b4bbf6f632d
00020000-55dd-c5a2-7b46-ded0de3d260b	00030000-55dd-c5a2-2957-7367d3725165
00020000-55dd-c5a2-7b46-ded0de3d260b	00030000-55dd-c5a2-298d-3f9475a28569
00020000-55dd-c5a2-7b46-ded0de3d260b	00030000-55dd-c5a2-b30f-a2fabb5ff602
00020000-55dd-c5a2-7b46-ded0de3d260b	00030000-55dd-c5a2-b658-e1d6c6dab973
00020000-55dd-c5a2-7b46-ded0de3d260b	00030000-55dd-c5a2-5dc4-6bf9bc3d64e8
00020000-55dd-c5a2-7b46-ded0de3d260b	00030000-55dd-c5a2-ec39-2ab96587e439
00020000-55dd-c5a2-7b46-ded0de3d260b	00030000-55dd-c5a2-5250-ba70c0293394
00020000-55dd-c5a2-7b46-ded0de3d260b	00030000-55dd-c5a2-6e26-82489b6e27ef
00020000-55dd-c5a2-7b46-ded0de3d260b	00030000-55dd-c5a2-2915-4e5d97d5d3f0
00020000-55dd-c5a2-7b46-ded0de3d260b	00030000-55dd-c5a2-1eac-3bbce45692ba
00020000-55dd-c5a2-7b46-ded0de3d260b	00030000-55dd-c5a2-a37b-3010ea35e5f5
00020000-55dd-c5a2-7b46-ded0de3d260b	00030000-55dd-c5a2-5dea-3378db137392
00020000-55dd-c5a2-7b46-ded0de3d260b	00030000-55dd-c5a2-ccbf-301e06d1407a
00020000-55dd-c5a2-7b46-ded0de3d260b	00030000-55dd-c5a2-322d-deda6d4f2b2d
00020000-55dd-c5a2-7b46-ded0de3d260b	00030000-55dd-c5a2-a752-682abbf1a988
00020000-55dd-c5a2-7b46-ded0de3d260b	00030000-55dd-c5a2-71fd-171dbe06c7a3
00020000-55dd-c5a2-7b46-ded0de3d260b	00030000-55dd-c5a2-4d1d-85c006994ef3
00020000-55dd-c5a2-7b46-ded0de3d260b	00030000-55dd-c5a2-769c-e682f8f99651
00020000-55dd-c5a2-7b46-ded0de3d260b	00030000-55dd-c5a2-9882-69414343d5d1
00020000-55dd-c5a2-476e-885ee615dc1b	00030000-55dd-c5a2-560c-edbb5038210e
00020000-55dd-c5a2-476e-885ee615dc1b	00030000-55dd-c5a2-d50f-d32a59a0b8bd
00020000-55dd-c5a2-476e-885ee615dc1b	00030000-55dd-c5a2-f910-af4345c2745f
00020000-55dd-c5a2-476e-885ee615dc1b	00030000-55dd-c5a2-a443-3868656f8bcf
00020000-55dd-c5a2-476e-885ee615dc1b	00030000-55dd-c5a2-c35e-fcf69c4b4692
00020000-55dd-c5a2-476e-885ee615dc1b	00030000-55dd-c5a2-de10-9cab960fda6f
00020000-55dd-c5a2-476e-885ee615dc1b	00030000-55dd-c5a2-2957-7367d3725165
00020000-55dd-c5a2-476e-885ee615dc1b	00030000-55dd-c5a2-298d-3f9475a28569
00020000-55dd-c5a2-476e-885ee615dc1b	00030000-55dd-c5a2-b658-e1d6c6dab973
00020000-55dd-c5a2-476e-885ee615dc1b	00030000-55dd-c5a2-5dc4-6bf9bc3d64e8
00020000-55dd-c5a2-476e-885ee615dc1b	00030000-55dd-c5a2-5250-ba70c0293394
00020000-55dd-c5a2-476e-885ee615dc1b	00030000-55dd-c5a2-6e26-82489b6e27ef
00020000-55dd-c5a2-476e-885ee615dc1b	00030000-55dd-c5a2-2915-4e5d97d5d3f0
00020000-55dd-c5a2-476e-885ee615dc1b	00030000-55dd-c5a2-a37b-3010ea35e5f5
00020000-55dd-c5a2-476e-885ee615dc1b	00030000-55dd-c5a2-5dea-3378db137392
00020000-55dd-c5a2-476e-885ee615dc1b	00030000-55dd-c5a2-ccbf-301e06d1407a
00020000-55dd-c5a2-476e-885ee615dc1b	00030000-55dd-c5a2-322d-deda6d4f2b2d
00020000-55dd-c5a2-476e-885ee615dc1b	00030000-55dd-c5a2-a752-682abbf1a988
00020000-55dd-c5a2-476e-885ee615dc1b	00030000-55dd-c5a2-769c-e682f8f99651
00020000-55dd-c5a2-476e-885ee615dc1b	00030000-55dd-c5a2-9882-69414343d5d1
00020000-55dd-c5a2-e42f-7f1c62598abf	00030000-55dd-c5a2-560c-edbb5038210e
00020000-55dd-c5a2-e42f-7f1c62598abf	00030000-55dd-c5a2-a443-3868656f8bcf
00020000-55dd-c5a2-e42f-7f1c62598abf	00030000-55dd-c5a2-c35e-fcf69c4b4692
00020000-55dd-c5a2-e42f-7f1c62598abf	00030000-55dd-c5a2-de10-9cab960fda6f
00020000-55dd-c5a2-e42f-7f1c62598abf	00030000-55dd-c5a2-2957-7367d3725165
00020000-55dd-c5a2-e42f-7f1c62598abf	00030000-55dd-c5a2-298d-3f9475a28569
00020000-55dd-c5a2-e42f-7f1c62598abf	00030000-55dd-c5a2-b658-e1d6c6dab973
00020000-55dd-c5a2-e42f-7f1c62598abf	00030000-55dd-c5a2-5dc4-6bf9bc3d64e8
00020000-55dd-c5a2-e42f-7f1c62598abf	00030000-55dd-c5a2-5250-ba70c0293394
00020000-55dd-c5a2-e42f-7f1c62598abf	00030000-55dd-c5a2-6e26-82489b6e27ef
00020000-55dd-c5a2-e42f-7f1c62598abf	00030000-55dd-c5a2-2915-4e5d97d5d3f0
00020000-55dd-c5a2-e42f-7f1c62598abf	00030000-55dd-c5a2-a37b-3010ea35e5f5
00020000-55dd-c5a2-e42f-7f1c62598abf	00030000-55dd-c5a2-5dea-3378db137392
00020000-55dd-c5a2-e42f-7f1c62598abf	00030000-55dd-c5a2-ccbf-301e06d1407a
00020000-55dd-c5a2-e42f-7f1c62598abf	00030000-55dd-c5a2-322d-deda6d4f2b2d
00020000-55dd-c5a2-e42f-7f1c62598abf	00030000-55dd-c5a2-ba0e-5c8efa747c55
00020000-55dd-c5a2-e42f-7f1c62598abf	00030000-55dd-c5a2-c82a-3a5bb512e7b8
00020000-55dd-c5a2-e42f-7f1c62598abf	00030000-55dd-c5a2-a752-682abbf1a988
00020000-55dd-c5a2-e42f-7f1c62598abf	00030000-55dd-c5a2-769c-e682f8f99651
00020000-55dd-c5a2-e42f-7f1c62598abf	00030000-55dd-c5a2-9882-69414343d5d1
00020000-55dd-c5a3-1401-d24d6b27c805	00030000-55dd-c5a2-9ebf-4c85fecc2f48
00020000-55dd-c5a3-1401-d24d6b27c805	00030000-55dd-c5a2-8c51-b86494f4ecf7
00020000-55dd-c5a3-1401-d24d6b27c805	00030000-55dd-c5a2-c82a-3a5bb512e7b8
00020000-55dd-c5a3-1401-d24d6b27c805	00030000-55dd-c5a2-6e72-a8760ac8ff2f
00020000-55dd-c5a3-1401-d24d6b27c805	00030000-55dd-c5a2-da7d-0ff9930708a6
00020000-55dd-c5a3-1401-d24d6b27c805	00030000-55dd-c5a2-c883-d2a9fea5dd8f
00020000-55dd-c5a3-1401-d24d6b27c805	00030000-55dd-c5a2-470e-fc45b5a79008
00020000-55dd-c5a3-1401-d24d6b27c805	00030000-55dd-c5a2-560c-edbb5038210e
00020000-55dd-c5a3-1401-d24d6b27c805	00030000-55dd-c5a2-d50f-d32a59a0b8bd
00020000-55dd-c5a3-1401-d24d6b27c805	00030000-55dd-c5a2-7378-03a770f363da
00020000-55dd-c5a3-1401-d24d6b27c805	00030000-55dd-c5a2-f910-af4345c2745f
00020000-55dd-c5a3-1401-d24d6b27c805	00030000-55dd-c5a2-a443-3868656f8bcf
00020000-55dd-c5a3-1401-d24d6b27c805	00030000-55dd-c5a2-17b6-70282154db75
00020000-55dd-c5a3-1401-d24d6b27c805	00030000-55dd-c5a2-d7a6-909d6d5dee75
00020000-55dd-c5a3-1401-d24d6b27c805	00030000-55dd-c5a2-957f-412923f27b3c
00020000-55dd-c5a3-1401-d24d6b27c805	00030000-55dd-c5a2-1b4b-5557a26af9ad
00020000-55dd-c5a3-1401-d24d6b27c805	00030000-55dd-c5a2-46b0-a9872127099a
00020000-55dd-c5a3-1401-d24d6b27c805	00030000-55dd-c5a2-c35e-fcf69c4b4692
00020000-55dd-c5a3-1401-d24d6b27c805	00030000-55dd-c5a2-5c41-7d7ac427f7f0
00020000-55dd-c5a3-1401-d24d6b27c805	00030000-55dd-c5a2-de10-9cab960fda6f
00020000-55dd-c5a3-1401-d24d6b27c805	00030000-55dd-c5a2-5b48-3c3e0213a9ed
00020000-55dd-c5a3-1401-d24d6b27c805	00030000-55dd-c5a2-f323-4913c0714066
00020000-55dd-c5a3-1401-d24d6b27c805	00030000-55dd-c5a2-b366-2752aa7d6c8a
00020000-55dd-c5a3-1401-d24d6b27c805	00030000-55dd-c5a2-635b-6e73e1cbdc2b
00020000-55dd-c5a3-1401-d24d6b27c805	00030000-55dd-c5a2-4d63-72712c35c68b
00020000-55dd-c5a3-1401-d24d6b27c805	00030000-55dd-c5a2-04eb-9b4bbf6f632d
00020000-55dd-c5a3-1401-d24d6b27c805	00030000-55dd-c5a2-bebe-8a6ddd149f8d
00020000-55dd-c5a3-1401-d24d6b27c805	00030000-55dd-c5a2-2957-7367d3725165
00020000-55dd-c5a3-1401-d24d6b27c805	00030000-55dd-c5a2-2738-c5061391d0a4
00020000-55dd-c5a3-1401-d24d6b27c805	00030000-55dd-c5a2-298d-3f9475a28569
00020000-55dd-c5a3-1401-d24d6b27c805	00030000-55dd-c5a2-6805-a7895f50ffe3
00020000-55dd-c5a3-1401-d24d6b27c805	00030000-55dd-c5a2-b30f-a2fabb5ff602
00020000-55dd-c5a3-1401-d24d6b27c805	00030000-55dd-c5a2-8c1c-b4a2e3dd26fb
00020000-55dd-c5a3-1401-d24d6b27c805	00030000-55dd-c5a2-fb00-9698a0604cb8
00020000-55dd-c5a3-1401-d24d6b27c805	00030000-55dd-c5a2-e02d-c5c48d1de35a
00020000-55dd-c5a3-1401-d24d6b27c805	00030000-55dd-c5a2-f900-46ca0c8f8223
00020000-55dd-c5a3-1401-d24d6b27c805	00030000-55dd-c5a2-1c16-73dd393307f3
00020000-55dd-c5a3-1401-d24d6b27c805	00030000-55dd-c5a2-b658-e1d6c6dab973
00020000-55dd-c5a3-1401-d24d6b27c805	00030000-55dd-c5a2-8d42-3aab1fd2a08c
00020000-55dd-c5a3-1401-d24d6b27c805	00030000-55dd-c5a2-5dc4-6bf9bc3d64e8
00020000-55dd-c5a3-1401-d24d6b27c805	00030000-55dd-c5a2-ff87-815d3b779c6c
00020000-55dd-c5a3-1401-d24d6b27c805	00030000-55dd-c5a2-ec39-2ab96587e439
00020000-55dd-c5a3-1401-d24d6b27c805	00030000-55dd-c5a2-7c76-0b461a85df6f
00020000-55dd-c5a3-1401-d24d6b27c805	00030000-55dd-c5a2-5383-e5a685f419e4
00020000-55dd-c5a3-1401-d24d6b27c805	00030000-55dd-c5a2-5f81-25637e53f6df
00020000-55dd-c5a3-1401-d24d6b27c805	00030000-55dd-c5a2-0ff1-3a8dfa6ad989
00020000-55dd-c5a3-1401-d24d6b27c805	00030000-55dd-c5a2-a93c-66428b412504
00020000-55dd-c5a3-1401-d24d6b27c805	00030000-55dd-c5a2-fba8-e7f9391c15b9
00020000-55dd-c5a3-1401-d24d6b27c805	00030000-55dd-c5a2-8228-431681e24f43
00020000-55dd-c5a3-1401-d24d6b27c805	00030000-55dd-c5a2-5250-ba70c0293394
00020000-55dd-c5a3-1401-d24d6b27c805	00030000-55dd-c5a2-93af-99d1d70a4383
00020000-55dd-c5a3-1401-d24d6b27c805	00030000-55dd-c5a2-6e26-82489b6e27ef
00020000-55dd-c5a3-1401-d24d6b27c805	00030000-55dd-c5a2-3f74-a9ba518671f0
00020000-55dd-c5a3-1401-d24d6b27c805	00030000-55dd-c5a2-d390-35a4ce123ef6
00020000-55dd-c5a3-1401-d24d6b27c805	00030000-55dd-c5a2-fac2-21e40dfc7f4e
00020000-55dd-c5a3-1401-d24d6b27c805	00030000-55dd-c5a2-776d-cd6fb5003c9d
00020000-55dd-c5a3-1401-d24d6b27c805	00030000-55dd-c5a2-ae6e-255271a24d7c
00020000-55dd-c5a3-1401-d24d6b27c805	00030000-55dd-c5a2-2915-4e5d97d5d3f0
00020000-55dd-c5a3-1401-d24d6b27c805	00030000-55dd-c5a2-30c4-233e82b431b4
00020000-55dd-c5a3-1401-d24d6b27c805	00030000-55dd-c5a2-3944-25b6f48207aa
00020000-55dd-c5a3-1401-d24d6b27c805	00030000-55dd-c5a2-bd54-2ce94cc49261
00020000-55dd-c5a3-1401-d24d6b27c805	00030000-55dd-c5a2-6088-8b7ca8bc5b4e
00020000-55dd-c5a3-1401-d24d6b27c805	00030000-55dd-c5a2-8c1e-8d9b731be379
00020000-55dd-c5a3-1401-d24d6b27c805	00030000-55dd-c5a2-1eac-3bbce45692ba
00020000-55dd-c5a3-1401-d24d6b27c805	00030000-55dd-c5a2-7223-98c4ff317421
00020000-55dd-c5a3-1401-d24d6b27c805	00030000-55dd-c5a2-1a7c-ce0f6be98131
00020000-55dd-c5a3-1401-d24d6b27c805	00030000-55dd-c5a2-056d-8fd286f5b236
00020000-55dd-c5a3-1401-d24d6b27c805	00030000-55dd-c5a2-6764-1b45eef2430e
00020000-55dd-c5a3-1401-d24d6b27c805	00030000-55dd-c5a2-08c5-f3b2a92dbbf3
00020000-55dd-c5a3-1401-d24d6b27c805	00030000-55dd-c5a2-c36d-92fc54b78507
00020000-55dd-c5a3-1401-d24d6b27c805	00030000-55dd-c5a2-bdea-5627c7774325
00020000-55dd-c5a3-1401-d24d6b27c805	00030000-55dd-c5a2-d5c4-88ee5f538eb9
00020000-55dd-c5a3-1401-d24d6b27c805	00030000-55dd-c5a2-2d77-bb1ce4dc879d
00020000-55dd-c5a3-1401-d24d6b27c805	00030000-55dd-c5a2-ef68-3105dd05fd0f
00020000-55dd-c5a3-1401-d24d6b27c805	00030000-55dd-c5a2-d0ba-c280df6db5b3
00020000-55dd-c5a3-1401-d24d6b27c805	00030000-55dd-c5a2-d1c8-212ed05daa5a
00020000-55dd-c5a3-1401-d24d6b27c805	00030000-55dd-c5a2-1ab8-91a8fcdb4501
00020000-55dd-c5a3-1401-d24d6b27c805	00030000-55dd-c5a2-b164-35e723e038c2
00020000-55dd-c5a3-1401-d24d6b27c805	00030000-55dd-c5a2-e4e9-f35d5ef33018
00020000-55dd-c5a3-1401-d24d6b27c805	00030000-55dd-c5a2-3c7b-d21d0441434d
00020000-55dd-c5a3-1401-d24d6b27c805	00030000-55dd-c5a2-86b6-1ec4450b444b
00020000-55dd-c5a3-1401-d24d6b27c805	00030000-55dd-c5a2-f083-4145f81c19c6
00020000-55dd-c5a3-1401-d24d6b27c805	00030000-55dd-c5a2-228e-047ea6ec6a89
00020000-55dd-c5a3-1401-d24d6b27c805	00030000-55dd-c5a2-03e9-c2ced091041d
00020000-55dd-c5a3-1401-d24d6b27c805	00030000-55dd-c5a2-791c-43411b77d37e
00020000-55dd-c5a3-1401-d24d6b27c805	00030000-55dd-c5a2-a37b-3010ea35e5f5
00020000-55dd-c5a3-1401-d24d6b27c805	00030000-55dd-c5a2-1c4b-c9640c68018a
00020000-55dd-c5a3-1401-d24d6b27c805	00030000-55dd-c5a2-635d-90cb4fed9887
00020000-55dd-c5a3-1401-d24d6b27c805	00030000-55dd-c5a2-ad85-30f7f9f83f8a
00020000-55dd-c5a3-1401-d24d6b27c805	00030000-55dd-c5a2-37ab-e9f7f499f598
00020000-55dd-c5a3-1401-d24d6b27c805	00030000-55dd-c5a2-7ab8-d6c855759314
00020000-55dd-c5a3-1401-d24d6b27c805	00030000-55dd-c5a2-5dea-3378db137392
00020000-55dd-c5a3-1401-d24d6b27c805	00030000-55dd-c5a2-8504-bd048c19ca52
00020000-55dd-c5a3-1401-d24d6b27c805	00030000-55dd-c5a2-ccbf-301e06d1407a
00020000-55dd-c5a3-1401-d24d6b27c805	00030000-55dd-c5a2-7f51-7449b6d791c9
00020000-55dd-c5a3-1401-d24d6b27c805	00030000-55dd-c5a2-8ce1-2f3e986ae50d
00020000-55dd-c5a3-1401-d24d6b27c805	00030000-55dd-c5a2-f3c8-f4ba0000d55a
00020000-55dd-c5a3-1401-d24d6b27c805	00030000-55dd-c5a2-7046-fd4c937bb3d5
00020000-55dd-c5a3-1401-d24d6b27c805	00030000-55dd-c5a2-736b-230fbf21594e
00020000-55dd-c5a3-1401-d24d6b27c805	00030000-55dd-c5a2-a418-ed0207ef0d55
00020000-55dd-c5a3-1401-d24d6b27c805	00030000-55dd-c5a2-bf6c-269407f0e020
00020000-55dd-c5a3-1401-d24d6b27c805	00030000-55dd-c5a2-438a-21ed98b6e952
00020000-55dd-c5a3-1401-d24d6b27c805	00030000-55dd-c5a2-93bd-608579d2ee97
00020000-55dd-c5a3-1401-d24d6b27c805	00030000-55dd-c5a2-322d-deda6d4f2b2d
00020000-55dd-c5a3-1401-d24d6b27c805	00030000-55dd-c5a2-a1f7-93781e9e50b7
00020000-55dd-c5a3-1401-d24d6b27c805	00030000-55dd-c5a2-f52c-7f820005d28f
00020000-55dd-c5a3-1401-d24d6b27c805	00030000-55dd-c5a2-dc99-c1657eae23a0
00020000-55dd-c5a3-1401-d24d6b27c805	00030000-55dd-c5a2-740a-53421dbab13c
00020000-55dd-c5a3-1401-d24d6b27c805	00030000-55dd-c5a2-18ce-91eb824d0aab
00020000-55dd-c5a3-1401-d24d6b27c805	00030000-55dd-c5a2-0056-7d4167aba6c4
00020000-55dd-c5a3-1401-d24d6b27c805	00030000-55dd-c5a2-d742-82d8915d7a6a
00020000-55dd-c5a3-1401-d24d6b27c805	00030000-55dd-c5a2-8593-06d6cef71ea0
00020000-55dd-c5a3-1401-d24d6b27c805	00030000-55dd-c5a2-559f-53daa6205349
00020000-55dd-c5a3-1401-d24d6b27c805	00030000-55dd-c5a2-e97e-ef65ef4a1883
00020000-55dd-c5a3-1401-d24d6b27c805	00030000-55dd-c5a2-ea1b-bd8da0347a07
00020000-55dd-c5a3-1401-d24d6b27c805	00030000-55dd-c5a2-ba0e-5c8efa747c55
00020000-55dd-c5a3-1401-d24d6b27c805	00030000-55dd-c5a2-36ef-139d2e35e241
00020000-55dd-c5a3-1401-d24d6b27c805	00030000-55dd-c5a2-a752-682abbf1a988
00020000-55dd-c5a3-1401-d24d6b27c805	00030000-55dd-c5a2-67bc-1b6344d02676
00020000-55dd-c5a3-1401-d24d6b27c805	00030000-55dd-c5a2-ded9-5682a52575ff
00020000-55dd-c5a3-1401-d24d6b27c805	00030000-55dd-c5a2-8dd8-3c73006428b9
00020000-55dd-c5a3-1401-d24d6b27c805	00030000-55dd-c5a2-3348-0e07dce3f176
00020000-55dd-c5a3-1401-d24d6b27c805	00030000-55dd-c5a2-dbc7-e8351856f317
00020000-55dd-c5a3-1401-d24d6b27c805	00030000-55dd-c5a2-cbd5-52ee2b9ed82d
00020000-55dd-c5a3-1401-d24d6b27c805	00030000-55dd-c5a2-0cf6-d5a0c57c2ee9
00020000-55dd-c5a3-1401-d24d6b27c805	00030000-55dd-c5a2-71fd-171dbe06c7a3
00020000-55dd-c5a3-1401-d24d6b27c805	00030000-55dd-c5a2-b119-4ee81658a17d
00020000-55dd-c5a3-1401-d24d6b27c805	00030000-55dd-c5a2-f98e-decbd9c39e97
00020000-55dd-c5a3-1401-d24d6b27c805	00030000-55dd-c5a2-8153-4755e5ca33da
00020000-55dd-c5a3-1401-d24d6b27c805	00030000-55dd-c5a2-6367-2470f82e4725
00020000-55dd-c5a3-1401-d24d6b27c805	00030000-55dd-c5a2-826a-b0af47ecd4f5
00020000-55dd-c5a3-1401-d24d6b27c805	00030000-55dd-c5a2-4d1d-85c006994ef3
00020000-55dd-c5a3-1401-d24d6b27c805	00030000-55dd-c5a2-357e-722ccc460f38
00020000-55dd-c5a3-1401-d24d6b27c805	00030000-55dd-c5a2-769c-e682f8f99651
00020000-55dd-c5a3-1401-d24d6b27c805	00030000-55dd-c5a2-3c42-7f5c00d9735e
00020000-55dd-c5a3-1401-d24d6b27c805	00030000-55dd-c5a2-9882-69414343d5d1
00020000-55dd-c5a3-1401-d24d6b27c805	00030000-55dd-c5a2-c674-e2abf908c8e3
\.


--
-- TOC entry 2936 (class 0 OID 15728178)
-- Dependencies: 204
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 2940 (class 0 OID 15728211)
-- Dependencies: 208
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 2951 (class 0 OID 15728335)
-- Dependencies: 219
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, zacetek, konec, placilonavajo, vrednostvaje, planiranostevilovaj, vrednostvaj, vrednostpredstave, vrednostdopremiere, aktivna, zaposlenvdrjz, samozaposlen, igralec, opis) FROM stdin;
000b0000-55dd-c5a3-372d-e89d4c3b744e	00090000-55dd-c5a3-9085-89b2965f1e41	\N	\N	0001	\N	\N	f	10.00	3	10.00	30.00	10.00	t	t	f	t	Pogodba o sodelovanju
000b0000-55dd-c5a3-e6aa-7abbc3f1e7b9	00090000-55dd-c5a3-80a8-0a2276b8f05c	\N	\N	0002	\N	\N	t	11.00	10	11.00	31.00	110.00	t	f	t	t	Pogodba za vlogo Helena
000b0000-55dd-c5a3-ddb1-fcba8a2217a4	00090000-55dd-c5a3-6be3-066f343dc568	\N	\N	0003	\N	\N	f	12.00	4	12.00	32.00	12.00	t	f	t	f	Pogodba za lektoriranje
\.


--
-- TOC entry 2913 (class 0 OID 15727940)
-- Dependencies: 181
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, drzava_id, sifra, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo, nvo) FROM stdin;
00080000-55dd-c5a3-0591-434262187c09	00040000-55dd-c5a2-fc95-2d32b7ce352a	0988	AK	Juhuhu d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55dd-c5a3-665e-7e5b82a7239a	00040000-55dd-c5a2-fc95-2d32b7ce352a	0989	AK	Hopsasa d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	t
00080000-55dd-c5a3-c615-7e3a2f11b52c	00040000-55dd-c5a2-fc95-2d32b7ce352a	0987	AK	Gledališče Šrum d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55dd-c5a3-5ffb-cf291fd18b0b	00040000-55dd-c5a2-fc95-2d32b7ce352a	0986	AK	Lutkovni Direndaj d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55dd-c5a3-9807-19ded53f8f00	00040000-55dd-c5a2-fc95-2d32b7ce352a	0985	AK	Tatjana Stanič, Lektoriranje, s.p.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55dd-c5a3-9154-36d31d52254c	00040000-55dd-c5a2-6563-9f131e8f7a03	0984	AK	Gledališče Lepote tvoje		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55dd-c5a3-eeb5-06a838aa5d14	00040000-55dd-c5a2-3c20-b652725556b7	0983	AK	Sunce naše		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55dd-c5a3-eed9-3a5b79e5d640	00040000-55dd-c5a2-9b5a-57fc1cb8d89b	0982	AK	Theater Amadeus		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55dd-c5a4-966e-62caba54f195	00040000-55dd-c5a2-fc95-2d32b7ce352a	1001	AK	Gledališče Matica		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
\.


--
-- TOC entry 2915 (class 0 OID 15727974)
-- Dependencies: 183
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-55dd-c5a1-a5a4-2d4a479609ce	8341	Adlešiči
00050000-55dd-c5a1-8d77-7677f2ecf311	5270	Ajdovščina
00050000-55dd-c5a1-8ef9-4362243e9a61	6280	Ankaran/Ancarano
00050000-55dd-c5a1-503b-d391b5c36eba	9253	Apače
00050000-55dd-c5a1-9041-a6595c5c5f91	8253	Artiče
00050000-55dd-c5a1-dd0a-6c578e857375	4275	Begunje na Gorenjskem
00050000-55dd-c5a1-69bb-dc462da43b96	1382	Begunje pri Cerknici
00050000-55dd-c5a1-497b-422f058c1d73	9231	Beltinci
00050000-55dd-c5a1-5c38-5a55b36b87b0	2234	Benedikt
00050000-55dd-c5a1-b80d-cfad7e32cd7b	2345	Bistrica ob Dravi
00050000-55dd-c5a1-4390-538151c4c1b1	3256	Bistrica ob Sotli
00050000-55dd-c5a1-a83e-6f1d996df0d1	8259	Bizeljsko
00050000-55dd-c5a1-bca2-adedd07fc8ed	1223	Blagovica
00050000-55dd-c5a1-4caf-fd0b31da1679	8283	Blanca
00050000-55dd-c5a1-6171-aae635ccfd41	4260	Bled
00050000-55dd-c5a1-2ff0-8453af41092c	4273	Blejska Dobrava
00050000-55dd-c5a1-feb7-0ef7f47cbcdf	9265	Bodonci
00050000-55dd-c5a1-7c36-221bf404f9dc	9222	Bogojina
00050000-55dd-c5a1-a1e1-28c57ad8c2f8	4263	Bohinjska Bela
00050000-55dd-c5a1-2349-bf7eb03706dd	4264	Bohinjska Bistrica
00050000-55dd-c5a1-f6f5-5a6dd1ad3338	4265	Bohinjsko jezero
00050000-55dd-c5a1-bf8c-2d7cae0ddbcd	1353	Borovnica
00050000-55dd-c5a1-5537-3700b7fb2278	8294	Boštanj
00050000-55dd-c5a1-7a9b-947468ddaa08	5230	Bovec
00050000-55dd-c5a1-4319-6a143095fc20	5295	Branik
00050000-55dd-c5a1-17ea-a51004ba9a61	3314	Braslovče
00050000-55dd-c5a1-4d0e-5a89a387ae1a	5223	Breginj
00050000-55dd-c5a1-9abc-2bb3bcafafc3	8280	Brestanica
00050000-55dd-c5a1-c5d8-8665c29b0168	2354	Bresternica
00050000-55dd-c5a1-b2a1-527ec21f8d5c	4243	Brezje
00050000-55dd-c5a1-6cac-660ba29b3664	1351	Brezovica pri Ljubljani
00050000-55dd-c5a1-cb0c-7d6f58f2a3a5	8250	Brežice
00050000-55dd-c5a1-cd31-7d709bdc81fb	4210	Brnik - Aerodrom
00050000-55dd-c5a1-a51b-ea0464bb1cce	8321	Brusnice
00050000-55dd-c5a1-d675-3e7aea6aad46	3255	Buče
00050000-55dd-c5a1-5edf-b3a96177e38a	8276	Bučka 
00050000-55dd-c5a1-2456-bf211dee0625	9261	Cankova
00050000-55dd-c5a1-33a5-cea7d3d7fa32	3000	Celje 
00050000-55dd-c5a1-f099-eb02e14997f3	3001	Celje - poštni predali
00050000-55dd-c5a1-0890-e340fad80468	4207	Cerklje na Gorenjskem
00050000-55dd-c5a1-5c9e-e779228304f0	8263	Cerklje ob Krki
00050000-55dd-c5a1-f0ce-9caa01f7acc4	1380	Cerknica
00050000-55dd-c5a1-f913-48fbf673f1be	5282	Cerkno
00050000-55dd-c5a1-b346-fd3ad592fcfe	2236	Cerkvenjak
00050000-55dd-c5a1-3388-af11d4a7e2a3	2215	Ceršak
00050000-55dd-c5a1-6178-8092cf46c6f4	2326	Cirkovce
00050000-55dd-c5a1-c410-0b1320e13b9c	2282	Cirkulane
00050000-55dd-c5a1-e7ac-0a1261990ce6	5273	Col
00050000-55dd-c5a1-2c2f-63cedbb9e51b	8251	Čatež ob Savi
00050000-55dd-c5a1-985a-1459cb336ae5	1413	Čemšenik
00050000-55dd-c5a1-c77d-40cf17da1b32	5253	Čepovan
00050000-55dd-c5a1-d387-fcaedaecb62f	9232	Črenšovci
00050000-55dd-c5a1-0d8a-eae9f5cb0b29	2393	Črna na Koroškem
00050000-55dd-c5a1-f34c-d8f23019ee50	6275	Črni Kal
00050000-55dd-c5a1-8add-7cfec1069571	5274	Črni Vrh nad Idrijo
00050000-55dd-c5a1-a726-7c0d1eb9fa86	5262	Črniče
00050000-55dd-c5a1-d2b3-daae8f667ccb	8340	Črnomelj
00050000-55dd-c5a1-7560-5d42a1eca14a	6271	Dekani
00050000-55dd-c5a1-72fa-52ca1573ff30	5210	Deskle
00050000-55dd-c5a1-ba1e-9eb5f5525a13	2253	Destrnik
00050000-55dd-c5a1-0096-d45d71d276bd	6215	Divača
00050000-55dd-c5a1-d859-683eb4ec5f38	1233	Dob
00050000-55dd-c5a1-9577-1a0c96ff8aa3	3224	Dobje pri Planini
00050000-55dd-c5a1-2fa4-656e22f6b7ad	8257	Dobova
00050000-55dd-c5a1-ff0a-aedb8ebff0b4	1423	Dobovec
00050000-55dd-c5a1-466b-926eecc19ff7	5263	Dobravlje
00050000-55dd-c5a1-83db-31e048726b4d	3204	Dobrna
00050000-55dd-c5a1-905c-dc61455f74b7	8211	Dobrnič
00050000-55dd-c5a1-3008-9795f6b7e8df	1356	Dobrova
00050000-55dd-c5a1-5331-e1fa6e4d178b	9223	Dobrovnik/Dobronak 
00050000-55dd-c5a1-83fb-6810cd416a15	5212	Dobrovo v Brdih
00050000-55dd-c5a1-b36d-6af169450182	1431	Dol pri Hrastniku
00050000-55dd-c5a1-9ba8-f73f3b412b5b	1262	Dol pri Ljubljani
00050000-55dd-c5a1-6fdf-499711ebe142	1273	Dole pri Litiji
00050000-55dd-c5a1-a064-b516e0789738	1331	Dolenja vas
00050000-55dd-c5a1-613b-8cb3153c6578	8350	Dolenjske Toplice
00050000-55dd-c5a1-a816-116f82aac56b	1230	Domžale
00050000-55dd-c5a1-0ddb-261ccce410b0	2252	Dornava
00050000-55dd-c5a1-eaf9-ada53a9f512c	5294	Dornberk
00050000-55dd-c5a1-c9ad-a99f05b74dec	1319	Draga
00050000-55dd-c5a1-b0c9-7123659895f3	8343	Dragatuš
00050000-55dd-c5a1-80f5-fc4ac09e353f	3222	Dramlje
00050000-55dd-c5a1-685e-662fab9ab5b6	2370	Dravograd
00050000-55dd-c5a1-4cd7-b991fec11aec	4203	Duplje
00050000-55dd-c5a1-c1ac-1ee799dc1e23	6221	Dutovlje
00050000-55dd-c5a1-b4fd-f0949df711a2	8361	Dvor
00050000-55dd-c5a1-1aed-5e5594d36957	2343	Fala
00050000-55dd-c5a1-9eeb-2eb323a0dcb5	9208	Fokovci
00050000-55dd-c5a1-c06c-b42f076afed7	2313	Fram
00050000-55dd-c5a1-f769-e817b576c299	3213	Frankolovo
00050000-55dd-c5a1-b04d-a887716bfabb	1274	Gabrovka
00050000-55dd-c5a1-358b-05f5f81c1958	8254	Globoko
00050000-55dd-c5a1-bafe-71f4e990328b	5275	Godovič
00050000-55dd-c5a1-f2bc-7ca46521d110	4204	Golnik
00050000-55dd-c5a1-2465-b65afd5cf18a	3303	Gomilsko
00050000-55dd-c5a1-cc3a-f40593271d3e	4224	Gorenja vas
00050000-55dd-c5a1-fc91-07edc6ec1c12	3263	Gorica pri Slivnici
00050000-55dd-c5a1-ef09-78451193ab0f	2272	Gorišnica
00050000-55dd-c5a1-614b-350ddbbb2d5a	9250	Gornja Radgona
00050000-55dd-c5a1-167e-cf658b12b37f	3342	Gornji Grad
00050000-55dd-c5a1-0067-18b5004215eb	4282	Gozd Martuljek
00050000-55dd-c5a1-8921-c9181221149d	6272	Gračišče
00050000-55dd-c5a1-8b4e-79b5e806bf70	9264	Grad
00050000-55dd-c5a1-b463-1b420b8a32fa	8332	Gradac
00050000-55dd-c5a1-ac48-c9686fa504c0	1384	Grahovo
00050000-55dd-c5a1-4f52-b5a6e82fb330	5242	Grahovo ob Bači
00050000-55dd-c5a1-febd-61e2d3aefa08	5251	Grgar
00050000-55dd-c5a1-44f9-0c3f5e7c7cf7	3302	Griže
00050000-55dd-c5a1-a4cf-864e6121e78f	3231	Grobelno
00050000-55dd-c5a1-2ff7-4a10121b1e51	1290	Grosuplje
00050000-55dd-c5a1-9c95-67c9f08e0d6d	2288	Hajdina
00050000-55dd-c5a1-f8d6-ac9d88508c82	8362	Hinje
00050000-55dd-c5a1-72be-fef8056df845	2311	Hoče
00050000-55dd-c5a1-58a8-d577dec84302	9205	Hodoš/Hodos
00050000-55dd-c5a1-2734-eda8e9c41005	1354	Horjul
00050000-55dd-c5a1-27c5-422761cdc771	1372	Hotedršica
00050000-55dd-c5a1-e5ee-da19679c4d5c	1430	Hrastnik
00050000-55dd-c5a1-b9c7-0a78b09e961c	6225	Hruševje
00050000-55dd-c5a1-35e7-d600517500d4	4276	Hrušica
00050000-55dd-c5a1-267c-4b92908a356c	5280	Idrija
00050000-55dd-c5a1-8fac-2090e2915305	1292	Ig
00050000-55dd-c5a1-f10f-7289895e9d94	6250	Ilirska Bistrica
00050000-55dd-c5a1-897c-4aec8526a50a	6251	Ilirska Bistrica-Trnovo
00050000-55dd-c5a1-be18-a38b8193c3ad	1295	Ivančna Gorica
00050000-55dd-c5a1-4375-47a08b5e67c1	2259	Ivanjkovci
00050000-55dd-c5a1-6c56-900872a51b56	1411	Izlake
00050000-55dd-c5a1-0f9a-20cb353847bb	6310	Izola/Isola
00050000-55dd-c5a1-3cc6-a19ef136b62b	2222	Jakobski Dol
00050000-55dd-c5a1-dda4-037d7bd37398	2221	Jarenina
00050000-55dd-c5a1-24bd-10591d07cbe9	6254	Jelšane
00050000-55dd-c5a1-dc3c-cdb4ab62f9c8	4270	Jesenice
00050000-55dd-c5a1-c22e-47ddba6f696a	8261	Jesenice na Dolenjskem
00050000-55dd-c5a1-0ccb-84777de761a4	3273	Jurklošter
00050000-55dd-c5a1-f327-d4a350993d3b	2223	Jurovski Dol
00050000-55dd-c5a1-0d31-288449b4967e	2256	Juršinci
00050000-55dd-c5a1-7440-1136cf64179e	5214	Kal nad Kanalom
00050000-55dd-c5a1-c938-b82d09ae8b22	3233	Kalobje
00050000-55dd-c5a1-4a38-8b4ca5535419	4246	Kamna Gorica
00050000-55dd-c5a1-c669-0870e1175496	2351	Kamnica
00050000-55dd-c5a1-b2c7-fd7c82c8cf8d	1241	Kamnik
00050000-55dd-c5a1-456b-fe9e1f1fad41	5213	Kanal
00050000-55dd-c5a1-4c5c-64a1dec72868	8258	Kapele
00050000-55dd-c5a1-ea35-8ecee85fe260	2362	Kapla
00050000-55dd-c5a1-148c-53e53df7fd6d	2325	Kidričevo
00050000-55dd-c5a1-4be5-d7326420bcbb	1412	Kisovec
00050000-55dd-c5a1-8cce-8a5495ab56ed	6253	Knežak
00050000-55dd-c5a1-704d-3c6f2787d9ab	5222	Kobarid
00050000-55dd-c5a1-c615-47aa50b5f17a	9227	Kobilje
00050000-55dd-c5a1-c1f0-ad03bbd58b4a	1330	Kočevje
00050000-55dd-c5a1-d5db-0f8140fcb91e	1338	Kočevska Reka
00050000-55dd-c5a1-84ef-f9eea4098257	2276	Kog
00050000-55dd-c5a1-744d-82c6ecbf72a1	5211	Kojsko
00050000-55dd-c5a1-122d-ecc1dc4f4dac	6223	Komen
00050000-55dd-c5a1-eca4-738844317bb5	1218	Komenda
00050000-55dd-c5a1-5e67-91921260f94f	6000	Koper/Capodistria 
00050000-55dd-c5a1-2285-1949085b4841	6001	Koper/Capodistria - poštni predali
00050000-55dd-c5a1-a817-0f2574f970b2	8282	Koprivnica
00050000-55dd-c5a1-3f86-0621b750fab0	5296	Kostanjevica na Krasu
00050000-55dd-c5a1-8ad6-0843e8d370b5	8311	Kostanjevica na Krki
00050000-55dd-c5a1-c9ca-0393d6d1fd07	1336	Kostel
00050000-55dd-c5a1-f141-889d5ee7b17b	6256	Košana
00050000-55dd-c5a1-1246-1b34980d6308	2394	Kotlje
00050000-55dd-c5a1-aa06-84143c88b064	6240	Kozina
00050000-55dd-c5a1-94e4-1ac535469e16	3260	Kozje
00050000-55dd-c5a1-2963-eb4941f1f88d	4000	Kranj 
00050000-55dd-c5a1-f968-835b4f7f199d	4001	Kranj - poštni predali
00050000-55dd-c5a1-22f5-997c9d30443e	4280	Kranjska Gora
00050000-55dd-c5a1-ddd4-7c72ab6ebe8c	1281	Kresnice
00050000-55dd-c5a1-f10d-2fcd5ec022b4	4294	Križe
00050000-55dd-c5a1-a63b-5233b4df68dd	9206	Križevci
00050000-55dd-c5a1-0c82-436813215193	9242	Križevci pri Ljutomeru
00050000-55dd-c5a1-00b7-b06433beff62	1301	Krka
00050000-55dd-c5a1-05f4-d0a2d67d1fda	8296	Krmelj
00050000-55dd-c5a1-7c6f-3dcbfb0da6ab	4245	Kropa
00050000-55dd-c5a1-b36b-a62f88ea3776	8262	Krška vas
00050000-55dd-c5a1-73d2-c4a671e7ac95	8270	Krško
00050000-55dd-c5a1-49ea-f3f467eaf467	9263	Kuzma
00050000-55dd-c5a1-b4dc-27989b903ac3	2318	Laporje
00050000-55dd-c5a1-7e58-ea88086085b2	3270	Laško
00050000-55dd-c5a1-ea00-12ae50d0c21e	1219	Laze v Tuhinju
00050000-55dd-c5a1-f15e-e3debd03d102	2230	Lenart v Slovenskih goricah
00050000-55dd-c5a1-0c4e-13043d4d9853	9220	Lendava/Lendva
00050000-55dd-c5a1-521b-91f5eb15aca3	4248	Lesce
00050000-55dd-c5a1-92c6-92f547d16d34	3261	Lesično
00050000-55dd-c5a1-5a6c-2537e9909641	8273	Leskovec pri Krškem
00050000-55dd-c5a1-5c6a-96514be9067b	2372	Libeliče
00050000-55dd-c5a1-104e-004697527d90	2341	Limbuš
00050000-55dd-c5a1-9813-7f7b5f2d40e9	1270	Litija
00050000-55dd-c5a1-c4ed-a738fb3f0fba	3202	Ljubečna
00050000-55dd-c5a1-946d-2f8261a07a8b	1000	Ljubljana 
00050000-55dd-c5a1-c96e-bcdaf6967cad	1001	Ljubljana - poštni predali
00050000-55dd-c5a1-f45d-ff5bda13b56f	1231	Ljubljana - Črnuče
00050000-55dd-c5a1-4303-914bf59042cd	1261	Ljubljana - Dobrunje
00050000-55dd-c5a1-0c81-05d72df54c61	1260	Ljubljana - Polje
00050000-55dd-c5a1-ca93-9725c84ff81e	1210	Ljubljana - Šentvid
00050000-55dd-c5a1-7e2d-55483c63eac7	1211	Ljubljana - Šmartno
00050000-55dd-c5a1-f825-6e116a4468c0	3333	Ljubno ob Savinji
00050000-55dd-c5a1-b835-8e950c039b2a	9240	Ljutomer
00050000-55dd-c5a1-4e24-9444f10b994e	3215	Loče
00050000-55dd-c5a1-2e04-b624ba61ab29	5231	Log pod Mangartom
00050000-55dd-c5a1-72d7-7e6e4094fbec	1358	Log pri Brezovici
00050000-55dd-c5a1-dd61-b288111f2e32	1370	Logatec
00050000-55dd-c5a1-f5ea-0b809e0a4511	1371	Logatec
00050000-55dd-c5a1-9852-b93c0cfe21e7	1434	Loka pri Zidanem Mostu
00050000-55dd-c5a1-b17c-9e2ff01fb65e	3223	Loka pri Žusmu
00050000-55dd-c5a1-9339-0f2303ce4dcf	6219	Lokev
00050000-55dd-c5a1-9342-723a0df61f49	1318	Loški Potok
00050000-55dd-c5a1-e61a-86abe76d4095	2324	Lovrenc na Dravskem polju
00050000-55dd-c5a1-265d-8d18d6a1ea64	2344	Lovrenc na Pohorju
00050000-55dd-c5a1-ace1-5c913988b1e4	3334	Luče
00050000-55dd-c5a1-b937-0eabebcb80a1	1225	Lukovica
00050000-55dd-c5a1-ea91-df511aa95892	9202	Mačkovci
00050000-55dd-c5a1-5b9f-27bd341bec7f	2322	Majšperk
00050000-55dd-c5a1-816d-debdf335c466	2321	Makole
00050000-55dd-c5a1-5c38-763015c5e660	9243	Mala Nedelja
00050000-55dd-c5a1-d58c-80590496714c	2229	Malečnik
00050000-55dd-c5a1-d8ff-a7415da1ef10	6273	Marezige
00050000-55dd-c5a1-f560-841e7208d824	2000	Maribor 
00050000-55dd-c5a1-4f4d-b7187fc4ee67	2001	Maribor - poštni predali
00050000-55dd-c5a1-111b-55fe75ef4c80	2206	Marjeta na Dravskem polju
00050000-55dd-c5a1-3a97-1de5686a5371	2281	Markovci
00050000-55dd-c5a1-eab2-2f87681b1c07	9221	Martjanci
00050000-55dd-c5a1-e43f-eabacb75b69f	6242	Materija
00050000-55dd-c5a1-2d5b-24032c9aa1a2	4211	Mavčiče
00050000-55dd-c5a1-891c-2a6b20bc98ff	1215	Medvode
00050000-55dd-c5a1-865f-81016c0a0db4	1234	Mengeš
00050000-55dd-c5a1-1162-dca7115b74e3	8330	Metlika
00050000-55dd-c5a1-8864-a065765aceb6	2392	Mežica
00050000-55dd-c5a1-7439-9573a29b2f6b	2204	Miklavž na Dravskem polju
00050000-55dd-c5a1-51dd-e5fe0fd5aa61	2275	Miklavž pri Ormožu
00050000-55dd-c5a1-0c65-94854ab2c2a8	5291	Miren
00050000-55dd-c5a1-4fe2-bbf5d86f133f	8233	Mirna
00050000-55dd-c5a1-f90b-d625685b65d1	8216	Mirna Peč
00050000-55dd-c5a1-477a-ba81e62df8af	2382	Mislinja
00050000-55dd-c5a1-4846-3f0700ff92cd	4281	Mojstrana
00050000-55dd-c5a1-e60b-4c3a33cc4258	8230	Mokronog
00050000-55dd-c5a1-774f-416f0ec2d42d	1251	Moravče
00050000-55dd-c5a1-9270-864491f7d53c	9226	Moravske Toplice
00050000-55dd-c5a1-cca9-1122dd8e0c50	5216	Most na Soči
00050000-55dd-c5a1-df54-9ea84e65803b	1221	Motnik
00050000-55dd-c5a1-6519-becd0241677d	3330	Mozirje
00050000-55dd-c5a1-af20-9538bd066d67	9000	Murska Sobota 
00050000-55dd-c5a1-021f-0a6a7707e9cd	9001	Murska Sobota - poštni predali
00050000-55dd-c5a1-7db4-a2b3001ed763	2366	Muta
00050000-55dd-c5a1-9559-c36e50122ba8	4202	Naklo
00050000-55dd-c5a1-2e84-1f386522a1bc	3331	Nazarje
00050000-55dd-c5a1-3188-350375aff5c3	1357	Notranje Gorice
00050000-55dd-c5a1-6a2f-4b3745393a9e	3203	Nova Cerkev
00050000-55dd-c5a1-3743-655958f3ac41	5000	Nova Gorica 
00050000-55dd-c5a1-c757-6ea015da1737	5001	Nova Gorica - poštni predali
00050000-55dd-c5a1-94fc-649b1db45cfa	1385	Nova vas
00050000-55dd-c5a1-d16e-c6bb9ab80996	8000	Novo mesto
00050000-55dd-c5a1-44ea-516ab21f351a	8001	Novo mesto - poštni predali
00050000-55dd-c5a1-091a-609918d97e24	6243	Obrov
00050000-55dd-c5a1-be9c-84eae267a23e	9233	Odranci
00050000-55dd-c5a1-cf99-d7516bad45de	2317	Oplotnica
00050000-55dd-c5a1-edac-9db2ad5d358f	2312	Orehova vas
00050000-55dd-c5a1-4edc-707c286a6009	2270	Ormož
00050000-55dd-c5a1-3605-e7fb96abacf9	1316	Ortnek
00050000-55dd-c5a1-c291-938d2e19c7c1	1337	Osilnica
00050000-55dd-c5a1-e657-ddb80b18a51b	8222	Otočec
00050000-55dd-c5a1-402f-b4b52b7f80d1	2361	Ožbalt
00050000-55dd-c5a1-2ca7-294c30a2242a	2231	Pernica
00050000-55dd-c5a1-bb56-c0cf2b978d1d	2211	Pesnica pri Mariboru
00050000-55dd-c5a1-a474-0b9a985eafe3	9203	Petrovci
00050000-55dd-c5a1-6ca2-7d99e6490be1	3301	Petrovče
00050000-55dd-c5a2-d2e5-470bc3aececf	6330	Piran/Pirano
00050000-55dd-c5a2-2676-de5370024c4c	8255	Pišece
00050000-55dd-c5a2-77eb-5a3ada2fac3c	6257	Pivka
00050000-55dd-c5a2-5aec-5329a75b3933	6232	Planina
00050000-55dd-c5a2-ca33-cf6044b0c28e	3225	Planina pri Sevnici
00050000-55dd-c5a2-f4fc-60ca1f393c22	6276	Pobegi
00050000-55dd-c5a2-61f0-0a2298aad92a	8312	Podbočje
00050000-55dd-c5a2-9f10-29751a5f1ee7	5243	Podbrdo
00050000-55dd-c5a2-5e37-4c8e917579e2	3254	Podčetrtek
00050000-55dd-c5a2-734a-940c3372f7a0	2273	Podgorci
00050000-55dd-c5a2-9c0c-6d958298144b	6216	Podgorje
00050000-55dd-c5a2-e64d-6fd7d6085c44	2381	Podgorje pri Slovenj Gradcu
00050000-55dd-c5a2-5bf6-0db9a8752f34	6244	Podgrad
00050000-55dd-c5a2-4aef-fd93f18baa29	1414	Podkum
00050000-55dd-c5a2-6ff0-95ba6fd8d6f7	2286	Podlehnik
00050000-55dd-c5a2-a360-9c9bf9645853	5272	Podnanos
00050000-55dd-c5a2-a845-a9f43bbdb063	4244	Podnart
00050000-55dd-c5a2-325b-62d26740cd47	3241	Podplat
00050000-55dd-c5a2-299e-476474d7ce51	3257	Podsreda
00050000-55dd-c5a2-84d3-0fa687433529	2363	Podvelka
00050000-55dd-c5a2-8e99-2947d13884e7	2208	Pohorje
00050000-55dd-c5a2-8be6-42f3ea411681	2257	Polenšak
00050000-55dd-c5a2-7838-00a1f8077155	1355	Polhov Gradec
00050000-55dd-c5a2-7ce0-5c81e32602db	4223	Poljane nad Škofjo Loko
00050000-55dd-c5a2-ce3f-e0d1dacc4c07	2319	Poljčane
00050000-55dd-c5a2-0ca3-c50d90f9fdf1	1272	Polšnik
00050000-55dd-c5a2-f0b9-b8855586b233	3313	Polzela
00050000-55dd-c5a2-f8ad-84a1ec220010	3232	Ponikva
00050000-55dd-c5a2-4146-c8e5d116895a	6320	Portorož/Portorose
00050000-55dd-c5a2-35ea-a520b0ffb1eb	6230	Postojna
00050000-55dd-c5a2-0d88-11ddb911462b	2331	Pragersko
00050000-55dd-c5a2-1ff4-fb24387c4a9d	3312	Prebold
00050000-55dd-c5a2-4f71-d05701b5d37c	4205	Preddvor
00050000-55dd-c5a2-1993-7f905f60319e	6255	Prem
00050000-55dd-c5a2-5f8b-0692fed6e270	1352	Preserje
00050000-55dd-c5a2-82fd-07bc014717c9	6258	Prestranek
00050000-55dd-c5a2-a678-ac5c78b934df	2391	Prevalje
00050000-55dd-c5a2-043d-9ac7d43d3f1a	3262	Prevorje
00050000-55dd-c5a2-6459-39dc39080054	1276	Primskovo 
00050000-55dd-c5a2-b7f1-02ca61337d0b	3253	Pristava pri Mestinju
00050000-55dd-c5a2-aacc-c070eae8c761	9207	Prosenjakovci/Partosfalva
00050000-55dd-c5a2-006d-bcc157a22996	5297	Prvačina
00050000-55dd-c5a2-f94a-c25527f98be1	2250	Ptuj
00050000-55dd-c5a2-5fd9-559d62764693	2323	Ptujska Gora
00050000-55dd-c5a2-6750-70140f96d7e3	9201	Puconci
00050000-55dd-c5a2-9aaa-75e7d00a00be	2327	Rače
00050000-55dd-c5a2-b78c-59ab32131155	1433	Radeče
00050000-55dd-c5a2-2fb2-9b19dcad6d8e	9252	Radenci
00050000-55dd-c5a2-0e15-f2fe5c89491c	2360	Radlje ob Dravi
00050000-55dd-c5a2-a9b3-b2d026cc6d51	1235	Radomlje
00050000-55dd-c5a2-1dec-15170e7d0928	4240	Radovljica
00050000-55dd-c5a2-3b90-92f66223f719	8274	Raka
00050000-55dd-c5a2-5d17-f6a560bdb191	1381	Rakek
00050000-55dd-c5a2-d563-0daaf2abc511	4283	Rateče - Planica
00050000-55dd-c5a2-617a-2d06cf31df75	2390	Ravne na Koroškem
00050000-55dd-c5a2-e07e-7275fca78005	9246	Razkrižje
00050000-55dd-c5a2-1fb3-dcc6ebb289a1	3332	Rečica ob Savinji
00050000-55dd-c5a2-117b-ff2654190afb	5292	Renče
00050000-55dd-c5a2-e7b3-970bb2a9e5da	1310	Ribnica
00050000-55dd-c5a2-3e55-14af3a290c5d	2364	Ribnica na Pohorju
00050000-55dd-c5a2-a4e8-c57bb9ec38ff	3272	Rimske Toplice
00050000-55dd-c5a2-4a5c-ddda0cc765ff	1314	Rob
00050000-55dd-c5a2-1c0d-1571319da040	5215	Ročinj
00050000-55dd-c5a2-2c7e-6ae83d2dcfab	3250	Rogaška Slatina
00050000-55dd-c5a2-7a70-1d92584bcaf6	9262	Rogašovci
00050000-55dd-c5a2-26fe-f0d18c31f80b	3252	Rogatec
00050000-55dd-c5a2-9909-fe33430bc8b1	1373	Rovte
00050000-55dd-c5a2-a196-c036104b7669	2342	Ruše
00050000-55dd-c5a2-4b17-e7678a0fdb2f	1282	Sava
00050000-55dd-c5a2-25b1-532aa2d31557	6333	Sečovlje/Sicciole
00050000-55dd-c5a2-580b-14066e792656	4227	Selca
00050000-55dd-c5a2-0e31-56843a127d8c	2352	Selnica ob Dravi
00050000-55dd-c5a2-085e-aa8af51e503a	8333	Semič
00050000-55dd-c5a2-4160-c4f08f31933d	8281	Senovo
00050000-55dd-c5a2-1233-bb772f38f081	6224	Senožeče
00050000-55dd-c5a2-67f5-9a95710bb0ad	8290	Sevnica
00050000-55dd-c5a2-d7c5-5c3a4986f063	6210	Sežana
00050000-55dd-c5a2-ed17-51c1d0f943fa	2214	Sladki Vrh
00050000-55dd-c5a2-b008-70aa6bd0cfc7	5283	Slap ob Idrijci
00050000-55dd-c5a2-c185-2a879b881964	2380	Slovenj Gradec
00050000-55dd-c5a2-5d00-b1ca5867fb98	2310	Slovenska Bistrica
00050000-55dd-c5a2-7f01-8a35f897ad37	3210	Slovenske Konjice
00050000-55dd-c5a2-45d8-c4c30b813cb2	1216	Smlednik
00050000-55dd-c5a2-69f9-3f97caaed8cd	5232	Soča
00050000-55dd-c5a2-88be-e069b9255352	1317	Sodražica
00050000-55dd-c5a2-478d-9c43a8a297b5	3335	Solčava
00050000-55dd-c5a2-b764-e38a18ae6050	5250	Solkan
00050000-55dd-c5a2-cc2d-6f3486c97e87	4229	Sorica
00050000-55dd-c5a2-ed8c-eaf35f164760	4225	Sovodenj
00050000-55dd-c5a2-ba8a-252ca28169be	5281	Spodnja Idrija
00050000-55dd-c5a2-def6-5382682a8458	2241	Spodnji Duplek
00050000-55dd-c5a2-df62-5347fb401625	9245	Spodnji Ivanjci
00050000-55dd-c5a2-be57-3d9aab7bd4c7	2277	Središče ob Dravi
00050000-55dd-c5a2-f69c-4352211e35f1	4267	Srednja vas v Bohinju
00050000-55dd-c5a2-e6cb-1250f6180f34	8256	Sromlje 
00050000-55dd-c5a2-0e42-f5be40013632	5224	Srpenica
00050000-55dd-c5a2-d327-a6b2b6387fb2	1242	Stahovica
00050000-55dd-c5a2-4ce7-2db762b31dd8	1332	Stara Cerkev
00050000-55dd-c5a2-08ae-23aea2f16c2d	8342	Stari trg ob Kolpi
00050000-55dd-c5a2-9a82-5d894d7e7e21	1386	Stari trg pri Ložu
00050000-55dd-c5a2-1eec-6fe90b4dfaf4	2205	Starše
00050000-55dd-c5a2-fc17-9f950bd5ce7d	2289	Stoperce
00050000-55dd-c5a2-d00a-1e36a2fecaae	8322	Stopiče
00050000-55dd-c5a2-73e2-f9d0ae1a7cf0	3206	Stranice
00050000-55dd-c5a2-62ae-49069a65b033	8351	Straža
00050000-55dd-c5a2-0122-9666cd9d507e	1313	Struge
00050000-55dd-c5a2-f2d8-5f6bffcb21d3	8293	Studenec
00050000-55dd-c5a2-d670-9d7735b3d46e	8331	Suhor
00050000-55dd-c5a2-9a72-ca0a3b012586	2233	Sv. Ana v Slovenskih goricah
00050000-55dd-c5a2-62f5-c640514389fa	2235	Sv. Trojica v Slovenskih goricah
00050000-55dd-c5a2-c6c2-9b0041694d9b	2353	Sveti Duh na Ostrem Vrhu
00050000-55dd-c5a2-7790-b5c70a4c58c7	9244	Sveti Jurij ob Ščavnici
00050000-55dd-c5a2-a99f-90a001b1e5e4	3264	Sveti Štefan
00050000-55dd-c5a2-9c7e-f368465103ef	2258	Sveti Tomaž
00050000-55dd-c5a2-d559-e977e41287b8	9204	Šalovci
00050000-55dd-c5a2-eecf-bd849b5bb452	5261	Šempas
00050000-55dd-c5a2-33df-6515197b0e8b	5290	Šempeter pri Gorici
00050000-55dd-c5a2-562a-f32eb7823ef0	3311	Šempeter v Savinjski dolini
00050000-55dd-c5a2-a7a7-2f2b33e3bf70	4208	Šenčur
00050000-55dd-c5a2-ac90-318a546a1044	2212	Šentilj v Slovenskih goricah
00050000-55dd-c5a2-91ab-019f2820f705	8297	Šentjanž
00050000-55dd-c5a2-4163-8c776f4bfa85	2373	Šentjanž pri Dravogradu
00050000-55dd-c5a2-6867-32ba67e407ba	8310	Šentjernej
00050000-55dd-c5a2-52b6-078969f5dfec	3230	Šentjur
00050000-55dd-c5a2-8cfe-1814604d7cc5	3271	Šentrupert
00050000-55dd-c5a2-bdde-e3bdb6daed05	8232	Šentrupert
00050000-55dd-c5a2-45f9-77ec1e0dee80	1296	Šentvid pri Stični
00050000-55dd-c5a2-bffd-ff9de05fac7a	8275	Škocjan
00050000-55dd-c5a2-0f4d-e2cac40a3495	6281	Škofije
00050000-55dd-c5a2-c934-12c1a8430348	4220	Škofja Loka
00050000-55dd-c5a2-f5ea-9ab6462f2504	3211	Škofja vas
00050000-55dd-c5a2-00a8-e840eb7667e7	1291	Škofljica
00050000-55dd-c5a2-2794-a137c2bdaa9c	6274	Šmarje
00050000-55dd-c5a2-255c-1933e32ef749	1293	Šmarje - Sap
00050000-55dd-c5a2-8f2c-5114b8d8876a	3240	Šmarje pri Jelšah
00050000-55dd-c5a2-10ef-67003777ee2e	8220	Šmarješke Toplice
00050000-55dd-c5a2-3305-536597482416	2315	Šmartno na Pohorju
00050000-55dd-c5a2-3ee6-ca2233d0728c	3341	Šmartno ob Dreti
00050000-55dd-c5a2-dc35-04ab278d7b05	3327	Šmartno ob Paki
00050000-55dd-c5a2-b935-0c5cfe1e685d	1275	Šmartno pri Litiji
00050000-55dd-c5a2-627f-26ab3e4f2969	2383	Šmartno pri Slovenj Gradcu
00050000-55dd-c5a2-d158-1772f01e34b7	3201	Šmartno v Rožni dolini
00050000-55dd-c5a2-537b-4adfdeed5dc8	3325	Šoštanj
00050000-55dd-c5a2-096b-f475ba1961ce	6222	Štanjel
00050000-55dd-c5a2-ac31-ff84395a61b4	3220	Štore
00050000-55dd-c5a2-4a18-7390e5e58e4a	3304	Tabor
00050000-55dd-c5a2-7759-a8a7336d3e5c	3221	Teharje
00050000-55dd-c5a2-eb6c-5296fee463ae	9251	Tišina
00050000-55dd-c5a2-49c0-e5c8c783e3b7	5220	Tolmin
00050000-55dd-c5a2-ff76-8acd80248b7a	3326	Topolšica
00050000-55dd-c5a2-705d-9012561583af	2371	Trbonje
00050000-55dd-c5a2-77a5-b710b8f8fc2a	1420	Trbovlje
00050000-55dd-c5a2-c8ee-d00f2578c5e3	8231	Trebelno 
00050000-55dd-c5a2-8f42-d185312bd19d	8210	Trebnje
00050000-55dd-c5a2-41c7-8fc722bd68cc	5252	Trnovo pri Gorici
00050000-55dd-c5a2-002d-21e97cef21a6	2254	Trnovska vas
00050000-55dd-c5a2-c890-53bba37290ee	1222	Trojane
00050000-55dd-c5a2-86de-0bceb52f0629	1236	Trzin
00050000-55dd-c5a2-55a3-c233675b80c3	4290	Tržič
00050000-55dd-c5a2-7e3a-094c5fe5be79	8295	Tržišče
00050000-55dd-c5a2-abb5-e4fcc37f5891	1311	Turjak
00050000-55dd-c5a2-38b9-b0bedb637f07	9224	Turnišče
00050000-55dd-c5a2-8bd0-c85fa0b487b1	8323	Uršna sela
00050000-55dd-c5a2-acc8-e4a4c1c0386a	1252	Vače
00050000-55dd-c5a2-db14-5fc986fbc23f	3320	Velenje 
00050000-55dd-c5a2-dfb0-4810f3863212	3322	Velenje - poštni predali
00050000-55dd-c5a2-e897-25d38518beb6	8212	Velika Loka
00050000-55dd-c5a2-b0a6-e8af859cda6b	2274	Velika Nedelja
00050000-55dd-c5a2-80cc-979ff2a9a640	9225	Velika Polana
00050000-55dd-c5a2-81d7-f8f227633b45	1315	Velike Lašče
00050000-55dd-c5a2-ea52-d2c210022277	8213	Veliki Gaber
00050000-55dd-c5a2-2dd0-8c5d684ded2c	9241	Veržej
00050000-55dd-c5a2-377d-c1547d8362f0	1312	Videm - Dobrepolje
00050000-55dd-c5a2-acbf-56be57e26a4f	2284	Videm pri Ptuju
00050000-55dd-c5a2-5a3b-355ea86ce26a	8344	Vinica
00050000-55dd-c5a2-b65c-9c24f11a57d2	5271	Vipava
00050000-55dd-c5a2-e36f-27fe69dfe25e	4212	Visoko
00050000-55dd-c5a2-8249-b22916a93f73	1294	Višnja Gora
00050000-55dd-c5a2-f6a0-1e00adbc6e0a	3205	Vitanje
00050000-55dd-c5a2-83a4-132928aa8f25	2255	Vitomarci
00050000-55dd-c5a2-8249-264994ec2d4f	1217	Vodice
00050000-55dd-c5a2-85aa-0b9fbcfbf63d	3212	Vojnik\t
00050000-55dd-c5a2-5b2f-7474ab861add	5293	Volčja Draga
00050000-55dd-c5a2-c563-3c26f012ac19	2232	Voličina
00050000-55dd-c5a2-1aab-d3521e6dac4d	3305	Vransko
00050000-55dd-c5a2-3a96-ee035df39084	6217	Vremski Britof
00050000-55dd-c5a2-f774-1364a569193f	1360	Vrhnika
00050000-55dd-c5a2-3765-fa79b1497b98	2365	Vuhred
00050000-55dd-c5a2-7c47-46928119de3f	2367	Vuzenica
00050000-55dd-c5a2-7b03-bf8987aac16f	8292	Zabukovje 
00050000-55dd-c5a2-b32c-49804d50bb1b	1410	Zagorje ob Savi
00050000-55dd-c5a2-19a9-84b990f1de20	1303	Zagradec
00050000-55dd-c5a2-5d09-e3f91bd7bfe9	2283	Zavrč
00050000-55dd-c5a2-3117-1b387294ff83	8272	Zdole 
00050000-55dd-c5a2-43c5-374cfc086ff7	4201	Zgornja Besnica
00050000-55dd-c5a2-23c9-a8628a62cc00	2242	Zgornja Korena
00050000-55dd-c5a2-7d34-71694eae560e	2201	Zgornja Kungota
00050000-55dd-c5a2-45e7-fafcc325d7b5	2316	Zgornja Ložnica
00050000-55dd-c5a2-f4fc-b4fb58cc2b57	2314	Zgornja Polskava
00050000-55dd-c5a2-2f8a-5242b4a45fbf	2213	Zgornja Velka
00050000-55dd-c5a2-39ca-d9bb4d519ad0	4247	Zgornje Gorje
00050000-55dd-c5a2-4366-a73204ee64e4	4206	Zgornje Jezersko
00050000-55dd-c5a2-4c8e-7218330b96aa	2285	Zgornji Leskovec
00050000-55dd-c5a2-d676-6b0d4af5234a	1432	Zidani Most
00050000-55dd-c5a2-d783-dcd240d99b97	3214	Zreče
00050000-55dd-c5a2-9493-f031a2b0fcdc	4209	Žabnica
00050000-55dd-c5a2-a562-e4b43d64b330	3310	Žalec
00050000-55dd-c5a2-df22-781a85f01fe9	4228	Železniki
00050000-55dd-c5a2-0426-4614d4faa65b	2287	Žetale
00050000-55dd-c5a2-7de6-d37734b9f406	4226	Žiri
00050000-55dd-c5a2-8295-4d8059fe05eb	4274	Žirovnica
00050000-55dd-c5a2-da06-bd1ac1cd6a59	8360	Žužemberk
\.


--
-- TOC entry 2932 (class 0 OID 15728152)
-- Dependencies: 200
-- Data for Name: postavkaracuna; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkaracuna (id, racun_id) FROM stdin;
\.


--
-- TOC entry 2914 (class 0 OID 15727959)
-- Dependencies: 182
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
00060000-55dd-c5a3-3254-db834a3a5d7b	00080000-55dd-c5a3-0591-434262187c09	\N	00040000-55dd-c5a2-fc95-2d32b7ce352a	Narodni dom	\N	Koroška 15	\N	9231	Beltinci	\N	f	t
00060000-55dd-c5a3-3d44-6fdf18f09b08	00080000-55dd-c5a3-0591-434262187c09	\N	00040000-55dd-c5a2-fc95-2d32b7ce352a		\N	Koroška 22	\N	9231	Beltinci	\N	f	f
00060000-55dd-c5a3-4d2d-763c53ab2802	00080000-55dd-c5a3-665e-7e5b82a7239a	\N	00040000-55dd-c5a2-fc95-2d32b7ce352a		\N	Rimska ploščad 7	\N	9231	Beltinci	\N	f	t
\.


--
-- TOC entry 2920 (class 0 OID 15728037)
-- Dependencies: 188
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, gostujoc_id) FROM stdin;
\.


--
-- TOC entry 2934 (class 0 OID 15728164)
-- Dependencies: 202
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 2958 (class 0 OID 15728513)
-- Dependencies: 226
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, koproducent_id, odstotekfinanciranja, delez, maticnikop, kpe, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 2959 (class 0 OID 15728523)
-- Dependencies: 227
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, sifra, status) FROM stdin;
00190000-55dd-c5a3-6994-b383a73d70d3	00080000-55dd-c5a3-c615-7e3a2f11b52c	0987	AK
00190000-55dd-c5a3-114c-1b0b03e79630	00080000-55dd-c5a3-665e-7e5b82a7239a	0989	AK
00190000-55dd-c5a3-1bfe-bba92d0c27b3	00080000-55dd-c5a3-5ffb-cf291fd18b0b	0986	AK
00190000-55dd-c5a3-60b0-5d67e2bc46eb	00080000-55dd-c5a3-9154-36d31d52254c	0984	AK
00190000-55dd-c5a3-d50b-6124faf38f73	00080000-55dd-c5a3-eeb5-06a838aa5d14	0983	AK
00190000-55dd-c5a3-fd59-5f203218e879	00080000-55dd-c5a3-eed9-3a5b79e5d640	0982	AK
00190000-55dd-c5a4-fd2a-bb23d629c296	00080000-55dd-c5a4-966e-62caba54f195	1001	AK
\.


--
-- TOC entry 2957 (class 0 OID 15728469)
-- Dependencies: 225
-- Data for Name: programdela; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programdela (id, sezona_id, sifra, naziv, zacetek, konec, zakljuceno, potrjenprogram, stpremier, stint, stfest, strazno, stizjem, stponprem, stponprej, stponprejvelikih, stponprejmalih, stponprejmalihkopr, stponprejsredkopr, stponprejvelikihkopr, stgostujo, vrps1, vrps1do, vrps1mat, vrps1gostovsz, stizvnekomerc, stizvprem, stizvponprem, stizvponpremdoma, stizvponpremzamejo, stizvponpremgost, stizvponpremkopr, stizvponpremint, stizvponpremkoprint, stizvponprej, stizvponprejdoma, stizvponprejzamejo, stizvponprejgost, stizvponprejkopr, stizvponprejint, stizvponprejkoprint, stizvgostuj, stizvostalihnek, stizvgostovanjslo, stizvgostovanjzam, stizvgostovanjint, stobisknekom, stobisknekommat, stobisknekomgostslo, stobisknekomgostzam, stobisknekomgostint, stobiskprem, stobiskponprem, stobiskponpremdoma, stobiskponpremkopr, stobiskponpremkoprint, avgobiskprired, avgzaseddvoran, avgcenavstopnice, stprodvstopnic, stkoprodukcij, stkoprodukcijint, stkoprodukcijnvo, stzaposlenih, stzaposigralcev, avgstnastopovigr, sthonorarnih, sthonorarnihigr, sthonorarnihigrtujjz, sthonorarnihigrsamoz, sredstvaint, sredstvaavt, sredstvazaprosenoprem, sredstvazaprosenoponprem, sredstvazaprosenoponprej, sredstvazaprosenogostujo, sredstvazaprosenoint, sredstvazaprosenofest, sredstvazaprosenorazno, sredstvazaprosenoizjem, sredstvadrugijavniprem, sredstvadrugijavniponprem, sredstvadrugijavniponprej, sredstvadrugijavnigostujo, sredstvadrugijavniint, sredstvadrugijavnifest, sredstvadrugijavnirazno, sredstvadrugijavniizjem, sredstvadrugiviriprem, sredstvadrugiviriponprem, sredstvadrugiviriponprej, sredstvadrugivirigostujo, sredstvadrugiviriint, sredstvadrugivirifest, sredstvadrugivirirazno, sredstvadrugiviriizjem, sredstvaavtsamoz) FROM stdin;
00290000-55dd-c5a4-fa01-bbe28364a6e4	\N	0001	Testni program dela	2016-02-01	2017-02-01	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 2960 (class 0 OID 15728531)
-- Dependencies: 228
-- Data for Name: programskaenotasklopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programskaenotasklopa (id, naslovpe, avtorpe, obsegpe, mesecpe, vrednostpe, programrazno_id) FROM stdin;
\.


--
-- TOC entry 2938 (class 0 OID 15728193)
-- Dependencies: 206
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, popa_id, naslov_id, sifra, naziv, jeprizorisce, kapaciteta, opis) FROM stdin;
00220000-55dd-c5a3-86d4-dae2b000220f	\N	\N	0001	Poskusna 1	f	8	Poskusna učilnica v prvem
00220000-55dd-c5a3-a69d-d7971511878a	\N	\N	0002	Poskusna 3	f	34	Poskusna učilnica v tretjem
00220000-55dd-c5a3-cfde-dd15fac890f5	\N	\N	0003	Kazinska	t	84	Kazinska dvorana
00220000-55dd-c5a3-7bf4-e363e6e2eac3	\N	\N	0004	Mali oder	t	24	Mali oder 
00220000-55dd-c5a3-a031-63e118c45a14	\N	\N	0005	Komorni oder	t	15	Komorni oder
00220000-55dd-c5a3-c1f8-4176977b6f2e	\N	\N	0006	Stara dvorana	t	96	Stara dvorana ali dvorana Franceta Prešerna
00220000-55dd-c5a3-a738-a641b8b9d64a	\N	\N	0007	Velika dvorana	t	160	Velika, glavna dvorana
\.


--
-- TOC entry 2930 (class 0 OID 15728137)
-- Dependencies: 198
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 2929 (class 0 OID 15728127)
-- Dependencies: 197
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 2950 (class 0 OID 15728324)
-- Dependencies: 218
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta, status) FROM stdin;
\.


--
-- TOC entry 2945 (class 0 OID 15728263)
-- Dependencies: 213
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 2903 (class 0 OID 15727832)
-- Dependencies: 171
-- Data for Name: revizije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY revizije (id, razred, objectid, upor, datum, tip, data) FROM stdin;
1	App\\Entity\\Popa	00080000-55dd-c5a4-966e-62caba54f195	00010000-55dd-c5a2-ec4a-9cfac99a26d4	2015-08-26 15:56:52	INS	a:0:{}
2	App\\Entity\\Option	00000000-55dd-c5a4-da32-0649bec6ace5	00010000-55dd-c5a2-ec4a-9cfac99a26d4	2015-08-26 15:56:52	INS	a:0:{}
3	ProgramDela\\Entity\\ProdukcijskaHisa	00190000-55dd-c5a4-fd2a-bb23d629c296	00010000-55dd-c5a2-ec4a-9cfac99a26d4	2015-08-26 15:56:52	INS	a:0:{}
\.


--
-- TOC entry 2981 (class 0 OID 0)
-- Dependencies: 170
-- Name: revizije_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('revizije_id_seq', 3, true);


--
-- TOC entry 2939 (class 0 OID 15728205)
-- Dependencies: 207
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 2907 (class 0 OID 15727870)
-- Dependencies: 175
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-55dd-c5a2-950f-3fe4d5117c83	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-55dd-c5a2-b6cd-5f7dd6e90be6	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-55dd-c5a2-7a57-a5a410f1d501	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-55dd-c5a2-ea39-0c7a603e849b	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-55dd-c5a2-1741-3e40f2b61369	planer	Planer dogodkov v koledarju	t
00020000-55dd-c5a2-5036-8a9cf864b3df	kadrovska	Kadrovska služba	t
00020000-55dd-c5a2-7b46-ded0de3d260b	arhivar	Ažuriranje arhivalij	t
00020000-55dd-c5a2-476e-885ee615dc1b	igralec	Igralec	t
00020000-55dd-c5a2-e42f-7f1c62598abf	prisotnost	Vnašalec prisotnosti, tudi za tiste izven uprizoritev	t
00020000-55dd-c5a3-1401-d24d6b27c805	vsadovoljenja	Vloga z vsemi posameznimi dovoljenji	t
\.


--
-- TOC entry 2905 (class 0 OID 15727854)
-- Dependencies: 173
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-55dd-c5a2-3d7b-ed3b48aaf5e0	00020000-55dd-c5a2-7a57-a5a410f1d501
00010000-55dd-c5a2-ec4a-9cfac99a26d4	00020000-55dd-c5a2-7a57-a5a410f1d501
00010000-55dd-c5a3-8f39-08bc61497bd1	00020000-55dd-c5a3-1401-d24d6b27c805
\.


--
-- TOC entry 2941 (class 0 OID 15728219)
-- Dependencies: 209
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 2933 (class 0 OID 15728158)
-- Dependencies: 201
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 2927 (class 0 OID 15728104)
-- Dependencies: 195
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, sifra, ime, zacetek, konec, aktivna) FROM stdin;
\.


--
-- TOC entry 2965 (class 0 OID 15728572)
-- Dependencies: 233
-- Data for Name: stevilcenje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenje (id, sifra, naziv, prefix, suffix, zacetek, dolzina, format, globalno, poletih) FROM stdin;
00230000-55dd-c5a2-eb15-88d6b43cf4c6	pri	Privzeto številčenje po letih YYYY-N	\N	\N	1	1	%l-%n	f	t
00230000-55dd-c5a2-9776-de14f5cc6354	123	Privzeto številčenje kratkih šifer	\N	\N	100	3	%n	f	f
00230000-55dd-c5a2-e1ac-f3a75103d6ae	bcd	Globalno številčenje črtnih kod	\N	\N	1	9	%n	t	f
00230000-55dd-c5a2-a392-29ca7208a3f9	sif	Številčenje šifrant	\N	\N	1000	4	%n	t	f
00230000-55dd-c5a2-2d74-b5f185f19ddd	tmp	Globalno številčenje začasnih številk	tmp	\N	1000	5	%l%n	t	t
\.


--
-- TOC entry 2964 (class 0 OID 15728564)
-- Dependencies: 232
-- Data for Name: stevilcenjekonfig; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjekonfig (id, stevilcenje_id, dok) FROM stdin;
00240000-55dd-c5a2-b1d0-ea588a6f4769	00230000-55dd-c5a2-a392-29ca7208a3f9	popa
00240000-55dd-c5a2-c2a9-886592209058	00230000-55dd-c5a2-a392-29ca7208a3f9	oseba
00240000-55dd-c5a2-dd6f-4364e5bcfb5e	00230000-55dd-c5a2-a392-29ca7208a3f9	sezona
00240000-55dd-c5a2-b23a-220b142ba3a3	00230000-55dd-c5a2-9776-de14f5cc6354	prostor
00240000-55dd-c5a2-62b4-d08f0fe77ebf	00230000-55dd-c5a2-a392-29ca7208a3f9	besedilo
00240000-55dd-c5a2-a3b1-afe436433cb3	00230000-55dd-c5a2-a392-29ca7208a3f9	uprizoritev
00240000-55dd-c5a2-76b3-445ce251bc86	00230000-55dd-c5a2-a392-29ca7208a3f9	funkcija
00240000-55dd-c5a2-be35-605db9f81d8b	00230000-55dd-c5a2-a392-29ca7208a3f9	tipfunkcije
00240000-55dd-c5a2-4fbb-389c2b9a34dd	00230000-55dd-c5a2-a392-29ca7208a3f9	alternacija
00240000-55dd-c5a2-c73e-a6a6b373b6e8	00230000-55dd-c5a2-eb15-88d6b43cf4c6	pogodba
00240000-55dd-c5a2-4794-de1d6ee60863	00230000-55dd-c5a2-a392-29ca7208a3f9	zaposlitev
00240000-55dd-c5a2-ff28-3f313020e4dc	00230000-55dd-c5a2-eb15-88d6b43cf4c6	programdela
00240000-55dd-c5a2-20a2-e5384a0e199b	00230000-55dd-c5a2-a392-29ca7208a3f9	zapis
\.


--
-- TOC entry 2963 (class 0 OID 15728559)
-- Dependencies: 231
-- Data for Name: stevilcenjestanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjestanje (id, objid, leto, stevilka) FROM stdin;
0823f23e-0335-413f-8a8c-216ceda471c1	00230000-55dd-c5a2-a392-29ca7208a3f9	0	1001
\.


--
-- TOC entry 2946 (class 0 OID 15728273)
-- Dependencies: 214
-- Data for Name: strosekuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY strosekuprizoritve (id, uprizoritev_id, popa_id, naziv, vrednostdo, vrednostna, opis, tipstroska, sort, vrstastroska_id) FROM stdin;
00270000-55dd-c5a4-2eaa-ca750bd68047	000e0000-55dd-c5a3-144a-2db7fff03210	00080000-55dd-c5a3-0591-434262187c09	Nabava kostumov	600.50	20.00	Krila in maske	materialni	1	003b0000-55dd-c5a2-828a-f128ea6d3011
00270000-55dd-c5a4-385d-963e27b768b3	000e0000-55dd-c5a3-144a-2db7fff03210	00080000-55dd-c5a3-0591-434262187c09	Zavese	125.70	3.10	Modra in zelena zavesa	materialni	2	003b0000-55dd-c5a2-828a-f128ea6d3011
00270000-55dd-c5a4-e537-ee545323c409	000e0000-55dd-c5a3-144a-2db7fff03210	00080000-55dd-c5a3-9807-19ded53f8f00	Avtorske pravice	300.00	30.00	Odkup avtorskih pravic	avtorprav	4	\N
\.


--
-- TOC entry 2912 (class 0 OID 15727932)
-- Dependencies: 180
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 2928 (class 0 OID 15728114)
-- Dependencies: 196
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja) FROM stdin;
001a0000-55dd-c5a4-b812-4bcb28ca432f	00180000-55dd-c5a4-df55-917f573a9239	000c0000-55dd-c5a4-7403-59de0675f569	00090000-55dd-c5a3-b297-3e5b71129a04	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55dd-c5a4-58ba-f6f714507097	00180000-55dd-c5a4-df55-917f573a9239	000c0000-55dd-c5a4-6a3e-37ffb7564ab0	00090000-55dd-c5a3-41a5-99a18dd73c8c	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55dd-c5a4-647d-2c94bbe9c756	00180000-55dd-c5a4-df55-917f573a9239	000c0000-55dd-c5a4-e9af-ea2af70a0358	00090000-55dd-c5a3-1424-f63eaa57a754	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55dd-c5a4-6189-5490d98e7e11	00180000-55dd-c5a4-df55-917f573a9239	000c0000-55dd-c5a4-6662-65b6296fb096	00090000-55dd-c5a3-5325-f3599bded35d	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55dd-c5a4-3663-dec136d0426a	00180000-55dd-c5a4-df55-917f573a9239	000c0000-55dd-c5a4-cc5d-dfb3c4e2b81e	00090000-55dd-c5a3-d8e7-3dcd51d7e62a	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55dd-c5a4-aebc-bc18c82dcb35	00180000-55dd-c5a4-e7da-5db8735e0597	\N	00090000-55dd-c5a3-d8e7-3dcd51d7e62a	2015-08-01 20:00:00	2015-08-01 23:00:00	\N	\N	2.00
\.


--
-- TOC entry 2949 (class 0 OID 15728313)
-- Dependencies: 217
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, ime, opis, imezenski, podrocje) FROM stdin;
000f0000-55dd-c5a2-e3f5-e94a8580ae65	Avtor	Avtorji	Avtorka	umetnik
000f0000-55dd-c5a2-bc68-4114c7b11d02	Priredba	Priredba	Priredba	umetnik
000f0000-55dd-c5a2-bce8-558ca1ef7e9a	Prevod	Prevod	Prevod	umetnik
000f0000-55dd-c5a2-0bab-f50c9afbe446	Režija	Režija	Režija	umetnik
000f0000-55dd-c5a2-02e0-b793cf766704	Dramaturgija	Dramaturgija	Dramaturgija	umetnik
000f0000-55dd-c5a2-bf97-aeef7b1550fe	Scenografija	Scenografija	Scenografija	umetnik
000f0000-55dd-c5a2-ca3b-3fee3fe97ab7	Kostumografija	Kostumografija	Kostumografija	umetnik
000f0000-55dd-c5a2-189b-c0a4776358d7	Koreografija	Koreografija	Koreografija	umetnik
000f0000-55dd-c5a2-d3b0-e82444faef4d	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	umetnik
000f0000-55dd-c5a2-2f3b-630f136d136e	Oblikovanje maske	Oblikovanje maske	Oblikovanje maske	umetnik
000f0000-55dd-c5a2-9300-9eb721d99e7f	Lektorstvo	Lektorstvo	Lektorstvo	umetnik
000f0000-55dd-c5a2-e540-d952d713b437	Glasbeni soustvarjalec	Glasbeni soustvarjalci	Glasbena soustvarjalka	umetnik
000f0000-55dd-c5a2-add6-e102b3589e1e	Intermedijski ustvarjalec	Intermedijski ustvarjalci	Intermedijski ustvarjalka	umetnik
000f0000-55dd-c5a2-e671-2a46c3c38ef3	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	umetnik
000f0000-55dd-c5a2-fc50-e4e1ef1ec965	Vloga	Intermedijski ustvarjalci	Intermedijska ustvarjalka	igralec
000f0000-55dd-c5a2-66e8-0155b006e352	Produkcija, mentorstvo	Produkcija, mentorstvo	Produkcija, mentorstvo	umetnik
000f0000-55dd-c5a2-64e2-626b008191a1	Tehnična podpora	Tehnična podpora	Tehnična podpora	tehnik
000f0000-55dd-c5a2-e1aa-ad14f2aca41e	Inšpicient	Inšpicienti	Inšpicientka	inspicient
\.


--
-- TOC entry 2961 (class 0 OID 15728541)
-- Dependencies: 229
-- Data for Name: tipprogramskeenote; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipprogramskeenote (id, sifra, naziv, koprodukcija, maxfaktor, maxvsi) FROM stdin;
002b0000-55dd-c5a2-3251-8ae2c65a722f	01	Velika predstava	f	1.00	1.00
002b0000-55dd-c5a2-be0e-eb1e82c4ab98	02	Mala predstava	f	0.50	0.50
002b0000-55dd-c5a2-123a-b5be52771065	03	Mala koprodukcija	t	0.40	1.00
002b0000-55dd-c5a2-e9cd-8a0fcdfd6fb8	04	Srednja koprodukcija	t	0.70	2.00
002b0000-55dd-c5a2-aaa4-d11772435849	05	Velika koprodukcija	t	1.00	3.00
\.


--
-- TOC entry 2917 (class 0 OID 15727994)
-- Dependencies: 185
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 2904 (class 0 OID 15727841)
-- Dependencies: 172
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-55dd-c5a2-ec4a-9cfac99a26d4	Konzolni	$2y$05$NS4xMjkyMTcwMzExMjAxROtaVB3UQyXShKiUnr4bTDCd80K21m2eq	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-55dd-c5a3-da5e-b4d39f0fe340	testni uporabnik za inšpicienta	$2y$05$NS4xMjkyMTcwMzExMjAxROxkJ1B6xAXex6EZLIwJfWzRJ8DpfecFO	t	\N	\N	\N	ivo@ifigenija.si	\N	\N	\N
00010000-55dd-c5a3-5e81-2080f8e23be9	testni uporabnik za Tehničnega vodjo	$2y$05$NS4xMjkyMTcwMzExMjAxROu/kXWR9sP9oamkesKuxXLbxkCb387.G	t	\N	\N	\N	tona@ifigenija.si	\N	\N	\N
00010000-55dd-c5a3-be7c-9de19df692fc	testni uporabnik za igralca	$2y$05$NS4xMjkyMTcwMzExMjAxRO/hLCgClfERRsfCAFYwxNCcFIVjP2982	t	\N	\N	\N	irena@ifigenija.si	\N	\N	\N
00010000-55dd-c5a3-1e17-74fe167e2832	testni uporabnik vnašalca termina storitev (TerminStoritve-vse)	$2y$05$NS4xMjkyMTcwMzExMjAxROT6.kTHqEq4.wa2SOnf124/N14m9qeP.	t	\N	\N	\N	tatjana@ifigenija.si	\N	\N	\N
00010000-55dd-c5a3-9bee-d5fb4ccf3d97	testni uporabnik, ki je inšpicient brez zapisov v TerminStoritve	$2y$05$NS4xMjkyMTcwMzExMjAxROHau47Dtb7CME5.nlWwBVM.nusFP.ra2	t	\N	\N	\N	joze@ifigenija.si	\N	\N	\N
00010000-55dd-c5a3-087a-bc9df508f4ea	testna uporabnica, ki je planerka	$2y$05$NS4xMjkyMTcwMzExMjAxRO.B/uJO3C7QRNhdX9Q2hTLQsSupj1V1S	t	\N	\N	\N	petra@ifigenija.si	\N	\N	\N
00010000-55dd-c5a3-8fa5-3c7d7161b821	testni uporabnik, ki dobi ifi-all vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROv2d7jqhaV/Mz3EIsKoi7UoFR.SDSMBm	t	\N	\N	\N	ali@ifigenija.si	\N	\N	\N
00010000-55dd-c5a3-8fbf-42c7ab94856b	testni uporabnik, ki dobi ifi-readall vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROYB9g.gnkufr1l/gWK6mkx.ySqrOWnJC	t	\N	\N	\N	berta@ifigenija.si	\N	\N	\N
00010000-55dd-c5a3-54bc-5e87d4b11687	testni uporabnik, ki dobi aaa-write dovoljenje	$2y$05$NS4xMjkyMTcwMzExMjAxRORujYObKX.DzpXVYbePkiJkHqg0/Ylya	t	\N	\N	\N	aaron@ifigenija.si	\N	\N	\N
00010000-55dd-c5a3-8f39-08bc61497bd1	testni uporabnik ki dobi vsa posamezna dovoljenja	$2y$05$NS4xMjkyMTcwMzExMjAxRO2ymwxVXTr7U4Ncdn.bN49E8rLw9Jg0O	t	\N	\N	\N	vesna@ifigenija.si	\N	\N	\N
00010000-55dd-c5a2-3d7b-ed3b48aaf5e0	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 2953 (class 0 OID 15728361)
-- Dependencies: 221
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, producent_id, sifra, faza, naslov, podnaslov, delovninaslov, internacionalninaslov, datumzacstudija, stevilovaj, planiranostevilovaj, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, kratkinaslov, maticnioder_id) FROM stdin;
000e0000-55dd-c5a3-adc3-1a44a8036f8f	00160000-55dd-c5a3-b393-12e6c426c552	\N	00140000-55dd-c5a2-0717-5cd22b178f14	\N	0001	produkcija	Sen kresne noči		Sanje	\N	2016-02-01	\N	\N	2016-06-01	1	William Shakespeare	f	2				\N	f		00220000-55dd-c5a3-a031-63e118c45a14
000e0000-55dd-c5a3-144a-2db7fff03210	00160000-55dd-c5a3-c0e9-1ab411c84b65	\N	00140000-55dd-c5a2-b27b-7306e1cf8942	\N	0002	predprodukcija-ideja	Smoletov vrt			\N	2016-01-01	\N	\N	2016-04-20	2	B. Hočevar	f	2				\N	f		00220000-55dd-c5a3-c1f8-4176977b6f2e
000e0000-55dd-c5a3-3192-21452a882e62	\N	\N	00140000-55dd-c5a2-b27b-7306e1cf8942	00190000-55dd-c5a3-6994-b383a73d70d3	0003	postprodukcija	Kisli maček			\N	2016-02-01	\N	\N	2016-04-20	2	Caryl Churchill	t	2				\N	f		00220000-55dd-c5a3-a031-63e118c45a14
000e0000-55dd-c5a3-a2aa-797530dcfdb6	\N	\N	00140000-55dd-c5a2-b27b-7306e1cf8942	00190000-55dd-c5a3-6994-b383a73d70d3	0004	postprodukcija	Vladimir			\N	2017-03-01	\N	\N	2017-04-20	2	Matjaž Zupančič	t	2				\N	f		00220000-55dd-c5a3-a031-63e118c45a14
000e0000-55dd-c5a3-8e76-2503f8388e6c	\N	\N	00140000-55dd-c5a2-b27b-7306e1cf8942	00190000-55dd-c5a3-6994-b383a73d70d3	0005	postprodukcija	Španska princesa			\N	2017-04-01	\N	\N	2017-05-20	1	Nina Kokelj	f	1				\N	f		00220000-55dd-c5a3-86d4-dae2b000220f
000e0000-55dd-c5a3-4dd2-d68df746ea41	\N	\N	00140000-55dd-c5a2-b27b-7306e1cf8942	00190000-55dd-c5a3-6994-b383a73d70d3	0006	postprodukcija	Ne vemo datumov			\N	\N	\N	\N	\N	1	Nandi Frafar	f	1				\N	f		00220000-55dd-c5a3-86d4-dae2b000220f
\.


--
-- TOC entry 2922 (class 0 OID 15728056)
-- Dependencies: 190
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, uprizoritev_id, zaporedna, porocilo) FROM stdin;
00200000-55dd-c5a3-7b96-0452a05cf796	000e0000-55dd-c5a3-144a-2db7fff03210	1	
00200000-55dd-c5a3-bafe-2cfe420100bc	000e0000-55dd-c5a3-144a-2db7fff03210	2	
\.


--
-- TOC entry 2937 (class 0 OID 15728185)
-- Dependencies: 205
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 2947 (class 0 OID 15728287)
-- Dependencies: 215
-- Data for Name: vrstastroska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstastroska (id, skupina, podskupina, naziv, opis) FROM stdin;
003b0000-55dd-c5a2-f1a6-4512ab0b7379	1	0	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE
003b0000-55dd-c5a2-af35-234b5548e9f2	1	1	Storitve varovanja zgradb in prostorov	storitve varovanja zgradb in prostorov (npr. gasilci na predstavah)
003b0000-55dd-c5a2-2e36-3cf14a252691	1	2	Založniške in tiskarske storitve	založniške in tiskarske storitve
003b0000-55dd-c5a2-a774-1e3aea718c52	1	3	Časopisi, revije, knjige in strokovna literatura	časopisi, revije, knjige in strokovna literatura
003b0000-55dd-c5a2-8e9d-8526f5bc454d	1	4	Stroški prevajalskih storitev	stroški prevajalskih storitev
003b0000-55dd-c5a2-97ff-2ee0947d957c	1	5	Stroški oglaševalskih storitev	stroški oglaševalskih storitev
003b0000-55dd-c5a2-43e4-71aff8658306	1	6	Izdatki za reprezentanco	izdatki za reprezentanco
003b0000-55dd-c5a2-2865-68a481744605	2	0	POSEBNI MATERIAL IN STORITVE	POSEBNI MATERIAL IN STORITVE
003b0000-55dd-c5a2-828a-f128ea6d3011	2	1	Drugi posebni material in storitve	drugi posebni material in storitve (npr. za instrumete - navedite)
003b0000-55dd-c5a2-f49f-e4e754ad6069	3	0	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE
003b0000-55dd-c5a2-d919-7d7607eeee3a	3	1	Poštnina in kurirske storitve	poštnina in kurirske storitve
003b0000-55dd-c5a2-02b4-ebbf42af80ee	4	0	PREVOZNI STROŠKI IN STORITVE	PREVOZNI STROŠKI IN STORITVE
003b0000-55dd-c5a2-2f6b-b38456127607	4	1	Goriva in maziva za prevozna sredstva	goriva in maziva za prevozna sredstva
003b0000-55dd-c5a2-fd9c-ad31ee78e4db	4	2	Najem vozil in selitveni stroški	najem vozil in selitveni stroški
003b0000-55dd-c5a2-e829-2d5df46b63ed	4	3	Drugi prevozni in transportni stroški 	drugi prevozni in transportni stroški (navedite)
003b0000-55dd-c5a2-bac1-f478304f9412	5	0	IZDATKI ZA SLUŽBENA POTOVANJA	IZDATKI ZA SLUŽBENA POTOVANJA
003b0000-55dd-c5a2-8f74-19114e337123	5	1	Dnevnice za službena potovanja v državi in tujini	dnevnice za službena potovanja v državi in tujini
003b0000-55dd-c5a2-d474-9e0d81dd54cd	5	2	Hotelske in restavra. storitve v državi in tujini	hotelske in restavra. storitve v državi in tujini
003b0000-55dd-c5a2-5514-f1aafa736f5f	5	3	Stroški prevoza v državi in tujini	stroški prevoza v državi in tujini
003b0000-55dd-c5a2-f079-1947e875e436	5	4	Drugi izdatki za službena potovanja	drugi izdatki za službena potovanja (navedite)
003b0000-55dd-c5a2-8751-581ee7a3b4da	6	0	NAJEMNINE IN ZAKUPNINE	NAJEMNINE IN ZAKUPNINE
003b0000-55dd-c5a2-b175-279adf18d688	6	1	Druge najemnine, zakupnine in licenčnine	druge najemnine, zakupnine in licenčnine (npr. najem notnega materiala, instrumentov - navedite)
003b0000-55dd-c5a2-fb59-0582ca55219d	7	0	DRUGI OPERATIVNI ODHODKI	DRUGI OPERATIVNI ODHODKI
003b0000-55dd-c5a2-2ebd-8f346677fb1d	7	1	Izdatki za strok. izobraževanje zap.	izdatki za strok. izobraževanje zap.(vezani na program. enote)  
\.


--
-- TOC entry 2967 (class 0 OID 15728611)
-- Dependencies: 235
-- Data for Name: vrstazapisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstazapisa (id, oznaka, naziv, aktiven, znacka, ikona, upor, datknj) FROM stdin;
\.


--
-- TOC entry 2966 (class 0 OID 15728583)
-- Dependencies: 234
-- Data for Name: zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapis (id, vrsta_id, datoteka_id, mapa_id, avtor_id, zaklenil_id, tip, zaklenjen, datumzaklepanja, identifier, subject, title, description, coverage, creator, language, date, publisher, relation, rights, source, upor, datknj, standard, lokacija) FROM stdin;
\.


--
-- TOC entry 2968 (class 0 OID 15728623)
-- Dependencies: 236
-- Data for Name: zapislastnik; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapislastnik (id, zapis_id, lastnik, classlastnika, datum, upor, datknj) FROM stdin;
\.


--
-- TOC entry 2944 (class 0 OID 15728256)
-- Dependencies: 212
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, sifra, status, zacetek, konec, tip, delovnaobveza, malica, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci) FROM stdin;
00100000-55dd-c5a4-f3b0-862601ee0506	00090000-55dd-c5a3-41a5-99a18dd73c8c	01	A	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55dd-c5a4-0c77-a9972a1bbe12	00090000-55dd-c5a3-1424-f63eaa57a754	02	A	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55dd-c5a4-3766-b8e41b7f981b	00090000-55dd-c5a3-5e82-d2ca98f65e6e	03	A	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55dd-c5a4-383d-18eca8a00c59	00090000-55dd-c5a3-2ddb-a7f3c7631b3a	04	A	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55dd-c5a4-3798-54c88b6b93a2	00090000-55dd-c5a3-b297-3e5b71129a04	05	A	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55dd-c5a4-2c3e-b8e3294a68c8	00090000-55dd-c5a3-4b67-6ee987e9c0a7	06	A	2010-02-01	2010-02-01	1	2		t	f	f	t
\.


--
-- TOC entry 2924 (class 0 OID 15728088)
-- Dependencies: 192
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id) FROM stdin;
\.


--
-- TOC entry 2952 (class 0 OID 15728351)
-- Dependencies: 220
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, sifra, naziv, opis) FROM stdin;
00140000-55dd-c5a2-0717-5cd22b178f14	01	Drama	drama (SURS 01)
00140000-55dd-c5a2-5a4c-6e133b139512	02	Opera	opera (SURS 02)
00140000-55dd-c5a2-bf51-eb964bb3581a	03	Balet	balet (SURS 03)
00140000-55dd-c5a2-ae57-80d8f0c6ddef	04	Plesne prireditve	plesne prireditve (SURS 04)
00140000-55dd-c5a2-0dd8-6c5f308dbeb1	05	Lutkovno gledališče	lutkovno gledališče (SURS 05)
00140000-55dd-c5a2-b27b-7306e1cf8942	06	Raziskovalno gledališče	raziskovalno gledališče (SURS 06)
00140000-55dd-c5a2-ed6c-b4911778d6ec	07	Drugo	drugo (SURS 07)
\.


--
-- TOC entry 2943 (class 0 OID 15728246)
-- Dependencies: 211
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, sifra, naziv, opis) FROM stdin;
\.


--
-- TOC entry 2446 (class 2606 OID 15727895)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2624 (class 2606 OID 15728408)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2620 (class 2606 OID 15728398)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2597 (class 2606 OID 15728312)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2687 (class 2606 OID 15728663)
-- Name: datoteka_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT datoteka_pkey PRIMARY KEY (id);


--
-- TOC entry 2501 (class 2606 OID 15728078)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2517 (class 2606 OID 15728103)
-- Name: dogodekizven_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodekizven
    ADD CONSTRAINT dogodekizven_pkey PRIMARY KEY (id);


--
-- TOC entry 2654 (class 2606 OID 15728557)
-- Name: drugivir_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT drugivir_pkey PRIMARY KEY (id);


--
-- TOC entry 2480 (class 2606 OID 15728020)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2631 (class 2606 OID 15728463)
-- Name: enotaprograma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT enotaprograma_pkey PRIMARY KEY (id);


--
-- TOC entry 2575 (class 2606 OID 15728242)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2495 (class 2606 OID 15728054)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2514 (class 2606 OID 15728097)
-- Name: gostujoca_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT gostujoca_pkey PRIMARY KEY (id);


--
-- TOC entry 2488 (class 2606 OID 15728034)
-- Name: kontaktnaoseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT kontaktnaoseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2539 (class 2606 OID 15728150)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2681 (class 2606 OID 15728640)
-- Name: mapa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT mapa_pkey PRIMARY KEY (id);


--
-- TOC entry 2685 (class 2606 OID 15728647)
-- Name: mapa_zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT mapa_zapis_pkey PRIMARY KEY (mapa_id, zapis_id);


--
-- TOC entry 2692 (class 2606 OID 15728671)
-- Name: mapaacl_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT mapaacl_pkey PRIMARY KEY (id);


--
-- TOC entry 2551 (class 2606 OID 15728177)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2473 (class 2606 OID 15727992)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2450 (class 2606 OID 15727904)
-- Name: optionvalue_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT optionvalue_pkey PRIMARY KEY (id);


--
-- TOC entry 2453 (class 2606 OID 15727928)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2444 (class 2606 OID 15727884)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2437 (class 2606 OID 15727869)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2554 (class 2606 OID 15728183)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2568 (class 2606 OID 15728218)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2606 (class 2606 OID 15728346)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2462 (class 2606 OID 15727956)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2470 (class 2606 OID 15727980)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2543 (class 2606 OID 15728156)
-- Name: postavkaracuna_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT postavkaracuna_pkey PRIMARY KEY (id);


--
-- TOC entry 2468 (class 2606 OID 15727970)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2493 (class 2606 OID 15728041)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2549 (class 2606 OID 15728168)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2643 (class 2606 OID 15728520)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2645 (class 2606 OID 15728528)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2639 (class 2606 OID 15728511)
-- Name: programdela_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT programdela_pkey PRIMARY KEY (id);


--
-- TOC entry 2650 (class 2606 OID 15728539)
-- Name: programskaenotasklopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT programskaenotasklopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2561 (class 2606 OID 15728200)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2537 (class 2606 OID 15728141)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2531 (class 2606 OID 15728132)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2601 (class 2606 OID 15728334)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2588 (class 2606 OID 15728270)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2429 (class 2606 OID 15727840)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2566 (class 2606 OID 15728209)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2435 (class 2606 OID 15727858)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2439 (class 2606 OID 15727878)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2573 (class 2606 OID 15728227)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2545 (class 2606 OID 15728163)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2519 (class 2606 OID 15728112)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2663 (class 2606 OID 15728581)
-- Name: stevilcenje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenje
    ADD CONSTRAINT stevilcenje_pkey PRIMARY KEY (id);


--
-- TOC entry 2660 (class 2606 OID 15728569)
-- Name: stevilcenjekonfig_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT stevilcenjekonfig_pkey PRIMARY KEY (id);


--
-- TOC entry 2657 (class 2606 OID 15728563)
-- Name: stevilcenjestanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjestanje
    ADD CONSTRAINT stevilcenjestanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2593 (class 2606 OID 15728283)
-- Name: strosekuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT strosekuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2459 (class 2606 OID 15727937)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2525 (class 2606 OID 15728123)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2599 (class 2606 OID 15728323)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2652 (class 2606 OID 15728551)
-- Name: tipprogramskeenote_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipprogramskeenote
    ADD CONSTRAINT tipprogramskeenote_pkey PRIMARY KEY (id);


--
-- TOC entry 2478 (class 2606 OID 15728005)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2431 (class 2606 OID 15727853)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2618 (class 2606 OID 15728377)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2499 (class 2606 OID 15728063)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2557 (class 2606 OID 15728191)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2595 (class 2606 OID 15728295)
-- Name: vrstastroska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstastroska
    ADD CONSTRAINT vrstastroska_pkey PRIMARY KEY (id);


--
-- TOC entry 2674 (class 2606 OID 15728621)
-- Name: vrstazapisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstazapisa
    ADD CONSTRAINT vrstazapisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2671 (class 2606 OID 15728605)
-- Name: zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT zapis_pkey PRIMARY KEY (id);


--
-- TOC entry 2677 (class 2606 OID 15728629)
-- Name: zapislastnik_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT zapislastnik_pkey PRIMARY KEY (id);


--
-- TOC entry 2584 (class 2606 OID 15728261)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2512 (class 2606 OID 15728092)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2610 (class 2606 OID 15728359)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2581 (class 2606 OID 15728254)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2502 (class 1259 OID 15728085)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2589 (class 1259 OID 15728284)
-- Name: idx_11ffe6e05c75296c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e05c75296c ON strosekuprizoritve USING btree (vrstastroska_id);


--
-- TOC entry 2590 (class 1259 OID 15728285)
-- Name: idx_11ffe6e062b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e062b4ffca ON strosekuprizoritve USING btree (uprizoritev_id);


--
-- TOC entry 2591 (class 1259 OID 15728286)
-- Name: idx_11ffe6e06beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e06beede51 ON strosekuprizoritve USING btree (popa_id);


--
-- TOC entry 2678 (class 1259 OID 15728642)
-- Name: idx_14a5d6d3727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d3727aca70 ON mapa USING btree (parent_id);


--
-- TOC entry 2679 (class 1259 OID 15728641)
-- Name: idx_14a5d6d38a4a6c12; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d38a4a6c12 ON mapa USING btree (lastnik_id);


--
-- TOC entry 2460 (class 1259 OID 15727958)
-- Name: idx_1c7adba5ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba5ee4b985a ON popa USING btree (drzava_id);


--
-- TOC entry 2552 (class 1259 OID 15728184)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2665 (class 1259 OID 15728609)
-- Name: idx_1ed92829253c4123; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829253c4123 ON zapis USING btree (avtor_id);


--
-- TOC entry 2666 (class 1259 OID 15728608)
-- Name: idx_1ed9282957ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282957ed422f ON zapis USING btree (mapa_id);


--
-- TOC entry 2667 (class 1259 OID 15728610)
-- Name: idx_1ed9282987ff3295; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282987ff3295 ON zapis USING btree (zaklenil_id);


--
-- TOC entry 2668 (class 1259 OID 15728607)
-- Name: idx_1ed92829a54dbb1f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829a54dbb1f ON zapis USING btree (datoteka_id);


--
-- TOC entry 2669 (class 1259 OID 15728606)
-- Name: idx_1ed92829ef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829ef943358 ON zapis USING btree (vrsta_id);


--
-- TOC entry 2546 (class 1259 OID 15728170)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2547 (class 1259 OID 15728169)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2497 (class 1259 OID 15728064)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2576 (class 1259 OID 15728243)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2577 (class 1259 OID 15728245)
-- Name: idx_23aeb9586b361365; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9586b361365 ON funkcija USING btree (tipfunkcije_id);


--
-- TOC entry 2578 (class 1259 OID 15728244)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2485 (class 1259 OID 15728036)
-- Name: idx_2942b10710389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b10710389148 ON kontaktnaoseba USING btree (oseba_id);


--
-- TOC entry 2486 (class 1259 OID 15728035)
-- Name: idx_2942b1076beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b1076beede51 ON kontaktnaoseba USING btree (popa_id);


--
-- TOC entry 2648 (class 1259 OID 15728540)
-- Name: idx_2d901816d6bc69d6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2d901816d6bc69d6 ON programskaenotasklopa USING btree (programrazno_id);


--
-- TOC entry 2602 (class 1259 OID 15728348)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2603 (class 1259 OID 15728349)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2604 (class 1259 OID 15728350)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2675 (class 1259 OID 15728630)
-- Name: idx_2eaff9dcaf91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2eaff9dcaf91ecd ON zapislastnik USING btree (zapis_id);


--
-- TOC entry 2611 (class 1259 OID 15728382)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2612 (class 1259 OID 15728379)
-- Name: idx_344a77a7c3b0d59; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a7c3b0d59 ON uprizoritev USING btree (maticnioder_id);


--
-- TOC entry 2613 (class 1259 OID 15728383)
-- Name: idx_344a77a853a965c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a853a965c ON uprizoritev USING btree (producent_id);


--
-- TOC entry 2614 (class 1259 OID 15728381)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2615 (class 1259 OID 15728380)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2475 (class 1259 OID 15728007)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2476 (class 1259 OID 15728006)
-- Name: idx_37f6541a6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a6beede51 ON trr USING btree (popa_id);


--
-- TOC entry 2451 (class 1259 OID 15727931)
-- Name: idx_466966d769e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_466966d769e8d4 ON oseba USING btree (naslov_id);


--
-- TOC entry 2564 (class 1259 OID 15728210)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2515 (class 1259 OID 15728098)
-- Name: idx_4a45d07962b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4a45d07962b4ffca ON gostujoca USING btree (uprizoritev_id);


--
-- TOC entry 2441 (class 1259 OID 15727885)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2442 (class 1259 OID 15727886)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2569 (class 1259 OID 15728230)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2570 (class 1259 OID 15728229)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2571 (class 1259 OID 15728228)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2489 (class 1259 OID 15728042)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2490 (class 1259 OID 15728044)
-- Name: idx_602f6e466f7e7a33; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e466f7e7a33 ON predstava USING btree (gostujoc_id);


--
-- TOC entry 2491 (class 1259 OID 15728043)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2658 (class 1259 OID 15728571)
-- Name: idx_6054e804ff55f926; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_6054e804ff55f926 ON stevilcenjekonfig USING btree (stevilcenje_id);


--
-- TOC entry 2526 (class 1259 OID 15728136)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2527 (class 1259 OID 15728134)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2528 (class 1259 OID 15728133)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2529 (class 1259 OID 15728135)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2432 (class 1259 OID 15727859)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2433 (class 1259 OID 15727860)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2555 (class 1259 OID 15728192)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2688 (class 1259 OID 15728664)
-- Name: idx_781826c67e3c61f9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_781826c67e3c61f9 ON datoteka USING btree (owner_id);


--
-- TOC entry 2689 (class 1259 OID 15728672)
-- Name: idx_7adc957157ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc957157ed422f ON mapaacl USING btree (mapa_id);


--
-- TOC entry 2690 (class 1259 OID 15728673)
-- Name: idx_7adc9571fa6311ef; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc9571fa6311ef ON mapaacl USING btree (perm_id);


--
-- TOC entry 2541 (class 1259 OID 15728157)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2585 (class 1259 OID 15728271)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2586 (class 1259 OID 15728272)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2632 (class 1259 OID 15728468)
-- Name: idx_8787a0e54ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e54ae1cd1c ON enotaprograma USING btree (gostitelj_id);


--
-- TOC entry 2633 (class 1259 OID 15728467)
-- Name: idx_8787a0e55d0da56c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e55d0da56c ON enotaprograma USING btree (drzavagostovanja_id);


--
-- TOC entry 2634 (class 1259 OID 15728464)
-- Name: idx_8787a0e562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e562b4ffca ON enotaprograma USING btree (uprizoritev_id);


--
-- TOC entry 2635 (class 1259 OID 15728465)
-- Name: idx_8787a0e57222d84b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e57222d84b ON enotaprograma USING btree (tipprogramskeenote_id);


--
-- TOC entry 2636 (class 1259 OID 15728466)
-- Name: idx_8787a0e5771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e5771ec7bd ON enotaprograma USING btree (program_dela_id);


--
-- TOC entry 2464 (class 1259 OID 15727972)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2465 (class 1259 OID 15727971)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2466 (class 1259 OID 15727973)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2558 (class 1259 OID 15728204)
-- Name: idx_952dd21969e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd21969e8d4 ON prostor USING btree (naslov_id);


--
-- TOC entry 2559 (class 1259 OID 15728203)
-- Name: idx_952dd2196beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd2196beede51 ON prostor USING btree (popa_id);


--
-- TOC entry 2640 (class 1259 OID 15728521)
-- Name: idx_97af082e38c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e38c06eb ON produkcijadelitev USING btree (enotaprograma_id);


--
-- TOC entry 2641 (class 1259 OID 15728522)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2625 (class 1259 OID 15728412)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2626 (class 1259 OID 15728413)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2627 (class 1259 OID 15728410)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2628 (class 1259 OID 15728411)
-- Name: idx_a4b7244fa4976613; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fa4976613 ON alternacija USING btree (zaposlitev_id);


--
-- TOC entry 2582 (class 1259 OID 15728262)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2532 (class 1259 OID 15728145)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2533 (class 1259 OID 15728144)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2534 (class 1259 OID 15728142)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2535 (class 1259 OID 15728143)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2621 (class 1259 OID 15728400)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2622 (class 1259 OID 15728399)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2637 (class 1259 OID 15728512)
-- Name: idx_c81bc37f3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c81bc37f3a0e32e3 ON programdela USING btree (sezona_id);


--
-- TOC entry 2496 (class 1259 OID 15728055)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2655 (class 1259 OID 15728558)
-- Name: idx_e7d4cf2638c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e7d4cf2638c06eb ON drugivir USING btree (enotaprograma_id);


--
-- TOC entry 2682 (class 1259 OID 15728648)
-- Name: idx_e9f8ee8257ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee8257ed422f ON mapa_zapis USING btree (mapa_id);


--
-- TOC entry 2683 (class 1259 OID 15728649)
-- Name: idx_e9f8ee82af91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee82af91ecd ON mapa_zapis USING btree (zapis_id);


--
-- TOC entry 2447 (class 1259 OID 15727906)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2448 (class 1259 OID 15727905)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2456 (class 1259 OID 15727938)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2457 (class 1259 OID 15727939)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2521 (class 1259 OID 15728126)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2522 (class 1259 OID 15728125)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2523 (class 1259 OID 15728124)
-- Name: idx_fef7d84ba81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84ba81ccef6 ON terminstoritve USING btree (dogodek_id);


--
-- TOC entry 2503 (class 1259 OID 15728087)
-- Name: konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX konec ON dogodek USING btree (konec);


--
-- TOC entry 2504 (class 1259 OID 15728083)
-- Name: uniq_11e93b5d10398482; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d10398482 ON dogodek USING btree (dogodek_izven_id);


--
-- TOC entry 2505 (class 1259 OID 15728080)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2506 (class 1259 OID 15728081)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2507 (class 1259 OID 15728079)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2508 (class 1259 OID 15728084)
-- Name: uniq_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2509 (class 1259 OID 15728082)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2463 (class 1259 OID 15727957)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2481 (class 1259 OID 15728021)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2482 (class 1259 OID 15728023)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2483 (class 1259 OID 15728022)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2484 (class 1259 OID 15728024)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2540 (class 1259 OID 15728151)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2607 (class 1259 OID 15728347)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2616 (class 1259 OID 15728378)
-- Name: uniq_344a77a559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_344a77a559828a3 ON uprizoritev USING btree (sifra);


--
-- TOC entry 2454 (class 1259 OID 15727929)
-- Name: uniq_466966d7559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7559828a3 ON oseba USING btree (sifra);


--
-- TOC entry 2455 (class 1259 OID 15727930)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2579 (class 1259 OID 15728255)
-- Name: uniq_5216fcb0559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5216fcb0559828a3 ON zvrstuprizoritve USING btree (sifra);


--
-- TOC entry 2664 (class 1259 OID 15728582)
-- Name: uniq_5a434fbc559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5a434fbc559828a3 ON stevilcenje USING btree (sifra);


--
-- TOC entry 2474 (class 1259 OID 15727993)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2661 (class 1259 OID 15728570)
-- Name: uniq_6054e804889a7556; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_6054e804889a7556 ON stevilcenjekonfig USING btree (dok);


--
-- TOC entry 2562 (class 1259 OID 15728202)
-- Name: uniq_952dd21937854736; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21937854736 ON prostor USING btree (naziv);


--
-- TOC entry 2563 (class 1259 OID 15728201)
-- Name: uniq_952dd219559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd219559828a3 ON prostor USING btree (sifra);


--
-- TOC entry 2629 (class 1259 OID 15728409)
-- Name: uniq_a4b7244f559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a4b7244f559828a3 ON alternacija USING btree (sifra);


--
-- TOC entry 2471 (class 1259 OID 15727981)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2608 (class 1259 OID 15728360)
-- Name: uniq_cede8e36559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_cede8e36559828a3 ON zvrstsurs USING btree (sifra);


--
-- TOC entry 2672 (class 1259 OID 15728622)
-- Name: uniq_de1c8aa1d55226c7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_de1c8aa1d55226c7 ON vrstazapisa USING btree (oznaka);


--
-- TOC entry 2646 (class 1259 OID 15728529)
-- Name: uniq_e6fc2028559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc2028559828a3 ON produkcijskahisa USING btree (sifra);


--
-- TOC entry 2647 (class 1259 OID 15728530)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2520 (class 1259 OID 15728113)
-- Name: uniq_ecc8f8c5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ecc8f8c5559828a3 ON sezona USING btree (sifra);


--
-- TOC entry 2440 (class 1259 OID 15727879)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2510 (class 1259 OID 15728086)
-- Name: zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2718 (class 2606 OID 15728809)
-- Name: fk_11e93b5d10398482; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d10398482 FOREIGN KEY (dogodek_izven_id) REFERENCES dogodekizven(id);


--
-- TOC entry 2721 (class 2606 OID 15728794)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2720 (class 2606 OID 15728799)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2716 (class 2606 OID 15728819)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2722 (class 2606 OID 15728789)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2717 (class 2606 OID 15728814)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2719 (class 2606 OID 15728804)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2755 (class 2606 OID 15728974)
-- Name: fk_11ffe6e05c75296c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e05c75296c FOREIGN KEY (vrstastroska_id) REFERENCES vrstastroska(id);


--
-- TOC entry 2754 (class 2606 OID 15728979)
-- Name: fk_11ffe6e062b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e062b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2753 (class 2606 OID 15728984)
-- Name: fk_11ffe6e06beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e06beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2788 (class 2606 OID 15729154)
-- Name: fk_14a5d6d3727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d3727aca70 FOREIGN KEY (parent_id) REFERENCES mapa(id);


--
-- TOC entry 2789 (class 2606 OID 15729149)
-- Name: fk_14a5d6d38a4a6c12; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d38a4a6c12 FOREIGN KEY (lastnik_id) REFERENCES uporabniki(id);


--
-- TOC entry 2703 (class 2606 OID 15728724)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2739 (class 2606 OID 15728904)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2783 (class 2606 OID 15729134)
-- Name: fk_1ed92829253c4123; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829253c4123 FOREIGN KEY (avtor_id) REFERENCES uporabniki(id);


--
-- TOC entry 2784 (class 2606 OID 15729129)
-- Name: fk_1ed9282957ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282957ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2782 (class 2606 OID 15729139)
-- Name: fk_1ed9282987ff3295; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282987ff3295 FOREIGN KEY (zaklenil_id) REFERENCES uporabniki(id);


--
-- TOC entry 2785 (class 2606 OID 15729124)
-- Name: fk_1ed92829a54dbb1f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829a54dbb1f FOREIGN KEY (datoteka_id) REFERENCES datoteka(id);


--
-- TOC entry 2786 (class 2606 OID 15729119)
-- Name: fk_1ed92829ef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829ef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstazapisa(id);


--
-- TOC entry 2737 (class 2606 OID 15728899)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2738 (class 2606 OID 15728894)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2715 (class 2606 OID 15728784)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2749 (class 2606 OID 15728944)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2747 (class 2606 OID 15728954)
-- Name: fk_23aeb9586b361365; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9586b361365 FOREIGN KEY (tipfunkcije_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2748 (class 2606 OID 15728949)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2709 (class 2606 OID 15728759)
-- Name: fk_2942b10710389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b10710389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2710 (class 2606 OID 15728754)
-- Name: fk_2942b1076beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b1076beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2735 (class 2606 OID 15728884)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2779 (class 2606 OID 15729104)
-- Name: fk_2d901816d6bc69d6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT fk_2d901816d6bc69d6 FOREIGN KEY (programrazno_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2758 (class 2606 OID 15728989)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2757 (class 2606 OID 15728994)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2756 (class 2606 OID 15728999)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 2787 (class 2606 OID 15729144)
-- Name: fk_2eaff9dcaf91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT fk_2eaff9dcaf91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id);


--
-- TOC entry 2760 (class 2606 OID 15729019)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2763 (class 2606 OID 15729004)
-- Name: fk_344a77a7c3b0d59; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a7c3b0d59 FOREIGN KEY (maticnioder_id) REFERENCES prostor(id);


--
-- TOC entry 2759 (class 2606 OID 15729024)
-- Name: fk_344a77a853a965c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a853a965c FOREIGN KEY (producent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2761 (class 2606 OID 15729014)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2762 (class 2606 OID 15729009)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2707 (class 2606 OID 15728749)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2708 (class 2606 OID 15728744)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2699 (class 2606 OID 15728709)
-- Name: fk_466966d769e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d769e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2700 (class 2606 OID 15728704)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2743 (class 2606 OID 15728924)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2723 (class 2606 OID 15728824)
-- Name: fk_4a45d07962b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT fk_4a45d07962b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2696 (class 2606 OID 15728684)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2695 (class 2606 OID 15728689)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2744 (class 2606 OID 15728939)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2745 (class 2606 OID 15728934)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2746 (class 2606 OID 15728929)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2713 (class 2606 OID 15728764)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2711 (class 2606 OID 15728774)
-- Name: fk_602f6e466f7e7a33; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e466f7e7a33 FOREIGN KEY (gostujoc_id) REFERENCES gostujoca(id);


--
-- TOC entry 2712 (class 2606 OID 15728769)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2781 (class 2606 OID 15729114)
-- Name: fk_6054e804ff55f926; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT fk_6054e804ff55f926 FOREIGN KEY (stevilcenje_id) REFERENCES stevilcenje(id);


--
-- TOC entry 2727 (class 2606 OID 15728859)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2729 (class 2606 OID 15728849)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2730 (class 2606 OID 15728844)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2728 (class 2606 OID 15728854)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2694 (class 2606 OID 15728674)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2693 (class 2606 OID 15728679)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2740 (class 2606 OID 15728909)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2792 (class 2606 OID 15729169)
-- Name: fk_781826c67e3c61f9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT fk_781826c67e3c61f9 FOREIGN KEY (owner_id) REFERENCES uporabniki(id);


--
-- TOC entry 2794 (class 2606 OID 15729174)
-- Name: fk_7adc957157ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc957157ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2793 (class 2606 OID 15729179)
-- Name: fk_7adc9571fa6311ef; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc9571fa6311ef FOREIGN KEY (perm_id) REFERENCES permission(id);


--
-- TOC entry 2736 (class 2606 OID 15728889)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2752 (class 2606 OID 15728964)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2751 (class 2606 OID 15728969)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2770 (class 2606 OID 15729079)
-- Name: fk_8787a0e54ae1cd1c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e54ae1cd1c FOREIGN KEY (gostitelj_id) REFERENCES popa(id);


--
-- TOC entry 2771 (class 2606 OID 15729074)
-- Name: fk_8787a0e55d0da56c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e55d0da56c FOREIGN KEY (drzavagostovanja_id) REFERENCES drza(id);


--
-- TOC entry 2774 (class 2606 OID 15729059)
-- Name: fk_8787a0e562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2773 (class 2606 OID 15729064)
-- Name: fk_8787a0e57222d84b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e57222d84b FOREIGN KEY (tipprogramskeenote_id) REFERENCES tipprogramskeenote(id);


--
-- TOC entry 2772 (class 2606 OID 15729069)
-- Name: fk_8787a0e5771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e5771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2705 (class 2606 OID 15728734)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2706 (class 2606 OID 15728729)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2704 (class 2606 OID 15728739)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2741 (class 2606 OID 15728919)
-- Name: fk_952dd21969e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd21969e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2742 (class 2606 OID 15728914)
-- Name: fk_952dd2196beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd2196beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2777 (class 2606 OID 15729089)
-- Name: fk_97af082e38c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e38c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2776 (class 2606 OID 15729094)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2767 (class 2606 OID 15729049)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2766 (class 2606 OID 15729054)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2769 (class 2606 OID 15729039)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 2768 (class 2606 OID 15729044)
-- Name: fk_a4b7244fa4976613; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fa4976613 FOREIGN KEY (zaposlitev_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2750 (class 2606 OID 15728959)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2731 (class 2606 OID 15728879)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2732 (class 2606 OID 15728874)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2734 (class 2606 OID 15728864)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2733 (class 2606 OID 15728869)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2764 (class 2606 OID 15729034)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2765 (class 2606 OID 15729029)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2775 (class 2606 OID 15729084)
-- Name: fk_c81bc37f3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT fk_c81bc37f3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2714 (class 2606 OID 15728779)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2778 (class 2606 OID 15729099)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2780 (class 2606 OID 15729109)
-- Name: fk_e7d4cf2638c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT fk_e7d4cf2638c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2791 (class 2606 OID 15729159)
-- Name: fk_e9f8ee8257ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee8257ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id) ON DELETE CASCADE;


--
-- TOC entry 2790 (class 2606 OID 15729164)
-- Name: fk_e9f8ee82af91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee82af91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id) ON DELETE CASCADE;


--
-- TOC entry 2697 (class 2606 OID 15728699)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2698 (class 2606 OID 15728694)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2702 (class 2606 OID 15728714)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2701 (class 2606 OID 15728719)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2724 (class 2606 OID 15728839)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2725 (class 2606 OID 15728834)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2726 (class 2606 OID 15728829)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- Completed on 2015-08-26 15:56:54 CEST

--
-- PostgreSQL database dump complete
--

