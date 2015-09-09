--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.9
-- Dumped by pg_dump version 9.3.9
-- Started on 2015-09-09 08:35:48 CEST

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
-- TOC entry 2976 (class 0 OID 0)
-- Dependencies: 240
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_with_oids = false;

--
-- TOC entry 180 (class 1259 OID 18133893)
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
-- TOC entry 225 (class 1259 OID 18134412)
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
-- TOC entry 224 (class 1259 OID 18134395)
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
-- TOC entry 218 (class 1259 OID 18134303)
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
-- TOC entry 238 (class 1259 OID 18134636)
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
-- TOC entry 194 (class 1259 OID 18134071)
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
-- TOC entry 196 (class 1259 OID 18134102)
-- Name: dogodeksplosni; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodeksplosni (
    id uuid NOT NULL
);


--
-- TOC entry 232 (class 1259 OID 18134562)
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
-- TOC entry 189 (class 1259 OID 18134014)
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
-- TOC entry 226 (class 1259 OID 18134425)
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
-- TOC entry 212 (class 1259 OID 18134235)
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
-- TOC entry 192 (class 1259 OID 18134050)
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
-- TOC entry 190 (class 1259 OID 18134031)
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
-- TOC entry 201 (class 1259 OID 18134149)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 236 (class 1259 OID 18134617)
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
-- TOC entry 237 (class 1259 OID 18134629)
-- Name: mapa_zapis; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE mapa_zapis (
    mapa_id uuid NOT NULL,
    zapis_id uuid NOT NULL
);


--
-- TOC entry 239 (class 1259 OID 18134651)
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
-- TOC entry 205 (class 1259 OID 18134174)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 187 (class 1259 OID 18133988)
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
-- TOC entry 181 (class 1259 OID 18133902)
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
-- TOC entry 182 (class 1259 OID 18133913)
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
    email character varying(255) DEFAULT NULL::character varying,
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
-- TOC entry 177 (class 1259 OID 18133867)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 179 (class 1259 OID 18133886)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 206 (class 1259 OID 18134181)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 210 (class 1259 OID 18134215)
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
-- TOC entry 221 (class 1259 OID 18134344)
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
    jeavtorskepravice boolean,
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
-- TOC entry 184 (class 1259 OID 18133946)
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
-- TOC entry 186 (class 1259 OID 18133980)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 202 (class 1259 OID 18134155)
-- Name: postavkaracuna; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE postavkaracuna (
    id uuid NOT NULL,
    racun_id uuid
);


--
-- TOC entry 185 (class 1259 OID 18133965)
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
-- TOC entry 191 (class 1259 OID 18134043)
-- Name: predstava; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE predstava (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    gostovanje_id uuid
);


--
-- TOC entry 204 (class 1259 OID 18134167)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 228 (class 1259 OID 18134523)
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
-- TOC entry 229 (class 1259 OID 18134533)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    sifra character varying(4) NOT NULL,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 227 (class 1259 OID 18134480)
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
-- TOC entry 230 (class 1259 OID 18134541)
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
-- TOC entry 208 (class 1259 OID 18134196)
-- Name: prostor; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prostor (
    id uuid NOT NULL,
    popa_id uuid,
    naslov_id uuid,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) NOT NULL,
    jeprizorisce boolean,
    jematicnioder boolean,
    seplanira boolean DEFAULT false NOT NULL,
    kapaciteta integer,
    opis text
);


--
-- TOC entry 200 (class 1259 OID 18134140)
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
-- TOC entry 199 (class 1259 OID 18134130)
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
-- TOC entry 220 (class 1259 OID 18134333)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying,
    status character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 215 (class 1259 OID 18134270)
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
-- TOC entry 174 (class 1259 OID 18133838)
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
-- TOC entry 173 (class 1259 OID 18133836)
-- Name: revizije_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE revizije_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2977 (class 0 OID 0)
-- Dependencies: 173
-- Name: revizije_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE revizije_id_seq OWNED BY revizije.id;


--
-- TOC entry 209 (class 1259 OID 18134209)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 178 (class 1259 OID 18133876)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 176 (class 1259 OID 18133860)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 211 (class 1259 OID 18134223)
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
-- TOC entry 203 (class 1259 OID 18134161)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 197 (class 1259 OID 18134107)
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
-- TOC entry 172 (class 1259 OID 18133825)
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
-- TOC entry 171 (class 1259 OID 18133817)
-- Name: stevilcenjekonfig; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjekonfig (
    id uuid NOT NULL,
    stevilcenje_id uuid,
    dok character varying(100) DEFAULT NULL::character varying
);


--
-- TOC entry 170 (class 1259 OID 18133812)
-- Name: stevilcenjestanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjestanje (
    id uuid NOT NULL,
    objid uuid NOT NULL,
    leto integer NOT NULL,
    stevilka integer
);


--
-- TOC entry 216 (class 1259 OID 18134280)
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
-- TOC entry 183 (class 1259 OID 18133938)
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
-- TOC entry 198 (class 1259 OID 18134117)
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
-- TOC entry 219 (class 1259 OID 18134321)
-- Name: tipfunkcije; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tipfunkcije (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    ime character varying(255) NOT NULL,
    opis text,
    imezenski character varying(255) DEFAULT NULL::character varying,
    podrocje character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 231 (class 1259 OID 18134551)
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
-- TOC entry 188 (class 1259 OID 18134000)
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
-- TOC entry 175 (class 1259 OID 18133847)
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
-- TOC entry 223 (class 1259 OID 18134370)
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
-- TOC entry 193 (class 1259 OID 18134061)
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
-- TOC entry 207 (class 1259 OID 18134188)
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
-- TOC entry 217 (class 1259 OID 18134294)
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
-- TOC entry 234 (class 1259 OID 18134597)
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
-- TOC entry 233 (class 1259 OID 18134569)
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
-- TOC entry 235 (class 1259 OID 18134609)
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
-- TOC entry 214 (class 1259 OID 18134260)
-- Name: zaposlitev; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zaposlitev (
    id uuid NOT NULL,
    oseba_id uuid,
    sifra character varying(10) NOT NULL,
    status character varying(10) NOT NULL,
    delovnomesto character varying(255) NOT NULL,
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
-- TOC entry 195 (class 1259 OID 18134097)
-- Name: zasedenost; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zasedenost (
    id uuid NOT NULL
);


--
-- TOC entry 222 (class 1259 OID 18134360)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 213 (class 1259 OID 18134250)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 2178 (class 2604 OID 18133841)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 2910 (class 0 OID 18133893)
-- Dependencies: 180
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
\.


--
-- TOC entry 2955 (class 0 OID 18134412)
-- Dependencies: 225
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, zaposlitev_id, oseba_id, pogodba_id, sifra, zaposlen, zacetek, konec, opomba, sort, privzeti, aktivna, imapogodbo, pomembna) FROM stdin;
000c0000-55ef-d343-1af1-5daca74df447	000d0000-55ef-d343-7d9e-a73b30f325a3	\N	00090000-55ef-d343-713e-70788b01502a	000b0000-55ef-d343-1c3f-dab7aac1ebed	0001	f	\N	\N	\N	3	t	\N	t	t
000c0000-55ef-d343-fb1f-82acbdaaa309	000d0000-55ef-d343-3179-db2edacfb177	00100000-55ef-d343-a119-b9e67a361728	00090000-55ef-d343-b1b8-ba76b5d27db6	\N	0002	t	2016-01-01	\N	\N	8	t	\N	f	f
000c0000-55ef-d343-665f-c2d21a3d76f2	000d0000-55ef-d343-a7d3-8c8930793359	00100000-55ef-d343-ae4b-0961055002e0	00090000-55ef-d343-2bd4-3f22ce6d4ffb	\N	0003	t	\N	2015-09-09	\N	2	t	\N	f	f
000c0000-55ef-d343-7033-d29649b755c4	000d0000-55ef-d343-916d-9757a46b60a6	\N	00090000-55ef-d343-3d82-9e5366185db1	\N	0004	f	2016-01-01	2016-01-01	\N	26	t	\N	f	f
000c0000-55ef-d343-8c77-b34e3a361bba	000d0000-55ef-d343-7398-2794f436ec2c	\N	00090000-55ef-d343-8eeb-9d73bbe36437	\N	0005	f	2016-01-01	2016-01-01	\N	7	t	\N	f	f
000c0000-55ef-d343-bb60-7c76b8050b23	000d0000-55ef-d343-1400-285b388504cd	\N	00090000-55ef-d343-23be-f7ebcb4ccf5c	000b0000-55ef-d343-7977-e2cc5804541d	0006	f	2016-01-01	2016-01-01	\N	1	t	\N	t	t
000c0000-55ef-d343-eddb-459601a96255	000d0000-55ef-d343-75cb-07f2c760c503	00100000-55ef-d343-a8fd-58a3d1626baf	00090000-55ef-d343-3566-59bf797f0d03	\N	0007	t	2016-01-01	2016-01-01	\N	14	t	\N	f	t
000c0000-55ef-d343-c9f9-2a362ae9c097	000d0000-55ef-d343-ea0b-83488d7afbf7	\N	00090000-55ef-d343-ee21-322e2d6d62f5	000b0000-55ef-d343-846e-9d34a3b2d2bb	0008	f	2016-01-01	2016-01-01	\N	12	t	\N	t	t
000c0000-55ef-d343-5213-8e51755d5d99	000d0000-55ef-d343-75cb-07f2c760c503	00100000-55ef-d343-26c5-732ed2791f73	00090000-55ef-d343-974a-7812a5def94f	\N	0009	t	2017-01-01	2017-01-01	\N	15	t	\N	f	t
000c0000-55ef-d343-c016-44289c056222	000d0000-55ef-d343-75cb-07f2c760c503	00100000-55ef-d343-9287-1c8fc00155ba	00090000-55ef-d343-b344-fbc9e689b9e6	\N	0010	t	\N	2015-09-09	\N	16	f	\N	f	t
000c0000-55ef-d343-a79c-b5e558cd23a3	000d0000-55ef-d343-75cb-07f2c760c503	00100000-55ef-d343-1f0d-a479d372563a	00090000-55ef-d343-afc7-1ceecf345849	\N	0011	t	2017-01-01	\N	\N	17	f	\N	f	t
000c0000-55ef-d343-32c7-2b37609fdadd	000d0000-55ef-d343-95ec-0821fdadb9b9	\N	00090000-55ef-d343-b1b8-ba76b5d27db6	000b0000-55ef-d343-3964-bdcc7f567357	0012	f	\N	\N	\N	2	t	\N	t	t
\.


--
-- TOC entry 2954 (class 0 OID 18134395)
-- Dependencies: 224
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 2948 (class 0 OID 18134303)
-- Dependencies: 218
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, stevilka, naslov, avtor, podnaslov, jezik, naslovizvirnika, internacionalninaslov, datumprejema, moskevloge, zenskevloge, prevajalec, povzetekvsebine, letoizida, krajizida, zaloznik) FROM stdin;
00160000-55ef-d342-f3ea-2c990591df23	0001	Sen kresne noči	William Shakespeare		slovenščina	A Midsummer Night's Dream	\N	2015-04-26	5	5	Milan Jesih	Nastopajo Titanija, Hipolita, Oberon, ...	\N	\N	\N
00160000-55ef-d342-8f78-8d4679c918c7	0002	Bratje Karamazovi	Fjodor Mihajlovič Dostojevski		slovenščina	Bratja Karamazjovji	\N	2015-12-04	4	1	Vladimir Levstik	Svetovna uspešnica	\N	\N	\N
00160000-55ef-d342-2413-bf86338214be	0003	Smoletov Vrt	Berta Hočevar		slovenščina		\N	2015-05-26	2	8			\N	\N	\N
\.


--
-- TOC entry 2968 (class 0 OID 18134636)
-- Dependencies: 238
-- Data for Name: datoteka; Type: TABLE DATA; Schema: public; Owner: -
--

COPY datoteka (id, owner_id, filename, transfers, size, format, hash, createdat, uploadedat, upor, datknj) FROM stdin;
\.


--
-- TOC entry 2924 (class 0 OID 18134071)
-- Dependencies: 194
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_splosni_id, prostor_id, sezona_id, planiranzacetek, allday, zacetek, konec, status, razred, termin, title) FROM stdin;
00180000-55ef-d343-6ff9-e67c0356d580	\N	\N	00200000-55ef-d343-03cc-2c5c284c5b0f	\N	\N	\N	\N	2015-06-26 10:00:00	f	2015-06-26 10:00:00	2015-06-26 12:00:00	3			
00180000-55ef-d343-11bb-ebe7d3bb4660	\N	\N	00200000-55ef-d343-e378-859b35a918d6	\N	\N	\N	\N	2015-06-27 10:00:00	f	2015-06-27 10:00:00	2015-06-27 12:00:00	4			
00180000-55ef-d343-e43a-ae9ce4396fb7	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	f	2015-08-01 20:00:00	2015-08-01 23:00:00	5			
00180000-55ef-d343-48fa-bc4d4ea10d90	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	f	2015-08-01 20:00:00	2015-08-01 23:00:00	2			
00180000-55ef-d343-f990-7cddb06b75a1	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	f	2015-08-01 20:00:00	2015-08-01 23:00:00	7			
\.


--
-- TOC entry 2926 (class 0 OID 18134102)
-- Dependencies: 196
-- Data for Name: dogodeksplosni; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodeksplosni (id) FROM stdin;
\.


