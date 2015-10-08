--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.9
-- Dumped by pg_dump version 9.3.9
-- Started on 2015-10-08 11:34:09 CEST

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- TOC entry 245 (class 3079 OID 11789)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 3059 (class 0 OID 0)
-- Dependencies: 245
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_with_oids = false;

--
-- TOC entry 181 (class 1259 OID 21495490)
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
-- TOC entry 229 (class 1259 OID 21496047)
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
-- TOC entry 228 (class 1259 OID 21496030)
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
-- TOC entry 219 (class 1259 OID 21495907)
-- Name: avtorbesedila; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE avtorbesedila (
    id uuid NOT NULL,
    besedilo_id uuid,
    oseba_id uuid,
    tipavtorja character varying(255) NOT NULL,
    zaporedna integer,
    alivnaslovu boolean
);


--
-- TOC entry 222 (class 1259 OID 21495937)
-- Name: besedilo; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE besedilo (
    id uuid NOT NULL,
    stevilka character varying(255) NOT NULL,
    naslov character varying(255) DEFAULT NULL::character varying,
    podnaslov character varying(255) DEFAULT NULL::character varying,
    jezik character varying(255) DEFAULT NULL::character varying,
    naslovizvirnika character varying(255) DEFAULT NULL::character varying,
    podnaslovizvirnika character varying(255) DEFAULT NULL::character varying,
    internacionalninaslov character varying(255) DEFAULT NULL::character varying,
    datumprejema date,
    moskevloge integer,
    zenskevloge integer,
    povzetekvsebine text,
    letoizida integer,
    krajizida character varying(255) DEFAULT NULL::character varying,
    zaloznik character varying(255) DEFAULT NULL::character varying,
    avtor character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 243 (class 1259 OID 21496301)
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
-- TOC entry 197 (class 1259 OID 21495698)
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
    allday boolean DEFAULT false,
    zacetek timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    konec timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    status character varying(4) DEFAULT NULL::character varying,
    razred character varying(4) DEFAULT NULL::character varying,
    termin character varying(255) DEFAULT NULL::character varying,
    title character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 199 (class 1259 OID 21495729)
-- Name: dogodeksplosni; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodeksplosni (
    id uuid NOT NULL
);


--
-- TOC entry 237 (class 1259 OID 21496227)
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
-- TOC entry 190 (class 1259 OID 21495611)
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
-- TOC entry 230 (class 1259 OID 21496060)
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
    sthonorarnihzun integer,
    sthonorarnihzunigr integer,
    sthonorarnihzunigrtujjz integer,
    sthonorarnihzunsamoz integer,
    obiskdoma integer DEFAULT 0 NOT NULL,
    obiskkopr integer DEFAULT 0 NOT NULL,
    obiskgost integer DEFAULT 0 NOT NULL,
    obiskkoprgost integer DEFAULT 0 NOT NULL,
    obiskzamejo integer DEFAULT 0 NOT NULL,
    obiskkoprzamejo integer DEFAULT 0 NOT NULL,
    obiskint integer DEFAULT 0 NOT NULL,
    obiskkoprint integer DEFAULT 0 NOT NULL,
    ponovidoma integer DEFAULT 0 NOT NULL,
    ponovikopr integer DEFAULT 0 NOT NULL,
    ponovizamejo numeric(15,2) DEFAULT 0::numeric NOT NULL,
    ponovikoprzamejo numeric(15,2) DEFAULT 0::numeric NOT NULL,
    ponovigost numeric(15,2) DEFAULT 0::numeric NOT NULL,
    ponovikoprgost numeric(15,2) DEFAULT 0::numeric NOT NULL,
    ponovikoprint integer DEFAULT 0 NOT NULL,
    ponoviint integer DEFAULT 0 NOT NULL,
    naziv character varying(50) DEFAULT NULL::character varying,
    kpe numeric(15,2) DEFAULT 0::numeric NOT NULL,
    sort integer,
    tipprogramskeenote_id uuid,
    tip character varying(20) NOT NULL,
    prikoproducentu boolean,
    prizorisce character varying(255) DEFAULT NULL::character varying,
    trajanje character varying(255) DEFAULT NULL::character varying,
    zvrst character varying(255) DEFAULT NULL::character varying,
    avtor character varying(255) DEFAULT NULL::character varying,
    reziser character varying(255) DEFAULT NULL::character varying,
    datum date,
    soustvarjalci character varying(255) DEFAULT NULL::character varying,
    strosekodkpred numeric(15,2) DEFAULT 0::numeric,
    stroskiostali numeric(15,2) DEFAULT 0::numeric,
    krajgostovanja character varying(255) DEFAULT NULL::character varying,
    ustanova character varying(255) DEFAULT NULL::character varying,
    datumgostovanja date,
    transportnistroski numeric(15,2) DEFAULT NULL::numeric,
    dnevprvzad numeric(15,2) DEFAULT NULL::numeric,
    drzavagostovanja_id uuid,
    stpe integer DEFAULT 0,
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
-- TOC entry 215 (class 1259 OID 21495862)
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
-- TOC entry 195 (class 1259 OID 21495677)
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
-- TOC entry 193 (class 1259 OID 21495651)
-- Name: job; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE job (
    id uuid NOT NULL,
    user_id uuid,
    name character varying(50) NOT NULL,
    task character varying(50) NOT NULL,
    status integer NOT NULL,
    log text,
    datum timestamp(0) without time zone NOT NULL,
    casizvedbe timestamp(0) without time zone NOT NULL,
    izveden timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    data text,
    alert boolean,
    hidden boolean,
    upor character varying(10) DEFAULT NULL::character varying,
    datknj timestamp(0) without time zone DEFAULT NULL::timestamp without time zone
);


--
-- TOC entry 3060 (class 0 OID 0)
-- Dependencies: 193
-- Name: COLUMN job.data; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN job.data IS '(DC2Type:object)';


--
-- TOC entry 191 (class 1259 OID 21495628)
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
-- TOC entry 204 (class 1259 OID 21495776)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 241 (class 1259 OID 21496282)
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
-- TOC entry 242 (class 1259 OID 21496294)
-- Name: mapa_zapis; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE mapa_zapis (
    mapa_id uuid NOT NULL,
    zapis_id uuid NOT NULL
);


--
-- TOC entry 244 (class 1259 OID 21496316)
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
-- TOC entry 170 (class 1259 OID 21093458)
-- Name: migrations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE migrations (
    version character varying(255) NOT NULL
);


--
-- TOC entry 208 (class 1259 OID 21495801)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 188 (class 1259 OID 21495585)
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
-- TOC entry 182 (class 1259 OID 21495499)
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
-- TOC entry 183 (class 1259 OID 21495510)
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
-- TOC entry 178 (class 1259 OID 21495464)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 180 (class 1259 OID 21495483)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 209 (class 1259 OID 21495808)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 213 (class 1259 OID 21495842)
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
-- TOC entry 225 (class 1259 OID 21495978)
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
    procentodinkasa numeric(12,2) DEFAULT NULL::numeric,
    jeprocentodinkasa boolean,
    vrednostdopremiere numeric(12,2) DEFAULT NULL::numeric,
    zaposlenvdrjz boolean,
    samozaposlen boolean,
    igralec boolean,
    opis text
);


--
-- TOC entry 185 (class 1259 OID 21495543)
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
-- TOC entry 187 (class 1259 OID 21495577)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 232 (class 1259 OID 21496172)
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
-- TOC entry 205 (class 1259 OID 21495782)
-- Name: postavkaracuna; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE postavkaracuna (
    id uuid NOT NULL,
    racun_id uuid
);


--
-- TOC entry 186 (class 1259 OID 21495562)
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
-- TOC entry 194 (class 1259 OID 21495666)
-- Name: predstava; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE predstava (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    gostovanje_id uuid,
    zaporedna integer,
    objavljenzacetek timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    porocilo text
);


--
-- TOC entry 207 (class 1259 OID 21495794)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 233 (class 1259 OID 21496186)
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
-- TOC entry 234 (class 1259 OID 21496196)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    sifra character varying(4) NOT NULL,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 231 (class 1259 OID 21496124)
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
    stpremiervelikih integer,
    stpremiermalih integer,
    stpremiermalihkopr integer,
    stpremiervelikihkopr integer,
    stpremiersredkopr integer,
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
    stizvnekomerc numeric(15,2) DEFAULT 0::numeric,
    stizvprem integer,
    stizvpremdoma integer,
    stizvpremkopr integer,
    stizvponprem numeric(15,2) DEFAULT 0::numeric,
    stizvponpremdoma integer,
    stizvponpremzamejo numeric(15,2) DEFAULT 0::numeric,
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
    stizvostalihnek numeric(15,2) DEFAULT 0::numeric,
    stizvgostovanjslo integer,
    stizvgostovanjzam numeric(15,2) DEFAULT 0::numeric,
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
    sthonorarnihzun integer,
    sthonorarnihzunigr integer,
    sthonorarnihzunigrtujjz integer,
    sthonorarnihzunsamoz integer,
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
-- TOC entry 235 (class 1259 OID 21496204)
-- Name: programskaenotasklopa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE programskaenotasklopa (
    id uuid NOT NULL,
    naslovpe character varying(255) NOT NULL,
    avtorpe character varying(255) NOT NULL,
    obsegpe character varying(255) NOT NULL,
    mesecpe character varying(255) NOT NULL,
    vrednostpe numeric(15,2) DEFAULT 0::numeric NOT NULL,
    obiskdoma integer DEFAULT 0 NOT NULL,
    programrazno_id uuid
);


--
-- TOC entry 211 (class 1259 OID 21495823)
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
-- TOC entry 203 (class 1259 OID 21495767)
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
-- TOC entry 202 (class 1259 OID 21495757)
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
-- TOC entry 224 (class 1259 OID 21495967)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying,
    status character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 218 (class 1259 OID 21495897)
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
-- TOC entry 192 (class 1259 OID 21495640)
-- Name: report; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE report (
    id uuid NOT NULL,
    job_id uuid,
    title character varying(255) NOT NULL,
    filename character varying(255) NOT NULL,
    transfers integer NOT NULL,
    size integer,
    format character varying(255) DEFAULT NULL::character varying,
    hash uuid,
    createdat timestamp(0) without time zone DEFAULT NULL::timestamp without time zone
);


--
-- TOC entry 175 (class 1259 OID 21495435)
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
-- TOC entry 174 (class 1259 OID 21495433)
-- Name: revizije_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE revizije_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3061 (class 0 OID 0)
-- Dependencies: 174
-- Name: revizije_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE revizije_id_seq OWNED BY revizije.id;


--
-- TOC entry 212 (class 1259 OID 21495836)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 179 (class 1259 OID 21495473)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 177 (class 1259 OID 21495457)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 214 (class 1259 OID 21495850)
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
-- TOC entry 206 (class 1259 OID 21495788)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 200 (class 1259 OID 21495734)
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
-- TOC entry 173 (class 1259 OID 21495422)
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
-- TOC entry 172 (class 1259 OID 21495414)
-- Name: stevilcenjekonfig; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjekonfig (
    id uuid NOT NULL,
    stevilcenje_id uuid,
    dok character varying(100) DEFAULT NULL::character varying
);


--
-- TOC entry 171 (class 1259 OID 21495409)
-- Name: stevilcenjestanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjestanje (
    id uuid NOT NULL,
    objid uuid NOT NULL,
    leto integer NOT NULL,
    stevilka integer
);


--
-- TOC entry 220 (class 1259 OID 21495914)
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
-- TOC entry 184 (class 1259 OID 21495535)
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
-- TOC entry 201 (class 1259 OID 21495744)
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
-- TOC entry 223 (class 1259 OID 21495955)
-- Name: tipfunkcije; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tipfunkcije (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    ime character varying(255) NOT NULL,
    opis text,
    imezenski character varying(255) DEFAULT NULL::character varying,
    podrocje character varying(255) DEFAULT NULL::character varying,
    sort integer
);


--
-- TOC entry 236 (class 1259 OID 21496215)
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
-- TOC entry 189 (class 1259 OID 21495597)
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
-- TOC entry 176 (class 1259 OID 21495444)
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
-- TOC entry 227 (class 1259 OID 21496005)
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
    jekoprodukcija boolean,
    maticnioder_id uuid
);


--
-- TOC entry 196 (class 1259 OID 21495688)
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
-- TOC entry 210 (class 1259 OID 21495815)
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
-- TOC entry 221 (class 1259 OID 21495928)
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
-- TOC entry 239 (class 1259 OID 21496262)
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
-- TOC entry 238 (class 1259 OID 21496234)
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
-- TOC entry 240 (class 1259 OID 21496274)
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
-- TOC entry 217 (class 1259 OID 21495887)
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
-- TOC entry 198 (class 1259 OID 21495723)
-- Name: zasedenost; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zasedenost (
    id uuid NOT NULL,
    oseba_id uuid
);


--
-- TOC entry 226 (class 1259 OID 21495995)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 216 (class 1259 OID 21495877)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 2201 (class 2604 OID 21495438)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 2989 (class 0 OID 21495490)
-- Dependencies: 181
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
\.


--
-- TOC entry 3037 (class 0 OID 21496047)
-- Dependencies: 229
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, zaposlitev_id, oseba_id, pogodba_id, sifra, zaposlen, zacetek, konec, opomba, sort, privzeti, aktivna, imapogodbo, pomembna) FROM stdin;
000c0000-5616-388e-fb64-65cec5b4d104	000d0000-5616-388e-7dca-82e85cfb9538	\N	00090000-5616-388e-7d24-c598ccb61030	000b0000-5616-388e-3dc9-6cd10708b256	0001	f	\N	\N	\N	3	t	\N	t	t
000c0000-5616-388e-f901-389c7c163681	000d0000-5616-388e-a8aa-c375b89d6d6f	00100000-5616-388e-c153-dc630f6a5872	00090000-5616-388e-3ed3-6dd98c572244	\N	0002	t	2016-01-01	\N	\N	8	t	\N	f	f
000c0000-5616-388e-83b0-36f5caf5919a	000d0000-5616-388e-47e1-cb6fe3b814d3	00100000-5616-388e-b296-d7dec0c0d24e	00090000-5616-388e-99ff-c2e7fa8e86de	\N	0003	t	\N	2015-10-08	\N	2	t	\N	f	f
000c0000-5616-388e-defa-120081669857	000d0000-5616-388e-870b-71ffdddff9e4	\N	00090000-5616-388e-2904-4cd5dfea2734	\N	0004	f	2016-01-01	2016-01-01	\N	26	t	\N	f	f
000c0000-5616-388e-5500-6e41d3904e0f	000d0000-5616-388e-b94d-d411b3c9b573	\N	00090000-5616-388e-4bea-dd624f77ee20	\N	0005	f	2016-01-01	2016-01-01	\N	7	t	\N	f	f
000c0000-5616-388e-df85-5c9fe4540fb3	000d0000-5616-388e-10d1-5aebe11245f0	\N	00090000-5616-388e-71cb-b7b41e040036	000b0000-5616-388e-abea-c20c052267dc	0006	f	2016-01-01	2016-01-01	\N	1	t	\N	t	t
000c0000-5616-388e-6a52-fde8cc505a44	000d0000-5616-388e-d9ab-0582bd4e036d	00100000-5616-388e-c219-dd4689d7b919	00090000-5616-388e-3af0-50ca3ee0c02e	\N	0007	t	2016-01-01	2016-01-01	\N	14	t	\N	f	t
000c0000-5616-388e-a244-13a2fe57c537	000d0000-5616-388e-5c12-62d34aae2f94	\N	00090000-5616-388e-2a9d-a2620e1e1e53	000b0000-5616-388e-ae43-b2e8143b514e	0008	f	2016-01-01	2016-01-01	\N	12	t	\N	t	t
000c0000-5616-388e-2844-6b1f8fcb4c5a	000d0000-5616-388e-d9ab-0582bd4e036d	00100000-5616-388e-4a34-7936b29aa138	00090000-5616-388e-d0aa-0e1d3a26e386	\N	0009	t	2017-01-01	2017-01-01	\N	15	t	\N	f	t
000c0000-5616-388e-c19f-111935f5095c	000d0000-5616-388e-d9ab-0582bd4e036d	00100000-5616-388e-9e06-e11d818c20f0	00090000-5616-388e-b258-298f76e49879	\N	0010	t	\N	2015-10-08	\N	16	f	\N	f	t
000c0000-5616-388e-94ca-02b9991f5f81	000d0000-5616-388e-d9ab-0582bd4e036d	00100000-5616-388e-f052-b5441e7136f6	00090000-5616-388e-e9cd-e1663cc7090d	\N	0011	t	2017-01-01	\N	\N	17	f	\N	f	t
000c0000-5616-388e-ed50-18a4b786dc16	000d0000-5616-388e-91aa-df8ea3decaca	\N	00090000-5616-388e-3ed3-6dd98c572244	000b0000-5616-388e-9749-2da6e46410a2	0012	f	\N	\N	\N	2	t	\N	t	t
\.


--
-- TOC entry 3036 (class 0 OID 21496030)
-- Dependencies: 228
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 3027 (class 0 OID 21495907)
-- Dependencies: 219
-- Data for Name: avtorbesedila; Type: TABLE DATA; Schema: public; Owner: -
--

COPY avtorbesedila (id, besedilo_id, oseba_id, tipavtorja, zaporedna, alivnaslovu) FROM stdin;
003d0000-5616-388e-15b0-15eee2b891ad	00160000-5616-388e-44e6-de08f15b14e2	00090000-5616-388e-b441-e913523fcc99	aizv	10	t
003d0000-5616-388e-c23c-b2982962bdce	00160000-5616-388e-44e6-de08f15b14e2	00090000-5616-388e-9ff9-4c6b3171e1f8	apri	14	t
003d0000-5616-388e-8e75-12942ad5a9f7	00160000-5616-388e-007e-5d3799f7fdd2	00090000-5616-388e-c2f4-78d8f2f4c57a	aizv	11	t
003d0000-5616-388e-ad3e-a6afb242467d	00160000-5616-388e-129e-47102e2f89f6	00090000-5616-388e-899b-74b2a9e9f55a	aizv	12	t
003d0000-5616-388e-6704-67a4103aec0e	00160000-5616-388e-44e6-de08f15b14e2	00090000-5616-388e-b5e7-7deab337fa32	apri	18	f
\.


--
-- TOC entry 3030 (class 0 OID 21495937)
-- Dependencies: 222
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, stevilka, naslov, podnaslov, jezik, naslovizvirnika, podnaslovizvirnika, internacionalninaslov, datumprejema, moskevloge, zenskevloge, povzetekvsebine, letoizida, krajizida, zaloznik, avtor) FROM stdin;
00160000-5616-388e-44e6-de08f15b14e2	0001	Sen kresne noči		slovenščina	A Midsummer Night's Dream	\N	\N	2015-04-26	5	5	Nastopajo Titanija, Hipolita, Oberon, ...	\N	\N	\N	William  Shakespeare - Nebojša  Kavader
00160000-5616-388e-007e-5d3799f7fdd2	0002	Bratje Karamazovi		slovenščina	Bratja Karamazjovji	\N	\N	2015-12-04	4	1	Svetovna uspešnica	\N	\N	\N	Fjodor Mihajlovič Dostojevski
00160000-5616-388e-129e-47102e2f89f6	0003	Smoletov Vrt		slovenščina		\N	\N	2015-05-26	2	8		\N	\N	\N	Berta   Hočevar
\.


--
-- TOC entry 3051 (class 0 OID 21496301)
-- Dependencies: 243
-- Data for Name: datoteka; Type: TABLE DATA; Schema: public; Owner: -
--

COPY datoteka (id, owner_id, filename, transfers, size, format, hash, createdat, uploadedat, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3005 (class 0 OID 21495698)
-- Dependencies: 197
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_splosni_id, prostor_id, sezona_id, allday, zacetek, konec, status, razred, termin, title) FROM stdin;
00180000-5616-388e-c7a0-401a4c1694fe	\N	\N	00200000-5616-388e-5ac4-82f5490bf09e	\N	\N	\N	\N	f	2015-06-26 10:00:00	2015-06-26 12:00:00	200s	200s		dogodek 1
00180000-5616-388e-c21a-bbbc527f4ffe	\N	\N	00200000-5616-388e-d68a-accdf4e9dab2	\N	\N	\N	\N	f	2015-06-27 10:00:00	2015-06-27 12:00:00	300s	200s		dogodek 2
00180000-5616-388e-e28e-f23ce0b2dd4d	\N	\N	00200000-5616-388e-6bce-40496ba8257f	\N	\N	\N	\N	f	2015-08-01 20:00:00	2015-08-01 23:00:00	400s	200s		dogodek 3
00180000-5616-388e-f0a9-7a2c31bcc670	\N	\N	00200000-5616-388e-9f0d-7cc9d110f18c	\N	\N	\N	\N	f	2015-08-01 20:00:00	2015-08-01 23:00:00	100s	200s		dogodek 4
00180000-5616-388e-8fde-284766ececeb	\N	\N	00200000-5616-388e-cdfd-61cea4b09bdc	\N	\N	\N	\N	f	2015-08-01 20:00:00	2015-08-01 23:00:00	500s	200s		dogodek 5
\.


--
-- TOC entry 3007 (class 0 OID 21495729)
-- Dependencies: 199
-- Data for Name: dogodeksplosni; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodeksplosni (id) FROM stdin;
\.


