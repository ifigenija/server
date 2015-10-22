--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.10
-- Dumped by pg_dump version 9.3.10
-- Started on 2015-10-22 13:16:21 CEST

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- TOC entry 249 (class 3079 OID 11789)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 3130 (class 0 OID 0)
-- Dependencies: 249
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_with_oids = false;

--
-- TOC entry 180 (class 1259 OID 23143820)
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
-- TOC entry 233 (class 1259 OID 23144425)
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
-- TOC entry 232 (class 1259 OID 23144408)
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
-- TOC entry 223 (class 1259 OID 23144285)
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
-- TOC entry 226 (class 1259 OID 23144315)
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
-- TOC entry 247 (class 1259 OID 23144696)
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
-- TOC entry 200 (class 1259 OID 23144065)
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
-- TOC entry 202 (class 1259 OID 23144096)
-- Name: dogodeksplosni; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodeksplosni (
    id uuid NOT NULL
);


--
-- TOC entry 241 (class 1259 OID 23144622)
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
-- TOC entry 191 (class 1259 OID 23143962)
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
-- TOC entry 234 (class 1259 OID 23144438)
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
    sthonorarnihzun integer DEFAULT 0,
    sthonorarnihzunigr integer DEFAULT 0,
    sthonorarnihzunigrtujjz integer DEFAULT 0,
    sthonorarnihzunsamoz integer DEFAULT 0,
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
-- TOC entry 219 (class 1259 OID 23144239)
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
-- TOC entry 197 (class 1259 OID 23144036)
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
-- TOC entry 194 (class 1259 OID 23144002)
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
-- TOC entry 3131 (class 0 OID 0)
-- Dependencies: 194
-- Name: COLUMN job.data; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN job.data IS '(DC2Type:object)';


--
-- TOC entry 192 (class 1259 OID 23143979)
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
-- TOC entry 208 (class 1259 OID 23144153)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 245 (class 1259 OID 23144677)
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
-- TOC entry 246 (class 1259 OID 23144689)
-- Name: mapa_zapis; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE mapa_zapis (
    mapa_id uuid NOT NULL,
    zapis_id uuid NOT NULL
);


--
-- TOC entry 248 (class 1259 OID 23144711)
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
-- TOC entry 212 (class 1259 OID 23144178)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 189 (class 1259 OID 23143936)
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
-- TOC entry 182 (class 1259 OID 23143839)
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
-- TOC entry 186 (class 1259 OID 23143903)
-- Name: organizacijskaenota; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE organizacijskaenota (
    id uuid NOT NULL,
    parent_id uuid,
    vodja_id uuid,
    namestnik_id uuid,
    sifra character varying(255) NOT NULL,
    naziv character varying(50) DEFAULT NULL::character varying
);


--
-- TOC entry 183 (class 1259 OID 23143850)
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
-- TOC entry 177 (class 1259 OID 23143794)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 179 (class 1259 OID 23143813)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 213 (class 1259 OID 23144185)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 217 (class 1259 OID 23144219)
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
-- TOC entry 229 (class 1259 OID 23144356)
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
-- TOC entry 185 (class 1259 OID 23143883)
-- Name: popa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE popa (
    id uuid NOT NULL,
    tipkli_id uuid,
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
-- TOC entry 188 (class 1259 OID 23143928)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 236 (class 1259 OID 23144567)
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
-- TOC entry 209 (class 1259 OID 23144159)
-- Name: postavkaracuna; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE postavkaracuna (
    id uuid NOT NULL,
    racun_id uuid
);


--
-- TOC entry 187 (class 1259 OID 23143913)
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
-- TOC entry 199 (class 1259 OID 23144057)
-- Name: praznik; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE praznik (
    id uuid NOT NULL,
    ime character varying(255) NOT NULL,
    dan character varying(255) NOT NULL,
    mesec integer NOT NULL,
    leto integer,
    delaprost boolean NOT NULL
);


--
-- TOC entry 195 (class 1259 OID 23144017)
-- Name: predstava; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE predstava (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    gostovanje_id uuid,
    dezurni_id uuid,
    zaporedna integer,
    zaporednasez integer,
    objavljenzacetek timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    porocilo text
);


--
-- TOC entry 196 (class 1259 OID 23144029)
-- Name: predstava_abonma; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE predstava_abonma (
    predstava_id uuid NOT NULL,
    abonma_id uuid NOT NULL
);


--
-- TOC entry 211 (class 1259 OID 23144171)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 237 (class 1259 OID 23144581)
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
-- TOC entry 238 (class 1259 OID 23144591)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    sifra character varying(4) NOT NULL,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 235 (class 1259 OID 23144506)
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
    stpremiervelikih integer DEFAULT 0,
    stpremiermalih integer DEFAULT 0,
    stpremiermalihkopr integer DEFAULT 0,
    stpremiervelikihkopr integer DEFAULT 0,
    stpremiersredkopr integer DEFAULT 0,
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
    stizvponpremgost numeric(15,2) DEFAULT 0::numeric,
    stizvponpremkopr integer,
    stizvponpremint integer,
    stizvponpremkoprint integer,
    stizvponprej numeric(15,2) DEFAULT 0::numeric,
    stizvponprejdoma integer,
    stizvponprejzamejo numeric(15,2) DEFAULT 0::numeric,
    stizvponprejgost numeric(15,2) DEFAULT 0::numeric,
    stizvponprejkopr integer,
    stizvponprejint integer,
    stizvponprejkoprint integer,
    stizvgostuj integer,
    stizvostalihnek numeric(15,2) DEFAULT 0::numeric,
    stizvgostovanjslo numeric(15,2) DEFAULT 0::numeric,
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
    sthonorarnihzun integer DEFAULT 0,
    sthonorarnihzunigr integer DEFAULT 0,
    sthonorarnihzunigrtujjz integer,
    sthonorarnihzunsamoz integer DEFAULT 0,
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
-- TOC entry 239 (class 1259 OID 23144599)
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
-- TOC entry 215 (class 1259 OID 23144200)
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
-- TOC entry 207 (class 1259 OID 23144144)
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
-- TOC entry 206 (class 1259 OID 23144134)
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
-- TOC entry 228 (class 1259 OID 23144345)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying,
    status character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 222 (class 1259 OID 23144275)
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
-- TOC entry 193 (class 1259 OID 23143991)
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
-- TOC entry 174 (class 1259 OID 23143765)
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
-- TOC entry 173 (class 1259 OID 23143763)
-- Name: revizije_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE revizije_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3132 (class 0 OID 0)
-- Dependencies: 173
-- Name: revizije_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE revizije_id_seq OWNED BY revizije.id;


--
-- TOC entry 216 (class 1259 OID 23144213)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 178 (class 1259 OID 23143803)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 176 (class 1259 OID 23143787)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 218 (class 1259 OID 23144227)
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
-- TOC entry 210 (class 1259 OID 23144165)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 204 (class 1259 OID 23144111)
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
-- TOC entry 172 (class 1259 OID 23143752)
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
-- TOC entry 171 (class 1259 OID 23143744)
-- Name: stevilcenjekonfig; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjekonfig (
    id uuid NOT NULL,
    stevilcenje_id uuid,
    dok character varying(100) DEFAULT NULL::character varying
);


--
-- TOC entry 170 (class 1259 OID 23143739)
-- Name: stevilcenjestanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjestanje (
    id uuid NOT NULL,
    objid uuid NOT NULL,
    leto integer NOT NULL,
    stevilka integer
);


--
-- TOC entry 224 (class 1259 OID 23144292)
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
-- TOC entry 184 (class 1259 OID 23143875)
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
-- TOC entry 205 (class 1259 OID 23144121)
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
    planiranotraja numeric(15,2) DEFAULT NULL::numeric,
    dezurni boolean,
    gost boolean
);


--
-- TOC entry 227 (class 1259 OID 23144333)
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
-- TOC entry 181 (class 1259 OID 23143829)
-- Name: tippopa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tippopa (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    ime character varying(255) NOT NULL,
    opis text
);


--
-- TOC entry 240 (class 1259 OID 23144610)
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
-- TOC entry 203 (class 1259 OID 23144101)
-- Name: tipvaje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tipvaje (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    ime character varying(255) NOT NULL,
    opis text
);


--
-- TOC entry 190 (class 1259 OID 23143948)
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
-- TOC entry 175 (class 1259 OID 23143774)
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
-- TOC entry 231 (class 1259 OID 23144383)
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
-- TOC entry 198 (class 1259 OID 23144047)
-- Name: vaja; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE vaja (
    id uuid NOT NULL,
    tipvaje_id uuid,
    uprizoritev_id uuid,
    zaporedna integer,
    porocilo text
);


--
-- TOC entry 214 (class 1259 OID 23144192)
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
-- TOC entry 225 (class 1259 OID 23144306)
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
-- TOC entry 243 (class 1259 OID 23144657)
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
-- TOC entry 242 (class 1259 OID 23144629)
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
-- TOC entry 244 (class 1259 OID 23144669)
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
-- TOC entry 221 (class 1259 OID 23144264)
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
    jenastopajoci boolean,
    organizacijskaenota_id uuid
);


--
-- TOC entry 201 (class 1259 OID 23144090)
-- Name: zasedenost; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zasedenost (
    id uuid NOT NULL,
    oseba_id uuid
);


--
-- TOC entry 230 (class 1259 OID 23144373)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 220 (class 1259 OID 23144254)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 2220 (class 2604 OID 23143768)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 3055 (class 0 OID 23143820)
-- Dependencies: 180
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
000a0000-5628-c57f-63bd-87f39728b097	10	30	Otroci	Abonma za otroke	200
000a0000-5628-c57f-3dd4-6cdecf00401b	20	60	Mladina	Abonma za mladino	400
000a0000-5628-c57f-63fb-3f27e2d036a3	15	50	Odrasli	Abonma za odrasle	300
\.


--
-- TOC entry 3108 (class 0 OID 23144425)
-- Dependencies: 233
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, zaposlitev_id, oseba_id, pogodba_id, sifra, zaposlen, zacetek, konec, opomba, sort, privzeti, aktivna, imapogodbo, pomembna) FROM stdin;
000c0000-5628-c580-6b72-ab77521bd73f	000d0000-5628-c580-47c2-11292616ba48	\N	00090000-5628-c57f-4552-50ed6113c044	000b0000-5628-c580-a7a4-c36b587a11b5	0001	f	\N	\N	\N	3	t	\N	t	t
000c0000-5628-c580-cdc6-9bce19dca3af	000d0000-5628-c580-4638-9a96c8b791b5	00100000-5628-c580-51d9-9b7048919d70	00090000-5628-c580-d347-17cf7142b7be	\N	0002	t	2016-01-01	\N	\N	8	t	\N	f	f
000c0000-5628-c580-092a-55fdc5595a6d	000d0000-5628-c580-2eaf-7f70f231923d	00100000-5628-c580-5711-39be6d313ad2	00090000-5628-c57f-2087-b67737b8893d	\N	0003	t	\N	2015-10-22	\N	2	t	\N	f	f
000c0000-5628-c580-2eef-a53c6a7f8a1d	000d0000-5628-c580-b36a-757c07935edb	\N	00090000-5628-c57f-9518-a3e4198ef22b	\N	0004	f	2016-01-01	2016-01-01	\N	26	t	\N	f	f
000c0000-5628-c580-2056-d57577d8ed72	000d0000-5628-c580-d0e1-043fb0fa2ba9	\N	00090000-5628-c580-6d4f-d62f7074fe98	\N	0005	f	2016-01-01	2016-01-01	\N	7	t	\N	f	f
000c0000-5628-c580-ba40-05f9928cea4c	000d0000-5628-c580-cc18-107decc7a2ac	\N	00090000-5628-c57f-aad1-41ffda35b51f	000b0000-5628-c580-2f92-cdcf145c6bb6	0006	f	2016-01-01	2016-01-01	\N	1	t	\N	t	t
000c0000-5628-c580-1300-2968202f3caf	000d0000-5628-c580-f043-32896a89f2c8	00100000-5628-c580-bd9d-373666cf6b28	00090000-5628-c57f-e46e-7469b7b93bc8	\N	0007	t	2016-01-01	2016-01-01	\N	14	t	\N	f	t
000c0000-5628-c580-4f4a-f119e4a494f9	000d0000-5628-c580-7cc5-9339398d0726	\N	00090000-5628-c580-22b4-af857d8344a4	000b0000-5628-c580-9b74-55d0f972bf86	0008	f	2016-01-01	2016-01-01	\N	12	t	\N	t	t
000c0000-5628-c580-37e0-775fb5aefbcc	000d0000-5628-c580-f043-32896a89f2c8	00100000-5628-c580-838a-da405653d8de	00090000-5628-c57f-eada-aecb78a43ea9	\N	0009	t	2017-01-01	2017-01-01	\N	15	t	\N	f	t
000c0000-5628-c580-83c3-2037b835e2ef	000d0000-5628-c580-f043-32896a89f2c8	00100000-5628-c580-2ad6-444ab37595f2	00090000-5628-c57f-bb6a-2be843c05169	\N	0010	t	\N	2015-10-22	\N	16	f	\N	f	t
000c0000-5628-c580-c3a1-eb6cbc31ee53	000d0000-5628-c580-f043-32896a89f2c8	00100000-5628-c580-ff31-6affc745fc4f	00090000-5628-c57f-58c9-e32ee9b00534	\N	0011	t	2017-01-01	\N	\N	17	f	\N	f	t
000c0000-5628-c580-2291-136d2b9baa1c	000d0000-5628-c580-5930-9cdbe4d3bd29	\N	00090000-5628-c580-d347-17cf7142b7be	000b0000-5628-c580-07de-615ec75a5b41	0012	f	\N	\N	\N	2	t	\N	t	t
\.


--
-- TOC entry 3107 (class 0 OID 23144408)
-- Dependencies: 232
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 3098 (class 0 OID 23144285)
-- Dependencies: 223
-- Data for Name: avtorbesedila; Type: TABLE DATA; Schema: public; Owner: -
--

COPY avtorbesedila (id, besedilo_id, oseba_id, tipavtorja, zaporedna, alivnaslovu) FROM stdin;
003d0000-5628-c580-067e-2f17573ff6da	00160000-5628-c57f-981e-f43905a1d434	00090000-5628-c580-f432-4ce40cff685a	aizv	10	t
003d0000-5628-c580-128f-2499c4c93011	00160000-5628-c57f-981e-f43905a1d434	00090000-5628-c580-c3dd-15fb4233904e	apri	14	t
003d0000-5628-c580-8af0-e8b512851b31	00160000-5628-c57f-9dca-aab34b42d9c9	00090000-5628-c580-d761-9bbd450d33e2	aizv	11	t
003d0000-5628-c580-3894-40da99597b8f	00160000-5628-c57f-7cb7-e6f37b2bdb4d	00090000-5628-c580-2798-44f1e74de881	aizv	12	t
003d0000-5628-c580-c5fe-7f388b05c3b0	00160000-5628-c57f-981e-f43905a1d434	00090000-5628-c580-6150-f3619445aa90	apri	18	f
\.


--
-- TOC entry 3101 (class 0 OID 23144315)
-- Dependencies: 226
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, stevilka, naslov, podnaslov, jezik, naslovizvirnika, podnaslovizvirnika, internacionalninaslov, datumprejema, moskevloge, zenskevloge, povzetekvsebine, letoizida, krajizida, zaloznik, avtor) FROM stdin;
00160000-5628-c57f-981e-f43905a1d434	0001	Sen kresne noči		slovenščina	A Midsummer Night's Dream	\N	\N	2015-04-26	5	5	Nastopajo Titanija, Hipolita, Oberon, ...	\N	\N	\N	William  Shakespeare - Nebojša  Kavader
00160000-5628-c57f-9dca-aab34b42d9c9	0002	Bratje Karamazovi		slovenščina	Bratja Karamazjovji	\N	\N	2015-12-04	4	1	Svetovna uspešnica	\N	\N	\N	Fjodor Mihajlovič Dostojevski
00160000-5628-c57f-7cb7-e6f37b2bdb4d	0003	Smoletov Vrt		slovenščina		\N	\N	2015-05-26	2	8		\N	\N	\N	Berta   Hočevar
\.


--
-- TOC entry 3122 (class 0 OID 23144696)
-- Dependencies: 247
-- Data for Name: datoteka; Type: TABLE DATA; Schema: public; Owner: -
--

COPY datoteka (id, owner_id, filename, transfers, size, format, hash, createdat, uploadedat, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3075 (class 0 OID 23144065)
-- Dependencies: 200
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_splosni_id, prostor_id, sezona_id, allday, zacetek, konec, status, razred, termin, title) FROM stdin;
00180000-5628-c580-ef54-371a8af9bdb6	\N	\N	00200000-5628-c580-9ee1-79d387cbf590	\N	\N	\N	\N	f	2015-06-26 10:00:00	2015-06-26 12:00:00	200s	200s		dogodek 1
00180000-5628-c580-1565-b050942cd9e1	\N	\N	00200000-5628-c580-73b1-8b47833dfce7	\N	\N	\N	\N	f	2015-06-27 10:00:00	2015-06-27 12:00:00	300s	200s		dogodek 2
00180000-5628-c580-1a2c-07b4f75874fc	\N	\N	00200000-5628-c580-1a49-3959f0e611a6	\N	\N	\N	\N	f	2015-08-01 20:00:00	2015-08-01 23:00:00	400s	200s		dogodek 3
00180000-5628-c580-b90b-c6fbe4917abd	\N	\N	00200000-5628-c580-2ff3-31823b6fcbe6	\N	\N	\N	\N	f	2015-08-01 20:00:00	2015-08-01 23:00:00	100s	200s		dogodek 4
00180000-5628-c580-7d7c-40096164ea3f	\N	\N	00200000-5628-c580-cd2d-0e68ee69aeab	\N	\N	\N	\N	f	2015-08-01 20:00:00	2015-08-01 23:00:00	500s	200s		dogodek 5
\.


--
-- TOC entry 3077 (class 0 OID 23144096)
-- Dependencies: 202
-- Data for Name: dogodeksplosni; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodeksplosni (id) FROM stdin;
\.


