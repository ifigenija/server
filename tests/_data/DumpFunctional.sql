--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.10
-- Dumped by pg_dump version 9.3.10
-- Started on 2015-10-27 15:54:35 CET

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
-- TOC entry 3134 (class 0 OID 0)
-- Dependencies: 249
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_with_oids = false;

--
-- TOC entry 180 (class 1259 OID 23544745)
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
-- TOC entry 233 (class 1259 OID 23545354)
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
-- TOC entry 232 (class 1259 OID 23545337)
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
-- TOC entry 223 (class 1259 OID 23545214)
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
-- TOC entry 226 (class 1259 OID 23545244)
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
-- TOC entry 247 (class 1259 OID 23545625)
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
-- TOC entry 200 (class 1259 OID 23544993)
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
-- TOC entry 202 (class 1259 OID 23545024)
-- Name: dogodeksplosni; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodeksplosni (
    id uuid NOT NULL
);


--
-- TOC entry 241 (class 1259 OID 23545551)
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
-- TOC entry 191 (class 1259 OID 23544890)
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
-- TOC entry 234 (class 1259 OID 23545367)
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
-- TOC entry 219 (class 1259 OID 23545167)
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
-- TOC entry 197 (class 1259 OID 23544964)
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
-- TOC entry 194 (class 1259 OID 23544930)
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
-- TOC entry 3135 (class 0 OID 0)
-- Dependencies: 194
-- Name: COLUMN job.data; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN job.data IS '(DC2Type:object)';


--
-- TOC entry 192 (class 1259 OID 23544907)
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
-- TOC entry 208 (class 1259 OID 23545081)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 245 (class 1259 OID 23545606)
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
-- TOC entry 246 (class 1259 OID 23545618)
-- Name: mapa_zapis; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE mapa_zapis (
    mapa_id uuid NOT NULL,
    zapis_id uuid NOT NULL
);


--
-- TOC entry 248 (class 1259 OID 23545640)
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
-- TOC entry 212 (class 1259 OID 23545106)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 189 (class 1259 OID 23544864)
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
-- TOC entry 182 (class 1259 OID 23544764)
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
-- TOC entry 186 (class 1259 OID 23544831)
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
-- TOC entry 183 (class 1259 OID 23544775)
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
-- TOC entry 177 (class 1259 OID 23544719)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 179 (class 1259 OID 23544738)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 213 (class 1259 OID 23545113)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 217 (class 1259 OID 23545147)
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
-- TOC entry 229 (class 1259 OID 23545285)
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
-- TOC entry 185 (class 1259 OID 23544811)
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
-- TOC entry 188 (class 1259 OID 23544856)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 236 (class 1259 OID 23545496)
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
-- TOC entry 209 (class 1259 OID 23545087)
-- Name: postavkaracuna; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE postavkaracuna (
    id uuid NOT NULL,
    racun_id uuid
);


--
-- TOC entry 187 (class 1259 OID 23544841)
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
-- TOC entry 199 (class 1259 OID 23544985)
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
-- TOC entry 195 (class 1259 OID 23544945)
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
-- TOC entry 196 (class 1259 OID 23544957)
-- Name: predstava_abonma; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE predstava_abonma (
    predstava_id uuid NOT NULL,
    abonma_id uuid NOT NULL
);


--
-- TOC entry 211 (class 1259 OID 23545099)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 237 (class 1259 OID 23545510)
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
-- TOC entry 238 (class 1259 OID 23545520)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    sifra character varying(4) NOT NULL,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 235 (class 1259 OID 23545435)
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
-- TOC entry 239 (class 1259 OID 23545528)
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
-- TOC entry 215 (class 1259 OID 23545128)
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
-- TOC entry 207 (class 1259 OID 23545072)
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
-- TOC entry 206 (class 1259 OID 23545062)
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
-- TOC entry 228 (class 1259 OID 23545274)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying,
    status character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 222 (class 1259 OID 23545204)
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
-- TOC entry 193 (class 1259 OID 23544919)
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
-- TOC entry 174 (class 1259 OID 23544690)
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
-- TOC entry 173 (class 1259 OID 23544688)
-- Name: revizije_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE revizije_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3136 (class 0 OID 0)
-- Dependencies: 173
-- Name: revizije_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE revizije_id_seq OWNED BY revizije.id;


--
-- TOC entry 216 (class 1259 OID 23545141)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 178 (class 1259 OID 23544728)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 176 (class 1259 OID 23544712)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 218 (class 1259 OID 23545155)
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
-- TOC entry 210 (class 1259 OID 23545093)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 204 (class 1259 OID 23545039)
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
-- TOC entry 172 (class 1259 OID 23544677)
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
-- TOC entry 171 (class 1259 OID 23544669)
-- Name: stevilcenjekonfig; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjekonfig (
    id uuid NOT NULL,
    stevilcenje_id uuid,
    dok character varying(100) DEFAULT NULL::character varying
);


--
-- TOC entry 170 (class 1259 OID 23544664)
-- Name: stevilcenjestanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjestanje (
    id uuid NOT NULL,
    objid uuid NOT NULL,
    leto integer NOT NULL,
    stevilka integer
);


--
-- TOC entry 224 (class 1259 OID 23545221)
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
-- TOC entry 184 (class 1259 OID 23544803)
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
-- TOC entry 205 (class 1259 OID 23545049)
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
-- TOC entry 227 (class 1259 OID 23545262)
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
-- TOC entry 181 (class 1259 OID 23544754)
-- Name: tippopa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tippopa (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    ime character varying(255) NOT NULL,
    opis text
);


--
-- TOC entry 240 (class 1259 OID 23545539)
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
-- TOC entry 203 (class 1259 OID 23545029)
-- Name: tipvaje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tipvaje (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    ime character varying(255) NOT NULL,
    opis text
);


--
-- TOC entry 190 (class 1259 OID 23544876)
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
-- TOC entry 175 (class 1259 OID 23544699)
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
-- TOC entry 231 (class 1259 OID 23545312)
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
-- TOC entry 198 (class 1259 OID 23544975)
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
-- TOC entry 214 (class 1259 OID 23545120)
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
-- TOC entry 225 (class 1259 OID 23545235)
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
-- TOC entry 243 (class 1259 OID 23545586)
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
-- TOC entry 242 (class 1259 OID 23545558)
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
-- TOC entry 244 (class 1259 OID 23545598)
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
-- TOC entry 221 (class 1259 OID 23545192)
-- Name: zaposlitev; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zaposlitev (
    id uuid NOT NULL,
    oseba_id uuid,
    sifra character varying(4) NOT NULL,
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
-- TOC entry 201 (class 1259 OID 23545018)
-- Name: zasedenost; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zasedenost (
    id uuid NOT NULL,
    oseba_id uuid
);


--
-- TOC entry 230 (class 1259 OID 23545302)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 220 (class 1259 OID 23545182)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 2220 (class 2604 OID 23544693)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 3059 (class 0 OID 23544745)
-- Dependencies: 180
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
000a0000-562f-9028-7873-cf760e053526	10	30	Otroci	Abonma za otroke	200
000a0000-562f-9028-f71e-3345dedcef70	20	60	Mladina	Abonma za mladino	400
000a0000-562f-9028-fe46-b6dcadde5fb9	15	50	Odrasli	Abonma za odrasle	300
\.


--
-- TOC entry 3112 (class 0 OID 23545354)
-- Dependencies: 233
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, zaposlitev_id, oseba_id, pogodba_id, sifra, zaposlen, zacetek, konec, opomba, sort, privzeti, aktivna, imapogodbo, pomembna) FROM stdin;
000c0000-562f-9028-bcc9-c694eb497f85	000d0000-562f-9028-ef9e-e672be2b7ab3	\N	00090000-562f-9028-8a20-cac7bb9253a9	000b0000-562f-9028-8a53-39df1c9b10ae	0001	f	\N	\N	\N	3	t	\N	t	t
000c0000-562f-9028-812d-dff380569f18	000d0000-562f-9028-7309-7748e909b6fb	00100000-562f-9028-661a-3aa2db58a5c2	00090000-562f-9028-d381-31deece1d765	\N	0002	t	2016-01-01	\N	\N	8	t	\N	f	f
000c0000-562f-9028-63f1-c8015e82b851	000d0000-562f-9028-da58-36b345ee8773	00100000-562f-9028-320b-6067b237a0bb	00090000-562f-9028-f459-75f781ca4b5f	\N	0003	t	\N	2015-10-27	\N	2	t	\N	f	f
000c0000-562f-9028-d91a-389b4da8725c	000d0000-562f-9028-36a6-e905580cc92a	\N	00090000-562f-9028-c937-1ae78f3ef15a	\N	0004	f	2016-01-01	2016-01-01	\N	26	t	\N	f	f
000c0000-562f-9028-99bb-5c1b46b1ad0b	000d0000-562f-9028-7fd9-9b832f168704	\N	00090000-562f-9028-3d4d-db0b158c429c	\N	0005	f	2016-01-01	2016-01-01	\N	7	t	\N	f	f
000c0000-562f-9028-8167-a1b63e10e054	000d0000-562f-9028-ce70-04dfa05eaf17	\N	00090000-562f-9028-f4e1-3affcdfe92dc	000b0000-562f-9028-1503-0df68c78f3ee	0006	f	2016-01-01	2016-01-01	\N	1	t	\N	t	t
000c0000-562f-9029-20c3-a0144b8fb5e7	000d0000-562f-9028-5724-d68655622ad3	00100000-562f-9028-1f63-7751731e722b	00090000-562f-9028-bc94-db3a3425620e	\N	0007	t	2016-01-01	2016-01-01	\N	14	f	\N	f	t
000c0000-562f-9029-6def-cfab544c3ef3	000d0000-562f-9028-b112-645b92269c34	\N	00090000-562f-9028-8bfe-5408dfee1f21	000b0000-562f-9028-61a3-88ed2762371d	0008	f	2016-01-01	2016-01-01	\N	12	t	\N	t	t
000c0000-562f-9029-5407-c27a76e17c63	000d0000-562f-9028-5724-d68655622ad3	00100000-562f-9028-657f-d4ef59778953	00090000-562f-9028-b548-e239015782c5	\N	0009	t	2017-01-01	2017-01-01	\N	15	t	\N	f	t
000c0000-562f-9029-4f81-3575e514ef99	000d0000-562f-9028-5724-d68655622ad3	00100000-562f-9028-a703-76c62d95ed6c	00090000-562f-9028-2514-94861b5a756e	\N	0010	t	\N	2015-10-27	\N	16	f	\N	f	t
000c0000-562f-9029-5a3f-d3f9838ee4db	000d0000-562f-9028-5724-d68655622ad3	00100000-562f-9028-09c6-2e9766e69c0d	00090000-562f-9028-981d-ac1e8e43bc62	\N	0011	t	2017-01-01	\N	\N	17	f	\N	f	t
000c0000-562f-9029-a958-e0ef2448783c	000d0000-562f-9028-23d3-dc5c8313a82d	00100000-562f-9028-661a-3aa2db58a5c2	00090000-562f-9028-d381-31deece1d765	000b0000-562f-9028-0e14-3bbb9e70eda6	0012	t	\N	\N	\N	2	t	\N	t	t
\.


--
-- TOC entry 3111 (class 0 OID 23545337)
-- Dependencies: 232
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 3102 (class 0 OID 23545214)
-- Dependencies: 223
-- Data for Name: avtorbesedila; Type: TABLE DATA; Schema: public; Owner: -
--

COPY avtorbesedila (id, besedilo_id, oseba_id, tipavtorja, zaporedna, alivnaslovu) FROM stdin;
003d0000-562f-9028-a377-8aade0160b9d	00160000-562f-9028-278d-f7ab8a85e10d	00090000-562f-9028-4c36-453ceece5414	aizv	10	t
003d0000-562f-9028-039b-c407a7a70abd	00160000-562f-9028-278d-f7ab8a85e10d	00090000-562f-9028-2bc0-f633a60753a8	apri	14	t
003d0000-562f-9028-dc90-2a837f7d0ca0	00160000-562f-9028-612a-3d863d89450c	00090000-562f-9028-bbd1-feb6851f4f64	aizv	11	t
003d0000-562f-9028-6cbe-98ce666b699e	00160000-562f-9028-c57d-161b4f9867d4	00090000-562f-9028-5856-c4536e9fae8b	aizv	12	t
003d0000-562f-9028-0c3d-d0fb1ecad3f2	00160000-562f-9028-278d-f7ab8a85e10d	00090000-562f-9028-6128-82ff757464ea	apri	18	f
\.


--
-- TOC entry 3105 (class 0 OID 23545244)
-- Dependencies: 226
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, stevilka, naslov, podnaslov, jezik, naslovizvirnika, podnaslovizvirnika, internacionalninaslov, datumprejema, moskevloge, zenskevloge, povzetekvsebine, letoizida, krajizida, zaloznik, avtor) FROM stdin;
00160000-562f-9028-278d-f7ab8a85e10d	0001	Sen kresne noči		slovenščina	A Midsummer Night's Dream	\N	\N	2015-04-26	5	5	Nastopajo Titanija, Hipolita, Oberon, ...	\N	\N	\N	William  Shakespeare - Nebojša  Kavader
00160000-562f-9028-612a-3d863d89450c	0002	Bratje Karamazovi		slovenščina	Bratja Karamazjovji	\N	\N	2015-12-04	4	1	Svetovna uspešnica	\N	\N	\N	Fjodor Mihajlovič Dostojevski
00160000-562f-9028-c57d-161b4f9867d4	0003	Smoletov Vrt		slovenščina		\N	\N	2015-05-26	2	8		\N	\N	\N	Berta   Hočevar
\.


--
-- TOC entry 3126 (class 0 OID 23545625)
-- Dependencies: 247
-- Data for Name: datoteka; Type: TABLE DATA; Schema: public; Owner: -
--

COPY datoteka (id, owner_id, filename, transfers, size, format, hash, createdat, uploadedat, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3079 (class 0 OID 23544993)
-- Dependencies: 200
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_splosni_id, prostor_id, sezona_id, allday, zacetek, konec, status, razred, termin, title) FROM stdin;
00180000-562f-9028-6dfb-85cf0400bb09	\N	\N	00200000-562f-9028-0b5e-9984c3ad73bd	\N	\N	\N	\N	f	2015-06-26 10:00:00	2015-06-26 12:00:00	200s	200s		dogodek 1
00180000-562f-9028-c698-c7dcf3b31946	\N	\N	00200000-562f-9028-3288-6cb76c4228d8	\N	\N	\N	\N	f	2015-06-27 10:00:00	2015-06-27 12:00:00	300s	200s		dogodek 2
00180000-562f-9028-73c5-11d02e69c4cb	\N	\N	00200000-562f-9028-10ed-70a732418022	\N	\N	\N	\N	f	2015-08-01 20:00:00	2015-08-01 23:00:00	400s	200s		dogodek 3
00180000-562f-9028-8893-fee04333b0e3	\N	\N	00200000-562f-9028-3646-b1b78f9b6bd9	\N	\N	\N	\N	f	2015-08-01 20:00:00	2015-08-01 23:00:00	100s	200s		dogodek 4
00180000-562f-9028-2efa-a801a2fa4a2b	\N	\N	00200000-562f-9028-71fe-425bd84cf29d	\N	\N	\N	\N	f	2015-08-01 20:00:00	2015-08-01 23:00:00	500s	200s		dogodek 5
\.


--
-- TOC entry 3081 (class 0 OID 23545024)
-- Dependencies: 202
-- Data for Name: dogodeksplosni; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodeksplosni (id) FROM stdin;
\.


--
-- TOC entry 3120 (class 0 OID 23545551)
-- Dependencies: 241
-- Data for Name: drugivir; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drugivir (id, znesek, opis, mednarodni, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 3070 (class 0 OID 23544890)
-- Dependencies: 191
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-562f-9026-69cb-b8d946374660	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-562f-9026-bd79-3c13a782ac30	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-562f-9026-5932-248f2f01de53	AL	ALB	008	Albania 	Albanija	\N
00040000-562f-9026-793b-2e0556e0f02d	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-562f-9026-2200-36e54f9c415e	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-562f-9026-4aef-e389e2d16fb5	AD	AND	020	Andorra 	Andora	\N
00040000-562f-9026-b94b-b358f337b926	AO	AGO	024	Angola 	Angola	\N
00040000-562f-9026-ccde-fab2c0ea1866	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-562f-9026-b08e-f217aedf6cfe	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-562f-9026-36c6-2eb5f98264a1	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-562f-9026-a615-c1e2e7d0f278	AR	ARG	032	Argentina 	Argenitna	\N
00040000-562f-9026-e72b-715ac671e123	AM	ARM	051	Armenia 	Armenija	\N
00040000-562f-9026-e99c-ba62ad4ee55e	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-562f-9026-3cb7-11a823f79658	AU	AUS	036	Australia 	Avstralija	\N
00040000-562f-9026-e98b-b7b82bc22311	AT	AUT	040	Austria 	Avstrija	\N
00040000-562f-9026-d924-0a3f35d173c5	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-562f-9026-6353-a33d82d58589	BS	BHS	044	Bahamas 	Bahami	\N
00040000-562f-9026-c2f7-732825ca98f4	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-562f-9026-2292-2ae11bfaf22c	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-562f-9026-e130-3affbceaaff8	BB	BRB	052	Barbados 	Barbados	\N
00040000-562f-9026-9be2-6a78af47b3f9	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-562f-9026-0bf6-022dd2565d72	BE	BEL	056	Belgium 	Belgija	\N
00040000-562f-9026-6ee0-fd86b64d3698	BZ	BLZ	084	Belize 	Belize	\N
00040000-562f-9026-6029-04d55af63cbd	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-562f-9026-ee9e-abb8c3ee5f40	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-562f-9026-045a-629ef0a3614a	BT	BTN	064	Bhutan 	Butan	\N
00040000-562f-9026-ba6b-ec13c1095346	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-562f-9026-6a13-3837a92bcb09	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-562f-9026-8974-f649748d9fdc	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-562f-9026-006d-15e8c670a3c0	BW	BWA	072	Botswana 	Bocvana	\N
00040000-562f-9026-22d3-6d6c80cb0acb	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-562f-9026-2bd0-32c1d69fd944	BR	BRA	076	Brazil 	Brazilija	\N
00040000-562f-9026-4d81-74987b83e13f	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-562f-9026-57e3-7f19a24d4d26	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-562f-9026-0e5f-819a1000e498	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-562f-9026-bc48-fd44c87cef0b	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-562f-9026-6630-74a2def391e1	BI	BDI	108	Burundi 	Burundi 	\N
00040000-562f-9026-e9f8-e5f8f05b58c8	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-562f-9026-699c-21d1c7e227cd	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-562f-9026-f713-dfd3a66f8fbd	CA	CAN	124	Canada 	Kanada	\N
00040000-562f-9026-02c8-68cc7e8ba899	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-562f-9026-2ede-33d729a0202a	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-562f-9026-5ee7-f1484656286b	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-562f-9026-f338-5a480e551a5b	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-562f-9026-7c79-d22f69c6eea7	CL	CHL	152	Chile 	Čile	\N
00040000-562f-9026-fdba-1c2dbdcdd277	CN	CHN	156	China 	Kitajska	\N
00040000-562f-9026-4a0b-bbd88a1651c5	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-562f-9026-5401-a98d5df849dc	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-562f-9026-f7bd-427e15a60216	CO	COL	170	Colombia 	Kolumbija	\N
00040000-562f-9026-89d1-58fe658b1a98	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-562f-9026-5c17-6189b8f7c980	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-562f-9026-17af-a7aab207e9b4	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-562f-9026-4a8b-df63d83db57e	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-562f-9026-f30e-36ae6406077b	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-562f-9026-a953-6c07c9f30893	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-562f-9026-6aaa-8581bbd7e78f	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-562f-9026-b0bd-a44c4f2d0911	CU	CUB	192	Cuba 	Kuba	\N
00040000-562f-9026-7ff4-9dfddf65f37c	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-562f-9026-af71-a8b992659b9c	CY	CYP	196	Cyprus 	Ciper	\N
00040000-562f-9026-1555-efaa58dc2824	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-562f-9026-6363-ae8fc40c0219	DK	DNK	208	Denmark 	Danska	\N
00040000-562f-9026-68a8-4d8e141e79e5	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-562f-9026-b63c-ac866ca00033	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-562f-9026-75cc-2c2607d87b5b	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-562f-9026-6701-35b43352be35	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-562f-9026-0329-b790e0ce3d22	EG	EGY	818	Egypt 	Egipt	\N
00040000-562f-9026-4c31-ace702d2c622	SV	SLV	222	El Salvador 	Salvador	\N
00040000-562f-9026-a265-c5a661f048ca	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-562f-9026-1d16-26040eb96988	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-562f-9026-5b60-ca985935a92f	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-562f-9026-3ead-a12768e02c19	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-562f-9026-c4f2-d9975cf4357a	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-562f-9026-2c99-b01a632adcef	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-562f-9026-9478-e3f89751d9ff	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-562f-9026-137b-6308596abc85	FI	FIN	246	Finland 	Finska	\N
00040000-562f-9026-eb8c-d20401322d72	FR	FRA	250	France 	Francija	\N
00040000-562f-9026-d5f5-fff2f641a15a	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-562f-9026-9518-76a549d6865b	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-562f-9026-0606-bcfd8586eb75	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-562f-9026-2f79-1708aa7ceece	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-562f-9026-461e-52d58ae333c7	GA	GAB	266	Gabon 	Gabon	\N
00040000-562f-9026-4980-9ef3f6328eea	GM	GMB	270	Gambia 	Gambija	\N
00040000-562f-9026-9120-6f08def71768	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-562f-9026-0b3b-6fe6a55738c2	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-562f-9026-9edf-ff892622a8fb	GH	GHA	288	Ghana 	Gana	\N
00040000-562f-9026-c3ed-4c9f34f96f39	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-562f-9026-f323-89777cc5d3d4	GR	GRC	300	Greece 	Grčija	\N
00040000-562f-9026-6c37-6e4f5f810f36	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-562f-9026-32b7-27c794b7ba6d	GD	GRD	308	Grenada 	Grenada	\N
00040000-562f-9026-ae61-ef7dcabe1dad	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-562f-9026-978c-61b18c00ced0	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-562f-9026-033a-cdabb3371b03	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-562f-9026-4e3f-8130ea7b5e6d	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-562f-9026-3538-33f9cbb1c073	GN	GIN	324	Guinea 	Gvineja	\N
00040000-562f-9026-6461-451d58d57114	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-562f-9026-7e53-46d6d28010b9	GY	GUY	328	Guyana 	Gvajana	\N
00040000-562f-9026-a52c-76657de9c5b7	HT	HTI	332	Haiti 	Haiti	\N
00040000-562f-9026-182a-39fc53f4ce0e	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-562f-9026-b78d-a720b9a57883	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-562f-9026-13eb-402ad0c8e7d8	HN	HND	340	Honduras 	Honduras	\N
00040000-562f-9026-1f35-d85e74994ab6	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-562f-9026-0938-abc236969311	HU	HUN	348	Hungary 	Madžarska	\N
00040000-562f-9026-78f5-71f6da626554	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-562f-9026-ed69-ece49c66886b	IN	IND	356	India 	Indija	\N
00040000-562f-9026-27d0-7a0cfae7ba69	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-562f-9026-7d05-6a31744b3739	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-562f-9026-c9b1-a524d8d0ffe6	IQ	IRQ	368	Iraq 	Irak	\N
00040000-562f-9026-1b13-73150ba7ad84	IE	IRL	372	Ireland 	Irska	\N
00040000-562f-9026-9d38-9b1790acfd98	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-562f-9026-ad40-62fbe81a4d71	IL	ISR	376	Israel 	Izrael	\N
00040000-562f-9026-2eb0-83676534ce78	IT	ITA	380	Italy 	Italija	\N
00040000-562f-9026-5094-12fed51dbcf8	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-562f-9026-40d4-a8026b04bb49	JP	JPN	392	Japan 	Japonska	\N
00040000-562f-9026-75b2-1d163fede912	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-562f-9026-df39-cb7825224689	JO	JOR	400	Jordan 	Jordanija	\N
00040000-562f-9026-fabe-2a1fc6c43426	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-562f-9026-4e1d-8415ada54db8	KE	KEN	404	Kenya 	Kenija	\N
00040000-562f-9026-e003-00360ceac56c	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-562f-9026-d081-d7973b35dcc4	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-562f-9026-7d7c-89ce43c80dc2	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-562f-9026-51e1-f3cdd553ee18	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-562f-9026-f61c-39c483ac0071	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-562f-9026-b685-fb752aa40433	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-562f-9026-32d5-afcc2df98e3c	LV	LVA	428	Latvia 	Latvija	\N
00040000-562f-9026-6cc7-75619f30f32a	LB	LBN	422	Lebanon 	Libanon	\N
00040000-562f-9026-7f0f-fcc18ea90309	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-562f-9026-ad11-61367c1bf294	LR	LBR	430	Liberia 	Liberija	\N
00040000-562f-9026-e085-064885ea9504	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-562f-9026-e452-c084a16acfba	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-562f-9026-ae8b-b11ce3a94d06	LT	LTU	440	Lithuania 	Litva	\N
00040000-562f-9026-46f8-c9941842c721	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-562f-9026-2483-59a0a964b1ac	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-562f-9026-def1-2afb1352b1d7	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-562f-9026-984c-e2f9eaed89e2	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-562f-9026-f5cc-c3fe9aa0f49f	MW	MWI	454	Malawi 	Malavi	\N
00040000-562f-9026-ba75-800f67d6b1df	MY	MYS	458	Malaysia 	Malezija	\N
00040000-562f-9026-6173-407f0a76b966	MV	MDV	462	Maldives 	Maldivi	\N
00040000-562f-9026-8575-e6a8e4aa97fc	ML	MLI	466	Mali 	Mali	\N
00040000-562f-9026-a5d8-168b1a2095ae	MT	MLT	470	Malta 	Malta	\N
00040000-562f-9026-3471-c7989d0e44c8	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-562f-9026-ddfa-aa1c2ce0711f	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-562f-9026-de5d-db566100a1d6	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-562f-9026-2e93-19d4841210eb	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-562f-9026-0a9a-1b54c1d3a001	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-562f-9026-eacc-48201fe373f4	MX	MEX	484	Mexico 	Mehika	\N
00040000-562f-9026-704f-ac5192a2485a	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-562f-9026-7bc4-9f2af13cfa08	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-562f-9026-731c-3649f0454a3d	MC	MCO	492	Monaco 	Monako	\N
00040000-562f-9026-7715-65f3799d5782	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-562f-9026-63c5-cf8a6fba39b3	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-562f-9026-83ad-7901efa76e19	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-562f-9026-1847-cbb0bd308c70	MA	MAR	504	Morocco 	Maroko	\N
00040000-562f-9026-343e-af896fc09afb	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-562f-9026-13b9-f5255722f41e	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-562f-9026-0f3b-86ca41920ac9	NA	NAM	516	Namibia 	Namibija	\N
00040000-562f-9026-97e8-e94ef5d2b48a	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-562f-9026-3a2a-f5fe1bb7a4ba	NP	NPL	524	Nepal 	Nepal	\N
00040000-562f-9026-f6f9-cf6ff9fa3203	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-562f-9026-8219-fa37f0b61779	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-562f-9026-942b-dc8f7371fb35	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-562f-9026-dba3-d0a221b3bc98	NE	NER	562	Niger 	Niger 	\N
00040000-562f-9026-bc3a-854256f89bbb	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-562f-9026-43e6-41a173835623	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-562f-9026-4445-a07dfa65c6df	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-562f-9026-9205-909f0824895f	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-562f-9026-d28d-a872ab09a522	NO	NOR	578	Norway 	Norveška	\N
00040000-562f-9026-21bd-9a95e92f7cd0	OM	OMN	512	Oman 	Oman	\N
00040000-562f-9026-6d8c-f17b603a1066	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-562f-9026-ee6b-f5700c799430	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-562f-9026-3fc2-bece65e87e34	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-562f-9026-b58f-5b56944344ca	PA	PAN	591	Panama 	Panama	\N
00040000-562f-9026-eae5-b0904fa25052	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-562f-9026-7d24-ad76efd1d447	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-562f-9026-6625-a185373f8b9d	PE	PER	604	Peru 	Peru	\N
00040000-562f-9026-a8b4-2bea302e0933	PH	PHL	608	Philippines 	Filipini	\N
00040000-562f-9026-d02f-9c5de571d3ea	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-562f-9026-ed6d-ac26217ddd8b	PL	POL	616	Poland 	Poljska	\N
00040000-562f-9026-e78f-b8f1050e396a	PT	PRT	620	Portugal 	Portugalska	\N
00040000-562f-9026-d201-4d1c1f36ca25	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-562f-9026-7ae5-9d9f9c2e0801	QA	QAT	634	Qatar 	Katar	\N
00040000-562f-9026-3fe7-45981362588d	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-562f-9026-05b6-5eb1bbfb3f98	RO	ROU	642	Romania 	Romunija	\N
00040000-562f-9026-1447-5522b113e50d	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-562f-9026-e7c0-4b2b59416c4e	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-562f-9026-9e8a-734467cdaf0e	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-562f-9026-b217-4916fa636149	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-562f-9026-3461-07982bab7896	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-562f-9026-e955-5de57038ed2f	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-562f-9026-3725-4ab4178237da	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-562f-9026-6b55-0c03cb1846aa	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-562f-9026-cb8c-1521325218fa	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-562f-9026-33c3-166eee60b87b	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-562f-9026-a60e-70e2858be5e8	SM	SMR	674	San Marino 	San Marino	\N
00040000-562f-9026-7e42-3f6d8a3b9f5c	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-562f-9026-908a-9e155d810f79	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-562f-9026-7359-09ebc8fd9da9	SN	SEN	686	Senegal 	Senegal	\N
00040000-562f-9026-78fa-29736ac45c99	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-562f-9026-1229-285ace0815c4	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-562f-9026-7bb6-a3677faf2428	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-562f-9026-51ee-294223575ef8	SG	SGP	702	Singapore 	Singapur	\N
00040000-562f-9026-3693-399719588b2e	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-562f-9026-7fc2-37ca911e4842	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-562f-9026-260c-051a90a86cd6	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-562f-9026-11d4-c93a25c7ab05	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-562f-9026-c1d6-996a4ad06294	SO	SOM	706	Somalia 	Somalija	\N
00040000-562f-9026-b376-349b8fd035ae	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-562f-9026-1984-645115bd35d2	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-562f-9026-2c7e-668d3bec4af0	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-562f-9026-248a-698a970312fb	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-562f-9026-568c-46fa329ff2f8	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-562f-9026-7abd-af9709aa2fb9	SD	SDN	729	Sudan 	Sudan	\N
00040000-562f-9026-4b85-1848dbdc507e	SR	SUR	740	Suriname 	Surinam	\N
00040000-562f-9026-a2e0-fa347af130f1	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-562f-9026-cb77-8ea16c777137	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-562f-9026-a0f9-ce588be198a9	SE	SWE	752	Sweden 	Švedska	\N
00040000-562f-9026-c21a-f95ed4ad3edb	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-562f-9026-7f87-d4b94d8bd1ca	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-562f-9026-1c21-de97e1618c8d	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-562f-9026-17c0-a5204b0ecaeb	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-562f-9026-1630-db2c1f142bd7	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-562f-9026-b3c8-195afee436ad	TH	THA	764	Thailand 	Tajska	\N
00040000-562f-9026-6690-6a824d170e18	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-562f-9026-493a-424f3b27cead	TG	TGO	768	Togo 	Togo	\N
00040000-562f-9026-0b5e-1d9953f1accd	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-562f-9026-efc7-65abda00fe03	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-562f-9026-580a-bd18a682a96a	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-562f-9026-567f-94e4ecdad95f	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-562f-9026-3385-996c01af7b94	TR	TUR	792	Turkey 	Turčija	\N
00040000-562f-9026-37e1-c4929c22584a	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-562f-9026-b3ff-b4d60c4c3c21	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-562f-9026-24e1-345fb1cf26e0	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-562f-9026-efae-6c94d3888755	UG	UGA	800	Uganda 	Uganda	\N
00040000-562f-9026-2d6b-67d0354ccfef	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-562f-9026-bff0-ba4b292b2b94	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-562f-9026-8057-92f652c9805a	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-562f-9026-fddc-471af1b48477	US	USA	840	United States 	Združene države Amerike	\N
00040000-562f-9026-0629-4d7277ad6e5c	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-562f-9026-605f-16db0a2a10dd	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-562f-9026-6961-d3b15855cb54	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-562f-9026-b45e-ef5323687dd4	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-562f-9026-c730-a479e1c9e8aa	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-562f-9026-dade-da707029013d	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-562f-9026-3e42-4d0dd81f3c3d	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-562f-9026-de0c-d64e8618fb82	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-562f-9026-759b-8c33406773c5	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-562f-9026-8f6c-7d3f47d537b9	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-562f-9026-2407-cb420ba5c868	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-562f-9026-acec-619e1f6b8e80	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-562f-9026-9c0a-6df3be2a7517	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 3113 (class 0 OID 23545367)
-- Dependencies: 234
-- Data for Name: enotaprograma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY enotaprograma (id, uprizoritev_id, program_dela_id, gostitelj_id, celotnavrednost, nasdelez, celotnavrednostmat, celotnavrednostgostovsz, zaproseno, lastnasredstva, avtorskihonorarji, avtorskihonorarjisamoz, tantieme, avtorskepravice, materialni, imakoprodukcije, vlozekgostitelja, drugijavni, stzaposlenih, stzaposumet, stzaposdrug, sthonorarnihzun, sthonorarnihzunigr, sthonorarnihzunigrtujjz, sthonorarnihzunsamoz, obiskdoma, obiskkopr, obiskgost, obiskkoprgost, obiskzamejo, obiskkoprzamejo, obiskint, obiskkoprint, ponovidoma, ponovikopr, ponovizamejo, ponovikoprzamejo, ponovigost, ponovikoprgost, ponovikoprint, ponoviint, naziv, kpe, sort, tipprogramskeenote_id, tip, prikoproducentu, prizorisce, trajanje, zvrst, avtor, reziser, datum, soustvarjalci, strosekodkpred, stroskiostali, krajgostovanja, ustanova, datumgostovanja, transportnistroski, dnevprvzad, drzavagostovanja_id, stpe, stpredstav, stokroglihmiz, stpredstavitev, stdelavnic, stdrugidogodki, stprodukcij, caspriprave, casizvedbe, prizorisca, umetvodja, programskotelo, sttujihselektorjev) FROM stdin;
002f0000-562f-9028-ba0c-a5e711d49387	000e0000-562f-9028-bebb-89e882798b55	\N	\N	9000.30	9000.30	9000.30	0.00	3600.12	5299.98	4000.40	1000.40	200.20	200.30	4599.40	\N	0.00	100.20	0	2	2	2	2	2	0	40	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-562f-9026-189c-46b704c11650	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-562f-9028-060b-9bfab2decf0c	000e0000-562f-9028-2bca-23ece238ac24	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	0	60	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-562f-9026-b0da-6a0463ed3f35	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-562f-9028-6147-ec9a7fde3053	000e0000-562f-9028-7d12-f274ccf02277	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	0	60	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-562f-9026-189c-46b704c11650	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-562f-9028-7540-4db317934f6b	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-54.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	54.20	5	0	0	3	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0	0	Urejanje portala	0.00	10	\N	razno	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-562f-9028-8734-9ecebd14f7d6	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-31.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	31.20	5	0	0	3	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0	0	Delavnice otroci	0.00	8	\N	razno	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 3098 (class 0 OID 23545167)
-- Dependencies: 219
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, podrocje, vodjaekipe, naziv, komentar, velikost, pomembna, sort, seplanira, dovoliprekrivanje, maxprekrivanj, tipfunkcije_id) FROM stdin;
000d0000-562f-9028-5724-d68655622ad3	000e0000-562f-9028-2bca-23ece238ac24	\N	igralec	\N	Hipolita	glavna vloga	velika	t	6	t	t	\N	000f0000-562f-9026-22f9-85d28b7c1107
000d0000-562f-9028-ef9e-e672be2b7ab3	000e0000-562f-9028-2bca-23ece238ac24	000c0000-562f-9028-bcc9-c694eb497f85	igralec	\N	Tezej	glavna vloga	velika	t	5	t	t	\N	000f0000-562f-9026-22f9-85d28b7c1107
000d0000-562f-9028-7309-7748e909b6fb	000e0000-562f-9028-2bca-23ece238ac24	000c0000-562f-9028-812d-dff380569f18	umetnik	\N	Režija		velika	t	8	t	t	\N	000f0000-562f-9026-507c-e8bd047e20c8
000d0000-562f-9028-da58-36b345ee8773	000e0000-562f-9028-2bca-23ece238ac24	000c0000-562f-9028-63f1-c8015e82b851	inspicient	t	Inšpicient			t	8	t	t	\N	000f0000-562f-9026-ba9e-1a1bfd06dbeb
000d0000-562f-9028-36a6-e905580cc92a	000e0000-562f-9028-2bca-23ece238ac24	000c0000-562f-9028-d91a-389b4da8725c	tehnik	t	Tehnični vodja			t	8	t	t	\N	000f0000-562f-9026-e0b5-dad77617099f
000d0000-562f-9028-7fd9-9b832f168704	000e0000-562f-9028-2bca-23ece238ac24	000c0000-562f-9028-99bb-5c1b46b1ad0b	tehnik	\N	Razsvetljava			t	3	t	t	\N	000f0000-562f-9026-e0b5-dad77617099f
000d0000-562f-9028-ce70-04dfa05eaf17	000e0000-562f-9028-2bca-23ece238ac24	000c0000-562f-9028-8167-a1b63e10e054	igralec	\N	Helena	glavna vloga	velika	t	5	t	t	\N	000f0000-562f-9026-22f9-85d28b7c1107
000d0000-562f-9028-b112-645b92269c34	000e0000-562f-9028-2bca-23ece238ac24	000c0000-562f-9029-6def-cfab544c3ef3	umetnik	\N	Lektoriranje			t	22	t	t	\N	000f0000-562f-9026-e169-4a49eefd93ae
000d0000-562f-9028-23d3-dc5c8313a82d	000e0000-562f-9028-2bca-23ece238ac24	000c0000-562f-9029-a958-e0ef2448783c	umetnik	\N	Avtor	Avtor besedila		t	2	t	f	\N	000f0000-562f-9026-f1d0-e6714a67246a
\.


