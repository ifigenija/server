--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.9
-- Dumped by pg_dump version 9.3.9
-- Started on 2015-09-08 11:02:52 CEST

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
-- TOC entry 2975 (class 0 OID 0)
-- Dependencies: 240
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_with_oids = false;

--
-- TOC entry 180 (class 1259 OID 17927784)
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
-- TOC entry 225 (class 1259 OID 17928302)
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
-- TOC entry 224 (class 1259 OID 17928285)
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
-- TOC entry 218 (class 1259 OID 17928194)
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
-- TOC entry 238 (class 1259 OID 17928526)
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
-- TOC entry 194 (class 1259 OID 17927962)
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
-- TOC entry 196 (class 1259 OID 17927993)
-- Name: dogodeksplosni; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodeksplosni (
    id uuid NOT NULL
);


--
-- TOC entry 232 (class 1259 OID 17928452)
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
-- TOC entry 189 (class 1259 OID 17927905)
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
-- TOC entry 226 (class 1259 OID 17928315)
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
-- TOC entry 212 (class 1259 OID 17928126)
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
-- TOC entry 192 (class 1259 OID 17927941)
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
-- TOC entry 190 (class 1259 OID 17927922)
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
-- TOC entry 201 (class 1259 OID 17928040)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 236 (class 1259 OID 17928507)
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
-- TOC entry 237 (class 1259 OID 17928519)
-- Name: mapa_zapis; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE mapa_zapis (
    mapa_id uuid NOT NULL,
    zapis_id uuid NOT NULL
);


--
-- TOC entry 239 (class 1259 OID 17928541)
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
-- TOC entry 205 (class 1259 OID 17928065)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 187 (class 1259 OID 17927879)
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
-- TOC entry 181 (class 1259 OID 17927793)
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
-- TOC entry 182 (class 1259 OID 17927804)
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
-- TOC entry 177 (class 1259 OID 17927758)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 179 (class 1259 OID 17927777)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 206 (class 1259 OID 17928072)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 210 (class 1259 OID 17928106)
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
-- TOC entry 221 (class 1259 OID 17928234)
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
-- TOC entry 184 (class 1259 OID 17927837)
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
-- TOC entry 186 (class 1259 OID 17927871)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 202 (class 1259 OID 17928046)
-- Name: postavkaracuna; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE postavkaracuna (
    id uuid NOT NULL,
    racun_id uuid
);


--
-- TOC entry 185 (class 1259 OID 17927856)
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
-- TOC entry 191 (class 1259 OID 17927934)
-- Name: predstava; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE predstava (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    gostovanje_id uuid
);


--
-- TOC entry 204 (class 1259 OID 17928058)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 228 (class 1259 OID 17928413)
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
-- TOC entry 229 (class 1259 OID 17928423)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    sifra character varying(4) NOT NULL,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 227 (class 1259 OID 17928370)
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
-- TOC entry 230 (class 1259 OID 17928431)
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
-- TOC entry 208 (class 1259 OID 17928087)
-- Name: prostor; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prostor (
    id uuid NOT NULL,
    popa_id uuid,
    naslov_id uuid,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) NOT NULL,
    jeprizorisce boolean,
    seplanira boolean DEFAULT false NOT NULL,
    kapaciteta integer,
    opis text
);


--
-- TOC entry 200 (class 1259 OID 17928031)
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
-- TOC entry 199 (class 1259 OID 17928021)
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
-- TOC entry 220 (class 1259 OID 17928223)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying,
    status character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 215 (class 1259 OID 17928161)
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
-- TOC entry 174 (class 1259 OID 17927729)
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
-- TOC entry 173 (class 1259 OID 17927727)
-- Name: revizije_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE revizije_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2976 (class 0 OID 0)
-- Dependencies: 173
-- Name: revizije_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE revizije_id_seq OWNED BY revizije.id;


--
-- TOC entry 209 (class 1259 OID 17928100)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 178 (class 1259 OID 17927767)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 176 (class 1259 OID 17927751)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 211 (class 1259 OID 17928114)
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
-- TOC entry 203 (class 1259 OID 17928052)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 197 (class 1259 OID 17927998)
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
-- TOC entry 172 (class 1259 OID 17927716)
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
-- TOC entry 171 (class 1259 OID 17927708)
-- Name: stevilcenjekonfig; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjekonfig (
    id uuid NOT NULL,
    stevilcenje_id uuid,
    dok character varying(100) DEFAULT NULL::character varying
);


--
-- TOC entry 170 (class 1259 OID 17927703)
-- Name: stevilcenjestanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjestanje (
    id uuid NOT NULL,
    objid uuid NOT NULL,
    leto integer NOT NULL,
    stevilka integer
);


--
-- TOC entry 216 (class 1259 OID 17928171)
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
-- TOC entry 183 (class 1259 OID 17927829)
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
-- TOC entry 198 (class 1259 OID 17928008)
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
-- TOC entry 219 (class 1259 OID 17928211)
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
-- TOC entry 231 (class 1259 OID 17928441)
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
-- TOC entry 188 (class 1259 OID 17927891)
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
-- TOC entry 175 (class 1259 OID 17927738)
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
-- TOC entry 223 (class 1259 OID 17928260)
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
-- TOC entry 193 (class 1259 OID 17927952)
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
-- TOC entry 207 (class 1259 OID 17928079)
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
-- TOC entry 217 (class 1259 OID 17928185)
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
-- TOC entry 234 (class 1259 OID 17928487)
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
-- TOC entry 233 (class 1259 OID 17928459)
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
-- TOC entry 235 (class 1259 OID 17928499)
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
-- TOC entry 214 (class 1259 OID 17928151)
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
-- TOC entry 195 (class 1259 OID 17927988)
-- Name: zasedenost; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zasedenost (
    id uuid NOT NULL
);


--
-- TOC entry 222 (class 1259 OID 17928250)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 213 (class 1259 OID 17928141)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 2178 (class 2604 OID 17927732)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 2909 (class 0 OID 17927784)
-- Dependencies: 180
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
\.


--
-- TOC entry 2954 (class 0 OID 17928302)
-- Dependencies: 225
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, zaposlitev_id, oseba_id, pogodba_id, sifra, zaposlen, zacetek, konec, opomba, sort, privzeti, aktivna, imapogodbo, pomembna) FROM stdin;
000c0000-55ee-a43b-ed80-ca2692f5d40b	000d0000-55ee-a43b-a08e-5e8574c1e259	\N	00090000-55ee-a43b-d2d9-4d295cbdf1fe	000b0000-55ee-a43b-41fd-57d1fb9b708d	0001	f	\N	\N	\N	3	t	\N	t	t
000c0000-55ee-a43b-7a8f-c45d5bb54843	000d0000-55ee-a43b-4e85-86c547800747	00100000-55ee-a43b-d2c7-552591ae7f51	00090000-55ee-a43b-1df2-5541dae698f5	\N	0002	t	2016-01-01	\N	\N	8	t	\N	f	f
000c0000-55ee-a43b-8f9d-ac1d5b981bb1	000d0000-55ee-a43b-968a-4ae2a5acf7ce	00100000-55ee-a43b-6388-f0bd6cf35521	00090000-55ee-a43b-ce08-2160cddd55c7	\N	0003	t	\N	2015-09-08	\N	2	t	\N	f	f
000c0000-55ee-a43b-c3b0-c98459643cda	000d0000-55ee-a43b-b7e4-b6a761cb2068	\N	00090000-55ee-a43b-08e0-440e59938e20	\N	0004	f	2016-01-01	2016-01-01	\N	26	t	\N	f	f
000c0000-55ee-a43b-cdba-fab6868a7881	000d0000-55ee-a43b-9ca3-6e69e21c8987	\N	00090000-55ee-a43b-ecc4-560aaaacb293	\N	0005	f	2016-01-01	2016-01-01	\N	7	t	\N	f	f
000c0000-55ee-a43b-3d57-b2f341b40f1f	000d0000-55ee-a43b-e589-3a074acb0d46	\N	00090000-55ee-a43b-a390-7a0d3f2f532c	000b0000-55ee-a43b-e754-17c170559a66	0006	f	2016-01-01	2016-01-01	\N	1	t	\N	t	t
000c0000-55ee-a43b-d626-39e49b2e4014	000d0000-55ee-a43b-9e41-df2e7388bd7c	00100000-55ee-a43b-5a51-af881c4a5918	00090000-55ee-a43b-2883-1efa6ae779dd	\N	0007	t	2016-01-01	2016-01-01	\N	14	t	\N	f	t
000c0000-55ee-a43b-0ac6-a6324544c15c	000d0000-55ee-a43b-16f1-5ee4dd49d00c	\N	00090000-55ee-a43b-b46f-07925b54ff0c	000b0000-55ee-a43b-e1ad-349249bf8671	0008	f	2016-01-01	2016-01-01	\N	12	t	\N	t	t
000c0000-55ee-a43b-40ea-e864eafae8c3	000d0000-55ee-a43b-9e41-df2e7388bd7c	00100000-55ee-a43b-a5f0-a823f5314d68	00090000-55ee-a43b-f03c-d6e235c7ca03	\N	0009	t	2017-01-01	2017-01-01	\N	15	t	\N	f	t
000c0000-55ee-a43b-8b86-90d9c717d856	000d0000-55ee-a43b-9e41-df2e7388bd7c	00100000-55ee-a43b-47bb-d391965dfb1a	00090000-55ee-a43b-86ed-d0302ce82988	\N	0010	t	\N	2015-09-08	\N	16	f	\N	f	t
000c0000-55ee-a43b-0bd4-ac9e76d9ebfd	000d0000-55ee-a43b-9e41-df2e7388bd7c	00100000-55ee-a43b-ee98-130cfbd6a28e	00090000-55ee-a43b-3203-350582406328	\N	0011	t	2017-01-01	\N	\N	17	f	\N	f	t
\.


--
-- TOC entry 2953 (class 0 OID 17928285)
-- Dependencies: 224
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 2947 (class 0 OID 17928194)
-- Dependencies: 218
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, stevilka, naslov, avtor, podnaslov, jezik, naslovizvirnika, internacionalninaslov, datumprejema, moskevloge, zenskevloge, prevajalec, povzetekvsebine, letoizida, krajizida, zaloznik) FROM stdin;
00160000-55ee-a43a-12d9-98110408992d	0001	Sen kresne noči	William Shakespeare		slovenščina	A Midsummer Night's Dream	\N	2015-04-26	5	5	Milan Jesih	Nastopajo Titanija, Hipolita, Oberon, ...	\N	\N	\N
00160000-55ee-a43a-1a12-cc487e4d6313	0002	Bratje Karamazovi	Fjodor Mihajlovič Dostojevski		slovenščina	Bratja Karamazjovji	\N	2015-12-04	4	1	Vladimir Levstik	Svetovna uspešnica	\N	\N	\N
00160000-55ee-a43a-9379-656a11155e15	0003	Smoletov Vrt	Berta Hočevar		slovenščina		\N	2015-05-26	2	8			\N	\N	\N
\.


--
-- TOC entry 2967 (class 0 OID 17928526)
-- Dependencies: 238
-- Data for Name: datoteka; Type: TABLE DATA; Schema: public; Owner: -
--

COPY datoteka (id, owner_id, filename, transfers, size, format, hash, createdat, uploadedat, upor, datknj) FROM stdin;
\.


--
-- TOC entry 2923 (class 0 OID 17927962)
-- Dependencies: 194
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_splosni_id, prostor_id, sezona_id, planiranzacetek, allday, zacetek, konec, status, razred, termin, title) FROM stdin;
00180000-55ee-a43b-fcd1-cd717a8398ca	\N	\N	00200000-55ee-a43b-958e-9db6b9a20b92	\N	\N	\N	\N	2015-06-26 10:00:00	f	2015-06-26 10:00:00	2015-06-26 12:00:00	3			
00180000-55ee-a43b-6f6f-34196d03b5e2	\N	\N	00200000-55ee-a43b-42fb-f6df37b25656	\N	\N	\N	\N	2015-06-27 10:00:00	f	2015-06-27 10:00:00	2015-06-27 12:00:00	4			
00180000-55ee-a43b-0b35-8f44d3118288	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	f	2015-08-01 20:00:00	2015-08-01 23:00:00	5			
00180000-55ee-a43b-f93f-8674987cd0b7	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	f	2015-08-01 20:00:00	2015-08-01 23:00:00	2			
00180000-55ee-a43b-0a7f-ccef06529696	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	f	2015-08-01 20:00:00	2015-08-01 23:00:00	7			
\.


--
-- TOC entry 2925 (class 0 OID 17927993)
-- Dependencies: 196
-- Data for Name: dogodeksplosni; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodeksplosni (id) FROM stdin;
\.


--
-- TOC entry 2961 (class 0 OID 17928452)
-- Dependencies: 232
-- Data for Name: drugivir; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drugivir (id, znesek, opis, mednarodni, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 2918 (class 0 OID 17927905)
-- Dependencies: 189
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-55ee-a439-169e-de247024945b	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-55ee-a439-51b4-d88d2461790d	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-55ee-a439-0995-027192826a9b	AL	ALB	008	Albania 	Albanija	\N
00040000-55ee-a439-9bc1-55de5fe34465	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-55ee-a439-e04c-b94bea631047	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-55ee-a439-c0a9-d020cdab8e83	AD	AND	020	Andorra 	Andora	\N
00040000-55ee-a439-bb32-7cc15e28549f	AO	AGO	024	Angola 	Angola	\N
00040000-55ee-a439-8371-fb756de2661f	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-55ee-a439-24de-c5b077432b10	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-55ee-a439-c812-3a6c2649c1fd	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-55ee-a439-969b-f1e9b13decbf	AR	ARG	032	Argentina 	Argenitna	\N
00040000-55ee-a439-4ea4-d687cbd30e8d	AM	ARM	051	Armenia 	Armenija	\N
00040000-55ee-a439-7522-2e4d90f7d5cf	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-55ee-a439-1c8b-e2fa983678ba	AU	AUS	036	Australia 	Avstralija	\N
00040000-55ee-a439-f8ed-ea711121d213	AT	AUT	040	Austria 	Avstrija	\N
00040000-55ee-a439-d1b1-cf65df151165	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-55ee-a439-26a8-5d7adf9dbc96	BS	BHS	044	Bahamas 	Bahami	\N
00040000-55ee-a439-7195-de76a71097ee	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-55ee-a439-35f2-7e983c62b9d8	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-55ee-a439-4b51-56dc25add08a	BB	BRB	052	Barbados 	Barbados	\N
00040000-55ee-a439-71bf-d1559fd400c5	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-55ee-a439-1777-ee6af075f430	BE	BEL	056	Belgium 	Belgija	\N
00040000-55ee-a439-fac3-6267e0bca208	BZ	BLZ	084	Belize 	Belize	\N
00040000-55ee-a439-8337-c25d052435f5	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-55ee-a439-c0cc-08d78684083b	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-55ee-a439-4d2a-6ce6d0d61218	BT	BTN	064	Bhutan 	Butan	\N
00040000-55ee-a439-ee33-5bbbcbdc4fdf	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-55ee-a439-33ee-800ca81bb324	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-55ee-a439-e6d4-71a9b7a02467	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-55ee-a439-1604-90500a081a6e	BW	BWA	072	Botswana 	Bocvana	\N
00040000-55ee-a439-feff-a02a33ee1d01	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-55ee-a439-36b9-5b14e7c39bb6	BR	BRA	076	Brazil 	Brazilija	\N
00040000-55ee-a439-8cb8-845f8857d78a	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-55ee-a439-785a-67357d786217	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-55ee-a439-2aa7-c3271936e39b	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-55ee-a439-b300-3c87ed32102b	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-55ee-a439-c01c-d91a34c65f61	BI	BDI	108	Burundi 	Burundi 	\N
00040000-55ee-a439-39f3-f8539159b735	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-55ee-a439-3eff-753583da91e0	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-55ee-a439-2973-8a366a5ccb01	CA	CAN	124	Canada 	Kanada	\N
00040000-55ee-a439-c036-ae72f427ed37	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-55ee-a439-5529-fa7d15e76119	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-55ee-a439-ba34-2848fcfbbb05	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-55ee-a439-e2aa-4b12c1158cc2	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-55ee-a439-99b9-ae77aaf7accc	CL	CHL	152	Chile 	Čile	\N
00040000-55ee-a439-f886-9e5f5613a1ac	CN	CHN	156	China 	Kitajska	\N
00040000-55ee-a439-7c04-16445d1078ba	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-55ee-a439-4ea6-ae3c714e2253	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-55ee-a439-4282-899bcded2d29	CO	COL	170	Colombia 	Kolumbija	\N
00040000-55ee-a439-39f9-155c790151ec	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-55ee-a439-fc31-169fc66ceed7	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-55ee-a439-1318-3559997bde82	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-55ee-a439-28e3-c848a42cda14	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-55ee-a439-0bff-106f48a36831	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-55ee-a439-f119-5a025654227f	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-55ee-a439-1dd0-f394fa5519d8	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-55ee-a439-c6af-73e045c66dc4	CU	CUB	192	Cuba 	Kuba	\N
00040000-55ee-a439-fd83-2ce42ea0fe0e	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-55ee-a439-9205-a2ae686b286c	CY	CYP	196	Cyprus 	Ciper	\N
00040000-55ee-a439-eb40-a8b7ccc308e6	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-55ee-a439-968e-aae2bdde2ade	DK	DNK	208	Denmark 	Danska	\N
00040000-55ee-a439-3270-45eb8fa96dad	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-55ee-a439-e3f6-e4f4fa5deb93	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-55ee-a439-8191-ec9987c97c24	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-55ee-a439-9f89-a6b88ebece8a	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-55ee-a439-cd2b-9e3dc02e412c	EG	EGY	818	Egypt 	Egipt	\N
00040000-55ee-a439-1520-142ad77158e4	SV	SLV	222	El Salvador 	Salvador	\N
00040000-55ee-a439-7aa1-b0418737e253	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-55ee-a439-f0f1-bc619befb49b	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-55ee-a439-22e4-f86dad88ce2b	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-55ee-a439-48bf-c7f882ddaad5	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-55ee-a439-9dee-891b0d421d84	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-55ee-a439-df34-2613b87ddacb	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-55ee-a439-99a3-662576f32fb9	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-55ee-a439-9909-3a4240e54c70	FI	FIN	246	Finland 	Finska	\N
00040000-55ee-a439-915c-b58960fd471f	FR	FRA	250	France 	Francija	\N
00040000-55ee-a439-7add-7004a070fc5a	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-55ee-a439-2a12-c22113422697	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-55ee-a439-3a79-f3fecd6a9ee2	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-55ee-a439-0ba3-d69be4d4c430	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-55ee-a439-413d-c6969393dd16	GA	GAB	266	Gabon 	Gabon	\N
00040000-55ee-a439-d68e-0092fe61a2ef	GM	GMB	270	Gambia 	Gambija	\N
00040000-55ee-a439-aa23-9f9b5733cd36	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-55ee-a439-e399-13642b0fd71e	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-55ee-a439-145a-ea22c3c971cd	GH	GHA	288	Ghana 	Gana	\N
00040000-55ee-a439-a108-7afbfd1171e2	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-55ee-a439-e10f-93f16bdc4234	GR	GRC	300	Greece 	Grčija	\N
00040000-55ee-a439-bfbd-da96541fc629	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-55ee-a439-6a31-6d9b6ecd1562	GD	GRD	308	Grenada 	Grenada	\N
00040000-55ee-a439-cd28-8cb22173f2ac	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-55ee-a439-18ab-fed468dafd8e	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-55ee-a439-3ab9-09b6bb99dc32	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-55ee-a439-f6bf-94840e02f36f	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-55ee-a439-7914-b7080afda04b	GN	GIN	324	Guinea 	Gvineja	\N
00040000-55ee-a439-68cb-384d2e7b2e7e	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-55ee-a439-7717-981df044e88d	GY	GUY	328	Guyana 	Gvajana	\N
00040000-55ee-a439-44d1-c4beb11bc520	HT	HTI	332	Haiti 	Haiti	\N
00040000-55ee-a439-f825-edbc6e8f4158	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-55ee-a439-0e0c-573e574cf858	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-55ee-a439-c6f9-fa861e6705d6	HN	HND	340	Honduras 	Honduras	\N
00040000-55ee-a439-1f7d-fbb8c61d4e54	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-55ee-a439-5dcf-920fc5d5f42c	HU	HUN	348	Hungary 	Madžarska	\N
00040000-55ee-a439-2f0d-09d9c7cb7709	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-55ee-a439-deb0-05a8fedef3cf	IN	IND	356	India 	Indija	\N
00040000-55ee-a439-50d8-22e1270e53c2	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-55ee-a439-107e-adad906f0117	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-55ee-a439-0281-71bda519b678	IQ	IRQ	368	Iraq 	Irak	\N
00040000-55ee-a439-fd98-bba188155dc1	IE	IRL	372	Ireland 	Irska	\N
00040000-55ee-a439-046e-e42100059f3a	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-55ee-a439-1042-d5d467a9fe33	IL	ISR	376	Israel 	Izrael	\N
00040000-55ee-a439-9e17-73bbbfd21ae4	IT	ITA	380	Italy 	Italija	\N
00040000-55ee-a439-e053-dc8a5c488cfb	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-55ee-a439-a931-7a7737c34481	JP	JPN	392	Japan 	Japonska	\N
00040000-55ee-a439-8dbf-62dd516a1bb9	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-55ee-a439-cac1-a4a03982bebc	JO	JOR	400	Jordan 	Jordanija	\N
00040000-55ee-a439-33cd-a2a3006d48e2	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-55ee-a439-37b5-e359f42e42c0	KE	KEN	404	Kenya 	Kenija	\N
00040000-55ee-a439-6c93-6d5ae1500ff2	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-55ee-a439-6405-4a21edb4b064	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-55ee-a439-7e3c-ae315ce7ede8	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-55ee-a439-db6c-4c9b8ef310f1	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-55ee-a439-6bbf-03b327f3d298	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-55ee-a439-dc65-12779f133345	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-55ee-a439-455b-15cdc83555ff	LV	LVA	428	Latvia 	Latvija	\N
00040000-55ee-a439-d2dc-1b1dd8003375	LB	LBN	422	Lebanon 	Libanon	\N
00040000-55ee-a439-f1e5-85b99a3c1531	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-55ee-a439-5052-4d06acd154e7	LR	LBR	430	Liberia 	Liberija	\N
00040000-55ee-a439-e171-2a141bdd9f08	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-55ee-a439-aaab-fd3b4e1d8044	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-55ee-a439-862c-3a8d5bec1e42	LT	LTU	440	Lithuania 	Litva	\N
00040000-55ee-a439-0530-ffd3c89f6b63	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-55ee-a439-d748-25088d48539f	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-55ee-a439-e4f2-ef86b6d8d75f	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-55ee-a439-4d5f-c51c941b9622	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-55ee-a439-727b-22d6ff964ff8	MW	MWI	454	Malawi 	Malavi	\N
00040000-55ee-a439-1711-5e3393ffb9dc	MY	MYS	458	Malaysia 	Malezija	\N
00040000-55ee-a439-410b-dc725f882fec	MV	MDV	462	Maldives 	Maldivi	\N
00040000-55ee-a439-a33f-36e929ac0305	ML	MLI	466	Mali 	Mali	\N
00040000-55ee-a439-968a-d6815e9f1eae	MT	MLT	470	Malta 	Malta	\N
00040000-55ee-a439-947f-7f5ec56f5aca	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-55ee-a439-c8bf-4aa533944da3	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-55ee-a439-53a4-e6182968dbe9	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-55ee-a439-f7b0-62d321dcf9a2	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-55ee-a439-5125-6e3cdc474897	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-55ee-a439-3979-023f2b3734e0	MX	MEX	484	Mexico 	Mehika	\N
00040000-55ee-a439-61f9-6bb7b914a1ac	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-55ee-a439-735f-8f5eda798317	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-55ee-a439-c46f-862ccf94ff98	MC	MCO	492	Monaco 	Monako	\N
00040000-55ee-a439-3ec2-dbafec0a16da	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-55ee-a439-c01a-3bbc6989bc66	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-55ee-a439-ffb8-d1484a5ac4f5	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-55ee-a439-36f3-3a046cc6fbc5	MA	MAR	504	Morocco 	Maroko	\N
00040000-55ee-a439-0145-875429713757	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-55ee-a439-dcee-c05a14360e05	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-55ee-a439-1d8a-c561c63eeeb1	NA	NAM	516	Namibia 	Namibija	\N
00040000-55ee-a439-9ef8-25bd76dee586	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-55ee-a439-04f7-44fdd1bbd658	NP	NPL	524	Nepal 	Nepal	\N
00040000-55ee-a439-619f-13fafe4c226c	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-55ee-a439-0213-07548f5502a9	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-55ee-a439-6fd5-d6269e7f4607	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-55ee-a439-c7fd-d4f0bf602f8b	NE	NER	562	Niger 	Niger 	\N
00040000-55ee-a439-4471-ab39b4775a16	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-55ee-a439-6d90-8a626a9eab81	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-55ee-a439-3164-ad0098d6abab	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-55ee-a439-a486-5e19c6261d4d	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-55ee-a439-7fcc-3dee061fbe67	NO	NOR	578	Norway 	Norveška	\N
00040000-55ee-a439-05bf-20db96c1ad8c	OM	OMN	512	Oman 	Oman	\N
00040000-55ee-a439-fbbd-c0f51e85f851	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-55ee-a439-ff96-834689edc39f	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-55ee-a439-3ba6-695529e01b48	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-55ee-a439-2aff-e6f7870165c8	PA	PAN	591	Panama 	Panama	\N
00040000-55ee-a439-1561-7333d7c1fac8	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-55ee-a439-ceb5-3c12c93b82f4	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-55ee-a439-3223-be35869f090c	PE	PER	604	Peru 	Peru	\N
00040000-55ee-a439-b0cb-b30eb2912886	PH	PHL	608	Philippines 	Filipini	\N
00040000-55ee-a439-15c4-9d5ef4282c38	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-55ee-a439-52a4-d3d279c50f10	PL	POL	616	Poland 	Poljska	\N
00040000-55ee-a439-3213-33642df167df	PT	PRT	620	Portugal 	Portugalska	\N
00040000-55ee-a439-6aef-e9ebde2ea966	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-55ee-a439-2f01-eaddf629af3c	QA	QAT	634	Qatar 	Katar	\N
00040000-55ee-a439-33f3-631729e545c4	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-55ee-a439-648f-756c4d787239	RO	ROU	642	Romania 	Romunija	\N
00040000-55ee-a439-6bf7-784c0a7b56bb	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-55ee-a439-b0bf-2dee6dc5b21b	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-55ee-a439-3741-1ad9c65b923b	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-55ee-a439-5e4d-6c109953664c	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-55ee-a439-b6f6-5e2861731b3d	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-55ee-a439-e249-1e76537b33de	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-55ee-a439-8672-5538a3382c18	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-55ee-a439-2679-86df33f151ce	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-55ee-a439-dde2-9aaed030f0ec	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-55ee-a439-3f23-b15b44bd7a2a	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-55ee-a439-192f-7277eb7f6b90	SM	SMR	674	San Marino 	San Marino	\N
00040000-55ee-a439-9487-d44d04b95ca0	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-55ee-a439-c101-630585e5bbef	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-55ee-a439-b114-8890a7e4bd90	SN	SEN	686	Senegal 	Senegal	\N
00040000-55ee-a439-a21d-fd10e763b632	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-55ee-a439-d8ec-c84b9e23994b	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-55ee-a439-bc33-e0a5fcaee7a9	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-55ee-a439-cbb8-c65e1c830f82	SG	SGP	702	Singapore 	Singapur	\N
00040000-55ee-a439-3b82-f78072e0b39c	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-55ee-a439-6829-f66d3363d726	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-55ee-a439-e737-40c8da0bf14e	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-55ee-a439-c32c-3beabf4c6646	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-55ee-a439-ef0f-e9b1d1ef91de	SO	SOM	706	Somalia 	Somalija	\N
00040000-55ee-a439-8b43-d87fc1ce2476	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-55ee-a439-6e4c-6c430cce4567	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-55ee-a439-4fa8-9d5937039546	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-55ee-a439-9ea9-99bb10dec13a	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-55ee-a439-e9b2-23a0df29e437	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-55ee-a439-bb4d-d12033545cd4	SD	SDN	729	Sudan 	Sudan	\N
00040000-55ee-a439-7229-bc77975ee0b9	SR	SUR	740	Suriname 	Surinam	\N
00040000-55ee-a439-af6d-af4ea7e64769	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-55ee-a439-e8b3-2d985ce6ae54	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-55ee-a439-8cc6-df92c3e693ac	SE	SWE	752	Sweden 	Švedska	\N
00040000-55ee-a439-7a90-c75bdfb1d0de	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-55ee-a439-d078-0b3a3e064a27	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-55ee-a439-c293-e6228461a02a	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-55ee-a439-4353-baf6359fe465	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-55ee-a439-b839-f2b43246b9da	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-55ee-a439-5b3e-bc42be534240	TH	THA	764	Thailand 	Tajska	\N
00040000-55ee-a439-f482-ef560e214d67	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-55ee-a439-4808-4b64a0ffe6d1	TG	TGO	768	Togo 	Togo	\N
00040000-55ee-a439-22d4-ed28f36661bb	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-55ee-a439-371a-afb448687389	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-55ee-a439-53ad-d5e49da55c43	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-55ee-a439-1740-00a693806af3	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-55ee-a439-3652-73d450221857	TR	TUR	792	Turkey 	Turčija	\N
00040000-55ee-a439-a000-ca68099898ae	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-55ee-a439-885f-e09450da3f25	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-55ee-a439-03e5-6bb72165e8b4	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-55ee-a439-88d1-797676b7d356	UG	UGA	800	Uganda 	Uganda	\N
00040000-55ee-a439-e49a-6b13210f2c74	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-55ee-a439-9ac2-f505bc6e8d2d	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-55ee-a439-e6a6-c3b862ca9542	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-55ee-a439-5beb-333b7b1d00e7	US	USA	840	United States 	Združene države Amerike	\N
00040000-55ee-a439-8866-7e8ad10e8851	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-55ee-a439-a3b7-3c3216b12287	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-55ee-a439-0131-d0fc9e65075a	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-55ee-a439-27d1-84049506d3f3	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-55ee-a439-ce7f-58776db5ea3d	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-55ee-a439-67c6-8d8a46a203d9	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-55ee-a439-bc56-057a5894873c	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-55ee-a439-6e5f-9002a35af0b3	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-55ee-a439-fd99-ea176400497e	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-55ee-a439-3784-7605d8049ab3	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-55ee-a439-36d3-042d7c4f9ed8	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-55ee-a439-9ac3-ab06c8cc86b1	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-55ee-a439-aa69-f41ca7f1213b	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 2955 (class 0 OID 17928315)
-- Dependencies: 226
-- Data for Name: enotaprograma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY enotaprograma (id, uprizoritev_id, program_dela_id, gostitelj_id, celotnavrednost, nasdelez, celotnavrednostmat, celotnavrednostgostovsz, zaproseno, lastnasredstva, avtorskihonorarji, avtorskihonorarjisamoz, tantieme, avtorskepravice, materialni, imakoprodukcije, vlozekgostitelja, drugijavni, stzaposlenih, stzaposumet, stzaposdrug, sthonorarnih, sthonorarnihigr, sthonorarnihigrtujjz, sthonorarnihigrsamoz, obiskdoma, obiskkopr, obiskgost, obiskzamejo, obiskint, obiskkoprint, ponovidoma, ponovikopr, ponovizamejo, ponovigost, ponovikoprint, ponoviint, naziv, kpe, sort, tipprogramskeenote_id, tip, strosekodkpred, stroskiostali, krajgostovanja, ustanova, datumgostovanja, transportnistroski, dnevprvzad, drzavagostovanja_id, stpe, zvrst, stpredstav, stokroglihmiz, stpredstavitev, stdelavnic, stdrugidogodki, stprodukcij, caspriprave, casizvedbe, prizorisca, umetvodja, programskotelo, sttujihselektorjev) FROM stdin;
002f0000-55ee-a43b-030f-68585b7454c0	000e0000-55ee-a43b-ea86-9b0b966d5094	\N	\N	9000.30	9000.30	9000.30	0.00	3600.12	5299.98	4000.40	1000.40	200.20	200.30	4599.40	\N	0.00	100.20	0	2	2	2	2	2	\N	40	0	0	0	0	0	1	0	0	0	0	0		0.00	\N	002b0000-55ee-a439-c823-da38ec0d9496	premiera	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-55ee-a43b-b4ca-57203fcf47bb	000e0000-55ee-a43b-ccb1-a61ecc05364f	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	\N	60	0	0	0	0	0	1	0	0	0	0	0		0.00	\N	002b0000-55ee-a439-38a2-60ad6946972a	premiera	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-55ee-a43b-1432-5e1c2e3f5a72	000e0000-55ee-a43b-640c-c3697800f0f3	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	\N	60	0	0	0	0	0	1	0	0	0	0	0		0.00	\N	002b0000-55ee-a439-c823-da38ec0d9496	premiera	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-55ee-a43b-6b9d-6149604a71d9	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-54.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	54.20	5	0	0	3	0	0	\N	22	0	0	0	0	0	0	0	0	0	0	0	Urejanje portala	0.00	10	\N	razno	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-55ee-a43b-86db-5d74554b2689	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-31.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	31.20	5	0	0	3	0	0	\N	202	0	0	0	0	0	0	0	0	0	0	0	Delavnice otroci	0.00	8	\N	razno	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 2941 (class 0 OID 17928126)
-- Dependencies: 212
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, podrocje, vodjaekipe, naziv, komentar, velikost, pomembna, sort, seplanira, dovoliprekrivanje, maxprekrivanj, tipfunkcije_id) FROM stdin;
000d0000-55ee-a43b-a08e-5e8574c1e259	000e0000-55ee-a43b-ccb1-a61ecc05364f	000c0000-55ee-a43b-ed80-ca2692f5d40b	igralec	\N	Tezej	glavna vloga	velika	t	5	t	t	\N	000f0000-55ee-a439-f1d3-97d58cfac155
000d0000-55ee-a43b-4e85-86c547800747	000e0000-55ee-a43b-ccb1-a61ecc05364f	000c0000-55ee-a43b-7a8f-c45d5bb54843	umetnik	\N	Režija		velika	t	8	t	t	\N	000f0000-55ee-a439-652e-72960b74fa16
000d0000-55ee-a43b-968a-4ae2a5acf7ce	000e0000-55ee-a43b-ccb1-a61ecc05364f	000c0000-55ee-a43b-8f9d-ac1d5b981bb1	inspicient	t	Inšpicient			t	8	t	t	\N	000f0000-55ee-a439-561b-5af597356f86
000d0000-55ee-a43b-b7e4-b6a761cb2068	000e0000-55ee-a43b-ccb1-a61ecc05364f	000c0000-55ee-a43b-c3b0-c98459643cda	tehnik	t	Tehnični vodja			t	8	t	t	\N	000f0000-55ee-a439-c4f8-dc65cf80cafb
000d0000-55ee-a43b-9ca3-6e69e21c8987	000e0000-55ee-a43b-ccb1-a61ecc05364f	000c0000-55ee-a43b-cdba-fab6868a7881	tehnik	\N	Razsvetljava			t	3	t	t	\N	000f0000-55ee-a439-c4f8-dc65cf80cafb
000d0000-55ee-a43b-e589-3a074acb0d46	000e0000-55ee-a43b-ccb1-a61ecc05364f	000c0000-55ee-a43b-3d57-b2f341b40f1f	igralec	\N	Helena	glavna vloga	velika	t	5	t	t	\N	000f0000-55ee-a439-f1d3-97d58cfac155
000d0000-55ee-a43b-9e41-df2e7388bd7c	000e0000-55ee-a43b-ccb1-a61ecc05364f	000c0000-55ee-a43b-40ea-e864eafae8c3	igralec	\N	Hipolita	glavna vloga	velika	t	6	t	t	\N	000f0000-55ee-a439-f1d3-97d58cfac155
000d0000-55ee-a43b-16f1-5ee4dd49d00c	000e0000-55ee-a43b-ccb1-a61ecc05364f	000c0000-55ee-a43b-0ac6-a6324544c15c	umetnik	\N	Lektoriranje			t	22	t	t	\N	000f0000-55ee-a439-c038-ae03a806f9bc
\.


