--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.9
-- Dumped by pg_dump version 9.3.9
-- Started on 2015-10-15 13:21:38 CEST

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- TOC entry 246 (class 3079 OID 11789)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 3088 (class 0 OID 0)
-- Dependencies: 246
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_with_oids = false;

--
-- TOC entry 181 (class 1259 OID 22023725)
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
-- TOC entry 230 (class 1259 OID 22024293)
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
-- TOC entry 229 (class 1259 OID 22024276)
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
-- TOC entry 220 (class 1259 OID 22024153)
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
-- TOC entry 223 (class 1259 OID 22024183)
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
-- TOC entry 244 (class 1259 OID 22024564)
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
-- TOC entry 198 (class 1259 OID 22023944)
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
-- TOC entry 200 (class 1259 OID 22023975)
-- Name: dogodeksplosni; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodeksplosni (
    id uuid NOT NULL
);


--
-- TOC entry 238 (class 1259 OID 22024490)
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
-- TOC entry 191 (class 1259 OID 22023857)
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
-- TOC entry 231 (class 1259 OID 22024306)
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
-- TOC entry 216 (class 1259 OID 22024108)
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
-- TOC entry 196 (class 1259 OID 22023923)
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
-- TOC entry 194 (class 1259 OID 22023897)
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
-- TOC entry 3089 (class 0 OID 0)
-- Dependencies: 194
-- Name: COLUMN job.data; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN job.data IS '(DC2Type:object)';


--
-- TOC entry 192 (class 1259 OID 22023874)
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
-- TOC entry 205 (class 1259 OID 22024022)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 242 (class 1259 OID 22024545)
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
-- TOC entry 243 (class 1259 OID 22024557)
-- Name: mapa_zapis; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE mapa_zapis (
    mapa_id uuid NOT NULL,
    zapis_id uuid NOT NULL
);


--
-- TOC entry 245 (class 1259 OID 22024579)
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
-- TOC entry 170 (class 1259 OID 21932907)
-- Name: migrations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE migrations (
    version character varying(255) NOT NULL
);


--
-- TOC entry 209 (class 1259 OID 22024047)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 189 (class 1259 OID 22023831)
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
-- TOC entry 183 (class 1259 OID 22023744)
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
-- TOC entry 184 (class 1259 OID 22023755)
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
-- TOC entry 178 (class 1259 OID 22023699)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 180 (class 1259 OID 22023718)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 210 (class 1259 OID 22024054)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 214 (class 1259 OID 22024088)
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
-- TOC entry 226 (class 1259 OID 22024224)
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
-- TOC entry 186 (class 1259 OID 22023788)
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
-- TOC entry 188 (class 1259 OID 22023823)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 233 (class 1259 OID 22024435)
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
-- TOC entry 206 (class 1259 OID 22024028)
-- Name: postavkaracuna; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE postavkaracuna (
    id uuid NOT NULL,
    racun_id uuid
);


--
-- TOC entry 187 (class 1259 OID 22023808)
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
-- TOC entry 195 (class 1259 OID 22023912)
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
-- TOC entry 208 (class 1259 OID 22024040)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 234 (class 1259 OID 22024449)
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
-- TOC entry 235 (class 1259 OID 22024459)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    sifra character varying(4) NOT NULL,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 232 (class 1259 OID 22024374)
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
-- TOC entry 236 (class 1259 OID 22024467)
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
-- TOC entry 212 (class 1259 OID 22024069)
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
-- TOC entry 204 (class 1259 OID 22024013)
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
-- TOC entry 203 (class 1259 OID 22024003)
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
-- TOC entry 225 (class 1259 OID 22024213)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying,
    status character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 219 (class 1259 OID 22024143)
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
-- TOC entry 193 (class 1259 OID 22023886)
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
-- TOC entry 175 (class 1259 OID 22023670)
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
-- TOC entry 174 (class 1259 OID 22023668)
-- Name: revizije_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE revizije_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3090 (class 0 OID 0)
-- Dependencies: 174
-- Name: revizije_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE revizije_id_seq OWNED BY revizije.id;


--
-- TOC entry 213 (class 1259 OID 22024082)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 179 (class 1259 OID 22023708)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 177 (class 1259 OID 22023692)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 215 (class 1259 OID 22024096)
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
-- TOC entry 207 (class 1259 OID 22024034)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 201 (class 1259 OID 22023980)
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
-- TOC entry 173 (class 1259 OID 22023657)
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
-- TOC entry 172 (class 1259 OID 22023649)
-- Name: stevilcenjekonfig; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjekonfig (
    id uuid NOT NULL,
    stevilcenje_id uuid,
    dok character varying(100) DEFAULT NULL::character varying
);


--
-- TOC entry 171 (class 1259 OID 22023644)
-- Name: stevilcenjestanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjestanje (
    id uuid NOT NULL,
    objid uuid NOT NULL,
    leto integer NOT NULL,
    stevilka integer
);


--
-- TOC entry 221 (class 1259 OID 22024160)
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
-- TOC entry 185 (class 1259 OID 22023780)
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
-- TOC entry 202 (class 1259 OID 22023990)
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
-- TOC entry 224 (class 1259 OID 22024201)
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
-- TOC entry 182 (class 1259 OID 22023734)
-- Name: tippopa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tippopa (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    ime character varying(255) NOT NULL,
    opis text
);


--
-- TOC entry 237 (class 1259 OID 22024478)
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
-- TOC entry 190 (class 1259 OID 22023843)
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
-- TOC entry 176 (class 1259 OID 22023679)
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
-- TOC entry 228 (class 1259 OID 22024251)
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
-- TOC entry 197 (class 1259 OID 22023934)
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
-- TOC entry 211 (class 1259 OID 22024061)
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
-- TOC entry 222 (class 1259 OID 22024174)
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
-- TOC entry 240 (class 1259 OID 22024525)
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
-- TOC entry 239 (class 1259 OID 22024497)
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
-- TOC entry 241 (class 1259 OID 22024537)
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
-- TOC entry 218 (class 1259 OID 22024133)
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
-- TOC entry 199 (class 1259 OID 22023969)
-- Name: zasedenost; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zasedenost (
    id uuid NOT NULL,
    oseba_id uuid
);


--
-- TOC entry 227 (class 1259 OID 22024241)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 217 (class 1259 OID 22024123)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 2206 (class 2604 OID 22023673)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 3017 (class 0 OID 22023725)
-- Dependencies: 181
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
\.


--
-- TOC entry 3066 (class 0 OID 22024293)
-- Dependencies: 230
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, zaposlitev_id, oseba_id, pogodba_id, sifra, zaposlen, zacetek, konec, opomba, sort, privzeti, aktivna, imapogodbo, pomembna) FROM stdin;
000c0000-561f-8c3f-93da-447da9413b5b	000d0000-561f-8c3f-1391-dd0151a3388d	\N	00090000-561f-8c3f-f1fb-0bed5c839410	000b0000-561f-8c3f-e428-b90bef9337d3	0001	f	\N	\N	\N	3	t	\N	t	t
000c0000-561f-8c3f-a7c8-9199b7181423	000d0000-561f-8c3f-f8d9-d8cab08f04f1	00100000-561f-8c3f-1040-6385e25a4b2f	00090000-561f-8c3f-fb32-6e91d24cb043	\N	0002	t	2016-01-01	\N	\N	8	t	\N	f	f
000c0000-561f-8c3f-be8c-2d80a8009f8a	000d0000-561f-8c3f-ad7b-2c55c9020542	00100000-561f-8c3f-2ddd-ab314b03529f	00090000-561f-8c3f-3ea2-c820da14d7e3	\N	0003	t	\N	2015-10-15	\N	2	t	\N	f	f
000c0000-561f-8c3f-4a7a-c10f77b65445	000d0000-561f-8c3f-c477-112277b7be27	\N	00090000-561f-8c3f-6a54-ed6136fde520	\N	0004	f	2016-01-01	2016-01-01	\N	26	t	\N	f	f
000c0000-561f-8c3f-aca9-4f7a590d9aff	000d0000-561f-8c3f-385b-e7e42793cb9d	\N	00090000-561f-8c3f-11ab-5b6b7938249c	\N	0005	f	2016-01-01	2016-01-01	\N	7	t	\N	f	f
000c0000-561f-8c3f-b94d-ea7e43deb469	000d0000-561f-8c3f-7cfe-db8a6afa94ba	\N	00090000-561f-8c3f-4cf7-ce68b1744147	000b0000-561f-8c3f-f981-c5aea3845a25	0006	f	2016-01-01	2016-01-01	\N	1	t	\N	t	t
000c0000-561f-8c3f-ee01-d82458ac248b	000d0000-561f-8c3f-d44d-b04567ee9768	00100000-561f-8c3f-c51b-1918f4ae437b	00090000-561f-8c3f-bdee-cf4adbbe2e43	\N	0007	t	2016-01-01	2016-01-01	\N	14	t	\N	f	t
000c0000-561f-8c3f-895d-16bc67079ad9	000d0000-561f-8c3f-52e6-f215fe2809a4	\N	00090000-561f-8c3f-f25a-31aae340d507	000b0000-561f-8c3f-9f61-bfe141c78895	0008	f	2016-01-01	2016-01-01	\N	12	t	\N	t	t
000c0000-561f-8c3f-cb5f-c4153489d2aa	000d0000-561f-8c3f-d44d-b04567ee9768	00100000-561f-8c3f-e809-7b4a79175ff4	00090000-561f-8c3f-d0ab-0fc8c8b05116	\N	0009	t	2017-01-01	2017-01-01	\N	15	t	\N	f	t
000c0000-561f-8c3f-c31f-448a27e0137e	000d0000-561f-8c3f-d44d-b04567ee9768	00100000-561f-8c3f-8232-d2e6eafe214d	00090000-561f-8c3f-d616-9373788e2ebc	\N	0010	t	\N	2015-10-15	\N	16	f	\N	f	t
000c0000-561f-8c3f-ead3-699b6a95f760	000d0000-561f-8c3f-d44d-b04567ee9768	00100000-561f-8c3f-3806-67ec17d5a119	00090000-561f-8c3f-6052-6d005cc9f118	\N	0011	t	2017-01-01	\N	\N	17	f	\N	f	t
000c0000-561f-8c3f-3d55-923191fbe1f0	000d0000-561f-8c3f-7607-33f691f86bc9	\N	00090000-561f-8c3f-fb32-6e91d24cb043	000b0000-561f-8c3f-8b5b-ed01e82439bf	0012	f	\N	\N	\N	2	t	\N	t	t
\.


--
-- TOC entry 3065 (class 0 OID 22024276)
-- Dependencies: 229
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 3056 (class 0 OID 22024153)
-- Dependencies: 220
-- Data for Name: avtorbesedila; Type: TABLE DATA; Schema: public; Owner: -
--

COPY avtorbesedila (id, besedilo_id, oseba_id, tipavtorja, zaporedna, alivnaslovu) FROM stdin;
003d0000-561f-8c3f-016f-4b50b68b826e	00160000-561f-8c3e-42ad-2ab4d964f75d	00090000-561f-8c3f-9724-63330a25eee4	aizv	10	t
003d0000-561f-8c3f-3b6e-8905c2d4a1ff	00160000-561f-8c3e-42ad-2ab4d964f75d	00090000-561f-8c3f-d5d4-7b040aa7e061	apri	14	t
003d0000-561f-8c3f-6cbc-5005dde7ac69	00160000-561f-8c3e-8a41-fbe6c5f4d89b	00090000-561f-8c3f-bfc3-c746d4b4aa21	aizv	11	t
003d0000-561f-8c3f-bf9f-bc7f298ca215	00160000-561f-8c3e-af3a-bc7c13a643c0	00090000-561f-8c3f-35f0-fb3ecde9ce11	aizv	12	t
003d0000-561f-8c3f-487d-b55437685215	00160000-561f-8c3e-42ad-2ab4d964f75d	00090000-561f-8c3f-7db1-204bef214d25	apri	18	f
\.


--
-- TOC entry 3059 (class 0 OID 22024183)
-- Dependencies: 223
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, stevilka, naslov, podnaslov, jezik, naslovizvirnika, podnaslovizvirnika, internacionalninaslov, datumprejema, moskevloge, zenskevloge, povzetekvsebine, letoizida, krajizida, zaloznik, avtor) FROM stdin;
00160000-561f-8c3e-42ad-2ab4d964f75d	0001	Sen kresne noči		slovenščina	A Midsummer Night's Dream	\N	\N	2015-04-26	5	5	Nastopajo Titanija, Hipolita, Oberon, ...	\N	\N	\N	William  Shakespeare - Nebojša  Kavader
00160000-561f-8c3e-8a41-fbe6c5f4d89b	0002	Bratje Karamazovi		slovenščina	Bratja Karamazjovji	\N	\N	2015-12-04	4	1	Svetovna uspešnica	\N	\N	\N	Fjodor Mihajlovič Dostojevski
00160000-561f-8c3e-af3a-bc7c13a643c0	0003	Smoletov Vrt		slovenščina		\N	\N	2015-05-26	2	8		\N	\N	\N	Berta   Hočevar
\.


--
-- TOC entry 3080 (class 0 OID 22024564)
-- Dependencies: 244
-- Data for Name: datoteka; Type: TABLE DATA; Schema: public; Owner: -
--

COPY datoteka (id, owner_id, filename, transfers, size, format, hash, createdat, uploadedat, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3034 (class 0 OID 22023944)
-- Dependencies: 198
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_splosni_id, prostor_id, sezona_id, allday, zacetek, konec, status, razred, termin, title) FROM stdin;
00180000-561f-8c3f-ec9c-893a3fce8e67	\N	\N	00200000-561f-8c3f-9a78-f286f793944b	\N	\N	\N	\N	f	2015-06-26 10:00:00	2015-06-26 12:00:00	200s	200s		dogodek 1
00180000-561f-8c3f-c400-9c0a4244f8b9	\N	\N	00200000-561f-8c3f-5fc2-4e1feac01141	\N	\N	\N	\N	f	2015-06-27 10:00:00	2015-06-27 12:00:00	300s	200s		dogodek 2
00180000-561f-8c3f-d0d2-a798e2ea6599	\N	\N	00200000-561f-8c3f-f398-28c252acb93f	\N	\N	\N	\N	f	2015-08-01 20:00:00	2015-08-01 23:00:00	400s	200s		dogodek 3
00180000-561f-8c3f-600b-195388ead76f	\N	\N	00200000-561f-8c3f-ac89-183dcbee9a28	\N	\N	\N	\N	f	2015-08-01 20:00:00	2015-08-01 23:00:00	100s	200s		dogodek 4
00180000-561f-8c3f-98ef-349a633c68d6	\N	\N	00200000-561f-8c3f-b03e-6714cd79b48c	\N	\N	\N	\N	f	2015-08-01 20:00:00	2015-08-01 23:00:00	500s	200s		dogodek 5
\.


--
-- TOC entry 3036 (class 0 OID 22023975)
-- Dependencies: 200
-- Data for Name: dogodeksplosni; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodeksplosni (id) FROM stdin;
\.


--
-- TOC entry 3074 (class 0 OID 22024490)
-- Dependencies: 238
-- Data for Name: drugivir; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drugivir (id, znesek, opis, mednarodni, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 3027 (class 0 OID 22023857)
-- Dependencies: 191
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-561f-8c3c-4e4e-f95e84388dfd	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-561f-8c3c-370e-0d0946e22fe6	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-561f-8c3c-08ca-f549de597f8c	AL	ALB	008	Albania 	Albanija	\N
00040000-561f-8c3c-4acc-0b7faef872a4	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-561f-8c3c-e2d5-ad2c4c41628a	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-561f-8c3c-b400-9efd7cdabbb8	AD	AND	020	Andorra 	Andora	\N
00040000-561f-8c3c-249e-cde300b7138f	AO	AGO	024	Angola 	Angola	\N
00040000-561f-8c3c-732b-9d6da08e70a3	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-561f-8c3c-01ce-e31f9f2ba607	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-561f-8c3c-a3b7-550fef80b06b	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-561f-8c3c-da06-9a289300dfab	AR	ARG	032	Argentina 	Argenitna	\N
00040000-561f-8c3c-e107-dfcbca01e856	AM	ARM	051	Armenia 	Armenija	\N
00040000-561f-8c3c-0067-9898c3be71ff	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-561f-8c3c-ffac-2d778900c1e2	AU	AUS	036	Australia 	Avstralija	\N
00040000-561f-8c3c-c08e-495e5eda7337	AT	AUT	040	Austria 	Avstrija	\N
00040000-561f-8c3c-2a1e-3efda93e17b9	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-561f-8c3c-da5e-e02b6a3a9064	BS	BHS	044	Bahamas 	Bahami	\N
00040000-561f-8c3c-4a91-78c557e25b2e	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-561f-8c3c-995b-09c76af4f484	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-561f-8c3c-58ed-f7e23010aeed	BB	BRB	052	Barbados 	Barbados	\N
00040000-561f-8c3c-52fc-f4dca1efce4e	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-561f-8c3c-51fd-06b6e61192bb	BE	BEL	056	Belgium 	Belgija	\N
00040000-561f-8c3c-e042-ed0b3319c714	BZ	BLZ	084	Belize 	Belize	\N
00040000-561f-8c3c-1b1f-ac1129757500	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-561f-8c3c-7669-688d3d426a1b	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-561f-8c3c-fa2b-2a6e725bf7d7	BT	BTN	064	Bhutan 	Butan	\N
00040000-561f-8c3c-dfc6-c1c6ad9a642c	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-561f-8c3c-f55e-6142711dbde3	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-561f-8c3c-00d7-6686a01fef64	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-561f-8c3c-3091-1da267481004	BW	BWA	072	Botswana 	Bocvana	\N
00040000-561f-8c3c-0e67-dca70dfd06ca	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-561f-8c3c-4165-01cbc41a34fe	BR	BRA	076	Brazil 	Brazilija	\N
00040000-561f-8c3c-94e0-e8ed1d6fd2a3	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-561f-8c3c-2b8b-377f967de066	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-561f-8c3c-b2cd-978ea5bc7e0a	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-561f-8c3c-dede-8092c3a76730	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-561f-8c3c-7b3f-041eed1eac93	BI	BDI	108	Burundi 	Burundi 	\N
00040000-561f-8c3c-cd46-1c1fc8d032bc	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-561f-8c3c-0aec-a454ae526aa0	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-561f-8c3c-d63d-d270ef7b6a6e	CA	CAN	124	Canada 	Kanada	\N
00040000-561f-8c3c-384f-6245a12210c6	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-561f-8c3c-d380-1d21cb6fb8bd	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-561f-8c3c-9f2e-0053096a7f36	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-561f-8c3c-4774-9e0459374f72	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-561f-8c3c-1934-3c15a008bb4e	CL	CHL	152	Chile 	Čile	\N
00040000-561f-8c3c-2529-80213102ab08	CN	CHN	156	China 	Kitajska	\N
00040000-561f-8c3c-54f5-ecdb02bce59e	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-561f-8c3c-6744-a75b47857d74	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-561f-8c3c-0a50-c023cd6bd55f	CO	COL	170	Colombia 	Kolumbija	\N
00040000-561f-8c3c-e1c0-1f617b02dd46	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-561f-8c3c-992d-a997f2f22caa	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-561f-8c3c-a07c-49a2e584422c	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-561f-8c3c-f20d-cec7e2c4e715	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-561f-8c3c-3980-4a9314bcda93	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-561f-8c3c-fb76-0e252d67834f	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-561f-8c3c-8266-19814a3a9513	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-561f-8c3c-d7fa-d27148d430b9	CU	CUB	192	Cuba 	Kuba	\N
00040000-561f-8c3c-9d10-165c32159dc7	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-561f-8c3c-99b2-012b1fdff34b	CY	CYP	196	Cyprus 	Ciper	\N
00040000-561f-8c3c-b227-d9a24fa774a2	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-561f-8c3c-3be3-1e73bcfc67f6	DK	DNK	208	Denmark 	Danska	\N
00040000-561f-8c3c-31e0-5c9522ebbdd0	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-561f-8c3c-83ed-a3934ec48609	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-561f-8c3c-62b6-d1e72b299cb7	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-561f-8c3c-e7da-c9453f6a8e0e	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-561f-8c3c-0ae0-50c675a2a1d5	EG	EGY	818	Egypt 	Egipt	\N
00040000-561f-8c3c-48b4-4830d4c7b304	SV	SLV	222	El Salvador 	Salvador	\N
00040000-561f-8c3c-550c-9439d2a2d204	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-561f-8c3c-91c9-f66e52345ff0	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-561f-8c3c-8c96-d1b35bae6fcc	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-561f-8c3c-0365-159e9c101c97	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-561f-8c3c-4ccd-dbc24050f34b	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-561f-8c3c-4a65-ccc38fd1b715	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-561f-8c3c-00f8-d9b7b6f15ab9	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-561f-8c3c-f260-de42f9f28d1f	FI	FIN	246	Finland 	Finska	\N
00040000-561f-8c3c-3944-43217e444131	FR	FRA	250	France 	Francija	\N
00040000-561f-8c3c-d451-7db76e231690	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-561f-8c3c-7df5-f770c81be001	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-561f-8c3c-ed86-e1936bd70e1b	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-561f-8c3c-8359-584f4720467d	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-561f-8c3c-99eb-6d425d607c7a	GA	GAB	266	Gabon 	Gabon	\N
00040000-561f-8c3c-308b-cf54847adf6b	GM	GMB	270	Gambia 	Gambija	\N
00040000-561f-8c3c-b8a4-4e1995c8d930	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-561f-8c3c-a967-6077910f9185	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-561f-8c3c-9b25-4778e3c9f14a	GH	GHA	288	Ghana 	Gana	\N
00040000-561f-8c3c-6670-76e937835be5	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-561f-8c3c-eca9-3abce244a866	GR	GRC	300	Greece 	Grčija	\N
00040000-561f-8c3c-e0eb-d01a0319ad58	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-561f-8c3c-2223-098f0d98b07b	GD	GRD	308	Grenada 	Grenada	\N
00040000-561f-8c3c-4625-996f22cd938e	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-561f-8c3c-ff7f-a493571ef33d	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-561f-8c3c-2bf5-b4b0ad7817ee	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-561f-8c3c-87af-18806e51f725	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-561f-8c3c-b584-1e5aadd148f8	GN	GIN	324	Guinea 	Gvineja	\N
00040000-561f-8c3c-e569-70c4d7e611d2	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-561f-8c3c-406a-9802ac76b441	GY	GUY	328	Guyana 	Gvajana	\N
00040000-561f-8c3c-afc2-458e1be9dd80	HT	HTI	332	Haiti 	Haiti	\N
00040000-561f-8c3c-d085-96e16e43c30f	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-561f-8c3c-1de5-bb87da213f59	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-561f-8c3c-2ce8-b8f557513bfb	HN	HND	340	Honduras 	Honduras	\N
00040000-561f-8c3c-9dc3-1398de9d78d6	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-561f-8c3c-fa95-b48ddb078bce	HU	HUN	348	Hungary 	Madžarska	\N
00040000-561f-8c3c-e40f-478369f75c5a	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-561f-8c3c-8da9-109b9a568a17	IN	IND	356	India 	Indija	\N
00040000-561f-8c3c-5144-254e1286b702	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-561f-8c3c-104b-a2a4335bfbd8	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-561f-8c3c-f731-3c7a8da61775	IQ	IRQ	368	Iraq 	Irak	\N
00040000-561f-8c3c-5351-25d3d5913cf7	IE	IRL	372	Ireland 	Irska	\N
00040000-561f-8c3c-f883-9c82020bedb8	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-561f-8c3c-8b7e-f6bbe545f569	IL	ISR	376	Israel 	Izrael	\N
00040000-561f-8c3c-bb2d-8a65dfaa9fa2	IT	ITA	380	Italy 	Italija	\N
00040000-561f-8c3c-b4a9-9531b874f8f2	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-561f-8c3c-f816-1b259a4ce8a8	JP	JPN	392	Japan 	Japonska	\N
00040000-561f-8c3c-3421-7a40b93045a4	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-561f-8c3c-ee6a-b6ca4bc128dc	JO	JOR	400	Jordan 	Jordanija	\N
00040000-561f-8c3c-1a3e-10b6001318f2	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-561f-8c3c-f88a-70b9c51a7bc1	KE	KEN	404	Kenya 	Kenija	\N
00040000-561f-8c3c-9f64-c21d2d3fe32b	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-561f-8c3c-cd04-e02287b96161	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-561f-8c3c-50a3-ea8e71af1ba6	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-561f-8c3c-1c5a-11b94a592300	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-561f-8c3c-75aa-0d359ebbf86e	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-561f-8c3c-23af-ab4352eb8784	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-561f-8c3c-c0c0-1592524651b0	LV	LVA	428	Latvia 	Latvija	\N
00040000-561f-8c3c-79e4-2848182b5a74	LB	LBN	422	Lebanon 	Libanon	\N
00040000-561f-8c3c-0c40-ba3dff125ec3	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-561f-8c3c-5ef8-2732306d512c	LR	LBR	430	Liberia 	Liberija	\N
00040000-561f-8c3c-2c71-f9a123f58fa0	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-561f-8c3c-9472-fb70f8fe328c	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-561f-8c3c-a20d-dc88525d8a64	LT	LTU	440	Lithuania 	Litva	\N
00040000-561f-8c3c-2fef-a560338293fa	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-561f-8c3c-ba86-7384d0c892c6	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-561f-8c3c-7796-257c1cbaecc3	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-561f-8c3c-24a2-33ee186f125f	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-561f-8c3c-3418-500a69efbffa	MW	MWI	454	Malawi 	Malavi	\N
00040000-561f-8c3c-2f97-cd4e7f580915	MY	MYS	458	Malaysia 	Malezija	\N
00040000-561f-8c3c-4138-f0b081416647	MV	MDV	462	Maldives 	Maldivi	\N
00040000-561f-8c3c-fe72-3c4d8c2996bd	ML	MLI	466	Mali 	Mali	\N
00040000-561f-8c3c-7ed6-698d90d8af08	MT	MLT	470	Malta 	Malta	\N
00040000-561f-8c3c-6164-5239e809729c	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-561f-8c3c-dcf7-db714dd1abf0	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-561f-8c3c-8500-adde7169123c	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-561f-8c3c-fcc7-3093a41c442a	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-561f-8c3c-173d-de6128993552	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-561f-8c3c-16a9-e988311b5b56	MX	MEX	484	Mexico 	Mehika	\N
00040000-561f-8c3c-b32e-fa407178bd79	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-561f-8c3c-1fed-cc3dbc01a57f	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-561f-8c3c-de14-8694554b71c2	MC	MCO	492	Monaco 	Monako	\N
00040000-561f-8c3c-c40c-91ff81dbdf4c	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-561f-8c3c-33fd-a750b7313a7b	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-561f-8c3c-450b-eafaa65734c6	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-561f-8c3c-5d51-532ad7e9f420	MA	MAR	504	Morocco 	Maroko	\N
00040000-561f-8c3c-ec71-a86109eb7f9e	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-561f-8c3c-ed86-9b83b8172a93	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-561f-8c3c-2334-1c383c9d5f40	NA	NAM	516	Namibia 	Namibija	\N
00040000-561f-8c3c-dec9-7b99fdc9ff51	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-561f-8c3c-14ba-2a20632542dc	NP	NPL	524	Nepal 	Nepal	\N
00040000-561f-8c3c-4864-e79e948e90ab	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-561f-8c3c-8554-94907a985224	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-561f-8c3c-9a79-8a8222fe3e42	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-561f-8c3c-dd4c-d7a16c96506e	NE	NER	562	Niger 	Niger 	\N
00040000-561f-8c3c-5398-87685820d2de	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-561f-8c3c-856a-766954af232d	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-561f-8c3c-f5c6-51b795a8128a	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-561f-8c3c-a64e-c52f14cae3c4	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-561f-8c3c-2cf9-1b5778cb00cc	NO	NOR	578	Norway 	Norveška	\N
00040000-561f-8c3c-27d3-6226c7c8f2a2	OM	OMN	512	Oman 	Oman	\N
00040000-561f-8c3c-bce0-1662d510d032	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-561f-8c3c-c2bb-414b470cc1c2	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-561f-8c3c-23da-a4b993ce8019	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-561f-8c3c-c525-440e9d1f4667	PA	PAN	591	Panama 	Panama	\N
00040000-561f-8c3c-4c8a-abe88bcf4b15	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-561f-8c3c-642c-b10f6073d6d8	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-561f-8c3c-da1f-03eeb0d53fa2	PE	PER	604	Peru 	Peru	\N
00040000-561f-8c3c-056f-786c2f063dba	PH	PHL	608	Philippines 	Filipini	\N
00040000-561f-8c3c-bbde-02a74aac8578	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-561f-8c3c-af7c-2a1456b47bb7	PL	POL	616	Poland 	Poljska	\N
00040000-561f-8c3c-9f0c-733e6a98a123	PT	PRT	620	Portugal 	Portugalska	\N
00040000-561f-8c3c-9ee7-4e8f3f62afa7	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-561f-8c3c-4a81-86f1ec1be7ac	QA	QAT	634	Qatar 	Katar	\N
00040000-561f-8c3c-e682-e882ad5caddd	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-561f-8c3c-91fe-67bb02a0ef8c	RO	ROU	642	Romania 	Romunija	\N
00040000-561f-8c3c-d759-7c82d26aaff1	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-561f-8c3c-4bfe-0040c1d1a4a5	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-561f-8c3c-61b1-24e137ebea33	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-561f-8c3c-8495-3dec989a97a2	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-561f-8c3c-2512-72b152e79cb8	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-561f-8c3c-3d7a-af0164c0513b	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-561f-8c3c-84be-ac26b6c42d85	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-561f-8c3c-72c8-f74ed4729f84	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-561f-8c3c-ace8-1e1950f37a3b	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-561f-8c3c-a1fa-8dcfb21b8b5a	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-561f-8c3c-cce9-df85aec22a70	SM	SMR	674	San Marino 	San Marino	\N
00040000-561f-8c3c-c300-b7c22ac2d50c	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-561f-8c3c-58b8-9b70b33f5793	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-561f-8c3c-661f-4bfba1be9f5e	SN	SEN	686	Senegal 	Senegal	\N
00040000-561f-8c3c-ec9f-be2e67f9d881	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-561f-8c3c-bc8c-3299b3ebaaca	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-561f-8c3c-d329-7fa8ed48c81c	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-561f-8c3c-79e0-bf0a2f35bb6c	SG	SGP	702	Singapore 	Singapur	\N
00040000-561f-8c3c-0fbb-d7f79c313c7c	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-561f-8c3c-07af-69c9272b3403	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-561f-8c3c-6b14-ffbc619a9f47	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-561f-8c3c-facd-6bb15f02fe8f	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-561f-8c3c-9e68-8e3db103b121	SO	SOM	706	Somalia 	Somalija	\N
00040000-561f-8c3c-e0bd-3a90f8a6f54c	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-561f-8c3c-f8e6-ea1a49911da4	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-561f-8c3c-f7a1-51708be270a8	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-561f-8c3c-b991-9598ba4eee33	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-561f-8c3c-af8b-f746ed5c2beb	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-561f-8c3c-5cf8-cef9b635c50c	SD	SDN	729	Sudan 	Sudan	\N
00040000-561f-8c3c-75cf-312fe1fd511f	SR	SUR	740	Suriname 	Surinam	\N
00040000-561f-8c3c-937c-48717980cd90	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-561f-8c3c-b36a-15b1a78dff6a	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-561f-8c3c-77a1-0c8335dc47a1	SE	SWE	752	Sweden 	Švedska	\N
00040000-561f-8c3c-7187-fb5f2a579334	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-561f-8c3c-a1d8-17222f4fe217	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-561f-8c3c-96ab-fe4613011454	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-561f-8c3c-221c-c476597016c8	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-561f-8c3c-6f20-58e190f89b50	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-561f-8c3c-cc7a-cd461436244d	TH	THA	764	Thailand 	Tajska	\N
00040000-561f-8c3c-512a-baaa8f86c81c	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-561f-8c3c-f3e6-4790dab42182	TG	TGO	768	Togo 	Togo	\N
00040000-561f-8c3c-316a-8addf113070c	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-561f-8c3c-8f18-3162d93ad37f	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-561f-8c3c-23a3-82ab82eeb356	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-561f-8c3c-a28b-594f29cf4dd0	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-561f-8c3c-683e-96e6311d6243	TR	TUR	792	Turkey 	Turčija	\N
00040000-561f-8c3c-1acf-603ac770b285	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-561f-8c3c-d378-68ff6c3e7337	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-561f-8c3c-3702-b6e89688dd5f	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-561f-8c3c-1b78-0c88967c71e1	UG	UGA	800	Uganda 	Uganda	\N
00040000-561f-8c3c-a2ca-0459cb0cea17	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-561f-8c3c-e9bb-192b74aaeba8	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-561f-8c3c-f579-6bf424b5a52b	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-561f-8c3c-7251-a776fcc4d628	US	USA	840	United States 	Združene države Amerike	\N
00040000-561f-8c3c-5781-6179fe13a329	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-561f-8c3c-28ad-b221fa5b3360	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-561f-8c3c-fc7a-63e897186c07	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-561f-8c3c-3b06-19bf0364386c	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-561f-8c3c-bac2-ff028f098f2a	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-561f-8c3c-2af6-c5cba456960d	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-561f-8c3c-da47-7f9e8a438f72	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-561f-8c3c-dc8f-f95931e0bf43	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-561f-8c3c-b28b-f45d8662e3b2	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-561f-8c3c-bbf3-14cc22a9ba31	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-561f-8c3c-72f0-6210d69f322e	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-561f-8c3c-2d2a-5d1736eddc3e	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-561f-8c3c-1bdc-a37c985ee133	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 3067 (class 0 OID 22024306)
-- Dependencies: 231
-- Data for Name: enotaprograma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY enotaprograma (id, uprizoritev_id, program_dela_id, gostitelj_id, celotnavrednost, nasdelez, celotnavrednostmat, celotnavrednostgostovsz, zaproseno, lastnasredstva, avtorskihonorarji, avtorskihonorarjisamoz, tantieme, avtorskepravice, materialni, imakoprodukcije, vlozekgostitelja, drugijavni, stzaposlenih, stzaposumet, stzaposdrug, sthonorarnihzun, sthonorarnihzunigr, sthonorarnihzunigrtujjz, sthonorarnihzunsamoz, obiskdoma, obiskkopr, obiskgost, obiskkoprgost, obiskzamejo, obiskkoprzamejo, obiskint, obiskkoprint, ponovidoma, ponovikopr, ponovizamejo, ponovikoprzamejo, ponovigost, ponovikoprgost, ponovikoprint, ponoviint, naziv, kpe, sort, tipprogramskeenote_id, tip, prikoproducentu, prizorisce, trajanje, zvrst, avtor, reziser, datum, soustvarjalci, strosekodkpred, stroskiostali, krajgostovanja, ustanova, datumgostovanja, transportnistroski, dnevprvzad, drzavagostovanja_id, stpe, stpredstav, stokroglihmiz, stpredstavitev, stdelavnic, stdrugidogodki, stprodukcij, caspriprave, casizvedbe, prizorisca, umetvodja, programskotelo, sttujihselektorjev) FROM stdin;
002f0000-561f-8c3f-325e-f021e3a0af9a	000e0000-561f-8c3f-e68e-7afe62b40c63	\N	\N	9000.30	9000.30	9000.30	0.00	3600.12	5299.98	4000.40	1000.40	200.20	200.30	4599.40	\N	0.00	100.20	0	2	2	2	2	2	0	40	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-561f-8c3c-eea4-56f3b18a3d89	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-561f-8c3f-7823-1a46bcc0dac9	000e0000-561f-8c3f-744b-1f82a926860e	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	0	60	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-561f-8c3c-17b5-614254a430b1	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-561f-8c3f-f4a4-262a394d9a32	000e0000-561f-8c3f-5941-2b9f154b0776	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	0	60	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-561f-8c3c-eea4-56f3b18a3d89	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-561f-8c3f-9628-bf6879160cbe	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-54.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	54.20	5	0	0	3	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0	0	Urejanje portala	0.00	10	\N	razno	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-561f-8c3f-10d3-42dd51ffb303	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-31.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	31.20	5	0	0	3	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0	0	Delavnice otroci	0.00	8	\N	razno	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 3052 (class 0 OID 22024108)
-- Dependencies: 216
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, podrocje, vodjaekipe, naziv, komentar, velikost, pomembna, sort, seplanira, dovoliprekrivanje, maxprekrivanj, tipfunkcije_id) FROM stdin;
000d0000-561f-8c3f-1391-dd0151a3388d	000e0000-561f-8c3f-744b-1f82a926860e	000c0000-561f-8c3f-93da-447da9413b5b	igralec	\N	Tezej	glavna vloga	velika	t	5	t	t	\N	000f0000-561f-8c3c-a877-4bf56a64e216
000d0000-561f-8c3f-f8d9-d8cab08f04f1	000e0000-561f-8c3f-744b-1f82a926860e	000c0000-561f-8c3f-a7c8-9199b7181423	umetnik	\N	Režija		velika	t	8	t	t	\N	000f0000-561f-8c3c-cd90-14c194b898b9
000d0000-561f-8c3f-ad7b-2c55c9020542	000e0000-561f-8c3f-744b-1f82a926860e	000c0000-561f-8c3f-be8c-2d80a8009f8a	inspicient	t	Inšpicient			t	8	t	t	\N	000f0000-561f-8c3c-02b8-2b5ed69cd877
000d0000-561f-8c3f-c477-112277b7be27	000e0000-561f-8c3f-744b-1f82a926860e	000c0000-561f-8c3f-4a7a-c10f77b65445	tehnik	t	Tehnični vodja			t	8	t	t	\N	000f0000-561f-8c3c-3836-8c3f5067f63f
000d0000-561f-8c3f-385b-e7e42793cb9d	000e0000-561f-8c3f-744b-1f82a926860e	000c0000-561f-8c3f-aca9-4f7a590d9aff	tehnik	\N	Razsvetljava			t	3	t	t	\N	000f0000-561f-8c3c-3836-8c3f5067f63f
000d0000-561f-8c3f-7cfe-db8a6afa94ba	000e0000-561f-8c3f-744b-1f82a926860e	000c0000-561f-8c3f-b94d-ea7e43deb469	igralec	\N	Helena	glavna vloga	velika	t	5	t	t	\N	000f0000-561f-8c3c-a877-4bf56a64e216
000d0000-561f-8c3f-d44d-b04567ee9768	000e0000-561f-8c3f-744b-1f82a926860e	000c0000-561f-8c3f-cb5f-c4153489d2aa	igralec	\N	Hipolita	glavna vloga	velika	t	6	t	t	\N	000f0000-561f-8c3c-a877-4bf56a64e216
000d0000-561f-8c3f-52e6-f215fe2809a4	000e0000-561f-8c3f-744b-1f82a926860e	000c0000-561f-8c3f-895d-16bc67079ad9	umetnik	\N	Lektoriranje			t	22	t	t	\N	000f0000-561f-8c3c-1726-755f152c6f4f
000d0000-561f-8c3f-7607-33f691f86bc9	000e0000-561f-8c3f-744b-1f82a926860e	000c0000-561f-8c3f-3d55-923191fbe1f0	umetnik	\N	Avtor	Avtor besedila		t	2	t	f	\N	000f0000-561f-8c3c-f007-8eb526b4ac54
\.


