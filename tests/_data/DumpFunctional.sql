--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.10
-- Dumped by pg_dump version 9.3.10
-- Started on 2015-10-28 17:20:50 CET

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- TOC entry 250 (class 3079 OID 11789)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 3140 (class 0 OID 0)
-- Dependencies: 250
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_with_oids = false;

--
-- TOC entry 181 (class 1259 OID 23925717)
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
-- TOC entry 234 (class 1259 OID 23926325)
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
-- TOC entry 233 (class 1259 OID 23926308)
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
-- TOC entry 224 (class 1259 OID 23926185)
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
-- TOC entry 227 (class 1259 OID 23926215)
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
-- TOC entry 248 (class 1259 OID 23926596)
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
-- TOC entry 201 (class 1259 OID 23925965)
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
-- TOC entry 203 (class 1259 OID 23925996)
-- Name: dogodeksplosni; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodeksplosni (
    id uuid NOT NULL
);


--
-- TOC entry 242 (class 1259 OID 23926522)
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
-- TOC entry 192 (class 1259 OID 23925862)
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
-- TOC entry 235 (class 1259 OID 23926338)
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
-- TOC entry 220 (class 1259 OID 23926139)
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
-- TOC entry 198 (class 1259 OID 23925936)
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
-- TOC entry 195 (class 1259 OID 23925902)
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
-- TOC entry 3141 (class 0 OID 0)
-- Dependencies: 195
-- Name: COLUMN job.data; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN job.data IS '(DC2Type:object)';


--
-- TOC entry 193 (class 1259 OID 23925879)
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
-- TOC entry 209 (class 1259 OID 23926053)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 246 (class 1259 OID 23926577)
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
-- TOC entry 247 (class 1259 OID 23926589)
-- Name: mapa_zapis; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE mapa_zapis (
    mapa_id uuid NOT NULL,
    zapis_id uuid NOT NULL
);


--
-- TOC entry 249 (class 1259 OID 23926611)
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
-- TOC entry 170 (class 1259 OID 23562333)
-- Name: migrations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE migrations (
    version character varying(255) NOT NULL
);


--
-- TOC entry 213 (class 1259 OID 23926078)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 190 (class 1259 OID 23925836)
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
-- TOC entry 183 (class 1259 OID 23925736)
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
-- TOC entry 187 (class 1259 OID 23925803)
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
-- TOC entry 184 (class 1259 OID 23925747)
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
-- TOC entry 178 (class 1259 OID 23925691)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 180 (class 1259 OID 23925710)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 214 (class 1259 OID 23926085)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 218 (class 1259 OID 23926119)
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
-- TOC entry 230 (class 1259 OID 23926256)
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
-- TOC entry 186 (class 1259 OID 23925783)
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
-- TOC entry 189 (class 1259 OID 23925828)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 237 (class 1259 OID 23926467)
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
-- TOC entry 210 (class 1259 OID 23926059)
-- Name: postavkaracuna; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE postavkaracuna (
    id uuid NOT NULL,
    racun_id uuid
);


--
-- TOC entry 188 (class 1259 OID 23925813)
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
-- TOC entry 200 (class 1259 OID 23925957)
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
-- TOC entry 196 (class 1259 OID 23925917)
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
-- TOC entry 197 (class 1259 OID 23925929)
-- Name: predstava_abonma; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE predstava_abonma (
    predstava_id uuid NOT NULL,
    abonma_id uuid NOT NULL
);


--
-- TOC entry 212 (class 1259 OID 23926071)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 238 (class 1259 OID 23926481)
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
-- TOC entry 239 (class 1259 OID 23926491)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    sifra character varying(4) NOT NULL,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 236 (class 1259 OID 23926406)
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
-- TOC entry 240 (class 1259 OID 23926499)
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
-- TOC entry 216 (class 1259 OID 23926100)
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
-- TOC entry 208 (class 1259 OID 23926044)
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
-- TOC entry 207 (class 1259 OID 23926034)
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
-- TOC entry 229 (class 1259 OID 23926245)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying,
    status character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 223 (class 1259 OID 23926175)
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
-- TOC entry 194 (class 1259 OID 23925891)
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
-- TOC entry 175 (class 1259 OID 23925662)
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
-- TOC entry 174 (class 1259 OID 23925660)
-- Name: revizije_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE revizije_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3142 (class 0 OID 0)
-- Dependencies: 174
-- Name: revizije_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE revizije_id_seq OWNED BY revizije.id;


--
-- TOC entry 217 (class 1259 OID 23926113)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 179 (class 1259 OID 23925700)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 177 (class 1259 OID 23925684)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 219 (class 1259 OID 23926127)
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
-- TOC entry 211 (class 1259 OID 23926065)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 205 (class 1259 OID 23926011)
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
-- TOC entry 173 (class 1259 OID 23925649)
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
-- TOC entry 172 (class 1259 OID 23925641)
-- Name: stevilcenjekonfig; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjekonfig (
    id uuid NOT NULL,
    stevilcenje_id uuid,
    dok character varying(100) DEFAULT NULL::character varying
);


--
-- TOC entry 171 (class 1259 OID 23925636)
-- Name: stevilcenjestanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjestanje (
    id uuid NOT NULL,
    objid uuid NOT NULL,
    leto integer NOT NULL,
    stevilka integer
);


--
-- TOC entry 225 (class 1259 OID 23926192)
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
-- TOC entry 185 (class 1259 OID 23925775)
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
-- TOC entry 206 (class 1259 OID 23926021)
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
-- TOC entry 228 (class 1259 OID 23926233)
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
-- TOC entry 182 (class 1259 OID 23925726)
-- Name: tippopa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tippopa (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    ime character varying(255) NOT NULL,
    opis text
);


--
-- TOC entry 241 (class 1259 OID 23926510)
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
-- TOC entry 204 (class 1259 OID 23926001)
-- Name: tipvaje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tipvaje (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    ime character varying(255) NOT NULL,
    opis text
);


--
-- TOC entry 191 (class 1259 OID 23925848)
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
-- TOC entry 176 (class 1259 OID 23925671)
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
-- TOC entry 232 (class 1259 OID 23926283)
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
-- TOC entry 199 (class 1259 OID 23925947)
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
-- TOC entry 215 (class 1259 OID 23926092)
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
-- TOC entry 226 (class 1259 OID 23926206)
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
-- TOC entry 244 (class 1259 OID 23926557)
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
-- TOC entry 243 (class 1259 OID 23926529)
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
-- TOC entry 245 (class 1259 OID 23926569)
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
-- TOC entry 222 (class 1259 OID 23926164)
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
-- TOC entry 202 (class 1259 OID 23925990)
-- Name: zasedenost; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zasedenost (
    id uuid NOT NULL,
    oseba_id uuid
);


--
-- TOC entry 231 (class 1259 OID 23926273)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 221 (class 1259 OID 23926154)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 2224 (class 2604 OID 23925665)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 3065 (class 0 OID 23925717)
-- Dependencies: 181
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
000a0000-5630-f5df-cf11-b7585caac5ab	10	30	Otroci	Abonma za otroke	200
000a0000-5630-f5df-f7d6-462f32d85092	20	60	Mladina	Abonma za mladino	400
000a0000-5630-f5df-7a96-6ea03fb166f2	15	50	Odrasli	Abonma za odrasle	300
\.


--
-- TOC entry 3118 (class 0 OID 23926325)
-- Dependencies: 234
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, zaposlitev_id, oseba_id, pogodba_id, sifra, zaposlen, zacetek, konec, opomba, sort, privzeti, aktivna, imapogodbo, pomembna) FROM stdin;
000c0000-5630-f5df-17e4-01498fc9e7a8	000d0000-5630-f5df-38c7-86e42bf59e25	\N	00090000-5630-f5df-31a4-547194cba85c	000b0000-5630-f5df-30e0-ed4dcf6e80f1	0001	f	\N	\N	\N	3	t	\N	t	t
000c0000-5630-f5df-194d-8f427d320652	000d0000-5630-f5df-d36e-19d5bbecdbf2	00100000-5630-f5df-f575-b6bcb56cc8f9	00090000-5630-f5df-ebff-d3ae3fe5fb21	\N	0002	t	2016-01-01	\N	\N	8	t	\N	f	f
000c0000-5630-f5df-5409-b26a4cb5c633	000d0000-5630-f5df-287f-5d75e42edf2e	00100000-5630-f5df-ba3f-1e9891e17dae	00090000-5630-f5df-88d6-bd1f2bbdde6a	\N	0003	t	\N	2015-10-28	\N	2	t	\N	f	f
000c0000-5630-f5df-45fb-04b4142d0e54	000d0000-5630-f5df-fae6-762a6cbab650	\N	00090000-5630-f5df-4e48-e924395941f4	\N	0004	f	2016-01-01	2016-01-01	\N	26	t	\N	f	f
000c0000-5630-f5df-b3e0-f21c9213e04e	000d0000-5630-f5df-a2f6-ca90ade87665	\N	00090000-5630-f5df-1e48-4d5f928ba006	\N	0005	f	2016-01-01	2016-01-01	\N	7	t	\N	f	f
000c0000-5630-f5df-be5c-e8858ce3b74d	000d0000-5630-f5df-151a-1e3363e9e468	\N	00090000-5630-f5df-509f-30a0ca58bf12	000b0000-5630-f5df-a04f-038267ffc29f	0006	f	2016-01-01	2016-01-01	\N	1	t	\N	t	t
000c0000-5630-f5df-ac69-cb8e4732935d	000d0000-5630-f5df-357e-ce04f08bd42b	00100000-5630-f5df-359d-334f581b011e	00090000-5630-f5df-d46e-6ef8568fce93	\N	0007	t	2016-01-01	2016-01-01	\N	14	f	\N	f	t
000c0000-5630-f5df-e75c-4496d15d1619	000d0000-5630-f5df-271b-f3807175b81f	\N	00090000-5630-f5df-9d0d-9a62dfb549c7	000b0000-5630-f5df-6178-1382c2222826	0008	f	2016-01-01	2016-01-01	\N	12	t	\N	t	t
000c0000-5630-f5df-5529-73751f4ea7c5	000d0000-5630-f5df-357e-ce04f08bd42b	00100000-5630-f5df-c7b4-90b67aafe593	00090000-5630-f5df-585b-58a79a8447a9	\N	0009	t	2017-01-01	2017-01-01	\N	15	t	\N	f	t
000c0000-5630-f5df-cd15-209f23697a19	000d0000-5630-f5df-357e-ce04f08bd42b	00100000-5630-f5df-456e-7e8dce483241	00090000-5630-f5df-d88c-c05d4d772331	\N	0010	t	\N	2015-10-28	\N	16	f	\N	f	t
000c0000-5630-f5df-3443-c22b93839781	000d0000-5630-f5df-357e-ce04f08bd42b	00100000-5630-f5df-f9b9-d5007c936c78	00090000-5630-f5df-fb23-be1c62cdbf7b	\N	0011	t	2017-01-01	\N	\N	17	f	\N	f	t
000c0000-5630-f5df-aa5b-1b62f186a5be	000d0000-5630-f5df-f775-4d85cb6095d6	00100000-5630-f5df-f575-b6bcb56cc8f9	00090000-5630-f5df-ebff-d3ae3fe5fb21	000b0000-5630-f5df-507a-92d770a5524a	0012	t	\N	\N	\N	2	t	\N	t	t
\.


--
-- TOC entry 3117 (class 0 OID 23926308)
-- Dependencies: 233
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 3108 (class 0 OID 23926185)
-- Dependencies: 224
-- Data for Name: avtorbesedila; Type: TABLE DATA; Schema: public; Owner: -
--

COPY avtorbesedila (id, besedilo_id, oseba_id, tipavtorja, zaporedna, alivnaslovu) FROM stdin;
003d0000-5630-f5df-83ab-e2a62a2b51bd	00160000-5630-f5df-92a3-84c38f21e4d5	00090000-5630-f5df-96a8-f4af4d2126b1	aizv	10	t
003d0000-5630-f5df-a6e6-b0561703a7ab	00160000-5630-f5df-92a3-84c38f21e4d5	00090000-5630-f5df-e7f6-1ad3aa1a944c	apri	14	t
003d0000-5630-f5df-fed3-e5fea1dc6cad	00160000-5630-f5df-4857-5ed86d9bf924	00090000-5630-f5df-62cf-8ee662f4ffd6	aizv	11	t
003d0000-5630-f5df-747a-bc2decb40480	00160000-5630-f5df-ce71-3f6abdecc381	00090000-5630-f5df-474d-44a9d7ea65a6	aizv	12	t
003d0000-5630-f5df-50d0-2680b7a4c3d6	00160000-5630-f5df-92a3-84c38f21e4d5	00090000-5630-f5df-8367-20c677ee9edb	apri	18	f
\.


--
-- TOC entry 3111 (class 0 OID 23926215)
-- Dependencies: 227
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, stevilka, naslov, podnaslov, jezik, naslovizvirnika, podnaslovizvirnika, internacionalninaslov, datumprejema, moskevloge, zenskevloge, povzetekvsebine, letoizida, krajizida, zaloznik, avtor) FROM stdin;
00160000-5630-f5df-92a3-84c38f21e4d5	0001	Sen kresne noči		slovenščina	A Midsummer Night's Dream	\N	\N	2015-04-26	5	5	Nastopajo Titanija, Hipolita, Oberon, ...	\N	\N	\N	William  Shakespeare - Nebojša  Kavader
00160000-5630-f5df-4857-5ed86d9bf924	0002	Bratje Karamazovi		slovenščina	Bratja Karamazjovji	\N	\N	2015-12-04	4	1	Svetovna uspešnica	\N	\N	\N	Fjodor Mihajlovič Dostojevski
00160000-5630-f5df-ce71-3f6abdecc381	0003	Smoletov Vrt		slovenščina		\N	\N	2015-05-26	2	8		\N	\N	\N	Berta   Hočevar
\.


--
-- TOC entry 3132 (class 0 OID 23926596)
-- Dependencies: 248
-- Data for Name: datoteka; Type: TABLE DATA; Schema: public; Owner: -
--

COPY datoteka (id, owner_id, filename, transfers, size, format, hash, createdat, uploadedat, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3085 (class 0 OID 23925965)
-- Dependencies: 201
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_splosni_id, prostor_id, sezona_id, allday, zacetek, konec, status, razred, termin, title) FROM stdin;
00180000-5630-f5df-26ff-542eb1d85241	\N	\N	00200000-5630-f5df-1c8c-7f333890ab7a	\N	\N	\N	\N	f	2015-06-26 10:00:00	2015-06-26 12:00:00	200s	200s		dogodek 1
00180000-5630-f5df-1236-44c654a0ffc6	\N	\N	00200000-5630-f5df-fcec-c9b86775a619	\N	\N	\N	\N	f	2015-06-27 10:00:00	2015-06-27 12:00:00	300s	200s		dogodek 2
00180000-5630-f5df-816d-d5dfa37ad2b6	\N	\N	00200000-5630-f5df-9ff8-d042546d1270	\N	\N	\N	\N	f	2015-08-01 20:00:00	2015-08-01 23:00:00	400s	200s		dogodek 3
00180000-5630-f5df-c4f8-360f00bd84c6	\N	\N	00200000-5630-f5df-1b93-349519ad2873	\N	\N	\N	\N	f	2015-08-01 20:00:00	2015-08-01 23:00:00	100s	200s		dogodek 4
00180000-5630-f5df-1612-10497e25a8b6	\N	\N	00200000-5630-f5df-33fa-1e284e3db089	\N	\N	\N	\N	f	2015-08-01 20:00:00	2015-08-01 23:00:00	500s	200s		dogodek 5
\.


--
-- TOC entry 3087 (class 0 OID 23925996)
-- Dependencies: 203
-- Data for Name: dogodeksplosni; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodeksplosni (id) FROM stdin;
\.


--
-- TOC entry 3126 (class 0 OID 23926522)
-- Dependencies: 242
-- Data for Name: drugivir; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drugivir (id, znesek, opis, mednarodni, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 3076 (class 0 OID 23925862)
-- Dependencies: 192
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-5630-f5dd-df83-b8dbb6a33868	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-5630-f5dd-5818-67c3b5ccdbc6	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-5630-f5dd-38f9-6ca1313177e8	AL	ALB	008	Albania 	Albanija	\N
00040000-5630-f5dd-3f92-7590119c3d71	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-5630-f5dd-cd2f-ef1c64a5fc83	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-5630-f5dd-9f00-c70cd1a842f8	AD	AND	020	Andorra 	Andora	\N
00040000-5630-f5dd-c12e-11d01770f75a	AO	AGO	024	Angola 	Angola	\N
00040000-5630-f5dd-ce94-82086636454b	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-5630-f5dd-b6b0-da0cd9b4b6c9	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-5630-f5dd-7916-3af6ebb90a8e	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-5630-f5dd-e0ab-5078edefbb0a	AR	ARG	032	Argentina 	Argenitna	\N
00040000-5630-f5dd-8c8f-c52ddedc991e	AM	ARM	051	Armenia 	Armenija	\N
00040000-5630-f5dd-1380-e28293ea907f	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-5630-f5dd-d8bc-74109c454be7	AU	AUS	036	Australia 	Avstralija	\N
00040000-5630-f5dd-a64d-ada5badb3ff5	AT	AUT	040	Austria 	Avstrija	\N
00040000-5630-f5dd-d2f8-f8d9b2a9c48f	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-5630-f5dd-ef08-a638adf104c9	BS	BHS	044	Bahamas 	Bahami	\N
00040000-5630-f5dd-c684-28ca2f6da308	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-5630-f5dd-3739-a68a06427ab5	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-5630-f5dd-faae-e9ec4aa22753	BB	BRB	052	Barbados 	Barbados	\N
00040000-5630-f5dd-a6a1-a708a0ed04f8	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-5630-f5dd-f20e-1c78c81de7d2	BE	BEL	056	Belgium 	Belgija	\N
00040000-5630-f5dd-983c-452cbf9b7bc6	BZ	BLZ	084	Belize 	Belize	\N
00040000-5630-f5dd-f20c-8692a2b43e28	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-5630-f5dd-9c4f-354a4637ed65	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-5630-f5dd-7868-f217c66c0ad3	BT	BTN	064	Bhutan 	Butan	\N
00040000-5630-f5dd-950f-01c4873d7050	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-5630-f5dd-32a7-ff7994e6537b	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-5630-f5dd-ab92-785bfc7a7e46	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-5630-f5dd-0252-d261224a7707	BW	BWA	072	Botswana 	Bocvana	\N
00040000-5630-f5dd-fc08-6da7000ed059	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-5630-f5dd-5e49-f2b4b64220ef	BR	BRA	076	Brazil 	Brazilija	\N
00040000-5630-f5dd-4928-c5bebed591e0	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-5630-f5dd-b297-c8ad3fba418b	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-5630-f5dd-b9b2-d78963f5ac0f	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-5630-f5dd-ede1-4a57d427ab2a	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-5630-f5dd-bb8b-b0b12afcc4cf	BI	BDI	108	Burundi 	Burundi 	\N
00040000-5630-f5dd-2293-aa916a519b46	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-5630-f5dd-d11d-ab6432a4418b	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-5630-f5dd-6c2f-197cca6214db	CA	CAN	124	Canada 	Kanada	\N
00040000-5630-f5dd-2595-5f63f557c20a	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-5630-f5dd-866f-4e82603c7ed1	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-5630-f5dd-e7af-cb62adb11fc5	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-5630-f5dd-6cb0-e41508bf51de	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-5630-f5dd-ae5b-4b1204a638aa	CL	CHL	152	Chile 	Čile	\N
00040000-5630-f5dd-e04c-73d82c567e49	CN	CHN	156	China 	Kitajska	\N
00040000-5630-f5dd-9e49-c2f324bca695	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-5630-f5dd-5a89-e31c1b4528a7	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-5630-f5dd-9730-fa728e68bc71	CO	COL	170	Colombia 	Kolumbija	\N
00040000-5630-f5dd-0827-5acb6388947d	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-5630-f5dd-fc47-87d1c5987842	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-5630-f5dd-e201-cda594efa5ff	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-5630-f5dd-0bef-f18938e281e4	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-5630-f5dd-e851-d59964ac9249	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-5630-f5dd-9827-21676bddd2e1	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-5630-f5dd-3827-b72ca8b3525b	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-5630-f5dd-1168-1401ad49d6c3	CU	CUB	192	Cuba 	Kuba	\N
00040000-5630-f5dd-91d6-ac2dd0095fd9	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-5630-f5dd-69bf-3371801497a8	CY	CYP	196	Cyprus 	Ciper	\N
00040000-5630-f5dd-4094-bcdcbbcee1f8	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-5630-f5dd-fa9e-73ba89539c3d	DK	DNK	208	Denmark 	Danska	\N
00040000-5630-f5dd-3a51-1b9d1320261d	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-5630-f5dd-6702-0606dcf4c0c1	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-5630-f5dd-5629-aaaff6a9f072	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-5630-f5dd-f195-16362892e1aa	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-5630-f5dd-1672-778a429a0511	EG	EGY	818	Egypt 	Egipt	\N
00040000-5630-f5dd-d789-8827ac2d566e	SV	SLV	222	El Salvador 	Salvador	\N
00040000-5630-f5dd-bc65-5ee97b34b1a9	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-5630-f5dd-63bd-d02824ebf0e8	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-5630-f5dd-f4b6-6781c2c25451	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-5630-f5dd-49ae-eeb7785f5bb8	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-5630-f5dd-f108-75952e37aae2	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-5630-f5dd-7d14-cf95ad72c1cc	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-5630-f5dd-a113-ed32b44385ac	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-5630-f5dd-816b-723495245af7	FI	FIN	246	Finland 	Finska	\N
00040000-5630-f5dd-9dde-92e648b9ab92	FR	FRA	250	France 	Francija	\N
00040000-5630-f5dd-dd6f-7bd06a6f82b5	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-5630-f5dd-3f9a-703fa2f80160	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-5630-f5dd-7b8d-740d6a71b459	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-5630-f5dd-7ee7-ade37cdc3b88	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-5630-f5dd-9a98-f9bf84921554	GA	GAB	266	Gabon 	Gabon	\N
00040000-5630-f5dd-35c0-bdef13023fec	GM	GMB	270	Gambia 	Gambija	\N
00040000-5630-f5dd-bc36-f824bee00198	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-5630-f5dd-2b55-811c1666fda7	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-5630-f5dd-9614-f3b9ed5eb103	GH	GHA	288	Ghana 	Gana	\N
00040000-5630-f5dd-dbf4-c5304f1fbe76	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-5630-f5dd-296a-1dba455cb6eb	GR	GRC	300	Greece 	Grčija	\N
00040000-5630-f5dd-e771-61750f43c518	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-5630-f5dd-f762-87e9e154da9c	GD	GRD	308	Grenada 	Grenada	\N
00040000-5630-f5dd-3010-674d600d2a89	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-5630-f5dd-819a-14f3bf4a5590	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-5630-f5dd-1f8e-5e4927ef7357	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-5630-f5dd-e4ab-5fc8f3d81ef1	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-5630-f5dd-3ff0-5858e932cf00	GN	GIN	324	Guinea 	Gvineja	\N
00040000-5630-f5dd-db06-66a595b06172	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-5630-f5dd-51b8-45880f419d42	GY	GUY	328	Guyana 	Gvajana	\N
00040000-5630-f5dd-530b-824e33ed1129	HT	HTI	332	Haiti 	Haiti	\N
00040000-5630-f5dd-4615-038d767c585a	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-5630-f5dd-fe04-7d8fb3ae4642	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-5630-f5dd-2ebe-199d23d0c743	HN	HND	340	Honduras 	Honduras	\N
00040000-5630-f5dd-0479-3ddafea184c1	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-5630-f5dd-bad4-a14c6907cc0b	HU	HUN	348	Hungary 	Madžarska	\N
00040000-5630-f5dd-7fef-cb9206048407	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-5630-f5dd-46f8-2d518322a971	IN	IND	356	India 	Indija	\N
00040000-5630-f5dd-4259-de065563c925	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-5630-f5dd-a30d-2b7429d8f3d0	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-5630-f5dd-5c99-20698695007c	IQ	IRQ	368	Iraq 	Irak	\N
00040000-5630-f5dd-3bf7-130024534241	IE	IRL	372	Ireland 	Irska	\N
00040000-5630-f5dd-5d4c-11b440dd590c	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-5630-f5dd-54c9-c2ffc8120e72	IL	ISR	376	Israel 	Izrael	\N
00040000-5630-f5dd-1f2f-b73cb354043c	IT	ITA	380	Italy 	Italija	\N
00040000-5630-f5dd-0b64-96d77906697a	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-5630-f5dd-f9ec-b21c413d1066	JP	JPN	392	Japan 	Japonska	\N
00040000-5630-f5dd-707e-7501a21de6e1	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-5630-f5dd-e9e1-754d25a001de	JO	JOR	400	Jordan 	Jordanija	\N
00040000-5630-f5dd-b3a3-5e6dcae8b1e4	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-5630-f5dd-1ae3-30b36cf4cda9	KE	KEN	404	Kenya 	Kenija	\N
00040000-5630-f5dd-8905-32dfa49df9af	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-5630-f5dd-fc7d-3f5886c335b0	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-5630-f5dd-6f41-abb427b48c18	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-5630-f5dd-6463-cac0b9058884	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-5630-f5dd-88c0-9fd4941a32d4	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-5630-f5dd-339b-c30d823d7f69	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-5630-f5dd-f281-907415a88f30	LV	LVA	428	Latvia 	Latvija	\N
00040000-5630-f5dd-9c8c-67a5b14a4ac4	LB	LBN	422	Lebanon 	Libanon	\N
00040000-5630-f5dd-1606-9085288ef5d5	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-5630-f5dd-3659-77d53665124b	LR	LBR	430	Liberia 	Liberija	\N
00040000-5630-f5dd-64c4-8e0a481bb6e8	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-5630-f5dd-ab48-a1ddc7a94e28	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-5630-f5dd-c161-f862deb59ada	LT	LTU	440	Lithuania 	Litva	\N
00040000-5630-f5dd-7d10-b6468e7910c9	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-5630-f5dd-f8d4-d81561723aa5	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-5630-f5dd-00e3-71b4000085a8	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-5630-f5dd-71e7-f565a739b0b1	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-5630-f5dd-9d96-938bb2103345	MW	MWI	454	Malawi 	Malavi	\N
00040000-5630-f5dd-e00a-85552feaeaf2	MY	MYS	458	Malaysia 	Malezija	\N
00040000-5630-f5dd-39e1-abfc44024280	MV	MDV	462	Maldives 	Maldivi	\N
00040000-5630-f5dd-df71-efc7829ab3d1	ML	MLI	466	Mali 	Mali	\N
00040000-5630-f5dd-1379-aeb7b6ecd930	MT	MLT	470	Malta 	Malta	\N
00040000-5630-f5dd-9c44-c38383496fdb	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-5630-f5dd-dacc-455bcc27b0df	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-5630-f5dd-a339-dc7d441a2406	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-5630-f5dd-4b6e-9c8a2a783f20	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-5630-f5dd-9bf0-a44000d338a3	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-5630-f5dd-eeba-c3794c5152df	MX	MEX	484	Mexico 	Mehika	\N
00040000-5630-f5dd-56a6-f184d4cf07d8	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-5630-f5dd-f291-f62a5edbabed	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-5630-f5dd-05f9-6303bc6475db	MC	MCO	492	Monaco 	Monako	\N
00040000-5630-f5dd-4bea-3a04e7802117	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-5630-f5dd-1c55-5ee4a5915129	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-5630-f5dd-e1c5-161e46eac69d	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-5630-f5dd-4286-4f6c6304d797	MA	MAR	504	Morocco 	Maroko	\N
00040000-5630-f5dd-bb85-a691674b68d2	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-5630-f5dd-1bac-541dbf8882a2	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-5630-f5dd-dfd3-f48cab6bd260	NA	NAM	516	Namibia 	Namibija	\N
00040000-5630-f5dd-4335-ab56012d6aeb	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-5630-f5dd-4b0a-6ce4f763fa7a	NP	NPL	524	Nepal 	Nepal	\N
00040000-5630-f5dd-b17c-a3bdf67b1c11	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-5630-f5dd-8cd3-c5230888f95c	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-5630-f5dd-6ef8-fb365040a5e4	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-5630-f5dd-af4e-a7e56eda519a	NE	NER	562	Niger 	Niger 	\N
00040000-5630-f5dd-e4c9-ad5af8378a93	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-5630-f5dd-e4fe-d2aa7b0792fd	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-5630-f5dd-c7dd-cd2ceb4a1088	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-5630-f5dd-6ab3-cde5cfee89bb	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-5630-f5dd-5884-73c5e4c19502	NO	NOR	578	Norway 	Norveška	\N
00040000-5630-f5dd-a83a-f65eae87b9fb	OM	OMN	512	Oman 	Oman	\N
00040000-5630-f5dd-4c02-d1dba69791af	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-5630-f5dd-137e-5ac32fa446c0	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-5630-f5dd-0bb7-06b4671bfd5c	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-5630-f5dd-f6fb-4ac2e4447961	PA	PAN	591	Panama 	Panama	\N
00040000-5630-f5dd-94d6-248e0a0b6a96	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-5630-f5dd-0a59-b3161639855a	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-5630-f5dd-c2b9-a457ebe4bcd0	PE	PER	604	Peru 	Peru	\N
00040000-5630-f5dd-8016-0155a8ea4ece	PH	PHL	608	Philippines 	Filipini	\N
00040000-5630-f5dd-ce99-5118d9ce26aa	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-5630-f5dd-2c3e-e37beb862f5f	PL	POL	616	Poland 	Poljska	\N
00040000-5630-f5dd-bd4a-35cb610ef297	PT	PRT	620	Portugal 	Portugalska	\N
00040000-5630-f5dd-ca3f-26fa9ee899f0	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-5630-f5dd-351d-bfa00e0defa1	QA	QAT	634	Qatar 	Katar	\N
00040000-5630-f5dd-f58d-19e16c222f4a	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-5630-f5dd-765f-1b9aa8ca19ef	RO	ROU	642	Romania 	Romunija	\N
00040000-5630-f5dd-5aea-7b8e8610d22a	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-5630-f5dd-4b20-17b16c1b6a34	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-5630-f5dd-8ba2-dc627233e81e	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-5630-f5dd-2a8a-1217294d13d9	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-5630-f5dd-331f-0cdf1f6522af	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-5630-f5dd-53b3-7f43861309da	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-5630-f5dd-8223-550c57f7a6e6	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-5630-f5dd-ea83-b0823cb90118	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-5630-f5dd-f686-d3536b4aaaad	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-5630-f5dd-900e-e839be65d477	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-5630-f5dd-11c9-cad69c4513bc	SM	SMR	674	San Marino 	San Marino	\N
00040000-5630-f5dd-1412-58e280244a4a	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-5630-f5dd-2003-8913171f8dac	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-5630-f5dd-6064-d7d745fe14d5	SN	SEN	686	Senegal 	Senegal	\N
00040000-5630-f5dd-bcb4-8befd411494d	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-5630-f5dd-d745-d96738a02d8e	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-5630-f5dd-e5ef-72d29867b770	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-5630-f5dd-bde3-8a83c8d9aecc	SG	SGP	702	Singapore 	Singapur	\N
00040000-5630-f5dd-efc8-d012a539b514	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-5630-f5dd-6ac0-21eb4babf135	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-5630-f5dd-f6d3-04539478d8be	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-5630-f5dd-d4fa-e525fbc39b3b	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-5630-f5dd-2299-dc0efd907949	SO	SOM	706	Somalia 	Somalija	\N
00040000-5630-f5dd-7d01-1366ad0cb406	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-5630-f5dd-be2c-d944db220c48	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-5630-f5dd-7e2e-4040da4fedfd	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-5630-f5dd-b3d9-77a17ee55e5f	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-5630-f5dd-5127-dfbce5961339	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-5630-f5dd-3a80-37a88bea2fa7	SD	SDN	729	Sudan 	Sudan	\N
00040000-5630-f5dd-b02c-e427633000ff	SR	SUR	740	Suriname 	Surinam	\N
00040000-5630-f5dd-b456-c6a7919dc6b7	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-5630-f5dd-3da5-7e03640f64f8	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-5630-f5dd-ede4-721512bd42a4	SE	SWE	752	Sweden 	Švedska	\N
00040000-5630-f5dd-0969-f7ed1a912aab	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-5630-f5dd-13f5-af3b803c8886	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-5630-f5dd-f604-6b6fb9c50b66	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-5630-f5dd-d163-297dff673036	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-5630-f5dd-62cb-e586e16e163e	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-5630-f5dd-67e1-6869ef9b44cd	TH	THA	764	Thailand 	Tajska	\N
00040000-5630-f5dd-8be6-38b93c373f45	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-5630-f5dd-d02c-3efc8ea14b91	TG	TGO	768	Togo 	Togo	\N
00040000-5630-f5dd-56dc-37193be7cb81	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-5630-f5dd-ac31-14b21e4d468f	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-5630-f5dd-7c95-727eb1b9ff46	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-5630-f5dd-ac5c-d2dd63502ca9	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-5630-f5dd-29c5-9a3f1411a956	TR	TUR	792	Turkey 	Turčija	\N
00040000-5630-f5dd-794d-badb5f22dae2	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-5630-f5dd-84b4-29004e4b66da	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5630-f5dd-5f9b-d844ca24da5e	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-5630-f5dd-6deb-346e46782e56	UG	UGA	800	Uganda 	Uganda	\N
00040000-5630-f5dd-0fc0-13e5520b4c20	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-5630-f5dd-8d39-1e1cdbeb94d0	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-5630-f5dd-16d8-336067578334	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-5630-f5dd-f2da-230bfe35abc3	US	USA	840	United States 	Združene države Amerike	\N
00040000-5630-f5dd-f27a-07e5e9c7df9f	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-5630-f5dd-0f22-33087fbeba59	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-5630-f5dd-2b27-aeff4ac36962	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-5630-f5dd-a26d-6ee3eaba2c52	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-5630-f5dd-15b5-557f104e81b1	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-5630-f5dd-8470-a7d07a5c54dd	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-5630-f5dd-db34-ae9bf2a21b21	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5630-f5dd-80a2-23384d4f8ba9	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-5630-f5dd-47ff-6b78979df3cd	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-5630-f5dd-d3c0-12c60e022f00	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-5630-f5dd-76c8-cb3bc5672771	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-5630-f5dd-a195-a066ce11afa9	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-5630-f5dd-add9-b187cb70b4d0	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 3119 (class 0 OID 23926338)
-- Dependencies: 235
-- Data for Name: enotaprograma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY enotaprograma (id, uprizoritev_id, program_dela_id, gostitelj_id, celotnavrednost, nasdelez, celotnavrednostmat, celotnavrednostgostovsz, zaproseno, lastnasredstva, avtorskihonorarji, avtorskihonorarjisamoz, tantieme, avtorskepravice, materialni, imakoprodukcije, vlozekgostitelja, drugijavni, stzaposlenih, stzaposumet, stzaposdrug, sthonorarnihzun, sthonorarnihzunigr, sthonorarnihzunigrtujjz, sthonorarnihzunsamoz, obiskdoma, obiskkopr, obiskgost, obiskkoprgost, obiskzamejo, obiskkoprzamejo, obiskint, obiskkoprint, ponovidoma, ponovikopr, ponovizamejo, ponovikoprzamejo, ponovigost, ponovikoprgost, ponovikoprint, ponoviint, naziv, kpe, sort, tipprogramskeenote_id, tip, prikoproducentu, prizorisce, trajanje, zvrst, avtor, reziser, datum, soustvarjalci, strosekodkpred, stroskiostali, krajgostovanja, ustanova, datumgostovanja, transportnistroski, dnevprvzad, drzavagostovanja_id, stpe, stpredstav, stokroglihmiz, stpredstavitev, stdelavnic, stdrugidogodki, stprodukcij, caspriprave, casizvedbe, prizorisca, umetvodja, programskotelo, sttujihselektorjev) FROM stdin;
002f0000-5630-f5df-f6cd-c8ddf28ef650	000e0000-5630-f5df-8538-b27d34257874	\N	\N	9000.30	9000.30	9000.30	0.00	3600.12	5299.98	4000.40	1000.40	200.20	200.30	4599.40	\N	0.00	100.20	0	2	2	2	2	2	0	40	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-5630-f5dd-7112-fd4fbe9530b7	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-5630-f5df-d674-05b2085f7b43	000e0000-5630-f5df-4453-2d1bf02c045a	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	0	60	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-5630-f5dd-a433-b33237686575	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-5630-f5df-8a47-a9dc62b7c08a	000e0000-5630-f5df-ebaa-bedd3e27853e	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	0	60	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-5630-f5dd-7112-fd4fbe9530b7	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-5630-f5df-55eb-8710590f5c22	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-54.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	54.20	5	0	0	3	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0	0	Urejanje portala	0.00	10	\N	razno	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-5630-f5df-57ce-d1e8a80f112d	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-31.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	31.20	5	0	0	3	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0	0	Delavnice otroci	0.00	8	\N	razno	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 3104 (class 0 OID 23926139)
-- Dependencies: 220
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, podrocje, vodjaekipe, naziv, komentar, velikost, pomembna, sort, seplanira, dovoliprekrivanje, maxprekrivanj, tipfunkcije_id) FROM stdin;
000d0000-5630-f5df-357e-ce04f08bd42b	000e0000-5630-f5df-4453-2d1bf02c045a	\N	igralec	\N	Hipolita	glavna vloga	velika	t	6	t	t	\N	000f0000-5630-f5dd-9a07-db4a65ba2106
000d0000-5630-f5df-38c7-86e42bf59e25	000e0000-5630-f5df-4453-2d1bf02c045a	000c0000-5630-f5df-17e4-01498fc9e7a8	igralec	\N	Tezej	glavna vloga	velika	t	5	t	t	\N	000f0000-5630-f5dd-9a07-db4a65ba2106
000d0000-5630-f5df-d36e-19d5bbecdbf2	000e0000-5630-f5df-4453-2d1bf02c045a	000c0000-5630-f5df-194d-8f427d320652	umetnik	\N	Režija		velika	t	8	t	t	\N	000f0000-5630-f5dd-899b-0755f94e9aa9
000d0000-5630-f5df-287f-5d75e42edf2e	000e0000-5630-f5df-4453-2d1bf02c045a	000c0000-5630-f5df-5409-b26a4cb5c633	inspicient	t	Inšpicient			t	8	t	t	\N	000f0000-5630-f5dd-e4e2-c8925d6bbd93
000d0000-5630-f5df-fae6-762a6cbab650	000e0000-5630-f5df-4453-2d1bf02c045a	000c0000-5630-f5df-45fb-04b4142d0e54	tehnik	t	Tehnični vodja			t	8	t	t	\N	000f0000-5630-f5dd-a1ed-f7dfd9b90d6b
000d0000-5630-f5df-a2f6-ca90ade87665	000e0000-5630-f5df-4453-2d1bf02c045a	000c0000-5630-f5df-b3e0-f21c9213e04e	tehnik	\N	Razsvetljava			t	3	t	t	\N	000f0000-5630-f5dd-a1ed-f7dfd9b90d6b
000d0000-5630-f5df-151a-1e3363e9e468	000e0000-5630-f5df-4453-2d1bf02c045a	000c0000-5630-f5df-be5c-e8858ce3b74d	igralec	\N	Helena	glavna vloga	velika	t	5	t	t	\N	000f0000-5630-f5dd-9a07-db4a65ba2106
000d0000-5630-f5df-271b-f3807175b81f	000e0000-5630-f5df-4453-2d1bf02c045a	000c0000-5630-f5df-e75c-4496d15d1619	umetnik	\N	Lektoriranje			t	22	t	t	\N	000f0000-5630-f5dd-26e9-a17302016c83
000d0000-5630-f5df-f775-4d85cb6095d6	000e0000-5630-f5df-4453-2d1bf02c045a	000c0000-5630-f5df-aa5b-1b62f186a5be	umetnik	\N	Avtor	Avtor besedila		t	2	t	f	\N	000f0000-5630-f5dd-d707-0f5d66e2879e
\.