--
-- TOC entry 2921 (class 0 OID 17927941)
-- Dependencies: 192
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta, zamejstvo, kraj) FROM stdin;
\.


--
-- TOC entry 2919 (class 0 OID 17927922)
-- Dependencies: 190
-- Data for Name: kontaktnaoseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kontaktnaoseba (id, popa_id, oseba_id, status, funkcija, opis) FROM stdin;
00260000-55ee-a43b-6d34-e8b295d269cf	00080000-55ee-a43a-b4f9-125c8fd41166	00090000-55ee-a43b-86ed-d0302ce82988	AK		igralka
\.


--
-- TOC entry 2930 (class 0 OID 17928040)
-- Dependencies: 201
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 2965 (class 0 OID 17928507)
-- Dependencies: 236
-- Data for Name: mapa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa (id, lastnik_id, parent_id, ime, komentar, caskreiranja, casspremembe, javnidostop, upor, datknj) FROM stdin;
\.


--
-- TOC entry 2966 (class 0 OID 17928519)
-- Dependencies: 237
-- Data for Name: mapa_zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa_zapis (mapa_id, zapis_id) FROM stdin;
\.


--
-- TOC entry 2968 (class 0 OID 17928541)
-- Dependencies: 239
-- Data for Name: mapaacl; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapaacl (id, mapa_id, perm_id, dostop, upor, datknj) FROM stdin;
\.


--
-- TOC entry 2934 (class 0 OID 17928065)
-- Dependencies: 205
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 2916 (class 0 OID 17927879)
-- Dependencies: 187
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-55ee-a43a-ec79-0e3f62445ecb	popa.stakli	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-55ee-a43a-48f9-487fedacfa2c	oseba.spol	array	a:2:{s:1:"M";a:1:{s:5:"label";s:6:"Moški";}s:1:"Z";a:1:{s:5:"label";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-55ee-a43a-3403-ff406af4dc11	telefonska.vrsta	array	a:3:{s:7:"mobilna";a:1:{s:5:"label";s:7:"Mobilni";}s:6:"domaca";a:1:{s:5:"label";s:6:"Domač";}s:6:"fiksna";a:1:{s:5:"label";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-55ee-a43a-be2e-81b860897b9e	kontaktnaoseba.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status kontaktne osebe
00000000-55ee-a43a-3ecd-97f65f782e7e	dogodek.status	array	a:7:{i:100;a:1:{s:5:"label";s:11:"Dolgoročno";}i:200;a:1:{s:5:"label";s:9:"Planirano";}i:300;a:1:{s:5:"label";s:8:"Fiksiran";}i:400;a:1:{s:5:"label";s:17:"Potrjen - interno";}i:500;a:1:{s:5:"label";s:15:"Potrjen - javno";}i:600;a:1:{s:5:"label";s:10:"Zaključen";}i:700;a:1:{s:5:"label";s:7:"Obdelan";}}	f	t	t	\N	Tabela statusa dogodkov
00000000-55ee-a43a-f697-0d7db939590c	dogodek.razred	array	a:5:{i:100;a:2:{s:5:"label";s:9:"Predstava";s:4:"type";s:9:"predstava";}i:200;a:2:{s:5:"label";s:4:"Vaja";s:4:"type";s:4:"vaja";}i:300;a:2:{s:5:"label";s:10:"Gostovanje";s:4:"type";s:10:"gostovanje";}i:400;a:2:{s:5:"label";s:10:"Zasedenost";s:4:"type";s:10:"zasedenost";}i:500;a:2:{s:5:"label";s:16:"Splošni dogodek";s:4:"type";s:8:"splošni";}}	f	t	t	\N	Tabela razredov dogodkov, ki jih aplikacija podpira
00000000-55ee-a43a-2c8c-887d3ec7234e	uprizoritev.faza	array	a:6:{s:20:"predprodukcija-ideja";a:1:{s:5:"label";s:16:"Dolgoročni plan";}s:20:"predprodukcija-poziv";a:1:{s:5:"label";s:29:"Predprodukcija, v fazi poziva";}s:30:"predprodukcija-potrjen_program";a:1:{s:5:"label";s:34:"Predprodukcija, program je potrjen";}s:10:"produkcija";a:1:{s:5:"label";s:10:"Produkcija";}s:14:"postprodukcija";a:1:{s:5:"label";s:14:"Postprodukcija";}s:5:"arhiv";a:1:{s:5:"label";s:10:"Arhivirana";}}	f	t	f	\N	Faza uprizoritve
00000000-55ee-a43a-bdf1-e799835ab8e2	funkcija.podrocje	array	a:4:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}}	f	t	f	\N	Področje funkcije
00000000-55ee-a43a-92bd-b01cccb0e6a0	tipfunkcije.podrocje	array	a:4:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}}	f	t	f	\N	Področje funkcije
00000000-55ee-a43a-caab-283be375b441	funkcija.velikost	array	a:4:{s:7:"stataza";a:1:{s:5:"label";s:8:"Stataža";}s:4:"mala";a:1:{s:5:"label";s:21:"Mala vloga / funkcija";}s:7:"srednja";a:1:{s:5:"label";s:24:"Srednja vloga / funkcija";}s:6:"velika";a:1:{s:5:"label";s:23:"Velika vloga / funkcija";}}	f	t	f	\N	Velikost funkcije
00000000-55ee-a43a-3900-290ac0bbf8fe	zaposlitev.status	array	a:2:{s:1:"A";a:1:{s:5:"label";s:7:"Aktivna";}s:1:"N";a:1:{s:5:"label";s:9:"Neaktivna";}}	f	t	f	\N	Status zaposlitve
00000000-55ee-a43a-33b2-f5a61f904513	produkcijskahisa.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktivna";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktivna";}}	f	t	f	\N	Status produkcijske hiše
00000000-55ee-a43a-1312-d6043825ee2b	strosekuprizoritve.tipstroska	array	a:2:{s:10:"materialni";a:1:{s:5:"label";s:19:"Materialni strošek";}s:9:"avtorprav";a:1:{s:5:"label";s:32:"Strošek odkupa avtorskih pravic";}}	f	t	f	\N	Tip stroška
00000000-55ee-a43a-f089-48fe95d13518	fsacl.dostop	array	a:4:{s:1:"X";a:1:{s:5:"label";s:12:"Brez dostopa";}s:1:"R";a:1:{s:5:"label";s:11:"Samo branje";}s:2:"RW";a:1:{s:5:"label";s:17:"Branje in pisanje";}s:3:"RWD";a:1:{s:5:"label";s:26:"Branje pisanje in brisanje";}}	f	t	f	\N	ACL Javni dostop
00000000-55ee-a43b-d3ff-ca409a1c1074	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-55ee-a43b-03dd-a7a5fb17622f	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-55ee-a43b-29e1-d0c1ee8f0683	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-55ee-a43b-b1fc-26a4bce35c03	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-55ee-a43b-b0e3-9e3b0d257b3f	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
00000000-55ee-a43c-a92b-e83f719ccf42	application.tenant.maticnopodjetje	string	s:4:"1001";	f	t	f		Šifra matičnega podjetja v Popa in ProdukcijskaHisa
\.


--
-- TOC entry 2910 (class 0 OID 17927793)
-- Dependencies: 181
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-55ee-a43b-4ae1-0874b14f7325	00000000-55ee-a43b-d3ff-ca409a1c1074	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-55ee-a43b-fca7-38895832e0fd	00000000-55ee-a43b-d3ff-ca409a1c1074	00010000-55ee-a43a-f8cf-a1f7e107ae21	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-55ee-a43b-cad9-49cdee6d6282	00000000-55ee-a43b-03dd-a7a5fb17622f	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 2911 (class 0 OID 17927804)
-- Dependencies: 182
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naslov_id, sifra, naziv, ime, priimek, funkcija, srednjeime, polnoime, psevdonim, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
00090000-55ee-a43b-d2d9-4d295cbdf1fe	\N	\N	0001	g.	Janez	Novak	a	Peter	Janez Peter Novak	Jani	jani.novak@xxx.xx	1958-01-06	0601958000000	123456789	M	Jani Janez	Slovenija	Slovenija	Ljubljana
00090000-55ee-a43b-08e0-440e59938e20	00010000-55ee-a43b-0520-afd53e6b2bc8	\N	0002	dr.	Anton	Horvat	b		Anton  Horvat	Tona	anton.horvat@xxx.xx	1968-02-12	1202968111111	234567890	M		Slovenija	Slovenija	Maribor
00090000-55ee-a43b-ce08-2160cddd55c7	00010000-55ee-a43b-e363-61f9ac3ac979	\N	0003		Ivan	Kovačič	c		Ivan  Kovačič	Ivo	ivan.kovacic@xxx.xx	1975-03-26	2603976222222	345678901	M		Slovenija	Slovenija	Celje
00090000-55ee-a43b-f03c-d6e235c7ca03	00010000-55ee-a43b-418d-c22e5ec42ec7	\N	0004	prof.	Jožef	Krajnc	d		Jožef  Krajnc	Joža	jozef.krajnc@xxx.xx	1971-04-30	3004971333333	456789012	M		Slovenija	Slovenija	Kranj
00090000-55ee-a43b-f5a1-9858c4d01716	\N	\N	0005		Marko	Zupančič	e		Marko  Zupančič		marko.zupancic@xxx.xx	1984-05-07	0705984444444	567890123	M		Slovenija	Slovenija	Koper
00090000-55ee-a43b-a390-7a0d3f2f532c	\N	\N	0006	ga.	Marija	Kovač	f		Marija  Kovač		marija.kovac@xxx.xx	1962-06-19	1906962444444	678901234	Z		Slovenija	Slovenija	Murska Sobota
00090000-55ee-a43b-3203-350582406328	\N	\N	0007	ga.	Ana	Potočnik	g		Ana  Potočnik		ana.potocnik@xxx.xx	1975-07-24	2407975555555	789012345	Z		Slovenija	Slovenija	Novo Mesto
00090000-55ee-a43b-2883-1efa6ae779dd	\N	\N	0008	ga.	Maja	Mlakar	h		Maja  Mlakar		maja.mlakar@xxx.xx	1986-08-02	0208986666666	890123456	Z		Slovenija	Slovenija	Nova Gorica
00090000-55ee-a43b-86ed-d0302ce82988	00010000-55ee-a43b-475e-e8e374398a5a	\N	0009		Irena	Kos	i		Irena  Kos		irena.kos@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Ptuj
00090000-55ee-a43b-1df2-5541dae698f5	\N	\N	0010		Mojca	Vidmar	J		Mojca  Vidmar		mojca.vidmar@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Idrija
00090000-55ee-a43b-0ff9-469ec94877d1	\N	\N	0011		xx	write protected12345	a		xx  write protected12345		xx@xxx.xx	\N	\N	\N	Z		\N	\N	\N
00090000-55ee-a43b-ecc4-560aaaacb293	\N	\N	0012		Luka	Golob	luč	a	Luka a Golob		luka.golob@xxx.xx	\N	\N	\N	M		\N	\N	\N
00090000-55ee-a43b-b46f-07925b54ff0c	00010000-55ee-a43b-30ca-33fa5b526e4b	\N	0013		Tatjana	Božič	tajnica	a	Tatjana a Božič		tatjana.bozic@xxx.xx	\N	\N	\N	Z		\N	\N	\N
\.


