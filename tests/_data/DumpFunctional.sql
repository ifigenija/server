--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.9
-- Dumped by pg_dump version 9.3.9
-- Started on 2015-10-09 09:51:08 CEST

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

SET search_path = public, pg_catalog;

SET default_with_oids = false;

--
-- TOC entry 181 (class 1259 OID 21582374)
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
-- TOC entry 229 (class 1259 OID 21582931)
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
-- TOC entry 228 (class 1259 OID 21582914)
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
-- TOC entry 219 (class 1259 OID 21582791)
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
-- TOC entry 222 (class 1259 OID 21582821)
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
-- TOC entry 243 (class 1259 OID 21583190)
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
-- TOC entry 197 (class 1259 OID 21582582)
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
-- TOC entry 199 (class 1259 OID 21582613)
-- Name: dogodeksplosni; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodeksplosni (
    id uuid NOT NULL
);


--
-- TOC entry 237 (class 1259 OID 21583116)
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
-- TOC entry 190 (class 1259 OID 21582495)
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
-- TOC entry 230 (class 1259 OID 21582944)
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
    sthonorarnihzun integer,
    sthonorarnihzunigr integer,
    sthonorarnihzunigrtujjz integer,
    sthonorarnihzunsamoz integer,
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
-- TOC entry 215 (class 1259 OID 21582746)
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
-- TOC entry 195 (class 1259 OID 21582561)
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
-- TOC entry 193 (class 1259 OID 21582535)
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
-- TOC entry 3065 (class 0 OID 0)
-- Dependencies: 193
-- Name: COLUMN job.data; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN job.data IS '(DC2Type:object)';


--
-- TOC entry 191 (class 1259 OID 21582512)
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
-- TOC entry 204 (class 1259 OID 21582660)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 241 (class 1259 OID 21583171)
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
-- TOC entry 242 (class 1259 OID 21583183)
-- Name: mapa_zapis; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE mapa_zapis (
    mapa_id uuid NOT NULL,
    zapis_id uuid NOT NULL
);


--
-- TOC entry 244 (class 1259 OID 21583205)
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
-- TOC entry 170 (class 1259 OID 21093458)
-- Name: migrations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE migrations (
    version character varying(255) NOT NULL
);


--
-- TOC entry 208 (class 1259 OID 21582685)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 188 (class 1259 OID 21582469)
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
-- TOC entry 182 (class 1259 OID 21582383)
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
-- TOC entry 183 (class 1259 OID 21582394)
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
-- TOC entry 178 (class 1259 OID 21582348)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 180 (class 1259 OID 21582367)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 209 (class 1259 OID 21582692)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 213 (class 1259 OID 21582726)
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
-- TOC entry 225 (class 1259 OID 21582862)
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
-- TOC entry 185 (class 1259 OID 21582427)
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
-- TOC entry 187 (class 1259 OID 21582461)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 232 (class 1259 OID 21583061)
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
-- TOC entry 205 (class 1259 OID 21582666)
-- Name: postavkaracuna; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE postavkaracuna (
    id uuid NOT NULL,
    racun_id uuid
);


--
-- TOC entry 186 (class 1259 OID 21582446)
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
-- TOC entry 194 (class 1259 OID 21582550)
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
-- TOC entry 207 (class 1259 OID 21582678)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 233 (class 1259 OID 21583075)
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
-- TOC entry 234 (class 1259 OID 21583085)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    sifra character varying(4) NOT NULL,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 231 (class 1259 OID 21583008)
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
    stpremiervelikih integer,
    stpremiermalih integer,
    stpremiermalihkopr integer,
    stpremiervelikihkopr integer,
    stpremiersredkopr integer,
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
    sthonorarnihzun integer,
    sthonorarnihzunigr integer,
    sthonorarnihzunigrtujjz integer,
    sthonorarnihzunsamoz integer,
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
-- TOC entry 235 (class 1259 OID 21583093)
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
-- TOC entry 211 (class 1259 OID 21582707)
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
-- TOC entry 203 (class 1259 OID 21582651)
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
-- TOC entry 202 (class 1259 OID 21582641)
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
-- TOC entry 224 (class 1259 OID 21582851)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying,
    status character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 218 (class 1259 OID 21582781)
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
-- TOC entry 192 (class 1259 OID 21582524)
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
-- TOC entry 175 (class 1259 OID 21582319)
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
-- TOC entry 174 (class 1259 OID 21582317)
-- Name: revizije_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE revizije_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3066 (class 0 OID 0)
-- Dependencies: 174
-- Name: revizije_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE revizije_id_seq OWNED BY revizije.id;


--
-- TOC entry 212 (class 1259 OID 21582720)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 179 (class 1259 OID 21582357)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 177 (class 1259 OID 21582341)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 214 (class 1259 OID 21582734)
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
-- TOC entry 206 (class 1259 OID 21582672)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 200 (class 1259 OID 21582618)
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
-- TOC entry 173 (class 1259 OID 21582306)
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
-- TOC entry 172 (class 1259 OID 21582298)
-- Name: stevilcenjekonfig; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjekonfig (
    id uuid NOT NULL,
    stevilcenje_id uuid,
    dok character varying(100) DEFAULT NULL::character varying
);


--
-- TOC entry 171 (class 1259 OID 21582293)
-- Name: stevilcenjestanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjestanje (
    id uuid NOT NULL,
    objid uuid NOT NULL,
    leto integer NOT NULL,
    stevilka integer
);


--
-- TOC entry 220 (class 1259 OID 21582798)
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
-- TOC entry 184 (class 1259 OID 21582419)
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
-- TOC entry 201 (class 1259 OID 21582628)
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
-- TOC entry 223 (class 1259 OID 21582839)
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
-- TOC entry 236 (class 1259 OID 21583104)
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
-- TOC entry 189 (class 1259 OID 21582481)
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
-- TOC entry 176 (class 1259 OID 21582328)
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
-- TOC entry 227 (class 1259 OID 21582889)
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
-- TOC entry 196 (class 1259 OID 21582572)
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
-- TOC entry 210 (class 1259 OID 21582699)
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
-- TOC entry 221 (class 1259 OID 21582812)
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
-- TOC entry 239 (class 1259 OID 21583151)
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
-- TOC entry 238 (class 1259 OID 21583123)
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
-- TOC entry 240 (class 1259 OID 21583163)
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
-- TOC entry 217 (class 1259 OID 21582771)
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
-- TOC entry 198 (class 1259 OID 21582607)
-- Name: zasedenost; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zasedenost (
    id uuid NOT NULL,
    oseba_id uuid
);


--
-- TOC entry 226 (class 1259 OID 21582879)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 216 (class 1259 OID 21582761)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 2201 (class 2604 OID 21582322)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 2994 (class 0 OID 21582374)
-- Dependencies: 181
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
\.


--
-- TOC entry 3042 (class 0 OID 21582931)
-- Dependencies: 229
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, zaposlitev_id, oseba_id, pogodba_id, sifra, zaposlen, zacetek, konec, opomba, sort, privzeti, aktivna, imapogodbo, pomembna) FROM stdin;
000c0000-5617-71e9-31c9-0286e5295817	000d0000-5617-71e9-3354-c5029f83160b	\N	00090000-5617-71e9-2c22-e2956525b27c	000b0000-5617-71e9-6041-bf7b9ab2fce1	0001	f	\N	\N	\N	3	t	\N	t	t
000c0000-5617-71e9-f3c4-04a030e6aec8	000d0000-5617-71e9-650b-cf96a753c8c3	00100000-5617-71e9-4e06-f211be9fa9aa	00090000-5617-71e9-e467-f4ad0fa61fd2	\N	0002	t	2016-01-01	\N	\N	8	t	\N	f	f
000c0000-5617-71e9-8a65-d088d8eadbf3	000d0000-5617-71e9-65b2-b8e8b18e05c9	00100000-5617-71e9-7b6a-f2eeccdfb1b3	00090000-5617-71e9-a782-5973fbc007ba	\N	0003	t	\N	2015-10-09	\N	2	t	\N	f	f
000c0000-5617-71e9-cc09-e602252aa1c8	000d0000-5617-71e9-aa40-5769bd714d31	\N	00090000-5617-71e9-58db-d9ff812c1162	\N	0004	f	2016-01-01	2016-01-01	\N	26	t	\N	f	f
000c0000-5617-71e9-a39a-02015e6556a4	000d0000-5617-71e9-f042-87d74444de30	\N	00090000-5617-71e9-b4d5-02e1530e628b	\N	0005	f	2016-01-01	2016-01-01	\N	7	t	\N	f	f
000c0000-5617-71e9-b106-d831e1be75b6	000d0000-5617-71e9-9d2b-12900b82e5da	\N	00090000-5617-71e9-71a9-7051f1fb1416	000b0000-5617-71e9-b002-5ec276cc021b	0006	f	2016-01-01	2016-01-01	\N	1	t	\N	t	t
000c0000-5617-71e9-4c9d-cfeecdb94fdd	000d0000-5617-71e9-7e5c-7606547e4663	00100000-5617-71e9-bc0d-fb59ab389acc	00090000-5617-71e9-d24b-9f44ff162f87	\N	0007	t	2016-01-01	2016-01-01	\N	14	t	\N	f	t
000c0000-5617-71e9-4578-3bbd1c2f9faa	000d0000-5617-71e9-694c-9464d0618e17	\N	00090000-5617-71e9-2b77-51ed03201244	000b0000-5617-71e9-e0cc-2a8912317a29	0008	f	2016-01-01	2016-01-01	\N	12	t	\N	t	t
000c0000-5617-71e9-77a8-62b890f1cbb3	000d0000-5617-71e9-7e5c-7606547e4663	00100000-5617-71e9-b37e-7cf692ab5909	00090000-5617-71e9-d3a0-ca8875e6dd1b	\N	0009	t	2017-01-01	2017-01-01	\N	15	t	\N	f	t
000c0000-5617-71e9-a8ef-def14e93e99d	000d0000-5617-71e9-7e5c-7606547e4663	00100000-5617-71e9-f92c-c4ae70c9d7c9	00090000-5617-71e9-ca31-64199d188bb1	\N	0010	t	\N	2015-10-09	\N	16	f	\N	f	t
000c0000-5617-71e9-d86d-5adfac46616d	000d0000-5617-71e9-7e5c-7606547e4663	00100000-5617-71e9-64d1-e436f7afbe17	00090000-5617-71e9-f652-8d864a0f9972	\N	0011	t	2017-01-01	\N	\N	17	f	\N	f	t
000c0000-5617-71e9-588a-0e6c5c05e89b	000d0000-5617-71e9-d320-e12e9b453c77	\N	00090000-5617-71e9-e467-f4ad0fa61fd2	000b0000-5617-71e9-e1b9-3bd37f7b0756	0012	f	\N	\N	\N	2	t	\N	t	t
\.


--
-- TOC entry 3041 (class 0 OID 21582914)
-- Dependencies: 228
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 3032 (class 0 OID 21582791)
-- Dependencies: 219
-- Data for Name: avtorbesedila; Type: TABLE DATA; Schema: public; Owner: -
--

COPY avtorbesedila (id, besedilo_id, oseba_id, tipavtorja, zaporedna, alivnaslovu) FROM stdin;
003d0000-5617-71e9-d000-4b66c5e79a4c	00160000-5617-71e9-ac6a-5e4495bd6560	00090000-5617-71e9-829d-46d12ff169d0	aizv	10	t
003d0000-5617-71e9-5ca2-dd65f367138d	00160000-5617-71e9-ac6a-5e4495bd6560	00090000-5617-71e9-7872-2b203b4bfed7	apri	14	t
003d0000-5617-71e9-6731-3a0f92caf6d5	00160000-5617-71e9-1dbd-0c371d893fbc	00090000-5617-71e9-f902-441532cc2b87	aizv	11	t
003d0000-5617-71e9-d309-ed83de268284	00160000-5617-71e9-0bc0-e573c936f0d4	00090000-5617-71e9-beb2-555e9bc0a4b0	aizv	12	t
003d0000-5617-71e9-9072-8d427de323ec	00160000-5617-71e9-ac6a-5e4495bd6560	00090000-5617-71e9-c992-891601bb532a	apri	18	f
\.


--
-- TOC entry 3035 (class 0 OID 21582821)
-- Dependencies: 222
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, stevilka, naslov, podnaslov, jezik, naslovizvirnika, podnaslovizvirnika, internacionalninaslov, datumprejema, moskevloge, zenskevloge, povzetekvsebine, letoizida, krajizida, zaloznik, avtor) FROM stdin;
00160000-5617-71e9-ac6a-5e4495bd6560	0001	Sen kresne noči		slovenščina	A Midsummer Night's Dream	\N	\N	2015-04-26	5	5	Nastopajo Titanija, Hipolita, Oberon, ...	\N	\N	\N	William  Shakespeare - Nebojša  Kavader
00160000-5617-71e9-1dbd-0c371d893fbc	0002	Bratje Karamazovi		slovenščina	Bratja Karamazjovji	\N	\N	2015-12-04	4	1	Svetovna uspešnica	\N	\N	\N	Fjodor Mihajlovič Dostojevski
00160000-5617-71e9-0bc0-e573c936f0d4	0003	Smoletov Vrt		slovenščina		\N	\N	2015-05-26	2	8		\N	\N	\N	Berta   Hočevar
\.


--
-- TOC entry 3056 (class 0 OID 21583190)
-- Dependencies: 243
-- Data for Name: datoteka; Type: TABLE DATA; Schema: public; Owner: -
--

COPY datoteka (id, owner_id, filename, transfers, size, format, hash, createdat, uploadedat, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3010 (class 0 OID 21582582)
-- Dependencies: 197
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_splosni_id, prostor_id, sezona_id, allday, zacetek, konec, status, razred, termin, title) FROM stdin;
00180000-5617-71e9-393a-9061bac260ff	\N	\N	00200000-5617-71e9-40b9-aa774e9c72bb	\N	\N	\N	\N	f	2015-06-26 10:00:00	2015-06-26 12:00:00	200s	200s		dogodek 1
00180000-5617-71e9-5c85-32b625513986	\N	\N	00200000-5617-71e9-b1a2-43b562dad0b4	\N	\N	\N	\N	f	2015-06-27 10:00:00	2015-06-27 12:00:00	300s	200s		dogodek 2
00180000-5617-71e9-65f1-d5103714f98b	\N	\N	00200000-5617-71e9-bf8b-f109a001087f	\N	\N	\N	\N	f	2015-08-01 20:00:00	2015-08-01 23:00:00	400s	200s		dogodek 3
00180000-5617-71e9-718b-f797a1ea2bc0	\N	\N	00200000-5617-71e9-8686-252a115a9715	\N	\N	\N	\N	f	2015-08-01 20:00:00	2015-08-01 23:00:00	100s	200s		dogodek 4
00180000-5617-71e9-f35f-6fb1cb3582f5	\N	\N	00200000-5617-71e9-3c9d-c92aafe7af0a	\N	\N	\N	\N	f	2015-08-01 20:00:00	2015-08-01 23:00:00	500s	200s		dogodek 5
\.


--
-- TOC entry 3012 (class 0 OID 21582613)
-- Dependencies: 199
-- Data for Name: dogodeksplosni; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodeksplosni (id) FROM stdin;
\.


