--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.10
-- Dumped by pg_dump version 9.3.10
-- Started on 2015-10-27 12:41:30 CET

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
-- TOC entry 3133 (class 0 OID 0)
-- Dependencies: 249
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_with_oids = false;

--
-- TOC entry 180 (class 1259 OID 23507622)
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
-- TOC entry 233 (class 1259 OID 23508230)
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
-- TOC entry 232 (class 1259 OID 23508213)
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
-- TOC entry 223 (class 1259 OID 23508090)
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
-- TOC entry 226 (class 1259 OID 23508120)
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
-- TOC entry 247 (class 1259 OID 23508501)
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
-- TOC entry 200 (class 1259 OID 23507870)
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
-- TOC entry 202 (class 1259 OID 23507901)
-- Name: dogodeksplosni; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodeksplosni (
    id uuid NOT NULL
);


--
-- TOC entry 241 (class 1259 OID 23508427)
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
-- TOC entry 191 (class 1259 OID 23507767)
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
-- TOC entry 234 (class 1259 OID 23508243)
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
-- TOC entry 219 (class 1259 OID 23508044)
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
-- TOC entry 197 (class 1259 OID 23507841)
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
-- TOC entry 194 (class 1259 OID 23507807)
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
-- TOC entry 3134 (class 0 OID 0)
-- Dependencies: 194
-- Name: COLUMN job.data; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN job.data IS '(DC2Type:object)';


--
-- TOC entry 192 (class 1259 OID 23507784)
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
-- TOC entry 208 (class 1259 OID 23507958)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 245 (class 1259 OID 23508482)
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
-- TOC entry 246 (class 1259 OID 23508494)
-- Name: mapa_zapis; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE mapa_zapis (
    mapa_id uuid NOT NULL,
    zapis_id uuid NOT NULL
);


--
-- TOC entry 248 (class 1259 OID 23508516)
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
-- TOC entry 212 (class 1259 OID 23507983)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 189 (class 1259 OID 23507741)
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
-- TOC entry 182 (class 1259 OID 23507641)
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
-- TOC entry 186 (class 1259 OID 23507708)
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
-- TOC entry 183 (class 1259 OID 23507652)
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
    twitter character varying(255) DEFAULT NULL::character varying,
    skype character varying(255) DEFAULT NULL::character varying,
    fb character varying(255) DEFAULT NULL::character varying,
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
-- TOC entry 177 (class 1259 OID 23507596)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 179 (class 1259 OID 23507615)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 213 (class 1259 OID 23507990)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 217 (class 1259 OID 23508024)
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
-- TOC entry 229 (class 1259 OID 23508161)
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
-- TOC entry 185 (class 1259 OID 23507688)
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
-- TOC entry 188 (class 1259 OID 23507733)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 236 (class 1259 OID 23508372)
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
-- TOC entry 209 (class 1259 OID 23507964)
-- Name: postavkaracuna; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE postavkaracuna (
    id uuid NOT NULL,
    racun_id uuid
);


--
-- TOC entry 187 (class 1259 OID 23507718)
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
-- TOC entry 199 (class 1259 OID 23507862)
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
-- TOC entry 195 (class 1259 OID 23507822)
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
-- TOC entry 196 (class 1259 OID 23507834)
-- Name: predstava_abonma; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE predstava_abonma (
    predstava_id uuid NOT NULL,
    abonma_id uuid NOT NULL
);


--
-- TOC entry 211 (class 1259 OID 23507976)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 237 (class 1259 OID 23508386)
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
-- TOC entry 238 (class 1259 OID 23508396)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    sifra character varying(4) NOT NULL,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 235 (class 1259 OID 23508311)
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
-- TOC entry 239 (class 1259 OID 23508404)
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
-- TOC entry 215 (class 1259 OID 23508005)
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
-- TOC entry 207 (class 1259 OID 23507949)
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
-- TOC entry 206 (class 1259 OID 23507939)
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
-- TOC entry 228 (class 1259 OID 23508150)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying,
    status character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 222 (class 1259 OID 23508080)
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
-- TOC entry 193 (class 1259 OID 23507796)
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
-- TOC entry 174 (class 1259 OID 23507567)
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
-- TOC entry 173 (class 1259 OID 23507565)
-- Name: revizije_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE revizije_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3135 (class 0 OID 0)
-- Dependencies: 173
-- Name: revizije_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE revizije_id_seq OWNED BY revizije.id;


--
-- TOC entry 216 (class 1259 OID 23508018)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 178 (class 1259 OID 23507605)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 176 (class 1259 OID 23507589)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 218 (class 1259 OID 23508032)
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
-- TOC entry 210 (class 1259 OID 23507970)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 204 (class 1259 OID 23507916)
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
-- TOC entry 172 (class 1259 OID 23507554)
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
-- TOC entry 171 (class 1259 OID 23507546)
-- Name: stevilcenjekonfig; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjekonfig (
    id uuid NOT NULL,
    stevilcenje_id uuid,
    dok character varying(100) DEFAULT NULL::character varying
);


--
-- TOC entry 170 (class 1259 OID 23507541)
-- Name: stevilcenjestanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjestanje (
    id uuid NOT NULL,
    objid uuid NOT NULL,
    leto integer NOT NULL,
    stevilka integer
);


--
-- TOC entry 224 (class 1259 OID 23508097)
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
-- TOC entry 184 (class 1259 OID 23507680)
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
-- TOC entry 205 (class 1259 OID 23507926)
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
-- TOC entry 227 (class 1259 OID 23508138)
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
-- TOC entry 181 (class 1259 OID 23507631)
-- Name: tippopa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tippopa (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    ime character varying(255) NOT NULL,
    opis text
);


--
-- TOC entry 240 (class 1259 OID 23508415)
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
-- TOC entry 203 (class 1259 OID 23507906)
-- Name: tipvaje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tipvaje (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    ime character varying(255) NOT NULL,
    opis text
);


--
-- TOC entry 190 (class 1259 OID 23507753)
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
-- TOC entry 175 (class 1259 OID 23507576)
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
-- TOC entry 231 (class 1259 OID 23508188)
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
-- TOC entry 198 (class 1259 OID 23507852)
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
-- TOC entry 214 (class 1259 OID 23507997)
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
-- TOC entry 225 (class 1259 OID 23508111)
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
-- TOC entry 243 (class 1259 OID 23508462)
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
-- TOC entry 242 (class 1259 OID 23508434)
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
-- TOC entry 244 (class 1259 OID 23508474)
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
-- TOC entry 221 (class 1259 OID 23508069)
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
-- TOC entry 201 (class 1259 OID 23507895)
-- Name: zasedenost; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zasedenost (
    id uuid NOT NULL,
    oseba_id uuid
);


--
-- TOC entry 230 (class 1259 OID 23508178)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 220 (class 1259 OID 23508059)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 2220 (class 2604 OID 23507570)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 3058 (class 0 OID 23507622)
-- Dependencies: 180
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
000a0000-562f-62e7-10c9-615435b2279f	10	30	Otroci	Abonma za otroke	200
000a0000-562f-62e7-be1b-c18c443b2224	20	60	Mladina	Abonma za mladino	400
000a0000-562f-62e7-526e-99bb646522fe	15	50	Odrasli	Abonma za odrasle	300
\.


--
-- TOC entry 3111 (class 0 OID 23508230)
-- Dependencies: 233
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, zaposlitev_id, oseba_id, pogodba_id, sifra, zaposlen, zacetek, konec, opomba, sort, privzeti, aktivna, imapogodbo, pomembna) FROM stdin;
000c0000-562f-62e7-1686-cfa0d0a6b626	000d0000-562f-62e7-b780-49d54c5186f1	\N	00090000-562f-62e7-82e1-054f7cc00cbe	000b0000-562f-62e7-1b77-62489c61f127	0001	f	\N	\N	\N	3	t	\N	t	t
000c0000-562f-62e7-7463-1e841bba90af	000d0000-562f-62e7-87f3-3e9cec75728c	00100000-562f-62e7-250d-e639c12482d5	00090000-562f-62e7-54b6-deae4d40c17f	\N	0002	t	2016-01-01	\N	\N	8	t	\N	f	f
000c0000-562f-62e7-98da-ef14945cf436	000d0000-562f-62e7-54c6-217695b8e3ac	00100000-562f-62e7-4761-c363482d192e	00090000-562f-62e7-e12f-116c13c330fc	\N	0003	t	\N	2015-10-27	\N	2	t	\N	f	f
000c0000-562f-62e7-b92f-5c3873779a49	000d0000-562f-62e7-d36f-502d222ee3dd	\N	00090000-562f-62e7-0bab-aaeaec55a2a8	\N	0004	f	2016-01-01	2016-01-01	\N	26	t	\N	f	f
000c0000-562f-62e7-ebca-6dc081ef1111	000d0000-562f-62e7-2363-e9e56db86872	\N	00090000-562f-62e7-7cb4-07137f54abcc	\N	0005	f	2016-01-01	2016-01-01	\N	7	t	\N	f	f
000c0000-562f-62e7-0711-aefb61d7313c	000d0000-562f-62e7-e4de-c051a0029a74	\N	00090000-562f-62e7-5977-1bc00cf3111d	000b0000-562f-62e7-65e5-bb33d5ab512d	0006	f	2016-01-01	2016-01-01	\N	1	t	\N	t	t
000c0000-562f-62e7-bc83-4f965b859e7e	000d0000-562f-62e7-abe6-de60a34d23ad	00100000-562f-62e7-d766-a32f42456ccb	00090000-562f-62e7-9438-5116017c9946	\N	0007	t	2016-01-01	2016-01-01	\N	14	f	\N	f	t
000c0000-562f-62e7-e1e0-daec6a027d2b	000d0000-562f-62e7-fe7b-99d161ecd575	\N	00090000-562f-62e7-4796-464e66aae7b6	000b0000-562f-62e7-c163-21b03daf369c	0008	f	2016-01-01	2016-01-01	\N	12	t	\N	t	t
000c0000-562f-62e7-3f78-731f6f1e43d0	000d0000-562f-62e7-abe6-de60a34d23ad	00100000-562f-62e7-aea3-828378512722	00090000-562f-62e7-b17c-d92703ecc240	\N	0009	t	2017-01-01	2017-01-01	\N	15	t	\N	f	t
000c0000-562f-62e7-2d71-328977fee275	000d0000-562f-62e7-abe6-de60a34d23ad	00100000-562f-62e7-1af7-d4d81c570081	00090000-562f-62e7-0ab6-63385326e131	\N	0010	t	\N	2015-10-27	\N	16	f	\N	f	t
000c0000-562f-62e7-4aa3-d729e4b8d7a4	000d0000-562f-62e7-abe6-de60a34d23ad	00100000-562f-62e7-e841-8e0c96f01f00	00090000-562f-62e7-f825-170c6d7ffc90	\N	0011	t	2017-01-01	\N	\N	17	f	\N	f	t
000c0000-562f-62e7-f647-3586a8b41d6c	000d0000-562f-62e7-30cc-96c87d0a4302	00100000-562f-62e7-250d-e639c12482d5	00090000-562f-62e7-54b6-deae4d40c17f	000b0000-562f-62e7-f8e7-7441086b419c	0012	t	\N	\N	\N	2	t	\N	t	t
\.


--
-- TOC entry 3110 (class 0 OID 23508213)
-- Dependencies: 232
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 3101 (class 0 OID 23508090)
-- Dependencies: 223
-- Data for Name: avtorbesedila; Type: TABLE DATA; Schema: public; Owner: -
--

COPY avtorbesedila (id, besedilo_id, oseba_id, tipavtorja, zaporedna, alivnaslovu) FROM stdin;
003d0000-562f-62e7-ebc8-623542fcb012	00160000-562f-62e7-fd0a-f29e70d309fb	00090000-562f-62e7-604c-37768f9cff32	aizv	10	t
003d0000-562f-62e7-bd16-6f820abe4e0a	00160000-562f-62e7-fd0a-f29e70d309fb	00090000-562f-62e7-d25e-f4173774c19e	apri	14	t
003d0000-562f-62e7-eb23-6739eeab9fc3	00160000-562f-62e7-efc3-bd29df1e454e	00090000-562f-62e7-715f-0dfff661924c	aizv	11	t
003d0000-562f-62e7-a73c-6738b60f9a2d	00160000-562f-62e7-142f-dd036baf4603	00090000-562f-62e7-0ad3-60e20250bd59	aizv	12	t
003d0000-562f-62e7-aaa7-2b3e05c9d45c	00160000-562f-62e7-fd0a-f29e70d309fb	00090000-562f-62e7-b56b-7c307fe4d2ed	apri	18	f
\.


--
-- TOC entry 3104 (class 0 OID 23508120)
-- Dependencies: 226
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, stevilka, naslov, podnaslov, jezik, naslovizvirnika, podnaslovizvirnika, internacionalninaslov, datumprejema, moskevloge, zenskevloge, povzetekvsebine, letoizida, krajizida, zaloznik, avtor) FROM stdin;
00160000-562f-62e7-fd0a-f29e70d309fb	0001	Sen kresne noči		slovenščina	A Midsummer Night's Dream	\N	\N	2015-04-26	5	5	Nastopajo Titanija, Hipolita, Oberon, ...	\N	\N	\N	William  Shakespeare - Nebojša  Kavader
00160000-562f-62e7-efc3-bd29df1e454e	0002	Bratje Karamazovi		slovenščina	Bratja Karamazjovji	\N	\N	2015-12-04	4	1	Svetovna uspešnica	\N	\N	\N	Fjodor Mihajlovič Dostojevski
00160000-562f-62e7-142f-dd036baf4603	0003	Smoletov Vrt		slovenščina		\N	\N	2015-05-26	2	8		\N	\N	\N	Berta   Hočevar
\.


--
-- TOC entry 3125 (class 0 OID 23508501)
-- Dependencies: 247
-- Data for Name: datoteka; Type: TABLE DATA; Schema: public; Owner: -
--

COPY datoteka (id, owner_id, filename, transfers, size, format, hash, createdat, uploadedat, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3078 (class 0 OID 23507870)
-- Dependencies: 200
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_splosni_id, prostor_id, sezona_id, allday, zacetek, konec, status, razred, termin, title) FROM stdin;
00180000-562f-62e7-f11e-811d494bd2ff	\N	\N	00200000-562f-62e7-a7a6-aa3222b3d432	\N	\N	\N	\N	f	2015-06-26 10:00:00	2015-06-26 12:00:00	200s	200s		dogodek 1
00180000-562f-62e7-477b-c3cbbe046a32	\N	\N	00200000-562f-62e7-ecc2-0455678fd9d2	\N	\N	\N	\N	f	2015-06-27 10:00:00	2015-06-27 12:00:00	300s	200s		dogodek 2
00180000-562f-62e7-d9a0-ef5598421395	\N	\N	00200000-562f-62e7-3cec-dbf49e85f29f	\N	\N	\N	\N	f	2015-08-01 20:00:00	2015-08-01 23:00:00	400s	200s		dogodek 3
00180000-562f-62e7-d806-9ed2f6f7d80a	\N	\N	00200000-562f-62e7-6ff0-eb577208bfdf	\N	\N	\N	\N	f	2015-08-01 20:00:00	2015-08-01 23:00:00	100s	200s		dogodek 4
00180000-562f-62e7-a098-ec4e2e14cebb	\N	\N	00200000-562f-62e7-10fc-a78c5080bcfc	\N	\N	\N	\N	f	2015-08-01 20:00:00	2015-08-01 23:00:00	500s	200s		dogodek 5
\.


--
-- TOC entry 3080 (class 0 OID 23507901)
-- Dependencies: 202
-- Data for Name: dogodeksplosni; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodeksplosni (id) FROM stdin;
\.


--
-- TOC entry 3119 (class 0 OID 23508427)
-- Dependencies: 241
-- Data for Name: drugivir; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drugivir (id, znesek, opis, mednarodni, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 3069 (class 0 OID 23507767)
-- Dependencies: 191
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-562f-62e5-5263-4248d4c6b062	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-562f-62e5-aa1e-1718bfd1edb1	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-562f-62e5-047c-d2ffd5b25495	AL	ALB	008	Albania 	Albanija	\N
00040000-562f-62e5-898d-42a1bcb74b9b	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-562f-62e5-bb51-b5b268c6551b	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-562f-62e5-6dd0-a1ed08141aab	AD	AND	020	Andorra 	Andora	\N
00040000-562f-62e5-e9d6-9a2133fdc7f1	AO	AGO	024	Angola 	Angola	\N
00040000-562f-62e5-e7dd-d60cd6dab63a	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-562f-62e5-41ec-2551e43dde24	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-562f-62e5-b560-4c3df6c64172	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-562f-62e5-4c7b-ad22b4eff2c0	AR	ARG	032	Argentina 	Argenitna	\N
00040000-562f-62e5-9326-e96fa99440fa	AM	ARM	051	Armenia 	Armenija	\N
00040000-562f-62e5-30d7-9e7936da74d9	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-562f-62e5-2726-2357e8498e21	AU	AUS	036	Australia 	Avstralija	\N
00040000-562f-62e5-ab8c-5f42f580ea42	AT	AUT	040	Austria 	Avstrija	\N
00040000-562f-62e5-bd3e-5e0909ecee27	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-562f-62e5-563e-8544eb71fcb8	BS	BHS	044	Bahamas 	Bahami	\N
00040000-562f-62e5-aca3-c8a3040a1438	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-562f-62e5-6d70-2eccbbcb2d29	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-562f-62e5-bcb0-bf65f57f3695	BB	BRB	052	Barbados 	Barbados	\N
00040000-562f-62e5-4846-68cd119243b8	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-562f-62e5-bb8e-ec45e92ccd3c	BE	BEL	056	Belgium 	Belgija	\N
00040000-562f-62e5-ecba-e5f0bca7698b	BZ	BLZ	084	Belize 	Belize	\N
00040000-562f-62e5-1f73-cf209dc77597	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-562f-62e5-286a-9f15ac5c478f	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-562f-62e5-3c22-ea851ee87ff8	BT	BTN	064	Bhutan 	Butan	\N
00040000-562f-62e5-8989-81e7c41c96f9	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-562f-62e5-6609-795899b256c4	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-562f-62e5-34b2-5dc0f127d1f3	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-562f-62e5-8f46-fe36ece4cb57	BW	BWA	072	Botswana 	Bocvana	\N
00040000-562f-62e5-2bd1-72c9349ae848	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-562f-62e5-f143-50cf7eb394c1	BR	BRA	076	Brazil 	Brazilija	\N
00040000-562f-62e5-4788-c68d2d11a366	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-562f-62e5-1821-b0755213daf3	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-562f-62e5-e2a1-a2060a4ff62a	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-562f-62e5-eb75-036753fa0b4a	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-562f-62e5-7000-54036fa53874	BI	BDI	108	Burundi 	Burundi 	\N
00040000-562f-62e5-a718-0f98ba208668	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-562f-62e5-b186-dbaa9fe0ddae	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-562f-62e5-efa6-2194717fc20a	CA	CAN	124	Canada 	Kanada	\N
00040000-562f-62e5-b394-0a9d746b5d0a	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-562f-62e5-2bc5-437d8e97c73a	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-562f-62e5-b16e-a9a622b9089e	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-562f-62e5-f059-b834a80213bc	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-562f-62e5-3adc-e8baf7998c8c	CL	CHL	152	Chile 	Čile	\N
00040000-562f-62e5-ea8e-71b85f3e3324	CN	CHN	156	China 	Kitajska	\N
00040000-562f-62e5-10b9-b7dcdcb5114d	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-562f-62e5-c8aa-0b2e8e763643	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-562f-62e5-8b26-1ff6d79a55a6	CO	COL	170	Colombia 	Kolumbija	\N
00040000-562f-62e5-6bdf-b7a2d704f500	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-562f-62e5-8e3e-294ef51bc13e	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-562f-62e5-4f28-b8b859a5626e	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-562f-62e5-84ea-9bc3972c0f84	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-562f-62e5-7452-12756ffefaf4	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-562f-62e5-a4c6-20d8bc574971	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-562f-62e5-68fe-77454bedf31f	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-562f-62e5-9c14-042214b0c48d	CU	CUB	192	Cuba 	Kuba	\N
00040000-562f-62e5-40a6-923f233a9723	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-562f-62e5-4038-8edafe956367	CY	CYP	196	Cyprus 	Ciper	\N
00040000-562f-62e5-93b3-bf651edfcd72	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-562f-62e5-eda4-50bfb2dce4fb	DK	DNK	208	Denmark 	Danska	\N
00040000-562f-62e5-ba49-b121fd2233d7	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-562f-62e5-e552-3e8e61f4d10a	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-562f-62e5-9203-69f18f5dd9df	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-562f-62e5-4414-f1600f71fbbd	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-562f-62e5-64a7-11a3ed43ec34	EG	EGY	818	Egypt 	Egipt	\N
00040000-562f-62e5-f13d-fd58990e6470	SV	SLV	222	El Salvador 	Salvador	\N
00040000-562f-62e5-50a2-f667d5e8ed1e	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-562f-62e5-e9be-b2e041386526	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-562f-62e5-678d-b06f45dcb4c5	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-562f-62e5-7bba-3e438a5311ea	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-562f-62e5-4493-03fc6438f052	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-562f-62e5-066f-7bd42fff28fb	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-562f-62e5-6b31-e5274f86e5f4	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-562f-62e5-e37a-c6502c85f018	FI	FIN	246	Finland 	Finska	\N
00040000-562f-62e5-b43e-f6a3fc8909bd	FR	FRA	250	France 	Francija	\N
00040000-562f-62e5-25d0-1c8ce8016a22	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-562f-62e5-1e69-18356c78eb65	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-562f-62e5-6ca3-41a49e40b5b2	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-562f-62e5-7a0c-c2d5a07906ac	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-562f-62e5-3cd1-49f6a87148a4	GA	GAB	266	Gabon 	Gabon	\N
00040000-562f-62e5-1b29-3ee26540c4a1	GM	GMB	270	Gambia 	Gambija	\N
00040000-562f-62e5-80af-3e9eeea4487e	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-562f-62e5-18fe-13528d8a56d5	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-562f-62e5-0253-18e67225b3ca	GH	GHA	288	Ghana 	Gana	\N
00040000-562f-62e5-fac9-edb9227e6754	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-562f-62e5-c4f4-94e9c44e35ed	GR	GRC	300	Greece 	Grčija	\N
00040000-562f-62e5-87f8-13bc267fecf6	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-562f-62e5-c0fb-c3e49a20a6f4	GD	GRD	308	Grenada 	Grenada	\N
00040000-562f-62e5-6775-414aca35671a	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-562f-62e5-8704-708101fc46cf	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-562f-62e5-9d14-ab95fc921dc0	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-562f-62e5-11c1-cc813df96a75	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-562f-62e5-de04-63e48a40ae10	GN	GIN	324	Guinea 	Gvineja	\N
00040000-562f-62e5-cb97-79a4d82bf550	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-562f-62e5-5c56-d4e5fde0c59a	GY	GUY	328	Guyana 	Gvajana	\N
00040000-562f-62e5-7eab-cb19baaca40a	HT	HTI	332	Haiti 	Haiti	\N
00040000-562f-62e5-5ccd-6bc7a0fa6d29	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-562f-62e5-7f98-061f01ee92de	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-562f-62e5-9d3a-334eb56180f9	HN	HND	340	Honduras 	Honduras	\N
00040000-562f-62e5-2b3a-746cb7519b57	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-562f-62e5-f87e-97e9bc13e948	HU	HUN	348	Hungary 	Madžarska	\N
00040000-562f-62e5-0b10-c5ca355cf64b	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-562f-62e5-7e5a-7fc9e6d9b935	IN	IND	356	India 	Indija	\N
00040000-562f-62e5-81c6-d5b52430f140	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-562f-62e5-9101-373cf91428d7	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-562f-62e5-4731-3c495ad3c87c	IQ	IRQ	368	Iraq 	Irak	\N
00040000-562f-62e5-a856-0e60b07f014f	IE	IRL	372	Ireland 	Irska	\N
00040000-562f-62e5-1be6-9fea22fa3453	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-562f-62e5-710d-80d4acc0aa2b	IL	ISR	376	Israel 	Izrael	\N
00040000-562f-62e5-19f9-b3f83f679921	IT	ITA	380	Italy 	Italija	\N
00040000-562f-62e5-ac6c-5820e898f2f0	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-562f-62e5-3fc4-615fe8c14cce	JP	JPN	392	Japan 	Japonska	\N
00040000-562f-62e5-8458-995bb951699a	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-562f-62e5-e4be-03384cf5a3c4	JO	JOR	400	Jordan 	Jordanija	\N
00040000-562f-62e5-22eb-ccec2205ce40	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-562f-62e5-efc1-f7a601c749be	KE	KEN	404	Kenya 	Kenija	\N
00040000-562f-62e5-64c7-a54f94da9127	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-562f-62e5-9819-2ae776bb415d	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-562f-62e5-7a8b-1f444df9eb06	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-562f-62e5-0555-62b709f49543	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-562f-62e5-23cc-56bd935ad16f	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-562f-62e5-f46a-b443cd83c6be	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-562f-62e5-23f3-68b3e1696d33	LV	LVA	428	Latvia 	Latvija	\N
00040000-562f-62e5-c56f-a6c0a5cd7c87	LB	LBN	422	Lebanon 	Libanon	\N
00040000-562f-62e5-c20c-5a13ff31c78a	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-562f-62e5-9faf-75867b812a11	LR	LBR	430	Liberia 	Liberija	\N
00040000-562f-62e5-ece5-e188c997147e	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-562f-62e5-2230-474ade64e8e1	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-562f-62e5-cf5e-a8051cb93360	LT	LTU	440	Lithuania 	Litva	\N
00040000-562f-62e5-ebf3-48832aeada4c	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-562f-62e5-0c45-f1814cd04ec3	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-562f-62e5-7d9d-6c14a53e4fd3	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-562f-62e5-6343-834e2d0199d6	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-562f-62e5-5ffd-405f00c1a405	MW	MWI	454	Malawi 	Malavi	\N
00040000-562f-62e5-92d7-9f4a477736d5	MY	MYS	458	Malaysia 	Malezija	\N
00040000-562f-62e5-5721-7d15f307b005	MV	MDV	462	Maldives 	Maldivi	\N
00040000-562f-62e5-d0e2-d15849cc1c68	ML	MLI	466	Mali 	Mali	\N
00040000-562f-62e5-ee92-7519378dcde2	MT	MLT	470	Malta 	Malta	\N
00040000-562f-62e5-47fd-ebd52f6bf29e	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-562f-62e5-0bad-a58a043c3c31	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-562f-62e5-818e-78a5ac74fa4f	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-562f-62e5-f349-f275bacfe82c	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-562f-62e5-4ff4-503db67ca453	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-562f-62e5-a147-75ff537d0cb6	MX	MEX	484	Mexico 	Mehika	\N
00040000-562f-62e5-f2c1-496b848f17ef	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-562f-62e5-2b72-4a45784220e4	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-562f-62e5-36ff-86d6ccc529ab	MC	MCO	492	Monaco 	Monako	\N
00040000-562f-62e5-c7b2-97f61fb664be	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-562f-62e5-000e-240f0541abb5	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-562f-62e5-83e5-a6e5b6d7d3fa	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-562f-62e5-6fed-40c0b08460c6	MA	MAR	504	Morocco 	Maroko	\N
00040000-562f-62e5-075f-cb461736456b	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-562f-62e5-8ddd-2b8db0aed473	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-562f-62e5-cfe0-e61d6f4ebc8e	NA	NAM	516	Namibia 	Namibija	\N
00040000-562f-62e5-f7ae-73fa5cb56fdb	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-562f-62e5-00e2-2e0bc0e4de4e	NP	NPL	524	Nepal 	Nepal	\N
00040000-562f-62e5-507a-9bc0bacf499b	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-562f-62e5-549e-6aa1dc32cd80	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-562f-62e5-cbdf-1a986880653c	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-562f-62e5-d7e5-b3f05ce8d8a4	NE	NER	562	Niger 	Niger 	\N
00040000-562f-62e5-5d9e-495a78d93426	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-562f-62e5-e19f-27ac741a5712	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-562f-62e5-456a-27e45caf90bf	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-562f-62e5-7f29-941ecd10ccd4	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-562f-62e5-6908-44b561b18ea9	NO	NOR	578	Norway 	Norveška	\N
00040000-562f-62e5-44f6-3362c740736a	OM	OMN	512	Oman 	Oman	\N
00040000-562f-62e5-7cb9-16154081d45c	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-562f-62e5-5c7c-b668ff112979	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-562f-62e5-a3f6-a694e834eaea	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-562f-62e5-6ef3-cbd8812232c7	PA	PAN	591	Panama 	Panama	\N
00040000-562f-62e5-81e3-17c15cf00f30	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-562f-62e5-09b6-35b52a16ab21	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-562f-62e5-9201-cc0b749a09a1	PE	PER	604	Peru 	Peru	\N
00040000-562f-62e5-e801-532f17422076	PH	PHL	608	Philippines 	Filipini	\N
00040000-562f-62e5-d27f-a9cf0cd03919	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-562f-62e5-7143-bb337d0a13f1	PL	POL	616	Poland 	Poljska	\N
00040000-562f-62e5-72ed-613c0bedff01	PT	PRT	620	Portugal 	Portugalska	\N
00040000-562f-62e5-03c9-e703d11fcb4e	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-562f-62e5-6c85-ac4ce7629bfa	QA	QAT	634	Qatar 	Katar	\N
00040000-562f-62e5-6c5c-999478cbcd9c	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-562f-62e5-3bb4-63cb421d9bb7	RO	ROU	642	Romania 	Romunija	\N
00040000-562f-62e5-1a49-1f42b4107a5d	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-562f-62e5-db42-d0999b6c7a0b	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-562f-62e5-2b2e-ca3a8c2b5983	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-562f-62e5-15fd-6e2aa3d7f6cd	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-562f-62e5-8a49-3b10a4407304	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-562f-62e5-02af-9621f4f0f694	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-562f-62e5-c573-9d82dc4164cd	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-562f-62e5-edef-4c468631b732	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-562f-62e5-d8f7-827c86f4f74f	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-562f-62e5-de6d-cc0752090b33	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-562f-62e5-24f3-929e814d5f0c	SM	SMR	674	San Marino 	San Marino	\N
00040000-562f-62e5-5fd4-34aeef5a8c83	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-562f-62e5-1f41-80e9f5b70c23	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-562f-62e5-39be-2cc29165181d	SN	SEN	686	Senegal 	Senegal	\N
00040000-562f-62e5-9287-65751570fe92	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-562f-62e5-9a49-5404d33f1b4b	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-562f-62e5-43b0-cd5624bd7215	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-562f-62e5-5ddd-1d6cbf88c237	SG	SGP	702	Singapore 	Singapur	\N
00040000-562f-62e5-fadd-a59ee19b77ca	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-562f-62e5-9f73-3e374a2936aa	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-562f-62e5-de26-c389915f8107	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-562f-62e5-c4d9-55c23af29f6e	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-562f-62e5-e8fd-689971c3866e	SO	SOM	706	Somalia 	Somalija	\N
00040000-562f-62e5-b8b0-fa9193302e13	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-562f-62e5-55fc-2a8e6e962762	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-562f-62e5-7d58-722068acef99	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-562f-62e5-4642-17a8da058f4b	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-562f-62e5-cf50-971aa1d2a5ac	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-562f-62e5-4141-05de8803bb12	SD	SDN	729	Sudan 	Sudan	\N
00040000-562f-62e5-b3e1-aff08d9cf2bd	SR	SUR	740	Suriname 	Surinam	\N
00040000-562f-62e5-b454-57b75cff895e	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-562f-62e5-c2cf-8863ce17ef44	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-562f-62e5-24d8-99a3d566eba8	SE	SWE	752	Sweden 	Švedska	\N
00040000-562f-62e5-25de-9d651371578d	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-562f-62e5-9430-c763eaaf3295	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-562f-62e5-fbad-105289ef8f8c	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-562f-62e5-3dea-90d9911c2428	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-562f-62e5-33fa-307970b89647	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-562f-62e5-4e62-90949e330f56	TH	THA	764	Thailand 	Tajska	\N
00040000-562f-62e5-f5bd-366314ffcb31	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-562f-62e5-4e23-5233a11a8c28	TG	TGO	768	Togo 	Togo	\N
00040000-562f-62e5-931d-3a4aa5a19f18	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-562f-62e5-7bb5-b0f6d5b6611d	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-562f-62e5-73fc-d8449d0b0b31	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-562f-62e5-bef3-d1583fbfd789	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-562f-62e5-4554-a0da0614d4ad	TR	TUR	792	Turkey 	Turčija	\N
00040000-562f-62e5-591e-d4be691badbb	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-562f-62e5-7458-f96334a60b0f	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-562f-62e5-6bdb-63487c713a7b	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-562f-62e5-3333-c97e1d044772	UG	UGA	800	Uganda 	Uganda	\N
00040000-562f-62e5-669c-a0b41a29b28b	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-562f-62e5-a0c4-4e9148874d5c	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-562f-62e5-e1ad-f75b0148b53d	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-562f-62e5-c387-b584784b547f	US	USA	840	United States 	Združene države Amerike	\N
00040000-562f-62e5-a722-4e5ab1d40fcc	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-562f-62e5-d733-0f54f7da9369	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-562f-62e5-7025-86c6cee9cf78	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-562f-62e5-00e3-503ab0d4185e	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-562f-62e5-cbd1-57025c0e9e93	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-562f-62e5-d67d-e917649a8060	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-562f-62e5-af12-49b055f44e4d	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-562f-62e5-5b54-2e3894c84df9	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-562f-62e5-1022-2faa93170e0d	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-562f-62e5-16e2-55fce5a2b40d	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-562f-62e5-28c8-755d23e21132	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-562f-62e5-15ea-2b1ce252ce0e	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-562f-62e5-69a2-ca95c38a5b2a	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 3112 (class 0 OID 23508243)
-- Dependencies: 234
-- Data for Name: enotaprograma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY enotaprograma (id, uprizoritev_id, program_dela_id, gostitelj_id, celotnavrednost, nasdelez, celotnavrednostmat, celotnavrednostgostovsz, zaproseno, lastnasredstva, avtorskihonorarji, avtorskihonorarjisamoz, tantieme, avtorskepravice, materialni, imakoprodukcije, vlozekgostitelja, drugijavni, stzaposlenih, stzaposumet, stzaposdrug, sthonorarnihzun, sthonorarnihzunigr, sthonorarnihzunigrtujjz, sthonorarnihzunsamoz, obiskdoma, obiskkopr, obiskgost, obiskkoprgost, obiskzamejo, obiskkoprzamejo, obiskint, obiskkoprint, ponovidoma, ponovikopr, ponovizamejo, ponovikoprzamejo, ponovigost, ponovikoprgost, ponovikoprint, ponoviint, naziv, kpe, sort, tipprogramskeenote_id, tip, prikoproducentu, prizorisce, trajanje, zvrst, avtor, reziser, datum, soustvarjalci, strosekodkpred, stroskiostali, krajgostovanja, ustanova, datumgostovanja, transportnistroski, dnevprvzad, drzavagostovanja_id, stpe, stpredstav, stokroglihmiz, stpredstavitev, stdelavnic, stdrugidogodki, stprodukcij, caspriprave, casizvedbe, prizorisca, umetvodja, programskotelo, sttujihselektorjev) FROM stdin;
002f0000-562f-62e7-820e-54a829ba9574	000e0000-562f-62e7-69bb-6a332d4a10fa	\N	\N	9000.30	9000.30	9000.30	0.00	3600.12	5299.98	4000.40	1000.40	200.20	200.30	4599.40	\N	0.00	100.20	0	2	2	2	2	2	0	40	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-562f-62e5-5e4e-ae96c634ed3d	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-562f-62e7-0161-8f9b64597bcc	000e0000-562f-62e7-0e70-fc65d22efa9d	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	0	60	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-562f-62e5-b217-2b58ea51dac0	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-562f-62e7-a4c1-aab9ef350b0f	000e0000-562f-62e7-c5ab-638de55eacad	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	0	60	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-562f-62e5-5e4e-ae96c634ed3d	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-562f-62e7-b015-db54313f85aa	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-54.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	54.20	5	0	0	3	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0	0	Urejanje portala	0.00	10	\N	razno	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-562f-62e7-5285-32987fa4c662	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-31.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	31.20	5	0	0	3	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0	0	Delavnice otroci	0.00	8	\N	razno	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 3097 (class 0 OID 23508044)
-- Dependencies: 219
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, podrocje, vodjaekipe, naziv, komentar, velikost, pomembna, sort, seplanira, dovoliprekrivanje, maxprekrivanj, tipfunkcije_id) FROM stdin;
000d0000-562f-62e7-abe6-de60a34d23ad	000e0000-562f-62e7-0e70-fc65d22efa9d	\N	igralec	\N	Hipolita	glavna vloga	velika	t	6	t	t	\N	000f0000-562f-62e5-bfda-b6029c94c6a1
000d0000-562f-62e7-b780-49d54c5186f1	000e0000-562f-62e7-0e70-fc65d22efa9d	000c0000-562f-62e7-1686-cfa0d0a6b626	igralec	\N	Tezej	glavna vloga	velika	t	5	t	t	\N	000f0000-562f-62e5-bfda-b6029c94c6a1
000d0000-562f-62e7-87f3-3e9cec75728c	000e0000-562f-62e7-0e70-fc65d22efa9d	000c0000-562f-62e7-7463-1e841bba90af	umetnik	\N	Režija		velika	t	8	t	t	\N	000f0000-562f-62e5-899b-642401325874
000d0000-562f-62e7-54c6-217695b8e3ac	000e0000-562f-62e7-0e70-fc65d22efa9d	000c0000-562f-62e7-98da-ef14945cf436	inspicient	t	Inšpicient			t	8	t	t	\N	000f0000-562f-62e5-4255-2b16ab252865
000d0000-562f-62e7-d36f-502d222ee3dd	000e0000-562f-62e7-0e70-fc65d22efa9d	000c0000-562f-62e7-b92f-5c3873779a49	tehnik	t	Tehnični vodja			t	8	t	t	\N	000f0000-562f-62e5-b354-d66bfb09a7c5
000d0000-562f-62e7-2363-e9e56db86872	000e0000-562f-62e7-0e70-fc65d22efa9d	000c0000-562f-62e7-ebca-6dc081ef1111	tehnik	\N	Razsvetljava			t	3	t	t	\N	000f0000-562f-62e5-b354-d66bfb09a7c5
000d0000-562f-62e7-e4de-c051a0029a74	000e0000-562f-62e7-0e70-fc65d22efa9d	000c0000-562f-62e7-0711-aefb61d7313c	igralec	\N	Helena	glavna vloga	velika	t	5	t	t	\N	000f0000-562f-62e5-bfda-b6029c94c6a1
000d0000-562f-62e7-fe7b-99d161ecd575	000e0000-562f-62e7-0e70-fc65d22efa9d	000c0000-562f-62e7-e1e0-daec6a027d2b	umetnik	\N	Lektoriranje			t	22	t	t	\N	000f0000-562f-62e5-1432-aed356094a90
000d0000-562f-62e7-30cc-96c87d0a4302	000e0000-562f-62e7-0e70-fc65d22efa9d	000c0000-562f-62e7-f647-3586a8b41d6c	umetnik	\N	Avtor	Avtor besedila		t	2	t	f	\N	000f0000-562f-62e5-e628-f45f34e75d1f
\.