--
-- TOC entry 2906 (class 0 OID 17927758)
-- Dependencies: 177
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-55ee-a439-763e-d490860c2aaf	Aaa-read	Aaa (User,Role,Permission) - branje	f
00030000-55ee-a439-407f-2e569d944c47	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	f
00030000-55ee-a439-1444-1cc081ba581a	TerminStoritve-vse	TerminStoritve - spreminjanje vseh zapisov	f
00030000-55ee-a439-040d-2594a6c23fc1	Dogodek-readVse	Dogodek - branje vseh, ne glede na status dogodka	f
00030000-55ee-a439-6407-e5bd379f6302	Oseba-vse	Oseba - vse - za testiranje assert	f
00030000-55ee-a439-c458-0e49a04d4855	ProgramDela-lock	ProgramDela - zaklepanje	f
00030000-55ee-a439-40d2-fcc980e168a2	ProgramDela-unlock	ProgramDela - odklepanje	f
00030000-55ee-a439-7d31-f4e214e9c371	Abonma-read	Abonma - branje	f
00030000-55ee-a439-272e-060a8f1b1f95	Abonma-write	Abonma - spreminjanje	f
00030000-55ee-a439-bc94-2315d59c6735	Alternacija-read	Alternacija - branje	f
00030000-55ee-a439-4311-bed99954ae09	Alternacija-write	Alternacija - spreminjanje	f
00030000-55ee-a439-e394-985ef6c22559	Arhivalija-read	Arhivalija - branje	f
00030000-55ee-a439-76a1-e204f7b34fe6	Arhivalija-write	Arhivalija - spreminjanje	f
00030000-55ee-a439-ea03-ea8ecdb4b092	Besedilo-read	Besedilo - branje	f
00030000-55ee-a439-d705-adef16ba71fb	Besedilo-write	Besedilo - spreminjanje	f
00030000-55ee-a439-b5bd-f176b6530e16	DogodekIzven-read	DogodekIzven - branje	f
00030000-55ee-a439-d451-1f2ca8061a4f	DogodekIzven-write	DogodekIzven - spreminjanje	f
00030000-55ee-a439-512f-6bfd1f3ba316	Dogodek-read	Dogodek - branje	f
00030000-55ee-a439-48c3-814b91d77a7b	Dogodek-write	Dogodek - spreminjanje	f
00030000-55ee-a439-2bbf-3f626075301e	DrugiVir-read	DrugiVir - branje	f
00030000-55ee-a439-4f7e-5bcdbd245d2c	DrugiVir-write	DrugiVir - spreminjanje	f
00030000-55ee-a439-a33c-22bc89eaef3c	Drzava-read	Drzava - branje	f
00030000-55ee-a439-bbbc-87f432f08f8c	Drzava-write	Drzava - spreminjanje	f
00030000-55ee-a439-0098-2a168b4995ad	EnotaPrograma-read	EnotaPrograma - branje	f
00030000-55ee-a439-3e70-87f400ed0488	EnotaPrograma-write	EnotaPrograma - spreminjanje	f
00030000-55ee-a439-bf7f-8e07d6acecac	Funkcija-read	Funkcija - branje	f
00030000-55ee-a439-01cb-58fbf3f080a4	Funkcija-write	Funkcija - spreminjanje	f
00030000-55ee-a439-1ca7-bbd188c5388d	Gostovanje-read	Gostovanje - branje	f
00030000-55ee-a439-277c-6dac2df52f46	Gostovanje-write	Gostovanje - spreminjanje	f
00030000-55ee-a439-f714-110045a9a3ee	Gostujoca-read	Gostujoca - branje	f
00030000-55ee-a439-8352-d8884c86b4a7	Gostujoca-write	Gostujoca - spreminjanje	f
00030000-55ee-a439-9fc4-17cde2d44b40	KontaktnaOseba-read	KontaktnaOseba - branje	f
00030000-55ee-a439-c764-b3b20747489d	KontaktnaOseba-write	KontaktnaOseba - spreminjanje	f
00030000-55ee-a439-bbe8-d257525afec7	Kupec-read	Kupec - branje	f
00030000-55ee-a439-883a-5518a9539f92	Kupec-write	Kupec - spreminjanje	f
00030000-55ee-a439-9d9a-d08f1d5e91d0	NacinPlacina-read	NacinPlacina - branje	f
00030000-55ee-a439-7af4-5e56ed897b30	NacinPlacina-write	NacinPlacina - spreminjanje	f
00030000-55ee-a439-ff1d-ed1fee21c145	Option-read	Option - branje	f
00030000-55ee-a439-8c39-82849d5ba615	Option-write	Option - spreminjanje	f
00030000-55ee-a439-5521-2b5d45619ce9	OptionValue-read	OptionValue - branje	f
00030000-55ee-a439-641d-7df1881ca55c	OptionValue-write	OptionValue - spreminjanje	f
00030000-55ee-a439-f524-68ebc17d0feb	Oseba-read	Oseba - branje	f
00030000-55ee-a439-b771-67210702f05a	Oseba-write	Oseba - spreminjanje	f
00030000-55ee-a439-6208-c0b60053da6a	PlacilniInstrument-read	PlacilniInstrument - branje	f
00030000-55ee-a439-c2f6-330b1a049b6b	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	f
00030000-55ee-a439-0b78-beda95663bf9	PodrocjeSedenja-read	PodrocjeSedenja - branje	f
00030000-55ee-a439-3092-a7be02a24154	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	f
00030000-55ee-a439-1034-412360288732	Pogodba-read	Pogodba - branje	f
00030000-55ee-a439-1eab-d9de00897c1e	Pogodba-write	Pogodba - spreminjanje	f
00030000-55ee-a439-424c-22024d1f046f	Popa-read	Popa - branje	f
00030000-55ee-a439-8210-aa727bb3b4cf	Popa-write	Popa - spreminjanje	f
00030000-55ee-a439-500b-5846d390203d	Posta-read	Posta - branje	f
00030000-55ee-a439-cd28-496cc560239a	Posta-write	Posta - spreminjanje	f
00030000-55ee-a439-9b11-9a11b0d799d3	PostavkaRacuna-read	PostavkaRacuna - branje	f
00030000-55ee-a439-2ce6-532cc99c1bf6	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	f
00030000-55ee-a439-5ea7-eb5fd2a3dab5	PostniNaslov-read	PostniNaslov - branje	f
00030000-55ee-a439-131c-8a0b83bf66e8	PostniNaslov-write	PostniNaslov - spreminjanje	f
00030000-55ee-a439-3178-4f2c178b4d74	Predstava-read	Predstava - branje	f
00030000-55ee-a439-b5d6-db1a333b7c4f	Predstava-write	Predstava - spreminjanje	f
00030000-55ee-a439-1a2c-ffeb06593995	ProdajaPredstave-read	ProdajaPredstave - branje	f
00030000-55ee-a439-01c8-46f20871e831	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	f
00030000-55ee-a439-4475-f2e90eea36ac	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	f
00030000-55ee-a439-c6e9-59743056e555	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	f
00030000-55ee-a439-3570-d49dd01a6de1	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	f
00030000-55ee-a439-8289-ab902b0662a8	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	f
00030000-55ee-a439-d3b9-6bc707184aa0	ProgramDela-read	ProgramDela - branje	f
00030000-55ee-a439-4621-965d42448ab3	ProgramDela-write	ProgramDela - spreminjanje	f
00030000-55ee-a439-81e6-5f902212e7d7	ProgramFestival-read	ProgramFestival - branje	f
00030000-55ee-a439-bfd7-53a5c5e7106e	ProgramFestival-write	ProgramFestival - spreminjanje	f
00030000-55ee-a439-01e6-c51071efd2b7	ProgramGostovanje-read	ProgramGostovanje - branje	f
00030000-55ee-a439-c42f-7e6ee169e59e	ProgramGostovanje-write	ProgramGostovanje - spreminjanje	f
00030000-55ee-a439-fc0e-cedd22621403	ProgramGostujoca-read	ProgramGostujoca - branje	f
00030000-55ee-a439-a603-861fca7d895f	ProgramGostujoca-write	ProgramGostujoca - spreminjanje	f
00030000-55ee-a439-1cdc-d6e0eb7170a0	ProgramIzjemni-read	ProgramIzjemni - branje	f
00030000-55ee-a439-26cc-ab7dd4f6c74c	ProgramIzjemni-write	ProgramIzjemni - spreminjanje	f
00030000-55ee-a439-1269-2a33a821243a	ProgramPonovitevPrejsnjih-read	ProgramPonovitevPrejsnjih - branje	f
00030000-55ee-a439-fab2-60a2aa85d5fb	ProgramPonovitevPrejsnjih-write	ProgramPonovitevPrejsnjih - spreminjanje	f
00030000-55ee-a439-5157-5353f5762c4b	ProgramPonovitevPremiere-read	ProgramPonovitevPremiere - branje	f
00030000-55ee-a439-b62e-e1f22df09723	ProgramPonovitevPremiere-write	ProgramPonovitevPremiere - spreminjanje	f
00030000-55ee-a439-d7de-e78f9518493a	ProgramPremiera-read	ProgramPremiera - branje	f
00030000-55ee-a439-9e0c-7005f45c8f74	ProgramPremiera-write	ProgramPremiera - spreminjanje	f
00030000-55ee-a439-73a3-3f619063f800	ProgramRazno-read	ProgramRazno - branje	f
00030000-55ee-a439-0a57-898623d6854c	ProgramRazno-write	ProgramRazno - spreminjanje	f
00030000-55ee-a439-80ff-d1709891f0b4	ProgramskaEnotaSklopa-read	ProgramskaEnotaSklopa - branje	f
00030000-55ee-a439-67a9-2f48b2616532	ProgramskaEnotaSklopa-write	ProgramskaEnotaSklopa - spreminjanje	f
00030000-55ee-a439-aba4-f8ddde098651	Prostor-read	Prostor - branje	f
00030000-55ee-a439-9c75-bb5ba9a43d19	Prostor-write	Prostor - spreminjanje	f
00030000-55ee-a439-cfca-4f71ec400d94	Racun-read	Racun - branje	f
00030000-55ee-a439-e272-07b2c19bfb66	Racun-write	Racun - spreminjanje	f
00030000-55ee-a439-2345-631881fc231b	RazpisanSedez-read	RazpisanSedez - branje	f
00030000-55ee-a439-7e6e-67fc393f6de1	RazpisanSedez-write	RazpisanSedez - spreminjanje	f
00030000-55ee-a439-4c31-5d4a2f86fddf	Rekviziterstvo-read	Rekviziterstvo - branje	f
00030000-55ee-a439-5f48-dc81386a67ca	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	f
00030000-55ee-a439-e4c5-9ed00c79d2c5	Rekvizit-read	Rekvizit - branje	f
00030000-55ee-a439-235a-14002f62231a	Rekvizit-write	Rekvizit - spreminjanje	f
00030000-55ee-a439-f8a5-dba37d7cdceb	Revizija-read	Revizija - branje	f
00030000-55ee-a439-12c2-9cf7ef30e1b9	Revizija-write	Revizija - spreminjanje	f
00030000-55ee-a439-b574-55bd764296d6	Rezervacija-read	Rezervacija - branje	f
00030000-55ee-a439-6e69-1e29ff6f189c	Rezervacija-write	Rezervacija - spreminjanje	f
00030000-55ee-a439-4df7-3fa2c9a2dba4	SedezniRed-read	SedezniRed - branje	f
00030000-55ee-a439-f0d9-5e33481406d7	SedezniRed-write	SedezniRed - spreminjanje	f
00030000-55ee-a439-98e4-21d84705f31b	Sedez-read	Sedez - branje	f
00030000-55ee-a439-e13b-3c53d1da4d9d	Sedez-write	Sedez - spreminjanje	f
00030000-55ee-a439-542f-2cde6bc8e630	Sezona-read	Sezona - branje	f
00030000-55ee-a439-a236-d69358beaf36	Sezona-write	Sezona - spreminjanje	f
00030000-55ee-a439-c36c-3be2d481bf42	StevilcenjeKonfig-read	StevilcenjeKonfig - branje	f
00030000-55ee-a439-2519-f6e0044f0afa	StevilcenjeKonfig-write	StevilcenjeKonfig - spreminjanje	f
00030000-55ee-a439-ff45-a8bfce0e22ab	Stevilcenje-read	Stevilcenje - branje	f
00030000-55ee-a439-5566-95500d533b97	Stevilcenje-write	Stevilcenje - spreminjanje	f
00030000-55ee-a439-d0f8-c93198715c65	StevilcenjeStanje-read	StevilcenjeStanje - branje	f
00030000-55ee-a439-080b-2c9db7dca1c7	StevilcenjeStanje-write	StevilcenjeStanje - spreminjanje	f
00030000-55ee-a439-7838-b7a09d83091d	StrosekUprizoritve-read	StrosekUprizoritve - branje	f
00030000-55ee-a439-5568-eb47555cf090	StrosekUprizoritve-write	StrosekUprizoritve - spreminjanje	f
00030000-55ee-a439-829b-9cbc4e067fa0	Telefonska-read	Telefonska - branje	f
00030000-55ee-a439-1db4-fb0bf15f6084	Telefonska-write	Telefonska - spreminjanje	f
00030000-55ee-a439-d65a-81e542520886	TerminStoritve-read	TerminStoritve - branje	f
00030000-55ee-a439-553a-70af4de898a0	TerminStoritve-write	TerminStoritve - spreminjanje	f
00030000-55ee-a439-a2bc-b21de5e268d0	TipFunkcije-read	TipFunkcije - branje	f
00030000-55ee-a439-1dae-d7bd362d078b	TipFunkcije-write	TipFunkcije - spreminjanje	f
00030000-55ee-a439-6bad-af8cfa985573	TipProgramskeEnote-read	TipProgramskeEnote - branje	f
00030000-55ee-a439-057b-dc495e64ed72	TipProgramskeEnote-write	TipProgramskeEnote - spreminjanje	f
00030000-55ee-a439-c831-3b4529884517	Trr-read	Trr - branje	f
00030000-55ee-a439-335a-5b3f0e78735c	Trr-write	Trr - spreminjanje	f
00030000-55ee-a439-1cd2-15a91987d6f5	Uprizoritev-read	Uprizoritev - branje	f
00030000-55ee-a439-e71f-7d73662ce10a	Uprizoritev-write	Uprizoritev - spreminjanje	f
00030000-55ee-a439-4630-d096b21b38fd	Vaja-read	Vaja - branje	f
00030000-55ee-a439-9f01-9a93764242cf	Vaja-write	Vaja - spreminjanje	f
00030000-55ee-a439-54c4-c76c3797a463	VrstaSedezev-read	VrstaSedezev - branje	f
00030000-55ee-a439-7b1c-ea5f86a30a62	VrstaSedezev-write	VrstaSedezev - spreminjanje	f
00030000-55ee-a439-bbf0-943705d0bfe1	VrstaStroska-read	VrstaStroska - branje	f
00030000-55ee-a439-4ede-a13c60d37aa0	VrstaStroska-write	VrstaStroska - spreminjanje	f
00030000-55ee-a439-505c-6ba944b1824d	Zaposlitev-read	Zaposlitev - branje	f
00030000-55ee-a439-a15c-3c83878d4020	Zaposlitev-write	Zaposlitev - spreminjanje	f
00030000-55ee-a439-5313-4d6d70a83a99	Zasedenost-read	Zasedenost - branje	f
00030000-55ee-a439-19af-0c27a8a3cc2a	Zasedenost-write	Zasedenost - spreminjanje	f
00030000-55ee-a439-d92c-c333847801bc	ZvrstSurs-read	ZvrstSurs - branje	f
00030000-55ee-a439-2c8c-4b57ef84ae78	ZvrstSurs-write	ZvrstSurs - spreminjanje	f
00030000-55ee-a439-dbd6-e3b26ab8aaf8	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	f
00030000-55ee-a439-aec8-f322d44ec7ca	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	f
00030000-55ee-a439-39b0-045d799ce476	Mapa-write	Mapa - osnovno dovoljenje za pisanje	f
00030000-55ee-a439-4ed2-3b8b3188cd6c	Mapa-read	Mapa - osnovno dovoljenje za branje	f
00030000-55ee-a439-dd22-21d489a40973	MapaAcl-write	MapaAcl - dovoljenje za dostop pisanje ACL-jev mape	f
00030000-55ee-a439-8b58-ccc5c9a8a995	MapaAcl-read	MapaAcl - dovoljenje za dostop branje ACL-jev mape	f
00030000-55ee-a439-54f5-1fabe6924f55	Zapis-write	Zapis - dovoljenje za pisanje zapisov	f
00030000-55ee-a439-20c8-9db302694622	Zapis-read	Zapis - dovoljenje za pisanje zapisov	f
00030000-55ee-a439-503c-3e0ac6721261	ZapisLastnik-write	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	f
00030000-55ee-a439-982f-b0ea87db6819	ZapisLastnik-read	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	f
00030000-55ee-a439-ef4e-701730a6b207	VrstaZapisa-write	Šifrant vrst zapisa - spreminjanje	f
00030000-55ee-a439-3de1-f7b60ec06dcc	VrstaZapisa-read	Šifrant vrst zapisa - branje	f
00030000-55ee-a439-f448-ec03b63b7801	Datoteka-write	Datoteka - spreminjanje	f
00030000-55ee-a439-0bff-5560621c7592	Datoteka-read	Datoteke - branje	f
\.


