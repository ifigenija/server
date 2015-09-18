--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.9
-- Dumped by pg_dump version 9.3.9
-- Started on 2015-09-18 09:59:05 CEST

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- TOC entry 242 (class 3079 OID 11789)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 3004 (class 0 OID 0)
-- Dependencies: 242
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_with_oids = false;

--
-- TOC entry 181 (class 1259 OID 19993212)
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
-- TOC entry 226 (class 1259 OID 19993735)
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
-- TOC entry 225 (class 1259 OID 19993718)
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
-- TOC entry 219 (class 1259 OID 19993626)
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
-- TOC entry 240 (class 1259 OID 19993974)
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
-- TOC entry 195 (class 1259 OID 19993393)
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
    allday boolean DEFAULT false,
    zacetek timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    konec timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    status character varying(4) DEFAULT NULL::character varying,
    razred character varying(4) DEFAULT NULL::character varying,
    termin character varying(255) DEFAULT NULL::character varying,
    title character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 197 (class 1259 OID 19993425)
-- Name: dogodeksplosni; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodeksplosni (
    id uuid NOT NULL
);


--
-- TOC entry 234 (class 1259 OID 19993900)
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
-- TOC entry 190 (class 1259 OID 19993333)
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
-- TOC entry 227 (class 1259 OID 19993748)
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
    prikoproducentu boolean,
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
-- TOC entry 213 (class 1259 OID 19993558)
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
-- TOC entry 193 (class 1259 OID 19993372)
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
-- TOC entry 191 (class 1259 OID 19993350)
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
-- TOC entry 202 (class 1259 OID 19993472)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 238 (class 1259 OID 19993955)
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
-- TOC entry 239 (class 1259 OID 19993967)
-- Name: mapa_zapis; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE mapa_zapis (
    mapa_id uuid NOT NULL,
    zapis_id uuid NOT NULL
);


--
-- TOC entry 241 (class 1259 OID 19993989)
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
-- TOC entry 170 (class 1259 OID 19946838)
-- Name: migrations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE migrations (
    version character varying(255) NOT NULL
);


--
-- TOC entry 206 (class 1259 OID 19993497)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 188 (class 1259 OID 19993307)
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
-- TOC entry 182 (class 1259 OID 19993221)
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
-- TOC entry 183 (class 1259 OID 19993232)
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
-- TOC entry 178 (class 1259 OID 19993186)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 180 (class 1259 OID 19993205)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 207 (class 1259 OID 19993504)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 211 (class 1259 OID 19993538)
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
-- TOC entry 222 (class 1259 OID 19993667)
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
-- TOC entry 185 (class 1259 OID 19993265)
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
-- TOC entry 187 (class 1259 OID 19993299)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 229 (class 1259 OID 19993846)
-- Name: postavkacdve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE postavkacdve (
    id uuid NOT NULL,
    skupina character varying(2) NOT NULL,
    podskupina integer,
    naziv character varying(255) DEFAULT NULL::character varying,
    vrpremiere numeric(15,2) DEFAULT NULL::numeric,
    vrponovitvepremier numeric(15,2) DEFAULT NULL::numeric,
    vrponovitveprejsnjih numeric(15,2) DEFAULT NULL::numeric,
    vrgostovanjazamejstvo numeric(15,2) DEFAULT NULL::numeric,
    vrfestivali numeric(15,2) DEFAULT NULL::numeric,
    vrgostovanjaint numeric(15,2) DEFAULT NULL::numeric,
    vrostalo numeric(15,2) DEFAULT NULL::numeric,
    programdela_id uuid
);


--
-- TOC entry 203 (class 1259 OID 19993478)
-- Name: postavkaracuna; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE postavkaracuna (
    id uuid NOT NULL,
    racun_id uuid
);


--
-- TOC entry 186 (class 1259 OID 19993284)
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
-- TOC entry 192 (class 1259 OID 19993362)
-- Name: predstava; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE predstava (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    gostovanje_id uuid,
    zaporedna integer,
    porocilo text
);


--
-- TOC entry 205 (class 1259 OID 19993490)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 230 (class 1259 OID 19993860)
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
-- TOC entry 231 (class 1259 OID 19993870)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    sifra character varying(4) NOT NULL,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 228 (class 1259 OID 19993803)
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
    stizvpremdoma integer,
    stizvpremkopr integer,
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
    stobiskpremdoma integer,
    stobiskpremkopr integer,
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
-- TOC entry 232 (class 1259 OID 19993878)
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
-- TOC entry 209 (class 1259 OID 19993519)
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
-- TOC entry 201 (class 1259 OID 19993463)
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
-- TOC entry 200 (class 1259 OID 19993453)
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
-- TOC entry 221 (class 1259 OID 19993656)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying,
    status character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 216 (class 1259 OID 19993593)
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
-- TOC entry 175 (class 1259 OID 19993157)
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
-- TOC entry 174 (class 1259 OID 19993155)
-- Name: revizije_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE revizije_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3005 (class 0 OID 0)
-- Dependencies: 174
-- Name: revizije_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE revizije_id_seq OWNED BY revizije.id;


--
-- TOC entry 210 (class 1259 OID 19993532)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 179 (class 1259 OID 19993195)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 177 (class 1259 OID 19993179)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 212 (class 1259 OID 19993546)
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
-- TOC entry 204 (class 1259 OID 19993484)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 198 (class 1259 OID 19993430)
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
-- TOC entry 173 (class 1259 OID 19993144)
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
-- TOC entry 172 (class 1259 OID 19993136)
-- Name: stevilcenjekonfig; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjekonfig (
    id uuid NOT NULL,
    stevilcenje_id uuid,
    dok character varying(100) DEFAULT NULL::character varying
);


--
-- TOC entry 171 (class 1259 OID 19993131)
-- Name: stevilcenjestanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjestanje (
    id uuid NOT NULL,
    objid uuid NOT NULL,
    leto integer NOT NULL,
    stevilka integer
);


--
-- TOC entry 217 (class 1259 OID 19993603)
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
-- TOC entry 184 (class 1259 OID 19993257)
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
-- TOC entry 199 (class 1259 OID 19993440)
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
-- TOC entry 220 (class 1259 OID 19993644)
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
-- TOC entry 233 (class 1259 OID 19993888)
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
-- TOC entry 189 (class 1259 OID 19993319)
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
-- TOC entry 176 (class 1259 OID 19993166)
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
-- TOC entry 224 (class 1259 OID 19993693)
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
-- TOC entry 194 (class 1259 OID 19993383)
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
-- TOC entry 208 (class 1259 OID 19993511)
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
-- TOC entry 218 (class 1259 OID 19993617)
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
-- TOC entry 236 (class 1259 OID 19993935)
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
-- TOC entry 235 (class 1259 OID 19993907)
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
-- TOC entry 237 (class 1259 OID 19993947)
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
-- TOC entry 215 (class 1259 OID 19993583)
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
-- TOC entry 196 (class 1259 OID 19993419)
-- Name: zasedenost; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zasedenost (
    id uuid NOT NULL,
    oseba_id uuid
);


--
-- TOC entry 223 (class 1259 OID 19993683)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 214 (class 1259 OID 19993573)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 2187 (class 2604 OID 19993160)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 2937 (class 0 OID 19993212)
-- Dependencies: 181
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
\.


--
-- TOC entry 2982 (class 0 OID 19993735)
-- Dependencies: 226
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, zaposlitev_id, oseba_id, pogodba_id, sifra, zaposlen, zacetek, konec, opomba, sort, privzeti, aktivna, imapogodbo, pomembna) FROM stdin;
000c0000-55fb-c448-8e52-52150c9e6e05	000d0000-55fb-c447-1074-85adc7ae4103	\N	00090000-55fb-c447-46c1-01b11a40358d	000b0000-55fb-c447-0e32-3504d4b08583	0001	f	\N	\N	\N	3	t	\N	t	t
000c0000-55fb-c448-b3a0-430393bb2af1	000d0000-55fb-c447-2eb2-5ea71e231ff3	00100000-55fb-c448-da2a-071ed5f25346	00090000-55fb-c447-c5db-f86508a7e980	\N	0002	t	2016-01-01	\N	\N	8	t	\N	f	f
000c0000-55fb-c448-87b7-ad3e08f74cdf	000d0000-55fb-c447-cd3d-c8ab1ef1f227	00100000-55fb-c448-5d3d-9aec759a99c8	00090000-55fb-c447-a305-f5e000b69592	\N	0003	t	\N	2015-09-18	\N	2	t	\N	f	f
000c0000-55fb-c448-8523-9f859f27eacc	000d0000-55fb-c447-30ec-9e586d12de5f	\N	00090000-55fb-c447-a833-8c67c15910c2	\N	0004	f	2016-01-01	2016-01-01	\N	26	t	\N	f	f
000c0000-55fb-c448-30dd-86291770fad6	000d0000-55fb-c447-9d98-1987daecebef	\N	00090000-55fb-c447-bb91-c549d26e1f85	\N	0005	f	2016-01-01	2016-01-01	\N	7	t	\N	f	f
000c0000-55fb-c448-e2df-6749128fdcda	000d0000-55fb-c447-ca9e-e0247feed826	\N	00090000-55fb-c447-e478-329d67eeb616	000b0000-55fb-c447-7ac3-fc9b81750709	0006	f	2016-01-01	2016-01-01	\N	1	t	\N	t	t
000c0000-55fb-c448-96a4-adc4570f642d	000d0000-55fb-c447-cb1f-c6638e5c0681	00100000-55fb-c448-8bad-f8bb06350291	00090000-55fb-c447-3c3a-f5c43179de76	\N	0007	t	2016-01-01	2016-01-01	\N	14	t	\N	f	t
000c0000-55fb-c448-6629-fd9a16d004a3	000d0000-55fb-c447-2178-2474a737a586	\N	00090000-55fb-c447-2138-4ec78d1e5f2f	000b0000-55fb-c447-0a83-e0a5024d8104	0008	f	2016-01-01	2016-01-01	\N	12	t	\N	t	t
000c0000-55fb-c448-5e8e-3ff07eda7a7f	000d0000-55fb-c447-cb1f-c6638e5c0681	00100000-55fb-c448-4939-c3310ca21b8a	00090000-55fb-c447-9b06-0a3589525cd7	\N	0009	t	2017-01-01	2017-01-01	\N	15	t	\N	f	t
000c0000-55fb-c448-51b5-c5d366e3b070	000d0000-55fb-c447-cb1f-c6638e5c0681	00100000-55fb-c448-6ad5-9cf2718a64d0	00090000-55fb-c447-7eaa-63f70b0bd215	\N	0010	t	\N	2015-09-18	\N	16	f	\N	f	t
000c0000-55fb-c448-1062-1c8425a48e4a	000d0000-55fb-c447-cb1f-c6638e5c0681	00100000-55fb-c448-f8d5-fca20894546b	00090000-55fb-c447-1fe9-9618f8f242e2	\N	0011	t	2017-01-01	\N	\N	17	f	\N	f	t
000c0000-55fb-c448-42b5-a52dc62a37e1	000d0000-55fb-c447-e8b1-713cc07922e3	\N	00090000-55fb-c447-c5db-f86508a7e980	000b0000-55fb-c447-b4c7-b78fb2efff5b	0012	f	\N	\N	\N	2	t	\N	t	t
\.


--
-- TOC entry 2981 (class 0 OID 19993718)
-- Dependencies: 225
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 2975 (class 0 OID 19993626)
-- Dependencies: 219
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, stevilka, naslov, avtor, podnaslov, jezik, naslovizvirnika, internacionalninaslov, datumprejema, moskevloge, zenskevloge, prevajalec, povzetekvsebine, letoizida, krajizida, zaloznik) FROM stdin;
00160000-55fb-c447-0834-ca045aeda0a1	0001	Sen kresne noči	William Shakespeare		slovenščina	A Midsummer Night's Dream	\N	2015-04-26	5	5	Milan Jesih	Nastopajo Titanija, Hipolita, Oberon, ...	\N	\N	\N
00160000-55fb-c447-ef02-0a7a7eb40e7b	0002	Bratje Karamazovi	Fjodor Mihajlovič Dostojevski		slovenščina	Bratja Karamazjovji	\N	2015-12-04	4	1	Vladimir Levstik	Svetovna uspešnica	\N	\N	\N
00160000-55fb-c447-47eb-aa7e709ec6b0	0003	Smoletov Vrt	Berta Hočevar		slovenščina		\N	2015-05-26	2	8			\N	\N	\N
\.


--
-- TOC entry 2996 (class 0 OID 19993974)
-- Dependencies: 240
-- Data for Name: datoteka; Type: TABLE DATA; Schema: public; Owner: -
--

COPY datoteka (id, owner_id, filename, transfers, size, format, hash, createdat, uploadedat, upor, datknj) FROM stdin;
\.


--
-- TOC entry 2951 (class 0 OID 19993393)
-- Dependencies: 195
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_splosni_id, prostor_id, sezona_id, planiranzacetek, allday, zacetek, konec, status, razred, termin, title) FROM stdin;
00180000-55fb-c448-a86b-48501d1e3a1c	\N	\N	00200000-55fb-c447-e68f-a4b2ce7c76ab	\N	\N	\N	\N	2015-06-26 10:00:00	f	2015-06-26 10:00:00	2015-06-26 12:00:00	200s	200s		dogodek 1
00180000-55fb-c448-e63a-7d75d0156121	\N	\N	00200000-55fb-c447-5d0e-f6e9d625c10e	\N	\N	\N	\N	2015-06-27 10:00:00	f	2015-06-27 10:00:00	2015-06-27 12:00:00	300s	200s		dogodek 2
00180000-55fb-c448-b7d4-2986776339ab	\N	\N	00200000-55fb-c447-b695-18f9b5902852	\N	\N	\N	\N	2015-08-01 20:00:00	f	2015-08-01 20:00:00	2015-08-01 23:00:00	400s	200s		dogodek 3
00180000-55fb-c448-6ecd-0f4f21541ccb	\N	\N	00200000-55fb-c447-8249-a4c316dc7f01	\N	\N	\N	\N	2015-08-01 20:00:00	f	2015-08-01 20:00:00	2015-08-01 23:00:00	100s	200s		dogodek 4
00180000-55fb-c448-2adf-ef2367b3dccd	\N	\N	00200000-55fb-c447-515b-b20770c914d8	\N	\N	\N	\N	2015-08-01 20:00:00	f	2015-08-01 20:00:00	2015-08-01 23:00:00	500s	200s		dogodek 5
\.


--
-- TOC entry 2953 (class 0 OID 19993425)
-- Dependencies: 197
-- Data for Name: dogodeksplosni; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodeksplosni (id) FROM stdin;
\.


