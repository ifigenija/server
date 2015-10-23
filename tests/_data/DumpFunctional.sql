--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.10
-- Dumped by pg_dump version 9.3.10
-- Started on 2015-10-23 15:52:46 CEST

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
-- TOC entry 180 (class 1259 OID 23279492)
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
-- TOC entry 233 (class 1259 OID 23280100)
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
-- TOC entry 232 (class 1259 OID 23280083)
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
-- TOC entry 223 (class 1259 OID 23279960)
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
-- TOC entry 226 (class 1259 OID 23279990)
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
-- TOC entry 247 (class 1259 OID 23280371)
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
-- TOC entry 200 (class 1259 OID 23279740)
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
-- TOC entry 202 (class 1259 OID 23279771)
-- Name: dogodeksplosni; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodeksplosni (
    id uuid NOT NULL
);


--
-- TOC entry 241 (class 1259 OID 23280297)
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
-- TOC entry 191 (class 1259 OID 23279637)
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
-- TOC entry 234 (class 1259 OID 23280113)
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
-- TOC entry 219 (class 1259 OID 23279914)
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
-- TOC entry 197 (class 1259 OID 23279711)
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
-- TOC entry 194 (class 1259 OID 23279677)
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
-- TOC entry 192 (class 1259 OID 23279654)
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
-- TOC entry 208 (class 1259 OID 23279828)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 245 (class 1259 OID 23280352)
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
-- TOC entry 246 (class 1259 OID 23280364)
-- Name: mapa_zapis; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE mapa_zapis (
    mapa_id uuid NOT NULL,
    zapis_id uuid NOT NULL
);


--
-- TOC entry 248 (class 1259 OID 23280386)
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
-- TOC entry 212 (class 1259 OID 23279853)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 189 (class 1259 OID 23279611)
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
-- TOC entry 182 (class 1259 OID 23279511)
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
-- TOC entry 186 (class 1259 OID 23279578)
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
-- TOC entry 183 (class 1259 OID 23279522)
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
-- TOC entry 177 (class 1259 OID 23279466)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 179 (class 1259 OID 23279485)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 213 (class 1259 OID 23279860)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 217 (class 1259 OID 23279894)
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
-- TOC entry 229 (class 1259 OID 23280031)
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
-- TOC entry 185 (class 1259 OID 23279558)
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
-- TOC entry 188 (class 1259 OID 23279603)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 236 (class 1259 OID 23280242)
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
-- TOC entry 209 (class 1259 OID 23279834)
-- Name: postavkaracuna; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE postavkaracuna (
    id uuid NOT NULL,
    racun_id uuid
);


--
-- TOC entry 187 (class 1259 OID 23279588)
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
-- TOC entry 199 (class 1259 OID 23279732)
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
-- TOC entry 195 (class 1259 OID 23279692)
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
-- TOC entry 196 (class 1259 OID 23279704)
-- Name: predstava_abonma; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE predstava_abonma (
    predstava_id uuid NOT NULL,
    abonma_id uuid NOT NULL
);


--
-- TOC entry 211 (class 1259 OID 23279846)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 237 (class 1259 OID 23280256)
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
-- TOC entry 238 (class 1259 OID 23280266)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    sifra character varying(4) NOT NULL,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 235 (class 1259 OID 23280181)
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
-- TOC entry 239 (class 1259 OID 23280274)
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
-- TOC entry 215 (class 1259 OID 23279875)
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
-- TOC entry 207 (class 1259 OID 23279819)
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
-- TOC entry 206 (class 1259 OID 23279809)
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
-- TOC entry 228 (class 1259 OID 23280020)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying,
    status character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 222 (class 1259 OID 23279950)
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
-- TOC entry 193 (class 1259 OID 23279666)
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
-- TOC entry 174 (class 1259 OID 23279437)
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
-- TOC entry 173 (class 1259 OID 23279435)
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
-- TOC entry 216 (class 1259 OID 23279888)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 178 (class 1259 OID 23279475)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 176 (class 1259 OID 23279459)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 218 (class 1259 OID 23279902)
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
-- TOC entry 210 (class 1259 OID 23279840)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 204 (class 1259 OID 23279786)
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
-- TOC entry 172 (class 1259 OID 23279424)
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
-- TOC entry 171 (class 1259 OID 23279416)
-- Name: stevilcenjekonfig; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjekonfig (
    id uuid NOT NULL,
    stevilcenje_id uuid,
    dok character varying(100) DEFAULT NULL::character varying
);


--
-- TOC entry 170 (class 1259 OID 23279411)
-- Name: stevilcenjestanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjestanje (
    id uuid NOT NULL,
    objid uuid NOT NULL,
    leto integer NOT NULL,
    stevilka integer
);


--
-- TOC entry 224 (class 1259 OID 23279967)
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
-- TOC entry 184 (class 1259 OID 23279550)
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
-- TOC entry 205 (class 1259 OID 23279796)
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
-- TOC entry 227 (class 1259 OID 23280008)
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
-- TOC entry 181 (class 1259 OID 23279501)
-- Name: tippopa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tippopa (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    ime character varying(255) NOT NULL,
    opis text
);


--
-- TOC entry 240 (class 1259 OID 23280285)
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
-- TOC entry 203 (class 1259 OID 23279776)
-- Name: tipvaje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tipvaje (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    ime character varying(255) NOT NULL,
    opis text
);


--
-- TOC entry 190 (class 1259 OID 23279623)
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
-- TOC entry 175 (class 1259 OID 23279446)
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
-- TOC entry 231 (class 1259 OID 23280058)
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
-- TOC entry 198 (class 1259 OID 23279722)
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
-- TOC entry 214 (class 1259 OID 23279867)
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
-- TOC entry 225 (class 1259 OID 23279981)
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
-- TOC entry 243 (class 1259 OID 23280332)
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
-- TOC entry 242 (class 1259 OID 23280304)
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
-- TOC entry 244 (class 1259 OID 23280344)
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
-- TOC entry 221 (class 1259 OID 23279939)
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
-- TOC entry 201 (class 1259 OID 23279765)
-- Name: zasedenost; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zasedenost (
    id uuid NOT NULL,
    oseba_id uuid
);


--
-- TOC entry 230 (class 1259 OID 23280048)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 220 (class 1259 OID 23279929)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 2220 (class 2604 OID 23279440)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 3058 (class 0 OID 23279492)
-- Dependencies: 180
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
000a0000-562a-3bab-a95d-d34bd7b35052	10	30	Otroci	Abonma za otroke	200
000a0000-562a-3bab-f27f-c2693fd706be	20	60	Mladina	Abonma za mladino	400
000a0000-562a-3bab-4f5c-7307065be978	15	50	Odrasli	Abonma za odrasle	300
\.


--
-- TOC entry 3111 (class 0 OID 23280100)
-- Dependencies: 233
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, zaposlitev_id, oseba_id, pogodba_id, sifra, zaposlen, zacetek, konec, opomba, sort, privzeti, aktivna, imapogodbo, pomembna) FROM stdin;
000c0000-562a-3bab-46de-9e13b6951b33	000d0000-562a-3bab-0f2b-0f53d10f5ee3	\N	00090000-562a-3bab-a7d8-44b67216ad11	000b0000-562a-3bab-ed82-e368b32362f3	0001	f	\N	\N	\N	3	t	\N	t	t
000c0000-562a-3bab-a33f-31bf7c3fdb4d	000d0000-562a-3bab-2091-badc3246d75e	00100000-562a-3bab-ff40-572357732239	00090000-562a-3bab-831a-c2df7a9f3edf	\N	0002	t	2016-01-01	\N	\N	8	t	\N	f	f
000c0000-562a-3bab-c9cc-263b40deb7b2	000d0000-562a-3bab-3b12-3f40b5b4af7a	00100000-562a-3bab-61b3-6b5a9aec1e44	00090000-562a-3bab-45de-3779d095fa1a	\N	0003	t	\N	2015-10-23	\N	2	t	\N	f	f
000c0000-562a-3bab-8cb6-b912d79d64b0	000d0000-562a-3bab-c9fa-b07690825a6e	\N	00090000-562a-3bab-b739-9f53c6028ad4	\N	0004	f	2016-01-01	2016-01-01	\N	26	t	\N	f	f
000c0000-562a-3bab-8652-36eda5bc3fc8	000d0000-562a-3bab-2277-85d11cd87f9a	\N	00090000-562a-3bab-ce9f-9e9209f4c3cd	\N	0005	f	2016-01-01	2016-01-01	\N	7	t	\N	f	f
000c0000-562a-3bab-9df6-a31c4c4b1d10	000d0000-562a-3bab-9cbe-aba9acbd070c	\N	00090000-562a-3bab-d7fb-679ed7f64087	000b0000-562a-3bab-85e3-d4517198cb76	0006	f	2016-01-01	2016-01-01	\N	1	t	\N	t	t
000c0000-562a-3bab-d02a-1028f79a1eaa	000d0000-562a-3bab-201a-f57c204ab728	00100000-562a-3bab-1963-aa94b8d0082b	00090000-562a-3bab-8021-ece1706e4277	\N	0007	t	2016-01-01	2016-01-01	\N	14	t	\N	f	t
000c0000-562a-3bab-aeab-1cb5e6b2994c	000d0000-562a-3bab-dccb-e8f5ac199da0	\N	00090000-562a-3bab-910a-3f663709275c	000b0000-562a-3bab-3131-27388264d2a7	0008	f	2016-01-01	2016-01-01	\N	12	t	\N	t	t
000c0000-562a-3bab-86b8-9188c213a994	000d0000-562a-3bab-201a-f57c204ab728	00100000-562a-3bab-ef43-3b51e2cddacb	00090000-562a-3bab-9d4e-e4c21b018c8d	\N	0009	t	2017-01-01	2017-01-01	\N	15	t	\N	f	t
000c0000-562a-3bab-31c5-8a701196afd3	000d0000-562a-3bab-201a-f57c204ab728	00100000-562a-3bab-c017-fbd4406de18e	00090000-562a-3bab-62b0-e0570d283c7e	\N	0010	t	\N	2015-10-23	\N	16	f	\N	f	t
000c0000-562a-3bab-f7d8-90bef6aadf8c	000d0000-562a-3bab-201a-f57c204ab728	00100000-562a-3bab-5a4c-2476c900ccf1	00090000-562a-3bab-e377-6caa98a729a4	\N	0011	t	2017-01-01	\N	\N	17	f	\N	f	t
000c0000-562a-3bab-9319-8f89a8f166fb	000d0000-562a-3bab-5469-9cb08362b6e7	\N	00090000-562a-3bab-831a-c2df7a9f3edf	000b0000-562a-3bab-5771-3a3fdd7bbfce	0012	f	\N	\N	\N	2	t	\N	t	t
\.


--
-- TOC entry 3110 (class 0 OID 23280083)
-- Dependencies: 232
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 3101 (class 0 OID 23279960)
-- Dependencies: 223
-- Data for Name: avtorbesedila; Type: TABLE DATA; Schema: public; Owner: -
--

COPY avtorbesedila (id, besedilo_id, oseba_id, tipavtorja, zaporedna, alivnaslovu) FROM stdin;
003d0000-562a-3bab-a642-eae51d50e83f	00160000-562a-3bab-b0c4-b2c9b780ed86	00090000-562a-3bab-e3a7-e13e32e6111b	aizv	10	t
003d0000-562a-3bab-4b8f-8af0e82186d3	00160000-562a-3bab-b0c4-b2c9b780ed86	00090000-562a-3bab-4639-a4651a1a7811	apri	14	t
003d0000-562a-3bab-c809-9e264e430cc8	00160000-562a-3bab-a434-a734e24aec31	00090000-562a-3bab-d932-b9f03635cc35	aizv	11	t
003d0000-562a-3bab-48ec-1e018b4132bc	00160000-562a-3bab-ae8f-fa270edd0dea	00090000-562a-3bab-06db-c5602adf3176	aizv	12	t
003d0000-562a-3bab-d496-2e80dcfa1f5c	00160000-562a-3bab-b0c4-b2c9b780ed86	00090000-562a-3bab-d4c5-e221d4e2b119	apri	18	f
\.


--
-- TOC entry 3104 (class 0 OID 23279990)
-- Dependencies: 226
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, stevilka, naslov, podnaslov, jezik, naslovizvirnika, podnaslovizvirnika, internacionalninaslov, datumprejema, moskevloge, zenskevloge, povzetekvsebine, letoizida, krajizida, zaloznik, avtor) FROM stdin;
00160000-562a-3bab-b0c4-b2c9b780ed86	0001	Sen kresne noči		slovenščina	A Midsummer Night's Dream	\N	\N	2015-04-26	5	5	Nastopajo Titanija, Hipolita, Oberon, ...	\N	\N	\N	William  Shakespeare - Nebojša  Kavader
00160000-562a-3bab-a434-a734e24aec31	0002	Bratje Karamazovi		slovenščina	Bratja Karamazjovji	\N	\N	2015-12-04	4	1	Svetovna uspešnica	\N	\N	\N	Fjodor Mihajlovič Dostojevski
00160000-562a-3bab-ae8f-fa270edd0dea	0003	Smoletov Vrt		slovenščina		\N	\N	2015-05-26	2	8		\N	\N	\N	Berta   Hočevar
\.


--
-- TOC entry 3125 (class 0 OID 23280371)
-- Dependencies: 247
-- Data for Name: datoteka; Type: TABLE DATA; Schema: public; Owner: -
--

COPY datoteka (id, owner_id, filename, transfers, size, format, hash, createdat, uploadedat, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3078 (class 0 OID 23279740)
-- Dependencies: 200
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_splosni_id, prostor_id, sezona_id, allday, zacetek, konec, status, razred, termin, title) FROM stdin;
00180000-562a-3bab-995e-f6767b7e6988	\N	\N	00200000-562a-3bab-4a3c-872419f03dbb	\N	\N	\N	\N	f	2015-06-26 10:00:00	2015-06-26 12:00:00	200s	200s		dogodek 1
00180000-562a-3bab-1f87-647fc549e20b	\N	\N	00200000-562a-3bab-8984-0fa2140a3592	\N	\N	\N	\N	f	2015-06-27 10:00:00	2015-06-27 12:00:00	300s	200s		dogodek 2
00180000-562a-3bab-8640-483d891991fd	\N	\N	00200000-562a-3bab-fa2a-8329f826aa2b	\N	\N	\N	\N	f	2015-08-01 20:00:00	2015-08-01 23:00:00	400s	200s		dogodek 3
00180000-562a-3bab-fc35-2e87ed990a6c	\N	\N	00200000-562a-3bab-b81b-99b726b14ae8	\N	\N	\N	\N	f	2015-08-01 20:00:00	2015-08-01 23:00:00	100s	200s		dogodek 4
00180000-562a-3bab-17d5-dc15974e7959	\N	\N	00200000-562a-3bab-5553-ba7aaada1617	\N	\N	\N	\N	f	2015-08-01 20:00:00	2015-08-01 23:00:00	500s	200s		dogodek 5
\.


--
-- TOC entry 3080 (class 0 OID 23279771)
-- Dependencies: 202
-- Data for Name: dogodeksplosni; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodeksplosni (id) FROM stdin;
\.


--
-- TOC entry 3119 (class 0 OID 23280297)
-- Dependencies: 241
-- Data for Name: drugivir; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drugivir (id, znesek, opis, mednarodni, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 3069 (class 0 OID 23279637)
-- Dependencies: 191
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-562a-3ba9-a98d-3b1b31855a2d	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-562a-3ba9-59fc-378c6abbb413	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-562a-3ba9-8da9-d40abf849a72	AL	ALB	008	Albania 	Albanija	\N
00040000-562a-3ba9-edd8-1185a5040014	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-562a-3ba9-05bb-ccee48f74107	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-562a-3ba9-76a8-1a101d57dae4	AD	AND	020	Andorra 	Andora	\N
00040000-562a-3ba9-c841-ef49dc5bda08	AO	AGO	024	Angola 	Angola	\N
00040000-562a-3ba9-a234-1747050feef0	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-562a-3ba9-0a53-c6313acc0d50	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-562a-3ba9-c709-4273469169c0	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-562a-3ba9-fa7a-67dd0dfa9358	AR	ARG	032	Argentina 	Argenitna	\N
00040000-562a-3ba9-c176-8a88e43bfbba	AM	ARM	051	Armenia 	Armenija	\N
00040000-562a-3ba9-e9cb-a272c182574a	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-562a-3ba9-2312-f0dc0dcc1781	AU	AUS	036	Australia 	Avstralija	\N
00040000-562a-3ba9-951a-4574ae52dfa3	AT	AUT	040	Austria 	Avstrija	\N
00040000-562a-3ba9-7fef-18f1954cff49	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-562a-3ba9-287f-fda06697f2a1	BS	BHS	044	Bahamas 	Bahami	\N
00040000-562a-3ba9-6237-7c651953a29e	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-562a-3ba9-d983-d02c8d30bf36	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-562a-3ba9-72d9-219305757f7b	BB	BRB	052	Barbados 	Barbados	\N
00040000-562a-3ba9-ce08-024786b0d8bc	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-562a-3ba9-77a9-ec908a102452	BE	BEL	056	Belgium 	Belgija	\N
00040000-562a-3ba9-b17b-3d06902506eb	BZ	BLZ	084	Belize 	Belize	\N
00040000-562a-3ba9-9929-b27eaa959171	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-562a-3ba9-e2fe-aabaf284e068	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-562a-3ba9-d9c7-d2dc9617bfde	BT	BTN	064	Bhutan 	Butan	\N
00040000-562a-3ba9-0d35-587957682401	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-562a-3ba9-45e4-c0bf6a1a76ea	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-562a-3ba9-6507-baa6c2cf4b6e	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-562a-3ba9-07e6-dd47d1ca5f5b	BW	BWA	072	Botswana 	Bocvana	\N
00040000-562a-3ba9-a22f-8e52f6dc0364	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-562a-3ba9-b8ac-3594c6024869	BR	BRA	076	Brazil 	Brazilija	\N
00040000-562a-3ba9-9960-edc36cff8cd4	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-562a-3ba9-6bbd-07f766374083	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-562a-3ba9-5a96-a720e5f30ef2	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-562a-3ba9-6ee5-610cca33bf6c	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-562a-3ba9-e34c-7269cc2c39d4	BI	BDI	108	Burundi 	Burundi 	\N
00040000-562a-3ba9-0950-0fb34f143df9	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-562a-3ba9-013b-82e2bb468f06	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-562a-3ba9-85f1-7856af27feb1	CA	CAN	124	Canada 	Kanada	\N
00040000-562a-3ba9-079d-e16a875d3851	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-562a-3ba9-cf90-69dbe69232c4	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-562a-3ba9-0244-74afa12ed34a	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-562a-3ba9-85eb-31b84c3cd72a	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-562a-3ba9-228d-6f0daa2d4946	CL	CHL	152	Chile 	Čile	\N
00040000-562a-3ba9-bfae-66e73f2001df	CN	CHN	156	China 	Kitajska	\N
00040000-562a-3ba9-b033-f8e46a96ff9c	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-562a-3ba9-9de8-10d13259d563	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-562a-3ba9-c54c-8cd718302974	CO	COL	170	Colombia 	Kolumbija	\N
00040000-562a-3ba9-0f98-e43b2fa9a8f2	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-562a-3ba9-577c-de038326bf91	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-562a-3ba9-a4ea-96e804819819	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-562a-3ba9-af4f-4709efc71a92	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-562a-3ba9-5990-796c2e5601df	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-562a-3ba9-f392-ff9a119a772e	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-562a-3ba9-9785-e09e57792a89	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-562a-3ba9-9005-80472f01be51	CU	CUB	192	Cuba 	Kuba	\N
00040000-562a-3ba9-47d7-88453de67717	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-562a-3ba9-3b93-edc657ff150f	CY	CYP	196	Cyprus 	Ciper	\N
00040000-562a-3ba9-5475-886f41fbac63	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-562a-3ba9-b9b9-11cbbd43e617	DK	DNK	208	Denmark 	Danska	\N
00040000-562a-3ba9-600e-323da44ed9ab	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-562a-3ba9-45bd-0326f93f8966	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-562a-3ba9-ee96-574430df0980	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-562a-3ba9-bc42-d17903cf2dfd	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-562a-3ba9-25d8-1d7ef89376ee	EG	EGY	818	Egypt 	Egipt	\N
00040000-562a-3ba9-d241-f79cbfd0d18d	SV	SLV	222	El Salvador 	Salvador	\N
00040000-562a-3ba9-463a-ecf8e96c5217	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-562a-3ba9-e189-b730b2e3a47b	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-562a-3ba9-f071-5abaa129e4ce	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-562a-3ba9-43f3-a07f081e1bf5	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-562a-3ba9-ad15-ff874ed20f5a	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-562a-3ba9-3b86-57b2ec6433b8	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-562a-3ba9-b86d-3e4bfbcd3fc1	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-562a-3ba9-216f-c8035a49b65b	FI	FIN	246	Finland 	Finska	\N
00040000-562a-3ba9-309b-be67c19fc327	FR	FRA	250	France 	Francija	\N
00040000-562a-3ba9-89c2-546fe9edf36c	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-562a-3ba9-c8a2-623a8c478c7a	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-562a-3ba9-7b3f-d73a04b8b9b3	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-562a-3ba9-6978-8ba3be45a0a9	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-562a-3ba9-4a7e-4f07bf629ce7	GA	GAB	266	Gabon 	Gabon	\N
00040000-562a-3ba9-b652-4a278236a8dc	GM	GMB	270	Gambia 	Gambija	\N
00040000-562a-3ba9-8a60-47a6a7b91093	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-562a-3ba9-6c88-deea73c9bf81	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-562a-3ba9-ef2f-6b3e8ce20ecf	GH	GHA	288	Ghana 	Gana	\N
00040000-562a-3ba9-572c-30bbe9c0fdc1	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-562a-3ba9-8dc1-2c93a91931b2	GR	GRC	300	Greece 	Grčija	\N
00040000-562a-3ba9-9693-ff9e8077fed3	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-562a-3ba9-7a16-84eed5db81c9	GD	GRD	308	Grenada 	Grenada	\N
00040000-562a-3ba9-2658-70ff706e6b01	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-562a-3ba9-cb55-f231da377d93	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-562a-3ba9-16e8-67a640fccd02	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-562a-3ba9-4f6d-874442fef9f5	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-562a-3ba9-37ec-3f12c487943a	GN	GIN	324	Guinea 	Gvineja	\N
00040000-562a-3ba9-9e28-25f59c859f76	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-562a-3ba9-2669-ca42e87abbd9	GY	GUY	328	Guyana 	Gvajana	\N
00040000-562a-3ba9-9885-6000b655aa82	HT	HTI	332	Haiti 	Haiti	\N
00040000-562a-3ba9-1a66-0bfb68c4b73e	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-562a-3ba9-edd2-25c00c2342c4	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-562a-3ba9-c0f3-fde0967c25bc	HN	HND	340	Honduras 	Honduras	\N
00040000-562a-3ba9-5b30-8e625bbcdbbd	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-562a-3ba9-c5c2-f5d74bc510a1	HU	HUN	348	Hungary 	Madžarska	\N
00040000-562a-3ba9-fa74-e77dd03f5d97	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-562a-3ba9-b9bd-bfc87fe25fda	IN	IND	356	India 	Indija	\N
00040000-562a-3ba9-ddf4-7d2e7f844ecb	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-562a-3ba9-27e9-269af1fe5ec1	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-562a-3ba9-7229-46d9da458697	IQ	IRQ	368	Iraq 	Irak	\N
00040000-562a-3ba9-95b9-7811a01438e2	IE	IRL	372	Ireland 	Irska	\N
00040000-562a-3ba9-0fca-a955887d1d0e	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-562a-3ba9-51c8-600634573a6c	IL	ISR	376	Israel 	Izrael	\N
00040000-562a-3ba9-7830-d3a605931bad	IT	ITA	380	Italy 	Italija	\N
00040000-562a-3ba9-2316-9ac280dc7014	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-562a-3ba9-822b-8eef3e288317	JP	JPN	392	Japan 	Japonska	\N
00040000-562a-3ba9-28d3-fdab490d64c4	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-562a-3ba9-b80f-fcdb3dc9f898	JO	JOR	400	Jordan 	Jordanija	\N
00040000-562a-3ba9-f25d-aa8e5607483e	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-562a-3ba9-663b-0b3aa62e5cb1	KE	KEN	404	Kenya 	Kenija	\N
00040000-562a-3ba9-b933-c0208672e36d	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-562a-3ba9-d05e-f506583f4adf	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-562a-3ba9-01e4-37fa0ed25013	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-562a-3ba9-2bed-f1135514fc01	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-562a-3ba9-f71f-26d558be9527	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-562a-3ba9-ae63-1a91fc9b8063	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-562a-3ba9-0ae0-df9e45faf359	LV	LVA	428	Latvia 	Latvija	\N
00040000-562a-3ba9-1d3d-35ec05922047	LB	LBN	422	Lebanon 	Libanon	\N
00040000-562a-3ba9-c0ff-31568c03b6fc	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-562a-3ba9-0bc6-a796ba9415ea	LR	LBR	430	Liberia 	Liberija	\N
00040000-562a-3ba9-79a8-d5ca6244a9ee	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-562a-3ba9-d6dc-e2f343df6287	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-562a-3ba9-1639-2962079e4442	LT	LTU	440	Lithuania 	Litva	\N
00040000-562a-3ba9-8268-e008de5f9785	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-562a-3ba9-06aa-ed70e317666c	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-562a-3ba9-e4bf-773e1ff48dd0	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-562a-3ba9-9a85-474be3a05dd7	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-562a-3ba9-6fff-53eaab65eee2	MW	MWI	454	Malawi 	Malavi	\N
00040000-562a-3ba9-16ae-3f6e9b218a14	MY	MYS	458	Malaysia 	Malezija	\N
00040000-562a-3ba9-da62-055b8497a3a3	MV	MDV	462	Maldives 	Maldivi	\N
00040000-562a-3ba9-5fd8-e5b9fbb9e7a2	ML	MLI	466	Mali 	Mali	\N
00040000-562a-3ba9-dd51-e0b68f863840	MT	MLT	470	Malta 	Malta	\N
00040000-562a-3ba9-412c-679f16c9e933	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-562a-3ba9-8fe7-5f53537b5ac3	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-562a-3ba9-1fb6-72d49edc8f19	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-562a-3ba9-1926-968f5479a4a4	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-562a-3ba9-cbee-2ea80f8c605c	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-562a-3ba9-deb2-a73085d6ed3e	MX	MEX	484	Mexico 	Mehika	\N
00040000-562a-3ba9-6d98-b154c02dfb34	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-562a-3ba9-6a8b-cbcf0bc03464	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-562a-3ba9-fdff-b12ee3a401fd	MC	MCO	492	Monaco 	Monako	\N
00040000-562a-3ba9-535a-775430381c6c	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-562a-3ba9-5191-e7cc960e4718	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-562a-3ba9-6730-17f560fa2f26	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-562a-3ba9-0b15-e1b11699aa97	MA	MAR	504	Morocco 	Maroko	\N
00040000-562a-3ba9-f417-a15fb8440376	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-562a-3ba9-fcd2-42a19eee7fc6	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-562a-3ba9-9865-58bb1cdbe0f9	NA	NAM	516	Namibia 	Namibija	\N
00040000-562a-3ba9-df93-561027d50d56	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-562a-3ba9-f903-7c0604e292d4	NP	NPL	524	Nepal 	Nepal	\N
00040000-562a-3ba9-4a30-af20ed1427b1	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-562a-3ba9-b0ea-17f6140ebfcc	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-562a-3ba9-ac5e-b85cbcfb23d5	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-562a-3ba9-e666-03de41d8fbbf	NE	NER	562	Niger 	Niger 	\N
00040000-562a-3ba9-2b3a-f3ce27d7caf2	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-562a-3ba9-edc4-5df5de736334	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-562a-3ba9-9d65-d34af5232e38	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-562a-3ba9-d784-2dbb8b33c330	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-562a-3ba9-46fc-2c8054602cc0	NO	NOR	578	Norway 	Norveška	\N
00040000-562a-3ba9-c9d4-4ae1cee95bbc	OM	OMN	512	Oman 	Oman	\N
00040000-562a-3ba9-356b-e59b3cadf20b	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-562a-3ba9-accb-ff19091a1ecf	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-562a-3ba9-b0ff-6d164b94e236	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-562a-3ba9-2470-93d427386140	PA	PAN	591	Panama 	Panama	\N
00040000-562a-3ba9-7f6f-d9dd7806ac7b	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-562a-3ba9-bf02-ac3f06730f51	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-562a-3ba9-d339-51a59cc521ac	PE	PER	604	Peru 	Peru	\N
00040000-562a-3ba9-4c69-b3d2b7c7b124	PH	PHL	608	Philippines 	Filipini	\N
00040000-562a-3ba9-de02-ef422f28a81b	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-562a-3ba9-71c7-53593cb7e1fb	PL	POL	616	Poland 	Poljska	\N
00040000-562a-3ba9-24c2-4ac99cc23eb0	PT	PRT	620	Portugal 	Portugalska	\N
00040000-562a-3ba9-bd3c-dbdc94fea40b	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-562a-3ba9-8fbf-0480f935a14b	QA	QAT	634	Qatar 	Katar	\N
00040000-562a-3ba9-3bd8-68d6a763e251	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-562a-3ba9-7b74-642064ffcf8a	RO	ROU	642	Romania 	Romunija	\N
00040000-562a-3ba9-2114-7db777e0d47a	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-562a-3ba9-e184-e58012f59029	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-562a-3ba9-9906-e3001e35b71d	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-562a-3ba9-6a02-cbf485c704e8	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-562a-3ba9-4a0e-b90be93deb10	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-562a-3ba9-abc6-569c2306c4bf	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-562a-3ba9-e3b3-658623f4e4d7	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-562a-3ba9-ae6c-c7b6c0aa3ca5	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-562a-3ba9-5a1e-59a3fa8f725c	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-562a-3ba9-89ec-2ec251e0f07e	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-562a-3ba9-6d64-a6338122ef38	SM	SMR	674	San Marino 	San Marino	\N
00040000-562a-3ba9-cbb5-12b80ad4b3cc	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-562a-3ba9-5a16-957ed747cffb	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-562a-3ba9-75af-27eeca4a3be5	SN	SEN	686	Senegal 	Senegal	\N
00040000-562a-3ba9-f596-6fafb4ad3ab3	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-562a-3ba9-d662-f7d178deca44	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-562a-3ba9-9a9f-b6f7ec1dc636	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-562a-3ba9-f56d-8b3268602d26	SG	SGP	702	Singapore 	Singapur	\N
00040000-562a-3ba9-3273-88bfb479eb64	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-562a-3ba9-2900-14f4b80fc97e	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-562a-3ba9-ac4a-5cd2a3229275	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-562a-3ba9-4304-ae8b7438fd7d	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-562a-3ba9-2b77-732945ff1ebf	SO	SOM	706	Somalia 	Somalija	\N
00040000-562a-3ba9-987e-a3c092528ee2	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-562a-3ba9-c173-a9bffb6af527	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-562a-3ba9-a0f9-39b786e1501b	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-562a-3ba9-41ea-61179fd48c19	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-562a-3ba9-09d9-17440d552ca1	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-562a-3ba9-8dfa-ad5d39cad821	SD	SDN	729	Sudan 	Sudan	\N
00040000-562a-3ba9-556d-fa2089598f75	SR	SUR	740	Suriname 	Surinam	\N
00040000-562a-3ba9-69a3-903ce1e350ce	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-562a-3ba9-08fe-e45293ad336c	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-562a-3ba9-418f-1365f3a8dbeb	SE	SWE	752	Sweden 	Švedska	\N
00040000-562a-3ba9-7886-d5c2505593ef	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-562a-3ba9-be70-4334781e7e81	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-562a-3ba9-e5fb-9656ccdbeef3	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-562a-3ba9-6983-e7aa982b36d9	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-562a-3ba9-328d-a4344938cf67	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-562a-3ba9-4c81-510ea1083cae	TH	THA	764	Thailand 	Tajska	\N
00040000-562a-3ba9-62b9-7f77e29d8fea	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-562a-3ba9-c8cc-3ed6b60610dc	TG	TGO	768	Togo 	Togo	\N
00040000-562a-3ba9-fc60-04d430558c8c	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-562a-3ba9-1793-fa2532eb65e0	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-562a-3ba9-78fd-847d99d2654b	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-562a-3ba9-e830-c31b0de96c80	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-562a-3ba9-78b5-32991e77542b	TR	TUR	792	Turkey 	Turčija	\N
00040000-562a-3ba9-c172-0e2ba1769a52	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-562a-3ba9-23d9-a4740e0c3c34	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-562a-3ba9-eaf2-484cbcd578b1	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-562a-3ba9-2886-3483660d1d1c	UG	UGA	800	Uganda 	Uganda	\N
00040000-562a-3ba9-1cee-83242643ee83	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-562a-3ba9-2ab8-e5a7f956860b	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-562a-3ba9-233b-a0beade3965a	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-562a-3ba9-00ac-408ef76fe773	US	USA	840	United States 	Združene države Amerike	\N
00040000-562a-3ba9-3ad3-99bf61be83a2	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-562a-3ba9-e9dd-127a8eeffdaf	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-562a-3ba9-7aba-f3a310c0f6d9	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-562a-3ba9-e5cf-85ee3beef453	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-562a-3ba9-38a4-e80e6daec86d	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-562a-3ba9-cf8a-a89c6f1071a6	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-562a-3ba9-4617-82860fe2ea14	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-562a-3ba9-1827-c7a4e8913e0a	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-562a-3ba9-0d5c-691acd4947e6	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-562a-3ba9-579d-c87aa8b6c66e	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-562a-3ba9-0e5b-2749143a939c	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-562a-3ba9-a216-aeaef16f73e9	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-562a-3ba9-6af5-2a0e94258377	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 3112 (class 0 OID 23280113)
-- Dependencies: 234
-- Data for Name: enotaprograma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY enotaprograma (id, uprizoritev_id, program_dela_id, gostitelj_id, celotnavrednost, nasdelez, celotnavrednostmat, celotnavrednostgostovsz, zaproseno, lastnasredstva, avtorskihonorarji, avtorskihonorarjisamoz, tantieme, avtorskepravice, materialni, imakoprodukcije, vlozekgostitelja, drugijavni, stzaposlenih, stzaposumet, stzaposdrug, sthonorarnihzun, sthonorarnihzunigr, sthonorarnihzunigrtujjz, sthonorarnihzunsamoz, obiskdoma, obiskkopr, obiskgost, obiskkoprgost, obiskzamejo, obiskkoprzamejo, obiskint, obiskkoprint, ponovidoma, ponovikopr, ponovizamejo, ponovikoprzamejo, ponovigost, ponovikoprgost, ponovikoprint, ponoviint, naziv, kpe, sort, tipprogramskeenote_id, tip, prikoproducentu, prizorisce, trajanje, zvrst, avtor, reziser, datum, soustvarjalci, strosekodkpred, stroskiostali, krajgostovanja, ustanova, datumgostovanja, transportnistroski, dnevprvzad, drzavagostovanja_id, stpe, stpredstav, stokroglihmiz, stpredstavitev, stdelavnic, stdrugidogodki, stprodukcij, caspriprave, casizvedbe, prizorisca, umetvodja, programskotelo, sttujihselektorjev) FROM stdin;
002f0000-562a-3bab-3b36-07e33b2f444c	000e0000-562a-3bab-3bba-313fb91c0345	\N	\N	9000.30	9000.30	9000.30	0.00	3600.12	5299.98	4000.40	1000.40	200.20	200.30	4599.40	\N	0.00	100.20	0	2	2	2	2	2	0	40	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-562a-3ba9-abe8-8b005ca4df69	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-562a-3bab-4489-4c4e88127608	000e0000-562a-3bab-f1ac-b9bf2f045d81	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	0	60	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-562a-3ba9-a814-4b283e0aa9f9	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-562a-3bab-d1c4-45b159226c9e	000e0000-562a-3bab-a10e-41a71e9ae6a4	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	0	60	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-562a-3ba9-abe8-8b005ca4df69	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-562a-3bab-dfe8-db73ce3f7f05	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-54.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	54.20	5	0	0	3	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0	0	Urejanje portala	0.00	10	\N	razno	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-562a-3bab-23bc-57e4b1326b7b	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-31.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	31.20	5	0	0	3	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0	0	Delavnice otroci	0.00	8	\N	razno	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 3097 (class 0 OID 23279914)
-- Dependencies: 219
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, podrocje, vodjaekipe, naziv, komentar, velikost, pomembna, sort, seplanira, dovoliprekrivanje, maxprekrivanj, tipfunkcije_id) FROM stdin;
000d0000-562a-3bab-0f2b-0f53d10f5ee3	000e0000-562a-3bab-f1ac-b9bf2f045d81	000c0000-562a-3bab-46de-9e13b6951b33	igralec	\N	Tezej	glavna vloga	velika	t	5	t	t	\N	000f0000-562a-3ba9-22fb-9d2995af8bd2
000d0000-562a-3bab-2091-badc3246d75e	000e0000-562a-3bab-f1ac-b9bf2f045d81	000c0000-562a-3bab-a33f-31bf7c3fdb4d	umetnik	\N	Režija		velika	t	8	t	t	\N	000f0000-562a-3ba9-252f-66c47c63cf2e
000d0000-562a-3bab-3b12-3f40b5b4af7a	000e0000-562a-3bab-f1ac-b9bf2f045d81	000c0000-562a-3bab-c9cc-263b40deb7b2	inspicient	t	Inšpicient			t	8	t	t	\N	000f0000-562a-3ba9-9a90-a6cfe9cfabb7
000d0000-562a-3bab-c9fa-b07690825a6e	000e0000-562a-3bab-f1ac-b9bf2f045d81	000c0000-562a-3bab-8cb6-b912d79d64b0	tehnik	t	Tehnični vodja			t	8	t	t	\N	000f0000-562a-3ba9-d2bd-84dda596ed7d
000d0000-562a-3bab-2277-85d11cd87f9a	000e0000-562a-3bab-f1ac-b9bf2f045d81	000c0000-562a-3bab-8652-36eda5bc3fc8	tehnik	\N	Razsvetljava			t	3	t	t	\N	000f0000-562a-3ba9-d2bd-84dda596ed7d
000d0000-562a-3bab-9cbe-aba9acbd070c	000e0000-562a-3bab-f1ac-b9bf2f045d81	000c0000-562a-3bab-9df6-a31c4c4b1d10	igralec	\N	Helena	glavna vloga	velika	t	5	t	t	\N	000f0000-562a-3ba9-22fb-9d2995af8bd2
000d0000-562a-3bab-201a-f57c204ab728	000e0000-562a-3bab-f1ac-b9bf2f045d81	000c0000-562a-3bab-86b8-9188c213a994	igralec	\N	Hipolita	glavna vloga	velika	t	6	t	t	\N	000f0000-562a-3ba9-22fb-9d2995af8bd2
000d0000-562a-3bab-dccb-e8f5ac199da0	000e0000-562a-3bab-f1ac-b9bf2f045d81	000c0000-562a-3bab-aeab-1cb5e6b2994c	umetnik	\N	Lektoriranje			t	22	t	t	\N	000f0000-562a-3ba9-62b4-3f13dac2a5cc
000d0000-562a-3bab-5469-9cb08362b6e7	000e0000-562a-3bab-f1ac-b9bf2f045d81	000c0000-562a-3bab-9319-8f89a8f166fb	umetnik	\N	Avtor	Avtor besedila		t	2	t	f	\N	000f0000-562a-3ba9-3c65-5cd1e2f458ac
\.