--
-- TOC entry 3076 (class 0 OID 23544964)
-- Dependencies: 197
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta, zamejstvo, kraj) FROM stdin;
\.


--
-- TOC entry 3073 (class 0 OID 23544930)
-- Dependencies: 194
-- Data for Name: job; Type: TABLE DATA; Schema: public; Owner: -
--

COPY job (id, user_id, name, task, status, log, datum, casizvedbe, izveden, data, alert, hidden, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3071 (class 0 OID 23544907)
-- Dependencies: 192
-- Data for Name: kontaktnaoseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kontaktnaoseba (id, popa_id, oseba_id, status, funkcija, opis) FROM stdin;
00260000-562f-9028-f9e2-1b1a79c90061	00080000-562f-9028-a304-1748640b404c	00090000-562f-9028-2514-94861b5a756e	AK		igralka
\.


--
-- TOC entry 3087 (class 0 OID 23545081)
-- Dependencies: 208
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 3124 (class 0 OID 23545606)
-- Dependencies: 245
-- Data for Name: mapa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa (id, lastnik_id, parent_id, ime, komentar, caskreiranja, casspremembe, javnidostop, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3125 (class 0 OID 23545618)
-- Dependencies: 246
-- Data for Name: mapa_zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa_zapis (mapa_id, zapis_id) FROM stdin;
\.


--
-- TOC entry 3127 (class 0 OID 23545640)
-- Dependencies: 248
-- Data for Name: mapaacl; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapaacl (id, mapa_id, perm_id, dostop, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3091 (class 0 OID 23545106)
-- Dependencies: 212
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 3068 (class 0 OID 23544864)
-- Dependencies: 189
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-562f-9027-9b07-d77e154ce804	popa.stakli	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-562f-9027-7f0f-14273105c1c3	oseba.spol	array	a:2:{s:1:"M";a:1:{s:5:"label";s:6:"Moški";}s:1:"Z";a:1:{s:5:"label";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-562f-9027-8ed9-661180dfa37e	telefonska.vrsta	array	a:3:{s:7:"mobilna";a:1:{s:5:"label";s:7:"Mobilni";}s:6:"domaca";a:1:{s:5:"label";s:6:"Domač";}s:6:"fiksna";a:1:{s:5:"label";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-562f-9027-931d-f8bd0fc174e1	kontaktnaoseba.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status kontaktne osebe
00000000-562f-9027-f258-8a3725c7819a	dogodek.status	array	a:8:{s:4:"100s";a:1:{s:5:"label";s:11:"Dolgoročno";}s:4:"200s";a:1:{s:5:"label";s:9:"Planirano";}s:4:"300s";a:1:{s:5:"label";s:8:"Fiksiran";}s:4:"400s";a:1:{s:5:"label";s:17:"Potrjen - interno";}s:4:"500s";a:1:{s:5:"label";s:15:"Potrjen - javno";}s:4:"600s";a:1:{s:5:"label";s:10:"Zaključen";}s:4:"610s";a:1:{s:5:"label";s:9:"Odpovedan";}s:4:"700s";a:1:{s:5:"label";s:7:"Obdelan";}}	f	t	t	\N	Tabela statusa dogodkov
00000000-562f-9027-e169-a34f52fe8fdf	dogodek.razred	array	a:5:{s:4:"100s";a:2:{s:5:"label";s:9:"Predstava";s:4:"type";s:9:"predstava";}s:4:"200s";a:2:{s:5:"label";s:4:"Vaja";s:4:"type";s:4:"vaja";}s:4:"300s";a:2:{s:5:"label";s:10:"Gostovanje";s:4:"type";s:10:"gostovanje";}s:4:"400s";a:2:{s:5:"label";s:16:"Splošni dogodek";s:4:"type";s:8:"splošni";}s:4:"500s";a:2:{s:5:"label";s:10:"Zasedenost";s:4:"type";s:10:"zasedenost";}}	f	t	t	\N	Tabela razredov dogodkov, ki jih aplikacija podpira
00000000-562f-9027-6864-41e6b5d0652d	uprizoritev.faza	array	a:6:{s:20:"predprodukcija-ideja";a:1:{s:5:"label";s:16:"Dolgoročni plan";}s:20:"predprodukcija-poziv";a:1:{s:5:"label";s:29:"Predprodukcija, v fazi poziva";}s:30:"predprodukcija-potrjen_program";a:1:{s:5:"label";s:34:"Predprodukcija, program je potrjen";}s:10:"produkcija";a:1:{s:5:"label";s:10:"Produkcija";}s:14:"postprodukcija";a:1:{s:5:"label";s:14:"Postprodukcija";}s:5:"arhiv";a:1:{s:5:"label";s:10:"Arhivirana";}}	f	t	f	\N	Faza uprizoritve
00000000-562f-9027-1a32-fa71aa634363	funkcija.podrocje	array	a:4:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}}	f	t	f	\N	Področje funkcije
00000000-562f-9027-4415-59fdd67915ab	tipfunkcije.podrocje	array	a:4:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}}	f	t	f	\N	Področje funkcije
00000000-562f-9027-9cb4-08361c268ddc	funkcija.velikost	array	a:4:{s:6:"velika";a:1:{s:5:"label";s:23:"Velika vloga / funkcija";}s:7:"srednja";a:1:{s:5:"label";s:24:"Srednja vloga / funkcija";}s:4:"mala";a:1:{s:5:"label";s:21:"Mala vloga / funkcija";}s:7:"stataza";a:1:{s:5:"label";s:8:"Stataža";}}	f	t	f	\N	Velikost funkcije
00000000-562f-9027-2113-387b7a8002ed	zaposlitev.status	array	a:2:{s:1:"A";a:1:{s:5:"label";s:7:"Aktivna";}s:1:"N";a:1:{s:5:"label";s:9:"Neaktivna";}}	f	t	f	\N	Status zaposlitve
00000000-562f-9027-0d66-6b6f30d3192a	produkcijskahisa.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktivna";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktivna";}}	f	t	f	\N	Status produkcijske hiše
00000000-562f-9027-bad1-3481aa3397e8	strosekuprizoritve.tipstroska	array	a:1:{s:10:"materialni";a:1:{s:5:"label";s:19:"Materialni strošek";}}	f	t	f	\N	Tip stroška
00000000-562f-9027-7416-b3b7b512f374	avtorbesedila.tipavtorja	array	a:4:{s:4:"aizv";a:1:{s:5:"label";s:15:"Avtor izvirnika";}s:4:"prev";a:1:{s:5:"label";s:10:"Prevajalec";}s:4:"apri";a:1:{s:5:"label";s:14:"Avtor priredbe";}s:4:"dram";a:1:{s:5:"label";s:12:"Dramatizator";}}	f	t	f	\N	Tip stroška
00000000-562f-9027-00b5-a578fba55a88	fsacl.dostop	array	a:4:{s:1:"X";a:1:{s:5:"label";s:12:"Brez dostopa";}s:1:"R";a:1:{s:5:"label";s:11:"Samo branje";}s:2:"RW";a:1:{s:5:"label";s:17:"Branje in pisanje";}s:3:"RWD";a:1:{s:5:"label";s:26:"Branje pisanje in brisanje";}}	f	t	f	\N	ACL Javni dostop
00000000-562f-9028-a5f3-41fd64d80ff3	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-562f-9028-40e9-c5b05ebc5b1c	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-562f-9028-0328-27ae274f797c	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-562f-9028-63fd-8979ce483ce0	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-562f-9028-d2f5-645df3c3e363	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
00000000-562f-902a-4763-8c958bcbcf4f	application.tenant.maticnopodjetje	string	s:36:"00080000-562f-902a-7cd5-95a118f24a6e";	f	t	f		Id matičnega podjetja v Popa
\.


--
-- TOC entry 3061 (class 0 OID 23544764)
-- Dependencies: 182
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-562f-9028-9c6a-1b0d7d8e43dc	00000000-562f-9028-a5f3-41fd64d80ff3	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-562f-9028-3e89-bb350d0d8025	00000000-562f-9028-a5f3-41fd64d80ff3	00010000-562f-9027-a6d8-ee76d2f6e47d	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-562f-9028-1b2d-72401b15a0c8	00000000-562f-9028-40e9-c5b05ebc5b1c	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 3065 (class 0 OID 23544831)
-- Dependencies: 186
-- Data for Name: organizacijskaenota; Type: TABLE DATA; Schema: public; Owner: -
--

COPY organizacijskaenota (id, parent_id, vodja_id, namestnik_id, sifra, naziv) FROM stdin;
00410000-562f-9028-3b72-7664785606df	\N	00100000-562f-9028-661a-3aa2db58a5c2	00100000-562f-9028-320b-6067b237a0bb	01	Gledališče Nimbis
00410000-562f-9028-0d64-39fbb08d195e	00410000-562f-9028-3b72-7664785606df	00100000-562f-9028-661a-3aa2db58a5c2	00100000-562f-9028-320b-6067b237a0bb	02	Tehnika
\.


--
-- TOC entry 3062 (class 0 OID 23544775)
-- Dependencies: 183
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naslov_id, sifra, naziv, ime, priimek, funkcija, srednjeime, polnoime, psevdonim, email, twitter, skype, fb, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
00090000-562f-9028-8a20-cac7bb9253a9	\N	\N	0001	g.	Janez	Novak	a	Peter	Janez Peter Novak	Jani	jani.novak@xxx.xx				1958-01-06	0601958000000	123456789	M	Jani Janez	Slovenija	Slovenija	Ljubljana
00090000-562f-9028-c937-1ae78f3ef15a	00010000-562f-9028-8ba5-528e8843d005	\N	0002	dr.	Anton	Horvat	b		Anton  Horvat	Tona	anton.horvat@xxx.xx				1968-02-12	1202968111111	234567890	M		Slovenija	Slovenija	Maribor
00090000-562f-9028-f459-75f781ca4b5f	00010000-562f-9028-95da-6cf02175801d	\N	0003		Ivan	Kovačič	c		Ivan  Kovačič	Ivo	ivan.kovacic@xxx.xx				1975-03-26	2603976222222	345678901	M		Slovenija	Slovenija	Celje
00090000-562f-9028-b548-e239015782c5	00010000-562f-9028-34d2-efd336239e4d	\N	0004	prof.	Jožef	Krajnc	d		Jožef  Krajnc	Joža	jozef.krajnc@xxx.xx				1971-04-30	3004971333333	456789012	M		Slovenija	Slovenija	Kranj
00090000-562f-9028-7490-d7b7c06a03bd	\N	\N	0005		Marko	Zupančič	e		Marko  Zupančič		marko.zupancic@xxx.xx				1984-05-07	0705984444444	567890123	M		Slovenija	Slovenija	Koper
00090000-562f-9028-f4e1-3affcdfe92dc	\N	\N	0006	ga.	Marija	Kovač	f		Marija  Kovač		marija.kovac@xxx.xx				1962-06-19	1906962444444	678901234	Z		Slovenija	Slovenija	Murska Sobota
00090000-562f-9028-981d-ac1e8e43bc62	\N	\N	0007	ga.	Ana	Potočnik	g		Ana  Potočnik		ana.potocnik@xxx.xx				1975-07-24	2407975555555	789012345	Z		Slovenija	Slovenija	Novo Mesto
00090000-562f-9028-bc94-db3a3425620e	\N	\N	0008	ga.	Maja	Mlakar	h		Maja  Mlakar		maja.mlakar@xxx.xx				1986-08-02	0208986666666	890123456	Z		Slovenija	Slovenija	Nova Gorica
00090000-562f-9028-2514-94861b5a756e	00010000-562f-9028-b6ca-b15f553ecdd6	\N	0009		Irena	Kos	i		Irena  Kos		irena.kos@xxx.xx				1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Ptuj
00090000-562f-9028-d381-31deece1d765	\N	\N	0010		Mojca	Vidmar	J		Mojca  Vidmar		mojca.vidmar@xxx.xx				1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Idrija
00090000-562f-9028-49c8-5097c20e755d	\N	\N	0011		xx	write protected12345	a		xx  write protected12345		xx@xxx.xx				\N	\N	\N	Z		\N	\N	\N
00090000-562f-9028-3d4d-db0b158c429c	\N	\N	0012		Luka	Golob	luč	a	Luka a Golob		luka.golob@xxx.xx				\N	\N	\N	M		\N	\N	\N
00090000-562f-9028-8bfe-5408dfee1f21	00010000-562f-9028-163d-1b20ef0773ef	\N	0013		Tatjana	Božič	tajnica	a	Tatjana a Božič		tatjana.bozic@xxx.xx				\N	\N	\N	Z		\N	\N	\N
00090000-562f-9028-4c36-453ceece5414	\N	\N	0014		William	Shakespeare	avtor		William  Shakespeare		\N				\N	\N	\N	M		\N	\N	\N
00090000-562f-9028-2bc0-f633a60753a8	\N	\N	0015		Nebojša	Kavader	avtor		Nebojša  Kavader		\N				\N	\N	\N	M		\N	\N	\N
00090000-562f-9028-bbd1-feb6851f4f64	\N	\N	0016		Fjodor	Dostojevski	avtor	Mihajlovič	Fjodor Mihajlovič Dostojevski		\N				\N	\N	\N	M		\N	\N	\N
00090000-562f-9028-5856-c4536e9fae8b	\N	\N	0017		Berta 	Hočevar	avtorica		Berta   Hočevar		\N				\N	\N	\N	Z		\N	\N	\N
00090000-562f-9028-6128-82ff757464ea	\N	\N	0018		Katarina	Podbevšek	lektorica		Katarina  Podbevšek		\N				\N	\N	\N	Z		\N	\N	\N
00090000-562f-9028-6463-f8f9ee621309	\N	\N	0019		Lojze	Žumer			Lojze  Žumer		\N				\N	\N	\N	M		\N	\N	\N
00090000-562f-9028-fcd4-b265eef8490c	\N	\N	0020		Luka	Novak			Luka  Novak		\N				\N	\N	\N	M		\N	\N	\N
00090000-562f-9028-3fa5-19099ab7385a	\N	\N	0021		Vinko	   Netriman   			Vinko     Netriman   		\N				\N	\N	\N	M		\N	\N	\N
\.


--
-- TOC entry 3056 (class 0 OID 23544719)
-- Dependencies: 177
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-562f-9026-d3b8-cb28f6055b02	Aaa-read	Aaa (User,Role,Permission) - branje	t
00030000-562f-9026-233a-3f66c1b987fa	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	t
00030000-562f-9026-596a-3cd91b755bcb	TerminStoritve-vse	TerminStoritve - spreminjanje vseh zapisov	t
00030000-562f-9026-376f-8888951faf19	Dogodek-readVse	Dogodek - branje vseh, ne glede na status dogodka	t
00030000-562f-9026-53b2-e7ff204c5b3d	Oseba-vse	Oseba - vse - za testiranje assert	t
00030000-562f-9026-5090-5d4302a03b59	ProgramDela-lock	ProgramDela - zaklepanje	t
00030000-562f-9026-eaa6-de45b964ebc9	ProgramDela-unlock	ProgramDela - odklepanje	t
00030000-562f-9026-359d-44b0c472c6bb	Abonma-read	Abonma - branje	t
00030000-562f-9026-bb1d-a2214a8efc92	Abonma-write	Abonma - spreminjanje	t
00030000-562f-9026-a4b3-188debf57f9f	Alternacija-read	Alternacija - branje	t
00030000-562f-9026-4c5f-b7f56f67ab53	Alternacija-write	Alternacija - spreminjanje	t
00030000-562f-9026-f974-e63790d0bb61	Arhivalija-read	Arhivalija - branje	t
00030000-562f-9026-8939-7559a7a7dbc9	Arhivalija-write	Arhivalija - spreminjanje	t
00030000-562f-9026-3349-9f40d88c93a1	AvtorBesedila-read	AvtorBesedila - branje	t
00030000-562f-9026-463b-ba0255632057	AvtorBesedila-write	AvtorBesedila - spreminjanje	t
00030000-562f-9026-3110-4774b17941a2	Besedilo-read	Besedilo - branje	t
00030000-562f-9026-4b10-a2288d091b55	Besedilo-write	Besedilo - spreminjanje	t
00030000-562f-9026-4d77-5112b1e390f2	DogodekIzven-read	DogodekIzven - branje	t
00030000-562f-9026-bdea-e0b7d836c2a5	DogodekIzven-write	DogodekIzven - spreminjanje	t
00030000-562f-9026-74e6-4a80e5322076	Dogodek-read	Dogodek - branje	t
00030000-562f-9026-11cb-1b9fdcebf790	Dogodek-write	Dogodek - spreminjanje	t
00030000-562f-9026-dc6c-2451b67dc516	DrugiVir-read	DrugiVir - branje	t
00030000-562f-9026-51b1-9e65eee75339	DrugiVir-write	DrugiVir - spreminjanje	t
00030000-562f-9026-d7ca-39c483787def	Drzava-read	Drzava - branje	t
00030000-562f-9026-c9b2-3c63095ecc3a	Drzava-write	Drzava - spreminjanje	t
00030000-562f-9026-cc2c-2120ea2e970f	EnotaPrograma-read	EnotaPrograma - branje	t
00030000-562f-9026-b1a8-a12a4dc659cf	EnotaPrograma-write	EnotaPrograma - spreminjanje	t
00030000-562f-9026-846a-2694b22a9774	Funkcija-read	Funkcija - branje	t
00030000-562f-9026-665b-3713038e0f1a	Funkcija-write	Funkcija - spreminjanje	t
00030000-562f-9026-399b-588dcca63890	Gostovanje-read	Gostovanje - branje	t
00030000-562f-9026-beb3-d880b7eb2286	Gostovanje-write	Gostovanje - spreminjanje	t
00030000-562f-9026-5aed-57b10cd6829d	Gostujoca-read	Gostujoca - branje	t
00030000-562f-9026-afab-0676dc1a0690	Gostujoca-write	Gostujoca - spreminjanje	t
00030000-562f-9026-8fce-c58e0e74c010	KontaktnaOseba-read	KontaktnaOseba - branje	t
00030000-562f-9026-f6df-b06a38051a54	KontaktnaOseba-write	KontaktnaOseba - spreminjanje	t
00030000-562f-9026-3026-d4e2888b89bc	Kupec-read	Kupec - branje	t
00030000-562f-9026-0824-cadeac325cc3	Kupec-write	Kupec - spreminjanje	t
00030000-562f-9026-535a-6f76fe8dc98b	NacinPlacina-read	NacinPlacina - branje	t
00030000-562f-9026-7c25-bdd5438337e7	NacinPlacina-write	NacinPlacina - spreminjanje	t
00030000-562f-9026-144e-cd4d66cc33c8	Option-read	Option - branje	t
00030000-562f-9026-9568-e892e141c5f1	Option-write	Option - spreminjanje	t
00030000-562f-9026-f3a5-8513bf31420b	OptionValue-read	OptionValue - branje	t
00030000-562f-9026-1989-e2530d784d66	OptionValue-write	OptionValue - spreminjanje	t
00030000-562f-9026-42ab-d1de45ae193f	OrganizacijskaEnota-read	OrganizacijskaEnota - branje	t
00030000-562f-9026-0dc8-fe65522dc631	OrganizacijskaEnota-write	OrganizacijskaEnota - spreminjanje	t
00030000-562f-9026-e243-1c3fca3601d5	Oseba-read	Oseba - branje	t
00030000-562f-9026-1d65-c9f2162c6f0d	Oseba-write	Oseba - spreminjanje	t
00030000-562f-9026-d00f-a73e255db409	PlacilniInstrument-read	PlacilniInstrument - branje	t
00030000-562f-9026-e667-2d455c7f0f26	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	t
00030000-562f-9026-a80b-2fd8b0bfef03	PodrocjeSedenja-read	PodrocjeSedenja - branje	t
00030000-562f-9026-c38a-01ddb42ab35b	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	t
00030000-562f-9026-78c4-05149ecb384c	Pogodba-read	Pogodba - branje	t
00030000-562f-9026-c972-e6923e7e3924	Pogodba-write	Pogodba - spreminjanje	t
00030000-562f-9026-60ee-4cf971da0304	Popa-read	Popa - branje	t
00030000-562f-9026-1669-5c9440b9fe45	Popa-write	Popa - spreminjanje	t
00030000-562f-9026-6a81-b967da8a8e8d	Posta-read	Posta - branje	t
00030000-562f-9026-35b0-c34ffc90d82e	Posta-write	Posta - spreminjanje	t
00030000-562f-9026-8d64-1161d2b6c6d7	PostavkaCDve-read	PostavkaCDve - branje	t
00030000-562f-9026-6483-6d75885595d5	PostavkaCDve-write	PostavkaCDve - spreminjanje	t
00030000-562f-9026-ec05-869e28b914d1	PostavkaRacuna-read	PostavkaRacuna - branje	t
00030000-562f-9026-4d74-24460f1bc179	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	t
00030000-562f-9026-6668-874a8a6ee938	PostniNaslov-read	PostniNaslov - branje	t
00030000-562f-9026-ee71-8b4ba7ada314	PostniNaslov-write	PostniNaslov - spreminjanje	t
00030000-562f-9026-da6f-c6407463afba	Predstava-read	Predstava - branje	t
00030000-562f-9026-85a1-9fac4431ba20	Predstava-write	Predstava - spreminjanje	t
00030000-562f-9026-afc9-ecca61c5820c	Praznik-read	Praznik - branje	t
00030000-562f-9026-d9ac-45aa58021a09	Praznik-write	Praznik - spreminjanje	t
00030000-562f-9026-d367-5d080488868e	ProdajaPredstave-read	ProdajaPredstave - branje	t
00030000-562f-9026-6412-fe77ebdff240	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	t
00030000-562f-9026-923b-b6c9fef53983	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	t
00030000-562f-9026-4c99-311c80eb4b66	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	t
00030000-562f-9026-9e65-24a62cce0d3b	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	t
00030000-562f-9026-e04d-2a40803cf75f	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	t
00030000-562f-9026-1880-01a79f799f6d	ProgramDela-read	ProgramDela - branje	t
00030000-562f-9026-783f-9eb41e0b986a	ProgramDela-write	ProgramDela - spreminjanje	t
00030000-562f-9026-f59f-dd760207ce6c	ProgramFestival-read	ProgramFestival - branje	t
00030000-562f-9026-eac7-5c37369430f9	ProgramFestival-write	ProgramFestival - spreminjanje	t
00030000-562f-9026-d67d-d374938e3f82	ProgramGostovanje-read	ProgramGostovanje - branje	t
00030000-562f-9026-a310-7897e967ec39	ProgramGostovanje-write	ProgramGostovanje - spreminjanje	t
00030000-562f-9026-7443-9bd61f6980f5	ProgramGostujoca-read	ProgramGostujoca - branje	t
00030000-562f-9026-1ab7-0b8858ad3e07	ProgramGostujoca-write	ProgramGostujoca - spreminjanje	t
00030000-562f-9026-fb39-dbd54b23578a	ProgramIzjemni-read	ProgramIzjemni - branje	t
00030000-562f-9026-4944-186ef2774e62	ProgramIzjemni-write	ProgramIzjemni - spreminjanje	t
00030000-562f-9026-da55-fb92d9d1ed3f	ProgramPonovitevPrejsnjih-read	ProgramPonovitevPrejsnjih - branje	t
00030000-562f-9026-b4c2-eb7f8a7b092d	ProgramPonovitevPrejsnjih-write	ProgramPonovitevPrejsnjih - spreminjanje	t
00030000-562f-9026-c165-cb6f33378850	ProgramPonovitevPremiere-read	ProgramPonovitevPremiere - branje	t
00030000-562f-9026-fc48-036dceb6b510	ProgramPonovitevPremiere-write	ProgramPonovitevPremiere - spreminjanje	t
00030000-562f-9026-658a-fac9448dd153	ProgramPremiera-read	ProgramPremiera - branje	t
00030000-562f-9026-1dc7-80b344cb4caf	ProgramPremiera-write	ProgramPremiera - spreminjanje	t
00030000-562f-9026-c061-83d507a9b277	ProgramRazno-read	ProgramRazno - branje	t
00030000-562f-9026-94e3-a1fb8e2d6e1d	ProgramRazno-write	ProgramRazno - spreminjanje	t
00030000-562f-9026-82ae-562f13766c51	ProgramskaEnotaSklopa-read	ProgramskaEnotaSklopa - branje	t
00030000-562f-9026-b756-bf04ff246072	ProgramskaEnotaSklopa-write	ProgramskaEnotaSklopa - spreminjanje	t
00030000-562f-9026-6fdf-5730976f3330	Prostor-read	Prostor - branje	t
00030000-562f-9026-0c07-5afced48103e	Prostor-write	Prostor - spreminjanje	t
00030000-562f-9026-35f9-7a763881ca27	Racun-read	Racun - branje	t
00030000-562f-9026-6df6-20f2ae0db9db	Racun-write	Racun - spreminjanje	t
00030000-562f-9026-fd60-95cba66edd29	RazpisanSedez-read	RazpisanSedez - branje	t
00030000-562f-9026-3d64-40e9af7c6d48	RazpisanSedez-write	RazpisanSedez - spreminjanje	t
00030000-562f-9026-8005-5edd151b42b5	Rekviziterstvo-read	Rekviziterstvo - branje	t
00030000-562f-9026-4c35-dae5054a3825	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	t
00030000-562f-9026-de14-4a287b92335a	Rekvizit-read	Rekvizit - branje	t
00030000-562f-9026-fc8b-fea4aa446f76	Rekvizit-write	Rekvizit - spreminjanje	t
00030000-562f-9026-79df-b65d78d80332	Revizija-read	Revizija - branje	t
00030000-562f-9026-d165-de53efa3ac8b	Revizija-write	Revizija - spreminjanje	t
00030000-562f-9026-12cd-27bf9ece8403	Rezervacija-read	Rezervacija - branje	t
00030000-562f-9026-bf81-1c6b8e789ad2	Rezervacija-write	Rezervacija - spreminjanje	t
00030000-562f-9026-5c7f-ac788352242a	SedezniRed-read	SedezniRed - branje	t
00030000-562f-9026-c46a-226593917dd1	SedezniRed-write	SedezniRed - spreminjanje	t
00030000-562f-9026-be8a-4f1c5dd31e70	Sedez-read	Sedez - branje	t
00030000-562f-9026-6a23-2fe3ca6ff9ed	Sedez-write	Sedez - spreminjanje	t
00030000-562f-9026-bca4-2d02560b0d2d	Sezona-read	Sezona - branje	t
00030000-562f-9026-45a9-00dc0fd07458	Sezona-write	Sezona - spreminjanje	t
00030000-562f-9026-1797-42cf6c4d2eaf	StevilcenjeKonfig-read	StevilcenjeKonfig - branje	t
00030000-562f-9026-739e-fa90c91c47bb	StevilcenjeKonfig-write	StevilcenjeKonfig - spreminjanje	t
00030000-562f-9026-dd86-73914650a9f5	Stevilcenje-read	Stevilcenje - branje	t
00030000-562f-9026-be56-a3e44a80dd84	Stevilcenje-write	Stevilcenje - spreminjanje	t
00030000-562f-9026-b079-e19388da7d55	StevilcenjeStanje-read	StevilcenjeStanje - branje	t
00030000-562f-9026-fa72-0f5c6ff266f0	StevilcenjeStanje-write	StevilcenjeStanje - spreminjanje	t
00030000-562f-9026-0bae-e59be12bdebc	StrosekUprizoritve-read	StrosekUprizoritve - branje	t
00030000-562f-9026-bc75-9aeb00e56461	StrosekUprizoritve-write	StrosekUprizoritve - spreminjanje	t
00030000-562f-9026-24e5-1b0e992e738f	Telefonska-read	Telefonska - branje	t
00030000-562f-9026-2b15-e190cb04da51	Telefonska-write	Telefonska - spreminjanje	t
00030000-562f-9026-25fa-d751c167a595	TerminStoritve-read	TerminStoritve - branje	t
00030000-562f-9026-e30d-4ebded8fb740	TerminStoritve-write	TerminStoritve - spreminjanje	t
00030000-562f-9026-c7e4-b8c024cf39f1	TipFunkcije-read	TipFunkcije - branje	t
00030000-562f-9026-5af4-2f11a566a3d1	TipFunkcije-write	TipFunkcije - spreminjanje	t
00030000-562f-9026-4a6c-e89ddfaf99f0	TipPopa-read	TipPopa - branje	t
00030000-562f-9026-27bc-adbdb8794c75	TipPopa-write	TipPopa - spreminjanje	t
00030000-562f-9026-9d04-4d81442ab5bb	TipProgramskeEnote-read	TipProgramskeEnote - branje	t
00030000-562f-9026-17b8-fcd8ab0a18ed	TipProgramskeEnote-write	TipProgramskeEnote - spreminjanje	t
00030000-562f-9026-a1d2-b7cd4f459917	TipVaje-read	TipVaje - branje	t
00030000-562f-9026-03b3-0ab2fa5165d8	TipVaje-write	TipVaje - spreminjanje	t
00030000-562f-9026-eb7d-f8b6b044ed7c	Trr-read	Trr - branje	t
00030000-562f-9026-4db8-2083b20e80b1	Trr-write	Trr - spreminjanje	t
00030000-562f-9026-843b-85be8c2bc498	Uprizoritev-read	Uprizoritev - branje	t
00030000-562f-9026-00ec-fce680852f10	Uprizoritev-write	Uprizoritev - spreminjanje	t
00030000-562f-9026-ebbd-e941c8d9b652	Vaja-read	Vaja - branje	t
00030000-562f-9026-62e8-530a7a20fcee	Vaja-write	Vaja - spreminjanje	t
00030000-562f-9026-46e6-c929f4d36fb8	VrstaSedezev-read	VrstaSedezev - branje	t
00030000-562f-9026-65eb-274f98c99526	VrstaSedezev-write	VrstaSedezev - spreminjanje	t
00030000-562f-9026-bec7-d670a0cd12e4	VrstaStroska-read	VrstaStroska - branje	t
00030000-562f-9026-c1a7-d42ef1d98706	VrstaStroska-write	VrstaStroska - spreminjanje	t
00030000-562f-9026-6c5b-698611346796	Zaposlitev-read	Zaposlitev - branje	t
00030000-562f-9026-6d14-044741086abd	Zaposlitev-write	Zaposlitev - spreminjanje	t
00030000-562f-9026-5465-10711e312935	Zasedenost-read	Zasedenost - branje	t
00030000-562f-9026-5924-87fef8bb113d	Zasedenost-write	Zasedenost - spreminjanje	t
00030000-562f-9026-4699-d690a5c1b03f	ZvrstSurs-read	ZvrstSurs - branje	t
00030000-562f-9026-b66b-fa13f3a99e54	ZvrstSurs-write	ZvrstSurs - spreminjanje	t
00030000-562f-9026-24a3-13ef4020c170	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	t
00030000-562f-9026-fc85-5333e5ecf88f	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	t
00030000-562f-9026-4b20-af925490c0a8	Job-read	Branje opravil - samo zase - branje	t
00030000-562f-9026-5d9c-6307e6dea3d6	Job-write	Dodajanje in spreminjanje opravil - samo zase	t
00030000-562f-9026-dd9a-bfbdd4590ffe	Job-admin	Upravljanje opravil za vse uporabnike	t
00030000-562f-9026-2f77-4da2e7c4067f	Mapa-write	Mapa - osnovno dovoljenje za pisanje	t
00030000-562f-9026-2e6b-c379b4746e45	Mapa-read	Mapa - osnovno dovoljenje za branje	t
00030000-562f-9026-1cef-7f1ed88dce69	MapaAcl-write	MapaAcl - dovoljenje za dostop pisanje ACL-jev mape	t
00030000-562f-9026-e541-a5b7f6bb718c	MapaAcl-read	MapaAcl - dovoljenje za dostop branje ACL-jev mape	t
00030000-562f-9026-fe26-2ef2afadd1ab	Zapis-write	Zapis - dovoljenje za pisanje zapisov	t
00030000-562f-9026-635f-65e583e35bb2	Zapis-read	Zapis - dovoljenje za pisanje zapisov	t
00030000-562f-9026-1259-5bbc79cb49ed	ZapisLastnik-write	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	t
00030000-562f-9026-e9be-bd077b0fb137	ZapisLastnik-read	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	t
00030000-562f-9026-b1ca-13a0c0672289	VrstaZapisa-write	Šifrant vrst zapisa - spreminjanje	t
00030000-562f-9026-3fc6-c1d87936a7d5	VrstaZapisa-read	Šifrant vrst zapisa - branje	t
00030000-562f-9026-6557-c73793261f03	Datoteka-write	Datoteka - spreminjanje	t
00030000-562f-9026-1efd-744d7ca9bc1f	Datoteka-read	Datoteke - branje	t
\.


--
-- TOC entry 3058 (class 0 OID 23544738)
-- Dependencies: 179
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-562f-9026-b9b3-e7ee8219619c	00030000-562f-9026-233a-3f66c1b987fa
00020000-562f-9026-969b-bd352cd14023	00030000-562f-9026-d7ca-39c483787def
00020000-562f-9027-60f1-d09cd4385f0b	00030000-562f-9026-359d-44b0c472c6bb
00020000-562f-9027-60f1-d09cd4385f0b	00030000-562f-9026-bb1d-a2214a8efc92
00020000-562f-9027-60f1-d09cd4385f0b	00030000-562f-9026-a4b3-188debf57f9f
00020000-562f-9027-60f1-d09cd4385f0b	00030000-562f-9026-4c5f-b7f56f67ab53
00020000-562f-9027-60f1-d09cd4385f0b	00030000-562f-9026-f974-e63790d0bb61
00020000-562f-9027-60f1-d09cd4385f0b	00030000-562f-9026-74e6-4a80e5322076
00020000-562f-9027-60f1-d09cd4385f0b	00030000-562f-9026-376f-8888951faf19
00020000-562f-9027-60f1-d09cd4385f0b	00030000-562f-9026-11cb-1b9fdcebf790
00020000-562f-9027-60f1-d09cd4385f0b	00030000-562f-9026-d7ca-39c483787def
00020000-562f-9027-60f1-d09cd4385f0b	00030000-562f-9026-c9b2-3c63095ecc3a
00020000-562f-9027-60f1-d09cd4385f0b	00030000-562f-9026-846a-2694b22a9774
00020000-562f-9027-60f1-d09cd4385f0b	00030000-562f-9026-665b-3713038e0f1a
00020000-562f-9027-60f1-d09cd4385f0b	00030000-562f-9026-399b-588dcca63890
00020000-562f-9027-60f1-d09cd4385f0b	00030000-562f-9026-beb3-d880b7eb2286
00020000-562f-9027-60f1-d09cd4385f0b	00030000-562f-9026-5aed-57b10cd6829d
00020000-562f-9027-60f1-d09cd4385f0b	00030000-562f-9026-afab-0676dc1a0690
00020000-562f-9027-60f1-d09cd4385f0b	00030000-562f-9026-8fce-c58e0e74c010
00020000-562f-9027-60f1-d09cd4385f0b	00030000-562f-9026-f6df-b06a38051a54
00020000-562f-9027-60f1-d09cd4385f0b	00030000-562f-9026-144e-cd4d66cc33c8
00020000-562f-9027-60f1-d09cd4385f0b	00030000-562f-9026-f3a5-8513bf31420b
00020000-562f-9027-60f1-d09cd4385f0b	00030000-562f-9026-e243-1c3fca3601d5
00020000-562f-9027-60f1-d09cd4385f0b	00030000-562f-9026-1d65-c9f2162c6f0d
00020000-562f-9027-60f1-d09cd4385f0b	00030000-562f-9026-60ee-4cf971da0304
00020000-562f-9027-60f1-d09cd4385f0b	00030000-562f-9026-1669-5c9440b9fe45
00020000-562f-9027-60f1-d09cd4385f0b	00030000-562f-9026-6a81-b967da8a8e8d
00020000-562f-9027-60f1-d09cd4385f0b	00030000-562f-9026-35b0-c34ffc90d82e
00020000-562f-9027-60f1-d09cd4385f0b	00030000-562f-9026-6668-874a8a6ee938
00020000-562f-9027-60f1-d09cd4385f0b	00030000-562f-9026-ee71-8b4ba7ada314
00020000-562f-9027-60f1-d09cd4385f0b	00030000-562f-9026-da6f-c6407463afba
00020000-562f-9027-60f1-d09cd4385f0b	00030000-562f-9026-85a1-9fac4431ba20
00020000-562f-9027-60f1-d09cd4385f0b	00030000-562f-9026-9e65-24a62cce0d3b
00020000-562f-9027-60f1-d09cd4385f0b	00030000-562f-9026-e04d-2a40803cf75f
00020000-562f-9027-60f1-d09cd4385f0b	00030000-562f-9026-6fdf-5730976f3330
00020000-562f-9027-60f1-d09cd4385f0b	00030000-562f-9026-0c07-5afced48103e
00020000-562f-9027-60f1-d09cd4385f0b	00030000-562f-9026-8005-5edd151b42b5
00020000-562f-9027-60f1-d09cd4385f0b	00030000-562f-9026-4c35-dae5054a3825
00020000-562f-9027-60f1-d09cd4385f0b	00030000-562f-9026-de14-4a287b92335a
00020000-562f-9027-60f1-d09cd4385f0b	00030000-562f-9026-fc8b-fea4aa446f76
00020000-562f-9027-60f1-d09cd4385f0b	00030000-562f-9026-bca4-2d02560b0d2d
00020000-562f-9027-60f1-d09cd4385f0b	00030000-562f-9026-45a9-00dc0fd07458
00020000-562f-9027-60f1-d09cd4385f0b	00030000-562f-9026-c7e4-b8c024cf39f1
00020000-562f-9027-60f1-d09cd4385f0b	00030000-562f-9026-843b-85be8c2bc498
00020000-562f-9027-60f1-d09cd4385f0b	00030000-562f-9026-00ec-fce680852f10
00020000-562f-9027-60f1-d09cd4385f0b	00030000-562f-9026-ebbd-e941c8d9b652
00020000-562f-9027-60f1-d09cd4385f0b	00030000-562f-9026-62e8-530a7a20fcee
00020000-562f-9027-60f1-d09cd4385f0b	00030000-562f-9026-5465-10711e312935
00020000-562f-9027-60f1-d09cd4385f0b	00030000-562f-9026-5924-87fef8bb113d
00020000-562f-9027-60f1-d09cd4385f0b	00030000-562f-9026-4699-d690a5c1b03f
00020000-562f-9027-60f1-d09cd4385f0b	00030000-562f-9026-24a3-13ef4020c170
00020000-562f-9027-bdc7-90fa06916cc0	00030000-562f-9026-359d-44b0c472c6bb
00020000-562f-9027-bdc7-90fa06916cc0	00030000-562f-9026-f974-e63790d0bb61
00020000-562f-9027-bdc7-90fa06916cc0	00030000-562f-9026-74e6-4a80e5322076
00020000-562f-9027-bdc7-90fa06916cc0	00030000-562f-9026-d7ca-39c483787def
00020000-562f-9027-bdc7-90fa06916cc0	00030000-562f-9026-399b-588dcca63890
00020000-562f-9027-bdc7-90fa06916cc0	00030000-562f-9026-5aed-57b10cd6829d
00020000-562f-9027-bdc7-90fa06916cc0	00030000-562f-9026-8fce-c58e0e74c010
00020000-562f-9027-bdc7-90fa06916cc0	00030000-562f-9026-f6df-b06a38051a54
00020000-562f-9027-bdc7-90fa06916cc0	00030000-562f-9026-144e-cd4d66cc33c8
00020000-562f-9027-bdc7-90fa06916cc0	00030000-562f-9026-f3a5-8513bf31420b
00020000-562f-9027-bdc7-90fa06916cc0	00030000-562f-9026-e243-1c3fca3601d5
00020000-562f-9027-bdc7-90fa06916cc0	00030000-562f-9026-1d65-c9f2162c6f0d
00020000-562f-9027-bdc7-90fa06916cc0	00030000-562f-9026-60ee-4cf971da0304
00020000-562f-9027-bdc7-90fa06916cc0	00030000-562f-9026-6a81-b967da8a8e8d
00020000-562f-9027-bdc7-90fa06916cc0	00030000-562f-9026-6668-874a8a6ee938
00020000-562f-9027-bdc7-90fa06916cc0	00030000-562f-9026-ee71-8b4ba7ada314
00020000-562f-9027-bdc7-90fa06916cc0	00030000-562f-9026-da6f-c6407463afba
00020000-562f-9027-bdc7-90fa06916cc0	00030000-562f-9026-6fdf-5730976f3330
00020000-562f-9027-bdc7-90fa06916cc0	00030000-562f-9026-8005-5edd151b42b5
00020000-562f-9027-bdc7-90fa06916cc0	00030000-562f-9026-de14-4a287b92335a
00020000-562f-9027-bdc7-90fa06916cc0	00030000-562f-9026-bca4-2d02560b0d2d
00020000-562f-9027-bdc7-90fa06916cc0	00030000-562f-9026-24e5-1b0e992e738f
00020000-562f-9027-bdc7-90fa06916cc0	00030000-562f-9026-2b15-e190cb04da51
00020000-562f-9027-bdc7-90fa06916cc0	00030000-562f-9026-eb7d-f8b6b044ed7c
00020000-562f-9027-bdc7-90fa06916cc0	00030000-562f-9026-4db8-2083b20e80b1
00020000-562f-9027-bdc7-90fa06916cc0	00030000-562f-9026-6c5b-698611346796
00020000-562f-9027-bdc7-90fa06916cc0	00030000-562f-9026-6d14-044741086abd
00020000-562f-9027-bdc7-90fa06916cc0	00030000-562f-9026-4699-d690a5c1b03f
00020000-562f-9027-bdc7-90fa06916cc0	00030000-562f-9026-24a3-13ef4020c170
00020000-562f-9027-57db-ac1429e4ceb0	00030000-562f-9026-359d-44b0c472c6bb
00020000-562f-9027-57db-ac1429e4ceb0	00030000-562f-9026-a4b3-188debf57f9f
00020000-562f-9027-57db-ac1429e4ceb0	00030000-562f-9026-f974-e63790d0bb61
00020000-562f-9027-57db-ac1429e4ceb0	00030000-562f-9026-8939-7559a7a7dbc9
00020000-562f-9027-57db-ac1429e4ceb0	00030000-562f-9026-3110-4774b17941a2
00020000-562f-9027-57db-ac1429e4ceb0	00030000-562f-9026-4d77-5112b1e390f2
00020000-562f-9027-57db-ac1429e4ceb0	00030000-562f-9026-74e6-4a80e5322076
00020000-562f-9027-57db-ac1429e4ceb0	00030000-562f-9026-d7ca-39c483787def
00020000-562f-9027-57db-ac1429e4ceb0	00030000-562f-9026-846a-2694b22a9774
00020000-562f-9027-57db-ac1429e4ceb0	00030000-562f-9026-399b-588dcca63890
00020000-562f-9027-57db-ac1429e4ceb0	00030000-562f-9026-5aed-57b10cd6829d
00020000-562f-9027-57db-ac1429e4ceb0	00030000-562f-9026-8fce-c58e0e74c010
00020000-562f-9027-57db-ac1429e4ceb0	00030000-562f-9026-144e-cd4d66cc33c8
00020000-562f-9027-57db-ac1429e4ceb0	00030000-562f-9026-f3a5-8513bf31420b
00020000-562f-9027-57db-ac1429e4ceb0	00030000-562f-9026-e243-1c3fca3601d5
00020000-562f-9027-57db-ac1429e4ceb0	00030000-562f-9026-60ee-4cf971da0304
00020000-562f-9027-57db-ac1429e4ceb0	00030000-562f-9026-6a81-b967da8a8e8d
00020000-562f-9027-57db-ac1429e4ceb0	00030000-562f-9026-da6f-c6407463afba
00020000-562f-9027-57db-ac1429e4ceb0	00030000-562f-9026-9e65-24a62cce0d3b
00020000-562f-9027-57db-ac1429e4ceb0	00030000-562f-9026-6fdf-5730976f3330
00020000-562f-9027-57db-ac1429e4ceb0	00030000-562f-9026-8005-5edd151b42b5
00020000-562f-9027-57db-ac1429e4ceb0	00030000-562f-9026-de14-4a287b92335a
00020000-562f-9027-57db-ac1429e4ceb0	00030000-562f-9026-bca4-2d02560b0d2d
00020000-562f-9027-57db-ac1429e4ceb0	00030000-562f-9026-c7e4-b8c024cf39f1
00020000-562f-9027-57db-ac1429e4ceb0	00030000-562f-9026-ebbd-e941c8d9b652
00020000-562f-9027-57db-ac1429e4ceb0	00030000-562f-9026-5465-10711e312935
00020000-562f-9027-57db-ac1429e4ceb0	00030000-562f-9026-4699-d690a5c1b03f
00020000-562f-9027-57db-ac1429e4ceb0	00030000-562f-9026-24a3-13ef4020c170
00020000-562f-9027-bb03-5865301e47db	00030000-562f-9026-359d-44b0c472c6bb
00020000-562f-9027-bb03-5865301e47db	00030000-562f-9026-bb1d-a2214a8efc92
00020000-562f-9027-bb03-5865301e47db	00030000-562f-9026-4c5f-b7f56f67ab53
00020000-562f-9027-bb03-5865301e47db	00030000-562f-9026-f974-e63790d0bb61
00020000-562f-9027-bb03-5865301e47db	00030000-562f-9026-74e6-4a80e5322076
00020000-562f-9027-bb03-5865301e47db	00030000-562f-9026-d7ca-39c483787def
00020000-562f-9027-bb03-5865301e47db	00030000-562f-9026-399b-588dcca63890
00020000-562f-9027-bb03-5865301e47db	00030000-562f-9026-5aed-57b10cd6829d
00020000-562f-9027-bb03-5865301e47db	00030000-562f-9026-144e-cd4d66cc33c8
00020000-562f-9027-bb03-5865301e47db	00030000-562f-9026-f3a5-8513bf31420b
00020000-562f-9027-bb03-5865301e47db	00030000-562f-9026-60ee-4cf971da0304
00020000-562f-9027-bb03-5865301e47db	00030000-562f-9026-6a81-b967da8a8e8d
00020000-562f-9027-bb03-5865301e47db	00030000-562f-9026-da6f-c6407463afba
00020000-562f-9027-bb03-5865301e47db	00030000-562f-9026-6fdf-5730976f3330
00020000-562f-9027-bb03-5865301e47db	00030000-562f-9026-8005-5edd151b42b5
00020000-562f-9027-bb03-5865301e47db	00030000-562f-9026-de14-4a287b92335a
00020000-562f-9027-bb03-5865301e47db	00030000-562f-9026-bca4-2d02560b0d2d
00020000-562f-9027-bb03-5865301e47db	00030000-562f-9026-c7e4-b8c024cf39f1
00020000-562f-9027-bb03-5865301e47db	00030000-562f-9026-4699-d690a5c1b03f
00020000-562f-9027-bb03-5865301e47db	00030000-562f-9026-24a3-13ef4020c170
00020000-562f-9027-1201-3254f27a0c80	00030000-562f-9026-359d-44b0c472c6bb
00020000-562f-9027-1201-3254f27a0c80	00030000-562f-9026-f974-e63790d0bb61
00020000-562f-9027-1201-3254f27a0c80	00030000-562f-9026-74e6-4a80e5322076
00020000-562f-9027-1201-3254f27a0c80	00030000-562f-9026-d7ca-39c483787def
00020000-562f-9027-1201-3254f27a0c80	00030000-562f-9026-399b-588dcca63890
00020000-562f-9027-1201-3254f27a0c80	00030000-562f-9026-5aed-57b10cd6829d
00020000-562f-9027-1201-3254f27a0c80	00030000-562f-9026-144e-cd4d66cc33c8
00020000-562f-9027-1201-3254f27a0c80	00030000-562f-9026-f3a5-8513bf31420b
00020000-562f-9027-1201-3254f27a0c80	00030000-562f-9026-60ee-4cf971da0304
00020000-562f-9027-1201-3254f27a0c80	00030000-562f-9026-6a81-b967da8a8e8d
00020000-562f-9027-1201-3254f27a0c80	00030000-562f-9026-da6f-c6407463afba
00020000-562f-9027-1201-3254f27a0c80	00030000-562f-9026-6fdf-5730976f3330
00020000-562f-9027-1201-3254f27a0c80	00030000-562f-9026-8005-5edd151b42b5
00020000-562f-9027-1201-3254f27a0c80	00030000-562f-9026-de14-4a287b92335a
00020000-562f-9027-1201-3254f27a0c80	00030000-562f-9026-bca4-2d02560b0d2d
00020000-562f-9027-1201-3254f27a0c80	00030000-562f-9026-25fa-d751c167a595
00020000-562f-9027-1201-3254f27a0c80	00030000-562f-9026-596a-3cd91b755bcb
00020000-562f-9027-1201-3254f27a0c80	00030000-562f-9026-c7e4-b8c024cf39f1
00020000-562f-9027-1201-3254f27a0c80	00030000-562f-9026-4699-d690a5c1b03f
00020000-562f-9027-1201-3254f27a0c80	00030000-562f-9026-24a3-13ef4020c170
00020000-562f-9028-1dee-7dcd45ac137b	00030000-562f-9026-d3b8-cb28f6055b02
00020000-562f-9028-1dee-7dcd45ac137b	00030000-562f-9026-233a-3f66c1b987fa
00020000-562f-9028-1dee-7dcd45ac137b	00030000-562f-9026-359d-44b0c472c6bb
00020000-562f-9028-1dee-7dcd45ac137b	00030000-562f-9026-bb1d-a2214a8efc92
00020000-562f-9028-1dee-7dcd45ac137b	00030000-562f-9026-a4b3-188debf57f9f
00020000-562f-9028-1dee-7dcd45ac137b	00030000-562f-9026-4c5f-b7f56f67ab53
00020000-562f-9028-1dee-7dcd45ac137b	00030000-562f-9026-f974-e63790d0bb61
00020000-562f-9028-1dee-7dcd45ac137b	00030000-562f-9026-8939-7559a7a7dbc9
00020000-562f-9028-1dee-7dcd45ac137b	00030000-562f-9026-3349-9f40d88c93a1
00020000-562f-9028-1dee-7dcd45ac137b	00030000-562f-9026-463b-ba0255632057
00020000-562f-9028-1dee-7dcd45ac137b	00030000-562f-9026-3110-4774b17941a2
00020000-562f-9028-1dee-7dcd45ac137b	00030000-562f-9026-4b10-a2288d091b55
00020000-562f-9028-1dee-7dcd45ac137b	00030000-562f-9026-4d77-5112b1e390f2
00020000-562f-9028-1dee-7dcd45ac137b	00030000-562f-9026-bdea-e0b7d836c2a5
00020000-562f-9028-1dee-7dcd45ac137b	00030000-562f-9026-74e6-4a80e5322076
00020000-562f-9028-1dee-7dcd45ac137b	00030000-562f-9026-376f-8888951faf19
00020000-562f-9028-1dee-7dcd45ac137b	00030000-562f-9026-11cb-1b9fdcebf790
00020000-562f-9028-1dee-7dcd45ac137b	00030000-562f-9026-dc6c-2451b67dc516
00020000-562f-9028-1dee-7dcd45ac137b	00030000-562f-9026-51b1-9e65eee75339
00020000-562f-9028-1dee-7dcd45ac137b	00030000-562f-9026-d7ca-39c483787def
00020000-562f-9028-1dee-7dcd45ac137b	00030000-562f-9026-c9b2-3c63095ecc3a
00020000-562f-9028-1dee-7dcd45ac137b	00030000-562f-9026-cc2c-2120ea2e970f
00020000-562f-9028-1dee-7dcd45ac137b	00030000-562f-9026-b1a8-a12a4dc659cf
00020000-562f-9028-1dee-7dcd45ac137b	00030000-562f-9026-846a-2694b22a9774
00020000-562f-9028-1dee-7dcd45ac137b	00030000-562f-9026-665b-3713038e0f1a
00020000-562f-9028-1dee-7dcd45ac137b	00030000-562f-9026-399b-588dcca63890
00020000-562f-9028-1dee-7dcd45ac137b	00030000-562f-9026-beb3-d880b7eb2286
00020000-562f-9028-1dee-7dcd45ac137b	00030000-562f-9026-5aed-57b10cd6829d
00020000-562f-9028-1dee-7dcd45ac137b	00030000-562f-9026-afab-0676dc1a0690
00020000-562f-9028-1dee-7dcd45ac137b	00030000-562f-9026-8fce-c58e0e74c010
00020000-562f-9028-1dee-7dcd45ac137b	00030000-562f-9026-f6df-b06a38051a54
00020000-562f-9028-1dee-7dcd45ac137b	00030000-562f-9026-3026-d4e2888b89bc
00020000-562f-9028-1dee-7dcd45ac137b	00030000-562f-9026-0824-cadeac325cc3
00020000-562f-9028-1dee-7dcd45ac137b	00030000-562f-9026-535a-6f76fe8dc98b
00020000-562f-9028-1dee-7dcd45ac137b	00030000-562f-9026-7c25-bdd5438337e7
00020000-562f-9028-1dee-7dcd45ac137b	00030000-562f-9026-144e-cd4d66cc33c8
00020000-562f-9028-1dee-7dcd45ac137b	00030000-562f-9026-f3a5-8513bf31420b
00020000-562f-9028-1dee-7dcd45ac137b	00030000-562f-9026-1989-e2530d784d66
00020000-562f-9028-1dee-7dcd45ac137b	00030000-562f-9026-9568-e892e141c5f1
00020000-562f-9028-1dee-7dcd45ac137b	00030000-562f-9026-42ab-d1de45ae193f
00020000-562f-9028-1dee-7dcd45ac137b	00030000-562f-9026-0dc8-fe65522dc631
00020000-562f-9028-1dee-7dcd45ac137b	00030000-562f-9026-e243-1c3fca3601d5
00020000-562f-9028-1dee-7dcd45ac137b	00030000-562f-9026-53b2-e7ff204c5b3d
00020000-562f-9028-1dee-7dcd45ac137b	00030000-562f-9026-1d65-c9f2162c6f0d
00020000-562f-9028-1dee-7dcd45ac137b	00030000-562f-9026-d00f-a73e255db409
00020000-562f-9028-1dee-7dcd45ac137b	00030000-562f-9026-e667-2d455c7f0f26
00020000-562f-9028-1dee-7dcd45ac137b	00030000-562f-9026-a80b-2fd8b0bfef03
00020000-562f-9028-1dee-7dcd45ac137b	00030000-562f-9026-c38a-01ddb42ab35b
00020000-562f-9028-1dee-7dcd45ac137b	00030000-562f-9026-78c4-05149ecb384c
00020000-562f-9028-1dee-7dcd45ac137b	00030000-562f-9026-c972-e6923e7e3924
00020000-562f-9028-1dee-7dcd45ac137b	00030000-562f-9026-60ee-4cf971da0304
00020000-562f-9028-1dee-7dcd45ac137b	00030000-562f-9026-1669-5c9440b9fe45
00020000-562f-9028-1dee-7dcd45ac137b	00030000-562f-9026-6a81-b967da8a8e8d
00020000-562f-9028-1dee-7dcd45ac137b	00030000-562f-9026-8d64-1161d2b6c6d7
00020000-562f-9028-1dee-7dcd45ac137b	00030000-562f-9026-6483-6d75885595d5
00020000-562f-9028-1dee-7dcd45ac137b	00030000-562f-9026-ec05-869e28b914d1
00020000-562f-9028-1dee-7dcd45ac137b	00030000-562f-9026-4d74-24460f1bc179
00020000-562f-9028-1dee-7dcd45ac137b	00030000-562f-9026-35b0-c34ffc90d82e
00020000-562f-9028-1dee-7dcd45ac137b	00030000-562f-9026-6668-874a8a6ee938
00020000-562f-9028-1dee-7dcd45ac137b	00030000-562f-9026-ee71-8b4ba7ada314
00020000-562f-9028-1dee-7dcd45ac137b	00030000-562f-9026-afc9-ecca61c5820c
00020000-562f-9028-1dee-7dcd45ac137b	00030000-562f-9026-d9ac-45aa58021a09
00020000-562f-9028-1dee-7dcd45ac137b	00030000-562f-9026-da6f-c6407463afba
00020000-562f-9028-1dee-7dcd45ac137b	00030000-562f-9026-85a1-9fac4431ba20
00020000-562f-9028-1dee-7dcd45ac137b	00030000-562f-9026-d367-5d080488868e
00020000-562f-9028-1dee-7dcd45ac137b	00030000-562f-9026-6412-fe77ebdff240
00020000-562f-9028-1dee-7dcd45ac137b	00030000-562f-9026-923b-b6c9fef53983
00020000-562f-9028-1dee-7dcd45ac137b	00030000-562f-9026-4c99-311c80eb4b66
00020000-562f-9028-1dee-7dcd45ac137b	00030000-562f-9026-9e65-24a62cce0d3b
00020000-562f-9028-1dee-7dcd45ac137b	00030000-562f-9026-e04d-2a40803cf75f
00020000-562f-9028-1dee-7dcd45ac137b	00030000-562f-9026-5090-5d4302a03b59
00020000-562f-9028-1dee-7dcd45ac137b	00030000-562f-9026-1880-01a79f799f6d
00020000-562f-9028-1dee-7dcd45ac137b	00030000-562f-9026-eaa6-de45b964ebc9
00020000-562f-9028-1dee-7dcd45ac137b	00030000-562f-9026-783f-9eb41e0b986a
00020000-562f-9028-1dee-7dcd45ac137b	00030000-562f-9026-f59f-dd760207ce6c
00020000-562f-9028-1dee-7dcd45ac137b	00030000-562f-9026-eac7-5c37369430f9
00020000-562f-9028-1dee-7dcd45ac137b	00030000-562f-9026-d67d-d374938e3f82
00020000-562f-9028-1dee-7dcd45ac137b	00030000-562f-9026-a310-7897e967ec39
00020000-562f-9028-1dee-7dcd45ac137b	00030000-562f-9026-7443-9bd61f6980f5
00020000-562f-9028-1dee-7dcd45ac137b	00030000-562f-9026-1ab7-0b8858ad3e07
00020000-562f-9028-1dee-7dcd45ac137b	00030000-562f-9026-fb39-dbd54b23578a
00020000-562f-9028-1dee-7dcd45ac137b	00030000-562f-9026-4944-186ef2774e62
00020000-562f-9028-1dee-7dcd45ac137b	00030000-562f-9026-da55-fb92d9d1ed3f
00020000-562f-9028-1dee-7dcd45ac137b	00030000-562f-9026-b4c2-eb7f8a7b092d
00020000-562f-9028-1dee-7dcd45ac137b	00030000-562f-9026-c165-cb6f33378850
00020000-562f-9028-1dee-7dcd45ac137b	00030000-562f-9026-fc48-036dceb6b510
00020000-562f-9028-1dee-7dcd45ac137b	00030000-562f-9026-658a-fac9448dd153
00020000-562f-9028-1dee-7dcd45ac137b	00030000-562f-9026-1dc7-80b344cb4caf
00020000-562f-9028-1dee-7dcd45ac137b	00030000-562f-9026-c061-83d507a9b277
00020000-562f-9028-1dee-7dcd45ac137b	00030000-562f-9026-94e3-a1fb8e2d6e1d
00020000-562f-9028-1dee-7dcd45ac137b	00030000-562f-9026-82ae-562f13766c51
00020000-562f-9028-1dee-7dcd45ac137b	00030000-562f-9026-b756-bf04ff246072
00020000-562f-9028-1dee-7dcd45ac137b	00030000-562f-9026-6fdf-5730976f3330
00020000-562f-9028-1dee-7dcd45ac137b	00030000-562f-9026-0c07-5afced48103e
00020000-562f-9028-1dee-7dcd45ac137b	00030000-562f-9026-35f9-7a763881ca27
00020000-562f-9028-1dee-7dcd45ac137b	00030000-562f-9026-6df6-20f2ae0db9db
00020000-562f-9028-1dee-7dcd45ac137b	00030000-562f-9026-fd60-95cba66edd29
00020000-562f-9028-1dee-7dcd45ac137b	00030000-562f-9026-3d64-40e9af7c6d48
00020000-562f-9028-1dee-7dcd45ac137b	00030000-562f-9026-8005-5edd151b42b5
00020000-562f-9028-1dee-7dcd45ac137b	00030000-562f-9026-4c35-dae5054a3825
00020000-562f-9028-1dee-7dcd45ac137b	00030000-562f-9026-de14-4a287b92335a
00020000-562f-9028-1dee-7dcd45ac137b	00030000-562f-9026-fc8b-fea4aa446f76
00020000-562f-9028-1dee-7dcd45ac137b	00030000-562f-9026-79df-b65d78d80332
00020000-562f-9028-1dee-7dcd45ac137b	00030000-562f-9026-d165-de53efa3ac8b
00020000-562f-9028-1dee-7dcd45ac137b	00030000-562f-9026-12cd-27bf9ece8403
00020000-562f-9028-1dee-7dcd45ac137b	00030000-562f-9026-bf81-1c6b8e789ad2
00020000-562f-9028-1dee-7dcd45ac137b	00030000-562f-9026-5c7f-ac788352242a
00020000-562f-9028-1dee-7dcd45ac137b	00030000-562f-9026-c46a-226593917dd1
00020000-562f-9028-1dee-7dcd45ac137b	00030000-562f-9026-be8a-4f1c5dd31e70
00020000-562f-9028-1dee-7dcd45ac137b	00030000-562f-9026-6a23-2fe3ca6ff9ed
00020000-562f-9028-1dee-7dcd45ac137b	00030000-562f-9026-bca4-2d02560b0d2d
00020000-562f-9028-1dee-7dcd45ac137b	00030000-562f-9026-45a9-00dc0fd07458
00020000-562f-9028-1dee-7dcd45ac137b	00030000-562f-9026-1797-42cf6c4d2eaf
00020000-562f-9028-1dee-7dcd45ac137b	00030000-562f-9026-739e-fa90c91c47bb
00020000-562f-9028-1dee-7dcd45ac137b	00030000-562f-9026-dd86-73914650a9f5
00020000-562f-9028-1dee-7dcd45ac137b	00030000-562f-9026-b079-e19388da7d55
00020000-562f-9028-1dee-7dcd45ac137b	00030000-562f-9026-fa72-0f5c6ff266f0
00020000-562f-9028-1dee-7dcd45ac137b	00030000-562f-9026-be56-a3e44a80dd84
00020000-562f-9028-1dee-7dcd45ac137b	00030000-562f-9026-0bae-e59be12bdebc
00020000-562f-9028-1dee-7dcd45ac137b	00030000-562f-9026-bc75-9aeb00e56461
00020000-562f-9028-1dee-7dcd45ac137b	00030000-562f-9026-24e5-1b0e992e738f
00020000-562f-9028-1dee-7dcd45ac137b	00030000-562f-9026-2b15-e190cb04da51
00020000-562f-9028-1dee-7dcd45ac137b	00030000-562f-9026-25fa-d751c167a595
00020000-562f-9028-1dee-7dcd45ac137b	00030000-562f-9026-596a-3cd91b755bcb
00020000-562f-9028-1dee-7dcd45ac137b	00030000-562f-9026-e30d-4ebded8fb740
00020000-562f-9028-1dee-7dcd45ac137b	00030000-562f-9026-c7e4-b8c024cf39f1
00020000-562f-9028-1dee-7dcd45ac137b	00030000-562f-9026-5af4-2f11a566a3d1
00020000-562f-9028-1dee-7dcd45ac137b	00030000-562f-9026-4a6c-e89ddfaf99f0
00020000-562f-9028-1dee-7dcd45ac137b	00030000-562f-9026-27bc-adbdb8794c75
00020000-562f-9028-1dee-7dcd45ac137b	00030000-562f-9026-9d04-4d81442ab5bb
00020000-562f-9028-1dee-7dcd45ac137b	00030000-562f-9026-17b8-fcd8ab0a18ed
00020000-562f-9028-1dee-7dcd45ac137b	00030000-562f-9026-a1d2-b7cd4f459917
00020000-562f-9028-1dee-7dcd45ac137b	00030000-562f-9026-03b3-0ab2fa5165d8
00020000-562f-9028-1dee-7dcd45ac137b	00030000-562f-9026-eb7d-f8b6b044ed7c
00020000-562f-9028-1dee-7dcd45ac137b	00030000-562f-9026-4db8-2083b20e80b1
00020000-562f-9028-1dee-7dcd45ac137b	00030000-562f-9026-843b-85be8c2bc498
00020000-562f-9028-1dee-7dcd45ac137b	00030000-562f-9026-00ec-fce680852f10
00020000-562f-9028-1dee-7dcd45ac137b	00030000-562f-9026-ebbd-e941c8d9b652
00020000-562f-9028-1dee-7dcd45ac137b	00030000-562f-9026-62e8-530a7a20fcee
00020000-562f-9028-1dee-7dcd45ac137b	00030000-562f-9026-46e6-c929f4d36fb8
00020000-562f-9028-1dee-7dcd45ac137b	00030000-562f-9026-65eb-274f98c99526
00020000-562f-9028-1dee-7dcd45ac137b	00030000-562f-9026-bec7-d670a0cd12e4
00020000-562f-9028-1dee-7dcd45ac137b	00030000-562f-9026-c1a7-d42ef1d98706
00020000-562f-9028-1dee-7dcd45ac137b	00030000-562f-9026-6c5b-698611346796
00020000-562f-9028-1dee-7dcd45ac137b	00030000-562f-9026-6d14-044741086abd
00020000-562f-9028-1dee-7dcd45ac137b	00030000-562f-9026-5465-10711e312935
00020000-562f-9028-1dee-7dcd45ac137b	00030000-562f-9026-5924-87fef8bb113d
00020000-562f-9028-1dee-7dcd45ac137b	00030000-562f-9026-4699-d690a5c1b03f
00020000-562f-9028-1dee-7dcd45ac137b	00030000-562f-9026-b66b-fa13f3a99e54
00020000-562f-9028-1dee-7dcd45ac137b	00030000-562f-9026-24a3-13ef4020c170
00020000-562f-9028-1dee-7dcd45ac137b	00030000-562f-9026-fc85-5333e5ecf88f
\.


--
-- TOC entry 3092 (class 0 OID 23545113)
-- Dependencies: 213
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 3096 (class 0 OID 23545147)
-- Dependencies: 217
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 3108 (class 0 OID 23545285)
-- Dependencies: 229
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, zacetek, konec, jeavtorskepravice, placilonavajo, vrednostvaje, planiranostevilovaj, vrednostvaj, vrednostpredstave, procentodinkasa, jeprocentodinkasa, vrednostdopremiere, zaposlenvdrjz, samozaposlen, igralec, opis) FROM stdin;
000b0000-562f-9028-8a53-39df1c9b10ae	00090000-562f-9028-8a20-cac7bb9253a9	\N	\N	0001	\N	\N	f	f	10.00	3	10.00	30.00	0.00	f	10.00	t	f	t	Pogodba o sodelovanju
000b0000-562f-9028-1503-0df68c78f3ee	00090000-562f-9028-f4e1-3affcdfe92dc	\N	\N	0002	\N	\N	f	t	11.00	10	11.00	31.00	0.00	f	110.00	f	t	t	Pogodba za vlogo Helena
000b0000-562f-9028-61a3-88ed2762371d	00090000-562f-9028-8bfe-5408dfee1f21	\N	\N	0003	\N	\N	f	f	12.00	4	12.00	0.00	0.00	f	12.00	f	t	f	Pogodba za lektoriranje
000b0000-562f-9028-0e14-3bbb9e70eda6	00090000-562f-9028-d381-31deece1d765	\N	\N	0004	\N	\N	t	f	0.00	2	300.00	0.00	0.00	f	300.00	f	t	f	Pogodba za avtorske pravice
\.