--
-- TOC entry 3032 (class 0 OID 22023923)
-- Dependencies: 196
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta, zamejstvo, kraj) FROM stdin;
\.


--
-- TOC entry 3030 (class 0 OID 22023897)
-- Dependencies: 194
-- Data for Name: job; Type: TABLE DATA; Schema: public; Owner: -
--

COPY job (id, user_id, name, task, status, log, datum, casizvedbe, izveden, data, alert, hidden, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3028 (class 0 OID 22023874)
-- Dependencies: 192
-- Data for Name: kontaktnaoseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kontaktnaoseba (id, popa_id, oseba_id, status, funkcija, opis) FROM stdin;
00260000-561f-8c3f-6877-4ebf746dd40f	00080000-561f-8c3f-5183-ad706dbf9047	00090000-561f-8c3f-d616-9373788e2ebc	AK		igralka
\.


--
-- TOC entry 3041 (class 0 OID 22024022)
-- Dependencies: 205
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 3078 (class 0 OID 22024545)
-- Dependencies: 242
-- Data for Name: mapa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa (id, lastnik_id, parent_id, ime, komentar, caskreiranja, casspremembe, javnidostop, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3079 (class 0 OID 22024557)
-- Dependencies: 243
-- Data for Name: mapa_zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa_zapis (mapa_id, zapis_id) FROM stdin;
\.


--
-- TOC entry 3081 (class 0 OID 22024579)
-- Dependencies: 245
-- Data for Name: mapaacl; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapaacl (id, mapa_id, perm_id, dostop, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3006 (class 0 OID 21932907)
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
\.


--
-- TOC entry 3045 (class 0 OID 22024047)
-- Dependencies: 209
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 3025 (class 0 OID 22023831)
-- Dependencies: 189
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-561f-8c3d-4121-b87da49d41a7	popa.stakli	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-561f-8c3d-36de-b2d900ed6454	oseba.spol	array	a:2:{s:1:"M";a:1:{s:5:"label";s:6:"Moški";}s:1:"Z";a:1:{s:5:"label";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-561f-8c3d-2bfc-0dfbc7c1ec0f	telefonska.vrsta	array	a:3:{s:7:"mobilna";a:1:{s:5:"label";s:7:"Mobilni";}s:6:"domaca";a:1:{s:5:"label";s:6:"Domač";}s:6:"fiksna";a:1:{s:5:"label";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-561f-8c3d-0818-2ac0815fe1be	kontaktnaoseba.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status kontaktne osebe
00000000-561f-8c3d-78b7-9e4fb81702f0	dogodek.status	array	a:8:{s:4:"100s";a:1:{s:5:"label";s:11:"Dolgoročno";}s:4:"200s";a:1:{s:5:"label";s:9:"Planirano";}s:4:"300s";a:1:{s:5:"label";s:8:"Fiksiran";}s:4:"400s";a:1:{s:5:"label";s:17:"Potrjen - interno";}s:4:"500s";a:1:{s:5:"label";s:15:"Potrjen - javno";}s:4:"600s";a:1:{s:5:"label";s:10:"Zaključen";}s:4:"610s";a:1:{s:5:"label";s:9:"Odpovedan";}s:4:"700s";a:1:{s:5:"label";s:7:"Obdelan";}}	f	t	t	\N	Tabela statusa dogodkov
00000000-561f-8c3d-9e8b-d9558186d1dd	dogodek.razred	array	a:5:{s:4:"100s";a:2:{s:5:"label";s:9:"Predstava";s:4:"type";s:9:"predstava";}s:4:"200s";a:2:{s:5:"label";s:4:"Vaja";s:4:"type";s:4:"vaja";}s:4:"300s";a:2:{s:5:"label";s:10:"Gostovanje";s:4:"type";s:10:"gostovanje";}s:4:"400s";a:2:{s:5:"label";s:16:"Splošni dogodek";s:4:"type";s:8:"splošni";}s:4:"500s";a:2:{s:5:"label";s:10:"Zasedenost";s:4:"type";s:10:"zasedenost";}}	f	t	t	\N	Tabela razredov dogodkov, ki jih aplikacija podpira
00000000-561f-8c3d-edb3-b053fc96e353	uprizoritev.faza	array	a:6:{s:20:"predprodukcija-ideja";a:1:{s:5:"label";s:16:"Dolgoročni plan";}s:20:"predprodukcija-poziv";a:1:{s:5:"label";s:29:"Predprodukcija, v fazi poziva";}s:30:"predprodukcija-potrjen_program";a:1:{s:5:"label";s:34:"Predprodukcija, program je potrjen";}s:10:"produkcija";a:1:{s:5:"label";s:10:"Produkcija";}s:14:"postprodukcija";a:1:{s:5:"label";s:14:"Postprodukcija";}s:5:"arhiv";a:1:{s:5:"label";s:10:"Arhivirana";}}	f	t	f	\N	Faza uprizoritve
00000000-561f-8c3d-de77-0f6e091a42d9	funkcija.podrocje	array	a:4:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}}	f	t	f	\N	Področje funkcije
00000000-561f-8c3d-770b-505187403b92	tipfunkcije.podrocje	array	a:4:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}}	f	t	f	\N	Področje funkcije
00000000-561f-8c3d-0d2e-1641bbdf110d	funkcija.velikost	array	a:4:{s:6:"velika";a:1:{s:5:"label";s:23:"Velika vloga / funkcija";}s:7:"srednja";a:1:{s:5:"label";s:24:"Srednja vloga / funkcija";}s:4:"mala";a:1:{s:5:"label";s:21:"Mala vloga / funkcija";}s:7:"stataza";a:1:{s:5:"label";s:8:"Stataža";}}	f	t	f	\N	Velikost funkcije
00000000-561f-8c3d-0116-de8a2d2ebb8f	zaposlitev.status	array	a:2:{s:1:"A";a:1:{s:5:"label";s:7:"Aktivna";}s:1:"N";a:1:{s:5:"label";s:9:"Neaktivna";}}	f	t	f	\N	Status zaposlitve
00000000-561f-8c3d-e351-2e686decb6ed	produkcijskahisa.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktivna";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktivna";}}	f	t	f	\N	Status produkcijske hiše
00000000-561f-8c3d-9794-52e0e2e314f5	strosekuprizoritve.tipstroska	array	a:1:{s:10:"materialni";a:1:{s:5:"label";s:19:"Materialni strošek";}}	f	t	f	\N	Tip stroška
00000000-561f-8c3d-2b62-7c0d072c92de	avtorbesedila.tipavtorja	array	a:4:{s:4:"aizv";a:1:{s:5:"label";s:15:"Avtor izvirnika";}s:4:"prev";a:1:{s:5:"label";s:10:"Prevajalec";}s:4:"apri";a:1:{s:5:"label";s:14:"Avtor priredbe";}s:4:"dram";a:1:{s:5:"label";s:12:"Dramatizator";}}	f	t	f	\N	Tip stroška
00000000-561f-8c3d-927c-fbbe9e5c5cb3	fsacl.dostop	array	a:4:{s:1:"X";a:1:{s:5:"label";s:12:"Brez dostopa";}s:1:"R";a:1:{s:5:"label";s:11:"Samo branje";}s:2:"RW";a:1:{s:5:"label";s:17:"Branje in pisanje";}s:3:"RWD";a:1:{s:5:"label";s:26:"Branje pisanje in brisanje";}}	f	t	f	\N	ACL Javni dostop
00000000-561f-8c3e-9341-75e0b6e707f8	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-561f-8c3e-ddac-8e63269ccd4e	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-561f-8c3e-388f-78230792446d	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-561f-8c3e-d112-9f8a9484600d	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-561f-8c3e-6f24-bd925f239210	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
00000000-561f-8c40-1858-4f599a805c41	application.tenant.maticnopodjetje	string	s:36:"00080000-561f-8c40-c6e6-7aa5f562b5c8";	f	t	f		Id matičnega podjetja v Popa
\.


--
-- TOC entry 3019 (class 0 OID 22023744)
-- Dependencies: 183
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-561f-8c3e-9098-93de9a7f8bcd	00000000-561f-8c3e-9341-75e0b6e707f8	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-561f-8c3e-b2e6-b71a0b186b42	00000000-561f-8c3e-9341-75e0b6e707f8	00010000-561f-8c3d-1343-051833467a06	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-561f-8c3e-044b-71fd29b5c40c	00000000-561f-8c3e-ddac-8e63269ccd4e	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 3020 (class 0 OID 22023755)
-- Dependencies: 184
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naslov_id, sifra, naziv, ime, priimek, funkcija, srednjeime, polnoime, psevdonim, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
00090000-561f-8c3f-f1fb-0bed5c839410	\N	\N	0001	g.	Janez	Novak	a	Peter	Janez Peter Novak	Jani	jani.novak@xxx.xx	1958-01-06	0601958000000	123456789	M	Jani Janez	Slovenija	Slovenija	Ljubljana
00090000-561f-8c3f-6a54-ed6136fde520	00010000-561f-8c3f-014f-08c40cbe27b9	\N	0002	dr.	Anton	Horvat	b		Anton  Horvat	Tona	anton.horvat@xxx.xx	1968-02-12	1202968111111	234567890	M		Slovenija	Slovenija	Maribor
00090000-561f-8c3f-3ea2-c820da14d7e3	00010000-561f-8c3f-18e2-4fda0889ff97	\N	0003		Ivan	Kovačič	c		Ivan  Kovačič	Ivo	ivan.kovacic@xxx.xx	1975-03-26	2603976222222	345678901	M		Slovenija	Slovenija	Celje
00090000-561f-8c3f-d0ab-0fc8c8b05116	00010000-561f-8c3f-aae7-60b96ea9fc2f	\N	0004	prof.	Jožef	Krajnc	d		Jožef  Krajnc	Joža	jozef.krajnc@xxx.xx	1971-04-30	3004971333333	456789012	M		Slovenija	Slovenija	Kranj
00090000-561f-8c3f-3d75-eb2d6be62beb	\N	\N	0005		Marko	Zupančič	e		Marko  Zupančič		marko.zupancic@xxx.xx	1984-05-07	0705984444444	567890123	M		Slovenija	Slovenija	Koper
00090000-561f-8c3f-4cf7-ce68b1744147	\N	\N	0006	ga.	Marija	Kovač	f		Marija  Kovač		marija.kovac@xxx.xx	1962-06-19	1906962444444	678901234	Z		Slovenija	Slovenija	Murska Sobota
00090000-561f-8c3f-6052-6d005cc9f118	\N	\N	0007	ga.	Ana	Potočnik	g		Ana  Potočnik		ana.potocnik@xxx.xx	1975-07-24	2407975555555	789012345	Z		Slovenija	Slovenija	Novo Mesto
00090000-561f-8c3f-bdee-cf4adbbe2e43	\N	\N	0008	ga.	Maja	Mlakar	h		Maja  Mlakar		maja.mlakar@xxx.xx	1986-08-02	0208986666666	890123456	Z		Slovenija	Slovenija	Nova Gorica
00090000-561f-8c3f-d616-9373788e2ebc	00010000-561f-8c3f-3a1a-d2097caf2430	\N	0009		Irena	Kos	i		Irena  Kos		irena.kos@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Ptuj
00090000-561f-8c3f-fb32-6e91d24cb043	\N	\N	0010		Mojca	Vidmar	J		Mojca  Vidmar		mojca.vidmar@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Idrija
00090000-561f-8c3f-8b54-1bd2f5714566	\N	\N	0011		xx	write protected12345	a		xx  write protected12345		xx@xxx.xx	\N	\N	\N	Z		\N	\N	\N
00090000-561f-8c3f-11ab-5b6b7938249c	\N	\N	0012		Luka	Golob	luč	a	Luka a Golob		luka.golob@xxx.xx	\N	\N	\N	M		\N	\N	\N
00090000-561f-8c3f-f25a-31aae340d507	00010000-561f-8c3f-4301-e7751a65154e	\N	0013		Tatjana	Božič	tajnica	a	Tatjana a Božič		tatjana.bozic@xxx.xx	\N	\N	\N	Z		\N	\N	\N
00090000-561f-8c3f-9724-63330a25eee4	\N	\N	0014		William	Shakespeare	avtor		William  Shakespeare		\N	\N	\N	\N	M		\N	\N	\N
00090000-561f-8c3f-d5d4-7b040aa7e061	\N	\N	0015		Nebojša	Kavader	avtor		Nebojša  Kavader		\N	\N	\N	\N	M		\N	\N	\N
00090000-561f-8c3f-bfc3-c746d4b4aa21	\N	\N	0016		Fjodor	Dostojevski	avtor	Mihajlovič	Fjodor Mihajlovič Dostojevski		\N	\N	\N	\N	M		\N	\N	\N
00090000-561f-8c3f-35f0-fb3ecde9ce11	\N	\N	0017		Berta 	Hočevar	avtorica		Berta   Hočevar		\N	\N	\N	\N	Z		\N	\N	\N
00090000-561f-8c3f-7db1-204bef214d25	\N	\N	0018		Katarina	Podbevšek	lektorica		Katarina  Podbevšek		\N	\N	\N	\N	Z		\N	\N	\N
\.


--
-- TOC entry 3014 (class 0 OID 22023699)
-- Dependencies: 178
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-561f-8c3d-5728-fb0355c6ab3a	Aaa-read	Aaa (User,Role,Permission) - branje	f
00030000-561f-8c3d-9de5-99f1a8ff1a41	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	f
00030000-561f-8c3d-02db-21d909091d96	TerminStoritve-vse	TerminStoritve - spreminjanje vseh zapisov	f
00030000-561f-8c3d-82a7-fa2ee0c29120	Dogodek-readVse	Dogodek - branje vseh, ne glede na status dogodka	f
00030000-561f-8c3d-b08f-f567dbce911d	Oseba-vse	Oseba - vse - za testiranje assert	f
00030000-561f-8c3d-7e73-a9d47686ad02	ProgramDela-lock	ProgramDela - zaklepanje	f
00030000-561f-8c3d-c1e3-1a7f7a76cea8	ProgramDela-unlock	ProgramDela - odklepanje	f
00030000-561f-8c3d-bd92-fdd0b56f932c	Abonma-read	Abonma - branje	f
00030000-561f-8c3d-d66a-ebf595a5673e	Abonma-write	Abonma - spreminjanje	f
00030000-561f-8c3d-dab4-5c5c0acca9da	Alternacija-read	Alternacija - branje	f
00030000-561f-8c3d-3e3c-91f362f7d0d4	Alternacija-write	Alternacija - spreminjanje	f
00030000-561f-8c3d-0d43-56d70903b19e	Arhivalija-read	Arhivalija - branje	f
00030000-561f-8c3d-f4fc-2717af0b94ea	Arhivalija-write	Arhivalija - spreminjanje	f
00030000-561f-8c3d-77d1-d5da58dbde01	AvtorBesedila-read	AvtorBesedila - branje	f
00030000-561f-8c3d-7b13-52465a1d9cb3	AvtorBesedila-write	AvtorBesedila - spreminjanje	f
00030000-561f-8c3d-1571-957ceb1ce9e5	Besedilo-read	Besedilo - branje	f
00030000-561f-8c3d-f2b6-fdf3175be601	Besedilo-write	Besedilo - spreminjanje	f
00030000-561f-8c3d-050c-02bcecdd0470	DogodekIzven-read	DogodekIzven - branje	f
00030000-561f-8c3d-9611-963008c0b7dc	DogodekIzven-write	DogodekIzven - spreminjanje	f
00030000-561f-8c3d-814b-abe641b510a5	Dogodek-read	Dogodek - branje	f
00030000-561f-8c3d-19e8-315e368db517	Dogodek-write	Dogodek - spreminjanje	f
00030000-561f-8c3d-ec8d-ffc25850d62b	DrugiVir-read	DrugiVir - branje	f
00030000-561f-8c3d-2ef9-dc6d5160bed9	DrugiVir-write	DrugiVir - spreminjanje	f
00030000-561f-8c3d-61ad-0bb939630d04	Drzava-read	Drzava - branje	f
00030000-561f-8c3d-0cf3-8d05e8cf97e5	Drzava-write	Drzava - spreminjanje	f
00030000-561f-8c3d-98c4-1f1b17d7d724	EnotaPrograma-read	EnotaPrograma - branje	f
00030000-561f-8c3d-232b-286c733e5f7b	EnotaPrograma-write	EnotaPrograma - spreminjanje	f
00030000-561f-8c3d-ec50-ac1622a911c8	Funkcija-read	Funkcija - branje	f
00030000-561f-8c3d-2b64-aa7d09b9d75c	Funkcija-write	Funkcija - spreminjanje	f
00030000-561f-8c3d-7ee9-6cb8dd9c3287	Gostovanje-read	Gostovanje - branje	f
00030000-561f-8c3d-2712-f001a803c7d4	Gostovanje-write	Gostovanje - spreminjanje	f
00030000-561f-8c3d-f911-770d8d71d856	Gostujoca-read	Gostujoca - branje	f
00030000-561f-8c3d-e255-8d2c48949467	Gostujoca-write	Gostujoca - spreminjanje	f
00030000-561f-8c3d-c9fb-609067bcece2	KontaktnaOseba-read	KontaktnaOseba - branje	f
00030000-561f-8c3d-b179-74f5444457a6	KontaktnaOseba-write	KontaktnaOseba - spreminjanje	f
00030000-561f-8c3d-e035-552ed8b0fb83	Kupec-read	Kupec - branje	f
00030000-561f-8c3d-34c9-6207e7289a77	Kupec-write	Kupec - spreminjanje	f
00030000-561f-8c3d-9bd4-6c0aa7eb72b8	NacinPlacina-read	NacinPlacina - branje	f
00030000-561f-8c3d-d619-e2f0e69d7557	NacinPlacina-write	NacinPlacina - spreminjanje	f
00030000-561f-8c3d-d3d5-c142c40cfa1f	Option-read	Option - branje	f
00030000-561f-8c3d-ed76-41caa7a809f6	Option-write	Option - spreminjanje	f
00030000-561f-8c3d-90ef-946610ccf5ab	OptionValue-read	OptionValue - branje	f
00030000-561f-8c3d-981b-8a8f45fc4078	OptionValue-write	OptionValue - spreminjanje	f
00030000-561f-8c3d-60e2-e224c3d2ef2f	Oseba-read	Oseba - branje	f
00030000-561f-8c3d-2c12-8d89c34307b1	Oseba-write	Oseba - spreminjanje	f
00030000-561f-8c3d-77b6-54c8bd9e3dd1	PlacilniInstrument-read	PlacilniInstrument - branje	f
00030000-561f-8c3d-bef3-bffa8b728ad1	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	f
00030000-561f-8c3d-c6b4-8d45efed8c45	PodrocjeSedenja-read	PodrocjeSedenja - branje	f
00030000-561f-8c3d-a1f3-49c13418446f	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	f
00030000-561f-8c3d-ae4b-613ee8a59e35	Pogodba-read	Pogodba - branje	f
00030000-561f-8c3d-62b7-b27c256878db	Pogodba-write	Pogodba - spreminjanje	f
00030000-561f-8c3d-fd94-d9305abda1f3	Popa-read	Popa - branje	f
00030000-561f-8c3d-bdfc-97d0f1177208	Popa-write	Popa - spreminjanje	f
00030000-561f-8c3d-3023-08588ff5db9c	Posta-read	Posta - branje	f
00030000-561f-8c3d-d735-aa5e7b877d94	Posta-write	Posta - spreminjanje	f
00030000-561f-8c3d-d550-57c92d0b1116	PostavkaCDve-read	PostavkaCDve - branje	f
00030000-561f-8c3d-3a13-79d727db8837	PostavkaCDve-write	PostavkaCDve - spreminjanje	f
00030000-561f-8c3d-e24e-7e966fbf57cb	PostavkaRacuna-read	PostavkaRacuna - branje	f
00030000-561f-8c3d-6a3e-639c9d687427	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	f
00030000-561f-8c3d-0718-4439ed093330	PostniNaslov-read	PostniNaslov - branje	f
00030000-561f-8c3d-4cd5-0a2c636d8745	PostniNaslov-write	PostniNaslov - spreminjanje	f
00030000-561f-8c3d-c61e-5cddc3d4d9a6	Predstava-read	Predstava - branje	f
00030000-561f-8c3d-aace-785a87e87a9d	Predstava-write	Predstava - spreminjanje	f
00030000-561f-8c3d-6b3a-19641fa6a24b	ProdajaPredstave-read	ProdajaPredstave - branje	f
00030000-561f-8c3d-5999-47c4461e179d	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	f
00030000-561f-8c3d-35f1-6df99e8b3830	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	f
00030000-561f-8c3d-2064-122d3743d1f8	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	f
00030000-561f-8c3d-934c-222e4fe7f165	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	f
00030000-561f-8c3d-74b0-421920f6be00	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	f
00030000-561f-8c3d-52ca-5a45302570b8	ProgramDela-read	ProgramDela - branje	f
00030000-561f-8c3d-9d34-39fdea3dcb10	ProgramDela-write	ProgramDela - spreminjanje	f
00030000-561f-8c3d-a34f-ffe649a342b6	ProgramFestival-read	ProgramFestival - branje	f
00030000-561f-8c3d-8239-70fd9a1d2d15	ProgramFestival-write	ProgramFestival - spreminjanje	f
00030000-561f-8c3d-9904-68e05b454db4	ProgramGostovanje-read	ProgramGostovanje - branje	f
00030000-561f-8c3d-a0b5-bac4c3919848	ProgramGostovanje-write	ProgramGostovanje - spreminjanje	f
00030000-561f-8c3d-48bd-f47e0f8ef446	ProgramGostujoca-read	ProgramGostujoca - branje	f
00030000-561f-8c3d-c0a3-5e9fdf44a392	ProgramGostujoca-write	ProgramGostujoca - spreminjanje	f
00030000-561f-8c3d-95d3-da7c695b24a5	ProgramIzjemni-read	ProgramIzjemni - branje	f
00030000-561f-8c3d-4ec7-86a8d57950d9	ProgramIzjemni-write	ProgramIzjemni - spreminjanje	f
00030000-561f-8c3d-ecf7-096c3e74ae9a	ProgramPonovitevPrejsnjih-read	ProgramPonovitevPrejsnjih - branje	f
00030000-561f-8c3d-df6a-c48d708b7895	ProgramPonovitevPrejsnjih-write	ProgramPonovitevPrejsnjih - spreminjanje	f
00030000-561f-8c3d-8891-58b986dcf054	ProgramPonovitevPremiere-read	ProgramPonovitevPremiere - branje	f
00030000-561f-8c3d-cdfb-41fa48854353	ProgramPonovitevPremiere-write	ProgramPonovitevPremiere - spreminjanje	f
00030000-561f-8c3d-8b44-6701287c13af	ProgramPremiera-read	ProgramPremiera - branje	f
00030000-561f-8c3d-445c-8c94dbde9cb5	ProgramPremiera-write	ProgramPremiera - spreminjanje	f
00030000-561f-8c3d-cf02-38f228a3c177	ProgramRazno-read	ProgramRazno - branje	f
00030000-561f-8c3d-c66e-c1aaccd8ac23	ProgramRazno-write	ProgramRazno - spreminjanje	f
00030000-561f-8c3d-4ece-8ce954c5974e	ProgramskaEnotaSklopa-read	ProgramskaEnotaSklopa - branje	f
00030000-561f-8c3d-b556-310d3eafbee2	ProgramskaEnotaSklopa-write	ProgramskaEnotaSklopa - spreminjanje	f
00030000-561f-8c3d-0adc-36847a05b358	Prostor-read	Prostor - branje	f
00030000-561f-8c3d-6d68-3c7347342cee	Prostor-write	Prostor - spreminjanje	f
00030000-561f-8c3d-5a38-888e78e17d87	Racun-read	Racun - branje	f
00030000-561f-8c3d-c698-9f0fb830e32c	Racun-write	Racun - spreminjanje	f
00030000-561f-8c3d-ade1-6a378b2cacde	RazpisanSedez-read	RazpisanSedez - branje	f
00030000-561f-8c3d-a6f5-9ea9c06ee24d	RazpisanSedez-write	RazpisanSedez - spreminjanje	f
00030000-561f-8c3d-629b-4ff0db57dd3b	Rekviziterstvo-read	Rekviziterstvo - branje	f
00030000-561f-8c3d-3a5e-f61bb108f4f5	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	f
00030000-561f-8c3d-9055-b63532722e02	Rekvizit-read	Rekvizit - branje	f
00030000-561f-8c3d-5dca-3ed0f772db90	Rekvizit-write	Rekvizit - spreminjanje	f
00030000-561f-8c3d-8057-e39f4e698bea	Revizija-read	Revizija - branje	f
00030000-561f-8c3d-3be9-fd647c08c983	Revizija-write	Revizija - spreminjanje	f
00030000-561f-8c3d-53b5-ef354cd77902	Rezervacija-read	Rezervacija - branje	f
00030000-561f-8c3d-f530-1521cab5d3c8	Rezervacija-write	Rezervacija - spreminjanje	f
00030000-561f-8c3d-6eb9-681a392cd6cf	SedezniRed-read	SedezniRed - branje	f
00030000-561f-8c3d-a0b3-49877ceea732	SedezniRed-write	SedezniRed - spreminjanje	f
00030000-561f-8c3d-e635-88258fda408c	Sedez-read	Sedez - branje	f
00030000-561f-8c3d-c167-878cd0a8585c	Sedez-write	Sedez - spreminjanje	f
00030000-561f-8c3d-1737-f005b029356d	Sezona-read	Sezona - branje	f
00030000-561f-8c3d-72b6-d818a52f0c47	Sezona-write	Sezona - spreminjanje	f
00030000-561f-8c3d-edb2-5216968f0b69	StevilcenjeKonfig-read	StevilcenjeKonfig - branje	f
00030000-561f-8c3d-7a00-b981f5f4f211	StevilcenjeKonfig-write	StevilcenjeKonfig - spreminjanje	f
00030000-561f-8c3d-f00c-6e3066c757b0	Stevilcenje-read	Stevilcenje - branje	f
00030000-561f-8c3d-dfe9-79610a33dbbf	Stevilcenje-write	Stevilcenje - spreminjanje	f
00030000-561f-8c3d-e9f0-bedae34da9d8	StevilcenjeStanje-read	StevilcenjeStanje - branje	f
00030000-561f-8c3d-7d36-5dc90cb93816	StevilcenjeStanje-write	StevilcenjeStanje - spreminjanje	f
00030000-561f-8c3d-a87e-a5565a3c1016	StrosekUprizoritve-read	StrosekUprizoritve - branje	f
00030000-561f-8c3d-a63a-7cf16feb926e	StrosekUprizoritve-write	StrosekUprizoritve - spreminjanje	f
00030000-561f-8c3d-b780-944097c43287	Telefonska-read	Telefonska - branje	f
00030000-561f-8c3d-2768-c108cbe1e940	Telefonska-write	Telefonska - spreminjanje	f
00030000-561f-8c3d-d33a-5ac0033e3a88	TerminStoritve-read	TerminStoritve - branje	f
00030000-561f-8c3d-ee61-c7640233ba93	TerminStoritve-write	TerminStoritve - spreminjanje	f
00030000-561f-8c3d-d12f-7530d270fb98	TipFunkcije-read	TipFunkcije - branje	f
00030000-561f-8c3d-c263-54a66ff589b3	TipFunkcije-write	TipFunkcije - spreminjanje	f
00030000-561f-8c3d-2680-def327d48db5	TipPopa-read	TipPopa - branje	f
00030000-561f-8c3d-74b2-de1bfbd1166e	TipPopa-write	TipPopa - spreminjanje	f
00030000-561f-8c3d-d1e6-01bc33b3b558	TipProgramskeEnote-read	TipProgramskeEnote - branje	f
00030000-561f-8c3d-3b9c-e039fb16811a	TipProgramskeEnote-write	TipProgramskeEnote - spreminjanje	f
00030000-561f-8c3d-d8c1-4c0501ff1737	Trr-read	Trr - branje	f
00030000-561f-8c3d-f7c7-23e23d692940	Trr-write	Trr - spreminjanje	f
00030000-561f-8c3d-80f9-f6c8ba18066d	Uprizoritev-read	Uprizoritev - branje	f
00030000-561f-8c3d-b57b-f6c976622d2d	Uprizoritev-write	Uprizoritev - spreminjanje	f
00030000-561f-8c3d-5694-52b0d456ed5e	Vaja-read	Vaja - branje	f
00030000-561f-8c3d-c33d-07e01ca2d6ab	Vaja-write	Vaja - spreminjanje	f
00030000-561f-8c3d-50da-8d218d4bda21	VrstaSedezev-read	VrstaSedezev - branje	f
00030000-561f-8c3d-dbb0-5e337440ce75	VrstaSedezev-write	VrstaSedezev - spreminjanje	f
00030000-561f-8c3d-3abb-6b3ce1d978aa	VrstaStroska-read	VrstaStroska - branje	f
00030000-561f-8c3d-c8c1-a91ba42c06e9	VrstaStroska-write	VrstaStroska - spreminjanje	f
00030000-561f-8c3d-de2c-643f510c74cd	Zaposlitev-read	Zaposlitev - branje	f
00030000-561f-8c3d-bc0c-6f0e53f33843	Zaposlitev-write	Zaposlitev - spreminjanje	f
00030000-561f-8c3d-b0a1-f178ade4c1ea	Zasedenost-read	Zasedenost - branje	f
00030000-561f-8c3d-1e41-ddff072bcf25	Zasedenost-write	Zasedenost - spreminjanje	f
00030000-561f-8c3d-ddf4-584f31aedcba	ZvrstSurs-read	ZvrstSurs - branje	f
00030000-561f-8c3d-56e6-6857467fcbea	ZvrstSurs-write	ZvrstSurs - spreminjanje	f
00030000-561f-8c3d-b4d5-f825ebb5ba35	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	f
00030000-561f-8c3d-08ae-9514bec671c7	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	f
00030000-561f-8c3d-7611-c671f9fd48c4	Job-read	Branje opravil - samo zase - branje	f
00030000-561f-8c3d-dd9a-87593ea8683b	Job-write	Dodajanje in spreminjanje opravil - samo zase	f
00030000-561f-8c3d-c859-6ecc67480cda	Job-admin	Upravljanje opravil za vse uporabnike	f
00030000-561f-8c3d-a6c3-c6f8855e5f5c	Mapa-write	Mapa - osnovno dovoljenje za pisanje	f
00030000-561f-8c3d-d2e9-6d48cf2f47b1	Mapa-read	Mapa - osnovno dovoljenje za branje	f
00030000-561f-8c3d-59dc-8aacc16f8554	MapaAcl-write	MapaAcl - dovoljenje za dostop pisanje ACL-jev mape	f
00030000-561f-8c3d-c675-dd371aec44c0	MapaAcl-read	MapaAcl - dovoljenje za dostop branje ACL-jev mape	f
00030000-561f-8c3d-ea84-51889b634133	Zapis-write	Zapis - dovoljenje za pisanje zapisov	f
00030000-561f-8c3d-9ee2-7cf31cdca104	Zapis-read	Zapis - dovoljenje za pisanje zapisov	f
00030000-561f-8c3d-a9fd-59e1277353a8	ZapisLastnik-write	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	f
00030000-561f-8c3d-a3cd-1f60d7bd17e3	ZapisLastnik-read	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	f
00030000-561f-8c3d-5fa0-5966fcd47eb6	VrstaZapisa-write	Šifrant vrst zapisa - spreminjanje	f
00030000-561f-8c3d-d8a7-598fb5b8bc5b	VrstaZapisa-read	Šifrant vrst zapisa - branje	f
00030000-561f-8c3d-4f1a-8775bd8d117d	Datoteka-write	Datoteka - spreminjanje	f
00030000-561f-8c3d-3fa9-9fd506ea93f6	Datoteka-read	Datoteke - branje	f
\.


--
-- TOC entry 3016 (class 0 OID 22023718)
-- Dependencies: 180
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-561f-8c3d-d5b1-016eb8bedb11	00030000-561f-8c3d-9de5-99f1a8ff1a41
00020000-561f-8c3d-8705-ffa3e63a54a8	00030000-561f-8c3d-61ad-0bb939630d04
00020000-561f-8c3d-1864-3309e2102719	00030000-561f-8c3d-bd92-fdd0b56f932c
00020000-561f-8c3d-1864-3309e2102719	00030000-561f-8c3d-d66a-ebf595a5673e
00020000-561f-8c3d-1864-3309e2102719	00030000-561f-8c3d-dab4-5c5c0acca9da
00020000-561f-8c3d-1864-3309e2102719	00030000-561f-8c3d-3e3c-91f362f7d0d4
00020000-561f-8c3d-1864-3309e2102719	00030000-561f-8c3d-0d43-56d70903b19e
00020000-561f-8c3d-1864-3309e2102719	00030000-561f-8c3d-814b-abe641b510a5
00020000-561f-8c3d-1864-3309e2102719	00030000-561f-8c3d-82a7-fa2ee0c29120
00020000-561f-8c3d-1864-3309e2102719	00030000-561f-8c3d-19e8-315e368db517
00020000-561f-8c3d-1864-3309e2102719	00030000-561f-8c3d-61ad-0bb939630d04
00020000-561f-8c3d-1864-3309e2102719	00030000-561f-8c3d-0cf3-8d05e8cf97e5
00020000-561f-8c3d-1864-3309e2102719	00030000-561f-8c3d-ec50-ac1622a911c8
00020000-561f-8c3d-1864-3309e2102719	00030000-561f-8c3d-2b64-aa7d09b9d75c
00020000-561f-8c3d-1864-3309e2102719	00030000-561f-8c3d-7ee9-6cb8dd9c3287
00020000-561f-8c3d-1864-3309e2102719	00030000-561f-8c3d-2712-f001a803c7d4
00020000-561f-8c3d-1864-3309e2102719	00030000-561f-8c3d-f911-770d8d71d856
00020000-561f-8c3d-1864-3309e2102719	00030000-561f-8c3d-e255-8d2c48949467
00020000-561f-8c3d-1864-3309e2102719	00030000-561f-8c3d-c9fb-609067bcece2
00020000-561f-8c3d-1864-3309e2102719	00030000-561f-8c3d-b179-74f5444457a6
00020000-561f-8c3d-1864-3309e2102719	00030000-561f-8c3d-d3d5-c142c40cfa1f
00020000-561f-8c3d-1864-3309e2102719	00030000-561f-8c3d-90ef-946610ccf5ab
00020000-561f-8c3d-1864-3309e2102719	00030000-561f-8c3d-60e2-e224c3d2ef2f
00020000-561f-8c3d-1864-3309e2102719	00030000-561f-8c3d-2c12-8d89c34307b1
00020000-561f-8c3d-1864-3309e2102719	00030000-561f-8c3d-fd94-d9305abda1f3
00020000-561f-8c3d-1864-3309e2102719	00030000-561f-8c3d-bdfc-97d0f1177208
00020000-561f-8c3d-1864-3309e2102719	00030000-561f-8c3d-3023-08588ff5db9c
00020000-561f-8c3d-1864-3309e2102719	00030000-561f-8c3d-d735-aa5e7b877d94
00020000-561f-8c3d-1864-3309e2102719	00030000-561f-8c3d-0718-4439ed093330
00020000-561f-8c3d-1864-3309e2102719	00030000-561f-8c3d-4cd5-0a2c636d8745
00020000-561f-8c3d-1864-3309e2102719	00030000-561f-8c3d-c61e-5cddc3d4d9a6
00020000-561f-8c3d-1864-3309e2102719	00030000-561f-8c3d-aace-785a87e87a9d
00020000-561f-8c3d-1864-3309e2102719	00030000-561f-8c3d-934c-222e4fe7f165
00020000-561f-8c3d-1864-3309e2102719	00030000-561f-8c3d-74b0-421920f6be00
00020000-561f-8c3d-1864-3309e2102719	00030000-561f-8c3d-0adc-36847a05b358
00020000-561f-8c3d-1864-3309e2102719	00030000-561f-8c3d-6d68-3c7347342cee
00020000-561f-8c3d-1864-3309e2102719	00030000-561f-8c3d-629b-4ff0db57dd3b
00020000-561f-8c3d-1864-3309e2102719	00030000-561f-8c3d-3a5e-f61bb108f4f5
00020000-561f-8c3d-1864-3309e2102719	00030000-561f-8c3d-9055-b63532722e02
00020000-561f-8c3d-1864-3309e2102719	00030000-561f-8c3d-5dca-3ed0f772db90
00020000-561f-8c3d-1864-3309e2102719	00030000-561f-8c3d-1737-f005b029356d
00020000-561f-8c3d-1864-3309e2102719	00030000-561f-8c3d-72b6-d818a52f0c47
00020000-561f-8c3d-1864-3309e2102719	00030000-561f-8c3d-d12f-7530d270fb98
00020000-561f-8c3d-1864-3309e2102719	00030000-561f-8c3d-80f9-f6c8ba18066d
00020000-561f-8c3d-1864-3309e2102719	00030000-561f-8c3d-b57b-f6c976622d2d
00020000-561f-8c3d-1864-3309e2102719	00030000-561f-8c3d-5694-52b0d456ed5e
00020000-561f-8c3d-1864-3309e2102719	00030000-561f-8c3d-c33d-07e01ca2d6ab
00020000-561f-8c3d-1864-3309e2102719	00030000-561f-8c3d-b0a1-f178ade4c1ea
00020000-561f-8c3d-1864-3309e2102719	00030000-561f-8c3d-1e41-ddff072bcf25
00020000-561f-8c3d-1864-3309e2102719	00030000-561f-8c3d-ddf4-584f31aedcba
00020000-561f-8c3d-1864-3309e2102719	00030000-561f-8c3d-b4d5-f825ebb5ba35
00020000-561f-8c3d-1701-0f200eac5896	00030000-561f-8c3d-bd92-fdd0b56f932c
00020000-561f-8c3d-1701-0f200eac5896	00030000-561f-8c3d-0d43-56d70903b19e
00020000-561f-8c3d-1701-0f200eac5896	00030000-561f-8c3d-814b-abe641b510a5
00020000-561f-8c3d-1701-0f200eac5896	00030000-561f-8c3d-61ad-0bb939630d04
00020000-561f-8c3d-1701-0f200eac5896	00030000-561f-8c3d-7ee9-6cb8dd9c3287
00020000-561f-8c3d-1701-0f200eac5896	00030000-561f-8c3d-f911-770d8d71d856
00020000-561f-8c3d-1701-0f200eac5896	00030000-561f-8c3d-c9fb-609067bcece2
00020000-561f-8c3d-1701-0f200eac5896	00030000-561f-8c3d-b179-74f5444457a6
00020000-561f-8c3d-1701-0f200eac5896	00030000-561f-8c3d-d3d5-c142c40cfa1f
00020000-561f-8c3d-1701-0f200eac5896	00030000-561f-8c3d-90ef-946610ccf5ab
00020000-561f-8c3d-1701-0f200eac5896	00030000-561f-8c3d-60e2-e224c3d2ef2f
00020000-561f-8c3d-1701-0f200eac5896	00030000-561f-8c3d-2c12-8d89c34307b1
00020000-561f-8c3d-1701-0f200eac5896	00030000-561f-8c3d-fd94-d9305abda1f3
00020000-561f-8c3d-1701-0f200eac5896	00030000-561f-8c3d-3023-08588ff5db9c
00020000-561f-8c3d-1701-0f200eac5896	00030000-561f-8c3d-0718-4439ed093330
00020000-561f-8c3d-1701-0f200eac5896	00030000-561f-8c3d-4cd5-0a2c636d8745
00020000-561f-8c3d-1701-0f200eac5896	00030000-561f-8c3d-c61e-5cddc3d4d9a6
00020000-561f-8c3d-1701-0f200eac5896	00030000-561f-8c3d-0adc-36847a05b358
00020000-561f-8c3d-1701-0f200eac5896	00030000-561f-8c3d-629b-4ff0db57dd3b
00020000-561f-8c3d-1701-0f200eac5896	00030000-561f-8c3d-9055-b63532722e02
00020000-561f-8c3d-1701-0f200eac5896	00030000-561f-8c3d-1737-f005b029356d
00020000-561f-8c3d-1701-0f200eac5896	00030000-561f-8c3d-b780-944097c43287
00020000-561f-8c3d-1701-0f200eac5896	00030000-561f-8c3d-2768-c108cbe1e940
00020000-561f-8c3d-1701-0f200eac5896	00030000-561f-8c3d-d8c1-4c0501ff1737
00020000-561f-8c3d-1701-0f200eac5896	00030000-561f-8c3d-f7c7-23e23d692940
00020000-561f-8c3d-1701-0f200eac5896	00030000-561f-8c3d-de2c-643f510c74cd
00020000-561f-8c3d-1701-0f200eac5896	00030000-561f-8c3d-bc0c-6f0e53f33843
00020000-561f-8c3d-1701-0f200eac5896	00030000-561f-8c3d-ddf4-584f31aedcba
00020000-561f-8c3d-1701-0f200eac5896	00030000-561f-8c3d-b4d5-f825ebb5ba35
00020000-561f-8c3d-7be8-cf02849e1be2	00030000-561f-8c3d-bd92-fdd0b56f932c
00020000-561f-8c3d-7be8-cf02849e1be2	00030000-561f-8c3d-dab4-5c5c0acca9da
00020000-561f-8c3d-7be8-cf02849e1be2	00030000-561f-8c3d-0d43-56d70903b19e
00020000-561f-8c3d-7be8-cf02849e1be2	00030000-561f-8c3d-f4fc-2717af0b94ea
00020000-561f-8c3d-7be8-cf02849e1be2	00030000-561f-8c3d-1571-957ceb1ce9e5
00020000-561f-8c3d-7be8-cf02849e1be2	00030000-561f-8c3d-050c-02bcecdd0470
00020000-561f-8c3d-7be8-cf02849e1be2	00030000-561f-8c3d-814b-abe641b510a5
00020000-561f-8c3d-7be8-cf02849e1be2	00030000-561f-8c3d-61ad-0bb939630d04
00020000-561f-8c3d-7be8-cf02849e1be2	00030000-561f-8c3d-ec50-ac1622a911c8
00020000-561f-8c3d-7be8-cf02849e1be2	00030000-561f-8c3d-7ee9-6cb8dd9c3287
00020000-561f-8c3d-7be8-cf02849e1be2	00030000-561f-8c3d-f911-770d8d71d856
00020000-561f-8c3d-7be8-cf02849e1be2	00030000-561f-8c3d-c9fb-609067bcece2
00020000-561f-8c3d-7be8-cf02849e1be2	00030000-561f-8c3d-d3d5-c142c40cfa1f
00020000-561f-8c3d-7be8-cf02849e1be2	00030000-561f-8c3d-90ef-946610ccf5ab
00020000-561f-8c3d-7be8-cf02849e1be2	00030000-561f-8c3d-60e2-e224c3d2ef2f
00020000-561f-8c3d-7be8-cf02849e1be2	00030000-561f-8c3d-fd94-d9305abda1f3
00020000-561f-8c3d-7be8-cf02849e1be2	00030000-561f-8c3d-3023-08588ff5db9c
00020000-561f-8c3d-7be8-cf02849e1be2	00030000-561f-8c3d-c61e-5cddc3d4d9a6
00020000-561f-8c3d-7be8-cf02849e1be2	00030000-561f-8c3d-934c-222e4fe7f165
00020000-561f-8c3d-7be8-cf02849e1be2	00030000-561f-8c3d-0adc-36847a05b358
00020000-561f-8c3d-7be8-cf02849e1be2	00030000-561f-8c3d-629b-4ff0db57dd3b
00020000-561f-8c3d-7be8-cf02849e1be2	00030000-561f-8c3d-9055-b63532722e02
00020000-561f-8c3d-7be8-cf02849e1be2	00030000-561f-8c3d-1737-f005b029356d
00020000-561f-8c3d-7be8-cf02849e1be2	00030000-561f-8c3d-d12f-7530d270fb98
00020000-561f-8c3d-7be8-cf02849e1be2	00030000-561f-8c3d-5694-52b0d456ed5e
00020000-561f-8c3d-7be8-cf02849e1be2	00030000-561f-8c3d-b0a1-f178ade4c1ea
00020000-561f-8c3d-7be8-cf02849e1be2	00030000-561f-8c3d-ddf4-584f31aedcba
00020000-561f-8c3d-7be8-cf02849e1be2	00030000-561f-8c3d-b4d5-f825ebb5ba35
00020000-561f-8c3d-c682-f81de0a0f20a	00030000-561f-8c3d-bd92-fdd0b56f932c
00020000-561f-8c3d-c682-f81de0a0f20a	00030000-561f-8c3d-d66a-ebf595a5673e
00020000-561f-8c3d-c682-f81de0a0f20a	00030000-561f-8c3d-3e3c-91f362f7d0d4
00020000-561f-8c3d-c682-f81de0a0f20a	00030000-561f-8c3d-0d43-56d70903b19e
00020000-561f-8c3d-c682-f81de0a0f20a	00030000-561f-8c3d-814b-abe641b510a5
00020000-561f-8c3d-c682-f81de0a0f20a	00030000-561f-8c3d-61ad-0bb939630d04
00020000-561f-8c3d-c682-f81de0a0f20a	00030000-561f-8c3d-7ee9-6cb8dd9c3287
00020000-561f-8c3d-c682-f81de0a0f20a	00030000-561f-8c3d-f911-770d8d71d856
00020000-561f-8c3d-c682-f81de0a0f20a	00030000-561f-8c3d-d3d5-c142c40cfa1f
00020000-561f-8c3d-c682-f81de0a0f20a	00030000-561f-8c3d-90ef-946610ccf5ab
00020000-561f-8c3d-c682-f81de0a0f20a	00030000-561f-8c3d-fd94-d9305abda1f3
00020000-561f-8c3d-c682-f81de0a0f20a	00030000-561f-8c3d-3023-08588ff5db9c
00020000-561f-8c3d-c682-f81de0a0f20a	00030000-561f-8c3d-c61e-5cddc3d4d9a6
00020000-561f-8c3d-c682-f81de0a0f20a	00030000-561f-8c3d-0adc-36847a05b358
00020000-561f-8c3d-c682-f81de0a0f20a	00030000-561f-8c3d-629b-4ff0db57dd3b
00020000-561f-8c3d-c682-f81de0a0f20a	00030000-561f-8c3d-9055-b63532722e02
00020000-561f-8c3d-c682-f81de0a0f20a	00030000-561f-8c3d-1737-f005b029356d
00020000-561f-8c3d-c682-f81de0a0f20a	00030000-561f-8c3d-d12f-7530d270fb98
00020000-561f-8c3d-c682-f81de0a0f20a	00030000-561f-8c3d-ddf4-584f31aedcba
00020000-561f-8c3d-c682-f81de0a0f20a	00030000-561f-8c3d-b4d5-f825ebb5ba35
00020000-561f-8c3d-6e98-647e00e2bb9b	00030000-561f-8c3d-bd92-fdd0b56f932c
00020000-561f-8c3d-6e98-647e00e2bb9b	00030000-561f-8c3d-0d43-56d70903b19e
00020000-561f-8c3d-6e98-647e00e2bb9b	00030000-561f-8c3d-814b-abe641b510a5
00020000-561f-8c3d-6e98-647e00e2bb9b	00030000-561f-8c3d-61ad-0bb939630d04
00020000-561f-8c3d-6e98-647e00e2bb9b	00030000-561f-8c3d-7ee9-6cb8dd9c3287
00020000-561f-8c3d-6e98-647e00e2bb9b	00030000-561f-8c3d-f911-770d8d71d856
00020000-561f-8c3d-6e98-647e00e2bb9b	00030000-561f-8c3d-d3d5-c142c40cfa1f
00020000-561f-8c3d-6e98-647e00e2bb9b	00030000-561f-8c3d-90ef-946610ccf5ab
00020000-561f-8c3d-6e98-647e00e2bb9b	00030000-561f-8c3d-fd94-d9305abda1f3
00020000-561f-8c3d-6e98-647e00e2bb9b	00030000-561f-8c3d-3023-08588ff5db9c
00020000-561f-8c3d-6e98-647e00e2bb9b	00030000-561f-8c3d-c61e-5cddc3d4d9a6
00020000-561f-8c3d-6e98-647e00e2bb9b	00030000-561f-8c3d-0adc-36847a05b358
00020000-561f-8c3d-6e98-647e00e2bb9b	00030000-561f-8c3d-629b-4ff0db57dd3b
00020000-561f-8c3d-6e98-647e00e2bb9b	00030000-561f-8c3d-9055-b63532722e02
00020000-561f-8c3d-6e98-647e00e2bb9b	00030000-561f-8c3d-1737-f005b029356d
00020000-561f-8c3d-6e98-647e00e2bb9b	00030000-561f-8c3d-d33a-5ac0033e3a88
00020000-561f-8c3d-6e98-647e00e2bb9b	00030000-561f-8c3d-02db-21d909091d96
00020000-561f-8c3d-6e98-647e00e2bb9b	00030000-561f-8c3d-d12f-7530d270fb98
00020000-561f-8c3d-6e98-647e00e2bb9b	00030000-561f-8c3d-ddf4-584f31aedcba
00020000-561f-8c3d-6e98-647e00e2bb9b	00030000-561f-8c3d-b4d5-f825ebb5ba35
00020000-561f-8c3f-c1a1-7afebe2bf3b7	00030000-561f-8c3d-5728-fb0355c6ab3a
00020000-561f-8c3f-c1a1-7afebe2bf3b7	00030000-561f-8c3d-9de5-99f1a8ff1a41
00020000-561f-8c3f-c1a1-7afebe2bf3b7	00030000-561f-8c3d-02db-21d909091d96
00020000-561f-8c3f-c1a1-7afebe2bf3b7	00030000-561f-8c3d-82a7-fa2ee0c29120
00020000-561f-8c3f-c1a1-7afebe2bf3b7	00030000-561f-8c3d-b08f-f567dbce911d
00020000-561f-8c3f-c1a1-7afebe2bf3b7	00030000-561f-8c3d-7e73-a9d47686ad02
00020000-561f-8c3f-c1a1-7afebe2bf3b7	00030000-561f-8c3d-c1e3-1a7f7a76cea8
00020000-561f-8c3f-c1a1-7afebe2bf3b7	00030000-561f-8c3d-bd92-fdd0b56f932c
00020000-561f-8c3f-c1a1-7afebe2bf3b7	00030000-561f-8c3d-d66a-ebf595a5673e
00020000-561f-8c3f-c1a1-7afebe2bf3b7	00030000-561f-8c3d-dab4-5c5c0acca9da
00020000-561f-8c3f-c1a1-7afebe2bf3b7	00030000-561f-8c3d-3e3c-91f362f7d0d4
00020000-561f-8c3f-c1a1-7afebe2bf3b7	00030000-561f-8c3d-0d43-56d70903b19e
00020000-561f-8c3f-c1a1-7afebe2bf3b7	00030000-561f-8c3d-f4fc-2717af0b94ea
00020000-561f-8c3f-c1a1-7afebe2bf3b7	00030000-561f-8c3d-1571-957ceb1ce9e5
00020000-561f-8c3f-c1a1-7afebe2bf3b7	00030000-561f-8c3d-f2b6-fdf3175be601
00020000-561f-8c3f-c1a1-7afebe2bf3b7	00030000-561f-8c3d-050c-02bcecdd0470
00020000-561f-8c3f-c1a1-7afebe2bf3b7	00030000-561f-8c3d-9611-963008c0b7dc
00020000-561f-8c3f-c1a1-7afebe2bf3b7	00030000-561f-8c3d-814b-abe641b510a5
00020000-561f-8c3f-c1a1-7afebe2bf3b7	00030000-561f-8c3d-19e8-315e368db517
00020000-561f-8c3f-c1a1-7afebe2bf3b7	00030000-561f-8c3d-61ad-0bb939630d04
00020000-561f-8c3f-c1a1-7afebe2bf3b7	00030000-561f-8c3d-0cf3-8d05e8cf97e5
00020000-561f-8c3f-c1a1-7afebe2bf3b7	00030000-561f-8c3d-ec8d-ffc25850d62b
00020000-561f-8c3f-c1a1-7afebe2bf3b7	00030000-561f-8c3d-2ef9-dc6d5160bed9
00020000-561f-8c3f-c1a1-7afebe2bf3b7	00030000-561f-8c3d-98c4-1f1b17d7d724
00020000-561f-8c3f-c1a1-7afebe2bf3b7	00030000-561f-8c3d-232b-286c733e5f7b
00020000-561f-8c3f-c1a1-7afebe2bf3b7	00030000-561f-8c3d-ec50-ac1622a911c8
00020000-561f-8c3f-c1a1-7afebe2bf3b7	00030000-561f-8c3d-2b64-aa7d09b9d75c
00020000-561f-8c3f-c1a1-7afebe2bf3b7	00030000-561f-8c3d-7ee9-6cb8dd9c3287
00020000-561f-8c3f-c1a1-7afebe2bf3b7	00030000-561f-8c3d-2712-f001a803c7d4
00020000-561f-8c3f-c1a1-7afebe2bf3b7	00030000-561f-8c3d-f911-770d8d71d856
00020000-561f-8c3f-c1a1-7afebe2bf3b7	00030000-561f-8c3d-e255-8d2c48949467
00020000-561f-8c3f-c1a1-7afebe2bf3b7	00030000-561f-8c3d-c9fb-609067bcece2
00020000-561f-8c3f-c1a1-7afebe2bf3b7	00030000-561f-8c3d-b179-74f5444457a6
00020000-561f-8c3f-c1a1-7afebe2bf3b7	00030000-561f-8c3d-e035-552ed8b0fb83
00020000-561f-8c3f-c1a1-7afebe2bf3b7	00030000-561f-8c3d-34c9-6207e7289a77
00020000-561f-8c3f-c1a1-7afebe2bf3b7	00030000-561f-8c3d-9bd4-6c0aa7eb72b8
00020000-561f-8c3f-c1a1-7afebe2bf3b7	00030000-561f-8c3d-d619-e2f0e69d7557
00020000-561f-8c3f-c1a1-7afebe2bf3b7	00030000-561f-8c3d-d3d5-c142c40cfa1f
00020000-561f-8c3f-c1a1-7afebe2bf3b7	00030000-561f-8c3d-ed76-41caa7a809f6
00020000-561f-8c3f-c1a1-7afebe2bf3b7	00030000-561f-8c3d-90ef-946610ccf5ab
00020000-561f-8c3f-c1a1-7afebe2bf3b7	00030000-561f-8c3d-981b-8a8f45fc4078
00020000-561f-8c3f-c1a1-7afebe2bf3b7	00030000-561f-8c3d-60e2-e224c3d2ef2f
00020000-561f-8c3f-c1a1-7afebe2bf3b7	00030000-561f-8c3d-2c12-8d89c34307b1
00020000-561f-8c3f-c1a1-7afebe2bf3b7	00030000-561f-8c3d-77b6-54c8bd9e3dd1
00020000-561f-8c3f-c1a1-7afebe2bf3b7	00030000-561f-8c3d-bef3-bffa8b728ad1
00020000-561f-8c3f-c1a1-7afebe2bf3b7	00030000-561f-8c3d-c6b4-8d45efed8c45
00020000-561f-8c3f-c1a1-7afebe2bf3b7	00030000-561f-8c3d-a1f3-49c13418446f
00020000-561f-8c3f-c1a1-7afebe2bf3b7	00030000-561f-8c3d-ae4b-613ee8a59e35
00020000-561f-8c3f-c1a1-7afebe2bf3b7	00030000-561f-8c3d-62b7-b27c256878db
00020000-561f-8c3f-c1a1-7afebe2bf3b7	00030000-561f-8c3d-fd94-d9305abda1f3
00020000-561f-8c3f-c1a1-7afebe2bf3b7	00030000-561f-8c3d-bdfc-97d0f1177208
00020000-561f-8c3f-c1a1-7afebe2bf3b7	00030000-561f-8c3d-3023-08588ff5db9c
00020000-561f-8c3f-c1a1-7afebe2bf3b7	00030000-561f-8c3d-d735-aa5e7b877d94
00020000-561f-8c3f-c1a1-7afebe2bf3b7	00030000-561f-8c3d-d550-57c92d0b1116
00020000-561f-8c3f-c1a1-7afebe2bf3b7	00030000-561f-8c3d-3a13-79d727db8837
00020000-561f-8c3f-c1a1-7afebe2bf3b7	00030000-561f-8c3d-e24e-7e966fbf57cb
00020000-561f-8c3f-c1a1-7afebe2bf3b7	00030000-561f-8c3d-6a3e-639c9d687427
00020000-561f-8c3f-c1a1-7afebe2bf3b7	00030000-561f-8c3d-0718-4439ed093330
00020000-561f-8c3f-c1a1-7afebe2bf3b7	00030000-561f-8c3d-4cd5-0a2c636d8745
00020000-561f-8c3f-c1a1-7afebe2bf3b7	00030000-561f-8c3d-c61e-5cddc3d4d9a6
00020000-561f-8c3f-c1a1-7afebe2bf3b7	00030000-561f-8c3d-aace-785a87e87a9d
00020000-561f-8c3f-c1a1-7afebe2bf3b7	00030000-561f-8c3d-6b3a-19641fa6a24b
00020000-561f-8c3f-c1a1-7afebe2bf3b7	00030000-561f-8c3d-5999-47c4461e179d
00020000-561f-8c3f-c1a1-7afebe2bf3b7	00030000-561f-8c3d-35f1-6df99e8b3830
00020000-561f-8c3f-c1a1-7afebe2bf3b7	00030000-561f-8c3d-2064-122d3743d1f8
00020000-561f-8c3f-c1a1-7afebe2bf3b7	00030000-561f-8c3d-934c-222e4fe7f165
00020000-561f-8c3f-c1a1-7afebe2bf3b7	00030000-561f-8c3d-74b0-421920f6be00
00020000-561f-8c3f-c1a1-7afebe2bf3b7	00030000-561f-8c3d-52ca-5a45302570b8
00020000-561f-8c3f-c1a1-7afebe2bf3b7	00030000-561f-8c3d-9d34-39fdea3dcb10
00020000-561f-8c3f-c1a1-7afebe2bf3b7	00030000-561f-8c3d-a34f-ffe649a342b6
00020000-561f-8c3f-c1a1-7afebe2bf3b7	00030000-561f-8c3d-8239-70fd9a1d2d15
00020000-561f-8c3f-c1a1-7afebe2bf3b7	00030000-561f-8c3d-9904-68e05b454db4
00020000-561f-8c3f-c1a1-7afebe2bf3b7	00030000-561f-8c3d-a0b5-bac4c3919848
00020000-561f-8c3f-c1a1-7afebe2bf3b7	00030000-561f-8c3d-48bd-f47e0f8ef446
00020000-561f-8c3f-c1a1-7afebe2bf3b7	00030000-561f-8c3d-c0a3-5e9fdf44a392
00020000-561f-8c3f-c1a1-7afebe2bf3b7	00030000-561f-8c3d-95d3-da7c695b24a5
00020000-561f-8c3f-c1a1-7afebe2bf3b7	00030000-561f-8c3d-4ec7-86a8d57950d9
00020000-561f-8c3f-c1a1-7afebe2bf3b7	00030000-561f-8c3d-ecf7-096c3e74ae9a
00020000-561f-8c3f-c1a1-7afebe2bf3b7	00030000-561f-8c3d-df6a-c48d708b7895
00020000-561f-8c3f-c1a1-7afebe2bf3b7	00030000-561f-8c3d-8891-58b986dcf054
00020000-561f-8c3f-c1a1-7afebe2bf3b7	00030000-561f-8c3d-cdfb-41fa48854353
00020000-561f-8c3f-c1a1-7afebe2bf3b7	00030000-561f-8c3d-8b44-6701287c13af
00020000-561f-8c3f-c1a1-7afebe2bf3b7	00030000-561f-8c3d-445c-8c94dbde9cb5
00020000-561f-8c3f-c1a1-7afebe2bf3b7	00030000-561f-8c3d-cf02-38f228a3c177
00020000-561f-8c3f-c1a1-7afebe2bf3b7	00030000-561f-8c3d-c66e-c1aaccd8ac23
00020000-561f-8c3f-c1a1-7afebe2bf3b7	00030000-561f-8c3d-4ece-8ce954c5974e
00020000-561f-8c3f-c1a1-7afebe2bf3b7	00030000-561f-8c3d-b556-310d3eafbee2
00020000-561f-8c3f-c1a1-7afebe2bf3b7	00030000-561f-8c3d-0adc-36847a05b358
00020000-561f-8c3f-c1a1-7afebe2bf3b7	00030000-561f-8c3d-6d68-3c7347342cee
00020000-561f-8c3f-c1a1-7afebe2bf3b7	00030000-561f-8c3d-5a38-888e78e17d87
00020000-561f-8c3f-c1a1-7afebe2bf3b7	00030000-561f-8c3d-c698-9f0fb830e32c
00020000-561f-8c3f-c1a1-7afebe2bf3b7	00030000-561f-8c3d-ade1-6a378b2cacde
00020000-561f-8c3f-c1a1-7afebe2bf3b7	00030000-561f-8c3d-a6f5-9ea9c06ee24d
00020000-561f-8c3f-c1a1-7afebe2bf3b7	00030000-561f-8c3d-629b-4ff0db57dd3b
00020000-561f-8c3f-c1a1-7afebe2bf3b7	00030000-561f-8c3d-3a5e-f61bb108f4f5
00020000-561f-8c3f-c1a1-7afebe2bf3b7	00030000-561f-8c3d-9055-b63532722e02
00020000-561f-8c3f-c1a1-7afebe2bf3b7	00030000-561f-8c3d-5dca-3ed0f772db90
00020000-561f-8c3f-c1a1-7afebe2bf3b7	00030000-561f-8c3d-8057-e39f4e698bea
00020000-561f-8c3f-c1a1-7afebe2bf3b7	00030000-561f-8c3d-3be9-fd647c08c983
00020000-561f-8c3f-c1a1-7afebe2bf3b7	00030000-561f-8c3d-53b5-ef354cd77902
00020000-561f-8c3f-c1a1-7afebe2bf3b7	00030000-561f-8c3d-f530-1521cab5d3c8
00020000-561f-8c3f-c1a1-7afebe2bf3b7	00030000-561f-8c3d-6eb9-681a392cd6cf
00020000-561f-8c3f-c1a1-7afebe2bf3b7	00030000-561f-8c3d-a0b3-49877ceea732
00020000-561f-8c3f-c1a1-7afebe2bf3b7	00030000-561f-8c3d-e635-88258fda408c
00020000-561f-8c3f-c1a1-7afebe2bf3b7	00030000-561f-8c3d-c167-878cd0a8585c
00020000-561f-8c3f-c1a1-7afebe2bf3b7	00030000-561f-8c3d-1737-f005b029356d
00020000-561f-8c3f-c1a1-7afebe2bf3b7	00030000-561f-8c3d-72b6-d818a52f0c47
00020000-561f-8c3f-c1a1-7afebe2bf3b7	00030000-561f-8c3d-edb2-5216968f0b69
00020000-561f-8c3f-c1a1-7afebe2bf3b7	00030000-561f-8c3d-7a00-b981f5f4f211
00020000-561f-8c3f-c1a1-7afebe2bf3b7	00030000-561f-8c3d-f00c-6e3066c757b0
00020000-561f-8c3f-c1a1-7afebe2bf3b7	00030000-561f-8c3d-dfe9-79610a33dbbf
00020000-561f-8c3f-c1a1-7afebe2bf3b7	00030000-561f-8c3d-e9f0-bedae34da9d8
00020000-561f-8c3f-c1a1-7afebe2bf3b7	00030000-561f-8c3d-7d36-5dc90cb93816
00020000-561f-8c3f-c1a1-7afebe2bf3b7	00030000-561f-8c3d-a87e-a5565a3c1016
00020000-561f-8c3f-c1a1-7afebe2bf3b7	00030000-561f-8c3d-a63a-7cf16feb926e
00020000-561f-8c3f-c1a1-7afebe2bf3b7	00030000-561f-8c3d-b780-944097c43287
00020000-561f-8c3f-c1a1-7afebe2bf3b7	00030000-561f-8c3d-2768-c108cbe1e940
00020000-561f-8c3f-c1a1-7afebe2bf3b7	00030000-561f-8c3d-d33a-5ac0033e3a88
00020000-561f-8c3f-c1a1-7afebe2bf3b7	00030000-561f-8c3d-ee61-c7640233ba93
00020000-561f-8c3f-c1a1-7afebe2bf3b7	00030000-561f-8c3d-d12f-7530d270fb98
00020000-561f-8c3f-c1a1-7afebe2bf3b7	00030000-561f-8c3d-c263-54a66ff589b3
00020000-561f-8c3f-c1a1-7afebe2bf3b7	00030000-561f-8c3d-d1e6-01bc33b3b558
00020000-561f-8c3f-c1a1-7afebe2bf3b7	00030000-561f-8c3d-3b9c-e039fb16811a
00020000-561f-8c3f-c1a1-7afebe2bf3b7	00030000-561f-8c3d-d8c1-4c0501ff1737
00020000-561f-8c3f-c1a1-7afebe2bf3b7	00030000-561f-8c3d-f7c7-23e23d692940
00020000-561f-8c3f-c1a1-7afebe2bf3b7	00030000-561f-8c3d-80f9-f6c8ba18066d
00020000-561f-8c3f-c1a1-7afebe2bf3b7	00030000-561f-8c3d-b57b-f6c976622d2d
00020000-561f-8c3f-c1a1-7afebe2bf3b7	00030000-561f-8c3d-5694-52b0d456ed5e
00020000-561f-8c3f-c1a1-7afebe2bf3b7	00030000-561f-8c3d-c33d-07e01ca2d6ab
00020000-561f-8c3f-c1a1-7afebe2bf3b7	00030000-561f-8c3d-50da-8d218d4bda21
00020000-561f-8c3f-c1a1-7afebe2bf3b7	00030000-561f-8c3d-dbb0-5e337440ce75
00020000-561f-8c3f-c1a1-7afebe2bf3b7	00030000-561f-8c3d-3abb-6b3ce1d978aa
00020000-561f-8c3f-c1a1-7afebe2bf3b7	00030000-561f-8c3d-c8c1-a91ba42c06e9
00020000-561f-8c3f-c1a1-7afebe2bf3b7	00030000-561f-8c3d-de2c-643f510c74cd
00020000-561f-8c3f-c1a1-7afebe2bf3b7	00030000-561f-8c3d-bc0c-6f0e53f33843
00020000-561f-8c3f-c1a1-7afebe2bf3b7	00030000-561f-8c3d-b0a1-f178ade4c1ea
00020000-561f-8c3f-c1a1-7afebe2bf3b7	00030000-561f-8c3d-1e41-ddff072bcf25
00020000-561f-8c3f-c1a1-7afebe2bf3b7	00030000-561f-8c3d-ddf4-584f31aedcba
00020000-561f-8c3f-c1a1-7afebe2bf3b7	00030000-561f-8c3d-56e6-6857467fcbea
00020000-561f-8c3f-c1a1-7afebe2bf3b7	00030000-561f-8c3d-b4d5-f825ebb5ba35
00020000-561f-8c3f-c1a1-7afebe2bf3b7	00030000-561f-8c3d-08ae-9514bec671c7
\.


--
-- TOC entry 3046 (class 0 OID 22024054)
-- Dependencies: 210
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 3050 (class 0 OID 22024088)
-- Dependencies: 214
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 3062 (class 0 OID 22024224)
-- Dependencies: 226
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, zacetek, konec, jeavtorskepravice, placilonavajo, vrednostvaje, planiranostevilovaj, vrednostvaj, vrednostpredstave, procentodinkasa, jeprocentodinkasa, vrednostdopremiere, zaposlenvdrjz, samozaposlen, igralec, opis) FROM stdin;
000b0000-561f-8c3f-e428-b90bef9337d3	00090000-561f-8c3f-f1fb-0bed5c839410	\N	\N	0001	\N	\N	f	f	10.00	3	10.00	30.00	\N	f	10.00	t	f	t	Pogodba o sodelovanju
000b0000-561f-8c3f-f981-c5aea3845a25	00090000-561f-8c3f-4cf7-ce68b1744147	\N	\N	0002	\N	\N	f	t	11.00	10	11.00	31.00	\N	f	110.00	f	t	t	Pogodba za vlogo Helena
000b0000-561f-8c3f-9f61-bfe141c78895	00090000-561f-8c3f-f25a-31aae340d507	\N	\N	0003	\N	\N	f	f	12.00	4	12.00	0.00	\N	f	12.00	f	t	f	Pogodba za lektoriranje
000b0000-561f-8c3f-8b5b-ed01e82439bf	00090000-561f-8c3f-fb32-6e91d24cb043	\N	\N	0004	\N	\N	t	f	0.00	2	300.00	0.00	\N	f	300.00	f	t	f	Pogodba za avtorske pravice
\.