--
-- TOC entry 3075 (class 0 OID 23279711)
-- Dependencies: 197
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta, zamejstvo, kraj) FROM stdin;
\.


--
-- TOC entry 3072 (class 0 OID 23279677)
-- Dependencies: 194
-- Data for Name: job; Type: TABLE DATA; Schema: public; Owner: -
--

COPY job (id, user_id, name, task, status, log, datum, casizvedbe, izveden, data, alert, hidden, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3070 (class 0 OID 23279654)
-- Dependencies: 192
-- Data for Name: kontaktnaoseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kontaktnaoseba (id, popa_id, oseba_id, status, funkcija, opis) FROM stdin;
00260000-562a-3bab-b702-f418c49a4ba3	00080000-562a-3bab-7daf-f9904876ecb8	00090000-562a-3bab-62b0-e0570d283c7e	AK		igralka
\.


--
-- TOC entry 3086 (class 0 OID 23279828)
-- Dependencies: 208
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 3123 (class 0 OID 23280352)
-- Dependencies: 245
-- Data for Name: mapa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa (id, lastnik_id, parent_id, ime, komentar, caskreiranja, casspremembe, javnidostop, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3124 (class 0 OID 23280364)
-- Dependencies: 246
-- Data for Name: mapa_zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa_zapis (mapa_id, zapis_id) FROM stdin;
\.


--
-- TOC entry 3126 (class 0 OID 23280386)
-- Dependencies: 248
-- Data for Name: mapaacl; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapaacl (id, mapa_id, perm_id, dostop, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3090 (class 0 OID 23279853)
-- Dependencies: 212
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 3067 (class 0 OID 23279611)
-- Dependencies: 189
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-562a-3ba9-c52a-a1943eb43e44	popa.stakli	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-562a-3ba9-ab3a-0efe12a4a800	oseba.spol	array	a:2:{s:1:"M";a:1:{s:5:"label";s:6:"Moški";}s:1:"Z";a:1:{s:5:"label";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-562a-3ba9-e7c2-171df97f7496	telefonska.vrsta	array	a:3:{s:7:"mobilna";a:1:{s:5:"label";s:7:"Mobilni";}s:6:"domaca";a:1:{s:5:"label";s:6:"Domač";}s:6:"fiksna";a:1:{s:5:"label";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-562a-3ba9-cfb9-a3e85e011f02	kontaktnaoseba.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status kontaktne osebe
00000000-562a-3ba9-84be-200eac29c8cd	dogodek.status	array	a:8:{s:4:"100s";a:1:{s:5:"label";s:11:"Dolgoročno";}s:4:"200s";a:1:{s:5:"label";s:9:"Planirano";}s:4:"300s";a:1:{s:5:"label";s:8:"Fiksiran";}s:4:"400s";a:1:{s:5:"label";s:17:"Potrjen - interno";}s:4:"500s";a:1:{s:5:"label";s:15:"Potrjen - javno";}s:4:"600s";a:1:{s:5:"label";s:10:"Zaključen";}s:4:"610s";a:1:{s:5:"label";s:9:"Odpovedan";}s:4:"700s";a:1:{s:5:"label";s:7:"Obdelan";}}	f	t	t	\N	Tabela statusa dogodkov
00000000-562a-3ba9-9245-9195b7ba1016	dogodek.razred	array	a:5:{s:4:"100s";a:2:{s:5:"label";s:9:"Predstava";s:4:"type";s:9:"predstava";}s:4:"200s";a:2:{s:5:"label";s:4:"Vaja";s:4:"type";s:4:"vaja";}s:4:"300s";a:2:{s:5:"label";s:10:"Gostovanje";s:4:"type";s:10:"gostovanje";}s:4:"400s";a:2:{s:5:"label";s:16:"Splošni dogodek";s:4:"type";s:8:"splošni";}s:4:"500s";a:2:{s:5:"label";s:10:"Zasedenost";s:4:"type";s:10:"zasedenost";}}	f	t	t	\N	Tabela razredov dogodkov, ki jih aplikacija podpira
00000000-562a-3ba9-b55e-da519c5eeb51	uprizoritev.faza	array	a:6:{s:20:"predprodukcija-ideja";a:1:{s:5:"label";s:16:"Dolgoročni plan";}s:20:"predprodukcija-poziv";a:1:{s:5:"label";s:29:"Predprodukcija, v fazi poziva";}s:30:"predprodukcija-potrjen_program";a:1:{s:5:"label";s:34:"Predprodukcija, program je potrjen";}s:10:"produkcija";a:1:{s:5:"label";s:10:"Produkcija";}s:14:"postprodukcija";a:1:{s:5:"label";s:14:"Postprodukcija";}s:5:"arhiv";a:1:{s:5:"label";s:10:"Arhivirana";}}	f	t	f	\N	Faza uprizoritve
00000000-562a-3ba9-3875-dc8c0f613ddc	funkcija.podrocje	array	a:4:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}}	f	t	f	\N	Področje funkcije
00000000-562a-3ba9-5c59-8af38f57a376	tipfunkcije.podrocje	array	a:4:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}}	f	t	f	\N	Področje funkcije
00000000-562a-3ba9-87e1-017154b970f2	funkcija.velikost	array	a:4:{s:6:"velika";a:1:{s:5:"label";s:23:"Velika vloga / funkcija";}s:7:"srednja";a:1:{s:5:"label";s:24:"Srednja vloga / funkcija";}s:4:"mala";a:1:{s:5:"label";s:21:"Mala vloga / funkcija";}s:7:"stataza";a:1:{s:5:"label";s:8:"Stataža";}}	f	t	f	\N	Velikost funkcije
00000000-562a-3ba9-67e7-14d9e661f29e	zaposlitev.status	array	a:2:{s:1:"A";a:1:{s:5:"label";s:7:"Aktivna";}s:1:"N";a:1:{s:5:"label";s:9:"Neaktivna";}}	f	t	f	\N	Status zaposlitve
00000000-562a-3ba9-d3f5-3bdb02411fff	produkcijskahisa.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktivna";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktivna";}}	f	t	f	\N	Status produkcijske hiše
00000000-562a-3ba9-aa88-88d31188d15c	strosekuprizoritve.tipstroska	array	a:1:{s:10:"materialni";a:1:{s:5:"label";s:19:"Materialni strošek";}}	f	t	f	\N	Tip stroška
00000000-562a-3ba9-27da-103212279150	avtorbesedila.tipavtorja	array	a:4:{s:4:"aizv";a:1:{s:5:"label";s:15:"Avtor izvirnika";}s:4:"prev";a:1:{s:5:"label";s:10:"Prevajalec";}s:4:"apri";a:1:{s:5:"label";s:14:"Avtor priredbe";}s:4:"dram";a:1:{s:5:"label";s:12:"Dramatizator";}}	f	t	f	\N	Tip stroška
00000000-562a-3ba9-251e-ae3a82214b97	fsacl.dostop	array	a:4:{s:1:"X";a:1:{s:5:"label";s:12:"Brez dostopa";}s:1:"R";a:1:{s:5:"label";s:11:"Samo branje";}s:2:"RW";a:1:{s:5:"label";s:17:"Branje in pisanje";}s:3:"RWD";a:1:{s:5:"label";s:26:"Branje pisanje in brisanje";}}	f	t	f	\N	ACL Javni dostop
00000000-562a-3bab-ce40-1e1efc6612b1	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-562a-3bab-ca53-18d711cbfdb1	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-562a-3bab-c78e-2cb1972a1e4a	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-562a-3bab-26bd-c2e70af16915	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-562a-3bab-37ba-9396c51ff2d4	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
00000000-562a-3bac-defd-3659bc401801	application.tenant.maticnopodjetje	string	s:36:"00080000-562a-3bac-8dd2-34485cafa3e5";	f	t	f		Id matičnega podjetja v Popa
\.


--
-- TOC entry 3060 (class 0 OID 23279511)
-- Dependencies: 182
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-562a-3bab-bb6e-fb3f2ca6b354	00000000-562a-3bab-ce40-1e1efc6612b1	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-562a-3bab-f5fe-be92fdaff6fd	00000000-562a-3bab-ce40-1e1efc6612b1	00010000-562a-3ba9-53fa-d9570fa8108e	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-562a-3bab-f008-3fefd7b332dc	00000000-562a-3bab-ca53-18d711cbfdb1	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 3064 (class 0 OID 23279578)
-- Dependencies: 186
-- Data for Name: organizacijskaenota; Type: TABLE DATA; Schema: public; Owner: -
--

COPY organizacijskaenota (id, parent_id, vodja_id, namestnik_id, sifra, naziv) FROM stdin;
00410000-562a-3bab-832d-e6617f7242c7	\N	00100000-562a-3bab-ff40-572357732239	00100000-562a-3bab-61b3-6b5a9aec1e44	01	Gledališče Nimbis
00410000-562a-3bab-922f-0af7f2b1686b	00410000-562a-3bab-832d-e6617f7242c7	00100000-562a-3bab-ff40-572357732239	00100000-562a-3bab-61b3-6b5a9aec1e44	02	Tehnika
\.


--
-- TOC entry 3061 (class 0 OID 23279522)
-- Dependencies: 183
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naslov_id, sifra, naziv, ime, priimek, funkcija, srednjeime, polnoime, psevdonim, email, twitter, skype, fb, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
00090000-562a-3bab-a7d8-44b67216ad11	\N	\N	0001	g.	Janez	Novak	a	Peter	Janez Peter Novak	Jani	jani.novak@xxx.xx				1958-01-06	0601958000000	123456789	M	Jani Janez	Slovenija	Slovenija	Ljubljana
00090000-562a-3bab-b739-9f53c6028ad4	00010000-562a-3bab-b2e1-dc93f6520337	\N	0002	dr.	Anton	Horvat	b		Anton  Horvat	Tona	anton.horvat@xxx.xx				1968-02-12	1202968111111	234567890	M		Slovenija	Slovenija	Maribor
00090000-562a-3bab-45de-3779d095fa1a	00010000-562a-3bab-f7d6-e75e5e268d6c	\N	0003		Ivan	Kovačič	c		Ivan  Kovačič	Ivo	ivan.kovacic@xxx.xx				1975-03-26	2603976222222	345678901	M		Slovenija	Slovenija	Celje
00090000-562a-3bab-9d4e-e4c21b018c8d	00010000-562a-3bab-06cf-1e4498a030b0	\N	0004	prof.	Jožef	Krajnc	d		Jožef  Krajnc	Joža	jozef.krajnc@xxx.xx				1971-04-30	3004971333333	456789012	M		Slovenija	Slovenija	Kranj
00090000-562a-3bab-4335-689811bf481d	\N	\N	0005		Marko	Zupančič	e		Marko  Zupančič		marko.zupancic@xxx.xx				1984-05-07	0705984444444	567890123	M		Slovenija	Slovenija	Koper
00090000-562a-3bab-d7fb-679ed7f64087	\N	\N	0006	ga.	Marija	Kovač	f		Marija  Kovač		marija.kovac@xxx.xx				1962-06-19	1906962444444	678901234	Z		Slovenija	Slovenija	Murska Sobota
00090000-562a-3bab-e377-6caa98a729a4	\N	\N	0007	ga.	Ana	Potočnik	g		Ana  Potočnik		ana.potocnik@xxx.xx				1975-07-24	2407975555555	789012345	Z		Slovenija	Slovenija	Novo Mesto
00090000-562a-3bab-8021-ece1706e4277	\N	\N	0008	ga.	Maja	Mlakar	h		Maja  Mlakar		maja.mlakar@xxx.xx				1986-08-02	0208986666666	890123456	Z		Slovenija	Slovenija	Nova Gorica
00090000-562a-3bab-62b0-e0570d283c7e	00010000-562a-3bab-8d2f-1d16b4b196e2	\N	0009		Irena	Kos	i		Irena  Kos		irena.kos@xxx.xx				1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Ptuj
00090000-562a-3bab-831a-c2df7a9f3edf	\N	\N	0010		Mojca	Vidmar	J		Mojca  Vidmar		mojca.vidmar@xxx.xx				1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Idrija
00090000-562a-3bab-28af-77f040e38cea	\N	\N	0011		xx	write protected12345	a		xx  write protected12345		xx@xxx.xx				\N	\N	\N	Z		\N	\N	\N
00090000-562a-3bab-ce9f-9e9209f4c3cd	\N	\N	0012		Luka	Golob	luč	a	Luka a Golob		luka.golob@xxx.xx				\N	\N	\N	M		\N	\N	\N
00090000-562a-3bab-910a-3f663709275c	00010000-562a-3bab-771d-3cf56ac893b2	\N	0013		Tatjana	Božič	tajnica	a	Tatjana a Božič		tatjana.bozic@xxx.xx				\N	\N	\N	Z		\N	\N	\N
00090000-562a-3bab-e3a7-e13e32e6111b	\N	\N	0014		William	Shakespeare	avtor		William  Shakespeare		\N				\N	\N	\N	M		\N	\N	\N
00090000-562a-3bab-4639-a4651a1a7811	\N	\N	0015		Nebojša	Kavader	avtor		Nebojša  Kavader		\N				\N	\N	\N	M		\N	\N	\N
00090000-562a-3bab-d932-b9f03635cc35	\N	\N	0016		Fjodor	Dostojevski	avtor	Mihajlovič	Fjodor Mihajlovič Dostojevski		\N				\N	\N	\N	M		\N	\N	\N
00090000-562a-3bab-06db-c5602adf3176	\N	\N	0017		Berta 	Hočevar	avtorica		Berta   Hočevar		\N				\N	\N	\N	Z		\N	\N	\N
00090000-562a-3bab-d4c5-e221d4e2b119	\N	\N	0018		Katarina	Podbevšek	lektorica		Katarina  Podbevšek		\N				\N	\N	\N	Z		\N	\N	\N
00090000-562a-3bab-fe89-d1a74b0d9b93	\N	\N	0019		Lojze	Žumer			Lojze  Žumer		\N				\N	\N	\N	M		\N	\N	\N
00090000-562a-3bab-d41f-c973ae469357	\N	\N	0020		Luka	Novak			Luka  Novak		\N				\N	\N	\N	M		\N	\N	\N
00090000-562a-3bab-f3e3-098ac4b98c65	\N	\N	0021		Vinko	   Netriman   			Vinko     Netriman   		\N				\N	\N	\N	M		\N	\N	\N
\.


--
-- TOC entry 3055 (class 0 OID 23279466)
-- Dependencies: 177
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-562a-3ba9-92ca-c2fb27058ee0	Aaa-read	Aaa (User,Role,Permission) - branje	f
00030000-562a-3ba9-557c-9d226439be5a	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	f
00030000-562a-3ba9-f538-675c34675fcf	TerminStoritve-vse	TerminStoritve - spreminjanje vseh zapisov	f
00030000-562a-3ba9-27a7-05a872c2ec0c	Dogodek-readVse	Dogodek - branje vseh, ne glede na status dogodka	f
00030000-562a-3ba9-ceda-1a3d2cd5100b	Oseba-vse	Oseba - vse - za testiranje assert	f
00030000-562a-3ba9-25d9-71aac89f20e4	ProgramDela-lock	ProgramDela - zaklepanje	f
00030000-562a-3ba9-0ec7-4a3aa95cbeb1	ProgramDela-unlock	ProgramDela - odklepanje	f
00030000-562a-3ba9-ae20-2cf01a668575	Abonma-read	Abonma - branje	f
00030000-562a-3ba9-7e09-c2f127bdbc6d	Abonma-write	Abonma - spreminjanje	f
00030000-562a-3ba9-dbb9-7f40936d885f	Alternacija-read	Alternacija - branje	f
00030000-562a-3ba9-5c69-5cd300cce4e7	Alternacija-write	Alternacija - spreminjanje	f
00030000-562a-3ba9-2ef8-6c9280c0172f	Arhivalija-read	Arhivalija - branje	f
00030000-562a-3ba9-cbf8-b58a27413a59	Arhivalija-write	Arhivalija - spreminjanje	f
00030000-562a-3ba9-38f9-daf48edb5fa4	AvtorBesedila-read	AvtorBesedila - branje	f
00030000-562a-3ba9-991c-5f5b156c4d23	AvtorBesedila-write	AvtorBesedila - spreminjanje	f
00030000-562a-3ba9-4382-c91cd0bac425	Besedilo-read	Besedilo - branje	f
00030000-562a-3ba9-854d-13d275df963f	Besedilo-write	Besedilo - spreminjanje	f
00030000-562a-3ba9-ac38-46428423fe0a	DogodekIzven-read	DogodekIzven - branje	f
00030000-562a-3ba9-d281-4fb679dc1796	DogodekIzven-write	DogodekIzven - spreminjanje	f
00030000-562a-3ba9-6392-d9091c0416f4	Dogodek-read	Dogodek - branje	f
00030000-562a-3ba9-1952-92bbd35b385b	Dogodek-write	Dogodek - spreminjanje	f
00030000-562a-3ba9-52d2-44437d55d001	DrugiVir-read	DrugiVir - branje	f
00030000-562a-3ba9-ee6a-a50293772608	DrugiVir-write	DrugiVir - spreminjanje	f
00030000-562a-3ba9-6215-5fc55e34088b	Drzava-read	Drzava - branje	f
00030000-562a-3ba9-edbd-ab3185632b35	Drzava-write	Drzava - spreminjanje	f
00030000-562a-3ba9-2a63-567563e9bb84	EnotaPrograma-read	EnotaPrograma - branje	f
00030000-562a-3ba9-9cb6-9cabb43f0b36	EnotaPrograma-write	EnotaPrograma - spreminjanje	f
00030000-562a-3ba9-3ff8-123e2e87c156	Funkcija-read	Funkcija - branje	f
00030000-562a-3ba9-390c-d9aad07ec732	Funkcija-write	Funkcija - spreminjanje	f
00030000-562a-3ba9-7367-160816670c00	Gostovanje-read	Gostovanje - branje	f
00030000-562a-3ba9-eef6-cd69a71f7197	Gostovanje-write	Gostovanje - spreminjanje	f
00030000-562a-3ba9-6541-0ae4b8917c09	Gostujoca-read	Gostujoca - branje	f
00030000-562a-3ba9-aff7-ea2010fda665	Gostujoca-write	Gostujoca - spreminjanje	f
00030000-562a-3ba9-da59-2c090f392610	KontaktnaOseba-read	KontaktnaOseba - branje	f
00030000-562a-3ba9-dc44-a804b2944d19	KontaktnaOseba-write	KontaktnaOseba - spreminjanje	f
00030000-562a-3ba9-2af2-7f2d3bca5e0b	Kupec-read	Kupec - branje	f
00030000-562a-3ba9-085f-14f4f1629d11	Kupec-write	Kupec - spreminjanje	f
00030000-562a-3ba9-c272-06240c3e12fd	NacinPlacina-read	NacinPlacina - branje	f
00030000-562a-3ba9-5b65-13109db34110	NacinPlacina-write	NacinPlacina - spreminjanje	f
00030000-562a-3ba9-1e8f-c85e0608e9c2	Option-read	Option - branje	f
00030000-562a-3ba9-8926-86ff48968a5f	Option-write	Option - spreminjanje	f
00030000-562a-3ba9-20f7-bd3061a2d24d	OptionValue-read	OptionValue - branje	f
00030000-562a-3ba9-6aff-05ee858658f8	OptionValue-write	OptionValue - spreminjanje	f
00030000-562a-3ba9-b5cf-a114cb981a28	OrganizacijskaEnota-read	OrganizacijskaEnota - branje	f
00030000-562a-3ba9-e7d0-39a0b1bbc680	OrganizacijskaEnota-write	OrganizacijskaEnota - spreminjanje	f
00030000-562a-3ba9-b584-8bd90ecab5dd	Oseba-read	Oseba - branje	f
00030000-562a-3ba9-7c67-7750dddc0f8f	Oseba-write	Oseba - spreminjanje	f
00030000-562a-3ba9-a2b5-717420c13601	PlacilniInstrument-read	PlacilniInstrument - branje	f
00030000-562a-3ba9-f075-2f0d4529f651	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	f
00030000-562a-3ba9-a075-4354b8a64464	PodrocjeSedenja-read	PodrocjeSedenja - branje	f
00030000-562a-3ba9-8cf1-7db53c19e496	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	f
00030000-562a-3ba9-9891-c163b581cc2b	Pogodba-read	Pogodba - branje	f
00030000-562a-3ba9-6e54-54675fc3bd2f	Pogodba-write	Pogodba - spreminjanje	f
00030000-562a-3ba9-2dd0-40bf1ce07282	Popa-read	Popa - branje	f
00030000-562a-3ba9-53ec-f6e1e91a6eec	Popa-write	Popa - spreminjanje	f
00030000-562a-3ba9-06e8-18ac4953f674	Posta-read	Posta - branje	f
00030000-562a-3ba9-c376-95614b04caf2	Posta-write	Posta - spreminjanje	f
00030000-562a-3ba9-2880-1e0f253e1216	PostavkaCDve-read	PostavkaCDve - branje	f
00030000-562a-3ba9-1626-1a8c07823f42	PostavkaCDve-write	PostavkaCDve - spreminjanje	f
00030000-562a-3ba9-f5ae-1db12b5e1c55	PostavkaRacuna-read	PostavkaRacuna - branje	f
00030000-562a-3ba9-4cdb-77914743ae3b	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	f
00030000-562a-3ba9-f488-ff1d45a5d601	PostniNaslov-read	PostniNaslov - branje	f
00030000-562a-3ba9-8605-ffd454307838	PostniNaslov-write	PostniNaslov - spreminjanje	f
00030000-562a-3ba9-960a-c89462b1bfd5	Predstava-read	Predstava - branje	f
00030000-562a-3ba9-8908-15845a3e6b13	Predstava-write	Predstava - spreminjanje	f
00030000-562a-3ba9-3569-b8f184eaa3b9	Praznik-read	Praznik - branje	f
00030000-562a-3ba9-b54d-f2ac77973b6b	Praznik-write	Praznik - spreminjanje	f
00030000-562a-3ba9-c3c8-46a91bc2338a	ProdajaPredstave-read	ProdajaPredstave - branje	f
00030000-562a-3ba9-2ba1-283d1afd7bc9	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	f
00030000-562a-3ba9-dbae-bf860731d755	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	f
00030000-562a-3ba9-46ec-527e76d327f0	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	f
00030000-562a-3ba9-fe02-325205805e16	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	f
00030000-562a-3ba9-e479-e8437ee8f376	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	f
00030000-562a-3ba9-a171-cef5b0e57326	ProgramDela-read	ProgramDela - branje	f
00030000-562a-3ba9-a859-41f920637c1c	ProgramDela-write	ProgramDela - spreminjanje	f
00030000-562a-3ba9-ae4b-442909098029	ProgramFestival-read	ProgramFestival - branje	f
00030000-562a-3ba9-a39a-df21e74154cc	ProgramFestival-write	ProgramFestival - spreminjanje	f
00030000-562a-3ba9-5659-c11b8a861694	ProgramGostovanje-read	ProgramGostovanje - branje	f
00030000-562a-3ba9-e922-99e9001fa43b	ProgramGostovanje-write	ProgramGostovanje - spreminjanje	f
00030000-562a-3ba9-2b73-7bef1e43f0a9	ProgramGostujoca-read	ProgramGostujoca - branje	f
00030000-562a-3ba9-5298-30b8c246f48b	ProgramGostujoca-write	ProgramGostujoca - spreminjanje	f
00030000-562a-3ba9-781e-6cd0c0f458bc	ProgramIzjemni-read	ProgramIzjemni - branje	f
00030000-562a-3ba9-3392-9921bca15b24	ProgramIzjemni-write	ProgramIzjemni - spreminjanje	f
00030000-562a-3ba9-65d2-de1d7264fa87	ProgramPonovitevPrejsnjih-read	ProgramPonovitevPrejsnjih - branje	f
00030000-562a-3ba9-8e1e-82077c1d15bd	ProgramPonovitevPrejsnjih-write	ProgramPonovitevPrejsnjih - spreminjanje	f
00030000-562a-3ba9-3666-8fd429da02d1	ProgramPonovitevPremiere-read	ProgramPonovitevPremiere - branje	f
00030000-562a-3ba9-b35d-a5248e770d65	ProgramPonovitevPremiere-write	ProgramPonovitevPremiere - spreminjanje	f
00030000-562a-3ba9-67cc-08c07e97ac9f	ProgramPremiera-read	ProgramPremiera - branje	f
00030000-562a-3ba9-d507-8d0ec7503ffe	ProgramPremiera-write	ProgramPremiera - spreminjanje	f
00030000-562a-3ba9-370a-b95e7a4e1454	ProgramRazno-read	ProgramRazno - branje	f
00030000-562a-3ba9-e97a-ac958fb61232	ProgramRazno-write	ProgramRazno - spreminjanje	f
00030000-562a-3ba9-5bce-3bba3123effe	ProgramskaEnotaSklopa-read	ProgramskaEnotaSklopa - branje	f
00030000-562a-3ba9-5117-5c24cb7e4c05	ProgramskaEnotaSklopa-write	ProgramskaEnotaSklopa - spreminjanje	f
00030000-562a-3ba9-5dd8-d64b3c9e82be	Prostor-read	Prostor - branje	f
00030000-562a-3ba9-c8a1-6978af5a47af	Prostor-write	Prostor - spreminjanje	f
00030000-562a-3ba9-9f56-010772e7e266	Racun-read	Racun - branje	f
00030000-562a-3ba9-dfa1-cf20ac99986d	Racun-write	Racun - spreminjanje	f
00030000-562a-3ba9-5631-3598fc3f1a24	RazpisanSedez-read	RazpisanSedez - branje	f
00030000-562a-3ba9-2fbd-2f84ea896499	RazpisanSedez-write	RazpisanSedez - spreminjanje	f
00030000-562a-3ba9-2bd5-e550a894f7b9	Rekviziterstvo-read	Rekviziterstvo - branje	f
00030000-562a-3ba9-ef9e-b0f9d38be1fa	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	f
00030000-562a-3ba9-d79a-21253115eb44	Rekvizit-read	Rekvizit - branje	f
00030000-562a-3ba9-3217-6657387ceaf2	Rekvizit-write	Rekvizit - spreminjanje	f
00030000-562a-3ba9-6c4d-9ac52334975f	Revizija-read	Revizija - branje	f
00030000-562a-3ba9-c4b4-44eaf9b2c8df	Revizija-write	Revizija - spreminjanje	f
00030000-562a-3ba9-60c4-1b0bc32f6bbc	Rezervacija-read	Rezervacija - branje	f
00030000-562a-3ba9-12f2-eb7485326f09	Rezervacija-write	Rezervacija - spreminjanje	f
00030000-562a-3ba9-9bfd-0138a5da616b	SedezniRed-read	SedezniRed - branje	f
00030000-562a-3ba9-55b2-cc9ed1e7a7ad	SedezniRed-write	SedezniRed - spreminjanje	f
00030000-562a-3ba9-324b-2d34f8919c3b	Sedez-read	Sedez - branje	f
00030000-562a-3ba9-f83e-0eded40d9661	Sedez-write	Sedez - spreminjanje	f
00030000-562a-3ba9-9afe-80ce827cf674	Sezona-read	Sezona - branje	f
00030000-562a-3ba9-8f2a-2a7710ba0f32	Sezona-write	Sezona - spreminjanje	f
00030000-562a-3ba9-d2b1-9ac2a0a8374e	StevilcenjeKonfig-read	StevilcenjeKonfig - branje	f
00030000-562a-3ba9-aeff-e0fc696046b6	StevilcenjeKonfig-write	StevilcenjeKonfig - spreminjanje	f
00030000-562a-3ba9-0ca1-4a4f42be7607	Stevilcenje-read	Stevilcenje - branje	f
00030000-562a-3ba9-fcf8-c5051c5a55d1	Stevilcenje-write	Stevilcenje - spreminjanje	f
00030000-562a-3ba9-d086-997d25bdd9ad	StevilcenjeStanje-read	StevilcenjeStanje - branje	f
00030000-562a-3ba9-bbbd-37fd46c15adc	StevilcenjeStanje-write	StevilcenjeStanje - spreminjanje	f
00030000-562a-3ba9-7876-f8c5774d54b1	StrosekUprizoritve-read	StrosekUprizoritve - branje	f
00030000-562a-3ba9-6dc0-dd1fe274fcec	StrosekUprizoritve-write	StrosekUprizoritve - spreminjanje	f
00030000-562a-3ba9-895b-a5ba396659f2	Telefonska-read	Telefonska - branje	f
00030000-562a-3ba9-05b6-2494373cd59c	Telefonska-write	Telefonska - spreminjanje	f
00030000-562a-3ba9-fd21-21f7bbc126b6	TerminStoritve-read	TerminStoritve - branje	f
00030000-562a-3ba9-c764-20320cce90b8	TerminStoritve-write	TerminStoritve - spreminjanje	f
00030000-562a-3ba9-fbc8-800eaf0b1c33	TipFunkcije-read	TipFunkcije - branje	f
00030000-562a-3ba9-1f57-daafc874b5a0	TipFunkcije-write	TipFunkcije - spreminjanje	f
00030000-562a-3ba9-89f6-d9d212095a74	TipPopa-read	TipPopa - branje	f
00030000-562a-3ba9-379b-223d65befc26	TipPopa-write	TipPopa - spreminjanje	f
00030000-562a-3ba9-e61b-aa9a3b1bf6ef	TipProgramskeEnote-read	TipProgramskeEnote - branje	f
00030000-562a-3ba9-8de9-8b48295e0d4b	TipProgramskeEnote-write	TipProgramskeEnote - spreminjanje	f
00030000-562a-3ba9-9865-4462819c2bd8	TipVaje-read	TipVaje - branje	f
00030000-562a-3ba9-eb9b-416803893788	TipVaje-write	TipVaje - spreminjanje	f
00030000-562a-3ba9-891c-b97e690f72df	Trr-read	Trr - branje	f
00030000-562a-3ba9-727d-1c2245843658	Trr-write	Trr - spreminjanje	f
00030000-562a-3ba9-01f8-b26501a30b39	Uprizoritev-read	Uprizoritev - branje	f
00030000-562a-3ba9-e2f5-786d303f82f7	Uprizoritev-write	Uprizoritev - spreminjanje	f
00030000-562a-3ba9-a985-9db49af972d3	Vaja-read	Vaja - branje	f
00030000-562a-3ba9-964d-a3a866ffa890	Vaja-write	Vaja - spreminjanje	f
00030000-562a-3ba9-f468-f3a2fddfd3f2	VrstaSedezev-read	VrstaSedezev - branje	f
00030000-562a-3ba9-e94c-3620b1bc997f	VrstaSedezev-write	VrstaSedezev - spreminjanje	f
00030000-562a-3ba9-03e9-97c4a91452aa	VrstaStroska-read	VrstaStroska - branje	f
00030000-562a-3ba9-6f83-9730673fd510	VrstaStroska-write	VrstaStroska - spreminjanje	f
00030000-562a-3ba9-4744-c7007e2c9ec8	Zaposlitev-read	Zaposlitev - branje	f
00030000-562a-3ba9-cef2-e4656da5841c	Zaposlitev-write	Zaposlitev - spreminjanje	f
00030000-562a-3ba9-71f8-ae58be0e5183	Zasedenost-read	Zasedenost - branje	f
00030000-562a-3ba9-4713-b280848cefe3	Zasedenost-write	Zasedenost - spreminjanje	f
00030000-562a-3ba9-5db0-d6ae89a3a689	ZvrstSurs-read	ZvrstSurs - branje	f
00030000-562a-3ba9-96e0-ff02f468c68e	ZvrstSurs-write	ZvrstSurs - spreminjanje	f
00030000-562a-3ba9-dd9b-0028241d6274	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	f
00030000-562a-3ba9-6a62-13906832285e	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	f
00030000-562a-3ba9-bd11-dd9cacd60d27	Job-read	Branje opravil - samo zase - branje	f
00030000-562a-3ba9-1400-04ac51bf8c1f	Job-write	Dodajanje in spreminjanje opravil - samo zase	f
00030000-562a-3ba9-55bd-7f3ca83febf2	Job-admin	Upravljanje opravil za vse uporabnike	f
00030000-562a-3ba9-c256-f7dfb249001d	Mapa-write	Mapa - osnovno dovoljenje za pisanje	f
00030000-562a-3ba9-07dc-b58674d5ddaa	Mapa-read	Mapa - osnovno dovoljenje za branje	f
00030000-562a-3ba9-7d61-34c3ca2a7af0	MapaAcl-write	MapaAcl - dovoljenje za dostop pisanje ACL-jev mape	f
00030000-562a-3ba9-1446-3f81803b587a	MapaAcl-read	MapaAcl - dovoljenje za dostop branje ACL-jev mape	f
00030000-562a-3ba9-f391-145922351e90	Zapis-write	Zapis - dovoljenje za pisanje zapisov	f
00030000-562a-3ba9-8c22-47d42075716d	Zapis-read	Zapis - dovoljenje za pisanje zapisov	f
00030000-562a-3ba9-9457-b32582ceaa4c	ZapisLastnik-write	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	f
00030000-562a-3ba9-91d9-fbbab26b1f7f	ZapisLastnik-read	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	f
00030000-562a-3ba9-92b7-a660b268c51a	VrstaZapisa-write	Šifrant vrst zapisa - spreminjanje	f
00030000-562a-3ba9-903c-f138f9105c76	VrstaZapisa-read	Šifrant vrst zapisa - branje	f
00030000-562a-3ba9-3da7-bb53c4031b84	Datoteka-write	Datoteka - spreminjanje	f
00030000-562a-3ba9-29da-230d29255519	Datoteka-read	Datoteke - branje	f
\.


--
-- TOC entry 3057 (class 0 OID 23279485)
-- Dependencies: 179
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-562a-3ba9-090f-c34648fe2c24	00030000-562a-3ba9-557c-9d226439be5a
00020000-562a-3ba9-ad2a-b8c79db58ef0	00030000-562a-3ba9-6215-5fc55e34088b
00020000-562a-3ba9-2062-4b81875bd707	00030000-562a-3ba9-ae20-2cf01a668575
00020000-562a-3ba9-2062-4b81875bd707	00030000-562a-3ba9-7e09-c2f127bdbc6d
00020000-562a-3ba9-2062-4b81875bd707	00030000-562a-3ba9-dbb9-7f40936d885f
00020000-562a-3ba9-2062-4b81875bd707	00030000-562a-3ba9-5c69-5cd300cce4e7
00020000-562a-3ba9-2062-4b81875bd707	00030000-562a-3ba9-2ef8-6c9280c0172f
00020000-562a-3ba9-2062-4b81875bd707	00030000-562a-3ba9-6392-d9091c0416f4
00020000-562a-3ba9-2062-4b81875bd707	00030000-562a-3ba9-27a7-05a872c2ec0c
00020000-562a-3ba9-2062-4b81875bd707	00030000-562a-3ba9-1952-92bbd35b385b
00020000-562a-3ba9-2062-4b81875bd707	00030000-562a-3ba9-6215-5fc55e34088b
00020000-562a-3ba9-2062-4b81875bd707	00030000-562a-3ba9-edbd-ab3185632b35
00020000-562a-3ba9-2062-4b81875bd707	00030000-562a-3ba9-3ff8-123e2e87c156
00020000-562a-3ba9-2062-4b81875bd707	00030000-562a-3ba9-390c-d9aad07ec732
00020000-562a-3ba9-2062-4b81875bd707	00030000-562a-3ba9-7367-160816670c00
00020000-562a-3ba9-2062-4b81875bd707	00030000-562a-3ba9-eef6-cd69a71f7197
00020000-562a-3ba9-2062-4b81875bd707	00030000-562a-3ba9-6541-0ae4b8917c09
00020000-562a-3ba9-2062-4b81875bd707	00030000-562a-3ba9-aff7-ea2010fda665
00020000-562a-3ba9-2062-4b81875bd707	00030000-562a-3ba9-da59-2c090f392610
00020000-562a-3ba9-2062-4b81875bd707	00030000-562a-3ba9-dc44-a804b2944d19
00020000-562a-3ba9-2062-4b81875bd707	00030000-562a-3ba9-1e8f-c85e0608e9c2
00020000-562a-3ba9-2062-4b81875bd707	00030000-562a-3ba9-20f7-bd3061a2d24d
00020000-562a-3ba9-2062-4b81875bd707	00030000-562a-3ba9-b584-8bd90ecab5dd
00020000-562a-3ba9-2062-4b81875bd707	00030000-562a-3ba9-7c67-7750dddc0f8f
00020000-562a-3ba9-2062-4b81875bd707	00030000-562a-3ba9-2dd0-40bf1ce07282
00020000-562a-3ba9-2062-4b81875bd707	00030000-562a-3ba9-53ec-f6e1e91a6eec
00020000-562a-3ba9-2062-4b81875bd707	00030000-562a-3ba9-06e8-18ac4953f674
00020000-562a-3ba9-2062-4b81875bd707	00030000-562a-3ba9-c376-95614b04caf2
00020000-562a-3ba9-2062-4b81875bd707	00030000-562a-3ba9-f488-ff1d45a5d601
00020000-562a-3ba9-2062-4b81875bd707	00030000-562a-3ba9-8605-ffd454307838
00020000-562a-3ba9-2062-4b81875bd707	00030000-562a-3ba9-960a-c89462b1bfd5
00020000-562a-3ba9-2062-4b81875bd707	00030000-562a-3ba9-8908-15845a3e6b13
00020000-562a-3ba9-2062-4b81875bd707	00030000-562a-3ba9-fe02-325205805e16
00020000-562a-3ba9-2062-4b81875bd707	00030000-562a-3ba9-e479-e8437ee8f376
00020000-562a-3ba9-2062-4b81875bd707	00030000-562a-3ba9-5dd8-d64b3c9e82be
00020000-562a-3ba9-2062-4b81875bd707	00030000-562a-3ba9-c8a1-6978af5a47af
00020000-562a-3ba9-2062-4b81875bd707	00030000-562a-3ba9-2bd5-e550a894f7b9
00020000-562a-3ba9-2062-4b81875bd707	00030000-562a-3ba9-ef9e-b0f9d38be1fa
00020000-562a-3ba9-2062-4b81875bd707	00030000-562a-3ba9-d79a-21253115eb44
00020000-562a-3ba9-2062-4b81875bd707	00030000-562a-3ba9-3217-6657387ceaf2
00020000-562a-3ba9-2062-4b81875bd707	00030000-562a-3ba9-9afe-80ce827cf674
00020000-562a-3ba9-2062-4b81875bd707	00030000-562a-3ba9-8f2a-2a7710ba0f32
00020000-562a-3ba9-2062-4b81875bd707	00030000-562a-3ba9-fbc8-800eaf0b1c33
00020000-562a-3ba9-2062-4b81875bd707	00030000-562a-3ba9-01f8-b26501a30b39
00020000-562a-3ba9-2062-4b81875bd707	00030000-562a-3ba9-e2f5-786d303f82f7
00020000-562a-3ba9-2062-4b81875bd707	00030000-562a-3ba9-a985-9db49af972d3
00020000-562a-3ba9-2062-4b81875bd707	00030000-562a-3ba9-964d-a3a866ffa890
00020000-562a-3ba9-2062-4b81875bd707	00030000-562a-3ba9-71f8-ae58be0e5183
00020000-562a-3ba9-2062-4b81875bd707	00030000-562a-3ba9-4713-b280848cefe3
00020000-562a-3ba9-2062-4b81875bd707	00030000-562a-3ba9-5db0-d6ae89a3a689
00020000-562a-3ba9-2062-4b81875bd707	00030000-562a-3ba9-dd9b-0028241d6274
00020000-562a-3ba9-ff38-4554ced72bf5	00030000-562a-3ba9-ae20-2cf01a668575
00020000-562a-3ba9-ff38-4554ced72bf5	00030000-562a-3ba9-2ef8-6c9280c0172f
00020000-562a-3ba9-ff38-4554ced72bf5	00030000-562a-3ba9-6392-d9091c0416f4
00020000-562a-3ba9-ff38-4554ced72bf5	00030000-562a-3ba9-6215-5fc55e34088b
00020000-562a-3ba9-ff38-4554ced72bf5	00030000-562a-3ba9-7367-160816670c00
00020000-562a-3ba9-ff38-4554ced72bf5	00030000-562a-3ba9-6541-0ae4b8917c09
00020000-562a-3ba9-ff38-4554ced72bf5	00030000-562a-3ba9-da59-2c090f392610
00020000-562a-3ba9-ff38-4554ced72bf5	00030000-562a-3ba9-dc44-a804b2944d19
00020000-562a-3ba9-ff38-4554ced72bf5	00030000-562a-3ba9-1e8f-c85e0608e9c2
00020000-562a-3ba9-ff38-4554ced72bf5	00030000-562a-3ba9-20f7-bd3061a2d24d
00020000-562a-3ba9-ff38-4554ced72bf5	00030000-562a-3ba9-b584-8bd90ecab5dd
00020000-562a-3ba9-ff38-4554ced72bf5	00030000-562a-3ba9-7c67-7750dddc0f8f
00020000-562a-3ba9-ff38-4554ced72bf5	00030000-562a-3ba9-2dd0-40bf1ce07282
00020000-562a-3ba9-ff38-4554ced72bf5	00030000-562a-3ba9-06e8-18ac4953f674
00020000-562a-3ba9-ff38-4554ced72bf5	00030000-562a-3ba9-f488-ff1d45a5d601
00020000-562a-3ba9-ff38-4554ced72bf5	00030000-562a-3ba9-8605-ffd454307838
00020000-562a-3ba9-ff38-4554ced72bf5	00030000-562a-3ba9-960a-c89462b1bfd5
00020000-562a-3ba9-ff38-4554ced72bf5	00030000-562a-3ba9-5dd8-d64b3c9e82be
00020000-562a-3ba9-ff38-4554ced72bf5	00030000-562a-3ba9-2bd5-e550a894f7b9
00020000-562a-3ba9-ff38-4554ced72bf5	00030000-562a-3ba9-d79a-21253115eb44
00020000-562a-3ba9-ff38-4554ced72bf5	00030000-562a-3ba9-9afe-80ce827cf674
00020000-562a-3ba9-ff38-4554ced72bf5	00030000-562a-3ba9-895b-a5ba396659f2
00020000-562a-3ba9-ff38-4554ced72bf5	00030000-562a-3ba9-05b6-2494373cd59c
00020000-562a-3ba9-ff38-4554ced72bf5	00030000-562a-3ba9-891c-b97e690f72df
00020000-562a-3ba9-ff38-4554ced72bf5	00030000-562a-3ba9-727d-1c2245843658
00020000-562a-3ba9-ff38-4554ced72bf5	00030000-562a-3ba9-4744-c7007e2c9ec8
00020000-562a-3ba9-ff38-4554ced72bf5	00030000-562a-3ba9-cef2-e4656da5841c
00020000-562a-3ba9-ff38-4554ced72bf5	00030000-562a-3ba9-5db0-d6ae89a3a689
00020000-562a-3ba9-ff38-4554ced72bf5	00030000-562a-3ba9-dd9b-0028241d6274
00020000-562a-3ba9-dd6e-c75a34fd1d15	00030000-562a-3ba9-ae20-2cf01a668575
00020000-562a-3ba9-dd6e-c75a34fd1d15	00030000-562a-3ba9-dbb9-7f40936d885f
00020000-562a-3ba9-dd6e-c75a34fd1d15	00030000-562a-3ba9-2ef8-6c9280c0172f
00020000-562a-3ba9-dd6e-c75a34fd1d15	00030000-562a-3ba9-cbf8-b58a27413a59
00020000-562a-3ba9-dd6e-c75a34fd1d15	00030000-562a-3ba9-4382-c91cd0bac425
00020000-562a-3ba9-dd6e-c75a34fd1d15	00030000-562a-3ba9-ac38-46428423fe0a
00020000-562a-3ba9-dd6e-c75a34fd1d15	00030000-562a-3ba9-6392-d9091c0416f4
00020000-562a-3ba9-dd6e-c75a34fd1d15	00030000-562a-3ba9-6215-5fc55e34088b
00020000-562a-3ba9-dd6e-c75a34fd1d15	00030000-562a-3ba9-3ff8-123e2e87c156
00020000-562a-3ba9-dd6e-c75a34fd1d15	00030000-562a-3ba9-7367-160816670c00
00020000-562a-3ba9-dd6e-c75a34fd1d15	00030000-562a-3ba9-6541-0ae4b8917c09
00020000-562a-3ba9-dd6e-c75a34fd1d15	00030000-562a-3ba9-da59-2c090f392610
00020000-562a-3ba9-dd6e-c75a34fd1d15	00030000-562a-3ba9-1e8f-c85e0608e9c2
00020000-562a-3ba9-dd6e-c75a34fd1d15	00030000-562a-3ba9-20f7-bd3061a2d24d
00020000-562a-3ba9-dd6e-c75a34fd1d15	00030000-562a-3ba9-b584-8bd90ecab5dd
00020000-562a-3ba9-dd6e-c75a34fd1d15	00030000-562a-3ba9-2dd0-40bf1ce07282
00020000-562a-3ba9-dd6e-c75a34fd1d15	00030000-562a-3ba9-06e8-18ac4953f674
00020000-562a-3ba9-dd6e-c75a34fd1d15	00030000-562a-3ba9-960a-c89462b1bfd5
00020000-562a-3ba9-dd6e-c75a34fd1d15	00030000-562a-3ba9-fe02-325205805e16
00020000-562a-3ba9-dd6e-c75a34fd1d15	00030000-562a-3ba9-5dd8-d64b3c9e82be
00020000-562a-3ba9-dd6e-c75a34fd1d15	00030000-562a-3ba9-2bd5-e550a894f7b9
00020000-562a-3ba9-dd6e-c75a34fd1d15	00030000-562a-3ba9-d79a-21253115eb44
00020000-562a-3ba9-dd6e-c75a34fd1d15	00030000-562a-3ba9-9afe-80ce827cf674
00020000-562a-3ba9-dd6e-c75a34fd1d15	00030000-562a-3ba9-fbc8-800eaf0b1c33
00020000-562a-3ba9-dd6e-c75a34fd1d15	00030000-562a-3ba9-a985-9db49af972d3
00020000-562a-3ba9-dd6e-c75a34fd1d15	00030000-562a-3ba9-71f8-ae58be0e5183
00020000-562a-3ba9-dd6e-c75a34fd1d15	00030000-562a-3ba9-5db0-d6ae89a3a689
00020000-562a-3ba9-dd6e-c75a34fd1d15	00030000-562a-3ba9-dd9b-0028241d6274
00020000-562a-3ba9-5d26-44f2067aa960	00030000-562a-3ba9-ae20-2cf01a668575
00020000-562a-3ba9-5d26-44f2067aa960	00030000-562a-3ba9-7e09-c2f127bdbc6d
00020000-562a-3ba9-5d26-44f2067aa960	00030000-562a-3ba9-5c69-5cd300cce4e7
00020000-562a-3ba9-5d26-44f2067aa960	00030000-562a-3ba9-2ef8-6c9280c0172f
00020000-562a-3ba9-5d26-44f2067aa960	00030000-562a-3ba9-6392-d9091c0416f4
00020000-562a-3ba9-5d26-44f2067aa960	00030000-562a-3ba9-6215-5fc55e34088b
00020000-562a-3ba9-5d26-44f2067aa960	00030000-562a-3ba9-7367-160816670c00
00020000-562a-3ba9-5d26-44f2067aa960	00030000-562a-3ba9-6541-0ae4b8917c09
00020000-562a-3ba9-5d26-44f2067aa960	00030000-562a-3ba9-1e8f-c85e0608e9c2
00020000-562a-3ba9-5d26-44f2067aa960	00030000-562a-3ba9-20f7-bd3061a2d24d
00020000-562a-3ba9-5d26-44f2067aa960	00030000-562a-3ba9-2dd0-40bf1ce07282
00020000-562a-3ba9-5d26-44f2067aa960	00030000-562a-3ba9-06e8-18ac4953f674
00020000-562a-3ba9-5d26-44f2067aa960	00030000-562a-3ba9-960a-c89462b1bfd5
00020000-562a-3ba9-5d26-44f2067aa960	00030000-562a-3ba9-5dd8-d64b3c9e82be
00020000-562a-3ba9-5d26-44f2067aa960	00030000-562a-3ba9-2bd5-e550a894f7b9
00020000-562a-3ba9-5d26-44f2067aa960	00030000-562a-3ba9-d79a-21253115eb44
00020000-562a-3ba9-5d26-44f2067aa960	00030000-562a-3ba9-9afe-80ce827cf674
00020000-562a-3ba9-5d26-44f2067aa960	00030000-562a-3ba9-fbc8-800eaf0b1c33
00020000-562a-3ba9-5d26-44f2067aa960	00030000-562a-3ba9-5db0-d6ae89a3a689
00020000-562a-3ba9-5d26-44f2067aa960	00030000-562a-3ba9-dd9b-0028241d6274
00020000-562a-3ba9-f84e-c71ba5133e10	00030000-562a-3ba9-ae20-2cf01a668575
00020000-562a-3ba9-f84e-c71ba5133e10	00030000-562a-3ba9-2ef8-6c9280c0172f
00020000-562a-3ba9-f84e-c71ba5133e10	00030000-562a-3ba9-6392-d9091c0416f4
00020000-562a-3ba9-f84e-c71ba5133e10	00030000-562a-3ba9-6215-5fc55e34088b
00020000-562a-3ba9-f84e-c71ba5133e10	00030000-562a-3ba9-7367-160816670c00
00020000-562a-3ba9-f84e-c71ba5133e10	00030000-562a-3ba9-6541-0ae4b8917c09
00020000-562a-3ba9-f84e-c71ba5133e10	00030000-562a-3ba9-1e8f-c85e0608e9c2
00020000-562a-3ba9-f84e-c71ba5133e10	00030000-562a-3ba9-20f7-bd3061a2d24d
00020000-562a-3ba9-f84e-c71ba5133e10	00030000-562a-3ba9-2dd0-40bf1ce07282
00020000-562a-3ba9-f84e-c71ba5133e10	00030000-562a-3ba9-06e8-18ac4953f674
00020000-562a-3ba9-f84e-c71ba5133e10	00030000-562a-3ba9-960a-c89462b1bfd5
00020000-562a-3ba9-f84e-c71ba5133e10	00030000-562a-3ba9-5dd8-d64b3c9e82be
00020000-562a-3ba9-f84e-c71ba5133e10	00030000-562a-3ba9-2bd5-e550a894f7b9
00020000-562a-3ba9-f84e-c71ba5133e10	00030000-562a-3ba9-d79a-21253115eb44
00020000-562a-3ba9-f84e-c71ba5133e10	00030000-562a-3ba9-9afe-80ce827cf674
00020000-562a-3ba9-f84e-c71ba5133e10	00030000-562a-3ba9-fd21-21f7bbc126b6
00020000-562a-3ba9-f84e-c71ba5133e10	00030000-562a-3ba9-f538-675c34675fcf
00020000-562a-3ba9-f84e-c71ba5133e10	00030000-562a-3ba9-fbc8-800eaf0b1c33
00020000-562a-3ba9-f84e-c71ba5133e10	00030000-562a-3ba9-5db0-d6ae89a3a689
00020000-562a-3ba9-f84e-c71ba5133e10	00030000-562a-3ba9-dd9b-0028241d6274
00020000-562a-3bab-2fe2-bfcf9248a863	00030000-562a-3ba9-92ca-c2fb27058ee0
00020000-562a-3bab-2fe2-bfcf9248a863	00030000-562a-3ba9-557c-9d226439be5a
00020000-562a-3bab-2fe2-bfcf9248a863	00030000-562a-3ba9-ae20-2cf01a668575
00020000-562a-3bab-2fe2-bfcf9248a863	00030000-562a-3ba9-7e09-c2f127bdbc6d
00020000-562a-3bab-2fe2-bfcf9248a863	00030000-562a-3ba9-dbb9-7f40936d885f
00020000-562a-3bab-2fe2-bfcf9248a863	00030000-562a-3ba9-5c69-5cd300cce4e7
00020000-562a-3bab-2fe2-bfcf9248a863	00030000-562a-3ba9-2ef8-6c9280c0172f
00020000-562a-3bab-2fe2-bfcf9248a863	00030000-562a-3ba9-cbf8-b58a27413a59
00020000-562a-3bab-2fe2-bfcf9248a863	00030000-562a-3ba9-38f9-daf48edb5fa4
00020000-562a-3bab-2fe2-bfcf9248a863	00030000-562a-3ba9-991c-5f5b156c4d23
00020000-562a-3bab-2fe2-bfcf9248a863	00030000-562a-3ba9-4382-c91cd0bac425
00020000-562a-3bab-2fe2-bfcf9248a863	00030000-562a-3ba9-854d-13d275df963f
00020000-562a-3bab-2fe2-bfcf9248a863	00030000-562a-3ba9-ac38-46428423fe0a
00020000-562a-3bab-2fe2-bfcf9248a863	00030000-562a-3ba9-d281-4fb679dc1796
00020000-562a-3bab-2fe2-bfcf9248a863	00030000-562a-3ba9-6392-d9091c0416f4
00020000-562a-3bab-2fe2-bfcf9248a863	00030000-562a-3ba9-27a7-05a872c2ec0c
00020000-562a-3bab-2fe2-bfcf9248a863	00030000-562a-3ba9-1952-92bbd35b385b
00020000-562a-3bab-2fe2-bfcf9248a863	00030000-562a-3ba9-52d2-44437d55d001
00020000-562a-3bab-2fe2-bfcf9248a863	00030000-562a-3ba9-ee6a-a50293772608
00020000-562a-3bab-2fe2-bfcf9248a863	00030000-562a-3ba9-6215-5fc55e34088b
00020000-562a-3bab-2fe2-bfcf9248a863	00030000-562a-3ba9-edbd-ab3185632b35
00020000-562a-3bab-2fe2-bfcf9248a863	00030000-562a-3ba9-2a63-567563e9bb84
00020000-562a-3bab-2fe2-bfcf9248a863	00030000-562a-3ba9-9cb6-9cabb43f0b36
00020000-562a-3bab-2fe2-bfcf9248a863	00030000-562a-3ba9-3ff8-123e2e87c156
00020000-562a-3bab-2fe2-bfcf9248a863	00030000-562a-3ba9-390c-d9aad07ec732
00020000-562a-3bab-2fe2-bfcf9248a863	00030000-562a-3ba9-7367-160816670c00
00020000-562a-3bab-2fe2-bfcf9248a863	00030000-562a-3ba9-eef6-cd69a71f7197
00020000-562a-3bab-2fe2-bfcf9248a863	00030000-562a-3ba9-6541-0ae4b8917c09
00020000-562a-3bab-2fe2-bfcf9248a863	00030000-562a-3ba9-aff7-ea2010fda665
00020000-562a-3bab-2fe2-bfcf9248a863	00030000-562a-3ba9-da59-2c090f392610
00020000-562a-3bab-2fe2-bfcf9248a863	00030000-562a-3ba9-dc44-a804b2944d19
00020000-562a-3bab-2fe2-bfcf9248a863	00030000-562a-3ba9-2af2-7f2d3bca5e0b
00020000-562a-3bab-2fe2-bfcf9248a863	00030000-562a-3ba9-085f-14f4f1629d11
00020000-562a-3bab-2fe2-bfcf9248a863	00030000-562a-3ba9-c272-06240c3e12fd
00020000-562a-3bab-2fe2-bfcf9248a863	00030000-562a-3ba9-5b65-13109db34110
00020000-562a-3bab-2fe2-bfcf9248a863	00030000-562a-3ba9-1e8f-c85e0608e9c2
00020000-562a-3bab-2fe2-bfcf9248a863	00030000-562a-3ba9-20f7-bd3061a2d24d
00020000-562a-3bab-2fe2-bfcf9248a863	00030000-562a-3ba9-6aff-05ee858658f8
00020000-562a-3bab-2fe2-bfcf9248a863	00030000-562a-3ba9-8926-86ff48968a5f
00020000-562a-3bab-2fe2-bfcf9248a863	00030000-562a-3ba9-b5cf-a114cb981a28
00020000-562a-3bab-2fe2-bfcf9248a863	00030000-562a-3ba9-e7d0-39a0b1bbc680
00020000-562a-3bab-2fe2-bfcf9248a863	00030000-562a-3ba9-b584-8bd90ecab5dd
00020000-562a-3bab-2fe2-bfcf9248a863	00030000-562a-3ba9-ceda-1a3d2cd5100b
00020000-562a-3bab-2fe2-bfcf9248a863	00030000-562a-3ba9-7c67-7750dddc0f8f
00020000-562a-3bab-2fe2-bfcf9248a863	00030000-562a-3ba9-a2b5-717420c13601
00020000-562a-3bab-2fe2-bfcf9248a863	00030000-562a-3ba9-f075-2f0d4529f651
00020000-562a-3bab-2fe2-bfcf9248a863	00030000-562a-3ba9-a075-4354b8a64464
00020000-562a-3bab-2fe2-bfcf9248a863	00030000-562a-3ba9-8cf1-7db53c19e496
00020000-562a-3bab-2fe2-bfcf9248a863	00030000-562a-3ba9-9891-c163b581cc2b
00020000-562a-3bab-2fe2-bfcf9248a863	00030000-562a-3ba9-6e54-54675fc3bd2f
00020000-562a-3bab-2fe2-bfcf9248a863	00030000-562a-3ba9-2dd0-40bf1ce07282
00020000-562a-3bab-2fe2-bfcf9248a863	00030000-562a-3ba9-53ec-f6e1e91a6eec
00020000-562a-3bab-2fe2-bfcf9248a863	00030000-562a-3ba9-06e8-18ac4953f674
00020000-562a-3bab-2fe2-bfcf9248a863	00030000-562a-3ba9-2880-1e0f253e1216
00020000-562a-3bab-2fe2-bfcf9248a863	00030000-562a-3ba9-1626-1a8c07823f42
00020000-562a-3bab-2fe2-bfcf9248a863	00030000-562a-3ba9-f5ae-1db12b5e1c55
00020000-562a-3bab-2fe2-bfcf9248a863	00030000-562a-3ba9-4cdb-77914743ae3b
00020000-562a-3bab-2fe2-bfcf9248a863	00030000-562a-3ba9-c376-95614b04caf2
00020000-562a-3bab-2fe2-bfcf9248a863	00030000-562a-3ba9-f488-ff1d45a5d601
00020000-562a-3bab-2fe2-bfcf9248a863	00030000-562a-3ba9-8605-ffd454307838
00020000-562a-3bab-2fe2-bfcf9248a863	00030000-562a-3ba9-3569-b8f184eaa3b9
00020000-562a-3bab-2fe2-bfcf9248a863	00030000-562a-3ba9-b54d-f2ac77973b6b
00020000-562a-3bab-2fe2-bfcf9248a863	00030000-562a-3ba9-960a-c89462b1bfd5
00020000-562a-3bab-2fe2-bfcf9248a863	00030000-562a-3ba9-8908-15845a3e6b13
00020000-562a-3bab-2fe2-bfcf9248a863	00030000-562a-3ba9-c3c8-46a91bc2338a
00020000-562a-3bab-2fe2-bfcf9248a863	00030000-562a-3ba9-2ba1-283d1afd7bc9
00020000-562a-3bab-2fe2-bfcf9248a863	00030000-562a-3ba9-dbae-bf860731d755
00020000-562a-3bab-2fe2-bfcf9248a863	00030000-562a-3ba9-46ec-527e76d327f0
00020000-562a-3bab-2fe2-bfcf9248a863	00030000-562a-3ba9-fe02-325205805e16
00020000-562a-3bab-2fe2-bfcf9248a863	00030000-562a-3ba9-e479-e8437ee8f376
00020000-562a-3bab-2fe2-bfcf9248a863	00030000-562a-3ba9-25d9-71aac89f20e4
00020000-562a-3bab-2fe2-bfcf9248a863	00030000-562a-3ba9-a171-cef5b0e57326
00020000-562a-3bab-2fe2-bfcf9248a863	00030000-562a-3ba9-0ec7-4a3aa95cbeb1
00020000-562a-3bab-2fe2-bfcf9248a863	00030000-562a-3ba9-a859-41f920637c1c
00020000-562a-3bab-2fe2-bfcf9248a863	00030000-562a-3ba9-ae4b-442909098029
00020000-562a-3bab-2fe2-bfcf9248a863	00030000-562a-3ba9-a39a-df21e74154cc
00020000-562a-3bab-2fe2-bfcf9248a863	00030000-562a-3ba9-5659-c11b8a861694
00020000-562a-3bab-2fe2-bfcf9248a863	00030000-562a-3ba9-e922-99e9001fa43b
00020000-562a-3bab-2fe2-bfcf9248a863	00030000-562a-3ba9-2b73-7bef1e43f0a9
00020000-562a-3bab-2fe2-bfcf9248a863	00030000-562a-3ba9-5298-30b8c246f48b
00020000-562a-3bab-2fe2-bfcf9248a863	00030000-562a-3ba9-781e-6cd0c0f458bc
00020000-562a-3bab-2fe2-bfcf9248a863	00030000-562a-3ba9-3392-9921bca15b24
00020000-562a-3bab-2fe2-bfcf9248a863	00030000-562a-3ba9-65d2-de1d7264fa87
00020000-562a-3bab-2fe2-bfcf9248a863	00030000-562a-3ba9-8e1e-82077c1d15bd
00020000-562a-3bab-2fe2-bfcf9248a863	00030000-562a-3ba9-3666-8fd429da02d1
00020000-562a-3bab-2fe2-bfcf9248a863	00030000-562a-3ba9-b35d-a5248e770d65
00020000-562a-3bab-2fe2-bfcf9248a863	00030000-562a-3ba9-67cc-08c07e97ac9f
00020000-562a-3bab-2fe2-bfcf9248a863	00030000-562a-3ba9-d507-8d0ec7503ffe
00020000-562a-3bab-2fe2-bfcf9248a863	00030000-562a-3ba9-370a-b95e7a4e1454
00020000-562a-3bab-2fe2-bfcf9248a863	00030000-562a-3ba9-e97a-ac958fb61232
00020000-562a-3bab-2fe2-bfcf9248a863	00030000-562a-3ba9-5bce-3bba3123effe
00020000-562a-3bab-2fe2-bfcf9248a863	00030000-562a-3ba9-5117-5c24cb7e4c05
00020000-562a-3bab-2fe2-bfcf9248a863	00030000-562a-3ba9-5dd8-d64b3c9e82be
00020000-562a-3bab-2fe2-bfcf9248a863	00030000-562a-3ba9-c8a1-6978af5a47af
00020000-562a-3bab-2fe2-bfcf9248a863	00030000-562a-3ba9-9f56-010772e7e266
00020000-562a-3bab-2fe2-bfcf9248a863	00030000-562a-3ba9-dfa1-cf20ac99986d
00020000-562a-3bab-2fe2-bfcf9248a863	00030000-562a-3ba9-5631-3598fc3f1a24
00020000-562a-3bab-2fe2-bfcf9248a863	00030000-562a-3ba9-2fbd-2f84ea896499
00020000-562a-3bab-2fe2-bfcf9248a863	00030000-562a-3ba9-2bd5-e550a894f7b9
00020000-562a-3bab-2fe2-bfcf9248a863	00030000-562a-3ba9-ef9e-b0f9d38be1fa
00020000-562a-3bab-2fe2-bfcf9248a863	00030000-562a-3ba9-d79a-21253115eb44
00020000-562a-3bab-2fe2-bfcf9248a863	00030000-562a-3ba9-3217-6657387ceaf2
00020000-562a-3bab-2fe2-bfcf9248a863	00030000-562a-3ba9-6c4d-9ac52334975f
00020000-562a-3bab-2fe2-bfcf9248a863	00030000-562a-3ba9-c4b4-44eaf9b2c8df
00020000-562a-3bab-2fe2-bfcf9248a863	00030000-562a-3ba9-60c4-1b0bc32f6bbc
00020000-562a-3bab-2fe2-bfcf9248a863	00030000-562a-3ba9-12f2-eb7485326f09
00020000-562a-3bab-2fe2-bfcf9248a863	00030000-562a-3ba9-9bfd-0138a5da616b
00020000-562a-3bab-2fe2-bfcf9248a863	00030000-562a-3ba9-55b2-cc9ed1e7a7ad
00020000-562a-3bab-2fe2-bfcf9248a863	00030000-562a-3ba9-324b-2d34f8919c3b
00020000-562a-3bab-2fe2-bfcf9248a863	00030000-562a-3ba9-f83e-0eded40d9661
00020000-562a-3bab-2fe2-bfcf9248a863	00030000-562a-3ba9-9afe-80ce827cf674
00020000-562a-3bab-2fe2-bfcf9248a863	00030000-562a-3ba9-8f2a-2a7710ba0f32
00020000-562a-3bab-2fe2-bfcf9248a863	00030000-562a-3ba9-d2b1-9ac2a0a8374e
00020000-562a-3bab-2fe2-bfcf9248a863	00030000-562a-3ba9-aeff-e0fc696046b6
00020000-562a-3bab-2fe2-bfcf9248a863	00030000-562a-3ba9-0ca1-4a4f42be7607
00020000-562a-3bab-2fe2-bfcf9248a863	00030000-562a-3ba9-d086-997d25bdd9ad
00020000-562a-3bab-2fe2-bfcf9248a863	00030000-562a-3ba9-bbbd-37fd46c15adc
00020000-562a-3bab-2fe2-bfcf9248a863	00030000-562a-3ba9-fcf8-c5051c5a55d1
00020000-562a-3bab-2fe2-bfcf9248a863	00030000-562a-3ba9-7876-f8c5774d54b1
00020000-562a-3bab-2fe2-bfcf9248a863	00030000-562a-3ba9-6dc0-dd1fe274fcec
00020000-562a-3bab-2fe2-bfcf9248a863	00030000-562a-3ba9-895b-a5ba396659f2
00020000-562a-3bab-2fe2-bfcf9248a863	00030000-562a-3ba9-05b6-2494373cd59c
00020000-562a-3bab-2fe2-bfcf9248a863	00030000-562a-3ba9-fd21-21f7bbc126b6
00020000-562a-3bab-2fe2-bfcf9248a863	00030000-562a-3ba9-f538-675c34675fcf
00020000-562a-3bab-2fe2-bfcf9248a863	00030000-562a-3ba9-c764-20320cce90b8
00020000-562a-3bab-2fe2-bfcf9248a863	00030000-562a-3ba9-fbc8-800eaf0b1c33
00020000-562a-3bab-2fe2-bfcf9248a863	00030000-562a-3ba9-1f57-daafc874b5a0
00020000-562a-3bab-2fe2-bfcf9248a863	00030000-562a-3ba9-89f6-d9d212095a74
00020000-562a-3bab-2fe2-bfcf9248a863	00030000-562a-3ba9-379b-223d65befc26
00020000-562a-3bab-2fe2-bfcf9248a863	00030000-562a-3ba9-e61b-aa9a3b1bf6ef
00020000-562a-3bab-2fe2-bfcf9248a863	00030000-562a-3ba9-8de9-8b48295e0d4b
00020000-562a-3bab-2fe2-bfcf9248a863	00030000-562a-3ba9-9865-4462819c2bd8
00020000-562a-3bab-2fe2-bfcf9248a863	00030000-562a-3ba9-eb9b-416803893788
00020000-562a-3bab-2fe2-bfcf9248a863	00030000-562a-3ba9-891c-b97e690f72df
00020000-562a-3bab-2fe2-bfcf9248a863	00030000-562a-3ba9-727d-1c2245843658
00020000-562a-3bab-2fe2-bfcf9248a863	00030000-562a-3ba9-01f8-b26501a30b39
00020000-562a-3bab-2fe2-bfcf9248a863	00030000-562a-3ba9-e2f5-786d303f82f7
00020000-562a-3bab-2fe2-bfcf9248a863	00030000-562a-3ba9-a985-9db49af972d3
00020000-562a-3bab-2fe2-bfcf9248a863	00030000-562a-3ba9-964d-a3a866ffa890
00020000-562a-3bab-2fe2-bfcf9248a863	00030000-562a-3ba9-f468-f3a2fddfd3f2
00020000-562a-3bab-2fe2-bfcf9248a863	00030000-562a-3ba9-e94c-3620b1bc997f
00020000-562a-3bab-2fe2-bfcf9248a863	00030000-562a-3ba9-03e9-97c4a91452aa
00020000-562a-3bab-2fe2-bfcf9248a863	00030000-562a-3ba9-6f83-9730673fd510
00020000-562a-3bab-2fe2-bfcf9248a863	00030000-562a-3ba9-4744-c7007e2c9ec8
00020000-562a-3bab-2fe2-bfcf9248a863	00030000-562a-3ba9-cef2-e4656da5841c
00020000-562a-3bab-2fe2-bfcf9248a863	00030000-562a-3ba9-71f8-ae58be0e5183
00020000-562a-3bab-2fe2-bfcf9248a863	00030000-562a-3ba9-4713-b280848cefe3
00020000-562a-3bab-2fe2-bfcf9248a863	00030000-562a-3ba9-5db0-d6ae89a3a689
00020000-562a-3bab-2fe2-bfcf9248a863	00030000-562a-3ba9-96e0-ff02f468c68e
00020000-562a-3bab-2fe2-bfcf9248a863	00030000-562a-3ba9-dd9b-0028241d6274
00020000-562a-3bab-2fe2-bfcf9248a863	00030000-562a-3ba9-6a62-13906832285e
\.


--
-- TOC entry 3091 (class 0 OID 23279860)
-- Dependencies: 213
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 3095 (class 0 OID 23279894)
-- Dependencies: 217
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 3107 (class 0 OID 23280031)
-- Dependencies: 229
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, zacetek, konec, jeavtorskepravice, placilonavajo, vrednostvaje, planiranostevilovaj, vrednostvaj, vrednostpredstave, procentodinkasa, jeprocentodinkasa, vrednostdopremiere, zaposlenvdrjz, samozaposlen, igralec, opis) FROM stdin;
000b0000-562a-3bab-ed82-e368b32362f3	00090000-562a-3bab-a7d8-44b67216ad11	\N	\N	0001	\N	\N	f	f	10.00	3	10.00	30.00	\N	f	10.00	t	f	t	Pogodba o sodelovanju
000b0000-562a-3bab-85e3-d4517198cb76	00090000-562a-3bab-d7fb-679ed7f64087	\N	\N	0002	\N	\N	f	t	11.00	10	11.00	31.00	\N	f	110.00	f	t	t	Pogodba za vlogo Helena
000b0000-562a-3bab-3131-27388264d2a7	00090000-562a-3bab-910a-3f663709275c	\N	\N	0003	\N	\N	f	f	12.00	4	12.00	0.00	\N	f	12.00	f	t	f	Pogodba za lektoriranje
000b0000-562a-3bab-5771-3a3fdd7bbfce	00090000-562a-3bab-831a-c2df7a9f3edf	\N	\N	0004	\N	\N	t	f	0.00	2	300.00	0.00	\N	f	300.00	f	t	f	Pogodba za avtorske pravice
\.