--
-- TOC entry 3064 (class 0 OID 23544811)
-- Dependencies: 185
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, tipkli_id, drzava_id, sifra, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo, nvo) FROM stdin;
00080000-562f-9028-a304-1748640b404c	\N	00040000-562f-9026-260c-051a90a86cd6	0988	AK	Juhuhu d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-562f-9028-f63f-69356c400f66	\N	00040000-562f-9026-260c-051a90a86cd6	0989	AK	Hopsasa d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	t
00080000-562f-9028-fbd4-e617106847bf	\N	00040000-562f-9026-260c-051a90a86cd6	0987	AK	Gledališče Šrum d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-562f-9028-1ace-9d8a2b52ec2f	\N	00040000-562f-9026-260c-051a90a86cd6	0986	AK	Lutkovni Direndaj d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-562f-9028-e1a7-c1e54c3d18a1	\N	00040000-562f-9026-260c-051a90a86cd6	0985	AK	Tatjana Stanič, Lektoriranje, s.p.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-562f-9028-1bb6-f17aa9855357	\N	00040000-562f-9026-a615-c1e2e7d0f278	0984	AK	Gledališče Lepote tvoje		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-562f-9028-8dca-fdfed61814d2	\N	00040000-562f-9026-6aaa-8581bbd7e78f	0983	AK	Sunce naše		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-562f-9028-7674-849016603691	\N	00040000-562f-9026-e98b-b7b82bc22311	0982	AK	Theater Amadeus		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-562f-9028-ba87-ed35754abbcf	\N	00040000-562f-9026-0b3b-6fe6a55738c2	9999	AK	Fuchs		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-562f-902a-7cd5-95a118f24a6e	\N	00040000-562f-9026-260c-051a90a86cd6	1001	AK	Gledališče Matica		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
\.