--
-- TOC entry 3050 (class 0 OID 21583116)
-- Dependencies: 237
-- Data for Name: drugivir; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drugivir (id, znesek, opis, mednarodni, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 3003 (class 0 OID 21582495)
-- Dependencies: 190
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-5617-71e6-857d-b9ceae3826a2	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-5617-71e6-4a38-cad5fa34818f	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-5617-71e6-0ff3-595e8e8b8a16	AL	ALB	008	Albania 	Albanija	\N
00040000-5617-71e6-12fd-f826b82a4e14	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-5617-71e6-8e27-4ecaee7ad5ab	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-5617-71e6-6f92-83baf4f5efc1	AD	AND	020	Andorra 	Andora	\N
00040000-5617-71e6-4393-71a5eda9d068	AO	AGO	024	Angola 	Angola	\N
00040000-5617-71e6-4fc0-9cc024b7dbca	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-5617-71e6-d6d7-c2c6202adf51	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-5617-71e6-0028-4b0f02f20797	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-5617-71e6-5076-b048a9c65ee0	AR	ARG	032	Argentina 	Argenitna	\N
00040000-5617-71e6-716f-097794950538	AM	ARM	051	Armenia 	Armenija	\N
00040000-5617-71e6-05eb-fb3625c7273c	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-5617-71e6-559c-1123257c50f3	AU	AUS	036	Australia 	Avstralija	\N
00040000-5617-71e6-8d5e-c6d68377da8f	AT	AUT	040	Austria 	Avstrija	\N
00040000-5617-71e6-f71b-d9208e1d3553	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-5617-71e6-e963-be0898163ff7	BS	BHS	044	Bahamas 	Bahami	\N
00040000-5617-71e6-fcb3-392742e89195	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-5617-71e6-1dd9-7ca8c73622bd	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-5617-71e6-5caf-dc651c8fe122	BB	BRB	052	Barbados 	Barbados	\N
00040000-5617-71e6-ab17-37d0349ea0c3	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-5617-71e6-ec44-0d484b05b6fb	BE	BEL	056	Belgium 	Belgija	\N
00040000-5617-71e6-04d2-bed923a8e3a4	BZ	BLZ	084	Belize 	Belize	\N
00040000-5617-71e6-8b3d-0068ebbdec55	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-5617-71e6-777b-1ecc74480dfb	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-5617-71e6-3190-9cc4c8bb8e73	BT	BTN	064	Bhutan 	Butan	\N
00040000-5617-71e6-bdce-324fbe0bdc65	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-5617-71e6-69c1-b534a67b258a	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-5617-71e6-b887-f90581c23c6c	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-5617-71e6-6d66-90dde77e8968	BW	BWA	072	Botswana 	Bocvana	\N
00040000-5617-71e6-53cf-f686de8305c5	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-5617-71e6-d19d-3a434aafead2	BR	BRA	076	Brazil 	Brazilija	\N
00040000-5617-71e6-149c-29c2dc75a0e2	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-5617-71e6-a493-54c4285d0c6d	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-5617-71e6-d38f-93f276b6dcef	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-5617-71e6-e7da-830922944e9f	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-5617-71e6-5ffe-699b82037496	BI	BDI	108	Burundi 	Burundi 	\N
00040000-5617-71e6-2bfe-8910971c46fa	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-5617-71e6-7bc5-3f663a1103dd	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-5617-71e6-a25b-becc3b31b170	CA	CAN	124	Canada 	Kanada	\N
00040000-5617-71e6-371e-e4ba7661a7a7	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-5617-71e6-601e-e3de6a8cd92a	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-5617-71e6-afb7-e552cf40dcec	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-5617-71e6-54da-bc9fbce11b39	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-5617-71e6-e678-632c19fe42ae	CL	CHL	152	Chile 	Čile	\N
00040000-5617-71e6-5af1-8314d87d5398	CN	CHN	156	China 	Kitajska	\N
00040000-5617-71e6-8cb3-63fdb3956881	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-5617-71e6-cb98-49db7aa9dcb1	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-5617-71e6-6312-7ab5ffe37353	CO	COL	170	Colombia 	Kolumbija	\N
00040000-5617-71e6-3593-56d10439d23f	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-5617-71e6-c8fb-f49fce7f2042	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-5617-71e6-bf1b-5ad4db143f86	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-5617-71e6-a2be-ac5b18541df6	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-5617-71e6-bc12-cc6965c776ca	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-5617-71e6-3200-1ae0d72faa7a	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-5617-71e6-1461-6f12fcaee0a1	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-5617-71e6-06fb-e98427b8ebc6	CU	CUB	192	Cuba 	Kuba	\N
00040000-5617-71e6-25fb-688eb2adad1b	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-5617-71e6-105a-bb7fcdd2a2de	CY	CYP	196	Cyprus 	Ciper	\N
00040000-5617-71e6-515e-76e6d91d5d2b	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-5617-71e6-fb39-35c3e3db735b	DK	DNK	208	Denmark 	Danska	\N
00040000-5617-71e6-170b-069e52037eaa	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-5617-71e6-5e69-1b307cd9d4f9	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-5617-71e6-ad0f-fc9c88f01f86	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-5617-71e6-9f16-f24438115b53	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-5617-71e6-62f4-93b175a9240b	EG	EGY	818	Egypt 	Egipt	\N
00040000-5617-71e6-994f-07ac6d2be63a	SV	SLV	222	El Salvador 	Salvador	\N
00040000-5617-71e6-b425-5111acaf7003	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-5617-71e6-bd91-cbc8f609d1a3	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-5617-71e6-db57-9f5ac0519a54	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-5617-71e6-a9be-df87450f1dac	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-5617-71e6-001e-b36ad22a1b59	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-5617-71e6-bf62-69955de249a9	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-5617-71e6-c6a5-87717c231408	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-5617-71e6-e0a7-5f837a681301	FI	FIN	246	Finland 	Finska	\N
00040000-5617-71e6-3398-8582d1449708	FR	FRA	250	France 	Francija	\N
00040000-5617-71e6-c329-badeacf0888b	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-5617-71e7-c9be-74672c6804a1	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-5617-71e6-c517-8179d140e0f1	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-5617-71e6-78a5-6cb0f04ecda5	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-5617-71e6-4b81-b35006e75e9b	GA	GAB	266	Gabon 	Gabon	\N
00040000-5617-71e6-6800-39ca9c77f977	GM	GMB	270	Gambia 	Gambija	\N
00040000-5617-71e6-8ef5-19b33cf7142f	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-5617-71e6-50c7-3da81ed5752a	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-5617-71e6-4a99-878994cdf161	GH	GHA	288	Ghana 	Gana	\N
00040000-5617-71e6-d247-7ad261e16129	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-5617-71e6-4582-64f086580240	GR	GRC	300	Greece 	Grčija	\N
00040000-5617-71e6-ef6e-289faae0ab7f	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-5617-71e6-a003-e603c4e5447f	GD	GRD	308	Grenada 	Grenada	\N
00040000-5617-71e6-4055-508c57aacc5a	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-5617-71e6-194e-f9b82f913fea	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-5617-71e6-6417-9d913b916252	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-5617-71e6-dc06-1055df6b5a4b	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-5617-71e6-c6d8-e7e98312fcbb	GN	GIN	324	Guinea 	Gvineja	\N
00040000-5617-71e6-26eb-18655b2209f6	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-5617-71e6-f7df-5a81446924b8	GY	GUY	328	Guyana 	Gvajana	\N
00040000-5617-71e6-687c-b33038f144f4	HT	HTI	332	Haiti 	Haiti	\N
00040000-5617-71e6-830b-523be9a6d70f	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-5617-71e6-d119-e01f3509a6e1	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-5617-71e6-8a00-bbe2431ba9d4	HN	HND	340	Honduras 	Honduras	\N
00040000-5617-71e6-50d8-25a54d2d41f2	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-5617-71e6-27dd-fb36da9e6a22	HU	HUN	348	Hungary 	Madžarska	\N
00040000-5617-71e6-9766-ea13968e2eb3	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-5617-71e6-c787-e119b0b51dad	IN	IND	356	India 	Indija	\N
00040000-5617-71e6-4058-0b056ed944af	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-5617-71e6-65e6-861434d99524	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-5617-71e6-d55c-805d000aaea8	IQ	IRQ	368	Iraq 	Irak	\N
00040000-5617-71e6-bfe8-4353a3c33cd0	IE	IRL	372	Ireland 	Irska	\N
00040000-5617-71e6-7954-8b4c85b37ea6	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-5617-71e6-2243-a87d0072ffa8	IL	ISR	376	Israel 	Izrael	\N
00040000-5617-71e6-f836-764eea304b09	IT	ITA	380	Italy 	Italija	\N
00040000-5617-71e6-a3fc-4605598bb860	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-5617-71e6-7894-385cbe045dde	JP	JPN	392	Japan 	Japonska	\N
00040000-5617-71e6-74da-1269f15a7739	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-5617-71e6-ec16-2d9976bdff55	JO	JOR	400	Jordan 	Jordanija	\N
00040000-5617-71e6-89bb-da51a67a6168	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-5617-71e6-f212-8108734ce65a	KE	KEN	404	Kenya 	Kenija	\N
00040000-5617-71e6-4ac4-6b9c8becb337	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-5617-71e6-bb4d-4eb6350b917d	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-5617-71e6-244c-172065c202a3	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-5617-71e6-2388-064c1751fb36	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-5617-71e6-0ba0-a86258d8fb63	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-5617-71e6-8fc6-ba844c630f8b	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-5617-71e6-4d53-b0cd6be4c1d3	LV	LVA	428	Latvia 	Latvija	\N
00040000-5617-71e6-3e44-52a3e8c810f2	LB	LBN	422	Lebanon 	Libanon	\N
00040000-5617-71e6-e1b3-03f7aaa7d563	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-5617-71e6-1a63-22d319d08ef1	LR	LBR	430	Liberia 	Liberija	\N
00040000-5617-71e6-06d9-47efbc67586a	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-5617-71e6-f3c7-fd83e46d430a	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-5617-71e6-9baf-8d3509ca4735	LT	LTU	440	Lithuania 	Litva	\N
00040000-5617-71e6-96ac-be321d0a86f8	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-5617-71e6-29d0-5b7cc111b411	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-5617-71e6-291f-195e7c7acda3	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-5617-71e6-77ee-52369326ce27	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-5617-71e6-9374-b963ddd44d1e	MW	MWI	454	Malawi 	Malavi	\N
00040000-5617-71e6-c677-294f67f6aa45	MY	MYS	458	Malaysia 	Malezija	\N
00040000-5617-71e6-d54b-3b3c150914b2	MV	MDV	462	Maldives 	Maldivi	\N
00040000-5617-71e6-df93-1ec4a4834e1c	ML	MLI	466	Mali 	Mali	\N
00040000-5617-71e6-f9d8-2067a45598fe	MT	MLT	470	Malta 	Malta	\N
00040000-5617-71e6-4427-3b6d4fbf0982	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-5617-71e6-c6e7-09a8d5589ba6	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-5617-71e6-3d12-aca63e2bba5f	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-5617-71e6-76c7-933fff537592	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-5617-71e6-5f7c-f791403ffad2	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-5617-71e6-0385-1586c4b7ae59	MX	MEX	484	Mexico 	Mehika	\N
00040000-5617-71e6-9690-510fd2ac4a53	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-5617-71e6-e6af-943516191cfd	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-5617-71e6-6280-f716950c7f96	MC	MCO	492	Monaco 	Monako	\N
00040000-5617-71e6-2717-175f51747d0b	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-5617-71e6-5986-1e4ad3c0cc81	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-5617-71e6-f736-ad8d859edaaa	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-5617-71e6-fc47-80f118ea6d34	MA	MAR	504	Morocco 	Maroko	\N
00040000-5617-71e6-888d-0ebee7e3ffd6	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-5617-71e6-6e31-cf357dc8e07d	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-5617-71e6-8c12-c7b83a23cdd4	NA	NAM	516	Namibia 	Namibija	\N
00040000-5617-71e6-1c92-a9c16da40210	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-5617-71e7-87a1-8fa6a613f99b	NP	NPL	524	Nepal 	Nepal	\N
00040000-5617-71e7-003b-0b5e0577f04c	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-5617-71e7-0d59-2fa245546791	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-5617-71e7-6fff-47013384581c	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-5617-71e7-e441-38f3e117b043	NE	NER	562	Niger 	Niger 	\N
00040000-5617-71e7-0b85-235853d01e0f	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-5617-71e7-81bf-44899dac8c2a	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-5617-71e7-cb8f-8abcb090fc2d	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-5617-71e7-040f-df5b09c09ba8	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-5617-71e7-c3d0-7dc674ed4cb6	NO	NOR	578	Norway 	Norveška	\N
00040000-5617-71e7-0186-33d4dfddf54d	OM	OMN	512	Oman 	Oman	\N
00040000-5617-71e7-b299-aa2c18260a4d	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-5617-71e7-cf37-494ec9d574d3	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-5617-71e7-5ca4-9514685d4a03	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-5617-71e7-5ba2-0c889b40a936	PA	PAN	591	Panama 	Panama	\N
00040000-5617-71e7-ba2c-aaf43fa9a589	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-5617-71e7-b4b5-c9d2e2862ba8	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-5617-71e7-e1da-a2c5f5f7379d	PE	PER	604	Peru 	Peru	\N
00040000-5617-71e7-5bc2-50e34c936d92	PH	PHL	608	Philippines 	Filipini	\N
00040000-5617-71e7-e903-6cc10eefbeb1	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-5617-71e7-3734-0c854cabe8eb	PL	POL	616	Poland 	Poljska	\N
00040000-5617-71e7-c841-e90b27254c7c	PT	PRT	620	Portugal 	Portugalska	\N
00040000-5617-71e7-483b-ed005636c180	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-5617-71e7-ac97-2b3e2bfd957f	QA	QAT	634	Qatar 	Katar	\N
00040000-5617-71e7-447b-88e63468b383	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-5617-71e7-3c53-858428a398af	RO	ROU	642	Romania 	Romunija	\N
00040000-5617-71e7-e729-f7d3f79e8df4	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-5617-71e7-7a64-073067949de0	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-5617-71e7-e498-b7348d47809b	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-5617-71e7-8155-255ac0083e1c	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-5617-71e7-ee7c-f794658db762	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-5617-71e7-774e-faf29c7bc3c7	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-5617-71e7-d409-f9afc3d5433c	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-5617-71e7-d134-d1bb00e05e8e	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-5617-71e7-76e7-7a0ae4c9855b	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-5617-71e7-6615-3cd135f0491b	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-5617-71e7-b49d-3d431d2920ef	SM	SMR	674	San Marino 	San Marino	\N
00040000-5617-71e7-a305-aae4a41985e8	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-5617-71e7-3d61-790ce1bbb712	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-5617-71e7-4216-7a7f97b2f2f1	SN	SEN	686	Senegal 	Senegal	\N
00040000-5617-71e7-2a20-7168d9154021	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-5617-71e7-fb39-f0aa6cc35a85	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-5617-71e7-7b98-a5f73b072b65	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-5617-71e7-076e-140e6184c26d	SG	SGP	702	Singapore 	Singapur	\N
00040000-5617-71e7-08e0-6cb6d164df47	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-5617-71e7-d8f2-8eb3d270a0c4	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-5617-71e7-1e3b-f01ed14eaa7e	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-5617-71e7-9a07-b1cf3026f3e4	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-5617-71e7-2c38-379672e947b1	SO	SOM	706	Somalia 	Somalija	\N
00040000-5617-71e7-60b7-fee42d27a3af	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-5617-71e7-fff0-6c8d239d66c8	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-5617-71e7-e958-4237cfc2285d	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-5617-71e7-498a-50377b93acff	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-5617-71e7-461e-54b1c8056c24	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-5617-71e7-2cdf-68740a25ff64	SD	SDN	729	Sudan 	Sudan	\N
00040000-5617-71e7-233e-9f68820bed02	SR	SUR	740	Suriname 	Surinam	\N
00040000-5617-71e7-127d-6074e1391535	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-5617-71e7-548a-672f0c8bb98b	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-5617-71e7-c5b2-7d9e64964545	SE	SWE	752	Sweden 	Švedska	\N
00040000-5617-71e7-eacc-96caeb11d983	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-5617-71e7-efb1-9f84972e40fc	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-5617-71e7-bcd6-f26b3fa1eb5f	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-5617-71e7-82d8-7a16f602a869	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-5617-71e7-8926-3720118fd7de	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-5617-71e7-1572-65645bda29c3	TH	THA	764	Thailand 	Tajska	\N
00040000-5617-71e7-05b9-cd308cedb7ff	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-5617-71e7-7d76-36cd9e232169	TG	TGO	768	Togo 	Togo	\N
00040000-5617-71e7-f7c7-24641f84dc46	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-5617-71e7-5c77-6c40c4e22317	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-5617-71e7-b7b7-2bd04493ae94	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-5617-71e7-56d1-c19cca8fa5b0	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-5617-71e7-4bca-a2fa37fb11b1	TR	TUR	792	Turkey 	Turčija	\N
00040000-5617-71e7-5b35-649c762512d2	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-5617-71e7-a585-011dce6eb04d	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5617-71e7-55e2-3800e1d4905d	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-5617-71e7-09ab-2441d372b4f2	UG	UGA	800	Uganda 	Uganda	\N
00040000-5617-71e7-1801-0f89cf4e441d	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-5617-71e7-3647-ff7d0a255e0c	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-5617-71e7-b02b-e0e09d44cd93	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-5617-71e7-22b1-aa3e954f85fb	US	USA	840	United States 	Združene države Amerike	\N
00040000-5617-71e7-cb8e-d5e9551489c7	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-5617-71e7-4328-dac6eb67e158	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-5617-71e7-3cbf-0681ab106ead	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-5617-71e7-f7d7-12961ddbb8df	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-5617-71e7-5191-8a955253532a	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-5617-71e7-624a-3110096222a9	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-5617-71e7-a0c7-bc65af887506	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5617-71e7-6c96-de3d034e620a	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-5617-71e7-52c1-93d2c9e58051	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-5617-71e7-a124-2d27c703a925	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-5617-71e7-577d-e241d28a9d1c	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-5617-71e7-1744-e7574c1c30c0	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-5617-71e7-b326-6bf7d34707b3	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 3043 (class 0 OID 21582944)
-- Dependencies: 230
-- Data for Name: enotaprograma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY enotaprograma (id, uprizoritev_id, program_dela_id, gostitelj_id, celotnavrednost, nasdelez, celotnavrednostmat, celotnavrednostgostovsz, zaproseno, lastnasredstva, avtorskihonorarji, avtorskihonorarjisamoz, tantieme, avtorskepravice, materialni, imakoprodukcije, vlozekgostitelja, drugijavni, stzaposlenih, stzaposumet, stzaposdrug, sthonorarnihzun, sthonorarnihzunigr, sthonorarnihzunigrtujjz, sthonorarnihzunsamoz, obiskdoma, obiskkopr, obiskgost, obiskkoprgost, obiskzamejo, obiskkoprzamejo, obiskint, obiskkoprint, ponovidoma, ponovikopr, ponovizamejo, ponovikoprzamejo, ponovigost, ponovikoprgost, ponovikoprint, ponoviint, naziv, kpe, sort, tipprogramskeenote_id, tip, prikoproducentu, prizorisce, trajanje, zvrst, avtor, reziser, datum, soustvarjalci, strosekodkpred, stroskiostali, krajgostovanja, ustanova, datumgostovanja, transportnistroski, dnevprvzad, drzavagostovanja_id, stpe, stpredstav, stokroglihmiz, stpredstavitev, stdelavnic, stdrugidogodki, stprodukcij, caspriprave, casizvedbe, prizorisca, umetvodja, programskotelo, sttujihselektorjev) FROM stdin;
002f0000-5617-71e9-ba14-29f00fd20f4c	000e0000-5617-71e9-77e2-85dc9fb5b3f6	\N	\N	9000.30	9000.30	9000.30	0.00	3600.12	5299.98	4000.40	1000.40	200.20	200.30	4599.40	\N	0.00	100.20	0	2	2	2	2	2	0	40	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-5617-71e6-e609-bcef4461b491	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-5617-71e9-2ffe-af708499a370	000e0000-5617-71e9-d176-f0e29cac65f1	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	0	60	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-5617-71e6-b80f-b19a6af7b654	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-5617-71e9-2a13-9d0d82aeb7cd	000e0000-5617-71e9-3ef1-f799cbe527b2	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	0	60	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-5617-71e6-e609-bcef4461b491	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-5617-71e9-ec1d-067f97ebcc8b	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-54.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	54.20	5	0	0	3	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0	0	Urejanje portala	0.00	10	\N	razno	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-5617-71e9-6ccc-6e0c9c3edd9a	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-31.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	31.20	5	0	0	3	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0	0	Delavnice otroci	0.00	8	\N	razno	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 3028 (class 0 OID 21582746)
-- Dependencies: 215
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, podrocje, vodjaekipe, naziv, komentar, velikost, pomembna, sort, seplanira, dovoliprekrivanje, maxprekrivanj, tipfunkcije_id) FROM stdin;
000d0000-5617-71e9-3354-c5029f83160b	000e0000-5617-71e9-d176-f0e29cac65f1	000c0000-5617-71e9-31c9-0286e5295817	igralec	\N	Tezej	glavna vloga	velika	t	5	t	t	\N	000f0000-5617-71e6-9aa6-29823cbadb4a
000d0000-5617-71e9-650b-cf96a753c8c3	000e0000-5617-71e9-d176-f0e29cac65f1	000c0000-5617-71e9-f3c4-04a030e6aec8	umetnik	\N	Režija		velika	t	8	t	t	\N	000f0000-5617-71e6-55a3-8b1161dffd7a
000d0000-5617-71e9-65b2-b8e8b18e05c9	000e0000-5617-71e9-d176-f0e29cac65f1	000c0000-5617-71e9-8a65-d088d8eadbf3	inspicient	t	Inšpicient			t	8	t	t	\N	000f0000-5617-71e6-f024-74446f5499f0
000d0000-5617-71e9-aa40-5769bd714d31	000e0000-5617-71e9-d176-f0e29cac65f1	000c0000-5617-71e9-cc09-e602252aa1c8	tehnik	t	Tehnični vodja			t	8	t	t	\N	000f0000-5617-71e6-1be2-86d85bdbcb51
000d0000-5617-71e9-f042-87d74444de30	000e0000-5617-71e9-d176-f0e29cac65f1	000c0000-5617-71e9-a39a-02015e6556a4	tehnik	\N	Razsvetljava			t	3	t	t	\N	000f0000-5617-71e6-1be2-86d85bdbcb51
000d0000-5617-71e9-9d2b-12900b82e5da	000e0000-5617-71e9-d176-f0e29cac65f1	000c0000-5617-71e9-b106-d831e1be75b6	igralec	\N	Helena	glavna vloga	velika	t	5	t	t	\N	000f0000-5617-71e6-9aa6-29823cbadb4a
000d0000-5617-71e9-7e5c-7606547e4663	000e0000-5617-71e9-d176-f0e29cac65f1	000c0000-5617-71e9-77a8-62b890f1cbb3	igralec	\N	Hipolita	glavna vloga	velika	t	6	t	t	\N	000f0000-5617-71e6-9aa6-29823cbadb4a
000d0000-5617-71e9-694c-9464d0618e17	000e0000-5617-71e9-d176-f0e29cac65f1	000c0000-5617-71e9-4578-3bbd1c2f9faa	umetnik	\N	Lektoriranje			t	22	t	t	\N	000f0000-5617-71e6-d604-325d9b606b1d
000d0000-5617-71e9-d320-e12e9b453c77	000e0000-5617-71e9-d176-f0e29cac65f1	000c0000-5617-71e9-588a-0e6c5c05e89b	umetnik	\N	Avtor	Avtor besedila		t	2	t	f	\N	000f0000-5617-71e6-2708-9bd88b50f3b7
\.


--
-- TOC entry 3008 (class 0 OID 21582561)
-- Dependencies: 195
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta, zamejstvo, kraj) FROM stdin;
\.


--
-- TOC entry 3006 (class 0 OID 21582535)
-- Dependencies: 193
-- Data for Name: job; Type: TABLE DATA; Schema: public; Owner: -
--

COPY job (id, user_id, name, task, status, log, datum, casizvedbe, izveden, data, alert, hidden, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3004 (class 0 OID 21582512)
-- Dependencies: 191
-- Data for Name: kontaktnaoseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kontaktnaoseba (id, popa_id, oseba_id, status, funkcija, opis) FROM stdin;
00260000-5617-71e9-e6d8-9e341387e510	00080000-5617-71e9-2c5a-5c1fc1ee42fb	00090000-5617-71e9-ca31-64199d188bb1	AK		igralka
\.


--
-- TOC entry 3017 (class 0 OID 21582660)
-- Dependencies: 204
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 3054 (class 0 OID 21583171)
-- Dependencies: 241
-- Data for Name: mapa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa (id, lastnik_id, parent_id, ime, komentar, caskreiranja, casspremembe, javnidostop, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3055 (class 0 OID 21583183)
-- Dependencies: 242
-- Data for Name: mapa_zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa_zapis (mapa_id, zapis_id) FROM stdin;
\.


--
-- TOC entry 3057 (class 0 OID 21583205)
-- Dependencies: 244
-- Data for Name: mapaacl; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapaacl (id, mapa_id, perm_id, dostop, upor, datknj) FROM stdin;
\.


--
-- TOC entry 2983 (class 0 OID 21093458)
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
\.


--
-- TOC entry 3021 (class 0 OID 21582685)
-- Dependencies: 208
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 3001 (class 0 OID 21582469)
-- Dependencies: 188
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-5617-71e7-8fe5-67116d73ad6a	popa.stakli	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-5617-71e7-f7f6-bf41515ed561	oseba.spol	array	a:2:{s:1:"M";a:1:{s:5:"label";s:6:"Moški";}s:1:"Z";a:1:{s:5:"label";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-5617-71e7-bb5b-d0c071917c0f	telefonska.vrsta	array	a:3:{s:7:"mobilna";a:1:{s:5:"label";s:7:"Mobilni";}s:6:"domaca";a:1:{s:5:"label";s:6:"Domač";}s:6:"fiksna";a:1:{s:5:"label";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-5617-71e7-36a9-9d380bbe290a	kontaktnaoseba.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status kontaktne osebe
00000000-5617-71e7-42f0-7326647ac574	dogodek.status	array	a:8:{s:4:"100s";a:1:{s:5:"label";s:11:"Dolgoročno";}s:4:"200s";a:1:{s:5:"label";s:9:"Planirano";}s:4:"300s";a:1:{s:5:"label";s:8:"Fiksiran";}s:4:"400s";a:1:{s:5:"label";s:17:"Potrjen - interno";}s:4:"500s";a:1:{s:5:"label";s:15:"Potrjen - javno";}s:4:"600s";a:1:{s:5:"label";s:10:"Zaključen";}s:4:"610s";a:1:{s:5:"label";s:9:"Odpovedan";}s:4:"700s";a:1:{s:5:"label";s:7:"Obdelan";}}	f	t	t	\N	Tabela statusa dogodkov
00000000-5617-71e7-2bc7-d5a44c539705	dogodek.razred	array	a:5:{s:4:"100s";a:2:{s:5:"label";s:9:"Predstava";s:4:"type";s:9:"predstava";}s:4:"200s";a:2:{s:5:"label";s:4:"Vaja";s:4:"type";s:4:"vaja";}s:4:"300s";a:2:{s:5:"label";s:10:"Gostovanje";s:4:"type";s:10:"gostovanje";}s:4:"400s";a:2:{s:5:"label";s:16:"Splošni dogodek";s:4:"type";s:8:"splošni";}s:4:"500s";a:2:{s:5:"label";s:10:"Zasedenost";s:4:"type";s:10:"zasedenost";}}	f	t	t	\N	Tabela razredov dogodkov, ki jih aplikacija podpira
00000000-5617-71e7-eee2-446e1bcbfce9	uprizoritev.faza	array	a:6:{s:20:"predprodukcija-ideja";a:1:{s:5:"label";s:16:"Dolgoročni plan";}s:20:"predprodukcija-poziv";a:1:{s:5:"label";s:29:"Predprodukcija, v fazi poziva";}s:30:"predprodukcija-potrjen_program";a:1:{s:5:"label";s:34:"Predprodukcija, program je potrjen";}s:10:"produkcija";a:1:{s:5:"label";s:10:"Produkcija";}s:14:"postprodukcija";a:1:{s:5:"label";s:14:"Postprodukcija";}s:5:"arhiv";a:1:{s:5:"label";s:10:"Arhivirana";}}	f	t	f	\N	Faza uprizoritve
00000000-5617-71e7-bea5-67b21d275888	funkcija.podrocje	array	a:4:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}}	f	t	f	\N	Področje funkcije
00000000-5617-71e7-fc16-8eb8778dd215	tipfunkcije.podrocje	array	a:4:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}}	f	t	f	\N	Področje funkcije
00000000-5617-71e7-e241-d2158858df21	funkcija.velikost	array	a:4:{s:6:"velika";a:1:{s:5:"label";s:23:"Velika vloga / funkcija";}s:7:"srednja";a:1:{s:5:"label";s:24:"Srednja vloga / funkcija";}s:4:"mala";a:1:{s:5:"label";s:21:"Mala vloga / funkcija";}s:7:"stataza";a:1:{s:5:"label";s:8:"Stataža";}}	f	t	f	\N	Velikost funkcije
00000000-5617-71e7-fc59-c1442b30d67c	zaposlitev.status	array	a:2:{s:1:"A";a:1:{s:5:"label";s:7:"Aktivna";}s:1:"N";a:1:{s:5:"label";s:9:"Neaktivna";}}	f	t	f	\N	Status zaposlitve
00000000-5617-71e7-5620-fa9e2c982bef	produkcijskahisa.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktivna";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktivna";}}	f	t	f	\N	Status produkcijske hiše
00000000-5617-71e7-08f4-7d2968a3ce09	strosekuprizoritve.tipstroska	array	a:1:{s:10:"materialni";a:1:{s:5:"label";s:19:"Materialni strošek";}}	f	t	f	\N	Tip stroška
00000000-5617-71e7-4a22-10c66cf41c28	avtorbesedila.tipavtorja	array	a:4:{s:4:"aizv";a:1:{s:5:"label";s:15:"Avtor izvirnika";}s:4:"prev";a:1:{s:5:"label";s:10:"Prevajalec";}s:4:"apri";a:1:{s:5:"label";s:14:"Avtor priredbe";}s:4:"dram";a:1:{s:5:"label";s:12:"Dramatizator";}}	f	t	f	\N	Tip stroška
00000000-5617-71e7-eae0-6e3571daa854	fsacl.dostop	array	a:4:{s:1:"X";a:1:{s:5:"label";s:12:"Brez dostopa";}s:1:"R";a:1:{s:5:"label";s:11:"Samo branje";}s:2:"RW";a:1:{s:5:"label";s:17:"Branje in pisanje";}s:3:"RWD";a:1:{s:5:"label";s:26:"Branje pisanje in brisanje";}}	f	t	f	\N	ACL Javni dostop
00000000-5617-71e9-a9d4-66fd08ca10ae	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-5617-71e9-814b-7ec66941e29b	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-5617-71e9-1104-7b6df8bbc864	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-5617-71e9-037a-65c4e1acd2b3	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-5617-71e9-68bd-dc5ae9c08d12	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
00000000-5617-71eb-6bff-238f63a4d897	application.tenant.maticnopodjetje	string	s:36:"00080000-5617-71eb-bf72-60274bf41482";	f	t	f		Id matičnega podjetja v Popa
\.


--
-- TOC entry 2995 (class 0 OID 21582383)
-- Dependencies: 182
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-5617-71e9-e9be-29a16db4bafc	00000000-5617-71e9-a9d4-66fd08ca10ae	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-5617-71e9-a8ab-8335bad60d0c	00000000-5617-71e9-a9d4-66fd08ca10ae	00010000-5617-71e7-0f95-c4c16aac404e	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-5617-71e9-c75a-7d73aa5dd840	00000000-5617-71e9-814b-7ec66941e29b	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 2996 (class 0 OID 21582394)
-- Dependencies: 183
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naslov_id, sifra, naziv, ime, priimek, funkcija, srednjeime, polnoime, psevdonim, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
00090000-5617-71e9-2c22-e2956525b27c	\N	\N	0001	g.	Janez	Novak	a	Peter	Janez Peter Novak	Jani	jani.novak@xxx.xx	1958-01-06	0601958000000	123456789	M	Jani Janez	Slovenija	Slovenija	Ljubljana
00090000-5617-71e9-58db-d9ff812c1162	00010000-5617-71e9-d547-1a2c048e567f	\N	0002	dr.	Anton	Horvat	b		Anton  Horvat	Tona	anton.horvat@xxx.xx	1968-02-12	1202968111111	234567890	M		Slovenija	Slovenija	Maribor
00090000-5617-71e9-a782-5973fbc007ba	00010000-5617-71e9-fc47-6c38676f6970	\N	0003		Ivan	Kovačič	c		Ivan  Kovačič	Ivo	ivan.kovacic@xxx.xx	1975-03-26	2603976222222	345678901	M		Slovenija	Slovenija	Celje
00090000-5617-71e9-d3a0-ca8875e6dd1b	00010000-5617-71e9-2457-a47a473d19bb	\N	0004	prof.	Jožef	Krajnc	d		Jožef  Krajnc	Joža	jozef.krajnc@xxx.xx	1971-04-30	3004971333333	456789012	M		Slovenija	Slovenija	Kranj
00090000-5617-71e9-bc7c-0efa3807c9a2	\N	\N	0005		Marko	Zupančič	e		Marko  Zupančič		marko.zupancic@xxx.xx	1984-05-07	0705984444444	567890123	M		Slovenija	Slovenija	Koper
00090000-5617-71e9-71a9-7051f1fb1416	\N	\N	0006	ga.	Marija	Kovač	f		Marija  Kovač		marija.kovac@xxx.xx	1962-06-19	1906962444444	678901234	Z		Slovenija	Slovenija	Murska Sobota
00090000-5617-71e9-f652-8d864a0f9972	\N	\N	0007	ga.	Ana	Potočnik	g		Ana  Potočnik		ana.potocnik@xxx.xx	1975-07-24	2407975555555	789012345	Z		Slovenija	Slovenija	Novo Mesto
00090000-5617-71e9-d24b-9f44ff162f87	\N	\N	0008	ga.	Maja	Mlakar	h		Maja  Mlakar		maja.mlakar@xxx.xx	1986-08-02	0208986666666	890123456	Z		Slovenija	Slovenija	Nova Gorica
00090000-5617-71e9-ca31-64199d188bb1	00010000-5617-71e9-ea0c-bfd8538399c7	\N	0009		Irena	Kos	i		Irena  Kos		irena.kos@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Ptuj
00090000-5617-71e9-e467-f4ad0fa61fd2	\N	\N	0010		Mojca	Vidmar	J		Mojca  Vidmar		mojca.vidmar@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Idrija
00090000-5617-71e9-d3d6-5353e8c31221	\N	\N	0011		xx	write protected12345	a		xx  write protected12345		xx@xxx.xx	\N	\N	\N	Z		\N	\N	\N
00090000-5617-71e9-b4d5-02e1530e628b	\N	\N	0012		Luka	Golob	luč	a	Luka a Golob		luka.golob@xxx.xx	\N	\N	\N	M		\N	\N	\N
00090000-5617-71e9-2b77-51ed03201244	00010000-5617-71e9-546f-309d725577b0	\N	0013		Tatjana	Božič	tajnica	a	Tatjana a Božič		tatjana.bozic@xxx.xx	\N	\N	\N	Z		\N	\N	\N
00090000-5617-71e9-829d-46d12ff169d0	\N	\N	0014		William	Shakespeare	avtor		William  Shakespeare		\N	\N	\N	\N	M		\N	\N	\N
00090000-5617-71e9-7872-2b203b4bfed7	\N	\N	0015		Nebojša	Kavader	avtor		Nebojša  Kavader		\N	\N	\N	\N	M		\N	\N	\N
00090000-5617-71e9-f902-441532cc2b87	\N	\N	0016		Fjodor	Dostojevski	avtor	Mihajlovič	Fjodor Mihajlovič Dostojevski		\N	\N	\N	\N	M		\N	\N	\N
00090000-5617-71e9-beb2-555e9bc0a4b0	\N	\N	0017		Berta 	Hočevar	avtorica		Berta   Hočevar		\N	\N	\N	\N	Z		\N	\N	\N
00090000-5617-71e9-c992-891601bb532a	\N	\N	0018		Katarina	Podbevšek	lektorica		Katarina  Podbevšek		\N	\N	\N	\N	Z		\N	\N	\N
\.