--
-- TOC entry 3075 (class 0 OID 23507841)
-- Dependencies: 197
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta, zamejstvo, kraj) FROM stdin;
\.


--
-- TOC entry 3072 (class 0 OID 23507807)
-- Dependencies: 194
-- Data for Name: job; Type: TABLE DATA; Schema: public; Owner: -
--

COPY job (id, user_id, name, task, status, log, datum, casizvedbe, izveden, data, alert, hidden, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3070 (class 0 OID 23507784)
-- Dependencies: 192
-- Data for Name: kontaktnaoseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kontaktnaoseba (id, popa_id, oseba_id, status, funkcija, opis) FROM stdin;
00260000-562f-62e7-02bc-03735ccfb207	00080000-562f-62e7-aae7-3c27743e1371	00090000-562f-62e7-0ab6-63385326e131	AK		igralka
\.


--
-- TOC entry 3086 (class 0 OID 23507958)
-- Dependencies: 208
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 3123 (class 0 OID 23508482)
-- Dependencies: 245
-- Data for Name: mapa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa (id, lastnik_id, parent_id, ime, komentar, caskreiranja, casspremembe, javnidostop, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3124 (class 0 OID 23508494)
-- Dependencies: 246
-- Data for Name: mapa_zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa_zapis (mapa_id, zapis_id) FROM stdin;
\.


--
-- TOC entry 3126 (class 0 OID 23508516)
-- Dependencies: 248
-- Data for Name: mapaacl; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapaacl (id, mapa_id, perm_id, dostop, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3090 (class 0 OID 23507983)
-- Dependencies: 212
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 3067 (class 0 OID 23507741)
-- Dependencies: 189
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-562f-62e6-ab60-b162c243d412	popa.stakli	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-562f-62e6-7857-11738b2e6e90	oseba.spol	array	a:2:{s:1:"M";a:1:{s:5:"label";s:6:"Moški";}s:1:"Z";a:1:{s:5:"label";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-562f-62e6-e522-548fa46855d8	telefonska.vrsta	array	a:3:{s:7:"mobilna";a:1:{s:5:"label";s:7:"Mobilni";}s:6:"domaca";a:1:{s:5:"label";s:6:"Domač";}s:6:"fiksna";a:1:{s:5:"label";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-562f-62e6-a4af-2020839e52c4	kontaktnaoseba.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status kontaktne osebe
00000000-562f-62e6-6317-679d62c4637b	dogodek.status	array	a:8:{s:4:"100s";a:1:{s:5:"label";s:11:"Dolgoročno";}s:4:"200s";a:1:{s:5:"label";s:9:"Planirano";}s:4:"300s";a:1:{s:5:"label";s:8:"Fiksiran";}s:4:"400s";a:1:{s:5:"label";s:17:"Potrjen - interno";}s:4:"500s";a:1:{s:5:"label";s:15:"Potrjen - javno";}s:4:"600s";a:1:{s:5:"label";s:10:"Zaključen";}s:4:"610s";a:1:{s:5:"label";s:9:"Odpovedan";}s:4:"700s";a:1:{s:5:"label";s:7:"Obdelan";}}	f	t	t	\N	Tabela statusa dogodkov
00000000-562f-62e6-4091-08cde7307825	dogodek.razred	array	a:5:{s:4:"100s";a:2:{s:5:"label";s:9:"Predstava";s:4:"type";s:9:"predstava";}s:4:"200s";a:2:{s:5:"label";s:4:"Vaja";s:4:"type";s:4:"vaja";}s:4:"300s";a:2:{s:5:"label";s:10:"Gostovanje";s:4:"type";s:10:"gostovanje";}s:4:"400s";a:2:{s:5:"label";s:16:"Splošni dogodek";s:4:"type";s:8:"splošni";}s:4:"500s";a:2:{s:5:"label";s:10:"Zasedenost";s:4:"type";s:10:"zasedenost";}}	f	t	t	\N	Tabela razredov dogodkov, ki jih aplikacija podpira
00000000-562f-62e6-3a7c-2dd1895aa5ca	uprizoritev.faza	array	a:6:{s:20:"predprodukcija-ideja";a:1:{s:5:"label";s:16:"Dolgoročni plan";}s:20:"predprodukcija-poziv";a:1:{s:5:"label";s:29:"Predprodukcija, v fazi poziva";}s:30:"predprodukcija-potrjen_program";a:1:{s:5:"label";s:34:"Predprodukcija, program je potrjen";}s:10:"produkcija";a:1:{s:5:"label";s:10:"Produkcija";}s:14:"postprodukcija";a:1:{s:5:"label";s:14:"Postprodukcija";}s:5:"arhiv";a:1:{s:5:"label";s:10:"Arhivirana";}}	f	t	f	\N	Faza uprizoritve
00000000-562f-62e6-690a-6f7aa8503b64	funkcija.podrocje	array	a:4:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}}	f	t	f	\N	Področje funkcije
00000000-562f-62e6-1f90-94a92e0a3a73	tipfunkcije.podrocje	array	a:4:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}}	f	t	f	\N	Področje funkcije
00000000-562f-62e6-d31e-33014b340ff5	funkcija.velikost	array	a:4:{s:6:"velika";a:1:{s:5:"label";s:23:"Velika vloga / funkcija";}s:7:"srednja";a:1:{s:5:"label";s:24:"Srednja vloga / funkcija";}s:4:"mala";a:1:{s:5:"label";s:21:"Mala vloga / funkcija";}s:7:"stataza";a:1:{s:5:"label";s:8:"Stataža";}}	f	t	f	\N	Velikost funkcije
00000000-562f-62e6-1d35-59f8d564e088	zaposlitev.status	array	a:2:{s:1:"A";a:1:{s:5:"label";s:7:"Aktivna";}s:1:"N";a:1:{s:5:"label";s:9:"Neaktivna";}}	f	t	f	\N	Status zaposlitve
00000000-562f-62e6-8f9f-0263b56247cc	produkcijskahisa.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktivna";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktivna";}}	f	t	f	\N	Status produkcijske hiše
00000000-562f-62e6-7863-11f7c5296e92	strosekuprizoritve.tipstroska	array	a:1:{s:10:"materialni";a:1:{s:5:"label";s:19:"Materialni strošek";}}	f	t	f	\N	Tip stroška
00000000-562f-62e6-56a5-eadcb52bab19	avtorbesedila.tipavtorja	array	a:4:{s:4:"aizv";a:1:{s:5:"label";s:15:"Avtor izvirnika";}s:4:"prev";a:1:{s:5:"label";s:10:"Prevajalec";}s:4:"apri";a:1:{s:5:"label";s:14:"Avtor priredbe";}s:4:"dram";a:1:{s:5:"label";s:12:"Dramatizator";}}	f	t	f	\N	Tip stroška
00000000-562f-62e6-f105-56e491a55aa0	fsacl.dostop	array	a:4:{s:1:"X";a:1:{s:5:"label";s:12:"Brez dostopa";}s:1:"R";a:1:{s:5:"label";s:11:"Samo branje";}s:2:"RW";a:1:{s:5:"label";s:17:"Branje in pisanje";}s:3:"RWD";a:1:{s:5:"label";s:26:"Branje pisanje in brisanje";}}	f	t	f	\N	ACL Javni dostop
00000000-562f-62e7-d6bc-9cfb28313dbd	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-562f-62e7-b7e6-4541260309f9	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-562f-62e7-ede1-7638bbe88293	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-562f-62e7-81f8-2bb276e0c3f3	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-562f-62e7-ecdb-2bc784eefbfe	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
00000000-562f-62e9-ccca-c35201db728a	application.tenant.maticnopodjetje	string	s:36:"00080000-562f-62e9-5b45-37f776743016";	f	t	f		Id matičnega podjetja v Popa
\.


--
-- TOC entry 3060 (class 0 OID 23507641)
-- Dependencies: 182
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-562f-62e7-d9e0-9a12572dfad4	00000000-562f-62e7-d6bc-9cfb28313dbd	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-562f-62e7-26af-8553680e0ff0	00000000-562f-62e7-d6bc-9cfb28313dbd	00010000-562f-62e6-c238-6a5497690ae8	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-562f-62e7-82f9-72545038393b	00000000-562f-62e7-b7e6-4541260309f9	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 3064 (class 0 OID 23507708)
-- Dependencies: 186
-- Data for Name: organizacijskaenota; Type: TABLE DATA; Schema: public; Owner: -
--

COPY organizacijskaenota (id, parent_id, vodja_id, namestnik_id, sifra, naziv) FROM stdin;
00410000-562f-62e7-1c48-36e943a4ea68	\N	00100000-562f-62e7-250d-e639c12482d5	00100000-562f-62e7-4761-c363482d192e	01	Gledališče Nimbis
00410000-562f-62e7-d056-72ef32f0f6f5	00410000-562f-62e7-1c48-36e943a4ea68	00100000-562f-62e7-250d-e639c12482d5	00100000-562f-62e7-4761-c363482d192e	02	Tehnika
\.


--
-- TOC entry 3061 (class 0 OID 23507652)
-- Dependencies: 183
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naslov_id, sifra, naziv, ime, priimek, funkcija, srednjeime, polnoime, psevdonim, email, twitter, skype, fb, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
00090000-562f-62e7-82e1-054f7cc00cbe	\N	\N	0001	g.	Janez	Novak	a	Peter	Janez Peter Novak	Jani	jani.novak@xxx.xx				1958-01-06	0601958000000	123456789	M	Jani Janez	Slovenija	Slovenija	Ljubljana
00090000-562f-62e7-0bab-aaeaec55a2a8	00010000-562f-62e7-0187-8c695fdfd7ef	\N	0002	dr.	Anton	Horvat	b		Anton  Horvat	Tona	anton.horvat@xxx.xx				1968-02-12	1202968111111	234567890	M		Slovenija	Slovenija	Maribor
00090000-562f-62e7-e12f-116c13c330fc	00010000-562f-62e7-9266-b6a1961e5dd1	\N	0003		Ivan	Kovačič	c		Ivan  Kovačič	Ivo	ivan.kovacic@xxx.xx				1975-03-26	2603976222222	345678901	M		Slovenija	Slovenija	Celje
00090000-562f-62e7-b17c-d92703ecc240	00010000-562f-62e7-e8b6-37537412b1bb	\N	0004	prof.	Jožef	Krajnc	d		Jožef  Krajnc	Joža	jozef.krajnc@xxx.xx				1971-04-30	3004971333333	456789012	M		Slovenija	Slovenija	Kranj
00090000-562f-62e7-377d-414b5a669d12	\N	\N	0005		Marko	Zupančič	e		Marko  Zupančič		marko.zupancic@xxx.xx				1984-05-07	0705984444444	567890123	M		Slovenija	Slovenija	Koper
00090000-562f-62e7-5977-1bc00cf3111d	\N	\N	0006	ga.	Marija	Kovač	f		Marija  Kovač		marija.kovac@xxx.xx				1962-06-19	1906962444444	678901234	Z		Slovenija	Slovenija	Murska Sobota
00090000-562f-62e7-f825-170c6d7ffc90	\N	\N	0007	ga.	Ana	Potočnik	g		Ana  Potočnik		ana.potocnik@xxx.xx				1975-07-24	2407975555555	789012345	Z		Slovenija	Slovenija	Novo Mesto
00090000-562f-62e7-9438-5116017c9946	\N	\N	0008	ga.	Maja	Mlakar	h		Maja  Mlakar		maja.mlakar@xxx.xx				1986-08-02	0208986666666	890123456	Z		Slovenija	Slovenija	Nova Gorica
00090000-562f-62e7-0ab6-63385326e131	00010000-562f-62e7-15ee-b93263858a3a	\N	0009		Irena	Kos	i		Irena  Kos		irena.kos@xxx.xx				1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Ptuj
00090000-562f-62e7-54b6-deae4d40c17f	\N	\N	0010		Mojca	Vidmar	J		Mojca  Vidmar		mojca.vidmar@xxx.xx				1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Idrija
00090000-562f-62e7-2179-f4a406178838	\N	\N	0011		xx	write protected12345	a		xx  write protected12345		xx@xxx.xx				\N	\N	\N	Z		\N	\N	\N
00090000-562f-62e7-7cb4-07137f54abcc	\N	\N	0012		Luka	Golob	luč	a	Luka a Golob		luka.golob@xxx.xx				\N	\N	\N	M		\N	\N	\N
00090000-562f-62e7-4796-464e66aae7b6	00010000-562f-62e7-371f-f32724d845df	\N	0013		Tatjana	Božič	tajnica	a	Tatjana a Božič		tatjana.bozic@xxx.xx				\N	\N	\N	Z		\N	\N	\N
00090000-562f-62e7-604c-37768f9cff32	\N	\N	0014		William	Shakespeare	avtor		William  Shakespeare		\N				\N	\N	\N	M		\N	\N	\N
00090000-562f-62e7-d25e-f4173774c19e	\N	\N	0015		Nebojša	Kavader	avtor		Nebojša  Kavader		\N				\N	\N	\N	M		\N	\N	\N
00090000-562f-62e7-715f-0dfff661924c	\N	\N	0016		Fjodor	Dostojevski	avtor	Mihajlovič	Fjodor Mihajlovič Dostojevski		\N				\N	\N	\N	M		\N	\N	\N
00090000-562f-62e7-0ad3-60e20250bd59	\N	\N	0017		Berta 	Hočevar	avtorica		Berta   Hočevar		\N				\N	\N	\N	Z		\N	\N	\N
00090000-562f-62e7-b56b-7c307fe4d2ed	\N	\N	0018		Katarina	Podbevšek	lektorica		Katarina  Podbevšek		\N				\N	\N	\N	Z		\N	\N	\N
00090000-562f-62e7-24c2-04048d147b6b	\N	\N	0019		Lojze	Žumer			Lojze  Žumer		\N				\N	\N	\N	M		\N	\N	\N
00090000-562f-62e7-456d-ec67de290def	\N	\N	0020		Luka	Novak			Luka  Novak		\N				\N	\N	\N	M		\N	\N	\N
00090000-562f-62e7-f0ca-bf2f548fa624	\N	\N	0021		Vinko	   Netriman   			Vinko     Netriman   		\N				\N	\N	\N	M		\N	\N	\N
\.


--
-- TOC entry 3055 (class 0 OID 23507596)
-- Dependencies: 177
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-562f-62e5-4b69-f35cfff8df19	Aaa-read	Aaa (User,Role,Permission) - branje	t
00030000-562f-62e5-3072-78b2a79fe9a4	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	t
00030000-562f-62e5-34f8-87c3b5df695c	TerminStoritve-vse	TerminStoritve - spreminjanje vseh zapisov	t
00030000-562f-62e5-e5ed-ed3518434387	Dogodek-readVse	Dogodek - branje vseh, ne glede na status dogodka	t
00030000-562f-62e5-59a7-2fa92cfbe575	Oseba-vse	Oseba - vse - za testiranje assert	t
00030000-562f-62e5-3dc7-66ffe9dda895	ProgramDela-lock	ProgramDela - zaklepanje	t
00030000-562f-62e5-2aa4-40b7be82f73d	ProgramDela-unlock	ProgramDela - odklepanje	t
00030000-562f-62e5-3a69-da00bf50c4ad	Abonma-read	Abonma - branje	t
00030000-562f-62e5-d05e-66d2deaf9fb9	Abonma-write	Abonma - spreminjanje	t
00030000-562f-62e5-b5da-09bff392bdcf	Alternacija-read	Alternacija - branje	t
00030000-562f-62e5-eec2-4f13d8c7a0e5	Alternacija-write	Alternacija - spreminjanje	t
00030000-562f-62e5-28f4-ec472da7f521	Arhivalija-read	Arhivalija - branje	t
00030000-562f-62e5-931d-4a6d1ff94f68	Arhivalija-write	Arhivalija - spreminjanje	t
00030000-562f-62e5-c04c-36235ec320a7	AvtorBesedila-read	AvtorBesedila - branje	t
00030000-562f-62e5-7c90-e1e39b046cce	AvtorBesedila-write	AvtorBesedila - spreminjanje	t
00030000-562f-62e5-6f65-200f7639521d	Besedilo-read	Besedilo - branje	t
00030000-562f-62e5-a56e-93ef91896314	Besedilo-write	Besedilo - spreminjanje	t
00030000-562f-62e5-e8b3-8f522e848e2d	DogodekIzven-read	DogodekIzven - branje	t
00030000-562f-62e5-776d-c71d56969fec	DogodekIzven-write	DogodekIzven - spreminjanje	t
00030000-562f-62e5-dc9c-80b92bbaf383	Dogodek-read	Dogodek - branje	t
00030000-562f-62e5-9e47-e98343ce1377	Dogodek-write	Dogodek - spreminjanje	t
00030000-562f-62e5-0dfd-09e4190fec49	DrugiVir-read	DrugiVir - branje	t
00030000-562f-62e5-8e51-0b2a18892d25	DrugiVir-write	DrugiVir - spreminjanje	t
00030000-562f-62e5-8f8a-ec9b488c8d26	Drzava-read	Drzava - branje	t
00030000-562f-62e5-119c-bb60b142e026	Drzava-write	Drzava - spreminjanje	t
00030000-562f-62e5-d5ba-763da3ab8794	EnotaPrograma-read	EnotaPrograma - branje	t
00030000-562f-62e5-072a-2e853300989d	EnotaPrograma-write	EnotaPrograma - spreminjanje	t
00030000-562f-62e5-e65d-a6f2b1c84722	Funkcija-read	Funkcija - branje	t
00030000-562f-62e5-c9d0-0f47caee431b	Funkcija-write	Funkcija - spreminjanje	t
00030000-562f-62e5-5d8e-9fe86371d743	Gostovanje-read	Gostovanje - branje	t
00030000-562f-62e5-6484-bd87c58d9b51	Gostovanje-write	Gostovanje - spreminjanje	t
00030000-562f-62e5-faa2-cf931bed3401	Gostujoca-read	Gostujoca - branje	t
00030000-562f-62e5-0d43-25a37e6463bf	Gostujoca-write	Gostujoca - spreminjanje	t
00030000-562f-62e5-09b8-aeeaf7a49af9	KontaktnaOseba-read	KontaktnaOseba - branje	t
00030000-562f-62e5-148c-a496e66163db	KontaktnaOseba-write	KontaktnaOseba - spreminjanje	t
00030000-562f-62e5-50d2-794fb0897c39	Kupec-read	Kupec - branje	t
00030000-562f-62e5-2b72-e7368f578d49	Kupec-write	Kupec - spreminjanje	t
00030000-562f-62e5-a6c5-c9335c069971	NacinPlacina-read	NacinPlacina - branje	t
00030000-562f-62e5-cfd1-d0c7c19914d9	NacinPlacina-write	NacinPlacina - spreminjanje	t
00030000-562f-62e5-1da8-0fdcf4fc7fb1	Option-read	Option - branje	t
00030000-562f-62e5-8af6-c01cf4032ba5	Option-write	Option - spreminjanje	t
00030000-562f-62e5-b429-a605f112f4ee	OptionValue-read	OptionValue - branje	t
00030000-562f-62e5-9e85-96fe79be0611	OptionValue-write	OptionValue - spreminjanje	t
00030000-562f-62e5-17e1-941a83d28493	OrganizacijskaEnota-read	OrganizacijskaEnota - branje	t
00030000-562f-62e5-9ea3-29ff71331486	OrganizacijskaEnota-write	OrganizacijskaEnota - spreminjanje	t
00030000-562f-62e5-d91f-f010eb08cb3d	Oseba-read	Oseba - branje	t
00030000-562f-62e5-36f7-cb2ec3da6c99	Oseba-write	Oseba - spreminjanje	t
00030000-562f-62e5-0864-14739442cf34	PlacilniInstrument-read	PlacilniInstrument - branje	t
00030000-562f-62e5-b2d7-523e953f0e08	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	t
00030000-562f-62e5-e35b-019e4328f868	PodrocjeSedenja-read	PodrocjeSedenja - branje	t
00030000-562f-62e5-dca7-c2ad1dab44a9	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	t
00030000-562f-62e5-07a3-782c86372470	Pogodba-read	Pogodba - branje	t
00030000-562f-62e5-db26-d76799737ad3	Pogodba-write	Pogodba - spreminjanje	t
00030000-562f-62e5-fd46-3cdb9a6743c3	Popa-read	Popa - branje	t
00030000-562f-62e5-6fa6-b244b416b12c	Popa-write	Popa - spreminjanje	t
00030000-562f-62e5-07bf-3232690c0acf	Posta-read	Posta - branje	t
00030000-562f-62e5-7964-bfcfb21e40ad	Posta-write	Posta - spreminjanje	t
00030000-562f-62e5-e354-9b9228784380	PostavkaCDve-read	PostavkaCDve - branje	t
00030000-562f-62e5-e6b4-bb330bf5d7e5	PostavkaCDve-write	PostavkaCDve - spreminjanje	t
00030000-562f-62e5-24e9-e133e3c52bf6	PostavkaRacuna-read	PostavkaRacuna - branje	t
00030000-562f-62e5-045b-fcc29655cb6c	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	t
00030000-562f-62e5-98b1-88155719435c	PostniNaslov-read	PostniNaslov - branje	t
00030000-562f-62e5-064b-d59d3ef15335	PostniNaslov-write	PostniNaslov - spreminjanje	t
00030000-562f-62e5-c4ee-d9644e1e31c8	Predstava-read	Predstava - branje	t
00030000-562f-62e5-4152-bf5e96dc85df	Predstava-write	Predstava - spreminjanje	t
00030000-562f-62e5-a951-18ec7248b059	Praznik-read	Praznik - branje	t
00030000-562f-62e5-9a7b-b3653aca49e3	Praznik-write	Praznik - spreminjanje	t
00030000-562f-62e5-9afc-ab0d7df31cff	ProdajaPredstave-read	ProdajaPredstave - branje	t
00030000-562f-62e5-b81c-5c402d073179	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	t
00030000-562f-62e5-44b3-dd01df2e5412	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	t
00030000-562f-62e5-3b37-94ed0630cce9	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	t
00030000-562f-62e5-6a66-c701ff9443d5	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	t
00030000-562f-62e5-4dfc-6c3703d098df	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	t
00030000-562f-62e5-ae9f-c2a36f944618	ProgramDela-read	ProgramDela - branje	t
00030000-562f-62e5-98aa-d60bf3a576f5	ProgramDela-write	ProgramDela - spreminjanje	t
00030000-562f-62e5-496d-72e2075b35fe	ProgramFestival-read	ProgramFestival - branje	t
00030000-562f-62e5-c684-a46a80fbfe45	ProgramFestival-write	ProgramFestival - spreminjanje	t
00030000-562f-62e5-3ceb-db1f564fff9b	ProgramGostovanje-read	ProgramGostovanje - branje	t
00030000-562f-62e5-cc27-5ec7ac301e7b	ProgramGostovanje-write	ProgramGostovanje - spreminjanje	t
00030000-562f-62e5-d806-178aeda8bd76	ProgramGostujoca-read	ProgramGostujoca - branje	t
00030000-562f-62e5-24f7-02e3cf20f58b	ProgramGostujoca-write	ProgramGostujoca - spreminjanje	t
00030000-562f-62e5-36e1-bba480472dac	ProgramIzjemni-read	ProgramIzjemni - branje	t
00030000-562f-62e5-45b0-96b5bf35a99a	ProgramIzjemni-write	ProgramIzjemni - spreminjanje	t
00030000-562f-62e5-f050-1d74d507e84c	ProgramPonovitevPrejsnjih-read	ProgramPonovitevPrejsnjih - branje	t
00030000-562f-62e5-ff7f-02845c3a1447	ProgramPonovitevPrejsnjih-write	ProgramPonovitevPrejsnjih - spreminjanje	t
00030000-562f-62e5-71fb-ef536b99fe4c	ProgramPonovitevPremiere-read	ProgramPonovitevPremiere - branje	t
00030000-562f-62e5-68ae-77e52fb809aa	ProgramPonovitevPremiere-write	ProgramPonovitevPremiere - spreminjanje	t
00030000-562f-62e5-fea1-288a50c13f17	ProgramPremiera-read	ProgramPremiera - branje	t
00030000-562f-62e5-c6aa-284796d88011	ProgramPremiera-write	ProgramPremiera - spreminjanje	t
00030000-562f-62e5-52e5-e96d33694daf	ProgramRazno-read	ProgramRazno - branje	t
00030000-562f-62e5-6c32-77870ab9ad89	ProgramRazno-write	ProgramRazno - spreminjanje	t
00030000-562f-62e5-9fe8-e5982e0c038c	ProgramskaEnotaSklopa-read	ProgramskaEnotaSklopa - branje	t
00030000-562f-62e5-a388-b1c91e1e12ce	ProgramskaEnotaSklopa-write	ProgramskaEnotaSklopa - spreminjanje	t
00030000-562f-62e5-0136-5b53408edf5b	Prostor-read	Prostor - branje	t
00030000-562f-62e5-c5d4-6ab475eeae11	Prostor-write	Prostor - spreminjanje	t
00030000-562f-62e5-8313-978e376ed1df	Racun-read	Racun - branje	t
00030000-562f-62e5-f54b-bd8ab6092bae	Racun-write	Racun - spreminjanje	t
00030000-562f-62e5-3452-2309bf308c73	RazpisanSedez-read	RazpisanSedez - branje	t
00030000-562f-62e5-c2f3-bed57526a6d1	RazpisanSedez-write	RazpisanSedez - spreminjanje	t
00030000-562f-62e5-f7af-8c513e4ebd77	Rekviziterstvo-read	Rekviziterstvo - branje	t
00030000-562f-62e5-fa0a-b5959b723f65	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	t
00030000-562f-62e5-7b3e-dadc0845132f	Rekvizit-read	Rekvizit - branje	t
00030000-562f-62e5-5a65-534e0bef2bd1	Rekvizit-write	Rekvizit - spreminjanje	t
00030000-562f-62e5-db5b-2738e904d776	Revizija-read	Revizija - branje	t
00030000-562f-62e5-8a1c-1ee3f7c7e116	Revizija-write	Revizija - spreminjanje	t
00030000-562f-62e5-5948-26d85fc8a89f	Rezervacija-read	Rezervacija - branje	t
00030000-562f-62e5-dacd-de1e68dffe7a	Rezervacija-write	Rezervacija - spreminjanje	t
00030000-562f-62e5-fbe3-5aaa5de46440	SedezniRed-read	SedezniRed - branje	t
00030000-562f-62e5-4a7e-6073ac57ad89	SedezniRed-write	SedezniRed - spreminjanje	t
00030000-562f-62e5-c1df-86b755d30e8b	Sedez-read	Sedez - branje	t
00030000-562f-62e5-6b86-a163a585868a	Sedez-write	Sedez - spreminjanje	t
00030000-562f-62e5-201f-ada4558e4cfc	Sezona-read	Sezona - branje	t
00030000-562f-62e5-83b4-ff0e2705a323	Sezona-write	Sezona - spreminjanje	t
00030000-562f-62e5-2184-0364fa67b400	StevilcenjeKonfig-read	StevilcenjeKonfig - branje	t
00030000-562f-62e5-890b-3b0cfdd229e3	StevilcenjeKonfig-write	StevilcenjeKonfig - spreminjanje	t
00030000-562f-62e5-c56d-da574fa534c9	Stevilcenje-read	Stevilcenje - branje	t
00030000-562f-62e5-8dd8-87760ac12b0d	Stevilcenje-write	Stevilcenje - spreminjanje	t
00030000-562f-62e5-97f5-c85839b940db	StevilcenjeStanje-read	StevilcenjeStanje - branje	t
00030000-562f-62e5-f2e9-43936a9d4825	StevilcenjeStanje-write	StevilcenjeStanje - spreminjanje	t
00030000-562f-62e5-33f7-37f8f1220e8e	StrosekUprizoritve-read	StrosekUprizoritve - branje	t
00030000-562f-62e5-dcc1-134472b336db	StrosekUprizoritve-write	StrosekUprizoritve - spreminjanje	t
00030000-562f-62e5-eeb0-26d0f1b4b4e0	Telefonska-read	Telefonska - branje	t
00030000-562f-62e5-c539-d7b0cbc80a2d	Telefonska-write	Telefonska - spreminjanje	t
00030000-562f-62e5-2c9b-57d2d2c9e8f2	TerminStoritve-read	TerminStoritve - branje	t
00030000-562f-62e5-de78-3843a99bd2dd	TerminStoritve-write	TerminStoritve - spreminjanje	t
00030000-562f-62e5-b03e-f121b59a764b	TipFunkcije-read	TipFunkcije - branje	t
00030000-562f-62e5-7a27-d3df2af655bf	TipFunkcije-write	TipFunkcije - spreminjanje	t
00030000-562f-62e5-c1cb-97d9dbc22a6f	TipPopa-read	TipPopa - branje	t
00030000-562f-62e5-aae2-4a7daec7be67	TipPopa-write	TipPopa - spreminjanje	t
00030000-562f-62e5-d452-9969312106c1	TipProgramskeEnote-read	TipProgramskeEnote - branje	t
00030000-562f-62e5-da02-3d9ef1820c10	TipProgramskeEnote-write	TipProgramskeEnote - spreminjanje	t
00030000-562f-62e5-372e-36b0ce74d2e4	TipVaje-read	TipVaje - branje	t
00030000-562f-62e5-64b5-be4a1a5bd4ff	TipVaje-write	TipVaje - spreminjanje	t
00030000-562f-62e5-f272-b51b675ba62d	Trr-read	Trr - branje	t
00030000-562f-62e5-b936-67dc0160f5d2	Trr-write	Trr - spreminjanje	t
00030000-562f-62e5-ecb5-8ff424799288	Uprizoritev-read	Uprizoritev - branje	t
00030000-562f-62e5-85ce-e61226bf973c	Uprizoritev-write	Uprizoritev - spreminjanje	t
00030000-562f-62e5-09a7-05da626a13fd	Vaja-read	Vaja - branje	t
00030000-562f-62e5-f1a9-7f1b464c7f63	Vaja-write	Vaja - spreminjanje	t
00030000-562f-62e5-79e9-1c8f5489da73	VrstaSedezev-read	VrstaSedezev - branje	t
00030000-562f-62e5-e3ce-6ae26bba2a4c	VrstaSedezev-write	VrstaSedezev - spreminjanje	t
00030000-562f-62e5-1f9c-b9bc587806ed	VrstaStroska-read	VrstaStroska - branje	t
00030000-562f-62e5-1683-e4a71382cbfe	VrstaStroska-write	VrstaStroska - spreminjanje	t
00030000-562f-62e5-cb30-313ff03e9bef	Zaposlitev-read	Zaposlitev - branje	t
00030000-562f-62e5-6d74-1f4337187068	Zaposlitev-write	Zaposlitev - spreminjanje	t
00030000-562f-62e5-62df-f0e3ec25423c	Zasedenost-read	Zasedenost - branje	t
00030000-562f-62e5-d1a0-524f9df1d418	Zasedenost-write	Zasedenost - spreminjanje	t
00030000-562f-62e5-b27b-2dfcc394dea5	ZvrstSurs-read	ZvrstSurs - branje	t
00030000-562f-62e5-f64b-8006419ee85b	ZvrstSurs-write	ZvrstSurs - spreminjanje	t
00030000-562f-62e5-c265-01d0911e6fb4	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	t
00030000-562f-62e5-2013-ff2b433b1251	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	t
00030000-562f-62e5-886e-ddce50c13fa3	Job-read	Branje opravil - samo zase - branje	t
00030000-562f-62e5-f11f-c82f9a1c5b84	Job-write	Dodajanje in spreminjanje opravil - samo zase	t
00030000-562f-62e5-f642-bddf7de2bfcd	Job-admin	Upravljanje opravil za vse uporabnike	t
00030000-562f-62e5-3ccc-75f095569c04	Mapa-write	Mapa - osnovno dovoljenje za pisanje	t
00030000-562f-62e5-aa0c-1f12ee6e0a4b	Mapa-read	Mapa - osnovno dovoljenje za branje	t
00030000-562f-62e5-359d-13850023317d	MapaAcl-write	MapaAcl - dovoljenje za dostop pisanje ACL-jev mape	t
00030000-562f-62e5-a794-7023b1c8e120	MapaAcl-read	MapaAcl - dovoljenje za dostop branje ACL-jev mape	t
00030000-562f-62e5-ed4f-2cd96d92f1a5	Zapis-write	Zapis - dovoljenje za pisanje zapisov	t
00030000-562f-62e5-edde-4d833ca87220	Zapis-read	Zapis - dovoljenje za pisanje zapisov	t
00030000-562f-62e5-b68d-7798b270b158	ZapisLastnik-write	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	t
00030000-562f-62e5-2c42-e3bdcc0076d2	ZapisLastnik-read	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	t
00030000-562f-62e5-5eed-f12d0fb2692c	VrstaZapisa-write	Šifrant vrst zapisa - spreminjanje	t
00030000-562f-62e5-638a-8e988eaf3d72	VrstaZapisa-read	Šifrant vrst zapisa - branje	t
00030000-562f-62e5-11b8-2fe8deb9da0c	Datoteka-write	Datoteka - spreminjanje	t
00030000-562f-62e5-1153-243e9dd853c9	Datoteka-read	Datoteke - branje	t
\.


--
-- TOC entry 3057 (class 0 OID 23507615)
-- Dependencies: 179
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-562f-62e6-a241-926879cbf849	00030000-562f-62e5-3072-78b2a79fe9a4
00020000-562f-62e6-1dd0-55e70ae0ef1f	00030000-562f-62e5-8f8a-ec9b488c8d26
00020000-562f-62e6-8a24-349356b3fd93	00030000-562f-62e5-3a69-da00bf50c4ad
00020000-562f-62e6-8a24-349356b3fd93	00030000-562f-62e5-d05e-66d2deaf9fb9
00020000-562f-62e6-8a24-349356b3fd93	00030000-562f-62e5-b5da-09bff392bdcf
00020000-562f-62e6-8a24-349356b3fd93	00030000-562f-62e5-eec2-4f13d8c7a0e5
00020000-562f-62e6-8a24-349356b3fd93	00030000-562f-62e5-28f4-ec472da7f521
00020000-562f-62e6-8a24-349356b3fd93	00030000-562f-62e5-dc9c-80b92bbaf383
00020000-562f-62e6-8a24-349356b3fd93	00030000-562f-62e5-e5ed-ed3518434387
00020000-562f-62e6-8a24-349356b3fd93	00030000-562f-62e5-9e47-e98343ce1377
00020000-562f-62e6-8a24-349356b3fd93	00030000-562f-62e5-8f8a-ec9b488c8d26
00020000-562f-62e6-8a24-349356b3fd93	00030000-562f-62e5-119c-bb60b142e026
00020000-562f-62e6-8a24-349356b3fd93	00030000-562f-62e5-e65d-a6f2b1c84722
00020000-562f-62e6-8a24-349356b3fd93	00030000-562f-62e5-c9d0-0f47caee431b
00020000-562f-62e6-8a24-349356b3fd93	00030000-562f-62e5-5d8e-9fe86371d743
00020000-562f-62e6-8a24-349356b3fd93	00030000-562f-62e5-6484-bd87c58d9b51
00020000-562f-62e6-8a24-349356b3fd93	00030000-562f-62e5-faa2-cf931bed3401
00020000-562f-62e6-8a24-349356b3fd93	00030000-562f-62e5-0d43-25a37e6463bf
00020000-562f-62e6-8a24-349356b3fd93	00030000-562f-62e5-09b8-aeeaf7a49af9
00020000-562f-62e6-8a24-349356b3fd93	00030000-562f-62e5-148c-a496e66163db
00020000-562f-62e6-8a24-349356b3fd93	00030000-562f-62e5-1da8-0fdcf4fc7fb1
00020000-562f-62e6-8a24-349356b3fd93	00030000-562f-62e5-b429-a605f112f4ee
00020000-562f-62e6-8a24-349356b3fd93	00030000-562f-62e5-d91f-f010eb08cb3d
00020000-562f-62e6-8a24-349356b3fd93	00030000-562f-62e5-36f7-cb2ec3da6c99
00020000-562f-62e6-8a24-349356b3fd93	00030000-562f-62e5-fd46-3cdb9a6743c3
00020000-562f-62e6-8a24-349356b3fd93	00030000-562f-62e5-6fa6-b244b416b12c
00020000-562f-62e6-8a24-349356b3fd93	00030000-562f-62e5-07bf-3232690c0acf
00020000-562f-62e6-8a24-349356b3fd93	00030000-562f-62e5-7964-bfcfb21e40ad
00020000-562f-62e6-8a24-349356b3fd93	00030000-562f-62e5-98b1-88155719435c
00020000-562f-62e6-8a24-349356b3fd93	00030000-562f-62e5-064b-d59d3ef15335
00020000-562f-62e6-8a24-349356b3fd93	00030000-562f-62e5-c4ee-d9644e1e31c8
00020000-562f-62e6-8a24-349356b3fd93	00030000-562f-62e5-4152-bf5e96dc85df
00020000-562f-62e6-8a24-349356b3fd93	00030000-562f-62e5-6a66-c701ff9443d5
00020000-562f-62e6-8a24-349356b3fd93	00030000-562f-62e5-4dfc-6c3703d098df
00020000-562f-62e6-8a24-349356b3fd93	00030000-562f-62e5-0136-5b53408edf5b
00020000-562f-62e6-8a24-349356b3fd93	00030000-562f-62e5-c5d4-6ab475eeae11
00020000-562f-62e6-8a24-349356b3fd93	00030000-562f-62e5-f7af-8c513e4ebd77
00020000-562f-62e6-8a24-349356b3fd93	00030000-562f-62e5-fa0a-b5959b723f65
00020000-562f-62e6-8a24-349356b3fd93	00030000-562f-62e5-7b3e-dadc0845132f
00020000-562f-62e6-8a24-349356b3fd93	00030000-562f-62e5-5a65-534e0bef2bd1
00020000-562f-62e6-8a24-349356b3fd93	00030000-562f-62e5-201f-ada4558e4cfc
00020000-562f-62e6-8a24-349356b3fd93	00030000-562f-62e5-83b4-ff0e2705a323
00020000-562f-62e6-8a24-349356b3fd93	00030000-562f-62e5-b03e-f121b59a764b
00020000-562f-62e6-8a24-349356b3fd93	00030000-562f-62e5-ecb5-8ff424799288
00020000-562f-62e6-8a24-349356b3fd93	00030000-562f-62e5-85ce-e61226bf973c
00020000-562f-62e6-8a24-349356b3fd93	00030000-562f-62e5-09a7-05da626a13fd
00020000-562f-62e6-8a24-349356b3fd93	00030000-562f-62e5-f1a9-7f1b464c7f63
00020000-562f-62e6-8a24-349356b3fd93	00030000-562f-62e5-62df-f0e3ec25423c
00020000-562f-62e6-8a24-349356b3fd93	00030000-562f-62e5-d1a0-524f9df1d418
00020000-562f-62e6-8a24-349356b3fd93	00030000-562f-62e5-b27b-2dfcc394dea5
00020000-562f-62e6-8a24-349356b3fd93	00030000-562f-62e5-c265-01d0911e6fb4
00020000-562f-62e6-c048-5cbd3c62d189	00030000-562f-62e5-3a69-da00bf50c4ad
00020000-562f-62e6-c048-5cbd3c62d189	00030000-562f-62e5-28f4-ec472da7f521
00020000-562f-62e6-c048-5cbd3c62d189	00030000-562f-62e5-dc9c-80b92bbaf383
00020000-562f-62e6-c048-5cbd3c62d189	00030000-562f-62e5-8f8a-ec9b488c8d26
00020000-562f-62e6-c048-5cbd3c62d189	00030000-562f-62e5-5d8e-9fe86371d743
00020000-562f-62e6-c048-5cbd3c62d189	00030000-562f-62e5-faa2-cf931bed3401
00020000-562f-62e6-c048-5cbd3c62d189	00030000-562f-62e5-09b8-aeeaf7a49af9
00020000-562f-62e6-c048-5cbd3c62d189	00030000-562f-62e5-148c-a496e66163db
00020000-562f-62e6-c048-5cbd3c62d189	00030000-562f-62e5-1da8-0fdcf4fc7fb1
00020000-562f-62e6-c048-5cbd3c62d189	00030000-562f-62e5-b429-a605f112f4ee
00020000-562f-62e6-c048-5cbd3c62d189	00030000-562f-62e5-d91f-f010eb08cb3d
00020000-562f-62e6-c048-5cbd3c62d189	00030000-562f-62e5-36f7-cb2ec3da6c99
00020000-562f-62e6-c048-5cbd3c62d189	00030000-562f-62e5-fd46-3cdb9a6743c3
00020000-562f-62e6-c048-5cbd3c62d189	00030000-562f-62e5-07bf-3232690c0acf
00020000-562f-62e6-c048-5cbd3c62d189	00030000-562f-62e5-98b1-88155719435c
00020000-562f-62e6-c048-5cbd3c62d189	00030000-562f-62e5-064b-d59d3ef15335
00020000-562f-62e6-c048-5cbd3c62d189	00030000-562f-62e5-c4ee-d9644e1e31c8
00020000-562f-62e6-c048-5cbd3c62d189	00030000-562f-62e5-0136-5b53408edf5b
00020000-562f-62e6-c048-5cbd3c62d189	00030000-562f-62e5-f7af-8c513e4ebd77
00020000-562f-62e6-c048-5cbd3c62d189	00030000-562f-62e5-7b3e-dadc0845132f
00020000-562f-62e6-c048-5cbd3c62d189	00030000-562f-62e5-201f-ada4558e4cfc
00020000-562f-62e6-c048-5cbd3c62d189	00030000-562f-62e5-eeb0-26d0f1b4b4e0
00020000-562f-62e6-c048-5cbd3c62d189	00030000-562f-62e5-c539-d7b0cbc80a2d
00020000-562f-62e6-c048-5cbd3c62d189	00030000-562f-62e5-f272-b51b675ba62d
00020000-562f-62e6-c048-5cbd3c62d189	00030000-562f-62e5-b936-67dc0160f5d2
00020000-562f-62e6-c048-5cbd3c62d189	00030000-562f-62e5-cb30-313ff03e9bef
00020000-562f-62e6-c048-5cbd3c62d189	00030000-562f-62e5-6d74-1f4337187068
00020000-562f-62e6-c048-5cbd3c62d189	00030000-562f-62e5-b27b-2dfcc394dea5
00020000-562f-62e6-c048-5cbd3c62d189	00030000-562f-62e5-c265-01d0911e6fb4
00020000-562f-62e6-60bd-3e65ec5a553c	00030000-562f-62e5-3a69-da00bf50c4ad
00020000-562f-62e6-60bd-3e65ec5a553c	00030000-562f-62e5-b5da-09bff392bdcf
00020000-562f-62e6-60bd-3e65ec5a553c	00030000-562f-62e5-28f4-ec472da7f521
00020000-562f-62e6-60bd-3e65ec5a553c	00030000-562f-62e5-931d-4a6d1ff94f68
00020000-562f-62e6-60bd-3e65ec5a553c	00030000-562f-62e5-6f65-200f7639521d
00020000-562f-62e6-60bd-3e65ec5a553c	00030000-562f-62e5-e8b3-8f522e848e2d
00020000-562f-62e6-60bd-3e65ec5a553c	00030000-562f-62e5-dc9c-80b92bbaf383
00020000-562f-62e6-60bd-3e65ec5a553c	00030000-562f-62e5-8f8a-ec9b488c8d26
00020000-562f-62e6-60bd-3e65ec5a553c	00030000-562f-62e5-e65d-a6f2b1c84722
00020000-562f-62e6-60bd-3e65ec5a553c	00030000-562f-62e5-5d8e-9fe86371d743
00020000-562f-62e6-60bd-3e65ec5a553c	00030000-562f-62e5-faa2-cf931bed3401
00020000-562f-62e6-60bd-3e65ec5a553c	00030000-562f-62e5-09b8-aeeaf7a49af9
00020000-562f-62e6-60bd-3e65ec5a553c	00030000-562f-62e5-1da8-0fdcf4fc7fb1
00020000-562f-62e6-60bd-3e65ec5a553c	00030000-562f-62e5-b429-a605f112f4ee
00020000-562f-62e6-60bd-3e65ec5a553c	00030000-562f-62e5-d91f-f010eb08cb3d
00020000-562f-62e6-60bd-3e65ec5a553c	00030000-562f-62e5-fd46-3cdb9a6743c3
00020000-562f-62e6-60bd-3e65ec5a553c	00030000-562f-62e5-07bf-3232690c0acf
00020000-562f-62e6-60bd-3e65ec5a553c	00030000-562f-62e5-c4ee-d9644e1e31c8
00020000-562f-62e6-60bd-3e65ec5a553c	00030000-562f-62e5-6a66-c701ff9443d5
00020000-562f-62e6-60bd-3e65ec5a553c	00030000-562f-62e5-0136-5b53408edf5b
00020000-562f-62e6-60bd-3e65ec5a553c	00030000-562f-62e5-f7af-8c513e4ebd77
00020000-562f-62e6-60bd-3e65ec5a553c	00030000-562f-62e5-7b3e-dadc0845132f
00020000-562f-62e6-60bd-3e65ec5a553c	00030000-562f-62e5-201f-ada4558e4cfc
00020000-562f-62e6-60bd-3e65ec5a553c	00030000-562f-62e5-b03e-f121b59a764b
00020000-562f-62e6-60bd-3e65ec5a553c	00030000-562f-62e5-09a7-05da626a13fd
00020000-562f-62e6-60bd-3e65ec5a553c	00030000-562f-62e5-62df-f0e3ec25423c
00020000-562f-62e6-60bd-3e65ec5a553c	00030000-562f-62e5-b27b-2dfcc394dea5
00020000-562f-62e6-60bd-3e65ec5a553c	00030000-562f-62e5-c265-01d0911e6fb4
00020000-562f-62e6-f4b1-152588febcb2	00030000-562f-62e5-3a69-da00bf50c4ad
00020000-562f-62e6-f4b1-152588febcb2	00030000-562f-62e5-d05e-66d2deaf9fb9
00020000-562f-62e6-f4b1-152588febcb2	00030000-562f-62e5-eec2-4f13d8c7a0e5
00020000-562f-62e6-f4b1-152588febcb2	00030000-562f-62e5-28f4-ec472da7f521
00020000-562f-62e6-f4b1-152588febcb2	00030000-562f-62e5-dc9c-80b92bbaf383
00020000-562f-62e6-f4b1-152588febcb2	00030000-562f-62e5-8f8a-ec9b488c8d26
00020000-562f-62e6-f4b1-152588febcb2	00030000-562f-62e5-5d8e-9fe86371d743
00020000-562f-62e6-f4b1-152588febcb2	00030000-562f-62e5-faa2-cf931bed3401
00020000-562f-62e6-f4b1-152588febcb2	00030000-562f-62e5-1da8-0fdcf4fc7fb1
00020000-562f-62e6-f4b1-152588febcb2	00030000-562f-62e5-b429-a605f112f4ee
00020000-562f-62e6-f4b1-152588febcb2	00030000-562f-62e5-fd46-3cdb9a6743c3
00020000-562f-62e6-f4b1-152588febcb2	00030000-562f-62e5-07bf-3232690c0acf
00020000-562f-62e6-f4b1-152588febcb2	00030000-562f-62e5-c4ee-d9644e1e31c8
00020000-562f-62e6-f4b1-152588febcb2	00030000-562f-62e5-0136-5b53408edf5b
00020000-562f-62e6-f4b1-152588febcb2	00030000-562f-62e5-f7af-8c513e4ebd77
00020000-562f-62e6-f4b1-152588febcb2	00030000-562f-62e5-7b3e-dadc0845132f
00020000-562f-62e6-f4b1-152588febcb2	00030000-562f-62e5-201f-ada4558e4cfc
00020000-562f-62e6-f4b1-152588febcb2	00030000-562f-62e5-b03e-f121b59a764b
00020000-562f-62e6-f4b1-152588febcb2	00030000-562f-62e5-b27b-2dfcc394dea5
00020000-562f-62e6-f4b1-152588febcb2	00030000-562f-62e5-c265-01d0911e6fb4
00020000-562f-62e6-8740-9d9b885c4ca5	00030000-562f-62e5-3a69-da00bf50c4ad
00020000-562f-62e6-8740-9d9b885c4ca5	00030000-562f-62e5-28f4-ec472da7f521
00020000-562f-62e6-8740-9d9b885c4ca5	00030000-562f-62e5-dc9c-80b92bbaf383
00020000-562f-62e6-8740-9d9b885c4ca5	00030000-562f-62e5-8f8a-ec9b488c8d26
00020000-562f-62e6-8740-9d9b885c4ca5	00030000-562f-62e5-5d8e-9fe86371d743
00020000-562f-62e6-8740-9d9b885c4ca5	00030000-562f-62e5-faa2-cf931bed3401
00020000-562f-62e6-8740-9d9b885c4ca5	00030000-562f-62e5-1da8-0fdcf4fc7fb1
00020000-562f-62e6-8740-9d9b885c4ca5	00030000-562f-62e5-b429-a605f112f4ee
00020000-562f-62e6-8740-9d9b885c4ca5	00030000-562f-62e5-fd46-3cdb9a6743c3
00020000-562f-62e6-8740-9d9b885c4ca5	00030000-562f-62e5-07bf-3232690c0acf
00020000-562f-62e6-8740-9d9b885c4ca5	00030000-562f-62e5-c4ee-d9644e1e31c8
00020000-562f-62e6-8740-9d9b885c4ca5	00030000-562f-62e5-0136-5b53408edf5b
00020000-562f-62e6-8740-9d9b885c4ca5	00030000-562f-62e5-f7af-8c513e4ebd77
00020000-562f-62e6-8740-9d9b885c4ca5	00030000-562f-62e5-7b3e-dadc0845132f
00020000-562f-62e6-8740-9d9b885c4ca5	00030000-562f-62e5-201f-ada4558e4cfc
00020000-562f-62e6-8740-9d9b885c4ca5	00030000-562f-62e5-2c9b-57d2d2c9e8f2
00020000-562f-62e6-8740-9d9b885c4ca5	00030000-562f-62e5-34f8-87c3b5df695c
00020000-562f-62e6-8740-9d9b885c4ca5	00030000-562f-62e5-b03e-f121b59a764b
00020000-562f-62e6-8740-9d9b885c4ca5	00030000-562f-62e5-b27b-2dfcc394dea5
00020000-562f-62e6-8740-9d9b885c4ca5	00030000-562f-62e5-c265-01d0911e6fb4
00020000-562f-62e7-ddbb-7a547055a678	00030000-562f-62e5-4b69-f35cfff8df19
00020000-562f-62e7-ddbb-7a547055a678	00030000-562f-62e5-3072-78b2a79fe9a4
00020000-562f-62e7-ddbb-7a547055a678	00030000-562f-62e5-3a69-da00bf50c4ad
00020000-562f-62e7-ddbb-7a547055a678	00030000-562f-62e5-d05e-66d2deaf9fb9
00020000-562f-62e7-ddbb-7a547055a678	00030000-562f-62e5-b5da-09bff392bdcf
00020000-562f-62e7-ddbb-7a547055a678	00030000-562f-62e5-eec2-4f13d8c7a0e5
00020000-562f-62e7-ddbb-7a547055a678	00030000-562f-62e5-28f4-ec472da7f521
00020000-562f-62e7-ddbb-7a547055a678	00030000-562f-62e5-931d-4a6d1ff94f68
00020000-562f-62e7-ddbb-7a547055a678	00030000-562f-62e5-c04c-36235ec320a7
00020000-562f-62e7-ddbb-7a547055a678	00030000-562f-62e5-7c90-e1e39b046cce
00020000-562f-62e7-ddbb-7a547055a678	00030000-562f-62e5-6f65-200f7639521d
00020000-562f-62e7-ddbb-7a547055a678	00030000-562f-62e5-a56e-93ef91896314
00020000-562f-62e7-ddbb-7a547055a678	00030000-562f-62e5-e8b3-8f522e848e2d
00020000-562f-62e7-ddbb-7a547055a678	00030000-562f-62e5-776d-c71d56969fec
00020000-562f-62e7-ddbb-7a547055a678	00030000-562f-62e5-dc9c-80b92bbaf383
00020000-562f-62e7-ddbb-7a547055a678	00030000-562f-62e5-e5ed-ed3518434387
00020000-562f-62e7-ddbb-7a547055a678	00030000-562f-62e5-9e47-e98343ce1377
00020000-562f-62e7-ddbb-7a547055a678	00030000-562f-62e5-0dfd-09e4190fec49
00020000-562f-62e7-ddbb-7a547055a678	00030000-562f-62e5-8e51-0b2a18892d25
00020000-562f-62e7-ddbb-7a547055a678	00030000-562f-62e5-8f8a-ec9b488c8d26
00020000-562f-62e7-ddbb-7a547055a678	00030000-562f-62e5-119c-bb60b142e026
00020000-562f-62e7-ddbb-7a547055a678	00030000-562f-62e5-d5ba-763da3ab8794
00020000-562f-62e7-ddbb-7a547055a678	00030000-562f-62e5-072a-2e853300989d
00020000-562f-62e7-ddbb-7a547055a678	00030000-562f-62e5-e65d-a6f2b1c84722
00020000-562f-62e7-ddbb-7a547055a678	00030000-562f-62e5-c9d0-0f47caee431b
00020000-562f-62e7-ddbb-7a547055a678	00030000-562f-62e5-5d8e-9fe86371d743
00020000-562f-62e7-ddbb-7a547055a678	00030000-562f-62e5-6484-bd87c58d9b51
00020000-562f-62e7-ddbb-7a547055a678	00030000-562f-62e5-faa2-cf931bed3401
00020000-562f-62e7-ddbb-7a547055a678	00030000-562f-62e5-0d43-25a37e6463bf
00020000-562f-62e7-ddbb-7a547055a678	00030000-562f-62e5-09b8-aeeaf7a49af9
00020000-562f-62e7-ddbb-7a547055a678	00030000-562f-62e5-148c-a496e66163db
00020000-562f-62e7-ddbb-7a547055a678	00030000-562f-62e5-50d2-794fb0897c39
00020000-562f-62e7-ddbb-7a547055a678	00030000-562f-62e5-2b72-e7368f578d49
00020000-562f-62e7-ddbb-7a547055a678	00030000-562f-62e5-a6c5-c9335c069971
00020000-562f-62e7-ddbb-7a547055a678	00030000-562f-62e5-cfd1-d0c7c19914d9
00020000-562f-62e7-ddbb-7a547055a678	00030000-562f-62e5-1da8-0fdcf4fc7fb1
00020000-562f-62e7-ddbb-7a547055a678	00030000-562f-62e5-b429-a605f112f4ee
00020000-562f-62e7-ddbb-7a547055a678	00030000-562f-62e5-9e85-96fe79be0611
00020000-562f-62e7-ddbb-7a547055a678	00030000-562f-62e5-8af6-c01cf4032ba5
00020000-562f-62e7-ddbb-7a547055a678	00030000-562f-62e5-17e1-941a83d28493
00020000-562f-62e7-ddbb-7a547055a678	00030000-562f-62e5-9ea3-29ff71331486
00020000-562f-62e7-ddbb-7a547055a678	00030000-562f-62e5-d91f-f010eb08cb3d
00020000-562f-62e7-ddbb-7a547055a678	00030000-562f-62e5-59a7-2fa92cfbe575
00020000-562f-62e7-ddbb-7a547055a678	00030000-562f-62e5-36f7-cb2ec3da6c99
00020000-562f-62e7-ddbb-7a547055a678	00030000-562f-62e5-0864-14739442cf34
00020000-562f-62e7-ddbb-7a547055a678	00030000-562f-62e5-b2d7-523e953f0e08
00020000-562f-62e7-ddbb-7a547055a678	00030000-562f-62e5-e35b-019e4328f868
00020000-562f-62e7-ddbb-7a547055a678	00030000-562f-62e5-dca7-c2ad1dab44a9
00020000-562f-62e7-ddbb-7a547055a678	00030000-562f-62e5-07a3-782c86372470
00020000-562f-62e7-ddbb-7a547055a678	00030000-562f-62e5-db26-d76799737ad3
00020000-562f-62e7-ddbb-7a547055a678	00030000-562f-62e5-fd46-3cdb9a6743c3
00020000-562f-62e7-ddbb-7a547055a678	00030000-562f-62e5-6fa6-b244b416b12c
00020000-562f-62e7-ddbb-7a547055a678	00030000-562f-62e5-07bf-3232690c0acf
00020000-562f-62e7-ddbb-7a547055a678	00030000-562f-62e5-e354-9b9228784380
00020000-562f-62e7-ddbb-7a547055a678	00030000-562f-62e5-e6b4-bb330bf5d7e5
00020000-562f-62e7-ddbb-7a547055a678	00030000-562f-62e5-24e9-e133e3c52bf6
00020000-562f-62e7-ddbb-7a547055a678	00030000-562f-62e5-045b-fcc29655cb6c
00020000-562f-62e7-ddbb-7a547055a678	00030000-562f-62e5-7964-bfcfb21e40ad
00020000-562f-62e7-ddbb-7a547055a678	00030000-562f-62e5-98b1-88155719435c
00020000-562f-62e7-ddbb-7a547055a678	00030000-562f-62e5-064b-d59d3ef15335
00020000-562f-62e7-ddbb-7a547055a678	00030000-562f-62e5-a951-18ec7248b059
00020000-562f-62e7-ddbb-7a547055a678	00030000-562f-62e5-9a7b-b3653aca49e3
00020000-562f-62e7-ddbb-7a547055a678	00030000-562f-62e5-c4ee-d9644e1e31c8
00020000-562f-62e7-ddbb-7a547055a678	00030000-562f-62e5-4152-bf5e96dc85df
00020000-562f-62e7-ddbb-7a547055a678	00030000-562f-62e5-9afc-ab0d7df31cff
00020000-562f-62e7-ddbb-7a547055a678	00030000-562f-62e5-b81c-5c402d073179
00020000-562f-62e7-ddbb-7a547055a678	00030000-562f-62e5-44b3-dd01df2e5412
00020000-562f-62e7-ddbb-7a547055a678	00030000-562f-62e5-3b37-94ed0630cce9
00020000-562f-62e7-ddbb-7a547055a678	00030000-562f-62e5-6a66-c701ff9443d5
00020000-562f-62e7-ddbb-7a547055a678	00030000-562f-62e5-4dfc-6c3703d098df
00020000-562f-62e7-ddbb-7a547055a678	00030000-562f-62e5-3dc7-66ffe9dda895
00020000-562f-62e7-ddbb-7a547055a678	00030000-562f-62e5-ae9f-c2a36f944618
00020000-562f-62e7-ddbb-7a547055a678	00030000-562f-62e5-2aa4-40b7be82f73d
00020000-562f-62e7-ddbb-7a547055a678	00030000-562f-62e5-98aa-d60bf3a576f5
00020000-562f-62e7-ddbb-7a547055a678	00030000-562f-62e5-496d-72e2075b35fe
00020000-562f-62e7-ddbb-7a547055a678	00030000-562f-62e5-c684-a46a80fbfe45
00020000-562f-62e7-ddbb-7a547055a678	00030000-562f-62e5-3ceb-db1f564fff9b
00020000-562f-62e7-ddbb-7a547055a678	00030000-562f-62e5-cc27-5ec7ac301e7b
00020000-562f-62e7-ddbb-7a547055a678	00030000-562f-62e5-d806-178aeda8bd76
00020000-562f-62e7-ddbb-7a547055a678	00030000-562f-62e5-24f7-02e3cf20f58b
00020000-562f-62e7-ddbb-7a547055a678	00030000-562f-62e5-36e1-bba480472dac
00020000-562f-62e7-ddbb-7a547055a678	00030000-562f-62e5-45b0-96b5bf35a99a
00020000-562f-62e7-ddbb-7a547055a678	00030000-562f-62e5-f050-1d74d507e84c
00020000-562f-62e7-ddbb-7a547055a678	00030000-562f-62e5-ff7f-02845c3a1447
00020000-562f-62e7-ddbb-7a547055a678	00030000-562f-62e5-71fb-ef536b99fe4c
00020000-562f-62e7-ddbb-7a547055a678	00030000-562f-62e5-68ae-77e52fb809aa
00020000-562f-62e7-ddbb-7a547055a678	00030000-562f-62e5-fea1-288a50c13f17
00020000-562f-62e7-ddbb-7a547055a678	00030000-562f-62e5-c6aa-284796d88011
00020000-562f-62e7-ddbb-7a547055a678	00030000-562f-62e5-52e5-e96d33694daf
00020000-562f-62e7-ddbb-7a547055a678	00030000-562f-62e5-6c32-77870ab9ad89
00020000-562f-62e7-ddbb-7a547055a678	00030000-562f-62e5-9fe8-e5982e0c038c
00020000-562f-62e7-ddbb-7a547055a678	00030000-562f-62e5-a388-b1c91e1e12ce
00020000-562f-62e7-ddbb-7a547055a678	00030000-562f-62e5-0136-5b53408edf5b
00020000-562f-62e7-ddbb-7a547055a678	00030000-562f-62e5-c5d4-6ab475eeae11
00020000-562f-62e7-ddbb-7a547055a678	00030000-562f-62e5-8313-978e376ed1df
00020000-562f-62e7-ddbb-7a547055a678	00030000-562f-62e5-f54b-bd8ab6092bae
00020000-562f-62e7-ddbb-7a547055a678	00030000-562f-62e5-3452-2309bf308c73
00020000-562f-62e7-ddbb-7a547055a678	00030000-562f-62e5-c2f3-bed57526a6d1
00020000-562f-62e7-ddbb-7a547055a678	00030000-562f-62e5-f7af-8c513e4ebd77
00020000-562f-62e7-ddbb-7a547055a678	00030000-562f-62e5-fa0a-b5959b723f65
00020000-562f-62e7-ddbb-7a547055a678	00030000-562f-62e5-7b3e-dadc0845132f
00020000-562f-62e7-ddbb-7a547055a678	00030000-562f-62e5-5a65-534e0bef2bd1
00020000-562f-62e7-ddbb-7a547055a678	00030000-562f-62e5-db5b-2738e904d776
00020000-562f-62e7-ddbb-7a547055a678	00030000-562f-62e5-8a1c-1ee3f7c7e116
00020000-562f-62e7-ddbb-7a547055a678	00030000-562f-62e5-5948-26d85fc8a89f
00020000-562f-62e7-ddbb-7a547055a678	00030000-562f-62e5-dacd-de1e68dffe7a
00020000-562f-62e7-ddbb-7a547055a678	00030000-562f-62e5-fbe3-5aaa5de46440
00020000-562f-62e7-ddbb-7a547055a678	00030000-562f-62e5-4a7e-6073ac57ad89
00020000-562f-62e7-ddbb-7a547055a678	00030000-562f-62e5-c1df-86b755d30e8b
00020000-562f-62e7-ddbb-7a547055a678	00030000-562f-62e5-6b86-a163a585868a
00020000-562f-62e7-ddbb-7a547055a678	00030000-562f-62e5-201f-ada4558e4cfc
00020000-562f-62e7-ddbb-7a547055a678	00030000-562f-62e5-83b4-ff0e2705a323
00020000-562f-62e7-ddbb-7a547055a678	00030000-562f-62e5-2184-0364fa67b400
00020000-562f-62e7-ddbb-7a547055a678	00030000-562f-62e5-890b-3b0cfdd229e3
00020000-562f-62e7-ddbb-7a547055a678	00030000-562f-62e5-c56d-da574fa534c9
00020000-562f-62e7-ddbb-7a547055a678	00030000-562f-62e5-97f5-c85839b940db
00020000-562f-62e7-ddbb-7a547055a678	00030000-562f-62e5-f2e9-43936a9d4825
00020000-562f-62e7-ddbb-7a547055a678	00030000-562f-62e5-8dd8-87760ac12b0d
00020000-562f-62e7-ddbb-7a547055a678	00030000-562f-62e5-33f7-37f8f1220e8e
00020000-562f-62e7-ddbb-7a547055a678	00030000-562f-62e5-dcc1-134472b336db
00020000-562f-62e7-ddbb-7a547055a678	00030000-562f-62e5-eeb0-26d0f1b4b4e0
00020000-562f-62e7-ddbb-7a547055a678	00030000-562f-62e5-c539-d7b0cbc80a2d
00020000-562f-62e7-ddbb-7a547055a678	00030000-562f-62e5-2c9b-57d2d2c9e8f2
00020000-562f-62e7-ddbb-7a547055a678	00030000-562f-62e5-34f8-87c3b5df695c
00020000-562f-62e7-ddbb-7a547055a678	00030000-562f-62e5-de78-3843a99bd2dd
00020000-562f-62e7-ddbb-7a547055a678	00030000-562f-62e5-b03e-f121b59a764b
00020000-562f-62e7-ddbb-7a547055a678	00030000-562f-62e5-7a27-d3df2af655bf
00020000-562f-62e7-ddbb-7a547055a678	00030000-562f-62e5-c1cb-97d9dbc22a6f
00020000-562f-62e7-ddbb-7a547055a678	00030000-562f-62e5-aae2-4a7daec7be67
00020000-562f-62e7-ddbb-7a547055a678	00030000-562f-62e5-d452-9969312106c1
00020000-562f-62e7-ddbb-7a547055a678	00030000-562f-62e5-da02-3d9ef1820c10
00020000-562f-62e7-ddbb-7a547055a678	00030000-562f-62e5-372e-36b0ce74d2e4
00020000-562f-62e7-ddbb-7a547055a678	00030000-562f-62e5-64b5-be4a1a5bd4ff
00020000-562f-62e7-ddbb-7a547055a678	00030000-562f-62e5-f272-b51b675ba62d
00020000-562f-62e7-ddbb-7a547055a678	00030000-562f-62e5-b936-67dc0160f5d2
00020000-562f-62e7-ddbb-7a547055a678	00030000-562f-62e5-ecb5-8ff424799288
00020000-562f-62e7-ddbb-7a547055a678	00030000-562f-62e5-85ce-e61226bf973c
00020000-562f-62e7-ddbb-7a547055a678	00030000-562f-62e5-09a7-05da626a13fd
00020000-562f-62e7-ddbb-7a547055a678	00030000-562f-62e5-f1a9-7f1b464c7f63
00020000-562f-62e7-ddbb-7a547055a678	00030000-562f-62e5-79e9-1c8f5489da73
00020000-562f-62e7-ddbb-7a547055a678	00030000-562f-62e5-e3ce-6ae26bba2a4c
00020000-562f-62e7-ddbb-7a547055a678	00030000-562f-62e5-1f9c-b9bc587806ed
00020000-562f-62e7-ddbb-7a547055a678	00030000-562f-62e5-1683-e4a71382cbfe
00020000-562f-62e7-ddbb-7a547055a678	00030000-562f-62e5-cb30-313ff03e9bef
00020000-562f-62e7-ddbb-7a547055a678	00030000-562f-62e5-6d74-1f4337187068
00020000-562f-62e7-ddbb-7a547055a678	00030000-562f-62e5-62df-f0e3ec25423c
00020000-562f-62e7-ddbb-7a547055a678	00030000-562f-62e5-d1a0-524f9df1d418
00020000-562f-62e7-ddbb-7a547055a678	00030000-562f-62e5-b27b-2dfcc394dea5
00020000-562f-62e7-ddbb-7a547055a678	00030000-562f-62e5-f64b-8006419ee85b
00020000-562f-62e7-ddbb-7a547055a678	00030000-562f-62e5-c265-01d0911e6fb4
00020000-562f-62e7-ddbb-7a547055a678	00030000-562f-62e5-2013-ff2b433b1251
\.


--
-- TOC entry 3091 (class 0 OID 23507990)
-- Dependencies: 213
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 3095 (class 0 OID 23508024)
-- Dependencies: 217
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 3107 (class 0 OID 23508161)
-- Dependencies: 229
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, zacetek, konec, jeavtorskepravice, placilonavajo, vrednostvaje, planiranostevilovaj, vrednostvaj, vrednostpredstave, procentodinkasa, jeprocentodinkasa, vrednostdopremiere, zaposlenvdrjz, samozaposlen, igralec, opis) FROM stdin;
000b0000-562f-62e7-1b77-62489c61f127	00090000-562f-62e7-82e1-054f7cc00cbe	\N	\N	0001	\N	\N	f	f	10.00	3	10.00	30.00	\N	f	10.00	t	f	t	Pogodba o sodelovanju
000b0000-562f-62e7-65e5-bb33d5ab512d	00090000-562f-62e7-5977-1bc00cf3111d	\N	\N	0002	\N	\N	f	t	11.00	10	11.00	31.00	\N	f	110.00	f	t	t	Pogodba za vlogo Helena
000b0000-562f-62e7-c163-21b03daf369c	00090000-562f-62e7-4796-464e66aae7b6	\N	\N	0003	\N	\N	f	f	12.00	4	12.00	0.00	\N	f	12.00	f	t	f	Pogodba za lektoriranje
000b0000-562f-62e7-f8e7-7441086b419c	00090000-562f-62e7-54b6-deae4d40c17f	\N	\N	0004	\N	\N	t	f	0.00	2	300.00	0.00	\N	f	300.00	f	t	f	Pogodba za avtorske pravice
\.