--
-- TOC entry 2962 (class 0 OID 18134562)
-- Dependencies: 232
-- Data for Name: drugivir; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drugivir (id, znesek, opis, mednarodni, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 2919 (class 0 OID 18134014)
-- Dependencies: 189
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-55ef-d341-ad8f-b06b6acfe01e	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-55ef-d341-0cc7-e41d89793ddf	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-55ef-d341-c7df-47d874a749c0	AL	ALB	008	Albania 	Albanija	\N
00040000-55ef-d341-1120-e98e95082313	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-55ef-d341-a906-67a71e3a501a	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-55ef-d341-f76b-961ce2dfb7b3	AD	AND	020	Andorra 	Andora	\N
00040000-55ef-d341-e226-60329a739175	AO	AGO	024	Angola 	Angola	\N
00040000-55ef-d341-9532-cbe5e84a016d	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-55ef-d341-4a1a-61e04256b404	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-55ef-d341-34b8-f9b2e8b4077b	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-55ef-d341-cbf7-114d1ed4be10	AR	ARG	032	Argentina 	Argenitna	\N
00040000-55ef-d341-0693-48487ac87860	AM	ARM	051	Armenia 	Armenija	\N
00040000-55ef-d341-0290-396d96e66a05	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-55ef-d341-859f-be97a9467c8e	AU	AUS	036	Australia 	Avstralija	\N
00040000-55ef-d341-63aa-75c76ffcf003	AT	AUT	040	Austria 	Avstrija	\N
00040000-55ef-d341-674e-5aac9496c6a0	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-55ef-d341-2444-5bf6977faa2d	BS	BHS	044	Bahamas 	Bahami	\N
00040000-55ef-d341-a245-fb3e834c6251	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-55ef-d341-f483-9fb2c883e7ea	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-55ef-d341-143f-c88b87a400df	BB	BRB	052	Barbados 	Barbados	\N
00040000-55ef-d341-ef29-7c3f2435cf4e	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-55ef-d341-01ec-c95761f8d95e	BE	BEL	056	Belgium 	Belgija	\N
00040000-55ef-d341-00df-6f6f3e341897	BZ	BLZ	084	Belize 	Belize	\N
00040000-55ef-d341-08fd-0f2b8a285e10	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-55ef-d341-a7fa-7c7b5189036e	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-55ef-d341-2166-ec8e18500a58	BT	BTN	064	Bhutan 	Butan	\N
00040000-55ef-d341-4425-ab36b07e82a4	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-55ef-d341-2a31-b33f913cfabf	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-55ef-d341-6978-64bd6c11906f	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-55ef-d341-db0a-1477e99a7aad	BW	BWA	072	Botswana 	Bocvana	\N
00040000-55ef-d341-f1af-7455cfcf2a24	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-55ef-d341-0181-f3f0019df611	BR	BRA	076	Brazil 	Brazilija	\N
00040000-55ef-d341-500c-3f857c70bb16	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-55ef-d341-361d-013911a8d64a	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-55ef-d341-a12f-59e5df71a63e	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-55ef-d341-9771-0f0facbcc7d1	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-55ef-d341-7372-a5e07eb7ecad	BI	BDI	108	Burundi 	Burundi 	\N
00040000-55ef-d341-b44a-a1c79d60e2d7	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-55ef-d341-2fdb-5d4195ba50e4	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-55ef-d341-4d6e-b8a5c53d5567	CA	CAN	124	Canada 	Kanada	\N
00040000-55ef-d341-e91b-6ba37805f7ee	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-55ef-d341-27d8-a9475570d69e	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-55ef-d341-cab5-e24b8492baa8	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-55ef-d341-d707-a53671a445b1	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-55ef-d341-db3b-25f0188b22b3	CL	CHL	152	Chile 	Čile	\N
00040000-55ef-d341-25d1-d1616b4980a4	CN	CHN	156	China 	Kitajska	\N
00040000-55ef-d341-3c13-1d5bd450c2c9	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-55ef-d341-6915-8b1fb2dcc762	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-55ef-d341-0671-312a10e0ffc5	CO	COL	170	Colombia 	Kolumbija	\N
00040000-55ef-d341-442f-7af402112789	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-55ef-d341-d2a8-82b057aea81c	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-55ef-d341-0f08-37b9d33c6f54	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-55ef-d341-3e89-348c14721d5a	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-55ef-d341-8e02-d0d843048c36	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-55ef-d341-149d-77138d36888c	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-55ef-d341-a8ba-eef99b7f2954	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-55ef-d341-d44e-4bbbee68c9d7	CU	CUB	192	Cuba 	Kuba	\N
00040000-55ef-d341-bf7a-c3b4ce1313f4	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-55ef-d341-fd23-da31f7b18341	CY	CYP	196	Cyprus 	Ciper	\N
00040000-55ef-d341-a1c4-6b3d3d653837	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-55ef-d341-ad90-483b6c8ea7b5	DK	DNK	208	Denmark 	Danska	\N
00040000-55ef-d341-f113-67e98b093984	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-55ef-d341-8164-e4f1ed61745f	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-55ef-d341-b393-4f68bbeebeb0	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-55ef-d341-6e01-8fa5f4eaeffc	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-55ef-d341-8304-7b7463dee73e	EG	EGY	818	Egypt 	Egipt	\N
00040000-55ef-d341-25ce-e85678464567	SV	SLV	222	El Salvador 	Salvador	\N
00040000-55ef-d341-b331-30e9f57d8baa	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-55ef-d341-5617-ed874d5011fc	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-55ef-d341-00df-af69560cfa2a	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-55ef-d341-f827-044a190a2561	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-55ef-d341-c382-474e2187da2d	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-55ef-d341-35c2-1c98ce937af0	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-55ef-d341-4883-c68c22981db3	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-55ef-d341-bfb3-c05026a072f0	FI	FIN	246	Finland 	Finska	\N
00040000-55ef-d341-1a17-a720dcfc63a5	FR	FRA	250	France 	Francija	\N
00040000-55ef-d341-967e-7d9a6c90e7e7	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-55ef-d341-390b-75a7d5bb049c	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-55ef-d341-1b12-1e53bead1fe0	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-55ef-d341-c6af-60f84b43da4f	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-55ef-d341-f228-8d9c4747993c	GA	GAB	266	Gabon 	Gabon	\N
00040000-55ef-d341-3ffb-dda59a1790e7	GM	GMB	270	Gambia 	Gambija	\N
00040000-55ef-d341-3672-29911d6cbaad	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-55ef-d341-9a37-dcb1fb9a1c82	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-55ef-d341-2d64-6ad6cd79f587	GH	GHA	288	Ghana 	Gana	\N
00040000-55ef-d341-36ae-d40599d91d85	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-55ef-d341-82ff-b3cd2d06c04a	GR	GRC	300	Greece 	Grčija	\N
00040000-55ef-d341-f536-d755d6a9b5ff	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-55ef-d341-e19f-bbc0c7bcb8bb	GD	GRD	308	Grenada 	Grenada	\N
00040000-55ef-d341-c2b6-17e60c7b9730	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-55ef-d341-2e81-f5ce0e286010	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-55ef-d341-7a1d-c395eb184d05	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-55ef-d341-5bb0-a6ec22966aa3	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-55ef-d341-45d6-097b96f82cf9	GN	GIN	324	Guinea 	Gvineja	\N
00040000-55ef-d341-7b37-dd4a870bdd27	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-55ef-d341-4241-2b0b21b53337	GY	GUY	328	Guyana 	Gvajana	\N
00040000-55ef-d341-b1f8-ed4bd2c3f030	HT	HTI	332	Haiti 	Haiti	\N
00040000-55ef-d341-bf51-4253900b78f8	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-55ef-d341-1942-f7111968ac87	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-55ef-d341-cbeb-5ecc399962b9	HN	HND	340	Honduras 	Honduras	\N
00040000-55ef-d341-cde1-1d8366bb7744	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-55ef-d341-56f9-cb66ec75b8f2	HU	HUN	348	Hungary 	Madžarska	\N
00040000-55ef-d341-7979-0a4591ec2bab	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-55ef-d341-4a4a-b9bc06d2287b	IN	IND	356	India 	Indija	\N
00040000-55ef-d341-e401-42e66317ce38	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-55ef-d341-a5ab-12d846c3a1c3	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-55ef-d341-4263-20f15230caa6	IQ	IRQ	368	Iraq 	Irak	\N
00040000-55ef-d341-36aa-e5414f909d01	IE	IRL	372	Ireland 	Irska	\N
00040000-55ef-d341-1243-3609b4ca8c4a	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-55ef-d341-bce4-5e3687116690	IL	ISR	376	Israel 	Izrael	\N
00040000-55ef-d341-7bd7-16ba7a8c7a33	IT	ITA	380	Italy 	Italija	\N
00040000-55ef-d341-f349-af0d6c223360	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-55ef-d341-b58d-3df823bf842f	JP	JPN	392	Japan 	Japonska	\N
00040000-55ef-d341-e67b-440f3bf14e64	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-55ef-d341-0a65-2fb3862e8fd4	JO	JOR	400	Jordan 	Jordanija	\N
00040000-55ef-d341-a4cc-6dd1443f08e1	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-55ef-d341-1561-8967475d6a67	KE	KEN	404	Kenya 	Kenija	\N
00040000-55ef-d341-1217-e8afe45d7c75	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-55ef-d341-5438-0f3c85a57d1a	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-55ef-d341-fd83-e80e5a20882d	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-55ef-d341-b4f4-2ae1570cc006	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-55ef-d341-eca9-0400a8bd61f2	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-55ef-d341-bf44-0d77fed6e542	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-55ef-d341-933e-4c1a1bfcc56d	LV	LVA	428	Latvia 	Latvija	\N
00040000-55ef-d341-f3fc-11c9066cbf89	LB	LBN	422	Lebanon 	Libanon	\N
00040000-55ef-d341-27df-112b86398c82	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-55ef-d341-1a28-a8720d879189	LR	LBR	430	Liberia 	Liberija	\N
00040000-55ef-d341-c2bb-9a19b60ab4b6	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-55ef-d341-a075-75abcdb8ee4a	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-55ef-d341-842f-eefce52bbf92	LT	LTU	440	Lithuania 	Litva	\N
00040000-55ef-d341-69d6-7e7736998c21	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-55ef-d341-f0e3-9396b490a2eb	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-55ef-d341-94c5-56a3949426f3	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-55ef-d341-ba9c-127df9152581	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-55ef-d341-00be-0bf2ac9d1002	MW	MWI	454	Malawi 	Malavi	\N
00040000-55ef-d341-1820-b261d104bcc8	MY	MYS	458	Malaysia 	Malezija	\N
00040000-55ef-d341-de21-9a5b8b330290	MV	MDV	462	Maldives 	Maldivi	\N
00040000-55ef-d341-5bfd-23e793678906	ML	MLI	466	Mali 	Mali	\N
00040000-55ef-d341-fa42-25e66f08b7a2	MT	MLT	470	Malta 	Malta	\N
00040000-55ef-d341-4198-ff3fd81e2fca	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-55ef-d341-674a-f90639d139de	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-55ef-d341-e86f-2ccc93ad58f7	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-55ef-d341-c849-402b77aa74b5	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-55ef-d341-ba52-9bea4e9b4bea	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-55ef-d341-e265-830334b108d6	MX	MEX	484	Mexico 	Mehika	\N
00040000-55ef-d341-7914-c2a3e9a0e71f	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-55ef-d341-6de9-1148c08612ac	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-55ef-d341-7ad2-403381401e89	MC	MCO	492	Monaco 	Monako	\N
00040000-55ef-d341-6653-3e91d0a58724	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-55ef-d341-6e57-267880cbe75f	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-55ef-d341-79fc-473812d3c623	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-55ef-d341-2132-cb3eaadc0d82	MA	MAR	504	Morocco 	Maroko	\N
00040000-55ef-d341-bcd5-4124538f8257	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-55ef-d341-6448-7fef2d3bfa0c	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-55ef-d341-f838-2c4fb7cccdcc	NA	NAM	516	Namibia 	Namibija	\N
00040000-55ef-d341-539e-552c5aebd279	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-55ef-d341-31e4-4530642cd2e7	NP	NPL	524	Nepal 	Nepal	\N
00040000-55ef-d341-4bdc-8f84af2e5411	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-55ef-d341-d742-b73255de6ea9	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-55ef-d341-efb2-d3f55998f18f	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-55ef-d341-034c-477c2dcadf30	NE	NER	562	Niger 	Niger 	\N
00040000-55ef-d341-b6db-a35fd8af162f	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-55ef-d341-665b-61345a6a32f1	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-55ef-d341-d85c-0df103873e48	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-55ef-d341-a88a-b824a05f7e45	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-55ef-d341-4016-91d96f3a9de3	NO	NOR	578	Norway 	Norveška	\N
00040000-55ef-d341-4862-97cbf9c51064	OM	OMN	512	Oman 	Oman	\N
00040000-55ef-d341-1b3c-27e25a607921	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-55ef-d341-3e6c-1903f6270081	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-55ef-d341-4be3-eb0703c88e39	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-55ef-d341-ee6c-d03e8bf64b5f	PA	PAN	591	Panama 	Panama	\N
00040000-55ef-d341-bf1f-f09842386e3d	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-55ef-d341-92e5-5e224e75e962	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-55ef-d341-1aee-f7c4bf4a16c4	PE	PER	604	Peru 	Peru	\N
00040000-55ef-d341-745e-a52eb62f71bf	PH	PHL	608	Philippines 	Filipini	\N
00040000-55ef-d341-c5db-30c8302c25e7	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-55ef-d341-b3b9-7a88c7812131	PL	POL	616	Poland 	Poljska	\N
00040000-55ef-d341-3b89-1d698dc3b800	PT	PRT	620	Portugal 	Portugalska	\N
00040000-55ef-d341-14fa-5f45111bad3e	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-55ef-d341-bb81-c767cc75ea37	QA	QAT	634	Qatar 	Katar	\N
00040000-55ef-d341-3a4c-c7459b45d1c7	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-55ef-d341-dd38-874abf420150	RO	ROU	642	Romania 	Romunija	\N
00040000-55ef-d341-7c1e-8f00c9f72761	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-55ef-d341-47ef-49933cf73be5	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-55ef-d341-dcc8-010dce08b615	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-55ef-d341-ca4e-1cda3e7f3ffc	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-55ef-d341-e600-fc9300bad020	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-55ef-d341-5e40-9a5c352f856a	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-55ef-d341-06de-69e033db46c2	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-55ef-d341-6096-5f061b5d46eb	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-55ef-d341-0c28-d1646a02f106	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-55ef-d341-0688-21a6b330dbaa	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-55ef-d341-fba7-341ee8b32038	SM	SMR	674	San Marino 	San Marino	\N
00040000-55ef-d341-5f14-04071e268e5d	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-55ef-d341-5852-d500017a69af	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-55ef-d341-517b-51da8430231c	SN	SEN	686	Senegal 	Senegal	\N
00040000-55ef-d341-e97d-d5dbc02cddc0	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-55ef-d341-7e11-a63ee7f82c50	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-55ef-d341-cd09-eca864f980d4	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-55ef-d341-852d-5b7ee1da2d1b	SG	SGP	702	Singapore 	Singapur	\N
00040000-55ef-d341-679c-4695334351fe	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-55ef-d341-00cc-0c6b70e7dbe3	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-55ef-d341-c063-5e7f3280d07a	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-55ef-d341-3bfb-4c03091590cc	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-55ef-d341-faed-284c6b9e177e	SO	SOM	706	Somalia 	Somalija	\N
00040000-55ef-d341-7db0-1770744af736	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-55ef-d341-c79e-2b104a62ad1b	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-55ef-d341-f9b5-ed8431123b57	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-55ef-d341-5f1a-55e3025c5037	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-55ef-d341-5e2b-bb5ae500ff95	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-55ef-d341-8c07-43c6dd49eb85	SD	SDN	729	Sudan 	Sudan	\N
00040000-55ef-d341-6e46-6409b5d2c9e3	SR	SUR	740	Suriname 	Surinam	\N
00040000-55ef-d341-049b-28eb51a608c2	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-55ef-d341-5116-90a7ff3e75d8	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-55ef-d341-b234-3fef628fa1c3	SE	SWE	752	Sweden 	Švedska	\N
00040000-55ef-d341-06de-3dc772e25880	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-55ef-d341-9310-7de8db8d33e0	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-55ef-d341-6993-e4ffc3f61049	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-55ef-d341-3bf1-73d8965d9db3	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-55ef-d341-1a5a-05f7243da8fa	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-55ef-d341-6368-54726d462b77	TH	THA	764	Thailand 	Tajska	\N
00040000-55ef-d341-c15e-e27ecf09e82f	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-55ef-d341-16f7-baa5f21829f3	TG	TGO	768	Togo 	Togo	\N
00040000-55ef-d341-abb8-63d56f2e0ff0	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-55ef-d341-0c99-1a57e5038b53	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-55ef-d341-49dc-341fa73f9e36	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-55ef-d341-dd27-6f510dea8cd6	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-55ef-d341-0f76-f630c1fad413	TR	TUR	792	Turkey 	Turčija	\N
00040000-55ef-d341-efe5-6dcb6e45ff27	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-55ef-d341-fa38-86f35d8e696e	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-55ef-d341-eb12-14b25085e889	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-55ef-d341-9f2a-8377e89dca53	UG	UGA	800	Uganda 	Uganda	\N
00040000-55ef-d341-85e5-bb2894a32f51	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-55ef-d341-f365-3d6e370a3671	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-55ef-d341-4f6e-179e28702c40	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-55ef-d341-f5b0-8039f4ff444d	US	USA	840	United States 	Združene države Amerike	\N
00040000-55ef-d341-080f-ed332ce922ab	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-55ef-d341-d4de-2d6e1d7cb10b	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-55ef-d341-8a22-5f438f4b8f37	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-55ef-d341-87a9-eec73dfe198c	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-55ef-d341-e074-12be7c69c6e0	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-55ef-d341-6c43-6ce02e64eeb1	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-55ef-d341-66a1-b02e9d8dee87	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-55ef-d341-629d-2af2585015fb	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-55ef-d341-f1d4-bffb6622eb96	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-55ef-d341-9e46-1550cf0c9feb	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-55ef-d341-dbdd-bbd2f3a5035e	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-55ef-d341-926e-b5436d8fabe7	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-55ef-d341-c5e1-76e194de0957	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 2956 (class 0 OID 18134425)
-- Dependencies: 226
-- Data for Name: enotaprograma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY enotaprograma (id, uprizoritev_id, program_dela_id, gostitelj_id, celotnavrednost, nasdelez, celotnavrednostmat, celotnavrednostgostovsz, zaproseno, lastnasredstva, avtorskihonorarji, avtorskihonorarjisamoz, tantieme, avtorskepravice, materialni, imakoprodukcije, vlozekgostitelja, drugijavni, stzaposlenih, stzaposumet, stzaposdrug, sthonorarnih, sthonorarnihigr, sthonorarnihigrtujjz, sthonorarnihigrsamoz, obiskdoma, obiskkopr, obiskgost, obiskzamejo, obiskint, obiskkoprint, ponovidoma, ponovikopr, ponovizamejo, ponovigost, ponovikoprint, ponoviint, naziv, kpe, sort, tipprogramskeenote_id, tip, strosekodkpred, stroskiostali, krajgostovanja, ustanova, datumgostovanja, transportnistroski, dnevprvzad, drzavagostovanja_id, stpe, zvrst, stpredstav, stokroglihmiz, stpredstavitev, stdelavnic, stdrugidogodki, stprodukcij, caspriprave, casizvedbe, prizorisca, umetvodja, programskotelo, sttujihselektorjev) FROM stdin;
002f0000-55ef-d343-5084-2c23d949ee63	000e0000-55ef-d343-7fde-e1e1c218aa92	\N	\N	9000.30	9000.30	9000.30	0.00	3600.12	5299.98	4000.40	1000.40	200.20	200.30	4599.40	\N	0.00	100.20	0	2	2	2	2	2	\N	40	0	0	0	0	0	1	0	0	0	0	0		0.00	\N	002b0000-55ef-d341-d3a5-35ccd3eeb839	premiera	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-55ef-d343-9ea4-0dd643597cd9	000e0000-55ef-d343-19c0-c42e7025fb9f	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	\N	60	0	0	0	0	0	1	0	0	0	0	0		0.00	\N	002b0000-55ef-d341-4dc0-7cf8bf644b03	premiera	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-55ef-d343-db2f-051f27b76c73	000e0000-55ef-d343-6941-92c11cabce6e	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	\N	60	0	0	0	0	0	1	0	0	0	0	0		0.00	\N	002b0000-55ef-d341-d3a5-35ccd3eeb839	premiera	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-55ef-d343-50d4-cbd24dda6c0d	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-54.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	54.20	5	0	0	3	0	0	\N	22	0	0	0	0	0	0	0	0	0	0	0	Urejanje portala	0.00	10	\N	razno	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-55ef-d343-4d12-f9792cc01a65	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-31.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	31.20	5	0	0	3	0	0	\N	202	0	0	0	0	0	0	0	0	0	0	0	Delavnice otroci	0.00	8	\N	razno	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 2942 (class 0 OID 18134235)
-- Dependencies: 212
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, podrocje, vodjaekipe, naziv, komentar, velikost, pomembna, sort, seplanira, dovoliprekrivanje, maxprekrivanj, tipfunkcije_id) FROM stdin;
000d0000-55ef-d343-7d9e-a73b30f325a3	000e0000-55ef-d343-19c0-c42e7025fb9f	000c0000-55ef-d343-1af1-5daca74df447	igralec	\N	Tezej	glavna vloga	velika	t	5	t	t	\N	000f0000-55ef-d341-1d16-e593d658f6d0
000d0000-55ef-d343-3179-db2edacfb177	000e0000-55ef-d343-19c0-c42e7025fb9f	000c0000-55ef-d343-fb1f-82acbdaaa309	umetnik	\N	Režija		velika	t	8	t	t	\N	000f0000-55ef-d341-fdb4-5acffd1c169a
000d0000-55ef-d343-a7d3-8c8930793359	000e0000-55ef-d343-19c0-c42e7025fb9f	000c0000-55ef-d343-665f-c2d21a3d76f2	inspicient	t	Inšpicient			t	8	t	t	\N	000f0000-55ef-d341-fcf0-9f24961d4761
000d0000-55ef-d343-916d-9757a46b60a6	000e0000-55ef-d343-19c0-c42e7025fb9f	000c0000-55ef-d343-7033-d29649b755c4	tehnik	t	Tehnični vodja			t	8	t	t	\N	000f0000-55ef-d341-972e-560ff471497e
000d0000-55ef-d343-7398-2794f436ec2c	000e0000-55ef-d343-19c0-c42e7025fb9f	000c0000-55ef-d343-8c77-b34e3a361bba	tehnik	\N	Razsvetljava			t	3	t	t	\N	000f0000-55ef-d341-972e-560ff471497e
000d0000-55ef-d343-1400-285b388504cd	000e0000-55ef-d343-19c0-c42e7025fb9f	000c0000-55ef-d343-bb60-7c76b8050b23	igralec	\N	Helena	glavna vloga	velika	t	5	t	t	\N	000f0000-55ef-d341-1d16-e593d658f6d0
000d0000-55ef-d343-75cb-07f2c760c503	000e0000-55ef-d343-19c0-c42e7025fb9f	000c0000-55ef-d343-5213-8e51755d5d99	igralec	\N	Hipolita	glavna vloga	velika	t	6	t	t	\N	000f0000-55ef-d341-1d16-e593d658f6d0
000d0000-55ef-d343-ea0b-83488d7afbf7	000e0000-55ef-d343-19c0-c42e7025fb9f	000c0000-55ef-d343-c9f9-2a362ae9c097	umetnik	\N	Lektoriranje			t	22	t	t	\N	000f0000-55ef-d341-07cc-c8be732b29ad
000d0000-55ef-d343-95ec-0821fdadb9b9	000e0000-55ef-d343-19c0-c42e7025fb9f	000c0000-55ef-d343-32c7-2b37609fdadd	umetnik	\N	Avtor	Avtor besedila		t	2	t	f	\N	000f0000-55ef-d341-1f62-b4e7177c7723
\.


--
-- TOC entry 2922 (class 0 OID 18134050)
-- Dependencies: 192
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta, zamejstvo, kraj) FROM stdin;
\.


--
-- TOC entry 2920 (class 0 OID 18134031)
-- Dependencies: 190
-- Data for Name: kontaktnaoseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kontaktnaoseba (id, popa_id, oseba_id, status, funkcija, opis) FROM stdin;
00260000-55ef-d343-0b92-0f8228bc0222	00080000-55ef-d342-4553-e65a870dd394	00090000-55ef-d343-b344-fbc9e689b9e6	AK		igralka
\.


--
-- TOC entry 2931 (class 0 OID 18134149)
-- Dependencies: 201
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 2966 (class 0 OID 18134617)
-- Dependencies: 236
-- Data for Name: mapa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa (id, lastnik_id, parent_id, ime, komentar, caskreiranja, casspremembe, javnidostop, upor, datknj) FROM stdin;
\.


--
-- TOC entry 2967 (class 0 OID 18134629)
-- Dependencies: 237
-- Data for Name: mapa_zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa_zapis (mapa_id, zapis_id) FROM stdin;
\.


--
-- TOC entry 2969 (class 0 OID 18134651)
-- Dependencies: 239
-- Data for Name: mapaacl; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapaacl (id, mapa_id, perm_id, dostop, upor, datknj) FROM stdin;
\.


--
-- TOC entry 2935 (class 0 OID 18134174)
-- Dependencies: 205
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 2917 (class 0 OID 18133988)
-- Dependencies: 187
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-55ef-d342-7a70-e13a0277f19f	popa.stakli	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-55ef-d342-ee49-69cf74b19b78	oseba.spol	array	a:2:{s:1:"M";a:1:{s:5:"label";s:6:"Moški";}s:1:"Z";a:1:{s:5:"label";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-55ef-d342-75bf-53b84f28b4f5	telefonska.vrsta	array	a:3:{s:7:"mobilna";a:1:{s:5:"label";s:7:"Mobilni";}s:6:"domaca";a:1:{s:5:"label";s:6:"Domač";}s:6:"fiksna";a:1:{s:5:"label";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-55ef-d342-aec7-c5f7fc3bf9df	kontaktnaoseba.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status kontaktne osebe
00000000-55ef-d342-79f3-f7087eb6a3f7	dogodek.status	array	a:7:{i:100;a:1:{s:5:"label";s:11:"Dolgoročno";}i:200;a:1:{s:5:"label";s:9:"Planirano";}i:300;a:1:{s:5:"label";s:8:"Fiksiran";}i:400;a:1:{s:5:"label";s:17:"Potrjen - interno";}i:500;a:1:{s:5:"label";s:15:"Potrjen - javno";}i:600;a:1:{s:5:"label";s:10:"Zaključen";}i:700;a:1:{s:5:"label";s:7:"Obdelan";}}	f	t	t	\N	Tabela statusa dogodkov
00000000-55ef-d342-5074-228493fb9d1e	dogodek.razred	array	a:5:{i:100;a:2:{s:5:"label";s:9:"Predstava";s:4:"type";s:9:"predstava";}i:200;a:2:{s:5:"label";s:4:"Vaja";s:4:"type";s:4:"vaja";}i:300;a:2:{s:5:"label";s:10:"Gostovanje";s:4:"type";s:10:"gostovanje";}i:400;a:2:{s:5:"label";s:10:"Zasedenost";s:4:"type";s:10:"zasedenost";}i:500;a:2:{s:5:"label";s:16:"Splošni dogodek";s:4:"type";s:8:"splošni";}}	f	t	t	\N	Tabela razredov dogodkov, ki jih aplikacija podpira
00000000-55ef-d342-c169-9b137f3a165f	uprizoritev.faza	array	a:6:{s:20:"predprodukcija-ideja";a:1:{s:5:"label";s:16:"Dolgoročni plan";}s:20:"predprodukcija-poziv";a:1:{s:5:"label";s:29:"Predprodukcija, v fazi poziva";}s:30:"predprodukcija-potrjen_program";a:1:{s:5:"label";s:34:"Predprodukcija, program je potrjen";}s:10:"produkcija";a:1:{s:5:"label";s:10:"Produkcija";}s:14:"postprodukcija";a:1:{s:5:"label";s:14:"Postprodukcija";}s:5:"arhiv";a:1:{s:5:"label";s:10:"Arhivirana";}}	f	t	f	\N	Faza uprizoritve
00000000-55ef-d342-78f7-106622c7ed5b	funkcija.podrocje	array	a:4:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}}	f	t	f	\N	Področje funkcije
00000000-55ef-d342-a5c4-0db020e23fc6	tipfunkcije.podrocje	array	a:4:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}}	f	t	f	\N	Področje funkcije
00000000-55ef-d342-7553-b9a9dbfae93c	funkcija.velikost	array	a:4:{s:7:"stataza";a:1:{s:5:"label";s:8:"Stataža";}s:4:"mala";a:1:{s:5:"label";s:21:"Mala vloga / funkcija";}s:7:"srednja";a:1:{s:5:"label";s:24:"Srednja vloga / funkcija";}s:6:"velika";a:1:{s:5:"label";s:23:"Velika vloga / funkcija";}}	f	t	f	\N	Velikost funkcije
00000000-55ef-d342-0154-205d698ff869	zaposlitev.status	array	a:2:{s:1:"A";a:1:{s:5:"label";s:7:"Aktivna";}s:1:"N";a:1:{s:5:"label";s:9:"Neaktivna";}}	f	t	f	\N	Status zaposlitve
00000000-55ef-d342-6039-15b3cfb047da	produkcijskahisa.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktivna";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktivna";}}	f	t	f	\N	Status produkcijske hiše
00000000-55ef-d342-3809-8607e7096633	strosekuprizoritve.tipstroska	array	a:1:{s:10:"materialni";a:1:{s:5:"label";s:19:"Materialni strošek";}}	f	t	f	\N	Tip stroška
00000000-55ef-d342-d5f0-066ce4f721d7	fsacl.dostop	array	a:4:{s:1:"X";a:1:{s:5:"label";s:12:"Brez dostopa";}s:1:"R";a:1:{s:5:"label";s:11:"Samo branje";}s:2:"RW";a:1:{s:5:"label";s:17:"Branje in pisanje";}s:3:"RWD";a:1:{s:5:"label";s:26:"Branje pisanje in brisanje";}}	f	t	f	\N	ACL Javni dostop
00000000-55ef-d343-0f37-9f920a466202	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-55ef-d343-2b82-be20c9faa14f	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-55ef-d343-4c22-1bd9a1c583e2	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-55ef-d343-3e46-f65734855a80	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-55ef-d343-e24e-606fb1937954	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
00000000-55ef-d344-016e-e2880ca641ff	application.tenant.maticnopodjetje	string	s:4:"1001";	f	t	f		Šifra matičnega podjetja v Popa in ProdukcijskaHisa
\.


--
-- TOC entry 2911 (class 0 OID 18133902)
-- Dependencies: 181
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-55ef-d343-1b55-fabaf7307a31	00000000-55ef-d343-0f37-9f920a466202	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-55ef-d343-bd3e-949a53edbad3	00000000-55ef-d343-0f37-9f920a466202	00010000-55ef-d342-da40-db669275036d	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-55ef-d343-8055-ce3221823504	00000000-55ef-d343-2b82-be20c9faa14f	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 2912 (class 0 OID 18133913)
-- Dependencies: 182
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naslov_id, sifra, naziv, ime, priimek, funkcija, srednjeime, polnoime, psevdonim, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
00090000-55ef-d343-713e-70788b01502a	\N	\N	0001	g.	Janez	Novak	a	Peter	Janez Peter Novak	Jani	jani.novak@xxx.xx	1958-01-06	0601958000000	123456789	M	Jani Janez	Slovenija	Slovenija	Ljubljana
00090000-55ef-d343-3d82-9e5366185db1	00010000-55ef-d343-0f22-637176ff62c8	\N	0002	dr.	Anton	Horvat	b		Anton  Horvat	Tona	anton.horvat@xxx.xx	1968-02-12	1202968111111	234567890	M		Slovenija	Slovenija	Maribor
00090000-55ef-d343-2bd4-3f22ce6d4ffb	00010000-55ef-d343-364d-8e092df6f9f1	\N	0003		Ivan	Kovačič	c		Ivan  Kovačič	Ivo	ivan.kovacic@xxx.xx	1975-03-26	2603976222222	345678901	M		Slovenija	Slovenija	Celje
00090000-55ef-d343-974a-7812a5def94f	00010000-55ef-d343-66d0-dcc075ed5388	\N	0004	prof.	Jožef	Krajnc	d		Jožef  Krajnc	Joža	jozef.krajnc@xxx.xx	1971-04-30	3004971333333	456789012	M		Slovenija	Slovenija	Kranj
00090000-55ef-d343-4180-180c2713d289	\N	\N	0005		Marko	Zupančič	e		Marko  Zupančič		marko.zupancic@xxx.xx	1984-05-07	0705984444444	567890123	M		Slovenija	Slovenija	Koper
00090000-55ef-d343-23be-f7ebcb4ccf5c	\N	\N	0006	ga.	Marija	Kovač	f		Marija  Kovač		marija.kovac@xxx.xx	1962-06-19	1906962444444	678901234	Z		Slovenija	Slovenija	Murska Sobota
00090000-55ef-d343-afc7-1ceecf345849	\N	\N	0007	ga.	Ana	Potočnik	g		Ana  Potočnik		ana.potocnik@xxx.xx	1975-07-24	2407975555555	789012345	Z		Slovenija	Slovenija	Novo Mesto
00090000-55ef-d343-3566-59bf797f0d03	\N	\N	0008	ga.	Maja	Mlakar	h		Maja  Mlakar		maja.mlakar@xxx.xx	1986-08-02	0208986666666	890123456	Z		Slovenija	Slovenija	Nova Gorica
00090000-55ef-d343-b344-fbc9e689b9e6	00010000-55ef-d343-b7ce-965aa1fa87c5	\N	0009		Irena	Kos	i		Irena  Kos		irena.kos@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Ptuj
00090000-55ef-d343-b1b8-ba76b5d27db6	\N	\N	0010		Mojca	Vidmar	J		Mojca  Vidmar		mojca.vidmar@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Idrija
00090000-55ef-d343-3785-336720e7e6d1	\N	\N	0011		xx	write protected12345	a		xx  write protected12345		xx@xxx.xx	\N	\N	\N	Z		\N	\N	\N
00090000-55ef-d343-8eeb-9d73bbe36437	\N	\N	0012		Luka	Golob	luč	a	Luka a Golob		luka.golob@xxx.xx	\N	\N	\N	M		\N	\N	\N
00090000-55ef-d343-ee21-322e2d6d62f5	00010000-55ef-d343-cfed-bfc2d5007092	\N	0013		Tatjana	Božič	tajnica	a	Tatjana a Božič		tatjana.bozic@xxx.xx	\N	\N	\N	Z		\N	\N	\N
\.