--
-- TOC entry 3045 (class 0 OID 21496227)
-- Dependencies: 237
-- Data for Name: drugivir; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drugivir (id, znesek, opis, mednarodni, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 2998 (class 0 OID 21495611)
-- Dependencies: 190
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-5616-388c-a82e-08a0afb6e192	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-5616-388c-6805-502446776086	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-5616-388c-8703-5e01412454ea	AL	ALB	008	Albania 	Albanija	\N
00040000-5616-388c-7c66-91b07c639dba	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-5616-388c-80f9-3d347f805a97	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-5616-388c-6040-db8a2f958c82	AD	AND	020	Andorra 	Andora	\N
00040000-5616-388c-c77c-190b2ab4e97f	AO	AGO	024	Angola 	Angola	\N
00040000-5616-388c-a697-26df0e16e514	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-5616-388c-9fcb-2957c599da73	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-5616-388c-ec79-eaa98566ace4	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-5616-388c-1a1d-f49c0b8f0876	AR	ARG	032	Argentina 	Argenitna	\N
00040000-5616-388c-2ed2-9d6ea3390783	AM	ARM	051	Armenia 	Armenija	\N
00040000-5616-388c-35dd-61e20904dc7f	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-5616-388c-17e2-521661f1a30e	AU	AUS	036	Australia 	Avstralija	\N
00040000-5616-388c-1532-a6f33d98e7f2	AT	AUT	040	Austria 	Avstrija	\N
00040000-5616-388c-2317-2f024626e66a	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-5616-388c-ee10-05a22ac99eda	BS	BHS	044	Bahamas 	Bahami	\N
00040000-5616-388c-70e3-a69f74c2a900	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-5616-388c-cf3e-2043b91eb96c	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-5616-388c-6d3f-c76ada4e89b7	BB	BRB	052	Barbados 	Barbados	\N
00040000-5616-388c-5a3f-5d225dcc8652	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-5616-388c-01a1-e4617d43b5ad	BE	BEL	056	Belgium 	Belgija	\N
00040000-5616-388c-0984-fee536d79075	BZ	BLZ	084	Belize 	Belize	\N
00040000-5616-388c-5633-081277695e76	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-5616-388c-a50e-cfe00a99b11e	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-5616-388c-f3ac-ac8cd286643b	BT	BTN	064	Bhutan 	Butan	\N
00040000-5616-388c-43fa-d28da2a6ff49	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-5616-388c-ba00-0c038cfc365f	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-5616-388c-0e75-f65ab24635d9	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-5616-388c-2196-9eb76fec81dd	BW	BWA	072	Botswana 	Bocvana	\N
00040000-5616-388c-a8a7-4045b9596a17	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-5616-388c-e1a2-b25dc041784a	BR	BRA	076	Brazil 	Brazilija	\N
00040000-5616-388c-937b-b0c2c23fdce4	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-5616-388c-991a-23c439f1e616	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-5616-388c-0d23-39b73786e7ad	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-5616-388c-376e-072a6662917e	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-5616-388c-e423-9be3e2d3f97e	BI	BDI	108	Burundi 	Burundi 	\N
00040000-5616-388c-589e-088a08278885	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-5616-388c-2481-551e87de2899	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-5616-388c-b58e-84b1ff530a72	CA	CAN	124	Canada 	Kanada	\N
00040000-5616-388c-9ccb-31e7f04b8e9d	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-5616-388c-dda2-9e8c21416d7b	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-5616-388c-2831-af3b96c6b383	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-5616-388c-18cc-b78be8188336	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-5616-388c-111b-3a33028817a4	CL	CHL	152	Chile 	Čile	\N
00040000-5616-388c-8514-9d6bf2eb5201	CN	CHN	156	China 	Kitajska	\N
00040000-5616-388c-48e3-17262ab47f7f	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-5616-388c-b82e-53e7fef91475	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-5616-388c-61be-536552e0398b	CO	COL	170	Colombia 	Kolumbija	\N
00040000-5616-388c-487f-fa9d5ece37a1	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-5616-388c-4a85-68bd86557621	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-5616-388c-6876-237aa17f5d39	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-5616-388c-b707-1b4d16630f4c	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-5616-388c-84f2-082960a5ee23	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-5616-388c-29ec-3a98410e9e15	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-5616-388c-2f89-9127d607dfe6	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-5616-388c-6a29-a5430cb04b74	CU	CUB	192	Cuba 	Kuba	\N
00040000-5616-388c-febd-7648cb0fafd5	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-5616-388c-b63c-c7d19f273154	CY	CYP	196	Cyprus 	Ciper	\N
00040000-5616-388c-df36-383d9d8e7d7f	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-5616-388c-e501-631cf0684366	DK	DNK	208	Denmark 	Danska	\N
00040000-5616-388c-414a-40f060cce22e	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-5616-388c-1f5c-8d75e3443f0e	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-5616-388c-33be-44b884223988	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-5616-388c-3835-96bb8c4d962b	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-5616-388c-418b-c30c7a19dcdc	EG	EGY	818	Egypt 	Egipt	\N
00040000-5616-388c-e685-80f7503883c8	SV	SLV	222	El Salvador 	Salvador	\N
00040000-5616-388c-31fd-c887c6e517d5	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-5616-388c-e428-cabafcd2cb87	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-5616-388c-c5e1-4fd0bd7a004f	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-5616-388c-1b61-71914ed82d77	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-5616-388c-8e51-e62fe4b445eb	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-5616-388c-4039-c557518e96c3	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-5616-388c-4d31-4dcf86886856	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-5616-388c-1e38-3f9a71269cf8	FI	FIN	246	Finland 	Finska	\N
00040000-5616-388c-3a94-acd3321de4ca	FR	FRA	250	France 	Francija	\N
00040000-5616-388c-e13b-d690d1fffa10	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-5616-388c-19b1-5890a90dba21	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-5616-388c-7778-c8ef0ae7d072	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-5616-388c-c166-3581baf92272	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-5616-388c-e799-777a9d4c3a11	GA	GAB	266	Gabon 	Gabon	\N
00040000-5616-388c-2516-4cc38da6e70d	GM	GMB	270	Gambia 	Gambija	\N
00040000-5616-388c-ed29-239bb382909c	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-5616-388c-3647-d44bf64ba931	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-5616-388c-e767-f3465ba51be8	GH	GHA	288	Ghana 	Gana	\N
00040000-5616-388c-6f25-898808ce80d7	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-5616-388c-6a87-108917a9cdc9	GR	GRC	300	Greece 	Grčija	\N
00040000-5616-388c-374c-2e45c7c245de	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-5616-388c-c597-36a0769d77d4	GD	GRD	308	Grenada 	Grenada	\N
00040000-5616-388c-c645-7bf06f7c3272	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-5616-388c-83e8-af69beb68ee5	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-5616-388c-a656-c74e7e2bd222	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-5616-388c-3945-7ece02277448	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-5616-388c-4530-d239d44b3ba4	GN	GIN	324	Guinea 	Gvineja	\N
00040000-5616-388c-1b83-9e11c1273fda	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-5616-388c-cb7b-464235e1a7b5	GY	GUY	328	Guyana 	Gvajana	\N
00040000-5616-388c-19a8-7ccb3dd18728	HT	HTI	332	Haiti 	Haiti	\N
00040000-5616-388c-2214-3968a3f6bce7	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-5616-388c-a420-e7d88dc60fd0	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-5616-388c-1e07-9617cb63fb9e	HN	HND	340	Honduras 	Honduras	\N
00040000-5616-388c-9a11-ae3221a08213	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-5616-388c-e247-b9f1ffc5c361	HU	HUN	348	Hungary 	Madžarska	\N
00040000-5616-388c-9dcd-bbb8c0d45f9b	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-5616-388c-3c93-0da310b92e7f	IN	IND	356	India 	Indija	\N
00040000-5616-388c-a82b-a7906021dcdc	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-5616-388c-adc0-00ff2d03ee5b	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-5616-388c-5724-0ea3e800ad81	IQ	IRQ	368	Iraq 	Irak	\N
00040000-5616-388c-966d-3762fc00e238	IE	IRL	372	Ireland 	Irska	\N
00040000-5616-388c-7182-e4fb24a49937	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-5616-388c-f09f-faeb5b46e3ad	IL	ISR	376	Israel 	Izrael	\N
00040000-5616-388c-46b7-38e4a97ff441	IT	ITA	380	Italy 	Italija	\N
00040000-5616-388c-7bca-bcac4ae63b9f	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-5616-388c-77b2-177324e36e25	JP	JPN	392	Japan 	Japonska	\N
00040000-5616-388c-c317-c89914e9bcc7	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-5616-388c-64d0-af67b6243ca0	JO	JOR	400	Jordan 	Jordanija	\N
00040000-5616-388c-75e9-bb92637548d2	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-5616-388c-086b-c50b33e84650	KE	KEN	404	Kenya 	Kenija	\N
00040000-5616-388c-7d08-6522910d982a	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-5616-388c-788a-48235b4ebc11	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-5616-388c-eb59-eaa9542677be	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-5616-388c-a593-49478dba2f8a	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-5616-388c-dff4-508b8f03b27c	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-5616-388c-0528-af6c10202f5f	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-5616-388c-6f3e-2cb7b0f50cf7	LV	LVA	428	Latvia 	Latvija	\N
00040000-5616-388c-2b81-0ac2ea39ce49	LB	LBN	422	Lebanon 	Libanon	\N
00040000-5616-388c-5619-841f8450f2a2	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-5616-388c-a70f-49d8a328ba23	LR	LBR	430	Liberia 	Liberija	\N
00040000-5616-388c-1ef0-a274a9eb02ff	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-5616-388c-25e4-a790ec0b95b9	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-5616-388c-e726-5e354b02c009	LT	LTU	440	Lithuania 	Litva	\N
00040000-5616-388c-eb60-5b701e846c58	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-5616-388c-2381-18a63fc2e614	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-5616-388c-4136-8b25b4826d78	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-5616-388c-9d7c-69086dfd82a1	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-5616-388c-d0c5-d53f5c4c7be7	MW	MWI	454	Malawi 	Malavi	\N
00040000-5616-388c-4681-4fd21fa76c46	MY	MYS	458	Malaysia 	Malezija	\N
00040000-5616-388c-888f-72a5ce37cc8d	MV	MDV	462	Maldives 	Maldivi	\N
00040000-5616-388c-50fe-b8cad1dbd222	ML	MLI	466	Mali 	Mali	\N
00040000-5616-388c-035a-e670d25a6dfd	MT	MLT	470	Malta 	Malta	\N
00040000-5616-388c-6a99-3fac2f1da21f	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-5616-388c-6e43-b8b73246c2db	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-5616-388c-008f-44a73fccf254	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-5616-388c-f164-4932d0e8177a	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-5616-388c-d282-fdfa74c41700	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-5616-388c-8d92-4d6ac8e86478	MX	MEX	484	Mexico 	Mehika	\N
00040000-5616-388c-8cc7-de6f9eba3494	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-5616-388c-338c-d0241b8f71de	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-5616-388c-bb07-99dd8ea8229f	MC	MCO	492	Monaco 	Monako	\N
00040000-5616-388c-a953-a853f6a54a72	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-5616-388c-9ebe-eeb0a65c6b3e	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-5616-388c-7c6a-60c311bc4707	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-5616-388c-bccb-9fdd7d8bdf4c	MA	MAR	504	Morocco 	Maroko	\N
00040000-5616-388c-e258-c82c3d8155b5	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-5616-388c-da18-f786d2a98836	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-5616-388c-b3ee-0d6520227d52	NA	NAM	516	Namibia 	Namibija	\N
00040000-5616-388c-dd74-f74452a5ae4c	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-5616-388c-99b8-d29ed9ea562a	NP	NPL	524	Nepal 	Nepal	\N
00040000-5616-388c-3cd4-5c60104e4699	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-5616-388c-bec4-049a9043f02c	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-5616-388c-f40e-798641805eb5	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-5616-388c-c665-6980d13411df	NE	NER	562	Niger 	Niger 	\N
00040000-5616-388c-129d-1f4d7046592a	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-5616-388c-a64b-f521b0b6fb81	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-5616-388c-0f57-f41e41475782	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-5616-388c-7afa-8680a0638f67	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-5616-388c-38cb-584ef3db8dc4	NO	NOR	578	Norway 	Norveška	\N
00040000-5616-388c-d084-af30e3b5b9e2	OM	OMN	512	Oman 	Oman	\N
00040000-5616-388c-ab0d-c8984e1962fe	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-5616-388c-d6e5-cb071edf5115	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-5616-388c-dc05-acf0674b83de	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-5616-388c-d83b-40be7ca9454d	PA	PAN	591	Panama 	Panama	\N
00040000-5616-388c-4f0f-262b6d022ec3	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-5616-388c-45a3-6e8300af87fd	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-5616-388c-0c57-d98f41678258	PE	PER	604	Peru 	Peru	\N
00040000-5616-388c-e93f-71afcbff72c9	PH	PHL	608	Philippines 	Filipini	\N
00040000-5616-388c-2a31-a5972ae89bed	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-5616-388c-981b-39c5f9cd74c0	PL	POL	616	Poland 	Poljska	\N
00040000-5616-388c-6da2-2dcfb46406fd	PT	PRT	620	Portugal 	Portugalska	\N
00040000-5616-388c-d99f-7b4b70f5f410	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-5616-388c-2610-61fabf1cbce5	QA	QAT	634	Qatar 	Katar	\N
00040000-5616-388c-5390-a4053d446ab2	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-5616-388c-27a0-4ecc76387c1b	RO	ROU	642	Romania 	Romunija	\N
00040000-5616-388c-b058-3aea383fc068	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-5616-388c-283d-f22964fc701b	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-5616-388c-5d20-60bd42125c70	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-5616-388c-777d-ef0e500d1f05	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-5616-388c-6fbc-af24bfd4520e	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-5616-388c-42fb-d03a83b8e058	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-5616-388c-eb20-783c36291a88	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-5616-388c-dc7e-47b9846c6d2f	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-5616-388c-6930-88de0a45dfd8	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-5616-388c-1af4-a14d3a3a1a4b	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-5616-388c-b4e7-0c724baa470e	SM	SMR	674	San Marino 	San Marino	\N
00040000-5616-388c-3695-efe2d3913850	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-5616-388c-cc9d-3a57a3281e8b	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-5616-388c-b92d-5945ceb565c6	SN	SEN	686	Senegal 	Senegal	\N
00040000-5616-388c-3fcf-4b4a2e502cc7	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-5616-388c-5946-284859db90cc	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-5616-388c-ba71-9ac8bedd5a9f	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-5616-388c-5ed2-cf02f0a9d253	SG	SGP	702	Singapore 	Singapur	\N
00040000-5616-388c-48f6-65ac44cd2ec2	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-5616-388c-eb8d-c188e76257a9	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-5616-388c-4560-27b38010be9e	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-5616-388c-31cf-1856ad9bad2e	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-5616-388c-3a0f-7a47e4ee7566	SO	SOM	706	Somalia 	Somalija	\N
00040000-5616-388c-368a-7fab94b76f15	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-5616-388c-0ae9-bba4445350fc	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-5616-388c-02ed-8277da4ecd61	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-5616-388c-4de4-f5a01cd8dc9d	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-5616-388c-796c-a748998f3478	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-5616-388c-86c8-c8044e6cf648	SD	SDN	729	Sudan 	Sudan	\N
00040000-5616-388c-d67e-8dd83c612dda	SR	SUR	740	Suriname 	Surinam	\N
00040000-5616-388c-4185-90488c346236	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-5616-388c-2456-f961a4fd2ebf	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-5616-388c-d879-391700894561	SE	SWE	752	Sweden 	Švedska	\N
00040000-5616-388c-c2ad-d012a70d8599	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-5616-388c-1fed-0896b6167117	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-5616-388c-fdeb-1ce9d8ed6a83	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-5616-388c-76ce-8415cea518cb	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-5616-388c-a3d2-9213f7b6def5	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-5616-388c-6469-0ba783a97838	TH	THA	764	Thailand 	Tajska	\N
00040000-5616-388c-dc43-7cab2dd21105	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-5616-388c-c2c6-41e7697e6f6a	TG	TGO	768	Togo 	Togo	\N
00040000-5616-388c-5d00-90faa768292e	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-5616-388c-66a2-f81c7a620539	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-5616-388c-7c7a-9f43a2a710d4	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-5616-388c-1068-3008ac1c5e96	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-5616-388c-9a03-8b9265c29bfc	TR	TUR	792	Turkey 	Turčija	\N
00040000-5616-388c-9c1f-266cdceb62d1	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-5616-388c-f8ec-5dcbf1d802a3	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5616-388c-9c3e-fcfc9a13e514	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-5616-388c-96b8-16285d0d0686	UG	UGA	800	Uganda 	Uganda	\N
00040000-5616-388c-900b-760314678bdf	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-5616-388c-cce7-d077e159ef29	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-5616-388c-9471-8fb542f71e1e	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-5616-388c-228e-171dea8a36d6	US	USA	840	United States 	Združene države Amerike	\N
00040000-5616-388c-0a1a-516004a60600	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-5616-388c-8606-915441e4056e	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-5616-388c-5b57-c5dba1b0aacf	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-5616-388c-a2ad-13d0a7d43e25	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-5616-388c-c355-d4cb40e1c69d	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-5616-388c-9263-8f8a12532212	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-5616-388c-5bd8-3270cd53c7b1	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5616-388c-fae8-c7163e58bde2	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-5616-388c-6bf8-a4e250d03158	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-5616-388c-285a-7a650654e272	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-5616-388c-9a1f-9798069c8e74	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-5616-388c-9ca7-36b7b1289772	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-5616-388c-9ab6-3ae6463690fb	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 3038 (class 0 OID 21496060)
-- Dependencies: 230
-- Data for Name: enotaprograma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY enotaprograma (id, uprizoritev_id, program_dela_id, gostitelj_id, celotnavrednost, nasdelez, celotnavrednostmat, celotnavrednostgostovsz, zaproseno, lastnasredstva, avtorskihonorarji, avtorskihonorarjisamoz, tantieme, avtorskepravice, materialni, imakoprodukcije, vlozekgostitelja, drugijavni, stzaposlenih, stzaposumet, stzaposdrug, sthonorarnihzun, sthonorarnihzunigr, sthonorarnihzunigrtujjz, sthonorarnihzunsamoz, obiskdoma, obiskkopr, obiskgost, obiskkoprgost, obiskzamejo, obiskkoprzamejo, obiskint, obiskkoprint, ponovidoma, ponovikopr, ponovizamejo, ponovikoprzamejo, ponovigost, ponovikoprgost, ponovikoprint, ponoviint, naziv, kpe, sort, tipprogramskeenote_id, tip, prikoproducentu, prizorisce, trajanje, zvrst, avtor, reziser, datum, soustvarjalci, strosekodkpred, stroskiostali, krajgostovanja, ustanova, datumgostovanja, transportnistroski, dnevprvzad, drzavagostovanja_id, stpe, stpredstav, stokroglihmiz, stpredstavitev, stdelavnic, stdrugidogodki, stprodukcij, caspriprave, casizvedbe, prizorisca, umetvodja, programskotelo, sttujihselektorjev) FROM stdin;
002f0000-5616-388e-1b65-d2f0eda51f9f	000e0000-5616-388e-b333-7025d9ecd324	\N	\N	9000.30	9000.30	9000.30	0.00	3600.12	5299.98	4000.40	1000.40	200.20	200.30	4599.40	\N	0.00	100.20	0	2	2	2	2	2	0	40	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-5616-388c-da07-50257bf97a8e	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-5616-388e-f807-b065d1f6aa38	000e0000-5616-388e-6388-4829a11ebea8	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	0	60	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-5616-388c-ed2b-e1f5ab3fc532	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-5616-388e-1cb5-9412c86deddb	000e0000-5616-388e-c06f-9760fdba69e0	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	0	60	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-5616-388c-da07-50257bf97a8e	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-5616-388e-e61c-1af8aa34e6d3	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-54.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	54.20	5	0	0	3	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0	0	Urejanje portala	0.00	10	\N	razno	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-5616-388e-8977-985712c7be5f	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-31.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	31.20	5	0	0	3	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0	0	Delavnice otroci	0.00	8	\N	razno	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 3023 (class 0 OID 21495862)
-- Dependencies: 215
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, podrocje, vodjaekipe, naziv, komentar, velikost, pomembna, sort, seplanira, dovoliprekrivanje, maxprekrivanj, tipfunkcije_id) FROM stdin;
000d0000-5616-388e-7dca-82e85cfb9538	000e0000-5616-388e-6388-4829a11ebea8	000c0000-5616-388e-fb64-65cec5b4d104	igralec	\N	Tezej	glavna vloga	velika	t	5	t	t	\N	000f0000-5616-388c-efa4-b1ccfd1ccd5d
000d0000-5616-388e-a8aa-c375b89d6d6f	000e0000-5616-388e-6388-4829a11ebea8	000c0000-5616-388e-f901-389c7c163681	umetnik	\N	Režija		velika	t	8	t	t	\N	000f0000-5616-388c-215d-bb4024ac63dd
000d0000-5616-388e-47e1-cb6fe3b814d3	000e0000-5616-388e-6388-4829a11ebea8	000c0000-5616-388e-83b0-36f5caf5919a	inspicient	t	Inšpicient			t	8	t	t	\N	000f0000-5616-388c-962d-36753883e6a1
000d0000-5616-388e-870b-71ffdddff9e4	000e0000-5616-388e-6388-4829a11ebea8	000c0000-5616-388e-defa-120081669857	tehnik	t	Tehnični vodja			t	8	t	t	\N	000f0000-5616-388c-d57b-db578eef01e8
000d0000-5616-388e-b94d-d411b3c9b573	000e0000-5616-388e-6388-4829a11ebea8	000c0000-5616-388e-5500-6e41d3904e0f	tehnik	\N	Razsvetljava			t	3	t	t	\N	000f0000-5616-388c-d57b-db578eef01e8
000d0000-5616-388e-10d1-5aebe11245f0	000e0000-5616-388e-6388-4829a11ebea8	000c0000-5616-388e-df85-5c9fe4540fb3	igralec	\N	Helena	glavna vloga	velika	t	5	t	t	\N	000f0000-5616-388c-efa4-b1ccfd1ccd5d
000d0000-5616-388e-d9ab-0582bd4e036d	000e0000-5616-388e-6388-4829a11ebea8	000c0000-5616-388e-2844-6b1f8fcb4c5a	igralec	\N	Hipolita	glavna vloga	velika	t	6	t	t	\N	000f0000-5616-388c-efa4-b1ccfd1ccd5d
000d0000-5616-388e-5c12-62d34aae2f94	000e0000-5616-388e-6388-4829a11ebea8	000c0000-5616-388e-a244-13a2fe57c537	umetnik	\N	Lektoriranje			t	22	t	t	\N	000f0000-5616-388c-926e-f3f703e3cb91
000d0000-5616-388e-91aa-df8ea3decaca	000e0000-5616-388e-6388-4829a11ebea8	000c0000-5616-388e-ed50-18a4b786dc16	umetnik	\N	Avtor	Avtor besedila		t	2	t	f	\N	000f0000-5616-388c-d133-56e3173a9543
\.


--
-- TOC entry 3003 (class 0 OID 21495677)
-- Dependencies: 195
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta, zamejstvo, kraj) FROM stdin;
\.


--
-- TOC entry 3001 (class 0 OID 21495651)
-- Dependencies: 193
-- Data for Name: job; Type: TABLE DATA; Schema: public; Owner: -
--

COPY job (id, user_id, name, task, status, log, datum, casizvedbe, izveden, data, alert, hidden, upor, datknj) FROM stdin;
\.


--
-- TOC entry 2999 (class 0 OID 21495628)
-- Dependencies: 191
-- Data for Name: kontaktnaoseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kontaktnaoseba (id, popa_id, oseba_id, status, funkcija, opis) FROM stdin;
00260000-5616-388e-7edd-03ff611cf38c	00080000-5616-388e-82c4-e2614577dc98	00090000-5616-388e-b258-298f76e49879	AK		igralka
\.


--
-- TOC entry 3012 (class 0 OID 21495776)
-- Dependencies: 204
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 3049 (class 0 OID 21496282)
-- Dependencies: 241
-- Data for Name: mapa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa (id, lastnik_id, parent_id, ime, komentar, caskreiranja, casspremembe, javnidostop, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3050 (class 0 OID 21496294)
-- Dependencies: 242
-- Data for Name: mapa_zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa_zapis (mapa_id, zapis_id) FROM stdin;
\.


--
-- TOC entry 3052 (class 0 OID 21496316)
-- Dependencies: 244
-- Data for Name: mapaacl; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapaacl (id, mapa_id, perm_id, dostop, upor, datknj) FROM stdin;
\.


--
-- TOC entry 2978 (class 0 OID 21093458)
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
20150918081756
20150923181744
20150929204104
\.


--
-- TOC entry 3016 (class 0 OID 21495801)
-- Dependencies: 208
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 2996 (class 0 OID 21495585)
-- Dependencies: 188
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-5616-388c-b575-c3709b376ad9	popa.stakli	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-5616-388c-5c9e-9991959dff28	oseba.spol	array	a:2:{s:1:"M";a:1:{s:5:"label";s:6:"Moški";}s:1:"Z";a:1:{s:5:"label";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-5616-388c-d9c5-3b4a296650b5	telefonska.vrsta	array	a:3:{s:7:"mobilna";a:1:{s:5:"label";s:7:"Mobilni";}s:6:"domaca";a:1:{s:5:"label";s:6:"Domač";}s:6:"fiksna";a:1:{s:5:"label";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-5616-388c-715d-03969c8d4f8b	kontaktnaoseba.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status kontaktne osebe
00000000-5616-388c-de4a-c7dc26758c03	dogodek.status	array	a:8:{s:4:"100s";a:1:{s:5:"label";s:11:"Dolgoročno";}s:4:"200s";a:1:{s:5:"label";s:9:"Planirano";}s:4:"300s";a:1:{s:5:"label";s:8:"Fiksiran";}s:4:"400s";a:1:{s:5:"label";s:17:"Potrjen - interno";}s:4:"500s";a:1:{s:5:"label";s:15:"Potrjen - javno";}s:4:"600s";a:1:{s:5:"label";s:10:"Zaključen";}s:4:"610s";a:1:{s:5:"label";s:9:"Odpovedan";}s:4:"700s";a:1:{s:5:"label";s:7:"Obdelan";}}	f	t	t	\N	Tabela statusa dogodkov
00000000-5616-388c-c8a7-24c4726d14a2	dogodek.razred	array	a:5:{s:4:"100s";a:2:{s:5:"label";s:9:"Predstava";s:4:"type";s:9:"predstava";}s:4:"200s";a:2:{s:5:"label";s:4:"Vaja";s:4:"type";s:4:"vaja";}s:4:"300s";a:2:{s:5:"label";s:10:"Gostovanje";s:4:"type";s:10:"gostovanje";}s:4:"400s";a:2:{s:5:"label";s:16:"Splošni dogodek";s:4:"type";s:8:"splošni";}s:4:"500s";a:2:{s:5:"label";s:10:"Zasedenost";s:4:"type";s:10:"zasedenost";}}	f	t	t	\N	Tabela razredov dogodkov, ki jih aplikacija podpira
00000000-5616-388c-b95c-228c57dbeffc	uprizoritev.faza	array	a:6:{s:20:"predprodukcija-ideja";a:1:{s:5:"label";s:16:"Dolgoročni plan";}s:20:"predprodukcija-poziv";a:1:{s:5:"label";s:29:"Predprodukcija, v fazi poziva";}s:30:"predprodukcija-potrjen_program";a:1:{s:5:"label";s:34:"Predprodukcija, program je potrjen";}s:10:"produkcija";a:1:{s:5:"label";s:10:"Produkcija";}s:14:"postprodukcija";a:1:{s:5:"label";s:14:"Postprodukcija";}s:5:"arhiv";a:1:{s:5:"label";s:10:"Arhivirana";}}	f	t	f	\N	Faza uprizoritve
00000000-5616-388c-e326-eccdb8c4e8f1	funkcija.podrocje	array	a:4:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}}	f	t	f	\N	Področje funkcije
00000000-5616-388c-2b6c-96cbaee32b3a	tipfunkcije.podrocje	array	a:4:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}}	f	t	f	\N	Področje funkcije
00000000-5616-388c-4fc0-365c28bccdf9	funkcija.velikost	array	a:4:{s:6:"velika";a:1:{s:5:"label";s:23:"Velika vloga / funkcija";}s:7:"srednja";a:1:{s:5:"label";s:24:"Srednja vloga / funkcija";}s:4:"mala";a:1:{s:5:"label";s:21:"Mala vloga / funkcija";}s:7:"stataza";a:1:{s:5:"label";s:8:"Stataža";}}	f	t	f	\N	Velikost funkcije
00000000-5616-388c-7e96-d802bed0d71d	zaposlitev.status	array	a:2:{s:1:"A";a:1:{s:5:"label";s:7:"Aktivna";}s:1:"N";a:1:{s:5:"label";s:9:"Neaktivna";}}	f	t	f	\N	Status zaposlitve
00000000-5616-388c-bff7-77ab7a081531	produkcijskahisa.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktivna";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktivna";}}	f	t	f	\N	Status produkcijske hiše
00000000-5616-388c-5274-08b64495b582	strosekuprizoritve.tipstroska	array	a:1:{s:10:"materialni";a:1:{s:5:"label";s:19:"Materialni strošek";}}	f	t	f	\N	Tip stroška
00000000-5616-388c-e23f-16fc7675fdbf	avtorbesedila.tipavtorja	array	a:4:{s:4:"aizv";a:1:{s:5:"label";s:15:"Avtor izvirnika";}s:4:"prev";a:1:{s:5:"label";s:10:"Prevajalec";}s:4:"apri";a:1:{s:5:"label";s:14:"Avtor priredbe";}s:4:"dram";a:1:{s:5:"label";s:12:"Dramatizator";}}	f	t	f	\N	Tip stroška
00000000-5616-388c-a928-6bfd38eb9345	fsacl.dostop	array	a:4:{s:1:"X";a:1:{s:5:"label";s:12:"Brez dostopa";}s:1:"R";a:1:{s:5:"label";s:11:"Samo branje";}s:2:"RW";a:1:{s:5:"label";s:17:"Branje in pisanje";}s:3:"RWD";a:1:{s:5:"label";s:26:"Branje pisanje in brisanje";}}	f	t	f	\N	ACL Javni dostop
00000000-5616-388e-4143-0e37a46c6eeb	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-5616-388e-431f-99f28383788a	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-5616-388e-2fa6-e8d6b9c9a41e	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-5616-388e-3309-19ec68eadc84	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-5616-388e-5a3e-3569c66b3c93	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
00000000-5616-3890-0c48-8b07150dd663	application.tenant.maticnopodjetje	string	s:36:"00080000-5616-3890-5537-0b08fab41ea7";	f	t	f		Id matičnega podjetja v Popa
\.


