--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.9
-- Dumped by pg_dump version 9.3.9
-- Started on 2015-09-21 14:44:11 CEST

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
-- TOC entry 3042 (class 0 OID 0)
-- Dependencies: 245
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_with_oids = false;

--
-- TOC entry 181 (class 1259 OID 20274424)
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
-- TOC entry 229 (class 1259 OID 20274979)
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
-- TOC entry 228 (class 1259 OID 20274962)
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
-- TOC entry 219 (class 1259 OID 20274841)
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
-- TOC entry 222 (class 1259 OID 20274871)
-- Name: besedilo; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE besedilo (
    id uuid NOT NULL,
    stevilka character varying(255) NOT NULL,
    naslov character varying(255) DEFAULT NULL::character varying,
    podnaslov character varying(255) DEFAULT NULL::character varying,
    jezik character varying(255) DEFAULT NULL::character varying,
    naslovizvirnika character varying(255) DEFAULT NULL::character varying,
    internacionalninaslov character varying(255) DEFAULT NULL::character varying,
    datumprejema date,
    moskevloge integer,
    zenskevloge integer,
    povzetekvsebine text,
    letoizida integer,
    krajizida character varying(255) DEFAULT NULL::character varying,
    zaloznik character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 243 (class 1259 OID 20275218)
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
-- TOC entry 197 (class 1259 OID 20274631)
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
-- TOC entry 199 (class 1259 OID 20274663)
-- Name: dogodeksplosni; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodeksplosni (
    id uuid NOT NULL
);


--
-- TOC entry 237 (class 1259 OID 20275144)
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
-- TOC entry 190 (class 1259 OID 20274545)
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
-- TOC entry 230 (class 1259 OID 20274992)
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
-- TOC entry 215 (class 1259 OID 20274796)
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
-- TOC entry 195 (class 1259 OID 20274610)
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
-- TOC entry 193 (class 1259 OID 20274585)
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
-- TOC entry 3043 (class 0 OID 0)
-- Dependencies: 193
-- Name: COLUMN job.data; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN job.data IS '(DC2Type:object)';


--
-- TOC entry 191 (class 1259 OID 20274562)
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
-- TOC entry 204 (class 1259 OID 20274710)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 241 (class 1259 OID 20275199)
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
-- TOC entry 242 (class 1259 OID 20275211)
-- Name: mapa_zapis; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE mapa_zapis (
    mapa_id uuid NOT NULL,
    zapis_id uuid NOT NULL
);


--
-- TOC entry 244 (class 1259 OID 20275233)
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
-- TOC entry 208 (class 1259 OID 20274735)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 188 (class 1259 OID 20274519)
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
-- TOC entry 182 (class 1259 OID 20274433)
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
-- TOC entry 183 (class 1259 OID 20274444)
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
-- TOC entry 178 (class 1259 OID 20274398)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 180 (class 1259 OID 20274417)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 209 (class 1259 OID 20274742)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 213 (class 1259 OID 20274776)
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
-- TOC entry 225 (class 1259 OID 20274910)
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
    aktivna boolean,
    zaposlenvdrjz boolean,
    samozaposlen boolean,
    igralec boolean,
    opis text
);


--
-- TOC entry 185 (class 1259 OID 20274477)
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
-- TOC entry 187 (class 1259 OID 20274511)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 232 (class 1259 OID 20275090)
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
-- TOC entry 205 (class 1259 OID 20274716)
-- Name: postavkaracuna; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE postavkaracuna (
    id uuid NOT NULL,
    racun_id uuid
);


--
-- TOC entry 186 (class 1259 OID 20274496)
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
-- TOC entry 194 (class 1259 OID 20274600)
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
-- TOC entry 207 (class 1259 OID 20274728)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 233 (class 1259 OID 20275104)
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
-- TOC entry 234 (class 1259 OID 20275114)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    sifra character varying(4) NOT NULL,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 231 (class 1259 OID 20275047)
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
-- TOC entry 235 (class 1259 OID 20275122)
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
-- TOC entry 211 (class 1259 OID 20274757)
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
-- TOC entry 203 (class 1259 OID 20274701)
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
-- TOC entry 202 (class 1259 OID 20274691)
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
-- TOC entry 224 (class 1259 OID 20274899)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying,
    status character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 218 (class 1259 OID 20274831)
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
-- TOC entry 192 (class 1259 OID 20274574)
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
-- TOC entry 175 (class 1259 OID 20274369)
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
-- TOC entry 174 (class 1259 OID 20274367)
-- Name: revizije_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE revizije_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3044 (class 0 OID 0)
-- Dependencies: 174
-- Name: revizije_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE revizije_id_seq OWNED BY revizije.id;


--
-- TOC entry 212 (class 1259 OID 20274770)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 179 (class 1259 OID 20274407)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 177 (class 1259 OID 20274391)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 214 (class 1259 OID 20274784)
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
-- TOC entry 206 (class 1259 OID 20274722)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 200 (class 1259 OID 20274668)
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
-- TOC entry 173 (class 1259 OID 20274356)
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
-- TOC entry 172 (class 1259 OID 20274348)
-- Name: stevilcenjekonfig; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjekonfig (
    id uuid NOT NULL,
    stevilcenje_id uuid,
    dok character varying(100) DEFAULT NULL::character varying
);


--
-- TOC entry 171 (class 1259 OID 20274343)
-- Name: stevilcenjestanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjestanje (
    id uuid NOT NULL,
    objid uuid NOT NULL,
    leto integer NOT NULL,
    stevilka integer
);


--
-- TOC entry 220 (class 1259 OID 20274848)
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
-- TOC entry 184 (class 1259 OID 20274469)
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
-- TOC entry 201 (class 1259 OID 20274678)
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
-- TOC entry 223 (class 1259 OID 20274887)
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
-- TOC entry 236 (class 1259 OID 20275132)
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
-- TOC entry 189 (class 1259 OID 20274531)
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
-- TOC entry 176 (class 1259 OID 20274378)
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
-- TOC entry 227 (class 1259 OID 20274937)
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
-- TOC entry 196 (class 1259 OID 20274621)
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
-- TOC entry 210 (class 1259 OID 20274749)
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
-- TOC entry 221 (class 1259 OID 20274862)
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
-- TOC entry 239 (class 1259 OID 20275179)
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
-- TOC entry 238 (class 1259 OID 20275151)
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
-- TOC entry 240 (class 1259 OID 20275191)
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
-- TOC entry 217 (class 1259 OID 20274821)
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
-- TOC entry 198 (class 1259 OID 20274657)
-- Name: zasedenost; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zasedenost (
    id uuid NOT NULL,
    oseba_id uuid
);


--
-- TOC entry 226 (class 1259 OID 20274927)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 216 (class 1259 OID 20274811)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 2201 (class 2604 OID 20274372)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 2972 (class 0 OID 20274424)
-- Dependencies: 181
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
\.


--
-- TOC entry 3020 (class 0 OID 20274979)
-- Dependencies: 229
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, zaposlitev_id, oseba_id, pogodba_id, sifra, zaposlen, zacetek, konec, opomba, sort, privzeti, aktivna, imapogodbo, pomembna) FROM stdin;
000c0000-55ff-fb99-c6f7-b6fde1109067	000d0000-55ff-fb99-21bf-c92211a5a899	\N	00090000-55ff-fb99-78c4-18e53724eea6	000b0000-55ff-fb99-080e-6aad218ea9d1	0001	f	\N	\N	\N	3	t	\N	t	t
000c0000-55ff-fb99-0f83-5ad3d38101e6	000d0000-55ff-fb99-9acf-d57d760aac38	00100000-55ff-fb99-f15a-8754017aa21f	00090000-55ff-fb99-0fc2-301384d7b9eb	\N	0002	t	2016-01-01	\N	\N	8	t	\N	f	f
000c0000-55ff-fb99-1dc4-693b219d1e89	000d0000-55ff-fb99-e688-633b92e30681	00100000-55ff-fb99-cc25-2020f5b6c7e4	00090000-55ff-fb99-4840-baa5db7daeba	\N	0003	t	\N	2015-09-21	\N	2	t	\N	f	f
000c0000-55ff-fb99-d62d-fc9647a2efeb	000d0000-55ff-fb99-3028-77b03187182e	\N	00090000-55ff-fb99-8890-03bbad573bbc	\N	0004	f	2016-01-01	2016-01-01	\N	26	t	\N	f	f
000c0000-55ff-fb99-4d7e-a8d42d898978	000d0000-55ff-fb99-bfcf-9aa9c54cfe5a	\N	00090000-55ff-fb99-7152-0f7df1fd3643	\N	0005	f	2016-01-01	2016-01-01	\N	7	t	\N	f	f
000c0000-55ff-fb99-1ecb-bbc1c10b01a6	000d0000-55ff-fb99-5f81-e17b38593061	\N	00090000-55ff-fb99-8ba6-1c0492b0d584	000b0000-55ff-fb99-3e05-5c5b6104f209	0006	f	2016-01-01	2016-01-01	\N	1	t	\N	t	t
000c0000-55ff-fb99-e30a-0ab851131e9e	000d0000-55ff-fb99-ba74-476454e0a760	00100000-55ff-fb99-1a15-028ba1ab788a	00090000-55ff-fb99-9792-5471d1f582a7	\N	0007	t	2016-01-01	2016-01-01	\N	14	t	\N	f	t
000c0000-55ff-fb99-6913-ee715335c4f9	000d0000-55ff-fb99-be3c-c427dbaa7f31	\N	00090000-55ff-fb99-ec26-af9612781dff	000b0000-55ff-fb99-e8e8-1e85f9acb13e	0008	f	2016-01-01	2016-01-01	\N	12	t	\N	t	t
000c0000-55ff-fb99-9143-536f0ebb2faf	000d0000-55ff-fb99-ba74-476454e0a760	00100000-55ff-fb99-5457-e64dd3d181aa	00090000-55ff-fb99-c3e0-1ae0fc70d2b4	\N	0009	t	2017-01-01	2017-01-01	\N	15	t	\N	f	t
000c0000-55ff-fb99-4dfd-1fb4f26c364d	000d0000-55ff-fb99-ba74-476454e0a760	00100000-55ff-fb99-3995-d1321d502774	00090000-55ff-fb99-6168-044b36476c7e	\N	0010	t	\N	2015-09-21	\N	16	f	\N	f	t
000c0000-55ff-fb99-db24-46a5dfa5ad7e	000d0000-55ff-fb99-ba74-476454e0a760	00100000-55ff-fb99-9bd7-8c06f4b5c958	00090000-55ff-fb99-a996-72fd63d51b5b	\N	0011	t	2017-01-01	\N	\N	17	f	\N	f	t
000c0000-55ff-fb99-b35b-37f039ad6eff	000d0000-55ff-fb99-5572-89f23fd8e62a	\N	00090000-55ff-fb99-0fc2-301384d7b9eb	000b0000-55ff-fb99-62ec-ba5b17a72821	0012	f	\N	\N	\N	2	t	\N	t	t
\.


--
-- TOC entry 3019 (class 0 OID 20274962)
-- Dependencies: 228
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 3010 (class 0 OID 20274841)
-- Dependencies: 219
-- Data for Name: avtorbesedila; Type: TABLE DATA; Schema: public; Owner: -
--

COPY avtorbesedila (id, besedilo_id, oseba_id, tipavtorja, zaporedna, alivnaslovu) FROM stdin;
003d0000-55ff-fb99-20ee-c5710c682b66	00160000-55ff-fb98-2413-e487968ae2b4	00090000-55ff-fb99-e8a8-73c69e85db8a	Avtor originala	10	t
003d0000-55ff-fb99-ece4-0f5325bff991	00160000-55ff-fb98-2413-e487968ae2b4	00090000-55ff-fb99-947c-74378180ffe0	Predelava	14	t
003d0000-55ff-fb99-f46c-7cb09eeb638d	00160000-55ff-fb98-4b9a-dc447e635fc9	00090000-55ff-fb99-8775-ce91eb1b73cd	Avtor originala	11	t
003d0000-55ff-fb99-9395-a5c3e363c20b	00160000-55ff-fb98-57ef-b5c17747a8bc	00090000-55ff-fb99-25a2-76b71c857123	Avtor originala	12	t
003d0000-55ff-fb99-75bb-e7061468890e	00160000-55ff-fb98-2413-e487968ae2b4	00090000-55ff-fb99-6217-4e47e77d4399	Predelava	18	f
\.


--
-- TOC entry 3013 (class 0 OID 20274871)
-- Dependencies: 222
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, stevilka, naslov, podnaslov, jezik, naslovizvirnika, internacionalninaslov, datumprejema, moskevloge, zenskevloge, povzetekvsebine, letoizida, krajizida, zaloznik) FROM stdin;
00160000-55ff-fb98-2413-e487968ae2b4	0001	Sen kresne noči		slovenščina	A Midsummer Night's Dream	\N	2015-04-26	5	5	Nastopajo Titanija, Hipolita, Oberon, ...	\N	\N	\N
00160000-55ff-fb98-4b9a-dc447e635fc9	0002	Bratje Karamazovi		slovenščina	Bratja Karamazjovji	\N	2015-12-04	4	1	Svetovna uspešnica	\N	\N	\N
00160000-55ff-fb98-57ef-b5c17747a8bc	0003	Smoletov Vrt		slovenščina		\N	2015-05-26	2	8		\N	\N	\N
\.


--
-- TOC entry 3034 (class 0 OID 20275218)
-- Dependencies: 243
-- Data for Name: datoteka; Type: TABLE DATA; Schema: public; Owner: -
--

COPY datoteka (id, owner_id, filename, transfers, size, format, hash, createdat, uploadedat, upor, datknj) FROM stdin;
\.


--
-- TOC entry 2988 (class 0 OID 20274631)
-- Dependencies: 197
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_splosni_id, prostor_id, sezona_id, planiranzacetek, allday, zacetek, konec, status, razred, termin, title) FROM stdin;
00180000-55ff-fb99-4ee7-681fa7e92cf7	\N	\N	00200000-55ff-fb99-7fa5-361cbde16ca4	\N	\N	\N	\N	2015-06-26 10:00:00	f	2015-06-26 10:00:00	2015-06-26 12:00:00	200s	200s		dogodek 1
00180000-55ff-fb99-3375-5c2fb92bbd32	\N	\N	00200000-55ff-fb99-3a69-b88bb260fc3a	\N	\N	\N	\N	2015-06-27 10:00:00	f	2015-06-27 10:00:00	2015-06-27 12:00:00	300s	200s		dogodek 2
00180000-55ff-fb99-c617-4e849fc2bf3b	\N	\N	00200000-55ff-fb99-fbd7-4ebc7047d09a	\N	\N	\N	\N	2015-08-01 20:00:00	f	2015-08-01 20:00:00	2015-08-01 23:00:00	400s	200s		dogodek 3
00180000-55ff-fb99-b0f5-35dd19b86d17	\N	\N	00200000-55ff-fb99-4665-a1596dbbb379	\N	\N	\N	\N	2015-08-01 20:00:00	f	2015-08-01 20:00:00	2015-08-01 23:00:00	100s	200s		dogodek 4
00180000-55ff-fb99-7ad4-8465c98950cf	\N	\N	00200000-55ff-fb99-7d25-a043c64cdf75	\N	\N	\N	\N	2015-08-01 20:00:00	f	2015-08-01 20:00:00	2015-08-01 23:00:00	500s	200s		dogodek 5
\.


--
-- TOC entry 2990 (class 0 OID 20274663)
-- Dependencies: 199
-- Data for Name: dogodeksplosni; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodeksplosni (id) FROM stdin;
\.