--
-- TOC entry 3067 (class 0 OID 23544856)
-- Dependencies: 188
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-562f-9026-e93b-f6200f2e5e48	8341	Adlešiči
00050000-562f-9026-809a-ca3dea9b76fe	5270	Ajdovščina
00050000-562f-9026-a5ca-d151b1ea2782	6280	Ankaran/Ancarano
00050000-562f-9026-c304-267da67ce2ad	9253	Apače
00050000-562f-9026-11a2-96b148cec121	8253	Artiče
00050000-562f-9026-079a-1223bb13ca15	4275	Begunje na Gorenjskem
00050000-562f-9026-ad46-b498d484ad88	1382	Begunje pri Cerknici
00050000-562f-9026-8dc8-de5ff09a4f20	9231	Beltinci
00050000-562f-9026-2d83-159b2cccf184	2234	Benedikt
00050000-562f-9026-7fa0-b64754fd73f0	2345	Bistrica ob Dravi
00050000-562f-9026-dcfe-8509e16a77ca	3256	Bistrica ob Sotli
00050000-562f-9026-e102-d1935dd366c8	8259	Bizeljsko
00050000-562f-9026-a225-28d2db3a4916	1223	Blagovica
00050000-562f-9026-20c7-bd1d31454c0f	8283	Blanca
00050000-562f-9026-9df7-8321fc59e678	4260	Bled
00050000-562f-9026-4dd1-06df27e62f99	4273	Blejska Dobrava
00050000-562f-9026-ab2f-a597b71c5b26	9265	Bodonci
00050000-562f-9026-cc1d-061e6fb6c393	9222	Bogojina
00050000-562f-9026-75f6-107f12f6d84d	4263	Bohinjska Bela
00050000-562f-9026-9121-9b895bfdee57	4264	Bohinjska Bistrica
00050000-562f-9026-65a1-9aa8c8cb5d94	4265	Bohinjsko jezero
00050000-562f-9026-6299-6b4f604b52d5	1353	Borovnica
00050000-562f-9026-4b78-33c30dd821a4	8294	Boštanj
00050000-562f-9026-7649-a0a912660838	5230	Bovec
00050000-562f-9026-2139-f6aa16150be7	5295	Branik
00050000-562f-9026-e88a-a94ac5ce7f0b	3314	Braslovče
00050000-562f-9026-0d47-338d0a8791ab	5223	Breginj
00050000-562f-9026-aa0e-a2071010a182	8280	Brestanica
00050000-562f-9026-766c-e97b831c193e	2354	Bresternica
00050000-562f-9026-2b7b-f7640f4d06a2	4243	Brezje
00050000-562f-9026-79d4-8d3254cd0b7c	1351	Brezovica pri Ljubljani
00050000-562f-9026-b9e2-48be01675f31	8250	Brežice
00050000-562f-9026-4108-d30337e51fbd	4210	Brnik - Aerodrom
00050000-562f-9026-f241-fd21cd479fac	8321	Brusnice
00050000-562f-9026-dcb3-d9244b48d5a1	3255	Buče
00050000-562f-9026-bb74-8558c99e8547	8276	Bučka 
00050000-562f-9026-58e7-461498b05121	9261	Cankova
00050000-562f-9026-6624-d4e8b5d17ee6	3000	Celje 
00050000-562f-9026-3a1f-c3cbd90ff7ed	3001	Celje - poštni predali
00050000-562f-9026-b51d-69a85e7dc279	4207	Cerklje na Gorenjskem
00050000-562f-9026-3b59-265692efb4f5	8263	Cerklje ob Krki
00050000-562f-9026-954b-e08729c6ad8c	1380	Cerknica
00050000-562f-9026-f5a8-4c04b36f0e93	5282	Cerkno
00050000-562f-9026-9bd0-5ed24a987118	2236	Cerkvenjak
00050000-562f-9026-42f9-653731e92efb	2215	Ceršak
00050000-562f-9026-4a80-bd8a17a9ce94	2326	Cirkovce
00050000-562f-9026-b984-c0ccb6776158	2282	Cirkulane
00050000-562f-9026-28ec-6738397c98ca	5273	Col
00050000-562f-9026-42e8-b4b3f2116f6f	8251	Čatež ob Savi
00050000-562f-9026-9095-87df16743739	1413	Čemšenik
00050000-562f-9026-ff52-97c80626c59b	5253	Čepovan
00050000-562f-9026-ddcb-70dc233c76ff	9232	Črenšovci
00050000-562f-9026-d903-d32b29353244	2393	Črna na Koroškem
00050000-562f-9026-4bf3-ef6bf662f45d	6275	Črni Kal
00050000-562f-9026-4e73-b442907692f3	5274	Črni Vrh nad Idrijo
00050000-562f-9026-a1b8-f51084caf073	5262	Črniče
00050000-562f-9026-21cc-93ff72b911a9	8340	Črnomelj
00050000-562f-9026-dfed-f4a2d87a3091	6271	Dekani
00050000-562f-9026-0f03-ab07197a3cab	5210	Deskle
00050000-562f-9026-cfcf-893fcaba2a47	2253	Destrnik
00050000-562f-9026-77b8-f59f6b181af5	6215	Divača
00050000-562f-9026-4e07-0ab14ab52b03	1233	Dob
00050000-562f-9026-a1a3-1f9c1080abd5	3224	Dobje pri Planini
00050000-562f-9026-2374-0f4710f3f95c	8257	Dobova
00050000-562f-9026-c1d8-4b8c0f4c3e39	1423	Dobovec
00050000-562f-9026-29cb-52b0fb86559a	5263	Dobravlje
00050000-562f-9026-3e92-a5bc8ea03bf6	3204	Dobrna
00050000-562f-9026-bf3d-1fc13a05f02e	8211	Dobrnič
00050000-562f-9026-579a-79dc5781ab2d	1356	Dobrova
00050000-562f-9026-4929-f57b73ab17dd	9223	Dobrovnik/Dobronak 
00050000-562f-9026-564b-e92a75a99517	5212	Dobrovo v Brdih
00050000-562f-9026-d4bb-c45ff3c4aeb8	1431	Dol pri Hrastniku
00050000-562f-9026-3594-5c7183d7cb87	1262	Dol pri Ljubljani
00050000-562f-9026-b86c-6dad20e3dc3d	1273	Dole pri Litiji
00050000-562f-9026-fc31-180513e53f74	1331	Dolenja vas
00050000-562f-9026-d4a5-235e40907b78	8350	Dolenjske Toplice
00050000-562f-9026-9c6b-9b18638fc346	1230	Domžale
00050000-562f-9026-ffab-3a05b08281f6	2252	Dornava
00050000-562f-9026-937c-1b071111d979	5294	Dornberk
00050000-562f-9026-77d2-02c6c4a1746f	1319	Draga
00050000-562f-9026-7e48-7fa5f5021379	8343	Dragatuš
00050000-562f-9026-b9e1-d8c59026607c	3222	Dramlje
00050000-562f-9026-7d79-624063ee9a52	2370	Dravograd
00050000-562f-9026-96fa-edd4d616f1cc	4203	Duplje
00050000-562f-9026-5da4-11702b9c72bf	6221	Dutovlje
00050000-562f-9026-2127-cd06efcf7cff	8361	Dvor
00050000-562f-9026-ad0d-2e33247f7d68	2343	Fala
00050000-562f-9026-ce09-b1b9a2189ebb	9208	Fokovci
00050000-562f-9026-a33d-c58888caa160	2313	Fram
00050000-562f-9026-244e-06e5b01aa2b4	3213	Frankolovo
00050000-562f-9026-01c8-dcde2246742f	1274	Gabrovka
00050000-562f-9026-05b9-f4dbbe856172	8254	Globoko
00050000-562f-9026-cba1-4c74eff23880	5275	Godovič
00050000-562f-9026-c2fa-055fd4cc6aef	4204	Golnik
00050000-562f-9026-234f-bfb018f78ead	3303	Gomilsko
00050000-562f-9026-401d-05f0202ae998	4224	Gorenja vas
00050000-562f-9026-ad4a-290f9d425e07	3263	Gorica pri Slivnici
00050000-562f-9026-39fd-6714fcdc4d31	2272	Gorišnica
00050000-562f-9026-b4f1-4efae7f27050	9250	Gornja Radgona
00050000-562f-9026-f0b2-5cac9b844208	3342	Gornji Grad
00050000-562f-9026-7b8c-f4d7b5cd4e7b	4282	Gozd Martuljek
00050000-562f-9026-257d-b6de92ba8d98	6272	Gračišče
00050000-562f-9026-6828-6072aa422afd	9264	Grad
00050000-562f-9026-f434-f226c7c94035	8332	Gradac
00050000-562f-9026-68fa-6ea657807ee7	1384	Grahovo
00050000-562f-9026-1c2f-5d26870a77b5	5242	Grahovo ob Bači
00050000-562f-9026-ac4d-f34c39a26403	5251	Grgar
00050000-562f-9026-e6e0-279e98800d74	3302	Griže
00050000-562f-9026-3bb4-829abea18cb3	3231	Grobelno
00050000-562f-9026-020a-6151483e689f	1290	Grosuplje
00050000-562f-9026-1b6b-d66a0ff113bc	2288	Hajdina
00050000-562f-9026-e4d1-eeea4d020517	8362	Hinje
00050000-562f-9026-092e-802c5dc66ad8	2311	Hoče
00050000-562f-9026-2fac-f3517b57413a	9205	Hodoš/Hodos
00050000-562f-9026-b111-d2062b05290c	1354	Horjul
00050000-562f-9026-d592-a8c262337c37	1372	Hotedršica
00050000-562f-9026-a4c5-cf0160eb2c07	1430	Hrastnik
00050000-562f-9026-7b83-0997d0cadc6d	6225	Hruševje
00050000-562f-9026-c9eb-033c3305a88d	4276	Hrušica
00050000-562f-9026-9ac3-70b040f08b3c	5280	Idrija
00050000-562f-9026-0a69-0ae0f07ac7c5	1292	Ig
00050000-562f-9026-dea3-65aea79caa6b	6250	Ilirska Bistrica
00050000-562f-9026-b6cf-8e8fa7670db6	6251	Ilirska Bistrica-Trnovo
00050000-562f-9026-39c1-54ee38ba4cf5	1295	Ivančna Gorica
00050000-562f-9026-7045-ae5f8a8747cd	2259	Ivanjkovci
00050000-562f-9026-0ba4-753784d21e0f	1411	Izlake
00050000-562f-9026-1013-fcf62f95d708	6310	Izola/Isola
00050000-562f-9026-690f-61e3a9798d73	2222	Jakobski Dol
00050000-562f-9026-1b74-dd0b1a09a11c	2221	Jarenina
00050000-562f-9026-5b5c-f677b6c2db10	6254	Jelšane
00050000-562f-9026-cc84-8aac8d034150	4270	Jesenice
00050000-562f-9026-5f99-9c504ced91dc	8261	Jesenice na Dolenjskem
00050000-562f-9026-96cc-efe1e46bf0ac	3273	Jurklošter
00050000-562f-9026-d23d-9a33f16507e9	2223	Jurovski Dol
00050000-562f-9026-c6aa-d2956798c27d	2256	Juršinci
00050000-562f-9026-8a21-6da510d61e4b	5214	Kal nad Kanalom
00050000-562f-9026-477c-f278afc4d060	3233	Kalobje
00050000-562f-9026-e9d2-9feb67a07fd2	4246	Kamna Gorica
00050000-562f-9026-f082-d4f686a323bf	2351	Kamnica
00050000-562f-9026-b9e0-66e1e6daa912	1241	Kamnik
00050000-562f-9026-f9df-0bd062b55381	5213	Kanal
00050000-562f-9026-7be4-8115739b38e6	8258	Kapele
00050000-562f-9026-3a2c-a0b8db19c439	2362	Kapla
00050000-562f-9026-492c-73f78204e374	2325	Kidričevo
00050000-562f-9026-3c87-36cbdca3507d	1412	Kisovec
00050000-562f-9026-c58e-b63d9d30ba2f	6253	Knežak
00050000-562f-9026-d26b-f9b6eb81f963	5222	Kobarid
00050000-562f-9026-a70d-dc45356fe25b	9227	Kobilje
00050000-562f-9026-73a0-0009840498ad	1330	Kočevje
00050000-562f-9026-db2a-128de4cb9623	1338	Kočevska Reka
00050000-562f-9026-8efd-4725767e883a	2276	Kog
00050000-562f-9026-6b22-e2ba0f556037	5211	Kojsko
00050000-562f-9026-0264-a76426a11774	6223	Komen
00050000-562f-9026-8e66-bc960b1c71e3	1218	Komenda
00050000-562f-9026-595c-56f8f12c6ea7	6000	Koper/Capodistria 
00050000-562f-9026-1d24-3866a68fe579	6001	Koper/Capodistria - poštni predali
00050000-562f-9026-05ae-3552e9c00c22	8282	Koprivnica
00050000-562f-9026-ba9b-8d61613fcf45	5296	Kostanjevica na Krasu
00050000-562f-9026-6c79-c99e30004418	8311	Kostanjevica na Krki
00050000-562f-9026-cdd7-4af1fbad98f8	1336	Kostel
00050000-562f-9026-1591-050623b5e3f3	6256	Košana
00050000-562f-9026-0bc9-0d96130d2060	2394	Kotlje
00050000-562f-9026-950d-e53b815e1992	6240	Kozina
00050000-562f-9026-29d0-8cd0ea82fda8	3260	Kozje
00050000-562f-9026-e2f5-5771bbd924b7	4000	Kranj 
00050000-562f-9026-f7a6-1dfe8709c4e1	4001	Kranj - poštni predali
00050000-562f-9026-679d-e04b615ada01	4280	Kranjska Gora
00050000-562f-9026-f824-2a7e68736150	1281	Kresnice
00050000-562f-9026-2ee0-0a35a784e753	4294	Križe
00050000-562f-9026-61fd-229e4bf5319b	9206	Križevci
00050000-562f-9026-dc95-12f8aec56434	9242	Križevci pri Ljutomeru
00050000-562f-9026-89ae-3f4b8dd72a29	1301	Krka
00050000-562f-9026-05e8-6bbaca8c4a0f	8296	Krmelj
00050000-562f-9026-5347-c92ab389644f	4245	Kropa
00050000-562f-9026-ee26-992aef73fd83	8262	Krška vas
00050000-562f-9026-55c4-da985a77c9aa	8270	Krško
00050000-562f-9026-b268-f2af39435235	9263	Kuzma
00050000-562f-9026-fd7f-b5bcbb2c1e48	2318	Laporje
00050000-562f-9026-0685-113ee8504b56	3270	Laško
00050000-562f-9026-0a7e-53a3692cca99	1219	Laze v Tuhinju
00050000-562f-9026-ef05-3df09cbd3676	2230	Lenart v Slovenskih goricah
00050000-562f-9026-36b0-a12e4d6ee57c	9220	Lendava/Lendva
00050000-562f-9026-2b08-6acd7a4d0886	4248	Lesce
00050000-562f-9026-b4f5-22e8067fc2c7	3261	Lesično
00050000-562f-9026-97eb-a15b11ffad92	8273	Leskovec pri Krškem
00050000-562f-9026-7c52-6e30faa2c278	2372	Libeliče
00050000-562f-9026-a267-eda7ddf80004	2341	Limbuš
00050000-562f-9026-3112-9f295d42e288	1270	Litija
00050000-562f-9026-575f-a33ec2eaed5c	3202	Ljubečna
00050000-562f-9026-bf8e-92cf7b2c8832	1000	Ljubljana 
00050000-562f-9026-a23d-60224ce30b68	1001	Ljubljana - poštni predali
00050000-562f-9026-084d-a74757b4ff8f	1231	Ljubljana - Črnuče
00050000-562f-9026-62e1-876a97763df6	1261	Ljubljana - Dobrunje
00050000-562f-9026-821d-c31d1a1f4b23	1260	Ljubljana - Polje
00050000-562f-9026-53c5-d8f0c4e97d7d	1210	Ljubljana - Šentvid
00050000-562f-9026-cbba-d645c5bbb24a	1211	Ljubljana - Šmartno
00050000-562f-9026-7327-e49bb8239bdd	3333	Ljubno ob Savinji
00050000-562f-9026-9c59-9edbecdc7a01	9240	Ljutomer
00050000-562f-9026-7e2c-3f38420d3e63	3215	Loče
00050000-562f-9026-8a0e-2f2a571b599b	5231	Log pod Mangartom
00050000-562f-9026-072d-389a5c127d38	1358	Log pri Brezovici
00050000-562f-9026-4246-39b5516b0922	1370	Logatec
00050000-562f-9026-903c-72d209258af8	1371	Logatec
00050000-562f-9026-a6b3-7a0f8c2b7958	1434	Loka pri Zidanem Mostu
00050000-562f-9026-1bf7-7cefa3a27ce5	3223	Loka pri Žusmu
00050000-562f-9026-03a9-f0736ced3a9f	6219	Lokev
00050000-562f-9026-415e-deb0e7851502	1318	Loški Potok
00050000-562f-9026-bd6b-6a40545f48c8	2324	Lovrenc na Dravskem polju
00050000-562f-9026-c139-76f3705e03dc	2344	Lovrenc na Pohorju
00050000-562f-9026-bd66-89584dede6cb	3334	Luče
00050000-562f-9026-52d5-0698193d3c1a	1225	Lukovica
00050000-562f-9026-e604-91d96da64a99	9202	Mačkovci
00050000-562f-9026-e732-24b4cc56a694	2322	Majšperk
00050000-562f-9026-ea3e-ba4742953147	2321	Makole
00050000-562f-9026-e107-7c59190d065f	9243	Mala Nedelja
00050000-562f-9026-276c-1e0940b6afad	2229	Malečnik
00050000-562f-9026-25a8-d7dea6597339	6273	Marezige
00050000-562f-9026-0557-608da9a8c728	2000	Maribor 
00050000-562f-9026-9b13-510362812772	2001	Maribor - poštni predali
00050000-562f-9026-8548-de237cdd8b04	2206	Marjeta na Dravskem polju
00050000-562f-9026-bdd2-9aeae94039ce	2281	Markovci
00050000-562f-9026-16f2-81e29ebc44bb	9221	Martjanci
00050000-562f-9026-75be-5084ad391700	6242	Materija
00050000-562f-9026-94b3-9deb79392bdf	4211	Mavčiče
00050000-562f-9026-3b55-1d375144032f	1215	Medvode
00050000-562f-9026-2474-1833ab06b988	1234	Mengeš
00050000-562f-9026-47ff-4038be101668	8330	Metlika
00050000-562f-9026-3992-4c1d99227eee	2392	Mežica
00050000-562f-9026-9ba4-6584d6b685ca	2204	Miklavž na Dravskem polju
00050000-562f-9026-845a-88022e76e755	2275	Miklavž pri Ormožu
00050000-562f-9026-bf15-d00b8201b8ac	5291	Miren
00050000-562f-9026-0a9d-20b978b77c48	8233	Mirna
00050000-562f-9026-2ca0-5ff4bdc6e1fe	8216	Mirna Peč
00050000-562f-9026-d31f-0bdd8b5cd4c6	2382	Mislinja
00050000-562f-9026-a690-abef58b3272d	4281	Mojstrana
00050000-562f-9026-0790-a2958619d4e7	8230	Mokronog
00050000-562f-9026-e445-5ab20512c6e4	1251	Moravče
00050000-562f-9026-5e40-94fe529c2ec9	9226	Moravske Toplice
00050000-562f-9026-b04f-8ac398b26c11	5216	Most na Soči
00050000-562f-9026-3774-f3c7857d3fd8	1221	Motnik
00050000-562f-9026-0630-784efc3ddceb	3330	Mozirje
00050000-562f-9026-52a3-b92da94a5ae0	9000	Murska Sobota 
00050000-562f-9026-f7e1-8c1da562428d	9001	Murska Sobota - poštni predali
00050000-562f-9026-e13b-420bd2d1ca4a	2366	Muta
00050000-562f-9026-3c10-e8261d4d9c68	4202	Naklo
00050000-562f-9026-8b71-9f9521869fc3	3331	Nazarje
00050000-562f-9026-7dc4-052001ff1a57	1357	Notranje Gorice
00050000-562f-9026-ec4b-2bb2a691a8a9	3203	Nova Cerkev
00050000-562f-9026-b713-d58b4b89a104	5000	Nova Gorica 
00050000-562f-9026-2521-ca228b6ce7cf	5001	Nova Gorica - poštni predali
00050000-562f-9026-b160-a55f453cc8ef	1385	Nova vas
00050000-562f-9026-2676-91ae96aa4873	8000	Novo mesto
00050000-562f-9026-eb81-3aa0cb8098e5	8001	Novo mesto - poštni predali
00050000-562f-9026-8f57-799227630961	6243	Obrov
00050000-562f-9026-d498-2c3bbaa3e050	9233	Odranci
00050000-562f-9026-6443-d435e1c1dd3a	2317	Oplotnica
00050000-562f-9026-2c1a-7cba78190b06	2312	Orehova vas
00050000-562f-9026-9b02-c917ada7dbe9	2270	Ormož
00050000-562f-9026-caed-fee5b729c9c2	1316	Ortnek
00050000-562f-9026-87df-7b8fa9ff93c7	1337	Osilnica
00050000-562f-9026-ec78-d8a72428fe7a	8222	Otočec
00050000-562f-9026-8ecf-e7550c89bf1c	2361	Ožbalt
00050000-562f-9026-7976-887a3882693e	2231	Pernica
00050000-562f-9026-9023-8859c0d11c50	2211	Pesnica pri Mariboru
00050000-562f-9026-817e-52a04bcf7bb2	9203	Petrovci
00050000-562f-9026-c18d-db2ef8908c9d	3301	Petrovče
00050000-562f-9026-2d2d-7f52a260a1e4	6330	Piran/Pirano
00050000-562f-9026-64b2-1296ace8c3b8	8255	Pišece
00050000-562f-9026-4cad-28632107d714	6257	Pivka
00050000-562f-9026-acd5-0dc8770269f8	6232	Planina
00050000-562f-9026-4ca8-97d4d24a26d8	3225	Planina pri Sevnici
00050000-562f-9026-ec09-e147af07a2c9	6276	Pobegi
00050000-562f-9026-508b-6f80b96919f4	8312	Podbočje
00050000-562f-9026-aaea-2ef901087451	5243	Podbrdo
00050000-562f-9026-b770-d8d4c02db418	3254	Podčetrtek
00050000-562f-9026-c171-aace2917a3a8	2273	Podgorci
00050000-562f-9026-72ff-18b55cbb9ec5	6216	Podgorje
00050000-562f-9026-829a-d75bcf8ba280	2381	Podgorje pri Slovenj Gradcu
00050000-562f-9026-d3fb-cf08d3b07f6f	6244	Podgrad
00050000-562f-9026-13be-eeff76abde2a	1414	Podkum
00050000-562f-9026-40d5-aa2a6d3ce15b	2286	Podlehnik
00050000-562f-9026-5825-18e146967665	5272	Podnanos
00050000-562f-9026-c8a7-1658ff032c20	4244	Podnart
00050000-562f-9026-90ca-5613ce3bbe5f	3241	Podplat
00050000-562f-9026-b6a6-a627ee88b562	3257	Podsreda
00050000-562f-9026-4fb0-6713983b713d	2363	Podvelka
00050000-562f-9026-3837-2b5e6a40a917	2208	Pohorje
00050000-562f-9026-6036-f060a59768ed	2257	Polenšak
00050000-562f-9026-ca15-d2a3362af445	1355	Polhov Gradec
00050000-562f-9026-96df-2961ab6b82f3	4223	Poljane nad Škofjo Loko
00050000-562f-9026-88b5-8219562c94e1	2319	Poljčane
00050000-562f-9026-641c-99a2dd9b8785	1272	Polšnik
00050000-562f-9026-03f9-246e1b7d24aa	3313	Polzela
00050000-562f-9026-fe07-df5e3712a04e	3232	Ponikva
00050000-562f-9026-8943-e620731d2fcf	6320	Portorož/Portorose
00050000-562f-9026-1386-e960682a2421	6230	Postojna
00050000-562f-9026-77aa-5f50fb736d8f	2331	Pragersko
00050000-562f-9026-87da-d414781ee4dd	3312	Prebold
00050000-562f-9026-1102-2ed70433e526	4205	Preddvor
00050000-562f-9026-96fb-a73e613dd0ae	6255	Prem
00050000-562f-9026-65e4-0687f35f8fb0	1352	Preserje
00050000-562f-9026-e968-6136cbd8d9d9	6258	Prestranek
00050000-562f-9026-be9b-20ad0d400adf	2391	Prevalje
00050000-562f-9026-3991-01b2a9ea5ed3	3262	Prevorje
00050000-562f-9026-42e4-20d97f3a4a34	1276	Primskovo 
00050000-562f-9026-65bd-cc0f0b6557ec	3253	Pristava pri Mestinju
00050000-562f-9026-7e89-cd6b15d92e8d	9207	Prosenjakovci/Partosfalva
00050000-562f-9026-259a-fa75a96d6124	5297	Prvačina
00050000-562f-9026-3d76-fcd43cec5ea2	2250	Ptuj
00050000-562f-9026-56f3-8043dba49677	2323	Ptujska Gora
00050000-562f-9026-5ddd-144ff5d67f31	9201	Puconci
00050000-562f-9026-84ab-b42201afce0a	2327	Rače
00050000-562f-9026-41e1-8679869655b6	1433	Radeče
00050000-562f-9026-d70a-84b54375299b	9252	Radenci
00050000-562f-9026-967e-78ef320aa276	2360	Radlje ob Dravi
00050000-562f-9026-8d0a-74823d652a24	1235	Radomlje
00050000-562f-9026-87fb-820336943756	4240	Radovljica
00050000-562f-9026-2347-756d63da1209	8274	Raka
00050000-562f-9026-2855-9e7544ae4966	1381	Rakek
00050000-562f-9026-dbd9-df3d840ce624	4283	Rateče - Planica
00050000-562f-9026-a571-52bbd266c858	2390	Ravne na Koroškem
00050000-562f-9026-9599-5a9285f5d797	9246	Razkrižje
00050000-562f-9026-2442-564bc50b0a9e	3332	Rečica ob Savinji
00050000-562f-9026-6778-ffa2f624ce31	5292	Renče
00050000-562f-9026-2d1f-1e1e8de82952	1310	Ribnica
00050000-562f-9026-07e3-a3e4c3b2cbed	2364	Ribnica na Pohorju
00050000-562f-9026-8d24-a5c5e684ba4c	3272	Rimske Toplice
00050000-562f-9026-7a7a-2777788bbf26	1314	Rob
00050000-562f-9026-6b9f-b252bd520b04	5215	Ročinj
00050000-562f-9026-1b96-6cc6b5ff2a8a	3250	Rogaška Slatina
00050000-562f-9026-1ce1-9b890d0aa7c2	9262	Rogašovci
00050000-562f-9026-4d20-0c0a2438b625	3252	Rogatec
00050000-562f-9026-544a-c55c7f61d283	1373	Rovte
00050000-562f-9026-34d4-33d7caf0dadc	2342	Ruše
00050000-562f-9026-5d80-07e6408ee630	1282	Sava
00050000-562f-9026-ad1a-879158ff1673	6333	Sečovlje/Sicciole
00050000-562f-9026-7088-19598df73766	4227	Selca
00050000-562f-9026-7d95-05539e9b39a9	2352	Selnica ob Dravi
00050000-562f-9026-c6aa-9c5c52251a44	8333	Semič
00050000-562f-9026-84db-48b9f362ffdd	8281	Senovo
00050000-562f-9026-4743-fa3d23d7d98e	6224	Senožeče
00050000-562f-9026-3338-86dac4e338d2	8290	Sevnica
00050000-562f-9026-f5d0-4a12aa37c035	6210	Sežana
00050000-562f-9026-9e9c-0c08a6896d15	2214	Sladki Vrh
00050000-562f-9026-adae-11f51ca5d0a9	5283	Slap ob Idrijci
00050000-562f-9026-aade-6c2ff05d9831	2380	Slovenj Gradec
00050000-562f-9026-ed68-c21979d8d30a	2310	Slovenska Bistrica
00050000-562f-9026-0d5e-1bffc985f7d8	3210	Slovenske Konjice
00050000-562f-9026-2f9a-02ad6a14afe3	1216	Smlednik
00050000-562f-9026-37ac-eca80b89a4c0	5232	Soča
00050000-562f-9026-16f5-aae9dd7b5cb3	1317	Sodražica
00050000-562f-9026-b31a-78ea3139da52	3335	Solčava
00050000-562f-9026-076f-67d65927c9a3	5250	Solkan
00050000-562f-9026-1ab9-22db5520bf8b	4229	Sorica
00050000-562f-9026-b591-5516ab17f194	4225	Sovodenj
00050000-562f-9026-823c-4d92d911dbea	5281	Spodnja Idrija
00050000-562f-9026-f590-89270ce15904	2241	Spodnji Duplek
00050000-562f-9026-f921-f8c7ede7f7d7	9245	Spodnji Ivanjci
00050000-562f-9026-4cd2-932ee2172434	2277	Središče ob Dravi
00050000-562f-9026-d1d7-4ec04d87b239	4267	Srednja vas v Bohinju
00050000-562f-9026-236a-ee4701175ff4	8256	Sromlje 
00050000-562f-9026-b866-bef7d10b5db3	5224	Srpenica
00050000-562f-9026-d8e6-e64eae19fe1b	1242	Stahovica
00050000-562f-9026-df37-1a2e5f1e1c68	1332	Stara Cerkev
00050000-562f-9026-cafe-88baec083de8	8342	Stari trg ob Kolpi
00050000-562f-9026-9de1-6ca129657741	1386	Stari trg pri Ložu
00050000-562f-9026-1415-f9cf6f88715f	2205	Starše
00050000-562f-9026-b4a2-77ab402722e1	2289	Stoperce
00050000-562f-9026-37cf-80783a162cb5	8322	Stopiče
00050000-562f-9026-8321-c47a7ef70b63	3206	Stranice
00050000-562f-9026-aad3-050b365c024f	8351	Straža
00050000-562f-9026-c652-62c702820eff	1313	Struge
00050000-562f-9026-882e-ab2358e68bc6	8293	Studenec
00050000-562f-9026-4fd2-7960a865b71d	8331	Suhor
00050000-562f-9026-770d-167951615cce	2233	Sv. Ana v Slovenskih goricah
00050000-562f-9026-21d4-d1938708f998	2235	Sv. Trojica v Slovenskih goricah
00050000-562f-9026-d2fc-df8b9b28ac93	2353	Sveti Duh na Ostrem Vrhu
00050000-562f-9026-18fd-1877c1af10f7	9244	Sveti Jurij ob Ščavnici
00050000-562f-9026-97b9-5de0c09eb2da	3264	Sveti Štefan
00050000-562f-9026-5843-0b8c7da75e4e	2258	Sveti Tomaž
00050000-562f-9026-9028-353756974cbe	9204	Šalovci
00050000-562f-9026-2260-fca2137407e2	5261	Šempas
00050000-562f-9026-9a29-46b737a1457b	5290	Šempeter pri Gorici
00050000-562f-9026-45fa-e0f611ef8737	3311	Šempeter v Savinjski dolini
00050000-562f-9026-b260-6d4cf10ac39e	4208	Šenčur
00050000-562f-9026-ec1e-fab3d535d2d1	2212	Šentilj v Slovenskih goricah
00050000-562f-9026-fb84-8908b1d87e65	8297	Šentjanž
00050000-562f-9026-fb12-fe335ce7b321	2373	Šentjanž pri Dravogradu
00050000-562f-9026-6900-abc6d20c7047	8310	Šentjernej
00050000-562f-9026-3e0a-1b96efc075c0	3230	Šentjur
00050000-562f-9026-9a1f-89c84ffaf473	3271	Šentrupert
00050000-562f-9026-b7f6-dd4571874bdf	8232	Šentrupert
00050000-562f-9026-c7e4-1ece3384506d	1296	Šentvid pri Stični
00050000-562f-9026-a4ed-e72816454855	8275	Škocjan
00050000-562f-9026-0da7-6ae4c45b297a	6281	Škofije
00050000-562f-9026-41b0-1b60863f6438	4220	Škofja Loka
00050000-562f-9026-ae11-f3a718210750	3211	Škofja vas
00050000-562f-9026-6a62-de6942f1115a	1291	Škofljica
00050000-562f-9026-0540-a33ebd1e3d53	6274	Šmarje
00050000-562f-9026-b5fb-407cabec4d71	1293	Šmarje - Sap
00050000-562f-9026-b4dc-f6332d763204	3240	Šmarje pri Jelšah
00050000-562f-9026-ebd3-ba5d389fa44c	8220	Šmarješke Toplice
00050000-562f-9026-6310-0311ac245589	2315	Šmartno na Pohorju
00050000-562f-9026-5a10-406f1d739e27	3341	Šmartno ob Dreti
00050000-562f-9026-26b5-a775a2d6d336	3327	Šmartno ob Paki
00050000-562f-9026-e81c-280a483bac6a	1275	Šmartno pri Litiji
00050000-562f-9026-2d58-e9f88b874586	2383	Šmartno pri Slovenj Gradcu
00050000-562f-9026-734e-2861ad54727f	3201	Šmartno v Rožni dolini
00050000-562f-9026-1ea3-fa6a86fd9127	3325	Šoštanj
00050000-562f-9026-acfc-40c7fc25dd1f	6222	Štanjel
00050000-562f-9026-41f5-9f363a5a5255	3220	Štore
00050000-562f-9026-d668-df616bcd33f8	3304	Tabor
00050000-562f-9026-fa1d-0b9b82c3af31	3221	Teharje
00050000-562f-9026-c553-bb930f8c6805	9251	Tišina
00050000-562f-9026-1465-84dcc74274e3	5220	Tolmin
00050000-562f-9026-5996-0eb20a278679	3326	Topolšica
00050000-562f-9026-879c-77f3d4c5dc6d	2371	Trbonje
00050000-562f-9026-ec6c-6e023f287af7	1420	Trbovlje
00050000-562f-9026-64bf-6a6d989e02af	8231	Trebelno 
00050000-562f-9026-d8eb-eeff2e9075f7	8210	Trebnje
00050000-562f-9026-d58e-36ddf2f2fd07	5252	Trnovo pri Gorici
00050000-562f-9026-3e68-a1bee8f06d96	2254	Trnovska vas
00050000-562f-9026-eeca-051f3122aaeb	1222	Trojane
00050000-562f-9026-649c-0f0b0f3d5cde	1236	Trzin
00050000-562f-9026-3350-071a577de0bd	4290	Tržič
00050000-562f-9026-e4f6-a07a0e8ab92d	8295	Tržišče
00050000-562f-9026-beb0-018f2f95340b	1311	Turjak
00050000-562f-9026-f746-beaa2ab4bf26	9224	Turnišče
00050000-562f-9026-4093-544eba5bf973	8323	Uršna sela
00050000-562f-9026-a075-2acf81b2160e	1252	Vače
00050000-562f-9026-e9d2-4b1e693487f9	3320	Velenje 
00050000-562f-9026-3016-0c9425c00ff6	3322	Velenje - poštni predali
00050000-562f-9026-613c-b7d90d9049ec	8212	Velika Loka
00050000-562f-9026-b80f-32f1c9dfb670	2274	Velika Nedelja
00050000-562f-9026-8295-f9794f9bce9e	9225	Velika Polana
00050000-562f-9026-8745-e84ec69e1b60	1315	Velike Lašče
00050000-562f-9026-7f54-50a4d8860cf1	8213	Veliki Gaber
00050000-562f-9026-8cd3-80c339ff809b	9241	Veržej
00050000-562f-9026-ef18-2dfbb7528196	1312	Videm - Dobrepolje
00050000-562f-9026-f627-8ccc4caea9f7	2284	Videm pri Ptuju
00050000-562f-9026-744e-760a0eb1c3cc	8344	Vinica
00050000-562f-9026-06c6-351525e81a8c	5271	Vipava
00050000-562f-9026-12a5-a637676a2a2b	4212	Visoko
00050000-562f-9026-a530-833950fc05c0	1294	Višnja Gora
00050000-562f-9026-46a4-28c7c9eb6ae8	3205	Vitanje
00050000-562f-9026-99b8-fb38af53e3fa	2255	Vitomarci
00050000-562f-9026-d265-0915d010a669	1217	Vodice
00050000-562f-9026-a814-054516bab7f1	3212	Vojnik\t
00050000-562f-9026-b61a-ec818887c230	5293	Volčja Draga
00050000-562f-9026-5638-bc9f53b0a78e	2232	Voličina
00050000-562f-9026-674b-633c0372232e	3305	Vransko
00050000-562f-9026-acad-fd393e0dc978	6217	Vremski Britof
00050000-562f-9026-5d42-b8662562636a	1360	Vrhnika
00050000-562f-9026-6ee4-9885b37b3ce5	2365	Vuhred
00050000-562f-9026-e751-edc48d8e0524	2367	Vuzenica
00050000-562f-9026-a5ec-f49be5a0cde5	8292	Zabukovje 
00050000-562f-9026-4a1f-d6d458ff5b3a	1410	Zagorje ob Savi
00050000-562f-9026-95a5-5030da26248c	1303	Zagradec
00050000-562f-9026-3c17-28a99ec71dc3	2283	Zavrč
00050000-562f-9026-83ec-8844c5072c8f	8272	Zdole 
00050000-562f-9026-864b-cad349d971c9	4201	Zgornja Besnica
00050000-562f-9026-74a4-9e8082ee618d	2242	Zgornja Korena
00050000-562f-9026-f77b-cb44e69c6ef9	2201	Zgornja Kungota
00050000-562f-9026-949f-7ae5aaefaf92	2316	Zgornja Ložnica
00050000-562f-9026-1b45-cc9f22f65931	2314	Zgornja Polskava
00050000-562f-9026-caa4-a2fd7c1cbea6	2213	Zgornja Velka
00050000-562f-9026-036e-f760f9105e74	4247	Zgornje Gorje
00050000-562f-9026-d7f6-ecb4b31e57c4	4206	Zgornje Jezersko
00050000-562f-9026-177f-9d8e440f4e5f	2285	Zgornji Leskovec
00050000-562f-9026-bdeb-86f32366aca8	1432	Zidani Most
00050000-562f-9026-46e3-4dc1ccaebf03	3214	Zreče
00050000-562f-9026-0442-2b0e7ff975cf	4209	Žabnica
00050000-562f-9026-59f9-ca382513ab0c	3310	Žalec
00050000-562f-9026-fd2a-66a95e908209	4228	Železniki
00050000-562f-9026-f9c7-593de42bd50c	2287	Žetale
00050000-562f-9026-6e61-cbcd95a6d1a1	4226	Žiri
00050000-562f-9026-2d44-849ac9e29c00	4274	Žirovnica
00050000-562f-9026-12ad-5e2b5c0e3693	8360	Žužemberk
\.


