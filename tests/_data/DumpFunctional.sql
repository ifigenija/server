--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.9
-- Dumped by pg_dump version 9.3.9
-- Started on 2015-09-21 13:09:47 CEST

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

SET search_path = public, pg_catalog;

SET default_with_oids = false;

--
-- TOC entry 181 (class 1259 OID 20251618)
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
-- TOC entry 229 (class 1259 OID 20252172)
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
-- TOC entry 228 (class 1259 OID 20252155)
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
-- TOC entry 219 (class 1259 OID 20252035)
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
-- TOC entry 222 (class 1259 OID 20252065)
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
-- TOC entry 243 (class 1259 OID 20252411)
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
-- TOC entry 197 (class 1259 OID 20251825)
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
-- TOC entry 199 (class 1259 OID 20251857)
-- Name: dogodeksplosni; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodeksplosni (
    id uuid NOT NULL
);


--
-- TOC entry 237 (class 1259 OID 20252337)
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
-- TOC entry 190 (class 1259 OID 20251739)
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
-- TOC entry 230 (class 1259 OID 20252185)
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
-- TOC entry 215 (class 1259 OID 20251990)
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
-- TOC entry 195 (class 1259 OID 20251804)
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
-- TOC entry 193 (class 1259 OID 20251779)
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
-- TOC entry 191 (class 1259 OID 20251756)
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
-- TOC entry 204 (class 1259 OID 20251904)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 241 (class 1259 OID 20252392)
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
-- TOC entry 242 (class 1259 OID 20252404)
-- Name: mapa_zapis; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE mapa_zapis (
    mapa_id uuid NOT NULL,
    zapis_id uuid NOT NULL
);


--
-- TOC entry 244 (class 1259 OID 20252426)
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
-- TOC entry 208 (class 1259 OID 20251929)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 188 (class 1259 OID 20251713)
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
-- TOC entry 182 (class 1259 OID 20251627)
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
-- TOC entry 183 (class 1259 OID 20251638)
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
-- TOC entry 178 (class 1259 OID 20251592)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 180 (class 1259 OID 20251611)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 209 (class 1259 OID 20251936)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 213 (class 1259 OID 20251970)
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
-- TOC entry 225 (class 1259 OID 20252104)
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
-- TOC entry 185 (class 1259 OID 20251671)
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
-- TOC entry 187 (class 1259 OID 20251705)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 232 (class 1259 OID 20252283)
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
-- TOC entry 205 (class 1259 OID 20251910)
-- Name: postavkaracuna; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE postavkaracuna (
    id uuid NOT NULL,
    racun_id uuid
);


--
-- TOC entry 186 (class 1259 OID 20251690)
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
-- TOC entry 194 (class 1259 OID 20251794)
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
-- TOC entry 207 (class 1259 OID 20251922)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 233 (class 1259 OID 20252297)
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
-- TOC entry 234 (class 1259 OID 20252307)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    sifra character varying(4) NOT NULL,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 231 (class 1259 OID 20252240)
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
-- TOC entry 235 (class 1259 OID 20252315)
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
-- TOC entry 211 (class 1259 OID 20251951)
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
-- TOC entry 203 (class 1259 OID 20251895)
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
-- TOC entry 202 (class 1259 OID 20251885)
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
-- TOC entry 224 (class 1259 OID 20252093)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying,
    status character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 218 (class 1259 OID 20252025)
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
-- TOC entry 192 (class 1259 OID 20251768)
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
-- TOC entry 175 (class 1259 OID 20251563)
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
-- TOC entry 174 (class 1259 OID 20251561)
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
-- TOC entry 212 (class 1259 OID 20251964)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 179 (class 1259 OID 20251601)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 177 (class 1259 OID 20251585)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 214 (class 1259 OID 20251978)
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
-- TOC entry 206 (class 1259 OID 20251916)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 200 (class 1259 OID 20251862)
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
-- TOC entry 173 (class 1259 OID 20251550)
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
-- TOC entry 172 (class 1259 OID 20251542)
-- Name: stevilcenjekonfig; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjekonfig (
    id uuid NOT NULL,
    stevilcenje_id uuid,
    dok character varying(100) DEFAULT NULL::character varying
);


--
-- TOC entry 171 (class 1259 OID 20251537)
-- Name: stevilcenjestanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjestanje (
    id uuid NOT NULL,
    objid uuid NOT NULL,
    leto integer NOT NULL,
    stevilka integer
);


--
-- TOC entry 220 (class 1259 OID 20252042)
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
-- TOC entry 184 (class 1259 OID 20251663)
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
-- TOC entry 201 (class 1259 OID 20251872)
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
-- TOC entry 223 (class 1259 OID 20252081)
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
-- TOC entry 236 (class 1259 OID 20252325)
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
-- TOC entry 189 (class 1259 OID 20251725)
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
-- TOC entry 176 (class 1259 OID 20251572)
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
-- TOC entry 227 (class 1259 OID 20252130)
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
-- TOC entry 196 (class 1259 OID 20251815)
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
-- TOC entry 210 (class 1259 OID 20251943)
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
-- TOC entry 221 (class 1259 OID 20252056)
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
-- TOC entry 239 (class 1259 OID 20252372)
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
-- TOC entry 238 (class 1259 OID 20252344)
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
-- TOC entry 240 (class 1259 OID 20252384)
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
-- TOC entry 217 (class 1259 OID 20252015)
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
-- TOC entry 198 (class 1259 OID 20251851)
-- Name: zasedenost; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zasedenost (
    id uuid NOT NULL,
    oseba_id uuid
);


--
-- TOC entry 226 (class 1259 OID 20252120)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 216 (class 1259 OID 20252005)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 2201 (class 2604 OID 20251566)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 2971 (class 0 OID 20251618)
-- Dependencies: 181
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
\.


--
-- TOC entry 3019 (class 0 OID 20252172)
-- Dependencies: 229
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, zaposlitev_id, oseba_id, pogodba_id, sifra, zaposlen, zacetek, konec, opomba, sort, privzeti, aktivna, imapogodbo, pomembna) FROM stdin;
000c0000-55ff-e57a-97b6-0f165e3aa5a0	000d0000-55ff-e57a-fa73-ba1d11fc0a2f	\N	00090000-55ff-e579-0ae7-4f5d8a0276fd	000b0000-55ff-e579-a6a6-374dee541299	0001	f	\N	\N	\N	3	t	\N	t	t
000c0000-55ff-e57a-8688-9fe7c816b94f	000d0000-55ff-e57a-34b9-b1f1da15a779	00100000-55ff-e579-e948-bfc623fa7992	00090000-55ff-e579-e706-e3602a17db9b	\N	0002	t	2016-01-01	\N	\N	8	t	\N	f	f
000c0000-55ff-e57a-037e-930b1d9ffd42	000d0000-55ff-e57a-d24a-c8a5ec333076	00100000-55ff-e579-1fe0-94054f76c664	00090000-55ff-e579-5567-bc7b2d841877	\N	0003	t	\N	2015-09-21	\N	2	t	\N	f	f
000c0000-55ff-e57a-81c2-117c2114236f	000d0000-55ff-e57a-6275-b5d74f16de6b	\N	00090000-55ff-e579-09a9-85aeab030160	\N	0004	f	2016-01-01	2016-01-01	\N	26	t	\N	f	f
000c0000-55ff-e57a-7cb8-0bf1b9b69d74	000d0000-55ff-e57a-4652-2f23ebbd6ca6	\N	00090000-55ff-e579-fbd9-d82a4860c609	\N	0005	f	2016-01-01	2016-01-01	\N	7	t	\N	f	f
000c0000-55ff-e57a-21bf-76df251786ea	000d0000-55ff-e57a-271e-fc6dda8dc64c	\N	00090000-55ff-e579-a2c1-4335b1934e23	000b0000-55ff-e579-de69-eec4c3f832fe	0006	f	2016-01-01	2016-01-01	\N	1	t	\N	t	t
000c0000-55ff-e57a-47b6-8246e004e13d	000d0000-55ff-e57a-6970-10882888158b	00100000-55ff-e579-783f-6a72a365aacc	00090000-55ff-e579-fa83-8395be01ef3c	\N	0007	t	2016-01-01	2016-01-01	\N	14	t	\N	f	t
000c0000-55ff-e57a-1af6-3d4de9628363	000d0000-55ff-e57a-644a-33ccf743372d	\N	00090000-55ff-e579-1920-db5cfe2abde0	000b0000-55ff-e579-5d9d-8e612086bfdc	0008	f	2016-01-01	2016-01-01	\N	12	t	\N	t	t
000c0000-55ff-e57a-378e-09cfa8caa5d0	000d0000-55ff-e57a-6970-10882888158b	00100000-55ff-e579-8226-3d5791641e46	00090000-55ff-e579-d2b0-f25aa7c4df12	\N	0009	t	2017-01-01	2017-01-01	\N	15	t	\N	f	t
000c0000-55ff-e57a-50f9-635d86e9556f	000d0000-55ff-e57a-6970-10882888158b	00100000-55ff-e579-befa-be03dba42809	00090000-55ff-e579-db67-82735a01c069	\N	0010	t	\N	2015-09-21	\N	16	f	\N	f	t
000c0000-55ff-e57a-d962-8ab53a3c1697	000d0000-55ff-e57a-6970-10882888158b	00100000-55ff-e579-7f32-cec97470dd1f	00090000-55ff-e579-62cb-346bd0aa1101	\N	0011	t	2017-01-01	\N	\N	17	f	\N	f	t
000c0000-55ff-e57a-7b6e-f755cc27910d	000d0000-55ff-e57a-518f-82bdbfc1f22a	\N	00090000-55ff-e579-e706-e3602a17db9b	000b0000-55ff-e579-a047-dbf9aec72227	0012	f	\N	\N	\N	2	t	\N	t	t
\.


--
-- TOC entry 3018 (class 0 OID 20252155)
-- Dependencies: 228
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 3009 (class 0 OID 20252035)
-- Dependencies: 219
-- Data for Name: avtorbesedila; Type: TABLE DATA; Schema: public; Owner: -
--

COPY avtorbesedila (id, besedilo_id, oseba_id, tipavtorja, zaporedna, alivnaslovu) FROM stdin;
003d0000-55ff-e579-086b-fe6b54fcf550	00160000-55ff-e579-0146-1596fc8e3f08	00090000-55ff-e579-5de3-3709c123dc7c	Avtor originala	10	t
003d0000-55ff-e579-ee88-53effaf1cfb1	00160000-55ff-e579-0146-1596fc8e3f08	00090000-55ff-e579-12f3-1d1c91360bfd	Predelava	14	t
003d0000-55ff-e579-a28b-553ca579899e	00160000-55ff-e579-9e90-f07eef6b87f1	00090000-55ff-e579-5cda-b9b72a0d7cd9	Avtor originala	11	t
003d0000-55ff-e579-9dc0-47f32aef7f1d	00160000-55ff-e579-72f7-fe0b7b433624	00090000-55ff-e579-8ed8-64c51f72d95e	Avtor originala	12	t
003d0000-55ff-e579-f987-357d0834d724	00160000-55ff-e579-0146-1596fc8e3f08	00090000-55ff-e579-f44a-7fddef7ddbc3	Predelava	18	f
\.


--
-- TOC entry 3012 (class 0 OID 20252065)
-- Dependencies: 222
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, stevilka, naslov, podnaslov, jezik, naslovizvirnika, internacionalninaslov, datumprejema, moskevloge, zenskevloge, povzetekvsebine, letoizida, krajizida, zaloznik) FROM stdin;
00160000-55ff-e579-0146-1596fc8e3f08	0001	Sen kresne noči		slovenščina	A Midsummer Night's Dream	\N	2015-04-26	5	5	Nastopajo Titanija, Hipolita, Oberon, ...	\N	\N	\N
00160000-55ff-e579-9e90-f07eef6b87f1	0002	Bratje Karamazovi		slovenščina	Bratja Karamazjovji	\N	2015-12-04	4	1	Svetovna uspešnica	\N	\N	\N
00160000-55ff-e579-72f7-fe0b7b433624	0003	Smoletov Vrt		slovenščina		\N	2015-05-26	2	8		\N	\N	\N
\.


--
-- TOC entry 3033 (class 0 OID 20252411)
-- Dependencies: 243
-- Data for Name: datoteka; Type: TABLE DATA; Schema: public; Owner: -
--

COPY datoteka (id, owner_id, filename, transfers, size, format, hash, createdat, uploadedat, upor, datknj) FROM stdin;
\.


--
-- TOC entry 2987 (class 0 OID 20251825)
-- Dependencies: 197
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_splosni_id, prostor_id, sezona_id, planiranzacetek, allday, zacetek, konec, status, razred, termin, title) FROM stdin;
00180000-55ff-e57a-60b8-b2cc6ba0da29	\N	\N	00200000-55ff-e57a-4928-5a003adaf92c	\N	\N	\N	\N	2015-06-26 10:00:00	f	2015-06-26 10:00:00	2015-06-26 12:00:00	200s	200s		dogodek 1
00180000-55ff-e57a-c6c9-8a0943c714bd	\N	\N	00200000-55ff-e57a-dfd7-a19f9a5d17a2	\N	\N	\N	\N	2015-06-27 10:00:00	f	2015-06-27 10:00:00	2015-06-27 12:00:00	300s	200s		dogodek 2
00180000-55ff-e57a-db46-89d5c7e257f9	\N	\N	00200000-55ff-e57a-17ee-b5bcf97783ab	\N	\N	\N	\N	2015-08-01 20:00:00	f	2015-08-01 20:00:00	2015-08-01 23:00:00	400s	200s		dogodek 3
00180000-55ff-e57a-8dfc-322f2d47cacd	\N	\N	00200000-55ff-e57a-255f-8adfe5eb9d9e	\N	\N	\N	\N	2015-08-01 20:00:00	f	2015-08-01 20:00:00	2015-08-01 23:00:00	100s	200s		dogodek 4
00180000-55ff-e57a-06f6-69baf0325d69	\N	\N	00200000-55ff-e57a-656c-83968dd5bd30	\N	\N	\N	\N	2015-08-01 20:00:00	f	2015-08-01 20:00:00	2015-08-01 23:00:00	500s	200s		dogodek 5
\.


--
-- TOC entry 2989 (class 0 OID 20251857)
-- Dependencies: 199
-- Data for Name: dogodeksplosni; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodeksplosni (id) FROM stdin;
\.