--
-- TOC entry 3063 (class 0 OID 23279558)
-- Dependencies: 185
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, tipkli_id, drzava_id, sifra, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo, nvo) FROM stdin;
00080000-562a-3bab-7daf-f9904876ecb8	\N	00040000-562a-3ba9-ac4a-5cd2a3229275	0988	AK	Juhuhu d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-562a-3bab-1884-2a3b74385b92	\N	00040000-562a-3ba9-ac4a-5cd2a3229275	0989	AK	Hopsasa d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	t
00080000-562a-3bab-de6e-998ff1c862dc	\N	00040000-562a-3ba9-ac4a-5cd2a3229275	0987	AK	Gledališče Šrum d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-562a-3bab-ae80-347f6a4038ae	\N	00040000-562a-3ba9-ac4a-5cd2a3229275	0986	AK	Lutkovni Direndaj d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-562a-3bab-ebf6-6168d6dd88b1	\N	00040000-562a-3ba9-ac4a-5cd2a3229275	0985	AK	Tatjana Stanič, Lektoriranje, s.p.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-562a-3bab-3348-a913d7d9e097	\N	00040000-562a-3ba9-fa7a-67dd0dfa9358	0984	AK	Gledališče Lepote tvoje		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-562a-3bab-ea55-d82678d744f5	\N	00040000-562a-3ba9-9785-e09e57792a89	0983	AK	Sunce naše		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-562a-3bab-46bb-6fb480506abd	\N	00040000-562a-3ba9-951a-4574ae52dfa3	0982	AK	Theater Amadeus		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-562a-3bab-0426-725338533863	\N	00040000-562a-3ba9-6c88-deea73c9bf81	9999	AK	Fuchs		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-562a-3bac-8dd2-34485cafa3e5	\N	00040000-562a-3ba9-ac4a-5cd2a3229275	1001	AK	Gledališče Matica		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
\.