--
-- TOC entry 2991 (class 0 OID 21582348)
-- Dependencies: 178
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-5617-71e7-f060-7314a045967a	Aaa-read	Aaa (User,Role,Permission) - branje	f
00030000-5617-71e7-d215-3fb6e0c8ade8	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	f
00030000-5617-71e7-3712-e2a4dc2c0285	TerminStoritve-vse	TerminStoritve - spreminjanje vseh zapisov	f
00030000-5617-71e7-2c1a-25eb054ac735	Dogodek-readVse	Dogodek - branje vseh, ne glede na status dogodka	f
00030000-5617-71e7-6382-61edae98d9fd	Oseba-vse	Oseba - vse - za testiranje assert	f
00030000-5617-71e7-20f0-d1d38fcbe8bb	ProgramDela-lock	ProgramDela - zaklepanje	f
00030000-5617-71e7-3931-d85df6d3dfca	ProgramDela-unlock	ProgramDela - odklepanje	f
00030000-5617-71e7-af6a-932647e47b25	Abonma-read	Abonma - branje	f
00030000-5617-71e7-026d-a7a2e0ffa570	Abonma-write	Abonma - spreminjanje	f
00030000-5617-71e7-0ec1-028b86558a88	Alternacija-read	Alternacija - branje	f
00030000-5617-71e7-4598-ade99513148e	Alternacija-write	Alternacija - spreminjanje	f
00030000-5617-71e7-361f-f3e276099b4f	Arhivalija-read	Arhivalija - branje	f
00030000-5617-71e7-42b3-e8fa6b37aa97	Arhivalija-write	Arhivalija - spreminjanje	f
00030000-5617-71e7-6ea9-903ce94ce559	AvtorBesedila-read	AvtorBesedila - branje	f
00030000-5617-71e7-8ea1-8f33ae321bba	AvtorBesedila-write	AvtorBesedila - spreminjanje	f
00030000-5617-71e7-edd6-8e2e42e8c3e9	Besedilo-read	Besedilo - branje	f
00030000-5617-71e7-3234-5a9f61d4debe	Besedilo-write	Besedilo - spreminjanje	f
00030000-5617-71e7-6853-86eb9026b9f1	DogodekIzven-read	DogodekIzven - branje	f
00030000-5617-71e7-9d16-5bb894b59e7b	DogodekIzven-write	DogodekIzven - spreminjanje	f
00030000-5617-71e7-448b-98c24861aeb7	Dogodek-read	Dogodek - branje	f
00030000-5617-71e7-d336-0138bde511bf	Dogodek-write	Dogodek - spreminjanje	f
00030000-5617-71e7-af54-67e86bb41e24	DrugiVir-read	DrugiVir - branje	f
00030000-5617-71e7-2c5c-aa3c461e78e3	DrugiVir-write	DrugiVir - spreminjanje	f
00030000-5617-71e7-4ca5-bafa35917fa1	Drzava-read	Drzava - branje	f
00030000-5617-71e7-f964-6b58e105f660	Drzava-write	Drzava - spreminjanje	f
00030000-5617-71e7-cb6a-e679473153ee	EnotaPrograma-read	EnotaPrograma - branje	f
00030000-5617-71e7-545e-edc431a5cfe1	EnotaPrograma-write	EnotaPrograma - spreminjanje	f
00030000-5617-71e7-c6a0-f802ef1c87bb	Funkcija-read	Funkcija - branje	f
00030000-5617-71e7-8938-f597612932be	Funkcija-write	Funkcija - spreminjanje	f
00030000-5617-71e7-3fa0-e7fb4b5939a2	Gostovanje-read	Gostovanje - branje	f
00030000-5617-71e7-a916-da795dfa728f	Gostovanje-write	Gostovanje - spreminjanje	f
00030000-5617-71e7-9c39-07aac7b99a99	Gostujoca-read	Gostujoca - branje	f
00030000-5617-71e7-b2fc-dc3e94646551	Gostujoca-write	Gostujoca - spreminjanje	f
00030000-5617-71e7-fa4f-04268ac55875	KontaktnaOseba-read	KontaktnaOseba - branje	f
00030000-5617-71e7-ef88-59e40182c8f8	KontaktnaOseba-write	KontaktnaOseba - spreminjanje	f
00030000-5617-71e7-d9be-5cfc87e40b5b	Kupec-read	Kupec - branje	f
00030000-5617-71e7-c13d-66c225982362	Kupec-write	Kupec - spreminjanje	f
00030000-5617-71e7-f2c7-20be664fb51d	NacinPlacina-read	NacinPlacina - branje	f
00030000-5617-71e7-f8df-9f169401e134	NacinPlacina-write	NacinPlacina - spreminjanje	f
00030000-5617-71e7-85fe-302fd81bc8fd	Option-read	Option - branje	f
00030000-5617-71e7-9fc6-db0aa089416c	Option-write	Option - spreminjanje	f
00030000-5617-71e7-3053-6b2a67d78650	OptionValue-read	OptionValue - branje	f
00030000-5617-71e7-fdd2-d0e614031651	OptionValue-write	OptionValue - spreminjanje	f
00030000-5617-71e7-a40c-eebd60285098	Oseba-read	Oseba - branje	f
00030000-5617-71e7-3c46-c2c9e396e181	Oseba-write	Oseba - spreminjanje	f
00030000-5617-71e7-5ee8-eef9cf1d09e0	PlacilniInstrument-read	PlacilniInstrument - branje	f
00030000-5617-71e7-7679-8fc324eefc66	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	f
00030000-5617-71e7-2340-9dfae7b2b65b	PodrocjeSedenja-read	PodrocjeSedenja - branje	f
00030000-5617-71e7-0b6b-1aa023552390	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	f
00030000-5617-71e7-e63e-99e21927f02a	Pogodba-read	Pogodba - branje	f
00030000-5617-71e7-dd25-3eb281276671	Pogodba-write	Pogodba - spreminjanje	f
00030000-5617-71e7-d3bb-0b8c44cd07bf	Popa-read	Popa - branje	f
00030000-5617-71e7-c06a-f7d17bf7081f	Popa-write	Popa - spreminjanje	f
00030000-5617-71e7-00e5-3afd4bf51583	Posta-read	Posta - branje	f
00030000-5617-71e7-41f3-d8ac9cfb69c1	Posta-write	Posta - spreminjanje	f
00030000-5617-71e7-d338-658a34e48700	PostavkaCDve-read	PostavkaCDve - branje	f
00030000-5617-71e7-3fb3-22c30cc89090	PostavkaCDve-write	PostavkaCDve - spreminjanje	f
00030000-5617-71e7-76df-385764142e3f	PostavkaRacuna-read	PostavkaRacuna - branje	f
00030000-5617-71e7-7383-bb5b4dcd2cfd	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	f
00030000-5617-71e7-893e-318235bc846b	PostniNaslov-read	PostniNaslov - branje	f
00030000-5617-71e7-06d2-5757ad81b56c	PostniNaslov-write	PostniNaslov - spreminjanje	f
00030000-5617-71e7-48a5-fbe3ae964e64	Predstava-read	Predstava - branje	f
00030000-5617-71e7-2fda-994f9fbd8503	Predstava-write	Predstava - spreminjanje	f
00030000-5617-71e7-1ca7-caf8752399ee	ProdajaPredstave-read	ProdajaPredstave - branje	f
00030000-5617-71e7-7f36-d1b082693006	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	f
00030000-5617-71e7-0cb8-8ce120e8038d	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	f
00030000-5617-71e7-1faf-84fd45689b3d	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	f
00030000-5617-71e7-351e-4dfe1896ebd3	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	f
00030000-5617-71e7-7582-2317d178707a	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	f
00030000-5617-71e7-997a-9b427b04720a	ProgramDela-read	ProgramDela - branje	f
00030000-5617-71e7-014f-07f82060dbc1	ProgramDela-write	ProgramDela - spreminjanje	f
00030000-5617-71e7-ddcc-52d81e7b5a9b	ProgramFestival-read	ProgramFestival - branje	f
00030000-5617-71e7-f2cb-929b7b511fab	ProgramFestival-write	ProgramFestival - spreminjanje	f
00030000-5617-71e7-3df4-99e53f609a1b	ProgramGostovanje-read	ProgramGostovanje - branje	f
00030000-5617-71e7-2d38-4f1705d756bf	ProgramGostovanje-write	ProgramGostovanje - spreminjanje	f
00030000-5617-71e7-3e2f-d5a2d48fbc99	ProgramGostujoca-read	ProgramGostujoca - branje	f
00030000-5617-71e7-ec02-6ab87af12e81	ProgramGostujoca-write	ProgramGostujoca - spreminjanje	f
00030000-5617-71e7-b82a-3467d025ce7d	ProgramIzjemni-read	ProgramIzjemni - branje	f
00030000-5617-71e7-6628-ec558ce70a97	ProgramIzjemni-write	ProgramIzjemni - spreminjanje	f
00030000-5617-71e7-541b-cb7a55e33726	ProgramPonovitevPrejsnjih-read	ProgramPonovitevPrejsnjih - branje	f
00030000-5617-71e7-5b96-918e9d933fb3	ProgramPonovitevPrejsnjih-write	ProgramPonovitevPrejsnjih - spreminjanje	f
00030000-5617-71e7-b0c8-60aa3f7e8e21	ProgramPonovitevPremiere-read	ProgramPonovitevPremiere - branje	f
00030000-5617-71e7-24db-06129f56ff07	ProgramPonovitevPremiere-write	ProgramPonovitevPremiere - spreminjanje	f
00030000-5617-71e7-a7d5-09c47f4fdf84	ProgramPremiera-read	ProgramPremiera - branje	f
00030000-5617-71e7-b38f-d46fa0c9ca01	ProgramPremiera-write	ProgramPremiera - spreminjanje	f
00030000-5617-71e7-91a7-5c58a3e6665c	ProgramRazno-read	ProgramRazno - branje	f
00030000-5617-71e7-f4c1-0488c0b2768b	ProgramRazno-write	ProgramRazno - spreminjanje	f
00030000-5617-71e7-f85a-96320d53dabe	ProgramskaEnotaSklopa-read	ProgramskaEnotaSklopa - branje	f
00030000-5617-71e7-3262-5305c6105709	ProgramskaEnotaSklopa-write	ProgramskaEnotaSklopa - spreminjanje	f
00030000-5617-71e7-89f1-203de4153ab5	Prostor-read	Prostor - branje	f
00030000-5617-71e7-c00f-874788a18e9e	Prostor-write	Prostor - spreminjanje	f
00030000-5617-71e7-ce5b-497d795c8917	Racun-read	Racun - branje	f
00030000-5617-71e7-57f2-51159bd582f6	Racun-write	Racun - spreminjanje	f
00030000-5617-71e7-2af9-ebbc1b6f2893	RazpisanSedez-read	RazpisanSedez - branje	f
00030000-5617-71e7-be9d-0fc8b16c03e3	RazpisanSedez-write	RazpisanSedez - spreminjanje	f
00030000-5617-71e7-a65a-d2824026da19	Rekviziterstvo-read	Rekviziterstvo - branje	f
00030000-5617-71e7-28c4-bb382c5b64c8	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	f
00030000-5617-71e7-e84f-bd978a0c2676	Rekvizit-read	Rekvizit - branje	f
00030000-5617-71e7-1c66-dd816279f78a	Rekvizit-write	Rekvizit - spreminjanje	f
00030000-5617-71e7-ef4e-f44aaed971f1	Revizija-read	Revizija - branje	f
00030000-5617-71e7-f7d7-893d2df54aac	Revizija-write	Revizija - spreminjanje	f
00030000-5617-71e7-7498-cb23f8599f57	Rezervacija-read	Rezervacija - branje	f
00030000-5617-71e7-90a0-1e3d1444a426	Rezervacija-write	Rezervacija - spreminjanje	f
00030000-5617-71e7-728e-12ce6896677b	SedezniRed-read	SedezniRed - branje	f
00030000-5617-71e7-086d-9416b95d9a98	SedezniRed-write	SedezniRed - spreminjanje	f
00030000-5617-71e7-9dc2-60a04f92cdc7	Sedez-read	Sedez - branje	f
00030000-5617-71e7-4984-4c4602d10d35	Sedez-write	Sedez - spreminjanje	f
00030000-5617-71e7-7172-3683f8d4f6b0	Sezona-read	Sezona - branje	f
00030000-5617-71e7-6da5-7a31bfee1f91	Sezona-write	Sezona - spreminjanje	f
00030000-5617-71e7-462d-e9247f81b7ae	StevilcenjeKonfig-read	StevilcenjeKonfig - branje	f
00030000-5617-71e7-93cc-8227cfacaa1a	StevilcenjeKonfig-write	StevilcenjeKonfig - spreminjanje	f
00030000-5617-71e7-74db-5580156dfdea	Stevilcenje-read	Stevilcenje - branje	f
00030000-5617-71e7-05c3-d1007f6913b2	Stevilcenje-write	Stevilcenje - spreminjanje	f
00030000-5617-71e7-b19b-f21b928c5705	StevilcenjeStanje-read	StevilcenjeStanje - branje	f
00030000-5617-71e7-57e8-a795dd948ce3	StevilcenjeStanje-write	StevilcenjeStanje - spreminjanje	f
00030000-5617-71e7-fe5e-b16c07999ff6	StrosekUprizoritve-read	StrosekUprizoritve - branje	f
00030000-5617-71e7-420f-93ab32e9757a	StrosekUprizoritve-write	StrosekUprizoritve - spreminjanje	f
00030000-5617-71e7-50e3-dcbeddbcbcb3	Telefonska-read	Telefonska - branje	f
00030000-5617-71e7-5223-9074103bb990	Telefonska-write	Telefonska - spreminjanje	f
00030000-5617-71e7-5347-e9a8b851325a	TerminStoritve-read	TerminStoritve - branje	f
00030000-5617-71e7-bd20-9b0b2a38b7fb	TerminStoritve-write	TerminStoritve - spreminjanje	f
00030000-5617-71e7-fa2a-395b34d0e2bf	TipFunkcije-read	TipFunkcije - branje	f
00030000-5617-71e7-e3fc-6e43f1580df8	TipFunkcije-write	TipFunkcije - spreminjanje	f
00030000-5617-71e7-cec8-aca6fc432af2	TipProgramskeEnote-read	TipProgramskeEnote - branje	f
00030000-5617-71e7-ce75-7b25c168e5a9	TipProgramskeEnote-write	TipProgramskeEnote - spreminjanje	f
00030000-5617-71e7-2a2a-bc7f79ee016c	Trr-read	Trr - branje	f
00030000-5617-71e7-82e9-3cda97727b9f	Trr-write	Trr - spreminjanje	f
00030000-5617-71e7-4c48-68743d1325e0	Uprizoritev-read	Uprizoritev - branje	f
00030000-5617-71e7-583e-ce136de3433e	Uprizoritev-write	Uprizoritev - spreminjanje	f
00030000-5617-71e7-697a-982096c778c5	Vaja-read	Vaja - branje	f
00030000-5617-71e7-a0c1-3465e9dfee54	Vaja-write	Vaja - spreminjanje	f
00030000-5617-71e7-4698-1cd9246d0ae7	VrstaSedezev-read	VrstaSedezev - branje	f
00030000-5617-71e7-048e-2113bb37a3c7	VrstaSedezev-write	VrstaSedezev - spreminjanje	f
00030000-5617-71e7-5860-d2ddc96ed1a2	VrstaStroska-read	VrstaStroska - branje	f
00030000-5617-71e7-665d-7f86373dc7fa	VrstaStroska-write	VrstaStroska - spreminjanje	f
00030000-5617-71e7-defc-c72c314e4b07	Zaposlitev-read	Zaposlitev - branje	f
00030000-5617-71e7-02b0-3109ede44ac6	Zaposlitev-write	Zaposlitev - spreminjanje	f
00030000-5617-71e7-5a5f-6e29e1911121	Zasedenost-read	Zasedenost - branje	f
00030000-5617-71e7-3499-2c37f64fe059	Zasedenost-write	Zasedenost - spreminjanje	f
00030000-5617-71e7-6d93-db11e92626ff	ZvrstSurs-read	ZvrstSurs - branje	f
00030000-5617-71e7-0c7c-768d3a6c0e4f	ZvrstSurs-write	ZvrstSurs - spreminjanje	f
00030000-5617-71e7-4de4-0e740fa91057	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	f
00030000-5617-71e7-6bba-81496fbf2fde	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	f
00030000-5617-71e7-2cb1-ef70ad608ca1	Job-read	Branje opravil - samo zase - branje	f
00030000-5617-71e7-db22-158ba15962e9	Job-write	Dodajanje in spreminjanje opravil - samo zase	f
00030000-5617-71e7-0b4b-d05299bec82c	Job-admin	Upravljanje opravil za vse uporabnike	f
00030000-5617-71e7-1272-5b44e2288950	Mapa-write	Mapa - osnovno dovoljenje za pisanje	f
00030000-5617-71e7-a837-64fbafff6740	Mapa-read	Mapa - osnovno dovoljenje za branje	f
00030000-5617-71e7-0882-65565e902871	MapaAcl-write	MapaAcl - dovoljenje za dostop pisanje ACL-jev mape	f
00030000-5617-71e7-0ca7-afef38bef704	MapaAcl-read	MapaAcl - dovoljenje za dostop branje ACL-jev mape	f
00030000-5617-71e7-1246-4982d301c201	Zapis-write	Zapis - dovoljenje za pisanje zapisov	f
00030000-5617-71e7-1d1c-87e7ceab6851	Zapis-read	Zapis - dovoljenje za pisanje zapisov	f
00030000-5617-71e7-4fad-b96c712c1a36	ZapisLastnik-write	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	f
00030000-5617-71e7-6e67-e08bbb94c4d8	ZapisLastnik-read	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	f
00030000-5617-71e7-364b-d738ba2e9d9f	VrstaZapisa-write	Šifrant vrst zapisa - spreminjanje	f
00030000-5617-71e7-b452-7cb22ddf69cd	VrstaZapisa-read	Šifrant vrst zapisa - branje	f
00030000-5617-71e7-f83a-739511005e62	Datoteka-write	Datoteka - spreminjanje	f
00030000-5617-71e7-ba03-6ba7e443d3a9	Datoteka-read	Datoteke - branje	f
\.