--
-- TOC entry 3028 (class 0 OID 20275144)
-- Dependencies: 237
-- Data for Name: drugivir; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drugivir (id, znesek, opis, mednarodni, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 2981 (class 0 OID 20274545)
-- Dependencies: 190
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-55ff-fb97-2d8d-3d64bec35eb0	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-55ff-fb97-f5fc-a029fd5b5546	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-55ff-fb97-1e91-3d97d3148906	AL	ALB	008	Albania 	Albanija	\N
00040000-55ff-fb97-e743-3059abcfafe5	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-55ff-fb97-8434-a07511396943	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-55ff-fb97-19e3-905dfdbd7697	AD	AND	020	Andorra 	Andora	\N
00040000-55ff-fb97-67a3-e09b6a52e261	AO	AGO	024	Angola 	Angola	\N
00040000-55ff-fb97-be97-7eb100ff73f0	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-55ff-fb97-3234-7ccae8cb7590	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-55ff-fb97-6d8b-1531d1d5103d	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-55ff-fb97-4bfa-b5184f80a268	AR	ARG	032	Argentina 	Argenitna	\N
00040000-55ff-fb97-7d05-c1d008f33977	AM	ARM	051	Armenia 	Armenija	\N
00040000-55ff-fb97-0a46-4af02562323f	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-55ff-fb97-c781-0cb4f6f28bb7	AU	AUS	036	Australia 	Avstralija	\N
00040000-55ff-fb97-da87-e0bb2071d930	AT	AUT	040	Austria 	Avstrija	\N
00040000-55ff-fb97-14a0-b450cd8fd300	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-55ff-fb97-0c65-3c31bb71edd9	BS	BHS	044	Bahamas 	Bahami	\N
00040000-55ff-fb97-9b73-3a19fc1310fb	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-55ff-fb97-d519-7c088d6e9729	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-55ff-fb97-111c-1d3bb4592700	BB	BRB	052	Barbados 	Barbados	\N
00040000-55ff-fb97-3223-cb978823cf3a	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-55ff-fb97-b1f1-fc5fde36b78e	BE	BEL	056	Belgium 	Belgija	\N
00040000-55ff-fb97-e608-c0f7f7b4c096	BZ	BLZ	084	Belize 	Belize	\N
00040000-55ff-fb97-4ab9-75fbbd0cb35f	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-55ff-fb97-b87d-4d5285a2b24a	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-55ff-fb97-3897-d47755eafc8f	BT	BTN	064	Bhutan 	Butan	\N
00040000-55ff-fb97-546c-f9f6704a49f5	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-55ff-fb97-b207-0e17bba0ea66	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-55ff-fb97-3bfb-c7905129ffb5	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-55ff-fb97-b4f1-475aa18ad8e6	BW	BWA	072	Botswana 	Bocvana	\N
00040000-55ff-fb97-058e-a02dff296408	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-55ff-fb97-218c-5d08d3dd4af7	BR	BRA	076	Brazil 	Brazilija	\N
00040000-55ff-fb97-72d8-4af3bdfd4854	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-55ff-fb97-a1fd-d3f4df1c7679	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-55ff-fb97-3e9f-3e6609ce5520	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-55ff-fb97-2d99-6d98d9bcdf4f	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-55ff-fb97-b68d-4279441ee2a2	BI	BDI	108	Burundi 	Burundi 	\N
00040000-55ff-fb97-6e3a-af425649968d	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-55ff-fb97-4a84-6b3716e35736	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-55ff-fb97-6fdb-6979615e4f26	CA	CAN	124	Canada 	Kanada	\N
00040000-55ff-fb97-204a-b61b61911e91	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-55ff-fb97-3e89-96d8374f73a5	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-55ff-fb97-66bf-dbf35718e2e2	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-55ff-fb97-fac8-2a63311118b9	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-55ff-fb97-d7fd-6dd123aff0f5	CL	CHL	152	Chile 	Čile	\N
00040000-55ff-fb97-1bea-807792bc7b54	CN	CHN	156	China 	Kitajska	\N
00040000-55ff-fb97-fdf7-c1a4f16e4625	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-55ff-fb97-aaf3-281ddfa58696	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-55ff-fb97-1f34-bf654a3da4d5	CO	COL	170	Colombia 	Kolumbija	\N
00040000-55ff-fb97-023b-123a7c28654f	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-55ff-fb97-3e05-8596d02e817a	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-55ff-fb97-2d52-542b4b13f389	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-55ff-fb97-8e72-ae2c7e8fd121	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-55ff-fb97-d4e9-b1faf641f089	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-55ff-fb97-522c-656d76036ca4	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-55ff-fb97-9162-7e43b14c629a	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-55ff-fb97-421c-f907e97ab262	CU	CUB	192	Cuba 	Kuba	\N
00040000-55ff-fb97-9ec2-8177256dddb6	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-55ff-fb97-28e5-a71b8baeb4bd	CY	CYP	196	Cyprus 	Ciper	\N
00040000-55ff-fb97-a0e4-ff2271cae598	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-55ff-fb97-531a-5dd3960cfb1e	DK	DNK	208	Denmark 	Danska	\N
00040000-55ff-fb97-d54d-eb4cc561f28f	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-55ff-fb97-3693-621a1d764d2c	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-55ff-fb97-a086-9eaf3e7dc317	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-55ff-fb97-a2b5-6aefd4a2ad2c	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-55ff-fb97-f8c5-fa71094537f4	EG	EGY	818	Egypt 	Egipt	\N
00040000-55ff-fb97-f49e-10b152bafc37	SV	SLV	222	El Salvador 	Salvador	\N
00040000-55ff-fb97-3a54-5943cc56fcba	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-55ff-fb97-a530-87399fe8e91c	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-55ff-fb97-db81-c6eedb35236d	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-55ff-fb97-a495-3129b154e4d8	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-55ff-fb97-e668-76f139cd6266	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-55ff-fb97-b7ec-109e342c5ccb	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-55ff-fb97-ca69-9813ecd8017e	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-55ff-fb97-64a5-d43047216b94	FI	FIN	246	Finland 	Finska	\N
00040000-55ff-fb97-c458-84993cf3d249	FR	FRA	250	France 	Francija	\N
00040000-55ff-fb97-c25d-240e87a6f78e	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-55ff-fb97-5136-ef64531c291a	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-55ff-fb97-492d-2be5a55f3e22	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-55ff-fb97-51a2-b886c3eae9df	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-55ff-fb97-c033-79a7e56db520	GA	GAB	266	Gabon 	Gabon	\N
00040000-55ff-fb97-7523-56e9619f6c01	GM	GMB	270	Gambia 	Gambija	\N
00040000-55ff-fb97-7999-59f793641a14	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-55ff-fb97-f66d-36f0d5fc65b2	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-55ff-fb97-f8ae-3733b7dc1d41	GH	GHA	288	Ghana 	Gana	\N
00040000-55ff-fb97-fff0-d086c408c576	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-55ff-fb97-a3ab-d6340dd43e02	GR	GRC	300	Greece 	Grčija	\N
00040000-55ff-fb97-fe69-74aa2f0c2d31	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-55ff-fb97-0271-78d3dce10e13	GD	GRD	308	Grenada 	Grenada	\N
00040000-55ff-fb97-bdbe-47ae391416a3	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-55ff-fb97-fd7c-0ac799e789a2	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-55ff-fb97-3aeb-40aacd9ac683	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-55ff-fb97-b827-eb63c5b98247	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-55ff-fb97-e905-fa7814fcb143	GN	GIN	324	Guinea 	Gvineja	\N
00040000-55ff-fb97-6bf1-59b686b42244	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-55ff-fb97-cb35-764f3676d2e6	GY	GUY	328	Guyana 	Gvajana	\N
00040000-55ff-fb97-fdf6-0c4fbf2d9529	HT	HTI	332	Haiti 	Haiti	\N
00040000-55ff-fb97-4a8c-8c968b82bc27	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-55ff-fb97-9f3a-ed2d736d3a0f	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-55ff-fb97-3fa2-be27c3b09536	HN	HND	340	Honduras 	Honduras	\N
00040000-55ff-fb97-fe13-47c448db1d2c	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-55ff-fb97-ddb3-61847074b7ff	HU	HUN	348	Hungary 	Madžarska	\N
00040000-55ff-fb97-9f71-5deb41acf8fc	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-55ff-fb97-188f-98652f92da58	IN	IND	356	India 	Indija	\N
00040000-55ff-fb97-a25e-6d2201976d57	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-55ff-fb97-a909-73bbcb1d46d6	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-55ff-fb97-0363-6c1ec769cceb	IQ	IRQ	368	Iraq 	Irak	\N
00040000-55ff-fb97-f959-49fbcb205bb3	IE	IRL	372	Ireland 	Irska	\N
00040000-55ff-fb97-39b7-4013e52f00c8	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-55ff-fb97-8a1f-a53c51666479	IL	ISR	376	Israel 	Izrael	\N
00040000-55ff-fb97-0aa6-7f752426aa24	IT	ITA	380	Italy 	Italija	\N
00040000-55ff-fb97-727d-3ecd6043b749	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-55ff-fb97-5477-113f633c68d3	JP	JPN	392	Japan 	Japonska	\N
00040000-55ff-fb97-ce29-680a5c6de7ac	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-55ff-fb97-4761-4353ed67649a	JO	JOR	400	Jordan 	Jordanija	\N
00040000-55ff-fb97-e2e0-c0424c8fad0b	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-55ff-fb97-7503-a2a343fab2f6	KE	KEN	404	Kenya 	Kenija	\N
00040000-55ff-fb97-bf82-9b20d10f69fa	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-55ff-fb97-977f-9ccbceba58a2	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-55ff-fb97-ea0f-075ee3cd0673	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-55ff-fb97-2c11-6f255dfd4fb3	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-55ff-fb97-f183-9d82a2e7c3f2	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-55ff-fb97-315a-f0c14b2993a5	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-55ff-fb97-6e33-12c7a8df4a40	LV	LVA	428	Latvia 	Latvija	\N
00040000-55ff-fb97-1707-5da6dad264b5	LB	LBN	422	Lebanon 	Libanon	\N
00040000-55ff-fb97-0da7-0066f501e067	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-55ff-fb97-eede-9e2372082d7a	LR	LBR	430	Liberia 	Liberija	\N
00040000-55ff-fb97-6f8e-a8f98ffa5919	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-55ff-fb97-234d-87a766b7de86	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-55ff-fb97-56d8-2773a06dcf27	LT	LTU	440	Lithuania 	Litva	\N
00040000-55ff-fb97-c81e-66f298330788	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-55ff-fb97-71a9-a9ea9322c67a	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-55ff-fb97-8be3-9f7a24474b7a	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-55ff-fb97-1ce9-8929a7d2396b	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-55ff-fb97-cb67-0dde97a2ede4	MW	MWI	454	Malawi 	Malavi	\N
00040000-55ff-fb97-95ab-8b6de6c474c9	MY	MYS	458	Malaysia 	Malezija	\N
00040000-55ff-fb97-38c9-0fb5baa246b8	MV	MDV	462	Maldives 	Maldivi	\N
00040000-55ff-fb97-ee96-48173c3c41e2	ML	MLI	466	Mali 	Mali	\N
00040000-55ff-fb97-6765-b895c4f41ea8	MT	MLT	470	Malta 	Malta	\N
00040000-55ff-fb97-df9b-ba3975a5b512	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-55ff-fb97-fd0c-3a8b7d780efa	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-55ff-fb97-891e-7acc72dd5723	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-55ff-fb97-5c97-eb25d01f4124	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-55ff-fb97-5e05-077746ec89a1	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-55ff-fb97-e6fa-5422f89c12ec	MX	MEX	484	Mexico 	Mehika	\N
00040000-55ff-fb97-25ce-3adabe0d2454	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-55ff-fb97-4be8-1c38369b91cf	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-55ff-fb97-2e89-0a8b2fe609ca	MC	MCO	492	Monaco 	Monako	\N
00040000-55ff-fb97-373d-e846f20e46f0	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-55ff-fb97-c94d-d8056c75629e	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-55ff-fb97-e162-cf16b529adb7	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-55ff-fb97-5c33-0821bb03ca61	MA	MAR	504	Morocco 	Maroko	\N
00040000-55ff-fb97-b4ab-037761fa2546	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-55ff-fb97-4881-3091c18a0a98	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-55ff-fb97-4327-b32b307911d9	NA	NAM	516	Namibia 	Namibija	\N
00040000-55ff-fb97-66ad-5c922d1cd41b	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-55ff-fb97-6bc4-90d782834f47	NP	NPL	524	Nepal 	Nepal	\N
00040000-55ff-fb97-9068-f2a8f6ee3877	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-55ff-fb97-802e-3bacb1f6a9a2	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-55ff-fb97-886e-a88310bdf746	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-55ff-fb97-4702-6d9f6564c769	NE	NER	562	Niger 	Niger 	\N
00040000-55ff-fb97-a47a-300a053fb38d	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-55ff-fb97-73c0-28b659bfc8f8	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-55ff-fb97-fc07-ed9b9dac9c9c	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-55ff-fb97-b362-b109205f0760	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-55ff-fb97-c60f-61c1e4af495c	NO	NOR	578	Norway 	Norveška	\N
00040000-55ff-fb97-f39b-df0d3e4e4e2a	OM	OMN	512	Oman 	Oman	\N
00040000-55ff-fb97-f44c-24f6d89414e9	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-55ff-fb97-7c48-b0ff041ccc28	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-55ff-fb97-ea2f-d2cfcfda91d3	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-55ff-fb97-ed5a-670a41d5c96c	PA	PAN	591	Panama 	Panama	\N
00040000-55ff-fb97-9fe7-feac5bd283d8	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-55ff-fb97-33e0-ebcc4a8ceb42	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-55ff-fb97-3e98-105c4cf3bb41	PE	PER	604	Peru 	Peru	\N
00040000-55ff-fb97-23c3-fc142c044a27	PH	PHL	608	Philippines 	Filipini	\N
00040000-55ff-fb97-e262-2945c59dd224	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-55ff-fb97-0c39-ea47d343af35	PL	POL	616	Poland 	Poljska	\N
00040000-55ff-fb97-7fb4-4a693418bf00	PT	PRT	620	Portugal 	Portugalska	\N
00040000-55ff-fb97-54ce-99fcfd58d958	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-55ff-fb97-7679-b765a743fa57	QA	QAT	634	Qatar 	Katar	\N
00040000-55ff-fb97-b2b2-b73bc05a5176	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-55ff-fb97-e448-12e7d4505e4e	RO	ROU	642	Romania 	Romunija	\N
00040000-55ff-fb97-25f3-ba58bc793c06	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-55ff-fb97-a5aa-ce0799ea15fa	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-55ff-fb97-9ed0-3e8f5cfaeed1	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-55ff-fb97-e0fa-ce0ec38a405b	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-55ff-fb97-df48-91c2a680d5c3	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-55ff-fb97-4af3-8f608facbafd	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-55ff-fb97-33e9-d99d515192bb	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-55ff-fb97-e735-b766a72343d4	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-55ff-fb97-1b60-e7f4158106d1	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-55ff-fb97-fadb-90ca9c5067c5	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-55ff-fb97-6a00-de6770a83e11	SM	SMR	674	San Marino 	San Marino	\N
00040000-55ff-fb97-15be-aad2bbd30024	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-55ff-fb97-4954-b06f0282d596	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-55ff-fb97-c9d8-bc1745f4245e	SN	SEN	686	Senegal 	Senegal	\N
00040000-55ff-fb97-40c2-d516281f16e6	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-55ff-fb97-9c56-95d72a4900d3	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-55ff-fb97-1f2c-fa7078fb8c02	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-55ff-fb97-08ea-6d9f368f81a2	SG	SGP	702	Singapore 	Singapur	\N
00040000-55ff-fb97-cfcf-ae75cc5385cb	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-55ff-fb97-21eb-b2daf71972db	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-55ff-fb97-3ec3-6d5f8c6a9ae9	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-55ff-fb97-a81c-16084207ddfc	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-55ff-fb97-60e8-6a7e93946239	SO	SOM	706	Somalia 	Somalija	\N
00040000-55ff-fb97-527e-df0467df7e07	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-55ff-fb97-3e3e-220aaa16126b	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-55ff-fb97-d887-d0e749fcfcd3	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-55ff-fb97-db17-724cc79ae59a	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-55ff-fb97-4beb-72d159393eb3	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-55ff-fb97-b07f-6af7335e08bd	SD	SDN	729	Sudan 	Sudan	\N
00040000-55ff-fb97-f1b6-cd8020e7d5e1	SR	SUR	740	Suriname 	Surinam	\N
00040000-55ff-fb97-1a39-d70a9a32006a	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-55ff-fb97-36a5-043d31eeffc2	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-55ff-fb97-9d34-36a2671e28fc	SE	SWE	752	Sweden 	Švedska	\N
00040000-55ff-fb97-903b-6d3c8fdf2765	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-55ff-fb97-79d3-fc55fe6815a1	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-55ff-fb97-feb3-f53b937cfb05	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-55ff-fb97-e14f-7176e01379af	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-55ff-fb97-f657-c9e39fa9c44b	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-55ff-fb97-9d26-4ea4570c8764	TH	THA	764	Thailand 	Tajska	\N
00040000-55ff-fb97-a298-dad1e4ffdde9	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-55ff-fb97-7352-aa07788337d3	TG	TGO	768	Togo 	Togo	\N
00040000-55ff-fb97-47c7-9f321880cb23	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-55ff-fb97-c058-7edfb4e9113d	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-55ff-fb97-823e-409906500938	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-55ff-fb97-9fcd-5d11787f4406	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-55ff-fb97-22d8-eb25b2c01908	TR	TUR	792	Turkey 	Turčija	\N
00040000-55ff-fb97-7a52-98c89ffb32c0	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-55ff-fb97-430e-6a663e584b63	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-55ff-fb97-7241-93861cad0614	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-55ff-fb97-54b7-107a149191f8	UG	UGA	800	Uganda 	Uganda	\N
00040000-55ff-fb97-8abb-e1879f397af9	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-55ff-fb97-dabe-1631b4cf547d	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-55ff-fb97-b228-3518d401ba52	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-55ff-fb97-1c10-ec795d139727	US	USA	840	United States 	Združene države Amerike	\N
00040000-55ff-fb97-f5ad-b497a89a811a	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-55ff-fb97-a25d-ee7ff5844931	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-55ff-fb97-d867-363559dd35ea	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-55ff-fb97-c24f-edc93e3a0a70	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-55ff-fb97-d6ed-d4f326e0a0e5	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-55ff-fb97-5577-92bcb640eb7f	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-55ff-fb97-ac32-59ab3ffd86c5	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-55ff-fb97-43c9-228765d44c1b	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-55ff-fb97-11b0-5029a7b7fb4b	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-55ff-fb97-e905-c064a4c19e60	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-55ff-fb97-0108-1ef115290ac8	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-55ff-fb97-ffef-fb3ecceec8e0	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-55ff-fb97-6342-d399647b5c28	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 3021 (class 0 OID 20274992)
-- Dependencies: 230
-- Data for Name: enotaprograma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY enotaprograma (id, uprizoritev_id, program_dela_id, gostitelj_id, celotnavrednost, nasdelez, celotnavrednostmat, celotnavrednostgostovsz, zaproseno, lastnasredstva, avtorskihonorarji, avtorskihonorarjisamoz, tantieme, avtorskepravice, materialni, imakoprodukcije, vlozekgostitelja, drugijavni, stzaposlenih, stzaposumet, stzaposdrug, sthonorarnih, sthonorarnihigr, sthonorarnihigrtujjz, sthonorarnihigrsamoz, obiskdoma, obiskkopr, obiskgost, obiskzamejo, obiskint, obiskkoprint, ponovidoma, ponovikopr, ponovizamejo, ponovigost, ponovikoprint, ponoviint, naziv, kpe, sort, tipprogramskeenote_id, tip, prikoproducentu, strosekodkpred, stroskiostali, krajgostovanja, ustanova, datumgostovanja, transportnistroski, dnevprvzad, drzavagostovanja_id, stpe, zvrst, stpredstav, stokroglihmiz, stpredstavitev, stdelavnic, stdrugidogodki, stprodukcij, caspriprave, casizvedbe, prizorisca, umetvodja, programskotelo, sttujihselektorjev) FROM stdin;
002f0000-55ff-fb99-aab4-02fa46ed7aae	000e0000-55ff-fb99-1f24-38317a871412	\N	\N	9000.30	9000.30	9000.30	0.00	3600.12	5299.98	4000.40	1000.40	200.20	200.30	4599.40	\N	0.00	100.20	0	2	2	2	2	2	\N	40	0	0	0	0	0	1	0	0	0	0	0		0.00	\N	002b0000-55ff-fb97-8d5b-19d56e4faf56	premiera	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-55ff-fb99-f94b-0a35d05fd910	000e0000-55ff-fb99-982c-ced10debc9f0	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	\N	60	0	0	0	0	0	1	0	0	0	0	0		0.00	\N	002b0000-55ff-fb97-9ace-8d67a0c5fdc0	premiera	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-55ff-fb99-277f-65e64d0ab2b2	000e0000-55ff-fb99-c10d-fd4e04f094f1	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	\N	60	0	0	0	0	0	1	0	0	0	0	0		0.00	\N	002b0000-55ff-fb97-8d5b-19d56e4faf56	premiera	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-55ff-fb99-8d22-a6aa4d6cb53e	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-54.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	54.20	5	0	0	3	0	0	\N	22	0	0	0	0	0	0	0	0	0	0	0	Urejanje portala	0.00	10	\N	razno	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-55ff-fb99-45f4-832b2b553981	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-31.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	31.20	5	0	0	3	0	0	\N	202	0	0	0	0	0	0	0	0	0	0	0	Delavnice otroci	0.00	8	\N	razno	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 3006 (class 0 OID 20274796)
-- Dependencies: 215
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, podrocje, vodjaekipe, naziv, komentar, velikost, pomembna, sort, seplanira, dovoliprekrivanje, maxprekrivanj, tipfunkcije_id) FROM stdin;
000d0000-55ff-fb99-21bf-c92211a5a899	000e0000-55ff-fb99-982c-ced10debc9f0	000c0000-55ff-fb99-c6f7-b6fde1109067	igralec	\N	Tezej	glavna vloga	velika	t	5	t	t	\N	000f0000-55ff-fb97-bc24-8764f651b74b
000d0000-55ff-fb99-9acf-d57d760aac38	000e0000-55ff-fb99-982c-ced10debc9f0	000c0000-55ff-fb99-0f83-5ad3d38101e6	umetnik	\N	Režija		velika	t	8	t	t	\N	000f0000-55ff-fb97-cea7-35c507a92189
000d0000-55ff-fb99-e688-633b92e30681	000e0000-55ff-fb99-982c-ced10debc9f0	000c0000-55ff-fb99-1dc4-693b219d1e89	inspicient	t	Inšpicient			t	8	t	t	\N	000f0000-55ff-fb97-f423-77c33ddd88ad
000d0000-55ff-fb99-3028-77b03187182e	000e0000-55ff-fb99-982c-ced10debc9f0	000c0000-55ff-fb99-d62d-fc9647a2efeb	tehnik	t	Tehnični vodja			t	8	t	t	\N	000f0000-55ff-fb97-2f91-af89621df2eb
000d0000-55ff-fb99-bfcf-9aa9c54cfe5a	000e0000-55ff-fb99-982c-ced10debc9f0	000c0000-55ff-fb99-4d7e-a8d42d898978	tehnik	\N	Razsvetljava			t	3	t	t	\N	000f0000-55ff-fb97-2f91-af89621df2eb
000d0000-55ff-fb99-5f81-e17b38593061	000e0000-55ff-fb99-982c-ced10debc9f0	000c0000-55ff-fb99-1ecb-bbc1c10b01a6	igralec	\N	Helena	glavna vloga	velika	t	5	t	t	\N	000f0000-55ff-fb97-bc24-8764f651b74b
000d0000-55ff-fb99-ba74-476454e0a760	000e0000-55ff-fb99-982c-ced10debc9f0	000c0000-55ff-fb99-9143-536f0ebb2faf	igralec	\N	Hipolita	glavna vloga	velika	t	6	t	t	\N	000f0000-55ff-fb97-bc24-8764f651b74b
000d0000-55ff-fb99-be3c-c427dbaa7f31	000e0000-55ff-fb99-982c-ced10debc9f0	000c0000-55ff-fb99-6913-ee715335c4f9	umetnik	\N	Lektoriranje			t	22	t	t	\N	000f0000-55ff-fb97-44e3-fc9ceeb25870
000d0000-55ff-fb99-5572-89f23fd8e62a	000e0000-55ff-fb99-982c-ced10debc9f0	000c0000-55ff-fb99-b35b-37f039ad6eff	umetnik	\N	Avtor	Avtor besedila		t	2	t	f	\N	000f0000-55ff-fb97-807a-16ec61bc92dd
\.


--
-- TOC entry 2986 (class 0 OID 20274610)
-- Dependencies: 195
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta, zamejstvo, kraj) FROM stdin;
\.


--
-- TOC entry 2984 (class 0 OID 20274585)
-- Dependencies: 193
-- Data for Name: job; Type: TABLE DATA; Schema: public; Owner: -
--

COPY job (id, user_id, name, task, status, log, datum, casizvedbe, izveden, data, alert, hidden, upor, datknj) FROM stdin;
\.


--
-- TOC entry 2982 (class 0 OID 20274562)
-- Dependencies: 191
-- Data for Name: kontaktnaoseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kontaktnaoseba (id, popa_id, oseba_id, status, funkcija, opis) FROM stdin;
00260000-55ff-fb99-bc88-14fe8861fa3c	00080000-55ff-fb98-675a-7a7462618307	00090000-55ff-fb99-6168-044b36476c7e	AK		igralka
\.


--
-- TOC entry 2995 (class 0 OID 20274710)
-- Dependencies: 204
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 3032 (class 0 OID 20275199)
-- Dependencies: 241
-- Data for Name: mapa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa (id, lastnik_id, parent_id, ime, komentar, caskreiranja, casspremembe, javnidostop, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3033 (class 0 OID 20275211)
-- Dependencies: 242
-- Data for Name: mapa_zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa_zapis (mapa_id, zapis_id) FROM stdin;
\.


--
-- TOC entry 3035 (class 0 OID 20275233)
-- Dependencies: 244
-- Data for Name: mapaacl; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapaacl (id, mapa_id, perm_id, dostop, upor, datknj) FROM stdin;
\.


--
-- TOC entry 2961 (class 0 OID 19946838)
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
-- TOC entry 2999 (class 0 OID 20274735)
-- Dependencies: 208
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 2979 (class 0 OID 20274519)
-- Dependencies: 188
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-55ff-fb97-c2fa-95b49523d4d1	popa.stakli	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-55ff-fb97-d929-41d5ae1aded3	oseba.spol	array	a:2:{s:1:"M";a:1:{s:5:"label";s:6:"Moški";}s:1:"Z";a:1:{s:5:"label";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-55ff-fb97-4eda-74d2663cf092	telefonska.vrsta	array	a:3:{s:7:"mobilna";a:1:{s:5:"label";s:7:"Mobilni";}s:6:"domaca";a:1:{s:5:"label";s:6:"Domač";}s:6:"fiksna";a:1:{s:5:"label";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-55ff-fb97-ab1b-2c23b7f3ab4b	kontaktnaoseba.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status kontaktne osebe
00000000-55ff-fb97-bdbb-19c603a9dc8c	dogodek.status	array	a:7:{s:4:"100s";a:1:{s:5:"label";s:11:"Dolgoročno";}s:4:"200s";a:1:{s:5:"label";s:9:"Planirano";}s:4:"300s";a:1:{s:5:"label";s:8:"Fiksiran";}s:4:"400s";a:1:{s:5:"label";s:17:"Potrjen - interno";}s:4:"500s";a:1:{s:5:"label";s:15:"Potrjen - javno";}s:4:"600s";a:1:{s:5:"label";s:10:"Zaključen";}s:4:"700s";a:1:{s:5:"label";s:7:"Obdelan";}}	f	t	t	\N	Tabela statusa dogodkov
00000000-55ff-fb97-00ce-cb0d62f650e1	dogodek.razred	array	a:5:{s:4:"100s";a:2:{s:5:"label";s:9:"Predstava";s:4:"type";s:9:"predstava";}s:4:"200s";a:2:{s:5:"label";s:4:"Vaja";s:4:"type";s:4:"vaja";}s:4:"300s";a:2:{s:5:"label";s:10:"Gostovanje";s:4:"type";s:10:"gostovanje";}s:4:"400s";a:2:{s:5:"label";s:16:"Splošni dogodek";s:4:"type";s:8:"splošni";}s:4:"500s";a:2:{s:5:"label";s:10:"Zasedenost";s:4:"type";s:10:"zasedenost";}}	f	t	t	\N	Tabela razredov dogodkov, ki jih aplikacija podpira
00000000-55ff-fb97-d3b9-2d6a7a3ea663	uprizoritev.faza	array	a:6:{s:20:"predprodukcija-ideja";a:1:{s:5:"label";s:16:"Dolgoročni plan";}s:20:"predprodukcija-poziv";a:1:{s:5:"label";s:29:"Predprodukcija, v fazi poziva";}s:30:"predprodukcija-potrjen_program";a:1:{s:5:"label";s:34:"Predprodukcija, program je potrjen";}s:10:"produkcija";a:1:{s:5:"label";s:10:"Produkcija";}s:14:"postprodukcija";a:1:{s:5:"label";s:14:"Postprodukcija";}s:5:"arhiv";a:1:{s:5:"label";s:10:"Arhivirana";}}	f	t	f	\N	Faza uprizoritve
00000000-55ff-fb97-576f-424654abf9e2	funkcija.podrocje	array	a:4:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}}	f	t	f	\N	Področje funkcije
00000000-55ff-fb97-0cd8-f4b564cd6c88	tipfunkcije.podrocje	array	a:4:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}}	f	t	f	\N	Področje funkcije
00000000-55ff-fb97-cf26-e10ee4ec4a30	funkcija.velikost	array	a:4:{s:7:"stataza";a:1:{s:5:"label";s:8:"Stataža";}s:4:"mala";a:1:{s:5:"label";s:21:"Mala vloga / funkcija";}s:7:"srednja";a:1:{s:5:"label";s:24:"Srednja vloga / funkcija";}s:6:"velika";a:1:{s:5:"label";s:23:"Velika vloga / funkcija";}}	f	t	f	\N	Velikost funkcije
00000000-55ff-fb97-67c4-b7e65ef9265d	zaposlitev.status	array	a:2:{s:1:"A";a:1:{s:5:"label";s:7:"Aktivna";}s:1:"N";a:1:{s:5:"label";s:9:"Neaktivna";}}	f	t	f	\N	Status zaposlitve
00000000-55ff-fb97-c5e9-31c3155ecb4f	produkcijskahisa.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktivna";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktivna";}}	f	t	f	\N	Status produkcijske hiše
00000000-55ff-fb97-a734-eac4d3c9db2d	strosekuprizoritve.tipstroska	array	a:1:{s:10:"materialni";a:1:{s:5:"label";s:19:"Materialni strošek";}}	f	t	f	\N	Tip stroška
00000000-55ff-fb97-adfa-371254c1fe9e	fsacl.dostop	array	a:4:{s:1:"X";a:1:{s:5:"label";s:12:"Brez dostopa";}s:1:"R";a:1:{s:5:"label";s:11:"Samo branje";}s:2:"RW";a:1:{s:5:"label";s:17:"Branje in pisanje";}s:3:"RWD";a:1:{s:5:"label";s:26:"Branje pisanje in brisanje";}}	f	t	f	\N	ACL Javni dostop
00000000-55ff-fb98-20dc-3d1d4966f4aa	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-55ff-fb98-ffb8-f7c512a07397	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-55ff-fb98-3d59-9048ee2e04e5	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-55ff-fb98-9217-1080ea60f21f	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-55ff-fb98-77d9-5ce25ab16cdf	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
00000000-55ff-fb9a-d145-384e602431b7	application.tenant.maticnopodjetje	string	s:4:"1001";	f	t	f		Šifra matičnega podjetja v Popa in ProdukcijskaHisa
\.


--
-- TOC entry 2973 (class 0 OID 20274433)
-- Dependencies: 182
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-55ff-fb98-07fe-04ed0bc208a5	00000000-55ff-fb98-20dc-3d1d4966f4aa	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-55ff-fb98-0e26-4e40189574c2	00000000-55ff-fb98-20dc-3d1d4966f4aa	00010000-55ff-fb97-d941-0874d3aff4e6	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-55ff-fb98-326a-27bae1c05a7a	00000000-55ff-fb98-ffb8-f7c512a07397	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 2974 (class 0 OID 20274444)
-- Dependencies: 183
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naslov_id, sifra, naziv, ime, priimek, funkcija, srednjeime, polnoime, psevdonim, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
00090000-55ff-fb99-78c4-18e53724eea6	\N	\N	0001	g.	Janez	Novak	a	Peter	Janez Peter Novak	Jani	jani.novak@xxx.xx	1958-01-06	0601958000000	123456789	M	Jani Janez	Slovenija	Slovenija	Ljubljana
00090000-55ff-fb99-8890-03bbad573bbc	00010000-55ff-fb98-c96a-d50979be1b1f	\N	0002	dr.	Anton	Horvat	b		Anton  Horvat	Tona	anton.horvat@xxx.xx	1968-02-12	1202968111111	234567890	M		Slovenija	Slovenija	Maribor
00090000-55ff-fb99-4840-baa5db7daeba	00010000-55ff-fb98-9d32-557a3020e6c0	\N	0003		Ivan	Kovačič	c		Ivan  Kovačič	Ivo	ivan.kovacic@xxx.xx	1975-03-26	2603976222222	345678901	M		Slovenija	Slovenija	Celje
00090000-55ff-fb99-c3e0-1ae0fc70d2b4	00010000-55ff-fb98-71ba-671677c2690d	\N	0004	prof.	Jožef	Krajnc	d		Jožef  Krajnc	Joža	jozef.krajnc@xxx.xx	1971-04-30	3004971333333	456789012	M		Slovenija	Slovenija	Kranj
00090000-55ff-fb99-0734-e249c15f7fac	\N	\N	0005		Marko	Zupančič	e		Marko  Zupančič		marko.zupancic@xxx.xx	1984-05-07	0705984444444	567890123	M		Slovenija	Slovenija	Koper
00090000-55ff-fb99-8ba6-1c0492b0d584	\N	\N	0006	ga.	Marija	Kovač	f		Marija  Kovač		marija.kovac@xxx.xx	1962-06-19	1906962444444	678901234	Z		Slovenija	Slovenija	Murska Sobota
00090000-55ff-fb99-a996-72fd63d51b5b	\N	\N	0007	ga.	Ana	Potočnik	g		Ana  Potočnik		ana.potocnik@xxx.xx	1975-07-24	2407975555555	789012345	Z		Slovenija	Slovenija	Novo Mesto
00090000-55ff-fb99-9792-5471d1f582a7	\N	\N	0008	ga.	Maja	Mlakar	h		Maja  Mlakar		maja.mlakar@xxx.xx	1986-08-02	0208986666666	890123456	Z		Slovenija	Slovenija	Nova Gorica
00090000-55ff-fb99-6168-044b36476c7e	00010000-55ff-fb98-06ae-afb0349581d9	\N	0009		Irena	Kos	i		Irena  Kos		irena.kos@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Ptuj
00090000-55ff-fb99-0fc2-301384d7b9eb	\N	\N	0010		Mojca	Vidmar	J		Mojca  Vidmar		mojca.vidmar@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Idrija
00090000-55ff-fb99-df93-d6e25740c4d9	\N	\N	0011		xx	write protected12345	a		xx  write protected12345		xx@xxx.xx	\N	\N	\N	Z		\N	\N	\N
00090000-55ff-fb99-7152-0f7df1fd3643	\N	\N	0012		Luka	Golob	luč	a	Luka a Golob		luka.golob@xxx.xx	\N	\N	\N	M		\N	\N	\N
00090000-55ff-fb99-ec26-af9612781dff	00010000-55ff-fb98-103e-ac07a23958c4	\N	0013		Tatjana	Božič	tajnica	a	Tatjana a Božič		tatjana.bozic@xxx.xx	\N	\N	\N	Z		\N	\N	\N
00090000-55ff-fb99-e8a8-73c69e85db8a	\N	\N	0014		William	Shakespeare	avtor		William  Shakespeare		\N	\N	\N	\N	M		\N	\N	\N
00090000-55ff-fb99-947c-74378180ffe0	\N	\N	0015		Nebojša	Kavader	avtor		Nebojša  Kavader		\N	\N	\N	\N	M		\N	\N	\N
00090000-55ff-fb99-8775-ce91eb1b73cd	\N	\N	0016		Fjodor	Dostojevski	avtor	Mihajlovič	Fjodor Mihajlovič Dostojevski		\N	\N	\N	\N	M		\N	\N	\N
00090000-55ff-fb99-25a2-76b71c857123	\N	\N	0017		Berta 	Hočevar	avtorica		Berta   Hočevar		\N	\N	\N	\N	Z		\N	\N	\N
00090000-55ff-fb99-6217-4e47e77d4399	\N	\N	0018		Katarina	Podbevšek	lektorica		Katarina  Podbevšek		\N	\N	\N	\N	Z		\N	\N	\N
\.