--
-- TOC entry 2990 (class 0 OID 19993900)
-- Dependencies: 234
-- Data for Name: drugivir; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drugivir (id, znesek, opis, mednarodni, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 2946 (class 0 OID 19993333)
-- Dependencies: 190
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-55fb-c446-fac5-fd73de45a411	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-55fb-c446-221b-03904027a676	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-55fb-c446-208c-9422ca19ca69	AL	ALB	008	Albania 	Albanija	\N
00040000-55fb-c446-5b37-261eb9961d07	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-55fb-c446-3142-2645a4db3f13	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-55fb-c446-6406-97b7457bdb82	AD	AND	020	Andorra 	Andora	\N
00040000-55fb-c446-bc6a-f2d4ca14a0a0	AO	AGO	024	Angola 	Angola	\N
00040000-55fb-c446-e9cd-f2b325273882	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-55fb-c446-c375-77277b98e306	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-55fb-c446-365d-2ddeee46abbe	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-55fb-c446-b916-214839ffab27	AR	ARG	032	Argentina 	Argenitna	\N
00040000-55fb-c446-97ea-62f63895f199	AM	ARM	051	Armenia 	Armenija	\N
00040000-55fb-c446-5de7-3fb5a61886f9	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-55fb-c446-aba3-42e7f5f8eb31	AU	AUS	036	Australia 	Avstralija	\N
00040000-55fb-c446-05c4-1a9e201ab126	AT	AUT	040	Austria 	Avstrija	\N
00040000-55fb-c446-6d07-aa1f8f8473a8	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-55fb-c446-0fa2-2ddbfc907548	BS	BHS	044	Bahamas 	Bahami	\N
00040000-55fb-c446-9a93-6423ba0ccc62	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-55fb-c446-af56-b277ad79d8af	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-55fb-c446-a801-17e2350ad4dc	BB	BRB	052	Barbados 	Barbados	\N
00040000-55fb-c446-d2ef-799118cc88c0	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-55fb-c446-3cbd-f66c81609794	BE	BEL	056	Belgium 	Belgija	\N
00040000-55fb-c446-a44c-1e64dce7af40	BZ	BLZ	084	Belize 	Belize	\N
00040000-55fb-c446-905f-6b4d3b8d882d	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-55fb-c446-1b70-35ba09aee05c	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-55fb-c446-1835-274fd7d7442b	BT	BTN	064	Bhutan 	Butan	\N
00040000-55fb-c446-c39d-821f28cd78ed	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-55fb-c446-e187-ed3c138d4635	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-55fb-c446-2580-338b28c7b2d3	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-55fb-c446-fc71-752aab041250	BW	BWA	072	Botswana 	Bocvana	\N
00040000-55fb-c446-0782-082b69f37a92	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-55fb-c446-09aa-03f2886e12fa	BR	BRA	076	Brazil 	Brazilija	\N
00040000-55fb-c446-3e25-f6496adb4392	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-55fb-c446-3fed-5824f64fc69b	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-55fb-c446-f6ae-1a85dd51b43c	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-55fb-c446-6700-244da67058d8	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-55fb-c446-03fd-74b71f7944eb	BI	BDI	108	Burundi 	Burundi 	\N
00040000-55fb-c446-c496-031c1f5281ee	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-55fb-c446-00dc-f65c97422e9d	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-55fb-c446-ade9-2f5b01acd5e4	CA	CAN	124	Canada 	Kanada	\N
00040000-55fb-c446-b130-1db71b815f28	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-55fb-c446-89e2-a80a939107b7	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-55fb-c446-2f39-bbd884cbe703	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-55fb-c446-cd58-c96ea446e80f	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-55fb-c446-e4b7-5f0d937b839b	CL	CHL	152	Chile 	Čile	\N
00040000-55fb-c446-d899-5b5ec2586d8a	CN	CHN	156	China 	Kitajska	\N
00040000-55fb-c446-5cba-d64004144805	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-55fb-c446-40e4-d0defb2455ce	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-55fb-c446-93aa-71eebb088c49	CO	COL	170	Colombia 	Kolumbija	\N
00040000-55fb-c446-a902-0c53298eebd7	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-55fb-c446-d6a1-e200d6270e42	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-55fb-c446-c5c5-6edfd6bfd606	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-55fb-c446-39ce-d0559963454c	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-55fb-c446-4f69-e1156f82b855	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-55fb-c446-8090-8ac6c4cafe2b	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-55fb-c446-b4e5-6192ef31df9d	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-55fb-c446-68b2-521e9fe81c12	CU	CUB	192	Cuba 	Kuba	\N
00040000-55fb-c446-6db7-f82f6cc7dabc	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-55fb-c446-ff00-e66cc6ee75e7	CY	CYP	196	Cyprus 	Ciper	\N
00040000-55fb-c446-da28-b9160723e6d0	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-55fb-c446-4f85-df73cc50c25e	DK	DNK	208	Denmark 	Danska	\N
00040000-55fb-c446-04dc-b0b844b4fcf4	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-55fb-c446-b5c7-f7ddbec66878	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-55fb-c446-0bd5-dac3d3e24ebc	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-55fb-c446-e650-be001af79cc1	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-55fb-c446-fefd-ce0216480ed3	EG	EGY	818	Egypt 	Egipt	\N
00040000-55fb-c446-e5f8-7e9a2ec44a88	SV	SLV	222	El Salvador 	Salvador	\N
00040000-55fb-c446-fbf4-5219ca15afc3	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-55fb-c446-e980-17ea710c3123	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-55fb-c446-b33b-d35f158f5d0d	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-55fb-c446-1930-69d0b20f3b2a	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-55fb-c446-53d6-34fb10219713	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-55fb-c446-2bbe-f95d3b188600	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-55fb-c446-aa46-8ec04307d746	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-55fb-c446-3409-864cbddd650f	FI	FIN	246	Finland 	Finska	\N
00040000-55fb-c446-f0dc-9bd4a7ee8013	FR	FRA	250	France 	Francija	\N
00040000-55fb-c446-5921-84f1f0fa5279	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-55fb-c446-bdb8-ad9e6d87645c	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-55fb-c446-4979-21c0b1eb8116	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-55fb-c446-731f-cd0614b0246d	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-55fb-c446-e4df-0cd84511c4ae	GA	GAB	266	Gabon 	Gabon	\N
00040000-55fb-c446-09e2-ba14f0e43d0e	GM	GMB	270	Gambia 	Gambija	\N
00040000-55fb-c446-0bcf-6fb3c8acf4c0	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-55fb-c446-b716-d1857d4a0695	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-55fb-c446-b2a1-70767341a3c8	GH	GHA	288	Ghana 	Gana	\N
00040000-55fb-c446-4e4c-8e0519aad70a	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-55fb-c446-1ec2-3ba1a97d06ae	GR	GRC	300	Greece 	Grčija	\N
00040000-55fb-c446-f95d-02a6b8348e27	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-55fb-c446-f9e6-a9a651834920	GD	GRD	308	Grenada 	Grenada	\N
00040000-55fb-c446-fee7-2e54da6d0e56	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-55fb-c446-7a13-816a6f9f26be	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-55fb-c446-d69d-942bff37b01d	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-55fb-c446-0770-5272fe77f59e	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-55fb-c446-9203-6bf2160321e0	GN	GIN	324	Guinea 	Gvineja	\N
00040000-55fb-c446-ec1b-1f46a35f9dda	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-55fb-c446-555e-ff5b34cbdc28	GY	GUY	328	Guyana 	Gvajana	\N
00040000-55fb-c446-00e2-47b3ce608993	HT	HTI	332	Haiti 	Haiti	\N
00040000-55fb-c446-14d3-f875aeefa57f	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-55fb-c446-9c00-42179577b166	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-55fb-c446-e8ca-942a16f37f82	HN	HND	340	Honduras 	Honduras	\N
00040000-55fb-c446-7c17-9c9d48916693	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-55fb-c446-7887-b9674acdb6c8	HU	HUN	348	Hungary 	Madžarska	\N
00040000-55fb-c446-8634-938c29e8871e	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-55fb-c446-b824-c4b16ae0ed75	IN	IND	356	India 	Indija	\N
00040000-55fb-c446-eeb3-e46806c2d3a7	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-55fb-c446-c1d8-ea9011270980	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-55fb-c446-137f-ad846382e60e	IQ	IRQ	368	Iraq 	Irak	\N
00040000-55fb-c446-1679-a506598e80ab	IE	IRL	372	Ireland 	Irska	\N
00040000-55fb-c446-65de-9603d71904b5	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-55fb-c446-bac5-204b96cabd4f	IL	ISR	376	Israel 	Izrael	\N
00040000-55fb-c446-8ce5-92b83774d925	IT	ITA	380	Italy 	Italija	\N
00040000-55fb-c446-27df-ab71fec1a191	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-55fb-c446-d0ee-ff07d2e02034	JP	JPN	392	Japan 	Japonska	\N
00040000-55fb-c446-8ec5-29e2ab234fb6	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-55fb-c446-5192-de3408d6c9ff	JO	JOR	400	Jordan 	Jordanija	\N
00040000-55fb-c446-3b25-d1004cc628a5	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-55fb-c446-d28e-de75c45adb55	KE	KEN	404	Kenya 	Kenija	\N
00040000-55fb-c446-a97f-8f3c3463e6aa	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-55fb-c446-299f-e5ce11054bef	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-55fb-c446-e6e8-1334466bfb0b	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-55fb-c446-19c2-a7a01aad4eb3	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-55fb-c446-afc9-851f2229c0a9	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-55fb-c446-ab0d-d3184e4ec9b0	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-55fb-c446-7559-7bc5319c2d1c	LV	LVA	428	Latvia 	Latvija	\N
00040000-55fb-c446-8d14-83f18cd6b8a3	LB	LBN	422	Lebanon 	Libanon	\N
00040000-55fb-c446-3ea9-656f7c97034c	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-55fb-c446-0db7-ff741e54a161	LR	LBR	430	Liberia 	Liberija	\N
00040000-55fb-c446-8336-8fcb1d371479	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-55fb-c446-6d7d-631ab1ddb9c8	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-55fb-c446-e8bf-87b3e24154b5	LT	LTU	440	Lithuania 	Litva	\N
00040000-55fb-c446-1450-93ea0806b670	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-55fb-c446-5206-dcdf4a51741f	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-55fb-c446-7727-f8dd40feaf35	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-55fb-c446-41d8-096ba2e89157	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-55fb-c446-d635-49b5b60271f0	MW	MWI	454	Malawi 	Malavi	\N
00040000-55fb-c446-462d-99ba1cd695b5	MY	MYS	458	Malaysia 	Malezija	\N
00040000-55fb-c446-d54a-615dd93acffc	MV	MDV	462	Maldives 	Maldivi	\N
00040000-55fb-c446-4b89-fcf02d3fc084	ML	MLI	466	Mali 	Mali	\N
00040000-55fb-c446-85c4-6cf329ffdc23	MT	MLT	470	Malta 	Malta	\N
00040000-55fb-c446-1c40-83b0d75299c8	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-55fb-c446-6f2d-99beab35c4e2	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-55fb-c446-f6eb-63bd357a7946	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-55fb-c446-c57f-2cd140839d76	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-55fb-c446-4647-c5c3efb2a5cc	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-55fb-c446-80dc-01824450e07a	MX	MEX	484	Mexico 	Mehika	\N
00040000-55fb-c446-3fa7-4f1cbdcb6a70	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-55fb-c446-5233-3efceb7ddac9	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-55fb-c446-dea0-96cad49e7384	MC	MCO	492	Monaco 	Monako	\N
00040000-55fb-c446-a162-99ea633c02d6	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-55fb-c446-0066-81fbf4b050e2	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-55fb-c446-bf86-04935e7a24a7	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-55fb-c446-9361-de259bd788af	MA	MAR	504	Morocco 	Maroko	\N
00040000-55fb-c446-c55b-b30b40ec806f	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-55fb-c446-1c8e-2ca5dc00d9d0	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-55fb-c446-44bb-f1ba7b180069	NA	NAM	516	Namibia 	Namibija	\N
00040000-55fb-c446-dccc-242f18b86f73	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-55fb-c446-adbc-670dafdc9616	NP	NPL	524	Nepal 	Nepal	\N
00040000-55fb-c446-5bd1-e520fce38cae	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-55fb-c446-b74d-a50b94fc3085	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-55fb-c446-d84a-f80356753603	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-55fb-c446-3902-40b129b66feb	NE	NER	562	Niger 	Niger 	\N
00040000-55fb-c446-bb45-9a5c9390451f	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-55fb-c446-e636-a0ce76022da6	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-55fb-c446-96f5-6b0de6392246	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-55fb-c446-f37a-4246ffb33c0b	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-55fb-c446-806a-668e0cdb8851	NO	NOR	578	Norway 	Norveška	\N
00040000-55fb-c446-a027-58ff4ceda566	OM	OMN	512	Oman 	Oman	\N
00040000-55fb-c446-b1a9-81fd6cde6953	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-55fb-c446-0f41-4cf67f8405f8	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-55fb-c446-e002-afa44dc2a00b	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-55fb-c446-3685-421e74806a40	PA	PAN	591	Panama 	Panama	\N
00040000-55fb-c446-4d23-ed1460728aa2	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-55fb-c446-52e7-cb691b02c013	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-55fb-c446-a728-425c1be47ee2	PE	PER	604	Peru 	Peru	\N
00040000-55fb-c446-d30f-8a19e167d128	PH	PHL	608	Philippines 	Filipini	\N
00040000-55fb-c446-8761-86fcc3167031	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-55fb-c446-862a-215450479fbb	PL	POL	616	Poland 	Poljska	\N
00040000-55fb-c446-6e9d-8b6c6d599fc7	PT	PRT	620	Portugal 	Portugalska	\N
00040000-55fb-c446-d787-13995b239a60	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-55fb-c446-18e7-62a4b6d36216	QA	QAT	634	Qatar 	Katar	\N
00040000-55fb-c446-d51d-949043d5db40	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-55fb-c446-a91a-2efdf1eb0808	RO	ROU	642	Romania 	Romunija	\N
00040000-55fb-c446-240a-8209731651b1	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-55fb-c446-1d71-c71bf5e8f3ed	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-55fb-c446-440f-3f4d9de1c16a	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-55fb-c446-c26d-3a71891cd38e	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-55fb-c446-dcac-fa42da180a4e	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-55fb-c446-4ab8-73bb39c9a98b	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-55fb-c446-aa07-32df12d85140	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-55fb-c446-0f92-8d38d790ce7b	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-55fb-c446-44c2-9b081c8af485	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-55fb-c446-959a-2b2d0959f0d3	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-55fb-c446-3f2a-07483f8ddf90	SM	SMR	674	San Marino 	San Marino	\N
00040000-55fb-c446-01ae-123057d5e747	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-55fb-c446-47ed-4d019dca3c1c	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-55fb-c446-c1f5-ce0e92ff2ce1	SN	SEN	686	Senegal 	Senegal	\N
00040000-55fb-c446-2a58-8006f9ae0713	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-55fb-c446-3d5f-6fc83a9693cc	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-55fb-c446-38b9-e08b53f553b2	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-55fb-c446-7ed9-892a9d597b2a	SG	SGP	702	Singapore 	Singapur	\N
00040000-55fb-c446-76b8-8327ad4236ba	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-55fb-c446-7a61-b5df80a9b2d5	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-55fb-c446-5c35-d8fbdaa2bd46	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-55fb-c446-1a72-b63776074fa1	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-55fb-c446-e774-c3bb542ccc45	SO	SOM	706	Somalia 	Somalija	\N
00040000-55fb-c446-9b6d-c30bfb25126a	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-55fb-c446-c11c-fac543905a7f	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-55fb-c446-c95c-fc2606170490	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-55fb-c446-ffec-4f0289255c41	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-55fb-c446-37b2-595e82fabc94	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-55fb-c446-8ffe-613c0aa1ee4e	SD	SDN	729	Sudan 	Sudan	\N
00040000-55fb-c446-9bc4-86fe94d6bec9	SR	SUR	740	Suriname 	Surinam	\N
00040000-55fb-c446-6d44-99dcd378638b	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-55fb-c446-230c-3936412055d0	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-55fb-c446-6efa-cb3f25baeebd	SE	SWE	752	Sweden 	Švedska	\N
00040000-55fb-c446-67de-22c5c73d16bd	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-55fb-c446-6c5b-368985b42999	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-55fb-c446-bc77-a898a37fa025	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-55fb-c446-d6f3-c34485eb144b	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-55fb-c446-b6ae-56819682c893	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-55fb-c446-e3ef-28a7e766ef26	TH	THA	764	Thailand 	Tajska	\N
00040000-55fb-c446-2492-fc42a885bb5c	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-55fb-c446-9e8a-b0c19ec58907	TG	TGO	768	Togo 	Togo	\N
00040000-55fb-c446-f3cb-8c1487201ccd	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-55fb-c446-0800-789e03c3b83a	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-55fb-c446-6877-bbc4a8ce8a8c	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-55fb-c446-7311-51f38ccdf943	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-55fb-c446-192d-028ae4d33052	TR	TUR	792	Turkey 	Turčija	\N
00040000-55fb-c446-a94b-9a3a559cfee9	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-55fb-c446-2c99-7a4e33d426e2	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-55fb-c446-5844-f82303080ed6	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-55fb-c446-ace6-a042bd0b01a7	UG	UGA	800	Uganda 	Uganda	\N
00040000-55fb-c446-ccac-6390cbc849dc	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-55fb-c446-c921-a11ba6794318	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-55fb-c446-dbbc-432756f51025	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-55fb-c446-45a3-fcad288eb7e9	US	USA	840	United States 	Združene države Amerike	\N
00040000-55fb-c446-7112-ee7c0a200c9c	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-55fb-c446-15a8-1b35695ffffc	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-55fb-c446-07ef-8e6d58632b9d	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-55fb-c446-e08b-f56e184ec45b	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-55fb-c446-608f-79223900c3aa	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-55fb-c446-67f4-bc52f6750141	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-55fb-c446-5cf8-917c048ed9e9	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-55fb-c446-5c7c-1e5bd11e766e	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-55fb-c446-ae0f-2e4c97a2d2fb	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-55fb-c446-b31a-dde2642d6e61	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-55fb-c446-f445-1170068d65c7	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-55fb-c446-9ce9-190abf4c6557	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-55fb-c446-ef50-1c84c330f493	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 2983 (class 0 OID 19993748)
-- Dependencies: 227
-- Data for Name: enotaprograma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY enotaprograma (id, uprizoritev_id, program_dela_id, gostitelj_id, celotnavrednost, nasdelez, celotnavrednostmat, celotnavrednostgostovsz, zaproseno, lastnasredstva, avtorskihonorarji, avtorskihonorarjisamoz, tantieme, avtorskepravice, materialni, imakoprodukcije, vlozekgostitelja, drugijavni, stzaposlenih, stzaposumet, stzaposdrug, sthonorarnih, sthonorarnihigr, sthonorarnihigrtujjz, sthonorarnihigrsamoz, obiskdoma, obiskkopr, obiskgost, obiskzamejo, obiskint, obiskkoprint, ponovidoma, ponovikopr, ponovizamejo, ponovigost, ponovikoprint, ponoviint, naziv, kpe, sort, tipprogramskeenote_id, tip, prikoproducentu, strosekodkpred, stroskiostali, krajgostovanja, ustanova, datumgostovanja, transportnistroski, dnevprvzad, drzavagostovanja_id, stpe, zvrst, stpredstav, stokroglihmiz, stpredstavitev, stdelavnic, stdrugidogodki, stprodukcij, caspriprave, casizvedbe, prizorisca, umetvodja, programskotelo, sttujihselektorjev) FROM stdin;
002f0000-55fb-c447-0344-06d3ab7c1739	000e0000-55fb-c447-c201-5005cb3c3085	\N	\N	9000.30	9000.30	9000.30	0.00	3600.12	5299.98	4000.40	1000.40	200.20	200.30	4599.40	\N	0.00	100.20	0	2	2	2	2	2	\N	40	0	0	0	0	0	1	0	0	0	0	0		0.00	\N	002b0000-55fb-c446-79ee-d39195e87b4a	premiera	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-55fb-c447-470b-ab61264f60c5	000e0000-55fb-c447-d10a-87a88dd8e690	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	\N	60	0	0	0	0	0	1	0	0	0	0	0		0.00	\N	002b0000-55fb-c446-9ecb-7afad4b9b080	premiera	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-55fb-c447-c957-4968fa4826da	000e0000-55fb-c447-d936-28279a6cf6f1	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	\N	60	0	0	0	0	0	1	0	0	0	0	0		0.00	\N	002b0000-55fb-c446-79ee-d39195e87b4a	premiera	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-55fb-c448-7dd1-de58573bb49d	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-54.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	54.20	5	0	0	3	0	0	\N	22	0	0	0	0	0	0	0	0	0	0	0	Urejanje portala	0.00	10	\N	razno	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-55fb-c448-bf04-5b46d6d732f3	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-31.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	31.20	5	0	0	3	0	0	\N	202	0	0	0	0	0	0	0	0	0	0	0	Delavnice otroci	0.00	8	\N	razno	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 2969 (class 0 OID 19993558)
-- Dependencies: 213
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, podrocje, vodjaekipe, naziv, komentar, velikost, pomembna, sort, seplanira, dovoliprekrivanje, maxprekrivanj, tipfunkcije_id) FROM stdin;
000d0000-55fb-c447-1074-85adc7ae4103	000e0000-55fb-c447-d10a-87a88dd8e690	000c0000-55fb-c448-8e52-52150c9e6e05	igralec	\N	Tezej	glavna vloga	velika	t	5	t	t	\N	000f0000-55fb-c446-2abe-56025d38b97e
000d0000-55fb-c447-2eb2-5ea71e231ff3	000e0000-55fb-c447-d10a-87a88dd8e690	000c0000-55fb-c448-b3a0-430393bb2af1	umetnik	\N	Režija		velika	t	8	t	t	\N	000f0000-55fb-c446-1f39-23155a900a01
000d0000-55fb-c447-cd3d-c8ab1ef1f227	000e0000-55fb-c447-d10a-87a88dd8e690	000c0000-55fb-c448-87b7-ad3e08f74cdf	inspicient	t	Inšpicient			t	8	t	t	\N	000f0000-55fb-c446-816a-18b8eaf8c482
000d0000-55fb-c447-30ec-9e586d12de5f	000e0000-55fb-c447-d10a-87a88dd8e690	000c0000-55fb-c448-8523-9f859f27eacc	tehnik	t	Tehnični vodja			t	8	t	t	\N	000f0000-55fb-c446-11d5-1ece1487aa36
000d0000-55fb-c447-9d98-1987daecebef	000e0000-55fb-c447-d10a-87a88dd8e690	000c0000-55fb-c448-30dd-86291770fad6	tehnik	\N	Razsvetljava			t	3	t	t	\N	000f0000-55fb-c446-11d5-1ece1487aa36
000d0000-55fb-c447-ca9e-e0247feed826	000e0000-55fb-c447-d10a-87a88dd8e690	000c0000-55fb-c448-e2df-6749128fdcda	igralec	\N	Helena	glavna vloga	velika	t	5	t	t	\N	000f0000-55fb-c446-2abe-56025d38b97e
000d0000-55fb-c447-cb1f-c6638e5c0681	000e0000-55fb-c447-d10a-87a88dd8e690	000c0000-55fb-c448-5e8e-3ff07eda7a7f	igralec	\N	Hipolita	glavna vloga	velika	t	6	t	t	\N	000f0000-55fb-c446-2abe-56025d38b97e
000d0000-55fb-c447-2178-2474a737a586	000e0000-55fb-c447-d10a-87a88dd8e690	000c0000-55fb-c448-6629-fd9a16d004a3	umetnik	\N	Lektoriranje			t	22	t	t	\N	000f0000-55fb-c446-8404-7c545c69232e
000d0000-55fb-c447-e8b1-713cc07922e3	000e0000-55fb-c447-d10a-87a88dd8e690	000c0000-55fb-c448-42b5-a52dc62a37e1	umetnik	\N	Avtor	Avtor besedila		t	2	t	f	\N	000f0000-55fb-c446-639c-1f78b5390e7b
\.


--
-- TOC entry 2949 (class 0 OID 19993372)
-- Dependencies: 193
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta, zamejstvo, kraj) FROM stdin;
\.


--
-- TOC entry 2947 (class 0 OID 19993350)
-- Dependencies: 191
-- Data for Name: kontaktnaoseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kontaktnaoseba (id, popa_id, oseba_id, status, funkcija, opis) FROM stdin;
00260000-55fb-c447-f9aa-3d00b16805c6	00080000-55fb-c447-0c46-f1ac117ed62d	00090000-55fb-c447-7eaa-63f70b0bd215	AK		igralka
\.


--
-- TOC entry 2958 (class 0 OID 19993472)
-- Dependencies: 202
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 2994 (class 0 OID 19993955)
-- Dependencies: 238
-- Data for Name: mapa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa (id, lastnik_id, parent_id, ime, komentar, caskreiranja, casspremembe, javnidostop, upor, datknj) FROM stdin;
\.


--
-- TOC entry 2995 (class 0 OID 19993967)
-- Dependencies: 239
-- Data for Name: mapa_zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa_zapis (mapa_id, zapis_id) FROM stdin;
\.


--
-- TOC entry 2997 (class 0 OID 19993989)
-- Dependencies: 241
-- Data for Name: mapaacl; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapaacl (id, mapa_id, perm_id, dostop, upor, datknj) FROM stdin;
\.


--
-- TOC entry 2926 (class 0 OID 19946838)
-- Dependencies: 170
-- Data for Name: migrations; Type: TABLE DATA; Schema: public; Owner: -
--

COPY migrations (version) FROM stdin;
20150824004401
20150826210511
20150827174118
20150831215248
20150907083238
20150911210328
20150917115047
\.


--
-- TOC entry 2962 (class 0 OID 19993497)
-- Dependencies: 206
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 2944 (class 0 OID 19993307)
-- Dependencies: 188
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-55fb-c446-c4ae-eafa54edc395	popa.stakli	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-55fb-c446-9b62-ea10c6feadfa	oseba.spol	array	a:2:{s:1:"M";a:1:{s:5:"label";s:6:"Moški";}s:1:"Z";a:1:{s:5:"label";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-55fb-c446-faec-995e1c93387e	telefonska.vrsta	array	a:3:{s:7:"mobilna";a:1:{s:5:"label";s:7:"Mobilni";}s:6:"domaca";a:1:{s:5:"label";s:6:"Domač";}s:6:"fiksna";a:1:{s:5:"label";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-55fb-c446-78b2-530f9fbaf9fa	kontaktnaoseba.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status kontaktne osebe
00000000-55fb-c446-96e4-672ca183fa39	dogodek.status	array	a:7:{s:4:"100s";a:1:{s:5:"label";s:11:"Dolgoročno";}s:4:"200s";a:1:{s:5:"label";s:9:"Planirano";}s:4:"300s";a:1:{s:5:"label";s:8:"Fiksiran";}s:4:"400s";a:1:{s:5:"label";s:17:"Potrjen - interno";}s:4:"500s";a:1:{s:5:"label";s:15:"Potrjen - javno";}s:4:"600s";a:1:{s:5:"label";s:10:"Zaključen";}s:4:"700s";a:1:{s:5:"label";s:7:"Obdelan";}}	f	t	t	\N	Tabela statusa dogodkov
00000000-55fb-c446-54de-03f3f063a072	dogodek.razred	array	a:5:{s:4:"100s";a:2:{s:5:"label";s:9:"Predstava";s:4:"type";s:9:"predstava";}s:4:"200s";a:2:{s:5:"label";s:4:"Vaja";s:4:"type";s:4:"vaja";}s:4:"300s";a:2:{s:5:"label";s:10:"Gostovanje";s:4:"type";s:10:"gostovanje";}s:4:"400s";a:2:{s:5:"label";s:16:"Splošni dogodek";s:4:"type";s:8:"splošni";}s:4:"500s";a:2:{s:5:"label";s:10:"Zasedenost";s:4:"type";s:10:"zasedenost";}}	f	t	t	\N	Tabela razredov dogodkov, ki jih aplikacija podpira
00000000-55fb-c446-0370-d2f899703b4c	uprizoritev.faza	array	a:6:{s:20:"predprodukcija-ideja";a:1:{s:5:"label";s:16:"Dolgoročni plan";}s:20:"predprodukcija-poziv";a:1:{s:5:"label";s:29:"Predprodukcija, v fazi poziva";}s:30:"predprodukcija-potrjen_program";a:1:{s:5:"label";s:34:"Predprodukcija, program je potrjen";}s:10:"produkcija";a:1:{s:5:"label";s:10:"Produkcija";}s:14:"postprodukcija";a:1:{s:5:"label";s:14:"Postprodukcija";}s:5:"arhiv";a:1:{s:5:"label";s:10:"Arhivirana";}}	f	t	f	\N	Faza uprizoritve
00000000-55fb-c446-6ef7-c939083c6a82	funkcija.podrocje	array	a:4:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}}	f	t	f	\N	Področje funkcije
00000000-55fb-c446-d8bc-459caac32b1b	tipfunkcije.podrocje	array	a:4:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}}	f	t	f	\N	Področje funkcije
00000000-55fb-c446-24aa-8f843134bc8d	funkcija.velikost	array	a:4:{s:7:"stataza";a:1:{s:5:"label";s:8:"Stataža";}s:4:"mala";a:1:{s:5:"label";s:21:"Mala vloga / funkcija";}s:7:"srednja";a:1:{s:5:"label";s:24:"Srednja vloga / funkcija";}s:6:"velika";a:1:{s:5:"label";s:23:"Velika vloga / funkcija";}}	f	t	f	\N	Velikost funkcije
00000000-55fb-c446-def8-ad7b21ef4220	zaposlitev.status	array	a:2:{s:1:"A";a:1:{s:5:"label";s:7:"Aktivna";}s:1:"N";a:1:{s:5:"label";s:9:"Neaktivna";}}	f	t	f	\N	Status zaposlitve
00000000-55fb-c446-08b1-cdc4459bfe58	produkcijskahisa.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktivna";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktivna";}}	f	t	f	\N	Status produkcijske hiše
00000000-55fb-c446-69dd-76ae9d514cf4	strosekuprizoritve.tipstroska	array	a:1:{s:10:"materialni";a:1:{s:5:"label";s:19:"Materialni strošek";}}	f	t	f	\N	Tip stroška
00000000-55fb-c446-69e1-0bdaf762bd2f	fsacl.dostop	array	a:4:{s:1:"X";a:1:{s:5:"label";s:12:"Brez dostopa";}s:1:"R";a:1:{s:5:"label";s:11:"Samo branje";}s:2:"RW";a:1:{s:5:"label";s:17:"Branje in pisanje";}s:3:"RWD";a:1:{s:5:"label";s:26:"Branje pisanje in brisanje";}}	f	t	f	\N	ACL Javni dostop
00000000-55fb-c447-1f99-19ba4f5924ca	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-55fb-c447-37cc-94395a78f836	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-55fb-c447-df0d-4f5acf04b3af	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-55fb-c447-8eae-b25ae8078c64	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-55fb-c447-0a02-634dfd85ecf2	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
00000000-55fb-c448-9604-ecbff29377ec	application.tenant.maticnopodjetje	string	s:4:"1001";	f	t	f		Šifra matičnega podjetja v Popa in ProdukcijskaHisa
\.


--
-- TOC entry 2938 (class 0 OID 19993221)
-- Dependencies: 182
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-55fb-c447-4f42-22fee9325daf	00000000-55fb-c447-1f99-19ba4f5924ca	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-55fb-c447-25bc-c77891725067	00000000-55fb-c447-1f99-19ba4f5924ca	00010000-55fb-c446-17ef-692fca6b907d	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-55fb-c447-d14a-bfa13d24e691	00000000-55fb-c447-37cc-94395a78f836	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 2939 (class 0 OID 19993232)
-- Dependencies: 183
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naslov_id, sifra, naziv, ime, priimek, funkcija, srednjeime, polnoime, psevdonim, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
00090000-55fb-c447-46c1-01b11a40358d	\N	\N	0001	g.	Janez	Novak	a	Peter	Janez Peter Novak	Jani	jani.novak@xxx.xx	1958-01-06	0601958000000	123456789	M	Jani Janez	Slovenija	Slovenija	Ljubljana
00090000-55fb-c447-a833-8c67c15910c2	00010000-55fb-c447-7873-695ca9fbba62	\N	0002	dr.	Anton	Horvat	b		Anton  Horvat	Tona	anton.horvat@xxx.xx	1968-02-12	1202968111111	234567890	M		Slovenija	Slovenija	Maribor
00090000-55fb-c447-a305-f5e000b69592	00010000-55fb-c447-3e61-8b3168e80af8	\N	0003		Ivan	Kovačič	c		Ivan  Kovačič	Ivo	ivan.kovacic@xxx.xx	1975-03-26	2603976222222	345678901	M		Slovenija	Slovenija	Celje
00090000-55fb-c447-9b06-0a3589525cd7	00010000-55fb-c447-15fd-a3842b458b3a	\N	0004	prof.	Jožef	Krajnc	d		Jožef  Krajnc	Joža	jozef.krajnc@xxx.xx	1971-04-30	3004971333333	456789012	M		Slovenija	Slovenija	Kranj
00090000-55fb-c447-7b7b-8bdd06f9fe26	\N	\N	0005		Marko	Zupančič	e		Marko  Zupančič		marko.zupancic@xxx.xx	1984-05-07	0705984444444	567890123	M		Slovenija	Slovenija	Koper
00090000-55fb-c447-e478-329d67eeb616	\N	\N	0006	ga.	Marija	Kovač	f		Marija  Kovač		marija.kovac@xxx.xx	1962-06-19	1906962444444	678901234	Z		Slovenija	Slovenija	Murska Sobota
00090000-55fb-c447-1fe9-9618f8f242e2	\N	\N	0007	ga.	Ana	Potočnik	g		Ana  Potočnik		ana.potocnik@xxx.xx	1975-07-24	2407975555555	789012345	Z		Slovenija	Slovenija	Novo Mesto
00090000-55fb-c447-3c3a-f5c43179de76	\N	\N	0008	ga.	Maja	Mlakar	h		Maja  Mlakar		maja.mlakar@xxx.xx	1986-08-02	0208986666666	890123456	Z		Slovenija	Slovenija	Nova Gorica
00090000-55fb-c447-7eaa-63f70b0bd215	00010000-55fb-c447-a67c-b70b6cd702a8	\N	0009		Irena	Kos	i		Irena  Kos		irena.kos@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Ptuj
00090000-55fb-c447-c5db-f86508a7e980	\N	\N	0010		Mojca	Vidmar	J		Mojca  Vidmar		mojca.vidmar@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Idrija
00090000-55fb-c447-acf4-b73ad02d4ba7	\N	\N	0011		xx	write protected12345	a		xx  write protected12345		xx@xxx.xx	\N	\N	\N	Z		\N	\N	\N
00090000-55fb-c447-bb91-c549d26e1f85	\N	\N	0012		Luka	Golob	luč	a	Luka a Golob		luka.golob@xxx.xx	\N	\N	\N	M		\N	\N	\N
00090000-55fb-c447-2138-4ec78d1e5f2f	00010000-55fb-c447-1ab1-78f3584b6081	\N	0013		Tatjana	Božič	tajnica	a	Tatjana a Božič		tatjana.bozic@xxx.xx	\N	\N	\N	Z		\N	\N	\N
\.