--
-- TOC entry 2993 (class 0 OID 21582367)
-- Dependencies: 180
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-5617-71e7-e7e4-28d6ee3e37a7	00030000-5617-71e7-d215-3fb6e0c8ade8
00020000-5617-71e7-00f3-6d2782d1f5cd	00030000-5617-71e7-4ca5-bafa35917fa1
00020000-5617-71e7-7bd4-b6bab7f09c09	00030000-5617-71e7-af6a-932647e47b25
00020000-5617-71e7-7bd4-b6bab7f09c09	00030000-5617-71e7-026d-a7a2e0ffa570
00020000-5617-71e7-7bd4-b6bab7f09c09	00030000-5617-71e7-0ec1-028b86558a88
00020000-5617-71e7-7bd4-b6bab7f09c09	00030000-5617-71e7-4598-ade99513148e
00020000-5617-71e7-7bd4-b6bab7f09c09	00030000-5617-71e7-361f-f3e276099b4f
00020000-5617-71e7-7bd4-b6bab7f09c09	00030000-5617-71e7-448b-98c24861aeb7
00020000-5617-71e7-7bd4-b6bab7f09c09	00030000-5617-71e7-2c1a-25eb054ac735
00020000-5617-71e7-7bd4-b6bab7f09c09	00030000-5617-71e7-d336-0138bde511bf
00020000-5617-71e7-7bd4-b6bab7f09c09	00030000-5617-71e7-4ca5-bafa35917fa1
00020000-5617-71e7-7bd4-b6bab7f09c09	00030000-5617-71e7-f964-6b58e105f660
00020000-5617-71e7-7bd4-b6bab7f09c09	00030000-5617-71e7-c6a0-f802ef1c87bb
00020000-5617-71e7-7bd4-b6bab7f09c09	00030000-5617-71e7-8938-f597612932be
00020000-5617-71e7-7bd4-b6bab7f09c09	00030000-5617-71e7-3fa0-e7fb4b5939a2
00020000-5617-71e7-7bd4-b6bab7f09c09	00030000-5617-71e7-a916-da795dfa728f
00020000-5617-71e7-7bd4-b6bab7f09c09	00030000-5617-71e7-9c39-07aac7b99a99
00020000-5617-71e7-7bd4-b6bab7f09c09	00030000-5617-71e7-b2fc-dc3e94646551
00020000-5617-71e7-7bd4-b6bab7f09c09	00030000-5617-71e7-fa4f-04268ac55875
00020000-5617-71e7-7bd4-b6bab7f09c09	00030000-5617-71e7-ef88-59e40182c8f8
00020000-5617-71e7-7bd4-b6bab7f09c09	00030000-5617-71e7-85fe-302fd81bc8fd
00020000-5617-71e7-7bd4-b6bab7f09c09	00030000-5617-71e7-3053-6b2a67d78650
00020000-5617-71e7-7bd4-b6bab7f09c09	00030000-5617-71e7-a40c-eebd60285098
00020000-5617-71e7-7bd4-b6bab7f09c09	00030000-5617-71e7-3c46-c2c9e396e181
00020000-5617-71e7-7bd4-b6bab7f09c09	00030000-5617-71e7-d3bb-0b8c44cd07bf
00020000-5617-71e7-7bd4-b6bab7f09c09	00030000-5617-71e7-c06a-f7d17bf7081f
00020000-5617-71e7-7bd4-b6bab7f09c09	00030000-5617-71e7-00e5-3afd4bf51583
00020000-5617-71e7-7bd4-b6bab7f09c09	00030000-5617-71e7-41f3-d8ac9cfb69c1
00020000-5617-71e7-7bd4-b6bab7f09c09	00030000-5617-71e7-893e-318235bc846b
00020000-5617-71e7-7bd4-b6bab7f09c09	00030000-5617-71e7-06d2-5757ad81b56c
00020000-5617-71e7-7bd4-b6bab7f09c09	00030000-5617-71e7-48a5-fbe3ae964e64
00020000-5617-71e7-7bd4-b6bab7f09c09	00030000-5617-71e7-2fda-994f9fbd8503
00020000-5617-71e7-7bd4-b6bab7f09c09	00030000-5617-71e7-351e-4dfe1896ebd3
00020000-5617-71e7-7bd4-b6bab7f09c09	00030000-5617-71e7-7582-2317d178707a
00020000-5617-71e7-7bd4-b6bab7f09c09	00030000-5617-71e7-89f1-203de4153ab5
00020000-5617-71e7-7bd4-b6bab7f09c09	00030000-5617-71e7-c00f-874788a18e9e
00020000-5617-71e7-7bd4-b6bab7f09c09	00030000-5617-71e7-a65a-d2824026da19
00020000-5617-71e7-7bd4-b6bab7f09c09	00030000-5617-71e7-28c4-bb382c5b64c8
00020000-5617-71e7-7bd4-b6bab7f09c09	00030000-5617-71e7-e84f-bd978a0c2676
00020000-5617-71e7-7bd4-b6bab7f09c09	00030000-5617-71e7-1c66-dd816279f78a
00020000-5617-71e7-7bd4-b6bab7f09c09	00030000-5617-71e7-7172-3683f8d4f6b0
00020000-5617-71e7-7bd4-b6bab7f09c09	00030000-5617-71e7-6da5-7a31bfee1f91
00020000-5617-71e7-7bd4-b6bab7f09c09	00030000-5617-71e7-fa2a-395b34d0e2bf
00020000-5617-71e7-7bd4-b6bab7f09c09	00030000-5617-71e7-4c48-68743d1325e0
00020000-5617-71e7-7bd4-b6bab7f09c09	00030000-5617-71e7-583e-ce136de3433e
00020000-5617-71e7-7bd4-b6bab7f09c09	00030000-5617-71e7-697a-982096c778c5
00020000-5617-71e7-7bd4-b6bab7f09c09	00030000-5617-71e7-a0c1-3465e9dfee54
00020000-5617-71e7-7bd4-b6bab7f09c09	00030000-5617-71e7-5a5f-6e29e1911121
00020000-5617-71e7-7bd4-b6bab7f09c09	00030000-5617-71e7-3499-2c37f64fe059
00020000-5617-71e7-7bd4-b6bab7f09c09	00030000-5617-71e7-6d93-db11e92626ff
00020000-5617-71e7-7bd4-b6bab7f09c09	00030000-5617-71e7-4de4-0e740fa91057
00020000-5617-71e7-b1b1-00a9ffa553df	00030000-5617-71e7-af6a-932647e47b25
00020000-5617-71e7-b1b1-00a9ffa553df	00030000-5617-71e7-361f-f3e276099b4f
00020000-5617-71e7-b1b1-00a9ffa553df	00030000-5617-71e7-448b-98c24861aeb7
00020000-5617-71e7-b1b1-00a9ffa553df	00030000-5617-71e7-4ca5-bafa35917fa1
00020000-5617-71e7-b1b1-00a9ffa553df	00030000-5617-71e7-3fa0-e7fb4b5939a2
00020000-5617-71e7-b1b1-00a9ffa553df	00030000-5617-71e7-9c39-07aac7b99a99
00020000-5617-71e7-b1b1-00a9ffa553df	00030000-5617-71e7-fa4f-04268ac55875
00020000-5617-71e7-b1b1-00a9ffa553df	00030000-5617-71e7-ef88-59e40182c8f8
00020000-5617-71e7-b1b1-00a9ffa553df	00030000-5617-71e7-85fe-302fd81bc8fd
00020000-5617-71e7-b1b1-00a9ffa553df	00030000-5617-71e7-3053-6b2a67d78650
00020000-5617-71e7-b1b1-00a9ffa553df	00030000-5617-71e7-a40c-eebd60285098
00020000-5617-71e7-b1b1-00a9ffa553df	00030000-5617-71e7-3c46-c2c9e396e181
00020000-5617-71e7-b1b1-00a9ffa553df	00030000-5617-71e7-d3bb-0b8c44cd07bf
00020000-5617-71e7-b1b1-00a9ffa553df	00030000-5617-71e7-00e5-3afd4bf51583
00020000-5617-71e7-b1b1-00a9ffa553df	00030000-5617-71e7-893e-318235bc846b
00020000-5617-71e7-b1b1-00a9ffa553df	00030000-5617-71e7-06d2-5757ad81b56c
00020000-5617-71e7-b1b1-00a9ffa553df	00030000-5617-71e7-48a5-fbe3ae964e64
00020000-5617-71e7-b1b1-00a9ffa553df	00030000-5617-71e7-89f1-203de4153ab5
00020000-5617-71e7-b1b1-00a9ffa553df	00030000-5617-71e7-a65a-d2824026da19
00020000-5617-71e7-b1b1-00a9ffa553df	00030000-5617-71e7-e84f-bd978a0c2676
00020000-5617-71e7-b1b1-00a9ffa553df	00030000-5617-71e7-7172-3683f8d4f6b0
00020000-5617-71e7-b1b1-00a9ffa553df	00030000-5617-71e7-50e3-dcbeddbcbcb3
00020000-5617-71e7-b1b1-00a9ffa553df	00030000-5617-71e7-5223-9074103bb990
00020000-5617-71e7-b1b1-00a9ffa553df	00030000-5617-71e7-2a2a-bc7f79ee016c
00020000-5617-71e7-b1b1-00a9ffa553df	00030000-5617-71e7-82e9-3cda97727b9f
00020000-5617-71e7-b1b1-00a9ffa553df	00030000-5617-71e7-defc-c72c314e4b07
00020000-5617-71e7-b1b1-00a9ffa553df	00030000-5617-71e7-02b0-3109ede44ac6
00020000-5617-71e7-b1b1-00a9ffa553df	00030000-5617-71e7-6d93-db11e92626ff
00020000-5617-71e7-b1b1-00a9ffa553df	00030000-5617-71e7-4de4-0e740fa91057
00020000-5617-71e7-ea31-6d20268f2f62	00030000-5617-71e7-af6a-932647e47b25
00020000-5617-71e7-ea31-6d20268f2f62	00030000-5617-71e7-0ec1-028b86558a88
00020000-5617-71e7-ea31-6d20268f2f62	00030000-5617-71e7-361f-f3e276099b4f
00020000-5617-71e7-ea31-6d20268f2f62	00030000-5617-71e7-42b3-e8fa6b37aa97
00020000-5617-71e7-ea31-6d20268f2f62	00030000-5617-71e7-edd6-8e2e42e8c3e9
00020000-5617-71e7-ea31-6d20268f2f62	00030000-5617-71e7-6853-86eb9026b9f1
00020000-5617-71e7-ea31-6d20268f2f62	00030000-5617-71e7-448b-98c24861aeb7
00020000-5617-71e7-ea31-6d20268f2f62	00030000-5617-71e7-4ca5-bafa35917fa1
00020000-5617-71e7-ea31-6d20268f2f62	00030000-5617-71e7-c6a0-f802ef1c87bb
00020000-5617-71e7-ea31-6d20268f2f62	00030000-5617-71e7-3fa0-e7fb4b5939a2
00020000-5617-71e7-ea31-6d20268f2f62	00030000-5617-71e7-9c39-07aac7b99a99
00020000-5617-71e7-ea31-6d20268f2f62	00030000-5617-71e7-fa4f-04268ac55875
00020000-5617-71e7-ea31-6d20268f2f62	00030000-5617-71e7-85fe-302fd81bc8fd
00020000-5617-71e7-ea31-6d20268f2f62	00030000-5617-71e7-3053-6b2a67d78650
00020000-5617-71e7-ea31-6d20268f2f62	00030000-5617-71e7-a40c-eebd60285098
00020000-5617-71e7-ea31-6d20268f2f62	00030000-5617-71e7-d3bb-0b8c44cd07bf
00020000-5617-71e7-ea31-6d20268f2f62	00030000-5617-71e7-00e5-3afd4bf51583
00020000-5617-71e7-ea31-6d20268f2f62	00030000-5617-71e7-48a5-fbe3ae964e64
00020000-5617-71e7-ea31-6d20268f2f62	00030000-5617-71e7-351e-4dfe1896ebd3
00020000-5617-71e7-ea31-6d20268f2f62	00030000-5617-71e7-89f1-203de4153ab5
00020000-5617-71e7-ea31-6d20268f2f62	00030000-5617-71e7-a65a-d2824026da19
00020000-5617-71e7-ea31-6d20268f2f62	00030000-5617-71e7-e84f-bd978a0c2676
00020000-5617-71e7-ea31-6d20268f2f62	00030000-5617-71e7-7172-3683f8d4f6b0
00020000-5617-71e7-ea31-6d20268f2f62	00030000-5617-71e7-fa2a-395b34d0e2bf
00020000-5617-71e7-ea31-6d20268f2f62	00030000-5617-71e7-697a-982096c778c5
00020000-5617-71e7-ea31-6d20268f2f62	00030000-5617-71e7-5a5f-6e29e1911121
00020000-5617-71e7-ea31-6d20268f2f62	00030000-5617-71e7-6d93-db11e92626ff
00020000-5617-71e7-ea31-6d20268f2f62	00030000-5617-71e7-4de4-0e740fa91057
00020000-5617-71e7-b7cd-7a3cbf8a7231	00030000-5617-71e7-af6a-932647e47b25
00020000-5617-71e7-b7cd-7a3cbf8a7231	00030000-5617-71e7-026d-a7a2e0ffa570
00020000-5617-71e7-b7cd-7a3cbf8a7231	00030000-5617-71e7-4598-ade99513148e
00020000-5617-71e7-b7cd-7a3cbf8a7231	00030000-5617-71e7-361f-f3e276099b4f
00020000-5617-71e7-b7cd-7a3cbf8a7231	00030000-5617-71e7-448b-98c24861aeb7
00020000-5617-71e7-b7cd-7a3cbf8a7231	00030000-5617-71e7-4ca5-bafa35917fa1
00020000-5617-71e7-b7cd-7a3cbf8a7231	00030000-5617-71e7-3fa0-e7fb4b5939a2
00020000-5617-71e7-b7cd-7a3cbf8a7231	00030000-5617-71e7-9c39-07aac7b99a99
00020000-5617-71e7-b7cd-7a3cbf8a7231	00030000-5617-71e7-85fe-302fd81bc8fd
00020000-5617-71e7-b7cd-7a3cbf8a7231	00030000-5617-71e7-3053-6b2a67d78650
00020000-5617-71e7-b7cd-7a3cbf8a7231	00030000-5617-71e7-d3bb-0b8c44cd07bf
00020000-5617-71e7-b7cd-7a3cbf8a7231	00030000-5617-71e7-00e5-3afd4bf51583
00020000-5617-71e7-b7cd-7a3cbf8a7231	00030000-5617-71e7-48a5-fbe3ae964e64
00020000-5617-71e7-b7cd-7a3cbf8a7231	00030000-5617-71e7-89f1-203de4153ab5
00020000-5617-71e7-b7cd-7a3cbf8a7231	00030000-5617-71e7-a65a-d2824026da19
00020000-5617-71e7-b7cd-7a3cbf8a7231	00030000-5617-71e7-e84f-bd978a0c2676
00020000-5617-71e7-b7cd-7a3cbf8a7231	00030000-5617-71e7-7172-3683f8d4f6b0
00020000-5617-71e7-b7cd-7a3cbf8a7231	00030000-5617-71e7-fa2a-395b34d0e2bf
00020000-5617-71e7-b7cd-7a3cbf8a7231	00030000-5617-71e7-6d93-db11e92626ff
00020000-5617-71e7-b7cd-7a3cbf8a7231	00030000-5617-71e7-4de4-0e740fa91057
00020000-5617-71e7-9017-20ebe96f6bd0	00030000-5617-71e7-af6a-932647e47b25
00020000-5617-71e7-9017-20ebe96f6bd0	00030000-5617-71e7-361f-f3e276099b4f
00020000-5617-71e7-9017-20ebe96f6bd0	00030000-5617-71e7-448b-98c24861aeb7
00020000-5617-71e7-9017-20ebe96f6bd0	00030000-5617-71e7-4ca5-bafa35917fa1
00020000-5617-71e7-9017-20ebe96f6bd0	00030000-5617-71e7-3fa0-e7fb4b5939a2
00020000-5617-71e7-9017-20ebe96f6bd0	00030000-5617-71e7-9c39-07aac7b99a99
00020000-5617-71e7-9017-20ebe96f6bd0	00030000-5617-71e7-85fe-302fd81bc8fd
00020000-5617-71e7-9017-20ebe96f6bd0	00030000-5617-71e7-3053-6b2a67d78650
00020000-5617-71e7-9017-20ebe96f6bd0	00030000-5617-71e7-d3bb-0b8c44cd07bf
00020000-5617-71e7-9017-20ebe96f6bd0	00030000-5617-71e7-00e5-3afd4bf51583
00020000-5617-71e7-9017-20ebe96f6bd0	00030000-5617-71e7-48a5-fbe3ae964e64
00020000-5617-71e7-9017-20ebe96f6bd0	00030000-5617-71e7-89f1-203de4153ab5
00020000-5617-71e7-9017-20ebe96f6bd0	00030000-5617-71e7-a65a-d2824026da19
00020000-5617-71e7-9017-20ebe96f6bd0	00030000-5617-71e7-e84f-bd978a0c2676
00020000-5617-71e7-9017-20ebe96f6bd0	00030000-5617-71e7-7172-3683f8d4f6b0
00020000-5617-71e7-9017-20ebe96f6bd0	00030000-5617-71e7-5347-e9a8b851325a
00020000-5617-71e7-9017-20ebe96f6bd0	00030000-5617-71e7-3712-e2a4dc2c0285
00020000-5617-71e7-9017-20ebe96f6bd0	00030000-5617-71e7-fa2a-395b34d0e2bf
00020000-5617-71e7-9017-20ebe96f6bd0	00030000-5617-71e7-6d93-db11e92626ff
00020000-5617-71e7-9017-20ebe96f6bd0	00030000-5617-71e7-4de4-0e740fa91057
00020000-5617-71e9-79ca-be405c113588	00030000-5617-71e7-f060-7314a045967a
00020000-5617-71e9-79ca-be405c113588	00030000-5617-71e7-d215-3fb6e0c8ade8
00020000-5617-71e9-79ca-be405c113588	00030000-5617-71e7-3712-e2a4dc2c0285
00020000-5617-71e9-79ca-be405c113588	00030000-5617-71e7-2c1a-25eb054ac735
00020000-5617-71e9-79ca-be405c113588	00030000-5617-71e7-6382-61edae98d9fd
00020000-5617-71e9-79ca-be405c113588	00030000-5617-71e7-20f0-d1d38fcbe8bb
00020000-5617-71e9-79ca-be405c113588	00030000-5617-71e7-3931-d85df6d3dfca
00020000-5617-71e9-79ca-be405c113588	00030000-5617-71e7-af6a-932647e47b25
00020000-5617-71e9-79ca-be405c113588	00030000-5617-71e7-026d-a7a2e0ffa570
00020000-5617-71e9-79ca-be405c113588	00030000-5617-71e7-0ec1-028b86558a88
00020000-5617-71e9-79ca-be405c113588	00030000-5617-71e7-4598-ade99513148e
00020000-5617-71e9-79ca-be405c113588	00030000-5617-71e7-361f-f3e276099b4f
00020000-5617-71e9-79ca-be405c113588	00030000-5617-71e7-42b3-e8fa6b37aa97
00020000-5617-71e9-79ca-be405c113588	00030000-5617-71e7-edd6-8e2e42e8c3e9
00020000-5617-71e9-79ca-be405c113588	00030000-5617-71e7-3234-5a9f61d4debe
00020000-5617-71e9-79ca-be405c113588	00030000-5617-71e7-6853-86eb9026b9f1
00020000-5617-71e9-79ca-be405c113588	00030000-5617-71e7-9d16-5bb894b59e7b
00020000-5617-71e9-79ca-be405c113588	00030000-5617-71e7-448b-98c24861aeb7
00020000-5617-71e9-79ca-be405c113588	00030000-5617-71e7-d336-0138bde511bf
00020000-5617-71e9-79ca-be405c113588	00030000-5617-71e7-4ca5-bafa35917fa1
00020000-5617-71e9-79ca-be405c113588	00030000-5617-71e7-f964-6b58e105f660
00020000-5617-71e9-79ca-be405c113588	00030000-5617-71e7-af54-67e86bb41e24
00020000-5617-71e9-79ca-be405c113588	00030000-5617-71e7-2c5c-aa3c461e78e3
00020000-5617-71e9-79ca-be405c113588	00030000-5617-71e7-cb6a-e679473153ee
00020000-5617-71e9-79ca-be405c113588	00030000-5617-71e7-545e-edc431a5cfe1
00020000-5617-71e9-79ca-be405c113588	00030000-5617-71e7-c6a0-f802ef1c87bb
00020000-5617-71e9-79ca-be405c113588	00030000-5617-71e7-8938-f597612932be
00020000-5617-71e9-79ca-be405c113588	00030000-5617-71e7-3fa0-e7fb4b5939a2
00020000-5617-71e9-79ca-be405c113588	00030000-5617-71e7-a916-da795dfa728f
00020000-5617-71e9-79ca-be405c113588	00030000-5617-71e7-9c39-07aac7b99a99
00020000-5617-71e9-79ca-be405c113588	00030000-5617-71e7-b2fc-dc3e94646551
00020000-5617-71e9-79ca-be405c113588	00030000-5617-71e7-fa4f-04268ac55875
00020000-5617-71e9-79ca-be405c113588	00030000-5617-71e7-ef88-59e40182c8f8
00020000-5617-71e9-79ca-be405c113588	00030000-5617-71e7-d9be-5cfc87e40b5b
00020000-5617-71e9-79ca-be405c113588	00030000-5617-71e7-c13d-66c225982362
00020000-5617-71e9-79ca-be405c113588	00030000-5617-71e7-f2c7-20be664fb51d
00020000-5617-71e9-79ca-be405c113588	00030000-5617-71e7-f8df-9f169401e134
00020000-5617-71e9-79ca-be405c113588	00030000-5617-71e7-85fe-302fd81bc8fd
00020000-5617-71e9-79ca-be405c113588	00030000-5617-71e7-9fc6-db0aa089416c
00020000-5617-71e9-79ca-be405c113588	00030000-5617-71e7-3053-6b2a67d78650
00020000-5617-71e9-79ca-be405c113588	00030000-5617-71e7-fdd2-d0e614031651
00020000-5617-71e9-79ca-be405c113588	00030000-5617-71e7-a40c-eebd60285098
00020000-5617-71e9-79ca-be405c113588	00030000-5617-71e7-3c46-c2c9e396e181
00020000-5617-71e9-79ca-be405c113588	00030000-5617-71e7-5ee8-eef9cf1d09e0
00020000-5617-71e9-79ca-be405c113588	00030000-5617-71e7-7679-8fc324eefc66
00020000-5617-71e9-79ca-be405c113588	00030000-5617-71e7-2340-9dfae7b2b65b
00020000-5617-71e9-79ca-be405c113588	00030000-5617-71e7-0b6b-1aa023552390
00020000-5617-71e9-79ca-be405c113588	00030000-5617-71e7-e63e-99e21927f02a
00020000-5617-71e9-79ca-be405c113588	00030000-5617-71e7-dd25-3eb281276671
00020000-5617-71e9-79ca-be405c113588	00030000-5617-71e7-d3bb-0b8c44cd07bf
00020000-5617-71e9-79ca-be405c113588	00030000-5617-71e7-c06a-f7d17bf7081f
00020000-5617-71e9-79ca-be405c113588	00030000-5617-71e7-00e5-3afd4bf51583
00020000-5617-71e9-79ca-be405c113588	00030000-5617-71e7-41f3-d8ac9cfb69c1
00020000-5617-71e9-79ca-be405c113588	00030000-5617-71e7-d338-658a34e48700
00020000-5617-71e9-79ca-be405c113588	00030000-5617-71e7-3fb3-22c30cc89090
00020000-5617-71e9-79ca-be405c113588	00030000-5617-71e7-76df-385764142e3f
00020000-5617-71e9-79ca-be405c113588	00030000-5617-71e7-7383-bb5b4dcd2cfd
00020000-5617-71e9-79ca-be405c113588	00030000-5617-71e7-893e-318235bc846b
00020000-5617-71e9-79ca-be405c113588	00030000-5617-71e7-06d2-5757ad81b56c
00020000-5617-71e9-79ca-be405c113588	00030000-5617-71e7-48a5-fbe3ae964e64
00020000-5617-71e9-79ca-be405c113588	00030000-5617-71e7-2fda-994f9fbd8503
00020000-5617-71e9-79ca-be405c113588	00030000-5617-71e7-1ca7-caf8752399ee
00020000-5617-71e9-79ca-be405c113588	00030000-5617-71e7-7f36-d1b082693006
00020000-5617-71e9-79ca-be405c113588	00030000-5617-71e7-0cb8-8ce120e8038d
00020000-5617-71e9-79ca-be405c113588	00030000-5617-71e7-1faf-84fd45689b3d
00020000-5617-71e9-79ca-be405c113588	00030000-5617-71e7-351e-4dfe1896ebd3
00020000-5617-71e9-79ca-be405c113588	00030000-5617-71e7-7582-2317d178707a
00020000-5617-71e9-79ca-be405c113588	00030000-5617-71e7-997a-9b427b04720a
00020000-5617-71e9-79ca-be405c113588	00030000-5617-71e7-014f-07f82060dbc1
00020000-5617-71e9-79ca-be405c113588	00030000-5617-71e7-ddcc-52d81e7b5a9b
00020000-5617-71e9-79ca-be405c113588	00030000-5617-71e7-f2cb-929b7b511fab
00020000-5617-71e9-79ca-be405c113588	00030000-5617-71e7-3df4-99e53f609a1b
00020000-5617-71e9-79ca-be405c113588	00030000-5617-71e7-2d38-4f1705d756bf
00020000-5617-71e9-79ca-be405c113588	00030000-5617-71e7-3e2f-d5a2d48fbc99
00020000-5617-71e9-79ca-be405c113588	00030000-5617-71e7-ec02-6ab87af12e81
00020000-5617-71e9-79ca-be405c113588	00030000-5617-71e7-b82a-3467d025ce7d
00020000-5617-71e9-79ca-be405c113588	00030000-5617-71e7-6628-ec558ce70a97
00020000-5617-71e9-79ca-be405c113588	00030000-5617-71e7-541b-cb7a55e33726
00020000-5617-71e9-79ca-be405c113588	00030000-5617-71e7-5b96-918e9d933fb3
00020000-5617-71e9-79ca-be405c113588	00030000-5617-71e7-b0c8-60aa3f7e8e21
00020000-5617-71e9-79ca-be405c113588	00030000-5617-71e7-24db-06129f56ff07
00020000-5617-71e9-79ca-be405c113588	00030000-5617-71e7-a7d5-09c47f4fdf84
00020000-5617-71e9-79ca-be405c113588	00030000-5617-71e7-b38f-d46fa0c9ca01
00020000-5617-71e9-79ca-be405c113588	00030000-5617-71e7-91a7-5c58a3e6665c
00020000-5617-71e9-79ca-be405c113588	00030000-5617-71e7-f4c1-0488c0b2768b
00020000-5617-71e9-79ca-be405c113588	00030000-5617-71e7-f85a-96320d53dabe
00020000-5617-71e9-79ca-be405c113588	00030000-5617-71e7-3262-5305c6105709
00020000-5617-71e9-79ca-be405c113588	00030000-5617-71e7-89f1-203de4153ab5
00020000-5617-71e9-79ca-be405c113588	00030000-5617-71e7-c00f-874788a18e9e
00020000-5617-71e9-79ca-be405c113588	00030000-5617-71e7-ce5b-497d795c8917
00020000-5617-71e9-79ca-be405c113588	00030000-5617-71e7-57f2-51159bd582f6
00020000-5617-71e9-79ca-be405c113588	00030000-5617-71e7-2af9-ebbc1b6f2893
00020000-5617-71e9-79ca-be405c113588	00030000-5617-71e7-be9d-0fc8b16c03e3
00020000-5617-71e9-79ca-be405c113588	00030000-5617-71e7-a65a-d2824026da19
00020000-5617-71e9-79ca-be405c113588	00030000-5617-71e7-28c4-bb382c5b64c8
00020000-5617-71e9-79ca-be405c113588	00030000-5617-71e7-e84f-bd978a0c2676
00020000-5617-71e9-79ca-be405c113588	00030000-5617-71e7-1c66-dd816279f78a
00020000-5617-71e9-79ca-be405c113588	00030000-5617-71e7-ef4e-f44aaed971f1
00020000-5617-71e9-79ca-be405c113588	00030000-5617-71e7-f7d7-893d2df54aac
00020000-5617-71e9-79ca-be405c113588	00030000-5617-71e7-7498-cb23f8599f57
00020000-5617-71e9-79ca-be405c113588	00030000-5617-71e7-90a0-1e3d1444a426
00020000-5617-71e9-79ca-be405c113588	00030000-5617-71e7-728e-12ce6896677b
00020000-5617-71e9-79ca-be405c113588	00030000-5617-71e7-086d-9416b95d9a98
00020000-5617-71e9-79ca-be405c113588	00030000-5617-71e7-9dc2-60a04f92cdc7
00020000-5617-71e9-79ca-be405c113588	00030000-5617-71e7-4984-4c4602d10d35
00020000-5617-71e9-79ca-be405c113588	00030000-5617-71e7-7172-3683f8d4f6b0
00020000-5617-71e9-79ca-be405c113588	00030000-5617-71e7-6da5-7a31bfee1f91
00020000-5617-71e9-79ca-be405c113588	00030000-5617-71e7-462d-e9247f81b7ae
00020000-5617-71e9-79ca-be405c113588	00030000-5617-71e7-93cc-8227cfacaa1a
00020000-5617-71e9-79ca-be405c113588	00030000-5617-71e7-74db-5580156dfdea
00020000-5617-71e9-79ca-be405c113588	00030000-5617-71e7-05c3-d1007f6913b2
00020000-5617-71e9-79ca-be405c113588	00030000-5617-71e7-b19b-f21b928c5705
00020000-5617-71e9-79ca-be405c113588	00030000-5617-71e7-57e8-a795dd948ce3
00020000-5617-71e9-79ca-be405c113588	00030000-5617-71e7-fe5e-b16c07999ff6
00020000-5617-71e9-79ca-be405c113588	00030000-5617-71e7-420f-93ab32e9757a
00020000-5617-71e9-79ca-be405c113588	00030000-5617-71e7-50e3-dcbeddbcbcb3
00020000-5617-71e9-79ca-be405c113588	00030000-5617-71e7-5223-9074103bb990
00020000-5617-71e9-79ca-be405c113588	00030000-5617-71e7-5347-e9a8b851325a
00020000-5617-71e9-79ca-be405c113588	00030000-5617-71e7-bd20-9b0b2a38b7fb
00020000-5617-71e9-79ca-be405c113588	00030000-5617-71e7-fa2a-395b34d0e2bf
00020000-5617-71e9-79ca-be405c113588	00030000-5617-71e7-e3fc-6e43f1580df8
00020000-5617-71e9-79ca-be405c113588	00030000-5617-71e7-cec8-aca6fc432af2
00020000-5617-71e9-79ca-be405c113588	00030000-5617-71e7-ce75-7b25c168e5a9
00020000-5617-71e9-79ca-be405c113588	00030000-5617-71e7-2a2a-bc7f79ee016c
00020000-5617-71e9-79ca-be405c113588	00030000-5617-71e7-82e9-3cda97727b9f
00020000-5617-71e9-79ca-be405c113588	00030000-5617-71e7-4c48-68743d1325e0
00020000-5617-71e9-79ca-be405c113588	00030000-5617-71e7-583e-ce136de3433e
00020000-5617-71e9-79ca-be405c113588	00030000-5617-71e7-697a-982096c778c5
00020000-5617-71e9-79ca-be405c113588	00030000-5617-71e7-a0c1-3465e9dfee54
00020000-5617-71e9-79ca-be405c113588	00030000-5617-71e7-4698-1cd9246d0ae7
00020000-5617-71e9-79ca-be405c113588	00030000-5617-71e7-048e-2113bb37a3c7
00020000-5617-71e9-79ca-be405c113588	00030000-5617-71e7-5860-d2ddc96ed1a2
00020000-5617-71e9-79ca-be405c113588	00030000-5617-71e7-665d-7f86373dc7fa
00020000-5617-71e9-79ca-be405c113588	00030000-5617-71e7-defc-c72c314e4b07
00020000-5617-71e9-79ca-be405c113588	00030000-5617-71e7-02b0-3109ede44ac6
00020000-5617-71e9-79ca-be405c113588	00030000-5617-71e7-5a5f-6e29e1911121
00020000-5617-71e9-79ca-be405c113588	00030000-5617-71e7-3499-2c37f64fe059
00020000-5617-71e9-79ca-be405c113588	00030000-5617-71e7-6d93-db11e92626ff
00020000-5617-71e9-79ca-be405c113588	00030000-5617-71e7-0c7c-768d3a6c0e4f
00020000-5617-71e9-79ca-be405c113588	00030000-5617-71e7-4de4-0e740fa91057
00020000-5617-71e9-79ca-be405c113588	00030000-5617-71e7-6bba-81496fbf2fde
\.


--
-- TOC entry 3022 (class 0 OID 21582692)
-- Dependencies: 209
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 3026 (class 0 OID 21582726)
-- Dependencies: 213
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 3038 (class 0 OID 21582862)
-- Dependencies: 225
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, zacetek, konec, jeavtorskepravice, placilonavajo, vrednostvaje, planiranostevilovaj, vrednostvaj, vrednostpredstave, procentodinkasa, jeprocentodinkasa, vrednostdopremiere, zaposlenvdrjz, samozaposlen, igralec, opis) FROM stdin;
000b0000-5617-71e9-6041-bf7b9ab2fce1	00090000-5617-71e9-2c22-e2956525b27c	\N	\N	0001	\N	\N	f	f	10.00	3	10.00	30.00	\N	f	10.00	t	f	t	Pogodba o sodelovanju
000b0000-5617-71e9-b002-5ec276cc021b	00090000-5617-71e9-71a9-7051f1fb1416	\N	\N	0002	\N	\N	f	t	11.00	10	11.00	31.00	\N	f	110.00	f	t	t	Pogodba za vlogo Helena
000b0000-5617-71e9-e0cc-2a8912317a29	00090000-5617-71e9-2b77-51ed03201244	\N	\N	0003	\N	\N	f	f	12.00	4	12.00	0.00	\N	f	12.00	f	t	f	Pogodba za lektoriranje
000b0000-5617-71e9-e1b9-3bd37f7b0756	00090000-5617-71e9-e467-f4ad0fa61fd2	\N	\N	0004	\N	\N	t	f	0.00	2	300.00	0.00	\N	f	300.00	f	t	f	Pogodba za avtorske pravice
\.


--
-- TOC entry 2998 (class 0 OID 21582427)
-- Dependencies: 185
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, drzava_id, sifra, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo, nvo) FROM stdin;
00080000-5617-71e9-2c5a-5c1fc1ee42fb	00040000-5617-71e7-1e3b-f01ed14eaa7e	0988	AK	Juhuhu d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5617-71e9-de08-d78858b3dd93	00040000-5617-71e7-1e3b-f01ed14eaa7e	0989	AK	Hopsasa d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	t
00080000-5617-71e9-6328-e0ea957a11b0	00040000-5617-71e7-1e3b-f01ed14eaa7e	0987	AK	Gledališče Šrum d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5617-71e9-3ce7-d032014d7841	00040000-5617-71e7-1e3b-f01ed14eaa7e	0986	AK	Lutkovni Direndaj d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5617-71e9-2cfe-773a52a8d8a8	00040000-5617-71e7-1e3b-f01ed14eaa7e	0985	AK	Tatjana Stanič, Lektoriranje, s.p.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5617-71e9-2c92-59e94afcf22c	00040000-5617-71e6-5076-b048a9c65ee0	0984	AK	Gledališče Lepote tvoje		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5617-71e9-95f9-1953693a97de	00040000-5617-71e6-1461-6f12fcaee0a1	0983	AK	Sunce naše		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5617-71e9-bfaa-41c03d1adce2	00040000-5617-71e6-8d5e-c6d68377da8f	0982	AK	Theater Amadeus		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5617-71e9-ae03-001987663593	00040000-5617-71e6-50c7-3da81ed5752a	9999	AK	Fuchs		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5617-71eb-bf72-60274bf41482	00040000-5617-71e7-1e3b-f01ed14eaa7e	1001	AK	Gledališče Matica		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
\.