--
-- TOC entry 3066 (class 0 OID 23279603)
-- Dependencies: 188
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-562a-3ba8-76c3-77d66a1107b1	8341	Adlešiči
00050000-562a-3ba8-bf69-d69da0825298	5270	Ajdovščina
00050000-562a-3ba8-f764-48fb7f4433c5	6280	Ankaran/Ancarano
00050000-562a-3ba8-12f7-d2b89ef0cb3d	9253	Apače
00050000-562a-3ba8-31b6-33097c493e67	8253	Artiče
00050000-562a-3ba8-c092-55e18c8ed157	4275	Begunje na Gorenjskem
00050000-562a-3ba8-d327-faeff01779f3	1382	Begunje pri Cerknici
00050000-562a-3ba8-e886-bc74893856bf	9231	Beltinci
00050000-562a-3ba8-886f-2ce6caf208de	2234	Benedikt
00050000-562a-3ba8-d346-cb32a59fea31	2345	Bistrica ob Dravi
00050000-562a-3ba8-bf89-36922d63cafb	3256	Bistrica ob Sotli
00050000-562a-3ba8-46a6-e6084df11116	8259	Bizeljsko
00050000-562a-3ba8-3442-bf5d8eaae4e1	1223	Blagovica
00050000-562a-3ba8-827a-b9bf83486e6a	8283	Blanca
00050000-562a-3ba8-dd03-a7089f67a98d	4260	Bled
00050000-562a-3ba8-0dc0-cee494c927f1	4273	Blejska Dobrava
00050000-562a-3ba8-6389-39389b7ddc22	9265	Bodonci
00050000-562a-3ba8-5db4-65015c1080eb	9222	Bogojina
00050000-562a-3ba8-28a9-4a5f53b4a7fc	4263	Bohinjska Bela
00050000-562a-3ba8-c803-9a4ef1cfca73	4264	Bohinjska Bistrica
00050000-562a-3ba8-eec0-087d6e3df016	4265	Bohinjsko jezero
00050000-562a-3ba8-39e4-0f7548e6a589	1353	Borovnica
00050000-562a-3ba8-4205-eb2aed2222d3	8294	Boštanj
00050000-562a-3ba8-3138-e30d78cfea94	5230	Bovec
00050000-562a-3ba8-20a9-9d21769a7516	5295	Branik
00050000-562a-3ba8-ea1b-4ca0f8483cdc	3314	Braslovče
00050000-562a-3ba8-7a50-2fd8e2258abc	5223	Breginj
00050000-562a-3ba8-510e-b03072efcaae	8280	Brestanica
00050000-562a-3ba8-8578-38075158c6b9	2354	Bresternica
00050000-562a-3ba8-d3ba-38a80c852338	4243	Brezje
00050000-562a-3ba8-e163-293b0d4b950f	1351	Brezovica pri Ljubljani
00050000-562a-3ba8-99da-023feaf107af	8250	Brežice
00050000-562a-3ba8-e2e6-698e3840d43b	4210	Brnik - Aerodrom
00050000-562a-3ba8-b58d-391ba4dbf318	8321	Brusnice
00050000-562a-3ba8-674b-0cd06cd32f13	3255	Buče
00050000-562a-3ba8-3bb2-c961282deedf	8276	Bučka 
00050000-562a-3ba8-19ad-a20fdb95b4b5	9261	Cankova
00050000-562a-3ba8-0cbd-a3bae9f64a84	3000	Celje 
00050000-562a-3ba8-ede9-161d8ab9ced9	3001	Celje - poštni predali
00050000-562a-3ba8-cc61-225609b3cb7e	4207	Cerklje na Gorenjskem
00050000-562a-3ba8-89b4-2c0db4023663	8263	Cerklje ob Krki
00050000-562a-3ba8-26c9-6cf45af5648c	1380	Cerknica
00050000-562a-3ba8-50d2-08e779fb2ee6	5282	Cerkno
00050000-562a-3ba8-feb5-38e62329c847	2236	Cerkvenjak
00050000-562a-3ba8-3e9c-07f545789234	2215	Ceršak
00050000-562a-3ba8-e1b7-b697301933d5	2326	Cirkovce
00050000-562a-3ba8-bb1b-4a8b2d9b28a1	2282	Cirkulane
00050000-562a-3ba8-d888-cafb4d080535	5273	Col
00050000-562a-3ba8-6891-4b90e098877a	8251	Čatež ob Savi
00050000-562a-3ba8-3dbc-5db5021e7d5b	1413	Čemšenik
00050000-562a-3ba8-248b-c15ddde23bd6	5253	Čepovan
00050000-562a-3ba8-6387-7c96c9910937	9232	Črenšovci
00050000-562a-3ba8-16f1-45c4e0bec2d9	2393	Črna na Koroškem
00050000-562a-3ba8-a1db-aa37b67f251e	6275	Črni Kal
00050000-562a-3ba8-0459-3e66ce13d5f3	5274	Črni Vrh nad Idrijo
00050000-562a-3ba8-7132-137a0d9065c1	5262	Črniče
00050000-562a-3ba8-7f07-01608d882623	8340	Črnomelj
00050000-562a-3ba8-b7af-d5efcd892971	6271	Dekani
00050000-562a-3ba8-e3ba-b2740b661410	5210	Deskle
00050000-562a-3ba8-f54e-fcc33b8523da	2253	Destrnik
00050000-562a-3ba8-31d1-5ec573910a09	6215	Divača
00050000-562a-3ba8-cce7-604a06d84ee4	1233	Dob
00050000-562a-3ba8-c83c-3c50ccdc9d10	3224	Dobje pri Planini
00050000-562a-3ba8-4f36-258b9cc62d91	8257	Dobova
00050000-562a-3ba8-a345-d5c5b622c1ed	1423	Dobovec
00050000-562a-3ba8-8fea-bd47075f52e8	5263	Dobravlje
00050000-562a-3ba8-06a8-3981d5173c7e	3204	Dobrna
00050000-562a-3ba8-fb96-682853ca72a2	8211	Dobrnič
00050000-562a-3ba8-9a57-dce94022ea9e	1356	Dobrova
00050000-562a-3ba8-cccf-12bbd799c879	9223	Dobrovnik/Dobronak 
00050000-562a-3ba8-47ca-504298a430bd	5212	Dobrovo v Brdih
00050000-562a-3ba8-3411-75d5d0f2f666	1431	Dol pri Hrastniku
00050000-562a-3ba8-2b84-f827577a710c	1262	Dol pri Ljubljani
00050000-562a-3ba8-1bd3-3be70a631fd8	1273	Dole pri Litiji
00050000-562a-3ba8-0d97-d3dec10988e4	1331	Dolenja vas
00050000-562a-3ba8-fae8-65389d48f682	8350	Dolenjske Toplice
00050000-562a-3ba8-97bd-e656e071d5d3	1230	Domžale
00050000-562a-3ba8-bfb4-6470c2ee11fa	2252	Dornava
00050000-562a-3ba8-8820-d71ea2e3776a	5294	Dornberk
00050000-562a-3ba8-c7a2-b2ea53a6172b	1319	Draga
00050000-562a-3ba8-503e-e348a12a694e	8343	Dragatuš
00050000-562a-3ba8-ec92-723c28c6d839	3222	Dramlje
00050000-562a-3ba8-475e-fa751c34bcd0	2370	Dravograd
00050000-562a-3ba8-822c-f7a2962e82d0	4203	Duplje
00050000-562a-3ba8-8686-1641fd2c4992	6221	Dutovlje
00050000-562a-3ba8-7396-9833c7e3cff1	8361	Dvor
00050000-562a-3ba8-cb23-15989081f5d1	2343	Fala
00050000-562a-3ba8-d45e-c9f1bdb9ee24	9208	Fokovci
00050000-562a-3ba8-8567-d0956daa772d	2313	Fram
00050000-562a-3ba8-8143-e36cfca10134	3213	Frankolovo
00050000-562a-3ba8-6f28-1f9b02f572f3	1274	Gabrovka
00050000-562a-3ba8-cb3e-eb4e09d72040	8254	Globoko
00050000-562a-3ba8-23a4-afc3cf16f188	5275	Godovič
00050000-562a-3ba8-e53c-fa7daf7232d1	4204	Golnik
00050000-562a-3ba8-8da1-24d0370fbf9e	3303	Gomilsko
00050000-562a-3ba8-08e9-5cb237a28464	4224	Gorenja vas
00050000-562a-3ba8-7c3c-38e7b11bf52c	3263	Gorica pri Slivnici
00050000-562a-3ba8-fe8c-857a574d8091	2272	Gorišnica
00050000-562a-3ba8-442e-7ca0539339cf	9250	Gornja Radgona
00050000-562a-3ba8-df0c-67aa14e3a770	3342	Gornji Grad
00050000-562a-3ba8-2e1d-b48b7d5cb71a	4282	Gozd Martuljek
00050000-562a-3ba8-0a8b-d731d5a5364c	6272	Gračišče
00050000-562a-3ba8-8283-f204470f8e55	9264	Grad
00050000-562a-3ba8-6808-c8ede99cb537	8332	Gradac
00050000-562a-3ba8-86f0-52cf76d536ce	1384	Grahovo
00050000-562a-3ba8-7c39-d1c95a917cf2	5242	Grahovo ob Bači
00050000-562a-3ba8-874f-08dee2b9f363	5251	Grgar
00050000-562a-3ba8-93ae-81e1562aaf5f	3302	Griže
00050000-562a-3ba8-4f6d-0243f4492568	3231	Grobelno
00050000-562a-3ba8-7b23-68eacbc61a3f	1290	Grosuplje
00050000-562a-3ba8-5bed-459b023fe6f3	2288	Hajdina
00050000-562a-3ba8-fb44-fb4ed851049d	8362	Hinje
00050000-562a-3ba8-4bf8-8e180d710d21	2311	Hoče
00050000-562a-3ba8-4ea8-72a98783b24b	9205	Hodoš/Hodos
00050000-562a-3ba8-3524-3cd4a677bb28	1354	Horjul
00050000-562a-3ba8-b527-30a88030adf1	1372	Hotedršica
00050000-562a-3ba8-c6a4-3f970423e0aa	1430	Hrastnik
00050000-562a-3ba8-0bd3-0c26e1aa163a	6225	Hruševje
00050000-562a-3ba8-684e-270c1b8f9f40	4276	Hrušica
00050000-562a-3ba8-77a6-6605f8d8336c	5280	Idrija
00050000-562a-3ba8-d1ed-3d42109e9bec	1292	Ig
00050000-562a-3ba8-cff7-d8bfef51c37a	6250	Ilirska Bistrica
00050000-562a-3ba8-a66f-d065e7705836	6251	Ilirska Bistrica-Trnovo
00050000-562a-3ba8-ad7d-513fd241cfd4	1295	Ivančna Gorica
00050000-562a-3ba8-4a0a-e1407bab9f9d	2259	Ivanjkovci
00050000-562a-3ba8-f50d-6c093535cba2	1411	Izlake
00050000-562a-3ba8-334d-7b3ed0ded5d5	6310	Izola/Isola
00050000-562a-3ba8-bd88-49e749c5c3b0	2222	Jakobski Dol
00050000-562a-3ba8-0e23-7e6fb696b134	2221	Jarenina
00050000-562a-3ba8-a804-90ccb52d6655	6254	Jelšane
00050000-562a-3ba8-1512-07e9f8e37b00	4270	Jesenice
00050000-562a-3ba8-f540-791803d891bc	8261	Jesenice na Dolenjskem
00050000-562a-3ba8-f444-5d48eea22aba	3273	Jurklošter
00050000-562a-3ba8-9194-64be21ee0e0d	2223	Jurovski Dol
00050000-562a-3ba8-e8f9-2584ae0ec722	2256	Juršinci
00050000-562a-3ba8-144f-ceaf7f593039	5214	Kal nad Kanalom
00050000-562a-3ba8-22c7-ba0ae0e04952	3233	Kalobje
00050000-562a-3ba8-8709-0da99be6a306	4246	Kamna Gorica
00050000-562a-3ba8-df58-e1cb52338c15	2351	Kamnica
00050000-562a-3ba8-8f27-9a5c0fc5bd41	1241	Kamnik
00050000-562a-3ba8-4570-ba8656da0f46	5213	Kanal
00050000-562a-3ba8-10d5-c7d062fab09d	8258	Kapele
00050000-562a-3ba8-6bd1-782fe9c72ace	2362	Kapla
00050000-562a-3ba8-1fc0-118cb8fb155a	2325	Kidričevo
00050000-562a-3ba8-6b88-eef4a5a27199	1412	Kisovec
00050000-562a-3ba8-7633-8ad6ed21b7f6	6253	Knežak
00050000-562a-3ba8-7848-43ec708b39c9	5222	Kobarid
00050000-562a-3ba8-37e7-223ffbe8187f	9227	Kobilje
00050000-562a-3ba8-a376-4d19dc3c331a	1330	Kočevje
00050000-562a-3ba8-a4c8-de5467a8576c	1338	Kočevska Reka
00050000-562a-3ba8-6712-4bd66dbb6fa2	2276	Kog
00050000-562a-3ba8-5ab5-011dcd967b39	5211	Kojsko
00050000-562a-3ba8-853f-e7854119fed5	6223	Komen
00050000-562a-3ba8-27b2-3f27bc66f0fd	1218	Komenda
00050000-562a-3ba8-f3ac-6c62a7efe97c	6000	Koper/Capodistria 
00050000-562a-3ba8-ea58-68cfb530b5c5	6001	Koper/Capodistria - poštni predali
00050000-562a-3ba8-5c4d-6b233b02fee6	8282	Koprivnica
00050000-562a-3ba8-3c18-733791c39935	5296	Kostanjevica na Krasu
00050000-562a-3ba8-6d96-549e0aa72b40	8311	Kostanjevica na Krki
00050000-562a-3ba8-1b5f-875cf63588bb	1336	Kostel
00050000-562a-3ba8-80fe-1d8e939794e5	6256	Košana
00050000-562a-3ba8-e0c9-625a4c3db04f	2394	Kotlje
00050000-562a-3ba8-e037-34c12dc56822	6240	Kozina
00050000-562a-3ba8-75b8-e447e2d5399e	3260	Kozje
00050000-562a-3ba8-1028-40c4b2aff61f	4000	Kranj 
00050000-562a-3ba8-1592-2ef0fdfaf8a7	4001	Kranj - poštni predali
00050000-562a-3ba8-feee-132635f22f5a	4280	Kranjska Gora
00050000-562a-3ba8-967b-3ba34645122f	1281	Kresnice
00050000-562a-3ba8-80a6-e7ee4eb942e4	4294	Križe
00050000-562a-3ba8-48ae-1340cfbc1d1a	9206	Križevci
00050000-562a-3ba8-7b44-24f0c4de439d	9242	Križevci pri Ljutomeru
00050000-562a-3ba8-c8a9-31928123d41a	1301	Krka
00050000-562a-3ba8-6e7d-ef1a71e1c1a2	8296	Krmelj
00050000-562a-3ba8-0b81-beb92c14e229	4245	Kropa
00050000-562a-3ba8-f8f0-3d240545f82d	8262	Krška vas
00050000-562a-3ba8-d4f8-d69b5f952d52	8270	Krško
00050000-562a-3ba8-0b64-02d8d45eefff	9263	Kuzma
00050000-562a-3ba8-66d1-e1b197811de6	2318	Laporje
00050000-562a-3ba8-b73c-c89bab10d5d0	3270	Laško
00050000-562a-3ba8-836f-14a723ba6f68	1219	Laze v Tuhinju
00050000-562a-3ba8-2fcc-1851a3dca005	2230	Lenart v Slovenskih goricah
00050000-562a-3ba8-38b1-e6116469917c	9220	Lendava/Lendva
00050000-562a-3ba8-f37e-fbe1ba18de7b	4248	Lesce
00050000-562a-3ba8-b550-0721fe46d097	3261	Lesično
00050000-562a-3ba8-2c58-2cd1df7338ca	8273	Leskovec pri Krškem
00050000-562a-3ba8-426d-6b2a9c5af742	2372	Libeliče
00050000-562a-3ba8-e09b-88c392ca5a09	2341	Limbuš
00050000-562a-3ba8-f75f-479db0c9363b	1270	Litija
00050000-562a-3ba8-5b0d-a13fa40d5b67	3202	Ljubečna
00050000-562a-3ba8-eeb5-64125bc51d63	1000	Ljubljana 
00050000-562a-3ba8-ec7d-18fb18df3bde	1001	Ljubljana - poštni predali
00050000-562a-3ba8-c3d7-77f9dfdf9a92	1231	Ljubljana - Črnuče
00050000-562a-3ba8-c090-f3240fe0953f	1261	Ljubljana - Dobrunje
00050000-562a-3ba8-0f5f-d3fccf61d791	1260	Ljubljana - Polje
00050000-562a-3ba8-3aa5-edd89794872e	1210	Ljubljana - Šentvid
00050000-562a-3ba8-7c61-c6fdd0e4aae8	1211	Ljubljana - Šmartno
00050000-562a-3ba8-020b-2370c2e2e125	3333	Ljubno ob Savinji
00050000-562a-3ba8-706e-20832e1bb37a	9240	Ljutomer
00050000-562a-3ba8-c9f1-fce857af540c	3215	Loče
00050000-562a-3ba8-ff92-f1fb5cef9f27	5231	Log pod Mangartom
00050000-562a-3ba8-4010-3758f92207b5	1358	Log pri Brezovici
00050000-562a-3ba8-6278-aa9be17a7d1c	1370	Logatec
00050000-562a-3ba8-8194-e18b0600be51	1371	Logatec
00050000-562a-3ba8-bd96-eb423d4d3722	1434	Loka pri Zidanem Mostu
00050000-562a-3ba8-52f1-7373d1ddbdb8	3223	Loka pri Žusmu
00050000-562a-3ba8-3899-3a753e545709	6219	Lokev
00050000-562a-3ba8-a753-f8fd24896fbb	1318	Loški Potok
00050000-562a-3ba8-82fd-0a0407901356	2324	Lovrenc na Dravskem polju
00050000-562a-3ba8-1fa5-93bd4800041f	2344	Lovrenc na Pohorju
00050000-562a-3ba8-4692-5c111b086940	3334	Luče
00050000-562a-3ba8-5670-7a7e119ffd52	1225	Lukovica
00050000-562a-3ba8-521c-38e308ed4876	9202	Mačkovci
00050000-562a-3ba8-167b-5165ef260e7f	2322	Majšperk
00050000-562a-3ba8-ebe3-3e686028f8fd	2321	Makole
00050000-562a-3ba8-ea83-2a7ce414b435	9243	Mala Nedelja
00050000-562a-3ba8-62dc-6f11da1958ca	2229	Malečnik
00050000-562a-3ba8-3b90-e05c4dca1af2	6273	Marezige
00050000-562a-3ba8-9982-900b95c639ad	2000	Maribor 
00050000-562a-3ba8-bd82-a1a6f9b895ed	2001	Maribor - poštni predali
00050000-562a-3ba8-152d-447fc08e88fc	2206	Marjeta na Dravskem polju
00050000-562a-3ba8-33f8-a0c2fbe98b2d	2281	Markovci
00050000-562a-3ba8-2fa0-52b68ca426e8	9221	Martjanci
00050000-562a-3ba8-1473-ebee73fbb729	6242	Materija
00050000-562a-3ba8-e340-93bff39cdb04	4211	Mavčiče
00050000-562a-3ba8-f308-df50328a2164	1215	Medvode
00050000-562a-3ba8-f120-e8620de277b4	1234	Mengeš
00050000-562a-3ba8-567c-fdfeb4bd3c38	8330	Metlika
00050000-562a-3ba8-4c73-0c82d93a091b	2392	Mežica
00050000-562a-3ba8-86f9-dcb1481d7340	2204	Miklavž na Dravskem polju
00050000-562a-3ba8-ea42-d4f9865ecebe	2275	Miklavž pri Ormožu
00050000-562a-3ba8-eab7-aad0d4b7cbba	5291	Miren
00050000-562a-3ba8-6c8c-eac7bb7ad2c8	8233	Mirna
00050000-562a-3ba8-940b-47a06ea3becb	8216	Mirna Peč
00050000-562a-3ba8-53ba-0dc115cb91f0	2382	Mislinja
00050000-562a-3ba8-ed7a-53eb7cf9d39b	4281	Mojstrana
00050000-562a-3ba8-712f-fdf630f3c853	8230	Mokronog
00050000-562a-3ba8-5132-da2e59027d15	1251	Moravče
00050000-562a-3ba8-56a7-1cf01288c07b	9226	Moravske Toplice
00050000-562a-3ba8-4a8f-9d2f702be8c1	5216	Most na Soči
00050000-562a-3ba8-ef9b-5dd8e3fe5eff	1221	Motnik
00050000-562a-3ba8-e8c9-50f758899507	3330	Mozirje
00050000-562a-3ba8-1c20-b61d2cda2592	9000	Murska Sobota 
00050000-562a-3ba8-3590-77a7b01b5f7f	9001	Murska Sobota - poštni predali
00050000-562a-3ba8-e7fd-aba54d62132d	2366	Muta
00050000-562a-3ba8-79c5-55ad08ccecf7	4202	Naklo
00050000-562a-3ba8-ff01-fee82d2d0a52	3331	Nazarje
00050000-562a-3ba8-ad2b-7bc65786b759	1357	Notranje Gorice
00050000-562a-3ba8-b2ec-f829f2cb11fb	3203	Nova Cerkev
00050000-562a-3ba8-5feb-ccbc9d7c8766	5000	Nova Gorica 
00050000-562a-3ba8-6b71-d125cb2f0f07	5001	Nova Gorica - poštni predali
00050000-562a-3ba8-f0ca-efcd7f64b286	1385	Nova vas
00050000-562a-3ba8-04e2-17cf3396b37b	8000	Novo mesto
00050000-562a-3ba8-18e0-24bde94c0ea9	8001	Novo mesto - poštni predali
00050000-562a-3ba8-1327-0d0bbb59bc66	6243	Obrov
00050000-562a-3ba8-10c5-3578f8b2d6b8	9233	Odranci
00050000-562a-3ba8-db65-9b06adee0dfd	2317	Oplotnica
00050000-562a-3ba8-e129-c8ef64a6626b	2312	Orehova vas
00050000-562a-3ba8-3a9e-f32f144cdbe2	2270	Ormož
00050000-562a-3ba8-3345-9b0664724bcb	1316	Ortnek
00050000-562a-3ba8-49ff-462d2cffad5e	1337	Osilnica
00050000-562a-3ba8-3a28-b890cb667951	8222	Otočec
00050000-562a-3ba8-02e2-f8fe21f56dee	2361	Ožbalt
00050000-562a-3ba8-987b-8d8799c65cfa	2231	Pernica
00050000-562a-3ba8-81da-bee149967f72	2211	Pesnica pri Mariboru
00050000-562a-3ba8-7f20-7bd5a051ebd0	9203	Petrovci
00050000-562a-3ba8-1d47-983d748ac561	3301	Petrovče
00050000-562a-3ba8-f7de-92a7b3c252e4	6330	Piran/Pirano
00050000-562a-3ba8-6e0a-6cd9e8c3fd61	8255	Pišece
00050000-562a-3ba8-d9a9-fb258a04c222	6257	Pivka
00050000-562a-3ba8-237f-da6f9ed751d4	6232	Planina
00050000-562a-3ba8-eb9e-b2492ef8920f	3225	Planina pri Sevnici
00050000-562a-3ba8-f45d-3bbd200f4026	6276	Pobegi
00050000-562a-3ba8-6d81-a759abb57669	8312	Podbočje
00050000-562a-3ba8-43a9-40965e3a3da1	5243	Podbrdo
00050000-562a-3ba8-1ba7-79fc418c727b	3254	Podčetrtek
00050000-562a-3ba8-d99d-dc641e0dbd23	2273	Podgorci
00050000-562a-3ba8-c4dd-47753c508c93	6216	Podgorje
00050000-562a-3ba8-91f1-8f1aaedff899	2381	Podgorje pri Slovenj Gradcu
00050000-562a-3ba8-255d-22f55ad0a797	6244	Podgrad
00050000-562a-3ba8-ee3c-d7a812643263	1414	Podkum
00050000-562a-3ba8-acc1-94698d8272ab	2286	Podlehnik
00050000-562a-3ba8-3310-df98208fec41	5272	Podnanos
00050000-562a-3ba8-8ebc-2609e2bdfddb	4244	Podnart
00050000-562a-3ba8-6ee8-b4c42babad65	3241	Podplat
00050000-562a-3ba8-c27a-379e02e681cf	3257	Podsreda
00050000-562a-3ba8-5248-1abe303955f2	2363	Podvelka
00050000-562a-3ba8-4a35-0244db3d28ff	2208	Pohorje
00050000-562a-3ba8-b789-585ea7572d48	2257	Polenšak
00050000-562a-3ba8-7a1e-245bc3335d7b	1355	Polhov Gradec
00050000-562a-3ba8-c137-9fdc5180fb1c	4223	Poljane nad Škofjo Loko
00050000-562a-3ba8-b75a-ab3681dd138d	2319	Poljčane
00050000-562a-3ba8-9f30-2220c4147789	1272	Polšnik
00050000-562a-3ba8-7b9e-609f14058f16	3313	Polzela
00050000-562a-3ba8-6338-b0cc55440f7c	3232	Ponikva
00050000-562a-3ba8-7199-696b423f84e3	6320	Portorož/Portorose
00050000-562a-3ba8-4461-2705adfb04e2	6230	Postojna
00050000-562a-3ba8-b9f7-e5637497d5ec	2331	Pragersko
00050000-562a-3ba8-c389-68bee5c986fe	3312	Prebold
00050000-562a-3ba8-ceca-b21f09b4005f	4205	Preddvor
00050000-562a-3ba8-b886-53ed9e2e25b8	6255	Prem
00050000-562a-3ba8-d0ec-8bc3ffd9eefd	1352	Preserje
00050000-562a-3ba8-10b0-b45db90df477	6258	Prestranek
00050000-562a-3ba8-49b0-11dbcba7cc86	2391	Prevalje
00050000-562a-3ba8-60d1-f3f60056417d	3262	Prevorje
00050000-562a-3ba8-66a3-a79c924d79f0	1276	Primskovo 
00050000-562a-3ba8-d5d7-1f1218c9a264	3253	Pristava pri Mestinju
00050000-562a-3ba8-40ca-0c9885557b77	9207	Prosenjakovci/Partosfalva
00050000-562a-3ba8-5f95-74bfb2800978	5297	Prvačina
00050000-562a-3ba8-41cd-377e64bdc04b	2250	Ptuj
00050000-562a-3ba8-1c77-db15e085f1b8	2323	Ptujska Gora
00050000-562a-3ba8-8ae0-4c4f3a1625a1	9201	Puconci
00050000-562a-3ba8-c4f4-a792d8a8504a	2327	Rače
00050000-562a-3ba8-bb04-3fde7921af09	1433	Radeče
00050000-562a-3ba8-4400-284d20605b86	9252	Radenci
00050000-562a-3ba9-9205-a30c0010d5e7	2360	Radlje ob Dravi
00050000-562a-3ba9-7612-d4604d9282b4	1235	Radomlje
00050000-562a-3ba9-60be-f7df2042fd00	4240	Radovljica
00050000-562a-3ba9-f430-e181073097ec	8274	Raka
00050000-562a-3ba9-fffa-288d4b6f8cc5	1381	Rakek
00050000-562a-3ba9-128e-aeb0d2dfdb0e	4283	Rateče - Planica
00050000-562a-3ba9-2506-ca1a7c2e182c	2390	Ravne na Koroškem
00050000-562a-3ba9-470e-6bd63afec70a	9246	Razkrižje
00050000-562a-3ba9-e1e4-80d9ecee48a0	3332	Rečica ob Savinji
00050000-562a-3ba9-67db-c6b16b1a4c21	5292	Renče
00050000-562a-3ba9-46d3-f17e588522a3	1310	Ribnica
00050000-562a-3ba9-8de7-8590953f8a68	2364	Ribnica na Pohorju
00050000-562a-3ba9-caa9-6059fa601294	3272	Rimske Toplice
00050000-562a-3ba9-eb7f-7b49248d60f9	1314	Rob
00050000-562a-3ba9-2bcc-db06ba8c27fe	5215	Ročinj
00050000-562a-3ba9-bf90-a45e763f2ce1	3250	Rogaška Slatina
00050000-562a-3ba9-6213-fdcf235ff6a1	9262	Rogašovci
00050000-562a-3ba9-a923-7ce0e105c6e0	3252	Rogatec
00050000-562a-3ba9-fd85-abeb3579fd4b	1373	Rovte
00050000-562a-3ba9-bff2-6f64492477d9	2342	Ruše
00050000-562a-3ba9-f62e-1b1285878d76	1282	Sava
00050000-562a-3ba9-befb-61d89021b476	6333	Sečovlje/Sicciole
00050000-562a-3ba9-e5eb-8ae4f1353869	4227	Selca
00050000-562a-3ba9-de37-cc1f81d644f2	2352	Selnica ob Dravi
00050000-562a-3ba9-6b8c-e065d7ea956b	8333	Semič
00050000-562a-3ba9-030f-2ccaf3d53434	8281	Senovo
00050000-562a-3ba9-167d-5c592dd67b16	6224	Senožeče
00050000-562a-3ba9-a93f-d37a0d39003d	8290	Sevnica
00050000-562a-3ba9-9ddc-4edf19eeb0f3	6210	Sežana
00050000-562a-3ba9-2740-d0a494737e6d	2214	Sladki Vrh
00050000-562a-3ba9-0b54-e959462b28da	5283	Slap ob Idrijci
00050000-562a-3ba9-d576-0cc9bd85e24f	2380	Slovenj Gradec
00050000-562a-3ba9-5669-5b33381b4f6e	2310	Slovenska Bistrica
00050000-562a-3ba9-83bb-848bbb70e19a	3210	Slovenske Konjice
00050000-562a-3ba9-edd1-8ef82d9fd772	1216	Smlednik
00050000-562a-3ba9-e78f-9280f34ce9aa	5232	Soča
00050000-562a-3ba9-f1bd-2f14c6a626f0	1317	Sodražica
00050000-562a-3ba9-0b51-615f739e144a	3335	Solčava
00050000-562a-3ba9-42da-470efc6f5cc5	5250	Solkan
00050000-562a-3ba9-7ba9-0b08792906bc	4229	Sorica
00050000-562a-3ba9-47e8-3e0a5a7699fa	4225	Sovodenj
00050000-562a-3ba9-a4b6-d57a72e9e7e6	5281	Spodnja Idrija
00050000-562a-3ba9-fa22-bbd5b8f1cb31	2241	Spodnji Duplek
00050000-562a-3ba9-9281-1f2bc764ee9e	9245	Spodnji Ivanjci
00050000-562a-3ba9-aa90-f94436d8db66	2277	Središče ob Dravi
00050000-562a-3ba9-b390-1028444e78a8	4267	Srednja vas v Bohinju
00050000-562a-3ba9-0053-2b89ad8fd9e2	8256	Sromlje 
00050000-562a-3ba9-4b3e-9a378b1e368c	5224	Srpenica
00050000-562a-3ba9-c97a-b072735996fc	1242	Stahovica
00050000-562a-3ba9-de20-37dff9169695	1332	Stara Cerkev
00050000-562a-3ba9-fe38-9d58e9a0c296	8342	Stari trg ob Kolpi
00050000-562a-3ba9-7121-7e56e65d544d	1386	Stari trg pri Ložu
00050000-562a-3ba9-9840-a379a0dcebec	2205	Starše
00050000-562a-3ba9-3fbd-d36e7ca3d695	2289	Stoperce
00050000-562a-3ba9-5522-6b59912ba779	8322	Stopiče
00050000-562a-3ba9-a517-3a88c5b259fd	3206	Stranice
00050000-562a-3ba9-9106-3f174ea8b0b2	8351	Straža
00050000-562a-3ba9-35b7-3462c8c61114	1313	Struge
00050000-562a-3ba9-b8db-22b415413e00	8293	Studenec
00050000-562a-3ba9-d742-708b2a815b87	8331	Suhor
00050000-562a-3ba9-3d8f-2fdde52e1510	2233	Sv. Ana v Slovenskih goricah
00050000-562a-3ba9-f6fe-d58c5339f739	2235	Sv. Trojica v Slovenskih goricah
00050000-562a-3ba9-e10e-12ce2e6e76a7	2353	Sveti Duh na Ostrem Vrhu
00050000-562a-3ba9-6506-3e9875b70d63	9244	Sveti Jurij ob Ščavnici
00050000-562a-3ba9-0215-6a48944a8c2a	3264	Sveti Štefan
00050000-562a-3ba9-08bd-9e6bcc28bc50	2258	Sveti Tomaž
00050000-562a-3ba9-a222-6e8d8a8ac242	9204	Šalovci
00050000-562a-3ba9-74d1-bfedbb4ec291	5261	Šempas
00050000-562a-3ba9-7092-eec9f9d6a9fd	5290	Šempeter pri Gorici
00050000-562a-3ba9-e749-13a6fdeef033	3311	Šempeter v Savinjski dolini
00050000-562a-3ba9-448f-b2b66dc17be2	4208	Šenčur
00050000-562a-3ba9-dc15-7b5911921198	2212	Šentilj v Slovenskih goricah
00050000-562a-3ba9-33e3-7df66e086269	8297	Šentjanž
00050000-562a-3ba9-744f-17639774b2d5	2373	Šentjanž pri Dravogradu
00050000-562a-3ba9-4053-3dcb7d8f25c8	8310	Šentjernej
00050000-562a-3ba9-b4d6-2f6940b131d3	3230	Šentjur
00050000-562a-3ba9-8253-cb06694bd79a	3271	Šentrupert
00050000-562a-3ba9-2305-e08fa7f3f4ca	8232	Šentrupert
00050000-562a-3ba9-ea2c-d04d1378e116	1296	Šentvid pri Stični
00050000-562a-3ba9-5dea-6c93ea0bc1dd	8275	Škocjan
00050000-562a-3ba9-2732-82fcf35f8e4f	6281	Škofije
00050000-562a-3ba9-52a4-039086e09388	4220	Škofja Loka
00050000-562a-3ba9-68bd-ec1b9dd8c89c	3211	Škofja vas
00050000-562a-3ba9-1fe5-f29871592be1	1291	Škofljica
00050000-562a-3ba9-fb14-ae67b1c13ff0	6274	Šmarje
00050000-562a-3ba9-210f-f68657efc2c1	1293	Šmarje - Sap
00050000-562a-3ba9-40d6-87d103cfd23b	3240	Šmarje pri Jelšah
00050000-562a-3ba9-5fb5-092c971e225a	8220	Šmarješke Toplice
00050000-562a-3ba9-df49-7493c9cd3fc8	2315	Šmartno na Pohorju
00050000-562a-3ba9-cc71-2c4648b3e0dd	3341	Šmartno ob Dreti
00050000-562a-3ba9-6ce9-bfca984d88ee	3327	Šmartno ob Paki
00050000-562a-3ba9-de9f-31969a562286	1275	Šmartno pri Litiji
00050000-562a-3ba9-2943-5c8b40f895e2	2383	Šmartno pri Slovenj Gradcu
00050000-562a-3ba9-8a60-ba53b9bc40a3	3201	Šmartno v Rožni dolini
00050000-562a-3ba9-c523-190a5ee38cb7	3325	Šoštanj
00050000-562a-3ba9-5d7b-3ff46b5f8bc1	6222	Štanjel
00050000-562a-3ba9-d032-38ad5520cd0f	3220	Štore
00050000-562a-3ba9-1a18-cb175d98481a	3304	Tabor
00050000-562a-3ba9-15d7-2ef259ebd728	3221	Teharje
00050000-562a-3ba9-7a03-a971ee57e871	9251	Tišina
00050000-562a-3ba9-fc37-5edfb8d53a45	5220	Tolmin
00050000-562a-3ba9-6108-a2824815c0f6	3326	Topolšica
00050000-562a-3ba9-c148-b58ca461ce6b	2371	Trbonje
00050000-562a-3ba9-d012-91227789d598	1420	Trbovlje
00050000-562a-3ba9-eb89-60724c409a36	8231	Trebelno 
00050000-562a-3ba9-e4f9-337d13e0810d	8210	Trebnje
00050000-562a-3ba9-983f-48c854b4e725	5252	Trnovo pri Gorici
00050000-562a-3ba9-8f12-5d3102e73eed	2254	Trnovska vas
00050000-562a-3ba9-6ecd-b9656d81fd64	1222	Trojane
00050000-562a-3ba9-af33-0b6ed0d4fae6	1236	Trzin
00050000-562a-3ba9-d14c-064814306c9e	4290	Tržič
00050000-562a-3ba9-5b8d-b7f8e3ad47f4	8295	Tržišče
00050000-562a-3ba9-30c6-778c3053fbb8	1311	Turjak
00050000-562a-3ba9-bc39-5cd62936acc7	9224	Turnišče
00050000-562a-3ba9-c196-9f06a0181402	8323	Uršna sela
00050000-562a-3ba9-33d8-5a28a76f8e13	1252	Vače
00050000-562a-3ba9-cd30-d4b5f1a54c6a	3320	Velenje 
00050000-562a-3ba9-6103-763ecb3739d5	3322	Velenje - poštni predali
00050000-562a-3ba9-0e83-ba8cc786116f	8212	Velika Loka
00050000-562a-3ba9-ff70-ec475374e66c	2274	Velika Nedelja
00050000-562a-3ba9-532a-2aaeaacfba1d	9225	Velika Polana
00050000-562a-3ba9-0a13-4d3a1c1e3f10	1315	Velike Lašče
00050000-562a-3ba9-bcfa-dfeaf95b7897	8213	Veliki Gaber
00050000-562a-3ba9-d840-da206f7a472b	9241	Veržej
00050000-562a-3ba9-357d-650532ee2aeb	1312	Videm - Dobrepolje
00050000-562a-3ba9-9d8d-a47acca6dcdf	2284	Videm pri Ptuju
00050000-562a-3ba9-c461-4d1b92ffae2a	8344	Vinica
00050000-562a-3ba9-243d-0729203c70d4	5271	Vipava
00050000-562a-3ba9-3025-7341fc62b9f2	4212	Visoko
00050000-562a-3ba9-6d02-386a20227fe1	1294	Višnja Gora
00050000-562a-3ba9-2201-25565d4005a7	3205	Vitanje
00050000-562a-3ba9-011c-7623491ce4e0	2255	Vitomarci
00050000-562a-3ba9-048b-77f3bcb1c71c	1217	Vodice
00050000-562a-3ba9-43a6-95a303b19010	3212	Vojnik\t
00050000-562a-3ba9-6c83-6e117d18e82d	5293	Volčja Draga
00050000-562a-3ba9-81e3-4adc85cd09f2	2232	Voličina
00050000-562a-3ba9-51dc-a059cc5ef00f	3305	Vransko
00050000-562a-3ba9-b797-d10bba8b113a	6217	Vremski Britof
00050000-562a-3ba9-e4a3-360ed0eabe8b	1360	Vrhnika
00050000-562a-3ba9-27a6-a81aa9153aa5	2365	Vuhred
00050000-562a-3ba9-e2f5-a98e8f31a6d8	2367	Vuzenica
00050000-562a-3ba9-139d-7eaad3da473b	8292	Zabukovje 
00050000-562a-3ba9-0640-d6af88cd0fde	1410	Zagorje ob Savi
00050000-562a-3ba9-49d2-bf95ed6f5cb6	1303	Zagradec
00050000-562a-3ba9-9aa3-e25bb9d96c3d	2283	Zavrč
00050000-562a-3ba9-d2e5-248abe4dbfff	8272	Zdole 
00050000-562a-3ba9-27e7-612d2b73336a	4201	Zgornja Besnica
00050000-562a-3ba9-dc2b-96393b63a16a	2242	Zgornja Korena
00050000-562a-3ba9-7638-10a72a70374a	2201	Zgornja Kungota
00050000-562a-3ba9-ea54-8d7aa3df847b	2316	Zgornja Ložnica
00050000-562a-3ba9-d769-32c1ea646c1a	2314	Zgornja Polskava
00050000-562a-3ba9-be78-4a4c3661b863	2213	Zgornja Velka
00050000-562a-3ba9-7107-f5aef5a63d99	4247	Zgornje Gorje
00050000-562a-3ba9-9466-73e148b118f3	4206	Zgornje Jezersko
00050000-562a-3ba9-7825-ed426625bef2	2285	Zgornji Leskovec
00050000-562a-3ba9-38f3-89d66d5a6360	1432	Zidani Most
00050000-562a-3ba9-14c5-4be83f53f8c4	3214	Zreče
00050000-562a-3ba9-fa44-514209f6cfcd	4209	Žabnica
00050000-562a-3ba9-8a81-b17e3a371319	3310	Žalec
00050000-562a-3ba9-5324-c5e785c4cf10	4228	Železniki
00050000-562a-3ba9-74ce-67a01a638570	2287	Žetale
00050000-562a-3ba9-2a83-98296161c3bb	4226	Žiri
00050000-562a-3ba9-0bdb-ad79fa6e4a11	4274	Žirovnica
00050000-562a-3ba9-8e85-f5a5696cdb7a	8360	Žužemberk
\.