--
-- TOC entry 3115 (class 0 OID 23545496)
-- Dependencies: 236
-- Data for Name: postavkacdve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkacdve (id, skupina, podskupina, naziv, vrpremiere, vrponovitvepremier, vrponovitveprejsnjih, vrgostovanjazamejstvo, vrfestivali, vrgostovanjaint, vrostalo, programdela_id) FROM stdin;
\.


--
-- TOC entry 3088 (class 0 OID 23545087)
-- Dependencies: 209
-- Data for Name: postavkaracuna; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkaracuna (id, racun_id) FROM stdin;
\.


--
-- TOC entry 3066 (class 0 OID 23544841)
-- Dependencies: 187
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
00060000-562f-9028-27cd-b6f5b0534fd4	00080000-562f-9028-a304-1748640b404c	\N	00040000-562f-9026-260c-051a90a86cd6	Narodni dom	\N	Koroška 15	\N	9231	Beltinci	\N	f	t
00060000-562f-9028-8f8a-93225dae037c	00080000-562f-9028-a304-1748640b404c	\N	00040000-562f-9026-260c-051a90a86cd6	Korotan	\N	Koroška 22	\N	9231	Beltinci	\N	f	f
00060000-562f-9028-2607-b4cf07fd1840	00080000-562f-9028-f63f-69356c400f66	\N	00040000-562f-9026-260c-051a90a86cd6	Rimljan	\N	Rimska ploščad 7	\N	9231	Beltinci	\N	f	t
\.


