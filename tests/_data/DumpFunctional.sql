--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.9
-- Dumped by pg_dump version 9.3.9
-- Started on 2015-09-21 09:00:56 CEST

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

SET search_path = public, pg_catalog;

SET default_with_oids = false;

--
-- TOC entry 181 (class 1259 OID 20212197)
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
-- TOC entry 229 (class 1259 OID 20212751)
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
-- TOC entry 228 (class 1259 OID 20212734)
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
-- TOC entry 219 (class 1259 OID 20212614)
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
-- TOC entry 222 (class 1259 OID 20212644)
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
-- TOC entry 243 (class 1259 OID 20212990)
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
-- TOC entry 197 (class 1259 OID 20212404)
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
-- TOC entry 199 (class 1259 OID 20212436)
-- Name: dogodeksplosni; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodeksplosni (
    id uuid NOT NULL
);


--
-- TOC entry 237 (class 1259 OID 20212916)
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
-- TOC entry 190 (class 1259 OID 20212318)
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
-- TOC entry 230 (class 1259 OID 20212764)
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
-- TOC entry 215 (class 1259 OID 20212569)
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
-- TOC entry 195 (class 1259 OID 20212383)
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
-- TOC entry 193 (class 1259 OID 20212358)
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
-- TOC entry 3042 (class 0 OID 0)
-- Dependencies: 193
-- Name: COLUMN job.data; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN job.data IS '(DC2Type:object)';


--
-- TOC entry 191 (class 1259 OID 20212335)
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
-- TOC entry 204 (class 1259 OID 20212483)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 241 (class 1259 OID 20212971)
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
-- TOC entry 242 (class 1259 OID 20212983)
-- Name: mapa_zapis; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE mapa_zapis (
    mapa_id uuid NOT NULL,
    zapis_id uuid NOT NULL
);


--
-- TOC entry 244 (class 1259 OID 20213005)
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
-- TOC entry 208 (class 1259 OID 20212508)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 188 (class 1259 OID 20212292)
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
-- TOC entry 182 (class 1259 OID 20212206)
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
-- TOC entry 183 (class 1259 OID 20212217)
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
-- TOC entry 178 (class 1259 OID 20212171)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 180 (class 1259 OID 20212190)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 209 (class 1259 OID 20212515)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 213 (class 1259 OID 20212549)
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
-- TOC entry 225 (class 1259 OID 20212683)
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
-- TOC entry 185 (class 1259 OID 20212250)
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
-- TOC entry 187 (class 1259 OID 20212284)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 232 (class 1259 OID 20212862)
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
-- TOC entry 205 (class 1259 OID 20212489)
-- Name: postavkaracuna; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE postavkaracuna (
    id uuid NOT NULL,
    racun_id uuid
);


--
-- TOC entry 186 (class 1259 OID 20212269)
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
-- TOC entry 194 (class 1259 OID 20212373)
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
-- TOC entry 207 (class 1259 OID 20212501)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 233 (class 1259 OID 20212876)
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
-- TOC entry 234 (class 1259 OID 20212886)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    sifra character varying(4) NOT NULL,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 231 (class 1259 OID 20212819)
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
-- TOC entry 235 (class 1259 OID 20212894)
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
-- TOC entry 211 (class 1259 OID 20212530)
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
-- TOC entry 203 (class 1259 OID 20212474)
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
-- TOC entry 202 (class 1259 OID 20212464)
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
-- TOC entry 224 (class 1259 OID 20212672)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying,
    status character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 218 (class 1259 OID 20212604)
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
-- TOC entry 192 (class 1259 OID 20212347)
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
-- TOC entry 175 (class 1259 OID 20212142)
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
-- TOC entry 174 (class 1259 OID 20212140)
-- Name: revizije_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE revizije_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3043 (class 0 OID 0)
-- Dependencies: 174
-- Name: revizije_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE revizije_id_seq OWNED BY revizije.id;


--
-- TOC entry 212 (class 1259 OID 20212543)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 179 (class 1259 OID 20212180)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 177 (class 1259 OID 20212164)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 214 (class 1259 OID 20212557)
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
-- TOC entry 206 (class 1259 OID 20212495)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 200 (class 1259 OID 20212441)
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
-- TOC entry 173 (class 1259 OID 20212129)
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
-- TOC entry 172 (class 1259 OID 20212121)
-- Name: stevilcenjekonfig; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjekonfig (
    id uuid NOT NULL,
    stevilcenje_id uuid,
    dok character varying(100) DEFAULT NULL::character varying
);


--
-- TOC entry 171 (class 1259 OID 20212116)
-- Name: stevilcenjestanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjestanje (
    id uuid NOT NULL,
    objid uuid NOT NULL,
    leto integer NOT NULL,
    stevilka integer
);


--
-- TOC entry 220 (class 1259 OID 20212621)
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
-- TOC entry 184 (class 1259 OID 20212242)
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
-- TOC entry 201 (class 1259 OID 20212451)
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
-- TOC entry 223 (class 1259 OID 20212660)
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
-- TOC entry 236 (class 1259 OID 20212904)
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
-- TOC entry 189 (class 1259 OID 20212304)
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
-- TOC entry 176 (class 1259 OID 20212151)
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
-- TOC entry 227 (class 1259 OID 20212709)
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
-- TOC entry 196 (class 1259 OID 20212394)
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
-- TOC entry 210 (class 1259 OID 20212522)
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
-- TOC entry 221 (class 1259 OID 20212635)
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
-- TOC entry 239 (class 1259 OID 20212951)
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
-- TOC entry 238 (class 1259 OID 20212923)
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
-- TOC entry 240 (class 1259 OID 20212963)
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
-- TOC entry 217 (class 1259 OID 20212594)
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
-- TOC entry 198 (class 1259 OID 20212430)
-- Name: zasedenost; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zasedenost (
    id uuid NOT NULL,
    oseba_id uuid
);


--
-- TOC entry 226 (class 1259 OID 20212699)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 216 (class 1259 OID 20212584)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 2201 (class 2604 OID 20212145)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 2971 (class 0 OID 20212197)
-- Dependencies: 181
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
\.


--
-- TOC entry 3019 (class 0 OID 20212751)
-- Dependencies: 229
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, zaposlitev_id, oseba_id, pogodba_id, sifra, zaposlen, zacetek, konec, opomba, sort, privzeti, aktivna, imapogodbo, pomembna) FROM stdin;
000c0000-55ff-ab26-dc84-4c820f6e313a	000d0000-55ff-ab26-b629-83ff3a9fba9f	\N	00090000-55ff-ab26-eee9-fe2e3153c913	000b0000-55ff-ab26-cefd-7e6dda8d52b1	0001	f	\N	\N	\N	3	t	\N	t	t
000c0000-55ff-ab26-bcdd-39e16b66815e	000d0000-55ff-ab26-6a13-f2bba9e276fb	00100000-55ff-ab26-f5be-cbe2807ffd7b	00090000-55ff-ab26-34e2-6c2f70224f6a	\N	0002	t	2016-01-01	\N	\N	8	t	\N	f	f
000c0000-55ff-ab26-2af1-6c0bb690d03f	000d0000-55ff-ab26-6e17-3d9b19cb9f39	00100000-55ff-ab26-af9c-ccdf583dd928	00090000-55ff-ab26-f6e1-2efdbbba2580	\N	0003	t	\N	2015-09-21	\N	2	t	\N	f	f
000c0000-55ff-ab26-1a44-ea084d9aa83e	000d0000-55ff-ab26-b2cd-34a465a17c9c	\N	00090000-55ff-ab26-25fd-f372d5595bc9	\N	0004	f	2016-01-01	2016-01-01	\N	26	t	\N	f	f
000c0000-55ff-ab26-04b7-89f7c7dea6a9	000d0000-55ff-ab26-003c-2cd4d269dee4	\N	00090000-55ff-ab26-55fd-a2da0812b19b	\N	0005	f	2016-01-01	2016-01-01	\N	7	t	\N	f	f
000c0000-55ff-ab26-0780-2a3f036b334e	000d0000-55ff-ab26-e48b-55461d006fdc	\N	00090000-55ff-ab26-2432-918370df2ef1	000b0000-55ff-ab26-905a-cfc916ce1ad4	0006	f	2016-01-01	2016-01-01	\N	1	t	\N	t	t
000c0000-55ff-ab26-035e-063c482a373c	000d0000-55ff-ab26-06ee-4aea1a1d8cbb	00100000-55ff-ab26-a110-d54797223c6f	00090000-55ff-ab26-9dcb-c1459df549b7	\N	0007	t	2016-01-01	2016-01-01	\N	14	t	\N	f	t
000c0000-55ff-ab26-8eed-f0bba9b8a53c	000d0000-55ff-ab26-a378-b6c385c6e888	\N	00090000-55ff-ab26-db68-3b9cdebb37ba	000b0000-55ff-ab26-b46d-249c6009d9c1	0008	f	2016-01-01	2016-01-01	\N	12	t	\N	t	t
000c0000-55ff-ab26-f3e8-a3a4303ce12c	000d0000-55ff-ab26-06ee-4aea1a1d8cbb	00100000-55ff-ab26-1652-7b98c48811b4	00090000-55ff-ab26-6c95-eba6b5b7cd4a	\N	0009	t	2017-01-01	2017-01-01	\N	15	t	\N	f	t
000c0000-55ff-ab26-ae66-cf531ae324a6	000d0000-55ff-ab26-06ee-4aea1a1d8cbb	00100000-55ff-ab26-c1c4-b1fb37e60a4c	00090000-55ff-ab26-827d-1fb002dc2e82	\N	0010	t	\N	2015-09-21	\N	16	f	\N	f	t
000c0000-55ff-ab26-bc92-f4bdee8c9daa	000d0000-55ff-ab26-06ee-4aea1a1d8cbb	00100000-55ff-ab26-915e-7bed3e21c4c3	00090000-55ff-ab26-4f85-0638c2c3a300	\N	0011	t	2017-01-01	\N	\N	17	f	\N	f	t
000c0000-55ff-ab26-5df8-c9cd84bb13d1	000d0000-55ff-ab26-85e9-3162bb29788d	\N	00090000-55ff-ab26-34e2-6c2f70224f6a	000b0000-55ff-ab26-6f41-53382ee5f253	0012	f	\N	\N	\N	2	t	\N	t	t
\.


--
-- TOC entry 3018 (class 0 OID 20212734)
-- Dependencies: 228
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 3009 (class 0 OID 20212614)
-- Dependencies: 219
-- Data for Name: avtorbesedila; Type: TABLE DATA; Schema: public; Owner: -
--

COPY avtorbesedila (id, besedilo_id, oseba_id, tipavtorja, zaporedna, alivnaslovu) FROM stdin;
003d0000-55ff-ab26-1d3e-611f67d1fbe2	00160000-55ff-ab26-1b32-7bd99494e988	00090000-55ff-ab26-5a40-4e16ac607708	Avtor originala	10	t
003d0000-55ff-ab26-d7fd-20d71c2d00b8	00160000-55ff-ab26-1b32-7bd99494e988	00090000-55ff-ab26-5bf6-1309e09cf23d	Predelava	14	t
003d0000-55ff-ab26-6777-02e850414319	00160000-55ff-ab26-42c3-0d541966a685	00090000-55ff-ab26-8b80-df4e9f933d51	Avtor originala	11	t
003d0000-55ff-ab26-0ca7-7c7ed92e5d7a	00160000-55ff-ab26-d575-69bec5fe2538	00090000-55ff-ab26-8a19-32279a942b1e	Avtor originala	12	t
003d0000-55ff-ab26-f5be-f76065f6a349	00160000-55ff-ab26-1b32-7bd99494e988	00090000-55ff-ab26-c71b-c5683ac21ac6	Predelava	18	f
\.


--
-- TOC entry 3012 (class 0 OID 20212644)
-- Dependencies: 222
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, stevilka, naslov, podnaslov, jezik, naslovizvirnika, internacionalninaslov, datumprejema, moskevloge, zenskevloge, povzetekvsebine, letoizida, krajizida, zaloznik) FROM stdin;
00160000-55ff-ab26-1b32-7bd99494e988	0001	Sen kresne noči		slovenščina	A Midsummer Night's Dream	\N	2015-04-26	5	5	Nastopajo Titanija, Hipolita, Oberon, ...	\N	\N	\N
00160000-55ff-ab26-42c3-0d541966a685	0002	Bratje Karamazovi		slovenščina	Bratja Karamazjovji	\N	2015-12-04	4	1	Svetovna uspešnica	\N	\N	\N
00160000-55ff-ab26-d575-69bec5fe2538	0003	Smoletov Vrt		slovenščina		\N	2015-05-26	2	8		\N	\N	\N
\.


--
-- TOC entry 3033 (class 0 OID 20212990)
-- Dependencies: 243
-- Data for Name: datoteka; Type: TABLE DATA; Schema: public; Owner: -
--

COPY datoteka (id, owner_id, filename, transfers, size, format, hash, createdat, uploadedat, upor, datknj) FROM stdin;
\.


--
-- TOC entry 2987 (class 0 OID 20212404)
-- Dependencies: 197
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_splosni_id, prostor_id, sezona_id, planiranzacetek, allday, zacetek, konec, status, razred, termin, title) FROM stdin;
00180000-55ff-ab26-4a1a-40edf764456a	\N	\N	00200000-55ff-ab26-0474-0dcde37a0e03	\N	\N	\N	\N	2015-06-26 10:00:00	f	2015-06-26 10:00:00	2015-06-26 12:00:00	200s	200s		dogodek 1
00180000-55ff-ab26-d0af-f571ba92b298	\N	\N	00200000-55ff-ab26-4194-58c9b15cca2b	\N	\N	\N	\N	2015-06-27 10:00:00	f	2015-06-27 10:00:00	2015-06-27 12:00:00	300s	200s		dogodek 2
00180000-55ff-ab26-e7bf-716f16de052d	\N	\N	00200000-55ff-ab26-6014-c7b4db844ef1	\N	\N	\N	\N	2015-08-01 20:00:00	f	2015-08-01 20:00:00	2015-08-01 23:00:00	400s	200s		dogodek 3
00180000-55ff-ab26-1b2d-91934e788ecf	\N	\N	00200000-55ff-ab26-7b74-ea0f608ff415	\N	\N	\N	\N	2015-08-01 20:00:00	f	2015-08-01 20:00:00	2015-08-01 23:00:00	100s	200s		dogodek 4
00180000-55ff-ab26-9e43-ec7a87a9cf4d	\N	\N	00200000-55ff-ab26-a660-82c0b83401de	\N	\N	\N	\N	2015-08-01 20:00:00	f	2015-08-01 20:00:00	2015-08-01 23:00:00	500s	200s		dogodek 5
\.


--
-- TOC entry 2989 (class 0 OID 20212436)
-- Dependencies: 199
-- Data for Name: dogodeksplosni; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodeksplosni (id) FROM stdin;
\.