--
-- TOC entry 3027 (class 0 OID 20252337)
-- Dependencies: 237
-- Data for Name: drugivir; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drugivir (id, znesek, opis, mednarodni, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 2980 (class 0 OID 20251739)
-- Dependencies: 190
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-55ff-e578-f728-0a119c6870cc	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-55ff-e578-0344-6a6381b32ab7	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-55ff-e578-dd89-8edb2c026fe8	AL	ALB	008	Albania 	Albanija	\N
00040000-55ff-e578-6793-5a66f3b25581	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-55ff-e578-aa58-67b4cfe49f96	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-55ff-e578-239e-488cbb9b4bec	AD	AND	020	Andorra 	Andora	\N
00040000-55ff-e578-ba49-d85fe46b2636	AO	AGO	024	Angola 	Angola	\N
00040000-55ff-e578-84a5-b0ee2ce171c8	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-55ff-e578-7602-487cea601134	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-55ff-e578-10c6-5922b964eeb2	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-55ff-e578-5f7f-c8f211190c0c	AR	ARG	032	Argentina 	Argenitna	\N
00040000-55ff-e578-d541-b70c4024cd2b	AM	ARM	051	Armenia 	Armenija	\N
00040000-55ff-e578-1178-b53123c17f68	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-55ff-e578-4dd4-d98c4630a5b7	AU	AUS	036	Australia 	Avstralija	\N
00040000-55ff-e578-270e-ac1c80cc482d	AT	AUT	040	Austria 	Avstrija	\N
00040000-55ff-e578-d32f-d4a19c100739	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-55ff-e578-ab37-a0b92f239ee9	BS	BHS	044	Bahamas 	Bahami	\N
00040000-55ff-e578-c244-a2f63ea66ee6	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-55ff-e578-1bde-699f423d5afb	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-55ff-e578-b810-f60420d6b9f8	BB	BRB	052	Barbados 	Barbados	\N
00040000-55ff-e578-4024-f9d7dde97c03	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-55ff-e578-76f7-159baf276be2	BE	BEL	056	Belgium 	Belgija	\N
00040000-55ff-e578-eb8b-b947061d8be5	BZ	BLZ	084	Belize 	Belize	\N
00040000-55ff-e578-b9fb-6cbd91f9abe5	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-55ff-e578-516a-522522d84a88	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-55ff-e578-0cfa-db9f65bf64b5	BT	BTN	064	Bhutan 	Butan	\N
00040000-55ff-e578-be23-163a37c9324e	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-55ff-e578-6338-e5cb0d6d7e6d	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-55ff-e578-9b3f-428429c15af2	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-55ff-e578-e53a-a332b805f898	BW	BWA	072	Botswana 	Bocvana	\N
00040000-55ff-e578-4c25-2febe044c467	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-55ff-e578-35c2-4635b7f8ec72	BR	BRA	076	Brazil 	Brazilija	\N
00040000-55ff-e578-e3c6-eae625047d74	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-55ff-e578-e62e-54fcebb0bc16	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-55ff-e578-2e23-dc22c7b65bfb	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-55ff-e578-8a61-357ba893cc70	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-55ff-e578-e0d6-2c750df70277	BI	BDI	108	Burundi 	Burundi 	\N
00040000-55ff-e578-6531-031b838434be	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-55ff-e578-4d20-53fd0b3fecb1	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-55ff-e578-e1d7-340e0f94f9ea	CA	CAN	124	Canada 	Kanada	\N
00040000-55ff-e578-8e24-1cb3b516ac51	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-55ff-e578-d61d-24c8ee328828	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-55ff-e578-067e-bd64ad103bfc	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-55ff-e578-1778-18207a5d7395	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-55ff-e578-e61b-90e44eef7a15	CL	CHL	152	Chile 	Čile	\N
00040000-55ff-e578-a1c6-a318e2cd12fa	CN	CHN	156	China 	Kitajska	\N
00040000-55ff-e578-3d64-cea1deec7b1e	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-55ff-e578-fed2-43b8a41c3a34	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-55ff-e578-b23b-16aad891085d	CO	COL	170	Colombia 	Kolumbija	\N
00040000-55ff-e578-b4d7-8cc45d55cb51	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-55ff-e578-608b-83701267a8c3	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-55ff-e578-4041-62a2ec6273d1	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-55ff-e578-5685-66eca1d9c6b8	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-55ff-e578-88f1-13c2e3c2d64c	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-55ff-e578-cee8-d3b1ee59055c	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-55ff-e578-560f-c613a3355d3f	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-55ff-e578-4838-131988647e40	CU	CUB	192	Cuba 	Kuba	\N
00040000-55ff-e578-aade-6605de9db88b	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-55ff-e578-caf0-e9e45eba0197	CY	CYP	196	Cyprus 	Ciper	\N
00040000-55ff-e578-12e4-887296dd465d	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-55ff-e578-63ee-234a45fcc7bc	DK	DNK	208	Denmark 	Danska	\N
00040000-55ff-e578-1bce-ecdaf6843395	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-55ff-e578-2be4-6a1f1523b0ff	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-55ff-e578-f051-d72eecaacf88	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-55ff-e578-5654-98942ab21a1f	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-55ff-e578-7a1c-daa17be478c4	EG	EGY	818	Egypt 	Egipt	\N
00040000-55ff-e578-621f-abd7019afef8	SV	SLV	222	El Salvador 	Salvador	\N
00040000-55ff-e578-55f3-2ffb04b31583	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-55ff-e578-b6ac-86656347953c	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-55ff-e578-9d46-30508f7caddc	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-55ff-e578-522a-d1b2970b085e	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-55ff-e578-8d2e-e454560cdd46	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-55ff-e578-4aae-0b271490cc48	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-55ff-e578-b4cc-e791633d9e07	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-55ff-e578-7e71-5ac401e021df	FI	FIN	246	Finland 	Finska	\N
00040000-55ff-e578-f643-26413ce6fb0d	FR	FRA	250	France 	Francija	\N
00040000-55ff-e578-f682-e1b1be9b73c1	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-55ff-e578-2eff-49ebd7f0a1dd	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-55ff-e578-300a-4310e759ce4f	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-55ff-e578-1364-055ee79b270b	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-55ff-e578-77dc-edf3b9038644	GA	GAB	266	Gabon 	Gabon	\N
00040000-55ff-e578-1aec-d18016f6cac6	GM	GMB	270	Gambia 	Gambija	\N
00040000-55ff-e578-dabf-43253f81928b	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-55ff-e578-4513-14b5281f04c4	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-55ff-e578-7774-bc1d43e6be3b	GH	GHA	288	Ghana 	Gana	\N
00040000-55ff-e578-f300-d442a629a4b8	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-55ff-e578-fef9-1fea94f99018	GR	GRC	300	Greece 	Grčija	\N
00040000-55ff-e578-1add-b041b39fe905	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-55ff-e578-bd8a-5128cb35f7a8	GD	GRD	308	Grenada 	Grenada	\N
00040000-55ff-e578-2174-aeb03b658950	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-55ff-e578-f93c-9033756e81cc	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-55ff-e578-69ed-c58f323db9c8	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-55ff-e578-ffdd-3345b993fb74	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-55ff-e578-1d3a-19204089a7c6	GN	GIN	324	Guinea 	Gvineja	\N
00040000-55ff-e578-f86f-2fadfc7759f2	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-55ff-e578-eb87-9e3311639712	GY	GUY	328	Guyana 	Gvajana	\N
00040000-55ff-e578-46ac-8d986457228b	HT	HTI	332	Haiti 	Haiti	\N
00040000-55ff-e578-0299-20547e0c63b5	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-55ff-e578-2616-6bfa21c0c019	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-55ff-e578-60c2-80b3dd9410c8	HN	HND	340	Honduras 	Honduras	\N
00040000-55ff-e578-418e-c287dde4088d	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-55ff-e578-a43b-57f77808a850	HU	HUN	348	Hungary 	Madžarska	\N
00040000-55ff-e578-f1ba-a73abb0fec5f	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-55ff-e578-8215-e6322b66e5c4	IN	IND	356	India 	Indija	\N
00040000-55ff-e578-6eb1-e1a81f34087f	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-55ff-e578-0716-044e226f6e4b	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-55ff-e578-3cfe-7795566450a5	IQ	IRQ	368	Iraq 	Irak	\N
00040000-55ff-e578-c3ec-2552c8e99b39	IE	IRL	372	Ireland 	Irska	\N
00040000-55ff-e578-42b9-59c8d62c5413	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-55ff-e578-8d25-58da5d0037bf	IL	ISR	376	Israel 	Izrael	\N
00040000-55ff-e578-7bdf-38a116c0830c	IT	ITA	380	Italy 	Italija	\N
00040000-55ff-e578-d753-1b4f71dc6267	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-55ff-e578-50e3-e02af13df052	JP	JPN	392	Japan 	Japonska	\N
00040000-55ff-e578-5378-56f7af241202	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-55ff-e578-a34e-a81a18565cc8	JO	JOR	400	Jordan 	Jordanija	\N
00040000-55ff-e578-2338-7ba201c7e663	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-55ff-e578-2ad0-ef144f73d74e	KE	KEN	404	Kenya 	Kenija	\N
00040000-55ff-e578-3298-9b80ddd2f780	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-55ff-e578-55ac-4dc639bcfeb7	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-55ff-e578-2646-730999cd3aec	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-55ff-e578-a6b3-45ff25242fa2	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-55ff-e578-b79e-aafb7eb8a8d1	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-55ff-e578-43b2-155e55af445f	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-55ff-e578-c299-e482f2372e64	LV	LVA	428	Latvia 	Latvija	\N
00040000-55ff-e578-f011-5b26cfb83027	LB	LBN	422	Lebanon 	Libanon	\N
00040000-55ff-e578-905f-2d0535ae8fe4	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-55ff-e578-2908-e639277e595e	LR	LBR	430	Liberia 	Liberija	\N
00040000-55ff-e578-f1ea-90ea2d30820f	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-55ff-e578-7f09-9a55be3df5b7	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-55ff-e578-2db4-40b4e015df66	LT	LTU	440	Lithuania 	Litva	\N
00040000-55ff-e578-339d-fe7a8250fb9e	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-55ff-e578-99e5-e7cbd86b2b35	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-55ff-e578-65f2-a64b421ad9bd	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-55ff-e578-2831-0b0bab43dfcf	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-55ff-e578-1250-76c1e4fd1acb	MW	MWI	454	Malawi 	Malavi	\N
00040000-55ff-e578-4a95-e9530eab4b49	MY	MYS	458	Malaysia 	Malezija	\N
00040000-55ff-e578-546e-6449ba775c3f	MV	MDV	462	Maldives 	Maldivi	\N
00040000-55ff-e578-877f-7cf58a88a40c	ML	MLI	466	Mali 	Mali	\N
00040000-55ff-e578-cd3f-509909e8024f	MT	MLT	470	Malta 	Malta	\N
00040000-55ff-e578-6165-eea6b970f8c3	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-55ff-e578-fdd8-77323788f081	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-55ff-e578-e524-8a85623cacf8	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-55ff-e578-444a-f1116fec6995	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-55ff-e578-963b-1ab4e7d8fc01	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-55ff-e578-d135-5b09e7308def	MX	MEX	484	Mexico 	Mehika	\N
00040000-55ff-e578-6980-5bf72ba4a190	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-55ff-e578-9744-3e86abb5ff42	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-55ff-e578-94d7-efaf9ded3268	MC	MCO	492	Monaco 	Monako	\N
00040000-55ff-e578-ee1c-a7fc30d4d453	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-55ff-e578-f8e0-6e5b98ce2879	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-55ff-e578-f2fa-cc377c000fa8	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-55ff-e578-25ee-1923984ff52d	MA	MAR	504	Morocco 	Maroko	\N
00040000-55ff-e578-2d1a-d24998294039	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-55ff-e578-40a2-7c0f741e8b53	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-55ff-e578-5262-9a72d884624e	NA	NAM	516	Namibia 	Namibija	\N
00040000-55ff-e578-2736-5b7fa0d80a21	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-55ff-e578-f105-185f6600e0d2	NP	NPL	524	Nepal 	Nepal	\N
00040000-55ff-e578-afe4-8a50791129d9	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-55ff-e578-fa61-de9fcdf014a9	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-55ff-e578-adbf-a0ce9dacaf27	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-55ff-e578-71b8-36a00ad38e5e	NE	NER	562	Niger 	Niger 	\N
00040000-55ff-e578-023d-31995693bce9	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-55ff-e578-1a67-e5e12b46e788	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-55ff-e578-7ede-9a735ba81ea9	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-55ff-e578-b507-ed4ac760d890	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-55ff-e578-e6d5-326bcd8a3912	NO	NOR	578	Norway 	Norveška	\N
00040000-55ff-e578-6cd2-7e50c66248f9	OM	OMN	512	Oman 	Oman	\N
00040000-55ff-e578-fcbc-91267ac3abb1	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-55ff-e578-6317-cdc91329817d	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-55ff-e578-b5ad-f7932ee4e83d	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-55ff-e578-92b7-f6273df93129	PA	PAN	591	Panama 	Panama	\N
00040000-55ff-e578-28fb-836c392ce080	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-55ff-e578-53e2-35b15b59e8ae	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-55ff-e578-8e35-7629dbb6641c	PE	PER	604	Peru 	Peru	\N
00040000-55ff-e578-e48d-34a872f8f25e	PH	PHL	608	Philippines 	Filipini	\N
00040000-55ff-e578-f7ae-b30c196ce179	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-55ff-e578-3e55-cfb627b993e1	PL	POL	616	Poland 	Poljska	\N
00040000-55ff-e578-82a5-6d61e8646e8f	PT	PRT	620	Portugal 	Portugalska	\N
00040000-55ff-e578-0a98-c7500d7d3a26	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-55ff-e578-e02e-7bce60cd3a8b	QA	QAT	634	Qatar 	Katar	\N
00040000-55ff-e578-c33e-ff6e5a667958	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-55ff-e578-3b97-277eb8211fb3	RO	ROU	642	Romania 	Romunija	\N
00040000-55ff-e578-e988-633769b2c71f	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-55ff-e578-0b25-427e58ea27d0	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-55ff-e578-0c0f-e3ea1030ec3f	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-55ff-e578-4f60-a6bf216fbb55	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-55ff-e578-28df-e919d7e2c023	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-55ff-e578-89d1-bfe88f9f1fa5	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-55ff-e578-08eb-534b2a8becf4	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-55ff-e578-ee04-31a9c3a2ef5e	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-55ff-e578-532a-3de5ab259ab4	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-55ff-e578-f0c0-c1a2e8e8abd4	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-55ff-e578-395c-d2473907f60a	SM	SMR	674	San Marino 	San Marino	\N
00040000-55ff-e578-03a7-9b1dd3292811	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-55ff-e578-294c-4eda9523a269	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-55ff-e578-6a4f-dd86c082156e	SN	SEN	686	Senegal 	Senegal	\N
00040000-55ff-e578-18dd-24fcddd00c0b	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-55ff-e578-a441-eed4bdc67298	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-55ff-e578-cbf9-233eaaf93f24	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-55ff-e578-2323-0fa6986bca9c	SG	SGP	702	Singapore 	Singapur	\N
00040000-55ff-e578-6b9f-d07e70dfc9cd	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-55ff-e578-151b-55aa76080ee7	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-55ff-e578-29f2-d4dc80ef1612	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-55ff-e578-c4da-68d975be75b3	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-55ff-e578-1023-85bc73bdbc7b	SO	SOM	706	Somalia 	Somalija	\N
00040000-55ff-e578-67b3-208a24dc9b42	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-55ff-e578-cc22-d18368e31a87	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-55ff-e578-525b-e90909a5257a	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-55ff-e578-0a07-c6f0fff00f9a	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-55ff-e578-bd1e-2bab6b5efe14	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-55ff-e578-c04f-6f73574e6378	SD	SDN	729	Sudan 	Sudan	\N
00040000-55ff-e578-c3de-a20b21635ae6	SR	SUR	740	Suriname 	Surinam	\N
00040000-55ff-e578-972f-42fb5dd4134f	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-55ff-e578-5b1c-75df113b5057	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-55ff-e578-a7c1-5746451ec8cd	SE	SWE	752	Sweden 	Švedska	\N
00040000-55ff-e578-21be-c6d01fa27924	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-55ff-e578-889b-8fbd412f1790	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-55ff-e578-d51a-2593e5d4af9c	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-55ff-e578-25b6-a4416a51fdbb	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-55ff-e578-011d-4af241fbafd1	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-55ff-e578-97f9-0a18c6b019a4	TH	THA	764	Thailand 	Tajska	\N
00040000-55ff-e578-08b3-8dbd7f947e05	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-55ff-e578-6571-93689d0b05f8	TG	TGO	768	Togo 	Togo	\N
00040000-55ff-e578-8725-ebb7d4f26b21	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-55ff-e578-efcf-a7008e6ecfa8	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-55ff-e578-cc9c-118e568494c3	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-55ff-e578-9a28-f1a6a3873125	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-55ff-e578-f38c-1ccea9f0a897	TR	TUR	792	Turkey 	Turčija	\N
00040000-55ff-e578-8096-b828809cbee5	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-55ff-e578-ea6b-df71e455c17a	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-55ff-e578-6235-b0ed5f9d974e	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-55ff-e578-3fb6-3238a3c4b976	UG	UGA	800	Uganda 	Uganda	\N
00040000-55ff-e578-0992-70cce2415166	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-55ff-e578-abeb-7104085f583a	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-55ff-e578-e4da-9d503c66a9d4	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-55ff-e578-3e4e-28c0ed1746a9	US	USA	840	United States 	Združene države Amerike	\N
00040000-55ff-e578-3efc-1e31c3ad83d5	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-55ff-e578-9086-d8f13598e433	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-55ff-e578-7fea-ffd70aeb2ad3	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-55ff-e578-c0d5-e1aca4a88b7b	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-55ff-e578-9816-eb6faae22c5f	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-55ff-e578-a66a-a42227564d14	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-55ff-e578-3b67-d26dd7d7b75f	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-55ff-e578-d34a-d5213195c625	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-55ff-e578-cf00-67eb3ddbb792	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-55ff-e578-a5b2-1a0f7c4f3e29	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-55ff-e578-4fdd-0d744179a8d2	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-55ff-e578-1672-f225fb3f6854	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-55ff-e578-b49c-8b27f27e85d1	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 3020 (class 0 OID 20252185)
-- Dependencies: 230
-- Data for Name: enotaprograma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY enotaprograma (id, uprizoritev_id, program_dela_id, gostitelj_id, celotnavrednost, nasdelez, celotnavrednostmat, celotnavrednostgostovsz, zaproseno, lastnasredstva, avtorskihonorarji, avtorskihonorarjisamoz, tantieme, avtorskepravice, materialni, imakoprodukcije, vlozekgostitelja, drugijavni, stzaposlenih, stzaposumet, stzaposdrug, sthonorarnih, sthonorarnihigr, sthonorarnihigrtujjz, sthonorarnihigrsamoz, obiskdoma, obiskkopr, obiskgost, obiskzamejo, obiskint, obiskkoprint, ponovidoma, ponovikopr, ponovizamejo, ponovigost, ponovikoprint, ponoviint, naziv, kpe, sort, tipprogramskeenote_id, tip, prikoproducentu, strosekodkpred, stroskiostali, krajgostovanja, ustanova, datumgostovanja, transportnistroski, dnevprvzad, drzavagostovanja_id, stpe, zvrst, stpredstav, stokroglihmiz, stpredstavitev, stdelavnic, stdrugidogodki, stprodukcij, caspriprave, casizvedbe, prizorisca, umetvodja, programskotelo, sttujihselektorjev) FROM stdin;
002f0000-55ff-e57a-e0da-829a7167cfa2	000e0000-55ff-e579-f92a-0020f578238c	\N	\N	9000.30	9000.30	9000.30	0.00	3600.12	5299.98	4000.40	1000.40	200.20	200.30	4599.40	\N	0.00	100.20	0	2	2	2	2	2	\N	40	0	0	0	0	0	1	0	0	0	0	0		0.00	\N	002b0000-55ff-e578-2be6-45b5a9efda1d	premiera	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-55ff-e57a-7560-bb887ece2c84	000e0000-55ff-e579-1a99-6469f68378cd	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	\N	60	0	0	0	0	0	1	0	0	0	0	0		0.00	\N	002b0000-55ff-e578-4d33-b13bf32bdeaa	premiera	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-55ff-e57a-14d4-8b085bcbb53e	000e0000-55ff-e579-1486-10e414ecf329	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	\N	60	0	0	0	0	0	1	0	0	0	0	0		0.00	\N	002b0000-55ff-e578-2be6-45b5a9efda1d	premiera	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-55ff-e57a-7cc8-0165fc984ec4	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-54.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	54.20	5	0	0	3	0	0	\N	22	0	0	0	0	0	0	0	0	0	0	0	Urejanje portala	0.00	10	\N	razno	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-55ff-e57a-3674-34873df49216	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-31.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	31.20	5	0	0	3	0	0	\N	202	0	0	0	0	0	0	0	0	0	0	0	Delavnice otroci	0.00	8	\N	razno	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 3005 (class 0 OID 20251990)
-- Dependencies: 215
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, podrocje, vodjaekipe, naziv, komentar, velikost, pomembna, sort, seplanira, dovoliprekrivanje, maxprekrivanj, tipfunkcije_id) FROM stdin;
000d0000-55ff-e57a-fa73-ba1d11fc0a2f	000e0000-55ff-e579-1a99-6469f68378cd	000c0000-55ff-e57a-97b6-0f165e3aa5a0	igralec	\N	Tezej	glavna vloga	velika	t	5	t	t	\N	000f0000-55ff-e578-2396-b5623c426532
000d0000-55ff-e57a-34b9-b1f1da15a779	000e0000-55ff-e579-1a99-6469f68378cd	000c0000-55ff-e57a-8688-9fe7c816b94f	umetnik	\N	Režija		velika	t	8	t	t	\N	000f0000-55ff-e578-dfa7-c4a2b62bdab2
000d0000-55ff-e57a-d24a-c8a5ec333076	000e0000-55ff-e579-1a99-6469f68378cd	000c0000-55ff-e57a-037e-930b1d9ffd42	inspicient	t	Inšpicient			t	8	t	t	\N	000f0000-55ff-e578-d20e-160098789e42
000d0000-55ff-e57a-6275-b5d74f16de6b	000e0000-55ff-e579-1a99-6469f68378cd	000c0000-55ff-e57a-81c2-117c2114236f	tehnik	t	Tehnični vodja			t	8	t	t	\N	000f0000-55ff-e578-36e9-09897a7faf9f
000d0000-55ff-e57a-4652-2f23ebbd6ca6	000e0000-55ff-e579-1a99-6469f68378cd	000c0000-55ff-e57a-7cb8-0bf1b9b69d74	tehnik	\N	Razsvetljava			t	3	t	t	\N	000f0000-55ff-e578-36e9-09897a7faf9f
000d0000-55ff-e57a-271e-fc6dda8dc64c	000e0000-55ff-e579-1a99-6469f68378cd	000c0000-55ff-e57a-21bf-76df251786ea	igralec	\N	Helena	glavna vloga	velika	t	5	t	t	\N	000f0000-55ff-e578-2396-b5623c426532
000d0000-55ff-e57a-6970-10882888158b	000e0000-55ff-e579-1a99-6469f68378cd	000c0000-55ff-e57a-378e-09cfa8caa5d0	igralec	\N	Hipolita	glavna vloga	velika	t	6	t	t	\N	000f0000-55ff-e578-2396-b5623c426532
000d0000-55ff-e57a-644a-33ccf743372d	000e0000-55ff-e579-1a99-6469f68378cd	000c0000-55ff-e57a-1af6-3d4de9628363	umetnik	\N	Lektoriranje			t	22	t	t	\N	000f0000-55ff-e578-3534-3a1165a254f7
000d0000-55ff-e57a-518f-82bdbfc1f22a	000e0000-55ff-e579-1a99-6469f68378cd	000c0000-55ff-e57a-7b6e-f755cc27910d	umetnik	\N	Avtor	Avtor besedila		t	2	t	f	\N	000f0000-55ff-e578-26c4-18d16f95599d
\.


--
-- TOC entry 2985 (class 0 OID 20251804)
-- Dependencies: 195
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta, zamejstvo, kraj) FROM stdin;
\.


--
-- TOC entry 2983 (class 0 OID 20251779)
-- Dependencies: 193
-- Data for Name: job; Type: TABLE DATA; Schema: public; Owner: -
--

COPY job (id, user_id, name, task, status, log, datum, casizvedbe, izveden, data, alert, hidden, upor, datknj) FROM stdin;
\.


--
-- TOC entry 2981 (class 0 OID 20251756)
-- Dependencies: 191
-- Data for Name: kontaktnaoseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kontaktnaoseba (id, popa_id, oseba_id, status, funkcija, opis) FROM stdin;
00260000-55ff-e579-1773-68e7deb5218c	00080000-55ff-e579-5a3b-8aa7fb667e7d	00090000-55ff-e579-db67-82735a01c069	AK		igralka
\.


--
-- TOC entry 2994 (class 0 OID 20251904)
-- Dependencies: 204
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 3031 (class 0 OID 20252392)
-- Dependencies: 241
-- Data for Name: mapa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa (id, lastnik_id, parent_id, ime, komentar, caskreiranja, casspremembe, javnidostop, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3032 (class 0 OID 20252404)
-- Dependencies: 242
-- Data for Name: mapa_zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa_zapis (mapa_id, zapis_id) FROM stdin;
\.


--
-- TOC entry 3034 (class 0 OID 20252426)
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
-- TOC entry 2998 (class 0 OID 20251929)
-- Dependencies: 208
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 2978 (class 0 OID 20251713)
-- Dependencies: 188
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-55ff-e578-2e13-67412fb5f04f	popa.stakli	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-55ff-e578-3517-9846f9ad4cf2	oseba.spol	array	a:2:{s:1:"M";a:1:{s:5:"label";s:6:"Moški";}s:1:"Z";a:1:{s:5:"label";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-55ff-e578-a960-9b1d3e7dda5a	telefonska.vrsta	array	a:3:{s:7:"mobilna";a:1:{s:5:"label";s:7:"Mobilni";}s:6:"domaca";a:1:{s:5:"label";s:6:"Domač";}s:6:"fiksna";a:1:{s:5:"label";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-55ff-e578-89e3-3d140a67a5c5	kontaktnaoseba.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status kontaktne osebe
00000000-55ff-e578-1f46-b807f1726194	dogodek.status	array	a:7:{s:4:"100s";a:1:{s:5:"label";s:11:"Dolgoročno";}s:4:"200s";a:1:{s:5:"label";s:9:"Planirano";}s:4:"300s";a:1:{s:5:"label";s:8:"Fiksiran";}s:4:"400s";a:1:{s:5:"label";s:17:"Potrjen - interno";}s:4:"500s";a:1:{s:5:"label";s:15:"Potrjen - javno";}s:4:"600s";a:1:{s:5:"label";s:10:"Zaključen";}s:4:"700s";a:1:{s:5:"label";s:7:"Obdelan";}}	f	t	t	\N	Tabela statusa dogodkov
00000000-55ff-e578-5c6d-9c0cf5bc1568	dogodek.razred	array	a:5:{s:4:"100s";a:2:{s:5:"label";s:9:"Predstava";s:4:"type";s:9:"predstava";}s:4:"200s";a:2:{s:5:"label";s:4:"Vaja";s:4:"type";s:4:"vaja";}s:4:"300s";a:2:{s:5:"label";s:10:"Gostovanje";s:4:"type";s:10:"gostovanje";}s:4:"400s";a:2:{s:5:"label";s:16:"Splošni dogodek";s:4:"type";s:8:"splošni";}s:4:"500s";a:2:{s:5:"label";s:10:"Zasedenost";s:4:"type";s:10:"zasedenost";}}	f	t	t	\N	Tabela razredov dogodkov, ki jih aplikacija podpira
00000000-55ff-e578-17cd-e913570c348d	uprizoritev.faza	array	a:6:{s:20:"predprodukcija-ideja";a:1:{s:5:"label";s:16:"Dolgoročni plan";}s:20:"predprodukcija-poziv";a:1:{s:5:"label";s:29:"Predprodukcija, v fazi poziva";}s:30:"predprodukcija-potrjen_program";a:1:{s:5:"label";s:34:"Predprodukcija, program je potrjen";}s:10:"produkcija";a:1:{s:5:"label";s:10:"Produkcija";}s:14:"postprodukcija";a:1:{s:5:"label";s:14:"Postprodukcija";}s:5:"arhiv";a:1:{s:5:"label";s:10:"Arhivirana";}}	f	t	f	\N	Faza uprizoritve
00000000-55ff-e578-950b-36beb8422a76	funkcija.podrocje	array	a:4:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}}	f	t	f	\N	Področje funkcije
00000000-55ff-e578-c6e8-dda84f2b1d49	tipfunkcije.podrocje	array	a:4:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}}	f	t	f	\N	Področje funkcije
00000000-55ff-e578-f2c0-632a50dee2bb	funkcija.velikost	array	a:4:{s:7:"stataza";a:1:{s:5:"label";s:8:"Stataža";}s:4:"mala";a:1:{s:5:"label";s:21:"Mala vloga / funkcija";}s:7:"srednja";a:1:{s:5:"label";s:24:"Srednja vloga / funkcija";}s:6:"velika";a:1:{s:5:"label";s:23:"Velika vloga / funkcija";}}	f	t	f	\N	Velikost funkcije
00000000-55ff-e578-28a3-62f71a718539	zaposlitev.status	array	a:2:{s:1:"A";a:1:{s:5:"label";s:7:"Aktivna";}s:1:"N";a:1:{s:5:"label";s:9:"Neaktivna";}}	f	t	f	\N	Status zaposlitve
00000000-55ff-e578-3312-25867c86f81b	produkcijskahisa.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktivna";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktivna";}}	f	t	f	\N	Status produkcijske hiše
00000000-55ff-e578-dc4e-112b65c61746	strosekuprizoritve.tipstroska	array	a:1:{s:10:"materialni";a:1:{s:5:"label";s:19:"Materialni strošek";}}	f	t	f	\N	Tip stroška
00000000-55ff-e578-8e33-6669115bdf27	fsacl.dostop	array	a:4:{s:1:"X";a:1:{s:5:"label";s:12:"Brez dostopa";}s:1:"R";a:1:{s:5:"label";s:11:"Samo branje";}s:2:"RW";a:1:{s:5:"label";s:17:"Branje in pisanje";}s:3:"RWD";a:1:{s:5:"label";s:26:"Branje pisanje in brisanje";}}	f	t	f	\N	ACL Javni dostop
00000000-55ff-e579-b42b-078c4a171347	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-55ff-e579-d682-d5977f9698d4	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-55ff-e579-9ad4-01ac18a06a41	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-55ff-e579-c834-b237796b6436	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-55ff-e579-495e-4e2b42e382e9	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
00000000-55ff-e57a-15e0-02bd5fca4599	application.tenant.maticnopodjetje	string	s:4:"1001";	f	t	f		Šifra matičnega podjetja v Popa in ProdukcijskaHisa
\.


--
-- TOC entry 2972 (class 0 OID 20251627)
-- Dependencies: 182
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-55ff-e579-5b32-3b6b9230050d	00000000-55ff-e579-b42b-078c4a171347	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-55ff-e579-4462-969e191013cc	00000000-55ff-e579-b42b-078c4a171347	00010000-55ff-e578-58ac-ec3ea5edca36	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-55ff-e579-6e26-68afbe435d06	00000000-55ff-e579-d682-d5977f9698d4	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 2973 (class 0 OID 20251638)
-- Dependencies: 183
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naslov_id, sifra, naziv, ime, priimek, funkcija, srednjeime, polnoime, psevdonim, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
00090000-55ff-e579-0ae7-4f5d8a0276fd	\N	\N	0001	g.	Janez	Novak	a	Peter	Janez Peter Novak	Jani	jani.novak@xxx.xx	1958-01-06	0601958000000	123456789	M	Jani Janez	Slovenija	Slovenija	Ljubljana
00090000-55ff-e579-09a9-85aeab030160	00010000-55ff-e579-e79a-32ca3cbd9d80	\N	0002	dr.	Anton	Horvat	b		Anton  Horvat	Tona	anton.horvat@xxx.xx	1968-02-12	1202968111111	234567890	M		Slovenija	Slovenija	Maribor
00090000-55ff-e579-5567-bc7b2d841877	00010000-55ff-e579-4cf1-fcedbdfae5a8	\N	0003		Ivan	Kovačič	c		Ivan  Kovačič	Ivo	ivan.kovacic@xxx.xx	1975-03-26	2603976222222	345678901	M		Slovenija	Slovenija	Celje
00090000-55ff-e579-d2b0-f25aa7c4df12	00010000-55ff-e579-bb1e-b7bd7407a463	\N	0004	prof.	Jožef	Krajnc	d		Jožef  Krajnc	Joža	jozef.krajnc@xxx.xx	1971-04-30	3004971333333	456789012	M		Slovenija	Slovenija	Kranj
00090000-55ff-e579-c963-d08529eaa3c0	\N	\N	0005		Marko	Zupančič	e		Marko  Zupančič		marko.zupancic@xxx.xx	1984-05-07	0705984444444	567890123	M		Slovenija	Slovenija	Koper
00090000-55ff-e579-a2c1-4335b1934e23	\N	\N	0006	ga.	Marija	Kovač	f		Marija  Kovač		marija.kovac@xxx.xx	1962-06-19	1906962444444	678901234	Z		Slovenija	Slovenija	Murska Sobota
00090000-55ff-e579-62cb-346bd0aa1101	\N	\N	0007	ga.	Ana	Potočnik	g		Ana  Potočnik		ana.potocnik@xxx.xx	1975-07-24	2407975555555	789012345	Z		Slovenija	Slovenija	Novo Mesto
00090000-55ff-e579-fa83-8395be01ef3c	\N	\N	0008	ga.	Maja	Mlakar	h		Maja  Mlakar		maja.mlakar@xxx.xx	1986-08-02	0208986666666	890123456	Z		Slovenija	Slovenija	Nova Gorica
00090000-55ff-e579-db67-82735a01c069	00010000-55ff-e579-c08e-736503f0fc78	\N	0009		Irena	Kos	i		Irena  Kos		irena.kos@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Ptuj
00090000-55ff-e579-e706-e3602a17db9b	\N	\N	0010		Mojca	Vidmar	J		Mojca  Vidmar		mojca.vidmar@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Idrija
00090000-55ff-e579-af5e-674ad240b84e	\N	\N	0011		xx	write protected12345	a		xx  write protected12345		xx@xxx.xx	\N	\N	\N	Z		\N	\N	\N
00090000-55ff-e579-fbd9-d82a4860c609	\N	\N	0012		Luka	Golob	luč	a	Luka a Golob		luka.golob@xxx.xx	\N	\N	\N	M		\N	\N	\N
00090000-55ff-e579-1920-db5cfe2abde0	00010000-55ff-e579-2a34-c7171af004a5	\N	0013		Tatjana	Božič	tajnica	a	Tatjana a Božič		tatjana.bozic@xxx.xx	\N	\N	\N	Z		\N	\N	\N
00090000-55ff-e579-5de3-3709c123dc7c	\N	\N	0014		William	Shakespeare	avtor		William  Shakespeare		\N	\N	\N	\N	M		\N	\N	\N
00090000-55ff-e579-12f3-1d1c91360bfd	\N	\N	0015		Nebojša	Kavader	avtor		Nebojša  Kavader		\N	\N	\N	\N	M		\N	\N	\N
00090000-55ff-e579-5cda-b9b72a0d7cd9	\N	\N	0016		Fjodor	Dostojevski	avtor	Mihajlovič	Fjodor Mihajlovič Dostojevski		\N	\N	\N	\N	M		\N	\N	\N
00090000-55ff-e579-8ed8-64c51f72d95e	\N	\N	0017		Berta 	Hočevar	avtorica		Berta   Hočevar		\N	\N	\N	\N	Z		\N	\N	\N
00090000-55ff-e579-f44a-7fddef7ddbc3	\N	\N	0018		Katarina	Podbevšek	lektorica		Katarina  Podbevšek		\N	\N	\N	\N	Z		\N	\N	\N
\.