--
-- TOC entry 3022 (class 0 OID 22023788)
-- Dependencies: 186
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, tipkli_id, drzava_id, sifra, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo, nvo) FROM stdin;
00080000-561f-8c3f-5183-ad706dbf9047	\N	00040000-561f-8c3c-6b14-ffbc619a9f47	0988	AK	Juhuhu d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-561f-8c3f-bc1a-63204ef2a5da	\N	00040000-561f-8c3c-6b14-ffbc619a9f47	0989	AK	Hopsasa d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	t
00080000-561f-8c3f-16a8-035129318d7c	\N	00040000-561f-8c3c-6b14-ffbc619a9f47	0987	AK	Gledališče Šrum d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-561f-8c3f-4aaa-23d913742524	\N	00040000-561f-8c3c-6b14-ffbc619a9f47	0986	AK	Lutkovni Direndaj d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-561f-8c3f-ef09-e3362b64c870	\N	00040000-561f-8c3c-6b14-ffbc619a9f47	0985	AK	Tatjana Stanič, Lektoriranje, s.p.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-561f-8c3f-5bae-886863f72226	\N	00040000-561f-8c3c-da06-9a289300dfab	0984	AK	Gledališče Lepote tvoje		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-561f-8c3f-06a7-eeef87d1767d	\N	00040000-561f-8c3c-8266-19814a3a9513	0983	AK	Sunce naše		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-561f-8c3f-f653-7f8f6781664b	\N	00040000-561f-8c3c-c08e-495e5eda7337	0982	AK	Theater Amadeus		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-561f-8c3f-dc7b-d930ca5c5d97	\N	00040000-561f-8c3c-a967-6077910f9185	9999	AK	Fuchs		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-561f-8c40-c6e6-7aa5f562b5c8	\N	00040000-561f-8c3c-6b14-ffbc619a9f47	1001	AK	Gledališče Matica		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
\.


