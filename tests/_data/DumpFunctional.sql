--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.10
-- Dumped by pg_dump version 9.3.10
-- Started on 2015-10-22 16:20:00 CEST

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
-- TOC entry 180 (class 1259 OID 23145374)
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
-- TOC entry 233 (class 1259 OID 23145979)
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
-- TOC entry 232 (class 1259 OID 23145962)
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
-- TOC entry 223 (class 1259 OID 23145839)
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
-- TOC entry 226 (class 1259 OID 23145869)
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
-- TOC entry 247 (class 1259 OID 23146250)
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
-- TOC entry 200 (class 1259 OID 23145619)
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
-- TOC entry 202 (class 1259 OID 23145650)
-- Name: dogodeksplosni; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodeksplosni (
    id uuid NOT NULL
);


--
-- TOC entry 241 (class 1259 OID 23146176)
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
-- TOC entry 191 (class 1259 OID 23145516)
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
-- TOC entry 234 (class 1259 OID 23145992)
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
-- TOC entry 219 (class 1259 OID 23145793)
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
-- TOC entry 197 (class 1259 OID 23145590)
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
-- TOC entry 194 (class 1259 OID 23145556)
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
-- TOC entry 192 (class 1259 OID 23145533)
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
-- TOC entry 208 (class 1259 OID 23145707)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 245 (class 1259 OID 23146231)
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
-- TOC entry 246 (class 1259 OID 23146243)
-- Name: mapa_zapis; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE mapa_zapis (
    mapa_id uuid NOT NULL,
    zapis_id uuid NOT NULL
);


--
-- TOC entry 248 (class 1259 OID 23146265)
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
-- TOC entry 212 (class 1259 OID 23145732)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 189 (class 1259 OID 23145490)
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
-- TOC entry 182 (class 1259 OID 23145393)
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
-- TOC entry 186 (class 1259 OID 23145457)
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
-- TOC entry 183 (class 1259 OID 23145404)
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
-- TOC entry 177 (class 1259 OID 23145348)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 179 (class 1259 OID 23145367)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 213 (class 1259 OID 23145739)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 217 (class 1259 OID 23145773)
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
-- TOC entry 229 (class 1259 OID 23145910)
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
-- TOC entry 185 (class 1259 OID 23145437)
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
-- TOC entry 188 (class 1259 OID 23145482)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 236 (class 1259 OID 23146121)
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
-- TOC entry 209 (class 1259 OID 23145713)
-- Name: postavkaracuna; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE postavkaracuna (
    id uuid NOT NULL,
    racun_id uuid
);


--
-- TOC entry 187 (class 1259 OID 23145467)
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
-- TOC entry 199 (class 1259 OID 23145611)
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
-- TOC entry 195 (class 1259 OID 23145571)
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
-- TOC entry 196 (class 1259 OID 23145583)
-- Name: predstava_abonma; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE predstava_abonma (
    predstava_id uuid NOT NULL,
    abonma_id uuid NOT NULL
);


--
-- TOC entry 211 (class 1259 OID 23145725)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 237 (class 1259 OID 23146135)
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
-- TOC entry 238 (class 1259 OID 23146145)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    sifra character varying(4) NOT NULL,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 235 (class 1259 OID 23146060)
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
-- TOC entry 239 (class 1259 OID 23146153)
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
-- TOC entry 215 (class 1259 OID 23145754)
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
-- TOC entry 207 (class 1259 OID 23145698)
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
-- TOC entry 206 (class 1259 OID 23145688)
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
-- TOC entry 228 (class 1259 OID 23145899)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying,
    status character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 222 (class 1259 OID 23145829)
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
-- TOC entry 193 (class 1259 OID 23145545)
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
-- TOC entry 174 (class 1259 OID 23145319)
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
-- TOC entry 173 (class 1259 OID 23145317)
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
-- TOC entry 216 (class 1259 OID 23145767)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 178 (class 1259 OID 23145357)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 176 (class 1259 OID 23145341)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 218 (class 1259 OID 23145781)
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
-- TOC entry 210 (class 1259 OID 23145719)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 204 (class 1259 OID 23145665)
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
-- TOC entry 172 (class 1259 OID 23145306)
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
-- TOC entry 171 (class 1259 OID 23145298)
-- Name: stevilcenjekonfig; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjekonfig (
    id uuid NOT NULL,
    stevilcenje_id uuid,
    dok character varying(100) DEFAULT NULL::character varying
);


--
-- TOC entry 170 (class 1259 OID 23145293)
-- Name: stevilcenjestanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjestanje (
    id uuid NOT NULL,
    objid uuid NOT NULL,
    leto integer NOT NULL,
    stevilka integer
);


--
-- TOC entry 224 (class 1259 OID 23145846)
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
-- TOC entry 184 (class 1259 OID 23145429)
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
-- TOC entry 205 (class 1259 OID 23145675)
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
-- TOC entry 227 (class 1259 OID 23145887)
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
-- TOC entry 181 (class 1259 OID 23145383)
-- Name: tippopa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tippopa (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    ime character varying(255) NOT NULL,
    opis text
);


--
-- TOC entry 240 (class 1259 OID 23146164)
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
-- TOC entry 203 (class 1259 OID 23145655)
-- Name: tipvaje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tipvaje (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    ime character varying(255) NOT NULL,
    opis text
);


--
-- TOC entry 190 (class 1259 OID 23145502)
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
-- TOC entry 175 (class 1259 OID 23145328)
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
-- TOC entry 231 (class 1259 OID 23145937)
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
-- TOC entry 198 (class 1259 OID 23145601)
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
-- TOC entry 214 (class 1259 OID 23145746)
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
-- TOC entry 225 (class 1259 OID 23145860)
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
-- TOC entry 243 (class 1259 OID 23146211)
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
-- TOC entry 242 (class 1259 OID 23146183)
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
-- TOC entry 244 (class 1259 OID 23146223)
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
-- TOC entry 221 (class 1259 OID 23145818)
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
-- TOC entry 201 (class 1259 OID 23145644)
-- Name: zasedenost; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zasedenost (
    id uuid NOT NULL,
    oseba_id uuid
);


--
-- TOC entry 230 (class 1259 OID 23145927)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 220 (class 1259 OID 23145808)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 2220 (class 2604 OID 23145322)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 3055 (class 0 OID 23145374)
-- Dependencies: 180
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
000a0000-5628-f08c-04ae-cf1ffc460628	10	30	Otroci	Abonma za otroke	200
000a0000-5628-f08c-7cbc-6d58a2c3b41f	20	60	Mladina	Abonma za mladino	400
000a0000-5628-f08c-e33c-110b38867b32	15	50	Odrasli	Abonma za odrasle	300
\.


--
-- TOC entry 3108 (class 0 OID 23145979)
-- Dependencies: 233
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, zaposlitev_id, oseba_id, pogodba_id, sifra, zaposlen, zacetek, konec, opomba, sort, privzeti, aktivna, imapogodbo, pomembna) FROM stdin;
000c0000-5628-f08d-dff8-a9c73ae50c02	000d0000-5628-f08d-cf20-d52fd79b9061	\N	00090000-5628-f08d-cdb3-fc31f46522b1	000b0000-5628-f08d-6e90-d6a187b46a45	0001	f	\N	\N	\N	3	t	\N	t	t
000c0000-5628-f08d-b715-e32e52369319	000d0000-5628-f08d-819b-6ced6031d06d	00100000-5628-f08d-82b1-deabf23e82d9	00090000-5628-f08d-60ff-ff9d9b490c1a	\N	0002	t	2016-01-01	\N	\N	8	t	\N	f	f
000c0000-5628-f08d-40ef-9e9e97a238ff	000d0000-5628-f08d-7426-fe380ff5f086	00100000-5628-f08d-e6fc-68a433c046a0	00090000-5628-f08d-380d-af7310e90380	\N	0003	t	\N	2015-10-22	\N	2	t	\N	f	f
000c0000-5628-f08d-aa84-a4785440ff12	000d0000-5628-f08d-41d6-5f3eaeb6f332	\N	00090000-5628-f08d-fc49-cb83e87e5a6e	\N	0004	f	2016-01-01	2016-01-01	\N	26	t	\N	f	f
000c0000-5628-f08d-f544-838dd30039bb	000d0000-5628-f08d-5441-3b748ec3e51f	\N	00090000-5628-f08d-c447-eea9045bffe2	\N	0005	f	2016-01-01	2016-01-01	\N	7	t	\N	f	f
000c0000-5628-f08d-fdcb-87cae69b0e37	000d0000-5628-f08d-98ed-e6b65d8b9450	\N	00090000-5628-f08d-3d24-8eed0869e5d0	000b0000-5628-f08d-df40-00a3b3834c9a	0006	f	2016-01-01	2016-01-01	\N	1	t	\N	t	t
000c0000-5628-f08d-eaab-dbbedecda040	000d0000-5628-f08d-7727-dabf65a420e2	00100000-5628-f08d-6eca-d1f1c4990929	00090000-5628-f08d-62a2-9ade4a975483	\N	0007	t	2016-01-01	2016-01-01	\N	14	t	\N	f	t
000c0000-5628-f08d-ba83-290dc96a6a25	000d0000-5628-f08d-f44f-2396e8b6032a	\N	00090000-5628-f08d-fe68-f900ca205c62	000b0000-5628-f08d-977c-b0926754d6ac	0008	f	2016-01-01	2016-01-01	\N	12	t	\N	t	t
000c0000-5628-f08d-cf4f-15e0d9afba13	000d0000-5628-f08d-7727-dabf65a420e2	00100000-5628-f08d-9eaa-50e510c9abcf	00090000-5628-f08d-330c-e8e52fae2aae	\N	0009	t	2017-01-01	2017-01-01	\N	15	t	\N	f	t
000c0000-5628-f08d-1391-a3e0e8ffe717	000d0000-5628-f08d-7727-dabf65a420e2	00100000-5628-f08d-766f-85e335b004fd	00090000-5628-f08d-8923-9109c2539471	\N	0010	t	\N	2015-10-22	\N	16	f	\N	f	t
000c0000-5628-f08d-2ad2-e0fd11b6eaaa	000d0000-5628-f08d-7727-dabf65a420e2	00100000-5628-f08d-265b-9a1bd1f08a29	00090000-5628-f08d-dc31-3d0e4c6cc523	\N	0011	t	2017-01-01	\N	\N	17	f	\N	f	t
000c0000-5628-f08d-7ad8-4d36108818b4	000d0000-5628-f08d-1639-22e9cab0c982	\N	00090000-5628-f08d-60ff-ff9d9b490c1a	000b0000-5628-f08d-fc64-132d557250cd	0012	f	\N	\N	\N	2	t	\N	t	t
\.


--
-- TOC entry 3107 (class 0 OID 23145962)
-- Dependencies: 232
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 3098 (class 0 OID 23145839)
-- Dependencies: 223
-- Data for Name: avtorbesedila; Type: TABLE DATA; Schema: public; Owner: -
--

COPY avtorbesedila (id, besedilo_id, oseba_id, tipavtorja, zaporedna, alivnaslovu) FROM stdin;
003d0000-5628-f08d-26a7-bf488fb81b6c	00160000-5628-f08c-0eb1-d2eb9606d0e1	00090000-5628-f08d-17a6-95fe57dc1c1f	aizv	10	t
003d0000-5628-f08d-667f-3f8c75665c80	00160000-5628-f08c-0eb1-d2eb9606d0e1	00090000-5628-f08d-e5cd-969edd9226af	apri	14	t
003d0000-5628-f08d-d7d7-7d82bea36da9	00160000-5628-f08c-3da3-5a34f398b844	00090000-5628-f08d-43eb-3cd755c355a3	aizv	11	t
003d0000-5628-f08d-0186-b07b12f67473	00160000-5628-f08c-daca-5241c7653c81	00090000-5628-f08d-f5a1-448fe2365b98	aizv	12	t
003d0000-5628-f08d-6bd3-6ac24bb11f16	00160000-5628-f08c-0eb1-d2eb9606d0e1	00090000-5628-f08d-92a2-96becf22d9a4	apri	18	f
\.


--
-- TOC entry 3101 (class 0 OID 23145869)
-- Dependencies: 226
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, stevilka, naslov, podnaslov, jezik, naslovizvirnika, podnaslovizvirnika, internacionalninaslov, datumprejema, moskevloge, zenskevloge, povzetekvsebine, letoizida, krajizida, zaloznik, avtor) FROM stdin;
00160000-5628-f08c-0eb1-d2eb9606d0e1	0001	Sen kresne noči		slovenščina	A Midsummer Night's Dream	\N	\N	2015-04-26	5	5	Nastopajo Titanija, Hipolita, Oberon, ...	\N	\N	\N	William  Shakespeare - Nebojša  Kavader
00160000-5628-f08c-3da3-5a34f398b844	0002	Bratje Karamazovi		slovenščina	Bratja Karamazjovji	\N	\N	2015-12-04	4	1	Svetovna uspešnica	\N	\N	\N	Fjodor Mihajlovič Dostojevski
00160000-5628-f08c-daca-5241c7653c81	0003	Smoletov Vrt		slovenščina		\N	\N	2015-05-26	2	8		\N	\N	\N	Berta   Hočevar
\.


--
-- TOC entry 3122 (class 0 OID 23146250)
-- Dependencies: 247
-- Data for Name: datoteka; Type: TABLE DATA; Schema: public; Owner: -
--

COPY datoteka (id, owner_id, filename, transfers, size, format, hash, createdat, uploadedat, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3075 (class 0 OID 23145619)
-- Dependencies: 200
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_splosni_id, prostor_id, sezona_id, allday, zacetek, konec, status, razred, termin, title) FROM stdin;
00180000-5628-f08d-3d2c-ee320d03c1de	\N	\N	00200000-5628-f08d-35e2-ca49442714d4	\N	\N	\N	\N	f	2015-06-26 10:00:00	2015-06-26 12:00:00	200s	200s		dogodek 1
00180000-5628-f08d-0e04-964df8fb3ea8	\N	\N	00200000-5628-f08d-9c8d-8b7b69bb2e05	\N	\N	\N	\N	f	2015-06-27 10:00:00	2015-06-27 12:00:00	300s	200s		dogodek 2
00180000-5628-f08d-08bb-78d668d1f454	\N	\N	00200000-5628-f08d-83f2-4cf1adc42083	\N	\N	\N	\N	f	2015-08-01 20:00:00	2015-08-01 23:00:00	400s	200s		dogodek 3
00180000-5628-f08d-847d-024e1e7551dc	\N	\N	00200000-5628-f08d-8b87-b004b54e9b3c	\N	\N	\N	\N	f	2015-08-01 20:00:00	2015-08-01 23:00:00	100s	200s		dogodek 4
00180000-5628-f08d-29dd-d282131d4250	\N	\N	00200000-5628-f08d-7391-b1a3d88d0848	\N	\N	\N	\N	f	2015-08-01 20:00:00	2015-08-01 23:00:00	500s	200s		dogodek 5
\.


--
-- TOC entry 3077 (class 0 OID 23145650)
-- Dependencies: 202
-- Data for Name: dogodeksplosni; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodeksplosni (id) FROM stdin;
\.


--
-- TOC entry 3116 (class 0 OID 23146176)
-- Dependencies: 241
-- Data for Name: drugivir; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drugivir (id, znesek, opis, mednarodni, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 3066 (class 0 OID 23145516)
-- Dependencies: 191
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-5628-f08a-4d72-13f8d8138017	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-5628-f08a-ea62-fd81c7ad0b1c	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-5628-f08a-ca91-5d3605deb061	AL	ALB	008	Albania 	Albanija	\N
00040000-5628-f08a-d9b7-d43c26285c4f	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-5628-f08a-e327-91cd3331d997	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-5628-f08a-6f40-2d2a0312ea4d	AD	AND	020	Andorra 	Andora	\N
00040000-5628-f08a-bb0f-964fc5773ce1	AO	AGO	024	Angola 	Angola	\N
00040000-5628-f08a-c9b8-1f50045d86f0	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-5628-f08a-7062-48d78347273a	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-5628-f08a-979d-af82adf14f7e	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-5628-f08a-fe95-b29e8a06fdc3	AR	ARG	032	Argentina 	Argenitna	\N
00040000-5628-f08a-e89d-2bfe4352783b	AM	ARM	051	Armenia 	Armenija	\N
00040000-5628-f08a-f806-7b375446c563	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-5628-f08a-be11-68325409c253	AU	AUS	036	Australia 	Avstralija	\N
00040000-5628-f08a-74cd-2ff17efe2185	AT	AUT	040	Austria 	Avstrija	\N
00040000-5628-f08a-06eb-b6cdfe6b542a	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-5628-f08a-7dee-56126a44b5f2	BS	BHS	044	Bahamas 	Bahami	\N
00040000-5628-f08a-7c6a-5d86a939de36	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-5628-f08a-aefb-8f17175ec6a0	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-5628-f08a-d922-b07646f28b4d	BB	BRB	052	Barbados 	Barbados	\N
00040000-5628-f08a-7b72-fc9995097222	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-5628-f08a-9256-6c968f0dabb5	BE	BEL	056	Belgium 	Belgija	\N
00040000-5628-f08a-4c60-4a54cb605c42	BZ	BLZ	084	Belize 	Belize	\N
00040000-5628-f08a-72c7-f97b129e846a	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-5628-f08a-99a1-2d47a6bfc3f2	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-5628-f08a-fc4d-c9b07395ea8d	BT	BTN	064	Bhutan 	Butan	\N
00040000-5628-f08a-34d3-2ba9c39e9e9f	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-5628-f08a-2440-f5c5abf8add4	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-5628-f08a-f0b5-77079d1da073	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-5628-f08a-fccc-4edb75bfa7ed	BW	BWA	072	Botswana 	Bocvana	\N
00040000-5628-f08a-829a-e5d9ad4fc216	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-5628-f08a-f7a3-11b242008e9d	BR	BRA	076	Brazil 	Brazilija	\N
00040000-5628-f08a-bafb-7da03d5b9531	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-5628-f08a-56a3-9110883acc35	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-5628-f08a-6284-49e7f6890882	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-5628-f08a-67b2-7156fd4204ab	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-5628-f08a-c600-48a0a9b9119a	BI	BDI	108	Burundi 	Burundi 	\N
00040000-5628-f08a-7b05-6e07dd147d20	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-5628-f08a-2ea8-dd049d017ad9	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-5628-f08a-83f0-b6b7a3a1a041	CA	CAN	124	Canada 	Kanada	\N
00040000-5628-f08a-1c9a-35cfd134ba4e	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-5628-f08a-4484-24182687a5ee	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-5628-f08a-eb60-e420286f5350	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-5628-f08a-343e-a526d80acf12	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-5628-f08a-22c2-eb7007daa66c	CL	CHL	152	Chile 	Čile	\N
00040000-5628-f08a-2d39-6451643a4c9d	CN	CHN	156	China 	Kitajska	\N
00040000-5628-f08a-4869-1066a8584897	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-5628-f08a-9fb3-9485f7c3c804	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-5628-f08a-9788-e30f39487f0b	CO	COL	170	Colombia 	Kolumbija	\N
00040000-5628-f08a-4275-0fe996f57a72	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-5628-f08a-9034-fdc894e91606	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-5628-f08a-d74a-a39dc29f944e	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-5628-f08a-7b22-42eafb033577	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-5628-f08a-f4a2-4a7287fe88e2	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-5628-f08a-6d07-353535740b48	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-5628-f08a-d98f-3880cd7d2629	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-5628-f08a-c62a-2b9d8e7c3898	CU	CUB	192	Cuba 	Kuba	\N
00040000-5628-f08a-df17-a163691eecb1	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-5628-f08a-4d35-50cfea3e690b	CY	CYP	196	Cyprus 	Ciper	\N
00040000-5628-f08a-0f1f-87a715df1919	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-5628-f08a-a785-91bf1a50edef	DK	DNK	208	Denmark 	Danska	\N
00040000-5628-f08a-dd88-9a33cd1aadd5	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-5628-f08a-f75f-5dd1039ecd92	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-5628-f08a-11e0-ca972e11e904	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-5628-f08a-d00c-1ff101e646f9	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-5628-f08a-3fe2-eb9e9d720a73	EG	EGY	818	Egypt 	Egipt	\N
00040000-5628-f08a-ef4f-cfc539e7cd93	SV	SLV	222	El Salvador 	Salvador	\N
00040000-5628-f08a-33da-e9e74454a981	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-5628-f08a-b00d-6ecd55683ca9	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-5628-f08a-2160-96dffb9b898d	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-5628-f08a-7a61-ad5cf1759ef7	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-5628-f08a-e0c3-d093862340b5	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-5628-f08a-fb49-d658e7810abf	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-5628-f08a-4d35-77593405ca1a	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-5628-f08a-0dc4-dd192efe6918	FI	FIN	246	Finland 	Finska	\N
00040000-5628-f08a-29bd-7ecd105d7056	FR	FRA	250	France 	Francija	\N
00040000-5628-f08a-6165-f2183d47468c	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-5628-f08a-b023-6365371e7fa1	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-5628-f08a-3803-95daf69c6501	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-5628-f08a-39fd-2f065eca3131	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-5628-f08a-557f-bf4b9d7574ea	GA	GAB	266	Gabon 	Gabon	\N
00040000-5628-f08a-89c4-3bd60e5ed2f1	GM	GMB	270	Gambia 	Gambija	\N
00040000-5628-f08a-1436-ceb9194ebd4b	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-5628-f08a-c0be-79da3acc231d	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-5628-f08a-b1cf-c459efe3710c	GH	GHA	288	Ghana 	Gana	\N
00040000-5628-f08a-7c41-116fcb264486	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-5628-f08a-9a11-1b724812ca76	GR	GRC	300	Greece 	Grčija	\N
00040000-5628-f08a-6825-45499ec8c2a5	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-5628-f08a-6a6f-51834d8118d4	GD	GRD	308	Grenada 	Grenada	\N
00040000-5628-f08a-883f-82d6d4deaf2a	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-5628-f08a-9309-6575091768cf	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-5628-f08a-d88e-f5c04211ea53	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-5628-f08a-f394-b524d5b0ed61	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-5628-f08a-93b7-cb06e57bf98f	GN	GIN	324	Guinea 	Gvineja	\N
00040000-5628-f08a-da1b-ab43d4a986a4	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-5628-f08a-8089-4410797c4237	GY	GUY	328	Guyana 	Gvajana	\N
00040000-5628-f08a-d506-537f98112016	HT	HTI	332	Haiti 	Haiti	\N
00040000-5628-f08a-77fc-14fa597069cf	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-5628-f08a-e473-54c1b9c2d600	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-5628-f08a-07ad-783981ffe475	HN	HND	340	Honduras 	Honduras	\N
00040000-5628-f08a-d74a-3b7e4053e09f	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-5628-f08a-a73b-a696c96ee5f2	HU	HUN	348	Hungary 	Madžarska	\N
00040000-5628-f08a-b22d-0b72378425b9	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-5628-f08a-95c0-2617daf1ae20	IN	IND	356	India 	Indija	\N
00040000-5628-f08a-6e3e-e6aa959e0b49	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-5628-f08a-b19c-559f8e2f3879	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-5628-f08a-ab0a-64a022bc704c	IQ	IRQ	368	Iraq 	Irak	\N
00040000-5628-f08a-6c71-26d783057523	IE	IRL	372	Ireland 	Irska	\N
00040000-5628-f08a-557f-0750ff3a1d54	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-5628-f08a-9c7f-0318c66a1d40	IL	ISR	376	Israel 	Izrael	\N
00040000-5628-f08a-d53d-40bd5d2cd690	IT	ITA	380	Italy 	Italija	\N
00040000-5628-f08a-60e7-515991bdbc81	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-5628-f08a-024a-5cfe555d85a3	JP	JPN	392	Japan 	Japonska	\N
00040000-5628-f08a-bbef-c57eeb395963	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-5628-f08a-ca7e-84a6cac525cf	JO	JOR	400	Jordan 	Jordanija	\N
00040000-5628-f08a-0802-7e2508d72349	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-5628-f08a-fe7b-f77a67d97b8c	KE	KEN	404	Kenya 	Kenija	\N
00040000-5628-f08a-3a98-ff34bac21a52	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-5628-f08a-81a8-4f2641f5d29d	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-5628-f08a-5041-17c459654eac	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-5628-f08a-c69f-77bafd5a438b	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-5628-f08a-7240-07e0c01aa57a	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-5628-f08a-fd54-9f8a432477d6	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-5628-f08a-77d2-ff68c5b52e44	LV	LVA	428	Latvia 	Latvija	\N
00040000-5628-f08a-88f8-947f7925a0dd	LB	LBN	422	Lebanon 	Libanon	\N
00040000-5628-f08a-09ae-3d27a3003769	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-5628-f08a-8b8c-128a3cff8f72	LR	LBR	430	Liberia 	Liberija	\N
00040000-5628-f08a-424f-76e71f118f75	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-5628-f08a-2059-fc28b357e6fc	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-5628-f08a-24a9-0dc1c26c4c06	LT	LTU	440	Lithuania 	Litva	\N
00040000-5628-f08a-5c79-522c45402a1b	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-5628-f08a-f142-b58937242e02	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-5628-f08a-d981-4ead7739b942	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-5628-f08a-048b-812e41deb4d4	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-5628-f08a-969a-34801e6309cb	MW	MWI	454	Malawi 	Malavi	\N
00040000-5628-f08a-b2f5-55015005e9ee	MY	MYS	458	Malaysia 	Malezija	\N
00040000-5628-f08a-1f2b-0459b9f2b2ca	MV	MDV	462	Maldives 	Maldivi	\N
00040000-5628-f08a-7eda-b6174ff991fc	ML	MLI	466	Mali 	Mali	\N
00040000-5628-f08a-d7c7-08e58a7d3570	MT	MLT	470	Malta 	Malta	\N
00040000-5628-f08a-1a2e-d169270579d3	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-5628-f08a-b1b2-36d28a272f0d	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-5628-f08a-be48-b8ca247ef181	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-5628-f08a-a692-015cd4ce24e6	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-5628-f08a-d9db-713ad3f55eab	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-5628-f08a-83f6-cd3c955476ca	MX	MEX	484	Mexico 	Mehika	\N
00040000-5628-f08a-c099-1ebfbf05e5c9	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-5628-f08a-5fe4-41791fe7570e	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-5628-f08a-f519-b5064ed6a756	MC	MCO	492	Monaco 	Monako	\N
00040000-5628-f08a-de37-d2dac0762f92	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-5628-f08a-218b-9ff7d82697c5	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-5628-f08a-015b-3c3dad723d74	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-5628-f08a-e0f9-8d9ddb50cb91	MA	MAR	504	Morocco 	Maroko	\N
00040000-5628-f08a-fdb9-9d6ff9c8cc4d	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-5628-f08a-ce6b-90858070515b	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-5628-f08a-6c50-862669203681	NA	NAM	516	Namibia 	Namibija	\N
00040000-5628-f08a-d06f-c42d643b0521	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-5628-f08a-5028-fafe285ad5f9	NP	NPL	524	Nepal 	Nepal	\N
00040000-5628-f08a-b499-dd7d1feb124f	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-5628-f08a-85ab-26ef49e36094	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-5628-f08a-3cee-d7001097be8a	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-5628-f08a-b8c6-6194237819a8	NE	NER	562	Niger 	Niger 	\N
00040000-5628-f08a-cb74-1c387b2844c8	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-5628-f08a-c6b9-767ee0065a16	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-5628-f08a-a792-83f0d13b5c2f	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-5628-f08a-1b50-4091e5a974c8	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-5628-f08a-d1ed-32f4478c6cd0	NO	NOR	578	Norway 	Norveška	\N
00040000-5628-f08a-bcb5-de77f3a323a0	OM	OMN	512	Oman 	Oman	\N
00040000-5628-f08a-b07f-ac063c530854	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-5628-f08a-d5fb-960d541b5af9	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-5628-f08a-32f9-07768ecc2dfb	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-5628-f08a-de19-503e640f4be4	PA	PAN	591	Panama 	Panama	\N
00040000-5628-f08a-de07-e1aeb2ec8acd	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-5628-f08a-a177-095983eab52f	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-5628-f08a-89ad-4807cb2a28a2	PE	PER	604	Peru 	Peru	\N
00040000-5628-f08a-6b79-6dadb1e30b1d	PH	PHL	608	Philippines 	Filipini	\N
00040000-5628-f08a-97ad-3ea85613676d	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-5628-f08a-da1f-bc9bc8dfb672	PL	POL	616	Poland 	Poljska	\N
00040000-5628-f08a-8b25-47d9a94b15bb	PT	PRT	620	Portugal 	Portugalska	\N
00040000-5628-f08a-99bc-bda9853c1463	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-5628-f08a-b1a8-869d14ed6021	QA	QAT	634	Qatar 	Katar	\N
00040000-5628-f08a-16e1-fe7a46a65aa4	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-5628-f08a-8eeb-e9fc58cf7b04	RO	ROU	642	Romania 	Romunija	\N
00040000-5628-f08a-29a7-d3471758b7d3	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-5628-f08a-4c4d-f835d6253112	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-5628-f08a-e0b8-a4c2de0358f5	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-5628-f08a-9794-bcf4c5481a26	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-5628-f08a-07e8-908dd8927ca5	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-5628-f08a-fac2-6ee17dd1445f	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-5628-f08a-8912-4669eccbea4d	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-5628-f08a-6147-87ca41182df0	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-5628-f08a-85fc-112136f8c28c	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-5628-f08a-5999-936ab8cb6133	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-5628-f08a-8a63-74d6bd8756fe	SM	SMR	674	San Marino 	San Marino	\N
00040000-5628-f08a-1305-679b7124d21d	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-5628-f08a-8295-98d49e4edff2	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-5628-f08a-f449-eccbe3084541	SN	SEN	686	Senegal 	Senegal	\N
00040000-5628-f08a-8aa0-8d408e4e7019	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-5628-f08a-b777-b4180cc48caf	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-5628-f08a-680a-b014a7770535	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-5628-f08a-a1d2-9c1ba1b47ad9	SG	SGP	702	Singapore 	Singapur	\N
00040000-5628-f08a-95e5-0aacf0c7d3eb	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-5628-f08a-633b-f1e557574d1e	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-5628-f08a-b44c-0d45fec90b3d	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-5628-f08a-8e55-4db7e7569564	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-5628-f08a-a3f5-13e82ee05775	SO	SOM	706	Somalia 	Somalija	\N
00040000-5628-f08a-38ff-16d6002bcd88	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-5628-f08a-734d-96e5f00cde90	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-5628-f08a-fab2-d48bf87baf56	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-5628-f08a-2958-e56be2fe9125	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-5628-f08a-b8f4-bea0860e63ef	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-5628-f08a-042b-6bd66f7554e1	SD	SDN	729	Sudan 	Sudan	\N
00040000-5628-f08a-b4ce-7a931b0200b2	SR	SUR	740	Suriname 	Surinam	\N
00040000-5628-f08a-c27e-e9382c9ea29f	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-5628-f08a-053a-6c2af36b0493	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-5628-f08a-de58-fc9cc2a71dad	SE	SWE	752	Sweden 	Švedska	\N
00040000-5628-f08a-3b91-c7247d4b3d94	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-5628-f08a-9f6a-df0bcee01e23	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-5628-f08a-8ec0-b30c33940101	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-5628-f08a-765c-165b654990b1	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-5628-f08a-e7f3-89b8ef504cd9	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-5628-f08a-6227-1a679d868818	TH	THA	764	Thailand 	Tajska	\N
00040000-5628-f08a-4bc1-070a151076ac	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-5628-f08a-d2b0-78b54910a4a3	TG	TGO	768	Togo 	Togo	\N
00040000-5628-f08a-db21-c0b5aeb591c9	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-5628-f08a-d3f1-6a7d859a2665	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-5628-f08a-a43f-9d8be0d85ebd	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-5628-f08a-f205-97b619dc000f	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-5628-f08a-d465-8a13b792babc	TR	TUR	792	Turkey 	Turčija	\N
00040000-5628-f08a-cf52-f2a7c6878d52	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-5628-f08a-10f7-9cd1fd1de664	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5628-f08a-8254-a67d9be06132	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-5628-f08a-e584-8f193e18e32d	UG	UGA	800	Uganda 	Uganda	\N
00040000-5628-f08a-1e64-28c4edfeee6c	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-5628-f08a-3f90-dd429faa9417	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-5628-f08a-9c00-1ac7a15e9ac5	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-5628-f08a-b63b-a8ba5da86357	US	USA	840	United States 	Združene države Amerike	\N
00040000-5628-f08a-7f30-3beccd2fd61a	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-5628-f08a-2ea5-aeb58ee1ea09	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-5628-f08a-1f6e-8208cd95d29b	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-5628-f08a-503d-8965371e4b75	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-5628-f08a-305a-3bae6646d56f	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-5628-f08a-0e3d-27a8876b6bb7	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-5628-f08a-b6bb-da697471f256	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5628-f08a-89f9-0bed4a6bfd4b	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-5628-f08a-e240-36958cc3312b	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-5628-f08a-fb68-b13de39883ab	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-5628-f08a-e54f-f9baa0dd7a54	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-5628-f08a-ab81-7c2d0f325524	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-5628-f08a-1bf7-881c4dbf746c	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 3109 (class 0 OID 23145992)
-- Dependencies: 234
-- Data for Name: enotaprograma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY enotaprograma (id, uprizoritev_id, program_dela_id, gostitelj_id, celotnavrednost, nasdelez, celotnavrednostmat, celotnavrednostgostovsz, zaproseno, lastnasredstva, avtorskihonorarji, avtorskihonorarjisamoz, tantieme, avtorskepravice, materialni, imakoprodukcije, vlozekgostitelja, drugijavni, stzaposlenih, stzaposumet, stzaposdrug, sthonorarnihzun, sthonorarnihzunigr, sthonorarnihzunigrtujjz, sthonorarnihzunsamoz, obiskdoma, obiskkopr, obiskgost, obiskkoprgost, obiskzamejo, obiskkoprzamejo, obiskint, obiskkoprint, ponovidoma, ponovikopr, ponovizamejo, ponovikoprzamejo, ponovigost, ponovikoprgost, ponovikoprint, ponoviint, naziv, kpe, sort, tipprogramskeenote_id, tip, prikoproducentu, prizorisce, trajanje, zvrst, avtor, reziser, datum, soustvarjalci, strosekodkpred, stroskiostali, krajgostovanja, ustanova, datumgostovanja, transportnistroski, dnevprvzad, drzavagostovanja_id, stpe, stpredstav, stokroglihmiz, stpredstavitev, stdelavnic, stdrugidogodki, stprodukcij, caspriprave, casizvedbe, prizorisca, umetvodja, programskotelo, sttujihselektorjev) FROM stdin;
002f0000-5628-f08d-9adb-404d0e14b616	000e0000-5628-f08d-6b3e-f2ad9c5f8d6d	\N	\N	9000.30	9000.30	9000.30	0.00	3600.12	5299.98	4000.40	1000.40	200.20	200.30	4599.40	\N	0.00	100.20	0	2	2	2	2	2	0	40	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-5628-f08a-232f-71b5bd64b927	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-5628-f08d-8193-b72918382492	000e0000-5628-f08d-bbd5-1e6e3efa9d6b	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	0	60	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-5628-f08a-0b85-74c7bc3b3bc1	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-5628-f08d-f6db-00db294155a3	000e0000-5628-f08d-5738-90c7c6c8045c	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	0	60	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-5628-f08a-232f-71b5bd64b927	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-5628-f08d-a769-47a5a83ec9b9	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-54.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	54.20	5	0	0	3	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0	0	Urejanje portala	0.00	10	\N	razno	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-5628-f08d-d28b-71eb6c87e7c6	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-31.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	31.20	5	0	0	3	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0	0	Delavnice otroci	0.00	8	\N	razno	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 3094 (class 0 OID 23145793)
-- Dependencies: 219
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, podrocje, vodjaekipe, naziv, komentar, velikost, pomembna, sort, seplanira, dovoliprekrivanje, maxprekrivanj, tipfunkcije_id) FROM stdin;
000d0000-5628-f08d-cf20-d52fd79b9061	000e0000-5628-f08d-bbd5-1e6e3efa9d6b	000c0000-5628-f08d-dff8-a9c73ae50c02	igralec	\N	Tezej	glavna vloga	velika	t	5	t	t	\N	000f0000-5628-f08a-6a43-49ef1f35c3c2
000d0000-5628-f08d-819b-6ced6031d06d	000e0000-5628-f08d-bbd5-1e6e3efa9d6b	000c0000-5628-f08d-b715-e32e52369319	umetnik	\N	Režija		velika	t	8	t	t	\N	000f0000-5628-f08a-fc8e-e8bf90391690
000d0000-5628-f08d-7426-fe380ff5f086	000e0000-5628-f08d-bbd5-1e6e3efa9d6b	000c0000-5628-f08d-40ef-9e9e97a238ff	inspicient	t	Inšpicient			t	8	t	t	\N	000f0000-5628-f08a-cf09-7ff8e6f1b07b
000d0000-5628-f08d-41d6-5f3eaeb6f332	000e0000-5628-f08d-bbd5-1e6e3efa9d6b	000c0000-5628-f08d-aa84-a4785440ff12	tehnik	t	Tehnični vodja			t	8	t	t	\N	000f0000-5628-f08a-8b20-cd8ab0af79f0
000d0000-5628-f08d-5441-3b748ec3e51f	000e0000-5628-f08d-bbd5-1e6e3efa9d6b	000c0000-5628-f08d-f544-838dd30039bb	tehnik	\N	Razsvetljava			t	3	t	t	\N	000f0000-5628-f08a-8b20-cd8ab0af79f0
000d0000-5628-f08d-98ed-e6b65d8b9450	000e0000-5628-f08d-bbd5-1e6e3efa9d6b	000c0000-5628-f08d-fdcb-87cae69b0e37	igralec	\N	Helena	glavna vloga	velika	t	5	t	t	\N	000f0000-5628-f08a-6a43-49ef1f35c3c2
000d0000-5628-f08d-7727-dabf65a420e2	000e0000-5628-f08d-bbd5-1e6e3efa9d6b	000c0000-5628-f08d-cf4f-15e0d9afba13	igralec	\N	Hipolita	glavna vloga	velika	t	6	t	t	\N	000f0000-5628-f08a-6a43-49ef1f35c3c2
000d0000-5628-f08d-f44f-2396e8b6032a	000e0000-5628-f08d-bbd5-1e6e3efa9d6b	000c0000-5628-f08d-ba83-290dc96a6a25	umetnik	\N	Lektoriranje			t	22	t	t	\N	000f0000-5628-f08a-a541-d4359b471852
000d0000-5628-f08d-1639-22e9cab0c982	000e0000-5628-f08d-bbd5-1e6e3efa9d6b	000c0000-5628-f08d-7ad8-4d36108818b4	umetnik	\N	Avtor	Avtor besedila		t	2	t	f	\N	000f0000-5628-f08a-ac5b-4529a109c144
\.