--
-- TOC entry 2969 (class 0 OID 20274398)
-- Dependencies: 178
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-55ff-fb97-6915-7d27aefab314	Aaa-read	Aaa (User,Role,Permission) - branje	f
00030000-55ff-fb97-c3c4-2d98debc2e33	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	f
00030000-55ff-fb97-590c-c7ca3871f71f	TerminStoritve-vse	TerminStoritve - spreminjanje vseh zapisov	f
00030000-55ff-fb97-2884-691cae7abb6c	Dogodek-readVse	Dogodek - branje vseh, ne glede na status dogodka	f
00030000-55ff-fb97-9003-db735d327d08	Oseba-vse	Oseba - vse - za testiranje assert	f
00030000-55ff-fb97-ac36-d9b64022302a	ProgramDela-lock	ProgramDela - zaklepanje	f
00030000-55ff-fb97-ca52-c91035b5313c	ProgramDela-unlock	ProgramDela - odklepanje	f
00030000-55ff-fb97-334f-060d3e1557ce	Abonma-read	Abonma - branje	f
00030000-55ff-fb97-9e0e-b4d1dfabd3a3	Abonma-write	Abonma - spreminjanje	f
00030000-55ff-fb97-da22-cf3a2d231fc6	Alternacija-read	Alternacija - branje	f
00030000-55ff-fb97-ecda-a0e098da6b8c	Alternacija-write	Alternacija - spreminjanje	f
00030000-55ff-fb97-ac81-a386fb453839	Arhivalija-read	Arhivalija - branje	f
00030000-55ff-fb97-ffd2-2226b589ff11	Arhivalija-write	Arhivalija - spreminjanje	f
00030000-55ff-fb97-7875-4bf69dd8b76e	AvtorBesedila-read	AvtorBesedila - branje	f
00030000-55ff-fb97-2c54-c8e10e0297c8	AvtorBesedila-write	AvtorBesedila - spreminjanje	f
00030000-55ff-fb97-2288-4b77cb19b1aa	Besedilo-read	Besedilo - branje	f
00030000-55ff-fb97-997e-f41bd6ab79e7	Besedilo-write	Besedilo - spreminjanje	f
00030000-55ff-fb97-a62a-b9f31ac5a7a5	DogodekIzven-read	DogodekIzven - branje	f
00030000-55ff-fb97-cd78-27befa747aec	DogodekIzven-write	DogodekIzven - spreminjanje	f
00030000-55ff-fb97-8202-a0d8488774b4	Dogodek-read	Dogodek - branje	f
00030000-55ff-fb97-29ec-ed6c14618def	Dogodek-write	Dogodek - spreminjanje	f
00030000-55ff-fb97-fb7f-c6b5047a6cdc	DrugiVir-read	DrugiVir - branje	f
00030000-55ff-fb97-bc2c-29f0b9d028a4	DrugiVir-write	DrugiVir - spreminjanje	f
00030000-55ff-fb97-29a8-db4a12238948	Drzava-read	Drzava - branje	f
00030000-55ff-fb97-05d3-ba89759ea4a3	Drzava-write	Drzava - spreminjanje	f
00030000-55ff-fb97-a7be-c95570e00c7b	EnotaPrograma-read	EnotaPrograma - branje	f
00030000-55ff-fb97-a562-e9990f34c594	EnotaPrograma-write	EnotaPrograma - spreminjanje	f
00030000-55ff-fb97-0c2f-df9f85e7006a	Funkcija-read	Funkcija - branje	f
00030000-55ff-fb97-6919-aaa190de477e	Funkcija-write	Funkcija - spreminjanje	f
00030000-55ff-fb97-c92f-ff71c1c7d7b4	Gostovanje-read	Gostovanje - branje	f
00030000-55ff-fb97-d178-62a34335a697	Gostovanje-write	Gostovanje - spreminjanje	f
00030000-55ff-fb97-97c1-f93c97044f03	Gostujoca-read	Gostujoca - branje	f
00030000-55ff-fb97-574f-ef06bb81bfa0	Gostujoca-write	Gostujoca - spreminjanje	f
00030000-55ff-fb97-518f-35832b1f271d	KontaktnaOseba-read	KontaktnaOseba - branje	f
00030000-55ff-fb97-2b86-f55786413da4	KontaktnaOseba-write	KontaktnaOseba - spreminjanje	f
00030000-55ff-fb97-5c08-8d0ba8571394	Kupec-read	Kupec - branje	f
00030000-55ff-fb97-1551-668e4fef5ae7	Kupec-write	Kupec - spreminjanje	f
00030000-55ff-fb97-c89e-9915d55dfd3e	NacinPlacina-read	NacinPlacina - branje	f
00030000-55ff-fb97-289f-e2451d48a5d2	NacinPlacina-write	NacinPlacina - spreminjanje	f
00030000-55ff-fb97-2b27-def6fcf5836d	Option-read	Option - branje	f
00030000-55ff-fb97-6313-1097d0364ac2	Option-write	Option - spreminjanje	f
00030000-55ff-fb97-6ad2-2d32510b6f9b	OptionValue-read	OptionValue - branje	f
00030000-55ff-fb97-8aae-1189d2d91679	OptionValue-write	OptionValue - spreminjanje	f
00030000-55ff-fb97-b638-00d597a023eb	Oseba-read	Oseba - branje	f
00030000-55ff-fb97-1cf7-10e916404f01	Oseba-write	Oseba - spreminjanje	f
00030000-55ff-fb97-4638-1c1b7fdf2258	PlacilniInstrument-read	PlacilniInstrument - branje	f
00030000-55ff-fb97-9875-8daed3f6fd1c	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	f
00030000-55ff-fb97-ea52-54fb5615b373	PodrocjeSedenja-read	PodrocjeSedenja - branje	f
00030000-55ff-fb97-71f9-3a9ffa1db051	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	f
00030000-55ff-fb97-7bc3-3bf5de318ef1	Pogodba-read	Pogodba - branje	f
00030000-55ff-fb97-e1e5-b7d142ed07d1	Pogodba-write	Pogodba - spreminjanje	f
00030000-55ff-fb97-c2c2-7c23584b6e26	Popa-read	Popa - branje	f
00030000-55ff-fb97-5016-ea164cbb1ecc	Popa-write	Popa - spreminjanje	f
00030000-55ff-fb97-6d81-70621341f67f	Posta-read	Posta - branje	f
00030000-55ff-fb97-4bda-1b5920114e2f	Posta-write	Posta - spreminjanje	f
00030000-55ff-fb97-7e0c-79c5fb125042	PostavkaCDve-read	PostavkaCDve - branje	f
00030000-55ff-fb97-15b9-f41ef58fa17d	PostavkaCDve-write	PostavkaCDve - spreminjanje	f
00030000-55ff-fb97-af8a-aa918d41711a	PostavkaRacuna-read	PostavkaRacuna - branje	f
00030000-55ff-fb97-22a2-26ed085802d2	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	f
00030000-55ff-fb97-639a-ddbd7d04d30e	PostniNaslov-read	PostniNaslov - branje	f
00030000-55ff-fb97-c1f0-fcf8984f58ae	PostniNaslov-write	PostniNaslov - spreminjanje	f
00030000-55ff-fb97-55d4-b11d3007ef6d	Predstava-read	Predstava - branje	f
00030000-55ff-fb97-91e0-efc17367a999	Predstava-write	Predstava - spreminjanje	f
00030000-55ff-fb97-a12a-dee1cb3d9d84	ProdajaPredstave-read	ProdajaPredstave - branje	f
00030000-55ff-fb97-d5dd-bcc3ab706743	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	f
00030000-55ff-fb97-c7fe-f4d42c48d4fa	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	f
00030000-55ff-fb97-61a0-a2573ee62ddc	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	f
00030000-55ff-fb97-08d2-30715b7c5b0c	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	f
00030000-55ff-fb97-7dea-e166c6789989	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	f
00030000-55ff-fb97-476e-70616471addd	ProgramDela-read	ProgramDela - branje	f
00030000-55ff-fb97-0420-d65715339d66	ProgramDela-write	ProgramDela - spreminjanje	f
00030000-55ff-fb97-99d8-44fff774657d	ProgramFestival-read	ProgramFestival - branje	f
00030000-55ff-fb97-6608-65cd49d8442a	ProgramFestival-write	ProgramFestival - spreminjanje	f
00030000-55ff-fb97-6bfe-32f5df781bc0	ProgramGostovanje-read	ProgramGostovanje - branje	f
00030000-55ff-fb97-e2f0-e164e7e866ee	ProgramGostovanje-write	ProgramGostovanje - spreminjanje	f
00030000-55ff-fb97-3614-b1867a4161d2	ProgramGostujoca-read	ProgramGostujoca - branje	f
00030000-55ff-fb97-a0f1-c4ba7f4c50f2	ProgramGostujoca-write	ProgramGostujoca - spreminjanje	f
00030000-55ff-fb97-f564-8d85abb03fd1	ProgramIzjemni-read	ProgramIzjemni - branje	f
00030000-55ff-fb97-6842-c5cfdc780b95	ProgramIzjemni-write	ProgramIzjemni - spreminjanje	f
00030000-55ff-fb97-9c64-9926274bd87d	ProgramPonovitevPrejsnjih-read	ProgramPonovitevPrejsnjih - branje	f
00030000-55ff-fb97-19a7-c9a090a36200	ProgramPonovitevPrejsnjih-write	ProgramPonovitevPrejsnjih - spreminjanje	f
00030000-55ff-fb97-0349-e798dfb674bb	ProgramPonovitevPremiere-read	ProgramPonovitevPremiere - branje	f
00030000-55ff-fb97-8c14-aa03f0251c0a	ProgramPonovitevPremiere-write	ProgramPonovitevPremiere - spreminjanje	f
00030000-55ff-fb97-a420-bc5f93f3fcf8	ProgramPremiera-read	ProgramPremiera - branje	f
00030000-55ff-fb97-622f-e6e05b25f84e	ProgramPremiera-write	ProgramPremiera - spreminjanje	f
00030000-55ff-fb97-a111-e7ba58deb936	ProgramRazno-read	ProgramRazno - branje	f
00030000-55ff-fb97-eb06-edd8e1f87f96	ProgramRazno-write	ProgramRazno - spreminjanje	f
00030000-55ff-fb97-f91a-771349b81a95	ProgramskaEnotaSklopa-read	ProgramskaEnotaSklopa - branje	f
00030000-55ff-fb97-6dfa-4dd34dd6ca24	ProgramskaEnotaSklopa-write	ProgramskaEnotaSklopa - spreminjanje	f
00030000-55ff-fb97-75c4-e3abbed6cea7	Prostor-read	Prostor - branje	f
00030000-55ff-fb97-67e3-d8a32acfc97d	Prostor-write	Prostor - spreminjanje	f
00030000-55ff-fb97-2761-8cecb13d70d5	Racun-read	Racun - branje	f
00030000-55ff-fb97-8936-aed1d7f901d5	Racun-write	Racun - spreminjanje	f
00030000-55ff-fb97-c642-34fb95a4342e	RazpisanSedez-read	RazpisanSedez - branje	f
00030000-55ff-fb97-2058-aaa94b781b8a	RazpisanSedez-write	RazpisanSedez - spreminjanje	f
00030000-55ff-fb97-8128-5e400a432e3c	Rekviziterstvo-read	Rekviziterstvo - branje	f
00030000-55ff-fb97-be2d-9083ed2ce453	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	f
00030000-55ff-fb97-2a13-a5bb7155b47a	Rekvizit-read	Rekvizit - branje	f
00030000-55ff-fb97-d7c8-dcf4ccb916e0	Rekvizit-write	Rekvizit - spreminjanje	f
00030000-55ff-fb97-122c-5e5e081bd655	Revizija-read	Revizija - branje	f
00030000-55ff-fb97-cf58-87df2c9a5f96	Revizija-write	Revizija - spreminjanje	f
00030000-55ff-fb97-cd47-79572496cd40	Rezervacija-read	Rezervacija - branje	f
00030000-55ff-fb97-411a-4d1a5222f49d	Rezervacija-write	Rezervacija - spreminjanje	f
00030000-55ff-fb97-49f1-d3b2aa53ccfe	SedezniRed-read	SedezniRed - branje	f
00030000-55ff-fb97-f85d-bbe4f3aa950a	SedezniRed-write	SedezniRed - spreminjanje	f
00030000-55ff-fb97-27e9-89d06de1e56f	Sedez-read	Sedez - branje	f
00030000-55ff-fb97-6b34-682a65319b5f	Sedez-write	Sedez - spreminjanje	f
00030000-55ff-fb97-fe47-b51e0cdd30dd	Sezona-read	Sezona - branje	f
00030000-55ff-fb97-6655-1d1eb11b4935	Sezona-write	Sezona - spreminjanje	f
00030000-55ff-fb97-344c-ebe43f6fc0d8	StevilcenjeKonfig-read	StevilcenjeKonfig - branje	f
00030000-55ff-fb97-3a60-49905825997e	StevilcenjeKonfig-write	StevilcenjeKonfig - spreminjanje	f
00030000-55ff-fb97-70bb-79fa420624b8	Stevilcenje-read	Stevilcenje - branje	f
00030000-55ff-fb97-9f8d-a22bccd0d4fd	Stevilcenje-write	Stevilcenje - spreminjanje	f
00030000-55ff-fb97-4316-b51c9cb8fedf	StevilcenjeStanje-read	StevilcenjeStanje - branje	f
00030000-55ff-fb97-e0ff-0a9723b77723	StevilcenjeStanje-write	StevilcenjeStanje - spreminjanje	f
00030000-55ff-fb97-3056-2c6e5e503834	StrosekUprizoritve-read	StrosekUprizoritve - branje	f
00030000-55ff-fb97-8bdc-dd2420627a20	StrosekUprizoritve-write	StrosekUprizoritve - spreminjanje	f
00030000-55ff-fb97-954b-306c45d58773	Telefonska-read	Telefonska - branje	f
00030000-55ff-fb97-8d43-b9ea03d51bb1	Telefonska-write	Telefonska - spreminjanje	f
00030000-55ff-fb97-18d5-27638e69181e	TerminStoritve-read	TerminStoritve - branje	f
00030000-55ff-fb97-8fcb-be772a01d738	TerminStoritve-write	TerminStoritve - spreminjanje	f
00030000-55ff-fb97-ca8e-039b55f77ab9	TipFunkcije-read	TipFunkcije - branje	f
00030000-55ff-fb97-c94d-f5e2c4c46dfd	TipFunkcije-write	TipFunkcije - spreminjanje	f
00030000-55ff-fb97-24ac-9acd282c86c1	TipProgramskeEnote-read	TipProgramskeEnote - branje	f
00030000-55ff-fb97-bdd4-9fc134ef25a6	TipProgramskeEnote-write	TipProgramskeEnote - spreminjanje	f
00030000-55ff-fb97-d1bc-9c541bec68ab	Trr-read	Trr - branje	f
00030000-55ff-fb97-3c92-e060facadce6	Trr-write	Trr - spreminjanje	f
00030000-55ff-fb97-79bb-249358064f27	Uprizoritev-read	Uprizoritev - branje	f
00030000-55ff-fb97-2259-9b27b8b1eaac	Uprizoritev-write	Uprizoritev - spreminjanje	f
00030000-55ff-fb97-3a26-7c188deb365f	Vaja-read	Vaja - branje	f
00030000-55ff-fb97-1b0a-727d140c52e6	Vaja-write	Vaja - spreminjanje	f
00030000-55ff-fb97-e6fa-fd244997283c	VrstaSedezev-read	VrstaSedezev - branje	f
00030000-55ff-fb97-1553-4525ed66c818	VrstaSedezev-write	VrstaSedezev - spreminjanje	f
00030000-55ff-fb97-7612-cf6ca95f790a	VrstaStroska-read	VrstaStroska - branje	f
00030000-55ff-fb97-ae93-27fb1a1fe7c0	VrstaStroska-write	VrstaStroska - spreminjanje	f
00030000-55ff-fb97-838f-e75fa5be2169	Zaposlitev-read	Zaposlitev - branje	f
00030000-55ff-fb97-7cb3-2cd754d6b55d	Zaposlitev-write	Zaposlitev - spreminjanje	f
00030000-55ff-fb97-371e-02d74566dd7d	Zasedenost-read	Zasedenost - branje	f
00030000-55ff-fb97-7de3-30d60d364d4e	Zasedenost-write	Zasedenost - spreminjanje	f
00030000-55ff-fb97-30c1-ec7a80427216	ZvrstSurs-read	ZvrstSurs - branje	f
00030000-55ff-fb97-9ad9-3156d6062605	ZvrstSurs-write	ZvrstSurs - spreminjanje	f
00030000-55ff-fb97-39fc-5223bb46e154	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	f
00030000-55ff-fb97-aff1-519ebfe6649d	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	f
00030000-55ff-fb97-52a2-93094925a6f1	Job-read	Branje opravil - samo zase - branje	f
00030000-55ff-fb97-b321-43adb0795090	Job-write	Dodajanje in spreminjanje opravil - samo zase	f
00030000-55ff-fb97-2634-8eb29d7bf31e	Job-admin	Upravljanje opravil za vse uporabnike	f
00030000-55ff-fb97-a28c-2bb29e1be356	Mapa-write	Mapa - osnovno dovoljenje za pisanje	f
00030000-55ff-fb97-0d7c-306d563c73fd	Mapa-read	Mapa - osnovno dovoljenje za branje	f
00030000-55ff-fb97-d15c-1e583eb60843	MapaAcl-write	MapaAcl - dovoljenje za dostop pisanje ACL-jev mape	f
00030000-55ff-fb97-a583-c44a5afb2c4d	MapaAcl-read	MapaAcl - dovoljenje za dostop branje ACL-jev mape	f
00030000-55ff-fb97-0291-5bf2dc64db98	Zapis-write	Zapis - dovoljenje za pisanje zapisov	f
00030000-55ff-fb97-7b23-a698a2c1f222	Zapis-read	Zapis - dovoljenje za pisanje zapisov	f
00030000-55ff-fb97-b965-647f6a7a4120	ZapisLastnik-write	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	f
00030000-55ff-fb97-8909-db752660250d	ZapisLastnik-read	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	f
00030000-55ff-fb97-a35d-1eed463144c4	VrstaZapisa-write	Šifrant vrst zapisa - spreminjanje	f
00030000-55ff-fb97-38c6-3e3ed9d1655b	VrstaZapisa-read	Šifrant vrst zapisa - branje	f
00030000-55ff-fb97-23fc-2d8a3ab6bf83	Datoteka-write	Datoteka - spreminjanje	f
00030000-55ff-fb97-cd6b-2405ed554bd0	Datoteka-read	Datoteke - branje	f
\.