--
-- TOC entry 3063 (class 0 OID 23507688)
-- Dependencies: 185
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, tipkli_id, drzava_id, sifra, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo, nvo) FROM stdin;
00080000-562f-62e7-aae7-3c27743e1371	\N	00040000-562f-62e5-de26-c389915f8107	0988	AK	Juhuhu d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-562f-62e7-fda9-c04e63166d88	\N	00040000-562f-62e5-de26-c389915f8107	0989	AK	Hopsasa d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	t
00080000-562f-62e7-0c02-4ce78bdf1591	\N	00040000-562f-62e5-de26-c389915f8107	0987	AK	Gledališče Šrum d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-562f-62e7-9a27-368cf7bd9a89	\N	00040000-562f-62e5-de26-c389915f8107	0986	AK	Lutkovni Direndaj d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-562f-62e7-4509-c6b98a05387b	\N	00040000-562f-62e5-de26-c389915f8107	0985	AK	Tatjana Stanič, Lektoriranje, s.p.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-562f-62e7-ac4a-218f66f1ab1d	\N	00040000-562f-62e5-4c7b-ad22b4eff2c0	0984	AK	Gledališče Lepote tvoje		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-562f-62e7-54a5-b2c6cd8e6b13	\N	00040000-562f-62e5-68fe-77454bedf31f	0983	AK	Sunce naše		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-562f-62e7-3de9-a88bb60a3e3c	\N	00040000-562f-62e5-ab8c-5f42f580ea42	0982	AK	Theater Amadeus		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-562f-62e7-8bad-ddc1309240bb	\N	00040000-562f-62e5-18fe-13528d8a56d5	9999	AK	Fuchs		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-562f-62e9-5b45-37f776743016	\N	00040000-562f-62e5-de26-c389915f8107	1001	AK	Gledališče Matica		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
\.