--
-- TOC entry 3078 (class 0 OID 23544985)
-- Dependencies: 199
-- Data for Name: praznik; Type: TABLE DATA; Schema: public; Owner: -
--

COPY praznik (id, ime, dan, mesec, leto, delaprost) FROM stdin;
00430000-562f-9026-cc9e-533cf1698ec5	novo leto	1	1	\N	t
00430000-562f-9026-0f20-599b4a419700	Prešernov dan, slovenski kulturni praznik	8	2	\N	t
00430000-562f-9026-34b0-214351f84cee	dan upora proti okupatorju	27	4	\N	t
00430000-562f-9026-7531-57e390edce0f	praznik dela	1	5	\N	t
00430000-562f-9026-a4c5-b3e532e74ba5	praznik dela	2	5	\N	t
00430000-562f-9026-f057-9cab0234bc6b	dan Primoža Trubarja	8	6	\N	f
00430000-562f-9026-5aad-d31e84489195	dan državnosti	25	6	\N	t
00430000-562f-9026-971e-4768b32df420	združitev prekmurskih Slovencev z matičnim narodom	17	8	\N	f
00430000-562f-9026-8417-a9b2d48b89c4	vrnitev Primorske k matični domovini	15	9	\N	f
00430000-562f-9026-4a19-34de050641bd	dan suverenosti	25	10	\N	f
00430000-562f-9026-a541-19fd880e46af	dan spomina na mrtve	1	11	\N	t
00430000-562f-9026-ca3b-d0ec17581e0b	dan Rudolfa Maistra	23	11	\N	f
00430000-562f-9026-ab2e-171ac1c41e03	božič	25	12	\N	t
00430000-562f-9026-1574-26d9131993e1	dan samostojnosti in enotnosti	26	12	\N	t
00430000-562f-9026-af50-833d6b9960ad	Marijino vnebovzetje	15	8	\N	t
00430000-562f-9026-2a4e-b10a8dc66483	dan reformacije	31	10	\N	t
00430000-562f-9026-30df-553fe0e9a6c0	velikonočna nedelja	27	3	2016	t
00430000-562f-9026-51c9-8120a443bec2	velikonočna nedelja	16	4	2017	t
00430000-562f-9026-d770-5d7f497b1171	velikonočna nedelja	1	4	2018	t
00430000-562f-9026-94de-98b590abf40c	velikonočna nedelja	21	4	2019	t
00430000-562f-9026-0c43-1377c6af97ce	velikonočna nedelja	12	4	2020	t
00430000-562f-9026-e3af-b5ac9fa58f31	velikonočna nedelja	4	4	2021	t
00430000-562f-9026-e7e3-b64d667e2037	velikonočna nedelja	17	4	2022	t
00430000-562f-9026-5960-ceb2f63d5f9f	velikonočna nedelja	9	4	2023	t
00430000-562f-9026-6004-b5c6916a326d	velikonočna nedelja	31	3	2024	t
00430000-562f-9026-a71c-d3495d110117	velikonočna nedelja	20	4	2025	t
00430000-562f-9026-637e-2010b62b78cf	velikonočna nedelja	5	4	2026	t
00430000-562f-9026-c7fb-428e4d777c53	velikonočna nedelja	28	3	2027	t
00430000-562f-9026-7d09-9f8d39fcd2b3	velikonočna nedelja	16	4	2028	t
00430000-562f-9026-6d1a-dfa950ac061c	velikonočna nedelja	1	4	2029	t
00430000-562f-9026-b500-90d0b31fd85e	velikonočna nedelja	21	4	2030	t
00430000-562f-9026-d646-42cc2f904117	velikonočni ponedeljek	28	3	2016	t
00430000-562f-9026-f34d-c8564fa5d36b	velikonočni ponedeljek	17	4	2017	t
00430000-562f-9026-ebb1-a5209fb9649b	velikonočni ponedeljek	2	4	2018	t
00430000-562f-9026-7eb2-279cf9a8df6e	velikonočni ponedeljek	22	4	2019	t
00430000-562f-9026-5da7-e9983dc6dabb	velikonočni ponedeljek	13	4	2020	t
00430000-562f-9026-ec5b-859af37018ea	velikonočni ponedeljek	5	4	2021	t
00430000-562f-9026-b1d9-6230a42fa39f	velikonočni ponedeljek	18	4	2022	t
00430000-562f-9026-1c4c-53e291dbb56d	velikonočni ponedeljek	10	4	2023	t
00430000-562f-9026-c707-9fb861b7a098	velikonočni ponedeljek	1	4	2024	t
00430000-562f-9026-131b-5e9b4e30640a	velikonočni ponedeljek	21	4	2025	t
00430000-562f-9026-72db-1d9c1be4d428	velikonočni ponedeljek	6	4	2026	t
00430000-562f-9026-eaf3-c36569f380c3	velikonočni ponedeljek	29	3	2027	t
00430000-562f-9026-d7e4-aef254b8c0bd	velikonočni ponedeljek	17	4	2028	t
00430000-562f-9026-2db8-d7f8413c0179	velikonočni ponedeljek	2	4	2029	t
00430000-562f-9026-30bb-54a11174ab3a	velikonočni ponedeljek	22	4	2030	t
00430000-562f-9026-9430-acb697751b4a	binkoštna nedelja - binkošti	15	5	2016	t
00430000-562f-9026-6ef2-196ce2aa9806	binkoštna nedelja - binkošti	4	6	2017	t
00430000-562f-9026-95d4-f6f81079c73e	binkoštna nedelja - binkošti	20	5	2018	t
00430000-562f-9026-3b21-be12602c3983	binkoštna nedelja - binkošti	9	6	2019	t
00430000-562f-9026-9495-426ef36aadc1	binkoštna nedelja - binkošti	31	5	2020	t
00430000-562f-9026-d7ba-6617111ac8cc	binkoštna nedelja - binkošti	23	5	2021	t
00430000-562f-9026-0f25-e201aab3eedf	binkoštna nedelja - binkošti	5	6	2022	t
00430000-562f-9026-3533-ac4ef523cf47	binkoštna nedelja - binkošti	28	5	2023	t
00430000-562f-9026-580f-9281c16fea8d	binkoštna nedelja - binkošti	19	5	2024	t
00430000-562f-9026-4184-0870dda0984c	binkoštna nedelja - binkošti	8	6	2025	t
00430000-562f-9026-e4c3-797351953926	binkoštna nedelja - binkošti	24	5	2026	t
00430000-562f-9026-84e2-6bc63d3eb7da	binkoštna nedelja - binkošti	16	5	2027	t
00430000-562f-9026-9228-529cdc890433	binkoštna nedelja - binkošti	4	6	2028	t
00430000-562f-9026-0e6d-29e36163b17f	binkoštna nedelja - binkošti	20	5	2029	t
00430000-562f-9026-1fd0-0f9786237ace	binkoštna nedelja - binkošti	9	6	2030	t
\.


--
-- TOC entry 3074 (class 0 OID 23544945)
-- Dependencies: 195
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, dezurni_id, zaporedna, zaporednasez, objavljenzacetek, porocilo) FROM stdin;
\.


--
-- TOC entry 3075 (class 0 OID 23544957)
-- Dependencies: 196
-- Data for Name: predstava_abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava_abonma (predstava_id, abonma_id) FROM stdin;
\.


--
-- TOC entry 3090 (class 0 OID 23545099)
-- Dependencies: 211
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 3116 (class 0 OID 23545510)
-- Dependencies: 237
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, koproducent_id, odstotekfinanciranja, delez, maticnikop, kpe, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 3117 (class 0 OID 23545520)
-- Dependencies: 238
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, sifra, status) FROM stdin;
00190000-562f-9028-1832-189dc9ffe384	00080000-562f-9028-fbd4-e617106847bf	0987	AK
00190000-562f-9028-9558-8bc0bf507335	00080000-562f-9028-f63f-69356c400f66	0989	AK
00190000-562f-9028-3671-ed37fe11bfca	00080000-562f-9028-1ace-9d8a2b52ec2f	0986	AK
00190000-562f-9028-ba86-557a3e4927b2	00080000-562f-9028-1bb6-f17aa9855357	0984	AK
00190000-562f-9028-fd62-d8e39eac0866	00080000-562f-9028-8dca-fdfed61814d2	0983	AK
00190000-562f-9028-61ef-773011f624ff	00080000-562f-9028-7674-849016603691	0982	AK
00190000-562f-902a-0ef6-223e403bd94d	00080000-562f-902a-7cd5-95a118f24a6e	1001	AK
\.


--
-- TOC entry 3114 (class 0 OID 23545435)
-- Dependencies: 235
-- Data for Name: programdela; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programdela (id, sifra, naziv, zacetek, konec, zakljuceno, potrjenprogram, stpremier, stpremiervelikih, stpremiermalih, stpremiermalihkopr, stpremiervelikihkopr, stpremiersredkopr, stint, stfest, strazno, stizjem, stponprem, stponprej, stponprejvelikih, stponprejmalih, stponprejmalihkopr, stponprejsredkopr, stponprejvelikihkopr, stgostujo, vrps1, vrps1do, vrps1mat, vrps1gostovsz, stizvnekomerc, stizvprem, stizvpremdoma, stizvpremkopr, stizvponprem, stizvponpremdoma, stizvponpremzamejo, stizvponpremgost, stizvponpremkopr, stizvponpremint, stizvponpremkoprint, stizvponprej, stizvponprejdoma, stizvponprejzamejo, stizvponprejgost, stizvponprejkopr, stizvponprejint, stizvponprejkoprint, stizvgostuj, stizvostalihnek, stizvgostovanjslo, stizvgostovanjzam, stizvgostovanjint, stobisknekom, stobisknekommat, stobisknekomgostslo, stobisknekomgostzam, stobisknekomgostint, stobiskprem, stobiskpremdoma, stobiskpremkopr, stobiskponprem, stobiskponpremdoma, stobiskponpremkopr, stobiskponpremkoprint, stobiskponpremgost, stobiskponpremzamejo, stobiskponpremint, avgobiskprired, avgzaseddvoran, avgcenavstopnice, stprodvstopnic, stkoprodukcij, stkoprodukcijint, stkoprodukcijnvo, stzaposlenih, stzaposigralcev, avgstnastopovigr, sthonorarnihzun, sthonorarnihzunigr, sthonorarnihzunigrtujjz, sthonorarnihzunsamoz, sredstvaint, sredstvaavt, sredstvazaprosenoprem, sredstvazaprosenoponprem, sredstvazaprosenoponprej, sredstvazaprosenogostujo, sredstvazaprosenoint, sredstvazaprosenofest, sredstvazaprosenorazno, sredstvazaprosenoizjem, sredstvadrugijavniprem, sredstvadrugijavniponprem, sredstvadrugijavniponprej, sredstvadrugijavnigostujo, sredstvadrugijavniint, sredstvadrugijavnifest, sredstvadrugijavnirazno, sredstvadrugijavniizjem, sredstvadrugiviriprem, sredstvadrugiviriponprem, sredstvadrugiviriponprej, sredstvadrugivirigostujo, sredstvadrugiviriint, sredstvadrugivirifest, sredstvadrugivirirazno, sredstvadrugiviriizjem, sredstvaavtsamoz) FROM stdin;
00290000-562f-9028-0c67-b8cc65ab187a	0001	Testni program dela	2016-02-01	2017-02-01	f	f	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0.00	0	0	0	0.00	0	0.00	0.00	0	0	0	0.00	0	0.00	0.00	0	0	0	0	0.00	0.00	0.00	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	\N	0	0	0	\N	\N	0.00	0	0	0	0	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00
\.


--
-- TOC entry 3118 (class 0 OID 23545528)
-- Dependencies: 239
-- Data for Name: programskaenotasklopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programskaenotasklopa (id, naslovpe, avtorpe, obsegpe, mesecpe, vrednostpe, obiskdoma, programrazno_id) FROM stdin;
\.


--
-- TOC entry 3094 (class 0 OID 23545128)
-- Dependencies: 215
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, popa_id, naslov_id, sifra, naziv, jeprizorisce, jematicnioder, seplanira, kapaciteta, opis) FROM stdin;
00220000-562f-9028-739f-563950141226	\N	\N	0001	Poskusna 1	f	\N	t	8	Poskusna učilnica v prvem
00220000-562f-9028-78de-eb4966fdc35e	\N	\N	0002	Poskusna 3	f	\N	f	34	Poskusna učilnica v tretjem
00220000-562f-9028-b34c-8e155d4eab80	\N	\N	0003	Kazinska	t	\N	t	84	Kazinska dvorana
00220000-562f-9028-9ae1-d95e9d32c97e	\N	\N	0004	Mali oder	t	\N	t	24	Mali oder 
00220000-562f-9028-a53b-b66dceab6872	\N	\N	0005	Komorni oder	t	\N	t	150	Komorni oder
00220000-562f-9028-7e11-160dda7fe218	\N	\N	0006	Stara dvorana	t	\N	t	96	Stara dvorana ali dvorana Franceta Prešerna
00220000-562f-9028-342d-cdea2f3f13ed	\N	\N	0007	Velika dvorana	t	\N	t	160	Velika, glavna dvorana
\.


--
-- TOC entry 3086 (class 0 OID 23545072)
-- Dependencies: 207
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 3085 (class 0 OID 23545062)
-- Dependencies: 206
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 3107 (class 0 OID 23545274)
-- Dependencies: 228
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta, status) FROM stdin;
\.


--
-- TOC entry 3101 (class 0 OID 23545204)
-- Dependencies: 222
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 3072 (class 0 OID 23544919)
-- Dependencies: 193
-- Data for Name: report; Type: TABLE DATA; Schema: public; Owner: -
--

COPY report (id, job_id, title, filename, transfers, size, format, hash, createdat) FROM stdin;
\.


--
-- TOC entry 3053 (class 0 OID 23544690)
-- Dependencies: 174
-- Data for Name: revizije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY revizije (id, razred, objectid, upor, datum, tip, data) FROM stdin;
1	App\\Entity\\Popa	00080000-562f-902a-7cd5-95a118f24a6e	00010000-562f-9027-b545-352b2f88546c	2015-10-27 15:54:34	INS	a:0:{}
2	App\\Entity\\Option	00000000-562f-902a-4763-8c958bcbcf4f	00010000-562f-9027-b545-352b2f88546c	2015-10-27 15:54:34	INS	a:0:{}
3	ProgramDela\\Entity\\ProdukcijskaHisa	00190000-562f-902a-0ef6-223e403bd94d	00010000-562f-9027-b545-352b2f88546c	2015-10-27 15:54:34	INS	a:0:{}
\.


--
-- TOC entry 3137 (class 0 OID 0)
-- Dependencies: 173
-- Name: revizije_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('revizije_id_seq', 3, true);


--
-- TOC entry 3095 (class 0 OID 23545141)
-- Dependencies: 216
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 3057 (class 0 OID 23544728)
-- Dependencies: 178
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-562f-9026-b9b3-e7ee8219619c	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-562f-9026-969b-bd352cd14023	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-562f-9026-db4e-037e574cb255	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-562f-9026-c152-7be376674ea0	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-562f-9027-60f1-d09cd4385f0b	planer	Planer dogodkov v koledarju	t
00020000-562f-9027-bdc7-90fa06916cc0	kadrovska	Kadrovska služba	t
00020000-562f-9027-57db-ac1429e4ceb0	arhivar	Ažuriranje arhivalij	t
00020000-562f-9027-bb03-5865301e47db	igralec	Igralec	t
00020000-562f-9027-1201-3254f27a0c80	prisotnost	Vnašalec prisotnosti, tudi za tiste izven uprizoritev	t
00020000-562f-9028-1dee-7dcd45ac137b	vsadovoljenja	Vloga z vsemi posameznimi dovoljenji	t
\.


--
-- TOC entry 3055 (class 0 OID 23544712)
-- Dependencies: 176
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-562f-9027-a6d8-ee76d2f6e47d	00020000-562f-9026-db4e-037e574cb255
00010000-562f-9027-b545-352b2f88546c	00020000-562f-9026-db4e-037e574cb255
00010000-562f-9028-62a6-ea7e34d9b197	00020000-562f-9028-1dee-7dcd45ac137b
\.


--
-- TOC entry 3097 (class 0 OID 23545155)
-- Dependencies: 218
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 3089 (class 0 OID 23545093)
-- Dependencies: 210
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 3083 (class 0 OID 23545039)
-- Dependencies: 204
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, sifra, ime, zacetek, konec, aktivna) FROM stdin;
001f0000-562f-9028-0a90-a76fa3030bd8	2015	Sezona 2015	2015-01-01	2015-12-31	t
001f0000-562f-9028-e4c9-51954cf08bb6	2016	Sezona 2016	2016-01-01	2016-12-31	t
001f0000-562f-9028-486e-8ca9ca35c836	2017	Sezona 2017	2017-01-01	2017-12-31	t
\.


--
-- TOC entry 3051 (class 0 OID 23544677)
-- Dependencies: 172
-- Data for Name: stevilcenje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenje (id, sifra, naziv, prefix, suffix, zacetek, dolzina, format, globalno, poletih) FROM stdin;
00230000-562f-9026-00ad-01bee9443782	pri	Privzeto številčenje po letih YYYY-N	\N	\N	1	1	%l-%n	f	t
00230000-562f-9026-0b18-2339654243bb	123	Privzeto številčenje kratkih šifer	\N	\N	100	3	%n	f	f
00230000-562f-9026-7699-26684c6daca8	bcd	Globalno številčenje črtnih kod	\N	\N	1	9	%n	t	f
00230000-562f-9026-695a-3d0f92ff39b2	sif	Številčenje šifrant	\N	\N	1000	4	%n	f	f
00230000-562f-9026-076a-bd89ee3944b4	tmp	Globalno številčenje začasnih številk	tmp	\N	1000	5	%l%n	t	t
\.


--
-- TOC entry 3050 (class 0 OID 23544669)
-- Dependencies: 171
-- Data for Name: stevilcenjekonfig; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjekonfig (id, stevilcenje_id, dok) FROM stdin;
00240000-562f-9026-ab55-f763571a9ccd	00230000-562f-9026-695a-3d0f92ff39b2	popa
00240000-562f-9026-3267-672304b6a9c5	00230000-562f-9026-695a-3d0f92ff39b2	oseba
00240000-562f-9026-29e1-5ecb057e9068	00230000-562f-9026-695a-3d0f92ff39b2	tippopa
00240000-562f-9026-e8be-1b9ede381f4d	00230000-562f-9026-695a-3d0f92ff39b2	organizacijskaenota
00240000-562f-9026-1e31-c442a47225cc	00230000-562f-9026-695a-3d0f92ff39b2	sezona
00240000-562f-9026-c270-9767c49e023b	00230000-562f-9026-695a-3d0f92ff39b2	tipvaje
00240000-562f-9026-2020-eada095d6e58	00230000-562f-9026-0b18-2339654243bb	prostor
00240000-562f-9026-20d8-a9f97dcc87be	00230000-562f-9026-695a-3d0f92ff39b2	besedilo
00240000-562f-9026-08eb-6b0c0bb4c752	00230000-562f-9026-695a-3d0f92ff39b2	uprizoritev
00240000-562f-9026-44c4-a0d701f60536	00230000-562f-9026-695a-3d0f92ff39b2	funkcija
00240000-562f-9026-e213-1bb94659a9ea	00230000-562f-9026-695a-3d0f92ff39b2	tipfunkcije
00240000-562f-9026-56cb-1bb237249981	00230000-562f-9026-695a-3d0f92ff39b2	alternacija
00240000-562f-9026-2d2e-d2f947d54705	00230000-562f-9026-00ad-01bee9443782	pogodba
00240000-562f-9026-b87a-2e887ec1ee8c	00230000-562f-9026-695a-3d0f92ff39b2	zaposlitev
00240000-562f-9026-514e-488af578b7f6	00230000-562f-9026-695a-3d0f92ff39b2	zvrstuprizoritve
00240000-562f-9026-986a-4aa7738f784b	00230000-562f-9026-00ad-01bee9443782	programdela
00240000-562f-9026-ff9b-6e0f81ed429e	00230000-562f-9026-695a-3d0f92ff39b2	zapis
\.


--
-- TOC entry 3049 (class 0 OID 23544664)
-- Dependencies: 170
-- Data for Name: stevilcenjestanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjestanje (id, objid, leto, stevilka) FROM stdin;
cc26d337-5ca2-486f-8d6a-ff38b8fd48e7	00240000-562f-9026-ab55-f763571a9ccd	0	1001
\.


--
-- TOC entry 3103 (class 0 OID 23545221)
-- Dependencies: 224
-- Data for Name: strosekuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY strosekuprizoritve (id, uprizoritev_id, popa_id, naziv, vrednostdo, vrednostna, opis, tipstroska, sort, vrstastroska_id) FROM stdin;
00270000-562f-9028-7b16-07fc6ad38848	000e0000-562f-9028-2bca-23ece238ac24	00080000-562f-9028-a304-1748640b404c	Nabava kostumov	600.50	20.00	Krila in maske	materialni	1	003b0000-562f-9026-cb7e-ddbf3e4e9a0c
00270000-562f-9028-0aa6-fde8b8af31c2	000e0000-562f-9028-2bca-23ece238ac24	00080000-562f-9028-a304-1748640b404c	Zavese	125.70	3.10	Modra in zelena zavesa	materialni	2	003b0000-562f-9026-cb7e-ddbf3e4e9a0c
\.