--
-- TOC entry 2990 (class 0 OID 21495499)
-- Dependencies: 182
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-5616-388e-add8-4d41e95e0529	00000000-5616-388e-4143-0e37a46c6eeb	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-5616-388e-a1c0-dd232f4acb3e	00000000-5616-388e-4143-0e37a46c6eeb	00010000-5616-388c-07de-c96fc80ffe29	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-5616-388e-1d40-65ea158c90e6	00000000-5616-388e-431f-99f28383788a	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 2991 (class 0 OID 21495510)
-- Dependencies: 183
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naslov_id, sifra, naziv, ime, priimek, funkcija, srednjeime, polnoime, psevdonim, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
00090000-5616-388e-7d24-c598ccb61030	\N	\N	0001	g.	Janez	Novak	a	Peter	Janez Peter Novak	Jani	jani.novak@xxx.xx	1958-01-06	0601958000000	123456789	M	Jani Janez	Slovenija	Slovenija	Ljubljana
00090000-5616-388e-2904-4cd5dfea2734	00010000-5616-388e-bf71-fa149135b7e5	\N	0002	dr.	Anton	Horvat	b		Anton  Horvat	Tona	anton.horvat@xxx.xx	1968-02-12	1202968111111	234567890	M		Slovenija	Slovenija	Maribor
00090000-5616-388e-99ff-c2e7fa8e86de	00010000-5616-388e-551d-0937e4a324f0	\N	0003		Ivan	Kovačič	c		Ivan  Kovačič	Ivo	ivan.kovacic@xxx.xx	1975-03-26	2603976222222	345678901	M		Slovenija	Slovenija	Celje
00090000-5616-388e-d0aa-0e1d3a26e386	00010000-5616-388e-118d-700236981b07	\N	0004	prof.	Jožef	Krajnc	d		Jožef  Krajnc	Joža	jozef.krajnc@xxx.xx	1971-04-30	3004971333333	456789012	M		Slovenija	Slovenija	Kranj
00090000-5616-388e-3efd-6d1405896209	\N	\N	0005		Marko	Zupančič	e		Marko  Zupančič		marko.zupancic@xxx.xx	1984-05-07	0705984444444	567890123	M		Slovenija	Slovenija	Koper
00090000-5616-388e-71cb-b7b41e040036	\N	\N	0006	ga.	Marija	Kovač	f		Marija  Kovač		marija.kovac@xxx.xx	1962-06-19	1906962444444	678901234	Z		Slovenija	Slovenija	Murska Sobota
00090000-5616-388e-e9cd-e1663cc7090d	\N	\N	0007	ga.	Ana	Potočnik	g		Ana  Potočnik		ana.potocnik@xxx.xx	1975-07-24	2407975555555	789012345	Z		Slovenija	Slovenija	Novo Mesto
00090000-5616-388e-3af0-50ca3ee0c02e	\N	\N	0008	ga.	Maja	Mlakar	h		Maja  Mlakar		maja.mlakar@xxx.xx	1986-08-02	0208986666666	890123456	Z		Slovenija	Slovenija	Nova Gorica
00090000-5616-388e-b258-298f76e49879	00010000-5616-388e-7cbf-74f315f99bb0	\N	0009		Irena	Kos	i		Irena  Kos		irena.kos@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Ptuj
00090000-5616-388e-3ed3-6dd98c572244	\N	\N	0010		Mojca	Vidmar	J		Mojca  Vidmar		mojca.vidmar@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Idrija
00090000-5616-388e-e339-7136c5b123ad	\N	\N	0011		xx	write protected12345	a		xx  write protected12345		xx@xxx.xx	\N	\N	\N	Z		\N	\N	\N
00090000-5616-388e-4bea-dd624f77ee20	\N	\N	0012		Luka	Golob	luč	a	Luka a Golob		luka.golob@xxx.xx	\N	\N	\N	M		\N	\N	\N
00090000-5616-388e-2a9d-a2620e1e1e53	00010000-5616-388e-000d-683dd2aedc66	\N	0013		Tatjana	Božič	tajnica	a	Tatjana a Božič		tatjana.bozic@xxx.xx	\N	\N	\N	Z		\N	\N	\N
00090000-5616-388e-b441-e913523fcc99	\N	\N	0014		William	Shakespeare	avtor		William  Shakespeare		\N	\N	\N	\N	M		\N	\N	\N
00090000-5616-388e-9ff9-4c6b3171e1f8	\N	\N	0015		Nebojša	Kavader	avtor		Nebojša  Kavader		\N	\N	\N	\N	M		\N	\N	\N
00090000-5616-388e-c2f4-78d8f2f4c57a	\N	\N	0016		Fjodor	Dostojevski	avtor	Mihajlovič	Fjodor Mihajlovič Dostojevski		\N	\N	\N	\N	M		\N	\N	\N
00090000-5616-388e-899b-74b2a9e9f55a	\N	\N	0017		Berta 	Hočevar	avtorica		Berta   Hočevar		\N	\N	\N	\N	Z		\N	\N	\N
00090000-5616-388e-b5e7-7deab337fa32	\N	\N	0018		Katarina	Podbevšek	lektorica		Katarina  Podbevšek		\N	\N	\N	\N	Z		\N	\N	\N
\.


--
-- TOC entry 2986 (class 0 OID 21495464)
-- Dependencies: 178
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-5616-388c-c88f-b22a544a245d	Aaa-read	Aaa (User,Role,Permission) - branje	f
00030000-5616-388c-b5ad-0b6f7271a017	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	f
00030000-5616-388c-c108-2b04d8b00e6c	TerminStoritve-vse	TerminStoritve - spreminjanje vseh zapisov	f
00030000-5616-388c-c930-32d06debd28e	Dogodek-readVse	Dogodek - branje vseh, ne glede na status dogodka	f
00030000-5616-388c-ad25-eafc79898c70	Oseba-vse	Oseba - vse - za testiranje assert	f
00030000-5616-388c-5fa7-2cee62735a1d	ProgramDela-lock	ProgramDela - zaklepanje	f
00030000-5616-388c-02cc-ae25a460e036	ProgramDela-unlock	ProgramDela - odklepanje	f
00030000-5616-388c-e457-faf4e3341271	Abonma-read	Abonma - branje	f
00030000-5616-388c-de90-14aba40e6668	Abonma-write	Abonma - spreminjanje	f
00030000-5616-388c-6ff9-5951e97df1c8	Alternacija-read	Alternacija - branje	f
00030000-5616-388c-baa6-affbbbcf2cae	Alternacija-write	Alternacija - spreminjanje	f
00030000-5616-388c-99c1-0a7f3e7158f5	Arhivalija-read	Arhivalija - branje	f
00030000-5616-388c-086f-45735c6a974f	Arhivalija-write	Arhivalija - spreminjanje	f
00030000-5616-388c-c1dd-e7410aefa8e6	AvtorBesedila-read	AvtorBesedila - branje	f
00030000-5616-388c-cba4-0bf689392865	AvtorBesedila-write	AvtorBesedila - spreminjanje	f
00030000-5616-388c-5ec5-01837eccb6db	Besedilo-read	Besedilo - branje	f
00030000-5616-388c-84f7-ef295b371acd	Besedilo-write	Besedilo - spreminjanje	f
00030000-5616-388c-34e6-020691d98c63	DogodekIzven-read	DogodekIzven - branje	f
00030000-5616-388c-30fd-f2e110948d53	DogodekIzven-write	DogodekIzven - spreminjanje	f
00030000-5616-388c-308f-2c433165ea53	Dogodek-read	Dogodek - branje	f
00030000-5616-388c-c0fd-fed3440f5314	Dogodek-write	Dogodek - spreminjanje	f
00030000-5616-388c-ee18-e3674b862ab6	DrugiVir-read	DrugiVir - branje	f
00030000-5616-388c-0739-7c05ea7d791a	DrugiVir-write	DrugiVir - spreminjanje	f
00030000-5616-388c-7754-1c9f7822328b	Drzava-read	Drzava - branje	f
00030000-5616-388c-74e4-93f3f2970e81	Drzava-write	Drzava - spreminjanje	f
00030000-5616-388c-5da7-bc5ebd7b94c5	EnotaPrograma-read	EnotaPrograma - branje	f
00030000-5616-388c-c22f-1bcff90b1d88	EnotaPrograma-write	EnotaPrograma - spreminjanje	f
00030000-5616-388c-d8f1-f5cfbd0e4464	Funkcija-read	Funkcija - branje	f
00030000-5616-388c-eafc-11c257249c3c	Funkcija-write	Funkcija - spreminjanje	f
00030000-5616-388c-e4cf-99ed5eaa18d6	Gostovanje-read	Gostovanje - branje	f
00030000-5616-388c-5e88-f93656500020	Gostovanje-write	Gostovanje - spreminjanje	f
00030000-5616-388c-0fb6-8e819d911063	Gostujoca-read	Gostujoca - branje	f
00030000-5616-388c-b525-e46b4ef34745	Gostujoca-write	Gostujoca - spreminjanje	f
00030000-5616-388c-ba55-30107a39bef0	KontaktnaOseba-read	KontaktnaOseba - branje	f
00030000-5616-388c-4d9e-ce85f3330c8e	KontaktnaOseba-write	KontaktnaOseba - spreminjanje	f
00030000-5616-388c-7b0f-69e8c556c07c	Kupec-read	Kupec - branje	f
00030000-5616-388c-3245-c996f68dd32e	Kupec-write	Kupec - spreminjanje	f
00030000-5616-388c-d524-3cc411637082	NacinPlacina-read	NacinPlacina - branje	f
00030000-5616-388c-2118-cabdcd505187	NacinPlacina-write	NacinPlacina - spreminjanje	f
00030000-5616-388c-d382-262e741fd916	Option-read	Option - branje	f
00030000-5616-388c-cfec-51d0b778b51a	Option-write	Option - spreminjanje	f
00030000-5616-388c-480a-b57b34382cd9	OptionValue-read	OptionValue - branje	f
00030000-5616-388c-06be-e90df0903505	OptionValue-write	OptionValue - spreminjanje	f
00030000-5616-388c-3d81-4fceda4993c7	Oseba-read	Oseba - branje	f
00030000-5616-388c-6793-7fdfde01cf82	Oseba-write	Oseba - spreminjanje	f
00030000-5616-388c-6e5b-17819adba1c8	PlacilniInstrument-read	PlacilniInstrument - branje	f
00030000-5616-388c-7369-ba801391dfd3	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	f
00030000-5616-388c-1593-72e243972af9	PodrocjeSedenja-read	PodrocjeSedenja - branje	f
00030000-5616-388c-5e78-71150bf48ae5	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	f
00030000-5616-388c-9a6f-43aaa302eb5b	Pogodba-read	Pogodba - branje	f
00030000-5616-388c-b25d-ce2df9694c70	Pogodba-write	Pogodba - spreminjanje	f
00030000-5616-388c-d156-42079be3e162	Popa-read	Popa - branje	f
00030000-5616-388c-7a83-da1de73da39d	Popa-write	Popa - spreminjanje	f
00030000-5616-388c-132d-fdf37931488f	Posta-read	Posta - branje	f
00030000-5616-388c-ff25-5fca66603c61	Posta-write	Posta - spreminjanje	f
00030000-5616-388c-9112-ec847a20f973	PostavkaCDve-read	PostavkaCDve - branje	f
00030000-5616-388c-0344-0aa06fd282ec	PostavkaCDve-write	PostavkaCDve - spreminjanje	f
00030000-5616-388c-d657-260ac0d5e961	PostavkaRacuna-read	PostavkaRacuna - branje	f
00030000-5616-388c-f0dd-56c28594c2ac	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	f
00030000-5616-388c-eff2-add9de3ae7ae	PostniNaslov-read	PostniNaslov - branje	f
00030000-5616-388c-f267-fd33e8780f1a	PostniNaslov-write	PostniNaslov - spreminjanje	f
00030000-5616-388c-2642-f8fa1a60d2b9	Predstava-read	Predstava - branje	f
00030000-5616-388c-8004-408b728c2492	Predstava-write	Predstava - spreminjanje	f
00030000-5616-388c-a989-ce0015403a39	ProdajaPredstave-read	ProdajaPredstave - branje	f
00030000-5616-388c-c433-65a549e9bdd2	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	f
00030000-5616-388c-ad32-35c4e3432d37	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	f
00030000-5616-388c-23f9-ec2ee0e1c73e	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	f
00030000-5616-388c-6896-12d9ae6e21f2	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	f
00030000-5616-388c-def9-10ff5dd22534	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	f
00030000-5616-388c-9985-b11a5efa7d2d	ProgramDela-read	ProgramDela - branje	f
00030000-5616-388c-70c4-3fe45efae3ed	ProgramDela-write	ProgramDela - spreminjanje	f
00030000-5616-388c-b185-3a2dd99eab6d	ProgramFestival-read	ProgramFestival - branje	f
00030000-5616-388c-265e-a49ac337f8f6	ProgramFestival-write	ProgramFestival - spreminjanje	f
00030000-5616-388c-3bb9-2cc0b45b761d	ProgramGostovanje-read	ProgramGostovanje - branje	f
00030000-5616-388c-1c8d-c344ea15b387	ProgramGostovanje-write	ProgramGostovanje - spreminjanje	f
00030000-5616-388c-3100-5ca6e1cf7d27	ProgramGostujoca-read	ProgramGostujoca - branje	f
00030000-5616-388c-6e3f-d30ddd528a48	ProgramGostujoca-write	ProgramGostujoca - spreminjanje	f
00030000-5616-388c-d5c5-f7a0381f49f9	ProgramIzjemni-read	ProgramIzjemni - branje	f
00030000-5616-388c-7cd2-ce26cc72e7c0	ProgramIzjemni-write	ProgramIzjemni - spreminjanje	f
00030000-5616-388c-3340-e929fe4e1154	ProgramPonovitevPrejsnjih-read	ProgramPonovitevPrejsnjih - branje	f
00030000-5616-388c-19ec-64fdf0a902a3	ProgramPonovitevPrejsnjih-write	ProgramPonovitevPrejsnjih - spreminjanje	f
00030000-5616-388c-134e-00237d0cdaa8	ProgramPonovitevPremiere-read	ProgramPonovitevPremiere - branje	f
00030000-5616-388c-87e8-6654b6906451	ProgramPonovitevPremiere-write	ProgramPonovitevPremiere - spreminjanje	f
00030000-5616-388c-6a08-480f17932702	ProgramPremiera-read	ProgramPremiera - branje	f
00030000-5616-388c-14ed-42ce07470768	ProgramPremiera-write	ProgramPremiera - spreminjanje	f
00030000-5616-388c-13b4-46e0171799c8	ProgramRazno-read	ProgramRazno - branje	f
00030000-5616-388c-315b-1a7c2ece3457	ProgramRazno-write	ProgramRazno - spreminjanje	f
00030000-5616-388c-621a-0723c013b336	ProgramskaEnotaSklopa-read	ProgramskaEnotaSklopa - branje	f
00030000-5616-388c-920f-f155e6cbe1f6	ProgramskaEnotaSklopa-write	ProgramskaEnotaSklopa - spreminjanje	f
00030000-5616-388c-60ef-24034f62742d	Prostor-read	Prostor - branje	f
00030000-5616-388c-e2bc-bf5ef501668c	Prostor-write	Prostor - spreminjanje	f
00030000-5616-388c-676f-f81ea0790bc4	Racun-read	Racun - branje	f
00030000-5616-388c-c84b-00a6d57e5da2	Racun-write	Racun - spreminjanje	f
00030000-5616-388c-7f14-3643e75de8ae	RazpisanSedez-read	RazpisanSedez - branje	f
00030000-5616-388c-de0c-81f6565d30f7	RazpisanSedez-write	RazpisanSedez - spreminjanje	f
00030000-5616-388c-19e5-f0d20b6a67e7	Rekviziterstvo-read	Rekviziterstvo - branje	f
00030000-5616-388c-4361-886b24625a75	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	f
00030000-5616-388c-40e8-3790723ee72a	Rekvizit-read	Rekvizit - branje	f
00030000-5616-388c-1217-5da081024f4a	Rekvizit-write	Rekvizit - spreminjanje	f
00030000-5616-388c-a73a-105916e3e444	Revizija-read	Revizija - branje	f
00030000-5616-388c-0308-8bc07964200b	Revizija-write	Revizija - spreminjanje	f
00030000-5616-388c-be4a-a40b2f63bdef	Rezervacija-read	Rezervacija - branje	f
00030000-5616-388c-3cb9-b02d1b719fe1	Rezervacija-write	Rezervacija - spreminjanje	f
00030000-5616-388c-978c-aef6aa67b32e	SedezniRed-read	SedezniRed - branje	f
00030000-5616-388c-6376-7b7b99dfbc31	SedezniRed-write	SedezniRed - spreminjanje	f
00030000-5616-388c-25db-ff44614558c4	Sedez-read	Sedez - branje	f
00030000-5616-388c-2a2c-fee34003cec1	Sedez-write	Sedez - spreminjanje	f
00030000-5616-388c-b255-6302c8027742	Sezona-read	Sezona - branje	f
00030000-5616-388c-1444-9a89d8b65f8d	Sezona-write	Sezona - spreminjanje	f
00030000-5616-388c-22bb-cff06be3bb14	StevilcenjeKonfig-read	StevilcenjeKonfig - branje	f
00030000-5616-388c-5314-dff733974087	StevilcenjeKonfig-write	StevilcenjeKonfig - spreminjanje	f
00030000-5616-388c-b3db-422c41d5ce80	Stevilcenje-read	Stevilcenje - branje	f
00030000-5616-388c-5600-54e50fdc9976	Stevilcenje-write	Stevilcenje - spreminjanje	f
00030000-5616-388c-f727-456fd2232b06	StevilcenjeStanje-read	StevilcenjeStanje - branje	f
00030000-5616-388c-2eb3-9cfbade1be61	StevilcenjeStanje-write	StevilcenjeStanje - spreminjanje	f
00030000-5616-388c-1eae-0e36abcf40a3	StrosekUprizoritve-read	StrosekUprizoritve - branje	f
00030000-5616-388c-74f5-eeec71b50c04	StrosekUprizoritve-write	StrosekUprizoritve - spreminjanje	f
00030000-5616-388c-858f-6c2455a9ff41	Telefonska-read	Telefonska - branje	f
00030000-5616-388c-ec04-e42d226c10b5	Telefonska-write	Telefonska - spreminjanje	f
00030000-5616-388c-ba2d-14a1f53e6415	TerminStoritve-read	TerminStoritve - branje	f
00030000-5616-388c-6cb6-e8002fdf76f9	TerminStoritve-write	TerminStoritve - spreminjanje	f
00030000-5616-388c-5319-9da16605a010	TipFunkcije-read	TipFunkcije - branje	f
00030000-5616-388c-2013-1882a086553b	TipFunkcije-write	TipFunkcije - spreminjanje	f
00030000-5616-388c-fd20-ed6af55fdc0d	TipProgramskeEnote-read	TipProgramskeEnote - branje	f
00030000-5616-388c-956a-0c2f0d7e5300	TipProgramskeEnote-write	TipProgramskeEnote - spreminjanje	f
00030000-5616-388c-3b62-e228c12efb39	Trr-read	Trr - branje	f
00030000-5616-388c-627c-8b4ec53dd2a9	Trr-write	Trr - spreminjanje	f
00030000-5616-388c-73f5-77ca94d9c301	Uprizoritev-read	Uprizoritev - branje	f
00030000-5616-388c-e0a2-af700de27d9c	Uprizoritev-write	Uprizoritev - spreminjanje	f
00030000-5616-388c-3ef0-70e5609e80c9	Vaja-read	Vaja - branje	f
00030000-5616-388c-fb61-eb8f54bd6dab	Vaja-write	Vaja - spreminjanje	f
00030000-5616-388c-3e16-5d37e892a861	VrstaSedezev-read	VrstaSedezev - branje	f
00030000-5616-388c-3fc0-3ff26b32a776	VrstaSedezev-write	VrstaSedezev - spreminjanje	f
00030000-5616-388c-2dfa-cb6dd676e90f	VrstaStroska-read	VrstaStroska - branje	f
00030000-5616-388c-0d6c-288af01661dc	VrstaStroska-write	VrstaStroska - spreminjanje	f
00030000-5616-388c-afd6-5e9de51c68b0	Zaposlitev-read	Zaposlitev - branje	f
00030000-5616-388c-70cb-bedd0af8cf30	Zaposlitev-write	Zaposlitev - spreminjanje	f
00030000-5616-388c-7079-8074c863c1a9	Zasedenost-read	Zasedenost - branje	f
00030000-5616-388c-e56d-a0710dd5d02f	Zasedenost-write	Zasedenost - spreminjanje	f
00030000-5616-388c-db85-6e4121aebaca	ZvrstSurs-read	ZvrstSurs - branje	f
00030000-5616-388c-506d-f3083705b038	ZvrstSurs-write	ZvrstSurs - spreminjanje	f
00030000-5616-388c-f3c8-3b0885725d80	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	f
00030000-5616-388c-4651-c0a4f7fa868d	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	f
00030000-5616-388c-1a6f-c4904012cac0	Job-read	Branje opravil - samo zase - branje	f
00030000-5616-388c-4fbf-8b625deccb55	Job-write	Dodajanje in spreminjanje opravil - samo zase	f
00030000-5616-388c-b3e0-039cad0de918	Job-admin	Upravljanje opravil za vse uporabnike	f
00030000-5616-388c-a257-4fc0dd98ada2	Mapa-write	Mapa - osnovno dovoljenje za pisanje	f
00030000-5616-388c-bff6-a49bf77216a0	Mapa-read	Mapa - osnovno dovoljenje za branje	f
00030000-5616-388c-29b8-bc706f53f976	MapaAcl-write	MapaAcl - dovoljenje za dostop pisanje ACL-jev mape	f
00030000-5616-388c-2602-4254c225efd8	MapaAcl-read	MapaAcl - dovoljenje za dostop branje ACL-jev mape	f
00030000-5616-388c-1fee-e02b5fe1fe99	Zapis-write	Zapis - dovoljenje za pisanje zapisov	f
00030000-5616-388c-8cda-ea77c3e86932	Zapis-read	Zapis - dovoljenje za pisanje zapisov	f
00030000-5616-388c-25a3-afa644b3bbe4	ZapisLastnik-write	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	f
00030000-5616-388c-c73f-88a571c7ba8e	ZapisLastnik-read	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	f
00030000-5616-388c-4ca1-6c37023cb010	VrstaZapisa-write	Šifrant vrst zapisa - spreminjanje	f
00030000-5616-388c-192b-b0f8798bf95b	VrstaZapisa-read	Šifrant vrst zapisa - branje	f
00030000-5616-388c-f0f4-9b4942cd47c0	Datoteka-write	Datoteka - spreminjanje	f
00030000-5616-388c-4d3a-31e4b72b66a9	Datoteka-read	Datoteke - branje	f
\.