--
-- TOC entry 2907 (class 0 OID 18133867)
-- Dependencies: 177
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-55ef-d341-e03d-a493c5528b06	Aaa-read	Aaa (User,Role,Permission) - branje	f
00030000-55ef-d341-8e3b-5326afedcc2e	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	f
00030000-55ef-d341-443a-3c218d08e3b2	TerminStoritve-vse	TerminStoritve - spreminjanje vseh zapisov	f
00030000-55ef-d341-f08d-7d66f0feeed5	Dogodek-readVse	Dogodek - branje vseh, ne glede na status dogodka	f
00030000-55ef-d341-f9a7-df494637d8d6	Oseba-vse	Oseba - vse - za testiranje assert	f
00030000-55ef-d341-5148-71151ba20afb	ProgramDela-lock	ProgramDela - zaklepanje	f
00030000-55ef-d341-9dd3-ea61ce83aa60	ProgramDela-unlock	ProgramDela - odklepanje	f
00030000-55ef-d341-28a7-47041e0372f3	Abonma-read	Abonma - branje	f
00030000-55ef-d341-1132-d72b8f99d122	Abonma-write	Abonma - spreminjanje	f
00030000-55ef-d341-8d12-63ef923cb519	Alternacija-read	Alternacija - branje	f
00030000-55ef-d341-716e-bd80d6938661	Alternacija-write	Alternacija - spreminjanje	f
00030000-55ef-d341-7bff-b73ff75ea796	Arhivalija-read	Arhivalija - branje	f
00030000-55ef-d341-eae1-18597718cfaa	Arhivalija-write	Arhivalija - spreminjanje	f
00030000-55ef-d341-44d7-c0ce6017145a	Besedilo-read	Besedilo - branje	f
00030000-55ef-d341-5758-777bd9eb4b36	Besedilo-write	Besedilo - spreminjanje	f
00030000-55ef-d341-5529-3f38155386f3	DogodekIzven-read	DogodekIzven - branje	f
00030000-55ef-d341-6384-983c57daef21	DogodekIzven-write	DogodekIzven - spreminjanje	f
00030000-55ef-d341-d452-41ddf048abe2	Dogodek-read	Dogodek - branje	f
00030000-55ef-d341-b536-4f36bbae4184	Dogodek-write	Dogodek - spreminjanje	f
00030000-55ef-d341-5f6c-00f1b2b6c863	DrugiVir-read	DrugiVir - branje	f
00030000-55ef-d341-01a0-b95f457adec7	DrugiVir-write	DrugiVir - spreminjanje	f
00030000-55ef-d341-04a7-9039adf71fe6	Drzava-read	Drzava - branje	f
00030000-55ef-d341-0d12-b398e77fa3bf	Drzava-write	Drzava - spreminjanje	f
00030000-55ef-d341-06a4-86ffadb84e21	EnotaPrograma-read	EnotaPrograma - branje	f
00030000-55ef-d341-478f-85590a0ebc6c	EnotaPrograma-write	EnotaPrograma - spreminjanje	f
00030000-55ef-d341-da01-9be65aed5f59	Funkcija-read	Funkcija - branje	f
00030000-55ef-d341-edce-48fb0feb902e	Funkcija-write	Funkcija - spreminjanje	f
00030000-55ef-d341-2e3b-42aa84392dbc	Gostovanje-read	Gostovanje - branje	f
00030000-55ef-d341-7d2c-330262655765	Gostovanje-write	Gostovanje - spreminjanje	f
00030000-55ef-d341-8518-8e7f106b9cc9	Gostujoca-read	Gostujoca - branje	f
00030000-55ef-d341-47fc-0c122783c8b2	Gostujoca-write	Gostujoca - spreminjanje	f
00030000-55ef-d341-8de3-0b284793576b	KontaktnaOseba-read	KontaktnaOseba - branje	f
00030000-55ef-d341-ac90-9237656eff59	KontaktnaOseba-write	KontaktnaOseba - spreminjanje	f
00030000-55ef-d341-944f-952d1b193db5	Kupec-read	Kupec - branje	f
00030000-55ef-d341-7f39-28b8f648af33	Kupec-write	Kupec - spreminjanje	f
00030000-55ef-d341-b4c9-cc99b5efade5	NacinPlacina-read	NacinPlacina - branje	f
00030000-55ef-d341-605d-7a482d428592	NacinPlacina-write	NacinPlacina - spreminjanje	f
00030000-55ef-d341-8550-32d97afb8eb9	Option-read	Option - branje	f
00030000-55ef-d341-ef76-59febb2bf98b	Option-write	Option - spreminjanje	f
00030000-55ef-d341-9a72-51f66f477aec	OptionValue-read	OptionValue - branje	f
00030000-55ef-d341-8395-d0b55bd58c7d	OptionValue-write	OptionValue - spreminjanje	f
00030000-55ef-d341-4e11-8e899a3a58e9	Oseba-read	Oseba - branje	f
00030000-55ef-d341-b9a2-ed47025a0f86	Oseba-write	Oseba - spreminjanje	f
00030000-55ef-d341-61d3-2fea455f25c2	PlacilniInstrument-read	PlacilniInstrument - branje	f
00030000-55ef-d341-3d1d-83a3d0ced085	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	f
00030000-55ef-d341-c21e-e02644d63c12	PodrocjeSedenja-read	PodrocjeSedenja - branje	f
00030000-55ef-d341-d697-ff83a3376ba2	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	f
00030000-55ef-d341-d554-51a2b2349091	Pogodba-read	Pogodba - branje	f
00030000-55ef-d341-2207-82684241a24a	Pogodba-write	Pogodba - spreminjanje	f
00030000-55ef-d341-39e2-3edcbb98ce31	Popa-read	Popa - branje	f
00030000-55ef-d341-69f0-d213ea994133	Popa-write	Popa - spreminjanje	f
00030000-55ef-d341-51a9-58c92d9f60cc	Posta-read	Posta - branje	f
00030000-55ef-d341-b764-7d5141a7aa23	Posta-write	Posta - spreminjanje	f
00030000-55ef-d341-055d-e67ceab87a26	PostavkaRacuna-read	PostavkaRacuna - branje	f
00030000-55ef-d341-6aaf-7f3cc375934e	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	f
00030000-55ef-d341-9e5c-d409d7afe555	PostniNaslov-read	PostniNaslov - branje	f
00030000-55ef-d341-0c5b-edfec5ea0d76	PostniNaslov-write	PostniNaslov - spreminjanje	f
00030000-55ef-d341-86a2-9b1e186c0073	Predstava-read	Predstava - branje	f
00030000-55ef-d341-9a4e-8d817cdc8740	Predstava-write	Predstava - spreminjanje	f
00030000-55ef-d341-7d2f-97003159b102	ProdajaPredstave-read	ProdajaPredstave - branje	f
00030000-55ef-d341-5f67-ecd4238b871e	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	f
00030000-55ef-d341-13dd-aefec1d5426e	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	f
00030000-55ef-d341-8888-575e08d4290a	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	f
00030000-55ef-d341-e5a9-abd454a90f2d	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	f
00030000-55ef-d341-b44a-b4614084930d	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	f
00030000-55ef-d341-fca0-df78468085af	ProgramDela-read	ProgramDela - branje	f
00030000-55ef-d341-a57f-77eb89fdb2ac	ProgramDela-write	ProgramDela - spreminjanje	f
00030000-55ef-d341-de85-b2ca18b944fd	ProgramFestival-read	ProgramFestival - branje	f
00030000-55ef-d341-c785-874ac9cf4bc4	ProgramFestival-write	ProgramFestival - spreminjanje	f
00030000-55ef-d341-378a-057967a151f3	ProgramGostovanje-read	ProgramGostovanje - branje	f
00030000-55ef-d341-051a-e98989538dda	ProgramGostovanje-write	ProgramGostovanje - spreminjanje	f
00030000-55ef-d341-dca9-c817a851160f	ProgramGostujoca-read	ProgramGostujoca - branje	f
00030000-55ef-d341-8b2f-f8611db02d57	ProgramGostujoca-write	ProgramGostujoca - spreminjanje	f
00030000-55ef-d341-36b1-e817ef4c9a54	ProgramIzjemni-read	ProgramIzjemni - branje	f
00030000-55ef-d341-26a3-a063a069d369	ProgramIzjemni-write	ProgramIzjemni - spreminjanje	f
00030000-55ef-d341-95ef-235804b7cb73	ProgramPonovitevPrejsnjih-read	ProgramPonovitevPrejsnjih - branje	f
00030000-55ef-d341-d06a-147a3aa627ab	ProgramPonovitevPrejsnjih-write	ProgramPonovitevPrejsnjih - spreminjanje	f
00030000-55ef-d341-7dc6-38c1f4b38cf2	ProgramPonovitevPremiere-read	ProgramPonovitevPremiere - branje	f
00030000-55ef-d341-9ff1-af7b2af3daa4	ProgramPonovitevPremiere-write	ProgramPonovitevPremiere - spreminjanje	f
00030000-55ef-d341-c539-3bf227ec31ea	ProgramPremiera-read	ProgramPremiera - branje	f
00030000-55ef-d341-4778-7bc6985df543	ProgramPremiera-write	ProgramPremiera - spreminjanje	f
00030000-55ef-d341-7fd0-038b50a35210	ProgramRazno-read	ProgramRazno - branje	f
00030000-55ef-d341-96e7-5591dd19c396	ProgramRazno-write	ProgramRazno - spreminjanje	f
00030000-55ef-d341-b3ec-f895a4071b43	ProgramskaEnotaSklopa-read	ProgramskaEnotaSklopa - branje	f
00030000-55ef-d341-8d67-c4e95ef07bd2	ProgramskaEnotaSklopa-write	ProgramskaEnotaSklopa - spreminjanje	f
00030000-55ef-d341-c67a-1c0b61816631	Prostor-read	Prostor - branje	f
00030000-55ef-d341-45a5-4903878f6156	Prostor-write	Prostor - spreminjanje	f
00030000-55ef-d341-e846-bd02354d0fb0	Racun-read	Racun - branje	f
00030000-55ef-d341-5de4-d40be1915a05	Racun-write	Racun - spreminjanje	f
00030000-55ef-d341-c33f-e2884e4ab367	RazpisanSedez-read	RazpisanSedez - branje	f
00030000-55ef-d341-4032-abfefdd43808	RazpisanSedez-write	RazpisanSedez - spreminjanje	f
00030000-55ef-d341-a19e-52dc7e827e93	Rekviziterstvo-read	Rekviziterstvo - branje	f
00030000-55ef-d341-8c6c-d09c64c776ff	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	f
00030000-55ef-d341-fb99-97321cb7fd3b	Rekvizit-read	Rekvizit - branje	f
00030000-55ef-d341-2fc9-a200fed0a2a4	Rekvizit-write	Rekvizit - spreminjanje	f
00030000-55ef-d341-4271-3d80c1d0c65e	Revizija-read	Revizija - branje	f
00030000-55ef-d341-5ce5-46468268b1a8	Revizija-write	Revizija - spreminjanje	f
00030000-55ef-d341-102d-eeed2466b421	Rezervacija-read	Rezervacija - branje	f
00030000-55ef-d341-c661-00633946f70e	Rezervacija-write	Rezervacija - spreminjanje	f
00030000-55ef-d341-fd33-820a3a672af2	SedezniRed-read	SedezniRed - branje	f
00030000-55ef-d341-d141-35dd3f404eca	SedezniRed-write	SedezniRed - spreminjanje	f
00030000-55ef-d341-e9ec-fdf1763ace9f	Sedez-read	Sedez - branje	f
00030000-55ef-d341-ba0d-76a356059905	Sedez-write	Sedez - spreminjanje	f
00030000-55ef-d341-b0ad-14a06b47b85d	Sezona-read	Sezona - branje	f
00030000-55ef-d341-2191-22a4f5686a5c	Sezona-write	Sezona - spreminjanje	f
00030000-55ef-d341-15b7-b2af12f4fa94	StevilcenjeKonfig-read	StevilcenjeKonfig - branje	f
00030000-55ef-d341-fe7e-d607117e9b24	StevilcenjeKonfig-write	StevilcenjeKonfig - spreminjanje	f
00030000-55ef-d341-f7fb-5abd92643113	Stevilcenje-read	Stevilcenje - branje	f
00030000-55ef-d341-0f72-1570815767b9	Stevilcenje-write	Stevilcenje - spreminjanje	f
00030000-55ef-d341-bd79-e8e410094d1a	StevilcenjeStanje-read	StevilcenjeStanje - branje	f
00030000-55ef-d341-65ba-1c8c40fc1a7f	StevilcenjeStanje-write	StevilcenjeStanje - spreminjanje	f
00030000-55ef-d341-0389-39f362a94172	StrosekUprizoritve-read	StrosekUprizoritve - branje	f
00030000-55ef-d341-c096-9da7183336de	StrosekUprizoritve-write	StrosekUprizoritve - spreminjanje	f
00030000-55ef-d341-f110-64c339b9919b	Telefonska-read	Telefonska - branje	f
00030000-55ef-d341-2a87-4a8bed455e55	Telefonska-write	Telefonska - spreminjanje	f
00030000-55ef-d341-72f4-7f2b7c7222a5	TerminStoritve-read	TerminStoritve - branje	f
00030000-55ef-d341-1926-3af57c597a46	TerminStoritve-write	TerminStoritve - spreminjanje	f
00030000-55ef-d341-674c-a93042030d97	TipFunkcije-read	TipFunkcije - branje	f
00030000-55ef-d341-345c-ec6ff1b8bfec	TipFunkcije-write	TipFunkcije - spreminjanje	f
00030000-55ef-d341-f41e-82a1544a489b	TipProgramskeEnote-read	TipProgramskeEnote - branje	f
00030000-55ef-d341-6b79-371d8a30aa3b	TipProgramskeEnote-write	TipProgramskeEnote - spreminjanje	f
00030000-55ef-d341-50f1-acdf438398c1	Trr-read	Trr - branje	f
00030000-55ef-d341-fdfd-d6b0c9d75622	Trr-write	Trr - spreminjanje	f
00030000-55ef-d341-a98b-32f03ac05263	Uprizoritev-read	Uprizoritev - branje	f
00030000-55ef-d341-2ae4-9bcaa982a71d	Uprizoritev-write	Uprizoritev - spreminjanje	f
00030000-55ef-d341-b7cf-4377e1314479	Vaja-read	Vaja - branje	f
00030000-55ef-d341-3dff-49dbf073ead1	Vaja-write	Vaja - spreminjanje	f
00030000-55ef-d341-7c6b-61cfcf328904	VrstaSedezev-read	VrstaSedezev - branje	f
00030000-55ef-d341-ccaf-6931c560c076	VrstaSedezev-write	VrstaSedezev - spreminjanje	f
00030000-55ef-d341-8a1d-1f5e05f5027a	VrstaStroska-read	VrstaStroska - branje	f
00030000-55ef-d341-f65a-d141a16778e3	VrstaStroska-write	VrstaStroska - spreminjanje	f
00030000-55ef-d341-1a10-672e10596c89	Zaposlitev-read	Zaposlitev - branje	f
00030000-55ef-d341-bc67-c5f398664a80	Zaposlitev-write	Zaposlitev - spreminjanje	f
00030000-55ef-d341-e780-d938fef42126	Zasedenost-read	Zasedenost - branje	f
00030000-55ef-d341-bcd4-f5e26705cfa0	Zasedenost-write	Zasedenost - spreminjanje	f
00030000-55ef-d341-2c84-318c284987db	ZvrstSurs-read	ZvrstSurs - branje	f
00030000-55ef-d341-d8ae-a547d5e234a8	ZvrstSurs-write	ZvrstSurs - spreminjanje	f
00030000-55ef-d341-1520-94aee37336b0	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	f
00030000-55ef-d341-9e76-d8edc6ea631b	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	f
00030000-55ef-d341-3e41-32b1d396c657	Mapa-write	Mapa - osnovno dovoljenje za pisanje	f
00030000-55ef-d341-d884-b2a05a4573fc	Mapa-read	Mapa - osnovno dovoljenje za branje	f
00030000-55ef-d341-c41b-dc1100b61b6c	MapaAcl-write	MapaAcl - dovoljenje za dostop pisanje ACL-jev mape	f
00030000-55ef-d341-0bcc-995ed583a309	MapaAcl-read	MapaAcl - dovoljenje za dostop branje ACL-jev mape	f
00030000-55ef-d341-3125-670d8fdf2c91	Zapis-write	Zapis - dovoljenje za pisanje zapisov	f
00030000-55ef-d341-0110-26f53c5a77a1	Zapis-read	Zapis - dovoljenje za pisanje zapisov	f
00030000-55ef-d341-b68c-079e7fac5b1f	ZapisLastnik-write	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	f
00030000-55ef-d341-bae0-f168a822ec11	ZapisLastnik-read	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	f
00030000-55ef-d341-7473-ff92940c3eec	VrstaZapisa-write	Šifrant vrst zapisa - spreminjanje	f
00030000-55ef-d341-dd10-20484ecaf4b0	VrstaZapisa-read	Šifrant vrst zapisa - branje	f
00030000-55ef-d341-e3a0-180d8ce0caa9	Datoteka-write	Datoteka - spreminjanje	f
00030000-55ef-d341-811f-b7090e65b529	Datoteka-read	Datoteke - branje	f
\.