--
-- TOC entry 3027 (class 0 OID 20212916)
-- Dependencies: 237
-- Data for Name: drugivir; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drugivir (id, znesek, opis, mednarodni, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 2980 (class 0 OID 20212318)
-- Dependencies: 190
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-55ff-ab24-dae2-52d17cd5ac4a	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-55ff-ab24-a2e2-a6c3eb59061f	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-55ff-ab24-a5b9-ca43a0faa1ba	AL	ALB	008	Albania 	Albanija	\N
00040000-55ff-ab24-a27f-4ae1ed760efe	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-55ff-ab24-97b3-b369a57a899b	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-55ff-ab24-e5f1-1eb0c496f93c	AD	AND	020	Andorra 	Andora	\N
00040000-55ff-ab24-1784-97de23d9ca57	AO	AGO	024	Angola 	Angola	\N
00040000-55ff-ab24-bfd7-2a4bacdac4a8	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-55ff-ab24-0cfc-fbae100b464f	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-55ff-ab24-b68b-a85fa2385c15	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-55ff-ab24-5de1-2003bf14aad7	AR	ARG	032	Argentina 	Argenitna	\N
00040000-55ff-ab24-ab99-d7b029eae3d7	AM	ARM	051	Armenia 	Armenija	\N
00040000-55ff-ab24-9a72-23b2467a4d20	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-55ff-ab24-d933-c75fea91f15b	AU	AUS	036	Australia 	Avstralija	\N
00040000-55ff-ab24-d364-fcc43b771b6d	AT	AUT	040	Austria 	Avstrija	\N
00040000-55ff-ab24-4dfc-ab8fbecc2bca	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-55ff-ab24-a5be-b2e1c7b50f30	BS	BHS	044	Bahamas 	Bahami	\N
00040000-55ff-ab24-c04d-03a78a128025	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-55ff-ab24-b960-8f6e4621cc86	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-55ff-ab24-d9a1-d2a6d0903309	BB	BRB	052	Barbados 	Barbados	\N
00040000-55ff-ab24-4ccb-157254a903f5	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-55ff-ab24-9b7c-cedd118b718a	BE	BEL	056	Belgium 	Belgija	\N
00040000-55ff-ab24-6374-3003b99e7ceb	BZ	BLZ	084	Belize 	Belize	\N
00040000-55ff-ab24-e7bd-208fe2508fd6	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-55ff-ab24-a2ff-9f8394775a67	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-55ff-ab24-e4f3-016a3062ce02	BT	BTN	064	Bhutan 	Butan	\N
00040000-55ff-ab24-fbfa-32b116d322e5	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-55ff-ab24-03ed-67ec6df8dc35	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-55ff-ab24-1b02-65256f1c993d	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-55ff-ab24-a4fc-bd2407fed22c	BW	BWA	072	Botswana 	Bocvana	\N
00040000-55ff-ab24-b9b4-2f9878e571d5	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-55ff-ab24-c0cb-fd74c693409b	BR	BRA	076	Brazil 	Brazilija	\N
00040000-55ff-ab24-d9b3-268795066848	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-55ff-ab24-bf74-3cef1233f638	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-55ff-ab24-1dbb-12143a8e2806	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-55ff-ab24-1dc1-6429aaf36190	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-55ff-ab24-03a2-a55525519974	BI	BDI	108	Burundi 	Burundi 	\N
00040000-55ff-ab24-fc72-696ea50c036d	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-55ff-ab24-dc88-42a4c5a7c6e8	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-55ff-ab24-c8c1-924dec9c2fdd	CA	CAN	124	Canada 	Kanada	\N
00040000-55ff-ab24-2d1b-64fc518604bc	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-55ff-ab24-44d6-ac604c924107	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-55ff-ab24-f4cd-9a6b6fe1bf06	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-55ff-ab24-f29a-1229d3031a7e	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-55ff-ab24-1371-4a1135ee2331	CL	CHL	152	Chile 	Čile	\N
00040000-55ff-ab24-ab90-1583eb180a48	CN	CHN	156	China 	Kitajska	\N
00040000-55ff-ab24-ff04-5cfaa5dd02d8	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-55ff-ab24-fb99-9de2404b4511	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-55ff-ab24-43e4-5e98a02463f8	CO	COL	170	Colombia 	Kolumbija	\N
00040000-55ff-ab24-7800-8b9fa9aac7c3	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-55ff-ab24-20f9-6938be9ac785	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-55ff-ab24-938f-d27fd847e6d6	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-55ff-ab24-94a6-ba3a90595d57	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-55ff-ab24-5c8c-c530065f0493	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-55ff-ab24-9af6-24d0a71b6a64	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-55ff-ab24-6928-d0860182b4c2	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-55ff-ab24-6209-811edfaae9b2	CU	CUB	192	Cuba 	Kuba	\N
00040000-55ff-ab24-407f-6bd116eda061	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-55ff-ab24-7253-eafa9b7ab2dd	CY	CYP	196	Cyprus 	Ciper	\N
00040000-55ff-ab24-a7d9-ac4126be86b9	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-55ff-ab24-4f0e-fa57a40de3bf	DK	DNK	208	Denmark 	Danska	\N
00040000-55ff-ab24-ac0d-9eec91c6e261	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-55ff-ab24-89a2-e2e376fac2ab	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-55ff-ab24-e4d1-4a402b8ef674	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-55ff-ab24-5fe8-56e0c33b3a3d	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-55ff-ab24-6b92-54abf197bc72	EG	EGY	818	Egypt 	Egipt	\N
00040000-55ff-ab24-441d-d4c962c89ecb	SV	SLV	222	El Salvador 	Salvador	\N
00040000-55ff-ab24-1da6-09d39642fd69	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-55ff-ab24-2272-4dd810772731	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-55ff-ab24-a432-8237c69f3781	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-55ff-ab24-97c8-dc80a33e3cb8	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-55ff-ab24-5fa7-c99c6be9f388	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-55ff-ab24-bdd8-cfeaff69f519	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-55ff-ab24-9f10-137f90e29608	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-55ff-ab24-9cdf-beca7c80a25f	FI	FIN	246	Finland 	Finska	\N
00040000-55ff-ab24-1d89-0057c47962ad	FR	FRA	250	France 	Francija	\N
00040000-55ff-ab24-1792-71ef4d0bffef	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-55ff-ab24-7d08-1dce487547f1	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-55ff-ab24-fee1-15b1b3deffc9	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-55ff-ab24-57f7-6518c2e49166	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-55ff-ab24-7ab7-9449ee40c485	GA	GAB	266	Gabon 	Gabon	\N
00040000-55ff-ab24-ba7d-6548561c4231	GM	GMB	270	Gambia 	Gambija	\N
00040000-55ff-ab24-1c49-7eaf21dd3562	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-55ff-ab24-f816-ce694708ad38	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-55ff-ab24-70ea-02eb26926448	GH	GHA	288	Ghana 	Gana	\N
00040000-55ff-ab24-af14-3bc2a0856db3	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-55ff-ab24-c4ab-bc22143c2e1d	GR	GRC	300	Greece 	Grčija	\N
00040000-55ff-ab24-71c4-faa7ec919ad5	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-55ff-ab24-3d54-3d507e08c01e	GD	GRD	308	Grenada 	Grenada	\N
00040000-55ff-ab24-7ed6-ae2ff028f1fe	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-55ff-ab24-a35c-84d2cbb8225e	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-55ff-ab24-e2fe-ac0103b36296	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-55ff-ab24-c268-cf644bfb42b2	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-55ff-ab24-faa2-9904a01b9bf1	GN	GIN	324	Guinea 	Gvineja	\N
00040000-55ff-ab24-f815-f504d51d2fed	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-55ff-ab24-7c06-18b5cc9b722e	GY	GUY	328	Guyana 	Gvajana	\N
00040000-55ff-ab24-9c3c-98f990c877f5	HT	HTI	332	Haiti 	Haiti	\N
00040000-55ff-ab24-4038-843b3bb62420	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-55ff-ab24-6502-8f9f96fd43da	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-55ff-ab24-732b-dd856abf174a	HN	HND	340	Honduras 	Honduras	\N
00040000-55ff-ab24-efe3-5fe6a6c76a24	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-55ff-ab24-28f0-8a07e1d7f598	HU	HUN	348	Hungary 	Madžarska	\N
00040000-55ff-ab24-5962-aa06e8d4d0b1	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-55ff-ab24-3ae3-d6a39beba3d1	IN	IND	356	India 	Indija	\N
00040000-55ff-ab24-1b27-40c9597d3085	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-55ff-ab24-e323-ad14eb7b4048	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-55ff-ab24-ac73-2fc15c656d16	IQ	IRQ	368	Iraq 	Irak	\N
00040000-55ff-ab24-e5f9-a1f9aa446ea3	IE	IRL	372	Ireland 	Irska	\N
00040000-55ff-ab24-80c4-f719de6c3475	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-55ff-ab24-afc8-13e7cc3f67e3	IL	ISR	376	Israel 	Izrael	\N
00040000-55ff-ab24-b223-2d9efdad7aa7	IT	ITA	380	Italy 	Italija	\N
00040000-55ff-ab24-8750-43e5c7393f3a	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-55ff-ab24-020f-b69c27fcafd0	JP	JPN	392	Japan 	Japonska	\N
00040000-55ff-ab24-2f7e-66a3c35a69aa	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-55ff-ab24-120d-b3d73bb6b3fc	JO	JOR	400	Jordan 	Jordanija	\N
00040000-55ff-ab24-f53f-c9c26d56ddc1	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-55ff-ab24-6348-b10d7c3287b9	KE	KEN	404	Kenya 	Kenija	\N
00040000-55ff-ab24-7907-d084610e6d52	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-55ff-ab24-02b0-8bafc1e89ca6	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-55ff-ab24-3f58-99dae4e1ed2e	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-55ff-ab24-2613-5d9aeca0ee02	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-55ff-ab24-4be8-e5fa0f1b092d	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-55ff-ab24-a00a-d18f0ee3a01b	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-55ff-ab24-8607-15374a47a0c8	LV	LVA	428	Latvia 	Latvija	\N
00040000-55ff-ab24-c00d-64384d235d75	LB	LBN	422	Lebanon 	Libanon	\N
00040000-55ff-ab24-6214-a3587040079f	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-55ff-ab24-d068-a6d03a748f30	LR	LBR	430	Liberia 	Liberija	\N
00040000-55ff-ab24-08b9-1924634a0b18	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-55ff-ab24-4cfe-e3cbe419fd9b	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-55ff-ab24-140a-8bd8dbba2f6f	LT	LTU	440	Lithuania 	Litva	\N
00040000-55ff-ab24-2a0a-23e889470849	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-55ff-ab24-0fcf-e2d30e77f08c	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-55ff-ab24-b89b-082f1ab82ca9	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-55ff-ab24-5574-a7700cde980c	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-55ff-ab24-a8e8-9a15241728fe	MW	MWI	454	Malawi 	Malavi	\N
00040000-55ff-ab24-2456-2773701ecb55	MY	MYS	458	Malaysia 	Malezija	\N
00040000-55ff-ab24-0086-f7f4b0825268	MV	MDV	462	Maldives 	Maldivi	\N
00040000-55ff-ab24-8fad-699a569f1eaf	ML	MLI	466	Mali 	Mali	\N
00040000-55ff-ab24-c94e-a25bebd4d0c6	MT	MLT	470	Malta 	Malta	\N
00040000-55ff-ab24-0019-1e96a1c7a072	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-55ff-ab24-a4c9-0621c0115a53	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-55ff-ab24-8cc3-71664b127971	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-55ff-ab24-f814-a1a3bcca989d	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-55ff-ab24-75a0-47a82a977389	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-55ff-ab24-aac2-4258defead8e	MX	MEX	484	Mexico 	Mehika	\N
00040000-55ff-ab24-60bb-f95f3283b628	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-55ff-ab24-e09c-0c9d1f4fc598	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-55ff-ab24-7e90-61e2d7904eb1	MC	MCO	492	Monaco 	Monako	\N
00040000-55ff-ab24-bdc2-f5ee7a425795	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-55ff-ab24-5700-9c8f3f031dd5	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-55ff-ab24-2105-4f174611f897	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-55ff-ab24-21dc-bbec8919b7a9	MA	MAR	504	Morocco 	Maroko	\N
00040000-55ff-ab24-ee90-35fa7ee3608d	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-55ff-ab24-52ef-bac5bee09c6e	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-55ff-ab24-b1ad-b15fadd14c2d	NA	NAM	516	Namibia 	Namibija	\N
00040000-55ff-ab24-1692-7e87c751bbd1	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-55ff-ab24-430e-dae2d8bcc8ce	NP	NPL	524	Nepal 	Nepal	\N
00040000-55ff-ab24-15fd-9a5fb7ec4e84	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-55ff-ab24-29d4-fd3b9cd0b83c	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-55ff-ab24-adfa-530fcebfd403	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-55ff-ab24-c0e3-9278b79f5dd5	NE	NER	562	Niger 	Niger 	\N
00040000-55ff-ab24-f9b1-d68d31dd6085	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-55ff-ab24-bcce-6384c826a1af	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-55ff-ab24-0401-24ecebbe3ccb	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-55ff-ab24-66dd-74e2a2140cc0	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-55ff-ab24-c7c4-bc74924e3f43	NO	NOR	578	Norway 	Norveška	\N
00040000-55ff-ab24-0783-7f1f90de509e	OM	OMN	512	Oman 	Oman	\N
00040000-55ff-ab24-7631-aef817970408	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-55ff-ab24-7a08-41b7ae25ece6	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-55ff-ab24-393b-c59a08ffd754	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-55ff-ab24-0fe3-d33ca54d6bac	PA	PAN	591	Panama 	Panama	\N
00040000-55ff-ab24-96bb-58bd24842c10	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-55ff-ab24-1d3b-4befa248e0df	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-55ff-ab24-56cb-39da9e7d7519	PE	PER	604	Peru 	Peru	\N
00040000-55ff-ab24-8f1b-05a5a7b09d03	PH	PHL	608	Philippines 	Filipini	\N
00040000-55ff-ab24-9ca7-205135701052	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-55ff-ab24-9c25-c7cfed97fa67	PL	POL	616	Poland 	Poljska	\N
00040000-55ff-ab24-8871-d3259918cf42	PT	PRT	620	Portugal 	Portugalska	\N
00040000-55ff-ab24-4be8-a14c11477074	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-55ff-ab24-3190-008e5261ff76	QA	QAT	634	Qatar 	Katar	\N
00040000-55ff-ab24-cfb9-82716c315afe	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-55ff-ab24-8b24-1d89f25b349e	RO	ROU	642	Romania 	Romunija	\N
00040000-55ff-ab24-7962-d16b8c3984e1	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-55ff-ab24-7037-aa6b3c99e05e	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-55ff-ab24-721b-da482b3fab42	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-55ff-ab24-1c88-9712d8e74097	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-55ff-ab24-198c-9bbb5e892af0	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-55ff-ab24-df7c-6cefebab094a	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-55ff-ab24-07be-72676f45e210	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-55ff-ab24-d91a-40ed1a0706ef	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-55ff-ab24-07ce-320a9f477a2a	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-55ff-ab24-8012-d6ce7787a70e	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-55ff-ab24-9129-6487b8a68bf6	SM	SMR	674	San Marino 	San Marino	\N
00040000-55ff-ab24-2775-e3d5d9f2ffec	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-55ff-ab24-0925-272ad7c5a7c8	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-55ff-ab24-e89e-617045e8efd1	SN	SEN	686	Senegal 	Senegal	\N
00040000-55ff-ab24-9565-235becd4b2de	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-55ff-ab24-974d-38c8845d2f8b	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-55ff-ab24-f787-0eb2b67b68c0	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-55ff-ab24-c398-ee85569d60d7	SG	SGP	702	Singapore 	Singapur	\N
00040000-55ff-ab24-5fd1-a67b42470655	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-55ff-ab24-0bda-3ceb8a5bf3e1	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-55ff-ab24-d904-ef48d79bc0bd	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-55ff-ab24-b571-6af0dc6fabd9	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-55ff-ab24-4c3d-059ec1ba420e	SO	SOM	706	Somalia 	Somalija	\N
00040000-55ff-ab24-77b4-e7d4b51ddfa7	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-55ff-ab24-44e8-ba5ce2ac9d4c	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-55ff-ab24-32e6-5d37a6c045b1	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-55ff-ab24-1bbd-f68dc155027c	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-55ff-ab24-7e3a-b1e32042cc76	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-55ff-ab24-da07-f8adacf7e6b9	SD	SDN	729	Sudan 	Sudan	\N
00040000-55ff-ab24-f2fd-f5064c001d15	SR	SUR	740	Suriname 	Surinam	\N
00040000-55ff-ab24-1039-36861a3ebd4c	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-55ff-ab24-b03b-2ddda18d4519	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-55ff-ab24-f2fa-922b37fa7693	SE	SWE	752	Sweden 	Švedska	\N
00040000-55ff-ab24-5707-0d225963fa81	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-55ff-ab24-2d34-080f8e708c30	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-55ff-ab24-59f4-42cdee8bdec8	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-55ff-ab24-7f5c-2503d8978bf8	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-55ff-ab24-67d7-015351be8d47	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-55ff-ab24-7b18-f7da74a0cfde	TH	THA	764	Thailand 	Tajska	\N
00040000-55ff-ab24-de15-f66114e5c17e	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-55ff-ab24-5036-8a26fa8e385a	TG	TGO	768	Togo 	Togo	\N
00040000-55ff-ab24-814c-de5389e25fd7	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-55ff-ab24-0f7b-0789191c88e9	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-55ff-ab24-bed2-dad2c831371f	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-55ff-ab24-2fce-f0a92a26df2a	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-55ff-ab24-9afa-04044d32c822	TR	TUR	792	Turkey 	Turčija	\N
00040000-55ff-ab24-5a70-dfa2d2a1710a	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-55ff-ab24-749c-fa31a8dded57	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-55ff-ab24-eb50-24d8953dbd02	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-55ff-ab24-4bc9-2a917474d607	UG	UGA	800	Uganda 	Uganda	\N
00040000-55ff-ab24-9ad9-c451fc13a94a	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-55ff-ab24-ee1c-68f8dc47771d	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-55ff-ab24-4edb-2917ad28444f	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-55ff-ab24-5bef-25d26205411e	US	USA	840	United States 	Združene države Amerike	\N
00040000-55ff-ab24-ad28-dceb90a5fd96	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-55ff-ab24-dad6-ffafe17b34f2	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-55ff-ab24-5705-7136e244da48	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-55ff-ab24-54b7-ca88a9d380d0	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-55ff-ab24-ca04-bb5fef2f5f95	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-55ff-ab24-38b9-7556ed1d0b5e	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-55ff-ab24-450d-2b5502e6d439	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-55ff-ab24-9582-af1df3912b15	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-55ff-ab24-177a-1ca479054618	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-55ff-ab24-5484-f2153145d88f	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-55ff-ab24-63c7-db356f868984	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-55ff-ab24-b6cc-44ae9f0dd8ca	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-55ff-ab24-9718-c79fd2c37901	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 3020 (class 0 OID 20212764)
-- Dependencies: 230
-- Data for Name: enotaprograma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY enotaprograma (id, uprizoritev_id, program_dela_id, gostitelj_id, celotnavrednost, nasdelez, celotnavrednostmat, celotnavrednostgostovsz, zaproseno, lastnasredstva, avtorskihonorarji, avtorskihonorarjisamoz, tantieme, avtorskepravice, materialni, imakoprodukcije, vlozekgostitelja, drugijavni, stzaposlenih, stzaposumet, stzaposdrug, sthonorarnih, sthonorarnihigr, sthonorarnihigrtujjz, sthonorarnihigrsamoz, obiskdoma, obiskkopr, obiskgost, obiskzamejo, obiskint, obiskkoprint, ponovidoma, ponovikopr, ponovizamejo, ponovigost, ponovikoprint, ponoviint, naziv, kpe, sort, tipprogramskeenote_id, tip, prikoproducentu, strosekodkpred, stroskiostali, krajgostovanja, ustanova, datumgostovanja, transportnistroski, dnevprvzad, drzavagostovanja_id, stpe, zvrst, stpredstav, stokroglihmiz, stpredstavitev, stdelavnic, stdrugidogodki, stprodukcij, caspriprave, casizvedbe, prizorisca, umetvodja, programskotelo, sttujihselektorjev) FROM stdin;
002f0000-55ff-ab26-a4ae-d3319163529a	000e0000-55ff-ab26-4a01-ed73b2626ed5	\N	\N	9000.30	9000.30	9000.30	0.00	3600.12	5299.98	4000.40	1000.40	200.20	200.30	4599.40	\N	0.00	100.20	0	2	2	2	2	2	\N	40	0	0	0	0	0	1	0	0	0	0	0		0.00	\N	002b0000-55ff-ab24-e902-fb68135ce5a6	premiera	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-55ff-ab26-c1bc-822f1c8541cf	000e0000-55ff-ab26-df00-69f6219601cc	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	\N	60	0	0	0	0	0	1	0	0	0	0	0		0.00	\N	002b0000-55ff-ab24-a7d0-24ae34d4d40e	premiera	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-55ff-ab26-9693-2a156e4a60a2	000e0000-55ff-ab26-8819-d47f3a1e3cf6	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	\N	60	0	0	0	0	0	1	0	0	0	0	0		0.00	\N	002b0000-55ff-ab24-e902-fb68135ce5a6	premiera	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-55ff-ab26-d9c3-5e398e1c51ab	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-54.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	54.20	5	0	0	3	0	0	\N	22	0	0	0	0	0	0	0	0	0	0	0	Urejanje portala	0.00	10	\N	razno	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-55ff-ab26-1fe3-1f25bfa95a67	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-31.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	31.20	5	0	0	3	0	0	\N	202	0	0	0	0	0	0	0	0	0	0	0	Delavnice otroci	0.00	8	\N	razno	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 3005 (class 0 OID 20212569)
-- Dependencies: 215
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, podrocje, vodjaekipe, naziv, komentar, velikost, pomembna, sort, seplanira, dovoliprekrivanje, maxprekrivanj, tipfunkcije_id) FROM stdin;
000d0000-55ff-ab26-b629-83ff3a9fba9f	000e0000-55ff-ab26-df00-69f6219601cc	000c0000-55ff-ab26-dc84-4c820f6e313a	igralec	\N	Tezej	glavna vloga	velika	t	5	t	t	\N	000f0000-55ff-ab24-2c56-d7949122231b
000d0000-55ff-ab26-6a13-f2bba9e276fb	000e0000-55ff-ab26-df00-69f6219601cc	000c0000-55ff-ab26-bcdd-39e16b66815e	umetnik	\N	Režija		velika	t	8	t	t	\N	000f0000-55ff-ab24-4b69-489a01ecafff
000d0000-55ff-ab26-6e17-3d9b19cb9f39	000e0000-55ff-ab26-df00-69f6219601cc	000c0000-55ff-ab26-2af1-6c0bb690d03f	inspicient	t	Inšpicient			t	8	t	t	\N	000f0000-55ff-ab24-a531-7014d27a5b29
000d0000-55ff-ab26-b2cd-34a465a17c9c	000e0000-55ff-ab26-df00-69f6219601cc	000c0000-55ff-ab26-1a44-ea084d9aa83e	tehnik	t	Tehnični vodja			t	8	t	t	\N	000f0000-55ff-ab24-a3b6-dffce1a9b237
000d0000-55ff-ab26-003c-2cd4d269dee4	000e0000-55ff-ab26-df00-69f6219601cc	000c0000-55ff-ab26-04b7-89f7c7dea6a9	tehnik	\N	Razsvetljava			t	3	t	t	\N	000f0000-55ff-ab24-a3b6-dffce1a9b237
000d0000-55ff-ab26-e48b-55461d006fdc	000e0000-55ff-ab26-df00-69f6219601cc	000c0000-55ff-ab26-0780-2a3f036b334e	igralec	\N	Helena	glavna vloga	velika	t	5	t	t	\N	000f0000-55ff-ab24-2c56-d7949122231b
000d0000-55ff-ab26-06ee-4aea1a1d8cbb	000e0000-55ff-ab26-df00-69f6219601cc	000c0000-55ff-ab26-f3e8-a3a4303ce12c	igralec	\N	Hipolita	glavna vloga	velika	t	6	t	t	\N	000f0000-55ff-ab24-2c56-d7949122231b
000d0000-55ff-ab26-a378-b6c385c6e888	000e0000-55ff-ab26-df00-69f6219601cc	000c0000-55ff-ab26-8eed-f0bba9b8a53c	umetnik	\N	Lektoriranje			t	22	t	t	\N	000f0000-55ff-ab24-33b5-1c522ac4a1ec
000d0000-55ff-ab26-85e9-3162bb29788d	000e0000-55ff-ab26-df00-69f6219601cc	000c0000-55ff-ab26-5df8-c9cd84bb13d1	umetnik	\N	Avtor	Avtor besedila		t	2	t	f	\N	000f0000-55ff-ab24-2870-5e253bb8f893
\.


--
-- TOC entry 2985 (class 0 OID 20212383)
-- Dependencies: 195
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta, zamejstvo, kraj) FROM stdin;
\.


--
-- TOC entry 2983 (class 0 OID 20212358)
-- Dependencies: 193
-- Data for Name: job; Type: TABLE DATA; Schema: public; Owner: -
--

COPY job (id, user_id, name, task, status, log, datum, casizvedbe, izveden, data, alert, hidden, upor, datknj) FROM stdin;
\.


--
-- TOC entry 2981 (class 0 OID 20212335)
-- Dependencies: 191
-- Data for Name: kontaktnaoseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kontaktnaoseba (id, popa_id, oseba_id, status, funkcija, opis) FROM stdin;
00260000-55ff-ab26-8447-53e66a207903	00080000-55ff-ab26-cf67-42b24dbfbec0	00090000-55ff-ab26-827d-1fb002dc2e82	AK		igralka
\.


--
-- TOC entry 2994 (class 0 OID 20212483)
-- Dependencies: 204
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 3031 (class 0 OID 20212971)
-- Dependencies: 241
-- Data for Name: mapa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa (id, lastnik_id, parent_id, ime, komentar, caskreiranja, casspremembe, javnidostop, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3032 (class 0 OID 20212983)
-- Dependencies: 242
-- Data for Name: mapa_zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa_zapis (mapa_id, zapis_id) FROM stdin;
\.


--
-- TOC entry 3034 (class 0 OID 20213005)
-- Dependencies: 244
-- Data for Name: mapaacl; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapaacl (id, mapa_id, perm_id, dostop, upor, datknj) FROM stdin;
\.


--
-- TOC entry 2960 (class 0 OID 19946838)
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
-- TOC entry 2998 (class 0 OID 20212508)
-- Dependencies: 208
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 2978 (class 0 OID 20212292)
-- Dependencies: 188
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-55ff-ab25-51e1-c056073063bf	popa.stakli	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-55ff-ab25-81c8-3441b9669220	oseba.spol	array	a:2:{s:1:"M";a:1:{s:5:"label";s:6:"Moški";}s:1:"Z";a:1:{s:5:"label";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-55ff-ab25-e476-92df3bc01225	telefonska.vrsta	array	a:3:{s:7:"mobilna";a:1:{s:5:"label";s:7:"Mobilni";}s:6:"domaca";a:1:{s:5:"label";s:6:"Domač";}s:6:"fiksna";a:1:{s:5:"label";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-55ff-ab25-196f-7ccf247b0d5b	kontaktnaoseba.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status kontaktne osebe
00000000-55ff-ab25-a74a-2636a31a31c7	dogodek.status	array	a:7:{s:4:"100s";a:1:{s:5:"label";s:11:"Dolgoročno";}s:4:"200s";a:1:{s:5:"label";s:9:"Planirano";}s:4:"300s";a:1:{s:5:"label";s:8:"Fiksiran";}s:4:"400s";a:1:{s:5:"label";s:17:"Potrjen - interno";}s:4:"500s";a:1:{s:5:"label";s:15:"Potrjen - javno";}s:4:"600s";a:1:{s:5:"label";s:10:"Zaključen";}s:4:"700s";a:1:{s:5:"label";s:7:"Obdelan";}}	f	t	t	\N	Tabela statusa dogodkov
00000000-55ff-ab25-75f6-6841ae11b314	dogodek.razred	array	a:5:{s:4:"100s";a:2:{s:5:"label";s:9:"Predstava";s:4:"type";s:9:"predstava";}s:4:"200s";a:2:{s:5:"label";s:4:"Vaja";s:4:"type";s:4:"vaja";}s:4:"300s";a:2:{s:5:"label";s:10:"Gostovanje";s:4:"type";s:10:"gostovanje";}s:4:"400s";a:2:{s:5:"label";s:16:"Splošni dogodek";s:4:"type";s:8:"splošni";}s:4:"500s";a:2:{s:5:"label";s:10:"Zasedenost";s:4:"type";s:10:"zasedenost";}}	f	t	t	\N	Tabela razredov dogodkov, ki jih aplikacija podpira
00000000-55ff-ab25-0b94-89f243aa19f4	uprizoritev.faza	array	a:6:{s:20:"predprodukcija-ideja";a:1:{s:5:"label";s:16:"Dolgoročni plan";}s:20:"predprodukcija-poziv";a:1:{s:5:"label";s:29:"Predprodukcija, v fazi poziva";}s:30:"predprodukcija-potrjen_program";a:1:{s:5:"label";s:34:"Predprodukcija, program je potrjen";}s:10:"produkcija";a:1:{s:5:"label";s:10:"Produkcija";}s:14:"postprodukcija";a:1:{s:5:"label";s:14:"Postprodukcija";}s:5:"arhiv";a:1:{s:5:"label";s:10:"Arhivirana";}}	f	t	f	\N	Faza uprizoritve
00000000-55ff-ab25-5625-9fe44cc71d42	funkcija.podrocje	array	a:4:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}}	f	t	f	\N	Področje funkcije
00000000-55ff-ab25-a043-2e55bec97d03	tipfunkcije.podrocje	array	a:4:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}}	f	t	f	\N	Področje funkcije
00000000-55ff-ab25-5e22-7d233b9bc083	funkcija.velikost	array	a:4:{s:7:"stataza";a:1:{s:5:"label";s:8:"Stataža";}s:4:"mala";a:1:{s:5:"label";s:21:"Mala vloga / funkcija";}s:7:"srednja";a:1:{s:5:"label";s:24:"Srednja vloga / funkcija";}s:6:"velika";a:1:{s:5:"label";s:23:"Velika vloga / funkcija";}}	f	t	f	\N	Velikost funkcije
00000000-55ff-ab25-5749-954121b04abe	zaposlitev.status	array	a:2:{s:1:"A";a:1:{s:5:"label";s:7:"Aktivna";}s:1:"N";a:1:{s:5:"label";s:9:"Neaktivna";}}	f	t	f	\N	Status zaposlitve
00000000-55ff-ab25-9220-0b74712b0ec8	produkcijskahisa.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktivna";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktivna";}}	f	t	f	\N	Status produkcijske hiše
00000000-55ff-ab25-46ea-359246218763	strosekuprizoritve.tipstroska	array	a:1:{s:10:"materialni";a:1:{s:5:"label";s:19:"Materialni strošek";}}	f	t	f	\N	Tip stroška
00000000-55ff-ab25-9374-23fdc9203a51	fsacl.dostop	array	a:4:{s:1:"X";a:1:{s:5:"label";s:12:"Brez dostopa";}s:1:"R";a:1:{s:5:"label";s:11:"Samo branje";}s:2:"RW";a:1:{s:5:"label";s:17:"Branje in pisanje";}s:3:"RWD";a:1:{s:5:"label";s:26:"Branje pisanje in brisanje";}}	f	t	f	\N	ACL Javni dostop
00000000-55ff-ab26-0815-fcd512598a8d	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-55ff-ab26-e808-3735aed96229	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-55ff-ab26-92af-fc8713d2d1aa	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-55ff-ab26-1648-c19d5ea7dce5	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-55ff-ab26-5513-bdb88fd60dd9	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
00000000-55ff-ab27-143e-a7fdda90e061	application.tenant.maticnopodjetje	string	s:4:"1001";	f	t	f		Šifra matičnega podjetja v Popa in ProdukcijskaHisa
\.


--
-- TOC entry 2972 (class 0 OID 20212206)
-- Dependencies: 182
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-55ff-ab26-5e42-88ba5e827ed8	00000000-55ff-ab26-0815-fcd512598a8d	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-55ff-ab26-b30b-c8b9a83b18dd	00000000-55ff-ab26-0815-fcd512598a8d	00010000-55ff-ab25-2b79-21072cdaf265	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-55ff-ab26-1fcd-48a2fdf556d6	00000000-55ff-ab26-e808-3735aed96229	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 2973 (class 0 OID 20212217)
-- Dependencies: 183
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naslov_id, sifra, naziv, ime, priimek, funkcija, srednjeime, polnoime, psevdonim, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
00090000-55ff-ab26-eee9-fe2e3153c913	\N	\N	0001	g.	Janez	Novak	a	Peter	Janez Peter Novak	Jani	jani.novak@xxx.xx	1958-01-06	0601958000000	123456789	M	Jani Janez	Slovenija	Slovenija	Ljubljana
00090000-55ff-ab26-25fd-f372d5595bc9	00010000-55ff-ab26-634f-03c005159450	\N	0002	dr.	Anton	Horvat	b		Anton  Horvat	Tona	anton.horvat@xxx.xx	1968-02-12	1202968111111	234567890	M		Slovenija	Slovenija	Maribor
00090000-55ff-ab26-f6e1-2efdbbba2580	00010000-55ff-ab26-3fbb-783bbbb6577c	\N	0003		Ivan	Kovačič	c		Ivan  Kovačič	Ivo	ivan.kovacic@xxx.xx	1975-03-26	2603976222222	345678901	M		Slovenija	Slovenija	Celje
00090000-55ff-ab26-6c95-eba6b5b7cd4a	00010000-55ff-ab26-15f6-a8ac1af698e7	\N	0004	prof.	Jožef	Krajnc	d		Jožef  Krajnc	Joža	jozef.krajnc@xxx.xx	1971-04-30	3004971333333	456789012	M		Slovenija	Slovenija	Kranj
00090000-55ff-ab26-8cea-9e4b0d1c1f85	\N	\N	0005		Marko	Zupančič	e		Marko  Zupančič		marko.zupancic@xxx.xx	1984-05-07	0705984444444	567890123	M		Slovenija	Slovenija	Koper
00090000-55ff-ab26-2432-918370df2ef1	\N	\N	0006	ga.	Marija	Kovač	f		Marija  Kovač		marija.kovac@xxx.xx	1962-06-19	1906962444444	678901234	Z		Slovenija	Slovenija	Murska Sobota
00090000-55ff-ab26-4f85-0638c2c3a300	\N	\N	0007	ga.	Ana	Potočnik	g		Ana  Potočnik		ana.potocnik@xxx.xx	1975-07-24	2407975555555	789012345	Z		Slovenija	Slovenija	Novo Mesto
00090000-55ff-ab26-9dcb-c1459df549b7	\N	\N	0008	ga.	Maja	Mlakar	h		Maja  Mlakar		maja.mlakar@xxx.xx	1986-08-02	0208986666666	890123456	Z		Slovenija	Slovenija	Nova Gorica
00090000-55ff-ab26-827d-1fb002dc2e82	00010000-55ff-ab26-d836-770bbd2fa31a	\N	0009		Irena	Kos	i		Irena  Kos		irena.kos@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Ptuj
00090000-55ff-ab26-34e2-6c2f70224f6a	\N	\N	0010		Mojca	Vidmar	J		Mojca  Vidmar		mojca.vidmar@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Idrija
00090000-55ff-ab26-01cf-6c1f2e27d8f4	\N	\N	0011		xx	write protected12345	a		xx  write protected12345		xx@xxx.xx	\N	\N	\N	Z		\N	\N	\N
00090000-55ff-ab26-55fd-a2da0812b19b	\N	\N	0012		Luka	Golob	luč	a	Luka a Golob		luka.golob@xxx.xx	\N	\N	\N	M		\N	\N	\N
00090000-55ff-ab26-db68-3b9cdebb37ba	00010000-55ff-ab26-cee8-2f3bebb8ea76	\N	0013		Tatjana	Božič	tajnica	a	Tatjana a Božič		tatjana.bozic@xxx.xx	\N	\N	\N	Z		\N	\N	\N
00090000-55ff-ab26-5a40-4e16ac607708	\N	\N	0014		William	Shakespeare	avtor		William  Shakespeare		\N	\N	\N	\N	M		\N	\N	\N
00090000-55ff-ab26-5bf6-1309e09cf23d	\N	\N	0015		Nebojša	Kavader	avtor		Nebojša  Kavader		\N	\N	\N	\N	M		\N	\N	\N
00090000-55ff-ab26-8b80-df4e9f933d51	\N	\N	0016		Fjodor	Dostojevski	avtor	Mihajlovič	Fjodor Mihajlovič Dostojevski		\N	\N	\N	\N	M		\N	\N	\N
00090000-55ff-ab26-8a19-32279a942b1e	\N	\N	0017		Berta 	Hočevar	avtorica		Berta   Hočevar		\N	\N	\N	\N	Z		\N	\N	\N
00090000-55ff-ab26-c71b-c5683ac21ac6	\N	\N	0018		Katarina	Podbevšek	lektorica		Katarina  Podbevšek		\N	\N	\N	\N	Z		\N	\N	\N
\.