--
-- TOC entry 3082 (class 0 OID 23925936)
-- Dependencies: 198
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta, zamejstvo, kraj) FROM stdin;
\.


--
-- TOC entry 3079 (class 0 OID 23925902)
-- Dependencies: 195
-- Data for Name: job; Type: TABLE DATA; Schema: public; Owner: -
--

COPY job (id, user_id, name, task, status, log, datum, casizvedbe, izveden, data, alert, hidden, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3077 (class 0 OID 23925879)
-- Dependencies: 193
-- Data for Name: kontaktnaoseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kontaktnaoseba (id, popa_id, oseba_id, status, funkcija, opis) FROM stdin;
00260000-5630-f5df-bb2c-e6f504b6aa86	00080000-5630-f5df-2772-a65b13efa9c3	00090000-5630-f5df-d88c-c05d4d772331	AK		igralka
\.


--
-- TOC entry 3093 (class 0 OID 23926053)
-- Dependencies: 209
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 3130 (class 0 OID 23926577)
-- Dependencies: 246
-- Data for Name: mapa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa (id, lastnik_id, parent_id, ime, komentar, caskreiranja, casspremembe, javnidostop, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3131 (class 0 OID 23926589)
-- Dependencies: 247
-- Data for Name: mapa_zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa_zapis (mapa_id, zapis_id) FROM stdin;
\.


--
-- TOC entry 3133 (class 0 OID 23926611)
-- Dependencies: 249
-- Data for Name: mapaacl; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapaacl (id, mapa_id, perm_id, dostop, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3054 (class 0 OID 23562333)
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
20150930165014
20151012154609
20151013160827
20151015150048
20151021092904
20151028083119
\.


--
-- TOC entry 3097 (class 0 OID 23926078)
-- Dependencies: 213
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 3074 (class 0 OID 23925836)
-- Dependencies: 190
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-5630-f5dd-c057-bf2f2e61f0cc	popa.stakli	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-5630-f5dd-3496-4c7495c3a5fa	oseba.spol	array	a:2:{s:1:"M";a:1:{s:5:"label";s:6:"Moški";}s:1:"Z";a:1:{s:5:"label";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-5630-f5dd-d3e7-33bb790add85	telefonska.vrsta	array	a:3:{s:7:"mobilna";a:1:{s:5:"label";s:7:"Mobilni";}s:6:"domaca";a:1:{s:5:"label";s:6:"Domač";}s:6:"fiksna";a:1:{s:5:"label";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-5630-f5dd-9be4-58b297f68da3	kontaktnaoseba.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status kontaktne osebe
00000000-5630-f5dd-3a6c-db61a55771a4	dogodek.status	array	a:8:{s:4:"100s";a:1:{s:5:"label";s:11:"Dolgoročno";}s:4:"200s";a:1:{s:5:"label";s:9:"Planirano";}s:4:"300s";a:1:{s:5:"label";s:8:"Fiksiran";}s:4:"400s";a:1:{s:5:"label";s:17:"Potrjen - interno";}s:4:"500s";a:1:{s:5:"label";s:15:"Potrjen - javno";}s:4:"600s";a:1:{s:5:"label";s:10:"Zaključen";}s:4:"610s";a:1:{s:5:"label";s:9:"Odpovedan";}s:4:"700s";a:1:{s:5:"label";s:7:"Obdelan";}}	f	t	t	\N	Tabela statusa dogodkov
00000000-5630-f5dd-b723-113a4a938873	dogodek.razred	array	a:5:{s:4:"100s";a:2:{s:5:"label";s:9:"Predstava";s:4:"type";s:9:"predstava";}s:4:"200s";a:2:{s:5:"label";s:4:"Vaja";s:4:"type";s:4:"vaja";}s:4:"300s";a:2:{s:5:"label";s:10:"Gostovanje";s:4:"type";s:10:"gostovanje";}s:4:"400s";a:2:{s:5:"label";s:16:"Splošni dogodek";s:4:"type";s:8:"splošni";}s:4:"500s";a:2:{s:5:"label";s:10:"Zasedenost";s:4:"type";s:10:"zasedenost";}}	f	t	t	\N	Tabela razredov dogodkov, ki jih aplikacija podpira
00000000-5630-f5dd-51f4-cd7cdc4d13d4	uprizoritev.faza	array	a:6:{s:20:"predprodukcija-ideja";a:1:{s:5:"label";s:16:"Dolgoročni plan";}s:20:"predprodukcija-poziv";a:1:{s:5:"label";s:29:"Predprodukcija, v fazi poziva";}s:30:"predprodukcija-potrjen_program";a:1:{s:5:"label";s:34:"Predprodukcija, program je potrjen";}s:10:"produkcija";a:1:{s:5:"label";s:10:"Produkcija";}s:14:"postprodukcija";a:1:{s:5:"label";s:14:"Postprodukcija";}s:5:"arhiv";a:1:{s:5:"label";s:10:"Arhivirana";}}	f	t	f	\N	Faza uprizoritve
00000000-5630-f5dd-30cc-540757f849aa	funkcija.podrocje	array	a:4:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}}	f	t	f	\N	Področje funkcije
00000000-5630-f5dd-8ac9-43a71168c5b0	tipfunkcije.podrocje	array	a:4:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}}	f	t	f	\N	Področje funkcije
00000000-5630-f5dd-3c5c-50f30e57fe6c	funkcija.velikost	array	a:4:{s:6:"velika";a:1:{s:5:"label";s:23:"Velika vloga / funkcija";}s:7:"srednja";a:1:{s:5:"label";s:24:"Srednja vloga / funkcija";}s:4:"mala";a:1:{s:5:"label";s:21:"Mala vloga / funkcija";}s:7:"stataza";a:1:{s:5:"label";s:8:"Stataža";}}	f	t	f	\N	Velikost funkcije
00000000-5630-f5dd-e765-a2674e63f086	zaposlitev.status	array	a:2:{s:1:"A";a:1:{s:5:"label";s:7:"Aktivna";}s:1:"N";a:1:{s:5:"label";s:9:"Neaktivna";}}	f	t	f	\N	Status zaposlitve
00000000-5630-f5dd-5051-d46b3d5256dd	produkcijskahisa.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktivna";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktivna";}}	f	t	f	\N	Status produkcijske hiše
00000000-5630-f5dd-2dab-945406e7a528	strosekuprizoritve.tipstroska	array	a:1:{s:10:"materialni";a:1:{s:5:"label";s:19:"Materialni strošek";}}	f	t	f	\N	Tip stroška
00000000-5630-f5dd-68bd-9af4f240cfeb	avtorbesedila.tipavtorja	array	a:4:{s:4:"aizv";a:1:{s:5:"label";s:15:"Avtor izvirnika";}s:4:"prev";a:1:{s:5:"label";s:10:"Prevajalec";}s:4:"apri";a:1:{s:5:"label";s:14:"Avtor priredbe";}s:4:"dram";a:1:{s:5:"label";s:12:"Dramatizator";}}	f	t	f	\N	Tip stroška
00000000-5630-f5dd-d560-69678b5123e4	fsacl.dostop	array	a:4:{s:1:"X";a:1:{s:5:"label";s:12:"Brez dostopa";}s:1:"R";a:1:{s:5:"label";s:11:"Samo branje";}s:2:"RW";a:1:{s:5:"label";s:17:"Branje in pisanje";}s:3:"RWD";a:1:{s:5:"label";s:26:"Branje pisanje in brisanje";}}	f	t	f	\N	ACL Javni dostop
00000000-5630-f5df-e108-d686af18b079	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-5630-f5df-9930-6241cd820995	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-5630-f5df-e8be-74beb292f702	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-5630-f5df-f36d-62ab9ae30425	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-5630-f5df-9823-fb809dae5077	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
00000000-5630-f5e1-208f-19b126fbd571	application.tenant.maticnopodjetje	string	s:36:"00080000-5630-f5e1-838f-2c7ef68651d7";	f	t	f		Id matičnega podjetja v Popa
\.


--
-- TOC entry 3067 (class 0 OID 23925736)
-- Dependencies: 183
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-5630-f5df-e8cb-08021cd0c7bc	00000000-5630-f5df-e108-d686af18b079	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-5630-f5df-c171-c9158be8cfa9	00000000-5630-f5df-e108-d686af18b079	00010000-5630-f5dd-2e38-92dd2f38edf9	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-5630-f5df-53c4-b7cb59f25f05	00000000-5630-f5df-9930-6241cd820995	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 3071 (class 0 OID 23925803)
-- Dependencies: 187
-- Data for Name: organizacijskaenota; Type: TABLE DATA; Schema: public; Owner: -
--

COPY organizacijskaenota (id, parent_id, vodja_id, namestnik_id, sifra, naziv) FROM stdin;
00410000-5630-f5df-2905-f26bf42c7037	\N	00100000-5630-f5df-f575-b6bcb56cc8f9	00100000-5630-f5df-ba3f-1e9891e17dae	01	Gledališče Nimbis
00410000-5630-f5df-5f51-fb3ffaffd9d3	00410000-5630-f5df-2905-f26bf42c7037	00100000-5630-f5df-f575-b6bcb56cc8f9	00100000-5630-f5df-ba3f-1e9891e17dae	02	Tehnika
\.


--
-- TOC entry 3068 (class 0 OID 23925747)
-- Dependencies: 184
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naslov_id, sifra, naziv, ime, priimek, funkcija, srednjeime, polnoime, psevdonim, email, twitter, skype, fb, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
00090000-5630-f5df-31a4-547194cba85c	\N	\N	0001	g.	Janez	Novak	a	Peter	Janez Peter Novak	Jani	jani.novak@xxx.xx				1958-01-06	0601958000000	123456789	M	Jani Janez	Slovenija	Slovenija	Ljubljana
00090000-5630-f5df-4e48-e924395941f4	00010000-5630-f5df-7863-91c080d8cf58	\N	0002	dr.	Anton	Horvat	b		Anton  Horvat	Tona	anton.horvat@xxx.xx				1968-02-12	1202968111111	234567890	M		Slovenija	Slovenija	Maribor
00090000-5630-f5df-88d6-bd1f2bbdde6a	00010000-5630-f5df-8c8b-e9218e507a0a	\N	0003		Ivan	Kovačič	c		Ivan  Kovačič	Ivo	ivan.kovacic@xxx.xx				1975-03-26	2603976222222	345678901	M		Slovenija	Slovenija	Celje
00090000-5630-f5df-585b-58a79a8447a9	00010000-5630-f5df-3987-fe44112192bf	\N	0004	prof.	Jožef	Krajnc	d		Jožef  Krajnc	Joža	jozef.krajnc@xxx.xx				1971-04-30	3004971333333	456789012	M		Slovenija	Slovenija	Kranj
00090000-5630-f5df-5957-0f1ce09da530	\N	\N	0005		Marko	Zupančič	e		Marko  Zupančič		marko.zupancic@xxx.xx				1984-05-07	0705984444444	567890123	M		Slovenija	Slovenija	Koper
00090000-5630-f5df-509f-30a0ca58bf12	\N	\N	0006	ga.	Marija	Kovač	f		Marija  Kovač		marija.kovac@xxx.xx				1962-06-19	1906962444444	678901234	Z		Slovenija	Slovenija	Murska Sobota
00090000-5630-f5df-fb23-be1c62cdbf7b	\N	\N	0007	ga.	Ana	Potočnik	g		Ana  Potočnik		ana.potocnik@xxx.xx				1975-07-24	2407975555555	789012345	Z		Slovenija	Slovenija	Novo Mesto
00090000-5630-f5df-d46e-6ef8568fce93	\N	\N	0008	ga.	Maja	Mlakar	h		Maja  Mlakar		maja.mlakar@xxx.xx				1986-08-02	0208986666666	890123456	Z		Slovenija	Slovenija	Nova Gorica
00090000-5630-f5df-d88c-c05d4d772331	00010000-5630-f5df-8b64-fc6b98bfcfb5	\N	0009		Irena	Kos	i		Irena  Kos		irena.kos@xxx.xx				1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Ptuj
00090000-5630-f5df-ebff-d3ae3fe5fb21	\N	\N	0010		Mojca	Vidmar	J		Mojca  Vidmar		mojca.vidmar@xxx.xx				1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Idrija
00090000-5630-f5df-c49f-c6d5d696d07c	\N	\N	0011		xx	write protected12345	a		xx  write protected12345		xx@xxx.xx				\N	\N	\N	Z		\N	\N	\N
00090000-5630-f5df-1e48-4d5f928ba006	\N	\N	0012		Luka	Golob	luč	a	Luka a Golob		luka.golob@xxx.xx				\N	\N	\N	M		\N	\N	\N
00090000-5630-f5df-9d0d-9a62dfb549c7	00010000-5630-f5df-7135-410e107d62d3	\N	0013		Tatjana	Božič	tajnica	a	Tatjana a Božič		tatjana.bozic@xxx.xx				\N	\N	\N	Z		\N	\N	\N
00090000-5630-f5df-96a8-f4af4d2126b1	\N	\N	0014		William	Shakespeare	avtor		William  Shakespeare		\N				\N	\N	\N	M		\N	\N	\N
00090000-5630-f5df-e7f6-1ad3aa1a944c	\N	\N	0015		Nebojša	Kavader	avtor		Nebojša  Kavader		\N				\N	\N	\N	M		\N	\N	\N
00090000-5630-f5df-62cf-8ee662f4ffd6	\N	\N	0016		Fjodor	Dostojevski	avtor	Mihajlovič	Fjodor Mihajlovič Dostojevski		\N				\N	\N	\N	M		\N	\N	\N
00090000-5630-f5df-474d-44a9d7ea65a6	\N	\N	0017		Berta 	Hočevar	avtorica		Berta   Hočevar		\N				\N	\N	\N	Z		\N	\N	\N
00090000-5630-f5df-8367-20c677ee9edb	\N	\N	0018		Katarina	Podbevšek	lektorica		Katarina  Podbevšek		\N				\N	\N	\N	Z		\N	\N	\N
00090000-5630-f5df-b618-35a1d254e459	\N	\N	0019		Lojze	Žumer			Lojze  Žumer		\N				\N	\N	\N	M		\N	\N	\N
00090000-5630-f5df-3b1b-ea81e1c90029	\N	\N	0020		Luka	Novak			Luka  Novak		\N				\N	\N	\N	M		\N	\N	\N
00090000-5630-f5df-58ec-4a2ab753ba99	\N	\N	0021		Vinko	   Netriman   			Vinko     Netriman   		\N				\N	\N	\N	M		\N	\N	\N
\.


--
-- TOC entry 3062 (class 0 OID 23925691)
-- Dependencies: 178
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-5630-f5dd-907f-b47bc53e6625	Aaa-read	Aaa (User,Role,Permission) - branje	t
00030000-5630-f5dd-f498-bcc88337b62a	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	t
00030000-5630-f5dd-b1a2-c76bf82b00aa	TerminStoritve-vse	TerminStoritve - spreminjanje vseh zapisov	t
00030000-5630-f5dd-330f-fd638d977bef	Dogodek-readVse	Dogodek - branje vseh, ne glede na status dogodka	t
00030000-5630-f5dd-0927-fc6450fe120f	Oseba-vse	Oseba - vse - za testiranje assert	t
00030000-5630-f5dd-a184-1a7e1c3315f7	ProgramDela-lock	ProgramDela - zaklepanje	t
00030000-5630-f5dd-542d-27e1a1a398db	ProgramDela-unlock	ProgramDela - odklepanje	t
00030000-5630-f5dd-de59-e72edcbef8fd	Abonma-read	Abonma - branje	t
00030000-5630-f5dd-701e-954c1b8d6e5d	Abonma-write	Abonma - spreminjanje	t
00030000-5630-f5dd-c2be-d24812221412	Alternacija-read	Alternacija - branje	t
00030000-5630-f5dd-31ea-70df53087aec	Alternacija-write	Alternacija - spreminjanje	t
00030000-5630-f5dd-9e2a-a2f7c9628235	Arhivalija-read	Arhivalija - branje	t
00030000-5630-f5dd-9c9c-e3216b3a89b4	Arhivalija-write	Arhivalija - spreminjanje	t
00030000-5630-f5dd-dc17-65281c3ab8d8	AvtorBesedila-read	AvtorBesedila - branje	t
00030000-5630-f5dd-4f98-39eb336147fd	AvtorBesedila-write	AvtorBesedila - spreminjanje	t
00030000-5630-f5dd-0acc-6e6787623078	Besedilo-read	Besedilo - branje	t
00030000-5630-f5dd-8194-351707c4f209	Besedilo-write	Besedilo - spreminjanje	t
00030000-5630-f5dd-bf5b-87312801d810	DogodekIzven-read	DogodekIzven - branje	t
00030000-5630-f5dd-cf51-dd3605b00f74	DogodekIzven-write	DogodekIzven - spreminjanje	t
00030000-5630-f5dd-adf1-f7e53acd378e	Dogodek-read	Dogodek - branje	t
00030000-5630-f5dd-1db4-513441a81bc7	Dogodek-write	Dogodek - spreminjanje	t
00030000-5630-f5dd-c4b7-87803348a256	DrugiVir-read	DrugiVir - branje	t
00030000-5630-f5dd-e24a-038642152ebc	DrugiVir-write	DrugiVir - spreminjanje	t
00030000-5630-f5dd-c821-b2709c0d48f6	Drzava-read	Drzava - branje	t
00030000-5630-f5dd-0c39-6bb1be5cd69e	Drzava-write	Drzava - spreminjanje	t
00030000-5630-f5dd-2920-d3bba16560ba	EnotaPrograma-read	EnotaPrograma - branje	t
00030000-5630-f5dd-0ec2-66505d72b355	EnotaPrograma-write	EnotaPrograma - spreminjanje	t
00030000-5630-f5dd-a093-9d9585334b62	Funkcija-read	Funkcija - branje	t
00030000-5630-f5dd-16c4-dcd08acf4677	Funkcija-write	Funkcija - spreminjanje	t
00030000-5630-f5dd-ce2f-fcbfe2a6d934	Gostovanje-read	Gostovanje - branje	t
00030000-5630-f5dd-9a75-2f459f62ea8e	Gostovanje-write	Gostovanje - spreminjanje	t
00030000-5630-f5dd-acdf-587bbbd99ec2	Gostujoca-read	Gostujoca - branje	t
00030000-5630-f5dd-2235-eb920266ba0a	Gostujoca-write	Gostujoca - spreminjanje	t
00030000-5630-f5dd-dde1-829fd86f1cc8	KontaktnaOseba-read	KontaktnaOseba - branje	t
00030000-5630-f5dd-326a-43868cfa1aa1	KontaktnaOseba-write	KontaktnaOseba - spreminjanje	t
00030000-5630-f5dd-d9dd-d27fd43d9451	Kupec-read	Kupec - branje	t
00030000-5630-f5dd-98e5-5dbddd213596	Kupec-write	Kupec - spreminjanje	t
00030000-5630-f5dd-9607-7e433b927ea9	NacinPlacina-read	NacinPlacina - branje	t
00030000-5630-f5dd-d863-e06e225b3d59	NacinPlacina-write	NacinPlacina - spreminjanje	t
00030000-5630-f5dd-edb9-b354b730efdf	Option-read	Option - branje	t
00030000-5630-f5dd-b46a-8f2446889c14	Option-write	Option - spreminjanje	t
00030000-5630-f5dd-4efe-b2188c5fbb6f	OptionValue-read	OptionValue - branje	t
00030000-5630-f5dd-15ef-4db96d606001	OptionValue-write	OptionValue - spreminjanje	t
00030000-5630-f5dd-b49a-7fd20d68cd5f	OrganizacijskaEnota-read	OrganizacijskaEnota - branje	t
00030000-5630-f5dd-afe5-17563c198bd2	OrganizacijskaEnota-write	OrganizacijskaEnota - spreminjanje	t
00030000-5630-f5dd-b2ab-f5e6cf9a6000	Oseba-read	Oseba - branje	t
00030000-5630-f5dd-36cc-3ba8de5c9c7b	Oseba-write	Oseba - spreminjanje	t
00030000-5630-f5dd-27b0-8087ecd27b71	PlacilniInstrument-read	PlacilniInstrument - branje	t
00030000-5630-f5dd-11bb-4df7ca87babe	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	t
00030000-5630-f5dd-cd96-3a11f46953b2	PodrocjeSedenja-read	PodrocjeSedenja - branje	t
00030000-5630-f5dd-3db4-3aa3715b062f	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	t
00030000-5630-f5dd-129b-1294c4b878f1	Pogodba-read	Pogodba - branje	t
00030000-5630-f5dd-f802-f42f0f83f5f4	Pogodba-write	Pogodba - spreminjanje	t
00030000-5630-f5dd-a709-fb258c134d66	Popa-read	Popa - branje	t
00030000-5630-f5dd-94bf-31123d337a1a	Popa-write	Popa - spreminjanje	t
00030000-5630-f5dd-0960-9569477cd734	Posta-read	Posta - branje	t
00030000-5630-f5dd-7786-7fa0d7db0dae	Posta-write	Posta - spreminjanje	t
00030000-5630-f5dd-090a-ef5ce71313fc	PostavkaCDve-read	PostavkaCDve - branje	t
00030000-5630-f5dd-fe2e-1445e01dc56d	PostavkaCDve-write	PostavkaCDve - spreminjanje	t
00030000-5630-f5dd-6f57-d581cc7bd4ba	PostavkaRacuna-read	PostavkaRacuna - branje	t
00030000-5630-f5dd-54e3-ab768daa3a62	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	t
00030000-5630-f5dd-3d6e-1cabefba00e9	PostniNaslov-read	PostniNaslov - branje	t
00030000-5630-f5dd-6370-c974a6dfa82b	PostniNaslov-write	PostniNaslov - spreminjanje	t
00030000-5630-f5dd-4993-3df75b580357	Predstava-read	Predstava - branje	t
00030000-5630-f5dd-f0a7-a5eb174c271f	Predstava-write	Predstava - spreminjanje	t
00030000-5630-f5dd-bf25-6019901c740e	Praznik-read	Praznik - branje	t
00030000-5630-f5dd-db78-03b00a6e0a3d	Praznik-write	Praznik - spreminjanje	t
00030000-5630-f5dd-d76f-5471bb2bc766	ProdajaPredstave-read	ProdajaPredstave - branje	t
00030000-5630-f5dd-ccb6-6134fa0ec158	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	t
00030000-5630-f5dd-0ab9-9a15d8f424a6	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	t
00030000-5630-f5dd-e6a0-2814d760ee6d	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	t
00030000-5630-f5dd-c660-94e54f7e0d32	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	t
00030000-5630-f5dd-51b7-7dc7436cb497	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	t
00030000-5630-f5dd-529d-39f08f4bde86	ProgramDela-read	ProgramDela - branje	t
00030000-5630-f5dd-4b58-3493a3703892	ProgramDela-write	ProgramDela - spreminjanje	t
00030000-5630-f5dd-8e77-9e9abce4ea3e	ProgramFestival-read	ProgramFestival - branje	t
00030000-5630-f5dd-4fd6-32b70149df1d	ProgramFestival-write	ProgramFestival - spreminjanje	t
00030000-5630-f5dd-3ce2-76c12b2db233	ProgramGostovanje-read	ProgramGostovanje - branje	t
00030000-5630-f5dd-1104-e92967461f54	ProgramGostovanje-write	ProgramGostovanje - spreminjanje	t
00030000-5630-f5dd-5e15-4c57cfef65b2	ProgramGostujoca-read	ProgramGostujoca - branje	t
00030000-5630-f5dd-dbd4-679e5d0d58f3	ProgramGostujoca-write	ProgramGostujoca - spreminjanje	t
00030000-5630-f5dd-de99-ccc0fdc40789	ProgramIzjemni-read	ProgramIzjemni - branje	t
00030000-5630-f5dd-0749-ef4379636c07	ProgramIzjemni-write	ProgramIzjemni - spreminjanje	t
00030000-5630-f5dd-7ea4-8923b2118926	ProgramPonovitevPrejsnjih-read	ProgramPonovitevPrejsnjih - branje	t
00030000-5630-f5dd-b366-cf134d109caf	ProgramPonovitevPrejsnjih-write	ProgramPonovitevPrejsnjih - spreminjanje	t
00030000-5630-f5dd-8a38-c1d81c907b4c	ProgramPonovitevPremiere-read	ProgramPonovitevPremiere - branje	t
00030000-5630-f5dd-674b-44900d2d7068	ProgramPonovitevPremiere-write	ProgramPonovitevPremiere - spreminjanje	t
00030000-5630-f5dd-421a-0df233bfa68d	ProgramPremiera-read	ProgramPremiera - branje	t
00030000-5630-f5dd-41fd-48aa0822174e	ProgramPremiera-write	ProgramPremiera - spreminjanje	t
00030000-5630-f5dd-6965-29b510a0fe40	ProgramRazno-read	ProgramRazno - branje	t
00030000-5630-f5dd-c276-3c9ed5c4261d	ProgramRazno-write	ProgramRazno - spreminjanje	t
00030000-5630-f5dd-38c9-41955e476709	ProgramskaEnotaSklopa-read	ProgramskaEnotaSklopa - branje	t
00030000-5630-f5dd-bcdc-2e72ed1bc586	ProgramskaEnotaSklopa-write	ProgramskaEnotaSklopa - spreminjanje	t
00030000-5630-f5dd-62ee-9942722ef851	Prostor-read	Prostor - branje	t
00030000-5630-f5dd-c5f3-a6fd617d9125	Prostor-write	Prostor - spreminjanje	t
00030000-5630-f5dd-82c1-c566f6866283	Racun-read	Racun - branje	t
00030000-5630-f5dd-78f0-098f93807845	Racun-write	Racun - spreminjanje	t
00030000-5630-f5dd-bc8c-991f0878c80d	RazpisanSedez-read	RazpisanSedez - branje	t
00030000-5630-f5dd-04d6-5fa8e83eb74b	RazpisanSedez-write	RazpisanSedez - spreminjanje	t
00030000-5630-f5dd-d486-3905bb35de6c	Rekviziterstvo-read	Rekviziterstvo - branje	t
00030000-5630-f5dd-5f31-c22ce5a7c345	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	t
00030000-5630-f5dd-82cd-e6f25c114b85	Rekvizit-read	Rekvizit - branje	t
00030000-5630-f5dd-2fcb-6381b1874db1	Rekvizit-write	Rekvizit - spreminjanje	t
00030000-5630-f5dd-54ca-7780627cc93f	Revizija-read	Revizija - branje	t
00030000-5630-f5dd-5b1c-981fd1b04176	Revizija-write	Revizija - spreminjanje	t
00030000-5630-f5dd-b26e-16183a96ba68	Rezervacija-read	Rezervacija - branje	t
00030000-5630-f5dd-6ad3-62f0765bba10	Rezervacija-write	Rezervacija - spreminjanje	t
00030000-5630-f5dd-e5c6-6e7b8a2ecc8d	SedezniRed-read	SedezniRed - branje	t
00030000-5630-f5dd-3b37-4d01015c829a	SedezniRed-write	SedezniRed - spreminjanje	t
00030000-5630-f5dd-c0e5-76d01ba861a2	Sedez-read	Sedez - branje	t
00030000-5630-f5dd-258e-f3fe309a6d02	Sedez-write	Sedez - spreminjanje	t
00030000-5630-f5dd-511c-36f594b48904	Sezona-read	Sezona - branje	t
00030000-5630-f5dd-b3c8-ed8ad3da017e	Sezona-write	Sezona - spreminjanje	t
00030000-5630-f5dd-2f31-5edeeb763076	StevilcenjeKonfig-read	StevilcenjeKonfig - branje	t
00030000-5630-f5dd-2b4d-cc2e98e75193	StevilcenjeKonfig-write	StevilcenjeKonfig - spreminjanje	t
00030000-5630-f5dd-ef15-5032f0454de5	Stevilcenje-read	Stevilcenje - branje	t
00030000-5630-f5dd-3ea3-913f6b8b4a8f	Stevilcenje-write	Stevilcenje - spreminjanje	t
00030000-5630-f5dd-2b3c-ab20b7d97400	StevilcenjeStanje-read	StevilcenjeStanje - branje	t
00030000-5630-f5dd-037f-4fb295725e24	StevilcenjeStanje-write	StevilcenjeStanje - spreminjanje	t
00030000-5630-f5dd-9bf1-9f3aab921b86	StrosekUprizoritve-read	StrosekUprizoritve - branje	t
00030000-5630-f5dd-4f05-d961a08dcf86	StrosekUprizoritve-write	StrosekUprizoritve - spreminjanje	t
00030000-5630-f5dd-098c-eb62db23bf75	Telefonska-read	Telefonska - branje	t
00030000-5630-f5dd-5d76-0a7433422a59	Telefonska-write	Telefonska - spreminjanje	t
00030000-5630-f5dd-5eb7-23960bf0bc01	TerminStoritve-read	TerminStoritve - branje	t
00030000-5630-f5dd-ab0a-e11fb959bc56	TerminStoritve-write	TerminStoritve - spreminjanje	t
00030000-5630-f5dd-bf5b-5d911b9cc764	TipFunkcije-read	TipFunkcije - branje	t
00030000-5630-f5dd-4a41-d8fc732603bb	TipFunkcije-write	TipFunkcije - spreminjanje	t
00030000-5630-f5dd-b411-21643405aa12	TipPopa-read	TipPopa - branje	t
00030000-5630-f5dd-cbb3-c5c11e4b1206	TipPopa-write	TipPopa - spreminjanje	t
00030000-5630-f5dd-107a-981dbb5bc52d	TipProgramskeEnote-read	TipProgramskeEnote - branje	t
00030000-5630-f5dd-c474-8200e09c3404	TipProgramskeEnote-write	TipProgramskeEnote - spreminjanje	t
00030000-5630-f5dd-222e-1a78e643b189	TipVaje-read	TipVaje - branje	t
00030000-5630-f5dd-d21e-5ba8f6788fe8	TipVaje-write	TipVaje - spreminjanje	t
00030000-5630-f5dd-d39d-2bc0df8607a0	Trr-read	Trr - branje	t
00030000-5630-f5dd-df82-3436e243beae	Trr-write	Trr - spreminjanje	t
00030000-5630-f5dd-6c88-541d57b5e589	Uprizoritev-read	Uprizoritev - branje	t
00030000-5630-f5dd-8ef6-d46544978ace	Uprizoritev-write	Uprizoritev - spreminjanje	t
00030000-5630-f5dd-d4cf-3f7515fb5208	Vaja-read	Vaja - branje	t
00030000-5630-f5dd-9830-f650c96fe464	Vaja-write	Vaja - spreminjanje	t
00030000-5630-f5dd-b9e6-08aa9a7beedb	VrstaSedezev-read	VrstaSedezev - branje	t
00030000-5630-f5dd-3e4d-4dbb9258d062	VrstaSedezev-write	VrstaSedezev - spreminjanje	t
00030000-5630-f5dd-b141-a316d54b61ec	VrstaStroska-read	VrstaStroska - branje	t
00030000-5630-f5dd-3dfe-0e82b8c7f853	VrstaStroska-write	VrstaStroska - spreminjanje	t
00030000-5630-f5dd-8c03-7aee6ba6fb43	Zaposlitev-read	Zaposlitev - branje	t
00030000-5630-f5dd-4bd9-57c9ac50e987	Zaposlitev-write	Zaposlitev - spreminjanje	t
00030000-5630-f5dd-c327-cdf2fe08a534	Zasedenost-read	Zasedenost - branje	t
00030000-5630-f5dd-4325-2ee098cf2ed9	Zasedenost-write	Zasedenost - spreminjanje	t
00030000-5630-f5dd-068f-170a0262d4a8	ZvrstSurs-read	ZvrstSurs - branje	t
00030000-5630-f5dd-66f9-a3d2562b907b	ZvrstSurs-write	ZvrstSurs - spreminjanje	t
00030000-5630-f5dd-d556-eb320c95c47a	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	t
00030000-5630-f5dd-9721-52ae64587d76	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	t
00030000-5630-f5dd-8baf-e704dac7f490	Job-read	Branje opravil - samo zase - branje	t
00030000-5630-f5dd-d135-a44da3f78870	Job-write	Dodajanje in spreminjanje opravil - samo zase	t
00030000-5630-f5dd-d452-2fec1daf9a61	Job-admin	Upravljanje opravil za vse uporabnike	t
00030000-5630-f5dd-6d6c-a17f13589152	Mapa-write	Mapa - osnovno dovoljenje za pisanje	t
00030000-5630-f5dd-2ba4-62b0236709cb	Mapa-read	Mapa - osnovno dovoljenje za branje	t
00030000-5630-f5dd-ca67-fcf32c6ff2ee	MapaAcl-write	MapaAcl - dovoljenje za dostop pisanje ACL-jev mape	t
00030000-5630-f5dd-44c4-1399b2fff9e6	MapaAcl-read	MapaAcl - dovoljenje za dostop branje ACL-jev mape	t
00030000-5630-f5dd-9210-9d86903e70a1	Zapis-write	Zapis - dovoljenje za pisanje zapisov	t
00030000-5630-f5dd-c4fa-093e892e60f2	Zapis-read	Zapis - dovoljenje za pisanje zapisov	t
00030000-5630-f5dd-242f-a863e92ac0f7	ZapisLastnik-write	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	t
00030000-5630-f5dd-9324-4f5c87561df1	ZapisLastnik-read	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	t
00030000-5630-f5dd-925e-494a5d460c2a	VrstaZapisa-write	Šifrant vrst zapisa - spreminjanje	t
00030000-5630-f5dd-9dcd-beace259dceb	VrstaZapisa-read	Šifrant vrst zapisa - branje	t
00030000-5630-f5dd-07a3-a0db223b6588	Datoteka-write	Datoteka - spreminjanje	t
00030000-5630-f5dd-46a2-e66fefed8149	Datoteka-read	Datoteke - branje	t
\.


--
-- TOC entry 3064 (class 0 OID 23925710)
-- Dependencies: 180
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-5630-f5dd-9619-ace48df34acd	00030000-5630-f5dd-f498-bcc88337b62a
00020000-5630-f5dd-d9d9-e73fc60af3d0	00030000-5630-f5dd-c821-b2709c0d48f6
00020000-5630-f5dd-6272-7b0b357a68f8	00030000-5630-f5dd-de59-e72edcbef8fd
00020000-5630-f5dd-6272-7b0b357a68f8	00030000-5630-f5dd-701e-954c1b8d6e5d
00020000-5630-f5dd-6272-7b0b357a68f8	00030000-5630-f5dd-c2be-d24812221412
00020000-5630-f5dd-6272-7b0b357a68f8	00030000-5630-f5dd-31ea-70df53087aec
00020000-5630-f5dd-6272-7b0b357a68f8	00030000-5630-f5dd-9e2a-a2f7c9628235
00020000-5630-f5dd-6272-7b0b357a68f8	00030000-5630-f5dd-adf1-f7e53acd378e
00020000-5630-f5dd-6272-7b0b357a68f8	00030000-5630-f5dd-330f-fd638d977bef
00020000-5630-f5dd-6272-7b0b357a68f8	00030000-5630-f5dd-1db4-513441a81bc7
00020000-5630-f5dd-6272-7b0b357a68f8	00030000-5630-f5dd-c821-b2709c0d48f6
00020000-5630-f5dd-6272-7b0b357a68f8	00030000-5630-f5dd-0c39-6bb1be5cd69e
00020000-5630-f5dd-6272-7b0b357a68f8	00030000-5630-f5dd-a093-9d9585334b62
00020000-5630-f5dd-6272-7b0b357a68f8	00030000-5630-f5dd-16c4-dcd08acf4677
00020000-5630-f5dd-6272-7b0b357a68f8	00030000-5630-f5dd-ce2f-fcbfe2a6d934
00020000-5630-f5dd-6272-7b0b357a68f8	00030000-5630-f5dd-9a75-2f459f62ea8e
00020000-5630-f5dd-6272-7b0b357a68f8	00030000-5630-f5dd-acdf-587bbbd99ec2
00020000-5630-f5dd-6272-7b0b357a68f8	00030000-5630-f5dd-2235-eb920266ba0a
00020000-5630-f5dd-6272-7b0b357a68f8	00030000-5630-f5dd-dde1-829fd86f1cc8
00020000-5630-f5dd-6272-7b0b357a68f8	00030000-5630-f5dd-326a-43868cfa1aa1
00020000-5630-f5dd-6272-7b0b357a68f8	00030000-5630-f5dd-edb9-b354b730efdf
00020000-5630-f5dd-6272-7b0b357a68f8	00030000-5630-f5dd-4efe-b2188c5fbb6f
00020000-5630-f5dd-6272-7b0b357a68f8	00030000-5630-f5dd-b2ab-f5e6cf9a6000
00020000-5630-f5dd-6272-7b0b357a68f8	00030000-5630-f5dd-36cc-3ba8de5c9c7b
00020000-5630-f5dd-6272-7b0b357a68f8	00030000-5630-f5dd-a709-fb258c134d66
00020000-5630-f5dd-6272-7b0b357a68f8	00030000-5630-f5dd-94bf-31123d337a1a
00020000-5630-f5dd-6272-7b0b357a68f8	00030000-5630-f5dd-0960-9569477cd734
00020000-5630-f5dd-6272-7b0b357a68f8	00030000-5630-f5dd-7786-7fa0d7db0dae
00020000-5630-f5dd-6272-7b0b357a68f8	00030000-5630-f5dd-3d6e-1cabefba00e9
00020000-5630-f5dd-6272-7b0b357a68f8	00030000-5630-f5dd-6370-c974a6dfa82b
00020000-5630-f5dd-6272-7b0b357a68f8	00030000-5630-f5dd-4993-3df75b580357
00020000-5630-f5dd-6272-7b0b357a68f8	00030000-5630-f5dd-f0a7-a5eb174c271f
00020000-5630-f5dd-6272-7b0b357a68f8	00030000-5630-f5dd-c660-94e54f7e0d32
00020000-5630-f5dd-6272-7b0b357a68f8	00030000-5630-f5dd-51b7-7dc7436cb497
00020000-5630-f5dd-6272-7b0b357a68f8	00030000-5630-f5dd-62ee-9942722ef851
00020000-5630-f5dd-6272-7b0b357a68f8	00030000-5630-f5dd-c5f3-a6fd617d9125
00020000-5630-f5dd-6272-7b0b357a68f8	00030000-5630-f5dd-d486-3905bb35de6c
00020000-5630-f5dd-6272-7b0b357a68f8	00030000-5630-f5dd-5f31-c22ce5a7c345
00020000-5630-f5dd-6272-7b0b357a68f8	00030000-5630-f5dd-82cd-e6f25c114b85
00020000-5630-f5dd-6272-7b0b357a68f8	00030000-5630-f5dd-2fcb-6381b1874db1
00020000-5630-f5dd-6272-7b0b357a68f8	00030000-5630-f5dd-511c-36f594b48904
00020000-5630-f5dd-6272-7b0b357a68f8	00030000-5630-f5dd-b3c8-ed8ad3da017e
00020000-5630-f5dd-6272-7b0b357a68f8	00030000-5630-f5dd-bf5b-5d911b9cc764
00020000-5630-f5dd-6272-7b0b357a68f8	00030000-5630-f5dd-6c88-541d57b5e589
00020000-5630-f5dd-6272-7b0b357a68f8	00030000-5630-f5dd-8ef6-d46544978ace
00020000-5630-f5dd-6272-7b0b357a68f8	00030000-5630-f5dd-d4cf-3f7515fb5208
00020000-5630-f5dd-6272-7b0b357a68f8	00030000-5630-f5dd-9830-f650c96fe464
00020000-5630-f5dd-6272-7b0b357a68f8	00030000-5630-f5dd-c327-cdf2fe08a534
00020000-5630-f5dd-6272-7b0b357a68f8	00030000-5630-f5dd-4325-2ee098cf2ed9
00020000-5630-f5dd-6272-7b0b357a68f8	00030000-5630-f5dd-068f-170a0262d4a8
00020000-5630-f5dd-6272-7b0b357a68f8	00030000-5630-f5dd-d556-eb320c95c47a
00020000-5630-f5dd-c36d-8dd0e2c269e1	00030000-5630-f5dd-de59-e72edcbef8fd
00020000-5630-f5dd-c36d-8dd0e2c269e1	00030000-5630-f5dd-9e2a-a2f7c9628235
00020000-5630-f5dd-c36d-8dd0e2c269e1	00030000-5630-f5dd-adf1-f7e53acd378e
00020000-5630-f5dd-c36d-8dd0e2c269e1	00030000-5630-f5dd-c821-b2709c0d48f6
00020000-5630-f5dd-c36d-8dd0e2c269e1	00030000-5630-f5dd-ce2f-fcbfe2a6d934
00020000-5630-f5dd-c36d-8dd0e2c269e1	00030000-5630-f5dd-acdf-587bbbd99ec2
00020000-5630-f5dd-c36d-8dd0e2c269e1	00030000-5630-f5dd-dde1-829fd86f1cc8
00020000-5630-f5dd-c36d-8dd0e2c269e1	00030000-5630-f5dd-326a-43868cfa1aa1
00020000-5630-f5dd-c36d-8dd0e2c269e1	00030000-5630-f5dd-edb9-b354b730efdf
00020000-5630-f5dd-c36d-8dd0e2c269e1	00030000-5630-f5dd-4efe-b2188c5fbb6f
00020000-5630-f5dd-c36d-8dd0e2c269e1	00030000-5630-f5dd-b2ab-f5e6cf9a6000
00020000-5630-f5dd-c36d-8dd0e2c269e1	00030000-5630-f5dd-36cc-3ba8de5c9c7b
00020000-5630-f5dd-c36d-8dd0e2c269e1	00030000-5630-f5dd-a709-fb258c134d66
00020000-5630-f5dd-c36d-8dd0e2c269e1	00030000-5630-f5dd-0960-9569477cd734
00020000-5630-f5dd-c36d-8dd0e2c269e1	00030000-5630-f5dd-3d6e-1cabefba00e9
00020000-5630-f5dd-c36d-8dd0e2c269e1	00030000-5630-f5dd-6370-c974a6dfa82b
00020000-5630-f5dd-c36d-8dd0e2c269e1	00030000-5630-f5dd-4993-3df75b580357
00020000-5630-f5dd-c36d-8dd0e2c269e1	00030000-5630-f5dd-62ee-9942722ef851
00020000-5630-f5dd-c36d-8dd0e2c269e1	00030000-5630-f5dd-d486-3905bb35de6c
00020000-5630-f5dd-c36d-8dd0e2c269e1	00030000-5630-f5dd-82cd-e6f25c114b85
00020000-5630-f5dd-c36d-8dd0e2c269e1	00030000-5630-f5dd-511c-36f594b48904
00020000-5630-f5dd-c36d-8dd0e2c269e1	00030000-5630-f5dd-098c-eb62db23bf75
00020000-5630-f5dd-c36d-8dd0e2c269e1	00030000-5630-f5dd-5d76-0a7433422a59
00020000-5630-f5dd-c36d-8dd0e2c269e1	00030000-5630-f5dd-d39d-2bc0df8607a0
00020000-5630-f5dd-c36d-8dd0e2c269e1	00030000-5630-f5dd-df82-3436e243beae
00020000-5630-f5dd-c36d-8dd0e2c269e1	00030000-5630-f5dd-8c03-7aee6ba6fb43
00020000-5630-f5dd-c36d-8dd0e2c269e1	00030000-5630-f5dd-4bd9-57c9ac50e987
00020000-5630-f5dd-c36d-8dd0e2c269e1	00030000-5630-f5dd-068f-170a0262d4a8
00020000-5630-f5dd-c36d-8dd0e2c269e1	00030000-5630-f5dd-d556-eb320c95c47a
00020000-5630-f5dd-02d3-a4b59dceccd6	00030000-5630-f5dd-de59-e72edcbef8fd
00020000-5630-f5dd-02d3-a4b59dceccd6	00030000-5630-f5dd-c2be-d24812221412
00020000-5630-f5dd-02d3-a4b59dceccd6	00030000-5630-f5dd-9e2a-a2f7c9628235
00020000-5630-f5dd-02d3-a4b59dceccd6	00030000-5630-f5dd-9c9c-e3216b3a89b4
00020000-5630-f5dd-02d3-a4b59dceccd6	00030000-5630-f5dd-0acc-6e6787623078
00020000-5630-f5dd-02d3-a4b59dceccd6	00030000-5630-f5dd-bf5b-87312801d810
00020000-5630-f5dd-02d3-a4b59dceccd6	00030000-5630-f5dd-adf1-f7e53acd378e
00020000-5630-f5dd-02d3-a4b59dceccd6	00030000-5630-f5dd-c821-b2709c0d48f6
00020000-5630-f5dd-02d3-a4b59dceccd6	00030000-5630-f5dd-a093-9d9585334b62
00020000-5630-f5dd-02d3-a4b59dceccd6	00030000-5630-f5dd-ce2f-fcbfe2a6d934
00020000-5630-f5dd-02d3-a4b59dceccd6	00030000-5630-f5dd-acdf-587bbbd99ec2
00020000-5630-f5dd-02d3-a4b59dceccd6	00030000-5630-f5dd-dde1-829fd86f1cc8
00020000-5630-f5dd-02d3-a4b59dceccd6	00030000-5630-f5dd-edb9-b354b730efdf
00020000-5630-f5dd-02d3-a4b59dceccd6	00030000-5630-f5dd-4efe-b2188c5fbb6f
00020000-5630-f5dd-02d3-a4b59dceccd6	00030000-5630-f5dd-b2ab-f5e6cf9a6000
00020000-5630-f5dd-02d3-a4b59dceccd6	00030000-5630-f5dd-a709-fb258c134d66
00020000-5630-f5dd-02d3-a4b59dceccd6	00030000-5630-f5dd-0960-9569477cd734
00020000-5630-f5dd-02d3-a4b59dceccd6	00030000-5630-f5dd-4993-3df75b580357
00020000-5630-f5dd-02d3-a4b59dceccd6	00030000-5630-f5dd-c660-94e54f7e0d32
00020000-5630-f5dd-02d3-a4b59dceccd6	00030000-5630-f5dd-62ee-9942722ef851
00020000-5630-f5dd-02d3-a4b59dceccd6	00030000-5630-f5dd-d486-3905bb35de6c
00020000-5630-f5dd-02d3-a4b59dceccd6	00030000-5630-f5dd-82cd-e6f25c114b85
00020000-5630-f5dd-02d3-a4b59dceccd6	00030000-5630-f5dd-511c-36f594b48904
00020000-5630-f5dd-02d3-a4b59dceccd6	00030000-5630-f5dd-bf5b-5d911b9cc764
00020000-5630-f5dd-02d3-a4b59dceccd6	00030000-5630-f5dd-d4cf-3f7515fb5208
00020000-5630-f5dd-02d3-a4b59dceccd6	00030000-5630-f5dd-c327-cdf2fe08a534
00020000-5630-f5dd-02d3-a4b59dceccd6	00030000-5630-f5dd-068f-170a0262d4a8
00020000-5630-f5dd-02d3-a4b59dceccd6	00030000-5630-f5dd-d556-eb320c95c47a
00020000-5630-f5dd-81c2-c7e4e6fef001	00030000-5630-f5dd-de59-e72edcbef8fd
00020000-5630-f5dd-81c2-c7e4e6fef001	00030000-5630-f5dd-701e-954c1b8d6e5d
00020000-5630-f5dd-81c2-c7e4e6fef001	00030000-5630-f5dd-31ea-70df53087aec
00020000-5630-f5dd-81c2-c7e4e6fef001	00030000-5630-f5dd-9e2a-a2f7c9628235
00020000-5630-f5dd-81c2-c7e4e6fef001	00030000-5630-f5dd-adf1-f7e53acd378e
00020000-5630-f5dd-81c2-c7e4e6fef001	00030000-5630-f5dd-c821-b2709c0d48f6
00020000-5630-f5dd-81c2-c7e4e6fef001	00030000-5630-f5dd-ce2f-fcbfe2a6d934
00020000-5630-f5dd-81c2-c7e4e6fef001	00030000-5630-f5dd-acdf-587bbbd99ec2
00020000-5630-f5dd-81c2-c7e4e6fef001	00030000-5630-f5dd-edb9-b354b730efdf
00020000-5630-f5dd-81c2-c7e4e6fef001	00030000-5630-f5dd-4efe-b2188c5fbb6f
00020000-5630-f5dd-81c2-c7e4e6fef001	00030000-5630-f5dd-a709-fb258c134d66
00020000-5630-f5dd-81c2-c7e4e6fef001	00030000-5630-f5dd-0960-9569477cd734
00020000-5630-f5dd-81c2-c7e4e6fef001	00030000-5630-f5dd-4993-3df75b580357
00020000-5630-f5dd-81c2-c7e4e6fef001	00030000-5630-f5dd-62ee-9942722ef851
00020000-5630-f5dd-81c2-c7e4e6fef001	00030000-5630-f5dd-d486-3905bb35de6c
00020000-5630-f5dd-81c2-c7e4e6fef001	00030000-5630-f5dd-82cd-e6f25c114b85
00020000-5630-f5dd-81c2-c7e4e6fef001	00030000-5630-f5dd-511c-36f594b48904
00020000-5630-f5dd-81c2-c7e4e6fef001	00030000-5630-f5dd-bf5b-5d911b9cc764
00020000-5630-f5dd-81c2-c7e4e6fef001	00030000-5630-f5dd-068f-170a0262d4a8
00020000-5630-f5dd-81c2-c7e4e6fef001	00030000-5630-f5dd-d556-eb320c95c47a
00020000-5630-f5dd-7b7b-06c4d0ed7d7b	00030000-5630-f5dd-de59-e72edcbef8fd
00020000-5630-f5dd-7b7b-06c4d0ed7d7b	00030000-5630-f5dd-9e2a-a2f7c9628235
00020000-5630-f5dd-7b7b-06c4d0ed7d7b	00030000-5630-f5dd-adf1-f7e53acd378e
00020000-5630-f5dd-7b7b-06c4d0ed7d7b	00030000-5630-f5dd-c821-b2709c0d48f6
00020000-5630-f5dd-7b7b-06c4d0ed7d7b	00030000-5630-f5dd-ce2f-fcbfe2a6d934
00020000-5630-f5dd-7b7b-06c4d0ed7d7b	00030000-5630-f5dd-acdf-587bbbd99ec2
00020000-5630-f5dd-7b7b-06c4d0ed7d7b	00030000-5630-f5dd-edb9-b354b730efdf
00020000-5630-f5dd-7b7b-06c4d0ed7d7b	00030000-5630-f5dd-4efe-b2188c5fbb6f
00020000-5630-f5dd-7b7b-06c4d0ed7d7b	00030000-5630-f5dd-a709-fb258c134d66
00020000-5630-f5dd-7b7b-06c4d0ed7d7b	00030000-5630-f5dd-0960-9569477cd734
00020000-5630-f5dd-7b7b-06c4d0ed7d7b	00030000-5630-f5dd-4993-3df75b580357
00020000-5630-f5dd-7b7b-06c4d0ed7d7b	00030000-5630-f5dd-62ee-9942722ef851
00020000-5630-f5dd-7b7b-06c4d0ed7d7b	00030000-5630-f5dd-d486-3905bb35de6c
00020000-5630-f5dd-7b7b-06c4d0ed7d7b	00030000-5630-f5dd-82cd-e6f25c114b85
00020000-5630-f5dd-7b7b-06c4d0ed7d7b	00030000-5630-f5dd-511c-36f594b48904
00020000-5630-f5dd-7b7b-06c4d0ed7d7b	00030000-5630-f5dd-5eb7-23960bf0bc01
00020000-5630-f5dd-7b7b-06c4d0ed7d7b	00030000-5630-f5dd-b1a2-c76bf82b00aa
00020000-5630-f5dd-7b7b-06c4d0ed7d7b	00030000-5630-f5dd-bf5b-5d911b9cc764
00020000-5630-f5dd-7b7b-06c4d0ed7d7b	00030000-5630-f5dd-068f-170a0262d4a8
00020000-5630-f5dd-7b7b-06c4d0ed7d7b	00030000-5630-f5dd-d556-eb320c95c47a
00020000-5630-f5df-cd22-5e309fda0720	00030000-5630-f5dd-907f-b47bc53e6625
00020000-5630-f5df-cd22-5e309fda0720	00030000-5630-f5dd-f498-bcc88337b62a
00020000-5630-f5df-cd22-5e309fda0720	00030000-5630-f5dd-de59-e72edcbef8fd
00020000-5630-f5df-cd22-5e309fda0720	00030000-5630-f5dd-701e-954c1b8d6e5d
00020000-5630-f5df-cd22-5e309fda0720	00030000-5630-f5dd-c2be-d24812221412
00020000-5630-f5df-cd22-5e309fda0720	00030000-5630-f5dd-31ea-70df53087aec
00020000-5630-f5df-cd22-5e309fda0720	00030000-5630-f5dd-9e2a-a2f7c9628235
00020000-5630-f5df-cd22-5e309fda0720	00030000-5630-f5dd-9c9c-e3216b3a89b4
00020000-5630-f5df-cd22-5e309fda0720	00030000-5630-f5dd-dc17-65281c3ab8d8
00020000-5630-f5df-cd22-5e309fda0720	00030000-5630-f5dd-4f98-39eb336147fd
00020000-5630-f5df-cd22-5e309fda0720	00030000-5630-f5dd-0acc-6e6787623078
00020000-5630-f5df-cd22-5e309fda0720	00030000-5630-f5dd-8194-351707c4f209
00020000-5630-f5df-cd22-5e309fda0720	00030000-5630-f5dd-bf5b-87312801d810
00020000-5630-f5df-cd22-5e309fda0720	00030000-5630-f5dd-cf51-dd3605b00f74
00020000-5630-f5df-cd22-5e309fda0720	00030000-5630-f5dd-adf1-f7e53acd378e
00020000-5630-f5df-cd22-5e309fda0720	00030000-5630-f5dd-330f-fd638d977bef
00020000-5630-f5df-cd22-5e309fda0720	00030000-5630-f5dd-1db4-513441a81bc7
00020000-5630-f5df-cd22-5e309fda0720	00030000-5630-f5dd-c4b7-87803348a256
00020000-5630-f5df-cd22-5e309fda0720	00030000-5630-f5dd-e24a-038642152ebc
00020000-5630-f5df-cd22-5e309fda0720	00030000-5630-f5dd-c821-b2709c0d48f6
00020000-5630-f5df-cd22-5e309fda0720	00030000-5630-f5dd-0c39-6bb1be5cd69e
00020000-5630-f5df-cd22-5e309fda0720	00030000-5630-f5dd-2920-d3bba16560ba
00020000-5630-f5df-cd22-5e309fda0720	00030000-5630-f5dd-0ec2-66505d72b355
00020000-5630-f5df-cd22-5e309fda0720	00030000-5630-f5dd-a093-9d9585334b62
00020000-5630-f5df-cd22-5e309fda0720	00030000-5630-f5dd-16c4-dcd08acf4677
00020000-5630-f5df-cd22-5e309fda0720	00030000-5630-f5dd-ce2f-fcbfe2a6d934
00020000-5630-f5df-cd22-5e309fda0720	00030000-5630-f5dd-9a75-2f459f62ea8e
00020000-5630-f5df-cd22-5e309fda0720	00030000-5630-f5dd-acdf-587bbbd99ec2
00020000-5630-f5df-cd22-5e309fda0720	00030000-5630-f5dd-2235-eb920266ba0a
00020000-5630-f5df-cd22-5e309fda0720	00030000-5630-f5dd-dde1-829fd86f1cc8
00020000-5630-f5df-cd22-5e309fda0720	00030000-5630-f5dd-326a-43868cfa1aa1
00020000-5630-f5df-cd22-5e309fda0720	00030000-5630-f5dd-d9dd-d27fd43d9451
00020000-5630-f5df-cd22-5e309fda0720	00030000-5630-f5dd-98e5-5dbddd213596
00020000-5630-f5df-cd22-5e309fda0720	00030000-5630-f5dd-9607-7e433b927ea9
00020000-5630-f5df-cd22-5e309fda0720	00030000-5630-f5dd-d863-e06e225b3d59
00020000-5630-f5df-cd22-5e309fda0720	00030000-5630-f5dd-edb9-b354b730efdf
00020000-5630-f5df-cd22-5e309fda0720	00030000-5630-f5dd-4efe-b2188c5fbb6f
00020000-5630-f5df-cd22-5e309fda0720	00030000-5630-f5dd-15ef-4db96d606001
00020000-5630-f5df-cd22-5e309fda0720	00030000-5630-f5dd-b46a-8f2446889c14
00020000-5630-f5df-cd22-5e309fda0720	00030000-5630-f5dd-b49a-7fd20d68cd5f
00020000-5630-f5df-cd22-5e309fda0720	00030000-5630-f5dd-afe5-17563c198bd2
00020000-5630-f5df-cd22-5e309fda0720	00030000-5630-f5dd-b2ab-f5e6cf9a6000
00020000-5630-f5df-cd22-5e309fda0720	00030000-5630-f5dd-0927-fc6450fe120f
00020000-5630-f5df-cd22-5e309fda0720	00030000-5630-f5dd-36cc-3ba8de5c9c7b
00020000-5630-f5df-cd22-5e309fda0720	00030000-5630-f5dd-27b0-8087ecd27b71
00020000-5630-f5df-cd22-5e309fda0720	00030000-5630-f5dd-11bb-4df7ca87babe
00020000-5630-f5df-cd22-5e309fda0720	00030000-5630-f5dd-cd96-3a11f46953b2
00020000-5630-f5df-cd22-5e309fda0720	00030000-5630-f5dd-3db4-3aa3715b062f
00020000-5630-f5df-cd22-5e309fda0720	00030000-5630-f5dd-129b-1294c4b878f1
00020000-5630-f5df-cd22-5e309fda0720	00030000-5630-f5dd-f802-f42f0f83f5f4
00020000-5630-f5df-cd22-5e309fda0720	00030000-5630-f5dd-a709-fb258c134d66
00020000-5630-f5df-cd22-5e309fda0720	00030000-5630-f5dd-94bf-31123d337a1a
00020000-5630-f5df-cd22-5e309fda0720	00030000-5630-f5dd-0960-9569477cd734
00020000-5630-f5df-cd22-5e309fda0720	00030000-5630-f5dd-090a-ef5ce71313fc
00020000-5630-f5df-cd22-5e309fda0720	00030000-5630-f5dd-fe2e-1445e01dc56d
00020000-5630-f5df-cd22-5e309fda0720	00030000-5630-f5dd-6f57-d581cc7bd4ba
00020000-5630-f5df-cd22-5e309fda0720	00030000-5630-f5dd-54e3-ab768daa3a62
00020000-5630-f5df-cd22-5e309fda0720	00030000-5630-f5dd-7786-7fa0d7db0dae
00020000-5630-f5df-cd22-5e309fda0720	00030000-5630-f5dd-3d6e-1cabefba00e9
00020000-5630-f5df-cd22-5e309fda0720	00030000-5630-f5dd-6370-c974a6dfa82b
00020000-5630-f5df-cd22-5e309fda0720	00030000-5630-f5dd-bf25-6019901c740e
00020000-5630-f5df-cd22-5e309fda0720	00030000-5630-f5dd-db78-03b00a6e0a3d
00020000-5630-f5df-cd22-5e309fda0720	00030000-5630-f5dd-4993-3df75b580357
00020000-5630-f5df-cd22-5e309fda0720	00030000-5630-f5dd-f0a7-a5eb174c271f
00020000-5630-f5df-cd22-5e309fda0720	00030000-5630-f5dd-d76f-5471bb2bc766
00020000-5630-f5df-cd22-5e309fda0720	00030000-5630-f5dd-ccb6-6134fa0ec158
00020000-5630-f5df-cd22-5e309fda0720	00030000-5630-f5dd-0ab9-9a15d8f424a6
00020000-5630-f5df-cd22-5e309fda0720	00030000-5630-f5dd-e6a0-2814d760ee6d
00020000-5630-f5df-cd22-5e309fda0720	00030000-5630-f5dd-c660-94e54f7e0d32
00020000-5630-f5df-cd22-5e309fda0720	00030000-5630-f5dd-51b7-7dc7436cb497
00020000-5630-f5df-cd22-5e309fda0720	00030000-5630-f5dd-a184-1a7e1c3315f7
00020000-5630-f5df-cd22-5e309fda0720	00030000-5630-f5dd-529d-39f08f4bde86
00020000-5630-f5df-cd22-5e309fda0720	00030000-5630-f5dd-542d-27e1a1a398db
00020000-5630-f5df-cd22-5e309fda0720	00030000-5630-f5dd-4b58-3493a3703892
00020000-5630-f5df-cd22-5e309fda0720	00030000-5630-f5dd-8e77-9e9abce4ea3e
00020000-5630-f5df-cd22-5e309fda0720	00030000-5630-f5dd-4fd6-32b70149df1d
00020000-5630-f5df-cd22-5e309fda0720	00030000-5630-f5dd-3ce2-76c12b2db233
00020000-5630-f5df-cd22-5e309fda0720	00030000-5630-f5dd-1104-e92967461f54
00020000-5630-f5df-cd22-5e309fda0720	00030000-5630-f5dd-5e15-4c57cfef65b2
00020000-5630-f5df-cd22-5e309fda0720	00030000-5630-f5dd-dbd4-679e5d0d58f3
00020000-5630-f5df-cd22-5e309fda0720	00030000-5630-f5dd-de99-ccc0fdc40789
00020000-5630-f5df-cd22-5e309fda0720	00030000-5630-f5dd-0749-ef4379636c07
00020000-5630-f5df-cd22-5e309fda0720	00030000-5630-f5dd-7ea4-8923b2118926
00020000-5630-f5df-cd22-5e309fda0720	00030000-5630-f5dd-b366-cf134d109caf
00020000-5630-f5df-cd22-5e309fda0720	00030000-5630-f5dd-8a38-c1d81c907b4c
00020000-5630-f5df-cd22-5e309fda0720	00030000-5630-f5dd-674b-44900d2d7068
00020000-5630-f5df-cd22-5e309fda0720	00030000-5630-f5dd-421a-0df233bfa68d
00020000-5630-f5df-cd22-5e309fda0720	00030000-5630-f5dd-41fd-48aa0822174e
00020000-5630-f5df-cd22-5e309fda0720	00030000-5630-f5dd-6965-29b510a0fe40
00020000-5630-f5df-cd22-5e309fda0720	00030000-5630-f5dd-c276-3c9ed5c4261d
00020000-5630-f5df-cd22-5e309fda0720	00030000-5630-f5dd-38c9-41955e476709
00020000-5630-f5df-cd22-5e309fda0720	00030000-5630-f5dd-bcdc-2e72ed1bc586
00020000-5630-f5df-cd22-5e309fda0720	00030000-5630-f5dd-62ee-9942722ef851
00020000-5630-f5df-cd22-5e309fda0720	00030000-5630-f5dd-c5f3-a6fd617d9125
00020000-5630-f5df-cd22-5e309fda0720	00030000-5630-f5dd-82c1-c566f6866283
00020000-5630-f5df-cd22-5e309fda0720	00030000-5630-f5dd-78f0-098f93807845
00020000-5630-f5df-cd22-5e309fda0720	00030000-5630-f5dd-bc8c-991f0878c80d
00020000-5630-f5df-cd22-5e309fda0720	00030000-5630-f5dd-04d6-5fa8e83eb74b
00020000-5630-f5df-cd22-5e309fda0720	00030000-5630-f5dd-d486-3905bb35de6c
00020000-5630-f5df-cd22-5e309fda0720	00030000-5630-f5dd-5f31-c22ce5a7c345
00020000-5630-f5df-cd22-5e309fda0720	00030000-5630-f5dd-82cd-e6f25c114b85
00020000-5630-f5df-cd22-5e309fda0720	00030000-5630-f5dd-2fcb-6381b1874db1
00020000-5630-f5df-cd22-5e309fda0720	00030000-5630-f5dd-54ca-7780627cc93f
00020000-5630-f5df-cd22-5e309fda0720	00030000-5630-f5dd-5b1c-981fd1b04176
00020000-5630-f5df-cd22-5e309fda0720	00030000-5630-f5dd-b26e-16183a96ba68
00020000-5630-f5df-cd22-5e309fda0720	00030000-5630-f5dd-6ad3-62f0765bba10
00020000-5630-f5df-cd22-5e309fda0720	00030000-5630-f5dd-e5c6-6e7b8a2ecc8d
00020000-5630-f5df-cd22-5e309fda0720	00030000-5630-f5dd-3b37-4d01015c829a
00020000-5630-f5df-cd22-5e309fda0720	00030000-5630-f5dd-c0e5-76d01ba861a2
00020000-5630-f5df-cd22-5e309fda0720	00030000-5630-f5dd-258e-f3fe309a6d02
00020000-5630-f5df-cd22-5e309fda0720	00030000-5630-f5dd-511c-36f594b48904
00020000-5630-f5df-cd22-5e309fda0720	00030000-5630-f5dd-b3c8-ed8ad3da017e
00020000-5630-f5df-cd22-5e309fda0720	00030000-5630-f5dd-2f31-5edeeb763076
00020000-5630-f5df-cd22-5e309fda0720	00030000-5630-f5dd-2b4d-cc2e98e75193
00020000-5630-f5df-cd22-5e309fda0720	00030000-5630-f5dd-ef15-5032f0454de5
00020000-5630-f5df-cd22-5e309fda0720	00030000-5630-f5dd-2b3c-ab20b7d97400
00020000-5630-f5df-cd22-5e309fda0720	00030000-5630-f5dd-037f-4fb295725e24
00020000-5630-f5df-cd22-5e309fda0720	00030000-5630-f5dd-3ea3-913f6b8b4a8f
00020000-5630-f5df-cd22-5e309fda0720	00030000-5630-f5dd-9bf1-9f3aab921b86
00020000-5630-f5df-cd22-5e309fda0720	00030000-5630-f5dd-4f05-d961a08dcf86
00020000-5630-f5df-cd22-5e309fda0720	00030000-5630-f5dd-098c-eb62db23bf75
00020000-5630-f5df-cd22-5e309fda0720	00030000-5630-f5dd-5d76-0a7433422a59
00020000-5630-f5df-cd22-5e309fda0720	00030000-5630-f5dd-5eb7-23960bf0bc01
00020000-5630-f5df-cd22-5e309fda0720	00030000-5630-f5dd-b1a2-c76bf82b00aa
00020000-5630-f5df-cd22-5e309fda0720	00030000-5630-f5dd-ab0a-e11fb959bc56
00020000-5630-f5df-cd22-5e309fda0720	00030000-5630-f5dd-bf5b-5d911b9cc764
00020000-5630-f5df-cd22-5e309fda0720	00030000-5630-f5dd-4a41-d8fc732603bb
00020000-5630-f5df-cd22-5e309fda0720	00030000-5630-f5dd-b411-21643405aa12
00020000-5630-f5df-cd22-5e309fda0720	00030000-5630-f5dd-cbb3-c5c11e4b1206
00020000-5630-f5df-cd22-5e309fda0720	00030000-5630-f5dd-107a-981dbb5bc52d
00020000-5630-f5df-cd22-5e309fda0720	00030000-5630-f5dd-c474-8200e09c3404
00020000-5630-f5df-cd22-5e309fda0720	00030000-5630-f5dd-222e-1a78e643b189
00020000-5630-f5df-cd22-5e309fda0720	00030000-5630-f5dd-d21e-5ba8f6788fe8
00020000-5630-f5df-cd22-5e309fda0720	00030000-5630-f5dd-d39d-2bc0df8607a0
00020000-5630-f5df-cd22-5e309fda0720	00030000-5630-f5dd-df82-3436e243beae
00020000-5630-f5df-cd22-5e309fda0720	00030000-5630-f5dd-6c88-541d57b5e589
00020000-5630-f5df-cd22-5e309fda0720	00030000-5630-f5dd-8ef6-d46544978ace
00020000-5630-f5df-cd22-5e309fda0720	00030000-5630-f5dd-d4cf-3f7515fb5208
00020000-5630-f5df-cd22-5e309fda0720	00030000-5630-f5dd-9830-f650c96fe464
00020000-5630-f5df-cd22-5e309fda0720	00030000-5630-f5dd-b9e6-08aa9a7beedb
00020000-5630-f5df-cd22-5e309fda0720	00030000-5630-f5dd-3e4d-4dbb9258d062
00020000-5630-f5df-cd22-5e309fda0720	00030000-5630-f5dd-b141-a316d54b61ec
00020000-5630-f5df-cd22-5e309fda0720	00030000-5630-f5dd-3dfe-0e82b8c7f853
00020000-5630-f5df-cd22-5e309fda0720	00030000-5630-f5dd-8c03-7aee6ba6fb43
00020000-5630-f5df-cd22-5e309fda0720	00030000-5630-f5dd-4bd9-57c9ac50e987
00020000-5630-f5df-cd22-5e309fda0720	00030000-5630-f5dd-c327-cdf2fe08a534
00020000-5630-f5df-cd22-5e309fda0720	00030000-5630-f5dd-4325-2ee098cf2ed9
00020000-5630-f5df-cd22-5e309fda0720	00030000-5630-f5dd-068f-170a0262d4a8
00020000-5630-f5df-cd22-5e309fda0720	00030000-5630-f5dd-66f9-a3d2562b907b
00020000-5630-f5df-cd22-5e309fda0720	00030000-5630-f5dd-d556-eb320c95c47a
00020000-5630-f5df-cd22-5e309fda0720	00030000-5630-f5dd-9721-52ae64587d76
\.


--
-- TOC entry 3098 (class 0 OID 23926085)
-- Dependencies: 214
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 3102 (class 0 OID 23926119)
-- Dependencies: 218
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 3114 (class 0 OID 23926256)
-- Dependencies: 230
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, zacetek, konec, jeavtorskepravice, placilonavajo, vrednostvaje, planiranostevilovaj, vrednostvaj, vrednostpredstave, procentodinkasa, jeprocentodinkasa, vrednostdopremiere, zaposlenvdrjz, samozaposlen, igralec, opis) FROM stdin;
000b0000-5630-f5df-30e0-ed4dcf6e80f1	00090000-5630-f5df-31a4-547194cba85c	\N	\N	0001	\N	\N	f	f	10.00	3	10.00	30.00	0.00	f	10.00	t	f	t	Pogodba o sodelovanju
000b0000-5630-f5df-a04f-038267ffc29f	00090000-5630-f5df-509f-30a0ca58bf12	\N	\N	0002	\N	\N	f	t	11.00	10	11.00	31.00	0.00	f	110.00	f	t	t	Pogodba za vlogo Helena
000b0000-5630-f5df-6178-1382c2222826	00090000-5630-f5df-9d0d-9a62dfb549c7	\N	\N	0003	\N	\N	f	f	12.00	4	12.00	0.00	0.00	f	12.00	f	t	f	Pogodba za lektoriranje
000b0000-5630-f5df-507a-92d770a5524a	00090000-5630-f5df-ebff-d3ae3fe5fb21	\N	\N	0004	\N	\N	t	f	0.00	2	300.00	0.00	0.00	f	300.00	f	t	f	Pogodba za avtorske pravice
\.