--
-- TOC entry 2971 (class 0 OID 20274417)
-- Dependencies: 180
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-55ff-fb97-e6a7-142173d807ab	00030000-55ff-fb97-c3c4-2d98debc2e33
00020000-55ff-fb97-bdab-52a02f4bbd2c	00030000-55ff-fb97-29a8-db4a12238948
00020000-55ff-fb97-cac5-45b82ac59a85	00030000-55ff-fb97-334f-060d3e1557ce
00020000-55ff-fb97-cac5-45b82ac59a85	00030000-55ff-fb97-9e0e-b4d1dfabd3a3
00020000-55ff-fb97-cac5-45b82ac59a85	00030000-55ff-fb97-da22-cf3a2d231fc6
00020000-55ff-fb97-cac5-45b82ac59a85	00030000-55ff-fb97-ecda-a0e098da6b8c
00020000-55ff-fb97-cac5-45b82ac59a85	00030000-55ff-fb97-ac81-a386fb453839
00020000-55ff-fb97-cac5-45b82ac59a85	00030000-55ff-fb97-8202-a0d8488774b4
00020000-55ff-fb97-cac5-45b82ac59a85	00030000-55ff-fb97-2884-691cae7abb6c
00020000-55ff-fb97-cac5-45b82ac59a85	00030000-55ff-fb97-29ec-ed6c14618def
00020000-55ff-fb97-cac5-45b82ac59a85	00030000-55ff-fb97-29a8-db4a12238948
00020000-55ff-fb97-cac5-45b82ac59a85	00030000-55ff-fb97-05d3-ba89759ea4a3
00020000-55ff-fb97-cac5-45b82ac59a85	00030000-55ff-fb97-0c2f-df9f85e7006a
00020000-55ff-fb97-cac5-45b82ac59a85	00030000-55ff-fb97-6919-aaa190de477e
00020000-55ff-fb97-cac5-45b82ac59a85	00030000-55ff-fb97-c92f-ff71c1c7d7b4
00020000-55ff-fb97-cac5-45b82ac59a85	00030000-55ff-fb97-d178-62a34335a697
00020000-55ff-fb97-cac5-45b82ac59a85	00030000-55ff-fb97-97c1-f93c97044f03
00020000-55ff-fb97-cac5-45b82ac59a85	00030000-55ff-fb97-574f-ef06bb81bfa0
00020000-55ff-fb97-cac5-45b82ac59a85	00030000-55ff-fb97-518f-35832b1f271d
00020000-55ff-fb97-cac5-45b82ac59a85	00030000-55ff-fb97-2b86-f55786413da4
00020000-55ff-fb97-cac5-45b82ac59a85	00030000-55ff-fb97-2b27-def6fcf5836d
00020000-55ff-fb97-cac5-45b82ac59a85	00030000-55ff-fb97-6ad2-2d32510b6f9b
00020000-55ff-fb97-cac5-45b82ac59a85	00030000-55ff-fb97-b638-00d597a023eb
00020000-55ff-fb97-cac5-45b82ac59a85	00030000-55ff-fb97-1cf7-10e916404f01
00020000-55ff-fb97-cac5-45b82ac59a85	00030000-55ff-fb97-c2c2-7c23584b6e26
00020000-55ff-fb97-cac5-45b82ac59a85	00030000-55ff-fb97-5016-ea164cbb1ecc
00020000-55ff-fb97-cac5-45b82ac59a85	00030000-55ff-fb97-6d81-70621341f67f
00020000-55ff-fb97-cac5-45b82ac59a85	00030000-55ff-fb97-4bda-1b5920114e2f
00020000-55ff-fb97-cac5-45b82ac59a85	00030000-55ff-fb97-639a-ddbd7d04d30e
00020000-55ff-fb97-cac5-45b82ac59a85	00030000-55ff-fb97-c1f0-fcf8984f58ae
00020000-55ff-fb97-cac5-45b82ac59a85	00030000-55ff-fb97-55d4-b11d3007ef6d
00020000-55ff-fb97-cac5-45b82ac59a85	00030000-55ff-fb97-91e0-efc17367a999
00020000-55ff-fb97-cac5-45b82ac59a85	00030000-55ff-fb97-08d2-30715b7c5b0c
00020000-55ff-fb97-cac5-45b82ac59a85	00030000-55ff-fb97-7dea-e166c6789989
00020000-55ff-fb97-cac5-45b82ac59a85	00030000-55ff-fb97-75c4-e3abbed6cea7
00020000-55ff-fb97-cac5-45b82ac59a85	00030000-55ff-fb97-67e3-d8a32acfc97d
00020000-55ff-fb97-cac5-45b82ac59a85	00030000-55ff-fb97-8128-5e400a432e3c
00020000-55ff-fb97-cac5-45b82ac59a85	00030000-55ff-fb97-be2d-9083ed2ce453
00020000-55ff-fb97-cac5-45b82ac59a85	00030000-55ff-fb97-2a13-a5bb7155b47a
00020000-55ff-fb97-cac5-45b82ac59a85	00030000-55ff-fb97-d7c8-dcf4ccb916e0
00020000-55ff-fb97-cac5-45b82ac59a85	00030000-55ff-fb97-fe47-b51e0cdd30dd
00020000-55ff-fb97-cac5-45b82ac59a85	00030000-55ff-fb97-6655-1d1eb11b4935
00020000-55ff-fb97-cac5-45b82ac59a85	00030000-55ff-fb97-ca8e-039b55f77ab9
00020000-55ff-fb97-cac5-45b82ac59a85	00030000-55ff-fb97-79bb-249358064f27
00020000-55ff-fb97-cac5-45b82ac59a85	00030000-55ff-fb97-2259-9b27b8b1eaac
00020000-55ff-fb97-cac5-45b82ac59a85	00030000-55ff-fb97-3a26-7c188deb365f
00020000-55ff-fb97-cac5-45b82ac59a85	00030000-55ff-fb97-1b0a-727d140c52e6
00020000-55ff-fb97-cac5-45b82ac59a85	00030000-55ff-fb97-371e-02d74566dd7d
00020000-55ff-fb97-cac5-45b82ac59a85	00030000-55ff-fb97-7de3-30d60d364d4e
00020000-55ff-fb97-cac5-45b82ac59a85	00030000-55ff-fb97-30c1-ec7a80427216
00020000-55ff-fb97-cac5-45b82ac59a85	00030000-55ff-fb97-39fc-5223bb46e154
00020000-55ff-fb97-1678-fed60ff76fdb	00030000-55ff-fb97-334f-060d3e1557ce
00020000-55ff-fb97-1678-fed60ff76fdb	00030000-55ff-fb97-ac81-a386fb453839
00020000-55ff-fb97-1678-fed60ff76fdb	00030000-55ff-fb97-8202-a0d8488774b4
00020000-55ff-fb97-1678-fed60ff76fdb	00030000-55ff-fb97-29a8-db4a12238948
00020000-55ff-fb97-1678-fed60ff76fdb	00030000-55ff-fb97-c92f-ff71c1c7d7b4
00020000-55ff-fb97-1678-fed60ff76fdb	00030000-55ff-fb97-97c1-f93c97044f03
00020000-55ff-fb97-1678-fed60ff76fdb	00030000-55ff-fb97-518f-35832b1f271d
00020000-55ff-fb97-1678-fed60ff76fdb	00030000-55ff-fb97-2b86-f55786413da4
00020000-55ff-fb97-1678-fed60ff76fdb	00030000-55ff-fb97-2b27-def6fcf5836d
00020000-55ff-fb97-1678-fed60ff76fdb	00030000-55ff-fb97-6ad2-2d32510b6f9b
00020000-55ff-fb97-1678-fed60ff76fdb	00030000-55ff-fb97-b638-00d597a023eb
00020000-55ff-fb97-1678-fed60ff76fdb	00030000-55ff-fb97-1cf7-10e916404f01
00020000-55ff-fb97-1678-fed60ff76fdb	00030000-55ff-fb97-c2c2-7c23584b6e26
00020000-55ff-fb97-1678-fed60ff76fdb	00030000-55ff-fb97-6d81-70621341f67f
00020000-55ff-fb97-1678-fed60ff76fdb	00030000-55ff-fb97-639a-ddbd7d04d30e
00020000-55ff-fb97-1678-fed60ff76fdb	00030000-55ff-fb97-c1f0-fcf8984f58ae
00020000-55ff-fb97-1678-fed60ff76fdb	00030000-55ff-fb97-55d4-b11d3007ef6d
00020000-55ff-fb97-1678-fed60ff76fdb	00030000-55ff-fb97-75c4-e3abbed6cea7
00020000-55ff-fb97-1678-fed60ff76fdb	00030000-55ff-fb97-8128-5e400a432e3c
00020000-55ff-fb97-1678-fed60ff76fdb	00030000-55ff-fb97-2a13-a5bb7155b47a
00020000-55ff-fb97-1678-fed60ff76fdb	00030000-55ff-fb97-fe47-b51e0cdd30dd
00020000-55ff-fb97-1678-fed60ff76fdb	00030000-55ff-fb97-954b-306c45d58773
00020000-55ff-fb97-1678-fed60ff76fdb	00030000-55ff-fb97-8d43-b9ea03d51bb1
00020000-55ff-fb97-1678-fed60ff76fdb	00030000-55ff-fb97-d1bc-9c541bec68ab
00020000-55ff-fb97-1678-fed60ff76fdb	00030000-55ff-fb97-3c92-e060facadce6
00020000-55ff-fb97-1678-fed60ff76fdb	00030000-55ff-fb97-838f-e75fa5be2169
00020000-55ff-fb97-1678-fed60ff76fdb	00030000-55ff-fb97-7cb3-2cd754d6b55d
00020000-55ff-fb97-1678-fed60ff76fdb	00030000-55ff-fb97-30c1-ec7a80427216
00020000-55ff-fb97-1678-fed60ff76fdb	00030000-55ff-fb97-39fc-5223bb46e154
00020000-55ff-fb97-2874-03da2c65726b	00030000-55ff-fb97-334f-060d3e1557ce
00020000-55ff-fb97-2874-03da2c65726b	00030000-55ff-fb97-da22-cf3a2d231fc6
00020000-55ff-fb97-2874-03da2c65726b	00030000-55ff-fb97-ac81-a386fb453839
00020000-55ff-fb97-2874-03da2c65726b	00030000-55ff-fb97-ffd2-2226b589ff11
00020000-55ff-fb97-2874-03da2c65726b	00030000-55ff-fb97-2288-4b77cb19b1aa
00020000-55ff-fb97-2874-03da2c65726b	00030000-55ff-fb97-a62a-b9f31ac5a7a5
00020000-55ff-fb97-2874-03da2c65726b	00030000-55ff-fb97-8202-a0d8488774b4
00020000-55ff-fb97-2874-03da2c65726b	00030000-55ff-fb97-29a8-db4a12238948
00020000-55ff-fb97-2874-03da2c65726b	00030000-55ff-fb97-0c2f-df9f85e7006a
00020000-55ff-fb97-2874-03da2c65726b	00030000-55ff-fb97-c92f-ff71c1c7d7b4
00020000-55ff-fb97-2874-03da2c65726b	00030000-55ff-fb97-97c1-f93c97044f03
00020000-55ff-fb97-2874-03da2c65726b	00030000-55ff-fb97-518f-35832b1f271d
00020000-55ff-fb97-2874-03da2c65726b	00030000-55ff-fb97-2b27-def6fcf5836d
00020000-55ff-fb97-2874-03da2c65726b	00030000-55ff-fb97-6ad2-2d32510b6f9b
00020000-55ff-fb97-2874-03da2c65726b	00030000-55ff-fb97-b638-00d597a023eb
00020000-55ff-fb97-2874-03da2c65726b	00030000-55ff-fb97-c2c2-7c23584b6e26
00020000-55ff-fb97-2874-03da2c65726b	00030000-55ff-fb97-6d81-70621341f67f
00020000-55ff-fb97-2874-03da2c65726b	00030000-55ff-fb97-55d4-b11d3007ef6d
00020000-55ff-fb97-2874-03da2c65726b	00030000-55ff-fb97-08d2-30715b7c5b0c
00020000-55ff-fb97-2874-03da2c65726b	00030000-55ff-fb97-75c4-e3abbed6cea7
00020000-55ff-fb97-2874-03da2c65726b	00030000-55ff-fb97-8128-5e400a432e3c
00020000-55ff-fb97-2874-03da2c65726b	00030000-55ff-fb97-2a13-a5bb7155b47a
00020000-55ff-fb97-2874-03da2c65726b	00030000-55ff-fb97-fe47-b51e0cdd30dd
00020000-55ff-fb97-2874-03da2c65726b	00030000-55ff-fb97-ca8e-039b55f77ab9
00020000-55ff-fb97-2874-03da2c65726b	00030000-55ff-fb97-3a26-7c188deb365f
00020000-55ff-fb97-2874-03da2c65726b	00030000-55ff-fb97-371e-02d74566dd7d
00020000-55ff-fb97-2874-03da2c65726b	00030000-55ff-fb97-30c1-ec7a80427216
00020000-55ff-fb97-2874-03da2c65726b	00030000-55ff-fb97-39fc-5223bb46e154
00020000-55ff-fb97-26b0-cc2a99a427e6	00030000-55ff-fb97-334f-060d3e1557ce
00020000-55ff-fb97-26b0-cc2a99a427e6	00030000-55ff-fb97-9e0e-b4d1dfabd3a3
00020000-55ff-fb97-26b0-cc2a99a427e6	00030000-55ff-fb97-ecda-a0e098da6b8c
00020000-55ff-fb97-26b0-cc2a99a427e6	00030000-55ff-fb97-ac81-a386fb453839
00020000-55ff-fb97-26b0-cc2a99a427e6	00030000-55ff-fb97-8202-a0d8488774b4
00020000-55ff-fb97-26b0-cc2a99a427e6	00030000-55ff-fb97-29a8-db4a12238948
00020000-55ff-fb97-26b0-cc2a99a427e6	00030000-55ff-fb97-c92f-ff71c1c7d7b4
00020000-55ff-fb97-26b0-cc2a99a427e6	00030000-55ff-fb97-97c1-f93c97044f03
00020000-55ff-fb97-26b0-cc2a99a427e6	00030000-55ff-fb97-2b27-def6fcf5836d
00020000-55ff-fb97-26b0-cc2a99a427e6	00030000-55ff-fb97-6ad2-2d32510b6f9b
00020000-55ff-fb97-26b0-cc2a99a427e6	00030000-55ff-fb97-c2c2-7c23584b6e26
00020000-55ff-fb97-26b0-cc2a99a427e6	00030000-55ff-fb97-6d81-70621341f67f
00020000-55ff-fb97-26b0-cc2a99a427e6	00030000-55ff-fb97-55d4-b11d3007ef6d
00020000-55ff-fb97-26b0-cc2a99a427e6	00030000-55ff-fb97-75c4-e3abbed6cea7
00020000-55ff-fb97-26b0-cc2a99a427e6	00030000-55ff-fb97-8128-5e400a432e3c
00020000-55ff-fb97-26b0-cc2a99a427e6	00030000-55ff-fb97-2a13-a5bb7155b47a
00020000-55ff-fb97-26b0-cc2a99a427e6	00030000-55ff-fb97-fe47-b51e0cdd30dd
00020000-55ff-fb97-26b0-cc2a99a427e6	00030000-55ff-fb97-ca8e-039b55f77ab9
00020000-55ff-fb97-26b0-cc2a99a427e6	00030000-55ff-fb97-30c1-ec7a80427216
00020000-55ff-fb97-26b0-cc2a99a427e6	00030000-55ff-fb97-39fc-5223bb46e154
00020000-55ff-fb97-fa6f-d23e63f4ed7d	00030000-55ff-fb97-334f-060d3e1557ce
00020000-55ff-fb97-fa6f-d23e63f4ed7d	00030000-55ff-fb97-ac81-a386fb453839
00020000-55ff-fb97-fa6f-d23e63f4ed7d	00030000-55ff-fb97-8202-a0d8488774b4
00020000-55ff-fb97-fa6f-d23e63f4ed7d	00030000-55ff-fb97-29a8-db4a12238948
00020000-55ff-fb97-fa6f-d23e63f4ed7d	00030000-55ff-fb97-c92f-ff71c1c7d7b4
00020000-55ff-fb97-fa6f-d23e63f4ed7d	00030000-55ff-fb97-97c1-f93c97044f03
00020000-55ff-fb97-fa6f-d23e63f4ed7d	00030000-55ff-fb97-2b27-def6fcf5836d
00020000-55ff-fb97-fa6f-d23e63f4ed7d	00030000-55ff-fb97-6ad2-2d32510b6f9b
00020000-55ff-fb97-fa6f-d23e63f4ed7d	00030000-55ff-fb97-c2c2-7c23584b6e26
00020000-55ff-fb97-fa6f-d23e63f4ed7d	00030000-55ff-fb97-6d81-70621341f67f
00020000-55ff-fb97-fa6f-d23e63f4ed7d	00030000-55ff-fb97-55d4-b11d3007ef6d
00020000-55ff-fb97-fa6f-d23e63f4ed7d	00030000-55ff-fb97-75c4-e3abbed6cea7
00020000-55ff-fb97-fa6f-d23e63f4ed7d	00030000-55ff-fb97-8128-5e400a432e3c
00020000-55ff-fb97-fa6f-d23e63f4ed7d	00030000-55ff-fb97-2a13-a5bb7155b47a
00020000-55ff-fb97-fa6f-d23e63f4ed7d	00030000-55ff-fb97-fe47-b51e0cdd30dd
00020000-55ff-fb97-fa6f-d23e63f4ed7d	00030000-55ff-fb97-18d5-27638e69181e
00020000-55ff-fb97-fa6f-d23e63f4ed7d	00030000-55ff-fb97-590c-c7ca3871f71f
00020000-55ff-fb97-fa6f-d23e63f4ed7d	00030000-55ff-fb97-ca8e-039b55f77ab9
00020000-55ff-fb97-fa6f-d23e63f4ed7d	00030000-55ff-fb97-30c1-ec7a80427216
00020000-55ff-fb97-fa6f-d23e63f4ed7d	00030000-55ff-fb97-39fc-5223bb46e154
00020000-55ff-fb98-1fc2-ea7724367c29	00030000-55ff-fb97-6915-7d27aefab314
00020000-55ff-fb98-1fc2-ea7724367c29	00030000-55ff-fb97-c3c4-2d98debc2e33
00020000-55ff-fb98-1fc2-ea7724367c29	00030000-55ff-fb97-590c-c7ca3871f71f
00020000-55ff-fb98-1fc2-ea7724367c29	00030000-55ff-fb97-2884-691cae7abb6c
00020000-55ff-fb98-1fc2-ea7724367c29	00030000-55ff-fb97-9003-db735d327d08
00020000-55ff-fb98-1fc2-ea7724367c29	00030000-55ff-fb97-ac36-d9b64022302a
00020000-55ff-fb98-1fc2-ea7724367c29	00030000-55ff-fb97-ca52-c91035b5313c
00020000-55ff-fb98-1fc2-ea7724367c29	00030000-55ff-fb97-334f-060d3e1557ce
00020000-55ff-fb98-1fc2-ea7724367c29	00030000-55ff-fb97-9e0e-b4d1dfabd3a3
00020000-55ff-fb98-1fc2-ea7724367c29	00030000-55ff-fb97-da22-cf3a2d231fc6
00020000-55ff-fb98-1fc2-ea7724367c29	00030000-55ff-fb97-ecda-a0e098da6b8c
00020000-55ff-fb98-1fc2-ea7724367c29	00030000-55ff-fb97-ac81-a386fb453839
00020000-55ff-fb98-1fc2-ea7724367c29	00030000-55ff-fb97-ffd2-2226b589ff11
00020000-55ff-fb98-1fc2-ea7724367c29	00030000-55ff-fb97-2288-4b77cb19b1aa
00020000-55ff-fb98-1fc2-ea7724367c29	00030000-55ff-fb97-997e-f41bd6ab79e7
00020000-55ff-fb98-1fc2-ea7724367c29	00030000-55ff-fb97-a62a-b9f31ac5a7a5
00020000-55ff-fb98-1fc2-ea7724367c29	00030000-55ff-fb97-cd78-27befa747aec
00020000-55ff-fb98-1fc2-ea7724367c29	00030000-55ff-fb97-8202-a0d8488774b4
00020000-55ff-fb98-1fc2-ea7724367c29	00030000-55ff-fb97-29ec-ed6c14618def
00020000-55ff-fb98-1fc2-ea7724367c29	00030000-55ff-fb97-29a8-db4a12238948
00020000-55ff-fb98-1fc2-ea7724367c29	00030000-55ff-fb97-05d3-ba89759ea4a3
00020000-55ff-fb98-1fc2-ea7724367c29	00030000-55ff-fb97-fb7f-c6b5047a6cdc
00020000-55ff-fb98-1fc2-ea7724367c29	00030000-55ff-fb97-bc2c-29f0b9d028a4
00020000-55ff-fb98-1fc2-ea7724367c29	00030000-55ff-fb97-a7be-c95570e00c7b
00020000-55ff-fb98-1fc2-ea7724367c29	00030000-55ff-fb97-a562-e9990f34c594
00020000-55ff-fb98-1fc2-ea7724367c29	00030000-55ff-fb97-0c2f-df9f85e7006a
00020000-55ff-fb98-1fc2-ea7724367c29	00030000-55ff-fb97-6919-aaa190de477e
00020000-55ff-fb98-1fc2-ea7724367c29	00030000-55ff-fb97-c92f-ff71c1c7d7b4
00020000-55ff-fb98-1fc2-ea7724367c29	00030000-55ff-fb97-d178-62a34335a697
00020000-55ff-fb98-1fc2-ea7724367c29	00030000-55ff-fb97-97c1-f93c97044f03
00020000-55ff-fb98-1fc2-ea7724367c29	00030000-55ff-fb97-574f-ef06bb81bfa0
00020000-55ff-fb98-1fc2-ea7724367c29	00030000-55ff-fb97-518f-35832b1f271d
00020000-55ff-fb98-1fc2-ea7724367c29	00030000-55ff-fb97-2b86-f55786413da4
00020000-55ff-fb98-1fc2-ea7724367c29	00030000-55ff-fb97-5c08-8d0ba8571394
00020000-55ff-fb98-1fc2-ea7724367c29	00030000-55ff-fb97-1551-668e4fef5ae7
00020000-55ff-fb98-1fc2-ea7724367c29	00030000-55ff-fb97-c89e-9915d55dfd3e
00020000-55ff-fb98-1fc2-ea7724367c29	00030000-55ff-fb97-289f-e2451d48a5d2
00020000-55ff-fb98-1fc2-ea7724367c29	00030000-55ff-fb97-2b27-def6fcf5836d
00020000-55ff-fb98-1fc2-ea7724367c29	00030000-55ff-fb97-6313-1097d0364ac2
00020000-55ff-fb98-1fc2-ea7724367c29	00030000-55ff-fb97-6ad2-2d32510b6f9b
00020000-55ff-fb98-1fc2-ea7724367c29	00030000-55ff-fb97-8aae-1189d2d91679
00020000-55ff-fb98-1fc2-ea7724367c29	00030000-55ff-fb97-b638-00d597a023eb
00020000-55ff-fb98-1fc2-ea7724367c29	00030000-55ff-fb97-1cf7-10e916404f01
00020000-55ff-fb98-1fc2-ea7724367c29	00030000-55ff-fb97-4638-1c1b7fdf2258
00020000-55ff-fb98-1fc2-ea7724367c29	00030000-55ff-fb97-9875-8daed3f6fd1c
00020000-55ff-fb98-1fc2-ea7724367c29	00030000-55ff-fb97-ea52-54fb5615b373
00020000-55ff-fb98-1fc2-ea7724367c29	00030000-55ff-fb97-71f9-3a9ffa1db051
00020000-55ff-fb98-1fc2-ea7724367c29	00030000-55ff-fb97-7bc3-3bf5de318ef1
00020000-55ff-fb98-1fc2-ea7724367c29	00030000-55ff-fb97-e1e5-b7d142ed07d1
00020000-55ff-fb98-1fc2-ea7724367c29	00030000-55ff-fb97-c2c2-7c23584b6e26
00020000-55ff-fb98-1fc2-ea7724367c29	00030000-55ff-fb97-5016-ea164cbb1ecc
00020000-55ff-fb98-1fc2-ea7724367c29	00030000-55ff-fb97-6d81-70621341f67f
00020000-55ff-fb98-1fc2-ea7724367c29	00030000-55ff-fb97-4bda-1b5920114e2f
00020000-55ff-fb98-1fc2-ea7724367c29	00030000-55ff-fb97-7e0c-79c5fb125042
00020000-55ff-fb98-1fc2-ea7724367c29	00030000-55ff-fb97-15b9-f41ef58fa17d
00020000-55ff-fb98-1fc2-ea7724367c29	00030000-55ff-fb97-af8a-aa918d41711a
00020000-55ff-fb98-1fc2-ea7724367c29	00030000-55ff-fb97-22a2-26ed085802d2
00020000-55ff-fb98-1fc2-ea7724367c29	00030000-55ff-fb97-639a-ddbd7d04d30e
00020000-55ff-fb98-1fc2-ea7724367c29	00030000-55ff-fb97-c1f0-fcf8984f58ae
00020000-55ff-fb98-1fc2-ea7724367c29	00030000-55ff-fb97-55d4-b11d3007ef6d
00020000-55ff-fb98-1fc2-ea7724367c29	00030000-55ff-fb97-91e0-efc17367a999
00020000-55ff-fb98-1fc2-ea7724367c29	00030000-55ff-fb97-a12a-dee1cb3d9d84
00020000-55ff-fb98-1fc2-ea7724367c29	00030000-55ff-fb97-d5dd-bcc3ab706743
00020000-55ff-fb98-1fc2-ea7724367c29	00030000-55ff-fb97-c7fe-f4d42c48d4fa
00020000-55ff-fb98-1fc2-ea7724367c29	00030000-55ff-fb97-61a0-a2573ee62ddc
00020000-55ff-fb98-1fc2-ea7724367c29	00030000-55ff-fb97-08d2-30715b7c5b0c
00020000-55ff-fb98-1fc2-ea7724367c29	00030000-55ff-fb97-7dea-e166c6789989
00020000-55ff-fb98-1fc2-ea7724367c29	00030000-55ff-fb97-476e-70616471addd
00020000-55ff-fb98-1fc2-ea7724367c29	00030000-55ff-fb97-0420-d65715339d66
00020000-55ff-fb98-1fc2-ea7724367c29	00030000-55ff-fb97-99d8-44fff774657d
00020000-55ff-fb98-1fc2-ea7724367c29	00030000-55ff-fb97-6608-65cd49d8442a
00020000-55ff-fb98-1fc2-ea7724367c29	00030000-55ff-fb97-6bfe-32f5df781bc0
00020000-55ff-fb98-1fc2-ea7724367c29	00030000-55ff-fb97-e2f0-e164e7e866ee
00020000-55ff-fb98-1fc2-ea7724367c29	00030000-55ff-fb97-3614-b1867a4161d2
00020000-55ff-fb98-1fc2-ea7724367c29	00030000-55ff-fb97-a0f1-c4ba7f4c50f2
00020000-55ff-fb98-1fc2-ea7724367c29	00030000-55ff-fb97-f564-8d85abb03fd1
00020000-55ff-fb98-1fc2-ea7724367c29	00030000-55ff-fb97-6842-c5cfdc780b95
00020000-55ff-fb98-1fc2-ea7724367c29	00030000-55ff-fb97-9c64-9926274bd87d
00020000-55ff-fb98-1fc2-ea7724367c29	00030000-55ff-fb97-19a7-c9a090a36200
00020000-55ff-fb98-1fc2-ea7724367c29	00030000-55ff-fb97-0349-e798dfb674bb
00020000-55ff-fb98-1fc2-ea7724367c29	00030000-55ff-fb97-8c14-aa03f0251c0a
00020000-55ff-fb98-1fc2-ea7724367c29	00030000-55ff-fb97-a420-bc5f93f3fcf8
00020000-55ff-fb98-1fc2-ea7724367c29	00030000-55ff-fb97-622f-e6e05b25f84e
00020000-55ff-fb98-1fc2-ea7724367c29	00030000-55ff-fb97-a111-e7ba58deb936
00020000-55ff-fb98-1fc2-ea7724367c29	00030000-55ff-fb97-eb06-edd8e1f87f96
00020000-55ff-fb98-1fc2-ea7724367c29	00030000-55ff-fb97-f91a-771349b81a95
00020000-55ff-fb98-1fc2-ea7724367c29	00030000-55ff-fb97-6dfa-4dd34dd6ca24
00020000-55ff-fb98-1fc2-ea7724367c29	00030000-55ff-fb97-75c4-e3abbed6cea7
00020000-55ff-fb98-1fc2-ea7724367c29	00030000-55ff-fb97-67e3-d8a32acfc97d
00020000-55ff-fb98-1fc2-ea7724367c29	00030000-55ff-fb97-2761-8cecb13d70d5
00020000-55ff-fb98-1fc2-ea7724367c29	00030000-55ff-fb97-8936-aed1d7f901d5
00020000-55ff-fb98-1fc2-ea7724367c29	00030000-55ff-fb97-c642-34fb95a4342e
00020000-55ff-fb98-1fc2-ea7724367c29	00030000-55ff-fb97-2058-aaa94b781b8a
00020000-55ff-fb98-1fc2-ea7724367c29	00030000-55ff-fb97-8128-5e400a432e3c
00020000-55ff-fb98-1fc2-ea7724367c29	00030000-55ff-fb97-be2d-9083ed2ce453
00020000-55ff-fb98-1fc2-ea7724367c29	00030000-55ff-fb97-2a13-a5bb7155b47a
00020000-55ff-fb98-1fc2-ea7724367c29	00030000-55ff-fb97-d7c8-dcf4ccb916e0
00020000-55ff-fb98-1fc2-ea7724367c29	00030000-55ff-fb97-122c-5e5e081bd655
00020000-55ff-fb98-1fc2-ea7724367c29	00030000-55ff-fb97-cf58-87df2c9a5f96
00020000-55ff-fb98-1fc2-ea7724367c29	00030000-55ff-fb97-cd47-79572496cd40
00020000-55ff-fb98-1fc2-ea7724367c29	00030000-55ff-fb97-411a-4d1a5222f49d
00020000-55ff-fb98-1fc2-ea7724367c29	00030000-55ff-fb97-49f1-d3b2aa53ccfe
00020000-55ff-fb98-1fc2-ea7724367c29	00030000-55ff-fb97-f85d-bbe4f3aa950a
00020000-55ff-fb98-1fc2-ea7724367c29	00030000-55ff-fb97-27e9-89d06de1e56f
00020000-55ff-fb98-1fc2-ea7724367c29	00030000-55ff-fb97-6b34-682a65319b5f
00020000-55ff-fb98-1fc2-ea7724367c29	00030000-55ff-fb97-fe47-b51e0cdd30dd
00020000-55ff-fb98-1fc2-ea7724367c29	00030000-55ff-fb97-6655-1d1eb11b4935
00020000-55ff-fb98-1fc2-ea7724367c29	00030000-55ff-fb97-344c-ebe43f6fc0d8
00020000-55ff-fb98-1fc2-ea7724367c29	00030000-55ff-fb97-3a60-49905825997e
00020000-55ff-fb98-1fc2-ea7724367c29	00030000-55ff-fb97-70bb-79fa420624b8
00020000-55ff-fb98-1fc2-ea7724367c29	00030000-55ff-fb97-9f8d-a22bccd0d4fd
00020000-55ff-fb98-1fc2-ea7724367c29	00030000-55ff-fb97-4316-b51c9cb8fedf
00020000-55ff-fb98-1fc2-ea7724367c29	00030000-55ff-fb97-e0ff-0a9723b77723
00020000-55ff-fb98-1fc2-ea7724367c29	00030000-55ff-fb97-3056-2c6e5e503834
00020000-55ff-fb98-1fc2-ea7724367c29	00030000-55ff-fb97-8bdc-dd2420627a20
00020000-55ff-fb98-1fc2-ea7724367c29	00030000-55ff-fb97-954b-306c45d58773
00020000-55ff-fb98-1fc2-ea7724367c29	00030000-55ff-fb97-8d43-b9ea03d51bb1
00020000-55ff-fb98-1fc2-ea7724367c29	00030000-55ff-fb97-18d5-27638e69181e
00020000-55ff-fb98-1fc2-ea7724367c29	00030000-55ff-fb97-8fcb-be772a01d738
00020000-55ff-fb98-1fc2-ea7724367c29	00030000-55ff-fb97-ca8e-039b55f77ab9
00020000-55ff-fb98-1fc2-ea7724367c29	00030000-55ff-fb97-c94d-f5e2c4c46dfd
00020000-55ff-fb98-1fc2-ea7724367c29	00030000-55ff-fb97-24ac-9acd282c86c1
00020000-55ff-fb98-1fc2-ea7724367c29	00030000-55ff-fb97-bdd4-9fc134ef25a6
00020000-55ff-fb98-1fc2-ea7724367c29	00030000-55ff-fb97-d1bc-9c541bec68ab
00020000-55ff-fb98-1fc2-ea7724367c29	00030000-55ff-fb97-3c92-e060facadce6
00020000-55ff-fb98-1fc2-ea7724367c29	00030000-55ff-fb97-79bb-249358064f27
00020000-55ff-fb98-1fc2-ea7724367c29	00030000-55ff-fb97-2259-9b27b8b1eaac
00020000-55ff-fb98-1fc2-ea7724367c29	00030000-55ff-fb97-3a26-7c188deb365f
00020000-55ff-fb98-1fc2-ea7724367c29	00030000-55ff-fb97-1b0a-727d140c52e6
00020000-55ff-fb98-1fc2-ea7724367c29	00030000-55ff-fb97-e6fa-fd244997283c
00020000-55ff-fb98-1fc2-ea7724367c29	00030000-55ff-fb97-1553-4525ed66c818
00020000-55ff-fb98-1fc2-ea7724367c29	00030000-55ff-fb97-7612-cf6ca95f790a
00020000-55ff-fb98-1fc2-ea7724367c29	00030000-55ff-fb97-ae93-27fb1a1fe7c0
00020000-55ff-fb98-1fc2-ea7724367c29	00030000-55ff-fb97-838f-e75fa5be2169
00020000-55ff-fb98-1fc2-ea7724367c29	00030000-55ff-fb97-7cb3-2cd754d6b55d
00020000-55ff-fb98-1fc2-ea7724367c29	00030000-55ff-fb97-371e-02d74566dd7d
00020000-55ff-fb98-1fc2-ea7724367c29	00030000-55ff-fb97-7de3-30d60d364d4e
00020000-55ff-fb98-1fc2-ea7724367c29	00030000-55ff-fb97-30c1-ec7a80427216
00020000-55ff-fb98-1fc2-ea7724367c29	00030000-55ff-fb97-9ad9-3156d6062605
00020000-55ff-fb98-1fc2-ea7724367c29	00030000-55ff-fb97-39fc-5223bb46e154
00020000-55ff-fb98-1fc2-ea7724367c29	00030000-55ff-fb97-aff1-519ebfe6649d
\.


--
-- TOC entry 3000 (class 0 OID 20274742)
-- Dependencies: 209
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 3004 (class 0 OID 20274776)
-- Dependencies: 213
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 3016 (class 0 OID 20274910)
-- Dependencies: 225
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, zacetek, konec, jeavtorskepravice, placilonavajo, vrednostvaje, planiranostevilovaj, vrednostvaj, vrednostpredstave, procentodinkasa, jeprocentodinkasa, vrednostdopremiere, aktivna, zaposlenvdrjz, samozaposlen, igralec, opis) FROM stdin;
000b0000-55ff-fb99-080e-6aad218ea9d1	00090000-55ff-fb99-78c4-18e53724eea6	\N	\N	0001	\N	\N	f	f	10.00	3	10.00	30.00	\N	f	10.00	t	t	f	t	Pogodba o sodelovanju
000b0000-55ff-fb99-3e05-5c5b6104f209	00090000-55ff-fb99-8ba6-1c0492b0d584	\N	\N	0002	\N	\N	f	t	11.00	10	11.00	31.00	\N	f	110.00	t	f	t	t	Pogodba za vlogo Helena
000b0000-55ff-fb99-e8e8-1e85f9acb13e	00090000-55ff-fb99-ec26-af9612781dff	\N	\N	0003	\N	\N	f	f	12.00	4	12.00	32.00	\N	f	12.00	t	f	t	f	Pogodba za lektoriranje
000b0000-55ff-fb99-62ec-ba5b17a72821	00090000-55ff-fb99-0fc2-301384d7b9eb	\N	\N	0004	\N	\N	t	f	0.00	2	300.00	30.00	\N	f	300.00	t	f	t	f	Pogodba za avtorske pravice
\.