--
-- TOC entry 3024 (class 0 OID 22023823)
-- Dependencies: 188
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-561f-8c3c-40f2-b0aabf4f8b91	8341	Adlešiči
00050000-561f-8c3c-a98a-42bdd6ed4a86	5270	Ajdovščina
00050000-561f-8c3c-0169-b5f39b7bf11d	6280	Ankaran/Ancarano
00050000-561f-8c3c-097e-8fc7353723c9	9253	Apače
00050000-561f-8c3c-5466-f7e99fe45a27	8253	Artiče
00050000-561f-8c3c-1e25-8b19d0d9288d	4275	Begunje na Gorenjskem
00050000-561f-8c3c-03dd-39387ec879a0	1382	Begunje pri Cerknici
00050000-561f-8c3c-09c0-67d4e435de22	9231	Beltinci
00050000-561f-8c3c-2848-a2122a503592	2234	Benedikt
00050000-561f-8c3c-2838-2896bc926cbb	2345	Bistrica ob Dravi
00050000-561f-8c3c-956e-d8fb9630cffe	3256	Bistrica ob Sotli
00050000-561f-8c3c-2145-92eee83f3031	8259	Bizeljsko
00050000-561f-8c3c-2cf8-4d4f51982301	1223	Blagovica
00050000-561f-8c3c-a5d5-5b754e6a5f1b	8283	Blanca
00050000-561f-8c3c-c624-b6cc13ee6af4	4260	Bled
00050000-561f-8c3c-06c6-53c3500b1193	4273	Blejska Dobrava
00050000-561f-8c3c-b63f-fe05d530df03	9265	Bodonci
00050000-561f-8c3c-b205-78eb5e91f53a	9222	Bogojina
00050000-561f-8c3c-92ff-77a31c643d51	4263	Bohinjska Bela
00050000-561f-8c3c-9817-57a550a5e457	4264	Bohinjska Bistrica
00050000-561f-8c3c-52c3-2230670ca957	4265	Bohinjsko jezero
00050000-561f-8c3c-788a-8ad2bc2ba518	1353	Borovnica
00050000-561f-8c3c-93ef-01e1dfafd3e9	8294	Boštanj
00050000-561f-8c3c-d416-2c5cd7dfeb2c	5230	Bovec
00050000-561f-8c3c-4f79-ab6d92183599	5295	Branik
00050000-561f-8c3c-be17-29dfce3d4a7e	3314	Braslovče
00050000-561f-8c3c-8ebc-326133d203c4	5223	Breginj
00050000-561f-8c3c-046c-1cfcb92d91f9	8280	Brestanica
00050000-561f-8c3c-03f7-89bdc2b8727f	2354	Bresternica
00050000-561f-8c3c-3e5a-956d9ea406c9	4243	Brezje
00050000-561f-8c3c-6ca4-2809790bd33a	1351	Brezovica pri Ljubljani
00050000-561f-8c3c-d9ab-f61a03b59a7f	8250	Brežice
00050000-561f-8c3c-3245-718df60c21c1	4210	Brnik - Aerodrom
00050000-561f-8c3c-801d-4cd8cc2f101e	8321	Brusnice
00050000-561f-8c3c-ebd8-7ef235bc4338	3255	Buče
00050000-561f-8c3c-c684-ebfb2df319e0	8276	Bučka 
00050000-561f-8c3c-2731-61e3561b3177	9261	Cankova
00050000-561f-8c3c-bd1b-7d20651cfb20	3000	Celje 
00050000-561f-8c3c-a144-0d7efe58a846	3001	Celje - poštni predali
00050000-561f-8c3c-1d85-dde77ff71f99	4207	Cerklje na Gorenjskem
00050000-561f-8c3c-6867-51407cbfa525	8263	Cerklje ob Krki
00050000-561f-8c3c-37bd-662b84a16e64	1380	Cerknica
00050000-561f-8c3c-a0aa-93f9323f1501	5282	Cerkno
00050000-561f-8c3c-a7ce-08ca6dc99b12	2236	Cerkvenjak
00050000-561f-8c3c-f823-c2076dc31b00	2215	Ceršak
00050000-561f-8c3c-aaac-e28e5e22be0c	2326	Cirkovce
00050000-561f-8c3c-88da-675708c81d8c	2282	Cirkulane
00050000-561f-8c3c-7331-cbc5b77ef3d7	5273	Col
00050000-561f-8c3c-da1f-b34467025a0c	8251	Čatež ob Savi
00050000-561f-8c3c-0877-aabb7f8e189d	1413	Čemšenik
00050000-561f-8c3c-ead6-0fe2ed3f6754	5253	Čepovan
00050000-561f-8c3c-7a73-2b6140bd8995	9232	Črenšovci
00050000-561f-8c3c-c0db-c9876ab811b9	2393	Črna na Koroškem
00050000-561f-8c3c-8216-721ab258da8c	6275	Črni Kal
00050000-561f-8c3c-05cb-d6158fda47de	5274	Črni Vrh nad Idrijo
00050000-561f-8c3c-9d4b-facc9fbc8a33	5262	Črniče
00050000-561f-8c3c-c364-d13cc9800a81	8340	Črnomelj
00050000-561f-8c3c-528a-d530b2c8310d	6271	Dekani
00050000-561f-8c3c-d86c-a7280e9981ef	5210	Deskle
00050000-561f-8c3c-49d1-5c4b325a2eba	2253	Destrnik
00050000-561f-8c3c-6a9a-16182b52da0b	6215	Divača
00050000-561f-8c3c-490d-cbe2e86b9303	1233	Dob
00050000-561f-8c3c-f0b2-f2110f0946dd	3224	Dobje pri Planini
00050000-561f-8c3c-246b-e3cccd332aca	8257	Dobova
00050000-561f-8c3c-934f-0227da738525	1423	Dobovec
00050000-561f-8c3c-fdae-c57311892d69	5263	Dobravlje
00050000-561f-8c3c-e23a-4ac782dc8ac2	3204	Dobrna
00050000-561f-8c3c-33f3-802f307e80d5	8211	Dobrnič
00050000-561f-8c3c-1ef6-803f8f3559bd	1356	Dobrova
00050000-561f-8c3c-4693-980a5721effc	9223	Dobrovnik/Dobronak 
00050000-561f-8c3c-a65d-c4adb1b8ebfe	5212	Dobrovo v Brdih
00050000-561f-8c3c-9431-66efc098eec6	1431	Dol pri Hrastniku
00050000-561f-8c3c-f5d7-38675046f1dc	1262	Dol pri Ljubljani
00050000-561f-8c3c-af02-d96d2976bb8e	1273	Dole pri Litiji
00050000-561f-8c3c-8ce9-60ce898f68a7	1331	Dolenja vas
00050000-561f-8c3c-c22d-170965dba7c3	8350	Dolenjske Toplice
00050000-561f-8c3c-b3dd-392b3b964d44	1230	Domžale
00050000-561f-8c3c-c84f-6e1be30c07b8	2252	Dornava
00050000-561f-8c3c-8de0-017edd1d2f50	5294	Dornberk
00050000-561f-8c3c-4b96-7ea084835ced	1319	Draga
00050000-561f-8c3c-a94a-6ee0ab7e602b	8343	Dragatuš
00050000-561f-8c3c-5a00-1ce1671f0924	3222	Dramlje
00050000-561f-8c3c-ffea-b9993e5777ff	2370	Dravograd
00050000-561f-8c3c-194c-1c165c1d25ea	4203	Duplje
00050000-561f-8c3c-80f7-aa33a78f70db	6221	Dutovlje
00050000-561f-8c3c-848b-2e73bbbef6dd	8361	Dvor
00050000-561f-8c3c-cc56-ca760ce23eaa	2343	Fala
00050000-561f-8c3c-c978-88680eecdadc	9208	Fokovci
00050000-561f-8c3c-7616-b6da719cec4c	2313	Fram
00050000-561f-8c3c-e558-e051efee5e2c	3213	Frankolovo
00050000-561f-8c3c-56af-452a2bce4a47	1274	Gabrovka
00050000-561f-8c3c-d66e-2e67b458540c	8254	Globoko
00050000-561f-8c3c-4b7c-a406c7bc8a87	5275	Godovič
00050000-561f-8c3c-47e1-6c60f1fbdddd	4204	Golnik
00050000-561f-8c3c-0124-1b98c43f90eb	3303	Gomilsko
00050000-561f-8c3c-1933-d927ca59a702	4224	Gorenja vas
00050000-561f-8c3c-abe8-288baafd3093	3263	Gorica pri Slivnici
00050000-561f-8c3c-6c1d-c301aff2c4fc	2272	Gorišnica
00050000-561f-8c3c-a338-5801f2dc6aa6	9250	Gornja Radgona
00050000-561f-8c3c-7907-e8cf81a0d35d	3342	Gornji Grad
00050000-561f-8c3c-a817-66631b67e17e	4282	Gozd Martuljek
00050000-561f-8c3c-db8e-28345be4f41d	6272	Gračišče
00050000-561f-8c3c-1ed3-900752a47b29	9264	Grad
00050000-561f-8c3c-80f2-e789d4b50411	8332	Gradac
00050000-561f-8c3c-b026-3cc9ebde33e7	1384	Grahovo
00050000-561f-8c3c-3d18-9b7ff20b7187	5242	Grahovo ob Bači
00050000-561f-8c3c-4099-553486e45a07	5251	Grgar
00050000-561f-8c3c-3bd4-fdc0a7dba8da	3302	Griže
00050000-561f-8c3c-47a0-c27e639a15f0	3231	Grobelno
00050000-561f-8c3c-4620-2f84acff60ff	1290	Grosuplje
00050000-561f-8c3c-94e6-931c73ffabaa	2288	Hajdina
00050000-561f-8c3c-a162-394dbc30b001	8362	Hinje
00050000-561f-8c3c-169e-b60a9aee2e38	2311	Hoče
00050000-561f-8c3c-f65c-6955c2fe102f	9205	Hodoš/Hodos
00050000-561f-8c3c-b73d-db05a4ddbdc9	1354	Horjul
00050000-561f-8c3c-e5b9-70ca806f715e	1372	Hotedršica
00050000-561f-8c3c-b083-3824940db6e0	1430	Hrastnik
00050000-561f-8c3c-f47f-975693aeb2a4	6225	Hruševje
00050000-561f-8c3c-6f7a-77704dd0b4d6	4276	Hrušica
00050000-561f-8c3c-c564-13ec163cdcf1	5280	Idrija
00050000-561f-8c3c-6b55-9bab7dd008d1	1292	Ig
00050000-561f-8c3c-e60c-804fcb57392f	6250	Ilirska Bistrica
00050000-561f-8c3c-50da-f5c870ea569c	6251	Ilirska Bistrica-Trnovo
00050000-561f-8c3c-ecaf-6fef812975e3	1295	Ivančna Gorica
00050000-561f-8c3c-8d3b-ae0ced518af5	2259	Ivanjkovci
00050000-561f-8c3c-41a6-c9ab08f4f9d6	1411	Izlake
00050000-561f-8c3c-032e-5fa890daffef	6310	Izola/Isola
00050000-561f-8c3c-8ebc-db322183c256	2222	Jakobski Dol
00050000-561f-8c3c-a981-d75ad04fa67e	2221	Jarenina
00050000-561f-8c3c-6053-b1e7ea138be5	6254	Jelšane
00050000-561f-8c3c-9dc8-2da32cd23dce	4270	Jesenice
00050000-561f-8c3c-064e-ea5f47a4c7ef	8261	Jesenice na Dolenjskem
00050000-561f-8c3c-ef37-aa7d7e39e293	3273	Jurklošter
00050000-561f-8c3c-e4ae-83ac7fcbdad3	2223	Jurovski Dol
00050000-561f-8c3c-1368-96eabb78faa1	2256	Juršinci
00050000-561f-8c3c-27bb-2eafdb3b10fe	5214	Kal nad Kanalom
00050000-561f-8c3c-ec4e-851c863de8b1	3233	Kalobje
00050000-561f-8c3c-692d-89cfea9e1583	4246	Kamna Gorica
00050000-561f-8c3c-cd83-d4b306d54cfe	2351	Kamnica
00050000-561f-8c3c-2f2d-26fec9a6d4eb	1241	Kamnik
00050000-561f-8c3c-0f58-d133b110536d	5213	Kanal
00050000-561f-8c3c-4327-4f4b235357b2	8258	Kapele
00050000-561f-8c3c-176d-a82972a4b33c	2362	Kapla
00050000-561f-8c3c-5927-76436dae8c0c	2325	Kidričevo
00050000-561f-8c3c-09bb-edcb15111cd1	1412	Kisovec
00050000-561f-8c3c-7062-9876c4540ea8	6253	Knežak
00050000-561f-8c3c-ac8b-7068c828b69b	5222	Kobarid
00050000-561f-8c3c-ad73-7ec4f818f9c8	9227	Kobilje
00050000-561f-8c3c-2209-819031f8b855	1330	Kočevje
00050000-561f-8c3c-63c6-421f779435ce	1338	Kočevska Reka
00050000-561f-8c3c-69e4-c67f7354222a	2276	Kog
00050000-561f-8c3c-fb21-7543761c8cbe	5211	Kojsko
00050000-561f-8c3c-a3fb-97bb13f39208	6223	Komen
00050000-561f-8c3c-5b18-1d75ba251828	1218	Komenda
00050000-561f-8c3c-ac2f-1d4262f5eb04	6000	Koper/Capodistria 
00050000-561f-8c3c-99ab-6ef32a505334	6001	Koper/Capodistria - poštni predali
00050000-561f-8c3c-cc8c-7bc3342472d1	8282	Koprivnica
00050000-561f-8c3c-1e5d-7313d968210e	5296	Kostanjevica na Krasu
00050000-561f-8c3c-024f-fffb1650fddf	8311	Kostanjevica na Krki
00050000-561f-8c3c-af60-628cbe2795a9	1336	Kostel
00050000-561f-8c3c-98be-58883eb9338c	6256	Košana
00050000-561f-8c3c-ba6a-c271e1d260e5	2394	Kotlje
00050000-561f-8c3c-394a-1019c8abd187	6240	Kozina
00050000-561f-8c3c-c447-7ca711465443	3260	Kozje
00050000-561f-8c3c-dfcd-6b60ea00ab17	4000	Kranj 
00050000-561f-8c3c-4370-e9975e5eead5	4001	Kranj - poštni predali
00050000-561f-8c3c-3969-b9d66a65c029	4280	Kranjska Gora
00050000-561f-8c3c-e5a0-2b7a69f6c4c7	1281	Kresnice
00050000-561f-8c3c-0692-71c1b3481d44	4294	Križe
00050000-561f-8c3c-8b46-ff80cc10fc80	9206	Križevci
00050000-561f-8c3c-7b84-46ac01838095	9242	Križevci pri Ljutomeru
00050000-561f-8c3c-4615-05b9e01b4b72	1301	Krka
00050000-561f-8c3c-7ad6-cb74a127e8a7	8296	Krmelj
00050000-561f-8c3c-4385-c4acbcb5c7c3	4245	Kropa
00050000-561f-8c3c-10dd-73ca8fc363d5	8262	Krška vas
00050000-561f-8c3c-88f3-5af5201fdf5c	8270	Krško
00050000-561f-8c3c-f06d-9623b2196a28	9263	Kuzma
00050000-561f-8c3c-92d1-87d07476df93	2318	Laporje
00050000-561f-8c3c-e339-a872a6e2d45d	3270	Laško
00050000-561f-8c3c-fd78-9d65fbca39a2	1219	Laze v Tuhinju
00050000-561f-8c3c-4bf8-0d9a12cb0098	2230	Lenart v Slovenskih goricah
00050000-561f-8c3c-576e-d0b52bce56c3	9220	Lendava/Lendva
00050000-561f-8c3c-aac1-38b553e38a62	4248	Lesce
00050000-561f-8c3c-86e2-fa8885140f0f	3261	Lesično
00050000-561f-8c3c-abbd-7fed2e091f3d	8273	Leskovec pri Krškem
00050000-561f-8c3c-7a2e-a51fcffbf374	2372	Libeliče
00050000-561f-8c3c-0f3c-b65e8e3e3818	2341	Limbuš
00050000-561f-8c3c-a112-02d87c5f50ae	1270	Litija
00050000-561f-8c3c-3cca-ef4fd614cda3	3202	Ljubečna
00050000-561f-8c3c-4f07-63ac2b26fbd8	1000	Ljubljana 
00050000-561f-8c3c-e356-1e63a59b02d4	1001	Ljubljana - poštni predali
00050000-561f-8c3c-11bb-52a7f000b617	1231	Ljubljana - Črnuče
00050000-561f-8c3c-0ff4-13d4ca6d64b1	1261	Ljubljana - Dobrunje
00050000-561f-8c3c-eb87-cc3d9fdbc4e6	1260	Ljubljana - Polje
00050000-561f-8c3c-d9a8-dec5cfa94e31	1210	Ljubljana - Šentvid
00050000-561f-8c3c-8774-9d073f432f5a	1211	Ljubljana - Šmartno
00050000-561f-8c3c-7472-7776408ec048	3333	Ljubno ob Savinji
00050000-561f-8c3c-d9ad-c11b6de5aa58	9240	Ljutomer
00050000-561f-8c3c-38de-ba78e6dc6be8	3215	Loče
00050000-561f-8c3c-6213-3a78d6b863e5	5231	Log pod Mangartom
00050000-561f-8c3c-d676-fc3c0e07a6a6	1358	Log pri Brezovici
00050000-561f-8c3c-8bf8-7070ba312a40	1370	Logatec
00050000-561f-8c3c-903f-0d91f9558876	1371	Logatec
00050000-561f-8c3c-b89e-3082a3e8f68a	1434	Loka pri Zidanem Mostu
00050000-561f-8c3c-7345-829e56e63730	3223	Loka pri Žusmu
00050000-561f-8c3c-2a36-a8c26139e489	6219	Lokev
00050000-561f-8c3c-6dfc-9d44a696f246	1318	Loški Potok
00050000-561f-8c3c-21e5-80831090e5d7	2324	Lovrenc na Dravskem polju
00050000-561f-8c3c-8506-748146d7fa55	2344	Lovrenc na Pohorju
00050000-561f-8c3c-13f0-2cadb26cb3d0	3334	Luče
00050000-561f-8c3c-9535-9d9a19f4cde1	1225	Lukovica
00050000-561f-8c3c-e7d7-db49490eb83c	9202	Mačkovci
00050000-561f-8c3c-deda-8cb0183d8e38	2322	Majšperk
00050000-561f-8c3c-8ae6-1fe6767af67f	2321	Makole
00050000-561f-8c3c-1c57-4a38b65c0725	9243	Mala Nedelja
00050000-561f-8c3c-1e53-0d0407ba1ac1	2229	Malečnik
00050000-561f-8c3c-c894-8b7c01a8cc23	6273	Marezige
00050000-561f-8c3c-0092-480a2ad0232e	2000	Maribor 
00050000-561f-8c3c-7bc3-ad40b92cecf2	2001	Maribor - poštni predali
00050000-561f-8c3c-e13d-7a88c3ae42d7	2206	Marjeta na Dravskem polju
00050000-561f-8c3c-5744-dd6616312157	2281	Markovci
00050000-561f-8c3c-dea4-0c4c1af6a9d8	9221	Martjanci
00050000-561f-8c3c-18db-b51dc0c11b67	6242	Materija
00050000-561f-8c3c-7b27-6fadde397f40	4211	Mavčiče
00050000-561f-8c3c-226a-2e161377bb68	1215	Medvode
00050000-561f-8c3c-f950-5435d9715575	1234	Mengeš
00050000-561f-8c3c-bae2-880167ffafd0	8330	Metlika
00050000-561f-8c3c-4256-4bbea82445bc	2392	Mežica
00050000-561f-8c3c-583e-a3bc839d7be8	2204	Miklavž na Dravskem polju
00050000-561f-8c3c-c17b-716cb89650b4	2275	Miklavž pri Ormožu
00050000-561f-8c3c-b998-cb165ed9908c	5291	Miren
00050000-561f-8c3c-2b36-7386a57e37bf	8233	Mirna
00050000-561f-8c3c-c099-5597d93d260f	8216	Mirna Peč
00050000-561f-8c3c-5408-455a94eda57d	2382	Mislinja
00050000-561f-8c3c-f3b7-f9762d4cb6a5	4281	Mojstrana
00050000-561f-8c3c-bfbb-600b6af3554d	8230	Mokronog
00050000-561f-8c3c-fe77-1aa21f795381	1251	Moravče
00050000-561f-8c3c-5c5b-1ad50e2f992c	9226	Moravske Toplice
00050000-561f-8c3c-d4c1-8657e4413d63	5216	Most na Soči
00050000-561f-8c3c-bd3d-17189f9e96be	1221	Motnik
00050000-561f-8c3c-1be6-53a3ec7eea95	3330	Mozirje
00050000-561f-8c3c-488c-ab7b0c1bc6c4	9000	Murska Sobota 
00050000-561f-8c3c-86ca-edbe75628472	9001	Murska Sobota - poštni predali
00050000-561f-8c3c-8894-b883487431d8	2366	Muta
00050000-561f-8c3c-e283-8fd6c54fbf2b	4202	Naklo
00050000-561f-8c3c-38dc-15d850da5b26	3331	Nazarje
00050000-561f-8c3c-17b1-9a0e5c6ecb0b	1357	Notranje Gorice
00050000-561f-8c3c-98fd-1ed708d3e400	3203	Nova Cerkev
00050000-561f-8c3c-d3f9-6a315c3b423d	5000	Nova Gorica 
00050000-561f-8c3c-b41b-efb16e75c568	5001	Nova Gorica - poštni predali
00050000-561f-8c3c-53d2-6617fdbfa2eb	1385	Nova vas
00050000-561f-8c3c-d5c3-355a14edaca5	8000	Novo mesto
00050000-561f-8c3c-d736-695d3b3dff9e	8001	Novo mesto - poštni predali
00050000-561f-8c3c-014f-6d90bd14e43b	6243	Obrov
00050000-561f-8c3c-6fe9-000d10be4c69	9233	Odranci
00050000-561f-8c3c-0da4-1a748dec222d	2317	Oplotnica
00050000-561f-8c3c-735f-5596083f00e7	2312	Orehova vas
00050000-561f-8c3c-5d99-dc02c763b342	2270	Ormož
00050000-561f-8c3c-0d82-21cf936f5d7f	1316	Ortnek
00050000-561f-8c3c-5e9a-ae8a744661eb	1337	Osilnica
00050000-561f-8c3c-9927-f98bd94f9a13	8222	Otočec
00050000-561f-8c3c-62ba-99614399da77	2361	Ožbalt
00050000-561f-8c3c-a3bc-84d1717afbae	2231	Pernica
00050000-561f-8c3c-1993-be48592204d4	2211	Pesnica pri Mariboru
00050000-561f-8c3c-1bd3-cae0d32cd397	9203	Petrovci
00050000-561f-8c3c-715c-cb145cd84c60	3301	Petrovče
00050000-561f-8c3c-ab0b-733b759b3a14	6330	Piran/Pirano
00050000-561f-8c3c-fd6b-52cc742cbee7	8255	Pišece
00050000-561f-8c3c-def9-a032dd91d161	6257	Pivka
00050000-561f-8c3c-3443-a90505a5b45c	6232	Planina
00050000-561f-8c3c-4f66-62a0ff880019	3225	Planina pri Sevnici
00050000-561f-8c3c-81b5-e8a0f2faa130	6276	Pobegi
00050000-561f-8c3c-64f1-9e450e4e17df	8312	Podbočje
00050000-561f-8c3c-635a-df50da729851	5243	Podbrdo
00050000-561f-8c3c-21fb-6db53f8d5346	3254	Podčetrtek
00050000-561f-8c3c-43ed-b631faf78e9e	2273	Podgorci
00050000-561f-8c3c-fe09-b0921e00fb21	6216	Podgorje
00050000-561f-8c3c-1065-6552f146b843	2381	Podgorje pri Slovenj Gradcu
00050000-561f-8c3c-a481-06eb8b9bcf70	6244	Podgrad
00050000-561f-8c3c-5d9c-464f2aace69a	1414	Podkum
00050000-561f-8c3c-13cc-90c5274f7873	2286	Podlehnik
00050000-561f-8c3c-6a9f-6fbf2768e403	5272	Podnanos
00050000-561f-8c3c-36fd-9e0a1c32cc6b	4244	Podnart
00050000-561f-8c3c-b47d-65149f6e4b70	3241	Podplat
00050000-561f-8c3c-af1a-527add517947	3257	Podsreda
00050000-561f-8c3c-ad16-5cd8b58e29b7	2363	Podvelka
00050000-561f-8c3c-8f0f-ac99eef44c01	2208	Pohorje
00050000-561f-8c3c-3182-4390d3d34272	2257	Polenšak
00050000-561f-8c3c-6fe4-50e68b8e6be7	1355	Polhov Gradec
00050000-561f-8c3c-29e5-6efb6976c1ec	4223	Poljane nad Škofjo Loko
00050000-561f-8c3c-0a7c-e8faf4905c38	2319	Poljčane
00050000-561f-8c3c-501f-659fa792043d	1272	Polšnik
00050000-561f-8c3c-2452-0515b97e02f7	3313	Polzela
00050000-561f-8c3c-34f6-e1a77269c37d	3232	Ponikva
00050000-561f-8c3c-c653-c1594f038e10	6320	Portorož/Portorose
00050000-561f-8c3c-c45b-0301e0a70f86	6230	Postojna
00050000-561f-8c3c-09b7-9d71931be317	2331	Pragersko
00050000-561f-8c3c-12ef-054b21a2119f	3312	Prebold
00050000-561f-8c3c-6720-d273c4795388	4205	Preddvor
00050000-561f-8c3c-8908-591a4bfe0c6b	6255	Prem
00050000-561f-8c3c-846e-1e3a8255c133	1352	Preserje
00050000-561f-8c3c-4843-207b6b86a262	6258	Prestranek
00050000-561f-8c3c-e4ea-2d037205b15e	2391	Prevalje
00050000-561f-8c3c-cecf-c8c56bbdb90c	3262	Prevorje
00050000-561f-8c3c-2679-75e932a72208	1276	Primskovo 
00050000-561f-8c3c-442f-43d4efff7174	3253	Pristava pri Mestinju
00050000-561f-8c3c-e38c-41bd271486b5	9207	Prosenjakovci/Partosfalva
00050000-561f-8c3c-329b-35c1788a1067	5297	Prvačina
00050000-561f-8c3c-5586-862a9cf639d8	2250	Ptuj
00050000-561f-8c3c-47bb-86718a290cad	2323	Ptujska Gora
00050000-561f-8c3c-1ead-63d195800fe7	9201	Puconci
00050000-561f-8c3c-845d-6a6aa0a6792a	2327	Rače
00050000-561f-8c3c-6855-975ff26f0a7a	1433	Radeče
00050000-561f-8c3c-2130-92c661b79b80	9252	Radenci
00050000-561f-8c3c-629a-f095b99cfcc7	2360	Radlje ob Dravi
00050000-561f-8c3c-d3f8-9e15dbcefa07	1235	Radomlje
00050000-561f-8c3c-89f0-4a51e120052d	4240	Radovljica
00050000-561f-8c3c-232f-0653add17ab5	8274	Raka
00050000-561f-8c3c-facc-04cc37cd514e	1381	Rakek
00050000-561f-8c3c-244e-d5e7c796d0ad	4283	Rateče - Planica
00050000-561f-8c3c-54c9-a1bf6393f5bf	2390	Ravne na Koroškem
00050000-561f-8c3c-c26e-d265683dc8f3	9246	Razkrižje
00050000-561f-8c3c-0d09-800a78db80b2	3332	Rečica ob Savinji
00050000-561f-8c3c-80b7-bcfebe7c4421	5292	Renče
00050000-561f-8c3c-1a7d-15469c9e0037	1310	Ribnica
00050000-561f-8c3c-ba0d-bad6f2e27e4f	2364	Ribnica na Pohorju
00050000-561f-8c3c-934b-4d26c77ad191	3272	Rimske Toplice
00050000-561f-8c3c-184d-b0377801443d	1314	Rob
00050000-561f-8c3c-6174-4eb945f53048	5215	Ročinj
00050000-561f-8c3c-0c4b-89f504a918c2	3250	Rogaška Slatina
00050000-561f-8c3c-991d-0831b57a7795	9262	Rogašovci
00050000-561f-8c3c-772f-2aefad6603a3	3252	Rogatec
00050000-561f-8c3c-0086-763ea1664822	1373	Rovte
00050000-561f-8c3c-7738-13eafdfe8414	2342	Ruše
00050000-561f-8c3c-01b1-337e2056fed8	1282	Sava
00050000-561f-8c3c-cf7e-ff8d114ce10a	6333	Sečovlje/Sicciole
00050000-561f-8c3c-6709-f18ba4ce8c5f	4227	Selca
00050000-561f-8c3c-5782-10961b9a2618	2352	Selnica ob Dravi
00050000-561f-8c3c-03e5-fe6a7a54be89	8333	Semič
00050000-561f-8c3c-f2be-38441278a8a5	8281	Senovo
00050000-561f-8c3c-c574-7d28336b6260	6224	Senožeče
00050000-561f-8c3c-53b6-cec828ec746f	8290	Sevnica
00050000-561f-8c3c-4f12-ce46aaaf8984	6210	Sežana
00050000-561f-8c3c-8a78-694409aecf2c	2214	Sladki Vrh
00050000-561f-8c3c-d88c-9c85cfb2412e	5283	Slap ob Idrijci
00050000-561f-8c3c-e6b5-a3f922493424	2380	Slovenj Gradec
00050000-561f-8c3c-43f6-21c424839a7f	2310	Slovenska Bistrica
00050000-561f-8c3c-9650-235fafde896f	3210	Slovenske Konjice
00050000-561f-8c3c-8018-501ecc879d0c	1216	Smlednik
00050000-561f-8c3c-d496-ed89425a7338	5232	Soča
00050000-561f-8c3c-1d29-f902c181c0e9	1317	Sodražica
00050000-561f-8c3c-3dd9-3094031c1dae	3335	Solčava
00050000-561f-8c3c-96da-afdbb57b5a9b	5250	Solkan
00050000-561f-8c3c-a0e3-25a20bb63382	4229	Sorica
00050000-561f-8c3c-e590-1edf7586a643	4225	Sovodenj
00050000-561f-8c3c-89e6-5b35e0783cda	5281	Spodnja Idrija
00050000-561f-8c3c-f88b-16f844d58ff6	2241	Spodnji Duplek
00050000-561f-8c3c-b930-6ff0172c5a4a	9245	Spodnji Ivanjci
00050000-561f-8c3c-dd3c-10b695760e2d	2277	Središče ob Dravi
00050000-561f-8c3c-acb3-510eda63a81d	4267	Srednja vas v Bohinju
00050000-561f-8c3c-54aa-eb82dc117ae5	8256	Sromlje 
00050000-561f-8c3c-6416-dc959aba7524	5224	Srpenica
00050000-561f-8c3c-b45a-c343f409f5fb	1242	Stahovica
00050000-561f-8c3c-383b-ef1571703907	1332	Stara Cerkev
00050000-561f-8c3c-ade1-6f7f02cf083d	8342	Stari trg ob Kolpi
00050000-561f-8c3c-76d7-be844355f0c1	1386	Stari trg pri Ložu
00050000-561f-8c3c-bcbb-20454205d7fa	2205	Starše
00050000-561f-8c3c-74c6-8232deed8d97	2289	Stoperce
00050000-561f-8c3c-c6d4-beaff3349269	8322	Stopiče
00050000-561f-8c3c-74e3-7902e8c7e06b	3206	Stranice
00050000-561f-8c3c-a624-732b75e99ead	8351	Straža
00050000-561f-8c3c-a777-64954afdaffa	1313	Struge
00050000-561f-8c3c-b5dc-0a3b3e15a457	8293	Studenec
00050000-561f-8c3c-653f-2688aebfe121	8331	Suhor
00050000-561f-8c3c-03b0-0263e48ed307	2233	Sv. Ana v Slovenskih goricah
00050000-561f-8c3c-9caa-19050845de04	2235	Sv. Trojica v Slovenskih goricah
00050000-561f-8c3c-0fe1-e4d899e5e0be	2353	Sveti Duh na Ostrem Vrhu
00050000-561f-8c3c-4bca-2a53765b03f2	9244	Sveti Jurij ob Ščavnici
00050000-561f-8c3c-f066-a612e028fcf9	3264	Sveti Štefan
00050000-561f-8c3c-d755-a0f5eca11a00	2258	Sveti Tomaž
00050000-561f-8c3c-247b-c16c727db18c	9204	Šalovci
00050000-561f-8c3c-2085-a7e19a83801d	5261	Šempas
00050000-561f-8c3c-e82f-6573aa797b39	5290	Šempeter pri Gorici
00050000-561f-8c3c-2560-09bc4e519352	3311	Šempeter v Savinjski dolini
00050000-561f-8c3c-ec6c-940e4160063b	4208	Šenčur
00050000-561f-8c3c-00ed-b082ba288af1	2212	Šentilj v Slovenskih goricah
00050000-561f-8c3c-6be3-c1ef04986e37	8297	Šentjanž
00050000-561f-8c3c-4fe7-a756470097d3	2373	Šentjanž pri Dravogradu
00050000-561f-8c3c-61cf-8afc0462406e	8310	Šentjernej
00050000-561f-8c3c-357f-899faa47d23a	3230	Šentjur
00050000-561f-8c3c-5455-e38cd327ce97	3271	Šentrupert
00050000-561f-8c3c-681e-c55d482e15d7	8232	Šentrupert
00050000-561f-8c3c-a273-169eb3e98185	1296	Šentvid pri Stični
00050000-561f-8c3c-c167-4f831111b494	8275	Škocjan
00050000-561f-8c3c-a295-faaf99d490ab	6281	Škofije
00050000-561f-8c3c-052c-ff66b37fdb1f	4220	Škofja Loka
00050000-561f-8c3c-c73d-8522c0f33a56	3211	Škofja vas
00050000-561f-8c3c-4e1a-22d3ae9cbba0	1291	Škofljica
00050000-561f-8c3c-518f-6c749ff7bf7b	6274	Šmarje
00050000-561f-8c3c-c859-658a38b8b0d8	1293	Šmarje - Sap
00050000-561f-8c3c-3bcc-646469a881c6	3240	Šmarje pri Jelšah
00050000-561f-8c3c-a006-b213411d7df0	8220	Šmarješke Toplice
00050000-561f-8c3c-b04a-ae4270bf5ecd	2315	Šmartno na Pohorju
00050000-561f-8c3c-b054-de9ff360f4f8	3341	Šmartno ob Dreti
00050000-561f-8c3c-1803-c585a33ef144	3327	Šmartno ob Paki
00050000-561f-8c3c-6142-7555a77f6133	1275	Šmartno pri Litiji
00050000-561f-8c3c-5446-b5989ce5b87f	2383	Šmartno pri Slovenj Gradcu
00050000-561f-8c3c-dd18-3b35f5c17899	3201	Šmartno v Rožni dolini
00050000-561f-8c3c-cd13-edc12dd3d1ac	3325	Šoštanj
00050000-561f-8c3c-4e62-eeae694c8bd6	6222	Štanjel
00050000-561f-8c3c-f8b6-c62333dd2943	3220	Štore
00050000-561f-8c3c-d36d-6d6aaa8d18b3	3304	Tabor
00050000-561f-8c3c-5198-f8c29612fcee	3221	Teharje
00050000-561f-8c3c-4cf8-c5022f56a62b	9251	Tišina
00050000-561f-8c3c-af4a-7f1650704ed5	5220	Tolmin
00050000-561f-8c3c-1371-07eb31369afd	3326	Topolšica
00050000-561f-8c3c-0119-9262a3a5b490	2371	Trbonje
00050000-561f-8c3c-1bef-ab9a81350912	1420	Trbovlje
00050000-561f-8c3c-09b3-f6c750dd414e	8231	Trebelno 
00050000-561f-8c3c-f829-c769c62f6c8d	8210	Trebnje
00050000-561f-8c3c-2edc-0faa63f3cdec	5252	Trnovo pri Gorici
00050000-561f-8c3c-c246-7a2dfc3f146c	2254	Trnovska vas
00050000-561f-8c3c-e2da-84f43704cd71	1222	Trojane
00050000-561f-8c3c-93a4-656d96955dd8	1236	Trzin
00050000-561f-8c3c-e99a-360050a7a441	4290	Tržič
00050000-561f-8c3c-5d98-c5ddc298779d	8295	Tržišče
00050000-561f-8c3c-9a6b-3d61685c8a0d	1311	Turjak
00050000-561f-8c3c-8b0a-ab13f2e095e2	9224	Turnišče
00050000-561f-8c3c-c665-b6a651acdcfa	8323	Uršna sela
00050000-561f-8c3c-0c27-6664555aa750	1252	Vače
00050000-561f-8c3c-15a4-ec44b1a6ca4c	3320	Velenje 
00050000-561f-8c3c-289a-c85e0efe8547	3322	Velenje - poštni predali
00050000-561f-8c3c-fb25-920035155e14	8212	Velika Loka
00050000-561f-8c3c-67b8-a395022b2a1a	2274	Velika Nedelja
00050000-561f-8c3c-d14d-7356d690eee8	9225	Velika Polana
00050000-561f-8c3c-ea5c-89e98caf1275	1315	Velike Lašče
00050000-561f-8c3c-8618-33f8323e67c3	8213	Veliki Gaber
00050000-561f-8c3c-8cfa-b86919f26dbc	9241	Veržej
00050000-561f-8c3c-356f-3b11ca452504	1312	Videm - Dobrepolje
00050000-561f-8c3c-b671-39c2f69c78ef	2284	Videm pri Ptuju
00050000-561f-8c3c-27d5-3041042a8e73	8344	Vinica
00050000-561f-8c3c-9f59-8bebe4bd2905	5271	Vipava
00050000-561f-8c3c-1102-de045cad31d6	4212	Visoko
00050000-561f-8c3c-c522-4f616770d31f	1294	Višnja Gora
00050000-561f-8c3c-e342-3f5e021b773f	3205	Vitanje
00050000-561f-8c3c-d22f-af5c8ed57b07	2255	Vitomarci
00050000-561f-8c3c-7751-cbd38e9a0519	1217	Vodice
00050000-561f-8c3c-aef9-0e64a02bbbea	3212	Vojnik\t
00050000-561f-8c3c-f753-b88fd012c5ff	5293	Volčja Draga
00050000-561f-8c3c-3def-a26bdbf3fb35	2232	Voličina
00050000-561f-8c3c-444d-7d9679a7793d	3305	Vransko
00050000-561f-8c3c-27ea-aba77b54e772	6217	Vremski Britof
00050000-561f-8c3c-3b49-b4929e869d09	1360	Vrhnika
00050000-561f-8c3c-e1ec-6aad0d4f8c5f	2365	Vuhred
00050000-561f-8c3c-61f3-42f8d5ff626f	2367	Vuzenica
00050000-561f-8c3c-2e92-dbff3d14d959	8292	Zabukovje 
00050000-561f-8c3c-82d1-0178c6ffd618	1410	Zagorje ob Savi
00050000-561f-8c3c-8b2d-24529304d30f	1303	Zagradec
00050000-561f-8c3c-b06a-b1d65a347224	2283	Zavrč
00050000-561f-8c3c-d133-084f7cb46e18	8272	Zdole 
00050000-561f-8c3c-afcb-751302edbb66	4201	Zgornja Besnica
00050000-561f-8c3c-b9c2-4fbe5d9fb1df	2242	Zgornja Korena
00050000-561f-8c3c-48da-9d32df93cf51	2201	Zgornja Kungota
00050000-561f-8c3c-5b76-9b45816fd0f3	2316	Zgornja Ložnica
00050000-561f-8c3c-de17-b383810eeecb	2314	Zgornja Polskava
00050000-561f-8c3c-fa13-8941c8f96d7a	2213	Zgornja Velka
00050000-561f-8c3c-fa11-6c871a1b888c	4247	Zgornje Gorje
00050000-561f-8c3c-001f-2407d23320d4	4206	Zgornje Jezersko
00050000-561f-8c3c-7ac8-f8ea6c241a46	2285	Zgornji Leskovec
00050000-561f-8c3c-2dc9-5bacb1f92c3b	1432	Zidani Most
00050000-561f-8c3c-b6f8-809cf510571f	3214	Zreče
00050000-561f-8c3c-3803-7e4a01602795	4209	Žabnica
00050000-561f-8c3c-608b-538cd1bcb208	3310	Žalec
00050000-561f-8c3c-e72b-5690e63643d7	4228	Železniki
00050000-561f-8c3c-2460-baad9daac8c8	2287	Žetale
00050000-561f-8c3c-e78b-3c1f05b227d7	4226	Žiri
00050000-561f-8c3c-65da-32668b75c07b	4274	Žirovnica
00050000-561f-8c3c-659b-0f9b65678a49	8360	Žužemberk
\.