--
-- TOC entry 3114 (class 0 OID 23280242)
-- Dependencies: 236
-- Data for Name: postavkacdve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkacdve (id, skupina, podskupina, naziv, vrpremiere, vrponovitvepremier, vrponovitveprejsnjih, vrgostovanjazamejstvo, vrfestivali, vrgostovanjaint, vrostalo, programdela_id) FROM stdin;
\.


--
-- TOC entry 3087 (class 0 OID 23279834)
-- Dependencies: 209
-- Data for Name: postavkaracuna; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkaracuna (id, racun_id) FROM stdin;
\.


--
-- TOC entry 3065 (class 0 OID 23279588)
-- Dependencies: 187
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
00060000-562a-3bab-03a5-d83d8c4c6782	00080000-562a-3bab-7daf-f9904876ecb8	\N	00040000-562a-3ba9-ac4a-5cd2a3229275	Narodni dom	\N	Koroška 15	\N	9231	Beltinci	\N	f	t
00060000-562a-3bab-0f53-ece63bf78776	00080000-562a-3bab-7daf-f9904876ecb8	\N	00040000-562a-3ba9-ac4a-5cd2a3229275	Korotan	\N	Koroška 22	\N	9231	Beltinci	\N	f	f
00060000-562a-3bab-7bd2-115fe01c05a1	00080000-562a-3bab-1884-2a3b74385b92	\N	00040000-562a-3ba9-ac4a-5cd2a3229275	Rimljan	\N	Rimska ploščad 7	\N	9231	Beltinci	\N	f	t
\.