--
-- TOC entry 2934 (class 0 OID 19993186)
-- Dependencies: 178
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-55fb-c446-4cfe-f67c879bdd84	Aaa-read	Aaa (User,Role,Permission) - branje	f
00030000-55fb-c446-feda-bc390c537dea	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	f
00030000-55fb-c446-d8bf-61ede78d5532	TerminStoritve-vse	TerminStoritve - spreminjanje vseh zapisov	f
00030000-55fb-c446-10f1-6eb34a7fcf66	Dogodek-readVse	Dogodek - branje vseh, ne glede na status dogodka	f
00030000-55fb-c446-7612-ab337c7cd588	Oseba-vse	Oseba - vse - za testiranje assert	f
00030000-55fb-c446-6c62-02af10a48225	ProgramDela-lock	ProgramDela - zaklepanje	f
00030000-55fb-c446-038d-206c616afba3	ProgramDela-unlock	ProgramDela - odklepanje	f
00030000-55fb-c446-c70e-5a797c0029d9	Abonma-read	Abonma - branje	f
00030000-55fb-c446-d5ca-a8ac29090a89	Abonma-write	Abonma - spreminjanje	f
00030000-55fb-c446-87b6-2fc80929b1dd	Alternacija-read	Alternacija - branje	f
00030000-55fb-c446-9950-74a6fc9db1a8	Alternacija-write	Alternacija - spreminjanje	f
00030000-55fb-c446-3c84-4c5e1c72c715	Arhivalija-read	Arhivalija - branje	f
00030000-55fb-c446-2093-db01b347fb05	Arhivalija-write	Arhivalija - spreminjanje	f
00030000-55fb-c446-4041-19e63d92e660	Besedilo-read	Besedilo - branje	f
00030000-55fb-c446-e8bc-c690dabec23f	Besedilo-write	Besedilo - spreminjanje	f
00030000-55fb-c446-172e-29e364e1b2aa	DogodekIzven-read	DogodekIzven - branje	f
00030000-55fb-c446-ba44-543ef2406d8f	DogodekIzven-write	DogodekIzven - spreminjanje	f
00030000-55fb-c446-3326-32ae35f36e49	Dogodek-read	Dogodek - branje	f
00030000-55fb-c446-0216-707161bcbeb2	Dogodek-write	Dogodek - spreminjanje	f
00030000-55fb-c446-3270-ec6041abeac8	DrugiVir-read	DrugiVir - branje	f
00030000-55fb-c446-c768-7eae2058650c	DrugiVir-write	DrugiVir - spreminjanje	f
00030000-55fb-c446-9602-df1a9c5a0ac9	Drzava-read	Drzava - branje	f
00030000-55fb-c446-ce23-d868cadf014e	Drzava-write	Drzava - spreminjanje	f
00030000-55fb-c446-928d-f7c5f744632b	EnotaPrograma-read	EnotaPrograma - branje	f
00030000-55fb-c446-d36b-92b9178a0918	EnotaPrograma-write	EnotaPrograma - spreminjanje	f
00030000-55fb-c446-8784-729a355637d3	Funkcija-read	Funkcija - branje	f
00030000-55fb-c446-ddbf-078c74017321	Funkcija-write	Funkcija - spreminjanje	f
00030000-55fb-c446-8213-aa14c2f2452c	Gostovanje-read	Gostovanje - branje	f
00030000-55fb-c446-de3b-ccafba3be347	Gostovanje-write	Gostovanje - spreminjanje	f
00030000-55fb-c446-4b77-5dc61a64fd65	Gostujoca-read	Gostujoca - branje	f
00030000-55fb-c446-9efc-db6ddc327945	Gostujoca-write	Gostujoca - spreminjanje	f
00030000-55fb-c446-f0d5-9c1d815806a1	KontaktnaOseba-read	KontaktnaOseba - branje	f
00030000-55fb-c446-e88d-bfe004a3db27	KontaktnaOseba-write	KontaktnaOseba - spreminjanje	f
00030000-55fb-c446-d016-8cfb7487f771	Kupec-read	Kupec - branje	f
00030000-55fb-c446-e1d3-3642aee24aa7	Kupec-write	Kupec - spreminjanje	f
00030000-55fb-c446-9d87-fd136baf407e	NacinPlacina-read	NacinPlacina - branje	f
00030000-55fb-c446-3a31-f26103076cd6	NacinPlacina-write	NacinPlacina - spreminjanje	f
00030000-55fb-c446-ae01-d1b998e65187	Option-read	Option - branje	f
00030000-55fb-c446-601a-5d0cb6f7a5d5	Option-write	Option - spreminjanje	f
00030000-55fb-c446-3877-7ad81d2488a0	OptionValue-read	OptionValue - branje	f
00030000-55fb-c446-ba91-61f6e979e727	OptionValue-write	OptionValue - spreminjanje	f
00030000-55fb-c446-8d92-4d7d2bf943d2	Oseba-read	Oseba - branje	f
00030000-55fb-c446-16ac-ba63c3d60f7b	Oseba-write	Oseba - spreminjanje	f
00030000-55fb-c446-b781-e5b6cee8e428	PlacilniInstrument-read	PlacilniInstrument - branje	f
00030000-55fb-c446-a811-1ad6b6a5ad3f	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	f
00030000-55fb-c446-968c-82a45901a759	PodrocjeSedenja-read	PodrocjeSedenja - branje	f
00030000-55fb-c446-5dde-2823cbfb39da	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	f
00030000-55fb-c446-dd38-3e408c523e46	Pogodba-read	Pogodba - branje	f
00030000-55fb-c446-5748-e9104ccb6899	Pogodba-write	Pogodba - spreminjanje	f
00030000-55fb-c446-3afd-0aa2071c6cc2	Popa-read	Popa - branje	f
00030000-55fb-c446-3a7a-d7ceaa12dfe8	Popa-write	Popa - spreminjanje	f
00030000-55fb-c446-7664-c98982771471	Posta-read	Posta - branje	f
00030000-55fb-c446-cdd6-52343650c8c2	Posta-write	Posta - spreminjanje	f
00030000-55fb-c446-46cb-2c1870765e38	PostavkaCDve-read	PostavkaCDve - branje	f
00030000-55fb-c446-806f-034b3faf0982	PostavkaCDve-write	PostavkaCDve - spreminjanje	f
00030000-55fb-c446-c62d-9df3a88bb80f	PostavkaRacuna-read	PostavkaRacuna - branje	f
00030000-55fb-c446-af32-dddea9cfe4f6	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	f
00030000-55fb-c446-f505-00a76b448329	PostniNaslov-read	PostniNaslov - branje	f
00030000-55fb-c446-8dd9-77ad1c6a6ba4	PostniNaslov-write	PostniNaslov - spreminjanje	f
00030000-55fb-c446-ec25-bf146580913b	Predstava-read	Predstava - branje	f
00030000-55fb-c446-5e52-4131b4b7e2ad	Predstava-write	Predstava - spreminjanje	f
00030000-55fb-c446-5b0c-52d03dc425a7	ProdajaPredstave-read	ProdajaPredstave - branje	f
00030000-55fb-c446-e61b-2d6f4cfe9d55	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	f
00030000-55fb-c446-744c-c9b0cb58a17b	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	f
00030000-55fb-c446-aa9b-329f4d225008	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	f
00030000-55fb-c446-fa5d-885a256ac376	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	f
00030000-55fb-c446-f67e-8cde526c622c	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	f
00030000-55fb-c446-b252-77ec4ab51cbe	ProgramDela-read	ProgramDela - branje	f
00030000-55fb-c446-bf34-0cd1bbb1c4dc	ProgramDela-write	ProgramDela - spreminjanje	f
00030000-55fb-c446-f2be-e17c3ef7b93d	ProgramFestival-read	ProgramFestival - branje	f
00030000-55fb-c446-2383-0b011a9bc759	ProgramFestival-write	ProgramFestival - spreminjanje	f
00030000-55fb-c446-d496-4af5fef882d0	ProgramGostovanje-read	ProgramGostovanje - branje	f
00030000-55fb-c446-5e25-c64626d51570	ProgramGostovanje-write	ProgramGostovanje - spreminjanje	f
00030000-55fb-c446-7845-345756df2e0c	ProgramGostujoca-read	ProgramGostujoca - branje	f
00030000-55fb-c446-4db7-6ff8f03cf092	ProgramGostujoca-write	ProgramGostujoca - spreminjanje	f
00030000-55fb-c446-a0db-685ac0cc16f0	ProgramIzjemni-read	ProgramIzjemni - branje	f
00030000-55fb-c446-be89-190582bd5856	ProgramIzjemni-write	ProgramIzjemni - spreminjanje	f
00030000-55fb-c446-2ba8-423610d82f1d	ProgramPonovitevPrejsnjih-read	ProgramPonovitevPrejsnjih - branje	f
00030000-55fb-c446-15c2-01b600729f09	ProgramPonovitevPrejsnjih-write	ProgramPonovitevPrejsnjih - spreminjanje	f
00030000-55fb-c446-32a8-b8aa9489dadf	ProgramPonovitevPremiere-read	ProgramPonovitevPremiere - branje	f
00030000-55fb-c446-6f2f-145f992a8d8f	ProgramPonovitevPremiere-write	ProgramPonovitevPremiere - spreminjanje	f
00030000-55fb-c446-ab19-fc272a245c69	ProgramPremiera-read	ProgramPremiera - branje	f
00030000-55fb-c446-50b1-e8e0c5c73300	ProgramPremiera-write	ProgramPremiera - spreminjanje	f
00030000-55fb-c446-2034-db76dcf6a5be	ProgramRazno-read	ProgramRazno - branje	f
00030000-55fb-c446-b2cd-5c5ced50e76a	ProgramRazno-write	ProgramRazno - spreminjanje	f
00030000-55fb-c446-fbc7-3ae2bcea1cee	ProgramskaEnotaSklopa-read	ProgramskaEnotaSklopa - branje	f
00030000-55fb-c446-ad67-45ddc1710939	ProgramskaEnotaSklopa-write	ProgramskaEnotaSklopa - spreminjanje	f
00030000-55fb-c446-7b03-5a31764ef07e	Prostor-read	Prostor - branje	f
00030000-55fb-c446-399d-7da2770a43a2	Prostor-write	Prostor - spreminjanje	f
00030000-55fb-c446-293b-e492058ebdbc	Racun-read	Racun - branje	f
00030000-55fb-c446-dcd8-d06ca542cfe8	Racun-write	Racun - spreminjanje	f
00030000-55fb-c446-984b-7ed7dfe1a6b0	RazpisanSedez-read	RazpisanSedez - branje	f
00030000-55fb-c446-ca74-2ecdd8ccfef7	RazpisanSedez-write	RazpisanSedez - spreminjanje	f
00030000-55fb-c446-d0c7-febde809779d	Rekviziterstvo-read	Rekviziterstvo - branje	f
00030000-55fb-c446-5737-630917d8af73	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	f
00030000-55fb-c446-f271-6ac751669c70	Rekvizit-read	Rekvizit - branje	f
00030000-55fb-c446-2b0c-fdf4add8225c	Rekvizit-write	Rekvizit - spreminjanje	f
00030000-55fb-c446-c49a-b9c8769eafed	Revizija-read	Revizija - branje	f
00030000-55fb-c446-d706-98dc6e725b1f	Revizija-write	Revizija - spreminjanje	f
00030000-55fb-c446-6a46-f3dc41321842	Rezervacija-read	Rezervacija - branje	f
00030000-55fb-c446-dad1-0c031bf97b2e	Rezervacija-write	Rezervacija - spreminjanje	f
00030000-55fb-c446-d432-b18b185a57c4	SedezniRed-read	SedezniRed - branje	f
00030000-55fb-c446-dc1b-e8bfb74ed215	SedezniRed-write	SedezniRed - spreminjanje	f
00030000-55fb-c446-af39-c0fbe3da8517	Sedez-read	Sedez - branje	f
00030000-55fb-c446-2f9f-ce70996987f8	Sedez-write	Sedez - spreminjanje	f
00030000-55fb-c446-1dd9-012a3c44f7be	Sezona-read	Sezona - branje	f
00030000-55fb-c446-f7c6-73eea03c5d04	Sezona-write	Sezona - spreminjanje	f
00030000-55fb-c446-a590-a3fd51000679	StevilcenjeKonfig-read	StevilcenjeKonfig - branje	f
00030000-55fb-c446-f005-54e8be5b1359	StevilcenjeKonfig-write	StevilcenjeKonfig - spreminjanje	f
00030000-55fb-c446-433e-98d0795e2115	Stevilcenje-read	Stevilcenje - branje	f
00030000-55fb-c446-9957-a6f3eadde66e	Stevilcenje-write	Stevilcenje - spreminjanje	f
00030000-55fb-c446-7bdf-4c47c3370113	StevilcenjeStanje-read	StevilcenjeStanje - branje	f
00030000-55fb-c446-14dd-d814aaa6ec2f	StevilcenjeStanje-write	StevilcenjeStanje - spreminjanje	f
00030000-55fb-c446-ee9b-42051848884f	StrosekUprizoritve-read	StrosekUprizoritve - branje	f
00030000-55fb-c446-89ee-b6bfdd9157b9	StrosekUprizoritve-write	StrosekUprizoritve - spreminjanje	f
00030000-55fb-c446-8d86-2e1465a9080b	Telefonska-read	Telefonska - branje	f
00030000-55fb-c446-d484-f9de44a6a6ef	Telefonska-write	Telefonska - spreminjanje	f
00030000-55fb-c446-9923-b63ea74d71b5	TerminStoritve-read	TerminStoritve - branje	f
00030000-55fb-c446-8ea9-a333c654842e	TerminStoritve-write	TerminStoritve - spreminjanje	f
00030000-55fb-c446-7341-418ac7e210f6	TipFunkcije-read	TipFunkcije - branje	f
00030000-55fb-c446-3477-e8690fc020a9	TipFunkcije-write	TipFunkcije - spreminjanje	f
00030000-55fb-c446-f818-e0e76e4b71e5	TipProgramskeEnote-read	TipProgramskeEnote - branje	f
00030000-55fb-c446-033a-1c6717a6c5c8	TipProgramskeEnote-write	TipProgramskeEnote - spreminjanje	f
00030000-55fb-c446-1fea-de262aeab83e	Trr-read	Trr - branje	f
00030000-55fb-c446-8ce5-a4f082dbc18c	Trr-write	Trr - spreminjanje	f
00030000-55fb-c446-e926-a9b8be20b774	Uprizoritev-read	Uprizoritev - branje	f
00030000-55fb-c446-f84e-8d956918ae7c	Uprizoritev-write	Uprizoritev - spreminjanje	f
00030000-55fb-c446-07e3-f8ecd6faaac6	Vaja-read	Vaja - branje	f
00030000-55fb-c446-4036-b2bdd4aadc3b	Vaja-write	Vaja - spreminjanje	f
00030000-55fb-c446-7b4f-45603b82092c	VrstaSedezev-read	VrstaSedezev - branje	f
00030000-55fb-c446-bf5f-ad622c11e0fd	VrstaSedezev-write	VrstaSedezev - spreminjanje	f
00030000-55fb-c446-6a1b-b369e67e5239	VrstaStroska-read	VrstaStroska - branje	f
00030000-55fb-c446-3d88-37b1a447ed23	VrstaStroska-write	VrstaStroska - spreminjanje	f
00030000-55fb-c446-3930-cf93a6bec05b	Zaposlitev-read	Zaposlitev - branje	f
00030000-55fb-c446-63db-db0d43b561f5	Zaposlitev-write	Zaposlitev - spreminjanje	f
00030000-55fb-c446-72e6-eab8931eb652	Zasedenost-read	Zasedenost - branje	f
00030000-55fb-c446-aba3-56ef9c0596cd	Zasedenost-write	Zasedenost - spreminjanje	f
00030000-55fb-c446-f252-d3725eabe2a8	ZvrstSurs-read	ZvrstSurs - branje	f
00030000-55fb-c446-7d3c-1dd240c89971	ZvrstSurs-write	ZvrstSurs - spreminjanje	f
00030000-55fb-c446-63f0-a6735f56e67b	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	f
00030000-55fb-c446-8c00-b6becec5b1b0	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	f
00030000-55fb-c446-6770-5af2351cceee	Mapa-write	Mapa - osnovno dovoljenje za pisanje	f
00030000-55fb-c446-bc31-460a34357fb1	Mapa-read	Mapa - osnovno dovoljenje za branje	f
00030000-55fb-c446-e1f6-b3e4bf357575	MapaAcl-write	MapaAcl - dovoljenje za dostop pisanje ACL-jev mape	f
00030000-55fb-c446-23b8-9aa444ad6aa9	MapaAcl-read	MapaAcl - dovoljenje za dostop branje ACL-jev mape	f
00030000-55fb-c446-67e6-ec24f31cb2a8	Zapis-write	Zapis - dovoljenje za pisanje zapisov	f
00030000-55fb-c446-ee73-806fd01dafed	Zapis-read	Zapis - dovoljenje za pisanje zapisov	f
00030000-55fb-c446-2f8b-b734bc83a5c2	ZapisLastnik-write	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	f
00030000-55fb-c446-b774-f0990067fb7c	ZapisLastnik-read	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	f
00030000-55fb-c446-7e4a-f937cbbb56ed	VrstaZapisa-write	Šifrant vrst zapisa - spreminjanje	f
00030000-55fb-c446-b4a4-9d1d2b361e65	VrstaZapisa-read	Šifrant vrst zapisa - branje	f
00030000-55fb-c446-f9b9-57b71e7f95aa	Datoteka-write	Datoteka - spreminjanje	f
00030000-55fb-c446-e800-47351babfd33	Datoteka-read	Datoteke - branje	f
\.