--
-- TOC entry 3066 (class 0 OID 23507733)
-- Dependencies: 188
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-562f-62e5-4ac3-532c9d045182	8341	Adlešiči
00050000-562f-62e5-5106-c0bbeee2a563	5270	Ajdovščina
00050000-562f-62e5-e268-c7c8623765a9	6280	Ankaran/Ancarano
00050000-562f-62e5-aded-fe98dbd2a2b9	9253	Apače
00050000-562f-62e5-62c1-3f5015f0f0b3	8253	Artiče
00050000-562f-62e5-b168-955e27660054	4275	Begunje na Gorenjskem
00050000-562f-62e5-86e2-25e57d08c787	1382	Begunje pri Cerknici
00050000-562f-62e5-553c-54ab1c45ef3c	9231	Beltinci
00050000-562f-62e5-fd31-d9f5cb85bd8b	2234	Benedikt
00050000-562f-62e5-3a58-36698ab74f58	2345	Bistrica ob Dravi
00050000-562f-62e5-bd30-67655e26fa75	3256	Bistrica ob Sotli
00050000-562f-62e5-a734-7be3e63d0a00	8259	Bizeljsko
00050000-562f-62e5-b399-1a4dc6aa0140	1223	Blagovica
00050000-562f-62e5-0d8c-8972abeb4ff8	8283	Blanca
00050000-562f-62e5-5844-e97f1606ba57	4260	Bled
00050000-562f-62e5-bfff-c0c99f2ea102	4273	Blejska Dobrava
00050000-562f-62e5-e3b2-0a5a11634100	9265	Bodonci
00050000-562f-62e5-255e-5073fed44bf6	9222	Bogojina
00050000-562f-62e5-43fe-582040b8305d	4263	Bohinjska Bela
00050000-562f-62e5-06fc-cb06b48c6bc5	4264	Bohinjska Bistrica
00050000-562f-62e5-a629-e1cc4b325509	4265	Bohinjsko jezero
00050000-562f-62e5-0aaf-406016e53838	1353	Borovnica
00050000-562f-62e5-0620-50b0899a7062	8294	Boštanj
00050000-562f-62e5-161e-7cab6e2d73fa	5230	Bovec
00050000-562f-62e5-4dce-c9969ddc98ef	5295	Branik
00050000-562f-62e5-ec2f-452ffe33b0e8	3314	Braslovče
00050000-562f-62e5-20cf-ac6e8969de1a	5223	Breginj
00050000-562f-62e5-b1db-a9c71f3e9b8b	8280	Brestanica
00050000-562f-62e5-027c-d569a3c4bc4e	2354	Bresternica
00050000-562f-62e5-a046-130ae66ede65	4243	Brezje
00050000-562f-62e5-ac09-895e0586dd34	1351	Brezovica pri Ljubljani
00050000-562f-62e5-53ab-92b6aa130638	8250	Brežice
00050000-562f-62e5-44eb-d347c16ebc05	4210	Brnik - Aerodrom
00050000-562f-62e5-10ae-a44d4bf9404c	8321	Brusnice
00050000-562f-62e5-9171-e01fd7a507f1	3255	Buče
00050000-562f-62e5-3282-94ba37d23b37	8276	Bučka 
00050000-562f-62e5-f43e-06156b05a543	9261	Cankova
00050000-562f-62e5-de4e-0b003fff0bdf	3000	Celje 
00050000-562f-62e5-c7b2-c91c564a037d	3001	Celje - poštni predali
00050000-562f-62e5-56e4-c2ca5ad8415b	4207	Cerklje na Gorenjskem
00050000-562f-62e5-2266-b13e77ff7593	8263	Cerklje ob Krki
00050000-562f-62e5-6ff7-2065a34b594b	1380	Cerknica
00050000-562f-62e5-d071-4a42c6d43176	5282	Cerkno
00050000-562f-62e5-be01-9a7bef11b572	2236	Cerkvenjak
00050000-562f-62e5-d27a-b276cdc52a80	2215	Ceršak
00050000-562f-62e5-331d-cb84c7294bdc	2326	Cirkovce
00050000-562f-62e5-e923-df0f2e07d17e	2282	Cirkulane
00050000-562f-62e5-8e7b-a45377d7e34b	5273	Col
00050000-562f-62e5-8c1b-eeacd355dd8d	8251	Čatež ob Savi
00050000-562f-62e5-45b6-681787274f04	1413	Čemšenik
00050000-562f-62e5-2fd7-d46afd7a6770	5253	Čepovan
00050000-562f-62e5-ac5f-bcffd27c5919	9232	Črenšovci
00050000-562f-62e5-a070-698e0510efb4	2393	Črna na Koroškem
00050000-562f-62e5-86ca-8555c484b61e	6275	Črni Kal
00050000-562f-62e5-1ea5-b9af76b9d254	5274	Črni Vrh nad Idrijo
00050000-562f-62e5-4e59-5a3f67033393	5262	Črniče
00050000-562f-62e5-e594-f14a7aaf2c70	8340	Črnomelj
00050000-562f-62e5-7985-274923d70200	6271	Dekani
00050000-562f-62e5-5f68-e3080c8b9570	5210	Deskle
00050000-562f-62e5-dd04-85003afb3b02	2253	Destrnik
00050000-562f-62e5-97bf-6f823bc7c8f0	6215	Divača
00050000-562f-62e5-4e54-d069b8916d88	1233	Dob
00050000-562f-62e5-d7b8-fc7d17ded304	3224	Dobje pri Planini
00050000-562f-62e5-31be-796dc6fbb5fa	8257	Dobova
00050000-562f-62e5-8d2b-0bfbe7ea54f5	1423	Dobovec
00050000-562f-62e5-ad46-693082124cf9	5263	Dobravlje
00050000-562f-62e5-04bf-ecee88db77f5	3204	Dobrna
00050000-562f-62e5-06ff-21dd8bc9e644	8211	Dobrnič
00050000-562f-62e5-c577-86d4eb8c7a27	1356	Dobrova
00050000-562f-62e5-904f-cbd050b5b444	9223	Dobrovnik/Dobronak 
00050000-562f-62e5-dfd4-b200a3a53897	5212	Dobrovo v Brdih
00050000-562f-62e5-5240-716f0aef51bd	1431	Dol pri Hrastniku
00050000-562f-62e5-dd4f-01f0156e6f82	1262	Dol pri Ljubljani
00050000-562f-62e5-0969-57e24d1948a2	1273	Dole pri Litiji
00050000-562f-62e5-23ef-776c00a20039	1331	Dolenja vas
00050000-562f-62e5-1a12-be9d8312d3a3	8350	Dolenjske Toplice
00050000-562f-62e5-09a9-5b84fe24b4ca	1230	Domžale
00050000-562f-62e5-4156-589b0f63fa97	2252	Dornava
00050000-562f-62e5-358d-68540bcc70f1	5294	Dornberk
00050000-562f-62e5-b45c-7ca2f5d1e298	1319	Draga
00050000-562f-62e5-f136-e30f1e5e248d	8343	Dragatuš
00050000-562f-62e5-0cf7-b6683a0e7383	3222	Dramlje
00050000-562f-62e5-2b31-aa69788ef9fe	2370	Dravograd
00050000-562f-62e5-7e9a-443f2e1ccc26	4203	Duplje
00050000-562f-62e5-c4e3-9e1d3f52df22	6221	Dutovlje
00050000-562f-62e5-882f-e6621e1d7d1e	8361	Dvor
00050000-562f-62e5-2354-82f9540d1d6f	2343	Fala
00050000-562f-62e5-3bc8-36a7d5775e33	9208	Fokovci
00050000-562f-62e5-1a3b-daf1ef42e40f	2313	Fram
00050000-562f-62e5-7384-007f96493745	3213	Frankolovo
00050000-562f-62e5-e34f-6b05e8cb30da	1274	Gabrovka
00050000-562f-62e5-523a-523b7efc1a36	8254	Globoko
00050000-562f-62e5-a013-b980ecaa3137	5275	Godovič
00050000-562f-62e5-1df0-e7223818df06	4204	Golnik
00050000-562f-62e5-a6f5-5229f0948b64	3303	Gomilsko
00050000-562f-62e5-ecab-27615a7fcf53	4224	Gorenja vas
00050000-562f-62e5-3961-aa3971567016	3263	Gorica pri Slivnici
00050000-562f-62e5-6959-363652bc77d0	2272	Gorišnica
00050000-562f-62e5-9005-a4afe9d04446	9250	Gornja Radgona
00050000-562f-62e5-df48-2c4da567343a	3342	Gornji Grad
00050000-562f-62e5-0c91-24ab09733435	4282	Gozd Martuljek
00050000-562f-62e5-b949-ae62c99fa940	6272	Gračišče
00050000-562f-62e5-dde0-0146ffda54a6	9264	Grad
00050000-562f-62e5-fcf3-4830e79c49bc	8332	Gradac
00050000-562f-62e5-5e22-7ef2a8adcb4d	1384	Grahovo
00050000-562f-62e5-7dc0-52b2c145a9bc	5242	Grahovo ob Bači
00050000-562f-62e5-c47e-6e8533e34b9a	5251	Grgar
00050000-562f-62e5-4ada-5601044ea098	3302	Griže
00050000-562f-62e5-06df-1404fe62dd32	3231	Grobelno
00050000-562f-62e5-543d-2e8f5192283d	1290	Grosuplje
00050000-562f-62e5-3801-624d9e59c064	2288	Hajdina
00050000-562f-62e5-2794-e87e1e5b85e1	8362	Hinje
00050000-562f-62e5-6725-9f3c74616ffd	2311	Hoče
00050000-562f-62e5-b43b-7b4e0a2dd4d1	9205	Hodoš/Hodos
00050000-562f-62e5-3734-964058d9d8c1	1354	Horjul
00050000-562f-62e5-c4b3-91970336c83d	1372	Hotedršica
00050000-562f-62e5-0431-7c6370f4cf5b	1430	Hrastnik
00050000-562f-62e5-d0f4-326c86614337	6225	Hruševje
00050000-562f-62e5-4227-a6bb68003710	4276	Hrušica
00050000-562f-62e5-0b5d-8a93153bf9a1	5280	Idrija
00050000-562f-62e5-dabd-58935a573ebc	1292	Ig
00050000-562f-62e5-0ee4-13aa910f90ec	6250	Ilirska Bistrica
00050000-562f-62e5-15f9-bf01fddc867b	6251	Ilirska Bistrica-Trnovo
00050000-562f-62e5-c8ae-781b6fd2b9c0	1295	Ivančna Gorica
00050000-562f-62e5-d923-f8c9bd083521	2259	Ivanjkovci
00050000-562f-62e5-6b9d-4e9c261eb0a8	1411	Izlake
00050000-562f-62e5-1bc3-323bfd7f1fe8	6310	Izola/Isola
00050000-562f-62e5-e118-f93f7cac6fa4	2222	Jakobski Dol
00050000-562f-62e5-6068-099e6ee80649	2221	Jarenina
00050000-562f-62e5-c904-5070c41fd543	6254	Jelšane
00050000-562f-62e5-d520-564724afc16e	4270	Jesenice
00050000-562f-62e5-37d3-e78aea01f434	8261	Jesenice na Dolenjskem
00050000-562f-62e5-304d-791b288cfb16	3273	Jurklošter
00050000-562f-62e5-c7f0-46e345c557b1	2223	Jurovski Dol
00050000-562f-62e5-748f-aea52f83c5bb	2256	Juršinci
00050000-562f-62e5-3ceb-1e44bb961c2c	5214	Kal nad Kanalom
00050000-562f-62e5-e9a0-0d984e9ad50f	3233	Kalobje
00050000-562f-62e5-69f4-bb411115bf75	4246	Kamna Gorica
00050000-562f-62e5-52ad-9964b48d486c	2351	Kamnica
00050000-562f-62e5-5116-c3d85eb8cb25	1241	Kamnik
00050000-562f-62e5-b9ed-e9f299b83611	5213	Kanal
00050000-562f-62e5-2d72-502dc29421a1	8258	Kapele
00050000-562f-62e5-41ed-dce5a248c3f1	2362	Kapla
00050000-562f-62e5-ecbd-6eebdd2b4c54	2325	Kidričevo
00050000-562f-62e5-a6fa-bca18d912c5b	1412	Kisovec
00050000-562f-62e5-50f6-7b29fbb62cc3	6253	Knežak
00050000-562f-62e5-eb36-c98251be4d8c	5222	Kobarid
00050000-562f-62e5-bb46-abefaf89388e	9227	Kobilje
00050000-562f-62e5-43ac-f1f70e53d716	1330	Kočevje
00050000-562f-62e5-218d-dabca06cae0c	1338	Kočevska Reka
00050000-562f-62e5-b962-12d183db8701	2276	Kog
00050000-562f-62e5-48d6-6a677b9630b0	5211	Kojsko
00050000-562f-62e5-2856-19e3e1f34910	6223	Komen
00050000-562f-62e5-0b4f-a52f521f4936	1218	Komenda
00050000-562f-62e5-2dee-a75a0f83731c	6000	Koper/Capodistria 
00050000-562f-62e5-ca94-1aae5bc7fe4a	6001	Koper/Capodistria - poštni predali
00050000-562f-62e5-a17d-ff86677a29d2	8282	Koprivnica
00050000-562f-62e5-f779-d47a3b76eabe	5296	Kostanjevica na Krasu
00050000-562f-62e5-95fc-4add0b09d797	8311	Kostanjevica na Krki
00050000-562f-62e5-bbb1-d5c547b5c516	1336	Kostel
00050000-562f-62e5-d028-bae1b1358dd1	6256	Košana
00050000-562f-62e5-1024-d204f928ae56	2394	Kotlje
00050000-562f-62e5-b584-2eefa2991e5a	6240	Kozina
00050000-562f-62e5-320f-987d8f6c78bf	3260	Kozje
00050000-562f-62e5-98ce-0e4738207668	4000	Kranj 
00050000-562f-62e5-9cd5-f0358b061088	4001	Kranj - poštni predali
00050000-562f-62e5-8755-6220607af462	4280	Kranjska Gora
00050000-562f-62e5-6caf-7e016e2f1083	1281	Kresnice
00050000-562f-62e5-eb58-800451b5f03a	4294	Križe
00050000-562f-62e5-c47e-ba47848fb6fb	9206	Križevci
00050000-562f-62e5-ed26-5720b659181f	9242	Križevci pri Ljutomeru
00050000-562f-62e5-9c51-debd87c5541f	1301	Krka
00050000-562f-62e5-a820-e289f1067753	8296	Krmelj
00050000-562f-62e5-29b0-49e81a910eb2	4245	Kropa
00050000-562f-62e5-a9f1-8c0cf71d3aa3	8262	Krška vas
00050000-562f-62e5-66c8-566b626f79b3	8270	Krško
00050000-562f-62e5-1b3a-d11a2db7407a	9263	Kuzma
00050000-562f-62e5-a186-dcabfc5e4257	2318	Laporje
00050000-562f-62e5-240c-02c26340631c	3270	Laško
00050000-562f-62e5-a59d-fbcdc3f2033d	1219	Laze v Tuhinju
00050000-562f-62e5-f87c-1e0a58b7311e	2230	Lenart v Slovenskih goricah
00050000-562f-62e5-43a1-ca182797673e	9220	Lendava/Lendva
00050000-562f-62e5-b8dd-b47199db9f54	4248	Lesce
00050000-562f-62e5-1bbe-1e9b89b0437d	3261	Lesično
00050000-562f-62e5-764b-628be808589f	8273	Leskovec pri Krškem
00050000-562f-62e5-9771-f5a80e483e27	2372	Libeliče
00050000-562f-62e5-cf31-c291c4178cfa	2341	Limbuš
00050000-562f-62e5-6ea9-f19673648a61	1270	Litija
00050000-562f-62e5-e6c4-7125f6930ec9	3202	Ljubečna
00050000-562f-62e5-ac39-4b5820c03809	1000	Ljubljana 
00050000-562f-62e5-9015-efa472377f59	1001	Ljubljana - poštni predali
00050000-562f-62e5-4874-3880aa57f5fa	1231	Ljubljana - Črnuče
00050000-562f-62e5-c9df-37771d1da612	1261	Ljubljana - Dobrunje
00050000-562f-62e5-3745-1135ac0216c7	1260	Ljubljana - Polje
00050000-562f-62e5-82ea-c031d979ecaa	1210	Ljubljana - Šentvid
00050000-562f-62e5-c114-caf03547a626	1211	Ljubljana - Šmartno
00050000-562f-62e5-b782-9f060492d283	3333	Ljubno ob Savinji
00050000-562f-62e5-7661-cb0a98ce3449	9240	Ljutomer
00050000-562f-62e5-4e33-b72f20d81135	3215	Loče
00050000-562f-62e5-d0d3-b429c78b0ec8	5231	Log pod Mangartom
00050000-562f-62e5-1c83-9a5264715bd8	1358	Log pri Brezovici
00050000-562f-62e5-f5fa-913d861b2d6e	1370	Logatec
00050000-562f-62e5-81c3-7cc0ba5d5c85	1371	Logatec
00050000-562f-62e5-ab21-829073e8da20	1434	Loka pri Zidanem Mostu
00050000-562f-62e5-96d4-af288eb285cb	3223	Loka pri Žusmu
00050000-562f-62e5-5748-ae2ffc6f9f11	6219	Lokev
00050000-562f-62e5-60b8-569b6a75f087	1318	Loški Potok
00050000-562f-62e5-d7ed-4749a3bfeaa5	2324	Lovrenc na Dravskem polju
00050000-562f-62e5-6eba-f8a6c6f7fbf8	2344	Lovrenc na Pohorju
00050000-562f-62e5-2eaf-d8d6ea767fde	3334	Luče
00050000-562f-62e5-399b-eac571a1865a	1225	Lukovica
00050000-562f-62e5-757d-91b34e045f92	9202	Mačkovci
00050000-562f-62e5-a4b4-d087802703e1	2322	Majšperk
00050000-562f-62e5-4ed3-e83cdff5e9e1	2321	Makole
00050000-562f-62e5-5b89-98d0edd877a4	9243	Mala Nedelja
00050000-562f-62e5-9b7a-bbb96873acbd	2229	Malečnik
00050000-562f-62e5-b44b-25ccd4f8d305	6273	Marezige
00050000-562f-62e5-b188-ca295322ed19	2000	Maribor 
00050000-562f-62e5-66e8-8b7a13ee0738	2001	Maribor - poštni predali
00050000-562f-62e5-a630-bdf9cf172b48	2206	Marjeta na Dravskem polju
00050000-562f-62e5-3523-d7e1e5397961	2281	Markovci
00050000-562f-62e5-7b46-aa977c9f3f2a	9221	Martjanci
00050000-562f-62e5-11bf-42684c946229	6242	Materija
00050000-562f-62e5-8020-0a50405a9b46	4211	Mavčiče
00050000-562f-62e5-f689-5c98ec6bea6a	1215	Medvode
00050000-562f-62e5-1ba6-104d32cbd3f4	1234	Mengeš
00050000-562f-62e5-4fe2-460c650a61cc	8330	Metlika
00050000-562f-62e5-da55-890ebd793def	2392	Mežica
00050000-562f-62e5-17b6-ddc32aa14e00	2204	Miklavž na Dravskem polju
00050000-562f-62e5-baaa-25ad2f216ab1	2275	Miklavž pri Ormožu
00050000-562f-62e5-fd4e-4680574c2cc9	5291	Miren
00050000-562f-62e5-8265-9eb9b02b6b8a	8233	Mirna
00050000-562f-62e5-d07f-70227b4d6692	8216	Mirna Peč
00050000-562f-62e5-38ac-af8f22f8f2ec	2382	Mislinja
00050000-562f-62e5-4508-510b02800aff	4281	Mojstrana
00050000-562f-62e5-b2ce-df5e61be54e1	8230	Mokronog
00050000-562f-62e5-58fc-38e974d57be1	1251	Moravče
00050000-562f-62e5-e604-8385f350963a	9226	Moravske Toplice
00050000-562f-62e5-b10e-e2240ca725d7	5216	Most na Soči
00050000-562f-62e5-a8be-3cda6167d342	1221	Motnik
00050000-562f-62e5-bf6b-87027752d05b	3330	Mozirje
00050000-562f-62e5-7427-fa5be9f1f09e	9000	Murska Sobota 
00050000-562f-62e5-d5d9-e2855a037e0c	9001	Murska Sobota - poštni predali
00050000-562f-62e5-0429-15bc164a6945	2366	Muta
00050000-562f-62e5-504a-301ca41a6b11	4202	Naklo
00050000-562f-62e5-805f-9cc545912f41	3331	Nazarje
00050000-562f-62e5-583d-370a0fe354f0	1357	Notranje Gorice
00050000-562f-62e5-fafb-515539766ce7	3203	Nova Cerkev
00050000-562f-62e5-e147-66cacff11b4e	5000	Nova Gorica 
00050000-562f-62e5-2e0b-5ddcbd333a82	5001	Nova Gorica - poštni predali
00050000-562f-62e5-2a7f-4d6c47571bb0	1385	Nova vas
00050000-562f-62e5-9364-06369b97a19c	8000	Novo mesto
00050000-562f-62e5-7426-a698e4fae236	8001	Novo mesto - poštni predali
00050000-562f-62e5-0df1-5dca778eaf73	6243	Obrov
00050000-562f-62e5-e02d-55892aca8b82	9233	Odranci
00050000-562f-62e5-0aaf-15fc2c0f4c28	2317	Oplotnica
00050000-562f-62e5-2e95-4e27e402c4e4	2312	Orehova vas
00050000-562f-62e5-0024-b75929f3e161	2270	Ormož
00050000-562f-62e5-96f4-a3cfa93bfed7	1316	Ortnek
00050000-562f-62e5-7313-0b613d26ca2e	1337	Osilnica
00050000-562f-62e5-8007-ab96d69162b2	8222	Otočec
00050000-562f-62e5-134d-3f9853994c91	2361	Ožbalt
00050000-562f-62e5-b295-abd86b7623ff	2231	Pernica
00050000-562f-62e5-f6f3-1f9b559be2f7	2211	Pesnica pri Mariboru
00050000-562f-62e5-9c92-1ee545312fc5	9203	Petrovci
00050000-562f-62e5-ac4c-d0eff48c54f7	3301	Petrovče
00050000-562f-62e5-4bfb-da84629952db	6330	Piran/Pirano
00050000-562f-62e5-131a-b27976d2fba6	8255	Pišece
00050000-562f-62e5-daf1-a007b9f74b79	6257	Pivka
00050000-562f-62e5-0840-ac5b22ab7a5d	6232	Planina
00050000-562f-62e5-69bd-6e7e0a5f7b8b	3225	Planina pri Sevnici
00050000-562f-62e5-e018-a38582dc72f4	6276	Pobegi
00050000-562f-62e5-4316-6f8e50f5fce6	8312	Podbočje
00050000-562f-62e5-ed46-51b9bd50da75	5243	Podbrdo
00050000-562f-62e5-cb67-a16ed486f5b3	3254	Podčetrtek
00050000-562f-62e5-9546-09e5743bd6fc	2273	Podgorci
00050000-562f-62e5-c279-b4cbfb7fa254	6216	Podgorje
00050000-562f-62e5-1786-1ec89704a14b	2381	Podgorje pri Slovenj Gradcu
00050000-562f-62e5-e628-411df664a83c	6244	Podgrad
00050000-562f-62e5-7595-13f252ef6817	1414	Podkum
00050000-562f-62e5-6aab-0add51a0aba9	2286	Podlehnik
00050000-562f-62e5-db76-c6f1efbe2b7d	5272	Podnanos
00050000-562f-62e5-0d47-8d12748abfa7	4244	Podnart
00050000-562f-62e5-9d02-2f99c7cf4be1	3241	Podplat
00050000-562f-62e5-9c69-9468142dc46b	3257	Podsreda
00050000-562f-62e5-d629-ec4fdf71d1ba	2363	Podvelka
00050000-562f-62e5-e3fd-4e4a85850e7f	2208	Pohorje
00050000-562f-62e5-beac-27a84c50597b	2257	Polenšak
00050000-562f-62e5-6275-7a54ae56082c	1355	Polhov Gradec
00050000-562f-62e5-8f8f-94c2b6551d96	4223	Poljane nad Škofjo Loko
00050000-562f-62e5-b799-72c47bbdabae	2319	Poljčane
00050000-562f-62e5-4e22-dda13fc9da3f	1272	Polšnik
00050000-562f-62e5-f5b6-d443b98f7763	3313	Polzela
00050000-562f-62e5-7e61-6285a01e02c5	3232	Ponikva
00050000-562f-62e5-5aa2-2955a27bb8e5	6320	Portorož/Portorose
00050000-562f-62e5-4ab0-8083aa9bef39	6230	Postojna
00050000-562f-62e5-76c3-f0f9c6cbd2c2	2331	Pragersko
00050000-562f-62e5-923f-f0bcdc9c552e	3312	Prebold
00050000-562f-62e5-f981-7f6471372949	4205	Preddvor
00050000-562f-62e5-644d-42e4dbb7c61f	6255	Prem
00050000-562f-62e5-f4ef-07ec8d4887cd	1352	Preserje
00050000-562f-62e5-9712-56870d8752b6	6258	Prestranek
00050000-562f-62e5-7db8-947df4292edc	2391	Prevalje
00050000-562f-62e5-1ce7-f9939cfb9da7	3262	Prevorje
00050000-562f-62e5-45bf-a7e024eb7397	1276	Primskovo 
00050000-562f-62e5-a08e-43cbcb20af72	3253	Pristava pri Mestinju
00050000-562f-62e5-01cf-5dc5e7af90ee	9207	Prosenjakovci/Partosfalva
00050000-562f-62e5-ff5f-aaf7bf272a3a	5297	Prvačina
00050000-562f-62e5-9321-7c59df031ce6	2250	Ptuj
00050000-562f-62e5-022c-f0f678e14416	2323	Ptujska Gora
00050000-562f-62e5-9273-9d2f246e6a26	9201	Puconci
00050000-562f-62e5-8104-652526a1d6ce	2327	Rače
00050000-562f-62e5-cd43-c775fa414585	1433	Radeče
00050000-562f-62e5-4ac3-9ff9926bc32e	9252	Radenci
00050000-562f-62e5-24e9-9d4eb0e800c1	2360	Radlje ob Dravi
00050000-562f-62e5-9ba4-f6208a85a18a	1235	Radomlje
00050000-562f-62e5-6e7c-9442ca3e2171	4240	Radovljica
00050000-562f-62e5-145f-9bc906fce1c7	8274	Raka
00050000-562f-62e5-e0ff-416f7425da8d	1381	Rakek
00050000-562f-62e5-427f-62f638915f2d	4283	Rateče - Planica
00050000-562f-62e5-b443-16d82d825f2f	2390	Ravne na Koroškem
00050000-562f-62e5-2279-515aeaa8e1cc	9246	Razkrižje
00050000-562f-62e5-79eb-92351fb21a20	3332	Rečica ob Savinji
00050000-562f-62e5-eac6-a939a13bc67c	5292	Renče
00050000-562f-62e5-9069-b1904e45ab67	1310	Ribnica
00050000-562f-62e5-fcdf-dfff1018f752	2364	Ribnica na Pohorju
00050000-562f-62e5-1667-e7fe2aef43cd	3272	Rimske Toplice
00050000-562f-62e5-4cb8-583644c504a8	1314	Rob
00050000-562f-62e5-3cd0-47ac6d07c1e4	5215	Ročinj
00050000-562f-62e5-44d1-88f0e68cd226	3250	Rogaška Slatina
00050000-562f-62e5-903d-78816405be07	9262	Rogašovci
00050000-562f-62e5-17f6-12385debd864	3252	Rogatec
00050000-562f-62e5-3950-4c6c6e602eb3	1373	Rovte
00050000-562f-62e5-218c-fedb0cf57644	2342	Ruše
00050000-562f-62e5-c197-6a719823ef28	1282	Sava
00050000-562f-62e5-0ac2-162071303977	6333	Sečovlje/Sicciole
00050000-562f-62e5-2ed0-42c6fdc04ab5	4227	Selca
00050000-562f-62e5-3760-fbf167518ee5	2352	Selnica ob Dravi
00050000-562f-62e5-cac8-24b2b52f4962	8333	Semič
00050000-562f-62e5-5b3e-fe2889897fd0	8281	Senovo
00050000-562f-62e5-2233-a651d136b71f	6224	Senožeče
00050000-562f-62e5-9f4b-22bc65e762d3	8290	Sevnica
00050000-562f-62e5-2e44-6475c3df4a3c	6210	Sežana
00050000-562f-62e5-bd53-0000abc62547	2214	Sladki Vrh
00050000-562f-62e5-0120-bcbf04e44019	5283	Slap ob Idrijci
00050000-562f-62e5-ea72-853bd2fc1033	2380	Slovenj Gradec
00050000-562f-62e5-8255-c677470d3750	2310	Slovenska Bistrica
00050000-562f-62e5-45c8-5333ffeade76	3210	Slovenske Konjice
00050000-562f-62e5-3c89-eb4c7e7deafe	1216	Smlednik
00050000-562f-62e5-80a3-12ca0bd479e8	5232	Soča
00050000-562f-62e5-7576-473498764812	1317	Sodražica
00050000-562f-62e5-df2b-ab8cb5b101d4	3335	Solčava
00050000-562f-62e5-13cc-e16cf4fe58a4	5250	Solkan
00050000-562f-62e5-ce0a-0f7a73b96a33	4229	Sorica
00050000-562f-62e5-aeaa-104d0d82beff	4225	Sovodenj
00050000-562f-62e5-067a-0b5c9f87fa24	5281	Spodnja Idrija
00050000-562f-62e5-1338-45459b6ccd22	2241	Spodnji Duplek
00050000-562f-62e5-df19-a2b0baaafae4	9245	Spodnji Ivanjci
00050000-562f-62e5-10a4-81e6c29c3582	2277	Središče ob Dravi
00050000-562f-62e5-8976-072697aca968	4267	Srednja vas v Bohinju
00050000-562f-62e5-9f61-8d221ef8c624	8256	Sromlje 
00050000-562f-62e5-9d39-3f667fac9bdb	5224	Srpenica
00050000-562f-62e5-0ce3-ac78ed7782d5	1242	Stahovica
00050000-562f-62e5-ee97-00fd9e0665ea	1332	Stara Cerkev
00050000-562f-62e5-e618-a710f64cfa65	8342	Stari trg ob Kolpi
00050000-562f-62e5-edff-22a9bdd344cd	1386	Stari trg pri Ložu
00050000-562f-62e5-fcfb-f9ee06cb9f8f	2205	Starše
00050000-562f-62e5-cc44-5f042cec56d4	2289	Stoperce
00050000-562f-62e5-5ff2-79717b7e406f	8322	Stopiče
00050000-562f-62e5-7741-d75c726f5582	3206	Stranice
00050000-562f-62e5-a9b0-fab87b7dddc5	8351	Straža
00050000-562f-62e5-10de-1801c1305b2f	1313	Struge
00050000-562f-62e5-0b04-8d583d68deaa	8293	Studenec
00050000-562f-62e5-5206-e22ddfb876b1	8331	Suhor
00050000-562f-62e5-d2db-c6761d06d39b	2233	Sv. Ana v Slovenskih goricah
00050000-562f-62e5-9fa3-f736373de937	2235	Sv. Trojica v Slovenskih goricah
00050000-562f-62e5-78eb-835a324a4988	2353	Sveti Duh na Ostrem Vrhu
00050000-562f-62e5-4650-8b0a5560ee59	9244	Sveti Jurij ob Ščavnici
00050000-562f-62e5-aba2-c5a3b57c3390	3264	Sveti Štefan
00050000-562f-62e5-8b76-19f846c07f2d	2258	Sveti Tomaž
00050000-562f-62e5-9ab1-60e6f0b9d633	9204	Šalovci
00050000-562f-62e5-5c6e-cafbed3abb61	5261	Šempas
00050000-562f-62e5-a574-613d10f490da	5290	Šempeter pri Gorici
00050000-562f-62e5-2e53-840d9ed36c5a	3311	Šempeter v Savinjski dolini
00050000-562f-62e5-ef9b-aff871d88602	4208	Šenčur
00050000-562f-62e5-ea4a-d86dde9424c6	2212	Šentilj v Slovenskih goricah
00050000-562f-62e5-0c88-bac68dcf45e0	8297	Šentjanž
00050000-562f-62e5-f422-a607082700a3	2373	Šentjanž pri Dravogradu
00050000-562f-62e5-0470-1a90878259ec	8310	Šentjernej
00050000-562f-62e5-a1d1-fa7f84aeda24	3230	Šentjur
00050000-562f-62e5-ab75-4b36cfe8dcfb	3271	Šentrupert
00050000-562f-62e5-f1df-c2d515fd8cbb	8232	Šentrupert
00050000-562f-62e5-5082-1e074154f0ce	1296	Šentvid pri Stični
00050000-562f-62e5-837b-cb6f9a9714d7	8275	Škocjan
00050000-562f-62e5-fc62-14844deac537	6281	Škofije
00050000-562f-62e5-ab4c-f8b0cd619995	4220	Škofja Loka
00050000-562f-62e5-7bc5-19201e0dd3bc	3211	Škofja vas
00050000-562f-62e5-232e-1c3109dce301	1291	Škofljica
00050000-562f-62e5-f14e-ddba7e2f3d5a	6274	Šmarje
00050000-562f-62e5-387b-bcaf8dc02154	1293	Šmarje - Sap
00050000-562f-62e5-5a69-4a8a5db3d623	3240	Šmarje pri Jelšah
00050000-562f-62e5-99dd-861d59384b44	8220	Šmarješke Toplice
00050000-562f-62e5-d17d-edbca7718408	2315	Šmartno na Pohorju
00050000-562f-62e5-14e6-22cf35454b66	3341	Šmartno ob Dreti
00050000-562f-62e5-3ce3-93a79b0a795f	3327	Šmartno ob Paki
00050000-562f-62e5-e688-0f14c16ee7e2	1275	Šmartno pri Litiji
00050000-562f-62e5-9eba-d1abcc5bb8a7	2383	Šmartno pri Slovenj Gradcu
00050000-562f-62e5-3459-3e799e7d4758	3201	Šmartno v Rožni dolini
00050000-562f-62e5-2141-6fdff6715e4e	3325	Šoštanj
00050000-562f-62e5-a507-2d8a8efab995	6222	Štanjel
00050000-562f-62e5-4fc7-adbd861e462e	3220	Štore
00050000-562f-62e5-305b-2983484eaa74	3304	Tabor
00050000-562f-62e5-aa48-1c5feee43070	3221	Teharje
00050000-562f-62e5-a64c-80a8476dd36a	9251	Tišina
00050000-562f-62e5-e8b7-410953862066	5220	Tolmin
00050000-562f-62e5-24eb-479707e7b0a8	3326	Topolšica
00050000-562f-62e5-fea5-d9d9e8930460	2371	Trbonje
00050000-562f-62e5-4c93-cc50435a0456	1420	Trbovlje
00050000-562f-62e5-a5f8-5f2af8d986e4	8231	Trebelno 
00050000-562f-62e5-4a07-1de3abf86c89	8210	Trebnje
00050000-562f-62e5-d63b-483e928f8470	5252	Trnovo pri Gorici
00050000-562f-62e5-0d61-9295cba0e21c	2254	Trnovska vas
00050000-562f-62e5-8906-c714ff6a50a3	1222	Trojane
00050000-562f-62e5-5c41-83fbdbfe8d66	1236	Trzin
00050000-562f-62e5-ff09-bb3e82d56116	4290	Tržič
00050000-562f-62e5-8223-2b5ad7ac7031	8295	Tržišče
00050000-562f-62e5-a98e-1e9fbd408b17	1311	Turjak
00050000-562f-62e5-a97c-a0006460693f	9224	Turnišče
00050000-562f-62e5-cb22-6cbef4fd8fa4	8323	Uršna sela
00050000-562f-62e5-8b67-eeb57505c5da	1252	Vače
00050000-562f-62e5-4ba7-b9d083ff72d7	3320	Velenje 
00050000-562f-62e5-8458-3fcd4a683df4	3322	Velenje - poštni predali
00050000-562f-62e5-1b14-c9f124133e4f	8212	Velika Loka
00050000-562f-62e5-4d17-91fc774e6ef0	2274	Velika Nedelja
00050000-562f-62e5-01e5-1697ff8f25ad	9225	Velika Polana
00050000-562f-62e5-bc7b-109fc4d41f77	1315	Velike Lašče
00050000-562f-62e5-cead-7c5bcf33beb3	8213	Veliki Gaber
00050000-562f-62e5-9d15-a85786c5cab5	9241	Veržej
00050000-562f-62e5-42e1-16b51055b7bc	1312	Videm - Dobrepolje
00050000-562f-62e5-9c52-3661fec77fc7	2284	Videm pri Ptuju
00050000-562f-62e5-f811-8149b184fa18	8344	Vinica
00050000-562f-62e5-49de-2bb8e38faeb4	5271	Vipava
00050000-562f-62e5-5d75-ffb0bb75d310	4212	Visoko
00050000-562f-62e5-f9a8-61751e916cf0	1294	Višnja Gora
00050000-562f-62e5-d2fb-6561eae7c47f	3205	Vitanje
00050000-562f-62e5-5f6d-d4582d42e878	2255	Vitomarci
00050000-562f-62e5-5c37-7c1ce0b3910b	1217	Vodice
00050000-562f-62e5-5843-33ec5938a4a6	3212	Vojnik\t
00050000-562f-62e5-e9c5-b0dc1d7a0457	5293	Volčja Draga
00050000-562f-62e5-bdc4-0553df9cbf51	2232	Voličina
00050000-562f-62e5-220f-db7e33c33998	3305	Vransko
00050000-562f-62e5-18cd-ffa9ecdff8bc	6217	Vremski Britof
00050000-562f-62e5-b956-e8121c0ff2f9	1360	Vrhnika
00050000-562f-62e5-a29e-6650cfabfd61	2365	Vuhred
00050000-562f-62e5-f56c-a9ab5dd3020a	2367	Vuzenica
00050000-562f-62e5-be78-d39d0b779581	8292	Zabukovje 
00050000-562f-62e5-a11f-3b6fd087ccec	1410	Zagorje ob Savi
00050000-562f-62e5-92e0-d3ffd51a5585	1303	Zagradec
00050000-562f-62e5-0a3c-cc42505c750f	2283	Zavrč
00050000-562f-62e5-2084-a7ceeaa27e11	8272	Zdole 
00050000-562f-62e5-27a4-77b0021dc73c	4201	Zgornja Besnica
00050000-562f-62e5-6666-45f138977b0a	2242	Zgornja Korena
00050000-562f-62e5-4089-b0c2b8dd8ea7	2201	Zgornja Kungota
00050000-562f-62e5-1daa-6629004a2aa2	2316	Zgornja Ložnica
00050000-562f-62e5-45bf-030b786f56cf	2314	Zgornja Polskava
00050000-562f-62e5-1d2e-2c6394fe0d62	2213	Zgornja Velka
00050000-562f-62e5-f3d6-b89c20527d17	4247	Zgornje Gorje
00050000-562f-62e5-c61d-686c6708f450	4206	Zgornje Jezersko
00050000-562f-62e5-0145-bc6ace14446a	2285	Zgornji Leskovec
00050000-562f-62e5-67ac-3c706bc7a8fa	1432	Zidani Most
00050000-562f-62e5-2171-0e85421f833f	3214	Zreče
00050000-562f-62e5-1d8f-4ba961cf3612	4209	Žabnica
00050000-562f-62e5-4140-924e0ad4bd72	3310	Žalec
00050000-562f-62e5-d05c-d9d64abdacfc	4228	Železniki
00050000-562f-62e5-fc66-f998d2be49a5	2287	Žetale
00050000-562f-62e5-396a-5962eeee7d7f	4226	Žiri
00050000-562f-62e5-3b28-472958d0954f	4274	Žirovnica
00050000-562f-62e5-ee08-7f9861fee40b	8360	Žužemberk
\.