--
-- TOC entry 2968 (class 0 OID 20251592)
-- Dependencies: 178
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-55ff-e578-028d-c988a0390977	Aaa-read	Aaa (User,Role,Permission) - branje	f
00030000-55ff-e578-eb29-e1ebbf0a6638	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	f
00030000-55ff-e578-c0bf-4643551007f0	TerminStoritve-vse	TerminStoritve - spreminjanje vseh zapisov	f
00030000-55ff-e578-63eb-81021c233429	Dogodek-readVse	Dogodek - branje vseh, ne glede na status dogodka	f
00030000-55ff-e578-71b5-bd28e7ede483	Oseba-vse	Oseba - vse - za testiranje assert	f
00030000-55ff-e578-a3b3-f581b98c98c8	ProgramDela-lock	ProgramDela - zaklepanje	f
00030000-55ff-e578-243e-95465446b5ee	ProgramDela-unlock	ProgramDela - odklepanje	f
00030000-55ff-e578-fe61-e11febd8aeda	Abonma-read	Abonma - branje	f
00030000-55ff-e578-d09b-510fb6f5a2e3	Abonma-write	Abonma - spreminjanje	f
00030000-55ff-e578-b7ca-af6aed2cd116	Alternacija-read	Alternacija - branje	f
00030000-55ff-e578-6c60-04f4939ceff8	Alternacija-write	Alternacija - spreminjanje	f
00030000-55ff-e578-6eff-2243166aebcb	Arhivalija-read	Arhivalija - branje	f
00030000-55ff-e578-36a1-d516bf471d53	Arhivalija-write	Arhivalija - spreminjanje	f
00030000-55ff-e578-ad73-d508452c78d5	AvtorBesedila-read	AvtorBesedila - branje	f
00030000-55ff-e578-90c8-b7dd96ba26fe	AvtorBesedila-write	AvtorBesedila - spreminjanje	f
00030000-55ff-e578-4eba-2d4c4cf58bcc	Besedilo-read	Besedilo - branje	f
00030000-55ff-e578-6e5c-4ca50c383d9a	Besedilo-write	Besedilo - spreminjanje	f
00030000-55ff-e578-1d6a-19cd1aa2c69c	DogodekIzven-read	DogodekIzven - branje	f
00030000-55ff-e578-269b-4e7b93662c8d	DogodekIzven-write	DogodekIzven - spreminjanje	f
00030000-55ff-e578-19df-80c3c5a5701f	Dogodek-read	Dogodek - branje	f
00030000-55ff-e578-ac48-ba735d200e8b	Dogodek-write	Dogodek - spreminjanje	f
00030000-55ff-e578-ece8-eea8f7eac4bf	DrugiVir-read	DrugiVir - branje	f
00030000-55ff-e578-f4c0-2bbde1c4c841	DrugiVir-write	DrugiVir - spreminjanje	f
00030000-55ff-e578-089b-fe2480743535	Drzava-read	Drzava - branje	f
00030000-55ff-e578-979a-ac020d5a63ec	Drzava-write	Drzava - spreminjanje	f
00030000-55ff-e578-7c0a-3d861ac4eb4c	EnotaPrograma-read	EnotaPrograma - branje	f
00030000-55ff-e578-8dbc-8c0f86b3508b	EnotaPrograma-write	EnotaPrograma - spreminjanje	f
00030000-55ff-e578-72bf-38ce3e48269f	Funkcija-read	Funkcija - branje	f
00030000-55ff-e578-09c2-30a510fac38d	Funkcija-write	Funkcija - spreminjanje	f
00030000-55ff-e578-be22-fdf340af5034	Gostovanje-read	Gostovanje - branje	f
00030000-55ff-e578-89c5-8a8aa1518dc8	Gostovanje-write	Gostovanje - spreminjanje	f
00030000-55ff-e578-48d8-6f5aab03579b	Gostujoca-read	Gostujoca - branje	f
00030000-55ff-e578-b6b6-3ae30e71eca2	Gostujoca-write	Gostujoca - spreminjanje	f
00030000-55ff-e578-ebc7-875c6da7f1b6	KontaktnaOseba-read	KontaktnaOseba - branje	f
00030000-55ff-e578-cfa6-29e85ca901b4	KontaktnaOseba-write	KontaktnaOseba - spreminjanje	f
00030000-55ff-e578-6d33-cbf3b663595a	Kupec-read	Kupec - branje	f
00030000-55ff-e578-5a09-d8c287a332b2	Kupec-write	Kupec - spreminjanje	f
00030000-55ff-e578-ab70-2ef7ab7bf248	NacinPlacina-read	NacinPlacina - branje	f
00030000-55ff-e578-3654-57b8f5ff6509	NacinPlacina-write	NacinPlacina - spreminjanje	f
00030000-55ff-e578-fa1d-067265a1d58c	Option-read	Option - branje	f
00030000-55ff-e578-ab7a-5451a4555e0e	Option-write	Option - spreminjanje	f
00030000-55ff-e578-d4c3-b594579db825	OptionValue-read	OptionValue - branje	f
00030000-55ff-e578-3341-064e9787cd52	OptionValue-write	OptionValue - spreminjanje	f
00030000-55ff-e578-a3e1-861ed7b2c410	Oseba-read	Oseba - branje	f
00030000-55ff-e578-4b9f-77895980a8a2	Oseba-write	Oseba - spreminjanje	f
00030000-55ff-e578-34ac-660acad8a50c	PlacilniInstrument-read	PlacilniInstrument - branje	f
00030000-55ff-e578-7fd7-67c041ae3f40	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	f
00030000-55ff-e578-e8a0-7ff285506d75	PodrocjeSedenja-read	PodrocjeSedenja - branje	f
00030000-55ff-e578-a385-6a969337c509	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	f
00030000-55ff-e578-d48e-12211a132036	Pogodba-read	Pogodba - branje	f
00030000-55ff-e578-6cee-437657b6c5fb	Pogodba-write	Pogodba - spreminjanje	f
00030000-55ff-e578-6c59-fb0eac0977ab	Popa-read	Popa - branje	f
00030000-55ff-e578-3e79-538ad5426433	Popa-write	Popa - spreminjanje	f
00030000-55ff-e578-1d30-577c43816d75	Posta-read	Posta - branje	f
00030000-55ff-e578-2919-d8c40d8c169c	Posta-write	Posta - spreminjanje	f
00030000-55ff-e578-4e12-1e6c17cf4b9f	PostavkaCDve-read	PostavkaCDve - branje	f
00030000-55ff-e578-2646-7252916153f9	PostavkaCDve-write	PostavkaCDve - spreminjanje	f
00030000-55ff-e578-1bcb-4fe58412749a	PostavkaRacuna-read	PostavkaRacuna - branje	f
00030000-55ff-e578-be92-568d3619cf7d	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	f
00030000-55ff-e578-7d18-4014ea7ff0ce	PostniNaslov-read	PostniNaslov - branje	f
00030000-55ff-e578-0687-4df55c1e174f	PostniNaslov-write	PostniNaslov - spreminjanje	f
00030000-55ff-e578-da7c-a3854414263d	Predstava-read	Predstava - branje	f
00030000-55ff-e578-cb53-f904e98f5fba	Predstava-write	Predstava - spreminjanje	f
00030000-55ff-e578-9a05-7449cb257f1d	ProdajaPredstave-read	ProdajaPredstave - branje	f
00030000-55ff-e578-b9cc-437acd0a41ab	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	f
00030000-55ff-e578-e2c0-aacac4825243	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	f
00030000-55ff-e578-0a5d-92675105e845	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	f
00030000-55ff-e578-fc88-4f0ad456d157	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	f
00030000-55ff-e578-171b-13b2a112ad18	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	f
00030000-55ff-e578-6d9b-cd3b1d8e8f2e	ProgramDela-read	ProgramDela - branje	f
00030000-55ff-e578-e212-8f7d9ef5af2c	ProgramDela-write	ProgramDela - spreminjanje	f
00030000-55ff-e578-951c-1b59c66b1d09	ProgramFestival-read	ProgramFestival - branje	f
00030000-55ff-e578-4220-53f6d4aea0a1	ProgramFestival-write	ProgramFestival - spreminjanje	f
00030000-55ff-e578-f2c3-e9fb4de67a20	ProgramGostovanje-read	ProgramGostovanje - branje	f
00030000-55ff-e578-3d4f-130fabc73125	ProgramGostovanje-write	ProgramGostovanje - spreminjanje	f
00030000-55ff-e578-eab9-eb04653044b9	ProgramGostujoca-read	ProgramGostujoca - branje	f
00030000-55ff-e578-8718-43e5d02cdc13	ProgramGostujoca-write	ProgramGostujoca - spreminjanje	f
00030000-55ff-e578-0324-34b4fbdee5c1	ProgramIzjemni-read	ProgramIzjemni - branje	f
00030000-55ff-e578-cbfb-e3d0c32cbd73	ProgramIzjemni-write	ProgramIzjemni - spreminjanje	f
00030000-55ff-e578-24d6-7bf7825a0de1	ProgramPonovitevPrejsnjih-read	ProgramPonovitevPrejsnjih - branje	f
00030000-55ff-e578-df95-d58bea9ca3c4	ProgramPonovitevPrejsnjih-write	ProgramPonovitevPrejsnjih - spreminjanje	f
00030000-55ff-e578-0db4-158605eb1a27	ProgramPonovitevPremiere-read	ProgramPonovitevPremiere - branje	f
00030000-55ff-e578-d563-fdb58f284838	ProgramPonovitevPremiere-write	ProgramPonovitevPremiere - spreminjanje	f
00030000-55ff-e578-2f6f-464729bc1f10	ProgramPremiera-read	ProgramPremiera - branje	f
00030000-55ff-e578-bb50-bbdeb50ddc2b	ProgramPremiera-write	ProgramPremiera - spreminjanje	f
00030000-55ff-e578-24bd-a52410fd8924	ProgramRazno-read	ProgramRazno - branje	f
00030000-55ff-e578-95d1-a04b4fbf9023	ProgramRazno-write	ProgramRazno - spreminjanje	f
00030000-55ff-e578-2865-dfb43940e224	ProgramskaEnotaSklopa-read	ProgramskaEnotaSklopa - branje	f
00030000-55ff-e578-ce76-7ec21f393c3a	ProgramskaEnotaSklopa-write	ProgramskaEnotaSklopa - spreminjanje	f
00030000-55ff-e578-357a-e6ede9482c53	Prostor-read	Prostor - branje	f
00030000-55ff-e578-92c2-c5862ed64df4	Prostor-write	Prostor - spreminjanje	f
00030000-55ff-e578-5ad8-3eeca56f9bb4	Racun-read	Racun - branje	f
00030000-55ff-e578-cf38-60b3cb9a2032	Racun-write	Racun - spreminjanje	f
00030000-55ff-e578-5567-e1c2ce8d334e	RazpisanSedez-read	RazpisanSedez - branje	f
00030000-55ff-e578-e882-5df6bb1da822	RazpisanSedez-write	RazpisanSedez - spreminjanje	f
00030000-55ff-e578-f3d7-68f6b7704583	Rekviziterstvo-read	Rekviziterstvo - branje	f
00030000-55ff-e578-2c8f-025e3b651dad	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	f
00030000-55ff-e578-3723-4ec68fcd667d	Rekvizit-read	Rekvizit - branje	f
00030000-55ff-e578-d6a9-3e4c9d85ad2c	Rekvizit-write	Rekvizit - spreminjanje	f
00030000-55ff-e578-f0b0-9fd8b0af0354	Revizija-read	Revizija - branje	f
00030000-55ff-e578-507e-1f2e3ce83a39	Revizija-write	Revizija - spreminjanje	f
00030000-55ff-e578-df68-b65a30c9d438	Rezervacija-read	Rezervacija - branje	f
00030000-55ff-e578-2371-dc28394d212f	Rezervacija-write	Rezervacija - spreminjanje	f
00030000-55ff-e578-ac4f-5a2657a82be9	SedezniRed-read	SedezniRed - branje	f
00030000-55ff-e578-7af2-6b8b25837986	SedezniRed-write	SedezniRed - spreminjanje	f
00030000-55ff-e578-1d53-4724656fd079	Sedez-read	Sedez - branje	f
00030000-55ff-e578-84bc-f455abdb18b3	Sedez-write	Sedez - spreminjanje	f
00030000-55ff-e578-905a-ab557d548fa6	Sezona-read	Sezona - branje	f
00030000-55ff-e578-f005-859cb3a2d63b	Sezona-write	Sezona - spreminjanje	f
00030000-55ff-e578-75be-f8b25ec8bd1e	StevilcenjeKonfig-read	StevilcenjeKonfig - branje	f
00030000-55ff-e578-7ce3-a6991ed97f65	StevilcenjeKonfig-write	StevilcenjeKonfig - spreminjanje	f
00030000-55ff-e578-d68a-0523498801ae	Stevilcenje-read	Stevilcenje - branje	f
00030000-55ff-e578-0b10-690752216c45	Stevilcenje-write	Stevilcenje - spreminjanje	f
00030000-55ff-e578-7b3d-d332a3f73ddb	StevilcenjeStanje-read	StevilcenjeStanje - branje	f
00030000-55ff-e578-e7ad-24ab99e37320	StevilcenjeStanje-write	StevilcenjeStanje - spreminjanje	f
00030000-55ff-e578-1798-039e27d946ad	StrosekUprizoritve-read	StrosekUprizoritve - branje	f
00030000-55ff-e578-1781-d07603acfb11	StrosekUprizoritve-write	StrosekUprizoritve - spreminjanje	f
00030000-55ff-e578-6408-c70d8e9c4120	Telefonska-read	Telefonska - branje	f
00030000-55ff-e578-ae38-91db0647ce3f	Telefonska-write	Telefonska - spreminjanje	f
00030000-55ff-e578-1449-56ebceb22fbd	TerminStoritve-read	TerminStoritve - branje	f
00030000-55ff-e578-d467-42295a62bf3c	TerminStoritve-write	TerminStoritve - spreminjanje	f
00030000-55ff-e578-7a25-903e7e7fe898	TipFunkcije-read	TipFunkcije - branje	f
00030000-55ff-e578-ae62-d90eac01c4e7	TipFunkcije-write	TipFunkcije - spreminjanje	f
00030000-55ff-e578-f0eb-e27e51e6a2b2	TipProgramskeEnote-read	TipProgramskeEnote - branje	f
00030000-55ff-e578-c440-4a50b4d6730b	TipProgramskeEnote-write	TipProgramskeEnote - spreminjanje	f
00030000-55ff-e578-14d0-3bd72cea6a97	Trr-read	Trr - branje	f
00030000-55ff-e578-dd11-415b802c066c	Trr-write	Trr - spreminjanje	f
00030000-55ff-e578-e972-db2de82b6b95	Uprizoritev-read	Uprizoritev - branje	f
00030000-55ff-e578-0bb4-33b559c8b631	Uprizoritev-write	Uprizoritev - spreminjanje	f
00030000-55ff-e578-b78e-6a2b9223a351	Vaja-read	Vaja - branje	f
00030000-55ff-e578-b29e-e822801bf1cf	Vaja-write	Vaja - spreminjanje	f
00030000-55ff-e578-7870-92656b9ff396	VrstaSedezev-read	VrstaSedezev - branje	f
00030000-55ff-e578-1b24-c19e01fe4a98	VrstaSedezev-write	VrstaSedezev - spreminjanje	f
00030000-55ff-e578-a500-88486ee0ea91	VrstaStroska-read	VrstaStroska - branje	f
00030000-55ff-e578-b0db-d1b0cd120a47	VrstaStroska-write	VrstaStroska - spreminjanje	f
00030000-55ff-e578-06b1-dfda8c8faf68	Zaposlitev-read	Zaposlitev - branje	f
00030000-55ff-e578-5735-d918a14ede11	Zaposlitev-write	Zaposlitev - spreminjanje	f
00030000-55ff-e578-7cbb-656a88765721	Zasedenost-read	Zasedenost - branje	f
00030000-55ff-e578-0e72-b899b4941430	Zasedenost-write	Zasedenost - spreminjanje	f
00030000-55ff-e578-a561-c5a17378ec5d	ZvrstSurs-read	ZvrstSurs - branje	f
00030000-55ff-e578-b2f6-a222a92f1407	ZvrstSurs-write	ZvrstSurs - spreminjanje	f
00030000-55ff-e578-6ea8-2ee405d7c3cd	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	f
00030000-55ff-e578-e757-ac79b37179f5	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	f
00030000-55ff-e578-c7ca-c36cb83416c7	Job-read	Branje opravil - samo zase - branje	f
00030000-55ff-e578-851f-419626a6b9b3	Job-write	Dodajanje in spreminjanje opravil - samo zase	f
00030000-55ff-e578-06cd-24a6a535c6e0	Job-admin	Upravljanje opravil za vse uporabnike	f
00030000-55ff-e578-5773-1a734d65f05f	Mapa-write	Mapa - osnovno dovoljenje za pisanje	f
00030000-55ff-e578-2811-b474e9322c96	Mapa-read	Mapa - osnovno dovoljenje za branje	f
00030000-55ff-e578-6213-bacdfd607551	MapaAcl-write	MapaAcl - dovoljenje za dostop pisanje ACL-jev mape	f
00030000-55ff-e578-181d-d0f3fb1e0bd8	MapaAcl-read	MapaAcl - dovoljenje za dostop branje ACL-jev mape	f
00030000-55ff-e578-ed10-9673617cf721	Zapis-write	Zapis - dovoljenje za pisanje zapisov	f
00030000-55ff-e578-2ed1-81bc7419e882	Zapis-read	Zapis - dovoljenje za pisanje zapisov	f
00030000-55ff-e578-1686-0733505950a4	ZapisLastnik-write	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	f
00030000-55ff-e578-c006-861db37f3865	ZapisLastnik-read	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	f
00030000-55ff-e578-bdd7-6065be8b6fba	VrstaZapisa-write	Šifrant vrst zapisa - spreminjanje	f
00030000-55ff-e578-cd9b-ee5edb569141	VrstaZapisa-read	Šifrant vrst zapisa - branje	f
00030000-55ff-e578-cb76-7c36b95008b1	Datoteka-write	Datoteka - spreminjanje	f
00030000-55ff-e578-daff-5642015cc625	Datoteka-read	Datoteke - branje	f
\.