--
-- TOC entry 3116 (class 0 OID 23144622)
-- Dependencies: 241
-- Data for Name: drugivir; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drugivir (id, znesek, opis, mednarodni, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 3066 (class 0 OID 23143962)
-- Dependencies: 191
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-5628-c57c-f856-a8ade6cc97b5	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-5628-c57c-cc65-08294d79d024	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-5628-c57c-ff0f-cbcdd7362d2a	AL	ALB	008	Albania 	Albanija	\N
00040000-5628-c57c-3543-db45558a298e	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-5628-c57c-3c1b-767cc3ac4c70	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-5628-c57c-38ff-60495ebccb75	AD	AND	020	Andorra 	Andora	\N
00040000-5628-c57c-7622-770ab84dc15e	AO	AGO	024	Angola 	Angola	\N
00040000-5628-c57c-1b0e-d7f0674901ed	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-5628-c57c-7de8-36ddc8acacf4	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-5628-c57c-bd92-619184df5dfe	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-5628-c57c-71d1-bcc5383403f3	AR	ARG	032	Argentina 	Argenitna	\N
00040000-5628-c57c-b5d4-e9eade2c9a8e	AM	ARM	051	Armenia 	Armenija	\N
00040000-5628-c57c-31cf-aa116772761d	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-5628-c57c-b97f-c61c76bfcbfc	AU	AUS	036	Australia 	Avstralija	\N
00040000-5628-c57c-67ec-27ab3e2f6d92	AT	AUT	040	Austria 	Avstrija	\N
00040000-5628-c57c-4f96-77fc8dc5d754	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-5628-c57c-433f-5d884ae80b4b	BS	BHS	044	Bahamas 	Bahami	\N
00040000-5628-c57c-e822-789c07488ea8	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-5628-c57c-8760-a5daafeea66e	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-5628-c57c-ce55-a7d966b38101	BB	BRB	052	Barbados 	Barbados	\N
00040000-5628-c57c-65f5-57e50e624afd	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-5628-c57c-c39e-06d1711c8a4e	BE	BEL	056	Belgium 	Belgija	\N
00040000-5628-c57c-37cb-b471e9cb26e0	BZ	BLZ	084	Belize 	Belize	\N
00040000-5628-c57c-e6d4-76a09b1c21ec	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-5628-c57c-066f-e044769f7507	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-5628-c57c-a280-f9b4f7a0195b	BT	BTN	064	Bhutan 	Butan	\N
00040000-5628-c57c-a6dc-1f928c4f479d	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-5628-c57c-2c0e-29de9c33fd34	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-5628-c57c-5b01-88ed5f3f239a	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-5628-c57c-0df9-55d76df1fde0	BW	BWA	072	Botswana 	Bocvana	\N
00040000-5628-c57c-705c-e021b2f2c13f	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-5628-c57c-bde8-d08a032f645b	BR	BRA	076	Brazil 	Brazilija	\N
00040000-5628-c57c-c5ee-0903361325ef	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-5628-c57c-7891-fac182057a49	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-5628-c57c-b6ed-db8de273b08d	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-5628-c57c-7dbf-d56b9d67d0a7	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-5628-c57c-3e25-5f03ce419495	BI	BDI	108	Burundi 	Burundi 	\N
00040000-5628-c57c-4286-8193a9845515	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-5628-c57c-38f1-cfeb64de6add	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-5628-c57c-553a-a52a3a40a075	CA	CAN	124	Canada 	Kanada	\N
00040000-5628-c57c-a6c4-6dbd8b792ae8	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-5628-c57c-5d3e-1443580efb19	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-5628-c57c-344f-7c4a43c851cc	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-5628-c57c-c5e8-8d611f3ae254	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-5628-c57c-c5c7-7a5f57f27924	CL	CHL	152	Chile 	Čile	\N
00040000-5628-c57c-0c84-9b195c935ae8	CN	CHN	156	China 	Kitajska	\N
00040000-5628-c57c-c029-bb14a8ff0cb1	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-5628-c57c-a342-a126f93e179a	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-5628-c57c-d36c-1cf5bb192d8c	CO	COL	170	Colombia 	Kolumbija	\N
00040000-5628-c57c-c943-63592ca2e2f8	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-5628-c57c-4e5e-e5ea61274ab5	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-5628-c57c-5dc0-a37fac2ffb09	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-5628-c57c-a8eb-7ebad0c22a04	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-5628-c57c-21c0-a915d72a90bb	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-5628-c57c-a3ab-6e0cb59e2a9c	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-5628-c57c-7f61-4e0fda027d0a	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-5628-c57c-93ec-394f912f80fc	CU	CUB	192	Cuba 	Kuba	\N
00040000-5628-c57c-24f9-bd36d6466ffa	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-5628-c57c-ce35-76efd1e30361	CY	CYP	196	Cyprus 	Ciper	\N
00040000-5628-c57c-ad69-9628b988ddc9	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-5628-c57c-1e20-1ed90c457246	DK	DNK	208	Denmark 	Danska	\N
00040000-5628-c57c-a136-3c9d796b6357	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-5628-c57c-7f64-540416a2ba7b	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-5628-c57c-3f09-7fecb70ca086	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-5628-c57c-a29c-7ddca3d99e13	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-5628-c57c-a14f-02c0dfee259b	EG	EGY	818	Egypt 	Egipt	\N
00040000-5628-c57c-c114-1265bf542475	SV	SLV	222	El Salvador 	Salvador	\N
00040000-5628-c57c-846e-9819df04fd0a	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-5628-c57c-0e68-99cedf41521a	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-5628-c57c-70c9-2f019a185dd5	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-5628-c57c-6b34-eb567aa5accf	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-5628-c57c-c3f7-b12db3aac4c8	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-5628-c57c-494e-3a997acf6653	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-5628-c57c-7977-a48d91b9edd0	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-5628-c57c-ad6a-dc09cd4e2244	FI	FIN	246	Finland 	Finska	\N
00040000-5628-c57c-4057-7f72cc7e7a9e	FR	FRA	250	France 	Francija	\N
00040000-5628-c57c-c5d4-64c2ba540472	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-5628-c57c-96d6-fbde5cbb1494	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-5628-c57c-a032-afb95ef6fc81	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-5628-c57c-d113-870560b49020	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-5628-c57c-d347-cb30bcaff52a	GA	GAB	266	Gabon 	Gabon	\N
00040000-5628-c57c-b94e-abc5184d13fd	GM	GMB	270	Gambia 	Gambija	\N
00040000-5628-c57c-b2da-41396edb82a9	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-5628-c57c-a609-9f91fec81fde	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-5628-c57c-32ea-d40afa25d35d	GH	GHA	288	Ghana 	Gana	\N
00040000-5628-c57c-4017-34f09e0db070	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-5628-c57c-fb22-a2748cd7caff	GR	GRC	300	Greece 	Grčija	\N
00040000-5628-c57c-0f76-c48c77a7f0e4	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-5628-c57c-4a23-59cc260f9ff3	GD	GRD	308	Grenada 	Grenada	\N
00040000-5628-c57c-9a3d-cea4af640aa7	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-5628-c57c-5036-8bd2b4b992f8	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-5628-c57c-a421-795299b1eaff	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-5628-c57c-f943-5923a053e3d3	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-5628-c57c-b1ad-4e9312d5b23b	GN	GIN	324	Guinea 	Gvineja	\N
00040000-5628-c57c-1c4a-4cb197b2a27e	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-5628-c57c-0ae3-000c1244b24d	GY	GUY	328	Guyana 	Gvajana	\N
00040000-5628-c57c-5d11-ba22b3ffcfd7	HT	HTI	332	Haiti 	Haiti	\N
00040000-5628-c57c-8974-b3cc3d97beb2	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-5628-c57c-05dd-4769090a6709	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-5628-c57c-dae8-654e604acfdd	HN	HND	340	Honduras 	Honduras	\N
00040000-5628-c57c-3678-4550ddf1ab85	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-5628-c57c-9311-e0bc8f3ad4bc	HU	HUN	348	Hungary 	Madžarska	\N
00040000-5628-c57c-0536-bca76c993e3d	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-5628-c57c-1ed9-3b50e16777b1	IN	IND	356	India 	Indija	\N
00040000-5628-c57c-e09d-9bb5705741c4	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-5628-c57c-1167-3b4a6dbf561d	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-5628-c57c-d4b9-a562af24c9d1	IQ	IRQ	368	Iraq 	Irak	\N
00040000-5628-c57c-0b53-e9877a88e17d	IE	IRL	372	Ireland 	Irska	\N
00040000-5628-c57c-1ceb-13139e7432d0	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-5628-c57c-e4d8-cd2e9b252dd8	IL	ISR	376	Israel 	Izrael	\N
00040000-5628-c57c-ec52-c78e7fb3681d	IT	ITA	380	Italy 	Italija	\N
00040000-5628-c57c-79d6-2f536269b330	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-5628-c57c-e5c7-127e01dd6f0b	JP	JPN	392	Japan 	Japonska	\N
00040000-5628-c57c-7d48-14d8b43b95a8	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-5628-c57c-9a34-716604085ea9	JO	JOR	400	Jordan 	Jordanija	\N
00040000-5628-c57c-ca34-02c9b6253a6d	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-5628-c57c-1f67-2db18e061355	KE	KEN	404	Kenya 	Kenija	\N
00040000-5628-c57c-5272-b6e17d6bfcf0	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-5628-c57c-83e2-bfb575990863	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-5628-c57c-1c51-260a08b7aba9	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-5628-c57c-8c38-f4a3e7f2de58	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-5628-c57c-1303-c0b16ad99f7d	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-5628-c57c-1105-f41037c8a9ad	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-5628-c57c-4537-c8fe076a73c1	LV	LVA	428	Latvia 	Latvija	\N
00040000-5628-c57c-c7d8-2d8b20707fff	LB	LBN	422	Lebanon 	Libanon	\N
00040000-5628-c57c-ee43-3efc2611ddcd	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-5628-c57c-8084-5422aa59f490	LR	LBR	430	Liberia 	Liberija	\N
00040000-5628-c57c-2a03-1ce39bfa13db	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-5628-c57c-7cdb-3387f2fd0c79	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-5628-c57c-a168-d376117b62b2	LT	LTU	440	Lithuania 	Litva	\N
00040000-5628-c57c-748c-75e35e2d1d17	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-5628-c57c-f87c-c036741f07ba	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-5628-c57c-c4c7-0a4a30dcb18d	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-5628-c57c-fe2a-2dd3b7959ee7	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-5628-c57c-d720-f6d7bc04abe8	MW	MWI	454	Malawi 	Malavi	\N
00040000-5628-c57c-c7aa-c8df9c3230d8	MY	MYS	458	Malaysia 	Malezija	\N
00040000-5628-c57c-4da7-57ee1c0927ca	MV	MDV	462	Maldives 	Maldivi	\N
00040000-5628-c57c-e45c-c2a5cf6c4c6f	ML	MLI	466	Mali 	Mali	\N
00040000-5628-c57c-f6cf-6a4919835243	MT	MLT	470	Malta 	Malta	\N
00040000-5628-c57c-9c9e-695d839be088	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-5628-c57c-c91a-cce8800dc087	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-5628-c57c-8917-b1406dbe47b4	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-5628-c57c-15cf-8576a6456600	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-5628-c57c-8132-41b589733928	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-5628-c57c-a71a-2ec1a174261e	MX	MEX	484	Mexico 	Mehika	\N
00040000-5628-c57c-b4f2-14d1b1e46c20	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-5628-c57c-7256-8d10346e5317	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-5628-c57c-356c-d63fac2baaa8	MC	MCO	492	Monaco 	Monako	\N
00040000-5628-c57c-271f-f6f4ce51ec95	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-5628-c57c-3e46-72ea06123f9e	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-5628-c57c-ff10-c235b702fb30	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-5628-c57c-fb85-612bbfd0ce74	MA	MAR	504	Morocco 	Maroko	\N
00040000-5628-c57c-a165-3609adc4413d	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-5628-c57c-6917-f573a4c5324f	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-5628-c57c-d946-4213e4403478	NA	NAM	516	Namibia 	Namibija	\N
00040000-5628-c57c-c0d5-d3b1eb7cbf30	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-5628-c57c-3964-fd4fffd08b95	NP	NPL	524	Nepal 	Nepal	\N
00040000-5628-c57c-3769-09b05758bc99	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-5628-c57c-965c-6325014af9f6	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-5628-c57c-8c4a-397b6024a94c	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-5628-c57c-c4ad-71cb18dd6d93	NE	NER	562	Niger 	Niger 	\N
00040000-5628-c57c-52cc-e515f79bc6de	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-5628-c57c-94de-a416621814ee	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-5628-c57c-c278-d1898d93402a	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-5628-c57c-4655-4535f413aeb0	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-5628-c57c-5279-887bdf09ebf2	NO	NOR	578	Norway 	Norveška	\N
00040000-5628-c57c-4aac-617ada13ab1f	OM	OMN	512	Oman 	Oman	\N
00040000-5628-c57c-ae27-908626a4e1b5	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-5628-c57c-dd10-e0f90f5e7047	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-5628-c57c-bd67-1e58ee7b1de5	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-5628-c57c-8eaf-b826f77b1ab3	PA	PAN	591	Panama 	Panama	\N
00040000-5628-c57c-c0a3-67bd2b0f1a49	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-5628-c57c-51e9-822dc6d462a9	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-5628-c57c-a0df-35b4fbcbf8ea	PE	PER	604	Peru 	Peru	\N
00040000-5628-c57c-886d-c8edd0feef92	PH	PHL	608	Philippines 	Filipini	\N
00040000-5628-c57c-b5d9-5072f81be161	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-5628-c57c-9638-0075384065ac	PL	POL	616	Poland 	Poljska	\N
00040000-5628-c57c-1783-c9efe631a5da	PT	PRT	620	Portugal 	Portugalska	\N
00040000-5628-c57c-16d3-3371bc1dd410	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-5628-c57c-47e6-56c5496952e9	QA	QAT	634	Qatar 	Katar	\N
00040000-5628-c57c-57fa-f982b627d651	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-5628-c57c-7628-fdf2c476ce51	RO	ROU	642	Romania 	Romunija	\N
00040000-5628-c57c-2905-23b9eb3361f3	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-5628-c57c-062d-f2d3388581d4	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-5628-c57c-e132-05baeffbc8fc	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-5628-c57c-df6c-3938a95796f4	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-5628-c57c-c341-d60b49a2aa29	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-5628-c57c-3bc1-a751512dc425	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-5628-c57c-8fe7-47fee4b69291	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-5628-c57c-df36-838f2c4b6b86	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-5628-c57c-3bde-f841af35ba44	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-5628-c57c-408d-b46a1162b27f	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-5628-c57c-1ca0-f9d27bc16c52	SM	SMR	674	San Marino 	San Marino	\N
00040000-5628-c57c-03b1-f36cc47acd83	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-5628-c57c-e0e3-88253f60279a	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-5628-c57c-1b6f-6e95d4472de7	SN	SEN	686	Senegal 	Senegal	\N
00040000-5628-c57c-d6fe-e67222044f8f	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-5628-c57c-1058-7f61df57e262	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-5628-c57c-ef7a-3657242d521f	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-5628-c57c-0ea5-9dabac186a7a	SG	SGP	702	Singapore 	Singapur	\N
00040000-5628-c57c-8a7e-215101a33f8e	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-5628-c57c-4c4d-9fe3fc6b4f0b	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-5628-c57c-cda2-9626055aac6d	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-5628-c57c-3033-4e642668a32c	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-5628-c57c-9ec6-8e3d723d4f2a	SO	SOM	706	Somalia 	Somalija	\N
00040000-5628-c57c-aee6-63cf9e068986	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-5628-c57c-3b5f-2eae66989f6b	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-5628-c57c-d909-c79739b7466b	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-5628-c57c-5f9f-bb938a8ea55b	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-5628-c57c-7769-2bdc6b761d4e	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-5628-c57c-21b3-bfc27a484b4c	SD	SDN	729	Sudan 	Sudan	\N
00040000-5628-c57c-27cf-bf7b31a056bb	SR	SUR	740	Suriname 	Surinam	\N
00040000-5628-c57c-f3a9-113caeb89c62	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-5628-c57c-915e-13489bfa35fa	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-5628-c57c-5905-2e009158c649	SE	SWE	752	Sweden 	Švedska	\N
00040000-5628-c57c-da45-80caba076ea1	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-5628-c57c-5c99-cdaf4157b3b1	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-5628-c57c-d715-b305d08770a4	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-5628-c57c-9f3f-bb92d853bcec	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-5628-c57c-c82c-b5154baf8278	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-5628-c57c-efb9-12bb7ef7381c	TH	THA	764	Thailand 	Tajska	\N
00040000-5628-c57c-15c6-d566e31a3f07	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-5628-c57c-67b8-4cfdd32a09b6	TG	TGO	768	Togo 	Togo	\N
00040000-5628-c57c-67a7-940160d19daa	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-5628-c57c-7a6a-72f31eef3c76	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-5628-c57c-7057-797ebcae3d0b	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-5628-c57c-2f7d-0208f2dfbbba	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-5628-c57c-4b8c-32cc049d068e	TR	TUR	792	Turkey 	Turčija	\N
00040000-5628-c57c-cbf8-6cb16d22c7ec	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-5628-c57c-6ca5-ae487a87753f	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5628-c57c-38db-cbea227a86ee	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-5628-c57c-1a1f-7f81fde4b4d6	UG	UGA	800	Uganda 	Uganda	\N
00040000-5628-c57c-032c-3b6ecd49b123	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-5628-c57c-0bcf-20aad4c4ac93	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-5628-c57c-fc88-c7a6973d967c	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-5628-c57c-4ca1-c58f6d6a54a8	US	USA	840	United States 	Združene države Amerike	\N
00040000-5628-c57c-d0f2-e6adc1848eec	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-5628-c57c-2dc1-92546fb16dec	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-5628-c57c-bab8-183ce26fa662	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-5628-c57c-02c4-b719f8e6dfc2	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-5628-c57c-ed98-2c24cd9e370f	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-5628-c57c-be9d-cf8d0863c3a2	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-5628-c57c-71bf-64e3f9868c97	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5628-c57c-eae7-40f30155b93e	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-5628-c57c-3f01-e257b36f32cc	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-5628-c57c-f427-ec826d2a131d	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-5628-c57c-5dfc-985d74a921e1	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-5628-c57c-27ec-cbf569e7bff3	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-5628-c57c-04fb-783dc693a4bd	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 3109 (class 0 OID 23144438)
-- Dependencies: 234
-- Data for Name: enotaprograma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY enotaprograma (id, uprizoritev_id, program_dela_id, gostitelj_id, celotnavrednost, nasdelez, celotnavrednostmat, celotnavrednostgostovsz, zaproseno, lastnasredstva, avtorskihonorarji, avtorskihonorarjisamoz, tantieme, avtorskepravice, materialni, imakoprodukcije, vlozekgostitelja, drugijavni, stzaposlenih, stzaposumet, stzaposdrug, sthonorarnihzun, sthonorarnihzunigr, sthonorarnihzunigrtujjz, sthonorarnihzunsamoz, obiskdoma, obiskkopr, obiskgost, obiskkoprgost, obiskzamejo, obiskkoprzamejo, obiskint, obiskkoprint, ponovidoma, ponovikopr, ponovizamejo, ponovikoprzamejo, ponovigost, ponovikoprgost, ponovikoprint, ponoviint, naziv, kpe, sort, tipprogramskeenote_id, tip, prikoproducentu, prizorisce, trajanje, zvrst, avtor, reziser, datum, soustvarjalci, strosekodkpred, stroskiostali, krajgostovanja, ustanova, datumgostovanja, transportnistroski, dnevprvzad, drzavagostovanja_id, stpe, stpredstav, stokroglihmiz, stpredstavitev, stdelavnic, stdrugidogodki, stprodukcij, caspriprave, casizvedbe, prizorisca, umetvodja, programskotelo, sttujihselektorjev) FROM stdin;
002f0000-5628-c580-9759-d2a4eea7fc1c	000e0000-5628-c580-1914-cedde377722c	\N	\N	9000.30	9000.30	9000.30	0.00	3600.12	5299.98	4000.40	1000.40	200.20	200.30	4599.40	\N	0.00	100.20	0	2	2	2	2	2	0	40	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-5628-c4ce-c42e-ecf25e7a95bb	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-5628-c580-1fd0-e2a75f3fb8f6	000e0000-5628-c580-4894-a71a920a16e4	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	0	60	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-5628-c4ce-eac5-ca3af3070c2f	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-5628-c580-a524-651561c6704a	000e0000-5628-c580-a25a-bdda743a9d9a	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	0	60	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-5628-c4ce-c42e-ecf25e7a95bb	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-5628-c580-79cc-1526a8fd0967	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-54.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	54.20	5	0	0	3	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0	0	Urejanje portala	0.00	10	\N	razno	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-5628-c580-94a5-1727e76828a1	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-31.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	31.20	5	0	0	3	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0	0	Delavnice otroci	0.00	8	\N	razno	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 3094 (class 0 OID 23144239)
-- Dependencies: 219
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, podrocje, vodjaekipe, naziv, komentar, velikost, pomembna, sort, seplanira, dovoliprekrivanje, maxprekrivanj, tipfunkcije_id) FROM stdin;
000d0000-5628-c580-47c2-11292616ba48	000e0000-5628-c580-4894-a71a920a16e4	000c0000-5628-c580-6b72-ab77521bd73f	igralec	\N	Tezej	glavna vloga	velika	t	5	t	t	\N	000f0000-5628-c57c-f9c1-8b64eb7e691f
000d0000-5628-c580-4638-9a96c8b791b5	000e0000-5628-c580-4894-a71a920a16e4	000c0000-5628-c580-cdc6-9bce19dca3af	umetnik	\N	Režija		velika	t	8	t	t	\N	000f0000-5628-c57c-9a4f-948167145b8f
000d0000-5628-c580-2eaf-7f70f231923d	000e0000-5628-c580-4894-a71a920a16e4	000c0000-5628-c580-092a-55fdc5595a6d	inspicient	t	Inšpicient			t	8	t	t	\N	000f0000-5628-c57c-23c8-64c9125237c7
000d0000-5628-c580-b36a-757c07935edb	000e0000-5628-c580-4894-a71a920a16e4	000c0000-5628-c580-2eef-a53c6a7f8a1d	tehnik	t	Tehnični vodja			t	8	t	t	\N	000f0000-5628-c57c-8537-1922a7251157
000d0000-5628-c580-d0e1-043fb0fa2ba9	000e0000-5628-c580-4894-a71a920a16e4	000c0000-5628-c580-2056-d57577d8ed72	tehnik	\N	Razsvetljava			t	3	t	t	\N	000f0000-5628-c57c-8537-1922a7251157
000d0000-5628-c580-cc18-107decc7a2ac	000e0000-5628-c580-4894-a71a920a16e4	000c0000-5628-c580-ba40-05f9928cea4c	igralec	\N	Helena	glavna vloga	velika	t	5	t	t	\N	000f0000-5628-c57c-f9c1-8b64eb7e691f
000d0000-5628-c580-f043-32896a89f2c8	000e0000-5628-c580-4894-a71a920a16e4	000c0000-5628-c580-37e0-775fb5aefbcc	igralec	\N	Hipolita	glavna vloga	velika	t	6	t	t	\N	000f0000-5628-c57c-f9c1-8b64eb7e691f
000d0000-5628-c580-7cc5-9339398d0726	000e0000-5628-c580-4894-a71a920a16e4	000c0000-5628-c580-4f4a-f119e4a494f9	umetnik	\N	Lektoriranje			t	22	t	t	\N	000f0000-5628-c57c-c04a-b07e5ef63f7c
000d0000-5628-c580-5930-9cdbe4d3bd29	000e0000-5628-c580-4894-a71a920a16e4	000c0000-5628-c580-2291-136d2b9baa1c	umetnik	\N	Avtor	Avtor besedila		t	2	t	f	\N	000f0000-5628-c57c-c28b-cf968c4156a3
\.


--
-- TOC entry 3072 (class 0 OID 23144036)
-- Dependencies: 197
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta, zamejstvo, kraj) FROM stdin;
\.


--
-- TOC entry 3069 (class 0 OID 23144002)
-- Dependencies: 194
-- Data for Name: job; Type: TABLE DATA; Schema: public; Owner: -
--