--
-- TOC entry 2968 (class 0 OID 20212171)
-- Dependencies: 178
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-55ff-ab24-15e5-032a604f8261	Aaa-read	Aaa (User,Role,Permission) - branje	f
00030000-55ff-ab24-4e97-e644085f4991	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	f
00030000-55ff-ab24-cb9d-da1206e3e7ce	TerminStoritve-vse	TerminStoritve - spreminjanje vseh zapisov	f
00030000-55ff-ab24-9c37-32b445b737bb	Dogodek-readVse	Dogodek - branje vseh, ne glede na status dogodka	f
00030000-55ff-ab24-a1c1-fa0f95ab75fd	Oseba-vse	Oseba - vse - za testiranje assert	f
00030000-55ff-ab24-6a2f-b1c91fdd8445	ProgramDela-lock	ProgramDela - zaklepanje	f
00030000-55ff-ab24-76f9-a17154a024f1	ProgramDela-unlock	ProgramDela - odklepanje	f
00030000-55ff-ab24-aec3-912cd68880be	Abonma-read	Abonma - branje	f
00030000-55ff-ab24-dd76-f06f3f82a2fc	Abonma-write	Abonma - spreminjanje	f
00030000-55ff-ab24-07ad-b408c7935a4a	Alternacija-read	Alternacija - branje	f
00030000-55ff-ab24-dffc-cf5087c32d9d	Alternacija-write	Alternacija - spreminjanje	f
00030000-55ff-ab24-9591-594ed939e1c4	Arhivalija-read	Arhivalija - branje	f
00030000-55ff-ab24-6c08-fea330630d70	Arhivalija-write	Arhivalija - spreminjanje	f
00030000-55ff-ab24-6b0c-76dbe0fb2372	AvtorBesedila-read	AvtorBesedila - branje	f
00030000-55ff-ab24-8f59-df484a300af9	AvtorBesedila-write	AvtorBesedila - spreminjanje	f
00030000-55ff-ab24-9afe-2c641ff5c17a	Besedilo-read	Besedilo - branje	f
00030000-55ff-ab24-b7a4-2c4ea52328df	Besedilo-write	Besedilo - spreminjanje	f
00030000-55ff-ab24-ff3b-e16c360812cd	DogodekIzven-read	DogodekIzven - branje	f
00030000-55ff-ab24-401a-1af5d0b7697e	DogodekIzven-write	DogodekIzven - spreminjanje	f
00030000-55ff-ab24-934d-1322ddf5f87a	Dogodek-read	Dogodek - branje	f
00030000-55ff-ab24-b730-9f5917414c25	Dogodek-write	Dogodek - spreminjanje	f
00030000-55ff-ab24-e395-597d3e6736e3	DrugiVir-read	DrugiVir - branje	f
00030000-55ff-ab24-269b-5d31af6d2804	DrugiVir-write	DrugiVir - spreminjanje	f
00030000-55ff-ab24-132d-35a5ddba3295	Drzava-read	Drzava - branje	f
00030000-55ff-ab24-4da0-ad71f8b0f748	Drzava-write	Drzava - spreminjanje	f
00030000-55ff-ab24-0221-a2778dd7e608	EnotaPrograma-read	EnotaPrograma - branje	f
00030000-55ff-ab24-d360-958489bcdf64	EnotaPrograma-write	EnotaPrograma - spreminjanje	f
00030000-55ff-ab24-fc9b-f68ef3581802	Funkcija-read	Funkcija - branje	f
00030000-55ff-ab24-1a0e-eaa94dda1898	Funkcija-write	Funkcija - spreminjanje	f
00030000-55ff-ab24-0e99-61ed05d4ee91	Gostovanje-read	Gostovanje - branje	f
00030000-55ff-ab24-1213-0bb5130d8ce2	Gostovanje-write	Gostovanje - spreminjanje	f
00030000-55ff-ab24-15c9-6cd5f38f9124	Gostujoca-read	Gostujoca - branje	f
00030000-55ff-ab24-c39b-b9c6270922be	Gostujoca-write	Gostujoca - spreminjanje	f
00030000-55ff-ab24-7479-a0fd024aba35	KontaktnaOseba-read	KontaktnaOseba - branje	f
00030000-55ff-ab24-d19f-8f2e6eff712c	KontaktnaOseba-write	KontaktnaOseba - spreminjanje	f
00030000-55ff-ab24-d935-1eb57b5f9b99	Kupec-read	Kupec - branje	f
00030000-55ff-ab24-95ec-217494949869	Kupec-write	Kupec - spreminjanje	f
00030000-55ff-ab24-caad-e9799ba61ca6	NacinPlacina-read	NacinPlacina - branje	f
00030000-55ff-ab24-a630-8ef2bfc0a423	NacinPlacina-write	NacinPlacina - spreminjanje	f
00030000-55ff-ab24-e40a-0f6de93e228e	Option-read	Option - branje	f
00030000-55ff-ab24-aa44-15d3aa592829	Option-write	Option - spreminjanje	f
00030000-55ff-ab24-648f-283c376b8ad3	OptionValue-read	OptionValue - branje	f
00030000-55ff-ab24-bd39-2a6cdfb5f212	OptionValue-write	OptionValue - spreminjanje	f
00030000-55ff-ab24-4cb1-1b8b525b2a4d	Oseba-read	Oseba - branje	f
00030000-55ff-ab24-0135-b557e85b3941	Oseba-write	Oseba - spreminjanje	f
00030000-55ff-ab24-5e1b-f60ec4f3cd9a	PlacilniInstrument-read	PlacilniInstrument - branje	f
00030000-55ff-ab24-9d4d-5f6a0d42abdd	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	f
00030000-55ff-ab24-74a4-129dc63327cf	PodrocjeSedenja-read	PodrocjeSedenja - branje	f
00030000-55ff-ab24-dab9-5d2bd88468a8	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	f
00030000-55ff-ab24-96f2-4cec3a2400d8	Pogodba-read	Pogodba - branje	f
00030000-55ff-ab24-4bce-ad123684c901	Pogodba-write	Pogodba - spreminjanje	f
00030000-55ff-ab24-d176-0b29200484b1	Popa-read	Popa - branje	f
00030000-55ff-ab24-86f5-3bca811c1755	Popa-write	Popa - spreminjanje	f
00030000-55ff-ab24-aa37-3a148df06b1c	Posta-read	Posta - branje	f
00030000-55ff-ab24-5a01-78b349116582	Posta-write	Posta - spreminjanje	f
00030000-55ff-ab24-4dd2-587617fbd514	PostavkaCDve-read	PostavkaCDve - branje	f
00030000-55ff-ab24-73f1-3fd051d76221	PostavkaCDve-write	PostavkaCDve - spreminjanje	f
00030000-55ff-ab24-9e29-f2dbb212101e	PostavkaRacuna-read	PostavkaRacuna - branje	f
00030000-55ff-ab24-6e87-82f5b9d6e31c	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	f
00030000-55ff-ab24-6f2d-997862dee62b	PostniNaslov-read	PostniNaslov - branje	f
00030000-55ff-ab24-978c-e951e514419a	PostniNaslov-write	PostniNaslov - spreminjanje	f
00030000-55ff-ab24-55e2-ac3be5099862	Predstava-read	Predstava - branje	f
00030000-55ff-ab24-1634-aeefe5b263fd	Predstava-write	Predstava - spreminjanje	f
00030000-55ff-ab24-84a1-6dcf9477a7dc	ProdajaPredstave-read	ProdajaPredstave - branje	f
00030000-55ff-ab24-7dd3-f73635f52871	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	f
00030000-55ff-ab24-eb01-1774ce4f0ca1	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	f
00030000-55ff-ab24-abd8-1b318543c387	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	f
00030000-55ff-ab24-6d8e-d3a88f3cbaa7	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	f
00030000-55ff-ab24-7690-c0f63df69214	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	f
00030000-55ff-ab24-90fa-3fb1dc5de41d	ProgramDela-read	ProgramDela - branje	f
00030000-55ff-ab24-0aff-1b7a00878b0b	ProgramDela-write	ProgramDela - spreminjanje	f
00030000-55ff-ab24-ad9c-0dbdba106df2	ProgramFestival-read	ProgramFestival - branje	f
00030000-55ff-ab24-2a6b-8f2e8d06b1d9	ProgramFestival-write	ProgramFestival - spreminjanje	f
00030000-55ff-ab24-e6c9-49d24e978aa4	ProgramGostovanje-read	ProgramGostovanje - branje	f
00030000-55ff-ab24-84a8-3e1bdfe4d2ab	ProgramGostovanje-write	ProgramGostovanje - spreminjanje	f
00030000-55ff-ab24-04a4-0d81faca1ffb	ProgramGostujoca-read	ProgramGostujoca - branje	f
00030000-55ff-ab24-ca71-c7b25df7c56d	ProgramGostujoca-write	ProgramGostujoca - spreminjanje	f
00030000-55ff-ab24-b87f-43fe01b70077	ProgramIzjemni-read	ProgramIzjemni - branje	f
00030000-55ff-ab24-f5cc-5564ce3f278c	ProgramIzjemni-write	ProgramIzjemni - spreminjanje	f
00030000-55ff-ab24-6576-b0286ac2e328	ProgramPonovitevPrejsnjih-read	ProgramPonovitevPrejsnjih - branje	f
00030000-55ff-ab24-1aff-6e7fc5cfcae4	ProgramPonovitevPrejsnjih-write	ProgramPonovitevPrejsnjih - spreminjanje	f
00030000-55ff-ab24-02a6-ab64e61149a2	ProgramPonovitevPremiere-read	ProgramPonovitevPremiere - branje	f
00030000-55ff-ab24-866e-c0d4f9def34a	ProgramPonovitevPremiere-write	ProgramPonovitevPremiere - spreminjanje	f
00030000-55ff-ab24-3a34-13069f66358c	ProgramPremiera-read	ProgramPremiera - branje	f
00030000-55ff-ab24-6db4-159478bf63ac	ProgramPremiera-write	ProgramPremiera - spreminjanje	f
00030000-55ff-ab24-0f81-68a904162887	ProgramRazno-read	ProgramRazno - branje	f
00030000-55ff-ab24-3998-4f14c49e5df4	ProgramRazno-write	ProgramRazno - spreminjanje	f
00030000-55ff-ab24-88c9-7020af01e7f7	ProgramskaEnotaSklopa-read	ProgramskaEnotaSklopa - branje	f
00030000-55ff-ab24-4591-bce842f2887b	ProgramskaEnotaSklopa-write	ProgramskaEnotaSklopa - spreminjanje	f
00030000-55ff-ab24-f19b-e32cd460c47f	Prostor-read	Prostor - branje	f
00030000-55ff-ab24-2f28-c4691a6ed396	Prostor-write	Prostor - spreminjanje	f
00030000-55ff-ab24-d345-46ab808f6708	Racun-read	Racun - branje	f
00030000-55ff-ab24-8c8f-106dfa4dafd7	Racun-write	Racun - spreminjanje	f
00030000-55ff-ab24-2008-ec29ba403dd9	RazpisanSedez-read	RazpisanSedez - branje	f
00030000-55ff-ab24-74af-ef1f779254a9	RazpisanSedez-write	RazpisanSedez - spreminjanje	f
00030000-55ff-ab24-a440-e3326de0ff72	Rekviziterstvo-read	Rekviziterstvo - branje	f
00030000-55ff-ab24-158c-e66d647a2d97	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	f
00030000-55ff-ab24-c22d-d22ebdb019a3	Rekvizit-read	Rekvizit - branje	f
00030000-55ff-ab24-d94f-8640be58cab4	Rekvizit-write	Rekvizit - spreminjanje	f
00030000-55ff-ab24-c788-fce9f9c44b2a	Revizija-read	Revizija - branje	f
00030000-55ff-ab24-bf25-a6d38ce5fead	Revizija-write	Revizija - spreminjanje	f
00030000-55ff-ab24-5561-b4b0431611dc	Rezervacija-read	Rezervacija - branje	f
00030000-55ff-ab24-a030-be61e40bbb96	Rezervacija-write	Rezervacija - spreminjanje	f
00030000-55ff-ab24-c8ce-40f39240475d	SedezniRed-read	SedezniRed - branje	f
00030000-55ff-ab24-0d56-1f1219314be1	SedezniRed-write	SedezniRed - spreminjanje	f
00030000-55ff-ab24-6310-1bd78a364ac6	Sedez-read	Sedez - branje	f
00030000-55ff-ab24-2340-e93c61754661	Sedez-write	Sedez - spreminjanje	f
00030000-55ff-ab24-4769-0d6244c65006	Sezona-read	Sezona - branje	f
00030000-55ff-ab24-fa57-fca350f99bf5	Sezona-write	Sezona - spreminjanje	f
00030000-55ff-ab24-d15a-c41cd0d844e1	StevilcenjeKonfig-read	StevilcenjeKonfig - branje	f
00030000-55ff-ab24-64aa-00f76ac3c525	StevilcenjeKonfig-write	StevilcenjeKonfig - spreminjanje	f
00030000-55ff-ab24-e188-550b89eb419c	Stevilcenje-read	Stevilcenje - branje	f
00030000-55ff-ab24-79ff-8c3d54f215a7	Stevilcenje-write	Stevilcenje - spreminjanje	f
00030000-55ff-ab24-35a5-5c419a081168	StevilcenjeStanje-read	StevilcenjeStanje - branje	f
00030000-55ff-ab24-a886-a709de0faf0f	StevilcenjeStanje-write	StevilcenjeStanje - spreminjanje	f
00030000-55ff-ab24-9efb-b565f04109e9	StrosekUprizoritve-read	StrosekUprizoritve - branje	f
00030000-55ff-ab24-da23-17766538fb2f	StrosekUprizoritve-write	StrosekUprizoritve - spreminjanje	f
00030000-55ff-ab24-fc0e-05e86e6c6c08	Telefonska-read	Telefonska - branje	f
00030000-55ff-ab24-deca-d9fed81f4e4c	Telefonska-write	Telefonska - spreminjanje	f
00030000-55ff-ab24-6c4c-6b6373f2760d	TerminStoritve-read	TerminStoritve - branje	f
00030000-55ff-ab24-befc-93832f905ac2	TerminStoritve-write	TerminStoritve - spreminjanje	f
00030000-55ff-ab24-fd03-18e53de5217a	TipFunkcije-read	TipFunkcije - branje	f
00030000-55ff-ab24-6c19-211036d797d8	TipFunkcije-write	TipFunkcije - spreminjanje	f
00030000-55ff-ab24-3fd8-34e6e5b85a17	TipProgramskeEnote-read	TipProgramskeEnote - branje	f
00030000-55ff-ab24-3e1a-1752cdd2d24b	TipProgramskeEnote-write	TipProgramskeEnote - spreminjanje	f
00030000-55ff-ab24-a1e6-1335eb2c3ecb	Trr-read	Trr - branje	f
00030000-55ff-ab24-5dd8-ec924b9a559a	Trr-write	Trr - spreminjanje	f
00030000-55ff-ab24-6bfa-4451c5fe6308	Uprizoritev-read	Uprizoritev - branje	f
00030000-55ff-ab24-602f-94342f608478	Uprizoritev-write	Uprizoritev - spreminjanje	f
00030000-55ff-ab24-7e34-7dbeb9dc12fa	Vaja-read	Vaja - branje	f
00030000-55ff-ab24-6108-4ba95d5db786	Vaja-write	Vaja - spreminjanje	f
00030000-55ff-ab24-7acf-b37731e2dff4	VrstaSedezev-read	VrstaSedezev - branje	f
00030000-55ff-ab24-14bb-84880de0d32d	VrstaSedezev-write	VrstaSedezev - spreminjanje	f
00030000-55ff-ab24-b1d1-a740542e69d1	VrstaStroska-read	VrstaStroska - branje	f
00030000-55ff-ab24-4f4d-bf118cd1da97	VrstaStroska-write	VrstaStroska - spreminjanje	f
00030000-55ff-ab24-4202-20dedb2b2ec1	Zaposlitev-read	Zaposlitev - branje	f
00030000-55ff-ab24-134d-4e25905b2fd9	Zaposlitev-write	Zaposlitev - spreminjanje	f
00030000-55ff-ab24-2efd-322731b2a7e9	Zasedenost-read	Zasedenost - branje	f
00030000-55ff-ab24-7fd1-cf067fe27c10	Zasedenost-write	Zasedenost - spreminjanje	f
00030000-55ff-ab24-70fc-c996b0b625b3	ZvrstSurs-read	ZvrstSurs - branje	f
00030000-55ff-ab24-866e-c955d73bf0f7	ZvrstSurs-write	ZvrstSurs - spreminjanje	f
00030000-55ff-ab24-ca51-c34ddb6ddb39	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	f
00030000-55ff-ab24-f9da-47539b2f28f7	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	f
00030000-55ff-ab24-c25a-9ca5a3e20fe2	Job-read	Branje opravil - samo zase - branje	f
00030000-55ff-ab24-188a-6a57fd19b082	Job-write	Dodajanje in spreminjanje opravil - samo zase	f
00030000-55ff-ab24-ec50-68670b849c96	Job-admin	Upravljanje opravil za vse uporabnike	f
00030000-55ff-ab24-deac-9c57c54c4629	Mapa-write	Mapa - osnovno dovoljenje za pisanje	f
00030000-55ff-ab24-03a3-42ffd21069ba	Mapa-read	Mapa - osnovno dovoljenje za branje	f
00030000-55ff-ab24-e710-df43c6304767	MapaAcl-write	MapaAcl - dovoljenje za dostop pisanje ACL-jev mape	f
00030000-55ff-ab24-b234-ae738258256b	MapaAcl-read	MapaAcl - dovoljenje za dostop branje ACL-jev mape	f
00030000-55ff-ab24-942e-13b54ed64c16	Zapis-write	Zapis - dovoljenje za pisanje zapisov	f
00030000-55ff-ab24-5d9d-05e467f6d830	Zapis-read	Zapis - dovoljenje za pisanje zapisov	f
00030000-55ff-ab24-d0d5-5685429e5a22	ZapisLastnik-write	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	f
00030000-55ff-ab24-63f4-586be4a12012	ZapisLastnik-read	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	f
00030000-55ff-ab24-1daa-99b3eef72036	VrstaZapisa-write	Šifrant vrst zapisa - spreminjanje	f
00030000-55ff-ab24-932b-c9db06127865	VrstaZapisa-read	Šifrant vrst zapisa - branje	f
00030000-55ff-ab24-dc9d-cb52f08733db	Datoteka-write	Datoteka - spreminjanje	f
00030000-55ff-ab24-c820-812ff9613b35	Datoteka-read	Datoteke - branje	f
\.