--
-- TOC entry 3070 (class 0 OID 23925783)
-- Dependencies: 186
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, tipkli_id, drzava_id, sifra, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo, nvo) FROM stdin;
00080000-5630-f5df-2772-a65b13efa9c3	\N	00040000-5630-f5dd-f6d3-04539478d8be	0988	AK	Juhuhu d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5630-f5df-e06c-2ffddf410943	\N	00040000-5630-f5dd-f6d3-04539478d8be	0989	AK	Hopsasa d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	t
00080000-5630-f5df-5925-b7936d6d7e6d	\N	00040000-5630-f5dd-f6d3-04539478d8be	0987	AK	Gledališče Šrum d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5630-f5df-39c2-15127b93e0c4	\N	00040000-5630-f5dd-f6d3-04539478d8be	0986	AK	Lutkovni Direndaj d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5630-f5df-87c6-40978c2e91ba	\N	00040000-5630-f5dd-f6d3-04539478d8be	0985	AK	Tatjana Stanič, Lektoriranje, s.p.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5630-f5df-999c-00ae4ab052e3	\N	00040000-5630-f5dd-e0ab-5078edefbb0a	0984	AK	Gledališče Lepote tvoje		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5630-f5df-5b75-a9791763e64d	\N	00040000-5630-f5dd-3827-b72ca8b3525b	0983	AK	Sunce naše		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5630-f5df-1d9b-9152975f0942	\N	00040000-5630-f5dd-a64d-ada5badb3ff5	0982	AK	Theater Amadeus		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5630-f5df-3d02-3686aa486895	\N	00040000-5630-f5dd-2b55-811c1666fda7	9999	AK	Fuchs		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5630-f5e1-838f-2c7ef68651d7	\N	00040000-5630-f5dd-f6d3-04539478d8be	1001	AK	Gledališče Matica		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
\.