--
-- TOC entry 2909 (class 0 OID 18133886)
-- Dependencies: 179
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-55ef-d341-d9a1-e670a3a78edc	00030000-55ef-d341-8e3b-5326afedcc2e
00020000-55ef-d341-ef87-fe19d51d0954	00030000-55ef-d341-04a7-9039adf71fe6
00020000-55ef-d342-f016-54aad701db4e	00030000-55ef-d341-28a7-47041e0372f3
00020000-55ef-d342-f016-54aad701db4e	00030000-55ef-d341-1132-d72b8f99d122
00020000-55ef-d342-f016-54aad701db4e	00030000-55ef-d341-8d12-63ef923cb519
00020000-55ef-d342-f016-54aad701db4e	00030000-55ef-d341-716e-bd80d6938661
00020000-55ef-d342-f016-54aad701db4e	00030000-55ef-d341-7bff-b73ff75ea796
00020000-55ef-d342-f016-54aad701db4e	00030000-55ef-d341-d452-41ddf048abe2
00020000-55ef-d342-f016-54aad701db4e	00030000-55ef-d341-f08d-7d66f0feeed5
00020000-55ef-d342-f016-54aad701db4e	00030000-55ef-d341-b536-4f36bbae4184
00020000-55ef-d342-f016-54aad701db4e	00030000-55ef-d341-04a7-9039adf71fe6
00020000-55ef-d342-f016-54aad701db4e	00030000-55ef-d341-0d12-b398e77fa3bf
00020000-55ef-d342-f016-54aad701db4e	00030000-55ef-d341-da01-9be65aed5f59
00020000-55ef-d342-f016-54aad701db4e	00030000-55ef-d341-edce-48fb0feb902e
00020000-55ef-d342-f016-54aad701db4e	00030000-55ef-d341-2e3b-42aa84392dbc
00020000-55ef-d342-f016-54aad701db4e	00030000-55ef-d341-7d2c-330262655765
00020000-55ef-d342-f016-54aad701db4e	00030000-55ef-d341-8518-8e7f106b9cc9
00020000-55ef-d342-f016-54aad701db4e	00030000-55ef-d341-47fc-0c122783c8b2
00020000-55ef-d342-f016-54aad701db4e	00030000-55ef-d341-8de3-0b284793576b
00020000-55ef-d342-f016-54aad701db4e	00030000-55ef-d341-ac90-9237656eff59
00020000-55ef-d342-f016-54aad701db4e	00030000-55ef-d341-8550-32d97afb8eb9
00020000-55ef-d342-f016-54aad701db4e	00030000-55ef-d341-9a72-51f66f477aec
00020000-55ef-d342-f016-54aad701db4e	00030000-55ef-d341-4e11-8e899a3a58e9
00020000-55ef-d342-f016-54aad701db4e	00030000-55ef-d341-b9a2-ed47025a0f86
00020000-55ef-d342-f016-54aad701db4e	00030000-55ef-d341-39e2-3edcbb98ce31
00020000-55ef-d342-f016-54aad701db4e	00030000-55ef-d341-69f0-d213ea994133
00020000-55ef-d342-f016-54aad701db4e	00030000-55ef-d341-51a9-58c92d9f60cc
00020000-55ef-d342-f016-54aad701db4e	00030000-55ef-d341-b764-7d5141a7aa23
00020000-55ef-d342-f016-54aad701db4e	00030000-55ef-d341-9e5c-d409d7afe555
00020000-55ef-d342-f016-54aad701db4e	00030000-55ef-d341-0c5b-edfec5ea0d76
00020000-55ef-d342-f016-54aad701db4e	00030000-55ef-d341-86a2-9b1e186c0073
00020000-55ef-d342-f016-54aad701db4e	00030000-55ef-d341-9a4e-8d817cdc8740
00020000-55ef-d342-f016-54aad701db4e	00030000-55ef-d341-e5a9-abd454a90f2d
00020000-55ef-d342-f016-54aad701db4e	00030000-55ef-d341-b44a-b4614084930d
00020000-55ef-d342-f016-54aad701db4e	00030000-55ef-d341-c67a-1c0b61816631
00020000-55ef-d342-f016-54aad701db4e	00030000-55ef-d341-45a5-4903878f6156
00020000-55ef-d342-f016-54aad701db4e	00030000-55ef-d341-a19e-52dc7e827e93
00020000-55ef-d342-f016-54aad701db4e	00030000-55ef-d341-8c6c-d09c64c776ff
00020000-55ef-d342-f016-54aad701db4e	00030000-55ef-d341-fb99-97321cb7fd3b
00020000-55ef-d342-f016-54aad701db4e	00030000-55ef-d341-2fc9-a200fed0a2a4
00020000-55ef-d342-f016-54aad701db4e	00030000-55ef-d341-b0ad-14a06b47b85d
00020000-55ef-d342-f016-54aad701db4e	00030000-55ef-d341-2191-22a4f5686a5c
00020000-55ef-d342-f016-54aad701db4e	00030000-55ef-d341-674c-a93042030d97
00020000-55ef-d342-f016-54aad701db4e	00030000-55ef-d341-a98b-32f03ac05263
00020000-55ef-d342-f016-54aad701db4e	00030000-55ef-d341-2ae4-9bcaa982a71d
00020000-55ef-d342-f016-54aad701db4e	00030000-55ef-d341-b7cf-4377e1314479
00020000-55ef-d342-f016-54aad701db4e	00030000-55ef-d341-3dff-49dbf073ead1
00020000-55ef-d342-f016-54aad701db4e	00030000-55ef-d341-e780-d938fef42126
00020000-55ef-d342-f016-54aad701db4e	00030000-55ef-d341-bcd4-f5e26705cfa0
00020000-55ef-d342-f016-54aad701db4e	00030000-55ef-d341-2c84-318c284987db
00020000-55ef-d342-f016-54aad701db4e	00030000-55ef-d341-1520-94aee37336b0
00020000-55ef-d342-5a9c-67829c0f6ea9	00030000-55ef-d341-28a7-47041e0372f3
00020000-55ef-d342-5a9c-67829c0f6ea9	00030000-55ef-d341-7bff-b73ff75ea796
00020000-55ef-d342-5a9c-67829c0f6ea9	00030000-55ef-d341-d452-41ddf048abe2
00020000-55ef-d342-5a9c-67829c0f6ea9	00030000-55ef-d341-04a7-9039adf71fe6
00020000-55ef-d342-5a9c-67829c0f6ea9	00030000-55ef-d341-2e3b-42aa84392dbc
00020000-55ef-d342-5a9c-67829c0f6ea9	00030000-55ef-d341-8518-8e7f106b9cc9
00020000-55ef-d342-5a9c-67829c0f6ea9	00030000-55ef-d341-8de3-0b284793576b
00020000-55ef-d342-5a9c-67829c0f6ea9	00030000-55ef-d341-ac90-9237656eff59
00020000-55ef-d342-5a9c-67829c0f6ea9	00030000-55ef-d341-8550-32d97afb8eb9
00020000-55ef-d342-5a9c-67829c0f6ea9	00030000-55ef-d341-9a72-51f66f477aec
00020000-55ef-d342-5a9c-67829c0f6ea9	00030000-55ef-d341-4e11-8e899a3a58e9
00020000-55ef-d342-5a9c-67829c0f6ea9	00030000-55ef-d341-b9a2-ed47025a0f86
00020000-55ef-d342-5a9c-67829c0f6ea9	00030000-55ef-d341-39e2-3edcbb98ce31
00020000-55ef-d342-5a9c-67829c0f6ea9	00030000-55ef-d341-51a9-58c92d9f60cc
00020000-55ef-d342-5a9c-67829c0f6ea9	00030000-55ef-d341-9e5c-d409d7afe555
00020000-55ef-d342-5a9c-67829c0f6ea9	00030000-55ef-d341-0c5b-edfec5ea0d76
00020000-55ef-d342-5a9c-67829c0f6ea9	00030000-55ef-d341-86a2-9b1e186c0073
00020000-55ef-d342-5a9c-67829c0f6ea9	00030000-55ef-d341-c67a-1c0b61816631
00020000-55ef-d342-5a9c-67829c0f6ea9	00030000-55ef-d341-a19e-52dc7e827e93
00020000-55ef-d342-5a9c-67829c0f6ea9	00030000-55ef-d341-fb99-97321cb7fd3b
00020000-55ef-d342-5a9c-67829c0f6ea9	00030000-55ef-d341-b0ad-14a06b47b85d
00020000-55ef-d342-5a9c-67829c0f6ea9	00030000-55ef-d341-f110-64c339b9919b
00020000-55ef-d342-5a9c-67829c0f6ea9	00030000-55ef-d341-2a87-4a8bed455e55
00020000-55ef-d342-5a9c-67829c0f6ea9	00030000-55ef-d341-50f1-acdf438398c1
00020000-55ef-d342-5a9c-67829c0f6ea9	00030000-55ef-d341-fdfd-d6b0c9d75622
00020000-55ef-d342-5a9c-67829c0f6ea9	00030000-55ef-d341-1a10-672e10596c89
00020000-55ef-d342-5a9c-67829c0f6ea9	00030000-55ef-d341-bc67-c5f398664a80
00020000-55ef-d342-5a9c-67829c0f6ea9	00030000-55ef-d341-2c84-318c284987db
00020000-55ef-d342-5a9c-67829c0f6ea9	00030000-55ef-d341-1520-94aee37336b0
00020000-55ef-d342-2f6c-3b1446163992	00030000-55ef-d341-28a7-47041e0372f3
00020000-55ef-d342-2f6c-3b1446163992	00030000-55ef-d341-8d12-63ef923cb519
00020000-55ef-d342-2f6c-3b1446163992	00030000-55ef-d341-7bff-b73ff75ea796
00020000-55ef-d342-2f6c-3b1446163992	00030000-55ef-d341-eae1-18597718cfaa
00020000-55ef-d342-2f6c-3b1446163992	00030000-55ef-d341-44d7-c0ce6017145a
00020000-55ef-d342-2f6c-3b1446163992	00030000-55ef-d341-5529-3f38155386f3
00020000-55ef-d342-2f6c-3b1446163992	00030000-55ef-d341-d452-41ddf048abe2
00020000-55ef-d342-2f6c-3b1446163992	00030000-55ef-d341-04a7-9039adf71fe6
00020000-55ef-d342-2f6c-3b1446163992	00030000-55ef-d341-da01-9be65aed5f59
00020000-55ef-d342-2f6c-3b1446163992	00030000-55ef-d341-2e3b-42aa84392dbc
00020000-55ef-d342-2f6c-3b1446163992	00030000-55ef-d341-8518-8e7f106b9cc9
00020000-55ef-d342-2f6c-3b1446163992	00030000-55ef-d341-8de3-0b284793576b
00020000-55ef-d342-2f6c-3b1446163992	00030000-55ef-d341-8550-32d97afb8eb9
00020000-55ef-d342-2f6c-3b1446163992	00030000-55ef-d341-9a72-51f66f477aec
00020000-55ef-d342-2f6c-3b1446163992	00030000-55ef-d341-4e11-8e899a3a58e9
00020000-55ef-d342-2f6c-3b1446163992	00030000-55ef-d341-39e2-3edcbb98ce31
00020000-55ef-d342-2f6c-3b1446163992	00030000-55ef-d341-51a9-58c92d9f60cc
00020000-55ef-d342-2f6c-3b1446163992	00030000-55ef-d341-86a2-9b1e186c0073
00020000-55ef-d342-2f6c-3b1446163992	00030000-55ef-d341-e5a9-abd454a90f2d
00020000-55ef-d342-2f6c-3b1446163992	00030000-55ef-d341-c67a-1c0b61816631
00020000-55ef-d342-2f6c-3b1446163992	00030000-55ef-d341-a19e-52dc7e827e93
00020000-55ef-d342-2f6c-3b1446163992	00030000-55ef-d341-fb99-97321cb7fd3b
00020000-55ef-d342-2f6c-3b1446163992	00030000-55ef-d341-b0ad-14a06b47b85d
00020000-55ef-d342-2f6c-3b1446163992	00030000-55ef-d341-674c-a93042030d97
00020000-55ef-d342-2f6c-3b1446163992	00030000-55ef-d341-b7cf-4377e1314479
00020000-55ef-d342-2f6c-3b1446163992	00030000-55ef-d341-e780-d938fef42126
00020000-55ef-d342-2f6c-3b1446163992	00030000-55ef-d341-2c84-318c284987db
00020000-55ef-d342-2f6c-3b1446163992	00030000-55ef-d341-1520-94aee37336b0
00020000-55ef-d342-7a10-3636024a874e	00030000-55ef-d341-28a7-47041e0372f3
00020000-55ef-d342-7a10-3636024a874e	00030000-55ef-d341-1132-d72b8f99d122
00020000-55ef-d342-7a10-3636024a874e	00030000-55ef-d341-716e-bd80d6938661
00020000-55ef-d342-7a10-3636024a874e	00030000-55ef-d341-7bff-b73ff75ea796
00020000-55ef-d342-7a10-3636024a874e	00030000-55ef-d341-d452-41ddf048abe2
00020000-55ef-d342-7a10-3636024a874e	00030000-55ef-d341-04a7-9039adf71fe6
00020000-55ef-d342-7a10-3636024a874e	00030000-55ef-d341-2e3b-42aa84392dbc
00020000-55ef-d342-7a10-3636024a874e	00030000-55ef-d341-8518-8e7f106b9cc9
00020000-55ef-d342-7a10-3636024a874e	00030000-55ef-d341-8550-32d97afb8eb9
00020000-55ef-d342-7a10-3636024a874e	00030000-55ef-d341-9a72-51f66f477aec
00020000-55ef-d342-7a10-3636024a874e	00030000-55ef-d341-39e2-3edcbb98ce31
00020000-55ef-d342-7a10-3636024a874e	00030000-55ef-d341-51a9-58c92d9f60cc
00020000-55ef-d342-7a10-3636024a874e	00030000-55ef-d341-86a2-9b1e186c0073
00020000-55ef-d342-7a10-3636024a874e	00030000-55ef-d341-c67a-1c0b61816631
00020000-55ef-d342-7a10-3636024a874e	00030000-55ef-d341-a19e-52dc7e827e93
00020000-55ef-d342-7a10-3636024a874e	00030000-55ef-d341-fb99-97321cb7fd3b
00020000-55ef-d342-7a10-3636024a874e	00030000-55ef-d341-b0ad-14a06b47b85d
00020000-55ef-d342-7a10-3636024a874e	00030000-55ef-d341-674c-a93042030d97
00020000-55ef-d342-7a10-3636024a874e	00030000-55ef-d341-2c84-318c284987db
00020000-55ef-d342-7a10-3636024a874e	00030000-55ef-d341-1520-94aee37336b0
00020000-55ef-d342-daef-e89198a4f32c	00030000-55ef-d341-28a7-47041e0372f3
00020000-55ef-d342-daef-e89198a4f32c	00030000-55ef-d341-7bff-b73ff75ea796
00020000-55ef-d342-daef-e89198a4f32c	00030000-55ef-d341-d452-41ddf048abe2
00020000-55ef-d342-daef-e89198a4f32c	00030000-55ef-d341-04a7-9039adf71fe6
00020000-55ef-d342-daef-e89198a4f32c	00030000-55ef-d341-2e3b-42aa84392dbc
00020000-55ef-d342-daef-e89198a4f32c	00030000-55ef-d341-8518-8e7f106b9cc9
00020000-55ef-d342-daef-e89198a4f32c	00030000-55ef-d341-8550-32d97afb8eb9
00020000-55ef-d342-daef-e89198a4f32c	00030000-55ef-d341-9a72-51f66f477aec
00020000-55ef-d342-daef-e89198a4f32c	00030000-55ef-d341-39e2-3edcbb98ce31
00020000-55ef-d342-daef-e89198a4f32c	00030000-55ef-d341-51a9-58c92d9f60cc
00020000-55ef-d342-daef-e89198a4f32c	00030000-55ef-d341-86a2-9b1e186c0073
00020000-55ef-d342-daef-e89198a4f32c	00030000-55ef-d341-c67a-1c0b61816631
00020000-55ef-d342-daef-e89198a4f32c	00030000-55ef-d341-a19e-52dc7e827e93
00020000-55ef-d342-daef-e89198a4f32c	00030000-55ef-d341-fb99-97321cb7fd3b
00020000-55ef-d342-daef-e89198a4f32c	00030000-55ef-d341-b0ad-14a06b47b85d
00020000-55ef-d342-daef-e89198a4f32c	00030000-55ef-d341-72f4-7f2b7c7222a5
00020000-55ef-d342-daef-e89198a4f32c	00030000-55ef-d341-443a-3c218d08e3b2
00020000-55ef-d342-daef-e89198a4f32c	00030000-55ef-d341-674c-a93042030d97
00020000-55ef-d342-daef-e89198a4f32c	00030000-55ef-d341-2c84-318c284987db
00020000-55ef-d342-daef-e89198a4f32c	00030000-55ef-d341-1520-94aee37336b0
00020000-55ef-d343-afac-7a5e6467ba1d	00030000-55ef-d341-e03d-a493c5528b06
00020000-55ef-d343-afac-7a5e6467ba1d	00030000-55ef-d341-8e3b-5326afedcc2e
00020000-55ef-d343-afac-7a5e6467ba1d	00030000-55ef-d341-443a-3c218d08e3b2
00020000-55ef-d343-afac-7a5e6467ba1d	00030000-55ef-d341-f08d-7d66f0feeed5
00020000-55ef-d343-afac-7a5e6467ba1d	00030000-55ef-d341-f9a7-df494637d8d6
00020000-55ef-d343-afac-7a5e6467ba1d	00030000-55ef-d341-5148-71151ba20afb
00020000-55ef-d343-afac-7a5e6467ba1d	00030000-55ef-d341-9dd3-ea61ce83aa60
00020000-55ef-d343-afac-7a5e6467ba1d	00030000-55ef-d341-28a7-47041e0372f3
00020000-55ef-d343-afac-7a5e6467ba1d	00030000-55ef-d341-1132-d72b8f99d122
00020000-55ef-d343-afac-7a5e6467ba1d	00030000-55ef-d341-8d12-63ef923cb519
00020000-55ef-d343-afac-7a5e6467ba1d	00030000-55ef-d341-716e-bd80d6938661
00020000-55ef-d343-afac-7a5e6467ba1d	00030000-55ef-d341-7bff-b73ff75ea796
00020000-55ef-d343-afac-7a5e6467ba1d	00030000-55ef-d341-eae1-18597718cfaa
00020000-55ef-d343-afac-7a5e6467ba1d	00030000-55ef-d341-44d7-c0ce6017145a
00020000-55ef-d343-afac-7a5e6467ba1d	00030000-55ef-d341-5758-777bd9eb4b36
00020000-55ef-d343-afac-7a5e6467ba1d	00030000-55ef-d341-5529-3f38155386f3
00020000-55ef-d343-afac-7a5e6467ba1d	00030000-55ef-d341-6384-983c57daef21
00020000-55ef-d343-afac-7a5e6467ba1d	00030000-55ef-d341-d452-41ddf048abe2
00020000-55ef-d343-afac-7a5e6467ba1d	00030000-55ef-d341-b536-4f36bbae4184
00020000-55ef-d343-afac-7a5e6467ba1d	00030000-55ef-d341-04a7-9039adf71fe6
00020000-55ef-d343-afac-7a5e6467ba1d	00030000-55ef-d341-0d12-b398e77fa3bf
00020000-55ef-d343-afac-7a5e6467ba1d	00030000-55ef-d341-5f6c-00f1b2b6c863
00020000-55ef-d343-afac-7a5e6467ba1d	00030000-55ef-d341-01a0-b95f457adec7
00020000-55ef-d343-afac-7a5e6467ba1d	00030000-55ef-d341-06a4-86ffadb84e21
00020000-55ef-d343-afac-7a5e6467ba1d	00030000-55ef-d341-478f-85590a0ebc6c
00020000-55ef-d343-afac-7a5e6467ba1d	00030000-55ef-d341-da01-9be65aed5f59
00020000-55ef-d343-afac-7a5e6467ba1d	00030000-55ef-d341-edce-48fb0feb902e
00020000-55ef-d343-afac-7a5e6467ba1d	00030000-55ef-d341-2e3b-42aa84392dbc
00020000-55ef-d343-afac-7a5e6467ba1d	00030000-55ef-d341-7d2c-330262655765
00020000-55ef-d343-afac-7a5e6467ba1d	00030000-55ef-d341-8518-8e7f106b9cc9
00020000-55ef-d343-afac-7a5e6467ba1d	00030000-55ef-d341-47fc-0c122783c8b2
00020000-55ef-d343-afac-7a5e6467ba1d	00030000-55ef-d341-8de3-0b284793576b
00020000-55ef-d343-afac-7a5e6467ba1d	00030000-55ef-d341-ac90-9237656eff59
00020000-55ef-d343-afac-7a5e6467ba1d	00030000-55ef-d341-944f-952d1b193db5
00020000-55ef-d343-afac-7a5e6467ba1d	00030000-55ef-d341-7f39-28b8f648af33
00020000-55ef-d343-afac-7a5e6467ba1d	00030000-55ef-d341-b4c9-cc99b5efade5
00020000-55ef-d343-afac-7a5e6467ba1d	00030000-55ef-d341-605d-7a482d428592
00020000-55ef-d343-afac-7a5e6467ba1d	00030000-55ef-d341-8550-32d97afb8eb9
00020000-55ef-d343-afac-7a5e6467ba1d	00030000-55ef-d341-ef76-59febb2bf98b
00020000-55ef-d343-afac-7a5e6467ba1d	00030000-55ef-d341-9a72-51f66f477aec
00020000-55ef-d343-afac-7a5e6467ba1d	00030000-55ef-d341-8395-d0b55bd58c7d
00020000-55ef-d343-afac-7a5e6467ba1d	00030000-55ef-d341-4e11-8e899a3a58e9
00020000-55ef-d343-afac-7a5e6467ba1d	00030000-55ef-d341-b9a2-ed47025a0f86
00020000-55ef-d343-afac-7a5e6467ba1d	00030000-55ef-d341-61d3-2fea455f25c2
00020000-55ef-d343-afac-7a5e6467ba1d	00030000-55ef-d341-3d1d-83a3d0ced085
00020000-55ef-d343-afac-7a5e6467ba1d	00030000-55ef-d341-c21e-e02644d63c12
00020000-55ef-d343-afac-7a5e6467ba1d	00030000-55ef-d341-d697-ff83a3376ba2
00020000-55ef-d343-afac-7a5e6467ba1d	00030000-55ef-d341-d554-51a2b2349091
00020000-55ef-d343-afac-7a5e6467ba1d	00030000-55ef-d341-2207-82684241a24a
00020000-55ef-d343-afac-7a5e6467ba1d	00030000-55ef-d341-39e2-3edcbb98ce31
00020000-55ef-d343-afac-7a5e6467ba1d	00030000-55ef-d341-69f0-d213ea994133
00020000-55ef-d343-afac-7a5e6467ba1d	00030000-55ef-d341-51a9-58c92d9f60cc
00020000-55ef-d343-afac-7a5e6467ba1d	00030000-55ef-d341-b764-7d5141a7aa23
00020000-55ef-d343-afac-7a5e6467ba1d	00030000-55ef-d341-055d-e67ceab87a26
00020000-55ef-d343-afac-7a5e6467ba1d	00030000-55ef-d341-6aaf-7f3cc375934e
00020000-55ef-d343-afac-7a5e6467ba1d	00030000-55ef-d341-9e5c-d409d7afe555
00020000-55ef-d343-afac-7a5e6467ba1d	00030000-55ef-d341-0c5b-edfec5ea0d76
00020000-55ef-d343-afac-7a5e6467ba1d	00030000-55ef-d341-86a2-9b1e186c0073
00020000-55ef-d343-afac-7a5e6467ba1d	00030000-55ef-d341-9a4e-8d817cdc8740
00020000-55ef-d343-afac-7a5e6467ba1d	00030000-55ef-d341-7d2f-97003159b102
00020000-55ef-d343-afac-7a5e6467ba1d	00030000-55ef-d341-5f67-ecd4238b871e
00020000-55ef-d343-afac-7a5e6467ba1d	00030000-55ef-d341-13dd-aefec1d5426e
00020000-55ef-d343-afac-7a5e6467ba1d	00030000-55ef-d341-8888-575e08d4290a
00020000-55ef-d343-afac-7a5e6467ba1d	00030000-55ef-d341-e5a9-abd454a90f2d
00020000-55ef-d343-afac-7a5e6467ba1d	00030000-55ef-d341-b44a-b4614084930d
00020000-55ef-d343-afac-7a5e6467ba1d	00030000-55ef-d341-fca0-df78468085af
00020000-55ef-d343-afac-7a5e6467ba1d	00030000-55ef-d341-a57f-77eb89fdb2ac
00020000-55ef-d343-afac-7a5e6467ba1d	00030000-55ef-d341-de85-b2ca18b944fd
00020000-55ef-d343-afac-7a5e6467ba1d	00030000-55ef-d341-c785-874ac9cf4bc4
00020000-55ef-d343-afac-7a5e6467ba1d	00030000-55ef-d341-378a-057967a151f3
00020000-55ef-d343-afac-7a5e6467ba1d	00030000-55ef-d341-051a-e98989538dda
00020000-55ef-d343-afac-7a5e6467ba1d	00030000-55ef-d341-dca9-c817a851160f
00020000-55ef-d343-afac-7a5e6467ba1d	00030000-55ef-d341-8b2f-f8611db02d57
00020000-55ef-d343-afac-7a5e6467ba1d	00030000-55ef-d341-36b1-e817ef4c9a54
00020000-55ef-d343-afac-7a5e6467ba1d	00030000-55ef-d341-26a3-a063a069d369
00020000-55ef-d343-afac-7a5e6467ba1d	00030000-55ef-d341-95ef-235804b7cb73
00020000-55ef-d343-afac-7a5e6467ba1d	00030000-55ef-d341-d06a-147a3aa627ab
00020000-55ef-d343-afac-7a5e6467ba1d	00030000-55ef-d341-7dc6-38c1f4b38cf2
00020000-55ef-d343-afac-7a5e6467ba1d	00030000-55ef-d341-9ff1-af7b2af3daa4
00020000-55ef-d343-afac-7a5e6467ba1d	00030000-55ef-d341-c539-3bf227ec31ea
00020000-55ef-d343-afac-7a5e6467ba1d	00030000-55ef-d341-4778-7bc6985df543
00020000-55ef-d343-afac-7a5e6467ba1d	00030000-55ef-d341-7fd0-038b50a35210
00020000-55ef-d343-afac-7a5e6467ba1d	00030000-55ef-d341-96e7-5591dd19c396
00020000-55ef-d343-afac-7a5e6467ba1d	00030000-55ef-d341-b3ec-f895a4071b43
00020000-55ef-d343-afac-7a5e6467ba1d	00030000-55ef-d341-8d67-c4e95ef07bd2
00020000-55ef-d343-afac-7a5e6467ba1d	00030000-55ef-d341-c67a-1c0b61816631
00020000-55ef-d343-afac-7a5e6467ba1d	00030000-55ef-d341-45a5-4903878f6156
00020000-55ef-d343-afac-7a5e6467ba1d	00030000-55ef-d341-e846-bd02354d0fb0
00020000-55ef-d343-afac-7a5e6467ba1d	00030000-55ef-d341-5de4-d40be1915a05
00020000-55ef-d343-afac-7a5e6467ba1d	00030000-55ef-d341-c33f-e2884e4ab367
00020000-55ef-d343-afac-7a5e6467ba1d	00030000-55ef-d341-4032-abfefdd43808
00020000-55ef-d343-afac-7a5e6467ba1d	00030000-55ef-d341-a19e-52dc7e827e93
00020000-55ef-d343-afac-7a5e6467ba1d	00030000-55ef-d341-8c6c-d09c64c776ff
00020000-55ef-d343-afac-7a5e6467ba1d	00030000-55ef-d341-fb99-97321cb7fd3b
00020000-55ef-d343-afac-7a5e6467ba1d	00030000-55ef-d341-2fc9-a200fed0a2a4
00020000-55ef-d343-afac-7a5e6467ba1d	00030000-55ef-d341-4271-3d80c1d0c65e
00020000-55ef-d343-afac-7a5e6467ba1d	00030000-55ef-d341-5ce5-46468268b1a8
00020000-55ef-d343-afac-7a5e6467ba1d	00030000-55ef-d341-102d-eeed2466b421
00020000-55ef-d343-afac-7a5e6467ba1d	00030000-55ef-d341-c661-00633946f70e
00020000-55ef-d343-afac-7a5e6467ba1d	00030000-55ef-d341-fd33-820a3a672af2
00020000-55ef-d343-afac-7a5e6467ba1d	00030000-55ef-d341-d141-35dd3f404eca
00020000-55ef-d343-afac-7a5e6467ba1d	00030000-55ef-d341-e9ec-fdf1763ace9f
00020000-55ef-d343-afac-7a5e6467ba1d	00030000-55ef-d341-ba0d-76a356059905
00020000-55ef-d343-afac-7a5e6467ba1d	00030000-55ef-d341-b0ad-14a06b47b85d
00020000-55ef-d343-afac-7a5e6467ba1d	00030000-55ef-d341-2191-22a4f5686a5c
00020000-55ef-d343-afac-7a5e6467ba1d	00030000-55ef-d341-15b7-b2af12f4fa94
00020000-55ef-d343-afac-7a5e6467ba1d	00030000-55ef-d341-fe7e-d607117e9b24
00020000-55ef-d343-afac-7a5e6467ba1d	00030000-55ef-d341-f7fb-5abd92643113
00020000-55ef-d343-afac-7a5e6467ba1d	00030000-55ef-d341-0f72-1570815767b9
00020000-55ef-d343-afac-7a5e6467ba1d	00030000-55ef-d341-bd79-e8e410094d1a
00020000-55ef-d343-afac-7a5e6467ba1d	00030000-55ef-d341-65ba-1c8c40fc1a7f
00020000-55ef-d343-afac-7a5e6467ba1d	00030000-55ef-d341-0389-39f362a94172
00020000-55ef-d343-afac-7a5e6467ba1d	00030000-55ef-d341-c096-9da7183336de
00020000-55ef-d343-afac-7a5e6467ba1d	00030000-55ef-d341-f110-64c339b9919b
00020000-55ef-d343-afac-7a5e6467ba1d	00030000-55ef-d341-2a87-4a8bed455e55
00020000-55ef-d343-afac-7a5e6467ba1d	00030000-55ef-d341-72f4-7f2b7c7222a5
00020000-55ef-d343-afac-7a5e6467ba1d	00030000-55ef-d341-1926-3af57c597a46
00020000-55ef-d343-afac-7a5e6467ba1d	00030000-55ef-d341-674c-a93042030d97
00020000-55ef-d343-afac-7a5e6467ba1d	00030000-55ef-d341-345c-ec6ff1b8bfec
00020000-55ef-d343-afac-7a5e6467ba1d	00030000-55ef-d341-f41e-82a1544a489b
00020000-55ef-d343-afac-7a5e6467ba1d	00030000-55ef-d341-6b79-371d8a30aa3b
00020000-55ef-d343-afac-7a5e6467ba1d	00030000-55ef-d341-50f1-acdf438398c1
00020000-55ef-d343-afac-7a5e6467ba1d	00030000-55ef-d341-fdfd-d6b0c9d75622
00020000-55ef-d343-afac-7a5e6467ba1d	00030000-55ef-d341-a98b-32f03ac05263
00020000-55ef-d343-afac-7a5e6467ba1d	00030000-55ef-d341-2ae4-9bcaa982a71d
00020000-55ef-d343-afac-7a5e6467ba1d	00030000-55ef-d341-b7cf-4377e1314479
00020000-55ef-d343-afac-7a5e6467ba1d	00030000-55ef-d341-3dff-49dbf073ead1
00020000-55ef-d343-afac-7a5e6467ba1d	00030000-55ef-d341-7c6b-61cfcf328904
00020000-55ef-d343-afac-7a5e6467ba1d	00030000-55ef-d341-ccaf-6931c560c076
00020000-55ef-d343-afac-7a5e6467ba1d	00030000-55ef-d341-8a1d-1f5e05f5027a
00020000-55ef-d343-afac-7a5e6467ba1d	00030000-55ef-d341-f65a-d141a16778e3
00020000-55ef-d343-afac-7a5e6467ba1d	00030000-55ef-d341-1a10-672e10596c89
00020000-55ef-d343-afac-7a5e6467ba1d	00030000-55ef-d341-bc67-c5f398664a80
00020000-55ef-d343-afac-7a5e6467ba1d	00030000-55ef-d341-e780-d938fef42126
00020000-55ef-d343-afac-7a5e6467ba1d	00030000-55ef-d341-bcd4-f5e26705cfa0
00020000-55ef-d343-afac-7a5e6467ba1d	00030000-55ef-d341-2c84-318c284987db
00020000-55ef-d343-afac-7a5e6467ba1d	00030000-55ef-d341-d8ae-a547d5e234a8
00020000-55ef-d343-afac-7a5e6467ba1d	00030000-55ef-d341-1520-94aee37336b0
00020000-55ef-d343-afac-7a5e6467ba1d	00030000-55ef-d341-9e76-d8edc6ea631b
\.


--
-- TOC entry 2936 (class 0 OID 18134181)
-- Dependencies: 206
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 2940 (class 0 OID 18134215)
-- Dependencies: 210
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 2951 (class 0 OID 18134344)
-- Dependencies: 221
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, zacetek, konec, jeavtorskepravice, placilonavajo, vrednostvaje, planiranostevilovaj, vrednostvaj, vrednostpredstave, vrednostdopremiere, aktivna, zaposlenvdrjz, samozaposlen, igralec, opis) FROM stdin;
000b0000-55ef-d343-1c3f-dab7aac1ebed	00090000-55ef-d343-713e-70788b01502a	\N	\N	0001	\N	\N	f	f	10.00	3	10.00	30.00	10.00	t	t	f	t	Pogodba o sodelovanju
000b0000-55ef-d343-7977-e2cc5804541d	00090000-55ef-d343-23be-f7ebcb4ccf5c	\N	\N	0002	\N	\N	f	t	11.00	10	11.00	31.00	110.00	t	f	t	t	Pogodba za vlogo Helena
000b0000-55ef-d343-846e-9d34a3b2d2bb	00090000-55ef-d343-ee21-322e2d6d62f5	\N	\N	0003	\N	\N	f	f	12.00	4	12.00	32.00	12.00	t	f	t	f	Pogodba za lektoriranje
000b0000-55ef-d343-3964-bdcc7f567357	00090000-55ef-d343-b1b8-ba76b5d27db6	\N	\N	0004	\N	\N	t	f	0.00	2	300.00	30.00	300.00	t	f	t	f	Pogodba za avtorske pravice
\.