--
-- TOC entry 2970 (class 0 OID 20212190)
-- Dependencies: 180
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-55ff-ab24-1628-3c6148895ac7	00030000-55ff-ab24-4e97-e644085f4991
00020000-55ff-ab24-5f7b-2d5ce2d3eaf0	00030000-55ff-ab24-132d-35a5ddba3295
00020000-55ff-ab24-ed56-9e5ff09c16f0	00030000-55ff-ab24-aec3-912cd68880be
00020000-55ff-ab24-ed56-9e5ff09c16f0	00030000-55ff-ab24-dd76-f06f3f82a2fc
00020000-55ff-ab24-ed56-9e5ff09c16f0	00030000-55ff-ab24-07ad-b408c7935a4a
00020000-55ff-ab24-ed56-9e5ff09c16f0	00030000-55ff-ab24-dffc-cf5087c32d9d
00020000-55ff-ab24-ed56-9e5ff09c16f0	00030000-55ff-ab24-9591-594ed939e1c4
00020000-55ff-ab24-ed56-9e5ff09c16f0	00030000-55ff-ab24-934d-1322ddf5f87a
00020000-55ff-ab24-ed56-9e5ff09c16f0	00030000-55ff-ab24-9c37-32b445b737bb
00020000-55ff-ab24-ed56-9e5ff09c16f0	00030000-55ff-ab24-b730-9f5917414c25
00020000-55ff-ab24-ed56-9e5ff09c16f0	00030000-55ff-ab24-132d-35a5ddba3295
00020000-55ff-ab24-ed56-9e5ff09c16f0	00030000-55ff-ab24-4da0-ad71f8b0f748
00020000-55ff-ab24-ed56-9e5ff09c16f0	00030000-55ff-ab24-fc9b-f68ef3581802
00020000-55ff-ab24-ed56-9e5ff09c16f0	00030000-55ff-ab24-1a0e-eaa94dda1898
00020000-55ff-ab24-ed56-9e5ff09c16f0	00030000-55ff-ab24-0e99-61ed05d4ee91
00020000-55ff-ab24-ed56-9e5ff09c16f0	00030000-55ff-ab24-1213-0bb5130d8ce2
00020000-55ff-ab24-ed56-9e5ff09c16f0	00030000-55ff-ab24-15c9-6cd5f38f9124
00020000-55ff-ab24-ed56-9e5ff09c16f0	00030000-55ff-ab24-c39b-b9c6270922be
00020000-55ff-ab24-ed56-9e5ff09c16f0	00030000-55ff-ab24-7479-a0fd024aba35
00020000-55ff-ab24-ed56-9e5ff09c16f0	00030000-55ff-ab24-d19f-8f2e6eff712c
00020000-55ff-ab24-ed56-9e5ff09c16f0	00030000-55ff-ab24-e40a-0f6de93e228e
00020000-55ff-ab24-ed56-9e5ff09c16f0	00030000-55ff-ab24-648f-283c376b8ad3
00020000-55ff-ab24-ed56-9e5ff09c16f0	00030000-55ff-ab24-4cb1-1b8b525b2a4d
00020000-55ff-ab24-ed56-9e5ff09c16f0	00030000-55ff-ab24-0135-b557e85b3941
00020000-55ff-ab24-ed56-9e5ff09c16f0	00030000-55ff-ab24-d176-0b29200484b1
00020000-55ff-ab24-ed56-9e5ff09c16f0	00030000-55ff-ab24-86f5-3bca811c1755
00020000-55ff-ab24-ed56-9e5ff09c16f0	00030000-55ff-ab24-aa37-3a148df06b1c
00020000-55ff-ab24-ed56-9e5ff09c16f0	00030000-55ff-ab24-5a01-78b349116582
00020000-55ff-ab24-ed56-9e5ff09c16f0	00030000-55ff-ab24-6f2d-997862dee62b
00020000-55ff-ab24-ed56-9e5ff09c16f0	00030000-55ff-ab24-978c-e951e514419a
00020000-55ff-ab24-ed56-9e5ff09c16f0	00030000-55ff-ab24-55e2-ac3be5099862
00020000-55ff-ab24-ed56-9e5ff09c16f0	00030000-55ff-ab24-1634-aeefe5b263fd
00020000-55ff-ab24-ed56-9e5ff09c16f0	00030000-55ff-ab24-6d8e-d3a88f3cbaa7
00020000-55ff-ab24-ed56-9e5ff09c16f0	00030000-55ff-ab24-7690-c0f63df69214
00020000-55ff-ab24-ed56-9e5ff09c16f0	00030000-55ff-ab24-f19b-e32cd460c47f
00020000-55ff-ab24-ed56-9e5ff09c16f0	00030000-55ff-ab24-2f28-c4691a6ed396
00020000-55ff-ab24-ed56-9e5ff09c16f0	00030000-55ff-ab24-a440-e3326de0ff72
00020000-55ff-ab24-ed56-9e5ff09c16f0	00030000-55ff-ab24-158c-e66d647a2d97
00020000-55ff-ab24-ed56-9e5ff09c16f0	00030000-55ff-ab24-c22d-d22ebdb019a3
00020000-55ff-ab24-ed56-9e5ff09c16f0	00030000-55ff-ab24-d94f-8640be58cab4
00020000-55ff-ab24-ed56-9e5ff09c16f0	00030000-55ff-ab24-4769-0d6244c65006
00020000-55ff-ab24-ed56-9e5ff09c16f0	00030000-55ff-ab24-fa57-fca350f99bf5
00020000-55ff-ab24-ed56-9e5ff09c16f0	00030000-55ff-ab24-fd03-18e53de5217a
00020000-55ff-ab24-ed56-9e5ff09c16f0	00030000-55ff-ab24-6bfa-4451c5fe6308
00020000-55ff-ab24-ed56-9e5ff09c16f0	00030000-55ff-ab24-602f-94342f608478
00020000-55ff-ab24-ed56-9e5ff09c16f0	00030000-55ff-ab24-7e34-7dbeb9dc12fa
00020000-55ff-ab24-ed56-9e5ff09c16f0	00030000-55ff-ab24-6108-4ba95d5db786
00020000-55ff-ab24-ed56-9e5ff09c16f0	00030000-55ff-ab24-2efd-322731b2a7e9
00020000-55ff-ab24-ed56-9e5ff09c16f0	00030000-55ff-ab24-7fd1-cf067fe27c10
00020000-55ff-ab24-ed56-9e5ff09c16f0	00030000-55ff-ab24-70fc-c996b0b625b3
00020000-55ff-ab24-ed56-9e5ff09c16f0	00030000-55ff-ab24-ca51-c34ddb6ddb39
00020000-55ff-ab24-32fd-b2249d5173fe	00030000-55ff-ab24-aec3-912cd68880be
00020000-55ff-ab24-32fd-b2249d5173fe	00030000-55ff-ab24-9591-594ed939e1c4
00020000-55ff-ab24-32fd-b2249d5173fe	00030000-55ff-ab24-934d-1322ddf5f87a
00020000-55ff-ab24-32fd-b2249d5173fe	00030000-55ff-ab24-132d-35a5ddba3295
00020000-55ff-ab24-32fd-b2249d5173fe	00030000-55ff-ab24-0e99-61ed05d4ee91
00020000-55ff-ab24-32fd-b2249d5173fe	00030000-55ff-ab24-15c9-6cd5f38f9124
00020000-55ff-ab24-32fd-b2249d5173fe	00030000-55ff-ab24-7479-a0fd024aba35
00020000-55ff-ab24-32fd-b2249d5173fe	00030000-55ff-ab24-d19f-8f2e6eff712c
00020000-55ff-ab24-32fd-b2249d5173fe	00030000-55ff-ab24-e40a-0f6de93e228e
00020000-55ff-ab24-32fd-b2249d5173fe	00030000-55ff-ab24-648f-283c376b8ad3
00020000-55ff-ab24-32fd-b2249d5173fe	00030000-55ff-ab24-4cb1-1b8b525b2a4d
00020000-55ff-ab24-32fd-b2249d5173fe	00030000-55ff-ab24-0135-b557e85b3941
00020000-55ff-ab24-32fd-b2249d5173fe	00030000-55ff-ab24-d176-0b29200484b1
00020000-55ff-ab24-32fd-b2249d5173fe	00030000-55ff-ab24-aa37-3a148df06b1c
00020000-55ff-ab24-32fd-b2249d5173fe	00030000-55ff-ab24-6f2d-997862dee62b
00020000-55ff-ab24-32fd-b2249d5173fe	00030000-55ff-ab24-978c-e951e514419a
00020000-55ff-ab24-32fd-b2249d5173fe	00030000-55ff-ab24-55e2-ac3be5099862
00020000-55ff-ab24-32fd-b2249d5173fe	00030000-55ff-ab24-f19b-e32cd460c47f
00020000-55ff-ab24-32fd-b2249d5173fe	00030000-55ff-ab24-a440-e3326de0ff72
00020000-55ff-ab24-32fd-b2249d5173fe	00030000-55ff-ab24-c22d-d22ebdb019a3
00020000-55ff-ab24-32fd-b2249d5173fe	00030000-55ff-ab24-4769-0d6244c65006
00020000-55ff-ab24-32fd-b2249d5173fe	00030000-55ff-ab24-fc0e-05e86e6c6c08
00020000-55ff-ab24-32fd-b2249d5173fe	00030000-55ff-ab24-deca-d9fed81f4e4c
00020000-55ff-ab24-32fd-b2249d5173fe	00030000-55ff-ab24-a1e6-1335eb2c3ecb
00020000-55ff-ab24-32fd-b2249d5173fe	00030000-55ff-ab24-5dd8-ec924b9a559a
00020000-55ff-ab24-32fd-b2249d5173fe	00030000-55ff-ab24-4202-20dedb2b2ec1
00020000-55ff-ab24-32fd-b2249d5173fe	00030000-55ff-ab24-134d-4e25905b2fd9
00020000-55ff-ab24-32fd-b2249d5173fe	00030000-55ff-ab24-70fc-c996b0b625b3
00020000-55ff-ab24-32fd-b2249d5173fe	00030000-55ff-ab24-ca51-c34ddb6ddb39
00020000-55ff-ab24-d3c0-be2e71b85a3a	00030000-55ff-ab24-aec3-912cd68880be
00020000-55ff-ab24-d3c0-be2e71b85a3a	00030000-55ff-ab24-07ad-b408c7935a4a
00020000-55ff-ab24-d3c0-be2e71b85a3a	00030000-55ff-ab24-9591-594ed939e1c4
00020000-55ff-ab24-d3c0-be2e71b85a3a	00030000-55ff-ab24-6c08-fea330630d70
00020000-55ff-ab24-d3c0-be2e71b85a3a	00030000-55ff-ab24-9afe-2c641ff5c17a
00020000-55ff-ab24-d3c0-be2e71b85a3a	00030000-55ff-ab24-ff3b-e16c360812cd
00020000-55ff-ab24-d3c0-be2e71b85a3a	00030000-55ff-ab24-934d-1322ddf5f87a
00020000-55ff-ab24-d3c0-be2e71b85a3a	00030000-55ff-ab24-132d-35a5ddba3295
00020000-55ff-ab24-d3c0-be2e71b85a3a	00030000-55ff-ab24-fc9b-f68ef3581802
00020000-55ff-ab24-d3c0-be2e71b85a3a	00030000-55ff-ab24-0e99-61ed05d4ee91
00020000-55ff-ab24-d3c0-be2e71b85a3a	00030000-55ff-ab24-15c9-6cd5f38f9124
00020000-55ff-ab24-d3c0-be2e71b85a3a	00030000-55ff-ab24-7479-a0fd024aba35
00020000-55ff-ab24-d3c0-be2e71b85a3a	00030000-55ff-ab24-e40a-0f6de93e228e
00020000-55ff-ab24-d3c0-be2e71b85a3a	00030000-55ff-ab24-648f-283c376b8ad3
00020000-55ff-ab24-d3c0-be2e71b85a3a	00030000-55ff-ab24-4cb1-1b8b525b2a4d
00020000-55ff-ab24-d3c0-be2e71b85a3a	00030000-55ff-ab24-d176-0b29200484b1
00020000-55ff-ab24-d3c0-be2e71b85a3a	00030000-55ff-ab24-aa37-3a148df06b1c
00020000-55ff-ab24-d3c0-be2e71b85a3a	00030000-55ff-ab24-55e2-ac3be5099862
00020000-55ff-ab24-d3c0-be2e71b85a3a	00030000-55ff-ab24-6d8e-d3a88f3cbaa7
00020000-55ff-ab24-d3c0-be2e71b85a3a	00030000-55ff-ab24-f19b-e32cd460c47f
00020000-55ff-ab24-d3c0-be2e71b85a3a	00030000-55ff-ab24-a440-e3326de0ff72
00020000-55ff-ab24-d3c0-be2e71b85a3a	00030000-55ff-ab24-c22d-d22ebdb019a3
00020000-55ff-ab24-d3c0-be2e71b85a3a	00030000-55ff-ab24-4769-0d6244c65006
00020000-55ff-ab24-d3c0-be2e71b85a3a	00030000-55ff-ab24-fd03-18e53de5217a
00020000-55ff-ab24-d3c0-be2e71b85a3a	00030000-55ff-ab24-7e34-7dbeb9dc12fa
00020000-55ff-ab24-d3c0-be2e71b85a3a	00030000-55ff-ab24-2efd-322731b2a7e9
00020000-55ff-ab24-d3c0-be2e71b85a3a	00030000-55ff-ab24-70fc-c996b0b625b3
00020000-55ff-ab24-d3c0-be2e71b85a3a	00030000-55ff-ab24-ca51-c34ddb6ddb39
00020000-55ff-ab24-3af8-6205854a33df	00030000-55ff-ab24-aec3-912cd68880be
00020000-55ff-ab24-3af8-6205854a33df	00030000-55ff-ab24-dd76-f06f3f82a2fc
00020000-55ff-ab24-3af8-6205854a33df	00030000-55ff-ab24-dffc-cf5087c32d9d
00020000-55ff-ab24-3af8-6205854a33df	00030000-55ff-ab24-9591-594ed939e1c4
00020000-55ff-ab24-3af8-6205854a33df	00030000-55ff-ab24-934d-1322ddf5f87a
00020000-55ff-ab24-3af8-6205854a33df	00030000-55ff-ab24-132d-35a5ddba3295
00020000-55ff-ab24-3af8-6205854a33df	00030000-55ff-ab24-0e99-61ed05d4ee91
00020000-55ff-ab24-3af8-6205854a33df	00030000-55ff-ab24-15c9-6cd5f38f9124
00020000-55ff-ab24-3af8-6205854a33df	00030000-55ff-ab24-e40a-0f6de93e228e
00020000-55ff-ab24-3af8-6205854a33df	00030000-55ff-ab24-648f-283c376b8ad3
00020000-55ff-ab24-3af8-6205854a33df	00030000-55ff-ab24-d176-0b29200484b1
00020000-55ff-ab24-3af8-6205854a33df	00030000-55ff-ab24-aa37-3a148df06b1c
00020000-55ff-ab24-3af8-6205854a33df	00030000-55ff-ab24-55e2-ac3be5099862
00020000-55ff-ab24-3af8-6205854a33df	00030000-55ff-ab24-f19b-e32cd460c47f
00020000-55ff-ab24-3af8-6205854a33df	00030000-55ff-ab24-a440-e3326de0ff72
00020000-55ff-ab24-3af8-6205854a33df	00030000-55ff-ab24-c22d-d22ebdb019a3
00020000-55ff-ab24-3af8-6205854a33df	00030000-55ff-ab24-4769-0d6244c65006
00020000-55ff-ab24-3af8-6205854a33df	00030000-55ff-ab24-fd03-18e53de5217a
00020000-55ff-ab24-3af8-6205854a33df	00030000-55ff-ab24-70fc-c996b0b625b3
00020000-55ff-ab24-3af8-6205854a33df	00030000-55ff-ab24-ca51-c34ddb6ddb39
00020000-55ff-ab24-43fc-abbb6872f1f5	00030000-55ff-ab24-aec3-912cd68880be
00020000-55ff-ab24-43fc-abbb6872f1f5	00030000-55ff-ab24-9591-594ed939e1c4
00020000-55ff-ab24-43fc-abbb6872f1f5	00030000-55ff-ab24-934d-1322ddf5f87a
00020000-55ff-ab24-43fc-abbb6872f1f5	00030000-55ff-ab24-132d-35a5ddba3295
00020000-55ff-ab24-43fc-abbb6872f1f5	00030000-55ff-ab24-0e99-61ed05d4ee91
00020000-55ff-ab24-43fc-abbb6872f1f5	00030000-55ff-ab24-15c9-6cd5f38f9124
00020000-55ff-ab24-43fc-abbb6872f1f5	00030000-55ff-ab24-e40a-0f6de93e228e
00020000-55ff-ab24-43fc-abbb6872f1f5	00030000-55ff-ab24-648f-283c376b8ad3
00020000-55ff-ab24-43fc-abbb6872f1f5	00030000-55ff-ab24-d176-0b29200484b1
00020000-55ff-ab24-43fc-abbb6872f1f5	00030000-55ff-ab24-aa37-3a148df06b1c
00020000-55ff-ab24-43fc-abbb6872f1f5	00030000-55ff-ab24-55e2-ac3be5099862
00020000-55ff-ab24-43fc-abbb6872f1f5	00030000-55ff-ab24-f19b-e32cd460c47f
00020000-55ff-ab24-43fc-abbb6872f1f5	00030000-55ff-ab24-a440-e3326de0ff72
00020000-55ff-ab24-43fc-abbb6872f1f5	00030000-55ff-ab24-c22d-d22ebdb019a3
00020000-55ff-ab24-43fc-abbb6872f1f5	00030000-55ff-ab24-4769-0d6244c65006
00020000-55ff-ab24-43fc-abbb6872f1f5	00030000-55ff-ab24-6c4c-6b6373f2760d
00020000-55ff-ab24-43fc-abbb6872f1f5	00030000-55ff-ab24-cb9d-da1206e3e7ce
00020000-55ff-ab24-43fc-abbb6872f1f5	00030000-55ff-ab24-fd03-18e53de5217a
00020000-55ff-ab24-43fc-abbb6872f1f5	00030000-55ff-ab24-70fc-c996b0b625b3
00020000-55ff-ab24-43fc-abbb6872f1f5	00030000-55ff-ab24-ca51-c34ddb6ddb39
00020000-55ff-ab26-d1c9-c3ea7d75d478	00030000-55ff-ab24-15e5-032a604f8261
00020000-55ff-ab26-d1c9-c3ea7d75d478	00030000-55ff-ab24-4e97-e644085f4991
00020000-55ff-ab26-d1c9-c3ea7d75d478	00030000-55ff-ab24-cb9d-da1206e3e7ce
00020000-55ff-ab26-d1c9-c3ea7d75d478	00030000-55ff-ab24-9c37-32b445b737bb
00020000-55ff-ab26-d1c9-c3ea7d75d478	00030000-55ff-ab24-a1c1-fa0f95ab75fd
00020000-55ff-ab26-d1c9-c3ea7d75d478	00030000-55ff-ab24-6a2f-b1c91fdd8445
00020000-55ff-ab26-d1c9-c3ea7d75d478	00030000-55ff-ab24-76f9-a17154a024f1
00020000-55ff-ab26-d1c9-c3ea7d75d478	00030000-55ff-ab24-aec3-912cd68880be
00020000-55ff-ab26-d1c9-c3ea7d75d478	00030000-55ff-ab24-dd76-f06f3f82a2fc
00020000-55ff-ab26-d1c9-c3ea7d75d478	00030000-55ff-ab24-07ad-b408c7935a4a
00020000-55ff-ab26-d1c9-c3ea7d75d478	00030000-55ff-ab24-dffc-cf5087c32d9d
00020000-55ff-ab26-d1c9-c3ea7d75d478	00030000-55ff-ab24-9591-594ed939e1c4
00020000-55ff-ab26-d1c9-c3ea7d75d478	00030000-55ff-ab24-6c08-fea330630d70
00020000-55ff-ab26-d1c9-c3ea7d75d478	00030000-55ff-ab24-9afe-2c641ff5c17a
00020000-55ff-ab26-d1c9-c3ea7d75d478	00030000-55ff-ab24-b7a4-2c4ea52328df
00020000-55ff-ab26-d1c9-c3ea7d75d478	00030000-55ff-ab24-ff3b-e16c360812cd
00020000-55ff-ab26-d1c9-c3ea7d75d478	00030000-55ff-ab24-401a-1af5d0b7697e
00020000-55ff-ab26-d1c9-c3ea7d75d478	00030000-55ff-ab24-934d-1322ddf5f87a
00020000-55ff-ab26-d1c9-c3ea7d75d478	00030000-55ff-ab24-b730-9f5917414c25
00020000-55ff-ab26-d1c9-c3ea7d75d478	00030000-55ff-ab24-132d-35a5ddba3295
00020000-55ff-ab26-d1c9-c3ea7d75d478	00030000-55ff-ab24-4da0-ad71f8b0f748
00020000-55ff-ab26-d1c9-c3ea7d75d478	00030000-55ff-ab24-e395-597d3e6736e3
00020000-55ff-ab26-d1c9-c3ea7d75d478	00030000-55ff-ab24-269b-5d31af6d2804
00020000-55ff-ab26-d1c9-c3ea7d75d478	00030000-55ff-ab24-0221-a2778dd7e608
00020000-55ff-ab26-d1c9-c3ea7d75d478	00030000-55ff-ab24-d360-958489bcdf64
00020000-55ff-ab26-d1c9-c3ea7d75d478	00030000-55ff-ab24-fc9b-f68ef3581802
00020000-55ff-ab26-d1c9-c3ea7d75d478	00030000-55ff-ab24-1a0e-eaa94dda1898
00020000-55ff-ab26-d1c9-c3ea7d75d478	00030000-55ff-ab24-0e99-61ed05d4ee91
00020000-55ff-ab26-d1c9-c3ea7d75d478	00030000-55ff-ab24-1213-0bb5130d8ce2
00020000-55ff-ab26-d1c9-c3ea7d75d478	00030000-55ff-ab24-15c9-6cd5f38f9124
00020000-55ff-ab26-d1c9-c3ea7d75d478	00030000-55ff-ab24-c39b-b9c6270922be
00020000-55ff-ab26-d1c9-c3ea7d75d478	00030000-55ff-ab24-7479-a0fd024aba35
00020000-55ff-ab26-d1c9-c3ea7d75d478	00030000-55ff-ab24-d19f-8f2e6eff712c
00020000-55ff-ab26-d1c9-c3ea7d75d478	00030000-55ff-ab24-d935-1eb57b5f9b99
00020000-55ff-ab26-d1c9-c3ea7d75d478	00030000-55ff-ab24-95ec-217494949869
00020000-55ff-ab26-d1c9-c3ea7d75d478	00030000-55ff-ab24-caad-e9799ba61ca6
00020000-55ff-ab26-d1c9-c3ea7d75d478	00030000-55ff-ab24-a630-8ef2bfc0a423
00020000-55ff-ab26-d1c9-c3ea7d75d478	00030000-55ff-ab24-e40a-0f6de93e228e
00020000-55ff-ab26-d1c9-c3ea7d75d478	00030000-55ff-ab24-aa44-15d3aa592829
00020000-55ff-ab26-d1c9-c3ea7d75d478	00030000-55ff-ab24-648f-283c376b8ad3
00020000-55ff-ab26-d1c9-c3ea7d75d478	00030000-55ff-ab24-bd39-2a6cdfb5f212
00020000-55ff-ab26-d1c9-c3ea7d75d478	00030000-55ff-ab24-4cb1-1b8b525b2a4d
00020000-55ff-ab26-d1c9-c3ea7d75d478	00030000-55ff-ab24-0135-b557e85b3941
00020000-55ff-ab26-d1c9-c3ea7d75d478	00030000-55ff-ab24-5e1b-f60ec4f3cd9a
00020000-55ff-ab26-d1c9-c3ea7d75d478	00030000-55ff-ab24-9d4d-5f6a0d42abdd
00020000-55ff-ab26-d1c9-c3ea7d75d478	00030000-55ff-ab24-74a4-129dc63327cf
00020000-55ff-ab26-d1c9-c3ea7d75d478	00030000-55ff-ab24-dab9-5d2bd88468a8
00020000-55ff-ab26-d1c9-c3ea7d75d478	00030000-55ff-ab24-96f2-4cec3a2400d8
00020000-55ff-ab26-d1c9-c3ea7d75d478	00030000-55ff-ab24-4bce-ad123684c901
00020000-55ff-ab26-d1c9-c3ea7d75d478	00030000-55ff-ab24-d176-0b29200484b1
00020000-55ff-ab26-d1c9-c3ea7d75d478	00030000-55ff-ab24-86f5-3bca811c1755
00020000-55ff-ab26-d1c9-c3ea7d75d478	00030000-55ff-ab24-aa37-3a148df06b1c
00020000-55ff-ab26-d1c9-c3ea7d75d478	00030000-55ff-ab24-5a01-78b349116582
00020000-55ff-ab26-d1c9-c3ea7d75d478	00030000-55ff-ab24-4dd2-587617fbd514
00020000-55ff-ab26-d1c9-c3ea7d75d478	00030000-55ff-ab24-73f1-3fd051d76221
00020000-55ff-ab26-d1c9-c3ea7d75d478	00030000-55ff-ab24-9e29-f2dbb212101e
00020000-55ff-ab26-d1c9-c3ea7d75d478	00030000-55ff-ab24-6e87-82f5b9d6e31c
00020000-55ff-ab26-d1c9-c3ea7d75d478	00030000-55ff-ab24-6f2d-997862dee62b
00020000-55ff-ab26-d1c9-c3ea7d75d478	00030000-55ff-ab24-978c-e951e514419a
00020000-55ff-ab26-d1c9-c3ea7d75d478	00030000-55ff-ab24-55e2-ac3be5099862
00020000-55ff-ab26-d1c9-c3ea7d75d478	00030000-55ff-ab24-1634-aeefe5b263fd
00020000-55ff-ab26-d1c9-c3ea7d75d478	00030000-55ff-ab24-84a1-6dcf9477a7dc
00020000-55ff-ab26-d1c9-c3ea7d75d478	00030000-55ff-ab24-7dd3-f73635f52871
00020000-55ff-ab26-d1c9-c3ea7d75d478	00030000-55ff-ab24-eb01-1774ce4f0ca1
00020000-55ff-ab26-d1c9-c3ea7d75d478	00030000-55ff-ab24-abd8-1b318543c387
00020000-55ff-ab26-d1c9-c3ea7d75d478	00030000-55ff-ab24-6d8e-d3a88f3cbaa7
00020000-55ff-ab26-d1c9-c3ea7d75d478	00030000-55ff-ab24-7690-c0f63df69214
00020000-55ff-ab26-d1c9-c3ea7d75d478	00030000-55ff-ab24-90fa-3fb1dc5de41d
00020000-55ff-ab26-d1c9-c3ea7d75d478	00030000-55ff-ab24-0aff-1b7a00878b0b
00020000-55ff-ab26-d1c9-c3ea7d75d478	00030000-55ff-ab24-ad9c-0dbdba106df2
00020000-55ff-ab26-d1c9-c3ea7d75d478	00030000-55ff-ab24-2a6b-8f2e8d06b1d9
00020000-55ff-ab26-d1c9-c3ea7d75d478	00030000-55ff-ab24-e6c9-49d24e978aa4
00020000-55ff-ab26-d1c9-c3ea7d75d478	00030000-55ff-ab24-84a8-3e1bdfe4d2ab
00020000-55ff-ab26-d1c9-c3ea7d75d478	00030000-55ff-ab24-04a4-0d81faca1ffb
00020000-55ff-ab26-d1c9-c3ea7d75d478	00030000-55ff-ab24-ca71-c7b25df7c56d
00020000-55ff-ab26-d1c9-c3ea7d75d478	00030000-55ff-ab24-b87f-43fe01b70077
00020000-55ff-ab26-d1c9-c3ea7d75d478	00030000-55ff-ab24-f5cc-5564ce3f278c
00020000-55ff-ab26-d1c9-c3ea7d75d478	00030000-55ff-ab24-6576-b0286ac2e328
00020000-55ff-ab26-d1c9-c3ea7d75d478	00030000-55ff-ab24-1aff-6e7fc5cfcae4
00020000-55ff-ab26-d1c9-c3ea7d75d478	00030000-55ff-ab24-02a6-ab64e61149a2
00020000-55ff-ab26-d1c9-c3ea7d75d478	00030000-55ff-ab24-866e-c0d4f9def34a
00020000-55ff-ab26-d1c9-c3ea7d75d478	00030000-55ff-ab24-3a34-13069f66358c
00020000-55ff-ab26-d1c9-c3ea7d75d478	00030000-55ff-ab24-6db4-159478bf63ac
00020000-55ff-ab26-d1c9-c3ea7d75d478	00030000-55ff-ab24-0f81-68a904162887
00020000-55ff-ab26-d1c9-c3ea7d75d478	00030000-55ff-ab24-3998-4f14c49e5df4
00020000-55ff-ab26-d1c9-c3ea7d75d478	00030000-55ff-ab24-88c9-7020af01e7f7
00020000-55ff-ab26-d1c9-c3ea7d75d478	00030000-55ff-ab24-4591-bce842f2887b
00020000-55ff-ab26-d1c9-c3ea7d75d478	00030000-55ff-ab24-f19b-e32cd460c47f
00020000-55ff-ab26-d1c9-c3ea7d75d478	00030000-55ff-ab24-2f28-c4691a6ed396
00020000-55ff-ab26-d1c9-c3ea7d75d478	00030000-55ff-ab24-d345-46ab808f6708
00020000-55ff-ab26-d1c9-c3ea7d75d478	00030000-55ff-ab24-8c8f-106dfa4dafd7
00020000-55ff-ab26-d1c9-c3ea7d75d478	00030000-55ff-ab24-2008-ec29ba403dd9
00020000-55ff-ab26-d1c9-c3ea7d75d478	00030000-55ff-ab24-74af-ef1f779254a9
00020000-55ff-ab26-d1c9-c3ea7d75d478	00030000-55ff-ab24-a440-e3326de0ff72
00020000-55ff-ab26-d1c9-c3ea7d75d478	00030000-55ff-ab24-158c-e66d647a2d97
00020000-55ff-ab26-d1c9-c3ea7d75d478	00030000-55ff-ab24-c22d-d22ebdb019a3
00020000-55ff-ab26-d1c9-c3ea7d75d478	00030000-55ff-ab24-d94f-8640be58cab4
00020000-55ff-ab26-d1c9-c3ea7d75d478	00030000-55ff-ab24-c788-fce9f9c44b2a
00020000-55ff-ab26-d1c9-c3ea7d75d478	00030000-55ff-ab24-bf25-a6d38ce5fead
00020000-55ff-ab26-d1c9-c3ea7d75d478	00030000-55ff-ab24-5561-b4b0431611dc
00020000-55ff-ab26-d1c9-c3ea7d75d478	00030000-55ff-ab24-a030-be61e40bbb96
00020000-55ff-ab26-d1c9-c3ea7d75d478	00030000-55ff-ab24-c8ce-40f39240475d
00020000-55ff-ab26-d1c9-c3ea7d75d478	00030000-55ff-ab24-0d56-1f1219314be1
00020000-55ff-ab26-d1c9-c3ea7d75d478	00030000-55ff-ab24-6310-1bd78a364ac6
00020000-55ff-ab26-d1c9-c3ea7d75d478	00030000-55ff-ab24-2340-e93c61754661
00020000-55ff-ab26-d1c9-c3ea7d75d478	00030000-55ff-ab24-4769-0d6244c65006
00020000-55ff-ab26-d1c9-c3ea7d75d478	00030000-55ff-ab24-fa57-fca350f99bf5
00020000-55ff-ab26-d1c9-c3ea7d75d478	00030000-55ff-ab24-d15a-c41cd0d844e1
00020000-55ff-ab26-d1c9-c3ea7d75d478	00030000-55ff-ab24-64aa-00f76ac3c525
00020000-55ff-ab26-d1c9-c3ea7d75d478	00030000-55ff-ab24-e188-550b89eb419c
00020000-55ff-ab26-d1c9-c3ea7d75d478	00030000-55ff-ab24-79ff-8c3d54f215a7
00020000-55ff-ab26-d1c9-c3ea7d75d478	00030000-55ff-ab24-35a5-5c419a081168
00020000-55ff-ab26-d1c9-c3ea7d75d478	00030000-55ff-ab24-a886-a709de0faf0f
00020000-55ff-ab26-d1c9-c3ea7d75d478	00030000-55ff-ab24-9efb-b565f04109e9
00020000-55ff-ab26-d1c9-c3ea7d75d478	00030000-55ff-ab24-da23-17766538fb2f
00020000-55ff-ab26-d1c9-c3ea7d75d478	00030000-55ff-ab24-fc0e-05e86e6c6c08
00020000-55ff-ab26-d1c9-c3ea7d75d478	00030000-55ff-ab24-deca-d9fed81f4e4c
00020000-55ff-ab26-d1c9-c3ea7d75d478	00030000-55ff-ab24-6c4c-6b6373f2760d
00020000-55ff-ab26-d1c9-c3ea7d75d478	00030000-55ff-ab24-befc-93832f905ac2
00020000-55ff-ab26-d1c9-c3ea7d75d478	00030000-55ff-ab24-fd03-18e53de5217a
00020000-55ff-ab26-d1c9-c3ea7d75d478	00030000-55ff-ab24-6c19-211036d797d8
00020000-55ff-ab26-d1c9-c3ea7d75d478	00030000-55ff-ab24-3fd8-34e6e5b85a17
00020000-55ff-ab26-d1c9-c3ea7d75d478	00030000-55ff-ab24-3e1a-1752cdd2d24b
00020000-55ff-ab26-d1c9-c3ea7d75d478	00030000-55ff-ab24-a1e6-1335eb2c3ecb
00020000-55ff-ab26-d1c9-c3ea7d75d478	00030000-55ff-ab24-5dd8-ec924b9a559a
00020000-55ff-ab26-d1c9-c3ea7d75d478	00030000-55ff-ab24-6bfa-4451c5fe6308
00020000-55ff-ab26-d1c9-c3ea7d75d478	00030000-55ff-ab24-602f-94342f608478
00020000-55ff-ab26-d1c9-c3ea7d75d478	00030000-55ff-ab24-7e34-7dbeb9dc12fa
00020000-55ff-ab26-d1c9-c3ea7d75d478	00030000-55ff-ab24-6108-4ba95d5db786
00020000-55ff-ab26-d1c9-c3ea7d75d478	00030000-55ff-ab24-7acf-b37731e2dff4
00020000-55ff-ab26-d1c9-c3ea7d75d478	00030000-55ff-ab24-14bb-84880de0d32d
00020000-55ff-ab26-d1c9-c3ea7d75d478	00030000-55ff-ab24-b1d1-a740542e69d1
00020000-55ff-ab26-d1c9-c3ea7d75d478	00030000-55ff-ab24-4f4d-bf118cd1da97
00020000-55ff-ab26-d1c9-c3ea7d75d478	00030000-55ff-ab24-4202-20dedb2b2ec1
00020000-55ff-ab26-d1c9-c3ea7d75d478	00030000-55ff-ab24-134d-4e25905b2fd9
00020000-55ff-ab26-d1c9-c3ea7d75d478	00030000-55ff-ab24-2efd-322731b2a7e9
00020000-55ff-ab26-d1c9-c3ea7d75d478	00030000-55ff-ab24-7fd1-cf067fe27c10
00020000-55ff-ab26-d1c9-c3ea7d75d478	00030000-55ff-ab24-70fc-c996b0b625b3
00020000-55ff-ab26-d1c9-c3ea7d75d478	00030000-55ff-ab24-866e-c955d73bf0f7
00020000-55ff-ab26-d1c9-c3ea7d75d478	00030000-55ff-ab24-ca51-c34ddb6ddb39
00020000-55ff-ab26-d1c9-c3ea7d75d478	00030000-55ff-ab24-f9da-47539b2f28f7
\.


--
-- TOC entry 2999 (class 0 OID 20212515)
-- Dependencies: 209
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 3003 (class 0 OID 20212549)
-- Dependencies: 213
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 3015 (class 0 OID 20212683)
-- Dependencies: 225
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, zacetek, konec, jeavtorskepravice, placilonavajo, vrednostvaje, planiranostevilovaj, vrednostvaj, vrednostpredstave, vrednostdopremiere, aktivna, zaposlenvdrjz, samozaposlen, igralec, opis) FROM stdin;
000b0000-55ff-ab26-cefd-7e6dda8d52b1	00090000-55ff-ab26-eee9-fe2e3153c913	\N	\N	0001	\N	\N	f	f	10.00	3	10.00	30.00	10.00	t	t	f	t	Pogodba o sodelovanju
000b0000-55ff-ab26-905a-cfc916ce1ad4	00090000-55ff-ab26-2432-918370df2ef1	\N	\N	0002	\N	\N	f	t	11.00	10	11.00	31.00	110.00	t	f	t	t	Pogodba za vlogo Helena
000b0000-55ff-ab26-b46d-249c6009d9c1	00090000-55ff-ab26-db68-3b9cdebb37ba	\N	\N	0003	\N	\N	f	f	12.00	4	12.00	32.00	12.00	t	f	t	f	Pogodba za lektoriranje
000b0000-55ff-ab26-6f41-53382ee5f253	00090000-55ff-ab26-34e2-6c2f70224f6a	\N	\N	0004	\N	\N	t	f	0.00	2	300.00	30.00	300.00	t	f	t	f	Pogodba za avtorske pravice
\.