--
-- TOC entry 3073 (class 0 OID 23925828)
-- Dependencies: 189
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-5630-f5dc-a019-12b3a099c027	8341	Adlešiči
00050000-5630-f5dc-1f54-1b5979dd1f4c	5270	Ajdovščina
00050000-5630-f5dc-5d43-84537b0acecc	6280	Ankaran/Ancarano
00050000-5630-f5dc-c042-f64e920d26fd	9253	Apače
00050000-5630-f5dc-b9c5-5ee6fed0fb2a	8253	Artiče
00050000-5630-f5dc-e396-7ae4a2dc9b4e	4275	Begunje na Gorenjskem
00050000-5630-f5dc-a60a-8e1c86e54ae6	1382	Begunje pri Cerknici
00050000-5630-f5dc-13ac-a3bdb2bd92c3	9231	Beltinci
00050000-5630-f5dc-fef4-f523036fa309	2234	Benedikt
00050000-5630-f5dc-7733-9477cd4eeffa	2345	Bistrica ob Dravi
00050000-5630-f5dc-dbb5-cec560899f11	3256	Bistrica ob Sotli
00050000-5630-f5dc-b425-40d37ed346bb	8259	Bizeljsko
00050000-5630-f5dc-6192-4d741662672f	1223	Blagovica
00050000-5630-f5dc-166b-85444c2e4582	8283	Blanca
00050000-5630-f5dc-9e86-9b8d194feeda	4260	Bled
00050000-5630-f5dc-43fb-ba60ce8d03a3	4273	Blejska Dobrava
00050000-5630-f5dc-3c4e-e5b60a29bf46	9265	Bodonci
00050000-5630-f5dc-62db-6febdb99c0d2	9222	Bogojina
00050000-5630-f5dc-2f4e-9e029cbf823a	4263	Bohinjska Bela
00050000-5630-f5dc-518a-328d1d9fe7a5	4264	Bohinjska Bistrica
00050000-5630-f5dc-f064-4548d4ba431b	4265	Bohinjsko jezero
00050000-5630-f5dc-307d-58e6a1786929	1353	Borovnica
00050000-5630-f5dc-2279-38a4c0f4affb	8294	Boštanj
00050000-5630-f5dc-1f50-4e31ccf59ee4	5230	Bovec
00050000-5630-f5dc-061c-eef66b3ebc20	5295	Branik
00050000-5630-f5dc-7a9f-a226c8ff18f2	3314	Braslovče
00050000-5630-f5dc-ae6f-ce1e9ca5139c	5223	Breginj
00050000-5630-f5dc-8b16-02b6187ac2a8	8280	Brestanica
00050000-5630-f5dc-604b-20e343e031b4	2354	Bresternica
00050000-5630-f5dc-b3c3-325f99c99c1f	4243	Brezje
00050000-5630-f5dc-58b3-8cf64c47c9a8	1351	Brezovica pri Ljubljani
00050000-5630-f5dc-ba31-e4ba31363fe9	8250	Brežice
00050000-5630-f5dc-9643-edfab572cbb9	4210	Brnik - Aerodrom
00050000-5630-f5dc-9ac9-893575c72ceb	8321	Brusnice
00050000-5630-f5dc-b1ed-c11cc14dca93	3255	Buče
00050000-5630-f5dc-e948-cf9b55a950a6	8276	Bučka 
00050000-5630-f5dc-4c3e-6ecc8381391e	9261	Cankova
00050000-5630-f5dc-5801-2b307de7bedc	3000	Celje 
00050000-5630-f5dc-1a06-55a761e483c6	3001	Celje - poštni predali
00050000-5630-f5dc-b0a1-bf4a5cf43162	4207	Cerklje na Gorenjskem
00050000-5630-f5dc-b8de-faffb8c30e89	8263	Cerklje ob Krki
00050000-5630-f5dc-1e4d-59781947c91b	1380	Cerknica
00050000-5630-f5dc-f3d0-adcccf5a0594	5282	Cerkno
00050000-5630-f5dc-03be-27dc70abef1f	2236	Cerkvenjak
00050000-5630-f5dc-2ea8-ee05e25cd2b9	2215	Ceršak
00050000-5630-f5dc-737c-c0709c9af710	2326	Cirkovce
00050000-5630-f5dc-3a84-1eb9d8280ee0	2282	Cirkulane
00050000-5630-f5dc-b369-6dd8d277e83e	5273	Col
00050000-5630-f5dc-6b84-650d3b5a7241	8251	Čatež ob Savi
00050000-5630-f5dc-68bd-fe528e8cbb51	1413	Čemšenik
00050000-5630-f5dc-081b-d41546d12d03	5253	Čepovan
00050000-5630-f5dc-7324-237d954fe1fd	9232	Črenšovci
00050000-5630-f5dc-bd4f-9819c4ec4921	2393	Črna na Koroškem
00050000-5630-f5dc-7ebb-a6e34bc8bb37	6275	Črni Kal
00050000-5630-f5dc-7cff-6ee1b4e04e92	5274	Črni Vrh nad Idrijo
00050000-5630-f5dc-6ff8-2dc723f76f4d	5262	Črniče
00050000-5630-f5dc-652a-678e479b0394	8340	Črnomelj
00050000-5630-f5dc-2427-3581fbde9099	6271	Dekani
00050000-5630-f5dc-e4ad-9414782879b3	5210	Deskle
00050000-5630-f5dc-5f20-42ba8a877f5e	2253	Destrnik
00050000-5630-f5dc-a8ca-1443cdf21661	6215	Divača
00050000-5630-f5dc-c1b2-6a4071fa3ccd	1233	Dob
00050000-5630-f5dc-b0e0-df2a490e1a91	3224	Dobje pri Planini
00050000-5630-f5dc-802a-9cc60ad79b0b	8257	Dobova
00050000-5630-f5dc-de51-7b7d58ba5ce1	1423	Dobovec
00050000-5630-f5dc-33e1-b8f8be2120db	5263	Dobravlje
00050000-5630-f5dc-0bc0-13ed29d62d78	3204	Dobrna
00050000-5630-f5dc-567b-57c5fe97e802	8211	Dobrnič
00050000-5630-f5dc-1a5f-043197206433	1356	Dobrova
00050000-5630-f5dc-94a2-4bcb36a5fc4d	9223	Dobrovnik/Dobronak 
00050000-5630-f5dc-acea-94141c6c29db	5212	Dobrovo v Brdih
00050000-5630-f5dc-5d3c-35f01105b7f5	1431	Dol pri Hrastniku
00050000-5630-f5dc-cc8a-c9cf9f3b5925	1262	Dol pri Ljubljani
00050000-5630-f5dc-078d-bde34c9ab611	1273	Dole pri Litiji
00050000-5630-f5dc-3eb7-31cd31d474df	1331	Dolenja vas
00050000-5630-f5dc-9b8b-2a3cce8ad505	8350	Dolenjske Toplice
00050000-5630-f5dc-bede-2d81a7c43e07	1230	Domžale
00050000-5630-f5dc-79a1-b25aeb7842bc	2252	Dornava
00050000-5630-f5dc-81a8-538993d12e90	5294	Dornberk
00050000-5630-f5dc-4712-9f45fbe78389	1319	Draga
00050000-5630-f5dc-340e-23cda9c514b7	8343	Dragatuš
00050000-5630-f5dc-538f-a33e567b4998	3222	Dramlje
00050000-5630-f5dc-3d96-f0a600b60060	2370	Dravograd
00050000-5630-f5dc-28e4-4881cf4536d6	4203	Duplje
00050000-5630-f5dc-d15e-fe6dc8db6f5e	6221	Dutovlje
00050000-5630-f5dc-a15a-b967ca7873b0	8361	Dvor
00050000-5630-f5dc-1d07-ca6d13b40038	2343	Fala
00050000-5630-f5dc-9757-31b64ac15422	9208	Fokovci
00050000-5630-f5dc-5bd1-cc5628dd6851	2313	Fram
00050000-5630-f5dc-6940-d9861d2e8764	3213	Frankolovo
00050000-5630-f5dc-028c-1ce20af4215d	1274	Gabrovka
00050000-5630-f5dc-205b-f82175889df1	8254	Globoko
00050000-5630-f5dc-4a70-d9c2aa6931cc	5275	Godovič
00050000-5630-f5dc-c957-006190a06d64	4204	Golnik
00050000-5630-f5dc-3d8a-ef3773d48c84	3303	Gomilsko
00050000-5630-f5dc-e627-a351d9f24427	4224	Gorenja vas
00050000-5630-f5dc-ce3f-1779d9e9eb2d	3263	Gorica pri Slivnici
00050000-5630-f5dc-24cb-a70059142bf3	2272	Gorišnica
00050000-5630-f5dc-8cc7-d0f432e8a5ec	9250	Gornja Radgona
00050000-5630-f5dc-65fd-934dd6bfe64f	3342	Gornji Grad
00050000-5630-f5dc-a003-da6b65b86d67	4282	Gozd Martuljek
00050000-5630-f5dc-d784-8097a4efc6f9	6272	Gračišče
00050000-5630-f5dc-b3bc-d4c9ceb38b6b	9264	Grad
00050000-5630-f5dc-db1a-da5ccd918252	8332	Gradac
00050000-5630-f5dc-5582-85637087c064	1384	Grahovo
00050000-5630-f5dc-565f-0808eea4e912	5242	Grahovo ob Bači
00050000-5630-f5dc-6cd8-b1de53184a1d	5251	Grgar
00050000-5630-f5dc-864b-067480fb0b68	3302	Griže
00050000-5630-f5dc-dd71-74fb662b4bad	3231	Grobelno
00050000-5630-f5dc-8fe8-676b18482081	1290	Grosuplje
00050000-5630-f5dc-056e-8789268212ff	2288	Hajdina
00050000-5630-f5dc-7fac-297017d442b2	8362	Hinje
00050000-5630-f5dc-c1af-e0eb35af78ab	2311	Hoče
00050000-5630-f5dc-9009-60ad213e6c37	9205	Hodoš/Hodos
00050000-5630-f5dc-4730-79615d44646e	1354	Horjul
00050000-5630-f5dc-1002-e416106ed8c5	1372	Hotedršica
00050000-5630-f5dc-c006-cfbe97395f85	1430	Hrastnik
00050000-5630-f5dc-adc3-4c7929aced09	6225	Hruševje
00050000-5630-f5dc-e186-7f666e79ac95	4276	Hrušica
00050000-5630-f5dc-5762-84ede5d4de16	5280	Idrija
00050000-5630-f5dc-a404-235fa6ce2f3a	1292	Ig
00050000-5630-f5dc-f496-3a8a536121ec	6250	Ilirska Bistrica
00050000-5630-f5dc-70aa-113ffa1cdf86	6251	Ilirska Bistrica-Trnovo
00050000-5630-f5dc-41ba-6491f739db55	1295	Ivančna Gorica
00050000-5630-f5dc-9369-3a5a1ce196d0	2259	Ivanjkovci
00050000-5630-f5dc-87c1-cfae61820f49	1411	Izlake
00050000-5630-f5dc-03ac-ea8a57989537	6310	Izola/Isola
00050000-5630-f5dc-f4c9-0b70abb0de18	2222	Jakobski Dol
00050000-5630-f5dc-510e-0b86fc24fa78	2221	Jarenina
00050000-5630-f5dc-9b67-99bf45bdf2c9	6254	Jelšane
00050000-5630-f5dc-d05c-0aa00fab7f5f	4270	Jesenice
00050000-5630-f5dc-0560-bd99b477e0cc	8261	Jesenice na Dolenjskem
00050000-5630-f5dc-f698-2dae7d9ffe74	3273	Jurklošter
00050000-5630-f5dc-9f48-62cb8238514b	2223	Jurovski Dol
00050000-5630-f5dc-5a10-7f7ebaaa9944	2256	Juršinci
00050000-5630-f5dc-d801-7b6702adab84	5214	Kal nad Kanalom
00050000-5630-f5dc-5505-6028e15d4a39	3233	Kalobje
00050000-5630-f5dc-1507-0bfe4a93ea48	4246	Kamna Gorica
00050000-5630-f5dc-4e34-cb946b2298c9	2351	Kamnica
00050000-5630-f5dc-2e92-cebc1d53582b	1241	Kamnik
00050000-5630-f5dc-b685-f1ff381a4803	5213	Kanal
00050000-5630-f5dc-67fe-ce5cd28872b4	8258	Kapele
00050000-5630-f5dc-746f-bbf8af2267f2	2362	Kapla
00050000-5630-f5dc-28f7-69beea368c4e	2325	Kidričevo
00050000-5630-f5dc-200f-7e1b15f5e626	1412	Kisovec
00050000-5630-f5dc-0199-05c76c876e98	6253	Knežak
00050000-5630-f5dc-fd9a-58c91f1c246b	5222	Kobarid
00050000-5630-f5dc-3c84-929537642dfc	9227	Kobilje
00050000-5630-f5dc-7952-f4c8a5a6a560	1330	Kočevje
00050000-5630-f5dc-eb59-34f181933e31	1338	Kočevska Reka
00050000-5630-f5dc-ba4f-208ffa439dd1	2276	Kog
00050000-5630-f5dc-3b29-f087af9874fa	5211	Kojsko
00050000-5630-f5dc-d786-de9473c3e96b	6223	Komen
00050000-5630-f5dc-8fc8-59c428c14d0f	1218	Komenda
00050000-5630-f5dc-95a4-4f33591d7b51	6000	Koper/Capodistria 
00050000-5630-f5dc-b18b-4d5e0a29b304	6001	Koper/Capodistria - poštni predali
00050000-5630-f5dc-f374-6bc327ced035	8282	Koprivnica
00050000-5630-f5dc-b240-a289ac2a9655	5296	Kostanjevica na Krasu
00050000-5630-f5dc-fa2b-8634eda76999	8311	Kostanjevica na Krki
00050000-5630-f5dc-12a7-77c2edb48616	1336	Kostel
00050000-5630-f5dc-7efa-091d5be64559	6256	Košana
00050000-5630-f5dc-2ccc-e2f32f37324d	2394	Kotlje
00050000-5630-f5dc-7a1f-6a2660880ff5	6240	Kozina
00050000-5630-f5dc-4a54-fae84290121e	3260	Kozje
00050000-5630-f5dc-1d0f-d70271999fbb	4000	Kranj 
00050000-5630-f5dc-d5c0-68016355965e	4001	Kranj - poštni predali
00050000-5630-f5dc-3ba7-a01c0e28bc87	4280	Kranjska Gora
00050000-5630-f5dc-43ae-14cdd0d24462	1281	Kresnice
00050000-5630-f5dc-3a7c-1f9e3b6b0f0e	4294	Križe
00050000-5630-f5dc-65eb-8bb2ee747205	9206	Križevci
00050000-5630-f5dc-caf6-8bebab53bfc9	9242	Križevci pri Ljutomeru
00050000-5630-f5dc-4927-5f4321ac5aec	1301	Krka
00050000-5630-f5dc-7289-5ef454e3f2ac	8296	Krmelj
00050000-5630-f5dc-a1f9-b53ddd499e6e	4245	Kropa
00050000-5630-f5dc-fa2f-fbfabaaebbd7	8262	Krška vas
00050000-5630-f5dc-0d4e-f9d8ac0af225	8270	Krško
00050000-5630-f5dc-6501-49eccf7e1ec2	9263	Kuzma
00050000-5630-f5dc-faa6-aca8debc77e3	2318	Laporje
00050000-5630-f5dc-600d-918fca2de477	3270	Laško
00050000-5630-f5dc-0f5d-9e35ca3bc53b	1219	Laze v Tuhinju
00050000-5630-f5dc-35d4-b3349b245e2b	2230	Lenart v Slovenskih goricah
00050000-5630-f5dc-71eb-6b2197c4c8d8	9220	Lendava/Lendva
00050000-5630-f5dd-8d88-82adc41b2ec1	4248	Lesce
00050000-5630-f5dd-2c27-9f2dd3b02783	3261	Lesično
00050000-5630-f5dd-46ee-15ae17d371e8	8273	Leskovec pri Krškem
00050000-5630-f5dd-7590-31289258befd	2372	Libeliče
00050000-5630-f5dd-2a25-ade6b888f478	2341	Limbuš
00050000-5630-f5dd-5cf1-c4b5c7c9ec39	1270	Litija
00050000-5630-f5dd-1aca-3be5e3fe74fb	3202	Ljubečna
00050000-5630-f5dd-5e7b-36500f80c4e7	1000	Ljubljana 
00050000-5630-f5dd-4ff2-860c98c65e4e	1001	Ljubljana - poštni predali
00050000-5630-f5dd-432e-7da31dd300cb	1231	Ljubljana - Črnuče
00050000-5630-f5dd-6079-7c94715a960c	1261	Ljubljana - Dobrunje
00050000-5630-f5dd-8cae-8b9157b44778	1260	Ljubljana - Polje
00050000-5630-f5dd-0d86-3a3d135c7d68	1210	Ljubljana - Šentvid
00050000-5630-f5dd-a62b-c6fe90ca6197	1211	Ljubljana - Šmartno
00050000-5630-f5dd-e88a-ddf9bad1588a	3333	Ljubno ob Savinji
00050000-5630-f5dd-68bf-2ba10f067767	9240	Ljutomer
00050000-5630-f5dd-145a-e0e652c4c34b	3215	Loče
00050000-5630-f5dd-2a82-bba09ba6c8a7	5231	Log pod Mangartom
00050000-5630-f5dd-ffd1-2e37a7806f65	1358	Log pri Brezovici
00050000-5630-f5dd-ba05-8a0a50520e9f	1370	Logatec
00050000-5630-f5dd-fa8b-ddbd2f303a70	1371	Logatec
00050000-5630-f5dd-81ca-d98f69edddfe	1434	Loka pri Zidanem Mostu
00050000-5630-f5dd-42ad-b2bdf2ea1895	3223	Loka pri Žusmu
00050000-5630-f5dd-2ef8-235bdd0d2f74	6219	Lokev
00050000-5630-f5dd-e896-2ef2d020c830	1318	Loški Potok
00050000-5630-f5dd-6f9e-d92276785173	2324	Lovrenc na Dravskem polju
00050000-5630-f5dd-8562-b346f8703162	2344	Lovrenc na Pohorju
00050000-5630-f5dd-cc6c-c37f2dcf9244	3334	Luče
00050000-5630-f5dd-3a90-1df9f82175f9	1225	Lukovica
00050000-5630-f5dd-b789-14787cecdeef	9202	Mačkovci
00050000-5630-f5dd-1d0b-98aa46432993	2322	Majšperk
00050000-5630-f5dd-3d60-60e5e17ab65b	2321	Makole
00050000-5630-f5dd-3ed5-569f56edf774	9243	Mala Nedelja
00050000-5630-f5dd-b522-d6753362e034	2229	Malečnik
00050000-5630-f5dd-3fc9-b3bae602dd1e	6273	Marezige
00050000-5630-f5dd-28ba-2ac5bc831fe9	2000	Maribor 
00050000-5630-f5dd-49e6-c28af3801d0e	2001	Maribor - poštni predali
00050000-5630-f5dd-3ca6-c8e18a1f1b42	2206	Marjeta na Dravskem polju
00050000-5630-f5dd-1ad8-4a16108b9ee7	2281	Markovci
00050000-5630-f5dd-8466-295142404b3b	9221	Martjanci
00050000-5630-f5dd-c9e9-a1327fa4a425	6242	Materija
00050000-5630-f5dd-643a-d2c127e3dbf7	4211	Mavčiče
00050000-5630-f5dd-bfe0-ffa2901e33e3	1215	Medvode
00050000-5630-f5dd-1cdf-ee4c7153ddba	1234	Mengeš
00050000-5630-f5dd-75fa-35fbef8965e2	8330	Metlika
00050000-5630-f5dd-0089-a69611bd3759	2392	Mežica
00050000-5630-f5dd-4ab1-edee1bb0e774	2204	Miklavž na Dravskem polju
00050000-5630-f5dd-3af2-d36d28224678	2275	Miklavž pri Ormožu
00050000-5630-f5dd-002d-a84747c30518	5291	Miren
00050000-5630-f5dd-0f08-c7e45b1dfd79	8233	Mirna
00050000-5630-f5dd-b7f4-c3c5f7dc4eed	8216	Mirna Peč
00050000-5630-f5dd-de65-08ebbcbc7d61	2382	Mislinja
00050000-5630-f5dd-6a86-913efa37cb7c	4281	Mojstrana
00050000-5630-f5dd-4356-de5b7228547c	8230	Mokronog
00050000-5630-f5dd-26e4-f04f9af9f111	1251	Moravče
00050000-5630-f5dd-b1fd-76a5d38aed15	9226	Moravske Toplice
00050000-5630-f5dd-c8a5-9820d5bd356f	5216	Most na Soči
00050000-5630-f5dd-7525-b861e11b2b41	1221	Motnik
00050000-5630-f5dd-2735-a7bffdf39ed0	3330	Mozirje
00050000-5630-f5dd-8099-aa20d1462c6e	9000	Murska Sobota 
00050000-5630-f5dd-0380-a14c3833c9fe	9001	Murska Sobota - poštni predali
00050000-5630-f5dd-c387-551f68e1417f	2366	Muta
00050000-5630-f5dd-bbc2-bb859073d537	4202	Naklo
00050000-5630-f5dd-62fe-63877e57d8d6	3331	Nazarje
00050000-5630-f5dd-1a9d-80f77d0e4615	1357	Notranje Gorice
00050000-5630-f5dd-107e-d33ca8aad403	3203	Nova Cerkev
00050000-5630-f5dd-7aad-aa11cc3319b6	5000	Nova Gorica 
00050000-5630-f5dd-f968-9b888fb74954	5001	Nova Gorica - poštni predali
00050000-5630-f5dd-978a-1731214558cd	1385	Nova vas
00050000-5630-f5dd-bc69-763cb90816bf	8000	Novo mesto
00050000-5630-f5dd-dabd-de33fe591eca	8001	Novo mesto - poštni predali
00050000-5630-f5dd-1a3a-1a2d093cb782	6243	Obrov
00050000-5630-f5dd-2c48-8479502a01bf	9233	Odranci
00050000-5630-f5dd-492b-18a615bc23da	2317	Oplotnica
00050000-5630-f5dd-6ed2-184eeaa08028	2312	Orehova vas
00050000-5630-f5dd-827b-530208393d71	2270	Ormož
00050000-5630-f5dd-21e1-10505356cf95	1316	Ortnek
00050000-5630-f5dd-98e4-1d9d82f02ade	1337	Osilnica
00050000-5630-f5dd-24ed-c59d4c182133	8222	Otočec
00050000-5630-f5dd-306d-160afc601170	2361	Ožbalt
00050000-5630-f5dd-7f00-5ac111d6ffcb	2231	Pernica
00050000-5630-f5dd-6b8b-83e4d59f6b1f	2211	Pesnica pri Mariboru
00050000-5630-f5dd-8cbc-341f39a59be5	9203	Petrovci
00050000-5630-f5dd-7fb2-3ed11bdd94bf	3301	Petrovče
00050000-5630-f5dd-f19f-40611409ee22	6330	Piran/Pirano
00050000-5630-f5dd-5d1c-b52cf6665716	8255	Pišece
00050000-5630-f5dd-1e6d-7bbd20d70590	6257	Pivka
00050000-5630-f5dd-8076-2f48d146fac2	6232	Planina
00050000-5630-f5dd-9247-e2143a019c7d	3225	Planina pri Sevnici
00050000-5630-f5dd-0a62-3eee29d78387	6276	Pobegi
00050000-5630-f5dd-2374-e6d60d68117d	8312	Podbočje
00050000-5630-f5dd-033a-78e9469cc0c4	5243	Podbrdo
00050000-5630-f5dd-7be7-bf733b612c65	3254	Podčetrtek
00050000-5630-f5dd-93e6-91a7ba1618fb	2273	Podgorci
00050000-5630-f5dd-2230-e314b789d03e	6216	Podgorje
00050000-5630-f5dd-a64c-3ca04daa16e7	2381	Podgorje pri Slovenj Gradcu
00050000-5630-f5dd-61aa-a0dae3edecba	6244	Podgrad
00050000-5630-f5dd-3f27-d0a39e25fe13	1414	Podkum
00050000-5630-f5dd-e379-cc468193c843	2286	Podlehnik
00050000-5630-f5dd-1c60-23e72f0c589f	5272	Podnanos
00050000-5630-f5dd-5a96-36b63c64c1c4	4244	Podnart
00050000-5630-f5dd-173f-d9ac51b14cf5	3241	Podplat
00050000-5630-f5dd-f27d-9baae818f672	3257	Podsreda
00050000-5630-f5dd-6ab1-71513e5c8a23	2363	Podvelka
00050000-5630-f5dd-7a7c-6fce8784d08f	2208	Pohorje
00050000-5630-f5dd-33e0-223a70927e7b	2257	Polenšak
00050000-5630-f5dd-d4b0-a3730335001b	1355	Polhov Gradec
00050000-5630-f5dd-70b7-8fa41244ddfa	4223	Poljane nad Škofjo Loko
00050000-5630-f5dd-0de9-072357a33f56	2319	Poljčane
00050000-5630-f5dd-018a-641abfef26d7	1272	Polšnik
00050000-5630-f5dd-f0b1-6b30da1c9409	3313	Polzela
00050000-5630-f5dd-5c33-e9abbabe7d5b	3232	Ponikva
00050000-5630-f5dd-8680-706494e9f89a	6320	Portorož/Portorose
00050000-5630-f5dd-ae48-4524d322fb68	6230	Postojna
00050000-5630-f5dd-0d56-c310673a62da	2331	Pragersko
00050000-5630-f5dd-dc27-ed12d0b7df73	3312	Prebold
00050000-5630-f5dd-8ad7-5436e31781af	4205	Preddvor
00050000-5630-f5dd-3d20-8c8c252a89c9	6255	Prem
00050000-5630-f5dd-d9ff-6a02aec23a61	1352	Preserje
00050000-5630-f5dd-cb07-bedbe03fed49	6258	Prestranek
00050000-5630-f5dd-43ad-959d5ec8ad03	2391	Prevalje
00050000-5630-f5dd-1c5d-b7a059942877	3262	Prevorje
00050000-5630-f5dd-bdef-863cf4ba36db	1276	Primskovo 
00050000-5630-f5dd-b993-31efcb48acbd	3253	Pristava pri Mestinju
00050000-5630-f5dd-fa92-afe458ca6ae9	9207	Prosenjakovci/Partosfalva
00050000-5630-f5dd-6ab9-4537f71362e1	5297	Prvačina
00050000-5630-f5dd-ecdd-51e3b57f9527	2250	Ptuj
00050000-5630-f5dd-6e40-9514e009ecb2	2323	Ptujska Gora
00050000-5630-f5dd-ef43-200531997e86	9201	Puconci
00050000-5630-f5dd-9e86-1c75672d5a96	2327	Rače
00050000-5630-f5dd-6eee-6505d8e3f4bb	1433	Radeče
00050000-5630-f5dd-7c9b-5b2caed8b2a8	9252	Radenci
00050000-5630-f5dd-c802-945dfb620525	2360	Radlje ob Dravi
00050000-5630-f5dd-8f0d-5573f7c04999	1235	Radomlje
00050000-5630-f5dd-0332-8a02375272ee	4240	Radovljica
00050000-5630-f5dd-4145-685f109cbf44	8274	Raka
00050000-5630-f5dd-4b70-9402a8f492aa	1381	Rakek
00050000-5630-f5dd-cab4-062dca4ed7ff	4283	Rateče - Planica
00050000-5630-f5dd-318b-613f32d54a60	2390	Ravne na Koroškem
00050000-5630-f5dd-2090-9f9a40061564	9246	Razkrižje
00050000-5630-f5dd-ac68-48736f352a05	3332	Rečica ob Savinji
00050000-5630-f5dd-3107-bd347dea978a	5292	Renče
00050000-5630-f5dd-95b3-595e3bf805ba	1310	Ribnica
00050000-5630-f5dd-a13a-9ce1ad801714	2364	Ribnica na Pohorju
00050000-5630-f5dd-a2cf-d41af8e359c3	3272	Rimske Toplice
00050000-5630-f5dd-7418-2e0227da3c12	1314	Rob
00050000-5630-f5dd-214b-572caaa1fb7b	5215	Ročinj
00050000-5630-f5dd-3b30-933e606ce906	3250	Rogaška Slatina
00050000-5630-f5dd-dd14-d74859bccd75	9262	Rogašovci
00050000-5630-f5dd-d013-3b5af628674d	3252	Rogatec
00050000-5630-f5dd-9328-10518a3dee20	1373	Rovte
00050000-5630-f5dd-b8c4-bfb406b1e37a	2342	Ruše
00050000-5630-f5dd-430c-8242987d7e5b	1282	Sava
00050000-5630-f5dd-970a-df5767b77362	6333	Sečovlje/Sicciole
00050000-5630-f5dd-6b91-db6bcd1fea07	4227	Selca
00050000-5630-f5dd-e0eb-e24fe782a61a	2352	Selnica ob Dravi
00050000-5630-f5dd-267f-1084056773b0	8333	Semič
00050000-5630-f5dd-251b-e7e3ce731669	8281	Senovo
00050000-5630-f5dd-24f0-e3d36fee368b	6224	Senožeče
00050000-5630-f5dd-31f2-9dc516a0d0f3	8290	Sevnica
00050000-5630-f5dd-a6c4-c4739570a130	6210	Sežana
00050000-5630-f5dd-fb75-7187836d5af5	2214	Sladki Vrh
00050000-5630-f5dd-3e08-f07f08c3ae7f	5283	Slap ob Idrijci
00050000-5630-f5dd-af29-e459c3ef3445	2380	Slovenj Gradec
00050000-5630-f5dd-3395-e71158948e27	2310	Slovenska Bistrica
00050000-5630-f5dd-7814-1636ee28ccbd	3210	Slovenske Konjice
00050000-5630-f5dd-9a15-13b39f0e63b2	1216	Smlednik
00050000-5630-f5dd-e865-d993bd3e53a8	5232	Soča
00050000-5630-f5dd-2715-2e462446a982	1317	Sodražica
00050000-5630-f5dd-c1ab-83121853ccb6	3335	Solčava
00050000-5630-f5dd-3f31-0fdf46ecb59d	5250	Solkan
00050000-5630-f5dd-e735-f55d1fb7d2c9	4229	Sorica
00050000-5630-f5dd-c2a9-058308ccf6c4	4225	Sovodenj
00050000-5630-f5dd-8ce6-cb9eef08a11e	5281	Spodnja Idrija
00050000-5630-f5dd-0dc5-01627273e82c	2241	Spodnji Duplek
00050000-5630-f5dd-8980-ff3bf8f83e29	9245	Spodnji Ivanjci
00050000-5630-f5dd-d5fd-da88591b9795	2277	Središče ob Dravi
00050000-5630-f5dd-4484-68eb10fc162b	4267	Srednja vas v Bohinju
00050000-5630-f5dd-c083-558816a5ba10	8256	Sromlje 
00050000-5630-f5dd-e555-d51f9c47de5c	5224	Srpenica
00050000-5630-f5dd-27e3-2431da71debc	1242	Stahovica
00050000-5630-f5dd-75ad-12db77d9ffe5	1332	Stara Cerkev
00050000-5630-f5dd-a645-9e0d5ff34725	8342	Stari trg ob Kolpi
00050000-5630-f5dd-d5fa-414461992a28	1386	Stari trg pri Ložu
00050000-5630-f5dd-63d6-1aed83189341	2205	Starše
00050000-5630-f5dd-26bc-c8062585e16e	2289	Stoperce
00050000-5630-f5dd-168e-4c21934c4936	8322	Stopiče
00050000-5630-f5dd-78ba-45bf50bb3e4c	3206	Stranice
00050000-5630-f5dd-ee78-c05d52df3935	8351	Straža
00050000-5630-f5dd-f203-3356ae2ff9a3	1313	Struge
00050000-5630-f5dd-7d01-ff9ad98dfc43	8293	Studenec
00050000-5630-f5dd-e346-0cec63b9d496	8331	Suhor
00050000-5630-f5dd-c00b-7a6d899b6126	2233	Sv. Ana v Slovenskih goricah
00050000-5630-f5dd-9c04-7619d98d393a	2235	Sv. Trojica v Slovenskih goricah
00050000-5630-f5dd-fd42-9da69f5db35b	2353	Sveti Duh na Ostrem Vrhu
00050000-5630-f5dd-b422-dc46b0881de3	9244	Sveti Jurij ob Ščavnici
00050000-5630-f5dd-7403-d5093b39d0a0	3264	Sveti Štefan
00050000-5630-f5dd-c821-c58e7ce73833	2258	Sveti Tomaž
00050000-5630-f5dd-81e0-3c31f56fda9e	9204	Šalovci
00050000-5630-f5dd-dcaf-0876c426ca16	5261	Šempas
00050000-5630-f5dd-6b8b-0bdb833536ab	5290	Šempeter pri Gorici
00050000-5630-f5dd-aa78-e8ba37699578	3311	Šempeter v Savinjski dolini
00050000-5630-f5dd-e2f6-2fb1696bee93	4208	Šenčur
00050000-5630-f5dd-4241-9923f003bdb1	2212	Šentilj v Slovenskih goricah
00050000-5630-f5dd-88b3-3a928b8f9bd2	8297	Šentjanž
00050000-5630-f5dd-0ca7-8d3a96213bad	2373	Šentjanž pri Dravogradu
00050000-5630-f5dd-cdfe-31040c291ce6	8310	Šentjernej
00050000-5630-f5dd-ac2f-f4c3309c8961	3230	Šentjur
00050000-5630-f5dd-2344-9e1ac3432512	3271	Šentrupert
00050000-5630-f5dd-b8d0-34e693f529f7	8232	Šentrupert
00050000-5630-f5dd-688e-a7ab9d803532	1296	Šentvid pri Stični
00050000-5630-f5dd-28c3-5911a5096362	8275	Škocjan
00050000-5630-f5dd-a63c-431dd7a997ea	6281	Škofije
00050000-5630-f5dd-0271-9fa3aa72948d	4220	Škofja Loka
00050000-5630-f5dd-1232-7f2eb5eb5812	3211	Škofja vas
00050000-5630-f5dd-fe6f-6d832a88321f	1291	Škofljica
00050000-5630-f5dd-e148-5e622f3f6f57	6274	Šmarje
00050000-5630-f5dd-b78a-6dc26b1cbb8a	1293	Šmarje - Sap
00050000-5630-f5dd-4ba8-92b82ac0f43f	3240	Šmarje pri Jelšah
00050000-5630-f5dd-c41f-4e32da450535	8220	Šmarješke Toplice
00050000-5630-f5dd-7a4b-150916c6a93e	2315	Šmartno na Pohorju
00050000-5630-f5dd-f882-d582ba80d2e3	3341	Šmartno ob Dreti
00050000-5630-f5dd-263f-b4b9ba3d3dae	3327	Šmartno ob Paki
00050000-5630-f5dd-cf68-63634ed7c6b7	1275	Šmartno pri Litiji
00050000-5630-f5dd-390d-7a5d3d68e852	2383	Šmartno pri Slovenj Gradcu
00050000-5630-f5dd-a8d8-3ad715249ade	3201	Šmartno v Rožni dolini
00050000-5630-f5dd-afdb-884396696c2c	3325	Šoštanj
00050000-5630-f5dd-34e1-e621e109ab45	6222	Štanjel
00050000-5630-f5dd-b1cf-59d111072586	3220	Štore
00050000-5630-f5dd-9888-daaecce4cda0	3304	Tabor
00050000-5630-f5dd-29d6-c313b613613e	3221	Teharje
00050000-5630-f5dd-171b-0e45e71094d9	9251	Tišina
00050000-5630-f5dd-11f7-adc4f9c83db8	5220	Tolmin
00050000-5630-f5dd-8c2b-85ff21cb5255	3326	Topolšica
00050000-5630-f5dd-304a-12b42df26620	2371	Trbonje
00050000-5630-f5dd-2ea2-b57e61471990	1420	Trbovlje
00050000-5630-f5dd-b4df-bb6df2ed8229	8231	Trebelno 
00050000-5630-f5dd-c5d3-8022610bacdb	8210	Trebnje
00050000-5630-f5dd-6b95-72bb850416ee	5252	Trnovo pri Gorici
00050000-5630-f5dd-ec4c-0d8dbad99d9a	2254	Trnovska vas
00050000-5630-f5dd-b569-a9fafa144c1c	1222	Trojane
00050000-5630-f5dd-9ebe-7ff041596ee1	1236	Trzin
00050000-5630-f5dd-cf9b-8f1e4de8f050	4290	Tržič
00050000-5630-f5dd-a29b-e47b83119178	8295	Tržišče
00050000-5630-f5dd-9c00-ce9f42263d5a	1311	Turjak
00050000-5630-f5dd-6f31-c2c46948cce3	9224	Turnišče
00050000-5630-f5dd-321f-13e207e79550	8323	Uršna sela
00050000-5630-f5dd-1ee5-5bcc4041a978	1252	Vače
00050000-5630-f5dd-3bdb-8fc5c046ef5f	3320	Velenje 
00050000-5630-f5dd-84aa-3c4e571eff00	3322	Velenje - poštni predali
00050000-5630-f5dd-ea2c-1e085eaf5b2a	8212	Velika Loka
00050000-5630-f5dd-e6fa-7f5dd25a8292	2274	Velika Nedelja
00050000-5630-f5dd-01c8-e21961361b6d	9225	Velika Polana
00050000-5630-f5dd-133f-3789d7dd6358	1315	Velike Lašče
00050000-5630-f5dd-4f5a-e82860234dde	8213	Veliki Gaber
00050000-5630-f5dd-8bd7-8021d25c4860	9241	Veržej
00050000-5630-f5dd-3efb-c57760a4159a	1312	Videm - Dobrepolje
00050000-5630-f5dd-448a-615c0ebbfc2d	2284	Videm pri Ptuju
00050000-5630-f5dd-1084-0c3d48073a01	8344	Vinica
00050000-5630-f5dd-2f45-4f25808d936b	5271	Vipava
00050000-5630-f5dd-dbef-2aa4cef298b8	4212	Visoko
00050000-5630-f5dd-d130-0eb1c77a54b5	1294	Višnja Gora
00050000-5630-f5dd-607a-33fb933748ce	3205	Vitanje
00050000-5630-f5dd-910d-a648c0c43ab4	2255	Vitomarci
00050000-5630-f5dd-d867-a255d4d348e0	1217	Vodice
00050000-5630-f5dd-9ee2-15efec38dd4e	3212	Vojnik\t
00050000-5630-f5dd-63b1-75cba18c4991	5293	Volčja Draga
00050000-5630-f5dd-9137-411dcdb080d0	2232	Voličina
00050000-5630-f5dd-f0df-ea2c8ea668fd	3305	Vransko
00050000-5630-f5dd-7026-feeee4a1ea89	6217	Vremski Britof
00050000-5630-f5dd-1617-f57d220c276a	1360	Vrhnika
00050000-5630-f5dd-ff3f-bdaa9cf9a34e	2365	Vuhred
00050000-5630-f5dd-96a7-c117483d5181	2367	Vuzenica
00050000-5630-f5dd-85fe-bd461a675eff	8292	Zabukovje 
00050000-5630-f5dd-886f-936fe2e37870	1410	Zagorje ob Savi
00050000-5630-f5dd-dc65-ee47399ba7f7	1303	Zagradec
00050000-5630-f5dd-00b7-afc6b3a232d1	2283	Zavrč
00050000-5630-f5dd-033e-ae6b6f953ff4	8272	Zdole 
00050000-5630-f5dd-fec6-bb1550d41bb1	4201	Zgornja Besnica
00050000-5630-f5dd-99c4-5e8a34f90a97	2242	Zgornja Korena
00050000-5630-f5dd-5765-557eab7c951a	2201	Zgornja Kungota
00050000-5630-f5dd-31f8-461ea2556599	2316	Zgornja Ložnica
00050000-5630-f5dd-14da-9cf313c7c1b7	2314	Zgornja Polskava
00050000-5630-f5dd-513b-8e13b8f2f126	2213	Zgornja Velka
00050000-5630-f5dd-4ddf-291393eeaa63	4247	Zgornje Gorje
00050000-5630-f5dd-dfd1-ea2a1d07f553	4206	Zgornje Jezersko
00050000-5630-f5dd-c4ce-54232e320fea	2285	Zgornji Leskovec
00050000-5630-f5dd-ca3c-c88daa34e469	1432	Zidani Most
00050000-5630-f5dd-4009-058b4ca16538	3214	Zreče
00050000-5630-f5dd-c272-8053c83e6e26	4209	Žabnica
00050000-5630-f5dd-cfd3-705ef8e3f2c2	3310	Žalec
00050000-5630-f5dd-7063-567a694803bd	4228	Železniki
00050000-5630-f5dd-4b0d-5c7d0bc35b5e	2287	Žetale
00050000-5630-f5dd-1493-b2239cb560b0	4226	Žiri
00050000-5630-f5dd-7925-faf31df1ab9d	4274	Žirovnica
00050000-5630-f5dd-ec73-f1bddf281542	8360	Žužemberk
\.