--
-- TOC entry 2976 (class 0 OID 20274477)
-- Dependencies: 185
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, drzava_id, sifra, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo, nvo) FROM stdin;
00080000-55ff-fb98-675a-7a7462618307	00040000-55ff-fb97-3ec3-6d5f8c6a9ae9	0988	AK	Juhuhu d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55ff-fb98-7c6c-b9619ed80810	00040000-55ff-fb97-3ec3-6d5f8c6a9ae9	0989	AK	Hopsasa d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	t
00080000-55ff-fb98-9b12-591cacdb606e	00040000-55ff-fb97-3ec3-6d5f8c6a9ae9	0987	AK	Gledališče Šrum d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55ff-fb98-75a7-31e163713fc0	00040000-55ff-fb97-3ec3-6d5f8c6a9ae9	0986	AK	Lutkovni Direndaj d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55ff-fb98-c417-fdfd1f49bf10	00040000-55ff-fb97-3ec3-6d5f8c6a9ae9	0985	AK	Tatjana Stanič, Lektoriranje, s.p.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55ff-fb98-36cb-8efea8ed7ee9	00040000-55ff-fb97-4bfa-b5184f80a268	0984	AK	Gledališče Lepote tvoje		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55ff-fb98-e060-18794a56a0f9	00040000-55ff-fb97-9162-7e43b14c629a	0983	AK	Sunce naše		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55ff-fb98-e550-9e45000e64f6	00040000-55ff-fb97-da87-e0bb2071d930	0982	AK	Theater Amadeus		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55ff-fb98-f679-42842e20dd34	00040000-55ff-fb97-f66d-36f0d5fc65b2	9999	AK	Fuchs		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55ff-fb9a-5a7b-21e34db1cd63	00040000-55ff-fb97-3ec3-6d5f8c6a9ae9	1001	AK	Gledališče Matica		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
\.


--
-- TOC entry 2978 (class 0 OID 20274511)
-- Dependencies: 187
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-55ff-fb96-d91e-aa3215151522	8341	Adlešiči
00050000-55ff-fb96-5121-87fd8cff4031	5270	Ajdovščina
00050000-55ff-fb96-cff4-649118d3ee80	6280	Ankaran/Ancarano
00050000-55ff-fb96-bedf-73098abeb5f3	9253	Apače
00050000-55ff-fb96-7e31-567f6a967b95	8253	Artiče
00050000-55ff-fb96-cf49-ae9a2c2e4a46	4275	Begunje na Gorenjskem
00050000-55ff-fb96-cd5b-3e033b15b243	1382	Begunje pri Cerknici
00050000-55ff-fb96-cce0-ae9ab21dd87f	9231	Beltinci
00050000-55ff-fb96-d043-50ac3652eae4	2234	Benedikt
00050000-55ff-fb96-da28-cf85a5af3251	2345	Bistrica ob Dravi
00050000-55ff-fb96-8061-7e94c40bfe8f	3256	Bistrica ob Sotli
00050000-55ff-fb96-806f-91b23af3893d	8259	Bizeljsko
00050000-55ff-fb96-c30c-3f73fad1170f	1223	Blagovica
00050000-55ff-fb96-e566-1a5a42d21042	8283	Blanca
00050000-55ff-fb96-8d9f-f99fc3e4494c	4260	Bled
00050000-55ff-fb96-7f5c-847e7862a577	4273	Blejska Dobrava
00050000-55ff-fb96-b6c9-8884117d88f6	9265	Bodonci
00050000-55ff-fb96-b640-2024273d96f4	9222	Bogojina
00050000-55ff-fb96-ba1f-66829d8dbcc1	4263	Bohinjska Bela
00050000-55ff-fb96-a129-4bc2b9f9c8bb	4264	Bohinjska Bistrica
00050000-55ff-fb96-f647-cb68ababb55c	4265	Bohinjsko jezero
00050000-55ff-fb96-57ee-a159a9b38271	1353	Borovnica
00050000-55ff-fb96-b6c2-7486c1c66d00	8294	Boštanj
00050000-55ff-fb96-1279-23c64ce46cc6	5230	Bovec
00050000-55ff-fb96-7495-a63f85b1dd49	5295	Branik
00050000-55ff-fb96-304b-2521f6ae3a47	3314	Braslovče
00050000-55ff-fb96-65e2-296964f95adf	5223	Breginj
00050000-55ff-fb96-9a84-199c557df87f	8280	Brestanica
00050000-55ff-fb96-36e1-3c4e43a02dce	2354	Bresternica
00050000-55ff-fb96-ac1b-5e764a6a1273	4243	Brezje
00050000-55ff-fb96-9073-f8fe1ee04d82	1351	Brezovica pri Ljubljani
00050000-55ff-fb96-6bba-c62aa02d22b1	8250	Brežice
00050000-55ff-fb96-4f42-1ea7bca48439	4210	Brnik - Aerodrom
00050000-55ff-fb96-4b1f-d3a314530b34	8321	Brusnice
00050000-55ff-fb96-dea2-e0c44872b371	3255	Buče
00050000-55ff-fb96-0fdd-5b81d5ddfe4f	8276	Bučka 
00050000-55ff-fb96-5f1f-4433ae2b2437	9261	Cankova
00050000-55ff-fb96-53be-726bc9e8d400	3000	Celje 
00050000-55ff-fb96-9193-9486c5802855	3001	Celje - poštni predali
00050000-55ff-fb96-ad5b-7aa1c7cb5d61	4207	Cerklje na Gorenjskem
00050000-55ff-fb96-eb17-e38f196e58b9	8263	Cerklje ob Krki
00050000-55ff-fb96-4450-893ccc734f40	1380	Cerknica
00050000-55ff-fb96-f8f9-5d63e17960a2	5282	Cerkno
00050000-55ff-fb96-9c62-6c8c4cf9b5a8	2236	Cerkvenjak
00050000-55ff-fb96-31a0-059f3ee2c0e1	2215	Ceršak
00050000-55ff-fb96-9dac-9a59927c44e2	2326	Cirkovce
00050000-55ff-fb96-29b4-364c8db4ea70	2282	Cirkulane
00050000-55ff-fb96-d66c-91291ffe5c72	5273	Col
00050000-55ff-fb96-d45a-2e2b7855e854	8251	Čatež ob Savi
00050000-55ff-fb96-680f-b257f529def3	1413	Čemšenik
00050000-55ff-fb96-2a36-293a7cefada1	5253	Čepovan
00050000-55ff-fb96-15f2-543c4036e1eb	9232	Črenšovci
00050000-55ff-fb96-fa4b-c1f463a5c42d	2393	Črna na Koroškem
00050000-55ff-fb96-5dd3-f0748c798d88	6275	Črni Kal
00050000-55ff-fb96-ed58-c3fe7eab256d	5274	Črni Vrh nad Idrijo
00050000-55ff-fb96-c9e0-eb6433446216	5262	Črniče
00050000-55ff-fb96-3c2f-0048294358a5	8340	Črnomelj
00050000-55ff-fb96-9178-feaada8d8605	6271	Dekani
00050000-55ff-fb96-6cca-4df29feee286	5210	Deskle
00050000-55ff-fb96-d046-b325ee8ac119	2253	Destrnik
00050000-55ff-fb96-d232-b288306e7c31	6215	Divača
00050000-55ff-fb96-0c34-0ccbc46170f7	1233	Dob
00050000-55ff-fb96-8872-a19f65471842	3224	Dobje pri Planini
00050000-55ff-fb96-8dcb-42d5fc1400cb	8257	Dobova
00050000-55ff-fb96-508d-d90717ddd9c3	1423	Dobovec
00050000-55ff-fb96-f33c-69f2cf60a7b1	5263	Dobravlje
00050000-55ff-fb96-def3-4d4741b5a8ed	3204	Dobrna
00050000-55ff-fb96-e6d0-269ab91a6887	8211	Dobrnič
00050000-55ff-fb96-8fd0-6c670a7d0b61	1356	Dobrova
00050000-55ff-fb96-f40a-2f3010c9b157	9223	Dobrovnik/Dobronak 
00050000-55ff-fb96-0d3f-5fd8f7e1ffc4	5212	Dobrovo v Brdih
00050000-55ff-fb96-0a0f-623507d54ea6	1431	Dol pri Hrastniku
00050000-55ff-fb96-3f5d-21c82b945819	1262	Dol pri Ljubljani
00050000-55ff-fb96-0bd2-1f30c8e94985	1273	Dole pri Litiji
00050000-55ff-fb96-503d-f244febba5dd	1331	Dolenja vas
00050000-55ff-fb96-cc11-c63be3a63b97	8350	Dolenjske Toplice
00050000-55ff-fb96-e0bf-83a2999b3cf0	1230	Domžale
00050000-55ff-fb96-4366-e427ca75663b	2252	Dornava
00050000-55ff-fb96-c723-3fb39fd6177b	5294	Dornberk
00050000-55ff-fb96-0950-dc4a10d3f03e	1319	Draga
00050000-55ff-fb96-d528-b5296edb7a23	8343	Dragatuš
00050000-55ff-fb96-ff55-63cc57939a2f	3222	Dramlje
00050000-55ff-fb96-7896-fa263cebdaf7	2370	Dravograd
00050000-55ff-fb96-32cf-653aac7edbf8	4203	Duplje
00050000-55ff-fb96-15f7-4c0b20c04e78	6221	Dutovlje
00050000-55ff-fb96-3fe4-2519a4582efd	8361	Dvor
00050000-55ff-fb96-6b12-b5ad16a881ef	2343	Fala
00050000-55ff-fb96-b34d-24806a3b7644	9208	Fokovci
00050000-55ff-fb96-e4f4-baef564de44e	2313	Fram
00050000-55ff-fb96-c192-2250b72f5f70	3213	Frankolovo
00050000-55ff-fb96-8934-44ee943bf0af	1274	Gabrovka
00050000-55ff-fb96-31b2-abcb5d4c974a	8254	Globoko
00050000-55ff-fb96-c764-d98a1d161230	5275	Godovič
00050000-55ff-fb96-9512-85cd4fb2f210	4204	Golnik
00050000-55ff-fb96-7a2c-1d750a9b120b	3303	Gomilsko
00050000-55ff-fb96-539a-a2f2169bdb8c	4224	Gorenja vas
00050000-55ff-fb96-dae9-998b9edb03a9	3263	Gorica pri Slivnici
00050000-55ff-fb96-3c81-b5387c039e38	2272	Gorišnica
00050000-55ff-fb96-c193-7a1add5a4a84	9250	Gornja Radgona
00050000-55ff-fb96-3079-a064ce206b9f	3342	Gornji Grad
00050000-55ff-fb96-1f9c-b3ec42d3a0ea	4282	Gozd Martuljek
00050000-55ff-fb96-9ca2-b0186f744861	6272	Gračišče
00050000-55ff-fb96-6bc7-114780cf9aaf	9264	Grad
00050000-55ff-fb96-ec34-f5a05a67f302	8332	Gradac
00050000-55ff-fb96-cdc5-7cb2b0355a95	1384	Grahovo
00050000-55ff-fb96-7c5c-53628978c29e	5242	Grahovo ob Bači
00050000-55ff-fb96-03a8-474f3eee63a7	5251	Grgar
00050000-55ff-fb96-02f9-6847eb5b36e8	3302	Griže
00050000-55ff-fb96-612c-9fe453fa2b9e	3231	Grobelno
00050000-55ff-fb96-b439-6da07529d7d9	1290	Grosuplje
00050000-55ff-fb96-b762-0fd5ff4e0916	2288	Hajdina
00050000-55ff-fb96-74dc-5e0446b417f9	8362	Hinje
00050000-55ff-fb96-33a8-e0f4556e46fb	2311	Hoče
00050000-55ff-fb96-4cbf-eedf78c56352	9205	Hodoš/Hodos
00050000-55ff-fb96-dc36-cf4827950be9	1354	Horjul
00050000-55ff-fb96-971a-c311f2a252f8	1372	Hotedršica
00050000-55ff-fb96-190b-fcf2ddb03c3b	1430	Hrastnik
00050000-55ff-fb96-b9fc-59af501ca741	6225	Hruševje
00050000-55ff-fb96-b57b-20bb465ea7d4	4276	Hrušica
00050000-55ff-fb96-bc1b-1c877996738f	5280	Idrija
00050000-55ff-fb96-0470-11c5cb53bf0b	1292	Ig
00050000-55ff-fb96-0fa0-f866eb1e4728	6250	Ilirska Bistrica
00050000-55ff-fb96-02e7-f273b2f9f6e7	6251	Ilirska Bistrica-Trnovo
00050000-55ff-fb96-f4f2-cd95d8f5f453	1295	Ivančna Gorica
00050000-55ff-fb96-db85-f5e54516b1f1	2259	Ivanjkovci
00050000-55ff-fb96-74d1-123a4e9b09e3	1411	Izlake
00050000-55ff-fb96-9515-ed26aa0878b8	6310	Izola/Isola
00050000-55ff-fb96-5d5e-008aa73aa286	2222	Jakobski Dol
00050000-55ff-fb96-6a87-d32d01ed3f8d	2221	Jarenina
00050000-55ff-fb96-955f-294ee0da8c53	6254	Jelšane
00050000-55ff-fb96-ff5f-5f3a53d8334a	4270	Jesenice
00050000-55ff-fb96-ac0f-de6f472174f9	8261	Jesenice na Dolenjskem
00050000-55ff-fb96-5ae6-775e1ad1a463	3273	Jurklošter
00050000-55ff-fb96-04e4-58f0b4f5e1a1	2223	Jurovski Dol
00050000-55ff-fb96-ddf1-78059e0be39e	2256	Juršinci
00050000-55ff-fb96-71e3-9a250c70c2e4	5214	Kal nad Kanalom
00050000-55ff-fb96-2f11-22280e7624f9	3233	Kalobje
00050000-55ff-fb96-fd7f-f26186163cc9	4246	Kamna Gorica
00050000-55ff-fb96-626a-ea364d45f837	2351	Kamnica
00050000-55ff-fb96-a17c-605ffdd40bac	1241	Kamnik
00050000-55ff-fb96-cb0c-871b067b3f74	5213	Kanal
00050000-55ff-fb96-e8a5-1009d4f809b8	8258	Kapele
00050000-55ff-fb96-4390-31042bf470c2	2362	Kapla
00050000-55ff-fb96-6891-25d7f56c71f0	2325	Kidričevo
00050000-55ff-fb96-389d-3a97fd35963c	1412	Kisovec
00050000-55ff-fb96-445c-70ef5a160a76	6253	Knežak
00050000-55ff-fb96-dfff-c75150bf323e	5222	Kobarid
00050000-55ff-fb96-b744-5d4ec1914df0	9227	Kobilje
00050000-55ff-fb96-eea5-30486fc36768	1330	Kočevje
00050000-55ff-fb96-6e92-c29247a3f086	1338	Kočevska Reka
00050000-55ff-fb96-c5c6-e114333b6103	2276	Kog
00050000-55ff-fb96-cb6f-cb8541e3b54e	5211	Kojsko
00050000-55ff-fb96-3c91-e1998e93640c	6223	Komen
00050000-55ff-fb96-19b2-0165d9f50c13	1218	Komenda
00050000-55ff-fb96-6758-0948c0e23dec	6000	Koper/Capodistria 
00050000-55ff-fb96-bd9b-127c31d4e9c8	6001	Koper/Capodistria - poštni predali
00050000-55ff-fb96-baec-a598e65ea04d	8282	Koprivnica
00050000-55ff-fb96-9e4f-3908f75f7cbb	5296	Kostanjevica na Krasu
00050000-55ff-fb96-e097-c084336e5642	8311	Kostanjevica na Krki
00050000-55ff-fb96-074d-c5a66c817ee2	1336	Kostel
00050000-55ff-fb96-6489-2f9a74b0bf56	6256	Košana
00050000-55ff-fb96-6f11-7d6495727c21	2394	Kotlje
00050000-55ff-fb96-7ad4-8aed4e1298cf	6240	Kozina
00050000-55ff-fb96-3075-c6218c73bdb8	3260	Kozje
00050000-55ff-fb96-ec94-422636559b09	4000	Kranj 
00050000-55ff-fb96-dd4c-7e8ac18887e6	4001	Kranj - poštni predali
00050000-55ff-fb96-64bc-1ca35bc04829	4280	Kranjska Gora
00050000-55ff-fb96-254c-bd68f226ec08	1281	Kresnice
00050000-55ff-fb96-0389-85eea9fc1aff	4294	Križe
00050000-55ff-fb96-56ee-99389048c8e5	9206	Križevci
00050000-55ff-fb96-8203-a6c0f209eddf	9242	Križevci pri Ljutomeru
00050000-55ff-fb96-486e-83e38455d550	1301	Krka
00050000-55ff-fb96-1e19-ac72fa55b7d8	8296	Krmelj
00050000-55ff-fb96-b6d4-2baa8a6a7c1b	4245	Kropa
00050000-55ff-fb96-bde2-b1222baebf7a	8262	Krška vas
00050000-55ff-fb96-85cf-de7f8a714a47	8270	Krško
00050000-55ff-fb96-a5ab-a48d6785064d	9263	Kuzma
00050000-55ff-fb96-ce95-38d751869abf	2318	Laporje
00050000-55ff-fb96-9671-ff7bd94ef7b7	3270	Laško
00050000-55ff-fb96-6d15-a598750b68a4	1219	Laze v Tuhinju
00050000-55ff-fb96-c3fa-e1cafb293538	2230	Lenart v Slovenskih goricah
00050000-55ff-fb96-3f38-a69e396c7034	9220	Lendava/Lendva
00050000-55ff-fb96-c135-5ccd9f82c950	4248	Lesce
00050000-55ff-fb96-6b0a-e86d33c45777	3261	Lesično
00050000-55ff-fb96-15be-a40e0649f357	8273	Leskovec pri Krškem
00050000-55ff-fb96-40f2-ac2486a57daa	2372	Libeliče
00050000-55ff-fb96-aadf-5783d62d6651	2341	Limbuš
00050000-55ff-fb96-010b-1439f6af13f4	1270	Litija
00050000-55ff-fb96-24f0-5dec3beb931d	3202	Ljubečna
00050000-55ff-fb96-a672-a3690dc4e22d	1000	Ljubljana 
00050000-55ff-fb96-af8f-d1f62153b658	1001	Ljubljana - poštni predali
00050000-55ff-fb96-8613-1975d34412c7	1231	Ljubljana - Črnuče
00050000-55ff-fb96-80ad-f18639f5d8dc	1261	Ljubljana - Dobrunje
00050000-55ff-fb96-c6c3-49373fe4a436	1260	Ljubljana - Polje
00050000-55ff-fb96-19c5-f35960da13f0	1210	Ljubljana - Šentvid
00050000-55ff-fb96-74d8-3cd9f46580c0	1211	Ljubljana - Šmartno
00050000-55ff-fb96-bc91-665397dd2cff	3333	Ljubno ob Savinji
00050000-55ff-fb96-4194-dd6b36ed2866	9240	Ljutomer
00050000-55ff-fb96-f605-b85349fde2a5	3215	Loče
00050000-55ff-fb96-b8e9-48c120d1f0d5	5231	Log pod Mangartom
00050000-55ff-fb96-3838-dbd382f8f472	1358	Log pri Brezovici
00050000-55ff-fb96-3071-962533978565	1370	Logatec
00050000-55ff-fb96-a0c6-1747412a2db8	1371	Logatec
00050000-55ff-fb96-4959-bc9dcf9b91fe	1434	Loka pri Zidanem Mostu
00050000-55ff-fb96-51ff-680b28dd661a	3223	Loka pri Žusmu
00050000-55ff-fb96-2edf-b68e908246c3	6219	Lokev
00050000-55ff-fb96-4ca6-e50d1c37b1f4	1318	Loški Potok
00050000-55ff-fb96-d299-04cc524f0963	2324	Lovrenc na Dravskem polju
00050000-55ff-fb96-ccca-aecdf3fc224b	2344	Lovrenc na Pohorju
00050000-55ff-fb96-4556-0713c8eb8da0	3334	Luče
00050000-55ff-fb96-9acc-e340ed212112	1225	Lukovica
00050000-55ff-fb96-554e-947936559a64	9202	Mačkovci
00050000-55ff-fb96-dd4d-b0987ccd3fb3	2322	Majšperk
00050000-55ff-fb96-f9b5-fa77c2098bb3	2321	Makole
00050000-55ff-fb96-a4ea-2ef0117be3da	9243	Mala Nedelja
00050000-55ff-fb96-cfcb-638fdf314e52	2229	Malečnik
00050000-55ff-fb96-6ef5-90ba4056b2e4	6273	Marezige
00050000-55ff-fb96-b4a5-7da983072bb3	2000	Maribor 
00050000-55ff-fb96-7e08-ab6db09a10b2	2001	Maribor - poštni predali
00050000-55ff-fb96-0a7a-dc35c6f9c1f8	2206	Marjeta na Dravskem polju
00050000-55ff-fb96-4fb0-f0d6c2832f4c	2281	Markovci
00050000-55ff-fb96-28bc-da7174c533b1	9221	Martjanci
00050000-55ff-fb96-d359-33a2c08cdfa2	6242	Materija
00050000-55ff-fb96-3d29-88335b739183	4211	Mavčiče
00050000-55ff-fb96-4bfc-9e37442e2227	1215	Medvode
00050000-55ff-fb96-6066-f451ef37fd21	1234	Mengeš
00050000-55ff-fb96-4647-21ab4f96c1d8	8330	Metlika
00050000-55ff-fb96-bdaa-01c4f241591f	2392	Mežica
00050000-55ff-fb96-902e-46842d4c6792	2204	Miklavž na Dravskem polju
00050000-55ff-fb96-8050-7a7a11838e9a	2275	Miklavž pri Ormožu
00050000-55ff-fb96-f5e1-112c4122400a	5291	Miren
00050000-55ff-fb96-5e80-b77a235c8005	8233	Mirna
00050000-55ff-fb96-8b38-5f4d9740b037	8216	Mirna Peč
00050000-55ff-fb96-c5a2-90308be12979	2382	Mislinja
00050000-55ff-fb96-ff00-4e9f8c00b023	4281	Mojstrana
00050000-55ff-fb96-e6c1-4b00e42cb02f	8230	Mokronog
00050000-55ff-fb96-ff1b-f157efec4159	1251	Moravče
00050000-55ff-fb96-a381-fd80b95d27e1	9226	Moravske Toplice
00050000-55ff-fb96-402f-b7aca03b5e8d	5216	Most na Soči
00050000-55ff-fb96-196c-4c80d1b4d8da	1221	Motnik
00050000-55ff-fb96-d3eb-903af1ea1b7c	3330	Mozirje
00050000-55ff-fb96-cdc4-082ed3c4561b	9000	Murska Sobota 
00050000-55ff-fb96-29a9-e3f2aa56dd2b	9001	Murska Sobota - poštni predali
00050000-55ff-fb96-ef8e-fe995386c5f1	2366	Muta
00050000-55ff-fb96-06fd-12ac31883220	4202	Naklo
00050000-55ff-fb96-6368-84e16bd90cac	3331	Nazarje
00050000-55ff-fb96-c7cf-40543bae2b2f	1357	Notranje Gorice
00050000-55ff-fb96-5fa7-00a1b7617f33	3203	Nova Cerkev
00050000-55ff-fb96-9404-442ccad515e1	5000	Nova Gorica 
00050000-55ff-fb96-6b06-b9282593d3e5	5001	Nova Gorica - poštni predali
00050000-55ff-fb96-3906-4a43b74f399a	1385	Nova vas
00050000-55ff-fb96-893c-39473f0e7a78	8000	Novo mesto
00050000-55ff-fb96-217d-1f5215d8227e	8001	Novo mesto - poštni predali
00050000-55ff-fb96-17c1-233a5c6b5d62	6243	Obrov
00050000-55ff-fb96-4a87-31c4fa7c9a88	9233	Odranci
00050000-55ff-fb96-5f14-d4bc13e49aae	2317	Oplotnica
00050000-55ff-fb96-4f37-7347c29b59ab	2312	Orehova vas
00050000-55ff-fb96-7bfb-daadf3ca062d	2270	Ormož
00050000-55ff-fb96-0c9e-1522d8d4ed1f	1316	Ortnek
00050000-55ff-fb96-25a0-577c8af78437	1337	Osilnica
00050000-55ff-fb96-e33a-ea762282f545	8222	Otočec
00050000-55ff-fb96-ea99-1b99e016297d	2361	Ožbalt
00050000-55ff-fb96-6091-8bcd4b38e182	2231	Pernica
00050000-55ff-fb96-d17c-cf8d5f3f75ee	2211	Pesnica pri Mariboru
00050000-55ff-fb96-335f-9c806b076504	9203	Petrovci
00050000-55ff-fb96-6144-0c2b30c4c13a	3301	Petrovče
00050000-55ff-fb96-eaed-47498e181e3e	6330	Piran/Pirano
00050000-55ff-fb96-f453-efc2927702cb	8255	Pišece
00050000-55ff-fb96-0fed-d42158eb2e43	6257	Pivka
00050000-55ff-fb96-c038-02cfcbafd54a	6232	Planina
00050000-55ff-fb96-4afa-9789ce204e58	3225	Planina pri Sevnici
00050000-55ff-fb96-a9dc-f5b63e5d99f6	6276	Pobegi
00050000-55ff-fb96-48c4-03ccbe469f84	8312	Podbočje
00050000-55ff-fb96-6bce-4b569c907cc1	5243	Podbrdo
00050000-55ff-fb96-8225-c05f248b2657	3254	Podčetrtek
00050000-55ff-fb96-5efe-997897f9555c	2273	Podgorci
00050000-55ff-fb96-cfae-7e80c01af52a	6216	Podgorje
00050000-55ff-fb96-60fb-073b271f06be	2381	Podgorje pri Slovenj Gradcu
00050000-55ff-fb96-48b7-1c4ab15435a2	6244	Podgrad
00050000-55ff-fb96-0ecd-c20d3894bf7f	1414	Podkum
00050000-55ff-fb96-1e85-7b86b767fea7	2286	Podlehnik
00050000-55ff-fb96-58c5-c0f4a0ab7255	5272	Podnanos
00050000-55ff-fb96-9ade-8e8114aa6139	4244	Podnart
00050000-55ff-fb96-db0d-8da84285b31d	3241	Podplat
00050000-55ff-fb96-13e6-a05025b66ed1	3257	Podsreda
00050000-55ff-fb96-724b-8a9d9f88707f	2363	Podvelka
00050000-55ff-fb96-d61d-8648860ecbf7	2208	Pohorje
00050000-55ff-fb96-2f95-1d5d54172aa4	2257	Polenšak
00050000-55ff-fb96-aefc-fd8e75e74be1	1355	Polhov Gradec
00050000-55ff-fb96-7f8d-87a5d775cceb	4223	Poljane nad Škofjo Loko
00050000-55ff-fb96-6364-5a0c20bfc659	2319	Poljčane
00050000-55ff-fb96-6849-b36563802e58	1272	Polšnik
00050000-55ff-fb96-16e7-b02b906d2362	3313	Polzela
00050000-55ff-fb96-fddf-ec453991e2f0	3232	Ponikva
00050000-55ff-fb96-c713-6d4cbbeb08c0	6320	Portorož/Portorose
00050000-55ff-fb96-dfab-8e179624511e	6230	Postojna
00050000-55ff-fb96-ab33-f4a11d0a992f	2331	Pragersko
00050000-55ff-fb96-9d77-41e3463c9c9a	3312	Prebold
00050000-55ff-fb96-8bf5-600b0cf01e67	4205	Preddvor
00050000-55ff-fb96-1cf4-2188e0c344f9	6255	Prem
00050000-55ff-fb96-9201-3826160061c5	1352	Preserje
00050000-55ff-fb96-4761-ce3785f915e8	6258	Prestranek
00050000-55ff-fb96-270d-0ab03ce07b9e	2391	Prevalje
00050000-55ff-fb96-870e-ca05273c0e88	3262	Prevorje
00050000-55ff-fb96-e317-4ac131e27e8d	1276	Primskovo 
00050000-55ff-fb96-053e-eb8c838ea1e8	3253	Pristava pri Mestinju
00050000-55ff-fb96-4721-6e7a97427f17	9207	Prosenjakovci/Partosfalva
00050000-55ff-fb96-c270-b5953c2acb4c	5297	Prvačina
00050000-55ff-fb96-478d-aa6c67e27cec	2250	Ptuj
00050000-55ff-fb96-1b9b-48d2864f5bf5	2323	Ptujska Gora
00050000-55ff-fb96-e162-35352f4044b6	9201	Puconci
00050000-55ff-fb96-065f-5afcad3a12d7	2327	Rače
00050000-55ff-fb96-2cbb-c9b8905ebaeb	1433	Radeče
00050000-55ff-fb96-dcac-0b0bf78d2baf	9252	Radenci
00050000-55ff-fb96-08c4-fc953b104964	2360	Radlje ob Dravi
00050000-55ff-fb96-3e66-8112a05ef707	1235	Radomlje
00050000-55ff-fb96-7cc6-a1de1bfc70f9	4240	Radovljica
00050000-55ff-fb96-0941-be8420fd5e1d	8274	Raka
00050000-55ff-fb96-27fc-4b3faa15e41c	1381	Rakek
00050000-55ff-fb96-f8c9-74e7d2d764cc	4283	Rateče - Planica
00050000-55ff-fb96-becc-0ab0d4dabfb9	2390	Ravne na Koroškem
00050000-55ff-fb96-3033-f4675717ee57	9246	Razkrižje
00050000-55ff-fb96-994c-2aaadc004b87	3332	Rečica ob Savinji
00050000-55ff-fb96-b569-e076faa1fd68	5292	Renče
00050000-55ff-fb96-b10f-2e8411516b48	1310	Ribnica
00050000-55ff-fb96-f1d9-543d931c30cd	2364	Ribnica na Pohorju
00050000-55ff-fb96-5dcb-d60ced2bfd7f	3272	Rimske Toplice
00050000-55ff-fb96-7b0f-e5571ae4c2c6	1314	Rob
00050000-55ff-fb96-aa05-96963a3b261d	5215	Ročinj
00050000-55ff-fb96-49e9-0f903695d0c8	3250	Rogaška Slatina
00050000-55ff-fb96-45bb-6aa84f054cc6	9262	Rogašovci
00050000-55ff-fb96-661a-bb7290abddac	3252	Rogatec
00050000-55ff-fb96-510d-aa714dfc43d7	1373	Rovte
00050000-55ff-fb96-270b-9829815cd02f	2342	Ruše
00050000-55ff-fb96-3d1c-5f3a01afcb07	1282	Sava
00050000-55ff-fb96-499b-2124936c784e	6333	Sečovlje/Sicciole
00050000-55ff-fb96-46ae-677d8973269c	4227	Selca
00050000-55ff-fb96-cbcf-62f275702411	2352	Selnica ob Dravi
00050000-55ff-fb96-239a-89d23588d822	8333	Semič
00050000-55ff-fb96-d022-cb304b02163d	8281	Senovo
00050000-55ff-fb96-3a51-3cd4c91165ac	6224	Senožeče
00050000-55ff-fb96-e30a-9101f1e9f9cc	8290	Sevnica
00050000-55ff-fb96-ca84-dd46fe9f8606	6210	Sežana
00050000-55ff-fb96-dae6-155bdafc6d5e	2214	Sladki Vrh
00050000-55ff-fb96-975b-062bbb81769a	5283	Slap ob Idrijci
00050000-55ff-fb96-b8cf-593dd04560ad	2380	Slovenj Gradec
00050000-55ff-fb96-0d9b-f6c6f7816575	2310	Slovenska Bistrica
00050000-55ff-fb96-e499-ad41c2f03700	3210	Slovenske Konjice
00050000-55ff-fb96-dd99-63fb0af10066	1216	Smlednik
00050000-55ff-fb96-c125-ea55358a3f45	5232	Soča
00050000-55ff-fb96-23da-8b3237d38626	1317	Sodražica
00050000-55ff-fb96-f482-d426ff41a1d7	3335	Solčava
00050000-55ff-fb96-4cae-ffe9ea283691	5250	Solkan
00050000-55ff-fb96-f828-39f38616c65e	4229	Sorica
00050000-55ff-fb96-5cc5-d63539a1d163	4225	Sovodenj
00050000-55ff-fb96-c201-d837024f74fc	5281	Spodnja Idrija
00050000-55ff-fb96-7214-c5b076b39cb8	2241	Spodnji Duplek
00050000-55ff-fb96-7eb7-b09abcd2b2f7	9245	Spodnji Ivanjci
00050000-55ff-fb96-aeb5-5f8232a5b18a	2277	Središče ob Dravi
00050000-55ff-fb96-c18d-50737d5b1e3b	4267	Srednja vas v Bohinju
00050000-55ff-fb96-6d19-9ef2dff0d356	8256	Sromlje 
00050000-55ff-fb96-4aef-12233aefa07a	5224	Srpenica
00050000-55ff-fb96-4d49-8c48f8c85ae4	1242	Stahovica
00050000-55ff-fb96-4457-19addd9733d2	1332	Stara Cerkev
00050000-55ff-fb96-de08-791f1246ae96	8342	Stari trg ob Kolpi
00050000-55ff-fb96-57bc-3761258ab0c1	1386	Stari trg pri Ložu
00050000-55ff-fb96-368d-c0a34d12be5d	2205	Starše
00050000-55ff-fb96-d4e6-1b9039da1e94	2289	Stoperce
00050000-55ff-fb96-0b0a-4d612d1c6ffa	8322	Stopiče
00050000-55ff-fb96-6e1a-4c282233420d	3206	Stranice
00050000-55ff-fb96-2f2f-8d17f08afb9e	8351	Straža
00050000-55ff-fb96-3f06-3fbe1fffbc68	1313	Struge
00050000-55ff-fb96-c7be-73b96b779c2c	8293	Studenec
00050000-55ff-fb96-f1a3-426ad53d40b1	8331	Suhor
00050000-55ff-fb96-80b5-c502c16dbafa	2233	Sv. Ana v Slovenskih goricah
00050000-55ff-fb96-e0ee-19fe505d5fc2	2235	Sv. Trojica v Slovenskih goricah
00050000-55ff-fb96-9a90-c9169c1131e5	2353	Sveti Duh na Ostrem Vrhu
00050000-55ff-fb96-effe-3b0e19857ba2	9244	Sveti Jurij ob Ščavnici
00050000-55ff-fb96-b1d0-6884d370c0aa	3264	Sveti Štefan
00050000-55ff-fb96-59c6-ab1488e5fd61	2258	Sveti Tomaž
00050000-55ff-fb96-bdd6-53619d58ce3c	9204	Šalovci
00050000-55ff-fb96-42b3-b29412f927ab	5261	Šempas
00050000-55ff-fb96-3f7e-d542df46a4d5	5290	Šempeter pri Gorici
00050000-55ff-fb96-cf8c-1dd122599332	3311	Šempeter v Savinjski dolini
00050000-55ff-fb96-f084-4268bb5a66d7	4208	Šenčur
00050000-55ff-fb96-b8b9-4b711a604f2b	2212	Šentilj v Slovenskih goricah
00050000-55ff-fb96-49f8-d3a9ba60b566	8297	Šentjanž
00050000-55ff-fb96-35d8-cf9f679b8d67	2373	Šentjanž pri Dravogradu
00050000-55ff-fb96-a44a-00ab5303811a	8310	Šentjernej
00050000-55ff-fb96-261e-32ce1dc4ce91	3230	Šentjur
00050000-55ff-fb96-e9a6-0e92da873797	3271	Šentrupert
00050000-55ff-fb96-809c-6b5ed0c98cfa	8232	Šentrupert
00050000-55ff-fb96-0066-f735d1c3d118	1296	Šentvid pri Stični
00050000-55ff-fb96-d52f-5b9c82c9b5cd	8275	Škocjan
00050000-55ff-fb96-77f8-45dc914b70c9	6281	Škofije
00050000-55ff-fb96-60bb-b610d3a161bc	4220	Škofja Loka
00050000-55ff-fb96-e73f-407d466bc978	3211	Škofja vas
00050000-55ff-fb96-c3d6-cbf307dc5b54	1291	Škofljica
00050000-55ff-fb96-e0f8-fe1bdc0262df	6274	Šmarje
00050000-55ff-fb96-cd32-66af6b199ecc	1293	Šmarje - Sap
00050000-55ff-fb96-087a-2861cdde28e0	3240	Šmarje pri Jelšah
00050000-55ff-fb96-ced0-d8686585e824	8220	Šmarješke Toplice
00050000-55ff-fb96-7748-cc1b836304ba	2315	Šmartno na Pohorju
00050000-55ff-fb96-f132-247d142c9f02	3341	Šmartno ob Dreti
00050000-55ff-fb96-917e-1e43729eddb2	3327	Šmartno ob Paki
00050000-55ff-fb96-3b9e-29042ccb6524	1275	Šmartno pri Litiji
00050000-55ff-fb96-3815-5a91e7623b1b	2383	Šmartno pri Slovenj Gradcu
00050000-55ff-fb96-0a5f-7015703da394	3201	Šmartno v Rožni dolini
00050000-55ff-fb96-7c01-f11565664864	3325	Šoštanj
00050000-55ff-fb96-dcc2-16b3264df298	6222	Štanjel
00050000-55ff-fb96-d5bb-692bd33ac090	3220	Štore
00050000-55ff-fb96-25d6-0b8d38f656fa	3304	Tabor
00050000-55ff-fb96-7951-fc7b23a78eac	3221	Teharje
00050000-55ff-fb96-e27e-227ffd4a2216	9251	Tišina
00050000-55ff-fb96-c0ed-c08a269bb010	5220	Tolmin
00050000-55ff-fb96-2a67-94f6cff81ae5	3326	Topolšica
00050000-55ff-fb96-e728-5483fd0ae474	2371	Trbonje
00050000-55ff-fb96-7fce-ec82f8e6d5d3	1420	Trbovlje
00050000-55ff-fb96-fe8b-42ac6b8e2dfd	8231	Trebelno 
00050000-55ff-fb96-ac42-99285f270bfd	8210	Trebnje
00050000-55ff-fb96-8b5f-9b4cc97eaa14	5252	Trnovo pri Gorici
00050000-55ff-fb96-0384-20fd67d6d889	2254	Trnovska vas
00050000-55ff-fb96-4987-46b51f830939	1222	Trojane
00050000-55ff-fb96-1300-d854a75302ab	1236	Trzin
00050000-55ff-fb96-b493-935f0b477c64	4290	Tržič
00050000-55ff-fb96-e13b-d30516e2e02c	8295	Tržišče
00050000-55ff-fb96-3788-2f64ee488e47	1311	Turjak
00050000-55ff-fb96-386f-f1f6a2fe39e9	9224	Turnišče
00050000-55ff-fb96-4581-446b556153d5	8323	Uršna sela
00050000-55ff-fb96-5d6a-6f47e52375e2	1252	Vače
00050000-55ff-fb96-6bde-2f14acbadf6c	3320	Velenje 
00050000-55ff-fb96-a89d-a5b0cf66ddbf	3322	Velenje - poštni predali
00050000-55ff-fb96-90a7-2cf8271cfd09	8212	Velika Loka
00050000-55ff-fb96-832a-12e908ed4533	2274	Velika Nedelja
00050000-55ff-fb96-b222-b7d8b54852e2	9225	Velika Polana
00050000-55ff-fb96-b1f7-947b8035624e	1315	Velike Lašče
00050000-55ff-fb96-9217-f266e23acbe9	8213	Veliki Gaber
00050000-55ff-fb96-7612-04b036a20405	9241	Veržej
00050000-55ff-fb96-09ff-f22c949064bf	1312	Videm - Dobrepolje
00050000-55ff-fb96-ce56-03b930a38951	2284	Videm pri Ptuju
00050000-55ff-fb96-6c28-99c3949a356d	8344	Vinica
00050000-55ff-fb96-4b98-7f551bbed71d	5271	Vipava
00050000-55ff-fb96-17aa-78da5cf709f5	4212	Visoko
00050000-55ff-fb96-ca0b-efae3804d340	1294	Višnja Gora
00050000-55ff-fb96-4908-01c179e2cb57	3205	Vitanje
00050000-55ff-fb96-6c6f-c36dc8bb0f49	2255	Vitomarci
00050000-55ff-fb96-c48d-9305711dd920	1217	Vodice
00050000-55ff-fb96-01bd-def7882769e4	3212	Vojnik\t
00050000-55ff-fb96-156d-a5a1d31267bf	5293	Volčja Draga
00050000-55ff-fb96-5e33-de7d0dcc43ae	2232	Voličina
00050000-55ff-fb96-a0e7-5a192bdc0c17	3305	Vransko
00050000-55ff-fb96-438e-45b31c6e1fdf	6217	Vremski Britof
00050000-55ff-fb96-ccd8-cb777b096bdd	1360	Vrhnika
00050000-55ff-fb96-ad6c-cd46a38fee4c	2365	Vuhred
00050000-55ff-fb96-841f-317e049fbdeb	2367	Vuzenica
00050000-55ff-fb96-f884-9db64870e973	8292	Zabukovje 
00050000-55ff-fb96-89e5-58df5eec51a6	1410	Zagorje ob Savi
00050000-55ff-fb96-6529-39b4419040c7	1303	Zagradec
00050000-55ff-fb96-5c49-e22d4f7245c3	2283	Zavrč
00050000-55ff-fb96-be54-b936a7f9b073	8272	Zdole 
00050000-55ff-fb96-46d9-37c7a9fc1750	4201	Zgornja Besnica
00050000-55ff-fb96-25f1-4ac3b540af77	2242	Zgornja Korena
00050000-55ff-fb96-ffc5-31fbfe3620e5	2201	Zgornja Kungota
00050000-55ff-fb96-affa-150c1041fe67	2316	Zgornja Ložnica
00050000-55ff-fb96-86d0-e21c54227406	2314	Zgornja Polskava
00050000-55ff-fb96-b9aa-761fbfd47231	2213	Zgornja Velka
00050000-55ff-fb96-3b08-604432a74288	4247	Zgornje Gorje
00050000-55ff-fb96-704e-23aa552fab3d	4206	Zgornje Jezersko
00050000-55ff-fb96-000e-dacb158f8f04	2285	Zgornji Leskovec
00050000-55ff-fb96-e21b-256ddfbe3f6d	1432	Zidani Most
00050000-55ff-fb96-7c3a-b6ec8eddac67	3214	Zreče
00050000-55ff-fb96-0ae4-a52455dfb7cb	4209	Žabnica
00050000-55ff-fb96-ebc3-4c8b3212b66b	3310	Žalec
00050000-55ff-fb96-d91e-95b1a8254e14	4228	Železniki
00050000-55ff-fb96-f4a6-84d8499abc10	2287	Žetale
00050000-55ff-fb96-9435-0765fe74ea0e	4226	Žiri
00050000-55ff-fb96-a024-082d0fadc34a	4274	Žirovnica
00050000-55ff-fb96-96c6-e8c4fed24dd2	8360	Žužemberk
\.