--
-- TOC entry 3114 (class 0 OID 23508372)
-- Dependencies: 236
-- Data for Name: postavkacdve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkacdve (id, skupina, podskupina, naziv, vrpremiere, vrponovitvepremier, vrponovitveprejsnjih, vrgostovanjazamejstvo, vrfestivali, vrgostovanjaint, vrostalo, programdela_id) FROM stdin;
\.


--
-- TOC entry 3087 (class 0 OID 23507964)
-- Dependencies: 209
-- Data for Name: postavkaracuna; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkaracuna (id, racun_id) FROM stdin;
\.


--
-- TOC entry 3065 (class 0 OID 23507718)
-- Dependencies: 187
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
00060000-562f-62e7-4c1b-c61700298b67	00080000-562f-62e7-aae7-3c27743e1371	\N	00040000-562f-62e5-de26-c389915f8107	Narodni dom	\N	Koroška 15	\N	9231	Beltinci	\N	f	t
00060000-562f-62e7-a1c9-1d622baad90a	00080000-562f-62e7-aae7-3c27743e1371	\N	00040000-562f-62e5-de26-c389915f8107	Korotan	\N	Koroška 22	\N	9231	Beltinci	\N	f	f
00060000-562f-62e7-b033-b91e2154aaf8	00080000-562f-62e7-fda9-c04e63166d88	\N	00040000-562f-62e5-de26-c389915f8107	Rimljan	\N	Rimska ploščad 7	\N	9231	Beltinci	\N	f	t
\.