--
-- TOC entry 2936 (class 0 OID 19993205)
-- Dependencies: 180
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-55fb-c446-67d7-1e1b36cc7623	00030000-55fb-c446-feda-bc390c537dea
00020000-55fb-c446-6f98-54a500158eb0	00030000-55fb-c446-9602-df1a9c5a0ac9
00020000-55fb-c446-5c9c-579b45edf932	00030000-55fb-c446-c70e-5a797c0029d9
00020000-55fb-c446-5c9c-579b45edf932	00030000-55fb-c446-d5ca-a8ac29090a89
00020000-55fb-c446-5c9c-579b45edf932	00030000-55fb-c446-87b6-2fc80929b1dd
00020000-55fb-c446-5c9c-579b45edf932	00030000-55fb-c446-9950-74a6fc9db1a8
00020000-55fb-c446-5c9c-579b45edf932	00030000-55fb-c446-3c84-4c5e1c72c715
00020000-55fb-c446-5c9c-579b45edf932	00030000-55fb-c446-3326-32ae35f36e49
00020000-55fb-c446-5c9c-579b45edf932	00030000-55fb-c446-10f1-6eb34a7fcf66
00020000-55fb-c446-5c9c-579b45edf932	00030000-55fb-c446-0216-707161bcbeb2
00020000-55fb-c446-5c9c-579b45edf932	00030000-55fb-c446-9602-df1a9c5a0ac9
00020000-55fb-c446-5c9c-579b45edf932	00030000-55fb-c446-ce23-d868cadf014e
00020000-55fb-c446-5c9c-579b45edf932	00030000-55fb-c446-8784-729a355637d3
00020000-55fb-c446-5c9c-579b45edf932	00030000-55fb-c446-ddbf-078c74017321
00020000-55fb-c446-5c9c-579b45edf932	00030000-55fb-c446-8213-aa14c2f2452c
00020000-55fb-c446-5c9c-579b45edf932	00030000-55fb-c446-de3b-ccafba3be347
00020000-55fb-c446-5c9c-579b45edf932	00030000-55fb-c446-4b77-5dc61a64fd65
00020000-55fb-c446-5c9c-579b45edf932	00030000-55fb-c446-9efc-db6ddc327945
00020000-55fb-c446-5c9c-579b45edf932	00030000-55fb-c446-f0d5-9c1d815806a1
00020000-55fb-c446-5c9c-579b45edf932	00030000-55fb-c446-e88d-bfe004a3db27
00020000-55fb-c446-5c9c-579b45edf932	00030000-55fb-c446-ae01-d1b998e65187
00020000-55fb-c446-5c9c-579b45edf932	00030000-55fb-c446-3877-7ad81d2488a0
00020000-55fb-c446-5c9c-579b45edf932	00030000-55fb-c446-8d92-4d7d2bf943d2
00020000-55fb-c446-5c9c-579b45edf932	00030000-55fb-c446-16ac-ba63c3d60f7b
00020000-55fb-c446-5c9c-579b45edf932	00030000-55fb-c446-3afd-0aa2071c6cc2
00020000-55fb-c446-5c9c-579b45edf932	00030000-55fb-c446-3a7a-d7ceaa12dfe8
00020000-55fb-c446-5c9c-579b45edf932	00030000-55fb-c446-7664-c98982771471
00020000-55fb-c446-5c9c-579b45edf932	00030000-55fb-c446-cdd6-52343650c8c2
00020000-55fb-c446-5c9c-579b45edf932	00030000-55fb-c446-f505-00a76b448329
00020000-55fb-c446-5c9c-579b45edf932	00030000-55fb-c446-8dd9-77ad1c6a6ba4
00020000-55fb-c446-5c9c-579b45edf932	00030000-55fb-c446-ec25-bf146580913b
00020000-55fb-c446-5c9c-579b45edf932	00030000-55fb-c446-5e52-4131b4b7e2ad
00020000-55fb-c446-5c9c-579b45edf932	00030000-55fb-c446-fa5d-885a256ac376
00020000-55fb-c446-5c9c-579b45edf932	00030000-55fb-c446-f67e-8cde526c622c
00020000-55fb-c446-5c9c-579b45edf932	00030000-55fb-c446-7b03-5a31764ef07e
00020000-55fb-c446-5c9c-579b45edf932	00030000-55fb-c446-399d-7da2770a43a2
00020000-55fb-c446-5c9c-579b45edf932	00030000-55fb-c446-d0c7-febde809779d
00020000-55fb-c446-5c9c-579b45edf932	00030000-55fb-c446-5737-630917d8af73
00020000-55fb-c446-5c9c-579b45edf932	00030000-55fb-c446-f271-6ac751669c70
00020000-55fb-c446-5c9c-579b45edf932	00030000-55fb-c446-2b0c-fdf4add8225c
00020000-55fb-c446-5c9c-579b45edf932	00030000-55fb-c446-1dd9-012a3c44f7be
00020000-55fb-c446-5c9c-579b45edf932	00030000-55fb-c446-f7c6-73eea03c5d04
00020000-55fb-c446-5c9c-579b45edf932	00030000-55fb-c446-7341-418ac7e210f6
00020000-55fb-c446-5c9c-579b45edf932	00030000-55fb-c446-e926-a9b8be20b774
00020000-55fb-c446-5c9c-579b45edf932	00030000-55fb-c446-f84e-8d956918ae7c
00020000-55fb-c446-5c9c-579b45edf932	00030000-55fb-c446-07e3-f8ecd6faaac6
00020000-55fb-c446-5c9c-579b45edf932	00030000-55fb-c446-4036-b2bdd4aadc3b
00020000-55fb-c446-5c9c-579b45edf932	00030000-55fb-c446-72e6-eab8931eb652
00020000-55fb-c446-5c9c-579b45edf932	00030000-55fb-c446-aba3-56ef9c0596cd
00020000-55fb-c446-5c9c-579b45edf932	00030000-55fb-c446-f252-d3725eabe2a8
00020000-55fb-c446-5c9c-579b45edf932	00030000-55fb-c446-63f0-a6735f56e67b
00020000-55fb-c446-8dba-1d0e44f40fa7	00030000-55fb-c446-c70e-5a797c0029d9
00020000-55fb-c446-8dba-1d0e44f40fa7	00030000-55fb-c446-3c84-4c5e1c72c715
00020000-55fb-c446-8dba-1d0e44f40fa7	00030000-55fb-c446-3326-32ae35f36e49
00020000-55fb-c446-8dba-1d0e44f40fa7	00030000-55fb-c446-9602-df1a9c5a0ac9
00020000-55fb-c446-8dba-1d0e44f40fa7	00030000-55fb-c446-8213-aa14c2f2452c
00020000-55fb-c446-8dba-1d0e44f40fa7	00030000-55fb-c446-4b77-5dc61a64fd65
00020000-55fb-c446-8dba-1d0e44f40fa7	00030000-55fb-c446-f0d5-9c1d815806a1
00020000-55fb-c446-8dba-1d0e44f40fa7	00030000-55fb-c446-e88d-bfe004a3db27
00020000-55fb-c446-8dba-1d0e44f40fa7	00030000-55fb-c446-ae01-d1b998e65187
00020000-55fb-c446-8dba-1d0e44f40fa7	00030000-55fb-c446-3877-7ad81d2488a0
00020000-55fb-c446-8dba-1d0e44f40fa7	00030000-55fb-c446-8d92-4d7d2bf943d2
00020000-55fb-c446-8dba-1d0e44f40fa7	00030000-55fb-c446-16ac-ba63c3d60f7b
00020000-55fb-c446-8dba-1d0e44f40fa7	00030000-55fb-c446-3afd-0aa2071c6cc2
00020000-55fb-c446-8dba-1d0e44f40fa7	00030000-55fb-c446-7664-c98982771471
00020000-55fb-c446-8dba-1d0e44f40fa7	00030000-55fb-c446-f505-00a76b448329
00020000-55fb-c446-8dba-1d0e44f40fa7	00030000-55fb-c446-8dd9-77ad1c6a6ba4
00020000-55fb-c446-8dba-1d0e44f40fa7	00030000-55fb-c446-ec25-bf146580913b
00020000-55fb-c446-8dba-1d0e44f40fa7	00030000-55fb-c446-7b03-5a31764ef07e
00020000-55fb-c446-8dba-1d0e44f40fa7	00030000-55fb-c446-d0c7-febde809779d
00020000-55fb-c446-8dba-1d0e44f40fa7	00030000-55fb-c446-f271-6ac751669c70
00020000-55fb-c446-8dba-1d0e44f40fa7	00030000-55fb-c446-1dd9-012a3c44f7be
00020000-55fb-c446-8dba-1d0e44f40fa7	00030000-55fb-c446-8d86-2e1465a9080b
00020000-55fb-c446-8dba-1d0e44f40fa7	00030000-55fb-c446-d484-f9de44a6a6ef
00020000-55fb-c446-8dba-1d0e44f40fa7	00030000-55fb-c446-1fea-de262aeab83e
00020000-55fb-c446-8dba-1d0e44f40fa7	00030000-55fb-c446-8ce5-a4f082dbc18c
00020000-55fb-c446-8dba-1d0e44f40fa7	00030000-55fb-c446-3930-cf93a6bec05b
00020000-55fb-c446-8dba-1d0e44f40fa7	00030000-55fb-c446-63db-db0d43b561f5
00020000-55fb-c446-8dba-1d0e44f40fa7	00030000-55fb-c446-f252-d3725eabe2a8
00020000-55fb-c446-8dba-1d0e44f40fa7	00030000-55fb-c446-63f0-a6735f56e67b
00020000-55fb-c446-d04a-d41d3f10185a	00030000-55fb-c446-c70e-5a797c0029d9
00020000-55fb-c446-d04a-d41d3f10185a	00030000-55fb-c446-87b6-2fc80929b1dd
00020000-55fb-c446-d04a-d41d3f10185a	00030000-55fb-c446-3c84-4c5e1c72c715
00020000-55fb-c446-d04a-d41d3f10185a	00030000-55fb-c446-2093-db01b347fb05
00020000-55fb-c446-d04a-d41d3f10185a	00030000-55fb-c446-4041-19e63d92e660
00020000-55fb-c446-d04a-d41d3f10185a	00030000-55fb-c446-172e-29e364e1b2aa
00020000-55fb-c446-d04a-d41d3f10185a	00030000-55fb-c446-3326-32ae35f36e49
00020000-55fb-c446-d04a-d41d3f10185a	00030000-55fb-c446-9602-df1a9c5a0ac9
00020000-55fb-c446-d04a-d41d3f10185a	00030000-55fb-c446-8784-729a355637d3
00020000-55fb-c446-d04a-d41d3f10185a	00030000-55fb-c446-8213-aa14c2f2452c
00020000-55fb-c446-d04a-d41d3f10185a	00030000-55fb-c446-4b77-5dc61a64fd65
00020000-55fb-c446-d04a-d41d3f10185a	00030000-55fb-c446-f0d5-9c1d815806a1
00020000-55fb-c446-d04a-d41d3f10185a	00030000-55fb-c446-ae01-d1b998e65187
00020000-55fb-c446-d04a-d41d3f10185a	00030000-55fb-c446-3877-7ad81d2488a0
00020000-55fb-c446-d04a-d41d3f10185a	00030000-55fb-c446-8d92-4d7d2bf943d2
00020000-55fb-c446-d04a-d41d3f10185a	00030000-55fb-c446-3afd-0aa2071c6cc2
00020000-55fb-c446-d04a-d41d3f10185a	00030000-55fb-c446-7664-c98982771471
00020000-55fb-c446-d04a-d41d3f10185a	00030000-55fb-c446-ec25-bf146580913b
00020000-55fb-c446-d04a-d41d3f10185a	00030000-55fb-c446-fa5d-885a256ac376
00020000-55fb-c446-d04a-d41d3f10185a	00030000-55fb-c446-7b03-5a31764ef07e
00020000-55fb-c446-d04a-d41d3f10185a	00030000-55fb-c446-d0c7-febde809779d
00020000-55fb-c446-d04a-d41d3f10185a	00030000-55fb-c446-f271-6ac751669c70
00020000-55fb-c446-d04a-d41d3f10185a	00030000-55fb-c446-1dd9-012a3c44f7be
00020000-55fb-c446-d04a-d41d3f10185a	00030000-55fb-c446-7341-418ac7e210f6
00020000-55fb-c446-d04a-d41d3f10185a	00030000-55fb-c446-07e3-f8ecd6faaac6
00020000-55fb-c446-d04a-d41d3f10185a	00030000-55fb-c446-72e6-eab8931eb652
00020000-55fb-c446-d04a-d41d3f10185a	00030000-55fb-c446-f252-d3725eabe2a8
00020000-55fb-c446-d04a-d41d3f10185a	00030000-55fb-c446-63f0-a6735f56e67b
00020000-55fb-c446-c2c9-9aac720db79a	00030000-55fb-c446-c70e-5a797c0029d9
00020000-55fb-c446-c2c9-9aac720db79a	00030000-55fb-c446-d5ca-a8ac29090a89
00020000-55fb-c446-c2c9-9aac720db79a	00030000-55fb-c446-9950-74a6fc9db1a8
00020000-55fb-c446-c2c9-9aac720db79a	00030000-55fb-c446-3c84-4c5e1c72c715
00020000-55fb-c446-c2c9-9aac720db79a	00030000-55fb-c446-3326-32ae35f36e49
00020000-55fb-c446-c2c9-9aac720db79a	00030000-55fb-c446-9602-df1a9c5a0ac9
00020000-55fb-c446-c2c9-9aac720db79a	00030000-55fb-c446-8213-aa14c2f2452c
00020000-55fb-c446-c2c9-9aac720db79a	00030000-55fb-c446-4b77-5dc61a64fd65
00020000-55fb-c446-c2c9-9aac720db79a	00030000-55fb-c446-ae01-d1b998e65187
00020000-55fb-c446-c2c9-9aac720db79a	00030000-55fb-c446-3877-7ad81d2488a0
00020000-55fb-c446-c2c9-9aac720db79a	00030000-55fb-c446-3afd-0aa2071c6cc2
00020000-55fb-c446-c2c9-9aac720db79a	00030000-55fb-c446-7664-c98982771471
00020000-55fb-c446-c2c9-9aac720db79a	00030000-55fb-c446-ec25-bf146580913b
00020000-55fb-c446-c2c9-9aac720db79a	00030000-55fb-c446-7b03-5a31764ef07e
00020000-55fb-c446-c2c9-9aac720db79a	00030000-55fb-c446-d0c7-febde809779d
00020000-55fb-c446-c2c9-9aac720db79a	00030000-55fb-c446-f271-6ac751669c70
00020000-55fb-c446-c2c9-9aac720db79a	00030000-55fb-c446-1dd9-012a3c44f7be
00020000-55fb-c446-c2c9-9aac720db79a	00030000-55fb-c446-7341-418ac7e210f6
00020000-55fb-c446-c2c9-9aac720db79a	00030000-55fb-c446-f252-d3725eabe2a8
00020000-55fb-c446-c2c9-9aac720db79a	00030000-55fb-c446-63f0-a6735f56e67b
00020000-55fb-c446-77c1-286a72b237ff	00030000-55fb-c446-c70e-5a797c0029d9
00020000-55fb-c446-77c1-286a72b237ff	00030000-55fb-c446-3c84-4c5e1c72c715
00020000-55fb-c446-77c1-286a72b237ff	00030000-55fb-c446-3326-32ae35f36e49
00020000-55fb-c446-77c1-286a72b237ff	00030000-55fb-c446-9602-df1a9c5a0ac9
00020000-55fb-c446-77c1-286a72b237ff	00030000-55fb-c446-8213-aa14c2f2452c
00020000-55fb-c446-77c1-286a72b237ff	00030000-55fb-c446-4b77-5dc61a64fd65
00020000-55fb-c446-77c1-286a72b237ff	00030000-55fb-c446-ae01-d1b998e65187
00020000-55fb-c446-77c1-286a72b237ff	00030000-55fb-c446-3877-7ad81d2488a0
00020000-55fb-c446-77c1-286a72b237ff	00030000-55fb-c446-3afd-0aa2071c6cc2
00020000-55fb-c446-77c1-286a72b237ff	00030000-55fb-c446-7664-c98982771471
00020000-55fb-c446-77c1-286a72b237ff	00030000-55fb-c446-ec25-bf146580913b
00020000-55fb-c446-77c1-286a72b237ff	00030000-55fb-c446-7b03-5a31764ef07e
00020000-55fb-c446-77c1-286a72b237ff	00030000-55fb-c446-d0c7-febde809779d
00020000-55fb-c446-77c1-286a72b237ff	00030000-55fb-c446-f271-6ac751669c70
00020000-55fb-c446-77c1-286a72b237ff	00030000-55fb-c446-1dd9-012a3c44f7be
00020000-55fb-c446-77c1-286a72b237ff	00030000-55fb-c446-9923-b63ea74d71b5
00020000-55fb-c446-77c1-286a72b237ff	00030000-55fb-c446-d8bf-61ede78d5532
00020000-55fb-c446-77c1-286a72b237ff	00030000-55fb-c446-7341-418ac7e210f6
00020000-55fb-c446-77c1-286a72b237ff	00030000-55fb-c446-f252-d3725eabe2a8
00020000-55fb-c446-77c1-286a72b237ff	00030000-55fb-c446-63f0-a6735f56e67b
00020000-55fb-c447-0a0b-d1b07a2223e2	00030000-55fb-c446-4cfe-f67c879bdd84
00020000-55fb-c447-0a0b-d1b07a2223e2	00030000-55fb-c446-feda-bc390c537dea
00020000-55fb-c447-0a0b-d1b07a2223e2	00030000-55fb-c446-d8bf-61ede78d5532
00020000-55fb-c447-0a0b-d1b07a2223e2	00030000-55fb-c446-10f1-6eb34a7fcf66
00020000-55fb-c447-0a0b-d1b07a2223e2	00030000-55fb-c446-7612-ab337c7cd588
00020000-55fb-c447-0a0b-d1b07a2223e2	00030000-55fb-c446-6c62-02af10a48225
00020000-55fb-c447-0a0b-d1b07a2223e2	00030000-55fb-c446-038d-206c616afba3
00020000-55fb-c447-0a0b-d1b07a2223e2	00030000-55fb-c446-c70e-5a797c0029d9
00020000-55fb-c447-0a0b-d1b07a2223e2	00030000-55fb-c446-d5ca-a8ac29090a89
00020000-55fb-c447-0a0b-d1b07a2223e2	00030000-55fb-c446-87b6-2fc80929b1dd
00020000-55fb-c447-0a0b-d1b07a2223e2	00030000-55fb-c446-9950-74a6fc9db1a8
00020000-55fb-c447-0a0b-d1b07a2223e2	00030000-55fb-c446-3c84-4c5e1c72c715
00020000-55fb-c447-0a0b-d1b07a2223e2	00030000-55fb-c446-2093-db01b347fb05
00020000-55fb-c447-0a0b-d1b07a2223e2	00030000-55fb-c446-4041-19e63d92e660
00020000-55fb-c447-0a0b-d1b07a2223e2	00030000-55fb-c446-e8bc-c690dabec23f
00020000-55fb-c447-0a0b-d1b07a2223e2	00030000-55fb-c446-172e-29e364e1b2aa
00020000-55fb-c447-0a0b-d1b07a2223e2	00030000-55fb-c446-ba44-543ef2406d8f
00020000-55fb-c447-0a0b-d1b07a2223e2	00030000-55fb-c446-3326-32ae35f36e49
00020000-55fb-c447-0a0b-d1b07a2223e2	00030000-55fb-c446-0216-707161bcbeb2
00020000-55fb-c447-0a0b-d1b07a2223e2	00030000-55fb-c446-9602-df1a9c5a0ac9
00020000-55fb-c447-0a0b-d1b07a2223e2	00030000-55fb-c446-ce23-d868cadf014e
00020000-55fb-c447-0a0b-d1b07a2223e2	00030000-55fb-c446-3270-ec6041abeac8
00020000-55fb-c447-0a0b-d1b07a2223e2	00030000-55fb-c446-c768-7eae2058650c
00020000-55fb-c447-0a0b-d1b07a2223e2	00030000-55fb-c446-928d-f7c5f744632b
00020000-55fb-c447-0a0b-d1b07a2223e2	00030000-55fb-c446-d36b-92b9178a0918
00020000-55fb-c447-0a0b-d1b07a2223e2	00030000-55fb-c446-8784-729a355637d3
00020000-55fb-c447-0a0b-d1b07a2223e2	00030000-55fb-c446-ddbf-078c74017321
00020000-55fb-c447-0a0b-d1b07a2223e2	00030000-55fb-c446-8213-aa14c2f2452c
00020000-55fb-c447-0a0b-d1b07a2223e2	00030000-55fb-c446-de3b-ccafba3be347
00020000-55fb-c447-0a0b-d1b07a2223e2	00030000-55fb-c446-4b77-5dc61a64fd65
00020000-55fb-c447-0a0b-d1b07a2223e2	00030000-55fb-c446-9efc-db6ddc327945
00020000-55fb-c447-0a0b-d1b07a2223e2	00030000-55fb-c446-f0d5-9c1d815806a1
00020000-55fb-c447-0a0b-d1b07a2223e2	00030000-55fb-c446-e88d-bfe004a3db27
00020000-55fb-c447-0a0b-d1b07a2223e2	00030000-55fb-c446-d016-8cfb7487f771
00020000-55fb-c447-0a0b-d1b07a2223e2	00030000-55fb-c446-e1d3-3642aee24aa7
00020000-55fb-c447-0a0b-d1b07a2223e2	00030000-55fb-c446-9d87-fd136baf407e
00020000-55fb-c447-0a0b-d1b07a2223e2	00030000-55fb-c446-3a31-f26103076cd6
00020000-55fb-c447-0a0b-d1b07a2223e2	00030000-55fb-c446-ae01-d1b998e65187
00020000-55fb-c447-0a0b-d1b07a2223e2	00030000-55fb-c446-601a-5d0cb6f7a5d5
00020000-55fb-c447-0a0b-d1b07a2223e2	00030000-55fb-c446-3877-7ad81d2488a0
00020000-55fb-c447-0a0b-d1b07a2223e2	00030000-55fb-c446-ba91-61f6e979e727
00020000-55fb-c447-0a0b-d1b07a2223e2	00030000-55fb-c446-8d92-4d7d2bf943d2
00020000-55fb-c447-0a0b-d1b07a2223e2	00030000-55fb-c446-16ac-ba63c3d60f7b
00020000-55fb-c447-0a0b-d1b07a2223e2	00030000-55fb-c446-b781-e5b6cee8e428
00020000-55fb-c447-0a0b-d1b07a2223e2	00030000-55fb-c446-a811-1ad6b6a5ad3f
00020000-55fb-c447-0a0b-d1b07a2223e2	00030000-55fb-c446-968c-82a45901a759
00020000-55fb-c447-0a0b-d1b07a2223e2	00030000-55fb-c446-5dde-2823cbfb39da
00020000-55fb-c447-0a0b-d1b07a2223e2	00030000-55fb-c446-dd38-3e408c523e46
00020000-55fb-c447-0a0b-d1b07a2223e2	00030000-55fb-c446-5748-e9104ccb6899
00020000-55fb-c447-0a0b-d1b07a2223e2	00030000-55fb-c446-3afd-0aa2071c6cc2
00020000-55fb-c447-0a0b-d1b07a2223e2	00030000-55fb-c446-3a7a-d7ceaa12dfe8
00020000-55fb-c447-0a0b-d1b07a2223e2	00030000-55fb-c446-7664-c98982771471
00020000-55fb-c447-0a0b-d1b07a2223e2	00030000-55fb-c446-cdd6-52343650c8c2
00020000-55fb-c447-0a0b-d1b07a2223e2	00030000-55fb-c446-46cb-2c1870765e38
00020000-55fb-c447-0a0b-d1b07a2223e2	00030000-55fb-c446-806f-034b3faf0982
00020000-55fb-c447-0a0b-d1b07a2223e2	00030000-55fb-c446-c62d-9df3a88bb80f
00020000-55fb-c447-0a0b-d1b07a2223e2	00030000-55fb-c446-af32-dddea9cfe4f6
00020000-55fb-c447-0a0b-d1b07a2223e2	00030000-55fb-c446-f505-00a76b448329
00020000-55fb-c447-0a0b-d1b07a2223e2	00030000-55fb-c446-8dd9-77ad1c6a6ba4
00020000-55fb-c447-0a0b-d1b07a2223e2	00030000-55fb-c446-ec25-bf146580913b
00020000-55fb-c447-0a0b-d1b07a2223e2	00030000-55fb-c446-5e52-4131b4b7e2ad
00020000-55fb-c447-0a0b-d1b07a2223e2	00030000-55fb-c446-5b0c-52d03dc425a7
00020000-55fb-c447-0a0b-d1b07a2223e2	00030000-55fb-c446-e61b-2d6f4cfe9d55
00020000-55fb-c447-0a0b-d1b07a2223e2	00030000-55fb-c446-744c-c9b0cb58a17b
00020000-55fb-c447-0a0b-d1b07a2223e2	00030000-55fb-c446-aa9b-329f4d225008
00020000-55fb-c447-0a0b-d1b07a2223e2	00030000-55fb-c446-fa5d-885a256ac376
00020000-55fb-c447-0a0b-d1b07a2223e2	00030000-55fb-c446-f67e-8cde526c622c
00020000-55fb-c447-0a0b-d1b07a2223e2	00030000-55fb-c446-b252-77ec4ab51cbe
00020000-55fb-c447-0a0b-d1b07a2223e2	00030000-55fb-c446-bf34-0cd1bbb1c4dc
00020000-55fb-c447-0a0b-d1b07a2223e2	00030000-55fb-c446-f2be-e17c3ef7b93d
00020000-55fb-c447-0a0b-d1b07a2223e2	00030000-55fb-c446-2383-0b011a9bc759
00020000-55fb-c447-0a0b-d1b07a2223e2	00030000-55fb-c446-d496-4af5fef882d0
00020000-55fb-c447-0a0b-d1b07a2223e2	00030000-55fb-c446-5e25-c64626d51570
00020000-55fb-c447-0a0b-d1b07a2223e2	00030000-55fb-c446-7845-345756df2e0c
00020000-55fb-c447-0a0b-d1b07a2223e2	00030000-55fb-c446-4db7-6ff8f03cf092
00020000-55fb-c447-0a0b-d1b07a2223e2	00030000-55fb-c446-a0db-685ac0cc16f0
00020000-55fb-c447-0a0b-d1b07a2223e2	00030000-55fb-c446-be89-190582bd5856
00020000-55fb-c447-0a0b-d1b07a2223e2	00030000-55fb-c446-2ba8-423610d82f1d
00020000-55fb-c447-0a0b-d1b07a2223e2	00030000-55fb-c446-15c2-01b600729f09
00020000-55fb-c447-0a0b-d1b07a2223e2	00030000-55fb-c446-32a8-b8aa9489dadf
00020000-55fb-c447-0a0b-d1b07a2223e2	00030000-55fb-c446-6f2f-145f992a8d8f
00020000-55fb-c447-0a0b-d1b07a2223e2	00030000-55fb-c446-ab19-fc272a245c69
00020000-55fb-c447-0a0b-d1b07a2223e2	00030000-55fb-c446-50b1-e8e0c5c73300
00020000-55fb-c447-0a0b-d1b07a2223e2	00030000-55fb-c446-2034-db76dcf6a5be
00020000-55fb-c447-0a0b-d1b07a2223e2	00030000-55fb-c446-b2cd-5c5ced50e76a
00020000-55fb-c447-0a0b-d1b07a2223e2	00030000-55fb-c446-fbc7-3ae2bcea1cee
00020000-55fb-c447-0a0b-d1b07a2223e2	00030000-55fb-c446-ad67-45ddc1710939
00020000-55fb-c447-0a0b-d1b07a2223e2	00030000-55fb-c446-7b03-5a31764ef07e
00020000-55fb-c447-0a0b-d1b07a2223e2	00030000-55fb-c446-399d-7da2770a43a2
00020000-55fb-c447-0a0b-d1b07a2223e2	00030000-55fb-c446-293b-e492058ebdbc
00020000-55fb-c447-0a0b-d1b07a2223e2	00030000-55fb-c446-dcd8-d06ca542cfe8
00020000-55fb-c447-0a0b-d1b07a2223e2	00030000-55fb-c446-984b-7ed7dfe1a6b0
00020000-55fb-c447-0a0b-d1b07a2223e2	00030000-55fb-c446-ca74-2ecdd8ccfef7
00020000-55fb-c447-0a0b-d1b07a2223e2	00030000-55fb-c446-d0c7-febde809779d
00020000-55fb-c447-0a0b-d1b07a2223e2	00030000-55fb-c446-5737-630917d8af73
00020000-55fb-c447-0a0b-d1b07a2223e2	00030000-55fb-c446-f271-6ac751669c70
00020000-55fb-c447-0a0b-d1b07a2223e2	00030000-55fb-c446-2b0c-fdf4add8225c
00020000-55fb-c447-0a0b-d1b07a2223e2	00030000-55fb-c446-c49a-b9c8769eafed
00020000-55fb-c447-0a0b-d1b07a2223e2	00030000-55fb-c446-d706-98dc6e725b1f
00020000-55fb-c447-0a0b-d1b07a2223e2	00030000-55fb-c446-6a46-f3dc41321842
00020000-55fb-c447-0a0b-d1b07a2223e2	00030000-55fb-c446-dad1-0c031bf97b2e
00020000-55fb-c447-0a0b-d1b07a2223e2	00030000-55fb-c446-d432-b18b185a57c4
00020000-55fb-c447-0a0b-d1b07a2223e2	00030000-55fb-c446-dc1b-e8bfb74ed215
00020000-55fb-c447-0a0b-d1b07a2223e2	00030000-55fb-c446-af39-c0fbe3da8517
00020000-55fb-c447-0a0b-d1b07a2223e2	00030000-55fb-c446-2f9f-ce70996987f8
00020000-55fb-c447-0a0b-d1b07a2223e2	00030000-55fb-c446-1dd9-012a3c44f7be
00020000-55fb-c447-0a0b-d1b07a2223e2	00030000-55fb-c446-f7c6-73eea03c5d04
00020000-55fb-c447-0a0b-d1b07a2223e2	00030000-55fb-c446-a590-a3fd51000679
00020000-55fb-c447-0a0b-d1b07a2223e2	00030000-55fb-c446-f005-54e8be5b1359
00020000-55fb-c447-0a0b-d1b07a2223e2	00030000-55fb-c446-433e-98d0795e2115
00020000-55fb-c447-0a0b-d1b07a2223e2	00030000-55fb-c446-9957-a6f3eadde66e
00020000-55fb-c447-0a0b-d1b07a2223e2	00030000-55fb-c446-7bdf-4c47c3370113
00020000-55fb-c447-0a0b-d1b07a2223e2	00030000-55fb-c446-14dd-d814aaa6ec2f
00020000-55fb-c447-0a0b-d1b07a2223e2	00030000-55fb-c446-ee9b-42051848884f
00020000-55fb-c447-0a0b-d1b07a2223e2	00030000-55fb-c446-89ee-b6bfdd9157b9
00020000-55fb-c447-0a0b-d1b07a2223e2	00030000-55fb-c446-8d86-2e1465a9080b
00020000-55fb-c447-0a0b-d1b07a2223e2	00030000-55fb-c446-d484-f9de44a6a6ef
00020000-55fb-c447-0a0b-d1b07a2223e2	00030000-55fb-c446-9923-b63ea74d71b5
00020000-55fb-c447-0a0b-d1b07a2223e2	00030000-55fb-c446-8ea9-a333c654842e
00020000-55fb-c447-0a0b-d1b07a2223e2	00030000-55fb-c446-7341-418ac7e210f6
00020000-55fb-c447-0a0b-d1b07a2223e2	00030000-55fb-c446-3477-e8690fc020a9
00020000-55fb-c447-0a0b-d1b07a2223e2	00030000-55fb-c446-f818-e0e76e4b71e5
00020000-55fb-c447-0a0b-d1b07a2223e2	00030000-55fb-c446-033a-1c6717a6c5c8
00020000-55fb-c447-0a0b-d1b07a2223e2	00030000-55fb-c446-1fea-de262aeab83e
00020000-55fb-c447-0a0b-d1b07a2223e2	00030000-55fb-c446-8ce5-a4f082dbc18c
00020000-55fb-c447-0a0b-d1b07a2223e2	00030000-55fb-c446-e926-a9b8be20b774
00020000-55fb-c447-0a0b-d1b07a2223e2	00030000-55fb-c446-f84e-8d956918ae7c
00020000-55fb-c447-0a0b-d1b07a2223e2	00030000-55fb-c446-07e3-f8ecd6faaac6
00020000-55fb-c447-0a0b-d1b07a2223e2	00030000-55fb-c446-4036-b2bdd4aadc3b
00020000-55fb-c447-0a0b-d1b07a2223e2	00030000-55fb-c446-7b4f-45603b82092c
00020000-55fb-c447-0a0b-d1b07a2223e2	00030000-55fb-c446-bf5f-ad622c11e0fd
00020000-55fb-c447-0a0b-d1b07a2223e2	00030000-55fb-c446-6a1b-b369e67e5239
00020000-55fb-c447-0a0b-d1b07a2223e2	00030000-55fb-c446-3d88-37b1a447ed23
00020000-55fb-c447-0a0b-d1b07a2223e2	00030000-55fb-c446-3930-cf93a6bec05b
00020000-55fb-c447-0a0b-d1b07a2223e2	00030000-55fb-c446-63db-db0d43b561f5
00020000-55fb-c447-0a0b-d1b07a2223e2	00030000-55fb-c446-72e6-eab8931eb652
00020000-55fb-c447-0a0b-d1b07a2223e2	00030000-55fb-c446-aba3-56ef9c0596cd
00020000-55fb-c447-0a0b-d1b07a2223e2	00030000-55fb-c446-f252-d3725eabe2a8
00020000-55fb-c447-0a0b-d1b07a2223e2	00030000-55fb-c446-7d3c-1dd240c89971
00020000-55fb-c447-0a0b-d1b07a2223e2	00030000-55fb-c446-63f0-a6735f56e67b
00020000-55fb-c447-0a0b-d1b07a2223e2	00030000-55fb-c446-8c00-b6becec5b1b0
\.


--
-- TOC entry 2963 (class 0 OID 19993504)
-- Dependencies: 207
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 2967 (class 0 OID 19993538)
-- Dependencies: 211
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 2978 (class 0 OID 19993667)
-- Dependencies: 222
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, zacetek, konec, jeavtorskepravice, placilonavajo, vrednostvaje, planiranostevilovaj, vrednostvaj, vrednostpredstave, vrednostdopremiere, aktivna, zaposlenvdrjz, samozaposlen, igralec, opis) FROM stdin;
000b0000-55fb-c447-0e32-3504d4b08583	00090000-55fb-c447-46c1-01b11a40358d	\N	\N	0001	\N	\N	f	f	10.00	3	10.00	30.00	10.00	t	t	f	t	Pogodba o sodelovanju
000b0000-55fb-c447-7ac3-fc9b81750709	00090000-55fb-c447-e478-329d67eeb616	\N	\N	0002	\N	\N	f	t	11.00	10	11.00	31.00	110.00	t	f	t	t	Pogodba za vlogo Helena
000b0000-55fb-c447-0a83-e0a5024d8104	00090000-55fb-c447-2138-4ec78d1e5f2f	\N	\N	0003	\N	\N	f	f	12.00	4	12.00	32.00	12.00	t	f	t	f	Pogodba za lektoriranje
000b0000-55fb-c447-b4c7-b78fb2efff5b	00090000-55fb-c447-c5db-f86508a7e980	\N	\N	0004	\N	\N	t	f	0.00	2	300.00	30.00	300.00	t	f	t	f	Pogodba za avtorske pravice
\.