--
-- TOC entry 3072 (class 0 OID 23145590)
-- Dependencies: 197
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta, zamejstvo, kraj) FROM stdin;
\.


--
-- TOC entry 3069 (class 0 OID 23145556)
-- Dependencies: 194
-- Data for Name: job; Type: TABLE DATA; Schema: public; Owner: -
--

COPY job (id, user_id, name, task, status, log, datum, casizvedbe, izveden, data, alert, hidden, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3067 (class 0 OID 23145533)
-- Dependencies: 192
-- Data for Name: kontaktnaoseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kontaktnaoseba (id, popa_id, oseba_id, status, funkcija, opis) FROM stdin;
00260000-5628-f08d-1b52-62fdadc16e6b	00080000-5628-f08d-4ec8-32f7282e4da9	00090000-5628-f08d-8923-9109c2539471	AK		igralka
\.


--
-- TOC entry 3083 (class 0 OID 23145707)
-- Dependencies: 208
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 3120 (class 0 OID 23146231)
-- Dependencies: 245
-- Data for Name: mapa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa (id, lastnik_id, parent_id, ime, komentar, caskreiranja, casspremembe, javnidostop, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3121 (class 0 OID 23146243)
-- Dependencies: 246
-- Data for Name: mapa_zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa_zapis (mapa_id, zapis_id) FROM stdin;
\.


--
-- TOC entry 3123 (class 0 OID 23146265)
-- Dependencies: 248
-- Data for Name: mapaacl; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapaacl (id, mapa_id, perm_id, dostop, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3087 (class 0 OID 23145732)
-- Dependencies: 212
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 3064 (class 0 OID 23145490)
-- Dependencies: 189
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-5628-f08b-1985-313ad4b031a8	popa.stakli	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-5628-f08b-7524-0aa5dac1265c	oseba.spol	array	a:2:{s:1:"M";a:1:{s:5:"label";s:6:"Moški";}s:1:"Z";a:1:{s:5:"label";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-5628-f08b-1a59-c85f7f172368	telefonska.vrsta	array	a:3:{s:7:"mobilna";a:1:{s:5:"label";s:7:"Mobilni";}s:6:"domaca";a:1:{s:5:"label";s:6:"Domač";}s:6:"fiksna";a:1:{s:5:"label";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-5628-f08b-ff82-045fa90e7dd4	kontaktnaoseba.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status kontaktne osebe
00000000-5628-f08b-98eb-8316fa02cd7e	dogodek.status	array	a:8:{s:4:"100s";a:1:{s:5:"label";s:11:"Dolgoročno";}s:4:"200s";a:1:{s:5:"label";s:9:"Planirano";}s:4:"300s";a:1:{s:5:"label";s:8:"Fiksiran";}s:4:"400s";a:1:{s:5:"label";s:17:"Potrjen - interno";}s:4:"500s";a:1:{s:5:"label";s:15:"Potrjen - javno";}s:4:"600s";a:1:{s:5:"label";s:10:"Zaključen";}s:4:"610s";a:1:{s:5:"label";s:9:"Odpovedan";}s:4:"700s";a:1:{s:5:"label";s:7:"Obdelan";}}	f	t	t	\N	Tabela statusa dogodkov
00000000-5628-f08b-a56b-4a775e04280f	dogodek.razred	array	a:5:{s:4:"100s";a:2:{s:5:"label";s:9:"Predstava";s:4:"type";s:9:"predstava";}s:4:"200s";a:2:{s:5:"label";s:4:"Vaja";s:4:"type";s:4:"vaja";}s:4:"300s";a:2:{s:5:"label";s:10:"Gostovanje";s:4:"type";s:10:"gostovanje";}s:4:"400s";a:2:{s:5:"label";s:16:"Splošni dogodek";s:4:"type";s:8:"splošni";}s:4:"500s";a:2:{s:5:"label";s:10:"Zasedenost";s:4:"type";s:10:"zasedenost";}}	f	t	t	\N	Tabela razredov dogodkov, ki jih aplikacija podpira
00000000-5628-f08b-5db8-2a81d388a159	uprizoritev.faza	array	a:6:{s:20:"predprodukcija-ideja";a:1:{s:5:"label";s:16:"Dolgoročni plan";}s:20:"predprodukcija-poziv";a:1:{s:5:"label";s:29:"Predprodukcija, v fazi poziva";}s:30:"predprodukcija-potrjen_program";a:1:{s:5:"label";s:34:"Predprodukcija, program je potrjen";}s:10:"produkcija";a:1:{s:5:"label";s:10:"Produkcija";}s:14:"postprodukcija";a:1:{s:5:"label";s:14:"Postprodukcija";}s:5:"arhiv";a:1:{s:5:"label";s:10:"Arhivirana";}}	f	t	f	\N	Faza uprizoritve
00000000-5628-f08b-281a-6d032eee2d6a	funkcija.podrocje	array	a:4:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}}	f	t	f	\N	Področje funkcije
00000000-5628-f08b-3c9e-c18ad75949c6	tipfunkcije.podrocje	array	a:4:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}}	f	t	f	\N	Področje funkcije
00000000-5628-f08b-7f29-da89d806be77	funkcija.velikost	array	a:4:{s:6:"velika";a:1:{s:5:"label";s:23:"Velika vloga / funkcija";}s:7:"srednja";a:1:{s:5:"label";s:24:"Srednja vloga / funkcija";}s:4:"mala";a:1:{s:5:"label";s:21:"Mala vloga / funkcija";}s:7:"stataza";a:1:{s:5:"label";s:8:"Stataža";}}	f	t	f	\N	Velikost funkcije
00000000-5628-f08b-8f32-0c8a701293ea	zaposlitev.status	array	a:2:{s:1:"A";a:1:{s:5:"label";s:7:"Aktivna";}s:1:"N";a:1:{s:5:"label";s:9:"Neaktivna";}}	f	t	f	\N	Status zaposlitve
00000000-5628-f08b-3e8b-e47ec9bf96cf	produkcijskahisa.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktivna";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktivna";}}	f	t	f	\N	Status produkcijske hiše
00000000-5628-f08b-6672-6bd21256d872	strosekuprizoritve.tipstroska	array	a:1:{s:10:"materialni";a:1:{s:5:"label";s:19:"Materialni strošek";}}	f	t	f	\N	Tip stroška
00000000-5628-f08b-81d3-5a400bcd4bd3	avtorbesedila.tipavtorja	array	a:4:{s:4:"aizv";a:1:{s:5:"label";s:15:"Avtor izvirnika";}s:4:"prev";a:1:{s:5:"label";s:10:"Prevajalec";}s:4:"apri";a:1:{s:5:"label";s:14:"Avtor priredbe";}s:4:"dram";a:1:{s:5:"label";s:12:"Dramatizator";}}	f	t	f	\N	Tip stroška
00000000-5628-f08b-cc5e-6db07a866300	fsacl.dostop	array	a:4:{s:1:"X";a:1:{s:5:"label";s:12:"Brez dostopa";}s:1:"R";a:1:{s:5:"label";s:11:"Samo branje";}s:2:"RW";a:1:{s:5:"label";s:17:"Branje in pisanje";}s:3:"RWD";a:1:{s:5:"label";s:26:"Branje pisanje in brisanje";}}	f	t	f	\N	ACL Javni dostop
00000000-5628-f08c-b659-afc732faefee	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-5628-f08c-6a65-48d1486b030b	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-5628-f08c-684a-752e0026e8b0	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-5628-f08c-1e01-68afe7080240	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-5628-f08c-270d-933490c7f83a	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
00000000-5628-f08f-028d-29b69d6e0791	application.tenant.maticnopodjetje	string	s:36:"00080000-5628-f08f-8be6-ac84ae37da02";	f	t	f		Id matičnega podjetja v Popa
\.


--
-- TOC entry 3057 (class 0 OID 23145393)
-- Dependencies: 182
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-5628-f08c-e15a-a41e5bb7ffdc	00000000-5628-f08c-b659-afc732faefee	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-5628-f08c-cba2-daba3103e0b8	00000000-5628-f08c-b659-afc732faefee	00010000-5628-f08a-56c2-655722199f9b	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-5628-f08c-cdd9-01d35a494a30	00000000-5628-f08c-6a65-48d1486b030b	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 3061 (class 0 OID 23145457)
-- Dependencies: 186
-- Data for Name: organizacijskaenota; Type: TABLE DATA; Schema: public; Owner: -
--

COPY organizacijskaenota (id, parent_id, vodja_id, namestnik_id, sifra, naziv) FROM stdin;
00410000-5628-f08d-a862-7dcadc508c88	\N	00100000-5628-f08d-82b1-deabf23e82d9	00100000-5628-f08d-e6fc-68a433c046a0	01	Gledališče Nimbis
00410000-5628-f08d-3b2d-81e9c4db9e85	00410000-5628-f08d-a862-7dcadc508c88	00100000-5628-f08d-82b1-deabf23e82d9	00100000-5628-f08d-e6fc-68a433c046a0	02	Tehnika
\.


--
-- TOC entry 3058 (class 0 OID 23145404)
-- Dependencies: 183
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naslov_id, sifra, naziv, ime, priimek, funkcija, srednjeime, polnoime, psevdonim, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
00090000-5628-f08d-cdb3-fc31f46522b1	\N	\N	0001	g.	Janez	Novak	a	Peter	Janez Peter Novak	Jani	jani.novak@xxx.xx	1958-01-06	0601958000000	123456789	M	Jani Janez	Slovenija	Slovenija	Ljubljana
00090000-5628-f08d-fc49-cb83e87e5a6e	00010000-5628-f08d-8807-490b40bfa69c	\N	0002	dr.	Anton	Horvat	b		Anton  Horvat	Tona	anton.horvat@xxx.xx	1968-02-12	1202968111111	234567890	M		Slovenija	Slovenija	Maribor
00090000-5628-f08d-380d-af7310e90380	00010000-5628-f08d-8658-d422981df186	\N	0003		Ivan	Kovačič	c		Ivan  Kovačič	Ivo	ivan.kovacic@xxx.xx	1975-03-26	2603976222222	345678901	M		Slovenija	Slovenija	Celje
00090000-5628-f08d-330c-e8e52fae2aae	00010000-5628-f08d-cedd-f9cd0871809e	\N	0004	prof.	Jožef	Krajnc	d		Jožef  Krajnc	Joža	jozef.krajnc@xxx.xx	1971-04-30	3004971333333	456789012	M		Slovenija	Slovenija	Kranj
00090000-5628-f08d-a507-85d1723cb46b	\N	\N	0005		Marko	Zupančič	e		Marko  Zupančič		marko.zupancic@xxx.xx	1984-05-07	0705984444444	567890123	M		Slovenija	Slovenija	Koper
00090000-5628-f08d-3d24-8eed0869e5d0	\N	\N	0006	ga.	Marija	Kovač	f		Marija  Kovač		marija.kovac@xxx.xx	1962-06-19	1906962444444	678901234	Z		Slovenija	Slovenija	Murska Sobota
00090000-5628-f08d-dc31-3d0e4c6cc523	\N	\N	0007	ga.	Ana	Potočnik	g		Ana  Potočnik		ana.potocnik@xxx.xx	1975-07-24	2407975555555	789012345	Z		Slovenija	Slovenija	Novo Mesto
00090000-5628-f08d-62a2-9ade4a975483	\N	\N	0008	ga.	Maja	Mlakar	h		Maja  Mlakar		maja.mlakar@xxx.xx	1986-08-02	0208986666666	890123456	Z		Slovenija	Slovenija	Nova Gorica
00090000-5628-f08d-8923-9109c2539471	00010000-5628-f08d-44ed-957a2b96d520	\N	0009		Irena	Kos	i		Irena  Kos		irena.kos@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Ptuj
00090000-5628-f08d-60ff-ff9d9b490c1a	\N	\N	0010		Mojca	Vidmar	J		Mojca  Vidmar		mojca.vidmar@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Idrija
00090000-5628-f08d-b49a-683376c2b2a8	\N	\N	0011		xx	write protected12345	a		xx  write protected12345		xx@xxx.xx	\N	\N	\N	Z		\N	\N	\N
00090000-5628-f08d-c447-eea9045bffe2	\N	\N	0012		Luka	Golob	luč	a	Luka a Golob		luka.golob@xxx.xx	\N	\N	\N	M		\N	\N	\N
00090000-5628-f08d-fe68-f900ca205c62	00010000-5628-f08d-d482-926fad8f2613	\N	0013		Tatjana	Božič	tajnica	a	Tatjana a Božič		tatjana.bozic@xxx.xx	\N	\N	\N	Z		\N	\N	\N
00090000-5628-f08d-17a6-95fe57dc1c1f	\N	\N	0014		William	Shakespeare	avtor		William  Shakespeare		\N	\N	\N	\N	M		\N	\N	\N
00090000-5628-f08d-e5cd-969edd9226af	\N	\N	0015		Nebojša	Kavader	avtor		Nebojša  Kavader		\N	\N	\N	\N	M		\N	\N	\N
00090000-5628-f08d-43eb-3cd755c355a3	\N	\N	0016		Fjodor	Dostojevski	avtor	Mihajlovič	Fjodor Mihajlovič Dostojevski		\N	\N	\N	\N	M		\N	\N	\N
00090000-5628-f08d-f5a1-448fe2365b98	\N	\N	0017		Berta 	Hočevar	avtorica		Berta   Hočevar		\N	\N	\N	\N	Z		\N	\N	\N
00090000-5628-f08d-92a2-96becf22d9a4	\N	\N	0018		Katarina	Podbevšek	lektorica		Katarina  Podbevšek		\N	\N	\N	\N	Z		\N	\N	\N
00090000-5628-f08d-8bb0-66734584f7c4	\N	\N	0019		Lojze	Žumer			Lojze  Žumer		\N	\N	\N	\N	M		\N	\N	\N
00090000-5628-f08d-ac3d-7dc92f1629f9	\N	\N	0020		Luka	Novak			Luka  Novak		\N	\N	\N	\N	M		\N	\N	\N
\.


--
-- TOC entry 3052 (class 0 OID 23145348)
-- Dependencies: 177
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-5628-f08a-9ce2-906c2e129ad4	Aaa-read	Aaa (User,Role,Permission) - branje	f
00030000-5628-f08a-7407-cdc46c64b6e0	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	f
00030000-5628-f08a-8465-b554a5d02df0	TerminStoritve-vse	TerminStoritve - spreminjanje vseh zapisov	f
00030000-5628-f08a-af54-ebefaf3bf3db	Dogodek-readVse	Dogodek - branje vseh, ne glede na status dogodka	f
00030000-5628-f08a-a135-d99eb64f32e6	Oseba-vse	Oseba - vse - za testiranje assert	f
00030000-5628-f08a-10ec-20aaa4c7cc70	ProgramDela-lock	ProgramDela - zaklepanje	f
00030000-5628-f08a-a723-580e278ed938	ProgramDela-unlock	ProgramDela - odklepanje	f
00030000-5628-f08a-ca1b-238b1cd9a71d	Abonma-read	Abonma - branje	f
00030000-5628-f08a-49ca-0c2ab8a75b37	Abonma-write	Abonma - spreminjanje	f
00030000-5628-f08a-5f14-835ec90d384d	Alternacija-read	Alternacija - branje	f
00030000-5628-f08a-0186-6ee9f7cc1d06	Alternacija-write	Alternacija - spreminjanje	f
00030000-5628-f08a-eee4-1c15711b6095	Arhivalija-read	Arhivalija - branje	f
00030000-5628-f08a-4217-ca189949251e	Arhivalija-write	Arhivalija - spreminjanje	f
00030000-5628-f08a-57a7-4c7933b4f869	AvtorBesedila-read	AvtorBesedila - branje	f
00030000-5628-f08a-e838-41e25d61e6a5	AvtorBesedila-write	AvtorBesedila - spreminjanje	f
00030000-5628-f08a-8913-9865f744e3a9	Besedilo-read	Besedilo - branje	f
00030000-5628-f08a-275d-13c915b34860	Besedilo-write	Besedilo - spreminjanje	f
00030000-5628-f08a-4954-bfb719795648	DogodekIzven-read	DogodekIzven - branje	f
00030000-5628-f08a-4290-bd906712bfd0	DogodekIzven-write	DogodekIzven - spreminjanje	f
00030000-5628-f08a-0c5b-6ccec74045f6	Dogodek-read	Dogodek - branje	f
00030000-5628-f08a-7d58-caf56f05d45c	Dogodek-write	Dogodek - spreminjanje	f
00030000-5628-f08a-0e38-058bc7ed0b05	DrugiVir-read	DrugiVir - branje	f
00030000-5628-f08a-ec19-6412e2bcd45f	DrugiVir-write	DrugiVir - spreminjanje	f
00030000-5628-f08a-3ab1-5295693eb457	Drzava-read	Drzava - branje	f
00030000-5628-f08a-e4cb-89f3ba2786c4	Drzava-write	Drzava - spreminjanje	f
00030000-5628-f08a-5993-1eb25f7eda54	EnotaPrograma-read	EnotaPrograma - branje	f
00030000-5628-f08a-8c62-55d41cf02ca3	EnotaPrograma-write	EnotaPrograma - spreminjanje	f
00030000-5628-f08a-a2bf-9303ad4910da	Funkcija-read	Funkcija - branje	f
00030000-5628-f08a-0c19-ea2c08bb87d1	Funkcija-write	Funkcija - spreminjanje	f
00030000-5628-f08a-998a-a771eaabc3ce	Gostovanje-read	Gostovanje - branje	f
00030000-5628-f08a-9a03-eb5ca1dc5b7f	Gostovanje-write	Gostovanje - spreminjanje	f
00030000-5628-f08a-5a03-b1b9a4d09fe9	Gostujoca-read	Gostujoca - branje	f
00030000-5628-f08a-abed-617ea209a9aa	Gostujoca-write	Gostujoca - spreminjanje	f
00030000-5628-f08a-7a2c-fdc2020d0863	KontaktnaOseba-read	KontaktnaOseba - branje	f
00030000-5628-f08a-a00f-1ab736a0ec39	KontaktnaOseba-write	KontaktnaOseba - spreminjanje	f
00030000-5628-f08a-d111-3f811066deca	Kupec-read	Kupec - branje	f
00030000-5628-f08a-fc3a-7f6a83b79e00	Kupec-write	Kupec - spreminjanje	f
00030000-5628-f08a-ea14-cb8091237294	NacinPlacina-read	NacinPlacina - branje	f
00030000-5628-f08a-37fe-8bad24830f0a	NacinPlacina-write	NacinPlacina - spreminjanje	f
00030000-5628-f08a-3f26-10e89d81ee2c	Option-read	Option - branje	f
00030000-5628-f08a-7910-95bcd5f1b3a5	Option-write	Option - spreminjanje	f
00030000-5628-f08a-9fcc-6b0d867ea1a1	OptionValue-read	OptionValue - branje	f
00030000-5628-f08a-52e6-4152a4856e4c	OptionValue-write	OptionValue - spreminjanje	f
00030000-5628-f08a-6406-7b6418fa6ea5	OrganizacijskaEnota-read	OrganizacijskaEnota - branje	f
00030000-5628-f08a-7cd2-727742e48ebe	OrganizacijskaEnota-write	OrganizacijskaEnota - spreminjanje	f
00030000-5628-f08a-a4ec-e6659fab2703	Oseba-read	Oseba - branje	f
00030000-5628-f08a-a377-aeb931939359	Oseba-write	Oseba - spreminjanje	f
00030000-5628-f08a-d7f1-e5e7a26e6493	PlacilniInstrument-read	PlacilniInstrument - branje	f
00030000-5628-f08a-8c3d-d37c949f7e3a	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	f
00030000-5628-f08a-eeaa-2216fbf3be1a	PodrocjeSedenja-read	PodrocjeSedenja - branje	f
00030000-5628-f08a-90ea-26e966a442c5	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	f
00030000-5628-f08a-e6d1-79d667394056	Pogodba-read	Pogodba - branje	f
00030000-5628-f08a-36bf-262f1a5e8dcf	Pogodba-write	Pogodba - spreminjanje	f
00030000-5628-f08a-2da7-c01b63b15976	Popa-read	Popa - branje	f
00030000-5628-f08a-b351-ef479d9cb4ce	Popa-write	Popa - spreminjanje	f
00030000-5628-f08a-fdf8-876f4a466e7a	Posta-read	Posta - branje	f
00030000-5628-f08a-d956-b1a209bbc90b	Posta-write	Posta - spreminjanje	f
00030000-5628-f08a-83ad-3e7e27b762f8	PostavkaCDve-read	PostavkaCDve - branje	f
00030000-5628-f08a-7909-7a7e39a32834	PostavkaCDve-write	PostavkaCDve - spreminjanje	f
00030000-5628-f08a-9769-08ddefe79976	PostavkaRacuna-read	PostavkaRacuna - branje	f
00030000-5628-f08a-c3c2-54c1b7679cb4	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	f
00030000-5628-f08a-31c2-cabcc54d3099	PostniNaslov-read	PostniNaslov - branje	f
00030000-5628-f08a-29b5-90cf6a879a09	PostniNaslov-write	PostniNaslov - spreminjanje	f
00030000-5628-f08a-9cb8-a57154a961db	Predstava-read	Predstava - branje	f
00030000-5628-f08a-65e7-d44ca7fe34dc	Predstava-write	Predstava - spreminjanje	f
00030000-5628-f08a-8505-8ccc1dfa4ef3	Praznik-read	Praznik - branje	f
00030000-5628-f08a-6756-c91c20cb0be7	Praznik-write	Praznik - spreminjanje	f
00030000-5628-f08a-5465-0745e2c10243	ProdajaPredstave-read	ProdajaPredstave - branje	f
00030000-5628-f08a-f5c8-f07ce37bbd57	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	f
00030000-5628-f08a-32a5-f9d9187964ca	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	f
00030000-5628-f08a-f385-8a580337a115	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	f
00030000-5628-f08a-f06e-244fd7899db0	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	f
00030000-5628-f08a-ba8e-9fbbc9b57bb2	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	f
00030000-5628-f08a-bb8a-df2738ac6fc8	ProgramDela-read	ProgramDela - branje	f
00030000-5628-f08a-9dc6-ce64c1b4f75a	ProgramDela-write	ProgramDela - spreminjanje	f
00030000-5628-f08a-bde0-1efc19bb1271	ProgramFestival-read	ProgramFestival - branje	f
00030000-5628-f08a-b7dc-7e7aca61bbcf	ProgramFestival-write	ProgramFestival - spreminjanje	f
00030000-5628-f08a-3aaa-cb4a35bfe872	ProgramGostovanje-read	ProgramGostovanje - branje	f
00030000-5628-f08a-80a8-2c1d764cd448	ProgramGostovanje-write	ProgramGostovanje - spreminjanje	f
00030000-5628-f08a-8f24-f5abcb9df27e	ProgramGostujoca-read	ProgramGostujoca - branje	f
00030000-5628-f08a-203f-3c86b7727db3	ProgramGostujoca-write	ProgramGostujoca - spreminjanje	f
00030000-5628-f08a-115a-15bcfac9f679	ProgramIzjemni-read	ProgramIzjemni - branje	f
00030000-5628-f08a-fbf7-9769e6b5db57	ProgramIzjemni-write	ProgramIzjemni - spreminjanje	f
00030000-5628-f08a-17a2-6a9510eb87e5	ProgramPonovitevPrejsnjih-read	ProgramPonovitevPrejsnjih - branje	f
00030000-5628-f08a-75cf-a2063101a2de	ProgramPonovitevPrejsnjih-write	ProgramPonovitevPrejsnjih - spreminjanje	f
00030000-5628-f08a-5931-c2c05613a97a	ProgramPonovitevPremiere-read	ProgramPonovitevPremiere - branje	f
00030000-5628-f08a-a4a8-dd6cefec5d39	ProgramPonovitevPremiere-write	ProgramPonovitevPremiere - spreminjanje	f
00030000-5628-f08a-6ca7-6e13de2ea4c5	ProgramPremiera-read	ProgramPremiera - branje	f
00030000-5628-f08a-685a-58f7450285fe	ProgramPremiera-write	ProgramPremiera - spreminjanje	f
00030000-5628-f08a-0731-8b524bebfcb2	ProgramRazno-read	ProgramRazno - branje	f
00030000-5628-f08a-612f-b5a2c66c96c4	ProgramRazno-write	ProgramRazno - spreminjanje	f
00030000-5628-f08a-20b9-b4bf074e90ee	ProgramskaEnotaSklopa-read	ProgramskaEnotaSklopa - branje	f
00030000-5628-f08a-81f7-5c2a667c918c	ProgramskaEnotaSklopa-write	ProgramskaEnotaSklopa - spreminjanje	f
00030000-5628-f08a-cfaf-591e9b7840cb	Prostor-read	Prostor - branje	f
00030000-5628-f08a-d267-b1c890f0b3bf	Prostor-write	Prostor - spreminjanje	f
00030000-5628-f08a-ea8b-daa4a35943e8	Racun-read	Racun - branje	f
00030000-5628-f08a-1c72-2b922595f6a2	Racun-write	Racun - spreminjanje	f
00030000-5628-f08a-cfd6-158cd6b10a59	RazpisanSedez-read	RazpisanSedez - branje	f
00030000-5628-f08a-b32e-5d847cbe143f	RazpisanSedez-write	RazpisanSedez - spreminjanje	f
00030000-5628-f08a-4dd8-d7f7db9fbea5	Rekviziterstvo-read	Rekviziterstvo - branje	f
00030000-5628-f08a-cd4e-f5fda9359301	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	f
00030000-5628-f08a-a590-b85e646d9541	Rekvizit-read	Rekvizit - branje	f
00030000-5628-f08a-70dc-0f5b3a27c928	Rekvizit-write	Rekvizit - spreminjanje	f
00030000-5628-f08a-6ba2-35bf6f374c4b	Revizija-read	Revizija - branje	f
00030000-5628-f08a-3c9b-aa4bf9b4b48b	Revizija-write	Revizija - spreminjanje	f
00030000-5628-f08a-a13a-29966ca63aac	Rezervacija-read	Rezervacija - branje	f
00030000-5628-f08a-7079-3604403f11b5	Rezervacija-write	Rezervacija - spreminjanje	f
00030000-5628-f08a-0bf3-a0e750f61d34	SedezniRed-read	SedezniRed - branje	f
00030000-5628-f08a-f0d6-cf3388b4643c	SedezniRed-write	SedezniRed - spreminjanje	f
00030000-5628-f08a-b5f8-c320dc15c2d5	Sedez-read	Sedez - branje	f
00030000-5628-f08a-d121-0ce181fbd6a7	Sedez-write	Sedez - spreminjanje	f
00030000-5628-f08a-1887-64e331d63afe	Sezona-read	Sezona - branje	f
00030000-5628-f08a-698a-e10d5e58d268	Sezona-write	Sezona - spreminjanje	f
00030000-5628-f08a-bb3b-7486aa72ba04	StevilcenjeKonfig-read	StevilcenjeKonfig - branje	f
00030000-5628-f08a-5a46-101a49c27e21	StevilcenjeKonfig-write	StevilcenjeKonfig - spreminjanje	f
00030000-5628-f08a-c3b2-c827a7af1d7c	Stevilcenje-read	Stevilcenje - branje	f
00030000-5628-f08a-c571-f9fe912cb63d	Stevilcenje-write	Stevilcenje - spreminjanje	f
00030000-5628-f08a-90ec-b28a3b22089f	StevilcenjeStanje-read	StevilcenjeStanje - branje	f
00030000-5628-f08a-3237-a11a083ccab5	StevilcenjeStanje-write	StevilcenjeStanje - spreminjanje	f
00030000-5628-f08a-e950-f7c76da73dd4	StrosekUprizoritve-read	StrosekUprizoritve - branje	f
00030000-5628-f08a-0831-e2b52a1cd4ec	StrosekUprizoritve-write	StrosekUprizoritve - spreminjanje	f
00030000-5628-f08a-9f75-50864afb6987	Telefonska-read	Telefonska - branje	f
00030000-5628-f08a-5dc7-2eb660e41c12	Telefonska-write	Telefonska - spreminjanje	f
00030000-5628-f08a-6685-508ce15133fc	TerminStoritve-read	TerminStoritve - branje	f
00030000-5628-f08a-c345-36fe3eb7f762	TerminStoritve-write	TerminStoritve - spreminjanje	f
00030000-5628-f08a-5145-a031401c274e	TipFunkcije-read	TipFunkcije - branje	f
00030000-5628-f08a-b3d2-c80436d1afb8	TipFunkcije-write	TipFunkcije - spreminjanje	f
00030000-5628-f08a-ca79-a70636edee38	TipPopa-read	TipPopa - branje	f
00030000-5628-f08a-01ec-40ad6ff1aa73	TipPopa-write	TipPopa - spreminjanje	f
00030000-5628-f08a-2b85-ef159f1b275f	TipProgramskeEnote-read	TipProgramskeEnote - branje	f
00030000-5628-f08a-72e9-2add051fea55	TipProgramskeEnote-write	TipProgramskeEnote - spreminjanje	f
00030000-5628-f08a-a6a1-a2c49c6ed415	TipVaje-read	TipVaje - branje	f
00030000-5628-f08a-36b1-1a8468663948	TipVaje-write	TipVaje - spreminjanje	f
00030000-5628-f08a-b62a-35453c6f8690	Trr-read	Trr - branje	f
00030000-5628-f08a-0a32-b3735624be98	Trr-write	Trr - spreminjanje	f
00030000-5628-f08a-6035-56765c9992eb	Uprizoritev-read	Uprizoritev - branje	f
00030000-5628-f08a-aa5d-c0b1c86fa3b1	Uprizoritev-write	Uprizoritev - spreminjanje	f
00030000-5628-f08a-88bb-a67896446624	Vaja-read	Vaja - branje	f
00030000-5628-f08a-84e7-6457cd157da1	Vaja-write	Vaja - spreminjanje	f
00030000-5628-f08a-3bdc-adc629fe8e05	VrstaSedezev-read	VrstaSedezev - branje	f
00030000-5628-f08a-82b7-7fdc7a5b30df	VrstaSedezev-write	VrstaSedezev - spreminjanje	f
00030000-5628-f08a-d24c-8ee1ced90f86	VrstaStroska-read	VrstaStroska - branje	f
00030000-5628-f08a-8666-c7d63684c255	VrstaStroska-write	VrstaStroska - spreminjanje	f
00030000-5628-f08a-131e-9985caab6ade	Zaposlitev-read	Zaposlitev - branje	f
00030000-5628-f08a-dd54-a3272f6bbf36	Zaposlitev-write	Zaposlitev - spreminjanje	f
00030000-5628-f08a-a423-6c4390cd1496	Zasedenost-read	Zasedenost - branje	f
00030000-5628-f08a-4604-c78a9b099d29	Zasedenost-write	Zasedenost - spreminjanje	f
00030000-5628-f08a-d20e-a7cc4ac76aea	ZvrstSurs-read	ZvrstSurs - branje	f
00030000-5628-f08a-ee28-a0e74137d7c3	ZvrstSurs-write	ZvrstSurs - spreminjanje	f
00030000-5628-f08a-122c-5284a48415ef	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	f
00030000-5628-f08a-8519-3df4b0aa3355	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	f
00030000-5628-f08a-25fc-e7d66bc4f44c	Job-read	Branje opravil - samo zase - branje	f
00030000-5628-f08a-b6ee-8a4a53c50166	Job-write	Dodajanje in spreminjanje opravil - samo zase	f
00030000-5628-f08a-51dd-356a0ff3748e	Job-admin	Upravljanje opravil za vse uporabnike	f
00030000-5628-f08a-65db-2621f5ff1e96	Mapa-write	Mapa - osnovno dovoljenje za pisanje	f
00030000-5628-f08a-4293-f3b006396d4e	Mapa-read	Mapa - osnovno dovoljenje za branje	f
00030000-5628-f08a-3647-481f41e388de	MapaAcl-write	MapaAcl - dovoljenje za dostop pisanje ACL-jev mape	f
00030000-5628-f08a-54ea-dedd42b3d14c	MapaAcl-read	MapaAcl - dovoljenje za dostop branje ACL-jev mape	f
00030000-5628-f08a-5a7b-c9d923a8c315	Zapis-write	Zapis - dovoljenje za pisanje zapisov	f
00030000-5628-f08a-ff64-044117f11e72	Zapis-read	Zapis - dovoljenje za pisanje zapisov	f
00030000-5628-f08a-deec-75217f7cb196	ZapisLastnik-write	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	f
00030000-5628-f08a-6551-70f3d91f6fab	ZapisLastnik-read	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	f
00030000-5628-f08a-cb5b-25977f5b9093	VrstaZapisa-write	Šifrant vrst zapisa - spreminjanje	f
00030000-5628-f08a-43e7-bd4b456c03ef	VrstaZapisa-read	Šifrant vrst zapisa - branje	f
00030000-5628-f08a-590f-5309751c28b7	Datoteka-write	Datoteka - spreminjanje	f
00030000-5628-f08a-ad7e-8afb52ffaeee	Datoteka-read	Datoteke - branje	f
\.


--
-- TOC entry 3054 (class 0 OID 23145367)
-- Dependencies: 179
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-5628-f08a-c377-30171e00e99b	00030000-5628-f08a-7407-cdc46c64b6e0
00020000-5628-f08a-dcbd-26050573a451	00030000-5628-f08a-3ab1-5295693eb457
00020000-5628-f08a-27c7-7b1931398b45	00030000-5628-f08a-ca1b-238b1cd9a71d
00020000-5628-f08a-27c7-7b1931398b45	00030000-5628-f08a-49ca-0c2ab8a75b37
00020000-5628-f08a-27c7-7b1931398b45	00030000-5628-f08a-5f14-835ec90d384d
00020000-5628-f08a-27c7-7b1931398b45	00030000-5628-f08a-0186-6ee9f7cc1d06
00020000-5628-f08a-27c7-7b1931398b45	00030000-5628-f08a-eee4-1c15711b6095
00020000-5628-f08a-27c7-7b1931398b45	00030000-5628-f08a-0c5b-6ccec74045f6
00020000-5628-f08a-27c7-7b1931398b45	00030000-5628-f08a-af54-ebefaf3bf3db
00020000-5628-f08a-27c7-7b1931398b45	00030000-5628-f08a-7d58-caf56f05d45c
00020000-5628-f08a-27c7-7b1931398b45	00030000-5628-f08a-3ab1-5295693eb457
00020000-5628-f08a-27c7-7b1931398b45	00030000-5628-f08a-e4cb-89f3ba2786c4
00020000-5628-f08a-27c7-7b1931398b45	00030000-5628-f08a-a2bf-9303ad4910da
00020000-5628-f08a-27c7-7b1931398b45	00030000-5628-f08a-0c19-ea2c08bb87d1
00020000-5628-f08a-27c7-7b1931398b45	00030000-5628-f08a-998a-a771eaabc3ce
00020000-5628-f08a-27c7-7b1931398b45	00030000-5628-f08a-9a03-eb5ca1dc5b7f
00020000-5628-f08a-27c7-7b1931398b45	00030000-5628-f08a-5a03-b1b9a4d09fe9
00020000-5628-f08a-27c7-7b1931398b45	00030000-5628-f08a-abed-617ea209a9aa
00020000-5628-f08a-27c7-7b1931398b45	00030000-5628-f08a-7a2c-fdc2020d0863
00020000-5628-f08a-27c7-7b1931398b45	00030000-5628-f08a-a00f-1ab736a0ec39
00020000-5628-f08a-27c7-7b1931398b45	00030000-5628-f08a-3f26-10e89d81ee2c
00020000-5628-f08a-27c7-7b1931398b45	00030000-5628-f08a-9fcc-6b0d867ea1a1
00020000-5628-f08a-27c7-7b1931398b45	00030000-5628-f08a-a4ec-e6659fab2703
00020000-5628-f08a-27c7-7b1931398b45	00030000-5628-f08a-a377-aeb931939359
00020000-5628-f08a-27c7-7b1931398b45	00030000-5628-f08a-2da7-c01b63b15976
00020000-5628-f08a-27c7-7b1931398b45	00030000-5628-f08a-b351-ef479d9cb4ce
00020000-5628-f08a-27c7-7b1931398b45	00030000-5628-f08a-fdf8-876f4a466e7a
00020000-5628-f08a-27c7-7b1931398b45	00030000-5628-f08a-d956-b1a209bbc90b
00020000-5628-f08a-27c7-7b1931398b45	00030000-5628-f08a-31c2-cabcc54d3099
00020000-5628-f08a-27c7-7b1931398b45	00030000-5628-f08a-29b5-90cf6a879a09
00020000-5628-f08a-27c7-7b1931398b45	00030000-5628-f08a-9cb8-a57154a961db
00020000-5628-f08a-27c7-7b1931398b45	00030000-5628-f08a-65e7-d44ca7fe34dc
00020000-5628-f08a-27c7-7b1931398b45	00030000-5628-f08a-f06e-244fd7899db0
00020000-5628-f08a-27c7-7b1931398b45	00030000-5628-f08a-ba8e-9fbbc9b57bb2
00020000-5628-f08a-27c7-7b1931398b45	00030000-5628-f08a-cfaf-591e9b7840cb
00020000-5628-f08a-27c7-7b1931398b45	00030000-5628-f08a-d267-b1c890f0b3bf
00020000-5628-f08a-27c7-7b1931398b45	00030000-5628-f08a-4dd8-d7f7db9fbea5
00020000-5628-f08a-27c7-7b1931398b45	00030000-5628-f08a-cd4e-f5fda9359301
00020000-5628-f08a-27c7-7b1931398b45	00030000-5628-f08a-a590-b85e646d9541
00020000-5628-f08a-27c7-7b1931398b45	00030000-5628-f08a-70dc-0f5b3a27c928
00020000-5628-f08a-27c7-7b1931398b45	00030000-5628-f08a-1887-64e331d63afe
00020000-5628-f08a-27c7-7b1931398b45	00030000-5628-f08a-698a-e10d5e58d268
00020000-5628-f08a-27c7-7b1931398b45	00030000-5628-f08a-5145-a031401c274e
00020000-5628-f08a-27c7-7b1931398b45	00030000-5628-f08a-6035-56765c9992eb
00020000-5628-f08a-27c7-7b1931398b45	00030000-5628-f08a-aa5d-c0b1c86fa3b1
00020000-5628-f08a-27c7-7b1931398b45	00030000-5628-f08a-88bb-a67896446624
00020000-5628-f08a-27c7-7b1931398b45	00030000-5628-f08a-84e7-6457cd157da1
00020000-5628-f08a-27c7-7b1931398b45	00030000-5628-f08a-a423-6c4390cd1496
00020000-5628-f08a-27c7-7b1931398b45	00030000-5628-f08a-4604-c78a9b099d29
00020000-5628-f08a-27c7-7b1931398b45	00030000-5628-f08a-d20e-a7cc4ac76aea
00020000-5628-f08a-27c7-7b1931398b45	00030000-5628-f08a-122c-5284a48415ef
00020000-5628-f08a-ac22-5198234c27fa	00030000-5628-f08a-ca1b-238b1cd9a71d
00020000-5628-f08a-ac22-5198234c27fa	00030000-5628-f08a-eee4-1c15711b6095
00020000-5628-f08a-ac22-5198234c27fa	00030000-5628-f08a-0c5b-6ccec74045f6
00020000-5628-f08a-ac22-5198234c27fa	00030000-5628-f08a-3ab1-5295693eb457
00020000-5628-f08a-ac22-5198234c27fa	00030000-5628-f08a-998a-a771eaabc3ce
00020000-5628-f08a-ac22-5198234c27fa	00030000-5628-f08a-5a03-b1b9a4d09fe9
00020000-5628-f08a-ac22-5198234c27fa	00030000-5628-f08a-7a2c-fdc2020d0863
00020000-5628-f08a-ac22-5198234c27fa	00030000-5628-f08a-a00f-1ab736a0ec39
00020000-5628-f08a-ac22-5198234c27fa	00030000-5628-f08a-3f26-10e89d81ee2c
00020000-5628-f08a-ac22-5198234c27fa	00030000-5628-f08a-9fcc-6b0d867ea1a1
00020000-5628-f08a-ac22-5198234c27fa	00030000-5628-f08a-a4ec-e6659fab2703
00020000-5628-f08a-ac22-5198234c27fa	00030000-5628-f08a-a377-aeb931939359
00020000-5628-f08a-ac22-5198234c27fa	00030000-5628-f08a-2da7-c01b63b15976
00020000-5628-f08a-ac22-5198234c27fa	00030000-5628-f08a-fdf8-876f4a466e7a
00020000-5628-f08a-ac22-5198234c27fa	00030000-5628-f08a-31c2-cabcc54d3099
00020000-5628-f08a-ac22-5198234c27fa	00030000-5628-f08a-29b5-90cf6a879a09
00020000-5628-f08a-ac22-5198234c27fa	00030000-5628-f08a-9cb8-a57154a961db
00020000-5628-f08a-ac22-5198234c27fa	00030000-5628-f08a-cfaf-591e9b7840cb
00020000-5628-f08a-ac22-5198234c27fa	00030000-5628-f08a-4dd8-d7f7db9fbea5
00020000-5628-f08a-ac22-5198234c27fa	00030000-5628-f08a-a590-b85e646d9541
00020000-5628-f08a-ac22-5198234c27fa	00030000-5628-f08a-1887-64e331d63afe
00020000-5628-f08a-ac22-5198234c27fa	00030000-5628-f08a-9f75-50864afb6987
00020000-5628-f08a-ac22-5198234c27fa	00030000-5628-f08a-5dc7-2eb660e41c12
00020000-5628-f08a-ac22-5198234c27fa	00030000-5628-f08a-b62a-35453c6f8690
00020000-5628-f08a-ac22-5198234c27fa	00030000-5628-f08a-0a32-b3735624be98
00020000-5628-f08a-ac22-5198234c27fa	00030000-5628-f08a-131e-9985caab6ade
00020000-5628-f08a-ac22-5198234c27fa	00030000-5628-f08a-dd54-a3272f6bbf36
00020000-5628-f08a-ac22-5198234c27fa	00030000-5628-f08a-d20e-a7cc4ac76aea
00020000-5628-f08a-ac22-5198234c27fa	00030000-5628-f08a-122c-5284a48415ef
00020000-5628-f08a-1cbb-18f7b2fb57ed	00030000-5628-f08a-ca1b-238b1cd9a71d
00020000-5628-f08a-1cbb-18f7b2fb57ed	00030000-5628-f08a-5f14-835ec90d384d
00020000-5628-f08a-1cbb-18f7b2fb57ed	00030000-5628-f08a-eee4-1c15711b6095
00020000-5628-f08a-1cbb-18f7b2fb57ed	00030000-5628-f08a-4217-ca189949251e
00020000-5628-f08a-1cbb-18f7b2fb57ed	00030000-5628-f08a-8913-9865f744e3a9
00020000-5628-f08a-1cbb-18f7b2fb57ed	00030000-5628-f08a-4954-bfb719795648
00020000-5628-f08a-1cbb-18f7b2fb57ed	00030000-5628-f08a-0c5b-6ccec74045f6
00020000-5628-f08a-1cbb-18f7b2fb57ed	00030000-5628-f08a-3ab1-5295693eb457
00020000-5628-f08a-1cbb-18f7b2fb57ed	00030000-5628-f08a-a2bf-9303ad4910da
00020000-5628-f08a-1cbb-18f7b2fb57ed	00030000-5628-f08a-998a-a771eaabc3ce
00020000-5628-f08a-1cbb-18f7b2fb57ed	00030000-5628-f08a-5a03-b1b9a4d09fe9
00020000-5628-f08a-1cbb-18f7b2fb57ed	00030000-5628-f08a-7a2c-fdc2020d0863
00020000-5628-f08a-1cbb-18f7b2fb57ed	00030000-5628-f08a-3f26-10e89d81ee2c
00020000-5628-f08a-1cbb-18f7b2fb57ed	00030000-5628-f08a-9fcc-6b0d867ea1a1
00020000-5628-f08a-1cbb-18f7b2fb57ed	00030000-5628-f08a-a4ec-e6659fab2703
00020000-5628-f08a-1cbb-18f7b2fb57ed	00030000-5628-f08a-2da7-c01b63b15976
00020000-5628-f08a-1cbb-18f7b2fb57ed	00030000-5628-f08a-fdf8-876f4a466e7a
00020000-5628-f08a-1cbb-18f7b2fb57ed	00030000-5628-f08a-9cb8-a57154a961db
00020000-5628-f08a-1cbb-18f7b2fb57ed	00030000-5628-f08a-f06e-244fd7899db0
00020000-5628-f08a-1cbb-18f7b2fb57ed	00030000-5628-f08a-cfaf-591e9b7840cb
00020000-5628-f08a-1cbb-18f7b2fb57ed	00030000-5628-f08a-4dd8-d7f7db9fbea5
00020000-5628-f08a-1cbb-18f7b2fb57ed	00030000-5628-f08a-a590-b85e646d9541
00020000-5628-f08a-1cbb-18f7b2fb57ed	00030000-5628-f08a-1887-64e331d63afe
00020000-5628-f08a-1cbb-18f7b2fb57ed	00030000-5628-f08a-5145-a031401c274e
00020000-5628-f08a-1cbb-18f7b2fb57ed	00030000-5628-f08a-88bb-a67896446624
00020000-5628-f08a-1cbb-18f7b2fb57ed	00030000-5628-f08a-a423-6c4390cd1496
00020000-5628-f08a-1cbb-18f7b2fb57ed	00030000-5628-f08a-d20e-a7cc4ac76aea
00020000-5628-f08a-1cbb-18f7b2fb57ed	00030000-5628-f08a-122c-5284a48415ef
00020000-5628-f08a-93aa-3474276c618c	00030000-5628-f08a-ca1b-238b1cd9a71d
00020000-5628-f08a-93aa-3474276c618c	00030000-5628-f08a-49ca-0c2ab8a75b37
00020000-5628-f08a-93aa-3474276c618c	00030000-5628-f08a-0186-6ee9f7cc1d06
00020000-5628-f08a-93aa-3474276c618c	00030000-5628-f08a-eee4-1c15711b6095
00020000-5628-f08a-93aa-3474276c618c	00030000-5628-f08a-0c5b-6ccec74045f6
00020000-5628-f08a-93aa-3474276c618c	00030000-5628-f08a-3ab1-5295693eb457
00020000-5628-f08a-93aa-3474276c618c	00030000-5628-f08a-998a-a771eaabc3ce
00020000-5628-f08a-93aa-3474276c618c	00030000-5628-f08a-5a03-b1b9a4d09fe9
00020000-5628-f08a-93aa-3474276c618c	00030000-5628-f08a-3f26-10e89d81ee2c
00020000-5628-f08a-93aa-3474276c618c	00030000-5628-f08a-9fcc-6b0d867ea1a1
00020000-5628-f08a-93aa-3474276c618c	00030000-5628-f08a-2da7-c01b63b15976
00020000-5628-f08a-93aa-3474276c618c	00030000-5628-f08a-fdf8-876f4a466e7a
00020000-5628-f08a-93aa-3474276c618c	00030000-5628-f08a-9cb8-a57154a961db
00020000-5628-f08a-93aa-3474276c618c	00030000-5628-f08a-cfaf-591e9b7840cb
00020000-5628-f08a-93aa-3474276c618c	00030000-5628-f08a-4dd8-d7f7db9fbea5
00020000-5628-f08a-93aa-3474276c618c	00030000-5628-f08a-a590-b85e646d9541
00020000-5628-f08a-93aa-3474276c618c	00030000-5628-f08a-1887-64e331d63afe
00020000-5628-f08a-93aa-3474276c618c	00030000-5628-f08a-5145-a031401c274e
00020000-5628-f08a-93aa-3474276c618c	00030000-5628-f08a-d20e-a7cc4ac76aea
00020000-5628-f08a-93aa-3474276c618c	00030000-5628-f08a-122c-5284a48415ef
00020000-5628-f08a-6313-a811286f35d1	00030000-5628-f08a-ca1b-238b1cd9a71d
00020000-5628-f08a-6313-a811286f35d1	00030000-5628-f08a-eee4-1c15711b6095
00020000-5628-f08a-6313-a811286f35d1	00030000-5628-f08a-0c5b-6ccec74045f6
00020000-5628-f08a-6313-a811286f35d1	00030000-5628-f08a-3ab1-5295693eb457
00020000-5628-f08a-6313-a811286f35d1	00030000-5628-f08a-998a-a771eaabc3ce
00020000-5628-f08a-6313-a811286f35d1	00030000-5628-f08a-5a03-b1b9a4d09fe9
00020000-5628-f08a-6313-a811286f35d1	00030000-5628-f08a-3f26-10e89d81ee2c
00020000-5628-f08a-6313-a811286f35d1	00030000-5628-f08a-9fcc-6b0d867ea1a1
00020000-5628-f08a-6313-a811286f35d1	00030000-5628-f08a-2da7-c01b63b15976
00020000-5628-f08a-6313-a811286f35d1	00030000-5628-f08a-fdf8-876f4a466e7a
00020000-5628-f08a-6313-a811286f35d1	00030000-5628-f08a-9cb8-a57154a961db
00020000-5628-f08a-6313-a811286f35d1	00030000-5628-f08a-cfaf-591e9b7840cb
00020000-5628-f08a-6313-a811286f35d1	00030000-5628-f08a-4dd8-d7f7db9fbea5
00020000-5628-f08a-6313-a811286f35d1	00030000-5628-f08a-a590-b85e646d9541
00020000-5628-f08a-6313-a811286f35d1	00030000-5628-f08a-1887-64e331d63afe
00020000-5628-f08a-6313-a811286f35d1	00030000-5628-f08a-6685-508ce15133fc
00020000-5628-f08a-6313-a811286f35d1	00030000-5628-f08a-8465-b554a5d02df0
00020000-5628-f08a-6313-a811286f35d1	00030000-5628-f08a-5145-a031401c274e
00020000-5628-f08a-6313-a811286f35d1	00030000-5628-f08a-d20e-a7cc4ac76aea
00020000-5628-f08a-6313-a811286f35d1	00030000-5628-f08a-122c-5284a48415ef
00020000-5628-f08c-2074-f1849d048c79	00030000-5628-f08a-9ce2-906c2e129ad4
00020000-5628-f08c-2074-f1849d048c79	00030000-5628-f08a-7407-cdc46c64b6e0
00020000-5628-f08c-2074-f1849d048c79	00030000-5628-f08a-ca1b-238b1cd9a71d
00020000-5628-f08c-2074-f1849d048c79	00030000-5628-f08a-49ca-0c2ab8a75b37
00020000-5628-f08c-2074-f1849d048c79	00030000-5628-f08a-5f14-835ec90d384d
00020000-5628-f08c-2074-f1849d048c79	00030000-5628-f08a-0186-6ee9f7cc1d06
00020000-5628-f08c-2074-f1849d048c79	00030000-5628-f08a-eee4-1c15711b6095
00020000-5628-f08c-2074-f1849d048c79	00030000-5628-f08a-4217-ca189949251e
00020000-5628-f08c-2074-f1849d048c79	00030000-5628-f08a-57a7-4c7933b4f869
00020000-5628-f08c-2074-f1849d048c79	00030000-5628-f08a-e838-41e25d61e6a5
00020000-5628-f08c-2074-f1849d048c79	00030000-5628-f08a-8913-9865f744e3a9
00020000-5628-f08c-2074-f1849d048c79	00030000-5628-f08a-275d-13c915b34860
00020000-5628-f08c-2074-f1849d048c79	00030000-5628-f08a-4954-bfb719795648
00020000-5628-f08c-2074-f1849d048c79	00030000-5628-f08a-4290-bd906712bfd0
00020000-5628-f08c-2074-f1849d048c79	00030000-5628-f08a-0c5b-6ccec74045f6
00020000-5628-f08c-2074-f1849d048c79	00030000-5628-f08a-af54-ebefaf3bf3db
00020000-5628-f08c-2074-f1849d048c79	00030000-5628-f08a-7d58-caf56f05d45c
00020000-5628-f08c-2074-f1849d048c79	00030000-5628-f08a-0e38-058bc7ed0b05
00020000-5628-f08c-2074-f1849d048c79	00030000-5628-f08a-ec19-6412e2bcd45f
00020000-5628-f08c-2074-f1849d048c79	00030000-5628-f08a-3ab1-5295693eb457
00020000-5628-f08c-2074-f1849d048c79	00030000-5628-f08a-e4cb-89f3ba2786c4
00020000-5628-f08c-2074-f1849d048c79	00030000-5628-f08a-5993-1eb25f7eda54
00020000-5628-f08c-2074-f1849d048c79	00030000-5628-f08a-8c62-55d41cf02ca3
00020000-5628-f08c-2074-f1849d048c79	00030000-5628-f08a-a2bf-9303ad4910da
00020000-5628-f08c-2074-f1849d048c79	00030000-5628-f08a-0c19-ea2c08bb87d1
00020000-5628-f08c-2074-f1849d048c79	00030000-5628-f08a-998a-a771eaabc3ce
00020000-5628-f08c-2074-f1849d048c79	00030000-5628-f08a-9a03-eb5ca1dc5b7f
00020000-5628-f08c-2074-f1849d048c79	00030000-5628-f08a-5a03-b1b9a4d09fe9
00020000-5628-f08c-2074-f1849d048c79	00030000-5628-f08a-abed-617ea209a9aa
00020000-5628-f08c-2074-f1849d048c79	00030000-5628-f08a-7a2c-fdc2020d0863
00020000-5628-f08c-2074-f1849d048c79	00030000-5628-f08a-a00f-1ab736a0ec39
00020000-5628-f08c-2074-f1849d048c79	00030000-5628-f08a-d111-3f811066deca
00020000-5628-f08c-2074-f1849d048c79	00030000-5628-f08a-fc3a-7f6a83b79e00
00020000-5628-f08c-2074-f1849d048c79	00030000-5628-f08a-ea14-cb8091237294
00020000-5628-f08c-2074-f1849d048c79	00030000-5628-f08a-37fe-8bad24830f0a
00020000-5628-f08c-2074-f1849d048c79	00030000-5628-f08a-3f26-10e89d81ee2c
00020000-5628-f08c-2074-f1849d048c79	00030000-5628-f08a-9fcc-6b0d867ea1a1
00020000-5628-f08c-2074-f1849d048c79	00030000-5628-f08a-52e6-4152a4856e4c
00020000-5628-f08c-2074-f1849d048c79	00030000-5628-f08a-7910-95bcd5f1b3a5
00020000-5628-f08c-2074-f1849d048c79	00030000-5628-f08a-6406-7b6418fa6ea5
00020000-5628-f08c-2074-f1849d048c79	00030000-5628-f08a-7cd2-727742e48ebe
00020000-5628-f08c-2074-f1849d048c79	00030000-5628-f08a-a4ec-e6659fab2703
00020000-5628-f08c-2074-f1849d048c79	00030000-5628-f08a-a135-d99eb64f32e6
00020000-5628-f08c-2074-f1849d048c79	00030000-5628-f08a-a377-aeb931939359
00020000-5628-f08c-2074-f1849d048c79	00030000-5628-f08a-d7f1-e5e7a26e6493
00020000-5628-f08c-2074-f1849d048c79	00030000-5628-f08a-8c3d-d37c949f7e3a
00020000-5628-f08c-2074-f1849d048c79	00030000-5628-f08a-eeaa-2216fbf3be1a
00020000-5628-f08c-2074-f1849d048c79	00030000-5628-f08a-90ea-26e966a442c5
00020000-5628-f08c-2074-f1849d048c79	00030000-5628-f08a-e6d1-79d667394056
00020000-5628-f08c-2074-f1849d048c79	00030000-5628-f08a-36bf-262f1a5e8dcf
00020000-5628-f08c-2074-f1849d048c79	00030000-5628-f08a-2da7-c01b63b15976
00020000-5628-f08c-2074-f1849d048c79	00030000-5628-f08a-b351-ef479d9cb4ce
00020000-5628-f08c-2074-f1849d048c79	00030000-5628-f08a-fdf8-876f4a466e7a
00020000-5628-f08c-2074-f1849d048c79	00030000-5628-f08a-83ad-3e7e27b762f8
00020000-5628-f08c-2074-f1849d048c79	00030000-5628-f08a-7909-7a7e39a32834
00020000-5628-f08c-2074-f1849d048c79	00030000-5628-f08a-9769-08ddefe79976
00020000-5628-f08c-2074-f1849d048c79	00030000-5628-f08a-c3c2-54c1b7679cb4
00020000-5628-f08c-2074-f1849d048c79	00030000-5628-f08a-d956-b1a209bbc90b
00020000-5628-f08c-2074-f1849d048c79	00030000-5628-f08a-31c2-cabcc54d3099
00020000-5628-f08c-2074-f1849d048c79	00030000-5628-f08a-29b5-90cf6a879a09
00020000-5628-f08c-2074-f1849d048c79	00030000-5628-f08a-8505-8ccc1dfa4ef3
00020000-5628-f08c-2074-f1849d048c79	00030000-5628-f08a-6756-c91c20cb0be7
00020000-5628-f08c-2074-f1849d048c79	00030000-5628-f08a-9cb8-a57154a961db
00020000-5628-f08c-2074-f1849d048c79	00030000-5628-f08a-65e7-d44ca7fe34dc
00020000-5628-f08c-2074-f1849d048c79	00030000-5628-f08a-5465-0745e2c10243
00020000-5628-f08c-2074-f1849d048c79	00030000-5628-f08a-f5c8-f07ce37bbd57
00020000-5628-f08c-2074-f1849d048c79	00030000-5628-f08a-32a5-f9d9187964ca
00020000-5628-f08c-2074-f1849d048c79	00030000-5628-f08a-f385-8a580337a115
00020000-5628-f08c-2074-f1849d048c79	00030000-5628-f08a-f06e-244fd7899db0
00020000-5628-f08c-2074-f1849d048c79	00030000-5628-f08a-ba8e-9fbbc9b57bb2
00020000-5628-f08c-2074-f1849d048c79	00030000-5628-f08a-10ec-20aaa4c7cc70
00020000-5628-f08c-2074-f1849d048c79	00030000-5628-f08a-bb8a-df2738ac6fc8
00020000-5628-f08c-2074-f1849d048c79	00030000-5628-f08a-a723-580e278ed938
00020000-5628-f08c-2074-f1849d048c79	00030000-5628-f08a-9dc6-ce64c1b4f75a
00020000-5628-f08c-2074-f1849d048c79	00030000-5628-f08a-bde0-1efc19bb1271
00020000-5628-f08c-2074-f1849d048c79	00030000-5628-f08a-b7dc-7e7aca61bbcf
00020000-5628-f08c-2074-f1849d048c79	00030000-5628-f08a-3aaa-cb4a35bfe872
00020000-5628-f08c-2074-f1849d048c79	00030000-5628-f08a-80a8-2c1d764cd448
00020000-5628-f08c-2074-f1849d048c79	00030000-5628-f08a-8f24-f5abcb9df27e
00020000-5628-f08c-2074-f1849d048c79	00030000-5628-f08a-203f-3c86b7727db3
00020000-5628-f08c-2074-f1849d048c79	00030000-5628-f08a-115a-15bcfac9f679
00020000-5628-f08c-2074-f1849d048c79	00030000-5628-f08a-fbf7-9769e6b5db57
00020000-5628-f08c-2074-f1849d048c79	00030000-5628-f08a-17a2-6a9510eb87e5
00020000-5628-f08c-2074-f1849d048c79	00030000-5628-f08a-75cf-a2063101a2de
00020000-5628-f08c-2074-f1849d048c79	00030000-5628-f08a-5931-c2c05613a97a
00020000-5628-f08c-2074-f1849d048c79	00030000-5628-f08a-a4a8-dd6cefec5d39
00020000-5628-f08c-2074-f1849d048c79	00030000-5628-f08a-6ca7-6e13de2ea4c5
00020000-5628-f08c-2074-f1849d048c79	00030000-5628-f08a-685a-58f7450285fe
00020000-5628-f08c-2074-f1849d048c79	00030000-5628-f08a-0731-8b524bebfcb2
00020000-5628-f08c-2074-f1849d048c79	00030000-5628-f08a-612f-b5a2c66c96c4
00020000-5628-f08c-2074-f1849d048c79	00030000-5628-f08a-20b9-b4bf074e90ee
00020000-5628-f08c-2074-f1849d048c79	00030000-5628-f08a-81f7-5c2a667c918c
00020000-5628-f08c-2074-f1849d048c79	00030000-5628-f08a-cfaf-591e9b7840cb
00020000-5628-f08c-2074-f1849d048c79	00030000-5628-f08a-d267-b1c890f0b3bf
00020000-5628-f08c-2074-f1849d048c79	00030000-5628-f08a-ea8b-daa4a35943e8
00020000-5628-f08c-2074-f1849d048c79	00030000-5628-f08a-1c72-2b922595f6a2
00020000-5628-f08c-2074-f1849d048c79	00030000-5628-f08a-cfd6-158cd6b10a59
00020000-5628-f08c-2074-f1849d048c79	00030000-5628-f08a-b32e-5d847cbe143f
00020000-5628-f08c-2074-f1849d048c79	00030000-5628-f08a-4dd8-d7f7db9fbea5
00020000-5628-f08c-2074-f1849d048c79	00030000-5628-f08a-cd4e-f5fda9359301
00020000-5628-f08c-2074-f1849d048c79	00030000-5628-f08a-a590-b85e646d9541
00020000-5628-f08c-2074-f1849d048c79	00030000-5628-f08a-70dc-0f5b3a27c928
00020000-5628-f08c-2074-f1849d048c79	00030000-5628-f08a-6ba2-35bf6f374c4b
00020000-5628-f08c-2074-f1849d048c79	00030000-5628-f08a-3c9b-aa4bf9b4b48b
00020000-5628-f08c-2074-f1849d048c79	00030000-5628-f08a-a13a-29966ca63aac
00020000-5628-f08c-2074-f1849d048c79	00030000-5628-f08a-7079-3604403f11b5
00020000-5628-f08c-2074-f1849d048c79	00030000-5628-f08a-0bf3-a0e750f61d34
00020000-5628-f08c-2074-f1849d048c79	00030000-5628-f08a-f0d6-cf3388b4643c
00020000-5628-f08c-2074-f1849d048c79	00030000-5628-f08a-b5f8-c320dc15c2d5
00020000-5628-f08c-2074-f1849d048c79	00030000-5628-f08a-d121-0ce181fbd6a7
00020000-5628-f08c-2074-f1849d048c79	00030000-5628-f08a-1887-64e331d63afe
00020000-5628-f08c-2074-f1849d048c79	00030000-5628-f08a-698a-e10d5e58d268
00020000-5628-f08c-2074-f1849d048c79	00030000-5628-f08a-bb3b-7486aa72ba04
00020000-5628-f08c-2074-f1849d048c79	00030000-5628-f08a-5a46-101a49c27e21
00020000-5628-f08c-2074-f1849d048c79	00030000-5628-f08a-c3b2-c827a7af1d7c
00020000-5628-f08c-2074-f1849d048c79	00030000-5628-f08a-90ec-b28a3b22089f
00020000-5628-f08c-2074-f1849d048c79	00030000-5628-f08a-3237-a11a083ccab5
00020000-5628-f08c-2074-f1849d048c79	00030000-5628-f08a-c571-f9fe912cb63d
00020000-5628-f08c-2074-f1849d048c79	00030000-5628-f08a-e950-f7c76da73dd4
00020000-5628-f08c-2074-f1849d048c79	00030000-5628-f08a-0831-e2b52a1cd4ec
00020000-5628-f08c-2074-f1849d048c79	00030000-5628-f08a-9f75-50864afb6987
00020000-5628-f08c-2074-f1849d048c79	00030000-5628-f08a-5dc7-2eb660e41c12
00020000-5628-f08c-2074-f1849d048c79	00030000-5628-f08a-6685-508ce15133fc
00020000-5628-f08c-2074-f1849d048c79	00030000-5628-f08a-8465-b554a5d02df0
00020000-5628-f08c-2074-f1849d048c79	00030000-5628-f08a-c345-36fe3eb7f762
00020000-5628-f08c-2074-f1849d048c79	00030000-5628-f08a-5145-a031401c274e
00020000-5628-f08c-2074-f1849d048c79	00030000-5628-f08a-b3d2-c80436d1afb8
00020000-5628-f08c-2074-f1849d048c79	00030000-5628-f08a-ca79-a70636edee38
00020000-5628-f08c-2074-f1849d048c79	00030000-5628-f08a-01ec-40ad6ff1aa73
00020000-5628-f08c-2074-f1849d048c79	00030000-5628-f08a-2b85-ef159f1b275f
00020000-5628-f08c-2074-f1849d048c79	00030000-5628-f08a-72e9-2add051fea55
00020000-5628-f08c-2074-f1849d048c79	00030000-5628-f08a-a6a1-a2c49c6ed415
00020000-5628-f08c-2074-f1849d048c79	00030000-5628-f08a-36b1-1a8468663948
00020000-5628-f08c-2074-f1849d048c79	00030000-5628-f08a-b62a-35453c6f8690
00020000-5628-f08c-2074-f1849d048c79	00030000-5628-f08a-0a32-b3735624be98
00020000-5628-f08c-2074-f1849d048c79	00030000-5628-f08a-6035-56765c9992eb
00020000-5628-f08c-2074-f1849d048c79	00030000-5628-f08a-aa5d-c0b1c86fa3b1
00020000-5628-f08c-2074-f1849d048c79	00030000-5628-f08a-88bb-a67896446624
00020000-5628-f08c-2074-f1849d048c79	00030000-5628-f08a-84e7-6457cd157da1
00020000-5628-f08c-2074-f1849d048c79	00030000-5628-f08a-3bdc-adc629fe8e05
00020000-5628-f08c-2074-f1849d048c79	00030000-5628-f08a-82b7-7fdc7a5b30df
00020000-5628-f08c-2074-f1849d048c79	00030000-5628-f08a-d24c-8ee1ced90f86
00020000-5628-f08c-2074-f1849d048c79	00030000-5628-f08a-8666-c7d63684c255
00020000-5628-f08c-2074-f1849d048c79	00030000-5628-f08a-131e-9985caab6ade
00020000-5628-f08c-2074-f1849d048c79	00030000-5628-f08a-dd54-a3272f6bbf36
00020000-5628-f08c-2074-f1849d048c79	00030000-5628-f08a-a423-6c4390cd1496
00020000-5628-f08c-2074-f1849d048c79	00030000-5628-f08a-4604-c78a9b099d29
00020000-5628-f08c-2074-f1849d048c79	00030000-5628-f08a-d20e-a7cc4ac76aea
00020000-5628-f08c-2074-f1849d048c79	00030000-5628-f08a-ee28-a0e74137d7c3
00020000-5628-f08c-2074-f1849d048c79	00030000-5628-f08a-122c-5284a48415ef
00020000-5628-f08c-2074-f1849d048c79	00030000-5628-f08a-8519-3df4b0aa3355
\.


--
-- TOC entry 3088 (class 0 OID 23145739)
-- Dependencies: 213
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 3092 (class 0 OID 23145773)
-- Dependencies: 217
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 3104 (class 0 OID 23145910)
-- Dependencies: 229
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, zacetek, konec, jeavtorskepravice, placilonavajo, vrednostvaje, planiranostevilovaj, vrednostvaj, vrednostpredstave, procentodinkasa, jeprocentodinkasa, vrednostdopremiere, zaposlenvdrjz, samozaposlen, igralec, opis) FROM stdin;
000b0000-5628-f08d-6e90-d6a187b46a45	00090000-5628-f08d-cdb3-fc31f46522b1	\N	\N	0001	\N	\N	f	f	10.00	3	10.00	30.00	\N	f	10.00	t	f	t	Pogodba o sodelovanju
000b0000-5628-f08d-df40-00a3b3834c9a	00090000-5628-f08d-3d24-8eed0869e5d0	\N	\N	0002	\N	\N	f	t	11.00	10	11.00	31.00	\N	f	110.00	f	t	t	Pogodba za vlogo Helena
000b0000-5628-f08d-977c-b0926754d6ac	00090000-5628-f08d-fe68-f900ca205c62	\N	\N	0003	\N	\N	f	f	12.00	4	12.00	0.00	\N	f	12.00	f	t	f	Pogodba za lektoriranje
000b0000-5628-f08d-fc64-132d557250cd	00090000-5628-f08d-60ff-ff9d9b490c1a	\N	\N	0004	\N	\N	t	f	0.00	2	300.00	0.00	\N	f	300.00	f	t	f	Pogodba za avtorske pravice
\.