--
-- TOC entry 3023 (class 0 OID 20275090)
-- Dependencies: 232
-- Data for Name: postavkacdve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkacdve (id, skupina, podskupina, naziv, vrpremiere, vrponovitvepremier, vrponovitveprejsnjih, vrgostovanjazamejstvo, vrfestivali, vrgostovanjaint, vrostalo, programdela_id) FROM stdin;
\.


--
-- TOC entry 2996 (class 0 OID 20274716)
-- Dependencies: 205
-- Data for Name: postavkaracuna; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkaracuna (id, racun_id) FROM stdin;
\.


--
-- TOC entry 2977 (class 0 OID 20274496)
-- Dependencies: 186
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
00060000-55ff-fb98-1fbe-257e2302c510	00080000-55ff-fb98-675a-7a7462618307	\N	00040000-55ff-fb97-3ec3-6d5f8c6a9ae9	Narodni dom	\N	Koroška 15	\N	9231	Beltinci	\N	f	t
00060000-55ff-fb98-9adf-7ae3fdd34997	00080000-55ff-fb98-675a-7a7462618307	\N	00040000-55ff-fb97-3ec3-6d5f8c6a9ae9	Korotan	\N	Koroška 22	\N	9231	Beltinci	\N	f	f
00060000-55ff-fb98-29f5-0e08535e4c67	00080000-55ff-fb98-7c6c-b9619ed80810	\N	00040000-55ff-fb97-3ec3-6d5f8c6a9ae9	Rimljan	\N	Rimska ploščad 7	\N	9231	Beltinci	\N	f	t
\.


--
-- TOC entry 2985 (class 0 OID 20274600)
-- Dependencies: 194
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, zaporedna, porocilo) FROM stdin;
\.


--
-- TOC entry 2998 (class 0 OID 20274728)
-- Dependencies: 207
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 3024 (class 0 OID 20275104)
-- Dependencies: 233
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, koproducent_id, odstotekfinanciranja, delez, maticnikop, kpe, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 3025 (class 0 OID 20275114)
-- Dependencies: 234
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, sifra, status) FROM stdin;
00190000-55ff-fb98-4fd2-d45d356e3349	00080000-55ff-fb98-9b12-591cacdb606e	0987	AK
00190000-55ff-fb98-fcc2-13bbb1be96ba	00080000-55ff-fb98-7c6c-b9619ed80810	0989	AK
00190000-55ff-fb98-64e0-415b29b3bb81	00080000-55ff-fb98-75a7-31e163713fc0	0986	AK
00190000-55ff-fb98-c48b-1b2ac903fef7	00080000-55ff-fb98-36cb-8efea8ed7ee9	0984	AK
00190000-55ff-fb98-12b5-73a337b0ec2d	00080000-55ff-fb98-e060-18794a56a0f9	0983	AK
00190000-55ff-fb98-989e-15ae949b88db	00080000-55ff-fb98-e550-9e45000e64f6	0982	AK
00190000-55ff-fb9a-5921-1f9532abf51a	00080000-55ff-fb9a-5a7b-21e34db1cd63	1001	AK
\.


--
-- TOC entry 3022 (class 0 OID 20275047)
-- Dependencies: 231
-- Data for Name: programdela; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programdela (id, sifra, naziv, zacetek, konec, zakljuceno, potrjenprogram, stpremier, stint, stfest, strazno, stizjem, stponprem, stponprej, stponprejvelikih, stponprejmalih, stponprejmalihkopr, stponprejsredkopr, stponprejvelikihkopr, stgostujo, vrps1, vrps1do, vrps1mat, vrps1gostovsz, stizvnekomerc, stizvprem, stizvpremdoma, stizvpremkopr, stizvponprem, stizvponpremdoma, stizvponpremzamejo, stizvponpremgost, stizvponpremkopr, stizvponpremint, stizvponpremkoprint, stizvponprej, stizvponprejdoma, stizvponprejzamejo, stizvponprejgost, stizvponprejkopr, stizvponprejint, stizvponprejkoprint, stizvgostuj, stizvostalihnek, stizvgostovanjslo, stizvgostovanjzam, stizvgostovanjint, stobisknekom, stobisknekommat, stobisknekomgostslo, stobisknekomgostzam, stobisknekomgostint, stobiskprem, stobiskpremdoma, stobiskpremkopr, stobiskponprem, stobiskponpremdoma, stobiskponpremkopr, stobiskponpremkoprint, stobiskponpremgost, stobiskponpremzamejo, stobiskponpremint, avgobiskprired, avgzaseddvoran, avgcenavstopnice, stprodvstopnic, stkoprodukcij, stkoprodukcijint, stkoprodukcijnvo, stzaposlenih, stzaposigralcev, avgstnastopovigr, sthonorarnih, sthonorarnihigr, sthonorarnihigrtujjz, sthonorarnihigrsamoz, sredstvaint, sredstvaavt, sredstvazaprosenoprem, sredstvazaprosenoponprem, sredstvazaprosenoponprej, sredstvazaprosenogostujo, sredstvazaprosenoint, sredstvazaprosenofest, sredstvazaprosenorazno, sredstvazaprosenoizjem, sredstvadrugijavniprem, sredstvadrugijavniponprem, sredstvadrugijavniponprej, sredstvadrugijavnigostujo, sredstvadrugijavniint, sredstvadrugijavnifest, sredstvadrugijavnirazno, sredstvadrugijavniizjem, sredstvadrugiviriprem, sredstvadrugiviriponprem, sredstvadrugiviriponprej, sredstvadrugivirigostujo, sredstvadrugiviriint, sredstvadrugivirifest, sredstvadrugivirirazno, sredstvadrugiviriizjem, sredstvaavtsamoz) FROM stdin;
00290000-55ff-fb99-76e4-bc299edb7f5c	0001	Testni program dela	2016-02-01	2017-02-01	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 3026 (class 0 OID 20275122)
-- Dependencies: 235
-- Data for Name: programskaenotasklopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programskaenotasklopa (id, naslovpe, avtorpe, obsegpe, mesecpe, vrednostpe, programrazno_id) FROM stdin;
\.


--
-- TOC entry 3002 (class 0 OID 20274757)
-- Dependencies: 211
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, popa_id, naslov_id, sifra, naziv, jeprizorisce, jematicnioder, seplanira, kapaciteta, opis) FROM stdin;
00220000-55ff-fb98-5576-09a89b2c0630	\N	\N	0001	Poskusna 1	f	\N	t	8	Poskusna učilnica v prvem
00220000-55ff-fb98-e2ef-d956ce55f054	\N	\N	0002	Poskusna 3	f	\N	f	34	Poskusna učilnica v tretjem
00220000-55ff-fb98-787b-11b47113e9bd	\N	\N	0003	Kazinska	t	\N	t	84	Kazinska dvorana
00220000-55ff-fb98-0648-3fe5299207e6	\N	\N	0004	Mali oder	t	\N	t	24	Mali oder 
00220000-55ff-fb98-fa10-58b4e9f1f4d0	\N	\N	0005	Komorni oder	t	\N	t	15	Komorni oder
00220000-55ff-fb98-1393-659898389a7c	\N	\N	0006	Stara dvorana	t	\N	t	96	Stara dvorana ali dvorana Franceta Prešerna
00220000-55ff-fb98-8dc3-eea1745902af	\N	\N	0007	Velika dvorana	t	\N	t	160	Velika, glavna dvorana
\.


--
-- TOC entry 2994 (class 0 OID 20274701)
-- Dependencies: 203
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 2993 (class 0 OID 20274691)
-- Dependencies: 202
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 3015 (class 0 OID 20274899)
-- Dependencies: 224
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta, status) FROM stdin;
\.


--
-- TOC entry 3009 (class 0 OID 20274831)
-- Dependencies: 218
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 2983 (class 0 OID 20274574)
-- Dependencies: 192
-- Data for Name: report; Type: TABLE DATA; Schema: public; Owner: -
--

COPY report (id, job_id, title, filename, transfers, size, format, hash, createdat) FROM stdin;
\.


--
-- TOC entry 2966 (class 0 OID 20274369)
-- Dependencies: 175
-- Data for Name: revizije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY revizije (id, razred, objectid, upor, datum, tip, data) FROM stdin;
1	App\\Entity\\Popa	00080000-55ff-fb9a-5a7b-21e34db1cd63	00010000-55ff-fb97-580b-33647f2e4114	2015-09-21 14:44:10	INS	a:0:{}
2	App\\Entity\\Option	00000000-55ff-fb9a-d145-384e602431b7	00010000-55ff-fb97-580b-33647f2e4114	2015-09-21 14:44:10	INS	a:0:{}
3	ProgramDela\\Entity\\ProdukcijskaHisa	00190000-55ff-fb9a-5921-1f9532abf51a	00010000-55ff-fb97-580b-33647f2e4114	2015-09-21 14:44:10	INS	a:0:{}
\.


--
-- TOC entry 3045 (class 0 OID 0)
-- Dependencies: 174
-- Name: revizije_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('revizije_id_seq', 3, true);


--
-- TOC entry 3003 (class 0 OID 20274770)
-- Dependencies: 212
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 2970 (class 0 OID 20274407)
-- Dependencies: 179
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-55ff-fb97-e6a7-142173d807ab	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-55ff-fb97-bdab-52a02f4bbd2c	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-55ff-fb97-8062-8e0d71326681	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-55ff-fb97-0374-5a2f2360f787	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-55ff-fb97-cac5-45b82ac59a85	planer	Planer dogodkov v koledarju	t
00020000-55ff-fb97-1678-fed60ff76fdb	kadrovska	Kadrovska služba	t
00020000-55ff-fb97-2874-03da2c65726b	arhivar	Ažuriranje arhivalij	t
00020000-55ff-fb97-26b0-cc2a99a427e6	igralec	Igralec	t
00020000-55ff-fb97-fa6f-d23e63f4ed7d	prisotnost	Vnašalec prisotnosti, tudi za tiste izven uprizoritev	t
00020000-55ff-fb98-1fc2-ea7724367c29	vsadovoljenja	Vloga z vsemi posameznimi dovoljenji	t
\.


--
-- TOC entry 2968 (class 0 OID 20274391)
-- Dependencies: 177
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-55ff-fb97-d941-0874d3aff4e6	00020000-55ff-fb97-8062-8e0d71326681
00010000-55ff-fb97-580b-33647f2e4114	00020000-55ff-fb97-8062-8e0d71326681
00010000-55ff-fb98-6547-466e8d22097a	00020000-55ff-fb98-1fc2-ea7724367c29
\.


--
-- TOC entry 3005 (class 0 OID 20274784)
-- Dependencies: 214
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 2997 (class 0 OID 20274722)
-- Dependencies: 206
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 2991 (class 0 OID 20274668)
-- Dependencies: 200
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, sifra, ime, zacetek, konec, aktivna) FROM stdin;
\.