--
-- TOC entry 3121 (class 0 OID 23926467)
-- Dependencies: 237
-- Data for Name: postavkacdve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkacdve (id, skupina, podskupina, naziv, vrpremiere, vrponovitvepremier, vrponovitveprejsnjih, vrgostovanjazamejstvo, vrfestivali, vrgostovanjaint, vrostalo, programdela_id) FROM stdin;
\.


--
-- TOC entry 3094 (class 0 OID 23926059)
-- Dependencies: 210
-- Data for Name: postavkaracuna; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkaracuna (id, racun_id) FROM stdin;
\.


--
-- TOC entry 3072 (class 0 OID 23925813)
-- Dependencies: 188
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
00060000-5630-f5df-f5ef-2478c23f062d	00080000-5630-f5df-2772-a65b13efa9c3	\N	00040000-5630-f5dd-f6d3-04539478d8be	Narodni dom	\N	Koroška 15	\N	9231	Beltinci	\N	f	t
00060000-5630-f5df-52af-1b356bc2ba75	00080000-5630-f5df-2772-a65b13efa9c3	\N	00040000-5630-f5dd-f6d3-04539478d8be	Korotan	\N	Koroška 22	\N	9231	Beltinci	\N	f	f
00060000-5630-f5df-27d9-d8d7e7ac92a5	00080000-5630-f5df-e06c-2ffddf410943	\N	00040000-5630-f5dd-f6d3-04539478d8be	Rimljan	\N	Rimska ploščad 7	\N	9231	Beltinci	\N	f	t
\.