--
-- TOC entry 3077 (class 0 OID 23279732)
-- Dependencies: 199
-- Data for Name: praznik; Type: TABLE DATA; Schema: public; Owner: -
--

COPY praznik (id, ime, dan, mesec, leto, delaprost) FROM stdin;
00430000-562a-3ba9-d7dc-2860929b4e27	novo leto	1	1	\N	t
00430000-562a-3ba9-7adb-3468a14dec07	Prešernov dan, slovenski kulturni praznik	8	2	\N	t
00430000-562a-3ba9-93ab-3be2c4575710	dan upora proti okupatorju	27	4	\N	t
00430000-562a-3ba9-a396-a0f1b102c238	praznik dela	1	5	\N	t
00430000-562a-3ba9-b206-e904a61d61b7	praznik dela	2	5	\N	t
00430000-562a-3ba9-6414-a89ece0fe89b	dan Primoža Trubarja	8	6	\N	f
00430000-562a-3ba9-5084-d2ecbca8da8d	dan državnosti	25	6	\N	t
00430000-562a-3ba9-d749-26d138be02a8	združitev prekmurskih Slovencev z matičnim narodom	17	8	\N	f
00430000-562a-3ba9-5158-d3ad04066a96	vrnitev Primorske k matični domovini	15	9	\N	f
00430000-562a-3ba9-84b1-573564bd5a0b	dan suverenosti	25	10	\N	f
00430000-562a-3ba9-4b87-fecb65a7bda2	dan spomina na mrtve	1	11	\N	t
00430000-562a-3ba9-3ca9-fb4e2e6e0b1f	dan Rudolfa Maistra	23	11	\N	f
00430000-562a-3ba9-987c-97a7c2215a44	božič	25	12	\N	t
00430000-562a-3ba9-19ea-032621489047	dan samostojnosti in enotnosti	26	12	\N	t
00430000-562a-3ba9-9fe5-4682cff18d74	Marijino vnebovzetje	15	8	\N	t
00430000-562a-3ba9-a748-8e7c83af7eee	dan reformacije	31	10	\N	t
00430000-562a-3ba9-b504-420128105f37	velikonočna nedelja	27	3	2016	t
00430000-562a-3ba9-33f9-c8edc5da848b	velikonočna nedelja	16	4	2017	t
00430000-562a-3ba9-b8b2-57e035fcffc9	velikonočna nedelja	1	4	2018	t
00430000-562a-3ba9-734a-f719c090f3ad	velikonočna nedelja	21	4	2019	t
00430000-562a-3ba9-f0f2-71363ac9c4cb	velikonočna nedelja	12	4	2020	t
00430000-562a-3ba9-426b-5d4193e1a79c	velikonočna nedelja	4	4	2021	t
00430000-562a-3ba9-7f6a-f05ce94aa6e9	velikonočna nedelja	17	4	2022	t
00430000-562a-3ba9-9f13-9a22bb1424f6	velikonočna nedelja	9	4	2023	t
00430000-562a-3ba9-27ea-db21f4e0a3fa	velikonočna nedelja	31	3	2024	t
00430000-562a-3ba9-5007-316f2cb561b7	velikonočna nedelja	20	4	2025	t
00430000-562a-3ba9-47ee-e118802fbda8	velikonočna nedelja	5	4	2026	t
00430000-562a-3ba9-78c9-6f05e781934a	velikonočna nedelja	28	3	2027	t
00430000-562a-3ba9-65ca-98c07abc144e	velikonočna nedelja	16	4	2028	t
00430000-562a-3ba9-f96c-45562e762f53	velikonočna nedelja	1	4	2029	t
00430000-562a-3ba9-64ef-36565294c52e	velikonočna nedelja	21	4	2030	t
00430000-562a-3ba9-13b3-a2fb952a7215	velikonočni ponedeljek	28	3	2016	t
00430000-562a-3ba9-9bdf-f8a39b8da1a1	velikonočni ponedeljek	17	4	2017	t
00430000-562a-3ba9-eea4-ddf9a65a5099	velikonočni ponedeljek	2	4	2018	t
00430000-562a-3ba9-8bcf-17a4ac4e2f91	velikonočni ponedeljek	22	4	2019	t
00430000-562a-3ba9-9d64-c53dce3f88a1	velikonočni ponedeljek	13	4	2020	t
00430000-562a-3ba9-6abe-7ff13b6bab5d	velikonočni ponedeljek	5	4	2021	t
00430000-562a-3ba9-efdd-513b7505e5bf	velikonočni ponedeljek	18	4	2022	t
00430000-562a-3ba9-244e-cd1ec672a4c9	velikonočni ponedeljek	10	4	2023	t
00430000-562a-3ba9-cfb3-70fd5e8bb61e	velikonočni ponedeljek	1	4	2024	t
00430000-562a-3ba9-3944-664533052217	velikonočni ponedeljek	21	4	2025	t
00430000-562a-3ba9-53f5-5e18519f0589	velikonočni ponedeljek	6	4	2026	t
00430000-562a-3ba9-9f07-39bedfe8d6c7	velikonočni ponedeljek	29	3	2027	t
00430000-562a-3ba9-5ff0-2fb98e23a708	velikonočni ponedeljek	17	4	2028	t
00430000-562a-3ba9-5817-176438cfe3e7	velikonočni ponedeljek	2	4	2029	t
00430000-562a-3ba9-e3a1-604f430c348f	velikonočni ponedeljek	22	4	2030	t
00430000-562a-3ba9-3a23-eb36a8253273	binkoštna nedelja - binkošti	15	5	2016	t
00430000-562a-3ba9-5fc0-7f83f21a2622	binkoštna nedelja - binkošti	4	6	2017	t
00430000-562a-3ba9-a549-5a985bafe392	binkoštna nedelja - binkošti	20	5	2018	t
00430000-562a-3ba9-3193-bb3bf1d9109a	binkoštna nedelja - binkošti	9	6	2019	t
00430000-562a-3ba9-b163-f399463b7802	binkoštna nedelja - binkošti	31	5	2020	t
00430000-562a-3ba9-9a47-e9ded8b74213	binkoštna nedelja - binkošti	23	5	2021	t
00430000-562a-3ba9-e7f4-b2f2bc343de2	binkoštna nedelja - binkošti	5	6	2022	t
00430000-562a-3ba9-a0a7-19fcc2eb9a3d	binkoštna nedelja - binkošti	28	5	2023	t
00430000-562a-3ba9-bf18-1ecb52b2c000	binkoštna nedelja - binkošti	19	5	2024	t
00430000-562a-3ba9-6a42-3a4467fcbe77	binkoštna nedelja - binkošti	8	6	2025	t
00430000-562a-3ba9-24ef-5723edbfa921	binkoštna nedelja - binkošti	24	5	2026	t
00430000-562a-3ba9-085f-c9e59d234aac	binkoštna nedelja - binkošti	16	5	2027	t
00430000-562a-3ba9-9685-5212e4eb66f0	binkoštna nedelja - binkošti	4	6	2028	t
00430000-562a-3ba9-fbae-28730534e35f	binkoštna nedelja - binkošti	20	5	2029	t
00430000-562a-3ba9-fb83-302103fcc925	binkoštna nedelja - binkošti	9	6	2030	t
\.


--
-- TOC entry 3073 (class 0 OID 23279692)
-- Dependencies: 195
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, dezurni_id, zaporedna, zaporednasez, objavljenzacetek, porocilo) FROM stdin;
\.


--
-- TOC entry 3074 (class 0 OID 23279704)
-- Dependencies: 196
-- Data for Name: predstava_abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava_abonma (predstava_id, abonma_id) FROM stdin;
\.


--
-- TOC entry 3089 (class 0 OID 23279846)
-- Dependencies: 211
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 3115 (class 0 OID 23280256)
-- Dependencies: 237
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, koproducent_id, odstotekfinanciranja, delez, maticnikop, kpe, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 3116 (class 0 OID 23280266)
-- Dependencies: 238
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, sifra, status) FROM stdin;
00190000-562a-3bab-a716-667f1da0c50c	00080000-562a-3bab-de6e-998ff1c862dc	0987	AK
00190000-562a-3bab-88af-251c8faadfaa	00080000-562a-3bab-1884-2a3b74385b92	0989	AK
00190000-562a-3bab-1821-d68ae9ef6576	00080000-562a-3bab-ae80-347f6a4038ae	0986	AK
00190000-562a-3bab-ece1-394876634cf4	00080000-562a-3bab-3348-a913d7d9e097	0984	AK
00190000-562a-3bab-e9d7-37d504938a99	00080000-562a-3bab-ea55-d82678d744f5	0983	AK
00190000-562a-3bab-73b5-c9910cc3642c	00080000-562a-3bab-46bb-6fb480506abd	0982	AK
00190000-562a-3bac-2cee-d41be8e50cbe	00080000-562a-3bac-8dd2-34485cafa3e5	1001	AK
\.


--
-- TOC entry 3113 (class 0 OID 23280181)
-- Dependencies: 235
-- Data for Name: programdela; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programdela (id, sifra, naziv, zacetek, konec, zakljuceno, potrjenprogram, stpremier, stpremiervelikih, stpremiermalih, stpremiermalihkopr, stpremiervelikihkopr, stpremiersredkopr, stint, stfest, strazno, stizjem, stponprem, stponprej, stponprejvelikih, stponprejmalih, stponprejmalihkopr, stponprejsredkopr, stponprejvelikihkopr, stgostujo, vrps1, vrps1do, vrps1mat, vrps1gostovsz, stizvnekomerc, stizvprem, stizvpremdoma, stizvpremkopr, stizvponprem, stizvponpremdoma, stizvponpremzamejo, stizvponpremgost, stizvponpremkopr, stizvponpremint, stizvponpremkoprint, stizvponprej, stizvponprejdoma, stizvponprejzamejo, stizvponprejgost, stizvponprejkopr, stizvponprejint, stizvponprejkoprint, stizvgostuj, stizvostalihnek, stizvgostovanjslo, stizvgostovanjzam, stizvgostovanjint, stobisknekom, stobisknekommat, stobisknekomgostslo, stobisknekomgostzam, stobisknekomgostint, stobiskprem, stobiskpremdoma, stobiskpremkopr, stobiskponprem, stobiskponpremdoma, stobiskponpremkopr, stobiskponpremkoprint, stobiskponpremgost, stobiskponpremzamejo, stobiskponpremint, avgobiskprired, avgzaseddvoran, avgcenavstopnice, stprodvstopnic, stkoprodukcij, stkoprodukcijint, stkoprodukcijnvo, stzaposlenih, stzaposigralcev, avgstnastopovigr, sthonorarnihzun, sthonorarnihzunigr, sthonorarnihzunigrtujjz, sthonorarnihzunsamoz, sredstvaint, sredstvaavt, sredstvazaprosenoprem, sredstvazaprosenoponprem, sredstvazaprosenoponprej, sredstvazaprosenogostujo, sredstvazaprosenoint, sredstvazaprosenofest, sredstvazaprosenorazno, sredstvazaprosenoizjem, sredstvadrugijavniprem, sredstvadrugijavniponprem, sredstvadrugijavniponprej, sredstvadrugijavnigostujo, sredstvadrugijavniint, sredstvadrugijavnifest, sredstvadrugijavnirazno, sredstvadrugijavniizjem, sredstvadrugiviriprem, sredstvadrugiviriponprem, sredstvadrugiviriponprej, sredstvadrugivirigostujo, sredstvadrugiviriint, sredstvadrugivirifest, sredstvadrugivirirazno, sredstvadrugiviriizjem, sredstvaavtsamoz) FROM stdin;
00290000-562a-3bab-aabd-92fa5656add3	0001	Testni program dela	2016-02-01	2017-02-01	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 3117 (class 0 OID 23280274)
-- Dependencies: 239
-- Data for Name: programskaenotasklopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programskaenotasklopa (id, naslovpe, avtorpe, obsegpe, mesecpe, vrednostpe, obiskdoma, programrazno_id) FROM stdin;
\.


--
-- TOC entry 3093 (class 0 OID 23279875)
-- Dependencies: 215
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, popa_id, naslov_id, sifra, naziv, jeprizorisce, jematicnioder, seplanira, kapaciteta, opis) FROM stdin;
00220000-562a-3bab-f612-bcf2d540b8b0	\N	\N	0001	Poskusna 1	f	\N	t	8	Poskusna učilnica v prvem
00220000-562a-3bab-0b4d-7d6b6d6ed8bd	\N	\N	0002	Poskusna 3	f	\N	f	34	Poskusna učilnica v tretjem
00220000-562a-3bab-79ee-270d993b5c87	\N	\N	0003	Kazinska	t	\N	t	84	Kazinska dvorana
00220000-562a-3bab-6074-149f33a150cc	\N	\N	0004	Mali oder	t	\N	t	24	Mali oder 
00220000-562a-3bab-28f3-59549280ed35	\N	\N	0005	Komorni oder	t	\N	t	150	Komorni oder
00220000-562a-3bab-6d5f-e19581cd5d27	\N	\N	0006	Stara dvorana	t	\N	t	96	Stara dvorana ali dvorana Franceta Prešerna
00220000-562a-3bab-2d27-fae22c23f365	\N	\N	0007	Velika dvorana	t	\N	t	160	Velika, glavna dvorana
\.


--
-- TOC entry 3085 (class 0 OID 23279819)
-- Dependencies: 207
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 3084 (class 0 OID 23279809)
-- Dependencies: 206
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 3106 (class 0 OID 23280020)
-- Dependencies: 228
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta, status) FROM stdin;
\.


--
-- TOC entry 3100 (class 0 OID 23279950)
-- Dependencies: 222
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 3071 (class 0 OID 23279666)
-- Dependencies: 193
-- Data for Name: report; Type: TABLE DATA; Schema: public; Owner: -
--

COPY report (id, job_id, title, filename, transfers, size, format, hash, createdat) FROM stdin;
\.


--
-- TOC entry 3052 (class 0 OID 23279437)
-- Dependencies: 174
-- Data for Name: revizije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY revizije (id, razred, objectid, upor, datum, tip, data) FROM stdin;
1	App\\Entity\\Popa	00080000-562a-3bac-8dd2-34485cafa3e5	00010000-562a-3ba9-f483-d0e791c54b6c	2015-10-23 15:52:44	INS	a:0:{}
2	App\\Entity\\Option	00000000-562a-3bac-defd-3659bc401801	00010000-562a-3ba9-f483-d0e791c54b6c	2015-10-23 15:52:44	INS	a:0:{}
3	ProgramDela\\Entity\\ProdukcijskaHisa	00190000-562a-3bac-2cee-d41be8e50cbe	00010000-562a-3ba9-f483-d0e791c54b6c	2015-10-23 15:52:44	INS	a:0:{}
\.


--
-- TOC entry 3136 (class 0 OID 0)
-- Dependencies: 173
-- Name: revizije_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('revizije_id_seq', 3, true);


--
-- TOC entry 3094 (class 0 OID 23279888)
-- Dependencies: 216
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 3056 (class 0 OID 23279475)
-- Dependencies: 178
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-562a-3ba9-090f-c34648fe2c24	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-562a-3ba9-ad2a-b8c79db58ef0	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-562a-3ba9-9c55-1f2b40954dff	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-562a-3ba9-8df3-c6a5350bf49e	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-562a-3ba9-2062-4b81875bd707	planer	Planer dogodkov v koledarju	t
00020000-562a-3ba9-ff38-4554ced72bf5	kadrovska	Kadrovska služba	t
00020000-562a-3ba9-dd6e-c75a34fd1d15	arhivar	Ažuriranje arhivalij	t
00020000-562a-3ba9-5d26-44f2067aa960	igralec	Igralec	t
00020000-562a-3ba9-f84e-c71ba5133e10	prisotnost	Vnašalec prisotnosti, tudi za tiste izven uprizoritev	t
00020000-562a-3bab-2fe2-bfcf9248a863	vsadovoljenja	Vloga z vsemi posameznimi dovoljenji	t
\.


--
-- TOC entry 3054 (class 0 OID 23279459)
-- Dependencies: 176
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-562a-3ba9-53fa-d9570fa8108e	00020000-562a-3ba9-9c55-1f2b40954dff
00010000-562a-3ba9-f483-d0e791c54b6c	00020000-562a-3ba9-9c55-1f2b40954dff
00010000-562a-3bab-e1d2-32fb1c7926b9	00020000-562a-3bab-2fe2-bfcf9248a863
\.


--
-- TOC entry 3096 (class 0 OID 23279902)
-- Dependencies: 218
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 3088 (class 0 OID 23279840)
-- Dependencies: 210
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 3082 (class 0 OID 23279786)
-- Dependencies: 204
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, sifra, ime, zacetek, konec, aktivna) FROM stdin;
001f0000-562a-3bab-7f50-4218f7a720ed	2015	Sezona 2015	2015-01-01	2015-12-31	t
001f0000-562a-3bab-6f87-c1011494e7c9	2016	Sezona 2016	2016-01-01	2016-12-31	t
001f0000-562a-3bab-fba9-6a89403700a7	2017	Sezona 2017	2017-01-01	2017-12-31	t
\.


--
-- TOC entry 3050 (class 0 OID 23279424)
-- Dependencies: 172
-- Data for Name: stevilcenje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenje (id, sifra, naziv, prefix, suffix, zacetek, dolzina, format, globalno, poletih) FROM stdin;
00230000-562a-3ba9-d83b-5d97453c372c	pri	Privzeto številčenje po letih YYYY-N	\N	\N	1	1	%l-%n	f	t
00230000-562a-3ba9-cbc2-d995e3156e59	123	Privzeto številčenje kratkih šifer	\N	\N	100	3	%n	f	f
00230000-562a-3ba9-77bf-413817ed12e4	bcd	Globalno številčenje črtnih kod	\N	\N	1	9	%n	t	f
00230000-562a-3ba9-2a39-854c1e97b790	sif	Številčenje šifrant	\N	\N	1000	4	%n	f	f
00230000-562a-3ba9-830c-32069698b49f	tmp	Globalno številčenje začasnih številk	tmp	\N	1000	5	%l%n	t	t
\.


--
-- TOC entry 3049 (class 0 OID 23279416)
-- Dependencies: 171
-- Data for Name: stevilcenjekonfig; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjekonfig (id, stevilcenje_id, dok) FROM stdin;
00240000-562a-3ba9-627e-dff82ba23a9f	00230000-562a-3ba9-2a39-854c1e97b790	popa
00240000-562a-3ba9-08bc-f374aa905df5	00230000-562a-3ba9-2a39-854c1e97b790	oseba
00240000-562a-3ba9-9439-16dff7eb7f4c	00230000-562a-3ba9-2a39-854c1e97b790	tippopa
00240000-562a-3ba9-1a71-27f988c1825c	00230000-562a-3ba9-2a39-854c1e97b790	organizacijskaenota
00240000-562a-3ba9-c82e-137b313dcbc8	00230000-562a-3ba9-2a39-854c1e97b790	sezona
00240000-562a-3ba9-0ee9-79cd5cb8090d	00230000-562a-3ba9-2a39-854c1e97b790	tipvaje
00240000-562a-3ba9-9b9a-179434e514fc	00230000-562a-3ba9-cbc2-d995e3156e59	prostor
00240000-562a-3ba9-b161-4526ffef3b81	00230000-562a-3ba9-2a39-854c1e97b790	besedilo
00240000-562a-3ba9-4bb8-bd28087892ca	00230000-562a-3ba9-2a39-854c1e97b790	uprizoritev
00240000-562a-3ba9-a936-c76151db7078	00230000-562a-3ba9-2a39-854c1e97b790	funkcija
00240000-562a-3ba9-06de-d293d4dacbff	00230000-562a-3ba9-2a39-854c1e97b790	tipfunkcije
00240000-562a-3ba9-7247-bfa1b30a7541	00230000-562a-3ba9-2a39-854c1e97b790	alternacija
00240000-562a-3ba9-0368-33644b5db8c6	00230000-562a-3ba9-d83b-5d97453c372c	pogodba
00240000-562a-3ba9-6541-5bc99e5acbfd	00230000-562a-3ba9-2a39-854c1e97b790	zaposlitev
00240000-562a-3ba9-f4c7-bfc030dd7f78	00230000-562a-3ba9-2a39-854c1e97b790	zvrstuprizoritve
00240000-562a-3ba9-f4d0-009c416cd4f2	00230000-562a-3ba9-d83b-5d97453c372c	programdela
00240000-562a-3ba9-5366-c36d05980e90	00230000-562a-3ba9-2a39-854c1e97b790	zapis
\.