--
-- TOC entry 2975 (class 0 OID 20212250)
-- Dependencies: 185
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, drzava_id, sifra, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo, nvo) FROM stdin;
00080000-55ff-ab26-cf67-42b24dbfbec0	00040000-55ff-ab24-d904-ef48d79bc0bd	0988	AK	Juhuhu d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55ff-ab26-b50f-a4ce06b85279	00040000-55ff-ab24-d904-ef48d79bc0bd	0989	AK	Hopsasa d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	t
00080000-55ff-ab26-6e1d-19d13e51427d	00040000-55ff-ab24-d904-ef48d79bc0bd	0987	AK	Gledališče Šrum d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55ff-ab26-1aba-0ff480686bed	00040000-55ff-ab24-d904-ef48d79bc0bd	0986	AK	Lutkovni Direndaj d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55ff-ab26-6167-118cd1275b22	00040000-55ff-ab24-d904-ef48d79bc0bd	0985	AK	Tatjana Stanič, Lektoriranje, s.p.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55ff-ab26-3af1-d17ecc2c43b0	00040000-55ff-ab24-5de1-2003bf14aad7	0984	AK	Gledališče Lepote tvoje		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55ff-ab26-0120-33d1c563e5f1	00040000-55ff-ab24-6928-d0860182b4c2	0983	AK	Sunce naše		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55ff-ab26-f3b5-ba5f25ebd1a4	00040000-55ff-ab24-d364-fcc43b771b6d	0982	AK	Theater Amadeus		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55ff-ab26-bbbe-89b7e0a89a78	00040000-55ff-ab24-f816-ce694708ad38	9999	AK	Fuchs		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55ff-ab27-7f33-241c59046260	00040000-55ff-ab24-d904-ef48d79bc0bd	1001	AK	Gledališče Matica		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
\.


--
-- TOC entry 2977 (class 0 OID 20212284)
-- Dependencies: 187
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-55ff-ab24-4ed7-6d88797c73a4	8341	Adlešiči
00050000-55ff-ab24-6a29-e0277456679c	5270	Ajdovščina
00050000-55ff-ab24-d05e-f3b3128bc673	6280	Ankaran/Ancarano
00050000-55ff-ab24-3cdb-1ddc0b8f6594	9253	Apače
00050000-55ff-ab24-d206-fd5093b950c3	8253	Artiče
00050000-55ff-ab24-dcbc-e802317bad0c	4275	Begunje na Gorenjskem
00050000-55ff-ab24-fa4e-aedaab59674b	1382	Begunje pri Cerknici
00050000-55ff-ab24-3e8c-cefe22f9c2b8	9231	Beltinci
00050000-55ff-ab24-b73e-374a1f54397a	2234	Benedikt
00050000-55ff-ab24-7276-d715464c0144	2345	Bistrica ob Dravi
00050000-55ff-ab24-f7a0-ce26158a4dd6	3256	Bistrica ob Sotli
00050000-55ff-ab24-165c-6899061dc9e3	8259	Bizeljsko
00050000-55ff-ab24-d13c-cd1758cb2826	1223	Blagovica
00050000-55ff-ab24-ddde-6bfedd1b5e50	8283	Blanca
00050000-55ff-ab24-f2bb-a06a872e1ee3	4260	Bled
00050000-55ff-ab24-7ce6-b57947303780	4273	Blejska Dobrava
00050000-55ff-ab24-75b6-9ac82d98c25b	9265	Bodonci
00050000-55ff-ab24-b231-833f53f21f9a	9222	Bogojina
00050000-55ff-ab24-be35-ce7adba33af5	4263	Bohinjska Bela
00050000-55ff-ab24-2b79-3bcf6801ccf7	4264	Bohinjska Bistrica
00050000-55ff-ab24-2aba-b8ece4771f92	4265	Bohinjsko jezero
00050000-55ff-ab24-b3e5-0407a8067cf1	1353	Borovnica
00050000-55ff-ab24-0adc-25b863e6ce72	8294	Boštanj
00050000-55ff-ab24-277c-0311b85f3185	5230	Bovec
00050000-55ff-ab24-2b7f-0679b1a43feb	5295	Branik
00050000-55ff-ab24-ff37-383337c05725	3314	Braslovče
00050000-55ff-ab24-fadc-f8aa30b1beab	5223	Breginj
00050000-55ff-ab24-80db-c792d95f29b1	8280	Brestanica
00050000-55ff-ab24-09e7-b151b365b3db	2354	Bresternica
00050000-55ff-ab24-4409-4ba57f5c84a2	4243	Brezje
00050000-55ff-ab24-50d2-c9940cab877f	1351	Brezovica pri Ljubljani
00050000-55ff-ab24-035f-668f6906e5c5	8250	Brežice
00050000-55ff-ab24-2371-83615b718902	4210	Brnik - Aerodrom
00050000-55ff-ab24-f074-6d15e92a9293	8321	Brusnice
00050000-55ff-ab24-aa93-ca42167c8e7d	3255	Buče
00050000-55ff-ab24-70dc-e002a1250fa6	8276	Bučka 
00050000-55ff-ab24-6c1e-c3b380bdfb12	9261	Cankova
00050000-55ff-ab24-b217-4ef43381b5ab	3000	Celje 
00050000-55ff-ab24-166d-e1fd2363eb93	3001	Celje - poštni predali
00050000-55ff-ab24-3dc8-63936ef8bb9e	4207	Cerklje na Gorenjskem
00050000-55ff-ab24-38f5-c822cc3d6a67	8263	Cerklje ob Krki
00050000-55ff-ab24-4446-661462d8c299	1380	Cerknica
00050000-55ff-ab24-9ad1-b93d7ede44fd	5282	Cerkno
00050000-55ff-ab24-d008-921e3035a2f3	2236	Cerkvenjak
00050000-55ff-ab24-3e61-bd20212a950f	2215	Ceršak
00050000-55ff-ab24-347c-4016c353d098	2326	Cirkovce
00050000-55ff-ab24-bc46-c6afcb454347	2282	Cirkulane
00050000-55ff-ab24-f456-d8eadf2a0b6d	5273	Col
00050000-55ff-ab24-df31-e0f52909dda3	8251	Čatež ob Savi
00050000-55ff-ab24-008d-3f513fa6c972	1413	Čemšenik
00050000-55ff-ab24-d8eb-87c9d38e035c	5253	Čepovan
00050000-55ff-ab24-3dd6-d8df991bc000	9232	Črenšovci
00050000-55ff-ab24-228d-d4edd380fba6	2393	Črna na Koroškem
00050000-55ff-ab24-33fd-39bf5a5df1d9	6275	Črni Kal
00050000-55ff-ab24-7c40-ac852b700b2c	5274	Črni Vrh nad Idrijo
00050000-55ff-ab24-119e-fbd36f515406	5262	Črniče
00050000-55ff-ab24-2cd2-efd1c3884805	8340	Črnomelj
00050000-55ff-ab24-92a5-e5652ec46fe5	6271	Dekani
00050000-55ff-ab24-60ce-cac89a21ed18	5210	Deskle
00050000-55ff-ab24-f480-40cfc4ba533e	2253	Destrnik
00050000-55ff-ab24-23f6-a7687c203234	6215	Divača
00050000-55ff-ab24-9837-de0b7fb07cf2	1233	Dob
00050000-55ff-ab24-f8dc-3186b2890c10	3224	Dobje pri Planini
00050000-55ff-ab24-5997-fc2afd789309	8257	Dobova
00050000-55ff-ab24-84b9-a2f9dec74f75	1423	Dobovec
00050000-55ff-ab24-dece-cb3f1c08c9e5	5263	Dobravlje
00050000-55ff-ab24-3957-21e9ffa83f20	3204	Dobrna
00050000-55ff-ab24-6dc4-9c72845af6ea	8211	Dobrnič
00050000-55ff-ab24-bb48-208f667eeaa5	1356	Dobrova
00050000-55ff-ab24-e3ee-3f554406b437	9223	Dobrovnik/Dobronak 
00050000-55ff-ab24-be54-b7f8a831cc1d	5212	Dobrovo v Brdih
00050000-55ff-ab24-dc47-2da1bd760d4e	1431	Dol pri Hrastniku
00050000-55ff-ab24-6e23-761be39db24a	1262	Dol pri Ljubljani
00050000-55ff-ab24-b8ba-00dcb7959dc3	1273	Dole pri Litiji
00050000-55ff-ab24-faa9-920037748e02	1331	Dolenja vas
00050000-55ff-ab24-f8a7-fcc69cffba45	8350	Dolenjske Toplice
00050000-55ff-ab24-005b-f3ffef035617	1230	Domžale
00050000-55ff-ab24-aa55-487e9ebf9211	2252	Dornava
00050000-55ff-ab24-b7e2-854885835fba	5294	Dornberk
00050000-55ff-ab24-59e6-0f99f9514d3d	1319	Draga
00050000-55ff-ab24-8c69-51d0aae16b0e	8343	Dragatuš
00050000-55ff-ab24-0444-938230b079fb	3222	Dramlje
00050000-55ff-ab24-5831-cffd0c3efdfd	2370	Dravograd
00050000-55ff-ab24-b723-d80482cbcd9d	4203	Duplje
00050000-55ff-ab24-fc89-79288407b9a3	6221	Dutovlje
00050000-55ff-ab24-79ae-fdfab239b624	8361	Dvor
00050000-55ff-ab24-3980-ec8df961a8cc	2343	Fala
00050000-55ff-ab24-521e-7844da87e69a	9208	Fokovci
00050000-55ff-ab24-2d65-0bf9fc5c7be9	2313	Fram
00050000-55ff-ab24-037e-ca55b1cad5dd	3213	Frankolovo
00050000-55ff-ab24-1da4-d8ad4130dc51	1274	Gabrovka
00050000-55ff-ab24-9087-f3acdc166e17	8254	Globoko
00050000-55ff-ab24-78cf-955e9e69edf0	5275	Godovič
00050000-55ff-ab24-ad24-09414ffaca2b	4204	Golnik
00050000-55ff-ab24-f48f-65ec35888b3b	3303	Gomilsko
00050000-55ff-ab24-43c3-1d6407783c35	4224	Gorenja vas
00050000-55ff-ab24-474d-a6a2ea164b61	3263	Gorica pri Slivnici
00050000-55ff-ab24-a792-d0ce6c29e794	2272	Gorišnica
00050000-55ff-ab24-0ef1-41b9a3445435	9250	Gornja Radgona
00050000-55ff-ab24-c293-ab9620cadfe3	3342	Gornji Grad
00050000-55ff-ab24-9c86-2472c76354b1	4282	Gozd Martuljek
00050000-55ff-ab24-1963-dd5cb9e5826f	6272	Gračišče
00050000-55ff-ab24-b2df-139b7d3ebc15	9264	Grad
00050000-55ff-ab24-7e63-2fc7ef5f168e	8332	Gradac
00050000-55ff-ab24-b55b-0d1f01505f10	1384	Grahovo
00050000-55ff-ab24-52a5-b91de2811f61	5242	Grahovo ob Bači
00050000-55ff-ab24-748a-5369fd916313	5251	Grgar
00050000-55ff-ab24-384b-2fa27fae6559	3302	Griže
00050000-55ff-ab24-d5b6-5f0f04049441	3231	Grobelno
00050000-55ff-ab24-6a79-c67680a04b2f	1290	Grosuplje
00050000-55ff-ab24-65e7-0ce80f14dab1	2288	Hajdina
00050000-55ff-ab24-a7ac-592e41a118a1	8362	Hinje
00050000-55ff-ab24-6f43-e2ed38ea630d	2311	Hoče
00050000-55ff-ab24-847a-9e2516846e4f	9205	Hodoš/Hodos
00050000-55ff-ab24-fbd7-412ee764e96b	1354	Horjul
00050000-55ff-ab24-48d2-889e6fc20226	1372	Hotedršica
00050000-55ff-ab24-ccf7-4ef8e750e4d3	1430	Hrastnik
00050000-55ff-ab24-d37b-e74a772d7670	6225	Hruševje
00050000-55ff-ab24-047a-d1b0fa03efb4	4276	Hrušica
00050000-55ff-ab24-0ea4-6c6b0f8bb460	5280	Idrija
00050000-55ff-ab24-67aa-69fd2020ddaf	1292	Ig
00050000-55ff-ab24-03fd-e4ab79de0ef1	6250	Ilirska Bistrica
00050000-55ff-ab24-1444-c0a36ed322e5	6251	Ilirska Bistrica-Trnovo
00050000-55ff-ab24-ba59-4a8f15e0ce9a	1295	Ivančna Gorica
00050000-55ff-ab24-2146-91c5a99adfd0	2259	Ivanjkovci
00050000-55ff-ab24-034a-825cd871e677	1411	Izlake
00050000-55ff-ab24-d027-e9aa36f3801e	6310	Izola/Isola
00050000-55ff-ab24-f865-4a0685b1b5e5	2222	Jakobski Dol
00050000-55ff-ab24-f15c-89cc8f3a2bb3	2221	Jarenina
00050000-55ff-ab24-b519-0b249b0fc6f1	6254	Jelšane
00050000-55ff-ab24-818e-7ab94242fff3	4270	Jesenice
00050000-55ff-ab24-433e-a6f59e816727	8261	Jesenice na Dolenjskem
00050000-55ff-ab24-914f-9a1c896a5734	3273	Jurklošter
00050000-55ff-ab24-a255-36633beb19e5	2223	Jurovski Dol
00050000-55ff-ab24-d260-5cb14b3ca17e	2256	Juršinci
00050000-55ff-ab24-bf07-e5aac356a60a	5214	Kal nad Kanalom
00050000-55ff-ab24-0b5f-6347566c264b	3233	Kalobje
00050000-55ff-ab24-7323-af1942e5bb97	4246	Kamna Gorica
00050000-55ff-ab24-8957-a8462a9ee869	2351	Kamnica
00050000-55ff-ab24-b3fc-b72b98164883	1241	Kamnik
00050000-55ff-ab24-4fc4-650991ac3d3b	5213	Kanal
00050000-55ff-ab24-3abc-488cf09da466	8258	Kapele
00050000-55ff-ab24-0963-faf5c8ea9c8e	2362	Kapla
00050000-55ff-ab24-b1cf-1dbe8e7c98ad	2325	Kidričevo
00050000-55ff-ab24-340f-806202844940	1412	Kisovec
00050000-55ff-ab24-cc95-82d60a5c98ed	6253	Knežak
00050000-55ff-ab24-db93-5840f56ff918	5222	Kobarid
00050000-55ff-ab24-5b95-4d0ed1c692a2	9227	Kobilje
00050000-55ff-ab24-fde5-75cfab072969	1330	Kočevje
00050000-55ff-ab24-4054-5f5e6ce8c312	1338	Kočevska Reka
00050000-55ff-ab24-7238-76dfd4da7a86	2276	Kog
00050000-55ff-ab24-270c-dffd0b36f68f	5211	Kojsko
00050000-55ff-ab24-cdfe-401220ee8774	6223	Komen
00050000-55ff-ab24-0728-d7bf51ce7f0d	1218	Komenda
00050000-55ff-ab24-d7a8-135ec21edcda	6000	Koper/Capodistria 
00050000-55ff-ab24-8a5c-aeb836159478	6001	Koper/Capodistria - poštni predali
00050000-55ff-ab24-905c-76c39227a1b9	8282	Koprivnica
00050000-55ff-ab24-e062-09b8ce25f95f	5296	Kostanjevica na Krasu
00050000-55ff-ab24-d201-97f65ec06c32	8311	Kostanjevica na Krki
00050000-55ff-ab24-386e-8bacbffaf91c	1336	Kostel
00050000-55ff-ab24-2e3a-a4c3f76943f2	6256	Košana
00050000-55ff-ab24-1333-81de691acc61	2394	Kotlje
00050000-55ff-ab24-8632-a0438dcb6c85	6240	Kozina
00050000-55ff-ab24-29e8-aa64d75d5e39	3260	Kozje
00050000-55ff-ab24-3604-0f535f425330	4000	Kranj 
00050000-55ff-ab24-4b5e-9f06f9b59d37	4001	Kranj - poštni predali
00050000-55ff-ab24-e040-2dba44f0adcb	4280	Kranjska Gora
00050000-55ff-ab24-7749-910547f17d0a	1281	Kresnice
00050000-55ff-ab24-b68f-42b19a5ac237	4294	Križe
00050000-55ff-ab24-3561-4529238ac1ac	9206	Križevci
00050000-55ff-ab24-7194-71316e6222e8	9242	Križevci pri Ljutomeru
00050000-55ff-ab24-173b-328b01f83388	1301	Krka
00050000-55ff-ab24-2cf3-491c176024da	8296	Krmelj
00050000-55ff-ab24-6b26-868993113f20	4245	Kropa
00050000-55ff-ab24-0730-971a45e8b63e	8262	Krška vas
00050000-55ff-ab24-e4dc-198cf659630b	8270	Krško
00050000-55ff-ab24-ec6f-be5e4fcdcafc	9263	Kuzma
00050000-55ff-ab24-4ca1-d8d772661943	2318	Laporje
00050000-55ff-ab24-6eb4-e67aa2ab547d	3270	Laško
00050000-55ff-ab24-2bf1-d12b6acc91e7	1219	Laze v Tuhinju
00050000-55ff-ab24-acf5-8dd301f7d872	2230	Lenart v Slovenskih goricah
00050000-55ff-ab24-4f13-429f73a22157	9220	Lendava/Lendva
00050000-55ff-ab24-06e6-5b06c70ef0ec	4248	Lesce
00050000-55ff-ab24-581b-559589a962bc	3261	Lesično
00050000-55ff-ab24-8315-fe42b5791457	8273	Leskovec pri Krškem
00050000-55ff-ab24-efb6-6b80c029b53b	2372	Libeliče
00050000-55ff-ab24-0a67-a83b9def7955	2341	Limbuš
00050000-55ff-ab24-47b9-3be9d2718403	1270	Litija
00050000-55ff-ab24-270c-33c044bd7205	3202	Ljubečna
00050000-55ff-ab24-8920-d2f2227d7503	1000	Ljubljana 
00050000-55ff-ab24-937c-0a8a5fc919a3	1001	Ljubljana - poštni predali
00050000-55ff-ab24-21e6-ea1b0be455d3	1231	Ljubljana - Črnuče
00050000-55ff-ab24-27e5-5f830c73dc11	1261	Ljubljana - Dobrunje
00050000-55ff-ab24-b2dc-f38adbdd869d	1260	Ljubljana - Polje
00050000-55ff-ab24-fa92-5d592d884c90	1210	Ljubljana - Šentvid
00050000-55ff-ab24-3c1e-68383d365fd0	1211	Ljubljana - Šmartno
00050000-55ff-ab24-9533-98a4a9d39424	3333	Ljubno ob Savinji
00050000-55ff-ab24-0f7b-cf84cb30941f	9240	Ljutomer
00050000-55ff-ab24-408e-4907b4138360	3215	Loče
00050000-55ff-ab24-65cb-ad0473c21670	5231	Log pod Mangartom
00050000-55ff-ab24-67f3-5f9ed35c258e	1358	Log pri Brezovici
00050000-55ff-ab24-fc73-60e2e39d837a	1370	Logatec
00050000-55ff-ab24-0c75-a710ac62b6bc	1371	Logatec
00050000-55ff-ab24-1e59-43bc2a507fdf	1434	Loka pri Zidanem Mostu
00050000-55ff-ab24-0dfb-ca7acc20ebc2	3223	Loka pri Žusmu
00050000-55ff-ab24-56a3-d02804450c1a	6219	Lokev
00050000-55ff-ab24-c30a-8639c83b4a4c	1318	Loški Potok
00050000-55ff-ab24-ac68-ec89a189abc3	2324	Lovrenc na Dravskem polju
00050000-55ff-ab24-d3be-998818936f92	2344	Lovrenc na Pohorju
00050000-55ff-ab24-298d-e54b5abd022d	3334	Luče
00050000-55ff-ab24-8290-5d55f048bf2d	1225	Lukovica
00050000-55ff-ab24-0edc-1556329d1b2d	9202	Mačkovci
00050000-55ff-ab24-d219-91eb12ecb5eb	2322	Majšperk
00050000-55ff-ab24-ecf5-d99511d7e1fe	2321	Makole
00050000-55ff-ab24-a073-d8794bb73672	9243	Mala Nedelja
00050000-55ff-ab24-7b5d-234a505b6f86	2229	Malečnik
00050000-55ff-ab24-4ae2-b675b01488a2	6273	Marezige
00050000-55ff-ab24-d73c-2fda1303c200	2000	Maribor 
00050000-55ff-ab24-086f-a678f2ac1808	2001	Maribor - poštni predali
00050000-55ff-ab24-6e62-5429d6ac72a5	2206	Marjeta na Dravskem polju
00050000-55ff-ab24-4852-7dcc0c52effc	2281	Markovci
00050000-55ff-ab24-dc85-9a515a6da238	9221	Martjanci
00050000-55ff-ab24-811c-a397f903564d	6242	Materija
00050000-55ff-ab24-ec89-f96960e1f795	4211	Mavčiče
00050000-55ff-ab24-ae9b-d7e463768205	1215	Medvode
00050000-55ff-ab24-552d-bb53e8262a2e	1234	Mengeš
00050000-55ff-ab24-f69c-4cc014188fd7	8330	Metlika
00050000-55ff-ab24-7d75-0af0f180ccf3	2392	Mežica
00050000-55ff-ab24-bc00-51b1b781f1e4	2204	Miklavž na Dravskem polju
00050000-55ff-ab24-8ff2-10b232c46358	2275	Miklavž pri Ormožu
00050000-55ff-ab24-c6f7-9fe9eace976e	5291	Miren
00050000-55ff-ab24-d04c-89ddd3f52781	8233	Mirna
00050000-55ff-ab24-c2da-a5bf75d51d14	8216	Mirna Peč
00050000-55ff-ab24-20b2-9f665fa74d23	2382	Mislinja
00050000-55ff-ab24-4c14-61c319a53119	4281	Mojstrana
00050000-55ff-ab24-6391-4865f0c63c9e	8230	Mokronog
00050000-55ff-ab24-38ac-ef21b1ef2b7d	1251	Moravče
00050000-55ff-ab24-5323-b5085260c567	9226	Moravske Toplice
00050000-55ff-ab24-8363-82ed28ae9579	5216	Most na Soči
00050000-55ff-ab24-c97c-e37af649189f	1221	Motnik
00050000-55ff-ab24-5994-2baab5b960a1	3330	Mozirje
00050000-55ff-ab24-df17-6ba07e3aa017	9000	Murska Sobota 
00050000-55ff-ab24-982c-035ed42ece46	9001	Murska Sobota - poštni predali
00050000-55ff-ab24-daf3-9927580e53c7	2366	Muta
00050000-55ff-ab24-e10d-6ac559d124eb	4202	Naklo
00050000-55ff-ab24-2fb0-4936faa74304	3331	Nazarje
00050000-55ff-ab24-6dc6-9441db77bf75	1357	Notranje Gorice
00050000-55ff-ab24-811f-651e7f613bb4	3203	Nova Cerkev
00050000-55ff-ab24-1e79-152e927f71fc	5000	Nova Gorica 
00050000-55ff-ab24-e62c-1589fabe834d	5001	Nova Gorica - poštni predali
00050000-55ff-ab24-a73b-5009ca86a1e0	1385	Nova vas
00050000-55ff-ab24-1ca5-bfd19ccbb170	8000	Novo mesto
00050000-55ff-ab24-466b-aafac7eb62de	8001	Novo mesto - poštni predali
00050000-55ff-ab24-a21f-b8073de19e55	6243	Obrov
00050000-55ff-ab24-9982-7b3ab424cc6d	9233	Odranci
00050000-55ff-ab24-991d-676dd70af168	2317	Oplotnica
00050000-55ff-ab24-17f7-26ac3e49bb84	2312	Orehova vas
00050000-55ff-ab24-b41c-e7f432cf6ecf	2270	Ormož
00050000-55ff-ab24-eab3-a3bf033c0f0f	1316	Ortnek
00050000-55ff-ab24-198f-7592d95b8355	1337	Osilnica
00050000-55ff-ab24-8fd3-2ef7040e13d9	8222	Otočec
00050000-55ff-ab24-c2c9-036c396cb17f	2361	Ožbalt
00050000-55ff-ab24-891b-8e981855c681	2231	Pernica
00050000-55ff-ab24-c2fd-a1d417bc23e0	2211	Pesnica pri Mariboru
00050000-55ff-ab24-d32d-ece5a4972dd7	9203	Petrovci
00050000-55ff-ab24-d5fb-7ee1d512eb11	3301	Petrovče
00050000-55ff-ab24-d969-740463e50dcb	6330	Piran/Pirano
00050000-55ff-ab24-da2a-86b4e5db0a5b	8255	Pišece
00050000-55ff-ab24-7680-5b2dc0ad0aae	6257	Pivka
00050000-55ff-ab24-8c3a-3ff7c1af4f07	6232	Planina
00050000-55ff-ab24-ef69-a3ba7b064c48	3225	Planina pri Sevnici
00050000-55ff-ab24-1f6c-edc4eab68d72	6276	Pobegi
00050000-55ff-ab24-5a71-4877a7464b70	8312	Podbočje
00050000-55ff-ab24-8b72-9aabc758a95b	5243	Podbrdo
00050000-55ff-ab24-1062-64eac266e1e1	3254	Podčetrtek
00050000-55ff-ab24-a9dd-0eb1147ee676	2273	Podgorci
00050000-55ff-ab24-e71a-c7071909467c	6216	Podgorje
00050000-55ff-ab24-523d-4bc93b72a34f	2381	Podgorje pri Slovenj Gradcu
00050000-55ff-ab24-5392-98fdb10a77aa	6244	Podgrad
00050000-55ff-ab24-cc21-6c19e7c64ccc	1414	Podkum
00050000-55ff-ab24-fa2e-c2bcde748892	2286	Podlehnik
00050000-55ff-ab24-db91-9f99b0816a97	5272	Podnanos
00050000-55ff-ab24-f44b-ff75903710dc	4244	Podnart
00050000-55ff-ab24-2eb4-d99e99535c50	3241	Podplat
00050000-55ff-ab24-dc8a-7116106de0d8	3257	Podsreda
00050000-55ff-ab24-3594-349797f5fe50	2363	Podvelka
00050000-55ff-ab24-7a09-9fa40caafc73	2208	Pohorje
00050000-55ff-ab24-049c-a32404e8f5af	2257	Polenšak
00050000-55ff-ab24-cff3-f47d4a8f379a	1355	Polhov Gradec
00050000-55ff-ab24-9c6b-4bf0c5f1f7dd	4223	Poljane nad Škofjo Loko
00050000-55ff-ab24-72c5-c29923f0c5d7	2319	Poljčane
00050000-55ff-ab24-957a-aa3d86757b55	1272	Polšnik
00050000-55ff-ab24-224b-522d3e9ca7c2	3313	Polzela
00050000-55ff-ab24-e6ba-77d410555a34	3232	Ponikva
00050000-55ff-ab24-04a7-bf4f7785af02	6320	Portorož/Portorose
00050000-55ff-ab24-0125-13d4214308ce	6230	Postojna
00050000-55ff-ab24-fdd2-cf26514c156e	2331	Pragersko
00050000-55ff-ab24-1d5c-e8342f866306	3312	Prebold
00050000-55ff-ab24-3eec-62e95050d83b	4205	Preddvor
00050000-55ff-ab24-3154-a66f1a4b5d35	6255	Prem
00050000-55ff-ab24-5102-54a4361bda68	1352	Preserje
00050000-55ff-ab24-5c15-cbccd9404d5c	6258	Prestranek
00050000-55ff-ab24-efdf-bb65625b6cd5	2391	Prevalje
00050000-55ff-ab24-0306-72a8ab53348c	3262	Prevorje
00050000-55ff-ab24-7853-aaaabc1c738a	1276	Primskovo 
00050000-55ff-ab24-0304-3ad0b52c4ea4	3253	Pristava pri Mestinju
00050000-55ff-ab24-16c0-59dd135981f3	9207	Prosenjakovci/Partosfalva
00050000-55ff-ab24-ec7c-b5f0f5be5d88	5297	Prvačina
00050000-55ff-ab24-ee51-9d1f590e7d14	2250	Ptuj
00050000-55ff-ab24-3204-87c93192aa2c	2323	Ptujska Gora
00050000-55ff-ab24-40d7-506c0d5c1cc8	9201	Puconci
00050000-55ff-ab24-be96-c55a9bf46766	2327	Rače
00050000-55ff-ab24-93ab-e2b45530d38a	1433	Radeče
00050000-55ff-ab24-1aa9-b121d5f6beaf	9252	Radenci
00050000-55ff-ab24-beae-b34df7b0b563	2360	Radlje ob Dravi
00050000-55ff-ab24-b2f8-09739781a7ab	1235	Radomlje
00050000-55ff-ab24-3aac-5bedc6242c93	4240	Radovljica
00050000-55ff-ab24-2a22-f7b50553bf2f	8274	Raka
00050000-55ff-ab24-85cf-ff1213db8c55	1381	Rakek
00050000-55ff-ab24-fe8a-a83869e7136e	4283	Rateče - Planica
00050000-55ff-ab24-4c14-97e607c7411c	2390	Ravne na Koroškem
00050000-55ff-ab24-3f32-d0b591407318	9246	Razkrižje
00050000-55ff-ab24-1e5b-b7829c053099	3332	Rečica ob Savinji
00050000-55ff-ab24-be57-a8d4086a6a72	5292	Renče
00050000-55ff-ab24-0bf2-1dff3f3fdf1e	1310	Ribnica
00050000-55ff-ab24-4c20-97d7d6ae9a87	2364	Ribnica na Pohorju
00050000-55ff-ab24-7b55-83adeea7b823	3272	Rimske Toplice
00050000-55ff-ab24-c172-946d8b1accbb	1314	Rob
00050000-55ff-ab24-9ce4-5ee4b69f0107	5215	Ročinj
00050000-55ff-ab24-a47d-5d4cf325c07c	3250	Rogaška Slatina
00050000-55ff-ab24-0391-6a9a836ae926	9262	Rogašovci
00050000-55ff-ab24-bae2-46e3cc373c50	3252	Rogatec
00050000-55ff-ab24-eec4-ba0ab7037624	1373	Rovte
00050000-55ff-ab24-7d44-edeefa7b526d	2342	Ruše
00050000-55ff-ab24-3716-70ed4e931e99	1282	Sava
00050000-55ff-ab24-ed75-80aa454b2795	6333	Sečovlje/Sicciole
00050000-55ff-ab24-99ba-c1d9dc7750c3	4227	Selca
00050000-55ff-ab24-e2f3-1e6706f0f86c	2352	Selnica ob Dravi
00050000-55ff-ab24-eabe-9279b446e0e0	8333	Semič
00050000-55ff-ab24-4eca-05a072106ef8	8281	Senovo
00050000-55ff-ab24-9c1a-df00378dcabd	6224	Senožeče
00050000-55ff-ab24-815f-b769f0120b2a	8290	Sevnica
00050000-55ff-ab24-d021-2a940ef17429	6210	Sežana
00050000-55ff-ab24-6a4b-b6074bdfab49	2214	Sladki Vrh
00050000-55ff-ab24-50f0-93878e4fa119	5283	Slap ob Idrijci
00050000-55ff-ab24-0c17-2d7c0bd57c65	2380	Slovenj Gradec
00050000-55ff-ab24-8da0-52ae1563ecb9	2310	Slovenska Bistrica
00050000-55ff-ab24-66a7-06f7f79b0a7c	3210	Slovenske Konjice
00050000-55ff-ab24-e7fc-250658b28fa1	1216	Smlednik
00050000-55ff-ab24-91ba-e773af281687	5232	Soča
00050000-55ff-ab24-6693-16d2ca87f5fa	1317	Sodražica
00050000-55ff-ab24-f3fc-c15fa25b20e6	3335	Solčava
00050000-55ff-ab24-12be-7bd8da52ecfb	5250	Solkan
00050000-55ff-ab24-bfc9-634c47e5ee5b	4229	Sorica
00050000-55ff-ab24-7997-65481ef1eda7	4225	Sovodenj
00050000-55ff-ab24-253e-3d331e7d156b	5281	Spodnja Idrija
00050000-55ff-ab24-c3f9-107d86b6c5f9	2241	Spodnji Duplek
00050000-55ff-ab24-07f1-5b3381d78e2c	9245	Spodnji Ivanjci
00050000-55ff-ab24-a0a7-2547cb697261	2277	Središče ob Dravi
00050000-55ff-ab24-d823-6a700820af24	4267	Srednja vas v Bohinju
00050000-55ff-ab24-5f0b-9898df4265cf	8256	Sromlje 
00050000-55ff-ab24-a3e2-266d5e5336e3	5224	Srpenica
00050000-55ff-ab24-79c2-ea635ce5e97b	1242	Stahovica
00050000-55ff-ab24-6dbd-da3eb16cc4eb	1332	Stara Cerkev
00050000-55ff-ab24-09c2-480c96cb3fe5	8342	Stari trg ob Kolpi
00050000-55ff-ab24-2412-b2c908883a2a	1386	Stari trg pri Ložu
00050000-55ff-ab24-8b62-3455d295706e	2205	Starše
00050000-55ff-ab24-02ab-9a981c7cfa21	2289	Stoperce
00050000-55ff-ab24-46c1-a1fdc6eb33b8	8322	Stopiče
00050000-55ff-ab24-1033-83beadf949d9	3206	Stranice
00050000-55ff-ab24-1bed-69578b792e20	8351	Straža
00050000-55ff-ab24-8cf0-575116db5ef8	1313	Struge
00050000-55ff-ab24-63cd-230c31950ae6	8293	Studenec
00050000-55ff-ab24-a8c4-f20b0011a8c0	8331	Suhor
00050000-55ff-ab24-d114-53b8c0a47115	2233	Sv. Ana v Slovenskih goricah
00050000-55ff-ab24-3f98-9eeabede0c27	2235	Sv. Trojica v Slovenskih goricah
00050000-55ff-ab24-2187-a70d9c67eb08	2353	Sveti Duh na Ostrem Vrhu
00050000-55ff-ab24-a9e3-02cb78e7bfbd	9244	Sveti Jurij ob Ščavnici
00050000-55ff-ab24-00c0-9532b5419d24	3264	Sveti Štefan
00050000-55ff-ab24-3d6e-eb0e2b345827	2258	Sveti Tomaž
00050000-55ff-ab24-fa0c-987bffd66e58	9204	Šalovci
00050000-55ff-ab24-429a-e399b84b98b5	5261	Šempas
00050000-55ff-ab24-5ca6-c9afd5442f27	5290	Šempeter pri Gorici
00050000-55ff-ab24-6ecb-21da8262d56b	3311	Šempeter v Savinjski dolini
00050000-55ff-ab24-56a1-75000b18e1f8	4208	Šenčur
00050000-55ff-ab24-cb6d-c1218e4f2361	2212	Šentilj v Slovenskih goricah
00050000-55ff-ab24-a419-6162fe489224	8297	Šentjanž
00050000-55ff-ab24-ac88-87121a9c401b	2373	Šentjanž pri Dravogradu
00050000-55ff-ab24-6827-d9fb3f0a3e9f	8310	Šentjernej
00050000-55ff-ab24-74b1-fe8188f63d1e	3230	Šentjur
00050000-55ff-ab24-d599-c92d79abad44	3271	Šentrupert
00050000-55ff-ab24-9a84-bd765a6847c8	8232	Šentrupert
00050000-55ff-ab24-b054-90f77da13877	1296	Šentvid pri Stični
00050000-55ff-ab24-ec03-77adcf245b46	8275	Škocjan
00050000-55ff-ab24-030e-2435dd2f8fb4	6281	Škofije
00050000-55ff-ab24-f222-9528c3789ec3	4220	Škofja Loka
00050000-55ff-ab24-f37d-55c8b84e482d	3211	Škofja vas
00050000-55ff-ab24-80ba-68254cbe3815	1291	Škofljica
00050000-55ff-ab24-e5f8-f201cee4b81b	6274	Šmarje
00050000-55ff-ab24-c1d8-982790ea2570	1293	Šmarje - Sap
00050000-55ff-ab24-6f3a-bb07da8335aa	3240	Šmarje pri Jelšah
00050000-55ff-ab24-edcc-1741458ee079	8220	Šmarješke Toplice
00050000-55ff-ab24-79c0-6fa64c0eade5	2315	Šmartno na Pohorju
00050000-55ff-ab24-6ba2-ca7c9fe5e6f4	3341	Šmartno ob Dreti
00050000-55ff-ab24-d3db-d381ee770934	3327	Šmartno ob Paki
00050000-55ff-ab24-963a-0725ee88e0b0	1275	Šmartno pri Litiji
00050000-55ff-ab24-037d-5e7fc2dc2398	2383	Šmartno pri Slovenj Gradcu
00050000-55ff-ab24-20de-b5511df41e9b	3201	Šmartno v Rožni dolini
00050000-55ff-ab24-ba2b-d19ec92ff8ad	3325	Šoštanj
00050000-55ff-ab24-5c4e-26601b5ff1dd	6222	Štanjel
00050000-55ff-ab24-6733-e81fbd3e74d1	3220	Štore
00050000-55ff-ab24-93a4-fa769f89f396	3304	Tabor
00050000-55ff-ab24-401e-ab71a47f2e3a	3221	Teharje
00050000-55ff-ab24-a423-4e5d831d9fb7	9251	Tišina
00050000-55ff-ab24-aef5-56ca919f7560	5220	Tolmin
00050000-55ff-ab24-b18b-028782bfeac3	3326	Topolšica
00050000-55ff-ab24-cf4c-63c6f93e8f08	2371	Trbonje
00050000-55ff-ab24-8ee1-2261b775cfa7	1420	Trbovlje
00050000-55ff-ab24-5aa3-5e8c32f230be	8231	Trebelno 
00050000-55ff-ab24-5c8c-f6e86b9fc8b3	8210	Trebnje
00050000-55ff-ab24-2555-ffc53d03561e	5252	Trnovo pri Gorici
00050000-55ff-ab24-5bab-9c61fca3cb9d	2254	Trnovska vas
00050000-55ff-ab24-843f-af1ee0b26f79	1222	Trojane
00050000-55ff-ab24-20dc-e7341cda4aec	1236	Trzin
00050000-55ff-ab24-ac4a-77894d582aa5	4290	Tržič
00050000-55ff-ab24-baba-6844bd63b2f3	8295	Tržišče
00050000-55ff-ab24-8fb3-a0dd58c729df	1311	Turjak
00050000-55ff-ab24-6e5b-e135fe6759b8	9224	Turnišče
00050000-55ff-ab24-2741-08ce67326eee	8323	Uršna sela
00050000-55ff-ab24-da28-4e01115def89	1252	Vače
00050000-55ff-ab24-ce41-145ddc210af7	3320	Velenje 
00050000-55ff-ab24-c274-6526e213d09b	3322	Velenje - poštni predali
00050000-55ff-ab24-e50c-4f954acf10f9	8212	Velika Loka
00050000-55ff-ab24-6666-f3e811288387	2274	Velika Nedelja
00050000-55ff-ab24-06f6-37815d27fc2c	9225	Velika Polana
00050000-55ff-ab24-942a-89e5b9ec8c13	1315	Velike Lašče
00050000-55ff-ab24-ce98-792f7364fa95	8213	Veliki Gaber
00050000-55ff-ab24-6593-2843ed5e78a3	9241	Veržej
00050000-55ff-ab24-7072-82e62e12bcc5	1312	Videm - Dobrepolje
00050000-55ff-ab24-de7a-06cbe35212c5	2284	Videm pri Ptuju
00050000-55ff-ab24-8775-51e7f58f5b55	8344	Vinica
00050000-55ff-ab24-5560-abf681b4a9b5	5271	Vipava
00050000-55ff-ab24-2491-8ac598acef9c	4212	Visoko
00050000-55ff-ab24-7c36-8429169d0205	1294	Višnja Gora
00050000-55ff-ab24-0084-0b61646ae279	3205	Vitanje
00050000-55ff-ab24-b618-81cf07befb44	2255	Vitomarci
00050000-55ff-ab24-11e1-5d87a0e861cd	1217	Vodice
00050000-55ff-ab24-6227-515399e98516	3212	Vojnik\t
00050000-55ff-ab24-ba5f-b8a63037f49c	5293	Volčja Draga
00050000-55ff-ab24-c323-0367d89b702f	2232	Voličina
00050000-55ff-ab24-ac26-937449f74682	3305	Vransko
00050000-55ff-ab24-8c4d-c0768df0b629	6217	Vremski Britof
00050000-55ff-ab24-8ad9-a6512b7e3d98	1360	Vrhnika
00050000-55ff-ab24-9a7f-c6bc5089042b	2365	Vuhred
00050000-55ff-ab24-9ad2-9d7ea1c76932	2367	Vuzenica
00050000-55ff-ab24-5eec-c5722797cfdd	8292	Zabukovje 
00050000-55ff-ab24-38da-07e43a8a3000	1410	Zagorje ob Savi
00050000-55ff-ab24-491f-d0314f29e34b	1303	Zagradec
00050000-55ff-ab24-ee19-6b96283ef0c6	2283	Zavrč
00050000-55ff-ab24-8462-adc5e024ed8a	8272	Zdole 
00050000-55ff-ab24-7352-cdcd56601499	4201	Zgornja Besnica
00050000-55ff-ab24-e2e7-c40088f8b3fb	2242	Zgornja Korena
00050000-55ff-ab24-5ede-a62af1c38279	2201	Zgornja Kungota
00050000-55ff-ab24-10dd-9f215b0072f0	2316	Zgornja Ložnica
00050000-55ff-ab24-0cb9-db04e6d9e82e	2314	Zgornja Polskava
00050000-55ff-ab24-6393-fda440bb80a0	2213	Zgornja Velka
00050000-55ff-ab24-4c9a-eabca452bc60	4247	Zgornje Gorje
00050000-55ff-ab24-8deb-24836669135c	4206	Zgornje Jezersko
00050000-55ff-ab24-456a-6eda885febb1	2285	Zgornji Leskovec
00050000-55ff-ab24-49fd-3c891b2b7b0b	1432	Zidani Most
00050000-55ff-ab24-01b5-699f7462250e	3214	Zreče
00050000-55ff-ab24-3876-bed8859b655b	4209	Žabnica
00050000-55ff-ab24-f42f-2cfd4ae94ed2	3310	Žalec
00050000-55ff-ab24-152e-1e26fbaafc6a	4228	Železniki
00050000-55ff-ab24-0611-cbca2f05fccc	2287	Žetale
00050000-55ff-ab24-d3e2-b1401891713f	4226	Žiri
00050000-55ff-ab24-c19d-d8709a15883b	4274	Žirovnica
00050000-55ff-ab24-c1bd-5c78f78a04cb	8360	Žužemberk
\.