--
-- TOC entry 2970 (class 0 OID 20251611)
-- Dependencies: 180
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-55ff-e578-0555-70822c5f407d	00030000-55ff-e578-eb29-e1ebbf0a6638
00020000-55ff-e578-f4bd-564d7f0fca0b	00030000-55ff-e578-089b-fe2480743535
00020000-55ff-e578-a763-621e6963d741	00030000-55ff-e578-fe61-e11febd8aeda
00020000-55ff-e578-a763-621e6963d741	00030000-55ff-e578-d09b-510fb6f5a2e3
00020000-55ff-e578-a763-621e6963d741	00030000-55ff-e578-b7ca-af6aed2cd116
00020000-55ff-e578-a763-621e6963d741	00030000-55ff-e578-6c60-04f4939ceff8
00020000-55ff-e578-a763-621e6963d741	00030000-55ff-e578-6eff-2243166aebcb
00020000-55ff-e578-a763-621e6963d741	00030000-55ff-e578-19df-80c3c5a5701f
00020000-55ff-e578-a763-621e6963d741	00030000-55ff-e578-63eb-81021c233429
00020000-55ff-e578-a763-621e6963d741	00030000-55ff-e578-ac48-ba735d200e8b
00020000-55ff-e578-a763-621e6963d741	00030000-55ff-e578-089b-fe2480743535
00020000-55ff-e578-a763-621e6963d741	00030000-55ff-e578-979a-ac020d5a63ec
00020000-55ff-e578-a763-621e6963d741	00030000-55ff-e578-72bf-38ce3e48269f
00020000-55ff-e578-a763-621e6963d741	00030000-55ff-e578-09c2-30a510fac38d
00020000-55ff-e578-a763-621e6963d741	00030000-55ff-e578-be22-fdf340af5034
00020000-55ff-e578-a763-621e6963d741	00030000-55ff-e578-89c5-8a8aa1518dc8
00020000-55ff-e578-a763-621e6963d741	00030000-55ff-e578-48d8-6f5aab03579b
00020000-55ff-e578-a763-621e6963d741	00030000-55ff-e578-b6b6-3ae30e71eca2
00020000-55ff-e578-a763-621e6963d741	00030000-55ff-e578-ebc7-875c6da7f1b6
00020000-55ff-e578-a763-621e6963d741	00030000-55ff-e578-cfa6-29e85ca901b4
00020000-55ff-e578-a763-621e6963d741	00030000-55ff-e578-fa1d-067265a1d58c
00020000-55ff-e578-a763-621e6963d741	00030000-55ff-e578-d4c3-b594579db825
00020000-55ff-e578-a763-621e6963d741	00030000-55ff-e578-a3e1-861ed7b2c410
00020000-55ff-e578-a763-621e6963d741	00030000-55ff-e578-4b9f-77895980a8a2
00020000-55ff-e578-a763-621e6963d741	00030000-55ff-e578-6c59-fb0eac0977ab
00020000-55ff-e578-a763-621e6963d741	00030000-55ff-e578-3e79-538ad5426433
00020000-55ff-e578-a763-621e6963d741	00030000-55ff-e578-1d30-577c43816d75
00020000-55ff-e578-a763-621e6963d741	00030000-55ff-e578-2919-d8c40d8c169c
00020000-55ff-e578-a763-621e6963d741	00030000-55ff-e578-7d18-4014ea7ff0ce
00020000-55ff-e578-a763-621e6963d741	00030000-55ff-e578-0687-4df55c1e174f
00020000-55ff-e578-a763-621e6963d741	00030000-55ff-e578-da7c-a3854414263d
00020000-55ff-e578-a763-621e6963d741	00030000-55ff-e578-cb53-f904e98f5fba
00020000-55ff-e578-a763-621e6963d741	00030000-55ff-e578-fc88-4f0ad456d157
00020000-55ff-e578-a763-621e6963d741	00030000-55ff-e578-171b-13b2a112ad18
00020000-55ff-e578-a763-621e6963d741	00030000-55ff-e578-357a-e6ede9482c53
00020000-55ff-e578-a763-621e6963d741	00030000-55ff-e578-92c2-c5862ed64df4
00020000-55ff-e578-a763-621e6963d741	00030000-55ff-e578-f3d7-68f6b7704583
00020000-55ff-e578-a763-621e6963d741	00030000-55ff-e578-2c8f-025e3b651dad
00020000-55ff-e578-a763-621e6963d741	00030000-55ff-e578-3723-4ec68fcd667d
00020000-55ff-e578-a763-621e6963d741	00030000-55ff-e578-d6a9-3e4c9d85ad2c
00020000-55ff-e578-a763-621e6963d741	00030000-55ff-e578-905a-ab557d548fa6
00020000-55ff-e578-a763-621e6963d741	00030000-55ff-e578-f005-859cb3a2d63b
00020000-55ff-e578-a763-621e6963d741	00030000-55ff-e578-7a25-903e7e7fe898
00020000-55ff-e578-a763-621e6963d741	00030000-55ff-e578-e972-db2de82b6b95
00020000-55ff-e578-a763-621e6963d741	00030000-55ff-e578-0bb4-33b559c8b631
00020000-55ff-e578-a763-621e6963d741	00030000-55ff-e578-b78e-6a2b9223a351
00020000-55ff-e578-a763-621e6963d741	00030000-55ff-e578-b29e-e822801bf1cf
00020000-55ff-e578-a763-621e6963d741	00030000-55ff-e578-7cbb-656a88765721
00020000-55ff-e578-a763-621e6963d741	00030000-55ff-e578-0e72-b899b4941430
00020000-55ff-e578-a763-621e6963d741	00030000-55ff-e578-a561-c5a17378ec5d
00020000-55ff-e578-a763-621e6963d741	00030000-55ff-e578-6ea8-2ee405d7c3cd
00020000-55ff-e578-b5da-c495100bebb5	00030000-55ff-e578-fe61-e11febd8aeda
00020000-55ff-e578-b5da-c495100bebb5	00030000-55ff-e578-6eff-2243166aebcb
00020000-55ff-e578-b5da-c495100bebb5	00030000-55ff-e578-19df-80c3c5a5701f
00020000-55ff-e578-b5da-c495100bebb5	00030000-55ff-e578-089b-fe2480743535
00020000-55ff-e578-b5da-c495100bebb5	00030000-55ff-e578-be22-fdf340af5034
00020000-55ff-e578-b5da-c495100bebb5	00030000-55ff-e578-48d8-6f5aab03579b
00020000-55ff-e578-b5da-c495100bebb5	00030000-55ff-e578-ebc7-875c6da7f1b6
00020000-55ff-e578-b5da-c495100bebb5	00030000-55ff-e578-cfa6-29e85ca901b4
00020000-55ff-e578-b5da-c495100bebb5	00030000-55ff-e578-fa1d-067265a1d58c
00020000-55ff-e578-b5da-c495100bebb5	00030000-55ff-e578-d4c3-b594579db825
00020000-55ff-e578-b5da-c495100bebb5	00030000-55ff-e578-a3e1-861ed7b2c410
00020000-55ff-e578-b5da-c495100bebb5	00030000-55ff-e578-4b9f-77895980a8a2
00020000-55ff-e578-b5da-c495100bebb5	00030000-55ff-e578-6c59-fb0eac0977ab
00020000-55ff-e578-b5da-c495100bebb5	00030000-55ff-e578-1d30-577c43816d75
00020000-55ff-e578-b5da-c495100bebb5	00030000-55ff-e578-7d18-4014ea7ff0ce
00020000-55ff-e578-b5da-c495100bebb5	00030000-55ff-e578-0687-4df55c1e174f
00020000-55ff-e578-b5da-c495100bebb5	00030000-55ff-e578-da7c-a3854414263d
00020000-55ff-e578-b5da-c495100bebb5	00030000-55ff-e578-357a-e6ede9482c53
00020000-55ff-e578-b5da-c495100bebb5	00030000-55ff-e578-f3d7-68f6b7704583
00020000-55ff-e578-b5da-c495100bebb5	00030000-55ff-e578-3723-4ec68fcd667d
00020000-55ff-e578-b5da-c495100bebb5	00030000-55ff-e578-905a-ab557d548fa6
00020000-55ff-e578-b5da-c495100bebb5	00030000-55ff-e578-6408-c70d8e9c4120
00020000-55ff-e578-b5da-c495100bebb5	00030000-55ff-e578-ae38-91db0647ce3f
00020000-55ff-e578-b5da-c495100bebb5	00030000-55ff-e578-14d0-3bd72cea6a97
00020000-55ff-e578-b5da-c495100bebb5	00030000-55ff-e578-dd11-415b802c066c
00020000-55ff-e578-b5da-c495100bebb5	00030000-55ff-e578-06b1-dfda8c8faf68
00020000-55ff-e578-b5da-c495100bebb5	00030000-55ff-e578-5735-d918a14ede11
00020000-55ff-e578-b5da-c495100bebb5	00030000-55ff-e578-a561-c5a17378ec5d
00020000-55ff-e578-b5da-c495100bebb5	00030000-55ff-e578-6ea8-2ee405d7c3cd
00020000-55ff-e578-4774-20a62482178c	00030000-55ff-e578-fe61-e11febd8aeda
00020000-55ff-e578-4774-20a62482178c	00030000-55ff-e578-b7ca-af6aed2cd116
00020000-55ff-e578-4774-20a62482178c	00030000-55ff-e578-6eff-2243166aebcb
00020000-55ff-e578-4774-20a62482178c	00030000-55ff-e578-36a1-d516bf471d53
00020000-55ff-e578-4774-20a62482178c	00030000-55ff-e578-4eba-2d4c4cf58bcc
00020000-55ff-e578-4774-20a62482178c	00030000-55ff-e578-1d6a-19cd1aa2c69c
00020000-55ff-e578-4774-20a62482178c	00030000-55ff-e578-19df-80c3c5a5701f
00020000-55ff-e578-4774-20a62482178c	00030000-55ff-e578-089b-fe2480743535
00020000-55ff-e578-4774-20a62482178c	00030000-55ff-e578-72bf-38ce3e48269f
00020000-55ff-e578-4774-20a62482178c	00030000-55ff-e578-be22-fdf340af5034
00020000-55ff-e578-4774-20a62482178c	00030000-55ff-e578-48d8-6f5aab03579b
00020000-55ff-e578-4774-20a62482178c	00030000-55ff-e578-ebc7-875c6da7f1b6
00020000-55ff-e578-4774-20a62482178c	00030000-55ff-e578-fa1d-067265a1d58c
00020000-55ff-e578-4774-20a62482178c	00030000-55ff-e578-d4c3-b594579db825
00020000-55ff-e578-4774-20a62482178c	00030000-55ff-e578-a3e1-861ed7b2c410
00020000-55ff-e578-4774-20a62482178c	00030000-55ff-e578-6c59-fb0eac0977ab
00020000-55ff-e578-4774-20a62482178c	00030000-55ff-e578-1d30-577c43816d75
00020000-55ff-e578-4774-20a62482178c	00030000-55ff-e578-da7c-a3854414263d
00020000-55ff-e578-4774-20a62482178c	00030000-55ff-e578-fc88-4f0ad456d157
00020000-55ff-e578-4774-20a62482178c	00030000-55ff-e578-357a-e6ede9482c53
00020000-55ff-e578-4774-20a62482178c	00030000-55ff-e578-f3d7-68f6b7704583
00020000-55ff-e578-4774-20a62482178c	00030000-55ff-e578-3723-4ec68fcd667d
00020000-55ff-e578-4774-20a62482178c	00030000-55ff-e578-905a-ab557d548fa6
00020000-55ff-e578-4774-20a62482178c	00030000-55ff-e578-7a25-903e7e7fe898
00020000-55ff-e578-4774-20a62482178c	00030000-55ff-e578-b78e-6a2b9223a351
00020000-55ff-e578-4774-20a62482178c	00030000-55ff-e578-7cbb-656a88765721
00020000-55ff-e578-4774-20a62482178c	00030000-55ff-e578-a561-c5a17378ec5d
00020000-55ff-e578-4774-20a62482178c	00030000-55ff-e578-6ea8-2ee405d7c3cd
00020000-55ff-e578-f0dc-e0f843df9ee9	00030000-55ff-e578-fe61-e11febd8aeda
00020000-55ff-e578-f0dc-e0f843df9ee9	00030000-55ff-e578-d09b-510fb6f5a2e3
00020000-55ff-e578-f0dc-e0f843df9ee9	00030000-55ff-e578-6c60-04f4939ceff8
00020000-55ff-e578-f0dc-e0f843df9ee9	00030000-55ff-e578-6eff-2243166aebcb
00020000-55ff-e578-f0dc-e0f843df9ee9	00030000-55ff-e578-19df-80c3c5a5701f
00020000-55ff-e578-f0dc-e0f843df9ee9	00030000-55ff-e578-089b-fe2480743535
00020000-55ff-e578-f0dc-e0f843df9ee9	00030000-55ff-e578-be22-fdf340af5034
00020000-55ff-e578-f0dc-e0f843df9ee9	00030000-55ff-e578-48d8-6f5aab03579b
00020000-55ff-e578-f0dc-e0f843df9ee9	00030000-55ff-e578-fa1d-067265a1d58c
00020000-55ff-e578-f0dc-e0f843df9ee9	00030000-55ff-e578-d4c3-b594579db825
00020000-55ff-e578-f0dc-e0f843df9ee9	00030000-55ff-e578-6c59-fb0eac0977ab
00020000-55ff-e578-f0dc-e0f843df9ee9	00030000-55ff-e578-1d30-577c43816d75
00020000-55ff-e578-f0dc-e0f843df9ee9	00030000-55ff-e578-da7c-a3854414263d
00020000-55ff-e578-f0dc-e0f843df9ee9	00030000-55ff-e578-357a-e6ede9482c53
00020000-55ff-e578-f0dc-e0f843df9ee9	00030000-55ff-e578-f3d7-68f6b7704583
00020000-55ff-e578-f0dc-e0f843df9ee9	00030000-55ff-e578-3723-4ec68fcd667d
00020000-55ff-e578-f0dc-e0f843df9ee9	00030000-55ff-e578-905a-ab557d548fa6
00020000-55ff-e578-f0dc-e0f843df9ee9	00030000-55ff-e578-7a25-903e7e7fe898
00020000-55ff-e578-f0dc-e0f843df9ee9	00030000-55ff-e578-a561-c5a17378ec5d
00020000-55ff-e578-f0dc-e0f843df9ee9	00030000-55ff-e578-6ea8-2ee405d7c3cd
00020000-55ff-e578-92a5-6b40288c21dc	00030000-55ff-e578-fe61-e11febd8aeda
00020000-55ff-e578-92a5-6b40288c21dc	00030000-55ff-e578-6eff-2243166aebcb
00020000-55ff-e578-92a5-6b40288c21dc	00030000-55ff-e578-19df-80c3c5a5701f
00020000-55ff-e578-92a5-6b40288c21dc	00030000-55ff-e578-089b-fe2480743535
00020000-55ff-e578-92a5-6b40288c21dc	00030000-55ff-e578-be22-fdf340af5034
00020000-55ff-e578-92a5-6b40288c21dc	00030000-55ff-e578-48d8-6f5aab03579b
00020000-55ff-e578-92a5-6b40288c21dc	00030000-55ff-e578-fa1d-067265a1d58c
00020000-55ff-e578-92a5-6b40288c21dc	00030000-55ff-e578-d4c3-b594579db825
00020000-55ff-e578-92a5-6b40288c21dc	00030000-55ff-e578-6c59-fb0eac0977ab
00020000-55ff-e578-92a5-6b40288c21dc	00030000-55ff-e578-1d30-577c43816d75
00020000-55ff-e578-92a5-6b40288c21dc	00030000-55ff-e578-da7c-a3854414263d
00020000-55ff-e578-92a5-6b40288c21dc	00030000-55ff-e578-357a-e6ede9482c53
00020000-55ff-e578-92a5-6b40288c21dc	00030000-55ff-e578-f3d7-68f6b7704583
00020000-55ff-e578-92a5-6b40288c21dc	00030000-55ff-e578-3723-4ec68fcd667d
00020000-55ff-e578-92a5-6b40288c21dc	00030000-55ff-e578-905a-ab557d548fa6
00020000-55ff-e578-92a5-6b40288c21dc	00030000-55ff-e578-1449-56ebceb22fbd
00020000-55ff-e578-92a5-6b40288c21dc	00030000-55ff-e578-c0bf-4643551007f0
00020000-55ff-e578-92a5-6b40288c21dc	00030000-55ff-e578-7a25-903e7e7fe898
00020000-55ff-e578-92a5-6b40288c21dc	00030000-55ff-e578-a561-c5a17378ec5d
00020000-55ff-e578-92a5-6b40288c21dc	00030000-55ff-e578-6ea8-2ee405d7c3cd
00020000-55ff-e579-ff61-83f1337060c2	00030000-55ff-e578-028d-c988a0390977
00020000-55ff-e579-ff61-83f1337060c2	00030000-55ff-e578-eb29-e1ebbf0a6638
00020000-55ff-e579-ff61-83f1337060c2	00030000-55ff-e578-c0bf-4643551007f0
00020000-55ff-e579-ff61-83f1337060c2	00030000-55ff-e578-63eb-81021c233429
00020000-55ff-e579-ff61-83f1337060c2	00030000-55ff-e578-71b5-bd28e7ede483
00020000-55ff-e579-ff61-83f1337060c2	00030000-55ff-e578-a3b3-f581b98c98c8
00020000-55ff-e579-ff61-83f1337060c2	00030000-55ff-e578-243e-95465446b5ee
00020000-55ff-e579-ff61-83f1337060c2	00030000-55ff-e578-fe61-e11febd8aeda
00020000-55ff-e579-ff61-83f1337060c2	00030000-55ff-e578-d09b-510fb6f5a2e3
00020000-55ff-e579-ff61-83f1337060c2	00030000-55ff-e578-b7ca-af6aed2cd116
00020000-55ff-e579-ff61-83f1337060c2	00030000-55ff-e578-6c60-04f4939ceff8
00020000-55ff-e579-ff61-83f1337060c2	00030000-55ff-e578-6eff-2243166aebcb
00020000-55ff-e579-ff61-83f1337060c2	00030000-55ff-e578-36a1-d516bf471d53
00020000-55ff-e579-ff61-83f1337060c2	00030000-55ff-e578-4eba-2d4c4cf58bcc
00020000-55ff-e579-ff61-83f1337060c2	00030000-55ff-e578-6e5c-4ca50c383d9a
00020000-55ff-e579-ff61-83f1337060c2	00030000-55ff-e578-1d6a-19cd1aa2c69c
00020000-55ff-e579-ff61-83f1337060c2	00030000-55ff-e578-269b-4e7b93662c8d
00020000-55ff-e579-ff61-83f1337060c2	00030000-55ff-e578-19df-80c3c5a5701f
00020000-55ff-e579-ff61-83f1337060c2	00030000-55ff-e578-ac48-ba735d200e8b
00020000-55ff-e579-ff61-83f1337060c2	00030000-55ff-e578-089b-fe2480743535
00020000-55ff-e579-ff61-83f1337060c2	00030000-55ff-e578-979a-ac020d5a63ec
00020000-55ff-e579-ff61-83f1337060c2	00030000-55ff-e578-ece8-eea8f7eac4bf
00020000-55ff-e579-ff61-83f1337060c2	00030000-55ff-e578-f4c0-2bbde1c4c841
00020000-55ff-e579-ff61-83f1337060c2	00030000-55ff-e578-7c0a-3d861ac4eb4c
00020000-55ff-e579-ff61-83f1337060c2	00030000-55ff-e578-8dbc-8c0f86b3508b
00020000-55ff-e579-ff61-83f1337060c2	00030000-55ff-e578-72bf-38ce3e48269f
00020000-55ff-e579-ff61-83f1337060c2	00030000-55ff-e578-09c2-30a510fac38d
00020000-55ff-e579-ff61-83f1337060c2	00030000-55ff-e578-be22-fdf340af5034
00020000-55ff-e579-ff61-83f1337060c2	00030000-55ff-e578-89c5-8a8aa1518dc8
00020000-55ff-e579-ff61-83f1337060c2	00030000-55ff-e578-48d8-6f5aab03579b
00020000-55ff-e579-ff61-83f1337060c2	00030000-55ff-e578-b6b6-3ae30e71eca2
00020000-55ff-e579-ff61-83f1337060c2	00030000-55ff-e578-ebc7-875c6da7f1b6
00020000-55ff-e579-ff61-83f1337060c2	00030000-55ff-e578-cfa6-29e85ca901b4
00020000-55ff-e579-ff61-83f1337060c2	00030000-55ff-e578-6d33-cbf3b663595a
00020000-55ff-e579-ff61-83f1337060c2	00030000-55ff-e578-5a09-d8c287a332b2
00020000-55ff-e579-ff61-83f1337060c2	00030000-55ff-e578-ab70-2ef7ab7bf248
00020000-55ff-e579-ff61-83f1337060c2	00030000-55ff-e578-3654-57b8f5ff6509
00020000-55ff-e579-ff61-83f1337060c2	00030000-55ff-e578-fa1d-067265a1d58c
00020000-55ff-e579-ff61-83f1337060c2	00030000-55ff-e578-ab7a-5451a4555e0e
00020000-55ff-e579-ff61-83f1337060c2	00030000-55ff-e578-d4c3-b594579db825
00020000-55ff-e579-ff61-83f1337060c2	00030000-55ff-e578-3341-064e9787cd52
00020000-55ff-e579-ff61-83f1337060c2	00030000-55ff-e578-a3e1-861ed7b2c410
00020000-55ff-e579-ff61-83f1337060c2	00030000-55ff-e578-4b9f-77895980a8a2
00020000-55ff-e579-ff61-83f1337060c2	00030000-55ff-e578-34ac-660acad8a50c
00020000-55ff-e579-ff61-83f1337060c2	00030000-55ff-e578-7fd7-67c041ae3f40
00020000-55ff-e579-ff61-83f1337060c2	00030000-55ff-e578-e8a0-7ff285506d75
00020000-55ff-e579-ff61-83f1337060c2	00030000-55ff-e578-a385-6a969337c509
00020000-55ff-e579-ff61-83f1337060c2	00030000-55ff-e578-d48e-12211a132036
00020000-55ff-e579-ff61-83f1337060c2	00030000-55ff-e578-6cee-437657b6c5fb
00020000-55ff-e579-ff61-83f1337060c2	00030000-55ff-e578-6c59-fb0eac0977ab
00020000-55ff-e579-ff61-83f1337060c2	00030000-55ff-e578-3e79-538ad5426433
00020000-55ff-e579-ff61-83f1337060c2	00030000-55ff-e578-1d30-577c43816d75
00020000-55ff-e579-ff61-83f1337060c2	00030000-55ff-e578-2919-d8c40d8c169c
00020000-55ff-e579-ff61-83f1337060c2	00030000-55ff-e578-4e12-1e6c17cf4b9f
00020000-55ff-e579-ff61-83f1337060c2	00030000-55ff-e578-2646-7252916153f9
00020000-55ff-e579-ff61-83f1337060c2	00030000-55ff-e578-1bcb-4fe58412749a
00020000-55ff-e579-ff61-83f1337060c2	00030000-55ff-e578-be92-568d3619cf7d
00020000-55ff-e579-ff61-83f1337060c2	00030000-55ff-e578-7d18-4014ea7ff0ce
00020000-55ff-e579-ff61-83f1337060c2	00030000-55ff-e578-0687-4df55c1e174f
00020000-55ff-e579-ff61-83f1337060c2	00030000-55ff-e578-da7c-a3854414263d
00020000-55ff-e579-ff61-83f1337060c2	00030000-55ff-e578-cb53-f904e98f5fba
00020000-55ff-e579-ff61-83f1337060c2	00030000-55ff-e578-9a05-7449cb257f1d
00020000-55ff-e579-ff61-83f1337060c2	00030000-55ff-e578-b9cc-437acd0a41ab
00020000-55ff-e579-ff61-83f1337060c2	00030000-55ff-e578-e2c0-aacac4825243
00020000-55ff-e579-ff61-83f1337060c2	00030000-55ff-e578-0a5d-92675105e845
00020000-55ff-e579-ff61-83f1337060c2	00030000-55ff-e578-fc88-4f0ad456d157
00020000-55ff-e579-ff61-83f1337060c2	00030000-55ff-e578-171b-13b2a112ad18
00020000-55ff-e579-ff61-83f1337060c2	00030000-55ff-e578-6d9b-cd3b1d8e8f2e
00020000-55ff-e579-ff61-83f1337060c2	00030000-55ff-e578-e212-8f7d9ef5af2c
00020000-55ff-e579-ff61-83f1337060c2	00030000-55ff-e578-951c-1b59c66b1d09
00020000-55ff-e579-ff61-83f1337060c2	00030000-55ff-e578-4220-53f6d4aea0a1
00020000-55ff-e579-ff61-83f1337060c2	00030000-55ff-e578-f2c3-e9fb4de67a20
00020000-55ff-e579-ff61-83f1337060c2	00030000-55ff-e578-3d4f-130fabc73125
00020000-55ff-e579-ff61-83f1337060c2	00030000-55ff-e578-eab9-eb04653044b9
00020000-55ff-e579-ff61-83f1337060c2	00030000-55ff-e578-8718-43e5d02cdc13
00020000-55ff-e579-ff61-83f1337060c2	00030000-55ff-e578-0324-34b4fbdee5c1
00020000-55ff-e579-ff61-83f1337060c2	00030000-55ff-e578-cbfb-e3d0c32cbd73
00020000-55ff-e579-ff61-83f1337060c2	00030000-55ff-e578-24d6-7bf7825a0de1
00020000-55ff-e579-ff61-83f1337060c2	00030000-55ff-e578-df95-d58bea9ca3c4
00020000-55ff-e579-ff61-83f1337060c2	00030000-55ff-e578-0db4-158605eb1a27
00020000-55ff-e579-ff61-83f1337060c2	00030000-55ff-e578-d563-fdb58f284838
00020000-55ff-e579-ff61-83f1337060c2	00030000-55ff-e578-2f6f-464729bc1f10
00020000-55ff-e579-ff61-83f1337060c2	00030000-55ff-e578-bb50-bbdeb50ddc2b
00020000-55ff-e579-ff61-83f1337060c2	00030000-55ff-e578-24bd-a52410fd8924
00020000-55ff-e579-ff61-83f1337060c2	00030000-55ff-e578-95d1-a04b4fbf9023
00020000-55ff-e579-ff61-83f1337060c2	00030000-55ff-e578-2865-dfb43940e224
00020000-55ff-e579-ff61-83f1337060c2	00030000-55ff-e578-ce76-7ec21f393c3a
00020000-55ff-e579-ff61-83f1337060c2	00030000-55ff-e578-357a-e6ede9482c53
00020000-55ff-e579-ff61-83f1337060c2	00030000-55ff-e578-92c2-c5862ed64df4
00020000-55ff-e579-ff61-83f1337060c2	00030000-55ff-e578-5ad8-3eeca56f9bb4
00020000-55ff-e579-ff61-83f1337060c2	00030000-55ff-e578-cf38-60b3cb9a2032
00020000-55ff-e579-ff61-83f1337060c2	00030000-55ff-e578-5567-e1c2ce8d334e
00020000-55ff-e579-ff61-83f1337060c2	00030000-55ff-e578-e882-5df6bb1da822
00020000-55ff-e579-ff61-83f1337060c2	00030000-55ff-e578-f3d7-68f6b7704583
00020000-55ff-e579-ff61-83f1337060c2	00030000-55ff-e578-2c8f-025e3b651dad
00020000-55ff-e579-ff61-83f1337060c2	00030000-55ff-e578-3723-4ec68fcd667d
00020000-55ff-e579-ff61-83f1337060c2	00030000-55ff-e578-d6a9-3e4c9d85ad2c
00020000-55ff-e579-ff61-83f1337060c2	00030000-55ff-e578-f0b0-9fd8b0af0354
00020000-55ff-e579-ff61-83f1337060c2	00030000-55ff-e578-507e-1f2e3ce83a39
00020000-55ff-e579-ff61-83f1337060c2	00030000-55ff-e578-df68-b65a30c9d438
00020000-55ff-e579-ff61-83f1337060c2	00030000-55ff-e578-2371-dc28394d212f
00020000-55ff-e579-ff61-83f1337060c2	00030000-55ff-e578-ac4f-5a2657a82be9
00020000-55ff-e579-ff61-83f1337060c2	00030000-55ff-e578-7af2-6b8b25837986
00020000-55ff-e579-ff61-83f1337060c2	00030000-55ff-e578-1d53-4724656fd079
00020000-55ff-e579-ff61-83f1337060c2	00030000-55ff-e578-84bc-f455abdb18b3
00020000-55ff-e579-ff61-83f1337060c2	00030000-55ff-e578-905a-ab557d548fa6
00020000-55ff-e579-ff61-83f1337060c2	00030000-55ff-e578-f005-859cb3a2d63b
00020000-55ff-e579-ff61-83f1337060c2	00030000-55ff-e578-75be-f8b25ec8bd1e
00020000-55ff-e579-ff61-83f1337060c2	00030000-55ff-e578-7ce3-a6991ed97f65
00020000-55ff-e579-ff61-83f1337060c2	00030000-55ff-e578-d68a-0523498801ae
00020000-55ff-e579-ff61-83f1337060c2	00030000-55ff-e578-0b10-690752216c45
00020000-55ff-e579-ff61-83f1337060c2	00030000-55ff-e578-7b3d-d332a3f73ddb
00020000-55ff-e579-ff61-83f1337060c2	00030000-55ff-e578-e7ad-24ab99e37320
00020000-55ff-e579-ff61-83f1337060c2	00030000-55ff-e578-1798-039e27d946ad
00020000-55ff-e579-ff61-83f1337060c2	00030000-55ff-e578-1781-d07603acfb11
00020000-55ff-e579-ff61-83f1337060c2	00030000-55ff-e578-6408-c70d8e9c4120
00020000-55ff-e579-ff61-83f1337060c2	00030000-55ff-e578-ae38-91db0647ce3f
00020000-55ff-e579-ff61-83f1337060c2	00030000-55ff-e578-1449-56ebceb22fbd
00020000-55ff-e579-ff61-83f1337060c2	00030000-55ff-e578-d467-42295a62bf3c
00020000-55ff-e579-ff61-83f1337060c2	00030000-55ff-e578-7a25-903e7e7fe898
00020000-55ff-e579-ff61-83f1337060c2	00030000-55ff-e578-ae62-d90eac01c4e7
00020000-55ff-e579-ff61-83f1337060c2	00030000-55ff-e578-f0eb-e27e51e6a2b2
00020000-55ff-e579-ff61-83f1337060c2	00030000-55ff-e578-c440-4a50b4d6730b
00020000-55ff-e579-ff61-83f1337060c2	00030000-55ff-e578-14d0-3bd72cea6a97
00020000-55ff-e579-ff61-83f1337060c2	00030000-55ff-e578-dd11-415b802c066c
00020000-55ff-e579-ff61-83f1337060c2	00030000-55ff-e578-e972-db2de82b6b95
00020000-55ff-e579-ff61-83f1337060c2	00030000-55ff-e578-0bb4-33b559c8b631
00020000-55ff-e579-ff61-83f1337060c2	00030000-55ff-e578-b78e-6a2b9223a351
00020000-55ff-e579-ff61-83f1337060c2	00030000-55ff-e578-b29e-e822801bf1cf
00020000-55ff-e579-ff61-83f1337060c2	00030000-55ff-e578-7870-92656b9ff396
00020000-55ff-e579-ff61-83f1337060c2	00030000-55ff-e578-1b24-c19e01fe4a98
00020000-55ff-e579-ff61-83f1337060c2	00030000-55ff-e578-a500-88486ee0ea91
00020000-55ff-e579-ff61-83f1337060c2	00030000-55ff-e578-b0db-d1b0cd120a47
00020000-55ff-e579-ff61-83f1337060c2	00030000-55ff-e578-06b1-dfda8c8faf68
00020000-55ff-e579-ff61-83f1337060c2	00030000-55ff-e578-5735-d918a14ede11
00020000-55ff-e579-ff61-83f1337060c2	00030000-55ff-e578-7cbb-656a88765721
00020000-55ff-e579-ff61-83f1337060c2	00030000-55ff-e578-0e72-b899b4941430
00020000-55ff-e579-ff61-83f1337060c2	00030000-55ff-e578-a561-c5a17378ec5d
00020000-55ff-e579-ff61-83f1337060c2	00030000-55ff-e578-b2f6-a222a92f1407
00020000-55ff-e579-ff61-83f1337060c2	00030000-55ff-e578-6ea8-2ee405d7c3cd
00020000-55ff-e579-ff61-83f1337060c2	00030000-55ff-e578-e757-ac79b37179f5
\.


--
-- TOC entry 2999 (class 0 OID 20251936)
-- Dependencies: 209
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 3003 (class 0 OID 20251970)
-- Dependencies: 213
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 3015 (class 0 OID 20252104)
-- Dependencies: 225
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, zacetek, konec, jeavtorskepravice, placilonavajo, vrednostvaje, planiranostevilovaj, vrednostvaj, vrednostpredstave, vrednostdopremiere, aktivna, zaposlenvdrjz, samozaposlen, igralec, opis) FROM stdin;
000b0000-55ff-e579-a6a6-374dee541299	00090000-55ff-e579-0ae7-4f5d8a0276fd	\N	\N	0001	\N	\N	f	f	10.00	3	10.00	30.00	10.00	t	t	f	t	Pogodba o sodelovanju
000b0000-55ff-e579-de69-eec4c3f832fe	00090000-55ff-e579-a2c1-4335b1934e23	\N	\N	0002	\N	\N	f	t	11.00	10	11.00	31.00	110.00	t	f	t	t	Pogodba za vlogo Helena
000b0000-55ff-e579-5d9d-8e612086bfdc	00090000-55ff-e579-1920-db5cfe2abde0	\N	\N	0003	\N	\N	f	f	12.00	4	12.00	32.00	12.00	t	f	t	f	Pogodba za lektoriranje
000b0000-55ff-e579-a047-dbf9aec72227	00090000-55ff-e579-e706-e3602a17db9b	\N	\N	0004	\N	\N	t	f	0.00	2	300.00	30.00	300.00	t	f	t	f	Pogodba za avtorske pravice
\.


--
-- TOC entry 2975 (class 0 OID 20251671)
-- Dependencies: 185
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, drzava_id, sifra, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo, nvo) FROM stdin;
00080000-55ff-e579-5a3b-8aa7fb667e7d	00040000-55ff-e578-29f2-d4dc80ef1612	0988	AK	Juhuhu d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55ff-e579-c129-ed2511ce3f21	00040000-55ff-e578-29f2-d4dc80ef1612	0989	AK	Hopsasa d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	t
00080000-55ff-e579-9e4b-f71f7632bb57	00040000-55ff-e578-29f2-d4dc80ef1612	0987	AK	Gledališče Šrum d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55ff-e579-e34f-b0ac848f7bd0	00040000-55ff-e578-29f2-d4dc80ef1612	0986	AK	Lutkovni Direndaj d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55ff-e579-96dc-3a419d1696a4	00040000-55ff-e578-29f2-d4dc80ef1612	0985	AK	Tatjana Stanič, Lektoriranje, s.p.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55ff-e579-8ba9-56b55e858940	00040000-55ff-e578-5f7f-c8f211190c0c	0984	AK	Gledališče Lepote tvoje		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55ff-e579-b04f-96bd3e680e17	00040000-55ff-e578-560f-c613a3355d3f	0983	AK	Sunce naše		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55ff-e579-0594-53ba35d9d0f7	00040000-55ff-e578-270e-ac1c80cc482d	0982	AK	Theater Amadeus		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55ff-e579-bcbd-422615ca3cbe	00040000-55ff-e578-4513-14b5281f04c4	9999	AK	Fuchs		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55ff-e57a-35dd-582281836deb	00040000-55ff-e578-29f2-d4dc80ef1612	1001	AK	Gledališče Matica		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
\.