--
-- TOC entry 3000 (class 0 OID 21582461)
-- Dependencies: 187
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-5617-71e6-8c7c-db1cf26e6124	8341	Adlešiči
00050000-5617-71e6-f205-90bc159a2c2e	5270	Ajdovščina
00050000-5617-71e6-f443-6782cad1b126	6280	Ankaran/Ancarano
00050000-5617-71e6-8148-0f4c88ab987e	9253	Apače
00050000-5617-71e6-86b7-d7763d86b943	8253	Artiče
00050000-5617-71e6-5718-2adf6ee9fa65	4275	Begunje na Gorenjskem
00050000-5617-71e6-5394-2d2e6f2ce315	1382	Begunje pri Cerknici
00050000-5617-71e6-5ee6-bada598138ea	9231	Beltinci
00050000-5617-71e6-8aa4-d087e51eed30	2234	Benedikt
00050000-5617-71e6-c0a6-9d961b9352e5	2345	Bistrica ob Dravi
00050000-5617-71e6-7f97-f236540d3102	3256	Bistrica ob Sotli
00050000-5617-71e6-e201-2766d21cd4c4	8259	Bizeljsko
00050000-5617-71e6-ecf2-776f2ca71121	1223	Blagovica
00050000-5617-71e6-3b26-dac8ac455512	8283	Blanca
00050000-5617-71e6-ba27-780f8fcafcc5	4260	Bled
00050000-5617-71e6-54a5-11fe62608a6b	4273	Blejska Dobrava
00050000-5617-71e6-d8fd-20c408b74fc0	9265	Bodonci
00050000-5617-71e6-b247-a619ec639b0a	9222	Bogojina
00050000-5617-71e6-6d56-0c29cfbdb44e	4263	Bohinjska Bela
00050000-5617-71e6-50b2-6295f71ea64c	4264	Bohinjska Bistrica
00050000-5617-71e6-66d9-04c0f6d3e27a	4265	Bohinjsko jezero
00050000-5617-71e6-5d34-8e9f19a068bf	1353	Borovnica
00050000-5617-71e6-f4eb-f5d83f581d68	8294	Boštanj
00050000-5617-71e6-137c-7513f872ae15	5230	Bovec
00050000-5617-71e6-e355-06f8364a8ff2	5295	Branik
00050000-5617-71e6-c43a-7bda297c1e66	3314	Braslovče
00050000-5617-71e6-0061-941248a0a0f6	5223	Breginj
00050000-5617-71e6-9ce2-28bfa0c9b903	8280	Brestanica
00050000-5617-71e6-1e89-de741381bf39	2354	Bresternica
00050000-5617-71e6-8ae3-80087def73b9	4243	Brezje
00050000-5617-71e6-db6f-67d053d993c7	1351	Brezovica pri Ljubljani
00050000-5617-71e6-30fc-ae1fc980ba52	8250	Brežice
00050000-5617-71e6-d20b-d200aad49738	4210	Brnik - Aerodrom
00050000-5617-71e6-237a-895efff844f2	8321	Brusnice
00050000-5617-71e6-fce8-4fc36a794bb3	3255	Buče
00050000-5617-71e6-d075-79c63d765645	8276	Bučka 
00050000-5617-71e6-cb1a-84c125a76637	9261	Cankova
00050000-5617-71e6-15ca-adc238b1d508	3000	Celje 
00050000-5617-71e6-618b-4892e3c50bfe	3001	Celje - poštni predali
00050000-5617-71e6-f8c8-06f08e7b7f3d	4207	Cerklje na Gorenjskem
00050000-5617-71e6-e7dc-d04b41abe592	8263	Cerklje ob Krki
00050000-5617-71e6-1ba5-e756225931df	1380	Cerknica
00050000-5617-71e6-1adc-3b31a04c3384	5282	Cerkno
00050000-5617-71e6-bd51-cadfa0df66ed	2236	Cerkvenjak
00050000-5617-71e6-7cfe-4f533c818684	2215	Ceršak
00050000-5617-71e6-b40e-f735bea7d488	2326	Cirkovce
00050000-5617-71e6-f81c-cf3375791ed8	2282	Cirkulane
00050000-5617-71e6-8a75-e367a7880303	5273	Col
00050000-5617-71e6-8a1b-a6586b855ca9	8251	Čatež ob Savi
00050000-5617-71e6-dafe-6adb81014933	1413	Čemšenik
00050000-5617-71e6-70ee-d5de5623cfbe	5253	Čepovan
00050000-5617-71e6-1c2d-ee725482c326	9232	Črenšovci
00050000-5617-71e6-101d-3de407f5efd7	2393	Črna na Koroškem
00050000-5617-71e6-7ef5-83685f650ef5	6275	Črni Kal
00050000-5617-71e6-4d7c-4cd5e89eda19	5274	Črni Vrh nad Idrijo
00050000-5617-71e6-8c54-9bc872a72402	5262	Črniče
00050000-5617-71e6-8160-1a16900a91c9	8340	Črnomelj
00050000-5617-71e6-eb6b-b24cffcecfe8	6271	Dekani
00050000-5617-71e6-98ab-6264cefe2068	5210	Deskle
00050000-5617-71e6-e008-d8943e59be72	2253	Destrnik
00050000-5617-71e6-1a28-aa5158090aea	6215	Divača
00050000-5617-71e6-7435-8c7295d36d6b	1233	Dob
00050000-5617-71e6-5f39-a32793724f76	3224	Dobje pri Planini
00050000-5617-71e6-0dd8-1a79626fee24	8257	Dobova
00050000-5617-71e6-6e6b-53f7c7dbaef2	1423	Dobovec
00050000-5617-71e6-3ea5-781359031375	5263	Dobravlje
00050000-5617-71e6-71e9-8f679306b664	3204	Dobrna
00050000-5617-71e6-63b2-1ff5ebf88733	8211	Dobrnič
00050000-5617-71e6-6c0c-d2d1de6d84ee	1356	Dobrova
00050000-5617-71e6-15c8-39bf4ec7d27b	9223	Dobrovnik/Dobronak 
00050000-5617-71e6-7931-fdd137c32371	5212	Dobrovo v Brdih
00050000-5617-71e6-8adc-54589eb62992	1431	Dol pri Hrastniku
00050000-5617-71e6-adf3-ad03eb81a479	1262	Dol pri Ljubljani
00050000-5617-71e6-63af-fbb2f403e942	1273	Dole pri Litiji
00050000-5617-71e6-1429-672210f2d5c0	1331	Dolenja vas
00050000-5617-71e6-aa8b-070685d1d5ff	8350	Dolenjske Toplice
00050000-5617-71e6-8040-88a44bf96b82	1230	Domžale
00050000-5617-71e6-0ca3-4c5c852f126e	2252	Dornava
00050000-5617-71e6-4516-c49ec423f08f	5294	Dornberk
00050000-5617-71e6-31b8-b3339eae5dce	1319	Draga
00050000-5617-71e6-053b-c81ec6a05aa3	8343	Dragatuš
00050000-5617-71e6-af46-85b61320cb53	3222	Dramlje
00050000-5617-71e6-1300-8ce96582a486	2370	Dravograd
00050000-5617-71e6-29cc-c3117001ed30	4203	Duplje
00050000-5617-71e6-6cb3-c674483889c1	6221	Dutovlje
00050000-5617-71e6-c603-26902b62560a	8361	Dvor
00050000-5617-71e6-bd3f-b54f97704083	2343	Fala
00050000-5617-71e6-101d-f10804dd55f5	9208	Fokovci
00050000-5617-71e6-9d4c-13f8af37b031	2313	Fram
00050000-5617-71e6-787f-07eff3043d39	3213	Frankolovo
00050000-5617-71e6-32f1-ce4ce683f0b9	1274	Gabrovka
00050000-5617-71e6-f862-70440d072ca8	8254	Globoko
00050000-5617-71e6-3285-baa1368193ea	5275	Godovič
00050000-5617-71e6-8701-a88afb715748	4204	Golnik
00050000-5617-71e6-fb67-36a2cef69e1a	3303	Gomilsko
00050000-5617-71e6-a04d-8bedcfaa0622	4224	Gorenja vas
00050000-5617-71e6-b334-15cf7dbb2890	3263	Gorica pri Slivnici
00050000-5617-71e6-3fe4-8875a5a69f41	2272	Gorišnica
00050000-5617-71e6-3253-dbe65e38f027	9250	Gornja Radgona
00050000-5617-71e6-dcfb-0d69253b26d3	3342	Gornji Grad
00050000-5617-71e6-1aac-875e53d7c398	4282	Gozd Martuljek
00050000-5617-71e6-19da-393256d08f01	6272	Gračišče
00050000-5617-71e6-32eb-d51ef113db73	9264	Grad
00050000-5617-71e6-f684-65ea95d88ff8	8332	Gradac
00050000-5617-71e6-78d6-00aea2b043c9	1384	Grahovo
00050000-5617-71e6-b7b7-e048894c0bdf	5242	Grahovo ob Bači
00050000-5617-71e6-8afa-68bf5ea0b61e	5251	Grgar
00050000-5617-71e6-a390-980a1ce38c28	3302	Griže
00050000-5617-71e6-22dc-f209c3ea234d	3231	Grobelno
00050000-5617-71e6-5d99-ff515437bc41	1290	Grosuplje
00050000-5617-71e6-6302-d936c91a3d2a	2288	Hajdina
00050000-5617-71e6-efd3-428991883b75	8362	Hinje
00050000-5617-71e6-09d0-e05bedf7e059	2311	Hoče
00050000-5617-71e6-610f-8079cb605e55	9205	Hodoš/Hodos
00050000-5617-71e6-6ded-f628f21157c0	1354	Horjul
00050000-5617-71e6-8ecb-5cdda480f66c	1372	Hotedršica
00050000-5617-71e6-5e2c-3a74ba0fd690	1430	Hrastnik
00050000-5617-71e6-d0d5-1839183c84da	6225	Hruševje
00050000-5617-71e6-14c6-cfd4226c3c47	4276	Hrušica
00050000-5617-71e6-3ebd-595bde830d50	5280	Idrija
00050000-5617-71e6-9d4c-715d9e242fc7	1292	Ig
00050000-5617-71e6-8196-be83d044bab4	6250	Ilirska Bistrica
00050000-5617-71e6-c618-502778ceb571	6251	Ilirska Bistrica-Trnovo
00050000-5617-71e6-a452-eb171f0a5649	1295	Ivančna Gorica
00050000-5617-71e6-f795-53f0d2b6a651	2259	Ivanjkovci
00050000-5617-71e6-5ff1-e377bbf38553	1411	Izlake
00050000-5617-71e6-7c4a-8ec0ed3d1b4c	6310	Izola/Isola
00050000-5617-71e6-deab-6843a13e02d4	2222	Jakobski Dol
00050000-5617-71e6-fc0c-e0a19b8f2a26	2221	Jarenina
00050000-5617-71e6-8a4c-1f9eff14c417	6254	Jelšane
00050000-5617-71e6-59db-50c4c6b030ad	4270	Jesenice
00050000-5617-71e6-1b34-f7ef2553d3fb	8261	Jesenice na Dolenjskem
00050000-5617-71e6-511d-b34a0ec3a849	3273	Jurklošter
00050000-5617-71e6-be29-1fae8f4cd0f9	2223	Jurovski Dol
00050000-5617-71e6-5099-b6de2e30cd37	2256	Juršinci
00050000-5617-71e6-434e-f1d68d46abaf	5214	Kal nad Kanalom
00050000-5617-71e6-c03b-35d30a39157b	3233	Kalobje
00050000-5617-71e6-ddf5-9eb403d96ad0	4246	Kamna Gorica
00050000-5617-71e6-4904-7a77bccfeee4	2351	Kamnica
00050000-5617-71e6-cf67-92ad9b18ecce	1241	Kamnik
00050000-5617-71e6-2fcc-6632a296fa79	5213	Kanal
00050000-5617-71e6-4d10-05218b0ec585	8258	Kapele
00050000-5617-71e6-68a1-1cc32d605c23	2362	Kapla
00050000-5617-71e6-5fc1-462f96cdc437	2325	Kidričevo
00050000-5617-71e6-3c08-53a4f5f0abfd	1412	Kisovec
00050000-5617-71e6-8c65-151c0f0d5c0b	6253	Knežak
00050000-5617-71e6-ece6-e9d10930ecd9	5222	Kobarid
00050000-5617-71e6-66fa-8ba7081a4ba6	9227	Kobilje
00050000-5617-71e6-605b-a0e2a700e840	1330	Kočevje
00050000-5617-71e6-9897-ab745759e9df	1338	Kočevska Reka
00050000-5617-71e6-955a-7ae53e428ae0	2276	Kog
00050000-5617-71e6-e95d-9ffac8f6a3b5	5211	Kojsko
00050000-5617-71e6-4c98-8224c34e33d4	6223	Komen
00050000-5617-71e6-cf49-6c5b9c50253d	1218	Komenda
00050000-5617-71e6-cb54-e4bcc5585ee3	6000	Koper/Capodistria 
00050000-5617-71e6-0068-9f75492f56d3	6001	Koper/Capodistria - poštni predali
00050000-5617-71e6-bdb3-5550a1d82f67	8282	Koprivnica
00050000-5617-71e6-dea8-68d536c4ef3a	5296	Kostanjevica na Krasu
00050000-5617-71e6-f921-d539948c3e3e	8311	Kostanjevica na Krki
00050000-5617-71e6-dd09-3e4dd72e1e84	1336	Kostel
00050000-5617-71e6-f296-e09c1d9b314d	6256	Košana
00050000-5617-71e6-4f7a-5b13417486a5	2394	Kotlje
00050000-5617-71e6-06d2-ba1493fe6bc9	6240	Kozina
00050000-5617-71e6-ae96-5e356fefdc19	3260	Kozje
00050000-5617-71e6-341e-517be72cbc3c	4000	Kranj 
00050000-5617-71e6-a5bc-a198296dc33d	4001	Kranj - poštni predali
00050000-5617-71e6-b589-bd20e2a02e12	4280	Kranjska Gora
00050000-5617-71e6-f353-025a1a4f682b	1281	Kresnice
00050000-5617-71e6-cc83-3672dcc04e06	4294	Križe
00050000-5617-71e6-54f7-321bd0a541b7	9206	Križevci
00050000-5617-71e6-0ab1-80c27f744214	9242	Križevci pri Ljutomeru
00050000-5617-71e6-299f-70e8fbc05edf	1301	Krka
00050000-5617-71e6-7c44-f5cf853b64e2	8296	Krmelj
00050000-5617-71e6-8211-213b9aea05cd	4245	Kropa
00050000-5617-71e6-8de0-250153f30458	8262	Krška vas
00050000-5617-71e6-81e7-32a991b7706c	8270	Krško
00050000-5617-71e6-a2d9-8ba6ff0822b2	9263	Kuzma
00050000-5617-71e6-2bf0-77ef4991d697	2318	Laporje
00050000-5617-71e6-09d6-f7d3fae3f661	3270	Laško
00050000-5617-71e6-f24f-1fea0c64bb1b	1219	Laze v Tuhinju
00050000-5617-71e6-7850-3227ff264c52	2230	Lenart v Slovenskih goricah
00050000-5617-71e6-dbaa-95c9552162ef	9220	Lendava/Lendva
00050000-5617-71e6-49e2-df279a5ffde9	4248	Lesce
00050000-5617-71e6-421e-09ea58e5a539	3261	Lesično
00050000-5617-71e6-b066-c8a307d7e1fd	8273	Leskovec pri Krškem
00050000-5617-71e6-817d-83f78f229999	2372	Libeliče
00050000-5617-71e6-34e8-3dbab1a6397e	2341	Limbuš
00050000-5617-71e6-cc8d-6ca41f747866	1270	Litija
00050000-5617-71e6-b2d9-5e15e8bfe2cc	3202	Ljubečna
00050000-5617-71e6-c12e-213edc172925	1000	Ljubljana 
00050000-5617-71e6-780a-7f1aae859816	1001	Ljubljana - poštni predali
00050000-5617-71e6-dd05-add5c5539040	1231	Ljubljana - Črnuče
00050000-5617-71e6-5b4d-ea04eb060a6c	1261	Ljubljana - Dobrunje
00050000-5617-71e6-2693-c613dad39e4e	1260	Ljubljana - Polje
00050000-5617-71e6-64ba-14647411ef0d	1210	Ljubljana - Šentvid
00050000-5617-71e6-a745-3e76af8acdb9	1211	Ljubljana - Šmartno
00050000-5617-71e6-69da-c35b08eee765	3333	Ljubno ob Savinji
00050000-5617-71e6-5cb3-0d1d15b1a12a	9240	Ljutomer
00050000-5617-71e6-4174-454207817621	3215	Loče
00050000-5617-71e6-82af-a6e94298c19d	5231	Log pod Mangartom
00050000-5617-71e6-cc0a-fdf956181a64	1358	Log pri Brezovici
00050000-5617-71e6-437f-ea8a2bfe3b2a	1370	Logatec
00050000-5617-71e6-9dce-4a045c727492	1371	Logatec
00050000-5617-71e6-c12d-2fc96c54665f	1434	Loka pri Zidanem Mostu
00050000-5617-71e6-7d4c-060ff79e70dc	3223	Loka pri Žusmu
00050000-5617-71e6-eff3-b6554ba03c60	6219	Lokev
00050000-5617-71e6-5d53-55596a6bd51a	1318	Loški Potok
00050000-5617-71e6-0fd2-0ad449bf426b	2324	Lovrenc na Dravskem polju
00050000-5617-71e6-51b2-11c93abe51ae	2344	Lovrenc na Pohorju
00050000-5617-71e6-edbc-b47a2e94cd27	3334	Luče
00050000-5617-71e6-2ded-0a6ba006b608	1225	Lukovica
00050000-5617-71e6-7868-059bb7dc4a4e	9202	Mačkovci
00050000-5617-71e6-c058-b73a7b01461e	2322	Majšperk
00050000-5617-71e6-db70-6ff32d14a4e6	2321	Makole
00050000-5617-71e6-e605-3fb47f63e752	9243	Mala Nedelja
00050000-5617-71e6-6cb6-ed78bd8ad89f	2229	Malečnik
00050000-5617-71e6-016d-c4d73137c1f5	6273	Marezige
00050000-5617-71e6-5801-6f36ed9ec7f9	2000	Maribor 
00050000-5617-71e6-4336-b7b381a5aff4	2001	Maribor - poštni predali
00050000-5617-71e6-3679-75b9b3d233f6	2206	Marjeta na Dravskem polju
00050000-5617-71e6-33a4-d51330a17270	2281	Markovci
00050000-5617-71e6-f1a1-8fa78511935c	9221	Martjanci
00050000-5617-71e6-f52d-27de7c42190d	6242	Materija
00050000-5617-71e6-c84e-0465a3dbd0de	4211	Mavčiče
00050000-5617-71e6-ebfe-dea8d3e5bc62	1215	Medvode
00050000-5617-71e6-5bff-c55e2fa079a6	1234	Mengeš
00050000-5617-71e6-30e4-6a2aa3a22028	8330	Metlika
00050000-5617-71e6-dea0-a1525ab603fd	2392	Mežica
00050000-5617-71e6-92b7-aa5d93a9dae8	2204	Miklavž na Dravskem polju
00050000-5617-71e6-d3d6-e17ef2d15cda	2275	Miklavž pri Ormožu
00050000-5617-71e6-7c9a-92ea2c03996c	5291	Miren
00050000-5617-71e6-288f-08f4c7152c9f	8233	Mirna
00050000-5617-71e6-a3b2-eea785d3766b	8216	Mirna Peč
00050000-5617-71e6-790e-412dcdf0c024	2382	Mislinja
00050000-5617-71e6-bdd6-9638cbb40a22	4281	Mojstrana
00050000-5617-71e6-ac0e-091f943db340	8230	Mokronog
00050000-5617-71e6-95fa-a655d196008f	1251	Moravče
00050000-5617-71e6-baed-9e03d5cfeaf7	9226	Moravske Toplice
00050000-5617-71e6-728f-abe8c896567f	5216	Most na Soči
00050000-5617-71e6-e159-53cebf2b2899	1221	Motnik
00050000-5617-71e6-63b3-69c0f367e358	3330	Mozirje
00050000-5617-71e6-ffb0-135ba344e0c1	9000	Murska Sobota 
00050000-5617-71e6-7cdb-9bff9f333c1c	9001	Murska Sobota - poštni predali
00050000-5617-71e6-4371-77ff4c34dbf9	2366	Muta
00050000-5617-71e6-abc8-696ab54d9ae7	4202	Naklo
00050000-5617-71e6-7c00-574eba613b12	3331	Nazarje
00050000-5617-71e6-c8a1-c7ff2bbcb6d6	1357	Notranje Gorice
00050000-5617-71e6-3283-376582a326f9	3203	Nova Cerkev
00050000-5617-71e6-572c-20d451187bde	5000	Nova Gorica 
00050000-5617-71e6-e23e-804f72733a61	5001	Nova Gorica - poštni predali
00050000-5617-71e6-a0eb-3181e06a085a	1385	Nova vas
00050000-5617-71e6-84a6-52c643ee8bb3	8000	Novo mesto
00050000-5617-71e6-14d6-602846aa6dfb	8001	Novo mesto - poštni predali
00050000-5617-71e6-b3dc-efd3d67550da	6243	Obrov
00050000-5617-71e6-6f33-dae036ee3fcf	9233	Odranci
00050000-5617-71e6-8618-8fba068f8a9b	2317	Oplotnica
00050000-5617-71e6-d7df-6dc1817eadef	2312	Orehova vas
00050000-5617-71e6-c453-51b1e1210fdd	2270	Ormož
00050000-5617-71e6-59a3-13e9d6c42ad4	1316	Ortnek
00050000-5617-71e6-3494-08d3975d9542	1337	Osilnica
00050000-5617-71e6-89cb-76a36c446024	8222	Otočec
00050000-5617-71e6-408f-57197ab11beb	2361	Ožbalt
00050000-5617-71e6-3a27-a6b4e7b6ebbd	2231	Pernica
00050000-5617-71e6-362b-c75cc75529ed	2211	Pesnica pri Mariboru
00050000-5617-71e6-7e6e-d8e79e46ac24	9203	Petrovci
00050000-5617-71e6-62e9-3750458fbe99	3301	Petrovče
00050000-5617-71e6-0b6c-1c1fc3548605	6330	Piran/Pirano
00050000-5617-71e6-6a87-fe0974faa8dd	8255	Pišece
00050000-5617-71e6-6844-353cd0fedd72	6257	Pivka
00050000-5617-71e6-bc82-db619bca33c5	6232	Planina
00050000-5617-71e6-c89c-8955fd3d9e88	3225	Planina pri Sevnici
00050000-5617-71e6-2d73-a9e13bcc2421	6276	Pobegi
00050000-5617-71e6-213a-0a80913a8b9a	8312	Podbočje
00050000-5617-71e6-d62c-7133afb18471	5243	Podbrdo
00050000-5617-71e6-f2a4-7e54b03d0034	3254	Podčetrtek
00050000-5617-71e6-3e98-6c94608d1950	2273	Podgorci
00050000-5617-71e6-29e1-70c8ad34ddfc	6216	Podgorje
00050000-5617-71e6-8c44-0b482dca47d7	2381	Podgorje pri Slovenj Gradcu
00050000-5617-71e6-5481-2de4a808d791	6244	Podgrad
00050000-5617-71e6-b876-541b6602c879	1414	Podkum
00050000-5617-71e6-5a5e-e98ec03bf5d2	2286	Podlehnik
00050000-5617-71e6-368e-b5b9da95f9a2	5272	Podnanos
00050000-5617-71e6-83da-a7b592490969	4244	Podnart
00050000-5617-71e6-b4bb-b0a356f5182e	3241	Podplat
00050000-5617-71e6-7b42-294f0e93e3fb	3257	Podsreda
00050000-5617-71e6-be6e-c50acab110fd	2363	Podvelka
00050000-5617-71e6-0d23-32205ded9fcf	2208	Pohorje
00050000-5617-71e6-79fb-36296f272ce5	2257	Polenšak
00050000-5617-71e6-6da7-62dc3a3523f2	1355	Polhov Gradec
00050000-5617-71e6-08ad-ceead9237682	4223	Poljane nad Škofjo Loko
00050000-5617-71e6-19a1-53f72d6dfacd	2319	Poljčane
00050000-5617-71e6-5671-a29b2471961f	1272	Polšnik
00050000-5617-71e6-5f2d-45af67e80369	3313	Polzela
00050000-5617-71e6-5b7d-76087076ea83	3232	Ponikva
00050000-5617-71e6-4530-07770504a3d8	6320	Portorož/Portorose
00050000-5617-71e6-d6f6-65e9c21fe663	6230	Postojna
00050000-5617-71e6-e675-ab8c2bd91919	2331	Pragersko
00050000-5617-71e6-558a-7070e709d077	3312	Prebold
00050000-5617-71e6-b4c2-c1bff08ffe5d	4205	Preddvor
00050000-5617-71e6-a74d-76c85c54eddd	6255	Prem
00050000-5617-71e6-0216-609d19ede971	1352	Preserje
00050000-5617-71e6-c588-680e3324da2f	6258	Prestranek
00050000-5617-71e6-f87a-cb9e17079a83	2391	Prevalje
00050000-5617-71e6-91ea-5a4226c8e3f9	3262	Prevorje
00050000-5617-71e6-36c4-4d8bf1d5b5ba	1276	Primskovo 
00050000-5617-71e6-308b-3cbf65611f09	3253	Pristava pri Mestinju
00050000-5617-71e6-ba7c-ac88f284c462	9207	Prosenjakovci/Partosfalva
00050000-5617-71e6-3ad8-05eab6b3f4e6	5297	Prvačina
00050000-5617-71e6-e177-4a31a0ffc0f4	2250	Ptuj
00050000-5617-71e6-8926-a6a4c0b3756f	2323	Ptujska Gora
00050000-5617-71e6-a308-f3a5b592fac8	9201	Puconci
00050000-5617-71e6-564b-f77953f34893	2327	Rače
00050000-5617-71e6-84da-9494aec2ae5a	1433	Radeče
00050000-5617-71e6-1cc1-10a039327ee9	9252	Radenci
00050000-5617-71e6-9aeb-e5657b671908	2360	Radlje ob Dravi
00050000-5617-71e6-f1ec-55fcf2fc84f0	1235	Radomlje
00050000-5617-71e6-3436-0a34830f2f5f	4240	Radovljica
00050000-5617-71e6-e49c-8b9ad1b270fa	8274	Raka
00050000-5617-71e6-dfd8-9c572a17edbc	1381	Rakek
00050000-5617-71e6-1e0b-7789cd1f0450	4283	Rateče - Planica
00050000-5617-71e6-7202-05cab54384e7	2390	Ravne na Koroškem
00050000-5617-71e6-47c3-1cd36dd2ffea	9246	Razkrižje
00050000-5617-71e6-114a-85bd813026c0	3332	Rečica ob Savinji
00050000-5617-71e6-4fb5-475500649ab2	5292	Renče
00050000-5617-71e6-5da8-4b97a5a41d24	1310	Ribnica
00050000-5617-71e6-23e3-801570cedebb	2364	Ribnica na Pohorju
00050000-5617-71e6-0be3-59d5fc3ba342	3272	Rimske Toplice
00050000-5617-71e6-0172-0565c8b2e3f5	1314	Rob
00050000-5617-71e6-80b4-6d6fa9293e2f	5215	Ročinj
00050000-5617-71e6-1306-2f52d2198a2d	3250	Rogaška Slatina
00050000-5617-71e6-b4b4-d5292b851dc5	9262	Rogašovci
00050000-5617-71e6-8ea8-bb520bdd5eab	3252	Rogatec
00050000-5617-71e6-ddcd-9e61ce2c90fc	1373	Rovte
00050000-5617-71e6-375c-976945d30838	2342	Ruše
00050000-5617-71e6-1599-a1ffbc1660cf	1282	Sava
00050000-5617-71e6-c60c-9786492df63d	6333	Sečovlje/Sicciole
00050000-5617-71e6-39b1-cb88071781b4	4227	Selca
00050000-5617-71e6-cbd1-79ec06eb8cc8	2352	Selnica ob Dravi
00050000-5617-71e6-64cc-d7c040882741	8333	Semič
00050000-5617-71e6-d741-b18f1c5a04de	8281	Senovo
00050000-5617-71e6-bc91-5c031ae3df61	6224	Senožeče
00050000-5617-71e6-d657-c7a362b77c24	8290	Sevnica
00050000-5617-71e6-4d52-e4daa3044100	6210	Sežana
00050000-5617-71e6-81be-e0301f3ae3c6	2214	Sladki Vrh
00050000-5617-71e6-0105-1a81ddbfaa19	5283	Slap ob Idrijci
00050000-5617-71e6-02a9-1e301eb4c866	2380	Slovenj Gradec
00050000-5617-71e6-23e1-c32054546317	2310	Slovenska Bistrica
00050000-5617-71e6-d960-102fa1a01d4e	3210	Slovenske Konjice
00050000-5617-71e6-7846-4d79c5ba2aea	1216	Smlednik
00050000-5617-71e6-da32-3bb10a5b6fee	5232	Soča
00050000-5617-71e6-583c-8722b187ffaa	1317	Sodražica
00050000-5617-71e6-fb31-fbac0946bd0d	3335	Solčava
00050000-5617-71e6-1fb5-550d41d398ce	5250	Solkan
00050000-5617-71e6-0c70-7377d4b9ee7b	4229	Sorica
00050000-5617-71e6-bf69-0cbd16dca77d	4225	Sovodenj
00050000-5617-71e6-988f-feaef35dc971	5281	Spodnja Idrija
00050000-5617-71e6-0196-fcfdbcd33efb	2241	Spodnji Duplek
00050000-5617-71e6-31ba-0db4cf9f9e23	9245	Spodnji Ivanjci
00050000-5617-71e6-5558-be88ed29ea26	2277	Središče ob Dravi
00050000-5617-71e6-3a78-52269a4f438c	4267	Srednja vas v Bohinju
00050000-5617-71e6-2096-a25338dd6696	8256	Sromlje 
00050000-5617-71e6-970f-761b4bccef64	5224	Srpenica
00050000-5617-71e6-a697-d08cb808c410	1242	Stahovica
00050000-5617-71e6-2ec9-5f4f86ecc07b	1332	Stara Cerkev
00050000-5617-71e6-b0ee-2d60149cb9bb	8342	Stari trg ob Kolpi
00050000-5617-71e6-f503-bcb6b53bce95	1386	Stari trg pri Ložu
00050000-5617-71e6-a5f6-5cb7d9e861a2	2205	Starše
00050000-5617-71e6-328c-b4a84c737b2b	2289	Stoperce
00050000-5617-71e6-8a91-003544a3caa1	8322	Stopiče
00050000-5617-71e6-0a8d-26849968a9f3	3206	Stranice
00050000-5617-71e6-137e-c22cff36c252	8351	Straža
00050000-5617-71e6-7e29-6f4d313921f0	1313	Struge
00050000-5617-71e6-0d12-470543e91a3a	8293	Studenec
00050000-5617-71e6-0feb-93d5d3dbb39e	8331	Suhor
00050000-5617-71e6-e969-05c0834a21fb	2233	Sv. Ana v Slovenskih goricah
00050000-5617-71e6-125b-728bb4aceaa6	2235	Sv. Trojica v Slovenskih goricah
00050000-5617-71e6-a4fa-12be98a27bfc	2353	Sveti Duh na Ostrem Vrhu
00050000-5617-71e6-c773-26781f3822d9	9244	Sveti Jurij ob Ščavnici
00050000-5617-71e6-9ac8-5ad7831629a4	3264	Sveti Štefan
00050000-5617-71e6-69a8-0fb580a01d15	2258	Sveti Tomaž
00050000-5617-71e6-a211-fb1478025c36	9204	Šalovci
00050000-5617-71e6-bac4-d4625a7b7f17	5261	Šempas
00050000-5617-71e6-52cd-7674775b29c9	5290	Šempeter pri Gorici
00050000-5617-71e6-2f62-15bb957c6fc5	3311	Šempeter v Savinjski dolini
00050000-5617-71e6-c41a-a1a75faaa5c2	4208	Šenčur
00050000-5617-71e6-2d3c-c018cdc3c5a0	2212	Šentilj v Slovenskih goricah
00050000-5617-71e6-cb0b-6bf1aeae1be3	8297	Šentjanž
00050000-5617-71e6-89b9-d153a892ac39	2373	Šentjanž pri Dravogradu
00050000-5617-71e6-a1f6-ed9a3f9d2602	8310	Šentjernej
00050000-5617-71e6-618d-3c7b95bafe91	3230	Šentjur
00050000-5617-71e6-5a72-661b38349264	3271	Šentrupert
00050000-5617-71e6-84dd-86342bba84d3	8232	Šentrupert
00050000-5617-71e6-9d69-34daf2d40fec	1296	Šentvid pri Stični
00050000-5617-71e6-cfb7-41e0c3e3f038	8275	Škocjan
00050000-5617-71e6-c78d-26088c219a4b	6281	Škofije
00050000-5617-71e6-a4de-72c553028e6b	4220	Škofja Loka
00050000-5617-71e6-9407-703dae2187fb	3211	Škofja vas
00050000-5617-71e6-af3a-52d4840f3a11	1291	Škofljica
00050000-5617-71e6-6c9c-1dca005f6494	6274	Šmarje
00050000-5617-71e6-3cf5-4134eaebd8d7	1293	Šmarje - Sap
00050000-5617-71e6-5fbf-e1a67942699b	3240	Šmarje pri Jelšah
00050000-5617-71e6-23a1-49dff288c718	8220	Šmarješke Toplice
00050000-5617-71e6-cf8d-689d7b9f960e	2315	Šmartno na Pohorju
00050000-5617-71e6-445a-e9e32a9d7d91	3341	Šmartno ob Dreti
00050000-5617-71e6-d381-e9aee175a52e	3327	Šmartno ob Paki
00050000-5617-71e6-90c2-b39591ed1caa	1275	Šmartno pri Litiji
00050000-5617-71e6-ead1-94c6267421cd	2383	Šmartno pri Slovenj Gradcu
00050000-5617-71e6-5949-cf64b04a5981	3201	Šmartno v Rožni dolini
00050000-5617-71e6-83f3-e124574f3abf	3325	Šoštanj
00050000-5617-71e6-c68a-f9b0700da2f8	6222	Štanjel
00050000-5617-71e6-6b31-3092a5425e0c	3220	Štore
00050000-5617-71e6-233c-9447706c005a	3304	Tabor
00050000-5617-71e6-508a-1dd85bd9d03b	3221	Teharje
00050000-5617-71e6-291e-31c71504221c	9251	Tišina
00050000-5617-71e6-7a5d-068b28a05463	5220	Tolmin
00050000-5617-71e6-b50a-41b4c738589a	3326	Topolšica
00050000-5617-71e6-10f5-61ba463c7b71	2371	Trbonje
00050000-5617-71e6-0c70-1feed95b6ebd	1420	Trbovlje
00050000-5617-71e6-3377-02ae2b482b9d	8231	Trebelno 
00050000-5617-71e6-2180-da4ec4bbd7af	8210	Trebnje
00050000-5617-71e6-3f54-945285009c0b	5252	Trnovo pri Gorici
00050000-5617-71e6-dca0-9394624621e9	2254	Trnovska vas
00050000-5617-71e6-7d6c-bcf3fa70bc3f	1222	Trojane
00050000-5617-71e6-dc0c-2d8c7a384f43	1236	Trzin
00050000-5617-71e6-88fb-add333169650	4290	Tržič
00050000-5617-71e6-7b24-de9f23ccc1c8	8295	Tržišče
00050000-5617-71e6-4cb7-85cf3d252fd6	1311	Turjak
00050000-5617-71e6-b21c-9b5fcb8af377	9224	Turnišče
00050000-5617-71e6-8ef3-afc73894e80f	8323	Uršna sela
00050000-5617-71e6-0aec-f576239a7f7a	1252	Vače
00050000-5617-71e6-a210-55d62603468b	3320	Velenje 
00050000-5617-71e6-54f6-8fe137e7198d	3322	Velenje - poštni predali
00050000-5617-71e6-f103-c27c9ec6c75d	8212	Velika Loka
00050000-5617-71e6-bb56-e4634b1c9cd0	2274	Velika Nedelja
00050000-5617-71e6-e9a8-0e2bf7783410	9225	Velika Polana
00050000-5617-71e6-63e9-501db57bd1bc	1315	Velike Lašče
00050000-5617-71e6-9e66-14be414234a4	8213	Veliki Gaber
00050000-5617-71e6-6f88-74233066b5ab	9241	Veržej
00050000-5617-71e6-fe24-5d89442d6a57	1312	Videm - Dobrepolje
00050000-5617-71e6-0755-736af44a99e3	2284	Videm pri Ptuju
00050000-5617-71e6-078c-aec4cfce9f55	8344	Vinica
00050000-5617-71e6-5390-ce215b0c080b	5271	Vipava
00050000-5617-71e6-6273-6cfd0c3abbc6	4212	Visoko
00050000-5617-71e6-edf9-f5b62f65ec05	1294	Višnja Gora
00050000-5617-71e6-6867-70e51a181d9b	3205	Vitanje
00050000-5617-71e6-17cb-813ce77f1fdd	2255	Vitomarci
00050000-5617-71e6-82e5-3bc0727e717d	1217	Vodice
00050000-5617-71e6-3be0-3900ac6134a0	3212	Vojnik\t
00050000-5617-71e6-a93f-a2a8ad3bc48f	5293	Volčja Draga
00050000-5617-71e6-4f4b-c0ce18dfbd58	2232	Voličina
00050000-5617-71e6-c91f-72c993407dc0	3305	Vransko
00050000-5617-71e6-d2ca-2c50c4366092	6217	Vremski Britof
00050000-5617-71e6-d5fe-e84834021440	1360	Vrhnika
00050000-5617-71e6-44c3-c5fd79448579	2365	Vuhred
00050000-5617-71e6-afd8-c9eaa4bae70c	2367	Vuzenica
00050000-5617-71e6-7c43-4590927b6c6e	8292	Zabukovje 
00050000-5617-71e6-26bd-2bcd9ecf3aca	1410	Zagorje ob Savi
00050000-5617-71e6-138a-51a973f809dc	1303	Zagradec
00050000-5617-71e6-789e-1dc83c25f3a0	2283	Zavrč
00050000-5617-71e6-0281-053cace54fc1	8272	Zdole 
00050000-5617-71e6-fd95-a4ac02559330	4201	Zgornja Besnica
00050000-5617-71e6-1e9e-d9f9a1fef531	2242	Zgornja Korena
00050000-5617-71e6-e4ec-bf05df0e730d	2201	Zgornja Kungota
00050000-5617-71e6-e875-b5c5228df7cd	2316	Zgornja Ložnica
00050000-5617-71e6-81ae-e2e625ef9682	2314	Zgornja Polskava
00050000-5617-71e6-45f8-cd50cd9dbfc2	2213	Zgornja Velka
00050000-5617-71e6-d19f-ab458d340457	4247	Zgornje Gorje
00050000-5617-71e6-f826-8c758ef87341	4206	Zgornje Jezersko
00050000-5617-71e6-9977-66e909e38a37	2285	Zgornji Leskovec
00050000-5617-71e6-7b7e-92d44f743026	1432	Zidani Most
00050000-5617-71e6-71e9-c8c77b28cae1	3214	Zreče
00050000-5617-71e6-4367-7b8738fb14e1	4209	Žabnica
00050000-5617-71e6-c9a2-b60585aba52a	3310	Žalec
00050000-5617-71e6-f397-3120e45fba1f	4228	Železniki
00050000-5617-71e6-9c9c-1c5e6a6f06f1	2287	Žetale
00050000-5617-71e6-e46b-9d429c7e9afd	4226	Žiri
00050000-5617-71e6-f5a5-e99bb8dda72a	4274	Žirovnica
00050000-5617-71e6-94de-ce23be6f8406	8360	Žužemberk
\.