--
-- TOC entry 3069 (class 0 OID 22024435)
-- Dependencies: 233
-- Data for Name: postavkacdve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkacdve (id, skupina, podskupina, naziv, vrpremiere, vrponovitvepremier, vrponovitveprejsnjih, vrgostovanjazamejstvo, vrfestivali, vrgostovanjaint, vrostalo, programdela_id) FROM stdin;
\.


--
-- TOC entry 3042 (class 0 OID 22024028)
-- Dependencies: 206
-- Data for Name: postavkaracuna; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkaracuna (id, racun_id) FROM stdin;
\.


--
-- TOC entry 3023 (class 0 OID 22023808)
-- Dependencies: 187
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
00060000-561f-8c3f-d14a-9066dd790827	00080000-561f-8c3f-5183-ad706dbf9047	\N	00040000-561f-8c3c-6b14-ffbc619a9f47	Narodni dom	\N	Koroška 15	\N	9231	Beltinci	\N	f	t
00060000-561f-8c3f-dc9e-85030e051c27	00080000-561f-8c3f-5183-ad706dbf9047	\N	00040000-561f-8c3c-6b14-ffbc619a9f47	Korotan	\N	Koroška 22	\N	9231	Beltinci	\N	f	f
00060000-561f-8c3f-accd-ee175129a431	00080000-561f-8c3f-bc1a-63204ef2a5da	\N	00040000-561f-8c3c-6b14-ffbc619a9f47	Rimljan	\N	Rimska ploščad 7	\N	9231	Beltinci	\N	f	t
\.