--
-- TOC entry 2908 (class 0 OID 17927777)
-- Dependencies: 179
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-55ee-a439-22ab-69f3bde7b9bd	00030000-55ee-a439-407f-2e569d944c47
00020000-55ee-a439-413b-ba52fcc21032	00030000-55ee-a439-a33c-22bc89eaef3c
00020000-55ee-a43a-e873-c2fad0710403	00030000-55ee-a439-7d31-f4e214e9c371
00020000-55ee-a43a-e873-c2fad0710403	00030000-55ee-a439-272e-060a8f1b1f95
00020000-55ee-a43a-e873-c2fad0710403	00030000-55ee-a439-bc94-2315d59c6735
00020000-55ee-a43a-e873-c2fad0710403	00030000-55ee-a439-4311-bed99954ae09
00020000-55ee-a43a-e873-c2fad0710403	00030000-55ee-a439-e394-985ef6c22559
00020000-55ee-a43a-e873-c2fad0710403	00030000-55ee-a439-512f-6bfd1f3ba316
00020000-55ee-a43a-e873-c2fad0710403	00030000-55ee-a439-040d-2594a6c23fc1
00020000-55ee-a43a-e873-c2fad0710403	00030000-55ee-a439-48c3-814b91d77a7b
00020000-55ee-a43a-e873-c2fad0710403	00030000-55ee-a439-a33c-22bc89eaef3c
00020000-55ee-a43a-e873-c2fad0710403	00030000-55ee-a439-bbbc-87f432f08f8c
00020000-55ee-a43a-e873-c2fad0710403	00030000-55ee-a439-bf7f-8e07d6acecac
00020000-55ee-a43a-e873-c2fad0710403	00030000-55ee-a439-01cb-58fbf3f080a4
00020000-55ee-a43a-e873-c2fad0710403	00030000-55ee-a439-1ca7-bbd188c5388d
00020000-55ee-a43a-e873-c2fad0710403	00030000-55ee-a439-277c-6dac2df52f46
00020000-55ee-a43a-e873-c2fad0710403	00030000-55ee-a439-f714-110045a9a3ee
00020000-55ee-a43a-e873-c2fad0710403	00030000-55ee-a439-8352-d8884c86b4a7
00020000-55ee-a43a-e873-c2fad0710403	00030000-55ee-a439-9fc4-17cde2d44b40
00020000-55ee-a43a-e873-c2fad0710403	00030000-55ee-a439-c764-b3b20747489d
00020000-55ee-a43a-e873-c2fad0710403	00030000-55ee-a439-ff1d-ed1fee21c145
00020000-55ee-a43a-e873-c2fad0710403	00030000-55ee-a439-5521-2b5d45619ce9
00020000-55ee-a43a-e873-c2fad0710403	00030000-55ee-a439-f524-68ebc17d0feb
00020000-55ee-a43a-e873-c2fad0710403	00030000-55ee-a439-b771-67210702f05a
00020000-55ee-a43a-e873-c2fad0710403	00030000-55ee-a439-424c-22024d1f046f
00020000-55ee-a43a-e873-c2fad0710403	00030000-55ee-a439-8210-aa727bb3b4cf
00020000-55ee-a43a-e873-c2fad0710403	00030000-55ee-a439-500b-5846d390203d
00020000-55ee-a43a-e873-c2fad0710403	00030000-55ee-a439-cd28-496cc560239a
00020000-55ee-a43a-e873-c2fad0710403	00030000-55ee-a439-5ea7-eb5fd2a3dab5
00020000-55ee-a43a-e873-c2fad0710403	00030000-55ee-a439-131c-8a0b83bf66e8
00020000-55ee-a43a-e873-c2fad0710403	00030000-55ee-a439-3178-4f2c178b4d74
00020000-55ee-a43a-e873-c2fad0710403	00030000-55ee-a439-b5d6-db1a333b7c4f
00020000-55ee-a43a-e873-c2fad0710403	00030000-55ee-a439-3570-d49dd01a6de1
00020000-55ee-a43a-e873-c2fad0710403	00030000-55ee-a439-8289-ab902b0662a8
00020000-55ee-a43a-e873-c2fad0710403	00030000-55ee-a439-aba4-f8ddde098651
00020000-55ee-a43a-e873-c2fad0710403	00030000-55ee-a439-9c75-bb5ba9a43d19
00020000-55ee-a43a-e873-c2fad0710403	00030000-55ee-a439-4c31-5d4a2f86fddf
00020000-55ee-a43a-e873-c2fad0710403	00030000-55ee-a439-5f48-dc81386a67ca
00020000-55ee-a43a-e873-c2fad0710403	00030000-55ee-a439-e4c5-9ed00c79d2c5
00020000-55ee-a43a-e873-c2fad0710403	00030000-55ee-a439-235a-14002f62231a
00020000-55ee-a43a-e873-c2fad0710403	00030000-55ee-a439-542f-2cde6bc8e630
00020000-55ee-a43a-e873-c2fad0710403	00030000-55ee-a439-a236-d69358beaf36
00020000-55ee-a43a-e873-c2fad0710403	00030000-55ee-a439-a2bc-b21de5e268d0
00020000-55ee-a43a-e873-c2fad0710403	00030000-55ee-a439-1cd2-15a91987d6f5
00020000-55ee-a43a-e873-c2fad0710403	00030000-55ee-a439-e71f-7d73662ce10a
00020000-55ee-a43a-e873-c2fad0710403	00030000-55ee-a439-4630-d096b21b38fd
00020000-55ee-a43a-e873-c2fad0710403	00030000-55ee-a439-9f01-9a93764242cf
00020000-55ee-a43a-e873-c2fad0710403	00030000-55ee-a439-5313-4d6d70a83a99
00020000-55ee-a43a-e873-c2fad0710403	00030000-55ee-a439-19af-0c27a8a3cc2a
00020000-55ee-a43a-e873-c2fad0710403	00030000-55ee-a439-d92c-c333847801bc
00020000-55ee-a43a-e873-c2fad0710403	00030000-55ee-a439-dbd6-e3b26ab8aaf8
00020000-55ee-a43a-440d-2932ed109c06	00030000-55ee-a439-7d31-f4e214e9c371
00020000-55ee-a43a-440d-2932ed109c06	00030000-55ee-a439-e394-985ef6c22559
00020000-55ee-a43a-440d-2932ed109c06	00030000-55ee-a439-512f-6bfd1f3ba316
00020000-55ee-a43a-440d-2932ed109c06	00030000-55ee-a439-a33c-22bc89eaef3c
00020000-55ee-a43a-440d-2932ed109c06	00030000-55ee-a439-1ca7-bbd188c5388d
00020000-55ee-a43a-440d-2932ed109c06	00030000-55ee-a439-f714-110045a9a3ee
00020000-55ee-a43a-440d-2932ed109c06	00030000-55ee-a439-9fc4-17cde2d44b40
00020000-55ee-a43a-440d-2932ed109c06	00030000-55ee-a439-c764-b3b20747489d
00020000-55ee-a43a-440d-2932ed109c06	00030000-55ee-a439-ff1d-ed1fee21c145
00020000-55ee-a43a-440d-2932ed109c06	00030000-55ee-a439-5521-2b5d45619ce9
00020000-55ee-a43a-440d-2932ed109c06	00030000-55ee-a439-f524-68ebc17d0feb
00020000-55ee-a43a-440d-2932ed109c06	00030000-55ee-a439-b771-67210702f05a
00020000-55ee-a43a-440d-2932ed109c06	00030000-55ee-a439-424c-22024d1f046f
00020000-55ee-a43a-440d-2932ed109c06	00030000-55ee-a439-500b-5846d390203d
00020000-55ee-a43a-440d-2932ed109c06	00030000-55ee-a439-5ea7-eb5fd2a3dab5
00020000-55ee-a43a-440d-2932ed109c06	00030000-55ee-a439-131c-8a0b83bf66e8
00020000-55ee-a43a-440d-2932ed109c06	00030000-55ee-a439-3178-4f2c178b4d74
00020000-55ee-a43a-440d-2932ed109c06	00030000-55ee-a439-aba4-f8ddde098651
00020000-55ee-a43a-440d-2932ed109c06	00030000-55ee-a439-4c31-5d4a2f86fddf
00020000-55ee-a43a-440d-2932ed109c06	00030000-55ee-a439-e4c5-9ed00c79d2c5
00020000-55ee-a43a-440d-2932ed109c06	00030000-55ee-a439-542f-2cde6bc8e630
00020000-55ee-a43a-440d-2932ed109c06	00030000-55ee-a439-829b-9cbc4e067fa0
00020000-55ee-a43a-440d-2932ed109c06	00030000-55ee-a439-1db4-fb0bf15f6084
00020000-55ee-a43a-440d-2932ed109c06	00030000-55ee-a439-c831-3b4529884517
00020000-55ee-a43a-440d-2932ed109c06	00030000-55ee-a439-335a-5b3f0e78735c
00020000-55ee-a43a-440d-2932ed109c06	00030000-55ee-a439-505c-6ba944b1824d
00020000-55ee-a43a-440d-2932ed109c06	00030000-55ee-a439-a15c-3c83878d4020
00020000-55ee-a43a-440d-2932ed109c06	00030000-55ee-a439-d92c-c333847801bc
00020000-55ee-a43a-440d-2932ed109c06	00030000-55ee-a439-dbd6-e3b26ab8aaf8
00020000-55ee-a43a-4730-34d1aaac506f	00030000-55ee-a439-7d31-f4e214e9c371
00020000-55ee-a43a-4730-34d1aaac506f	00030000-55ee-a439-bc94-2315d59c6735
00020000-55ee-a43a-4730-34d1aaac506f	00030000-55ee-a439-e394-985ef6c22559
00020000-55ee-a43a-4730-34d1aaac506f	00030000-55ee-a439-76a1-e204f7b34fe6
00020000-55ee-a43a-4730-34d1aaac506f	00030000-55ee-a439-ea03-ea8ecdb4b092
00020000-55ee-a43a-4730-34d1aaac506f	00030000-55ee-a439-b5bd-f176b6530e16
00020000-55ee-a43a-4730-34d1aaac506f	00030000-55ee-a439-512f-6bfd1f3ba316
00020000-55ee-a43a-4730-34d1aaac506f	00030000-55ee-a439-a33c-22bc89eaef3c
00020000-55ee-a43a-4730-34d1aaac506f	00030000-55ee-a439-bf7f-8e07d6acecac
00020000-55ee-a43a-4730-34d1aaac506f	00030000-55ee-a439-1ca7-bbd188c5388d
00020000-55ee-a43a-4730-34d1aaac506f	00030000-55ee-a439-f714-110045a9a3ee
00020000-55ee-a43a-4730-34d1aaac506f	00030000-55ee-a439-9fc4-17cde2d44b40
00020000-55ee-a43a-4730-34d1aaac506f	00030000-55ee-a439-ff1d-ed1fee21c145
00020000-55ee-a43a-4730-34d1aaac506f	00030000-55ee-a439-5521-2b5d45619ce9
00020000-55ee-a43a-4730-34d1aaac506f	00030000-55ee-a439-f524-68ebc17d0feb
00020000-55ee-a43a-4730-34d1aaac506f	00030000-55ee-a439-424c-22024d1f046f
00020000-55ee-a43a-4730-34d1aaac506f	00030000-55ee-a439-500b-5846d390203d
00020000-55ee-a43a-4730-34d1aaac506f	00030000-55ee-a439-3178-4f2c178b4d74
00020000-55ee-a43a-4730-34d1aaac506f	00030000-55ee-a439-3570-d49dd01a6de1
00020000-55ee-a43a-4730-34d1aaac506f	00030000-55ee-a439-aba4-f8ddde098651
00020000-55ee-a43a-4730-34d1aaac506f	00030000-55ee-a439-4c31-5d4a2f86fddf
00020000-55ee-a43a-4730-34d1aaac506f	00030000-55ee-a439-e4c5-9ed00c79d2c5
00020000-55ee-a43a-4730-34d1aaac506f	00030000-55ee-a439-542f-2cde6bc8e630
00020000-55ee-a43a-4730-34d1aaac506f	00030000-55ee-a439-a2bc-b21de5e268d0
00020000-55ee-a43a-4730-34d1aaac506f	00030000-55ee-a439-4630-d096b21b38fd
00020000-55ee-a43a-4730-34d1aaac506f	00030000-55ee-a439-5313-4d6d70a83a99
00020000-55ee-a43a-4730-34d1aaac506f	00030000-55ee-a439-d92c-c333847801bc
00020000-55ee-a43a-4730-34d1aaac506f	00030000-55ee-a439-dbd6-e3b26ab8aaf8
00020000-55ee-a43a-e75b-bff7843dbbf7	00030000-55ee-a439-7d31-f4e214e9c371
00020000-55ee-a43a-e75b-bff7843dbbf7	00030000-55ee-a439-272e-060a8f1b1f95
00020000-55ee-a43a-e75b-bff7843dbbf7	00030000-55ee-a439-4311-bed99954ae09
00020000-55ee-a43a-e75b-bff7843dbbf7	00030000-55ee-a439-e394-985ef6c22559
00020000-55ee-a43a-e75b-bff7843dbbf7	00030000-55ee-a439-512f-6bfd1f3ba316
00020000-55ee-a43a-e75b-bff7843dbbf7	00030000-55ee-a439-a33c-22bc89eaef3c
00020000-55ee-a43a-e75b-bff7843dbbf7	00030000-55ee-a439-1ca7-bbd188c5388d
00020000-55ee-a43a-e75b-bff7843dbbf7	00030000-55ee-a439-f714-110045a9a3ee
00020000-55ee-a43a-e75b-bff7843dbbf7	00030000-55ee-a439-ff1d-ed1fee21c145
00020000-55ee-a43a-e75b-bff7843dbbf7	00030000-55ee-a439-5521-2b5d45619ce9
00020000-55ee-a43a-e75b-bff7843dbbf7	00030000-55ee-a439-424c-22024d1f046f
00020000-55ee-a43a-e75b-bff7843dbbf7	00030000-55ee-a439-500b-5846d390203d
00020000-55ee-a43a-e75b-bff7843dbbf7	00030000-55ee-a439-3178-4f2c178b4d74
00020000-55ee-a43a-e75b-bff7843dbbf7	00030000-55ee-a439-aba4-f8ddde098651
00020000-55ee-a43a-e75b-bff7843dbbf7	00030000-55ee-a439-4c31-5d4a2f86fddf
00020000-55ee-a43a-e75b-bff7843dbbf7	00030000-55ee-a439-e4c5-9ed00c79d2c5
00020000-55ee-a43a-e75b-bff7843dbbf7	00030000-55ee-a439-542f-2cde6bc8e630
00020000-55ee-a43a-e75b-bff7843dbbf7	00030000-55ee-a439-a2bc-b21de5e268d0
00020000-55ee-a43a-e75b-bff7843dbbf7	00030000-55ee-a439-d92c-c333847801bc
00020000-55ee-a43a-e75b-bff7843dbbf7	00030000-55ee-a439-dbd6-e3b26ab8aaf8
00020000-55ee-a43a-b263-24496ce9fc8e	00030000-55ee-a439-7d31-f4e214e9c371
00020000-55ee-a43a-b263-24496ce9fc8e	00030000-55ee-a439-e394-985ef6c22559
00020000-55ee-a43a-b263-24496ce9fc8e	00030000-55ee-a439-512f-6bfd1f3ba316
00020000-55ee-a43a-b263-24496ce9fc8e	00030000-55ee-a439-a33c-22bc89eaef3c
00020000-55ee-a43a-b263-24496ce9fc8e	00030000-55ee-a439-1ca7-bbd188c5388d
00020000-55ee-a43a-b263-24496ce9fc8e	00030000-55ee-a439-f714-110045a9a3ee
00020000-55ee-a43a-b263-24496ce9fc8e	00030000-55ee-a439-ff1d-ed1fee21c145
00020000-55ee-a43a-b263-24496ce9fc8e	00030000-55ee-a439-5521-2b5d45619ce9
00020000-55ee-a43a-b263-24496ce9fc8e	00030000-55ee-a439-424c-22024d1f046f
00020000-55ee-a43a-b263-24496ce9fc8e	00030000-55ee-a439-500b-5846d390203d
00020000-55ee-a43a-b263-24496ce9fc8e	00030000-55ee-a439-3178-4f2c178b4d74
00020000-55ee-a43a-b263-24496ce9fc8e	00030000-55ee-a439-aba4-f8ddde098651
00020000-55ee-a43a-b263-24496ce9fc8e	00030000-55ee-a439-4c31-5d4a2f86fddf
00020000-55ee-a43a-b263-24496ce9fc8e	00030000-55ee-a439-e4c5-9ed00c79d2c5
00020000-55ee-a43a-b263-24496ce9fc8e	00030000-55ee-a439-542f-2cde6bc8e630
00020000-55ee-a43a-b263-24496ce9fc8e	00030000-55ee-a439-d65a-81e542520886
00020000-55ee-a43a-b263-24496ce9fc8e	00030000-55ee-a439-1444-1cc081ba581a
00020000-55ee-a43a-b263-24496ce9fc8e	00030000-55ee-a439-a2bc-b21de5e268d0
00020000-55ee-a43a-b263-24496ce9fc8e	00030000-55ee-a439-d92c-c333847801bc
00020000-55ee-a43a-b263-24496ce9fc8e	00030000-55ee-a439-dbd6-e3b26ab8aaf8
00020000-55ee-a43b-0930-99d36658cb5c	00030000-55ee-a439-763e-d490860c2aaf
00020000-55ee-a43b-0930-99d36658cb5c	00030000-55ee-a439-407f-2e569d944c47
00020000-55ee-a43b-0930-99d36658cb5c	00030000-55ee-a439-1444-1cc081ba581a
00020000-55ee-a43b-0930-99d36658cb5c	00030000-55ee-a439-040d-2594a6c23fc1
00020000-55ee-a43b-0930-99d36658cb5c	00030000-55ee-a439-6407-e5bd379f6302
00020000-55ee-a43b-0930-99d36658cb5c	00030000-55ee-a439-c458-0e49a04d4855
00020000-55ee-a43b-0930-99d36658cb5c	00030000-55ee-a439-40d2-fcc980e168a2
00020000-55ee-a43b-0930-99d36658cb5c	00030000-55ee-a439-7d31-f4e214e9c371
00020000-55ee-a43b-0930-99d36658cb5c	00030000-55ee-a439-272e-060a8f1b1f95
00020000-55ee-a43b-0930-99d36658cb5c	00030000-55ee-a439-bc94-2315d59c6735
00020000-55ee-a43b-0930-99d36658cb5c	00030000-55ee-a439-4311-bed99954ae09
00020000-55ee-a43b-0930-99d36658cb5c	00030000-55ee-a439-e394-985ef6c22559
00020000-55ee-a43b-0930-99d36658cb5c	00030000-55ee-a439-76a1-e204f7b34fe6
00020000-55ee-a43b-0930-99d36658cb5c	00030000-55ee-a439-ea03-ea8ecdb4b092
00020000-55ee-a43b-0930-99d36658cb5c	00030000-55ee-a439-d705-adef16ba71fb
00020000-55ee-a43b-0930-99d36658cb5c	00030000-55ee-a439-b5bd-f176b6530e16
00020000-55ee-a43b-0930-99d36658cb5c	00030000-55ee-a439-d451-1f2ca8061a4f
00020000-55ee-a43b-0930-99d36658cb5c	00030000-55ee-a439-512f-6bfd1f3ba316
00020000-55ee-a43b-0930-99d36658cb5c	00030000-55ee-a439-48c3-814b91d77a7b
00020000-55ee-a43b-0930-99d36658cb5c	00030000-55ee-a439-a33c-22bc89eaef3c
00020000-55ee-a43b-0930-99d36658cb5c	00030000-55ee-a439-bbbc-87f432f08f8c
00020000-55ee-a43b-0930-99d36658cb5c	00030000-55ee-a439-2bbf-3f626075301e
00020000-55ee-a43b-0930-99d36658cb5c	00030000-55ee-a439-4f7e-5bcdbd245d2c
00020000-55ee-a43b-0930-99d36658cb5c	00030000-55ee-a439-0098-2a168b4995ad
00020000-55ee-a43b-0930-99d36658cb5c	00030000-55ee-a439-3e70-87f400ed0488
00020000-55ee-a43b-0930-99d36658cb5c	00030000-55ee-a439-bf7f-8e07d6acecac
00020000-55ee-a43b-0930-99d36658cb5c	00030000-55ee-a439-01cb-58fbf3f080a4
00020000-55ee-a43b-0930-99d36658cb5c	00030000-55ee-a439-1ca7-bbd188c5388d
00020000-55ee-a43b-0930-99d36658cb5c	00030000-55ee-a439-277c-6dac2df52f46
00020000-55ee-a43b-0930-99d36658cb5c	00030000-55ee-a439-f714-110045a9a3ee
00020000-55ee-a43b-0930-99d36658cb5c	00030000-55ee-a439-8352-d8884c86b4a7
00020000-55ee-a43b-0930-99d36658cb5c	00030000-55ee-a439-9fc4-17cde2d44b40
00020000-55ee-a43b-0930-99d36658cb5c	00030000-55ee-a439-c764-b3b20747489d
00020000-55ee-a43b-0930-99d36658cb5c	00030000-55ee-a439-bbe8-d257525afec7
00020000-55ee-a43b-0930-99d36658cb5c	00030000-55ee-a439-883a-5518a9539f92
00020000-55ee-a43b-0930-99d36658cb5c	00030000-55ee-a439-9d9a-d08f1d5e91d0
00020000-55ee-a43b-0930-99d36658cb5c	00030000-55ee-a439-7af4-5e56ed897b30
00020000-55ee-a43b-0930-99d36658cb5c	00030000-55ee-a439-ff1d-ed1fee21c145
00020000-55ee-a43b-0930-99d36658cb5c	00030000-55ee-a439-8c39-82849d5ba615
00020000-55ee-a43b-0930-99d36658cb5c	00030000-55ee-a439-5521-2b5d45619ce9
00020000-55ee-a43b-0930-99d36658cb5c	00030000-55ee-a439-641d-7df1881ca55c
00020000-55ee-a43b-0930-99d36658cb5c	00030000-55ee-a439-f524-68ebc17d0feb
00020000-55ee-a43b-0930-99d36658cb5c	00030000-55ee-a439-b771-67210702f05a
00020000-55ee-a43b-0930-99d36658cb5c	00030000-55ee-a439-6208-c0b60053da6a
00020000-55ee-a43b-0930-99d36658cb5c	00030000-55ee-a439-c2f6-330b1a049b6b
00020000-55ee-a43b-0930-99d36658cb5c	00030000-55ee-a439-0b78-beda95663bf9
00020000-55ee-a43b-0930-99d36658cb5c	00030000-55ee-a439-3092-a7be02a24154
00020000-55ee-a43b-0930-99d36658cb5c	00030000-55ee-a439-1034-412360288732
00020000-55ee-a43b-0930-99d36658cb5c	00030000-55ee-a439-1eab-d9de00897c1e
00020000-55ee-a43b-0930-99d36658cb5c	00030000-55ee-a439-424c-22024d1f046f
00020000-55ee-a43b-0930-99d36658cb5c	00030000-55ee-a439-8210-aa727bb3b4cf
00020000-55ee-a43b-0930-99d36658cb5c	00030000-55ee-a439-500b-5846d390203d
00020000-55ee-a43b-0930-99d36658cb5c	00030000-55ee-a439-cd28-496cc560239a
00020000-55ee-a43b-0930-99d36658cb5c	00030000-55ee-a439-9b11-9a11b0d799d3
00020000-55ee-a43b-0930-99d36658cb5c	00030000-55ee-a439-2ce6-532cc99c1bf6
00020000-55ee-a43b-0930-99d36658cb5c	00030000-55ee-a439-5ea7-eb5fd2a3dab5
00020000-55ee-a43b-0930-99d36658cb5c	00030000-55ee-a439-131c-8a0b83bf66e8
00020000-55ee-a43b-0930-99d36658cb5c	00030000-55ee-a439-3178-4f2c178b4d74
00020000-55ee-a43b-0930-99d36658cb5c	00030000-55ee-a439-b5d6-db1a333b7c4f
00020000-55ee-a43b-0930-99d36658cb5c	00030000-55ee-a439-1a2c-ffeb06593995
00020000-55ee-a43b-0930-99d36658cb5c	00030000-55ee-a439-01c8-46f20871e831
00020000-55ee-a43b-0930-99d36658cb5c	00030000-55ee-a439-4475-f2e90eea36ac
00020000-55ee-a43b-0930-99d36658cb5c	00030000-55ee-a439-c6e9-59743056e555
00020000-55ee-a43b-0930-99d36658cb5c	00030000-55ee-a439-3570-d49dd01a6de1
00020000-55ee-a43b-0930-99d36658cb5c	00030000-55ee-a439-8289-ab902b0662a8
00020000-55ee-a43b-0930-99d36658cb5c	00030000-55ee-a439-d3b9-6bc707184aa0
00020000-55ee-a43b-0930-99d36658cb5c	00030000-55ee-a439-4621-965d42448ab3
00020000-55ee-a43b-0930-99d36658cb5c	00030000-55ee-a439-81e6-5f902212e7d7
00020000-55ee-a43b-0930-99d36658cb5c	00030000-55ee-a439-bfd7-53a5c5e7106e
00020000-55ee-a43b-0930-99d36658cb5c	00030000-55ee-a439-01e6-c51071efd2b7
00020000-55ee-a43b-0930-99d36658cb5c	00030000-55ee-a439-c42f-7e6ee169e59e
00020000-55ee-a43b-0930-99d36658cb5c	00030000-55ee-a439-fc0e-cedd22621403
00020000-55ee-a43b-0930-99d36658cb5c	00030000-55ee-a439-a603-861fca7d895f
00020000-55ee-a43b-0930-99d36658cb5c	00030000-55ee-a439-1cdc-d6e0eb7170a0
00020000-55ee-a43b-0930-99d36658cb5c	00030000-55ee-a439-26cc-ab7dd4f6c74c
00020000-55ee-a43b-0930-99d36658cb5c	00030000-55ee-a439-1269-2a33a821243a
00020000-55ee-a43b-0930-99d36658cb5c	00030000-55ee-a439-fab2-60a2aa85d5fb
00020000-55ee-a43b-0930-99d36658cb5c	00030000-55ee-a439-5157-5353f5762c4b
00020000-55ee-a43b-0930-99d36658cb5c	00030000-55ee-a439-b62e-e1f22df09723
00020000-55ee-a43b-0930-99d36658cb5c	00030000-55ee-a439-d7de-e78f9518493a
00020000-55ee-a43b-0930-99d36658cb5c	00030000-55ee-a439-9e0c-7005f45c8f74
00020000-55ee-a43b-0930-99d36658cb5c	00030000-55ee-a439-73a3-3f619063f800
00020000-55ee-a43b-0930-99d36658cb5c	00030000-55ee-a439-0a57-898623d6854c
00020000-55ee-a43b-0930-99d36658cb5c	00030000-55ee-a439-80ff-d1709891f0b4
00020000-55ee-a43b-0930-99d36658cb5c	00030000-55ee-a439-67a9-2f48b2616532
00020000-55ee-a43b-0930-99d36658cb5c	00030000-55ee-a439-aba4-f8ddde098651
00020000-55ee-a43b-0930-99d36658cb5c	00030000-55ee-a439-9c75-bb5ba9a43d19
00020000-55ee-a43b-0930-99d36658cb5c	00030000-55ee-a439-cfca-4f71ec400d94
00020000-55ee-a43b-0930-99d36658cb5c	00030000-55ee-a439-e272-07b2c19bfb66
00020000-55ee-a43b-0930-99d36658cb5c	00030000-55ee-a439-2345-631881fc231b
00020000-55ee-a43b-0930-99d36658cb5c	00030000-55ee-a439-7e6e-67fc393f6de1
00020000-55ee-a43b-0930-99d36658cb5c	00030000-55ee-a439-4c31-5d4a2f86fddf
00020000-55ee-a43b-0930-99d36658cb5c	00030000-55ee-a439-5f48-dc81386a67ca
00020000-55ee-a43b-0930-99d36658cb5c	00030000-55ee-a439-e4c5-9ed00c79d2c5
00020000-55ee-a43b-0930-99d36658cb5c	00030000-55ee-a439-235a-14002f62231a
00020000-55ee-a43b-0930-99d36658cb5c	00030000-55ee-a439-f8a5-dba37d7cdceb
00020000-55ee-a43b-0930-99d36658cb5c	00030000-55ee-a439-12c2-9cf7ef30e1b9
00020000-55ee-a43b-0930-99d36658cb5c	00030000-55ee-a439-b574-55bd764296d6
00020000-55ee-a43b-0930-99d36658cb5c	00030000-55ee-a439-6e69-1e29ff6f189c
00020000-55ee-a43b-0930-99d36658cb5c	00030000-55ee-a439-4df7-3fa2c9a2dba4
00020000-55ee-a43b-0930-99d36658cb5c	00030000-55ee-a439-f0d9-5e33481406d7
00020000-55ee-a43b-0930-99d36658cb5c	00030000-55ee-a439-98e4-21d84705f31b
00020000-55ee-a43b-0930-99d36658cb5c	00030000-55ee-a439-e13b-3c53d1da4d9d
00020000-55ee-a43b-0930-99d36658cb5c	00030000-55ee-a439-542f-2cde6bc8e630
00020000-55ee-a43b-0930-99d36658cb5c	00030000-55ee-a439-a236-d69358beaf36
00020000-55ee-a43b-0930-99d36658cb5c	00030000-55ee-a439-c36c-3be2d481bf42
00020000-55ee-a43b-0930-99d36658cb5c	00030000-55ee-a439-2519-f6e0044f0afa
00020000-55ee-a43b-0930-99d36658cb5c	00030000-55ee-a439-ff45-a8bfce0e22ab
00020000-55ee-a43b-0930-99d36658cb5c	00030000-55ee-a439-5566-95500d533b97
00020000-55ee-a43b-0930-99d36658cb5c	00030000-55ee-a439-d0f8-c93198715c65
00020000-55ee-a43b-0930-99d36658cb5c	00030000-55ee-a439-080b-2c9db7dca1c7
00020000-55ee-a43b-0930-99d36658cb5c	00030000-55ee-a439-7838-b7a09d83091d
00020000-55ee-a43b-0930-99d36658cb5c	00030000-55ee-a439-5568-eb47555cf090
00020000-55ee-a43b-0930-99d36658cb5c	00030000-55ee-a439-829b-9cbc4e067fa0
00020000-55ee-a43b-0930-99d36658cb5c	00030000-55ee-a439-1db4-fb0bf15f6084
00020000-55ee-a43b-0930-99d36658cb5c	00030000-55ee-a439-d65a-81e542520886
00020000-55ee-a43b-0930-99d36658cb5c	00030000-55ee-a439-553a-70af4de898a0
00020000-55ee-a43b-0930-99d36658cb5c	00030000-55ee-a439-a2bc-b21de5e268d0
00020000-55ee-a43b-0930-99d36658cb5c	00030000-55ee-a439-1dae-d7bd362d078b
00020000-55ee-a43b-0930-99d36658cb5c	00030000-55ee-a439-6bad-af8cfa985573
00020000-55ee-a43b-0930-99d36658cb5c	00030000-55ee-a439-057b-dc495e64ed72
00020000-55ee-a43b-0930-99d36658cb5c	00030000-55ee-a439-c831-3b4529884517
00020000-55ee-a43b-0930-99d36658cb5c	00030000-55ee-a439-335a-5b3f0e78735c
00020000-55ee-a43b-0930-99d36658cb5c	00030000-55ee-a439-1cd2-15a91987d6f5
00020000-55ee-a43b-0930-99d36658cb5c	00030000-55ee-a439-e71f-7d73662ce10a
00020000-55ee-a43b-0930-99d36658cb5c	00030000-55ee-a439-4630-d096b21b38fd
00020000-55ee-a43b-0930-99d36658cb5c	00030000-55ee-a439-9f01-9a93764242cf
00020000-55ee-a43b-0930-99d36658cb5c	00030000-55ee-a439-54c4-c76c3797a463
00020000-55ee-a43b-0930-99d36658cb5c	00030000-55ee-a439-7b1c-ea5f86a30a62
00020000-55ee-a43b-0930-99d36658cb5c	00030000-55ee-a439-bbf0-943705d0bfe1
00020000-55ee-a43b-0930-99d36658cb5c	00030000-55ee-a439-4ede-a13c60d37aa0
00020000-55ee-a43b-0930-99d36658cb5c	00030000-55ee-a439-505c-6ba944b1824d
00020000-55ee-a43b-0930-99d36658cb5c	00030000-55ee-a439-a15c-3c83878d4020
00020000-55ee-a43b-0930-99d36658cb5c	00030000-55ee-a439-5313-4d6d70a83a99
00020000-55ee-a43b-0930-99d36658cb5c	00030000-55ee-a439-19af-0c27a8a3cc2a
00020000-55ee-a43b-0930-99d36658cb5c	00030000-55ee-a439-d92c-c333847801bc
00020000-55ee-a43b-0930-99d36658cb5c	00030000-55ee-a439-2c8c-4b57ef84ae78
00020000-55ee-a43b-0930-99d36658cb5c	00030000-55ee-a439-dbd6-e3b26ab8aaf8
00020000-55ee-a43b-0930-99d36658cb5c	00030000-55ee-a439-aec8-f322d44ec7ca
\.


--
-- TOC entry 2935 (class 0 OID 17928072)
-- Dependencies: 206
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 2939 (class 0 OID 17928106)
-- Dependencies: 210
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 2950 (class 0 OID 17928234)
-- Dependencies: 221
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, zacetek, konec, placilonavajo, vrednostvaje, planiranostevilovaj, vrednostvaj, vrednostpredstave, vrednostdopremiere, aktivna, zaposlenvdrjz, samozaposlen, igralec, opis) FROM stdin;
000b0000-55ee-a43b-41fd-57d1fb9b708d	00090000-55ee-a43b-d2d9-4d295cbdf1fe	\N	\N	0001	\N	\N	f	10.00	3	10.00	30.00	10.00	t	t	f	t	Pogodba o sodelovanju
000b0000-55ee-a43b-e754-17c170559a66	00090000-55ee-a43b-a390-7a0d3f2f532c	\N	\N	0002	\N	\N	t	11.00	10	11.00	31.00	110.00	t	f	t	t	Pogodba za vlogo Helena
000b0000-55ee-a43b-e1ad-349249bf8671	00090000-55ee-a43b-b46f-07925b54ff0c	\N	\N	0003	\N	\N	f	12.00	4	12.00	32.00	12.00	t	f	t	f	Pogodba za lektoriranje
\.


--
-- TOC entry 2913 (class 0 OID 17927837)
-- Dependencies: 184
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, drzava_id, sifra, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo, nvo) FROM stdin;
00080000-55ee-a43a-b4f9-125c8fd41166	00040000-55ee-a439-e737-40c8da0bf14e	0988	AK	Juhuhu d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55ee-a43a-fb0f-7ab4033eed7c	00040000-55ee-a439-e737-40c8da0bf14e	0989	AK	Hopsasa d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	t
00080000-55ee-a43a-5b9e-48945bad2291	00040000-55ee-a439-e737-40c8da0bf14e	0987	AK	Gledališče Šrum d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55ee-a43a-af42-d659251b5303	00040000-55ee-a439-e737-40c8da0bf14e	0986	AK	Lutkovni Direndaj d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55ee-a43a-c083-567f2af725b1	00040000-55ee-a439-e737-40c8da0bf14e	0985	AK	Tatjana Stanič, Lektoriranje, s.p.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55ee-a43a-500d-27e7454f7bb5	00040000-55ee-a439-969b-f1e9b13decbf	0984	AK	Gledališče Lepote tvoje		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55ee-a43a-4b4d-f150e44de7e1	00040000-55ee-a439-1dd0-f394fa5519d8	0983	AK	Sunce naše		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55ee-a43a-b9e9-3892f0b59b69	00040000-55ee-a439-f8ed-ea711121d213	0982	AK	Theater Amadeus		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55ee-a43a-0c0b-38a2ddcae3bb	00040000-55ee-a439-e399-13642b0fd71e	9999	AK	Fuchs		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55ee-a43c-14a1-87578bd94593	00040000-55ee-a439-e737-40c8da0bf14e	1001	AK	Gledališče Matica		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
\.