--
-- TOC entry 3060 (class 0 OID 23145437)
-- Dependencies: 185
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, tipkli_id, drzava_id, sifra, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo, nvo) FROM stdin;
00080000-5628-f08d-4ec8-32f7282e4da9	\N	00040000-5628-f08a-b44c-0d45fec90b3d	0988	AK	Juhuhu d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5628-f08d-8743-6e0f0f2c979b	\N	00040000-5628-f08a-b44c-0d45fec90b3d	0989	AK	Hopsasa d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	t
00080000-5628-f08d-dec7-ba1a0a09bb7b	\N	00040000-5628-f08a-b44c-0d45fec90b3d	0987	AK	Gledališče Šrum d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5628-f08d-6f43-c0ae78440a1d	\N	00040000-5628-f08a-b44c-0d45fec90b3d	0986	AK	Lutkovni Direndaj d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5628-f08d-7e3d-3ec31c0a0082	\N	00040000-5628-f08a-b44c-0d45fec90b3d	0985	AK	Tatjana Stanič, Lektoriranje, s.p.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5628-f08d-abe7-dc589fc44e83	\N	00040000-5628-f08a-fe95-b29e8a06fdc3	0984	AK	Gledališče Lepote tvoje		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5628-f08d-22e8-3c188c575c31	\N	00040000-5628-f08a-d98f-3880cd7d2629	0983	AK	Sunce naše		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5628-f08d-008d-469c650f2940	\N	00040000-5628-f08a-74cd-2ff17efe2185	0982	AK	Theater Amadeus		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5628-f08d-9960-3ea8b11f7ddd	\N	00040000-5628-f08a-c0be-79da3acc231d	9999	AK	Fuchs		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5628-f08f-8be6-ac84ae37da02	\N	00040000-5628-f08a-b44c-0d45fec90b3d	1001	AK	Gledališče Matica		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
\.