--
-- TOC entry 3077 (class 0 OID 23507862)
-- Dependencies: 199
-- Data for Name: praznik; Type: TABLE DATA; Schema: public; Owner: -
--

COPY praznik (id, ime, dan, mesec, leto, delaprost) FROM stdin;
00430000-562f-62e5-b552-cd318b14f9bf	novo leto	1	1	\N	t
00430000-562f-62e5-21be-f9ee966c9853	Prešernov dan, slovenski kulturni praznik	8	2	\N	t
00430000-562f-62e5-773e-fcc9a3450822	dan upora proti okupatorju	27	4	\N	t
00430000-562f-62e5-0bcf-4f0fbd4849e1	praznik dela	1	5	\N	t
00430000-562f-62e5-f0fb-e24e8d7a6aa0	praznik dela	2	5	\N	t
00430000-562f-62e5-2845-2deb3424892b	dan Primoža Trubarja	8	6	\N	f
00430000-562f-62e5-5384-5a37d7e84585	dan državnosti	25	6	\N	t
00430000-562f-62e5-ec77-200b278f97a1	združitev prekmurskih Slovencev z matičnim narodom	17	8	\N	f
00430000-562f-62e5-f070-1e08f6a2169c	vrnitev Primorske k matični domovini	15	9	\N	f
00430000-562f-62e5-efdb-3865a6416509	dan suverenosti	25	10	\N	f
00430000-562f-62e5-a42b-278a40c47694	dan spomina na mrtve	1	11	\N	t
00430000-562f-62e5-a745-382dd5e6d424	dan Rudolfa Maistra	23	11	\N	f
00430000-562f-62e5-e35d-83ffc9a68bb3	božič	25	12	\N	t
00430000-562f-62e5-9dbf-0b766ffcc4b8	dan samostojnosti in enotnosti	26	12	\N	t
00430000-562f-62e5-ccc2-ea760368c286	Marijino vnebovzetje	15	8	\N	t
00430000-562f-62e5-f7e8-44067f68535b	dan reformacije	31	10	\N	t
00430000-562f-62e5-0fd3-51dc2624c9b3	velikonočna nedelja	27	3	2016	t
00430000-562f-62e5-1801-e8b51e6f6d48	velikonočna nedelja	16	4	2017	t
00430000-562f-62e5-8423-ae664fe4bada	velikonočna nedelja	1	4	2018	t
00430000-562f-62e5-7dbd-9ab90ba23782	velikonočna nedelja	21	4	2019	t
00430000-562f-62e5-c047-a25995dadbd5	velikonočna nedelja	12	4	2020	t
00430000-562f-62e5-2ecd-a210c106f017	velikonočna nedelja	4	4	2021	t
00430000-562f-62e5-824b-fa6db50e7194	velikonočna nedelja	17	4	2022	t
00430000-562f-62e5-4830-5e922fe949c6	velikonočna nedelja	9	4	2023	t
00430000-562f-62e5-e531-9def89b002d4	velikonočna nedelja	31	3	2024	t
00430000-562f-62e5-0b30-d8e59e3b7e9c	velikonočna nedelja	20	4	2025	t
00430000-562f-62e5-47c1-b8ea7f2bab11	velikonočna nedelja	5	4	2026	t
00430000-562f-62e5-e8d4-85a9434574eb	velikonočna nedelja	28	3	2027	t
00430000-562f-62e5-4137-091acf6f3500	velikonočna nedelja	16	4	2028	t
00430000-562f-62e5-a4da-a45f8e1aecdf	velikonočna nedelja	1	4	2029	t
00430000-562f-62e5-e361-449f76e13b55	velikonočna nedelja	21	4	2030	t
00430000-562f-62e5-3b6e-56729274c9ce	velikonočni ponedeljek	28	3	2016	t
00430000-562f-62e5-75b8-0635d9bb526b	velikonočni ponedeljek	17	4	2017	t
00430000-562f-62e5-6a5a-8b4aa129e212	velikonočni ponedeljek	2	4	2018	t
00430000-562f-62e5-36f2-8be2109ed91d	velikonočni ponedeljek	22	4	2019	t
00430000-562f-62e5-0419-5367be0545f7	velikonočni ponedeljek	13	4	2020	t
00430000-562f-62e5-d2ac-860aa8147b2b	velikonočni ponedeljek	5	4	2021	t
00430000-562f-62e5-898c-9a11e687593d	velikonočni ponedeljek	18	4	2022	t
00430000-562f-62e5-6dd1-e48096eb60f1	velikonočni ponedeljek	10	4	2023	t
00430000-562f-62e5-cd5b-556236c5aaaf	velikonočni ponedeljek	1	4	2024	t
00430000-562f-62e5-8f56-4375a7555fb4	velikonočni ponedeljek	21	4	2025	t
00430000-562f-62e5-67f2-9e3f05febab9	velikonočni ponedeljek	6	4	2026	t
00430000-562f-62e5-9fe3-4a0a0c626f93	velikonočni ponedeljek	29	3	2027	t
00430000-562f-62e5-933c-302080f7b10d	velikonočni ponedeljek	17	4	2028	t
00430000-562f-62e5-1e55-c76c8ad251d9	velikonočni ponedeljek	2	4	2029	t
00430000-562f-62e5-2b5a-bf14289ddc37	velikonočni ponedeljek	22	4	2030	t
00430000-562f-62e5-2cdc-00408fea6594	binkoštna nedelja - binkošti	15	5	2016	t
00430000-562f-62e5-4266-64523e47f4f2	binkoštna nedelja - binkošti	4	6	2017	t
00430000-562f-62e5-55d5-b49e462e0a2f	binkoštna nedelja - binkošti	20	5	2018	t
00430000-562f-62e5-e477-dec181125335	binkoštna nedelja - binkošti	9	6	2019	t
00430000-562f-62e5-364d-92ce1c0098c2	binkoštna nedelja - binkošti	31	5	2020	t
00430000-562f-62e5-7315-e58b6bdfae6b	binkoštna nedelja - binkošti	23	5	2021	t
00430000-562f-62e5-75b8-98739744dcc3	binkoštna nedelja - binkošti	5	6	2022	t
00430000-562f-62e5-ac56-3520195b2365	binkoštna nedelja - binkošti	28	5	2023	t
00430000-562f-62e5-248a-95ad9c607267	binkoštna nedelja - binkošti	19	5	2024	t
00430000-562f-62e5-2297-1308d760b74f	binkoštna nedelja - binkošti	8	6	2025	t
00430000-562f-62e5-ce77-3024ccbd63e1	binkoštna nedelja - binkošti	24	5	2026	t
00430000-562f-62e5-b51b-0e63fdab2a16	binkoštna nedelja - binkošti	16	5	2027	t
00430000-562f-62e5-6ce7-8801987d5652	binkoštna nedelja - binkošti	4	6	2028	t
00430000-562f-62e5-1bff-5bc89890c91b	binkoštna nedelja - binkošti	20	5	2029	t
00430000-562f-62e5-a990-221a3e7725d4	binkoštna nedelja - binkošti	9	6	2030	t
\.


--
-- TOC entry 3073 (class 0 OID 23507822)
-- Dependencies: 195
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, dezurni_id, zaporedna, zaporednasez, objavljenzacetek, porocilo) FROM stdin;
\.


--
-- TOC entry 3074 (class 0 OID 23507834)
-- Dependencies: 196
-- Data for Name: predstava_abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava_abonma (predstava_id, abonma_id) FROM stdin;
\.


--
-- TOC entry 3089 (class 0 OID 23507976)
-- Dependencies: 211
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 3115 (class 0 OID 23508386)
-- Dependencies: 237
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, koproducent_id, odstotekfinanciranja, delez, maticnikop, kpe, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 3116 (class 0 OID 23508396)
-- Dependencies: 238
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, sifra, status) FROM stdin;
00190000-562f-62e7-618a-bb10329f024d	00080000-562f-62e7-0c02-4ce78bdf1591	0987	AK
00190000-562f-62e7-9176-7f5f1a4d3a9d	00080000-562f-62e7-fda9-c04e63166d88	0989	AK
00190000-562f-62e7-4a1b-85fe5434b875	00080000-562f-62e7-9a27-368cf7bd9a89	0986	AK
00190000-562f-62e7-f15c-c1d92ed09dad	00080000-562f-62e7-ac4a-218f66f1ab1d	0984	AK
00190000-562f-62e7-4011-3bee143008e5	00080000-562f-62e7-54a5-b2c6cd8e6b13	0983	AK
00190000-562f-62e7-13bd-51457a471f04	00080000-562f-62e7-3de9-a88bb60a3e3c	0982	AK
00190000-562f-62e9-758a-782423990457	00080000-562f-62e9-5b45-37f776743016	1001	AK
\.


--
-- TOC entry 3113 (class 0 OID 23508311)
-- Dependencies: 235
-- Data for Name: programdela; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programdela (id, sifra, naziv, zacetek, konec, zakljuceno, potrjenprogram, stpremier, stpremiervelikih, stpremiermalih, stpremiermalihkopr, stpremiervelikihkopr, stpremiersredkopr, stint, stfest, strazno, stizjem, stponprem, stponprej, stponprejvelikih, stponprejmalih, stponprejmalihkopr, stponprejsredkopr, stponprejvelikihkopr, stgostujo, vrps1, vrps1do, vrps1mat, vrps1gostovsz, stizvnekomerc, stizvprem, stizvpremdoma, stizvpremkopr, stizvponprem, stizvponpremdoma, stizvponpremzamejo, stizvponpremgost, stizvponpremkopr, stizvponpremint, stizvponpremkoprint, stizvponprej, stizvponprejdoma, stizvponprejzamejo, stizvponprejgost, stizvponprejkopr, stizvponprejint, stizvponprejkoprint, stizvgostuj, stizvostalihnek, stizvgostovanjslo, stizvgostovanjzam, stizvgostovanjint, stobisknekom, stobisknekommat, stobisknekomgostslo, stobisknekomgostzam, stobisknekomgostint, stobiskprem, stobiskpremdoma, stobiskpremkopr, stobiskponprem, stobiskponpremdoma, stobiskponpremkopr, stobiskponpremkoprint, stobiskponpremgost, stobiskponpremzamejo, stobiskponpremint, avgobiskprired, avgzaseddvoran, avgcenavstopnice, stprodvstopnic, stkoprodukcij, stkoprodukcijint, stkoprodukcijnvo, stzaposlenih, stzaposigralcev, avgstnastopovigr, sthonorarnihzun, sthonorarnihzunigr, sthonorarnihzunigrtujjz, sthonorarnihzunsamoz, sredstvaint, sredstvaavt, sredstvazaprosenoprem, sredstvazaprosenoponprem, sredstvazaprosenoponprej, sredstvazaprosenogostujo, sredstvazaprosenoint, sredstvazaprosenofest, sredstvazaprosenorazno, sredstvazaprosenoizjem, sredstvadrugijavniprem, sredstvadrugijavniponprem, sredstvadrugijavniponprej, sredstvadrugijavnigostujo, sredstvadrugijavniint, sredstvadrugijavnifest, sredstvadrugijavnirazno, sredstvadrugijavniizjem, sredstvadrugiviriprem, sredstvadrugiviriponprem, sredstvadrugiviriponprej, sredstvadrugivirigostujo, sredstvadrugiviriint, sredstvadrugivirifest, sredstvadrugivirirazno, sredstvadrugiviriizjem, sredstvaavtsamoz) FROM stdin;
00290000-562f-62e7-6560-589c55d973c7	0001	Testni program dela	2016-02-01	2017-02-01	f	f	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0.00	0	0	0	0.00	0	0.00	0.00	0	0	0	0.00	0	0.00	0.00	0	0	0	0	0.00	0.00	0.00	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	\N	0	0	0	\N	\N	0.00	0	0	0	0	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00
\.


--
-- TOC entry 3117 (class 0 OID 23508404)
-- Dependencies: 239
-- Data for Name: programskaenotasklopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programskaenotasklopa (id, naslovpe, avtorpe, obsegpe, mesecpe, vrednostpe, obiskdoma, programrazno_id) FROM stdin;
\.


--
-- TOC entry 3093 (class 0 OID 23508005)
-- Dependencies: 215
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, popa_id, naslov_id, sifra, naziv, jeprizorisce, jematicnioder, seplanira, kapaciteta, opis) FROM stdin;
00220000-562f-62e7-ae51-b13084e7b2ef	\N	\N	0001	Poskusna 1	f	\N	t	8	Poskusna učilnica v prvem
00220000-562f-62e7-1e55-5be47669a628	\N	\N	0002	Poskusna 3	f	\N	f	34	Poskusna učilnica v tretjem
00220000-562f-62e7-6c9f-b9d3ee351bc4	\N	\N	0003	Kazinska	t	\N	t	84	Kazinska dvorana
00220000-562f-62e7-8241-3e9649dc78a3	\N	\N	0004	Mali oder	t	\N	t	24	Mali oder 
00220000-562f-62e7-79c1-9bcd66699a77	\N	\N	0005	Komorni oder	t	\N	t	150	Komorni oder
00220000-562f-62e7-db08-486e15c3a371	\N	\N	0006	Stara dvorana	t	\N	t	96	Stara dvorana ali dvorana Franceta Prešerna
00220000-562f-62e7-b4f5-e69787c3a9b4	\N	\N	0007	Velika dvorana	t	\N	t	160	Velika, glavna dvorana
\.


--
-- TOC entry 3085 (class 0 OID 23507949)
-- Dependencies: 207
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 3084 (class 0 OID 23507939)
-- Dependencies: 206
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 3106 (class 0 OID 23508150)
-- Dependencies: 228
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta, status) FROM stdin;
\.


--
-- TOC entry 3100 (class 0 OID 23508080)
-- Dependencies: 222
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 3071 (class 0 OID 23507796)
-- Dependencies: 193
-- Data for Name: report; Type: TABLE DATA; Schema: public; Owner: -
--

COPY report (id, job_id, title, filename, transfers, size, format, hash, createdat) FROM stdin;
\.


--
-- TOC entry 3052 (class 0 OID 23507567)
-- Dependencies: 174
-- Data for Name: revizije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY revizije (id, razred, objectid, upor, datum, tip, data) FROM stdin;
1	App\\Entity\\Popa	00080000-562f-62e9-5b45-37f776743016	00010000-562f-62e6-dd71-35d32b1c74b3	2015-10-27 12:41:29	INS	a:0:{}
2	App\\Entity\\Option	00000000-562f-62e9-ccca-c35201db728a	00010000-562f-62e6-dd71-35d32b1c74b3	2015-10-27 12:41:29	INS	a:0:{}
3	ProgramDela\\Entity\\ProdukcijskaHisa	00190000-562f-62e9-758a-782423990457	00010000-562f-62e6-dd71-35d32b1c74b3	2015-10-27 12:41:29	INS	a:0:{}
\.


--
-- TOC entry 3136 (class 0 OID 0)
-- Dependencies: 173
-- Name: revizije_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('revizije_id_seq', 3, true);


--
-- TOC entry 3094 (class 0 OID 23508018)
-- Dependencies: 216
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 3056 (class 0 OID 23507605)
-- Dependencies: 178
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-562f-62e6-a241-926879cbf849	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-562f-62e6-1dd0-55e70ae0ef1f	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-562f-62e6-3b10-8685d48b4d70	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-562f-62e6-8ec2-5112845da503	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-562f-62e6-8a24-349356b3fd93	planer	Planer dogodkov v koledarju	t
00020000-562f-62e6-c048-5cbd3c62d189	kadrovska	Kadrovska služba	t
00020000-562f-62e6-60bd-3e65ec5a553c	arhivar	Ažuriranje arhivalij	t
00020000-562f-62e6-f4b1-152588febcb2	igralec	Igralec	t
00020000-562f-62e6-8740-9d9b885c4ca5	prisotnost	Vnašalec prisotnosti, tudi za tiste izven uprizoritev	t
00020000-562f-62e7-ddbb-7a547055a678	vsadovoljenja	Vloga z vsemi posameznimi dovoljenji	t
\.


--
-- TOC entry 3054 (class 0 OID 23507589)
-- Dependencies: 176
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-562f-62e6-c238-6a5497690ae8	00020000-562f-62e6-3b10-8685d48b4d70
00010000-562f-62e6-dd71-35d32b1c74b3	00020000-562f-62e6-3b10-8685d48b4d70
00010000-562f-62e7-ae2f-d543600b101e	00020000-562f-62e7-ddbb-7a547055a678
\.


--
-- TOC entry 3096 (class 0 OID 23508032)
-- Dependencies: 218
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 3088 (class 0 OID 23507970)
-- Dependencies: 210
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 3082 (class 0 OID 23507916)
-- Dependencies: 204
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, sifra, ime, zacetek, konec, aktivna) FROM stdin;
001f0000-562f-62e7-714a-b405c5b2a135	2015	Sezona 2015	2015-01-01	2015-12-31	t
001f0000-562f-62e7-f3b4-0b2aecefc7a2	2016	Sezona 2016	2016-01-01	2016-12-31	t
001f0000-562f-62e7-c1a1-7256c183119a	2017	Sezona 2017	2017-01-01	2017-12-31	t
\.


--
-- TOC entry 3050 (class 0 OID 23507554)
-- Dependencies: 172
-- Data for Name: stevilcenje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenje (id, sifra, naziv, prefix, suffix, zacetek, dolzina, format, globalno, poletih) FROM stdin;
00230000-562f-62e5-2113-0dc4c1bd79ce	pri	Privzeto številčenje po letih YYYY-N	\N	\N	1	1	%l-%n	f	t
00230000-562f-62e5-ca8f-4d19c8d69a01	123	Privzeto številčenje kratkih šifer	\N	\N	100	3	%n	f	f
00230000-562f-62e5-da88-16d4f4836781	bcd	Globalno številčenje črtnih kod	\N	\N	1	9	%n	t	f
00230000-562f-62e5-1d3f-903c446e0dfe	sif	Številčenje šifrant	\N	\N	1000	4	%n	f	f
00230000-562f-62e5-549f-a75f6d6c2673	tmp	Globalno številčenje začasnih številk	tmp	\N	1000	5	%l%n	t	t
\.


--
-- TOC entry 3049 (class 0 OID 23507546)
-- Dependencies: 171
-- Data for Name: stevilcenjekonfig; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjekonfig (id, stevilcenje_id, dok) FROM stdin;
00240000-562f-62e5-6422-3ef011695f70	00230000-562f-62e5-1d3f-903c446e0dfe	popa
00240000-562f-62e5-b275-a2ea7846f0b6	00230000-562f-62e5-1d3f-903c446e0dfe	oseba
00240000-562f-62e5-3b5d-5903a6d87793	00230000-562f-62e5-1d3f-903c446e0dfe	tippopa
00240000-562f-62e5-d369-dad2806376e4	00230000-562f-62e5-1d3f-903c446e0dfe	organizacijskaenota
00240000-562f-62e5-dc22-52c67e6f3f10	00230000-562f-62e5-1d3f-903c446e0dfe	sezona
00240000-562f-62e5-de46-5437cdef6682	00230000-562f-62e5-1d3f-903c446e0dfe	tipvaje
00240000-562f-62e5-44c5-d5cedebc0170	00230000-562f-62e5-ca8f-4d19c8d69a01	prostor
00240000-562f-62e5-2f05-ed23e459b258	00230000-562f-62e5-1d3f-903c446e0dfe	besedilo
00240000-562f-62e5-8ed5-3228a82b831b	00230000-562f-62e5-1d3f-903c446e0dfe	uprizoritev
00240000-562f-62e5-4b7e-f09cb18e8489	00230000-562f-62e5-1d3f-903c446e0dfe	funkcija
00240000-562f-62e5-d56f-124384bc8b8f	00230000-562f-62e5-1d3f-903c446e0dfe	tipfunkcije
00240000-562f-62e5-be4e-49317eb6a316	00230000-562f-62e5-1d3f-903c446e0dfe	alternacija
00240000-562f-62e5-feec-a35b440e8369	00230000-562f-62e5-2113-0dc4c1bd79ce	pogodba
00240000-562f-62e5-23f8-bf10cd67c524	00230000-562f-62e5-1d3f-903c446e0dfe	zaposlitev
00240000-562f-62e5-abf6-9568ff2472d5	00230000-562f-62e5-1d3f-903c446e0dfe	zvrstuprizoritve
00240000-562f-62e5-a294-66d777eacd2b	00230000-562f-62e5-2113-0dc4c1bd79ce	programdela
00240000-562f-62e5-74a9-2eeca8290bef	00230000-562f-62e5-1d3f-903c446e0dfe	zapis
\.


--
-- TOC entry 3048 (class 0 OID 23507541)
-- Dependencies: 170
-- Data for Name: stevilcenjestanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjestanje (id, objid, leto, stevilka) FROM stdin;
ab82af5d-dfd0-4e9c-920f-1f6b244acef2	00240000-562f-62e5-6422-3ef011695f70	0	1001
\.