COPY job (id, user_id, name, task, status, log, datum, casizvedbe, izveden, data, alert, hidden, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3067 (class 0 OID 23143979)
-- Dependencies: 192
-- Data for Name: kontaktnaoseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kontaktnaoseba (id, popa_id, oseba_id, status, funkcija, opis) FROM stdin;
00260000-5628-c580-44a2-d9a325b143d7	00080000-5628-c57f-1207-7efe029eef8a	00090000-5628-c57f-bb6a-2be843c05169	AK		igralka
\.


--
-- TOC entry 3083 (class 0 OID 23144153)
-- Dependencies: 208
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 3120 (class 0 OID 23144677)
-- Dependencies: 245
-- Data for Name: mapa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa (id, lastnik_id, parent_id, ime, komentar, caskreiranja, casspremembe, javnidostop, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3121 (class 0 OID 23144689)
-- Dependencies: 246
-- Data for Name: mapa_zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa_zapis (mapa_id, zapis_id) FROM stdin;
\.


--
-- TOC entry 3123 (class 0 OID 23144711)
-- Dependencies: 248
-- Data for Name: mapaacl; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapaacl (id, mapa_id, perm_id, dostop, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3087 (class 0 OID 23144178)
-- Dependencies: 212
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 3064 (class 0 OID 23143936)
-- Dependencies: 189
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-5628-c57d-2352-8566574d8a04	popa.stakli	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-5628-c57d-59cd-a4e648272b51	oseba.spol	array	a:2:{s:1:"M";a:1:{s:5:"label";s:6:"Moški";}s:1:"Z";a:1:{s:5:"label";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-5628-c57d-ae5a-cbc373c58836	telefonska.vrsta	array	a:3:{s:7:"mobilna";a:1:{s:5:"label";s:7:"Mobilni";}s:6:"domaca";a:1:{s:5:"label";s:6:"Domač";}s:6:"fiksna";a:1:{s:5:"label";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-5628-c57d-b8be-34f81d3a2b04	kontaktnaoseba.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status kontaktne osebe
00000000-5628-c57d-aa73-889a28517ec9	dogodek.status	array	a:8:{s:4:"100s";a:1:{s:5:"label";s:11:"Dolgoročno";}s:4:"200s";a:1:{s:5:"label";s:9:"Planirano";}s:4:"300s";a:1:{s:5:"label";s:8:"Fiksiran";}s:4:"400s";a:1:{s:5:"label";s:17:"Potrjen - interno";}s:4:"500s";a:1:{s:5:"label";s:15:"Potrjen - javno";}s:4:"600s";a:1:{s:5:"label";s:10:"Zaključen";}s:4:"610s";a:1:{s:5:"label";s:9:"Odpovedan";}s:4:"700s";a:1:{s:5:"label";s:7:"Obdelan";}}	f	t	t	\N	Tabela statusa dogodkov
00000000-5628-c57d-4758-95d5445b5064	dogodek.razred	array	a:5:{s:4:"100s";a:2:{s:5:"label";s:9:"Predstava";s:4:"type";s:9:"predstava";}s:4:"200s";a:2:{s:5:"label";s:4:"Vaja";s:4:"type";s:4:"vaja";}s:4:"300s";a:2:{s:5:"label";s:10:"Gostovanje";s:4:"type";s:10:"gostovanje";}s:4:"400s";a:2:{s:5:"label";s:16:"Splošni dogodek";s:4:"type";s:8:"splošni";}s:4:"500s";a:2:{s:5:"label";s:10:"Zasedenost";s:4:"type";s:10:"zasedenost";}}	f	t	t	\N	Tabela razredov dogodkov, ki jih aplikacija podpira
00000000-5628-c57d-787d-cec0a11ffaa5	uprizoritev.faza	array	a:6:{s:20:"predprodukcija-ideja";a:1:{s:5:"label";s:16:"Dolgoročni plan";}s:20:"predprodukcija-poziv";a:1:{s:5:"label";s:29:"Predprodukcija, v fazi poziva";}s:30:"predprodukcija-potrjen_program";a:1:{s:5:"label";s:34:"Predprodukcija, program je potrjen";}s:10:"produkcija";a:1:{s:5:"label";s:10:"Produkcija";}s:14:"postprodukcija";a:1:{s:5:"label";s:14:"Postprodukcija";}s:5:"arhiv";a:1:{s:5:"label";s:10:"Arhivirana";}}	f	t	f	\N	Faza uprizoritve
00000000-5628-c57d-db4f-bb68917bb6d8	funkcija.podrocje	array	a:4:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}}	f	t	f	\N	Področje funkcije
00000000-5628-c57d-ec38-0d21bd2aa11e	tipfunkcije.podrocje	array	a:4:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}}	f	t	f	\N	Področje funkcije
00000000-5628-c57d-d741-a0d1a0eb2d9d	funkcija.velikost	array	a:4:{s:6:"velika";a:1:{s:5:"label";s:23:"Velika vloga / funkcija";}s:7:"srednja";a:1:{s:5:"label";s:24:"Srednja vloga / funkcija";}s:4:"mala";a:1:{s:5:"label";s:21:"Mala vloga / funkcija";}s:7:"stataza";a:1:{s:5:"label";s:8:"Stataža";}}	f	t	f	\N	Velikost funkcije
00000000-5628-c57d-0027-eca91958bb6e	zaposlitev.status	array	a:2:{s:1:"A";a:1:{s:5:"label";s:7:"Aktivna";}s:1:"N";a:1:{s:5:"label";s:9:"Neaktivna";}}	f	t	f	\N	Status zaposlitve
00000000-5628-c57d-ae07-e65107a11f89	produkcijskahisa.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktivna";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktivna";}}	f	t	f	\N	Status produkcijske hiše
00000000-5628-c57d-6d7e-b6d39bd2a546	strosekuprizoritve.tipstroska	array	a:1:{s:10:"materialni";a:1:{s:5:"label";s:19:"Materialni strošek";}}	f	t	f	\N	Tip stroška
00000000-5628-c57d-5626-f7fa810e2fd8	avtorbesedila.tipavtorja	array	a:4:{s:4:"aizv";a:1:{s:5:"label";s:15:"Avtor izvirnika";}s:4:"prev";a:1:{s:5:"label";s:10:"Prevajalec";}s:4:"apri";a:1:{s:5:"label";s:14:"Avtor priredbe";}s:4:"dram";a:1:{s:5:"label";s:12:"Dramatizator";}}	f	t	f	\N	Tip stroška
00000000-5628-c57d-6cd4-464f705e4b40	fsacl.dostop	array	a:4:{s:1:"X";a:1:{s:5:"label";s:12:"Brez dostopa";}s:1:"R";a:1:{s:5:"label";s:11:"Samo branje";}s:2:"RW";a:1:{s:5:"label";s:17:"Branje in pisanje";}s:3:"RWD";a:1:{s:5:"label";s:26:"Branje pisanje in brisanje";}}	f	t	f	\N	ACL Javni dostop
00000000-5628-c57f-6a33-4346f75b8157	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-5628-c57f-cde7-11b9e4c855b2	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-5628-c57f-d6cb-aac43b44ce60	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-5628-c57f-71c7-4c4c6239597d	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-5628-c57f-7e52-2116de448803	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
00000000-5628-c583-b06a-7e4e9dfc4d41	application.tenant.maticnopodjetje	string	s:36:"00080000-5628-c583-1d04-09b89008a304";	f	t	f		Id matičnega podjetja v Popa
\.


--
-- TOC entry 3057 (class 0 OID 23143839)
-- Dependencies: 182
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-5628-c57f-2929-18ebf99018d7	00000000-5628-c57f-6a33-4346f75b8157	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-5628-c57f-f7e2-c34252a6c0be	00000000-5628-c57f-6a33-4346f75b8157	00010000-5628-c57d-daa1-4c38c6dd1199	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-5628-c57f-8fe8-0176d743f682	00000000-5628-c57f-cde7-11b9e4c855b2	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 3061 (class 0 OID 23143903)
-- Dependencies: 186
-- Data for Name: organizacijskaenota; Type: TABLE DATA; Schema: public; Owner: -
--

COPY organizacijskaenota (id, parent_id, vodja_id, namestnik_id, sifra, naziv) FROM stdin;
00410000-5628-c580-45fc-efa23d2c1346	\N	00100000-5628-c580-51d9-9b7048919d70	00100000-5628-c580-5711-39be6d313ad2	01	Gledališče Nimbis
00410000-5628-c580-c539-9abe2efc78fa	00410000-5628-c580-45fc-efa23d2c1346	00100000-5628-c580-51d9-9b7048919d70	00100000-5628-c580-5711-39be6d313ad2	02	Tehnika
\.


--
-- TOC entry 3058 (class 0 OID 23143850)
-- Dependencies: 183
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naslov_id, sifra, naziv, ime, priimek, funkcija, srednjeime, polnoime, psevdonim, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
00090000-5628-c57f-4552-50ed6113c044	\N	\N	0001	g.	Janez	Novak	a	Peter	Janez Peter Novak	Jani	jani.novak@xxx.xx	1958-01-06	0601958000000	123456789	M	Jani Janez	Slovenija	Slovenija	Ljubljana
00090000-5628-c57f-9518-a3e4198ef22b	00010000-5628-c57f-cce1-1bac9fe1378e	\N	0002	dr.	Anton	Horvat	b		Anton  Horvat	Tona	anton.horvat@xxx.xx	1968-02-12	1202968111111	234567890	M		Slovenija	Slovenija	Maribor
00090000-5628-c57f-2087-b67737b8893d	00010000-5628-c57f-3ff7-188ce4f14d58	\N	0003		Ivan	Kovačič	c		Ivan  Kovačič	Ivo	ivan.kovacic@xxx.xx	1975-03-26	2603976222222	345678901	M		Slovenija	Slovenija	Celje
00090000-5628-c57f-eada-aecb78a43ea9	00010000-5628-c57f-4876-35b41231a8f1	\N	0004	prof.	Jožef	Krajnc	d		Jožef  Krajnc	Joža	jozef.krajnc@xxx.xx	1971-04-30	3004971333333	456789012	M		Slovenija	Slovenija	Kranj
00090000-5628-c57f-9521-b9a862a9ef44	\N	\N	0005		Marko	Zupančič	e		Marko  Zupančič		marko.zupancic@xxx.xx	1984-05-07	0705984444444	567890123	M		Slovenija	Slovenija	Koper
00090000-5628-c57f-aad1-41ffda35b51f	\N	\N	0006	ga.	Marija	Kovač	f		Marija  Kovač		marija.kovac@xxx.xx	1962-06-19	1906962444444	678901234	Z		Slovenija	Slovenija	Murska Sobota
00090000-5628-c57f-58c9-e32ee9b00534	\N	\N	0007	ga.	Ana	Potočnik	g		Ana  Potočnik		ana.potocnik@xxx.xx	1975-07-24	2407975555555	789012345	Z		Slovenija	Slovenija	Novo Mesto
00090000-5628-c57f-e46e-7469b7b93bc8	\N	\N	0008	ga.	Maja	Mlakar	h		Maja  Mlakar		maja.mlakar@xxx.xx	1986-08-02	0208986666666	890123456	Z		Slovenija	Slovenija	Nova Gorica
00090000-5628-c57f-bb6a-2be843c05169	00010000-5628-c57f-7195-fa453b02ab6f	\N	0009		Irena	Kos	i		Irena  Kos		irena.kos@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Ptuj
00090000-5628-c580-d347-17cf7142b7be	\N	\N	0010		Mojca	Vidmar	J		Mojca  Vidmar		mojca.vidmar@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Idrija
00090000-5628-c580-0505-13a7424151a8	\N	\N	0011		xx	write protected12345	a		xx  write protected12345		xx@xxx.xx	\N	\N	\N	Z		\N	\N	\N
00090000-5628-c580-6d4f-d62f7074fe98	\N	\N	0012		Luka	Golob	luč	a	Luka a Golob		luka.golob@xxx.xx	\N	\N	\N	M		\N	\N	\N
00090000-5628-c580-22b4-af857d8344a4	00010000-5628-c57f-6546-6ae5eaeddc28	\N	0013		Tatjana	Božič	tajnica	a	Tatjana a Božič		tatjana.bozic@xxx.xx	\N	\N	\N	Z		\N	\N	\N
00090000-5628-c580-f432-4ce40cff685a	\N	\N	0014		William	Shakespeare	avtor		William  Shakespeare		\N	\N	\N	\N	M		\N	\N	\N
00090000-5628-c580-c3dd-15fb4233904e	\N	\N	0015		Nebojša	Kavader	avtor		Nebojša  Kavader		\N	\N	\N	\N	M		\N	\N	\N
00090000-5628-c580-d761-9bbd450d33e2	\N	\N	0016		Fjodor	Dostojevski	avtor	Mihajlovič	Fjodor Mihajlovič Dostojevski		\N	\N	\N	\N	M		\N	\N	\N
00090000-5628-c580-2798-44f1e74de881	\N	\N	0017		Berta 	Hočevar	avtorica		Berta   Hočevar		\N	\N	\N	\N	Z		\N	\N	\N
00090000-5628-c580-6150-f3619445aa90	\N	\N	0018		Katarina	Podbevšek	lektorica		Katarina  Podbevšek		\N	\N	\N	\N	Z		\N	\N	\N
00090000-5628-c580-a66f-351c14429c18	\N	\N	0019		Lojze	Žumer			Lojze  Žumer		\N	\N	\N	\N	M		\N	\N	\N
00090000-5628-c580-ca81-3494f6590694	\N	\N	0020		Luka	Novak			Luka  Novak		\N	\N	\N	\N	M		\N	\N	\N
\.


--
-- TOC entry 3052 (class 0 OID 23143794)
-- Dependencies: 177
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-5628-c57c-72df-4242b445171e	Aaa-read	Aaa (User,Role,Permission) - branje	f
00030000-5628-c57c-cbef-ed5f0854eed8	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	f
00030000-5628-c57c-7fef-3ced967fe7ad	TerminStoritve-vse	TerminStoritve - spreminjanje vseh zapisov	f
00030000-5628-c57c-c502-941b867d701e	Dogodek-readVse	Dogodek - branje vseh, ne glede na status dogodka	f
00030000-5628-c57c-4c11-bf7ec3800237	Oseba-vse	Oseba - vse - za testiranje assert	f
00030000-5628-c57c-007e-c068ac1012d1	ProgramDela-lock	ProgramDela - zaklepanje	f
00030000-5628-c57c-87e0-547e3059d4cb	ProgramDela-unlock	ProgramDela - odklepanje	f
00030000-5628-c57c-cfee-4877ce8ada40	Abonma-read	Abonma - branje	f
00030000-5628-c57c-148a-dfedc28dbeff	Abonma-write	Abonma - spreminjanje	f
00030000-5628-c57c-9919-da19d30525ea	Alternacija-read	Alternacija - branje	f
00030000-5628-c57c-aacd-81b2aba29242	Alternacija-write	Alternacija - spreminjanje	f
00030000-5628-c57c-35ac-a024dbd2d041	Arhivalija-read	Arhivalija - branje	f
00030000-5628-c57c-cc08-ad3b1a0cdc3b	Arhivalija-write	Arhivalija - spreminjanje	f
00030000-5628-c57c-ae06-8621ec61d5d9	AvtorBesedila-read	AvtorBesedila - branje	f
00030000-5628-c57c-52e9-b9a0cab5b414	AvtorBesedila-write	AvtorBesedila - spreminjanje	f
00030000-5628-c57c-7a08-3a531c49a325	Besedilo-read	Besedilo - branje	f
00030000-5628-c57c-f2c1-fd936d9e8079	Besedilo-write	Besedilo - spreminjanje	f
00030000-5628-c57c-7c25-211e8acb4a85	DogodekIzven-read	DogodekIzven - branje	f
00030000-5628-c57c-451a-198fec46dc82	DogodekIzven-write	DogodekIzven - spreminjanje	f
00030000-5628-c57c-0f07-f46cd3f84686	Dogodek-read	Dogodek - branje	f
00030000-5628-c57c-3250-d81fa0b349f8	Dogodek-write	Dogodek - spreminjanje	f
00030000-5628-c57c-7727-efe878581768	DrugiVir-read	DrugiVir - branje	f
00030000-5628-c57c-dcc9-d39d3c1971b1	DrugiVir-write	DrugiVir - spreminjanje	f
00030000-5628-c57c-4320-1c4a6d621ec1	Drzava-read	Drzava - branje	f
00030000-5628-c57c-4b5b-54185c41159d	Drzava-write	Drzava - spreminjanje	f
00030000-5628-c57c-a597-e6bb7f2c712a	EnotaPrograma-read	EnotaPrograma - branje	f
00030000-5628-c57c-afe0-e0c299f768f6	EnotaPrograma-write	EnotaPrograma - spreminjanje	f
00030000-5628-c57c-74f6-b0b1df9d74e2	Funkcija-read	Funkcija - branje	f
00030000-5628-c57c-373f-de52839482c7	Funkcija-write	Funkcija - spreminjanje	f
00030000-5628-c57c-44d1-16f0c21a8466	Gostovanje-read	Gostovanje - branje	f
00030000-5628-c57c-59bf-fd79d4015301	Gostovanje-write	Gostovanje - spreminjanje	f
00030000-5628-c57c-36bf-62a9f2600042	Gostujoca-read	Gostujoca - branje	f
00030000-5628-c57c-a0a1-a226a833f216	Gostujoca-write	Gostujoca - spreminjanje	f
00030000-5628-c57c-e2ad-e7e852c8c610	KontaktnaOseba-read	KontaktnaOseba - branje	f
00030000-5628-c57c-c6cf-0acac76cc36c	KontaktnaOseba-write	KontaktnaOseba - spreminjanje	f
00030000-5628-c57c-1ebd-5006a2df7a1c	Kupec-read	Kupec - branje	f
00030000-5628-c57c-458d-d37dd84deecc	Kupec-write	Kupec - spreminjanje	f
00030000-5628-c57c-3d7e-13d29181285a	NacinPlacina-read	NacinPlacina - branje	f
00030000-5628-c57c-8d93-a196058a60fd	NacinPlacina-write	NacinPlacina - spreminjanje	f
00030000-5628-c57c-39e5-86d0d5ed85b4	Option-read	Option - branje	f
00030000-5628-c57c-08cc-aec95dea9538	Option-write	Option - spreminjanje	f
00030000-5628-c57c-f021-9be352e25f4f	OptionValue-read	OptionValue - branje	f
00030000-5628-c57c-9ff9-c8b130f7630e	OptionValue-write	OptionValue - spreminjanje	f
00030000-5628-c57c-6252-d47d69f12f8f	OrganizacijskaEnota-read	OrganizacijskaEnota - branje	f
00030000-5628-c57c-7ac9-eeda0c57fadd	OrganizacijskaEnota-write	OrganizacijskaEnota - spreminjanje	f
00030000-5628-c57c-e26c-1092b03a61cd	Oseba-read	Oseba - branje	f
00030000-5628-c57c-8cae-3510d0c2ebd1	Oseba-write	Oseba - spreminjanje	f
00030000-5628-c57c-d102-2230bd129b85	PlacilniInstrument-read	PlacilniInstrument - branje	f
00030000-5628-c57c-504a-135ab6363cad	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	f
00030000-5628-c57c-70b5-edfbe353f85e	PodrocjeSedenja-read	PodrocjeSedenja - branje	f
00030000-5628-c57c-8f66-58330e1e3a08	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	f
00030000-5628-c57c-b536-0abbf21dc67b	Pogodba-read	Pogodba - branje	f
00030000-5628-c57c-5d69-21de4527e39f	Pogodba-write	Pogodba - spreminjanje	f
00030000-5628-c57c-e2ff-a1e069d78d7d	Popa-read	Popa - branje	f
00030000-5628-c57c-9bf9-13e3559eaeec	Popa-write	Popa - spreminjanje	f
00030000-5628-c57c-9ca3-2df164fb8535	Posta-read	Posta - branje	f
00030000-5628-c57c-3604-7f148bf27ae7	Posta-write	Posta - spreminjanje	f
00030000-5628-c57c-b026-ca57ced09938	PostavkaCDve-read	PostavkaCDve - branje	f
00030000-5628-c57c-828a-8114531f1ac0	PostavkaCDve-write	PostavkaCDve - spreminjanje	f
00030000-5628-c57c-cf7e-dc9e37011b54	PostavkaRacuna-read	PostavkaRacuna - branje	f
00030000-5628-c57c-62c8-747477fd00fc	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	f
00030000-5628-c57c-2829-7e8c83e4d287	PostniNaslov-read	PostniNaslov - branje	f
00030000-5628-c57c-f21c-429168502847	PostniNaslov-write	PostniNaslov - spreminjanje	f
00030000-5628-c57c-a882-0b29604d5ec7	Predstava-read	Predstava - branje	f
00030000-5628-c57c-fb50-27bad5270a3d	Predstava-write	Predstava - spreminjanje	f
00030000-5628-c57c-8b13-71b5b1cbc4fe	Praznik-read	Praznik - branje	f
00030000-5628-c57c-7f4e-d5766e4ccbae	Praznik-write	Praznik - spreminjanje	f
00030000-5628-c57c-4bd5-b5bddfa553ea	ProdajaPredstave-read	ProdajaPredstave - branje	f
00030000-5628-c57c-1f70-518707dc0cf2	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	f
00030000-5628-c57c-1589-3a4a6deddae5	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	f
00030000-5628-c57c-f951-c3a23a90a867	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	f
00030000-5628-c57c-5f3e-d1eb6d603da2	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	f
00030000-5628-c57c-ca9b-994b1034457d	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	f
00030000-5628-c57c-dd57-93e6aaf64b3a	ProgramDela-read	ProgramDela - branje	f
00030000-5628-c57c-a1e8-03c69d2da09e	ProgramDela-write	ProgramDela - spreminjanje	f
00030000-5628-c57c-6819-863e9984e443	ProgramFestival-read	ProgramFestival - branje	f
00030000-5628-c57c-0bf0-37e09ebf3088	ProgramFestival-write	ProgramFestival - spreminjanje	f
00030000-5628-c57c-fa18-c470dc9d1a49	ProgramGostovanje-read	ProgramGostovanje - branje	f
00030000-5628-c57c-b557-f0441b7e0ad5	ProgramGostovanje-write	ProgramGostovanje - spreminjanje	f
00030000-5628-c57c-e050-7a0269728255	ProgramGostujoca-read	ProgramGostujoca - branje	f
00030000-5628-c57c-fb9e-07f0d00ca9a8	ProgramGostujoca-write	ProgramGostujoca - spreminjanje	f
00030000-5628-c57c-eacb-9c6d4aa9b9aa	ProgramIzjemni-read	ProgramIzjemni - branje	f
00030000-5628-c57c-1603-82816dd8c60c	ProgramIzjemni-write	ProgramIzjemni - spreminjanje	f
00030000-5628-c57c-52d7-f35afd5dea63	ProgramPonovitevPrejsnjih-read	ProgramPonovitevPrejsnjih - branje	f
00030000-5628-c57c-1aa0-60f23992160b	ProgramPonovitevPrejsnjih-write	ProgramPonovitevPrejsnjih - spreminjanje	f
00030000-5628-c57c-9854-21a1869ee467	ProgramPonovitevPremiere-read	ProgramPonovitevPremiere - branje	f
00030000-5628-c57c-3c18-081587866d14	ProgramPonovitevPremiere-write	ProgramPonovitevPremiere - spreminjanje	f
00030000-5628-c57c-b5dc-a3ace01e08ce	ProgramPremiera-read	ProgramPremiera - branje	f
00030000-5628-c57c-0ebc-80acfedb1945	ProgramPremiera-write	ProgramPremiera - spreminjanje	f
00030000-5628-c57c-6d08-41300cf35864	ProgramRazno-read	ProgramRazno - branje	f
00030000-5628-c57c-f4fe-67401ec2dfe2	ProgramRazno-write	ProgramRazno - spreminjanje	f
00030000-5628-c57c-6eae-913ef9aafdb2	ProgramskaEnotaSklopa-read	ProgramskaEnotaSklopa - branje	f
00030000-5628-c57c-6898-2b62cbf76dce	ProgramskaEnotaSklopa-write	ProgramskaEnotaSklopa - spreminjanje	f
00030000-5628-c57c-90b7-d416e1259bc8	Prostor-read	Prostor - branje	f
00030000-5628-c57c-b244-8cd19428d4c9	Prostor-write	Prostor - spreminjanje	f
00030000-5628-c57c-6403-b3f420da770c	Racun-read	Racun - branje	f
00030000-5628-c57c-1d3d-7a608cf21dc8	Racun-write	Racun - spreminjanje	f
00030000-5628-c57c-d665-b0871b2ecc75	RazpisanSedez-read	RazpisanSedez - branje	f
00030000-5628-c57c-720b-5b68a40cf5b8	RazpisanSedez-write	RazpisanSedez - spreminjanje	f
00030000-5628-c57c-2f26-81764e244d7e	Rekviziterstvo-read	Rekviziterstvo - branje	f
00030000-5628-c57c-341c-4efa4c7601a6	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	f
00030000-5628-c57c-1ab7-cf37078e5187	Rekvizit-read	Rekvizit - branje	f
00030000-5628-c57c-f7dd-f5891caadcd0	Rekvizit-write	Rekvizit - spreminjanje	f
00030000-5628-c57c-2948-9aad52e2e0ac	Revizija-read	Revizija - branje	f
00030000-5628-c57c-a981-e2548c688732	Revizija-write	Revizija - spreminjanje	f
00030000-5628-c57c-4c68-417b825a71b5	Rezervacija-read	Rezervacija - branje	f
00030000-5628-c57c-0d17-19a99d449cc1	Rezervacija-write	Rezervacija - spreminjanje	f
00030000-5628-c57c-bc7a-649821a76197	SedezniRed-read	SedezniRed - branje	f
00030000-5628-c57c-d1db-ac9721a1379d	SedezniRed-write	SedezniRed - spreminjanje	f
00030000-5628-c57c-7d06-f94ad873277f	Sedez-read	Sedez - branje	f
00030000-5628-c57c-c9ed-2fcfc2eb7c65	Sedez-write	Sedez - spreminjanje	f
00030000-5628-c57c-1e0f-e1b155f552a6	Sezona-read	Sezona - branje	f
00030000-5628-c57c-7317-2360c0e92ca4	Sezona-write	Sezona - spreminjanje	f
00030000-5628-c57c-15c0-215de494e01f	StevilcenjeKonfig-read	StevilcenjeKonfig - branje	f
00030000-5628-c57c-03da-08ab4dcd978e	StevilcenjeKonfig-write	StevilcenjeKonfig - spreminjanje	f
00030000-5628-c57c-b3f9-6b4800bd6515	Stevilcenje-read	Stevilcenje - branje	f
00030000-5628-c57c-c821-45703de7be9a	Stevilcenje-write	Stevilcenje - spreminjanje	f
00030000-5628-c57c-50e3-3f9736b7185f	StevilcenjeStanje-read	StevilcenjeStanje - branje	f
00030000-5628-c57c-ab29-50c948586c52	StevilcenjeStanje-write	StevilcenjeStanje - spreminjanje	f
00030000-5628-c57c-c1df-ab2dd9ac3b01	StrosekUprizoritve-read	StrosekUprizoritve - branje	f
00030000-5628-c57c-2e74-eb0856c8d317	StrosekUprizoritve-write	StrosekUprizoritve - spreminjanje	f
00030000-5628-c57c-e4b7-a720b86d0fd9	Telefonska-read	Telefonska - branje	f
00030000-5628-c57c-53ed-5eed5dc68a5e	Telefonska-write	Telefonska - spreminjanje	f
00030000-5628-c57c-8333-4291eb53eede	TerminStoritve-read	TerminStoritve - branje	f
00030000-5628-c57c-6f93-3fd890be8904	TerminStoritve-write	TerminStoritve - spreminjanje	f
00030000-5628-c57c-7ec2-787a0d98f230	TipFunkcije-read	TipFunkcije - branje	f
00030000-5628-c57c-18b2-a238b2fc9a70	TipFunkcije-write	TipFunkcije - spreminjanje	f
00030000-5628-c57c-d725-27ef99f72ba4	TipPopa-read	TipPopa - branje	f
00030000-5628-c57c-775b-912522abb8a4	TipPopa-write	TipPopa - spreminjanje	f
00030000-5628-c57c-9f30-fc50e2878a08	TipProgramskeEnote-read	TipProgramskeEnote - branje	f
00030000-5628-c57c-7bd4-37fde266149f	TipProgramskeEnote-write	TipProgramskeEnote - spreminjanje	f
00030000-5628-c57c-42bc-b4a1bcaac4cf	TipVaje-read	TipVaje - branje	f
00030000-5628-c57c-9332-8b5f9a8ea1f0	TipVaje-write	TipVaje - spreminjanje	f
00030000-5628-c57c-406b-da07cc81ee8f	Trr-read	Trr - branje	f
00030000-5628-c57c-4ba6-857c4a78ce11	Trr-write	Trr - spreminjanje	f
00030000-5628-c57c-cbc0-3a7461737d1b	Uprizoritev-read	Uprizoritev - branje	f
00030000-5628-c57c-8fe4-619ea44ad7bf	Uprizoritev-write	Uprizoritev - spreminjanje	f
00030000-5628-c57c-dc03-68caab7ee752	Vaja-read	Vaja - branje	f
00030000-5628-c57c-00a8-1fd46290d215	Vaja-write	Vaja - spreminjanje	f
00030000-5628-c57c-a3b0-5696f11b29e4	VrstaSedezev-read	VrstaSedezev - branje	f
00030000-5628-c57c-fe52-b39561e3347b	VrstaSedezev-write	VrstaSedezev - spreminjanje	f
00030000-5628-c57c-76fd-869293110a4f	VrstaStroska-read	VrstaStroska - branje	f
00030000-5628-c57c-9c4f-ba666ef6cb69	VrstaStroska-write	VrstaStroska - spreminjanje	f
00030000-5628-c57c-5ffa-f40b72e85903	Zaposlitev-read	Zaposlitev - branje	f
00030000-5628-c57c-c9c5-de731eef28c8	Zaposlitev-write	Zaposlitev - spreminjanje	f
00030000-5628-c57c-b7fa-e045846b6e31	Zasedenost-read	Zasedenost - branje	f
00030000-5628-c57c-ebbb-d836e13ee7d4	Zasedenost-write	Zasedenost - spreminjanje	f
00030000-5628-c57c-92be-9dfc3995496c	ZvrstSurs-read	ZvrstSurs - branje	f
00030000-5628-c57c-9ebd-d7d40e8edbbc	ZvrstSurs-write	ZvrstSurs - spreminjanje	f
00030000-5628-c57c-4048-f430c5e78591	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	f
00030000-5628-c57c-2cdb-a002bb5d3f24	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	f
00030000-5628-c57c-8e89-6b82e6457f1d	Job-read	Branje opravil - samo zase - branje	f
00030000-5628-c57c-8c2a-9ec272f170bc	Job-write	Dodajanje in spreminjanje opravil - samo zase	f
00030000-5628-c57c-f648-415f75b35289	Job-admin	Upravljanje opravil za vse uporabnike	f
00030000-5628-c57c-fefc-0c6cca823d15	Mapa-write	Mapa - osnovno dovoljenje za pisanje	f
00030000-5628-c57c-96c9-7b4d48ee8b2e	Mapa-read	Mapa - osnovno dovoljenje za branje	f
00030000-5628-c57c-4100-3fe7ba8a8425	MapaAcl-write	MapaAcl - dovoljenje za dostop pisanje ACL-jev mape	f
00030000-5628-c57c-79ed-b23cc469f811	MapaAcl-read	MapaAcl - dovoljenje za dostop branje ACL-jev mape	f
00030000-5628-c57c-77f7-5878d0a6e1e6	Zapis-write	Zapis - dovoljenje za pisanje zapisov	f
00030000-5628-c57c-db10-093c30931be6	Zapis-read	Zapis - dovoljenje za pisanje zapisov	f
00030000-5628-c57c-670c-f6d3a758a226	ZapisLastnik-write	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	f
00030000-5628-c57c-3fd2-788d13af8986	ZapisLastnik-read	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	f
00030000-5628-c57c-926b-87740be8583d	VrstaZapisa-write	Šifrant vrst zapisa - spreminjanje	f
00030000-5628-c57c-7ab7-81d5d8124f25	VrstaZapisa-read	Šifrant vrst zapisa - branje	f
00030000-5628-c57c-e1bf-a950e696f532	Datoteka-write	Datoteka - spreminjanje	f
00030000-5628-c57c-5350-1f9f66f1800d	Datoteka-read	Datoteke - branje	f
\.


--
-- TOC entry 3054 (class 0 OID 23143813)
-- Dependencies: 179
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-5628-c57c-7e0e-c3c341131391	00030000-5628-c57c-cbef-ed5f0854eed8
00020000-5628-c57c-53eb-f5c00bc6ab53	00030000-5628-c57c-4320-1c4a6d621ec1
00020000-5628-c57c-cc60-7478b66e2353	00030000-5628-c57c-cfee-4877ce8ada40
00020000-5628-c57c-cc60-7478b66e2353	00030000-5628-c57c-148a-dfedc28dbeff
00020000-5628-c57c-cc60-7478b66e2353	00030000-5628-c57c-9919-da19d30525ea
00020000-5628-c57c-cc60-7478b66e2353	00030000-5628-c57c-aacd-81b2aba29242
00020000-5628-c57c-cc60-7478b66e2353	00030000-5628-c57c-35ac-a024dbd2d041
00020000-5628-c57c-cc60-7478b66e2353	00030000-5628-c57c-0f07-f46cd3f84686
00020000-5628-c57c-cc60-7478b66e2353	00030000-5628-c57c-c502-941b867d701e
00020000-5628-c57c-cc60-7478b66e2353	00030000-5628-c57c-3250-d81fa0b349f8
00020000-5628-c57c-cc60-7478b66e2353	00030000-5628-c57c-4320-1c4a6d621ec1
00020000-5628-c57c-cc60-7478b66e2353	00030000-5628-c57c-4b5b-54185c41159d
00020000-5628-c57c-cc60-7478b66e2353	00030000-5628-c57c-74f6-b0b1df9d74e2
00020000-5628-c57c-cc60-7478b66e2353	00030000-5628-c57c-373f-de52839482c7
00020000-5628-c57c-cc60-7478b66e2353	00030000-5628-c57c-44d1-16f0c21a8466
00020000-5628-c57c-cc60-7478b66e2353	00030000-5628-c57c-59bf-fd79d4015301
00020000-5628-c57c-cc60-7478b66e2353	00030000-5628-c57c-36bf-62a9f2600042
00020000-5628-c57c-cc60-7478b66e2353	00030000-5628-c57c-a0a1-a226a833f216
00020000-5628-c57c-cc60-7478b66e2353	00030000-5628-c57c-e2ad-e7e852c8c610
00020000-5628-c57c-cc60-7478b66e2353	00030000-5628-c57c-c6cf-0acac76cc36c
00020000-5628-c57c-cc60-7478b66e2353	00030000-5628-c57c-39e5-86d0d5ed85b4
00020000-5628-c57c-cc60-7478b66e2353	00030000-5628-c57c-f021-9be352e25f4f
00020000-5628-c57c-cc60-7478b66e2353	00030000-5628-c57c-e26c-1092b03a61cd
00020000-5628-c57c-cc60-7478b66e2353	00030000-5628-c57c-8cae-3510d0c2ebd1
00020000-5628-c57c-cc60-7478b66e2353	00030000-5628-c57c-e2ff-a1e069d78d7d
00020000-5628-c57c-cc60-7478b66e2353	00030000-5628-c57c-9bf9-13e3559eaeec
00020000-5628-c57c-cc60-7478b66e2353	00030000-5628-c57c-9ca3-2df164fb8535
00020000-5628-c57c-cc60-7478b66e2353	00030000-5628-c57c-3604-7f148bf27ae7
00020000-5628-c57c-cc60-7478b66e2353	00030000-5628-c57c-2829-7e8c83e4d287
00020000-5628-c57c-cc60-7478b66e2353	00030000-5628-c57c-f21c-429168502847
00020000-5628-c57c-cc60-7478b66e2353	00030000-5628-c57c-a882-0b29604d5ec7
00020000-5628-c57c-cc60-7478b66e2353	00030000-5628-c57c-fb50-27bad5270a3d
00020000-5628-c57c-cc60-7478b66e2353	00030000-5628-c57c-5f3e-d1eb6d603da2
00020000-5628-c57c-cc60-7478b66e2353	00030000-5628-c57c-ca9b-994b1034457d
00020000-5628-c57c-cc60-7478b66e2353	00030000-5628-c57c-90b7-d416e1259bc8
00020000-5628-c57c-cc60-7478b66e2353	00030000-5628-c57c-b244-8cd19428d4c9
00020000-5628-c57c-cc60-7478b66e2353	00030000-5628-c57c-2f26-81764e244d7e
00020000-5628-c57c-cc60-7478b66e2353	00030000-5628-c57c-341c-4efa4c7601a6
00020000-5628-c57c-cc60-7478b66e2353	00030000-5628-c57c-1ab7-cf37078e5187
00020000-5628-c57c-cc60-7478b66e2353	00030000-5628-c57c-f7dd-f5891caadcd0
00020000-5628-c57c-cc60-7478b66e2353	00030000-5628-c57c-1e0f-e1b155f552a6
00020000-5628-c57c-cc60-7478b66e2353	00030000-5628-c57c-7317-2360c0e92ca4
00020000-5628-c57c-cc60-7478b66e2353	00030000-5628-c57c-7ec2-787a0d98f230
00020000-5628-c57c-cc60-7478b66e2353	00030000-5628-c57c-cbc0-3a7461737d1b
00020000-5628-c57c-cc60-7478b66e2353	00030000-5628-c57c-8fe4-619ea44ad7bf
00020000-5628-c57c-cc60-7478b66e2353	00030000-5628-c57c-dc03-68caab7ee752
00020000-5628-c57c-cc60-7478b66e2353	00030000-5628-c57c-00a8-1fd46290d215
00020000-5628-c57c-cc60-7478b66e2353	00030000-5628-c57c-b7fa-e045846b6e31
00020000-5628-c57c-cc60-7478b66e2353	00030000-5628-c57c-ebbb-d836e13ee7d4
00020000-5628-c57c-cc60-7478b66e2353	00030000-5628-c57c-92be-9dfc3995496c
00020000-5628-c57c-cc60-7478b66e2353	00030000-5628-c57c-4048-f430c5e78591
00020000-5628-c57d-f10b-b5170fad65cf	00030000-5628-c57c-cfee-4877ce8ada40
00020000-5628-c57d-f10b-b5170fad65cf	00030000-5628-c57c-35ac-a024dbd2d041
00020000-5628-c57d-f10b-b5170fad65cf	00030000-5628-c57c-0f07-f46cd3f84686
00020000-5628-c57d-f10b-b5170fad65cf	00030000-5628-c57c-4320-1c4a6d621ec1
00020000-5628-c57d-f10b-b5170fad65cf	00030000-5628-c57c-44d1-16f0c21a8466
00020000-5628-c57d-f10b-b5170fad65cf	00030000-5628-c57c-36bf-62a9f2600042
00020000-5628-c57d-f10b-b5170fad65cf	00030000-5628-c57c-e2ad-e7e852c8c610
00020000-5628-c57d-f10b-b5170fad65cf	00030000-5628-c57c-c6cf-0acac76cc36c
00020000-5628-c57d-f10b-b5170fad65cf	00030000-5628-c57c-39e5-86d0d5ed85b4
00020000-5628-c57d-f10b-b5170fad65cf	00030000-5628-c57c-f021-9be352e25f4f
00020000-5628-c57d-f10b-b5170fad65cf	00030000-5628-c57c-e26c-1092b03a61cd
00020000-5628-c57d-f10b-b5170fad65cf	00030000-5628-c57c-8cae-3510d0c2ebd1
00020000-5628-c57d-f10b-b5170fad65cf	00030000-5628-c57c-e2ff-a1e069d78d7d
00020000-5628-c57d-f10b-b5170fad65cf	00030000-5628-c57c-9ca3-2df164fb8535
00020000-5628-c57d-f10b-b5170fad65cf	00030000-5628-c57c-2829-7e8c83e4d287
00020000-5628-c57d-f10b-b5170fad65cf	00030000-5628-c57c-f21c-429168502847
00020000-5628-c57d-f10b-b5170fad65cf	00030000-5628-c57c-a882-0b29604d5ec7
00020000-5628-c57d-f10b-b5170fad65cf	00030000-5628-c57c-90b7-d416e1259bc8
00020000-5628-c57d-f10b-b5170fad65cf	00030000-5628-c57c-2f26-81764e244d7e
00020000-5628-c57d-f10b-b5170fad65cf	00030000-5628-c57c-1ab7-cf37078e5187
00020000-5628-c57d-f10b-b5170fad65cf	00030000-5628-c57c-1e0f-e1b155f552a6
00020000-5628-c57d-f10b-b5170fad65cf	00030000-5628-c57c-e4b7-a720b86d0fd9
00020000-5628-c57d-f10b-b5170fad65cf	00030000-5628-c57c-53ed-5eed5dc68a5e
00020000-5628-c57d-f10b-b5170fad65cf	00030000-5628-c57c-406b-da07cc81ee8f
00020000-5628-c57d-f10b-b5170fad65cf	00030000-5628-c57c-4ba6-857c4a78ce11
00020000-5628-c57d-f10b-b5170fad65cf	00030000-5628-c57c-5ffa-f40b72e85903
00020000-5628-c57d-f10b-b5170fad65cf	00030000-5628-c57c-c9c5-de731eef28c8
00020000-5628-c57d-f10b-b5170fad65cf	00030000-5628-c57c-92be-9dfc3995496c
00020000-5628-c57d-f10b-b5170fad65cf	00030000-5628-c57c-4048-f430c5e78591
00020000-5628-c57d-1e9d-9212fe7ee7c1	00030000-5628-c57c-cfee-4877ce8ada40
00020000-5628-c57d-1e9d-9212fe7ee7c1	00030000-5628-c57c-9919-da19d30525ea
00020000-5628-c57d-1e9d-9212fe7ee7c1	00030000-5628-c57c-35ac-a024dbd2d041
00020000-5628-c57d-1e9d-9212fe7ee7c1	00030000-5628-c57c-cc08-ad3b1a0cdc3b
00020000-5628-c57d-1e9d-9212fe7ee7c1	00030000-5628-c57c-7a08-3a531c49a325
00020000-5628-c57d-1e9d-9212fe7ee7c1	00030000-5628-c57c-7c25-211e8acb4a85
00020000-5628-c57d-1e9d-9212fe7ee7c1	00030000-5628-c57c-0f07-f46cd3f84686
00020000-5628-c57d-1e9d-9212fe7ee7c1	00030000-5628-c57c-4320-1c4a6d621ec1
00020000-5628-c57d-1e9d-9212fe7ee7c1	00030000-5628-c57c-74f6-b0b1df9d74e2
00020000-5628-c57d-1e9d-9212fe7ee7c1	00030000-5628-c57c-44d1-16f0c21a8466
00020000-5628-c57d-1e9d-9212fe7ee7c1	00030000-5628-c57c-36bf-62a9f2600042
00020000-5628-c57d-1e9d-9212fe7ee7c1	00030000-5628-c57c-e2ad-e7e852c8c610
00020000-5628-c57d-1e9d-9212fe7ee7c1	00030000-5628-c57c-39e5-86d0d5ed85b4
00020000-5628-c57d-1e9d-9212fe7ee7c1	00030000-5628-c57c-f021-9be352e25f4f
00020000-5628-c57d-1e9d-9212fe7ee7c1	00030000-5628-c57c-e26c-1092b03a61cd
00020000-5628-c57d-1e9d-9212fe7ee7c1	00030000-5628-c57c-e2ff-a1e069d78d7d
00020000-5628-c57d-1e9d-9212fe7ee7c1	00030000-5628-c57c-9ca3-2df164fb8535
00020000-5628-c57d-1e9d-9212fe7ee7c1	00030000-5628-c57c-a882-0b29604d5ec7
00020000-5628-c57d-1e9d-9212fe7ee7c1	00030000-5628-c57c-5f3e-d1eb6d603da2
00020000-5628-c57d-1e9d-9212fe7ee7c1	00030000-5628-c57c-90b7-d416e1259bc8
00020000-5628-c57d-1e9d-9212fe7ee7c1	00030000-5628-c57c-2f26-81764e244d7e
00020000-5628-c57d-1e9d-9212fe7ee7c1	00030000-5628-c57c-1ab7-cf37078e5187
00020000-5628-c57d-1e9d-9212fe7ee7c1	00030000-5628-c57c-1e0f-e1b155f552a6
00020000-5628-c57d-1e9d-9212fe7ee7c1	00030000-5628-c57c-7ec2-787a0d98f230
00020000-5628-c57d-1e9d-9212fe7ee7c1	00030000-5628-c57c-dc03-68caab7ee752
00020000-5628-c57d-1e9d-9212fe7ee7c1	00030000-5628-c57c-b7fa-e045846b6e31
00020000-5628-c57d-1e9d-9212fe7ee7c1	00030000-5628-c57c-92be-9dfc3995496c
00020000-5628-c57d-1e9d-9212fe7ee7c1	00030000-5628-c57c-4048-f430c5e78591
00020000-5628-c57d-afa4-717983e83d78	00030000-5628-c57c-cfee-4877ce8ada40
00020000-5628-c57d-afa4-717983e83d78	00030000-5628-c57c-148a-dfedc28dbeff
00020000-5628-c57d-afa4-717983e83d78	00030000-5628-c57c-aacd-81b2aba29242
00020000-5628-c57d-afa4-717983e83d78	00030000-5628-c57c-35ac-a024dbd2d041
00020000-5628-c57d-afa4-717983e83d78	00030000-5628-c57c-0f07-f46cd3f84686
00020000-5628-c57d-afa4-717983e83d78	00030000-5628-c57c-4320-1c4a6d621ec1
00020000-5628-c57d-afa4-717983e83d78	00030000-5628-c57c-44d1-16f0c21a8466
00020000-5628-c57d-afa4-717983e83d78	00030000-5628-c57c-36bf-62a9f2600042
00020000-5628-c57d-afa4-717983e83d78	00030000-5628-c57c-39e5-86d0d5ed85b4
00020000-5628-c57d-afa4-717983e83d78	00030000-5628-c57c-f021-9be352e25f4f
00020000-5628-c57d-afa4-717983e83d78	00030000-5628-c57c-e2ff-a1e069d78d7d
00020000-5628-c57d-afa4-717983e83d78	00030000-5628-c57c-9ca3-2df164fb8535
00020000-5628-c57d-afa4-717983e83d78	00030000-5628-c57c-a882-0b29604d5ec7
00020000-5628-c57d-afa4-717983e83d78	00030000-5628-c57c-90b7-d416e1259bc8
00020000-5628-c57d-afa4-717983e83d78	00030000-5628-c57c-2f26-81764e244d7e
00020000-5628-c57d-afa4-717983e83d78	00030000-5628-c57c-1ab7-cf37078e5187
00020000-5628-c57d-afa4-717983e83d78	00030000-5628-c57c-1e0f-e1b155f552a6
00020000-5628-c57d-afa4-717983e83d78	00030000-5628-c57c-7ec2-787a0d98f230
00020000-5628-c57d-afa4-717983e83d78	00030000-5628-c57c-92be-9dfc3995496c
00020000-5628-c57d-afa4-717983e83d78	00030000-5628-c57c-4048-f430c5e78591
00020000-5628-c57d-56b3-8dde30df0985	00030000-5628-c57c-cfee-4877ce8ada40
00020000-5628-c57d-56b3-8dde30df0985	00030000-5628-c57c-35ac-a024dbd2d041
00020000-5628-c57d-56b3-8dde30df0985	00030000-5628-c57c-0f07-f46cd3f84686
00020000-5628-c57d-56b3-8dde30df0985	00030000-5628-c57c-4320-1c4a6d621ec1
00020000-5628-c57d-56b3-8dde30df0985	00030000-5628-c57c-44d1-16f0c21a8466
00020000-5628-c57d-56b3-8dde30df0985	00030000-5628-c57c-36bf-62a9f2600042
00020000-5628-c57d-56b3-8dde30df0985	00030000-5628-c57c-39e5-86d0d5ed85b4
00020000-5628-c57d-56b3-8dde30df0985	00030000-5628-c57c-f021-9be352e25f4f
00020000-5628-c57d-56b3-8dde30df0985	00030000-5628-c57c-e2ff-a1e069d78d7d
00020000-5628-c57d-56b3-8dde30df0985	00030000-5628-c57c-9ca3-2df164fb8535
00020000-5628-c57d-56b3-8dde30df0985	00030000-5628-c57c-a882-0b29604d5ec7
00020000-5628-c57d-56b3-8dde30df0985	00030000-5628-c57c-90b7-d416e1259bc8
00020000-5628-c57d-56b3-8dde30df0985	00030000-5628-c57c-2f26-81764e244d7e
00020000-5628-c57d-56b3-8dde30df0985	00030000-5628-c57c-1ab7-cf37078e5187
00020000-5628-c57d-56b3-8dde30df0985	00030000-5628-c57c-1e0f-e1b155f552a6
00020000-5628-c57d-56b3-8dde30df0985	00030000-5628-c57c-8333-4291eb53eede
00020000-5628-c57d-56b3-8dde30df0985	00030000-5628-c57c-7fef-3ced967fe7ad
00020000-5628-c57d-56b3-8dde30df0985	00030000-5628-c57c-7ec2-787a0d98f230
00020000-5628-c57d-56b3-8dde30df0985	00030000-5628-c57c-92be-9dfc3995496c
00020000-5628-c57d-56b3-8dde30df0985	00030000-5628-c57c-4048-f430c5e78591
00020000-5628-c57f-bc50-4779b2e740ea	00030000-5628-c57c-72df-4242b445171e
00020000-5628-c57f-bc50-4779b2e740ea	00030000-5628-c57c-cbef-ed5f0854eed8
00020000-5628-c57f-bc50-4779b2e740ea	00030000-5628-c57c-cfee-4877ce8ada40
00020000-5628-c57f-bc50-4779b2e740ea	00030000-5628-c57c-148a-dfedc28dbeff
00020000-5628-c57f-bc50-4779b2e740ea	00030000-5628-c57c-9919-da19d30525ea
00020000-5628-c57f-bc50-4779b2e740ea	00030000-5628-c57c-aacd-81b2aba29242
00020000-5628-c57f-bc50-4779b2e740ea	00030000-5628-c57c-35ac-a024dbd2d041
00020000-5628-c57f-bc50-4779b2e740ea	00030000-5628-c57c-cc08-ad3b1a0cdc3b
00020000-5628-c57f-bc50-4779b2e740ea	00030000-5628-c57c-ae06-8621ec61d5d9
00020000-5628-c57f-bc50-4779b2e740ea	00030000-5628-c57c-52e9-b9a0cab5b414
00020000-5628-c57f-bc50-4779b2e740ea	00030000-5628-c57c-7a08-3a531c49a325
00020000-5628-c57f-bc50-4779b2e740ea	00030000-5628-c57c-f2c1-fd936d9e8079
00020000-5628-c57f-bc50-4779b2e740ea	00030000-5628-c57c-7c25-211e8acb4a85
00020000-5628-c57f-bc50-4779b2e740ea	00030000-5628-c57c-451a-198fec46dc82
00020000-5628-c57f-bc50-4779b2e740ea	00030000-5628-c57c-0f07-f46cd3f84686
00020000-5628-c57f-bc50-4779b2e740ea	00030000-5628-c57c-c502-941b867d701e
00020000-5628-c57f-bc50-4779b2e740ea	00030000-5628-c57c-3250-d81fa0b349f8
00020000-5628-c57f-bc50-4779b2e740ea	00030000-5628-c57c-7727-efe878581768
00020000-5628-c57f-bc50-4779b2e740ea	00030000-5628-c57c-dcc9-d39d3c1971b1
00020000-5628-c57f-bc50-4779b2e740ea	00030000-5628-c57c-4320-1c4a6d621ec1
00020000-5628-c57f-bc50-4779b2e740ea	00030000-5628-c57c-4b5b-54185c41159d
00020000-5628-c57f-bc50-4779b2e740ea	00030000-5628-c57c-a597-e6bb7f2c712a
00020000-5628-c57f-bc50-4779b2e740ea	00030000-5628-c57c-afe0-e0c299f768f6
00020000-5628-c57f-bc50-4779b2e740ea	00030000-5628-c57c-74f6-b0b1df9d74e2
00020000-5628-c57f-bc50-4779b2e740ea	00030000-5628-c57c-373f-de52839482c7
00020000-5628-c57f-bc50-4779b2e740ea	00030000-5628-c57c-44d1-16f0c21a8466
00020000-5628-c57f-bc50-4779b2e740ea	00030000-5628-c57c-59bf-fd79d4015301
00020000-5628-c57f-bc50-4779b2e740ea	00030000-5628-c57c-36bf-62a9f2600042
00020000-5628-c57f-bc50-4779b2e740ea	00030000-5628-c57c-a0a1-a226a833f216
00020000-5628-c57f-bc50-4779b2e740ea	00030000-5628-c57c-e2ad-e7e852c8c610
00020000-5628-c57f-bc50-4779b2e740ea	00030000-5628-c57c-c6cf-0acac76cc36c
00020000-5628-c57f-bc50-4779b2e740ea	00030000-5628-c57c-1ebd-5006a2df7a1c
00020000-5628-c57f-bc50-4779b2e740ea	00030000-5628-c57c-458d-d37dd84deecc
00020000-5628-c57f-bc50-4779b2e740ea	00030000-5628-c57c-3d7e-13d29181285a
00020000-5628-c57f-bc50-4779b2e740ea	00030000-5628-c57c-8d93-a196058a60fd
00020000-5628-c57f-bc50-4779b2e740ea	00030000-5628-c57c-39e5-86d0d5ed85b4
00020000-5628-c57f-bc50-4779b2e740ea	00030000-5628-c57c-f021-9be352e25f4f
00020000-5628-c57f-bc50-4779b2e740ea	00030000-5628-c57c-9ff9-c8b130f7630e
00020000-5628-c57f-bc50-4779b2e740ea	00030000-5628-c57c-08cc-aec95dea9538
00020000-5628-c57f-bc50-4779b2e740ea	00030000-5628-c57c-6252-d47d69f12f8f
00020000-5628-c57f-bc50-4779b2e740ea	00030000-5628-c57c-7ac9-eeda0c57fadd
00020000-5628-c57f-bc50-4779b2e740ea	00030000-5628-c57c-e26c-1092b03a61cd
00020000-5628-c57f-bc50-4779b2e740ea	00030000-5628-c57c-4c11-bf7ec3800237
00020000-5628-c57f-bc50-4779b2e740ea	00030000-5628-c57c-8cae-3510d0c2ebd1
00020000-5628-c57f-bc50-4779b2e740ea	00030000-5628-c57c-d102-2230bd129b85
00020000-5628-c57f-bc50-4779b2e740ea	00030000-5628-c57c-504a-135ab6363cad
00020000-5628-c57f-bc50-4779b2e740ea	00030000-5628-c57c-70b5-edfbe353f85e
00020000-5628-c57f-bc50-4779b2e740ea	00030000-5628-c57c-8f66-58330e1e3a08
00020000-5628-c57f-bc50-4779b2e740ea	00030000-5628-c57c-b536-0abbf21dc67b
00020000-5628-c57f-bc50-4779b2e740ea	00030000-5628-c57c-5d69-21de4527e39f
00020000-5628-c57f-bc50-4779b2e740ea	00030000-5628-c57c-e2ff-a1e069d78d7d
00020000-5628-c57f-bc50-4779b2e740ea	00030000-5628-c57c-9bf9-13e3559eaeec
00020000-5628-c57f-bc50-4779b2e740ea	00030000-5628-c57c-9ca3-2df164fb8535
00020000-5628-c57f-bc50-4779b2e740ea	00030000-5628-c57c-b026-ca57ced09938
00020000-5628-c57f-bc50-4779b2e740ea	00030000-5628-c57c-828a-8114531f1ac0
00020000-5628-c57f-bc50-4779b2e740ea	00030000-5628-c57c-cf7e-dc9e37011b54
00020000-5628-c57f-bc50-4779b2e740ea	00030000-5628-c57c-62c8-747477fd00fc
00020000-5628-c57f-bc50-4779b2e740ea	00030000-5628-c57c-3604-7f148bf27ae7
00020000-5628-c57f-bc50-4779b2e740ea	00030000-5628-c57c-2829-7e8c83e4d287
00020000-5628-c57f-bc50-4779b2e740ea	00030000-5628-c57c-f21c-429168502847
00020000-5628-c57f-bc50-4779b2e740ea	00030000-5628-c57c-8b13-71b5b1cbc4fe
00020000-5628-c57f-bc50-4779b2e740ea	00030000-5628-c57c-7f4e-d5766e4ccbae
00020000-5628-c57f-bc50-4779b2e740ea	00030000-5628-c57c-a882-0b29604d5ec7
00020000-5628-c57f-bc50-4779b2e740ea	00030000-5628-c57c-fb50-27bad5270a3d
00020000-5628-c57f-bc50-4779b2e740ea	00030000-5628-c57c-4bd5-b5bddfa553ea
00020000-5628-c57f-bc50-4779b2e740ea	00030000-5628-c57c-1f70-518707dc0cf2
00020000-5628-c57f-bc50-4779b2e740ea	00030000-5628-c57c-1589-3a4a6deddae5
00020000-5628-c57f-bc50-4779b2e740ea	00030000-5628-c57c-f951-c3a23a90a867
00020000-5628-c57f-bc50-4779b2e740ea	00030000-5628-c57c-5f3e-d1eb6d603da2
00020000-5628-c57f-bc50-4779b2e740ea	00030000-5628-c57c-ca9b-994b1034457d
00020000-5628-c57f-bc50-4779b2e740ea	00030000-5628-c57c-007e-c068ac1012d1
00020000-5628-c57f-bc50-4779b2e740ea	00030000-5628-c57c-dd57-93e6aaf64b3a
00020000-5628-c57f-bc50-4779b2e740ea	00030000-5628-c57c-87e0-547e3059d4cb
00020000-5628-c57f-bc50-4779b2e740ea	00030000-5628-c57c-a1e8-03c69d2da09e
00020000-5628-c57f-bc50-4779b2e740ea	00030000-5628-c57c-6819-863e9984e443
00020000-5628-c57f-bc50-4779b2e740ea	00030000-5628-c57c-0bf0-37e09ebf3088
00020000-5628-c57f-bc50-4779b2e740ea	00030000-5628-c57c-fa18-c470dc9d1a49
00020000-5628-c57f-bc50-4779b2e740ea	00030000-5628-c57c-b557-f0441b7e0ad5
00020000-5628-c57f-bc50-4779b2e740ea	00030000-5628-c57c-e050-7a0269728255
00020000-5628-c57f-bc50-4779b2e740ea	00030000-5628-c57c-fb9e-07f0d00ca9a8
00020000-5628-c57f-bc50-4779b2e740ea	00030000-5628-c57c-eacb-9c6d4aa9b9aa
00020000-5628-c57f-bc50-4779b2e740ea	00030000-5628-c57c-1603-82816dd8c60c
00020000-5628-c57f-bc50-4779b2e740ea	00030000-5628-c57c-52d7-f35afd5dea63
00020000-5628-c57f-bc50-4779b2e740ea	00030000-5628-c57c-1aa0-60f23992160b
00020000-5628-c57f-bc50-4779b2e740ea	00030000-5628-c57c-9854-21a1869ee467
00020000-5628-c57f-bc50-4779b2e740ea	00030000-5628-c57c-3c18-081587866d14
00020000-5628-c57f-bc50-4779b2e740ea	00030000-5628-c57c-b5dc-a3ace01e08ce
00020000-5628-c57f-bc50-4779b2e740ea	00030000-5628-c57c-0ebc-80acfedb1945
00020000-5628-c57f-bc50-4779b2e740ea	00030000-5628-c57c-6d08-41300cf35864
00020000-5628-c57f-bc50-4779b2e740ea	00030000-5628-c57c-f4fe-67401ec2dfe2
00020000-5628-c57f-bc50-4779b2e740ea	00030000-5628-c57c-6eae-913ef9aafdb2
00020000-5628-c57f-bc50-4779b2e740ea	00030000-5628-c57c-6898-2b62cbf76dce
00020000-5628-c57f-bc50-4779b2e740ea	00030000-5628-c57c-90b7-d416e1259bc8
00020000-5628-c57f-bc50-4779b2e740ea	00030000-5628-c57c-b244-8cd19428d4c9
00020000-5628-c57f-bc50-4779b2e740ea	00030000-5628-c57c-6403-b3f420da770c
00020000-5628-c57f-bc50-4779b2e740ea	00030000-5628-c57c-1d3d-7a608cf21dc8
00020000-5628-c57f-bc50-4779b2e740ea	00030000-5628-c57c-d665-b0871b2ecc75
00020000-5628-c57f-bc50-4779b2e740ea	00030000-5628-c57c-720b-5b68a40cf5b8
00020000-5628-c57f-bc50-4779b2e740ea	00030000-5628-c57c-2f26-81764e244d7e
00020000-5628-c57f-bc50-4779b2e740ea	00030000-5628-c57c-341c-4efa4c7601a6
00020000-5628-c57f-bc50-4779b2e740ea	00030000-5628-c57c-1ab7-cf37078e5187
00020000-5628-c57f-bc50-4779b2e740ea	00030000-5628-c57c-f7dd-f5891caadcd0
00020000-5628-c57f-bc50-4779b2e740ea	00030000-5628-c57c-2948-9aad52e2e0ac
00020000-5628-c57f-bc50-4779b2e740ea	00030000-5628-c57c-a981-e2548c688732
00020000-5628-c57f-bc50-4779b2e740ea	00030000-5628-c57c-4c68-417b825a71b5
00020000-5628-c57f-bc50-4779b2e740ea	00030000-5628-c57c-0d17-19a99d449cc1
00020000-5628-c57f-bc50-4779b2e740ea	00030000-5628-c57c-bc7a-649821a76197
00020000-5628-c57f-bc50-4779b2e740ea	00030000-5628-c57c-d1db-ac9721a1379d
00020000-5628-c57f-bc50-4779b2e740ea	00030000-5628-c57c-7d06-f94ad873277f
00020000-5628-c57f-bc50-4779b2e740ea	00030000-5628-c57c-c9ed-2fcfc2eb7c65
00020000-5628-c57f-bc50-4779b2e740ea	00030000-5628-c57c-1e0f-e1b155f552a6
00020000-5628-c57f-bc50-4779b2e740ea	00030000-5628-c57c-7317-2360c0e92ca4
00020000-5628-c57f-bc50-4779b2e740ea	00030000-5628-c57c-15c0-215de494e01f
00020000-5628-c57f-bc50-4779b2e740ea	00030000-5628-c57c-03da-08ab4dcd978e
00020000-5628-c57f-bc50-4779b2e740ea	00030000-5628-c57c-b3f9-6b4800bd6515
00020000-5628-c57f-bc50-4779b2e740ea	00030000-5628-c57c-50e3-3f9736b7185f
00020000-5628-c57f-bc50-4779b2e740ea	00030000-5628-c57c-ab29-50c948586c52
00020000-5628-c57f-bc50-4779b2e740ea	00030000-5628-c57c-c821-45703de7be9a
00020000-5628-c57f-bc50-4779b2e740ea	00030000-5628-c57c-c1df-ab2dd9ac3b01
00020000-5628-c57f-bc50-4779b2e740ea	00030000-5628-c57c-2e74-eb0856c8d317
00020000-5628-c57f-bc50-4779b2e740ea	00030000-5628-c57c-e4b7-a720b86d0fd9
00020000-5628-c57f-bc50-4779b2e740ea	00030000-5628-c57c-53ed-5eed5dc68a5e
00020000-5628-c57f-bc50-4779b2e740ea	00030000-5628-c57c-8333-4291eb53eede
00020000-5628-c57f-bc50-4779b2e740ea	00030000-5628-c57c-7fef-3ced967fe7ad
00020000-5628-c57f-bc50-4779b2e740ea	00030000-5628-c57c-6f93-3fd890be8904
00020000-5628-c57f-bc50-4779b2e740ea	00030000-5628-c57c-7ec2-787a0d98f230
00020000-5628-c57f-bc50-4779b2e740ea	00030000-5628-c57c-18b2-a238b2fc9a70
00020000-5628-c57f-bc50-4779b2e740ea	00030000-5628-c57c-d725-27ef99f72ba4
00020000-5628-c57f-bc50-4779b2e740ea	00030000-5628-c57c-775b-912522abb8a4
00020000-5628-c57f-bc50-4779b2e740ea	00030000-5628-c57c-9f30-fc50e2878a08
00020000-5628-c57f-bc50-4779b2e740ea	00030000-5628-c57c-7bd4-37fde266149f
00020000-5628-c57f-bc50-4779b2e740ea	00030000-5628-c57c-42bc-b4a1bcaac4cf
00020000-5628-c57f-bc50-4779b2e740ea	00030000-5628-c57c-9332-8b5f9a8ea1f0
00020000-5628-c57f-bc50-4779b2e740ea	00030000-5628-c57c-406b-da07cc81ee8f
00020000-5628-c57f-bc50-4779b2e740ea	00030000-5628-c57c-4ba6-857c4a78ce11
00020000-5628-c57f-bc50-4779b2e740ea	00030000-5628-c57c-cbc0-3a7461737d1b
00020000-5628-c57f-bc50-4779b2e740ea	00030000-5628-c57c-8fe4-619ea44ad7bf
00020000-5628-c57f-bc50-4779b2e740ea	00030000-5628-c57c-dc03-68caab7ee752
00020000-5628-c57f-bc50-4779b2e740ea	00030000-5628-c57c-00a8-1fd46290d215
00020000-5628-c57f-bc50-4779b2e740ea	00030000-5628-c57c-a3b0-5696f11b29e4
00020000-5628-c57f-bc50-4779b2e740ea	00030000-5628-c57c-fe52-b39561e3347b
00020000-5628-c57f-bc50-4779b2e740ea	00030000-5628-c57c-76fd-869293110a4f
00020000-5628-c57f-bc50-4779b2e740ea	00030000-5628-c57c-9c4f-ba666ef6cb69
00020000-5628-c57f-bc50-4779b2e740ea	00030000-5628-c57c-5ffa-f40b72e85903
00020000-5628-c57f-bc50-4779b2e740ea	00030000-5628-c57c-c9c5-de731eef28c8
00020000-5628-c57f-bc50-4779b2e740ea	00030000-5628-c57c-b7fa-e045846b6e31
00020000-5628-c57f-bc50-4779b2e740ea	00030000-5628-c57c-ebbb-d836e13ee7d4
00020000-5628-c57f-bc50-4779b2e740ea	00030000-5628-c57c-92be-9dfc3995496c
00020000-5628-c57f-bc50-4779b2e740ea	00030000-5628-c57c-9ebd-d7d40e8edbbc
00020000-5628-c57f-bc50-4779b2e740ea	00030000-5628-c57c-4048-f430c5e78591
00020000-5628-c57f-bc50-4779b2e740ea	00030000-5628-c57c-2cdb-a002bb5d3f24
\.


--
-- TOC entry 3088 (class 0 OID 23144185)
-- Dependencies: 213
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 3092 (class 0 OID 23144219)
-- Dependencies: 217
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 3104 (class 0 OID 23144356)
-- Dependencies: 229
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, zacetek, konec, jeavtorskepravice, placilonavajo, vrednostvaje, planiranostevilovaj, vrednostvaj, vrednostpredstave, procentodinkasa, jeprocentodinkasa, vrednostdopremiere, zaposlenvdrjz, samozaposlen, igralec, opis) FROM stdin;
000b0000-5628-c580-a7a4-c36b587a11b5	00090000-5628-c57f-4552-50ed6113c044	\N	\N	0001	\N	\N	f	f	10.00	3	10.00	30.00	\N	f	10.00	t	f	t	Pogodba o sodelovanju
000b0000-5628-c580-2f92-cdcf145c6bb6	00090000-5628-c57f-aad1-41ffda35b51f	\N	\N	0002	\N	\N	f	t	11.00	10	11.00	31.00	\N	f	110.00	f	t	t	Pogodba za vlogo Helena
000b0000-5628-c580-9b74-55d0f972bf86	00090000-5628-c580-22b4-af857d8344a4	\N	\N	0003	\N	\N	f	f	12.00	4	12.00	0.00	\N	f	12.00	f	t	f	Pogodba za lektoriranje
000b0000-5628-c580-07de-615ec75a5b41	00090000-5628-c580-d347-17cf7142b7be	\N	\N	0004	\N	\N	t	f	0.00	2	300.00	0.00	\N	f	300.00	f	t	f	Pogodba za avtorske pravice
\.