--
-- TOC entry 3022 (class 0 OID 20212862)
-- Dependencies: 232
-- Data for Name: postavkacdve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkacdve (id, skupina, podskupina, naziv, vrpremiere, vrponovitvepremier, vrponovitveprejsnjih, vrgostovanjazamejstvo, vrfestivali, vrgostovanjaint, vrostalo, programdela_id) FROM stdin;
\.


--
-- TOC entry 2995 (class 0 OID 20212489)
-- Dependencies: 205
-- Data for Name: postavkaracuna; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkaracuna (id, racun_id) FROM stdin;
\.


--
-- TOC entry 2976 (class 0 OID 20212269)
-- Dependencies: 186
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
00060000-55ff-ab26-d205-2b8e87ebfe88	00080000-55ff-ab26-cf67-42b24dbfbec0	\N	00040000-55ff-ab24-d904-ef48d79bc0bd	Narodni dom	\N	Koroška 15	\N	9231	Beltinci	\N	f	t
00060000-55ff-ab26-5abb-f97b64d5886b	00080000-55ff-ab26-cf67-42b24dbfbec0	\N	00040000-55ff-ab24-d904-ef48d79bc0bd	Korotan	\N	Koroška 22	\N	9231	Beltinci	\N	f	f
00060000-55ff-ab26-9b96-71239595e887	00080000-55ff-ab26-b50f-a4ce06b85279	\N	00040000-55ff-ab24-d904-ef48d79bc0bd	Rimljan	\N	Rimska ploščad 7	\N	9231	Beltinci	\N	f	t
\.


--
-- TOC entry 2984 (class 0 OID 20212373)
-- Dependencies: 194
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, zaporedna, porocilo) FROM stdin;
\.


--
-- TOC entry 2997 (class 0 OID 20212501)
-- Dependencies: 207
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 3023 (class 0 OID 20212876)
-- Dependencies: 233
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, koproducent_id, odstotekfinanciranja, delez, maticnikop, kpe, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 3024 (class 0 OID 20212886)
-- Dependencies: 234
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, sifra, status) FROM stdin;
00190000-55ff-ab26-dbd3-7e7e8fe34950	00080000-55ff-ab26-6e1d-19d13e51427d	0987	AK
00190000-55ff-ab26-9a63-b3fa4171e652	00080000-55ff-ab26-b50f-a4ce06b85279	0989	AK
00190000-55ff-ab26-8674-31f2c1805d68	00080000-55ff-ab26-1aba-0ff480686bed	0986	AK
00190000-55ff-ab26-8c61-0e6df85d9485	00080000-55ff-ab26-3af1-d17ecc2c43b0	0984	AK
00190000-55ff-ab26-c035-8cd8436846e2	00080000-55ff-ab26-0120-33d1c563e5f1	0983	AK
00190000-55ff-ab26-d4f0-de8b90132088	00080000-55ff-ab26-f3b5-ba5f25ebd1a4	0982	AK
00190000-55ff-ab27-184c-65fb3d5cccd6	00080000-55ff-ab27-7f33-241c59046260	1001	AK
\.


--
-- TOC entry 3021 (class 0 OID 20212819)
-- Dependencies: 231
-- Data for Name: programdela; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programdela (id, sifra, naziv, zacetek, konec, zakljuceno, potrjenprogram, stpremier, stint, stfest, strazno, stizjem, stponprem, stponprej, stponprejvelikih, stponprejmalih, stponprejmalihkopr, stponprejsredkopr, stponprejvelikihkopr, stgostujo, vrps1, vrps1do, vrps1mat, vrps1gostovsz, stizvnekomerc, stizvprem, stizvpremdoma, stizvpremkopr, stizvponprem, stizvponpremdoma, stizvponpremzamejo, stizvponpremgost, stizvponpremkopr, stizvponpremint, stizvponpremkoprint, stizvponprej, stizvponprejdoma, stizvponprejzamejo, stizvponprejgost, stizvponprejkopr, stizvponprejint, stizvponprejkoprint, stizvgostuj, stizvostalihnek, stizvgostovanjslo, stizvgostovanjzam, stizvgostovanjint, stobisknekom, stobisknekommat, stobisknekomgostslo, stobisknekomgostzam, stobisknekomgostint, stobiskprem, stobiskpremdoma, stobiskpremkopr, stobiskponprem, stobiskponpremdoma, stobiskponpremkopr, stobiskponpremkoprint, stobiskponpremgost, stobiskponpremzamejo, stobiskponpremint, avgobiskprired, avgzaseddvoran, avgcenavstopnice, stprodvstopnic, stkoprodukcij, stkoprodukcijint, stkoprodukcijnvo, stzaposlenih, stzaposigralcev, avgstnastopovigr, sthonorarnih, sthonorarnihigr, sthonorarnihigrtujjz, sthonorarnihigrsamoz, sredstvaint, sredstvaavt, sredstvazaprosenoprem, sredstvazaprosenoponprem, sredstvazaprosenoponprej, sredstvazaprosenogostujo, sredstvazaprosenoint, sredstvazaprosenofest, sredstvazaprosenorazno, sredstvazaprosenoizjem, sredstvadrugijavniprem, sredstvadrugijavniponprem, sredstvadrugijavniponprej, sredstvadrugijavnigostujo, sredstvadrugijavniint, sredstvadrugijavnifest, sredstvadrugijavnirazno, sredstvadrugijavniizjem, sredstvadrugiviriprem, sredstvadrugiviriponprem, sredstvadrugiviriponprej, sredstvadrugivirigostujo, sredstvadrugiviriint, sredstvadrugivirifest, sredstvadrugivirirazno, sredstvadrugiviriizjem, sredstvaavtsamoz) FROM stdin;
00290000-55ff-ab26-b08b-cbb5b31eac39	0001	Testni program dela	2016-02-01	2017-02-01	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 3025 (class 0 OID 20212894)
-- Dependencies: 235
-- Data for Name: programskaenotasklopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programskaenotasklopa (id, naslovpe, avtorpe, obsegpe, mesecpe, vrednostpe, programrazno_id) FROM stdin;
\.


--
-- TOC entry 3001 (class 0 OID 20212530)
-- Dependencies: 211
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, popa_id, naslov_id, sifra, naziv, jeprizorisce, jematicnioder, seplanira, kapaciteta, opis) FROM stdin;
00220000-55ff-ab26-f048-7ae79d402ae1	\N	\N	0001	Poskusna 1	f	\N	t	8	Poskusna učilnica v prvem
00220000-55ff-ab26-29e1-0a190b15b93c	\N	\N	0002	Poskusna 3	f	\N	f	34	Poskusna učilnica v tretjem
00220000-55ff-ab26-213b-128619ce2d71	\N	\N	0003	Kazinska	t	\N	t	84	Kazinska dvorana
00220000-55ff-ab26-8160-19fff12786dd	\N	\N	0004	Mali oder	t	\N	t	24	Mali oder 
00220000-55ff-ab26-5941-f4ccd268cfe1	\N	\N	0005	Komorni oder	t	\N	t	15	Komorni oder
00220000-55ff-ab26-8979-0e4d2e17421a	\N	\N	0006	Stara dvorana	t	\N	t	96	Stara dvorana ali dvorana Franceta Prešerna
00220000-55ff-ab26-5d09-bb0b0c945697	\N	\N	0007	Velika dvorana	t	\N	t	160	Velika, glavna dvorana
\.


--
-- TOC entry 2993 (class 0 OID 20212474)
-- Dependencies: 203
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 2992 (class 0 OID 20212464)
-- Dependencies: 202
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 3014 (class 0 OID 20212672)
-- Dependencies: 224
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta, status) FROM stdin;
\.


--
-- TOC entry 3008 (class 0 OID 20212604)
-- Dependencies: 218
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 2982 (class 0 OID 20212347)
-- Dependencies: 192
-- Data for Name: report; Type: TABLE DATA; Schema: public; Owner: -
--

COPY report (id, job_id, title, filename, transfers, size, format, hash, createdat) FROM stdin;
\.


--
-- TOC entry 2965 (class 0 OID 20212142)
-- Dependencies: 175
-- Data for Name: revizije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY revizije (id, razred, objectid, upor, datum, tip, data) FROM stdin;
1	App\\Entity\\Popa	00080000-55ff-ab27-7f33-241c59046260	00010000-55ff-ab25-7631-a07a2b6af414	2015-09-21 09:00:55	INS	a:0:{}
2	App\\Entity\\Option	00000000-55ff-ab27-143e-a7fdda90e061	00010000-55ff-ab25-7631-a07a2b6af414	2015-09-21 09:00:55	INS	a:0:{}
3	ProgramDela\\Entity\\ProdukcijskaHisa	00190000-55ff-ab27-184c-65fb3d5cccd6	00010000-55ff-ab25-7631-a07a2b6af414	2015-09-21 09:00:55	INS	a:0:{}
\.


--
-- TOC entry 3044 (class 0 OID 0)
-- Dependencies: 174
-- Name: revizije_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('revizije_id_seq', 3, true);


--
-- TOC entry 3002 (class 0 OID 20212543)
-- Dependencies: 212
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 2969 (class 0 OID 20212180)
-- Dependencies: 179
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-55ff-ab24-1628-3c6148895ac7	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-55ff-ab24-5f7b-2d5ce2d3eaf0	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-55ff-ab24-cd3c-1a96f0e769a5	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-55ff-ab24-bd75-30a51ed4fc5c	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-55ff-ab24-ed56-9e5ff09c16f0	planer	Planer dogodkov v koledarju	t
00020000-55ff-ab24-32fd-b2249d5173fe	kadrovska	Kadrovska služba	t
00020000-55ff-ab24-d3c0-be2e71b85a3a	arhivar	Ažuriranje arhivalij	t
00020000-55ff-ab24-3af8-6205854a33df	igralec	Igralec	t
00020000-55ff-ab24-43fc-abbb6872f1f5	prisotnost	Vnašalec prisotnosti, tudi za tiste izven uprizoritev	t
00020000-55ff-ab26-d1c9-c3ea7d75d478	vsadovoljenja	Vloga z vsemi posameznimi dovoljenji	t
\.


--
-- TOC entry 2967 (class 0 OID 20212164)
-- Dependencies: 177
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-55ff-ab25-2b79-21072cdaf265	00020000-55ff-ab24-cd3c-1a96f0e769a5
00010000-55ff-ab25-7631-a07a2b6af414	00020000-55ff-ab24-cd3c-1a96f0e769a5
00010000-55ff-ab26-2e7c-633a42072ab3	00020000-55ff-ab26-d1c9-c3ea7d75d478
\.


--
-- TOC entry 3004 (class 0 OID 20212557)
-- Dependencies: 214
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 2996 (class 0 OID 20212495)
-- Dependencies: 206
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 2990 (class 0 OID 20212441)
-- Dependencies: 200
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, sifra, ime, zacetek, konec, aktivna) FROM stdin;
\.