--
-- TOC entry 3084 (class 0 OID 23925957)
-- Dependencies: 200
-- Data for Name: praznik; Type: TABLE DATA; Schema: public; Owner: -
--

COPY praznik (id, ime, dan, mesec, leto, delaprost) FROM stdin;
00430000-5630-f5dd-b860-dc9c2add5313	novo leto	1	1	\N	t
00430000-5630-f5dd-ee60-672cd076ac71	Prešernov dan, slovenski kulturni praznik	8	2	\N	t
00430000-5630-f5dd-e882-3e6a80c3ab19	dan upora proti okupatorju	27	4	\N	t
00430000-5630-f5dd-468c-8b8b2fdad3c2	praznik dela	1	5	\N	t
00430000-5630-f5dd-cc6e-e409ed999f01	praznik dela	2	5	\N	t
00430000-5630-f5dd-e1f7-419903d4f77e	dan Primoža Trubarja	8	6	\N	f
00430000-5630-f5dd-538f-2b14dbf31b8e	dan državnosti	25	6	\N	t
00430000-5630-f5dd-384c-42aa6409256c	združitev prekmurskih Slovencev z matičnim narodom	17	8	\N	f
00430000-5630-f5dd-616d-d378f0e0dd00	vrnitev Primorske k matični domovini	15	9	\N	f
00430000-5630-f5dd-2536-119a1205c924	dan suverenosti	25	10	\N	f
00430000-5630-f5dd-461c-24bc8b056912	dan spomina na mrtve	1	11	\N	t
00430000-5630-f5dd-7bf8-8759d4da58e5	dan Rudolfa Maistra	23	11	\N	f
00430000-5630-f5dd-9ca4-a4fe05e2faa8	božič	25	12	\N	t
00430000-5630-f5dd-d28b-49be2b0e571e	dan samostojnosti in enotnosti	26	12	\N	t
00430000-5630-f5dd-bce2-9fa7c247a029	Marijino vnebovzetje	15	8	\N	t
00430000-5630-f5dd-de63-3d95a162f1ff	dan reformacije	31	10	\N	t
00430000-5630-f5dd-c4bd-380c6beff5a3	velikonočna nedelja	27	3	2016	t
00430000-5630-f5dd-6eba-4005255a9187	velikonočna nedelja	16	4	2017	t
00430000-5630-f5dd-52b0-8c7e89abc6ac	velikonočna nedelja	1	4	2018	t
00430000-5630-f5dd-f9a1-2efbbadc1573	velikonočna nedelja	21	4	2019	t
00430000-5630-f5dd-f26a-fb38dbf4572c	velikonočna nedelja	12	4	2020	t
00430000-5630-f5dd-e124-f30c0bc300f4	velikonočna nedelja	4	4	2021	t
00430000-5630-f5dd-46e1-55246a96be77	velikonočna nedelja	17	4	2022	t
00430000-5630-f5dd-cbe0-a411824e8786	velikonočna nedelja	9	4	2023	t
00430000-5630-f5dd-0afb-bd58f33bee15	velikonočna nedelja	31	3	2024	t
00430000-5630-f5dd-ed34-e78eadad6206	velikonočna nedelja	20	4	2025	t
00430000-5630-f5dd-ed13-351e9df66df7	velikonočna nedelja	5	4	2026	t
00430000-5630-f5dd-47a0-f3fd53fca53f	velikonočna nedelja	28	3	2027	t
00430000-5630-f5dd-ede5-85aa8e563b64	velikonočna nedelja	16	4	2028	t
00430000-5630-f5dd-ef4c-8347cbd094de	velikonočna nedelja	1	4	2029	t
00430000-5630-f5dd-1e82-2d5fa76068a9	velikonočna nedelja	21	4	2030	t
00430000-5630-f5dd-88ce-8679c8e46051	velikonočni ponedeljek	28	3	2016	t
00430000-5630-f5dd-169b-e62059f9efa1	velikonočni ponedeljek	17	4	2017	t
00430000-5630-f5dd-1a65-526630ba6e90	velikonočni ponedeljek	2	4	2018	t
00430000-5630-f5dd-4e7b-ca805e7647c5	velikonočni ponedeljek	22	4	2019	t
00430000-5630-f5dd-e0e2-3e9db57147e8	velikonočni ponedeljek	13	4	2020	t
00430000-5630-f5dd-fc29-24bf47e2f3e7	velikonočni ponedeljek	5	4	2021	t
00430000-5630-f5dd-ea13-b48384822e62	velikonočni ponedeljek	18	4	2022	t
00430000-5630-f5dd-3b6d-54a779678a1f	velikonočni ponedeljek	10	4	2023	t
00430000-5630-f5dd-c8fd-20749a4f9481	velikonočni ponedeljek	1	4	2024	t
00430000-5630-f5dd-d21b-33e3437b8bae	velikonočni ponedeljek	21	4	2025	t
00430000-5630-f5dd-c18d-ef51baa419b5	velikonočni ponedeljek	6	4	2026	t
00430000-5630-f5dd-374b-e6aad604959d	velikonočni ponedeljek	29	3	2027	t
00430000-5630-f5dd-f3fe-b6435cd03cae	velikonočni ponedeljek	17	4	2028	t
00430000-5630-f5dd-ca59-c4a977a24f11	velikonočni ponedeljek	2	4	2029	t
00430000-5630-f5dd-9a19-25f9f6cba2a0	velikonočni ponedeljek	22	4	2030	t
00430000-5630-f5dd-5273-5534c88ffb85	binkoštna nedelja - binkošti	15	5	2016	t
00430000-5630-f5dd-011e-0637d6043aae	binkoštna nedelja - binkošti	4	6	2017	t
00430000-5630-f5dd-2aec-4a8ab93c08e2	binkoštna nedelja - binkošti	20	5	2018	t
00430000-5630-f5dd-c229-4956223f056f	binkoštna nedelja - binkošti	9	6	2019	t
00430000-5630-f5dd-a0bc-15b90af2ce36	binkoštna nedelja - binkošti	31	5	2020	t
00430000-5630-f5dd-fff8-18b339a26178	binkoštna nedelja - binkošti	23	5	2021	t
00430000-5630-f5dd-8ee5-532d94c6963a	binkoštna nedelja - binkošti	5	6	2022	t
00430000-5630-f5dd-a6b3-4e39a47ce744	binkoštna nedelja - binkošti	28	5	2023	t
00430000-5630-f5dd-ac65-0d151ea42217	binkoštna nedelja - binkošti	19	5	2024	t
00430000-5630-f5dd-916a-f4bc780ac42f	binkoštna nedelja - binkošti	8	6	2025	t
00430000-5630-f5dd-4086-a3e41f709294	binkoštna nedelja - binkošti	24	5	2026	t
00430000-5630-f5dd-d235-fa60222c476a	binkoštna nedelja - binkošti	16	5	2027	t
00430000-5630-f5dd-34b7-408b27ec5ea4	binkoštna nedelja - binkošti	4	6	2028	t
00430000-5630-f5dd-755e-83facc5529ba	binkoštna nedelja - binkošti	20	5	2029	t
00430000-5630-f5dd-2e6b-70531ffa09aa	binkoštna nedelja - binkošti	9	6	2030	t
\.


--
-- TOC entry 3080 (class 0 OID 23925917)
-- Dependencies: 196
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, dezurni_id, zaporedna, zaporednasez, objavljenzacetek, porocilo) FROM stdin;
\.


--
-- TOC entry 3081 (class 0 OID 23925929)
-- Dependencies: 197
-- Data for Name: predstava_abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava_abonma (predstava_id, abonma_id) FROM stdin;
\.


--
-- TOC entry 3096 (class 0 OID 23926071)
-- Dependencies: 212
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 3122 (class 0 OID 23926481)
-- Dependencies: 238
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, koproducent_id, odstotekfinanciranja, delez, maticnikop, kpe, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 3123 (class 0 OID 23926491)
-- Dependencies: 239
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, sifra, status) FROM stdin;
00190000-5630-f5df-90e4-72f7dd7c51fe	00080000-5630-f5df-5925-b7936d6d7e6d	0987	AK
00190000-5630-f5df-4359-e158ff675fe3	00080000-5630-f5df-e06c-2ffddf410943	0989	AK
00190000-5630-f5df-423a-65ad56d776e0	00080000-5630-f5df-39c2-15127b93e0c4	0986	AK
00190000-5630-f5df-6cb7-b99de278bb8f	00080000-5630-f5df-999c-00ae4ab052e3	0984	AK
00190000-5630-f5df-cb4d-c2ee3ce8e29e	00080000-5630-f5df-5b75-a9791763e64d	0983	AK
00190000-5630-f5df-5c98-bf9e299c15d6	00080000-5630-f5df-1d9b-9152975f0942	0982	AK
00190000-5630-f5e1-ab5f-3644cd859858	00080000-5630-f5e1-838f-2c7ef68651d7	1001	AK
\.


--
-- TOC entry 3120 (class 0 OID 23926406)
-- Dependencies: 236
-- Data for Name: programdela; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programdela (id, sifra, naziv, zacetek, konec, zakljuceno, potrjenprogram, stpremier, stpremiervelikih, stpremiermalih, stpremiermalihkopr, stpremiervelikihkopr, stpremiersredkopr, stint, stfest, strazno, stizjem, stponprem, stponprej, stponprejvelikih, stponprejmalih, stponprejmalihkopr, stponprejsredkopr, stponprejvelikihkopr, stgostujo, vrps1, vrps1do, vrps1mat, vrps1gostovsz, stizvnekomerc, stizvprem, stizvpremdoma, stizvpremkopr, stizvponprem, stizvponpremdoma, stizvponpremzamejo, stizvponpremgost, stizvponpremkopr, stizvponpremint, stizvponpremkoprint, stizvponprej, stizvponprejdoma, stizvponprejzamejo, stizvponprejgost, stizvponprejkopr, stizvponprejint, stizvponprejkoprint, stizvgostuj, stizvostalihnek, stizvgostovanjslo, stizvgostovanjzam, stizvgostovanjint, stobisknekom, stobisknekommat, stobisknekomgostslo, stobisknekomgostzam, stobisknekomgostint, stobiskprem, stobiskpremdoma, stobiskpremkopr, stobiskponprem, stobiskponpremdoma, stobiskponpremkopr, stobiskponpremkoprint, stobiskponpremgost, stobiskponpremzamejo, stobiskponpremint, avgobiskprired, avgzaseddvoran, avgcenavstopnice, stprodvstopnic, stkoprodukcij, stkoprodukcijint, stkoprodukcijnvo, stzaposlenih, stzaposigralcev, avgstnastopovigr, sthonorarnihzun, sthonorarnihzunigr, sthonorarnihzunigrtujjz, sthonorarnihzunsamoz, sredstvaint, sredstvaavt, sredstvazaprosenoprem, sredstvazaprosenoponprem, sredstvazaprosenoponprej, sredstvazaprosenogostujo, sredstvazaprosenoint, sredstvazaprosenofest, sredstvazaprosenorazno, sredstvazaprosenoizjem, sredstvadrugijavniprem, sredstvadrugijavniponprem, sredstvadrugijavniponprej, sredstvadrugijavnigostujo, sredstvadrugijavniint, sredstvadrugijavnifest, sredstvadrugijavnirazno, sredstvadrugijavniizjem, sredstvadrugiviriprem, sredstvadrugiviriponprem, sredstvadrugiviriponprej, sredstvadrugivirigostujo, sredstvadrugiviriint, sredstvadrugivirifest, sredstvadrugivirirazno, sredstvadrugiviriizjem, sredstvaavtsamoz) FROM stdin;
00290000-5630-f5df-5cf2-6beab262b302	0001	Testni program dela	2016-02-01	2017-02-01	f	f	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0.00	0	0	0	0.00	0	0.00	0.00	0	0	0	0.00	0	0.00	0.00	0	0	0	0	0.00	0.00	0.00	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	\N	0	0	0	\N	\N	0.00	0	0	0	0	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00
\.


--
-- TOC entry 3124 (class 0 OID 23926499)
-- Dependencies: 240
-- Data for Name: programskaenotasklopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programskaenotasklopa (id, naslovpe, avtorpe, obsegpe, mesecpe, vrednostpe, obiskdoma, programrazno_id) FROM stdin;
\.


--
-- TOC entry 3100 (class 0 OID 23926100)
-- Dependencies: 216
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, popa_id, naslov_id, sifra, naziv, jeprizorisce, jematicnioder, seplanira, kapaciteta, opis) FROM stdin;
00220000-5630-f5df-b28d-f9e65dcfc6e3	\N	\N	0001	Poskusna 1	f	\N	t	8	Poskusna učilnica v prvem
00220000-5630-f5df-1fab-4e53ff36cfec	\N	\N	0002	Poskusna 3	f	\N	f	34	Poskusna učilnica v tretjem
00220000-5630-f5df-90fd-4244638c2cfb	\N	\N	0003	Kazinska	t	\N	t	84	Kazinska dvorana
00220000-5630-f5df-21ac-fa4542c0118f	\N	\N	0004	Mali oder	t	\N	t	24	Mali oder 
00220000-5630-f5df-4009-fa9928d811ef	\N	\N	0005	Komorni oder	t	\N	t	150	Komorni oder
00220000-5630-f5df-086f-f02922547511	\N	\N	0006	Stara dvorana	t	\N	t	96	Stara dvorana ali dvorana Franceta Prešerna
00220000-5630-f5df-b364-3bd62bd754ab	\N	\N	0007	Velika dvorana	t	\N	t	160	Velika, glavna dvorana
\.


--
-- TOC entry 3092 (class 0 OID 23926044)
-- Dependencies: 208
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 3091 (class 0 OID 23926034)
-- Dependencies: 207
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 3113 (class 0 OID 23926245)
-- Dependencies: 229
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta, status) FROM stdin;
\.


--
-- TOC entry 3107 (class 0 OID 23926175)
-- Dependencies: 223
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 3078 (class 0 OID 23925891)
-- Dependencies: 194
-- Data for Name: report; Type: TABLE DATA; Schema: public; Owner: -
--

COPY report (id, job_id, title, filename, transfers, size, format, hash, createdat) FROM stdin;
\.


--
-- TOC entry 3059 (class 0 OID 23925662)
-- Dependencies: 175
-- Data for Name: revizije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY revizije (id, razred, objectid, upor, datum, tip, data) FROM stdin;
1	App\\Entity\\Popa	00080000-5630-f5e1-838f-2c7ef68651d7	00010000-5630-f5dd-c923-40d0bf7b22dc	2015-10-28 17:20:49	INS	a:0:{}
2	App\\Entity\\Option	00000000-5630-f5e1-208f-19b126fbd571	00010000-5630-f5dd-c923-40d0bf7b22dc	2015-10-28 17:20:49	INS	a:0:{}
3	ProgramDela\\Entity\\ProdukcijskaHisa	00190000-5630-f5e1-ab5f-3644cd859858	00010000-5630-f5dd-c923-40d0bf7b22dc	2015-10-28 17:20:49	INS	a:0:{}
\.


--
-- TOC entry 3143 (class 0 OID 0)
-- Dependencies: 174
-- Name: revizije_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('revizije_id_seq', 3, true);


--
-- TOC entry 3101 (class 0 OID 23926113)
-- Dependencies: 217
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 3063 (class 0 OID 23925700)
-- Dependencies: 179
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-5630-f5dd-9619-ace48df34acd	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-5630-f5dd-d9d9-e73fc60af3d0	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-5630-f5dd-085e-32ad8c7b3e9e	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-5630-f5dd-e5b2-db610e86d5fb	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-5630-f5dd-6272-7b0b357a68f8	planer	Planer dogodkov v koledarju	t
00020000-5630-f5dd-c36d-8dd0e2c269e1	kadrovska	Kadrovska služba	t
00020000-5630-f5dd-02d3-a4b59dceccd6	arhivar	Ažuriranje arhivalij	t
00020000-5630-f5dd-81c2-c7e4e6fef001	igralec	Igralec	t
00020000-5630-f5dd-7b7b-06c4d0ed7d7b	prisotnost	Vnašalec prisotnosti, tudi za tiste izven uprizoritev	t
00020000-5630-f5df-cd22-5e309fda0720	vsadovoljenja	Vloga z vsemi posameznimi dovoljenji	t
\.


--
-- TOC entry 3061 (class 0 OID 23925684)
-- Dependencies: 177
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-5630-f5dd-2e38-92dd2f38edf9	00020000-5630-f5dd-085e-32ad8c7b3e9e
00010000-5630-f5dd-c923-40d0bf7b22dc	00020000-5630-f5dd-085e-32ad8c7b3e9e
00010000-5630-f5df-7b26-1c23b7f1e197	00020000-5630-f5df-cd22-5e309fda0720
\.


--
-- TOC entry 3103 (class 0 OID 23926127)
-- Dependencies: 219
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 3095 (class 0 OID 23926065)
-- Dependencies: 211
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 3089 (class 0 OID 23926011)
-- Dependencies: 205
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, sifra, ime, zacetek, konec, aktivna) FROM stdin;
001f0000-5630-f5df-c1a7-f9bfd5392e79	2015	Sezona 2015	2015-01-01	2015-12-31	t
001f0000-5630-f5df-c500-1aaa4242c10e	2016	Sezona 2016	2016-01-01	2016-12-31	t
001f0000-5630-f5df-1905-cf8b2c0bd96d	2017	Sezona 2017	2017-01-01	2017-12-31	t
\.


--
-- TOC entry 3057 (class 0 OID 23925649)
-- Dependencies: 173
-- Data for Name: stevilcenje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenje (id, sifra, naziv, prefix, suffix, zacetek, dolzina, format, globalno, poletih) FROM stdin;
00230000-5630-f5dd-6b59-4290e47b4a63	pri	Privzeto številčenje po letih YYYY-N	\N	\N	1	1	%l-%n	f	t
00230000-5630-f5dd-bace-59953f70fe08	123	Privzeto številčenje kratkih šifer	\N	\N	100	3	%n	f	f
00230000-5630-f5dd-3fa4-d69eef58fa16	bcd	Globalno številčenje črtnih kod	\N	\N	1	9	%n	t	f
00230000-5630-f5dd-5c7d-04b5d0048149	sif	Številčenje šifrant	\N	\N	1000	4	%n	f	f
00230000-5630-f5dd-7a29-8ee9c75530b8	tmp	Globalno številčenje začasnih številk	tmp	\N	1000	5	%l%n	t	t
\.


--
-- TOC entry 3056 (class 0 OID 23925641)
-- Dependencies: 172
-- Data for Name: stevilcenjekonfig; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjekonfig (id, stevilcenje_id, dok) FROM stdin;
00240000-5630-f5dd-42e2-36bc78d34745	00230000-5630-f5dd-5c7d-04b5d0048149	popa
00240000-5630-f5dd-2d05-8f7e5be2ea28	00230000-5630-f5dd-5c7d-04b5d0048149	oseba
00240000-5630-f5dd-8d46-d4eeb013d870	00230000-5630-f5dd-5c7d-04b5d0048149	tippopa
00240000-5630-f5dd-427b-b134bd94de33	00230000-5630-f5dd-5c7d-04b5d0048149	organizacijskaenota
00240000-5630-f5dd-09b2-b35901ea87c2	00230000-5630-f5dd-5c7d-04b5d0048149	sezona
00240000-5630-f5dd-2205-1d31990a088c	00230000-5630-f5dd-5c7d-04b5d0048149	tipvaje
00240000-5630-f5dd-e5d0-bd3b7dbb7a6f	00230000-5630-f5dd-bace-59953f70fe08	prostor
00240000-5630-f5dd-de5d-504154852a19	00230000-5630-f5dd-5c7d-04b5d0048149	besedilo
00240000-5630-f5dd-c06e-2641876208d0	00230000-5630-f5dd-5c7d-04b5d0048149	uprizoritev
00240000-5630-f5dd-f969-894a48d9c698	00230000-5630-f5dd-5c7d-04b5d0048149	funkcija
00240000-5630-f5dd-2dc9-a581aab40059	00230000-5630-f5dd-5c7d-04b5d0048149	tipfunkcije
00240000-5630-f5dd-9524-0c15b8c870b5	00230000-5630-f5dd-5c7d-04b5d0048149	alternacija
00240000-5630-f5dd-f1e1-05a606582311	00230000-5630-f5dd-6b59-4290e47b4a63	pogodba
00240000-5630-f5dd-2742-a32ef4819e9a	00230000-5630-f5dd-5c7d-04b5d0048149	zaposlitev
00240000-5630-f5dd-2b07-5039b0c11d28	00230000-5630-f5dd-5c7d-04b5d0048149	zvrstuprizoritve
00240000-5630-f5dd-4b65-0ffb911dcb8c	00230000-5630-f5dd-6b59-4290e47b4a63	programdela
00240000-5630-f5dd-07ce-67b52f768b8c	00230000-5630-f5dd-5c7d-04b5d0048149	zapis
\.