--
-- TOC entry 3048 (class 0 OID 23279411)
-- Dependencies: 170
-- Data for Name: stevilcenjestanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjestanje (id, objid, leto, stevilka) FROM stdin;
d525b75f-b4db-4f78-aa65-a9c950999bab	00240000-562a-3ba9-627e-dff82ba23a9f	0	1001
\.


--
-- TOC entry 3102 (class 0 OID 23279967)
-- Dependencies: 224
-- Data for Name: strosekuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY strosekuprizoritve (id, uprizoritev_id, popa_id, naziv, vrednostdo, vrednostna, opis, tipstroska, sort, vrstastroska_id) FROM stdin;
00270000-562a-3bab-cf80-e3927225d4df	000e0000-562a-3bab-f1ac-b9bf2f045d81	00080000-562a-3bab-7daf-f9904876ecb8	Nabava kostumov	600.50	20.00	Krila in maske	materialni	1	003b0000-562a-3ba9-1987-b5ebde3aed5f
00270000-562a-3bab-697c-3d0913e11246	000e0000-562a-3bab-f1ac-b9bf2f045d81	00080000-562a-3bab-7daf-f9904876ecb8	Zavese	125.70	3.10	Modra in zelena zavesa	materialni	2	003b0000-562a-3ba9-1987-b5ebde3aed5f
\.


--
-- TOC entry 3062 (class 0 OID 23279550)
-- Dependencies: 184
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 3083 (class 0 OID 23279796)
-- Dependencies: 205
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja, dezurni, gost) FROM stdin;
001a0000-562a-3bab-2336-60fd6e9d816e	00180000-562a-3bab-995e-f6767b7e6988	000c0000-562a-3bab-46de-9e13b6951b33	00090000-562a-3bab-a7d8-44b67216ad11	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-562a-3bab-6d2a-6ccf44d23745	00180000-562a-3bab-995e-f6767b7e6988	000c0000-562a-3bab-a33f-31bf7c3fdb4d	00090000-562a-3bab-831a-c2df7a9f3edf	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-562a-3bab-6183-5aecf8fc1825	00180000-562a-3bab-995e-f6767b7e6988	000c0000-562a-3bab-c9cc-263b40deb7b2	00090000-562a-3bab-45de-3779d095fa1a	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-562a-3bab-5d28-9a8609039af9	00180000-562a-3bab-995e-f6767b7e6988	000c0000-562a-3bab-8cb6-b912d79d64b0	00090000-562a-3bab-b739-9f53c6028ad4	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-562a-3bab-ab58-fe1c561a4234	00180000-562a-3bab-995e-f6767b7e6988	000c0000-562a-3bab-8652-36eda5bc3fc8	00090000-562a-3bab-ce9f-9e9209f4c3cd	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-562a-3bab-59de-03d7407dfa27	00180000-562a-3bab-8640-483d891991fd	\N	00090000-562a-3bab-ce9f-9e9209f4c3cd	2015-08-01 20:00:00	2015-08-01 23:00:00	\N	\N	2.00	t	f
001a0000-562a-3bab-9c8f-41529aee44bc	00180000-562a-3bab-8640-483d891991fd	\N	00090000-562a-3bab-831a-c2df7a9f3edf	2015-08-01 20:00:00	2015-08-01 23:00:00	\N	\N	2.00	f	t
\.


--
-- TOC entry 3105 (class 0 OID 23280008)
-- Dependencies: 227
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, sifra, ime, opis, imezenski, podrocje, sort) FROM stdin;
000f0000-562a-3ba9-3c65-5cd1e2f458ac	01	Avtor	Avtorji	Avtorka	umetnik	150
000f0000-562a-3ba9-815a-dde3cbe59082	02	Priredba	Priredba	Priredba	umetnik	160
000f0000-562a-3ba9-985c-281863a0301e	03	Prevod	Prevod	Prevod	umetnik	20
000f0000-562a-3ba9-252f-66c47c63cf2e	04	Režija	Režija	Režija	umetnik	30
000f0000-562a-3ba9-4d0e-469d10e61f85	05	Dramaturgija	Dramaturgija	Dramaturgija	umetnik	40
000f0000-562a-3ba9-e2de-277d279326e1	06	Scenografija	Scenografija	Scenografija	umetnik	60
000f0000-562a-3ba9-55d7-649262772d37	07	Kostumografija	Kostumografija	Kostumografija	umetnik	70
000f0000-562a-3ba9-15b1-7472e8d43f5c	08	Koreografija	Koreografija	Koreografija	umetnik	90
000f0000-562a-3ba9-39e2-df18b8be2e40	09	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	umetnik	100
000f0000-562a-3ba9-22b3-0945422fc60e	10	Oblikovanje maske	Oblikovanje maske	Oblikovanje maske	umetnik	110
000f0000-562a-3ba9-62b4-3f13dac2a5cc	11	Lektorstvo	Lektorstvo	Lektorstvo	umetnik	50
000f0000-562a-3ba9-e0b7-35e4ad2f470e	12	Glasbeni soustvarjalec	Glasbeni soustvarjalci	Glasbena soustvarjalka	umetnik	80
000f0000-562a-3ba9-c3b0-61b0a38a233e	13	Intermedijski ustvarjalec	Intermedijski ustvarjalci	Intermedijski ustvarjalka	umetnik	130
000f0000-562a-3ba9-fdf1-a0a7d6296b30	14	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	umetnik	120
000f0000-562a-3ba9-22fb-9d2995af8bd2	15	Vloga	Intermedijski ustvarjalci	Intermedijska ustvarjalka	igralec	10
000f0000-562a-3ba9-efcd-5af483f8a79f	16	Produkcija, mentorstvo	Produkcija, mentorstvo	Produkcija, mentorstvo	umetnik	140
000f0000-562a-3ba9-d2bd-84dda596ed7d	17	Tehnična podpora	Tehnična podpora	Tehnična podpora	tehnik	180
000f0000-562a-3ba9-9a90-a6cfe9cfabb7	18	Inšpicient	Inšpicienti	Inšpicientka	inspicient	170
\.


--
-- TOC entry 3059 (class 0 OID 23279501)
-- Dependencies: 181
-- Data for Name: tippopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tippopa (id, sifra, ime, opis) FROM stdin;
00400000-562a-3bab-7034-f5df242e6f0e	0001	šola	osnovna ali srednja šola
00400000-562a-3bab-68c7-fe2cd1e12c48	0002	gledalec	gledalec, ki ima abonma ali podobno
00400000-562a-3bab-4246-defc35da4fbd	0003	sponzor	sponzor dogodkov
\.


--
-- TOC entry 3118 (class 0 OID 23280285)
-- Dependencies: 240
-- Data for Name: tipprogramskeenote; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipprogramskeenote (id, sifra, naziv, koprodukcija, maxfaktor, maxvsi) FROM stdin;
002b0000-562a-3ba9-7e36-c932dcb35f25	01	Velika predstava	f	1.00	1.00
002b0000-562a-3ba9-65b8-744186184b9c	02	Mala predstava	f	0.50	0.50
002b0000-562a-3ba9-cd27-6ccef08fe102	03	Mala koprodukcija	t	0.40	1.00
002b0000-562a-3ba9-abe8-8b005ca4df69	04	Srednja koprodukcija	t	0.70	2.00
002b0000-562a-3ba9-a814-4b283e0aa9f9	05	Velika koprodukcija	t	1.00	3.00
\.


--
-- TOC entry 3081 (class 0 OID 23279776)
-- Dependencies: 203
-- Data for Name: tipvaje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipvaje (id, sifra, ime, opis) FROM stdin;
00420000-562a-3ba9-ff89-97619c08ddab	0001	prva vaja	prva vaja
00420000-562a-3ba9-ecb1-12d2dcaadea7	0002	tehnična vaja	tehnična vaja
00420000-562a-3ba9-c58e-830256f7e08c	0003	lučna vaja	lučna vaja
00420000-562a-3ba9-51c4-56088c71276c	0004	kostumska vaja	kostumska vaja
00420000-562a-3ba9-1652-dd5dc2147683	0005	foto vaja	foto vaja
00420000-562a-3ba9-0625-ef78166ee218	0006	1. glavna vaja	1. glavna vaja
00420000-562a-3ba9-9d6f-0398877e10c5	0007	2. glavna vaja	2. glavna vaja
00420000-562a-3ba9-5545-224278977890	0008	1. generalka	1. generalka
00420000-562a-3ba9-2261-3e3b7662bc05	0009	2. generalka	2. generalka
00420000-562a-3ba9-f5bc-3d19ea23d4e2	0010	odprta generalka	odprta generalka
00420000-562a-3ba9-cb71-c875dd612dd9	0011	obnovitvena vaja	obnovitvena vaja
00420000-562a-3ba9-a185-98b13ed09fa6	0012	pevska vaja	pevska vaja
00420000-562a-3ba9-d725-7fa953085fb0	0013	postavitev scene	postavitev scene (za pripravo vaje)
00420000-562a-3ba9-5620-58827bf5d888	0014	postavitev luči	postavitev luči (za pripravo vaje)
\.


--
-- TOC entry 3068 (class 0 OID 23279623)
-- Dependencies: 190
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 3053 (class 0 OID 23279446)
-- Dependencies: 175
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-562a-3ba9-f483-d0e791c54b6c	Konzolni	$2y$05$NS4xMjkyMTcwMzExMjAxROhphrQUpUuvYhF80oDxTBYTaVNbn5ga6	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-562a-3bab-f7d6-e75e5e268d6c	testni uporabnik za inšpicienta	$2y$05$NS4xMjkyMTcwMzExMjAxROxkJ1B6xAXex6EZLIwJfWzRJ8DpfecFO	t	\N	\N	\N	ivo@ifigenija.si	\N	\N	\N
00010000-562a-3bab-b2e1-dc93f6520337	testni uporabnik za Tehničnega vodjo	$2y$05$NS4xMjkyMTcwMzExMjAxROu/kXWR9sP9oamkesKuxXLbxkCb387.G	t	\N	\N	\N	tona@ifigenija.si	\N	\N	\N
00010000-562a-3bab-8d2f-1d16b4b196e2	testni uporabnik za igralca	$2y$05$NS4xMjkyMTcwMzExMjAxRO/hLCgClfERRsfCAFYwxNCcFIVjP2982	t	\N	\N	\N	irena@ifigenija.si	\N	\N	\N
00010000-562a-3bab-771d-3cf56ac893b2	testni uporabnik vnašalca termina storitev (TerminStoritve-vse)	$2y$05$NS4xMjkyMTcwMzExMjAxROT6.kTHqEq4.wa2SOnf124/N14m9qeP.	t	\N	\N	\N	tatjana@ifigenija.si	\N	\N	\N
00010000-562a-3bab-06cf-1e4498a030b0	testni uporabnik, ki je inšpicient brez zapisov v TerminStoritve	$2y$05$NS4xMjkyMTcwMzExMjAxROHau47Dtb7CME5.nlWwBVM.nusFP.ra2	t	\N	\N	\N	joze@ifigenija.si	\N	\N	\N
00010000-562a-3bab-2e2a-8c09b4a04086	testna uporabnica, ki je planerka	$2y$05$NS4xMjkyMTcwMzExMjAxRO.B/uJO3C7QRNhdX9Q2hTLQsSupj1V1S	t	\N	\N	\N	petra@ifigenija.si	\N	\N	\N
00010000-562a-3bab-88e5-19e0039c94ec	testni uporabnik, ki dobi ifi-all vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROv2d7jqhaV/Mz3EIsKoi7UoFR.SDSMBm	t	\N	\N	\N	ali@ifigenija.si	\N	\N	\N
00010000-562a-3bab-2a25-660bedc45fb8	testni uporabnik, ki dobi ifi-readall vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROYB9g.gnkufr1l/gWK6mkx.ySqrOWnJC	t	\N	\N	\N	berta@ifigenija.si	\N	\N	\N
00010000-562a-3bab-614c-7f21379ed55f	testni uporabnik, ki dobi aaa-write dovoljenje	$2y$05$NS4xMjkyMTcwMzExMjAxRORujYObKX.DzpXVYbePkiJkHqg0/Ylya	t	\N	\N	\N	aaron@ifigenija.si	\N	\N	\N
00010000-562a-3bab-e1d2-32fb1c7926b9	testni uporabnik ki dobi vsa posamezna dovoljenja	$2y$05$NS4xMjkyMTcwMzExMjAxRO2ymwxVXTr7U4Ncdn.bN49E8rLw9Jg0O	t	\N	\N	\N	vesna@ifigenija.si	\N	\N	\N
00010000-562a-3ba9-53fa-d9570fa8108e	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 3109 (class 0 OID 23280058)
-- Dependencies: 231
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, producent_id, sifra, faza, naslov, podnaslov, delovninaslov, internacionalninaslov, naslovizvirnika, podnaslovizvirnika, datumzacstudija, stevilovaj, planiranostevilovaj, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, krstna, prvaslovenska, kratkinaslov, jekoprodukcija, maticnioder_id) FROM stdin;
000e0000-562a-3bab-3bba-313fb91c0345	00160000-562a-3bab-b0c4-b2c9b780ed86	\N	00140000-562a-3ba9-e31d-b06c5a70c8a4	\N	0001	produkcija	Sen kresne noči		Sanje	\N	\N	\N	2016-02-01	\N	\N	2016-06-01	1	William  Shakespeare - Nebojša  Kavader	f	2				\N	f	\N	\N		\N	00220000-562a-3bab-28f3-59549280ed35
000e0000-562a-3bab-f1ac-b9bf2f045d81	00160000-562a-3bab-ae8f-fa270edd0dea	\N	00140000-562a-3ba9-0fe9-e50c23c1020f	\N	0002	predprodukcija-ideja	Smoletov vrt			\N	\N	\N	2016-01-01	\N	\N	2016-04-20	2	Berta   Hočevar	f	2				\N	f	\N	\N		\N	00220000-562a-3bab-6d5f-e19581cd5d27
000e0000-562a-3bab-a10e-41a71e9ae6a4	\N	\N	00140000-562a-3ba9-0fe9-e50c23c1020f	00190000-562a-3bab-a716-667f1da0c50c	0003	postprodukcija	Kisli maček			\N	\N	\N	2016-02-01	\N	\N	2016-04-20	2	\N	t	2				\N	f	\N	\N		\N	00220000-562a-3bab-28f3-59549280ed35
000e0000-562a-3bab-15eb-7a9f664de8a5	\N	\N	00140000-562a-3ba9-0fe9-e50c23c1020f	00190000-562a-3bab-a716-667f1da0c50c	0004	postprodukcija	Vladimir			\N	\N	\N	2017-03-01	\N	\N	2017-04-20	2	\N	t	2				\N	f	\N	\N		\N	00220000-562a-3bab-28f3-59549280ed35
000e0000-562a-3bab-c2ed-1dfce1e9f5d7	\N	\N	00140000-562a-3ba9-0fe9-e50c23c1020f	00190000-562a-3bab-a716-667f1da0c50c	0005	postprodukcija	Španska princesa			\N	\N	\N	2017-04-01	\N	\N	2017-05-20	1	\N	f	1				\N	f	\N	\N		\N	00220000-562a-3bab-f612-bcf2d540b8b0
000e0000-562a-3bab-5596-1bd4484227b8	\N	\N	00140000-562a-3ba9-0fe9-e50c23c1020f	00190000-562a-3bab-a716-667f1da0c50c	0006	postprodukcija	Ne vemo datumov			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-562a-3bab-f612-bcf2d540b8b0
\.


--
-- TOC entry 3076 (class 0 OID 23279722)
-- Dependencies: 198
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, tipvaje_id, uprizoritev_id, zaporedna, porocilo) FROM stdin;
00200000-562a-3bab-4a3c-872419f03dbb	\N	000e0000-562a-3bab-f1ac-b9bf2f045d81	1	
00200000-562a-3bab-8984-0fa2140a3592	\N	000e0000-562a-3bab-f1ac-b9bf2f045d81	2	
00200000-562a-3bab-fa2a-8329f826aa2b	\N	000e0000-562a-3bab-f1ac-b9bf2f045d81	3	
00200000-562a-3bab-b81b-99b726b14ae8	\N	000e0000-562a-3bab-f1ac-b9bf2f045d81	4	
00200000-562a-3bab-5553-ba7aaada1617	\N	000e0000-562a-3bab-f1ac-b9bf2f045d81	5	
\.


--
-- TOC entry 3092 (class 0 OID 23279867)
-- Dependencies: 214
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 3103 (class 0 OID 23279981)
-- Dependencies: 225
-- Data for Name: vrstastroska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstastroska (id, skupina, podskupina, naziv, opis) FROM stdin;
003b0000-562a-3ba9-8b61-21042652f6f5	1	0	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE
003b0000-562a-3ba9-9e2d-bc20e7906699	1	1	Storitve varovanja zgradb in prostorov	storitve varovanja zgradb in prostorov (npr. gasilci na predstavah)
003b0000-562a-3ba9-6c8b-de4f8071a31e	1	2	Založniške in tiskarske storitve	založniške in tiskarske storitve
003b0000-562a-3ba9-49ff-65cccdcf4188	1	3	Časopisi, revije, knjige in strokovna literatura	časopisi, revije, knjige in strokovna literatura
003b0000-562a-3ba9-553a-39f460e56cc9	1	4	Stroški prevajalskih storitev	stroški prevajalskih storitev
003b0000-562a-3ba9-e972-c5f59a82e7ae	1	5	Stroški oglaševalskih storitev	stroški oglaševalskih storitev
003b0000-562a-3ba9-2578-ca844b43ae72	1	6	Izdatki za reprezentanco	izdatki za reprezentanco
003b0000-562a-3ba9-8fee-f42f5f754c85	2	0	POSEBNI MATERIAL IN STORITVE	POSEBNI MATERIAL IN STORITVE
003b0000-562a-3ba9-1987-b5ebde3aed5f	2	1	Drugi posebni material in storitve	drugi posebni material in storitve (npr. za instrumete - navedite)
003b0000-562a-3ba9-2805-a6528a50d9df	2	2	Oprema predstave – stroški rekvizitov	Oprema predstave – stroški rekvizitov
003b0000-562a-3ba9-ca74-45d5c1749375	2	3	Oprema predstave – stroški kostumov	Oprema predstave – stroški kostumov
003b0000-562a-3ba9-37f6-fd8312d0847c	2	4	Oprema predstave – stroški scenske opreme	Oprema predstave – stroški scenske opreme
003b0000-562a-3ba9-7daf-d4c89a1a516f	2	5	Oprema predstave – stroški avdio in video opreme	Oprema predstave – stroški avdio in video opreme
003b0000-562a-3ba9-9534-11fecdc737cc	3	0	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE
003b0000-562a-3ba9-d7ff-63d6bb9e75b8	3	1	Poštnina in kurirske storitve	poštnina in kurirske storitve
003b0000-562a-3ba9-2308-cab02b7c3619	4	0	PREVOZNI STROŠKI IN STORITVE	PREVOZNI STROŠKI IN STORITVE
003b0000-562a-3ba9-de39-963e2ad05d5d	4	1	Goriva in maziva za prevozna sredstva	goriva in maziva za prevozna sredstva
003b0000-562a-3ba9-1da7-dd25d07b7d43	4	2	Najem vozil in selitveni stroški	najem vozil in selitveni stroški
003b0000-562a-3ba9-fbcb-06e5c1f328d8	4	3	Drugi prevozni in transportni stroški 	drugi prevozni in transportni stroški (navedite)
003b0000-562a-3ba9-3c7d-d0083d8fba09	5	0	IZDATKI ZA SLUŽBENA POTOVANJA	IZDATKI ZA SLUŽBENA POTOVANJA
003b0000-562a-3ba9-34cd-b9040ad5eafd	5	1	Dnevnice za službena potovanja v državi in tujini	dnevnice za službena potovanja v državi in tujini
003b0000-562a-3ba9-bd18-635728b4ff7a	5	2	Hotelske in restavra. storitve v državi in tujini	hotelske in restavra. storitve v državi in tujini
003b0000-562a-3ba9-c0da-14abfc37dffb	5	3	Stroški prevoza v državi in tujini	stroški prevoza v državi in tujini
003b0000-562a-3ba9-5ec5-b7e03dae6761	5	4	Drugi izdatki za službena potovanja	drugi izdatki za službena potovanja (navedite)
003b0000-562a-3ba9-8a05-54ec6e8a0bca	6	0	NAJEMNINE IN ZAKUPNINE	NAJEMNINE IN ZAKUPNINE
003b0000-562a-3ba9-b3d1-fdd9c82bde44	6	1	Druge najemnine, zakupnine in licenčnine	druge najemnine, zakupnine in licenčnine (npr. najem notnega materiala, instrumentov - navedite)
003b0000-562a-3ba9-b258-2a0dee36c2f9	7	0	DRUGI OPERATIVNI ODHODKI	DRUGI OPERATIVNI ODHODKI
003b0000-562a-3ba9-5210-6e42984b2d2c	7	1	Izdatki za strok. izobraževanje zap.	izdatki za strok. izobraževanje zap.(vezani na program. enote)  
\.


--
-- TOC entry 3121 (class 0 OID 23280332)
-- Dependencies: 243
-- Data for Name: vrstazapisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstazapisa (id, oznaka, naziv, aktiven, znacka, ikona, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3120 (class 0 OID 23280304)
-- Dependencies: 242
-- Data for Name: zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapis (id, vrsta_id, datoteka_id, mapa_id, avtor_id, zaklenil_id, tip, zaklenjen, datumzaklepanja, identifier, subject, title, description, coverage, creator, language, date, publisher, relation, rights, source, upor, datknj, standard, lokacija) FROM stdin;
\.


--
-- TOC entry 3122 (class 0 OID 23280344)
-- Dependencies: 244
-- Data for Name: zapislastnik; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapislastnik (id, zapis_id, lastnik, classlastnika, datum, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3099 (class 0 OID 23279939)
-- Dependencies: 221
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, sifra, status, delovnomesto, zacetek, konec, tip, delovnaobveza, malica, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci, organizacijskaenota_id) FROM stdin;
00100000-562a-3bab-ff40-572357732239	00090000-562a-3bab-831a-c2df7a9f3edf	0010	A	Mojster	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-562a-3bab-61b3-6b5a9aec1e44	00090000-562a-3bab-45de-3779d095fa1a	0003	A	Igralec	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-562a-3bab-1963-aa94b8d0082b	00090000-562a-3bab-8021-ece1706e4277	0008	A	Natakar	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-562a-3bab-ef43-3b51e2cddacb	00090000-562a-3bab-9d4e-e4c21b018c8d	0004	A	Mizar	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-562a-3bab-c017-fbd4406de18e	00090000-562a-3bab-62b0-e0570d283c7e	0009	A	Šivilja	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-562a-3bab-5a4c-2476c900ccf1	00090000-562a-3bab-e377-6caa98a729a4	0007	A	Inšpicient	2010-02-01	\N	1	2		t	f	f	t	\N
\.


--
-- TOC entry 3079 (class 0 OID 23279765)
-- Dependencies: 201
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id, oseba_id) FROM stdin;
\.


--
-- TOC entry 3108 (class 0 OID 23280048)
-- Dependencies: 230
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, sifra, naziv, opis) FROM stdin;
00140000-562a-3ba9-e31d-b06c5a70c8a4	01	Drama	drama (SURS 01)
00140000-562a-3ba9-e58f-7739a33dec40	02	Opera	opera (SURS 02)
00140000-562a-3ba9-9ffd-26bf59d96384	03	Balet	balet (SURS 03)
00140000-562a-3ba9-3d8d-ef49b5166ab3	04	Plesne prireditve	plesne prireditve (SURS 04)
00140000-562a-3ba9-1063-ef6c2180446a	05	Lutkovno gledališče	lutkovno gledališče (SURS 05)
00140000-562a-3ba9-0fe9-e50c23c1020f	06	Raziskovalno gledališče	raziskovalno gledališče (SURS 06)
00140000-562a-3ba9-f595-c6e2200da51a	07	Drugo	drugo (SURS 07)
\.


--
-- TOC entry 3098 (class 0 OID 23279929)
-- Dependencies: 220
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, sifra, naziv, opis) FROM stdin;
\.


--
-- TOC entry 2548 (class 2606 OID 23279500)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2764 (class 2606 OID 23280107)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2760 (class 2606 OID 23280097)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2723 (class 2606 OID 23279964)
-- Name: avtorbesedila_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT avtorbesedila_pkey PRIMARY KEY (id);


--
-- TOC entry 2734 (class 2606 OID 23280006)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2821 (class 2606 OID 23280384)
-- Name: datoteka_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT datoteka_pkey PRIMARY KEY (id);


--
-- TOC entry 2630 (class 2606 OID 23279754)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2645 (class 2606 OID 23279775)
-- Name: dogodeksplosni_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodeksplosni
    ADD CONSTRAINT dogodeksplosni_pkey PRIMARY KEY (id);


--
-- TOC entry 2797 (class 2606 OID 23280302)
-- Name: drugivir_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT drugivir_pkey PRIMARY KEY (id);


--
-- TOC entry 2593 (class 2606 OID 23279649)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2771 (class 2606 OID 23280175)
-- Name: enotaprograma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT enotaprograma_pkey PRIMARY KEY (id);


--
-- TOC entry 2707 (class 2606 OID 23279925)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2621 (class 2606 OID 23279720)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2610 (class 2606 OID 23279687)
-- Name: job_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY job
    ADD CONSTRAINT job_pkey PRIMARY KEY (id);


--
-- TOC entry 2601 (class 2606 OID 23279663)
-- Name: kontaktnaoseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT kontaktnaoseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2671 (class 2606 OID 23279832)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2815 (class 2606 OID 23280361)
-- Name: mapa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT mapa_pkey PRIMARY KEY (id);


--
-- TOC entry 2819 (class 2606 OID 23280368)
-- Name: mapa_zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT mapa_zapis_pkey PRIMARY KEY (mapa_id, zapis_id);


--
-- TOC entry 2826 (class 2606 OID 23280392)
-- Name: mapaacl_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT mapaacl_pkey PRIMARY KEY (id);


--
-- TOC entry 2683 (class 2606 OID 23279859)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2586 (class 2606 OID 23279621)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2556 (class 2606 OID 23279519)
-- Name: optionvalue_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT optionvalue_pkey PRIMARY KEY (id);


--
-- TOC entry 2575 (class 2606 OID 23279583)
-- Name: organizacijskaenota_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT organizacijskaenota_pkey PRIMARY KEY (id);


--
-- TOC entry 2559 (class 2606 OID 23279546)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2546 (class 2606 OID 23279489)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2539 (class 2606 OID 23279474)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2686 (class 2606 OID 23279865)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2700 (class 2606 OID 23279901)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2746 (class 2606 OID 23280043)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2569 (class 2606 OID 23279574)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2583 (class 2606 OID 23279609)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2781 (class 2606 OID 23280254)
-- Name: postavkacdve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkacdve
    ADD CONSTRAINT postavkacdve_pkey PRIMARY KEY (id);


--
-- TOC entry 2675 (class 2606 OID 23279838)
-- Name: postavkaracuna_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT postavkaracuna_pkey PRIMARY KEY (id);


--
-- TOC entry 2581 (class 2606 OID 23279599)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2628 (class 2606 OID 23279739)
-- Name: praznik_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY praznik
    ADD CONSTRAINT praznik_pkey PRIMARY KEY (id);


--
-- TOC entry 2619 (class 2606 OID 23279708)
-- Name: predstava_abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava_abonma
    ADD CONSTRAINT predstava_abonma_pkey PRIMARY KEY (predstava_id, abonma_id);


--
-- TOC entry 2615 (class 2606 OID 23279700)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2681 (class 2606 OID 23279850)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2785 (class 2606 OID 23280263)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2787 (class 2606 OID 23280271)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2778 (class 2606 OID 23280241)
-- Name: programdela_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT programdela_pkey PRIMARY KEY (id);


--
-- TOC entry 2792 (class 2606 OID 23280283)
-- Name: programskaenotasklopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT programskaenotasklopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2693 (class 2606 OID 23279883)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2669 (class 2606 OID 23279823)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2663 (class 2606 OID 23279814)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2741 (class 2606 OID 23280030)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2721 (class 2606 OID 23279957)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2604 (class 2606 OID 23279675)
-- Name: report_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY report
    ADD CONSTRAINT report_pkey PRIMARY KEY (id);


--
-- TOC entry 2531 (class 2606 OID 23279445)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2698 (class 2606 OID 23279892)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2537 (class 2606 OID 23279463)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2541 (class 2606 OID 23279483)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2705 (class 2606 OID 23279910)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2677 (class 2606 OID 23279845)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2651 (class 2606 OID 23279794)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2528 (class 2606 OID 23279433)
-- Name: stevilcenje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenje
    ADD CONSTRAINT stevilcenje_pkey PRIMARY KEY (id);


--
-- TOC entry 2525 (class 2606 OID 23279421)
-- Name: stevilcenjekonfig_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT stevilcenjekonfig_pkey PRIMARY KEY (id);


--
-- TOC entry 2522 (class 2606 OID 23279415)
-- Name: stevilcenjestanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjestanje
    ADD CONSTRAINT stevilcenjestanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2730 (class 2606 OID 23279977)