--
-- TOC entry 2963 (class 0 OID 20212129)
-- Dependencies: 173
-- Data for Name: stevilcenje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenje (id, sifra, naziv, prefix, suffix, zacetek, dolzina, format, globalno, poletih) FROM stdin;
00230000-55ff-ab24-e758-8622105826c5	pri	Privzeto številčenje po letih YYYY-N	\N	\N	1	1	%l-%n	f	t
00230000-55ff-ab24-3c27-23eb5b5424a2	123	Privzeto številčenje kratkih šifer	\N	\N	100	3	%n	f	f
00230000-55ff-ab24-d974-4346d9d41011	bcd	Globalno številčenje črtnih kod	\N	\N	1	9	%n	t	f
00230000-55ff-ab24-367c-a538558d9579	sif	Številčenje šifrant	\N	\N	1000	4	%n	f	f
00230000-55ff-ab24-bcc7-8bdda1285b6a	tmp	Globalno številčenje začasnih številk	tmp	\N	1000	5	%l%n	t	t
\.


--
-- TOC entry 2962 (class 0 OID 20212121)
-- Dependencies: 172
-- Data for Name: stevilcenjekonfig; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjekonfig (id, stevilcenje_id, dok) FROM stdin;
00240000-55ff-ab24-7e1d-2f37c5ed5a4c	00230000-55ff-ab24-367c-a538558d9579	popa
00240000-55ff-ab24-f852-5ec9c28f1887	00230000-55ff-ab24-367c-a538558d9579	oseba
00240000-55ff-ab24-772b-b93680073d1c	00230000-55ff-ab24-367c-a538558d9579	sezona
00240000-55ff-ab24-05b1-62b89b0bd3c0	00230000-55ff-ab24-3c27-23eb5b5424a2	prostor
00240000-55ff-ab24-a871-3515060ca224	00230000-55ff-ab24-367c-a538558d9579	besedilo
00240000-55ff-ab24-888a-dc1f1b77df72	00230000-55ff-ab24-367c-a538558d9579	uprizoritev
00240000-55ff-ab24-ac0e-f6b4640ab36a	00230000-55ff-ab24-367c-a538558d9579	funkcija
00240000-55ff-ab24-fb23-03737a5ae026	00230000-55ff-ab24-367c-a538558d9579	tipfunkcije
00240000-55ff-ab24-d464-7c489678e526	00230000-55ff-ab24-367c-a538558d9579	alternacija
00240000-55ff-ab24-83d4-b16feba10eea	00230000-55ff-ab24-e758-8622105826c5	pogodba
00240000-55ff-ab24-9756-8c195d832952	00230000-55ff-ab24-367c-a538558d9579	zaposlitev
00240000-55ff-ab24-ea81-4c80e15915a5	00230000-55ff-ab24-367c-a538558d9579	zvrstuprizoritve
00240000-55ff-ab24-1a39-0e5b2ad11fa8	00230000-55ff-ab24-e758-8622105826c5	programdela
00240000-55ff-ab24-9288-6708b5d9e325	00230000-55ff-ab24-367c-a538558d9579	zapis
\.


--
-- TOC entry 2961 (class 0 OID 20212116)
-- Dependencies: 171
-- Data for Name: stevilcenjestanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjestanje (id, objid, leto, stevilka) FROM stdin;
e18f37a0-18f4-420e-98ed-c94a37723e93	00240000-55ff-ab24-7e1d-2f37c5ed5a4c	0	1001
\.


--
-- TOC entry 3010 (class 0 OID 20212621)
-- Dependencies: 220
-- Data for Name: strosekuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY strosekuprizoritve (id, uprizoritev_id, popa_id, naziv, vrednostdo, vrednostna, opis, tipstroska, sort, vrstastroska_id) FROM stdin;
00270000-55ff-ab26-16bf-83f188401fe7	000e0000-55ff-ab26-df00-69f6219601cc	00080000-55ff-ab26-cf67-42b24dbfbec0	Nabava kostumov	600.50	20.00	Krila in maske	materialni	1	003b0000-55ff-ab24-13c6-6bc5da853065
00270000-55ff-ab26-4463-36d9a5dd08d2	000e0000-55ff-ab26-df00-69f6219601cc	00080000-55ff-ab26-cf67-42b24dbfbec0	Zavese	125.70	3.10	Modra in zelena zavesa	materialni	2	003b0000-55ff-ab24-13c6-6bc5da853065
\.


--
-- TOC entry 2974 (class 0 OID 20212242)
-- Dependencies: 184
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 2991 (class 0 OID 20212451)
-- Dependencies: 201
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja) FROM stdin;
001a0000-55ff-ab26-c94b-a2073c0a447c	00180000-55ff-ab26-4a1a-40edf764456a	000c0000-55ff-ab26-dc84-4c820f6e313a	00090000-55ff-ab26-827d-1fb002dc2e82	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55ff-ab26-3a79-cbbc5ad100bb	00180000-55ff-ab26-4a1a-40edf764456a	000c0000-55ff-ab26-bcdd-39e16b66815e	00090000-55ff-ab26-34e2-6c2f70224f6a	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55ff-ab26-40d3-b476204f56e5	00180000-55ff-ab26-4a1a-40edf764456a	000c0000-55ff-ab26-2af1-6c0bb690d03f	00090000-55ff-ab26-f6e1-2efdbbba2580	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55ff-ab26-44ae-48a520472dd7	00180000-55ff-ab26-4a1a-40edf764456a	000c0000-55ff-ab26-1a44-ea084d9aa83e	00090000-55ff-ab26-25fd-f372d5595bc9	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55ff-ab26-0144-9d2a2c188773	00180000-55ff-ab26-4a1a-40edf764456a	000c0000-55ff-ab26-04b7-89f7c7dea6a9	00090000-55ff-ab26-55fd-a2da0812b19b	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55ff-ab26-8bbd-6f84d21cf343	00180000-55ff-ab26-e7bf-716f16de052d	\N	00090000-55ff-ab26-55fd-a2da0812b19b	2015-08-01 20:00:00	2015-08-01 23:00:00	\N	\N	2.00
\.


--
-- TOC entry 3013 (class 0 OID 20212660)
-- Dependencies: 223
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, sifra, ime, opis, imezenski, podrocje) FROM stdin;
000f0000-55ff-ab24-2870-5e253bb8f893	01	Avtor	Avtorji	Avtorka	umetnik
000f0000-55ff-ab24-ce9f-d36e4d0dd7f6	02	Priredba	Priredba	Priredba	umetnik
000f0000-55ff-ab24-9019-50de8d9cb7c5	03	Prevod	Prevod	Prevod	umetnik
000f0000-55ff-ab24-4b69-489a01ecafff	04	Režija	Režija	Režija	umetnik
000f0000-55ff-ab24-41cc-be3afed7f44d	05	Dramaturgija	Dramaturgija	Dramaturgija	umetnik
000f0000-55ff-ab24-03ec-c9c17b308caa	06	Scenografija	Scenografija	Scenografija	umetnik
000f0000-55ff-ab24-971b-67b3188c2655	07	Kostumografija	Kostumografija	Kostumografija	umetnik
000f0000-55ff-ab24-02aa-eca6fb75672f	08	Koreografija	Koreografija	Koreografija	umetnik
000f0000-55ff-ab24-134a-bb9e8ee7b41c	09	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	umetnik
000f0000-55ff-ab24-8ef7-b75b13dd61d2	10	Oblikovanje maske	Oblikovanje maske	Oblikovanje maske	umetnik
000f0000-55ff-ab24-33b5-1c522ac4a1ec	11	Lektorstvo	Lektorstvo	Lektorstvo	umetnik
000f0000-55ff-ab24-1105-05988dc16b09	12	Glasbeni soustvarjalec	Glasbeni soustvarjalci	Glasbena soustvarjalka	umetnik
000f0000-55ff-ab24-d656-c01c75591b15	13	Intermedijski ustvarjalec	Intermedijski ustvarjalci	Intermedijski ustvarjalka	umetnik
000f0000-55ff-ab24-d57e-fb6d64c5e3ea	14	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	umetnik
000f0000-55ff-ab24-2c56-d7949122231b	15	Vloga	Intermedijski ustvarjalci	Intermedijska ustvarjalka	igralec
000f0000-55ff-ab24-d9b7-ef5b7d058192	16	Produkcija, mentorstvo	Produkcija, mentorstvo	Produkcija, mentorstvo	umetnik
000f0000-55ff-ab24-a3b6-dffce1a9b237	17	Tehnična podpora	Tehnična podpora	Tehnična podpora	tehnik
000f0000-55ff-ab24-a531-7014d27a5b29	18	Inšpicient	Inšpicienti	Inšpicientka	inspicient
\.


--
-- TOC entry 3026 (class 0 OID 20212904)
-- Dependencies: 236
-- Data for Name: tipprogramskeenote; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipprogramskeenote (id, sifra, naziv, koprodukcija, maxfaktor, maxvsi) FROM stdin;
002b0000-55ff-ab24-45ee-500cacf47e7e	01	Velika predstava	f	1.00	1.00
002b0000-55ff-ab24-a33d-f2076b5ca5f2	02	Mala predstava	f	0.50	0.50
002b0000-55ff-ab24-bc22-07cbdae82d97	03	Mala koprodukcija	t	0.40	1.00
002b0000-55ff-ab24-e902-fb68135ce5a6	04	Srednja koprodukcija	t	0.70	2.00
002b0000-55ff-ab24-a7d0-24ae34d4d40e	05	Velika koprodukcija	t	1.00	3.00
\.


--
-- TOC entry 2979 (class 0 OID 20212304)
-- Dependencies: 189
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 2966 (class 0 OID 20212151)
-- Dependencies: 176
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-55ff-ab25-7631-a07a2b6af414	Konzolni	$2y$05$NS4xMjkyMTcwMzExMjAxROsUsydcu.0n9KwFD3vT8CtC6/LqmRWbq	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-55ff-ab26-3fbb-783bbbb6577c	testni uporabnik za inšpicienta	$2y$05$NS4xMjkyMTcwMzExMjAxROxkJ1B6xAXex6EZLIwJfWzRJ8DpfecFO	t	\N	\N	\N	ivo@ifigenija.si	\N	\N	\N
00010000-55ff-ab26-634f-03c005159450	testni uporabnik za Tehničnega vodjo	$2y$05$NS4xMjkyMTcwMzExMjAxROu/kXWR9sP9oamkesKuxXLbxkCb387.G	t	\N	\N	\N	tona@ifigenija.si	\N	\N	\N
00010000-55ff-ab26-d836-770bbd2fa31a	testni uporabnik za igralca	$2y$05$NS4xMjkyMTcwMzExMjAxRO/hLCgClfERRsfCAFYwxNCcFIVjP2982	t	\N	\N	\N	irena@ifigenija.si	\N	\N	\N
00010000-55ff-ab26-cee8-2f3bebb8ea76	testni uporabnik vnašalca termina storitev (TerminStoritve-vse)	$2y$05$NS4xMjkyMTcwMzExMjAxROT6.kTHqEq4.wa2SOnf124/N14m9qeP.	t	\N	\N	\N	tatjana@ifigenija.si	\N	\N	\N
00010000-55ff-ab26-15f6-a8ac1af698e7	testni uporabnik, ki je inšpicient brez zapisov v TerminStoritve	$2y$05$NS4xMjkyMTcwMzExMjAxROHau47Dtb7CME5.nlWwBVM.nusFP.ra2	t	\N	\N	\N	joze@ifigenija.si	\N	\N	\N
00010000-55ff-ab26-9e6b-1f671fd849a1	testna uporabnica, ki je planerka	$2y$05$NS4xMjkyMTcwMzExMjAxRO.B/uJO3C7QRNhdX9Q2hTLQsSupj1V1S	t	\N	\N	\N	petra@ifigenija.si	\N	\N	\N
00010000-55ff-ab26-4a0e-84bb13c2b074	testni uporabnik, ki dobi ifi-all vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROv2d7jqhaV/Mz3EIsKoi7UoFR.SDSMBm	t	\N	\N	\N	ali@ifigenija.si	\N	\N	\N
00010000-55ff-ab26-8ace-4c41f439227b	testni uporabnik, ki dobi ifi-readall vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROYB9g.gnkufr1l/gWK6mkx.ySqrOWnJC	t	\N	\N	\N	berta@ifigenija.si	\N	\N	\N
00010000-55ff-ab26-8c72-aaa3cabe22e8	testni uporabnik, ki dobi aaa-write dovoljenje	$2y$05$NS4xMjkyMTcwMzExMjAxRORujYObKX.DzpXVYbePkiJkHqg0/Ylya	t	\N	\N	\N	aaron@ifigenija.si	\N	\N	\N
00010000-55ff-ab26-2e7c-633a42072ab3	testni uporabnik ki dobi vsa posamezna dovoljenja	$2y$05$NS4xMjkyMTcwMzExMjAxRO2ymwxVXTr7U4Ncdn.bN49E8rLw9Jg0O	t	\N	\N	\N	vesna@ifigenija.si	\N	\N	\N
00010000-55ff-ab25-2b79-21072cdaf265	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 3017 (class 0 OID 20212709)
-- Dependencies: 227
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, producent_id, sifra, faza, naslov, podnaslov, delovninaslov, internacionalninaslov, naslovizvirnika, podnaslovizvirnika, datumzacstudija, stevilovaj, planiranostevilovaj, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, krstna, prvaslovenska, kratkinaslov, maticnioder_id) FROM stdin;
000e0000-55ff-ab26-4a01-ed73b2626ed5	00160000-55ff-ab26-1b32-7bd99494e988	\N	00140000-55ff-ab24-5072-a40f2e1fb661	\N	0001	produkcija	Sen kresne noči		Sanje	\N	\N	\N	2016-02-01	\N	\N	2016-06-01	1	William  Shakespeare - Nebojša  Kavader	f	2				\N	f	\N	\N		00220000-55ff-ab26-5941-f4ccd268cfe1
000e0000-55ff-ab26-df00-69f6219601cc	00160000-55ff-ab26-d575-69bec5fe2538	\N	00140000-55ff-ab24-805e-c83072a44b56	\N	0002	predprodukcija-ideja	Smoletov vrt			\N	\N	\N	2016-01-01	\N	\N	2016-04-20	2	Berta   Hočevar	f	2				\N	f	\N	\N		00220000-55ff-ab26-8979-0e4d2e17421a
000e0000-55ff-ab26-8819-d47f3a1e3cf6	\N	\N	00140000-55ff-ab24-805e-c83072a44b56	00190000-55ff-ab26-dbd3-7e7e8fe34950	0003	postprodukcija	Kisli maček			\N	\N	\N	2016-02-01	\N	\N	2016-04-20	2	\N	t	2				\N	f	\N	\N		00220000-55ff-ab26-5941-f4ccd268cfe1
000e0000-55ff-ab26-5f42-aa23eb11ba51	\N	\N	00140000-55ff-ab24-805e-c83072a44b56	00190000-55ff-ab26-dbd3-7e7e8fe34950	0004	postprodukcija	Vladimir			\N	\N	\N	2017-03-01	\N	\N	2017-04-20	2	\N	t	2				\N	f	\N	\N		00220000-55ff-ab26-5941-f4ccd268cfe1
000e0000-55ff-ab26-3959-26e22e8c227b	\N	\N	00140000-55ff-ab24-805e-c83072a44b56	00190000-55ff-ab26-dbd3-7e7e8fe34950	0005	postprodukcija	Španska princesa			\N	\N	\N	2017-04-01	\N	\N	2017-05-20	1	\N	f	1				\N	f	\N	\N		00220000-55ff-ab26-f048-7ae79d402ae1
000e0000-55ff-ab26-053a-1caa94ed31cb	\N	\N	00140000-55ff-ab24-805e-c83072a44b56	00190000-55ff-ab26-dbd3-7e7e8fe34950	0006	postprodukcija	Ne vemo datumov			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		00220000-55ff-ab26-f048-7ae79d402ae1
\.


--
-- TOC entry 2986 (class 0 OID 20212394)
-- Dependencies: 196
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, uprizoritev_id, vrsta, zaporedna, porocilo) FROM stdin;
00200000-55ff-ab26-0474-0dcde37a0e03	000e0000-55ff-ab26-df00-69f6219601cc	\N	1	
00200000-55ff-ab26-4194-58c9b15cca2b	000e0000-55ff-ab26-df00-69f6219601cc	\N	2	
00200000-55ff-ab26-6014-c7b4db844ef1	000e0000-55ff-ab26-df00-69f6219601cc	\N	3	
00200000-55ff-ab26-7b74-ea0f608ff415	000e0000-55ff-ab26-df00-69f6219601cc	\N	4	
00200000-55ff-ab26-a660-82c0b83401de	000e0000-55ff-ab26-df00-69f6219601cc	\N	5	
\.


--
-- TOC entry 3000 (class 0 OID 20212522)
-- Dependencies: 210
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 3011 (class 0 OID 20212635)
-- Dependencies: 221
-- Data for Name: vrstastroska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstastroska (id, skupina, podskupina, naziv, opis) FROM stdin;
003b0000-55ff-ab24-13f9-21150086d0df	1	0	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE
003b0000-55ff-ab24-bbcd-2f8546716dd6	1	1	Storitve varovanja zgradb in prostorov	storitve varovanja zgradb in prostorov (npr. gasilci na predstavah)
003b0000-55ff-ab24-11de-d5512be07ec3	1	2	Založniške in tiskarske storitve	založniške in tiskarske storitve
003b0000-55ff-ab24-bc21-bfeaca799337	1	3	Časopisi, revije, knjige in strokovna literatura	časopisi, revije, knjige in strokovna literatura
003b0000-55ff-ab24-3576-b4f696b6ada8	1	4	Stroški prevajalskih storitev	stroški prevajalskih storitev
003b0000-55ff-ab24-4fbd-841181a4dee4	1	5	Stroški oglaševalskih storitev	stroški oglaševalskih storitev
003b0000-55ff-ab24-8c1d-2017a824796f	1	6	Izdatki za reprezentanco	izdatki za reprezentanco
003b0000-55ff-ab24-fd58-8d2d1ab65486	2	0	POSEBNI MATERIAL IN STORITVE	POSEBNI MATERIAL IN STORITVE
003b0000-55ff-ab24-13c6-6bc5da853065	2	1	Drugi posebni material in storitve	drugi posebni material in storitve (npr. za instrumete - navedite)
003b0000-55ff-ab24-39a6-084b92fa7485	2	2	Oprema predstave – stroški rekvizitov	Oprema predstave – stroški rekvizitov
003b0000-55ff-ab24-4d94-bcd313467f47	2	3	Oprema predstave – stroški kostumov	Oprema predstave – stroški kostumov
003b0000-55ff-ab24-c866-bfcc1b217fb6	2	4	Oprema predstave – stroški scenske opreme	Oprema predstave – stroški scenske opreme
003b0000-55ff-ab24-fba9-99c10bfbe51b	2	5	Oprema predstave – stroški avdio in video opreme	Oprema predstave – stroški avdio in video opreme
003b0000-55ff-ab24-db90-a621ef5e5f97	3	0	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE
003b0000-55ff-ab24-ef73-02f6e815b40b	3	1	Poštnina in kurirske storitve	poštnina in kurirske storitve
003b0000-55ff-ab24-ca68-60b44074c372	4	0	PREVOZNI STROŠKI IN STORITVE	PREVOZNI STROŠKI IN STORITVE
003b0000-55ff-ab24-521d-35729ee6ef3c	4	1	Goriva in maziva za prevozna sredstva	goriva in maziva za prevozna sredstva
003b0000-55ff-ab24-8f2b-b93681f07893	4	2	Najem vozil in selitveni stroški	najem vozil in selitveni stroški
003b0000-55ff-ab24-1920-b492ba9d0d22	4	3	Drugi prevozni in transportni stroški 	drugi prevozni in transportni stroški (navedite)
003b0000-55ff-ab24-0c51-cf4addf97d4b	5	0	IZDATKI ZA SLUŽBENA POTOVANJA	IZDATKI ZA SLUŽBENA POTOVANJA
003b0000-55ff-ab24-378f-5808225ae754	5	1	Dnevnice za službena potovanja v državi in tujini	dnevnice za službena potovanja v državi in tujini
003b0000-55ff-ab24-2541-216dc69bfdd9	5	2	Hotelske in restavra. storitve v državi in tujini	hotelske in restavra. storitve v državi in tujini
003b0000-55ff-ab24-b1e4-6b1468bdfaaf	5	3	Stroški prevoza v državi in tujini	stroški prevoza v državi in tujini
003b0000-55ff-ab24-2bcf-99449f3b5c93	5	4	Drugi izdatki za službena potovanja	drugi izdatki za službena potovanja (navedite)
003b0000-55ff-ab24-c2f1-45498cfe58bf	6	0	NAJEMNINE IN ZAKUPNINE	NAJEMNINE IN ZAKUPNINE
003b0000-55ff-ab24-79a7-186601a06193	6	1	Druge najemnine, zakupnine in licenčnine	druge najemnine, zakupnine in licenčnine (npr. najem notnega materiala, instrumentov - navedite)
003b0000-55ff-ab24-ebb5-e034f1581a69	7	0	DRUGI OPERATIVNI ODHODKI	DRUGI OPERATIVNI ODHODKI
003b0000-55ff-ab24-8632-2ec46c5c0238	7	1	Izdatki za strok. izobraževanje zap.	izdatki za strok. izobraževanje zap.(vezani na program. enote)  
\.


--
-- TOC entry 3029 (class 0 OID 20212951)
-- Dependencies: 239
-- Data for Name: vrstazapisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstazapisa (id, oznaka, naziv, aktiven, znacka, ikona, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3028 (class 0 OID 20212923)
-- Dependencies: 238
-- Data for Name: zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapis (id, vrsta_id, datoteka_id, mapa_id, avtor_id, zaklenil_id, tip, zaklenjen, datumzaklepanja, identifier, subject, title, description, coverage, creator, language, date, publisher, relation, rights, source, upor, datknj, standard, lokacija) FROM stdin;
\.


--
-- TOC entry 3030 (class 0 OID 20212963)
-- Dependencies: 240
-- Data for Name: zapislastnik; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapislastnik (id, zapis_id, lastnik, classlastnika, datum, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3007 (class 0 OID 20212594)
-- Dependencies: 217
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, sifra, status, delovnomesto, zacetek, konec, tip, delovnaobveza, malica, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci) FROM stdin;
00100000-55ff-ab26-f5be-cbe2807ffd7b	00090000-55ff-ab26-34e2-6c2f70224f6a	01	A	Mojster	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55ff-ab26-af9c-ccdf583dd928	00090000-55ff-ab26-f6e1-2efdbbba2580	02	A	Igralec	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55ff-ab26-a110-d54797223c6f	00090000-55ff-ab26-9dcb-c1459df549b7	03	A	Natakar	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55ff-ab26-1652-7b98c48811b4	00090000-55ff-ab26-6c95-eba6b5b7cd4a	04	A	Mizar	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55ff-ab26-c1c4-b1fb37e60a4c	00090000-55ff-ab26-827d-1fb002dc2e82	05	A	Šivilja	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55ff-ab26-915e-7bed3e21c4c3	00090000-55ff-ab26-4f85-0638c2c3a300	06	A	Inšpicient	2010-02-01	2010-02-01	1	2		t	f	f	t
\.


--
-- TOC entry 2988 (class 0 OID 20212430)
-- Dependencies: 198
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id, oseba_id) FROM stdin;
\.


--
-- TOC entry 3016 (class 0 OID 20212699)
-- Dependencies: 226
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, sifra, naziv, opis) FROM stdin;
00140000-55ff-ab24-5072-a40f2e1fb661	01	Drama	drama (SURS 01)
00140000-55ff-ab24-d5af-1c9d61925a8f	02	Opera	opera (SURS 02)
00140000-55ff-ab24-914b-ac3db80c30ed	03	Balet	balet (SURS 03)
00140000-55ff-ab24-71d0-7d2fdf60d50d	04	Plesne prireditve	plesne prireditve (SURS 04)
00140000-55ff-ab24-5efe-a97f60f16163	05	Lutkovno gledališče	lutkovno gledališče (SURS 05)
00140000-55ff-ab24-805e-c83072a44b56	06	Raziskovalno gledališče	raziskovalno gledališče (SURS 06)
00140000-55ff-ab24-5aec-741808e28aea	07	Drugo	drugo (SURS 07)
\.


--
-- TOC entry 3006 (class 0 OID 20212584)
-- Dependencies: 216
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, sifra, naziv, opis) FROM stdin;
\.


--
-- TOC entry 2493 (class 2606 OID 20212205)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2685 (class 2606 OID 20212758)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2681 (class 2606 OID 20212748)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2644 (class 2606 OID 20212618)
-- Name: avtorbesedila_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT avtorbesedila_pkey PRIMARY KEY (id);


--
-- TOC entry 2655 (class 2606 OID 20212658)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2742 (class 2606 OID 20213003)
-- Name: datoteka_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT datoteka_pkey PRIMARY KEY (id);


--
-- TOC entry 2556 (class 2606 OID 20212419)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2571 (class 2606 OID 20212440)
-- Name: dogodeksplosni_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodeksplosni
    ADD CONSTRAINT dogodeksplosni_pkey PRIMARY KEY (id);


--
-- TOC entry 2718 (class 2606 OID 20212921)
-- Name: drugivir_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT drugivir_pkey PRIMARY KEY (id);


--
-- TOC entry 2527 (class 2606 OID 20212330)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2692 (class 2606 OID 20212813)
-- Name: enotaprograma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT enotaprograma_pkey PRIMARY KEY (id);


--
-- TOC entry 2629 (class 2606 OID 20212580)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2550 (class 2606 OID 20212392)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2544 (class 2606 OID 20212368)
-- Name: job_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY job
    ADD CONSTRAINT job_pkey PRIMARY KEY (id);


--
-- TOC entry 2535 (class 2606 OID 20212344)
-- Name: kontaktnaoseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT kontaktnaoseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2593 (class 2606 OID 20212487)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2736 (class 2606 OID 20212980)
-- Name: mapa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT mapa_pkey PRIMARY KEY (id);


--
-- TOC entry 2740 (class 2606 OID 20212987)
-- Name: mapa_zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT mapa_zapis_pkey PRIMARY KEY (mapa_id, zapis_id);


--
-- TOC entry 2747 (class 2606 OID 20213011)
-- Name: mapaacl_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT mapaacl_pkey PRIMARY KEY (id);


--
-- TOC entry 2465 (class 2606 OID 19946842)
-- Name: migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY migrations
    ADD CONSTRAINT migrations_pkey PRIMARY KEY (version);


--
-- TOC entry 2605 (class 2606 OID 20212514)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2520 (class 2606 OID 20212302)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2497 (class 2606 OID 20212214)
-- Name: optionvalue_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT optionvalue_pkey PRIMARY KEY (id);