--
-- TOC entry 3060 (class 0 OID 23143883)
-- Dependencies: 185
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, tipkli_id, drzava_id, sifra, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo, nvo) FROM stdin;
00080000-5628-c57f-1207-7efe029eef8a	\N	00040000-5628-c57c-cda2-9626055aac6d	0988	AK	Juhuhu d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5628-c57f-a3a5-475c73f75abe	\N	00040000-5628-c57c-cda2-9626055aac6d	0989	AK	Hopsasa d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	t
00080000-5628-c57f-3500-d7bb6adef131	\N	00040000-5628-c57c-cda2-9626055aac6d	0987	AK	Gledališče Šrum d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5628-c57f-215b-b4c7773c7190	\N	00040000-5628-c57c-cda2-9626055aac6d	0986	AK	Lutkovni Direndaj d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5628-c57f-657b-c95a183afafe	\N	00040000-5628-c57c-cda2-9626055aac6d	0985	AK	Tatjana Stanič, Lektoriranje, s.p.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5628-c57f-fccc-d95f0babb1a8	\N	00040000-5628-c57c-71d1-bcc5383403f3	0984	AK	Gledališče Lepote tvoje		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5628-c57f-8891-290a94a8803c	\N	00040000-5628-c57c-7f61-4e0fda027d0a	0983	AK	Sunce naše		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5628-c57f-9585-915c91c90a70	\N	00040000-5628-c57c-67ec-27ab3e2f6d92	0982	AK	Theater Amadeus		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5628-c57f-2e9b-2fa14b02b8d9	\N	00040000-5628-c57c-a609-9f91fec81fde	9999	AK	Fuchs		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5628-c583-1d04-09b89008a304	\N	00040000-5628-c57c-cda2-9626055aac6d	1001	AK	Gledališče Matica		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
\.