--
-- TOC entry 3045 (class 0 OID 21583061)
-- Dependencies: 232
-- Data for Name: postavkacdve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkacdve (id, skupina, podskupina, naziv, vrpremiere, vrponovitvepremier, vrponovitveprejsnjih, vrgostovanjazamejstvo, vrfestivali, vrgostovanjaint, vrostalo, programdela_id) FROM stdin;
\.


--
-- TOC entry 3018 (class 0 OID 21582666)
-- Dependencies: 205
-- Data for Name: postavkaracuna; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkaracuna (id, racun_id) FROM stdin;
\.


--
-- TOC entry 2999 (class 0 OID 21582446)
-- Dependencies: 186
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
00060000-5617-71e9-2321-6a4e341dcefb	00080000-5617-71e9-2c5a-5c1fc1ee42fb	\N	00040000-5617-71e7-1e3b-f01ed14eaa7e	Narodni dom	\N	Koroška 15	\N	9231	Beltinci	\N	f	t
00060000-5617-71e9-d7e5-d4e643742502	00080000-5617-71e9-2c5a-5c1fc1ee42fb	\N	00040000-5617-71e7-1e3b-f01ed14eaa7e	Korotan	\N	Koroška 22	\N	9231	Beltinci	\N	f	f
00060000-5617-71e9-85bd-9641489de3ff	00080000-5617-71e9-de08-d78858b3dd93	\N	00040000-5617-71e7-1e3b-f01ed14eaa7e	Rimljan	\N	Rimska ploščad 7	\N	9231	Beltinci	\N	f	t
\.


--
-- TOC entry 3007 (class 0 OID 21582550)
-- Dependencies: 194
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, zaporedna, objavljenzacetek, porocilo) FROM stdin;
\.


--
-- TOC entry 3020 (class 0 OID 21582678)
-- Dependencies: 207
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 3046 (class 0 OID 21583075)
-- Dependencies: 233
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, koproducent_id, odstotekfinanciranja, delez, maticnikop, kpe, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 3047 (class 0 OID 21583085)
-- Dependencies: 234
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, sifra, status) FROM stdin;
00190000-5617-71e9-a76e-f3036f152fac	00080000-5617-71e9-6328-e0ea957a11b0	0987	AK
00190000-5617-71e9-6db7-986f12cd4b21	00080000-5617-71e9-de08-d78858b3dd93	0989	AK
00190000-5617-71e9-eab2-4e646497ab0c	00080000-5617-71e9-3ce7-d032014d7841	0986	AK
00190000-5617-71e9-2272-ea451772b15d	00080000-5617-71e9-2c92-59e94afcf22c	0984	AK
00190000-5617-71e9-933d-e8df5f858fe8	00080000-5617-71e9-95f9-1953693a97de	0983	AK
00190000-5617-71e9-6596-2d407ecde219	00080000-5617-71e9-bfaa-41c03d1adce2	0982	AK
00190000-5617-71eb-c4fc-96a05fd835e0	00080000-5617-71eb-bf72-60274bf41482	1001	AK
\.


--
-- TOC entry 3044 (class 0 OID 21583008)
-- Dependencies: 231
-- Data for Name: programdela; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programdela (id, sifra, naziv, zacetek, konec, zakljuceno, potrjenprogram, stpremier, stpremiervelikih, stpremiermalih, stpremiermalihkopr, stpremiervelikihkopr, stpremiersredkopr, stint, stfest, strazno, stizjem, stponprem, stponprej, stponprejvelikih, stponprejmalih, stponprejmalihkopr, stponprejsredkopr, stponprejvelikihkopr, stgostujo, vrps1, vrps1do, vrps1mat, vrps1gostovsz, stizvnekomerc, stizvprem, stizvpremdoma, stizvpremkopr, stizvponprem, stizvponpremdoma, stizvponpremzamejo, stizvponpremgost, stizvponpremkopr, stizvponpremint, stizvponpremkoprint, stizvponprej, stizvponprejdoma, stizvponprejzamejo, stizvponprejgost, stizvponprejkopr, stizvponprejint, stizvponprejkoprint, stizvgostuj, stizvostalihnek, stizvgostovanjslo, stizvgostovanjzam, stizvgostovanjint, stobisknekom, stobisknekommat, stobisknekomgostslo, stobisknekomgostzam, stobisknekomgostint, stobiskprem, stobiskpremdoma, stobiskpremkopr, stobiskponprem, stobiskponpremdoma, stobiskponpremkopr, stobiskponpremkoprint, stobiskponpremgost, stobiskponpremzamejo, stobiskponpremint, avgobiskprired, avgzaseddvoran, avgcenavstopnice, stprodvstopnic, stkoprodukcij, stkoprodukcijint, stkoprodukcijnvo, stzaposlenih, stzaposigralcev, avgstnastopovigr, sthonorarnihzun, sthonorarnihzunigr, sthonorarnihzunigrtujjz, sthonorarnihzunsamoz, sredstvaint, sredstvaavt, sredstvazaprosenoprem, sredstvazaprosenoponprem, sredstvazaprosenoponprej, sredstvazaprosenogostujo, sredstvazaprosenoint, sredstvazaprosenofest, sredstvazaprosenorazno, sredstvazaprosenoizjem, sredstvadrugijavniprem, sredstvadrugijavniponprem, sredstvadrugijavniponprej, sredstvadrugijavnigostujo, sredstvadrugijavniint, sredstvadrugijavnifest, sredstvadrugijavnirazno, sredstvadrugijavniizjem, sredstvadrugiviriprem, sredstvadrugiviriponprem, sredstvadrugiviriponprej, sredstvadrugivirigostujo, sredstvadrugiviriint, sredstvadrugivirifest, sredstvadrugivirirazno, sredstvadrugiviriizjem, sredstvaavtsamoz) FROM stdin;
00290000-5617-71e9-1afd-672316b6175b	0001	Testni program dela	2016-02-01	2017-02-01	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 3048 (class 0 OID 21583093)
-- Dependencies: 235
-- Data for Name: programskaenotasklopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programskaenotasklopa (id, naslovpe, avtorpe, obsegpe, mesecpe, vrednostpe, obiskdoma, programrazno_id) FROM stdin;
\.


--
-- TOC entry 3024 (class 0 OID 21582707)
-- Dependencies: 211
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, popa_id, naslov_id, sifra, naziv, jeprizorisce, jematicnioder, seplanira, kapaciteta, opis) FROM stdin;
00220000-5617-71e9-d24a-17862570d3be	\N	\N	0001	Poskusna 1	f	\N	t	8	Poskusna učilnica v prvem
00220000-5617-71e9-7b4a-0746bd86225d	\N	\N	0002	Poskusna 3	f	\N	f	34	Poskusna učilnica v tretjem
00220000-5617-71e9-c4e9-535d212fcd86	\N	\N	0003	Kazinska	t	\N	t	84	Kazinska dvorana
00220000-5617-71e9-1658-b8430a5ae1b5	\N	\N	0004	Mali oder	t	\N	t	24	Mali oder 
00220000-5617-71e9-7eaf-c07cf07a3d00	\N	\N	0005	Komorni oder	t	\N	t	150	Komorni oder
00220000-5617-71e9-dcb0-ff5080226f30	\N	\N	0006	Stara dvorana	t	\N	t	96	Stara dvorana ali dvorana Franceta Prešerna
00220000-5617-71e9-720e-df100de42ef0	\N	\N	0007	Velika dvorana	t	\N	t	160	Velika, glavna dvorana
\.


--
-- TOC entry 3016 (class 0 OID 21582651)
-- Dependencies: 203
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 3015 (class 0 OID 21582641)
-- Dependencies: 202
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 3037 (class 0 OID 21582851)
-- Dependencies: 224
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta, status) FROM stdin;
\.


--
-- TOC entry 3031 (class 0 OID 21582781)
-- Dependencies: 218
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 3005 (class 0 OID 21582524)
-- Dependencies: 192
-- Data for Name: report; Type: TABLE DATA; Schema: public; Owner: -
--

COPY report (id, job_id, title, filename, transfers, size, format, hash, createdat) FROM stdin;
\.


--
-- TOC entry 2988 (class 0 OID 21582319)
-- Dependencies: 175
-- Data for Name: revizije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY revizije (id, razred, objectid, upor, datum, tip, data) FROM stdin;
1	App\\Entity\\Popa	00080000-5617-71eb-bf72-60274bf41482	00010000-5617-71e7-940a-3317f03381fd	2015-10-09 09:51:07	INS	a:0:{}
2	App\\Entity\\Option	00000000-5617-71eb-6bff-238f63a4d897	00010000-5617-71e7-940a-3317f03381fd	2015-10-09 09:51:07	INS	a:0:{}
3	ProgramDela\\Entity\\ProdukcijskaHisa	00190000-5617-71eb-c4fc-96a05fd835e0	00010000-5617-71e7-940a-3317f03381fd	2015-10-09 09:51:07	INS	a:0:{}
\.


--
-- TOC entry 3067 (class 0 OID 0)
-- Dependencies: 174
-- Name: revizije_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('revizije_id_seq', 3, true);


--
-- TOC entry 3025 (class 0 OID 21582720)
-- Dependencies: 212
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 2992 (class 0 OID 21582357)
-- Dependencies: 179
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-5617-71e7-e7e4-28d6ee3e37a7	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-5617-71e7-00f3-6d2782d1f5cd	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-5617-71e7-f5ea-d82541ed3916	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-5617-71e7-3a9f-880f77a0d4a3	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-5617-71e7-7bd4-b6bab7f09c09	planer	Planer dogodkov v koledarju	t
00020000-5617-71e7-b1b1-00a9ffa553df	kadrovska	Kadrovska služba	t
00020000-5617-71e7-ea31-6d20268f2f62	arhivar	Ažuriranje arhivalij	t
00020000-5617-71e7-b7cd-7a3cbf8a7231	igralec	Igralec	t
00020000-5617-71e7-9017-20ebe96f6bd0	prisotnost	Vnašalec prisotnosti, tudi za tiste izven uprizoritev	t
00020000-5617-71e9-79ca-be405c113588	vsadovoljenja	Vloga z vsemi posameznimi dovoljenji	t
\.


--
-- TOC entry 2990 (class 0 OID 21582341)
-- Dependencies: 177
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-5617-71e7-0f95-c4c16aac404e	00020000-5617-71e7-f5ea-d82541ed3916
00010000-5617-71e7-940a-3317f03381fd	00020000-5617-71e7-f5ea-d82541ed3916
00010000-5617-71e9-f68b-ee670e9eb00a	00020000-5617-71e9-79ca-be405c113588
\.


--
-- TOC entry 3027 (class 0 OID 21582734)
-- Dependencies: 214
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 3019 (class 0 OID 21582672)
-- Dependencies: 206
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 3013 (class 0 OID 21582618)
-- Dependencies: 200
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, sifra, ime, zacetek, konec, aktivna) FROM stdin;
\.


--
-- TOC entry 2986 (class 0 OID 21582306)
-- Dependencies: 173
-- Data for Name: stevilcenje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenje (id, sifra, naziv, prefix, suffix, zacetek, dolzina, format, globalno, poletih) FROM stdin;
00230000-5617-71e6-0e72-e7797089b19c	pri	Privzeto številčenje po letih YYYY-N	\N	\N	1	1	%l-%n	f	t
00230000-5617-71e6-9ecb-2fb4436d8678	123	Privzeto številčenje kratkih šifer	\N	\N	100	3	%n	f	f
00230000-5617-71e6-445a-174662e69ff6	bcd	Globalno številčenje črtnih kod	\N	\N	1	9	%n	t	f
00230000-5617-71e6-fee8-c8bf92a7dce4	sif	Številčenje šifrant	\N	\N	1000	4	%n	f	f
00230000-5617-71e6-f7ca-7acc51084e61	tmp	Globalno številčenje začasnih številk	tmp	\N	1000	5	%l%n	t	t
\.