--
-- TOC entry 2500 (class 2606 OID 20212238)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2491 (class 2606 OID 20212194)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2484 (class 2606 OID 20212179)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2608 (class 2606 OID 20212520)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2622 (class 2606 OID 20212556)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2667 (class 2606 OID 20212694)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2509 (class 2606 OID 20212266)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2517 (class 2606 OID 20212290)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2702 (class 2606 OID 20212874)
-- Name: postavkacdve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkacdve
    ADD CONSTRAINT postavkacdve_pkey PRIMARY KEY (id);


--
-- TOC entry 2597 (class 2606 OID 20212493)
-- Name: postavkaracuna_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT postavkaracuna_pkey PRIMARY KEY (id);


--
-- TOC entry 2515 (class 2606 OID 20212280)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2548 (class 2606 OID 20212380)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2603 (class 2606 OID 20212505)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2706 (class 2606 OID 20212883)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2708 (class 2606 OID 20212891)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2699 (class 2606 OID 20212861)
-- Name: programdela_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT programdela_pkey PRIMARY KEY (id);


--
-- TOC entry 2713 (class 2606 OID 20212902)
-- Name: programskaenotasklopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT programskaenotasklopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2615 (class 2606 OID 20212538)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2591 (class 2606 OID 20212478)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2585 (class 2606 OID 20212469)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2662 (class 2606 OID 20212682)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2642 (class 2606 OID 20212611)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2538 (class 2606 OID 20212356)
-- Name: report_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY report
    ADD CONSTRAINT report_pkey PRIMARY KEY (id);


--
-- TOC entry 2476 (class 2606 OID 20212150)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2620 (class 2606 OID 20212547)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2482 (class 2606 OID 20212168)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2486 (class 2606 OID 20212188)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2627 (class 2606 OID 20212565)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2599 (class 2606 OID 20212500)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2573 (class 2606 OID 20212449)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2473 (class 2606 OID 20212138)
-- Name: stevilcenje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenje
    ADD CONSTRAINT stevilcenje_pkey PRIMARY KEY (id);


--
-- TOC entry 2470 (class 2606 OID 20212126)
-- Name: stevilcenjekonfig_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT stevilcenjekonfig_pkey PRIMARY KEY (id);


--
-- TOC entry 2467 (class 2606 OID 20212120)
-- Name: stevilcenjestanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjestanje
    ADD CONSTRAINT stevilcenjestanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2651 (class 2606 OID 20212631)
-- Name: strosekuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT strosekuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2506 (class 2606 OID 20212247)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2579 (class 2606 OID 20212460)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2658 (class 2606 OID 20212669)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2715 (class 2606 OID 20212914)
-- Name: tipprogramskeenote_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipprogramskeenote
    ADD CONSTRAINT tipprogramskeenote_pkey PRIMARY KEY (id);


--
-- TOC entry 2525 (class 2606 OID 20212315)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2478 (class 2606 OID 20212163)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2679 (class 2606 OID 20212727)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2554 (class 2606 OID 20212402)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2611 (class 2606 OID 20212528)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2653 (class 2606 OID 20212643)
-- Name: vrstastroska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstastroska
    ADD CONSTRAINT vrstastroska_pkey PRIMARY KEY (id);


--
-- TOC entry 2729 (class 2606 OID 20212961)
-- Name: vrstazapisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstazapisa
    ADD CONSTRAINT vrstazapisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2726 (class 2606 OID 20212945)
-- Name: zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT zapis_pkey PRIMARY KEY (id);


--
-- TOC entry 2732 (class 2606 OID 20212969)
-- Name: zapislastnik_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT zapislastnik_pkey PRIMARY KEY (id);


--
-- TOC entry 2638 (class 2606 OID 20212602)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2569 (class 2606 OID 20212434)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2671 (class 2606 OID 20212707)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2635 (class 2606 OID 20212592)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2557 (class 1259 OID 20212428)
-- Name: dogodki_konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_konec ON dogodek USING btree (konec);


--
-- TOC entry 2558 (class 1259 OID 20212429)
-- Name: dogodki_razred; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_razred ON dogodek USING btree (razred);


--
-- TOC entry 2559 (class 1259 OID 20212427)
-- Name: dogodki_zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2560 (class 1259 OID 20212426)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2561 (class 1259 OID 20212425)
-- Name: idx_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2647 (class 1259 OID 20212632)
-- Name: idx_11ffe6e05c75296c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e05c75296c ON strosekuprizoritve USING btree (vrstastroska_id);


--
-- TOC entry 2648 (class 1259 OID 20212633)
-- Name: idx_11ffe6e062b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e062b4ffca ON strosekuprizoritve USING btree (uprizoritev_id);


--
-- TOC entry 2649 (class 1259 OID 20212634)
-- Name: idx_11ffe6e06beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e06beede51 ON strosekuprizoritve USING btree (popa_id);


--
-- TOC entry 2733 (class 1259 OID 20212982)
-- Name: idx_14a5d6d3727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d3727aca70 ON mapa USING btree (parent_id);


--
-- TOC entry 2734 (class 1259 OID 20212981)
-- Name: idx_14a5d6d38a4a6c12; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d38a4a6c12 ON mapa USING btree (lastnik_id);


--
-- TOC entry 2507 (class 1259 OID 20212268)
-- Name: idx_1c7adba5ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba5ee4b985a ON popa USING btree (drzava_id);


--
-- TOC entry 2606 (class 1259 OID 20212521)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2720 (class 1259 OID 20212949)
-- Name: idx_1ed92829253c4123; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829253c4123 ON zapis USING btree (avtor_id);


--
-- TOC entry 2721 (class 1259 OID 20212948)
-- Name: idx_1ed9282957ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282957ed422f ON zapis USING btree (mapa_id);


--
-- TOC entry 2722 (class 1259 OID 20212950)
-- Name: idx_1ed9282987ff3295; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282987ff3295 ON zapis USING btree (zaklenil_id);


--
-- TOC entry 2723 (class 1259 OID 20212947)
-- Name: idx_1ed92829a54dbb1f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829a54dbb1f ON zapis USING btree (datoteka_id);


--
-- TOC entry 2724 (class 1259 OID 20212946)
-- Name: idx_1ed92829ef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829ef943358 ON zapis USING btree (vrsta_id);


--
-- TOC entry 2600 (class 1259 OID 20212507)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2601 (class 1259 OID 20212506)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2552 (class 1259 OID 20212403)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2630 (class 1259 OID 20212581)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2631 (class 1259 OID 20212583)
-- Name: idx_23aeb9586b361365; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9586b361365 ON funkcija USING btree (tipfunkcije_id);


--
-- TOC entry 2632 (class 1259 OID 20212582)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2532 (class 1259 OID 20212346)
-- Name: idx_2942b10710389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b10710389148 ON kontaktnaoseba USING btree (oseba_id);


--
-- TOC entry 2533 (class 1259 OID 20212345)
-- Name: idx_2942b1076beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b1076beede51 ON kontaktnaoseba USING btree (popa_id);


--
-- TOC entry 2711 (class 1259 OID 20212903)
-- Name: idx_2d901816d6bc69d6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2d901816d6bc69d6 ON programskaenotasklopa USING btree (programrazno_id);


--
-- TOC entry 2663 (class 1259 OID 20212696)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2664 (class 1259 OID 20212697)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2665 (class 1259 OID 20212698)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2730 (class 1259 OID 20212970)
-- Name: idx_2eaff9dcaf91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2eaff9dcaf91ecd ON zapislastnik USING btree (zapis_id);


--
-- TOC entry 2672 (class 1259 OID 20212732)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2673 (class 1259 OID 20212729)
-- Name: idx_344a77a7c3b0d59; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a7c3b0d59 ON uprizoritev USING btree (maticnioder_id);


--
-- TOC entry 2674 (class 1259 OID 20212733)
-- Name: idx_344a77a853a965c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a853a965c ON uprizoritev USING btree (producent_id);


--
-- TOC entry 2675 (class 1259 OID 20212731)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2676 (class 1259 OID 20212730)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2522 (class 1259 OID 20212317)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2523 (class 1259 OID 20212316)
-- Name: idx_37f6541a6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a6beede51 ON trr USING btree (popa_id);


--
-- TOC entry 2498 (class 1259 OID 20212241)
-- Name: idx_466966d769e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_466966d769e8d4 ON oseba USING btree (naslov_id);


--
-- TOC entry 2618 (class 1259 OID 20212548)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2488 (class 1259 OID 20212195)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2489 (class 1259 OID 20212196)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2623 (class 1259 OID 20212568)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2624 (class 1259 OID 20212567)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2625 (class 1259 OID 20212566)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2545 (class 1259 OID 20212381)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2546 (class 1259 OID 20212382)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2468 (class 1259 OID 20212128)
-- Name: idx_6054e804ff55f926; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_6054e804ff55f926 ON stevilcenjekonfig USING btree (stevilcenje_id);


--
-- TOC entry 2580 (class 1259 OID 20212473)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2581 (class 1259 OID 20212471)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2582 (class 1259 OID 20212470)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2583 (class 1259 OID 20212472)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2479 (class 1259 OID 20212169)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2480 (class 1259 OID 20212170)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2609 (class 1259 OID 20212529)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2743 (class 1259 OID 20213004)
-- Name: idx_781826c67e3c61f9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_781826c67e3c61f9 ON datoteka USING btree (owner_id);


--
-- TOC entry 2645 (class 1259 OID 20212620)
-- Name: idx_7ab77b7910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7ab77b7910389148 ON avtorbesedila USING btree (oseba_id);


--
-- TOC entry 2646 (class 1259 OID 20212619)
-- Name: idx_7ab77b79f35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7ab77b79f35157b1 ON avtorbesedila USING btree (besedilo_id);


--
-- TOC entry 2744 (class 1259 OID 20213012)
-- Name: idx_7adc957157ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc957157ed422f ON mapaacl USING btree (mapa_id);


--
-- TOC entry 2745 (class 1259 OID 20213013)
-- Name: idx_7adc9571fa6311ef; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc9571fa6311ef ON mapaacl USING btree (perm_id);


--
-- TOC entry 2595 (class 1259 OID 20212494)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2639 (class 1259 OID 20212612)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2640 (class 1259 OID 20212613)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2693 (class 1259 OID 20212818)
-- Name: idx_8787a0e54ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e54ae1cd1c ON enotaprograma USING btree (gostitelj_id);


--
-- TOC entry 2694 (class 1259 OID 20212817)
-- Name: idx_8787a0e55d0da56c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e55d0da56c ON enotaprograma USING btree (drzavagostovanja_id);


--
-- TOC entry 2695 (class 1259 OID 20212814)
-- Name: idx_8787a0e562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e562b4ffca ON enotaprograma USING btree (uprizoritev_id);


--
-- TOC entry 2696 (class 1259 OID 20212815)
-- Name: idx_8787a0e57222d84b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e57222d84b ON enotaprograma USING btree (tipprogramskeenote_id);


--
-- TOC entry 2697 (class 1259 OID 20212816)
-- Name: idx_8787a0e5771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e5771ec7bd ON enotaprograma USING btree (program_dela_id);


--
-- TOC entry 2511 (class 1259 OID 20212282)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2512 (class 1259 OID 20212281)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2513 (class 1259 OID 20212283)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2612 (class 1259 OID 20212542)
-- Name: idx_952dd21969e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd21969e8d4 ON prostor USING btree (naslov_id);


--
-- TOC entry 2613 (class 1259 OID 20212541)
-- Name: idx_952dd2196beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd2196beede51 ON prostor USING btree (popa_id);


--
-- TOC entry 2703 (class 1259 OID 20212884)
-- Name: idx_97af082e38c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e38c06eb ON produkcijadelitev USING btree (enotaprograma_id);


--
-- TOC entry 2704 (class 1259 OID 20212885)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2686 (class 1259 OID 20212762)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2687 (class 1259 OID 20212763)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2688 (class 1259 OID 20212760)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2689 (class 1259 OID 20212761)
-- Name: idx_a4b7244fa4976613; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fa4976613 ON alternacija USING btree (zaposlitev_id);


--
-- TOC entry 2636 (class 1259 OID 20212603)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2586 (class 1259 OID 20212482)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2587 (class 1259 OID 20212481)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2588 (class 1259 OID 20212479)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2589 (class 1259 OID 20212480)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2682 (class 1259 OID 20212750)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2683 (class 1259 OID 20212749)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2536 (class 1259 OID 20212357)
-- Name: idx_c38372b2be04ea9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c38372b2be04ea9 ON report USING btree (job_id);


--
-- TOC entry 2539 (class 1259 OID 20212371)
-- Name: idx_c395a6181bb9e62c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a6181bb9e62c ON job USING btree (datum);


--
-- TOC entry 2540 (class 1259 OID 20212370)
-- Name: idx_c395a618941027cc; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618941027cc ON job USING btree (casizvedbe);


--
-- TOC entry 2541 (class 1259 OID 20212369)
-- Name: idx_c395a618a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618a76ed395 ON job USING btree (user_id);


--
-- TOC entry 2542 (class 1259 OID 20212372)
-- Name: idx_c395a618aecf5af0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618aecf5af0 ON job USING btree (izveden);


--
-- TOC entry 2551 (class 1259 OID 20212393)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2700 (class 1259 OID 20212875)
-- Name: idx_dba42fe79e3adf2c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_dba42fe79e3adf2c ON postavkacdve USING btree (programdela_id);


--
-- TOC entry 2719 (class 1259 OID 20212922)
-- Name: idx_e7d4cf2638c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e7d4cf2638c06eb ON drugivir USING btree (enotaprograma_id);


--
-- TOC entry 2737 (class 1259 OID 20212988)
-- Name: idx_e9f8ee8257ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee8257ed422f ON mapa_zapis USING btree (mapa_id);


--
-- TOC entry 2738 (class 1259 OID 20212989)
-- Name: idx_e9f8ee82af91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee82af91ecd ON mapa_zapis USING btree (zapis_id);


--
-- TOC entry 2494 (class 1259 OID 20212216)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2495 (class 1259 OID 20212215)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2503 (class 1259 OID 20212248)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2504 (class 1259 OID 20212249)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2567 (class 1259 OID 20212435)
-- Name: idx_f44a386d10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_f44a386d10389148 ON zasedenost USING btree (oseba_id);


--
-- TOC entry 2575 (class 1259 OID 20212463)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2576 (class 1259 OID 20212462)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2577 (class 1259 OID 20212461)
-- Name: idx_fef7d84ba81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84ba81ccef6 ON terminstoritve USING btree (dogodek_id);


--
-- TOC entry 2562 (class 1259 OID 20212421)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2563 (class 1259 OID 20212422)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2564 (class 1259 OID 20212420)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2565 (class 1259 OID 20212424)
-- Name: uniq_11e93b5dbbc7a989; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dbbc7a989 ON dogodek USING btree (dogodek_splosni_id);


--
-- TOC entry 2566 (class 1259 OID 20212423)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2510 (class 1259 OID 20212267)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2528 (class 1259 OID 20212331)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2529 (class 1259 OID 20212333)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2530 (class 1259 OID 20212332)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2531 (class 1259 OID 20212334)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2594 (class 1259 OID 20212488)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2668 (class 1259 OID 20212695)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2677 (class 1259 OID 20212728)
-- Name: uniq_344a77a559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_344a77a559828a3 ON uprizoritev USING btree (sifra);


--
-- TOC entry 2659 (class 1259 OID 20212670)
-- Name: uniq_3f50510d559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d559828a3 ON tipfunkcije USING btree (sifra);


--
-- TOC entry 2660 (class 1259 OID 20212671)
-- Name: uniq_3f50510d55cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d55cca980 ON tipfunkcije USING btree (ime);


--
-- TOC entry 2501 (class 1259 OID 20212239)
-- Name: uniq_466966d7559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7559828a3 ON oseba USING btree (sifra);


--
-- TOC entry 2502 (class 1259 OID 20212240)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2633 (class 1259 OID 20212593)
-- Name: uniq_5216fcb0559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5216fcb0559828a3 ON zvrstuprizoritve USING btree (sifra);


--
-- TOC entry 2474 (class 1259 OID 20212139)
-- Name: uniq_5a434fbc559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5a434fbc559828a3 ON stevilcenje USING btree (sifra);


--
-- TOC entry 2521 (class 1259 OID 20212303)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2471 (class 1259 OID 20212127)
-- Name: uniq_6054e804889a7556; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_6054e804889a7556 ON stevilcenjekonfig USING btree (dok);


--
-- TOC entry 2716 (class 1259 OID 20212915)
-- Name: uniq_7d834df4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_7d834df4559828a3 ON tipprogramskeenote USING btree (sifra);


--
-- TOC entry 2616 (class 1259 OID 20212540)
-- Name: uniq_952dd21937854736; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21937854736 ON prostor USING btree (naziv);


--
-- TOC entry 2617 (class 1259 OID 20212539)
-- Name: uniq_952dd219559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd219559828a3 ON prostor USING btree (sifra);


--
-- TOC entry 2690 (class 1259 OID 20212759)
-- Name: uniq_a4b7244f559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a4b7244f559828a3 ON alternacija USING btree (sifra);


--
-- TOC entry 2518 (class 1259 OID 20212291)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2669 (class 1259 OID 20212708)
-- Name: uniq_cede8e36559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_cede8e36559828a3 ON zvrstsurs USING btree (sifra);


--
-- TOC entry 2727 (class 1259 OID 20212962)
-- Name: uniq_de1c8aa1d55226c7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_de1c8aa1d55226c7 ON vrstazapisa USING btree (oznaka);


--
-- TOC entry 2709 (class 1259 OID 20212892)
-- Name: uniq_e6fc2028559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc2028559828a3 ON produkcijskahisa USING btree (sifra);


--
-- TOC entry 2710 (class 1259 OID 20212893)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2656 (class 1259 OID 20212659)
-- Name: uniq_ec773670ca2e5fcb; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ec773670ca2e5fcb ON besedilo USING btree (stevilka);


--
-- TOC entry 2574 (class 1259 OID 20212450)
-- Name: uniq_ecc8f8c5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ecc8f8c5559828a3 ON sezona USING btree (sifra);


--
-- TOC entry 2487 (class 1259 OID 20212189)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2778 (class 2606 OID 20213144)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2777 (class 2606 OID 20213149)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2773 (class 2606 OID 20213169)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2779 (class 2606 OID 20213139)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2775 (class 2606 OID 20213159)
-- Name: fk_11e93b5dbbc7a989; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dbbc7a989 FOREIGN KEY (dogodek_splosni_id) REFERENCES dogodeksplosni(id);


--
-- TOC entry 2774 (class 2606 OID 20213164)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2776 (class 2606 OID 20213154)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2814 (class 2606 OID 20213334)
-- Name: fk_11ffe6e05c75296c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e05c75296c FOREIGN KEY (vrstastroska_id) REFERENCES vrstastroska(id);


--
-- TOC entry 2813 (class 2606 OID 20213339)
-- Name: fk_11ffe6e062b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e062b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2812 (class 2606 OID 20213344)
-- Name: fk_11ffe6e06beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e06beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2846 (class 2606 OID 20213509)
-- Name: fk_14a5d6d3727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d3727aca70 FOREIGN KEY (parent_id) REFERENCES mapa(id);


--
-- TOC entry 2847 (class 2606 OID 20213504)
-- Name: fk_14a5d6d38a4a6c12; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d38a4a6c12 FOREIGN KEY (lastnik_id) REFERENCES uporabniki(id);


--
-- TOC entry 2759 (class 2606 OID 20213069)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2796 (class 2606 OID 20213254)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2841 (class 2606 OID 20213489)
-- Name: fk_1ed92829253c4123; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829253c4123 FOREIGN KEY (avtor_id) REFERENCES uporabniki(id);


--
-- TOC entry 2842 (class 2606 OID 20213484)
-- Name: fk_1ed9282957ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282957ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2840 (class 2606 OID 20213494)
-- Name: fk_1ed9282987ff3295; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282987ff3295 FOREIGN KEY (zaklenil_id) REFERENCES uporabniki(id);


--
-- TOC entry 2843 (class 2606 OID 20213479)
-- Name: fk_1ed92829a54dbb1f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829a54dbb1f FOREIGN KEY (datoteka_id) REFERENCES datoteka(id);


--
-- TOC entry 2844 (class 2606 OID 20213474)
-- Name: fk_1ed92829ef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829ef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstazapisa(id);


--
-- TOC entry 2794 (class 2606 OID 20213249)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2795 (class 2606 OID 20213244)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2772 (class 2606 OID 20213134)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2806 (class 2606 OID 20213294)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2804 (class 2606 OID 20213304)
-- Name: fk_23aeb9586b361365; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9586b361365 FOREIGN KEY (tipfunkcije_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2805 (class 2606 OID 20213299)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2765 (class 2606 OID 20213104)
-- Name: fk_2942b10710389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b10710389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2766 (class 2606 OID 20213099)
-- Name: fk_2942b1076beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b1076beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2792 (class 2606 OID 20213234)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2838 (class 2606 OID 20213464)
-- Name: fk_2d901816d6bc69d6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT fk_2d901816d6bc69d6 FOREIGN KEY (programrazno_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2817 (class 2606 OID 20213349)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2816 (class 2606 OID 20213354)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2815 (class 2606 OID 20213359)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 2845 (class 2606 OID 20213499)
-- Name: fk_2eaff9dcaf91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT fk_2eaff9dcaf91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id);


--
-- TOC entry 2819 (class 2606 OID 20213379)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2822 (class 2606 OID 20213364)
-- Name: fk_344a77a7c3b0d59; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a7c3b0d59 FOREIGN KEY (maticnioder_id) REFERENCES prostor(id);


--
-- TOC entry 2818 (class 2606 OID 20213384)
-- Name: fk_344a77a853a965c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a853a965c FOREIGN KEY (producent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2820 (class 2606 OID 20213374)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2821 (class 2606 OID 20213369)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2763 (class 2606 OID 20213094)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2764 (class 2606 OID 20213089)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2755 (class 2606 OID 20213054)
-- Name: fk_466966d769e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d769e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2756 (class 2606 OID 20213049)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2800 (class 2606 OID 20213274)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2752 (class 2606 OID 20213029)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2751 (class 2606 OID 20213034)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2801 (class 2606 OID 20213289)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2802 (class 2606 OID 20213284)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2803 (class 2606 OID 20213279)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2770 (class 2606 OID 20213119)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2769 (class 2606 OID 20213124)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2748 (class 2606 OID 20213014)
-- Name: fk_6054e804ff55f926; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT fk_6054e804ff55f926 FOREIGN KEY (stevilcenje_id) REFERENCES stevilcenje(id);


--
-- TOC entry 2784 (class 2606 OID 20213209)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2786 (class 2606 OID 20213199)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2787 (class 2606 OID 20213194)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2785 (class 2606 OID 20213204)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2750 (class 2606 OID 20213019)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2749 (class 2606 OID 20213024)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2797 (class 2606 OID 20213259)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2850 (class 2606 OID 20213524)
-- Name: fk_781826c67e3c61f9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT fk_781826c67e3c61f9 FOREIGN KEY (owner_id) REFERENCES uporabniki(id);


--
-- TOC entry 2810 (class 2606 OID 20213329)
-- Name: fk_7ab77b7910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT fk_7ab77b7910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2811 (class 2606 OID 20213324)
-- Name: fk_7ab77b79f35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT fk_7ab77b79f35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2852 (class 2606 OID 20213529)
-- Name: fk_7adc957157ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc957157ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2851 (class 2606 OID 20213534)
-- Name: fk_7adc9571fa6311ef; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc9571fa6311ef FOREIGN KEY (perm_id) REFERENCES permission(id);


--
-- TOC entry 2793 (class 2606 OID 20213239)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2809 (class 2606 OID 20213314)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2808 (class 2606 OID 20213319)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2829 (class 2606 OID 20213439)
-- Name: fk_8787a0e54ae1cd1c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e54ae1cd1c FOREIGN KEY (gostitelj_id) REFERENCES popa(id);


--
-- TOC entry 2830 (class 2606 OID 20213434)
-- Name: fk_8787a0e55d0da56c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e55d0da56c FOREIGN KEY (drzavagostovanja_id) REFERENCES drza(id);


--
-- TOC entry 2833 (class 2606 OID 20213419)
-- Name: fk_8787a0e562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2832 (class 2606 OID 20213424)
-- Name: fk_8787a0e57222d84b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e57222d84b FOREIGN KEY (tipprogramskeenote_id) REFERENCES tipprogramskeenote(id);


--
-- TOC entry 2831 (class 2606 OID 20213429)
-- Name: fk_8787a0e5771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e5771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2761 (class 2606 OID 20213079)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2762 (class 2606 OID 20213074)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2760 (class 2606 OID 20213084)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2798 (class 2606 OID 20213269)
-- Name: fk_952dd21969e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd21969e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2799 (class 2606 OID 20213264)
-- Name: fk_952dd2196beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd2196beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2836 (class 2606 OID 20213449)
-- Name: fk_97af082e38c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e38c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2835 (class 2606 OID 20213454)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2826 (class 2606 OID 20213409)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2825 (class 2606 OID 20213414)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2828 (class 2606 OID 20213399)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 2827 (class 2606 OID 20213404)
-- Name: fk_a4b7244fa4976613; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fa4976613 FOREIGN KEY (zaposlitev_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2807 (class 2606 OID 20213309)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2788 (class 2606 OID 20213229)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2789 (class 2606 OID 20213224)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2791 (class 2606 OID 20213214)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2790 (class 2606 OID 20213219)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2823 (class 2606 OID 20213394)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2824 (class 2606 OID 20213389)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2767 (class 2606 OID 20213109)
-- Name: fk_c38372b2be04ea9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY report
    ADD CONSTRAINT fk_c38372b2be04ea9 FOREIGN KEY (job_id) REFERENCES job(id);


--
-- TOC entry 2768 (class 2606 OID 20213114)
-- Name: fk_c395a618a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY job
    ADD CONSTRAINT fk_c395a618a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2771 (class 2606 OID 20213129)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2834 (class 2606 OID 20213444)
-- Name: fk_dba42fe79e3adf2c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkacdve
    ADD CONSTRAINT fk_dba42fe79e3adf2c FOREIGN KEY (programdela_id) REFERENCES programdela(id);


--
-- TOC entry 2837 (class 2606 OID 20213459)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2839 (class 2606 OID 20213469)
-- Name: fk_e7d4cf2638c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT fk_e7d4cf2638c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2849 (class 2606 OID 20213514)
-- Name: fk_e9f8ee8257ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee8257ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id) ON DELETE CASCADE;


--
-- TOC entry 2848 (class 2606 OID 20213519)
-- Name: fk_e9f8ee82af91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee82af91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id) ON DELETE CASCADE;


--
-- TOC entry 2753 (class 2606 OID 20213044)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2754 (class 2606 OID 20213039)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2758 (class 2606 OID 20213059)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2757 (class 2606 OID 20213064)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2780 (class 2606 OID 20213174)
-- Name: fk_f44a386d10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT fk_f44a386d10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2781 (class 2606 OID 20213189)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2782 (class 2606 OID 20213184)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2783 (class 2606 OID 20213179)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- Completed on 2015-09-21 09:00:56 CEST

--
-- PostgreSQL database dump complete
--