--
-- TOC entry 3063 (class 0 OID 23143928)
-- Dependencies: 188
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-5628-c4ce-bdc4-cb7ffd50f570	8341	Adlešiči
00050000-5628-c4ce-1c5d-00375ddeb144	5270	Ajdovščina
00050000-5628-c4ce-5ecf-a9425a3828c0	6280	Ankaran/Ancarano
00050000-5628-c4ce-334b-ef58211752bf	9253	Apače
00050000-5628-c4ce-152d-d684c5720f10	8253	Artiče
00050000-5628-c4ce-1bb6-efb79b8dbe60	4275	Begunje na Gorenjskem
00050000-5628-c4ce-04c2-0aaceb830a1f	1382	Begunje pri Cerknici
00050000-5628-c4ce-b537-7f71dc9d1f16	9231	Beltinci
00050000-5628-c4ce-0c28-7562cd2a6450	2234	Benedikt
00050000-5628-c4ce-afe3-645dc279f716	2345	Bistrica ob Dravi
00050000-5628-c4ce-dbe3-1061801bde17	3256	Bistrica ob Sotli
00050000-5628-c4ce-31e3-a0f33d5d433c	8259	Bizeljsko
00050000-5628-c4ce-1323-22b8e740bcb2	1223	Blagovica
00050000-5628-c4ce-d785-cc7d41e9498c	8283	Blanca
00050000-5628-c4ce-5c66-dde95bfa8927	4260	Bled
00050000-5628-c4ce-2671-f4b19f5f40d8	4273	Blejska Dobrava
00050000-5628-c4ce-b669-1436bb43a0cf	9265	Bodonci
00050000-5628-c4ce-b176-8ed5b6cdb063	9222	Bogojina
00050000-5628-c4ce-a944-992ae52e191e	4263	Bohinjska Bela
00050000-5628-c4ce-fc68-232ebc719fea	4264	Bohinjska Bistrica
00050000-5628-c4ce-5dc6-91c94e17d86e	4265	Bohinjsko jezero
00050000-5628-c4ce-9623-9e7f028395c1	1353	Borovnica
00050000-5628-c4ce-37d2-c9d3fe1b49a2	8294	Boštanj
00050000-5628-c4ce-99e0-5ae6b53ef0e2	5230	Bovec
00050000-5628-c4ce-69d9-a5431db76367	5295	Branik
00050000-5628-c4ce-3b99-e0517228ac6c	3314	Braslovče
00050000-5628-c4ce-83e4-45974f906f76	5223	Breginj
00050000-5628-c4ce-94ef-b7bf44dd2259	8280	Brestanica
00050000-5628-c4ce-786a-f9bf6b3e0cfc	2354	Bresternica
00050000-5628-c4ce-8495-f8a1d0a01a10	4243	Brezje
00050000-5628-c4ce-1323-65676e12021c	1351	Brezovica pri Ljubljani
00050000-5628-c4ce-cdeb-7f66daa6f478	8250	Brežice
00050000-5628-c4ce-a6e8-87101dcdb54a	4210	Brnik - Aerodrom
00050000-5628-c4ce-c4b1-ca9328e3ce82	8321	Brusnice
00050000-5628-c4ce-b37d-e9c60a1cdd1d	3255	Buče
00050000-5628-c4ce-f495-a32ad5a25304	8276	Bučka 
00050000-5628-c4ce-a7ae-a460fec41192	9261	Cankova
00050000-5628-c4ce-7199-d78cca5465be	3000	Celje 
00050000-5628-c4ce-b404-f9a358400a68	3001	Celje - poštni predali
00050000-5628-c4ce-1343-f94f19f1768a	4207	Cerklje na Gorenjskem
00050000-5628-c4ce-41a7-484f4e2f9260	8263	Cerklje ob Krki
00050000-5628-c4ce-50b1-be0fcba13873	1380	Cerknica
00050000-5628-c4ce-c3a2-5adc70f722c8	5282	Cerkno
00050000-5628-c4ce-bba3-87503d6733da	2236	Cerkvenjak
00050000-5628-c4ce-4a07-d0f59fe1f031	2215	Ceršak
00050000-5628-c4ce-3530-5c2d4720c310	2326	Cirkovce
00050000-5628-c4ce-f447-ea95fde93590	2282	Cirkulane
00050000-5628-c4ce-439f-65890c53e917	5273	Col
00050000-5628-c4ce-727d-7f098ed10d40	8251	Čatež ob Savi
00050000-5628-c4ce-99c6-b745a49cf04c	1413	Čemšenik
00050000-5628-c4ce-a358-2e8ec0fff1dd	5253	Čepovan
00050000-5628-c4ce-daa4-569f7890c742	9232	Črenšovci
00050000-5628-c4ce-894b-e6f21eb51900	2393	Črna na Koroškem
00050000-5628-c4ce-d77a-380a0e87474b	6275	Črni Kal
00050000-5628-c4ce-3491-65bf0682efc6	5274	Črni Vrh nad Idrijo
00050000-5628-c4ce-16c5-3b99d39e9c79	5262	Črniče
00050000-5628-c4ce-8532-e22f4c5aae96	8340	Črnomelj
00050000-5628-c4ce-d15a-ed25096d5333	6271	Dekani
00050000-5628-c4ce-c382-418cd01a3da2	5210	Deskle
00050000-5628-c4ce-3a75-92b39a865235	2253	Destrnik
00050000-5628-c4ce-a520-95c75aaa74f9	6215	Divača
00050000-5628-c4ce-1b84-30de7b1f2964	1233	Dob
00050000-5628-c4ce-2018-3665578143f8	3224	Dobje pri Planini
00050000-5628-c4ce-3fd8-ade7d3f0f03c	8257	Dobova
00050000-5628-c4ce-e7aa-2d4e72dc9518	1423	Dobovec
00050000-5628-c4ce-9989-539899dec412	5263	Dobravlje
00050000-5628-c4ce-4c34-d24f005460f7	3204	Dobrna
00050000-5628-c4ce-bd7e-0ebf5d5f069b	8211	Dobrnič
00050000-5628-c4ce-7b6a-5ea5f2eb178b	1356	Dobrova
00050000-5628-c4ce-cda0-f8f18d56acef	9223	Dobrovnik/Dobronak 
00050000-5628-c4ce-4a55-04a89af44444	5212	Dobrovo v Brdih
00050000-5628-c4ce-0f5b-058cd92665f0	1431	Dol pri Hrastniku
00050000-5628-c4ce-5eed-8c0732d6511b	1262	Dol pri Ljubljani
00050000-5628-c4ce-965e-03c159191151	1273	Dole pri Litiji
00050000-5628-c4ce-3730-ca9dc1641d8f	1331	Dolenja vas
00050000-5628-c4ce-d78b-a0ceb76200ea	8350	Dolenjske Toplice
00050000-5628-c4ce-b646-0c275bb49f74	1230	Domžale
00050000-5628-c4ce-1b6f-a5cf4ba30d87	2252	Dornava
00050000-5628-c4ce-62d9-22cfb9ab3748	5294	Dornberk
00050000-5628-c4ce-00d6-844cb984f39a	1319	Draga
00050000-5628-c4ce-78b4-c067ac6c0d6f	8343	Dragatuš
00050000-5628-c4ce-a345-87c97a2b3a53	3222	Dramlje
00050000-5628-c4ce-3c8c-e4f63b8be7ea	2370	Dravograd
00050000-5628-c4ce-4bcf-d0c56ce58c40	4203	Duplje
00050000-5628-c4ce-b218-a8093751acb8	6221	Dutovlje
00050000-5628-c4ce-3b8f-ce89bf492998	8361	Dvor
00050000-5628-c4ce-dd96-6505066eded0	2343	Fala
00050000-5628-c4ce-7f1d-e26eceb3174b	9208	Fokovci
00050000-5628-c4ce-2ce9-db73c91a54fa	2313	Fram
00050000-5628-c4ce-2b36-858b73c6c94e	3213	Frankolovo
00050000-5628-c4ce-8831-079d883eb1cd	1274	Gabrovka
00050000-5628-c4ce-eae2-c3098ae7bf8b	8254	Globoko
00050000-5628-c4ce-f795-1ba8b4d1a4a3	5275	Godovič
00050000-5628-c4ce-7049-28eff98537da	4204	Golnik
00050000-5628-c4ce-728f-dd6696e0b5ff	3303	Gomilsko
00050000-5628-c4ce-f1a5-fec1121ec92b	4224	Gorenja vas
00050000-5628-c4ce-c231-74a8075132dc	3263	Gorica pri Slivnici
00050000-5628-c4ce-383f-bd78571c9013	2272	Gorišnica
00050000-5628-c4ce-c39c-31217698cafe	9250	Gornja Radgona
00050000-5628-c4ce-fedb-87216643cc06	3342	Gornji Grad
00050000-5628-c4ce-2a63-0524fc548ff7	4282	Gozd Martuljek
00050000-5628-c4ce-4985-00f1f145072c	6272	Gračišče
00050000-5628-c4ce-1d8d-907d9737f854	9264	Grad
00050000-5628-c4ce-a013-0a89b2433b24	8332	Gradac
00050000-5628-c4ce-162c-c99f8f526363	1384	Grahovo
00050000-5628-c4ce-9850-2e0d9e18d69e	5242	Grahovo ob Bači
00050000-5628-c4ce-cb47-0ab09f6772a5	5251	Grgar
00050000-5628-c4ce-3bea-14eacc65d222	3302	Griže
00050000-5628-c4ce-75cf-f3d5bad808ab	3231	Grobelno
00050000-5628-c4ce-25bc-7a69c8c2eace	1290	Grosuplje
00050000-5628-c4ce-ba37-05a63bd4b613	2288	Hajdina
00050000-5628-c4ce-6e41-eaa6824c1425	8362	Hinje
00050000-5628-c4ce-2e22-03be0a7352b4	2311	Hoče
00050000-5628-c4ce-3259-ee106683b80c	9205	Hodoš/Hodos
00050000-5628-c4ce-dc51-88a98b4ef65e	1354	Horjul
00050000-5628-c4ce-a264-e5e4556c1167	1372	Hotedršica
00050000-5628-c4ce-e499-b58d6c1a95c3	1430	Hrastnik
00050000-5628-c4ce-6cbe-b42068832fd2	6225	Hruševje
00050000-5628-c4ce-75e7-f5ef6d2c45dc	4276	Hrušica
00050000-5628-c4ce-98f7-dada37f663ac	5280	Idrija
00050000-5628-c4ce-7823-dbaaa14b812f	1292	Ig
00050000-5628-c4ce-a4a0-8c4291efa53c	6250	Ilirska Bistrica
00050000-5628-c4ce-f24c-8a53de9f9803	6251	Ilirska Bistrica-Trnovo
00050000-5628-c4ce-a963-e89eb75122ee	1295	Ivančna Gorica
00050000-5628-c4ce-aee8-cf743b5000bc	2259	Ivanjkovci
00050000-5628-c4ce-4e9c-181d130a4ec6	1411	Izlake
00050000-5628-c4ce-8a1e-62e203d22a82	6310	Izola/Isola
00050000-5628-c4ce-c959-df2ad186e463	2222	Jakobski Dol
00050000-5628-c4ce-a24b-3732cb2fa8a5	2221	Jarenina
00050000-5628-c4ce-dbd4-94133bac0ebd	6254	Jelšane
00050000-5628-c4ce-1a0f-c793103acbcb	4270	Jesenice
00050000-5628-c4ce-9817-957d5509e1f8	8261	Jesenice na Dolenjskem
00050000-5628-c4ce-6c99-fb17931fb5c2	3273	Jurklošter
00050000-5628-c4ce-944c-dd8f00116e48	2223	Jurovski Dol
00050000-5628-c4ce-57cd-5cc86ef2f4ab	2256	Juršinci
00050000-5628-c4ce-a663-cd6e4abe59c8	5214	Kal nad Kanalom
00050000-5628-c4ce-095b-1cbf0abfeb1b	3233	Kalobje
00050000-5628-c4ce-f287-e8ec9b89f139	4246	Kamna Gorica
00050000-5628-c4ce-9c83-4434b1bf7d6b	2351	Kamnica
00050000-5628-c4ce-3ba6-7e2812d15424	1241	Kamnik
00050000-5628-c4ce-78ea-a4e18c39bb32	5213	Kanal
00050000-5628-c4ce-5173-55cb351e7288	8258	Kapele
00050000-5628-c4ce-1cb0-3a0bfa554c79	2362	Kapla
00050000-5628-c4ce-bb74-ef7e5862f549	2325	Kidričevo
00050000-5628-c4ce-7538-e57ee94f17de	1412	Kisovec
00050000-5628-c4ce-d432-f5b1396a9754	6253	Knežak
00050000-5628-c4ce-edfe-aed7d9191a67	5222	Kobarid
00050000-5628-c4ce-f8e5-a714ef7d3d23	9227	Kobilje
00050000-5628-c4ce-507f-8371e2e59be5	1330	Kočevje
00050000-5628-c4ce-7f28-fa8e9677e5f4	1338	Kočevska Reka
00050000-5628-c4ce-cfac-f79cb22b7a3d	2276	Kog
00050000-5628-c4ce-4a7c-b1a7b7e1f907	5211	Kojsko
00050000-5628-c4ce-98e2-ba11886ff219	6223	Komen
00050000-5628-c4ce-58b4-a69b7bc17093	1218	Komenda
00050000-5628-c4ce-788d-8f0b37f40be5	6000	Koper/Capodistria 
00050000-5628-c4ce-10cf-0059f6e2222e	6001	Koper/Capodistria - poštni predali
00050000-5628-c4ce-7053-dcadddf6c77a	8282	Koprivnica
00050000-5628-c4ce-8137-f30608ab1340	5296	Kostanjevica na Krasu
00050000-5628-c4ce-90dd-28f87298f3c2	8311	Kostanjevica na Krki
00050000-5628-c4ce-6f0d-560b55b86a01	1336	Kostel
00050000-5628-c4ce-5388-660d6c93dabd	6256	Košana
00050000-5628-c4ce-79b5-a714535143ce	2394	Kotlje
00050000-5628-c4ce-23c7-992d8301f6ef	6240	Kozina
00050000-5628-c4ce-287c-45a382bf831c	3260	Kozje
00050000-5628-c4ce-db0b-954ca3536eeb	4000	Kranj 
00050000-5628-c4ce-ac6a-687bd0a3e822	4001	Kranj - poštni predali
00050000-5628-c4ce-b05e-cc6069fc0aec	4280	Kranjska Gora
00050000-5628-c4ce-e1c9-e3dcf11ab4c3	1281	Kresnice
00050000-5628-c4ce-657b-1c359e885db4	4294	Križe
00050000-5628-c4ce-45d7-4522cc7e5873	9206	Križevci
00050000-5628-c4ce-fed9-9695299e5282	9242	Križevci pri Ljutomeru
00050000-5628-c4ce-e43a-39b338c24a90	1301	Krka
00050000-5628-c4ce-7edf-e0fed22e8166	8296	Krmelj
00050000-5628-c4ce-1466-442b8b25e7df	4245	Kropa
00050000-5628-c4ce-ed95-603025b21d55	8262	Krška vas
00050000-5628-c4ce-50b4-ae496b8c1e3a	8270	Krško
00050000-5628-c4ce-0f5f-41f3dbc56d46	9263	Kuzma
00050000-5628-c4ce-cb7d-fc0a35435e3e	2318	Laporje
00050000-5628-c4ce-3090-5e9b0d981d8d	3270	Laško
00050000-5628-c4ce-af81-82179629ba21	1219	Laze v Tuhinju
00050000-5628-c4ce-7e96-12f80e4250a0	2230	Lenart v Slovenskih goricah
00050000-5628-c4ce-f655-d74fef670e60	9220	Lendava/Lendva
00050000-5628-c4ce-62cc-21e0853596e5	4248	Lesce
00050000-5628-c4ce-07c5-be447e140572	3261	Lesično
00050000-5628-c4ce-15b5-036d6712e914	8273	Leskovec pri Krškem
00050000-5628-c4ce-9bf4-e9eada707b26	2372	Libeliče
00050000-5628-c4ce-5fe9-230b210c00f8	2341	Limbuš
00050000-5628-c4ce-ea4b-5814186fd9da	1270	Litija
00050000-5628-c4ce-8d69-a6a974f4ea10	3202	Ljubečna
00050000-5628-c4ce-565e-6ab80de19293	1000	Ljubljana 
00050000-5628-c4ce-041e-4342c75a245b	1001	Ljubljana - poštni predali
00050000-5628-c4ce-5998-0151449bafad	1231	Ljubljana - Črnuče
00050000-5628-c4ce-4dff-87d03a757ef5	1261	Ljubljana - Dobrunje
00050000-5628-c4ce-b10f-18e95ad74f45	1260	Ljubljana - Polje
00050000-5628-c4ce-79d6-51e53659b52d	1210	Ljubljana - Šentvid
00050000-5628-c4ce-11e3-2cc7f9384547	1211	Ljubljana - Šmartno
00050000-5628-c4ce-6938-2f63f097fcfc	3333	Ljubno ob Savinji
00050000-5628-c4ce-81b7-72662c70d3ae	9240	Ljutomer
00050000-5628-c4ce-5dce-6f530fd03028	3215	Loče
00050000-5628-c4ce-6946-1991279be8fc	5231	Log pod Mangartom
00050000-5628-c4ce-26a7-bbc555ff228c	1358	Log pri Brezovici
00050000-5628-c4ce-1e9b-abfd0f1ef2e8	1370	Logatec
00050000-5628-c4ce-bd22-5b088f81a655	1371	Logatec
00050000-5628-c4ce-0983-28774b19c3d9	1434	Loka pri Zidanem Mostu
00050000-5628-c4ce-22c3-af826ae1c385	3223	Loka pri Žusmu
00050000-5628-c4ce-c664-28248a6c6b40	6219	Lokev
00050000-5628-c4ce-3058-410bfc0d14b2	1318	Loški Potok
00050000-5628-c4ce-c941-fdedf7f4f7eb	2324	Lovrenc na Dravskem polju
00050000-5628-c4ce-a24a-7805c6e2784b	2344	Lovrenc na Pohorju
00050000-5628-c4ce-7bf9-aee5cfe76627	3334	Luče
00050000-5628-c4ce-4f31-580e09dbddc9	1225	Lukovica
00050000-5628-c4ce-1c30-903bbac814cc	9202	Mačkovci
00050000-5628-c4ce-a5a1-7dc808fbf5a2	2322	Majšperk
00050000-5628-c4ce-4650-34305809808c	2321	Makole
00050000-5628-c4ce-f43b-8fc650620506	9243	Mala Nedelja
00050000-5628-c4ce-35b1-c1ea27555949	2229	Malečnik
00050000-5628-c4ce-41c0-a7070ef95e3c	6273	Marezige
00050000-5628-c4ce-b0aa-d80e16b6e99c	2000	Maribor 
00050000-5628-c4ce-ec3c-f1932e80eb4d	2001	Maribor - poštni predali
00050000-5628-c4ce-a2e2-5a8895673fb4	2206	Marjeta na Dravskem polju
00050000-5628-c4ce-ed96-9c9e4037b45b	2281	Markovci
00050000-5628-c4ce-5441-ef0f6033cfec	9221	Martjanci
00050000-5628-c4ce-b185-5308bad5b33c	6242	Materija
00050000-5628-c4ce-5af2-ad6b587221f9	4211	Mavčiče
00050000-5628-c4ce-8b21-e281305dc1c3	1215	Medvode
00050000-5628-c4ce-bc79-06d207662135	1234	Mengeš
00050000-5628-c4ce-c431-07ffe0b4ee28	8330	Metlika
00050000-5628-c4ce-f47b-5dffd598a020	2392	Mežica
00050000-5628-c4ce-d5cf-69199c53148a	2204	Miklavž na Dravskem polju
00050000-5628-c4ce-8b7a-fda38a752d08	2275	Miklavž pri Ormožu
00050000-5628-c4ce-8fbb-967b2ae7edc4	5291	Miren
00050000-5628-c4ce-350d-8b9cf3e1004a	8233	Mirna
00050000-5628-c4ce-e373-5d749bb4efd2	8216	Mirna Peč
00050000-5628-c4ce-b875-f9f0de81e0bf	2382	Mislinja
00050000-5628-c4ce-1d41-43c02a8e9b58	4281	Mojstrana
00050000-5628-c4ce-1672-6233504bb23c	8230	Mokronog
00050000-5628-c4ce-57c3-36bcd5493fc8	1251	Moravče
00050000-5628-c4ce-f956-9a7676437a1b	9226	Moravske Toplice
00050000-5628-c4ce-0751-d3c946385235	5216	Most na Soči
00050000-5628-c4ce-f65e-e11097378b0b	1221	Motnik
00050000-5628-c4ce-cc71-ddd45b18a167	3330	Mozirje
00050000-5628-c4ce-fa09-53292f48d43d	9000	Murska Sobota 
00050000-5628-c4ce-b63d-e95b11dd7f75	9001	Murska Sobota - poštni predali
00050000-5628-c4ce-e8e4-973512095051	2366	Muta
00050000-5628-c4ce-a113-2f5d0767579d	4202	Naklo
00050000-5628-c4ce-4a6e-54b015fddaa3	3331	Nazarje
00050000-5628-c4ce-4529-3422ce6ddc8a	1357	Notranje Gorice
00050000-5628-c4ce-6e7c-d71c7d32c33e	3203	Nova Cerkev
00050000-5628-c4ce-c493-f97f17797963	5000	Nova Gorica 
00050000-5628-c4ce-cedd-fef970d7fe93	5001	Nova Gorica - poštni predali
00050000-5628-c4ce-9e0e-b12e2d454f16	1385	Nova vas
00050000-5628-c4ce-8ed7-d86e1edb2743	8000	Novo mesto
00050000-5628-c4ce-7735-69b5ab7bb106	8001	Novo mesto - poštni predali
00050000-5628-c4ce-56b4-85fce9bcfa74	6243	Obrov
00050000-5628-c4ce-feda-c27a409c6ab6	9233	Odranci
00050000-5628-c4ce-9365-a0dd2499814e	2317	Oplotnica
00050000-5628-c4ce-9729-a56bd35eaa66	2312	Orehova vas
00050000-5628-c4ce-a200-d52a56dfbe15	2270	Ormož
00050000-5628-c4ce-a761-575b2c0a67b6	1316	Ortnek
00050000-5628-c4ce-aee7-4fcca2ea3180	1337	Osilnica
00050000-5628-c4ce-4b3c-5267eeba5d19	8222	Otočec
00050000-5628-c4ce-f13f-77f8d62df02e	2361	Ožbalt
00050000-5628-c4ce-861d-44602814150d	2231	Pernica
00050000-5628-c4ce-fa09-f0a3b120a5bf	2211	Pesnica pri Mariboru
00050000-5628-c4ce-e6d7-3d6b9a301e84	9203	Petrovci
00050000-5628-c4ce-3080-bd65478b604d	3301	Petrovče
00050000-5628-c4ce-8bc2-e1f703c52187	6330	Piran/Pirano
00050000-5628-c4ce-e4dd-2131144e7602	8255	Pišece
00050000-5628-c4ce-7f88-586098f2bf03	6257	Pivka
00050000-5628-c4ce-4983-4d9e0230c6ed	6232	Planina
00050000-5628-c4ce-f7a5-b3bc4360077a	3225	Planina pri Sevnici
00050000-5628-c4ce-9a5e-436c54811460	6276	Pobegi
00050000-5628-c4ce-1647-e0987f7d2151	8312	Podbočje
00050000-5628-c4ce-9766-bbd438d7bffa	5243	Podbrdo
00050000-5628-c4ce-e6b8-92791a16ce5b	3254	Podčetrtek
00050000-5628-c4ce-3eae-7db581dd4ed6	2273	Podgorci
00050000-5628-c4ce-5781-907a47cb8f58	6216	Podgorje
00050000-5628-c4ce-b2f2-10d6db2fcc7b	2381	Podgorje pri Slovenj Gradcu
00050000-5628-c4ce-a91a-46916604a1c0	6244	Podgrad
00050000-5628-c4ce-2571-c2e08c8809bb	1414	Podkum
00050000-5628-c4ce-38b2-b36c2955fc50	2286	Podlehnik
00050000-5628-c4ce-39dc-30e80ad01c7f	5272	Podnanos
00050000-5628-c4ce-d2d2-a83b000b11f7	4244	Podnart
00050000-5628-c4ce-87c6-13632116cd46	3241	Podplat
00050000-5628-c4ce-893d-62b32ceb611e	3257	Podsreda
00050000-5628-c4ce-a85b-3ce6df32f14b	2363	Podvelka
00050000-5628-c4ce-b604-25c57dcde370	2208	Pohorje
00050000-5628-c4ce-4c26-c968f1c8dd6e	2257	Polenšak
00050000-5628-c4ce-a024-6df0e18afa28	1355	Polhov Gradec
00050000-5628-c4ce-82ab-47cba13411ef	4223	Poljane nad Škofjo Loko
00050000-5628-c4ce-5d38-7b654d4c8be9	2319	Poljčane
00050000-5628-c4ce-6628-3651f97b53ff	1272	Polšnik
00050000-5628-c4ce-97b2-3df110b67c92	3313	Polzela
00050000-5628-c4ce-4ee0-87cec9b7185d	3232	Ponikva
00050000-5628-c4ce-c230-1c9c103c46f8	6320	Portorož/Portorose
00050000-5628-c4ce-fb99-39d0f7730c40	6230	Postojna
00050000-5628-c4ce-3baa-4db365521167	2331	Pragersko
00050000-5628-c4ce-f52d-76591575e8c2	3312	Prebold
00050000-5628-c4ce-67d7-c46a95bb403f	4205	Preddvor
00050000-5628-c4ce-da84-b0676b19d372	6255	Prem
00050000-5628-c4ce-938c-a427dce4fac8	1352	Preserje
00050000-5628-c4ce-5599-cad50d0b39d0	6258	Prestranek
00050000-5628-c4ce-3a44-cfbf256be939	2391	Prevalje
00050000-5628-c4ce-a7ec-4e1aea0759b1	3262	Prevorje
00050000-5628-c4ce-a377-58510c03ddd9	1276	Primskovo 
00050000-5628-c4ce-d60a-4079e62d3021	3253	Pristava pri Mestinju
00050000-5628-c4ce-afd1-c28d89f08ac1	9207	Prosenjakovci/Partosfalva
00050000-5628-c4ce-8223-eb507d5f046d	5297	Prvačina
00050000-5628-c4ce-232a-7c7be1cd4df9	2250	Ptuj
00050000-5628-c4ce-0665-5be730599fdc	2323	Ptujska Gora
00050000-5628-c4ce-bb3f-59bc816c38bc	9201	Puconci
00050000-5628-c4ce-185d-f2716bf0b4ae	2327	Rače
00050000-5628-c4ce-8310-b3d343167768	1433	Radeče
00050000-5628-c4ce-cfc6-cd2e734dfa12	9252	Radenci
00050000-5628-c4ce-f795-75108210af28	2360	Radlje ob Dravi
00050000-5628-c4ce-1270-a2e791dfeac2	1235	Radomlje
00050000-5628-c4ce-ad6b-7651933cf1b0	4240	Radovljica
00050000-5628-c4ce-3b7e-72ed0ef6d63c	8274	Raka
00050000-5628-c4ce-9fd8-45663b29d045	1381	Rakek
00050000-5628-c4ce-b35d-5c2c87f76caf	4283	Rateče - Planica
00050000-5628-c4ce-ceae-db71fb9d483e	2390	Ravne na Koroškem
00050000-5628-c4ce-cc22-9c84bd37cde3	9246	Razkrižje
00050000-5628-c4ce-f542-e15a3dcba100	3332	Rečica ob Savinji
00050000-5628-c4ce-6d1b-0b1387c7306e	5292	Renče
00050000-5628-c4ce-c274-d5a9e6e7bae4	1310	Ribnica
00050000-5628-c4ce-7f66-9995d4aff3fa	2364	Ribnica na Pohorju
00050000-5628-c4ce-d285-a14de1a45160	3272	Rimske Toplice
00050000-5628-c4ce-1792-9c10f3aa9092	1314	Rob
00050000-5628-c4ce-863b-ce4f0e953e16	5215	Ročinj
00050000-5628-c4ce-61a9-c4e749c13993	3250	Rogaška Slatina
00050000-5628-c4ce-78cd-8b728e21a7a9	9262	Rogašovci
00050000-5628-c4ce-f64b-6bd11229a39d	3252	Rogatec
00050000-5628-c4ce-b473-269be08239e8	1373	Rovte
00050000-5628-c4ce-3725-054caf4e4857	2342	Ruše
00050000-5628-c4ce-732d-8dad8c5137b0	1282	Sava
00050000-5628-c4ce-84ef-49f8e4fb60f3	6333	Sečovlje/Sicciole
00050000-5628-c4ce-ff7f-4e5c451fe105	4227	Selca
00050000-5628-c4ce-3caf-0d1252549180	2352	Selnica ob Dravi
00050000-5628-c4ce-2333-ce691cbf65ec	8333	Semič
00050000-5628-c4ce-52e7-478931436ddb	8281	Senovo
00050000-5628-c4ce-9385-105af8a95e66	6224	Senožeče
00050000-5628-c4ce-d8eb-dbddb91f1c4d	8290	Sevnica
00050000-5628-c4ce-00b8-19fa80cff0e3	6210	Sežana
00050000-5628-c4ce-c5e1-42ac9a4c06b6	2214	Sladki Vrh
00050000-5628-c4ce-401a-ba90ce7079d2	5283	Slap ob Idrijci
00050000-5628-c4ce-9617-5bb82b53ed67	2380	Slovenj Gradec
00050000-5628-c4ce-4069-d3a49ceaeaa3	2310	Slovenska Bistrica
00050000-5628-c4ce-e13a-88e374229800	3210	Slovenske Konjice
00050000-5628-c4ce-0603-5cda0abe76d5	1216	Smlednik
00050000-5628-c4ce-2f7f-a9d6586ebe5a	5232	Soča
00050000-5628-c4ce-20ec-1056cc13047e	1317	Sodražica
00050000-5628-c4ce-5c10-3456c1d19853	3335	Solčava
00050000-5628-c4ce-a01a-c05a7b69ca13	5250	Solkan
00050000-5628-c4ce-a0b1-b5ae5167f58d	4229	Sorica
00050000-5628-c4ce-b473-54fb58719f33	4225	Sovodenj
00050000-5628-c4ce-418c-e5e51634b3a7	5281	Spodnja Idrija
00050000-5628-c4ce-83f9-78ccf0a6be4a	2241	Spodnji Duplek
00050000-5628-c4ce-dbfc-14b338b33d2a	9245	Spodnji Ivanjci
00050000-5628-c4ce-0f25-3324c3de0d7c	2277	Središče ob Dravi
00050000-5628-c4ce-c5f7-9bfeb510db20	4267	Srednja vas v Bohinju
00050000-5628-c4ce-3eab-c554ba9debb3	8256	Sromlje 
00050000-5628-c4ce-f35b-804175486055	5224	Srpenica
00050000-5628-c4ce-85d7-eadee5c7c32b	1242	Stahovica
00050000-5628-c4ce-5dd5-f3285e8583fe	1332	Stara Cerkev
00050000-5628-c4ce-7f4b-ecbdc4c94160	8342	Stari trg ob Kolpi
00050000-5628-c4ce-fbfd-4cb3b24fe574	1386	Stari trg pri Ložu
00050000-5628-c4ce-c9b4-e0736e065cff	2205	Starše
00050000-5628-c4ce-bd14-9934c3c72955	2289	Stoperce
00050000-5628-c4ce-a23b-b868164206c9	8322	Stopiče
00050000-5628-c4ce-4c47-35c79dbfeb72	3206	Stranice
00050000-5628-c4ce-3737-4507e6790d7c	8351	Straža
00050000-5628-c4ce-6a43-4f52d714b0d4	1313	Struge
00050000-5628-c4ce-7c6e-d5ade90b7fb9	8293	Studenec
00050000-5628-c4ce-eeca-f596d4706fcf	8331	Suhor
00050000-5628-c4ce-6f7f-35e72dd04b57	2233	Sv. Ana v Slovenskih goricah
00050000-5628-c4ce-1e3a-1d27344bcb4e	2235	Sv. Trojica v Slovenskih goricah
00050000-5628-c4ce-85d4-6f1915f310a9	2353	Sveti Duh na Ostrem Vrhu
00050000-5628-c4ce-7d58-269f62dfb3f4	9244	Sveti Jurij ob Ščavnici
00050000-5628-c4ce-02e1-d3e1b4d9f77b	3264	Sveti Štefan
00050000-5628-c4ce-2a18-55437228dd2e	2258	Sveti Tomaž
00050000-5628-c4ce-5c20-385193bf4eba	9204	Šalovci
00050000-5628-c4ce-2d9c-488a31bf3294	5261	Šempas
00050000-5628-c4ce-3a9a-e15f933abc52	5290	Šempeter pri Gorici
00050000-5628-c4ce-1aaf-b7327b91bdaf	3311	Šempeter v Savinjski dolini
00050000-5628-c4ce-611c-0e6ae3a5e405	4208	Šenčur
00050000-5628-c4ce-e2a5-da5292b30133	2212	Šentilj v Slovenskih goricah
00050000-5628-c4ce-120d-3d0d39d619a7	8297	Šentjanž
00050000-5628-c4ce-8ea5-17e418b8f7d0	2373	Šentjanž pri Dravogradu
00050000-5628-c4ce-14e6-760164b280db	8310	Šentjernej
00050000-5628-c4ce-d459-84e64e0d2913	3230	Šentjur
00050000-5628-c4ce-e47c-c3330865b616	3271	Šentrupert
00050000-5628-c4ce-e124-423eea49a710	8232	Šentrupert
00050000-5628-c4ce-57fc-39969c148b9c	1296	Šentvid pri Stični
00050000-5628-c4ce-1e90-9964dd83df60	8275	Škocjan
00050000-5628-c4ce-bd2e-b803244b1f55	6281	Škofije
00050000-5628-c4ce-d611-376d944a3a61	4220	Škofja Loka
00050000-5628-c4ce-455c-854f66b564ed	3211	Škofja vas
00050000-5628-c4ce-1d13-212dd622eaba	1291	Škofljica
00050000-5628-c4ce-9a01-1a6137b7c48c	6274	Šmarje
00050000-5628-c4ce-866a-5563a637aa7e	1293	Šmarje - Sap
00050000-5628-c4ce-9a0d-c6bb7d78a650	3240	Šmarje pri Jelšah
00050000-5628-c4ce-38a1-33fcc7c6eb58	8220	Šmarješke Toplice
00050000-5628-c4ce-4a70-d6ecbda2d3ae	2315	Šmartno na Pohorju
00050000-5628-c4ce-1823-9b61d7d97019	3341	Šmartno ob Dreti
00050000-5628-c4ce-bd7d-7bdf4a09de16	3327	Šmartno ob Paki
00050000-5628-c4ce-5880-410a8b1481cf	1275	Šmartno pri Litiji
00050000-5628-c4ce-4be0-b6f6983da8ee	2383	Šmartno pri Slovenj Gradcu
00050000-5628-c4ce-5dd2-08b84e859e0b	3201	Šmartno v Rožni dolini
00050000-5628-c4ce-3613-c0eb31b3e674	3325	Šoštanj
00050000-5628-c4ce-1964-feecde07eccb	6222	Štanjel
00050000-5628-c4ce-8d74-206899a07808	3220	Štore
00050000-5628-c4ce-db1f-a53beddf6fb9	3304	Tabor
00050000-5628-c4ce-989e-855ab63fd3af	3221	Teharje
00050000-5628-c4ce-5e05-694b36e5f48d	9251	Tišina
00050000-5628-c4ce-8450-acf8c4200cb4	5220	Tolmin
00050000-5628-c4ce-d2e0-1e4590382ebc	3326	Topolšica
00050000-5628-c4ce-312d-e396d95d07f1	2371	Trbonje
00050000-5628-c4ce-b45e-85a0b194081e	1420	Trbovlje
00050000-5628-c4ce-367e-bee4a496aee6	8231	Trebelno 
00050000-5628-c4ce-e229-3ab69a02e671	8210	Trebnje
00050000-5628-c4ce-390e-31b48ded3518	5252	Trnovo pri Gorici
00050000-5628-c4ce-4624-abcb86900870	2254	Trnovska vas
00050000-5628-c4ce-9b08-bee3de421785	1222	Trojane
00050000-5628-c4ce-e37e-b3ae449fbc38	1236	Trzin
00050000-5628-c4ce-e56f-27250beb152d	4290	Tržič
00050000-5628-c4ce-af07-4790075b4f82	8295	Tržišče
00050000-5628-c4ce-51b9-ca4375af1266	1311	Turjak
00050000-5628-c4ce-5a35-d7222bdcc48d	9224	Turnišče
00050000-5628-c4ce-0d72-65db5a1a311a	8323	Uršna sela
00050000-5628-c4ce-0088-bdd9508adb98	1252	Vače
00050000-5628-c4ce-6209-6fc17a95de32	3320	Velenje 
00050000-5628-c4ce-7ec1-19d0fa663061	3322	Velenje - poštni predali
00050000-5628-c4ce-150b-4a5ecd57e882	8212	Velika Loka
00050000-5628-c4ce-6c61-51c87180e890	2274	Velika Nedelja
00050000-5628-c4ce-2f14-cabf1b1a71e3	9225	Velika Polana
00050000-5628-c4ce-9f2d-6bf65139de63	1315	Velike Lašče
00050000-5628-c4ce-4a3f-91a63f701563	8213	Veliki Gaber
00050000-5628-c4ce-8140-4db4d84f21b9	9241	Veržej
00050000-5628-c4ce-23ee-b1e5273f0d39	1312	Videm - Dobrepolje
00050000-5628-c4ce-058d-797dca4cc29b	2284	Videm pri Ptuju
00050000-5628-c4ce-fe96-d92ed13855a5	8344	Vinica
00050000-5628-c4ce-f5bb-180fad615866	5271	Vipava
00050000-5628-c4ce-d526-e022b3e6b7ca	4212	Visoko
00050000-5628-c4ce-d8e8-f15d78139391	1294	Višnja Gora
00050000-5628-c4ce-739d-fce8089734e5	3205	Vitanje
00050000-5628-c4ce-fb56-0c3db6ba6e2b	2255	Vitomarci
00050000-5628-c4ce-2434-1b30321c9782	1217	Vodice
00050000-5628-c4ce-1b8b-75673d16cfc9	3212	Vojnik\t
00050000-5628-c4ce-256d-e0c146b387dc	5293	Volčja Draga
00050000-5628-c4ce-0e68-264c168694ee	2232	Voličina
00050000-5628-c4ce-9fb0-f2b118957311	3305	Vransko
00050000-5628-c4ce-e8e7-3f10c30fb7e8	6217	Vremski Britof
00050000-5628-c4ce-f58e-9f482f3d9f9a	1360	Vrhnika
00050000-5628-c4ce-afec-22fdd668a444	2365	Vuhred
00050000-5628-c4ce-920c-89ef4e9e52dc	2367	Vuzenica
00050000-5628-c4ce-c70e-150adbfd8d42	8292	Zabukovje 
00050000-5628-c4ce-6a21-a3c1628048e4	1410	Zagorje ob Savi
00050000-5628-c4ce-3104-e47b97e1203a	1303	Zagradec
00050000-5628-c4ce-9d30-d5c7fa9c49ec	2283	Zavrč
00050000-5628-c4ce-e6d9-c762ea9a67af	8272	Zdole 
00050000-5628-c4ce-a0ae-c7bf9f5d648b	4201	Zgornja Besnica
00050000-5628-c4ce-dd14-4e5417e55a09	2242	Zgornja Korena
00050000-5628-c4ce-473c-a124ff9762f6	2201	Zgornja Kungota
00050000-5628-c4ce-72e1-42f32246d747	2316	Zgornja Ložnica
00050000-5628-c4ce-6b19-baf857a4806d	2314	Zgornja Polskava
00050000-5628-c4ce-f280-89a4893486da	2213	Zgornja Velka
00050000-5628-c4ce-1c3f-a0e4743e41c3	4247	Zgornje Gorje
00050000-5628-c4ce-b51e-d5902a1cbf27	4206	Zgornje Jezersko
00050000-5628-c4ce-1520-014aaf949ce7	2285	Zgornji Leskovec
00050000-5628-c4ce-7923-17ae50752813	1432	Zidani Most
00050000-5628-c4ce-284e-69f0ff69ea6f	3214	Zreče
00050000-5628-c4ce-83a3-95cadf210acc	4209	Žabnica
00050000-5628-c4ce-88b7-8d7610a1484d	3310	Žalec
00050000-5628-c4ce-0298-89a8aa95f619	4228	Železniki
00050000-5628-c4ce-7025-62d61a5970cc	2287	Žetale
00050000-5628-c4ce-34e7-511d07153560	4226	Žiri
00050000-5628-c4ce-fbc8-23148d2282d4	4274	Žirovnica
00050000-5628-c4ce-c530-af36feb8e64f	8360	Žužemberk
\.