--
-- TOC entry 3102 (class 0 OID 23508097)
-- Dependencies: 224
-- Data for Name: strosekuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY strosekuprizoritve (id, uprizoritev_id, popa_id, naziv, vrednostdo, vrednostna, opis, tipstroska, sort, vrstastroska_id) FROM stdin;
00270000-562f-62e7-b569-38873c494609	000e0000-562f-62e7-0e70-fc65d22efa9d	00080000-562f-62e7-aae7-3c27743e1371	Nabava kostumov	600.50	20.00	Krila in maske	materialni	1	003b0000-562f-62e5-6f85-d70108f7d55c
00270000-562f-62e7-32f5-aba029e12d87	000e0000-562f-62e7-0e70-fc65d22efa9d	00080000-562f-62e7-aae7-3c27743e1371	Zavese	125.70	3.10	Modra in zelena zavesa	materialni	2	003b0000-562f-62e5-6f85-d70108f7d55c
\.


--
-- TOC entry 3062 (class 0 OID 23507680)
-- Dependencies: 184
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 3083 (class 0 OID 23507926)
-- Dependencies: 205
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja, dezurni, gost) FROM stdin;
001a0000-562f-62e7-d34e-31e198d6786a	00180000-562f-62e7-f11e-811d494bd2ff	000c0000-562f-62e7-1686-cfa0d0a6b626	00090000-562f-62e7-82e1-054f7cc00cbe	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-562f-62e7-9c34-c96669c5d882	00180000-562f-62e7-f11e-811d494bd2ff	000c0000-562f-62e7-7463-1e841bba90af	00090000-562f-62e7-54b6-deae4d40c17f	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-562f-62e7-a5af-cc8338b47488	00180000-562f-62e7-f11e-811d494bd2ff	000c0000-562f-62e7-98da-ef14945cf436	00090000-562f-62e7-e12f-116c13c330fc	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-562f-62e8-9d16-0e2060c89bd9	00180000-562f-62e7-f11e-811d494bd2ff	000c0000-562f-62e7-b92f-5c3873779a49	00090000-562f-62e7-0bab-aaeaec55a2a8	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-562f-62e8-2ad7-ebdedb0bbe84	00180000-562f-62e7-f11e-811d494bd2ff	000c0000-562f-62e7-ebca-6dc081ef1111	00090000-562f-62e7-7cb4-07137f54abcc	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-562f-62e8-d9ee-849b0c64e501	00180000-562f-62e7-d9a0-ef5598421395	\N	00090000-562f-62e7-7cb4-07137f54abcc	2015-08-01 20:00:00	2015-08-01 23:00:00	\N	\N	2.00	t	f
001a0000-562f-62e8-fa7a-96f4f63d5742	00180000-562f-62e7-d9a0-ef5598421395	\N	00090000-562f-62e7-54b6-deae4d40c17f	2015-08-01 20:00:00	2015-08-01 23:00:00	\N	\N	2.00	f	t
\.


--
-- TOC entry 3105 (class 0 OID 23508138)
-- Dependencies: 227
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, sifra, ime, opis, imezenski, podrocje, sort) FROM stdin;
000f0000-562f-62e5-e628-f45f34e75d1f	01	Avtor	Avtorji	Avtorka	umetnik	150
000f0000-562f-62e5-5378-d5e0489d56c6	02	Priredba	Priredba	Priredba	umetnik	160
000f0000-562f-62e5-55bf-6e1b4b56fab0	03	Prevod	Prevod	Prevod	umetnik	20
000f0000-562f-62e5-899b-642401325874	04	Režija	Režija	Režija	umetnik	30
000f0000-562f-62e5-adfc-239467deb805	05	Dramaturgija	Dramaturgija	Dramaturgija	umetnik	40
000f0000-562f-62e5-192a-5561ab2f11f4	06	Scenografija	Scenografija	Scenografija	umetnik	60
000f0000-562f-62e5-63b8-e16a3b153a6f	07	Kostumografija	Kostumografija	Kostumografija	umetnik	70
000f0000-562f-62e5-12de-f75d6ab5ee22	08	Koreografija	Koreografija	Koreografija	umetnik	90
000f0000-562f-62e5-058e-5ad3e3ef22de	09	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	umetnik	100
000f0000-562f-62e5-caa5-988d579adec4	10	Oblikovanje maske	Oblikovanje maske	Oblikovanje maske	umetnik	110
000f0000-562f-62e5-1432-aed356094a90	11	Lektorstvo	Lektorstvo	Lektorstvo	umetnik	50
000f0000-562f-62e5-2b8b-1055ffb18b36	12	Glasbeni soustvarjalec	Glasbeni soustvarjalci	Glasbena soustvarjalka	umetnik	80
000f0000-562f-62e5-569c-49c2996868d5	13	Intermedijski ustvarjalec	Intermedijski ustvarjalci	Intermedijski ustvarjalka	umetnik	130
000f0000-562f-62e5-2ffb-7a4bee9b7926	14	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	umetnik	120
000f0000-562f-62e5-bfda-b6029c94c6a1	15	Vloga	Intermedijski ustvarjalci	Intermedijska ustvarjalka	igralec	10
000f0000-562f-62e5-71a6-2c53bfcdf01c	16	Produkcija, mentorstvo	Produkcija, mentorstvo	Produkcija, mentorstvo	umetnik	140
000f0000-562f-62e5-b354-d66bfb09a7c5	17	Tehnična in druga podpora	Tehnična in druga podpora	Tehnična in druga podpora	tehnik	180
000f0000-562f-62e5-4255-2b16ab252865	18	Inšpicient	Inšpicienti	Inšpicientka	inspicient	170
\.


--
-- TOC entry 3059 (class 0 OID 23507631)
-- Dependencies: 181
-- Data for Name: tippopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tippopa (id, sifra, ime, opis) FROM stdin;
00400000-562f-62e7-6646-30041c2caaf8	0001	šola	osnovna ali srednja šola
00400000-562f-62e7-a004-dd6c636855dc	0002	gledalec	gledalec, ki ima abonma ali podobno
00400000-562f-62e7-c1af-aaa9ed5362b3	0003	sponzor	sponzor dogodkov
\.


--
-- TOC entry 3118 (class 0 OID 23508415)
-- Dependencies: 240
-- Data for Name: tipprogramskeenote; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipprogramskeenote (id, sifra, naziv, koprodukcija, maxfaktor, maxvsi) FROM stdin;
002b0000-562f-62e5-5f85-d81e0d0fff8d	01	Velika predstava	f	1.00	1.00
002b0000-562f-62e5-1f4f-8ef996194f47	02	Mala predstava	f	0.50	0.50
002b0000-562f-62e5-00a5-ca5981dc7125	03	Mala koprodukcija	t	0.40	1.00
002b0000-562f-62e5-5e4e-ae96c634ed3d	04	Srednja koprodukcija	t	0.70	2.00
002b0000-562f-62e5-b217-2b58ea51dac0	05	Velika koprodukcija	t	1.00	3.00
\.


--
-- TOC entry 3081 (class 0 OID 23507906)
-- Dependencies: 203
-- Data for Name: tipvaje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipvaje (id, sifra, ime, opis) FROM stdin;
00420000-562f-62e5-df73-d029f391a0d1	0001	prva vaja	prva vaja
00420000-562f-62e5-639c-96c4442cd23b	0002	tehnična vaja	tehnična vaja
00420000-562f-62e5-0eee-2800bd750445	0003	lučna vaja	lučna vaja
00420000-562f-62e5-33e6-3207682f7600	0004	kostumska vaja	kostumska vaja
00420000-562f-62e5-c737-9c7e2514ac63	0005	foto vaja	foto vaja
00420000-562f-62e5-4f33-f98745e1f450	0006	1. glavna vaja	1. glavna vaja
00420000-562f-62e5-5682-cdd3964adca2	0007	2. glavna vaja	2. glavna vaja
00420000-562f-62e5-5550-0a556a19d7a3	0008	1. generalka	1. generalka
00420000-562f-62e5-6a19-60a484849388	0009	2. generalka	2. generalka
00420000-562f-62e5-390d-6f1b46a2cbb6	0010	odprta generalka	odprta generalka
00420000-562f-62e5-177a-d147517a7f80	0011	obnovitvena vaja	obnovitvena vaja
00420000-562f-62e5-1ee9-c7f7bec82568	0012	pevska vaja	pevska vaja
00420000-562f-62e5-4b5b-7718f9d98e9e	0013	postavitev scene	postavitev scene (za pripravo vaje)
00420000-562f-62e5-e463-e6b7981a7a8e	0014	postavitev luči	postavitev luči (za pripravo vaje)
\.


--
-- TOC entry 3068 (class 0 OID 23507753)
-- Dependencies: 190
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 3053 (class 0 OID 23507576)
-- Dependencies: 175
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-562f-62e6-dd71-35d32b1c74b3	Konzolcni	$2y$05$NS4xMjkyMTcwMzExMjAxROuB3qyxiWZfK8l2pYTQDzJuVMnC45.Tq	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-562f-62e7-9266-b6a1961e5dd1	testni uporabnik za inšpicienta	$2y$05$NS4xMjkyMTcwMzExMjAxROxkJ1B6xAXex6EZLIwJfWzRJ8DpfecFO	t	\N	\N	\N	ivo@ifigenija.si	\N	\N	\N
00010000-562f-62e7-0187-8c695fdfd7ef	testni uporabnik za Tehničnega vodjo	$2y$05$NS4xMjkyMTcwMzExMjAxROu/kXWR9sP9oamkesKuxXLbxkCb387.G	t	\N	\N	\N	tona@ifigenija.si	\N	\N	\N
00010000-562f-62e7-15ee-b93263858a3a	testni uporabnik za igralca	$2y$05$NS4xMjkyMTcwMzExMjAxRO/hLCgClfERRsfCAFYwxNCcFIVjP2982	t	\N	\N	\N	irena@ifigenija.si	\N	\N	\N
00010000-562f-62e7-371f-f32724d845df	testni uporabnik vnašalca termina storitev (TerminStoritve-vse)	$2y$05$NS4xMjkyMTcwMzExMjAxROT6.kTHqEq4.wa2SOnf124/N14m9qeP.	t	\N	\N	\N	tatjana@ifigenija.si	\N	\N	\N
00010000-562f-62e7-e8b6-37537412b1bb	testni uporabnik, ki je inšpicient brez zapisov v TerminStoritve	$2y$05$NS4xMjkyMTcwMzExMjAxROHau47Dtb7CME5.nlWwBVM.nusFP.ra2	t	\N	\N	\N	joze@ifigenija.si	\N	\N	\N
00010000-562f-62e7-dcfd-b020086264a9	testna uporabnica, ki je planerka	$2y$05$NS4xMjkyMTcwMzExMjAxRO.B/uJO3C7QRNhdX9Q2hTLQsSupj1V1S	t	\N	\N	\N	petra@ifigenija.si	\N	\N	\N
00010000-562f-62e7-59c9-060decad857a	testni uporabnik, ki dobi ifi-all vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROv2d7jqhaV/Mz3EIsKoi7UoFR.SDSMBm	t	\N	\N	\N	ali@ifigenija.si	\N	\N	\N
00010000-562f-62e7-2c44-f3d07970fb75	testni uporabnik, ki dobi ifi-readall vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROYB9g.gnkufr1l/gWK6mkx.ySqrOWnJC	t	\N	\N	\N	berta@ifigenija.si	\N	\N	\N
00010000-562f-62e7-5ec9-378a58ced61c	testni uporabnik, ki dobi aaa-write dovoljenje	$2y$05$NS4xMjkyMTcwMzExMjAxRORujYObKX.DzpXVYbePkiJkHqg0/Ylya	t	\N	\N	\N	aaron@ifigenija.si	\N	\N	\N
00010000-562f-62e7-ae2f-d543600b101e	testni uporabnik ki dobi vsa posamezna dovoljenja	$2y$05$NS4xMjkyMTcwMzExMjAxRO2ymwxVXTr7U4Ncdn.bN49E8rLw9Jg0O	t	\N	\N	\N	vesna@ifigenija.si	\N	\N	\N
00010000-562f-62e6-c238-6a5497690ae8	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 3109 (class 0 OID 23508188)
-- Dependencies: 231
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, producent_id, sifra, faza, naslov, podnaslov, delovninaslov, internacionalninaslov, naslovizvirnika, podnaslovizvirnika, datumzacstudija, stevilovaj, planiranostevilovaj, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, krstna, prvaslovenska, kratkinaslov, jekoprodukcija, maticnioder_id) FROM stdin;
000e0000-562f-62e7-69bb-6a332d4a10fa	00160000-562f-62e7-fd0a-f29e70d309fb	\N	00140000-562f-62e5-75f4-34ff2d481ff2	\N	0001	produkcija	Sen kresne noči		Sanje	\N	\N	\N	2016-02-01	\N	\N	2016-06-01	1	William  Shakespeare - Nebojša  Kavader	f	2				\N	f	\N	\N		\N	00220000-562f-62e7-79c1-9bcd66699a77
000e0000-562f-62e7-0e70-fc65d22efa9d	00160000-562f-62e7-142f-dd036baf4603	\N	00140000-562f-62e5-1e88-f3eb78017e77	\N	0002	predprodukcija-ideja	Smoletov vrt			\N	\N	\N	2016-01-01	\N	\N	2016-04-20	2	Berta   Hočevar	f	2				\N	f	\N	\N		\N	00220000-562f-62e7-db08-486e15c3a371
000e0000-562f-62e7-c5ab-638de55eacad	\N	\N	00140000-562f-62e5-1e88-f3eb78017e77	00190000-562f-62e7-618a-bb10329f024d	0003	postprodukcija	Kisli maček			\N	\N	\N	2016-02-01	\N	\N	2016-04-20	2	\N	t	2				\N	f	\N	\N		\N	00220000-562f-62e7-79c1-9bcd66699a77
000e0000-562f-62e7-7a7f-7bf3f1ab0ecb	\N	\N	00140000-562f-62e5-1e88-f3eb78017e77	00190000-562f-62e7-618a-bb10329f024d	0004	postprodukcija	Vladimir			\N	\N	\N	2017-03-01	\N	\N	2017-04-20	2	\N	t	2				\N	f	\N	\N		\N	00220000-562f-62e7-79c1-9bcd66699a77
000e0000-562f-62e7-b2e5-a48addf58371	\N	\N	00140000-562f-62e5-1e88-f3eb78017e77	00190000-562f-62e7-618a-bb10329f024d	0005	postprodukcija	Španska princesa			\N	\N	\N	2017-04-01	\N	\N	2017-05-20	1	\N	f	1				\N	f	\N	\N		\N	00220000-562f-62e7-ae51-b13084e7b2ef
000e0000-562f-62e7-bedc-9c3f3e56e116	\N	\N	00140000-562f-62e5-1e88-f3eb78017e77	00190000-562f-62e7-618a-bb10329f024d	0006	postprodukcija	Ne vemo datumov			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-562f-62e7-ae51-b13084e7b2ef
\.


--
-- TOC entry 3076 (class 0 OID 23507852)
-- Dependencies: 198
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, tipvaje_id, uprizoritev_id, zaporedna, porocilo) FROM stdin;
00200000-562f-62e7-a7a6-aa3222b3d432	\N	000e0000-562f-62e7-0e70-fc65d22efa9d	1	
00200000-562f-62e7-ecc2-0455678fd9d2	\N	000e0000-562f-62e7-0e70-fc65d22efa9d	2	
00200000-562f-62e7-3cec-dbf49e85f29f	\N	000e0000-562f-62e7-0e70-fc65d22efa9d	3	
00200000-562f-62e7-6ff0-eb577208bfdf	\N	000e0000-562f-62e7-0e70-fc65d22efa9d	4	
00200000-562f-62e7-10fc-a78c5080bcfc	\N	000e0000-562f-62e7-0e70-fc65d22efa9d	5	
\.


--
-- TOC entry 3092 (class 0 OID 23507997)
-- Dependencies: 214
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 3103 (class 0 OID 23508111)
-- Dependencies: 225
-- Data for Name: vrstastroska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstastroska (id, skupina, podskupina, naziv, opis) FROM stdin;
003b0000-562f-62e5-cef9-1f2df45fa502	1	0	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE
003b0000-562f-62e5-7e39-0c4044663ce0	1	1	Storitve varovanja zgradb in prostorov	storitve varovanja zgradb in prostorov (npr. gasilci na predstavah)
003b0000-562f-62e5-e1bc-5fd16d3bec90	1	2	Založniške in tiskarske storitve	založniške in tiskarske storitve
003b0000-562f-62e5-69c1-ef2ef4d018ec	1	3	Časopisi, revije, knjige in strokovna literatura	časopisi, revije, knjige in strokovna literatura
003b0000-562f-62e5-9c75-a289571963c0	1	4	Stroški prevajalskih storitev	stroški prevajalskih storitev
003b0000-562f-62e5-f116-e109ebf19771	1	5	Stroški oglaševalskih storitev	stroški oglaševalskih storitev
003b0000-562f-62e5-aa5c-8a75210ba85e	1	6	Izdatki za reprezentanco	izdatki za reprezentanco
003b0000-562f-62e5-5b65-24803748d4bb	2	0	POSEBNI MATERIAL IN STORITVE	POSEBNI MATERIAL IN STORITVE
003b0000-562f-62e5-6f85-d70108f7d55c	2	1	Drugi posebni material in storitve	drugi posebni material in storitve (npr. za instrumete - navedite)
003b0000-562f-62e5-a073-9f5c67df7c70	2	2	Oprema predstave – stroški rekvizitov	Oprema predstave – stroški rekvizitov
003b0000-562f-62e5-9372-86e6a7215f57	2	3	Oprema predstave – stroški kostumov	Oprema predstave – stroški kostumov
003b0000-562f-62e5-79ee-00b98d0f027f	2	4	Oprema predstave – stroški scenske opreme	Oprema predstave – stroški scenske opreme
003b0000-562f-62e5-c223-7a3764e80c7d	2	5	Oprema predstave – stroški avdio in video opreme	Oprema predstave – stroški avdio in video opreme
003b0000-562f-62e5-b47c-1c2848fcf637	3	0	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE
003b0000-562f-62e5-d3c5-d67e7006aca5	3	1	Poštnina in kurirske storitve	poštnina in kurirske storitve
003b0000-562f-62e5-33c7-f0de35845b5c	4	0	PREVOZNI STROŠKI IN STORITVE	PREVOZNI STROŠKI IN STORITVE
003b0000-562f-62e5-a583-8dd89ed8643b	4	1	Goriva in maziva za prevozna sredstva	goriva in maziva za prevozna sredstva
003b0000-562f-62e5-c0a0-7ae8f6937b98	4	2	Najem vozil in selitveni stroški	najem vozil in selitveni stroški
003b0000-562f-62e5-aba2-6ab01ed6f5a4	4	3	Drugi prevozni in transportni stroški 	drugi prevozni in transportni stroški (navedite)
003b0000-562f-62e5-19f9-2e7989ad7bd9	5	0	IZDATKI ZA SLUŽBENA POTOVANJA	IZDATKI ZA SLUŽBENA POTOVANJA
003b0000-562f-62e5-5231-c6e1e7914ad8	5	1	Dnevnice za službena potovanja v državi in tujini	dnevnice za službena potovanja v državi in tujini
003b0000-562f-62e5-20b0-9435af3cf856	5	2	Hotelske in restavra. storitve v državi in tujini	hotelske in restavra. storitve v državi in tujini
003b0000-562f-62e5-cafe-3a8cb2fc34e9	5	3	Stroški prevoza v državi in tujini	stroški prevoza v državi in tujini
003b0000-562f-62e5-1a2a-4cb11b5cdb31	5	4	Drugi izdatki za službena potovanja	drugi izdatki za službena potovanja (navedite)
003b0000-562f-62e5-052d-88990c7718e6	6	0	NAJEMNINE IN ZAKUPNINE	NAJEMNINE IN ZAKUPNINE
003b0000-562f-62e5-6d86-721189105c22	6	1	Druge najemnine, zakupnine in licenčnine	druge najemnine, zakupnine in licenčnine (npr. najem notnega materiala, instrumentov - navedite)
003b0000-562f-62e5-989d-81a67cd6e8da	7	0	DRUGI OPERATIVNI ODHODKI	DRUGI OPERATIVNI ODHODKI
003b0000-562f-62e5-7df4-c49fc720f322	7	1	Izdatki za strok. izobraževanje zap.	izdatki za strok. izobraževanje zap.(vezani na program. enote)  
\.


--
-- TOC entry 3121 (class 0 OID 23508462)
-- Dependencies: 243
-- Data for Name: vrstazapisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstazapisa (id, oznaka, naziv, aktiven, znacka, ikona, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3120 (class 0 OID 23508434)
-- Dependencies: 242
-- Data for Name: zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapis (id, vrsta_id, datoteka_id, mapa_id, avtor_id, zaklenil_id, tip, zaklenjen, datumzaklepanja, identifier, subject, title, description, coverage, creator, language, date, publisher, relation, rights, source, upor, datknj, standard, lokacija) FROM stdin;
\.


--
-- TOC entry 3122 (class 0 OID 23508474)
-- Dependencies: 244
-- Data for Name: zapislastnik; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapislastnik (id, zapis_id, lastnik, classlastnika, datum, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3099 (class 0 OID 23508069)
-- Dependencies: 221
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, sifra, status, delovnomesto, zacetek, konec, tip, delovnaobveza, malica, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci, organizacijskaenota_id) FROM stdin;
00100000-562f-62e7-250d-e639c12482d5	00090000-562f-62e7-54b6-deae4d40c17f	0010	A	Mojster	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-562f-62e7-4761-c363482d192e	00090000-562f-62e7-e12f-116c13c330fc	0003	A	Igralec	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-562f-62e7-d766-a32f42456ccb	00090000-562f-62e7-9438-5116017c9946	0008	A	Natakar	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-562f-62e7-aea3-828378512722	00090000-562f-62e7-b17c-d92703ecc240	0004	A	Mizar	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-562f-62e7-1af7-d4d81c570081	00090000-562f-62e7-0ab6-63385326e131	0009	A	Šivilja	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-562f-62e7-e841-8e0c96f01f00	00090000-562f-62e7-f825-170c6d7ffc90	0007	A	Inšpicient	2010-02-01	\N	1	2		t	f	f	t	\N
\.


--
-- TOC entry 3079 (class 0 OID 23507895)
-- Dependencies: 201
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id, oseba_id) FROM stdin;
\.


--
-- TOC entry 3108 (class 0 OID 23508178)
-- Dependencies: 230
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, sifra, naziv, opis) FROM stdin;
00140000-562f-62e5-75f4-34ff2d481ff2	01	Drama	drama (SURS 01)
00140000-562f-62e5-0f5e-6565ff71d345	02	Opera	opera (SURS 02)
00140000-562f-62e5-c1ff-cf7a16545e90	03	Balet	balet (SURS 03)
00140000-562f-62e5-6421-52069ae7dbec	04	Plesne prireditve	plesne prireditve (SURS 04)
00140000-562f-62e5-e73f-5f0a7627e9bd	05	Lutkovno gledališče	lutkovno gledališče (SURS 05)
00140000-562f-62e5-1e88-f3eb78017e77	06	Raziskovalno gledališče	raziskovalno gledališče (SURS 06)
00140000-562f-62e5-7631-fc365bee5de7	07	Drugo	drugo (SURS 07)
\.


--
-- TOC entry 3098 (class 0 OID 23508059)
-- Dependencies: 220
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, sifra, naziv, opis) FROM stdin;
\.


--
-- TOC entry 2548 (class 2606 OID 23507630)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2764 (class 2606 OID 23508237)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2760 (class 2606 OID 23508227)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2723 (class 2606 OID 23508094)
-- Name: avtorbesedila_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT avtorbesedila_pkey PRIMARY KEY (id);


--
-- TOC entry 2734 (class 2606 OID 23508136)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2821 (class 2606 OID 23508514)
-- Name: datoteka_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT datoteka_pkey PRIMARY KEY (id);


--
-- TOC entry 2630 (class 2606 OID 23507884)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2645 (class 2606 OID 23507905)
-- Name: dogodeksplosni_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodeksplosni
    ADD CONSTRAINT dogodeksplosni_pkey PRIMARY KEY (id);


--
-- TOC entry 2797 (class 2606 OID 23508432)
-- Name: drugivir_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT drugivir_pkey PRIMARY KEY (id);


--
-- TOC entry 2593 (class 2606 OID 23507779)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2771 (class 2606 OID 23508305)
-- Name: enotaprograma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT enotaprograma_pkey PRIMARY KEY (id);


--
-- TOC entry 2707 (class 2606 OID 23508055)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2621 (class 2606 OID 23507850)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2610 (class 2606 OID 23507817)
-- Name: job_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY job
    ADD CONSTRAINT job_pkey PRIMARY KEY (id);


--
-- TOC entry 2601 (class 2606 OID 23507793)
-- Name: kontaktnaoseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT kontaktnaoseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2671 (class 2606 OID 23507962)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2815 (class 2606 OID 23508491)
-- Name: mapa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT mapa_pkey PRIMARY KEY (id);


--
-- TOC entry 2819 (class 2606 OID 23508498)
-- Name: mapa_zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT mapa_zapis_pkey PRIMARY KEY (mapa_id, zapis_id);


--
-- TOC entry 2826 (class 2606 OID 23508522)
-- Name: mapaacl_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT mapaacl_pkey PRIMARY KEY (id);


--
-- TOC entry 2683 (class 2606 OID 23507989)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2586 (class 2606 OID 23507751)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2556 (class 2606 OID 23507649)
-- Name: optionvalue_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT optionvalue_pkey PRIMARY KEY (id);


--
-- TOC entry 2575 (class 2606 OID 23507713)
-- Name: organizacijskaenota_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT organizacijskaenota_pkey PRIMARY KEY (id);


--
-- TOC entry 2559 (class 2606 OID 23507676)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2546 (class 2606 OID 23507619)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2539 (class 2606 OID 23507604)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2686 (class 2606 OID 23507995)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2700 (class 2606 OID 23508031)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2746 (class 2606 OID 23508173)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2569 (class 2606 OID 23507704)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2583 (class 2606 OID 23507739)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2781 (class 2606 OID 23508384)
-- Name: postavkacdve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkacdve
    ADD CONSTRAINT postavkacdve_pkey PRIMARY KEY (id);


--
-- TOC entry 2675 (class 2606 OID 23507968)
-- Name: postavkaracuna_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT postavkaracuna_pkey PRIMARY KEY (id);


--
-- TOC entry 2581 (class 2606 OID 23507729)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2628 (class 2606 OID 23507869)
-- Name: praznik_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY praznik
    ADD CONSTRAINT praznik_pkey PRIMARY KEY (id);


--
-- TOC entry 2619 (class 2606 OID 23507838)
-- Name: predstava_abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava_abonma
    ADD CONSTRAINT predstava_abonma_pkey PRIMARY KEY (predstava_id, abonma_id);


--
-- TOC entry 2615 (class 2606 OID 23507830)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2681 (class 2606 OID 23507980)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2785 (class 2606 OID 23508393)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2787 (class 2606 OID 23508401)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2778 (class 2606 OID 23508371)
-- Name: programdela_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT programdela_pkey PRIMARY KEY (id);


--
-- TOC entry 2792 (class 2606 OID 23508413)
-- Name: programskaenotasklopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT programskaenotasklopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2693 (class 2606 OID 23508013)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2669 (class 2606 OID 23507953)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2663 (class 2606 OID 23507944)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2741 (class 2606 OID 23508160)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2721 (class 2606 OID 23508087)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2604 (class 2606 OID 23507805)
-- Name: report_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY report
    ADD CONSTRAINT report_pkey PRIMARY KEY (id);


--
-- TOC entry 2531 (class 2606 OID 23507575)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2698 (class 2606 OID 23508022)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2537 (class 2606 OID 23507593)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2541 (class 2606 OID 23507613)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2705 (class 2606 OID 23508040)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2677 (class 2606 OID 23507975)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2651 (class 2606 OID 23507924)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2528 (class 2606 OID 23507563)
-- Name: stevilcenje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenje
    ADD CONSTRAINT stevilcenje_pkey PRIMARY KEY (id);


--
-- TOC entry 2525 (class 2606 OID 23507551)
-- Name: stevilcenjekonfig_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT stevilcenjekonfig_pkey PRIMARY KEY (id);


--
-- TOC entry 2522 (class 2606 OID 23507545)
-- Name: stevilcenjestanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjestanje
    ADD CONSTRAINT stevilcenjestanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2730 (class 2606 OID 23508107)
-- Name: strosekuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT strosekuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2565 (class 2606 OID 23507685)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2657 (class 2606 OID 23507935)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2737 (class 2606 OID 23508147)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2550 (class 2606 OID 23507638)
-- Name: tippopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tippopa
    ADD CONSTRAINT tippopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2794 (class 2606 OID 23508425)
-- Name: tipprogramskeenote_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipprogramskeenote
    ADD CONSTRAINT tipprogramskeenote_pkey PRIMARY KEY (id);


--
-- TOC entry 2647 (class 2606 OID 23507913)
-- Name: tipvaje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipvaje
    ADD CONSTRAINT tipvaje_pkey PRIMARY KEY (id);