--
-- TOC entry 3055 (class 0 OID 23925636)
-- Dependencies: 171
-- Data for Name: stevilcenjestanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjestanje (id, objid, leto, stevilka) FROM stdin;
392e7ea4-afc7-4cf8-bab0-2479beb23214	00240000-5630-f5dd-42e2-36bc78d34745	0	1001
\.


--
-- TOC entry 3109 (class 0 OID 23926192)
-- Dependencies: 225
-- Data for Name: strosekuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY strosekuprizoritve (id, uprizoritev_id, popa_id, naziv, vrednostdo, vrednostna, opis, tipstroska, sort, vrstastroska_id) FROM stdin;
00270000-5630-f5df-2a98-bee9fa71668a	000e0000-5630-f5df-4453-2d1bf02c045a	00080000-5630-f5df-2772-a65b13efa9c3	Nabava kostumov	600.50	20.00	Krila in maske	materialni	1	003b0000-5630-f5dd-a327-06aca363ec34
00270000-5630-f5df-8c53-3836c6c39f0a	000e0000-5630-f5df-4453-2d1bf02c045a	00080000-5630-f5df-2772-a65b13efa9c3	Zavese	125.70	3.10	Modra in zelena zavesa	materialni	2	003b0000-5630-f5dd-a327-06aca363ec34
\.


--
-- TOC entry 3069 (class 0 OID 23925775)
-- Dependencies: 185
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 3090 (class 0 OID 23926021)
-- Dependencies: 206
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja, dezurni, gost) FROM stdin;
001a0000-5630-f5df-f2fd-f71b5a15b225	00180000-5630-f5df-26ff-542eb1d85241	000c0000-5630-f5df-17e4-01498fc9e7a8	00090000-5630-f5df-31a4-547194cba85c	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-5630-f5df-76ff-a2eab17d0a17	00180000-5630-f5df-26ff-542eb1d85241	000c0000-5630-f5df-194d-8f427d320652	00090000-5630-f5df-ebff-d3ae3fe5fb21	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-5630-f5df-bd34-f5a0228f1b4a	00180000-5630-f5df-26ff-542eb1d85241	000c0000-5630-f5df-5409-b26a4cb5c633	00090000-5630-f5df-88d6-bd1f2bbdde6a	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-5630-f5df-c021-f4133d59d174	00180000-5630-f5df-26ff-542eb1d85241	000c0000-5630-f5df-45fb-04b4142d0e54	00090000-5630-f5df-4e48-e924395941f4	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-5630-f5df-a6bb-c3c4d0981729	00180000-5630-f5df-26ff-542eb1d85241	000c0000-5630-f5df-b3e0-f21c9213e04e	00090000-5630-f5df-1e48-4d5f928ba006	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-5630-f5df-06ca-f1211cf7036b	00180000-5630-f5df-816d-d5dfa37ad2b6	\N	00090000-5630-f5df-1e48-4d5f928ba006	2015-08-01 20:00:00	2015-08-01 23:00:00	\N	\N	2.00	t	f
001a0000-5630-f5df-474b-acaf5447cb74	00180000-5630-f5df-816d-d5dfa37ad2b6	\N	00090000-5630-f5df-ebff-d3ae3fe5fb21	2015-08-01 20:00:00	2015-08-01 23:00:00	\N	\N	2.00	f	t
\.


--
-- TOC entry 3112 (class 0 OID 23926233)
-- Dependencies: 228
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, sifra, ime, opis, imezenski, podrocje, sort) FROM stdin;
000f0000-5630-f5dd-d707-0f5d66e2879e	01	Avtor	Avtorji	Avtorka	umetnik	150
000f0000-5630-f5dd-9522-7a69d6e8284f	02	Priredba	Priredba	Priredba	umetnik	160
000f0000-5630-f5dd-fc9b-f1b5ba7afc42	03	Prevod	Prevod	Prevod	umetnik	20
000f0000-5630-f5dd-899b-0755f94e9aa9	04	Režija	Režija	Režija	umetnik	30
000f0000-5630-f5dd-a8f0-998b3eb76bfc	05	Dramaturgija	Dramaturgija	Dramaturgija	umetnik	40
000f0000-5630-f5dd-ffe9-9d4a5848cac6	06	Scenografija	Scenografija	Scenografija	umetnik	60
000f0000-5630-f5dd-8e89-c57d0515f6fa	07	Kostumografija	Kostumografija	Kostumografija	umetnik	70
000f0000-5630-f5dd-0790-5de1e423356d	08	Koreografija	Koreografija	Koreografija	umetnik	90
000f0000-5630-f5dd-7b62-def873b6cb0d	09	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	umetnik	100
000f0000-5630-f5dd-76d9-281b1a55b8f0	10	Oblikovanje maske	Oblikovanje maske	Oblikovanje maske	umetnik	110
000f0000-5630-f5dd-26e9-a17302016c83	11	Lektorstvo	Lektorstvo	Lektorstvo	umetnik	50
000f0000-5630-f5dd-2c62-4957312a1208	12	Glasbeni soustvarjalec	Glasbeni soustvarjalci	Glasbena soustvarjalka	umetnik	80
000f0000-5630-f5dd-24ef-c437db250741	13	Intermedijski ustvarjalec	Intermedijski ustvarjalci	Intermedijski ustvarjalka	umetnik	130
000f0000-5630-f5dd-56e8-181102205161	14	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	umetnik	120
000f0000-5630-f5dd-9a07-db4a65ba2106	15	Vloga	Intermedijski ustvarjalci	Intermedijska ustvarjalka	igralec	10
000f0000-5630-f5dd-d275-7aa0fdcfa2fc	16	Produkcija, mentorstvo	Produkcija, mentorstvo	Produkcija, mentorstvo	umetnik	140
000f0000-5630-f5dd-a1ed-f7dfd9b90d6b	17	Tehnična in druga podpora	Tehnična in druga podpora	Tehnična in druga podpora	tehnik	180
000f0000-5630-f5dd-e4e2-c8925d6bbd93	18	Inšpicient	Inšpicienti	Inšpicientka	inspicient	170
\.


--
-- TOC entry 3066 (class 0 OID 23925726)
-- Dependencies: 182
-- Data for Name: tippopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tippopa (id, sifra, ime, opis) FROM stdin;
00400000-5630-f5df-291f-7772d02695df	0001	šola	osnovna ali srednja šola
00400000-5630-f5df-d34f-9bdea6804e7b	0002	gledalec	gledalec, ki ima abonma ali podobno
00400000-5630-f5df-b47e-1d54bec0ab2f	0003	sponzor	sponzor dogodkov
\.


--
-- TOC entry 3125 (class 0 OID 23926510)
-- Dependencies: 241
-- Data for Name: tipprogramskeenote; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipprogramskeenote (id, sifra, naziv, koprodukcija, maxfaktor, maxvsi) FROM stdin;
002b0000-5630-f5dd-e261-ee8b2e26ac7b	01	Velika predstava	f	1.00	1.00
002b0000-5630-f5dd-1a6d-b51a5f588b63	02	Mala predstava	f	0.50	0.50
002b0000-5630-f5dd-0e5d-04a3ab981733	03	Mala koprodukcija	t	0.40	1.00
002b0000-5630-f5dd-7112-fd4fbe9530b7	04	Srednja koprodukcija	t	0.70	2.00
002b0000-5630-f5dd-a433-b33237686575	05	Velika koprodukcija	t	1.00	3.00
\.


--
-- TOC entry 3088 (class 0 OID 23926001)
-- Dependencies: 204
-- Data for Name: tipvaje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipvaje (id, sifra, ime, opis) FROM stdin;
00420000-5630-f5dd-a102-bc2f37772c84	0001	prva vaja	prva vaja
00420000-5630-f5dd-7f0f-c79ee21912a6	0002	tehnična vaja	tehnična vaja
00420000-5630-f5dd-477d-39c3a327eb2f	0003	lučna vaja	lučna vaja
00420000-5630-f5dd-3f3d-508323201b91	0004	kostumska vaja	kostumska vaja
00420000-5630-f5dd-4d72-074635b97270	0005	foto vaja	foto vaja
00420000-5630-f5dd-0281-578392087e3e	0006	1. glavna vaja	1. glavna vaja
00420000-5630-f5dd-225d-ab051d5b3d40	0007	2. glavna vaja	2. glavna vaja
00420000-5630-f5dd-9a59-824c82013f48	0008	1. generalka	1. generalka
00420000-5630-f5dd-752d-5a6a2234d1fd	0009	2. generalka	2. generalka
00420000-5630-f5dd-f468-0b1162c35434	0010	odprta generalka	odprta generalka
00420000-5630-f5dd-02b4-2b527f3979b0	0011	obnovitvena vaja	obnovitvena vaja
00420000-5630-f5dd-23c6-e1199eb9f951	0012	pevska vaja	pevska vaja
00420000-5630-f5dd-cdbf-d094f01b4e18	0013	postavitev scene	postavitev scene (za pripravo vaje)
00420000-5630-f5dd-10d4-4f813a21fdc5	0014	postavitev luči	postavitev luči (za pripravo vaje)
\.


--
-- TOC entry 3075 (class 0 OID 23925848)
-- Dependencies: 191
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 3060 (class 0 OID 23925671)
-- Dependencies: 176
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-5630-f5dd-c923-40d0bf7b22dc	Konzolcni	$2y$05$NS4xMjkyMTcwMzExMjAxROSpcYAy6i1pMSy1N9cAby87delQOeX/G	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-5630-f5df-8c8b-e9218e507a0a	testni uporabnik za inšpicienta	$2y$05$NS4xMjkyMTcwMzExMjAxROxkJ1B6xAXex6EZLIwJfWzRJ8DpfecFO	t	\N	\N	\N	ivo@ifigenija.si	\N	\N	\N
00010000-5630-f5df-7863-91c080d8cf58	testni uporabnik za Tehničnega vodjo	$2y$05$NS4xMjkyMTcwMzExMjAxROu/kXWR9sP9oamkesKuxXLbxkCb387.G	t	\N	\N	\N	tona@ifigenija.si	\N	\N	\N
00010000-5630-f5df-8b64-fc6b98bfcfb5	testni uporabnik za igralca	$2y$05$NS4xMjkyMTcwMzExMjAxRO/hLCgClfERRsfCAFYwxNCcFIVjP2982	t	\N	\N	\N	irena@ifigenija.si	\N	\N	\N
00010000-5630-f5df-7135-410e107d62d3	testni uporabnik vnašalca termina storitev (TerminStoritve-vse)	$2y$05$NS4xMjkyMTcwMzExMjAxROT6.kTHqEq4.wa2SOnf124/N14m9qeP.	t	\N	\N	\N	tatjana@ifigenija.si	\N	\N	\N
00010000-5630-f5df-3987-fe44112192bf	testni uporabnik, ki je inšpicient brez zapisov v TerminStoritve	$2y$05$NS4xMjkyMTcwMzExMjAxROHau47Dtb7CME5.nlWwBVM.nusFP.ra2	t	\N	\N	\N	joze@ifigenija.si	\N	\N	\N
00010000-5630-f5df-6565-64aa44438873	testna uporabnica, ki je planerka	$2y$05$NS4xMjkyMTcwMzExMjAxRO.B/uJO3C7QRNhdX9Q2hTLQsSupj1V1S	t	\N	\N	\N	petra@ifigenija.si	\N	\N	\N
00010000-5630-f5df-33eb-2cc22b6835eb	testni uporabnik, ki dobi ifi-all vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROv2d7jqhaV/Mz3EIsKoi7UoFR.SDSMBm	t	\N	\N	\N	ali@ifigenija.si	\N	\N	\N
00010000-5630-f5df-f41d-54ed0aadcf3c	testni uporabnik, ki dobi ifi-readall vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROYB9g.gnkufr1l/gWK6mkx.ySqrOWnJC	t	\N	\N	\N	berta@ifigenija.si	\N	\N	\N
00010000-5630-f5df-047c-ca41637f7544	testni uporabnik, ki dobi aaa-write dovoljenje	$2y$05$NS4xMjkyMTcwMzExMjAxRORujYObKX.DzpXVYbePkiJkHqg0/Ylya	t	\N	\N	\N	aaron@ifigenija.si	\N	\N	\N
00010000-5630-f5df-7b26-1c23b7f1e197	testni uporabnik ki dobi vsa posamezna dovoljenja	$2y$05$NS4xMjkyMTcwMzExMjAxRO2ymwxVXTr7U4Ncdn.bN49E8rLw9Jg0O	t	\N	\N	\N	vesna@ifigenija.si	\N	\N	\N
00010000-5630-f5dd-2e38-92dd2f38edf9	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 3116 (class 0 OID 23926283)
-- Dependencies: 232
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, producent_id, sifra, faza, naslov, podnaslov, delovninaslov, internacionalninaslov, naslovizvirnika, podnaslovizvirnika, datumzacstudija, stevilovaj, planiranostevilovaj, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, krstna, prvaslovenska, kratkinaslov, jekoprodukcija, maticnioder_id) FROM stdin;
000e0000-5630-f5df-8538-b27d34257874	00160000-5630-f5df-92a3-84c38f21e4d5	\N	00140000-5630-f5dd-f4a4-b33356fd6fe0	\N	0001	produkcija	Sen kresne noči		Sanje	\N	\N	\N	2016-02-01	\N	\N	2016-06-01	1	William  Shakespeare - Nebojša  Kavader	f	2				\N	f	\N	\N		\N	00220000-5630-f5df-4009-fa9928d811ef
000e0000-5630-f5df-4453-2d1bf02c045a	00160000-5630-f5df-ce71-3f6abdecc381	\N	00140000-5630-f5dd-0b17-5deb5ba323d4	\N	0002	predprodukcija-ideja	Smoletov vrt			\N	\N	\N	2016-01-01	\N	\N	2016-04-20	2	Berta   Hočevar	f	2				\N	f	\N	\N		\N	00220000-5630-f5df-086f-f02922547511
000e0000-5630-f5df-ebaa-bedd3e27853e	\N	\N	00140000-5630-f5dd-0b17-5deb5ba323d4	00190000-5630-f5df-90e4-72f7dd7c51fe	0003	postprodukcija	Kisli maček			\N	\N	\N	2016-02-01	\N	\N	2016-04-20	2	\N	t	2				\N	f	\N	\N		\N	00220000-5630-f5df-4009-fa9928d811ef
000e0000-5630-f5df-f8dc-273555ac32ab	\N	\N	00140000-5630-f5dd-0b17-5deb5ba323d4	00190000-5630-f5df-90e4-72f7dd7c51fe	0004	postprodukcija	Vladimir			\N	\N	\N	2017-03-01	\N	\N	2017-04-20	2	\N	t	2				\N	f	\N	\N		\N	00220000-5630-f5df-4009-fa9928d811ef
000e0000-5630-f5df-a2de-20e31c39a5e5	\N	\N	00140000-5630-f5dd-0b17-5deb5ba323d4	00190000-5630-f5df-90e4-72f7dd7c51fe	0005	postprodukcija	Španska princesa			\N	\N	\N	2017-04-01	\N	\N	2017-05-20	1	\N	f	1				\N	f	\N	\N		\N	00220000-5630-f5df-b28d-f9e65dcfc6e3
000e0000-5630-f5df-2ac2-bf5da94d70b0	\N	\N	00140000-5630-f5dd-0b17-5deb5ba323d4	00190000-5630-f5df-90e4-72f7dd7c51fe	0006	postprodukcija	Ne vemo datumov			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-5630-f5df-b28d-f9e65dcfc6e3
\.


--
-- TOC entry 3083 (class 0 OID 23925947)
-- Dependencies: 199
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, tipvaje_id, uprizoritev_id, zaporedna, porocilo) FROM stdin;
00200000-5630-f5df-1c8c-7f333890ab7a	\N	000e0000-5630-f5df-4453-2d1bf02c045a	1	
00200000-5630-f5df-fcec-c9b86775a619	\N	000e0000-5630-f5df-4453-2d1bf02c045a	2	
00200000-5630-f5df-9ff8-d042546d1270	\N	000e0000-5630-f5df-4453-2d1bf02c045a	3	
00200000-5630-f5df-1b93-349519ad2873	\N	000e0000-5630-f5df-4453-2d1bf02c045a	4	
00200000-5630-f5df-33fa-1e284e3db089	\N	000e0000-5630-f5df-4453-2d1bf02c045a	5	
\.


--
-- TOC entry 3099 (class 0 OID 23926092)
-- Dependencies: 215
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 3110 (class 0 OID 23926206)
-- Dependencies: 226
-- Data for Name: vrstastroska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstastroska (id, skupina, podskupina, naziv, opis) FROM stdin;
003b0000-5630-f5dd-a7de-01dce094c3ea	1	0	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE
003b0000-5630-f5dd-e222-714ec466c96c	1	1	Storitve varovanja zgradb in prostorov	storitve varovanja zgradb in prostorov (npr. gasilci na predstavah)
003b0000-5630-f5dd-513a-5d2f59b53913	1	2	Založniške in tiskarske storitve	založniške in tiskarske storitve
003b0000-5630-f5dd-7118-1c9b6b6540ed	1	3	Časopisi, revije, knjige in strokovna literatura	časopisi, revije, knjige in strokovna literatura
003b0000-5630-f5dd-2adc-b0a96c983974	1	4	Stroški prevajalskih storitev	stroški prevajalskih storitev
003b0000-5630-f5dd-962d-a2048739df01	1	5	Stroški oglaševalskih storitev	stroški oglaševalskih storitev
003b0000-5630-f5dd-68e7-ccb46f95f970	1	6	Izdatki za reprezentanco	izdatki za reprezentanco
003b0000-5630-f5dd-0daa-98f0d5bdd6ef	2	0	POSEBNI MATERIAL IN STORITVE	POSEBNI MATERIAL IN STORITVE
003b0000-5630-f5dd-a327-06aca363ec34	2	1	Drugi posebni material in storitve	drugi posebni material in storitve (npr. za instrumete - navedite)
003b0000-5630-f5dd-6f3c-836c70e2018b	2	2	Oprema predstave – stroški rekvizitov	Oprema predstave – stroški rekvizitov
003b0000-5630-f5dd-a2f6-c1bad2c6ef3f	2	3	Oprema predstave – stroški kostumov	Oprema predstave – stroški kostumov
003b0000-5630-f5dd-0838-7fac69e69aba	2	4	Oprema predstave – stroški scenske opreme	Oprema predstave – stroški scenske opreme
003b0000-5630-f5dd-ad23-44611a633a93	2	5	Oprema predstave – stroški avdio in video opreme	Oprema predstave – stroški avdio in video opreme
003b0000-5630-f5dd-0f24-34d0c28633de	3	0	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE
003b0000-5630-f5dd-f270-e7574149071c	3	1	Poštnina in kurirske storitve	poštnina in kurirske storitve
003b0000-5630-f5dd-2927-f3872d8521df	4	0	PREVOZNI STROŠKI IN STORITVE	PREVOZNI STROŠKI IN STORITVE
003b0000-5630-f5dd-ff47-b00141191e57	4	1	Goriva in maziva za prevozna sredstva	goriva in maziva za prevozna sredstva
003b0000-5630-f5dd-8b6d-127362192cab	4	2	Najem vozil in selitveni stroški	najem vozil in selitveni stroški
003b0000-5630-f5dd-b834-825240963833	4	3	Drugi prevozni in transportni stroški 	drugi prevozni in transportni stroški (navedite)
003b0000-5630-f5dd-8cc6-f6d9e9531718	5	0	IZDATKI ZA SLUŽBENA POTOVANJA	IZDATKI ZA SLUŽBENA POTOVANJA
003b0000-5630-f5dd-3f65-d35955f8a373	5	1	Dnevnice za službena potovanja v državi in tujini	dnevnice za službena potovanja v državi in tujini
003b0000-5630-f5dd-aa41-efb1c134adc6	5	2	Hotelske in restavra. storitve v državi in tujini	hotelske in restavra. storitve v državi in tujini
003b0000-5630-f5dd-ca6a-413b3a7c5eb0	5	3	Stroški prevoza v državi in tujini	stroški prevoza v državi in tujini
003b0000-5630-f5dd-ed52-ecea36ddbe7f	5	4	Drugi izdatki za službena potovanja	drugi izdatki za službena potovanja (navedite)
003b0000-5630-f5dd-9860-71a4edbfdbe9	6	0	NAJEMNINE IN ZAKUPNINE	NAJEMNINE IN ZAKUPNINE
003b0000-5630-f5dd-3549-cd7a34fd00d3	6	1	Druge najemnine, zakupnine in licenčnine	druge najemnine, zakupnine in licenčnine (npr. najem notnega materiala, instrumentov - navedite)
003b0000-5630-f5dd-4d14-84106425758f	7	0	DRUGI OPERATIVNI ODHODKI	DRUGI OPERATIVNI ODHODKI
003b0000-5630-f5dd-552d-755bb701915c	7	1	Izdatki za strok. izobraževanje zap.	izdatki za strok. izobraževanje zap.(vezani na program. enote)  
\.


--
-- TOC entry 3128 (class 0 OID 23926557)
-- Dependencies: 244
-- Data for Name: vrstazapisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstazapisa (id, oznaka, naziv, aktiven, znacka, ikona, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3127 (class 0 OID 23926529)
-- Dependencies: 243
-- Data for Name: zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapis (id, vrsta_id, datoteka_id, mapa_id, avtor_id, zaklenil_id, tip, zaklenjen, datumzaklepanja, identifier, subject, title, description, coverage, creator, language, date, publisher, relation, rights, source, upor, datknj, standard, lokacija) FROM stdin;
\.


--
-- TOC entry 3129 (class 0 OID 23926569)
-- Dependencies: 245
-- Data for Name: zapislastnik; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapislastnik (id, zapis_id, lastnik, classlastnika, datum, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3106 (class 0 OID 23926164)
-- Dependencies: 222
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, sifra, status, delovnomesto, zacetek, konec, tip, delovnaobveza, malica, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci, organizacijskaenota_id) FROM stdin;
00100000-5630-f5df-f575-b6bcb56cc8f9	00090000-5630-f5df-ebff-d3ae3fe5fb21	0010	A	Mojster	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-5630-f5df-ba3f-1e9891e17dae	00090000-5630-f5df-88d6-bd1f2bbdde6a	0003	A	Igralec	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-5630-f5df-359d-334f581b011e	00090000-5630-f5df-d46e-6ef8568fce93	0008	A	Natakar	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-5630-f5df-c7b4-90b67aafe593	00090000-5630-f5df-585b-58a79a8447a9	0004	A	Mizar	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-5630-f5df-456e-7e8dce483241	00090000-5630-f5df-d88c-c05d4d772331	0009	A	Šivilja	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-5630-f5df-f9b9-d5007c936c78	00090000-5630-f5df-fb23-be1c62cdbf7b	0007	A	Inšpicient	2010-02-01	\N	1	2		t	f	f	t	\N
\.


--
-- TOC entry 3086 (class 0 OID 23925990)
-- Dependencies: 202
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id, oseba_id) FROM stdin;
\.


--
-- TOC entry 3115 (class 0 OID 23926273)
-- Dependencies: 231
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, sifra, naziv, opis) FROM stdin;
00140000-5630-f5dd-f4a4-b33356fd6fe0	01	Drama	drama (SURS 01)
00140000-5630-f5dd-1368-27c5869bebfb	02	Opera	opera (SURS 02)
00140000-5630-f5dd-b800-1d36761bb753	03	Balet	balet (SURS 03)
00140000-5630-f5dd-5686-707e55141a59	04	Plesne prireditve	plesne prireditve (SURS 04)
00140000-5630-f5dd-69f8-de4fdf60fe8e	05	Lutkovno gledališče	lutkovno gledališče (SURS 05)
00140000-5630-f5dd-0b17-5deb5ba323d4	06	Raziskovalno gledališče	raziskovalno gledališče (SURS 06)
00140000-5630-f5dd-3a13-b0b0bb0c9e82	07	Drugo	drugo (SURS 07)
\.


--
-- TOC entry 3105 (class 0 OID 23926154)
-- Dependencies: 221
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, sifra, naziv, opis) FROM stdin;
\.


--
-- TOC entry 2554 (class 2606 OID 23925725)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2770 (class 2606 OID 23926332)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2766 (class 2606 OID 23926322)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2729 (class 2606 OID 23926189)
-- Name: avtorbesedila_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT avtorbesedila_pkey PRIMARY KEY (id);


--
-- TOC entry 2740 (class 2606 OID 23926231)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2827 (class 2606 OID 23926609)
-- Name: datoteka_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT datoteka_pkey PRIMARY KEY (id);


--
-- TOC entry 2636 (class 2606 OID 23925979)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2651 (class 2606 OID 23926000)
-- Name: dogodeksplosni_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodeksplosni
    ADD CONSTRAINT dogodeksplosni_pkey PRIMARY KEY (id);


--
-- TOC entry 2803 (class 2606 OID 23926527)
-- Name: drugivir_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT drugivir_pkey PRIMARY KEY (id);


--
-- TOC entry 2599 (class 2606 OID 23925874)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2777 (class 2606 OID 23926400)
-- Name: enotaprograma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT enotaprograma_pkey PRIMARY KEY (id);


--
-- TOC entry 2713 (class 2606 OID 23926150)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2627 (class 2606 OID 23925945)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2616 (class 2606 OID 23925912)
-- Name: job_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY job
    ADD CONSTRAINT job_pkey PRIMARY KEY (id);


--
-- TOC entry 2607 (class 2606 OID 23925888)
-- Name: kontaktnaoseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT kontaktnaoseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2677 (class 2606 OID 23926057)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2821 (class 2606 OID 23926586)
-- Name: mapa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT mapa_pkey PRIMARY KEY (id);


--
-- TOC entry 2825 (class 2606 OID 23926593)
-- Name: mapa_zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT mapa_zapis_pkey PRIMARY KEY (mapa_id, zapis_id);


--
-- TOC entry 2832 (class 2606 OID 23926617)
-- Name: mapaacl_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT mapaacl_pkey PRIMARY KEY (id);


--
-- TOC entry 2526 (class 2606 OID 23562337)
-- Name: migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY migrations
    ADD CONSTRAINT migrations_pkey PRIMARY KEY (version);


--
-- TOC entry 2689 (class 2606 OID 23926084)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2592 (class 2606 OID 23925846)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2562 (class 2606 OID 23925744)
-- Name: optionvalue_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT optionvalue_pkey PRIMARY KEY (id);


--
-- TOC entry 2581 (class 2606 OID 23925808)
-- Name: organizacijskaenota_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT organizacijskaenota_pkey PRIMARY KEY (id);


--
-- TOC entry 2565 (class 2606 OID 23925771)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2552 (class 2606 OID 23925714)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2545 (class 2606 OID 23925699)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2692 (class 2606 OID 23926090)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2706 (class 2606 OID 23926126)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2752 (class 2606 OID 23926268)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2575 (class 2606 OID 23925799)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2589 (class 2606 OID 23925834)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2787 (class 2606 OID 23926479)
-- Name: postavkacdve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkacdve
    ADD CONSTRAINT postavkacdve_pkey PRIMARY KEY (id);


--
-- TOC entry 2681 (class 2606 OID 23926063)
-- Name: postavkaracuna_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT postavkaracuna_pkey PRIMARY KEY (id);


--
-- TOC entry 2587 (class 2606 OID 23925824)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2634 (class 2606 OID 23925964)
-- Name: praznik_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY praznik
    ADD CONSTRAINT praznik_pkey PRIMARY KEY (id);


--
-- TOC entry 2625 (class 2606 OID 23925933)
-- Name: predstava_abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava_abonma
    ADD CONSTRAINT predstava_abonma_pkey PRIMARY KEY (predstava_id, abonma_id);


--
-- TOC entry 2621 (class 2606 OID 23925925)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2687 (class 2606 OID 23926075)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2791 (class 2606 OID 23926488)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2793 (class 2606 OID 23926496)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2784 (class 2606 OID 23926466)
-- Name: programdela_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT programdela_pkey PRIMARY KEY (id);


--
-- TOC entry 2798 (class 2606 OID 23926508)
-- Name: programskaenotasklopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT programskaenotasklopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2699 (class 2606 OID 23926108)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2675 (class 2606 OID 23926048)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2669 (class 2606 OID 23926039)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2747 (class 2606 OID 23926255)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2727 (class 2606 OID 23926182)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2610 (class 2606 OID 23925900)
-- Name: report_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY report
    ADD CONSTRAINT report_pkey PRIMARY KEY (id);


--
-- TOC entry 2537 (class 2606 OID 23925670)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2704 (class 2606 OID 23926117)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2543 (class 2606 OID 23925688)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2547 (class 2606 OID 23925708)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2711 (class 2606 OID 23926135)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2683 (class 2606 OID 23926070)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2657 (class 2606 OID 23926019)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2534 (class 2606 OID 23925658)
-- Name: stevilcenje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenje
    ADD CONSTRAINT stevilcenje_pkey PRIMARY KEY (id);


--
-- TOC entry 2531 (class 2606 OID 23925646)
-- Name: stevilcenjekonfig_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT stevilcenjekonfig_pkey PRIMARY KEY (id);


--
-- TOC entry 2528 (class 2606 OID 23925640)
-- Name: stevilcenjestanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjestanje
    ADD CONSTRAINT stevilcenjestanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2736 (class 2606 OID 23926202)