--
-- TOC entry 2941 (class 0 OID 19993265)
-- Dependencies: 185
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, drzava_id, sifra, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo, nvo) FROM stdin;
00080000-55fb-c447-0c46-f1ac117ed62d	00040000-55fb-c446-5c35-d8fbdaa2bd46	0988	AK	Juhuhu d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55fb-c447-80a0-c4aa499282c4	00040000-55fb-c446-5c35-d8fbdaa2bd46	0989	AK	Hopsasa d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	t
00080000-55fb-c447-904f-ec54ef452f42	00040000-55fb-c446-5c35-d8fbdaa2bd46	0987	AK	Gledališče Šrum d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55fb-c447-15ae-85f754dd90b3	00040000-55fb-c446-5c35-d8fbdaa2bd46	0986	AK	Lutkovni Direndaj d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55fb-c447-1795-247a8e6d5495	00040000-55fb-c446-5c35-d8fbdaa2bd46	0985	AK	Tatjana Stanič, Lektoriranje, s.p.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55fb-c447-3f4e-5cbf16a77b32	00040000-55fb-c446-b916-214839ffab27	0984	AK	Gledališče Lepote tvoje		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55fb-c447-51dc-b40327438b5a	00040000-55fb-c446-b4e5-6192ef31df9d	0983	AK	Sunce naše		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55fb-c447-1da8-a364b0711f9a	00040000-55fb-c446-05c4-1a9e201ab126	0982	AK	Theater Amadeus		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55fb-c447-7510-938a7a41e329	00040000-55fb-c446-b716-d1857d4a0695	9999	AK	Fuchs		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55fb-c448-b8b2-0bc6c90f7efc	00040000-55fb-c446-5c35-d8fbdaa2bd46	1001	AK	Gledališče Matica		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
\.


--
-- TOC entry 2943 (class 0 OID 19993299)
-- Dependencies: 187
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-55fb-c445-2257-23b38ee5757e	8341	Adlešiči
00050000-55fb-c445-a6a0-e93dae938751	5270	Ajdovščina
00050000-55fb-c445-b82f-84b545695241	6280	Ankaran/Ancarano
00050000-55fb-c445-5890-42f42cb56e9e	9253	Apače
00050000-55fb-c445-35c1-5a41832e3567	8253	Artiče
00050000-55fb-c445-a9aa-a2fd3b8d8f0b	4275	Begunje na Gorenjskem
00050000-55fb-c445-4c8f-0cf6b5bc251d	1382	Begunje pri Cerknici
00050000-55fb-c445-d783-6b62e18a4421	9231	Beltinci
00050000-55fb-c445-2c2b-ba54ea5e3a2c	2234	Benedikt
00050000-55fb-c445-c098-395222f3a8ca	2345	Bistrica ob Dravi
00050000-55fb-c445-74b6-f074359387a6	3256	Bistrica ob Sotli
00050000-55fb-c445-66b5-28b867579fce	8259	Bizeljsko
00050000-55fb-c445-3417-532bd29f3b6a	1223	Blagovica
00050000-55fb-c445-e70f-90da6655331f	8283	Blanca
00050000-55fb-c445-a753-91a6fbdcbb51	4260	Bled
00050000-55fb-c445-9cc1-32b1ea9035a5	4273	Blejska Dobrava
00050000-55fb-c445-be33-36853ba7a696	9265	Bodonci
00050000-55fb-c445-2765-7963b7390b0e	9222	Bogojina
00050000-55fb-c445-25e5-61e5e056b5fa	4263	Bohinjska Bela
00050000-55fb-c445-72c0-f0f0ef4b0b56	4264	Bohinjska Bistrica
00050000-55fb-c445-2f82-d60c4ced6c82	4265	Bohinjsko jezero
00050000-55fb-c445-0fde-c437695f1862	1353	Borovnica
00050000-55fb-c445-6ce3-c75e93d0c5da	8294	Boštanj
00050000-55fb-c445-398c-cc6c2cf547a6	5230	Bovec
00050000-55fb-c445-e448-d159ef358a66	5295	Branik
00050000-55fb-c445-52b4-c2bc88f382fd	3314	Braslovče
00050000-55fb-c445-312b-bf2909cd1d5d	5223	Breginj
00050000-55fb-c445-a5b1-ad5ec54bda95	8280	Brestanica
00050000-55fb-c445-d3f6-3e57c9f89c05	2354	Bresternica
00050000-55fb-c445-3f1e-feb27865e9bf	4243	Brezje
00050000-55fb-c445-e562-48536184ee57	1351	Brezovica pri Ljubljani
00050000-55fb-c445-a5cf-5bbde8f6c237	8250	Brežice
00050000-55fb-c445-7458-0f4c91ccab17	4210	Brnik - Aerodrom
00050000-55fb-c445-d83b-4b101cdd078b	8321	Brusnice
00050000-55fb-c445-53e1-8454bcdb4283	3255	Buče
00050000-55fb-c445-b332-cae2c9c943fc	8276	Bučka 
00050000-55fb-c445-d9b1-ed67cb170954	9261	Cankova
00050000-55fb-c445-abcb-26f6247fb2a9	3000	Celje 
00050000-55fb-c445-8039-3524487ab5f1	3001	Celje - poštni predali
00050000-55fb-c445-c1f5-1b5357f16a95	4207	Cerklje na Gorenjskem
00050000-55fb-c445-7fba-50b113c28046	8263	Cerklje ob Krki
00050000-55fb-c445-86a5-7e8d3808300d	1380	Cerknica
00050000-55fb-c445-1ba5-51ab9fa0a221	5282	Cerkno
00050000-55fb-c445-9d88-3ff561e00ed1	2236	Cerkvenjak
00050000-55fb-c445-0060-b4482f76c250	2215	Ceršak
00050000-55fb-c445-2a2b-e1c0f4fd148a	2326	Cirkovce
00050000-55fb-c445-9b08-56ef27d24614	2282	Cirkulane
00050000-55fb-c445-c662-c7e9912626a6	5273	Col
00050000-55fb-c445-c022-9a7ec45dae55	8251	Čatež ob Savi
00050000-55fb-c445-5b31-ff952f929084	1413	Čemšenik
00050000-55fb-c445-658f-ef2240468961	5253	Čepovan
00050000-55fb-c445-c4a0-3700f6e9f85d	9232	Črenšovci
00050000-55fb-c445-4d6f-63ab6eab30e5	2393	Črna na Koroškem
00050000-55fb-c445-4905-282d9c0b3b57	6275	Črni Kal
00050000-55fb-c445-33a9-c07d3ad916d7	5274	Črni Vrh nad Idrijo
00050000-55fb-c445-8dd2-0a67f227c8ab	5262	Črniče
00050000-55fb-c445-987a-d7e32086f6ad	8340	Črnomelj
00050000-55fb-c445-65b3-a7b39c5d0baf	6271	Dekani
00050000-55fb-c445-e04c-866e1c6aa6de	5210	Deskle
00050000-55fb-c445-8b1f-82fb9e71bc3d	2253	Destrnik
00050000-55fb-c445-877e-c288ca2a7ea8	6215	Divača
00050000-55fb-c445-a959-fb4d860477c1	1233	Dob
00050000-55fb-c445-571c-411ee411c101	3224	Dobje pri Planini
00050000-55fb-c445-73ec-bac209dce79e	8257	Dobova
00050000-55fb-c445-b4c4-93a08f74f9a6	1423	Dobovec
00050000-55fb-c445-1fb7-ec15a5867c5a	5263	Dobravlje
00050000-55fb-c445-2905-d565c851be54	3204	Dobrna
00050000-55fb-c445-b16c-a23709b81b2f	8211	Dobrnič
00050000-55fb-c445-f83c-54ecc72f173a	1356	Dobrova
00050000-55fb-c445-88b1-bc40c058e6b9	9223	Dobrovnik/Dobronak 
00050000-55fb-c445-49c1-28089eba4f7f	5212	Dobrovo v Brdih
00050000-55fb-c445-827e-8785e4448708	1431	Dol pri Hrastniku
00050000-55fb-c445-35ee-1dc9ebdec9c2	1262	Dol pri Ljubljani
00050000-55fb-c445-7071-e4060fee2dcf	1273	Dole pri Litiji
00050000-55fb-c445-59fe-d19184b17f05	1331	Dolenja vas
00050000-55fb-c445-6d72-b3123fa9221b	8350	Dolenjske Toplice
00050000-55fb-c445-8fbc-3aec6ae17423	1230	Domžale
00050000-55fb-c445-cba2-91249770850f	2252	Dornava
00050000-55fb-c445-c3fc-f0c925745e3c	5294	Dornberk
00050000-55fb-c445-5e4a-2d73768c74ef	1319	Draga
00050000-55fb-c445-338e-fa010d3f6aa5	8343	Dragatuš
00050000-55fb-c445-32f8-3f0461fd46e5	3222	Dramlje
00050000-55fb-c445-50de-0b649412633b	2370	Dravograd
00050000-55fb-c445-8e7d-8a12053aec26	4203	Duplje
00050000-55fb-c445-4257-c96745a81685	6221	Dutovlje
00050000-55fb-c445-d48c-058b562029d8	8361	Dvor
00050000-55fb-c445-3f55-67bda1a59e56	2343	Fala
00050000-55fb-c445-d8ce-d7fccda7219b	9208	Fokovci
00050000-55fb-c445-ea79-51c7e2566684	2313	Fram
00050000-55fb-c445-f042-f259cf3d3d08	3213	Frankolovo
00050000-55fb-c445-7b15-317b09aedc43	1274	Gabrovka
00050000-55fb-c445-7eb7-e8f467b22088	8254	Globoko
00050000-55fb-c445-2edd-150cb12f2b5c	5275	Godovič
00050000-55fb-c445-f938-dc4c130d5d76	4204	Golnik
00050000-55fb-c445-b350-2b3f26b14de8	3303	Gomilsko
00050000-55fb-c445-9f51-fa16929942f2	4224	Gorenja vas
00050000-55fb-c445-a7c2-f9b593546ab2	3263	Gorica pri Slivnici
00050000-55fb-c445-99d2-30ae13d18ef9	2272	Gorišnica
00050000-55fb-c445-4941-bc8da8c8127c	9250	Gornja Radgona
00050000-55fb-c445-2041-1426e53fb602	3342	Gornji Grad
00050000-55fb-c445-52dc-c8b8b9abfdfe	4282	Gozd Martuljek
00050000-55fb-c445-8677-4dc3c676338e	6272	Gračišče
00050000-55fb-c445-c444-68d99bb1d07b	9264	Grad
00050000-55fb-c445-b908-33d7a9865a88	8332	Gradac
00050000-55fb-c445-74ba-3e7a9c310b7b	1384	Grahovo
00050000-55fb-c445-c77b-2453bacc8d2b	5242	Grahovo ob Bači
00050000-55fb-c445-ccd3-c35e9722cffd	5251	Grgar
00050000-55fb-c445-0602-69a7e649be8e	3302	Griže
00050000-55fb-c445-a12c-f58b16813369	3231	Grobelno
00050000-55fb-c445-bfe8-bcf133c47a8c	1290	Grosuplje
00050000-55fb-c445-467d-84645f3778dd	2288	Hajdina
00050000-55fb-c445-e300-555da01ad187	8362	Hinje
00050000-55fb-c445-75ff-ef7f56ce9a49	2311	Hoče
00050000-55fb-c445-c63d-e896b985c8a0	9205	Hodoš/Hodos
00050000-55fb-c445-4cf0-6429df5fc423	1354	Horjul
00050000-55fb-c445-626d-657542917a1c	1372	Hotedršica
00050000-55fb-c445-bb58-a7fe2ecd1e0f	1430	Hrastnik
00050000-55fb-c445-7e8e-62877b789d2d	6225	Hruševje
00050000-55fb-c445-f0e6-53e604fe1b86	4276	Hrušica
00050000-55fb-c445-e1d2-a7bd827b9d6c	5280	Idrija
00050000-55fb-c445-c8d9-bcb77ef63bea	1292	Ig
00050000-55fb-c445-d16e-1909e724e581	6250	Ilirska Bistrica
00050000-55fb-c445-be25-6e7597bfabe8	6251	Ilirska Bistrica-Trnovo
00050000-55fb-c445-7db3-7ac5f71be649	1295	Ivančna Gorica
00050000-55fb-c445-63a0-724978613c5f	2259	Ivanjkovci
00050000-55fb-c445-5106-ccfb2dbe3189	1411	Izlake
00050000-55fb-c445-7950-fbb2bce75d2a	6310	Izola/Isola
00050000-55fb-c445-d67a-8985136e3cca	2222	Jakobski Dol
00050000-55fb-c445-b171-94371ffed44a	2221	Jarenina
00050000-55fb-c445-6867-9e78b6311386	6254	Jelšane
00050000-55fb-c445-1133-75d5a2dc0ac2	4270	Jesenice
00050000-55fb-c445-c1b2-b2fbfbd1e688	8261	Jesenice na Dolenjskem
00050000-55fb-c445-4422-7bfadee0e522	3273	Jurklošter
00050000-55fb-c445-4cd2-8ef9336d4a41	2223	Jurovski Dol
00050000-55fb-c445-b1fc-190f9a748302	2256	Juršinci
00050000-55fb-c445-67ed-f7ea080279a7	5214	Kal nad Kanalom
00050000-55fb-c445-1894-d9330d2e5ea3	3233	Kalobje
00050000-55fb-c445-2e38-71145b69cbed	4246	Kamna Gorica
00050000-55fb-c445-b76d-be2d68f51d44	2351	Kamnica
00050000-55fb-c445-559c-288f4ecb6ce9	1241	Kamnik
00050000-55fb-c445-47d5-3236a01894d8	5213	Kanal
00050000-55fb-c445-d8ee-eb212224c063	8258	Kapele
00050000-55fb-c445-8c61-a613a04b059c	2362	Kapla
00050000-55fb-c445-1a8d-21b952f5bda4	2325	Kidričevo
00050000-55fb-c445-88ff-801dd9dd1e72	1412	Kisovec
00050000-55fb-c445-f267-b9afc4f15007	6253	Knežak
00050000-55fb-c445-b1bf-74cc1a4cf619	5222	Kobarid
00050000-55fb-c445-36b6-ba03e391b3ce	9227	Kobilje
00050000-55fb-c445-5294-537d55549c1a	1330	Kočevje
00050000-55fb-c445-096f-600dc474ddb2	1338	Kočevska Reka
00050000-55fb-c445-362b-5dca0be03d01	2276	Kog
00050000-55fb-c445-1787-cff6d921b267	5211	Kojsko
00050000-55fb-c445-4925-c34096bbad65	6223	Komen
00050000-55fb-c445-9e05-8aef42d40ba6	1218	Komenda
00050000-55fb-c445-3254-b15e2cf2ab5d	6000	Koper/Capodistria 
00050000-55fb-c445-664e-8be2e011d5e8	6001	Koper/Capodistria - poštni predali
00050000-55fb-c445-5f64-fd6190a60abe	8282	Koprivnica
00050000-55fb-c445-de4e-37b9944f0e86	5296	Kostanjevica na Krasu
00050000-55fb-c445-073a-db743632c8bb	8311	Kostanjevica na Krki
00050000-55fb-c445-c4d7-a1917938471b	1336	Kostel
00050000-55fb-c445-b451-39addac88c84	6256	Košana
00050000-55fb-c445-c1aa-ecf6c435a4cc	2394	Kotlje
00050000-55fb-c445-aea5-becee97e31cf	6240	Kozina
00050000-55fb-c445-80a0-1062e4af4269	3260	Kozje
00050000-55fb-c445-d864-ab07902b3b7b	4000	Kranj 
00050000-55fb-c445-d8e2-04833e530831	4001	Kranj - poštni predali
00050000-55fb-c445-c3d5-eea81e2f082b	4280	Kranjska Gora
00050000-55fb-c445-060b-c0bf083f623d	1281	Kresnice
00050000-55fb-c445-5108-b8071ccaa490	4294	Križe
00050000-55fb-c445-a8f7-ace7968c89fe	9206	Križevci
00050000-55fb-c445-e82a-336b0c024ae6	9242	Križevci pri Ljutomeru
00050000-55fb-c445-f171-77d8bc165f43	1301	Krka
00050000-55fb-c445-e4a4-e686bac9d55d	8296	Krmelj
00050000-55fb-c445-8650-9aa255abd4f5	4245	Kropa
00050000-55fb-c445-49bd-a696463b1c9c	8262	Krška vas
00050000-55fb-c445-b067-11cfc286007b	8270	Krško
00050000-55fb-c445-bae6-7c07a9d3a343	9263	Kuzma
00050000-55fb-c445-e2e2-b560b3f988c7	2318	Laporje
00050000-55fb-c445-2c53-bdfb78e7c039	3270	Laško
00050000-55fb-c445-4f0f-c47ecdd5a971	1219	Laze v Tuhinju
00050000-55fb-c445-a073-03631e30e3c5	2230	Lenart v Slovenskih goricah
00050000-55fb-c445-8a5b-fc14d1f8c055	9220	Lendava/Lendva
00050000-55fb-c445-4b6e-0fff0cf867c1	4248	Lesce
00050000-55fb-c445-b949-56b68665f180	3261	Lesično
00050000-55fb-c445-18d1-543df4412e70	8273	Leskovec pri Krškem
00050000-55fb-c445-dae2-cafb60ed4278	2372	Libeliče
00050000-55fb-c445-04a8-227f20b1a8d1	2341	Limbuš
00050000-55fb-c445-6a25-f969b6013c18	1270	Litija
00050000-55fb-c445-f53d-290c0bd4ed14	3202	Ljubečna
00050000-55fb-c445-7c79-105a75191fcf	1000	Ljubljana 
00050000-55fb-c445-f5f4-ffaee88c06dd	1001	Ljubljana - poštni predali
00050000-55fb-c445-856f-3d0f0a0c40ed	1231	Ljubljana - Črnuče
00050000-55fb-c445-0947-1e055b068e13	1261	Ljubljana - Dobrunje
00050000-55fb-c445-8c90-daaa3a11b80b	1260	Ljubljana - Polje
00050000-55fb-c445-9c3a-984e742d7187	1210	Ljubljana - Šentvid
00050000-55fb-c445-6442-29401070a53f	1211	Ljubljana - Šmartno
00050000-55fb-c445-b95b-c71a623a5c5c	3333	Ljubno ob Savinji
00050000-55fb-c445-8f61-ade8ad714c47	9240	Ljutomer
00050000-55fb-c445-b3e5-a5ae57387ac9	3215	Loče
00050000-55fb-c445-f477-3a543864013c	5231	Log pod Mangartom
00050000-55fb-c445-71c1-f5cd807732c4	1358	Log pri Brezovici
00050000-55fb-c445-3a0b-7b41947b101f	1370	Logatec
00050000-55fb-c445-0d75-80f96243097f	1371	Logatec
00050000-55fb-c445-fe0b-bc36251413c3	1434	Loka pri Zidanem Mostu
00050000-55fb-c445-d354-c84bb842bfd4	3223	Loka pri Žusmu
00050000-55fb-c445-a358-6038181bf478	6219	Lokev
00050000-55fb-c445-cee4-cbd142dd459c	1318	Loški Potok
00050000-55fb-c445-0557-2786e7df125c	2324	Lovrenc na Dravskem polju
00050000-55fb-c445-1e9d-74ca9b822f84	2344	Lovrenc na Pohorju
00050000-55fb-c445-53bf-e4ed18094734	3334	Luče
00050000-55fb-c445-fe9c-13d963347e25	1225	Lukovica
00050000-55fb-c445-931a-86c240e6233b	9202	Mačkovci
00050000-55fb-c445-8604-fa2aa36b5d05	2322	Majšperk
00050000-55fb-c445-6bab-4aecd1ee82fa	2321	Makole
00050000-55fb-c445-9812-f101aae9a988	9243	Mala Nedelja
00050000-55fb-c445-a372-5c6605608a77	2229	Malečnik
00050000-55fb-c445-ed1e-239e2061c899	6273	Marezige
00050000-55fb-c445-ce11-87c2ef9abb6c	2000	Maribor 
00050000-55fb-c445-d96f-454efcae4053	2001	Maribor - poštni predali
00050000-55fb-c445-2cff-0262b8e7d201	2206	Marjeta na Dravskem polju
00050000-55fb-c445-5346-60c5e266c1cd	2281	Markovci
00050000-55fb-c445-69e0-53bd055af158	9221	Martjanci
00050000-55fb-c445-7ab9-e090f4833e77	6242	Materija
00050000-55fb-c445-98f4-7cbda63d66fc	4211	Mavčiče
00050000-55fb-c445-e5c6-e3918edf34e9	1215	Medvode
00050000-55fb-c445-a02d-14e7d76e039e	1234	Mengeš
00050000-55fb-c445-7014-8bcfc26a1725	8330	Metlika
00050000-55fb-c445-8580-57184fb76c42	2392	Mežica
00050000-55fb-c445-2b8e-c1a45f61c80d	2204	Miklavž na Dravskem polju
00050000-55fb-c445-840f-699a12d5b025	2275	Miklavž pri Ormožu
00050000-55fb-c445-3dfa-31524e0bb330	5291	Miren
00050000-55fb-c445-ecbb-74509c002121	8233	Mirna
00050000-55fb-c445-517c-2f5a34a46121	8216	Mirna Peč
00050000-55fb-c445-4e26-c3c34e21b57c	2382	Mislinja
00050000-55fb-c445-4219-46c099c23d06	4281	Mojstrana
00050000-55fb-c445-fd47-6c44663fb71d	8230	Mokronog
00050000-55fb-c445-d37c-e24c7ab77c75	1251	Moravče
00050000-55fb-c445-480e-7445f10b3584	9226	Moravske Toplice
00050000-55fb-c445-9f99-3c6eb324d29c	5216	Most na Soči
00050000-55fb-c445-ff7a-f13347620648	1221	Motnik
00050000-55fb-c445-4e91-7f90f49b5eb2	3330	Mozirje
00050000-55fb-c445-c7aa-c1e17e13b152	9000	Murska Sobota 
00050000-55fb-c445-5852-7221976047e4	9001	Murska Sobota - poštni predali
00050000-55fb-c445-550a-908f5621a4fe	2366	Muta
00050000-55fb-c445-132a-a7d1b8c16907	4202	Naklo
00050000-55fb-c445-7979-0948b712ae6e	3331	Nazarje
00050000-55fb-c445-bea9-086810c242ec	1357	Notranje Gorice
00050000-55fb-c445-cec6-2cff760d8731	3203	Nova Cerkev
00050000-55fb-c445-d9be-614e866a8d10	5000	Nova Gorica 
00050000-55fb-c445-2517-c2c64a56f72e	5001	Nova Gorica - poštni predali
00050000-55fb-c445-0cb0-9ea2a43744e2	1385	Nova vas
00050000-55fb-c445-cb89-b95e690f1652	8000	Novo mesto
00050000-55fb-c445-67c5-44638a993410	8001	Novo mesto - poštni predali
00050000-55fb-c445-b4e6-e621bab7121f	6243	Obrov
00050000-55fb-c445-0fe4-a5ff76689aa6	9233	Odranci
00050000-55fb-c445-92cb-9944f7adea0f	2317	Oplotnica
00050000-55fb-c445-7436-6f9345e5897f	2312	Orehova vas
00050000-55fb-c445-718f-0f105d585860	2270	Ormož
00050000-55fb-c445-f504-05beb91587e3	1316	Ortnek
00050000-55fb-c445-a4f0-5f9fb1d513cc	1337	Osilnica
00050000-55fb-c445-ffa9-fbc3935e3bf9	8222	Otočec
00050000-55fb-c445-f49c-54547d91191d	2361	Ožbalt
00050000-55fb-c445-6a02-fc2a3cca3b46	2231	Pernica
00050000-55fb-c445-cd93-31f242e7a8a0	2211	Pesnica pri Mariboru
00050000-55fb-c445-2b54-555a28d6ca6f	9203	Petrovci
00050000-55fb-c445-d751-d036c850abf7	3301	Petrovče
00050000-55fb-c445-65bf-13e15c622326	6330	Piran/Pirano
00050000-55fb-c445-51a2-be42ccf86c8a	8255	Pišece
00050000-55fb-c445-8994-af8fab3e0772	6257	Pivka
00050000-55fb-c445-0a2b-9c0c5ee22dc8	6232	Planina
00050000-55fb-c445-1624-5687fb04741b	3225	Planina pri Sevnici
00050000-55fb-c445-9cfc-3ca526343cc2	6276	Pobegi
00050000-55fb-c445-e3c4-a385ed85f813	8312	Podbočje
00050000-55fb-c445-cae4-6203da5f9098	5243	Podbrdo
00050000-55fb-c445-02a6-f61e17232d17	3254	Podčetrtek
00050000-55fb-c445-ee29-6e9599479a6c	2273	Podgorci
00050000-55fb-c445-9e8d-2036d3cb8738	6216	Podgorje
00050000-55fb-c445-a6e3-e70944340379	2381	Podgorje pri Slovenj Gradcu
00050000-55fb-c445-ddb8-d6efb3a8c316	6244	Podgrad
00050000-55fb-c445-b97f-191cbcff319b	1414	Podkum
00050000-55fb-c445-b6e7-87b339156348	2286	Podlehnik
00050000-55fb-c445-22d0-f51b4ed215b6	5272	Podnanos
00050000-55fb-c445-e0df-d9f818692998	4244	Podnart
00050000-55fb-c445-7309-8ed9fac9b61c	3241	Podplat
00050000-55fb-c445-e4e6-1f79dc197358	3257	Podsreda
00050000-55fb-c445-6352-74ad77f68612	2363	Podvelka
00050000-55fb-c445-7e1f-e17be28d38c9	2208	Pohorje
00050000-55fb-c445-5aad-c1df1db40caf	2257	Polenšak
00050000-55fb-c445-989b-7767f89fc503	1355	Polhov Gradec
00050000-55fb-c445-2502-3f7c30612aac	4223	Poljane nad Škofjo Loko
00050000-55fb-c445-e41a-7b8f85aa0e01	2319	Poljčane
00050000-55fb-c445-7a95-8fa430585828	1272	Polšnik
00050000-55fb-c445-0315-e6593d134ccf	3313	Polzela
00050000-55fb-c445-bbe4-65be58e76d22	3232	Ponikva
00050000-55fb-c445-b9cc-75af2661faf7	6320	Portorož/Portorose
00050000-55fb-c445-2b14-da2458e811c4	6230	Postojna
00050000-55fb-c445-8f5a-05fbde8890fa	2331	Pragersko
00050000-55fb-c445-ba41-f9783689292c	3312	Prebold
00050000-55fb-c445-234a-6a1d18a0d814	4205	Preddvor
00050000-55fb-c445-5bed-86e52b3d76df	6255	Prem
00050000-55fb-c445-21b8-6ac3ee14ca36	1352	Preserje
00050000-55fb-c445-f17f-b42b8457403c	6258	Prestranek
00050000-55fb-c445-8764-af3f6bf2a25d	2391	Prevalje
00050000-55fb-c445-34b9-25a06a32139b	3262	Prevorje
00050000-55fb-c445-6299-8b1c25d551dc	1276	Primskovo 
00050000-55fb-c445-f215-3c75d2fba666	3253	Pristava pri Mestinju
00050000-55fb-c445-ceb2-1a67301d7741	9207	Prosenjakovci/Partosfalva
00050000-55fb-c445-96bd-3078555459c1	5297	Prvačina
00050000-55fb-c445-17ed-52559a457a58	2250	Ptuj
00050000-55fb-c445-6203-c8864094ed98	2323	Ptujska Gora
00050000-55fb-c445-445e-d6b35b0bd65a	9201	Puconci
00050000-55fb-c445-79d2-0b59e3ba7967	2327	Rače
00050000-55fb-c445-79a3-870767439a8a	1433	Radeče
00050000-55fb-c445-b5e0-26b236bd4407	9252	Radenci
00050000-55fb-c445-8aa2-d34d17d6e673	2360	Radlje ob Dravi
00050000-55fb-c445-6fd0-0afb08c8b571	1235	Radomlje
00050000-55fb-c445-8955-841540c33f89	4240	Radovljica
00050000-55fb-c445-712e-d220b8013674	8274	Raka
00050000-55fb-c445-32a9-ce4c5f82ef57	1381	Rakek
00050000-55fb-c445-d9c0-9bc64688dbac	4283	Rateče - Planica
00050000-55fb-c445-3af0-0569d11af333	2390	Ravne na Koroškem
00050000-55fb-c445-7545-0bf789689dc6	9246	Razkrižje
00050000-55fb-c445-8d51-3099910a5290	3332	Rečica ob Savinji
00050000-55fb-c445-fd5b-db698ee5afc8	5292	Renče
00050000-55fb-c445-ffc7-4cb5ca182d75	1310	Ribnica
00050000-55fb-c445-6d04-5d1fa53d55d8	2364	Ribnica na Pohorju
00050000-55fb-c445-1537-79f0c53bb2e3	3272	Rimske Toplice
00050000-55fb-c445-d299-685e3e86a25d	1314	Rob
00050000-55fb-c445-b958-77eb11e98302	5215	Ročinj
00050000-55fb-c445-e071-d4ac44bf77c8	3250	Rogaška Slatina
00050000-55fb-c445-99cf-8d67143327bf	9262	Rogašovci
00050000-55fb-c445-af87-1bac96e8e124	3252	Rogatec
00050000-55fb-c445-0d25-26a518be6eb4	1373	Rovte
00050000-55fb-c445-062a-a243f8a5ee93	2342	Ruše
00050000-55fb-c445-91c5-181d4bb3eb2d	1282	Sava
00050000-55fb-c445-c892-3beaa49d74d9	6333	Sečovlje/Sicciole
00050000-55fb-c445-2f6a-2c133bb18187	4227	Selca
00050000-55fb-c445-4f64-5c8d74f7f6aa	2352	Selnica ob Dravi
00050000-55fb-c445-836b-42e4f9aa7c62	8333	Semič
00050000-55fb-c445-1dd1-ac6fea6fef74	8281	Senovo
00050000-55fb-c445-19ff-e249cb8bb345	6224	Senožeče
00050000-55fb-c445-7ee9-00cf51899b35	8290	Sevnica
00050000-55fb-c445-2837-2ef332f272ef	6210	Sežana
00050000-55fb-c445-a18d-a44b617f309d	2214	Sladki Vrh
00050000-55fb-c445-3a29-746302048ee9	5283	Slap ob Idrijci
00050000-55fb-c445-9091-a1aed650db34	2380	Slovenj Gradec
00050000-55fb-c445-5072-a0627e1b6ddb	2310	Slovenska Bistrica
00050000-55fb-c445-713f-f7392acb0276	3210	Slovenske Konjice
00050000-55fb-c445-faca-bfa72bd56326	1216	Smlednik
00050000-55fb-c445-1301-fc32a21924b5	5232	Soča
00050000-55fb-c445-0046-e903cae4c761	1317	Sodražica
00050000-55fb-c445-d122-e2b75733b949	3335	Solčava
00050000-55fb-c445-710a-b0d5beb7fa79	5250	Solkan
00050000-55fb-c445-9275-4113960347e9	4229	Sorica
00050000-55fb-c445-796c-2ac8d5ee1f2e	4225	Sovodenj
00050000-55fb-c445-f394-367aba1354bc	5281	Spodnja Idrija
00050000-55fb-c445-ba88-7b36ac4f7174	2241	Spodnji Duplek
00050000-55fb-c445-1134-5a04e0403dc5	9245	Spodnji Ivanjci
00050000-55fb-c445-07a6-8191d466e4f5	2277	Središče ob Dravi
00050000-55fb-c445-f17f-981471fa1419	4267	Srednja vas v Bohinju
00050000-55fb-c445-087d-7cc24ca47a66	8256	Sromlje 
00050000-55fb-c445-aac3-6b4534bd2252	5224	Srpenica
00050000-55fb-c445-5502-34adc3f0084e	1242	Stahovica
00050000-55fb-c445-6fc9-913a1eb24d15	1332	Stara Cerkev
00050000-55fb-c445-fe7d-911e13342d20	8342	Stari trg ob Kolpi
00050000-55fb-c445-2a86-b91958cbe787	1386	Stari trg pri Ložu
00050000-55fb-c445-30de-4d20edd0dd3b	2205	Starše
00050000-55fb-c445-7a81-ffcb29afe988	2289	Stoperce
00050000-55fb-c445-d693-dcf125ff2a98	8322	Stopiče
00050000-55fb-c445-6992-9f46dc1777e3	3206	Stranice
00050000-55fb-c445-a44c-22b5bc5561a0	8351	Straža
00050000-55fb-c445-8d59-e6898f540176	1313	Struge
00050000-55fb-c445-77a2-c75cdb33696d	8293	Studenec
00050000-55fb-c445-94d7-4d0a76f73847	8331	Suhor
00050000-55fb-c445-ac11-5dbb946bd0a5	2233	Sv. Ana v Slovenskih goricah
00050000-55fb-c445-77c8-9154176791d9	2235	Sv. Trojica v Slovenskih goricah
00050000-55fb-c445-c51c-8cf6da9fdbb8	2353	Sveti Duh na Ostrem Vrhu
00050000-55fb-c445-7418-6a7ad90d3a20	9244	Sveti Jurij ob Ščavnici
00050000-55fb-c445-240d-f542862425af	3264	Sveti Štefan
00050000-55fb-c445-3186-8128e3e1bb16	2258	Sveti Tomaž
00050000-55fb-c445-d51f-2f572bd541c8	9204	Šalovci
00050000-55fb-c445-640f-7b97b30a8446	5261	Šempas
00050000-55fb-c445-49de-72b7a8486b22	5290	Šempeter pri Gorici
00050000-55fb-c445-6bd7-27d83a072bd3	3311	Šempeter v Savinjski dolini
00050000-55fb-c445-f4ee-8ac7180225e9	4208	Šenčur
00050000-55fb-c445-6c08-e891f7e677c0	2212	Šentilj v Slovenskih goricah
00050000-55fb-c445-d2f2-dc49406a039f	8297	Šentjanž
00050000-55fb-c445-8ce7-66a5dd5e376d	2373	Šentjanž pri Dravogradu
00050000-55fb-c445-d4b2-35f1cfa142a6	8310	Šentjernej
00050000-55fb-c445-de23-24b0d6543f72	3230	Šentjur
00050000-55fb-c445-b075-26da37872b6e	3271	Šentrupert
00050000-55fb-c445-78fa-defc72f6227e	8232	Šentrupert
00050000-55fb-c445-cf34-72a2c3de290a	1296	Šentvid pri Stični
00050000-55fb-c445-aaec-0fac560f969e	8275	Škocjan
00050000-55fb-c445-71a1-ca65baefc072	6281	Škofije
00050000-55fb-c445-8cfc-fcf75caf88fb	4220	Škofja Loka
00050000-55fb-c445-f1d2-9e5dd54e73c9	3211	Škofja vas
00050000-55fb-c445-71d9-693253b98bc3	1291	Škofljica
00050000-55fb-c445-83d4-184c5b4b5708	6274	Šmarje
00050000-55fb-c445-8534-9161994e8776	1293	Šmarje - Sap
00050000-55fb-c445-4829-6d9f4c93a505	3240	Šmarje pri Jelšah
00050000-55fb-c445-466e-0f7ae7923277	8220	Šmarješke Toplice
00050000-55fb-c445-ad9d-0fd35c837fc9	2315	Šmartno na Pohorju
00050000-55fb-c445-bd6d-693aa1833bad	3341	Šmartno ob Dreti
00050000-55fb-c445-1ce5-84059e2cbf2a	3327	Šmartno ob Paki
00050000-55fb-c445-15b8-fe85b0678931	1275	Šmartno pri Litiji
00050000-55fb-c445-a86a-0398b80c08dc	2383	Šmartno pri Slovenj Gradcu
00050000-55fb-c445-3ba3-1dac4a1e5212	3201	Šmartno v Rožni dolini
00050000-55fb-c445-0a76-1bc57b35b838	3325	Šoštanj
00050000-55fb-c445-0278-093050068c54	6222	Štanjel
00050000-55fb-c445-5429-509e1c97a994	3220	Štore
00050000-55fb-c445-8b4a-7f3cbad22910	3304	Tabor
00050000-55fb-c445-242d-0e80c7f9f380	3221	Teharje
00050000-55fb-c445-b7c7-f08366f34836	9251	Tišina
00050000-55fb-c445-038c-4d1e87a5fa0a	5220	Tolmin
00050000-55fb-c445-c500-6117b0133ce0	3326	Topolšica
00050000-55fb-c445-418c-0a6d651c077e	2371	Trbonje
00050000-55fb-c445-f8a7-f0b72ec858f7	1420	Trbovlje
00050000-55fb-c445-e4fe-69275333829b	8231	Trebelno 
00050000-55fb-c445-7d1c-3e84bc00d003	8210	Trebnje
00050000-55fb-c445-7ae2-12962442e910	5252	Trnovo pri Gorici
00050000-55fb-c445-7e3d-47663f5df35e	2254	Trnovska vas
00050000-55fb-c445-a39c-2677e6737494	1222	Trojane
00050000-55fb-c445-0a9c-6487fc1903e7	1236	Trzin
00050000-55fb-c445-796d-92b08c5bcf28	4290	Tržič
00050000-55fb-c445-4c90-563578631b08	8295	Tržišče
00050000-55fb-c445-0d5c-1ea5961ef00d	1311	Turjak
00050000-55fb-c445-5b09-6ca015eb2797	9224	Turnišče
00050000-55fb-c445-662d-5ee89c03b861	8323	Uršna sela
00050000-55fb-c445-a7a9-8802ed0b99c9	1252	Vače
00050000-55fb-c445-89ff-580889cde39a	3320	Velenje 
00050000-55fb-c445-5964-8331bf728409	3322	Velenje - poštni predali
00050000-55fb-c445-e44e-02bd4ba75ba6	8212	Velika Loka
00050000-55fb-c445-d6bf-4a17373bebaf	2274	Velika Nedelja
00050000-55fb-c445-ba87-fed79d4f8c8a	9225	Velika Polana
00050000-55fb-c445-e0c4-41ca7ee36506	1315	Velike Lašče
00050000-55fb-c445-fca1-a8fe122b0118	8213	Veliki Gaber
00050000-55fb-c445-8db6-c0e0fbdef0d8	9241	Veržej
00050000-55fb-c445-cc80-0cdaec21206c	1312	Videm - Dobrepolje
00050000-55fb-c445-3a26-aa5792e8256e	2284	Videm pri Ptuju
00050000-55fb-c445-8256-74ab19190365	8344	Vinica
00050000-55fb-c445-8e94-c0d544e9315a	5271	Vipava
00050000-55fb-c445-9fee-3bba60fb4841	4212	Visoko
00050000-55fb-c445-5d5d-72fc835f28d3	1294	Višnja Gora
00050000-55fb-c445-7cc4-b7c17dcbf7bd	3205	Vitanje
00050000-55fb-c445-fd85-c7a4a6e9bfb4	2255	Vitomarci
00050000-55fb-c445-0f18-934834df2f60	1217	Vodice
00050000-55fb-c445-bda5-73753a179621	3212	Vojnik\t
00050000-55fb-c445-587d-131240d76503	5293	Volčja Draga
00050000-55fb-c445-0d85-171c92a1d073	2232	Voličina
00050000-55fb-c445-8413-b30ae8026504	3305	Vransko
00050000-55fb-c445-827c-e31dd72d421d	6217	Vremski Britof
00050000-55fb-c445-3876-64da0a12787c	1360	Vrhnika
00050000-55fb-c445-a226-8102db7e7594	2365	Vuhred
00050000-55fb-c445-b1a9-038d16fb9636	2367	Vuzenica
00050000-55fb-c445-d0e7-1433124fc8b2	8292	Zabukovje 
00050000-55fb-c445-a332-39f14693669c	1410	Zagorje ob Savi
00050000-55fb-c445-aacc-b6b2ce1b9be4	1303	Zagradec
00050000-55fb-c445-7441-73edbc35a57c	2283	Zavrč
00050000-55fb-c445-6405-d96bbd2d583b	8272	Zdole 
00050000-55fb-c445-4181-72641c44f8fd	4201	Zgornja Besnica
00050000-55fb-c445-be80-11f9d22f1a6a	2242	Zgornja Korena
00050000-55fb-c445-fdf9-d01a36a8c8b1	2201	Zgornja Kungota
00050000-55fb-c445-2b03-2706c89e931b	2316	Zgornja Ložnica
00050000-55fb-c445-a25a-59c6ffd98195	2314	Zgornja Polskava
00050000-55fb-c445-027f-f0968e025e73	2213	Zgornja Velka
00050000-55fb-c445-3eac-c41715cce4bd	4247	Zgornje Gorje
00050000-55fb-c445-8671-ea17a3b8bef5	4206	Zgornje Jezersko
00050000-55fb-c445-23e5-59003499aa71	2285	Zgornji Leskovec
00050000-55fb-c445-79dc-692704730b52	1432	Zidani Most
00050000-55fb-c445-8c94-4fc005d3576c	3214	Zreče
00050000-55fb-c445-2c07-355602d724c4	4209	Žabnica
00050000-55fb-c445-7bd3-b01b92b4aecb	3310	Žalec
00050000-55fb-c445-8176-28b90dee0508	4228	Železniki
00050000-55fb-c445-5abd-2c7a9f264b6c	2287	Žetale
00050000-55fb-c445-9525-20f446e05c48	4226	Žiri
00050000-55fb-c445-8158-3107829f5f46	4274	Žirovnica
00050000-55fb-c445-45fc-b2e50ddaa0c7	8360	Žužemberk
\.