--
-- TOC entry 2977 (class 0 OID 20251705)
-- Dependencies: 187
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-55ff-e577-5cd1-06730100ab5b	8341	Adlešiči
00050000-55ff-e577-7694-96c071bb6902	5270	Ajdovščina
00050000-55ff-e577-7958-f6ec1e644682	6280	Ankaran/Ancarano
00050000-55ff-e577-74a5-38e723658945	9253	Apače
00050000-55ff-e577-b442-aabde352bbfb	8253	Artiče
00050000-55ff-e577-2e50-918cd9856493	4275	Begunje na Gorenjskem
00050000-55ff-e577-9d4e-3078630cc976	1382	Begunje pri Cerknici
00050000-55ff-e577-053a-3a7abba691cc	9231	Beltinci
00050000-55ff-e577-a539-b36e5589e464	2234	Benedikt
00050000-55ff-e577-4088-59c8e396633d	2345	Bistrica ob Dravi
00050000-55ff-e577-03e6-0325765ca29c	3256	Bistrica ob Sotli
00050000-55ff-e577-93d6-d32d830b26a5	8259	Bizeljsko
00050000-55ff-e577-a012-077672b6884d	1223	Blagovica
00050000-55ff-e577-86d5-bb0440959c9b	8283	Blanca
00050000-55ff-e577-f68e-683e61a83d94	4260	Bled
00050000-55ff-e577-d9e5-9a7a48453f0e	4273	Blejska Dobrava
00050000-55ff-e577-2120-51c756fdd829	9265	Bodonci
00050000-55ff-e577-bde8-b078d07de6e4	9222	Bogojina
00050000-55ff-e577-6aae-f3b6214d27b5	4263	Bohinjska Bela
00050000-55ff-e577-bc6e-dce06fac9755	4264	Bohinjska Bistrica
00050000-55ff-e577-f38c-174339641f86	4265	Bohinjsko jezero
00050000-55ff-e577-959a-fad353434b9e	1353	Borovnica
00050000-55ff-e577-cada-f96bcf4589fe	8294	Boštanj
00050000-55ff-e577-1195-64ee336b0558	5230	Bovec
00050000-55ff-e577-2faa-0003cd4e0d37	5295	Branik
00050000-55ff-e577-97ab-ce00b09345af	3314	Braslovče
00050000-55ff-e577-8828-f47e3dbd6f64	5223	Breginj
00050000-55ff-e577-4b52-649694e46d90	8280	Brestanica
00050000-55ff-e577-cb5a-e0299e214b7a	2354	Bresternica
00050000-55ff-e577-f238-372ad8f325d2	4243	Brezje
00050000-55ff-e577-c875-d05a7b0cf9cc	1351	Brezovica pri Ljubljani
00050000-55ff-e577-cf39-e0f50093b05a	8250	Brežice
00050000-55ff-e577-78b9-f0787a0500e5	4210	Brnik - Aerodrom
00050000-55ff-e577-12ad-d8f5993dbf1e	8321	Brusnice
00050000-55ff-e577-25a7-76c36b686d3a	3255	Buče
00050000-55ff-e577-4068-88f4b25e24f4	8276	Bučka 
00050000-55ff-e577-c678-7b84914b3729	9261	Cankova
00050000-55ff-e577-63f1-b330f170640b	3000	Celje 
00050000-55ff-e577-7634-8a1e46423a1d	3001	Celje - poštni predali
00050000-55ff-e577-f7d7-5d049dd1cbe9	4207	Cerklje na Gorenjskem
00050000-55ff-e577-de87-32ed9bdbcfcc	8263	Cerklje ob Krki
00050000-55ff-e577-1cc5-04753c41febf	1380	Cerknica
00050000-55ff-e577-575f-57b8d08012be	5282	Cerkno
00050000-55ff-e577-6ab1-86474f7cfd81	2236	Cerkvenjak
00050000-55ff-e577-4dee-3e4a3b763b2c	2215	Ceršak
00050000-55ff-e577-a0e8-74cf9de2c05c	2326	Cirkovce
00050000-55ff-e577-dab0-7c33e9dc1e3d	2282	Cirkulane
00050000-55ff-e577-c620-1f072a62b64e	5273	Col
00050000-55ff-e577-20d8-0a19f82e0974	8251	Čatež ob Savi
00050000-55ff-e577-44b6-fb4f8a05d6d5	1413	Čemšenik
00050000-55ff-e577-a4a1-b1d4a90cf5d3	5253	Čepovan
00050000-55ff-e577-bb63-06ef23cf0398	9232	Črenšovci
00050000-55ff-e577-fee2-a6c484385379	2393	Črna na Koroškem
00050000-55ff-e577-9dcd-be7745f6b936	6275	Črni Kal
00050000-55ff-e577-ded8-afa858cce0c3	5274	Črni Vrh nad Idrijo
00050000-55ff-e577-d495-6f83e1a83c80	5262	Črniče
00050000-55ff-e577-5f80-edf84efb1106	8340	Črnomelj
00050000-55ff-e577-2fc0-da51bfee5fe9	6271	Dekani
00050000-55ff-e577-4893-2feb1f3dfd76	5210	Deskle
00050000-55ff-e577-bd7a-9d3eec2ea64e	2253	Destrnik
00050000-55ff-e577-a5ec-3c67cf0e4e44	6215	Divača
00050000-55ff-e577-e5d4-fa99fdbff7df	1233	Dob
00050000-55ff-e577-d2e9-fb71b75cdb01	3224	Dobje pri Planini
00050000-55ff-e577-b802-10fb0f6ea4d6	8257	Dobova
00050000-55ff-e577-3a2a-457ede1a4bd5	1423	Dobovec
00050000-55ff-e577-4ef8-947b9aa8d222	5263	Dobravlje
00050000-55ff-e577-4b9a-0f1755522538	3204	Dobrna
00050000-55ff-e577-0652-8b679c306488	8211	Dobrnič
00050000-55ff-e577-37d2-88183cc9d6be	1356	Dobrova
00050000-55ff-e577-8f75-2d2ce0465c72	9223	Dobrovnik/Dobronak 
00050000-55ff-e577-f37b-5544d3f179de	5212	Dobrovo v Brdih
00050000-55ff-e577-d0f6-a61e0d73b90b	1431	Dol pri Hrastniku
00050000-55ff-e577-635b-dbc25d7463de	1262	Dol pri Ljubljani
00050000-55ff-e577-1f0f-9ba99d75ecf4	1273	Dole pri Litiji
00050000-55ff-e577-d9f8-d44439af3747	1331	Dolenja vas
00050000-55ff-e577-de78-3c04067de809	8350	Dolenjske Toplice
00050000-55ff-e577-4125-304289200916	1230	Domžale
00050000-55ff-e577-4339-cf334efb2a1f	2252	Dornava
00050000-55ff-e577-eabd-4465f917036a	5294	Dornberk
00050000-55ff-e577-8db5-48fc2321f397	1319	Draga
00050000-55ff-e577-84b2-cd9320cba5db	8343	Dragatuš
00050000-55ff-e577-a66c-e932d0d82466	3222	Dramlje
00050000-55ff-e577-fc6d-125fcca99f20	2370	Dravograd
00050000-55ff-e577-6023-98b766ad7749	4203	Duplje
00050000-55ff-e577-ccd6-d3c4f5645495	6221	Dutovlje
00050000-55ff-e577-6cdd-b22051a8ad85	8361	Dvor
00050000-55ff-e577-7929-a8f1a4262f70	2343	Fala
00050000-55ff-e577-b226-d24a95962d87	9208	Fokovci
00050000-55ff-e577-0983-9ebae6672078	2313	Fram
00050000-55ff-e577-df2d-ac74431caa65	3213	Frankolovo
00050000-55ff-e577-43c3-e5b7882a39c8	1274	Gabrovka
00050000-55ff-e577-1a08-22bd8889326b	8254	Globoko
00050000-55ff-e577-f7dd-79fbedcb441f	5275	Godovič
00050000-55ff-e577-a458-82ace7cf1824	4204	Golnik
00050000-55ff-e577-2ddc-a5b4e575af1d	3303	Gomilsko
00050000-55ff-e577-0de5-bc938ea1d5a2	4224	Gorenja vas
00050000-55ff-e577-f121-f5a81132c9a5	3263	Gorica pri Slivnici
00050000-55ff-e577-b1bb-0c271bf67c5f	2272	Gorišnica
00050000-55ff-e577-b9c8-0e74538a232b	9250	Gornja Radgona
00050000-55ff-e577-069f-657710244f91	3342	Gornji Grad
00050000-55ff-e577-e595-726f9e8a3783	4282	Gozd Martuljek
00050000-55ff-e577-c0c2-e89b24153a40	6272	Gračišče
00050000-55ff-e577-ae93-7d02a3c0986b	9264	Grad
00050000-55ff-e577-9c41-cbaff051bae2	8332	Gradac
00050000-55ff-e577-0e6d-311a2ea1da96	1384	Grahovo
00050000-55ff-e577-f5bc-628e5438bf67	5242	Grahovo ob Bači
00050000-55ff-e577-7016-76e8a7343154	5251	Grgar
00050000-55ff-e577-efc2-669af1e522ca	3302	Griže
00050000-55ff-e577-de28-7047936835fb	3231	Grobelno
00050000-55ff-e577-c904-f2e68f146b41	1290	Grosuplje
00050000-55ff-e577-788b-a6dad6cded49	2288	Hajdina
00050000-55ff-e577-5652-2443c9756b44	8362	Hinje
00050000-55ff-e577-52f0-a78a99082c65	2311	Hoče
00050000-55ff-e577-92cf-5f6cb66fe0ac	9205	Hodoš/Hodos
00050000-55ff-e577-45c1-dae0e1274e99	1354	Horjul
00050000-55ff-e577-dd84-1960b53d9b12	1372	Hotedršica
00050000-55ff-e577-3219-17a5d173533d	1430	Hrastnik
00050000-55ff-e577-edc5-dce4d577938c	6225	Hruševje
00050000-55ff-e577-7a09-4dc5dc5929d1	4276	Hrušica
00050000-55ff-e577-5d30-10d85359b738	5280	Idrija
00050000-55ff-e577-e110-67699e3f5ca0	1292	Ig
00050000-55ff-e577-14ce-67dd8e5cdc50	6250	Ilirska Bistrica
00050000-55ff-e577-63db-0a941dda1a8d	6251	Ilirska Bistrica-Trnovo
00050000-55ff-e577-51ee-0e21a1624336	1295	Ivančna Gorica
00050000-55ff-e577-dc5c-030fcd6c8327	2259	Ivanjkovci
00050000-55ff-e577-cd40-15525e8a90ed	1411	Izlake
00050000-55ff-e577-249b-f6296c4d01fd	6310	Izola/Isola
00050000-55ff-e577-c7c3-c8d3306e4c27	2222	Jakobski Dol
00050000-55ff-e577-33e4-c2ea24a5447c	2221	Jarenina
00050000-55ff-e577-9465-c767fff40d97	6254	Jelšane
00050000-55ff-e577-926e-2ad6dc4bdee1	4270	Jesenice
00050000-55ff-e577-d088-aa6355de4884	8261	Jesenice na Dolenjskem
00050000-55ff-e577-adc3-656be872e83d	3273	Jurklošter
00050000-55ff-e577-c941-2ed82eb4f7f0	2223	Jurovski Dol
00050000-55ff-e577-5a6e-69c85877b206	2256	Juršinci
00050000-55ff-e577-9346-cc912d904d6f	5214	Kal nad Kanalom
00050000-55ff-e577-a3b2-c9d27d75b753	3233	Kalobje
00050000-55ff-e577-baa4-edd7feccc3db	4246	Kamna Gorica
00050000-55ff-e577-4184-398be8a1ffc6	2351	Kamnica
00050000-55ff-e577-4d10-038255774072	1241	Kamnik
00050000-55ff-e577-6122-12d1f00f31d0	5213	Kanal
00050000-55ff-e577-5c22-f66fd84a7f8c	8258	Kapele
00050000-55ff-e577-c712-1f6590f71d75	2362	Kapla
00050000-55ff-e577-0836-6e680d6d7748	2325	Kidričevo
00050000-55ff-e577-8d34-16409bdf3fa0	1412	Kisovec
00050000-55ff-e577-074a-6bdc02503f9b	6253	Knežak
00050000-55ff-e577-74ee-da379a2155d6	5222	Kobarid
00050000-55ff-e577-fe18-ccb7c5c21819	9227	Kobilje
00050000-55ff-e577-f790-7cbfa8d4de42	1330	Kočevje
00050000-55ff-e577-171a-1150c48b94ee	1338	Kočevska Reka
00050000-55ff-e577-a7ff-c5e35fe83095	2276	Kog
00050000-55ff-e577-a0c6-8793b565e1d5	5211	Kojsko
00050000-55ff-e577-4b8c-c9caf90abca5	6223	Komen
00050000-55ff-e577-ce24-a1bc6e8ba7c9	1218	Komenda
00050000-55ff-e577-b989-88d0dbde85c0	6000	Koper/Capodistria 
00050000-55ff-e577-37ac-ac8fc861c887	6001	Koper/Capodistria - poštni predali
00050000-55ff-e577-9481-567975e64328	8282	Koprivnica
00050000-55ff-e577-795a-253bb2a80158	5296	Kostanjevica na Krasu
00050000-55ff-e577-b8c1-dec536e29e58	8311	Kostanjevica na Krki
00050000-55ff-e577-9e60-d2ef9970346a	1336	Kostel
00050000-55ff-e577-c1fd-3fd348547eee	6256	Košana
00050000-55ff-e577-247c-90b61bd6b4d3	2394	Kotlje
00050000-55ff-e577-9227-9ffc0a93e33d	6240	Kozina
00050000-55ff-e577-97ec-aded3feae638	3260	Kozje
00050000-55ff-e577-8833-cbd35e100bfe	4000	Kranj 
00050000-55ff-e577-fd5e-0c329c4e8a5c	4001	Kranj - poštni predali
00050000-55ff-e577-77a2-6ea2ab4cca16	4280	Kranjska Gora
00050000-55ff-e577-379d-6f890e622a87	1281	Kresnice
00050000-55ff-e577-7913-f2ed3fce9941	4294	Križe
00050000-55ff-e577-dce9-c2de9d50dd48	9206	Križevci
00050000-55ff-e577-d7d4-95adabd5e643	9242	Križevci pri Ljutomeru
00050000-55ff-e577-c500-f379a3a6432a	1301	Krka
00050000-55ff-e577-f62c-76fb1d2a0ff4	8296	Krmelj
00050000-55ff-e577-4cee-5f8e85600ade	4245	Kropa
00050000-55ff-e577-b08d-646086abd33f	8262	Krška vas
00050000-55ff-e577-89c6-31db729f91fc	8270	Krško
00050000-55ff-e577-71fc-9b250eba4ab2	9263	Kuzma
00050000-55ff-e577-74ad-6a055e3133fa	2318	Laporje
00050000-55ff-e577-3444-8952f54f68d8	3270	Laško
00050000-55ff-e577-b326-56a4c4a77b2a	1219	Laze v Tuhinju
00050000-55ff-e577-0b33-a320b2c4febf	2230	Lenart v Slovenskih goricah
00050000-55ff-e577-6ee4-7ee97c3cfe87	9220	Lendava/Lendva
00050000-55ff-e577-0d1f-203ca8966739	4248	Lesce
00050000-55ff-e577-0efe-8687a69114c7	3261	Lesično
00050000-55ff-e577-62ba-d89f908c80ba	8273	Leskovec pri Krškem
00050000-55ff-e577-b927-077a1b9968b8	2372	Libeliče
00050000-55ff-e577-d9d3-63bd109a3a79	2341	Limbuš
00050000-55ff-e577-bde8-7e084fea93b9	1270	Litija
00050000-55ff-e577-f204-cbd4b84c370f	3202	Ljubečna
00050000-55ff-e577-b383-8985be72d1e7	1000	Ljubljana 
00050000-55ff-e577-af03-848c7e9115ca	1001	Ljubljana - poštni predali
00050000-55ff-e577-038d-9cbe6ed69c48	1231	Ljubljana - Črnuče
00050000-55ff-e577-5c6b-00202d3456ab	1261	Ljubljana - Dobrunje
00050000-55ff-e577-d1bb-6d9bfd1c7172	1260	Ljubljana - Polje
00050000-55ff-e577-c77b-3c4dc3115fd3	1210	Ljubljana - Šentvid
00050000-55ff-e577-b1e6-1d68a3b49789	1211	Ljubljana - Šmartno
00050000-55ff-e577-f67c-1a44e125c859	3333	Ljubno ob Savinji
00050000-55ff-e577-b78b-9d6754a6a44f	9240	Ljutomer
00050000-55ff-e577-bff8-100b831b279e	3215	Loče
00050000-55ff-e577-b360-979458e71765	5231	Log pod Mangartom
00050000-55ff-e577-183a-f433d7e997f9	1358	Log pri Brezovici
00050000-55ff-e577-72ab-601cb1ee766d	1370	Logatec
00050000-55ff-e577-d23d-1c758a69d581	1371	Logatec
00050000-55ff-e577-29ca-ba1586cbedfa	1434	Loka pri Zidanem Mostu
00050000-55ff-e577-596b-081e014b79b6	3223	Loka pri Žusmu
00050000-55ff-e577-969a-4574d748c0ad	6219	Lokev
00050000-55ff-e577-d12f-f4e6abd93350	1318	Loški Potok
00050000-55ff-e577-7ba8-85255fef2f18	2324	Lovrenc na Dravskem polju
00050000-55ff-e577-17b6-60db0145413c	2344	Lovrenc na Pohorju
00050000-55ff-e577-2423-c99a9ef37c57	3334	Luče
00050000-55ff-e577-d627-eb61e3b96f41	1225	Lukovica
00050000-55ff-e577-1d04-806e538dc1e1	9202	Mačkovci
00050000-55ff-e577-0c6b-9768a4511a8d	2322	Majšperk
00050000-55ff-e577-40fe-ad05f5444504	2321	Makole
00050000-55ff-e577-ae4a-24b54fdd53f8	9243	Mala Nedelja
00050000-55ff-e577-8651-6235c288a583	2229	Malečnik
00050000-55ff-e577-605f-0456020ba7ce	6273	Marezige
00050000-55ff-e577-3455-4ff0daff7323	2000	Maribor 
00050000-55ff-e577-6570-60efd9f1e609	2001	Maribor - poštni predali
00050000-55ff-e577-50f9-6155fd2ae29d	2206	Marjeta na Dravskem polju
00050000-55ff-e577-359a-90fa1758a69d	2281	Markovci
00050000-55ff-e577-dd68-1eb00221d948	9221	Martjanci
00050000-55ff-e577-1878-b1f41754ee1e	6242	Materija
00050000-55ff-e577-cb09-beabe9ef6cd9	4211	Mavčiče
00050000-55ff-e577-65c1-560174b0cacd	1215	Medvode
00050000-55ff-e577-35c3-ab3c6819ac5d	1234	Mengeš
00050000-55ff-e577-359e-4adacb47d943	8330	Metlika
00050000-55ff-e577-3503-d4868a2e6f1b	2392	Mežica
00050000-55ff-e577-58b0-02a4dfaf853b	2204	Miklavž na Dravskem polju
00050000-55ff-e577-62d0-7052fa897f76	2275	Miklavž pri Ormožu
00050000-55ff-e577-3de0-7c819a40018f	5291	Miren
00050000-55ff-e577-9b06-8c722502915f	8233	Mirna
00050000-55ff-e577-2e32-caa3120c0497	8216	Mirna Peč
00050000-55ff-e577-cfb0-6578c355a384	2382	Mislinja
00050000-55ff-e577-1d92-0cf23806b22c	4281	Mojstrana
00050000-55ff-e577-d5e9-3ca679658628	8230	Mokronog
00050000-55ff-e577-81c8-aceaa13804b7	1251	Moravče
00050000-55ff-e577-3f75-565c1a7d642c	9226	Moravske Toplice
00050000-55ff-e577-6da3-7a5583f8f341	5216	Most na Soči
00050000-55ff-e577-cb7a-c6e02de7d839	1221	Motnik
00050000-55ff-e577-2576-8909dafd55c2	3330	Mozirje
00050000-55ff-e577-8b99-c45395eaf27a	9000	Murska Sobota 
00050000-55ff-e577-8f43-739769292bf6	9001	Murska Sobota - poštni predali
00050000-55ff-e577-c135-84fd1d2604c3	2366	Muta
00050000-55ff-e577-e9d9-c91425feb0c3	4202	Naklo
00050000-55ff-e577-7b59-5bab70093b1f	3331	Nazarje
00050000-55ff-e577-6a19-368af2c1d528	1357	Notranje Gorice
00050000-55ff-e577-8d1d-6ef3bee714c8	3203	Nova Cerkev
00050000-55ff-e577-20b4-6f8ce06c496d	5000	Nova Gorica 
00050000-55ff-e577-9008-03996d9c5ce5	5001	Nova Gorica - poštni predali
00050000-55ff-e577-21fe-8df67cc2bbb4	1385	Nova vas
00050000-55ff-e577-0aa1-a1c9537ae166	8000	Novo mesto
00050000-55ff-e577-4ca4-637d7238e753	8001	Novo mesto - poštni predali
00050000-55ff-e577-4b79-40940444b52e	6243	Obrov
00050000-55ff-e577-ad44-9724ea400ebd	9233	Odranci
00050000-55ff-e577-f326-38d1175ab703	2317	Oplotnica
00050000-55ff-e577-5aed-355fc17e4a30	2312	Orehova vas
00050000-55ff-e577-dabb-881da3e92d32	2270	Ormož
00050000-55ff-e577-3755-f687d00e3f68	1316	Ortnek
00050000-55ff-e577-90ac-086fcba5116b	1337	Osilnica
00050000-55ff-e577-8070-0ca5ff14bf05	8222	Otočec
00050000-55ff-e577-a040-e21bfae95fa1	2361	Ožbalt
00050000-55ff-e577-ca8b-67e095038646	2231	Pernica
00050000-55ff-e577-2c7b-ab6cfc1c7517	2211	Pesnica pri Mariboru
00050000-55ff-e577-7110-bc67998e4543	9203	Petrovci
00050000-55ff-e577-df35-8455fc33672e	3301	Petrovče
00050000-55ff-e577-415f-e4564ced3006	6330	Piran/Pirano
00050000-55ff-e577-6be9-ba1848e55384	8255	Pišece
00050000-55ff-e577-397e-6dd138b8ca18	6257	Pivka
00050000-55ff-e577-ebba-ad99bfb56bfc	6232	Planina
00050000-55ff-e577-58f0-939aef03409e	3225	Planina pri Sevnici
00050000-55ff-e577-326d-0809e9ad8f41	6276	Pobegi
00050000-55ff-e577-4f35-ecc27d7fd8c3	8312	Podbočje
00050000-55ff-e577-c530-a0c70dab42a9	5243	Podbrdo
00050000-55ff-e577-c3d5-3997c6b0a6ea	3254	Podčetrtek
00050000-55ff-e577-5394-905e30c7da81	2273	Podgorci
00050000-55ff-e577-eb4e-a01bd89fb61f	6216	Podgorje
00050000-55ff-e577-2985-8a1cd89b592a	2381	Podgorje pri Slovenj Gradcu
00050000-55ff-e577-2d0c-c66effb76b78	6244	Podgrad
00050000-55ff-e577-3fe2-159d2bd0a205	1414	Podkum
00050000-55ff-e577-51e3-e69c586370f0	2286	Podlehnik
00050000-55ff-e577-1113-49cc31dbb1ee	5272	Podnanos
00050000-55ff-e577-4eaa-51b083b8a63f	4244	Podnart
00050000-55ff-e577-d36f-e50c2a91d7b9	3241	Podplat
00050000-55ff-e577-5320-8bfb2f8e52f2	3257	Podsreda
00050000-55ff-e577-5547-9e03d5f1f784	2363	Podvelka
00050000-55ff-e577-e3e9-8b11c5a4981b	2208	Pohorje
00050000-55ff-e577-4771-d7174da277d2	2257	Polenšak
00050000-55ff-e577-dbb5-ebf7d369a818	1355	Polhov Gradec
00050000-55ff-e577-3f87-ff0e1a590ac8	4223	Poljane nad Škofjo Loko
00050000-55ff-e577-77d5-440190d4a276	2319	Poljčane
00050000-55ff-e577-a8bd-da61e48766af	1272	Polšnik
00050000-55ff-e577-b603-171ff2db8491	3313	Polzela
00050000-55ff-e577-0103-7bdafe7cfac3	3232	Ponikva
00050000-55ff-e577-d122-11078569d6a9	6320	Portorož/Portorose
00050000-55ff-e577-9ed6-565c7b72e37d	6230	Postojna
00050000-55ff-e577-6aec-7ccf06734daa	2331	Pragersko
00050000-55ff-e577-7cca-8177c997da58	3312	Prebold
00050000-55ff-e578-cc5d-2dec55ffae27	4205	Preddvor
00050000-55ff-e578-a24e-d705f58b6c8e	6255	Prem
00050000-55ff-e578-8438-f1e7492fd108	1352	Preserje
00050000-55ff-e578-6abd-12834daf4137	6258	Prestranek
00050000-55ff-e578-b693-f32a621e3e94	2391	Prevalje
00050000-55ff-e578-d084-2e83a0fa1743	3262	Prevorje
00050000-55ff-e578-b142-71d2cde3621a	1276	Primskovo 
00050000-55ff-e578-aa1c-38cb54b17148	3253	Pristava pri Mestinju
00050000-55ff-e578-f8e2-b7dcee7aa051	9207	Prosenjakovci/Partosfalva
00050000-55ff-e578-1b3b-a8743d4974a3	5297	Prvačina
00050000-55ff-e578-9f51-5db80ff386a9	2250	Ptuj
00050000-55ff-e578-0d24-7fdd7f3726e2	2323	Ptujska Gora
00050000-55ff-e578-3ca0-9147622e24e0	9201	Puconci
00050000-55ff-e578-56cf-d5e99043c896	2327	Rače
00050000-55ff-e578-d218-7186d90051fb	1433	Radeče
00050000-55ff-e578-75ee-d7db4bcc162f	9252	Radenci
00050000-55ff-e578-ae56-f2761774122e	2360	Radlje ob Dravi
00050000-55ff-e578-d27c-c0454fd6c1f6	1235	Radomlje
00050000-55ff-e578-881e-1d67fab35669	4240	Radovljica
00050000-55ff-e578-b140-065434f315f4	8274	Raka
00050000-55ff-e578-8b26-e87e809f51c9	1381	Rakek
00050000-55ff-e578-457a-204377548dc8	4283	Rateče - Planica
00050000-55ff-e578-d204-bc5003b4602e	2390	Ravne na Koroškem
00050000-55ff-e578-6326-3f27c1db5132	9246	Razkrižje
00050000-55ff-e578-7a4e-674189b21b1c	3332	Rečica ob Savinji
00050000-55ff-e578-28b8-7ba8efc4ae2c	5292	Renče
00050000-55ff-e578-e913-267712dd3e41	1310	Ribnica
00050000-55ff-e578-4a30-781f57a4ae40	2364	Ribnica na Pohorju
00050000-55ff-e578-73ad-c32dd82a7e0c	3272	Rimske Toplice
00050000-55ff-e578-ead6-2a26ed171962	1314	Rob
00050000-55ff-e578-2a77-fe6d79da297e	5215	Ročinj
00050000-55ff-e578-98d3-a1d6c5a7e4e4	3250	Rogaška Slatina
00050000-55ff-e578-1498-21d9f7671ab5	9262	Rogašovci
00050000-55ff-e578-6885-83c51d3d1aba	3252	Rogatec
00050000-55ff-e578-303f-ad5236b5fe78	1373	Rovte
00050000-55ff-e578-c1df-a79ff5351368	2342	Ruše
00050000-55ff-e578-4511-029ca77e8414	1282	Sava
00050000-55ff-e578-e4d8-b90e633c235b	6333	Sečovlje/Sicciole
00050000-55ff-e578-55bc-4740153a29e4	4227	Selca
00050000-55ff-e578-4200-72439fbbe966	2352	Selnica ob Dravi
00050000-55ff-e578-b544-095749bc25d2	8333	Semič
00050000-55ff-e578-0303-40b5d570c133	8281	Senovo
00050000-55ff-e578-1809-ba64b192c7bc	6224	Senožeče
00050000-55ff-e578-49ee-733859d5f08e	8290	Sevnica
00050000-55ff-e578-c208-afb74776bb75	6210	Sežana
00050000-55ff-e578-4eed-26bd8c139e79	2214	Sladki Vrh
00050000-55ff-e578-7640-b1a263103ed2	5283	Slap ob Idrijci
00050000-55ff-e578-7b94-3e5992f96fdd	2380	Slovenj Gradec
00050000-55ff-e578-6fc1-fab70d9922b9	2310	Slovenska Bistrica
00050000-55ff-e578-2810-ca2862a2a633	3210	Slovenske Konjice
00050000-55ff-e578-29c2-e0390deb92a2	1216	Smlednik
00050000-55ff-e578-f812-217a217aaa42	5232	Soča
00050000-55ff-e578-1aca-c380675feee8	1317	Sodražica
00050000-55ff-e578-a7c6-2d53decea8eb	3335	Solčava
00050000-55ff-e578-fc61-46e5a2869768	5250	Solkan
00050000-55ff-e578-64e3-0ba5e4da9c84	4229	Sorica
00050000-55ff-e578-502a-b70fb6919a8a	4225	Sovodenj
00050000-55ff-e578-774c-b101455a7937	5281	Spodnja Idrija
00050000-55ff-e578-8c5d-1e48efdddeb0	2241	Spodnji Duplek
00050000-55ff-e578-f23e-de7d80a5de6c	9245	Spodnji Ivanjci
00050000-55ff-e578-5dfd-9a53999c6fa9	2277	Središče ob Dravi
00050000-55ff-e578-d5ba-1ac2eba45e37	4267	Srednja vas v Bohinju
00050000-55ff-e578-a474-9ff7250fe0d8	8256	Sromlje 
00050000-55ff-e578-0c62-997164e836a6	5224	Srpenica
00050000-55ff-e578-7a41-adf39d2771fe	1242	Stahovica
00050000-55ff-e578-c192-5d2d197d8312	1332	Stara Cerkev
00050000-55ff-e578-47dc-f0c1b0f15013	8342	Stari trg ob Kolpi
00050000-55ff-e578-1e86-7a07184553e6	1386	Stari trg pri Ložu
00050000-55ff-e578-87bf-a36a0c50aa7f	2205	Starše
00050000-55ff-e578-c987-d35e5f64ea46	2289	Stoperce
00050000-55ff-e578-482a-0dd7c3ddeb98	8322	Stopiče
00050000-55ff-e578-d36f-c8530b6007cf	3206	Stranice
00050000-55ff-e578-cac1-34964e0efbd5	8351	Straža
00050000-55ff-e578-ac0b-9921cb58fd8f	1313	Struge
00050000-55ff-e578-05eb-02beb98a6444	8293	Studenec
00050000-55ff-e578-ecd2-9b60169d15cd	8331	Suhor
00050000-55ff-e578-1da1-afebc3fde0dd	2233	Sv. Ana v Slovenskih goricah
00050000-55ff-e578-198c-8fdb97e94856	2235	Sv. Trojica v Slovenskih goricah
00050000-55ff-e578-8d96-7e9f174ce31f	2353	Sveti Duh na Ostrem Vrhu
00050000-55ff-e578-cb34-6863af62c317	9244	Sveti Jurij ob Ščavnici
00050000-55ff-e578-96d8-e116d72cd658	3264	Sveti Štefan
00050000-55ff-e578-bef2-0941dd34c554	2258	Sveti Tomaž
00050000-55ff-e578-1a3b-47ca03bd73d7	9204	Šalovci
00050000-55ff-e578-f2ce-d20efb0e728e	5261	Šempas
00050000-55ff-e578-944d-0e8e5ef3c0b9	5290	Šempeter pri Gorici
00050000-55ff-e578-8c3b-3dece5d087ba	3311	Šempeter v Savinjski dolini
00050000-55ff-e578-0a41-8815b971e795	4208	Šenčur
00050000-55ff-e578-a07f-e935104d32d1	2212	Šentilj v Slovenskih goricah
00050000-55ff-e578-96d3-9c399532ec65	8297	Šentjanž
00050000-55ff-e578-b944-2a4403dd9bc7	2373	Šentjanž pri Dravogradu
00050000-55ff-e578-49cd-66207ca17acb	8310	Šentjernej
00050000-55ff-e578-1240-64663eb46073	3230	Šentjur
00050000-55ff-e578-9a83-b45f8253f95a	3271	Šentrupert
00050000-55ff-e578-06b8-fc18df0ef810	8232	Šentrupert
00050000-55ff-e578-4155-4b233a7f5a3a	1296	Šentvid pri Stični
00050000-55ff-e578-5e76-fba71579a9a3	8275	Škocjan
00050000-55ff-e578-5e03-06dfe0a4467d	6281	Škofije
00050000-55ff-e578-744e-3c2fc0f9e395	4220	Škofja Loka
00050000-55ff-e578-0261-1d8b2d6db691	3211	Škofja vas
00050000-55ff-e578-e60d-06ec6da69baf	1291	Škofljica
00050000-55ff-e578-bb35-9df3eeaead8b	6274	Šmarje
00050000-55ff-e578-f5d4-c7366f5b197a	1293	Šmarje - Sap
00050000-55ff-e578-83be-207224f841ef	3240	Šmarje pri Jelšah
00050000-55ff-e578-353b-a26ffad1a923	8220	Šmarješke Toplice
00050000-55ff-e578-c2ea-f8cdfaef8cd7	2315	Šmartno na Pohorju
00050000-55ff-e578-41c1-1484baffeb42	3341	Šmartno ob Dreti
00050000-55ff-e578-36a7-d7d6c3b27f4c	3327	Šmartno ob Paki
00050000-55ff-e578-0983-3f5bdde2f3ab	1275	Šmartno pri Litiji
00050000-55ff-e578-67ae-a467252e7fee	2383	Šmartno pri Slovenj Gradcu
00050000-55ff-e578-37c7-ebc0a576525b	3201	Šmartno v Rožni dolini
00050000-55ff-e578-d360-02abe8cb4e25	3325	Šoštanj
00050000-55ff-e578-fff3-98b51e55b920	6222	Štanjel
00050000-55ff-e578-8334-c509933db3c6	3220	Štore
00050000-55ff-e578-2f3a-6084517dfebe	3304	Tabor
00050000-55ff-e578-bf65-6fb682c99a0b	3221	Teharje
00050000-55ff-e578-39a8-b6a79f7f8656	9251	Tišina
00050000-55ff-e578-9588-42cfbef1d1af	5220	Tolmin
00050000-55ff-e578-a225-048a38c15904	3326	Topolšica
00050000-55ff-e578-5083-bb177b6dce3b	2371	Trbonje
00050000-55ff-e578-767b-bfe87b26b604	1420	Trbovlje
00050000-55ff-e578-5817-454ba31fdb9c	8231	Trebelno 
00050000-55ff-e578-c30a-f9ebb9858eb5	8210	Trebnje
00050000-55ff-e578-791f-87acb0018d4a	5252	Trnovo pri Gorici
00050000-55ff-e578-721d-85196b2c0450	2254	Trnovska vas
00050000-55ff-e578-1420-16d0a4f732f7	1222	Trojane
00050000-55ff-e578-d52d-73b726ba5989	1236	Trzin
00050000-55ff-e578-dc59-0337658aa72a	4290	Tržič
00050000-55ff-e578-bce9-6d2f635cf667	8295	Tržišče
00050000-55ff-e578-b0e7-36b1291d7595	1311	Turjak
00050000-55ff-e578-c021-c30c19e27b89	9224	Turnišče
00050000-55ff-e578-5982-00673ab9da5e	8323	Uršna sela
00050000-55ff-e578-d5ab-59e8ea20cdcf	1252	Vače
00050000-55ff-e578-d899-dccfd6aaaf84	3320	Velenje 
00050000-55ff-e578-1864-822d2541127d	3322	Velenje - poštni predali
00050000-55ff-e578-46fb-f4eaa88badc7	8212	Velika Loka
00050000-55ff-e578-545d-dbcfb3763dd7	2274	Velika Nedelja
00050000-55ff-e578-5099-f85f22c5c319	9225	Velika Polana
00050000-55ff-e578-ff53-a253d156d687	1315	Velike Lašče
00050000-55ff-e578-891d-d7cc5181bce5	8213	Veliki Gaber
00050000-55ff-e578-f073-288850d7eb50	9241	Veržej
00050000-55ff-e578-b427-567587818765	1312	Videm - Dobrepolje
00050000-55ff-e578-1a4f-1be691f1c323	2284	Videm pri Ptuju
00050000-55ff-e578-ee73-2fe8edf135b8	8344	Vinica
00050000-55ff-e578-bdc5-fe22def25207	5271	Vipava
00050000-55ff-e578-95ee-5c75db3889d7	4212	Visoko
00050000-55ff-e578-e837-a3a0b6efbcd9	1294	Višnja Gora
00050000-55ff-e578-3496-a63bacc5c25f	3205	Vitanje
00050000-55ff-e578-caa4-0473f5110758	2255	Vitomarci
00050000-55ff-e578-dda8-b6d7cea3a755	1217	Vodice
00050000-55ff-e578-c327-cb7a6cd06f8f	3212	Vojnik\t
00050000-55ff-e578-a008-610dbcbb360b	5293	Volčja Draga
00050000-55ff-e578-a5a0-14d128e1d517	2232	Voličina
00050000-55ff-e578-4586-b9d539d75adf	3305	Vransko
00050000-55ff-e578-a7ee-89006a47f0e1	6217	Vremski Britof
00050000-55ff-e578-fc28-8dbed1054648	1360	Vrhnika
00050000-55ff-e578-d653-8a3133b63215	2365	Vuhred
00050000-55ff-e578-4233-f33dd8420f58	2367	Vuzenica
00050000-55ff-e578-d403-c5b285ace3e1	8292	Zabukovje 
00050000-55ff-e578-14dd-4d83d4587d90	1410	Zagorje ob Savi
00050000-55ff-e578-2976-bf8bdfe96103	1303	Zagradec
00050000-55ff-e578-5176-b7c2a2f2944f	2283	Zavrč
00050000-55ff-e578-99a0-085e191d14d5	8272	Zdole 
00050000-55ff-e578-a2f9-f9cecfdcf676	4201	Zgornja Besnica
00050000-55ff-e578-a340-511ff9bfeba3	2242	Zgornja Korena
00050000-55ff-e578-4d24-894917f83de9	2201	Zgornja Kungota
00050000-55ff-e578-c588-5d749538566c	2316	Zgornja Ložnica
00050000-55ff-e578-6227-b20ab9b3ca48	2314	Zgornja Polskava
00050000-55ff-e578-2bb7-31adb1cf3166	2213	Zgornja Velka
00050000-55ff-e578-4b96-700f951145e6	4247	Zgornje Gorje
00050000-55ff-e578-b634-1da9518aeffc	4206	Zgornje Jezersko
00050000-55ff-e578-8c73-a71879a099a9	2285	Zgornji Leskovec
00050000-55ff-e578-a7ab-b3ee2358df02	1432	Zidani Most
00050000-55ff-e578-4d20-7705cbc37123	3214	Zreče
00050000-55ff-e578-b2af-d54db8123358	4209	Žabnica
00050000-55ff-e578-312f-678ec561f51b	3310	Žalec
00050000-55ff-e578-8de7-54369dec666c	4228	Železniki
00050000-55ff-e578-ea57-6a97b2900902	2287	Žetale
00050000-55ff-e578-30b1-ee2bfc8f47a0	4226	Žiri
00050000-55ff-e578-5b87-b47020e9ce66	4274	Žirovnica
00050000-55ff-e578-5d92-e8815f59333d	8360	Žužemberk
\.