--
-- TOC entry 2988 (class 0 OID 21495483)
-- Dependencies: 180
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-5616-388c-ff9a-8f245b50cf35	00030000-5616-388c-b5ad-0b6f7271a017
00020000-5616-388c-395d-461a84b93597	00030000-5616-388c-7754-1c9f7822328b
00020000-5616-388c-a336-07960cf141c4	00030000-5616-388c-e457-faf4e3341271
00020000-5616-388c-a336-07960cf141c4	00030000-5616-388c-de90-14aba40e6668
00020000-5616-388c-a336-07960cf141c4	00030000-5616-388c-6ff9-5951e97df1c8
00020000-5616-388c-a336-07960cf141c4	00030000-5616-388c-baa6-affbbbcf2cae
00020000-5616-388c-a336-07960cf141c4	00030000-5616-388c-99c1-0a7f3e7158f5
00020000-5616-388c-a336-07960cf141c4	00030000-5616-388c-308f-2c433165ea53
00020000-5616-388c-a336-07960cf141c4	00030000-5616-388c-c930-32d06debd28e
00020000-5616-388c-a336-07960cf141c4	00030000-5616-388c-c0fd-fed3440f5314
00020000-5616-388c-a336-07960cf141c4	00030000-5616-388c-7754-1c9f7822328b
00020000-5616-388c-a336-07960cf141c4	00030000-5616-388c-74e4-93f3f2970e81
00020000-5616-388c-a336-07960cf141c4	00030000-5616-388c-d8f1-f5cfbd0e4464
00020000-5616-388c-a336-07960cf141c4	00030000-5616-388c-eafc-11c257249c3c
00020000-5616-388c-a336-07960cf141c4	00030000-5616-388c-e4cf-99ed5eaa18d6
00020000-5616-388c-a336-07960cf141c4	00030000-5616-388c-5e88-f93656500020
00020000-5616-388c-a336-07960cf141c4	00030000-5616-388c-0fb6-8e819d911063
00020000-5616-388c-a336-07960cf141c4	00030000-5616-388c-b525-e46b4ef34745
00020000-5616-388c-a336-07960cf141c4	00030000-5616-388c-ba55-30107a39bef0
00020000-5616-388c-a336-07960cf141c4	00030000-5616-388c-4d9e-ce85f3330c8e
00020000-5616-388c-a336-07960cf141c4	00030000-5616-388c-d382-262e741fd916
00020000-5616-388c-a336-07960cf141c4	00030000-5616-388c-480a-b57b34382cd9
00020000-5616-388c-a336-07960cf141c4	00030000-5616-388c-3d81-4fceda4993c7
00020000-5616-388c-a336-07960cf141c4	00030000-5616-388c-6793-7fdfde01cf82
00020000-5616-388c-a336-07960cf141c4	00030000-5616-388c-d156-42079be3e162
00020000-5616-388c-a336-07960cf141c4	00030000-5616-388c-7a83-da1de73da39d
00020000-5616-388c-a336-07960cf141c4	00030000-5616-388c-132d-fdf37931488f
00020000-5616-388c-a336-07960cf141c4	00030000-5616-388c-ff25-5fca66603c61
00020000-5616-388c-a336-07960cf141c4	00030000-5616-388c-eff2-add9de3ae7ae
00020000-5616-388c-a336-07960cf141c4	00030000-5616-388c-f267-fd33e8780f1a
00020000-5616-388c-a336-07960cf141c4	00030000-5616-388c-2642-f8fa1a60d2b9
00020000-5616-388c-a336-07960cf141c4	00030000-5616-388c-8004-408b728c2492
00020000-5616-388c-a336-07960cf141c4	00030000-5616-388c-6896-12d9ae6e21f2
00020000-5616-388c-a336-07960cf141c4	00030000-5616-388c-def9-10ff5dd22534
00020000-5616-388c-a336-07960cf141c4	00030000-5616-388c-60ef-24034f62742d
00020000-5616-388c-a336-07960cf141c4	00030000-5616-388c-e2bc-bf5ef501668c
00020000-5616-388c-a336-07960cf141c4	00030000-5616-388c-19e5-f0d20b6a67e7
00020000-5616-388c-a336-07960cf141c4	00030000-5616-388c-4361-886b24625a75
00020000-5616-388c-a336-07960cf141c4	00030000-5616-388c-40e8-3790723ee72a
00020000-5616-388c-a336-07960cf141c4	00030000-5616-388c-1217-5da081024f4a
00020000-5616-388c-a336-07960cf141c4	00030000-5616-388c-b255-6302c8027742
00020000-5616-388c-a336-07960cf141c4	00030000-5616-388c-1444-9a89d8b65f8d
00020000-5616-388c-a336-07960cf141c4	00030000-5616-388c-5319-9da16605a010
00020000-5616-388c-a336-07960cf141c4	00030000-5616-388c-73f5-77ca94d9c301
00020000-5616-388c-a336-07960cf141c4	00030000-5616-388c-e0a2-af700de27d9c
00020000-5616-388c-a336-07960cf141c4	00030000-5616-388c-3ef0-70e5609e80c9
00020000-5616-388c-a336-07960cf141c4	00030000-5616-388c-fb61-eb8f54bd6dab
00020000-5616-388c-a336-07960cf141c4	00030000-5616-388c-7079-8074c863c1a9
00020000-5616-388c-a336-07960cf141c4	00030000-5616-388c-e56d-a0710dd5d02f
00020000-5616-388c-a336-07960cf141c4	00030000-5616-388c-db85-6e4121aebaca
00020000-5616-388c-a336-07960cf141c4	00030000-5616-388c-f3c8-3b0885725d80
00020000-5616-388c-506c-a8fd1f38af6c	00030000-5616-388c-e457-faf4e3341271
00020000-5616-388c-506c-a8fd1f38af6c	00030000-5616-388c-99c1-0a7f3e7158f5
00020000-5616-388c-506c-a8fd1f38af6c	00030000-5616-388c-308f-2c433165ea53
00020000-5616-388c-506c-a8fd1f38af6c	00030000-5616-388c-7754-1c9f7822328b
00020000-5616-388c-506c-a8fd1f38af6c	00030000-5616-388c-e4cf-99ed5eaa18d6
00020000-5616-388c-506c-a8fd1f38af6c	00030000-5616-388c-0fb6-8e819d911063
00020000-5616-388c-506c-a8fd1f38af6c	00030000-5616-388c-ba55-30107a39bef0
00020000-5616-388c-506c-a8fd1f38af6c	00030000-5616-388c-4d9e-ce85f3330c8e
00020000-5616-388c-506c-a8fd1f38af6c	00030000-5616-388c-d382-262e741fd916
00020000-5616-388c-506c-a8fd1f38af6c	00030000-5616-388c-480a-b57b34382cd9
00020000-5616-388c-506c-a8fd1f38af6c	00030000-5616-388c-3d81-4fceda4993c7
00020000-5616-388c-506c-a8fd1f38af6c	00030000-5616-388c-6793-7fdfde01cf82
00020000-5616-388c-506c-a8fd1f38af6c	00030000-5616-388c-d156-42079be3e162
00020000-5616-388c-506c-a8fd1f38af6c	00030000-5616-388c-132d-fdf37931488f
00020000-5616-388c-506c-a8fd1f38af6c	00030000-5616-388c-eff2-add9de3ae7ae
00020000-5616-388c-506c-a8fd1f38af6c	00030000-5616-388c-f267-fd33e8780f1a
00020000-5616-388c-506c-a8fd1f38af6c	00030000-5616-388c-2642-f8fa1a60d2b9
00020000-5616-388c-506c-a8fd1f38af6c	00030000-5616-388c-60ef-24034f62742d
00020000-5616-388c-506c-a8fd1f38af6c	00030000-5616-388c-19e5-f0d20b6a67e7
00020000-5616-388c-506c-a8fd1f38af6c	00030000-5616-388c-40e8-3790723ee72a
00020000-5616-388c-506c-a8fd1f38af6c	00030000-5616-388c-b255-6302c8027742
00020000-5616-388c-506c-a8fd1f38af6c	00030000-5616-388c-858f-6c2455a9ff41
00020000-5616-388c-506c-a8fd1f38af6c	00030000-5616-388c-ec04-e42d226c10b5
00020000-5616-388c-506c-a8fd1f38af6c	00030000-5616-388c-3b62-e228c12efb39
00020000-5616-388c-506c-a8fd1f38af6c	00030000-5616-388c-627c-8b4ec53dd2a9
00020000-5616-388c-506c-a8fd1f38af6c	00030000-5616-388c-afd6-5e9de51c68b0
00020000-5616-388c-506c-a8fd1f38af6c	00030000-5616-388c-70cb-bedd0af8cf30
00020000-5616-388c-506c-a8fd1f38af6c	00030000-5616-388c-db85-6e4121aebaca
00020000-5616-388c-506c-a8fd1f38af6c	00030000-5616-388c-f3c8-3b0885725d80
00020000-5616-388c-ca4a-2985ca9efc9c	00030000-5616-388c-e457-faf4e3341271
00020000-5616-388c-ca4a-2985ca9efc9c	00030000-5616-388c-6ff9-5951e97df1c8
00020000-5616-388c-ca4a-2985ca9efc9c	00030000-5616-388c-99c1-0a7f3e7158f5
00020000-5616-388c-ca4a-2985ca9efc9c	00030000-5616-388c-086f-45735c6a974f
00020000-5616-388c-ca4a-2985ca9efc9c	00030000-5616-388c-5ec5-01837eccb6db
00020000-5616-388c-ca4a-2985ca9efc9c	00030000-5616-388c-34e6-020691d98c63
00020000-5616-388c-ca4a-2985ca9efc9c	00030000-5616-388c-308f-2c433165ea53
00020000-5616-388c-ca4a-2985ca9efc9c	00030000-5616-388c-7754-1c9f7822328b
00020000-5616-388c-ca4a-2985ca9efc9c	00030000-5616-388c-d8f1-f5cfbd0e4464
00020000-5616-388c-ca4a-2985ca9efc9c	00030000-5616-388c-e4cf-99ed5eaa18d6
00020000-5616-388c-ca4a-2985ca9efc9c	00030000-5616-388c-0fb6-8e819d911063
00020000-5616-388c-ca4a-2985ca9efc9c	00030000-5616-388c-ba55-30107a39bef0
00020000-5616-388c-ca4a-2985ca9efc9c	00030000-5616-388c-d382-262e741fd916
00020000-5616-388c-ca4a-2985ca9efc9c	00030000-5616-388c-480a-b57b34382cd9
00020000-5616-388c-ca4a-2985ca9efc9c	00030000-5616-388c-3d81-4fceda4993c7
00020000-5616-388c-ca4a-2985ca9efc9c	00030000-5616-388c-d156-42079be3e162
00020000-5616-388c-ca4a-2985ca9efc9c	00030000-5616-388c-132d-fdf37931488f
00020000-5616-388c-ca4a-2985ca9efc9c	00030000-5616-388c-2642-f8fa1a60d2b9
00020000-5616-388c-ca4a-2985ca9efc9c	00030000-5616-388c-6896-12d9ae6e21f2
00020000-5616-388c-ca4a-2985ca9efc9c	00030000-5616-388c-60ef-24034f62742d
00020000-5616-388c-ca4a-2985ca9efc9c	00030000-5616-388c-19e5-f0d20b6a67e7
00020000-5616-388c-ca4a-2985ca9efc9c	00030000-5616-388c-40e8-3790723ee72a
00020000-5616-388c-ca4a-2985ca9efc9c	00030000-5616-388c-b255-6302c8027742
00020000-5616-388c-ca4a-2985ca9efc9c	00030000-5616-388c-5319-9da16605a010
00020000-5616-388c-ca4a-2985ca9efc9c	00030000-5616-388c-3ef0-70e5609e80c9
00020000-5616-388c-ca4a-2985ca9efc9c	00030000-5616-388c-7079-8074c863c1a9
00020000-5616-388c-ca4a-2985ca9efc9c	00030000-5616-388c-db85-6e4121aebaca
00020000-5616-388c-ca4a-2985ca9efc9c	00030000-5616-388c-f3c8-3b0885725d80
00020000-5616-388c-20e9-8f6b0dc7b4eb	00030000-5616-388c-e457-faf4e3341271
00020000-5616-388c-20e9-8f6b0dc7b4eb	00030000-5616-388c-de90-14aba40e6668
00020000-5616-388c-20e9-8f6b0dc7b4eb	00030000-5616-388c-baa6-affbbbcf2cae
00020000-5616-388c-20e9-8f6b0dc7b4eb	00030000-5616-388c-99c1-0a7f3e7158f5
00020000-5616-388c-20e9-8f6b0dc7b4eb	00030000-5616-388c-308f-2c433165ea53
00020000-5616-388c-20e9-8f6b0dc7b4eb	00030000-5616-388c-7754-1c9f7822328b
00020000-5616-388c-20e9-8f6b0dc7b4eb	00030000-5616-388c-e4cf-99ed5eaa18d6
00020000-5616-388c-20e9-8f6b0dc7b4eb	00030000-5616-388c-0fb6-8e819d911063
00020000-5616-388c-20e9-8f6b0dc7b4eb	00030000-5616-388c-d382-262e741fd916
00020000-5616-388c-20e9-8f6b0dc7b4eb	00030000-5616-388c-480a-b57b34382cd9
00020000-5616-388c-20e9-8f6b0dc7b4eb	00030000-5616-388c-d156-42079be3e162
00020000-5616-388c-20e9-8f6b0dc7b4eb	00030000-5616-388c-132d-fdf37931488f
00020000-5616-388c-20e9-8f6b0dc7b4eb	00030000-5616-388c-2642-f8fa1a60d2b9
00020000-5616-388c-20e9-8f6b0dc7b4eb	00030000-5616-388c-60ef-24034f62742d
00020000-5616-388c-20e9-8f6b0dc7b4eb	00030000-5616-388c-19e5-f0d20b6a67e7
00020000-5616-388c-20e9-8f6b0dc7b4eb	00030000-5616-388c-40e8-3790723ee72a
00020000-5616-388c-20e9-8f6b0dc7b4eb	00030000-5616-388c-b255-6302c8027742
00020000-5616-388c-20e9-8f6b0dc7b4eb	00030000-5616-388c-5319-9da16605a010
00020000-5616-388c-20e9-8f6b0dc7b4eb	00030000-5616-388c-db85-6e4121aebaca
00020000-5616-388c-20e9-8f6b0dc7b4eb	00030000-5616-388c-f3c8-3b0885725d80
00020000-5616-388c-1eb2-adb6aed06258	00030000-5616-388c-e457-faf4e3341271
00020000-5616-388c-1eb2-adb6aed06258	00030000-5616-388c-99c1-0a7f3e7158f5
00020000-5616-388c-1eb2-adb6aed06258	00030000-5616-388c-308f-2c433165ea53
00020000-5616-388c-1eb2-adb6aed06258	00030000-5616-388c-7754-1c9f7822328b
00020000-5616-388c-1eb2-adb6aed06258	00030000-5616-388c-e4cf-99ed5eaa18d6
00020000-5616-388c-1eb2-adb6aed06258	00030000-5616-388c-0fb6-8e819d911063
00020000-5616-388c-1eb2-adb6aed06258	00030000-5616-388c-d382-262e741fd916
00020000-5616-388c-1eb2-adb6aed06258	00030000-5616-388c-480a-b57b34382cd9
00020000-5616-388c-1eb2-adb6aed06258	00030000-5616-388c-d156-42079be3e162
00020000-5616-388c-1eb2-adb6aed06258	00030000-5616-388c-132d-fdf37931488f
00020000-5616-388c-1eb2-adb6aed06258	00030000-5616-388c-2642-f8fa1a60d2b9
00020000-5616-388c-1eb2-adb6aed06258	00030000-5616-388c-60ef-24034f62742d
00020000-5616-388c-1eb2-adb6aed06258	00030000-5616-388c-19e5-f0d20b6a67e7
00020000-5616-388c-1eb2-adb6aed06258	00030000-5616-388c-40e8-3790723ee72a
00020000-5616-388c-1eb2-adb6aed06258	00030000-5616-388c-b255-6302c8027742
00020000-5616-388c-1eb2-adb6aed06258	00030000-5616-388c-ba2d-14a1f53e6415
00020000-5616-388c-1eb2-adb6aed06258	00030000-5616-388c-c108-2b04d8b00e6c
00020000-5616-388c-1eb2-adb6aed06258	00030000-5616-388c-5319-9da16605a010
00020000-5616-388c-1eb2-adb6aed06258	00030000-5616-388c-db85-6e4121aebaca
00020000-5616-388c-1eb2-adb6aed06258	00030000-5616-388c-f3c8-3b0885725d80
00020000-5616-388e-31b3-a02d2c8fc684	00030000-5616-388c-c88f-b22a544a245d
00020000-5616-388e-31b3-a02d2c8fc684	00030000-5616-388c-b5ad-0b6f7271a017
00020000-5616-388e-31b3-a02d2c8fc684	00030000-5616-388c-c108-2b04d8b00e6c
00020000-5616-388e-31b3-a02d2c8fc684	00030000-5616-388c-c930-32d06debd28e
00020000-5616-388e-31b3-a02d2c8fc684	00030000-5616-388c-ad25-eafc79898c70
00020000-5616-388e-31b3-a02d2c8fc684	00030000-5616-388c-5fa7-2cee62735a1d
00020000-5616-388e-31b3-a02d2c8fc684	00030000-5616-388c-02cc-ae25a460e036
00020000-5616-388e-31b3-a02d2c8fc684	00030000-5616-388c-e457-faf4e3341271
00020000-5616-388e-31b3-a02d2c8fc684	00030000-5616-388c-de90-14aba40e6668
00020000-5616-388e-31b3-a02d2c8fc684	00030000-5616-388c-6ff9-5951e97df1c8
00020000-5616-388e-31b3-a02d2c8fc684	00030000-5616-388c-baa6-affbbbcf2cae
00020000-5616-388e-31b3-a02d2c8fc684	00030000-5616-388c-99c1-0a7f3e7158f5
00020000-5616-388e-31b3-a02d2c8fc684	00030000-5616-388c-086f-45735c6a974f
00020000-5616-388e-31b3-a02d2c8fc684	00030000-5616-388c-5ec5-01837eccb6db
00020000-5616-388e-31b3-a02d2c8fc684	00030000-5616-388c-84f7-ef295b371acd
00020000-5616-388e-31b3-a02d2c8fc684	00030000-5616-388c-34e6-020691d98c63
00020000-5616-388e-31b3-a02d2c8fc684	00030000-5616-388c-30fd-f2e110948d53
00020000-5616-388e-31b3-a02d2c8fc684	00030000-5616-388c-308f-2c433165ea53
00020000-5616-388e-31b3-a02d2c8fc684	00030000-5616-388c-c0fd-fed3440f5314
00020000-5616-388e-31b3-a02d2c8fc684	00030000-5616-388c-7754-1c9f7822328b
00020000-5616-388e-31b3-a02d2c8fc684	00030000-5616-388c-74e4-93f3f2970e81
00020000-5616-388e-31b3-a02d2c8fc684	00030000-5616-388c-ee18-e3674b862ab6
00020000-5616-388e-31b3-a02d2c8fc684	00030000-5616-388c-0739-7c05ea7d791a
00020000-5616-388e-31b3-a02d2c8fc684	00030000-5616-388c-5da7-bc5ebd7b94c5
00020000-5616-388e-31b3-a02d2c8fc684	00030000-5616-388c-c22f-1bcff90b1d88
00020000-5616-388e-31b3-a02d2c8fc684	00030000-5616-388c-d8f1-f5cfbd0e4464
00020000-5616-388e-31b3-a02d2c8fc684	00030000-5616-388c-eafc-11c257249c3c
00020000-5616-388e-31b3-a02d2c8fc684	00030000-5616-388c-e4cf-99ed5eaa18d6
00020000-5616-388e-31b3-a02d2c8fc684	00030000-5616-388c-5e88-f93656500020
00020000-5616-388e-31b3-a02d2c8fc684	00030000-5616-388c-0fb6-8e819d911063
00020000-5616-388e-31b3-a02d2c8fc684	00030000-5616-388c-b525-e46b4ef34745
00020000-5616-388e-31b3-a02d2c8fc684	00030000-5616-388c-ba55-30107a39bef0
00020000-5616-388e-31b3-a02d2c8fc684	00030000-5616-388c-4d9e-ce85f3330c8e
00020000-5616-388e-31b3-a02d2c8fc684	00030000-5616-388c-7b0f-69e8c556c07c
00020000-5616-388e-31b3-a02d2c8fc684	00030000-5616-388c-3245-c996f68dd32e
00020000-5616-388e-31b3-a02d2c8fc684	00030000-5616-388c-d524-3cc411637082
00020000-5616-388e-31b3-a02d2c8fc684	00030000-5616-388c-2118-cabdcd505187
00020000-5616-388e-31b3-a02d2c8fc684	00030000-5616-388c-d382-262e741fd916
00020000-5616-388e-31b3-a02d2c8fc684	00030000-5616-388c-cfec-51d0b778b51a
00020000-5616-388e-31b3-a02d2c8fc684	00030000-5616-388c-480a-b57b34382cd9
00020000-5616-388e-31b3-a02d2c8fc684	00030000-5616-388c-06be-e90df0903505
00020000-5616-388e-31b3-a02d2c8fc684	00030000-5616-388c-3d81-4fceda4993c7
00020000-5616-388e-31b3-a02d2c8fc684	00030000-5616-388c-6793-7fdfde01cf82
00020000-5616-388e-31b3-a02d2c8fc684	00030000-5616-388c-6e5b-17819adba1c8
00020000-5616-388e-31b3-a02d2c8fc684	00030000-5616-388c-7369-ba801391dfd3
00020000-5616-388e-31b3-a02d2c8fc684	00030000-5616-388c-1593-72e243972af9
00020000-5616-388e-31b3-a02d2c8fc684	00030000-5616-388c-5e78-71150bf48ae5
00020000-5616-388e-31b3-a02d2c8fc684	00030000-5616-388c-9a6f-43aaa302eb5b
00020000-5616-388e-31b3-a02d2c8fc684	00030000-5616-388c-b25d-ce2df9694c70
00020000-5616-388e-31b3-a02d2c8fc684	00030000-5616-388c-d156-42079be3e162
00020000-5616-388e-31b3-a02d2c8fc684	00030000-5616-388c-7a83-da1de73da39d
00020000-5616-388e-31b3-a02d2c8fc684	00030000-5616-388c-132d-fdf37931488f
00020000-5616-388e-31b3-a02d2c8fc684	00030000-5616-388c-ff25-5fca66603c61
00020000-5616-388e-31b3-a02d2c8fc684	00030000-5616-388c-9112-ec847a20f973
00020000-5616-388e-31b3-a02d2c8fc684	00030000-5616-388c-0344-0aa06fd282ec
00020000-5616-388e-31b3-a02d2c8fc684	00030000-5616-388c-d657-260ac0d5e961
00020000-5616-388e-31b3-a02d2c8fc684	00030000-5616-388c-f0dd-56c28594c2ac
00020000-5616-388e-31b3-a02d2c8fc684	00030000-5616-388c-eff2-add9de3ae7ae
00020000-5616-388e-31b3-a02d2c8fc684	00030000-5616-388c-f267-fd33e8780f1a
00020000-5616-388e-31b3-a02d2c8fc684	00030000-5616-388c-2642-f8fa1a60d2b9
00020000-5616-388e-31b3-a02d2c8fc684	00030000-5616-388c-8004-408b728c2492
00020000-5616-388e-31b3-a02d2c8fc684	00030000-5616-388c-a989-ce0015403a39
00020000-5616-388e-31b3-a02d2c8fc684	00030000-5616-388c-c433-65a549e9bdd2
00020000-5616-388e-31b3-a02d2c8fc684	00030000-5616-388c-ad32-35c4e3432d37
00020000-5616-388e-31b3-a02d2c8fc684	00030000-5616-388c-23f9-ec2ee0e1c73e
00020000-5616-388e-31b3-a02d2c8fc684	00030000-5616-388c-6896-12d9ae6e21f2
00020000-5616-388e-31b3-a02d2c8fc684	00030000-5616-388c-def9-10ff5dd22534
00020000-5616-388e-31b3-a02d2c8fc684	00030000-5616-388c-9985-b11a5efa7d2d
00020000-5616-388e-31b3-a02d2c8fc684	00030000-5616-388c-70c4-3fe45efae3ed
00020000-5616-388e-31b3-a02d2c8fc684	00030000-5616-388c-b185-3a2dd99eab6d
00020000-5616-388e-31b3-a02d2c8fc684	00030000-5616-388c-265e-a49ac337f8f6
00020000-5616-388e-31b3-a02d2c8fc684	00030000-5616-388c-3bb9-2cc0b45b761d
00020000-5616-388e-31b3-a02d2c8fc684	00030000-5616-388c-1c8d-c344ea15b387
00020000-5616-388e-31b3-a02d2c8fc684	00030000-5616-388c-3100-5ca6e1cf7d27
00020000-5616-388e-31b3-a02d2c8fc684	00030000-5616-388c-6e3f-d30ddd528a48
00020000-5616-388e-31b3-a02d2c8fc684	00030000-5616-388c-d5c5-f7a0381f49f9
00020000-5616-388e-31b3-a02d2c8fc684	00030000-5616-388c-7cd2-ce26cc72e7c0
00020000-5616-388e-31b3-a02d2c8fc684	00030000-5616-388c-3340-e929fe4e1154
00020000-5616-388e-31b3-a02d2c8fc684	00030000-5616-388c-19ec-64fdf0a902a3
00020000-5616-388e-31b3-a02d2c8fc684	00030000-5616-388c-134e-00237d0cdaa8
00020000-5616-388e-31b3-a02d2c8fc684	00030000-5616-388c-87e8-6654b6906451
00020000-5616-388e-31b3-a02d2c8fc684	00030000-5616-388c-6a08-480f17932702
00020000-5616-388e-31b3-a02d2c8fc684	00030000-5616-388c-14ed-42ce07470768
00020000-5616-388e-31b3-a02d2c8fc684	00030000-5616-388c-13b4-46e0171799c8
00020000-5616-388e-31b3-a02d2c8fc684	00030000-5616-388c-315b-1a7c2ece3457
00020000-5616-388e-31b3-a02d2c8fc684	00030000-5616-388c-621a-0723c013b336
00020000-5616-388e-31b3-a02d2c8fc684	00030000-5616-388c-920f-f155e6cbe1f6
00020000-5616-388e-31b3-a02d2c8fc684	00030000-5616-388c-60ef-24034f62742d
00020000-5616-388e-31b3-a02d2c8fc684	00030000-5616-388c-e2bc-bf5ef501668c
00020000-5616-388e-31b3-a02d2c8fc684	00030000-5616-388c-676f-f81ea0790bc4
00020000-5616-388e-31b3-a02d2c8fc684	00030000-5616-388c-c84b-00a6d57e5da2
00020000-5616-388e-31b3-a02d2c8fc684	00030000-5616-388c-7f14-3643e75de8ae
00020000-5616-388e-31b3-a02d2c8fc684	00030000-5616-388c-de0c-81f6565d30f7
00020000-5616-388e-31b3-a02d2c8fc684	00030000-5616-388c-19e5-f0d20b6a67e7
00020000-5616-388e-31b3-a02d2c8fc684	00030000-5616-388c-4361-886b24625a75
00020000-5616-388e-31b3-a02d2c8fc684	00030000-5616-388c-40e8-3790723ee72a
00020000-5616-388e-31b3-a02d2c8fc684	00030000-5616-388c-1217-5da081024f4a
00020000-5616-388e-31b3-a02d2c8fc684	00030000-5616-388c-a73a-105916e3e444
00020000-5616-388e-31b3-a02d2c8fc684	00030000-5616-388c-0308-8bc07964200b
00020000-5616-388e-31b3-a02d2c8fc684	00030000-5616-388c-be4a-a40b2f63bdef
00020000-5616-388e-31b3-a02d2c8fc684	00030000-5616-388c-3cb9-b02d1b719fe1
00020000-5616-388e-31b3-a02d2c8fc684	00030000-5616-388c-978c-aef6aa67b32e
00020000-5616-388e-31b3-a02d2c8fc684	00030000-5616-388c-6376-7b7b99dfbc31
00020000-5616-388e-31b3-a02d2c8fc684	00030000-5616-388c-25db-ff44614558c4
00020000-5616-388e-31b3-a02d2c8fc684	00030000-5616-388c-2a2c-fee34003cec1
00020000-5616-388e-31b3-a02d2c8fc684	00030000-5616-388c-b255-6302c8027742
00020000-5616-388e-31b3-a02d2c8fc684	00030000-5616-388c-1444-9a89d8b65f8d
00020000-5616-388e-31b3-a02d2c8fc684	00030000-5616-388c-22bb-cff06be3bb14
00020000-5616-388e-31b3-a02d2c8fc684	00030000-5616-388c-5314-dff733974087
00020000-5616-388e-31b3-a02d2c8fc684	00030000-5616-388c-b3db-422c41d5ce80
00020000-5616-388e-31b3-a02d2c8fc684	00030000-5616-388c-5600-54e50fdc9976
00020000-5616-388e-31b3-a02d2c8fc684	00030000-5616-388c-f727-456fd2232b06
00020000-5616-388e-31b3-a02d2c8fc684	00030000-5616-388c-2eb3-9cfbade1be61
00020000-5616-388e-31b3-a02d2c8fc684	00030000-5616-388c-1eae-0e36abcf40a3
00020000-5616-388e-31b3-a02d2c8fc684	00030000-5616-388c-74f5-eeec71b50c04
00020000-5616-388e-31b3-a02d2c8fc684	00030000-5616-388c-858f-6c2455a9ff41
00020000-5616-388e-31b3-a02d2c8fc684	00030000-5616-388c-ec04-e42d226c10b5
00020000-5616-388e-31b3-a02d2c8fc684	00030000-5616-388c-ba2d-14a1f53e6415
00020000-5616-388e-31b3-a02d2c8fc684	00030000-5616-388c-6cb6-e8002fdf76f9
00020000-5616-388e-31b3-a02d2c8fc684	00030000-5616-388c-5319-9da16605a010
00020000-5616-388e-31b3-a02d2c8fc684	00030000-5616-388c-2013-1882a086553b
00020000-5616-388e-31b3-a02d2c8fc684	00030000-5616-388c-fd20-ed6af55fdc0d
00020000-5616-388e-31b3-a02d2c8fc684	00030000-5616-388c-956a-0c2f0d7e5300
00020000-5616-388e-31b3-a02d2c8fc684	00030000-5616-388c-3b62-e228c12efb39
00020000-5616-388e-31b3-a02d2c8fc684	00030000-5616-388c-627c-8b4ec53dd2a9
00020000-5616-388e-31b3-a02d2c8fc684	00030000-5616-388c-73f5-77ca94d9c301
00020000-5616-388e-31b3-a02d2c8fc684	00030000-5616-388c-e0a2-af700de27d9c
00020000-5616-388e-31b3-a02d2c8fc684	00030000-5616-388c-3ef0-70e5609e80c9
00020000-5616-388e-31b3-a02d2c8fc684	00030000-5616-388c-fb61-eb8f54bd6dab
00020000-5616-388e-31b3-a02d2c8fc684	00030000-5616-388c-3e16-5d37e892a861
00020000-5616-388e-31b3-a02d2c8fc684	00030000-5616-388c-3fc0-3ff26b32a776
00020000-5616-388e-31b3-a02d2c8fc684	00030000-5616-388c-2dfa-cb6dd676e90f
00020000-5616-388e-31b3-a02d2c8fc684	00030000-5616-388c-0d6c-288af01661dc
00020000-5616-388e-31b3-a02d2c8fc684	00030000-5616-388c-afd6-5e9de51c68b0
00020000-5616-388e-31b3-a02d2c8fc684	00030000-5616-388c-70cb-bedd0af8cf30
00020000-5616-388e-31b3-a02d2c8fc684	00030000-5616-388c-7079-8074c863c1a9
00020000-5616-388e-31b3-a02d2c8fc684	00030000-5616-388c-e56d-a0710dd5d02f
00020000-5616-388e-31b3-a02d2c8fc684	00030000-5616-388c-db85-6e4121aebaca
00020000-5616-388e-31b3-a02d2c8fc684	00030000-5616-388c-506d-f3083705b038
00020000-5616-388e-31b3-a02d2c8fc684	00030000-5616-388c-f3c8-3b0885725d80
00020000-5616-388e-31b3-a02d2c8fc684	00030000-5616-388c-4651-c0a4f7fa868d
\.