--
-- TOC entry 2914 (class 0 OID 18133946)
-- Dependencies: 184
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, drzava_id, sifra, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo, nvo) FROM stdin;
00080000-55ef-d342-4553-e65a870dd394	00040000-55ef-d341-c063-5e7f3280d07a	0988	AK	Juhuhu d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55ef-d342-f048-781fb918deec	00040000-55ef-d341-c063-5e7f3280d07a	0989	AK	Hopsasa d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	t
00080000-55ef-d342-db6f-569034539222	00040000-55ef-d341-c063-5e7f3280d07a	0987	AK	Gledališče Šrum d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55ef-d342-ebaf-14be82cd8f4e	00040000-55ef-d341-c063-5e7f3280d07a	0986	AK	Lutkovni Direndaj d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55ef-d342-31b0-8fa8542f6e80	00040000-55ef-d341-c063-5e7f3280d07a	0985	AK	Tatjana Stanič, Lektoriranje, s.p.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55ef-d342-4ff4-5a8e1080e1cd	00040000-55ef-d341-cbf7-114d1ed4be10	0984	AK	Gledališče Lepote tvoje		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55ef-d342-b7ee-891726b0cc8e	00040000-55ef-d341-a8ba-eef99b7f2954	0983	AK	Sunce naše		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55ef-d342-b21a-7969279b9a72	00040000-55ef-d341-63aa-75c76ffcf003	0982	AK	Theater Amadeus		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55ef-d342-2b20-888fe08cba71	00040000-55ef-d341-9a37-dcb1fb9a1c82	9999	AK	Fuchs		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55ef-d344-e266-73eac1cbb32a	00040000-55ef-d341-c063-5e7f3280d07a	1001	AK	Gledališče Matica		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
\.


--
-- TOC entry 2916 (class 0 OID 18133980)
-- Dependencies: 186
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-55ef-d341-5c43-0fb2dde851da	8341	Adlešiči
00050000-55ef-d341-ffa2-21b1e9c26442	5270	Ajdovščina
00050000-55ef-d341-f3d1-2233b53c13ad	6280	Ankaran/Ancarano
00050000-55ef-d341-bea3-7339702c8c78	9253	Apače
00050000-55ef-d341-f024-b81960f5b3df	8253	Artiče
00050000-55ef-d341-1add-2beb8c12b4d1	4275	Begunje na Gorenjskem
00050000-55ef-d341-ed4c-fba341787d23	1382	Begunje pri Cerknici
00050000-55ef-d341-c27e-bc2a886de753	9231	Beltinci
00050000-55ef-d341-7de7-9db888d9b216	2234	Benedikt
00050000-55ef-d341-0263-0335c85afbd9	2345	Bistrica ob Dravi
00050000-55ef-d341-81c6-0deea8e8458d	3256	Bistrica ob Sotli
00050000-55ef-d341-b1f7-2942fde927ed	8259	Bizeljsko
00050000-55ef-d341-1fd8-10d725979f09	1223	Blagovica
00050000-55ef-d341-2f02-5c622e5a35fe	8283	Blanca
00050000-55ef-d341-7d32-584b0840b90e	4260	Bled
00050000-55ef-d341-3c21-7ebdf4a627ec	4273	Blejska Dobrava
00050000-55ef-d341-b8fb-ce52b6f71aa4	9265	Bodonci
00050000-55ef-d341-94e9-e801fb112cab	9222	Bogojina
00050000-55ef-d341-1883-b9281a34ab89	4263	Bohinjska Bela
00050000-55ef-d341-083a-4674329afd6b	4264	Bohinjska Bistrica
00050000-55ef-d341-d51d-8b5fb6003bbd	4265	Bohinjsko jezero
00050000-55ef-d341-9f4c-ade9c006af01	1353	Borovnica
00050000-55ef-d341-cc18-4631e48b7dcc	8294	Boštanj
00050000-55ef-d341-aad0-7a44b8c100e0	5230	Bovec
00050000-55ef-d341-14f0-f15673396843	5295	Branik
00050000-55ef-d341-3eae-4351c62446b0	3314	Braslovče
00050000-55ef-d341-f86e-e742c9992e44	5223	Breginj
00050000-55ef-d341-f300-959b3dba3523	8280	Brestanica
00050000-55ef-d341-af00-1f7e5217cae6	2354	Bresternica
00050000-55ef-d341-edaf-f426f1542a15	4243	Brezje
00050000-55ef-d341-ab15-102ec655c0be	1351	Brezovica pri Ljubljani
00050000-55ef-d341-1b41-3e0480f39927	8250	Brežice
00050000-55ef-d341-c2b7-ed3fac98aa9a	4210	Brnik - Aerodrom
00050000-55ef-d341-1985-20cf4086e20c	8321	Brusnice
00050000-55ef-d341-624b-460fd9fc2e1b	3255	Buče
00050000-55ef-d341-1506-5f08f20499a3	8276	Bučka 
00050000-55ef-d341-1b11-44dcc0e2aaaf	9261	Cankova
00050000-55ef-d341-04a9-e25bb2dfc214	3000	Celje 
00050000-55ef-d341-0f4c-9f4b6d19171d	3001	Celje - poštni predali
00050000-55ef-d341-6f71-72243aa717c0	4207	Cerklje na Gorenjskem
00050000-55ef-d341-73e8-a90f46db4b06	8263	Cerklje ob Krki
00050000-55ef-d341-297d-f624df4faf96	1380	Cerknica
00050000-55ef-d341-2d27-a3978b5c42ad	5282	Cerkno
00050000-55ef-d341-a063-94da335861fb	2236	Cerkvenjak
00050000-55ef-d341-7efb-f3bff8713516	2215	Ceršak
00050000-55ef-d341-c206-87ddf280afa9	2326	Cirkovce
00050000-55ef-d341-3eca-e7b04e242492	2282	Cirkulane
00050000-55ef-d341-cc80-5482ab605f22	5273	Col
00050000-55ef-d341-5bc2-f5baac8797d3	8251	Čatež ob Savi
00050000-55ef-d341-3f2f-9ddda18eb394	1413	Čemšenik
00050000-55ef-d341-854c-29c78c72f23a	5253	Čepovan
00050000-55ef-d341-0be6-cc2dd41a6b42	9232	Črenšovci
00050000-55ef-d341-2ef6-6f607f4007ef	2393	Črna na Koroškem
00050000-55ef-d341-ea74-98faa4cb29bb	6275	Črni Kal
00050000-55ef-d341-7447-250c2e6b3d09	5274	Črni Vrh nad Idrijo
00050000-55ef-d341-9ca3-f7c87b4ad831	5262	Črniče
00050000-55ef-d341-ce21-f6645493b6e9	8340	Črnomelj
00050000-55ef-d341-e3a7-dbfc3aab86b3	6271	Dekani
00050000-55ef-d341-59c2-ad318e3ac6d5	5210	Deskle
00050000-55ef-d341-6aa6-fc2aa963baa9	2253	Destrnik
00050000-55ef-d341-ee73-8bdf38d50672	6215	Divača
00050000-55ef-d341-be5e-2b54a48f28b4	1233	Dob
00050000-55ef-d341-64de-9f79592d1e88	3224	Dobje pri Planini
00050000-55ef-d341-a0fb-9866e08af77c	8257	Dobova
00050000-55ef-d341-ef64-ab9b9831eeda	1423	Dobovec
00050000-55ef-d341-aa77-1bf9f686b6ae	5263	Dobravlje
00050000-55ef-d341-565c-61b0ef131fcb	3204	Dobrna
00050000-55ef-d341-61a1-71091cd78894	8211	Dobrnič
00050000-55ef-d341-cf33-37af23051cb2	1356	Dobrova
00050000-55ef-d341-e9d7-73b84ae8222f	9223	Dobrovnik/Dobronak 
00050000-55ef-d341-94f9-e71181e12ae3	5212	Dobrovo v Brdih
00050000-55ef-d341-79dc-c2315af134ca	1431	Dol pri Hrastniku
00050000-55ef-d341-06c8-5584d5aa3987	1262	Dol pri Ljubljani
00050000-55ef-d341-abbf-d38f47856a0e	1273	Dole pri Litiji
00050000-55ef-d341-9491-d21014fe648a	1331	Dolenja vas
00050000-55ef-d341-b703-f09d10e8d0f2	8350	Dolenjske Toplice
00050000-55ef-d341-93e5-31b61cf6cd53	1230	Domžale
00050000-55ef-d341-c768-69d87d0f9ca1	2252	Dornava
00050000-55ef-d341-ec52-c1ded9197970	5294	Dornberk
00050000-55ef-d341-dde9-f950096c15bf	1319	Draga
00050000-55ef-d341-3b5d-942897f2df0e	8343	Dragatuš
00050000-55ef-d341-0714-e9407d3265fb	3222	Dramlje
00050000-55ef-d341-20a8-20586fca19c0	2370	Dravograd
00050000-55ef-d341-351e-0df9cdecc175	4203	Duplje
00050000-55ef-d341-37d0-abb532d96634	6221	Dutovlje
00050000-55ef-d341-6877-c7a1c9027c81	8361	Dvor
00050000-55ef-d341-744f-cb3f873d43af	2343	Fala
00050000-55ef-d341-ce6a-8601feb0d279	9208	Fokovci
00050000-55ef-d341-6ef9-de32b4115857	2313	Fram
00050000-55ef-d341-d9fa-6c55617a6134	3213	Frankolovo
00050000-55ef-d341-6760-b152fcfa43e8	1274	Gabrovka
00050000-55ef-d341-c76b-460763da01cb	8254	Globoko
00050000-55ef-d341-26aa-64a85da403df	5275	Godovič
00050000-55ef-d341-f700-8d2b45720525	4204	Golnik
00050000-55ef-d341-11b9-736647bfad64	3303	Gomilsko
00050000-55ef-d341-c24c-446a8f1dabdd	4224	Gorenja vas
00050000-55ef-d341-aef6-4fe2c80e0551	3263	Gorica pri Slivnici
00050000-55ef-d341-4157-83b4bf346cec	2272	Gorišnica
00050000-55ef-d341-bea3-ef71fa7d5728	9250	Gornja Radgona
00050000-55ef-d341-4240-205f7f3f4c6c	3342	Gornji Grad
00050000-55ef-d341-9b1c-80f2f298a43d	4282	Gozd Martuljek
00050000-55ef-d341-2a3a-53282588bca8	6272	Gračišče
00050000-55ef-d341-9251-1447f29a69c5	9264	Grad
00050000-55ef-d341-22d8-76f6ad0ffe0b	8332	Gradac
00050000-55ef-d341-08f2-bbecb2020ae2	1384	Grahovo
00050000-55ef-d341-09ac-44cdb76131f5	5242	Grahovo ob Bači
00050000-55ef-d341-ea5c-b2df35a6d9e7	5251	Grgar
00050000-55ef-d341-3f0c-53e900cb7228	3302	Griže
00050000-55ef-d341-7af0-8a68e45e73df	3231	Grobelno
00050000-55ef-d341-fa91-41d7f7a71f04	1290	Grosuplje
00050000-55ef-d341-eec4-074e633d2e12	2288	Hajdina
00050000-55ef-d341-408b-1ed7d5a5e8ca	8362	Hinje
00050000-55ef-d341-e871-7d3d02e71f9f	2311	Hoče
00050000-55ef-d341-7b22-f055bb758737	9205	Hodoš/Hodos
00050000-55ef-d341-0b92-6a39d1a2d0d4	1354	Horjul
00050000-55ef-d341-0a0f-4f2d8940ebb9	1372	Hotedršica
00050000-55ef-d341-6c1e-1ba6b2d46edf	1430	Hrastnik
00050000-55ef-d341-5362-cfafef7b8111	6225	Hruševje
00050000-55ef-d341-273d-f982029fd224	4276	Hrušica
00050000-55ef-d341-ff15-00ff3ac89023	5280	Idrija
00050000-55ef-d341-76f4-534ea69ad94a	1292	Ig
00050000-55ef-d341-0032-7faf5913e06f	6250	Ilirska Bistrica
00050000-55ef-d341-d25a-a050ab7bcef1	6251	Ilirska Bistrica-Trnovo
00050000-55ef-d341-4a10-3544094baf36	1295	Ivančna Gorica
00050000-55ef-d341-3064-b6cd94990478	2259	Ivanjkovci
00050000-55ef-d341-b8ec-fdf7cd8816e4	1411	Izlake
00050000-55ef-d341-de8e-0a4fe020ed2c	6310	Izola/Isola
00050000-55ef-d341-d2c8-c47ef23cb7a3	2222	Jakobski Dol
00050000-55ef-d341-e383-7f634e2b44fc	2221	Jarenina
00050000-55ef-d341-f392-9ee9965a9c79	6254	Jelšane
00050000-55ef-d341-018f-fbe233a5f426	4270	Jesenice
00050000-55ef-d341-cc84-b0f45e34a3c6	8261	Jesenice na Dolenjskem
00050000-55ef-d341-b9b2-eddaf9ef0b30	3273	Jurklošter
00050000-55ef-d341-45a1-0ce0c2cb9aea	2223	Jurovski Dol
00050000-55ef-d341-10fb-f411c075eaa0	2256	Juršinci
00050000-55ef-d341-8027-7d6336fd94f4	5214	Kal nad Kanalom
00050000-55ef-d341-4c33-5e7ef586f026	3233	Kalobje
00050000-55ef-d341-c2d7-2eea328419d8	4246	Kamna Gorica
00050000-55ef-d341-03cd-4bc2d16a5b02	2351	Kamnica
00050000-55ef-d341-bd94-8d88702e35c1	1241	Kamnik
00050000-55ef-d341-9561-e39970652e4d	5213	Kanal
00050000-55ef-d341-aab7-3a0a84cb63ed	8258	Kapele
00050000-55ef-d341-8679-f12939a47a32	2362	Kapla
00050000-55ef-d341-d3cc-057860b31a26	2325	Kidričevo
00050000-55ef-d341-5b32-fd97c6ebf175	1412	Kisovec
00050000-55ef-d341-9965-57c3a2b80813	6253	Knežak
00050000-55ef-d341-e19a-87354754649f	5222	Kobarid
00050000-55ef-d341-168b-a60ddb6a3c52	9227	Kobilje
00050000-55ef-d341-43d4-f1569d3d5e3a	1330	Kočevje
00050000-55ef-d341-a132-27b5475809d4	1338	Kočevska Reka
00050000-55ef-d341-b05b-e04732a4d9af	2276	Kog
00050000-55ef-d341-48bc-611bbcc025c3	5211	Kojsko
00050000-55ef-d341-8952-c5e080d56346	6223	Komen
00050000-55ef-d341-7261-a037e9c6eac2	1218	Komenda
00050000-55ef-d341-89a1-9cb8a01a1813	6000	Koper/Capodistria 
00050000-55ef-d341-a447-b3b8bcea29c3	6001	Koper/Capodistria - poštni predali
00050000-55ef-d341-c47a-2acac0e08e71	8282	Koprivnica
00050000-55ef-d341-41db-3673bdeb3502	5296	Kostanjevica na Krasu
00050000-55ef-d341-4bda-c11a77e33666	8311	Kostanjevica na Krki
00050000-55ef-d341-5f88-10cca4213c41	1336	Kostel
00050000-55ef-d341-f21b-f9fd79a6939b	6256	Košana
00050000-55ef-d341-02e0-9dafdc3c00b7	2394	Kotlje
00050000-55ef-d341-edfe-9a88ffb82235	6240	Kozina
00050000-55ef-d341-b53e-1f745931a9aa	3260	Kozje
00050000-55ef-d341-e58f-b3b838ae8992	4000	Kranj 
00050000-55ef-d341-ca3f-cb0c504ce9f1	4001	Kranj - poštni predali
00050000-55ef-d341-34c4-6b545623fd56	4280	Kranjska Gora
00050000-55ef-d341-c646-243e1bb11f03	1281	Kresnice
00050000-55ef-d341-2960-6add251887fa	4294	Križe
00050000-55ef-d341-6ed8-7a05c29c945f	9206	Križevci
00050000-55ef-d341-8400-8e279fadfa52	9242	Križevci pri Ljutomeru
00050000-55ef-d341-432d-79aad1d3fbd8	1301	Krka
00050000-55ef-d341-4d2c-f7d43be8de22	8296	Krmelj
00050000-55ef-d341-8e79-cccd8e4de986	4245	Kropa
00050000-55ef-d341-5a1c-21bf12e2682c	8262	Krška vas
00050000-55ef-d341-35e7-34751264e9f9	8270	Krško
00050000-55ef-d341-b981-ca27243b9e7a	9263	Kuzma
00050000-55ef-d341-0ba2-919618ef0091	2318	Laporje
00050000-55ef-d341-c477-943169f086a0	3270	Laško
00050000-55ef-d341-11c4-eecb3e670cb5	1219	Laze v Tuhinju
00050000-55ef-d341-ab5c-15c50be45629	2230	Lenart v Slovenskih goricah
00050000-55ef-d341-0fb3-d950d74266c1	9220	Lendava/Lendva
00050000-55ef-d341-520f-d27456173d15	4248	Lesce
00050000-55ef-d341-28ed-74311d603306	3261	Lesično
00050000-55ef-d341-9349-7f24cd2d1980	8273	Leskovec pri Krškem
00050000-55ef-d341-7d1e-f547b6d6fe20	2372	Libeliče
00050000-55ef-d341-281a-fad92af46256	2341	Limbuš
00050000-55ef-d341-5231-0fad6ea3bda4	1270	Litija
00050000-55ef-d341-05cc-e8b2abfc2348	3202	Ljubečna
00050000-55ef-d341-acd1-6537d2ea2731	1000	Ljubljana 
00050000-55ef-d341-a4c4-eea644ea60e2	1001	Ljubljana - poštni predali
00050000-55ef-d341-e5d3-96c1e943d550	1231	Ljubljana - Črnuče
00050000-55ef-d341-6ccc-940b3a162f77	1261	Ljubljana - Dobrunje
00050000-55ef-d341-507f-e39fb748126e	1260	Ljubljana - Polje
00050000-55ef-d341-28b4-b6a22e40642f	1210	Ljubljana - Šentvid
00050000-55ef-d341-412f-16b3da8b449c	1211	Ljubljana - Šmartno
00050000-55ef-d341-f902-92d9d29a0bbf	3333	Ljubno ob Savinji
00050000-55ef-d341-36c1-1a37b8b2fda1	9240	Ljutomer
00050000-55ef-d341-1d91-dc71cb8442f3	3215	Loče
00050000-55ef-d341-0824-8a89293c9536	5231	Log pod Mangartom
00050000-55ef-d341-bd51-3d182be65db5	1358	Log pri Brezovici
00050000-55ef-d341-2ddf-2fcc45b3fa15	1370	Logatec
00050000-55ef-d341-4a62-4d006f9dc422	1371	Logatec
00050000-55ef-d341-6210-d03406e02bd0	1434	Loka pri Zidanem Mostu
00050000-55ef-d341-c259-1852a56a11dc	3223	Loka pri Žusmu
00050000-55ef-d341-f728-10919726c565	6219	Lokev
00050000-55ef-d341-2dc5-9ef833d6ba3d	1318	Loški Potok
00050000-55ef-d341-0863-713829777542	2324	Lovrenc na Dravskem polju
00050000-55ef-d341-c727-0eeb679deb4f	2344	Lovrenc na Pohorju
00050000-55ef-d341-31c4-bf64c65ed6b6	3334	Luče
00050000-55ef-d341-2e38-c731ce45055b	1225	Lukovica
00050000-55ef-d341-6f08-78573c8bcf63	9202	Mačkovci
00050000-55ef-d341-3d25-7fc43c3ac63c	2322	Majšperk
00050000-55ef-d341-b03b-89aed57042d4	2321	Makole
00050000-55ef-d341-c4ea-f15f83828284	9243	Mala Nedelja
00050000-55ef-d341-7489-a138fcbdfe57	2229	Malečnik
00050000-55ef-d341-e7e6-3ca6b32a4e02	6273	Marezige
00050000-55ef-d341-8db6-7934223efe53	2000	Maribor 
00050000-55ef-d341-0dd6-61d56a46a4df	2001	Maribor - poštni predali
00050000-55ef-d341-7bd4-b49ef878e718	2206	Marjeta na Dravskem polju
00050000-55ef-d341-37dd-6f0f76822de0	2281	Markovci
00050000-55ef-d341-733a-73c83a9baa40	9221	Martjanci
00050000-55ef-d341-39af-15b15dbe4953	6242	Materija
00050000-55ef-d341-483f-8a7c9155c8c5	4211	Mavčiče
00050000-55ef-d341-57f5-9c5130176152	1215	Medvode
00050000-55ef-d341-df31-604c3dbdb4d7	1234	Mengeš
00050000-55ef-d341-ea43-3297a1c3c53b	8330	Metlika
00050000-55ef-d341-0b2e-bc7cd74e2bc2	2392	Mežica
00050000-55ef-d341-857c-fd8302e90083	2204	Miklavž na Dravskem polju
00050000-55ef-d341-1645-2c73f85d0f8b	2275	Miklavž pri Ormožu
00050000-55ef-d341-833f-b7488631b257	5291	Miren
00050000-55ef-d341-ce53-8294009f1c65	8233	Mirna
00050000-55ef-d341-936e-f99671b47c6e	8216	Mirna Peč
00050000-55ef-d341-bf0e-971b61a90332	2382	Mislinja
00050000-55ef-d341-5b65-5a16e906745f	4281	Mojstrana
00050000-55ef-d341-5e62-45219f3006b7	8230	Mokronog
00050000-55ef-d341-6857-000cc0ed497d	1251	Moravče
00050000-55ef-d341-f239-106809bc3b54	9226	Moravske Toplice
00050000-55ef-d341-ffbd-19f5333584bf	5216	Most na Soči
00050000-55ef-d341-aeb9-b90fb4aba55d	1221	Motnik
00050000-55ef-d341-2008-fdc3cf49ba10	3330	Mozirje
00050000-55ef-d341-b8b0-cac2b4baea40	9000	Murska Sobota 
00050000-55ef-d341-2090-4e46f5eb334d	9001	Murska Sobota - poštni predali
00050000-55ef-d341-9166-6ab77e0a1241	2366	Muta
00050000-55ef-d341-323c-2c72ceb920c6	4202	Naklo
00050000-55ef-d341-4f1e-db6462a74a7d	3331	Nazarje
00050000-55ef-d341-4e92-6d0489ef4fd0	1357	Notranje Gorice
00050000-55ef-d341-bae9-07069bde4eef	3203	Nova Cerkev
00050000-55ef-d341-06af-280e2156814f	5000	Nova Gorica 
00050000-55ef-d341-0a2a-35f5f750e932	5001	Nova Gorica - poštni predali
00050000-55ef-d341-341f-f766036fe83c	1385	Nova vas
00050000-55ef-d341-16cd-22ce025afbf6	8000	Novo mesto
00050000-55ef-d341-7a5b-b0a18da3fec5	8001	Novo mesto - poštni predali
00050000-55ef-d341-0b57-6e5c3f855ac1	6243	Obrov
00050000-55ef-d341-6661-69c0e42252b7	9233	Odranci
00050000-55ef-d341-ad9c-ddeb8b3d3a95	2317	Oplotnica
00050000-55ef-d341-5bec-85a25d01eb8b	2312	Orehova vas
00050000-55ef-d341-5d50-df2018dc32d1	2270	Ormož
00050000-55ef-d341-a05b-30538b81ccd9	1316	Ortnek
00050000-55ef-d341-5ba6-1dc773a229c0	1337	Osilnica
00050000-55ef-d341-6a2a-d507da63f1f7	8222	Otočec
00050000-55ef-d341-d087-a690a6d7be7e	2361	Ožbalt
00050000-55ef-d341-4067-ab94436fdda1	2231	Pernica
00050000-55ef-d341-c1c8-5fad7f65289f	2211	Pesnica pri Mariboru
00050000-55ef-d341-83eb-d031b5c05ab2	9203	Petrovci
00050000-55ef-d341-4ff4-fd36bf0eb8d6	3301	Petrovče
00050000-55ef-d341-d222-d6eab79a8faa	6330	Piran/Pirano
00050000-55ef-d341-7ff6-48ce4b117139	8255	Pišece
00050000-55ef-d341-a767-5fb89ee812ee	6257	Pivka
00050000-55ef-d341-47d6-7cda4bcc0b99	6232	Planina
00050000-55ef-d341-a9c3-cb3595ef65dd	3225	Planina pri Sevnici
00050000-55ef-d341-fbd2-35576823aea7	6276	Pobegi
00050000-55ef-d341-0a48-78869d8ace35	8312	Podbočje
00050000-55ef-d341-2d71-ed204cfe99cc	5243	Podbrdo
00050000-55ef-d341-1967-6c392ef3117a	3254	Podčetrtek
00050000-55ef-d341-b52d-c16ef30e939b	2273	Podgorci
00050000-55ef-d341-c2cb-40a639fd14f1	6216	Podgorje
00050000-55ef-d341-20d9-1326872b2cf7	2381	Podgorje pri Slovenj Gradcu
00050000-55ef-d341-f1c4-dc888814938c	6244	Podgrad
00050000-55ef-d341-78be-9585242596bd	1414	Podkum
00050000-55ef-d341-7077-ea4b500c9ffa	2286	Podlehnik
00050000-55ef-d341-c5de-45db6e75b7f9	5272	Podnanos
00050000-55ef-d341-15e0-748b14701140	4244	Podnart
00050000-55ef-d341-a509-382b794137a9	3241	Podplat
00050000-55ef-d341-679e-66a0120287c5	3257	Podsreda
00050000-55ef-d341-3332-72b0908a1088	2363	Podvelka
00050000-55ef-d341-ab03-0e04e47e83ff	2208	Pohorje
00050000-55ef-d341-8ae6-a9691c64673c	2257	Polenšak
00050000-55ef-d341-0465-b0993919ebdc	1355	Polhov Gradec
00050000-55ef-d341-afde-bd6148fe4746	4223	Poljane nad Škofjo Loko
00050000-55ef-d341-5eda-4925dea3fa4c	2319	Poljčane
00050000-55ef-d341-26bb-e1726bca4a42	1272	Polšnik
00050000-55ef-d341-c49f-fd2f43b09fa2	3313	Polzela
00050000-55ef-d341-9bc9-bd51d2b261ae	3232	Ponikva
00050000-55ef-d341-0ecc-937fae364337	6320	Portorož/Portorose
00050000-55ef-d341-91df-1ac5d94197dd	6230	Postojna
00050000-55ef-d341-aa92-a8908b3c6416	2331	Pragersko
00050000-55ef-d341-32a8-a324be85d3b0	3312	Prebold
00050000-55ef-d341-9ea8-2e0eb49d0ead	4205	Preddvor
00050000-55ef-d341-937b-a6f3b8ab7b09	6255	Prem
00050000-55ef-d341-15aa-3a0c59ebd3d8	1352	Preserje
00050000-55ef-d341-6390-8bb59e0b67e2	6258	Prestranek
00050000-55ef-d341-1d9d-c69d4ce7feb7	2391	Prevalje
00050000-55ef-d341-8fad-0f131bd183ff	3262	Prevorje
00050000-55ef-d341-8d0f-b9f13e997f19	1276	Primskovo 
00050000-55ef-d341-ee5d-2203af5aae07	3253	Pristava pri Mestinju
00050000-55ef-d341-11e6-ab55cb596060	9207	Prosenjakovci/Partosfalva
00050000-55ef-d341-ef92-14fa83ab20aa	5297	Prvačina
00050000-55ef-d341-16f3-13447ed5b9ca	2250	Ptuj
00050000-55ef-d341-ca90-2696cef76e6c	2323	Ptujska Gora
00050000-55ef-d341-a5a2-98988d825033	9201	Puconci
00050000-55ef-d341-0575-ea568af8906a	2327	Rače
00050000-55ef-d341-ea88-60b282a65405	1433	Radeče
00050000-55ef-d341-93b5-791d1fa25fa9	9252	Radenci
00050000-55ef-d341-4f9f-00aabf29c749	2360	Radlje ob Dravi
00050000-55ef-d341-fd3d-8508b486597d	1235	Radomlje
00050000-55ef-d341-0928-daa9fbcafad8	4240	Radovljica
00050000-55ef-d341-fa11-9d45d8778652	8274	Raka
00050000-55ef-d341-c6e3-bd57cad79240	1381	Rakek
00050000-55ef-d341-522a-c13c5324db3d	4283	Rateče - Planica
00050000-55ef-d341-fc2e-cf29386cbc0b	2390	Ravne na Koroškem
00050000-55ef-d341-6879-dc48a54754f0	9246	Razkrižje
00050000-55ef-d341-1c70-84f28511932a	3332	Rečica ob Savinji
00050000-55ef-d341-9062-94071adc2c46	5292	Renče
00050000-55ef-d341-8f37-1b2938390831	1310	Ribnica
00050000-55ef-d341-6ebb-6bdb0f3f3da5	2364	Ribnica na Pohorju
00050000-55ef-d341-5607-65e97bb9a2af	3272	Rimske Toplice
00050000-55ef-d341-544b-b560f49b7eac	1314	Rob
00050000-55ef-d341-1734-d4e907267a7c	5215	Ročinj
00050000-55ef-d341-2e04-4a62ecd4e3af	3250	Rogaška Slatina
00050000-55ef-d341-9e30-038f446c29d0	9262	Rogašovci
00050000-55ef-d341-05ad-929ee4019b06	3252	Rogatec
00050000-55ef-d341-7423-79bb6ebc7957	1373	Rovte
00050000-55ef-d341-3f7d-5db26f2a94ba	2342	Ruše
00050000-55ef-d341-682b-92eb8919dec6	1282	Sava
00050000-55ef-d341-0294-e7d537debd58	6333	Sečovlje/Sicciole
00050000-55ef-d341-7377-cfe755f00382	4227	Selca
00050000-55ef-d341-1ca6-4d42df1d9b0b	2352	Selnica ob Dravi
00050000-55ef-d341-b67b-8e94e73b3c3e	8333	Semič
00050000-55ef-d341-5f08-ee1af421df8b	8281	Senovo
00050000-55ef-d341-d5c5-c41b45a67415	6224	Senožeče
00050000-55ef-d341-4e07-bddabd18bc69	8290	Sevnica
00050000-55ef-d341-3f98-e066d8d3b983	6210	Sežana
00050000-55ef-d341-48ff-7e2b41ba5baf	2214	Sladki Vrh
00050000-55ef-d341-5d33-6ffb3089d3c0	5283	Slap ob Idrijci
00050000-55ef-d341-f097-a1446e450a33	2380	Slovenj Gradec
00050000-55ef-d341-e985-9c521634a96d	2310	Slovenska Bistrica
00050000-55ef-d341-b21c-6ba36658f148	3210	Slovenske Konjice
00050000-55ef-d341-e637-3567a15c64f4	1216	Smlednik
00050000-55ef-d341-b07a-8f0a9e54797a	5232	Soča
00050000-55ef-d341-513e-79361dd28391	1317	Sodražica
00050000-55ef-d341-377a-4af29cc7ce28	3335	Solčava
00050000-55ef-d341-427f-4aa91e47d226	5250	Solkan
00050000-55ef-d341-c0cd-876ef679c567	4229	Sorica
00050000-55ef-d341-8290-4b59d29f3904	4225	Sovodenj
00050000-55ef-d341-d482-d2a0cebea95b	5281	Spodnja Idrija
00050000-55ef-d341-81b3-a630d60a1662	2241	Spodnji Duplek
00050000-55ef-d341-4762-db291cbd27f4	9245	Spodnji Ivanjci
00050000-55ef-d341-fd34-56dfd4a8211d	2277	Središče ob Dravi
00050000-55ef-d341-b470-70e8a8b2b8fd	4267	Srednja vas v Bohinju
00050000-55ef-d341-e8fc-100a5607b6c3	8256	Sromlje 
00050000-55ef-d341-c736-e381c1876640	5224	Srpenica
00050000-55ef-d341-b4d9-4842335a4c48	1242	Stahovica
00050000-55ef-d341-d4f1-7f66128a492e	1332	Stara Cerkev
00050000-55ef-d341-7e60-85ed4b8206c7	8342	Stari trg ob Kolpi
00050000-55ef-d341-9eb7-149c782ab3b3	1386	Stari trg pri Ložu
00050000-55ef-d341-c4e5-ffd06e5e72bc	2205	Starše
00050000-55ef-d341-d1a0-986f24c1f72b	2289	Stoperce
00050000-55ef-d341-aa1e-ca74747bb8e0	8322	Stopiče
00050000-55ef-d341-c7b7-85444ce78639	3206	Stranice
00050000-55ef-d341-0a89-449bb6559ff0	8351	Straža
00050000-55ef-d341-98e0-0507802de7b2	1313	Struge
00050000-55ef-d341-7e54-0d1b114f956b	8293	Studenec
00050000-55ef-d341-b738-028fecd053aa	8331	Suhor
00050000-55ef-d341-59c2-f534f7576134	2233	Sv. Ana v Slovenskih goricah
00050000-55ef-d341-844e-c3d97010a2bc	2235	Sv. Trojica v Slovenskih goricah
00050000-55ef-d341-606a-07a316bfaa68	2353	Sveti Duh na Ostrem Vrhu
00050000-55ef-d341-5f74-52d9feb3481c	9244	Sveti Jurij ob Ščavnici
00050000-55ef-d341-bbc4-6109a6f95e87	3264	Sveti Štefan
00050000-55ef-d341-1fc5-5a9dfd3d345c	2258	Sveti Tomaž
00050000-55ef-d341-d364-03320f0ab4a5	9204	Šalovci
00050000-55ef-d341-7d9d-e7608cb303fd	5261	Šempas
00050000-55ef-d341-1659-23d91ed68089	5290	Šempeter pri Gorici
00050000-55ef-d341-5984-ca036a8a0fdf	3311	Šempeter v Savinjski dolini
00050000-55ef-d341-cf16-076c7d4ce25d	4208	Šenčur
00050000-55ef-d341-c11b-0af683d13aa9	2212	Šentilj v Slovenskih goricah
00050000-55ef-d341-4ccb-b1db96758125	8297	Šentjanž
00050000-55ef-d341-4edd-4b24390be0b1	2373	Šentjanž pri Dravogradu
00050000-55ef-d341-07ee-f17844038cca	8310	Šentjernej
00050000-55ef-d341-b9e3-58e38be52f31	3230	Šentjur
00050000-55ef-d341-ea74-376f4411e90a	3271	Šentrupert
00050000-55ef-d341-568c-ae3906781599	8232	Šentrupert
00050000-55ef-d341-e106-0dff5509a0dd	1296	Šentvid pri Stični
00050000-55ef-d341-5e4e-850dfcb6aeb7	8275	Škocjan
00050000-55ef-d341-f394-d817578f60fd	6281	Škofije
00050000-55ef-d341-4489-dca81a02ca04	4220	Škofja Loka
00050000-55ef-d341-9b9c-d5103372ae4c	3211	Škofja vas
00050000-55ef-d341-1e63-4ca284098c36	1291	Škofljica
00050000-55ef-d341-26c6-fefac2d4247e	6274	Šmarje
00050000-55ef-d341-b55d-6c1259bb855d	1293	Šmarje - Sap
00050000-55ef-d341-e18c-60926b83a9d9	3240	Šmarje pri Jelšah
00050000-55ef-d341-09b6-581956bb89bc	8220	Šmarješke Toplice
00050000-55ef-d341-06bb-4f37c4a50b24	2315	Šmartno na Pohorju
00050000-55ef-d341-8e25-33ad29c098b3	3341	Šmartno ob Dreti
00050000-55ef-d341-243d-1ca5fbbd75dd	3327	Šmartno ob Paki
00050000-55ef-d341-b4f2-cae1763f5b5b	1275	Šmartno pri Litiji
00050000-55ef-d341-a053-06abb072f205	2383	Šmartno pri Slovenj Gradcu
00050000-55ef-d341-f1da-919c9b9d1415	3201	Šmartno v Rožni dolini
00050000-55ef-d341-d9bd-279e02d5cda1	3325	Šoštanj
00050000-55ef-d341-272d-2d77cb2b5c62	6222	Štanjel
00050000-55ef-d341-90bf-3c28878a1372	3220	Štore
00050000-55ef-d341-399b-a2199b8745f6	3304	Tabor
00050000-55ef-d341-ea35-f7cc9ef0a3bf	3221	Teharje
00050000-55ef-d341-b3e2-11e6aa98de69	9251	Tišina
00050000-55ef-d341-18dc-a28efaf59ba7	5220	Tolmin
00050000-55ef-d341-9cdf-79422932dc53	3326	Topolšica
00050000-55ef-d341-332a-ce787b6530e3	2371	Trbonje
00050000-55ef-d341-62b1-3f52d937f1f3	1420	Trbovlje
00050000-55ef-d341-2b42-b5ebed2b53e0	8231	Trebelno 
00050000-55ef-d341-8eb7-63a738ce94a7	8210	Trebnje
00050000-55ef-d341-c2d4-f51fbce81bc7	5252	Trnovo pri Gorici
00050000-55ef-d341-e213-f52355e91a32	2254	Trnovska vas
00050000-55ef-d341-6498-2569d10e4671	1222	Trojane
00050000-55ef-d341-3b5b-3b7ce377a844	1236	Trzin
00050000-55ef-d341-cf62-c82cf5e1b0fa	4290	Tržič
00050000-55ef-d341-8a85-f502b2d3c8d7	8295	Tržišče
00050000-55ef-d341-d3ac-1642c5f0fe18	1311	Turjak
00050000-55ef-d341-5490-8326fe2a4a7c	9224	Turnišče
00050000-55ef-d341-b74f-929d1d345cbc	8323	Uršna sela
00050000-55ef-d341-e457-9088e1457005	1252	Vače
00050000-55ef-d341-479b-bef8e0dd58ca	3320	Velenje 
00050000-55ef-d341-3d62-fea9901cb3c3	3322	Velenje - poštni predali
00050000-55ef-d341-27d7-5063bd98ecde	8212	Velika Loka
00050000-55ef-d341-e04f-245c1ec8e42f	2274	Velika Nedelja
00050000-55ef-d341-79f3-2412acbe52e9	9225	Velika Polana
00050000-55ef-d341-746c-dc9e98ebce98	1315	Velike Lašče
00050000-55ef-d341-f8a7-4161ae821eae	8213	Veliki Gaber
00050000-55ef-d341-1bb0-b2b9cf9781b9	9241	Veržej
00050000-55ef-d341-a514-67bbb7cdaa71	1312	Videm - Dobrepolje
00050000-55ef-d341-3886-64426d04d03f	2284	Videm pri Ptuju
00050000-55ef-d341-989b-ca966e413b30	8344	Vinica
00050000-55ef-d341-d2f5-045dada4fca8	5271	Vipava
00050000-55ef-d341-019f-943a9517e3e5	4212	Visoko
00050000-55ef-d341-a540-7daf473d811d	1294	Višnja Gora
00050000-55ef-d341-36b8-5aba2afcc731	3205	Vitanje
00050000-55ef-d341-caf3-5e8c258dfa61	2255	Vitomarci
00050000-55ef-d341-ef1a-a905f52e2516	1217	Vodice
00050000-55ef-d341-2029-34d1efabdfdd	3212	Vojnik\t
00050000-55ef-d341-233e-6529915afabe	5293	Volčja Draga
00050000-55ef-d341-264b-31677de25ca1	2232	Voličina
00050000-55ef-d341-26d4-2f7d2d747fa1	3305	Vransko
00050000-55ef-d341-c80b-cddf7826082a	6217	Vremski Britof
00050000-55ef-d341-5974-88e86a949bc2	1360	Vrhnika
00050000-55ef-d341-f54e-dfbadf590f55	2365	Vuhred
00050000-55ef-d341-92d4-816ab2353e58	2367	Vuzenica
00050000-55ef-d341-efae-f37ba0804e60	8292	Zabukovje 
00050000-55ef-d341-03ea-0543eb368dcd	1410	Zagorje ob Savi
00050000-55ef-d341-3f1a-d47e4b46dcde	1303	Zagradec
00050000-55ef-d341-65c8-6febd772679b	2283	Zavrč
00050000-55ef-d341-caa4-0b68c07b48eb	8272	Zdole 
00050000-55ef-d341-dba9-dcef8bfb5833	4201	Zgornja Besnica
00050000-55ef-d341-2b62-82c402ed1d8a	2242	Zgornja Korena
00050000-55ef-d341-3839-f1f9d4b243cc	2201	Zgornja Kungota
00050000-55ef-d341-ca2f-a7d5d490a509	2316	Zgornja Ložnica
00050000-55ef-d341-56cb-1936152274b1	2314	Zgornja Polskava
00050000-55ef-d341-9f7c-dc987c4b790e	2213	Zgornja Velka
00050000-55ef-d341-10a9-bcdb3150196b	4247	Zgornje Gorje
00050000-55ef-d341-5540-deefa19b7a8d	4206	Zgornje Jezersko
00050000-55ef-d341-396e-3cc71f342ec3	2285	Zgornji Leskovec
00050000-55ef-d341-5f4f-06fe50b5fe0e	1432	Zidani Most
00050000-55ef-d341-3aed-afe8cd133b04	3214	Zreče
00050000-55ef-d341-f9c0-052aaae3c0e0	4209	Žabnica
00050000-55ef-d341-e016-2ace5a4bed1e	3310	Žalec
00050000-55ef-d341-818b-a24047727954	4228	Železniki
00050000-55ef-d341-6acf-0a089e318568	2287	Žetale
00050000-55ef-d341-738f-12f491e41dd3	4226	Žiri
00050000-55ef-d341-8957-0276ebc4dc26	4274	Žirovnica
00050000-55ef-d341-3185-c8bd8446ea2f	8360	Žužemberk
\.