--
-- TOC entry 3063 (class 0 OID 23145482)
-- Dependencies: 188
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-5628-f089-6732-af32f0df4fd1	8341	Adlešiči
00050000-5628-f089-977f-5c32a01ad1e0	5270	Ajdovščina
00050000-5628-f089-a8e7-96268c925506	6280	Ankaran/Ancarano
00050000-5628-f089-d6e6-b7e823c78027	9253	Apače
00050000-5628-f089-a43d-4abd06c5425f	8253	Artiče
00050000-5628-f089-b36c-f7f640316899	4275	Begunje na Gorenjskem
00050000-5628-f089-7ebf-317161f75fd0	1382	Begunje pri Cerknici
00050000-5628-f089-553c-5008ddc6db64	9231	Beltinci
00050000-5628-f089-b303-500fbff8b809	2234	Benedikt
00050000-5628-f089-36ef-66dc5b53cf3c	2345	Bistrica ob Dravi
00050000-5628-f089-39a5-5593a917afec	3256	Bistrica ob Sotli
00050000-5628-f089-608a-6b3af27404c3	8259	Bizeljsko
00050000-5628-f089-ed6e-f63a3674537b	1223	Blagovica
00050000-5628-f089-a765-8d5da7b2498c	8283	Blanca
00050000-5628-f089-6003-ef8637101b71	4260	Bled
00050000-5628-f089-4b90-54669a2bc596	4273	Blejska Dobrava
00050000-5628-f089-9673-ff75a8066117	9265	Bodonci
00050000-5628-f089-0e8b-4eab2a0d8cc0	9222	Bogojina
00050000-5628-f089-d30a-8bd26fa2f96c	4263	Bohinjska Bela
00050000-5628-f089-9bc9-40c617740434	4264	Bohinjska Bistrica
00050000-5628-f089-033a-9e63a6dd4198	4265	Bohinjsko jezero
00050000-5628-f089-3d6c-5351471c5140	1353	Borovnica
00050000-5628-f089-b7cb-a4a37508689c	8294	Boštanj
00050000-5628-f089-2f19-dbf62dbe8e3c	5230	Bovec
00050000-5628-f089-56a6-572bdeaf1262	5295	Branik
00050000-5628-f089-a218-f8c9fdf289cb	3314	Braslovče
00050000-5628-f089-87a7-9ee128909534	5223	Breginj
00050000-5628-f089-5b25-5fbd3e5fb539	8280	Brestanica
00050000-5628-f089-2d50-9e98be54d584	2354	Bresternica
00050000-5628-f089-d2d5-01d4d2bd44ce	4243	Brezje
00050000-5628-f089-9245-2a0bcf45b195	1351	Brezovica pri Ljubljani
00050000-5628-f089-c1a1-4b09b5828e7a	8250	Brežice
00050000-5628-f089-bd0c-0bed9f58ef28	4210	Brnik - Aerodrom
00050000-5628-f089-da53-b4ccf450ce78	8321	Brusnice
00050000-5628-f089-d1df-cc4b50f3762f	3255	Buče
00050000-5628-f089-0888-0e2974bffe1f	8276	Bučka 
00050000-5628-f089-90b1-fb31d8641462	9261	Cankova
00050000-5628-f089-fe5e-d7c217b6592e	3000	Celje 
00050000-5628-f089-1ef0-77449a3e730b	3001	Celje - poštni predali
00050000-5628-f089-d95e-f012523be2f2	4207	Cerklje na Gorenjskem
00050000-5628-f089-ec8e-635cc9b8e3e5	8263	Cerklje ob Krki
00050000-5628-f089-5d02-6e19acbfde4f	1380	Cerknica
00050000-5628-f089-8c73-938f7fbb6f6f	5282	Cerkno
00050000-5628-f089-062f-896715f38d3b	2236	Cerkvenjak
00050000-5628-f089-1e17-fd9bf4d6b41b	2215	Ceršak
00050000-5628-f089-9426-b487a1f3b3b6	2326	Cirkovce
00050000-5628-f089-6ce6-92a54bbc9d6c	2282	Cirkulane
00050000-5628-f089-7a38-7daae46bc470	5273	Col
00050000-5628-f089-6c04-f3d8ebb42d5c	8251	Čatež ob Savi
00050000-5628-f089-d23e-54af3f4b6143	1413	Čemšenik
00050000-5628-f089-43d4-fe441c67917f	5253	Čepovan
00050000-5628-f089-7a17-2345ecaaa88b	9232	Črenšovci
00050000-5628-f089-2f11-d47aee51a787	2393	Črna na Koroškem
00050000-5628-f089-a29a-75e359b5944d	6275	Črni Kal
00050000-5628-f089-ad28-4d02529fcac7	5274	Črni Vrh nad Idrijo
00050000-5628-f089-579a-ed72f3efa5e0	5262	Črniče
00050000-5628-f089-c98e-fd8234000415	8340	Črnomelj
00050000-5628-f089-82a2-5969a560f9d9	6271	Dekani
00050000-5628-f089-1dbe-205aad4cfb61	5210	Deskle
00050000-5628-f089-1dfc-8797c56033f5	2253	Destrnik
00050000-5628-f089-188f-aa739fea82ad	6215	Divača
00050000-5628-f089-7df0-597f1b831810	1233	Dob
00050000-5628-f089-5162-e5ecd906bbc3	3224	Dobje pri Planini
00050000-5628-f089-a35a-9031a49d393a	8257	Dobova
00050000-5628-f089-14f5-8561c1eca67d	1423	Dobovec
00050000-5628-f089-4a78-ae8c8bda44fa	5263	Dobravlje
00050000-5628-f089-f89d-09b693e09099	3204	Dobrna
00050000-5628-f089-9e3b-655ec954ddb3	8211	Dobrnič
00050000-5628-f089-d01d-189fc65eda9b	1356	Dobrova
00050000-5628-f089-9f8a-f81ed57d0dfd	9223	Dobrovnik/Dobronak 
00050000-5628-f089-aaa8-349831c85d00	5212	Dobrovo v Brdih
00050000-5628-f089-6eed-a56cd40b289c	1431	Dol pri Hrastniku
00050000-5628-f089-a660-86d0810a7d07	1262	Dol pri Ljubljani
00050000-5628-f089-a67f-1e4398be23db	1273	Dole pri Litiji
00050000-5628-f089-3a86-ace4cc6301b7	1331	Dolenja vas
00050000-5628-f089-8c6c-eb11a77a3202	8350	Dolenjske Toplice
00050000-5628-f089-819c-1e9132652497	1230	Domžale
00050000-5628-f089-437c-3756f9cd3b9d	2252	Dornava
00050000-5628-f089-da7b-8d85a449e6ef	5294	Dornberk
00050000-5628-f089-11ab-6ac47f9f0d10	1319	Draga
00050000-5628-f089-570e-ec8ed09a562a	8343	Dragatuš
00050000-5628-f089-206b-27de9bbf57c7	3222	Dramlje
00050000-5628-f089-ba5a-4b349037b78d	2370	Dravograd
00050000-5628-f089-5c2d-03808d857022	4203	Duplje
00050000-5628-f089-673b-67f050c6d45d	6221	Dutovlje
00050000-5628-f089-47c3-87e8163858f7	8361	Dvor
00050000-5628-f089-bd67-4f8a06b6fdaf	2343	Fala
00050000-5628-f089-efce-edece567844b	9208	Fokovci
00050000-5628-f089-7e21-45e2a43bf353	2313	Fram
00050000-5628-f089-c686-b511c958c094	3213	Frankolovo
00050000-5628-f089-339f-33101504ec19	1274	Gabrovka
00050000-5628-f089-a9cb-a242986b93eb	8254	Globoko
00050000-5628-f089-3453-dabbcee7065a	5275	Godovič
00050000-5628-f089-e0e0-407e3287c8c8	4204	Golnik
00050000-5628-f089-0b84-ad0691039ff6	3303	Gomilsko
00050000-5628-f089-5281-29bd6f8d53d8	4224	Gorenja vas
00050000-5628-f089-72f4-2fb9e15b6dfa	3263	Gorica pri Slivnici
00050000-5628-f089-c82f-13c49c3dcf7e	2272	Gorišnica
00050000-5628-f089-7650-186ed21b8b6d	9250	Gornja Radgona
00050000-5628-f089-6c86-9a097f277364	3342	Gornji Grad
00050000-5628-f089-a22b-8c59b38cb49e	4282	Gozd Martuljek
00050000-5628-f089-79bb-5db9ea5bf693	6272	Gračišče
00050000-5628-f089-a340-651c9b0781d9	9264	Grad
00050000-5628-f089-bb46-cfd6ee79592f	8332	Gradac
00050000-5628-f089-da1c-8e5e1bc02a72	1384	Grahovo
00050000-5628-f089-c550-dd6953d2643d	5242	Grahovo ob Bači
00050000-5628-f089-f546-f9058ba9e712	5251	Grgar
00050000-5628-f089-54ba-3c184cd1876a	3302	Griže
00050000-5628-f089-7a1f-fb7c36c2f862	3231	Grobelno
00050000-5628-f089-7dd4-c548818de609	1290	Grosuplje
00050000-5628-f089-1029-ab22b12f5aed	2288	Hajdina
00050000-5628-f089-99df-73dc4d20f5d9	8362	Hinje
00050000-5628-f089-078f-5986fdc88edf	2311	Hoče
00050000-5628-f089-4a17-6df9198ac82c	9205	Hodoš/Hodos
00050000-5628-f089-6a6a-8ea2429cabce	1354	Horjul
00050000-5628-f089-2e08-10d0f28208a0	1372	Hotedršica
00050000-5628-f089-ca51-5520312b8388	1430	Hrastnik
00050000-5628-f089-9ed8-cdb0eb50ca3a	6225	Hruševje
00050000-5628-f089-b924-28cba09020c8	4276	Hrušica
00050000-5628-f089-4016-cc2c9ee98bfb	5280	Idrija
00050000-5628-f089-1fd5-61ceed08f799	1292	Ig
00050000-5628-f089-ad2f-78eedcd7974e	6250	Ilirska Bistrica
00050000-5628-f089-747e-7e137cbc38a3	6251	Ilirska Bistrica-Trnovo
00050000-5628-f089-f44e-f8199e6c766d	1295	Ivančna Gorica
00050000-5628-f089-6f6e-c378e17869dc	2259	Ivanjkovci
00050000-5628-f089-6204-bf920fd2091e	1411	Izlake
00050000-5628-f089-1272-1ee387d2709d	6310	Izola/Isola
00050000-5628-f089-751f-56c6521d00c1	2222	Jakobski Dol
00050000-5628-f089-9356-0c16e57715e5	2221	Jarenina
00050000-5628-f089-b2ad-2729ac46f37a	6254	Jelšane
00050000-5628-f089-74c1-343b581828aa	4270	Jesenice
00050000-5628-f089-f203-e6f7f45177bf	8261	Jesenice na Dolenjskem
00050000-5628-f089-d025-3888995798a5	3273	Jurklošter
00050000-5628-f089-f640-b95574f7fe01	2223	Jurovski Dol
00050000-5628-f089-5ba1-3c145bbd6cb7	2256	Juršinci
00050000-5628-f089-3392-4993510e92c3	5214	Kal nad Kanalom
00050000-5628-f089-3e45-773969a8227d	3233	Kalobje
00050000-5628-f089-5b43-c85d293fc042	4246	Kamna Gorica
00050000-5628-f089-1951-6f5ce6dc7531	2351	Kamnica
00050000-5628-f089-8372-313ca55a5597	1241	Kamnik
00050000-5628-f089-45ed-d7f1271cc7fb	5213	Kanal
00050000-5628-f089-d997-49cfa6d5a13c	8258	Kapele
00050000-5628-f089-c6b8-da3217704790	2362	Kapla
00050000-5628-f089-a8fb-1573747c54a0	2325	Kidričevo
00050000-5628-f089-7615-110adc29ae54	1412	Kisovec
00050000-5628-f089-3ff1-c31bdf16562e	6253	Knežak
00050000-5628-f089-8fda-fb21c7049112	5222	Kobarid
00050000-5628-f089-c4cf-66aeb76b5e70	9227	Kobilje
00050000-5628-f089-df1d-b9f300577faf	1330	Kočevje
00050000-5628-f089-5416-8937bdbcec88	1338	Kočevska Reka
00050000-5628-f089-828a-03188d32cfdd	2276	Kog
00050000-5628-f089-6927-74d484b16991	5211	Kojsko
00050000-5628-f089-dcbb-8969453cc556	6223	Komen
00050000-5628-f089-0260-133480a2443f	1218	Komenda
00050000-5628-f089-d25e-437edbba5f90	6000	Koper/Capodistria 
00050000-5628-f089-fbe6-d667f94dd189	6001	Koper/Capodistria - poštni predali
00050000-5628-f089-cb86-ce03461e4da6	8282	Koprivnica
00050000-5628-f089-b464-b013f30870fc	5296	Kostanjevica na Krasu
00050000-5628-f089-b1a3-69e94945659d	8311	Kostanjevica na Krki
00050000-5628-f089-9749-fe1b09a83c3b	1336	Kostel
00050000-5628-f089-0ba3-e21d1d443943	6256	Košana
00050000-5628-f089-7e0f-985407c0efaa	2394	Kotlje
00050000-5628-f089-8f11-fd5d958b2a4c	6240	Kozina
00050000-5628-f089-43af-180785285fb2	3260	Kozje
00050000-5628-f089-a1f1-0cfe5ca41650	4000	Kranj 
00050000-5628-f089-c25c-f77993dad048	4001	Kranj - poštni predali
00050000-5628-f089-3603-3691bd7af26d	4280	Kranjska Gora
00050000-5628-f089-5953-8b542f97ddf9	1281	Kresnice
00050000-5628-f089-349d-5dd5a57aa013	4294	Križe
00050000-5628-f089-31f0-d044871f8eb8	9206	Križevci
00050000-5628-f089-4f00-45bb85d5c141	9242	Križevci pri Ljutomeru
00050000-5628-f089-927c-c31bb146f145	1301	Krka
00050000-5628-f089-ed48-b1c508c3bc8a	8296	Krmelj
00050000-5628-f089-63a6-e1ee3756e04f	4245	Kropa
00050000-5628-f089-efd6-d9c11185ddec	8262	Krška vas
00050000-5628-f089-70d0-0f5e3d9ee8ca	8270	Krško
00050000-5628-f089-541b-b4943aa5d79d	9263	Kuzma
00050000-5628-f089-d99f-a8d3e143841b	2318	Laporje
00050000-5628-f089-2d08-eda12e9676cf	3270	Laško
00050000-5628-f089-f486-9af1fef42e6e	1219	Laze v Tuhinju
00050000-5628-f089-30b7-eb3ce47e2a30	2230	Lenart v Slovenskih goricah
00050000-5628-f089-1a44-1ec8eda01017	9220	Lendava/Lendva
00050000-5628-f089-18bc-336689f5091b	4248	Lesce
00050000-5628-f089-ec5e-7e61c65170be	3261	Lesično
00050000-5628-f089-f864-0111b430d57b	8273	Leskovec pri Krškem
00050000-5628-f089-9b23-618ee738abcd	2372	Libeliče
00050000-5628-f089-9e4c-731cebd717fb	2341	Limbuš
00050000-5628-f089-2756-af326b146589	1270	Litija
00050000-5628-f089-8772-8811c5efe8d2	3202	Ljubečna
00050000-5628-f089-afd6-ea0dff2b462b	1000	Ljubljana 
00050000-5628-f089-ad72-eb7101eaae89	1001	Ljubljana - poštni predali
00050000-5628-f089-97f9-229e14318db1	1231	Ljubljana - Črnuče
00050000-5628-f089-5509-40e3186ee511	1261	Ljubljana - Dobrunje
00050000-5628-f089-0cae-0c97c869a175	1260	Ljubljana - Polje
00050000-5628-f089-64cf-a566cd15d41c	1210	Ljubljana - Šentvid
00050000-5628-f089-7511-50d465d83da6	1211	Ljubljana - Šmartno
00050000-5628-f089-fd3e-04008291cce8	3333	Ljubno ob Savinji
00050000-5628-f089-4e42-c798d0f81c00	9240	Ljutomer
00050000-5628-f089-c653-77ddcabac66b	3215	Loče
00050000-5628-f089-4219-425898f3adac	5231	Log pod Mangartom
00050000-5628-f089-930b-4a939e331ca3	1358	Log pri Brezovici
00050000-5628-f089-a368-6f702d2ffa02	1370	Logatec
00050000-5628-f089-6865-88a4b35525f2	1371	Logatec
00050000-5628-f089-b092-6a30e7874e93	1434	Loka pri Zidanem Mostu
00050000-5628-f089-ef17-0181ce314c42	3223	Loka pri Žusmu
00050000-5628-f089-3a72-952976f1ca7e	6219	Lokev
00050000-5628-f089-46a6-e0d196c6b49c	1318	Loški Potok
00050000-5628-f089-a01b-9e050dc9c27e	2324	Lovrenc na Dravskem polju
00050000-5628-f089-d457-023dd6074eec	2344	Lovrenc na Pohorju
00050000-5628-f089-f512-2ea7fc49ef41	3334	Luče
00050000-5628-f089-b085-bdb14bbc3b17	1225	Lukovica
00050000-5628-f089-1c74-84b31e064b6c	9202	Mačkovci
00050000-5628-f089-26cb-456a8340d698	2322	Majšperk
00050000-5628-f089-4f72-9cd2a2474ac8	2321	Makole
00050000-5628-f089-5750-ec74a8b637b4	9243	Mala Nedelja
00050000-5628-f089-fbb9-d5d041298b2c	2229	Malečnik
00050000-5628-f089-01ea-66680ff6cfcf	6273	Marezige
00050000-5628-f089-a8d6-44c4cf3df8c3	2000	Maribor 
00050000-5628-f089-7c69-c670687dd3f7	2001	Maribor - poštni predali
00050000-5628-f089-10c8-72e1a204ecf4	2206	Marjeta na Dravskem polju
00050000-5628-f089-46c2-621dfc15d04f	2281	Markovci
00050000-5628-f089-c0eb-f993612e52fd	9221	Martjanci
00050000-5628-f089-0fd1-79051514737b	6242	Materija
00050000-5628-f089-0802-c29812c42c7e	4211	Mavčiče
00050000-5628-f089-bb37-8931c95313b1	1215	Medvode
00050000-5628-f089-50cb-85e1732104ca	1234	Mengeš
00050000-5628-f089-e0c4-7821e9fbb07b	8330	Metlika
00050000-5628-f089-1728-e63478b9c21c	2392	Mežica
00050000-5628-f089-edc0-9c7aa2ff658f	2204	Miklavž na Dravskem polju
00050000-5628-f089-a527-4f1c4a22abf3	2275	Miklavž pri Ormožu
00050000-5628-f089-e890-629ac938762b	5291	Miren
00050000-5628-f089-3403-18bc25e1c73f	8233	Mirna
00050000-5628-f089-9f3b-90f596679b1c	8216	Mirna Peč
00050000-5628-f089-3f41-8fa99220f142	2382	Mislinja
00050000-5628-f089-fa24-62904db5af09	4281	Mojstrana
00050000-5628-f089-1698-a312134b9caa	8230	Mokronog
00050000-5628-f089-a619-058f058a4c11	1251	Moravče
00050000-5628-f089-a93e-41a2242422d7	9226	Moravske Toplice
00050000-5628-f089-1995-1dca85f488bc	5216	Most na Soči
00050000-5628-f089-16f1-00396daa0243	1221	Motnik
00050000-5628-f089-5745-e6c97602efff	3330	Mozirje
00050000-5628-f089-735a-0690556242cf	9000	Murska Sobota 
00050000-5628-f089-66b4-5fbdfda67552	9001	Murska Sobota - poštni predali
00050000-5628-f089-ade8-e3f497c8a859	2366	Muta
00050000-5628-f089-7a3b-8524f7dd4def	4202	Naklo
00050000-5628-f089-7080-756976a8ba7a	3331	Nazarje
00050000-5628-f089-cb8b-218d606088bd	1357	Notranje Gorice
00050000-5628-f089-579f-579a6719c51f	3203	Nova Cerkev
00050000-5628-f089-9e43-a7994529ef02	5000	Nova Gorica 
00050000-5628-f089-d930-be41ae5b7e3c	5001	Nova Gorica - poštni predali
00050000-5628-f089-5608-226e68426aec	1385	Nova vas
00050000-5628-f089-0e27-ee785bcfa58b	8000	Novo mesto
00050000-5628-f089-d0a6-cf4174fabbeb	8001	Novo mesto - poštni predali
00050000-5628-f089-a35d-18531e19ae6c	6243	Obrov
00050000-5628-f089-8cdc-8e38df52790e	9233	Odranci
00050000-5628-f089-609e-39fb22ff2cbd	2317	Oplotnica
00050000-5628-f089-7607-abcacb270c4d	2312	Orehova vas
00050000-5628-f089-e681-5d1e28807f7d	2270	Ormož
00050000-5628-f089-26f6-0602564a687d	1316	Ortnek
00050000-5628-f089-9453-674f0fe159a0	1337	Osilnica
00050000-5628-f089-d759-2514433957f0	8222	Otočec
00050000-5628-f089-3bad-897b2fc0c135	2361	Ožbalt
00050000-5628-f089-9764-cd7edb0294ad	2231	Pernica
00050000-5628-f089-b71d-4ef24e41de03	2211	Pesnica pri Mariboru
00050000-5628-f089-4a6d-b13e7ee0e4c7	9203	Petrovci
00050000-5628-f089-aa77-b5301f6b562f	3301	Petrovče
00050000-5628-f089-0bfe-e02784daaa07	6330	Piran/Pirano
00050000-5628-f089-6c3c-b0bedc51d9c8	8255	Pišece
00050000-5628-f089-12c2-03f2adf7a7b0	6257	Pivka
00050000-5628-f089-fdd6-614315e047af	6232	Planina
00050000-5628-f089-362d-de2d9e5f0366	3225	Planina pri Sevnici
00050000-5628-f089-b9e8-c52e051e8e3e	6276	Pobegi
00050000-5628-f089-2ea2-fadf751695f4	8312	Podbočje
00050000-5628-f089-1bae-058cf5d9e945	5243	Podbrdo
00050000-5628-f089-399f-085d65e89e23	3254	Podčetrtek
00050000-5628-f089-7b66-eac9cb3e91bb	2273	Podgorci
00050000-5628-f089-9a64-99e451f90fa2	6216	Podgorje
00050000-5628-f089-d3cc-1204244cde26	2381	Podgorje pri Slovenj Gradcu
00050000-5628-f089-53b4-16f7d8fd100c	6244	Podgrad
00050000-5628-f089-f471-89353ba974f5	1414	Podkum
00050000-5628-f089-6425-e720f2e98de8	2286	Podlehnik
00050000-5628-f089-f452-54c56e54585a	5272	Podnanos
00050000-5628-f089-74fa-5d2f725ca76e	4244	Podnart
00050000-5628-f089-cbb9-f390fa361164	3241	Podplat
00050000-5628-f089-8a11-112121847e6a	3257	Podsreda
00050000-5628-f089-580e-dbbbf2d8f0da	2363	Podvelka
00050000-5628-f089-611c-d817afd9b8c8	2208	Pohorje
00050000-5628-f089-7289-e9131f347528	2257	Polenšak
00050000-5628-f089-83cb-87345354e8d4	1355	Polhov Gradec
00050000-5628-f089-1c9a-659db9ca2a88	4223	Poljane nad Škofjo Loko
00050000-5628-f089-30b5-d37586d5ad44	2319	Poljčane
00050000-5628-f089-ac65-3074d7211d56	1272	Polšnik
00050000-5628-f089-ad1f-93769ef090c4	3313	Polzela
00050000-5628-f089-692a-71927de6f4c4	3232	Ponikva
00050000-5628-f089-bcbd-f5234ec44eea	6320	Portorož/Portorose
00050000-5628-f089-4c09-1c7dff190844	6230	Postojna
00050000-5628-f089-c0eb-bfa07efa95f9	2331	Pragersko
00050000-5628-f089-2556-c9e939f26b4e	3312	Prebold
00050000-5628-f089-5882-7b2abe217919	4205	Preddvor
00050000-5628-f089-7e4e-9c0aaf7cf557	6255	Prem
00050000-5628-f089-4344-bc9bcdd4adba	1352	Preserje
00050000-5628-f089-bf38-f190f87b0734	6258	Prestranek
00050000-5628-f089-3e82-23388687f45e	2391	Prevalje
00050000-5628-f089-5f72-85820c5750e4	3262	Prevorje
00050000-5628-f089-3c40-dca246fc45b1	1276	Primskovo 
00050000-5628-f089-ed11-f6598dd4602b	3253	Pristava pri Mestinju
00050000-5628-f089-c401-c6d859c7bebd	9207	Prosenjakovci/Partosfalva
00050000-5628-f089-7c62-6e96febd8ca4	5297	Prvačina
00050000-5628-f089-73db-049cd047d269	2250	Ptuj
00050000-5628-f089-3a16-eb4d97de226a	2323	Ptujska Gora
00050000-5628-f089-5fc6-543648a1dbea	9201	Puconci
00050000-5628-f089-b7d0-628c84490fd2	2327	Rače
00050000-5628-f089-8436-f9b3798cd61b	1433	Radeče
00050000-5628-f089-2aa8-84f73ec49725	9252	Radenci
00050000-5628-f089-630a-80f38b3dcceb	2360	Radlje ob Dravi
00050000-5628-f089-8240-1e6b0d17f0d9	1235	Radomlje
00050000-5628-f089-d5d5-84b500a57907	4240	Radovljica
00050000-5628-f089-7009-5d0c17966d69	8274	Raka
00050000-5628-f089-f5b2-0438a81abe35	1381	Rakek
00050000-5628-f089-5a2e-b8bc4ccfd393	4283	Rateče - Planica
00050000-5628-f089-ef6c-52a2c76ef8bb	2390	Ravne na Koroškem
00050000-5628-f089-375b-e0395bbee13c	9246	Razkrižje
00050000-5628-f089-2d43-f242d3ae7d33	3332	Rečica ob Savinji
00050000-5628-f089-b682-d27715f43dcb	5292	Renče
00050000-5628-f089-c5fa-5a143a239170	1310	Ribnica
00050000-5628-f089-dcd5-5a26671f965a	2364	Ribnica na Pohorju
00050000-5628-f089-d2dd-3caff5c6a2e3	3272	Rimske Toplice
00050000-5628-f089-7c3b-971e9f262d82	1314	Rob
00050000-5628-f089-a967-efbfa1487659	5215	Ročinj
00050000-5628-f089-fdce-dda3a1602bb3	3250	Rogaška Slatina
00050000-5628-f089-4cce-edf855242005	9262	Rogašovci
00050000-5628-f089-43ca-245f24929e01	3252	Rogatec
00050000-5628-f089-cf00-23146e8ff0c9	1373	Rovte
00050000-5628-f089-c6ad-1685b9a32891	2342	Ruše
00050000-5628-f089-3fc4-eb649e418089	1282	Sava
00050000-5628-f089-8aad-f5b786c9c250	6333	Sečovlje/Sicciole
00050000-5628-f089-b904-c3bd24897029	4227	Selca
00050000-5628-f089-1f2c-6a36e68ac58a	2352	Selnica ob Dravi
00050000-5628-f089-6052-00373244ca77	8333	Semič
00050000-5628-f089-41f4-a796dfc4a632	8281	Senovo
00050000-5628-f089-dbe0-83da4c5f4b05	6224	Senožeče
00050000-5628-f089-efd9-e3707d643c28	8290	Sevnica
00050000-5628-f089-8f21-6e83e3ee3700	6210	Sežana
00050000-5628-f089-af7b-60689c428036	2214	Sladki Vrh
00050000-5628-f089-ed5a-5eec6b7d0599	5283	Slap ob Idrijci
00050000-5628-f089-bee0-3ca5ee3489a1	2380	Slovenj Gradec
00050000-5628-f089-3bd3-31f7f2579ae7	2310	Slovenska Bistrica
00050000-5628-f089-66f5-f67e90da6e5d	3210	Slovenske Konjice
00050000-5628-f089-6cda-7dcae9bed1bc	1216	Smlednik
00050000-5628-f089-7fde-6c638a809c4c	5232	Soča
00050000-5628-f089-2e55-229a2b1cc452	1317	Sodražica
00050000-5628-f089-df12-52050aa5062e	3335	Solčava
00050000-5628-f089-b617-075cf2d9aafd	5250	Solkan
00050000-5628-f089-a48c-b28131a1de1e	4229	Sorica
00050000-5628-f089-8ae4-6496a92e4c2c	4225	Sovodenj
00050000-5628-f089-cab9-c8714c40ed42	5281	Spodnja Idrija
00050000-5628-f089-bb56-83a695545245	2241	Spodnji Duplek
00050000-5628-f089-857b-84f491704a9d	9245	Spodnji Ivanjci
00050000-5628-f089-f693-1fc55f04d5f6	2277	Središče ob Dravi
00050000-5628-f089-559d-802be724088e	4267	Srednja vas v Bohinju
00050000-5628-f089-a21c-f4bec5fc677b	8256	Sromlje 
00050000-5628-f089-1af8-aeddee8646e7	5224	Srpenica
00050000-5628-f089-2148-e3536886364a	1242	Stahovica
00050000-5628-f089-290b-9433e39534ac	1332	Stara Cerkev
00050000-5628-f089-2ed5-2a91b8dd8d6d	8342	Stari trg ob Kolpi
00050000-5628-f089-1bc0-8e5f509be4dd	1386	Stari trg pri Ložu
00050000-5628-f089-ffa7-359165fb8d2a	2205	Starše
00050000-5628-f089-2530-3607072d7847	2289	Stoperce
00050000-5628-f089-f3b8-d4f8fb28c0e8	8322	Stopiče
00050000-5628-f089-4ebf-ed2e6b5ebcb4	3206	Stranice
00050000-5628-f089-e668-4a9943246cd4	8351	Straža
00050000-5628-f089-323d-1e83c8a38ec0	1313	Struge
00050000-5628-f089-9e10-408e500476c8	8293	Studenec
00050000-5628-f089-b3bf-980ee232b423	8331	Suhor
00050000-5628-f089-21d1-02688bf692af	2233	Sv. Ana v Slovenskih goricah
00050000-5628-f089-c9f9-6879128e8d52	2235	Sv. Trojica v Slovenskih goricah
00050000-5628-f089-1ba8-37f8471cb31a	2353	Sveti Duh na Ostrem Vrhu
00050000-5628-f089-ba41-653f6f14afe8	9244	Sveti Jurij ob Ščavnici
00050000-5628-f089-a1f4-76422edca7a9	3264	Sveti Štefan
00050000-5628-f089-4730-1724cf90ff51	2258	Sveti Tomaž
00050000-5628-f089-fb43-f5311d7b348e	9204	Šalovci
00050000-5628-f089-4ef7-af034dc24366	5261	Šempas
00050000-5628-f089-59a9-fa2b2511eb48	5290	Šempeter pri Gorici
00050000-5628-f089-ed15-28acd33e09ed	3311	Šempeter v Savinjski dolini
00050000-5628-f089-5ab2-0822d48c140a	4208	Šenčur
00050000-5628-f089-4961-c7db85ca90fc	2212	Šentilj v Slovenskih goricah
00050000-5628-f089-b11a-dacda6f32373	8297	Šentjanž
00050000-5628-f089-e9d0-66a21380500a	2373	Šentjanž pri Dravogradu
00050000-5628-f089-ef23-6443a949aed7	8310	Šentjernej
00050000-5628-f089-8de6-fbb48c8ec370	3230	Šentjur
00050000-5628-f089-318d-840760419675	3271	Šentrupert
00050000-5628-f089-6f28-505a907008d1	8232	Šentrupert
00050000-5628-f089-9f9f-e99c60e92bc0	1296	Šentvid pri Stični
00050000-5628-f089-ab44-e61b99c4f00c	8275	Škocjan
00050000-5628-f089-b878-05e6ce4811c5	6281	Škofije
00050000-5628-f089-e087-f6950bd72953	4220	Škofja Loka
00050000-5628-f089-9670-987bca943983	3211	Škofja vas
00050000-5628-f089-0816-6b92be642dfa	1291	Škofljica
00050000-5628-f089-2148-d645ef7e2e64	6274	Šmarje
00050000-5628-f089-51c1-943909df0d9c	1293	Šmarje - Sap
00050000-5628-f089-b1d0-a91402c8aa01	3240	Šmarje pri Jelšah
00050000-5628-f089-93e0-312de39922cf	8220	Šmarješke Toplice
00050000-5628-f089-7f80-d2b39c2d6eb7	2315	Šmartno na Pohorju
00050000-5628-f089-4072-ef49ea190f28	3341	Šmartno ob Dreti
00050000-5628-f089-915d-ab47260cb19a	3327	Šmartno ob Paki
00050000-5628-f089-1ac3-90ca4d5bedf3	1275	Šmartno pri Litiji
00050000-5628-f089-edf9-966d89c91428	2383	Šmartno pri Slovenj Gradcu
00050000-5628-f089-b0ec-43cad4b2f376	3201	Šmartno v Rožni dolini
00050000-5628-f089-45eb-49ba2a47d1ee	3325	Šoštanj
00050000-5628-f089-8bb8-f2f72e60092a	6222	Štanjel
00050000-5628-f089-6366-601507ae4e87	3220	Štore
00050000-5628-f089-425a-14808a1e6c6b	3304	Tabor
00050000-5628-f089-6fb2-6bc124a690d1	3221	Teharje
00050000-5628-f089-f920-1c1a9ccfb177	9251	Tišina
00050000-5628-f089-f4c5-c048ed65a112	5220	Tolmin
00050000-5628-f089-30f8-509a611173db	3326	Topolšica
00050000-5628-f089-f6ab-b2c519f0cc7c	2371	Trbonje
00050000-5628-f089-b89a-384fa04d3bb1	1420	Trbovlje
00050000-5628-f089-78ca-01c013c84956	8231	Trebelno 
00050000-5628-f089-4dfa-df9077b8f12f	8210	Trebnje
00050000-5628-f089-f918-a5310f9794c2	5252	Trnovo pri Gorici
00050000-5628-f089-e283-cf7cad8fb8b3	2254	Trnovska vas
00050000-5628-f089-e8af-bd329d5e9342	1222	Trojane
00050000-5628-f089-0882-e532b21d4e2c	1236	Trzin
00050000-5628-f089-39f5-031f0d0607de	4290	Tržič
00050000-5628-f089-5bdf-046d94c86df9	8295	Tržišče
00050000-5628-f089-b0be-fe3cb7a0a757	1311	Turjak
00050000-5628-f089-94eb-89ba7e738f20	9224	Turnišče
00050000-5628-f089-b5fc-8d25d7eb9a00	8323	Uršna sela
00050000-5628-f089-7b66-d6dc5fd07bd5	1252	Vače
00050000-5628-f089-561e-ac76ca9aaa0f	3320	Velenje 
00050000-5628-f089-388e-aeea3e2e9815	3322	Velenje - poštni predali
00050000-5628-f089-8050-0735bcd96b45	8212	Velika Loka
00050000-5628-f089-e31d-c7388004d4d5	2274	Velika Nedelja
00050000-5628-f089-3909-f43f7831822b	9225	Velika Polana
00050000-5628-f089-6f76-27214c5236c2	1315	Velike Lašče
00050000-5628-f089-5d63-99a185d391ea	8213	Veliki Gaber
00050000-5628-f089-cb00-3577b9288d7f	9241	Veržej
00050000-5628-f089-60fe-13e3329de519	1312	Videm - Dobrepolje
00050000-5628-f089-8ccc-259b13198a4b	2284	Videm pri Ptuju
00050000-5628-f089-40b7-a18187b3b8ff	8344	Vinica
00050000-5628-f089-b70b-3fb0d58599ae	5271	Vipava
00050000-5628-f089-f7a5-af771dd27241	4212	Visoko
00050000-5628-f089-369a-823aa493c518	1294	Višnja Gora
00050000-5628-f089-6eb4-3ad54518b5e6	3205	Vitanje
00050000-5628-f089-5f97-6a32dda003a5	2255	Vitomarci
00050000-5628-f089-aa22-821baacc7fb6	1217	Vodice
00050000-5628-f089-1c2f-362a9f7ef464	3212	Vojnik\t
00050000-5628-f089-a444-733a759b8759	5293	Volčja Draga
00050000-5628-f089-3d0a-fd869571683d	2232	Voličina
00050000-5628-f089-1fc3-7d054ea9ffa8	3305	Vransko
00050000-5628-f089-7a8f-258587f50bcc	6217	Vremski Britof
00050000-5628-f089-5217-ec714e0c7f2b	1360	Vrhnika
00050000-5628-f089-962e-a02528e3c9e7	2365	Vuhred
00050000-5628-f089-372b-bdee6595b07e	2367	Vuzenica
00050000-5628-f089-e465-f8acd9f34179	8292	Zabukovje 
00050000-5628-f089-0b18-a174c868760b	1410	Zagorje ob Savi
00050000-5628-f089-e077-d33f489f7cfa	1303	Zagradec
00050000-5628-f089-140c-eaacc5ba595c	2283	Zavrč
00050000-5628-f089-d27f-0a80f959c991	8272	Zdole 
00050000-5628-f089-0e8b-f8da09ccc611	4201	Zgornja Besnica
00050000-5628-f089-1e99-2de041877823	2242	Zgornja Korena
00050000-5628-f089-8a9e-dda0c27074e8	2201	Zgornja Kungota
00050000-5628-f089-ac89-9065bab13330	2316	Zgornja Ložnica
00050000-5628-f089-c524-1e880c530bb3	2314	Zgornja Polskava
00050000-5628-f089-e945-cd51947e29eb	2213	Zgornja Velka
00050000-5628-f089-accd-b04f93d6cdb8	4247	Zgornje Gorje
00050000-5628-f089-b3d4-920e711a68e3	4206	Zgornje Jezersko
00050000-5628-f089-580c-913cf29700d6	2285	Zgornji Leskovec
00050000-5628-f089-e329-d4ae103165f1	1432	Zidani Most
00050000-5628-f089-87f9-ce89a477587a	3214	Zreče
00050000-5628-f089-e4d2-aa8f7ee032ec	4209	Žabnica
00050000-5628-f089-f75f-de5bbcbe39f6	3310	Žalec
00050000-5628-f089-e993-a5ca3e6db088	4228	Železniki
00050000-5628-f089-4118-6d137f74c2e8	2287	Žetale
00050000-5628-f089-37f3-7b3cd437665c	4226	Žiri
00050000-5628-f089-fdca-6607cd0e59b0	4274	Žirovnica
00050000-5628-f089-9a28-b5634fa4dbcd	8360	Žužemberk
\.