--
-- TOC entry 2591 (class 2606 OID 23507764)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2533 (class 2606 OID 23507588)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2758 (class 2606 OID 23508206)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2626 (class 2606 OID 23507859)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2689 (class 2606 OID 23508003)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2732 (class 2606 OID 23508119)
-- Name: vrstastroska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstastroska
    ADD CONSTRAINT vrstastroska_pkey PRIMARY KEY (id);


--
-- TOC entry 2808 (class 2606 OID 23508472)
-- Name: vrstazapisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstazapisa
    ADD CONSTRAINT vrstazapisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2805 (class 2606 OID 23508456)
-- Name: zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT zapis_pkey PRIMARY KEY (id);


--
-- TOC entry 2811 (class 2606 OID 23508480)
-- Name: zapislastnik_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT zapislastnik_pkey PRIMARY KEY (id);


--
-- TOC entry 2717 (class 2606 OID 23508077)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2643 (class 2606 OID 23507899)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2750 (class 2606 OID 23508186)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2713 (class 2606 OID 23508067)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2631 (class 1259 OID 23507893)
-- Name: dogodki_konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_konec ON dogodek USING btree (konec);


--
-- TOC entry 2632 (class 1259 OID 23507894)
-- Name: dogodki_razred; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_razred ON dogodek USING btree (razred);


--
-- TOC entry 2633 (class 1259 OID 23507892)
-- Name: dogodki_zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2634 (class 1259 OID 23507891)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2635 (class 1259 OID 23507890)
-- Name: idx_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2726 (class 1259 OID 23508108)
-- Name: idx_11ffe6e05c75296c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e05c75296c ON strosekuprizoritve USING btree (vrstastroska_id);


--
-- TOC entry 2727 (class 1259 OID 23508109)
-- Name: idx_11ffe6e062b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e062b4ffca ON strosekuprizoritve USING btree (uprizoritev_id);


--
-- TOC entry 2728 (class 1259 OID 23508110)
-- Name: idx_11ffe6e06beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e06beede51 ON strosekuprizoritve USING btree (popa_id);


--
-- TOC entry 2812 (class 1259 OID 23508493)
-- Name: idx_14a5d6d3727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d3727aca70 ON mapa USING btree (parent_id);


--
-- TOC entry 2813 (class 1259 OID 23508492)
-- Name: idx_14a5d6d38a4a6c12; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d38a4a6c12 ON mapa USING btree (lastnik_id);


--
-- TOC entry 2566 (class 1259 OID 23507706)
-- Name: idx_1c7adba589552cb2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba589552cb2 ON popa USING btree (tipkli_id);


--
-- TOC entry 2567 (class 1259 OID 23507707)
-- Name: idx_1c7adba5ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba5ee4b985a ON popa USING btree (drzava_id);


--
-- TOC entry 2684 (class 1259 OID 23507996)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2799 (class 1259 OID 23508460)
-- Name: idx_1ed92829253c4123; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829253c4123 ON zapis USING btree (avtor_id);


--
-- TOC entry 2800 (class 1259 OID 23508459)
-- Name: idx_1ed9282957ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282957ed422f ON zapis USING btree (mapa_id);


--
-- TOC entry 2801 (class 1259 OID 23508461)
-- Name: idx_1ed9282987ff3295; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282987ff3295 ON zapis USING btree (zaklenil_id);


--
-- TOC entry 2802 (class 1259 OID 23508458)
-- Name: idx_1ed92829a54dbb1f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829a54dbb1f ON zapis USING btree (datoteka_id);


--
-- TOC entry 2803 (class 1259 OID 23508457)
-- Name: idx_1ed92829ef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829ef943358 ON zapis USING btree (vrsta_id);


--
-- TOC entry 2678 (class 1259 OID 23507982)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2679 (class 1259 OID 23507981)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2623 (class 1259 OID 23507860)
-- Name: idx_2390fc964ad2a6ea; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc964ad2a6ea ON vaja USING btree (tipvaje_id);


--
-- TOC entry 2624 (class 1259 OID 23507861)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2708 (class 1259 OID 23508056)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2709 (class 1259 OID 23508058)
-- Name: idx_23aeb9586b361365; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9586b361365 ON funkcija USING btree (tipfunkcije_id);


--
-- TOC entry 2710 (class 1259 OID 23508057)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2598 (class 1259 OID 23507795)
-- Name: idx_2942b10710389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b10710389148 ON kontaktnaoseba USING btree (oseba_id);


--
-- TOC entry 2599 (class 1259 OID 23507794)
-- Name: idx_2942b1076beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b1076beede51 ON kontaktnaoseba USING btree (popa_id);


--
-- TOC entry 2790 (class 1259 OID 23508414)
-- Name: idx_2d901816d6bc69d6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2d901816d6bc69d6 ON programskaenotasklopa USING btree (programrazno_id);


--
-- TOC entry 2742 (class 1259 OID 23508175)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2743 (class 1259 OID 23508176)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2744 (class 1259 OID 23508177)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2809 (class 1259 OID 23508481)
-- Name: idx_2eaff9dcaf91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2eaff9dcaf91ecd ON zapislastnik USING btree (zapis_id);


--
-- TOC entry 2751 (class 1259 OID 23508211)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2752 (class 1259 OID 23508208)
-- Name: idx_344a77a7c3b0d59; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a7c3b0d59 ON uprizoritev USING btree (maticnioder_id);


--
-- TOC entry 2753 (class 1259 OID 23508212)
-- Name: idx_344a77a853a965c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a853a965c ON uprizoritev USING btree (producent_id);


--
-- TOC entry 2754 (class 1259 OID 23508210)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2755 (class 1259 OID 23508209)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2588 (class 1259 OID 23507766)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2589 (class 1259 OID 23507765)
-- Name: idx_37f6541a6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a6beede51 ON trr USING btree (popa_id);


--
-- TOC entry 2557 (class 1259 OID 23507679)
-- Name: idx_466966d769e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_466966d769e8d4 ON oseba USING btree (naslov_id);


--
-- TOC entry 2696 (class 1259 OID 23508023)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2543 (class 1259 OID 23507620)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2544 (class 1259 OID 23507621)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2701 (class 1259 OID 23508043)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2702 (class 1259 OID 23508042)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2703 (class 1259 OID 23508041)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2571 (class 1259 OID 23507716)
-- Name: idx_5e2fdc29289ed596; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29289ed596 ON organizacijskaenota USING btree (vodja_id);


--
-- TOC entry 2572 (class 1259 OID 23507715)
-- Name: idx_5e2fdc29727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29727aca70 ON organizacijskaenota USING btree (parent_id);


--
-- TOC entry 2573 (class 1259 OID 23507717)
-- Name: idx_5e2fdc29f0020ed7; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29f0020ed7 ON organizacijskaenota USING btree (namestnik_id);


--
-- TOC entry 2611 (class 1259 OID 23507833)
-- Name: idx_602f6e461174bb0e; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e461174bb0e ON predstava USING btree (dezurni_id);


--
-- TOC entry 2612 (class 1259 OID 23507831)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2613 (class 1259 OID 23507832)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2523 (class 1259 OID 23507553)
-- Name: idx_6054e804ff55f926; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_6054e804ff55f926 ON stevilcenjekonfig USING btree (stevilcenje_id);


--
-- TOC entry 2658 (class 1259 OID 23507948)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2659 (class 1259 OID 23507946)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2660 (class 1259 OID 23507945)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2661 (class 1259 OID 23507947)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2534 (class 1259 OID 23507594)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2535 (class 1259 OID 23507595)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2687 (class 1259 OID 23508004)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2822 (class 1259 OID 23508515)
-- Name: idx_781826c67e3c61f9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_781826c67e3c61f9 ON datoteka USING btree (owner_id);


--
-- TOC entry 2724 (class 1259 OID 23508096)
-- Name: idx_7ab77b7910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7ab77b7910389148 ON avtorbesedila USING btree (oseba_id);


--
-- TOC entry 2725 (class 1259 OID 23508095)
-- Name: idx_7ab77b79f35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7ab77b79f35157b1 ON avtorbesedila USING btree (besedilo_id);


--
-- TOC entry 2823 (class 1259 OID 23508523)
-- Name: idx_7adc957157ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc957157ed422f ON mapaacl USING btree (mapa_id);


--
-- TOC entry 2824 (class 1259 OID 23508524)
-- Name: idx_7adc9571fa6311ef; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc9571fa6311ef ON mapaacl USING btree (perm_id);


--
-- TOC entry 2673 (class 1259 OID 23507969)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2718 (class 1259 OID 23508088)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2719 (class 1259 OID 23508089)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2772 (class 1259 OID 23508310)
-- Name: idx_8787a0e54ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e54ae1cd1c ON enotaprograma USING btree (gostitelj_id);


--
-- TOC entry 2773 (class 1259 OID 23508309)
-- Name: idx_8787a0e55d0da56c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e55d0da56c ON enotaprograma USING btree (drzavagostovanja_id);


--
-- TOC entry 2774 (class 1259 OID 23508306)
-- Name: idx_8787a0e562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e562b4ffca ON enotaprograma USING btree (uprizoritev_id);


--
-- TOC entry 2775 (class 1259 OID 23508307)
-- Name: idx_8787a0e57222d84b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e57222d84b ON enotaprograma USING btree (tipprogramskeenote_id);


--
-- TOC entry 2776 (class 1259 OID 23508308)
-- Name: idx_8787a0e5771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e5771ec7bd ON enotaprograma USING btree (program_dela_id);


--
-- TOC entry 2577 (class 1259 OID 23507731)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2578 (class 1259 OID 23507730)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2579 (class 1259 OID 23507732)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2690 (class 1259 OID 23508017)
-- Name: idx_952dd21969e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd21969e8d4 ON prostor USING btree (naslov_id);


--
-- TOC entry 2691 (class 1259 OID 23508016)
-- Name: idx_952dd2196beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd2196beede51 ON prostor USING btree (popa_id);


--
-- TOC entry 2782 (class 1259 OID 23508394)
-- Name: idx_97af082e38c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e38c06eb ON produkcijadelitev USING btree (enotaprograma_id);


--
-- TOC entry 2783 (class 1259 OID 23508395)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2765 (class 1259 OID 23508241)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2766 (class 1259 OID 23508242)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2767 (class 1259 OID 23508239)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2768 (class 1259 OID 23508240)
-- Name: idx_a4b7244fa4976613; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fa4976613 ON alternacija USING btree (zaposlitev_id);


--
-- TOC entry 2714 (class 1259 OID 23508078)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2715 (class 1259 OID 23508079)
-- Name: idx_b24490415f1e9d88; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b24490415f1e9d88 ON zaposlitev USING btree (organizacijskaenota_id);


--
-- TOC entry 2664 (class 1259 OID 23507957)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2665 (class 1259 OID 23507956)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2666 (class 1259 OID 23507954)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2667 (class 1259 OID 23507955)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2761 (class 1259 OID 23508229)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2762 (class 1259 OID 23508228)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2602 (class 1259 OID 23507806)
-- Name: idx_c38372b2be04ea9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c38372b2be04ea9 ON report USING btree (job_id);


--
-- TOC entry 2605 (class 1259 OID 23507820)
-- Name: idx_c395a6181bb9e62c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a6181bb9e62c ON job USING btree (datum);


--
-- TOC entry 2606 (class 1259 OID 23507819)
-- Name: idx_c395a618941027cc; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618941027cc ON job USING btree (casizvedbe);


--
-- TOC entry 2607 (class 1259 OID 23507818)
-- Name: idx_c395a618a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618a76ed395 ON job USING btree (user_id);


--
-- TOC entry 2608 (class 1259 OID 23507821)
-- Name: idx_c395a618aecf5af0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618aecf5af0 ON job USING btree (izveden);


--
-- TOC entry 2622 (class 1259 OID 23507851)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2616 (class 1259 OID 23507839)
-- Name: idx_d9ece16b5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_d9ece16b5ac894aa ON predstava_abonma USING btree (predstava_id);


--
-- TOC entry 2617 (class 1259 OID 23507840)
-- Name: idx_d9ece16bbe74b11; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_d9ece16bbe74b11 ON predstava_abonma USING btree (abonma_id);


--
-- TOC entry 2779 (class 1259 OID 23508385)
-- Name: idx_dba42fe79e3adf2c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_dba42fe79e3adf2c ON postavkacdve USING btree (programdela_id);


--
-- TOC entry 2798 (class 1259 OID 23508433)
-- Name: idx_e7d4cf2638c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e7d4cf2638c06eb ON drugivir USING btree (enotaprograma_id);


--
-- TOC entry 2816 (class 1259 OID 23508499)
-- Name: idx_e9f8ee8257ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee8257ed422f ON mapa_zapis USING btree (mapa_id);


--
-- TOC entry 2817 (class 1259 OID 23508500)
-- Name: idx_e9f8ee82af91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee82af91ecd ON mapa_zapis USING btree (zapis_id);


--
-- TOC entry 2553 (class 1259 OID 23507651)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2554 (class 1259 OID 23507650)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2562 (class 1259 OID 23507686)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2563 (class 1259 OID 23507687)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2641 (class 1259 OID 23507900)
-- Name: idx_f44a386d10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_f44a386d10389148 ON zasedenost USING btree (oseba_id);


--
-- TOC entry 2653 (class 1259 OID 23507938)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2654 (class 1259 OID 23507937)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2655 (class 1259 OID 23507936)
-- Name: idx_fef7d84ba81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84ba81ccef6 ON terminstoritve USING btree (dogodek_id);


--
-- TOC entry 2636 (class 1259 OID 23507886)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2637 (class 1259 OID 23507887)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2638 (class 1259 OID 23507885)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2639 (class 1259 OID 23507889)
-- Name: uniq_11e93b5dbbc7a989; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dbbc7a989 ON dogodek USING btree (dogodek_splosni_id);


--
-- TOC entry 2640 (class 1259 OID 23507888)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2570 (class 1259 OID 23507705)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2551 (class 1259 OID 23507639)
-- Name: uniq_1d30700559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1d30700559828a3 ON tippopa USING btree (sifra);


--
-- TOC entry 2552 (class 1259 OID 23507640)
-- Name: uniq_1d3070055cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1d3070055cca980 ON tippopa USING btree (ime);


--
-- TOC entry 2594 (class 1259 OID 23507780)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2595 (class 1259 OID 23507782)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2596 (class 1259 OID 23507781)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2597 (class 1259 OID 23507783)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2672 (class 1259 OID 23507963)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2747 (class 1259 OID 23508174)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2756 (class 1259 OID 23508207)
-- Name: uniq_344a77a559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_344a77a559828a3 ON uprizoritev USING btree (sifra);


--
-- TOC entry 2738 (class 1259 OID 23508148)
-- Name: uniq_3f50510d559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d559828a3 ON tipfunkcije USING btree (sifra);


--
-- TOC entry 2739 (class 1259 OID 23508149)
-- Name: uniq_3f50510d55cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d55cca980 ON tipfunkcije USING btree (ime);


--
-- TOC entry 2560 (class 1259 OID 23507677)
-- Name: uniq_466966d7559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7559828a3 ON oseba USING btree (sifra);


--
-- TOC entry 2561 (class 1259 OID 23507678)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2711 (class 1259 OID 23508068)
-- Name: uniq_5216fcb0559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5216fcb0559828a3 ON zvrstuprizoritve USING btree (sifra);


--
-- TOC entry 2529 (class 1259 OID 23507564)
-- Name: uniq_5a434fbc559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5a434fbc559828a3 ON stevilcenje USING btree (sifra);


--
-- TOC entry 2587 (class 1259 OID 23507752)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2576 (class 1259 OID 23507714)
-- Name: uniq_5e2fdc29559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5e2fdc29559828a3 ON organizacijskaenota USING btree (sifra);


--
-- TOC entry 2526 (class 1259 OID 23507552)
-- Name: uniq_6054e804889a7556; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_6054e804889a7556 ON stevilcenjekonfig USING btree (dok);


--
-- TOC entry 2795 (class 1259 OID 23508426)
-- Name: uniq_7d834df4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_7d834df4559828a3 ON tipprogramskeenote USING btree (sifra);


--
-- TOC entry 2694 (class 1259 OID 23508015)
-- Name: uniq_952dd21937854736; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21937854736 ON prostor USING btree (naziv);


--
-- TOC entry 2695 (class 1259 OID 23508014)
-- Name: uniq_952dd219559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd219559828a3 ON prostor USING btree (sifra);


--
-- TOC entry 2648 (class 1259 OID 23507914)
-- Name: uniq_99664b14559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_99664b14559828a3 ON tipvaje USING btree (sifra);


--
-- TOC entry 2649 (class 1259 OID 23507915)
-- Name: uniq_99664b1455cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_99664b1455cca980 ON tipvaje USING btree (ime);


--
-- TOC entry 2769 (class 1259 OID 23508238)
-- Name: uniq_a4b7244f559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a4b7244f559828a3 ON alternacija USING btree (sifra);


--
-- TOC entry 2584 (class 1259 OID 23507740)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2748 (class 1259 OID 23508187)
-- Name: uniq_cede8e36559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_cede8e36559828a3 ON zvrstsurs USING btree (sifra);


--
-- TOC entry 2806 (class 1259 OID 23508473)
-- Name: uniq_de1c8aa1d55226c7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_de1c8aa1d55226c7 ON vrstazapisa USING btree (oznaka);


--
-- TOC entry 2788 (class 1259 OID 23508402)
-- Name: uniq_e6fc2028559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc2028559828a3 ON produkcijskahisa USING btree (sifra);


--
-- TOC entry 2789 (class 1259 OID 23508403)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2735 (class 1259 OID 23508137)
-- Name: uniq_ec773670ca2e5fcb; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ec773670ca2e5fcb ON besedilo USING btree (stevilka);


--
-- TOC entry 2652 (class 1259 OID 23507925)
-- Name: uniq_ecc8f8c5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ecc8f8c5559828a3 ON sezona USING btree (sifra);


--
-- TOC entry 2542 (class 1259 OID 23507614)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2865 (class 2606 OID 23508695)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2864 (class 2606 OID 23508700)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2860 (class 2606 OID 23508720)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2866 (class 2606 OID 23508690)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2862 (class 2606 OID 23508710)
-- Name: fk_11e93b5dbbc7a989; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dbbc7a989 FOREIGN KEY (dogodek_splosni_id) REFERENCES dogodeksplosni(id);


--
-- TOC entry 2861 (class 2606 OID 23508715)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2863 (class 2606 OID 23508705)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2902 (class 2606 OID 23508890)
-- Name: fk_11ffe6e05c75296c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e05c75296c FOREIGN KEY (vrstastroska_id) REFERENCES vrstastroska(id);


--
-- TOC entry 2901 (class 2606 OID 23508895)
-- Name: fk_11ffe6e062b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e062b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2900 (class 2606 OID 23508900)
-- Name: fk_11ffe6e06beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e06beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2934 (class 2606 OID 23509065)
-- Name: fk_14a5d6d3727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d3727aca70 FOREIGN KEY (parent_id) REFERENCES mapa(id);


--
-- TOC entry 2935 (class 2606 OID 23509060)
-- Name: fk_14a5d6d38a4a6c12; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d38a4a6c12 FOREIGN KEY (lastnik_id) REFERENCES uporabniki(id);


--
-- TOC entry 2839 (class 2606 OID 23508580)
-- Name: fk_1c7adba589552cb2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba589552cb2 FOREIGN KEY (tipkli_id) REFERENCES tippopa(id);


--
-- TOC entry 2838 (class 2606 OID 23508585)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2883 (class 2606 OID 23508805)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2929 (class 2606 OID 23509045)
-- Name: fk_1ed92829253c4123; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829253c4123 FOREIGN KEY (avtor_id) REFERENCES uporabniki(id);


--
-- TOC entry 2930 (class 2606 OID 23509040)
-- Name: fk_1ed9282957ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282957ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2928 (class 2606 OID 23509050)
-- Name: fk_1ed9282987ff3295; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282987ff3295 FOREIGN KEY (zaklenil_id) REFERENCES uporabniki(id);


--
-- TOC entry 2931 (class 2606 OID 23509035)
-- Name: fk_1ed92829a54dbb1f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829a54dbb1f FOREIGN KEY (datoteka_id) REFERENCES datoteka(id);


--
-- TOC entry 2932 (class 2606 OID 23509030)
-- Name: fk_1ed92829ef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829ef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstazapisa(id);


--
-- TOC entry 2881 (class 2606 OID 23508800)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2882 (class 2606 OID 23508795)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2859 (class 2606 OID 23508680)
-- Name: fk_2390fc964ad2a6ea; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc964ad2a6ea FOREIGN KEY (tipvaje_id) REFERENCES tipvaje(id);


--
-- TOC entry 2858 (class 2606 OID 23508685)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2893 (class 2606 OID 23508845)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2891 (class 2606 OID 23508855)
-- Name: fk_23aeb9586b361365; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9586b361365 FOREIGN KEY (tipfunkcije_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2892 (class 2606 OID 23508850)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2848 (class 2606 OID 23508635)
-- Name: fk_2942b10710389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b10710389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2849 (class 2606 OID 23508630)
-- Name: fk_2942b1076beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b1076beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2879 (class 2606 OID 23508785)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2926 (class 2606 OID 23509020)
-- Name: fk_2d901816d6bc69d6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT fk_2d901816d6bc69d6 FOREIGN KEY (programrazno_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2905 (class 2606 OID 23508905)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2904 (class 2606 OID 23508910)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2903 (class 2606 OID 23508915)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 2933 (class 2606 OID 23509055)
-- Name: fk_2eaff9dcaf91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT fk_2eaff9dcaf91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id);


--
-- TOC entry 2907 (class 2606 OID 23508935)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2910 (class 2606 OID 23508920)
-- Name: fk_344a77a7c3b0d59; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a7c3b0d59 FOREIGN KEY (maticnioder_id) REFERENCES prostor(id);


--
-- TOC entry 2906 (class 2606 OID 23508940)
-- Name: fk_344a77a853a965c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a853a965c FOREIGN KEY (producent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2908 (class 2606 OID 23508930)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2909 (class 2606 OID 23508925)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2846 (class 2606 OID 23508625)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2847 (class 2606 OID 23508620)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2834 (class 2606 OID 23508565)
-- Name: fk_466966d769e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d769e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2835 (class 2606 OID 23508560)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2887 (class 2606 OID 23508825)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2831 (class 2606 OID 23508540)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2830 (class 2606 OID 23508545)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2888 (class 2606 OID 23508840)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2889 (class 2606 OID 23508835)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2890 (class 2606 OID 23508830)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2841 (class 2606 OID 23508595)
-- Name: fk_5e2fdc29289ed596; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29289ed596 FOREIGN KEY (vodja_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2842 (class 2606 OID 23508590)
-- Name: fk_5e2fdc29727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29727aca70 FOREIGN KEY (parent_id) REFERENCES organizacijskaenota(id);


--
-- TOC entry 2840 (class 2606 OID 23508600)
-- Name: fk_5e2fdc29f0020ed7; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29f0020ed7 FOREIGN KEY (namestnik_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2852 (class 2606 OID 23508660)
-- Name: fk_602f6e461174bb0e; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e461174bb0e FOREIGN KEY (dezurni_id) REFERENCES oseba(id);


--
-- TOC entry 2854 (class 2606 OID 23508650)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2853 (class 2606 OID 23508655)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2827 (class 2606 OID 23508525)
-- Name: fk_6054e804ff55f926; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT fk_6054e804ff55f926 FOREIGN KEY (stevilcenje_id) REFERENCES stevilcenje(id);


--
-- TOC entry 2871 (class 2606 OID 23508760)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2873 (class 2606 OID 23508750)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2874 (class 2606 OID 23508745)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2872 (class 2606 OID 23508755)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2829 (class 2606 OID 23508530)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2828 (class 2606 OID 23508535)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2884 (class 2606 OID 23508810)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2938 (class 2606 OID 23509080)
-- Name: fk_781826c67e3c61f9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT fk_781826c67e3c61f9 FOREIGN KEY (owner_id) REFERENCES uporabniki(id);


--
-- TOC entry 2898 (class 2606 OID 23508885)
-- Name: fk_7ab77b7910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT fk_7ab77b7910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2899 (class 2606 OID 23508880)
-- Name: fk_7ab77b79f35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT fk_7ab77b79f35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2940 (class 2606 OID 23509085)
-- Name: fk_7adc957157ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc957157ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2939 (class 2606 OID 23509090)
-- Name: fk_7adc9571fa6311ef; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc9571fa6311ef FOREIGN KEY (perm_id) REFERENCES permission(id);


--
-- TOC entry 2880 (class 2606 OID 23508790)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2897 (class 2606 OID 23508870)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2896 (class 2606 OID 23508875)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2917 (class 2606 OID 23508995)
-- Name: fk_8787a0e54ae1cd1c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e54ae1cd1c FOREIGN KEY (gostitelj_id) REFERENCES popa(id);


--
-- TOC entry 2918 (class 2606 OID 23508990)
-- Name: fk_8787a0e55d0da56c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e55d0da56c FOREIGN KEY (drzavagostovanja_id) REFERENCES drza(id);


--
-- TOC entry 2921 (class 2606 OID 23508975)
-- Name: fk_8787a0e562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2920 (class 2606 OID 23508980)
-- Name: fk_8787a0e57222d84b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e57222d84b FOREIGN KEY (tipprogramskeenote_id) REFERENCES tipprogramskeenote(id);


--
-- TOC entry 2919 (class 2606 OID 23508985)
-- Name: fk_8787a0e5771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e5771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2844 (class 2606 OID 23508610)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2845 (class 2606 OID 23508605)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2843 (class 2606 OID 23508615)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2885 (class 2606 OID 23508820)
-- Name: fk_952dd21969e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd21969e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2886 (class 2606 OID 23508815)
-- Name: fk_952dd2196beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd2196beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2924 (class 2606 OID 23509005)
-- Name: fk_97af082e38c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e38c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2923 (class 2606 OID 23509010)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2914 (class 2606 OID 23508965)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2913 (class 2606 OID 23508970)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2916 (class 2606 OID 23508955)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 2915 (class 2606 OID 23508960)
-- Name: fk_a4b7244fa4976613; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fa4976613 FOREIGN KEY (zaposlitev_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2895 (class 2606 OID 23508860)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2894 (class 2606 OID 23508865)
-- Name: fk_b24490415f1e9d88; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b24490415f1e9d88 FOREIGN KEY (organizacijskaenota_id) REFERENCES organizacijskaenota(id);


--
-- TOC entry 2875 (class 2606 OID 23508780)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2876 (class 2606 OID 23508775)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2878 (class 2606 OID 23508765)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2877 (class 2606 OID 23508770)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2911 (class 2606 OID 23508950)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2912 (class 2606 OID 23508945)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2850 (class 2606 OID 23508640)
-- Name: fk_c38372b2be04ea9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY report
    ADD CONSTRAINT fk_c38372b2be04ea9 FOREIGN KEY (job_id) REFERENCES job(id);


--
-- TOC entry 2851 (class 2606 OID 23508645)
-- Name: fk_c395a618a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY job
    ADD CONSTRAINT fk_c395a618a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2857 (class 2606 OID 23508675)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2856 (class 2606 OID 23508665)
-- Name: fk_d9ece16b5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava_abonma
    ADD CONSTRAINT fk_d9ece16b5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id) ON DELETE CASCADE;


--
-- TOC entry 2855 (class 2606 OID 23508670)
-- Name: fk_d9ece16bbe74b11; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava_abonma
    ADD CONSTRAINT fk_d9ece16bbe74b11 FOREIGN KEY (abonma_id) REFERENCES abonma(id) ON DELETE CASCADE;


--
-- TOC entry 2922 (class 2606 OID 23509000)
-- Name: fk_dba42fe79e3adf2c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkacdve
    ADD CONSTRAINT fk_dba42fe79e3adf2c FOREIGN KEY (programdela_id) REFERENCES programdela(id);


--
-- TOC entry 2925 (class 2606 OID 23509015)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2927 (class 2606 OID 23509025)
-- Name: fk_e7d4cf2638c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT fk_e7d4cf2638c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2937 (class 2606 OID 23509070)
-- Name: fk_e9f8ee8257ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee8257ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id) ON DELETE CASCADE;


--
-- TOC entry 2936 (class 2606 OID 23509075)
-- Name: fk_e9f8ee82af91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee82af91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id) ON DELETE CASCADE;


--
-- TOC entry 2832 (class 2606 OID 23508555)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2833 (class 2606 OID 23508550)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2837 (class 2606 OID 23508570)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2836 (class 2606 OID 23508575)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2867 (class 2606 OID 23508725)
-- Name: fk_f44a386d10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT fk_f44a386d10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2868 (class 2606 OID 23508740)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2869 (class 2606 OID 23508735)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2870 (class 2606 OID 23508730)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- Completed on 2015-10-27 12:41:30 CET

--
-- PostgreSQL database dump complete
--