--
-- TOC entry 2932 (class 0 OID 18134155)
-- Dependencies: 202
-- Data for Name: postavkaracuna; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkaracuna (id, racun_id) FROM stdin;
\.


--
-- TOC entry 2915 (class 0 OID 18133965)
-- Dependencies: 185
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
00060000-55ef-d343-ba3b-83b1843d5d02	00080000-55ef-d342-4553-e65a870dd394	\N	00040000-55ef-d341-c063-5e7f3280d07a	Narodni dom	\N	Koroška 15	\N	9231	Beltinci	\N	f	t
00060000-55ef-d343-9301-a29d6f1cc952	00080000-55ef-d342-4553-e65a870dd394	\N	00040000-55ef-d341-c063-5e7f3280d07a	Korotan	\N	Koroška 22	\N	9231	Beltinci	\N	f	f
00060000-55ef-d343-c6e0-5a330ea3ba50	00080000-55ef-d342-f048-781fb918deec	\N	00040000-55ef-d341-c063-5e7f3280d07a	Rimljan	\N	Rimska ploščad 7	\N	9231	Beltinci	\N	f	t
\.


--
-- TOC entry 2921 (class 0 OID 18134043)
-- Dependencies: 191
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id) FROM stdin;
\.


--
-- TOC entry 2934 (class 0 OID 18134167)
-- Dependencies: 204
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 2958 (class 0 OID 18134523)
-- Dependencies: 228
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, koproducent_id, odstotekfinanciranja, delez, maticnikop, kpe, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 2959 (class 0 OID 18134533)
-- Dependencies: 229
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, sifra, status) FROM stdin;
00190000-55ef-d343-d895-387b800cb373	00080000-55ef-d342-db6f-569034539222	0987	AK
00190000-55ef-d343-eb9e-000f587f16b9	00080000-55ef-d342-f048-781fb918deec	0989	AK
00190000-55ef-d343-8fb2-4d63498eb6b2	00080000-55ef-d342-ebaf-14be82cd8f4e	0986	AK
00190000-55ef-d343-bbb8-798f2d18974e	00080000-55ef-d342-4ff4-5a8e1080e1cd	0984	AK
00190000-55ef-d343-aae9-238a06d9c7df	00080000-55ef-d342-b7ee-891726b0cc8e	0983	AK
00190000-55ef-d343-7f31-8dba60a04ae8	00080000-55ef-d342-b21a-7969279b9a72	0982	AK
00190000-55ef-d344-f609-5a5f636831f4	00080000-55ef-d344-e266-73eac1cbb32a	1001	AK
\.


--
-- TOC entry 2957 (class 0 OID 18134480)
-- Dependencies: 227
-- Data for Name: programdela; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programdela (id, sifra, naziv, zacetek, konec, zakljuceno, potrjenprogram, stpremier, stint, stfest, strazno, stizjem, stponprem, stponprej, stponprejvelikih, stponprejmalih, stponprejmalihkopr, stponprejsredkopr, stponprejvelikihkopr, stgostujo, vrps1, vrps1do, vrps1mat, vrps1gostovsz, stizvnekomerc, stizvprem, stizvponprem, stizvponpremdoma, stizvponpremzamejo, stizvponpremgost, stizvponpremkopr, stizvponpremint, stizvponpremkoprint, stizvponprej, stizvponprejdoma, stizvponprejzamejo, stizvponprejgost, stizvponprejkopr, stizvponprejint, stizvponprejkoprint, stizvgostuj, stizvostalihnek, stizvgostovanjslo, stizvgostovanjzam, stizvgostovanjint, stobisknekom, stobisknekommat, stobisknekomgostslo, stobisknekomgostzam, stobisknekomgostint, stobiskprem, stobiskponprem, stobiskponpremdoma, stobiskponpremkopr, stobiskponpremkoprint, stobiskponpremgost, stobiskponpremzamejo, stobiskponpremint, avgobiskprired, avgzaseddvoran, avgcenavstopnice, stprodvstopnic, stkoprodukcij, stkoprodukcijint, stkoprodukcijnvo, stzaposlenih, stzaposigralcev, avgstnastopovigr, sthonorarnih, sthonorarnihigr, sthonorarnihigrtujjz, sthonorarnihigrsamoz, sredstvaint, sredstvaavt, sredstvazaprosenoprem, sredstvazaprosenoponprem, sredstvazaprosenoponprej, sredstvazaprosenogostujo, sredstvazaprosenoint, sredstvazaprosenofest, sredstvazaprosenorazno, sredstvazaprosenoizjem, sredstvadrugijavniprem, sredstvadrugijavniponprem, sredstvadrugijavniponprej, sredstvadrugijavnigostujo, sredstvadrugijavniint, sredstvadrugijavnifest, sredstvadrugijavnirazno, sredstvadrugijavniizjem, sredstvadrugiviriprem, sredstvadrugiviriponprem, sredstvadrugiviriponprej, sredstvadrugivirigostujo, sredstvadrugiviriint, sredstvadrugivirifest, sredstvadrugivirirazno, sredstvadrugiviriizjem, sredstvaavtsamoz) FROM stdin;
00290000-55ef-d343-d64b-d2ee6f3923fc	0001	Testni program dela	2016-02-01	2017-02-01	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 2960 (class 0 OID 18134541)
-- Dependencies: 230
-- Data for Name: programskaenotasklopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programskaenotasklopa (id, naslovpe, avtorpe, obsegpe, mesecpe, vrednostpe, programrazno_id) FROM stdin;
\.


--
-- TOC entry 2938 (class 0 OID 18134196)
-- Dependencies: 208
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, popa_id, naslov_id, sifra, naziv, jeprizorisce, jematicnioder, seplanira, kapaciteta, opis) FROM stdin;
00220000-55ef-d342-4f43-bfd384cffc4c	\N	\N	0001	Poskusna 1	f	\N	t	8	Poskusna učilnica v prvem
00220000-55ef-d342-4dd9-3cb6d8221da9	\N	\N	0002	Poskusna 3	f	\N	f	34	Poskusna učilnica v tretjem
00220000-55ef-d342-ea82-8bfe30d20368	\N	\N	0003	Kazinska	t	\N	t	84	Kazinska dvorana
00220000-55ef-d342-83ac-f3714705d33e	\N	\N	0004	Mali oder	t	\N	t	24	Mali oder 
00220000-55ef-d342-b0cb-326a9df23c84	\N	\N	0005	Komorni oder	t	\N	t	15	Komorni oder
00220000-55ef-d342-ec75-9dce98026fdc	\N	\N	0006	Stara dvorana	t	\N	t	96	Stara dvorana ali dvorana Franceta Prešerna
00220000-55ef-d342-01c9-be35e3003705	\N	\N	0007	Velika dvorana	t	\N	t	160	Velika, glavna dvorana
\.


--
-- TOC entry 2930 (class 0 OID 18134140)
-- Dependencies: 200
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 2929 (class 0 OID 18134130)
-- Dependencies: 199
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 2950 (class 0 OID 18134333)
-- Dependencies: 220
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta, status) FROM stdin;
\.


--
-- TOC entry 2945 (class 0 OID 18134270)
-- Dependencies: 215
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 2904 (class 0 OID 18133838)
-- Dependencies: 174
-- Data for Name: revizije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY revizije (id, razred, objectid, upor, datum, tip, data) FROM stdin;
1	App\\Entity\\Popa	00080000-55ef-d344-e266-73eac1cbb32a	00010000-55ef-d342-4427-722219a9bc2a	2015-09-09 08:35:48	INS	a:0:{}
2	App\\Entity\\Option	00000000-55ef-d344-016e-e2880ca641ff	00010000-55ef-d342-4427-722219a9bc2a	2015-09-09 08:35:48	INS	a:0:{}
3	ProgramDela\\Entity\\ProdukcijskaHisa	00190000-55ef-d344-f609-5a5f636831f4	00010000-55ef-d342-4427-722219a9bc2a	2015-09-09 08:35:48	INS	a:0:{}
\.


--
-- TOC entry 2978 (class 0 OID 0)
-- Dependencies: 173
-- Name: revizije_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('revizije_id_seq', 3, true);


--
-- TOC entry 2939 (class 0 OID 18134209)
-- Dependencies: 209
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 2908 (class 0 OID 18133876)
-- Dependencies: 178
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-55ef-d341-d9a1-e670a3a78edc	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-55ef-d341-ef87-fe19d51d0954	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-55ef-d341-9ce6-1133420b1f96	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-55ef-d341-7129-9f575a276692	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-55ef-d342-f016-54aad701db4e	planer	Planer dogodkov v koledarju	t
00020000-55ef-d342-5a9c-67829c0f6ea9	kadrovska	Kadrovska služba	t
00020000-55ef-d342-2f6c-3b1446163992	arhivar	Ažuriranje arhivalij	t
00020000-55ef-d342-7a10-3636024a874e	igralec	Igralec	t
00020000-55ef-d342-daef-e89198a4f32c	prisotnost	Vnašalec prisotnosti, tudi za tiste izven uprizoritev	t
00020000-55ef-d343-afac-7a5e6467ba1d	vsadovoljenja	Vloga z vsemi posameznimi dovoljenji	t
\.