--
-- TOC entry 3031 (class 0 OID 22023912)
-- Dependencies: 195
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, zaporedna, objavljenzacetek, porocilo) FROM stdin;
\.


--
-- TOC entry 3044 (class 0 OID 22024040)
-- Dependencies: 208
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 3070 (class 0 OID 22024449)
-- Dependencies: 234
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, koproducent_id, odstotekfinanciranja, delez, maticnikop, kpe, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 3071 (class 0 OID 22024459)
-- Dependencies: 235
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, sifra, status) FROM stdin;
00190000-561f-8c3f-8351-a4fc7d60321a	00080000-561f-8c3f-16a8-035129318d7c	0987	AK
00190000-561f-8c3f-5206-6e49b9033433	00080000-561f-8c3f-bc1a-63204ef2a5da	0989	AK
00190000-561f-8c3f-5ab9-fc23a6104649	00080000-561f-8c3f-4aaa-23d913742524	0986	AK
00190000-561f-8c3f-135c-f713b14f7ec5	00080000-561f-8c3f-5bae-886863f72226	0984	AK
00190000-561f-8c3f-2244-001bc29da52d	00080000-561f-8c3f-06a7-eeef87d1767d	0983	AK
00190000-561f-8c3f-4669-8adcf6582dee	00080000-561f-8c3f-f653-7f8f6781664b	0982	AK
00190000-561f-8c40-b5f8-eaf1ddabe482	00080000-561f-8c40-c6e6-7aa5f562b5c8	1001	AK
\.


--
-- TOC entry 3068 (class 0 OID 22024374)
-- Dependencies: 232
-- Data for Name: programdela; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programdela (id, sifra, naziv, zacetek, konec, zakljuceno, potrjenprogram, stpremier, stpremiervelikih, stpremiermalih, stpremiermalihkopr, stpremiervelikihkopr, stpremiersredkopr, stint, stfest, strazno, stizjem, stponprem, stponprej, stponprejvelikih, stponprejmalih, stponprejmalihkopr, stponprejsredkopr, stponprejvelikihkopr, stgostujo, vrps1, vrps1do, vrps1mat, vrps1gostovsz, stizvnekomerc, stizvprem, stizvpremdoma, stizvpremkopr, stizvponprem, stizvponpremdoma, stizvponpremzamejo, stizvponpremgost, stizvponpremkopr, stizvponpremint, stizvponpremkoprint, stizvponprej, stizvponprejdoma, stizvponprejzamejo, stizvponprejgost, stizvponprejkopr, stizvponprejint, stizvponprejkoprint, stizvgostuj, stizvostalihnek, stizvgostovanjslo, stizvgostovanjzam, stizvgostovanjint, stobisknekom, stobisknekommat, stobisknekomgostslo, stobisknekomgostzam, stobisknekomgostint, stobiskprem, stobiskpremdoma, stobiskpremkopr, stobiskponprem, stobiskponpremdoma, stobiskponpremkopr, stobiskponpremkoprint, stobiskponpremgost, stobiskponpremzamejo, stobiskponpremint, avgobiskprired, avgzaseddvoran, avgcenavstopnice, stprodvstopnic, stkoprodukcij, stkoprodukcijint, stkoprodukcijnvo, stzaposlenih, stzaposigralcev, avgstnastopovigr, sthonorarnihzun, sthonorarnihzunigr, sthonorarnihzunigrtujjz, sthonorarnihzunsamoz, sredstvaint, sredstvaavt, sredstvazaprosenoprem, sredstvazaprosenoponprem, sredstvazaprosenoponprej, sredstvazaprosenogostujo, sredstvazaprosenoint, sredstvazaprosenofest, sredstvazaprosenorazno, sredstvazaprosenoizjem, sredstvadrugijavniprem, sredstvadrugijavniponprem, sredstvadrugijavniponprej, sredstvadrugijavnigostujo, sredstvadrugijavniint, sredstvadrugijavnifest, sredstvadrugijavnirazno, sredstvadrugijavniizjem, sredstvadrugiviriprem, sredstvadrugiviriponprem, sredstvadrugiviriponprej, sredstvadrugivirigostujo, sredstvadrugiviriint, sredstvadrugivirifest, sredstvadrugivirirazno, sredstvadrugiviriizjem, sredstvaavtsamoz) FROM stdin;
00290000-561f-8c3f-3aca-2e5d797b0517	0001	Testni program dela	2016-02-01	2017-02-01	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 3072 (class 0 OID 22024467)
-- Dependencies: 236
-- Data for Name: programskaenotasklopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programskaenotasklopa (id, naslovpe, avtorpe, obsegpe, mesecpe, vrednostpe, obiskdoma, programrazno_id) FROM stdin;
\.


--
-- TOC entry 3048 (class 0 OID 22024069)
-- Dependencies: 212
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, popa_id, naslov_id, sifra, naziv, jeprizorisce, jematicnioder, seplanira, kapaciteta, opis) FROM stdin;
00220000-561f-8c3e-d6e7-f349d5f7375d	\N	\N	0001	Poskusna 1	f	\N	t	8	Poskusna učilnica v prvem
00220000-561f-8c3e-431a-9ff000f351cc	\N	\N	0002	Poskusna 3	f	\N	f	34	Poskusna učilnica v tretjem
00220000-561f-8c3e-6d1e-ae40411984f8	\N	\N	0003	Kazinska	t	\N	t	84	Kazinska dvorana
00220000-561f-8c3e-6236-f8e328d00704	\N	\N	0004	Mali oder	t	\N	t	24	Mali oder 
00220000-561f-8c3e-c302-f554f8cd1799	\N	\N	0005	Komorni oder	t	\N	t	150	Komorni oder
00220000-561f-8c3e-803b-bab9f57cc6e6	\N	\N	0006	Stara dvorana	t	\N	t	96	Stara dvorana ali dvorana Franceta Prešerna
00220000-561f-8c3e-f55f-b04fb790a8ee	\N	\N	0007	Velika dvorana	t	\N	t	160	Velika, glavna dvorana
\.


--
-- TOC entry 3040 (class 0 OID 22024013)
-- Dependencies: 204
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 3039 (class 0 OID 22024003)
-- Dependencies: 203
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 3061 (class 0 OID 22024213)
-- Dependencies: 225
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta, status) FROM stdin;
\.


--
-- TOC entry 3055 (class 0 OID 22024143)
-- Dependencies: 219
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 3029 (class 0 OID 22023886)
-- Dependencies: 193
-- Data for Name: report; Type: TABLE DATA; Schema: public; Owner: -
--

COPY report (id, job_id, title, filename, transfers, size, format, hash, createdat) FROM stdin;
\.


--
-- TOC entry 3011 (class 0 OID 22023670)
-- Dependencies: 175
-- Data for Name: revizije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY revizije (id, razred, objectid, upor, datum, tip, data) FROM stdin;
1	App\\Entity\\Popa	00080000-561f-8c40-c6e6-7aa5f562b5c8	00010000-561f-8c3d-e1d6-5691d1585fc5	2015-10-15 13:21:36	INS	a:0:{}
2	App\\Entity\\Option	00000000-561f-8c40-1858-4f599a805c41	00010000-561f-8c3d-e1d6-5691d1585fc5	2015-10-15 13:21:36	INS	a:0:{}
3	ProgramDela\\Entity\\ProdukcijskaHisa	00190000-561f-8c40-b5f8-eaf1ddabe482	00010000-561f-8c3d-e1d6-5691d1585fc5	2015-10-15 13:21:36	INS	a:0:{}
\.


--
-- TOC entry 3091 (class 0 OID 0)
-- Dependencies: 174
-- Name: revizije_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('revizije_id_seq', 3, true);


--
-- TOC entry 3049 (class 0 OID 22024082)
-- Dependencies: 213
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 3015 (class 0 OID 22023708)
-- Dependencies: 179
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-561f-8c3d-d5b1-016eb8bedb11	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-561f-8c3d-8705-ffa3e63a54a8	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-561f-8c3d-11a3-12ff2446c800	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-561f-8c3d-a6f1-af3084a8670d	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-561f-8c3d-1864-3309e2102719	planer	Planer dogodkov v koledarju	t
00020000-561f-8c3d-1701-0f200eac5896	kadrovska	Kadrovska služba	t
00020000-561f-8c3d-7be8-cf02849e1be2	arhivar	Ažuriranje arhivalij	t
00020000-561f-8c3d-c682-f81de0a0f20a	igralec	Igralec	t
00020000-561f-8c3d-6e98-647e00e2bb9b	prisotnost	Vnašalec prisotnosti, tudi za tiste izven uprizoritev	t
00020000-561f-8c3f-c1a1-7afebe2bf3b7	vsadovoljenja	Vloga z vsemi posameznimi dovoljenji	t
\.


--
-- TOC entry 3013 (class 0 OID 22023692)
-- Dependencies: 177
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-561f-8c3d-1343-051833467a06	00020000-561f-8c3d-11a3-12ff2446c800
00010000-561f-8c3d-e1d6-5691d1585fc5	00020000-561f-8c3d-11a3-12ff2446c800
00010000-561f-8c3f-595b-61f73d4d3e93	00020000-561f-8c3f-c1a1-7afebe2bf3b7
\.


--
-- TOC entry 3051 (class 0 OID 22024096)
-- Dependencies: 215
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 3043 (class 0 OID 22024034)
-- Dependencies: 207
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 3037 (class 0 OID 22023980)
-- Dependencies: 201
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, sifra, ime, zacetek, konec, aktivna) FROM stdin;
\.


--
-- TOC entry 3009 (class 0 OID 22023657)
-- Dependencies: 173
-- Data for Name: stevilcenje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenje (id, sifra, naziv, prefix, suffix, zacetek, dolzina, format, globalno, poletih) FROM stdin;
00230000-561f-8c3c-74b1-e504bb6a083b	pri	Privzeto številčenje po letih YYYY-N	\N	\N	1	1	%l-%n	f	t
00230000-561f-8c3c-803a-31a1a474a104	123	Privzeto številčenje kratkih šifer	\N	\N	100	3	%n	f	f
00230000-561f-8c3c-2db6-84223b2d4480	bcd	Globalno številčenje črtnih kod	\N	\N	1	9	%n	t	f
00230000-561f-8c3c-f58c-09248356b117	sif	Številčenje šifrant	\N	\N	1000	4	%n	f	f
00230000-561f-8c3c-65b0-f316d6bb0018	tmp	Globalno številčenje začasnih številk	tmp	\N	1000	5	%l%n	t	t
\.