--
-- TOC entry 2985 (class 0 OID 19993846)
-- Dependencies: 229
-- Data for Name: postavkacdve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkacdve (id, skupina, podskupina, naziv, vrpremiere, vrponovitvepremier, vrponovitveprejsnjih, vrgostovanjazamejstvo, vrfestivali, vrgostovanjaint, vrostalo, programdela_id) FROM stdin;
\.


--
-- TOC entry 2959 (class 0 OID 19993478)
-- Dependencies: 203
-- Data for Name: postavkaracuna; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkaracuna (id, racun_id) FROM stdin;
\.


--
-- TOC entry 2942 (class 0 OID 19993284)
-- Dependencies: 186
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
00060000-55fb-c447-54c3-35660e6b4f25	00080000-55fb-c447-0c46-f1ac117ed62d	\N	00040000-55fb-c446-5c35-d8fbdaa2bd46	Narodni dom	\N	Koroška 15	\N	9231	Beltinci	\N	f	t
00060000-55fb-c447-5759-f2f0504fa522	00080000-55fb-c447-0c46-f1ac117ed62d	\N	00040000-55fb-c446-5c35-d8fbdaa2bd46	Korotan	\N	Koroška 22	\N	9231	Beltinci	\N	f	f
00060000-55fb-c447-b97b-b9831b5f9f6c	00080000-55fb-c447-80a0-c4aa499282c4	\N	00040000-55fb-c446-5c35-d8fbdaa2bd46	Rimljan	\N	Rimska ploščad 7	\N	9231	Beltinci	\N	f	t
\.


--
-- TOC entry 2948 (class 0 OID 19993362)
-- Dependencies: 192
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, zaporedna, porocilo) FROM stdin;
\.


--
-- TOC entry 2961 (class 0 OID 19993490)
-- Dependencies: 205
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 2986 (class 0 OID 19993860)
-- Dependencies: 230
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, koproducent_id, odstotekfinanciranja, delez, maticnikop, kpe, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 2987 (class 0 OID 19993870)
-- Dependencies: 231
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, sifra, status) FROM stdin;
00190000-55fb-c447-bd86-e49e2e4d480e	00080000-55fb-c447-904f-ec54ef452f42	0987	AK
00190000-55fb-c447-8eea-b72bfc9be25f	00080000-55fb-c447-80a0-c4aa499282c4	0989	AK
00190000-55fb-c447-2b3c-74fdabd000d0	00080000-55fb-c447-15ae-85f754dd90b3	0986	AK
00190000-55fb-c447-42ca-9ecec225605f	00080000-55fb-c447-3f4e-5cbf16a77b32	0984	AK
00190000-55fb-c447-61cd-1eacc4fb1ce0	00080000-55fb-c447-51dc-b40327438b5a	0983	AK
00190000-55fb-c447-b6c6-c5b9bd524162	00080000-55fb-c447-1da8-a364b0711f9a	0982	AK
00190000-55fb-c448-9fc5-67263c1726f1	00080000-55fb-c448-b8b2-0bc6c90f7efc	1001	AK
\.


--
-- TOC entry 2984 (class 0 OID 19993803)
-- Dependencies: 228
-- Data for Name: programdela; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programdela (id, sifra, naziv, zacetek, konec, zakljuceno, potrjenprogram, stpremier, stint, stfest, strazno, stizjem, stponprem, stponprej, stponprejvelikih, stponprejmalih, stponprejmalihkopr, stponprejsredkopr, stponprejvelikihkopr, stgostujo, vrps1, vrps1do, vrps1mat, vrps1gostovsz, stizvnekomerc, stizvprem, stizvpremdoma, stizvpremkopr, stizvponprem, stizvponpremdoma, stizvponpremzamejo, stizvponpremgost, stizvponpremkopr, stizvponpremint, stizvponpremkoprint, stizvponprej, stizvponprejdoma, stizvponprejzamejo, stizvponprejgost, stizvponprejkopr, stizvponprejint, stizvponprejkoprint, stizvgostuj, stizvostalihnek, stizvgostovanjslo, stizvgostovanjzam, stizvgostovanjint, stobisknekom, stobisknekommat, stobisknekomgostslo, stobisknekomgostzam, stobisknekomgostint, stobiskprem, stobiskpremdoma, stobiskpremkopr, stobiskponprem, stobiskponpremdoma, stobiskponpremkopr, stobiskponpremkoprint, stobiskponpremgost, stobiskponpremzamejo, stobiskponpremint, avgobiskprired, avgzaseddvoran, avgcenavstopnice, stprodvstopnic, stkoprodukcij, stkoprodukcijint, stkoprodukcijnvo, stzaposlenih, stzaposigralcev, avgstnastopovigr, sthonorarnih, sthonorarnihigr, sthonorarnihigrtujjz, sthonorarnihigrsamoz, sredstvaint, sredstvaavt, sredstvazaprosenoprem, sredstvazaprosenoponprem, sredstvazaprosenoponprej, sredstvazaprosenogostujo, sredstvazaprosenoint, sredstvazaprosenofest, sredstvazaprosenorazno, sredstvazaprosenoizjem, sredstvadrugijavniprem, sredstvadrugijavniponprem, sredstvadrugijavniponprej, sredstvadrugijavnigostujo, sredstvadrugijavniint, sredstvadrugijavnifest, sredstvadrugijavnirazno, sredstvadrugijavniizjem, sredstvadrugiviriprem, sredstvadrugiviriponprem, sredstvadrugiviriponprej, sredstvadrugivirigostujo, sredstvadrugiviriint, sredstvadrugivirifest, sredstvadrugivirirazno, sredstvadrugiviriizjem, sredstvaavtsamoz) FROM stdin;
00290000-55fb-c448-8030-c2420f36b868	0001	Testni program dela	2016-02-01	2017-02-01	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 2988 (class 0 OID 19993878)
-- Dependencies: 232
-- Data for Name: programskaenotasklopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programskaenotasklopa (id, naslovpe, avtorpe, obsegpe, mesecpe, vrednostpe, programrazno_id) FROM stdin;
\.


--
-- TOC entry 2965 (class 0 OID 19993519)
-- Dependencies: 209
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, popa_id, naslov_id, sifra, naziv, jeprizorisce, jematicnioder, seplanira, kapaciteta, opis) FROM stdin;
00220000-55fb-c447-ecc7-cbf2025f9cb5	\N	\N	0001	Poskusna 1	f	\N	t	8	Poskusna učilnica v prvem
00220000-55fb-c447-cc74-0e9ebb9c5c11	\N	\N	0002	Poskusna 3	f	\N	f	34	Poskusna učilnica v tretjem
00220000-55fb-c447-fdff-aa8ff763bc4f	\N	\N	0003	Kazinska	t	\N	t	84	Kazinska dvorana
00220000-55fb-c447-57c4-3efee8497f58	\N	\N	0004	Mali oder	t	\N	t	24	Mali oder 
00220000-55fb-c447-aa23-307944606583	\N	\N	0005	Komorni oder	t	\N	t	15	Komorni oder
00220000-55fb-c447-de57-f78ac0dc7779	\N	\N	0006	Stara dvorana	t	\N	t	96	Stara dvorana ali dvorana Franceta Prešerna
00220000-55fb-c447-3ea7-cddbbf1fbd59	\N	\N	0007	Velika dvorana	t	\N	t	160	Velika, glavna dvorana
\.


--
-- TOC entry 2957 (class 0 OID 19993463)
-- Dependencies: 201
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 2956 (class 0 OID 19993453)
-- Dependencies: 200
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 2977 (class 0 OID 19993656)
-- Dependencies: 221
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta, status) FROM stdin;
\.


--
-- TOC entry 2972 (class 0 OID 19993593)
-- Dependencies: 216
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 2931 (class 0 OID 19993157)
-- Dependencies: 175
-- Data for Name: revizije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY revizije (id, razred, objectid, upor, datum, tip, data) FROM stdin;
1	App\\Entity\\Popa	00080000-55fb-c448-b8b2-0bc6c90f7efc	00010000-55fb-c446-e7a2-f9e76b7e40aa	2015-09-18 09:59:04	INS	a:0:{}
2	App\\Entity\\Option	00000000-55fb-c448-9604-ecbff29377ec	00010000-55fb-c446-e7a2-f9e76b7e40aa	2015-09-18 09:59:04	INS	a:0:{}
3	ProgramDela\\Entity\\ProdukcijskaHisa	00190000-55fb-c448-9fc5-67263c1726f1	00010000-55fb-c446-e7a2-f9e76b7e40aa	2015-09-18 09:59:04	INS	a:0:{}
\.


--
-- TOC entry 3006 (class 0 OID 0)
-- Dependencies: 174
-- Name: revizije_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('revizije_id_seq', 3, true);


--
-- TOC entry 2966 (class 0 OID 19993532)
-- Dependencies: 210
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 2935 (class 0 OID 19993195)
-- Dependencies: 179
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-55fb-c446-67d7-1e1b36cc7623	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-55fb-c446-6f98-54a500158eb0	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-55fb-c446-123f-c9ab56587bec	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-55fb-c446-cf6e-824b62703fd9	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-55fb-c446-5c9c-579b45edf932	planer	Planer dogodkov v koledarju	t
00020000-55fb-c446-8dba-1d0e44f40fa7	kadrovska	Kadrovska služba	t
00020000-55fb-c446-d04a-d41d3f10185a	arhivar	Ažuriranje arhivalij	t
00020000-55fb-c446-c2c9-9aac720db79a	igralec	Igralec	t
00020000-55fb-c446-77c1-286a72b237ff	prisotnost	Vnašalec prisotnosti, tudi za tiste izven uprizoritev	t
00020000-55fb-c447-0a0b-d1b07a2223e2	vsadovoljenja	Vloga z vsemi posameznimi dovoljenji	t
\.


--
-- TOC entry 2933 (class 0 OID 19993179)
-- Dependencies: 177
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-55fb-c446-17ef-692fca6b907d	00020000-55fb-c446-123f-c9ab56587bec
00010000-55fb-c446-e7a2-f9e76b7e40aa	00020000-55fb-c446-123f-c9ab56587bec
00010000-55fb-c447-a68c-3fc464ce23cc	00020000-55fb-c447-0a0b-d1b07a2223e2
\.


--
-- TOC entry 2968 (class 0 OID 19993546)
-- Dependencies: 212
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 2960 (class 0 OID 19993484)
-- Dependencies: 204
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 2954 (class 0 OID 19993430)
-- Dependencies: 198
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, sifra, ime, zacetek, konec, aktivna) FROM stdin;
\.