--
-- TOC entry 3022 (class 0 OID 20252283)
-- Dependencies: 232
-- Data for Name: postavkacdve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkacdve (id, skupina, podskupina, naziv, vrpremiere, vrponovitvepremier, vrponovitveprejsnjih, vrgostovanjazamejstvo, vrfestivali, vrgostovanjaint, vrostalo, programdela_id) FROM stdin;
\.


--
-- TOC entry 2995 (class 0 OID 20251910)
-- Dependencies: 205
-- Data for Name: postavkaracuna; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkaracuna (id, racun_id) FROM stdin;
\.


--
-- TOC entry 2976 (class 0 OID 20251690)
-- Dependencies: 186
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
00060000-55ff-e579-64b9-41ad18853133	00080000-55ff-e579-5a3b-8aa7fb667e7d	\N	00040000-55ff-e578-29f2-d4dc80ef1612	Narodni dom	\N	Koroška 15	\N	9231	Beltinci	\N	f	t
00060000-55ff-e579-b6f0-47b5251c1c48	00080000-55ff-e579-5a3b-8aa7fb667e7d	\N	00040000-55ff-e578-29f2-d4dc80ef1612	Korotan	\N	Koroška 22	\N	9231	Beltinci	\N	f	f
00060000-55ff-e579-9da5-2ddd53fc7cbd	00080000-55ff-e579-c129-ed2511ce3f21	\N	00040000-55ff-e578-29f2-d4dc80ef1612	Rimljan	\N	Rimska ploščad 7	\N	9231	Beltinci	\N	f	t
\.


--
-- TOC entry 2984 (class 0 OID 20251794)
-- Dependencies: 194
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, zaporedna, porocilo) FROM stdin;
\.


--
-- TOC entry 2997 (class 0 OID 20251922)
-- Dependencies: 207
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 3023 (class 0 OID 20252297)
-- Dependencies: 233
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, koproducent_id, odstotekfinanciranja, delez, maticnikop, kpe, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 3024 (class 0 OID 20252307)
-- Dependencies: 234
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, sifra, status) FROM stdin;
00190000-55ff-e579-aad5-1d310e6e3c77	00080000-55ff-e579-9e4b-f71f7632bb57	0987	AK
00190000-55ff-e579-682b-4bbbb89f8af5	00080000-55ff-e579-c129-ed2511ce3f21	0989	AK
00190000-55ff-e579-ae8e-8ded0792bcd1	00080000-55ff-e579-e34f-b0ac848f7bd0	0986	AK
00190000-55ff-e579-6b95-00ce339ad082	00080000-55ff-e579-8ba9-56b55e858940	0984	AK
00190000-55ff-e579-4546-c52eb9488e5e	00080000-55ff-e579-b04f-96bd3e680e17	0983	AK
00190000-55ff-e579-9392-58f49f7a046f	00080000-55ff-e579-0594-53ba35d9d0f7	0982	AK
00190000-55ff-e57a-6daa-7c084e16661f	00080000-55ff-e57a-35dd-582281836deb	1001	AK
\.


--
-- TOC entry 3021 (class 0 OID 20252240)
-- Dependencies: 231
-- Data for Name: programdela; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programdela (id, sifra, naziv, zacetek, konec, zakljuceno, potrjenprogram, stpremier, stint, stfest, strazno, stizjem, stponprem, stponprej, stponprejvelikih, stponprejmalih, stponprejmalihkopr, stponprejsredkopr, stponprejvelikihkopr, stgostujo, vrps1, vrps1do, vrps1mat, vrps1gostovsz, stizvnekomerc, stizvprem, stizvpremdoma, stizvpremkopr, stizvponprem, stizvponpremdoma, stizvponpremzamejo, stizvponpremgost, stizvponpremkopr, stizvponpremint, stizvponpremkoprint, stizvponprej, stizvponprejdoma, stizvponprejzamejo, stizvponprejgost, stizvponprejkopr, stizvponprejint, stizvponprejkoprint, stizvgostuj, stizvostalihnek, stizvgostovanjslo, stizvgostovanjzam, stizvgostovanjint, stobisknekom, stobisknekommat, stobisknekomgostslo, stobisknekomgostzam, stobisknekomgostint, stobiskprem, stobiskpremdoma, stobiskpremkopr, stobiskponprem, stobiskponpremdoma, stobiskponpremkopr, stobiskponpremkoprint, stobiskponpremgost, stobiskponpremzamejo, stobiskponpremint, avgobiskprired, avgzaseddvoran, avgcenavstopnice, stprodvstopnic, stkoprodukcij, stkoprodukcijint, stkoprodukcijnvo, stzaposlenih, stzaposigralcev, avgstnastopovigr, sthonorarnih, sthonorarnihigr, sthonorarnihigrtujjz, sthonorarnihigrsamoz, sredstvaint, sredstvaavt, sredstvazaprosenoprem, sredstvazaprosenoponprem, sredstvazaprosenoponprej, sredstvazaprosenogostujo, sredstvazaprosenoint, sredstvazaprosenofest, sredstvazaprosenorazno, sredstvazaprosenoizjem, sredstvadrugijavniprem, sredstvadrugijavniponprem, sredstvadrugijavniponprej, sredstvadrugijavnigostujo, sredstvadrugijavniint, sredstvadrugijavnifest, sredstvadrugijavnirazno, sredstvadrugijavniizjem, sredstvadrugiviriprem, sredstvadrugiviriponprem, sredstvadrugiviriponprej, sredstvadrugivirigostujo, sredstvadrugiviriint, sredstvadrugivirifest, sredstvadrugivirirazno, sredstvadrugiviriizjem, sredstvaavtsamoz) FROM stdin;
00290000-55ff-e57a-a68c-2ec84c92d80c	0001	Testni program dela	2016-02-01	2017-02-01	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 3025 (class 0 OID 20252315)
-- Dependencies: 235
-- Data for Name: programskaenotasklopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programskaenotasklopa (id, naslovpe, avtorpe, obsegpe, mesecpe, vrednostpe, programrazno_id) FROM stdin;
\.


--
-- TOC entry 3001 (class 0 OID 20251951)
-- Dependencies: 211
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, popa_id, naslov_id, sifra, naziv, jeprizorisce, jematicnioder, seplanira, kapaciteta, opis) FROM stdin;
00220000-55ff-e579-c92c-756306ea7489	\N	\N	0001	Poskusna 1	f	\N	t	8	Poskusna učilnica v prvem
00220000-55ff-e579-6b06-920d96a00f7d	\N	\N	0002	Poskusna 3	f	\N	f	34	Poskusna učilnica v tretjem
00220000-55ff-e579-4750-7091472ae26b	\N	\N	0003	Kazinska	t	\N	t	84	Kazinska dvorana
00220000-55ff-e579-2dd0-21f570f24ae7	\N	\N	0004	Mali oder	t	\N	t	24	Mali oder 
00220000-55ff-e579-88f3-8126d8fffdb0	\N	\N	0005	Komorni oder	t	\N	t	15	Komorni oder
00220000-55ff-e579-b33e-401e91513b74	\N	\N	0006	Stara dvorana	t	\N	t	96	Stara dvorana ali dvorana Franceta Prešerna
00220000-55ff-e579-970d-dde0221f23ab	\N	\N	0007	Velika dvorana	t	\N	t	160	Velika, glavna dvorana
\.


--
-- TOC entry 2993 (class 0 OID 20251895)
-- Dependencies: 203
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 2992 (class 0 OID 20251885)
-- Dependencies: 202
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 3014 (class 0 OID 20252093)
-- Dependencies: 224
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta, status) FROM stdin;
\.


--
-- TOC entry 3008 (class 0 OID 20252025)
-- Dependencies: 218
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 2982 (class 0 OID 20251768)
-- Dependencies: 192
-- Data for Name: report; Type: TABLE DATA; Schema: public; Owner: -
--

COPY report (id, job_id, title, filename, transfers, size, format, hash, createdat) FROM stdin;
\.


--
-- TOC entry 2965 (class 0 OID 20251563)
-- Dependencies: 175
-- Data for Name: revizije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY revizije (id, razred, objectid, upor, datum, tip, data) FROM stdin;
1	App\\Entity\\Popa	00080000-55ff-e57a-35dd-582281836deb	00010000-55ff-e578-9c56-cdee8a18fd77	2015-09-21 13:09:46	INS	a:0:{}
2	App\\Entity\\Option	00000000-55ff-e57a-15e0-02bd5fca4599	00010000-55ff-e578-9c56-cdee8a18fd77	2015-09-21 13:09:46	INS	a:0:{}
3	ProgramDela\\Entity\\ProdukcijskaHisa	00190000-55ff-e57a-6daa-7c084e16661f	00010000-55ff-e578-9c56-cdee8a18fd77	2015-09-21 13:09:46	INS	a:0:{}
\.


--
-- TOC entry 3044 (class 0 OID 0)
-- Dependencies: 174
-- Name: revizije_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('revizije_id_seq', 3, true);


--
-- TOC entry 3002 (class 0 OID 20251964)
-- Dependencies: 212
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 2969 (class 0 OID 20251601)
-- Dependencies: 179
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-55ff-e578-0555-70822c5f407d	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-55ff-e578-f4bd-564d7f0fca0b	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-55ff-e578-9ace-11d32408412e	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-55ff-e578-f763-512ca75ffa33	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-55ff-e578-a763-621e6963d741	planer	Planer dogodkov v koledarju	t
00020000-55ff-e578-b5da-c495100bebb5	kadrovska	Kadrovska služba	t
00020000-55ff-e578-4774-20a62482178c	arhivar	Ažuriranje arhivalij	t
00020000-55ff-e578-f0dc-e0f843df9ee9	igralec	Igralec	t
00020000-55ff-e578-92a5-6b40288c21dc	prisotnost	Vnašalec prisotnosti, tudi za tiste izven uprizoritev	t
00020000-55ff-e579-ff61-83f1337060c2	vsadovoljenja	Vloga z vsemi posameznimi dovoljenji	t
\.


--
-- TOC entry 2967 (class 0 OID 20251585)
-- Dependencies: 177
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-55ff-e578-58ac-ec3ea5edca36	00020000-55ff-e578-9ace-11d32408412e
00010000-55ff-e578-9c56-cdee8a18fd77	00020000-55ff-e578-9ace-11d32408412e
00010000-55ff-e579-40aa-2aac5b631367	00020000-55ff-e579-ff61-83f1337060c2
\.


--
-- TOC entry 3004 (class 0 OID 20251978)
-- Dependencies: 214
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 2996 (class 0 OID 20251916)
-- Dependencies: 206
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 2990 (class 0 OID 20251862)
-- Dependencies: 200
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, sifra, ime, zacetek, konec, aktivna) FROM stdin;
\.


--
-- TOC entry 2963 (class 0 OID 20251550)
-- Dependencies: 173
-- Data for Name: stevilcenje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenje (id, sifra, naziv, prefix, suffix, zacetek, dolzina, format, globalno, poletih) FROM stdin;
00230000-55ff-e578-a0ed-a3d01e321bd3	pri	Privzeto številčenje po letih YYYY-N	\N	\N	1	1	%l-%n	f	t
00230000-55ff-e578-76ac-28e57c165425	123	Privzeto številčenje kratkih šifer	\N	\N	100	3	%n	f	f
00230000-55ff-e578-76b9-95f327946431	bcd	Globalno številčenje črtnih kod	\N	\N	1	9	%n	t	f
00230000-55ff-e578-5a91-70c3a1b9cd81	sif	Številčenje šifrant	\N	\N	1000	4	%n	f	f
00230000-55ff-e578-793c-409ba9660f37	tmp	Globalno številčenje začasnih številk	tmp	\N	1000	5	%l%n	t	t
\.