--
-- TOC entry 3111 (class 0 OID 23146121)
-- Dependencies: 236
-- Data for Name: postavkacdve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkacdve (id, skupina, podskupina, naziv, vrpremiere, vrponovitvepremier, vrponovitveprejsnjih, vrgostovanjazamejstvo, vrfestivali, vrgostovanjaint, vrostalo, programdela_id) FROM stdin;
\.


--
-- TOC entry 3084 (class 0 OID 23145713)
-- Dependencies: 209
-- Data for Name: postavkaracuna; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkaracuna (id, racun_id) FROM stdin;
\.


--
-- TOC entry 3062 (class 0 OID 23145467)
-- Dependencies: 187
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
00060000-5628-f08d-e70f-75387f50ddeb	00080000-5628-f08d-4ec8-32f7282e4da9	\N	00040000-5628-f08a-b44c-0d45fec90b3d	Narodni dom	\N	Koroška 15	\N	9231	Beltinci	\N	f	t
00060000-5628-f08d-30d0-465434fd19ca	00080000-5628-f08d-4ec8-32f7282e4da9	\N	00040000-5628-f08a-b44c-0d45fec90b3d	Korotan	\N	Koroška 22	\N	9231	Beltinci	\N	f	f
00060000-5628-f08d-e269-47b7f089de09	00080000-5628-f08d-8743-6e0f0f2c979b	\N	00040000-5628-f08a-b44c-0d45fec90b3d	Rimljan	\N	Rimska ploščad 7	\N	9231	Beltinci	\N	f	t
\.