--
-- TOC entry 2964 (class 0 OID 20274356)
-- Dependencies: 173
-- Data for Name: stevilcenje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenje (id, sifra, naziv, prefix, suffix, zacetek, dolzina, format, globalno, poletih) FROM stdin;
00230000-55ff-fb97-e2d2-676b88012765	pri	Privzeto številčenje po letih YYYY-N	\N	\N	1	1	%l-%n	f	t
00230000-55ff-fb97-eb80-8db1557abbd8	123	Privzeto številčenje kratkih šifer	\N	\N	100	3	%n	f	f
00230000-55ff-fb97-5637-74439c6dbfe5	bcd	Globalno številčenje črtnih kod	\N	\N	1	9	%n	t	f
00230000-55ff-fb97-3891-f079b1f59cb0	sif	Številčenje šifrant	\N	\N	1000	4	%n	f	f
00230000-55ff-fb97-9d02-2d6d4c3347a0	tmp	Globalno številčenje začasnih številk	tmp	\N	1000	5	%l%n	t	t
\.


--
-- TOC entry 2963 (class 0 OID 20274348)
-- Dependencies: 172
-- Data for Name: stevilcenjekonfig; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjekonfig (id, stevilcenje_id, dok) FROM stdin;
00240000-55ff-fb97-c8a6-e1b27ee08c09	00230000-55ff-fb97-3891-f079b1f59cb0	popa
00240000-55ff-fb97-74be-991717c4d81e	00230000-55ff-fb97-3891-f079b1f59cb0	oseba
00240000-55ff-fb97-b06a-5de182f6ba8c	00230000-55ff-fb97-3891-f079b1f59cb0	sezona
00240000-55ff-fb97-63d3-09fd246437ce	00230000-55ff-fb97-eb80-8db1557abbd8	prostor
00240000-55ff-fb97-a1cd-0faff54d9169	00230000-55ff-fb97-3891-f079b1f59cb0	besedilo
00240000-55ff-fb97-ae9a-b17c9b57016f	00230000-55ff-fb97-3891-f079b1f59cb0	uprizoritev
00240000-55ff-fb97-2dc5-51429dc6154c	00230000-55ff-fb97-3891-f079b1f59cb0	funkcija
00240000-55ff-fb97-15f3-92fe5d67ada7	00230000-55ff-fb97-3891-f079b1f59cb0	tipfunkcije
00240000-55ff-fb97-4468-b7ef2cd9ef3a	00230000-55ff-fb97-3891-f079b1f59cb0	alternacija
00240000-55ff-fb97-6f94-3090ab7ae2b9	00230000-55ff-fb97-e2d2-676b88012765	pogodba
00240000-55ff-fb97-475f-0c9693cb2344	00230000-55ff-fb97-3891-f079b1f59cb0	zaposlitev
00240000-55ff-fb97-28f3-5037815ffdf8	00230000-55ff-fb97-3891-f079b1f59cb0	zvrstuprizoritve
00240000-55ff-fb97-f6b3-df4e1d77e2db	00230000-55ff-fb97-e2d2-676b88012765	programdela
00240000-55ff-fb97-780c-db7bee3affe7	00230000-55ff-fb97-3891-f079b1f59cb0	zapis
\.


--
-- TOC entry 2962 (class 0 OID 20274343)
-- Dependencies: 171
-- Data for Name: stevilcenjestanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjestanje (id, objid, leto, stevilka) FROM stdin;
e9b273fe-106c-4e49-9894-6460c6253647	00240000-55ff-fb97-c8a6-e1b27ee08c09	0	1001
\.


--
-- TOC entry 3011 (class 0 OID 20274848)
-- Dependencies: 220
-- Data for Name: strosekuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY strosekuprizoritve (id, uprizoritev_id, popa_id, naziv, vrednostdo, vrednostna, opis, tipstroska, sort, vrstastroska_id) FROM stdin;
00270000-55ff-fb99-c107-ad0fda7157de	000e0000-55ff-fb99-982c-ced10debc9f0	00080000-55ff-fb98-675a-7a7462618307	Nabava kostumov	600.50	20.00	Krila in maske	materialni	1	003b0000-55ff-fb97-53be-ba2bb7061990
00270000-55ff-fb99-77ad-ec15118e93a0	000e0000-55ff-fb99-982c-ced10debc9f0	00080000-55ff-fb98-675a-7a7462618307	Zavese	125.70	3.10	Modra in zelena zavesa	materialni	2	003b0000-55ff-fb97-53be-ba2bb7061990
\.


--
-- TOC entry 2975 (class 0 OID 20274469)
-- Dependencies: 184
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 2992 (class 0 OID 20274678)
-- Dependencies: 201
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja) FROM stdin;
001a0000-55ff-fb99-0226-fff531bfaa26	00180000-55ff-fb99-4ee7-681fa7e92cf7	000c0000-55ff-fb99-c6f7-b6fde1109067	00090000-55ff-fb99-6168-044b36476c7e	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55ff-fb99-a6f1-0eab9d17eae6	00180000-55ff-fb99-4ee7-681fa7e92cf7	000c0000-55ff-fb99-0f83-5ad3d38101e6	00090000-55ff-fb99-0fc2-301384d7b9eb	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55ff-fb99-c365-544ffb5656db	00180000-55ff-fb99-4ee7-681fa7e92cf7	000c0000-55ff-fb99-1dc4-693b219d1e89	00090000-55ff-fb99-4840-baa5db7daeba	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55ff-fb99-ef45-ba69d208a7bd	00180000-55ff-fb99-4ee7-681fa7e92cf7	000c0000-55ff-fb99-d62d-fc9647a2efeb	00090000-55ff-fb99-8890-03bbad573bbc	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55ff-fb99-15af-967e0068c8bc	00180000-55ff-fb99-4ee7-681fa7e92cf7	000c0000-55ff-fb99-4d7e-a8d42d898978	00090000-55ff-fb99-7152-0f7df1fd3643	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55ff-fb99-edff-10342219eeb9	00180000-55ff-fb99-c617-4e849fc2bf3b	\N	00090000-55ff-fb99-7152-0f7df1fd3643	2015-08-01 20:00:00	2015-08-01 23:00:00	\N	\N	2.00
\.


--
-- TOC entry 3014 (class 0 OID 20274887)
-- Dependencies: 223
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, sifra, ime, opis, imezenski, podrocje) FROM stdin;
000f0000-55ff-fb97-807a-16ec61bc92dd	01	Avtor	Avtorji	Avtorka	umetnik
000f0000-55ff-fb97-047e-969502c1159d	02	Priredba	Priredba	Priredba	umetnik
000f0000-55ff-fb97-8dd3-320d776802a6	03	Prevod	Prevod	Prevod	umetnik
000f0000-55ff-fb97-cea7-35c507a92189	04	Režija	Režija	Režija	umetnik
000f0000-55ff-fb97-4dca-239e626feec3	05	Dramaturgija	Dramaturgija	Dramaturgija	umetnik
000f0000-55ff-fb97-b63c-e04f1f12273c	06	Scenografija	Scenografija	Scenografija	umetnik
000f0000-55ff-fb97-0ccd-1ded3e157ca3	07	Kostumografija	Kostumografija	Kostumografija	umetnik
000f0000-55ff-fb97-9c92-b4deb4bc832e	08	Koreografija	Koreografija	Koreografija	umetnik
000f0000-55ff-fb97-85c7-be9a58e18f9e	09	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	umetnik
000f0000-55ff-fb97-1665-894071e0355e	10	Oblikovanje maske	Oblikovanje maske	Oblikovanje maske	umetnik
000f0000-55ff-fb97-44e3-fc9ceeb25870	11	Lektorstvo	Lektorstvo	Lektorstvo	umetnik
000f0000-55ff-fb97-d2ce-cd1868d18543	12	Glasbeni soustvarjalec	Glasbeni soustvarjalci	Glasbena soustvarjalka	umetnik
000f0000-55ff-fb97-ee93-868181856734	13	Intermedijski ustvarjalec	Intermedijski ustvarjalci	Intermedijski ustvarjalka	umetnik
000f0000-55ff-fb97-1713-83a2c13752d4	14	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	umetnik
000f0000-55ff-fb97-bc24-8764f651b74b	15	Vloga	Intermedijski ustvarjalci	Intermedijska ustvarjalka	igralec
000f0000-55ff-fb97-b6c6-cb589d11f0ca	16	Produkcija, mentorstvo	Produkcija, mentorstvo	Produkcija, mentorstvo	umetnik
000f0000-55ff-fb97-2f91-af89621df2eb	17	Tehnična podpora	Tehnična podpora	Tehnična podpora	tehnik
000f0000-55ff-fb97-f423-77c33ddd88ad	18	Inšpicient	Inšpicienti	Inšpicientka	inspicient
\.


--
-- TOC entry 3027 (class 0 OID 20275132)
-- Dependencies: 236
-- Data for Name: tipprogramskeenote; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipprogramskeenote (id, sifra, naziv, koprodukcija, maxfaktor, maxvsi) FROM stdin;
002b0000-55ff-fb97-9b1f-6583b14d9397	01	Velika predstava	f	1.00	1.00
002b0000-55ff-fb97-069b-fd8d0784f996	02	Mala predstava	f	0.50	0.50
002b0000-55ff-fb97-e886-8b57630a2269	03	Mala koprodukcija	t	0.40	1.00
002b0000-55ff-fb97-8d5b-19d56e4faf56	04	Srednja koprodukcija	t	0.70	2.00
002b0000-55ff-fb97-9ace-8d67a0c5fdc0	05	Velika koprodukcija	t	1.00	3.00
\.


--
-- TOC entry 2980 (class 0 OID 20274531)
-- Dependencies: 189
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 2967 (class 0 OID 20274378)
-- Dependencies: 176
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-55ff-fb97-580b-33647f2e4114	Konzolni	$2y$05$NS4xMjkyMTcwMzExMjAxROHf5VSfOe1R9S9SAYojUxGkah9bTg0bK	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-55ff-fb98-9d32-557a3020e6c0	testni uporabnik za inšpicienta	$2y$05$NS4xMjkyMTcwMzExMjAxROxkJ1B6xAXex6EZLIwJfWzRJ8DpfecFO	t	\N	\N	\N	ivo@ifigenija.si	\N	\N	\N
00010000-55ff-fb98-c96a-d50979be1b1f	testni uporabnik za Tehničnega vodjo	$2y$05$NS4xMjkyMTcwMzExMjAxROu/kXWR9sP9oamkesKuxXLbxkCb387.G	t	\N	\N	\N	tona@ifigenija.si	\N	\N	\N
00010000-55ff-fb98-06ae-afb0349581d9	testni uporabnik za igralca	$2y$05$NS4xMjkyMTcwMzExMjAxRO/hLCgClfERRsfCAFYwxNCcFIVjP2982	t	\N	\N	\N	irena@ifigenija.si	\N	\N	\N
00010000-55ff-fb98-103e-ac07a23958c4	testni uporabnik vnašalca termina storitev (TerminStoritve-vse)	$2y$05$NS4xMjkyMTcwMzExMjAxROT6.kTHqEq4.wa2SOnf124/N14m9qeP.	t	\N	\N	\N	tatjana@ifigenija.si	\N	\N	\N
00010000-55ff-fb98-71ba-671677c2690d	testni uporabnik, ki je inšpicient brez zapisov v TerminStoritve	$2y$05$NS4xMjkyMTcwMzExMjAxROHau47Dtb7CME5.nlWwBVM.nusFP.ra2	t	\N	\N	\N	joze@ifigenija.si	\N	\N	\N
00010000-55ff-fb98-9b01-01509eba79b7	testna uporabnica, ki je planerka	$2y$05$NS4xMjkyMTcwMzExMjAxRO.B/uJO3C7QRNhdX9Q2hTLQsSupj1V1S	t	\N	\N	\N	petra@ifigenija.si	\N	\N	\N
00010000-55ff-fb98-ea36-1b5ad0a27bbf	testni uporabnik, ki dobi ifi-all vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROv2d7jqhaV/Mz3EIsKoi7UoFR.SDSMBm	t	\N	\N	\N	ali@ifigenija.si	\N	\N	\N
00010000-55ff-fb98-9a4a-2e7ffc747f5d	testni uporabnik, ki dobi ifi-readall vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROYB9g.gnkufr1l/gWK6mkx.ySqrOWnJC	t	\N	\N	\N	berta@ifigenija.si	\N	\N	\N
00010000-55ff-fb98-c0b7-b442d043edb8	testni uporabnik, ki dobi aaa-write dovoljenje	$2y$05$NS4xMjkyMTcwMzExMjAxRORujYObKX.DzpXVYbePkiJkHqg0/Ylya	t	\N	\N	\N	aaron@ifigenija.si	\N	\N	\N
00010000-55ff-fb98-6547-466e8d22097a	testni uporabnik ki dobi vsa posamezna dovoljenja	$2y$05$NS4xMjkyMTcwMzExMjAxRO2ymwxVXTr7U4Ncdn.bN49E8rLw9Jg0O	t	\N	\N	\N	vesna@ifigenija.si	\N	\N	\N
00010000-55ff-fb97-d941-0874d3aff4e6	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 3018 (class 0 OID 20274937)
-- Dependencies: 227
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, producent_id, sifra, faza, naslov, podnaslov, delovninaslov, internacionalninaslov, naslovizvirnika, podnaslovizvirnika, datumzacstudija, stevilovaj, planiranostevilovaj, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, krstna, prvaslovenska, kratkinaslov, maticnioder_id) FROM stdin;
000e0000-55ff-fb99-1f24-38317a871412	00160000-55ff-fb98-2413-e487968ae2b4	\N	00140000-55ff-fb97-45f7-5a228540b555	\N	0001	produkcija	Sen kresne noči		Sanje	\N	\N	\N	2016-02-01	\N	\N	2016-06-01	1	William  Shakespeare - Nebojša  Kavader	f	2				\N	f	\N	\N		00220000-55ff-fb98-fa10-58b4e9f1f4d0
000e0000-55ff-fb99-982c-ced10debc9f0	00160000-55ff-fb98-57ef-b5c17747a8bc	\N	00140000-55ff-fb97-f6e4-08218ba2c474	\N	0002	predprodukcija-ideja	Smoletov vrt			\N	\N	\N	2016-01-01	\N	\N	2016-04-20	2	Berta   Hočevar	f	2				\N	f	\N	\N		00220000-55ff-fb98-1393-659898389a7c
000e0000-55ff-fb99-c10d-fd4e04f094f1	\N	\N	00140000-55ff-fb97-f6e4-08218ba2c474	00190000-55ff-fb98-4fd2-d45d356e3349	0003	postprodukcija	Kisli maček			\N	\N	\N	2016-02-01	\N	\N	2016-04-20	2	\N	t	2				\N	f	\N	\N		00220000-55ff-fb98-fa10-58b4e9f1f4d0
000e0000-55ff-fb99-38d0-1c2364c05232	\N	\N	00140000-55ff-fb97-f6e4-08218ba2c474	00190000-55ff-fb98-4fd2-d45d356e3349	0004	postprodukcija	Vladimir			\N	\N	\N	2017-03-01	\N	\N	2017-04-20	2	\N	t	2				\N	f	\N	\N		00220000-55ff-fb98-fa10-58b4e9f1f4d0
000e0000-55ff-fb99-9672-055258ddf1b9	\N	\N	00140000-55ff-fb97-f6e4-08218ba2c474	00190000-55ff-fb98-4fd2-d45d356e3349	0005	postprodukcija	Španska princesa			\N	\N	\N	2017-04-01	\N	\N	2017-05-20	1	\N	f	1				\N	f	\N	\N		00220000-55ff-fb98-5576-09a89b2c0630
000e0000-55ff-fb99-000c-d5e8b60a827f	\N	\N	00140000-55ff-fb97-f6e4-08218ba2c474	00190000-55ff-fb98-4fd2-d45d356e3349	0006	postprodukcija	Ne vemo datumov			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		00220000-55ff-fb98-5576-09a89b2c0630
\.


--
-- TOC entry 2987 (class 0 OID 20274621)
-- Dependencies: 196
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, uprizoritev_id, vrsta, zaporedna, porocilo) FROM stdin;
00200000-55ff-fb99-7fa5-361cbde16ca4	000e0000-55ff-fb99-982c-ced10debc9f0	\N	1	
00200000-55ff-fb99-3a69-b88bb260fc3a	000e0000-55ff-fb99-982c-ced10debc9f0	\N	2	
00200000-55ff-fb99-fbd7-4ebc7047d09a	000e0000-55ff-fb99-982c-ced10debc9f0	\N	3	
00200000-55ff-fb99-4665-a1596dbbb379	000e0000-55ff-fb99-982c-ced10debc9f0	\N	4	
00200000-55ff-fb99-7d25-a043c64cdf75	000e0000-55ff-fb99-982c-ced10debc9f0	\N	5	
\.


--
-- TOC entry 3001 (class 0 OID 20274749)
-- Dependencies: 210
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 3012 (class 0 OID 20274862)
-- Dependencies: 221
-- Data for Name: vrstastroska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstastroska (id, skupina, podskupina, naziv, opis) FROM stdin;
003b0000-55ff-fb97-5711-d62f1862b3f5	1	0	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE
003b0000-55ff-fb97-ba65-81916a2a4279	1	1	Storitve varovanja zgradb in prostorov	storitve varovanja zgradb in prostorov (npr. gasilci na predstavah)
003b0000-55ff-fb97-5764-db4dea096aa6	1	2	Založniške in tiskarske storitve	založniške in tiskarske storitve
003b0000-55ff-fb97-8d57-c977c3daa152	1	3	Časopisi, revije, knjige in strokovna literatura	časopisi, revije, knjige in strokovna literatura
003b0000-55ff-fb97-9423-4c14bb8f5e96	1	4	Stroški prevajalskih storitev	stroški prevajalskih storitev
003b0000-55ff-fb97-f498-faaa1ac1e3aa	1	5	Stroški oglaševalskih storitev	stroški oglaševalskih storitev
003b0000-55ff-fb97-4b86-bce64311da92	1	6	Izdatki za reprezentanco	izdatki za reprezentanco
003b0000-55ff-fb97-85cb-f60890276626	2	0	POSEBNI MATERIAL IN STORITVE	POSEBNI MATERIAL IN STORITVE
003b0000-55ff-fb97-53be-ba2bb7061990	2	1	Drugi posebni material in storitve	drugi posebni material in storitve (npr. za instrumete - navedite)
003b0000-55ff-fb97-c062-74facf99c0af	2	2	Oprema predstave – stroški rekvizitov	Oprema predstave – stroški rekvizitov
003b0000-55ff-fb97-62d7-fa486c2d98eb	2	3	Oprema predstave – stroški kostumov	Oprema predstave – stroški kostumov
003b0000-55ff-fb97-7365-e2aa45a27c45	2	4	Oprema predstave – stroški scenske opreme	Oprema predstave – stroški scenske opreme
003b0000-55ff-fb97-08b2-74b8007078f1	2	5	Oprema predstave – stroški avdio in video opreme	Oprema predstave – stroški avdio in video opreme
003b0000-55ff-fb97-bd07-8e2ed127ee0c	3	0	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE
003b0000-55ff-fb97-839f-d00998963340	3	1	Poštnina in kurirske storitve	poštnina in kurirske storitve
003b0000-55ff-fb97-3f8b-dfdac8c3253c	4	0	PREVOZNI STROŠKI IN STORITVE	PREVOZNI STROŠKI IN STORITVE
003b0000-55ff-fb97-f200-9d0695946319	4	1	Goriva in maziva za prevozna sredstva	goriva in maziva za prevozna sredstva
003b0000-55ff-fb97-ca8d-71ddfdfe9afb	4	2	Najem vozil in selitveni stroški	najem vozil in selitveni stroški
003b0000-55ff-fb97-0dda-c89ffbd7b28a	4	3	Drugi prevozni in transportni stroški 	drugi prevozni in transportni stroški (navedite)
003b0000-55ff-fb97-65d7-0c66ad673a62	5	0	IZDATKI ZA SLUŽBENA POTOVANJA	IZDATKI ZA SLUŽBENA POTOVANJA
003b0000-55ff-fb97-2873-90d36ecd0727	5	1	Dnevnice za službena potovanja v državi in tujini	dnevnice za službena potovanja v državi in tujini
003b0000-55ff-fb97-3488-81eb524ee7fd	5	2	Hotelske in restavra. storitve v državi in tujini	hotelske in restavra. storitve v državi in tujini
003b0000-55ff-fb97-fb59-5ece4ef2424f	5	3	Stroški prevoza v državi in tujini	stroški prevoza v državi in tujini
003b0000-55ff-fb97-6445-63618e56d489	5	4	Drugi izdatki za službena potovanja	drugi izdatki za službena potovanja (navedite)
003b0000-55ff-fb97-9aae-04b076c7a91a	6	0	NAJEMNINE IN ZAKUPNINE	NAJEMNINE IN ZAKUPNINE
003b0000-55ff-fb97-e59d-0ec40fe3bc6c	6	1	Druge najemnine, zakupnine in licenčnine	druge najemnine, zakupnine in licenčnine (npr. najem notnega materiala, instrumentov - navedite)
003b0000-55ff-fb97-33ef-7e95b9fabd27	7	0	DRUGI OPERATIVNI ODHODKI	DRUGI OPERATIVNI ODHODKI
003b0000-55ff-fb97-5ef9-4eb4b6d63e1c	7	1	Izdatki za strok. izobraževanje zap.	izdatki za strok. izobraževanje zap.(vezani na program. enote)  
\.


--
-- TOC entry 3030 (class 0 OID 20275179)
-- Dependencies: 239
-- Data for Name: vrstazapisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstazapisa (id, oznaka, naziv, aktiven, znacka, ikona, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3029 (class 0 OID 20275151)
-- Dependencies: 238
-- Data for Name: zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapis (id, vrsta_id, datoteka_id, mapa_id, avtor_id, zaklenil_id, tip, zaklenjen, datumzaklepanja, identifier, subject, title, description, coverage, creator, language, date, publisher, relation, rights, source, upor, datknj, standard, lokacija) FROM stdin;
\.


--
-- TOC entry 3031 (class 0 OID 20275191)
-- Dependencies: 240
-- Data for Name: zapislastnik; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapislastnik (id, zapis_id, lastnik, classlastnika, datum, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3008 (class 0 OID 20274821)
-- Dependencies: 217
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, sifra, status, delovnomesto, zacetek, konec, tip, delovnaobveza, malica, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci) FROM stdin;
00100000-55ff-fb99-f15a-8754017aa21f	00090000-55ff-fb99-0fc2-301384d7b9eb	01	A	Mojster	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55ff-fb99-cc25-2020f5b6c7e4	00090000-55ff-fb99-4840-baa5db7daeba	02	A	Igralec	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55ff-fb99-1a15-028ba1ab788a	00090000-55ff-fb99-9792-5471d1f582a7	03	A	Natakar	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55ff-fb99-5457-e64dd3d181aa	00090000-55ff-fb99-c3e0-1ae0fc70d2b4	04	A	Mizar	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55ff-fb99-3995-d1321d502774	00090000-55ff-fb99-6168-044b36476c7e	05	A	Šivilja	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55ff-fb99-9bd7-8c06f4b5c958	00090000-55ff-fb99-a996-72fd63d51b5b	06	A	Inšpicient	2010-02-01	2010-02-01	1	2		t	f	f	t
\.


--
-- TOC entry 2989 (class 0 OID 20274657)
-- Dependencies: 198
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id, oseba_id) FROM stdin;
\.


--
-- TOC entry 3017 (class 0 OID 20274927)
-- Dependencies: 226
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, sifra, naziv, opis) FROM stdin;
00140000-55ff-fb97-45f7-5a228540b555	01	Drama	drama (SURS 01)
00140000-55ff-fb97-815e-cf69fd8c4204	02	Opera	opera (SURS 02)
00140000-55ff-fb97-fda1-7970377cd0f9	03	Balet	balet (SURS 03)
00140000-55ff-fb97-b3d4-6babd5bab588	04	Plesne prireditve	plesne prireditve (SURS 04)
00140000-55ff-fb97-5df0-b9bda974052c	05	Lutkovno gledališče	lutkovno gledališče (SURS 05)
00140000-55ff-fb97-f6e4-08218ba2c474	06	Raziskovalno gledališče	raziskovalno gledališče (SURS 06)
00140000-55ff-fb97-5afb-183286bd8ddf	07	Drugo	drugo (SURS 07)
\.


--
-- TOC entry 3007 (class 0 OID 20274811)
-- Dependencies: 216
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, sifra, naziv, opis) FROM stdin;
\.


--
-- TOC entry 2494 (class 2606 OID 20274432)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2686 (class 2606 OID 20274986)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2682 (class 2606 OID 20274976)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2645 (class 2606 OID 20274845)
-- Name: avtorbesedila_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT avtorbesedila_pkey PRIMARY KEY (id);


--
-- TOC entry 2656 (class 2606 OID 20274885)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2743 (class 2606 OID 20275231)
-- Name: datoteka_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT datoteka_pkey PRIMARY KEY (id);


--
-- TOC entry 2557 (class 2606 OID 20274646)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2572 (class 2606 OID 20274667)
-- Name: dogodeksplosni_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodeksplosni
    ADD CONSTRAINT dogodeksplosni_pkey PRIMARY KEY (id);


--
-- TOC entry 2719 (class 2606 OID 20275149)
-- Name: drugivir_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT drugivir_pkey PRIMARY KEY (id);


--
-- TOC entry 2528 (class 2606 OID 20274557)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2693 (class 2606 OID 20275041)
-- Name: enotaprograma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT enotaprograma_pkey PRIMARY KEY (id);


--
-- TOC entry 2630 (class 2606 OID 20274807)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2551 (class 2606 OID 20274619)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2545 (class 2606 OID 20274595)
-- Name: job_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY job
    ADD CONSTRAINT job_pkey PRIMARY KEY (id);


--
-- TOC entry 2536 (class 2606 OID 20274571)
-- Name: kontaktnaoseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT kontaktnaoseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2594 (class 2606 OID 20274714)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2737 (class 2606 OID 20275208)
-- Name: mapa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT mapa_pkey PRIMARY KEY (id);


--
-- TOC entry 2741 (class 2606 OID 20275215)
-- Name: mapa_zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT mapa_zapis_pkey PRIMARY KEY (mapa_id, zapis_id);


--
-- TOC entry 2748 (class 2606 OID 20275239)
-- Name: mapaacl_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT mapaacl_pkey PRIMARY KEY (id);


--
-- TOC entry 2466 (class 2606 OID 19946842)
-- Name: migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY migrations
    ADD CONSTRAINT migrations_pkey PRIMARY KEY (version);


--
-- TOC entry 2606 (class 2606 OID 20274741)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2521 (class 2606 OID 20274529)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2498 (class 2606 OID 20274441)
-- Name: optionvalue_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT optionvalue_pkey PRIMARY KEY (id);