-- Name: strosekuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT strosekuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2565 (class 2606 OID 23279555)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2657 (class 2606 OID 23279805)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2737 (class 2606 OID 23280017)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2550 (class 2606 OID 23279508)
-- Name: tippopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tippopa
    ADD CONSTRAINT tippopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2794 (class 2606 OID 23280295)
-- Name: tipprogramskeenote_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipprogramskeenote
    ADD CONSTRAINT tipprogramskeenote_pkey PRIMARY KEY (id);


--
-- TOC entry 2647 (class 2606 OID 23279783)
-- Name: tipvaje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipvaje
    ADD CONSTRAINT tipvaje_pkey PRIMARY KEY (id);


--
-- TOC entry 2591 (class 2606 OID 23279634)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2533 (class 2606 OID 23279458)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2758 (class 2606 OID 23280076)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2626 (class 2606 OID 23279729)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2689 (class 2606 OID 23279873)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2732 (class 2606 OID 23279989)
-- Name: vrstastroska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstastroska
    ADD CONSTRAINT vrstastroska_pkey PRIMARY KEY (id);


--
-- TOC entry 2808 (class 2606 OID 23280342)
-- Name: vrstazapisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstazapisa
    ADD CONSTRAINT vrstazapisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2805 (class 2606 OID 23280326)
-- Name: zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT zapis_pkey PRIMARY KEY (id);


--
-- TOC entry 2811 (class 2606 OID 23280350)
-- Name: zapislastnik_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT zapislastnik_pkey PRIMARY KEY (id);


--
-- TOC entry 2717 (class 2606 OID 23279947)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2643 (class 2606 OID 23279769)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2750 (class 2606 OID 23280056)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2713 (class 2606 OID 23279937)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2631 (class 1259 OID 23279763)
-- Name: dogodki_konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_konec ON dogodek USING btree (konec);


--
-- TOC entry 2632 (class 1259 OID 23279764)
-- Name: dogodki_razred; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_razred ON dogodek USING btree (razred);


--
-- TOC entry 2633 (class 1259 OID 23279762)
-- Name: dogodki_zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2634 (class 1259 OID 23279761)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2635 (class 1259 OID 23279760)
-- Name: idx_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2726 (class 1259 OID 23279978)
-- Name: idx_11ffe6e05c75296c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e05c75296c ON strosekuprizoritve USING btree (vrstastroska_id);


--
-- TOC entry 2727 (class 1259 OID 23279979)
-- Name: idx_11ffe6e062b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e062b4ffca ON strosekuprizoritve USING btree (uprizoritev_id);


--
-- TOC entry 2728 (class 1259 OID 23279980)
-- Name: idx_11ffe6e06beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e06beede51 ON strosekuprizoritve USING btree (popa_id);


--
-- TOC entry 2812 (class 1259 OID 23280363)
-- Name: idx_14a5d6d3727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d3727aca70 ON mapa USING btree (parent_id);


--
-- TOC entry 2813 (class 1259 OID 23280362)
-- Name: idx_14a5d6d38a4a6c12; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d38a4a6c12 ON mapa USING btree (lastnik_id);


--
-- TOC entry 2566 (class 1259 OID 23279576)
-- Name: idx_1c7adba589552cb2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba589552cb2 ON popa USING btree (tipkli_id);


--
-- TOC entry 2567 (class 1259 OID 23279577)
-- Name: idx_1c7adba5ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba5ee4b985a ON popa USING btree (drzava_id);


--
-- TOC entry 2684 (class 1259 OID 23279866)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2799 (class 1259 OID 23280330)
-- Name: idx_1ed92829253c4123; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829253c4123 ON zapis USING btree (avtor_id);


--
-- TOC entry 2800 (class 1259 OID 23280329)
-- Name: idx_1ed9282957ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282957ed422f ON zapis USING btree (mapa_id);


--
-- TOC entry 2801 (class 1259 OID 23280331)
-- Name: idx_1ed9282987ff3295; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282987ff3295 ON zapis USING btree (zaklenil_id);


--
-- TOC entry 2802 (class 1259 OID 23280328)
-- Name: idx_1ed92829a54dbb1f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829a54dbb1f ON zapis USING btree (datoteka_id);


--
-- TOC entry 2803 (class 1259 OID 23280327)
-- Name: idx_1ed92829ef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829ef943358 ON zapis USING btree (vrsta_id);


--
-- TOC entry 2678 (class 1259 OID 23279852)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2679 (class 1259 OID 23279851)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2623 (class 1259 OID 23279730)
-- Name: idx_2390fc964ad2a6ea; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc964ad2a6ea ON vaja USING btree (tipvaje_id);


--
-- TOC entry 2624 (class 1259 OID 23279731)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2708 (class 1259 OID 23279926)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2709 (class 1259 OID 23279928)
-- Name: idx_23aeb9586b361365; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9586b361365 ON funkcija USING btree (tipfunkcije_id);


--
-- TOC entry 2710 (class 1259 OID 23279927)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2598 (class 1259 OID 23279665)
-- Name: idx_2942b10710389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b10710389148 ON kontaktnaoseba USING btree (oseba_id);


--
-- TOC entry 2599 (class 1259 OID 23279664)
-- Name: idx_2942b1076beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b1076beede51 ON kontaktnaoseba USING btree (popa_id);


--
-- TOC entry 2790 (class 1259 OID 23280284)
-- Name: idx_2d901816d6bc69d6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2d901816d6bc69d6 ON programskaenotasklopa USING btree (programrazno_id);


--
-- TOC entry 2742 (class 1259 OID 23280045)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2743 (class 1259 OID 23280046)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2744 (class 1259 OID 23280047)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2809 (class 1259 OID 23280351)
-- Name: idx_2eaff9dcaf91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2eaff9dcaf91ecd ON zapislastnik USING btree (zapis_id);


--
-- TOC entry 2751 (class 1259 OID 23280081)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2752 (class 1259 OID 23280078)
-- Name: idx_344a77a7c3b0d59; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a7c3b0d59 ON uprizoritev USING btree (maticnioder_id);


--
-- TOC entry 2753 (class 1259 OID 23280082)
-- Name: idx_344a77a853a965c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a853a965c ON uprizoritev USING btree (producent_id);


--
-- TOC entry 2754 (class 1259 OID 23280080)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2755 (class 1259 OID 23280079)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2588 (class 1259 OID 23279636)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2589 (class 1259 OID 23279635)
-- Name: idx_37f6541a6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a6beede51 ON trr USING btree (popa_id);


--
-- TOC entry 2557 (class 1259 OID 23279549)
-- Name: idx_466966d769e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_466966d769e8d4 ON oseba USING btree (naslov_id);


--
-- TOC entry 2696 (class 1259 OID 23279893)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2543 (class 1259 OID 23279490)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2544 (class 1259 OID 23279491)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2701 (class 1259 OID 23279913)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2702 (class 1259 OID 23279912)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2703 (class 1259 OID 23279911)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2571 (class 1259 OID 23279586)
-- Name: idx_5e2fdc29289ed596; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29289ed596 ON organizacijskaenota USING btree (vodja_id);


--
-- TOC entry 2572 (class 1259 OID 23279585)
-- Name: idx_5e2fdc29727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29727aca70 ON organizacijskaenota USING btree (parent_id);


--
-- TOC entry 2573 (class 1259 OID 23279587)
-- Name: idx_5e2fdc29f0020ed7; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29f0020ed7 ON organizacijskaenota USING btree (namestnik_id);


--
-- TOC entry 2611 (class 1259 OID 23279703)
-- Name: idx_602f6e461174bb0e; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e461174bb0e ON predstava USING btree (dezurni_id);


--
-- TOC entry 2612 (class 1259 OID 23279701)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2613 (class 1259 OID 23279702)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2523 (class 1259 OID 23279423)
-- Name: idx_6054e804ff55f926; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_6054e804ff55f926 ON stevilcenjekonfig USING btree (stevilcenje_id);


--
-- TOC entry 2658 (class 1259 OID 23279818)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2659 (class 1259 OID 23279816)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2660 (class 1259 OID 23279815)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2661 (class 1259 OID 23279817)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2534 (class 1259 OID 23279464)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2535 (class 1259 OID 23279465)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2687 (class 1259 OID 23279874)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2822 (class 1259 OID 23280385)
-- Name: idx_781826c67e3c61f9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_781826c67e3c61f9 ON datoteka USING btree (owner_id);


--
-- TOC entry 2724 (class 1259 OID 23279966)
-- Name: idx_7ab77b7910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7ab77b7910389148 ON avtorbesedila USING btree (oseba_id);


--
-- TOC entry 2725 (class 1259 OID 23279965)
-- Name: idx_7ab77b79f35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7ab77b79f35157b1 ON avtorbesedila USING btree (besedilo_id);


--
-- TOC entry 2823 (class 1259 OID 23280393)
-- Name: idx_7adc957157ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc957157ed422f ON mapaacl USING btree (mapa_id);


--
-- TOC entry 2824 (class 1259 OID 23280394)
-- Name: idx_7adc9571fa6311ef; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc9571fa6311ef ON mapaacl USING btree (perm_id);


--
-- TOC entry 2673 (class 1259 OID 23279839)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2718 (class 1259 OID 23279958)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2719 (class 1259 OID 23279959)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2772 (class 1259 OID 23280180)
-- Name: idx_8787a0e54ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e54ae1cd1c ON enotaprograma USING btree (gostitelj_id);


--
-- TOC entry 2773 (class 1259 OID 23280179)
-- Name: idx_8787a0e55d0da56c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e55d0da56c ON enotaprograma USING btree (drzavagostovanja_id);


--
-- TOC entry 2774 (class 1259 OID 23280176)
-- Name: idx_8787a0e562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e562b4ffca ON enotaprograma USING btree (uprizoritev_id);


--
-- TOC entry 2775 (class 1259 OID 23280177)
-- Name: idx_8787a0e57222d84b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e57222d84b ON enotaprograma USING btree (tipprogramskeenote_id);


--
-- TOC entry 2776 (class 1259 OID 23280178)
-- Name: idx_8787a0e5771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e5771ec7bd ON enotaprograma USING btree (program_dela_id);


--
-- TOC entry 2577 (class 1259 OID 23279601)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2578 (class 1259 OID 23279600)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2579 (class 1259 OID 23279602)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2690 (class 1259 OID 23279887)
-- Name: idx_952dd21969e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd21969e8d4 ON prostor USING btree (naslov_id);


--
-- TOC entry 2691 (class 1259 OID 23279886)
-- Name: idx_952dd2196beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd2196beede51 ON prostor USING btree (popa_id);


--
-- TOC entry 2782 (class 1259 OID 23280264)
-- Name: idx_97af082e38c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e38c06eb ON produkcijadelitev USING btree (enotaprograma_id);


--
-- TOC entry 2783 (class 1259 OID 23280265)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2765 (class 1259 OID 23280111)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2766 (class 1259 OID 23280112)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2767 (class 1259 OID 23280109)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2768 (class 1259 OID 23280110)
-- Name: idx_a4b7244fa4976613; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fa4976613 ON alternacija USING btree (zaposlitev_id);


--
-- TOC entry 2714 (class 1259 OID 23279948)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2715 (class 1259 OID 23279949)
-- Name: idx_b24490415f1e9d88; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b24490415f1e9d88 ON zaposlitev USING btree (organizacijskaenota_id);


--
-- TOC entry 2664 (class 1259 OID 23279827)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2665 (class 1259 OID 23279826)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2666 (class 1259 OID 23279824)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2667 (class 1259 OID 23279825)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2761 (class 1259 OID 23280099)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2762 (class 1259 OID 23280098)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2602 (class 1259 OID 23279676)
-- Name: idx_c38372b2be04ea9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c38372b2be04ea9 ON report USING btree (job_id);


--
-- TOC entry 2605 (class 1259 OID 23279690)
-- Name: idx_c395a6181bb9e62c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a6181bb9e62c ON job USING btree (datum);


--
-- TOC entry 2606 (class 1259 OID 23279689)
-- Name: idx_c395a618941027cc; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618941027cc ON job USING btree (casizvedbe);


--
-- TOC entry 2607 (class 1259 OID 23279688)
-- Name: idx_c395a618a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618a76ed395 ON job USING btree (user_id);


--
-- TOC entry 2608 (class 1259 OID 23279691)
-- Name: idx_c395a618aecf5af0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618aecf5af0 ON job USING btree (izveden);


--
-- TOC entry 2622 (class 1259 OID 23279721)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2616 (class 1259 OID 23279709)
-- Name: idx_d9ece16b5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_d9ece16b5ac894aa ON predstava_abonma USING btree (predstava_id);


--
-- TOC entry 2617 (class 1259 OID 23279710)
-- Name: idx_d9ece16bbe74b11; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_d9ece16bbe74b11 ON predstava_abonma USING btree (abonma_id);


--
-- TOC entry 2779 (class 1259 OID 23280255)
-- Name: idx_dba42fe79e3adf2c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_dba42fe79e3adf2c ON postavkacdve USING btree (programdela_id);


--
-- TOC entry 2798 (class 1259 OID 23280303)
-- Name: idx_e7d4cf2638c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e7d4cf2638c06eb ON drugivir USING btree (enotaprograma_id);


--
-- TOC entry 2816 (class 1259 OID 23280369)
-- Name: idx_e9f8ee8257ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee8257ed422f ON mapa_zapis USING btree (mapa_id);


--
-- TOC entry 2817 (class 1259 OID 23280370)
-- Name: idx_e9f8ee82af91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee82af91ecd ON mapa_zapis USING btree (zapis_id);


--
-- TOC entry 2553 (class 1259 OID 23279521)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2554 (class 1259 OID 23279520)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2562 (class 1259 OID 23279556)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2563 (class 1259 OID 23279557)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2641 (class 1259 OID 23279770)
-- Name: idx_f44a386d10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_f44a386d10389148 ON zasedenost USING btree (oseba_id);


--
-- TOC entry 2653 (class 1259 OID 23279808)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2654 (class 1259 OID 23279807)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2655 (class 1259 OID 23279806)
-- Name: idx_fef7d84ba81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84ba81ccef6 ON terminstoritve USING btree (dogodek_id);


--
-- TOC entry 2636 (class 1259 OID 23279756)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2637 (class 1259 OID 23279757)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2638 (class 1259 OID 23279755)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2639 (class 1259 OID 23279759)
-- Name: uniq_11e93b5dbbc7a989; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dbbc7a989 ON dogodek USING btree (dogodek_splosni_id);


--
-- TOC entry 2640 (class 1259 OID 23279758)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2570 (class 1259 OID 23279575)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2551 (class 1259 OID 23279509)
-- Name: uniq_1d30700559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1d30700559828a3 ON tippopa USING btree (sifra);


--
-- TOC entry 2552 (class 1259 OID 23279510)
-- Name: uniq_1d3070055cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1d3070055cca980 ON tippopa USING btree (ime);


--
-- TOC entry 2594 (class 1259 OID 23279650)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2595 (class 1259 OID 23279652)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2596 (class 1259 OID 23279651)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2597 (class 1259 OID 23279653)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2672 (class 1259 OID 23279833)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2747 (class 1259 OID 23280044)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2756 (class 1259 OID 23280077)
-- Name: uniq_344a77a559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_344a77a559828a3 ON uprizoritev USING btree (sifra);


--
-- TOC entry 2738 (class 1259 OID 23280018)
-- Name: uniq_3f50510d559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d559828a3 ON tipfunkcije USING btree (sifra);


--
-- TOC entry 2739 (class 1259 OID 23280019)
-- Name: uniq_3f50510d55cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d55cca980 ON tipfunkcije USING btree (ime);


--
-- TOC entry 2560 (class 1259 OID 23279547)
-- Name: uniq_466966d7559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7559828a3 ON oseba USING btree (sifra);


--
-- TOC entry 2561 (class 1259 OID 23279548)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2711 (class 1259 OID 23279938)
-- Name: uniq_5216fcb0559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5216fcb0559828a3 ON zvrstuprizoritve USING btree (sifra);


--
-- TOC entry 2529 (class 1259 OID 23279434)
-- Name: uniq_5a434fbc559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5a434fbc559828a3 ON stevilcenje USING btree (sifra);


--
-- TOC entry 2587 (class 1259 OID 23279622)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2576 (class 1259 OID 23279584)
-- Name: uniq_5e2fdc29559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5e2fdc29559828a3 ON organizacijskaenota USING btree (sifra);


--
-- TOC entry 2526 (class 1259 OID 23279422)
-- Name: uniq_6054e804889a7556; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_6054e804889a7556 ON stevilcenjekonfig USING btree (dok);


--
-- TOC entry 2795 (class 1259 OID 23280296)
-- Name: uniq_7d834df4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_7d834df4559828a3 ON tipprogramskeenote USING btree (sifra);


--
-- TOC entry 2694 (class 1259 OID 23279885)
-- Name: uniq_952dd21937854736; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21937854736 ON prostor USING btree (naziv);


--
-- TOC entry 2695 (class 1259 OID 23279884)
-- Name: uniq_952dd219559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd219559828a3 ON prostor USING btree (sifra);


--
-- TOC entry 2648 (class 1259 OID 23279784)
-- Name: uniq_99664b14559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_99664b14559828a3 ON tipvaje USING btree (sifra);


--
-- TOC entry 2649 (class 1259 OID 23279785)
-- Name: uniq_99664b1455cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_99664b1455cca980 ON tipvaje USING btree (ime);


--
-- TOC entry 2769 (class 1259 OID 23280108)
-- Name: uniq_a4b7244f559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a4b7244f559828a3 ON alternacija USING btree (sifra);


--
-- TOC entry 2584 (class 1259 OID 23279610)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2748 (class 1259 OID 23280057)
-- Name: uniq_cede8e36559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_cede8e36559828a3 ON zvrstsurs USING btree (sifra);


--
-- TOC entry 2806 (class 1259 OID 23280343)
-- Name: uniq_de1c8aa1d55226c7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_de1c8aa1d55226c7 ON vrstazapisa USING btree (oznaka);


--
-- TOC entry 2788 (class 1259 OID 23280272)
-- Name: uniq_e6fc2028559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc2028559828a3 ON produkcijskahisa USING btree (sifra);


--
-- TOC entry 2789 (class 1259 OID 23280273)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2735 (class 1259 OID 23280007)
-- Name: uniq_ec773670ca2e5fcb; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ec773670ca2e5fcb ON besedilo USING btree (stevilka);


--
-- TOC entry 2652 (class 1259 OID 23279795)
-- Name: uniq_ecc8f8c5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ecc8f8c5559828a3 ON sezona USING btree (sifra);


--
-- TOC entry 2542 (class 1259 OID 23279484)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2865 (class 2606 OID 23280565)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2864 (class 2606 OID 23280570)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2860 (class 2606 OID 23280590)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2866 (class 2606 OID 23280560)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2862 (class 2606 OID 23280580)
-- Name: fk_11e93b5dbbc7a989; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dbbc7a989 FOREIGN KEY (dogodek_splosni_id) REFERENCES dogodeksplosni(id);


--
-- TOC entry 2861 (class 2606 OID 23280585)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2863 (class 2606 OID 23280575)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2902 (class 2606 OID 23280760)
-- Name: fk_11ffe6e05c75296c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e05c75296c FOREIGN KEY (vrstastroska_id) REFERENCES vrstastroska(id);


--
-- TOC entry 2901 (class 2606 OID 23280765)
-- Name: fk_11ffe6e062b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e062b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2900 (class 2606 OID 23280770)
-- Name: fk_11ffe6e06beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e06beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2934 (class 2606 OID 23280935)
-- Name: fk_14a5d6d3727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d3727aca70 FOREIGN KEY (parent_id) REFERENCES mapa(id);


--
-- TOC entry 2935 (class 2606 OID 23280930)
-- Name: fk_14a5d6d38a4a6c12; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d38a4a6c12 FOREIGN KEY (lastnik_id) REFERENCES uporabniki(id);


--
-- TOC entry 2839 (class 2606 OID 23280450)
-- Name: fk_1c7adba589552cb2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba589552cb2 FOREIGN KEY (tipkli_id) REFERENCES tippopa(id);


--
-- TOC entry 2838 (class 2606 OID 23280455)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2883 (class 2606 OID 23280675)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2929 (class 2606 OID 23280915)
-- Name: fk_1ed92829253c4123; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829253c4123 FOREIGN KEY (avtor_id) REFERENCES uporabniki(id);


--
-- TOC entry 2930 (class 2606 OID 23280910)
-- Name: fk_1ed9282957ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282957ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2928 (class 2606 OID 23280920)
-- Name: fk_1ed9282987ff3295; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282987ff3295 FOREIGN KEY (zaklenil_id) REFERENCES uporabniki(id);


--
-- TOC entry 2931 (class 2606 OID 23280905)
-- Name: fk_1ed92829a54dbb1f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829a54dbb1f FOREIGN KEY (datoteka_id) REFERENCES datoteka(id);


--
-- TOC entry 2932 (class 2606 OID 23280900)
-- Name: fk_1ed92829ef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829ef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstazapisa(id);


--
-- TOC entry 2881 (class 2606 OID 23280670)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2882 (class 2606 OID 23280665)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2859 (class 2606 OID 23280550)
-- Name: fk_2390fc964ad2a6ea; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc964ad2a6ea FOREIGN KEY (tipvaje_id) REFERENCES tipvaje(id);


--
-- TOC entry 2858 (class 2606 OID 23280555)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2893 (class 2606 OID 23280715)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2891 (class 2606 OID 23280725)
-- Name: fk_23aeb9586b361365; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9586b361365 FOREIGN KEY (tipfunkcije_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2892 (class 2606 OID 23280720)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2848 (class 2606 OID 23280505)
-- Name: fk_2942b10710389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b10710389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2849 (class 2606 OID 23280500)
-- Name: fk_2942b1076beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b1076beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2879 (class 2606 OID 23280655)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2926 (class 2606 OID 23280890)
-- Name: fk_2d901816d6bc69d6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT fk_2d901816d6bc69d6 FOREIGN KEY (programrazno_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2905 (class 2606 OID 23280775)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2904 (class 2606 OID 23280780)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2903 (class 2606 OID 23280785)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 2933 (class 2606 OID 23280925)
-- Name: fk_2eaff9dcaf91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT fk_2eaff9dcaf91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id);


--
-- TOC entry 2907 (class 2606 OID 23280805)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2910 (class 2606 OID 23280790)
-- Name: fk_344a77a7c3b0d59; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a7c3b0d59 FOREIGN KEY (maticnioder_id) REFERENCES prostor(id);


--
-- TOC entry 2906 (class 2606 OID 23280810)
-- Name: fk_344a77a853a965c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a853a965c FOREIGN KEY (producent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2908 (class 2606 OID 23280800)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2909 (class 2606 OID 23280795)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2846 (class 2606 OID 23280495)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2847 (class 2606 OID 23280490)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2834 (class 2606 OID 23280435)
-- Name: fk_466966d769e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d769e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2835 (class 2606 OID 23280430)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2887 (class 2606 OID 23280695)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2831 (class 2606 OID 23280410)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2830 (class 2606 OID 23280415)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2888 (class 2606 OID 23280710)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2889 (class 2606 OID 23280705)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2890 (class 2606 OID 23280700)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2841 (class 2606 OID 23280465)
-- Name: fk_5e2fdc29289ed596; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29289ed596 FOREIGN KEY (vodja_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2842 (class 2606 OID 23280460)
-- Name: fk_5e2fdc29727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29727aca70 FOREIGN KEY (parent_id) REFERENCES organizacijskaenota(id);


--
-- TOC entry 2840 (class 2606 OID 23280470)
-- Name: fk_5e2fdc29f0020ed7; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29f0020ed7 FOREIGN KEY (namestnik_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2852 (class 2606 OID 23280530)
-- Name: fk_602f6e461174bb0e; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e461174bb0e FOREIGN KEY (dezurni_id) REFERENCES oseba(id);


--
-- TOC entry 2854 (class 2606 OID 23280520)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2853 (class 2606 OID 23280525)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2827 (class 2606 OID 23280395)
-- Name: fk_6054e804ff55f926; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT fk_6054e804ff55f926 FOREIGN KEY (stevilcenje_id) REFERENCES stevilcenje(id);


--
-- TOC entry 2871 (class 2606 OID 23280630)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2873 (class 2606 OID 23280620)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2874 (class 2606 OID 23280615)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2872 (class 2606 OID 23280625)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2829 (class 2606 OID 23280400)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2828 (class 2606 OID 23280405)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2884 (class 2606 OID 23280680)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2938 (class 2606 OID 23280950)
-- Name: fk_781826c67e3c61f9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT fk_781826c67e3c61f9 FOREIGN KEY (owner_id) REFERENCES uporabniki(id);


--
-- TOC entry 2898 (class 2606 OID 23280755)
-- Name: fk_7ab77b7910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT fk_7ab77b7910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2899 (class 2606 OID 23280750)
-- Name: fk_7ab77b79f35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT fk_7ab77b79f35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2940 (class 2606 OID 23280955)
-- Name: fk_7adc957157ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc957157ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2939 (class 2606 OID 23280960)
-- Name: fk_7adc9571fa6311ef; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc9571fa6311ef FOREIGN KEY (perm_id) REFERENCES permission(id);


--
-- TOC entry 2880 (class 2606 OID 23280660)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2897 (class 2606 OID 23280740)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2896 (class 2606 OID 23280745)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2917 (class 2606 OID 23280865)
-- Name: fk_8787a0e54ae1cd1c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e54ae1cd1c FOREIGN KEY (gostitelj_id) REFERENCES popa(id);


--
-- TOC entry 2918 (class 2606 OID 23280860)
-- Name: fk_8787a0e55d0da56c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e55d0da56c FOREIGN KEY (drzavagostovanja_id) REFERENCES drza(id);


--
-- TOC entry 2921 (class 2606 OID 23280845)
-- Name: fk_8787a0e562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2920 (class 2606 OID 23280850)
-- Name: fk_8787a0e57222d84b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e57222d84b FOREIGN KEY (tipprogramskeenote_id) REFERENCES tipprogramskeenote(id);


--
-- TOC entry 2919 (class 2606 OID 23280855)
-- Name: fk_8787a0e5771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e5771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2844 (class 2606 OID 23280480)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2845 (class 2606 OID 23280475)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2843 (class 2606 OID 23280485)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2885 (class 2606 OID 23280690)
-- Name: fk_952dd21969e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd21969e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2886 (class 2606 OID 23280685)
-- Name: fk_952dd2196beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd2196beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2924 (class 2606 OID 23280875)
-- Name: fk_97af082e38c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e38c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2923 (class 2606 OID 23280880)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2914 (class 2606 OID 23280835)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2913 (class 2606 OID 23280840)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2916 (class 2606 OID 23280825)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 2915 (class 2606 OID 23280830)
-- Name: fk_a4b7244fa4976613; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fa4976613 FOREIGN KEY (zaposlitev_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2895 (class 2606 OID 23280730)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2894 (class 2606 OID 23280735)
-- Name: fk_b24490415f1e9d88; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b24490415f1e9d88 FOREIGN KEY (organizacijskaenota_id) REFERENCES organizacijskaenota(id);


--
-- TOC entry 2875 (class 2606 OID 23280650)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2876 (class 2606 OID 23280645)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2878 (class 2606 OID 23280635)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2877 (class 2606 OID 23280640)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2911 (class 2606 OID 23280820)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2912 (class 2606 OID 23280815)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2850 (class 2606 OID 23280510)
-- Name: fk_c38372b2be04ea9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY report
    ADD CONSTRAINT fk_c38372b2be04ea9 FOREIGN KEY (job_id) REFERENCES job(id);


--
-- TOC entry 2851 (class 2606 OID 23280515)
-- Name: fk_c395a618a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY job
    ADD CONSTRAINT fk_c395a618a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2857 (class 2606 OID 23280545)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2856 (class 2606 OID 23280535)
-- Name: fk_d9ece16b5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava_abonma
    ADD CONSTRAINT fk_d9ece16b5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id) ON DELETE CASCADE;


--
-- TOC entry 2855 (class 2606 OID 23280540)
-- Name: fk_d9ece16bbe74b11; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava_abonma
    ADD CONSTRAINT fk_d9ece16bbe74b11 FOREIGN KEY (abonma_id) REFERENCES abonma(id) ON DELETE CASCADE;


--
-- TOC entry 2922 (class 2606 OID 23280870)
-- Name: fk_dba42fe79e3adf2c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkacdve
    ADD CONSTRAINT fk_dba42fe79e3adf2c FOREIGN KEY (programdela_id) REFERENCES programdela(id);


--
-- TOC entry 2925 (class 2606 OID 23280885)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2927 (class 2606 OID 23280895)
-- Name: fk_e7d4cf2638c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT fk_e7d4cf2638c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2937 (class 2606 OID 23280940)
-- Name: fk_e9f8ee8257ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee8257ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id) ON DELETE CASCADE;


--
-- TOC entry 2936 (class 2606 OID 23280945)
-- Name: fk_e9f8ee82af91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee82af91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id) ON DELETE CASCADE;


--
-- TOC entry 2832 (class 2606 OID 23280425)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2833 (class 2606 OID 23280420)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2837 (class 2606 OID 23280440)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2836 (class 2606 OID 23280445)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2867 (class 2606 OID 23280595)
-- Name: fk_f44a386d10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT fk_f44a386d10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2868 (class 2606 OID 23280610)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2869 (class 2606 OID 23280605)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2870 (class 2606 OID 23280600)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- Completed on 2015-10-23 15:52:46 CEST

--
-- PostgreSQL database dump complete
--