--
-- TOC entry 2906 (class 0 OID 18133860)
-- Dependencies: 176
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-55ef-d342-da40-db669275036d	00020000-55ef-d341-9ce6-1133420b1f96
00010000-55ef-d342-4427-722219a9bc2a	00020000-55ef-d341-9ce6-1133420b1f96
00010000-55ef-d343-7a42-ee1203382435	00020000-55ef-d343-afac-7a5e6467ba1d
\.


--
-- TOC entry 2941 (class 0 OID 18134223)
-- Dependencies: 211
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 2933 (class 0 OID 18134161)
-- Dependencies: 203
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 2927 (class 0 OID 18134107)
-- Dependencies: 197
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, sifra, ime, zacetek, konec, aktivna) FROM stdin;
\.


--
-- TOC entry 2902 (class 0 OID 18133825)
-- Dependencies: 172
-- Data for Name: stevilcenje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenje (id, sifra, naziv, prefix, suffix, zacetek, dolzina, format, globalno, poletih) FROM stdin;
00230000-55ef-d341-1fc4-318415bf3f7b	pri	Privzeto številčenje po letih YYYY-N	\N	\N	1	1	%l-%n	f	t
00230000-55ef-d341-450d-6e55b7ef2f8c	123	Privzeto številčenje kratkih šifer	\N	\N	100	3	%n	f	f
00230000-55ef-d341-cf93-81468aaf1a93	bcd	Globalno številčenje črtnih kod	\N	\N	1	9	%n	t	f
00230000-55ef-d341-414a-e952b975d616	sif	Številčenje šifrant	\N	\N	1000	4	%n	f	f
00230000-55ef-d341-4428-df0635ddbd2d	tmp	Globalno številčenje začasnih številk	tmp	\N	1000	5	%l%n	t	t
\.


--
-- TOC entry 2901 (class 0 OID 18133817)
-- Dependencies: 171
-- Data for Name: stevilcenjekonfig; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjekonfig (id, stevilcenje_id, dok) FROM stdin;
00240000-55ef-d341-1ba0-59fa845c09f0	00230000-55ef-d341-414a-e952b975d616	popa
00240000-55ef-d341-d838-a027fcbe178b	00230000-55ef-d341-414a-e952b975d616	oseba
00240000-55ef-d341-1401-3b230ca79b6b	00230000-55ef-d341-414a-e952b975d616	sezona
00240000-55ef-d341-0c34-b2265d363f29	00230000-55ef-d341-450d-6e55b7ef2f8c	prostor
00240000-55ef-d341-549a-e1314dc1fc0f	00230000-55ef-d341-414a-e952b975d616	besedilo
00240000-55ef-d341-7aa9-69377d04f491	00230000-55ef-d341-414a-e952b975d616	uprizoritev
00240000-55ef-d341-f462-77ff1f16e1de	00230000-55ef-d341-414a-e952b975d616	funkcija
00240000-55ef-d341-024e-2087feb41519	00230000-55ef-d341-414a-e952b975d616	tipfunkcije
00240000-55ef-d341-72e0-34c1192deb5a	00230000-55ef-d341-414a-e952b975d616	alternacija
00240000-55ef-d341-30ff-be096d053240	00230000-55ef-d341-1fc4-318415bf3f7b	pogodba
00240000-55ef-d341-b8ad-325ecd7af85e	00230000-55ef-d341-414a-e952b975d616	zaposlitev
00240000-55ef-d341-cc02-4ed890a97c05	00230000-55ef-d341-414a-e952b975d616	zvrstuprizoritve
00240000-55ef-d341-4fe0-a52527db06a9	00230000-55ef-d341-1fc4-318415bf3f7b	programdela
00240000-55ef-d341-9bb7-429a2ea0828d	00230000-55ef-d341-414a-e952b975d616	zapis
\.


--
-- TOC entry 2900 (class 0 OID 18133812)
-- Dependencies: 170
-- Data for Name: stevilcenjestanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjestanje (id, objid, leto, stevilka) FROM stdin;
9e27a774-1b55-4260-ae90-20ae7013bb1c	00240000-55ef-d341-1ba0-59fa845c09f0	0	1001
\.


--
-- TOC entry 2946 (class 0 OID 18134280)
-- Dependencies: 216
-- Data for Name: strosekuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY strosekuprizoritve (id, uprizoritev_id, popa_id, naziv, vrednostdo, vrednostna, opis, tipstroska, sort, vrstastroska_id) FROM stdin;
00270000-55ef-d343-856c-53fdf9fd6928	000e0000-55ef-d343-19c0-c42e7025fb9f	00080000-55ef-d342-4553-e65a870dd394	Nabava kostumov	600.50	20.00	Krila in maske	materialni	1	003b0000-55ef-d341-aa26-4dc3f8d2a6f5
00270000-55ef-d343-b684-a5c682204a1c	000e0000-55ef-d343-19c0-c42e7025fb9f	00080000-55ef-d342-4553-e65a870dd394	Zavese	125.70	3.10	Modra in zelena zavesa	materialni	2	003b0000-55ef-d341-aa26-4dc3f8d2a6f5
\.


--
-- TOC entry 2913 (class 0 OID 18133938)
-- Dependencies: 183
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 2928 (class 0 OID 18134117)
-- Dependencies: 198
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja) FROM stdin;
001a0000-55ef-d343-5414-51df6d06e210	00180000-55ef-d343-6ff9-e67c0356d580	000c0000-55ef-d343-1af1-5daca74df447	00090000-55ef-d343-b344-fbc9e689b9e6	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55ef-d343-bb8a-88d1bd9392b7	00180000-55ef-d343-6ff9-e67c0356d580	000c0000-55ef-d343-fb1f-82acbdaaa309	00090000-55ef-d343-b1b8-ba76b5d27db6	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55ef-d343-21a3-76a8568d2d8b	00180000-55ef-d343-6ff9-e67c0356d580	000c0000-55ef-d343-665f-c2d21a3d76f2	00090000-55ef-d343-2bd4-3f22ce6d4ffb	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55ef-d343-4066-d5f8dd00193b	00180000-55ef-d343-6ff9-e67c0356d580	000c0000-55ef-d343-7033-d29649b755c4	00090000-55ef-d343-3d82-9e5366185db1	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55ef-d343-7680-b5bc38bdeb2b	00180000-55ef-d343-6ff9-e67c0356d580	000c0000-55ef-d343-8c77-b34e3a361bba	00090000-55ef-d343-8eeb-9d73bbe36437	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55ef-d343-7bb0-aac83e0cbc89	00180000-55ef-d343-e43a-ae9ce4396fb7	\N	00090000-55ef-d343-8eeb-9d73bbe36437	2015-08-01 20:00:00	2015-08-01 23:00:00	\N	\N	2.00
\.


--
-- TOC entry 2949 (class 0 OID 18134321)
-- Dependencies: 219
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, sifra, ime, opis, imezenski, podrocje) FROM stdin;
000f0000-55ef-d341-1f62-b4e7177c7723	01	Avtor	Avtorji	Avtorka	umetnik
000f0000-55ef-d341-bf17-d02eff6cd935	02	Priredba	Priredba	Priredba	umetnik
000f0000-55ef-d341-8403-130a2efe46f8	03	Prevod	Prevod	Prevod	umetnik
000f0000-55ef-d341-fdb4-5acffd1c169a	04	Režija	Režija	Režija	umetnik
000f0000-55ef-d341-ab32-4031a9fed2d1	05	Dramaturgija	Dramaturgija	Dramaturgija	umetnik
000f0000-55ef-d341-6833-6ac8150a2b44	06	Scenografija	Scenografija	Scenografija	umetnik
000f0000-55ef-d341-b866-f6558d1eb566	07	Kostumografija	Kostumografija	Kostumografija	umetnik
000f0000-55ef-d341-9662-8e67372e25e5	08	Koreografija	Koreografija	Koreografija	umetnik
000f0000-55ef-d341-e177-4db67d17f0e9	09	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	umetnik
000f0000-55ef-d341-20b3-45d8a5fb8100	10	Oblikovanje maske	Oblikovanje maske	Oblikovanje maske	umetnik
000f0000-55ef-d341-07cc-c8be732b29ad	11	Lektorstvo	Lektorstvo	Lektorstvo	umetnik
000f0000-55ef-d341-cee6-8553e3b18e83	12	Glasbeni soustvarjalec	Glasbeni soustvarjalci	Glasbena soustvarjalka	umetnik
000f0000-55ef-d341-c742-af553f8eb583	13	Intermedijski ustvarjalec	Intermedijski ustvarjalci	Intermedijski ustvarjalka	umetnik
000f0000-55ef-d341-fe3b-13021b3b942b	14	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	umetnik
000f0000-55ef-d341-1d16-e593d658f6d0	15	Vloga	Intermedijski ustvarjalci	Intermedijska ustvarjalka	igralec
000f0000-55ef-d341-12c7-ba328f0db063	16	Produkcija, mentorstvo	Produkcija, mentorstvo	Produkcija, mentorstvo	umetnik
000f0000-55ef-d341-972e-560ff471497e	17	Tehnična podpora	Tehnična podpora	Tehnična podpora	tehnik
000f0000-55ef-d341-fcf0-9f24961d4761	18	Inšpicient	Inšpicienti	Inšpicientka	inspicient
\.


--
-- TOC entry 2961 (class 0 OID 18134551)
-- Dependencies: 231
-- Data for Name: tipprogramskeenote; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipprogramskeenote (id, sifra, naziv, koprodukcija, maxfaktor, maxvsi) FROM stdin;
002b0000-55ef-d341-2f26-52d58d9fe28c	01	Velika predstava	f	1.00	1.00
002b0000-55ef-d341-1d80-435600bdfca0	02	Mala predstava	f	0.50	0.50
002b0000-55ef-d341-5a86-5acd0613c60b	03	Mala koprodukcija	t	0.40	1.00
002b0000-55ef-d341-d3a5-35ccd3eeb839	04	Srednja koprodukcija	t	0.70	2.00
002b0000-55ef-d341-4dc0-7cf8bf644b03	05	Velika koprodukcija	t	1.00	3.00
\.


--
-- TOC entry 2918 (class 0 OID 18134000)
-- Dependencies: 188
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 2905 (class 0 OID 18133847)
-- Dependencies: 175
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-55ef-d342-4427-722219a9bc2a	Konzolni	$2y$05$NS4xMjkyMTcwMzExMjAxROmKq0.JmNIJ5xisYZTUGbErdAYLTox.q	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-55ef-d343-364d-8e092df6f9f1	testni uporabnik za inšpicienta	$2y$05$NS4xMjkyMTcwMzExMjAxROxkJ1B6xAXex6EZLIwJfWzRJ8DpfecFO	t	\N	\N	\N	ivo@ifigenija.si	\N	\N	\N
00010000-55ef-d343-0f22-637176ff62c8	testni uporabnik za Tehničnega vodjo	$2y$05$NS4xMjkyMTcwMzExMjAxROu/kXWR9sP9oamkesKuxXLbxkCb387.G	t	\N	\N	\N	tona@ifigenija.si	\N	\N	\N
00010000-55ef-d343-b7ce-965aa1fa87c5	testni uporabnik za igralca	$2y$05$NS4xMjkyMTcwMzExMjAxRO/hLCgClfERRsfCAFYwxNCcFIVjP2982	t	\N	\N	\N	irena@ifigenija.si	\N	\N	\N
00010000-55ef-d343-cfed-bfc2d5007092	testni uporabnik vnašalca termina storitev (TerminStoritve-vse)	$2y$05$NS4xMjkyMTcwMzExMjAxROT6.kTHqEq4.wa2SOnf124/N14m9qeP.	t	\N	\N	\N	tatjana@ifigenija.si	\N	\N	\N
00010000-55ef-d343-66d0-dcc075ed5388	testni uporabnik, ki je inšpicient brez zapisov v TerminStoritve	$2y$05$NS4xMjkyMTcwMzExMjAxROHau47Dtb7CME5.nlWwBVM.nusFP.ra2	t	\N	\N	\N	joze@ifigenija.si	\N	\N	\N
00010000-55ef-d343-44cc-60b2a731a107	testna uporabnica, ki je planerka	$2y$05$NS4xMjkyMTcwMzExMjAxRO.B/uJO3C7QRNhdX9Q2hTLQsSupj1V1S	t	\N	\N	\N	petra@ifigenija.si	\N	\N	\N
00010000-55ef-d343-f94d-07eeef4ce69e	testni uporabnik, ki dobi ifi-all vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROv2d7jqhaV/Mz3EIsKoi7UoFR.SDSMBm	t	\N	\N	\N	ali@ifigenija.si	\N	\N	\N
00010000-55ef-d343-10ff-9190031185cd	testni uporabnik, ki dobi ifi-readall vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROYB9g.gnkufr1l/gWK6mkx.ySqrOWnJC	t	\N	\N	\N	berta@ifigenija.si	\N	\N	\N
00010000-55ef-d343-7717-133c6a50dd5b	testni uporabnik, ki dobi aaa-write dovoljenje	$2y$05$NS4xMjkyMTcwMzExMjAxRORujYObKX.DzpXVYbePkiJkHqg0/Ylya	t	\N	\N	\N	aaron@ifigenija.si	\N	\N	\N
00010000-55ef-d343-7a42-ee1203382435	testni uporabnik ki dobi vsa posamezna dovoljenja	$2y$05$NS4xMjkyMTcwMzExMjAxRO2ymwxVXTr7U4Ncdn.bN49E8rLw9Jg0O	t	\N	\N	\N	vesna@ifigenija.si	\N	\N	\N
00010000-55ef-d342-da40-db669275036d	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 2953 (class 0 OID 18134370)
-- Dependencies: 223
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, producent_id, sifra, faza, naslov, podnaslov, delovninaslov, internacionalninaslov, naslovizvirnika, podnaslovizvirnika, datumzacstudija, stevilovaj, planiranostevilovaj, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, krstna, prvaslovenska, kratkinaslov, maticnioder_id) FROM stdin;
000e0000-55ef-d343-7fde-e1e1c218aa92	00160000-55ef-d342-f3ea-2c990591df23	\N	00140000-55ef-d341-6105-c37c162c6c19	\N	0001	produkcija	Sen kresne noči		Sanje	\N	\N	\N	2016-02-01	\N	\N	2016-06-01	1	William Shakespeare	f	2				\N	f	\N	\N		00220000-55ef-d342-b0cb-326a9df23c84
000e0000-55ef-d343-19c0-c42e7025fb9f	00160000-55ef-d342-2413-bf86338214be	\N	00140000-55ef-d341-d279-ef661fb2a3bd	\N	0002	predprodukcija-ideja	Smoletov vrt			\N	\N	\N	2016-01-01	\N	\N	2016-04-20	2	B. Hočevar	f	2				\N	f	\N	\N		00220000-55ef-d342-ec75-9dce98026fdc
000e0000-55ef-d343-6941-92c11cabce6e	\N	\N	00140000-55ef-d341-d279-ef661fb2a3bd	00190000-55ef-d343-d895-387b800cb373	0003	postprodukcija	Kisli maček			\N	\N	\N	2016-02-01	\N	\N	2016-04-20	2	Caryl Churchill	t	2				\N	f	\N	\N		00220000-55ef-d342-b0cb-326a9df23c84
000e0000-55ef-d343-d137-400c9691f1f6	\N	\N	00140000-55ef-d341-d279-ef661fb2a3bd	00190000-55ef-d343-d895-387b800cb373	0004	postprodukcija	Vladimir			\N	\N	\N	2017-03-01	\N	\N	2017-04-20	2	Matjaž Zupančič	t	2				\N	f	\N	\N		00220000-55ef-d342-b0cb-326a9df23c84
000e0000-55ef-d343-cae6-ab66199a4b2b	\N	\N	00140000-55ef-d341-d279-ef661fb2a3bd	00190000-55ef-d343-d895-387b800cb373	0005	postprodukcija	Španska princesa			\N	\N	\N	2017-04-01	\N	\N	2017-05-20	1	Nina Kokelj	f	1				\N	f	\N	\N		00220000-55ef-d342-4f43-bfd384cffc4c
000e0000-55ef-d343-908e-058ad25efa7d	\N	\N	00140000-55ef-d341-d279-ef661fb2a3bd	00190000-55ef-d343-d895-387b800cb373	0006	postprodukcija	Ne vemo datumov			\N	\N	\N	\N	\N	\N	\N	1	Nandi Frafar	f	1				\N	f	\N	\N		00220000-55ef-d342-4f43-bfd384cffc4c
\.


--
-- TOC entry 2923 (class 0 OID 18134061)
-- Dependencies: 193
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, uprizoritev_id, vrsta, zaporedna, porocilo) FROM stdin;
00200000-55ef-d343-03cc-2c5c284c5b0f	000e0000-55ef-d343-19c0-c42e7025fb9f	\N	1	
00200000-55ef-d343-e378-859b35a918d6	000e0000-55ef-d343-19c0-c42e7025fb9f	\N	2	
\.


--
-- TOC entry 2937 (class 0 OID 18134188)
-- Dependencies: 207
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 2947 (class 0 OID 18134294)
-- Dependencies: 217
-- Data for Name: vrstastroska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstastroska (id, skupina, podskupina, naziv, opis) FROM stdin;
003b0000-55ef-d341-e104-8e172cddcedf	1	0	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE
003b0000-55ef-d341-ef0d-88fa0cc8819c	1	1	Storitve varovanja zgradb in prostorov	storitve varovanja zgradb in prostorov (npr. gasilci na predstavah)
003b0000-55ef-d341-0528-e10cf9ce4208	1	2	Založniške in tiskarske storitve	založniške in tiskarske storitve
003b0000-55ef-d341-a8ce-67edeac100e9	1	3	Časopisi, revije, knjige in strokovna literatura	časopisi, revije, knjige in strokovna literatura
003b0000-55ef-d341-ad18-95f42b6f4552	1	4	Stroški prevajalskih storitev	stroški prevajalskih storitev
003b0000-55ef-d341-9c17-09295cfbfa63	1	5	Stroški oglaševalskih storitev	stroški oglaševalskih storitev
003b0000-55ef-d341-50ae-b6251cefc059	1	6	Izdatki za reprezentanco	izdatki za reprezentanco
003b0000-55ef-d341-7eab-9cc17caa7c66	2	0	POSEBNI MATERIAL IN STORITVE	POSEBNI MATERIAL IN STORITVE
003b0000-55ef-d341-aa26-4dc3f8d2a6f5	2	1	Drugi posebni material in storitve	drugi posebni material in storitve (npr. za instrumete - navedite)
003b0000-55ef-d341-f51f-4873aad56664	2	2	Oprema predstave – stroški rekvizitov	Oprema predstave – stroški rekvizitov
003b0000-55ef-d341-f83a-99583a404339	2	3	Oprema predstave – stroški kostumov	Oprema predstave – stroški kostumov
003b0000-55ef-d341-1286-9313e88a3c76	2	4	Oprema predstave – stroški scenske opreme	Oprema predstave – stroški scenske opreme
003b0000-55ef-d341-141e-39f3ccc6f053	2	5	Oprema predstave – stroški avdio in video opreme	Oprema predstave – stroški avdio in video opreme
003b0000-55ef-d341-c3e8-483f6a6dedc0	3	0	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE
003b0000-55ef-d341-b3f9-cc2c18c98e13	3	1	Poštnina in kurirske storitve	poštnina in kurirske storitve
003b0000-55ef-d341-a1c5-dff820068cd9	4	0	PREVOZNI STROŠKI IN STORITVE	PREVOZNI STROŠKI IN STORITVE
003b0000-55ef-d341-aa39-51f01c547362	4	1	Goriva in maziva za prevozna sredstva	goriva in maziva za prevozna sredstva
003b0000-55ef-d341-0e91-da10168d21c2	4	2	Najem vozil in selitveni stroški	najem vozil in selitveni stroški
003b0000-55ef-d341-cd2b-97faeb27d63d	4	3	Drugi prevozni in transportni stroški 	drugi prevozni in transportni stroški (navedite)
003b0000-55ef-d341-1ea5-80ee480dc51d	5	0	IZDATKI ZA SLUŽBENA POTOVANJA	IZDATKI ZA SLUŽBENA POTOVANJA
003b0000-55ef-d341-7495-c4ebc31ab6c6	5	1	Dnevnice za službena potovanja v državi in tujini	dnevnice za službena potovanja v državi in tujini
003b0000-55ef-d341-0720-fac586bf2823	5	2	Hotelske in restavra. storitve v državi in tujini	hotelske in restavra. storitve v državi in tujini
003b0000-55ef-d341-a875-eb27ff410f80	5	3	Stroški prevoza v državi in tujini	stroški prevoza v državi in tujini
003b0000-55ef-d341-64a6-ea878a6feeb3	5	4	Drugi izdatki za službena potovanja	drugi izdatki za službena potovanja (navedite)
003b0000-55ef-d341-976f-e172851d24e1	6	0	NAJEMNINE IN ZAKUPNINE	NAJEMNINE IN ZAKUPNINE
003b0000-55ef-d341-64fb-c7d8a3181139	6	1	Druge najemnine, zakupnine in licenčnine	druge najemnine, zakupnine in licenčnine (npr. najem notnega materiala, instrumentov - navedite)
003b0000-55ef-d341-187e-0f0f4dfdd490	7	0	DRUGI OPERATIVNI ODHODKI	DRUGI OPERATIVNI ODHODKI
003b0000-55ef-d341-4081-8e93ec80c7c7	7	1	Izdatki za strok. izobraževanje zap.	izdatki za strok. izobraževanje zap.(vezani na program. enote)  
\.


--
-- TOC entry 2964 (class 0 OID 18134597)
-- Dependencies: 234
-- Data for Name: vrstazapisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstazapisa (id, oznaka, naziv, aktiven, znacka, ikona, upor, datknj) FROM stdin;
\.


--
-- TOC entry 2963 (class 0 OID 18134569)
-- Dependencies: 233
-- Data for Name: zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapis (id, vrsta_id, datoteka_id, mapa_id, avtor_id, zaklenil_id, tip, zaklenjen, datumzaklepanja, identifier, subject, title, description, coverage, creator, language, date, publisher, relation, rights, source, upor, datknj, standard, lokacija) FROM stdin;
\.


--
-- TOC entry 2965 (class 0 OID 18134609)
-- Dependencies: 235
-- Data for Name: zapislastnik; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapislastnik (id, zapis_id, lastnik, classlastnika, datum, upor, datknj) FROM stdin;
\.


--
-- TOC entry 2944 (class 0 OID 18134260)
-- Dependencies: 214
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, sifra, status, delovnomesto, zacetek, konec, tip, delovnaobveza, malica, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci) FROM stdin;
00100000-55ef-d343-a119-b9e67a361728	00090000-55ef-d343-b1b8-ba76b5d27db6	01	A	Mojster	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55ef-d343-ae4b-0961055002e0	00090000-55ef-d343-2bd4-3f22ce6d4ffb	02	A	Igralec	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55ef-d343-a8fd-58a3d1626baf	00090000-55ef-d343-3566-59bf797f0d03	03	A	Natakar	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55ef-d343-26c5-732ed2791f73	00090000-55ef-d343-974a-7812a5def94f	04	A	Mizar	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55ef-d343-9287-1c8fc00155ba	00090000-55ef-d343-b344-fbc9e689b9e6	05	A	Šivilja	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55ef-d343-1f0d-a479d372563a	00090000-55ef-d343-afc7-1ceecf345849	06	A	Inšpicient	2010-02-01	2010-02-01	1	2		t	f	f	t
\.


--
-- TOC entry 2925 (class 0 OID 18134097)
-- Dependencies: 195
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id) FROM stdin;
\.


--
-- TOC entry 2952 (class 0 OID 18134360)
-- Dependencies: 222
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, sifra, naziv, opis) FROM stdin;
00140000-55ef-d341-6105-c37c162c6c19	01	Drama	drama (SURS 01)
00140000-55ef-d341-e5c9-2d007354f032	02	Opera	opera (SURS 02)
00140000-55ef-d341-5a2c-ff47c2df5deb	03	Balet	balet (SURS 03)
00140000-55ef-d341-8263-890bda7e89f5	04	Plesne prireditve	plesne prireditve (SURS 04)
00140000-55ef-d341-101f-e53dec23049a	05	Lutkovno gledališče	lutkovno gledališče (SURS 05)
00140000-55ef-d341-d279-ef661fb2a3bd	06	Raziskovalno gledališče	raziskovalno gledališče (SURS 06)
00140000-55ef-d341-024a-60b9e49f123f	07	Drugo	drugo (SURS 07)
\.


--
-- TOC entry 2943 (class 0 OID 18134250)
-- Dependencies: 213
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, sifra, naziv, opis) FROM stdin;
\.


--
-- TOC entry 2457 (class 2606 OID 18133901)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2635 (class 2606 OID 18134419)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2631 (class 2606 OID 18134409)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2605 (class 2606 OID 18134319)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2688 (class 2606 OID 18134649)
-- Name: datoteka_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT datoteka_pkey PRIMARY KEY (id);


--
-- TOC entry 2511 (class 2606 OID 18134086)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2525 (class 2606 OID 18134106)
-- Name: dogodeksplosni_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodeksplosni
    ADD CONSTRAINT dogodeksplosni_pkey PRIMARY KEY (id);


--
-- TOC entry 2664 (class 2606 OID 18134567)
-- Name: drugivir_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT drugivir_pkey PRIMARY KEY (id);