--
-- TOC entry 2915 (class 0 OID 17927871)
-- Dependencies: 186
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-55ee-a439-5d28-90bb33f62736	8341	Adlešiči
00050000-55ee-a439-7576-0eac29f91fb2	5270	Ajdovščina
00050000-55ee-a439-81c2-3567ba353d77	6280	Ankaran/Ancarano
00050000-55ee-a439-2fb6-a91faea1e472	9253	Apače
00050000-55ee-a439-35c9-3361d108685a	8253	Artiče
00050000-55ee-a439-a6e8-385c25dce2b9	4275	Begunje na Gorenjskem
00050000-55ee-a439-fae3-81e11da2f272	1382	Begunje pri Cerknici
00050000-55ee-a439-9751-f9bfc62683a7	9231	Beltinci
00050000-55ee-a439-95fb-bb13ba5a0c25	2234	Benedikt
00050000-55ee-a439-5475-8ab68c7229b1	2345	Bistrica ob Dravi
00050000-55ee-a439-bb42-973ce7b2a018	3256	Bistrica ob Sotli
00050000-55ee-a439-4aa1-264901ec84ca	8259	Bizeljsko
00050000-55ee-a439-f253-25ba57311de7	1223	Blagovica
00050000-55ee-a439-4163-f9481d7125d3	8283	Blanca
00050000-55ee-a439-2de5-f7029dac6591	4260	Bled
00050000-55ee-a439-4e75-c76773bbedbb	4273	Blejska Dobrava
00050000-55ee-a439-86ca-6cbf598e97d7	9265	Bodonci
00050000-55ee-a439-f0e4-09c5268651c0	9222	Bogojina
00050000-55ee-a439-2701-04d042ee3399	4263	Bohinjska Bela
00050000-55ee-a439-afbe-51aa150c5f38	4264	Bohinjska Bistrica
00050000-55ee-a439-e4e3-83ddf8dbcea3	4265	Bohinjsko jezero
00050000-55ee-a439-4132-ecb169ba8728	1353	Borovnica
00050000-55ee-a439-328c-4ffadcae05a2	8294	Boštanj
00050000-55ee-a439-2816-995458563184	5230	Bovec
00050000-55ee-a439-7324-1960bad40830	5295	Branik
00050000-55ee-a439-040f-02cd7f299739	3314	Braslovče
00050000-55ee-a439-a907-c34723c0dcb1	5223	Breginj
00050000-55ee-a439-de3a-b3828468c674	8280	Brestanica
00050000-55ee-a439-5f29-ba22189808c7	2354	Bresternica
00050000-55ee-a439-a9fc-433179b101b6	4243	Brezje
00050000-55ee-a439-d898-e056a2e45c01	1351	Brezovica pri Ljubljani
00050000-55ee-a439-2e2f-993da3d7644c	8250	Brežice
00050000-55ee-a439-7820-c2df36038ada	4210	Brnik - Aerodrom
00050000-55ee-a439-6f18-4be5081b2d3d	8321	Brusnice
00050000-55ee-a439-4d68-e5bcf6e053e4	3255	Buče
00050000-55ee-a439-1469-9d8e6554ef9c	8276	Bučka 
00050000-55ee-a439-dce5-83a38656aa4a	9261	Cankova
00050000-55ee-a439-1c71-77812b67783f	3000	Celje 
00050000-55ee-a439-cc19-e2e9c74c5b26	3001	Celje - poštni predali
00050000-55ee-a439-640b-d0e26c4d5186	4207	Cerklje na Gorenjskem
00050000-55ee-a439-2cea-8a7d66499418	8263	Cerklje ob Krki
00050000-55ee-a439-184e-ba7fae07f0e4	1380	Cerknica
00050000-55ee-a439-4036-0f45b4b2ff47	5282	Cerkno
00050000-55ee-a439-4fc9-4ff75295b253	2236	Cerkvenjak
00050000-55ee-a439-bc1a-e94ce3e3acef	2215	Ceršak
00050000-55ee-a439-8054-10232e5ae7c1	2326	Cirkovce
00050000-55ee-a439-2fd5-a226567ca43a	2282	Cirkulane
00050000-55ee-a439-55f6-43122d12ea0f	5273	Col
00050000-55ee-a439-227a-4a368ef65daa	8251	Čatež ob Savi
00050000-55ee-a439-4717-12538537bfd6	1413	Čemšenik
00050000-55ee-a439-b445-71775620819f	5253	Čepovan
00050000-55ee-a439-3771-8cf026b870b2	9232	Črenšovci
00050000-55ee-a439-3d4e-ea6144897f60	2393	Črna na Koroškem
00050000-55ee-a439-c5bf-35b2c66d1b0f	6275	Črni Kal
00050000-55ee-a439-d26b-ca86eb564056	5274	Črni Vrh nad Idrijo
00050000-55ee-a439-6454-5e7d3857b6bb	5262	Črniče
00050000-55ee-a439-b7e7-30241b1012b6	8340	Črnomelj
00050000-55ee-a439-a331-8104d5d348b9	6271	Dekani
00050000-55ee-a439-a12a-4a049650c6c3	5210	Deskle
00050000-55ee-a439-0419-205d767d05bb	2253	Destrnik
00050000-55ee-a439-0302-a1d40b988f6e	6215	Divača
00050000-55ee-a439-4a65-e255766c182d	1233	Dob
00050000-55ee-a439-b5b0-530360fa67da	3224	Dobje pri Planini
00050000-55ee-a439-0f1f-4cfad81d21fb	8257	Dobova
00050000-55ee-a439-cc07-dfe4a5773943	1423	Dobovec
00050000-55ee-a439-6206-52f189c0ffee	5263	Dobravlje
00050000-55ee-a439-5aa4-2bbce57a83f4	3204	Dobrna
00050000-55ee-a439-23b1-ba04c5ef93e8	8211	Dobrnič
00050000-55ee-a439-a991-a2436c97e37e	1356	Dobrova
00050000-55ee-a439-8bda-0bc67354f93d	9223	Dobrovnik/Dobronak 
00050000-55ee-a439-1d92-0a9e45be6243	5212	Dobrovo v Brdih
00050000-55ee-a439-a48a-14e959819d41	1431	Dol pri Hrastniku
00050000-55ee-a439-4fac-06d4d4a66d21	1262	Dol pri Ljubljani
00050000-55ee-a439-183b-cf9885fa73b0	1273	Dole pri Litiji
00050000-55ee-a439-6d5b-283606e0e67a	1331	Dolenja vas
00050000-55ee-a439-f1e1-53e27be82ff4	8350	Dolenjske Toplice
00050000-55ee-a439-d3c8-c3525e9ef757	1230	Domžale
00050000-55ee-a439-7f8e-9c90e6c714e6	2252	Dornava
00050000-55ee-a439-ab9f-561b49ab7cc7	5294	Dornberk
00050000-55ee-a439-97e1-365ec0a0e33d	1319	Draga
00050000-55ee-a439-d1a6-47599ad91b94	8343	Dragatuš
00050000-55ee-a439-44a1-fb5fe683091f	3222	Dramlje
00050000-55ee-a439-df4c-23244957a381	2370	Dravograd
00050000-55ee-a439-a891-a95c90b014b9	4203	Duplje
00050000-55ee-a439-403d-4feae3eef149	6221	Dutovlje
00050000-55ee-a439-421b-d7057f51a4b1	8361	Dvor
00050000-55ee-a439-0c00-acdd0d4133cf	2343	Fala
00050000-55ee-a439-e3b0-e10179e12d59	9208	Fokovci
00050000-55ee-a439-7713-957802664002	2313	Fram
00050000-55ee-a439-ff5f-04a7c4426f69	3213	Frankolovo
00050000-55ee-a439-c598-5a50828e0c6c	1274	Gabrovka
00050000-55ee-a439-7009-382e8a9261cf	8254	Globoko
00050000-55ee-a439-0688-3f39ba2443c5	5275	Godovič
00050000-55ee-a439-b2f9-00a9b1e7b206	4204	Golnik
00050000-55ee-a439-e8b7-1a835e15f816	3303	Gomilsko
00050000-55ee-a439-a276-4749c583409f	4224	Gorenja vas
00050000-55ee-a439-9f52-acfa84078a10	3263	Gorica pri Slivnici
00050000-55ee-a439-f1e0-23fc10ea4241	2272	Gorišnica
00050000-55ee-a439-7800-1267f28ecf0b	9250	Gornja Radgona
00050000-55ee-a439-2e24-5d5b861747cb	3342	Gornji Grad
00050000-55ee-a439-8594-5d8acfdfe15e	4282	Gozd Martuljek
00050000-55ee-a439-d864-d3a83c51cbb8	6272	Gračišče
00050000-55ee-a439-b529-289b7e61e23e	9264	Grad
00050000-55ee-a439-0d1c-583991659327	8332	Gradac
00050000-55ee-a439-e348-e594424ae8a6	1384	Grahovo
00050000-55ee-a439-2ad0-5b7231965236	5242	Grahovo ob Bači
00050000-55ee-a439-9176-8de3ff86684a	5251	Grgar
00050000-55ee-a439-e557-3edd7cc2b3ad	3302	Griže
00050000-55ee-a439-7321-3806ecf68b30	3231	Grobelno
00050000-55ee-a439-dc97-d1561aa83fdb	1290	Grosuplje
00050000-55ee-a439-db2d-6dce4bedcf43	2288	Hajdina
00050000-55ee-a439-6844-0c56cc408233	8362	Hinje
00050000-55ee-a439-334c-a542f4612123	2311	Hoče
00050000-55ee-a439-45b7-5dc600b58f7a	9205	Hodoš/Hodos
00050000-55ee-a439-0763-d2c5b0ba9d4d	1354	Horjul
00050000-55ee-a439-430d-a9689bab29da	1372	Hotedršica
00050000-55ee-a439-599a-57ba57606962	1430	Hrastnik
00050000-55ee-a439-444c-cdf3d096c16b	6225	Hruševje
00050000-55ee-a439-dc0f-c77e627e80b4	4276	Hrušica
00050000-55ee-a439-e13e-9175e45d0b43	5280	Idrija
00050000-55ee-a439-b402-5169cafcdb9e	1292	Ig
00050000-55ee-a439-76ac-172790712bcd	6250	Ilirska Bistrica
00050000-55ee-a439-bb68-f2b06b70224b	6251	Ilirska Bistrica-Trnovo
00050000-55ee-a439-0f78-61607f820840	1295	Ivančna Gorica
00050000-55ee-a439-be5e-57e3327675ee	2259	Ivanjkovci
00050000-55ee-a439-318d-a28b8430601c	1411	Izlake
00050000-55ee-a439-d162-edbf8febb098	6310	Izola/Isola
00050000-55ee-a439-e2c2-316322a9376c	2222	Jakobski Dol
00050000-55ee-a439-9827-87cc922fe6cb	2221	Jarenina
00050000-55ee-a439-cd6a-329c52c6f27f	6254	Jelšane
00050000-55ee-a439-ce0c-343239d38094	4270	Jesenice
00050000-55ee-a439-692e-931f22ea2cf1	8261	Jesenice na Dolenjskem
00050000-55ee-a439-82a5-e00ca5350ff9	3273	Jurklošter
00050000-55ee-a439-ce18-b487182cf9a3	2223	Jurovski Dol
00050000-55ee-a439-7f7f-ae017273a7a2	2256	Juršinci
00050000-55ee-a439-4a50-068f889e9e7d	5214	Kal nad Kanalom
00050000-55ee-a439-36dd-8df6088801f3	3233	Kalobje
00050000-55ee-a439-b897-981b5e8c02f7	4246	Kamna Gorica
00050000-55ee-a439-3e48-3e79b83c1a12	2351	Kamnica
00050000-55ee-a439-2eff-b51c58470292	1241	Kamnik
00050000-55ee-a439-ae1f-318aea4394b6	5213	Kanal
00050000-55ee-a439-37be-20798d1269d3	8258	Kapele
00050000-55ee-a439-c86c-8b9a4f3bd162	2362	Kapla
00050000-55ee-a439-1a57-2ad91ea665e6	2325	Kidričevo
00050000-55ee-a439-c814-745afad02ab6	1412	Kisovec
00050000-55ee-a439-de2c-7da3f2815508	6253	Knežak
00050000-55ee-a439-39df-8c29be68f8fa	5222	Kobarid
00050000-55ee-a439-52f1-9a7c493ae521	9227	Kobilje
00050000-55ee-a439-ec14-da14230b9547	1330	Kočevje
00050000-55ee-a439-2861-4a9a3cf8f9b4	1338	Kočevska Reka
00050000-55ee-a439-2916-6e5ddb3d2469	2276	Kog
00050000-55ee-a439-5470-5d7d289785a8	5211	Kojsko
00050000-55ee-a439-fefe-304a892489c7	6223	Komen
00050000-55ee-a439-8f98-9293df7aa1d2	1218	Komenda
00050000-55ee-a439-b6f7-bffd15647928	6000	Koper/Capodistria 
00050000-55ee-a439-b576-27fa102f149c	6001	Koper/Capodistria - poštni predali
00050000-55ee-a439-072a-f3352d63e661	8282	Koprivnica
00050000-55ee-a439-5135-8bc9c0997794	5296	Kostanjevica na Krasu
00050000-55ee-a439-742b-f0fc9e7103e4	8311	Kostanjevica na Krki
00050000-55ee-a439-7993-274aa0b73772	1336	Kostel
00050000-55ee-a439-aaa8-44f704f1625a	6256	Košana
00050000-55ee-a439-7b3c-a2d37484fcf6	2394	Kotlje
00050000-55ee-a439-7156-5e20bd5c6740	6240	Kozina
00050000-55ee-a439-ee3b-2b560aca0e18	3260	Kozje
00050000-55ee-a439-823b-6bd9b956bae0	4000	Kranj 
00050000-55ee-a439-4068-ea11b3014c64	4001	Kranj - poštni predali
00050000-55ee-a439-acb1-ed99929f9163	4280	Kranjska Gora
00050000-55ee-a439-8915-058f002bccc6	1281	Kresnice
00050000-55ee-a439-a2c9-e4ea239624e4	4294	Križe
00050000-55ee-a439-e36a-d348c915b789	9206	Križevci
00050000-55ee-a439-d7f5-9744b6de8c59	9242	Križevci pri Ljutomeru
00050000-55ee-a439-a8d9-23b831b208a2	1301	Krka
00050000-55ee-a439-275b-818902139d7a	8296	Krmelj
00050000-55ee-a439-85e3-691cc1748e23	4245	Kropa
00050000-55ee-a439-a95d-16de13baa3c6	8262	Krška vas
00050000-55ee-a439-3d5c-299b69f1e826	8270	Krško
00050000-55ee-a439-e6b3-441ada64a838	9263	Kuzma
00050000-55ee-a439-d80c-b5a1ddb016ab	2318	Laporje
00050000-55ee-a439-58ab-d1c6493042b9	3270	Laško
00050000-55ee-a439-e114-bf75b5f8f1c6	1219	Laze v Tuhinju
00050000-55ee-a439-9401-63d45bafd102	2230	Lenart v Slovenskih goricah
00050000-55ee-a439-e99b-31cf0f0d35b0	9220	Lendava/Lendva
00050000-55ee-a439-016e-2da2ae3320b7	4248	Lesce
00050000-55ee-a439-b7eb-23b4a1f11f23	3261	Lesično
00050000-55ee-a439-6a89-1a74e927190f	8273	Leskovec pri Krškem
00050000-55ee-a439-bef3-f2bdda5d597f	2372	Libeliče
00050000-55ee-a439-703e-6caea7fb5716	2341	Limbuš
00050000-55ee-a439-aa9c-c9593680c2e3	1270	Litija
00050000-55ee-a439-978f-756203e42d80	3202	Ljubečna
00050000-55ee-a439-fb12-52888f64e69b	1000	Ljubljana 
00050000-55ee-a439-24e2-d8a5f921508d	1001	Ljubljana - poštni predali
00050000-55ee-a439-1177-0190f1074efb	1231	Ljubljana - Črnuče
00050000-55ee-a439-f4cc-aaa48b6ac374	1261	Ljubljana - Dobrunje
00050000-55ee-a439-b88f-611803a4d34b	1260	Ljubljana - Polje
00050000-55ee-a439-6129-af1fb2923541	1210	Ljubljana - Šentvid
00050000-55ee-a439-94b9-6c3666c4ea8f	1211	Ljubljana - Šmartno
00050000-55ee-a439-b05e-ae1b16657f2c	3333	Ljubno ob Savinji
00050000-55ee-a439-a274-d8e073dcfabd	9240	Ljutomer
00050000-55ee-a439-664c-7930d06c6682	3215	Loče
00050000-55ee-a439-d0dd-36113f0645cc	5231	Log pod Mangartom
00050000-55ee-a439-e2cf-057d0fcbe613	1358	Log pri Brezovici
00050000-55ee-a439-adb3-cacd5595c9bf	1370	Logatec
00050000-55ee-a439-87f0-fa2ccfa3b292	1371	Logatec
00050000-55ee-a439-7fba-890cdd5a73b2	1434	Loka pri Zidanem Mostu
00050000-55ee-a439-b52e-5aafa3668db6	3223	Loka pri Žusmu
00050000-55ee-a439-fdad-e8773bc8b921	6219	Lokev
00050000-55ee-a439-ea6b-46f4d11f7a71	1318	Loški Potok
00050000-55ee-a439-c14f-1888f0c3213c	2324	Lovrenc na Dravskem polju
00050000-55ee-a439-33b1-0e23d1142e1c	2344	Lovrenc na Pohorju
00050000-55ee-a439-b62e-fd1216230158	3334	Luče
00050000-55ee-a439-c99d-ffb263dad2f6	1225	Lukovica
00050000-55ee-a439-4cab-8fe4cb1e3da5	9202	Mačkovci
00050000-55ee-a439-8b30-0d27a1b7aeba	2322	Majšperk
00050000-55ee-a439-8f26-d30c985b2a44	2321	Makole
00050000-55ee-a439-f2cc-05c6a0dffbe6	9243	Mala Nedelja
00050000-55ee-a439-a2ca-357f6536b43f	2229	Malečnik
00050000-55ee-a439-e1ac-f88e20c58d04	6273	Marezige
00050000-55ee-a439-6eba-d12be960db33	2000	Maribor 
00050000-55ee-a439-ada9-40e6258b975c	2001	Maribor - poštni predali
00050000-55ee-a439-669b-a860ca6b5948	2206	Marjeta na Dravskem polju
00050000-55ee-a439-2015-630d0f99f551	2281	Markovci
00050000-55ee-a439-f8e7-744d3b5a9a71	9221	Martjanci
00050000-55ee-a439-093e-7713bcc6888c	6242	Materija
00050000-55ee-a439-0fd1-2b63c1263019	4211	Mavčiče
00050000-55ee-a439-bc7c-cbef434ead64	1215	Medvode
00050000-55ee-a439-208c-d7a3dc88d4da	1234	Mengeš
00050000-55ee-a439-971f-f0773988343c	8330	Metlika
00050000-55ee-a439-d909-75077cf6c861	2392	Mežica
00050000-55ee-a439-90d7-ed3a67ca1040	2204	Miklavž na Dravskem polju
00050000-55ee-a439-d278-73f9a8da8390	2275	Miklavž pri Ormožu
00050000-55ee-a439-a4b6-50bc3b024698	5291	Miren
00050000-55ee-a439-1d74-0b42fe535ec6	8233	Mirna
00050000-55ee-a439-5b5f-5c453b19043a	8216	Mirna Peč
00050000-55ee-a439-238f-fe1401d4bc70	2382	Mislinja
00050000-55ee-a439-4a14-2d12c2498750	4281	Mojstrana
00050000-55ee-a439-f3dd-eb8f0c8290d8	8230	Mokronog
00050000-55ee-a439-bf57-c8fd2377d7b3	1251	Moravče
00050000-55ee-a439-8fd4-8a6e173aafce	9226	Moravske Toplice
00050000-55ee-a439-851f-56d5df2024f6	5216	Most na Soči
00050000-55ee-a439-b7c8-ff62e0498921	1221	Motnik
00050000-55ee-a439-f111-64f0c6165c5e	3330	Mozirje
00050000-55ee-a439-f91d-14d6f1cfb2ca	9000	Murska Sobota 
00050000-55ee-a439-7805-bd6cb18737eb	9001	Murska Sobota - poštni predali
00050000-55ee-a439-10a1-8d9a40c79fe6	2366	Muta
00050000-55ee-a439-4d76-ff06a5f2c290	4202	Naklo
00050000-55ee-a439-2311-321958fc3780	3331	Nazarje
00050000-55ee-a439-4f51-2b788b15a364	1357	Notranje Gorice
00050000-55ee-a439-c14a-e1af91a678de	3203	Nova Cerkev
00050000-55ee-a439-9964-325fc6600149	5000	Nova Gorica 
00050000-55ee-a439-4d2c-a754c8d7e438	5001	Nova Gorica - poštni predali
00050000-55ee-a439-4215-fcea20779835	1385	Nova vas
00050000-55ee-a439-354b-663350838094	8000	Novo mesto
00050000-55ee-a439-bbcf-c13c9278011d	8001	Novo mesto - poštni predali
00050000-55ee-a439-def1-17b3dd35304e	6243	Obrov
00050000-55ee-a439-0894-720b8a46d94d	9233	Odranci
00050000-55ee-a439-a354-1465d3a77beb	2317	Oplotnica
00050000-55ee-a439-0a8b-17416150142a	2312	Orehova vas
00050000-55ee-a439-7823-ae867db7c029	2270	Ormož
00050000-55ee-a439-bddc-a5ecaa4f7c5e	1316	Ortnek
00050000-55ee-a439-446f-d37f6540ae07	1337	Osilnica
00050000-55ee-a439-8e28-24b4286c1ba4	8222	Otočec
00050000-55ee-a439-6d24-60b1207ded6c	2361	Ožbalt
00050000-55ee-a439-22d2-9d638f1e2075	2231	Pernica
00050000-55ee-a439-3c2a-008368a87a11	2211	Pesnica pri Mariboru
00050000-55ee-a439-c1a4-015b0a48e1b2	9203	Petrovci
00050000-55ee-a439-c339-646f4d67a7fd	3301	Petrovče
00050000-55ee-a439-2028-ef24764f8f18	6330	Piran/Pirano
00050000-55ee-a439-03f8-bd80df6c7d5b	8255	Pišece
00050000-55ee-a439-8eb5-3c34c40bff35	6257	Pivka
00050000-55ee-a439-c0d9-ef3c7dcaf4f3	6232	Planina
00050000-55ee-a439-18ad-31f0c79c88e6	3225	Planina pri Sevnici
00050000-55ee-a439-9de3-a8d69d024d03	6276	Pobegi
00050000-55ee-a439-8513-7bb4798bc706	8312	Podbočje
00050000-55ee-a439-31a8-d61c83dc07e4	5243	Podbrdo
00050000-55ee-a439-965a-274bf18bcaf9	3254	Podčetrtek
00050000-55ee-a439-f2d2-c1263dbf6b54	2273	Podgorci
00050000-55ee-a439-2e52-e1bc140a185c	6216	Podgorje
00050000-55ee-a439-f3e0-bd773d110afc	2381	Podgorje pri Slovenj Gradcu
00050000-55ee-a439-603f-d0974b5ee4fa	6244	Podgrad
00050000-55ee-a439-b041-bf8538dfebc2	1414	Podkum
00050000-55ee-a439-90b3-f4b130d735be	2286	Podlehnik
00050000-55ee-a439-f3b1-7e29b00ac89b	5272	Podnanos
00050000-55ee-a439-6ac7-202b7372abc7	4244	Podnart
00050000-55ee-a439-47e4-7485c40f0d18	3241	Podplat
00050000-55ee-a439-d1f0-30e2a94e6d95	3257	Podsreda
00050000-55ee-a439-cb31-2e6e04676037	2363	Podvelka
00050000-55ee-a439-cad0-0854c0163332	2208	Pohorje
00050000-55ee-a439-a53f-52c2dc8c704f	2257	Polenšak
00050000-55ee-a439-497d-0d02f68dcfc2	1355	Polhov Gradec
00050000-55ee-a439-cdbb-4af399a971a2	4223	Poljane nad Škofjo Loko
00050000-55ee-a439-e0c6-574a87f42267	2319	Poljčane
00050000-55ee-a439-d076-8556692b545e	1272	Polšnik
00050000-55ee-a439-af8a-805ecb9a2a87	3313	Polzela
00050000-55ee-a439-1612-d8fcb1c0f57d	3232	Ponikva
00050000-55ee-a439-f021-d7e8b0d6386f	6320	Portorož/Portorose
00050000-55ee-a439-9cc5-6fb42f292d83	6230	Postojna
00050000-55ee-a439-29b4-5c844613c2c3	2331	Pragersko
00050000-55ee-a439-ddd5-42830f29a9e5	3312	Prebold
00050000-55ee-a439-9368-3701a1a37324	4205	Preddvor
00050000-55ee-a439-faea-3ba844ac77dd	6255	Prem
00050000-55ee-a439-9ea0-c0f5c6a8e84c	1352	Preserje
00050000-55ee-a439-76a0-44ffb4b4c03c	6258	Prestranek
00050000-55ee-a439-cc3f-836620df2478	2391	Prevalje
00050000-55ee-a439-d3be-788155bdf2b6	3262	Prevorje
00050000-55ee-a439-44e0-411095fac14c	1276	Primskovo 
00050000-55ee-a439-88c2-04407eafd886	3253	Pristava pri Mestinju
00050000-55ee-a439-8608-e5e79f518a9c	9207	Prosenjakovci/Partosfalva
00050000-55ee-a439-d1ca-2bbd2acd5c85	5297	Prvačina
00050000-55ee-a439-6d03-7cc7c4962b52	2250	Ptuj
00050000-55ee-a439-d372-2917ef68a659	2323	Ptujska Gora
00050000-55ee-a439-0104-125f14a52644	9201	Puconci
00050000-55ee-a439-2e93-79c1da9f2a7f	2327	Rače
00050000-55ee-a439-b23c-1b6d0cdaa5f3	1433	Radeče
00050000-55ee-a439-cfd3-af58a201cefe	9252	Radenci
00050000-55ee-a439-402c-19368da7c1a3	2360	Radlje ob Dravi
00050000-55ee-a439-9edb-d840489600ac	1235	Radomlje
00050000-55ee-a439-76d2-f8366394e288	4240	Radovljica
00050000-55ee-a439-0dc3-c40f6803e15f	8274	Raka
00050000-55ee-a439-07a5-f3b5ab6589a1	1381	Rakek
00050000-55ee-a439-66ff-cbcc494e3db3	4283	Rateče - Planica
00050000-55ee-a439-8ad7-2307140abb8b	2390	Ravne na Koroškem
00050000-55ee-a439-9e94-6911e7aef792	9246	Razkrižje
00050000-55ee-a439-0abc-88a9630615d0	3332	Rečica ob Savinji
00050000-55ee-a439-9d57-f5f069a7bc2f	5292	Renče
00050000-55ee-a439-3c29-f2dbeaeac08f	1310	Ribnica
00050000-55ee-a439-e28e-a5cc7f4eac9e	2364	Ribnica na Pohorju
00050000-55ee-a439-3d8d-6eee223a25e2	3272	Rimske Toplice
00050000-55ee-a439-c1b2-ffdb312387bc	1314	Rob
00050000-55ee-a439-1d86-8c477ecf1770	5215	Ročinj
00050000-55ee-a439-0d3a-23551397be01	3250	Rogaška Slatina
00050000-55ee-a439-bf54-cc98aa2718d9	9262	Rogašovci
00050000-55ee-a439-c672-a2a8828c9a98	3252	Rogatec
00050000-55ee-a439-c15e-a53b6ae83a18	1373	Rovte
00050000-55ee-a439-9ad4-3a03724fded0	2342	Ruše
00050000-55ee-a439-b0ca-73db1a99658a	1282	Sava
00050000-55ee-a439-4a3f-8e4a627681bf	6333	Sečovlje/Sicciole
00050000-55ee-a439-d97f-f5d608da84df	4227	Selca
00050000-55ee-a439-792d-b013e75cdccf	2352	Selnica ob Dravi
00050000-55ee-a439-5191-931b6952a843	8333	Semič
00050000-55ee-a439-d7f5-2734ab26f26d	8281	Senovo
00050000-55ee-a439-6dcd-686020e95a36	6224	Senožeče
00050000-55ee-a439-52b1-7bac809b579c	8290	Sevnica
00050000-55ee-a439-ffc5-c445eadc4598	6210	Sežana
00050000-55ee-a439-363e-040f89ff4112	2214	Sladki Vrh
00050000-55ee-a439-5021-925f667a8ea2	5283	Slap ob Idrijci
00050000-55ee-a439-000f-6d7f0dd559d9	2380	Slovenj Gradec
00050000-55ee-a439-965b-ecebd100a959	2310	Slovenska Bistrica
00050000-55ee-a439-8852-abe221efadb5	3210	Slovenske Konjice
00050000-55ee-a439-2f7e-ff9aa09cfa14	1216	Smlednik
00050000-55ee-a439-fe57-ee98feff91f9	5232	Soča
00050000-55ee-a439-cf61-ee297314b4db	1317	Sodražica
00050000-55ee-a439-99bc-3a2f472c93f1	3335	Solčava
00050000-55ee-a439-0082-fb214e133f50	5250	Solkan
00050000-55ee-a439-551b-6b993b6d805f	4229	Sorica
00050000-55ee-a439-f702-de652ed458ea	4225	Sovodenj
00050000-55ee-a439-3d58-31d84c5cbf9d	5281	Spodnja Idrija
00050000-55ee-a439-bda0-fe0d3b5fbff4	2241	Spodnji Duplek
00050000-55ee-a439-5736-7468c86a93ec	9245	Spodnji Ivanjci
00050000-55ee-a439-7c03-a2c3759c8a89	2277	Središče ob Dravi
00050000-55ee-a439-4a86-daa7203cf76b	4267	Srednja vas v Bohinju
00050000-55ee-a439-27e5-126b30aa99f6	8256	Sromlje 
00050000-55ee-a439-874f-9c4eccdbcc76	5224	Srpenica
00050000-55ee-a439-d0e6-387b399a5e45	1242	Stahovica
00050000-55ee-a439-cda9-f02fbf756fd4	1332	Stara Cerkev
00050000-55ee-a439-3fed-18c54127d6c0	8342	Stari trg ob Kolpi
00050000-55ee-a439-e93c-ba67b84b04b8	1386	Stari trg pri Ložu
00050000-55ee-a439-3cb7-b5b579ab5c0c	2205	Starše
00050000-55ee-a439-c907-5d6585163eae	2289	Stoperce
00050000-55ee-a439-e29f-e3182307b243	8322	Stopiče
00050000-55ee-a439-87a8-ce611db7ba12	3206	Stranice
00050000-55ee-a439-f985-93cc77df5028	8351	Straža
00050000-55ee-a439-e29b-944340052c81	1313	Struge
00050000-55ee-a439-01f8-ff5f4d5fc814	8293	Studenec
00050000-55ee-a439-27fc-9fa32e349679	8331	Suhor
00050000-55ee-a439-f952-ceb9fde1d2d8	2233	Sv. Ana v Slovenskih goricah
00050000-55ee-a439-f27f-0a51ab25e0f5	2235	Sv. Trojica v Slovenskih goricah
00050000-55ee-a439-990c-baddf831e7a1	2353	Sveti Duh na Ostrem Vrhu
00050000-55ee-a439-ec0b-9c466bf3d540	9244	Sveti Jurij ob Ščavnici
00050000-55ee-a439-8629-537f7286a650	3264	Sveti Štefan
00050000-55ee-a439-8e2a-c15e41d05f78	2258	Sveti Tomaž
00050000-55ee-a439-76fe-ca60b753de6d	9204	Šalovci
00050000-55ee-a439-1878-5ba9ef7d624f	5261	Šempas
00050000-55ee-a439-8e78-bb6374003e74	5290	Šempeter pri Gorici
00050000-55ee-a439-1779-74f26c45b927	3311	Šempeter v Savinjski dolini
00050000-55ee-a439-a801-930a7e22944e	4208	Šenčur
00050000-55ee-a439-2758-f1645993dba9	2212	Šentilj v Slovenskih goricah
00050000-55ee-a439-6430-61d162bc1cc4	8297	Šentjanž
00050000-55ee-a439-d089-7b4e3338668a	2373	Šentjanž pri Dravogradu
00050000-55ee-a439-e2a6-aceda8f66dfa	8310	Šentjernej
00050000-55ee-a439-68a5-87c30e27c0db	3230	Šentjur
00050000-55ee-a439-cd50-6be6687bb510	3271	Šentrupert
00050000-55ee-a439-7a75-b96e8dcf2a49	8232	Šentrupert
00050000-55ee-a439-4bb2-04ddfbfea46b	1296	Šentvid pri Stični
00050000-55ee-a439-613d-9c23b9005247	8275	Škocjan
00050000-55ee-a439-1c07-61c56f15cd71	6281	Škofije
00050000-55ee-a439-06eb-9d93d3f7132f	4220	Škofja Loka
00050000-55ee-a439-56e6-81c4f50bffb7	3211	Škofja vas
00050000-55ee-a439-2b26-0e233c295274	1291	Škofljica
00050000-55ee-a439-9ec2-467ad0b75fdf	6274	Šmarje
00050000-55ee-a439-74f7-c89ea335cfdb	1293	Šmarje - Sap
00050000-55ee-a439-1902-ad674eb27998	3240	Šmarje pri Jelšah
00050000-55ee-a439-06d0-b133fd3441f3	8220	Šmarješke Toplice
00050000-55ee-a439-8285-0ce0f3361235	2315	Šmartno na Pohorju
00050000-55ee-a439-0808-da00e686aa2d	3341	Šmartno ob Dreti
00050000-55ee-a439-53e9-ced2540854f0	3327	Šmartno ob Paki
00050000-55ee-a439-b0cf-900c84e5eba9	1275	Šmartno pri Litiji
00050000-55ee-a439-6521-370159b391a4	2383	Šmartno pri Slovenj Gradcu
00050000-55ee-a439-5e78-96705eb50715	3201	Šmartno v Rožni dolini
00050000-55ee-a439-f7d4-f19b7a76cae2	3325	Šoštanj
00050000-55ee-a439-3f04-5de0f195ddac	6222	Štanjel
00050000-55ee-a439-624f-eef6c2351144	3220	Štore
00050000-55ee-a439-a2d8-5aec0d3c61ea	3304	Tabor
00050000-55ee-a439-febb-03f2b73a2d4e	3221	Teharje
00050000-55ee-a439-7863-f313c4681917	9251	Tišina
00050000-55ee-a439-75df-67c64fd18d05	5220	Tolmin
00050000-55ee-a439-b5dc-7457cc8385b6	3326	Topolšica
00050000-55ee-a439-d8c3-a363532c5c86	2371	Trbonje
00050000-55ee-a439-3c14-1a65487a8986	1420	Trbovlje
00050000-55ee-a439-5cd5-df83c20a01f4	8231	Trebelno 
00050000-55ee-a439-feb3-5b1a3773d0f8	8210	Trebnje
00050000-55ee-a439-3475-61e054231347	5252	Trnovo pri Gorici
00050000-55ee-a439-8716-a4a1b21f6a90	2254	Trnovska vas
00050000-55ee-a439-929b-7bfdee928e3f	1222	Trojane
00050000-55ee-a439-7253-186534f4e3cc	1236	Trzin
00050000-55ee-a439-9988-87182c954f87	4290	Tržič
00050000-55ee-a439-5c58-bc3c0c26e901	8295	Tržišče
00050000-55ee-a439-8f8f-eda79cb647de	1311	Turjak
00050000-55ee-a439-4f93-42b9c996ca51	9224	Turnišče
00050000-55ee-a439-cecd-10dcea520433	8323	Uršna sela
00050000-55ee-a439-d467-09f74f6b8811	1252	Vače
00050000-55ee-a439-b46e-848b4a106b54	3320	Velenje 
00050000-55ee-a439-15ef-6fc56d698ced	3322	Velenje - poštni predali
00050000-55ee-a439-1b06-a67ab68013f6	8212	Velika Loka
00050000-55ee-a439-605e-eeef63f67196	2274	Velika Nedelja
00050000-55ee-a439-6d80-b16d2df5d17b	9225	Velika Polana
00050000-55ee-a439-0235-3d665a4a417c	1315	Velike Lašče
00050000-55ee-a439-06f1-1c1bc01a0fd7	8213	Veliki Gaber
00050000-55ee-a439-2d47-020ab7362997	9241	Veržej
00050000-55ee-a439-f6d3-0f0532b78f41	1312	Videm - Dobrepolje
00050000-55ee-a439-7f9e-12b393fcc775	2284	Videm pri Ptuju
00050000-55ee-a439-2e02-523e13f50c0c	8344	Vinica
00050000-55ee-a439-28b7-55640a4b4fb9	5271	Vipava
00050000-55ee-a439-3f32-d05ad3dc7acb	4212	Visoko
00050000-55ee-a439-1890-9e1911afd6f9	1294	Višnja Gora
00050000-55ee-a439-a728-906b959f3434	3205	Vitanje
00050000-55ee-a439-6f37-b0bca6c8068f	2255	Vitomarci
00050000-55ee-a439-c3e8-fc429a194133	1217	Vodice
00050000-55ee-a439-7625-7e15d6bfbd6e	3212	Vojnik\t
00050000-55ee-a439-38bc-93cd76ba3c2b	5293	Volčja Draga
00050000-55ee-a439-f290-9f49b9849280	2232	Voličina
00050000-55ee-a439-73d0-aec7ef1db4cd	3305	Vransko
00050000-55ee-a439-b074-c92e77e21973	6217	Vremski Britof
00050000-55ee-a439-a8ac-9f6f91a0b5e5	1360	Vrhnika
00050000-55ee-a439-7b25-fb4276f41c0b	2365	Vuhred
00050000-55ee-a439-c93d-9006e8c1d524	2367	Vuzenica
00050000-55ee-a439-367f-252ac65230f6	8292	Zabukovje 
00050000-55ee-a439-60d6-1222c82864f2	1410	Zagorje ob Savi
00050000-55ee-a439-daa4-0ac42e0d4f40	1303	Zagradec
00050000-55ee-a439-f873-3af48ad92b50	2283	Zavrč
00050000-55ee-a439-b380-fced6c5c61b3	8272	Zdole 
00050000-55ee-a439-e5f0-b70168edef85	4201	Zgornja Besnica
00050000-55ee-a439-31d3-34de41b91e24	2242	Zgornja Korena
00050000-55ee-a439-4fe6-6ac1a93c3e7a	2201	Zgornja Kungota
00050000-55ee-a439-4077-b9a1c24ba528	2316	Zgornja Ložnica
00050000-55ee-a439-f6f2-2494508f25bd	2314	Zgornja Polskava
00050000-55ee-a439-bcbf-d0e323b996ac	2213	Zgornja Velka
00050000-55ee-a439-89d8-ca47bcf125ff	4247	Zgornje Gorje
00050000-55ee-a439-c9ad-d8e80183cad8	4206	Zgornje Jezersko
00050000-55ee-a439-c927-f50e8bb6e615	2285	Zgornji Leskovec
00050000-55ee-a439-436a-c8293cd4edb6	1432	Zidani Most
00050000-55ee-a439-789e-6a90f425194c	3214	Zreče
00050000-55ee-a439-8b91-82190974f287	4209	Žabnica
00050000-55ee-a439-eb83-1b7a395ca9d6	3310	Žalec
00050000-55ee-a439-df55-0b02bbc604e3	4228	Železniki
00050000-55ee-a439-fee8-1a45e1b98b32	2287	Žetale
00050000-55ee-a439-ddf5-72832f1e0c09	4226	Žiri
00050000-55ee-a439-ac80-e892b5733578	4274	Žirovnica
00050000-55ee-a439-0fea-4b77ce16885d	8360	Žužemberk
\.