--
-- TOC entry 3017 (class 0 OID 21495808)
-- Dependencies: 209
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 3021 (class 0 OID 21495842)
-- Dependencies: 213
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 3033 (class 0 OID 21495978)
-- Dependencies: 225
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, zacetek, konec, jeavtorskepravice, placilonavajo, vrednostvaje, planiranostevilovaj, vrednostvaj, vrednostpredstave, procentodinkasa, jeprocentodinkasa, vrednostdopremiere, zaposlenvdrjz, samozaposlen, igralec, opis) FROM stdin;
000b0000-5616-388e-3dc9-6cd10708b256	00090000-5616-388e-7d24-c598ccb61030	\N	\N	0001	\N	\N	f	f	10.00	3	10.00	30.00	\N	f	10.00	t	f	t	Pogodba o sodelovanju
000b0000-5616-388e-abea-c20c052267dc	00090000-5616-388e-71cb-b7b41e040036	\N	\N	0002	\N	\N	f	t	11.00	10	11.00	31.00	\N	f	110.00	f	t	t	Pogodba za vlogo Helena
000b0000-5616-388e-ae43-b2e8143b514e	00090000-5616-388e-2a9d-a2620e1e1e53	\N	\N	0003	\N	\N	f	f	12.00	4	12.00	0.00	\N	f	12.00	f	t	f	Pogodba za lektoriranje
000b0000-5616-388e-9749-2da6e46410a2	00090000-5616-388e-3ed3-6dd98c572244	\N	\N	0004	\N	\N	t	f	0.00	2	300.00	0.00	\N	f	300.00	f	t	f	Pogodba za avtorske pravice
\.


--
-- TOC entry 2993 (class 0 OID 21495543)
-- Dependencies: 185
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, drzava_id, sifra, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo, nvo) FROM stdin;
00080000-5616-388e-82c4-e2614577dc98	00040000-5616-388c-4560-27b38010be9e	0988	AK	Juhuhu d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5616-388e-2e7d-e42ba191eb6d	00040000-5616-388c-4560-27b38010be9e	0989	AK	Hopsasa d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	t
00080000-5616-388e-8347-e7df191da7ae	00040000-5616-388c-4560-27b38010be9e	0987	AK	Gledališče Šrum d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5616-388e-774c-5222c3dd0688	00040000-5616-388c-4560-27b38010be9e	0986	AK	Lutkovni Direndaj d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5616-388e-dc90-715f3dc964ff	00040000-5616-388c-4560-27b38010be9e	0985	AK	Tatjana Stanič, Lektoriranje, s.p.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5616-388e-d0b4-7d141d4b059d	00040000-5616-388c-1a1d-f49c0b8f0876	0984	AK	Gledališče Lepote tvoje		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5616-388e-0318-37d8bb2eb142	00040000-5616-388c-2f89-9127d607dfe6	0983	AK	Sunce naše		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5616-388e-2f1b-588d3baf4880	00040000-5616-388c-1532-a6f33d98e7f2	0982	AK	Theater Amadeus		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5616-388e-7899-e555a82c23c1	00040000-5616-388c-3647-d44bf64ba931	9999	AK	Fuchs		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5616-3890-5537-0b08fab41ea7	00040000-5616-388c-4560-27b38010be9e	1001	AK	Gledališče Matica		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
\.


--
-- TOC entry 2995 (class 0 OID 21495577)
-- Dependencies: 187
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-5616-388b-78a4-230ca8a12867	8341	Adlešiči
00050000-5616-388b-e8e7-b0ee340653a8	5270	Ajdovščina
00050000-5616-388b-11ce-f61c8dcc55cc	6280	Ankaran/Ancarano
00050000-5616-388b-13aa-5db8901d4299	9253	Apače
00050000-5616-388b-7cbd-a130a5b8eebc	8253	Artiče
00050000-5616-388b-bf35-eb39aab0da26	4275	Begunje na Gorenjskem
00050000-5616-388b-a162-0d9b90d6222d	1382	Begunje pri Cerknici
00050000-5616-388b-83ea-a3a84a376418	9231	Beltinci
00050000-5616-388b-87ed-56db51f8a8bb	2234	Benedikt
00050000-5616-388b-a53a-6411a36501f6	2345	Bistrica ob Dravi
00050000-5616-388b-dcb1-1e4f70d42d1e	3256	Bistrica ob Sotli
00050000-5616-388b-9c3a-40ca4a61de20	8259	Bizeljsko
00050000-5616-388b-fbd8-2ad75f75541f	1223	Blagovica
00050000-5616-388b-ca0c-e8cbea07d937	8283	Blanca
00050000-5616-388b-1205-a6867ee85808	4260	Bled
00050000-5616-388b-0b3b-3bde91afff4f	4273	Blejska Dobrava
00050000-5616-388b-a362-d5de5f91b12d	9265	Bodonci
00050000-5616-388b-1881-7864426c4735	9222	Bogojina
00050000-5616-388b-3180-8be8b3ff9278	4263	Bohinjska Bela
00050000-5616-388b-334d-933494515d9f	4264	Bohinjska Bistrica
00050000-5616-388b-3a02-de370be4ea1e	4265	Bohinjsko jezero
00050000-5616-388b-9deb-125fbc3388bc	1353	Borovnica
00050000-5616-388b-b7ed-64042c751bc8	8294	Boštanj
00050000-5616-388b-f213-38009d831639	5230	Bovec
00050000-5616-388b-e5e9-f896ed69ee51	5295	Branik
00050000-5616-388b-fddc-29c99c078813	3314	Braslovče
00050000-5616-388b-7490-c6955c7058b6	5223	Breginj
00050000-5616-388b-b8b2-3c6208faa8e5	8280	Brestanica
00050000-5616-388b-60b7-df98a8f68333	2354	Bresternica
00050000-5616-388b-a5c2-93989a460d5d	4243	Brezje
00050000-5616-388b-f83a-378d3e9fddc8	1351	Brezovica pri Ljubljani
00050000-5616-388b-698a-12da83842fb4	8250	Brežice
00050000-5616-388b-039a-17459a83a26a	4210	Brnik - Aerodrom
00050000-5616-388b-57d3-3b6862cab26c	8321	Brusnice
00050000-5616-388b-4651-24045c7f3cb0	3255	Buče
00050000-5616-388b-2efd-a7c4cb970506	8276	Bučka 
00050000-5616-388b-9070-8b39d40bf8d3	9261	Cankova
00050000-5616-388b-624a-a39eafec02af	3000	Celje 
00050000-5616-388b-84a9-08fd15e233b4	3001	Celje - poštni predali
00050000-5616-388b-cc3c-498165c27959	4207	Cerklje na Gorenjskem
00050000-5616-388b-e4e7-4d78f356b36a	8263	Cerklje ob Krki
00050000-5616-388b-ff98-efa553892dc7	1380	Cerknica
00050000-5616-388b-67bf-0d7757aa3255	5282	Cerkno
00050000-5616-388b-00e9-e28eca39afcd	2236	Cerkvenjak
00050000-5616-388b-e419-95beff0ddd02	2215	Ceršak
00050000-5616-388b-b103-fa15b829bd58	2326	Cirkovce
00050000-5616-388b-462c-ceeab2647261	2282	Cirkulane
00050000-5616-388b-dc00-4f70aff00e79	5273	Col
00050000-5616-388b-dff8-26a362917ee7	8251	Čatež ob Savi
00050000-5616-388b-76ca-98e320eac058	1413	Čemšenik
00050000-5616-388b-2817-84c2f953c938	5253	Čepovan
00050000-5616-388b-a053-39f23254f7f4	9232	Črenšovci
00050000-5616-388b-0bef-ce046168d83e	2393	Črna na Koroškem
00050000-5616-388b-71df-f6d912207578	6275	Črni Kal
00050000-5616-388b-7b5f-8175b192cd40	5274	Črni Vrh nad Idrijo
00050000-5616-388b-22d1-233f463add53	5262	Črniče
00050000-5616-388b-6b8a-472ca8041344	8340	Črnomelj
00050000-5616-388b-63c8-c4579a89c485	6271	Dekani
00050000-5616-388b-daad-40835e679ce1	5210	Deskle
00050000-5616-388b-44fc-a74478e1da82	2253	Destrnik
00050000-5616-388b-3731-5a70df276bd4	6215	Divača
00050000-5616-388b-6c25-1a9ddb32bfcc	1233	Dob
00050000-5616-388b-599b-494f416276c9	3224	Dobje pri Planini
00050000-5616-388b-f4a8-d74b5253c589	8257	Dobova
00050000-5616-388b-bbfb-e7350a1d1a21	1423	Dobovec
00050000-5616-388b-8011-0ac8d04e67ad	5263	Dobravlje
00050000-5616-388b-918c-957dbcd4fa17	3204	Dobrna
00050000-5616-388b-2f14-e22a2ee20b0c	8211	Dobrnič
00050000-5616-388b-f063-612f891d168f	1356	Dobrova
00050000-5616-388b-436e-22b20b72f422	9223	Dobrovnik/Dobronak 
00050000-5616-388b-401a-04daa2adbfbd	5212	Dobrovo v Brdih
00050000-5616-388b-5645-ddb19f16e36c	1431	Dol pri Hrastniku
00050000-5616-388b-81c1-11f6cdf94733	1262	Dol pri Ljubljani
00050000-5616-388b-1aea-3167651cc250	1273	Dole pri Litiji
00050000-5616-388b-b233-88834876be88	1331	Dolenja vas
00050000-5616-388b-0e71-b90ba2bd8174	8350	Dolenjske Toplice
00050000-5616-388b-2ab3-2046211c0b7e	1230	Domžale
00050000-5616-388b-4148-49f10e29089d	2252	Dornava
00050000-5616-388b-8866-b5c6845cd077	5294	Dornberk
00050000-5616-388b-9e8c-11b097992d6d	1319	Draga
00050000-5616-388b-f477-9cbc770aa079	8343	Dragatuš
00050000-5616-388b-8841-83af54f90c8f	3222	Dramlje
00050000-5616-388b-a04b-bcbcbd41bc54	2370	Dravograd
00050000-5616-388b-893e-a9bb58cf49cd	4203	Duplje
00050000-5616-388b-b265-964bb634fb72	6221	Dutovlje
00050000-5616-388b-f36c-7f4fe4e0957e	8361	Dvor
00050000-5616-388b-8255-34a047fc0f90	2343	Fala
00050000-5616-388b-6b7c-01a882dcefd4	9208	Fokovci
00050000-5616-388b-6c8a-2f58461233e7	2313	Fram
00050000-5616-388b-4537-3e1a157219b1	3213	Frankolovo
00050000-5616-388b-d7b9-f3063bd6eb94	1274	Gabrovka
00050000-5616-388b-8499-d15e755a2e7a	8254	Globoko
00050000-5616-388b-e313-e32add1f64d7	5275	Godovič
00050000-5616-388b-9109-70e0303365da	4204	Golnik
00050000-5616-388b-8b11-0f65c578aa5f	3303	Gomilsko
00050000-5616-388b-e62b-47d8d728a807	4224	Gorenja vas
00050000-5616-388b-ac5b-90f145ec53ab	3263	Gorica pri Slivnici
00050000-5616-388b-5b8f-5aa8eafd8b05	2272	Gorišnica
00050000-5616-388b-68b1-cc87745b29a8	9250	Gornja Radgona
00050000-5616-388b-3e54-17f55508a6d3	3342	Gornji Grad
00050000-5616-388b-6ff0-ad70d86089b5	4282	Gozd Martuljek
00050000-5616-388b-94a5-3619651764c6	6272	Gračišče
00050000-5616-388b-19a4-c4bc0f8ba412	9264	Grad
00050000-5616-388b-fbca-6d442b3d27df	8332	Gradac
00050000-5616-388b-81fb-33b79d3abb9e	1384	Grahovo
00050000-5616-388b-a47e-20d4c24c6e7f	5242	Grahovo ob Bači
00050000-5616-388b-6869-2abcbbd57075	5251	Grgar
00050000-5616-388b-4387-656b06ff65d8	3302	Griže
00050000-5616-388b-472b-2a94dd43250e	3231	Grobelno
00050000-5616-388b-963f-25653829ff6d	1290	Grosuplje
00050000-5616-388b-a1b0-2130bb1d8cdb	2288	Hajdina
00050000-5616-388b-6c13-a38c37cfdd3f	8362	Hinje
00050000-5616-388b-1bd2-5da60a48e35f	2311	Hoče
00050000-5616-388b-1121-453aa73d12ed	9205	Hodoš/Hodos
00050000-5616-388b-56dd-195a0e8f5234	1354	Horjul
00050000-5616-388b-a407-5e182a3b82cd	1372	Hotedršica
00050000-5616-388b-bbfc-0badc9cebe53	1430	Hrastnik
00050000-5616-388b-be57-000117ad6cbb	6225	Hruševje
00050000-5616-388b-a634-49ec1dc0a215	4276	Hrušica
00050000-5616-388b-6ed1-35a91f19a09d	5280	Idrija
00050000-5616-388b-f8a9-e7a927ef21e3	1292	Ig
00050000-5616-388b-b2c5-13bec6487dd8	6250	Ilirska Bistrica
00050000-5616-388b-63f1-f49f7818b400	6251	Ilirska Bistrica-Trnovo
00050000-5616-388b-988f-2508ba85e18c	1295	Ivančna Gorica
00050000-5616-388b-40b6-47ab7da1f24a	2259	Ivanjkovci
00050000-5616-388b-3cd4-53e90149374e	1411	Izlake
00050000-5616-388b-da9a-df49b91a34d0	6310	Izola/Isola
00050000-5616-388b-d863-e1a1901cc893	2222	Jakobski Dol
00050000-5616-388b-bb3d-0ace708f691e	2221	Jarenina
00050000-5616-388b-98a4-8943dfa84f05	6254	Jelšane
00050000-5616-388b-3f65-e1bf3cd16eb1	4270	Jesenice
00050000-5616-388b-00e9-cdaec919f312	8261	Jesenice na Dolenjskem
00050000-5616-388b-e935-510a58583da6	3273	Jurklošter
00050000-5616-388b-938a-dd301468f390	2223	Jurovski Dol
00050000-5616-388b-b2de-84392817722a	2256	Juršinci
00050000-5616-388b-a730-0efd1127e26c	5214	Kal nad Kanalom
00050000-5616-388b-2dbb-154b3016921c	3233	Kalobje
00050000-5616-388b-d0f8-317e1dfb8bb9	4246	Kamna Gorica
00050000-5616-388b-a0b8-d477158e85bd	2351	Kamnica
00050000-5616-388b-8f6c-e9e78041cdfb	1241	Kamnik
00050000-5616-388b-6684-602d3f554c87	5213	Kanal
00050000-5616-388b-f2e8-e308367947e4	8258	Kapele
00050000-5616-388b-d56e-3cb24e68dd21	2362	Kapla
00050000-5616-388b-b0d5-cf4f5b14007a	2325	Kidričevo
00050000-5616-388b-967d-2fe7f860be0a	1412	Kisovec
00050000-5616-388b-2306-42638dc95383	6253	Knežak
00050000-5616-388b-2458-9584e1b83d59	5222	Kobarid
00050000-5616-388b-d6df-f801135ac097	9227	Kobilje
00050000-5616-388b-381e-2fd6a7055cb5	1330	Kočevje
00050000-5616-388b-e5be-198c9424caf2	1338	Kočevska Reka
00050000-5616-388b-ef05-1c1bfc63e999	2276	Kog
00050000-5616-388b-ad5b-fcbc5cfbf286	5211	Kojsko
00050000-5616-388b-187b-46cb87822b6c	6223	Komen
00050000-5616-388b-3f61-d9b43be5b4e8	1218	Komenda
00050000-5616-388b-3a6e-e1abb120dad1	6000	Koper/Capodistria 
00050000-5616-388b-b756-ddcd1323b135	6001	Koper/Capodistria - poštni predali
00050000-5616-388b-2047-7cb67cefc8af	8282	Koprivnica
00050000-5616-388b-203b-a9de07bfaa18	5296	Kostanjevica na Krasu
00050000-5616-388b-0ff9-b6ed86843791	8311	Kostanjevica na Krki
00050000-5616-388b-98e6-6fe40b4d5cf5	1336	Kostel
00050000-5616-388b-2994-56c7c1db79cf	6256	Košana
00050000-5616-388b-ed7e-f46ad5e18657	2394	Kotlje
00050000-5616-388b-f21a-9f1a0b575f56	6240	Kozina
00050000-5616-388b-437e-f7131569b6a9	3260	Kozje
00050000-5616-388b-3db1-7d85bf7d7a07	4000	Kranj 
00050000-5616-388b-26c1-12d1c038f879	4001	Kranj - poštni predali
00050000-5616-388b-e35c-591c2876cc04	4280	Kranjska Gora
00050000-5616-388b-99d5-bceff74c27b7	1281	Kresnice
00050000-5616-388b-fcde-6d2cca2d7197	4294	Križe
00050000-5616-388b-7726-941a9cbb22cb	9206	Križevci
00050000-5616-388b-643d-f6654697a287	9242	Križevci pri Ljutomeru
00050000-5616-388b-e75e-8359faea3177	1301	Krka
00050000-5616-388b-8713-bdc0fbc05d7a	8296	Krmelj
00050000-5616-388b-97d9-012b16f2c258	4245	Kropa
00050000-5616-388b-4c59-b1c3011f1b15	8262	Krška vas
00050000-5616-388b-cb84-50f8c796333b	8270	Krško
00050000-5616-388b-0e6b-17bb39fa7371	9263	Kuzma
00050000-5616-388b-b24c-22e9e616065b	2318	Laporje
00050000-5616-388b-977f-29633e86389b	3270	Laško
00050000-5616-388b-6fc9-ecb445bb2e8f	1219	Laze v Tuhinju
00050000-5616-388b-9d21-a785fe82f443	2230	Lenart v Slovenskih goricah
00050000-5616-388b-8388-9b2ac31fb067	9220	Lendava/Lendva
00050000-5616-388b-f628-5dbde2cf07ac	4248	Lesce
00050000-5616-388b-22a3-3037b848fcd2	3261	Lesično
00050000-5616-388b-19c7-00adccdf9990	8273	Leskovec pri Krškem
00050000-5616-388b-af92-e1aea41f6bb8	2372	Libeliče
00050000-5616-388b-3817-f0fcaf651a2e	2341	Limbuš
00050000-5616-388b-e9c1-3588c14001c3	1270	Litija
00050000-5616-388b-12f7-e73410ee5e4e	3202	Ljubečna
00050000-5616-388b-c169-76fbdf93b3ae	1000	Ljubljana 
00050000-5616-388b-44c3-387b0955bef8	1001	Ljubljana - poštni predali
00050000-5616-388b-6967-f9f377fe678e	1231	Ljubljana - Črnuče
00050000-5616-388b-6ba9-cd82205fea0a	1261	Ljubljana - Dobrunje
00050000-5616-388b-27bf-2b4f2c263dd0	1260	Ljubljana - Polje
00050000-5616-388b-b021-339d28e5fdf9	1210	Ljubljana - Šentvid
00050000-5616-388b-c428-7b1e2111dc58	1211	Ljubljana - Šmartno
00050000-5616-388b-8258-a103e2b9cf3c	3333	Ljubno ob Savinji
00050000-5616-388b-2386-1d199941d294	9240	Ljutomer
00050000-5616-388b-b2f6-275d5e3a6e9f	3215	Loče
00050000-5616-388b-2c36-8757a561b081	5231	Log pod Mangartom
00050000-5616-388b-1246-f661a988c7f5	1358	Log pri Brezovici
00050000-5616-388b-894c-bbe5d3612053	1370	Logatec
00050000-5616-388b-1205-bd4433a46012	1371	Logatec
00050000-5616-388b-5249-bdd4fd1bda9d	1434	Loka pri Zidanem Mostu
00050000-5616-388b-b3c2-d929f0c85726	3223	Loka pri Žusmu
00050000-5616-388b-ddf9-4439c4b18aff	6219	Lokev
00050000-5616-388b-d414-3731fa62bd67	1318	Loški Potok
00050000-5616-388b-624b-9a281e2f316c	2324	Lovrenc na Dravskem polju
00050000-5616-388b-6ffc-c29748883153	2344	Lovrenc na Pohorju
00050000-5616-388b-93db-b14608f91b78	3334	Luče
00050000-5616-388b-0ce0-49173ed31acb	1225	Lukovica
00050000-5616-388b-0189-af01540c6479	9202	Mačkovci
00050000-5616-388b-6737-22c89f3c3c69	2322	Majšperk
00050000-5616-388b-6f60-a83082ba14c8	2321	Makole
00050000-5616-388b-f907-c4ca630e7732	9243	Mala Nedelja
00050000-5616-388b-36a2-2108ff1d3fc0	2229	Malečnik
00050000-5616-388b-0512-5e67fbb2bf4e	6273	Marezige
00050000-5616-388b-d051-18fc8ae72dea	2000	Maribor 
00050000-5616-388b-fe58-9891cc11e843	2001	Maribor - poštni predali
00050000-5616-388b-de2c-a62addfe9785	2206	Marjeta na Dravskem polju
00050000-5616-388b-0961-6d7b76572ac2	2281	Markovci
00050000-5616-388b-aa54-3bbfdf997a02	9221	Martjanci
00050000-5616-388b-e8ce-e846b6e49298	6242	Materija
00050000-5616-388b-b3b6-6d3d7d4bd38c	4211	Mavčiče
00050000-5616-388b-6c8a-7b764cc3b8e6	1215	Medvode
00050000-5616-388b-6b12-9a5d35d22459	1234	Mengeš
00050000-5616-388b-d071-ba66f6a8c20c	8330	Metlika
00050000-5616-388b-d5c2-50355aa32e62	2392	Mežica
00050000-5616-388b-d874-c19492a7f2c7	2204	Miklavž na Dravskem polju
00050000-5616-388b-9f80-28e8701b530c	2275	Miklavž pri Ormožu
00050000-5616-388b-7c82-2b1e19ec1137	5291	Miren
00050000-5616-388b-ecad-3738c0cc562c	8233	Mirna
00050000-5616-388b-4bde-9d28046ede3f	8216	Mirna Peč
00050000-5616-388b-70a0-a72eb8fd5642	2382	Mislinja
00050000-5616-388b-f8aa-071c05e9e291	4281	Mojstrana
00050000-5616-388b-183c-c5c907269592	8230	Mokronog
00050000-5616-388b-ee91-57f211ffbad6	1251	Moravče
00050000-5616-388b-c1a0-142c318fae86	9226	Moravske Toplice
00050000-5616-388b-7064-d8dd1a1c991b	5216	Most na Soči
00050000-5616-388b-8e83-9386da731c7c	1221	Motnik
00050000-5616-388b-2af9-dbc1eaddaa58	3330	Mozirje
00050000-5616-388b-6388-1789f158602c	9000	Murska Sobota 
00050000-5616-388b-cc13-3d4082561364	9001	Murska Sobota - poštni predali
00050000-5616-388b-1402-ab03bb96d9e2	2366	Muta
00050000-5616-388b-b1ac-359ff3c5fac2	4202	Naklo
00050000-5616-388b-6d48-77153991328f	3331	Nazarje
00050000-5616-388b-d621-76b2aabdcea3	1357	Notranje Gorice
00050000-5616-388b-7c5d-5ea748a29d52	3203	Nova Cerkev
00050000-5616-388b-321e-1dc88527dcfa	5000	Nova Gorica 
00050000-5616-388b-5319-e7d8d1d36e02	5001	Nova Gorica - poštni predali
00050000-5616-388b-1258-f7c5d3e842dd	1385	Nova vas
00050000-5616-388b-cc1f-64f24bc5f084	8000	Novo mesto
00050000-5616-388b-794a-7dbca42f9028	8001	Novo mesto - poštni predali
00050000-5616-388b-7ccc-6985d65fff52	6243	Obrov
00050000-5616-388b-7b1e-e886cbf69464	9233	Odranci
00050000-5616-388b-2027-a4611aeaf357	2317	Oplotnica
00050000-5616-388b-336c-7ea2a7b99c08	2312	Orehova vas
00050000-5616-388b-606a-5182f42d6f4a	2270	Ormož
00050000-5616-388b-e4a8-9b222604785a	1316	Ortnek
00050000-5616-388b-ebde-38c47b52c2ed	1337	Osilnica
00050000-5616-388b-8735-3e8f9f89facc	8222	Otočec
00050000-5616-388b-4952-45d49eb21122	2361	Ožbalt
00050000-5616-388b-8eed-24c9891041b0	2231	Pernica
00050000-5616-388b-3707-ddb09f00d492	2211	Pesnica pri Mariboru
00050000-5616-388b-d86c-e09044799415	9203	Petrovci
00050000-5616-388b-a359-98701ba7a6e0	3301	Petrovče
00050000-5616-388b-6840-a0308a8a2f9c	6330	Piran/Pirano
00050000-5616-388b-b5e7-68a8006db5dd	8255	Pišece
00050000-5616-388b-f52e-c10c14281610	6257	Pivka
00050000-5616-388b-fc81-f324d04d5d6f	6232	Planina
00050000-5616-388b-e3a0-6132eaec8c81	3225	Planina pri Sevnici
00050000-5616-388b-34ee-fcc2a839e6b1	6276	Pobegi
00050000-5616-388b-e589-e28ce7947ade	8312	Podbočje
00050000-5616-388b-726f-63e5354c24d1	5243	Podbrdo
00050000-5616-388b-4e0f-e4299a69a4e9	3254	Podčetrtek
00050000-5616-388b-7467-d0d39a78b825	2273	Podgorci
00050000-5616-388b-b66e-3c575198d550	6216	Podgorje
00050000-5616-388b-9cc6-0ee340b1285d	2381	Podgorje pri Slovenj Gradcu
00050000-5616-388b-a5fc-0d5b19af68ed	6244	Podgrad
00050000-5616-388b-e55b-4903981d0ea3	1414	Podkum
00050000-5616-388b-fef7-8a262911d13f	2286	Podlehnik
00050000-5616-388b-723f-a25f02161837	5272	Podnanos
00050000-5616-388b-adb8-62e12ff26e9c	4244	Podnart
00050000-5616-388b-e6ac-f5c642c5320b	3241	Podplat
00050000-5616-388b-2a28-5633c3176037	3257	Podsreda
00050000-5616-388b-eba1-d6248ce9fbcf	2363	Podvelka
00050000-5616-388b-e87f-e5f1790c7b7d	2208	Pohorje
00050000-5616-388b-d3ac-22386b833cf8	2257	Polenšak
00050000-5616-388b-75e2-bd89d00101b6	1355	Polhov Gradec
00050000-5616-388b-6073-c2e4e35642a7	4223	Poljane nad Škofjo Loko
00050000-5616-388b-8f41-504e79987cf3	2319	Poljčane
00050000-5616-388b-c4fe-ada0be00ac5a	1272	Polšnik
00050000-5616-388b-cf30-a276ab1f0ef8	3313	Polzela
00050000-5616-388b-df57-e2a2c31d6788	3232	Ponikva
00050000-5616-388b-ed0e-2bc2afd927ca	6320	Portorož/Portorose
00050000-5616-388b-b917-756aaadc3ae9	6230	Postojna
00050000-5616-388b-0a09-d69903041de2	2331	Pragersko
00050000-5616-388b-ecc7-0ed968d35846	3312	Prebold
00050000-5616-388b-bde4-4801e1a37ff8	4205	Preddvor
00050000-5616-388b-8f4c-bfddb0b4b797	6255	Prem
00050000-5616-388b-c3c1-e22761ccd785	1352	Preserje
00050000-5616-388b-f9ed-aa5b260ce4f1	6258	Prestranek
00050000-5616-388b-84ec-449ccb2a8377	2391	Prevalje
00050000-5616-388b-eadc-e1badd44281f	3262	Prevorje
00050000-5616-388b-0ad4-aac1bebf306f	1276	Primskovo 
00050000-5616-388b-b5b4-fd2ae5106aa4	3253	Pristava pri Mestinju
00050000-5616-388b-68a5-9558e65ef422	9207	Prosenjakovci/Partosfalva
00050000-5616-388b-7669-2662c3e90981	5297	Prvačina
00050000-5616-388b-97f2-2519eacbd820	2250	Ptuj
00050000-5616-388b-4fcb-5f6ae6e638e5	2323	Ptujska Gora
00050000-5616-388b-9038-a086a0beac54	9201	Puconci
00050000-5616-388b-e73a-13df642df0ac	2327	Rače
00050000-5616-388b-d512-a1bc937074a4	1433	Radeče
00050000-5616-388b-37d9-6fd816497679	9252	Radenci
00050000-5616-388b-4fe5-0d877fcc79a9	2360	Radlje ob Dravi
00050000-5616-388b-2b3e-9c86a9cf558f	1235	Radomlje
00050000-5616-388b-4f68-33ac1090f250	4240	Radovljica
00050000-5616-388b-0b04-1147c177fce8	8274	Raka
00050000-5616-388b-b7e0-06b66b708ff2	1381	Rakek
00050000-5616-388b-dd2c-f7fbf57f2319	4283	Rateče - Planica
00050000-5616-388b-239f-2d31f5b48efd	2390	Ravne na Koroškem
00050000-5616-388b-b245-e4a2f360a0f7	9246	Razkrižje
00050000-5616-388b-d761-1fd1367427a1	3332	Rečica ob Savinji
00050000-5616-388b-0af6-7bba26a92793	5292	Renče
00050000-5616-388b-0b56-94df51416684	1310	Ribnica
00050000-5616-388b-8c09-d31c71bf4010	2364	Ribnica na Pohorju
00050000-5616-388b-a739-ed4edaa91c67	3272	Rimske Toplice
00050000-5616-388b-d865-fb2647404c5a	1314	Rob
00050000-5616-388b-062a-3fbac1099caf	5215	Ročinj
00050000-5616-388b-65e2-de609a103903	3250	Rogaška Slatina
00050000-5616-388b-5bc2-8de7cddc183d	9262	Rogašovci
00050000-5616-388b-4558-9b6be6d3d32e	3252	Rogatec
00050000-5616-388b-ac7f-8026c67fee51	1373	Rovte
00050000-5616-388b-5dc0-03673a15769b	2342	Ruše
00050000-5616-388b-8585-ca263acc9637	1282	Sava
00050000-5616-388b-af59-4c45908b5c3f	6333	Sečovlje/Sicciole
00050000-5616-388b-d436-5a904e90cc2b	4227	Selca
00050000-5616-388b-f297-4cdf31c2d0ad	2352	Selnica ob Dravi
00050000-5616-388b-b4f0-a82328ad0bed	8333	Semič
00050000-5616-388b-1fad-14cb5621a394	8281	Senovo
00050000-5616-388b-a45f-e165b9c31ae8	6224	Senožeče
00050000-5616-388b-3eed-bac86e65387b	8290	Sevnica
00050000-5616-388b-f71a-ce3b28b9f8cf	6210	Sežana
00050000-5616-388b-cca6-941b5be27ebf	2214	Sladki Vrh
00050000-5616-388b-5c05-2706a3bd0223	5283	Slap ob Idrijci
00050000-5616-388b-3fa0-5cc0b36a687a	2380	Slovenj Gradec
00050000-5616-388b-b899-18ed63b0077d	2310	Slovenska Bistrica
00050000-5616-388b-c914-581b41b8855a	3210	Slovenske Konjice
00050000-5616-388b-ce34-5cf525d26b8f	1216	Smlednik
00050000-5616-388b-a987-8aa3a226bbaf	5232	Soča
00050000-5616-388b-a137-e39a4547950e	1317	Sodražica
00050000-5616-388b-3675-defa8e4f59d8	3335	Solčava
00050000-5616-388b-decb-dae2ecf6ba29	5250	Solkan
00050000-5616-388b-30a2-aca59339192c	4229	Sorica
00050000-5616-388b-4d98-cbeefe7ead07	4225	Sovodenj
00050000-5616-388b-2514-e25e598eefef	5281	Spodnja Idrija
00050000-5616-388b-9f72-9eb9cceeaffd	2241	Spodnji Duplek
00050000-5616-388b-5be7-41c84adbfc86	9245	Spodnji Ivanjci
00050000-5616-388b-7aa1-57272869d53a	2277	Središče ob Dravi
00050000-5616-388b-c77c-28bb72ebad75	4267	Srednja vas v Bohinju
00050000-5616-388b-9ac9-52ead273fd44	8256	Sromlje 
00050000-5616-388b-c6a7-3df9c6c832f4	5224	Srpenica
00050000-5616-388b-be03-6db245ae338a	1242	Stahovica
00050000-5616-388b-71a7-92e90a4216e2	1332	Stara Cerkev
00050000-5616-388b-7f87-9a4a2bc6e240	8342	Stari trg ob Kolpi
00050000-5616-388b-f2fb-eb0142e8d640	1386	Stari trg pri Ložu
00050000-5616-388b-eee4-510691271e50	2205	Starše
00050000-5616-388b-eaa4-0dd8b39796d8	2289	Stoperce
00050000-5616-388b-cb05-304a40fb6668	8322	Stopiče
00050000-5616-388b-a2b9-5f2f54a08c4d	3206	Stranice
00050000-5616-388b-7d64-88888e956d0c	8351	Straža
00050000-5616-388b-f13c-045746f1d6b0	1313	Struge
00050000-5616-388b-93c1-2179cec8584e	8293	Studenec
00050000-5616-388b-6a72-6c2c3dcb6941	8331	Suhor
00050000-5616-388b-3370-7f7dcf89f096	2233	Sv. Ana v Slovenskih goricah
00050000-5616-388b-abd4-495e8df2bdaa	2235	Sv. Trojica v Slovenskih goricah
00050000-5616-388b-1a1e-3c8ba16c9e57	2353	Sveti Duh na Ostrem Vrhu
00050000-5616-388b-62b8-e1c80dc8e59a	9244	Sveti Jurij ob Ščavnici
00050000-5616-388b-a4e3-e5467938b1fb	3264	Sveti Štefan
00050000-5616-388c-2e5f-9cdd3680dab7	2258	Sveti Tomaž
00050000-5616-388c-c9e8-56218201b581	9204	Šalovci
00050000-5616-388c-ec3c-97214b54f7e3	5261	Šempas
00050000-5616-388c-884a-0a9665fcbb39	5290	Šempeter pri Gorici
00050000-5616-388c-330a-3d3f54efa016	3311	Šempeter v Savinjski dolini
00050000-5616-388c-73b0-7370a8f9220b	4208	Šenčur
00050000-5616-388c-7c4e-22fa48632c79	2212	Šentilj v Slovenskih goricah
00050000-5616-388c-a09e-c57fd8de9b03	8297	Šentjanž
00050000-5616-388c-53b3-00d966834d2f	2373	Šentjanž pri Dravogradu
00050000-5616-388c-58b3-f0437816be42	8310	Šentjernej
00050000-5616-388c-0fdf-40bf49db9def	3230	Šentjur
00050000-5616-388c-8538-e35f83d1bde3	3271	Šentrupert
00050000-5616-388c-b51f-655f4e11d6a8	8232	Šentrupert
00050000-5616-388c-0b19-e366688ac130	1296	Šentvid pri Stični
00050000-5616-388c-4507-83bb2860e327	8275	Škocjan
00050000-5616-388c-7ce7-fe5cb3102e10	6281	Škofije
00050000-5616-388c-d5d6-548d9ee58348	4220	Škofja Loka
00050000-5616-388c-401b-a1bcd8258676	3211	Škofja vas
00050000-5616-388c-b84f-d6e3b39042e5	1291	Škofljica
00050000-5616-388c-0293-147d8eba1af0	6274	Šmarje
00050000-5616-388c-cccb-5e39641bea38	1293	Šmarje - Sap
00050000-5616-388c-f3d3-08014f152b38	3240	Šmarje pri Jelšah
00050000-5616-388c-e0b7-05cf42ae295d	8220	Šmarješke Toplice
00050000-5616-388c-961e-b320fcec2a93	2315	Šmartno na Pohorju
00050000-5616-388c-f126-3617a46c5a62	3341	Šmartno ob Dreti
00050000-5616-388c-8464-f920bde863e4	3327	Šmartno ob Paki
00050000-5616-388c-b563-4aeea40f82fe	1275	Šmartno pri Litiji
00050000-5616-388c-5fb9-2beeb27660c2	2383	Šmartno pri Slovenj Gradcu
00050000-5616-388c-8ea7-7e004687fe4f	3201	Šmartno v Rožni dolini
00050000-5616-388c-9040-a9d09a746db0	3325	Šoštanj
00050000-5616-388c-1ced-ba4b3dbb02d7	6222	Štanjel
00050000-5616-388c-feec-581d63e81b1b	3220	Štore
00050000-5616-388c-0ed9-88bf2065f1a6	3304	Tabor
00050000-5616-388c-53c1-69b91d4bcd28	3221	Teharje
00050000-5616-388c-ab52-e4a52e9d9765	9251	Tišina
00050000-5616-388c-69d8-09445746c73c	5220	Tolmin
00050000-5616-388c-5174-022d5426342d	3326	Topolšica
00050000-5616-388c-7c69-a50c8f41ef56	2371	Trbonje
00050000-5616-388c-9753-5f02979e46e7	1420	Trbovlje
00050000-5616-388c-2c40-a33ddc4938f8	8231	Trebelno 
00050000-5616-388c-3dab-3915cc852af0	8210	Trebnje
00050000-5616-388c-f278-331e56223e29	5252	Trnovo pri Gorici
00050000-5616-388c-50d4-3c73e1ea1cde	2254	Trnovska vas
00050000-5616-388c-8d55-6033cb7ba623	1222	Trojane
00050000-5616-388c-3677-7fabe965389d	1236	Trzin
00050000-5616-388c-233e-7771eca10def	4290	Tržič
00050000-5616-388c-d277-9c9daec3d6f9	8295	Tržišče
00050000-5616-388c-b35b-b5280bda0858	1311	Turjak
00050000-5616-388c-82f3-e5bcf8da8692	9224	Turnišče
00050000-5616-388c-9c48-e70029214a05	8323	Uršna sela
00050000-5616-388c-aac6-5ba9e6c9142e	1252	Vače
00050000-5616-388c-70d7-c6802e783232	3320	Velenje 
00050000-5616-388c-4590-9f1ec4be4d5b	3322	Velenje - poštni predali
00050000-5616-388c-5fc7-96f0b1693172	8212	Velika Loka
00050000-5616-388c-1861-8fb0eb3a23d8	2274	Velika Nedelja
00050000-5616-388c-300f-d49205885d2c	9225	Velika Polana
00050000-5616-388c-e41b-80e9fa1a1d33	1315	Velike Lašče
00050000-5616-388c-98f4-23fefe24389c	8213	Veliki Gaber
00050000-5616-388c-eaf7-f974abb91777	9241	Veržej
00050000-5616-388c-3052-4773b77bb163	1312	Videm - Dobrepolje
00050000-5616-388c-63bc-cae37ab7d98b	2284	Videm pri Ptuju
00050000-5616-388c-4502-92659aad9820	8344	Vinica
00050000-5616-388c-774c-e2aace2f290b	5271	Vipava
00050000-5616-388c-a417-e9beb1ace210	4212	Visoko
00050000-5616-388c-087c-40c67ed79a8f	1294	Višnja Gora
00050000-5616-388c-8386-ee0526bcde61	3205	Vitanje
00050000-5616-388c-0e42-d9834c26fd73	2255	Vitomarci
00050000-5616-388c-aabb-95d89ede4b76	1217	Vodice
00050000-5616-388c-6c92-b3e79ee4ae03	3212	Vojnik\t
00050000-5616-388c-b2e3-2c49faba44cb	5293	Volčja Draga
00050000-5616-388c-6fbd-fb90d328edba	2232	Voličina
00050000-5616-388c-bd3b-3335df442800	3305	Vransko
00050000-5616-388c-aa5a-3db5754b506f	6217	Vremski Britof
00050000-5616-388c-ed56-bc4d8edbc61b	1360	Vrhnika
00050000-5616-388c-b532-309e6390f534	2365	Vuhred
00050000-5616-388c-f192-e4f78a1c8b22	2367	Vuzenica
00050000-5616-388c-fce6-8fd04e442dcd	8292	Zabukovje 
00050000-5616-388c-40da-59f6a20a8887	1410	Zagorje ob Savi
00050000-5616-388c-34bd-ff5bac586818	1303	Zagradec
00050000-5616-388c-7911-753fc2143b5c	2283	Zavrč
00050000-5616-388c-0fff-8b1d3d0877c1	8272	Zdole 
00050000-5616-388c-0620-1fa95f00e24e	4201	Zgornja Besnica
00050000-5616-388c-b75d-cfe142153915	2242	Zgornja Korena
00050000-5616-388c-b204-7bfa87c89329	2201	Zgornja Kungota
00050000-5616-388c-80a2-7cb9fd06098c	2316	Zgornja Ložnica
00050000-5616-388c-891f-751b13a13dde	2314	Zgornja Polskava
00050000-5616-388c-f76f-3c4dab186a72	2213	Zgornja Velka
00050000-5616-388c-9653-690dc3faedc3	4247	Zgornje Gorje
00050000-5616-388c-7f00-eb3165742284	4206	Zgornje Jezersko
00050000-5616-388c-b96a-8fc21024b76b	2285	Zgornji Leskovec
00050000-5616-388c-6112-02a8dffa8b68	1432	Zidani Most
00050000-5616-388c-cde9-51361d0ba3be	3214	Zreče
00050000-5616-388c-a504-247c802d793c	4209	Žabnica
00050000-5616-388c-401b-199396e33273	3310	Žalec
00050000-5616-388c-0484-acb24f5a738f	4228	Železniki
00050000-5616-388c-4f06-2e025e18fb4a	2287	Žetale
00050000-5616-388c-84cf-4b1aead4673f	4226	Žiri
00050000-5616-388c-a739-0a2082780db7	4274	Žirovnica
00050000-5616-388c-f710-c4960366317f	8360	Žužemberk
\.