--
-- TOC entry 3111 (class 0 OID 23144567)
-- Dependencies: 236
-- Data for Name: postavkacdve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkacdve (id, skupina, podskupina, naziv, vrpremiere, vrponovitvepremier, vrponovitveprejsnjih, vrgostovanjazamejstvo, vrfestivali, vrgostovanjaint, vrostalo, programdela_id) FROM stdin;
\.


--
-- TOC entry 3084 (class 0 OID 23144159)
-- Dependencies: 209
-- Data for Name: postavkaracuna; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkaracuna (id, racun_id) FROM stdin;
\.


--
-- TOC entry 3062 (class 0 OID 23143913)
-- Dependencies: 187
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
00060000-5628-c57f-ab0a-cc5164a17ddf	00080000-5628-c57f-1207-7efe029eef8a	\N	00040000-5628-c57c-cda2-9626055aac6d	Narodni dom	\N	Koroška 15	\N	9231	Beltinci	\N	f	t
00060000-5628-c57f-7670-05d299d94d94	00080000-5628-c57f-1207-7efe029eef8a	\N	00040000-5628-c57c-cda2-9626055aac6d	Korotan	\N	Koroška 22	\N	9231	Beltinci	\N	f	f
00060000-5628-c57f-21e6-985b630bdc67	00080000-5628-c57f-a3a5-475c73f75abe	\N	00040000-5628-c57c-cda2-9626055aac6d	Rimljan	\N	Rimska ploščad 7	\N	9231	Beltinci	\N	f	t
\.


--
-- TOC entry 3074 (class 0 OID 23144057)
-- Dependencies: 199
-- Data for Name: praznik; Type: TABLE DATA; Schema: public; Owner: -
--

COPY praznik (id, ime, dan, mesec, leto, delaprost) FROM stdin;
00430000-5628-c57c-44ab-0f49ecd011bf	novo leto	1	1	\N	t
00430000-5628-c57c-4394-b07c59772160	Prešernov dan, slovenski kulturni praznik	8	2	\N	t
00430000-5628-c57c-5930-5fee346dc854	dan upora proti okupatorju	27	4	\N	t
00430000-5628-c57c-bd52-c47c12182850	praznik dela	1	5	\N	t
00430000-5628-c57c-090e-35beb034fe55	praznik dela	2	5	\N	t
00430000-5628-c57c-e18d-b8c6a66f9503	dan Primoža Trubarja	8	6	\N	f
00430000-5628-c57c-72a3-932dad5a6c7b	dan državnosti	25	6	\N	t
00430000-5628-c57c-1bdf-e408dcacd6c0	združitev prekmurskih Slovencev z matičnim narodom	17	8	\N	f
00430000-5628-c57c-cce7-b29874ca2a68	vrnitev Primorske k matični domovini	15	9	\N	f
00430000-5628-c57c-018d-67038bf6b0b2	dan suverenosti	25	10	\N	f
00430000-5628-c57c-2483-9cc81d13ec66	dan spomina na mrtve	1	11	\N	t
00430000-5628-c57c-e5bb-dcf6142a87cd	dan Rudolfa Maistra	23	11	\N	f
00430000-5628-c57c-943a-0b34139c0f92	božič	25	12	\N	t
00430000-5628-c57c-e5bd-41b546bd81ec	dan samostojnosti in enotnosti	26	12	\N	t
00430000-5628-c57c-cfa8-682b10851977	Marijino vnebovzetje	15	8	\N	t
00430000-5628-c57c-b63c-2660ef16dfaf	dan reformacije	31	10	\N	t
00430000-5628-c57c-5a01-5ae05888fe48	velikonočna nedelja	27	3	2016	t
00430000-5628-c57c-4650-c956c3ba6e89	velikonočna nedelja	16	4	2017	t
00430000-5628-c57c-2b14-d458f87ebf64	velikonočna nedelja	1	4	2018	t
00430000-5628-c57c-29a3-2769ed011b6b	velikonočna nedelja	21	4	2019	t
00430000-5628-c57c-fa92-84f495a5e8c1	velikonočna nedelja	12	4	2020	t
00430000-5628-c57c-c83b-b11b160e90a5	velikonočna nedelja	4	4	2021	t
00430000-5628-c57c-2a8d-62e70fe36261	velikonočna nedelja	17	4	2022	t
00430000-5628-c57c-ffa1-1ce4e1393679	velikonočna nedelja	9	4	2023	t
00430000-5628-c57c-8292-f308d0b8e9cf	velikonočna nedelja	31	3	2024	t
00430000-5628-c57c-1c17-2f32656e8a31	velikonočna nedelja	20	4	2025	t
00430000-5628-c57c-728c-55bdeff041f9	velikonočna nedelja	5	4	2026	t
00430000-5628-c57c-be7b-d564477a399f	velikonočna nedelja	28	3	2027	t
00430000-5628-c57c-f544-3fa460fb248d	velikonočna nedelja	16	4	2028	t
00430000-5628-c57c-efb3-6612e167dbcb	velikonočna nedelja	1	4	2029	t
00430000-5628-c57c-259d-37c64a56d622	velikonočna nedelja	21	4	2030	t
00430000-5628-c57c-34d8-a9b3d18c27ce	velikonočni ponedeljek	28	3	2016	t
00430000-5628-c57c-a5ba-85a42afbb515	velikonočni ponedeljek	17	4	2017	t
00430000-5628-c57c-464d-0bb4afa6f042	velikonočni ponedeljek	2	4	2018	t
00430000-5628-c57c-de37-dec3e03c3859	velikonočni ponedeljek	22	4	2019	t
00430000-5628-c57c-21d0-96f104758b4d	velikonočni ponedeljek	13	4	2020	t
00430000-5628-c57c-b64b-95478945aaca	velikonočni ponedeljek	5	4	2021	t
00430000-5628-c57c-834a-a8bffadb3984	velikonočni ponedeljek	18	4	2022	t
00430000-5628-c57c-4fa2-472ec5493c8a	velikonočni ponedeljek	10	4	2023	t
00430000-5628-c57c-5315-4982b40fa0c7	velikonočni ponedeljek	1	4	2024	t
00430000-5628-c57c-8879-6a580cbd2d61	velikonočni ponedeljek	21	4	2025	t
00430000-5628-c57c-8912-d23f8c69e9fb	velikonočni ponedeljek	6	4	2026	t
00430000-5628-c57c-eeb3-dd621fc6f72b	velikonočni ponedeljek	29	3	2027	t
00430000-5628-c57c-cfc4-a815eaf25622	velikonočni ponedeljek	17	4	2028	t
00430000-5628-c57c-66af-f64ecfe70c80	velikonočni ponedeljek	2	4	2029	t
00430000-5628-c57c-3042-e2bcf2de6796	velikonočni ponedeljek	22	4	2030	t
00430000-5628-c57c-fe3d-f3f26ef4dc77	binkoštna nedelja - binkošti	15	5	2016	t
00430000-5628-c57c-3601-2c3b35750ebb	binkoštna nedelja - binkošti	4	6	2017	t
00430000-5628-c57c-a370-8d0e2f217185	binkoštna nedelja - binkošti	20	5	2018	t
00430000-5628-c57c-6d2e-078b89c4171f	binkoštna nedelja - binkošti	9	6	2019	t
00430000-5628-c57c-f425-d01ad5d68473	binkoštna nedelja - binkošti	31	5	2020	t
00430000-5628-c57c-3699-d76f5895cecf	binkoštna nedelja - binkošti	23	5	2021	t
00430000-5628-c57c-1d03-765ae564f1e0	binkoštna nedelja - binkošti	5	6	2022	t
00430000-5628-c57c-9a91-e6ee2a64eb8e	binkoštna nedelja - binkošti	28	5	2023	t
00430000-5628-c57c-486b-c4c33e22a203	binkoštna nedelja - binkošti	19	5	2024	t
00430000-5628-c57c-162f-a5f3541dca0d	binkoštna nedelja - binkošti	8	6	2025	t
00430000-5628-c57c-55ed-58c53094197a	binkoštna nedelja - binkošti	24	5	2026	t
00430000-5628-c57c-f9ca-bf2c590b8e6d	binkoštna nedelja - binkošti	16	5	2027	t
00430000-5628-c57c-7599-7cde2357a234	binkoštna nedelja - binkošti	4	6	2028	t
00430000-5628-c57c-5d0c-cae7d1bd73da	binkoštna nedelja - binkošti	20	5	2029	t
00430000-5628-c57c-ef5a-588eed1666f9	binkoštna nedelja - binkošti	9	6	2030	t
\.


--
-- TOC entry 3070 (class 0 OID 23144017)
-- Dependencies: 195
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, dezurni_id, zaporedna, zaporednasez, objavljenzacetek, porocilo) FROM stdin;
\.


--
-- TOC entry 3071 (class 0 OID 23144029)
-- Dependencies: 196
-- Data for Name: predstava_abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava_abonma (predstava_id, abonma_id) FROM stdin;
\.


--
-- TOC entry 3086 (class 0 OID 23144171)
-- Dependencies: 211
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 3112 (class 0 OID 23144581)
-- Dependencies: 237
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, koproducent_id, odstotekfinanciranja, delez, maticnikop, kpe, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 3113 (class 0 OID 23144591)
-- Dependencies: 238
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, sifra, status) FROM stdin;
00190000-5628-c580-00a4-194434de3932	00080000-5628-c57f-3500-d7bb6adef131	0987	AK
00190000-5628-c580-f6ac-46ae4325c1ec	00080000-5628-c57f-a3a5-475c73f75abe	0989	AK
00190000-5628-c580-8c8d-4265c8d69f81	00080000-5628-c57f-215b-b4c7773c7190	0986	AK
00190000-5628-c580-d690-633c9e98a903	00080000-5628-c57f-fccc-d95f0babb1a8	0984	AK
00190000-5628-c580-b050-a83452e92ac6	00080000-5628-c57f-8891-290a94a8803c	0983	AK
00190000-5628-c580-ff99-3cd481e54ac5	00080000-5628-c57f-9585-915c91c90a70	0982	AK
00190000-5628-c583-c13b-e2d92f90cced	00080000-5628-c583-1d04-09b89008a304	1001	AK
\.


--
-- TOC entry 3110 (class 0 OID 23144506)
-- Dependencies: 235
-- Data for Name: programdela; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programdela (id, sifra, naziv, zacetek, konec, zakljuceno, potrjenprogram, stpremier, stpremiervelikih, stpremiermalih, stpremiermalihkopr, stpremiervelikihkopr, stpremiersredkopr, stint, stfest, strazno, stizjem, stponprem, stponprej, stponprejvelikih, stponprejmalih, stponprejmalihkopr, stponprejsredkopr, stponprejvelikihkopr, stgostujo, vrps1, vrps1do, vrps1mat, vrps1gostovsz, stizvnekomerc, stizvprem, stizvpremdoma, stizvpremkopr, stizvponprem, stizvponpremdoma, stizvponpremzamejo, stizvponpremgost, stizvponpremkopr, stizvponpremint, stizvponpremkoprint, stizvponprej, stizvponprejdoma, stizvponprejzamejo, stizvponprejgost, stizvponprejkopr, stizvponprejint, stizvponprejkoprint, stizvgostuj, stizvostalihnek, stizvgostovanjslo, stizvgostovanjzam, stizvgostovanjint, stobisknekom, stobisknekommat, stobisknekomgostslo, stobisknekomgostzam, stobisknekomgostint, stobiskprem, stobiskpremdoma, stobiskpremkopr, stobiskponprem, stobiskponpremdoma, stobiskponpremkopr, stobiskponpremkoprint, stobiskponpremgost, stobiskponpremzamejo, stobiskponpremint, avgobiskprired, avgzaseddvoran, avgcenavstopnice, stprodvstopnic, stkoprodukcij, stkoprodukcijint, stkoprodukcijnvo, stzaposlenih, stzaposigralcev, avgstnastopovigr, sthonorarnihzun, sthonorarnihzunigr, sthonorarnihzunigrtujjz, sthonorarnihzunsamoz, sredstvaint, sredstvaavt, sredstvazaprosenoprem, sredstvazaprosenoponprem, sredstvazaprosenoponprej, sredstvazaprosenogostujo, sredstvazaprosenoint, sredstvazaprosenofest, sredstvazaprosenorazno, sredstvazaprosenoizjem, sredstvadrugijavniprem, sredstvadrugijavniponprem, sredstvadrugijavniponprej, sredstvadrugijavnigostujo, sredstvadrugijavniint, sredstvadrugijavnifest, sredstvadrugijavnirazno, sredstvadrugijavniizjem, sredstvadrugiviriprem, sredstvadrugiviriponprem, sredstvadrugiviriponprej, sredstvadrugivirigostujo, sredstvadrugiviriint, sredstvadrugivirifest, sredstvadrugivirirazno, sredstvadrugiviriizjem, sredstvaavtsamoz) FROM stdin;
00290000-5628-c580-3407-0ae1500b5971	0001	Testni program dela	2016-02-01	2017-02-01	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 3114 (class 0 OID 23144599)
-- Dependencies: 239
-- Data for Name: programskaenotasklopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programskaenotasklopa (id, naslovpe, avtorpe, obsegpe, mesecpe, vrednostpe, obiskdoma, programrazno_id) FROM stdin;
\.


--
-- TOC entry 3090 (class 0 OID 23144200)
-- Dependencies: 215
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, popa_id, naslov_id, sifra, naziv, jeprizorisce, jematicnioder, seplanira, kapaciteta, opis) FROM stdin;
00220000-5628-c57f-8d49-868564ad9662	\N	\N	0001	Poskusna 1	f	\N	t	8	Poskusna učilnica v prvem
00220000-5628-c57f-9420-a5349570947c	\N	\N	0002	Poskusna 3	f	\N	f	34	Poskusna učilnica v tretjem
00220000-5628-c57f-2cf0-21d3591ea69d	\N	\N	0003	Kazinska	t	\N	t	84	Kazinska dvorana
00220000-5628-c57f-3af1-8cd7f01bc297	\N	\N	0004	Mali oder	t	\N	t	24	Mali oder 
00220000-5628-c57f-7692-a724d7f9916c	\N	\N	0005	Komorni oder	t	\N	t	150	Komorni oder
00220000-5628-c57f-8981-d4b4caf2f9a5	\N	\N	0006	Stara dvorana	t	\N	t	96	Stara dvorana ali dvorana Franceta Prešerna
00220000-5628-c57f-ca52-a8a357358709	\N	\N	0007	Velika dvorana	t	\N	t	160	Velika, glavna dvorana
\.


--
-- TOC entry 3082 (class 0 OID 23144144)
-- Dependencies: 207
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 3081 (class 0 OID 23144134)
-- Dependencies: 206
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 3103 (class 0 OID 23144345)
-- Dependencies: 228
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta, status) FROM stdin;
\.


--
-- TOC entry 3097 (class 0 OID 23144275)
-- Dependencies: 222
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 3068 (class 0 OID 23143991)
-- Dependencies: 193
-- Data for Name: report; Type: TABLE DATA; Schema: public; Owner: -
--

COPY report (id, job_id, title, filename, transfers, size, format, hash, createdat) FROM stdin;
\.


--
-- TOC entry 3049 (class 0 OID 23143765)
-- Dependencies: 174
-- Data for Name: revizije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY revizije (id, razred, objectid, upor, datum, tip, data) FROM stdin;
1	App\\Entity\\Popa	00080000-5628-c583-1d04-09b89008a304	00010000-5628-c57d-d7cb-4bf48d78c946	2015-10-22 13:16:19	INS	a:0:{}
2	App\\Entity\\Option	00000000-5628-c583-b06a-7e4e9dfc4d41	00010000-5628-c57d-d7cb-4bf48d78c946	2015-10-22 13:16:19	INS	a:0:{}
3	ProgramDela\\Entity\\ProdukcijskaHisa	00190000-5628-c583-c13b-e2d92f90cced	00010000-5628-c57d-d7cb-4bf48d78c946	2015-10-22 13:16:19	INS	a:0:{}
\.


--
-- TOC entry 3133 (class 0 OID 0)
-- Dependencies: 173
-- Name: revizije_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('revizije_id_seq', 3, true);


--
-- TOC entry 3091 (class 0 OID 23144213)
-- Dependencies: 216
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 3053 (class 0 OID 23143803)
-- Dependencies: 178
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-5628-c57c-7e0e-c3c341131391	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-5628-c57c-53eb-f5c00bc6ab53	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-5628-c57c-febc-39bb731c3861	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-5628-c57c-433f-a66c6ff63869	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-5628-c57c-cc60-7478b66e2353	planer	Planer dogodkov v koledarju	t
00020000-5628-c57d-f10b-b5170fad65cf	kadrovska	Kadrovska služba	t
00020000-5628-c57d-1e9d-9212fe7ee7c1	arhivar	Ažuriranje arhivalij	t
00020000-5628-c57d-afa4-717983e83d78	igralec	Igralec	t
00020000-5628-c57d-56b3-8dde30df0985	prisotnost	Vnašalec prisotnosti, tudi za tiste izven uprizoritev	t
00020000-5628-c57f-bc50-4779b2e740ea	vsadovoljenja	Vloga z vsemi posameznimi dovoljenji	t
\.


--
-- TOC entry 3051 (class 0 OID 23143787)
-- Dependencies: 176
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-5628-c57d-daa1-4c38c6dd1199	00020000-5628-c57c-febc-39bb731c3861
00010000-5628-c57d-d7cb-4bf48d78c946	00020000-5628-c57c-febc-39bb731c3861
00010000-5628-c57f-8c87-671040a061d6	00020000-5628-c57f-bc50-4779b2e740ea
\.


--
-- TOC entry 3093 (class 0 OID 23144227)
-- Dependencies: 218
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 3085 (class 0 OID 23144165)
-- Dependencies: 210
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 3079 (class 0 OID 23144111)
-- Dependencies: 204
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, sifra, ime, zacetek, konec, aktivna) FROM stdin;
001f0000-5628-c57f-aa8d-8e63691073fc	2015	Sezona 2015	2015-01-01	2015-12-31	t
001f0000-5628-c57f-7409-c5b937961f63	2016	Sezona 2016	2016-01-01	2016-12-31	t
001f0000-5628-c57f-3b5b-fe1b0c47542d	2017	Sezona 2017	2017-01-01	2017-12-31	t
\.


--
-- TOC entry 3047 (class 0 OID 23143752)
-- Dependencies: 172
-- Data for Name: stevilcenje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenje (id, sifra, naziv, prefix, suffix, zacetek, dolzina, format, globalno, poletih) FROM stdin;
00230000-5628-c57c-effd-8468ddcee77d	pri	Privzeto številčenje po letih YYYY-N	\N	\N	1	1	%l-%n	f	t
00230000-5628-c57c-b3e0-6a79ec05c142	123	Privzeto številčenje kratkih šifer	\N	\N	100	3	%n	f	f
00230000-5628-c57c-f450-6c9bc79b438f	bcd	Globalno številčenje črtnih kod	\N	\N	1	9	%n	t	f
00230000-5628-c57c-dcd2-fab220f38961	sif	Številčenje šifrant	\N	\N	1000	4	%n	f	f
00230000-5628-c57c-6475-c2373b30c026	tmp	Globalno številčenje začasnih številk	tmp	\N	1000	5	%l%n	t	t
\.


--
-- TOC entry 3046 (class 0 OID 23143744)
-- Dependencies: 171
-- Data for Name: stevilcenjekonfig; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjekonfig (id, stevilcenje_id, dok) FROM stdin;
00240000-5628-c57c-e7a0-5469441842b9	00230000-5628-c57c-dcd2-fab220f38961	popa
00240000-5628-c57c-7e40-74a42d2dcf14	00230000-5628-c57c-dcd2-fab220f38961	oseba
00240000-5628-c57c-92fc-7c2718c825fc	00230000-5628-c57c-dcd2-fab220f38961	tippopa
00240000-5628-c57c-3fb5-e61d088e56b7	00230000-5628-c57c-dcd2-fab220f38961	organizacijskaenota
00240000-5628-c57c-aea0-aef6e8f4b108	00230000-5628-c57c-dcd2-fab220f38961	sezona
00240000-5628-c57c-cab4-ff72cfa87a4b	00230000-5628-c57c-dcd2-fab220f38961	tipvaje
00240000-5628-c57c-5433-da35b9393c40	00230000-5628-c57c-b3e0-6a79ec05c142	prostor
00240000-5628-c57c-f711-a6e42ba975d8	00230000-5628-c57c-dcd2-fab220f38961	besedilo
00240000-5628-c57c-38b7-c0493756f9a1	00230000-5628-c57c-dcd2-fab220f38961	uprizoritev
00240000-5628-c57c-6532-45dabbc595ee	00230000-5628-c57c-dcd2-fab220f38961	funkcija
00240000-5628-c57c-b016-d3808f30e9b5	00230000-5628-c57c-dcd2-fab220f38961	tipfunkcije
00240000-5628-c57c-bd48-08c0f957f8c4	00230000-5628-c57c-dcd2-fab220f38961	alternacija
00240000-5628-c57c-233e-1d705ef14c83	00230000-5628-c57c-effd-8468ddcee77d	pogodba
00240000-5628-c57c-981e-16d36efa4d86	00230000-5628-c57c-dcd2-fab220f38961	zaposlitev
00240000-5628-c57c-4c57-ca7dacf1e1aa	00230000-5628-c57c-dcd2-fab220f38961	zvrstuprizoritve
00240000-5628-c57c-541f-97be729f8a9d	00230000-5628-c57c-effd-8468ddcee77d	programdela
00240000-5628-c57c-d440-dd9c1add6f77	00230000-5628-c57c-dcd2-fab220f38961	zapis
\.