--
-- TOC entry 3063 (class 0 OID 23544803)
-- Dependencies: 184
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 3084 (class 0 OID 23545049)
-- Dependencies: 205
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja, dezurni, gost) FROM stdin;
001a0000-562f-9029-f3c7-8243f56e9429	00180000-562f-9028-6dfb-85cf0400bb09	000c0000-562f-9028-bcc9-c694eb497f85	00090000-562f-9028-8a20-cac7bb9253a9	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-562f-9029-3f2a-0ba56cb3a7be	00180000-562f-9028-6dfb-85cf0400bb09	000c0000-562f-9028-812d-dff380569f18	00090000-562f-9028-d381-31deece1d765	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-562f-9029-c9d4-1b7c9053d3a8	00180000-562f-9028-6dfb-85cf0400bb09	000c0000-562f-9028-63f1-c8015e82b851	00090000-562f-9028-f459-75f781ca4b5f	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-562f-9029-e5fc-ed0e43ff686f	00180000-562f-9028-6dfb-85cf0400bb09	000c0000-562f-9028-d91a-389b4da8725c	00090000-562f-9028-c937-1ae78f3ef15a	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-562f-9029-d25f-d900de80cd77	00180000-562f-9028-6dfb-85cf0400bb09	000c0000-562f-9028-99bb-5c1b46b1ad0b	00090000-562f-9028-3d4d-db0b158c429c	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-562f-9029-833a-4a83bbec0fba	00180000-562f-9028-73c5-11d02e69c4cb	\N	00090000-562f-9028-3d4d-db0b158c429c	2015-08-01 20:00:00	2015-08-01 23:00:00	\N	\N	2.00	t	f
001a0000-562f-9029-91b8-8b5983df8740	00180000-562f-9028-73c5-11d02e69c4cb	\N	00090000-562f-9028-d381-31deece1d765	2015-08-01 20:00:00	2015-08-01 23:00:00	\N	\N	2.00	f	t
\.


--
-- TOC entry 3106 (class 0 OID 23545262)
-- Dependencies: 227
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, sifra, ime, opis, imezenski, podrocje, sort) FROM stdin;
000f0000-562f-9026-f1d0-e6714a67246a	01	Avtor	Avtorji	Avtorka	umetnik	150
000f0000-562f-9026-c50b-651690790a7e	02	Priredba	Priredba	Priredba	umetnik	160
000f0000-562f-9026-b8e6-0041b7198f51	03	Prevod	Prevod	Prevod	umetnik	20
000f0000-562f-9026-507c-e8bd047e20c8	04	Režija	Režija	Režija	umetnik	30
000f0000-562f-9026-3c56-3db307a64930	05	Dramaturgija	Dramaturgija	Dramaturgija	umetnik	40
000f0000-562f-9026-6f9d-e7643c6437ba	06	Scenografija	Scenografija	Scenografija	umetnik	60
000f0000-562f-9026-b8ca-24b58ba04dad	07	Kostumografija	Kostumografija	Kostumografija	umetnik	70
000f0000-562f-9026-bf35-776ed86f1884	08	Koreografija	Koreografija	Koreografija	umetnik	90
000f0000-562f-9026-c3c6-2df1d4c07292	09	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	umetnik	100
000f0000-562f-9026-4161-b75855289222	10	Oblikovanje maske	Oblikovanje maske	Oblikovanje maske	umetnik	110
000f0000-562f-9026-e169-4a49eefd93ae	11	Lektorstvo	Lektorstvo	Lektorstvo	umetnik	50
000f0000-562f-9026-e56b-df9855f82131	12	Glasbeni soustvarjalec	Glasbeni soustvarjalci	Glasbena soustvarjalka	umetnik	80
000f0000-562f-9026-3eb9-fbd4f6d58a09	13	Intermedijski ustvarjalec	Intermedijski ustvarjalci	Intermedijski ustvarjalka	umetnik	130
000f0000-562f-9026-cf02-0878065018d3	14	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	umetnik	120
000f0000-562f-9026-22f9-85d28b7c1107	15	Vloga	Intermedijski ustvarjalci	Intermedijska ustvarjalka	igralec	10
000f0000-562f-9026-1899-6277c9e60780	16	Produkcija, mentorstvo	Produkcija, mentorstvo	Produkcija, mentorstvo	umetnik	140
000f0000-562f-9026-e0b5-dad77617099f	17	Tehnična in druga podpora	Tehnična in druga podpora	Tehnična in druga podpora	tehnik	180
000f0000-562f-9026-ba9e-1a1bfd06dbeb	18	Inšpicient	Inšpicienti	Inšpicientka	inspicient	170
\.


--
-- TOC entry 3060 (class 0 OID 23544754)
-- Dependencies: 181
-- Data for Name: tippopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tippopa (id, sifra, ime, opis) FROM stdin;
00400000-562f-9028-c250-9b2a17e7b91b	0001	šola	osnovna ali srednja šola
00400000-562f-9028-93bd-fad340c2505a	0002	gledalec	gledalec, ki ima abonma ali podobno
00400000-562f-9028-1e34-be60a6c1487e	0003	sponzor	sponzor dogodkov
\.


--
-- TOC entry 3119 (class 0 OID 23545539)
-- Dependencies: 240
-- Data for Name: tipprogramskeenote; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipprogramskeenote (id, sifra, naziv, koprodukcija, maxfaktor, maxvsi) FROM stdin;
002b0000-562f-9026-9d10-4ee1bfb7c3a6	01	Velika predstava	f	1.00	1.00
002b0000-562f-9026-7d70-59a6154e039b	02	Mala predstava	f	0.50	0.50
002b0000-562f-9026-ab51-b89d4eabfc29	03	Mala koprodukcija	t	0.40	1.00
002b0000-562f-9026-189c-46b704c11650	04	Srednja koprodukcija	t	0.70	2.00
002b0000-562f-9026-b0da-6a0463ed3f35	05	Velika koprodukcija	t	1.00	3.00
\.


--
-- TOC entry 3082 (class 0 OID 23545029)
-- Dependencies: 203
-- Data for Name: tipvaje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipvaje (id, sifra, ime, opis) FROM stdin;
00420000-562f-9026-34cf-be1f7bff12de	0001	prva vaja	prva vaja
00420000-562f-9026-4217-838e8f414e94	0002	tehnična vaja	tehnična vaja
00420000-562f-9026-3415-388b1d9f22d6	0003	lučna vaja	lučna vaja
00420000-562f-9026-3dfe-5a5a4e1449e5	0004	kostumska vaja	kostumska vaja
00420000-562f-9026-4f22-745d09209a76	0005	foto vaja	foto vaja
00420000-562f-9026-afe1-0a82c8b6591b	0006	1. glavna vaja	1. glavna vaja
00420000-562f-9026-0378-56c7e67b6e87	0007	2. glavna vaja	2. glavna vaja
00420000-562f-9026-2640-ffd3f1819cbc	0008	1. generalka	1. generalka
00420000-562f-9026-5415-bbeb7bb0a54d	0009	2. generalka	2. generalka
00420000-562f-9026-3caa-240a0b1ae109	0010	odprta generalka	odprta generalka
00420000-562f-9026-7e25-a6046c4bced4	0011	obnovitvena vaja	obnovitvena vaja
00420000-562f-9026-2b96-5c349da50fd3	0012	pevska vaja	pevska vaja
00420000-562f-9026-93f3-4542619e6956	0013	postavitev scene	postavitev scene (za pripravo vaje)
00420000-562f-9026-cbda-c89ddaf5ec90	0014	postavitev luči	postavitev luči (za pripravo vaje)
\.


--
-- TOC entry 3069 (class 0 OID 23544876)
-- Dependencies: 190
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 3054 (class 0 OID 23544699)
-- Dependencies: 175
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-562f-9027-b545-352b2f88546c	Konzolcni	$2y$05$NS4xMjkyMTcwMzExMjAxROLWHHQpjbbEq36ldY2O7n5NpqdCbq6VG	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-562f-9028-95da-6cf02175801d	testni uporabnik za inšpicienta	$2y$05$NS4xMjkyMTcwMzExMjAxROxkJ1B6xAXex6EZLIwJfWzRJ8DpfecFO	t	\N	\N	\N	ivo@ifigenija.si	\N	\N	\N
00010000-562f-9028-8ba5-528e8843d005	testni uporabnik za Tehničnega vodjo	$2y$05$NS4xMjkyMTcwMzExMjAxROu/kXWR9sP9oamkesKuxXLbxkCb387.G	t	\N	\N	\N	tona@ifigenija.si	\N	\N	\N
00010000-562f-9028-b6ca-b15f553ecdd6	testni uporabnik za igralca	$2y$05$NS4xMjkyMTcwMzExMjAxRO/hLCgClfERRsfCAFYwxNCcFIVjP2982	t	\N	\N	\N	irena@ifigenija.si	\N	\N	\N
00010000-562f-9028-163d-1b20ef0773ef	testni uporabnik vnašalca termina storitev (TerminStoritve-vse)	$2y$05$NS4xMjkyMTcwMzExMjAxROT6.kTHqEq4.wa2SOnf124/N14m9qeP.	t	\N	\N	\N	tatjana@ifigenija.si	\N	\N	\N
00010000-562f-9028-34d2-efd336239e4d	testni uporabnik, ki je inšpicient brez zapisov v TerminStoritve	$2y$05$NS4xMjkyMTcwMzExMjAxROHau47Dtb7CME5.nlWwBVM.nusFP.ra2	t	\N	\N	\N	joze@ifigenija.si	\N	\N	\N
00010000-562f-9028-3a1c-d53bcabb702c	testna uporabnica, ki je planerka	$2y$05$NS4xMjkyMTcwMzExMjAxRO.B/uJO3C7QRNhdX9Q2hTLQsSupj1V1S	t	\N	\N	\N	petra@ifigenija.si	\N	\N	\N
00010000-562f-9028-affe-c430cb7df214	testni uporabnik, ki dobi ifi-all vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROv2d7jqhaV/Mz3EIsKoi7UoFR.SDSMBm	t	\N	\N	\N	ali@ifigenija.si	\N	\N	\N
00010000-562f-9028-f9f5-2fa3b8ddbb22	testni uporabnik, ki dobi ifi-readall vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROYB9g.gnkufr1l/gWK6mkx.ySqrOWnJC	t	\N	\N	\N	berta@ifigenija.si	\N	\N	\N
00010000-562f-9028-cccd-6da13d3a1fcb	testni uporabnik, ki dobi aaa-write dovoljenje	$2y$05$NS4xMjkyMTcwMzExMjAxRORujYObKX.DzpXVYbePkiJkHqg0/Ylya	t	\N	\N	\N	aaron@ifigenija.si	\N	\N	\N
00010000-562f-9028-62a6-ea7e34d9b197	testni uporabnik ki dobi vsa posamezna dovoljenja	$2y$05$NS4xMjkyMTcwMzExMjAxRO2ymwxVXTr7U4Ncdn.bN49E8rLw9Jg0O	t	\N	\N	\N	vesna@ifigenija.si	\N	\N	\N
00010000-562f-9027-a6d8-ee76d2f6e47d	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 3110 (class 0 OID 23545312)
-- Dependencies: 231
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, producent_id, sifra, faza, naslov, podnaslov, delovninaslov, internacionalninaslov, naslovizvirnika, podnaslovizvirnika, datumzacstudija, stevilovaj, planiranostevilovaj, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, krstna, prvaslovenska, kratkinaslov, jekoprodukcija, maticnioder_id) FROM stdin;
000e0000-562f-9028-bebb-89e882798b55	00160000-562f-9028-278d-f7ab8a85e10d	\N	00140000-562f-9026-93d2-521d5fe4f9c6	\N	0001	produkcija	Sen kresne noči		Sanje	\N	\N	\N	2016-02-01	\N	\N	2016-06-01	1	William  Shakespeare - Nebojša  Kavader	f	2				\N	f	\N	\N		\N	00220000-562f-9028-a53b-b66dceab6872
000e0000-562f-9028-2bca-23ece238ac24	00160000-562f-9028-c57d-161b4f9867d4	\N	00140000-562f-9026-f104-c0d72c47cbb9	\N	0002	predprodukcija-ideja	Smoletov vrt			\N	\N	\N	2016-01-01	\N	\N	2016-04-20	2	Berta   Hočevar	f	2				\N	f	\N	\N		\N	00220000-562f-9028-7e11-160dda7fe218
000e0000-562f-9028-7d12-f274ccf02277	\N	\N	00140000-562f-9026-f104-c0d72c47cbb9	00190000-562f-9028-1832-189dc9ffe384	0003	postprodukcija	Kisli maček			\N	\N	\N	2016-02-01	\N	\N	2016-04-20	2	\N	t	2				\N	f	\N	\N		\N	00220000-562f-9028-a53b-b66dceab6872
000e0000-562f-9028-23c7-3afb1a3ff413	\N	\N	00140000-562f-9026-f104-c0d72c47cbb9	00190000-562f-9028-1832-189dc9ffe384	0004	postprodukcija	Vladimir			\N	\N	\N	2017-03-01	\N	\N	2017-04-20	2	\N	t	2				\N	f	\N	\N		\N	00220000-562f-9028-a53b-b66dceab6872
000e0000-562f-9028-a220-da4d5af61145	\N	\N	00140000-562f-9026-f104-c0d72c47cbb9	00190000-562f-9028-1832-189dc9ffe384	0005	postprodukcija	Španska princesa			\N	\N	\N	2017-04-01	\N	\N	2017-05-20	1	\N	f	1				\N	f	\N	\N		\N	00220000-562f-9028-739f-563950141226
000e0000-562f-9028-bb8c-6c02687c6abc	\N	\N	00140000-562f-9026-f104-c0d72c47cbb9	00190000-562f-9028-1832-189dc9ffe384	0006	postprodukcija	Ne vemo datumov			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-562f-9028-739f-563950141226
\.


--
-- TOC entry 3077 (class 0 OID 23544975)
-- Dependencies: 198
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, tipvaje_id, uprizoritev_id, zaporedna, porocilo) FROM stdin;
00200000-562f-9028-0b5e-9984c3ad73bd	\N	000e0000-562f-9028-2bca-23ece238ac24	1	
00200000-562f-9028-3288-6cb76c4228d8	\N	000e0000-562f-9028-2bca-23ece238ac24	2	
00200000-562f-9028-10ed-70a732418022	\N	000e0000-562f-9028-2bca-23ece238ac24	3	
00200000-562f-9028-3646-b1b78f9b6bd9	\N	000e0000-562f-9028-2bca-23ece238ac24	4	
00200000-562f-9028-71fe-425bd84cf29d	\N	000e0000-562f-9028-2bca-23ece238ac24	5	
\.


--
-- TOC entry 3093 (class 0 OID 23545120)
-- Dependencies: 214
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 3104 (class 0 OID 23545235)
-- Dependencies: 225
-- Data for Name: vrstastroska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstastroska (id, skupina, podskupina, naziv, opis) FROM stdin;
003b0000-562f-9026-c4e5-4be8af5530df	1	0	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE
003b0000-562f-9026-68ad-16846ab1d577	1	1	Storitve varovanja zgradb in prostorov	storitve varovanja zgradb in prostorov (npr. gasilci na predstavah)
003b0000-562f-9026-bcbe-b9136b4e0e2b	1	2	Založniške in tiskarske storitve	založniške in tiskarske storitve
003b0000-562f-9026-9a26-0d9fa1deff45	1	3	Časopisi, revije, knjige in strokovna literatura	časopisi, revije, knjige in strokovna literatura
003b0000-562f-9026-24fe-f02121fe4b56	1	4	Stroški prevajalskih storitev	stroški prevajalskih storitev
003b0000-562f-9026-c288-3195960e6aa0	1	5	Stroški oglaševalskih storitev	stroški oglaševalskih storitev
003b0000-562f-9026-2a49-3afdde634f70	1	6	Izdatki za reprezentanco	izdatki za reprezentanco
003b0000-562f-9026-d8a2-1ab7a13fef2e	2	0	POSEBNI MATERIAL IN STORITVE	POSEBNI MATERIAL IN STORITVE
003b0000-562f-9026-cb7e-ddbf3e4e9a0c	2	1	Drugi posebni material in storitve	drugi posebni material in storitve (npr. za instrumete - navedite)
003b0000-562f-9026-ac85-3eb954d09873	2	2	Oprema predstave – stroški rekvizitov	Oprema predstave – stroški rekvizitov
003b0000-562f-9026-d5c0-2644df9ec653	2	3	Oprema predstave – stroški kostumov	Oprema predstave – stroški kostumov
003b0000-562f-9026-4f71-b0970f98a32d	2	4	Oprema predstave – stroški scenske opreme	Oprema predstave – stroški scenske opreme
003b0000-562f-9026-3b27-318120dd49e5	2	5	Oprema predstave – stroški avdio in video opreme	Oprema predstave – stroški avdio in video opreme
003b0000-562f-9026-dff9-9f364d94ae89	3	0	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE
003b0000-562f-9026-42ce-b3f0c8e4de13	3	1	Poštnina in kurirske storitve	poštnina in kurirske storitve
003b0000-562f-9026-aa93-b2fd3cf6be71	4	0	PREVOZNI STROŠKI IN STORITVE	PREVOZNI STROŠKI IN STORITVE
003b0000-562f-9026-b9c3-38eb6ec69862	4	1	Goriva in maziva za prevozna sredstva	goriva in maziva za prevozna sredstva
003b0000-562f-9026-4429-6a0b67d9460b	4	2	Najem vozil in selitveni stroški	najem vozil in selitveni stroški
003b0000-562f-9026-cf18-205ad484508a	4	3	Drugi prevozni in transportni stroški 	drugi prevozni in transportni stroški (navedite)
003b0000-562f-9026-3faa-bd2a84ea2d53	5	0	IZDATKI ZA SLUŽBENA POTOVANJA	IZDATKI ZA SLUŽBENA POTOVANJA
003b0000-562f-9026-110b-92b438972137	5	1	Dnevnice za službena potovanja v državi in tujini	dnevnice za službena potovanja v državi in tujini
003b0000-562f-9026-7866-f6036483e3c9	5	2	Hotelske in restavra. storitve v državi in tujini	hotelske in restavra. storitve v državi in tujini
003b0000-562f-9026-9388-8812262ef019	5	3	Stroški prevoza v državi in tujini	stroški prevoza v državi in tujini
003b0000-562f-9026-fda5-b8ecef137c76	5	4	Drugi izdatki za službena potovanja	drugi izdatki za službena potovanja (navedite)
003b0000-562f-9026-d639-ca0fd4510659	6	0	NAJEMNINE IN ZAKUPNINE	NAJEMNINE IN ZAKUPNINE
003b0000-562f-9026-dfcf-8b75aece85a1	6	1	Druge najemnine, zakupnine in licenčnine	druge najemnine, zakupnine in licenčnine (npr. najem notnega materiala, instrumentov - navedite)
003b0000-562f-9026-2704-64c49cadd3ee	7	0	DRUGI OPERATIVNI ODHODKI	DRUGI OPERATIVNI ODHODKI
003b0000-562f-9026-4265-9b24867ec4ea	7	1	Izdatki za strok. izobraževanje zap.	izdatki za strok. izobraževanje zap.(vezani na program. enote)  
\.


--
-- TOC entry 3122 (class 0 OID 23545586)
-- Dependencies: 243
-- Data for Name: vrstazapisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstazapisa (id, oznaka, naziv, aktiven, znacka, ikona, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3121 (class 0 OID 23545558)
-- Dependencies: 242
-- Data for Name: zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapis (id, vrsta_id, datoteka_id, mapa_id, avtor_id, zaklenil_id, tip, zaklenjen, datumzaklepanja, identifier, subject, title, description, coverage, creator, language, date, publisher, relation, rights, source, upor, datknj, standard, lokacija) FROM stdin;
\.


--
-- TOC entry 3123 (class 0 OID 23545598)
-- Dependencies: 244
-- Data for Name: zapislastnik; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapislastnik (id, zapis_id, lastnik, classlastnika, datum, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3100 (class 0 OID 23545192)
-- Dependencies: 221
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, sifra, status, delovnomesto, zacetek, konec, tip, delovnaobveza, malica, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci, organizacijskaenota_id) FROM stdin;
00100000-562f-9028-661a-3aa2db58a5c2	00090000-562f-9028-d381-31deece1d765	0010	A	Mojster	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-562f-9028-320b-6067b237a0bb	00090000-562f-9028-f459-75f781ca4b5f	0003	A	Igralec	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-562f-9028-1f63-7751731e722b	00090000-562f-9028-bc94-db3a3425620e	0008	A	Natakar	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-562f-9028-657f-d4ef59778953	00090000-562f-9028-b548-e239015782c5	0004	A	Mizar	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-562f-9028-a703-76c62d95ed6c	00090000-562f-9028-2514-94861b5a756e	0009	A	Šivilja	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-562f-9028-09c6-2e9766e69c0d	00090000-562f-9028-981d-ac1e8e43bc62	0007	A	Inšpicient	2010-02-01	\N	1	2		t	f	f	t	\N
\.


--
-- TOC entry 3080 (class 0 OID 23545018)
-- Dependencies: 201
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id, oseba_id) FROM stdin;
\.


--
-- TOC entry 3109 (class 0 OID 23545302)
-- Dependencies: 230
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, sifra, naziv, opis) FROM stdin;
00140000-562f-9026-93d2-521d5fe4f9c6	01	Drama	drama (SURS 01)
00140000-562f-9026-c7a3-69868542f988	02	Opera	opera (SURS 02)
00140000-562f-9026-2050-c741d12df716	03	Balet	balet (SURS 03)
00140000-562f-9026-6340-916bf3a2c9a5	04	Plesne prireditve	plesne prireditve (SURS 04)
00140000-562f-9026-f5f3-96a11e3bfbd3	05	Lutkovno gledališče	lutkovno gledališče (SURS 05)
00140000-562f-9026-f104-c0d72c47cbb9	06	Raziskovalno gledališče	raziskovalno gledališče (SURS 06)
00140000-562f-9026-d7e3-fb44f809a4e6	07	Drugo	drugo (SURS 07)
\.


--
-- TOC entry 3099 (class 0 OID 23545182)
-- Dependencies: 220
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, sifra, naziv, opis) FROM stdin;
\.


--
-- TOC entry 2548 (class 2606 OID 23544753)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2765 (class 2606 OID 23545361)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2761 (class 2606 OID 23545351)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2724 (class 2606 OID 23545218)
-- Name: avtorbesedila_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT avtorbesedila_pkey PRIMARY KEY (id);


--
-- TOC entry 2735 (class 2606 OID 23545260)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2822 (class 2606 OID 23545638)
-- Name: datoteka_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT datoteka_pkey PRIMARY KEY (id);


--
-- TOC entry 2630 (class 2606 OID 23545007)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2645 (class 2606 OID 23545028)
-- Name: dogodeksplosni_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodeksplosni
    ADD CONSTRAINT dogodeksplosni_pkey PRIMARY KEY (id);


--
-- TOC entry 2798 (class 2606 OID 23545556)
-- Name: drugivir_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT drugivir_pkey PRIMARY KEY (id);


--
-- TOC entry 2593 (class 2606 OID 23544902)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2772 (class 2606 OID 23545429)
-- Name: enotaprograma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT enotaprograma_pkey PRIMARY KEY (id);


--
-- TOC entry 2707 (class 2606 OID 23545178)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2621 (class 2606 OID 23544973)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2610 (class 2606 OID 23544940)
-- Name: job_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY job
    ADD CONSTRAINT job_pkey PRIMARY KEY (id);


--
-- TOC entry 2601 (class 2606 OID 23544916)
-- Name: kontaktnaoseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT kontaktnaoseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2671 (class 2606 OID 23545085)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2816 (class 2606 OID 23545615)
-- Name: mapa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT mapa_pkey PRIMARY KEY (id);


--
-- TOC entry 2820 (class 2606 OID 23545622)
-- Name: mapa_zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT mapa_zapis_pkey PRIMARY KEY (mapa_id, zapis_id);


--
-- TOC entry 2827 (class 2606 OID 23545646)
-- Name: mapaacl_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT mapaacl_pkey PRIMARY KEY (id);


--
-- TOC entry 2683 (class 2606 OID 23545112)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2586 (class 2606 OID 23544874)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2556 (class 2606 OID 23544772)
-- Name: optionvalue_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT optionvalue_pkey PRIMARY KEY (id);


--
-- TOC entry 2575 (class 2606 OID 23544836)
-- Name: organizacijskaenota_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT organizacijskaenota_pkey PRIMARY KEY (id);


--
-- TOC entry 2559 (class 2606 OID 23544799)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2546 (class 2606 OID 23544742)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2539 (class 2606 OID 23544727)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2686 (class 2606 OID 23545118)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2700 (class 2606 OID 23545154)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2747 (class 2606 OID 23545297)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2569 (class 2606 OID 23544827)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2583 (class 2606 OID 23544862)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2782 (class 2606 OID 23545508)
-- Name: postavkacdve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkacdve
    ADD CONSTRAINT postavkacdve_pkey PRIMARY KEY (id);


--
-- TOC entry 2675 (class 2606 OID 23545091)
-- Name: postavkaracuna_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT postavkaracuna_pkey PRIMARY KEY (id);


--
-- TOC entry 2581 (class 2606 OID 23544852)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2628 (class 2606 OID 23544992)
-- Name: praznik_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY praznik
    ADD CONSTRAINT praznik_pkey PRIMARY KEY (id);


--
-- TOC entry 2619 (class 2606 OID 23544961)
-- Name: predstava_abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava_abonma
    ADD CONSTRAINT predstava_abonma_pkey PRIMARY KEY (predstava_id, abonma_id);


--
-- TOC entry 2615 (class 2606 OID 23544953)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2681 (class 2606 OID 23545103)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2786 (class 2606 OID 23545517)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2788 (class 2606 OID 23545525)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2779 (class 2606 OID 23545495)
-- Name: programdela_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT programdela_pkey PRIMARY KEY (id);


--
-- TOC entry 2793 (class 2606 OID 23545537)
-- Name: programskaenotasklopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT programskaenotasklopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2693 (class 2606 OID 23545136)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2669 (class 2606 OID 23545076)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2663 (class 2606 OID 23545067)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2742 (class 2606 OID 23545284)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2722 (class 2606 OID 23545211)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2604 (class 2606 OID 23544928)
-- Name: report_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY report
    ADD CONSTRAINT report_pkey PRIMARY KEY (id);


--
-- TOC entry 2531 (class 2606 OID 23544698)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2698 (class 2606 OID 23545145)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2537 (class 2606 OID 23544716)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2541 (class 2606 OID 23544736)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2705 (class 2606 OID 23545163)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2677 (class 2606 OID 23545098)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2651 (class 2606 OID 23545047)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2528 (class 2606 OID 23544686)
-- Name: stevilcenje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenje
    ADD CONSTRAINT stevilcenje_pkey PRIMARY KEY (id);


--
-- TOC entry 2525 (class 2606 OID 23544674)
-- Name: stevilcenjekonfig_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT stevilcenjekonfig_pkey PRIMARY KEY (id);


--
-- TOC entry 2522 (class 2606 OID 23544668)
-- Name: stevilcenjestanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjestanje
    ADD CONSTRAINT stevilcenjestanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2731 (class 2606 OID 23545231)
-- Name: strosekuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT strosekuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2565 (class 2606 OID 23544808)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2657 (class 2606 OID 23545058)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2738 (class 2606 OID 23545271)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2550 (class 2606 OID 23544761)
-- Name: tippopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tippopa
    ADD CONSTRAINT tippopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2795 (class 2606 OID 23545549)
-- Name: tipprogramskeenote_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipprogramskeenote
    ADD CONSTRAINT tipprogramskeenote_pkey PRIMARY KEY (id);


--
-- TOC entry 2647 (class 2606 OID 23545036)
-- Name: tipvaje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipvaje
    ADD CONSTRAINT tipvaje_pkey PRIMARY KEY (id);


--
-- TOC entry 2591 (class 2606 OID 23544887)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2533 (class 2606 OID 23544711)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2759 (class 2606 OID 23545330)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2626 (class 2606 OID 23544982)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2689 (class 2606 OID 23545126)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2733 (class 2606 OID 23545243)
-- Name: vrstastroska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstastroska
    ADD CONSTRAINT vrstastroska_pkey PRIMARY KEY (id);


--
-- TOC entry 2809 (class 2606 OID 23545596)
-- Name: vrstazapisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstazapisa
    ADD CONSTRAINT vrstazapisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2806 (class 2606 OID 23545580)