-- Name: strosekuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT strosekuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2571 (class 2606 OID 23925780)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2663 (class 2606 OID 23926030)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2743 (class 2606 OID 23926242)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2556 (class 2606 OID 23925733)
-- Name: tippopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tippopa
    ADD CONSTRAINT tippopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2800 (class 2606 OID 23926520)
-- Name: tipprogramskeenote_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipprogramskeenote
    ADD CONSTRAINT tipprogramskeenote_pkey PRIMARY KEY (id);


--
-- TOC entry 2653 (class 2606 OID 23926008)
-- Name: tipvaje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipvaje
    ADD CONSTRAINT tipvaje_pkey PRIMARY KEY (id);


--
-- TOC entry 2597 (class 2606 OID 23925859)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2539 (class 2606 OID 23925683)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2764 (class 2606 OID 23926301)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2632 (class 2606 OID 23925954)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2695 (class 2606 OID 23926098)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2738 (class 2606 OID 23926214)
-- Name: vrstastroska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstastroska
    ADD CONSTRAINT vrstastroska_pkey PRIMARY KEY (id);


--
-- TOC entry 2814 (class 2606 OID 23926567)
-- Name: vrstazapisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstazapisa
    ADD CONSTRAINT vrstazapisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2811 (class 2606 OID 23926551)
-- Name: zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT zapis_pkey PRIMARY KEY (id);


--
-- TOC entry 2817 (class 2606 OID 23926575)
-- Name: zapislastnik_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT zapislastnik_pkey PRIMARY KEY (id);


--
-- TOC entry 2723 (class 2606 OID 23926172)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2649 (class 2606 OID 23925994)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2756 (class 2606 OID 23926281)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2719 (class 2606 OID 23926162)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2637 (class 1259 OID 23925988)
-- Name: dogodki_konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_konec ON dogodek USING btree (konec);


--
-- TOC entry 2638 (class 1259 OID 23925989)
-- Name: dogodki_razred; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_razred ON dogodek USING btree (razred);


--
-- TOC entry 2639 (class 1259 OID 23925987)
-- Name: dogodki_zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2640 (class 1259 OID 23925986)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2641 (class 1259 OID 23925985)
-- Name: idx_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2732 (class 1259 OID 23926203)
-- Name: idx_11ffe6e05c75296c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e05c75296c ON strosekuprizoritve USING btree (vrstastroska_id);


--
-- TOC entry 2733 (class 1259 OID 23926204)
-- Name: idx_11ffe6e062b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e062b4ffca ON strosekuprizoritve USING btree (uprizoritev_id);


--
-- TOC entry 2734 (class 1259 OID 23926205)
-- Name: idx_11ffe6e06beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e06beede51 ON strosekuprizoritve USING btree (popa_id);


--
-- TOC entry 2818 (class 1259 OID 23926588)
-- Name: idx_14a5d6d3727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d3727aca70 ON mapa USING btree (parent_id);


--
-- TOC entry 2819 (class 1259 OID 23926587)
-- Name: idx_14a5d6d38a4a6c12; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d38a4a6c12 ON mapa USING btree (lastnik_id);


--
-- TOC entry 2572 (class 1259 OID 23925801)
-- Name: idx_1c7adba589552cb2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba589552cb2 ON popa USING btree (tipkli_id);


--
-- TOC entry 2573 (class 1259 OID 23925802)
-- Name: idx_1c7adba5ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba5ee4b985a ON popa USING btree (drzava_id);


--
-- TOC entry 2690 (class 1259 OID 23926091)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2805 (class 1259 OID 23926555)
-- Name: idx_1ed92829253c4123; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829253c4123 ON zapis USING btree (avtor_id);


--
-- TOC entry 2806 (class 1259 OID 23926554)
-- Name: idx_1ed9282957ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282957ed422f ON zapis USING btree (mapa_id);


--
-- TOC entry 2807 (class 1259 OID 23926556)
-- Name: idx_1ed9282987ff3295; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282987ff3295 ON zapis USING btree (zaklenil_id);


--
-- TOC entry 2808 (class 1259 OID 23926553)
-- Name: idx_1ed92829a54dbb1f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829a54dbb1f ON zapis USING btree (datoteka_id);


--
-- TOC entry 2809 (class 1259 OID 23926552)
-- Name: idx_1ed92829ef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829ef943358 ON zapis USING btree (vrsta_id);


--
-- TOC entry 2684 (class 1259 OID 23926077)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2685 (class 1259 OID 23926076)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2629 (class 1259 OID 23925955)
-- Name: idx_2390fc964ad2a6ea; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc964ad2a6ea ON vaja USING btree (tipvaje_id);


--
-- TOC entry 2630 (class 1259 OID 23925956)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2714 (class 1259 OID 23926151)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2715 (class 1259 OID 23926153)
-- Name: idx_23aeb9586b361365; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9586b361365 ON funkcija USING btree (tipfunkcije_id);


--
-- TOC entry 2716 (class 1259 OID 23926152)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2604 (class 1259 OID 23925890)
-- Name: idx_2942b10710389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b10710389148 ON kontaktnaoseba USING btree (oseba_id);


--
-- TOC entry 2605 (class 1259 OID 23925889)
-- Name: idx_2942b1076beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b1076beede51 ON kontaktnaoseba USING btree (popa_id);


--
-- TOC entry 2796 (class 1259 OID 23926509)
-- Name: idx_2d901816d6bc69d6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2d901816d6bc69d6 ON programskaenotasklopa USING btree (programrazno_id);


--
-- TOC entry 2748 (class 1259 OID 23926270)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2749 (class 1259 OID 23926271)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2750 (class 1259 OID 23926272)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2815 (class 1259 OID 23926576)
-- Name: idx_2eaff9dcaf91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2eaff9dcaf91ecd ON zapislastnik USING btree (zapis_id);


--
-- TOC entry 2757 (class 1259 OID 23926306)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2758 (class 1259 OID 23926303)
-- Name: idx_344a77a7c3b0d59; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a7c3b0d59 ON uprizoritev USING btree (maticnioder_id);


--
-- TOC entry 2759 (class 1259 OID 23926307)
-- Name: idx_344a77a853a965c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a853a965c ON uprizoritev USING btree (producent_id);


--
-- TOC entry 2760 (class 1259 OID 23926305)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2761 (class 1259 OID 23926304)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2594 (class 1259 OID 23925861)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2595 (class 1259 OID 23925860)
-- Name: idx_37f6541a6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a6beede51 ON trr USING btree (popa_id);


--
-- TOC entry 2563 (class 1259 OID 23925774)
-- Name: idx_466966d769e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_466966d769e8d4 ON oseba USING btree (naslov_id);


--
-- TOC entry 2702 (class 1259 OID 23926118)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2549 (class 1259 OID 23925715)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2550 (class 1259 OID 23925716)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2707 (class 1259 OID 23926138)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2708 (class 1259 OID 23926137)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2709 (class 1259 OID 23926136)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2577 (class 1259 OID 23925811)
-- Name: idx_5e2fdc29289ed596; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29289ed596 ON organizacijskaenota USING btree (vodja_id);


--
-- TOC entry 2578 (class 1259 OID 23925810)
-- Name: idx_5e2fdc29727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29727aca70 ON organizacijskaenota USING btree (parent_id);


--
-- TOC entry 2579 (class 1259 OID 23925812)
-- Name: idx_5e2fdc29f0020ed7; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29f0020ed7 ON organizacijskaenota USING btree (namestnik_id);


--
-- TOC entry 2617 (class 1259 OID 23925928)
-- Name: idx_602f6e461174bb0e; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e461174bb0e ON predstava USING btree (dezurni_id);


--
-- TOC entry 2618 (class 1259 OID 23925926)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2619 (class 1259 OID 23925927)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2529 (class 1259 OID 23925648)
-- Name: idx_6054e804ff55f926; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_6054e804ff55f926 ON stevilcenjekonfig USING btree (stevilcenje_id);


--
-- TOC entry 2664 (class 1259 OID 23926043)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2665 (class 1259 OID 23926041)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2666 (class 1259 OID 23926040)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2667 (class 1259 OID 23926042)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2540 (class 1259 OID 23925689)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2541 (class 1259 OID 23925690)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2693 (class 1259 OID 23926099)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2828 (class 1259 OID 23926610)
-- Name: idx_781826c67e3c61f9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_781826c67e3c61f9 ON datoteka USING btree (owner_id);


--
-- TOC entry 2730 (class 1259 OID 23926191)
-- Name: idx_7ab77b7910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7ab77b7910389148 ON avtorbesedila USING btree (oseba_id);


--
-- TOC entry 2731 (class 1259 OID 23926190)
-- Name: idx_7ab77b79f35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7ab77b79f35157b1 ON avtorbesedila USING btree (besedilo_id);


--
-- TOC entry 2829 (class 1259 OID 23926618)
-- Name: idx_7adc957157ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc957157ed422f ON mapaacl USING btree (mapa_id);


--
-- TOC entry 2830 (class 1259 OID 23926619)
-- Name: idx_7adc9571fa6311ef; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc9571fa6311ef ON mapaacl USING btree (perm_id);


--
-- TOC entry 2679 (class 1259 OID 23926064)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2724 (class 1259 OID 23926183)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2725 (class 1259 OID 23926184)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2778 (class 1259 OID 23926405)
-- Name: idx_8787a0e54ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e54ae1cd1c ON enotaprograma USING btree (gostitelj_id);


--
-- TOC entry 2779 (class 1259 OID 23926404)
-- Name: idx_8787a0e55d0da56c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e55d0da56c ON enotaprograma USING btree (drzavagostovanja_id);


--
-- TOC entry 2780 (class 1259 OID 23926401)
-- Name: idx_8787a0e562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e562b4ffca ON enotaprograma USING btree (uprizoritev_id);


--
-- TOC entry 2781 (class 1259 OID 23926402)
-- Name: idx_8787a0e57222d84b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e57222d84b ON enotaprograma USING btree (tipprogramskeenote_id);


--
-- TOC entry 2782 (class 1259 OID 23926403)
-- Name: idx_8787a0e5771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e5771ec7bd ON enotaprograma USING btree (program_dela_id);


--
-- TOC entry 2583 (class 1259 OID 23925826)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2584 (class 1259 OID 23925825)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2585 (class 1259 OID 23925827)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2696 (class 1259 OID 23926112)
-- Name: idx_952dd21969e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd21969e8d4 ON prostor USING btree (naslov_id);


--
-- TOC entry 2697 (class 1259 OID 23926111)
-- Name: idx_952dd2196beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd2196beede51 ON prostor USING btree (popa_id);


--
-- TOC entry 2788 (class 1259 OID 23926489)
-- Name: idx_97af082e38c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e38c06eb ON produkcijadelitev USING btree (enotaprograma_id);


--
-- TOC entry 2789 (class 1259 OID 23926490)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2771 (class 1259 OID 23926336)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2772 (class 1259 OID 23926337)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2773 (class 1259 OID 23926334)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2774 (class 1259 OID 23926335)
-- Name: idx_a4b7244fa4976613; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fa4976613 ON alternacija USING btree (zaposlitev_id);


--
-- TOC entry 2720 (class 1259 OID 23926173)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2721 (class 1259 OID 23926174)
-- Name: idx_b24490415f1e9d88; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b24490415f1e9d88 ON zaposlitev USING btree (organizacijskaenota_id);


--
-- TOC entry 2670 (class 1259 OID 23926052)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2671 (class 1259 OID 23926051)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2672 (class 1259 OID 23926049)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2673 (class 1259 OID 23926050)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2767 (class 1259 OID 23926324)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2768 (class 1259 OID 23926323)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2608 (class 1259 OID 23925901)
-- Name: idx_c38372b2be04ea9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c38372b2be04ea9 ON report USING btree (job_id);


--
-- TOC entry 2611 (class 1259 OID 23925915)
-- Name: idx_c395a6181bb9e62c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a6181bb9e62c ON job USING btree (datum);


--
-- TOC entry 2612 (class 1259 OID 23925914)
-- Name: idx_c395a618941027cc; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618941027cc ON job USING btree (casizvedbe);


--
-- TOC entry 2613 (class 1259 OID 23925913)
-- Name: idx_c395a618a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618a76ed395 ON job USING btree (user_id);


--
-- TOC entry 2614 (class 1259 OID 23925916)
-- Name: idx_c395a618aecf5af0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618aecf5af0 ON job USING btree (izveden);


--
-- TOC entry 2628 (class 1259 OID 23925946)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2622 (class 1259 OID 23925934)
-- Name: idx_d9ece16b5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_d9ece16b5ac894aa ON predstava_abonma USING btree (predstava_id);


--
-- TOC entry 2623 (class 1259 OID 23925935)
-- Name: idx_d9ece16bbe74b11; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_d9ece16bbe74b11 ON predstava_abonma USING btree (abonma_id);


--
-- TOC entry 2785 (class 1259 OID 23926480)
-- Name: idx_dba42fe79e3adf2c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_dba42fe79e3adf2c ON postavkacdve USING btree (programdela_id);


--
-- TOC entry 2804 (class 1259 OID 23926528)
-- Name: idx_e7d4cf2638c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e7d4cf2638c06eb ON drugivir USING btree (enotaprograma_id);


--
-- TOC entry 2822 (class 1259 OID 23926594)
-- Name: idx_e9f8ee8257ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee8257ed422f ON mapa_zapis USING btree (mapa_id);


--
-- TOC entry 2823 (class 1259 OID 23926595)
-- Name: idx_e9f8ee82af91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee82af91ecd ON mapa_zapis USING btree (zapis_id);


--
-- TOC entry 2559 (class 1259 OID 23925746)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2560 (class 1259 OID 23925745)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2568 (class 1259 OID 23925781)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2569 (class 1259 OID 23925782)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2647 (class 1259 OID 23925995)
-- Name: idx_f44a386d10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_f44a386d10389148 ON zasedenost USING btree (oseba_id);


--
-- TOC entry 2659 (class 1259 OID 23926033)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2660 (class 1259 OID 23926032)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2661 (class 1259 OID 23926031)
-- Name: idx_fef7d84ba81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84ba81ccef6 ON terminstoritve USING btree (dogodek_id);


--
-- TOC entry 2642 (class 1259 OID 23925981)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2643 (class 1259 OID 23925982)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2644 (class 1259 OID 23925980)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2645 (class 1259 OID 23925984)
-- Name: uniq_11e93b5dbbc7a989; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dbbc7a989 ON dogodek USING btree (dogodek_splosni_id);


--
-- TOC entry 2646 (class 1259 OID 23925983)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2576 (class 1259 OID 23925800)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2557 (class 1259 OID 23925734)
-- Name: uniq_1d30700559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1d30700559828a3 ON tippopa USING btree (sifra);


--
-- TOC entry 2558 (class 1259 OID 23925735)
-- Name: uniq_1d3070055cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1d3070055cca980 ON tippopa USING btree (ime);


--
-- TOC entry 2600 (class 1259 OID 23925875)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2601 (class 1259 OID 23925877)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2602 (class 1259 OID 23925876)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2603 (class 1259 OID 23925878)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2678 (class 1259 OID 23926058)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2753 (class 1259 OID 23926269)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2762 (class 1259 OID 23926302)
-- Name: uniq_344a77a559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_344a77a559828a3 ON uprizoritev USING btree (sifra);


--
-- TOC entry 2744 (class 1259 OID 23926243)
-- Name: uniq_3f50510d559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d559828a3 ON tipfunkcije USING btree (sifra);


--
-- TOC entry 2745 (class 1259 OID 23926244)
-- Name: uniq_3f50510d55cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d55cca980 ON tipfunkcije USING btree (ime);


--
-- TOC entry 2566 (class 1259 OID 23925772)
-- Name: uniq_466966d7559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7559828a3 ON oseba USING btree (sifra);


--
-- TOC entry 2567 (class 1259 OID 23925773)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2717 (class 1259 OID 23926163)
-- Name: uniq_5216fcb0559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5216fcb0559828a3 ON zvrstuprizoritve USING btree (sifra);


--
-- TOC entry 2535 (class 1259 OID 23925659)
-- Name: uniq_5a434fbc559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5a434fbc559828a3 ON stevilcenje USING btree (sifra);


--
-- TOC entry 2593 (class 1259 OID 23925847)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2582 (class 1259 OID 23925809)
-- Name: uniq_5e2fdc29559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5e2fdc29559828a3 ON organizacijskaenota USING btree (sifra);


--
-- TOC entry 2532 (class 1259 OID 23925647)
-- Name: uniq_6054e804889a7556; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_6054e804889a7556 ON stevilcenjekonfig USING btree (dok);


--
-- TOC entry 2801 (class 1259 OID 23926521)
-- Name: uniq_7d834df4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_7d834df4559828a3 ON tipprogramskeenote USING btree (sifra);


--
-- TOC entry 2700 (class 1259 OID 23926110)
-- Name: uniq_952dd21937854736; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21937854736 ON prostor USING btree (naziv);


--
-- TOC entry 2701 (class 1259 OID 23926109)
-- Name: uniq_952dd219559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd219559828a3 ON prostor USING btree (sifra);


--
-- TOC entry 2654 (class 1259 OID 23926009)
-- Name: uniq_99664b14559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_99664b14559828a3 ON tipvaje USING btree (sifra);


--
-- TOC entry 2655 (class 1259 OID 23926010)
-- Name: uniq_99664b1455cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_99664b1455cca980 ON tipvaje USING btree (ime);


--
-- TOC entry 2775 (class 1259 OID 23926333)
-- Name: uniq_a4b7244f559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a4b7244f559828a3 ON alternacija USING btree (sifra);


--
-- TOC entry 2590 (class 1259 OID 23925835)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2754 (class 1259 OID 23926282)
-- Name: uniq_cede8e36559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_cede8e36559828a3 ON zvrstsurs USING btree (sifra);


--
-- TOC entry 2812 (class 1259 OID 23926568)
-- Name: uniq_de1c8aa1d55226c7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_de1c8aa1d55226c7 ON vrstazapisa USING btree (oznaka);


--
-- TOC entry 2794 (class 1259 OID 23926497)
-- Name: uniq_e6fc2028559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc2028559828a3 ON produkcijskahisa USING btree (sifra);


--
-- TOC entry 2795 (class 1259 OID 23926498)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2741 (class 1259 OID 23926232)
-- Name: uniq_ec773670ca2e5fcb; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ec773670ca2e5fcb ON besedilo USING btree (stevilka);


--
-- TOC entry 2658 (class 1259 OID 23926020)
-- Name: uniq_ecc8f8c5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ecc8f8c5559828a3 ON sezona USING btree (sifra);


--
-- TOC entry 2548 (class 1259 OID 23925709)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2871 (class 2606 OID 23926790)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2870 (class 2606 OID 23926795)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2866 (class 2606 OID 23926815)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2872 (class 2606 OID 23926785)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2868 (class 2606 OID 23926805)
-- Name: fk_11e93b5dbbc7a989; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dbbc7a989 FOREIGN KEY (dogodek_splosni_id) REFERENCES dogodeksplosni(id);


--
-- TOC entry 2867 (class 2606 OID 23926810)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2869 (class 2606 OID 23926800)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2908 (class 2606 OID 23926985)
-- Name: fk_11ffe6e05c75296c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e05c75296c FOREIGN KEY (vrstastroska_id) REFERENCES vrstastroska(id);


--
-- TOC entry 2907 (class 2606 OID 23926990)
-- Name: fk_11ffe6e062b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e062b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2906 (class 2606 OID 23926995)
-- Name: fk_11ffe6e06beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e06beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2940 (class 2606 OID 23927160)
-- Name: fk_14a5d6d3727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d3727aca70 FOREIGN KEY (parent_id) REFERENCES mapa(id);


--
-- TOC entry 2941 (class 2606 OID 23927155)
-- Name: fk_14a5d6d38a4a6c12; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d38a4a6c12 FOREIGN KEY (lastnik_id) REFERENCES uporabniki(id);


--
-- TOC entry 2845 (class 2606 OID 23926675)
-- Name: fk_1c7adba589552cb2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba589552cb2 FOREIGN KEY (tipkli_id) REFERENCES tippopa(id);


--
-- TOC entry 2844 (class 2606 OID 23926680)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2889 (class 2606 OID 23926900)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2935 (class 2606 OID 23927140)
-- Name: fk_1ed92829253c4123; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829253c4123 FOREIGN KEY (avtor_id) REFERENCES uporabniki(id);


--
-- TOC entry 2936 (class 2606 OID 23927135)
-- Name: fk_1ed9282957ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282957ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2934 (class 2606 OID 23927145)
-- Name: fk_1ed9282987ff3295; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282987ff3295 FOREIGN KEY (zaklenil_id) REFERENCES uporabniki(id);


--
-- TOC entry 2937 (class 2606 OID 23927130)
-- Name: fk_1ed92829a54dbb1f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829a54dbb1f FOREIGN KEY (datoteka_id) REFERENCES datoteka(id);


--
-- TOC entry 2938 (class 2606 OID 23927125)
-- Name: fk_1ed92829ef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829ef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstazapisa(id);


--
-- TOC entry 2887 (class 2606 OID 23926895)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2888 (class 2606 OID 23926890)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2865 (class 2606 OID 23926775)
-- Name: fk_2390fc964ad2a6ea; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc964ad2a6ea FOREIGN KEY (tipvaje_id) REFERENCES tipvaje(id);


--
-- TOC entry 2864 (class 2606 OID 23926780)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2899 (class 2606 OID 23926940)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2897 (class 2606 OID 23926950)
-- Name: fk_23aeb9586b361365; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9586b361365 FOREIGN KEY (tipfunkcije_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2898 (class 2606 OID 23926945)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2854 (class 2606 OID 23926730)
-- Name: fk_2942b10710389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b10710389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2855 (class 2606 OID 23926725)
-- Name: fk_2942b1076beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b1076beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2885 (class 2606 OID 23926880)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2932 (class 2606 OID 23927115)
-- Name: fk_2d901816d6bc69d6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT fk_2d901816d6bc69d6 FOREIGN KEY (programrazno_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2911 (class 2606 OID 23927000)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2910 (class 2606 OID 23927005)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2909 (class 2606 OID 23927010)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 2939 (class 2606 OID 23927150)
-- Name: fk_2eaff9dcaf91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT fk_2eaff9dcaf91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id);


--
-- TOC entry 2913 (class 2606 OID 23927030)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2916 (class 2606 OID 23927015)
-- Name: fk_344a77a7c3b0d59; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a7c3b0d59 FOREIGN KEY (maticnioder_id) REFERENCES prostor(id);


--
-- TOC entry 2912 (class 2606 OID 23927035)
-- Name: fk_344a77a853a965c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a853a965c FOREIGN KEY (producent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2914 (class 2606 OID 23927025)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2915 (class 2606 OID 23927020)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2852 (class 2606 OID 23926720)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2853 (class 2606 OID 23926715)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2840 (class 2606 OID 23926660)
-- Name: fk_466966d769e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d769e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2841 (class 2606 OID 23926655)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2893 (class 2606 OID 23926920)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2837 (class 2606 OID 23926635)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2836 (class 2606 OID 23926640)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2894 (class 2606 OID 23926935)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2895 (class 2606 OID 23926930)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2896 (class 2606 OID 23926925)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2847 (class 2606 OID 23926690)
-- Name: fk_5e2fdc29289ed596; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29289ed596 FOREIGN KEY (vodja_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2848 (class 2606 OID 23926685)
-- Name: fk_5e2fdc29727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29727aca70 FOREIGN KEY (parent_id) REFERENCES organizacijskaenota(id);


--
-- TOC entry 2846 (class 2606 OID 23926695)
-- Name: fk_5e2fdc29f0020ed7; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29f0020ed7 FOREIGN KEY (namestnik_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2858 (class 2606 OID 23926755)
-- Name: fk_602f6e461174bb0e; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e461174bb0e FOREIGN KEY (dezurni_id) REFERENCES oseba(id);


--
-- TOC entry 2860 (class 2606 OID 23926745)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2859 (class 2606 OID 23926750)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2833 (class 2606 OID 23926620)
-- Name: fk_6054e804ff55f926; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT fk_6054e804ff55f926 FOREIGN KEY (stevilcenje_id) REFERENCES stevilcenje(id);


--
-- TOC entry 2877 (class 2606 OID 23926855)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2879 (class 2606 OID 23926845)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2880 (class 2606 OID 23926840)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2878 (class 2606 OID 23926850)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2835 (class 2606 OID 23926625)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2834 (class 2606 OID 23926630)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2890 (class 2606 OID 23926905)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2944 (class 2606 OID 23927175)
-- Name: fk_781826c67e3c61f9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT fk_781826c67e3c61f9 FOREIGN KEY (owner_id) REFERENCES uporabniki(id);


--
-- TOC entry 2904 (class 2606 OID 23926980)
-- Name: fk_7ab77b7910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT fk_7ab77b7910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2905 (class 2606 OID 23926975)
-- Name: fk_7ab77b79f35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT fk_7ab77b79f35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2946 (class 2606 OID 23927180)
-- Name: fk_7adc957157ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc957157ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2945 (class 2606 OID 23927185)
-- Name: fk_7adc9571fa6311ef; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc9571fa6311ef FOREIGN KEY (perm_id) REFERENCES permission(id);


--
-- TOC entry 2886 (class 2606 OID 23926885)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2903 (class 2606 OID 23926965)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2902 (class 2606 OID 23926970)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2923 (class 2606 OID 23927090)
-- Name: fk_8787a0e54ae1cd1c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e54ae1cd1c FOREIGN KEY (gostitelj_id) REFERENCES popa(id);


--
-- TOC entry 2924 (class 2606 OID 23927085)
-- Name: fk_8787a0e55d0da56c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e55d0da56c FOREIGN KEY (drzavagostovanja_id) REFERENCES drza(id);


--
-- TOC entry 2927 (class 2606 OID 23927070)
-- Name: fk_8787a0e562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2926 (class 2606 OID 23927075)
-- Name: fk_8787a0e57222d84b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e57222d84b FOREIGN KEY (tipprogramskeenote_id) REFERENCES tipprogramskeenote(id);


--
-- TOC entry 2925 (class 2606 OID 23927080)
-- Name: fk_8787a0e5771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e5771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2850 (class 2606 OID 23926705)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2851 (class 2606 OID 23926700)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2849 (class 2606 OID 23926710)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2891 (class 2606 OID 23926915)
-- Name: fk_952dd21969e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd21969e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2892 (class 2606 OID 23926910)
-- Name: fk_952dd2196beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd2196beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2930 (class 2606 OID 23927100)
-- Name: fk_97af082e38c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e38c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2929 (class 2606 OID 23927105)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2920 (class 2606 OID 23927060)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2919 (class 2606 OID 23927065)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2922 (class 2606 OID 23927050)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 2921 (class 2606 OID 23927055)
-- Name: fk_a4b7244fa4976613; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fa4976613 FOREIGN KEY (zaposlitev_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2901 (class 2606 OID 23926955)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2900 (class 2606 OID 23926960)
-- Name: fk_b24490415f1e9d88; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b24490415f1e9d88 FOREIGN KEY (organizacijskaenota_id) REFERENCES organizacijskaenota(id);


--
-- TOC entry 2881 (class 2606 OID 23926875)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2882 (class 2606 OID 23926870)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2884 (class 2606 OID 23926860)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2883 (class 2606 OID 23926865)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2917 (class 2606 OID 23927045)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2918 (class 2606 OID 23927040)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2856 (class 2606 OID 23926735)
-- Name: fk_c38372b2be04ea9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY report
    ADD CONSTRAINT fk_c38372b2be04ea9 FOREIGN KEY (job_id) REFERENCES job(id);


--
-- TOC entry 2857 (class 2606 OID 23926740)
-- Name: fk_c395a618a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY job
    ADD CONSTRAINT fk_c395a618a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2863 (class 2606 OID 23926770)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2862 (class 2606 OID 23926760)
-- Name: fk_d9ece16b5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava_abonma
    ADD CONSTRAINT fk_d9ece16b5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id) ON DELETE CASCADE;


--
-- TOC entry 2861 (class 2606 OID 23926765)
-- Name: fk_d9ece16bbe74b11; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava_abonma
    ADD CONSTRAINT fk_d9ece16bbe74b11 FOREIGN KEY (abonma_id) REFERENCES abonma(id) ON DELETE CASCADE;


--
-- TOC entry 2928 (class 2606 OID 23927095)
-- Name: fk_dba42fe79e3adf2c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkacdve
    ADD CONSTRAINT fk_dba42fe79e3adf2c FOREIGN KEY (programdela_id) REFERENCES programdela(id);


--
-- TOC entry 2931 (class 2606 OID 23927110)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2933 (class 2606 OID 23927120)
-- Name: fk_e7d4cf2638c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT fk_e7d4cf2638c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2943 (class 2606 OID 23927165)
-- Name: fk_e9f8ee8257ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee8257ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id) ON DELETE CASCADE;


--
-- TOC entry 2942 (class 2606 OID 23927170)
-- Name: fk_e9f8ee82af91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee82af91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id) ON DELETE CASCADE;


--
-- TOC entry 2838 (class 2606 OID 23926650)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2839 (class 2606 OID 23926645)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2843 (class 2606 OID 23926665)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2842 (class 2606 OID 23926670)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2873 (class 2606 OID 23926820)
-- Name: fk_f44a386d10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT fk_f44a386d10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2874 (class 2606 OID 23926835)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2875 (class 2606 OID 23926830)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2876 (class 2606 OID 23926825)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- Completed on 2015-10-28 17:20:50 CET

--
-- PostgreSQL database dump complete
--