--
-- TOC entry 3045 (class 0 OID 23143739)
-- Dependencies: 170
-- Data for Name: stevilcenjestanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjestanje (id, objid, leto, stevilka) FROM stdin;
7b3af8fd-1e4c-42ab-9ef2-46d51906d196	00240000-5628-c57c-e7a0-5469441842b9	0	1001
\.


--
-- TOC entry 3099 (class 0 OID 23144292)
-- Dependencies: 224
-- Data for Name: strosekuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY strosekuprizoritve (id, uprizoritev_id, popa_id, naziv, vrednostdo, vrednostna, opis, tipstroska, sort, vrstastroska_id) FROM stdin;
00270000-5628-c580-a6c1-d04eeae14621	000e0000-5628-c580-4894-a71a920a16e4	00080000-5628-c57f-1207-7efe029eef8a	Nabava kostumov	600.50	20.00	Krila in maske	materialni	1	003b0000-5628-c57c-d71c-12b41bcf395d
00270000-5628-c580-1ba6-e38e3f95774d	000e0000-5628-c580-4894-a71a920a16e4	00080000-5628-c57f-1207-7efe029eef8a	Zavese	125.70	3.10	Modra in zelena zavesa	materialni	2	003b0000-5628-c57c-d71c-12b41bcf395d
\.


--
-- TOC entry 3059 (class 0 OID 23143875)
-- Dependencies: 184
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 3080 (class 0 OID 23144121)
-- Dependencies: 205
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja, dezurni, gost) FROM stdin;
001a0000-5628-c580-0109-9b89342ec2b5	00180000-5628-c580-ef54-371a8af9bdb6	000c0000-5628-c580-6b72-ab77521bd73f	00090000-5628-c57f-4552-50ed6113c044	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-5628-c580-6330-045b084045ea	00180000-5628-c580-ef54-371a8af9bdb6	000c0000-5628-c580-cdc6-9bce19dca3af	00090000-5628-c580-d347-17cf7142b7be	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-5628-c580-a39b-d0163ebb77c6	00180000-5628-c580-ef54-371a8af9bdb6	000c0000-5628-c580-092a-55fdc5595a6d	00090000-5628-c57f-2087-b67737b8893d	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-5628-c580-f22d-b0ca7f0dc094	00180000-5628-c580-ef54-371a8af9bdb6	000c0000-5628-c580-2eef-a53c6a7f8a1d	00090000-5628-c57f-9518-a3e4198ef22b	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-5628-c580-fdab-05c47f64504e	00180000-5628-c580-ef54-371a8af9bdb6	000c0000-5628-c580-2056-d57577d8ed72	00090000-5628-c580-6d4f-d62f7074fe98	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-5628-c580-e421-86599a6633ab	00180000-5628-c580-1a2c-07b4f75874fc	\N	00090000-5628-c580-6d4f-d62f7074fe98	2015-08-01 20:00:00	2015-08-01 23:00:00	\N	\N	2.00	t	f
001a0000-5628-c580-59f1-34d20ed761ae	00180000-5628-c580-1a2c-07b4f75874fc	\N	00090000-5628-c580-d347-17cf7142b7be	2015-08-01 20:00:00	2015-08-01 23:00:00	\N	\N	2.00	f	t
\.


--
-- TOC entry 3102 (class 0 OID 23144333)
-- Dependencies: 227
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, sifra, ime, opis, imezenski, podrocje, sort) FROM stdin;
000f0000-5628-c57c-c28b-cf968c4156a3	01	Avtor	Avtorji	Avtorka	umetnik	150
000f0000-5628-c57c-8c64-7289407aff52	02	Priredba	Priredba	Priredba	umetnik	160
000f0000-5628-c57c-27fe-3359d2e21507	03	Prevod	Prevod	Prevod	umetnik	20
000f0000-5628-c57c-9a4f-948167145b8f	04	Režija	Režija	Režija	umetnik	30
000f0000-5628-c57c-bdda-9b0e1dd8acf1	05	Dramaturgija	Dramaturgija	Dramaturgija	umetnik	40
000f0000-5628-c57c-9eee-2321f57691c2	06	Scenografija	Scenografija	Scenografija	umetnik	60
000f0000-5628-c57c-8fe1-81b84824f0f1	07	Kostumografija	Kostumografija	Kostumografija	umetnik	70
000f0000-5628-c57c-7227-cd77f3b2be26	08	Koreografija	Koreografija	Koreografija	umetnik	90
000f0000-5628-c57c-2ac4-9feca58e7dd0	09	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	umetnik	100
000f0000-5628-c57c-f47c-f27f2dd57df5	10	Oblikovanje maske	Oblikovanje maske	Oblikovanje maske	umetnik	110
000f0000-5628-c57c-c04a-b07e5ef63f7c	11	Lektorstvo	Lektorstvo	Lektorstvo	umetnik	50
000f0000-5628-c57c-8a81-d92790bdb9eb	12	Glasbeni soustvarjalec	Glasbeni soustvarjalci	Glasbena soustvarjalka	umetnik	80
000f0000-5628-c57c-7c49-2da7919c6492	13	Intermedijski ustvarjalec	Intermedijski ustvarjalci	Intermedijski ustvarjalka	umetnik	130
000f0000-5628-c57c-b050-051480d9f870	14	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	umetnik	120
000f0000-5628-c57c-f9c1-8b64eb7e691f	15	Vloga	Intermedijski ustvarjalci	Intermedijska ustvarjalka	igralec	10
000f0000-5628-c57c-3698-66945f542059	16	Produkcija, mentorstvo	Produkcija, mentorstvo	Produkcija, mentorstvo	umetnik	140
000f0000-5628-c57c-8537-1922a7251157	17	Tehnična podpora	Tehnična podpora	Tehnična podpora	tehnik	180
000f0000-5628-c57c-23c8-64c9125237c7	18	Inšpicient	Inšpicienti	Inšpicientka	inspicient	170
\.


--
-- TOC entry 3056 (class 0 OID 23143829)
-- Dependencies: 181
-- Data for Name: tippopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tippopa (id, sifra, ime, opis) FROM stdin;
00400000-5628-c57f-0e72-4b7e7f2fc025	0001	šola	osnovna ali srednja šola
00400000-5628-c57f-e68a-c0a6b65f179d	0002	gledalec	gledalec, ki ima abonma ali podobno
00400000-5628-c57f-a2fa-8ae84f7f4596	0003	sponzor	sponzor dogodkov
\.


--
-- TOC entry 3115 (class 0 OID 23144610)
-- Dependencies: 240
-- Data for Name: tipprogramskeenote; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipprogramskeenote (id, sifra, naziv, koprodukcija, maxfaktor, maxvsi) FROM stdin;
002b0000-5628-c4ce-d774-6749f4b462f6	01	Velika predstava	f	1.00	1.00
002b0000-5628-c4ce-ca29-e6ceff23eca6	02	Mala predstava	f	0.50	0.50
002b0000-5628-c4ce-67f2-9e7e3ff7b56d	03	Mala koprodukcija	t	0.40	1.00
002b0000-5628-c4ce-c42e-ecf25e7a95bb	04	Srednja koprodukcija	t	0.70	2.00
002b0000-5628-c4ce-eac5-ca3af3070c2f	05	Velika koprodukcija	t	1.00	3.00
\.


--
-- TOC entry 3078 (class 0 OID 23144101)
-- Dependencies: 203
-- Data for Name: tipvaje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipvaje (id, sifra, ime, opis) FROM stdin;
00420000-5628-c570-a319-074a148d6dc8	0001	prva vaja	prva vaja
00420000-5628-c572-605d-f46311b7a917	0002	tehnična vaja	tehnična vaja
00420000-5628-c574-0556-168202e19f42	0003	lučna vaja	lučna vaja
00420000-5628-c575-2787-d6a27e808586	0004	kostumska vaja	kostumska vaja
00420000-5628-c575-8240-f355ff557008	0005	foto vaja	foto vaja
00420000-5628-c576-8008-579c57008a7f	0006	1. glavna vaja	1. glavna vaja
00420000-5628-c577-b4f6-f45f928b05c2	0007	2. glavna vaja	2. glavna vaja
00420000-5628-c577-4794-ba7e48029929	0008	1. generalka	1. generalka
00420000-5628-c578-71dd-d7033be305ac	0009	2. generalka	2. generalka
00420000-5628-c579-6ec0-5e66a053bfd9	0010	odprta generalka	odprta generalka
00420000-5628-c57a-709f-b1905005c47e	0011	obnovitvena vaja	obnovitvena vaja
00420000-5628-c57a-4095-8d3355e13eb6	0012	pevska vaja	pevska vaja
00420000-5628-c57b-2e11-0674762c31ba	0013	postavitev scene	postavitev scene (za pripravo vaje)
00420000-5628-c57c-09fc-13d0c694e044	0014	postavitev luči	postavitev luči (za pripravo vaje)
\.


--
-- TOC entry 3065 (class 0 OID 23143948)
-- Dependencies: 190
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 3050 (class 0 OID 23143774)
-- Dependencies: 175
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-5628-c57d-d7cb-4bf48d78c946	Konzolni	$2y$05$NS4xMjkyMTcwMzExMjAxROg6onzV3kZGu54ARXGrpurtJYLDsausq	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-5628-c57f-3ff7-188ce4f14d58	testni uporabnik za inšpicienta	$2y$05$NS4xMjkyMTcwMzExMjAxROxkJ1B6xAXex6EZLIwJfWzRJ8DpfecFO	t	\N	\N	\N	ivo@ifigenija.si	\N	\N	\N
00010000-5628-c57f-cce1-1bac9fe1378e	testni uporabnik za Tehničnega vodjo	$2y$05$NS4xMjkyMTcwMzExMjAxROu/kXWR9sP9oamkesKuxXLbxkCb387.G	t	\N	\N	\N	tona@ifigenija.si	\N	\N	\N
00010000-5628-c57f-7195-fa453b02ab6f	testni uporabnik za igralca	$2y$05$NS4xMjkyMTcwMzExMjAxRO/hLCgClfERRsfCAFYwxNCcFIVjP2982	t	\N	\N	\N	irena@ifigenija.si	\N	\N	\N
00010000-5628-c57f-6546-6ae5eaeddc28	testni uporabnik vnašalca termina storitev (TerminStoritve-vse)	$2y$05$NS4xMjkyMTcwMzExMjAxROT6.kTHqEq4.wa2SOnf124/N14m9qeP.	t	\N	\N	\N	tatjana@ifigenija.si	\N	\N	\N
00010000-5628-c57f-4876-35b41231a8f1	testni uporabnik, ki je inšpicient brez zapisov v TerminStoritve	$2y$05$NS4xMjkyMTcwMzExMjAxROHau47Dtb7CME5.nlWwBVM.nusFP.ra2	t	\N	\N	\N	joze@ifigenija.si	\N	\N	\N
00010000-5628-c57f-24d7-8ca896eae61e	testna uporabnica, ki je planerka	$2y$05$NS4xMjkyMTcwMzExMjAxRO.B/uJO3C7QRNhdX9Q2hTLQsSupj1V1S	t	\N	\N	\N	petra@ifigenija.si	\N	\N	\N
00010000-5628-c57f-927f-766dbe583fd8	testni uporabnik, ki dobi ifi-all vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROv2d7jqhaV/Mz3EIsKoi7UoFR.SDSMBm	t	\N	\N	\N	ali@ifigenija.si	\N	\N	\N
00010000-5628-c57f-b984-5f892647dd66	testni uporabnik, ki dobi ifi-readall vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROYB9g.gnkufr1l/gWK6mkx.ySqrOWnJC	t	\N	\N	\N	berta@ifigenija.si	\N	\N	\N
00010000-5628-c57f-4a0c-37ec7c7f91cb	testni uporabnik, ki dobi aaa-write dovoljenje	$2y$05$NS4xMjkyMTcwMzExMjAxRORujYObKX.DzpXVYbePkiJkHqg0/Ylya	t	\N	\N	\N	aaron@ifigenija.si	\N	\N	\N
00010000-5628-c57f-8c87-671040a061d6	testni uporabnik ki dobi vsa posamezna dovoljenja	$2y$05$NS4xMjkyMTcwMzExMjAxRO2ymwxVXTr7U4Ncdn.bN49E8rLw9Jg0O	t	\N	\N	\N	vesna@ifigenija.si	\N	\N	\N
00010000-5628-c57d-daa1-4c38c6dd1199	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 3106 (class 0 OID 23144383)
-- Dependencies: 231
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, producent_id, sifra, faza, naslov, podnaslov, delovninaslov, internacionalninaslov, naslovizvirnika, podnaslovizvirnika, datumzacstudija, stevilovaj, planiranostevilovaj, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, krstna, prvaslovenska, kratkinaslov, jekoprodukcija, maticnioder_id) FROM stdin;
000e0000-5628-c580-1914-cedde377722c	00160000-5628-c57f-981e-f43905a1d434	\N	00140000-5628-c57c-ba29-0491866d4686	\N	0001	produkcija	Sen kresne noči		Sanje	\N	\N	\N	2016-02-01	\N	\N	2016-06-01	1	William  Shakespeare - Nebojša  Kavader	f	2				\N	f	\N	\N		\N	00220000-5628-c57f-7692-a724d7f9916c
000e0000-5628-c580-4894-a71a920a16e4	00160000-5628-c57f-7cb7-e6f37b2bdb4d	\N	00140000-5628-c57c-2fa4-9d9e58c66f72	\N	0002	predprodukcija-ideja	Smoletov vrt			\N	\N	\N	2016-01-01	\N	\N	2016-04-20	2	Berta   Hočevar	f	2				\N	f	\N	\N		\N	00220000-5628-c57f-8981-d4b4caf2f9a5
000e0000-5628-c580-a25a-bdda743a9d9a	\N	\N	00140000-5628-c57c-2fa4-9d9e58c66f72	00190000-5628-c580-00a4-194434de3932	0003	postprodukcija	Kisli maček			\N	\N	\N	2016-02-01	\N	\N	2016-04-20	2	\N	t	2				\N	f	\N	\N		\N	00220000-5628-c57f-7692-a724d7f9916c
000e0000-5628-c580-3b9e-a53cf818c656	\N	\N	00140000-5628-c57c-2fa4-9d9e58c66f72	00190000-5628-c580-00a4-194434de3932	0004	postprodukcija	Vladimir			\N	\N	\N	2017-03-01	\N	\N	2017-04-20	2	\N	t	2				\N	f	\N	\N		\N	00220000-5628-c57f-7692-a724d7f9916c
000e0000-5628-c580-09ca-88fb50971893	\N	\N	00140000-5628-c57c-2fa4-9d9e58c66f72	00190000-5628-c580-00a4-194434de3932	0005	postprodukcija	Španska princesa			\N	\N	\N	2017-04-01	\N	\N	2017-05-20	1	\N	f	1				\N	f	\N	\N		\N	00220000-5628-c57f-8d49-868564ad9662
000e0000-5628-c580-0270-22ef62eed835	\N	\N	00140000-5628-c57c-2fa4-9d9e58c66f72	00190000-5628-c580-00a4-194434de3932	0006	postprodukcija	Ne vemo datumov			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-5628-c57f-8d49-868564ad9662
\.


--
-- TOC entry 3073 (class 0 OID 23144047)
-- Dependencies: 198
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, tipvaje_id, uprizoritev_id, zaporedna, porocilo) FROM stdin;
00200000-5628-c580-9ee1-79d387cbf590	\N	000e0000-5628-c580-4894-a71a920a16e4	1	
00200000-5628-c580-73b1-8b47833dfce7	\N	000e0000-5628-c580-4894-a71a920a16e4	2	
00200000-5628-c580-1a49-3959f0e611a6	\N	000e0000-5628-c580-4894-a71a920a16e4	3	
00200000-5628-c580-2ff3-31823b6fcbe6	\N	000e0000-5628-c580-4894-a71a920a16e4	4	
00200000-5628-c580-cd2d-0e68ee69aeab	\N	000e0000-5628-c580-4894-a71a920a16e4	5	
\.


--
-- TOC entry 3089 (class 0 OID 23144192)
-- Dependencies: 214
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 3100 (class 0 OID 23144306)
-- Dependencies: 225
-- Data for Name: vrstastroska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstastroska (id, skupina, podskupina, naziv, opis) FROM stdin;
003b0000-5628-c57c-d438-dcd334cf5995	1	0	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE
003b0000-5628-c57c-f916-7a8b4e276e89	1	1	Storitve varovanja zgradb in prostorov	storitve varovanja zgradb in prostorov (npr. gasilci na predstavah)
003b0000-5628-c57c-8e0d-ac0992d53dea	1	2	Založniške in tiskarske storitve	založniške in tiskarske storitve
003b0000-5628-c57c-becc-ee63e5478f69	1	3	Časopisi, revije, knjige in strokovna literatura	časopisi, revije, knjige in strokovna literatura
003b0000-5628-c57c-8e9b-eff60dae548d	1	4	Stroški prevajalskih storitev	stroški prevajalskih storitev
003b0000-5628-c57c-9c8b-2e85ef7bcbb8	1	5	Stroški oglaševalskih storitev	stroški oglaševalskih storitev
003b0000-5628-c57c-4b0c-e4f37d4073f5	1	6	Izdatki za reprezentanco	izdatki za reprezentanco
003b0000-5628-c57c-612f-d7b6daff342d	2	0	POSEBNI MATERIAL IN STORITVE	POSEBNI MATERIAL IN STORITVE
003b0000-5628-c57c-d71c-12b41bcf395d	2	1	Drugi posebni material in storitve	drugi posebni material in storitve (npr. za instrumete - navedite)
003b0000-5628-c57c-a520-a63ba3028206	2	2	Oprema predstave – stroški rekvizitov	Oprema predstave – stroški rekvizitov
003b0000-5628-c57c-9c8b-a05a13d80bea	2	3	Oprema predstave – stroški kostumov	Oprema predstave – stroški kostumov
003b0000-5628-c57c-ff14-650380e71999	2	4	Oprema predstave – stroški scenske opreme	Oprema predstave – stroški scenske opreme
003b0000-5628-c57c-7e9f-802ec67445ab	2	5	Oprema predstave – stroški avdio in video opreme	Oprema predstave – stroški avdio in video opreme
003b0000-5628-c57c-72b8-bc2bf658eb48	3	0	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE
003b0000-5628-c57c-1e0f-d69e48c0c605	3	1	Poštnina in kurirske storitve	poštnina in kurirske storitve
003b0000-5628-c57c-4022-39e32a9725c2	4	0	PREVOZNI STROŠKI IN STORITVE	PREVOZNI STROŠKI IN STORITVE
003b0000-5628-c57c-6b6d-3d43454abe1c	4	1	Goriva in maziva za prevozna sredstva	goriva in maziva za prevozna sredstva
003b0000-5628-c57c-1384-1d0429732bbe	4	2	Najem vozil in selitveni stroški	najem vozil in selitveni stroški
003b0000-5628-c57c-54ea-c5fdff650d4f	4	3	Drugi prevozni in transportni stroški 	drugi prevozni in transportni stroški (navedite)
003b0000-5628-c57c-1a0e-f8947e939e6d	5	0	IZDATKI ZA SLUŽBENA POTOVANJA	IZDATKI ZA SLUŽBENA POTOVANJA
003b0000-5628-c57c-ed50-8d050655b399	5	1	Dnevnice za službena potovanja v državi in tujini	dnevnice za službena potovanja v državi in tujini
003b0000-5628-c57c-e61c-6b2ffc1ba8f2	5	2	Hotelske in restavra. storitve v državi in tujini	hotelske in restavra. storitve v državi in tujini
003b0000-5628-c57c-a357-957751e51ef3	5	3	Stroški prevoza v državi in tujini	stroški prevoza v državi in tujini
003b0000-5628-c57c-1157-90de324c51cf	5	4	Drugi izdatki za službena potovanja	drugi izdatki za službena potovanja (navedite)
003b0000-5628-c57c-ce6b-91417de58961	6	0	NAJEMNINE IN ZAKUPNINE	NAJEMNINE IN ZAKUPNINE
003b0000-5628-c57c-d94d-4ac5d42f958b	6	1	Druge najemnine, zakupnine in licenčnine	druge najemnine, zakupnine in licenčnine (npr. najem notnega materiala, instrumentov - navedite)
003b0000-5628-c57c-9868-d24c2ca94faf	7	0	DRUGI OPERATIVNI ODHODKI	DRUGI OPERATIVNI ODHODKI
003b0000-5628-c57c-fcea-d4fb5e1d52ba	7	1	Izdatki za strok. izobraževanje zap.	izdatki za strok. izobraževanje zap.(vezani na program. enote)  
\.


--
-- TOC entry 3118 (class 0 OID 23144657)
-- Dependencies: 243
-- Data for Name: vrstazapisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstazapisa (id, oznaka, naziv, aktiven, znacka, ikona, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3117 (class 0 OID 23144629)
-- Dependencies: 242
-- Data for Name: zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapis (id, vrsta_id, datoteka_id, mapa_id, avtor_id, zaklenil_id, tip, zaklenjen, datumzaklepanja, identifier, subject, title, description, coverage, creator, language, date, publisher, relation, rights, source, upor, datknj, standard, lokacija) FROM stdin;
\.


--
-- TOC entry 3119 (class 0 OID 23144669)
-- Dependencies: 244
-- Data for Name: zapislastnik; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapislastnik (id, zapis_id, lastnik, classlastnika, datum, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3096 (class 0 OID 23144264)
-- Dependencies: 221
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, sifra, status, delovnomesto, zacetek, konec, tip, delovnaobveza, malica, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci, organizacijskaenota_id) FROM stdin;
00100000-5628-c580-51d9-9b7048919d70	00090000-5628-c580-d347-17cf7142b7be	0010	A	Mojster	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-5628-c580-5711-39be6d313ad2	00090000-5628-c57f-2087-b67737b8893d	0003	A	Igralec	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-5628-c580-bd9d-373666cf6b28	00090000-5628-c57f-e46e-7469b7b93bc8	0008	A	Natakar	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-5628-c580-838a-da405653d8de	00090000-5628-c57f-eada-aecb78a43ea9	0004	A	Mizar	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-5628-c580-2ad6-444ab37595f2	00090000-5628-c57f-bb6a-2be843c05169	0009	A	Šivilja	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-5628-c580-ff31-6affc745fc4f	00090000-5628-c57f-58c9-e32ee9b00534	0007	A	Inšpicient	2010-02-01	\N	1	2		t	f	f	t	\N
\.


--
-- TOC entry 3076 (class 0 OID 23144090)
-- Dependencies: 201
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id, oseba_id) FROM stdin;
\.


--
-- TOC entry 3105 (class 0 OID 23144373)
-- Dependencies: 230
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, sifra, naziv, opis) FROM stdin;
00140000-5628-c57c-ba29-0491866d4686	01	Drama	drama (SURS 01)
00140000-5628-c57c-1957-9da8b0e3e3dc	02	Opera	opera (SURS 02)
00140000-5628-c57c-ae00-b7ed9a22a020	03	Balet	balet (SURS 03)
00140000-5628-c57c-46a3-2db182c2be6a	04	Plesne prireditve	plesne prireditve (SURS 04)
00140000-5628-c57c-3e3c-cfa3670f377a	05	Lutkovno gledališče	lutkovno gledališče (SURS 05)
00140000-5628-c57c-2fa4-9d9e58c66f72	06	Raziskovalno gledališče	raziskovalno gledališče (SURS 06)
00140000-5628-c57c-9532-f8f9c4182552	07	Drugo	drugo (SURS 07)
\.


--
-- TOC entry 3095 (class 0 OID 23144254)
-- Dependencies: 220
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, sifra, naziv, opis) FROM stdin;
\.


--
-- TOC entry 2545 (class 2606 OID 23143828)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2761 (class 2606 OID 23144432)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2757 (class 2606 OID 23144422)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2720 (class 2606 OID 23144289)
-- Name: avtorbesedila_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT avtorbesedila_pkey PRIMARY KEY (id);


--
-- TOC entry 2731 (class 2606 OID 23144331)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2818 (class 2606 OID 23144709)
-- Name: datoteka_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT datoteka_pkey PRIMARY KEY (id);


--
-- TOC entry 2627 (class 2606 OID 23144079)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2642 (class 2606 OID 23144100)
-- Name: dogodeksplosni_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodeksplosni
    ADD CONSTRAINT dogodeksplosni_pkey PRIMARY KEY (id);


--
-- TOC entry 2794 (class 2606 OID 23144627)
-- Name: drugivir_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT drugivir_pkey PRIMARY KEY (id);


--
-- TOC entry 2590 (class 2606 OID 23143974)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2768 (class 2606 OID 23144500)
-- Name: enotaprograma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT enotaprograma_pkey PRIMARY KEY (id);


--
-- TOC entry 2704 (class 2606 OID 23144250)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2618 (class 2606 OID 23144045)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2607 (class 2606 OID 23144012)
-- Name: job_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY job
    ADD CONSTRAINT job_pkey PRIMARY KEY (id);


--
-- TOC entry 2598 (class 2606 OID 23143988)
-- Name: kontaktnaoseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT kontaktnaoseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2668 (class 2606 OID 23144157)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2812 (class 2606 OID 23144686)
-- Name: mapa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT mapa_pkey PRIMARY KEY (id);


--
-- TOC entry 2816 (class 2606 OID 23144693)
-- Name: mapa_zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT mapa_zapis_pkey PRIMARY KEY (mapa_id, zapis_id);


--
-- TOC entry 2823 (class 2606 OID 23144717)
-- Name: mapaacl_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT mapaacl_pkey PRIMARY KEY (id);


--
-- TOC entry 2680 (class 2606 OID 23144184)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2583 (class 2606 OID 23143946)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2553 (class 2606 OID 23143847)
-- Name: optionvalue_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT optionvalue_pkey PRIMARY KEY (id);


--
-- TOC entry 2572 (class 2606 OID 23143908)
-- Name: organizacijskaenota_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT organizacijskaenota_pkey PRIMARY KEY (id);


--
-- TOC entry 2556 (class 2606 OID 23143871)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2543 (class 2606 OID 23143817)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2536 (class 2606 OID 23143802)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2683 (class 2606 OID 23144190)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2697 (class 2606 OID 23144226)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2743 (class 2606 OID 23144368)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2566 (class 2606 OID 23143899)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2580 (class 2606 OID 23143934)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2778 (class 2606 OID 23144579)
-- Name: postavkacdve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkacdve
    ADD CONSTRAINT postavkacdve_pkey PRIMARY KEY (id);


--
-- TOC entry 2672 (class 2606 OID 23144163)
-- Name: postavkaracuna_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT postavkaracuna_pkey PRIMARY KEY (id);


--
-- TOC entry 2578 (class 2606 OID 23143924)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2625 (class 2606 OID 23144064)
-- Name: praznik_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY praznik
    ADD CONSTRAINT praznik_pkey PRIMARY KEY (id);


--
-- TOC entry 2616 (class 2606 OID 23144033)
-- Name: predstava_abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava_abonma
    ADD CONSTRAINT predstava_abonma_pkey PRIMARY KEY (predstava_id, abonma_id);


--
-- TOC entry 2612 (class 2606 OID 23144025)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2678 (class 2606 OID 23144175)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2782 (class 2606 OID 23144588)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2784 (class 2606 OID 23144596)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2775 (class 2606 OID 23144566)
-- Name: programdela_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT programdela_pkey PRIMARY KEY (id);


--
-- TOC entry 2789 (class 2606 OID 23144608)
-- Name: programskaenotasklopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT programskaenotasklopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2690 (class 2606 OID 23144208)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2666 (class 2606 OID 23144148)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2660 (class 2606 OID 23144139)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2738 (class 2606 OID 23144355)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2718 (class 2606 OID 23144282)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2601 (class 2606 OID 23144000)
-- Name: report_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY report
    ADD CONSTRAINT report_pkey PRIMARY KEY (id);


--
-- TOC entry 2528 (class 2606 OID 23143773)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2695 (class 2606 OID 23144217)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2534 (class 2606 OID 23143791)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2538 (class 2606 OID 23143811)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2702 (class 2606 OID 23144235)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2674 (class 2606 OID 23144170)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2648 (class 2606 OID 23144119)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2525 (class 2606 OID 23143761)
-- Name: stevilcenje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenje
    ADD CONSTRAINT stevilcenje_pkey PRIMARY KEY (id);


--
-- TOC entry 2522 (class 2606 OID 23143749)
-- Name: stevilcenjekonfig_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT stevilcenjekonfig_pkey PRIMARY KEY (id);


--
-- TOC entry 2519 (class 2606 OID 23143743)
-- Name: stevilcenjestanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjestanje
    ADD CONSTRAINT stevilcenjestanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2727 (class 2606 OID 23144302)
-- Name: strosekuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT strosekuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2562 (class 2606 OID 23143880)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2654 (class 2606 OID 23144130)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2734 (class 2606 OID 23144342)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2547 (class 2606 OID 23143836)
-- Name: tippopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tippopa
    ADD CONSTRAINT tippopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2791 (class 2606 OID 23144620)