--
-- TOC entry 3008 (class 0 OID 22023649)
-- Dependencies: 172
-- Data for Name: stevilcenjekonfig; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjekonfig (id, stevilcenje_id, dok) FROM stdin;
00240000-561f-8c3c-21cc-5d914c35e8c4	00230000-561f-8c3c-f58c-09248356b117	popa
00240000-561f-8c3c-bf18-dd5ed87e9994	00230000-561f-8c3c-f58c-09248356b117	oseba
00240000-561f-8c3c-b3c9-38f01149c69d	00230000-561f-8c3c-f58c-09248356b117	tippopa
00240000-561f-8c3c-b46f-827b2d72d251	00230000-561f-8c3c-f58c-09248356b117	sezona
00240000-561f-8c3c-ff1b-617ac053be10	00230000-561f-8c3c-803a-31a1a474a104	prostor
00240000-561f-8c3c-7918-59f97e9584be	00230000-561f-8c3c-f58c-09248356b117	besedilo
00240000-561f-8c3c-974f-cbc8c1a33902	00230000-561f-8c3c-f58c-09248356b117	uprizoritev
00240000-561f-8c3c-27f2-9f13d0b32add	00230000-561f-8c3c-f58c-09248356b117	funkcija
00240000-561f-8c3c-ad52-3ef7ee4b22a6	00230000-561f-8c3c-f58c-09248356b117	tipfunkcije
00240000-561f-8c3c-b812-e809123664b6	00230000-561f-8c3c-f58c-09248356b117	alternacija
00240000-561f-8c3c-7869-2ef99fd2cb6d	00230000-561f-8c3c-74b1-e504bb6a083b	pogodba
00240000-561f-8c3c-688f-42e4c2a2c97b	00230000-561f-8c3c-f58c-09248356b117	zaposlitev
00240000-561f-8c3c-1d39-6232a2566aef	00230000-561f-8c3c-f58c-09248356b117	zvrstuprizoritve
00240000-561f-8c3c-ed0f-1fb33c9e0225	00230000-561f-8c3c-74b1-e504bb6a083b	programdela
00240000-561f-8c3c-4615-d6fa7f38d05e	00230000-561f-8c3c-f58c-09248356b117	zapis
\.


--
-- TOC entry 3007 (class 0 OID 22023644)
-- Dependencies: 171
-- Data for Name: stevilcenjestanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjestanje (id, objid, leto, stevilka) FROM stdin;
dc6f033c-562d-494f-bc59-d79fa19b7cc5	00240000-561f-8c3c-21cc-5d914c35e8c4	0	1001
\.


--
-- TOC entry 3057 (class 0 OID 22024160)
-- Dependencies: 221
-- Data for Name: strosekuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY strosekuprizoritve (id, uprizoritev_id, popa_id, naziv, vrednostdo, vrednostna, opis, tipstroska, sort, vrstastroska_id) FROM stdin;
00270000-561f-8c3f-fd2b-d8c15f0a3587	000e0000-561f-8c3f-744b-1f82a926860e	00080000-561f-8c3f-5183-ad706dbf9047	Nabava kostumov	600.50	20.00	Krila in maske	materialni	1	003b0000-561f-8c3d-f243-91648259134a
00270000-561f-8c3f-ee9f-544078870be6	000e0000-561f-8c3f-744b-1f82a926860e	00080000-561f-8c3f-5183-ad706dbf9047	Zavese	125.70	3.10	Modra in zelena zavesa	materialni	2	003b0000-561f-8c3d-f243-91648259134a
\.


--
-- TOC entry 3021 (class 0 OID 22023780)
-- Dependencies: 185
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 3038 (class 0 OID 22023990)
-- Dependencies: 202
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja) FROM stdin;
001a0000-561f-8c3f-8e1a-c5de126da295	00180000-561f-8c3f-ec9c-893a3fce8e67	000c0000-561f-8c3f-93da-447da9413b5b	00090000-561f-8c3f-d616-9373788e2ebc	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-561f-8c3f-9f35-7b57a0b1bd9a	00180000-561f-8c3f-ec9c-893a3fce8e67	000c0000-561f-8c3f-a7c8-9199b7181423	00090000-561f-8c3f-fb32-6e91d24cb043	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-561f-8c3f-77a4-5adc3af4b522	00180000-561f-8c3f-ec9c-893a3fce8e67	000c0000-561f-8c3f-be8c-2d80a8009f8a	00090000-561f-8c3f-3ea2-c820da14d7e3	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-561f-8c3f-f5a2-9fa56e54b495	00180000-561f-8c3f-ec9c-893a3fce8e67	000c0000-561f-8c3f-4a7a-c10f77b65445	00090000-561f-8c3f-6a54-ed6136fde520	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-561f-8c3f-fe47-0ce7e6d677de	00180000-561f-8c3f-ec9c-893a3fce8e67	000c0000-561f-8c3f-aca9-4f7a590d9aff	00090000-561f-8c3f-11ab-5b6b7938249c	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-561f-8c3f-dd93-04451861aee9	00180000-561f-8c3f-d0d2-a798e2ea6599	\N	00090000-561f-8c3f-11ab-5b6b7938249c	2015-08-01 20:00:00	2015-08-01 23:00:00	\N	\N	2.00
\.


--
-- TOC entry 3060 (class 0 OID 22024201)
-- Dependencies: 224
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, sifra, ime, opis, imezenski, podrocje, sort) FROM stdin;
000f0000-561f-8c3c-f007-8eb526b4ac54	01	Avtor	Avtorji	Avtorka	umetnik	150
000f0000-561f-8c3c-cfe6-cdf5db46379e	02	Priredba	Priredba	Priredba	umetnik	160
000f0000-561f-8c3c-13b1-538244f93234	03	Prevod	Prevod	Prevod	umetnik	20
000f0000-561f-8c3c-cd90-14c194b898b9	04	Režija	Režija	Režija	umetnik	30
000f0000-561f-8c3c-c597-4bfa5320842d	05	Dramaturgija	Dramaturgija	Dramaturgija	umetnik	40
000f0000-561f-8c3c-a7fe-761336513e61	06	Scenografija	Scenografija	Scenografija	umetnik	60
000f0000-561f-8c3c-b76e-4433c662502c	07	Kostumografija	Kostumografija	Kostumografija	umetnik	70
000f0000-561f-8c3c-b8d9-7be0e9708cf0	08	Koreografija	Koreografija	Koreografija	umetnik	90
000f0000-561f-8c3c-40aa-d20fcc9f79c6	09	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	umetnik	100
000f0000-561f-8c3c-946f-2ed341ffcd01	10	Oblikovanje maske	Oblikovanje maske	Oblikovanje maske	umetnik	110
000f0000-561f-8c3c-1726-755f152c6f4f	11	Lektorstvo	Lektorstvo	Lektorstvo	umetnik	50
000f0000-561f-8c3c-da01-04c5b620975e	12	Glasbeni soustvarjalec	Glasbeni soustvarjalci	Glasbena soustvarjalka	umetnik	80
000f0000-561f-8c3c-92fb-22b055662dbe	13	Intermedijski ustvarjalec	Intermedijski ustvarjalci	Intermedijski ustvarjalka	umetnik	130
000f0000-561f-8c3c-49e0-dd34d2517656	14	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	umetnik	120
000f0000-561f-8c3c-a877-4bf56a64e216	15	Vloga	Intermedijski ustvarjalci	Intermedijska ustvarjalka	igralec	10
000f0000-561f-8c3c-134b-b7ac84fdcd5f	16	Produkcija, mentorstvo	Produkcija, mentorstvo	Produkcija, mentorstvo	umetnik	140
000f0000-561f-8c3c-3836-8c3f5067f63f	17	Tehnična podpora	Tehnična podpora	Tehnična podpora	tehnik	180
000f0000-561f-8c3c-02b8-2b5ed69cd877	18	Inšpicient	Inšpicienti	Inšpicientka	inspicient	170
\.


--
-- TOC entry 3018 (class 0 OID 22023734)
-- Dependencies: 182
-- Data for Name: tippopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tippopa (id, sifra, ime, opis) FROM stdin;
00400000-561f-8c3e-291c-b4db9fb62597	0001	šola	osnovna ali srednja šola
00400000-561f-8c3e-7134-0a54c8453663	0002	gledalec	gledalec, ki ima abonma ali podobno
00400000-561f-8c3e-5149-7b2601684f78	0003	sponzor	sponzor dogodkov
\.


--
-- TOC entry 3073 (class 0 OID 22024478)
-- Dependencies: 237
-- Data for Name: tipprogramskeenote; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipprogramskeenote (id, sifra, naziv, koprodukcija, maxfaktor, maxvsi) FROM stdin;
002b0000-561f-8c3c-a457-21c86f720a7f	01	Velika predstava	f	1.00	1.00
002b0000-561f-8c3c-0853-bf758933f6fa	02	Mala predstava	f	0.50	0.50
002b0000-561f-8c3c-99e7-dcc3a3087a39	03	Mala koprodukcija	t	0.40	1.00
002b0000-561f-8c3c-eea4-56f3b18a3d89	04	Srednja koprodukcija	t	0.70	2.00
002b0000-561f-8c3c-17b5-614254a430b1	05	Velika koprodukcija	t	1.00	3.00
\.


--
-- TOC entry 3026 (class 0 OID 22023843)
-- Dependencies: 190
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 3012 (class 0 OID 22023679)
-- Dependencies: 176
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-561f-8c3d-e1d6-5691d1585fc5	Konzolni	$2y$05$NS4xMjkyMTcwMzExMjAxROHRZWbdhetC.CTrwAEsVPzp.31PXPv0.	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-561f-8c3f-18e2-4fda0889ff97	testni uporabnik za inšpicienta	$2y$05$NS4xMjkyMTcwMzExMjAxROxkJ1B6xAXex6EZLIwJfWzRJ8DpfecFO	t	\N	\N	\N	ivo@ifigenija.si	\N	\N	\N
00010000-561f-8c3f-014f-08c40cbe27b9	testni uporabnik za Tehničnega vodjo	$2y$05$NS4xMjkyMTcwMzExMjAxROu/kXWR9sP9oamkesKuxXLbxkCb387.G	t	\N	\N	\N	tona@ifigenija.si	\N	\N	\N
00010000-561f-8c3f-3a1a-d2097caf2430	testni uporabnik za igralca	$2y$05$NS4xMjkyMTcwMzExMjAxRO/hLCgClfERRsfCAFYwxNCcFIVjP2982	t	\N	\N	\N	irena@ifigenija.si	\N	\N	\N
00010000-561f-8c3f-4301-e7751a65154e	testni uporabnik vnašalca termina storitev (TerminStoritve-vse)	$2y$05$NS4xMjkyMTcwMzExMjAxROT6.kTHqEq4.wa2SOnf124/N14m9qeP.	t	\N	\N	\N	tatjana@ifigenija.si	\N	\N	\N
00010000-561f-8c3f-aae7-60b96ea9fc2f	testni uporabnik, ki je inšpicient brez zapisov v TerminStoritve	$2y$05$NS4xMjkyMTcwMzExMjAxROHau47Dtb7CME5.nlWwBVM.nusFP.ra2	t	\N	\N	\N	joze@ifigenija.si	\N	\N	\N
00010000-561f-8c3f-42cb-5926f4dd5bb2	testna uporabnica, ki je planerka	$2y$05$NS4xMjkyMTcwMzExMjAxRO.B/uJO3C7QRNhdX9Q2hTLQsSupj1V1S	t	\N	\N	\N	petra@ifigenija.si	\N	\N	\N
00010000-561f-8c3f-73f6-ac39fd0a3dd5	testni uporabnik, ki dobi ifi-all vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROv2d7jqhaV/Mz3EIsKoi7UoFR.SDSMBm	t	\N	\N	\N	ali@ifigenija.si	\N	\N	\N
00010000-561f-8c3f-977a-76d7a91160cb	testni uporabnik, ki dobi ifi-readall vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROYB9g.gnkufr1l/gWK6mkx.ySqrOWnJC	t	\N	\N	\N	berta@ifigenija.si	\N	\N	\N
00010000-561f-8c3f-e271-9c32faf6db6e	testni uporabnik, ki dobi aaa-write dovoljenje	$2y$05$NS4xMjkyMTcwMzExMjAxRORujYObKX.DzpXVYbePkiJkHqg0/Ylya	t	\N	\N	\N	aaron@ifigenija.si	\N	\N	\N
00010000-561f-8c3f-595b-61f73d4d3e93	testni uporabnik ki dobi vsa posamezna dovoljenja	$2y$05$NS4xMjkyMTcwMzExMjAxRO2ymwxVXTr7U4Ncdn.bN49E8rLw9Jg0O	t	\N	\N	\N	vesna@ifigenija.si	\N	\N	\N
00010000-561f-8c3d-1343-051833467a06	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 3064 (class 0 OID 22024251)
-- Dependencies: 228
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, producent_id, sifra, faza, naslov, podnaslov, delovninaslov, internacionalninaslov, naslovizvirnika, podnaslovizvirnika, datumzacstudija, stevilovaj, planiranostevilovaj, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, krstna, prvaslovenska, kratkinaslov, jekoprodukcija, maticnioder_id) FROM stdin;
000e0000-561f-8c3f-e68e-7afe62b40c63	00160000-561f-8c3e-42ad-2ab4d964f75d	\N	00140000-561f-8c3c-3866-6d0d18dc1d0c	\N	0001	produkcija	Sen kresne noči		Sanje	\N	\N	\N	2016-02-01	\N	\N	2016-06-01	1	William  Shakespeare - Nebojša  Kavader	f	2				\N	f	\N	\N		\N	00220000-561f-8c3e-c302-f554f8cd1799
000e0000-561f-8c3f-744b-1f82a926860e	00160000-561f-8c3e-af3a-bc7c13a643c0	\N	00140000-561f-8c3c-8b9d-b37de02654cc	\N	0002	predprodukcija-ideja	Smoletov vrt			\N	\N	\N	2016-01-01	\N	\N	2016-04-20	2	Berta   Hočevar	f	2				\N	f	\N	\N		\N	00220000-561f-8c3e-803b-bab9f57cc6e6
000e0000-561f-8c3f-5941-2b9f154b0776	\N	\N	00140000-561f-8c3c-8b9d-b37de02654cc	00190000-561f-8c3f-8351-a4fc7d60321a	0003	postprodukcija	Kisli maček			\N	\N	\N	2016-02-01	\N	\N	2016-04-20	2	\N	t	2				\N	f	\N	\N		\N	00220000-561f-8c3e-c302-f554f8cd1799
000e0000-561f-8c3f-e8f5-be2d0a4e17e0	\N	\N	00140000-561f-8c3c-8b9d-b37de02654cc	00190000-561f-8c3f-8351-a4fc7d60321a	0004	postprodukcija	Vladimir			\N	\N	\N	2017-03-01	\N	\N	2017-04-20	2	\N	t	2				\N	f	\N	\N		\N	00220000-561f-8c3e-c302-f554f8cd1799
000e0000-561f-8c3f-381e-a1f320ed563b	\N	\N	00140000-561f-8c3c-8b9d-b37de02654cc	00190000-561f-8c3f-8351-a4fc7d60321a	0005	postprodukcija	Španska princesa			\N	\N	\N	2017-04-01	\N	\N	2017-05-20	1	\N	f	1				\N	f	\N	\N		\N	00220000-561f-8c3e-d6e7-f349d5f7375d
000e0000-561f-8c3f-787c-2f8c3ac4e738	\N	\N	00140000-561f-8c3c-8b9d-b37de02654cc	00190000-561f-8c3f-8351-a4fc7d60321a	0006	postprodukcija	Ne vemo datumov			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-561f-8c3e-d6e7-f349d5f7375d
\.


--
-- TOC entry 3033 (class 0 OID 22023934)
-- Dependencies: 197
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, uprizoritev_id, vrsta, zaporedna, porocilo) FROM stdin;
00200000-561f-8c3f-9a78-f286f793944b	000e0000-561f-8c3f-744b-1f82a926860e	\N	1	
00200000-561f-8c3f-5fc2-4e1feac01141	000e0000-561f-8c3f-744b-1f82a926860e	\N	2	
00200000-561f-8c3f-f398-28c252acb93f	000e0000-561f-8c3f-744b-1f82a926860e	\N	3	
00200000-561f-8c3f-ac89-183dcbee9a28	000e0000-561f-8c3f-744b-1f82a926860e	\N	4	
00200000-561f-8c3f-b03e-6714cd79b48c	000e0000-561f-8c3f-744b-1f82a926860e	\N	5	
\.


--
-- TOC entry 3047 (class 0 OID 22024061)
-- Dependencies: 211
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 3058 (class 0 OID 22024174)
-- Dependencies: 222
-- Data for Name: vrstastroska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstastroska (id, skupina, podskupina, naziv, opis) FROM stdin;
003b0000-561f-8c3d-bef2-6fc2df663e36	1	0	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE
003b0000-561f-8c3d-4d80-4f89589c1b3f	1	1	Storitve varovanja zgradb in prostorov	storitve varovanja zgradb in prostorov (npr. gasilci na predstavah)
003b0000-561f-8c3d-5de5-034a9fa73ef8	1	2	Založniške in tiskarske storitve	založniške in tiskarske storitve
003b0000-561f-8c3d-4303-2b43dc883083	1	3	Časopisi, revije, knjige in strokovna literatura	časopisi, revije, knjige in strokovna literatura
003b0000-561f-8c3d-5d48-d61cdf4afc91	1	4	Stroški prevajalskih storitev	stroški prevajalskih storitev
003b0000-561f-8c3d-b234-05d9638b60a6	1	5	Stroški oglaševalskih storitev	stroški oglaševalskih storitev
003b0000-561f-8c3d-a8c2-271c362ac5d3	1	6	Izdatki za reprezentanco	izdatki za reprezentanco
003b0000-561f-8c3d-1bf4-c9171e65a217	2	0	POSEBNI MATERIAL IN STORITVE	POSEBNI MATERIAL IN STORITVE
003b0000-561f-8c3d-f243-91648259134a	2	1	Drugi posebni material in storitve	drugi posebni material in storitve (npr. za instrumete - navedite)
003b0000-561f-8c3d-7bea-e344270d7572	2	2	Oprema predstave – stroški rekvizitov	Oprema predstave – stroški rekvizitov
003b0000-561f-8c3d-e1da-d683a751aa3f	2	3	Oprema predstave – stroški kostumov	Oprema predstave – stroški kostumov
003b0000-561f-8c3d-ddde-91827c419314	2	4	Oprema predstave – stroški scenske opreme	Oprema predstave – stroški scenske opreme
003b0000-561f-8c3d-1af3-62bb47260621	2	5	Oprema predstave – stroški avdio in video opreme	Oprema predstave – stroški avdio in video opreme
003b0000-561f-8c3d-8a11-828e750ece05	3	0	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE
003b0000-561f-8c3d-4615-3438de993916	3	1	Poštnina in kurirske storitve	poštnina in kurirske storitve
003b0000-561f-8c3d-7d6d-d9c25ee9f9ec	4	0	PREVOZNI STROŠKI IN STORITVE	PREVOZNI STROŠKI IN STORITVE
003b0000-561f-8c3d-c0ea-02b714fd2dde	4	1	Goriva in maziva za prevozna sredstva	goriva in maziva za prevozna sredstva
003b0000-561f-8c3d-864a-5be34ebb8f56	4	2	Najem vozil in selitveni stroški	najem vozil in selitveni stroški
003b0000-561f-8c3d-d597-b207aaa6164e	4	3	Drugi prevozni in transportni stroški 	drugi prevozni in transportni stroški (navedite)
003b0000-561f-8c3d-b98f-5b412b60c80e	5	0	IZDATKI ZA SLUŽBENA POTOVANJA	IZDATKI ZA SLUŽBENA POTOVANJA
003b0000-561f-8c3d-5cb9-8ef1bf919471	5	1	Dnevnice za službena potovanja v državi in tujini	dnevnice za službena potovanja v državi in tujini
003b0000-561f-8c3d-0ed2-de161f8bc4b0	5	2	Hotelske in restavra. storitve v državi in tujini	hotelske in restavra. storitve v državi in tujini
003b0000-561f-8c3d-59d9-e66cba3b1c9a	5	3	Stroški prevoza v državi in tujini	stroški prevoza v državi in tujini
003b0000-561f-8c3d-2f2c-0e405a2fb0d6	5	4	Drugi izdatki za službena potovanja	drugi izdatki za službena potovanja (navedite)
003b0000-561f-8c3d-04da-6e8e2c1d1071	6	0	NAJEMNINE IN ZAKUPNINE	NAJEMNINE IN ZAKUPNINE
003b0000-561f-8c3d-c1b3-920fc8c60a92	6	1	Druge najemnine, zakupnine in licenčnine	druge najemnine, zakupnine in licenčnine (npr. najem notnega materiala, instrumentov - navedite)
003b0000-561f-8c3d-89c0-d2051041321f	7	0	DRUGI OPERATIVNI ODHODKI	DRUGI OPERATIVNI ODHODKI
003b0000-561f-8c3d-2ef9-116c3507f5c9	7	1	Izdatki za strok. izobraževanje zap.	izdatki za strok. izobraževanje zap.(vezani na program. enote)  
\.


--
-- TOC entry 3076 (class 0 OID 22024525)
-- Dependencies: 240
-- Data for Name: vrstazapisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstazapisa (id, oznaka, naziv, aktiven, znacka, ikona, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3075 (class 0 OID 22024497)
-- Dependencies: 239
-- Data for Name: zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapis (id, vrsta_id, datoteka_id, mapa_id, avtor_id, zaklenil_id, tip, zaklenjen, datumzaklepanja, identifier, subject, title, description, coverage, creator, language, date, publisher, relation, rights, source, upor, datknj, standard, lokacija) FROM stdin;
\.


--
-- TOC entry 3077 (class 0 OID 22024537)
-- Dependencies: 241
-- Data for Name: zapislastnik; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapislastnik (id, zapis_id, lastnik, classlastnika, datum, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3054 (class 0 OID 22024133)
-- Dependencies: 218
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, sifra, status, delovnomesto, zacetek, konec, tip, delovnaobveza, malica, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci) FROM stdin;
00100000-561f-8c3f-1040-6385e25a4b2f	00090000-561f-8c3f-fb32-6e91d24cb043	0010	A	Mojster	2010-02-01	\N	1	2		t	f	f	t
00100000-561f-8c3f-2ddd-ab314b03529f	00090000-561f-8c3f-3ea2-c820da14d7e3	0003	A	Igralec	2010-02-01	\N	1	2		t	f	f	t
00100000-561f-8c3f-c51b-1918f4ae437b	00090000-561f-8c3f-bdee-cf4adbbe2e43	0008	A	Natakar	2010-02-01	\N	1	2		t	f	f	t
00100000-561f-8c3f-e809-7b4a79175ff4	00090000-561f-8c3f-d0ab-0fc8c8b05116	0004	A	Mizar	2010-02-01	\N	1	2		t	f	f	t
00100000-561f-8c3f-8232-d2e6eafe214d	00090000-561f-8c3f-d616-9373788e2ebc	0009	A	Šivilja	2010-02-01	\N	1	2		t	f	f	t
00100000-561f-8c3f-3806-67ec17d5a119	00090000-561f-8c3f-6052-6d005cc9f118	0007	A	Inšpicient	2010-02-01	\N	1	2		t	f	f	t
\.


--
-- TOC entry 3035 (class 0 OID 22023969)
-- Dependencies: 199
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id, oseba_id) FROM stdin;
\.


--
-- TOC entry 3063 (class 0 OID 22024241)
-- Dependencies: 227
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, sifra, naziv, opis) FROM stdin;
00140000-561f-8c3c-3866-6d0d18dc1d0c	01	Drama	drama (SURS 01)
00140000-561f-8c3c-e890-12c84ed79cad	02	Opera	opera (SURS 02)
00140000-561f-8c3c-48a5-dec3d0a0183f	03	Balet	balet (SURS 03)
00140000-561f-8c3c-7038-765d32e4713c	04	Plesne prireditve	plesne prireditve (SURS 04)
00140000-561f-8c3c-2568-49455a693156	05	Lutkovno gledališče	lutkovno gledališče (SURS 05)
00140000-561f-8c3c-8b9d-b37de02654cc	06	Raziskovalno gledališče	raziskovalno gledališče (SURS 06)
00140000-561f-8c3c-036b-ca1bb7fe92a8	07	Drugo	drugo (SURS 07)
\.


--
-- TOC entry 3053 (class 0 OID 22024123)
-- Dependencies: 217
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, sifra, naziv, opis) FROM stdin;
\.


--
-- TOC entry 2533 (class 2606 OID 22023733)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2730 (class 2606 OID 22024300)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2726 (class 2606 OID 22024290)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2689 (class 2606 OID 22024157)
-- Name: avtorbesedila_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT avtorbesedila_pkey PRIMARY KEY (id);


--
-- TOC entry 2700 (class 2606 OID 22024199)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2787 (class 2606 OID 22024577)
-- Name: datoteka_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT datoteka_pkey PRIMARY KEY (id);


--
-- TOC entry 2601 (class 2606 OID 22023958)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2616 (class 2606 OID 22023979)
-- Name: dogodeksplosni_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodeksplosni
    ADD CONSTRAINT dogodeksplosni_pkey PRIMARY KEY (id);


--
-- TOC entry 2763 (class 2606 OID 22024495)
-- Name: drugivir_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT drugivir_pkey PRIMARY KEY (id);


--
-- TOC entry 2572 (class 2606 OID 22023869)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2737 (class 2606 OID 22024368)
-- Name: enotaprograma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT enotaprograma_pkey PRIMARY KEY (id);


--
-- TOC entry 2674 (class 2606 OID 22024119)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2595 (class 2606 OID 22023932)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2589 (class 2606 OID 22023907)
-- Name: job_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY job
    ADD CONSTRAINT job_pkey PRIMARY KEY (id);


--
-- TOC entry 2580 (class 2606 OID 22023883)
-- Name: kontaktnaoseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT kontaktnaoseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2638 (class 2606 OID 22024026)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2781 (class 2606 OID 22024554)
-- Name: mapa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT mapa_pkey PRIMARY KEY (id);


--
-- TOC entry 2785 (class 2606 OID 22024561)
-- Name: mapa_zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT mapa_zapis_pkey PRIMARY KEY (mapa_id, zapis_id);


--
-- TOC entry 2792 (class 2606 OID 22024585)
-- Name: mapaacl_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT mapaacl_pkey PRIMARY KEY (id);


--
-- TOC entry 2505 (class 2606 OID 21932911)
-- Name: migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY migrations
    ADD CONSTRAINT migrations_pkey PRIMARY KEY (version);


--
-- TOC entry 2650 (class 2606 OID 22024053)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2565 (class 2606 OID 22023841)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2541 (class 2606 OID 22023752)
-- Name: optionvalue_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT optionvalue_pkey PRIMARY KEY (id);


--
-- TOC entry 2544 (class 2606 OID 22023776)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2531 (class 2606 OID 22023722)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2524 (class 2606 OID 22023707)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2653 (class 2606 OID 22024059)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2667 (class 2606 OID 22024095)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2712 (class 2606 OID 22024236)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2554 (class 2606 OID 22023804)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2562 (class 2606 OID 22023829)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2747 (class 2606 OID 22024447)
-- Name: postavkacdve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkacdve
    ADD CONSTRAINT postavkacdve_pkey PRIMARY KEY (id);


--
-- TOC entry 2642 (class 2606 OID 22024032)
-- Name: postavkaracuna_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT postavkaracuna_pkey PRIMARY KEY (id);