--
-- TOC entry 2501 (class 2606 OID 20274465)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2492 (class 2606 OID 20274421)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2485 (class 2606 OID 20274406)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2609 (class 2606 OID 20274747)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2623 (class 2606 OID 20274783)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2668 (class 2606 OID 20274922)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2510 (class 2606 OID 20274493)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2518 (class 2606 OID 20274517)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2703 (class 2606 OID 20275102)
-- Name: postavkacdve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkacdve
    ADD CONSTRAINT postavkacdve_pkey PRIMARY KEY (id);


--
-- TOC entry 2598 (class 2606 OID 20274720)
-- Name: postavkaracuna_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT postavkaracuna_pkey PRIMARY KEY (id);


--
-- TOC entry 2516 (class 2606 OID 20274507)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2549 (class 2606 OID 20274607)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2604 (class 2606 OID 20274732)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2707 (class 2606 OID 20275111)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2709 (class 2606 OID 20275119)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2700 (class 2606 OID 20275089)
-- Name: programdela_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT programdela_pkey PRIMARY KEY (id);


--
-- TOC entry 2714 (class 2606 OID 20275130)
-- Name: programskaenotasklopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT programskaenotasklopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2616 (class 2606 OID 20274765)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2592 (class 2606 OID 20274705)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2586 (class 2606 OID 20274696)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2663 (class 2606 OID 20274909)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2643 (class 2606 OID 20274838)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2539 (class 2606 OID 20274583)
-- Name: report_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY report
    ADD CONSTRAINT report_pkey PRIMARY KEY (id);


--
-- TOC entry 2477 (class 2606 OID 20274377)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2621 (class 2606 OID 20274774)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2483 (class 2606 OID 20274395)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2487 (class 2606 OID 20274415)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2628 (class 2606 OID 20274792)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2600 (class 2606 OID 20274727)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2574 (class 2606 OID 20274676)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2474 (class 2606 OID 20274365)
-- Name: stevilcenje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenje
    ADD CONSTRAINT stevilcenje_pkey PRIMARY KEY (id);


--
-- TOC entry 2471 (class 2606 OID 20274353)
-- Name: stevilcenjekonfig_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT stevilcenjekonfig_pkey PRIMARY KEY (id);


--
-- TOC entry 2468 (class 2606 OID 20274347)
-- Name: stevilcenjestanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjestanje
    ADD CONSTRAINT stevilcenjestanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2652 (class 2606 OID 20274858)
-- Name: strosekuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT strosekuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2507 (class 2606 OID 20274474)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2580 (class 2606 OID 20274687)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2659 (class 2606 OID 20274896)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2716 (class 2606 OID 20275142)
-- Name: tipprogramskeenote_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipprogramskeenote
    ADD CONSTRAINT tipprogramskeenote_pkey PRIMARY KEY (id);


--
-- TOC entry 2526 (class 2606 OID 20274542)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2479 (class 2606 OID 20274390)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2680 (class 2606 OID 20274955)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2555 (class 2606 OID 20274629)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2612 (class 2606 OID 20274755)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2654 (class 2606 OID 20274870)
-- Name: vrstastroska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstastroska
    ADD CONSTRAINT vrstastroska_pkey PRIMARY KEY (id);


--
-- TOC entry 2730 (class 2606 OID 20275189)
-- Name: vrstazapisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstazapisa
    ADD CONSTRAINT vrstazapisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2727 (class 2606 OID 20275173)
-- Name: zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT zapis_pkey PRIMARY KEY (id);


--
-- TOC entry 2733 (class 2606 OID 20275197)
-- Name: zapislastnik_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT zapislastnik_pkey PRIMARY KEY (id);


--
-- TOC entry 2639 (class 2606 OID 20274829)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2570 (class 2606 OID 20274661)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2672 (class 2606 OID 20274935)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2636 (class 2606 OID 20274819)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2558 (class 1259 OID 20274655)
-- Name: dogodki_konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_konec ON dogodek USING btree (konec);


--
-- TOC entry 2559 (class 1259 OID 20274656)
-- Name: dogodki_razred; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_razred ON dogodek USING btree (razred);


--
-- TOC entry 2560 (class 1259 OID 20274654)
-- Name: dogodki_zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2561 (class 1259 OID 20274653)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2562 (class 1259 OID 20274652)
-- Name: idx_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2648 (class 1259 OID 20274859)
-- Name: idx_11ffe6e05c75296c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e05c75296c ON strosekuprizoritve USING btree (vrstastroska_id);


--
-- TOC entry 2649 (class 1259 OID 20274860)
-- Name: idx_11ffe6e062b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e062b4ffca ON strosekuprizoritve USING btree (uprizoritev_id);


--
-- TOC entry 2650 (class 1259 OID 20274861)
-- Name: idx_11ffe6e06beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e06beede51 ON strosekuprizoritve USING btree (popa_id);


--
-- TOC entry 2734 (class 1259 OID 20275210)
-- Name: idx_14a5d6d3727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d3727aca70 ON mapa USING btree (parent_id);


--
-- TOC entry 2735 (class 1259 OID 20275209)
-- Name: idx_14a5d6d38a4a6c12; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d38a4a6c12 ON mapa USING btree (lastnik_id);


--
-- TOC entry 2508 (class 1259 OID 20274495)
-- Name: idx_1c7adba5ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba5ee4b985a ON popa USING btree (drzava_id);


--
-- TOC entry 2607 (class 1259 OID 20274748)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2721 (class 1259 OID 20275177)
-- Name: idx_1ed92829253c4123; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829253c4123 ON zapis USING btree (avtor_id);


--
-- TOC entry 2722 (class 1259 OID 20275176)
-- Name: idx_1ed9282957ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282957ed422f ON zapis USING btree (mapa_id);


--
-- TOC entry 2723 (class 1259 OID 20275178)
-- Name: idx_1ed9282987ff3295; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282987ff3295 ON zapis USING btree (zaklenil_id);


--
-- TOC entry 2724 (class 1259 OID 20275175)
-- Name: idx_1ed92829a54dbb1f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829a54dbb1f ON zapis USING btree (datoteka_id);


--
-- TOC entry 2725 (class 1259 OID 20275174)
-- Name: idx_1ed92829ef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829ef943358 ON zapis USING btree (vrsta_id);


--
-- TOC entry 2601 (class 1259 OID 20274734)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2602 (class 1259 OID 20274733)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2553 (class 1259 OID 20274630)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2631 (class 1259 OID 20274808)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2632 (class 1259 OID 20274810)
-- Name: idx_23aeb9586b361365; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9586b361365 ON funkcija USING btree (tipfunkcije_id);


--
-- TOC entry 2633 (class 1259 OID 20274809)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2533 (class 1259 OID 20274573)
-- Name: idx_2942b10710389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b10710389148 ON kontaktnaoseba USING btree (oseba_id);


--
-- TOC entry 2534 (class 1259 OID 20274572)
-- Name: idx_2942b1076beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b1076beede51 ON kontaktnaoseba USING btree (popa_id);


--
-- TOC entry 2712 (class 1259 OID 20275131)
-- Name: idx_2d901816d6bc69d6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2d901816d6bc69d6 ON programskaenotasklopa USING btree (programrazno_id);


--
-- TOC entry 2664 (class 1259 OID 20274924)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2665 (class 1259 OID 20274925)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2666 (class 1259 OID 20274926)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2731 (class 1259 OID 20275198)
-- Name: idx_2eaff9dcaf91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2eaff9dcaf91ecd ON zapislastnik USING btree (zapis_id);


--
-- TOC entry 2673 (class 1259 OID 20274960)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2674 (class 1259 OID 20274957)
-- Name: idx_344a77a7c3b0d59; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a7c3b0d59 ON uprizoritev USING btree (maticnioder_id);


--
-- TOC entry 2675 (class 1259 OID 20274961)
-- Name: idx_344a77a853a965c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a853a965c ON uprizoritev USING btree (producent_id);


--
-- TOC entry 2676 (class 1259 OID 20274959)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2677 (class 1259 OID 20274958)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2523 (class 1259 OID 20274544)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2524 (class 1259 OID 20274543)
-- Name: idx_37f6541a6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a6beede51 ON trr USING btree (popa_id);


--
-- TOC entry 2499 (class 1259 OID 20274468)
-- Name: idx_466966d769e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_466966d769e8d4 ON oseba USING btree (naslov_id);


--
-- TOC entry 2619 (class 1259 OID 20274775)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2489 (class 1259 OID 20274422)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2490 (class 1259 OID 20274423)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2624 (class 1259 OID 20274795)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2625 (class 1259 OID 20274794)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2626 (class 1259 OID 20274793)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2546 (class 1259 OID 20274608)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2547 (class 1259 OID 20274609)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2469 (class 1259 OID 20274355)
-- Name: idx_6054e804ff55f926; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_6054e804ff55f926 ON stevilcenjekonfig USING btree (stevilcenje_id);


--
-- TOC entry 2581 (class 1259 OID 20274700)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2582 (class 1259 OID 20274698)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2583 (class 1259 OID 20274697)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2584 (class 1259 OID 20274699)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2480 (class 1259 OID 20274396)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2481 (class 1259 OID 20274397)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2610 (class 1259 OID 20274756)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2744 (class 1259 OID 20275232)
-- Name: idx_781826c67e3c61f9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_781826c67e3c61f9 ON datoteka USING btree (owner_id);


--
-- TOC entry 2646 (class 1259 OID 20274847)
-- Name: idx_7ab77b7910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7ab77b7910389148 ON avtorbesedila USING btree (oseba_id);


--
-- TOC entry 2647 (class 1259 OID 20274846)
-- Name: idx_7ab77b79f35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7ab77b79f35157b1 ON avtorbesedila USING btree (besedilo_id);


--
-- TOC entry 2745 (class 1259 OID 20275240)
-- Name: idx_7adc957157ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc957157ed422f ON mapaacl USING btree (mapa_id);


--
-- TOC entry 2746 (class 1259 OID 20275241)
-- Name: idx_7adc9571fa6311ef; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc9571fa6311ef ON mapaacl USING btree (perm_id);


--
-- TOC entry 2596 (class 1259 OID 20274721)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2640 (class 1259 OID 20274839)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2641 (class 1259 OID 20274840)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2694 (class 1259 OID 20275046)
-- Name: idx_8787a0e54ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e54ae1cd1c ON enotaprograma USING btree (gostitelj_id);


--
-- TOC entry 2695 (class 1259 OID 20275045)
-- Name: idx_8787a0e55d0da56c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e55d0da56c ON enotaprograma USING btree (drzavagostovanja_id);


--
-- TOC entry 2696 (class 1259 OID 20275042)
-- Name: idx_8787a0e562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e562b4ffca ON enotaprograma USING btree (uprizoritev_id);


--
-- TOC entry 2697 (class 1259 OID 20275043)
-- Name: idx_8787a0e57222d84b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e57222d84b ON enotaprograma USING btree (tipprogramskeenote_id);


--
-- TOC entry 2698 (class 1259 OID 20275044)
-- Name: idx_8787a0e5771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e5771ec7bd ON enotaprograma USING btree (program_dela_id);


--
-- TOC entry 2512 (class 1259 OID 20274509)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2513 (class 1259 OID 20274508)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2514 (class 1259 OID 20274510)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2613 (class 1259 OID 20274769)
-- Name: idx_952dd21969e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd21969e8d4 ON prostor USING btree (naslov_id);


--
-- TOC entry 2614 (class 1259 OID 20274768)
-- Name: idx_952dd2196beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd2196beede51 ON prostor USING btree (popa_id);


--
-- TOC entry 2704 (class 1259 OID 20275112)
-- Name: idx_97af082e38c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e38c06eb ON produkcijadelitev USING btree (enotaprograma_id);


--
-- TOC entry 2705 (class 1259 OID 20275113)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2687 (class 1259 OID 20274990)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2688 (class 1259 OID 20274991)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2689 (class 1259 OID 20274988)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2690 (class 1259 OID 20274989)
-- Name: idx_a4b7244fa4976613; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fa4976613 ON alternacija USING btree (zaposlitev_id);


--
-- TOC entry 2637 (class 1259 OID 20274830)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2587 (class 1259 OID 20274709)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2588 (class 1259 OID 20274708)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2589 (class 1259 OID 20274706)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2590 (class 1259 OID 20274707)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2683 (class 1259 OID 20274978)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2684 (class 1259 OID 20274977)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2537 (class 1259 OID 20274584)
-- Name: idx_c38372b2be04ea9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c38372b2be04ea9 ON report USING btree (job_id);


--
-- TOC entry 2540 (class 1259 OID 20274598)
-- Name: idx_c395a6181bb9e62c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a6181bb9e62c ON job USING btree (datum);


--
-- TOC entry 2541 (class 1259 OID 20274597)
-- Name: idx_c395a618941027cc; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618941027cc ON job USING btree (casizvedbe);


--
-- TOC entry 2542 (class 1259 OID 20274596)
-- Name: idx_c395a618a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618a76ed395 ON job USING btree (user_id);


--
-- TOC entry 2543 (class 1259 OID 20274599)
-- Name: idx_c395a618aecf5af0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618aecf5af0 ON job USING btree (izveden);


--
-- TOC entry 2552 (class 1259 OID 20274620)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2701 (class 1259 OID 20275103)
-- Name: idx_dba42fe79e3adf2c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_dba42fe79e3adf2c ON postavkacdve USING btree (programdela_id);


--
-- TOC entry 2720 (class 1259 OID 20275150)
-- Name: idx_e7d4cf2638c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e7d4cf2638c06eb ON drugivir USING btree (enotaprograma_id);


--
-- TOC entry 2738 (class 1259 OID 20275216)
-- Name: idx_e9f8ee8257ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee8257ed422f ON mapa_zapis USING btree (mapa_id);


--
-- TOC entry 2739 (class 1259 OID 20275217)
-- Name: idx_e9f8ee82af91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee82af91ecd ON mapa_zapis USING btree (zapis_id);


--
-- TOC entry 2495 (class 1259 OID 20274443)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2496 (class 1259 OID 20274442)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2504 (class 1259 OID 20274475)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2505 (class 1259 OID 20274476)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2568 (class 1259 OID 20274662)
-- Name: idx_f44a386d10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_f44a386d10389148 ON zasedenost USING btree (oseba_id);


--
-- TOC entry 2576 (class 1259 OID 20274690)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2577 (class 1259 OID 20274689)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2578 (class 1259 OID 20274688)
-- Name: idx_fef7d84ba81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84ba81ccef6 ON terminstoritve USING btree (dogodek_id);


--
-- TOC entry 2563 (class 1259 OID 20274648)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2564 (class 1259 OID 20274649)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2565 (class 1259 OID 20274647)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2566 (class 1259 OID 20274651)
-- Name: uniq_11e93b5dbbc7a989; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dbbc7a989 ON dogodek USING btree (dogodek_splosni_id);


--
-- TOC entry 2567 (class 1259 OID 20274650)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2511 (class 1259 OID 20274494)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2529 (class 1259 OID 20274558)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2530 (class 1259 OID 20274560)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2531 (class 1259 OID 20274559)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2532 (class 1259 OID 20274561)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2595 (class 1259 OID 20274715)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2669 (class 1259 OID 20274923)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2678 (class 1259 OID 20274956)
-- Name: uniq_344a77a559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_344a77a559828a3 ON uprizoritev USING btree (sifra);


--
-- TOC entry 2660 (class 1259 OID 20274897)
-- Name: uniq_3f50510d559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d559828a3 ON tipfunkcije USING btree (sifra);


--
-- TOC entry 2661 (class 1259 OID 20274898)
-- Name: uniq_3f50510d55cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d55cca980 ON tipfunkcije USING btree (ime);


--
-- TOC entry 2502 (class 1259 OID 20274466)
-- Name: uniq_466966d7559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7559828a3 ON oseba USING btree (sifra);


--
-- TOC entry 2503 (class 1259 OID 20274467)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2634 (class 1259 OID 20274820)
-- Name: uniq_5216fcb0559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5216fcb0559828a3 ON zvrstuprizoritve USING btree (sifra);


--
-- TOC entry 2475 (class 1259 OID 20274366)
-- Name: uniq_5a434fbc559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5a434fbc559828a3 ON stevilcenje USING btree (sifra);


--
-- TOC entry 2522 (class 1259 OID 20274530)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2472 (class 1259 OID 20274354)
-- Name: uniq_6054e804889a7556; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_6054e804889a7556 ON stevilcenjekonfig USING btree (dok);


--
-- TOC entry 2717 (class 1259 OID 20275143)
-- Name: uniq_7d834df4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_7d834df4559828a3 ON tipprogramskeenote USING btree (sifra);


--
-- TOC entry 2617 (class 1259 OID 20274767)
-- Name: uniq_952dd21937854736; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21937854736 ON prostor USING btree (naziv);


--
-- TOC entry 2618 (class 1259 OID 20274766)
-- Name: uniq_952dd219559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd219559828a3 ON prostor USING btree (sifra);


--
-- TOC entry 2691 (class 1259 OID 20274987)
-- Name: uniq_a4b7244f559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a4b7244f559828a3 ON alternacija USING btree (sifra);


--
-- TOC entry 2519 (class 1259 OID 20274518)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2670 (class 1259 OID 20274936)
-- Name: uniq_cede8e36559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_cede8e36559828a3 ON zvrstsurs USING btree (sifra);


--
-- TOC entry 2728 (class 1259 OID 20275190)
-- Name: uniq_de1c8aa1d55226c7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_de1c8aa1d55226c7 ON vrstazapisa USING btree (oznaka);


--
-- TOC entry 2710 (class 1259 OID 20275120)
-- Name: uniq_e6fc2028559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc2028559828a3 ON produkcijskahisa USING btree (sifra);


--
-- TOC entry 2711 (class 1259 OID 20275121)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2657 (class 1259 OID 20274886)
-- Name: uniq_ec773670ca2e5fcb; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ec773670ca2e5fcb ON besedilo USING btree (stevilka);


--
-- TOC entry 2575 (class 1259 OID 20274677)
-- Name: uniq_ecc8f8c5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ecc8f8c5559828a3 ON sezona USING btree (sifra);


--
-- TOC entry 2488 (class 1259 OID 20274416)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2775 (class 2606 OID 20275372)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2776 (class 2606 OID 20275377)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2780 (class 2606 OID 20275397)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2774 (class 2606 OID 20275367)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2778 (class 2606 OID 20275387)
-- Name: fk_11e93b5dbbc7a989; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dbbc7a989 FOREIGN KEY (dogodek_splosni_id) REFERENCES dogodeksplosni(id);


--
-- TOC entry 2779 (class 2606 OID 20275392)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2777 (class 2606 OID 20275382)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2813 (class 2606 OID 20275562)
-- Name: fk_11ffe6e05c75296c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e05c75296c FOREIGN KEY (vrstastroska_id) REFERENCES vrstastroska(id);


--
-- TOC entry 2814 (class 2606 OID 20275567)
-- Name: fk_11ffe6e062b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e062b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2815 (class 2606 OID 20275572)
-- Name: fk_11ffe6e06beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e06beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2848 (class 2606 OID 20275737)
-- Name: fk_14a5d6d3727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d3727aca70 FOREIGN KEY (parent_id) REFERENCES mapa(id);


--
-- TOC entry 2847 (class 2606 OID 20275732)
-- Name: fk_14a5d6d38a4a6c12; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d38a4a6c12 FOREIGN KEY (lastnik_id) REFERENCES uporabniki(id);


--
-- TOC entry 2760 (class 2606 OID 20275297)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2797 (class 2606 OID 20275482)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2844 (class 2606 OID 20275717)
-- Name: fk_1ed92829253c4123; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829253c4123 FOREIGN KEY (avtor_id) REFERENCES uporabniki(id);


--
-- TOC entry 2843 (class 2606 OID 20275712)
-- Name: fk_1ed9282957ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282957ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2845 (class 2606 OID 20275722)
-- Name: fk_1ed9282987ff3295; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282987ff3295 FOREIGN KEY (zaklenil_id) REFERENCES uporabniki(id);


--
-- TOC entry 2842 (class 2606 OID 20275707)
-- Name: fk_1ed92829a54dbb1f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829a54dbb1f FOREIGN KEY (datoteka_id) REFERENCES datoteka(id);


--
-- TOC entry 2841 (class 2606 OID 20275702)
-- Name: fk_1ed92829ef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829ef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstazapisa(id);


--
-- TOC entry 2796 (class 2606 OID 20275477)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2795 (class 2606 OID 20275472)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2773 (class 2606 OID 20275362)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2805 (class 2606 OID 20275522)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2807 (class 2606 OID 20275532)
-- Name: fk_23aeb9586b361365; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9586b361365 FOREIGN KEY (tipfunkcije_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2806 (class 2606 OID 20275527)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2767 (class 2606 OID 20275332)
-- Name: fk_2942b10710389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b10710389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2766 (class 2606 OID 20275327)
-- Name: fk_2942b1076beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b1076beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2793 (class 2606 OID 20275462)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2839 (class 2606 OID 20275692)
-- Name: fk_2d901816d6bc69d6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT fk_2d901816d6bc69d6 FOREIGN KEY (programrazno_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2816 (class 2606 OID 20275577)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2817 (class 2606 OID 20275582)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2818 (class 2606 OID 20275587)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 2846 (class 2606 OID 20275727)
-- Name: fk_2eaff9dcaf91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT fk_2eaff9dcaf91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id);


--
-- TOC entry 2822 (class 2606 OID 20275607)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2819 (class 2606 OID 20275592)
-- Name: fk_344a77a7c3b0d59; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a7c3b0d59 FOREIGN KEY (maticnioder_id) REFERENCES prostor(id);


--
-- TOC entry 2823 (class 2606 OID 20275612)
-- Name: fk_344a77a853a965c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a853a965c FOREIGN KEY (producent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2821 (class 2606 OID 20275602)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2820 (class 2606 OID 20275597)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2765 (class 2606 OID 20275322)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2764 (class 2606 OID 20275317)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2757 (class 2606 OID 20275282)
-- Name: fk_466966d769e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d769e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2756 (class 2606 OID 20275277)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2801 (class 2606 OID 20275502)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2752 (class 2606 OID 20275257)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2753 (class 2606 OID 20275262)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2804 (class 2606 OID 20275517)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2803 (class 2606 OID 20275512)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2802 (class 2606 OID 20275507)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2770 (class 2606 OID 20275347)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2771 (class 2606 OID 20275352)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2749 (class 2606 OID 20275242)
-- Name: fk_6054e804ff55f926; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT fk_6054e804ff55f926 FOREIGN KEY (stevilcenje_id) REFERENCES stevilcenje(id);


--
-- TOC entry 2788 (class 2606 OID 20275437)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2786 (class 2606 OID 20275427)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2785 (class 2606 OID 20275422)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2787 (class 2606 OID 20275432)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2750 (class 2606 OID 20275247)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2751 (class 2606 OID 20275252)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2798 (class 2606 OID 20275487)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2851 (class 2606 OID 20275752)
-- Name: fk_781826c67e3c61f9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT fk_781826c67e3c61f9 FOREIGN KEY (owner_id) REFERENCES uporabniki(id);


--
-- TOC entry 2812 (class 2606 OID 20275557)
-- Name: fk_7ab77b7910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT fk_7ab77b7910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2811 (class 2606 OID 20275552)
-- Name: fk_7ab77b79f35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT fk_7ab77b79f35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2852 (class 2606 OID 20275757)
-- Name: fk_7adc957157ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc957157ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2853 (class 2606 OID 20275762)
-- Name: fk_7adc9571fa6311ef; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc9571fa6311ef FOREIGN KEY (perm_id) REFERENCES permission(id);


--
-- TOC entry 2794 (class 2606 OID 20275467)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2809 (class 2606 OID 20275542)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2810 (class 2606 OID 20275547)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2834 (class 2606 OID 20275667)
-- Name: fk_8787a0e54ae1cd1c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e54ae1cd1c FOREIGN KEY (gostitelj_id) REFERENCES popa(id);


--
-- TOC entry 2833 (class 2606 OID 20275662)
-- Name: fk_8787a0e55d0da56c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e55d0da56c FOREIGN KEY (drzavagostovanja_id) REFERENCES drza(id);


--
-- TOC entry 2830 (class 2606 OID 20275647)
-- Name: fk_8787a0e562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2831 (class 2606 OID 20275652)
-- Name: fk_8787a0e57222d84b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e57222d84b FOREIGN KEY (tipprogramskeenote_id) REFERENCES tipprogramskeenote(id);


--
-- TOC entry 2832 (class 2606 OID 20275657)
-- Name: fk_8787a0e5771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e5771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2762 (class 2606 OID 20275307)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2761 (class 2606 OID 20275302)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2763 (class 2606 OID 20275312)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2800 (class 2606 OID 20275497)
-- Name: fk_952dd21969e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd21969e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2799 (class 2606 OID 20275492)
-- Name: fk_952dd2196beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd2196beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2836 (class 2606 OID 20275677)
-- Name: fk_97af082e38c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e38c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2837 (class 2606 OID 20275682)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2828 (class 2606 OID 20275637)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2829 (class 2606 OID 20275642)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2826 (class 2606 OID 20275627)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 2827 (class 2606 OID 20275632)
-- Name: fk_a4b7244fa4976613; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fa4976613 FOREIGN KEY (zaposlitev_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2808 (class 2606 OID 20275537)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2792 (class 2606 OID 20275457)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2791 (class 2606 OID 20275452)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2789 (class 2606 OID 20275442)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2790 (class 2606 OID 20275447)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2825 (class 2606 OID 20275622)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2824 (class 2606 OID 20275617)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2768 (class 2606 OID 20275337)
-- Name: fk_c38372b2be04ea9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY report
    ADD CONSTRAINT fk_c38372b2be04ea9 FOREIGN KEY (job_id) REFERENCES job(id);


--
-- TOC entry 2769 (class 2606 OID 20275342)
-- Name: fk_c395a618a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY job
    ADD CONSTRAINT fk_c395a618a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2772 (class 2606 OID 20275357)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2835 (class 2606 OID 20275672)
-- Name: fk_dba42fe79e3adf2c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkacdve
    ADD CONSTRAINT fk_dba42fe79e3adf2c FOREIGN KEY (programdela_id) REFERENCES programdela(id);


--
-- TOC entry 2838 (class 2606 OID 20275687)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2840 (class 2606 OID 20275697)
-- Name: fk_e7d4cf2638c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT fk_e7d4cf2638c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2849 (class 2606 OID 20275742)
-- Name: fk_e9f8ee8257ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee8257ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id) ON DELETE CASCADE;


--
-- TOC entry 2850 (class 2606 OID 20275747)
-- Name: fk_e9f8ee82af91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee82af91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id) ON DELETE CASCADE;


--
-- TOC entry 2755 (class 2606 OID 20275272)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2754 (class 2606 OID 20275267)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2758 (class 2606 OID 20275287)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2759 (class 2606 OID 20275292)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2781 (class 2606 OID 20275402)
-- Name: fk_f44a386d10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT fk_f44a386d10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2784 (class 2606 OID 20275417)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2783 (class 2606 OID 20275412)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2782 (class 2606 OID 20275407)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- Completed on 2015-09-21 14:44:11 CEST

--
-- PostgreSQL database dump complete
--