--
-- TOC entry 3040 (class 0 OID 21496172)
-- Dependencies: 232
-- Data for Name: postavkacdve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkacdve (id, skupina, podskupina, naziv, vrpremiere, vrponovitvepremier, vrponovitveprejsnjih, vrgostovanjazamejstvo, vrfestivali, vrgostovanjaint, vrostalo, programdela_id) FROM stdin;
\.


--
-- TOC entry 3013 (class 0 OID 21495782)
-- Dependencies: 205
-- Data for Name: postavkaracuna; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkaracuna (id, racun_id) FROM stdin;
\.


--
-- TOC entry 2994 (class 0 OID 21495562)
-- Dependencies: 186
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
00060000-5616-388e-2b41-dcba12fd3ef3	00080000-5616-388e-82c4-e2614577dc98	\N	00040000-5616-388c-4560-27b38010be9e	Narodni dom	\N	Koroška 15	\N	9231	Beltinci	\N	f	t
00060000-5616-388e-419c-8a30ff852969	00080000-5616-388e-82c4-e2614577dc98	\N	00040000-5616-388c-4560-27b38010be9e	Korotan	\N	Koroška 22	\N	9231	Beltinci	\N	f	f
00060000-5616-388e-09ba-51f6941ca415	00080000-5616-388e-2e7d-e42ba191eb6d	\N	00040000-5616-388c-4560-27b38010be9e	Rimljan	\N	Rimska ploščad 7	\N	9231	Beltinci	\N	f	t
\.


--
-- TOC entry 3002 (class 0 OID 21495666)
-- Dependencies: 194
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, zaporedna, objavljenzacetek, porocilo) FROM stdin;
\.


--
-- TOC entry 3015 (class 0 OID 21495794)
-- Dependencies: 207
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 3041 (class 0 OID 21496186)
-- Dependencies: 233
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, koproducent_id, odstotekfinanciranja, delez, maticnikop, kpe, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 3042 (class 0 OID 21496196)
-- Dependencies: 234
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, sifra, status) FROM stdin;
00190000-5616-388e-928a-e5741f4fd405	00080000-5616-388e-8347-e7df191da7ae	0987	AK
00190000-5616-388e-3c85-224e378220c3	00080000-5616-388e-2e7d-e42ba191eb6d	0989	AK
00190000-5616-388e-a31b-03a688023ed6	00080000-5616-388e-774c-5222c3dd0688	0986	AK
00190000-5616-388e-6b8f-cf829812ce81	00080000-5616-388e-d0b4-7d141d4b059d	0984	AK
00190000-5616-388e-f18d-fb2af8871ca7	00080000-5616-388e-0318-37d8bb2eb142	0983	AK
00190000-5616-388e-fdeb-cdd9ff1e4f9a	00080000-5616-388e-2f1b-588d3baf4880	0982	AK
00190000-5616-3890-f27d-0b5321ba2a96	00080000-5616-3890-5537-0b08fab41ea7	1001	AK
\.


--
-- TOC entry 3039 (class 0 OID 21496124)
-- Dependencies: 231
-- Data for Name: programdela; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programdela (id, sifra, naziv, zacetek, konec, zakljuceno, potrjenprogram, stpremier, stpremiervelikih, stpremiermalih, stpremiermalihkopr, stpremiervelikihkopr, stpremiersredkopr, stint, stfest, strazno, stizjem, stponprem, stponprej, stponprejvelikih, stponprejmalih, stponprejmalihkopr, stponprejsredkopr, stponprejvelikihkopr, stgostujo, vrps1, vrps1do, vrps1mat, vrps1gostovsz, stizvnekomerc, stizvprem, stizvpremdoma, stizvpremkopr, stizvponprem, stizvponpremdoma, stizvponpremzamejo, stizvponpremgost, stizvponpremkopr, stizvponpremint, stizvponpremkoprint, stizvponprej, stizvponprejdoma, stizvponprejzamejo, stizvponprejgost, stizvponprejkopr, stizvponprejint, stizvponprejkoprint, stizvgostuj, stizvostalihnek, stizvgostovanjslo, stizvgostovanjzam, stizvgostovanjint, stobisknekom, stobisknekommat, stobisknekomgostslo, stobisknekomgostzam, stobisknekomgostint, stobiskprem, stobiskpremdoma, stobiskpremkopr, stobiskponprem, stobiskponpremdoma, stobiskponpremkopr, stobiskponpremkoprint, stobiskponpremgost, stobiskponpremzamejo, stobiskponpremint, avgobiskprired, avgzaseddvoran, avgcenavstopnice, stprodvstopnic, stkoprodukcij, stkoprodukcijint, stkoprodukcijnvo, stzaposlenih, stzaposigralcev, avgstnastopovigr, sthonorarnihzun, sthonorarnihzunigr, sthonorarnihzunigrtujjz, sthonorarnihzunsamoz, sredstvaint, sredstvaavt, sredstvazaprosenoprem, sredstvazaprosenoponprem, sredstvazaprosenoponprej, sredstvazaprosenogostujo, sredstvazaprosenoint, sredstvazaprosenofest, sredstvazaprosenorazno, sredstvazaprosenoizjem, sredstvadrugijavniprem, sredstvadrugijavniponprem, sredstvadrugijavniponprej, sredstvadrugijavnigostujo, sredstvadrugijavniint, sredstvadrugijavnifest, sredstvadrugijavnirazno, sredstvadrugijavniizjem, sredstvadrugiviriprem, sredstvadrugiviriponprem, sredstvadrugiviriponprej, sredstvadrugivirigostujo, sredstvadrugiviriint, sredstvadrugivirifest, sredstvadrugivirirazno, sredstvadrugiviriizjem, sredstvaavtsamoz) FROM stdin;
00290000-5616-388e-a34e-230de3a671e0	0001	Testni program dela	2016-02-01	2017-02-01	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 3043 (class 0 OID 21496204)
-- Dependencies: 235
-- Data for Name: programskaenotasklopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programskaenotasklopa (id, naslovpe, avtorpe, obsegpe, mesecpe, vrednostpe, obiskdoma, programrazno_id) FROM stdin;
\.


--
-- TOC entry 3019 (class 0 OID 21495823)
-- Dependencies: 211
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, popa_id, naslov_id, sifra, naziv, jeprizorisce, jematicnioder, seplanira, kapaciteta, opis) FROM stdin;
00220000-5616-388e-2b72-75bb19d42bfe	\N	\N	0001	Poskusna 1	f	\N	t	8	Poskusna učilnica v prvem
00220000-5616-388e-92c2-a15675eb44e2	\N	\N	0002	Poskusna 3	f	\N	f	34	Poskusna učilnica v tretjem
00220000-5616-388e-477b-2f4458d79de9	\N	\N	0003	Kazinska	t	\N	t	84	Kazinska dvorana
00220000-5616-388e-029c-b3b0a9dd7a05	\N	\N	0004	Mali oder	t	\N	t	24	Mali oder 
00220000-5616-388e-b8bf-46a910f61f73	\N	\N	0005	Komorni oder	t	\N	t	150	Komorni oder
00220000-5616-388e-712d-85ab90ca3924	\N	\N	0006	Stara dvorana	t	\N	t	96	Stara dvorana ali dvorana Franceta Prešerna
00220000-5616-388e-492a-ef23dc85bc96	\N	\N	0007	Velika dvorana	t	\N	t	160	Velika, glavna dvorana
\.


--
-- TOC entry 3011 (class 0 OID 21495767)
-- Dependencies: 203
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 3010 (class 0 OID 21495757)
-- Dependencies: 202
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 3032 (class 0 OID 21495967)
-- Dependencies: 224
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta, status) FROM stdin;
\.


--
-- TOC entry 3026 (class 0 OID 21495897)
-- Dependencies: 218
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 3000 (class 0 OID 21495640)
-- Dependencies: 192
-- Data for Name: report; Type: TABLE DATA; Schema: public; Owner: -
--

COPY report (id, job_id, title, filename, transfers, size, format, hash, createdat) FROM stdin;
\.


--
-- TOC entry 2983 (class 0 OID 21495435)
-- Dependencies: 175
-- Data for Name: revizije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY revizije (id, razred, objectid, upor, datum, tip, data) FROM stdin;
1	App\\Entity\\Popa	00080000-5616-3890-5537-0b08fab41ea7	00010000-5616-388c-79d7-1d59a63cc75c	2015-10-08 11:34:08	INS	a:0:{}
2	App\\Entity\\Option	00000000-5616-3890-0c48-8b07150dd663	00010000-5616-388c-79d7-1d59a63cc75c	2015-10-08 11:34:08	INS	a:0:{}
3	ProgramDela\\Entity\\ProdukcijskaHisa	00190000-5616-3890-f27d-0b5321ba2a96	00010000-5616-388c-79d7-1d59a63cc75c	2015-10-08 11:34:08	INS	a:0:{}
\.


--
-- TOC entry 3062 (class 0 OID 0)
-- Dependencies: 174
-- Name: revizije_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('revizije_id_seq', 3, true);


--
-- TOC entry 3020 (class 0 OID 21495836)
-- Dependencies: 212
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 2987 (class 0 OID 21495473)
-- Dependencies: 179
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-5616-388c-ff9a-8f245b50cf35	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-5616-388c-395d-461a84b93597	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-5616-388c-bdd3-8b49d29be1fa	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-5616-388c-4485-5c1258c2a34c	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-5616-388c-a336-07960cf141c4	planer	Planer dogodkov v koledarju	t
00020000-5616-388c-506c-a8fd1f38af6c	kadrovska	Kadrovska služba	t
00020000-5616-388c-ca4a-2985ca9efc9c	arhivar	Ažuriranje arhivalij	t
00020000-5616-388c-20e9-8f6b0dc7b4eb	igralec	Igralec	t
00020000-5616-388c-1eb2-adb6aed06258	prisotnost	Vnašalec prisotnosti, tudi za tiste izven uprizoritev	t
00020000-5616-388e-31b3-a02d2c8fc684	vsadovoljenja	Vloga z vsemi posameznimi dovoljenji	t
\.


--
-- TOC entry 2985 (class 0 OID 21495457)
-- Dependencies: 177
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-5616-388c-07de-c96fc80ffe29	00020000-5616-388c-bdd3-8b49d29be1fa
00010000-5616-388c-79d7-1d59a63cc75c	00020000-5616-388c-bdd3-8b49d29be1fa
00010000-5616-388e-25a1-ad0f4ea7fb20	00020000-5616-388e-31b3-a02d2c8fc684
\.


--
-- TOC entry 3022 (class 0 OID 21495850)
-- Dependencies: 214
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 3014 (class 0 OID 21495788)
-- Dependencies: 206
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 3008 (class 0 OID 21495734)
-- Dependencies: 200
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, sifra, ime, zacetek, konec, aktivna) FROM stdin;
\.