--
-- TOC entry 3074 (class 0 OID 23145611)
-- Dependencies: 199
-- Data for Name: praznik; Type: TABLE DATA; Schema: public; Owner: -
--

COPY praznik (id, ime, dan, mesec, leto, delaprost) FROM stdin;
00430000-5628-f08a-8e50-0fba79e4c6c3	novo leto	1	1	\N	t
00430000-5628-f08a-fe80-ce600bac6ac0	Prešernov dan, slovenski kulturni praznik	8	2	\N	t
00430000-5628-f08a-0cd5-cd304a502ace	dan upora proti okupatorju	27	4	\N	t
00430000-5628-f08a-0779-111a092f503e	praznik dela	1	5	\N	t
00430000-5628-f08a-8d48-1d895194f25e	praznik dela	2	5	\N	t
00430000-5628-f08a-feb1-d4d3071006e6	dan Primoža Trubarja	8	6	\N	f
00430000-5628-f08a-de6d-df15b3202df7	dan državnosti	25	6	\N	t
00430000-5628-f08a-5b98-f4e71fbdb50e	združitev prekmurskih Slovencev z matičnim narodom	17	8	\N	f
00430000-5628-f08a-5bc8-7fd2a1617db0	vrnitev Primorske k matični domovini	15	9	\N	f
00430000-5628-f08a-e4ae-907baa318d0e	dan suverenosti	25	10	\N	f
00430000-5628-f08a-7f8f-73283b539b9c	dan spomina na mrtve	1	11	\N	t
00430000-5628-f08a-a00c-ef788dd46591	dan Rudolfa Maistra	23	11	\N	f
00430000-5628-f08a-c100-e3270d9eec14	božič	25	12	\N	t
00430000-5628-f08a-2875-274cccf1edc6	dan samostojnosti in enotnosti	26	12	\N	t
00430000-5628-f08a-5eb6-dc9982826361	Marijino vnebovzetje	15	8	\N	t
00430000-5628-f08a-04a9-9ab1b390cf62	dan reformacije	31	10	\N	t
00430000-5628-f08a-cbe7-66c9ee3d345f	velikonočna nedelja	27	3	2016	t
00430000-5628-f08a-c191-8b141d33f949	velikonočna nedelja	16	4	2017	t
00430000-5628-f08a-110a-58086239828f	velikonočna nedelja	1	4	2018	t
00430000-5628-f08a-d06a-ab25b6b7c5f1	velikonočna nedelja	21	4	2019	t
00430000-5628-f08a-4226-ec2bf638f767	velikonočna nedelja	12	4	2020	t
00430000-5628-f08a-a917-9088d90db22b	velikonočna nedelja	4	4	2021	t
00430000-5628-f08a-2ad7-bda1fcd3ef4d	velikonočna nedelja	17	4	2022	t
00430000-5628-f08a-94cb-8727f15736bc	velikonočna nedelja	9	4	2023	t
00430000-5628-f08a-f898-83882a2c7019	velikonočna nedelja	31	3	2024	t
00430000-5628-f08a-68b5-1180183af19b	velikonočna nedelja	20	4	2025	t
00430000-5628-f08a-4b4b-a5b1195701b2	velikonočna nedelja	5	4	2026	t
00430000-5628-f08a-c794-1cf78faf93ad	velikonočna nedelja	28	3	2027	t
00430000-5628-f08a-f511-d54eaa52c65f	velikonočna nedelja	16	4	2028	t
00430000-5628-f08a-7431-3513f36e94ac	velikonočna nedelja	1	4	2029	t
00430000-5628-f08a-5e64-59b54db8c6e7	velikonočna nedelja	21	4	2030	t
00430000-5628-f08a-ac61-c8f6cd9c1805	velikonočni ponedeljek	28	3	2016	t
00430000-5628-f08a-7f78-8f2cca77a0c7	velikonočni ponedeljek	17	4	2017	t
00430000-5628-f08a-fe73-c1266114a6f1	velikonočni ponedeljek	2	4	2018	t
00430000-5628-f08a-e21d-5527d334d034	velikonočni ponedeljek	22	4	2019	t
00430000-5628-f08a-14da-a3de6df8b039	velikonočni ponedeljek	13	4	2020	t
00430000-5628-f08a-bd06-7bf3e5688516	velikonočni ponedeljek	5	4	2021	t
00430000-5628-f08a-f6e8-7373fee6178c	velikonočni ponedeljek	18	4	2022	t
00430000-5628-f08a-db94-eef6fb87411a	velikonočni ponedeljek	10	4	2023	t
00430000-5628-f08a-728a-59b6ac07fb22	velikonočni ponedeljek	1	4	2024	t
00430000-5628-f08a-025a-42b64e31d523	velikonočni ponedeljek	21	4	2025	t
00430000-5628-f08a-a3b4-7660644060de	velikonočni ponedeljek	6	4	2026	t
00430000-5628-f08a-7dd3-f018ebe56ed8	velikonočni ponedeljek	29	3	2027	t
00430000-5628-f08a-be94-59a26d19d03c	velikonočni ponedeljek	17	4	2028	t
00430000-5628-f08a-ac8d-c0ade710fce4	velikonočni ponedeljek	2	4	2029	t
00430000-5628-f08a-8e26-8e2a0610a2ec	velikonočni ponedeljek	22	4	2030	t
00430000-5628-f08a-4c1b-167b079cbcc1	binkoštna nedelja - binkošti	15	5	2016	t
00430000-5628-f08a-e6c5-8937f4d4dd4b	binkoštna nedelja - binkošti	4	6	2017	t
00430000-5628-f08a-d2f0-0963c52d3b2e	binkoštna nedelja - binkošti	20	5	2018	t
00430000-5628-f08a-26d0-9a5ee6b14899	binkoštna nedelja - binkošti	9	6	2019	t
00430000-5628-f08a-1590-ad60373056e0	binkoštna nedelja - binkošti	31	5	2020	t
00430000-5628-f08a-28ad-a1ecc4f89405	binkoštna nedelja - binkošti	23	5	2021	t
00430000-5628-f08a-e54d-b83b01ced790	binkoštna nedelja - binkošti	5	6	2022	t
00430000-5628-f08a-6497-4c882d2b6555	binkoštna nedelja - binkošti	28	5	2023	t
00430000-5628-f08a-ebe3-d7a02c964502	binkoštna nedelja - binkošti	19	5	2024	t
00430000-5628-f08a-59f6-910a396b95f6	binkoštna nedelja - binkošti	8	6	2025	t
00430000-5628-f08a-9164-ee4270e0115f	binkoštna nedelja - binkošti	24	5	2026	t
00430000-5628-f08a-ac0e-978cf580fcc6	binkoštna nedelja - binkošti	16	5	2027	t
00430000-5628-f08a-182c-904f761f7e40	binkoštna nedelja - binkošti	4	6	2028	t
00430000-5628-f08a-1cc6-36046930bfc9	binkoštna nedelja - binkošti	20	5	2029	t
00430000-5628-f08a-5b41-1fcab8df9cc2	binkoštna nedelja - binkošti	9	6	2030	t
\.


--
-- TOC entry 3070 (class 0 OID 23145571)
-- Dependencies: 195
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, dezurni_id, zaporedna, zaporednasez, objavljenzacetek, porocilo) FROM stdin;
\.


--
-- TOC entry 3071 (class 0 OID 23145583)
-- Dependencies: 196
-- Data for Name: predstava_abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava_abonma (predstava_id, abonma_id) FROM stdin;
\.


--
-- TOC entry 3086 (class 0 OID 23145725)
-- Dependencies: 211
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 3112 (class 0 OID 23146135)
-- Dependencies: 237
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, koproducent_id, odstotekfinanciranja, delez, maticnikop, kpe, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 3113 (class 0 OID 23146145)
-- Dependencies: 238
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, sifra, status) FROM stdin;
00190000-5628-f08d-34ca-de4127f863aa	00080000-5628-f08d-dec7-ba1a0a09bb7b	0987	AK
00190000-5628-f08d-2062-8f0d5cbfd2f6	00080000-5628-f08d-8743-6e0f0f2c979b	0989	AK
00190000-5628-f08d-f9f7-2b94372a9d08	00080000-5628-f08d-6f43-c0ae78440a1d	0986	AK
00190000-5628-f08d-fcc1-29971f1bb4f4	00080000-5628-f08d-abe7-dc589fc44e83	0984	AK
00190000-5628-f08d-c414-6cc59dc41406	00080000-5628-f08d-22e8-3c188c575c31	0983	AK
00190000-5628-f08d-0cf3-690d7fa62f1d	00080000-5628-f08d-008d-469c650f2940	0982	AK
00190000-5628-f08f-909f-8b891a815602	00080000-5628-f08f-8be6-ac84ae37da02	1001	AK
\.


--
-- TOC entry 3110 (class 0 OID 23146060)
-- Dependencies: 235
-- Data for Name: programdela; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programdela (id, sifra, naziv, zacetek, konec, zakljuceno, potrjenprogram, stpremier, stpremiervelikih, stpremiermalih, stpremiermalihkopr, stpremiervelikihkopr, stpremiersredkopr, stint, stfest, strazno, stizjem, stponprem, stponprej, stponprejvelikih, stponprejmalih, stponprejmalihkopr, stponprejsredkopr, stponprejvelikihkopr, stgostujo, vrps1, vrps1do, vrps1mat, vrps1gostovsz, stizvnekomerc, stizvprem, stizvpremdoma, stizvpremkopr, stizvponprem, stizvponpremdoma, stizvponpremzamejo, stizvponpremgost, stizvponpremkopr, stizvponpremint, stizvponpremkoprint, stizvponprej, stizvponprejdoma, stizvponprejzamejo, stizvponprejgost, stizvponprejkopr, stizvponprejint, stizvponprejkoprint, stizvgostuj, stizvostalihnek, stizvgostovanjslo, stizvgostovanjzam, stizvgostovanjint, stobisknekom, stobisknekommat, stobisknekomgostslo, stobisknekomgostzam, stobisknekomgostint, stobiskprem, stobiskpremdoma, stobiskpremkopr, stobiskponprem, stobiskponpremdoma, stobiskponpremkopr, stobiskponpremkoprint, stobiskponpremgost, stobiskponpremzamejo, stobiskponpremint, avgobiskprired, avgzaseddvoran, avgcenavstopnice, stprodvstopnic, stkoprodukcij, stkoprodukcijint, stkoprodukcijnvo, stzaposlenih, stzaposigralcev, avgstnastopovigr, sthonorarnihzun, sthonorarnihzunigr, sthonorarnihzunigrtujjz, sthonorarnihzunsamoz, sredstvaint, sredstvaavt, sredstvazaprosenoprem, sredstvazaprosenoponprem, sredstvazaprosenoponprej, sredstvazaprosenogostujo, sredstvazaprosenoint, sredstvazaprosenofest, sredstvazaprosenorazno, sredstvazaprosenoizjem, sredstvadrugijavniprem, sredstvadrugijavniponprem, sredstvadrugijavniponprej, sredstvadrugijavnigostujo, sredstvadrugijavniint, sredstvadrugijavnifest, sredstvadrugijavnirazno, sredstvadrugijavniizjem, sredstvadrugiviriprem, sredstvadrugiviriponprem, sredstvadrugiviriponprej, sredstvadrugivirigostujo, sredstvadrugiviriint, sredstvadrugivirifest, sredstvadrugivirirazno, sredstvadrugiviriizjem, sredstvaavtsamoz) FROM stdin;
00290000-5628-f08d-a673-0ad63847f3d1	0001	Testni program dela	2016-02-01	2017-02-01	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 3114 (class 0 OID 23146153)
-- Dependencies: 239
-- Data for Name: programskaenotasklopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programskaenotasklopa (id, naslovpe, avtorpe, obsegpe, mesecpe, vrednostpe, obiskdoma, programrazno_id) FROM stdin;
\.


--
-- TOC entry 3090 (class 0 OID 23145754)
-- Dependencies: 215
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, popa_id, naslov_id, sifra, naziv, jeprizorisce, jematicnioder, seplanira, kapaciteta, opis) FROM stdin;
00220000-5628-f08c-08d2-fe3da6c2382f	\N	\N	0001	Poskusna 1	f	\N	t	8	Poskusna učilnica v prvem
00220000-5628-f08c-6289-d6ded8dfd242	\N	\N	0002	Poskusna 3	f	\N	f	34	Poskusna učilnica v tretjem
00220000-5628-f08c-57e2-92a18c5dc6ec	\N	\N	0003	Kazinska	t	\N	t	84	Kazinska dvorana
00220000-5628-f08c-0462-67ab4a9fe50a	\N	\N	0004	Mali oder	t	\N	t	24	Mali oder 
00220000-5628-f08c-ff67-a7c7f1026a2b	\N	\N	0005	Komorni oder	t	\N	t	150	Komorni oder
00220000-5628-f08c-7472-4b1169840d3f	\N	\N	0006	Stara dvorana	t	\N	t	96	Stara dvorana ali dvorana Franceta Prešerna
00220000-5628-f08c-8bba-d68c8e465e8a	\N	\N	0007	Velika dvorana	t	\N	t	160	Velika, glavna dvorana
\.


--
-- TOC entry 3082 (class 0 OID 23145698)
-- Dependencies: 207
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 3081 (class 0 OID 23145688)
-- Dependencies: 206
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 3103 (class 0 OID 23145899)
-- Dependencies: 228
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta, status) FROM stdin;
\.


--
-- TOC entry 3097 (class 0 OID 23145829)
-- Dependencies: 222
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 3068 (class 0 OID 23145545)
-- Dependencies: 193
-- Data for Name: report; Type: TABLE DATA; Schema: public; Owner: -
--

COPY report (id, job_id, title, filename, transfers, size, format, hash, createdat) FROM stdin;
\.


--
-- TOC entry 3049 (class 0 OID 23145319)
-- Dependencies: 174
-- Data for Name: revizije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY revizije (id, razred, objectid, upor, datum, tip, data) FROM stdin;
1	App\\Entity\\Popa	00080000-5628-f08f-8be6-ac84ae37da02	00010000-5628-f08a-2cd5-eeeab1e2aa02	2015-10-22 16:19:59	INS	a:0:{}
2	App\\Entity\\Option	00000000-5628-f08f-028d-29b69d6e0791	00010000-5628-f08a-2cd5-eeeab1e2aa02	2015-10-22 16:19:59	INS	a:0:{}
3	ProgramDela\\Entity\\ProdukcijskaHisa	00190000-5628-f08f-909f-8b891a815602	00010000-5628-f08a-2cd5-eeeab1e2aa02	2015-10-22 16:19:59	INS	a:0:{}
\.


--
-- TOC entry 3133 (class 0 OID 0)
-- Dependencies: 173
-- Name: revizije_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('revizije_id_seq', 3, true);


--
-- TOC entry 3091 (class 0 OID 23145767)
-- Dependencies: 216
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 3053 (class 0 OID 23145357)
-- Dependencies: 178
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-5628-f08a-c377-30171e00e99b	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-5628-f08a-dcbd-26050573a451	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-5628-f08a-4c71-122f301b8985	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-5628-f08a-5727-7a72cd9d86c5	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-5628-f08a-27c7-7b1931398b45	planer	Planer dogodkov v koledarju	t
00020000-5628-f08a-ac22-5198234c27fa	kadrovska	Kadrovska služba	t
00020000-5628-f08a-1cbb-18f7b2fb57ed	arhivar	Ažuriranje arhivalij	t
00020000-5628-f08a-93aa-3474276c618c	igralec	Igralec	t
00020000-5628-f08a-6313-a811286f35d1	prisotnost	Vnašalec prisotnosti, tudi za tiste izven uprizoritev	t
00020000-5628-f08c-2074-f1849d048c79	vsadovoljenja	Vloga z vsemi posameznimi dovoljenji	t
\.


--
-- TOC entry 3051 (class 0 OID 23145341)
-- Dependencies: 176
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-5628-f08a-56c2-655722199f9b	00020000-5628-f08a-4c71-122f301b8985
00010000-5628-f08a-2cd5-eeeab1e2aa02	00020000-5628-f08a-4c71-122f301b8985
00010000-5628-f08d-8b97-f76968948dfd	00020000-5628-f08c-2074-f1849d048c79
\.


--
-- TOC entry 3093 (class 0 OID 23145781)
-- Dependencies: 218
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 3085 (class 0 OID 23145719)
-- Dependencies: 210
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 3079 (class 0 OID 23145665)
-- Dependencies: 204
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, sifra, ime, zacetek, konec, aktivna) FROM stdin;
001f0000-5628-f08c-7b81-f0977bf2a911	2015	Sezona 2015	2015-01-01	2015-12-31	t
001f0000-5628-f08c-9e9c-79a463c7db08	2016	Sezona 2016	2016-01-01	2016-12-31	t
001f0000-5628-f08c-eb7e-e48f4c8079a0	2017	Sezona 2017	2017-01-01	2017-12-31	t
\.


--
-- TOC entry 3047 (class 0 OID 23145306)
-- Dependencies: 172
-- Data for Name: stevilcenje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenje (id, sifra, naziv, prefix, suffix, zacetek, dolzina, format, globalno, poletih) FROM stdin;
00230000-5628-f08a-9bf5-6bf68b59555f	pri	Privzeto številčenje po letih YYYY-N	\N	\N	1	1	%l-%n	f	t
00230000-5628-f08a-93d4-a1094c31e13f	123	Privzeto številčenje kratkih šifer	\N	\N	100	3	%n	f	f
00230000-5628-f08a-afc9-01f0e57df1a4	bcd	Globalno številčenje črtnih kod	\N	\N	1	9	%n	t	f
00230000-5628-f08a-e2c9-4ef98d18e914	sif	Številčenje šifrant	\N	\N	1000	4	%n	f	f
00230000-5628-f08a-b280-08d9c9f0f580	tmp	Globalno številčenje začasnih številk	tmp	\N	1000	5	%l%n	t	t
\.


--
-- TOC entry 3046 (class 0 OID 23145298)
-- Dependencies: 171
-- Data for Name: stevilcenjekonfig; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjekonfig (id, stevilcenje_id, dok) FROM stdin;
00240000-5628-f08a-cb4c-78d80a2d57dc	00230000-5628-f08a-e2c9-4ef98d18e914	popa
00240000-5628-f08a-9eba-8e34b53c986c	00230000-5628-f08a-e2c9-4ef98d18e914	oseba
00240000-5628-f08a-42f9-0fc2912e20d1	00230000-5628-f08a-e2c9-4ef98d18e914	tippopa
00240000-5628-f08a-2a4e-d797e4b52b6d	00230000-5628-f08a-e2c9-4ef98d18e914	organizacijskaenota
00240000-5628-f08a-0d3c-f031b2bcdc18	00230000-5628-f08a-e2c9-4ef98d18e914	sezona
00240000-5628-f08a-6aa7-129fe5c24704	00230000-5628-f08a-e2c9-4ef98d18e914	tipvaje
00240000-5628-f08a-df60-7d707bd5a6ea	00230000-5628-f08a-93d4-a1094c31e13f	prostor
00240000-5628-f08a-b096-263ff32758af	00230000-5628-f08a-e2c9-4ef98d18e914	besedilo
00240000-5628-f08a-d259-509fefb5cb20	00230000-5628-f08a-e2c9-4ef98d18e914	uprizoritev
00240000-5628-f08a-0d8e-b4294eaad08b	00230000-5628-f08a-e2c9-4ef98d18e914	funkcija
00240000-5628-f08a-1773-816da4418a31	00230000-5628-f08a-e2c9-4ef98d18e914	tipfunkcije
00240000-5628-f08a-1c84-88c9d2d499e9	00230000-5628-f08a-e2c9-4ef98d18e914	alternacija
00240000-5628-f08a-c7b9-ef11c543b19a	00230000-5628-f08a-9bf5-6bf68b59555f	pogodba
00240000-5628-f08a-0c3d-03440204b027	00230000-5628-f08a-e2c9-4ef98d18e914	zaposlitev
00240000-5628-f08a-6bf7-bb0d768ef858	00230000-5628-f08a-e2c9-4ef98d18e914	zvrstuprizoritve
00240000-5628-f08a-d3bc-ac4352053661	00230000-5628-f08a-9bf5-6bf68b59555f	programdela
00240000-5628-f08a-3c77-7d3352915ca0	00230000-5628-f08a-e2c9-4ef98d18e914	zapis
\.


--
-- TOC entry 3045 (class 0 OID 23145293)
-- Dependencies: 170
-- Data for Name: stevilcenjestanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjestanje (id, objid, leto, stevilka) FROM stdin;
34729b95-ffd8-4e7b-a8d7-f5475f0638b7	00240000-5628-f08a-cb4c-78d80a2d57dc	0	1001
\.


--
-- TOC entry 3099 (class 0 OID 23145846)
-- Dependencies: 224
-- Data for Name: strosekuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY strosekuprizoritve (id, uprizoritev_id, popa_id, naziv, vrednostdo, vrednostna, opis, tipstroska, sort, vrstastroska_id) FROM stdin;
00270000-5628-f08d-c406-617ed7bce347	000e0000-5628-f08d-bbd5-1e6e3efa9d6b	00080000-5628-f08d-4ec8-32f7282e4da9	Nabava kostumov	600.50	20.00	Krila in maske	materialni	1	003b0000-5628-f08a-7bf6-29e4633ef9eb
00270000-5628-f08d-c051-22bc794941ea	000e0000-5628-f08d-bbd5-1e6e3efa9d6b	00080000-5628-f08d-4ec8-32f7282e4da9	Zavese	125.70	3.10	Modra in zelena zavesa	materialni	2	003b0000-5628-f08a-7bf6-29e4633ef9eb
\.