--
-- TOC entry 2962 (class 0 OID 20251542)
-- Dependencies: 172
-- Data for Name: stevilcenjekonfig; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjekonfig (id, stevilcenje_id, dok) FROM stdin;
00240000-55ff-e578-858b-e2cde0b31314	00230000-55ff-e578-5a91-70c3a1b9cd81	popa
00240000-55ff-e578-a3a5-46ba0bd5873f	00230000-55ff-e578-5a91-70c3a1b9cd81	oseba
00240000-55ff-e578-5f0e-41be15b590de	00230000-55ff-e578-5a91-70c3a1b9cd81	sezona
00240000-55ff-e578-ece6-7b138134a963	00230000-55ff-e578-76ac-28e57c165425	prostor
00240000-55ff-e578-ee27-148b111d5f1e	00230000-55ff-e578-5a91-70c3a1b9cd81	besedilo
00240000-55ff-e578-fa2e-4f22d870fa67	00230000-55ff-e578-5a91-70c3a1b9cd81	uprizoritev
00240000-55ff-e578-6eae-8901d260b8d0	00230000-55ff-e578-5a91-70c3a1b9cd81	funkcija
00240000-55ff-e578-4caf-eca5c2592ac4	00230000-55ff-e578-5a91-70c3a1b9cd81	tipfunkcije
00240000-55ff-e578-be47-1ed29e5e0a69	00230000-55ff-e578-5a91-70c3a1b9cd81	alternacija
00240000-55ff-e578-07ea-a1ec1d757417	00230000-55ff-e578-a0ed-a3d01e321bd3	pogodba
00240000-55ff-e578-74ff-db2eb160d5cc	00230000-55ff-e578-5a91-70c3a1b9cd81	zaposlitev
00240000-55ff-e578-fc9b-dae909f1f4c5	00230000-55ff-e578-5a91-70c3a1b9cd81	zvrstuprizoritve
00240000-55ff-e578-0440-f8f481c1678e	00230000-55ff-e578-a0ed-a3d01e321bd3	programdela
00240000-55ff-e578-b861-f658820ee173	00230000-55ff-e578-5a91-70c3a1b9cd81	zapis
\.


--
-- TOC entry 2961 (class 0 OID 20251537)
-- Dependencies: 171
-- Data for Name: stevilcenjestanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjestanje (id, objid, leto, stevilka) FROM stdin;
e8fb6dc7-d48a-4c10-af5f-a4b0a77c8b2f	00240000-55ff-e578-858b-e2cde0b31314	0	1001
\.


--
-- TOC entry 3010 (class 0 OID 20252042)
-- Dependencies: 220
-- Data for Name: strosekuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY strosekuprizoritve (id, uprizoritev_id, popa_id, naziv, vrednostdo, vrednostna, opis, tipstroska, sort, vrstastroska_id) FROM stdin;
00270000-55ff-e57a-0323-7720ce5b1910	000e0000-55ff-e579-1a99-6469f68378cd	00080000-55ff-e579-5a3b-8aa7fb667e7d	Nabava kostumov	600.50	20.00	Krila in maske	materialni	1	003b0000-55ff-e578-511c-f93b0e0a3bb6
00270000-55ff-e57a-0da1-e64fd4266997	000e0000-55ff-e579-1a99-6469f68378cd	00080000-55ff-e579-5a3b-8aa7fb667e7d	Zavese	125.70	3.10	Modra in zelena zavesa	materialni	2	003b0000-55ff-e578-511c-f93b0e0a3bb6
\.


--
-- TOC entry 2974 (class 0 OID 20251663)
-- Dependencies: 184
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 2991 (class 0 OID 20251872)
-- Dependencies: 201
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja) FROM stdin;
001a0000-55ff-e57a-7f4c-54bf9278d9ff	00180000-55ff-e57a-60b8-b2cc6ba0da29	000c0000-55ff-e57a-97b6-0f165e3aa5a0	00090000-55ff-e579-db67-82735a01c069	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55ff-e57a-e567-f76ee6393b90	00180000-55ff-e57a-60b8-b2cc6ba0da29	000c0000-55ff-e57a-8688-9fe7c816b94f	00090000-55ff-e579-e706-e3602a17db9b	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55ff-e57a-9f11-a3e333d0e933	00180000-55ff-e57a-60b8-b2cc6ba0da29	000c0000-55ff-e57a-037e-930b1d9ffd42	00090000-55ff-e579-5567-bc7b2d841877	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55ff-e57a-1644-c1ee494e5a9b	00180000-55ff-e57a-60b8-b2cc6ba0da29	000c0000-55ff-e57a-81c2-117c2114236f	00090000-55ff-e579-09a9-85aeab030160	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55ff-e57a-a756-920ddd030b48	00180000-55ff-e57a-60b8-b2cc6ba0da29	000c0000-55ff-e57a-7cb8-0bf1b9b69d74	00090000-55ff-e579-fbd9-d82a4860c609	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55ff-e57a-765b-c185d7d08cb6	00180000-55ff-e57a-db46-89d5c7e257f9	\N	00090000-55ff-e579-fbd9-d82a4860c609	2015-08-01 20:00:00	2015-08-01 23:00:00	\N	\N	2.00
\.


--
-- TOC entry 3013 (class 0 OID 20252081)
-- Dependencies: 223
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, sifra, ime, opis, imezenski, podrocje) FROM stdin;
000f0000-55ff-e578-26c4-18d16f95599d	01	Avtor	Avtorji	Avtorka	umetnik
000f0000-55ff-e578-84da-1cd31861fd8d	02	Priredba	Priredba	Priredba	umetnik
000f0000-55ff-e578-60c5-8ba97d47fcfb	03	Prevod	Prevod	Prevod	umetnik
000f0000-55ff-e578-dfa7-c4a2b62bdab2	04	Režija	Režija	Režija	umetnik
000f0000-55ff-e578-c878-f549bbf9a5fb	05	Dramaturgija	Dramaturgija	Dramaturgija	umetnik
000f0000-55ff-e578-f21f-f9e5362c46f9	06	Scenografija	Scenografija	Scenografija	umetnik
000f0000-55ff-e578-664d-df28b3701993	07	Kostumografija	Kostumografija	Kostumografija	umetnik
000f0000-55ff-e578-c6d8-4b39b15b2e4c	08	Koreografija	Koreografija	Koreografija	umetnik
000f0000-55ff-e578-4885-abfdb0776d12	09	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	umetnik
000f0000-55ff-e578-af24-9d9a72968a5b	10	Oblikovanje maske	Oblikovanje maske	Oblikovanje maske	umetnik
000f0000-55ff-e578-3534-3a1165a254f7	11	Lektorstvo	Lektorstvo	Lektorstvo	umetnik
000f0000-55ff-e578-9426-e12d0e5bd7c7	12	Glasbeni soustvarjalec	Glasbeni soustvarjalci	Glasbena soustvarjalka	umetnik
000f0000-55ff-e578-a5ce-7c7904d81a42	13	Intermedijski ustvarjalec	Intermedijski ustvarjalci	Intermedijski ustvarjalka	umetnik
000f0000-55ff-e578-2c1d-477ed75efc6e	14	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	umetnik
000f0000-55ff-e578-2396-b5623c426532	15	Vloga	Intermedijski ustvarjalci	Intermedijska ustvarjalka	igralec
000f0000-55ff-e578-3169-0601db19de82	16	Produkcija, mentorstvo	Produkcija, mentorstvo	Produkcija, mentorstvo	umetnik
000f0000-55ff-e578-36e9-09897a7faf9f	17	Tehnična podpora	Tehnična podpora	Tehnična podpora	tehnik
000f0000-55ff-e578-d20e-160098789e42	18	Inšpicient	Inšpicienti	Inšpicientka	inspicient
\.


--
-- TOC entry 3026 (class 0 OID 20252325)
-- Dependencies: 236
-- Data for Name: tipprogramskeenote; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipprogramskeenote (id, sifra, naziv, koprodukcija, maxfaktor, maxvsi) FROM stdin;
002b0000-55ff-e578-e7aa-1d0cc816d36b	01	Velika predstava	f	1.00	1.00
002b0000-55ff-e578-5eac-6f6ffa3f788b	02	Mala predstava	f	0.50	0.50
002b0000-55ff-e578-ae80-da54b47120bc	03	Mala koprodukcija	t	0.40	1.00
002b0000-55ff-e578-2be6-45b5a9efda1d	04	Srednja koprodukcija	t	0.70	2.00
002b0000-55ff-e578-4d33-b13bf32bdeaa	05	Velika koprodukcija	t	1.00	3.00
\.


--
-- TOC entry 2979 (class 0 OID 20251725)
-- Dependencies: 189
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 2966 (class 0 OID 20251572)
-- Dependencies: 176
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-55ff-e578-9c56-cdee8a18fd77	Konzolni	$2y$05$NS4xMjkyMTcwMzExMjAxROq/zD5qbGhx2bwShvbPYIkrLlGDhkwm2	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-55ff-e579-4cf1-fcedbdfae5a8	testni uporabnik za inšpicienta	$2y$05$NS4xMjkyMTcwMzExMjAxROxkJ1B6xAXex6EZLIwJfWzRJ8DpfecFO	t	\N	\N	\N	ivo@ifigenija.si	\N	\N	\N
00010000-55ff-e579-e79a-32ca3cbd9d80	testni uporabnik za Tehničnega vodjo	$2y$05$NS4xMjkyMTcwMzExMjAxROu/kXWR9sP9oamkesKuxXLbxkCb387.G	t	\N	\N	\N	tona@ifigenija.si	\N	\N	\N
00010000-55ff-e579-c08e-736503f0fc78	testni uporabnik za igralca	$2y$05$NS4xMjkyMTcwMzExMjAxRO/hLCgClfERRsfCAFYwxNCcFIVjP2982	t	\N	\N	\N	irena@ifigenija.si	\N	\N	\N
00010000-55ff-e579-2a34-c7171af004a5	testni uporabnik vnašalca termina storitev (TerminStoritve-vse)	$2y$05$NS4xMjkyMTcwMzExMjAxROT6.kTHqEq4.wa2SOnf124/N14m9qeP.	t	\N	\N	\N	tatjana@ifigenija.si	\N	\N	\N
00010000-55ff-e579-bb1e-b7bd7407a463	testni uporabnik, ki je inšpicient brez zapisov v TerminStoritve	$2y$05$NS4xMjkyMTcwMzExMjAxROHau47Dtb7CME5.nlWwBVM.nusFP.ra2	t	\N	\N	\N	joze@ifigenija.si	\N	\N	\N
00010000-55ff-e579-f18c-ab92ac2c8924	testna uporabnica, ki je planerka	$2y$05$NS4xMjkyMTcwMzExMjAxRO.B/uJO3C7QRNhdX9Q2hTLQsSupj1V1S	t	\N	\N	\N	petra@ifigenija.si	\N	\N	\N
00010000-55ff-e579-6bc1-ce76485b80ac	testni uporabnik, ki dobi ifi-all vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROv2d7jqhaV/Mz3EIsKoi7UoFR.SDSMBm	t	\N	\N	\N	ali@ifigenija.si	\N	\N	\N
00010000-55ff-e579-7692-15a47d0e9da8	testni uporabnik, ki dobi ifi-readall vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROYB9g.gnkufr1l/gWK6mkx.ySqrOWnJC	t	\N	\N	\N	berta@ifigenija.si	\N	\N	\N
00010000-55ff-e579-1375-e419ed777752	testni uporabnik, ki dobi aaa-write dovoljenje	$2y$05$NS4xMjkyMTcwMzExMjAxRORujYObKX.DzpXVYbePkiJkHqg0/Ylya	t	\N	\N	\N	aaron@ifigenija.si	\N	\N	\N
00010000-55ff-e579-40aa-2aac5b631367	testni uporabnik ki dobi vsa posamezna dovoljenja	$2y$05$NS4xMjkyMTcwMzExMjAxRO2ymwxVXTr7U4Ncdn.bN49E8rLw9Jg0O	t	\N	\N	\N	vesna@ifigenija.si	\N	\N	\N
00010000-55ff-e578-58ac-ec3ea5edca36	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 3017 (class 0 OID 20252130)
-- Dependencies: 227
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, producent_id, sifra, faza, naslov, podnaslov, delovninaslov, internacionalninaslov, naslovizvirnika, podnaslovizvirnika, datumzacstudija, stevilovaj, planiranostevilovaj, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, krstna, prvaslovenska, kratkinaslov, maticnioder_id) FROM stdin;
000e0000-55ff-e579-f92a-0020f578238c	00160000-55ff-e579-0146-1596fc8e3f08	\N	00140000-55ff-e578-e748-ec03cae7d518	\N	0001	produkcija	Sen kresne noči		Sanje	\N	\N	\N	2016-02-01	\N	\N	2016-06-01	1	William  Shakespeare - Nebojša  Kavader	f	2				\N	f	\N	\N		00220000-55ff-e579-88f3-8126d8fffdb0
000e0000-55ff-e579-1a99-6469f68378cd	00160000-55ff-e579-72f7-fe0b7b433624	\N	00140000-55ff-e578-944b-9d91bf965632	\N	0002	predprodukcija-ideja	Smoletov vrt			\N	\N	\N	2016-01-01	\N	\N	2016-04-20	2	Berta   Hočevar	f	2				\N	f	\N	\N		00220000-55ff-e579-b33e-401e91513b74
000e0000-55ff-e579-1486-10e414ecf329	\N	\N	00140000-55ff-e578-944b-9d91bf965632	00190000-55ff-e579-aad5-1d310e6e3c77	0003	postprodukcija	Kisli maček			\N	\N	\N	2016-02-01	\N	\N	2016-04-20	2	\N	t	2				\N	f	\N	\N		00220000-55ff-e579-88f3-8126d8fffdb0
000e0000-55ff-e57a-4f43-cdef32273773	\N	\N	00140000-55ff-e578-944b-9d91bf965632	00190000-55ff-e579-aad5-1d310e6e3c77	0004	postprodukcija	Vladimir			\N	\N	\N	2017-03-01	\N	\N	2017-04-20	2	\N	t	2				\N	f	\N	\N		00220000-55ff-e579-88f3-8126d8fffdb0
000e0000-55ff-e57a-e80a-b7273a115d36	\N	\N	00140000-55ff-e578-944b-9d91bf965632	00190000-55ff-e579-aad5-1d310e6e3c77	0005	postprodukcija	Španska princesa			\N	\N	\N	2017-04-01	\N	\N	2017-05-20	1	\N	f	1				\N	f	\N	\N		00220000-55ff-e579-c92c-756306ea7489
000e0000-55ff-e57a-5d56-a417f472df66	\N	\N	00140000-55ff-e578-944b-9d91bf965632	00190000-55ff-e579-aad5-1d310e6e3c77	0006	postprodukcija	Ne vemo datumov			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		00220000-55ff-e579-c92c-756306ea7489
\.


--
-- TOC entry 2986 (class 0 OID 20251815)
-- Dependencies: 196
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, uprizoritev_id, vrsta, zaporedna, porocilo) FROM stdin;
00200000-55ff-e57a-4928-5a003adaf92c	000e0000-55ff-e579-1a99-6469f68378cd	\N	1	
00200000-55ff-e57a-dfd7-a19f9a5d17a2	000e0000-55ff-e579-1a99-6469f68378cd	\N	2	
00200000-55ff-e57a-17ee-b5bcf97783ab	000e0000-55ff-e579-1a99-6469f68378cd	\N	3	
00200000-55ff-e57a-255f-8adfe5eb9d9e	000e0000-55ff-e579-1a99-6469f68378cd	\N	4	
00200000-55ff-e57a-656c-83968dd5bd30	000e0000-55ff-e579-1a99-6469f68378cd	\N	5	
\.


--
-- TOC entry 3000 (class 0 OID 20251943)
-- Dependencies: 210
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 3011 (class 0 OID 20252056)
-- Dependencies: 221
-- Data for Name: vrstastroska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstastroska (id, skupina, podskupina, naziv, opis) FROM stdin;
003b0000-55ff-e578-d295-2dbfa5448881	1	0	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE
003b0000-55ff-e578-528c-d73f4f73914d	1	1	Storitve varovanja zgradb in prostorov	storitve varovanja zgradb in prostorov (npr. gasilci na predstavah)
003b0000-55ff-e578-9f44-74078be1911e	1	2	Založniške in tiskarske storitve	založniške in tiskarske storitve
003b0000-55ff-e578-1086-2993ce941c17	1	3	Časopisi, revije, knjige in strokovna literatura	časopisi, revije, knjige in strokovna literatura
003b0000-55ff-e578-04d6-a708c47955eb	1	4	Stroški prevajalskih storitev	stroški prevajalskih storitev
003b0000-55ff-e578-a10f-160b4c3d64e6	1	5	Stroški oglaševalskih storitev	stroški oglaševalskih storitev
003b0000-55ff-e578-b8ef-89e300662484	1	6	Izdatki za reprezentanco	izdatki za reprezentanco
003b0000-55ff-e578-5162-f400bc9b726b	2	0	POSEBNI MATERIAL IN STORITVE	POSEBNI MATERIAL IN STORITVE
003b0000-55ff-e578-511c-f93b0e0a3bb6	2	1	Drugi posebni material in storitve	drugi posebni material in storitve (npr. za instrumete - navedite)
003b0000-55ff-e578-0806-ee98d759fc11	2	2	Oprema predstave – stroški rekvizitov	Oprema predstave – stroški rekvizitov
003b0000-55ff-e578-e03f-79a6012b4abf	2	3	Oprema predstave – stroški kostumov	Oprema predstave – stroški kostumov
003b0000-55ff-e578-d9fd-2ffe4af2b9d0	2	4	Oprema predstave – stroški scenske opreme	Oprema predstave – stroški scenske opreme
003b0000-55ff-e578-e2e8-c9a8f79964f8	2	5	Oprema predstave – stroški avdio in video opreme	Oprema predstave – stroški avdio in video opreme
003b0000-55ff-e578-f96c-ef8b800472ac	3	0	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE
003b0000-55ff-e578-b573-3d85adfe2c99	3	1	Poštnina in kurirske storitve	poštnina in kurirske storitve
003b0000-55ff-e578-b7ed-9a6fae0c9e3d	4	0	PREVOZNI STROŠKI IN STORITVE	PREVOZNI STROŠKI IN STORITVE
003b0000-55ff-e578-c101-4b15459e15ba	4	1	Goriva in maziva za prevozna sredstva	goriva in maziva za prevozna sredstva
003b0000-55ff-e578-b627-6efc9442f511	4	2	Najem vozil in selitveni stroški	najem vozil in selitveni stroški
003b0000-55ff-e578-991f-c2a70b7bddb9	4	3	Drugi prevozni in transportni stroški 	drugi prevozni in transportni stroški (navedite)
003b0000-55ff-e578-4f19-5ba2d93b10a0	5	0	IZDATKI ZA SLUŽBENA POTOVANJA	IZDATKI ZA SLUŽBENA POTOVANJA
003b0000-55ff-e578-3990-bd94a1f20772	5	1	Dnevnice za službena potovanja v državi in tujini	dnevnice za službena potovanja v državi in tujini
003b0000-55ff-e578-034c-3c53e2f59c57	5	2	Hotelske in restavra. storitve v državi in tujini	hotelske in restavra. storitve v državi in tujini
003b0000-55ff-e578-b417-72417f4dd0f0	5	3	Stroški prevoza v državi in tujini	stroški prevoza v državi in tujini
003b0000-55ff-e578-7fee-a3b981b4059b	5	4	Drugi izdatki za službena potovanja	drugi izdatki za službena potovanja (navedite)
003b0000-55ff-e578-63a4-cfad195e11cd	6	0	NAJEMNINE IN ZAKUPNINE	NAJEMNINE IN ZAKUPNINE
003b0000-55ff-e578-f94f-c8bf4e2ca5d0	6	1	Druge najemnine, zakupnine in licenčnine	druge najemnine, zakupnine in licenčnine (npr. najem notnega materiala, instrumentov - navedite)
003b0000-55ff-e578-68f2-26a2301de617	7	0	DRUGI OPERATIVNI ODHODKI	DRUGI OPERATIVNI ODHODKI
003b0000-55ff-e578-abbe-1253da601f12	7	1	Izdatki za strok. izobraževanje zap.	izdatki za strok. izobraževanje zap.(vezani na program. enote)  
\.


--
-- TOC entry 3029 (class 0 OID 20252372)
-- Dependencies: 239
-- Data for Name: vrstazapisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstazapisa (id, oznaka, naziv, aktiven, znacka, ikona, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3028 (class 0 OID 20252344)
-- Dependencies: 238
-- Data for Name: zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapis (id, vrsta_id, datoteka_id, mapa_id, avtor_id, zaklenil_id, tip, zaklenjen, datumzaklepanja, identifier, subject, title, description, coverage, creator, language, date, publisher, relation, rights, source, upor, datknj, standard, lokacija) FROM stdin;
\.


--
-- TOC entry 3030 (class 0 OID 20252384)
-- Dependencies: 240
-- Data for Name: zapislastnik; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapislastnik (id, zapis_id, lastnik, classlastnika, datum, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3007 (class 0 OID 20252015)
-- Dependencies: 217
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, sifra, status, delovnomesto, zacetek, konec, tip, delovnaobveza, malica, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci) FROM stdin;
00100000-55ff-e579-e948-bfc623fa7992	00090000-55ff-e579-e706-e3602a17db9b	01	A	Mojster	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55ff-e579-1fe0-94054f76c664	00090000-55ff-e579-5567-bc7b2d841877	02	A	Igralec	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55ff-e579-783f-6a72a365aacc	00090000-55ff-e579-fa83-8395be01ef3c	03	A	Natakar	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55ff-e579-8226-3d5791641e46	00090000-55ff-e579-d2b0-f25aa7c4df12	04	A	Mizar	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55ff-e579-befa-be03dba42809	00090000-55ff-e579-db67-82735a01c069	05	A	Šivilja	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55ff-e579-7f32-cec97470dd1f	00090000-55ff-e579-62cb-346bd0aa1101	06	A	Inšpicient	2010-02-01	2010-02-01	1	2		t	f	f	t
\.


--
-- TOC entry 2988 (class 0 OID 20251851)
-- Dependencies: 198
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id, oseba_id) FROM stdin;
\.


--
-- TOC entry 3016 (class 0 OID 20252120)
-- Dependencies: 226
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, sifra, naziv, opis) FROM stdin;
00140000-55ff-e578-e748-ec03cae7d518	01	Drama	drama (SURS 01)
00140000-55ff-e578-ef4f-ca5b146e0053	02	Opera	opera (SURS 02)
00140000-55ff-e578-8068-7b5bb973a5a9	03	Balet	balet (SURS 03)
00140000-55ff-e578-c507-be60496e9917	04	Plesne prireditve	plesne prireditve (SURS 04)
00140000-55ff-e578-918b-8088ac973794	05	Lutkovno gledališče	lutkovno gledališče (SURS 05)
00140000-55ff-e578-944b-9d91bf965632	06	Raziskovalno gledališče	raziskovalno gledališče (SURS 06)
00140000-55ff-e578-700b-6f8c50504f63	07	Drugo	drugo (SURS 07)
\.


--
-- TOC entry 3006 (class 0 OID 20252005)
-- Dependencies: 216
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, sifra, naziv, opis) FROM stdin;
\.


--
-- TOC entry 2493 (class 2606 OID 20251626)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2685 (class 2606 OID 20252179)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2681 (class 2606 OID 20252169)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2644 (class 2606 OID 20252039)
-- Name: avtorbesedila_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT avtorbesedila_pkey PRIMARY KEY (id);


--
-- TOC entry 2655 (class 2606 OID 20252079)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2742 (class 2606 OID 20252424)
-- Name: datoteka_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT datoteka_pkey PRIMARY KEY (id);


--
-- TOC entry 2556 (class 2606 OID 20251840)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2571 (class 2606 OID 20251861)
-- Name: dogodeksplosni_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodeksplosni
    ADD CONSTRAINT dogodeksplosni_pkey PRIMARY KEY (id);


--
-- TOC entry 2718 (class 2606 OID 20252342)
-- Name: drugivir_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT drugivir_pkey PRIMARY KEY (id);


--
-- TOC entry 2527 (class 2606 OID 20251751)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2692 (class 2606 OID 20252234)
-- Name: enotaprograma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT enotaprograma_pkey PRIMARY KEY (id);


--
-- TOC entry 2629 (class 2606 OID 20252001)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2550 (class 2606 OID 20251813)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2544 (class 2606 OID 20251789)
-- Name: job_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY job
    ADD CONSTRAINT job_pkey PRIMARY KEY (id);


--
-- TOC entry 2535 (class 2606 OID 20251765)
-- Name: kontaktnaoseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT kontaktnaoseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2593 (class 2606 OID 20251908)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2736 (class 2606 OID 20252401)
-- Name: mapa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT mapa_pkey PRIMARY KEY (id);


--
-- TOC entry 2740 (class 2606 OID 20252408)
-- Name: mapa_zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT mapa_zapis_pkey PRIMARY KEY (mapa_id, zapis_id);


--
-- TOC entry 2747 (class 2606 OID 20252432)
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
-- TOC entry 2605 (class 2606 OID 20251935)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2520 (class 2606 OID 20251723)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2497 (class 2606 OID 20251635)
-- Name: optionvalue_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT optionvalue_pkey PRIMARY KEY (id);


--
-- TOC entry 2500 (class 2606 OID 20251659)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2491 (class 2606 OID 20251615)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2484 (class 2606 OID 20251600)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2608 (class 2606 OID 20251941)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2622 (class 2606 OID 20251977)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2667 (class 2606 OID 20252115)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2509 (class 2606 OID 20251687)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2517 (class 2606 OID 20251711)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2702 (class 2606 OID 20252295)
-- Name: postavkacdve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkacdve
    ADD CONSTRAINT postavkacdve_pkey PRIMARY KEY (id);


--
-- TOC entry 2597 (class 2606 OID 20251914)
-- Name: postavkaracuna_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT postavkaracuna_pkey PRIMARY KEY (id);


--
-- TOC entry 2515 (class 2606 OID 20251701)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2548 (class 2606 OID 20251801)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2603 (class 2606 OID 20251926)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2706 (class 2606 OID 20252304)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2708 (class 2606 OID 20252312)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2699 (class 2606 OID 20252282)
-- Name: programdela_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT programdela_pkey PRIMARY KEY (id);