--
-- TOC entry 2985 (class 0 OID 21582298)
-- Dependencies: 172
-- Data for Name: stevilcenjekonfig; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjekonfig (id, stevilcenje_id, dok) FROM stdin;
00240000-5617-71e6-4c75-142daa6e97d9	00230000-5617-71e6-fee8-c8bf92a7dce4	popa
00240000-5617-71e6-15bf-6f6b682c7463	00230000-5617-71e6-fee8-c8bf92a7dce4	oseba
00240000-5617-71e6-c988-152cf516f704	00230000-5617-71e6-fee8-c8bf92a7dce4	sezona
00240000-5617-71e6-8b5b-bfb30a901198	00230000-5617-71e6-9ecb-2fb4436d8678	prostor
00240000-5617-71e6-4452-4e37edffe24e	00230000-5617-71e6-fee8-c8bf92a7dce4	besedilo
00240000-5617-71e6-a5cf-a5e17d163a1d	00230000-5617-71e6-fee8-c8bf92a7dce4	uprizoritev
00240000-5617-71e6-0a05-7907904edf7d	00230000-5617-71e6-fee8-c8bf92a7dce4	funkcija
00240000-5617-71e6-4bda-80bef18336ae	00230000-5617-71e6-fee8-c8bf92a7dce4	tipfunkcije
00240000-5617-71e6-71f9-9138956592b5	00230000-5617-71e6-fee8-c8bf92a7dce4	alternacija
00240000-5617-71e6-b77b-c81b606c4707	00230000-5617-71e6-0e72-e7797089b19c	pogodba
00240000-5617-71e6-f39e-7c81bb361144	00230000-5617-71e6-fee8-c8bf92a7dce4	zaposlitev
00240000-5617-71e6-0348-eb2955024964	00230000-5617-71e6-fee8-c8bf92a7dce4	zvrstuprizoritve
00240000-5617-71e6-1102-73af24838175	00230000-5617-71e6-0e72-e7797089b19c	programdela
00240000-5617-71e6-c0e5-02ba4ef982a9	00230000-5617-71e6-fee8-c8bf92a7dce4	zapis
\.


--
-- TOC entry 2984 (class 0 OID 21582293)
-- Dependencies: 171
-- Data for Name: stevilcenjestanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjestanje (id, objid, leto, stevilka) FROM stdin;
5880bf28-9a72-4550-ba36-68fb2085c18a	00240000-5617-71e6-4c75-142daa6e97d9	0	1001
\.


--
-- TOC entry 3033 (class 0 OID 21582798)
-- Dependencies: 220
-- Data for Name: strosekuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY strosekuprizoritve (id, uprizoritev_id, popa_id, naziv, vrednostdo, vrednostna, opis, tipstroska, sort, vrstastroska_id) FROM stdin;
00270000-5617-71e9-ac18-9441092f6ae9	000e0000-5617-71e9-d176-f0e29cac65f1	00080000-5617-71e9-2c5a-5c1fc1ee42fb	Nabava kostumov	600.50	20.00	Krila in maske	materialni	1	003b0000-5617-71e7-4798-909ce6c67f00
00270000-5617-71e9-ade8-fb323ff3440d	000e0000-5617-71e9-d176-f0e29cac65f1	00080000-5617-71e9-2c5a-5c1fc1ee42fb	Zavese	125.70	3.10	Modra in zelena zavesa	materialni	2	003b0000-5617-71e7-4798-909ce6c67f00
\.


--
-- TOC entry 2997 (class 0 OID 21582419)
-- Dependencies: 184
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 3014 (class 0 OID 21582628)
-- Dependencies: 201
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja) FROM stdin;
001a0000-5617-71e9-e4a3-eeaa94ce364c	00180000-5617-71e9-393a-9061bac260ff	000c0000-5617-71e9-31c9-0286e5295817	00090000-5617-71e9-ca31-64199d188bb1	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-5617-71e9-8e6b-970ba72d81e4	00180000-5617-71e9-393a-9061bac260ff	000c0000-5617-71e9-f3c4-04a030e6aec8	00090000-5617-71e9-e467-f4ad0fa61fd2	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-5617-71e9-6b15-a416c491752d	00180000-5617-71e9-393a-9061bac260ff	000c0000-5617-71e9-8a65-d088d8eadbf3	00090000-5617-71e9-a782-5973fbc007ba	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-5617-71e9-ae76-f5fdede460f5	00180000-5617-71e9-393a-9061bac260ff	000c0000-5617-71e9-cc09-e602252aa1c8	00090000-5617-71e9-58db-d9ff812c1162	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-5617-71e9-5073-80de58650d07	00180000-5617-71e9-393a-9061bac260ff	000c0000-5617-71e9-a39a-02015e6556a4	00090000-5617-71e9-b4d5-02e1530e628b	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-5617-71e9-508e-40f732ff228c	00180000-5617-71e9-65f1-d5103714f98b	\N	00090000-5617-71e9-b4d5-02e1530e628b	2015-08-01 20:00:00	2015-08-01 23:00:00	\N	\N	2.00
\.


--
-- TOC entry 3036 (class 0 OID 21582839)
-- Dependencies: 223
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, sifra, ime, opis, imezenski, podrocje, sort) FROM stdin;
000f0000-5617-71e6-2708-9bd88b50f3b7	01	Avtor	Avtorji	Avtorka	umetnik	150
000f0000-5617-71e6-ff18-2bd461d35525	02	Priredba	Priredba	Priredba	umetnik	160
000f0000-5617-71e6-2ca8-f37cb0aa29a9	03	Prevod	Prevod	Prevod	umetnik	20
000f0000-5617-71e6-55a3-8b1161dffd7a	04	Režija	Režija	Režija	umetnik	30
000f0000-5617-71e6-8e4b-38f7ac1739db	05	Dramaturgija	Dramaturgija	Dramaturgija	umetnik	40
000f0000-5617-71e6-b41b-3e504959077e	06	Scenografija	Scenografija	Scenografija	umetnik	60
000f0000-5617-71e6-81a3-06db1f01799e	07	Kostumografija	Kostumografija	Kostumografija	umetnik	70
000f0000-5617-71e6-a7c2-f61ded5844b9	08	Koreografija	Koreografija	Koreografija	umetnik	90
000f0000-5617-71e6-e10c-6eb7ae32b05c	09	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	umetnik	100
000f0000-5617-71e6-72ce-b31b7868c08f	10	Oblikovanje maske	Oblikovanje maske	Oblikovanje maske	umetnik	110
000f0000-5617-71e6-d604-325d9b606b1d	11	Lektorstvo	Lektorstvo	Lektorstvo	umetnik	50
000f0000-5617-71e6-b0f7-9270739ad62b	12	Glasbeni soustvarjalec	Glasbeni soustvarjalci	Glasbena soustvarjalka	umetnik	80
000f0000-5617-71e6-77ee-37b6892b4656	13	Intermedijski ustvarjalec	Intermedijski ustvarjalci	Intermedijski ustvarjalka	umetnik	130
000f0000-5617-71e6-6714-0bfbe0fbb1da	14	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	umetnik	120
000f0000-5617-71e6-9aa6-29823cbadb4a	15	Vloga	Intermedijski ustvarjalci	Intermedijska ustvarjalka	igralec	10
000f0000-5617-71e6-9b34-3aef49556220	16	Produkcija, mentorstvo	Produkcija, mentorstvo	Produkcija, mentorstvo	umetnik	140
000f0000-5617-71e6-1be2-86d85bdbcb51	17	Tehnična podpora	Tehnična podpora	Tehnična podpora	tehnik	180
000f0000-5617-71e6-f024-74446f5499f0	18	Inšpicient	Inšpicienti	Inšpicientka	inspicient	170
\.


--
-- TOC entry 3049 (class 0 OID 21583104)
-- Dependencies: 236
-- Data for Name: tipprogramskeenote; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipprogramskeenote (id, sifra, naziv, koprodukcija, maxfaktor, maxvsi) FROM stdin;
002b0000-5617-71e6-a28e-b6d88865912b	01	Velika predstava	f	1.00	1.00
002b0000-5617-71e6-bcc8-c5d6e13eeb47	02	Mala predstava	f	0.50	0.50
002b0000-5617-71e6-e98e-8641b3890653	03	Mala koprodukcija	t	0.40	1.00
002b0000-5617-71e6-e609-bcef4461b491	04	Srednja koprodukcija	t	0.70	2.00
002b0000-5617-71e6-b80f-b19a6af7b654	05	Velika koprodukcija	t	1.00	3.00
\.


--
-- TOC entry 3002 (class 0 OID 21582481)
-- Dependencies: 189
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 2989 (class 0 OID 21582328)
-- Dependencies: 176
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-5617-71e7-940a-3317f03381fd	Konzolni	$2y$05$NS4xMjkyMTcwMzExMjAxROFHggpeUzbiX6mKz1TR5E7GwwrxDuiGy	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-5617-71e9-fc47-6c38676f6970	testni uporabnik za inšpicienta	$2y$05$NS4xMjkyMTcwMzExMjAxROxkJ1B6xAXex6EZLIwJfWzRJ8DpfecFO	t	\N	\N	\N	ivo@ifigenija.si	\N	\N	\N
00010000-5617-71e9-d547-1a2c048e567f	testni uporabnik za Tehničnega vodjo	$2y$05$NS4xMjkyMTcwMzExMjAxROu/kXWR9sP9oamkesKuxXLbxkCb387.G	t	\N	\N	\N	tona@ifigenija.si	\N	\N	\N
00010000-5617-71e9-ea0c-bfd8538399c7	testni uporabnik za igralca	$2y$05$NS4xMjkyMTcwMzExMjAxRO/hLCgClfERRsfCAFYwxNCcFIVjP2982	t	\N	\N	\N	irena@ifigenija.si	\N	\N	\N
00010000-5617-71e9-546f-309d725577b0	testni uporabnik vnašalca termina storitev (TerminStoritve-vse)	$2y$05$NS4xMjkyMTcwMzExMjAxROT6.kTHqEq4.wa2SOnf124/N14m9qeP.	t	\N	\N	\N	tatjana@ifigenija.si	\N	\N	\N
00010000-5617-71e9-2457-a47a473d19bb	testni uporabnik, ki je inšpicient brez zapisov v TerminStoritve	$2y$05$NS4xMjkyMTcwMzExMjAxROHau47Dtb7CME5.nlWwBVM.nusFP.ra2	t	\N	\N	\N	joze@ifigenija.si	\N	\N	\N
00010000-5617-71e9-8438-fb681846831a	testna uporabnica, ki je planerka	$2y$05$NS4xMjkyMTcwMzExMjAxRO.B/uJO3C7QRNhdX9Q2hTLQsSupj1V1S	t	\N	\N	\N	petra@ifigenija.si	\N	\N	\N
00010000-5617-71e9-929b-0d9e88a1e011	testni uporabnik, ki dobi ifi-all vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROv2d7jqhaV/Mz3EIsKoi7UoFR.SDSMBm	t	\N	\N	\N	ali@ifigenija.si	\N	\N	\N
00010000-5617-71e9-b8ee-33bff513a4d6	testni uporabnik, ki dobi ifi-readall vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROYB9g.gnkufr1l/gWK6mkx.ySqrOWnJC	t	\N	\N	\N	berta@ifigenija.si	\N	\N	\N
00010000-5617-71e9-37c4-28947c21a059	testni uporabnik, ki dobi aaa-write dovoljenje	$2y$05$NS4xMjkyMTcwMzExMjAxRORujYObKX.DzpXVYbePkiJkHqg0/Ylya	t	\N	\N	\N	aaron@ifigenija.si	\N	\N	\N
00010000-5617-71e9-f68b-ee670e9eb00a	testni uporabnik ki dobi vsa posamezna dovoljenja	$2y$05$NS4xMjkyMTcwMzExMjAxRO2ymwxVXTr7U4Ncdn.bN49E8rLw9Jg0O	t	\N	\N	\N	vesna@ifigenija.si	\N	\N	\N
00010000-5617-71e7-0f95-c4c16aac404e	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 3040 (class 0 OID 21582889)
-- Dependencies: 227
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, producent_id, sifra, faza, naslov, podnaslov, delovninaslov, internacionalninaslov, naslovizvirnika, podnaslovizvirnika, datumzacstudija, stevilovaj, planiranostevilovaj, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, krstna, prvaslovenska, kratkinaslov, jekoprodukcija, maticnioder_id) FROM stdin;
000e0000-5617-71e9-77e2-85dc9fb5b3f6	00160000-5617-71e9-ac6a-5e4495bd6560	\N	00140000-5617-71e6-3f16-b0212684e958	\N	0001	produkcija	Sen kresne noči		Sanje	\N	\N	\N	2016-02-01	\N	\N	2016-06-01	1	William  Shakespeare - Nebojša  Kavader	f	2				\N	f	\N	\N		\N	00220000-5617-71e9-7eaf-c07cf07a3d00
000e0000-5617-71e9-d176-f0e29cac65f1	00160000-5617-71e9-0bc0-e573c936f0d4	\N	00140000-5617-71e6-2a28-b3cdff27c737	\N	0002	predprodukcija-ideja	Smoletov vrt			\N	\N	\N	2016-01-01	\N	\N	2016-04-20	2	Berta   Hočevar	f	2				\N	f	\N	\N		\N	00220000-5617-71e9-dcb0-ff5080226f30
000e0000-5617-71e9-3ef1-f799cbe527b2	\N	\N	00140000-5617-71e6-2a28-b3cdff27c737	00190000-5617-71e9-a76e-f3036f152fac	0003	postprodukcija	Kisli maček			\N	\N	\N	2016-02-01	\N	\N	2016-04-20	2	\N	t	2				\N	f	\N	\N		\N	00220000-5617-71e9-7eaf-c07cf07a3d00
000e0000-5617-71e9-654b-cf26af540207	\N	\N	00140000-5617-71e6-2a28-b3cdff27c737	00190000-5617-71e9-a76e-f3036f152fac	0004	postprodukcija	Vladimir			\N	\N	\N	2017-03-01	\N	\N	2017-04-20	2	\N	t	2				\N	f	\N	\N		\N	00220000-5617-71e9-7eaf-c07cf07a3d00
000e0000-5617-71e9-d41c-2648343a5c12	\N	\N	00140000-5617-71e6-2a28-b3cdff27c737	00190000-5617-71e9-a76e-f3036f152fac	0005	postprodukcija	Španska princesa			\N	\N	\N	2017-04-01	\N	\N	2017-05-20	1	\N	f	1				\N	f	\N	\N		\N	00220000-5617-71e9-d24a-17862570d3be
000e0000-5617-71e9-57d8-5f31a7a35f88	\N	\N	00140000-5617-71e6-2a28-b3cdff27c737	00190000-5617-71e9-a76e-f3036f152fac	0006	postprodukcija	Ne vemo datumov			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-5617-71e9-d24a-17862570d3be
\.


--
-- TOC entry 3009 (class 0 OID 21582572)
-- Dependencies: 196
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, uprizoritev_id, vrsta, zaporedna, porocilo) FROM stdin;
00200000-5617-71e9-40b9-aa774e9c72bb	000e0000-5617-71e9-d176-f0e29cac65f1	\N	1	
00200000-5617-71e9-b1a2-43b562dad0b4	000e0000-5617-71e9-d176-f0e29cac65f1	\N	2	
00200000-5617-71e9-bf8b-f109a001087f	000e0000-5617-71e9-d176-f0e29cac65f1	\N	3	
00200000-5617-71e9-8686-252a115a9715	000e0000-5617-71e9-d176-f0e29cac65f1	\N	4	
00200000-5617-71e9-3c9d-c92aafe7af0a	000e0000-5617-71e9-d176-f0e29cac65f1	\N	5	
\.


--
-- TOC entry 3023 (class 0 OID 21582699)
-- Dependencies: 210
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 3034 (class 0 OID 21582812)
-- Dependencies: 221
-- Data for Name: vrstastroska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstastroska (id, skupina, podskupina, naziv, opis) FROM stdin;
003b0000-5617-71e7-025a-2432f5eab65c	1	0	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE
003b0000-5617-71e7-c930-633f7f77be04	1	1	Storitve varovanja zgradb in prostorov	storitve varovanja zgradb in prostorov (npr. gasilci na predstavah)
003b0000-5617-71e7-7f44-34e577f57b27	1	2	Založniške in tiskarske storitve	založniške in tiskarske storitve
003b0000-5617-71e7-17a9-bc53d06c9b70	1	3	Časopisi, revije, knjige in strokovna literatura	časopisi, revije, knjige in strokovna literatura
003b0000-5617-71e7-f019-c88e71b85faf	1	4	Stroški prevajalskih storitev	stroški prevajalskih storitev
003b0000-5617-71e7-18cf-ae0c0de7afa5	1	5	Stroški oglaševalskih storitev	stroški oglaševalskih storitev
003b0000-5617-71e7-ad48-cde88fbcb364	1	6	Izdatki za reprezentanco	izdatki za reprezentanco
003b0000-5617-71e7-62e7-f40fe9519011	2	0	POSEBNI MATERIAL IN STORITVE	POSEBNI MATERIAL IN STORITVE
003b0000-5617-71e7-4798-909ce6c67f00	2	1	Drugi posebni material in storitve	drugi posebni material in storitve (npr. za instrumete - navedite)
003b0000-5617-71e7-e90e-901fe91351d4	2	2	Oprema predstave – stroški rekvizitov	Oprema predstave – stroški rekvizitov
003b0000-5617-71e7-ad34-2bf0555f753c	2	3	Oprema predstave – stroški kostumov	Oprema predstave – stroški kostumov
003b0000-5617-71e7-92e1-102c0fda7856	2	4	Oprema predstave – stroški scenske opreme	Oprema predstave – stroški scenske opreme
003b0000-5617-71e7-214e-a32897f60dad	2	5	Oprema predstave – stroški avdio in video opreme	Oprema predstave – stroški avdio in video opreme
003b0000-5617-71e7-6376-d6bd9ef65d71	3	0	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE
003b0000-5617-71e7-33ff-af225bb9165a	3	1	Poštnina in kurirske storitve	poštnina in kurirske storitve
003b0000-5617-71e7-0b79-f2d7b44746c9	4	0	PREVOZNI STROŠKI IN STORITVE	PREVOZNI STROŠKI IN STORITVE
003b0000-5617-71e7-2496-15ca6cc600dc	4	1	Goriva in maziva za prevozna sredstva	goriva in maziva za prevozna sredstva
003b0000-5617-71e7-d8e0-15033f2521e2	4	2	Najem vozil in selitveni stroški	najem vozil in selitveni stroški
003b0000-5617-71e7-ea78-935b23179827	4	3	Drugi prevozni in transportni stroški 	drugi prevozni in transportni stroški (navedite)
003b0000-5617-71e7-0413-402de7fb8fd2	5	0	IZDATKI ZA SLUŽBENA POTOVANJA	IZDATKI ZA SLUŽBENA POTOVANJA
003b0000-5617-71e7-5425-00856c8c3071	5	1	Dnevnice za službena potovanja v državi in tujini	dnevnice za službena potovanja v državi in tujini
003b0000-5617-71e7-aaff-19ac6d6c346c	5	2	Hotelske in restavra. storitve v državi in tujini	hotelske in restavra. storitve v državi in tujini
003b0000-5617-71e7-f68e-0c2ecad47f13	5	3	Stroški prevoza v državi in tujini	stroški prevoza v državi in tujini
003b0000-5617-71e7-a28f-d1814ac3239d	5	4	Drugi izdatki za službena potovanja	drugi izdatki za službena potovanja (navedite)
003b0000-5617-71e7-5dbf-1a59a308e0c5	6	0	NAJEMNINE IN ZAKUPNINE	NAJEMNINE IN ZAKUPNINE
003b0000-5617-71e7-2234-071fd8f4e566	6	1	Druge najemnine, zakupnine in licenčnine	druge najemnine, zakupnine in licenčnine (npr. najem notnega materiala, instrumentov - navedite)
003b0000-5617-71e7-2c5b-4e24d2038c0c	7	0	DRUGI OPERATIVNI ODHODKI	DRUGI OPERATIVNI ODHODKI
003b0000-5617-71e7-1e98-862d7d7cfde5	7	1	Izdatki za strok. izobraževanje zap.	izdatki za strok. izobraževanje zap.(vezani na program. enote)  
\.


--
-- TOC entry 3052 (class 0 OID 21583151)
-- Dependencies: 239
-- Data for Name: vrstazapisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstazapisa (id, oznaka, naziv, aktiven, znacka, ikona, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3051 (class 0 OID 21583123)
-- Dependencies: 238
-- Data for Name: zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapis (id, vrsta_id, datoteka_id, mapa_id, avtor_id, zaklenil_id, tip, zaklenjen, datumzaklepanja, identifier, subject, title, description, coverage, creator, language, date, publisher, relation, rights, source, upor, datknj, standard, lokacija) FROM stdin;
\.


--
-- TOC entry 3053 (class 0 OID 21583163)
-- Dependencies: 240
-- Data for Name: zapislastnik; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapislastnik (id, zapis_id, lastnik, classlastnika, datum, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3030 (class 0 OID 21582771)
-- Dependencies: 217
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, sifra, status, delovnomesto, zacetek, konec, tip, delovnaobveza, malica, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci) FROM stdin;
00100000-5617-71e9-4e06-f211be9fa9aa	00090000-5617-71e9-e467-f4ad0fa61fd2	0010	A	Mojster	2010-02-01	\N	1	2		t	f	f	t
00100000-5617-71e9-7b6a-f2eeccdfb1b3	00090000-5617-71e9-a782-5973fbc007ba	0003	A	Igralec	2010-02-01	\N	1	2		t	f	f	t
00100000-5617-71e9-bc0d-fb59ab389acc	00090000-5617-71e9-d24b-9f44ff162f87	0008	A	Natakar	2010-02-01	\N	1	2		t	f	f	t
00100000-5617-71e9-b37e-7cf692ab5909	00090000-5617-71e9-d3a0-ca8875e6dd1b	0004	A	Mizar	2010-02-01	\N	1	2		t	f	f	t
00100000-5617-71e9-f92c-c4ae70c9d7c9	00090000-5617-71e9-ca31-64199d188bb1	0009	A	Šivilja	2010-02-01	\N	1	2		t	f	f	t
00100000-5617-71e9-64d1-e436f7afbe17	00090000-5617-71e9-f652-8d864a0f9972	0007	A	Inšpicient	2010-02-01	\N	1	2		t	f	f	t
\.


--
-- TOC entry 3011 (class 0 OID 21582607)
-- Dependencies: 198
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id, oseba_id) FROM stdin;
\.


--
-- TOC entry 3039 (class 0 OID 21582879)
-- Dependencies: 226
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, sifra, naziv, opis) FROM stdin;
00140000-5617-71e6-3f16-b0212684e958	01	Drama	drama (SURS 01)
00140000-5617-71e6-77b6-03bfcb75760b	02	Opera	opera (SURS 02)
00140000-5617-71e6-1256-c9c6efaac32b	03	Balet	balet (SURS 03)
00140000-5617-71e6-34fd-e7b0b22370ea	04	Plesne prireditve	plesne prireditve (SURS 04)
00140000-5617-71e6-949f-dc2a9f8a77f5	05	Lutkovno gledališče	lutkovno gledališče (SURS 05)
00140000-5617-71e6-2a28-b3cdff27c737	06	Raziskovalno gledališče	raziskovalno gledališče (SURS 06)
00140000-5617-71e6-fda5-4c9f845c143f	07	Drugo	drugo (SURS 07)
\.


--
-- TOC entry 3029 (class 0 OID 21582761)
-- Dependencies: 216
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, sifra, naziv, opis) FROM stdin;
\.


--
-- TOC entry 2516 (class 2606 OID 21582382)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2708 (class 2606 OID 21582938)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2704 (class 2606 OID 21582928)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2667 (class 2606 OID 21582795)
-- Name: avtorbesedila_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT avtorbesedila_pkey PRIMARY KEY (id);


--
-- TOC entry 2678 (class 2606 OID 21582837)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2765 (class 2606 OID 21583203)
-- Name: datoteka_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT datoteka_pkey PRIMARY KEY (id);


--
-- TOC entry 2579 (class 2606 OID 21582596)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2594 (class 2606 OID 21582617)
-- Name: dogodeksplosni_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodeksplosni
    ADD CONSTRAINT dogodeksplosni_pkey PRIMARY KEY (id);


--
-- TOC entry 2741 (class 2606 OID 21583121)
-- Name: drugivir_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT drugivir_pkey PRIMARY KEY (id);


--
-- TOC entry 2550 (class 2606 OID 21582507)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2715 (class 2606 OID 21583002)
-- Name: enotaprograma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT enotaprograma_pkey PRIMARY KEY (id);


--
-- TOC entry 2652 (class 2606 OID 21582757)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2573 (class 2606 OID 21582570)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2567 (class 2606 OID 21582545)
-- Name: job_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY job
    ADD CONSTRAINT job_pkey PRIMARY KEY (id);


--
-- TOC entry 2558 (class 2606 OID 21582521)
-- Name: kontaktnaoseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT kontaktnaoseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2616 (class 2606 OID 21582664)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2759 (class 2606 OID 21583180)
-- Name: mapa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT mapa_pkey PRIMARY KEY (id);


--
-- TOC entry 2763 (class 2606 OID 21583187)
-- Name: mapa_zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT mapa_zapis_pkey PRIMARY KEY (mapa_id, zapis_id);


--
-- TOC entry 2770 (class 2606 OID 21583211)
-- Name: mapaacl_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT mapaacl_pkey PRIMARY KEY (id);


--
-- TOC entry 2488 (class 2606 OID 21093462)
-- Name: migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY migrations
    ADD CONSTRAINT migrations_pkey PRIMARY KEY (version);


--
-- TOC entry 2628 (class 2606 OID 21582691)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2543 (class 2606 OID 21582479)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2520 (class 2606 OID 21582391)
-- Name: optionvalue_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT optionvalue_pkey PRIMARY KEY (id);


--
-- TOC entry 2523 (class 2606 OID 21582415)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2514 (class 2606 OID 21582371)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2507 (class 2606 OID 21582356)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2631 (class 2606 OID 21582697)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2645 (class 2606 OID 21582733)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2690 (class 2606 OID 21582874)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2532 (class 2606 OID 21582443)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2540 (class 2606 OID 21582467)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2725 (class 2606 OID 21583073)
-- Name: postavkacdve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkacdve
    ADD CONSTRAINT postavkacdve_pkey PRIMARY KEY (id);


--
-- TOC entry 2620 (class 2606 OID 21582670)
-- Name: postavkaracuna_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT postavkaracuna_pkey PRIMARY KEY (id);