--
-- TOC entry 3059 (class 0 OID 23145429)
-- Dependencies: 184
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 3080 (class 0 OID 23145675)
-- Dependencies: 205
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja, dezurni, gost) FROM stdin;
001a0000-5628-f08d-3661-80c576aa7090	00180000-5628-f08d-3d2c-ee320d03c1de	000c0000-5628-f08d-dff8-a9c73ae50c02	00090000-5628-f08d-cdb3-fc31f46522b1	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-5628-f08d-f362-9cd5f916fe33	00180000-5628-f08d-3d2c-ee320d03c1de	000c0000-5628-f08d-b715-e32e52369319	00090000-5628-f08d-60ff-ff9d9b490c1a	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-5628-f08d-8a56-5e585f19f50a	00180000-5628-f08d-3d2c-ee320d03c1de	000c0000-5628-f08d-40ef-9e9e97a238ff	00090000-5628-f08d-380d-af7310e90380	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-5628-f08d-a1a0-93d83628d048	00180000-5628-f08d-3d2c-ee320d03c1de	000c0000-5628-f08d-aa84-a4785440ff12	00090000-5628-f08d-fc49-cb83e87e5a6e	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-5628-f08d-e07b-bb5dd0b6d0fe	00180000-5628-f08d-3d2c-ee320d03c1de	000c0000-5628-f08d-f544-838dd30039bb	00090000-5628-f08d-c447-eea9045bffe2	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-5628-f08d-4cca-c529c8f9caeb	00180000-5628-f08d-08bb-78d668d1f454	\N	00090000-5628-f08d-c447-eea9045bffe2	2015-08-01 20:00:00	2015-08-01 23:00:00	\N	\N	2.00	t	f
001a0000-5628-f08d-cdbe-1d867aed1796	00180000-5628-f08d-08bb-78d668d1f454	\N	00090000-5628-f08d-60ff-ff9d9b490c1a	2015-08-01 20:00:00	2015-08-01 23:00:00	\N	\N	2.00	f	t
\.


--
-- TOC entry 3102 (class 0 OID 23145887)
-- Dependencies: 227
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, sifra, ime, opis, imezenski, podrocje, sort) FROM stdin;
000f0000-5628-f08a-ac5b-4529a109c144	01	Avtor	Avtorji	Avtorka	umetnik	150
000f0000-5628-f08a-d2be-97c2a5a709b0	02	Priredba	Priredba	Priredba	umetnik	160
000f0000-5628-f08a-1fef-802a1921e6b1	03	Prevod	Prevod	Prevod	umetnik	20
000f0000-5628-f08a-fc8e-e8bf90391690	04	Režija	Režija	Režija	umetnik	30
000f0000-5628-f08a-2925-668caa38a71a	05	Dramaturgija	Dramaturgija	Dramaturgija	umetnik	40
000f0000-5628-f08a-8d69-1b823d85b43c	06	Scenografija	Scenografija	Scenografija	umetnik	60
000f0000-5628-f08a-a5d2-1f07cb5f1b30	07	Kostumografija	Kostumografija	Kostumografija	umetnik	70
000f0000-5628-f08a-03ab-4784b9e6c578	08	Koreografija	Koreografija	Koreografija	umetnik	90
000f0000-5628-f08a-4f8f-1135b0168f0f	09	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	umetnik	100
000f0000-5628-f08a-1835-a7fb99fa52fe	10	Oblikovanje maske	Oblikovanje maske	Oblikovanje maske	umetnik	110
000f0000-5628-f08a-a541-d4359b471852	11	Lektorstvo	Lektorstvo	Lektorstvo	umetnik	50
000f0000-5628-f08a-a929-183f448cdfcb	12	Glasbeni soustvarjalec	Glasbeni soustvarjalci	Glasbena soustvarjalka	umetnik	80
000f0000-5628-f08a-0c13-1e71eb467151	13	Intermedijski ustvarjalec	Intermedijski ustvarjalci	Intermedijski ustvarjalka	umetnik	130
000f0000-5628-f08a-be15-27146a9e68df	14	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	umetnik	120
000f0000-5628-f08a-6a43-49ef1f35c3c2	15	Vloga	Intermedijski ustvarjalci	Intermedijska ustvarjalka	igralec	10
000f0000-5628-f08a-406e-2718f050fdff	16	Produkcija, mentorstvo	Produkcija, mentorstvo	Produkcija, mentorstvo	umetnik	140
000f0000-5628-f08a-8b20-cd8ab0af79f0	17	Tehnična podpora	Tehnična podpora	Tehnična podpora	tehnik	180
000f0000-5628-f08a-cf09-7ff8e6f1b07b	18	Inšpicient	Inšpicienti	Inšpicientka	inspicient	170
\.


--
-- TOC entry 3056 (class 0 OID 23145383)
-- Dependencies: 181
-- Data for Name: tippopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tippopa (id, sifra, ime, opis) FROM stdin;
00400000-5628-f08c-b6e1-07b8bea782a8	0001	šola	osnovna ali srednja šola
00400000-5628-f08c-8a59-b4941290b2a1	0002	gledalec	gledalec, ki ima abonma ali podobno
00400000-5628-f08c-2709-1be5d2368e4a	0003	sponzor	sponzor dogodkov
\.


--
-- TOC entry 3115 (class 0 OID 23146164)
-- Dependencies: 240
-- Data for Name: tipprogramskeenote; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipprogramskeenote (id, sifra, naziv, koprodukcija, maxfaktor, maxvsi) FROM stdin;
002b0000-5628-f08a-f076-d4a0fc6c61c3	01	Velika predstava	f	1.00	1.00
002b0000-5628-f08a-089b-0e4bc2661bcc	02	Mala predstava	f	0.50	0.50
002b0000-5628-f08a-2878-476d4dd825e7	03	Mala koprodukcija	t	0.40	1.00
002b0000-5628-f08a-232f-71b5bd64b927	04	Srednja koprodukcija	t	0.70	2.00
002b0000-5628-f08a-0b85-74c7bc3b3bc1	05	Velika koprodukcija	t	1.00	3.00
\.


--
-- TOC entry 3078 (class 0 OID 23145655)
-- Dependencies: 203
-- Data for Name: tipvaje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipvaje (id, sifra, ime, opis) FROM stdin;
00420000-5628-f08a-07df-fa66ac830c27	0001	prva vaja	prva vaja
00420000-5628-f08a-d14e-dfc44c3a0700	0002	tehnična vaja	tehnična vaja
00420000-5628-f08a-0a95-906faca062ea	0003	lučna vaja	lučna vaja
00420000-5628-f08a-c40d-74efc5a3f790	0004	kostumska vaja	kostumska vaja
00420000-5628-f08a-999f-9759b434fb25	0005	foto vaja	foto vaja
00420000-5628-f08a-97d4-77e90f7140b7	0006	1. glavna vaja	1. glavna vaja
00420000-5628-f08a-eb45-d303ea973ab8	0007	2. glavna vaja	2. glavna vaja
00420000-5628-f08a-5ab9-2ef09a9d29ae	0008	1. generalka	1. generalka
00420000-5628-f08a-a4bd-44a1ef9bd356	0009	2. generalka	2. generalka
00420000-5628-f08a-d9cf-deacf8214eb4	0010	odprta generalka	odprta generalka
00420000-5628-f08a-4b89-cd57d450e481	0011	obnovitvena vaja	obnovitvena vaja
00420000-5628-f08a-a1c8-9ed3f1342e5a	0012	pevska vaja	pevska vaja
00420000-5628-f08a-445a-6251abf19076	0013	postavitev scene	postavitev scene (za pripravo vaje)
00420000-5628-f08a-5fb3-415b52e96748	0014	postavitev luči	postavitev luči (za pripravo vaje)
\.


--
-- TOC entry 3065 (class 0 OID 23145502)
-- Dependencies: 190
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 3050 (class 0 OID 23145328)
-- Dependencies: 175
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-5628-f08a-2cd5-eeeab1e2aa02	Konzolni	$2y$05$NS4xMjkyMTcwMzExMjAxROpKjBBm.wltshOYI4qwzOBeXejPEpKIK	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-5628-f08d-8658-d422981df186	testni uporabnik za inšpicienta	$2y$05$NS4xMjkyMTcwMzExMjAxROxkJ1B6xAXex6EZLIwJfWzRJ8DpfecFO	t	\N	\N	\N	ivo@ifigenija.si	\N	\N	\N
00010000-5628-f08d-8807-490b40bfa69c	testni uporabnik za Tehničnega vodjo	$2y$05$NS4xMjkyMTcwMzExMjAxROu/kXWR9sP9oamkesKuxXLbxkCb387.G	t	\N	\N	\N	tona@ifigenija.si	\N	\N	\N
00010000-5628-f08d-44ed-957a2b96d520	testni uporabnik za igralca	$2y$05$NS4xMjkyMTcwMzExMjAxRO/hLCgClfERRsfCAFYwxNCcFIVjP2982	t	\N	\N	\N	irena@ifigenija.si	\N	\N	\N
00010000-5628-f08d-d482-926fad8f2613	testni uporabnik vnašalca termina storitev (TerminStoritve-vse)	$2y$05$NS4xMjkyMTcwMzExMjAxROT6.kTHqEq4.wa2SOnf124/N14m9qeP.	t	\N	\N	\N	tatjana@ifigenija.si	\N	\N	\N
00010000-5628-f08d-cedd-f9cd0871809e	testni uporabnik, ki je inšpicient brez zapisov v TerminStoritve	$2y$05$NS4xMjkyMTcwMzExMjAxROHau47Dtb7CME5.nlWwBVM.nusFP.ra2	t	\N	\N	\N	joze@ifigenija.si	\N	\N	\N
00010000-5628-f08d-6860-1d01878b828b	testna uporabnica, ki je planerka	$2y$05$NS4xMjkyMTcwMzExMjAxRO.B/uJO3C7QRNhdX9Q2hTLQsSupj1V1S	t	\N	\N	\N	petra@ifigenija.si	\N	\N	\N
00010000-5628-f08d-711b-0e1fc1c1f021	testni uporabnik, ki dobi ifi-all vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROv2d7jqhaV/Mz3EIsKoi7UoFR.SDSMBm	t	\N	\N	\N	ali@ifigenija.si	\N	\N	\N
00010000-5628-f08d-79ec-281b338c55c4	testni uporabnik, ki dobi ifi-readall vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROYB9g.gnkufr1l/gWK6mkx.ySqrOWnJC	t	\N	\N	\N	berta@ifigenija.si	\N	\N	\N
00010000-5628-f08d-ccfb-599a627ca697	testni uporabnik, ki dobi aaa-write dovoljenje	$2y$05$NS4xMjkyMTcwMzExMjAxRORujYObKX.DzpXVYbePkiJkHqg0/Ylya	t	\N	\N	\N	aaron@ifigenija.si	\N	\N	\N
00010000-5628-f08d-8b97-f76968948dfd	testni uporabnik ki dobi vsa posamezna dovoljenja	$2y$05$NS4xMjkyMTcwMzExMjAxRO2ymwxVXTr7U4Ncdn.bN49E8rLw9Jg0O	t	\N	\N	\N	vesna@ifigenija.si	\N	\N	\N
00010000-5628-f08a-56c2-655722199f9b	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 3106 (class 0 OID 23145937)
-- Dependencies: 231
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, producent_id, sifra, faza, naslov, podnaslov, delovninaslov, internacionalninaslov, naslovizvirnika, podnaslovizvirnika, datumzacstudija, stevilovaj, planiranostevilovaj, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, krstna, prvaslovenska, kratkinaslov, jekoprodukcija, maticnioder_id) FROM stdin;
000e0000-5628-f08d-6b3e-f2ad9c5f8d6d	00160000-5628-f08c-0eb1-d2eb9606d0e1	\N	00140000-5628-f08a-bad0-cc059b24385d	\N	0001	produkcija	Sen kresne noči		Sanje	\N	\N	\N	2016-02-01	\N	\N	2016-06-01	1	William  Shakespeare - Nebojša  Kavader	f	2				\N	f	\N	\N		\N	00220000-5628-f08c-ff67-a7c7f1026a2b
000e0000-5628-f08d-bbd5-1e6e3efa9d6b	00160000-5628-f08c-daca-5241c7653c81	\N	00140000-5628-f08a-ab74-3e9b2938f7f4	\N	0002	predprodukcija-ideja	Smoletov vrt			\N	\N	\N	2016-01-01	\N	\N	2016-04-20	2	Berta   Hočevar	f	2				\N	f	\N	\N		\N	00220000-5628-f08c-7472-4b1169840d3f
000e0000-5628-f08d-5738-90c7c6c8045c	\N	\N	00140000-5628-f08a-ab74-3e9b2938f7f4	00190000-5628-f08d-34ca-de4127f863aa	0003	postprodukcija	Kisli maček			\N	\N	\N	2016-02-01	\N	\N	2016-04-20	2	\N	t	2				\N	f	\N	\N		\N	00220000-5628-f08c-ff67-a7c7f1026a2b
000e0000-5628-f08d-b899-f11c4c2d43cf	\N	\N	00140000-5628-f08a-ab74-3e9b2938f7f4	00190000-5628-f08d-34ca-de4127f863aa	0004	postprodukcija	Vladimir			\N	\N	\N	2017-03-01	\N	\N	2017-04-20	2	\N	t	2				\N	f	\N	\N		\N	00220000-5628-f08c-ff67-a7c7f1026a2b
000e0000-5628-f08d-c82f-82c5448d06db	\N	\N	00140000-5628-f08a-ab74-3e9b2938f7f4	00190000-5628-f08d-34ca-de4127f863aa	0005	postprodukcija	Španska princesa			\N	\N	\N	2017-04-01	\N	\N	2017-05-20	1	\N	f	1				\N	f	\N	\N		\N	00220000-5628-f08c-08d2-fe3da6c2382f
000e0000-5628-f08d-d890-d55c6e51be34	\N	\N	00140000-5628-f08a-ab74-3e9b2938f7f4	00190000-5628-f08d-34ca-de4127f863aa	0006	postprodukcija	Ne vemo datumov			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-5628-f08c-08d2-fe3da6c2382f
\.


--
-- TOC entry 3073 (class 0 OID 23145601)
-- Dependencies: 198
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, tipvaje_id, uprizoritev_id, zaporedna, porocilo) FROM stdin;
00200000-5628-f08d-35e2-ca49442714d4	\N	000e0000-5628-f08d-bbd5-1e6e3efa9d6b	1	
00200000-5628-f08d-9c8d-8b7b69bb2e05	\N	000e0000-5628-f08d-bbd5-1e6e3efa9d6b	2	
00200000-5628-f08d-83f2-4cf1adc42083	\N	000e0000-5628-f08d-bbd5-1e6e3efa9d6b	3	
00200000-5628-f08d-8b87-b004b54e9b3c	\N	000e0000-5628-f08d-bbd5-1e6e3efa9d6b	4	
00200000-5628-f08d-7391-b1a3d88d0848	\N	000e0000-5628-f08d-bbd5-1e6e3efa9d6b	5	
\.


--
-- TOC entry 3089 (class 0 OID 23145746)
-- Dependencies: 214
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 3100 (class 0 OID 23145860)
-- Dependencies: 225
-- Data for Name: vrstastroska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstastroska (id, skupina, podskupina, naziv, opis) FROM stdin;
003b0000-5628-f08a-223a-aa648c7a7810	1	0	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE
003b0000-5628-f08a-30d4-c2a0406934c2	1	1	Storitve varovanja zgradb in prostorov	storitve varovanja zgradb in prostorov (npr. gasilci na predstavah)
003b0000-5628-f08a-8a67-7a64127c14e5	1	2	Založniške in tiskarske storitve	založniške in tiskarske storitve
003b0000-5628-f08a-d9d6-aafba84afcec	1	3	Časopisi, revije, knjige in strokovna literatura	časopisi, revije, knjige in strokovna literatura
003b0000-5628-f08a-2a5a-291c4dce010b	1	4	Stroški prevajalskih storitev	stroški prevajalskih storitev
003b0000-5628-f08a-6e04-76bbd09a971d	1	5	Stroški oglaševalskih storitev	stroški oglaševalskih storitev
003b0000-5628-f08a-7b0f-dee9faf0fe95	1	6	Izdatki za reprezentanco	izdatki za reprezentanco
003b0000-5628-f08a-3fa0-d190f12d4cb4	2	0	POSEBNI MATERIAL IN STORITVE	POSEBNI MATERIAL IN STORITVE
003b0000-5628-f08a-7bf6-29e4633ef9eb	2	1	Drugi posebni material in storitve	drugi posebni material in storitve (npr. za instrumete - navedite)
003b0000-5628-f08a-075e-eba7530be075	2	2	Oprema predstave – stroški rekvizitov	Oprema predstave – stroški rekvizitov
003b0000-5628-f08a-dd94-d1a2b86faff4	2	3	Oprema predstave – stroški kostumov	Oprema predstave – stroški kostumov
003b0000-5628-f08a-937b-001c6f36aecc	2	4	Oprema predstave – stroški scenske opreme	Oprema predstave – stroški scenske opreme
003b0000-5628-f08a-bd43-6d6fea03624b	2	5	Oprema predstave – stroški avdio in video opreme	Oprema predstave – stroški avdio in video opreme
003b0000-5628-f08a-0068-36be3a019bc5	3	0	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE
003b0000-5628-f08a-fb63-4c5bb018a6eb	3	1	Poštnina in kurirske storitve	poštnina in kurirske storitve
003b0000-5628-f08a-6721-9ae92534386a	4	0	PREVOZNI STROŠKI IN STORITVE	PREVOZNI STROŠKI IN STORITVE
003b0000-5628-f08a-b70c-525ff75ade1e	4	1	Goriva in maziva za prevozna sredstva	goriva in maziva za prevozna sredstva
003b0000-5628-f08a-a4e1-0ae837032a54	4	2	Najem vozil in selitveni stroški	najem vozil in selitveni stroški
003b0000-5628-f08a-1f61-2e6b537c1ac8	4	3	Drugi prevozni in transportni stroški 	drugi prevozni in transportni stroški (navedite)
003b0000-5628-f08a-43db-328350154a85	5	0	IZDATKI ZA SLUŽBENA POTOVANJA	IZDATKI ZA SLUŽBENA POTOVANJA
003b0000-5628-f08a-4dcc-d6c058fc2df1	5	1	Dnevnice za službena potovanja v državi in tujini	dnevnice za službena potovanja v državi in tujini
003b0000-5628-f08a-681a-1007aadd09ba	5	2	Hotelske in restavra. storitve v državi in tujini	hotelske in restavra. storitve v državi in tujini
003b0000-5628-f08a-c337-681754035c53	5	3	Stroški prevoza v državi in tujini	stroški prevoza v državi in tujini
003b0000-5628-f08a-e764-9016917e8622	5	4	Drugi izdatki za službena potovanja	drugi izdatki za službena potovanja (navedite)
003b0000-5628-f08a-850c-d455c5394f5d	6	0	NAJEMNINE IN ZAKUPNINE	NAJEMNINE IN ZAKUPNINE
003b0000-5628-f08a-dd04-080a9a6760a6	6	1	Druge najemnine, zakupnine in licenčnine	druge najemnine, zakupnine in licenčnine (npr. najem notnega materiala, instrumentov - navedite)
003b0000-5628-f08a-3aee-4cfc110642ba	7	0	DRUGI OPERATIVNI ODHODKI	DRUGI OPERATIVNI ODHODKI
003b0000-5628-f08a-c667-bd5c0b842ba4	7	1	Izdatki za strok. izobraževanje zap.	izdatki za strok. izobraževanje zap.(vezani na program. enote)  
\.


--
-- TOC entry 3118 (class 0 OID 23146211)
-- Dependencies: 243
-- Data for Name: vrstazapisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstazapisa (id, oznaka, naziv, aktiven, znacka, ikona, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3117 (class 0 OID 23146183)
-- Dependencies: 242
-- Data for Name: zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapis (id, vrsta_id, datoteka_id, mapa_id, avtor_id, zaklenil_id, tip, zaklenjen, datumzaklepanja, identifier, subject, title, description, coverage, creator, language, date, publisher, relation, rights, source, upor, datknj, standard, lokacija) FROM stdin;
\.


--
-- TOC entry 3119 (class 0 OID 23146223)
-- Dependencies: 244
-- Data for Name: zapislastnik; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapislastnik (id, zapis_id, lastnik, classlastnika, datum, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3096 (class 0 OID 23145818)
-- Dependencies: 221
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, sifra, status, delovnomesto, zacetek, konec, tip, delovnaobveza, malica, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci, organizacijskaenota_id) FROM stdin;
00100000-5628-f08d-82b1-deabf23e82d9	00090000-5628-f08d-60ff-ff9d9b490c1a	0010	A	Mojster	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-5628-f08d-e6fc-68a433c046a0	00090000-5628-f08d-380d-af7310e90380	0003	A	Igralec	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-5628-f08d-6eca-d1f1c4990929	00090000-5628-f08d-62a2-9ade4a975483	0008	A	Natakar	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-5628-f08d-9eaa-50e510c9abcf	00090000-5628-f08d-330c-e8e52fae2aae	0004	A	Mizar	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-5628-f08d-766f-85e335b004fd	00090000-5628-f08d-8923-9109c2539471	0009	A	Šivilja	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-5628-f08d-265b-9a1bd1f08a29	00090000-5628-f08d-dc31-3d0e4c6cc523	0007	A	Inšpicient	2010-02-01	\N	1	2		t	f	f	t	\N
\.


--
-- TOC entry 3076 (class 0 OID 23145644)
-- Dependencies: 201
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id, oseba_id) FROM stdin;
\.


--
-- TOC entry 3105 (class 0 OID 23145927)
-- Dependencies: 230
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, sifra, naziv, opis) FROM stdin;
00140000-5628-f08a-bad0-cc059b24385d	01	Drama	drama (SURS 01)
00140000-5628-f08a-3f74-489494eac9c1	02	Opera	opera (SURS 02)
00140000-5628-f08a-45fd-ab3c66c5a930	03	Balet	balet (SURS 03)
00140000-5628-f08a-b92b-4a1c5c64846b	04	Plesne prireditve	plesne prireditve (SURS 04)
00140000-5628-f08a-8cb8-158cd5c5f644	05	Lutkovno gledališče	lutkovno gledališče (SURS 05)
00140000-5628-f08a-ab74-3e9b2938f7f4	06	Raziskovalno gledališče	raziskovalno gledališče (SURS 06)
00140000-5628-f08a-53bd-0468c4783166	07	Drugo	drugo (SURS 07)
\.


--
-- TOC entry 3095 (class 0 OID 23145808)
-- Dependencies: 220
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, sifra, naziv, opis) FROM stdin;
\.


--
-- TOC entry 2545 (class 2606 OID 23145382)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2761 (class 2606 OID 23145986)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2757 (class 2606 OID 23145976)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2720 (class 2606 OID 23145843)
-- Name: avtorbesedila_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT avtorbesedila_pkey PRIMARY KEY (id);


--
-- TOC entry 2731 (class 2606 OID 23145885)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2818 (class 2606 OID 23146263)
-- Name: datoteka_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT datoteka_pkey PRIMARY KEY (id);


--
-- TOC entry 2627 (class 2606 OID 23145633)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2642 (class 2606 OID 23145654)
-- Name: dogodeksplosni_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodeksplosni
    ADD CONSTRAINT dogodeksplosni_pkey PRIMARY KEY (id);


--
-- TOC entry 2794 (class 2606 OID 23146181)
-- Name: drugivir_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT drugivir_pkey PRIMARY KEY (id);


--
-- TOC entry 2590 (class 2606 OID 23145528)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2768 (class 2606 OID 23146054)
-- Name: enotaprograma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT enotaprograma_pkey PRIMARY KEY (id);


--
-- TOC entry 2704 (class 2606 OID 23145804)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2618 (class 2606 OID 23145599)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2607 (class 2606 OID 23145566)
-- Name: job_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY job
    ADD CONSTRAINT job_pkey PRIMARY KEY (id);


--
-- TOC entry 2598 (class 2606 OID 23145542)
-- Name: kontaktnaoseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT kontaktnaoseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2668 (class 2606 OID 23145711)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2812 (class 2606 OID 23146240)
-- Name: mapa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT mapa_pkey PRIMARY KEY (id);


--
-- TOC entry 2816 (class 2606 OID 23146247)
-- Name: mapa_zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT mapa_zapis_pkey PRIMARY KEY (mapa_id, zapis_id);


--
-- TOC entry 2823 (class 2606 OID 23146271)
-- Name: mapaacl_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT mapaacl_pkey PRIMARY KEY (id);


--
-- TOC entry 2680 (class 2606 OID 23145738)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2583 (class 2606 OID 23145500)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2553 (class 2606 OID 23145401)
-- Name: optionvalue_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT optionvalue_pkey PRIMARY KEY (id);


--
-- TOC entry 2572 (class 2606 OID 23145462)
-- Name: organizacijskaenota_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT organizacijskaenota_pkey PRIMARY KEY (id);


--
-- TOC entry 2556 (class 2606 OID 23145425)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2543 (class 2606 OID 23145371)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2536 (class 2606 OID 23145356)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2683 (class 2606 OID 23145744)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2697 (class 2606 OID 23145780)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2743 (class 2606 OID 23145922)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2566 (class 2606 OID 23145453)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2580 (class 2606 OID 23145488)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2778 (class 2606 OID 23146133)
-- Name: postavkacdve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkacdve
    ADD CONSTRAINT postavkacdve_pkey PRIMARY KEY (id);


--
-- TOC entry 2672 (class 2606 OID 23145717)
-- Name: postavkaracuna_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT postavkaracuna_pkey PRIMARY KEY (id);


--
-- TOC entry 2578 (class 2606 OID 23145478)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2625 (class 2606 OID 23145618)
-- Name: praznik_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY praznik
    ADD CONSTRAINT praznik_pkey PRIMARY KEY (id);


--
-- TOC entry 2616 (class 2606 OID 23145587)
-- Name: predstava_abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava_abonma
    ADD CONSTRAINT predstava_abonma_pkey PRIMARY KEY (predstava_id, abonma_id);


--
-- TOC entry 2612 (class 2606 OID 23145579)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2678 (class 2606 OID 23145729)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2782 (class 2606 OID 23146142)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2784 (class 2606 OID 23146150)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2775 (class 2606 OID 23146120)
-- Name: programdela_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT programdela_pkey PRIMARY KEY (id);


--
-- TOC entry 2789 (class 2606 OID 23146162)
-- Name: programskaenotasklopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT programskaenotasklopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2690 (class 2606 OID 23145762)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2666 (class 2606 OID 23145702)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2660 (class 2606 OID 23145693)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2738 (class 2606 OID 23145909)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2718 (class 2606 OID 23145836)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2601 (class 2606 OID 23145554)
-- Name: report_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY report
    ADD CONSTRAINT report_pkey PRIMARY KEY (id);


--
-- TOC entry 2528 (class 2606 OID 23145327)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2695 (class 2606 OID 23145771)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2534 (class 2606 OID 23145345)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2538 (class 2606 OID 23145365)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2702 (class 2606 OID 23145789)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2674 (class 2606 OID 23145724)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2648 (class 2606 OID 23145673)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2525 (class 2606 OID 23145315)
-- Name: stevilcenje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenje
    ADD CONSTRAINT stevilcenje_pkey PRIMARY KEY (id);


--
-- TOC entry 2522 (class 2606 OID 23145303)
-- Name: stevilcenjekonfig_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT stevilcenjekonfig_pkey PRIMARY KEY (id);


--
-- TOC entry 2519 (class 2606 OID 23145297)
-- Name: stevilcenjestanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjestanje
    ADD CONSTRAINT stevilcenjestanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2727 (class 2606 OID 23145856)
-- Name: strosekuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT strosekuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2562 (class 2606 OID 23145434)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2654 (class 2606 OID 23145684)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2734 (class 2606 OID 23145896)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2547 (class 2606 OID 23145390)
-- Name: tippopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tippopa
    ADD CONSTRAINT tippopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2791 (class 2606 OID 23146174)
-- Name: tipprogramskeenote_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipprogramskeenote
    ADD CONSTRAINT tipprogramskeenote_pkey PRIMARY KEY (id);


--
-- TOC entry 2644 (class 2606 OID 23145662)
-- Name: tipvaje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipvaje
    ADD CONSTRAINT tipvaje_pkey PRIMARY KEY (id);


--
-- TOC entry 2588 (class 2606 OID 23145513)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2530 (class 2606 OID 23145340)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2755 (class 2606 OID 23145955)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2623 (class 2606 OID 23145608)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2686 (class 2606 OID 23145752)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2729 (class 2606 OID 23145868)
-- Name: vrstastroska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstastroska
    ADD CONSTRAINT vrstastroska_pkey PRIMARY KEY (id);