--
-- TOC entry 2929 (class 0 OID 19993144)
-- Dependencies: 173
-- Data for Name: stevilcenje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenje (id, sifra, naziv, prefix, suffix, zacetek, dolzina, format, globalno, poletih) FROM stdin;
00230000-55fb-c446-b7d8-016504c80006	pri	Privzeto številčenje po letih YYYY-N	\N	\N	1	1	%l-%n	f	t
00230000-55fb-c446-f6e6-57e77295f6c9	123	Privzeto številčenje kratkih šifer	\N	\N	100	3	%n	f	f
00230000-55fb-c446-51be-caf3647fc4d0	bcd	Globalno številčenje črtnih kod	\N	\N	1	9	%n	t	f
00230000-55fb-c446-50a0-0ba24fbf4d55	sif	Številčenje šifrant	\N	\N	1000	4	%n	f	f
00230000-55fb-c446-889d-18f81ff86f9c	tmp	Globalno številčenje začasnih številk	tmp	\N	1000	5	%l%n	t	t
\.


--
-- TOC entry 2928 (class 0 OID 19993136)
-- Dependencies: 172
-- Data for Name: stevilcenjekonfig; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjekonfig (id, stevilcenje_id, dok) FROM stdin;
00240000-55fb-c446-de70-2ad34027160f	00230000-55fb-c446-50a0-0ba24fbf4d55	popa
00240000-55fb-c446-4586-d958fd8f17b6	00230000-55fb-c446-50a0-0ba24fbf4d55	oseba
00240000-55fb-c446-be30-86b89d701b86	00230000-55fb-c446-50a0-0ba24fbf4d55	sezona
00240000-55fb-c446-6b15-c3ab712ae5b4	00230000-55fb-c446-f6e6-57e77295f6c9	prostor
00240000-55fb-c446-a764-72d6ed790f68	00230000-55fb-c446-50a0-0ba24fbf4d55	besedilo
00240000-55fb-c446-b91e-cfe34df94fd0	00230000-55fb-c446-50a0-0ba24fbf4d55	uprizoritev
00240000-55fb-c446-8f29-9f26958a7e47	00230000-55fb-c446-50a0-0ba24fbf4d55	funkcija
00240000-55fb-c446-e5d2-71f93dcfc5e6	00230000-55fb-c446-50a0-0ba24fbf4d55	tipfunkcije
00240000-55fb-c446-c718-fe7afe0d2a63	00230000-55fb-c446-50a0-0ba24fbf4d55	alternacija
00240000-55fb-c446-eb7c-3de3cfd0fd32	00230000-55fb-c446-b7d8-016504c80006	pogodba
00240000-55fb-c446-da91-3bf879731f66	00230000-55fb-c446-50a0-0ba24fbf4d55	zaposlitev
00240000-55fb-c446-f8bd-b7e56e2ae500	00230000-55fb-c446-50a0-0ba24fbf4d55	zvrstuprizoritve
00240000-55fb-c446-f8a7-e6daabc90ade	00230000-55fb-c446-b7d8-016504c80006	programdela
00240000-55fb-c446-49ee-7e505ce396c5	00230000-55fb-c446-50a0-0ba24fbf4d55	zapis
\.


--
-- TOC entry 2927 (class 0 OID 19993131)
-- Dependencies: 171
-- Data for Name: stevilcenjestanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjestanje (id, objid, leto, stevilka) FROM stdin;
65acda28-a3e2-424c-96df-9ec147e11f31	00240000-55fb-c446-de70-2ad34027160f	0	1001
\.


--
-- TOC entry 2973 (class 0 OID 19993603)
-- Dependencies: 217
-- Data for Name: strosekuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY strosekuprizoritve (id, uprizoritev_id, popa_id, naziv, vrednostdo, vrednostna, opis, tipstroska, sort, vrstastroska_id) FROM stdin;
00270000-55fb-c448-6550-589f6639ddce	000e0000-55fb-c447-d10a-87a88dd8e690	00080000-55fb-c447-0c46-f1ac117ed62d	Nabava kostumov	600.50	20.00	Krila in maske	materialni	1	003b0000-55fb-c446-57b0-ee928ca52e2b
00270000-55fb-c448-5049-7ebd4e10e698	000e0000-55fb-c447-d10a-87a88dd8e690	00080000-55fb-c447-0c46-f1ac117ed62d	Zavese	125.70	3.10	Modra in zelena zavesa	materialni	2	003b0000-55fb-c446-57b0-ee928ca52e2b
\.


--
-- TOC entry 2940 (class 0 OID 19993257)
-- Dependencies: 184
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 2955 (class 0 OID 19993440)
-- Dependencies: 199
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja) FROM stdin;
001a0000-55fb-c448-d876-b9a3484a138b	00180000-55fb-c448-a86b-48501d1e3a1c	000c0000-55fb-c448-8e52-52150c9e6e05	00090000-55fb-c447-7eaa-63f70b0bd215	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55fb-c448-89d7-23bad8cdfec9	00180000-55fb-c448-a86b-48501d1e3a1c	000c0000-55fb-c448-b3a0-430393bb2af1	00090000-55fb-c447-c5db-f86508a7e980	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55fb-c448-4c50-3b769b8fe0ee	00180000-55fb-c448-a86b-48501d1e3a1c	000c0000-55fb-c448-87b7-ad3e08f74cdf	00090000-55fb-c447-a305-f5e000b69592	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55fb-c448-b1fd-412a18a43307	00180000-55fb-c448-a86b-48501d1e3a1c	000c0000-55fb-c448-8523-9f859f27eacc	00090000-55fb-c447-a833-8c67c15910c2	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55fb-c448-266f-d4e61aef6511	00180000-55fb-c448-a86b-48501d1e3a1c	000c0000-55fb-c448-30dd-86291770fad6	00090000-55fb-c447-bb91-c549d26e1f85	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55fb-c448-4fea-2117f35517b1	00180000-55fb-c448-b7d4-2986776339ab	\N	00090000-55fb-c447-bb91-c549d26e1f85	2015-08-01 20:00:00	2015-08-01 23:00:00	\N	\N	2.00
\.


--
-- TOC entry 2976 (class 0 OID 19993644)
-- Dependencies: 220
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, sifra, ime, opis, imezenski, podrocje) FROM stdin;
000f0000-55fb-c446-639c-1f78b5390e7b	01	Avtor	Avtorji	Avtorka	umetnik
000f0000-55fb-c446-6a04-6b9ead74a52f	02	Priredba	Priredba	Priredba	umetnik
000f0000-55fb-c446-1d58-d9ee3766f747	03	Prevod	Prevod	Prevod	umetnik
000f0000-55fb-c446-1f39-23155a900a01	04	Režija	Režija	Režija	umetnik
000f0000-55fb-c446-433a-da085beeb616	05	Dramaturgija	Dramaturgija	Dramaturgija	umetnik
000f0000-55fb-c446-380d-d2dcc3bce125	06	Scenografija	Scenografija	Scenografija	umetnik
000f0000-55fb-c446-dc83-14bd0eb87597	07	Kostumografija	Kostumografija	Kostumografija	umetnik
000f0000-55fb-c446-8279-76aacf20af9c	08	Koreografija	Koreografija	Koreografija	umetnik
000f0000-55fb-c446-6671-58b09f240a1a	09	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	umetnik
000f0000-55fb-c446-a62e-83d26009ff40	10	Oblikovanje maske	Oblikovanje maske	Oblikovanje maske	umetnik
000f0000-55fb-c446-8404-7c545c69232e	11	Lektorstvo	Lektorstvo	Lektorstvo	umetnik
000f0000-55fb-c446-926b-7d8e4637ce5a	12	Glasbeni soustvarjalec	Glasbeni soustvarjalci	Glasbena soustvarjalka	umetnik
000f0000-55fb-c446-df9d-2fc2948a5dae	13	Intermedijski ustvarjalec	Intermedijski ustvarjalci	Intermedijski ustvarjalka	umetnik
000f0000-55fb-c446-8d5f-5f51b3068650	14	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	umetnik
000f0000-55fb-c446-2abe-56025d38b97e	15	Vloga	Intermedijski ustvarjalci	Intermedijska ustvarjalka	igralec
000f0000-55fb-c446-47cb-ef4b3a1c1651	16	Produkcija, mentorstvo	Produkcija, mentorstvo	Produkcija, mentorstvo	umetnik
000f0000-55fb-c446-11d5-1ece1487aa36	17	Tehnična podpora	Tehnična podpora	Tehnična podpora	tehnik
000f0000-55fb-c446-816a-18b8eaf8c482	18	Inšpicient	Inšpicienti	Inšpicientka	inspicient
\.


--
-- TOC entry 2989 (class 0 OID 19993888)
-- Dependencies: 233
-- Data for Name: tipprogramskeenote; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipprogramskeenote (id, sifra, naziv, koprodukcija, maxfaktor, maxvsi) FROM stdin;
002b0000-55fb-c446-dd6b-11f947d3f68b	01	Velika predstava	f	1.00	1.00
002b0000-55fb-c446-4f26-92712396fad9	02	Mala predstava	f	0.50	0.50
002b0000-55fb-c446-6830-582538721c17	03	Mala koprodukcija	t	0.40	1.00
002b0000-55fb-c446-79ee-d39195e87b4a	04	Srednja koprodukcija	t	0.70	2.00
002b0000-55fb-c446-9ecb-7afad4b9b080	05	Velika koprodukcija	t	1.00	3.00
\.


--
-- TOC entry 2945 (class 0 OID 19993319)
-- Dependencies: 189
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 2932 (class 0 OID 19993166)
-- Dependencies: 176
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-55fb-c446-e7a2-f9e76b7e40aa	Konzolni	$2y$05$NS4xMjkyMTcwMzExMjAxRO4GtBIQUyHk5G/TJc0y7SCecqGXr..CO	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-55fb-c447-3e61-8b3168e80af8	testni uporabnik za inšpicienta	$2y$05$NS4xMjkyMTcwMzExMjAxROxkJ1B6xAXex6EZLIwJfWzRJ8DpfecFO	t	\N	\N	\N	ivo@ifigenija.si	\N	\N	\N
00010000-55fb-c447-7873-695ca9fbba62	testni uporabnik za Tehničnega vodjo	$2y$05$NS4xMjkyMTcwMzExMjAxROu/kXWR9sP9oamkesKuxXLbxkCb387.G	t	\N	\N	\N	tona@ifigenija.si	\N	\N	\N
00010000-55fb-c447-a67c-b70b6cd702a8	testni uporabnik za igralca	$2y$05$NS4xMjkyMTcwMzExMjAxRO/hLCgClfERRsfCAFYwxNCcFIVjP2982	t	\N	\N	\N	irena@ifigenija.si	\N	\N	\N
00010000-55fb-c447-1ab1-78f3584b6081	testni uporabnik vnašalca termina storitev (TerminStoritve-vse)	$2y$05$NS4xMjkyMTcwMzExMjAxROT6.kTHqEq4.wa2SOnf124/N14m9qeP.	t	\N	\N	\N	tatjana@ifigenija.si	\N	\N	\N
00010000-55fb-c447-15fd-a3842b458b3a	testni uporabnik, ki je inšpicient brez zapisov v TerminStoritve	$2y$05$NS4xMjkyMTcwMzExMjAxROHau47Dtb7CME5.nlWwBVM.nusFP.ra2	t	\N	\N	\N	joze@ifigenija.si	\N	\N	\N
00010000-55fb-c447-ce2c-0a9c69fa9431	testna uporabnica, ki je planerka	$2y$05$NS4xMjkyMTcwMzExMjAxRO.B/uJO3C7QRNhdX9Q2hTLQsSupj1V1S	t	\N	\N	\N	petra@ifigenija.si	\N	\N	\N
00010000-55fb-c447-dd00-7b6070a8c9ea	testni uporabnik, ki dobi ifi-all vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROv2d7jqhaV/Mz3EIsKoi7UoFR.SDSMBm	t	\N	\N	\N	ali@ifigenija.si	\N	\N	\N
00010000-55fb-c447-bd3a-720d89ffdba2	testni uporabnik, ki dobi ifi-readall vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROYB9g.gnkufr1l/gWK6mkx.ySqrOWnJC	t	\N	\N	\N	berta@ifigenija.si	\N	\N	\N
00010000-55fb-c447-4fb1-3748226d61d2	testni uporabnik, ki dobi aaa-write dovoljenje	$2y$05$NS4xMjkyMTcwMzExMjAxRORujYObKX.DzpXVYbePkiJkHqg0/Ylya	t	\N	\N	\N	aaron@ifigenija.si	\N	\N	\N
00010000-55fb-c447-a68c-3fc464ce23cc	testni uporabnik ki dobi vsa posamezna dovoljenja	$2y$05$NS4xMjkyMTcwMzExMjAxRO2ymwxVXTr7U4Ncdn.bN49E8rLw9Jg0O	t	\N	\N	\N	vesna@ifigenija.si	\N	\N	\N
00010000-55fb-c446-17ef-692fca6b907d	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 2980 (class 0 OID 19993693)
-- Dependencies: 224
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, producent_id, sifra, faza, naslov, podnaslov, delovninaslov, internacionalninaslov, naslovizvirnika, podnaslovizvirnika, datumzacstudija, stevilovaj, planiranostevilovaj, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, krstna, prvaslovenska, kratkinaslov, maticnioder_id) FROM stdin;
000e0000-55fb-c447-c201-5005cb3c3085	00160000-55fb-c447-0834-ca045aeda0a1	\N	00140000-55fb-c446-d6f1-b86ad1bd5ffc	\N	0001	produkcija	Sen kresne noči		Sanje	\N	\N	\N	2016-02-01	\N	\N	2016-06-01	1	William Shakespeare	f	2				\N	f	\N	\N		00220000-55fb-c447-aa23-307944606583
000e0000-55fb-c447-d10a-87a88dd8e690	00160000-55fb-c447-47eb-aa7e709ec6b0	\N	00140000-55fb-c446-1af2-a1e850ea35c9	\N	0002	predprodukcija-ideja	Smoletov vrt			\N	\N	\N	2016-01-01	\N	\N	2016-04-20	2	B. Hočevar	f	2				\N	f	\N	\N		00220000-55fb-c447-de57-f78ac0dc7779
000e0000-55fb-c447-d936-28279a6cf6f1	\N	\N	00140000-55fb-c446-1af2-a1e850ea35c9	00190000-55fb-c447-bd86-e49e2e4d480e	0003	postprodukcija	Kisli maček			\N	\N	\N	2016-02-01	\N	\N	2016-04-20	2	Caryl Churchill	t	2				\N	f	\N	\N		00220000-55fb-c447-aa23-307944606583
000e0000-55fb-c447-d3e9-1d343f44a212	\N	\N	00140000-55fb-c446-1af2-a1e850ea35c9	00190000-55fb-c447-bd86-e49e2e4d480e	0004	postprodukcija	Vladimir			\N	\N	\N	2017-03-01	\N	\N	2017-04-20	2	Matjaž Zupančič	t	2				\N	f	\N	\N		00220000-55fb-c447-aa23-307944606583
000e0000-55fb-c447-b17b-06baa2380a55	\N	\N	00140000-55fb-c446-1af2-a1e850ea35c9	00190000-55fb-c447-bd86-e49e2e4d480e	0005	postprodukcija	Španska princesa			\N	\N	\N	2017-04-01	\N	\N	2017-05-20	1	Nina Kokelj	f	1				\N	f	\N	\N		00220000-55fb-c447-ecc7-cbf2025f9cb5
000e0000-55fb-c447-0805-dd4388b09aac	\N	\N	00140000-55fb-c446-1af2-a1e850ea35c9	00190000-55fb-c447-bd86-e49e2e4d480e	0006	postprodukcija	Ne vemo datumov			\N	\N	\N	\N	\N	\N	\N	1	Nandi Frafar	f	1				\N	f	\N	\N		00220000-55fb-c447-ecc7-cbf2025f9cb5
\.


--
-- TOC entry 2950 (class 0 OID 19993383)
-- Dependencies: 194
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, uprizoritev_id, vrsta, zaporedna, porocilo) FROM stdin;
00200000-55fb-c447-e68f-a4b2ce7c76ab	000e0000-55fb-c447-d10a-87a88dd8e690	\N	1	
00200000-55fb-c447-5d0e-f6e9d625c10e	000e0000-55fb-c447-d10a-87a88dd8e690	\N	2	
00200000-55fb-c447-b695-18f9b5902852	000e0000-55fb-c447-d10a-87a88dd8e690	\N	3	
00200000-55fb-c447-8249-a4c316dc7f01	000e0000-55fb-c447-d10a-87a88dd8e690	\N	4	
00200000-55fb-c447-515b-b20770c914d8	000e0000-55fb-c447-d10a-87a88dd8e690	\N	5	
\.


--
-- TOC entry 2964 (class 0 OID 19993511)
-- Dependencies: 208
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 2974 (class 0 OID 19993617)
-- Dependencies: 218
-- Data for Name: vrstastroska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstastroska (id, skupina, podskupina, naziv, opis) FROM stdin;
003b0000-55fb-c446-d884-5e9023b3327b	1	0	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE
003b0000-55fb-c446-50c6-6c73dee2f0c8	1	1	Storitve varovanja zgradb in prostorov	storitve varovanja zgradb in prostorov (npr. gasilci na predstavah)
003b0000-55fb-c446-ab5a-2f7885547d95	1	2	Založniške in tiskarske storitve	založniške in tiskarske storitve
003b0000-55fb-c446-c64d-6cb0e4261687	1	3	Časopisi, revije, knjige in strokovna literatura	časopisi, revije, knjige in strokovna literatura
003b0000-55fb-c446-9c27-f1119c0c0763	1	4	Stroški prevajalskih storitev	stroški prevajalskih storitev
003b0000-55fb-c446-a61f-e492888c604a	1	5	Stroški oglaševalskih storitev	stroški oglaševalskih storitev
003b0000-55fb-c446-8cd2-6bb93906be65	1	6	Izdatki za reprezentanco	izdatki za reprezentanco
003b0000-55fb-c446-9ff8-4455ad735672	2	0	POSEBNI MATERIAL IN STORITVE	POSEBNI MATERIAL IN STORITVE
003b0000-55fb-c446-57b0-ee928ca52e2b	2	1	Drugi posebni material in storitve	drugi posebni material in storitve (npr. za instrumete - navedite)
003b0000-55fb-c446-8d65-c8bfa4f1321e	2	2	Oprema predstave – stroški rekvizitov	Oprema predstave – stroški rekvizitov
003b0000-55fb-c446-af91-8476939c0f68	2	3	Oprema predstave – stroški kostumov	Oprema predstave – stroški kostumov
003b0000-55fb-c446-9e82-376c802e6f72	2	4	Oprema predstave – stroški scenske opreme	Oprema predstave – stroški scenske opreme
003b0000-55fb-c446-8923-d9c73d31f56c	2	5	Oprema predstave – stroški avdio in video opreme	Oprema predstave – stroški avdio in video opreme
003b0000-55fb-c446-b650-b61e83d1684b	3	0	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE
003b0000-55fb-c446-828a-8a438604061b	3	1	Poštnina in kurirske storitve	poštnina in kurirske storitve
003b0000-55fb-c446-b091-608323a9b38d	4	0	PREVOZNI STROŠKI IN STORITVE	PREVOZNI STROŠKI IN STORITVE
003b0000-55fb-c446-323c-916ea44f8652	4	1	Goriva in maziva za prevozna sredstva	goriva in maziva za prevozna sredstva
003b0000-55fb-c446-5a2d-dfa630d708bc	4	2	Najem vozil in selitveni stroški	najem vozil in selitveni stroški
003b0000-55fb-c446-6cdc-80b07fd15d12	4	3	Drugi prevozni in transportni stroški 	drugi prevozni in transportni stroški (navedite)
003b0000-55fb-c446-688b-a87bf4bd77da	5	0	IZDATKI ZA SLUŽBENA POTOVANJA	IZDATKI ZA SLUŽBENA POTOVANJA
003b0000-55fb-c446-b98c-f5eea344bc5a	5	1	Dnevnice za službena potovanja v državi in tujini	dnevnice za službena potovanja v državi in tujini
003b0000-55fb-c446-b9bc-3d918e7dad62	5	2	Hotelske in restavra. storitve v državi in tujini	hotelske in restavra. storitve v državi in tujini
003b0000-55fb-c446-8433-f9e4a1e930ed	5	3	Stroški prevoza v državi in tujini	stroški prevoza v državi in tujini
003b0000-55fb-c446-7a61-7354360f5e25	5	4	Drugi izdatki za službena potovanja	drugi izdatki za službena potovanja (navedite)
003b0000-55fb-c446-d292-949e68ed7032	6	0	NAJEMNINE IN ZAKUPNINE	NAJEMNINE IN ZAKUPNINE
003b0000-55fb-c446-d38c-497617f0fd2b	6	1	Druge najemnine, zakupnine in licenčnine	druge najemnine, zakupnine in licenčnine (npr. najem notnega materiala, instrumentov - navedite)
003b0000-55fb-c446-2b64-e81622abbcf3	7	0	DRUGI OPERATIVNI ODHODKI	DRUGI OPERATIVNI ODHODKI
003b0000-55fb-c446-240f-e5d3da9ca4b9	7	1	Izdatki za strok. izobraževanje zap.	izdatki za strok. izobraževanje zap.(vezani na program. enote)  
\.


--
-- TOC entry 2992 (class 0 OID 19993935)
-- Dependencies: 236
-- Data for Name: vrstazapisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstazapisa (id, oznaka, naziv, aktiven, znacka, ikona, upor, datknj) FROM stdin;
\.


--
-- TOC entry 2991 (class 0 OID 19993907)
-- Dependencies: 235
-- Data for Name: zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapis (id, vrsta_id, datoteka_id, mapa_id, avtor_id, zaklenil_id, tip, zaklenjen, datumzaklepanja, identifier, subject, title, description, coverage, creator, language, date, publisher, relation, rights, source, upor, datknj, standard, lokacija) FROM stdin;
\.


--
-- TOC entry 2993 (class 0 OID 19993947)
-- Dependencies: 237
-- Data for Name: zapislastnik; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapislastnik (id, zapis_id, lastnik, classlastnika, datum, upor, datknj) FROM stdin;
\.


--
-- TOC entry 2971 (class 0 OID 19993583)
-- Dependencies: 215
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, sifra, status, delovnomesto, zacetek, konec, tip, delovnaobveza, malica, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci) FROM stdin;
00100000-55fb-c448-da2a-071ed5f25346	00090000-55fb-c447-c5db-f86508a7e980	01	A	Mojster	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55fb-c448-5d3d-9aec759a99c8	00090000-55fb-c447-a305-f5e000b69592	02	A	Igralec	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55fb-c448-8bad-f8bb06350291	00090000-55fb-c447-3c3a-f5c43179de76	03	A	Natakar	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55fb-c448-4939-c3310ca21b8a	00090000-55fb-c447-9b06-0a3589525cd7	04	A	Mizar	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55fb-c448-6ad5-9cf2718a64d0	00090000-55fb-c447-7eaa-63f70b0bd215	05	A	Šivilja	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55fb-c448-f8d5-fca20894546b	00090000-55fb-c447-1fe9-9618f8f242e2	06	A	Inšpicient	2010-02-01	2010-02-01	1	2		t	f	f	t
\.


--
-- TOC entry 2952 (class 0 OID 19993419)
-- Dependencies: 196
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id, oseba_id) FROM stdin;
\.


--
-- TOC entry 2979 (class 0 OID 19993683)
-- Dependencies: 223
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, sifra, naziv, opis) FROM stdin;
00140000-55fb-c446-d6f1-b86ad1bd5ffc	01	Drama	drama (SURS 01)
00140000-55fb-c446-2081-198fa3f1b23e	02	Opera	opera (SURS 02)
00140000-55fb-c446-24d5-8f27aa6b2cb6	03	Balet	balet (SURS 03)
00140000-55fb-c446-9026-905c91a25bb2	04	Plesne prireditve	plesne prireditve (SURS 04)
00140000-55fb-c446-dd89-ec5544609146	05	Lutkovno gledališče	lutkovno gledališče (SURS 05)
00140000-55fb-c446-1af2-a1e850ea35c9	06	Raziskovalno gledališče	raziskovalno gledališče (SURS 06)
00140000-55fb-c446-c4e0-d455f1b15ebe	07	Drugo	drugo (SURS 07)
\.


--
-- TOC entry 2970 (class 0 OID 19993573)
-- Dependencies: 214
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, sifra, naziv, opis) FROM stdin;
\.


--
-- TOC entry 2476 (class 2606 OID 19993220)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2655 (class 2606 OID 19993742)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2651 (class 2606 OID 19993732)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2625 (class 2606 OID 19993642)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2712 (class 2606 OID 19993987)
-- Name: datoteka_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT datoteka_pkey PRIMARY KEY (id);


--
-- TOC entry 2530 (class 2606 OID 19993408)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2545 (class 2606 OID 19993429)
-- Name: dogodeksplosni_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodeksplosni
    ADD CONSTRAINT dogodeksplosni_pkey PRIMARY KEY (id);


--
-- TOC entry 2688 (class 2606 OID 19993905)
-- Name: drugivir_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT drugivir_pkey PRIMARY KEY (id);


--
-- TOC entry 2510 (class 2606 OID 19993345)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2662 (class 2606 OID 19993797)
-- Name: enotaprograma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT enotaprograma_pkey PRIMARY KEY (id);


--
-- TOC entry 2603 (class 2606 OID 19993569)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2524 (class 2606 OID 19993381)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2518 (class 2606 OID 19993359)
-- Name: kontaktnaoseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT kontaktnaoseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2567 (class 2606 OID 19993476)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2706 (class 2606 OID 19993964)
-- Name: mapa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT mapa_pkey PRIMARY KEY (id);