--
-- TOC entry 2931 (class 0 OID 17928046)
-- Dependencies: 202
-- Data for Name: postavkaracuna; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkaracuna (id, racun_id) FROM stdin;
\.


--
-- TOC entry 2914 (class 0 OID 17927856)
-- Dependencies: 185
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
00060000-55ee-a43b-7ada-90cce84cbbca	00080000-55ee-a43a-b4f9-125c8fd41166	\N	00040000-55ee-a439-e737-40c8da0bf14e	Narodni dom	\N	Koroška 15	\N	9231	Beltinci	\N	f	t
00060000-55ee-a43b-35cc-f23721772239	00080000-55ee-a43a-b4f9-125c8fd41166	\N	00040000-55ee-a439-e737-40c8da0bf14e	Korotan	\N	Koroška 22	\N	9231	Beltinci	\N	f	f
00060000-55ee-a43b-33bd-e55f4e29b65a	00080000-55ee-a43a-fb0f-7ab4033eed7c	\N	00040000-55ee-a439-e737-40c8da0bf14e	Rimljan	\N	Rimska ploščad 7	\N	9231	Beltinci	\N	f	t
\.


--
-- TOC entry 2920 (class 0 OID 17927934)
-- Dependencies: 191
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id) FROM stdin;
\.


--
-- TOC entry 2933 (class 0 OID 17928058)
-- Dependencies: 204
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 2957 (class 0 OID 17928413)
-- Dependencies: 228
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, koproducent_id, odstotekfinanciranja, delez, maticnikop, kpe, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 2958 (class 0 OID 17928423)
-- Dependencies: 229
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, sifra, status) FROM stdin;
00190000-55ee-a43b-6229-76d1f38c9362	00080000-55ee-a43a-5b9e-48945bad2291	0987	AK
00190000-55ee-a43b-b70d-79ea4bbcb93a	00080000-55ee-a43a-fb0f-7ab4033eed7c	0989	AK
00190000-55ee-a43b-4d14-5b33db53192f	00080000-55ee-a43a-af42-d659251b5303	0986	AK
00190000-55ee-a43b-a340-69b7cf271cc1	00080000-55ee-a43a-500d-27e7454f7bb5	0984	AK
00190000-55ee-a43b-60a3-7ed75d37a022	00080000-55ee-a43a-4b4d-f150e44de7e1	0983	AK
00190000-55ee-a43b-d2ab-850011739617	00080000-55ee-a43a-b9e9-3892f0b59b69	0982	AK
00190000-55ee-a43c-f772-fb9b5c2b74a6	00080000-55ee-a43c-14a1-87578bd94593	1001	AK
\.


--
-- TOC entry 2956 (class 0 OID 17928370)
-- Dependencies: 227
-- Data for Name: programdela; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programdela (id, sifra, naziv, zacetek, konec, zakljuceno, potrjenprogram, stpremier, stint, stfest, strazno, stizjem, stponprem, stponprej, stponprejvelikih, stponprejmalih, stponprejmalihkopr, stponprejsredkopr, stponprejvelikihkopr, stgostujo, vrps1, vrps1do, vrps1mat, vrps1gostovsz, stizvnekomerc, stizvprem, stizvponprem, stizvponpremdoma, stizvponpremzamejo, stizvponpremgost, stizvponpremkopr, stizvponpremint, stizvponpremkoprint, stizvponprej, stizvponprejdoma, stizvponprejzamejo, stizvponprejgost, stizvponprejkopr, stizvponprejint, stizvponprejkoprint, stizvgostuj, stizvostalihnek, stizvgostovanjslo, stizvgostovanjzam, stizvgostovanjint, stobisknekom, stobisknekommat, stobisknekomgostslo, stobisknekomgostzam, stobisknekomgostint, stobiskprem, stobiskponprem, stobiskponpremdoma, stobiskponpremkopr, stobiskponpremkoprint, stobiskponpremgost, stobiskponpremzamejo, stobiskponpremint, avgobiskprired, avgzaseddvoran, avgcenavstopnice, stprodvstopnic, stkoprodukcij, stkoprodukcijint, stkoprodukcijnvo, stzaposlenih, stzaposigralcev, avgstnastopovigr, sthonorarnih, sthonorarnihigr, sthonorarnihigrtujjz, sthonorarnihigrsamoz, sredstvaint, sredstvaavt, sredstvazaprosenoprem, sredstvazaprosenoponprem, sredstvazaprosenoponprej, sredstvazaprosenogostujo, sredstvazaprosenoint, sredstvazaprosenofest, sredstvazaprosenorazno, sredstvazaprosenoizjem, sredstvadrugijavniprem, sredstvadrugijavniponprem, sredstvadrugijavniponprej, sredstvadrugijavnigostujo, sredstvadrugijavniint, sredstvadrugijavnifest, sredstvadrugijavnirazno, sredstvadrugijavniizjem, sredstvadrugiviriprem, sredstvadrugiviriponprem, sredstvadrugiviriponprej, sredstvadrugivirigostujo, sredstvadrugiviriint, sredstvadrugivirifest, sredstvadrugivirirazno, sredstvadrugiviriizjem, sredstvaavtsamoz) FROM stdin;
00290000-55ee-a43b-3b4d-b345269ef47c	0001	Testni program dela	2016-02-01	2017-02-01	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 2959 (class 0 OID 17928431)
-- Dependencies: 230
-- Data for Name: programskaenotasklopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programskaenotasklopa (id, naslovpe, avtorpe, obsegpe, mesecpe, vrednostpe, programrazno_id) FROM stdin;
\.


--
-- TOC entry 2937 (class 0 OID 17928087)
-- Dependencies: 208
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, popa_id, naslov_id, sifra, naziv, jeprizorisce, seplanira, kapaciteta, opis) FROM stdin;
00220000-55ee-a43a-94ae-3c9b30403619	\N	\N	0001	Poskusna 1	f	t	8	Poskusna učilnica v prvem
00220000-55ee-a43a-0a90-9098952aa117	\N	\N	0002	Poskusna 3	f	f	34	Poskusna učilnica v tretjem
00220000-55ee-a43a-e4c3-1d0c49ec7b39	\N	\N	0003	Kazinska	t	t	84	Kazinska dvorana
00220000-55ee-a43a-6f4c-56e626dccff9	\N	\N	0004	Mali oder	t	t	24	Mali oder 
00220000-55ee-a43a-ce5e-c5495a78f786	\N	\N	0005	Komorni oder	t	t	15	Komorni oder
00220000-55ee-a43a-3a9c-75ca618b9d2f	\N	\N	0006	Stara dvorana	t	t	96	Stara dvorana ali dvorana Franceta Prešerna
00220000-55ee-a43a-add5-c22d6a6ef0c9	\N	\N	0007	Velika dvorana	t	t	160	Velika, glavna dvorana
\.


--
-- TOC entry 2929 (class 0 OID 17928031)
-- Dependencies: 200
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 2928 (class 0 OID 17928021)
-- Dependencies: 199
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 2949 (class 0 OID 17928223)
-- Dependencies: 220
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta, status) FROM stdin;
\.


--
-- TOC entry 2944 (class 0 OID 17928161)
-- Dependencies: 215
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 2903 (class 0 OID 17927729)
-- Dependencies: 174
-- Data for Name: revizije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY revizije (id, razred, objectid, upor, datum, tip, data) FROM stdin;
1	App\\Entity\\Popa	00080000-55ee-a43c-14a1-87578bd94593	00010000-55ee-a43a-da71-5e4352efbc88	2015-09-08 11:02:52	INS	a:0:{}
2	App\\Entity\\Option	00000000-55ee-a43c-a92b-e83f719ccf42	00010000-55ee-a43a-da71-5e4352efbc88	2015-09-08 11:02:52	INS	a:0:{}
3	ProgramDela\\Entity\\ProdukcijskaHisa	00190000-55ee-a43c-f772-fb9b5c2b74a6	00010000-55ee-a43a-da71-5e4352efbc88	2015-09-08 11:02:52	INS	a:0:{}
\.


--
-- TOC entry 2977 (class 0 OID 0)
-- Dependencies: 173
-- Name: revizije_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('revizije_id_seq', 3, true);


--
-- TOC entry 2938 (class 0 OID 17928100)
-- Dependencies: 209
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 2907 (class 0 OID 17927767)
-- Dependencies: 178
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-55ee-a439-22ab-69f3bde7b9bd	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-55ee-a439-413b-ba52fcc21032	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-55ee-a439-f871-ed7ff5fd04cb	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-55ee-a439-54e6-e6b44774115f	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-55ee-a43a-e873-c2fad0710403	planer	Planer dogodkov v koledarju	t
00020000-55ee-a43a-440d-2932ed109c06	kadrovska	Kadrovska služba	t
00020000-55ee-a43a-4730-34d1aaac506f	arhivar	Ažuriranje arhivalij	t
00020000-55ee-a43a-e75b-bff7843dbbf7	igralec	Igralec	t
00020000-55ee-a43a-b263-24496ce9fc8e	prisotnost	Vnašalec prisotnosti, tudi za tiste izven uprizoritev	t
00020000-55ee-a43b-0930-99d36658cb5c	vsadovoljenja	Vloga z vsemi posameznimi dovoljenji	t
\.


--
-- TOC entry 2905 (class 0 OID 17927751)
-- Dependencies: 176
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-55ee-a43a-f8cf-a1f7e107ae21	00020000-55ee-a439-f871-ed7ff5fd04cb
00010000-55ee-a43a-da71-5e4352efbc88	00020000-55ee-a439-f871-ed7ff5fd04cb
00010000-55ee-a43b-fb1c-03d8dc0e11fe	00020000-55ee-a43b-0930-99d36658cb5c
\.