--
-- TOC entry 2805 (class 2606 OID 23146221)
-- Name: vrstazapisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstazapisa
    ADD CONSTRAINT vrstazapisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2802 (class 2606 OID 23146205)
-- Name: zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT zapis_pkey PRIMARY KEY (id);


--
-- TOC entry 2808 (class 2606 OID 23146229)
-- Name: zapislastnik_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT zapislastnik_pkey PRIMARY KEY (id);


--
-- TOC entry 2714 (class 2606 OID 23145826)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2640 (class 2606 OID 23145648)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2747 (class 2606 OID 23145935)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2710 (class 2606 OID 23145816)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2628 (class 1259 OID 23145642)
-- Name: dogodki_konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_konec ON dogodek USING btree (konec);


--
-- TOC entry 2629 (class 1259 OID 23145643)
-- Name: dogodki_razred; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_razred ON dogodek USING btree (razred);


--
-- TOC entry 2630 (class 1259 OID 23145641)
-- Name: dogodki_zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2631 (class 1259 OID 23145640)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2632 (class 1259 OID 23145639)
-- Name: idx_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2723 (class 1259 OID 23145857)
-- Name: idx_11ffe6e05c75296c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e05c75296c ON strosekuprizoritve USING btree (vrstastroska_id);


--
-- TOC entry 2724 (class 1259 OID 23145858)
-- Name: idx_11ffe6e062b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e062b4ffca ON strosekuprizoritve USING btree (uprizoritev_id);


--
-- TOC entry 2725 (class 1259 OID 23145859)
-- Name: idx_11ffe6e06beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e06beede51 ON strosekuprizoritve USING btree (popa_id);


--
-- TOC entry 2809 (class 1259 OID 23146242)
-- Name: idx_14a5d6d3727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d3727aca70 ON mapa USING btree (parent_id);


--
-- TOC entry 2810 (class 1259 OID 23146241)
-- Name: idx_14a5d6d38a4a6c12; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d38a4a6c12 ON mapa USING btree (lastnik_id);


--
-- TOC entry 2563 (class 1259 OID 23145455)
-- Name: idx_1c7adba589552cb2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba589552cb2 ON popa USING btree (tipkli_id);


--
-- TOC entry 2564 (class 1259 OID 23145456)
-- Name: idx_1c7adba5ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba5ee4b985a ON popa USING btree (drzava_id);


--
-- TOC entry 2681 (class 1259 OID 23145745)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2796 (class 1259 OID 23146209)
-- Name: idx_1ed92829253c4123; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829253c4123 ON zapis USING btree (avtor_id);


--
-- TOC entry 2797 (class 1259 OID 23146208)
-- Name: idx_1ed9282957ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282957ed422f ON zapis USING btree (mapa_id);


--
-- TOC entry 2798 (class 1259 OID 23146210)
-- Name: idx_1ed9282987ff3295; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282987ff3295 ON zapis USING btree (zaklenil_id);


--
-- TOC entry 2799 (class 1259 OID 23146207)
-- Name: idx_1ed92829a54dbb1f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829a54dbb1f ON zapis USING btree (datoteka_id);


--
-- TOC entry 2800 (class 1259 OID 23146206)
-- Name: idx_1ed92829ef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829ef943358 ON zapis USING btree (vrsta_id);


--
-- TOC entry 2675 (class 1259 OID 23145731)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2676 (class 1259 OID 23145730)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2620 (class 1259 OID 23145609)
-- Name: idx_2390fc964ad2a6ea; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc964ad2a6ea ON vaja USING btree (tipvaje_id);


--
-- TOC entry 2621 (class 1259 OID 23145610)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2705 (class 1259 OID 23145805)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2706 (class 1259 OID 23145807)
-- Name: idx_23aeb9586b361365; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9586b361365 ON funkcija USING btree (tipfunkcije_id);


--
-- TOC entry 2707 (class 1259 OID 23145806)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2595 (class 1259 OID 23145544)
-- Name: idx_2942b10710389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b10710389148 ON kontaktnaoseba USING btree (oseba_id);


--
-- TOC entry 2596 (class 1259 OID 23145543)
-- Name: idx_2942b1076beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b1076beede51 ON kontaktnaoseba USING btree (popa_id);


--
-- TOC entry 2787 (class 1259 OID 23146163)
-- Name: idx_2d901816d6bc69d6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2d901816d6bc69d6 ON programskaenotasklopa USING btree (programrazno_id);


--
-- TOC entry 2739 (class 1259 OID 23145924)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2740 (class 1259 OID 23145925)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2741 (class 1259 OID 23145926)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2806 (class 1259 OID 23146230)
-- Name: idx_2eaff9dcaf91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2eaff9dcaf91ecd ON zapislastnik USING btree (zapis_id);


--
-- TOC entry 2748 (class 1259 OID 23145960)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2749 (class 1259 OID 23145957)
-- Name: idx_344a77a7c3b0d59; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a7c3b0d59 ON uprizoritev USING btree (maticnioder_id);


--
-- TOC entry 2750 (class 1259 OID 23145961)
-- Name: idx_344a77a853a965c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a853a965c ON uprizoritev USING btree (producent_id);


--
-- TOC entry 2751 (class 1259 OID 23145959)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2752 (class 1259 OID 23145958)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2585 (class 1259 OID 23145515)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2586 (class 1259 OID 23145514)
-- Name: idx_37f6541a6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a6beede51 ON trr USING btree (popa_id);


--
-- TOC entry 2554 (class 1259 OID 23145428)
-- Name: idx_466966d769e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_466966d769e8d4 ON oseba USING btree (naslov_id);


--
-- TOC entry 2693 (class 1259 OID 23145772)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2540 (class 1259 OID 23145372)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2541 (class 1259 OID 23145373)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2698 (class 1259 OID 23145792)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2699 (class 1259 OID 23145791)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2700 (class 1259 OID 23145790)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2568 (class 1259 OID 23145465)
-- Name: idx_5e2fdc29289ed596; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29289ed596 ON organizacijskaenota USING btree (vodja_id);


--
-- TOC entry 2569 (class 1259 OID 23145464)
-- Name: idx_5e2fdc29727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29727aca70 ON organizacijskaenota USING btree (parent_id);


--
-- TOC entry 2570 (class 1259 OID 23145466)
-- Name: idx_5e2fdc29f0020ed7; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29f0020ed7 ON organizacijskaenota USING btree (namestnik_id);


--
-- TOC entry 2608 (class 1259 OID 23145582)
-- Name: idx_602f6e461174bb0e; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e461174bb0e ON predstava USING btree (dezurni_id);


--
-- TOC entry 2609 (class 1259 OID 23145580)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2610 (class 1259 OID 23145581)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2520 (class 1259 OID 23145305)
-- Name: idx_6054e804ff55f926; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_6054e804ff55f926 ON stevilcenjekonfig USING btree (stevilcenje_id);


--
-- TOC entry 2655 (class 1259 OID 23145697)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2656 (class 1259 OID 23145695)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2657 (class 1259 OID 23145694)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2658 (class 1259 OID 23145696)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2531 (class 1259 OID 23145346)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2532 (class 1259 OID 23145347)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2684 (class 1259 OID 23145753)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2819 (class 1259 OID 23146264)
-- Name: idx_781826c67e3c61f9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_781826c67e3c61f9 ON datoteka USING btree (owner_id);


--
-- TOC entry 2721 (class 1259 OID 23145845)
-- Name: idx_7ab77b7910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7ab77b7910389148 ON avtorbesedila USING btree (oseba_id);


--
-- TOC entry 2722 (class 1259 OID 23145844)
-- Name: idx_7ab77b79f35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7ab77b79f35157b1 ON avtorbesedila USING btree (besedilo_id);


--
-- TOC entry 2820 (class 1259 OID 23146272)
-- Name: idx_7adc957157ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc957157ed422f ON mapaacl USING btree (mapa_id);


--
-- TOC entry 2821 (class 1259 OID 23146273)
-- Name: idx_7adc9571fa6311ef; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc9571fa6311ef ON mapaacl USING btree (perm_id);


--
-- TOC entry 2670 (class 1259 OID 23145718)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2715 (class 1259 OID 23145837)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2716 (class 1259 OID 23145838)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2769 (class 1259 OID 23146059)
-- Name: idx_8787a0e54ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e54ae1cd1c ON enotaprograma USING btree (gostitelj_id);


--
-- TOC entry 2770 (class 1259 OID 23146058)
-- Name: idx_8787a0e55d0da56c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e55d0da56c ON enotaprograma USING btree (drzavagostovanja_id);


--
-- TOC entry 2771 (class 1259 OID 23146055)
-- Name: idx_8787a0e562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e562b4ffca ON enotaprograma USING btree (uprizoritev_id);


--
-- TOC entry 2772 (class 1259 OID 23146056)
-- Name: idx_8787a0e57222d84b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e57222d84b ON enotaprograma USING btree (tipprogramskeenote_id);


--
-- TOC entry 2773 (class 1259 OID 23146057)
-- Name: idx_8787a0e5771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e5771ec7bd ON enotaprograma USING btree (program_dela_id);


--
-- TOC entry 2574 (class 1259 OID 23145480)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2575 (class 1259 OID 23145479)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2576 (class 1259 OID 23145481)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2687 (class 1259 OID 23145766)
-- Name: idx_952dd21969e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd21969e8d4 ON prostor USING btree (naslov_id);


--
-- TOC entry 2688 (class 1259 OID 23145765)
-- Name: idx_952dd2196beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd2196beede51 ON prostor USING btree (popa_id);


--
-- TOC entry 2779 (class 1259 OID 23146143)
-- Name: idx_97af082e38c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e38c06eb ON produkcijadelitev USING btree (enotaprograma_id);


--
-- TOC entry 2780 (class 1259 OID 23146144)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2762 (class 1259 OID 23145990)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2763 (class 1259 OID 23145991)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2764 (class 1259 OID 23145988)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2765 (class 1259 OID 23145989)
-- Name: idx_a4b7244fa4976613; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fa4976613 ON alternacija USING btree (zaposlitev_id);


--
-- TOC entry 2711 (class 1259 OID 23145827)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2712 (class 1259 OID 23145828)
-- Name: idx_b24490415f1e9d88; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b24490415f1e9d88 ON zaposlitev USING btree (organizacijskaenota_id);


--
-- TOC entry 2661 (class 1259 OID 23145706)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2662 (class 1259 OID 23145705)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2663 (class 1259 OID 23145703)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2664 (class 1259 OID 23145704)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2758 (class 1259 OID 23145978)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2759 (class 1259 OID 23145977)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2599 (class 1259 OID 23145555)
-- Name: idx_c38372b2be04ea9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c38372b2be04ea9 ON report USING btree (job_id);


--
-- TOC entry 2602 (class 1259 OID 23145569)
-- Name: idx_c395a6181bb9e62c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a6181bb9e62c ON job USING btree (datum);


--
-- TOC entry 2603 (class 1259 OID 23145568)
-- Name: idx_c395a618941027cc; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618941027cc ON job USING btree (casizvedbe);


--
-- TOC entry 2604 (class 1259 OID 23145567)
-- Name: idx_c395a618a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618a76ed395 ON job USING btree (user_id);


--
-- TOC entry 2605 (class 1259 OID 23145570)
-- Name: idx_c395a618aecf5af0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618aecf5af0 ON job USING btree (izveden);


--
-- TOC entry 2619 (class 1259 OID 23145600)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2613 (class 1259 OID 23145588)
-- Name: idx_d9ece16b5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_d9ece16b5ac894aa ON predstava_abonma USING btree (predstava_id);


--
-- TOC entry 2614 (class 1259 OID 23145589)
-- Name: idx_d9ece16bbe74b11; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_d9ece16bbe74b11 ON predstava_abonma USING btree (abonma_id);


--
-- TOC entry 2776 (class 1259 OID 23146134)
-- Name: idx_dba42fe79e3adf2c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_dba42fe79e3adf2c ON postavkacdve USING btree (programdela_id);


--
-- TOC entry 2795 (class 1259 OID 23146182)
-- Name: idx_e7d4cf2638c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e7d4cf2638c06eb ON drugivir USING btree (enotaprograma_id);


--
-- TOC entry 2813 (class 1259 OID 23146248)
-- Name: idx_e9f8ee8257ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee8257ed422f ON mapa_zapis USING btree (mapa_id);


--
-- TOC entry 2814 (class 1259 OID 23146249)
-- Name: idx_e9f8ee82af91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee82af91ecd ON mapa_zapis USING btree (zapis_id);


--
-- TOC entry 2550 (class 1259 OID 23145403)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2551 (class 1259 OID 23145402)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2559 (class 1259 OID 23145435)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2560 (class 1259 OID 23145436)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2638 (class 1259 OID 23145649)
-- Name: idx_f44a386d10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_f44a386d10389148 ON zasedenost USING btree (oseba_id);


--
-- TOC entry 2650 (class 1259 OID 23145687)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2651 (class 1259 OID 23145686)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2652 (class 1259 OID 23145685)
-- Name: idx_fef7d84ba81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84ba81ccef6 ON terminstoritve USING btree (dogodek_id);


--
-- TOC entry 2633 (class 1259 OID 23145635)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2634 (class 1259 OID 23145636)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2635 (class 1259 OID 23145634)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2636 (class 1259 OID 23145638)
-- Name: uniq_11e93b5dbbc7a989; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dbbc7a989 ON dogodek USING btree (dogodek_splosni_id);


--
-- TOC entry 2637 (class 1259 OID 23145637)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2567 (class 1259 OID 23145454)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2548 (class 1259 OID 23145391)
-- Name: uniq_1d30700559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1d30700559828a3 ON tippopa USING btree (sifra);


--
-- TOC entry 2549 (class 1259 OID 23145392)
-- Name: uniq_1d3070055cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1d3070055cca980 ON tippopa USING btree (ime);


--
-- TOC entry 2591 (class 1259 OID 23145529)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2592 (class 1259 OID 23145531)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2593 (class 1259 OID 23145530)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2594 (class 1259 OID 23145532)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2669 (class 1259 OID 23145712)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2744 (class 1259 OID 23145923)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2753 (class 1259 OID 23145956)
-- Name: uniq_344a77a559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_344a77a559828a3 ON uprizoritev USING btree (sifra);


--
-- TOC entry 2735 (class 1259 OID 23145897)
-- Name: uniq_3f50510d559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d559828a3 ON tipfunkcije USING btree (sifra);


--
-- TOC entry 2736 (class 1259 OID 23145898)
-- Name: uniq_3f50510d55cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d55cca980 ON tipfunkcije USING btree (ime);


--
-- TOC entry 2557 (class 1259 OID 23145426)
-- Name: uniq_466966d7559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7559828a3 ON oseba USING btree (sifra);


--
-- TOC entry 2558 (class 1259 OID 23145427)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2708 (class 1259 OID 23145817)
-- Name: uniq_5216fcb0559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5216fcb0559828a3 ON zvrstuprizoritve USING btree (sifra);


--
-- TOC entry 2526 (class 1259 OID 23145316)
-- Name: uniq_5a434fbc559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5a434fbc559828a3 ON stevilcenje USING btree (sifra);


--
-- TOC entry 2584 (class 1259 OID 23145501)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2573 (class 1259 OID 23145463)
-- Name: uniq_5e2fdc29559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5e2fdc29559828a3 ON organizacijskaenota USING btree (sifra);


--
-- TOC entry 2523 (class 1259 OID 23145304)
-- Name: uniq_6054e804889a7556; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_6054e804889a7556 ON stevilcenjekonfig USING btree (dok);


--
-- TOC entry 2792 (class 1259 OID 23146175)
-- Name: uniq_7d834df4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_7d834df4559828a3 ON tipprogramskeenote USING btree (sifra);


--
-- TOC entry 2691 (class 1259 OID 23145764)
-- Name: uniq_952dd21937854736; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21937854736 ON prostor USING btree (naziv);


--
-- TOC entry 2692 (class 1259 OID 23145763)
-- Name: uniq_952dd219559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd219559828a3 ON prostor USING btree (sifra);


--
-- TOC entry 2645 (class 1259 OID 23145663)
-- Name: uniq_99664b14559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_99664b14559828a3 ON tipvaje USING btree (sifra);


--
-- TOC entry 2646 (class 1259 OID 23145664)
-- Name: uniq_99664b1455cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_99664b1455cca980 ON tipvaje USING btree (ime);


--
-- TOC entry 2766 (class 1259 OID 23145987)
-- Name: uniq_a4b7244f559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a4b7244f559828a3 ON alternacija USING btree (sifra);


--
-- TOC entry 2581 (class 1259 OID 23145489)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2745 (class 1259 OID 23145936)
-- Name: uniq_cede8e36559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_cede8e36559828a3 ON zvrstsurs USING btree (sifra);


--
-- TOC entry 2803 (class 1259 OID 23146222)
-- Name: uniq_de1c8aa1d55226c7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_de1c8aa1d55226c7 ON vrstazapisa USING btree (oznaka);


--
-- TOC entry 2785 (class 1259 OID 23146151)
-- Name: uniq_e6fc2028559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc2028559828a3 ON produkcijskahisa USING btree (sifra);


--
-- TOC entry 2786 (class 1259 OID 23146152)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2732 (class 1259 OID 23145886)
-- Name: uniq_ec773670ca2e5fcb; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ec773670ca2e5fcb ON besedilo USING btree (stevilka);


--
-- TOC entry 2649 (class 1259 OID 23145674)
-- Name: uniq_ecc8f8c5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ecc8f8c5559828a3 ON sezona USING btree (sifra);


--
-- TOC entry 2539 (class 1259 OID 23145366)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2862 (class 2606 OID 23146444)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2861 (class 2606 OID 23146449)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2857 (class 2606 OID 23146469)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2863 (class 2606 OID 23146439)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2859 (class 2606 OID 23146459)
-- Name: fk_11e93b5dbbc7a989; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dbbc7a989 FOREIGN KEY (dogodek_splosni_id) REFERENCES dogodeksplosni(id);


--
-- TOC entry 2858 (class 2606 OID 23146464)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2860 (class 2606 OID 23146454)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2899 (class 2606 OID 23146639)
-- Name: fk_11ffe6e05c75296c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e05c75296c FOREIGN KEY (vrstastroska_id) REFERENCES vrstastroska(id);


--
-- TOC entry 2898 (class 2606 OID 23146644)
-- Name: fk_11ffe6e062b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e062b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2897 (class 2606 OID 23146649)
-- Name: fk_11ffe6e06beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e06beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2931 (class 2606 OID 23146814)
-- Name: fk_14a5d6d3727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d3727aca70 FOREIGN KEY (parent_id) REFERENCES mapa(id);


--
-- TOC entry 2932 (class 2606 OID 23146809)
-- Name: fk_14a5d6d38a4a6c12; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d38a4a6c12 FOREIGN KEY (lastnik_id) REFERENCES uporabniki(id);


--
-- TOC entry 2836 (class 2606 OID 23146329)
-- Name: fk_1c7adba589552cb2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba589552cb2 FOREIGN KEY (tipkli_id) REFERENCES tippopa(id);


--
-- TOC entry 2835 (class 2606 OID 23146334)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2880 (class 2606 OID 23146554)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2926 (class 2606 OID 23146794)
-- Name: fk_1ed92829253c4123; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829253c4123 FOREIGN KEY (avtor_id) REFERENCES uporabniki(id);


--
-- TOC entry 2927 (class 2606 OID 23146789)
-- Name: fk_1ed9282957ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282957ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2925 (class 2606 OID 23146799)
-- Name: fk_1ed9282987ff3295; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282987ff3295 FOREIGN KEY (zaklenil_id) REFERENCES uporabniki(id);


--
-- TOC entry 2928 (class 2606 OID 23146784)
-- Name: fk_1ed92829a54dbb1f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829a54dbb1f FOREIGN KEY (datoteka_id) REFERENCES datoteka(id);


--
-- TOC entry 2929 (class 2606 OID 23146779)
-- Name: fk_1ed92829ef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829ef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstazapisa(id);


--
-- TOC entry 2878 (class 2606 OID 23146549)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2879 (class 2606 OID 23146544)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2856 (class 2606 OID 23146429)
-- Name: fk_2390fc964ad2a6ea; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc964ad2a6ea FOREIGN KEY (tipvaje_id) REFERENCES tipvaje(id);


--
-- TOC entry 2855 (class 2606 OID 23146434)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2890 (class 2606 OID 23146594)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2888 (class 2606 OID 23146604)
-- Name: fk_23aeb9586b361365; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9586b361365 FOREIGN KEY (tipfunkcije_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2889 (class 2606 OID 23146599)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2845 (class 2606 OID 23146384)
-- Name: fk_2942b10710389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b10710389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2846 (class 2606 OID 23146379)
-- Name: fk_2942b1076beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b1076beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2876 (class 2606 OID 23146534)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2923 (class 2606 OID 23146769)
-- Name: fk_2d901816d6bc69d6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT fk_2d901816d6bc69d6 FOREIGN KEY (programrazno_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2902 (class 2606 OID 23146654)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2901 (class 2606 OID 23146659)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2900 (class 2606 OID 23146664)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 2930 (class 2606 OID 23146804)
-- Name: fk_2eaff9dcaf91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT fk_2eaff9dcaf91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id);


--
-- TOC entry 2904 (class 2606 OID 23146684)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2907 (class 2606 OID 23146669)
-- Name: fk_344a77a7c3b0d59; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a7c3b0d59 FOREIGN KEY (maticnioder_id) REFERENCES prostor(id);


--
-- TOC entry 2903 (class 2606 OID 23146689)
-- Name: fk_344a77a853a965c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a853a965c FOREIGN KEY (producent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2905 (class 2606 OID 23146679)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2906 (class 2606 OID 23146674)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2843 (class 2606 OID 23146374)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2844 (class 2606 OID 23146369)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2831 (class 2606 OID 23146314)
-- Name: fk_466966d769e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d769e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2832 (class 2606 OID 23146309)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2884 (class 2606 OID 23146574)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2828 (class 2606 OID 23146289)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2827 (class 2606 OID 23146294)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2885 (class 2606 OID 23146589)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2886 (class 2606 OID 23146584)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2887 (class 2606 OID 23146579)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2838 (class 2606 OID 23146344)
-- Name: fk_5e2fdc29289ed596; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29289ed596 FOREIGN KEY (vodja_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2839 (class 2606 OID 23146339)
-- Name: fk_5e2fdc29727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29727aca70 FOREIGN KEY (parent_id) REFERENCES organizacijskaenota(id);


--
-- TOC entry 2837 (class 2606 OID 23146349)
-- Name: fk_5e2fdc29f0020ed7; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29f0020ed7 FOREIGN KEY (namestnik_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2849 (class 2606 OID 23146409)
-- Name: fk_602f6e461174bb0e; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e461174bb0e FOREIGN KEY (dezurni_id) REFERENCES oseba(id);


--
-- TOC entry 2851 (class 2606 OID 23146399)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2850 (class 2606 OID 23146404)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2824 (class 2606 OID 23146274)
-- Name: fk_6054e804ff55f926; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT fk_6054e804ff55f926 FOREIGN KEY (stevilcenje_id) REFERENCES stevilcenje(id);


--
-- TOC entry 2868 (class 2606 OID 23146509)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2870 (class 2606 OID 23146499)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2871 (class 2606 OID 23146494)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2869 (class 2606 OID 23146504)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2826 (class 2606 OID 23146279)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2825 (class 2606 OID 23146284)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2881 (class 2606 OID 23146559)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2935 (class 2606 OID 23146829)
-- Name: fk_781826c67e3c61f9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT fk_781826c67e3c61f9 FOREIGN KEY (owner_id) REFERENCES uporabniki(id);


--
-- TOC entry 2895 (class 2606 OID 23146634)
-- Name: fk_7ab77b7910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT fk_7ab77b7910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2896 (class 2606 OID 23146629)
-- Name: fk_7ab77b79f35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT fk_7ab77b79f35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2937 (class 2606 OID 23146834)
-- Name: fk_7adc957157ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc957157ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2936 (class 2606 OID 23146839)
-- Name: fk_7adc9571fa6311ef; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc9571fa6311ef FOREIGN KEY (perm_id) REFERENCES permission(id);


--
-- TOC entry 2877 (class 2606 OID 23146539)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2894 (class 2606 OID 23146619)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2893 (class 2606 OID 23146624)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2914 (class 2606 OID 23146744)
-- Name: fk_8787a0e54ae1cd1c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e54ae1cd1c FOREIGN KEY (gostitelj_id) REFERENCES popa(id);


--
-- TOC entry 2915 (class 2606 OID 23146739)
-- Name: fk_8787a0e55d0da56c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e55d0da56c FOREIGN KEY (drzavagostovanja_id) REFERENCES drza(id);


--
-- TOC entry 2918 (class 2606 OID 23146724)
-- Name: fk_8787a0e562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2917 (class 2606 OID 23146729)
-- Name: fk_8787a0e57222d84b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e57222d84b FOREIGN KEY (tipprogramskeenote_id) REFERENCES tipprogramskeenote(id);


--
-- TOC entry 2916 (class 2606 OID 23146734)
-- Name: fk_8787a0e5771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e5771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2841 (class 2606 OID 23146359)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2842 (class 2606 OID 23146354)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2840 (class 2606 OID 23146364)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2882 (class 2606 OID 23146569)
-- Name: fk_952dd21969e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd21969e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2883 (class 2606 OID 23146564)
-- Name: fk_952dd2196beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd2196beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2921 (class 2606 OID 23146754)
-- Name: fk_97af082e38c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e38c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2920 (class 2606 OID 23146759)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2911 (class 2606 OID 23146714)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2910 (class 2606 OID 23146719)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2913 (class 2606 OID 23146704)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 2912 (class 2606 OID 23146709)
-- Name: fk_a4b7244fa4976613; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fa4976613 FOREIGN KEY (zaposlitev_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2892 (class 2606 OID 23146609)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2891 (class 2606 OID 23146614)
-- Name: fk_b24490415f1e9d88; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b24490415f1e9d88 FOREIGN KEY (organizacijskaenota_id) REFERENCES organizacijskaenota(id);


--
-- TOC entry 2872 (class 2606 OID 23146529)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2873 (class 2606 OID 23146524)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2875 (class 2606 OID 23146514)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2874 (class 2606 OID 23146519)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2908 (class 2606 OID 23146699)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2909 (class 2606 OID 23146694)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2847 (class 2606 OID 23146389)
-- Name: fk_c38372b2be04ea9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY report
    ADD CONSTRAINT fk_c38372b2be04ea9 FOREIGN KEY (job_id) REFERENCES job(id);


--
-- TOC entry 2848 (class 2606 OID 23146394)
-- Name: fk_c395a618a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY job
    ADD CONSTRAINT fk_c395a618a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2854 (class 2606 OID 23146424)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2853 (class 2606 OID 23146414)
-- Name: fk_d9ece16b5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava_abonma
    ADD CONSTRAINT fk_d9ece16b5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id) ON DELETE CASCADE;


--
-- TOC entry 2852 (class 2606 OID 23146419)
-- Name: fk_d9ece16bbe74b11; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava_abonma
    ADD CONSTRAINT fk_d9ece16bbe74b11 FOREIGN KEY (abonma_id) REFERENCES abonma(id) ON DELETE CASCADE;


--
-- TOC entry 2919 (class 2606 OID 23146749)
-- Name: fk_dba42fe79e3adf2c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkacdve
    ADD CONSTRAINT fk_dba42fe79e3adf2c FOREIGN KEY (programdela_id) REFERENCES programdela(id);


--
-- TOC entry 2922 (class 2606 OID 23146764)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2924 (class 2606 OID 23146774)
-- Name: fk_e7d4cf2638c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT fk_e7d4cf2638c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2934 (class 2606 OID 23146819)
-- Name: fk_e9f8ee8257ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee8257ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id) ON DELETE CASCADE;


--
-- TOC entry 2933 (class 2606 OID 23146824)
-- Name: fk_e9f8ee82af91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee82af91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id) ON DELETE CASCADE;


--
-- TOC entry 2829 (class 2606 OID 23146304)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2830 (class 2606 OID 23146299)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2834 (class 2606 OID 23146319)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2833 (class 2606 OID 23146324)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2864 (class 2606 OID 23146474)
-- Name: fk_f44a386d10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT fk_f44a386d10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2865 (class 2606 OID 23146489)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2866 (class 2606 OID 23146484)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2867 (class 2606 OID 23146479)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- Completed on 2015-10-22 16:20:00 CEST

--
-- PostgreSQL database dump complete
--