--
-- TOC entry 2538 (class 2606 OID 21582457)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2571 (class 2606 OID 21582558)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2626 (class 2606 OID 21582682)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2729 (class 2606 OID 21583082)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2731 (class 2606 OID 21583090)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2722 (class 2606 OID 21583060)
-- Name: programdela_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT programdela_pkey PRIMARY KEY (id);


--
-- TOC entry 2736 (class 2606 OID 21583102)
-- Name: programskaenotasklopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT programskaenotasklopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2638 (class 2606 OID 21582715)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2614 (class 2606 OID 21582655)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2608 (class 2606 OID 21582646)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2685 (class 2606 OID 21582861)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2665 (class 2606 OID 21582788)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2561 (class 2606 OID 21582533)
-- Name: report_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY report
    ADD CONSTRAINT report_pkey PRIMARY KEY (id);


--
-- TOC entry 2499 (class 2606 OID 21582327)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2643 (class 2606 OID 21582724)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2505 (class 2606 OID 21582345)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2509 (class 2606 OID 21582365)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2650 (class 2606 OID 21582742)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2622 (class 2606 OID 21582677)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2596 (class 2606 OID 21582626)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2496 (class 2606 OID 21582315)
-- Name: stevilcenje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenje
    ADD CONSTRAINT stevilcenje_pkey PRIMARY KEY (id);


--
-- TOC entry 2493 (class 2606 OID 21582303)
-- Name: stevilcenjekonfig_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT stevilcenjekonfig_pkey PRIMARY KEY (id);


--
-- TOC entry 2490 (class 2606 OID 21582297)
-- Name: stevilcenjestanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjestanje
    ADD CONSTRAINT stevilcenjestanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2674 (class 2606 OID 21582808)
-- Name: strosekuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT strosekuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2529 (class 2606 OID 21582424)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2602 (class 2606 OID 21582637)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2681 (class 2606 OID 21582848)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2738 (class 2606 OID 21583114)
-- Name: tipprogramskeenote_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipprogramskeenote
    ADD CONSTRAINT tipprogramskeenote_pkey PRIMARY KEY (id);


--
-- TOC entry 2548 (class 2606 OID 21582492)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2501 (class 2606 OID 21582340)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2702 (class 2606 OID 21582907)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2577 (class 2606 OID 21582580)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2634 (class 2606 OID 21582705)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2676 (class 2606 OID 21582820)
-- Name: vrstastroska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstastroska
    ADD CONSTRAINT vrstastroska_pkey PRIMARY KEY (id);


--
-- TOC entry 2752 (class 2606 OID 21583161)
-- Name: vrstazapisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstazapisa
    ADD CONSTRAINT vrstazapisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2749 (class 2606 OID 21583145)
-- Name: zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT zapis_pkey PRIMARY KEY (id);


--
-- TOC entry 2755 (class 2606 OID 21583169)
-- Name: zapislastnik_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT zapislastnik_pkey PRIMARY KEY (id);


--
-- TOC entry 2661 (class 2606 OID 21582779)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2592 (class 2606 OID 21582611)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2694 (class 2606 OID 21582887)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2658 (class 2606 OID 21582769)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2580 (class 1259 OID 21582605)
-- Name: dogodki_konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_konec ON dogodek USING btree (konec);


--
-- TOC entry 2581 (class 1259 OID 21582606)
-- Name: dogodki_razred; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_razred ON dogodek USING btree (razred);


--
-- TOC entry 2582 (class 1259 OID 21582604)
-- Name: dogodki_zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2583 (class 1259 OID 21582603)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2584 (class 1259 OID 21582602)
-- Name: idx_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2670 (class 1259 OID 21582809)
-- Name: idx_11ffe6e05c75296c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e05c75296c ON strosekuprizoritve USING btree (vrstastroska_id);


--
-- TOC entry 2671 (class 1259 OID 21582810)
-- Name: idx_11ffe6e062b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e062b4ffca ON strosekuprizoritve USING btree (uprizoritev_id);


--
-- TOC entry 2672 (class 1259 OID 21582811)
-- Name: idx_11ffe6e06beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e06beede51 ON strosekuprizoritve USING btree (popa_id);


--
-- TOC entry 2756 (class 1259 OID 21583182)
-- Name: idx_14a5d6d3727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d3727aca70 ON mapa USING btree (parent_id);


--
-- TOC entry 2757 (class 1259 OID 21583181)
-- Name: idx_14a5d6d38a4a6c12; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d38a4a6c12 ON mapa USING btree (lastnik_id);


--
-- TOC entry 2530 (class 1259 OID 21582445)
-- Name: idx_1c7adba5ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba5ee4b985a ON popa USING btree (drzava_id);


--
-- TOC entry 2629 (class 1259 OID 21582698)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2743 (class 1259 OID 21583149)
-- Name: idx_1ed92829253c4123; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829253c4123 ON zapis USING btree (avtor_id);


--
-- TOC entry 2744 (class 1259 OID 21583148)
-- Name: idx_1ed9282957ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282957ed422f ON zapis USING btree (mapa_id);


--
-- TOC entry 2745 (class 1259 OID 21583150)
-- Name: idx_1ed9282987ff3295; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282987ff3295 ON zapis USING btree (zaklenil_id);


--
-- TOC entry 2746 (class 1259 OID 21583147)
-- Name: idx_1ed92829a54dbb1f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829a54dbb1f ON zapis USING btree (datoteka_id);


--
-- TOC entry 2747 (class 1259 OID 21583146)
-- Name: idx_1ed92829ef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829ef943358 ON zapis USING btree (vrsta_id);


--
-- TOC entry 2623 (class 1259 OID 21582684)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2624 (class 1259 OID 21582683)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2575 (class 1259 OID 21582581)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2653 (class 1259 OID 21582758)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2654 (class 1259 OID 21582760)
-- Name: idx_23aeb9586b361365; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9586b361365 ON funkcija USING btree (tipfunkcije_id);


--
-- TOC entry 2655 (class 1259 OID 21582759)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2555 (class 1259 OID 21582523)
-- Name: idx_2942b10710389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b10710389148 ON kontaktnaoseba USING btree (oseba_id);


--
-- TOC entry 2556 (class 1259 OID 21582522)
-- Name: idx_2942b1076beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b1076beede51 ON kontaktnaoseba USING btree (popa_id);


--
-- TOC entry 2734 (class 1259 OID 21583103)
-- Name: idx_2d901816d6bc69d6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2d901816d6bc69d6 ON programskaenotasklopa USING btree (programrazno_id);


--
-- TOC entry 2686 (class 1259 OID 21582876)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2687 (class 1259 OID 21582877)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2688 (class 1259 OID 21582878)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2753 (class 1259 OID 21583170)
-- Name: idx_2eaff9dcaf91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2eaff9dcaf91ecd ON zapislastnik USING btree (zapis_id);


--
-- TOC entry 2695 (class 1259 OID 21582912)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2696 (class 1259 OID 21582909)
-- Name: idx_344a77a7c3b0d59; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a7c3b0d59 ON uprizoritev USING btree (maticnioder_id);


--
-- TOC entry 2697 (class 1259 OID 21582913)
-- Name: idx_344a77a853a965c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a853a965c ON uprizoritev USING btree (producent_id);


--
-- TOC entry 2698 (class 1259 OID 21582911)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2699 (class 1259 OID 21582910)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2545 (class 1259 OID 21582494)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2546 (class 1259 OID 21582493)
-- Name: idx_37f6541a6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a6beede51 ON trr USING btree (popa_id);


--
-- TOC entry 2521 (class 1259 OID 21582418)
-- Name: idx_466966d769e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_466966d769e8d4 ON oseba USING btree (naslov_id);


--
-- TOC entry 2641 (class 1259 OID 21582725)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2511 (class 1259 OID 21582372)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2512 (class 1259 OID 21582373)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2646 (class 1259 OID 21582745)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2647 (class 1259 OID 21582744)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2648 (class 1259 OID 21582743)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2568 (class 1259 OID 21582559)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2569 (class 1259 OID 21582560)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2491 (class 1259 OID 21582305)
-- Name: idx_6054e804ff55f926; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_6054e804ff55f926 ON stevilcenjekonfig USING btree (stevilcenje_id);


--
-- TOC entry 2603 (class 1259 OID 21582650)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2604 (class 1259 OID 21582648)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2605 (class 1259 OID 21582647)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2606 (class 1259 OID 21582649)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2502 (class 1259 OID 21582346)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2503 (class 1259 OID 21582347)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2632 (class 1259 OID 21582706)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2766 (class 1259 OID 21583204)
-- Name: idx_781826c67e3c61f9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_781826c67e3c61f9 ON datoteka USING btree (owner_id);


--
-- TOC entry 2668 (class 1259 OID 21582797)
-- Name: idx_7ab77b7910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7ab77b7910389148 ON avtorbesedila USING btree (oseba_id);


--
-- TOC entry 2669 (class 1259 OID 21582796)
-- Name: idx_7ab77b79f35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7ab77b79f35157b1 ON avtorbesedila USING btree (besedilo_id);


--
-- TOC entry 2767 (class 1259 OID 21583212)
-- Name: idx_7adc957157ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc957157ed422f ON mapaacl USING btree (mapa_id);


--
-- TOC entry 2768 (class 1259 OID 21583213)
-- Name: idx_7adc9571fa6311ef; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc9571fa6311ef ON mapaacl USING btree (perm_id);


--
-- TOC entry 2618 (class 1259 OID 21582671)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2662 (class 1259 OID 21582789)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2663 (class 1259 OID 21582790)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2716 (class 1259 OID 21583007)
-- Name: idx_8787a0e54ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e54ae1cd1c ON enotaprograma USING btree (gostitelj_id);


--
-- TOC entry 2717 (class 1259 OID 21583006)
-- Name: idx_8787a0e55d0da56c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e55d0da56c ON enotaprograma USING btree (drzavagostovanja_id);


--
-- TOC entry 2718 (class 1259 OID 21583003)
-- Name: idx_8787a0e562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e562b4ffca ON enotaprograma USING btree (uprizoritev_id);


--
-- TOC entry 2719 (class 1259 OID 21583004)
-- Name: idx_8787a0e57222d84b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e57222d84b ON enotaprograma USING btree (tipprogramskeenote_id);


--
-- TOC entry 2720 (class 1259 OID 21583005)
-- Name: idx_8787a0e5771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e5771ec7bd ON enotaprograma USING btree (program_dela_id);


--
-- TOC entry 2534 (class 1259 OID 21582459)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2535 (class 1259 OID 21582458)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2536 (class 1259 OID 21582460)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2635 (class 1259 OID 21582719)
-- Name: idx_952dd21969e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd21969e8d4 ON prostor USING btree (naslov_id);


--
-- TOC entry 2636 (class 1259 OID 21582718)
-- Name: idx_952dd2196beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd2196beede51 ON prostor USING btree (popa_id);


--
-- TOC entry 2726 (class 1259 OID 21583083)
-- Name: idx_97af082e38c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e38c06eb ON produkcijadelitev USING btree (enotaprograma_id);


--
-- TOC entry 2727 (class 1259 OID 21583084)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2709 (class 1259 OID 21582942)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2710 (class 1259 OID 21582943)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2711 (class 1259 OID 21582940)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2712 (class 1259 OID 21582941)
-- Name: idx_a4b7244fa4976613; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fa4976613 ON alternacija USING btree (zaposlitev_id);


--
-- TOC entry 2659 (class 1259 OID 21582780)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2609 (class 1259 OID 21582659)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2610 (class 1259 OID 21582658)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2611 (class 1259 OID 21582656)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2612 (class 1259 OID 21582657)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2705 (class 1259 OID 21582930)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2706 (class 1259 OID 21582929)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2559 (class 1259 OID 21582534)
-- Name: idx_c38372b2be04ea9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c38372b2be04ea9 ON report USING btree (job_id);


--
-- TOC entry 2562 (class 1259 OID 21582548)
-- Name: idx_c395a6181bb9e62c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a6181bb9e62c ON job USING btree (datum);


--
-- TOC entry 2563 (class 1259 OID 21582547)
-- Name: idx_c395a618941027cc; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618941027cc ON job USING btree (casizvedbe);


--
-- TOC entry 2564 (class 1259 OID 21582546)
-- Name: idx_c395a618a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618a76ed395 ON job USING btree (user_id);


--
-- TOC entry 2565 (class 1259 OID 21582549)
-- Name: idx_c395a618aecf5af0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618aecf5af0 ON job USING btree (izveden);


--
-- TOC entry 2574 (class 1259 OID 21582571)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2723 (class 1259 OID 21583074)
-- Name: idx_dba42fe79e3adf2c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_dba42fe79e3adf2c ON postavkacdve USING btree (programdela_id);


--
-- TOC entry 2742 (class 1259 OID 21583122)
-- Name: idx_e7d4cf2638c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e7d4cf2638c06eb ON drugivir USING btree (enotaprograma_id);


--
-- TOC entry 2760 (class 1259 OID 21583188)
-- Name: idx_e9f8ee8257ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee8257ed422f ON mapa_zapis USING btree (mapa_id);


--
-- TOC entry 2761 (class 1259 OID 21583189)
-- Name: idx_e9f8ee82af91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee82af91ecd ON mapa_zapis USING btree (zapis_id);


--
-- TOC entry 2517 (class 1259 OID 21582393)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2518 (class 1259 OID 21582392)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2526 (class 1259 OID 21582425)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2527 (class 1259 OID 21582426)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2590 (class 1259 OID 21582612)
-- Name: idx_f44a386d10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_f44a386d10389148 ON zasedenost USING btree (oseba_id);


--
-- TOC entry 2598 (class 1259 OID 21582640)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2599 (class 1259 OID 21582639)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2600 (class 1259 OID 21582638)
-- Name: idx_fef7d84ba81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84ba81ccef6 ON terminstoritve USING btree (dogodek_id);


--
-- TOC entry 2585 (class 1259 OID 21582598)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2586 (class 1259 OID 21582599)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2587 (class 1259 OID 21582597)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2588 (class 1259 OID 21582601)
-- Name: uniq_11e93b5dbbc7a989; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dbbc7a989 ON dogodek USING btree (dogodek_splosni_id);


--
-- TOC entry 2589 (class 1259 OID 21582600)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2533 (class 1259 OID 21582444)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2551 (class 1259 OID 21582508)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2552 (class 1259 OID 21582510)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2553 (class 1259 OID 21582509)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2554 (class 1259 OID 21582511)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2617 (class 1259 OID 21582665)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2691 (class 1259 OID 21582875)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2700 (class 1259 OID 21582908)
-- Name: uniq_344a77a559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_344a77a559828a3 ON uprizoritev USING btree (sifra);


--
-- TOC entry 2682 (class 1259 OID 21582849)
-- Name: uniq_3f50510d559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d559828a3 ON tipfunkcije USING btree (sifra);


--
-- TOC entry 2683 (class 1259 OID 21582850)
-- Name: uniq_3f50510d55cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d55cca980 ON tipfunkcije USING btree (ime);


--
-- TOC entry 2524 (class 1259 OID 21582416)
-- Name: uniq_466966d7559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7559828a3 ON oseba USING btree (sifra);


--
-- TOC entry 2525 (class 1259 OID 21582417)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2656 (class 1259 OID 21582770)
-- Name: uniq_5216fcb0559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5216fcb0559828a3 ON zvrstuprizoritve USING btree (sifra);


--
-- TOC entry 2497 (class 1259 OID 21582316)
-- Name: uniq_5a434fbc559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5a434fbc559828a3 ON stevilcenje USING btree (sifra);


--
-- TOC entry 2544 (class 1259 OID 21582480)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2494 (class 1259 OID 21582304)
-- Name: uniq_6054e804889a7556; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_6054e804889a7556 ON stevilcenjekonfig USING btree (dok);


--
-- TOC entry 2739 (class 1259 OID 21583115)
-- Name: uniq_7d834df4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_7d834df4559828a3 ON tipprogramskeenote USING btree (sifra);


--
-- TOC entry 2639 (class 1259 OID 21582717)
-- Name: uniq_952dd21937854736; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21937854736 ON prostor USING btree (naziv);


--
-- TOC entry 2640 (class 1259 OID 21582716)
-- Name: uniq_952dd219559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd219559828a3 ON prostor USING btree (sifra);


--
-- TOC entry 2713 (class 1259 OID 21582939)
-- Name: uniq_a4b7244f559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a4b7244f559828a3 ON alternacija USING btree (sifra);


--
-- TOC entry 2541 (class 1259 OID 21582468)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2692 (class 1259 OID 21582888)
-- Name: uniq_cede8e36559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_cede8e36559828a3 ON zvrstsurs USING btree (sifra);


--
-- TOC entry 2750 (class 1259 OID 21583162)
-- Name: uniq_de1c8aa1d55226c7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_de1c8aa1d55226c7 ON vrstazapisa USING btree (oznaka);


--
-- TOC entry 2732 (class 1259 OID 21583091)
-- Name: uniq_e6fc2028559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc2028559828a3 ON produkcijskahisa USING btree (sifra);


--
-- TOC entry 2733 (class 1259 OID 21583092)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2679 (class 1259 OID 21582838)
-- Name: uniq_ec773670ca2e5fcb; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ec773670ca2e5fcb ON besedilo USING btree (stevilka);


--
-- TOC entry 2597 (class 1259 OID 21582627)
-- Name: uniq_ecc8f8c5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ecc8f8c5559828a3 ON sezona USING btree (sifra);


--
-- TOC entry 2510 (class 1259 OID 21582366)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2801 (class 2606 OID 21583344)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2800 (class 2606 OID 21583349)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2796 (class 2606 OID 21583369)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2802 (class 2606 OID 21583339)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2798 (class 2606 OID 21583359)
-- Name: fk_11e93b5dbbc7a989; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dbbc7a989 FOREIGN KEY (dogodek_splosni_id) REFERENCES dogodeksplosni(id);


--
-- TOC entry 2797 (class 2606 OID 21583364)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2799 (class 2606 OID 21583354)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2837 (class 2606 OID 21583534)
-- Name: fk_11ffe6e05c75296c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e05c75296c FOREIGN KEY (vrstastroska_id) REFERENCES vrstastroska(id);


--
-- TOC entry 2836 (class 2606 OID 21583539)
-- Name: fk_11ffe6e062b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e062b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2835 (class 2606 OID 21583544)
-- Name: fk_11ffe6e06beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e06beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2869 (class 2606 OID 21583709)
-- Name: fk_14a5d6d3727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d3727aca70 FOREIGN KEY (parent_id) REFERENCES mapa(id);


--
-- TOC entry 2870 (class 2606 OID 21583704)
-- Name: fk_14a5d6d38a4a6c12; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d38a4a6c12 FOREIGN KEY (lastnik_id) REFERENCES uporabniki(id);


--
-- TOC entry 2782 (class 2606 OID 21583269)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2819 (class 2606 OID 21583454)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2864 (class 2606 OID 21583689)
-- Name: fk_1ed92829253c4123; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829253c4123 FOREIGN KEY (avtor_id) REFERENCES uporabniki(id);


--
-- TOC entry 2865 (class 2606 OID 21583684)
-- Name: fk_1ed9282957ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282957ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2863 (class 2606 OID 21583694)
-- Name: fk_1ed9282987ff3295; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282987ff3295 FOREIGN KEY (zaklenil_id) REFERENCES uporabniki(id);


--
-- TOC entry 2866 (class 2606 OID 21583679)
-- Name: fk_1ed92829a54dbb1f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829a54dbb1f FOREIGN KEY (datoteka_id) REFERENCES datoteka(id);


--
-- TOC entry 2867 (class 2606 OID 21583674)
-- Name: fk_1ed92829ef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829ef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstazapisa(id);


--
-- TOC entry 2817 (class 2606 OID 21583449)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2818 (class 2606 OID 21583444)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2795 (class 2606 OID 21583334)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2829 (class 2606 OID 21583494)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2827 (class 2606 OID 21583504)
-- Name: fk_23aeb9586b361365; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9586b361365 FOREIGN KEY (tipfunkcije_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2828 (class 2606 OID 21583499)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2788 (class 2606 OID 21583304)
-- Name: fk_2942b10710389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b10710389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2789 (class 2606 OID 21583299)
-- Name: fk_2942b1076beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b1076beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2815 (class 2606 OID 21583434)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2861 (class 2606 OID 21583664)
-- Name: fk_2d901816d6bc69d6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT fk_2d901816d6bc69d6 FOREIGN KEY (programrazno_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2840 (class 2606 OID 21583549)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2839 (class 2606 OID 21583554)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2838 (class 2606 OID 21583559)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 2868 (class 2606 OID 21583699)
-- Name: fk_2eaff9dcaf91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT fk_2eaff9dcaf91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id);


--
-- TOC entry 2842 (class 2606 OID 21583579)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2845 (class 2606 OID 21583564)
-- Name: fk_344a77a7c3b0d59; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a7c3b0d59 FOREIGN KEY (maticnioder_id) REFERENCES prostor(id);


--
-- TOC entry 2841 (class 2606 OID 21583584)
-- Name: fk_344a77a853a965c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a853a965c FOREIGN KEY (producent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2843 (class 2606 OID 21583574)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2844 (class 2606 OID 21583569)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2786 (class 2606 OID 21583294)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2787 (class 2606 OID 21583289)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2778 (class 2606 OID 21583254)
-- Name: fk_466966d769e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d769e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2779 (class 2606 OID 21583249)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2823 (class 2606 OID 21583474)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2775 (class 2606 OID 21583229)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2774 (class 2606 OID 21583234)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2824 (class 2606 OID 21583489)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2825 (class 2606 OID 21583484)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2826 (class 2606 OID 21583479)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2793 (class 2606 OID 21583319)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2792 (class 2606 OID 21583324)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2771 (class 2606 OID 21583214)
-- Name: fk_6054e804ff55f926; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT fk_6054e804ff55f926 FOREIGN KEY (stevilcenje_id) REFERENCES stevilcenje(id);


--
-- TOC entry 2807 (class 2606 OID 21583409)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2809 (class 2606 OID 21583399)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2810 (class 2606 OID 21583394)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2808 (class 2606 OID 21583404)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2773 (class 2606 OID 21583219)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2772 (class 2606 OID 21583224)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2820 (class 2606 OID 21583459)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2873 (class 2606 OID 21583724)
-- Name: fk_781826c67e3c61f9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT fk_781826c67e3c61f9 FOREIGN KEY (owner_id) REFERENCES uporabniki(id);


--
-- TOC entry 2833 (class 2606 OID 21583529)
-- Name: fk_7ab77b7910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT fk_7ab77b7910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2834 (class 2606 OID 21583524)
-- Name: fk_7ab77b79f35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT fk_7ab77b79f35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2875 (class 2606 OID 21583729)
-- Name: fk_7adc957157ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc957157ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2874 (class 2606 OID 21583734)
-- Name: fk_7adc9571fa6311ef; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc9571fa6311ef FOREIGN KEY (perm_id) REFERENCES permission(id);


--
-- TOC entry 2816 (class 2606 OID 21583439)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2832 (class 2606 OID 21583514)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2831 (class 2606 OID 21583519)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2852 (class 2606 OID 21583639)
-- Name: fk_8787a0e54ae1cd1c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e54ae1cd1c FOREIGN KEY (gostitelj_id) REFERENCES popa(id);


--
-- TOC entry 2853 (class 2606 OID 21583634)
-- Name: fk_8787a0e55d0da56c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e55d0da56c FOREIGN KEY (drzavagostovanja_id) REFERENCES drza(id);


--
-- TOC entry 2856 (class 2606 OID 21583619)
-- Name: fk_8787a0e562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2855 (class 2606 OID 21583624)
-- Name: fk_8787a0e57222d84b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e57222d84b FOREIGN KEY (tipprogramskeenote_id) REFERENCES tipprogramskeenote(id);


--
-- TOC entry 2854 (class 2606 OID 21583629)
-- Name: fk_8787a0e5771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e5771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2784 (class 2606 OID 21583279)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2785 (class 2606 OID 21583274)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2783 (class 2606 OID 21583284)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2821 (class 2606 OID 21583469)
-- Name: fk_952dd21969e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd21969e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2822 (class 2606 OID 21583464)
-- Name: fk_952dd2196beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd2196beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2859 (class 2606 OID 21583649)
-- Name: fk_97af082e38c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e38c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2858 (class 2606 OID 21583654)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2849 (class 2606 OID 21583609)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2848 (class 2606 OID 21583614)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2851 (class 2606 OID 21583599)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 2850 (class 2606 OID 21583604)
-- Name: fk_a4b7244fa4976613; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fa4976613 FOREIGN KEY (zaposlitev_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2830 (class 2606 OID 21583509)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2811 (class 2606 OID 21583429)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2812 (class 2606 OID 21583424)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2814 (class 2606 OID 21583414)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2813 (class 2606 OID 21583419)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2846 (class 2606 OID 21583594)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2847 (class 2606 OID 21583589)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2790 (class 2606 OID 21583309)
-- Name: fk_c38372b2be04ea9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY report
    ADD CONSTRAINT fk_c38372b2be04ea9 FOREIGN KEY (job_id) REFERENCES job(id);


--
-- TOC entry 2791 (class 2606 OID 21583314)
-- Name: fk_c395a618a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY job
    ADD CONSTRAINT fk_c395a618a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2794 (class 2606 OID 21583329)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2857 (class 2606 OID 21583644)
-- Name: fk_dba42fe79e3adf2c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkacdve
    ADD CONSTRAINT fk_dba42fe79e3adf2c FOREIGN KEY (programdela_id) REFERENCES programdela(id);


--
-- TOC entry 2860 (class 2606 OID 21583659)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2862 (class 2606 OID 21583669)
-- Name: fk_e7d4cf2638c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT fk_e7d4cf2638c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2872 (class 2606 OID 21583714)
-- Name: fk_e9f8ee8257ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee8257ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id) ON DELETE CASCADE;


--
-- TOC entry 2871 (class 2606 OID 21583719)
-- Name: fk_e9f8ee82af91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee82af91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id) ON DELETE CASCADE;


--
-- TOC entry 2776 (class 2606 OID 21583244)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2777 (class 2606 OID 21583239)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2781 (class 2606 OID 21583259)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2780 (class 2606 OID 21583264)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2803 (class 2606 OID 21583374)
-- Name: fk_f44a386d10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT fk_f44a386d10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2804 (class 2606 OID 21583389)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2805 (class 2606 OID 21583384)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2806 (class 2606 OID 21583379)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- Completed on 2015-10-09 09:51:08 CEST

--
-- PostgreSQL database dump complete
--