-- Name: zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT zapis_pkey PRIMARY KEY (id);


--
-- TOC entry 2812 (class 2606 OID 23545604)
-- Name: zapislastnik_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT zapislastnik_pkey PRIMARY KEY (id);


--
-- TOC entry 2718 (class 2606 OID 23545200)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2643 (class 2606 OID 23545022)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2751 (class 2606 OID 23545310)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2713 (class 2606 OID 23545190)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2631 (class 1259 OID 23545016)
-- Name: dogodki_konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_konec ON dogodek USING btree (konec);


--
-- TOC entry 2632 (class 1259 OID 23545017)
-- Name: dogodki_razred; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_razred ON dogodek USING btree (razred);


--
-- TOC entry 2633 (class 1259 OID 23545015)
-- Name: dogodki_zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2634 (class 1259 OID 23545014)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2635 (class 1259 OID 23545013)
-- Name: idx_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2727 (class 1259 OID 23545232)
-- Name: idx_11ffe6e05c75296c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e05c75296c ON strosekuprizoritve USING btree (vrstastroska_id);


--
-- TOC entry 2728 (class 1259 OID 23545233)
-- Name: idx_11ffe6e062b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e062b4ffca ON strosekuprizoritve USING btree (uprizoritev_id);


--
-- TOC entry 2729 (class 1259 OID 23545234)
-- Name: idx_11ffe6e06beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e06beede51 ON strosekuprizoritve USING btree (popa_id);


--
-- TOC entry 2813 (class 1259 OID 23545617)
-- Name: idx_14a5d6d3727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d3727aca70 ON mapa USING btree (parent_id);


--
-- TOC entry 2814 (class 1259 OID 23545616)
-- Name: idx_14a5d6d38a4a6c12; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d38a4a6c12 ON mapa USING btree (lastnik_id);


--
-- TOC entry 2566 (class 1259 OID 23544829)
-- Name: idx_1c7adba589552cb2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba589552cb2 ON popa USING btree (tipkli_id);


--
-- TOC entry 2567 (class 1259 OID 23544830)
-- Name: idx_1c7adba5ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba5ee4b985a ON popa USING btree (drzava_id);


--
-- TOC entry 2684 (class 1259 OID 23545119)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2800 (class 1259 OID 23545584)
-- Name: idx_1ed92829253c4123; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829253c4123 ON zapis USING btree (avtor_id);


--
-- TOC entry 2801 (class 1259 OID 23545583)
-- Name: idx_1ed9282957ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282957ed422f ON zapis USING btree (mapa_id);


--
-- TOC entry 2802 (class 1259 OID 23545585)
-- Name: idx_1ed9282987ff3295; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282987ff3295 ON zapis USING btree (zaklenil_id);


--
-- TOC entry 2803 (class 1259 OID 23545582)
-- Name: idx_1ed92829a54dbb1f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829a54dbb1f ON zapis USING btree (datoteka_id);


--
-- TOC entry 2804 (class 1259 OID 23545581)
-- Name: idx_1ed92829ef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829ef943358 ON zapis USING btree (vrsta_id);


--
-- TOC entry 2678 (class 1259 OID 23545105)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2679 (class 1259 OID 23545104)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2623 (class 1259 OID 23544983)
-- Name: idx_2390fc964ad2a6ea; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc964ad2a6ea ON vaja USING btree (tipvaje_id);


--
-- TOC entry 2624 (class 1259 OID 23544984)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2708 (class 1259 OID 23545179)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2709 (class 1259 OID 23545181)
-- Name: idx_23aeb9586b361365; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9586b361365 ON funkcija USING btree (tipfunkcije_id);


--
-- TOC entry 2710 (class 1259 OID 23545180)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2598 (class 1259 OID 23544918)
-- Name: idx_2942b10710389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b10710389148 ON kontaktnaoseba USING btree (oseba_id);


--
-- TOC entry 2599 (class 1259 OID 23544917)
-- Name: idx_2942b1076beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b1076beede51 ON kontaktnaoseba USING btree (popa_id);


--
-- TOC entry 2791 (class 1259 OID 23545538)
-- Name: idx_2d901816d6bc69d6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2d901816d6bc69d6 ON programskaenotasklopa USING btree (programrazno_id);


--
-- TOC entry 2743 (class 1259 OID 23545299)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2744 (class 1259 OID 23545300)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2745 (class 1259 OID 23545301)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2810 (class 1259 OID 23545605)
-- Name: idx_2eaff9dcaf91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2eaff9dcaf91ecd ON zapislastnik USING btree (zapis_id);


--
-- TOC entry 2752 (class 1259 OID 23545335)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2753 (class 1259 OID 23545332)
-- Name: idx_344a77a7c3b0d59; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a7c3b0d59 ON uprizoritev USING btree (maticnioder_id);


--
-- TOC entry 2754 (class 1259 OID 23545336)
-- Name: idx_344a77a853a965c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a853a965c ON uprizoritev USING btree (producent_id);


--
-- TOC entry 2755 (class 1259 OID 23545334)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2756 (class 1259 OID 23545333)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2588 (class 1259 OID 23544889)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2589 (class 1259 OID 23544888)
-- Name: idx_37f6541a6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a6beede51 ON trr USING btree (popa_id);


--
-- TOC entry 2557 (class 1259 OID 23544802)
-- Name: idx_466966d769e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_466966d769e8d4 ON oseba USING btree (naslov_id);


--
-- TOC entry 2696 (class 1259 OID 23545146)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2543 (class 1259 OID 23544743)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2544 (class 1259 OID 23544744)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2701 (class 1259 OID 23545166)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2702 (class 1259 OID 23545165)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2703 (class 1259 OID 23545164)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2571 (class 1259 OID 23544839)
-- Name: idx_5e2fdc29289ed596; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29289ed596 ON organizacijskaenota USING btree (vodja_id);


--
-- TOC entry 2572 (class 1259 OID 23544838)
-- Name: idx_5e2fdc29727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29727aca70 ON organizacijskaenota USING btree (parent_id);


--
-- TOC entry 2573 (class 1259 OID 23544840)
-- Name: idx_5e2fdc29f0020ed7; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29f0020ed7 ON organizacijskaenota USING btree (namestnik_id);


--
-- TOC entry 2611 (class 1259 OID 23544956)
-- Name: idx_602f6e461174bb0e; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e461174bb0e ON predstava USING btree (dezurni_id);


--
-- TOC entry 2612 (class 1259 OID 23544954)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2613 (class 1259 OID 23544955)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2523 (class 1259 OID 23544676)
-- Name: idx_6054e804ff55f926; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_6054e804ff55f926 ON stevilcenjekonfig USING btree (stevilcenje_id);


--
-- TOC entry 2658 (class 1259 OID 23545071)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2659 (class 1259 OID 23545069)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2660 (class 1259 OID 23545068)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2661 (class 1259 OID 23545070)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2534 (class 1259 OID 23544717)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2535 (class 1259 OID 23544718)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2687 (class 1259 OID 23545127)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2823 (class 1259 OID 23545639)
-- Name: idx_781826c67e3c61f9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_781826c67e3c61f9 ON datoteka USING btree (owner_id);


--
-- TOC entry 2725 (class 1259 OID 23545220)
-- Name: idx_7ab77b7910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7ab77b7910389148 ON avtorbesedila USING btree (oseba_id);


--
-- TOC entry 2726 (class 1259 OID 23545219)
-- Name: idx_7ab77b79f35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7ab77b79f35157b1 ON avtorbesedila USING btree (besedilo_id);


--
-- TOC entry 2824 (class 1259 OID 23545647)
-- Name: idx_7adc957157ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc957157ed422f ON mapaacl USING btree (mapa_id);


--
-- TOC entry 2825 (class 1259 OID 23545648)
-- Name: idx_7adc9571fa6311ef; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc9571fa6311ef ON mapaacl USING btree (perm_id);


--
-- TOC entry 2673 (class 1259 OID 23545092)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2719 (class 1259 OID 23545212)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2720 (class 1259 OID 23545213)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2773 (class 1259 OID 23545434)
-- Name: idx_8787a0e54ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e54ae1cd1c ON enotaprograma USING btree (gostitelj_id);


--
-- TOC entry 2774 (class 1259 OID 23545433)
-- Name: idx_8787a0e55d0da56c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e55d0da56c ON enotaprograma USING btree (drzavagostovanja_id);


--
-- TOC entry 2775 (class 1259 OID 23545430)
-- Name: idx_8787a0e562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e562b4ffca ON enotaprograma USING btree (uprizoritev_id);


--
-- TOC entry 2776 (class 1259 OID 23545431)
-- Name: idx_8787a0e57222d84b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e57222d84b ON enotaprograma USING btree (tipprogramskeenote_id);


--
-- TOC entry 2777 (class 1259 OID 23545432)
-- Name: idx_8787a0e5771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e5771ec7bd ON enotaprograma USING btree (program_dela_id);


--
-- TOC entry 2577 (class 1259 OID 23544854)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2578 (class 1259 OID 23544853)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2579 (class 1259 OID 23544855)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2690 (class 1259 OID 23545140)
-- Name: idx_952dd21969e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd21969e8d4 ON prostor USING btree (naslov_id);


--
-- TOC entry 2691 (class 1259 OID 23545139)
-- Name: idx_952dd2196beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd2196beede51 ON prostor USING btree (popa_id);


--
-- TOC entry 2783 (class 1259 OID 23545518)
-- Name: idx_97af082e38c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e38c06eb ON produkcijadelitev USING btree (enotaprograma_id);


--
-- TOC entry 2784 (class 1259 OID 23545519)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2766 (class 1259 OID 23545365)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2767 (class 1259 OID 23545366)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2768 (class 1259 OID 23545363)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2769 (class 1259 OID 23545364)
-- Name: idx_a4b7244fa4976613; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fa4976613 ON alternacija USING btree (zaposlitev_id);


--
-- TOC entry 2714 (class 1259 OID 23545202)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2715 (class 1259 OID 23545203)
-- Name: idx_b24490415f1e9d88; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b24490415f1e9d88 ON zaposlitev USING btree (organizacijskaenota_id);


--
-- TOC entry 2664 (class 1259 OID 23545080)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2665 (class 1259 OID 23545079)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2666 (class 1259 OID 23545077)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2667 (class 1259 OID 23545078)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2762 (class 1259 OID 23545353)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2763 (class 1259 OID 23545352)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2602 (class 1259 OID 23544929)
-- Name: idx_c38372b2be04ea9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c38372b2be04ea9 ON report USING btree (job_id);


--
-- TOC entry 2605 (class 1259 OID 23544943)
-- Name: idx_c395a6181bb9e62c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a6181bb9e62c ON job USING btree (datum);


--
-- TOC entry 2606 (class 1259 OID 23544942)
-- Name: idx_c395a618941027cc; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618941027cc ON job USING btree (casizvedbe);


--
-- TOC entry 2607 (class 1259 OID 23544941)
-- Name: idx_c395a618a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618a76ed395 ON job USING btree (user_id);


--
-- TOC entry 2608 (class 1259 OID 23544944)
-- Name: idx_c395a618aecf5af0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618aecf5af0 ON job USING btree (izveden);


--
-- TOC entry 2622 (class 1259 OID 23544974)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2616 (class 1259 OID 23544962)
-- Name: idx_d9ece16b5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_d9ece16b5ac894aa ON predstava_abonma USING btree (predstava_id);


--
-- TOC entry 2617 (class 1259 OID 23544963)
-- Name: idx_d9ece16bbe74b11; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_d9ece16bbe74b11 ON predstava_abonma USING btree (abonma_id);


--
-- TOC entry 2780 (class 1259 OID 23545509)
-- Name: idx_dba42fe79e3adf2c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_dba42fe79e3adf2c ON postavkacdve USING btree (programdela_id);


--
-- TOC entry 2799 (class 1259 OID 23545557)
-- Name: idx_e7d4cf2638c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e7d4cf2638c06eb ON drugivir USING btree (enotaprograma_id);


--
-- TOC entry 2817 (class 1259 OID 23545623)
-- Name: idx_e9f8ee8257ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee8257ed422f ON mapa_zapis USING btree (mapa_id);


--
-- TOC entry 2818 (class 1259 OID 23545624)
-- Name: idx_e9f8ee82af91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee82af91ecd ON mapa_zapis USING btree (zapis_id);


--
-- TOC entry 2553 (class 1259 OID 23544774)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2554 (class 1259 OID 23544773)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2562 (class 1259 OID 23544809)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2563 (class 1259 OID 23544810)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2641 (class 1259 OID 23545023)
-- Name: idx_f44a386d10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_f44a386d10389148 ON zasedenost USING btree (oseba_id);


--
-- TOC entry 2653 (class 1259 OID 23545061)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2654 (class 1259 OID 23545060)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2655 (class 1259 OID 23545059)
-- Name: idx_fef7d84ba81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84ba81ccef6 ON terminstoritve USING btree (dogodek_id);


--
-- TOC entry 2636 (class 1259 OID 23545009)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2637 (class 1259 OID 23545010)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2638 (class 1259 OID 23545008)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2639 (class 1259 OID 23545012)
-- Name: uniq_11e93b5dbbc7a989; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dbbc7a989 ON dogodek USING btree (dogodek_splosni_id);


--
-- TOC entry 2640 (class 1259 OID 23545011)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2570 (class 1259 OID 23544828)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2551 (class 1259 OID 23544762)
-- Name: uniq_1d30700559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1d30700559828a3 ON tippopa USING btree (sifra);


--
-- TOC entry 2552 (class 1259 OID 23544763)
-- Name: uniq_1d3070055cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1d3070055cca980 ON tippopa USING btree (ime);


--
-- TOC entry 2594 (class 1259 OID 23544903)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2595 (class 1259 OID 23544905)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2596 (class 1259 OID 23544904)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2597 (class 1259 OID 23544906)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2672 (class 1259 OID 23545086)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2748 (class 1259 OID 23545298)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2757 (class 1259 OID 23545331)
-- Name: uniq_344a77a559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_344a77a559828a3 ON uprizoritev USING btree (sifra);


--
-- TOC entry 2739 (class 1259 OID 23545272)
-- Name: uniq_3f50510d559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d559828a3 ON tipfunkcije USING btree (sifra);


--
-- TOC entry 2740 (class 1259 OID 23545273)
-- Name: uniq_3f50510d55cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d55cca980 ON tipfunkcije USING btree (ime);


--
-- TOC entry 2560 (class 1259 OID 23544800)
-- Name: uniq_466966d7559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7559828a3 ON oseba USING btree (sifra);


--
-- TOC entry 2561 (class 1259 OID 23544801)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2711 (class 1259 OID 23545191)
-- Name: uniq_5216fcb0559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5216fcb0559828a3 ON zvrstuprizoritve USING btree (sifra);


--
-- TOC entry 2529 (class 1259 OID 23544687)
-- Name: uniq_5a434fbc559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5a434fbc559828a3 ON stevilcenje USING btree (sifra);


--
-- TOC entry 2587 (class 1259 OID 23544875)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2576 (class 1259 OID 23544837)
-- Name: uniq_5e2fdc29559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5e2fdc29559828a3 ON organizacijskaenota USING btree (sifra);


--
-- TOC entry 2526 (class 1259 OID 23544675)
-- Name: uniq_6054e804889a7556; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_6054e804889a7556 ON stevilcenjekonfig USING btree (dok);


--
-- TOC entry 2796 (class 1259 OID 23545550)
-- Name: uniq_7d834df4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_7d834df4559828a3 ON tipprogramskeenote USING btree (sifra);


--
-- TOC entry 2694 (class 1259 OID 23545138)
-- Name: uniq_952dd21937854736; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21937854736 ON prostor USING btree (naziv);


--
-- TOC entry 2695 (class 1259 OID 23545137)
-- Name: uniq_952dd219559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd219559828a3 ON prostor USING btree (sifra);


--
-- TOC entry 2648 (class 1259 OID 23545037)
-- Name: uniq_99664b14559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_99664b14559828a3 ON tipvaje USING btree (sifra);


--
-- TOC entry 2649 (class 1259 OID 23545038)
-- Name: uniq_99664b1455cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_99664b1455cca980 ON tipvaje USING btree (ime);


--
-- TOC entry 2770 (class 1259 OID 23545362)
-- Name: uniq_a4b7244f559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a4b7244f559828a3 ON alternacija USING btree (sifra);


--
-- TOC entry 2716 (class 1259 OID 23545201)
-- Name: uniq_b2449041559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_b2449041559828a3 ON zaposlitev USING btree (sifra);


--
-- TOC entry 2584 (class 1259 OID 23544863)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2749 (class 1259 OID 23545311)
-- Name: uniq_cede8e36559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_cede8e36559828a3 ON zvrstsurs USING btree (sifra);


--
-- TOC entry 2807 (class 1259 OID 23545597)
-- Name: uniq_de1c8aa1d55226c7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_de1c8aa1d55226c7 ON vrstazapisa USING btree (oznaka);


--
-- TOC entry 2789 (class 1259 OID 23545526)
-- Name: uniq_e6fc2028559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc2028559828a3 ON produkcijskahisa USING btree (sifra);


--
-- TOC entry 2790 (class 1259 OID 23545527)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2736 (class 1259 OID 23545261)
-- Name: uniq_ec773670ca2e5fcb; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ec773670ca2e5fcb ON besedilo USING btree (stevilka);


--
-- TOC entry 2652 (class 1259 OID 23545048)
-- Name: uniq_ecc8f8c5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ecc8f8c5559828a3 ON sezona USING btree (sifra);


--
-- TOC entry 2542 (class 1259 OID 23544737)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2866 (class 2606 OID 23545819)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2865 (class 2606 OID 23545824)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2861 (class 2606 OID 23545844)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2867 (class 2606 OID 23545814)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2863 (class 2606 OID 23545834)
-- Name: fk_11e93b5dbbc7a989; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dbbc7a989 FOREIGN KEY (dogodek_splosni_id) REFERENCES dogodeksplosni(id);


--
-- TOC entry 2862 (class 2606 OID 23545839)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2864 (class 2606 OID 23545829)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2903 (class 2606 OID 23546014)
-- Name: fk_11ffe6e05c75296c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e05c75296c FOREIGN KEY (vrstastroska_id) REFERENCES vrstastroska(id);


--
-- TOC entry 2902 (class 2606 OID 23546019)
-- Name: fk_11ffe6e062b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e062b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2901 (class 2606 OID 23546024)
-- Name: fk_11ffe6e06beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e06beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2935 (class 2606 OID 23546189)
-- Name: fk_14a5d6d3727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d3727aca70 FOREIGN KEY (parent_id) REFERENCES mapa(id);


--
-- TOC entry 2936 (class 2606 OID 23546184)
-- Name: fk_14a5d6d38a4a6c12; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d38a4a6c12 FOREIGN KEY (lastnik_id) REFERENCES uporabniki(id);


--
-- TOC entry 2840 (class 2606 OID 23545704)
-- Name: fk_1c7adba589552cb2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba589552cb2 FOREIGN KEY (tipkli_id) REFERENCES tippopa(id);


--
-- TOC entry 2839 (class 2606 OID 23545709)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2884 (class 2606 OID 23545929)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2930 (class 2606 OID 23546169)
-- Name: fk_1ed92829253c4123; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829253c4123 FOREIGN KEY (avtor_id) REFERENCES uporabniki(id);


--
-- TOC entry 2931 (class 2606 OID 23546164)
-- Name: fk_1ed9282957ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282957ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2929 (class 2606 OID 23546174)
-- Name: fk_1ed9282987ff3295; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282987ff3295 FOREIGN KEY (zaklenil_id) REFERENCES uporabniki(id);


--
-- TOC entry 2932 (class 2606 OID 23546159)
-- Name: fk_1ed92829a54dbb1f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829a54dbb1f FOREIGN KEY (datoteka_id) REFERENCES datoteka(id);


--
-- TOC entry 2933 (class 2606 OID 23546154)
-- Name: fk_1ed92829ef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829ef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstazapisa(id);


--
-- TOC entry 2882 (class 2606 OID 23545924)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2883 (class 2606 OID 23545919)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2860 (class 2606 OID 23545804)
-- Name: fk_2390fc964ad2a6ea; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc964ad2a6ea FOREIGN KEY (tipvaje_id) REFERENCES tipvaje(id);


--
-- TOC entry 2859 (class 2606 OID 23545809)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2894 (class 2606 OID 23545969)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2892 (class 2606 OID 23545979)
-- Name: fk_23aeb9586b361365; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9586b361365 FOREIGN KEY (tipfunkcije_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2893 (class 2606 OID 23545974)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2849 (class 2606 OID 23545759)
-- Name: fk_2942b10710389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b10710389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2850 (class 2606 OID 23545754)
-- Name: fk_2942b1076beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b1076beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2880 (class 2606 OID 23545909)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2927 (class 2606 OID 23546144)
-- Name: fk_2d901816d6bc69d6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT fk_2d901816d6bc69d6 FOREIGN KEY (programrazno_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2906 (class 2606 OID 23546029)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2905 (class 2606 OID 23546034)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2904 (class 2606 OID 23546039)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 2934 (class 2606 OID 23546179)
-- Name: fk_2eaff9dcaf91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT fk_2eaff9dcaf91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id);


--
-- TOC entry 2908 (class 2606 OID 23546059)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2911 (class 2606 OID 23546044)
-- Name: fk_344a77a7c3b0d59; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a7c3b0d59 FOREIGN KEY (maticnioder_id) REFERENCES prostor(id);


--
-- TOC entry 2907 (class 2606 OID 23546064)
-- Name: fk_344a77a853a965c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a853a965c FOREIGN KEY (producent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2909 (class 2606 OID 23546054)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2910 (class 2606 OID 23546049)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2847 (class 2606 OID 23545749)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2848 (class 2606 OID 23545744)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2835 (class 2606 OID 23545689)
-- Name: fk_466966d769e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d769e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2836 (class 2606 OID 23545684)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2888 (class 2606 OID 23545949)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2832 (class 2606 OID 23545664)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2831 (class 2606 OID 23545669)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2889 (class 2606 OID 23545964)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2890 (class 2606 OID 23545959)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2891 (class 2606 OID 23545954)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2842 (class 2606 OID 23545719)
-- Name: fk_5e2fdc29289ed596; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29289ed596 FOREIGN KEY (vodja_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2843 (class 2606 OID 23545714)
-- Name: fk_5e2fdc29727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29727aca70 FOREIGN KEY (parent_id) REFERENCES organizacijskaenota(id);


--
-- TOC entry 2841 (class 2606 OID 23545724)
-- Name: fk_5e2fdc29f0020ed7; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29f0020ed7 FOREIGN KEY (namestnik_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2853 (class 2606 OID 23545784)
-- Name: fk_602f6e461174bb0e; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e461174bb0e FOREIGN KEY (dezurni_id) REFERENCES oseba(id);


--
-- TOC entry 2855 (class 2606 OID 23545774)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2854 (class 2606 OID 23545779)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2828 (class 2606 OID 23545649)
-- Name: fk_6054e804ff55f926; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT fk_6054e804ff55f926 FOREIGN KEY (stevilcenje_id) REFERENCES stevilcenje(id);


--
-- TOC entry 2872 (class 2606 OID 23545884)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2874 (class 2606 OID 23545874)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2875 (class 2606 OID 23545869)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2873 (class 2606 OID 23545879)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2830 (class 2606 OID 23545654)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2829 (class 2606 OID 23545659)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2885 (class 2606 OID 23545934)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2939 (class 2606 OID 23546204)
-- Name: fk_781826c67e3c61f9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT fk_781826c67e3c61f9 FOREIGN KEY (owner_id) REFERENCES uporabniki(id);


--
-- TOC entry 2899 (class 2606 OID 23546009)
-- Name: fk_7ab77b7910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT fk_7ab77b7910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2900 (class 2606 OID 23546004)
-- Name: fk_7ab77b79f35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT fk_7ab77b79f35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2941 (class 2606 OID 23546209)
-- Name: fk_7adc957157ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc957157ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2940 (class 2606 OID 23546214)
-- Name: fk_7adc9571fa6311ef; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc9571fa6311ef FOREIGN KEY (perm_id) REFERENCES permission(id);


--
-- TOC entry 2881 (class 2606 OID 23545914)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2898 (class 2606 OID 23545994)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2897 (class 2606 OID 23545999)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2918 (class 2606 OID 23546119)
-- Name: fk_8787a0e54ae1cd1c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e54ae1cd1c FOREIGN KEY (gostitelj_id) REFERENCES popa(id);


--
-- TOC entry 2919 (class 2606 OID 23546114)
-- Name: fk_8787a0e55d0da56c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e55d0da56c FOREIGN KEY (drzavagostovanja_id) REFERENCES drza(id);


--
-- TOC entry 2922 (class 2606 OID 23546099)
-- Name: fk_8787a0e562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2921 (class 2606 OID 23546104)
-- Name: fk_8787a0e57222d84b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e57222d84b FOREIGN KEY (tipprogramskeenote_id) REFERENCES tipprogramskeenote(id);


--
-- TOC entry 2920 (class 2606 OID 23546109)
-- Name: fk_8787a0e5771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e5771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2845 (class 2606 OID 23545734)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2846 (class 2606 OID 23545729)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2844 (class 2606 OID 23545739)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2886 (class 2606 OID 23545944)
-- Name: fk_952dd21969e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd21969e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2887 (class 2606 OID 23545939)
-- Name: fk_952dd2196beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd2196beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2925 (class 2606 OID 23546129)
-- Name: fk_97af082e38c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e38c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2924 (class 2606 OID 23546134)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2915 (class 2606 OID 23546089)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2914 (class 2606 OID 23546094)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2917 (class 2606 OID 23546079)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 2916 (class 2606 OID 23546084)
-- Name: fk_a4b7244fa4976613; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fa4976613 FOREIGN KEY (zaposlitev_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2896 (class 2606 OID 23545984)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2895 (class 2606 OID 23545989)
-- Name: fk_b24490415f1e9d88; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b24490415f1e9d88 FOREIGN KEY (organizacijskaenota_id) REFERENCES organizacijskaenota(id);


--
-- TOC entry 2876 (class 2606 OID 23545904)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2877 (class 2606 OID 23545899)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2879 (class 2606 OID 23545889)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2878 (class 2606 OID 23545894)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2912 (class 2606 OID 23546074)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2913 (class 2606 OID 23546069)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2851 (class 2606 OID 23545764)
-- Name: fk_c38372b2be04ea9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY report
    ADD CONSTRAINT fk_c38372b2be04ea9 FOREIGN KEY (job_id) REFERENCES job(id);


--
-- TOC entry 2852 (class 2606 OID 23545769)
-- Name: fk_c395a618a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY job
    ADD CONSTRAINT fk_c395a618a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2858 (class 2606 OID 23545799)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2857 (class 2606 OID 23545789)
-- Name: fk_d9ece16b5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava_abonma
    ADD CONSTRAINT fk_d9ece16b5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id) ON DELETE CASCADE;


--
-- TOC entry 2856 (class 2606 OID 23545794)
-- Name: fk_d9ece16bbe74b11; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava_abonma
    ADD CONSTRAINT fk_d9ece16bbe74b11 FOREIGN KEY (abonma_id) REFERENCES abonma(id) ON DELETE CASCADE;


--
-- TOC entry 2923 (class 2606 OID 23546124)
-- Name: fk_dba42fe79e3adf2c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkacdve
    ADD CONSTRAINT fk_dba42fe79e3adf2c FOREIGN KEY (programdela_id) REFERENCES programdela(id);


--
-- TOC entry 2926 (class 2606 OID 23546139)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2928 (class 2606 OID 23546149)
-- Name: fk_e7d4cf2638c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT fk_e7d4cf2638c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2938 (class 2606 OID 23546194)
-- Name: fk_e9f8ee8257ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee8257ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id) ON DELETE CASCADE;


--
-- TOC entry 2937 (class 2606 OID 23546199)
-- Name: fk_e9f8ee82af91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee82af91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id) ON DELETE CASCADE;


--
-- TOC entry 2833 (class 2606 OID 23545679)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2834 (class 2606 OID 23545674)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2838 (class 2606 OID 23545694)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2837 (class 2606 OID 23545699)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2868 (class 2606 OID 23545849)
-- Name: fk_f44a386d10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT fk_f44a386d10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2869 (class 2606 OID 23545864)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2870 (class 2606 OID 23545859)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2871 (class 2606 OID 23545854)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- Completed on 2015-10-27 15:54:35 CET

--
-- PostgreSQL database dump complete
--