--
-- TOC entry 2491 (class 2606 OID 18134026)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2642 (class 2606 OID 18134474)
-- Name: enotaprograma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT enotaprograma_pkey PRIMARY KEY (id);


--
-- TOC entry 2583 (class 2606 OID 18134246)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2505 (class 2606 OID 18134059)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2499 (class 2606 OID 18134040)
-- Name: kontaktnaoseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT kontaktnaoseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2547 (class 2606 OID 18134153)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2682 (class 2606 OID 18134626)
-- Name: mapa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT mapa_pkey PRIMARY KEY (id);


--
-- TOC entry 2686 (class 2606 OID 18134633)
-- Name: mapa_zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT mapa_zapis_pkey PRIMARY KEY (mapa_id, zapis_id);


--
-- TOC entry 2693 (class 2606 OID 18134657)
-- Name: mapaacl_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT mapaacl_pkey PRIMARY KEY (id);


--
-- TOC entry 2559 (class 2606 OID 18134180)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2484 (class 2606 OID 18133998)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2461 (class 2606 OID 18133910)
-- Name: optionvalue_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT optionvalue_pkey PRIMARY KEY (id);


--
-- TOC entry 2464 (class 2606 OID 18133934)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2455 (class 2606 OID 18133890)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2448 (class 2606 OID 18133875)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2562 (class 2606 OID 18134186)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2576 (class 2606 OID 18134222)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2617 (class 2606 OID 18134355)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2473 (class 2606 OID 18133962)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2481 (class 2606 OID 18133986)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2551 (class 2606 OID 18134159)
-- Name: postavkaracuna_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT postavkaracuna_pkey PRIMARY KEY (id);


--
-- TOC entry 2479 (class 2606 OID 18133976)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2503 (class 2606 OID 18134047)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2557 (class 2606 OID 18134171)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2653 (class 2606 OID 18134530)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2655 (class 2606 OID 18134538)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2649 (class 2606 OID 18134522)
-- Name: programdela_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT programdela_pkey PRIMARY KEY (id);


--
-- TOC entry 2660 (class 2606 OID 18134549)
-- Name: programskaenotasklopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT programskaenotasklopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2569 (class 2606 OID 18134204)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2545 (class 2606 OID 18134144)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2539 (class 2606 OID 18134135)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2612 (class 2606 OID 18134343)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2596 (class 2606 OID 18134277)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2440 (class 2606 OID 18133846)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2574 (class 2606 OID 18134213)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2446 (class 2606 OID 18133864)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2450 (class 2606 OID 18133884)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2581 (class 2606 OID 18134231)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2553 (class 2606 OID 18134166)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2527 (class 2606 OID 18134115)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2437 (class 2606 OID 18133834)
-- Name: stevilcenje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenje
    ADD CONSTRAINT stevilcenje_pkey PRIMARY KEY (id);


--
-- TOC entry 2434 (class 2606 OID 18133822)
-- Name: stevilcenjekonfig_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT stevilcenjekonfig_pkey PRIMARY KEY (id);


--
-- TOC entry 2431 (class 2606 OID 18133816)
-- Name: stevilcenjestanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjestanje
    ADD CONSTRAINT stevilcenjestanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2601 (class 2606 OID 18134290)
-- Name: strosekuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT strosekuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2470 (class 2606 OID 18133943)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2533 (class 2606 OID 18134126)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2608 (class 2606 OID 18134330)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2662 (class 2606 OID 18134561)
-- Name: tipprogramskeenote_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipprogramskeenote
    ADD CONSTRAINT tipprogramskeenote_pkey PRIMARY KEY (id);


--
-- TOC entry 2489 (class 2606 OID 18134011)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2442 (class 2606 OID 18133859)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2629 (class 2606 OID 18134388)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2509 (class 2606 OID 18134069)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2565 (class 2606 OID 18134194)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2603 (class 2606 OID 18134302)
-- Name: vrstastroska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstastroska
    ADD CONSTRAINT vrstastroska_pkey PRIMARY KEY (id);


--
-- TOC entry 2675 (class 2606 OID 18134607)
-- Name: vrstazapisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstazapisa
    ADD CONSTRAINT vrstazapisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2672 (class 2606 OID 18134591)
-- Name: zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT zapis_pkey PRIMARY KEY (id);


--
-- TOC entry 2678 (class 2606 OID 18134615)
-- Name: zapislastnik_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT zapislastnik_pkey PRIMARY KEY (id);


--
-- TOC entry 2592 (class 2606 OID 18134268)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2523 (class 2606 OID 18134101)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2621 (class 2606 OID 18134368)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2589 (class 2606 OID 18134258)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2512 (class 1259 OID 18134095)
-- Name: dogodki_konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_konec ON dogodek USING btree (konec);


--
-- TOC entry 2513 (class 1259 OID 18134096)
-- Name: dogodki_razred; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_razred ON dogodek USING btree (razred);


--
-- TOC entry 2514 (class 1259 OID 18134094)
-- Name: dogodki_zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2515 (class 1259 OID 18134093)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2597 (class 1259 OID 18134291)
-- Name: idx_11ffe6e05c75296c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e05c75296c ON strosekuprizoritve USING btree (vrstastroska_id);


--
-- TOC entry 2598 (class 1259 OID 18134292)
-- Name: idx_11ffe6e062b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e062b4ffca ON strosekuprizoritve USING btree (uprizoritev_id);


--
-- TOC entry 2599 (class 1259 OID 18134293)
-- Name: idx_11ffe6e06beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e06beede51 ON strosekuprizoritve USING btree (popa_id);


--
-- TOC entry 2679 (class 1259 OID 18134628)
-- Name: idx_14a5d6d3727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d3727aca70 ON mapa USING btree (parent_id);


--
-- TOC entry 2680 (class 1259 OID 18134627)
-- Name: idx_14a5d6d38a4a6c12; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d38a4a6c12 ON mapa USING btree (lastnik_id);


--
-- TOC entry 2471 (class 1259 OID 18133964)
-- Name: idx_1c7adba5ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba5ee4b985a ON popa USING btree (drzava_id);


--
-- TOC entry 2560 (class 1259 OID 18134187)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2666 (class 1259 OID 18134595)
-- Name: idx_1ed92829253c4123; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829253c4123 ON zapis USING btree (avtor_id);


--
-- TOC entry 2667 (class 1259 OID 18134594)
-- Name: idx_1ed9282957ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282957ed422f ON zapis USING btree (mapa_id);


--
-- TOC entry 2668 (class 1259 OID 18134596)
-- Name: idx_1ed9282987ff3295; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282987ff3295 ON zapis USING btree (zaklenil_id);


--
-- TOC entry 2669 (class 1259 OID 18134593)
-- Name: idx_1ed92829a54dbb1f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829a54dbb1f ON zapis USING btree (datoteka_id);


--
-- TOC entry 2670 (class 1259 OID 18134592)
-- Name: idx_1ed92829ef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829ef943358 ON zapis USING btree (vrsta_id);


--
-- TOC entry 2554 (class 1259 OID 18134173)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2555 (class 1259 OID 18134172)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2507 (class 1259 OID 18134070)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2584 (class 1259 OID 18134247)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2585 (class 1259 OID 18134249)
-- Name: idx_23aeb9586b361365; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9586b361365 ON funkcija USING btree (tipfunkcije_id);


--
-- TOC entry 2586 (class 1259 OID 18134248)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2496 (class 1259 OID 18134042)
-- Name: idx_2942b10710389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b10710389148 ON kontaktnaoseba USING btree (oseba_id);


--
-- TOC entry 2497 (class 1259 OID 18134041)
-- Name: idx_2942b1076beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b1076beede51 ON kontaktnaoseba USING btree (popa_id);


--
-- TOC entry 2658 (class 1259 OID 18134550)
-- Name: idx_2d901816d6bc69d6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2d901816d6bc69d6 ON programskaenotasklopa USING btree (programrazno_id);


--
-- TOC entry 2613 (class 1259 OID 18134357)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2614 (class 1259 OID 18134358)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2615 (class 1259 OID 18134359)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2676 (class 1259 OID 18134616)
-- Name: idx_2eaff9dcaf91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2eaff9dcaf91ecd ON zapislastnik USING btree (zapis_id);


--
-- TOC entry 2622 (class 1259 OID 18134393)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2623 (class 1259 OID 18134390)
-- Name: idx_344a77a7c3b0d59; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a7c3b0d59 ON uprizoritev USING btree (maticnioder_id);


--
-- TOC entry 2624 (class 1259 OID 18134394)
-- Name: idx_344a77a853a965c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a853a965c ON uprizoritev USING btree (producent_id);


--
-- TOC entry 2625 (class 1259 OID 18134392)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2626 (class 1259 OID 18134391)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2486 (class 1259 OID 18134013)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2487 (class 1259 OID 18134012)
-- Name: idx_37f6541a6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a6beede51 ON trr USING btree (popa_id);


--
-- TOC entry 2462 (class 1259 OID 18133937)
-- Name: idx_466966d769e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_466966d769e8d4 ON oseba USING btree (naslov_id);


--
-- TOC entry 2572 (class 1259 OID 18134214)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2452 (class 1259 OID 18133891)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2453 (class 1259 OID 18133892)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2577 (class 1259 OID 18134234)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2578 (class 1259 OID 18134233)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2579 (class 1259 OID 18134232)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2500 (class 1259 OID 18134048)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2501 (class 1259 OID 18134049)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2432 (class 1259 OID 18133824)
-- Name: idx_6054e804ff55f926; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_6054e804ff55f926 ON stevilcenjekonfig USING btree (stevilcenje_id);


--
-- TOC entry 2534 (class 1259 OID 18134139)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2535 (class 1259 OID 18134137)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2536 (class 1259 OID 18134136)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2537 (class 1259 OID 18134138)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2443 (class 1259 OID 18133865)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2444 (class 1259 OID 18133866)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2563 (class 1259 OID 18134195)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2689 (class 1259 OID 18134650)
-- Name: idx_781826c67e3c61f9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_781826c67e3c61f9 ON datoteka USING btree (owner_id);


--
-- TOC entry 2690 (class 1259 OID 18134658)
-- Name: idx_7adc957157ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc957157ed422f ON mapaacl USING btree (mapa_id);


--
-- TOC entry 2691 (class 1259 OID 18134659)
-- Name: idx_7adc9571fa6311ef; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc9571fa6311ef ON mapaacl USING btree (perm_id);


--
-- TOC entry 2549 (class 1259 OID 18134160)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2593 (class 1259 OID 18134278)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2594 (class 1259 OID 18134279)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2643 (class 1259 OID 18134479)
-- Name: idx_8787a0e54ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e54ae1cd1c ON enotaprograma USING btree (gostitelj_id);


--
-- TOC entry 2644 (class 1259 OID 18134478)
-- Name: idx_8787a0e55d0da56c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e55d0da56c ON enotaprograma USING btree (drzavagostovanja_id);


--
-- TOC entry 2645 (class 1259 OID 18134475)
-- Name: idx_8787a0e562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e562b4ffca ON enotaprograma USING btree (uprizoritev_id);


--
-- TOC entry 2646 (class 1259 OID 18134476)
-- Name: idx_8787a0e57222d84b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e57222d84b ON enotaprograma USING btree (tipprogramskeenote_id);


--
-- TOC entry 2647 (class 1259 OID 18134477)
-- Name: idx_8787a0e5771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e5771ec7bd ON enotaprograma USING btree (program_dela_id);


--
-- TOC entry 2475 (class 1259 OID 18133978)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2476 (class 1259 OID 18133977)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2477 (class 1259 OID 18133979)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2566 (class 1259 OID 18134208)
-- Name: idx_952dd21969e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd21969e8d4 ON prostor USING btree (naslov_id);


--
-- TOC entry 2567 (class 1259 OID 18134207)
-- Name: idx_952dd2196beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd2196beede51 ON prostor USING btree (popa_id);


--
-- TOC entry 2650 (class 1259 OID 18134531)
-- Name: idx_97af082e38c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e38c06eb ON produkcijadelitev USING btree (enotaprograma_id);


--
-- TOC entry 2651 (class 1259 OID 18134532)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2636 (class 1259 OID 18134423)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2637 (class 1259 OID 18134424)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2638 (class 1259 OID 18134421)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2639 (class 1259 OID 18134422)
-- Name: idx_a4b7244fa4976613; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fa4976613 ON alternacija USING btree (zaposlitev_id);


--
-- TOC entry 2590 (class 1259 OID 18134269)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2540 (class 1259 OID 18134148)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2541 (class 1259 OID 18134147)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2542 (class 1259 OID 18134145)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2543 (class 1259 OID 18134146)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2632 (class 1259 OID 18134411)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2633 (class 1259 OID 18134410)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2506 (class 1259 OID 18134060)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2665 (class 1259 OID 18134568)
-- Name: idx_e7d4cf2638c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e7d4cf2638c06eb ON drugivir USING btree (enotaprograma_id);


--
-- TOC entry 2683 (class 1259 OID 18134634)
-- Name: idx_e9f8ee8257ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee8257ed422f ON mapa_zapis USING btree (mapa_id);


--
-- TOC entry 2684 (class 1259 OID 18134635)
-- Name: idx_e9f8ee82af91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee82af91ecd ON mapa_zapis USING btree (zapis_id);


--
-- TOC entry 2458 (class 1259 OID 18133912)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2459 (class 1259 OID 18133911)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2467 (class 1259 OID 18133944)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2468 (class 1259 OID 18133945)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2529 (class 1259 OID 18134129)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2530 (class 1259 OID 18134128)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2531 (class 1259 OID 18134127)
-- Name: idx_fef7d84ba81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84ba81ccef6 ON terminstoritve USING btree (dogodek_id);


--
-- TOC entry 2516 (class 1259 OID 18134088)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2517 (class 1259 OID 18134089)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2518 (class 1259 OID 18134087)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2519 (class 1259 OID 18134091)
-- Name: uniq_11e93b5dbbc7a989; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dbbc7a989 ON dogodek USING btree (dogodek_splosni_id);


--
-- TOC entry 2520 (class 1259 OID 18134092)
-- Name: uniq_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2521 (class 1259 OID 18134090)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2474 (class 1259 OID 18133963)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2492 (class 1259 OID 18134027)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2493 (class 1259 OID 18134029)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2494 (class 1259 OID 18134028)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2495 (class 1259 OID 18134030)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2548 (class 1259 OID 18134154)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2618 (class 1259 OID 18134356)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2627 (class 1259 OID 18134389)
-- Name: uniq_344a77a559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_344a77a559828a3 ON uprizoritev USING btree (sifra);


--
-- TOC entry 2609 (class 1259 OID 18134331)
-- Name: uniq_3f50510d559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d559828a3 ON tipfunkcije USING btree (sifra);


--
-- TOC entry 2610 (class 1259 OID 18134332)
-- Name: uniq_3f50510d55cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d55cca980 ON tipfunkcije USING btree (ime);


--
-- TOC entry 2465 (class 1259 OID 18133935)
-- Name: uniq_466966d7559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7559828a3 ON oseba USING btree (sifra);


--
-- TOC entry 2466 (class 1259 OID 18133936)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2587 (class 1259 OID 18134259)
-- Name: uniq_5216fcb0559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5216fcb0559828a3 ON zvrstuprizoritve USING btree (sifra);


--
-- TOC entry 2438 (class 1259 OID 18133835)
-- Name: uniq_5a434fbc559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5a434fbc559828a3 ON stevilcenje USING btree (sifra);


--
-- TOC entry 2485 (class 1259 OID 18133999)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2435 (class 1259 OID 18133823)
-- Name: uniq_6054e804889a7556; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_6054e804889a7556 ON stevilcenjekonfig USING btree (dok);


--
-- TOC entry 2570 (class 1259 OID 18134206)
-- Name: uniq_952dd21937854736; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21937854736 ON prostor USING btree (naziv);


--
-- TOC entry 2571 (class 1259 OID 18134205)
-- Name: uniq_952dd219559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd219559828a3 ON prostor USING btree (sifra);


--
-- TOC entry 2640 (class 1259 OID 18134420)
-- Name: uniq_a4b7244f559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a4b7244f559828a3 ON alternacija USING btree (sifra);


--
-- TOC entry 2482 (class 1259 OID 18133987)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2619 (class 1259 OID 18134369)
-- Name: uniq_cede8e36559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_cede8e36559828a3 ON zvrstsurs USING btree (sifra);


--
-- TOC entry 2673 (class 1259 OID 18134608)
-- Name: uniq_de1c8aa1d55226c7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_de1c8aa1d55226c7 ON vrstazapisa USING btree (oznaka);


--
-- TOC entry 2656 (class 1259 OID 18134539)
-- Name: uniq_e6fc2028559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc2028559828a3 ON produkcijskahisa USING btree (sifra);


--
-- TOC entry 2657 (class 1259 OID 18134540)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2606 (class 1259 OID 18134320)
-- Name: uniq_ec773670ca2e5fcb; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ec773670ca2e5fcb ON besedilo USING btree (stevilka);


--
-- TOC entry 2528 (class 1259 OID 18134116)
-- Name: uniq_ecc8f8c5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ecc8f8c5559828a3 ON sezona USING btree (sifra);


--
-- TOC entry 2451 (class 1259 OID 18133885)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2722 (class 2606 OID 18134780)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2721 (class 2606 OID 18134785)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2717 (class 2606 OID 18134805)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2723 (class 2606 OID 18134775)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2719 (class 2606 OID 18134795)
-- Name: fk_11e93b5dbbc7a989; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dbbc7a989 FOREIGN KEY (dogodek_splosni_id) REFERENCES dogodeksplosni(id);


--
-- TOC entry 2718 (class 2606 OID 18134800)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2720 (class 2606 OID 18134790)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2755 (class 2606 OID 18134955)
-- Name: fk_11ffe6e05c75296c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e05c75296c FOREIGN KEY (vrstastroska_id) REFERENCES vrstastroska(id);


--
-- TOC entry 2754 (class 2606 OID 18134960)
-- Name: fk_11ffe6e062b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e062b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2753 (class 2606 OID 18134965)
-- Name: fk_11ffe6e06beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e06beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2786 (class 2606 OID 18135125)
-- Name: fk_14a5d6d3727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d3727aca70 FOREIGN KEY (parent_id) REFERENCES mapa(id);


--
-- TOC entry 2787 (class 2606 OID 18135120)
-- Name: fk_14a5d6d38a4a6c12; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d38a4a6c12 FOREIGN KEY (lastnik_id) REFERENCES uporabniki(id);


--
-- TOC entry 2705 (class 2606 OID 18134715)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2739 (class 2606 OID 18134885)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2781 (class 2606 OID 18135105)
-- Name: fk_1ed92829253c4123; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829253c4123 FOREIGN KEY (avtor_id) REFERENCES uporabniki(id);


--
-- TOC entry 2782 (class 2606 OID 18135100)
-- Name: fk_1ed9282957ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282957ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2780 (class 2606 OID 18135110)
-- Name: fk_1ed9282987ff3295; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282987ff3295 FOREIGN KEY (zaklenil_id) REFERENCES uporabniki(id);


--
-- TOC entry 2783 (class 2606 OID 18135095)
-- Name: fk_1ed92829a54dbb1f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829a54dbb1f FOREIGN KEY (datoteka_id) REFERENCES datoteka(id);


--
-- TOC entry 2784 (class 2606 OID 18135090)
-- Name: fk_1ed92829ef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829ef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstazapisa(id);


--
-- TOC entry 2737 (class 2606 OID 18134880)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2738 (class 2606 OID 18134875)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2716 (class 2606 OID 18134770)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2749 (class 2606 OID 18134925)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2747 (class 2606 OID 18134935)
-- Name: fk_23aeb9586b361365; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9586b361365 FOREIGN KEY (tipfunkcije_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2748 (class 2606 OID 18134930)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2711 (class 2606 OID 18134750)
-- Name: fk_2942b10710389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b10710389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2712 (class 2606 OID 18134745)
-- Name: fk_2942b1076beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b1076beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2735 (class 2606 OID 18134865)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2778 (class 2606 OID 18135080)
-- Name: fk_2d901816d6bc69d6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT fk_2d901816d6bc69d6 FOREIGN KEY (programrazno_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2758 (class 2606 OID 18134970)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2757 (class 2606 OID 18134975)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2756 (class 2606 OID 18134980)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 2785 (class 2606 OID 18135115)
-- Name: fk_2eaff9dcaf91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT fk_2eaff9dcaf91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id);


--
-- TOC entry 2760 (class 2606 OID 18135000)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2763 (class 2606 OID 18134985)
-- Name: fk_344a77a7c3b0d59; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a7c3b0d59 FOREIGN KEY (maticnioder_id) REFERENCES prostor(id);


--
-- TOC entry 2759 (class 2606 OID 18135005)
-- Name: fk_344a77a853a965c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a853a965c FOREIGN KEY (producent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2761 (class 2606 OID 18134995)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2762 (class 2606 OID 18134990)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2709 (class 2606 OID 18134740)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2710 (class 2606 OID 18134735)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2701 (class 2606 OID 18134700)
-- Name: fk_466966d769e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d769e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2702 (class 2606 OID 18134695)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2743 (class 2606 OID 18134905)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2698 (class 2606 OID 18134675)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2697 (class 2606 OID 18134680)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2744 (class 2606 OID 18134920)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2745 (class 2606 OID 18134915)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2746 (class 2606 OID 18134910)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2714 (class 2606 OID 18134755)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2713 (class 2606 OID 18134760)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2694 (class 2606 OID 18134660)
-- Name: fk_6054e804ff55f926; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT fk_6054e804ff55f926 FOREIGN KEY (stevilcenje_id) REFERENCES stevilcenje(id);


--
-- TOC entry 2727 (class 2606 OID 18134840)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2729 (class 2606 OID 18134830)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2730 (class 2606 OID 18134825)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2728 (class 2606 OID 18134835)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2696 (class 2606 OID 18134665)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2695 (class 2606 OID 18134670)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2740 (class 2606 OID 18134890)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2790 (class 2606 OID 18135140)
-- Name: fk_781826c67e3c61f9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT fk_781826c67e3c61f9 FOREIGN KEY (owner_id) REFERENCES uporabniki(id);


--
-- TOC entry 2792 (class 2606 OID 18135145)
-- Name: fk_7adc957157ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc957157ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2791 (class 2606 OID 18135150)
-- Name: fk_7adc9571fa6311ef; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc9571fa6311ef FOREIGN KEY (perm_id) REFERENCES permission(id);


--
-- TOC entry 2736 (class 2606 OID 18134870)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2752 (class 2606 OID 18134945)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2751 (class 2606 OID 18134950)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2770 (class 2606 OID 18135060)
-- Name: fk_8787a0e54ae1cd1c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e54ae1cd1c FOREIGN KEY (gostitelj_id) REFERENCES popa(id);


--
-- TOC entry 2771 (class 2606 OID 18135055)
-- Name: fk_8787a0e55d0da56c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e55d0da56c FOREIGN KEY (drzavagostovanja_id) REFERENCES drza(id);


--
-- TOC entry 2774 (class 2606 OID 18135040)
-- Name: fk_8787a0e562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2773 (class 2606 OID 18135045)
-- Name: fk_8787a0e57222d84b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e57222d84b FOREIGN KEY (tipprogramskeenote_id) REFERENCES tipprogramskeenote(id);


--
-- TOC entry 2772 (class 2606 OID 18135050)
-- Name: fk_8787a0e5771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e5771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2707 (class 2606 OID 18134725)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2708 (class 2606 OID 18134720)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2706 (class 2606 OID 18134730)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2741 (class 2606 OID 18134900)
-- Name: fk_952dd21969e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd21969e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2742 (class 2606 OID 18134895)
-- Name: fk_952dd2196beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd2196beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2776 (class 2606 OID 18135065)
-- Name: fk_97af082e38c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e38c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2775 (class 2606 OID 18135070)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2767 (class 2606 OID 18135030)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2766 (class 2606 OID 18135035)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2769 (class 2606 OID 18135020)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 2768 (class 2606 OID 18135025)
-- Name: fk_a4b7244fa4976613; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fa4976613 FOREIGN KEY (zaposlitev_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2750 (class 2606 OID 18134940)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2731 (class 2606 OID 18134860)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2732 (class 2606 OID 18134855)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2734 (class 2606 OID 18134845)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2733 (class 2606 OID 18134850)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2764 (class 2606 OID 18135015)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2765 (class 2606 OID 18135010)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2715 (class 2606 OID 18134765)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2777 (class 2606 OID 18135075)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2779 (class 2606 OID 18135085)
-- Name: fk_e7d4cf2638c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT fk_e7d4cf2638c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2789 (class 2606 OID 18135130)
-- Name: fk_e9f8ee8257ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee8257ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id) ON DELETE CASCADE;


--
-- TOC entry 2788 (class 2606 OID 18135135)
-- Name: fk_e9f8ee82af91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee82af91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id) ON DELETE CASCADE;


--
-- TOC entry 2699 (class 2606 OID 18134690)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2700 (class 2606 OID 18134685)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2704 (class 2606 OID 18134705)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2703 (class 2606 OID 18134710)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2724 (class 2606 OID 18134820)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2725 (class 2606 OID 18134815)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2726 (class 2606 OID 18134810)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- Completed on 2015-09-09 08:35:49 CEST

--
-- PostgreSQL database dump complete
--