--
-- TOC entry 2713 (class 2606 OID 20252323)
-- Name: programskaenotasklopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT programskaenotasklopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2615 (class 2606 OID 20251959)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2591 (class 2606 OID 20251899)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2585 (class 2606 OID 20251890)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2662 (class 2606 OID 20252103)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2642 (class 2606 OID 20252032)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2538 (class 2606 OID 20251777)
-- Name: report_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY report
    ADD CONSTRAINT report_pkey PRIMARY KEY (id);


--
-- TOC entry 2476 (class 2606 OID 20251571)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2620 (class 2606 OID 20251968)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2482 (class 2606 OID 20251589)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2486 (class 2606 OID 20251609)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2627 (class 2606 OID 20251986)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2599 (class 2606 OID 20251921)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2573 (class 2606 OID 20251870)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2473 (class 2606 OID 20251559)
-- Name: stevilcenje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenje
    ADD CONSTRAINT stevilcenje_pkey PRIMARY KEY (id);


--
-- TOC entry 2470 (class 2606 OID 20251547)
-- Name: stevilcenjekonfig_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT stevilcenjekonfig_pkey PRIMARY KEY (id);


--
-- TOC entry 2467 (class 2606 OID 20251541)
-- Name: stevilcenjestanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjestanje
    ADD CONSTRAINT stevilcenjestanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2651 (class 2606 OID 20252052)
-- Name: strosekuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT strosekuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2506 (class 2606 OID 20251668)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2579 (class 2606 OID 20251881)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2658 (class 2606 OID 20252090)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2715 (class 2606 OID 20252335)
-- Name: tipprogramskeenote_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipprogramskeenote
    ADD CONSTRAINT tipprogramskeenote_pkey PRIMARY KEY (id);


--
-- TOC entry 2525 (class 2606 OID 20251736)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2478 (class 2606 OID 20251584)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2679 (class 2606 OID 20252148)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2554 (class 2606 OID 20251823)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2611 (class 2606 OID 20251949)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2653 (class 2606 OID 20252064)
-- Name: vrstastroska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstastroska
    ADD CONSTRAINT vrstastroska_pkey PRIMARY KEY (id);


--
-- TOC entry 2729 (class 2606 OID 20252382)
-- Name: vrstazapisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstazapisa
    ADD CONSTRAINT vrstazapisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2726 (class 2606 OID 20252366)
-- Name: zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT zapis_pkey PRIMARY KEY (id);


--
-- TOC entry 2732 (class 2606 OID 20252390)
-- Name: zapislastnik_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT zapislastnik_pkey PRIMARY KEY (id);


--
-- TOC entry 2638 (class 2606 OID 20252023)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2569 (class 2606 OID 20251855)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2671 (class 2606 OID 20252128)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2635 (class 2606 OID 20252013)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2557 (class 1259 OID 20251849)
-- Name: dogodki_konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_konec ON dogodek USING btree (konec);


--
-- TOC entry 2558 (class 1259 OID 20251850)
-- Name: dogodki_razred; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_razred ON dogodek USING btree (razred);


--
-- TOC entry 2559 (class 1259 OID 20251848)
-- Name: dogodki_zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2560 (class 1259 OID 20251847)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2561 (class 1259 OID 20251846)
-- Name: idx_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2647 (class 1259 OID 20252053)
-- Name: idx_11ffe6e05c75296c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e05c75296c ON strosekuprizoritve USING btree (vrstastroska_id);


--
-- TOC entry 2648 (class 1259 OID 20252054)
-- Name: idx_11ffe6e062b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e062b4ffca ON strosekuprizoritve USING btree (uprizoritev_id);


--
-- TOC entry 2649 (class 1259 OID 20252055)
-- Name: idx_11ffe6e06beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e06beede51 ON strosekuprizoritve USING btree (popa_id);


--
-- TOC entry 2733 (class 1259 OID 20252403)
-- Name: idx_14a5d6d3727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d3727aca70 ON mapa USING btree (parent_id);


--
-- TOC entry 2734 (class 1259 OID 20252402)
-- Name: idx_14a5d6d38a4a6c12; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d38a4a6c12 ON mapa USING btree (lastnik_id);


--
-- TOC entry 2507 (class 1259 OID 20251689)
-- Name: idx_1c7adba5ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba5ee4b985a ON popa USING btree (drzava_id);


--
-- TOC entry 2606 (class 1259 OID 20251942)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2720 (class 1259 OID 20252370)
-- Name: idx_1ed92829253c4123; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829253c4123 ON zapis USING btree (avtor_id);


--
-- TOC entry 2721 (class 1259 OID 20252369)
-- Name: idx_1ed9282957ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282957ed422f ON zapis USING btree (mapa_id);


--
-- TOC entry 2722 (class 1259 OID 20252371)
-- Name: idx_1ed9282987ff3295; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282987ff3295 ON zapis USING btree (zaklenil_id);


--
-- TOC entry 2723 (class 1259 OID 20252368)
-- Name: idx_1ed92829a54dbb1f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829a54dbb1f ON zapis USING btree (datoteka_id);


--
-- TOC entry 2724 (class 1259 OID 20252367)
-- Name: idx_1ed92829ef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829ef943358 ON zapis USING btree (vrsta_id);


--
-- TOC entry 2600 (class 1259 OID 20251928)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2601 (class 1259 OID 20251927)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2552 (class 1259 OID 20251824)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2630 (class 1259 OID 20252002)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2631 (class 1259 OID 20252004)
-- Name: idx_23aeb9586b361365; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9586b361365 ON funkcija USING btree (tipfunkcije_id);


--
-- TOC entry 2632 (class 1259 OID 20252003)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2532 (class 1259 OID 20251767)
-- Name: idx_2942b10710389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b10710389148 ON kontaktnaoseba USING btree (oseba_id);


--
-- TOC entry 2533 (class 1259 OID 20251766)
-- Name: idx_2942b1076beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b1076beede51 ON kontaktnaoseba USING btree (popa_id);


--
-- TOC entry 2711 (class 1259 OID 20252324)
-- Name: idx_2d901816d6bc69d6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2d901816d6bc69d6 ON programskaenotasklopa USING btree (programrazno_id);


--
-- TOC entry 2663 (class 1259 OID 20252117)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2664 (class 1259 OID 20252118)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2665 (class 1259 OID 20252119)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2730 (class 1259 OID 20252391)
-- Name: idx_2eaff9dcaf91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2eaff9dcaf91ecd ON zapislastnik USING btree (zapis_id);


--
-- TOC entry 2672 (class 1259 OID 20252153)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2673 (class 1259 OID 20252150)
-- Name: idx_344a77a7c3b0d59; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a7c3b0d59 ON uprizoritev USING btree (maticnioder_id);


--
-- TOC entry 2674 (class 1259 OID 20252154)
-- Name: idx_344a77a853a965c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a853a965c ON uprizoritev USING btree (producent_id);


--
-- TOC entry 2675 (class 1259 OID 20252152)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2676 (class 1259 OID 20252151)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2522 (class 1259 OID 20251738)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2523 (class 1259 OID 20251737)
-- Name: idx_37f6541a6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a6beede51 ON trr USING btree (popa_id);


--
-- TOC entry 2498 (class 1259 OID 20251662)
-- Name: idx_466966d769e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_466966d769e8d4 ON oseba USING btree (naslov_id);


--
-- TOC entry 2618 (class 1259 OID 20251969)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2488 (class 1259 OID 20251616)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2489 (class 1259 OID 20251617)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2623 (class 1259 OID 20251989)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2624 (class 1259 OID 20251988)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2625 (class 1259 OID 20251987)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2545 (class 1259 OID 20251802)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2546 (class 1259 OID 20251803)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2468 (class 1259 OID 20251549)
-- Name: idx_6054e804ff55f926; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_6054e804ff55f926 ON stevilcenjekonfig USING btree (stevilcenje_id);


--
-- TOC entry 2580 (class 1259 OID 20251894)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2581 (class 1259 OID 20251892)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2582 (class 1259 OID 20251891)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2583 (class 1259 OID 20251893)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2479 (class 1259 OID 20251590)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2480 (class 1259 OID 20251591)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2609 (class 1259 OID 20251950)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2743 (class 1259 OID 20252425)
-- Name: idx_781826c67e3c61f9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_781826c67e3c61f9 ON datoteka USING btree (owner_id);


--
-- TOC entry 2645 (class 1259 OID 20252041)
-- Name: idx_7ab77b7910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7ab77b7910389148 ON avtorbesedila USING btree (oseba_id);


--
-- TOC entry 2646 (class 1259 OID 20252040)
-- Name: idx_7ab77b79f35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7ab77b79f35157b1 ON avtorbesedila USING btree (besedilo_id);


--
-- TOC entry 2744 (class 1259 OID 20252433)
-- Name: idx_7adc957157ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc957157ed422f ON mapaacl USING btree (mapa_id);


--
-- TOC entry 2745 (class 1259 OID 20252434)
-- Name: idx_7adc9571fa6311ef; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc9571fa6311ef ON mapaacl USING btree (perm_id);


--
-- TOC entry 2595 (class 1259 OID 20251915)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2639 (class 1259 OID 20252033)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2640 (class 1259 OID 20252034)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2693 (class 1259 OID 20252239)
-- Name: idx_8787a0e54ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e54ae1cd1c ON enotaprograma USING btree (gostitelj_id);


--
-- TOC entry 2694 (class 1259 OID 20252238)
-- Name: idx_8787a0e55d0da56c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e55d0da56c ON enotaprograma USING btree (drzavagostovanja_id);


--
-- TOC entry 2695 (class 1259 OID 20252235)
-- Name: idx_8787a0e562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e562b4ffca ON enotaprograma USING btree (uprizoritev_id);


--
-- TOC entry 2696 (class 1259 OID 20252236)
-- Name: idx_8787a0e57222d84b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e57222d84b ON enotaprograma USING btree (tipprogramskeenote_id);


--
-- TOC entry 2697 (class 1259 OID 20252237)
-- Name: idx_8787a0e5771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e5771ec7bd ON enotaprograma USING btree (program_dela_id);


--
-- TOC entry 2511 (class 1259 OID 20251703)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2512 (class 1259 OID 20251702)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2513 (class 1259 OID 20251704)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2612 (class 1259 OID 20251963)
-- Name: idx_952dd21969e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd21969e8d4 ON prostor USING btree (naslov_id);


--
-- TOC entry 2613 (class 1259 OID 20251962)
-- Name: idx_952dd2196beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd2196beede51 ON prostor USING btree (popa_id);


--
-- TOC entry 2703 (class 1259 OID 20252305)
-- Name: idx_97af082e38c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e38c06eb ON produkcijadelitev USING btree (enotaprograma_id);


--
-- TOC entry 2704 (class 1259 OID 20252306)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2686 (class 1259 OID 20252183)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2687 (class 1259 OID 20252184)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2688 (class 1259 OID 20252181)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2689 (class 1259 OID 20252182)
-- Name: idx_a4b7244fa4976613; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fa4976613 ON alternacija USING btree (zaposlitev_id);


--
-- TOC entry 2636 (class 1259 OID 20252024)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2586 (class 1259 OID 20251903)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2587 (class 1259 OID 20251902)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2588 (class 1259 OID 20251900)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2589 (class 1259 OID 20251901)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2682 (class 1259 OID 20252171)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2683 (class 1259 OID 20252170)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2536 (class 1259 OID 20251778)
-- Name: idx_c38372b2be04ea9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c38372b2be04ea9 ON report USING btree (job_id);


--
-- TOC entry 2539 (class 1259 OID 20251792)
-- Name: idx_c395a6181bb9e62c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a6181bb9e62c ON job USING btree (datum);


--
-- TOC entry 2540 (class 1259 OID 20251791)
-- Name: idx_c395a618941027cc; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618941027cc ON job USING btree (casizvedbe);


--
-- TOC entry 2541 (class 1259 OID 20251790)
-- Name: idx_c395a618a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618a76ed395 ON job USING btree (user_id);


--
-- TOC entry 2542 (class 1259 OID 20251793)
-- Name: idx_c395a618aecf5af0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618aecf5af0 ON job USING btree (izveden);


--
-- TOC entry 2551 (class 1259 OID 20251814)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2700 (class 1259 OID 20252296)
-- Name: idx_dba42fe79e3adf2c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_dba42fe79e3adf2c ON postavkacdve USING btree (programdela_id);


--
-- TOC entry 2719 (class 1259 OID 20252343)
-- Name: idx_e7d4cf2638c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e7d4cf2638c06eb ON drugivir USING btree (enotaprograma_id);


--
-- TOC entry 2737 (class 1259 OID 20252409)
-- Name: idx_e9f8ee8257ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee8257ed422f ON mapa_zapis USING btree (mapa_id);


--
-- TOC entry 2738 (class 1259 OID 20252410)
-- Name: idx_e9f8ee82af91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee82af91ecd ON mapa_zapis USING btree (zapis_id);


--
-- TOC entry 2494 (class 1259 OID 20251637)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2495 (class 1259 OID 20251636)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2503 (class 1259 OID 20251669)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2504 (class 1259 OID 20251670)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2567 (class 1259 OID 20251856)
-- Name: idx_f44a386d10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_f44a386d10389148 ON zasedenost USING btree (oseba_id);


--
-- TOC entry 2575 (class 1259 OID 20251884)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2576 (class 1259 OID 20251883)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2577 (class 1259 OID 20251882)
-- Name: idx_fef7d84ba81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84ba81ccef6 ON terminstoritve USING btree (dogodek_id);


--
-- TOC entry 2562 (class 1259 OID 20251842)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2563 (class 1259 OID 20251843)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2564 (class 1259 OID 20251841)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2565 (class 1259 OID 20251845)
-- Name: uniq_11e93b5dbbc7a989; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dbbc7a989 ON dogodek USING btree (dogodek_splosni_id);


--
-- TOC entry 2566 (class 1259 OID 20251844)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2510 (class 1259 OID 20251688)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2528 (class 1259 OID 20251752)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2529 (class 1259 OID 20251754)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2530 (class 1259 OID 20251753)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2531 (class 1259 OID 20251755)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2594 (class 1259 OID 20251909)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2668 (class 1259 OID 20252116)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2677 (class 1259 OID 20252149)
-- Name: uniq_344a77a559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_344a77a559828a3 ON uprizoritev USING btree (sifra);


--
-- TOC entry 2659 (class 1259 OID 20252091)
-- Name: uniq_3f50510d559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d559828a3 ON tipfunkcije USING btree (sifra);


--
-- TOC entry 2660 (class 1259 OID 20252092)
-- Name: uniq_3f50510d55cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d55cca980 ON tipfunkcije USING btree (ime);


--
-- TOC entry 2501 (class 1259 OID 20251660)
-- Name: uniq_466966d7559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7559828a3 ON oseba USING btree (sifra);


--
-- TOC entry 2502 (class 1259 OID 20251661)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2633 (class 1259 OID 20252014)
-- Name: uniq_5216fcb0559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5216fcb0559828a3 ON zvrstuprizoritve USING btree (sifra);


--
-- TOC entry 2474 (class 1259 OID 20251560)
-- Name: uniq_5a434fbc559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5a434fbc559828a3 ON stevilcenje USING btree (sifra);


--
-- TOC entry 2521 (class 1259 OID 20251724)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2471 (class 1259 OID 20251548)
-- Name: uniq_6054e804889a7556; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_6054e804889a7556 ON stevilcenjekonfig USING btree (dok);


--
-- TOC entry 2716 (class 1259 OID 20252336)
-- Name: uniq_7d834df4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_7d834df4559828a3 ON tipprogramskeenote USING btree (sifra);


--
-- TOC entry 2616 (class 1259 OID 20251961)
-- Name: uniq_952dd21937854736; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21937854736 ON prostor USING btree (naziv);


--
-- TOC entry 2617 (class 1259 OID 20251960)
-- Name: uniq_952dd219559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd219559828a3 ON prostor USING btree (sifra);


--
-- TOC entry 2690 (class 1259 OID 20252180)
-- Name: uniq_a4b7244f559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a4b7244f559828a3 ON alternacija USING btree (sifra);


--
-- TOC entry 2518 (class 1259 OID 20251712)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2669 (class 1259 OID 20252129)
-- Name: uniq_cede8e36559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_cede8e36559828a3 ON zvrstsurs USING btree (sifra);


--
-- TOC entry 2727 (class 1259 OID 20252383)
-- Name: uniq_de1c8aa1d55226c7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_de1c8aa1d55226c7 ON vrstazapisa USING btree (oznaka);


--
-- TOC entry 2709 (class 1259 OID 20252313)
-- Name: uniq_e6fc2028559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc2028559828a3 ON produkcijskahisa USING btree (sifra);


--
-- TOC entry 2710 (class 1259 OID 20252314)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2656 (class 1259 OID 20252080)
-- Name: uniq_ec773670ca2e5fcb; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ec773670ca2e5fcb ON besedilo USING btree (stevilka);


--
-- TOC entry 2574 (class 1259 OID 20251871)
-- Name: uniq_ecc8f8c5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ecc8f8c5559828a3 ON sezona USING btree (sifra);


--
-- TOC entry 2487 (class 1259 OID 20251610)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2778 (class 2606 OID 20252565)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2777 (class 2606 OID 20252570)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2773 (class 2606 OID 20252590)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2779 (class 2606 OID 20252560)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2775 (class 2606 OID 20252580)
-- Name: fk_11e93b5dbbc7a989; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dbbc7a989 FOREIGN KEY (dogodek_splosni_id) REFERENCES dogodeksplosni(id);


--
-- TOC entry 2774 (class 2606 OID 20252585)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2776 (class 2606 OID 20252575)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2814 (class 2606 OID 20252755)
-- Name: fk_11ffe6e05c75296c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e05c75296c FOREIGN KEY (vrstastroska_id) REFERENCES vrstastroska(id);


--
-- TOC entry 2813 (class 2606 OID 20252760)
-- Name: fk_11ffe6e062b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e062b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2812 (class 2606 OID 20252765)
-- Name: fk_11ffe6e06beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e06beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2846 (class 2606 OID 20252930)
-- Name: fk_14a5d6d3727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d3727aca70 FOREIGN KEY (parent_id) REFERENCES mapa(id);


--
-- TOC entry 2847 (class 2606 OID 20252925)
-- Name: fk_14a5d6d38a4a6c12; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d38a4a6c12 FOREIGN KEY (lastnik_id) REFERENCES uporabniki(id);


--
-- TOC entry 2759 (class 2606 OID 20252490)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2796 (class 2606 OID 20252675)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2841 (class 2606 OID 20252910)
-- Name: fk_1ed92829253c4123; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829253c4123 FOREIGN KEY (avtor_id) REFERENCES uporabniki(id);


--
-- TOC entry 2842 (class 2606 OID 20252905)
-- Name: fk_1ed9282957ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282957ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2840 (class 2606 OID 20252915)
-- Name: fk_1ed9282987ff3295; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282987ff3295 FOREIGN KEY (zaklenil_id) REFERENCES uporabniki(id);


--
-- TOC entry 2843 (class 2606 OID 20252900)
-- Name: fk_1ed92829a54dbb1f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829a54dbb1f FOREIGN KEY (datoteka_id) REFERENCES datoteka(id);


--
-- TOC entry 2844 (class 2606 OID 20252895)
-- Name: fk_1ed92829ef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829ef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstazapisa(id);


--
-- TOC entry 2794 (class 2606 OID 20252670)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2795 (class 2606 OID 20252665)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2772 (class 2606 OID 20252555)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2806 (class 2606 OID 20252715)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2804 (class 2606 OID 20252725)
-- Name: fk_23aeb9586b361365; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9586b361365 FOREIGN KEY (tipfunkcije_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2805 (class 2606 OID 20252720)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2765 (class 2606 OID 20252525)
-- Name: fk_2942b10710389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b10710389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2766 (class 2606 OID 20252520)
-- Name: fk_2942b1076beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b1076beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2792 (class 2606 OID 20252655)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2838 (class 2606 OID 20252885)
-- Name: fk_2d901816d6bc69d6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT fk_2d901816d6bc69d6 FOREIGN KEY (programrazno_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2817 (class 2606 OID 20252770)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2816 (class 2606 OID 20252775)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2815 (class 2606 OID 20252780)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 2845 (class 2606 OID 20252920)
-- Name: fk_2eaff9dcaf91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT fk_2eaff9dcaf91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id);


--
-- TOC entry 2819 (class 2606 OID 20252800)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2822 (class 2606 OID 20252785)
-- Name: fk_344a77a7c3b0d59; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a7c3b0d59 FOREIGN KEY (maticnioder_id) REFERENCES prostor(id);


--
-- TOC entry 2818 (class 2606 OID 20252805)
-- Name: fk_344a77a853a965c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a853a965c FOREIGN KEY (producent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2820 (class 2606 OID 20252795)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2821 (class 2606 OID 20252790)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2763 (class 2606 OID 20252515)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2764 (class 2606 OID 20252510)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2755 (class 2606 OID 20252475)
-- Name: fk_466966d769e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d769e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2756 (class 2606 OID 20252470)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2800 (class 2606 OID 20252695)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2752 (class 2606 OID 20252450)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2751 (class 2606 OID 20252455)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2801 (class 2606 OID 20252710)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2802 (class 2606 OID 20252705)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2803 (class 2606 OID 20252700)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2770 (class 2606 OID 20252540)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2769 (class 2606 OID 20252545)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2748 (class 2606 OID 20252435)
-- Name: fk_6054e804ff55f926; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT fk_6054e804ff55f926 FOREIGN KEY (stevilcenje_id) REFERENCES stevilcenje(id);


--
-- TOC entry 2784 (class 2606 OID 20252630)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2786 (class 2606 OID 20252620)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2787 (class 2606 OID 20252615)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2785 (class 2606 OID 20252625)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2750 (class 2606 OID 20252440)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2749 (class 2606 OID 20252445)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2797 (class 2606 OID 20252680)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2850 (class 2606 OID 20252945)
-- Name: fk_781826c67e3c61f9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT fk_781826c67e3c61f9 FOREIGN KEY (owner_id) REFERENCES uporabniki(id);


--
-- TOC entry 2810 (class 2606 OID 20252750)
-- Name: fk_7ab77b7910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT fk_7ab77b7910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2811 (class 2606 OID 20252745)
-- Name: fk_7ab77b79f35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT fk_7ab77b79f35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2852 (class 2606 OID 20252950)
-- Name: fk_7adc957157ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc957157ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2851 (class 2606 OID 20252955)
-- Name: fk_7adc9571fa6311ef; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc9571fa6311ef FOREIGN KEY (perm_id) REFERENCES permission(id);


--
-- TOC entry 2793 (class 2606 OID 20252660)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2809 (class 2606 OID 20252735)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2808 (class 2606 OID 20252740)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2829 (class 2606 OID 20252860)
-- Name: fk_8787a0e54ae1cd1c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e54ae1cd1c FOREIGN KEY (gostitelj_id) REFERENCES popa(id);


--
-- TOC entry 2830 (class 2606 OID 20252855)
-- Name: fk_8787a0e55d0da56c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e55d0da56c FOREIGN KEY (drzavagostovanja_id) REFERENCES drza(id);


--
-- TOC entry 2833 (class 2606 OID 20252840)
-- Name: fk_8787a0e562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2832 (class 2606 OID 20252845)
-- Name: fk_8787a0e57222d84b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e57222d84b FOREIGN KEY (tipprogramskeenote_id) REFERENCES tipprogramskeenote(id);


--
-- TOC entry 2831 (class 2606 OID 20252850)
-- Name: fk_8787a0e5771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e5771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2761 (class 2606 OID 20252500)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2762 (class 2606 OID 20252495)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2760 (class 2606 OID 20252505)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2798 (class 2606 OID 20252690)
-- Name: fk_952dd21969e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd21969e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2799 (class 2606 OID 20252685)
-- Name: fk_952dd2196beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd2196beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2836 (class 2606 OID 20252870)
-- Name: fk_97af082e38c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e38c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2835 (class 2606 OID 20252875)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2826 (class 2606 OID 20252830)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2825 (class 2606 OID 20252835)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2828 (class 2606 OID 20252820)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 2827 (class 2606 OID 20252825)
-- Name: fk_a4b7244fa4976613; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fa4976613 FOREIGN KEY (zaposlitev_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2807 (class 2606 OID 20252730)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2788 (class 2606 OID 20252650)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2789 (class 2606 OID 20252645)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2791 (class 2606 OID 20252635)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2790 (class 2606 OID 20252640)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2823 (class 2606 OID 20252815)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2824 (class 2606 OID 20252810)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2767 (class 2606 OID 20252530)
-- Name: fk_c38372b2be04ea9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY report
    ADD CONSTRAINT fk_c38372b2be04ea9 FOREIGN KEY (job_id) REFERENCES job(id);


--
-- TOC entry 2768 (class 2606 OID 20252535)
-- Name: fk_c395a618a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY job
    ADD CONSTRAINT fk_c395a618a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2771 (class 2606 OID 20252550)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2834 (class 2606 OID 20252865)
-- Name: fk_dba42fe79e3adf2c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkacdve
    ADD CONSTRAINT fk_dba42fe79e3adf2c FOREIGN KEY (programdela_id) REFERENCES programdela(id);


--
-- TOC entry 2837 (class 2606 OID 20252880)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2839 (class 2606 OID 20252890)
-- Name: fk_e7d4cf2638c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT fk_e7d4cf2638c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2849 (class 2606 OID 20252935)
-- Name: fk_e9f8ee8257ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee8257ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id) ON DELETE CASCADE;


--
-- TOC entry 2848 (class 2606 OID 20252940)
-- Name: fk_e9f8ee82af91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee82af91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id) ON DELETE CASCADE;


--
-- TOC entry 2753 (class 2606 OID 20252465)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2754 (class 2606 OID 20252460)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2758 (class 2606 OID 20252480)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2757 (class 2606 OID 20252485)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2780 (class 2606 OID 20252595)
-- Name: fk_f44a386d10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT fk_f44a386d10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2781 (class 2606 OID 20252610)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2782 (class 2606 OID 20252605)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2783 (class 2606 OID 20252600)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- Completed on 2015-09-21 13:09:48 CEST

--
-- PostgreSQL database dump complete
--