--
-- TOC entry 2940 (class 0 OID 17928114)
-- Dependencies: 211
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 2932 (class 0 OID 17928052)
-- Dependencies: 203
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 2926 (class 0 OID 17927998)
-- Dependencies: 197
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, sifra, ime, zacetek, konec, aktivna) FROM stdin;
\.


--
-- TOC entry 2901 (class 0 OID 17927716)
-- Dependencies: 172
-- Data for Name: stevilcenje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenje (id, sifra, naziv, prefix, suffix, zacetek, dolzina, format, globalno, poletih) FROM stdin;
00230000-55ee-a439-9c60-4fe9071542dc	pri	Privzeto številčenje po letih YYYY-N	\N	\N	1	1	%l-%n	f	t
00230000-55ee-a439-3801-76e4479123ae	123	Privzeto številčenje kratkih šifer	\N	\N	100	3	%n	f	f
00230000-55ee-a439-095c-32f04fa5b5e1	bcd	Globalno številčenje črtnih kod	\N	\N	1	9	%n	t	f
00230000-55ee-a439-9365-a5561ee708fa	sif	Številčenje šifrant	\N	\N	1000	4	%n	f	f
00230000-55ee-a439-231d-9d8312bdbfff	tmp	Globalno številčenje začasnih številk	tmp	\N	1000	5	%l%n	t	t
\.


--
-- TOC entry 2900 (class 0 OID 17927708)
-- Dependencies: 171
-- Data for Name: stevilcenjekonfig; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjekonfig (id, stevilcenje_id, dok) FROM stdin;
00240000-55ee-a439-b397-694ad1394002	00230000-55ee-a439-9365-a5561ee708fa	popa
00240000-55ee-a439-dedf-4d08d28d1ccc	00230000-55ee-a439-9365-a5561ee708fa	oseba
00240000-55ee-a439-0e32-953a31f1f854	00230000-55ee-a439-9365-a5561ee708fa	sezona
00240000-55ee-a439-048b-0336705e0151	00230000-55ee-a439-3801-76e4479123ae	prostor
00240000-55ee-a439-cdb6-f8e1329f214a	00230000-55ee-a439-9365-a5561ee708fa	besedilo
00240000-55ee-a439-3d39-769040285698	00230000-55ee-a439-9365-a5561ee708fa	uprizoritev
00240000-55ee-a439-4e8f-cec37c1c97ed	00230000-55ee-a439-9365-a5561ee708fa	funkcija
00240000-55ee-a439-3aea-2184515ed363	00230000-55ee-a439-9365-a5561ee708fa	tipfunkcije
00240000-55ee-a439-4c17-859b5d9f7eee	00230000-55ee-a439-9365-a5561ee708fa	alternacija
00240000-55ee-a439-1bf7-983d91394253	00230000-55ee-a439-9c60-4fe9071542dc	pogodba
00240000-55ee-a439-b261-18c279f10540	00230000-55ee-a439-9365-a5561ee708fa	zaposlitev
00240000-55ee-a439-b07e-bf972f67e44c	00230000-55ee-a439-9365-a5561ee708fa	zvrstuprizoritve
00240000-55ee-a439-e0c0-8d50b24cc81f	00230000-55ee-a439-9c60-4fe9071542dc	programdela
00240000-55ee-a439-4f60-a28f42df02a4	00230000-55ee-a439-9365-a5561ee708fa	zapis
\.


--
-- TOC entry 2899 (class 0 OID 17927703)
-- Dependencies: 170
-- Data for Name: stevilcenjestanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjestanje (id, objid, leto, stevilka) FROM stdin;
a16f3bd0-d0bd-4d26-bea2-047bf0c2ae9e	00240000-55ee-a439-b397-694ad1394002	0	1001
\.


--
-- TOC entry 2945 (class 0 OID 17928171)
-- Dependencies: 216
-- Data for Name: strosekuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY strosekuprizoritve (id, uprizoritev_id, popa_id, naziv, vrednostdo, vrednostna, opis, tipstroska, sort, vrstastroska_id) FROM stdin;
00270000-55ee-a43b-7924-ee658a714982	000e0000-55ee-a43b-ccb1-a61ecc05364f	00080000-55ee-a43a-b4f9-125c8fd41166	Nabava kostumov	600.50	20.00	Krila in maske	materialni	1	003b0000-55ee-a439-f1d6-6378ff6eb423
00270000-55ee-a43b-126f-3de1a321d4a7	000e0000-55ee-a43b-ccb1-a61ecc05364f	00080000-55ee-a43a-b4f9-125c8fd41166	Zavese	125.70	3.10	Modra in zelena zavesa	materialni	2	003b0000-55ee-a439-f1d6-6378ff6eb423
00270000-55ee-a43b-d2d8-cdf92c87d051	000e0000-55ee-a43b-ccb1-a61ecc05364f	00080000-55ee-a43a-c083-567f2af725b1	Avtorske pravice	300.00	30.00	Odkup avtorskih pravic	avtorprav	4	\N
\.


--
-- TOC entry 2912 (class 0 OID 17927829)
-- Dependencies: 183
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 2927 (class 0 OID 17928008)
-- Dependencies: 198
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja) FROM stdin;
001a0000-55ee-a43b-ffba-edce738086b5	00180000-55ee-a43b-fcd1-cd717a8398ca	000c0000-55ee-a43b-ed80-ca2692f5d40b	00090000-55ee-a43b-86ed-d0302ce82988	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55ee-a43b-d6b4-edc0e02b3444	00180000-55ee-a43b-fcd1-cd717a8398ca	000c0000-55ee-a43b-7a8f-c45d5bb54843	00090000-55ee-a43b-1df2-5541dae698f5	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55ee-a43b-f5dd-210bdc0cb630	00180000-55ee-a43b-fcd1-cd717a8398ca	000c0000-55ee-a43b-8f9d-ac1d5b981bb1	00090000-55ee-a43b-ce08-2160cddd55c7	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55ee-a43b-ea1b-fc5ff54158fa	00180000-55ee-a43b-fcd1-cd717a8398ca	000c0000-55ee-a43b-c3b0-c98459643cda	00090000-55ee-a43b-08e0-440e59938e20	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55ee-a43b-1854-5d3f87e25ba6	00180000-55ee-a43b-fcd1-cd717a8398ca	000c0000-55ee-a43b-cdba-fab6868a7881	00090000-55ee-a43b-ecc4-560aaaacb293	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55ee-a43b-de12-eca03251280e	00180000-55ee-a43b-0b35-8f44d3118288	\N	00090000-55ee-a43b-ecc4-560aaaacb293	2015-08-01 20:00:00	2015-08-01 23:00:00	\N	\N	2.00
\.


--
-- TOC entry 2948 (class 0 OID 17928211)
-- Dependencies: 219
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, sifra, ime, opis, imezenski, podrocje) FROM stdin;
000f0000-55ee-a439-1237-034ce8b3822c	01	Avtor	Avtorji	Avtorka	umetnik
000f0000-55ee-a439-f826-31cc398cd212	02	Priredba	Priredba	Priredba	umetnik
000f0000-55ee-a439-67ef-d3fe82cc0b5f	03	Prevod	Prevod	Prevod	umetnik
000f0000-55ee-a439-652e-72960b74fa16	04	Režija	Režija	Režija	umetnik
000f0000-55ee-a439-109d-bd1c40573082	05	Dramaturgija	Dramaturgija	Dramaturgija	umetnik
000f0000-55ee-a439-f056-1a58cf401ba9	06	Scenografija	Scenografija	Scenografija	umetnik
000f0000-55ee-a439-2214-ec05201b0f51	07	Kostumografija	Kostumografija	Kostumografija	umetnik
000f0000-55ee-a439-9cd7-fb5bf12d252b	08	Koreografija	Koreografija	Koreografija	umetnik
000f0000-55ee-a439-c41d-041ba8b01180	09	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	umetnik
000f0000-55ee-a439-052e-701064cd0b19	10	Oblikovanje maske	Oblikovanje maske	Oblikovanje maske	umetnik
000f0000-55ee-a439-c038-ae03a806f9bc	11	Lektorstvo	Lektorstvo	Lektorstvo	umetnik
000f0000-55ee-a439-e401-0e1f3534d26c	12	Glasbeni soustvarjalec	Glasbeni soustvarjalci	Glasbena soustvarjalka	umetnik
000f0000-55ee-a439-dca0-f97d0da15fe7	13	Intermedijski ustvarjalec	Intermedijski ustvarjalci	Intermedijski ustvarjalka	umetnik
000f0000-55ee-a439-592f-d5e4ef79bb3d	14	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	umetnik
000f0000-55ee-a439-f1d3-97d58cfac155	15	Vloga	Intermedijski ustvarjalci	Intermedijska ustvarjalka	igralec
000f0000-55ee-a439-ecfd-116dc2e64483	16	Produkcija, mentorstvo	Produkcija, mentorstvo	Produkcija, mentorstvo	umetnik
000f0000-55ee-a439-c4f8-dc65cf80cafb	17	Tehnična podpora	Tehnična podpora	Tehnična podpora	tehnik
000f0000-55ee-a439-561b-5af597356f86	18	Inšpicient	Inšpicienti	Inšpicientka	inspicient
\.


--
-- TOC entry 2960 (class 0 OID 17928441)
-- Dependencies: 231
-- Data for Name: tipprogramskeenote; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipprogramskeenote (id, sifra, naziv, koprodukcija, maxfaktor, maxvsi) FROM stdin;
002b0000-55ee-a439-95a4-2e7d6f72cec3	01	Velika predstava	f	1.00	1.00
002b0000-55ee-a439-5434-6e48ba439976	02	Mala predstava	f	0.50	0.50
002b0000-55ee-a439-b6aa-d9fca8f46882	03	Mala koprodukcija	t	0.40	1.00
002b0000-55ee-a439-c823-da38ec0d9496	04	Srednja koprodukcija	t	0.70	2.00
002b0000-55ee-a439-38a2-60ad6946972a	05	Velika koprodukcija	t	1.00	3.00
\.


--
-- TOC entry 2917 (class 0 OID 17927891)
-- Dependencies: 188
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 2904 (class 0 OID 17927738)
-- Dependencies: 175
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-55ee-a43a-da71-5e4352efbc88	Konzolni	$2y$05$NS4xMjkyMTcwMzExMjAxROuangZi1KErrY10XpEANkUmL54VmeUzS	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-55ee-a43b-e363-61f9ac3ac979	testni uporabnik za inšpicienta	$2y$05$NS4xMjkyMTcwMzExMjAxROxkJ1B6xAXex6EZLIwJfWzRJ8DpfecFO	t	\N	\N	\N	ivo@ifigenija.si	\N	\N	\N
00010000-55ee-a43b-0520-afd53e6b2bc8	testni uporabnik za Tehničnega vodjo	$2y$05$NS4xMjkyMTcwMzExMjAxROu/kXWR9sP9oamkesKuxXLbxkCb387.G	t	\N	\N	\N	tona@ifigenija.si	\N	\N	\N
00010000-55ee-a43b-475e-e8e374398a5a	testni uporabnik za igralca	$2y$05$NS4xMjkyMTcwMzExMjAxRO/hLCgClfERRsfCAFYwxNCcFIVjP2982	t	\N	\N	\N	irena@ifigenija.si	\N	\N	\N
00010000-55ee-a43b-30ca-33fa5b526e4b	testni uporabnik vnašalca termina storitev (TerminStoritve-vse)	$2y$05$NS4xMjkyMTcwMzExMjAxROT6.kTHqEq4.wa2SOnf124/N14m9qeP.	t	\N	\N	\N	tatjana@ifigenija.si	\N	\N	\N
00010000-55ee-a43b-418d-c22e5ec42ec7	testni uporabnik, ki je inšpicient brez zapisov v TerminStoritve	$2y$05$NS4xMjkyMTcwMzExMjAxROHau47Dtb7CME5.nlWwBVM.nusFP.ra2	t	\N	\N	\N	joze@ifigenija.si	\N	\N	\N
00010000-55ee-a43b-91f6-5683665b5066	testna uporabnica, ki je planerka	$2y$05$NS4xMjkyMTcwMzExMjAxRO.B/uJO3C7QRNhdX9Q2hTLQsSupj1V1S	t	\N	\N	\N	petra@ifigenija.si	\N	\N	\N
00010000-55ee-a43b-e400-1b824853be8e	testni uporabnik, ki dobi ifi-all vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROv2d7jqhaV/Mz3EIsKoi7UoFR.SDSMBm	t	\N	\N	\N	ali@ifigenija.si	\N	\N	\N
00010000-55ee-a43b-242b-e932844c339e	testni uporabnik, ki dobi ifi-readall vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROYB9g.gnkufr1l/gWK6mkx.ySqrOWnJC	t	\N	\N	\N	berta@ifigenija.si	\N	\N	\N
00010000-55ee-a43b-276b-cd918a04eb15	testni uporabnik, ki dobi aaa-write dovoljenje	$2y$05$NS4xMjkyMTcwMzExMjAxRORujYObKX.DzpXVYbePkiJkHqg0/Ylya	t	\N	\N	\N	aaron@ifigenija.si	\N	\N	\N
00010000-55ee-a43b-fb1c-03d8dc0e11fe	testni uporabnik ki dobi vsa posamezna dovoljenja	$2y$05$NS4xMjkyMTcwMzExMjAxRO2ymwxVXTr7U4Ncdn.bN49E8rLw9Jg0O	t	\N	\N	\N	vesna@ifigenija.si	\N	\N	\N
00010000-55ee-a43a-f8cf-a1f7e107ae21	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 2952 (class 0 OID 17928260)
-- Dependencies: 223
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, producent_id, sifra, faza, naslov, podnaslov, delovninaslov, internacionalninaslov, naslovizvirnika, podnaslovizvirnika, datumzacstudija, stevilovaj, planiranostevilovaj, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, krstna, prvaslovenska, kratkinaslov, maticnioder_id) FROM stdin;
000e0000-55ee-a43b-ea86-9b0b966d5094	00160000-55ee-a43a-12d9-98110408992d	\N	00140000-55ee-a439-1bf8-9b289c8bc746	\N	0001	produkcija	Sen kresne noči		Sanje	\N	\N	\N	2016-02-01	\N	\N	2016-06-01	1	William Shakespeare	f	2				\N	f	\N	\N		00220000-55ee-a43a-ce5e-c5495a78f786
000e0000-55ee-a43b-ccb1-a61ecc05364f	00160000-55ee-a43a-9379-656a11155e15	\N	00140000-55ee-a439-3e59-1c487dcd415c	\N	0002	predprodukcija-ideja	Smoletov vrt			\N	\N	\N	2016-01-01	\N	\N	2016-04-20	2	B. Hočevar	f	2				\N	f	\N	\N		00220000-55ee-a43a-3a9c-75ca618b9d2f
000e0000-55ee-a43b-640c-c3697800f0f3	\N	\N	00140000-55ee-a439-3e59-1c487dcd415c	00190000-55ee-a43b-6229-76d1f38c9362	0003	postprodukcija	Kisli maček			\N	\N	\N	2016-02-01	\N	\N	2016-04-20	2	Caryl Churchill	t	2				\N	f	\N	\N		00220000-55ee-a43a-ce5e-c5495a78f786
000e0000-55ee-a43b-2355-fad259cce124	\N	\N	00140000-55ee-a439-3e59-1c487dcd415c	00190000-55ee-a43b-6229-76d1f38c9362	0004	postprodukcija	Vladimir			\N	\N	\N	2017-03-01	\N	\N	2017-04-20	2	Matjaž Zupančič	t	2				\N	f	\N	\N		00220000-55ee-a43a-ce5e-c5495a78f786
000e0000-55ee-a43b-c4b0-08bb5b344ed2	\N	\N	00140000-55ee-a439-3e59-1c487dcd415c	00190000-55ee-a43b-6229-76d1f38c9362	0005	postprodukcija	Španska princesa			\N	\N	\N	2017-04-01	\N	\N	2017-05-20	1	Nina Kokelj	f	1				\N	f	\N	\N		00220000-55ee-a43a-94ae-3c9b30403619
000e0000-55ee-a43b-a026-30ae121f89fb	\N	\N	00140000-55ee-a439-3e59-1c487dcd415c	00190000-55ee-a43b-6229-76d1f38c9362	0006	postprodukcija	Ne vemo datumov			\N	\N	\N	\N	\N	\N	\N	1	Nandi Frafar	f	1				\N	f	\N	\N		00220000-55ee-a43a-94ae-3c9b30403619
\.


--
-- TOC entry 2922 (class 0 OID 17927952)
-- Dependencies: 193
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, uprizoritev_id, vrsta, zaporedna, porocilo) FROM stdin;
00200000-55ee-a43b-958e-9db6b9a20b92	000e0000-55ee-a43b-ccb1-a61ecc05364f	\N	1	
00200000-55ee-a43b-42fb-f6df37b25656	000e0000-55ee-a43b-ccb1-a61ecc05364f	\N	2	
\.


--
-- TOC entry 2936 (class 0 OID 17928079)
-- Dependencies: 207
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 2946 (class 0 OID 17928185)
-- Dependencies: 217
-- Data for Name: vrstastroska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstastroska (id, skupina, podskupina, naziv, opis) FROM stdin;
003b0000-55ee-a439-0ce7-f30106ee4dd4	1	0	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE
003b0000-55ee-a439-7f7d-87e5c1eead39	1	1	Storitve varovanja zgradb in prostorov	storitve varovanja zgradb in prostorov (npr. gasilci na predstavah)
003b0000-55ee-a439-f616-f001e57d062b	1	2	Založniške in tiskarske storitve	založniške in tiskarske storitve
003b0000-55ee-a439-0f3e-b6f3797d9df4	1	3	Časopisi, revije, knjige in strokovna literatura	časopisi, revije, knjige in strokovna literatura
003b0000-55ee-a439-919d-1a526cbf06b6	1	4	Stroški prevajalskih storitev	stroški prevajalskih storitev
003b0000-55ee-a439-5226-47804e930325	1	5	Stroški oglaševalskih storitev	stroški oglaševalskih storitev
003b0000-55ee-a439-7085-6656464be2cd	1	6	Izdatki za reprezentanco	izdatki za reprezentanco
003b0000-55ee-a439-7292-3f6dbae091fc	2	0	POSEBNI MATERIAL IN STORITVE	POSEBNI MATERIAL IN STORITVE
003b0000-55ee-a439-f1d6-6378ff6eb423	2	1	Drugi posebni material in storitve	drugi posebni material in storitve (npr. za instrumete - navedite)
003b0000-55ee-a439-233f-b22b2389fc70	2	2	Oprema predstave – stroški rekvizitov	Oprema predstave – stroški rekvizitov
003b0000-55ee-a439-59ee-bec8108966b6	2	3	Oprema predstave – stroški kostumov	Oprema predstave – stroški kostumov
003b0000-55ee-a439-fb0e-0084f026e936	2	4	Oprema predstave – stroški scenske opreme	Oprema predstave – stroški scenske opreme
003b0000-55ee-a439-934c-42023828fadc	2	5	Oprema predstave – stroški avdio in video opreme	Oprema predstave – stroški avdio in video opreme
003b0000-55ee-a439-b8a4-9f0150ec7ba7	3	0	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE
003b0000-55ee-a439-30dc-5f64c3da6442	3	1	Poštnina in kurirske storitve	poštnina in kurirske storitve
003b0000-55ee-a439-51a4-dd6f5febbd48	4	0	PREVOZNI STROŠKI IN STORITVE	PREVOZNI STROŠKI IN STORITVE
003b0000-55ee-a439-a413-e46ab6b6c6dc	4	1	Goriva in maziva za prevozna sredstva	goriva in maziva za prevozna sredstva
003b0000-55ee-a439-94e7-c942bd181c2a	4	2	Najem vozil in selitveni stroški	najem vozil in selitveni stroški
003b0000-55ee-a439-4e3d-d76e0c195690	4	3	Drugi prevozni in transportni stroški 	drugi prevozni in transportni stroški (navedite)
003b0000-55ee-a439-0efa-3a9d7bd7c975	5	0	IZDATKI ZA SLUŽBENA POTOVANJA	IZDATKI ZA SLUŽBENA POTOVANJA
003b0000-55ee-a439-dd74-e7775da125ab	5	1	Dnevnice za službena potovanja v državi in tujini	dnevnice za službena potovanja v državi in tujini
003b0000-55ee-a439-7ab7-fb046ab1df30	5	2	Hotelske in restavra. storitve v državi in tujini	hotelske in restavra. storitve v državi in tujini
003b0000-55ee-a439-dc8c-0057cdaf0898	5	3	Stroški prevoza v državi in tujini	stroški prevoza v državi in tujini
003b0000-55ee-a439-a1a8-bfa8dc61906b	5	4	Drugi izdatki za službena potovanja	drugi izdatki za službena potovanja (navedite)
003b0000-55ee-a439-faf4-c9588cf61a94	6	0	NAJEMNINE IN ZAKUPNINE	NAJEMNINE IN ZAKUPNINE
003b0000-55ee-a439-fcf9-684bfa6f0051	6	1	Druge najemnine, zakupnine in licenčnine	druge najemnine, zakupnine in licenčnine (npr. najem notnega materiala, instrumentov - navedite)
003b0000-55ee-a439-ae12-884a1990d3d5	7	0	DRUGI OPERATIVNI ODHODKI	DRUGI OPERATIVNI ODHODKI
003b0000-55ee-a439-5ca9-38252b7804c4	7	1	Izdatki za strok. izobraževanje zap.	izdatki za strok. izobraževanje zap.(vezani na program. enote)  
\.


--
-- TOC entry 2963 (class 0 OID 17928487)
-- Dependencies: 234
-- Data for Name: vrstazapisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstazapisa (id, oznaka, naziv, aktiven, znacka, ikona, upor, datknj) FROM stdin;
\.


--
-- TOC entry 2962 (class 0 OID 17928459)
-- Dependencies: 233
-- Data for Name: zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapis (id, vrsta_id, datoteka_id, mapa_id, avtor_id, zaklenil_id, tip, zaklenjen, datumzaklepanja, identifier, subject, title, description, coverage, creator, language, date, publisher, relation, rights, source, upor, datknj, standard, lokacija) FROM stdin;
\.


--
-- TOC entry 2964 (class 0 OID 17928499)
-- Dependencies: 235
-- Data for Name: zapislastnik; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapislastnik (id, zapis_id, lastnik, classlastnika, datum, upor, datknj) FROM stdin;
\.


--
-- TOC entry 2943 (class 0 OID 17928151)
-- Dependencies: 214
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, sifra, status, delovnomesto, zacetek, konec, tip, delovnaobveza, malica, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci) FROM stdin;
00100000-55ee-a43b-d2c7-552591ae7f51	00090000-55ee-a43b-1df2-5541dae698f5	01	A	Mojster	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55ee-a43b-6388-f0bd6cf35521	00090000-55ee-a43b-ce08-2160cddd55c7	02	A	Igralec	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55ee-a43b-5a51-af881c4a5918	00090000-55ee-a43b-2883-1efa6ae779dd	03	A	Natakar	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55ee-a43b-a5f0-a823f5314d68	00090000-55ee-a43b-f03c-d6e235c7ca03	04	A	Mizar	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55ee-a43b-47bb-d391965dfb1a	00090000-55ee-a43b-86ed-d0302ce82988	05	A	Šivilja	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55ee-a43b-ee98-130cfbd6a28e	00090000-55ee-a43b-3203-350582406328	06	A	Inšpicient	2010-02-01	2010-02-01	1	2		t	f	f	t
\.


--
-- TOC entry 2924 (class 0 OID 17927988)
-- Dependencies: 195
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id) FROM stdin;
\.


--
-- TOC entry 2951 (class 0 OID 17928250)
-- Dependencies: 222
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, sifra, naziv, opis) FROM stdin;
00140000-55ee-a439-1bf8-9b289c8bc746	01	Drama	drama (SURS 01)
00140000-55ee-a439-a563-d093f8280ad7	02	Opera	opera (SURS 02)
00140000-55ee-a439-4868-14f4c33d0615	03	Balet	balet (SURS 03)
00140000-55ee-a439-66fb-9ad8674bf604	04	Plesne prireditve	plesne prireditve (SURS 04)
00140000-55ee-a439-810d-e9e7905be05e	05	Lutkovno gledališče	lutkovno gledališče (SURS 05)
00140000-55ee-a439-3e59-1c487dcd415c	06	Raziskovalno gledališče	raziskovalno gledališče (SURS 06)
00140000-55ee-a439-9dd3-0971e8578e14	07	Drugo	drugo (SURS 07)
\.


--
-- TOC entry 2942 (class 0 OID 17928141)
-- Dependencies: 213
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, sifra, naziv, opis) FROM stdin;
\.


--
-- TOC entry 2457 (class 2606 OID 17927792)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2634 (class 2606 OID 17928309)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2630 (class 2606 OID 17928299)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2605 (class 2606 OID 17928210)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2687 (class 2606 OID 17928539)
-- Name: datoteka_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT datoteka_pkey PRIMARY KEY (id);


--
-- TOC entry 2511 (class 2606 OID 17927977)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2525 (class 2606 OID 17927997)
-- Name: dogodeksplosni_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodeksplosni
    ADD CONSTRAINT dogodeksplosni_pkey PRIMARY KEY (id);