--
-- TOC entry 2981 (class 0 OID 21495422)
-- Dependencies: 173
-- Data for Name: stevilcenje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenje (id, sifra, naziv, prefix, suffix, zacetek, dolzina, format, globalno, poletih) FROM stdin;
00230000-5616-388c-193e-73ee45cc6c00	pri	Privzeto številčenje po letih YYYY-N	\N	\N	1	1	%l-%n	f	t
00230000-5616-388c-440d-6b18f61064c6	123	Privzeto številčenje kratkih šifer	\N	\N	100	3	%n	f	f
00230000-5616-388c-b7f0-eb52b7c451bf	bcd	Globalno številčenje črtnih kod	\N	\N	1	9	%n	t	f
00230000-5616-388c-570c-324398360c73	sif	Številčenje šifrant	\N	\N	1000	4	%n	f	f
00230000-5616-388c-a4b2-38ed1710ddec	tmp	Globalno številčenje začasnih številk	tmp	\N	1000	5	%l%n	t	t
\.


--
-- TOC entry 2980 (class 0 OID 21495414)
-- Dependencies: 172
-- Data for Name: stevilcenjekonfig; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjekonfig (id, stevilcenje_id, dok) FROM stdin;
00240000-5616-388c-9767-c8b0ed1d2d19	00230000-5616-388c-570c-324398360c73	popa
00240000-5616-388c-0a7c-846e5a0f3c45	00230000-5616-388c-570c-324398360c73	oseba
00240000-5616-388c-cd95-812fad9b468b	00230000-5616-388c-570c-324398360c73	sezona
00240000-5616-388c-62f9-e58ebcdc4709	00230000-5616-388c-440d-6b18f61064c6	prostor
00240000-5616-388c-b373-14e999999c71	00230000-5616-388c-570c-324398360c73	besedilo
00240000-5616-388c-91aa-e753c2763604	00230000-5616-388c-570c-324398360c73	uprizoritev
00240000-5616-388c-0ca1-dff2c431b0d9	00230000-5616-388c-570c-324398360c73	funkcija
00240000-5616-388c-6177-cf87e7bbd140	00230000-5616-388c-570c-324398360c73	tipfunkcije
00240000-5616-388c-0318-a397b63112b1	00230000-5616-388c-570c-324398360c73	alternacija
00240000-5616-388c-5499-e5c4f0225e95	00230000-5616-388c-193e-73ee45cc6c00	pogodba
00240000-5616-388c-00e2-ac5571ef95bd	00230000-5616-388c-570c-324398360c73	zaposlitev
00240000-5616-388c-48d6-e80efd522a9d	00230000-5616-388c-570c-324398360c73	zvrstuprizoritve
00240000-5616-388c-c349-a63e03b38299	00230000-5616-388c-193e-73ee45cc6c00	programdela
00240000-5616-388c-f95b-e506b1998a89	00230000-5616-388c-570c-324398360c73	zapis
\.


--
-- TOC entry 2979 (class 0 OID 21495409)
-- Dependencies: 171
-- Data for Name: stevilcenjestanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjestanje (id, objid, leto, stevilka) FROM stdin;
a0cce452-ae9d-42e6-a5ba-ae6b05ef3994	00240000-5616-388c-9767-c8b0ed1d2d19	0	1001
\.


--
-- TOC entry 3028 (class 0 OID 21495914)
-- Dependencies: 220
-- Data for Name: strosekuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY strosekuprizoritve (id, uprizoritev_id, popa_id, naziv, vrednostdo, vrednostna, opis, tipstroska, sort, vrstastroska_id) FROM stdin;
00270000-5616-388e-91bc-2c218e0e59d0	000e0000-5616-388e-6388-4829a11ebea8	00080000-5616-388e-82c4-e2614577dc98	Nabava kostumov	600.50	20.00	Krila in maske	materialni	1	003b0000-5616-388c-ad4b-b6cf8c2ec16f
00270000-5616-388e-a070-c40daa343fe4	000e0000-5616-388e-6388-4829a11ebea8	00080000-5616-388e-82c4-e2614577dc98	Zavese	125.70	3.10	Modra in zelena zavesa	materialni	2	003b0000-5616-388c-ad4b-b6cf8c2ec16f
\.


--
-- TOC entry 2992 (class 0 OID 21495535)
-- Dependencies: 184
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 3009 (class 0 OID 21495744)
-- Dependencies: 201
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja) FROM stdin;
001a0000-5616-388e-02a4-65141387d6a4	00180000-5616-388e-c7a0-401a4c1694fe	000c0000-5616-388e-fb64-65cec5b4d104	00090000-5616-388e-b258-298f76e49879	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-5616-388e-47a2-f99b4c22a5b8	00180000-5616-388e-c7a0-401a4c1694fe	000c0000-5616-388e-f901-389c7c163681	00090000-5616-388e-3ed3-6dd98c572244	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-5616-388e-c9af-11cc9fa6a3be	00180000-5616-388e-c7a0-401a4c1694fe	000c0000-5616-388e-83b0-36f5caf5919a	00090000-5616-388e-99ff-c2e7fa8e86de	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-5616-388e-24f9-a3e9086b3040	00180000-5616-388e-c7a0-401a4c1694fe	000c0000-5616-388e-defa-120081669857	00090000-5616-388e-2904-4cd5dfea2734	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-5616-388e-0171-e98d2fe8761c	00180000-5616-388e-c7a0-401a4c1694fe	000c0000-5616-388e-5500-6e41d3904e0f	00090000-5616-388e-4bea-dd624f77ee20	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-5616-388e-0fde-f91c57786d19	00180000-5616-388e-e28e-f23ce0b2dd4d	\N	00090000-5616-388e-4bea-dd624f77ee20	2015-08-01 20:00:00	2015-08-01 23:00:00	\N	\N	2.00
\.


--
-- TOC entry 3031 (class 0 OID 21495955)
-- Dependencies: 223
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, sifra, ime, opis, imezenski, podrocje, sort) FROM stdin;
000f0000-5616-388c-d133-56e3173a9543	01	Avtor	Avtorji	Avtorka	umetnik	150
000f0000-5616-388c-ec83-e1d436530ea7	02	Priredba	Priredba	Priredba	umetnik	160
000f0000-5616-388c-12fc-ec20fa5c9e5a	03	Prevod	Prevod	Prevod	umetnik	20
000f0000-5616-388c-215d-bb4024ac63dd	04	Režija	Režija	Režija	umetnik	30
000f0000-5616-388c-f41e-6ebe8f2a800f	05	Dramaturgija	Dramaturgija	Dramaturgija	umetnik	40
000f0000-5616-388c-55e8-b8ff0f096fa4	06	Scenografija	Scenografija	Scenografija	umetnik	60
000f0000-5616-388c-131f-80f87388fd77	07	Kostumografija	Kostumografija	Kostumografija	umetnik	70
000f0000-5616-388c-851a-0196562b8ee7	08	Koreografija	Koreografija	Koreografija	umetnik	90
000f0000-5616-388c-87b6-d0a3f621c5d9	09	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	umetnik	100
000f0000-5616-388c-e771-40287600d7e1	10	Oblikovanje maske	Oblikovanje maske	Oblikovanje maske	umetnik	110
000f0000-5616-388c-926e-f3f703e3cb91	11	Lektorstvo	Lektorstvo	Lektorstvo	umetnik	50
000f0000-5616-388c-5257-d546294240b1	12	Glasbeni soustvarjalec	Glasbeni soustvarjalci	Glasbena soustvarjalka	umetnik	80
000f0000-5616-388c-1a28-2b81ae8bd74e	13	Intermedijski ustvarjalec	Intermedijski ustvarjalci	Intermedijski ustvarjalka	umetnik	130
000f0000-5616-388c-1175-93ceaa4cbb49	14	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	umetnik	120
000f0000-5616-388c-efa4-b1ccfd1ccd5d	15	Vloga	Intermedijski ustvarjalci	Intermedijska ustvarjalka	igralec	10
000f0000-5616-388c-4593-5e93d4a59d7f	16	Produkcija, mentorstvo	Produkcija, mentorstvo	Produkcija, mentorstvo	umetnik	140
000f0000-5616-388c-d57b-db578eef01e8	17	Tehnična podpora	Tehnična podpora	Tehnična podpora	tehnik	180
000f0000-5616-388c-962d-36753883e6a1	18	Inšpicient	Inšpicienti	Inšpicientka	inspicient	170
\.


--
-- TOC entry 3044 (class 0 OID 21496215)
-- Dependencies: 236
-- Data for Name: tipprogramskeenote; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipprogramskeenote (id, sifra, naziv, koprodukcija, maxfaktor, maxvsi) FROM stdin;
002b0000-5616-388c-c243-b06face340a9	01	Velika predstava	f	1.00	1.00
002b0000-5616-388c-84bc-3a45f7e5e0d4	02	Mala predstava	f	0.50	0.50
002b0000-5616-388c-8ebf-a39ae5464081	03	Mala koprodukcija	t	0.40	1.00
002b0000-5616-388c-da07-50257bf97a8e	04	Srednja koprodukcija	t	0.70	2.00
002b0000-5616-388c-ed2b-e1f5ab3fc532	05	Velika koprodukcija	t	1.00	3.00
\.


--
-- TOC entry 2997 (class 0 OID 21495597)
-- Dependencies: 189
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 2984 (class 0 OID 21495444)
-- Dependencies: 176
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-5616-388c-79d7-1d59a63cc75c	Konzolni	$2y$05$NS4xMjkyMTcwMzExMjAxROof/0VJRAtCMXFgYApgFamNYWpKb28rC	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-5616-388e-551d-0937e4a324f0	testni uporabnik za inšpicienta	$2y$05$NS4xMjkyMTcwMzExMjAxROxkJ1B6xAXex6EZLIwJfWzRJ8DpfecFO	t	\N	\N	\N	ivo@ifigenija.si	\N	\N	\N
00010000-5616-388e-bf71-fa149135b7e5	testni uporabnik za Tehničnega vodjo	$2y$05$NS4xMjkyMTcwMzExMjAxROu/kXWR9sP9oamkesKuxXLbxkCb387.G	t	\N	\N	\N	tona@ifigenija.si	\N	\N	\N
00010000-5616-388e-7cbf-74f315f99bb0	testni uporabnik za igralca	$2y$05$NS4xMjkyMTcwMzExMjAxRO/hLCgClfERRsfCAFYwxNCcFIVjP2982	t	\N	\N	\N	irena@ifigenija.si	\N	\N	\N
00010000-5616-388e-000d-683dd2aedc66	testni uporabnik vnašalca termina storitev (TerminStoritve-vse)	$2y$05$NS4xMjkyMTcwMzExMjAxROT6.kTHqEq4.wa2SOnf124/N14m9qeP.	t	\N	\N	\N	tatjana@ifigenija.si	\N	\N	\N
00010000-5616-388e-118d-700236981b07	testni uporabnik, ki je inšpicient brez zapisov v TerminStoritve	$2y$05$NS4xMjkyMTcwMzExMjAxROHau47Dtb7CME5.nlWwBVM.nusFP.ra2	t	\N	\N	\N	joze@ifigenija.si	\N	\N	\N
00010000-5616-388e-f63b-565470c1376e	testna uporabnica, ki je planerka	$2y$05$NS4xMjkyMTcwMzExMjAxRO.B/uJO3C7QRNhdX9Q2hTLQsSupj1V1S	t	\N	\N	\N	petra@ifigenija.si	\N	\N	\N
00010000-5616-388e-0358-e3a27c5c778c	testni uporabnik, ki dobi ifi-all vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROv2d7jqhaV/Mz3EIsKoi7UoFR.SDSMBm	t	\N	\N	\N	ali@ifigenija.si	\N	\N	\N
00010000-5616-388e-c78f-ef4ede42227c	testni uporabnik, ki dobi ifi-readall vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROYB9g.gnkufr1l/gWK6mkx.ySqrOWnJC	t	\N	\N	\N	berta@ifigenija.si	\N	\N	\N
00010000-5616-388e-e1c2-3d81386056ca	testni uporabnik, ki dobi aaa-write dovoljenje	$2y$05$NS4xMjkyMTcwMzExMjAxRORujYObKX.DzpXVYbePkiJkHqg0/Ylya	t	\N	\N	\N	aaron@ifigenija.si	\N	\N	\N
00010000-5616-388e-25a1-ad0f4ea7fb20	testni uporabnik ki dobi vsa posamezna dovoljenja	$2y$05$NS4xMjkyMTcwMzExMjAxRO2ymwxVXTr7U4Ncdn.bN49E8rLw9Jg0O	t	\N	\N	\N	vesna@ifigenija.si	\N	\N	\N
00010000-5616-388c-07de-c96fc80ffe29	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 3035 (class 0 OID 21496005)
-- Dependencies: 227
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, producent_id, sifra, faza, naslov, podnaslov, delovninaslov, internacionalninaslov, naslovizvirnika, podnaslovizvirnika, datumzacstudija, stevilovaj, planiranostevilovaj, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, krstna, prvaslovenska, kratkinaslov, jekoprodukcija, maticnioder_id) FROM stdin;
000e0000-5616-388e-b333-7025d9ecd324	00160000-5616-388e-44e6-de08f15b14e2	\N	00140000-5616-388c-a3b5-01df89c2f0cd	\N	0001	produkcija	Sen kresne noči		Sanje	\N	\N	\N	2016-02-01	\N	\N	2016-06-01	1	William  Shakespeare - Nebojša  Kavader	f	2				\N	f	\N	\N		\N	00220000-5616-388e-b8bf-46a910f61f73
000e0000-5616-388e-6388-4829a11ebea8	00160000-5616-388e-129e-47102e2f89f6	\N	00140000-5616-388c-6289-b0ac9aa48cb1	\N	0002	predprodukcija-ideja	Smoletov vrt			\N	\N	\N	2016-01-01	\N	\N	2016-04-20	2	Berta   Hočevar	f	2				\N	f	\N	\N		\N	00220000-5616-388e-712d-85ab90ca3924
000e0000-5616-388e-c06f-9760fdba69e0	\N	\N	00140000-5616-388c-6289-b0ac9aa48cb1	00190000-5616-388e-928a-e5741f4fd405	0003	postprodukcija	Kisli maček			\N	\N	\N	2016-02-01	\N	\N	2016-04-20	2	\N	t	2				\N	f	\N	\N		\N	00220000-5616-388e-b8bf-46a910f61f73
000e0000-5616-388e-7550-85b8d7d0e96d	\N	\N	00140000-5616-388c-6289-b0ac9aa48cb1	00190000-5616-388e-928a-e5741f4fd405	0004	postprodukcija	Vladimir			\N	\N	\N	2017-03-01	\N	\N	2017-04-20	2	\N	t	2				\N	f	\N	\N		\N	00220000-5616-388e-b8bf-46a910f61f73
000e0000-5616-388e-8b69-264dd2a73007	\N	\N	00140000-5616-388c-6289-b0ac9aa48cb1	00190000-5616-388e-928a-e5741f4fd405	0005	postprodukcija	Španska princesa			\N	\N	\N	2017-04-01	\N	\N	2017-05-20	1	\N	f	1				\N	f	\N	\N		\N	00220000-5616-388e-2b72-75bb19d42bfe
000e0000-5616-388e-a524-bdb4e956582c	\N	\N	00140000-5616-388c-6289-b0ac9aa48cb1	00190000-5616-388e-928a-e5741f4fd405	0006	postprodukcija	Ne vemo datumov			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-5616-388e-2b72-75bb19d42bfe
\.


--
-- TOC entry 3004 (class 0 OID 21495688)
-- Dependencies: 196
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, uprizoritev_id, vrsta, zaporedna, porocilo) FROM stdin;
00200000-5616-388e-5ac4-82f5490bf09e	000e0000-5616-388e-6388-4829a11ebea8	\N	1	
00200000-5616-388e-d68a-accdf4e9dab2	000e0000-5616-388e-6388-4829a11ebea8	\N	2	
00200000-5616-388e-6bce-40496ba8257f	000e0000-5616-388e-6388-4829a11ebea8	\N	3	
00200000-5616-388e-9f0d-7cc9d110f18c	000e0000-5616-388e-6388-4829a11ebea8	\N	4	
00200000-5616-388e-cdfd-61cea4b09bdc	000e0000-5616-388e-6388-4829a11ebea8	\N	5	
\.


--
-- TOC entry 3018 (class 0 OID 21495815)
-- Dependencies: 210
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 3029 (class 0 OID 21495928)
-- Dependencies: 221
-- Data for Name: vrstastroska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstastroska (id, skupina, podskupina, naziv, opis) FROM stdin;
003b0000-5616-388c-0c5d-989faf91d22e	1	0	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE
003b0000-5616-388c-1b56-f1345de7422b	1	1	Storitve varovanja zgradb in prostorov	storitve varovanja zgradb in prostorov (npr. gasilci na predstavah)
003b0000-5616-388c-34f0-ee0e86df3004	1	2	Založniške in tiskarske storitve	založniške in tiskarske storitve
003b0000-5616-388c-e0b4-3d112427c280	1	3	Časopisi, revije, knjige in strokovna literatura	časopisi, revije, knjige in strokovna literatura
003b0000-5616-388c-dc93-8878f8ea43cc	1	4	Stroški prevajalskih storitev	stroški prevajalskih storitev
003b0000-5616-388c-7ea8-513a7245d76b	1	5	Stroški oglaševalskih storitev	stroški oglaševalskih storitev
003b0000-5616-388c-dfbb-a4c96091da60	1	6	Izdatki za reprezentanco	izdatki za reprezentanco
003b0000-5616-388c-2bb3-5c07ec92f297	2	0	POSEBNI MATERIAL IN STORITVE	POSEBNI MATERIAL IN STORITVE
003b0000-5616-388c-ad4b-b6cf8c2ec16f	2	1	Drugi posebni material in storitve	drugi posebni material in storitve (npr. za instrumete - navedite)
003b0000-5616-388c-68f9-ef7555c0384e	2	2	Oprema predstave – stroški rekvizitov	Oprema predstave – stroški rekvizitov
003b0000-5616-388c-4e25-bd3f0fa5a3c9	2	3	Oprema predstave – stroški kostumov	Oprema predstave – stroški kostumov
003b0000-5616-388c-3b1b-2df5ac6c560e	2	4	Oprema predstave – stroški scenske opreme	Oprema predstave – stroški scenske opreme
003b0000-5616-388c-f7ef-6dfb3273bb15	2	5	Oprema predstave – stroški avdio in video opreme	Oprema predstave – stroški avdio in video opreme
003b0000-5616-388c-8fa1-7c88bf84563c	3	0	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE
003b0000-5616-388c-099f-9f78e09f92bd	3	1	Poštnina in kurirske storitve	poštnina in kurirske storitve
003b0000-5616-388c-5bfc-ac9efac729da	4	0	PREVOZNI STROŠKI IN STORITVE	PREVOZNI STROŠKI IN STORITVE
003b0000-5616-388c-f78f-9be8de7ea3e8	4	1	Goriva in maziva za prevozna sredstva	goriva in maziva za prevozna sredstva
003b0000-5616-388c-c79d-78cc4962b30d	4	2	Najem vozil in selitveni stroški	najem vozil in selitveni stroški
003b0000-5616-388c-4696-3508a6a48660	4	3	Drugi prevozni in transportni stroški 	drugi prevozni in transportni stroški (navedite)
003b0000-5616-388c-43e2-74f6d59fea18	5	0	IZDATKI ZA SLUŽBENA POTOVANJA	IZDATKI ZA SLUŽBENA POTOVANJA
003b0000-5616-388c-c52d-03026d51177c	5	1	Dnevnice za službena potovanja v državi in tujini	dnevnice za službena potovanja v državi in tujini
003b0000-5616-388c-5bd2-2ca954954626	5	2	Hotelske in restavra. storitve v državi in tujini	hotelske in restavra. storitve v državi in tujini
003b0000-5616-388c-e3f5-0a79ef71bd5d	5	3	Stroški prevoza v državi in tujini	stroški prevoza v državi in tujini
003b0000-5616-388c-b9b6-e7266c3cff12	5	4	Drugi izdatki za službena potovanja	drugi izdatki za službena potovanja (navedite)
003b0000-5616-388c-8302-e77069798a4a	6	0	NAJEMNINE IN ZAKUPNINE	NAJEMNINE IN ZAKUPNINE
003b0000-5616-388c-e93a-4cbf186e0613	6	1	Druge najemnine, zakupnine in licenčnine	druge najemnine, zakupnine in licenčnine (npr. najem notnega materiala, instrumentov - navedite)
003b0000-5616-388c-9221-331b1834508f	7	0	DRUGI OPERATIVNI ODHODKI	DRUGI OPERATIVNI ODHODKI
003b0000-5616-388c-1df0-590d684bdd6c	7	1	Izdatki za strok. izobraževanje zap.	izdatki za strok. izobraževanje zap.(vezani na program. enote)  
\.


--
-- TOC entry 3047 (class 0 OID 21496262)
-- Dependencies: 239
-- Data for Name: vrstazapisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstazapisa (id, oznaka, naziv, aktiven, znacka, ikona, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3046 (class 0 OID 21496234)
-- Dependencies: 238
-- Data for Name: zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapis (id, vrsta_id, datoteka_id, mapa_id, avtor_id, zaklenil_id, tip, zaklenjen, datumzaklepanja, identifier, subject, title, description, coverage, creator, language, date, publisher, relation, rights, source, upor, datknj, standard, lokacija) FROM stdin;
\.


--
-- TOC entry 3048 (class 0 OID 21496274)
-- Dependencies: 240
-- Data for Name: zapislastnik; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapislastnik (id, zapis_id, lastnik, classlastnika, datum, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3025 (class 0 OID 21495887)
-- Dependencies: 217
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, sifra, status, delovnomesto, zacetek, konec, tip, delovnaobveza, malica, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci) FROM stdin;
00100000-5616-388e-c153-dc630f6a5872	00090000-5616-388e-3ed3-6dd98c572244	0010	A	Mojster	2010-02-01	\N	1	2		t	f	f	t
00100000-5616-388e-b296-d7dec0c0d24e	00090000-5616-388e-99ff-c2e7fa8e86de	0003	A	Igralec	2010-02-01	\N	1	2		t	f	f	t
00100000-5616-388e-c219-dd4689d7b919	00090000-5616-388e-3af0-50ca3ee0c02e	0008	A	Natakar	2010-02-01	\N	1	2		t	f	f	t
00100000-5616-388e-4a34-7936b29aa138	00090000-5616-388e-d0aa-0e1d3a26e386	0004	A	Mizar	2010-02-01	\N	1	2		t	f	f	t
00100000-5616-388e-9e06-e11d818c20f0	00090000-5616-388e-b258-298f76e49879	0009	A	Šivilja	2010-02-01	\N	1	2		t	f	f	t
00100000-5616-388e-f052-b5441e7136f6	00090000-5616-388e-e9cd-e1663cc7090d	0007	A	Inšpicient	2010-02-01	\N	1	2		t	f	f	t
\.


--
-- TOC entry 3006 (class 0 OID 21495723)
-- Dependencies: 198
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id, oseba_id) FROM stdin;
\.


--
-- TOC entry 3034 (class 0 OID 21495995)
-- Dependencies: 226
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, sifra, naziv, opis) FROM stdin;
00140000-5616-388c-a3b5-01df89c2f0cd	01	Drama	drama (SURS 01)
00140000-5616-388c-8383-c59ff32a362f	02	Opera	opera (SURS 02)
00140000-5616-388c-815b-76800dae49b7	03	Balet	balet (SURS 03)
00140000-5616-388c-e4a4-9e1c999f89a5	04	Plesne prireditve	plesne prireditve (SURS 04)
00140000-5616-388c-24ed-665a0d80c7ff	05	Lutkovno gledališče	lutkovno gledališče (SURS 05)
00140000-5616-388c-6289-b0ac9aa48cb1	06	Raziskovalno gledališče	raziskovalno gledališče (SURS 06)
00140000-5616-388c-787d-69fd4c84ad01	07	Drugo	drugo (SURS 07)
\.


--
-- TOC entry 3024 (class 0 OID 21495877)
-- Dependencies: 216
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, sifra, naziv, opis) FROM stdin;
\.


--
-- TOC entry 2511 (class 2606 OID 21495498)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2703 (class 2606 OID 21496054)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2699 (class 2606 OID 21496044)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2662 (class 2606 OID 21495911)
-- Name: avtorbesedila_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT avtorbesedila_pkey PRIMARY KEY (id);


--
-- TOC entry 2673 (class 2606 OID 21495953)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2760 (class 2606 OID 21496314)
-- Name: datoteka_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT datoteka_pkey PRIMARY KEY (id);


--
-- TOC entry 2574 (class 2606 OID 21495712)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2589 (class 2606 OID 21495733)
-- Name: dogodeksplosni_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodeksplosni
    ADD CONSTRAINT dogodeksplosni_pkey PRIMARY KEY (id);


--
-- TOC entry 2736 (class 2606 OID 21496232)
-- Name: drugivir_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT drugivir_pkey PRIMARY KEY (id);


--
-- TOC entry 2545 (class 2606 OID 21495623)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2710 (class 2606 OID 21496118)
-- Name: enotaprograma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT enotaprograma_pkey PRIMARY KEY (id);


--
-- TOC entry 2647 (class 2606 OID 21495873)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2568 (class 2606 OID 21495686)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2562 (class 2606 OID 21495661)
-- Name: job_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY job
    ADD CONSTRAINT job_pkey PRIMARY KEY (id);


--
-- TOC entry 2553 (class 2606 OID 21495637)
-- Name: kontaktnaoseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT kontaktnaoseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2611 (class 2606 OID 21495780)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2754 (class 2606 OID 21496291)
-- Name: mapa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT mapa_pkey PRIMARY KEY (id);


--
-- TOC entry 2758 (class 2606 OID 21496298)
-- Name: mapa_zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT mapa_zapis_pkey PRIMARY KEY (mapa_id, zapis_id);


--
-- TOC entry 2765 (class 2606 OID 21496322)
-- Name: mapaacl_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT mapaacl_pkey PRIMARY KEY (id);


--
-- TOC entry 2483 (class 2606 OID 21093462)
-- Name: migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY migrations
    ADD CONSTRAINT migrations_pkey PRIMARY KEY (version);


--
-- TOC entry 2623 (class 2606 OID 21495807)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2538 (class 2606 OID 21495595)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2515 (class 2606 OID 21495507)
-- Name: optionvalue_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT optionvalue_pkey PRIMARY KEY (id);


--
-- TOC entry 2518 (class 2606 OID 21495531)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2509 (class 2606 OID 21495487)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2502 (class 2606 OID 21495472)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2626 (class 2606 OID 21495813)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2640 (class 2606 OID 21495849)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2685 (class 2606 OID 21495990)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2527 (class 2606 OID 21495559)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2535 (class 2606 OID 21495583)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2720 (class 2606 OID 21496184)
-- Name: postavkacdve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkacdve
    ADD CONSTRAINT postavkacdve_pkey PRIMARY KEY (id);