--
-- TOC entry 2710 (class 2606 OID 19993971)
-- Name: mapa_zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT mapa_zapis_pkey PRIMARY KEY (mapa_id, zapis_id);


--
-- TOC entry 2717 (class 2606 OID 19993995)
-- Name: mapaacl_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT mapaacl_pkey PRIMARY KEY (id);


--
-- TOC entry 2448 (class 2606 OID 19946842)
-- Name: migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY migrations
    ADD CONSTRAINT migrations_pkey PRIMARY KEY (version);


--
-- TOC entry 2579 (class 2606 OID 19993503)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2503 (class 2606 OID 19993317)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2480 (class 2606 OID 19993229)
-- Name: optionvalue_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT optionvalue_pkey PRIMARY KEY (id);


--
-- TOC entry 2483 (class 2606 OID 19993253)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2474 (class 2606 OID 19993209)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2467 (class 2606 OID 19993194)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2582 (class 2606 OID 19993509)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2596 (class 2606 OID 19993545)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2637 (class 2606 OID 19993678)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2492 (class 2606 OID 19993281)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2500 (class 2606 OID 19993305)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2672 (class 2606 OID 19993858)
-- Name: postavkacdve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkacdve
    ADD CONSTRAINT postavkacdve_pkey PRIMARY KEY (id);


--
-- TOC entry 2571 (class 2606 OID 19993482)
-- Name: postavkaracuna_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT postavkaracuna_pkey PRIMARY KEY (id);


--
-- TOC entry 2498 (class 2606 OID 19993295)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2522 (class 2606 OID 19993369)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2577 (class 2606 OID 19993494)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2676 (class 2606 OID 19993867)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2678 (class 2606 OID 19993875)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2669 (class 2606 OID 19993845)
-- Name: programdela_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT programdela_pkey PRIMARY KEY (id);


--
-- TOC entry 2683 (class 2606 OID 19993886)
-- Name: programskaenotasklopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT programskaenotasklopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2589 (class 2606 OID 19993527)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2565 (class 2606 OID 19993467)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2559 (class 2606 OID 19993458)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2632 (class 2606 OID 19993666)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2616 (class 2606 OID 19993600)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2459 (class 2606 OID 19993165)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2594 (class 2606 OID 19993536)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2465 (class 2606 OID 19993183)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2469 (class 2606 OID 19993203)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2601 (class 2606 OID 19993554)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2573 (class 2606 OID 19993489)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2547 (class 2606 OID 19993438)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2456 (class 2606 OID 19993153)
-- Name: stevilcenje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenje
    ADD CONSTRAINT stevilcenje_pkey PRIMARY KEY (id);


--
-- TOC entry 2453 (class 2606 OID 19993141)
-- Name: stevilcenjekonfig_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT stevilcenjekonfig_pkey PRIMARY KEY (id);


--
-- TOC entry 2450 (class 2606 OID 19993135)
-- Name: stevilcenjestanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjestanje
    ADD CONSTRAINT stevilcenjestanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2621 (class 2606 OID 19993613)
-- Name: strosekuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT strosekuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2489 (class 2606 OID 19993262)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2553 (class 2606 OID 19993449)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2628 (class 2606 OID 19993653)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2685 (class 2606 OID 19993898)
-- Name: tipprogramskeenote_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipprogramskeenote
    ADD CONSTRAINT tipprogramskeenote_pkey PRIMARY KEY (id);


--
-- TOC entry 2508 (class 2606 OID 19993330)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2461 (class 2606 OID 19993178)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2649 (class 2606 OID 19993711)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2528 (class 2606 OID 19993391)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2585 (class 2606 OID 19993517)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2623 (class 2606 OID 19993625)
-- Name: vrstastroska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstastroska
    ADD CONSTRAINT vrstastroska_pkey PRIMARY KEY (id);


--
-- TOC entry 2699 (class 2606 OID 19993945)
-- Name: vrstazapisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstazapisa
    ADD CONSTRAINT vrstazapisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2696 (class 2606 OID 19993929)
-- Name: zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT zapis_pkey PRIMARY KEY (id);


--
-- TOC entry 2702 (class 2606 OID 19993953)
-- Name: zapislastnik_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT zapislastnik_pkey PRIMARY KEY (id);


--
-- TOC entry 2612 (class 2606 OID 19993591)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2543 (class 2606 OID 19993423)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2641 (class 2606 OID 19993691)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2609 (class 2606 OID 19993581)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2531 (class 1259 OID 19993417)
-- Name: dogodki_konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_konec ON dogodek USING btree (konec);


--
-- TOC entry 2532 (class 1259 OID 19993418)
-- Name: dogodki_razred; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_razred ON dogodek USING btree (razred);


--
-- TOC entry 2533 (class 1259 OID 19993416)
-- Name: dogodki_zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2534 (class 1259 OID 19993415)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2535 (class 1259 OID 19993414)
-- Name: idx_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2617 (class 1259 OID 19993614)
-- Name: idx_11ffe6e05c75296c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e05c75296c ON strosekuprizoritve USING btree (vrstastroska_id);


--
-- TOC entry 2618 (class 1259 OID 19993615)
-- Name: idx_11ffe6e062b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e062b4ffca ON strosekuprizoritve USING btree (uprizoritev_id);


--
-- TOC entry 2619 (class 1259 OID 19993616)
-- Name: idx_11ffe6e06beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e06beede51 ON strosekuprizoritve USING btree (popa_id);


--
-- TOC entry 2703 (class 1259 OID 19993966)
-- Name: idx_14a5d6d3727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d3727aca70 ON mapa USING btree (parent_id);


--
-- TOC entry 2704 (class 1259 OID 19993965)
-- Name: idx_14a5d6d38a4a6c12; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d38a4a6c12 ON mapa USING btree (lastnik_id);


--
-- TOC entry 2490 (class 1259 OID 19993283)
-- Name: idx_1c7adba5ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba5ee4b985a ON popa USING btree (drzava_id);


--
-- TOC entry 2580 (class 1259 OID 19993510)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2690 (class 1259 OID 19993933)
-- Name: idx_1ed92829253c4123; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829253c4123 ON zapis USING btree (avtor_id);


--
-- TOC entry 2691 (class 1259 OID 19993932)
-- Name: idx_1ed9282957ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282957ed422f ON zapis USING btree (mapa_id);


--
-- TOC entry 2692 (class 1259 OID 19993934)
-- Name: idx_1ed9282987ff3295; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282987ff3295 ON zapis USING btree (zaklenil_id);


--
-- TOC entry 2693 (class 1259 OID 19993931)
-- Name: idx_1ed92829a54dbb1f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829a54dbb1f ON zapis USING btree (datoteka_id);


--
-- TOC entry 2694 (class 1259 OID 19993930)
-- Name: idx_1ed92829ef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829ef943358 ON zapis USING btree (vrsta_id);


--
-- TOC entry 2574 (class 1259 OID 19993496)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2575 (class 1259 OID 19993495)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2526 (class 1259 OID 19993392)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2604 (class 1259 OID 19993570)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2605 (class 1259 OID 19993572)
-- Name: idx_23aeb9586b361365; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9586b361365 ON funkcija USING btree (tipfunkcije_id);


--
-- TOC entry 2606 (class 1259 OID 19993571)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2515 (class 1259 OID 19993361)
-- Name: idx_2942b10710389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b10710389148 ON kontaktnaoseba USING btree (oseba_id);


--
-- TOC entry 2516 (class 1259 OID 19993360)
-- Name: idx_2942b1076beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b1076beede51 ON kontaktnaoseba USING btree (popa_id);


--
-- TOC entry 2681 (class 1259 OID 19993887)
-- Name: idx_2d901816d6bc69d6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2d901816d6bc69d6 ON programskaenotasklopa USING btree (programrazno_id);


--
-- TOC entry 2633 (class 1259 OID 19993680)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2634 (class 1259 OID 19993681)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2635 (class 1259 OID 19993682)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2700 (class 1259 OID 19993954)
-- Name: idx_2eaff9dcaf91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2eaff9dcaf91ecd ON zapislastnik USING btree (zapis_id);


--
-- TOC entry 2642 (class 1259 OID 19993716)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2643 (class 1259 OID 19993713)
-- Name: idx_344a77a7c3b0d59; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a7c3b0d59 ON uprizoritev USING btree (maticnioder_id);


--
-- TOC entry 2644 (class 1259 OID 19993717)
-- Name: idx_344a77a853a965c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a853a965c ON uprizoritev USING btree (producent_id);


--
-- TOC entry 2645 (class 1259 OID 19993715)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2646 (class 1259 OID 19993714)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2505 (class 1259 OID 19993332)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2506 (class 1259 OID 19993331)
-- Name: idx_37f6541a6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a6beede51 ON trr USING btree (popa_id);


--
-- TOC entry 2481 (class 1259 OID 19993256)
-- Name: idx_466966d769e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_466966d769e8d4 ON oseba USING btree (naslov_id);


--
-- TOC entry 2592 (class 1259 OID 19993537)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2471 (class 1259 OID 19993210)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2472 (class 1259 OID 19993211)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2597 (class 1259 OID 19993557)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2598 (class 1259 OID 19993556)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2599 (class 1259 OID 19993555)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2519 (class 1259 OID 19993370)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2520 (class 1259 OID 19993371)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2451 (class 1259 OID 19993143)
-- Name: idx_6054e804ff55f926; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_6054e804ff55f926 ON stevilcenjekonfig USING btree (stevilcenje_id);


--
-- TOC entry 2554 (class 1259 OID 19993462)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2555 (class 1259 OID 19993460)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2556 (class 1259 OID 19993459)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2557 (class 1259 OID 19993461)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2462 (class 1259 OID 19993184)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2463 (class 1259 OID 19993185)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2583 (class 1259 OID 19993518)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2713 (class 1259 OID 19993988)
-- Name: idx_781826c67e3c61f9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_781826c67e3c61f9 ON datoteka USING btree (owner_id);


--
-- TOC entry 2714 (class 1259 OID 19993996)
-- Name: idx_7adc957157ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc957157ed422f ON mapaacl USING btree (mapa_id);


--
-- TOC entry 2715 (class 1259 OID 19993997)
-- Name: idx_7adc9571fa6311ef; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc9571fa6311ef ON mapaacl USING btree (perm_id);


--
-- TOC entry 2569 (class 1259 OID 19993483)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2613 (class 1259 OID 19993601)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2614 (class 1259 OID 19993602)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2663 (class 1259 OID 19993802)
-- Name: idx_8787a0e54ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e54ae1cd1c ON enotaprograma USING btree (gostitelj_id);


--
-- TOC entry 2664 (class 1259 OID 19993801)
-- Name: idx_8787a0e55d0da56c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e55d0da56c ON enotaprograma USING btree (drzavagostovanja_id);


--
-- TOC entry 2665 (class 1259 OID 19993798)
-- Name: idx_8787a0e562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e562b4ffca ON enotaprograma USING btree (uprizoritev_id);


--
-- TOC entry 2666 (class 1259 OID 19993799)
-- Name: idx_8787a0e57222d84b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e57222d84b ON enotaprograma USING btree (tipprogramskeenote_id);


--
-- TOC entry 2667 (class 1259 OID 19993800)
-- Name: idx_8787a0e5771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e5771ec7bd ON enotaprograma USING btree (program_dela_id);


--
-- TOC entry 2494 (class 1259 OID 19993297)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2495 (class 1259 OID 19993296)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2496 (class 1259 OID 19993298)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2586 (class 1259 OID 19993531)
-- Name: idx_952dd21969e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd21969e8d4 ON prostor USING btree (naslov_id);


--
-- TOC entry 2587 (class 1259 OID 19993530)
-- Name: idx_952dd2196beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd2196beede51 ON prostor USING btree (popa_id);


--
-- TOC entry 2673 (class 1259 OID 19993868)
-- Name: idx_97af082e38c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e38c06eb ON produkcijadelitev USING btree (enotaprograma_id);


--
-- TOC entry 2674 (class 1259 OID 19993869)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2656 (class 1259 OID 19993746)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2657 (class 1259 OID 19993747)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2658 (class 1259 OID 19993744)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2659 (class 1259 OID 19993745)
-- Name: idx_a4b7244fa4976613; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fa4976613 ON alternacija USING btree (zaposlitev_id);


--
-- TOC entry 2610 (class 1259 OID 19993592)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2560 (class 1259 OID 19993471)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2561 (class 1259 OID 19993470)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2562 (class 1259 OID 19993468)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2563 (class 1259 OID 19993469)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2652 (class 1259 OID 19993734)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2653 (class 1259 OID 19993733)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2525 (class 1259 OID 19993382)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2670 (class 1259 OID 19993859)
-- Name: idx_dba42fe79e3adf2c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_dba42fe79e3adf2c ON postavkacdve USING btree (programdela_id);


--
-- TOC entry 2689 (class 1259 OID 19993906)
-- Name: idx_e7d4cf2638c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e7d4cf2638c06eb ON drugivir USING btree (enotaprograma_id);


--
-- TOC entry 2707 (class 1259 OID 19993972)
-- Name: idx_e9f8ee8257ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee8257ed422f ON mapa_zapis USING btree (mapa_id);


--
-- TOC entry 2708 (class 1259 OID 19993973)
-- Name: idx_e9f8ee82af91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee82af91ecd ON mapa_zapis USING btree (zapis_id);


--
-- TOC entry 2477 (class 1259 OID 19993231)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2478 (class 1259 OID 19993230)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2486 (class 1259 OID 19993263)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2487 (class 1259 OID 19993264)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2541 (class 1259 OID 19993424)
-- Name: idx_f44a386d10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_f44a386d10389148 ON zasedenost USING btree (oseba_id);


--
-- TOC entry 2549 (class 1259 OID 19993452)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2550 (class 1259 OID 19993451)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2551 (class 1259 OID 19993450)
-- Name: idx_fef7d84ba81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84ba81ccef6 ON terminstoritve USING btree (dogodek_id);


--
-- TOC entry 2536 (class 1259 OID 19993410)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2537 (class 1259 OID 19993411)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2538 (class 1259 OID 19993409)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2539 (class 1259 OID 19993413)
-- Name: uniq_11e93b5dbbc7a989; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dbbc7a989 ON dogodek USING btree (dogodek_splosni_id);


--
-- TOC entry 2540 (class 1259 OID 19993412)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2493 (class 1259 OID 19993282)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2511 (class 1259 OID 19993346)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2512 (class 1259 OID 19993348)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2513 (class 1259 OID 19993347)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2514 (class 1259 OID 19993349)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2568 (class 1259 OID 19993477)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2638 (class 1259 OID 19993679)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2647 (class 1259 OID 19993712)
-- Name: uniq_344a77a559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_344a77a559828a3 ON uprizoritev USING btree (sifra);


--
-- TOC entry 2629 (class 1259 OID 19993654)
-- Name: uniq_3f50510d559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d559828a3 ON tipfunkcije USING btree (sifra);


--
-- TOC entry 2630 (class 1259 OID 19993655)
-- Name: uniq_3f50510d55cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d55cca980 ON tipfunkcije USING btree (ime);


--
-- TOC entry 2484 (class 1259 OID 19993254)
-- Name: uniq_466966d7559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7559828a3 ON oseba USING btree (sifra);


--
-- TOC entry 2485 (class 1259 OID 19993255)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2607 (class 1259 OID 19993582)
-- Name: uniq_5216fcb0559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5216fcb0559828a3 ON zvrstuprizoritve USING btree (sifra);


--
-- TOC entry 2457 (class 1259 OID 19993154)
-- Name: uniq_5a434fbc559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5a434fbc559828a3 ON stevilcenje USING btree (sifra);


--
-- TOC entry 2504 (class 1259 OID 19993318)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2454 (class 1259 OID 19993142)
-- Name: uniq_6054e804889a7556; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_6054e804889a7556 ON stevilcenjekonfig USING btree (dok);


--
-- TOC entry 2686 (class 1259 OID 19993899)
-- Name: uniq_7d834df4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_7d834df4559828a3 ON tipprogramskeenote USING btree (sifra);


--
-- TOC entry 2590 (class 1259 OID 19993529)
-- Name: uniq_952dd21937854736; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21937854736 ON prostor USING btree (naziv);


--
-- TOC entry 2591 (class 1259 OID 19993528)
-- Name: uniq_952dd219559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd219559828a3 ON prostor USING btree (sifra);


--
-- TOC entry 2660 (class 1259 OID 19993743)
-- Name: uniq_a4b7244f559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a4b7244f559828a3 ON alternacija USING btree (sifra);


--
-- TOC entry 2501 (class 1259 OID 19993306)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2639 (class 1259 OID 19993692)
-- Name: uniq_cede8e36559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_cede8e36559828a3 ON zvrstsurs USING btree (sifra);


--
-- TOC entry 2697 (class 1259 OID 19993946)
-- Name: uniq_de1c8aa1d55226c7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_de1c8aa1d55226c7 ON vrstazapisa USING btree (oznaka);


--
-- TOC entry 2679 (class 1259 OID 19993876)
-- Name: uniq_e6fc2028559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc2028559828a3 ON produkcijskahisa USING btree (sifra);


--
-- TOC entry 2680 (class 1259 OID 19993877)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2626 (class 1259 OID 19993643)
-- Name: uniq_ec773670ca2e5fcb; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ec773670ca2e5fcb ON besedilo USING btree (stevilka);


--
-- TOC entry 2548 (class 1259 OID 19993439)
-- Name: uniq_ecc8f8c5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ecc8f8c5559828a3 ON sezona USING btree (sifra);


--
-- TOC entry 2470 (class 1259 OID 19993204)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2746 (class 2606 OID 19994118)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2745 (class 2606 OID 19994123)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2741 (class 2606 OID 19994143)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2747 (class 2606 OID 19994113)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2743 (class 2606 OID 19994133)
-- Name: fk_11e93b5dbbc7a989; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dbbc7a989 FOREIGN KEY (dogodek_splosni_id) REFERENCES dogodeksplosni(id);


--
-- TOC entry 2742 (class 2606 OID 19994138)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2744 (class 2606 OID 19994128)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2780 (class 2606 OID 19994298)
-- Name: fk_11ffe6e05c75296c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e05c75296c FOREIGN KEY (vrstastroska_id) REFERENCES vrstastroska(id);


--
-- TOC entry 2779 (class 2606 OID 19994303)
-- Name: fk_11ffe6e062b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e062b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2778 (class 2606 OID 19994308)
-- Name: fk_11ffe6e06beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e06beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2812 (class 2606 OID 19994473)
-- Name: fk_14a5d6d3727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d3727aca70 FOREIGN KEY (parent_id) REFERENCES mapa(id);


--
-- TOC entry 2813 (class 2606 OID 19994468)
-- Name: fk_14a5d6d38a4a6c12; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d38a4a6c12 FOREIGN KEY (lastnik_id) REFERENCES uporabniki(id);


--
-- TOC entry 2729 (class 2606 OID 19994053)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2764 (class 2606 OID 19994228)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2807 (class 2606 OID 19994453)
-- Name: fk_1ed92829253c4123; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829253c4123 FOREIGN KEY (avtor_id) REFERENCES uporabniki(id);


--
-- TOC entry 2808 (class 2606 OID 19994448)
-- Name: fk_1ed9282957ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282957ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2806 (class 2606 OID 19994458)
-- Name: fk_1ed9282987ff3295; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282987ff3295 FOREIGN KEY (zaklenil_id) REFERENCES uporabniki(id);


--
-- TOC entry 2809 (class 2606 OID 19994443)
-- Name: fk_1ed92829a54dbb1f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829a54dbb1f FOREIGN KEY (datoteka_id) REFERENCES datoteka(id);


--
-- TOC entry 2810 (class 2606 OID 19994438)
-- Name: fk_1ed92829ef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829ef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstazapisa(id);


--
-- TOC entry 2762 (class 2606 OID 19994223)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2763 (class 2606 OID 19994218)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2740 (class 2606 OID 19994108)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2774 (class 2606 OID 19994268)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2772 (class 2606 OID 19994278)
-- Name: fk_23aeb9586b361365; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9586b361365 FOREIGN KEY (tipfunkcije_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2773 (class 2606 OID 19994273)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2735 (class 2606 OID 19994088)
-- Name: fk_2942b10710389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b10710389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2736 (class 2606 OID 19994083)
-- Name: fk_2942b1076beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b1076beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2760 (class 2606 OID 19994208)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2804 (class 2606 OID 19994428)
-- Name: fk_2d901816d6bc69d6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT fk_2d901816d6bc69d6 FOREIGN KEY (programrazno_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2783 (class 2606 OID 19994313)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2782 (class 2606 OID 19994318)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2781 (class 2606 OID 19994323)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 2811 (class 2606 OID 19994463)
-- Name: fk_2eaff9dcaf91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT fk_2eaff9dcaf91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id);


--
-- TOC entry 2785 (class 2606 OID 19994343)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2788 (class 2606 OID 19994328)
-- Name: fk_344a77a7c3b0d59; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a7c3b0d59 FOREIGN KEY (maticnioder_id) REFERENCES prostor(id);


--
-- TOC entry 2784 (class 2606 OID 19994348)
-- Name: fk_344a77a853a965c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a853a965c FOREIGN KEY (producent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2786 (class 2606 OID 19994338)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2787 (class 2606 OID 19994333)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2733 (class 2606 OID 19994078)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2734 (class 2606 OID 19994073)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2725 (class 2606 OID 19994038)
-- Name: fk_466966d769e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d769e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2726 (class 2606 OID 19994033)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2768 (class 2606 OID 19994248)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2722 (class 2606 OID 19994013)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2721 (class 2606 OID 19994018)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2769 (class 2606 OID 19994263)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2770 (class 2606 OID 19994258)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2771 (class 2606 OID 19994253)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2738 (class 2606 OID 19994093)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2737 (class 2606 OID 19994098)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2718 (class 2606 OID 19993998)
-- Name: fk_6054e804ff55f926; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT fk_6054e804ff55f926 FOREIGN KEY (stevilcenje_id) REFERENCES stevilcenje(id);


--
-- TOC entry 2752 (class 2606 OID 19994183)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2754 (class 2606 OID 19994173)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2755 (class 2606 OID 19994168)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2753 (class 2606 OID 19994178)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2720 (class 2606 OID 19994003)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2719 (class 2606 OID 19994008)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2765 (class 2606 OID 19994233)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2816 (class 2606 OID 19994488)
-- Name: fk_781826c67e3c61f9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT fk_781826c67e3c61f9 FOREIGN KEY (owner_id) REFERENCES uporabniki(id);


--
-- TOC entry 2818 (class 2606 OID 19994493)
-- Name: fk_7adc957157ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc957157ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2817 (class 2606 OID 19994498)
-- Name: fk_7adc9571fa6311ef; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc9571fa6311ef FOREIGN KEY (perm_id) REFERENCES permission(id);


--
-- TOC entry 2761 (class 2606 OID 19994213)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2777 (class 2606 OID 19994288)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2776 (class 2606 OID 19994293)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2795 (class 2606 OID 19994403)
-- Name: fk_8787a0e54ae1cd1c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e54ae1cd1c FOREIGN KEY (gostitelj_id) REFERENCES popa(id);


--
-- TOC entry 2796 (class 2606 OID 19994398)
-- Name: fk_8787a0e55d0da56c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e55d0da56c FOREIGN KEY (drzavagostovanja_id) REFERENCES drza(id);


--
-- TOC entry 2799 (class 2606 OID 19994383)
-- Name: fk_8787a0e562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2798 (class 2606 OID 19994388)
-- Name: fk_8787a0e57222d84b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e57222d84b FOREIGN KEY (tipprogramskeenote_id) REFERENCES tipprogramskeenote(id);


--
-- TOC entry 2797 (class 2606 OID 19994393)
-- Name: fk_8787a0e5771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e5771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2731 (class 2606 OID 19994063)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2732 (class 2606 OID 19994058)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2730 (class 2606 OID 19994068)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2766 (class 2606 OID 19994243)
-- Name: fk_952dd21969e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd21969e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2767 (class 2606 OID 19994238)
-- Name: fk_952dd2196beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd2196beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2802 (class 2606 OID 19994413)
-- Name: fk_97af082e38c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e38c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2801 (class 2606 OID 19994418)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2792 (class 2606 OID 19994373)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2791 (class 2606 OID 19994378)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2794 (class 2606 OID 19994363)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 2793 (class 2606 OID 19994368)
-- Name: fk_a4b7244fa4976613; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fa4976613 FOREIGN KEY (zaposlitev_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2775 (class 2606 OID 19994283)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2756 (class 2606 OID 19994203)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2757 (class 2606 OID 19994198)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2759 (class 2606 OID 19994188)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2758 (class 2606 OID 19994193)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2789 (class 2606 OID 19994358)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2790 (class 2606 OID 19994353)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2739 (class 2606 OID 19994103)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2800 (class 2606 OID 19994408)
-- Name: fk_dba42fe79e3adf2c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkacdve
    ADD CONSTRAINT fk_dba42fe79e3adf2c FOREIGN KEY (programdela_id) REFERENCES programdela(id);


--
-- TOC entry 2803 (class 2606 OID 19994423)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2805 (class 2606 OID 19994433)
-- Name: fk_e7d4cf2638c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT fk_e7d4cf2638c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2815 (class 2606 OID 19994478)
-- Name: fk_e9f8ee8257ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee8257ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id) ON DELETE CASCADE;


--
-- TOC entry 2814 (class 2606 OID 19994483)
-- Name: fk_e9f8ee82af91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee82af91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id) ON DELETE CASCADE;


--
-- TOC entry 2723 (class 2606 OID 19994028)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2724 (class 2606 OID 19994023)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2728 (class 2606 OID 19994043)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2727 (class 2606 OID 19994048)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2748 (class 2606 OID 19994148)
-- Name: fk_f44a386d10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT fk_f44a386d10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2749 (class 2606 OID 19994163)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2750 (class 2606 OID 19994158)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2751 (class 2606 OID 19994153)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- Completed on 2015-09-18 09:59:05 CEST

--
-- PostgreSQL database dump complete
--