--
-- TOC entry 2663 (class 2606 OID 17928457)
-- Name: drugivir_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT drugivir_pkey PRIMARY KEY (id);


--
-- TOC entry 2491 (class 2606 OID 17927917)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2641 (class 2606 OID 17928364)
-- Name: enotaprograma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT enotaprograma_pkey PRIMARY KEY (id);


--
-- TOC entry 2583 (class 2606 OID 17928137)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2505 (class 2606 OID 17927950)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2499 (class 2606 OID 17927931)
-- Name: kontaktnaoseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT kontaktnaoseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2547 (class 2606 OID 17928044)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2681 (class 2606 OID 17928516)
-- Name: mapa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT mapa_pkey PRIMARY KEY (id);


--
-- TOC entry 2685 (class 2606 OID 17928523)
-- Name: mapa_zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT mapa_zapis_pkey PRIMARY KEY (mapa_id, zapis_id);


--
-- TOC entry 2692 (class 2606 OID 17928547)
-- Name: mapaacl_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT mapaacl_pkey PRIMARY KEY (id);


--
-- TOC entry 2559 (class 2606 OID 17928071)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2484 (class 2606 OID 17927889)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2461 (class 2606 OID 17927801)
-- Name: optionvalue_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT optionvalue_pkey PRIMARY KEY (id);


--
-- TOC entry 2464 (class 2606 OID 17927825)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2455 (class 2606 OID 17927781)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2448 (class 2606 OID 17927766)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2562 (class 2606 OID 17928077)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2576 (class 2606 OID 17928113)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2616 (class 2606 OID 17928245)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2473 (class 2606 OID 17927853)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2481 (class 2606 OID 17927877)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2551 (class 2606 OID 17928050)
-- Name: postavkaracuna_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT postavkaracuna_pkey PRIMARY KEY (id);


--
-- TOC entry 2479 (class 2606 OID 17927867)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2503 (class 2606 OID 17927938)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2557 (class 2606 OID 17928062)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2652 (class 2606 OID 17928420)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2654 (class 2606 OID 17928428)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2648 (class 2606 OID 17928412)
-- Name: programdela_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT programdela_pkey PRIMARY KEY (id);


--
-- TOC entry 2659 (class 2606 OID 17928439)
-- Name: programskaenotasklopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT programskaenotasklopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2569 (class 2606 OID 17928095)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2545 (class 2606 OID 17928035)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2539 (class 2606 OID 17928026)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2611 (class 2606 OID 17928233)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2596 (class 2606 OID 17928168)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2440 (class 2606 OID 17927737)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2574 (class 2606 OID 17928104)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2446 (class 2606 OID 17927755)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2450 (class 2606 OID 17927775)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2581 (class 2606 OID 17928122)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2553 (class 2606 OID 17928057)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2527 (class 2606 OID 17928006)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2437 (class 2606 OID 17927725)
-- Name: stevilcenje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenje
    ADD CONSTRAINT stevilcenje_pkey PRIMARY KEY (id);


--
-- TOC entry 2434 (class 2606 OID 17927713)
-- Name: stevilcenjekonfig_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT stevilcenjekonfig_pkey PRIMARY KEY (id);


--
-- TOC entry 2431 (class 2606 OID 17927707)
-- Name: stevilcenjestanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjestanje
    ADD CONSTRAINT stevilcenjestanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2601 (class 2606 OID 17928181)
-- Name: strosekuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT strosekuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2470 (class 2606 OID 17927834)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2533 (class 2606 OID 17928017)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2607 (class 2606 OID 17928220)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2661 (class 2606 OID 17928451)
-- Name: tipprogramskeenote_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipprogramskeenote
    ADD CONSTRAINT tipprogramskeenote_pkey PRIMARY KEY (id);


--
-- TOC entry 2489 (class 2606 OID 17927902)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2442 (class 2606 OID 17927750)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2628 (class 2606 OID 17928278)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2509 (class 2606 OID 17927960)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2565 (class 2606 OID 17928085)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2603 (class 2606 OID 17928193)
-- Name: vrstastroska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstastroska
    ADD CONSTRAINT vrstastroska_pkey PRIMARY KEY (id);


--
-- TOC entry 2674 (class 2606 OID 17928497)
-- Name: vrstazapisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstazapisa
    ADD CONSTRAINT vrstazapisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2671 (class 2606 OID 17928481)
-- Name: zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT zapis_pkey PRIMARY KEY (id);


--
-- TOC entry 2677 (class 2606 OID 17928505)
-- Name: zapislastnik_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT zapislastnik_pkey PRIMARY KEY (id);


--
-- TOC entry 2592 (class 2606 OID 17928159)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2523 (class 2606 OID 17927992)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2620 (class 2606 OID 17928258)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2589 (class 2606 OID 17928149)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2512 (class 1259 OID 17927986)
-- Name: dogodki_konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_konec ON dogodek USING btree (konec);


--
-- TOC entry 2513 (class 1259 OID 17927987)
-- Name: dogodki_razred; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_razred ON dogodek USING btree (razred);


--
-- TOC entry 2514 (class 1259 OID 17927985)
-- Name: dogodki_zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2515 (class 1259 OID 17927984)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2597 (class 1259 OID 17928182)
-- Name: idx_11ffe6e05c75296c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e05c75296c ON strosekuprizoritve USING btree (vrstastroska_id);


--
-- TOC entry 2598 (class 1259 OID 17928183)
-- Name: idx_11ffe6e062b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e062b4ffca ON strosekuprizoritve USING btree (uprizoritev_id);


--
-- TOC entry 2599 (class 1259 OID 17928184)
-- Name: idx_11ffe6e06beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e06beede51 ON strosekuprizoritve USING btree (popa_id);


--
-- TOC entry 2678 (class 1259 OID 17928518)
-- Name: idx_14a5d6d3727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d3727aca70 ON mapa USING btree (parent_id);


--
-- TOC entry 2679 (class 1259 OID 17928517)
-- Name: idx_14a5d6d38a4a6c12; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d38a4a6c12 ON mapa USING btree (lastnik_id);


--
-- TOC entry 2471 (class 1259 OID 17927855)
-- Name: idx_1c7adba5ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba5ee4b985a ON popa USING btree (drzava_id);


--
-- TOC entry 2560 (class 1259 OID 17928078)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2665 (class 1259 OID 17928485)
-- Name: idx_1ed92829253c4123; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829253c4123 ON zapis USING btree (avtor_id);


--
-- TOC entry 2666 (class 1259 OID 17928484)
-- Name: idx_1ed9282957ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282957ed422f ON zapis USING btree (mapa_id);


--
-- TOC entry 2667 (class 1259 OID 17928486)
-- Name: idx_1ed9282987ff3295; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282987ff3295 ON zapis USING btree (zaklenil_id);


--
-- TOC entry 2668 (class 1259 OID 17928483)
-- Name: idx_1ed92829a54dbb1f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829a54dbb1f ON zapis USING btree (datoteka_id);


--
-- TOC entry 2669 (class 1259 OID 17928482)
-- Name: idx_1ed92829ef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829ef943358 ON zapis USING btree (vrsta_id);


--
-- TOC entry 2554 (class 1259 OID 17928064)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2555 (class 1259 OID 17928063)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2507 (class 1259 OID 17927961)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2584 (class 1259 OID 17928138)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2585 (class 1259 OID 17928140)
-- Name: idx_23aeb9586b361365; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9586b361365 ON funkcija USING btree (tipfunkcije_id);


--
-- TOC entry 2586 (class 1259 OID 17928139)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2496 (class 1259 OID 17927933)
-- Name: idx_2942b10710389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b10710389148 ON kontaktnaoseba USING btree (oseba_id);


--
-- TOC entry 2497 (class 1259 OID 17927932)
-- Name: idx_2942b1076beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b1076beede51 ON kontaktnaoseba USING btree (popa_id);


--
-- TOC entry 2657 (class 1259 OID 17928440)
-- Name: idx_2d901816d6bc69d6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2d901816d6bc69d6 ON programskaenotasklopa USING btree (programrazno_id);


--
-- TOC entry 2612 (class 1259 OID 17928247)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2613 (class 1259 OID 17928248)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2614 (class 1259 OID 17928249)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2675 (class 1259 OID 17928506)
-- Name: idx_2eaff9dcaf91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2eaff9dcaf91ecd ON zapislastnik USING btree (zapis_id);


--
-- TOC entry 2621 (class 1259 OID 17928283)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2622 (class 1259 OID 17928280)
-- Name: idx_344a77a7c3b0d59; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a7c3b0d59 ON uprizoritev USING btree (maticnioder_id);


--
-- TOC entry 2623 (class 1259 OID 17928284)
-- Name: idx_344a77a853a965c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a853a965c ON uprizoritev USING btree (producent_id);


--
-- TOC entry 2624 (class 1259 OID 17928282)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2625 (class 1259 OID 17928281)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2486 (class 1259 OID 17927904)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2487 (class 1259 OID 17927903)
-- Name: idx_37f6541a6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a6beede51 ON trr USING btree (popa_id);


--
-- TOC entry 2462 (class 1259 OID 17927828)
-- Name: idx_466966d769e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_466966d769e8d4 ON oseba USING btree (naslov_id);


--
-- TOC entry 2572 (class 1259 OID 17928105)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2452 (class 1259 OID 17927782)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2453 (class 1259 OID 17927783)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2577 (class 1259 OID 17928125)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2578 (class 1259 OID 17928124)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2579 (class 1259 OID 17928123)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2500 (class 1259 OID 17927939)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2501 (class 1259 OID 17927940)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2432 (class 1259 OID 17927715)
-- Name: idx_6054e804ff55f926; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_6054e804ff55f926 ON stevilcenjekonfig USING btree (stevilcenje_id);


--
-- TOC entry 2534 (class 1259 OID 17928030)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2535 (class 1259 OID 17928028)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2536 (class 1259 OID 17928027)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2537 (class 1259 OID 17928029)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2443 (class 1259 OID 17927756)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2444 (class 1259 OID 17927757)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2563 (class 1259 OID 17928086)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2688 (class 1259 OID 17928540)
-- Name: idx_781826c67e3c61f9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_781826c67e3c61f9 ON datoteka USING btree (owner_id);


--
-- TOC entry 2689 (class 1259 OID 17928548)
-- Name: idx_7adc957157ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc957157ed422f ON mapaacl USING btree (mapa_id);


--
-- TOC entry 2690 (class 1259 OID 17928549)
-- Name: idx_7adc9571fa6311ef; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc9571fa6311ef ON mapaacl USING btree (perm_id);


--
-- TOC entry 2549 (class 1259 OID 17928051)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2593 (class 1259 OID 17928169)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2594 (class 1259 OID 17928170)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2642 (class 1259 OID 17928369)
-- Name: idx_8787a0e54ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e54ae1cd1c ON enotaprograma USING btree (gostitelj_id);


--
-- TOC entry 2643 (class 1259 OID 17928368)
-- Name: idx_8787a0e55d0da56c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e55d0da56c ON enotaprograma USING btree (drzavagostovanja_id);


--
-- TOC entry 2644 (class 1259 OID 17928365)
-- Name: idx_8787a0e562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e562b4ffca ON enotaprograma USING btree (uprizoritev_id);


--
-- TOC entry 2645 (class 1259 OID 17928366)
-- Name: idx_8787a0e57222d84b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e57222d84b ON enotaprograma USING btree (tipprogramskeenote_id);


--
-- TOC entry 2646 (class 1259 OID 17928367)
-- Name: idx_8787a0e5771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e5771ec7bd ON enotaprograma USING btree (program_dela_id);


--
-- TOC entry 2475 (class 1259 OID 17927869)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2476 (class 1259 OID 17927868)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2477 (class 1259 OID 17927870)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2566 (class 1259 OID 17928099)
-- Name: idx_952dd21969e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd21969e8d4 ON prostor USING btree (naslov_id);


--
-- TOC entry 2567 (class 1259 OID 17928098)
-- Name: idx_952dd2196beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd2196beede51 ON prostor USING btree (popa_id);


--
-- TOC entry 2649 (class 1259 OID 17928421)
-- Name: idx_97af082e38c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e38c06eb ON produkcijadelitev USING btree (enotaprograma_id);


--
-- TOC entry 2650 (class 1259 OID 17928422)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2635 (class 1259 OID 17928313)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2636 (class 1259 OID 17928314)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2637 (class 1259 OID 17928311)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2638 (class 1259 OID 17928312)
-- Name: idx_a4b7244fa4976613; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fa4976613 ON alternacija USING btree (zaposlitev_id);


--
-- TOC entry 2590 (class 1259 OID 17928160)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2540 (class 1259 OID 17928039)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2541 (class 1259 OID 17928038)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2542 (class 1259 OID 17928036)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2543 (class 1259 OID 17928037)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2631 (class 1259 OID 17928301)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2632 (class 1259 OID 17928300)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2506 (class 1259 OID 17927951)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2664 (class 1259 OID 17928458)
-- Name: idx_e7d4cf2638c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e7d4cf2638c06eb ON drugivir USING btree (enotaprograma_id);


--
-- TOC entry 2682 (class 1259 OID 17928524)
-- Name: idx_e9f8ee8257ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee8257ed422f ON mapa_zapis USING btree (mapa_id);


--
-- TOC entry 2683 (class 1259 OID 17928525)
-- Name: idx_e9f8ee82af91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee82af91ecd ON mapa_zapis USING btree (zapis_id);


--
-- TOC entry 2458 (class 1259 OID 17927803)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2459 (class 1259 OID 17927802)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2467 (class 1259 OID 17927835)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2468 (class 1259 OID 17927836)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2529 (class 1259 OID 17928020)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2530 (class 1259 OID 17928019)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2531 (class 1259 OID 17928018)
-- Name: idx_fef7d84ba81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84ba81ccef6 ON terminstoritve USING btree (dogodek_id);


--
-- TOC entry 2516 (class 1259 OID 17927979)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2517 (class 1259 OID 17927980)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2518 (class 1259 OID 17927978)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2519 (class 1259 OID 17927982)
-- Name: uniq_11e93b5dbbc7a989; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dbbc7a989 ON dogodek USING btree (dogodek_splosni_id);


--
-- TOC entry 2520 (class 1259 OID 17927983)
-- Name: uniq_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2521 (class 1259 OID 17927981)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2474 (class 1259 OID 17927854)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2492 (class 1259 OID 17927918)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2493 (class 1259 OID 17927920)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2494 (class 1259 OID 17927919)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2495 (class 1259 OID 17927921)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2548 (class 1259 OID 17928045)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2617 (class 1259 OID 17928246)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2626 (class 1259 OID 17928279)
-- Name: uniq_344a77a559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_344a77a559828a3 ON uprizoritev USING btree (sifra);


--
-- TOC entry 2608 (class 1259 OID 17928221)
-- Name: uniq_3f50510d559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d559828a3 ON tipfunkcije USING btree (sifra);


--
-- TOC entry 2609 (class 1259 OID 17928222)
-- Name: uniq_3f50510d55cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d55cca980 ON tipfunkcije USING btree (ime);


--
-- TOC entry 2465 (class 1259 OID 17927826)
-- Name: uniq_466966d7559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7559828a3 ON oseba USING btree (sifra);


--
-- TOC entry 2466 (class 1259 OID 17927827)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2587 (class 1259 OID 17928150)
-- Name: uniq_5216fcb0559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5216fcb0559828a3 ON zvrstuprizoritve USING btree (sifra);


--
-- TOC entry 2438 (class 1259 OID 17927726)
-- Name: uniq_5a434fbc559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5a434fbc559828a3 ON stevilcenje USING btree (sifra);


--
-- TOC entry 2485 (class 1259 OID 17927890)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2435 (class 1259 OID 17927714)
-- Name: uniq_6054e804889a7556; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_6054e804889a7556 ON stevilcenjekonfig USING btree (dok);


--
-- TOC entry 2570 (class 1259 OID 17928097)
-- Name: uniq_952dd21937854736; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21937854736 ON prostor USING btree (naziv);


--
-- TOC entry 2571 (class 1259 OID 17928096)
-- Name: uniq_952dd219559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd219559828a3 ON prostor USING btree (sifra);


--
-- TOC entry 2639 (class 1259 OID 17928310)
-- Name: uniq_a4b7244f559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a4b7244f559828a3 ON alternacija USING btree (sifra);


--
-- TOC entry 2482 (class 1259 OID 17927878)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2618 (class 1259 OID 17928259)
-- Name: uniq_cede8e36559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_cede8e36559828a3 ON zvrstsurs USING btree (sifra);


--
-- TOC entry 2672 (class 1259 OID 17928498)
-- Name: uniq_de1c8aa1d55226c7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_de1c8aa1d55226c7 ON vrstazapisa USING btree (oznaka);


--
-- TOC entry 2655 (class 1259 OID 17928429)
-- Name: uniq_e6fc2028559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc2028559828a3 ON produkcijskahisa USING btree (sifra);


--
-- TOC entry 2656 (class 1259 OID 17928430)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2528 (class 1259 OID 17928007)
-- Name: uniq_ecc8f8c5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ecc8f8c5559828a3 ON sezona USING btree (sifra);


--
-- TOC entry 2451 (class 1259 OID 17927776)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2721 (class 2606 OID 17928670)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2720 (class 2606 OID 17928675)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2716 (class 2606 OID 17928695)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2722 (class 2606 OID 17928665)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2718 (class 2606 OID 17928685)
-- Name: fk_11e93b5dbbc7a989; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dbbc7a989 FOREIGN KEY (dogodek_splosni_id) REFERENCES dogodeksplosni(id);


--
-- TOC entry 2717 (class 2606 OID 17928690)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2719 (class 2606 OID 17928680)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2754 (class 2606 OID 17928845)
-- Name: fk_11ffe6e05c75296c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e05c75296c FOREIGN KEY (vrstastroska_id) REFERENCES vrstastroska(id);


--
-- TOC entry 2753 (class 2606 OID 17928850)
-- Name: fk_11ffe6e062b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e062b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2752 (class 2606 OID 17928855)
-- Name: fk_11ffe6e06beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e06beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2785 (class 2606 OID 17929015)
-- Name: fk_14a5d6d3727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d3727aca70 FOREIGN KEY (parent_id) REFERENCES mapa(id);


--
-- TOC entry 2786 (class 2606 OID 17929010)
-- Name: fk_14a5d6d38a4a6c12; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d38a4a6c12 FOREIGN KEY (lastnik_id) REFERENCES uporabniki(id);


--
-- TOC entry 2704 (class 2606 OID 17928605)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2738 (class 2606 OID 17928775)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2780 (class 2606 OID 17928995)
-- Name: fk_1ed92829253c4123; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829253c4123 FOREIGN KEY (avtor_id) REFERENCES uporabniki(id);


--
-- TOC entry 2781 (class 2606 OID 17928990)
-- Name: fk_1ed9282957ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282957ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2779 (class 2606 OID 17929000)
-- Name: fk_1ed9282987ff3295; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282987ff3295 FOREIGN KEY (zaklenil_id) REFERENCES uporabniki(id);


--
-- TOC entry 2782 (class 2606 OID 17928985)
-- Name: fk_1ed92829a54dbb1f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829a54dbb1f FOREIGN KEY (datoteka_id) REFERENCES datoteka(id);


--
-- TOC entry 2783 (class 2606 OID 17928980)
-- Name: fk_1ed92829ef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829ef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstazapisa(id);


--
-- TOC entry 2736 (class 2606 OID 17928770)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2737 (class 2606 OID 17928765)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2715 (class 2606 OID 17928660)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2748 (class 2606 OID 17928815)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2746 (class 2606 OID 17928825)
-- Name: fk_23aeb9586b361365; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9586b361365 FOREIGN KEY (tipfunkcije_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2747 (class 2606 OID 17928820)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2710 (class 2606 OID 17928640)
-- Name: fk_2942b10710389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b10710389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2711 (class 2606 OID 17928635)
-- Name: fk_2942b1076beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b1076beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2734 (class 2606 OID 17928755)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2777 (class 2606 OID 17928970)
-- Name: fk_2d901816d6bc69d6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT fk_2d901816d6bc69d6 FOREIGN KEY (programrazno_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2757 (class 2606 OID 17928860)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2756 (class 2606 OID 17928865)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2755 (class 2606 OID 17928870)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 2784 (class 2606 OID 17929005)
-- Name: fk_2eaff9dcaf91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT fk_2eaff9dcaf91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id);


--
-- TOC entry 2759 (class 2606 OID 17928890)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2762 (class 2606 OID 17928875)
-- Name: fk_344a77a7c3b0d59; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a7c3b0d59 FOREIGN KEY (maticnioder_id) REFERENCES prostor(id);


--
-- TOC entry 2758 (class 2606 OID 17928895)
-- Name: fk_344a77a853a965c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a853a965c FOREIGN KEY (producent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2760 (class 2606 OID 17928885)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2761 (class 2606 OID 17928880)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2708 (class 2606 OID 17928630)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2709 (class 2606 OID 17928625)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2700 (class 2606 OID 17928590)
-- Name: fk_466966d769e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d769e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2701 (class 2606 OID 17928585)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2742 (class 2606 OID 17928795)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2697 (class 2606 OID 17928565)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2696 (class 2606 OID 17928570)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2743 (class 2606 OID 17928810)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2744 (class 2606 OID 17928805)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2745 (class 2606 OID 17928800)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2713 (class 2606 OID 17928645)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2712 (class 2606 OID 17928650)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2693 (class 2606 OID 17928550)
-- Name: fk_6054e804ff55f926; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT fk_6054e804ff55f926 FOREIGN KEY (stevilcenje_id) REFERENCES stevilcenje(id);


--
-- TOC entry 2726 (class 2606 OID 17928730)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2728 (class 2606 OID 17928720)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2729 (class 2606 OID 17928715)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2727 (class 2606 OID 17928725)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2695 (class 2606 OID 17928555)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2694 (class 2606 OID 17928560)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2739 (class 2606 OID 17928780)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2789 (class 2606 OID 17929030)
-- Name: fk_781826c67e3c61f9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT fk_781826c67e3c61f9 FOREIGN KEY (owner_id) REFERENCES uporabniki(id);


--
-- TOC entry 2791 (class 2606 OID 17929035)
-- Name: fk_7adc957157ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc957157ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2790 (class 2606 OID 17929040)
-- Name: fk_7adc9571fa6311ef; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc9571fa6311ef FOREIGN KEY (perm_id) REFERENCES permission(id);


--
-- TOC entry 2735 (class 2606 OID 17928760)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2751 (class 2606 OID 17928835)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2750 (class 2606 OID 17928840)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2769 (class 2606 OID 17928950)
-- Name: fk_8787a0e54ae1cd1c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e54ae1cd1c FOREIGN KEY (gostitelj_id) REFERENCES popa(id);


--
-- TOC entry 2770 (class 2606 OID 17928945)
-- Name: fk_8787a0e55d0da56c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e55d0da56c FOREIGN KEY (drzavagostovanja_id) REFERENCES drza(id);


--
-- TOC entry 2773 (class 2606 OID 17928930)
-- Name: fk_8787a0e562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2772 (class 2606 OID 17928935)
-- Name: fk_8787a0e57222d84b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e57222d84b FOREIGN KEY (tipprogramskeenote_id) REFERENCES tipprogramskeenote(id);


--
-- TOC entry 2771 (class 2606 OID 17928940)
-- Name: fk_8787a0e5771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e5771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2706 (class 2606 OID 17928615)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2707 (class 2606 OID 17928610)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2705 (class 2606 OID 17928620)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2740 (class 2606 OID 17928790)
-- Name: fk_952dd21969e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd21969e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2741 (class 2606 OID 17928785)
-- Name: fk_952dd2196beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd2196beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2775 (class 2606 OID 17928955)
-- Name: fk_97af082e38c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e38c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2774 (class 2606 OID 17928960)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2766 (class 2606 OID 17928920)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2765 (class 2606 OID 17928925)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2768 (class 2606 OID 17928910)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 2767 (class 2606 OID 17928915)
-- Name: fk_a4b7244fa4976613; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fa4976613 FOREIGN KEY (zaposlitev_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2749 (class 2606 OID 17928830)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2730 (class 2606 OID 17928750)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2731 (class 2606 OID 17928745)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2733 (class 2606 OID 17928735)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2732 (class 2606 OID 17928740)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2763 (class 2606 OID 17928905)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2764 (class 2606 OID 17928900)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2714 (class 2606 OID 17928655)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2776 (class 2606 OID 17928965)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2778 (class 2606 OID 17928975)
-- Name: fk_e7d4cf2638c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT fk_e7d4cf2638c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2788 (class 2606 OID 17929020)
-- Name: fk_e9f8ee8257ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee8257ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id) ON DELETE CASCADE;


--
-- TOC entry 2787 (class 2606 OID 17929025)
-- Name: fk_e9f8ee82af91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee82af91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id) ON DELETE CASCADE;


--
-- TOC entry 2698 (class 2606 OID 17928580)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2699 (class 2606 OID 17928575)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2703 (class 2606 OID 17928595)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2702 (class 2606 OID 17928600)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2723 (class 2606 OID 17928710)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2724 (class 2606 OID 17928705)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2725 (class 2606 OID 17928700)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- Completed on 2015-09-08 11:02:53 CEST

--
-- PostgreSQL database dump complete
--