-- Name: tipprogramskeenote_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipprogramskeenote
    ADD CONSTRAINT tipprogramskeenote_pkey PRIMARY KEY (id);


--
-- TOC entry 2644 (class 2606 OID 23144108)
-- Name: tipvaje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipvaje
    ADD CONSTRAINT tipvaje_pkey PRIMARY KEY (id);


--
-- TOC entry 2588 (class 2606 OID 23143959)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2530 (class 2606 OID 23143786)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2755 (class 2606 OID 23144401)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2623 (class 2606 OID 23144054)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2686 (class 2606 OID 23144198)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2729 (class 2606 OID 23144314)
-- Name: vrstastroska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstastroska
    ADD CONSTRAINT vrstastroska_pkey PRIMARY KEY (id);


--
-- TOC entry 2805 (class 2606 OID 23144667)
-- Name: vrstazapisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstazapisa
    ADD CONSTRAINT vrstazapisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2802 (class 2606 OID 23144651)
-- Name: zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT zapis_pkey PRIMARY KEY (id);


--
-- TOC entry 2808 (class 2606 OID 23144675)
-- Name: zapislastnik_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT zapislastnik_pkey PRIMARY KEY (id);


--
-- TOC entry 2714 (class 2606 OID 23144272)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2640 (class 2606 OID 23144094)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2747 (class 2606 OID 23144381)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2710 (class 2606 OID 23144262)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2628 (class 1259 OID 23144088)
-- Name: dogodki_konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_konec ON dogodek USING btree (konec);


--
-- TOC entry 2629 (class 1259 OID 23144089)
-- Name: dogodki_razred; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_razred ON dogodek USING btree (razred);


--
-- TOC entry 2630 (class 1259 OID 23144087)
-- Name: dogodki_zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2631 (class 1259 OID 23144086)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2632 (class 1259 OID 23144085)
-- Name: idx_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2723 (class 1259 OID 23144303)
-- Name: idx_11ffe6e05c75296c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e05c75296c ON strosekuprizoritve USING btree (vrstastroska_id);


--
-- TOC entry 2724 (class 1259 OID 23144304)
-- Name: idx_11ffe6e062b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e062b4ffca ON strosekuprizoritve USING btree (uprizoritev_id);


--
-- TOC entry 2725 (class 1259 OID 23144305)
-- Name: idx_11ffe6e06beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e06beede51 ON strosekuprizoritve USING btree (popa_id);


--
-- TOC entry 2809 (class 1259 OID 23144688)
-- Name: idx_14a5d6d3727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d3727aca70 ON mapa USING btree (parent_id);


--
-- TOC entry 2810 (class 1259 OID 23144687)
-- Name: idx_14a5d6d38a4a6c12; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d38a4a6c12 ON mapa USING btree (lastnik_id);


--
-- TOC entry 2563 (class 1259 OID 23143901)
-- Name: idx_1c7adba589552cb2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba589552cb2 ON popa USING btree (tipkli_id);


--
-- TOC entry 2564 (class 1259 OID 23143902)
-- Name: idx_1c7adba5ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba5ee4b985a ON popa USING btree (drzava_id);


--
-- TOC entry 2681 (class 1259 OID 23144191)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2796 (class 1259 OID 23144655)
-- Name: idx_1ed92829253c4123; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829253c4123 ON zapis USING btree (avtor_id);


--
-- TOC entry 2797 (class 1259 OID 23144654)
-- Name: idx_1ed9282957ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282957ed422f ON zapis USING btree (mapa_id);


--
-- TOC entry 2798 (class 1259 OID 23144656)
-- Name: idx_1ed9282987ff3295; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282987ff3295 ON zapis USING btree (zaklenil_id);


--
-- TOC entry 2799 (class 1259 OID 23144653)
-- Name: idx_1ed92829a54dbb1f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829a54dbb1f ON zapis USING btree (datoteka_id);


--
-- TOC entry 2800 (class 1259 OID 23144652)
-- Name: idx_1ed92829ef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829ef943358 ON zapis USING btree (vrsta_id);


--
-- TOC entry 2675 (class 1259 OID 23144177)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2676 (class 1259 OID 23144176)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2620 (class 1259 OID 23144055)
-- Name: idx_2390fc964ad2a6ea; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc964ad2a6ea ON vaja USING btree (tipvaje_id);


--
-- TOC entry 2621 (class 1259 OID 23144056)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2705 (class 1259 OID 23144251)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2706 (class 1259 OID 23144253)
-- Name: idx_23aeb9586b361365; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9586b361365 ON funkcija USING btree (tipfunkcije_id);


--
-- TOC entry 2707 (class 1259 OID 23144252)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2595 (class 1259 OID 23143990)
-- Name: idx_2942b10710389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b10710389148 ON kontaktnaoseba USING btree (oseba_id);


--
-- TOC entry 2596 (class 1259 OID 23143989)
-- Name: idx_2942b1076beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b1076beede51 ON kontaktnaoseba USING btree (popa_id);


--
-- TOC entry 2787 (class 1259 OID 23144609)
-- Name: idx_2d901816d6bc69d6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2d901816d6bc69d6 ON programskaenotasklopa USING btree (programrazno_id);


--
-- TOC entry 2739 (class 1259 OID 23144370)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2740 (class 1259 OID 23144371)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2741 (class 1259 OID 23144372)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2806 (class 1259 OID 23144676)
-- Name: idx_2eaff9dcaf91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2eaff9dcaf91ecd ON zapislastnik USING btree (zapis_id);


--
-- TOC entry 2748 (class 1259 OID 23144406)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2749 (class 1259 OID 23144403)
-- Name: idx_344a77a7c3b0d59; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a7c3b0d59 ON uprizoritev USING btree (maticnioder_id);


--
-- TOC entry 2750 (class 1259 OID 23144407)
-- Name: idx_344a77a853a965c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a853a965c ON uprizoritev USING btree (producent_id);


--
-- TOC entry 2751 (class 1259 OID 23144405)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2752 (class 1259 OID 23144404)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2585 (class 1259 OID 23143961)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2586 (class 1259 OID 23143960)
-- Name: idx_37f6541a6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a6beede51 ON trr USING btree (popa_id);


--
-- TOC entry 2554 (class 1259 OID 23143874)
-- Name: idx_466966d769e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_466966d769e8d4 ON oseba USING btree (naslov_id);


--
-- TOC entry 2693 (class 1259 OID 23144218)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2540 (class 1259 OID 23143818)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2541 (class 1259 OID 23143819)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2698 (class 1259 OID 23144238)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2699 (class 1259 OID 23144237)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2700 (class 1259 OID 23144236)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2568 (class 1259 OID 23143911)
-- Name: idx_5e2fdc29289ed596; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29289ed596 ON organizacijskaenota USING btree (vodja_id);


--
-- TOC entry 2569 (class 1259 OID 23143910)
-- Name: idx_5e2fdc29727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29727aca70 ON organizacijskaenota USING btree (parent_id);


--
-- TOC entry 2570 (class 1259 OID 23143912)
-- Name: idx_5e2fdc29f0020ed7; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29f0020ed7 ON organizacijskaenota USING btree (namestnik_id);


--
-- TOC entry 2608 (class 1259 OID 23144028)
-- Name: idx_602f6e461174bb0e; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e461174bb0e ON predstava USING btree (dezurni_id);


--
-- TOC entry 2609 (class 1259 OID 23144026)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2610 (class 1259 OID 23144027)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2520 (class 1259 OID 23143751)
-- Name: idx_6054e804ff55f926; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_6054e804ff55f926 ON stevilcenjekonfig USING btree (stevilcenje_id);


--
-- TOC entry 2655 (class 1259 OID 23144143)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2656 (class 1259 OID 23144141)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2657 (class 1259 OID 23144140)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2658 (class 1259 OID 23144142)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2531 (class 1259 OID 23143792)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2532 (class 1259 OID 23143793)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2684 (class 1259 OID 23144199)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2819 (class 1259 OID 23144710)
-- Name: idx_781826c67e3c61f9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_781826c67e3c61f9 ON datoteka USING btree (owner_id);


--
-- TOC entry 2721 (class 1259 OID 23144291)
-- Name: idx_7ab77b7910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7ab77b7910389148 ON avtorbesedila USING btree (oseba_id);


--
-- TOC entry 2722 (class 1259 OID 23144290)
-- Name: idx_7ab77b79f35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7ab77b79f35157b1 ON avtorbesedila USING btree (besedilo_id);


--
-- TOC entry 2820 (class 1259 OID 23144718)
-- Name: idx_7adc957157ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc957157ed422f ON mapaacl USING btree (mapa_id);


--
-- TOC entry 2821 (class 1259 OID 23144719)
-- Name: idx_7adc9571fa6311ef; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc9571fa6311ef ON mapaacl USING btree (perm_id);


--
-- TOC entry 2670 (class 1259 OID 23144164)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2715 (class 1259 OID 23144283)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2716 (class 1259 OID 23144284)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2769 (class 1259 OID 23144505)
-- Name: idx_8787a0e54ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e54ae1cd1c ON enotaprograma USING btree (gostitelj_id);


--
-- TOC entry 2770 (class 1259 OID 23144504)
-- Name: idx_8787a0e55d0da56c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e55d0da56c ON enotaprograma USING btree (drzavagostovanja_id);


--
-- TOC entry 2771 (class 1259 OID 23144501)
-- Name: idx_8787a0e562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e562b4ffca ON enotaprograma USING btree (uprizoritev_id);


--
-- TOC entry 2772 (class 1259 OID 23144502)
-- Name: idx_8787a0e57222d84b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e57222d84b ON enotaprograma USING btree (tipprogramskeenote_id);


--
-- TOC entry 2773 (class 1259 OID 23144503)
-- Name: idx_8787a0e5771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e5771ec7bd ON enotaprograma USING btree (program_dela_id);


--
-- TOC entry 2574 (class 1259 OID 23143926)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2575 (class 1259 OID 23143925)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2576 (class 1259 OID 23143927)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2687 (class 1259 OID 23144212)
-- Name: idx_952dd21969e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd21969e8d4 ON prostor USING btree (naslov_id);


--
-- TOC entry 2688 (class 1259 OID 23144211)
-- Name: idx_952dd2196beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd2196beede51 ON prostor USING btree (popa_id);


--
-- TOC entry 2779 (class 1259 OID 23144589)
-- Name: idx_97af082e38c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e38c06eb ON produkcijadelitev USING btree (enotaprograma_id);


--
-- TOC entry 2780 (class 1259 OID 23144590)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2762 (class 1259 OID 23144436)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2763 (class 1259 OID 23144437)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2764 (class 1259 OID 23144434)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2765 (class 1259 OID 23144435)
-- Name: idx_a4b7244fa4976613; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fa4976613 ON alternacija USING btree (zaposlitev_id);


--
-- TOC entry 2711 (class 1259 OID 23144273)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2712 (class 1259 OID 23144274)
-- Name: idx_b24490415f1e9d88; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b24490415f1e9d88 ON zaposlitev USING btree (organizacijskaenota_id);


--
-- TOC entry 2661 (class 1259 OID 23144152)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2662 (class 1259 OID 23144151)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2663 (class 1259 OID 23144149)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2664 (class 1259 OID 23144150)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2758 (class 1259 OID 23144424)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2759 (class 1259 OID 23144423)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2599 (class 1259 OID 23144001)
-- Name: idx_c38372b2be04ea9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c38372b2be04ea9 ON report USING btree (job_id);


--
-- TOC entry 2602 (class 1259 OID 23144015)
-- Name: idx_c395a6181bb9e62c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a6181bb9e62c ON job USING btree (datum);


--
-- TOC entry 2603 (class 1259 OID 23144014)
-- Name: idx_c395a618941027cc; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618941027cc ON job USING btree (casizvedbe);


--
-- TOC entry 2604 (class 1259 OID 23144013)
-- Name: idx_c395a618a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618a76ed395 ON job USING btree (user_id);


--
-- TOC entry 2605 (class 1259 OID 23144016)
-- Name: idx_c395a618aecf5af0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618aecf5af0 ON job USING btree (izveden);


--
-- TOC entry 2619 (class 1259 OID 23144046)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2613 (class 1259 OID 23144034)
-- Name: idx_d9ece16b5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_d9ece16b5ac894aa ON predstava_abonma USING btree (predstava_id);


--
-- TOC entry 2614 (class 1259 OID 23144035)
-- Name: idx_d9ece16bbe74b11; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_d9ece16bbe74b11 ON predstava_abonma USING btree (abonma_id);


--
-- TOC entry 2776 (class 1259 OID 23144580)
-- Name: idx_dba42fe79e3adf2c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_dba42fe79e3adf2c ON postavkacdve USING btree (programdela_id);


--
-- TOC entry 2795 (class 1259 OID 23144628)
-- Name: idx_e7d4cf2638c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e7d4cf2638c06eb ON drugivir USING btree (enotaprograma_id);


--
-- TOC entry 2813 (class 1259 OID 23144694)
-- Name: idx_e9f8ee8257ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee8257ed422f ON mapa_zapis USING btree (mapa_id);


--
-- TOC entry 2814 (class 1259 OID 23144695)
-- Name: idx_e9f8ee82af91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee82af91ecd ON mapa_zapis USING btree (zapis_id);


--
-- TOC entry 2550 (class 1259 OID 23143849)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2551 (class 1259 OID 23143848)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2559 (class 1259 OID 23143881)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2560 (class 1259 OID 23143882)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2638 (class 1259 OID 23144095)
-- Name: idx_f44a386d10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_f44a386d10389148 ON zasedenost USING btree (oseba_id);


--
-- TOC entry 2650 (class 1259 OID 23144133)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2651 (class 1259 OID 23144132)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2652 (class 1259 OID 23144131)
-- Name: idx_fef7d84ba81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84ba81ccef6 ON terminstoritve USING btree (dogodek_id);


--
-- TOC entry 2633 (class 1259 OID 23144081)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2634 (class 1259 OID 23144082)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2635 (class 1259 OID 23144080)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2636 (class 1259 OID 23144084)
-- Name: uniq_11e93b5dbbc7a989; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dbbc7a989 ON dogodek USING btree (dogodek_splosni_id);


--
-- TOC entry 2637 (class 1259 OID 23144083)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2567 (class 1259 OID 23143900)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2548 (class 1259 OID 23143837)
-- Name: uniq_1d30700559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1d30700559828a3 ON tippopa USING btree (sifra);


--
-- TOC entry 2549 (class 1259 OID 23143838)
-- Name: uniq_1d3070055cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1d3070055cca980 ON tippopa USING btree (ime);


--
-- TOC entry 2591 (class 1259 OID 23143975)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2592 (class 1259 OID 23143977)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2593 (class 1259 OID 23143976)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2594 (class 1259 OID 23143978)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2669 (class 1259 OID 23144158)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2744 (class 1259 OID 23144369)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2753 (class 1259 OID 23144402)
-- Name: uniq_344a77a559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_344a77a559828a3 ON uprizoritev USING btree (sifra);


--
-- TOC entry 2735 (class 1259 OID 23144343)
-- Name: uniq_3f50510d559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d559828a3 ON tipfunkcije USING btree (sifra);


--
-- TOC entry 2736 (class 1259 OID 23144344)
-- Name: uniq_3f50510d55cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d55cca980 ON tipfunkcije USING btree (ime);


--
-- TOC entry 2557 (class 1259 OID 23143872)
-- Name: uniq_466966d7559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7559828a3 ON oseba USING btree (sifra);


--
-- TOC entry 2558 (class 1259 OID 23143873)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2708 (class 1259 OID 23144263)
-- Name: uniq_5216fcb0559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5216fcb0559828a3 ON zvrstuprizoritve USING btree (sifra);


--
-- TOC entry 2526 (class 1259 OID 23143762)
-- Name: uniq_5a434fbc559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5a434fbc559828a3 ON stevilcenje USING btree (sifra);


--
-- TOC entry 2584 (class 1259 OID 23143947)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2573 (class 1259 OID 23143909)
-- Name: uniq_5e2fdc29559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5e2fdc29559828a3 ON organizacijskaenota USING btree (sifra);


--
-- TOC entry 2523 (class 1259 OID 23143750)
-- Name: uniq_6054e804889a7556; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_6054e804889a7556 ON stevilcenjekonfig USING btree (dok);


--
-- TOC entry 2792 (class 1259 OID 23144621)
-- Name: uniq_7d834df4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_7d834df4559828a3 ON tipprogramskeenote USING btree (sifra);


--
-- TOC entry 2691 (class 1259 OID 23144210)
-- Name: uniq_952dd21937854736; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21937854736 ON prostor USING btree (naziv);


--
-- TOC entry 2692 (class 1259 OID 23144209)
-- Name: uniq_952dd219559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd219559828a3 ON prostor USING btree (sifra);


--
-- TOC entry 2645 (class 1259 OID 23144109)
-- Name: uniq_99664b14559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_99664b14559828a3 ON tipvaje USING btree (sifra);


--
-- TOC entry 2646 (class 1259 OID 23144110)
-- Name: uniq_99664b1455cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_99664b1455cca980 ON tipvaje USING btree (ime);


--
-- TOC entry 2766 (class 1259 OID 23144433)
-- Name: uniq_a4b7244f559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a4b7244f559828a3 ON alternacija USING btree (sifra);


--
-- TOC entry 2581 (class 1259 OID 23143935)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2745 (class 1259 OID 23144382)
-- Name: uniq_cede8e36559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_cede8e36559828a3 ON zvrstsurs USING btree (sifra);


--
-- TOC entry 2803 (class 1259 OID 23144668)
-- Name: uniq_de1c8aa1d55226c7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_de1c8aa1d55226c7 ON vrstazapisa USING btree (oznaka);


--
-- TOC entry 2785 (class 1259 OID 23144597)
-- Name: uniq_e6fc2028559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc2028559828a3 ON produkcijskahisa USING btree (sifra);


--
-- TOC entry 2786 (class 1259 OID 23144598)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2732 (class 1259 OID 23144332)
-- Name: uniq_ec773670ca2e5fcb; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ec773670ca2e5fcb ON besedilo USING btree (stevilka);


--
-- TOC entry 2649 (class 1259 OID 23144120)
-- Name: uniq_ecc8f8c5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ecc8f8c5559828a3 ON sezona USING btree (sifra);


--
-- TOC entry 2539 (class 1259 OID 23143812)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2858 (class 2606 OID 23144890)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2859 (class 2606 OID 23144895)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2863 (class 2606 OID 23144915)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2857 (class 2606 OID 23144885)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2861 (class 2606 OID 23144905)
-- Name: fk_11e93b5dbbc7a989; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dbbc7a989 FOREIGN KEY (dogodek_splosni_id) REFERENCES dogodeksplosni(id);


--
-- TOC entry 2862 (class 2606 OID 23144910)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2860 (class 2606 OID 23144900)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2897 (class 2606 OID 23145085)
-- Name: fk_11ffe6e05c75296c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e05c75296c FOREIGN KEY (vrstastroska_id) REFERENCES vrstastroska(id);


--
-- TOC entry 2898 (class 2606 OID 23145090)
-- Name: fk_11ffe6e062b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e062b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2899 (class 2606 OID 23145095)
-- Name: fk_11ffe6e06beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e06beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2932 (class 2606 OID 23145260)
-- Name: fk_14a5d6d3727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d3727aca70 FOREIGN KEY (parent_id) REFERENCES mapa(id);


--
-- TOC entry 2931 (class 2606 OID 23145255)
-- Name: fk_14a5d6d38a4a6c12; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d38a4a6c12 FOREIGN KEY (lastnik_id) REFERENCES uporabniki(id);


--
-- TOC entry 2835 (class 2606 OID 23144775)
-- Name: fk_1c7adba589552cb2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba589552cb2 FOREIGN KEY (tipkli_id) REFERENCES tippopa(id);


--
-- TOC entry 2836 (class 2606 OID 23144780)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2880 (class 2606 OID 23145000)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2928 (class 2606 OID 23145240)
-- Name: fk_1ed92829253c4123; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829253c4123 FOREIGN KEY (avtor_id) REFERENCES uporabniki(id);


--
-- TOC entry 2927 (class 2606 OID 23145235)
-- Name: fk_1ed9282957ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282957ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2929 (class 2606 OID 23145245)
-- Name: fk_1ed9282987ff3295; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282987ff3295 FOREIGN KEY (zaklenil_id) REFERENCES uporabniki(id);


--
-- TOC entry 2926 (class 2606 OID 23145230)
-- Name: fk_1ed92829a54dbb1f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829a54dbb1f FOREIGN KEY (datoteka_id) REFERENCES datoteka(id);


--
-- TOC entry 2925 (class 2606 OID 23145225)
-- Name: fk_1ed92829ef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829ef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstazapisa(id);


--
-- TOC entry 2879 (class 2606 OID 23144995)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2878 (class 2606 OID 23144990)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2855 (class 2606 OID 23144875)
-- Name: fk_2390fc964ad2a6ea; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc964ad2a6ea FOREIGN KEY (tipvaje_id) REFERENCES tipvaje(id);


--
-- TOC entry 2856 (class 2606 OID 23144880)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2888 (class 2606 OID 23145040)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2890 (class 2606 OID 23145050)
-- Name: fk_23aeb9586b361365; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9586b361365 FOREIGN KEY (tipfunkcije_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2889 (class 2606 OID 23145045)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2846 (class 2606 OID 23144830)
-- Name: fk_2942b10710389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b10710389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2845 (class 2606 OID 23144825)
-- Name: fk_2942b1076beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b1076beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2876 (class 2606 OID 23144980)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2923 (class 2606 OID 23145215)
-- Name: fk_2d901816d6bc69d6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT fk_2d901816d6bc69d6 FOREIGN KEY (programrazno_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2900 (class 2606 OID 23145100)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2901 (class 2606 OID 23145105)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2902 (class 2606 OID 23145110)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 2930 (class 2606 OID 23145250)
-- Name: fk_2eaff9dcaf91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT fk_2eaff9dcaf91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id);


--
-- TOC entry 2906 (class 2606 OID 23145130)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2903 (class 2606 OID 23145115)
-- Name: fk_344a77a7c3b0d59; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a7c3b0d59 FOREIGN KEY (maticnioder_id) REFERENCES prostor(id);


--
-- TOC entry 2907 (class 2606 OID 23145135)
-- Name: fk_344a77a853a965c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a853a965c FOREIGN KEY (producent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2905 (class 2606 OID 23145125)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2904 (class 2606 OID 23145120)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2844 (class 2606 OID 23144820)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2843 (class 2606 OID 23144815)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2832 (class 2606 OID 23144760)
-- Name: fk_466966d769e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d769e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2831 (class 2606 OID 23144755)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2884 (class 2606 OID 23145020)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2827 (class 2606 OID 23144735)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2828 (class 2606 OID 23144740)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2887 (class 2606 OID 23145035)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2886 (class 2606 OID 23145030)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2885 (class 2606 OID 23145025)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2838 (class 2606 OID 23144790)
-- Name: fk_5e2fdc29289ed596; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29289ed596 FOREIGN KEY (vodja_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2837 (class 2606 OID 23144785)
-- Name: fk_5e2fdc29727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29727aca70 FOREIGN KEY (parent_id) REFERENCES organizacijskaenota(id);


--
-- TOC entry 2839 (class 2606 OID 23144795)
-- Name: fk_5e2fdc29f0020ed7; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29f0020ed7 FOREIGN KEY (namestnik_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2851 (class 2606 OID 23144855)
-- Name: fk_602f6e461174bb0e; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e461174bb0e FOREIGN KEY (dezurni_id) REFERENCES oseba(id);


--
-- TOC entry 2849 (class 2606 OID 23144845)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2850 (class 2606 OID 23144850)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2824 (class 2606 OID 23144720)
-- Name: fk_6054e804ff55f926; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT fk_6054e804ff55f926 FOREIGN KEY (stevilcenje_id) REFERENCES stevilcenje(id);


--
-- TOC entry 2871 (class 2606 OID 23144955)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2869 (class 2606 OID 23144945)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2868 (class 2606 OID 23144940)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2870 (class 2606 OID 23144950)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2825 (class 2606 OID 23144725)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2826 (class 2606 OID 23144730)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2881 (class 2606 OID 23145005)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2935 (class 2606 OID 23145275)
-- Name: fk_781826c67e3c61f9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT fk_781826c67e3c61f9 FOREIGN KEY (owner_id) REFERENCES uporabniki(id);


--
-- TOC entry 2896 (class 2606 OID 23145080)
-- Name: fk_7ab77b7910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT fk_7ab77b7910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2895 (class 2606 OID 23145075)
-- Name: fk_7ab77b79f35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT fk_7ab77b79f35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2936 (class 2606 OID 23145280)
-- Name: fk_7adc957157ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc957157ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2937 (class 2606 OID 23145285)
-- Name: fk_7adc9571fa6311ef; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc9571fa6311ef FOREIGN KEY (perm_id) REFERENCES permission(id);


--
-- TOC entry 2877 (class 2606 OID 23144985)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2893 (class 2606 OID 23145065)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2894 (class 2606 OID 23145070)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2918 (class 2606 OID 23145190)
-- Name: fk_8787a0e54ae1cd1c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e54ae1cd1c FOREIGN KEY (gostitelj_id) REFERENCES popa(id);


--
-- TOC entry 2917 (class 2606 OID 23145185)
-- Name: fk_8787a0e55d0da56c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e55d0da56c FOREIGN KEY (drzavagostovanja_id) REFERENCES drza(id);


--
-- TOC entry 2914 (class 2606 OID 23145170)
-- Name: fk_8787a0e562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2915 (class 2606 OID 23145175)
-- Name: fk_8787a0e57222d84b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e57222d84b FOREIGN KEY (tipprogramskeenote_id) REFERENCES tipprogramskeenote(id);


--
-- TOC entry 2916 (class 2606 OID 23145180)
-- Name: fk_8787a0e5771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e5771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2841 (class 2606 OID 23144805)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2840 (class 2606 OID 23144800)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2842 (class 2606 OID 23144810)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2883 (class 2606 OID 23145015)
-- Name: fk_952dd21969e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd21969e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2882 (class 2606 OID 23145010)
-- Name: fk_952dd2196beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd2196beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2920 (class 2606 OID 23145200)
-- Name: fk_97af082e38c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e38c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2921 (class 2606 OID 23145205)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2912 (class 2606 OID 23145160)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2913 (class 2606 OID 23145165)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2910 (class 2606 OID 23145150)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 2911 (class 2606 OID 23145155)
-- Name: fk_a4b7244fa4976613; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fa4976613 FOREIGN KEY (zaposlitev_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2891 (class 2606 OID 23145055)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2892 (class 2606 OID 23145060)
-- Name: fk_b24490415f1e9d88; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b24490415f1e9d88 FOREIGN KEY (organizacijskaenota_id) REFERENCES organizacijskaenota(id);


--
-- TOC entry 2875 (class 2606 OID 23144975)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2874 (class 2606 OID 23144970)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2872 (class 2606 OID 23144960)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2873 (class 2606 OID 23144965)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2909 (class 2606 OID 23145145)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2908 (class 2606 OID 23145140)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2847 (class 2606 OID 23144835)
-- Name: fk_c38372b2be04ea9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY report
    ADD CONSTRAINT fk_c38372b2be04ea9 FOREIGN KEY (job_id) REFERENCES job(id);


--
-- TOC entry 2848 (class 2606 OID 23144840)
-- Name: fk_c395a618a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY job
    ADD CONSTRAINT fk_c395a618a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2854 (class 2606 OID 23144870)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2852 (class 2606 OID 23144860)
-- Name: fk_d9ece16b5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava_abonma
    ADD CONSTRAINT fk_d9ece16b5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id) ON DELETE CASCADE;


--
-- TOC entry 2853 (class 2606 OID 23144865)
-- Name: fk_d9ece16bbe74b11; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava_abonma
    ADD CONSTRAINT fk_d9ece16bbe74b11 FOREIGN KEY (abonma_id) REFERENCES abonma(id) ON DELETE CASCADE;


--
-- TOC entry 2919 (class 2606 OID 23145195)
-- Name: fk_dba42fe79e3adf2c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkacdve
    ADD CONSTRAINT fk_dba42fe79e3adf2c FOREIGN KEY (programdela_id) REFERENCES programdela(id);


--
-- TOC entry 2922 (class 2606 OID 23145210)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2924 (class 2606 OID 23145220)
-- Name: fk_e7d4cf2638c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT fk_e7d4cf2638c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2933 (class 2606 OID 23145265)
-- Name: fk_e9f8ee8257ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee8257ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id) ON DELETE CASCADE;


--
-- TOC entry 2934 (class 2606 OID 23145270)
-- Name: fk_e9f8ee82af91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee82af91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id) ON DELETE CASCADE;


--
-- TOC entry 2830 (class 2606 OID 23144750)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2829 (class 2606 OID 23144745)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2833 (class 2606 OID 23144765)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2834 (class 2606 OID 23144770)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2864 (class 2606 OID 23144920)
-- Name: fk_f44a386d10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT fk_f44a386d10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2867 (class 2606 OID 23144935)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2866 (class 2606 OID 23144930)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2865 (class 2606 OID 23144925)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- Completed on 2015-10-22 13:16:22 CEST

--
-- PostgreSQL database dump complete
--