--
-- TOC entry 2615 (class 2606 OID 21495786)
-- Name: postavkaracuna_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT postavkaracuna_pkey PRIMARY KEY (id);


--
-- TOC entry 2533 (class 2606 OID 21495573)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2566 (class 2606 OID 21495674)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2621 (class 2606 OID 21495798)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2724 (class 2606 OID 21496193)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2726 (class 2606 OID 21496201)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2717 (class 2606 OID 21496171)
-- Name: programdela_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT programdela_pkey PRIMARY KEY (id);


--
-- TOC entry 2731 (class 2606 OID 21496213)
-- Name: programskaenotasklopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT programskaenotasklopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2633 (class 2606 OID 21495831)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2609 (class 2606 OID 21495771)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2603 (class 2606 OID 21495762)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2680 (class 2606 OID 21495977)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2660 (class 2606 OID 21495904)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2556 (class 2606 OID 21495649)
-- Name: report_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY report
    ADD CONSTRAINT report_pkey PRIMARY KEY (id);


--
-- TOC entry 2494 (class 2606 OID 21495443)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2638 (class 2606 OID 21495840)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2500 (class 2606 OID 21495461)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2504 (class 2606 OID 21495481)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2645 (class 2606 OID 21495858)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2617 (class 2606 OID 21495793)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2591 (class 2606 OID 21495742)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2491 (class 2606 OID 21495431)
-- Name: stevilcenje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenje
    ADD CONSTRAINT stevilcenje_pkey PRIMARY KEY (id);


--
-- TOC entry 2488 (class 2606 OID 21495419)
-- Name: stevilcenjekonfig_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT stevilcenjekonfig_pkey PRIMARY KEY (id);


--
-- TOC entry 2485 (class 2606 OID 21495413)
-- Name: stevilcenjestanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjestanje
    ADD CONSTRAINT stevilcenjestanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2669 (class 2606 OID 21495924)
-- Name: strosekuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT strosekuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2524 (class 2606 OID 21495540)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2597 (class 2606 OID 21495753)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2676 (class 2606 OID 21495964)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2733 (class 2606 OID 21496225)
-- Name: tipprogramskeenote_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipprogramskeenote
    ADD CONSTRAINT tipprogramskeenote_pkey PRIMARY KEY (id);


--
-- TOC entry 2543 (class 2606 OID 21495608)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2496 (class 2606 OID 21495456)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2697 (class 2606 OID 21496023)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2572 (class 2606 OID 21495696)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2629 (class 2606 OID 21495821)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2671 (class 2606 OID 21495936)
-- Name: vrstastroska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstastroska
    ADD CONSTRAINT vrstastroska_pkey PRIMARY KEY (id);


--
-- TOC entry 2747 (class 2606 OID 21496272)
-- Name: vrstazapisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstazapisa
    ADD CONSTRAINT vrstazapisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2744 (class 2606 OID 21496256)
-- Name: zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT zapis_pkey PRIMARY KEY (id);


--
-- TOC entry 2750 (class 2606 OID 21496280)
-- Name: zapislastnik_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT zapislastnik_pkey PRIMARY KEY (id);


--
-- TOC entry 2656 (class 2606 OID 21495895)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2587 (class 2606 OID 21495727)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2689 (class 2606 OID 21496003)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2653 (class 2606 OID 21495885)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2575 (class 1259 OID 21495721)
-- Name: dogodki_konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_konec ON dogodek USING btree (konec);


--
-- TOC entry 2576 (class 1259 OID 21495722)
-- Name: dogodki_razred; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_razred ON dogodek USING btree (razred);


--
-- TOC entry 2577 (class 1259 OID 21495720)
-- Name: dogodki_zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2578 (class 1259 OID 21495719)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2579 (class 1259 OID 21495718)
-- Name: idx_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2665 (class 1259 OID 21495925)
-- Name: idx_11ffe6e05c75296c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e05c75296c ON strosekuprizoritve USING btree (vrstastroska_id);


--
-- TOC entry 2666 (class 1259 OID 21495926)
-- Name: idx_11ffe6e062b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e062b4ffca ON strosekuprizoritve USING btree (uprizoritev_id);


--
-- TOC entry 2667 (class 1259 OID 21495927)
-- Name: idx_11ffe6e06beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e06beede51 ON strosekuprizoritve USING btree (popa_id);


--
-- TOC entry 2751 (class 1259 OID 21496293)
-- Name: idx_14a5d6d3727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d3727aca70 ON mapa USING btree (parent_id);


--
-- TOC entry 2752 (class 1259 OID 21496292)
-- Name: idx_14a5d6d38a4a6c12; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d38a4a6c12 ON mapa USING btree (lastnik_id);


--
-- TOC entry 2525 (class 1259 OID 21495561)
-- Name: idx_1c7adba5ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba5ee4b985a ON popa USING btree (drzava_id);


--
-- TOC entry 2624 (class 1259 OID 21495814)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2738 (class 1259 OID 21496260)
-- Name: idx_1ed92829253c4123; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829253c4123 ON zapis USING btree (avtor_id);


--
-- TOC entry 2739 (class 1259 OID 21496259)
-- Name: idx_1ed9282957ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282957ed422f ON zapis USING btree (mapa_id);


--
-- TOC entry 2740 (class 1259 OID 21496261)
-- Name: idx_1ed9282987ff3295; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282987ff3295 ON zapis USING btree (zaklenil_id);


--
-- TOC entry 2741 (class 1259 OID 21496258)
-- Name: idx_1ed92829a54dbb1f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829a54dbb1f ON zapis USING btree (datoteka_id);


--
-- TOC entry 2742 (class 1259 OID 21496257)
-- Name: idx_1ed92829ef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829ef943358 ON zapis USING btree (vrsta_id);


--
-- TOC entry 2618 (class 1259 OID 21495800)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2619 (class 1259 OID 21495799)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2570 (class 1259 OID 21495697)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2648 (class 1259 OID 21495874)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2649 (class 1259 OID 21495876)
-- Name: idx_23aeb9586b361365; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9586b361365 ON funkcija USING btree (tipfunkcije_id);


--
-- TOC entry 2650 (class 1259 OID 21495875)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2550 (class 1259 OID 21495639)
-- Name: idx_2942b10710389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b10710389148 ON kontaktnaoseba USING btree (oseba_id);


--
-- TOC entry 2551 (class 1259 OID 21495638)
-- Name: idx_2942b1076beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b1076beede51 ON kontaktnaoseba USING btree (popa_id);


--
-- TOC entry 2729 (class 1259 OID 21496214)
-- Name: idx_2d901816d6bc69d6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2d901816d6bc69d6 ON programskaenotasklopa USING btree (programrazno_id);


--
-- TOC entry 2681 (class 1259 OID 21495992)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2682 (class 1259 OID 21495993)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2683 (class 1259 OID 21495994)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2748 (class 1259 OID 21496281)
-- Name: idx_2eaff9dcaf91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2eaff9dcaf91ecd ON zapislastnik USING btree (zapis_id);


--
-- TOC entry 2690 (class 1259 OID 21496028)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2691 (class 1259 OID 21496025)
-- Name: idx_344a77a7c3b0d59; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a7c3b0d59 ON uprizoritev USING btree (maticnioder_id);


--
-- TOC entry 2692 (class 1259 OID 21496029)
-- Name: idx_344a77a853a965c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a853a965c ON uprizoritev USING btree (producent_id);


--
-- TOC entry 2693 (class 1259 OID 21496027)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2694 (class 1259 OID 21496026)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2540 (class 1259 OID 21495610)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2541 (class 1259 OID 21495609)
-- Name: idx_37f6541a6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a6beede51 ON trr USING btree (popa_id);


--
-- TOC entry 2516 (class 1259 OID 21495534)
-- Name: idx_466966d769e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_466966d769e8d4 ON oseba USING btree (naslov_id);


--
-- TOC entry 2636 (class 1259 OID 21495841)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2506 (class 1259 OID 21495488)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2507 (class 1259 OID 21495489)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2641 (class 1259 OID 21495861)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2642 (class 1259 OID 21495860)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2643 (class 1259 OID 21495859)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2563 (class 1259 OID 21495675)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2564 (class 1259 OID 21495676)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2486 (class 1259 OID 21495421)
-- Name: idx_6054e804ff55f926; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_6054e804ff55f926 ON stevilcenjekonfig USING btree (stevilcenje_id);


--
-- TOC entry 2598 (class 1259 OID 21495766)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2599 (class 1259 OID 21495764)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2600 (class 1259 OID 21495763)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2601 (class 1259 OID 21495765)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2497 (class 1259 OID 21495462)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2498 (class 1259 OID 21495463)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2627 (class 1259 OID 21495822)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2761 (class 1259 OID 21496315)
-- Name: idx_781826c67e3c61f9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_781826c67e3c61f9 ON datoteka USING btree (owner_id);


--
-- TOC entry 2663 (class 1259 OID 21495913)
-- Name: idx_7ab77b7910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7ab77b7910389148 ON avtorbesedila USING btree (oseba_id);


--
-- TOC entry 2664 (class 1259 OID 21495912)
-- Name: idx_7ab77b79f35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7ab77b79f35157b1 ON avtorbesedila USING btree (besedilo_id);


--
-- TOC entry 2762 (class 1259 OID 21496323)
-- Name: idx_7adc957157ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc957157ed422f ON mapaacl USING btree (mapa_id);


--
-- TOC entry 2763 (class 1259 OID 21496324)
-- Name: idx_7adc9571fa6311ef; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc9571fa6311ef ON mapaacl USING btree (perm_id);


--
-- TOC entry 2613 (class 1259 OID 21495787)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2657 (class 1259 OID 21495905)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2658 (class 1259 OID 21495906)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2711 (class 1259 OID 21496123)
-- Name: idx_8787a0e54ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e54ae1cd1c ON enotaprograma USING btree (gostitelj_id);


--
-- TOC entry 2712 (class 1259 OID 21496122)
-- Name: idx_8787a0e55d0da56c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e55d0da56c ON enotaprograma USING btree (drzavagostovanja_id);


--
-- TOC entry 2713 (class 1259 OID 21496119)
-- Name: idx_8787a0e562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e562b4ffca ON enotaprograma USING btree (uprizoritev_id);


--
-- TOC entry 2714 (class 1259 OID 21496120)
-- Name: idx_8787a0e57222d84b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e57222d84b ON enotaprograma USING btree (tipprogramskeenote_id);


--
-- TOC entry 2715 (class 1259 OID 21496121)
-- Name: idx_8787a0e5771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e5771ec7bd ON enotaprograma USING btree (program_dela_id);


--
-- TOC entry 2529 (class 1259 OID 21495575)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2530 (class 1259 OID 21495574)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2531 (class 1259 OID 21495576)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2630 (class 1259 OID 21495835)
-- Name: idx_952dd21969e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd21969e8d4 ON prostor USING btree (naslov_id);


--
-- TOC entry 2631 (class 1259 OID 21495834)
-- Name: idx_952dd2196beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd2196beede51 ON prostor USING btree (popa_id);


--
-- TOC entry 2721 (class 1259 OID 21496194)
-- Name: idx_97af082e38c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e38c06eb ON produkcijadelitev USING btree (enotaprograma_id);


--
-- TOC entry 2722 (class 1259 OID 21496195)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2704 (class 1259 OID 21496058)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2705 (class 1259 OID 21496059)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2706 (class 1259 OID 21496056)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2707 (class 1259 OID 21496057)
-- Name: idx_a4b7244fa4976613; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fa4976613 ON alternacija USING btree (zaposlitev_id);


--
-- TOC entry 2654 (class 1259 OID 21495896)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2604 (class 1259 OID 21495775)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2605 (class 1259 OID 21495774)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2606 (class 1259 OID 21495772)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2607 (class 1259 OID 21495773)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2700 (class 1259 OID 21496046)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2701 (class 1259 OID 21496045)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2554 (class 1259 OID 21495650)
-- Name: idx_c38372b2be04ea9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c38372b2be04ea9 ON report USING btree (job_id);


--
-- TOC entry 2557 (class 1259 OID 21495664)
-- Name: idx_c395a6181bb9e62c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a6181bb9e62c ON job USING btree (datum);


--
-- TOC entry 2558 (class 1259 OID 21495663)
-- Name: idx_c395a618941027cc; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618941027cc ON job USING btree (casizvedbe);


--
-- TOC entry 2559 (class 1259 OID 21495662)
-- Name: idx_c395a618a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618a76ed395 ON job USING btree (user_id);


--
-- TOC entry 2560 (class 1259 OID 21495665)
-- Name: idx_c395a618aecf5af0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618aecf5af0 ON job USING btree (izveden);


--
-- TOC entry 2569 (class 1259 OID 21495687)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2718 (class 1259 OID 21496185)
-- Name: idx_dba42fe79e3adf2c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_dba42fe79e3adf2c ON postavkacdve USING btree (programdela_id);


--
-- TOC entry 2737 (class 1259 OID 21496233)
-- Name: idx_e7d4cf2638c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e7d4cf2638c06eb ON drugivir USING btree (enotaprograma_id);


--
-- TOC entry 2755 (class 1259 OID 21496299)
-- Name: idx_e9f8ee8257ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee8257ed422f ON mapa_zapis USING btree (mapa_id);


--
-- TOC entry 2756 (class 1259 OID 21496300)
-- Name: idx_e9f8ee82af91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee82af91ecd ON mapa_zapis USING btree (zapis_id);


--
-- TOC entry 2512 (class 1259 OID 21495509)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2513 (class 1259 OID 21495508)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2521 (class 1259 OID 21495541)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2522 (class 1259 OID 21495542)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2585 (class 1259 OID 21495728)
-- Name: idx_f44a386d10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_f44a386d10389148 ON zasedenost USING btree (oseba_id);


--
-- TOC entry 2593 (class 1259 OID 21495756)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2594 (class 1259 OID 21495755)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2595 (class 1259 OID 21495754)
-- Name: idx_fef7d84ba81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84ba81ccef6 ON terminstoritve USING btree (dogodek_id);


--
-- TOC entry 2580 (class 1259 OID 21495714)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2581 (class 1259 OID 21495715)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2582 (class 1259 OID 21495713)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2583 (class 1259 OID 21495717)
-- Name: uniq_11e93b5dbbc7a989; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dbbc7a989 ON dogodek USING btree (dogodek_splosni_id);


--
-- TOC entry 2584 (class 1259 OID 21495716)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2528 (class 1259 OID 21495560)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2546 (class 1259 OID 21495624)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2547 (class 1259 OID 21495626)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2548 (class 1259 OID 21495625)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2549 (class 1259 OID 21495627)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2612 (class 1259 OID 21495781)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2686 (class 1259 OID 21495991)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2695 (class 1259 OID 21496024)
-- Name: uniq_344a77a559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_344a77a559828a3 ON uprizoritev USING btree (sifra);


--
-- TOC entry 2677 (class 1259 OID 21495965)
-- Name: uniq_3f50510d559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d559828a3 ON tipfunkcije USING btree (sifra);


--
-- TOC entry 2678 (class 1259 OID 21495966)
-- Name: uniq_3f50510d55cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d55cca980 ON tipfunkcije USING btree (ime);


--
-- TOC entry 2519 (class 1259 OID 21495532)
-- Name: uniq_466966d7559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7559828a3 ON oseba USING btree (sifra);


--
-- TOC entry 2520 (class 1259 OID 21495533)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2651 (class 1259 OID 21495886)
-- Name: uniq_5216fcb0559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5216fcb0559828a3 ON zvrstuprizoritve USING btree (sifra);


--
-- TOC entry 2492 (class 1259 OID 21495432)
-- Name: uniq_5a434fbc559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5a434fbc559828a3 ON stevilcenje USING btree (sifra);


--
-- TOC entry 2539 (class 1259 OID 21495596)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2489 (class 1259 OID 21495420)
-- Name: uniq_6054e804889a7556; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_6054e804889a7556 ON stevilcenjekonfig USING btree (dok);


--
-- TOC entry 2734 (class 1259 OID 21496226)
-- Name: uniq_7d834df4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_7d834df4559828a3 ON tipprogramskeenote USING btree (sifra);


--
-- TOC entry 2634 (class 1259 OID 21495833)
-- Name: uniq_952dd21937854736; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21937854736 ON prostor USING btree (naziv);


--
-- TOC entry 2635 (class 1259 OID 21495832)
-- Name: uniq_952dd219559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd219559828a3 ON prostor USING btree (sifra);


--
-- TOC entry 2708 (class 1259 OID 21496055)
-- Name: uniq_a4b7244f559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a4b7244f559828a3 ON alternacija USING btree (sifra);


--
-- TOC entry 2536 (class 1259 OID 21495584)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2687 (class 1259 OID 21496004)
-- Name: uniq_cede8e36559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_cede8e36559828a3 ON zvrstsurs USING btree (sifra);


--
-- TOC entry 2745 (class 1259 OID 21496273)
-- Name: uniq_de1c8aa1d55226c7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_de1c8aa1d55226c7 ON vrstazapisa USING btree (oznaka);


--
-- TOC entry 2727 (class 1259 OID 21496202)
-- Name: uniq_e6fc2028559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc2028559828a3 ON produkcijskahisa USING btree (sifra);


--
-- TOC entry 2728 (class 1259 OID 21496203)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2674 (class 1259 OID 21495954)
-- Name: uniq_ec773670ca2e5fcb; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ec773670ca2e5fcb ON besedilo USING btree (stevilka);


--
-- TOC entry 2592 (class 1259 OID 21495743)
-- Name: uniq_ecc8f8c5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ecc8f8c5559828a3 ON sezona USING btree (sifra);


--
-- TOC entry 2505 (class 1259 OID 21495482)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2796 (class 2606 OID 21496455)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2795 (class 2606 OID 21496460)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2791 (class 2606 OID 21496480)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2797 (class 2606 OID 21496450)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2793 (class 2606 OID 21496470)
-- Name: fk_11e93b5dbbc7a989; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dbbc7a989 FOREIGN KEY (dogodek_splosni_id) REFERENCES dogodeksplosni(id);


--
-- TOC entry 2792 (class 2606 OID 21496475)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2794 (class 2606 OID 21496465)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2832 (class 2606 OID 21496645)
-- Name: fk_11ffe6e05c75296c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e05c75296c FOREIGN KEY (vrstastroska_id) REFERENCES vrstastroska(id);


--
-- TOC entry 2831 (class 2606 OID 21496650)
-- Name: fk_11ffe6e062b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e062b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2830 (class 2606 OID 21496655)
-- Name: fk_11ffe6e06beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e06beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2864 (class 2606 OID 21496820)
-- Name: fk_14a5d6d3727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d3727aca70 FOREIGN KEY (parent_id) REFERENCES mapa(id);


--
-- TOC entry 2865 (class 2606 OID 21496815)
-- Name: fk_14a5d6d38a4a6c12; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d38a4a6c12 FOREIGN KEY (lastnik_id) REFERENCES uporabniki(id);


--
-- TOC entry 2777 (class 2606 OID 21496380)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2814 (class 2606 OID 21496565)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2859 (class 2606 OID 21496800)
-- Name: fk_1ed92829253c4123; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829253c4123 FOREIGN KEY (avtor_id) REFERENCES uporabniki(id);


--
-- TOC entry 2860 (class 2606 OID 21496795)
-- Name: fk_1ed9282957ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282957ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2858 (class 2606 OID 21496805)
-- Name: fk_1ed9282987ff3295; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282987ff3295 FOREIGN KEY (zaklenil_id) REFERENCES uporabniki(id);


--
-- TOC entry 2861 (class 2606 OID 21496790)
-- Name: fk_1ed92829a54dbb1f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829a54dbb1f FOREIGN KEY (datoteka_id) REFERENCES datoteka(id);


--
-- TOC entry 2862 (class 2606 OID 21496785)
-- Name: fk_1ed92829ef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829ef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstazapisa(id);


--
-- TOC entry 2812 (class 2606 OID 21496560)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2813 (class 2606 OID 21496555)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2790 (class 2606 OID 21496445)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2824 (class 2606 OID 21496605)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2822 (class 2606 OID 21496615)
-- Name: fk_23aeb9586b361365; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9586b361365 FOREIGN KEY (tipfunkcije_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2823 (class 2606 OID 21496610)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2783 (class 2606 OID 21496415)
-- Name: fk_2942b10710389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b10710389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2784 (class 2606 OID 21496410)
-- Name: fk_2942b1076beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b1076beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2810 (class 2606 OID 21496545)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2856 (class 2606 OID 21496775)
-- Name: fk_2d901816d6bc69d6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT fk_2d901816d6bc69d6 FOREIGN KEY (programrazno_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2835 (class 2606 OID 21496660)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2834 (class 2606 OID 21496665)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2833 (class 2606 OID 21496670)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 2863 (class 2606 OID 21496810)
-- Name: fk_2eaff9dcaf91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT fk_2eaff9dcaf91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id);


--
-- TOC entry 2837 (class 2606 OID 21496690)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2840 (class 2606 OID 21496675)
-- Name: fk_344a77a7c3b0d59; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a7c3b0d59 FOREIGN KEY (maticnioder_id) REFERENCES prostor(id);


--
-- TOC entry 2836 (class 2606 OID 21496695)
-- Name: fk_344a77a853a965c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a853a965c FOREIGN KEY (producent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2838 (class 2606 OID 21496685)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2839 (class 2606 OID 21496680)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2781 (class 2606 OID 21496405)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2782 (class 2606 OID 21496400)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2773 (class 2606 OID 21496365)
-- Name: fk_466966d769e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d769e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2774 (class 2606 OID 21496360)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2818 (class 2606 OID 21496585)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2770 (class 2606 OID 21496340)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2769 (class 2606 OID 21496345)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2819 (class 2606 OID 21496600)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2820 (class 2606 OID 21496595)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2821 (class 2606 OID 21496590)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2788 (class 2606 OID 21496430)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2787 (class 2606 OID 21496435)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2766 (class 2606 OID 21496325)
-- Name: fk_6054e804ff55f926; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT fk_6054e804ff55f926 FOREIGN KEY (stevilcenje_id) REFERENCES stevilcenje(id);


--
-- TOC entry 2802 (class 2606 OID 21496520)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2804 (class 2606 OID 21496510)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2805 (class 2606 OID 21496505)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2803 (class 2606 OID 21496515)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2768 (class 2606 OID 21496330)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2767 (class 2606 OID 21496335)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2815 (class 2606 OID 21496570)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2868 (class 2606 OID 21496835)
-- Name: fk_781826c67e3c61f9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT fk_781826c67e3c61f9 FOREIGN KEY (owner_id) REFERENCES uporabniki(id);


--
-- TOC entry 2828 (class 2606 OID 21496640)
-- Name: fk_7ab77b7910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT fk_7ab77b7910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2829 (class 2606 OID 21496635)
-- Name: fk_7ab77b79f35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT fk_7ab77b79f35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2870 (class 2606 OID 21496840)
-- Name: fk_7adc957157ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc957157ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2869 (class 2606 OID 21496845)
-- Name: fk_7adc9571fa6311ef; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc9571fa6311ef FOREIGN KEY (perm_id) REFERENCES permission(id);


--
-- TOC entry 2811 (class 2606 OID 21496550)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2827 (class 2606 OID 21496625)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2826 (class 2606 OID 21496630)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2847 (class 2606 OID 21496750)
-- Name: fk_8787a0e54ae1cd1c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e54ae1cd1c FOREIGN KEY (gostitelj_id) REFERENCES popa(id);


--
-- TOC entry 2848 (class 2606 OID 21496745)
-- Name: fk_8787a0e55d0da56c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e55d0da56c FOREIGN KEY (drzavagostovanja_id) REFERENCES drza(id);


--
-- TOC entry 2851 (class 2606 OID 21496730)
-- Name: fk_8787a0e562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2850 (class 2606 OID 21496735)
-- Name: fk_8787a0e57222d84b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e57222d84b FOREIGN KEY (tipprogramskeenote_id) REFERENCES tipprogramskeenote(id);


--
-- TOC entry 2849 (class 2606 OID 21496740)
-- Name: fk_8787a0e5771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e5771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2779 (class 2606 OID 21496390)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2780 (class 2606 OID 21496385)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2778 (class 2606 OID 21496395)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2816 (class 2606 OID 21496580)
-- Name: fk_952dd21969e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd21969e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2817 (class 2606 OID 21496575)
-- Name: fk_952dd2196beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd2196beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2854 (class 2606 OID 21496760)
-- Name: fk_97af082e38c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e38c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2853 (class 2606 OID 21496765)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2844 (class 2606 OID 21496720)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2843 (class 2606 OID 21496725)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2846 (class 2606 OID 21496710)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 2845 (class 2606 OID 21496715)
-- Name: fk_a4b7244fa4976613; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fa4976613 FOREIGN KEY (zaposlitev_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2825 (class 2606 OID 21496620)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2806 (class 2606 OID 21496540)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2807 (class 2606 OID 21496535)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2809 (class 2606 OID 21496525)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2808 (class 2606 OID 21496530)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2841 (class 2606 OID 21496705)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2842 (class 2606 OID 21496700)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2785 (class 2606 OID 21496420)
-- Name: fk_c38372b2be04ea9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY report
    ADD CONSTRAINT fk_c38372b2be04ea9 FOREIGN KEY (job_id) REFERENCES job(id);


--
-- TOC entry 2786 (class 2606 OID 21496425)
-- Name: fk_c395a618a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY job
    ADD CONSTRAINT fk_c395a618a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2789 (class 2606 OID 21496440)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2852 (class 2606 OID 21496755)
-- Name: fk_dba42fe79e3adf2c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkacdve
    ADD CONSTRAINT fk_dba42fe79e3adf2c FOREIGN KEY (programdela_id) REFERENCES programdela(id);


--
-- TOC entry 2855 (class 2606 OID 21496770)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2857 (class 2606 OID 21496780)
-- Name: fk_e7d4cf2638c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT fk_e7d4cf2638c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2867 (class 2606 OID 21496825)
-- Name: fk_e9f8ee8257ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee8257ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id) ON DELETE CASCADE;


--
-- TOC entry 2866 (class 2606 OID 21496830)
-- Name: fk_e9f8ee82af91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee82af91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id) ON DELETE CASCADE;


--
-- TOC entry 2771 (class 2606 OID 21496355)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2772 (class 2606 OID 21496350)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2776 (class 2606 OID 21496370)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2775 (class 2606 OID 21496375)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2798 (class 2606 OID 21496485)
-- Name: fk_f44a386d10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT fk_f44a386d10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2799 (class 2606 OID 21496500)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2800 (class 2606 OID 21496495)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2801 (class 2606 OID 21496490)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- Completed on 2015-10-08 11:34:09 CEST

--
-- PostgreSQL database dump complete
--