--
-- TOC entry 2560 (class 2606 OID 22023819)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2593 (class 2606 OID 22023920)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2648 (class 2606 OID 22024044)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2751 (class 2606 OID 22024456)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2753 (class 2606 OID 22024464)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2744 (class 2606 OID 22024434)
-- Name: programdela_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT programdela_pkey PRIMARY KEY (id);


--
-- TOC entry 2758 (class 2606 OID 22024476)
-- Name: programskaenotasklopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT programskaenotasklopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2660 (class 2606 OID 22024077)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2636 (class 2606 OID 22024017)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2630 (class 2606 OID 22024008)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2707 (class 2606 OID 22024223)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2687 (class 2606 OID 22024150)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2583 (class 2606 OID 22023895)
-- Name: report_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY report
    ADD CONSTRAINT report_pkey PRIMARY KEY (id);


--
-- TOC entry 2516 (class 2606 OID 22023678)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2665 (class 2606 OID 22024086)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2522 (class 2606 OID 22023696)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2526 (class 2606 OID 22023716)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2672 (class 2606 OID 22024104)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2644 (class 2606 OID 22024039)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2618 (class 2606 OID 22023988)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2513 (class 2606 OID 22023666)
-- Name: stevilcenje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenje
    ADD CONSTRAINT stevilcenje_pkey PRIMARY KEY (id);


--
-- TOC entry 2510 (class 2606 OID 22023654)
-- Name: stevilcenjekonfig_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT stevilcenjekonfig_pkey PRIMARY KEY (id);


--
-- TOC entry 2507 (class 2606 OID 22023648)
-- Name: stevilcenjestanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjestanje
    ADD CONSTRAINT stevilcenjestanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2696 (class 2606 OID 22024170)
-- Name: strosekuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT strosekuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2550 (class 2606 OID 22023785)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2624 (class 2606 OID 22023999)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2703 (class 2606 OID 22024210)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2535 (class 2606 OID 22023741)
-- Name: tippopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tippopa
    ADD CONSTRAINT tippopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2760 (class 2606 OID 22024488)
-- Name: tipprogramskeenote_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipprogramskeenote
    ADD CONSTRAINT tipprogramskeenote_pkey PRIMARY KEY (id);


--
-- TOC entry 2570 (class 2606 OID 22023854)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2518 (class 2606 OID 22023691)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2724 (class 2606 OID 22024269)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2599 (class 2606 OID 22023942)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2656 (class 2606 OID 22024067)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2698 (class 2606 OID 22024182)
-- Name: vrstastroska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstastroska
    ADD CONSTRAINT vrstastroska_pkey PRIMARY KEY (id);


--
-- TOC entry 2774 (class 2606 OID 22024535)
-- Name: vrstazapisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstazapisa
    ADD CONSTRAINT vrstazapisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2771 (class 2606 OID 22024519)
-- Name: zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT zapis_pkey PRIMARY KEY (id);


--
-- TOC entry 2777 (class 2606 OID 22024543)
-- Name: zapislastnik_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT zapislastnik_pkey PRIMARY KEY (id);


--
-- TOC entry 2683 (class 2606 OID 22024141)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2614 (class 2606 OID 22023973)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2716 (class 2606 OID 22024249)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2680 (class 2606 OID 22024131)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2602 (class 1259 OID 22023967)
-- Name: dogodki_konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_konec ON dogodek USING btree (konec);


--
-- TOC entry 2603 (class 1259 OID 22023968)
-- Name: dogodki_razred; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_razred ON dogodek USING btree (razred);


--
-- TOC entry 2604 (class 1259 OID 22023966)
-- Name: dogodki_zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2605 (class 1259 OID 22023965)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2606 (class 1259 OID 22023964)
-- Name: idx_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2692 (class 1259 OID 22024171)
-- Name: idx_11ffe6e05c75296c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e05c75296c ON strosekuprizoritve USING btree (vrstastroska_id);


--
-- TOC entry 2693 (class 1259 OID 22024172)
-- Name: idx_11ffe6e062b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e062b4ffca ON strosekuprizoritve USING btree (uprizoritev_id);


--
-- TOC entry 2694 (class 1259 OID 22024173)
-- Name: idx_11ffe6e06beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e06beede51 ON strosekuprizoritve USING btree (popa_id);


--
-- TOC entry 2778 (class 1259 OID 22024556)
-- Name: idx_14a5d6d3727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d3727aca70 ON mapa USING btree (parent_id);


--
-- TOC entry 2779 (class 1259 OID 22024555)
-- Name: idx_14a5d6d38a4a6c12; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d38a4a6c12 ON mapa USING btree (lastnik_id);


--
-- TOC entry 2551 (class 1259 OID 22023806)
-- Name: idx_1c7adba589552cb2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba589552cb2 ON popa USING btree (tipkli_id);


--
-- TOC entry 2552 (class 1259 OID 22023807)
-- Name: idx_1c7adba5ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba5ee4b985a ON popa USING btree (drzava_id);


--
-- TOC entry 2651 (class 1259 OID 22024060)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2765 (class 1259 OID 22024523)
-- Name: idx_1ed92829253c4123; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829253c4123 ON zapis USING btree (avtor_id);


--
-- TOC entry 2766 (class 1259 OID 22024522)
-- Name: idx_1ed9282957ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282957ed422f ON zapis USING btree (mapa_id);


--
-- TOC entry 2767 (class 1259 OID 22024524)
-- Name: idx_1ed9282987ff3295; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282987ff3295 ON zapis USING btree (zaklenil_id);


--
-- TOC entry 2768 (class 1259 OID 22024521)
-- Name: idx_1ed92829a54dbb1f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829a54dbb1f ON zapis USING btree (datoteka_id);


--
-- TOC entry 2769 (class 1259 OID 22024520)
-- Name: idx_1ed92829ef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829ef943358 ON zapis USING btree (vrsta_id);


--
-- TOC entry 2645 (class 1259 OID 22024046)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2646 (class 1259 OID 22024045)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2597 (class 1259 OID 22023943)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2675 (class 1259 OID 22024120)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2676 (class 1259 OID 22024122)
-- Name: idx_23aeb9586b361365; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9586b361365 ON funkcija USING btree (tipfunkcije_id);


--
-- TOC entry 2677 (class 1259 OID 22024121)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2577 (class 1259 OID 22023885)
-- Name: idx_2942b10710389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b10710389148 ON kontaktnaoseba USING btree (oseba_id);


--
-- TOC entry 2578 (class 1259 OID 22023884)
-- Name: idx_2942b1076beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b1076beede51 ON kontaktnaoseba USING btree (popa_id);


--
-- TOC entry 2756 (class 1259 OID 22024477)
-- Name: idx_2d901816d6bc69d6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2d901816d6bc69d6 ON programskaenotasklopa USING btree (programrazno_id);


--
-- TOC entry 2708 (class 1259 OID 22024238)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2709 (class 1259 OID 22024239)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2710 (class 1259 OID 22024240)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2775 (class 1259 OID 22024544)
-- Name: idx_2eaff9dcaf91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2eaff9dcaf91ecd ON zapislastnik USING btree (zapis_id);


--
-- TOC entry 2717 (class 1259 OID 22024274)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2718 (class 1259 OID 22024271)
-- Name: idx_344a77a7c3b0d59; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a7c3b0d59 ON uprizoritev USING btree (maticnioder_id);


--
-- TOC entry 2719 (class 1259 OID 22024275)
-- Name: idx_344a77a853a965c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a853a965c ON uprizoritev USING btree (producent_id);


--
-- TOC entry 2720 (class 1259 OID 22024273)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2721 (class 1259 OID 22024272)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2567 (class 1259 OID 22023856)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2568 (class 1259 OID 22023855)
-- Name: idx_37f6541a6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a6beede51 ON trr USING btree (popa_id);


--
-- TOC entry 2542 (class 1259 OID 22023779)
-- Name: idx_466966d769e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_466966d769e8d4 ON oseba USING btree (naslov_id);


--
-- TOC entry 2663 (class 1259 OID 22024087)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2528 (class 1259 OID 22023723)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2529 (class 1259 OID 22023724)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2668 (class 1259 OID 22024107)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2669 (class 1259 OID 22024106)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2670 (class 1259 OID 22024105)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2590 (class 1259 OID 22023921)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2591 (class 1259 OID 22023922)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2508 (class 1259 OID 22023656)
-- Name: idx_6054e804ff55f926; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_6054e804ff55f926 ON stevilcenjekonfig USING btree (stevilcenje_id);


--
-- TOC entry 2625 (class 1259 OID 22024012)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2626 (class 1259 OID 22024010)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2627 (class 1259 OID 22024009)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2628 (class 1259 OID 22024011)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2519 (class 1259 OID 22023697)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2520 (class 1259 OID 22023698)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2654 (class 1259 OID 22024068)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2788 (class 1259 OID 22024578)
-- Name: idx_781826c67e3c61f9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_781826c67e3c61f9 ON datoteka USING btree (owner_id);


--
-- TOC entry 2690 (class 1259 OID 22024159)
-- Name: idx_7ab77b7910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7ab77b7910389148 ON avtorbesedila USING btree (oseba_id);


--
-- TOC entry 2691 (class 1259 OID 22024158)
-- Name: idx_7ab77b79f35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7ab77b79f35157b1 ON avtorbesedila USING btree (besedilo_id);


--
-- TOC entry 2789 (class 1259 OID 22024586)
-- Name: idx_7adc957157ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc957157ed422f ON mapaacl USING btree (mapa_id);


--
-- TOC entry 2790 (class 1259 OID 22024587)
-- Name: idx_7adc9571fa6311ef; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc9571fa6311ef ON mapaacl USING btree (perm_id);


--
-- TOC entry 2640 (class 1259 OID 22024033)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2684 (class 1259 OID 22024151)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2685 (class 1259 OID 22024152)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2738 (class 1259 OID 22024373)
-- Name: idx_8787a0e54ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e54ae1cd1c ON enotaprograma USING btree (gostitelj_id);


--
-- TOC entry 2739 (class 1259 OID 22024372)
-- Name: idx_8787a0e55d0da56c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e55d0da56c ON enotaprograma USING btree (drzavagostovanja_id);


--
-- TOC entry 2740 (class 1259 OID 22024369)
-- Name: idx_8787a0e562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e562b4ffca ON enotaprograma USING btree (uprizoritev_id);


--
-- TOC entry 2741 (class 1259 OID 22024370)
-- Name: idx_8787a0e57222d84b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e57222d84b ON enotaprograma USING btree (tipprogramskeenote_id);


--
-- TOC entry 2742 (class 1259 OID 22024371)
-- Name: idx_8787a0e5771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e5771ec7bd ON enotaprograma USING btree (program_dela_id);


--
-- TOC entry 2556 (class 1259 OID 22023821)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2557 (class 1259 OID 22023820)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2558 (class 1259 OID 22023822)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2657 (class 1259 OID 22024081)
-- Name: idx_952dd21969e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd21969e8d4 ON prostor USING btree (naslov_id);


--
-- TOC entry 2658 (class 1259 OID 22024080)
-- Name: idx_952dd2196beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd2196beede51 ON prostor USING btree (popa_id);


--
-- TOC entry 2748 (class 1259 OID 22024457)
-- Name: idx_97af082e38c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e38c06eb ON produkcijadelitev USING btree (enotaprograma_id);


--
-- TOC entry 2749 (class 1259 OID 22024458)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2731 (class 1259 OID 22024304)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2732 (class 1259 OID 22024305)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2733 (class 1259 OID 22024302)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2734 (class 1259 OID 22024303)
-- Name: idx_a4b7244fa4976613; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fa4976613 ON alternacija USING btree (zaposlitev_id);


--
-- TOC entry 2681 (class 1259 OID 22024142)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2631 (class 1259 OID 22024021)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2632 (class 1259 OID 22024020)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2633 (class 1259 OID 22024018)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2634 (class 1259 OID 22024019)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2727 (class 1259 OID 22024292)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2728 (class 1259 OID 22024291)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2581 (class 1259 OID 22023896)
-- Name: idx_c38372b2be04ea9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c38372b2be04ea9 ON report USING btree (job_id);


--
-- TOC entry 2584 (class 1259 OID 22023910)
-- Name: idx_c395a6181bb9e62c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a6181bb9e62c ON job USING btree (datum);


--
-- TOC entry 2585 (class 1259 OID 22023909)
-- Name: idx_c395a618941027cc; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618941027cc ON job USING btree (casizvedbe);


--
-- TOC entry 2586 (class 1259 OID 22023908)
-- Name: idx_c395a618a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618a76ed395 ON job USING btree (user_id);


--
-- TOC entry 2587 (class 1259 OID 22023911)
-- Name: idx_c395a618aecf5af0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618aecf5af0 ON job USING btree (izveden);


--
-- TOC entry 2596 (class 1259 OID 22023933)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2745 (class 1259 OID 22024448)
-- Name: idx_dba42fe79e3adf2c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_dba42fe79e3adf2c ON postavkacdve USING btree (programdela_id);


--
-- TOC entry 2764 (class 1259 OID 22024496)
-- Name: idx_e7d4cf2638c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e7d4cf2638c06eb ON drugivir USING btree (enotaprograma_id);


--
-- TOC entry 2782 (class 1259 OID 22024562)
-- Name: idx_e9f8ee8257ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee8257ed422f ON mapa_zapis USING btree (mapa_id);


--
-- TOC entry 2783 (class 1259 OID 22024563)
-- Name: idx_e9f8ee82af91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee82af91ecd ON mapa_zapis USING btree (zapis_id);


--
-- TOC entry 2538 (class 1259 OID 22023754)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2539 (class 1259 OID 22023753)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2547 (class 1259 OID 22023786)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2548 (class 1259 OID 22023787)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2612 (class 1259 OID 22023974)
-- Name: idx_f44a386d10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_f44a386d10389148 ON zasedenost USING btree (oseba_id);


--
-- TOC entry 2620 (class 1259 OID 22024002)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2621 (class 1259 OID 22024001)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2622 (class 1259 OID 22024000)
-- Name: idx_fef7d84ba81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84ba81ccef6 ON terminstoritve USING btree (dogodek_id);


--
-- TOC entry 2607 (class 1259 OID 22023960)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2608 (class 1259 OID 22023961)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2609 (class 1259 OID 22023959)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2610 (class 1259 OID 22023963)
-- Name: uniq_11e93b5dbbc7a989; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dbbc7a989 ON dogodek USING btree (dogodek_splosni_id);


--
-- TOC entry 2611 (class 1259 OID 22023962)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2555 (class 1259 OID 22023805)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2536 (class 1259 OID 22023742)
-- Name: uniq_1d30700559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1d30700559828a3 ON tippopa USING btree (sifra);


--
-- TOC entry 2537 (class 1259 OID 22023743)
-- Name: uniq_1d3070055cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1d3070055cca980 ON tippopa USING btree (ime);


--
-- TOC entry 2573 (class 1259 OID 22023870)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2574 (class 1259 OID 22023872)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2575 (class 1259 OID 22023871)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2576 (class 1259 OID 22023873)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2639 (class 1259 OID 22024027)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2713 (class 1259 OID 22024237)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2722 (class 1259 OID 22024270)
-- Name: uniq_344a77a559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_344a77a559828a3 ON uprizoritev USING btree (sifra);


--
-- TOC entry 2704 (class 1259 OID 22024211)
-- Name: uniq_3f50510d559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d559828a3 ON tipfunkcije USING btree (sifra);


--
-- TOC entry 2705 (class 1259 OID 22024212)
-- Name: uniq_3f50510d55cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d55cca980 ON tipfunkcije USING btree (ime);


--
-- TOC entry 2545 (class 1259 OID 22023777)
-- Name: uniq_466966d7559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7559828a3 ON oseba USING btree (sifra);


--
-- TOC entry 2546 (class 1259 OID 22023778)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2678 (class 1259 OID 22024132)
-- Name: uniq_5216fcb0559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5216fcb0559828a3 ON zvrstuprizoritve USING btree (sifra);


--
-- TOC entry 2514 (class 1259 OID 22023667)
-- Name: uniq_5a434fbc559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5a434fbc559828a3 ON stevilcenje USING btree (sifra);


--
-- TOC entry 2566 (class 1259 OID 22023842)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2511 (class 1259 OID 22023655)
-- Name: uniq_6054e804889a7556; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_6054e804889a7556 ON stevilcenjekonfig USING btree (dok);


--
-- TOC entry 2761 (class 1259 OID 22024489)
-- Name: uniq_7d834df4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_7d834df4559828a3 ON tipprogramskeenote USING btree (sifra);


--
-- TOC entry 2661 (class 1259 OID 22024079)
-- Name: uniq_952dd21937854736; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21937854736 ON prostor USING btree (naziv);


--
-- TOC entry 2662 (class 1259 OID 22024078)
-- Name: uniq_952dd219559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd219559828a3 ON prostor USING btree (sifra);


--
-- TOC entry 2735 (class 1259 OID 22024301)
-- Name: uniq_a4b7244f559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a4b7244f559828a3 ON alternacija USING btree (sifra);


--
-- TOC entry 2563 (class 1259 OID 22023830)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2714 (class 1259 OID 22024250)
-- Name: uniq_cede8e36559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_cede8e36559828a3 ON zvrstsurs USING btree (sifra);


--
-- TOC entry 2772 (class 1259 OID 22024536)
-- Name: uniq_de1c8aa1d55226c7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_de1c8aa1d55226c7 ON vrstazapisa USING btree (oznaka);


--
-- TOC entry 2754 (class 1259 OID 22024465)
-- Name: uniq_e6fc2028559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc2028559828a3 ON produkcijskahisa USING btree (sifra);


--
-- TOC entry 2755 (class 1259 OID 22024466)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2701 (class 1259 OID 22024200)
-- Name: uniq_ec773670ca2e5fcb; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ec773670ca2e5fcb ON besedilo USING btree (stevilka);


--
-- TOC entry 2619 (class 1259 OID 22023989)
-- Name: uniq_ecc8f8c5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ecc8f8c5559828a3 ON sezona USING btree (sifra);


--
-- TOC entry 2527 (class 1259 OID 22023717)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2824 (class 2606 OID 22024723)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2823 (class 2606 OID 22024728)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2819 (class 2606 OID 22024748)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2825 (class 2606 OID 22024718)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2821 (class 2606 OID 22024738)
-- Name: fk_11e93b5dbbc7a989; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dbbc7a989 FOREIGN KEY (dogodek_splosni_id) REFERENCES dogodeksplosni(id);


--
-- TOC entry 2820 (class 2606 OID 22024743)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2822 (class 2606 OID 22024733)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2860 (class 2606 OID 22024913)
-- Name: fk_11ffe6e05c75296c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e05c75296c FOREIGN KEY (vrstastroska_id) REFERENCES vrstastroska(id);


--
-- TOC entry 2859 (class 2606 OID 22024918)
-- Name: fk_11ffe6e062b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e062b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2858 (class 2606 OID 22024923)
-- Name: fk_11ffe6e06beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e06beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2892 (class 2606 OID 22025088)
-- Name: fk_14a5d6d3727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d3727aca70 FOREIGN KEY (parent_id) REFERENCES mapa(id);


--
-- TOC entry 2893 (class 2606 OID 22025083)
-- Name: fk_14a5d6d38a4a6c12; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d38a4a6c12 FOREIGN KEY (lastnik_id) REFERENCES uporabniki(id);


--
-- TOC entry 2805 (class 2606 OID 22024643)
-- Name: fk_1c7adba589552cb2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba589552cb2 FOREIGN KEY (tipkli_id) REFERENCES tippopa(id);


--
-- TOC entry 2804 (class 2606 OID 22024648)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2842 (class 2606 OID 22024833)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2887 (class 2606 OID 22025068)
-- Name: fk_1ed92829253c4123; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829253c4123 FOREIGN KEY (avtor_id) REFERENCES uporabniki(id);


--
-- TOC entry 2888 (class 2606 OID 22025063)
-- Name: fk_1ed9282957ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282957ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2886 (class 2606 OID 22025073)
-- Name: fk_1ed9282987ff3295; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282987ff3295 FOREIGN KEY (zaklenil_id) REFERENCES uporabniki(id);


--
-- TOC entry 2889 (class 2606 OID 22025058)
-- Name: fk_1ed92829a54dbb1f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829a54dbb1f FOREIGN KEY (datoteka_id) REFERENCES datoteka(id);


--
-- TOC entry 2890 (class 2606 OID 22025053)
-- Name: fk_1ed92829ef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829ef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstazapisa(id);


--
-- TOC entry 2840 (class 2606 OID 22024828)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2841 (class 2606 OID 22024823)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2818 (class 2606 OID 22024713)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2852 (class 2606 OID 22024873)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2850 (class 2606 OID 22024883)
-- Name: fk_23aeb9586b361365; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9586b361365 FOREIGN KEY (tipfunkcije_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2851 (class 2606 OID 22024878)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2811 (class 2606 OID 22024683)
-- Name: fk_2942b10710389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b10710389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2812 (class 2606 OID 22024678)
-- Name: fk_2942b1076beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b1076beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2838 (class 2606 OID 22024813)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2884 (class 2606 OID 22025043)
-- Name: fk_2d901816d6bc69d6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT fk_2d901816d6bc69d6 FOREIGN KEY (programrazno_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2863 (class 2606 OID 22024928)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2862 (class 2606 OID 22024933)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2861 (class 2606 OID 22024938)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 2891 (class 2606 OID 22025078)
-- Name: fk_2eaff9dcaf91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT fk_2eaff9dcaf91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id);


--
-- TOC entry 2865 (class 2606 OID 22024958)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2868 (class 2606 OID 22024943)
-- Name: fk_344a77a7c3b0d59; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a7c3b0d59 FOREIGN KEY (maticnioder_id) REFERENCES prostor(id);


--
-- TOC entry 2864 (class 2606 OID 22024963)
-- Name: fk_344a77a853a965c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a853a965c FOREIGN KEY (producent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2866 (class 2606 OID 22024953)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2867 (class 2606 OID 22024948)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2809 (class 2606 OID 22024673)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2810 (class 2606 OID 22024668)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2800 (class 2606 OID 22024628)
-- Name: fk_466966d769e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d769e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2801 (class 2606 OID 22024623)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2846 (class 2606 OID 22024853)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2797 (class 2606 OID 22024603)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2796 (class 2606 OID 22024608)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2847 (class 2606 OID 22024868)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2848 (class 2606 OID 22024863)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2849 (class 2606 OID 22024858)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2816 (class 2606 OID 22024698)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2815 (class 2606 OID 22024703)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2793 (class 2606 OID 22024588)
-- Name: fk_6054e804ff55f926; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT fk_6054e804ff55f926 FOREIGN KEY (stevilcenje_id) REFERENCES stevilcenje(id);


--
-- TOC entry 2830 (class 2606 OID 22024788)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2832 (class 2606 OID 22024778)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2833 (class 2606 OID 22024773)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2831 (class 2606 OID 22024783)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2795 (class 2606 OID 22024593)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2794 (class 2606 OID 22024598)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2843 (class 2606 OID 22024838)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2896 (class 2606 OID 22025103)
-- Name: fk_781826c67e3c61f9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT fk_781826c67e3c61f9 FOREIGN KEY (owner_id) REFERENCES uporabniki(id);


--
-- TOC entry 2856 (class 2606 OID 22024908)
-- Name: fk_7ab77b7910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT fk_7ab77b7910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2857 (class 2606 OID 22024903)
-- Name: fk_7ab77b79f35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT fk_7ab77b79f35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2898 (class 2606 OID 22025108)
-- Name: fk_7adc957157ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc957157ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2897 (class 2606 OID 22025113)
-- Name: fk_7adc9571fa6311ef; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc9571fa6311ef FOREIGN KEY (perm_id) REFERENCES permission(id);


--
-- TOC entry 2839 (class 2606 OID 22024818)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2855 (class 2606 OID 22024893)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2854 (class 2606 OID 22024898)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2875 (class 2606 OID 22025018)
-- Name: fk_8787a0e54ae1cd1c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e54ae1cd1c FOREIGN KEY (gostitelj_id) REFERENCES popa(id);


--
-- TOC entry 2876 (class 2606 OID 22025013)
-- Name: fk_8787a0e55d0da56c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e55d0da56c FOREIGN KEY (drzavagostovanja_id) REFERENCES drza(id);


--
-- TOC entry 2879 (class 2606 OID 22024998)
-- Name: fk_8787a0e562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2878 (class 2606 OID 22025003)
-- Name: fk_8787a0e57222d84b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e57222d84b FOREIGN KEY (tipprogramskeenote_id) REFERENCES tipprogramskeenote(id);


--
-- TOC entry 2877 (class 2606 OID 22025008)
-- Name: fk_8787a0e5771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e5771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2807 (class 2606 OID 22024658)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2808 (class 2606 OID 22024653)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2806 (class 2606 OID 22024663)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2844 (class 2606 OID 22024848)
-- Name: fk_952dd21969e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd21969e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2845 (class 2606 OID 22024843)
-- Name: fk_952dd2196beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd2196beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2882 (class 2606 OID 22025028)
-- Name: fk_97af082e38c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e38c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2881 (class 2606 OID 22025033)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2872 (class 2606 OID 22024988)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2871 (class 2606 OID 22024993)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2874 (class 2606 OID 22024978)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 2873 (class 2606 OID 22024983)
-- Name: fk_a4b7244fa4976613; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fa4976613 FOREIGN KEY (zaposlitev_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2853 (class 2606 OID 22024888)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2834 (class 2606 OID 22024808)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2835 (class 2606 OID 22024803)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2837 (class 2606 OID 22024793)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2836 (class 2606 OID 22024798)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2869 (class 2606 OID 22024973)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2870 (class 2606 OID 22024968)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2813 (class 2606 OID 22024688)
-- Name: fk_c38372b2be04ea9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY report
    ADD CONSTRAINT fk_c38372b2be04ea9 FOREIGN KEY (job_id) REFERENCES job(id);


--
-- TOC entry 2814 (class 2606 OID 22024693)
-- Name: fk_c395a618a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY job
    ADD CONSTRAINT fk_c395a618a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2817 (class 2606 OID 22024708)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2880 (class 2606 OID 22025023)
-- Name: fk_dba42fe79e3adf2c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkacdve
    ADD CONSTRAINT fk_dba42fe79e3adf2c FOREIGN KEY (programdela_id) REFERENCES programdela(id);


--
-- TOC entry 2883 (class 2606 OID 22025038)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2885 (class 2606 OID 22025048)
-- Name: fk_e7d4cf2638c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT fk_e7d4cf2638c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2895 (class 2606 OID 22025093)
-- Name: fk_e9f8ee8257ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee8257ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id) ON DELETE CASCADE;


--
-- TOC entry 2894 (class 2606 OID 22025098)
-- Name: fk_e9f8ee82af91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee82af91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id) ON DELETE CASCADE;


--
-- TOC entry 2798 (class 2606 OID 22024618)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2799 (class 2606 OID 22024613)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2803 (class 2606 OID 22024633)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2802 (class 2606 OID 22024638)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2826 (class 2606 OID 22024753)
-- Name: fk_f44a386d10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT fk_f44a386d10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2827 (class 2606 OID 22024768)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2828 (class 2606 OID 22024763)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2829 (class 2606 OID 22024758)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- Completed on 2015-10-15 13:21:39 CEST

--
-- PostgreSQL database dump complete
--

