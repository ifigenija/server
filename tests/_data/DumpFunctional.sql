--
-- PostgreSQL database dump
--

-- Dumped from database version 9.4.0
-- Dumped by pg_dump version 9.4.0
-- Started on 2015-09-18 22:55:39 CEST

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

SET search_path = public, pg_catalog;

SET default_with_oids = false;

--
-- TOC entry 182 (class 1259 OID 1345782)
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
-- TOC entry 216 (class 1259 OID 1346154)
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
-- TOC entry 217 (class 1259 OID 1346167)
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
-- TOC entry 218 (class 1259 OID 1346184)
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
-- TOC entry 219 (class 1259 OID 1346191)
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
-- TOC entry 239 (class 1259 OID 1346508)
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
-- TOC entry 195 (class 1259 OID 1345958)
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
-- TOC entry 196 (class 1259 OID 1345984)
-- Name: dogodeksplosni; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodeksplosni (
    id uuid NOT NULL
);


--
-- TOC entry 231 (class 1259 OID 1346349)
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
-- TOC entry 183 (class 1259 OID 1345791)
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
-- TOC entry 232 (class 1259 OID 1346356)
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
-- TOC entry 220 (class 1259 OID 1346207)
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
-- TOC entry 197 (class 1259 OID 1345989)
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
-- TOC entry 193 (class 1259 OID 1345932)
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
-- TOC entry 3320 (class 0 OID 0)
-- Dependencies: 193
-- Name: COLUMN job.data; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN job.data IS '(DC2Type:object)';


--
-- TOC entry 184 (class 1259 OID 1345808)
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
-- TOC entry 203 (class 1259 OID 1346049)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 240 (class 1259 OID 1346523)
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
-- TOC entry 241 (class 1259 OID 1346535)
-- Name: mapa_zapis; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE mapa_zapis (
    mapa_id uuid NOT NULL,
    zapis_id uuid NOT NULL
);


--
-- TOC entry 242 (class 1259 OID 1346542)
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
-- TOC entry 204 (class 1259 OID 1346055)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 185 (class 1259 OID 1345820)
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
-- TOC entry 186 (class 1259 OID 1345832)
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
-- TOC entry 187 (class 1259 OID 1345843)
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
-- TOC entry 175 (class 1259 OID 1345725)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 179 (class 1259 OID 1345755)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 205 (class 1259 OID 1346062)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 206 (class 1259 OID 1346069)
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
-- TOC entry 221 (class 1259 OID 1346222)
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
-- TOC entry 188 (class 1259 OID 1345868)
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
-- TOC entry 189 (class 1259 OID 1345887)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 233 (class 1259 OID 1346411)
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
-- TOC entry 207 (class 1259 OID 1346077)
-- Name: postavkaracuna; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE postavkaracuna (
    id uuid NOT NULL,
    racun_id uuid
);


--
-- TOC entry 190 (class 1259 OID 1345895)
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
-- TOC entry 198 (class 1259 OID 1346000)
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
-- TOC entry 208 (class 1259 OID 1346083)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 234 (class 1259 OID 1346425)
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
-- TOC entry 235 (class 1259 OID 1346435)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    sifra character varying(4) NOT NULL,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 236 (class 1259 OID 1346443)
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
-- TOC entry 237 (class 1259 OID 1346486)
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
-- TOC entry 209 (class 1259 OID 1346090)
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
-- TOC entry 210 (class 1259 OID 1346103)
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
-- TOC entry 211 (class 1259 OID 1346112)
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
-- TOC entry 222 (class 1259 OID 1346238)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying,
    status character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 223 (class 1259 OID 1346249)
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
-- TOC entry 194 (class 1259 OID 1345947)
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
-- TOC entry 177 (class 1259 OID 1345736)
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
-- TOC entry 176 (class 1259 OID 1345734)
-- Name: revizije_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE revizije_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3321 (class 0 OID 0)
-- Dependencies: 176
-- Name: revizije_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE revizije_id_seq OWNED BY revizije.id;


--
-- TOC entry 212 (class 1259 OID 1346122)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 178 (class 1259 OID 1345745)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 181 (class 1259 OID 1345775)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 213 (class 1259 OID 1346128)
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
-- TOC entry 214 (class 1259 OID 1346140)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 199 (class 1259 OID 1346010)
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
-- TOC entry 172 (class 1259 OID 1345701)
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
-- TOC entry 173 (class 1259 OID 1345712)
-- Name: stevilcenjekonfig; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjekonfig (
    id uuid NOT NULL,
    stevilcenje_id uuid,
    dok character varying(100) DEFAULT NULL::character varying
);


--
-- TOC entry 174 (class 1259 OID 1345720)
-- Name: stevilcenjestanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjestanje (
    id uuid NOT NULL,
    objid uuid NOT NULL,
    leto integer NOT NULL,
    stevilka integer
);


--
-- TOC entry 224 (class 1259 OID 1346259)
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
-- TOC entry 191 (class 1259 OID 1345910)
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
-- TOC entry 202 (class 1259 OID 1346036)
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
-- TOC entry 225 (class 1259 OID 1346273)
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
-- TOC entry 238 (class 1259 OID 1346496)
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
-- TOC entry 192 (class 1259 OID 1345918)
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
-- TOC entry 180 (class 1259 OID 1345762)
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
-- TOC entry 226 (class 1259 OID 1346285)
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
-- TOC entry 200 (class 1259 OID 1346020)
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
-- TOC entry 215 (class 1259 OID 1346146)
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
-- TOC entry 227 (class 1259 OID 1346310)
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
-- TOC entry 243 (class 1259 OID 1346551)
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
-- TOC entry 244 (class 1259 OID 1346563)
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
-- TOC entry 245 (class 1259 OID 1346591)
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
-- TOC entry 228 (class 1259 OID 1346319)
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
-- TOC entry 201 (class 1259 OID 1346030)
-- Name: zasedenost; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zasedenost (
    id uuid NOT NULL,
    oseba_id uuid
);


--
-- TOC entry 229 (class 1259 OID 1346329)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 230 (class 1259 OID 1346339)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 2482 (class 2604 OID 1345739)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 3250 (class 0 OID 1345782)
-- Dependencies: 182
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
\.


--
-- TOC entry 3284 (class 0 OID 1346154)
-- Dependencies: 216
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, zaposlitev_id, oseba_id, pogodba_id, sifra, zaposlen, zacetek, konec, opomba, sort, privzeti, aktivna, imapogodbo, pomembna) FROM stdin;
\.


--
-- TOC entry 3285 (class 0 OID 1346167)
-- Dependencies: 217
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 3286 (class 0 OID 1346184)
-- Dependencies: 218
-- Data for Name: avtorbesedila; Type: TABLE DATA; Schema: public; Owner: -
--

COPY avtorbesedila (id, besedilo_id, oseba_id, tipavtorja, zaporedna, alivnaslovu) FROM stdin;
\.


--
-- TOC entry 3287 (class 0 OID 1346191)
-- Dependencies: 219
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, stevilka, naslov, podnaslov, jezik, naslovizvirnika, internacionalninaslov, datumprejema, moskevloge, zenskevloge, povzetekvsebine, letoizida, krajizida, zaloznik) FROM stdin;
\.


--
-- TOC entry 3307 (class 0 OID 1346508)
-- Dependencies: 239
-- Data for Name: datoteka; Type: TABLE DATA; Schema: public; Owner: -
--

COPY datoteka (id, owner_id, filename, transfers, size, format, hash, createdat, uploadedat, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3263 (class 0 OID 1345958)
-- Dependencies: 195
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_splosni_id, prostor_id, sezona_id, planiranzacetek, allday, zacetek, konec, status, razred, termin, title) FROM stdin;
\.


--
-- TOC entry 3264 (class 0 OID 1345984)
-- Dependencies: 196
-- Data for Name: dogodeksplosni; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodeksplosni (id) FROM stdin;
\.


--
-- TOC entry 3299 (class 0 OID 1346349)
-- Dependencies: 231
-- Data for Name: drugivir; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drugivir (id, znesek, opis, mednarodni, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 3251 (class 0 OID 1345791)
-- Dependencies: 183
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-55fc-7a40-48d5-32181145e628	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-55fc-7a40-e2d3-a085f0ed1eb9	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-55fc-7a40-499b-2eeed42e3367	AL	ALB	008	Albania 	Albanija	\N
00040000-55fc-7a40-58ba-1aa4df5a3b9f	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-55fc-7a40-ee18-e3b344437fcf	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-55fc-7a40-7743-bbfaeeaa1cc6	AD	AND	020	Andorra 	Andora	\N
00040000-55fc-7a40-dc43-8da9d4690d98	AO	AGO	024	Angola 	Angola	\N
00040000-55fc-7a40-e165-bff7cb1cc8d1	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-55fc-7a40-d2a0-0e7825b8a179	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-55fc-7a40-7d28-2a56792f7af7	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-55fc-7a40-9c92-4a836201677d	AR	ARG	032	Argentina 	Argenitna	\N
00040000-55fc-7a40-f795-1093d260c712	AM	ARM	051	Armenia 	Armenija	\N
00040000-55fc-7a40-0b9d-d8afe7f2a12a	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-55fc-7a40-cd44-b104685a4719	AU	AUS	036	Australia 	Avstralija	\N
00040000-55fc-7a40-45e6-5f5456b39c1b	AT	AUT	040	Austria 	Avstrija	\N
00040000-55fc-7a40-d5c1-32f7daea3414	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-55fc-7a40-baf8-cdb04e602493	BS	BHS	044	Bahamas 	Bahami	\N
00040000-55fc-7a40-da3d-4dc93655fb55	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-55fc-7a40-3eaf-3d55565d1661	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-55fc-7a40-0e9f-0f479bc5bfe5	BB	BRB	052	Barbados 	Barbados	\N
00040000-55fc-7a40-24ab-01025d629f54	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-55fc-7a40-dd1a-db14c3249336	BE	BEL	056	Belgium 	Belgija	\N
00040000-55fc-7a40-655a-7e42066cd5e9	BZ	BLZ	084	Belize 	Belize	\N
00040000-55fc-7a40-d95f-96025fd98a76	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-55fc-7a40-96de-422d983358b0	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-55fc-7a40-075b-420434d5f128	BT	BTN	064	Bhutan 	Butan	\N
00040000-55fc-7a40-0ba3-691f050680b7	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-55fc-7a40-d6d1-2a080a084a2f	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-55fc-7a40-3597-5c53e5910835	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-55fc-7a40-bfbd-96a11baf175d	BW	BWA	072	Botswana 	Bocvana	\N
00040000-55fc-7a40-6a81-1d262bc51ffe	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-55fc-7a40-8939-58ea46217be4	BR	BRA	076	Brazil 	Brazilija	\N
00040000-55fc-7a40-0121-f22afc01f273	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-55fc-7a40-2720-0b0a9441564f	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-55fc-7a40-79ef-ce3e829e1761	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-55fc-7a40-b7d8-355978c26a81	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-55fc-7a40-cee1-6172adcddb3b	BI	BDI	108	Burundi 	Burundi 	\N
00040000-55fc-7a40-b12f-be385700a603	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-55fc-7a40-6d61-176468378223	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-55fc-7a40-18e3-e4ca7360326f	CA	CAN	124	Canada 	Kanada	\N
00040000-55fc-7a40-52da-ef6ba5a9685a	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-55fc-7a40-3243-5a76baf45b06	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-55fc-7a40-c1dc-bc3ce8f0033b	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-55fc-7a40-83f0-825c533fdba2	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-55fc-7a40-97a0-4d3b1943a1db	CL	CHL	152	Chile 	Čile	\N
00040000-55fc-7a40-f6be-c47a185ec3b2	CN	CHN	156	China 	Kitajska	\N
00040000-55fc-7a40-2a7b-e4229d74ec0d	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-55fc-7a40-3a88-884d874016e4	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-55fc-7a40-37cb-edde8d8499ee	CO	COL	170	Colombia 	Kolumbija	\N
00040000-55fc-7a40-f457-ad6ebf843780	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-55fc-7a40-678f-db726d2a9015	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-55fc-7a40-f6dc-8670f2c28a30	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-55fc-7a40-5e53-2c862ce67b47	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-55fc-7a40-cb2f-85ef18bc38eb	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-55fc-7a40-61f1-eb320688792b	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-55fc-7a40-a31c-c92fd5d9ee16	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-55fc-7a40-cbc1-7d1eaf932ece	CU	CUB	192	Cuba 	Kuba	\N
00040000-55fc-7a40-5332-089afefd1587	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-55fc-7a40-c5e2-4b1fd3f5f20c	CY	CYP	196	Cyprus 	Ciper	\N
00040000-55fc-7a40-9b3f-af8eed10463f	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-55fc-7a40-71f6-556f8c7e5bdf	DK	DNK	208	Denmark 	Danska	\N
00040000-55fc-7a40-0339-861440fb7f31	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-55fc-7a40-7028-e796a7f3081e	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-55fc-7a40-e592-d2c46b5792a7	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-55fc-7a40-0c96-81cc57977c05	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-55fc-7a40-2c5e-7f8ce7019a3d	EG	EGY	818	Egypt 	Egipt	\N
00040000-55fc-7a40-797d-acb27fb070b8	SV	SLV	222	El Salvador 	Salvador	\N
00040000-55fc-7a40-f807-58ba1d16d227	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-55fc-7a40-5d68-7fe588a0c3c6	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-55fc-7a40-289c-e4ad2e0b02ca	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-55fc-7a40-47a1-59af437cb515	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-55fc-7a40-0498-cfa93dc6287f	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-55fc-7a40-7abc-4a7b06849cac	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-55fc-7a40-d9d2-f50770495963	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-55fc-7a40-70d3-575a855d5610	FI	FIN	246	Finland 	Finska	\N
00040000-55fc-7a40-d5f9-c68e0b9d87fa	FR	FRA	250	France 	Francija	\N
00040000-55fc-7a40-0254-0b147b0d357f	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-55fc-7a40-d477-43fae5125454	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-55fc-7a40-9c6a-810b4fa0cd0d	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-55fc-7a40-c9a9-23a6a2e93019	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-55fc-7a40-5d69-8fd15a3429a8	GA	GAB	266	Gabon 	Gabon	\N
00040000-55fc-7a40-63b1-8a59a9af265c	GM	GMB	270	Gambia 	Gambija	\N
00040000-55fc-7a40-96d6-9a1e8e61b52b	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-55fc-7a40-0793-cc8e38da5fd3	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-55fc-7a40-ed58-3f4b48d07f2e	GH	GHA	288	Ghana 	Gana	\N
00040000-55fc-7a40-3c5f-56df87248f7c	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-55fc-7a40-f9e2-72c7fb154e99	GR	GRC	300	Greece 	Grčija	\N
00040000-55fc-7a40-9127-d25748d4ce08	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-55fc-7a40-079f-eae25142358d	GD	GRD	308	Grenada 	Grenada	\N
00040000-55fc-7a40-8949-1d44bfc4a438	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-55fc-7a40-ea4d-f50bed7c5664	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-55fc-7a40-c05d-72dac4f5b2c5	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-55fc-7a40-565a-960ed2cef14c	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-55fc-7a40-d81d-dda334b316b7	GN	GIN	324	Guinea 	Gvineja	\N
00040000-55fc-7a40-0940-1d4e669efbbe	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-55fc-7a40-95bb-d2877a063d71	GY	GUY	328	Guyana 	Gvajana	\N
00040000-55fc-7a40-c06b-c6fb9ccd85a3	HT	HTI	332	Haiti 	Haiti	\N
00040000-55fc-7a40-0542-1440e52482e9	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-55fc-7a40-f92c-3ab0c5fcb25d	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-55fc-7a40-c7f9-bfb0c2b33820	HN	HND	340	Honduras 	Honduras	\N
00040000-55fc-7a40-fa0c-6e58d78fc7e1	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-55fc-7a40-0503-5710ef05ba16	HU	HUN	348	Hungary 	Madžarska	\N
00040000-55fc-7a40-15c8-0918e1b733c6	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-55fc-7a40-a6ae-115aa4b1ac47	IN	IND	356	India 	Indija	\N
00040000-55fc-7a40-ec34-e5047179c2c5	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-55fc-7a40-386e-b7538d2e6a55	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-55fc-7a40-f561-e7a1cfe7de04	IQ	IRQ	368	Iraq 	Irak	\N
00040000-55fc-7a40-ed1b-eae30d2fef16	IE	IRL	372	Ireland 	Irska	\N
00040000-55fc-7a40-5d9d-f80737e3ede1	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-55fc-7a40-3513-60e9baf99959	IL	ISR	376	Israel 	Izrael	\N
00040000-55fc-7a40-aa3b-d6b0cc0f5913	IT	ITA	380	Italy 	Italija	\N
00040000-55fc-7a40-8553-48e0baa23a43	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-55fc-7a40-a506-706cb52c3eb5	JP	JPN	392	Japan 	Japonska	\N
00040000-55fc-7a40-009c-67f7114da23e	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-55fc-7a40-35e7-bc44025f44fe	JO	JOR	400	Jordan 	Jordanija	\N
00040000-55fc-7a40-98da-216ed8d352ad	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-55fc-7a40-e3a3-9cde513184fd	KE	KEN	404	Kenya 	Kenija	\N
00040000-55fc-7a40-60b8-844783ea188b	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-55fc-7a40-ed3a-a1e6227bcda5	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-55fc-7a40-1119-0f3346ba292f	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-55fc-7a40-9464-c9dd605c68f0	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-55fc-7a40-a8f7-8c8dd535e6e1	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-55fc-7a40-3419-19408fe20511	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-55fc-7a40-0fde-06ff700d11a1	LV	LVA	428	Latvia 	Latvija	\N
00040000-55fc-7a40-c172-179003fb4277	LB	LBN	422	Lebanon 	Libanon	\N
00040000-55fc-7a40-0611-642f0d265720	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-55fc-7a40-1426-95e39ae88f41	LR	LBR	430	Liberia 	Liberija	\N
00040000-55fc-7a40-5a5e-5343c6d3de0d	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-55fc-7a40-f1f0-9a3401803393	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-55fc-7a40-f5d7-5833fade5693	LT	LTU	440	Lithuania 	Litva	\N
00040000-55fc-7a40-cabc-1c413dce8a4e	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-55fc-7a40-aebe-f34421e4e0e5	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-55fc-7a40-93a5-d43301ef13cf	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-55fc-7a40-000e-b0eb4d51cd67	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-55fc-7a40-c942-b8e062c328db	MW	MWI	454	Malawi 	Malavi	\N
00040000-55fc-7a40-6a12-06836baaa394	MY	MYS	458	Malaysia 	Malezija	\N
00040000-55fc-7a40-0856-efd119676033	MV	MDV	462	Maldives 	Maldivi	\N
00040000-55fc-7a40-da71-24f15ab6e464	ML	MLI	466	Mali 	Mali	\N
00040000-55fc-7a40-0b7f-7c0d6ffaa976	MT	MLT	470	Malta 	Malta	\N
00040000-55fc-7a40-b610-8f2febd29963	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-55fc-7a40-c26c-9fa9c2823e07	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-55fc-7a40-9cad-adfb93413f42	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-55fc-7a40-82e7-aacc1dc38b32	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-55fc-7a40-c3f9-79267178f198	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-55fc-7a40-ab46-cbb8a53751ae	MX	MEX	484	Mexico 	Mehika	\N
00040000-55fc-7a40-f674-22bfebd631a1	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-55fc-7a40-e40a-650b72a74d18	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-55fc-7a40-d862-7d1a7f091474	MC	MCO	492	Monaco 	Monako	\N
00040000-55fc-7a40-111c-43924b6ca65e	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-55fc-7a40-712e-a55a5135b59b	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-55fc-7a40-5fbc-d66605f2d610	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-55fc-7a40-0d6a-51438a452ae1	MA	MAR	504	Morocco 	Maroko	\N
00040000-55fc-7a40-21e1-5f51fabaff42	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-55fc-7a40-1365-5aec889eb578	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-55fc-7a40-85e5-062554727ddc	NA	NAM	516	Namibia 	Namibija	\N
00040000-55fc-7a40-34f6-fafd5b8e2efe	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-55fc-7a40-ea9e-71307e5ca44c	NP	NPL	524	Nepal 	Nepal	\N
00040000-55fc-7a40-159e-64c6fb112642	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-55fc-7a40-016d-cf96fe906be3	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-55fc-7a40-fe34-12c058456e57	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-55fc-7a40-892c-26c10056750a	NE	NER	562	Niger 	Niger 	\N
00040000-55fc-7a40-9127-6baa8647043f	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-55fc-7a40-5dbe-4ef84f231901	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-55fc-7a40-980a-aa4f471d0709	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-55fc-7a40-8bad-598d3049f1dc	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-55fc-7a40-292f-08615e50459f	NO	NOR	578	Norway 	Norveška	\N
00040000-55fc-7a40-1ba8-34ed7d074949	OM	OMN	512	Oman 	Oman	\N
00040000-55fc-7a40-acc6-3c056923b153	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-55fc-7a40-8ebc-67a3a95fb5b8	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-55fc-7a40-b9a5-ddf574679625	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-55fc-7a40-af6f-8780349f5842	PA	PAN	591	Panama 	Panama	\N
00040000-55fc-7a40-8611-ed8ac21e90bb	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-55fc-7a40-bc75-b621aa237ea7	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-55fc-7a40-8f32-09a1e4b77037	PE	PER	604	Peru 	Peru	\N
00040000-55fc-7a40-a906-4928722ce9c5	PH	PHL	608	Philippines 	Filipini	\N
00040000-55fc-7a40-3f6d-61abc9d35dd7	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-55fc-7a40-15ef-a047b52aa786	PL	POL	616	Poland 	Poljska	\N
00040000-55fc-7a40-583f-90dc0ea22f38	PT	PRT	620	Portugal 	Portugalska	\N
00040000-55fc-7a40-c400-519f30707a6f	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-55fc-7a40-975b-056ba920e000	QA	QAT	634	Qatar 	Katar	\N
00040000-55fc-7a40-3668-a09982473884	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-55fc-7a40-914a-c17f830efc90	RO	ROU	642	Romania 	Romunija	\N
00040000-55fc-7a40-efb9-e26f497e3c57	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-55fc-7a40-44b7-ccaf02c0d890	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-55fc-7a40-02c6-942113dc3431	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-55fc-7a40-4561-601ebd61a1b3	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-55fc-7a40-7e81-c8c43f81090c	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-55fc-7a40-74c2-d207104799ea	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-55fc-7a40-388b-19b5b5427a5a	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-55fc-7a40-c2ae-58bc621774f9	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-55fc-7a40-2441-505fdad2f4a6	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-55fc-7a40-d3c1-8fb14b6eac13	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-55fc-7a40-85ac-d8af00f63a02	SM	SMR	674	San Marino 	San Marino	\N
00040000-55fc-7a40-4743-88bd80774ab7	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-55fc-7a40-cd41-cd520b45cd2e	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-55fc-7a40-f50f-058e5e76bfc5	SN	SEN	686	Senegal 	Senegal	\N
00040000-55fc-7a40-467d-8cc13dd3a6fa	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-55fc-7a40-cb41-7a50bf2a26aa	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-55fc-7a40-5e5b-77e46114eb1d	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-55fc-7a40-0601-fa0b334a0e97	SG	SGP	702	Singapore 	Singapur	\N
00040000-55fc-7a40-6aad-c92ac8184395	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-55fc-7a40-2938-2f45d6186767	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-55fc-7a40-96e8-0eea5a732625	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-55fc-7a40-6bb2-f80e3f9564eb	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-55fc-7a40-06a8-393748132e6b	SO	SOM	706	Somalia 	Somalija	\N
00040000-55fc-7a40-a5fd-61e620ed79ee	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-55fc-7a40-f3b1-c4f2017f23a2	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-55fc-7a40-995b-d0dd16044af3	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-55fc-7a40-a6a4-efab84bfc311	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-55fc-7a40-6ac4-1343f159f8ef	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-55fc-7a40-1527-367a64e2e63c	SD	SDN	729	Sudan 	Sudan	\N
00040000-55fc-7a40-9779-9dafb6b4b693	SR	SUR	740	Suriname 	Surinam	\N
00040000-55fc-7a40-4cbd-e27d25659992	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-55fc-7a40-07cb-19399d8e3566	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-55fc-7a40-1d41-8211663355b7	SE	SWE	752	Sweden 	Švedska	\N
00040000-55fc-7a40-7016-1d676dc29cd9	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-55fc-7a40-e5e4-d613bd413aca	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-55fc-7a40-c6e0-03d05f054a7d	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-55fc-7a40-4827-6e47ef5fc156	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-55fc-7a40-03fe-a148e3ffaa7d	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-55fc-7a40-dbee-f3fd23478d41	TH	THA	764	Thailand 	Tajska	\N
00040000-55fc-7a40-713d-9bc0feb7cab3	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-55fc-7a40-0174-32c625309829	TG	TGO	768	Togo 	Togo	\N
00040000-55fc-7a40-ddbe-605d86f0f72a	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-55fc-7a40-ceb4-d7ae1764581e	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-55fc-7a40-c123-b9828a822876	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-55fc-7a40-edeb-26708db15d75	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-55fc-7a40-566b-f6bf3f1fb52b	TR	TUR	792	Turkey 	Turčija	\N
00040000-55fc-7a40-07de-e83b4ab9d69d	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-55fc-7a40-7c1c-953f5736a16a	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-55fc-7a40-319b-ffcfb2861af5	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-55fc-7a40-4911-d62c6c9544f2	UG	UGA	800	Uganda 	Uganda	\N
00040000-55fc-7a40-17b4-b28dd5b1d681	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-55fc-7a40-0a3b-2ee6e13aa03b	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-55fc-7a40-8efc-a5b73db1f139	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-55fc-7a40-0596-e5abf120799e	US	USA	840	United States 	Združene države Amerike	\N
00040000-55fc-7a40-0258-73cd344f8655	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-55fc-7a40-68d2-cf794f5ec084	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-55fc-7a40-3353-d532d113ee94	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-55fc-7a40-adb1-0464c9dbbee6	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-55fc-7a40-5dec-83f575f09a0e	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-55fc-7a40-6e4b-5255631ea4c9	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-55fc-7a40-b449-2a5af58088b5	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-55fc-7a40-9709-6888272aaf05	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-55fc-7a40-7e6c-29a1c50c5f18	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-55fc-7a40-9827-fa9263e0b214	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-55fc-7a40-f727-dffe9d7e2130	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-55fc-7a40-ca6d-01d42aec1378	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-55fc-7a40-f0ea-f8c56f1149b8	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 3300 (class 0 OID 1346356)
-- Dependencies: 232
-- Data for Name: enotaprograma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY enotaprograma (id, uprizoritev_id, program_dela_id, gostitelj_id, celotnavrednost, nasdelez, celotnavrednostmat, celotnavrednostgostovsz, zaproseno, lastnasredstva, avtorskihonorarji, avtorskihonorarjisamoz, tantieme, avtorskepravice, materialni, imakoprodukcije, vlozekgostitelja, drugijavni, stzaposlenih, stzaposumet, stzaposdrug, sthonorarnih, sthonorarnihigr, sthonorarnihigrtujjz, sthonorarnihigrsamoz, obiskdoma, obiskkopr, obiskgost, obiskzamejo, obiskint, obiskkoprint, ponovidoma, ponovikopr, ponovizamejo, ponovigost, ponovikoprint, ponoviint, naziv, kpe, sort, tipprogramskeenote_id, tip, prikoproducentu, strosekodkpred, stroskiostali, krajgostovanja, ustanova, datumgostovanja, transportnistroski, dnevprvzad, drzavagostovanja_id, stpe, zvrst, stpredstav, stokroglihmiz, stpredstavitev, stdelavnic, stdrugidogodki, stprodukcij, caspriprave, casizvedbe, prizorisca, umetvodja, programskotelo, sttujihselektorjev) FROM stdin;
\.


--
-- TOC entry 3288 (class 0 OID 1346207)
-- Dependencies: 220
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, podrocje, vodjaekipe, naziv, komentar, velikost, pomembna, sort, seplanira, dovoliprekrivanje, maxprekrivanj, tipfunkcije_id) FROM stdin;
\.


--
-- TOC entry 3265 (class 0 OID 1345989)
-- Dependencies: 197
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta, zamejstvo, kraj) FROM stdin;
\.


--
-- TOC entry 3261 (class 0 OID 1345932)
-- Dependencies: 193
-- Data for Name: job; Type: TABLE DATA; Schema: public; Owner: -
--

COPY job (id, user_id, name, task, status, log, datum, casizvedbe, izveden, data, alert, hidden, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3252 (class 0 OID 1345808)
-- Dependencies: 184
-- Data for Name: kontaktnaoseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kontaktnaoseba (id, popa_id, oseba_id, status, funkcija, opis) FROM stdin;
\.


--
-- TOC entry 3271 (class 0 OID 1346049)
-- Dependencies: 203
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 3308 (class 0 OID 1346523)
-- Dependencies: 240
-- Data for Name: mapa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa (id, lastnik_id, parent_id, ime, komentar, caskreiranja, casspremembe, javnidostop, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3309 (class 0 OID 1346535)
-- Dependencies: 241
-- Data for Name: mapa_zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa_zapis (mapa_id, zapis_id) FROM stdin;
\.


--
-- TOC entry 3310 (class 0 OID 1346542)
-- Dependencies: 242
-- Data for Name: mapaacl; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapaacl (id, mapa_id, perm_id, dostop, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3272 (class 0 OID 1346055)
-- Dependencies: 204
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 3253 (class 0 OID 1345820)
-- Dependencies: 185
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-55fc-7a41-49e5-9124ed4a4992	popa.stakli	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-55fc-7a41-3fc4-8493e0afab20	oseba.spol	array	a:2:{s:1:"M";a:1:{s:5:"label";s:6:"Moški";}s:1:"Z";a:1:{s:5:"label";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-55fc-7a41-5135-4ce7f7c40737	telefonska.vrsta	array	a:3:{s:7:"mobilna";a:1:{s:5:"label";s:7:"Mobilni";}s:6:"domaca";a:1:{s:5:"label";s:6:"Domač";}s:6:"fiksna";a:1:{s:5:"label";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-55fc-7a41-632a-72dbc11d6a33	kontaktnaoseba.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status kontaktne osebe
00000000-55fc-7a41-660a-0aa3b6b0f615	dogodek.status	array	a:7:{s:4:"100s";a:1:{s:5:"label";s:11:"Dolgoročno";}s:4:"200s";a:1:{s:5:"label";s:9:"Planirano";}s:4:"300s";a:1:{s:5:"label";s:8:"Fiksiran";}s:4:"400s";a:1:{s:5:"label";s:17:"Potrjen - interno";}s:4:"500s";a:1:{s:5:"label";s:15:"Potrjen - javno";}s:4:"600s";a:1:{s:5:"label";s:10:"Zaključen";}s:4:"700s";a:1:{s:5:"label";s:7:"Obdelan";}}	f	t	t	\N	Tabela statusa dogodkov
00000000-55fc-7a41-fd02-c77741857714	dogodek.razred	array	a:5:{s:4:"100s";a:2:{s:5:"label";s:9:"Predstava";s:4:"type";s:9:"predstava";}s:4:"200s";a:2:{s:5:"label";s:4:"Vaja";s:4:"type";s:4:"vaja";}s:4:"300s";a:2:{s:5:"label";s:10:"Gostovanje";s:4:"type";s:10:"gostovanje";}s:4:"400s";a:2:{s:5:"label";s:16:"Splošni dogodek";s:4:"type";s:8:"splošni";}s:4:"500s";a:2:{s:5:"label";s:10:"Zasedenost";s:4:"type";s:10:"zasedenost";}}	f	t	t	\N	Tabela razredov dogodkov, ki jih aplikacija podpira
00000000-55fc-7a41-2d89-d52e48a51283	uprizoritev.faza	array	a:6:{s:20:"predprodukcija-ideja";a:1:{s:5:"label";s:16:"Dolgoročni plan";}s:20:"predprodukcija-poziv";a:1:{s:5:"label";s:29:"Predprodukcija, v fazi poziva";}s:30:"predprodukcija-potrjen_program";a:1:{s:5:"label";s:34:"Predprodukcija, program je potrjen";}s:10:"produkcija";a:1:{s:5:"label";s:10:"Produkcija";}s:14:"postprodukcija";a:1:{s:5:"label";s:14:"Postprodukcija";}s:5:"arhiv";a:1:{s:5:"label";s:10:"Arhivirana";}}	f	t	f	\N	Faza uprizoritve
00000000-55fc-7a41-1924-f68407c82296	funkcija.podrocje	array	a:4:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}}	f	t	f	\N	Področje funkcije
00000000-55fc-7a41-3aee-60c4c9e91ba9	tipfunkcije.podrocje	array	a:4:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}}	f	t	f	\N	Področje funkcije
00000000-55fc-7a41-d012-89cfe427abb0	funkcija.velikost	array	a:4:{s:7:"stataza";a:1:{s:5:"label";s:8:"Stataža";}s:4:"mala";a:1:{s:5:"label";s:21:"Mala vloga / funkcija";}s:7:"srednja";a:1:{s:5:"label";s:24:"Srednja vloga / funkcija";}s:6:"velika";a:1:{s:5:"label";s:23:"Velika vloga / funkcija";}}	f	t	f	\N	Velikost funkcije
00000000-55fc-7a41-08c2-0605f36e4a5b	zaposlitev.status	array	a:2:{s:1:"A";a:1:{s:5:"label";s:7:"Aktivna";}s:1:"N";a:1:{s:5:"label";s:9:"Neaktivna";}}	f	t	f	\N	Status zaposlitve
00000000-55fc-7a41-0cc6-58a98c19ad61	produkcijskahisa.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktivna";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktivna";}}	f	t	f	\N	Status produkcijske hiše
00000000-55fc-7a41-0739-54eef4ee90b4	strosekuprizoritve.tipstroska	array	a:1:{s:10:"materialni";a:1:{s:5:"label";s:19:"Materialni strošek";}}	f	t	f	\N	Tip stroška
00000000-55fc-7a41-e363-efd1681fc7e4	fsacl.dostop	array	a:4:{s:1:"X";a:1:{s:5:"label";s:12:"Brez dostopa";}s:1:"R";a:1:{s:5:"label";s:11:"Samo branje";}s:2:"RW";a:1:{s:5:"label";s:17:"Branje in pisanje";}s:3:"RWD";a:1:{s:5:"label";s:26:"Branje pisanje in brisanje";}}	f	t	f	\N	ACL Javni dostop
\.


--
-- TOC entry 3254 (class 0 OID 1345832)
-- Dependencies: 186
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
\.


--
-- TOC entry 3255 (class 0 OID 1345843)
-- Dependencies: 187
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naslov_id, sifra, naziv, ime, priimek, funkcija, srednjeime, polnoime, psevdonim, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
\.


--
-- TOC entry 3243 (class 0 OID 1345725)
-- Dependencies: 175
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-55fc-7a41-5fc8-365741188c61	Aaa-read	Aaa (User,Role,Permission) - branje	f
00030000-55fc-7a41-5a39-e3f245769374	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	f
00030000-55fc-7a41-36ab-8507d54bf73d	TerminStoritve-vse	TerminStoritve - spreminjanje vseh zapisov	f
00030000-55fc-7a41-0c8b-aedb25d367e2	Dogodek-readVse	Dogodek - branje vseh, ne glede na status dogodka	f
00030000-55fc-7a41-9e4c-9fb998861333	Oseba-vse	Oseba - vse - za testiranje assert	f
00030000-55fc-7a41-5e9a-8f046308e656	ProgramDela-lock	ProgramDela - zaklepanje	f
00030000-55fc-7a41-7610-45d624db45d5	ProgramDela-unlock	ProgramDela - odklepanje	f
00030000-55fc-7a41-e104-3ce7a238fa75	Abonma-read	Abonma - branje	f
00030000-55fc-7a41-e8bb-488742cdf919	Abonma-write	Abonma - spreminjanje	f
00030000-55fc-7a41-568b-f006545a01d2	Alternacija-read	Alternacija - branje	f
00030000-55fc-7a41-77a3-506ab8d52d9b	Alternacija-write	Alternacija - spreminjanje	f
00030000-55fc-7a41-1550-67c6eccd0290	Arhivalija-read	Arhivalija - branje	f
00030000-55fc-7a41-f548-6c3dca9ef4ee	Arhivalija-write	Arhivalija - spreminjanje	f
00030000-55fc-7a41-834a-22e3469caa4d	AvtorBesedila-read	AvtorBesedila - branje	f
00030000-55fc-7a41-bf17-d5b47e780f7b	AvtorBesedila-write	AvtorBesedila - spreminjanje	f
00030000-55fc-7a41-2007-1b8f6551c437	Besedilo-read	Besedilo - branje	f
00030000-55fc-7a41-ab62-78d515130550	Besedilo-write	Besedilo - spreminjanje	f
00030000-55fc-7a41-8f72-3baa780b06e9	DogodekIzven-read	DogodekIzven - branje	f
00030000-55fc-7a41-e99f-cece170fe391	DogodekIzven-write	DogodekIzven - spreminjanje	f
00030000-55fc-7a41-8494-b29cec4c83d2	Dogodek-read	Dogodek - branje	f
00030000-55fc-7a41-8e9b-e8a3db1e2f36	Dogodek-write	Dogodek - spreminjanje	f
00030000-55fc-7a41-d9c7-49a97aa2e620	DrugiVir-read	DrugiVir - branje	f
00030000-55fc-7a41-ca32-7546200a04ff	DrugiVir-write	DrugiVir - spreminjanje	f
00030000-55fc-7a41-0439-177aa4b4473a	Drzava-read	Drzava - branje	f
00030000-55fc-7a41-b5b6-3e04bc127776	Drzava-write	Drzava - spreminjanje	f
00030000-55fc-7a41-0c9f-b7331619265a	EnotaPrograma-read	EnotaPrograma - branje	f
00030000-55fc-7a41-1468-a1e185eb6dd7	EnotaPrograma-write	EnotaPrograma - spreminjanje	f
00030000-55fc-7a41-c0fc-2bdc8e11766f	Funkcija-read	Funkcija - branje	f
00030000-55fc-7a41-f8de-900dc4fb8506	Funkcija-write	Funkcija - spreminjanje	f
00030000-55fc-7a41-736d-b95fe25fe151	Gostovanje-read	Gostovanje - branje	f
00030000-55fc-7a41-c178-9ec4bc7c5bc6	Gostovanje-write	Gostovanje - spreminjanje	f
00030000-55fc-7a41-5f0c-1216e646e6ab	Gostujoca-read	Gostujoca - branje	f
00030000-55fc-7a41-3bf6-97264d00171a	Gostujoca-write	Gostujoca - spreminjanje	f
00030000-55fc-7a41-38ab-4373f289addb	KontaktnaOseba-read	KontaktnaOseba - branje	f
00030000-55fc-7a41-c0a2-fd0980faca54	KontaktnaOseba-write	KontaktnaOseba - spreminjanje	f
00030000-55fc-7a41-d3d8-0d823fa73af9	Kupec-read	Kupec - branje	f
00030000-55fc-7a41-d0ab-801634338193	Kupec-write	Kupec - spreminjanje	f
00030000-55fc-7a41-6dee-1e2a8e8235d0	NacinPlacina-read	NacinPlacina - branje	f
00030000-55fc-7a41-9afb-42c20c0bd38f	NacinPlacina-write	NacinPlacina - spreminjanje	f
00030000-55fc-7a41-00af-3e47bf755552	Option-read	Option - branje	f
00030000-55fc-7a41-8f92-a40c0b8cb265	Option-write	Option - spreminjanje	f
00030000-55fc-7a41-0502-945dcace6de1	OptionValue-read	OptionValue - branje	f
00030000-55fc-7a41-5825-81bc7ce06e64	OptionValue-write	OptionValue - spreminjanje	f
00030000-55fc-7a41-f33b-56fc75515a3a	Oseba-read	Oseba - branje	f
00030000-55fc-7a41-5b2e-80946ff33bb3	Oseba-write	Oseba - spreminjanje	f
00030000-55fc-7a41-f5fb-1f0690940705	PlacilniInstrument-read	PlacilniInstrument - branje	f
00030000-55fc-7a41-719e-4d05d78f4bd3	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	f
00030000-55fc-7a41-7cb2-726f0bc9c887	PodrocjeSedenja-read	PodrocjeSedenja - branje	f
00030000-55fc-7a41-be58-eaef58ab1c74	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	f
00030000-55fc-7a41-4af8-bd5a2dad2494	Pogodba-read	Pogodba - branje	f
00030000-55fc-7a41-3bd5-d9a2a346b5ba	Pogodba-write	Pogodba - spreminjanje	f
00030000-55fc-7a41-dfdc-21f9cc74aad2	Popa-read	Popa - branje	f
00030000-55fc-7a41-8b50-b6dba657c80d	Popa-write	Popa - spreminjanje	f
00030000-55fc-7a41-64a7-043bd0c04470	Posta-read	Posta - branje	f
00030000-55fc-7a41-518e-d67faf163f6c	Posta-write	Posta - spreminjanje	f
00030000-55fc-7a41-2735-a8eec34e7328	PostavkaCDve-read	PostavkaCDve - branje	f
00030000-55fc-7a41-fc42-2d96783fa924	PostavkaCDve-write	PostavkaCDve - spreminjanje	f
00030000-55fc-7a41-643b-0dacbc9f86a6	PostavkaRacuna-read	PostavkaRacuna - branje	f
00030000-55fc-7a41-7e04-0050783eaa02	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	f
00030000-55fc-7a41-9bff-463d2ad68403	PostniNaslov-read	PostniNaslov - branje	f
00030000-55fc-7a41-ff36-541b3a849647	PostniNaslov-write	PostniNaslov - spreminjanje	f
00030000-55fc-7a41-2c4c-dbac90baae66	Predstava-read	Predstava - branje	f
00030000-55fc-7a41-71aa-554129e9e360	Predstava-write	Predstava - spreminjanje	f
00030000-55fc-7a41-7f55-c1339c0db64f	ProdajaPredstave-read	ProdajaPredstave - branje	f
00030000-55fc-7a41-3f16-7b6eba8baefa	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	f
00030000-55fc-7a41-ef95-e7d6af6d5b0b	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	f
00030000-55fc-7a41-bab7-b0dbd1142aad	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	f
00030000-55fc-7a41-6a08-79cb5fc8fd3d	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	f
00030000-55fc-7a41-50ac-1be03f47c1fd	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	f
00030000-55fc-7a41-66e5-6a93ab12acbe	ProgramDela-read	ProgramDela - branje	f
00030000-55fc-7a41-727d-b31a79d29740	ProgramDela-write	ProgramDela - spreminjanje	f
00030000-55fc-7a41-f08a-e4aba675d1e9	ProgramFestival-read	ProgramFestival - branje	f
00030000-55fc-7a41-2a73-ee3a1f9e11a5	ProgramFestival-write	ProgramFestival - spreminjanje	f
00030000-55fc-7a41-b85f-be5c042bdf12	ProgramGostovanje-read	ProgramGostovanje - branje	f
00030000-55fc-7a41-868b-fcbc646584ba	ProgramGostovanje-write	ProgramGostovanje - spreminjanje	f
00030000-55fc-7a41-e82e-896e02d43611	ProgramGostujoca-read	ProgramGostujoca - branje	f
00030000-55fc-7a41-c35d-b4df6911e34e	ProgramGostujoca-write	ProgramGostujoca - spreminjanje	f
00030000-55fc-7a41-75e7-2d339da2d1b0	ProgramIzjemni-read	ProgramIzjemni - branje	f
00030000-55fc-7a41-3656-bea20279e136	ProgramIzjemni-write	ProgramIzjemni - spreminjanje	f
00030000-55fc-7a41-72a8-97fb7b08f209	ProgramPonovitevPrejsnjih-read	ProgramPonovitevPrejsnjih - branje	f
00030000-55fc-7a41-8a48-ce6636b75f9a	ProgramPonovitevPrejsnjih-write	ProgramPonovitevPrejsnjih - spreminjanje	f
00030000-55fc-7a41-906c-09cfbbc50224	ProgramPonovitevPremiere-read	ProgramPonovitevPremiere - branje	f
00030000-55fc-7a41-7ab7-258217ce9866	ProgramPonovitevPremiere-write	ProgramPonovitevPremiere - spreminjanje	f
00030000-55fc-7a41-6314-d932222afca8	ProgramPremiera-read	ProgramPremiera - branje	f
00030000-55fc-7a41-a818-537f715a7c0e	ProgramPremiera-write	ProgramPremiera - spreminjanje	f
00030000-55fc-7a41-75ba-a94de6ac2e7d	ProgramRazno-read	ProgramRazno - branje	f
00030000-55fc-7a41-4a5f-068bf75dc16e	ProgramRazno-write	ProgramRazno - spreminjanje	f
00030000-55fc-7a41-3ccd-366a2e0264a1	ProgramskaEnotaSklopa-read	ProgramskaEnotaSklopa - branje	f
00030000-55fc-7a41-a5ad-cc739f4f64f1	ProgramskaEnotaSklopa-write	ProgramskaEnotaSklopa - spreminjanje	f
00030000-55fc-7a41-37fb-3227d445e55f	Prostor-read	Prostor - branje	f
00030000-55fc-7a41-41cf-48c906e44595	Prostor-write	Prostor - spreminjanje	f
00030000-55fc-7a41-5c46-f453aae31a11	Racun-read	Racun - branje	f
00030000-55fc-7a41-bc62-4d347a6c8009	Racun-write	Racun - spreminjanje	f
00030000-55fc-7a41-fc1d-8ff3fb6dc4e1	RazpisanSedez-read	RazpisanSedez - branje	f
00030000-55fc-7a41-a9b6-417af12044c4	RazpisanSedez-write	RazpisanSedez - spreminjanje	f
00030000-55fc-7a41-e363-aecff4859f6e	Rekviziterstvo-read	Rekviziterstvo - branje	f
00030000-55fc-7a41-471b-bee6dccfaf24	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	f
00030000-55fc-7a41-65fa-8f82a5e29678	Rekvizit-read	Rekvizit - branje	f
00030000-55fc-7a41-43f4-1bd94e79444c	Rekvizit-write	Rekvizit - spreminjanje	f
00030000-55fc-7a41-b298-aa5bfb572a63	Revizija-read	Revizija - branje	f
00030000-55fc-7a41-7af5-e4845ebe2c61	Revizija-write	Revizija - spreminjanje	f
00030000-55fc-7a41-d619-27e25e97f884	Rezervacija-read	Rezervacija - branje	f
00030000-55fc-7a41-95fc-842c86854493	Rezervacija-write	Rezervacija - spreminjanje	f
00030000-55fc-7a41-3393-9f74d049b436	SedezniRed-read	SedezniRed - branje	f
00030000-55fc-7a41-92aa-bf29b21da2d9	SedezniRed-write	SedezniRed - spreminjanje	f
00030000-55fc-7a41-17cc-53354e3e440a	Sedez-read	Sedez - branje	f
00030000-55fc-7a41-2c63-56e796207a25	Sedez-write	Sedez - spreminjanje	f
00030000-55fc-7a41-a4ba-b2ddef2591e3	Sezona-read	Sezona - branje	f
00030000-55fc-7a41-75ca-51315c2200db	Sezona-write	Sezona - spreminjanje	f
00030000-55fc-7a41-bb7a-7c6321a05132	StevilcenjeKonfig-read	StevilcenjeKonfig - branje	f
00030000-55fc-7a41-b743-b84ce1fd4642	StevilcenjeKonfig-write	StevilcenjeKonfig - spreminjanje	f
00030000-55fc-7a41-7b38-0b3b36cf7077	Stevilcenje-read	Stevilcenje - branje	f
00030000-55fc-7a41-b102-2c1bd4203de5	Stevilcenje-write	Stevilcenje - spreminjanje	f
00030000-55fc-7a41-a44c-9e126fa2ecd7	StevilcenjeStanje-read	StevilcenjeStanje - branje	f
00030000-55fc-7a41-84fe-8b17f2fae146	StevilcenjeStanje-write	StevilcenjeStanje - spreminjanje	f
00030000-55fc-7a41-9bad-27bbe5d20ecc	StrosekUprizoritve-read	StrosekUprizoritve - branje	f
00030000-55fc-7a41-c33a-2b5680340568	StrosekUprizoritve-write	StrosekUprizoritve - spreminjanje	f
00030000-55fc-7a41-fed7-1f98e05ea7f0	Telefonska-read	Telefonska - branje	f
00030000-55fc-7a41-4715-59e454ff9ce5	Telefonska-write	Telefonska - spreminjanje	f
00030000-55fc-7a41-2e28-4c24f9e29f0a	TerminStoritve-read	TerminStoritve - branje	f
00030000-55fc-7a41-13d3-cd0f8ae18e1d	TerminStoritve-write	TerminStoritve - spreminjanje	f
00030000-55fc-7a41-4ed4-f3f2ffbe28f6	TipFunkcije-read	TipFunkcije - branje	f
00030000-55fc-7a41-b6f8-2c41227ba7bc	TipFunkcije-write	TipFunkcije - spreminjanje	f
00030000-55fc-7a41-5017-d19e247cd272	TipProgramskeEnote-read	TipProgramskeEnote - branje	f
00030000-55fc-7a41-c3f7-70b1396d6f37	TipProgramskeEnote-write	TipProgramskeEnote - spreminjanje	f
00030000-55fc-7a41-5333-a5e214f746ea	Trr-read	Trr - branje	f
00030000-55fc-7a41-d0fa-e101d0d49de7	Trr-write	Trr - spreminjanje	f
00030000-55fc-7a41-ab83-8923e0379b48	Uprizoritev-read	Uprizoritev - branje	f
00030000-55fc-7a41-8ab4-d461cb27d88f	Uprizoritev-write	Uprizoritev - spreminjanje	f
00030000-55fc-7a41-2a03-70a4ab366a66	Vaja-read	Vaja - branje	f
00030000-55fc-7a41-fbb7-55cad050338b	Vaja-write	Vaja - spreminjanje	f
00030000-55fc-7a41-2d6a-df2594b70786	VrstaSedezev-read	VrstaSedezev - branje	f
00030000-55fc-7a41-c028-1e145e54bcd1	VrstaSedezev-write	VrstaSedezev - spreminjanje	f
00030000-55fc-7a41-0f03-e7be34bf921c	VrstaStroska-read	VrstaStroska - branje	f
00030000-55fc-7a41-d62d-6957e8e39ea9	VrstaStroska-write	VrstaStroska - spreminjanje	f
00030000-55fc-7a41-f181-805cee38bf48	Zaposlitev-read	Zaposlitev - branje	f
00030000-55fc-7a41-a2ba-784f80fe8054	Zaposlitev-write	Zaposlitev - spreminjanje	f
00030000-55fc-7a41-1ace-3d6e7d044204	Zasedenost-read	Zasedenost - branje	f
00030000-55fc-7a41-ff55-f5433076faa5	Zasedenost-write	Zasedenost - spreminjanje	f
00030000-55fc-7a41-83c8-983dfc5fc63d	ZvrstSurs-read	ZvrstSurs - branje	f
00030000-55fc-7a41-f3f5-2a053989186c	ZvrstSurs-write	ZvrstSurs - spreminjanje	f
00030000-55fc-7a41-f40a-4e4cf1670af5	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	f
00030000-55fc-7a41-22bc-6f58259434e5	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	f
00030000-55fc-7a41-dae8-1bb85aaa1458	Job-read	Branje opravil - samo zase - branje	f
00030000-55fc-7a41-7c17-300513bcdfce	Job-write	Dodajanje in spreminjanje opravil - samo zase	f
00030000-55fc-7a41-a33f-ac34f0d7e4c5	Job-admin	Upravljanje opravil za vse uporabnike	f
00030000-55fc-7a41-8ec9-07fa6386cb02	Mapa-write	Mapa - osnovno dovoljenje za pisanje	f
00030000-55fc-7a41-4534-f3b3fb407bf2	Mapa-read	Mapa - osnovno dovoljenje za branje	f
00030000-55fc-7a41-2b34-675fd46bbca9	MapaAcl-write	MapaAcl - dovoljenje za dostop pisanje ACL-jev mape	f
00030000-55fc-7a41-79f2-bf0d1cb36ac9	MapaAcl-read	MapaAcl - dovoljenje za dostop branje ACL-jev mape	f
00030000-55fc-7a41-2310-7d9dbebdc1f3	Zapis-write	Zapis - dovoljenje za pisanje zapisov	f
00030000-55fc-7a41-282c-7983e3a1dc51	Zapis-read	Zapis - dovoljenje za pisanje zapisov	f
00030000-55fc-7a41-1fe8-5afc6187036d	ZapisLastnik-write	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	f
00030000-55fc-7a41-5ac0-f35aefe3cd4a	ZapisLastnik-read	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	f
00030000-55fc-7a41-a865-565ed68d7163	VrstaZapisa-write	Šifrant vrst zapisa - spreminjanje	f
00030000-55fc-7a41-40c9-4f464147551c	VrstaZapisa-read	Šifrant vrst zapisa - branje	f
00030000-55fc-7a41-8d6d-835e1190b577	Datoteka-write	Datoteka - spreminjanje	f
00030000-55fc-7a41-3ba9-74d4a6e0aad3	Datoteka-read	Datoteke - branje	f
\.


--
-- TOC entry 3247 (class 0 OID 1345755)
-- Dependencies: 179
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-55fc-7a41-f213-a0d864a3a05c	00030000-55fc-7a41-5a39-e3f245769374
00020000-55fc-7a41-dc58-022c516e42d6	00030000-55fc-7a41-0439-177aa4b4473a
00020000-55fc-7a41-1fe2-73b446d774e6	00030000-55fc-7a41-e104-3ce7a238fa75
00020000-55fc-7a41-1fe2-73b446d774e6	00030000-55fc-7a41-e8bb-488742cdf919
00020000-55fc-7a41-1fe2-73b446d774e6	00030000-55fc-7a41-568b-f006545a01d2
00020000-55fc-7a41-1fe2-73b446d774e6	00030000-55fc-7a41-77a3-506ab8d52d9b
00020000-55fc-7a41-1fe2-73b446d774e6	00030000-55fc-7a41-1550-67c6eccd0290
00020000-55fc-7a41-1fe2-73b446d774e6	00030000-55fc-7a41-8494-b29cec4c83d2
00020000-55fc-7a41-1fe2-73b446d774e6	00030000-55fc-7a41-0c8b-aedb25d367e2
00020000-55fc-7a41-1fe2-73b446d774e6	00030000-55fc-7a41-8e9b-e8a3db1e2f36
00020000-55fc-7a41-1fe2-73b446d774e6	00030000-55fc-7a41-0439-177aa4b4473a
00020000-55fc-7a41-1fe2-73b446d774e6	00030000-55fc-7a41-b5b6-3e04bc127776
00020000-55fc-7a41-1fe2-73b446d774e6	00030000-55fc-7a41-c0fc-2bdc8e11766f
00020000-55fc-7a41-1fe2-73b446d774e6	00030000-55fc-7a41-f8de-900dc4fb8506
00020000-55fc-7a41-1fe2-73b446d774e6	00030000-55fc-7a41-736d-b95fe25fe151
00020000-55fc-7a41-1fe2-73b446d774e6	00030000-55fc-7a41-c178-9ec4bc7c5bc6
00020000-55fc-7a41-1fe2-73b446d774e6	00030000-55fc-7a41-5f0c-1216e646e6ab
00020000-55fc-7a41-1fe2-73b446d774e6	00030000-55fc-7a41-3bf6-97264d00171a
00020000-55fc-7a41-1fe2-73b446d774e6	00030000-55fc-7a41-38ab-4373f289addb
00020000-55fc-7a41-1fe2-73b446d774e6	00030000-55fc-7a41-c0a2-fd0980faca54
00020000-55fc-7a41-1fe2-73b446d774e6	00030000-55fc-7a41-00af-3e47bf755552
00020000-55fc-7a41-1fe2-73b446d774e6	00030000-55fc-7a41-0502-945dcace6de1
00020000-55fc-7a41-1fe2-73b446d774e6	00030000-55fc-7a41-f33b-56fc75515a3a
00020000-55fc-7a41-1fe2-73b446d774e6	00030000-55fc-7a41-5b2e-80946ff33bb3
00020000-55fc-7a41-1fe2-73b446d774e6	00030000-55fc-7a41-dfdc-21f9cc74aad2
00020000-55fc-7a41-1fe2-73b446d774e6	00030000-55fc-7a41-8b50-b6dba657c80d
00020000-55fc-7a41-1fe2-73b446d774e6	00030000-55fc-7a41-64a7-043bd0c04470
00020000-55fc-7a41-1fe2-73b446d774e6	00030000-55fc-7a41-518e-d67faf163f6c
00020000-55fc-7a41-1fe2-73b446d774e6	00030000-55fc-7a41-9bff-463d2ad68403
00020000-55fc-7a41-1fe2-73b446d774e6	00030000-55fc-7a41-ff36-541b3a849647
00020000-55fc-7a41-1fe2-73b446d774e6	00030000-55fc-7a41-2c4c-dbac90baae66
00020000-55fc-7a41-1fe2-73b446d774e6	00030000-55fc-7a41-71aa-554129e9e360
00020000-55fc-7a41-1fe2-73b446d774e6	00030000-55fc-7a41-6a08-79cb5fc8fd3d
00020000-55fc-7a41-1fe2-73b446d774e6	00030000-55fc-7a41-50ac-1be03f47c1fd
00020000-55fc-7a41-1fe2-73b446d774e6	00030000-55fc-7a41-37fb-3227d445e55f
00020000-55fc-7a41-1fe2-73b446d774e6	00030000-55fc-7a41-41cf-48c906e44595
00020000-55fc-7a41-1fe2-73b446d774e6	00030000-55fc-7a41-e363-aecff4859f6e
00020000-55fc-7a41-1fe2-73b446d774e6	00030000-55fc-7a41-471b-bee6dccfaf24
00020000-55fc-7a41-1fe2-73b446d774e6	00030000-55fc-7a41-65fa-8f82a5e29678
00020000-55fc-7a41-1fe2-73b446d774e6	00030000-55fc-7a41-43f4-1bd94e79444c
00020000-55fc-7a41-1fe2-73b446d774e6	00030000-55fc-7a41-a4ba-b2ddef2591e3
00020000-55fc-7a41-1fe2-73b446d774e6	00030000-55fc-7a41-75ca-51315c2200db
00020000-55fc-7a41-1fe2-73b446d774e6	00030000-55fc-7a41-4ed4-f3f2ffbe28f6
00020000-55fc-7a41-1fe2-73b446d774e6	00030000-55fc-7a41-ab83-8923e0379b48
00020000-55fc-7a41-1fe2-73b446d774e6	00030000-55fc-7a41-8ab4-d461cb27d88f
00020000-55fc-7a41-1fe2-73b446d774e6	00030000-55fc-7a41-2a03-70a4ab366a66
00020000-55fc-7a41-1fe2-73b446d774e6	00030000-55fc-7a41-fbb7-55cad050338b
00020000-55fc-7a41-1fe2-73b446d774e6	00030000-55fc-7a41-1ace-3d6e7d044204
00020000-55fc-7a41-1fe2-73b446d774e6	00030000-55fc-7a41-ff55-f5433076faa5
00020000-55fc-7a41-1fe2-73b446d774e6	00030000-55fc-7a41-83c8-983dfc5fc63d
00020000-55fc-7a41-1fe2-73b446d774e6	00030000-55fc-7a41-f40a-4e4cf1670af5
00020000-55fc-7a41-44a1-442ef97990b2	00030000-55fc-7a41-e104-3ce7a238fa75
00020000-55fc-7a41-44a1-442ef97990b2	00030000-55fc-7a41-1550-67c6eccd0290
00020000-55fc-7a41-44a1-442ef97990b2	00030000-55fc-7a41-8494-b29cec4c83d2
00020000-55fc-7a41-44a1-442ef97990b2	00030000-55fc-7a41-0439-177aa4b4473a
00020000-55fc-7a41-44a1-442ef97990b2	00030000-55fc-7a41-736d-b95fe25fe151
00020000-55fc-7a41-44a1-442ef97990b2	00030000-55fc-7a41-5f0c-1216e646e6ab
00020000-55fc-7a41-44a1-442ef97990b2	00030000-55fc-7a41-38ab-4373f289addb
00020000-55fc-7a41-44a1-442ef97990b2	00030000-55fc-7a41-c0a2-fd0980faca54
00020000-55fc-7a41-44a1-442ef97990b2	00030000-55fc-7a41-00af-3e47bf755552
00020000-55fc-7a41-44a1-442ef97990b2	00030000-55fc-7a41-0502-945dcace6de1
00020000-55fc-7a41-44a1-442ef97990b2	00030000-55fc-7a41-f33b-56fc75515a3a
00020000-55fc-7a41-44a1-442ef97990b2	00030000-55fc-7a41-5b2e-80946ff33bb3
00020000-55fc-7a41-44a1-442ef97990b2	00030000-55fc-7a41-dfdc-21f9cc74aad2
00020000-55fc-7a41-44a1-442ef97990b2	00030000-55fc-7a41-64a7-043bd0c04470
00020000-55fc-7a41-44a1-442ef97990b2	00030000-55fc-7a41-9bff-463d2ad68403
00020000-55fc-7a41-44a1-442ef97990b2	00030000-55fc-7a41-ff36-541b3a849647
00020000-55fc-7a41-44a1-442ef97990b2	00030000-55fc-7a41-2c4c-dbac90baae66
00020000-55fc-7a41-44a1-442ef97990b2	00030000-55fc-7a41-37fb-3227d445e55f
00020000-55fc-7a41-44a1-442ef97990b2	00030000-55fc-7a41-e363-aecff4859f6e
00020000-55fc-7a41-44a1-442ef97990b2	00030000-55fc-7a41-65fa-8f82a5e29678
00020000-55fc-7a41-44a1-442ef97990b2	00030000-55fc-7a41-a4ba-b2ddef2591e3
00020000-55fc-7a41-44a1-442ef97990b2	00030000-55fc-7a41-fed7-1f98e05ea7f0
00020000-55fc-7a41-44a1-442ef97990b2	00030000-55fc-7a41-4715-59e454ff9ce5
00020000-55fc-7a41-44a1-442ef97990b2	00030000-55fc-7a41-5333-a5e214f746ea
00020000-55fc-7a41-44a1-442ef97990b2	00030000-55fc-7a41-d0fa-e101d0d49de7
00020000-55fc-7a41-44a1-442ef97990b2	00030000-55fc-7a41-f181-805cee38bf48
00020000-55fc-7a41-44a1-442ef97990b2	00030000-55fc-7a41-a2ba-784f80fe8054
00020000-55fc-7a41-44a1-442ef97990b2	00030000-55fc-7a41-83c8-983dfc5fc63d
00020000-55fc-7a41-44a1-442ef97990b2	00030000-55fc-7a41-f40a-4e4cf1670af5
00020000-55fc-7a41-30fe-7ed26f196268	00030000-55fc-7a41-e104-3ce7a238fa75
00020000-55fc-7a41-30fe-7ed26f196268	00030000-55fc-7a41-568b-f006545a01d2
00020000-55fc-7a41-30fe-7ed26f196268	00030000-55fc-7a41-1550-67c6eccd0290
00020000-55fc-7a41-30fe-7ed26f196268	00030000-55fc-7a41-f548-6c3dca9ef4ee
00020000-55fc-7a41-30fe-7ed26f196268	00030000-55fc-7a41-2007-1b8f6551c437
00020000-55fc-7a41-30fe-7ed26f196268	00030000-55fc-7a41-8f72-3baa780b06e9
00020000-55fc-7a41-30fe-7ed26f196268	00030000-55fc-7a41-8494-b29cec4c83d2
00020000-55fc-7a41-30fe-7ed26f196268	00030000-55fc-7a41-0439-177aa4b4473a
00020000-55fc-7a41-30fe-7ed26f196268	00030000-55fc-7a41-c0fc-2bdc8e11766f
00020000-55fc-7a41-30fe-7ed26f196268	00030000-55fc-7a41-736d-b95fe25fe151
00020000-55fc-7a41-30fe-7ed26f196268	00030000-55fc-7a41-5f0c-1216e646e6ab
00020000-55fc-7a41-30fe-7ed26f196268	00030000-55fc-7a41-38ab-4373f289addb
00020000-55fc-7a41-30fe-7ed26f196268	00030000-55fc-7a41-00af-3e47bf755552
00020000-55fc-7a41-30fe-7ed26f196268	00030000-55fc-7a41-0502-945dcace6de1
00020000-55fc-7a41-30fe-7ed26f196268	00030000-55fc-7a41-f33b-56fc75515a3a
00020000-55fc-7a41-30fe-7ed26f196268	00030000-55fc-7a41-dfdc-21f9cc74aad2
00020000-55fc-7a41-30fe-7ed26f196268	00030000-55fc-7a41-64a7-043bd0c04470
00020000-55fc-7a41-30fe-7ed26f196268	00030000-55fc-7a41-2c4c-dbac90baae66
00020000-55fc-7a41-30fe-7ed26f196268	00030000-55fc-7a41-6a08-79cb5fc8fd3d
00020000-55fc-7a41-30fe-7ed26f196268	00030000-55fc-7a41-37fb-3227d445e55f
00020000-55fc-7a41-30fe-7ed26f196268	00030000-55fc-7a41-e363-aecff4859f6e
00020000-55fc-7a41-30fe-7ed26f196268	00030000-55fc-7a41-65fa-8f82a5e29678
00020000-55fc-7a41-30fe-7ed26f196268	00030000-55fc-7a41-a4ba-b2ddef2591e3
00020000-55fc-7a41-30fe-7ed26f196268	00030000-55fc-7a41-4ed4-f3f2ffbe28f6
00020000-55fc-7a41-30fe-7ed26f196268	00030000-55fc-7a41-2a03-70a4ab366a66
00020000-55fc-7a41-30fe-7ed26f196268	00030000-55fc-7a41-1ace-3d6e7d044204
00020000-55fc-7a41-30fe-7ed26f196268	00030000-55fc-7a41-83c8-983dfc5fc63d
00020000-55fc-7a41-30fe-7ed26f196268	00030000-55fc-7a41-f40a-4e4cf1670af5
00020000-55fc-7a41-3245-65fe7c2bb07d	00030000-55fc-7a41-e104-3ce7a238fa75
00020000-55fc-7a41-3245-65fe7c2bb07d	00030000-55fc-7a41-e8bb-488742cdf919
00020000-55fc-7a41-3245-65fe7c2bb07d	00030000-55fc-7a41-77a3-506ab8d52d9b
00020000-55fc-7a41-3245-65fe7c2bb07d	00030000-55fc-7a41-1550-67c6eccd0290
00020000-55fc-7a41-3245-65fe7c2bb07d	00030000-55fc-7a41-8494-b29cec4c83d2
00020000-55fc-7a41-3245-65fe7c2bb07d	00030000-55fc-7a41-0439-177aa4b4473a
00020000-55fc-7a41-3245-65fe7c2bb07d	00030000-55fc-7a41-736d-b95fe25fe151
00020000-55fc-7a41-3245-65fe7c2bb07d	00030000-55fc-7a41-5f0c-1216e646e6ab
00020000-55fc-7a41-3245-65fe7c2bb07d	00030000-55fc-7a41-00af-3e47bf755552
00020000-55fc-7a41-3245-65fe7c2bb07d	00030000-55fc-7a41-0502-945dcace6de1
00020000-55fc-7a41-3245-65fe7c2bb07d	00030000-55fc-7a41-dfdc-21f9cc74aad2
00020000-55fc-7a41-3245-65fe7c2bb07d	00030000-55fc-7a41-64a7-043bd0c04470
00020000-55fc-7a41-3245-65fe7c2bb07d	00030000-55fc-7a41-2c4c-dbac90baae66
00020000-55fc-7a41-3245-65fe7c2bb07d	00030000-55fc-7a41-37fb-3227d445e55f
00020000-55fc-7a41-3245-65fe7c2bb07d	00030000-55fc-7a41-e363-aecff4859f6e
00020000-55fc-7a41-3245-65fe7c2bb07d	00030000-55fc-7a41-65fa-8f82a5e29678
00020000-55fc-7a41-3245-65fe7c2bb07d	00030000-55fc-7a41-a4ba-b2ddef2591e3
00020000-55fc-7a41-3245-65fe7c2bb07d	00030000-55fc-7a41-4ed4-f3f2ffbe28f6
00020000-55fc-7a41-3245-65fe7c2bb07d	00030000-55fc-7a41-83c8-983dfc5fc63d
00020000-55fc-7a41-3245-65fe7c2bb07d	00030000-55fc-7a41-f40a-4e4cf1670af5
00020000-55fc-7a41-09d4-1340ef4f2288	00030000-55fc-7a41-e104-3ce7a238fa75
00020000-55fc-7a41-09d4-1340ef4f2288	00030000-55fc-7a41-1550-67c6eccd0290
00020000-55fc-7a41-09d4-1340ef4f2288	00030000-55fc-7a41-8494-b29cec4c83d2
00020000-55fc-7a41-09d4-1340ef4f2288	00030000-55fc-7a41-0439-177aa4b4473a
00020000-55fc-7a41-09d4-1340ef4f2288	00030000-55fc-7a41-736d-b95fe25fe151
00020000-55fc-7a41-09d4-1340ef4f2288	00030000-55fc-7a41-5f0c-1216e646e6ab
00020000-55fc-7a41-09d4-1340ef4f2288	00030000-55fc-7a41-00af-3e47bf755552
00020000-55fc-7a41-09d4-1340ef4f2288	00030000-55fc-7a41-0502-945dcace6de1
00020000-55fc-7a41-09d4-1340ef4f2288	00030000-55fc-7a41-dfdc-21f9cc74aad2
00020000-55fc-7a41-09d4-1340ef4f2288	00030000-55fc-7a41-64a7-043bd0c04470
00020000-55fc-7a41-09d4-1340ef4f2288	00030000-55fc-7a41-2c4c-dbac90baae66
00020000-55fc-7a41-09d4-1340ef4f2288	00030000-55fc-7a41-37fb-3227d445e55f
00020000-55fc-7a41-09d4-1340ef4f2288	00030000-55fc-7a41-e363-aecff4859f6e
00020000-55fc-7a41-09d4-1340ef4f2288	00030000-55fc-7a41-65fa-8f82a5e29678
00020000-55fc-7a41-09d4-1340ef4f2288	00030000-55fc-7a41-a4ba-b2ddef2591e3
00020000-55fc-7a41-09d4-1340ef4f2288	00030000-55fc-7a41-2e28-4c24f9e29f0a
00020000-55fc-7a41-09d4-1340ef4f2288	00030000-55fc-7a41-36ab-8507d54bf73d
00020000-55fc-7a41-09d4-1340ef4f2288	00030000-55fc-7a41-4ed4-f3f2ffbe28f6
00020000-55fc-7a41-09d4-1340ef4f2288	00030000-55fc-7a41-83c8-983dfc5fc63d
00020000-55fc-7a41-09d4-1340ef4f2288	00030000-55fc-7a41-f40a-4e4cf1670af5
\.


--
-- TOC entry 3273 (class 0 OID 1346062)
-- Dependencies: 205
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 3274 (class 0 OID 1346069)
-- Dependencies: 206
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 3289 (class 0 OID 1346222)
-- Dependencies: 221
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, zacetek, konec, jeavtorskepravice, placilonavajo, vrednostvaje, planiranostevilovaj, vrednostvaj, vrednostpredstave, vrednostdopremiere, aktivna, zaposlenvdrjz, samozaposlen, igralec, opis) FROM stdin;
\.


--
-- TOC entry 3256 (class 0 OID 1345868)
-- Dependencies: 188
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, drzava_id, sifra, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo, nvo) FROM stdin;
\.


--
-- TOC entry 3257 (class 0 OID 1345887)
-- Dependencies: 189
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-55fc-7a40-46d5-2e07f80bf8b6	8341	Adlešiči
00050000-55fc-7a40-7943-bfc0d5f95aca	5270	Ajdovščina
00050000-55fc-7a40-347c-2709adebb898	6280	Ankaran/Ancarano
00050000-55fc-7a40-2125-b95859261924	9253	Apače
00050000-55fc-7a40-ca5a-2431e1976cdf	8253	Artiče
00050000-55fc-7a40-a4ba-be23c40c0b56	4275	Begunje na Gorenjskem
00050000-55fc-7a40-539d-fbcec5c7f5d3	1382	Begunje pri Cerknici
00050000-55fc-7a40-863f-9bce73583a78	9231	Beltinci
00050000-55fc-7a40-4d2a-27abaa27c583	2234	Benedikt
00050000-55fc-7a40-225e-de965972131a	2345	Bistrica ob Dravi
00050000-55fc-7a40-3586-c79d59d91dea	3256	Bistrica ob Sotli
00050000-55fc-7a40-5e51-2b0164ef0c92	8259	Bizeljsko
00050000-55fc-7a40-ad62-be209b4d0adc	1223	Blagovica
00050000-55fc-7a40-b7b2-3a898e6e6696	8283	Blanca
00050000-55fc-7a40-f1c3-401927e811b1	4260	Bled
00050000-55fc-7a40-29c0-6fee96636f1c	4273	Blejska Dobrava
00050000-55fc-7a40-1132-07b018af98a6	9265	Bodonci
00050000-55fc-7a40-6754-818dcf59430d	9222	Bogojina
00050000-55fc-7a40-2384-c72031ae5e85	4263	Bohinjska Bela
00050000-55fc-7a40-6840-39c97a9ac3f1	4264	Bohinjska Bistrica
00050000-55fc-7a40-dcc3-c91813f6c5a1	4265	Bohinjsko jezero
00050000-55fc-7a40-4db4-0e95f81d3ee6	1353	Borovnica
00050000-55fc-7a40-825b-b1675f12d64d	8294	Boštanj
00050000-55fc-7a40-ae83-7c453c4c23ce	5230	Bovec
00050000-55fc-7a40-7255-3781b334012c	5295	Branik
00050000-55fc-7a40-4f65-16f766e0a345	3314	Braslovče
00050000-55fc-7a40-ee83-2333631b4e9c	5223	Breginj
00050000-55fc-7a40-9b31-59055f703220	8280	Brestanica
00050000-55fc-7a40-cdb5-03490cb8d95b	2354	Bresternica
00050000-55fc-7a40-3475-35801f968a64	4243	Brezje
00050000-55fc-7a40-a85d-8f4f41b41c72	1351	Brezovica pri Ljubljani
00050000-55fc-7a40-9ed4-44d29994e0df	8250	Brežice
00050000-55fc-7a40-ea67-862da7a351e8	4210	Brnik - Aerodrom
00050000-55fc-7a40-826a-3a375365aa60	8321	Brusnice
00050000-55fc-7a40-35d0-0d9a21ac3ec1	3255	Buče
00050000-55fc-7a40-2df9-4b9ff5644ab3	8276	Bučka 
00050000-55fc-7a40-15e8-ba2f18439b97	9261	Cankova
00050000-55fc-7a40-b72e-a70ea99a80b2	3000	Celje 
00050000-55fc-7a40-598d-4280cb9799ee	3001	Celje - poštni predali
00050000-55fc-7a40-3d30-50dd0538cb01	4207	Cerklje na Gorenjskem
00050000-55fc-7a40-4d98-50b31e866c17	8263	Cerklje ob Krki
00050000-55fc-7a40-b945-d9d977404638	1380	Cerknica
00050000-55fc-7a40-a113-dfb40b11023c	5282	Cerkno
00050000-55fc-7a40-509e-6ae669d3c1d6	2236	Cerkvenjak
00050000-55fc-7a40-dde7-c4214b6e1dc9	2215	Ceršak
00050000-55fc-7a40-a11a-fa26916c8681	2326	Cirkovce
00050000-55fc-7a40-9887-a96bf9ed081c	2282	Cirkulane
00050000-55fc-7a40-59ff-69f11ceccdef	5273	Col
00050000-55fc-7a40-ebd1-d1ef82ca0104	8251	Čatež ob Savi
00050000-55fc-7a40-7e6c-21ec0a98271c	1413	Čemšenik
00050000-55fc-7a40-8d11-1bf266601437	5253	Čepovan
00050000-55fc-7a40-3550-1bed261ffb3c	9232	Črenšovci
00050000-55fc-7a40-4bdb-ecc8cc032a7b	2393	Črna na Koroškem
00050000-55fc-7a40-b930-203c3eff07e4	6275	Črni Kal
00050000-55fc-7a40-944a-a989da611df2	5274	Črni Vrh nad Idrijo
00050000-55fc-7a40-c046-fb94c50a2075	5262	Črniče
00050000-55fc-7a40-ef5f-88fe71db87a6	8340	Črnomelj
00050000-55fc-7a40-e353-d83484de9885	6271	Dekani
00050000-55fc-7a40-38b2-baf3a3ff3191	5210	Deskle
00050000-55fc-7a40-2871-6ae0afb091d3	2253	Destrnik
00050000-55fc-7a40-912d-7acc386dbf1d	6215	Divača
00050000-55fc-7a40-8beb-3f5f806e5a4c	1233	Dob
00050000-55fc-7a40-6a53-521a52694794	3224	Dobje pri Planini
00050000-55fc-7a40-dea6-d7d9ebeb5103	8257	Dobova
00050000-55fc-7a40-9a2c-7d565fef10cf	1423	Dobovec
00050000-55fc-7a40-9ada-92e1e9f4bac0	5263	Dobravlje
00050000-55fc-7a40-2e09-9011149ab4a3	3204	Dobrna
00050000-55fc-7a40-4bf6-32164debe441	8211	Dobrnič
00050000-55fc-7a40-08a8-89ffe482e811	1356	Dobrova
00050000-55fc-7a40-7544-a5def508d0d2	9223	Dobrovnik/Dobronak 
00050000-55fc-7a40-f122-e1324eafee40	5212	Dobrovo v Brdih
00050000-55fc-7a40-902d-a6d06ae541cd	1431	Dol pri Hrastniku
00050000-55fc-7a40-a17f-84976a3dd11a	1262	Dol pri Ljubljani
00050000-55fc-7a40-1a90-6af0a12a6cfa	1273	Dole pri Litiji
00050000-55fc-7a40-d0bb-d1947123ed68	1331	Dolenja vas
00050000-55fc-7a40-327e-8f7a7da36160	8350	Dolenjske Toplice
00050000-55fc-7a40-4b98-ba0019d9a5d7	1230	Domžale
00050000-55fc-7a40-e990-6dd5b4225252	2252	Dornava
00050000-55fc-7a40-0a6f-c43eb64077bf	5294	Dornberk
00050000-55fc-7a40-133c-e707ce4aac44	1319	Draga
00050000-55fc-7a40-80a8-c33a88a41769	8343	Dragatuš
00050000-55fc-7a40-f731-059061483117	3222	Dramlje
00050000-55fc-7a40-09a2-8c0e84681804	2370	Dravograd
00050000-55fc-7a40-2cf5-f804cf4b31a9	4203	Duplje
00050000-55fc-7a40-c9c0-64c0054f16c9	6221	Dutovlje
00050000-55fc-7a40-6895-f5dff8856f4e	8361	Dvor
00050000-55fc-7a40-7bf4-185559e085e0	2343	Fala
00050000-55fc-7a40-33b1-1eae402d4195	9208	Fokovci
00050000-55fc-7a40-41a2-5bc32d508a44	2313	Fram
00050000-55fc-7a40-ebd7-8d5ac66e1701	3213	Frankolovo
00050000-55fc-7a40-3e0e-8cb8089f6961	1274	Gabrovka
00050000-55fc-7a40-bc81-b0a985b68132	8254	Globoko
00050000-55fc-7a40-3855-d363d08ccb56	5275	Godovič
00050000-55fc-7a40-28c0-3909014b0730	4204	Golnik
00050000-55fc-7a40-f8cc-990cf8245449	3303	Gomilsko
00050000-55fc-7a40-1904-1f0ddd691a90	4224	Gorenja vas
00050000-55fc-7a40-0c73-52dce6233afe	3263	Gorica pri Slivnici
00050000-55fc-7a40-73b2-6d1a87d54e17	2272	Gorišnica
00050000-55fc-7a40-7bd7-eab75628342a	9250	Gornja Radgona
00050000-55fc-7a40-79e1-3515ac165d82	3342	Gornji Grad
00050000-55fc-7a40-9e1b-aec7cd9fb5a1	4282	Gozd Martuljek
00050000-55fc-7a40-7c69-941833e065d3	6272	Gračišče
00050000-55fc-7a40-861c-06f098abf6e9	9264	Grad
00050000-55fc-7a40-7996-78ace4737cf3	8332	Gradac
00050000-55fc-7a40-e394-7614abcd9206	1384	Grahovo
00050000-55fc-7a40-1685-1cc5a3914aa4	5242	Grahovo ob Bači
00050000-55fc-7a40-f297-fc946f5c2566	5251	Grgar
00050000-55fc-7a40-3e94-b6f1777893f5	3302	Griže
00050000-55fc-7a40-fafe-4daa08186663	3231	Grobelno
00050000-55fc-7a40-43a4-e55572e061a5	1290	Grosuplje
00050000-55fc-7a40-097e-55567e0c97b5	2288	Hajdina
00050000-55fc-7a40-76ef-073690adf4c4	8362	Hinje
00050000-55fc-7a40-8567-c99cdaa07f4f	2311	Hoče
00050000-55fc-7a40-05f2-9adf86662f87	9205	Hodoš/Hodos
00050000-55fc-7a40-068b-8ddae2fd191f	1354	Horjul
00050000-55fc-7a40-be17-1ff698aaf5e0	1372	Hotedršica
00050000-55fc-7a40-6905-e55a7b65f53a	1430	Hrastnik
00050000-55fc-7a40-dd23-e5ea598d06dd	6225	Hruševje
00050000-55fc-7a40-1139-4fe65905b7a9	4276	Hrušica
00050000-55fc-7a40-7517-b73232bbb434	5280	Idrija
00050000-55fc-7a40-c114-9216ff4c83f7	1292	Ig
00050000-55fc-7a40-431a-831160d227f1	6250	Ilirska Bistrica
00050000-55fc-7a40-78b9-a3cb4ffaddf0	6251	Ilirska Bistrica-Trnovo
00050000-55fc-7a40-166c-fb60f54bb8ee	1295	Ivančna Gorica
00050000-55fc-7a40-cbf6-abd5ede11323	2259	Ivanjkovci
00050000-55fc-7a40-711b-052434aa8daf	1411	Izlake
00050000-55fc-7a40-d3ea-bf77cb637593	6310	Izola/Isola
00050000-55fc-7a40-4faf-842c2e40c26a	2222	Jakobski Dol
00050000-55fc-7a40-1ccb-58cbb12f2304	2221	Jarenina
00050000-55fc-7a40-4694-85f1597ef6d8	6254	Jelšane
00050000-55fc-7a40-2777-f47868a9bc03	4270	Jesenice
00050000-55fc-7a40-8406-10253e23e1b2	8261	Jesenice na Dolenjskem
00050000-55fc-7a40-9ac5-1d05dd62e192	3273	Jurklošter
00050000-55fc-7a40-ceb7-738f9cc44db1	2223	Jurovski Dol
00050000-55fc-7a40-e205-096f2882f02c	2256	Juršinci
00050000-55fc-7a40-2ed7-345e263c317f	5214	Kal nad Kanalom
00050000-55fc-7a40-7ba5-08f5548ca69a	3233	Kalobje
00050000-55fc-7a40-c03b-fe319ac33950	4246	Kamna Gorica
00050000-55fc-7a40-4258-0d5d141669ce	2351	Kamnica
00050000-55fc-7a40-7618-2634b71cff69	1241	Kamnik
00050000-55fc-7a40-55d3-9b5bb56c4ff1	5213	Kanal
00050000-55fc-7a40-7519-93d421845cd0	8258	Kapele
00050000-55fc-7a40-de5a-577945e13e75	2362	Kapla
00050000-55fc-7a40-871e-fb38b48c7804	2325	Kidričevo
00050000-55fc-7a40-f111-2c2efc9bf968	1412	Kisovec
00050000-55fc-7a40-9f28-51d4995e3fc3	6253	Knežak
00050000-55fc-7a40-d7aa-00b01237b85c	5222	Kobarid
00050000-55fc-7a40-b165-e297a5024514	9227	Kobilje
00050000-55fc-7a40-a924-bd261d3186c4	1330	Kočevje
00050000-55fc-7a40-33a8-8444be99e5e1	1338	Kočevska Reka
00050000-55fc-7a40-64f4-367615050e3e	2276	Kog
00050000-55fc-7a40-8d43-0b3db461605d	5211	Kojsko
00050000-55fc-7a40-8376-98c5ee9de3a7	6223	Komen
00050000-55fc-7a40-bc65-726ceb734aac	1218	Komenda
00050000-55fc-7a40-de89-f37b5a8ba44f	6000	Koper/Capodistria 
00050000-55fc-7a40-6eaa-27b64e4e6fff	6001	Koper/Capodistria - poštni predali
00050000-55fc-7a40-b7f7-a5a43336417d	8282	Koprivnica
00050000-55fc-7a40-0691-d9bac4b45f3a	5296	Kostanjevica na Krasu
00050000-55fc-7a40-b450-d1f209044bcd	8311	Kostanjevica na Krki
00050000-55fc-7a40-6d2c-61e061a2c70e	1336	Kostel
00050000-55fc-7a40-5d29-b47da420269f	6256	Košana
00050000-55fc-7a40-b882-ccdf87be99a8	2394	Kotlje
00050000-55fc-7a40-1e3e-d8d53dab6bb2	6240	Kozina
00050000-55fc-7a40-d4f7-fa7806a45020	3260	Kozje
00050000-55fc-7a40-7076-86e9ef10dcec	4000	Kranj 
00050000-55fc-7a40-1484-4965baed4a97	4001	Kranj - poštni predali
00050000-55fc-7a40-b642-556f9490fc32	4280	Kranjska Gora
00050000-55fc-7a40-6b37-eaed8593432c	1281	Kresnice
00050000-55fc-7a40-ede0-87e42ce770ba	4294	Križe
00050000-55fc-7a40-b66a-15a042617495	9206	Križevci
00050000-55fc-7a40-2189-f6dace3f74f5	9242	Križevci pri Ljutomeru
00050000-55fc-7a40-7360-45fda11ad58f	1301	Krka
00050000-55fc-7a40-94b7-54db893a3118	8296	Krmelj
00050000-55fc-7a40-5e2a-d856ca6ad6e4	4245	Kropa
00050000-55fc-7a40-228f-1214f947955c	8262	Krška vas
00050000-55fc-7a40-c247-1f9b2e8268bb	8270	Krško
00050000-55fc-7a40-7c35-f612f19e57cc	9263	Kuzma
00050000-55fc-7a40-8d02-cc734f37a5e9	2318	Laporje
00050000-55fc-7a40-9439-238acfab9260	3270	Laško
00050000-55fc-7a40-ef5e-7e2baaf1fb5e	1219	Laze v Tuhinju
00050000-55fc-7a40-5d36-96cc510190bf	2230	Lenart v Slovenskih goricah
00050000-55fc-7a40-0bed-e8cb69891d9b	9220	Lendava/Lendva
00050000-55fc-7a40-bc21-7be817dff131	4248	Lesce
00050000-55fc-7a40-4ef0-fe9bfe203b4d	3261	Lesično
00050000-55fc-7a40-6eef-df6439fef538	8273	Leskovec pri Krškem
00050000-55fc-7a40-0ab2-f6c6251b4f26	2372	Libeliče
00050000-55fc-7a40-9c96-96d2b4270803	2341	Limbuš
00050000-55fc-7a40-2af6-4c33e3d56432	1270	Litija
00050000-55fc-7a40-2044-4d6b4f8f238d	3202	Ljubečna
00050000-55fc-7a40-53fc-33008d83829b	1000	Ljubljana 
00050000-55fc-7a40-4ff7-27eb825be640	1001	Ljubljana - poštni predali
00050000-55fc-7a40-611b-b4b0b6bb59eb	1231	Ljubljana - Črnuče
00050000-55fc-7a40-2f08-cba7bdf7f192	1261	Ljubljana - Dobrunje
00050000-55fc-7a40-d89c-b6e61c19621c	1260	Ljubljana - Polje
00050000-55fc-7a40-2ac3-b62d6572393e	1210	Ljubljana - Šentvid
00050000-55fc-7a40-deb0-e655741c03c9	1211	Ljubljana - Šmartno
00050000-55fc-7a40-eeca-724e0b6cc558	3333	Ljubno ob Savinji
00050000-55fc-7a40-20e7-7515a8cc4ca7	9240	Ljutomer
00050000-55fc-7a40-08d2-6e61d205d32c	3215	Loče
00050000-55fc-7a40-371c-2724f38b4ee9	5231	Log pod Mangartom
00050000-55fc-7a40-581b-837ae8d7e437	1358	Log pri Brezovici
00050000-55fc-7a40-44dd-05fe6620bec6	1370	Logatec
00050000-55fc-7a40-a970-5b3a16a6fbcb	1371	Logatec
00050000-55fc-7a40-7421-367f2451eaa5	1434	Loka pri Zidanem Mostu
00050000-55fc-7a40-4a39-a2be8e82e43e	3223	Loka pri Žusmu
00050000-55fc-7a40-3e5c-1892b3dfc0cb	6219	Lokev
00050000-55fc-7a40-3b48-9f7dac732685	1318	Loški Potok
00050000-55fc-7a40-be6c-4f7498729363	2324	Lovrenc na Dravskem polju
00050000-55fc-7a40-2b3b-3c7d8490b5e2	2344	Lovrenc na Pohorju
00050000-55fc-7a40-f022-bbd89fdf451b	3334	Luče
00050000-55fc-7a40-a625-ec0b6f944dc7	1225	Lukovica
00050000-55fc-7a40-2796-84df4cdf8d18	9202	Mačkovci
00050000-55fc-7a40-eab3-c9728fea14d4	2322	Majšperk
00050000-55fc-7a40-1144-c3af2f626905	2321	Makole
00050000-55fc-7a40-30b8-e1b831d50f86	9243	Mala Nedelja
00050000-55fc-7a40-2811-499052fefaaf	2229	Malečnik
00050000-55fc-7a40-1ba2-c8cc47d401af	6273	Marezige
00050000-55fc-7a40-9f2d-2237db33bafa	2000	Maribor 
00050000-55fc-7a40-c260-5355d9dacb25	2001	Maribor - poštni predali
00050000-55fc-7a40-f7e2-7980b7f5b310	2206	Marjeta na Dravskem polju
00050000-55fc-7a40-b01d-c39bb0ae6757	2281	Markovci
00050000-55fc-7a40-cfda-f2e3e2543ee5	9221	Martjanci
00050000-55fc-7a40-a641-4be3e7ab0a19	6242	Materija
00050000-55fc-7a40-9997-ad8725241af9	4211	Mavčiče
00050000-55fc-7a40-5d00-f5b272ec4039	1215	Medvode
00050000-55fc-7a40-b586-1f1f0ad11075	1234	Mengeš
00050000-55fc-7a40-23d6-6b410ae0d229	8330	Metlika
00050000-55fc-7a40-ffcf-b561461847a5	2392	Mežica
00050000-55fc-7a40-d842-4123a97feb65	2204	Miklavž na Dravskem polju
00050000-55fc-7a40-0089-670519b305ea	2275	Miklavž pri Ormožu
00050000-55fc-7a40-006a-22e08a8cada8	5291	Miren
00050000-55fc-7a40-b749-f58d77ed7ee3	8233	Mirna
00050000-55fc-7a40-ca14-1e94ced9f0f6	8216	Mirna Peč
00050000-55fc-7a40-404a-5cea4331f0cd	2382	Mislinja
00050000-55fc-7a40-1213-5d67050302c0	4281	Mojstrana
00050000-55fc-7a40-2b9a-31078aba2cfb	8230	Mokronog
00050000-55fc-7a40-1b61-9bc6e591501c	1251	Moravče
00050000-55fc-7a40-97d6-efb73132af62	9226	Moravske Toplice
00050000-55fc-7a40-5436-e5295a25ec0f	5216	Most na Soči
00050000-55fc-7a40-0734-830fdc5f8781	1221	Motnik
00050000-55fc-7a40-18e3-ea3d5985f469	3330	Mozirje
00050000-55fc-7a40-47a6-22d1eaefd1b7	9000	Murska Sobota 
00050000-55fc-7a40-7b24-bea681e0b1cf	9001	Murska Sobota - poštni predali
00050000-55fc-7a40-77c6-8fb3c2f043b5	2366	Muta
00050000-55fc-7a40-2c2e-8ad2d6171b86	4202	Naklo
00050000-55fc-7a40-09ab-299f973ce9e1	3331	Nazarje
00050000-55fc-7a40-e099-a6fa144d1ad0	1357	Notranje Gorice
00050000-55fc-7a40-7e61-a577f1288e7c	3203	Nova Cerkev
00050000-55fc-7a40-da1b-5faa34772395	5000	Nova Gorica 
00050000-55fc-7a40-c143-89a69995f4ef	5001	Nova Gorica - poštni predali
00050000-55fc-7a40-3b9f-345706a6cffe	1385	Nova vas
00050000-55fc-7a40-0700-d73acbe6ff53	8000	Novo mesto
00050000-55fc-7a40-d38c-d7c5989a8751	8001	Novo mesto - poštni predali
00050000-55fc-7a40-1031-ea509b03ebbb	6243	Obrov
00050000-55fc-7a40-974d-d4593f2c4310	9233	Odranci
00050000-55fc-7a40-2c10-44fd06804987	2317	Oplotnica
00050000-55fc-7a40-ccd0-3e11fde14cf1	2312	Orehova vas
00050000-55fc-7a40-b3ef-188391062677	2270	Ormož
00050000-55fc-7a40-5837-e2a8e49da793	1316	Ortnek
00050000-55fc-7a40-c652-740d14437b58	1337	Osilnica
00050000-55fc-7a40-b04b-d4dce28c9959	8222	Otočec
00050000-55fc-7a40-82bd-07a81036d4ee	2361	Ožbalt
00050000-55fc-7a40-bfcd-5d519179be1d	2231	Pernica
00050000-55fc-7a40-6ffc-10690e559ff6	2211	Pesnica pri Mariboru
00050000-55fc-7a40-a2c8-184dcb4bccb8	9203	Petrovci
00050000-55fc-7a40-0bd3-ddbb50e5f7c9	3301	Petrovče
00050000-55fc-7a40-29a2-1dabcd088b0b	6330	Piran/Pirano
00050000-55fc-7a40-dcb4-2b5cd6ec23c0	8255	Pišece
00050000-55fc-7a40-160a-40fb7a5da3b3	6257	Pivka
00050000-55fc-7a40-461e-99853d0d334f	6232	Planina
00050000-55fc-7a40-a92f-61731246d84b	3225	Planina pri Sevnici
00050000-55fc-7a40-cac3-c913228d2eca	6276	Pobegi
00050000-55fc-7a40-344d-2bd4b9a2d41b	8312	Podbočje
00050000-55fc-7a40-437e-1791a65e6399	5243	Podbrdo
00050000-55fc-7a40-6d0a-9142123714ba	3254	Podčetrtek
00050000-55fc-7a40-72a0-ce220edaba70	2273	Podgorci
00050000-55fc-7a40-a0ba-4b064943756f	6216	Podgorje
00050000-55fc-7a40-a43f-2a3ab226f5ad	2381	Podgorje pri Slovenj Gradcu
00050000-55fc-7a40-0594-4ccff53d71b6	6244	Podgrad
00050000-55fc-7a40-af33-e137ed797bbf	1414	Podkum
00050000-55fc-7a40-1a64-672093e77cde	2286	Podlehnik
00050000-55fc-7a40-6263-7d910ce7439f	5272	Podnanos
00050000-55fc-7a40-e4c7-b955e3e96134	4244	Podnart
00050000-55fc-7a40-1ac7-c57979894450	3241	Podplat
00050000-55fc-7a40-06bb-fee353685107	3257	Podsreda
00050000-55fc-7a40-a16c-0524a8c9928b	2363	Podvelka
00050000-55fc-7a40-4608-c5a79987de92	2208	Pohorje
00050000-55fc-7a40-2a0d-a5092ddab52c	2257	Polenšak
00050000-55fc-7a40-d05d-a1e1ea04e575	1355	Polhov Gradec
00050000-55fc-7a40-3ce0-330e8ed4d621	4223	Poljane nad Škofjo Loko
00050000-55fc-7a40-2c18-63912b8fa11d	2319	Poljčane
00050000-55fc-7a40-df9c-9d1d88f57ff6	1272	Polšnik
00050000-55fc-7a40-b398-471528a0989f	3313	Polzela
00050000-55fc-7a40-2535-35c4d93d84ee	3232	Ponikva
00050000-55fc-7a40-7d4f-43510f288060	6320	Portorož/Portorose
00050000-55fc-7a40-bd43-c407049bb5a6	6230	Postojna
00050000-55fc-7a40-b8b3-65ce3289b115	2331	Pragersko
00050000-55fc-7a40-e3a0-75e38a66bef8	3312	Prebold
00050000-55fc-7a40-2eae-fb1c816bffed	4205	Preddvor
00050000-55fc-7a40-2780-75b04d450d6d	6255	Prem
00050000-55fc-7a40-2227-d3b5daa1cb90	1352	Preserje
00050000-55fc-7a40-de2f-43a97698347a	6258	Prestranek
00050000-55fc-7a40-cde3-f9aa313910a4	2391	Prevalje
00050000-55fc-7a40-d46d-9947969e4c3e	3262	Prevorje
00050000-55fc-7a40-5107-e69acfd9efde	1276	Primskovo 
00050000-55fc-7a40-b7e9-d6147530aff8	3253	Pristava pri Mestinju
00050000-55fc-7a40-d2d0-bbb2e49f63f0	9207	Prosenjakovci/Partosfalva
00050000-55fc-7a40-0481-3656d290b6f5	5297	Prvačina
00050000-55fc-7a40-94a2-c65f565dde65	2250	Ptuj
00050000-55fc-7a40-698e-8ec30271eada	2323	Ptujska Gora
00050000-55fc-7a40-9df4-031d5feb2a75	9201	Puconci
00050000-55fc-7a40-88be-d4d838fc4dd4	2327	Rače
00050000-55fc-7a40-ab87-9095144b9de2	1433	Radeče
00050000-55fc-7a40-fcb8-829720fdaf38	9252	Radenci
00050000-55fc-7a40-f8a4-e265b2ebff9a	2360	Radlje ob Dravi
00050000-55fc-7a40-ac39-0e4f7c7ff377	1235	Radomlje
00050000-55fc-7a40-17dd-1f3d40d8a64d	4240	Radovljica
00050000-55fc-7a40-6ac3-4e604482c7a3	8274	Raka
00050000-55fc-7a40-0ccc-922f07240f1b	1381	Rakek
00050000-55fc-7a40-812e-29ec369ec86e	4283	Rateče - Planica
00050000-55fc-7a40-e824-20019745bb7f	2390	Ravne na Koroškem
00050000-55fc-7a40-5340-632060931ddf	9246	Razkrižje
00050000-55fc-7a40-249f-466d8203035d	3332	Rečica ob Savinji
00050000-55fc-7a40-4d2e-0f2d4b80783c	5292	Renče
00050000-55fc-7a40-22ac-703efd1deaf4	1310	Ribnica
00050000-55fc-7a40-a64e-5f2377be4741	2364	Ribnica na Pohorju
00050000-55fc-7a40-f026-44be5804115f	3272	Rimske Toplice
00050000-55fc-7a40-cae7-828c565e5a0d	1314	Rob
00050000-55fc-7a40-fc07-9391ca23eaf9	5215	Ročinj
00050000-55fc-7a40-2450-1f4426886ee2	3250	Rogaška Slatina
00050000-55fc-7a40-90e5-14252441b321	9262	Rogašovci
00050000-55fc-7a40-43b0-aa50464c61f0	3252	Rogatec
00050000-55fc-7a40-3569-8a46e2aaf510	1373	Rovte
00050000-55fc-7a40-3d11-a83fcbce9df7	2342	Ruše
00050000-55fc-7a40-f7cd-57f0bcafaca4	1282	Sava
00050000-55fc-7a40-9629-69f8ac655307	6333	Sečovlje/Sicciole
00050000-55fc-7a40-061e-10a33489d6b5	4227	Selca
00050000-55fc-7a40-ec26-0e2eea17e8b9	2352	Selnica ob Dravi
00050000-55fc-7a40-fdaa-86bf5d198ebd	8333	Semič
00050000-55fc-7a40-ed9c-602e8c833ec6	8281	Senovo
00050000-55fc-7a40-79e8-144c448deecf	6224	Senožeče
00050000-55fc-7a40-a926-1af5d166760d	8290	Sevnica
00050000-55fc-7a40-7423-c53e8c1d1706	6210	Sežana
00050000-55fc-7a40-0567-d94e9b424420	2214	Sladki Vrh
00050000-55fc-7a40-fdf3-559752ec71fe	5283	Slap ob Idrijci
00050000-55fc-7a40-5b17-fc9692f4f6ce	2380	Slovenj Gradec
00050000-55fc-7a40-4454-6d7c97dace24	2310	Slovenska Bistrica
00050000-55fc-7a40-6ade-c12ecd489f54	3210	Slovenske Konjice
00050000-55fc-7a40-cdd9-d8172e0f2b87	1216	Smlednik
00050000-55fc-7a40-177c-94a6fde2d75e	5232	Soča
00050000-55fc-7a40-bc4d-97f88bbabfde	1317	Sodražica
00050000-55fc-7a40-b793-713a1491c285	3335	Solčava
00050000-55fc-7a40-bf81-c460118cb3c8	5250	Solkan
00050000-55fc-7a40-1179-c2c279309268	4229	Sorica
00050000-55fc-7a40-543b-c4a4732d5722	4225	Sovodenj
00050000-55fc-7a40-d7e0-7c68b79103d7	5281	Spodnja Idrija
00050000-55fc-7a40-0bbf-59d275979bed	2241	Spodnji Duplek
00050000-55fc-7a40-54df-54bad9884e0c	9245	Spodnji Ivanjci
00050000-55fc-7a40-b060-277f9a20a310	2277	Središče ob Dravi
00050000-55fc-7a40-a926-c45c82e860b4	4267	Srednja vas v Bohinju
00050000-55fc-7a40-0e74-a383ec5f181d	8256	Sromlje 
00050000-55fc-7a40-f855-384377073a68	5224	Srpenica
00050000-55fc-7a40-766b-2231ccc12ce1	1242	Stahovica
00050000-55fc-7a40-b3f9-ca0adef09ff1	1332	Stara Cerkev
00050000-55fc-7a40-90a1-953cf8ed5344	8342	Stari trg ob Kolpi
00050000-55fc-7a40-a4a2-78925c3544dc	1386	Stari trg pri Ložu
00050000-55fc-7a40-ac9f-c80d9d037b4d	2205	Starše
00050000-55fc-7a40-dce0-83312da7f0b9	2289	Stoperce
00050000-55fc-7a40-9340-459cbca50a67	8322	Stopiče
00050000-55fc-7a40-da5d-16759bcc40bf	3206	Stranice
00050000-55fc-7a40-c992-ab43bee5b2e6	8351	Straža
00050000-55fc-7a40-2fe6-44769d188b88	1313	Struge
00050000-55fc-7a40-7684-4df7fc8e4e46	8293	Studenec
00050000-55fc-7a40-f89c-b5c122d2a4b4	8331	Suhor
00050000-55fc-7a40-f9d3-7287637900a1	2233	Sv. Ana v Slovenskih goricah
00050000-55fc-7a40-4504-77ed9331fd69	2235	Sv. Trojica v Slovenskih goricah
00050000-55fc-7a40-34d0-442a020f4ebe	2353	Sveti Duh na Ostrem Vrhu
00050000-55fc-7a40-e658-ade41091a3da	9244	Sveti Jurij ob Ščavnici
00050000-55fc-7a40-02de-7e8955e5053d	3264	Sveti Štefan
00050000-55fc-7a40-d169-5fcad929479e	2258	Sveti Tomaž
00050000-55fc-7a40-c067-85241fa80d8c	9204	Šalovci
00050000-55fc-7a40-5e29-9bb4ab88ef35	5261	Šempas
00050000-55fc-7a40-9a55-eb7d57943b7f	5290	Šempeter pri Gorici
00050000-55fc-7a40-0e13-9dda9db5bdab	3311	Šempeter v Savinjski dolini
00050000-55fc-7a40-c33f-6b0a445f6f05	4208	Šenčur
00050000-55fc-7a40-6a23-a8b74161fe16	2212	Šentilj v Slovenskih goricah
00050000-55fc-7a40-4957-3a7c37ae2237	8297	Šentjanž
00050000-55fc-7a40-09b1-150827fc0c84	2373	Šentjanž pri Dravogradu
00050000-55fc-7a40-245d-cb52b630cb77	8310	Šentjernej
00050000-55fc-7a40-8ceb-9109286133b8	3230	Šentjur
00050000-55fc-7a40-385a-9d22b3381b69	3271	Šentrupert
00050000-55fc-7a40-ad33-10b915761f8b	8232	Šentrupert
00050000-55fc-7a40-44f3-ac0b1c68ba49	1296	Šentvid pri Stični
00050000-55fc-7a40-7f20-903b35f1c04a	8275	Škocjan
00050000-55fc-7a40-17e8-4543b6f15690	6281	Škofije
00050000-55fc-7a40-62b9-c97cb0cc786d	4220	Škofja Loka
00050000-55fc-7a40-c04c-cd00536cf105	3211	Škofja vas
00050000-55fc-7a40-3065-45e64dbfc458	1291	Škofljica
00050000-55fc-7a40-2e78-1b78c7d1eeb7	6274	Šmarje
00050000-55fc-7a40-8ae8-0c35dcb26021	1293	Šmarje - Sap
00050000-55fc-7a40-8b32-076a70c94d56	3240	Šmarje pri Jelšah
00050000-55fc-7a40-55ce-0c331f3d1d15	8220	Šmarješke Toplice
00050000-55fc-7a40-f3fe-d024f6a7a612	2315	Šmartno na Pohorju
00050000-55fc-7a40-f815-e4ead94f933f	3341	Šmartno ob Dreti
00050000-55fc-7a40-48e5-bcc8aa6281f4	3327	Šmartno ob Paki
00050000-55fc-7a40-8362-8148d2e34616	1275	Šmartno pri Litiji
00050000-55fc-7a40-15a3-b42c6c0a824b	2383	Šmartno pri Slovenj Gradcu
00050000-55fc-7a40-79df-1663a29ff233	3201	Šmartno v Rožni dolini
00050000-55fc-7a40-685b-2b881b76c98f	3325	Šoštanj
00050000-55fc-7a40-1e68-42ed5d4dd9c4	6222	Štanjel
00050000-55fc-7a40-97cf-a9749f4cc455	3220	Štore
00050000-55fc-7a40-31ed-52add8e4a33b	3304	Tabor
00050000-55fc-7a40-638a-ba1dab80884c	3221	Teharje
00050000-55fc-7a40-ca96-70656e100ec1	9251	Tišina
00050000-55fc-7a40-31b1-8f6922ac72bb	5220	Tolmin
00050000-55fc-7a40-3d74-3df3b3604100	3326	Topolšica
00050000-55fc-7a40-430c-74e0b1e10432	2371	Trbonje
00050000-55fc-7a40-30cb-320f4b84d06c	1420	Trbovlje
00050000-55fc-7a40-ca08-98077190d3ed	8231	Trebelno 
00050000-55fc-7a40-87e6-330a47e82448	8210	Trebnje
00050000-55fc-7a40-4c43-287db8b75ab0	5252	Trnovo pri Gorici
00050000-55fc-7a40-e44b-316ad3230da3	2254	Trnovska vas
00050000-55fc-7a40-c978-e37cc60a8071	1222	Trojane
00050000-55fc-7a40-a5f7-0514ff99b19c	1236	Trzin
00050000-55fc-7a40-60f2-51d123411ac8	4290	Tržič
00050000-55fc-7a40-7abb-ce6b7de81e4b	8295	Tržišče
00050000-55fc-7a40-c9ab-54f5cbe8951c	1311	Turjak
00050000-55fc-7a40-a671-109190a9d370	9224	Turnišče
00050000-55fc-7a40-2a09-cc2fcfb1948c	8323	Uršna sela
00050000-55fc-7a40-04c5-8f094d8dc1a1	1252	Vače
00050000-55fc-7a40-3ecb-cdeded16f0c7	3320	Velenje 
00050000-55fc-7a40-1314-8de9143256ad	3322	Velenje - poštni predali
00050000-55fc-7a40-29ab-4db44cd92e2a	8212	Velika Loka
00050000-55fc-7a40-cb1f-4972c8f682b4	2274	Velika Nedelja
00050000-55fc-7a40-dffd-cebaaa1d8575	9225	Velika Polana
00050000-55fc-7a40-3f51-6a4d367b64d8	1315	Velike Lašče
00050000-55fc-7a40-76fd-623dbdd996bc	8213	Veliki Gaber
00050000-55fc-7a40-d4eb-03ef61088760	9241	Veržej
00050000-55fc-7a40-a6ea-282cb22dba05	1312	Videm - Dobrepolje
00050000-55fc-7a40-12e0-26c7edd05ba9	2284	Videm pri Ptuju
00050000-55fc-7a40-b99d-a046b821f423	8344	Vinica
00050000-55fc-7a40-c7da-270f93e2744e	5271	Vipava
00050000-55fc-7a40-c81b-1c8eafcb9cae	4212	Visoko
00050000-55fc-7a40-384c-e42ef7a2dd71	1294	Višnja Gora
00050000-55fc-7a40-f8ba-f0b480f6a888	3205	Vitanje
00050000-55fc-7a40-f289-003515b2db0c	2255	Vitomarci
00050000-55fc-7a40-a0b2-82a8fba38ae3	1217	Vodice
00050000-55fc-7a40-9ad2-c7dd68a1b4b0	3212	Vojnik\t
00050000-55fc-7a40-0de5-dcdd642aac00	5293	Volčja Draga
00050000-55fc-7a40-49aa-c39b6da49cd7	2232	Voličina
00050000-55fc-7a40-39fb-3959191695a1	3305	Vransko
00050000-55fc-7a40-5cc3-2bceee6f7670	6217	Vremski Britof
00050000-55fc-7a40-233d-9b724074ed19	1360	Vrhnika
00050000-55fc-7a40-dbd5-64b90278f549	2365	Vuhred
00050000-55fc-7a40-61ae-8c76f9afce84	2367	Vuzenica
00050000-55fc-7a40-857c-9a0b669d1812	8292	Zabukovje 
00050000-55fc-7a40-9f6c-cde65a13a65e	1410	Zagorje ob Savi
00050000-55fc-7a41-e591-c8cdf7cfa693	1303	Zagradec
00050000-55fc-7a41-07e4-8e7884956f4d	2283	Zavrč
00050000-55fc-7a41-83a3-babe57e39e0e	8272	Zdole 
00050000-55fc-7a41-e430-a6d37e4e724f	4201	Zgornja Besnica
00050000-55fc-7a41-4b3a-cf680634ae02	2242	Zgornja Korena
00050000-55fc-7a41-3a86-f79119c2faf8	2201	Zgornja Kungota
00050000-55fc-7a41-1a7e-f7c02d67b3f5	2316	Zgornja Ložnica
00050000-55fc-7a41-6dc2-6a8e3afec8fd	2314	Zgornja Polskava
00050000-55fc-7a41-408a-038e23d2e010	2213	Zgornja Velka
00050000-55fc-7a41-6f30-c3d7214902f3	4247	Zgornje Gorje
00050000-55fc-7a41-e02b-83b50ed88de0	4206	Zgornje Jezersko
00050000-55fc-7a41-643a-75ebae75d3f4	2285	Zgornji Leskovec
00050000-55fc-7a41-5da4-9698717cb4e1	1432	Zidani Most
00050000-55fc-7a41-dd26-331387466e37	3214	Zreče
00050000-55fc-7a41-c167-2fe5d9556dff	4209	Žabnica
00050000-55fc-7a41-c621-0db0e4026d81	3310	Žalec
00050000-55fc-7a41-0329-cb85f9fcc62c	4228	Železniki
00050000-55fc-7a41-9253-2c46c040a229	2287	Žetale
00050000-55fc-7a41-59de-680ef6fb1dcd	4226	Žiri
00050000-55fc-7a41-4085-8632a397f98c	4274	Žirovnica
00050000-55fc-7a41-3b82-5b3568a9165c	8360	Žužemberk
\.


--
-- TOC entry 3301 (class 0 OID 1346411)
-- Dependencies: 233
-- Data for Name: postavkacdve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkacdve (id, skupina, podskupina, naziv, vrpremiere, vrponovitvepremier, vrponovitveprejsnjih, vrgostovanjazamejstvo, vrfestivali, vrgostovanjaint, vrostalo, programdela_id) FROM stdin;
\.


--
-- TOC entry 3275 (class 0 OID 1346077)
-- Dependencies: 207
-- Data for Name: postavkaracuna; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkaracuna (id, racun_id) FROM stdin;
\.


--
-- TOC entry 3258 (class 0 OID 1345895)
-- Dependencies: 190
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
\.


--
-- TOC entry 3266 (class 0 OID 1346000)
-- Dependencies: 198
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, zaporedna, porocilo) FROM stdin;
\.


--
-- TOC entry 3276 (class 0 OID 1346083)
-- Dependencies: 208
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 3302 (class 0 OID 1346425)
-- Dependencies: 234
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, koproducent_id, odstotekfinanciranja, delez, maticnikop, kpe, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 3303 (class 0 OID 1346435)
-- Dependencies: 235
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, sifra, status) FROM stdin;
\.


--
-- TOC entry 3304 (class 0 OID 1346443)
-- Dependencies: 236
-- Data for Name: programdela; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programdela (id, sifra, naziv, zacetek, konec, zakljuceno, potrjenprogram, stpremier, stint, stfest, strazno, stizjem, stponprem, stponprej, stponprejvelikih, stponprejmalih, stponprejmalihkopr, stponprejsredkopr, stponprejvelikihkopr, stgostujo, vrps1, vrps1do, vrps1mat, vrps1gostovsz, stizvnekomerc, stizvprem, stizvpremdoma, stizvpremkopr, stizvponprem, stizvponpremdoma, stizvponpremzamejo, stizvponpremgost, stizvponpremkopr, stizvponpremint, stizvponpremkoprint, stizvponprej, stizvponprejdoma, stizvponprejzamejo, stizvponprejgost, stizvponprejkopr, stizvponprejint, stizvponprejkoprint, stizvgostuj, stizvostalihnek, stizvgostovanjslo, stizvgostovanjzam, stizvgostovanjint, stobisknekom, stobisknekommat, stobisknekomgostslo, stobisknekomgostzam, stobisknekomgostint, stobiskprem, stobiskpremdoma, stobiskpremkopr, stobiskponprem, stobiskponpremdoma, stobiskponpremkopr, stobiskponpremkoprint, stobiskponpremgost, stobiskponpremzamejo, stobiskponpremint, avgobiskprired, avgzaseddvoran, avgcenavstopnice, stprodvstopnic, stkoprodukcij, stkoprodukcijint, stkoprodukcijnvo, stzaposlenih, stzaposigralcev, avgstnastopovigr, sthonorarnih, sthonorarnihigr, sthonorarnihigrtujjz, sthonorarnihigrsamoz, sredstvaint, sredstvaavt, sredstvazaprosenoprem, sredstvazaprosenoponprem, sredstvazaprosenoponprej, sredstvazaprosenogostujo, sredstvazaprosenoint, sredstvazaprosenofest, sredstvazaprosenorazno, sredstvazaprosenoizjem, sredstvadrugijavniprem, sredstvadrugijavniponprem, sredstvadrugijavniponprej, sredstvadrugijavnigostujo, sredstvadrugijavniint, sredstvadrugijavnifest, sredstvadrugijavnirazno, sredstvadrugijavniizjem, sredstvadrugiviriprem, sredstvadrugiviriponprem, sredstvadrugiviriponprej, sredstvadrugivirigostujo, sredstvadrugiviriint, sredstvadrugivirifest, sredstvadrugivirirazno, sredstvadrugiviriizjem, sredstvaavtsamoz) FROM stdin;
\.


--
-- TOC entry 3305 (class 0 OID 1346486)
-- Dependencies: 237
-- Data for Name: programskaenotasklopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programskaenotasklopa (id, naslovpe, avtorpe, obsegpe, mesecpe, vrednostpe, programrazno_id) FROM stdin;
\.


--
-- TOC entry 3277 (class 0 OID 1346090)
-- Dependencies: 209
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, popa_id, naslov_id, sifra, naziv, jeprizorisce, jematicnioder, seplanira, kapaciteta, opis) FROM stdin;
\.


--
-- TOC entry 3278 (class 0 OID 1346103)
-- Dependencies: 210
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 3279 (class 0 OID 1346112)
-- Dependencies: 211
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 3290 (class 0 OID 1346238)
-- Dependencies: 222
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta, status) FROM stdin;
\.


--
-- TOC entry 3291 (class 0 OID 1346249)
-- Dependencies: 223
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 3262 (class 0 OID 1345947)
-- Dependencies: 194
-- Data for Name: report; Type: TABLE DATA; Schema: public; Owner: -
--

COPY report (id, job_id, title, filename, transfers, size, format, hash, createdat) FROM stdin;
\.


--
-- TOC entry 3245 (class 0 OID 1345736)
-- Dependencies: 177
-- Data for Name: revizije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY revizije (id, razred, objectid, upor, datum, tip, data) FROM stdin;
\.


--
-- TOC entry 3322 (class 0 OID 0)
-- Dependencies: 176
-- Name: revizije_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('revizije_id_seq', 1, false);


--
-- TOC entry 3280 (class 0 OID 1346122)
-- Dependencies: 212
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 3246 (class 0 OID 1345745)
-- Dependencies: 178
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-55fc-7a41-f213-a0d864a3a05c	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-55fc-7a41-dc58-022c516e42d6	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-55fc-7a41-0742-05e44816328c	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-55fc-7a41-e679-7aa0549f2e43	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-55fc-7a41-1fe2-73b446d774e6	planer	Planer dogodkov v koledarju	t
00020000-55fc-7a41-44a1-442ef97990b2	kadrovska	Kadrovska služba	t
00020000-55fc-7a41-30fe-7ed26f196268	arhivar	Ažuriranje arhivalij	t
00020000-55fc-7a41-3245-65fe7c2bb07d	igralec	Igralec	t
00020000-55fc-7a41-09d4-1340ef4f2288	prisotnost	Vnašalec prisotnosti, tudi za tiste izven uprizoritev	t
\.


--
-- TOC entry 3249 (class 0 OID 1345775)
-- Dependencies: 181
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-55fc-7a41-0af6-08ed70b40f06	00020000-55fc-7a41-0742-05e44816328c
00010000-55fc-7a41-df67-ee5135fa47a4	00020000-55fc-7a41-0742-05e44816328c
\.


--
-- TOC entry 3281 (class 0 OID 1346128)
-- Dependencies: 213
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 3282 (class 0 OID 1346140)
-- Dependencies: 214
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 3267 (class 0 OID 1346010)
-- Dependencies: 199
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, sifra, ime, zacetek, konec, aktivna) FROM stdin;
\.


--
-- TOC entry 3240 (class 0 OID 1345701)
-- Dependencies: 172
-- Data for Name: stevilcenje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenje (id, sifra, naziv, prefix, suffix, zacetek, dolzina, format, globalno, poletih) FROM stdin;
00230000-55fc-7a41-2fc1-6420b9bde61c	pri	Privzeto številčenje po letih YYYY-N	\N	\N	1	1	%l-%n	f	t
00230000-55fc-7a41-1ed0-3ca8baa822d9	123	Privzeto številčenje kratkih šifer	\N	\N	100	3	%n	f	f
00230000-55fc-7a41-0794-1269239a62a3	bcd	Globalno številčenje črtnih kod	\N	\N	1	9	%n	t	f
00230000-55fc-7a41-7081-ff409bdb33c8	sif	Številčenje šifrant	\N	\N	1000	4	%n	f	f
00230000-55fc-7a41-8e4f-1dd373268e7e	tmp	Globalno številčenje začasnih številk	tmp	\N	1000	5	%l%n	t	t
\.


--
-- TOC entry 3241 (class 0 OID 1345712)
-- Dependencies: 173
-- Data for Name: stevilcenjekonfig; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjekonfig (id, stevilcenje_id, dok) FROM stdin;
00240000-55fc-7a41-baaf-cb2e64533cb2	00230000-55fc-7a41-7081-ff409bdb33c8	popa
00240000-55fc-7a41-2e3e-2fa31fe524d0	00230000-55fc-7a41-7081-ff409bdb33c8	oseba
00240000-55fc-7a41-1be9-3c1f3dd646a6	00230000-55fc-7a41-7081-ff409bdb33c8	sezona
00240000-55fc-7a41-1639-9757b4421d5d	00230000-55fc-7a41-1ed0-3ca8baa822d9	prostor
00240000-55fc-7a41-1e05-45eaf7b56a6c	00230000-55fc-7a41-7081-ff409bdb33c8	besedilo
00240000-55fc-7a41-0969-f579afad8343	00230000-55fc-7a41-7081-ff409bdb33c8	uprizoritev
00240000-55fc-7a41-38f2-67e06d0e76c4	00230000-55fc-7a41-7081-ff409bdb33c8	funkcija
00240000-55fc-7a41-92ce-3d2cf6bf7332	00230000-55fc-7a41-7081-ff409bdb33c8	tipfunkcije
00240000-55fc-7a41-2645-3a5812027462	00230000-55fc-7a41-7081-ff409bdb33c8	alternacija
00240000-55fc-7a41-9cf2-fac95ffd325d	00230000-55fc-7a41-2fc1-6420b9bde61c	pogodba
00240000-55fc-7a41-7404-3332df1c260f	00230000-55fc-7a41-7081-ff409bdb33c8	zaposlitev
00240000-55fc-7a41-d302-d34c9a433d9a	00230000-55fc-7a41-7081-ff409bdb33c8	zvrstuprizoritve
00240000-55fc-7a41-6397-7cef2595dd38	00230000-55fc-7a41-2fc1-6420b9bde61c	programdela
00240000-55fc-7a41-c221-ccc834ca2859	00230000-55fc-7a41-7081-ff409bdb33c8	zapis
\.


--
-- TOC entry 3242 (class 0 OID 1345720)
-- Dependencies: 174
-- Data for Name: stevilcenjestanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjestanje (id, objid, leto, stevilka) FROM stdin;
\.


--
-- TOC entry 3292 (class 0 OID 1346259)
-- Dependencies: 224
-- Data for Name: strosekuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY strosekuprizoritve (id, uprizoritev_id, popa_id, naziv, vrednostdo, vrednostna, opis, tipstroska, sort, vrstastroska_id) FROM stdin;
\.


--
-- TOC entry 3259 (class 0 OID 1345910)
-- Dependencies: 191
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 3270 (class 0 OID 1346036)
-- Dependencies: 202
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja) FROM stdin;
\.


--
-- TOC entry 3293 (class 0 OID 1346273)
-- Dependencies: 225
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, sifra, ime, opis, imezenski, podrocje) FROM stdin;
000f0000-55fc-7a41-b18b-fb0344938dd5	01	Avtor	Avtorji	Avtorka	umetnik
000f0000-55fc-7a41-ebb1-6f2a79d61c1e	02	Priredba	Priredba	Priredba	umetnik
000f0000-55fc-7a41-b5b5-bd150320171c	03	Prevod	Prevod	Prevod	umetnik
000f0000-55fc-7a41-3796-f56f3382b042	04	Režija	Režija	Režija	umetnik
000f0000-55fc-7a41-11ae-5368c3f82d2d	05	Dramaturgija	Dramaturgija	Dramaturgija	umetnik
000f0000-55fc-7a41-4d15-f0bc99aa2280	06	Scenografija	Scenografija	Scenografija	umetnik
000f0000-55fc-7a41-5da8-2ab7cf92c46f	07	Kostumografija	Kostumografija	Kostumografija	umetnik
000f0000-55fc-7a41-68ba-53cd1bbeee61	08	Koreografija	Koreografija	Koreografija	umetnik
000f0000-55fc-7a41-2e4d-4fcdddbc6f17	09	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	umetnik
000f0000-55fc-7a41-59ba-b1aec2de4499	10	Oblikovanje maske	Oblikovanje maske	Oblikovanje maske	umetnik
000f0000-55fc-7a41-2647-ac5e4aee7389	11	Lektorstvo	Lektorstvo	Lektorstvo	umetnik
000f0000-55fc-7a41-2f9c-959505a2f4cb	12	Glasbeni soustvarjalec	Glasbeni soustvarjalci	Glasbena soustvarjalka	umetnik
000f0000-55fc-7a41-1746-de2dc84bdb91	13	Intermedijski ustvarjalec	Intermedijski ustvarjalci	Intermedijski ustvarjalka	umetnik
000f0000-55fc-7a41-78e0-1b15475f24b8	14	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	umetnik
000f0000-55fc-7a41-fbf0-44eb7e615c7b	15	Vloga	Intermedijski ustvarjalci	Intermedijska ustvarjalka	igralec
000f0000-55fc-7a41-438e-3eb6c0ce7df3	16	Produkcija, mentorstvo	Produkcija, mentorstvo	Produkcija, mentorstvo	umetnik
000f0000-55fc-7a41-1470-7e520155e7c7	17	Tehnična podpora	Tehnična podpora	Tehnična podpora	tehnik
000f0000-55fc-7a41-ced3-133baee761bb	18	Inšpicient	Inšpicienti	Inšpicientka	inspicient
\.


--
-- TOC entry 3306 (class 0 OID 1346496)
-- Dependencies: 238
-- Data for Name: tipprogramskeenote; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipprogramskeenote (id, sifra, naziv, koprodukcija, maxfaktor, maxvsi) FROM stdin;
002b0000-55fc-7a41-eb46-9b1b58a5d2b5	01	Velika predstava	f	1.00	1.00
002b0000-55fc-7a41-b7a5-73cff3788f8c	02	Mala predstava	f	0.50	0.50
002b0000-55fc-7a41-d744-690b22ebb5bc	03	Mala koprodukcija	t	0.40	1.00
002b0000-55fc-7a41-1416-cc3b69a9a1be	04	Srednja koprodukcija	t	0.70	2.00
002b0000-55fc-7a41-1b56-2ed179a0aebf	05	Velika koprodukcija	t	1.00	3.00
\.


--
-- TOC entry 3260 (class 0 OID 1345918)
-- Dependencies: 192
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 3248 (class 0 OID 1345762)
-- Dependencies: 180
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-55fc-7a41-df67-ee5135fa47a4	Konzolni	$2y$05$NS4xMjkyMTcwMzExMjAxROwsMoUOWHcmw4QmsNn2lblkEYodfN03u	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-55fc-7a41-0af6-08ed70b40f06	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 3294 (class 0 OID 1346285)
-- Dependencies: 226
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, producent_id, sifra, faza, naslov, podnaslov, delovninaslov, internacionalninaslov, naslovizvirnika, podnaslovizvirnika, datumzacstudija, stevilovaj, planiranostevilovaj, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, krstna, prvaslovenska, kratkinaslov, maticnioder_id) FROM stdin;
\.


--
-- TOC entry 3268 (class 0 OID 1346020)
-- Dependencies: 200
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, uprizoritev_id, vrsta, zaporedna, porocilo) FROM stdin;
\.


--
-- TOC entry 3283 (class 0 OID 1346146)
-- Dependencies: 215
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 3295 (class 0 OID 1346310)
-- Dependencies: 227
-- Data for Name: vrstastroska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstastroska (id, skupina, podskupina, naziv, opis) FROM stdin;
003b0000-55fc-7a41-00ed-05317f93bba9	1	0	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE
003b0000-55fc-7a41-f70a-e50d2aca1685	1	1	Storitve varovanja zgradb in prostorov	storitve varovanja zgradb in prostorov (npr. gasilci na predstavah)
003b0000-55fc-7a41-4832-0e50b33bbbf1	1	2	Založniške in tiskarske storitve	založniške in tiskarske storitve
003b0000-55fc-7a41-1b3d-d000c3e838c8	1	3	Časopisi, revije, knjige in strokovna literatura	časopisi, revije, knjige in strokovna literatura
003b0000-55fc-7a41-5706-5585f21adcd4	1	4	Stroški prevajalskih storitev	stroški prevajalskih storitev
003b0000-55fc-7a41-d616-9c0e0f0e1ef1	1	5	Stroški oglaševalskih storitev	stroški oglaševalskih storitev
003b0000-55fc-7a41-86f9-5033ecfad054	1	6	Izdatki za reprezentanco	izdatki za reprezentanco
003b0000-55fc-7a41-035c-c93886765614	2	0	POSEBNI MATERIAL IN STORITVE	POSEBNI MATERIAL IN STORITVE
003b0000-55fc-7a41-431c-34aaa2569822	2	1	Drugi posebni material in storitve	drugi posebni material in storitve (npr. za instrumete - navedite)
003b0000-55fc-7a41-895e-9d98ef313d48	2	2	Oprema predstave – stroški rekvizitov	Oprema predstave – stroški rekvizitov
003b0000-55fc-7a41-3b32-ecf357047eeb	2	3	Oprema predstave – stroški kostumov	Oprema predstave – stroški kostumov
003b0000-55fc-7a41-ed71-a7c93fb6e1a7	2	4	Oprema predstave – stroški scenske opreme	Oprema predstave – stroški scenske opreme
003b0000-55fc-7a41-d847-d1d64904830f	2	5	Oprema predstave – stroški avdio in video opreme	Oprema predstave – stroški avdio in video opreme
003b0000-55fc-7a41-230f-f0eecaeeaf73	3	0	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE
003b0000-55fc-7a41-1e0d-b40aaa036099	3	1	Poštnina in kurirske storitve	poštnina in kurirske storitve
003b0000-55fc-7a41-a3ee-190cfefea965	4	0	PREVOZNI STROŠKI IN STORITVE	PREVOZNI STROŠKI IN STORITVE
003b0000-55fc-7a41-0084-b1626da3553d	4	1	Goriva in maziva za prevozna sredstva	goriva in maziva za prevozna sredstva
003b0000-55fc-7a41-3257-7072f71f11ef	4	2	Najem vozil in selitveni stroški	najem vozil in selitveni stroški
003b0000-55fc-7a41-de74-8d8b9a167de9	4	3	Drugi prevozni in transportni stroški 	drugi prevozni in transportni stroški (navedite)
003b0000-55fc-7a41-1f60-d935dffbef61	5	0	IZDATKI ZA SLUŽBENA POTOVANJA	IZDATKI ZA SLUŽBENA POTOVANJA
003b0000-55fc-7a41-1bc0-75b83e6e34b9	5	1	Dnevnice za službena potovanja v državi in tujini	dnevnice za službena potovanja v državi in tujini
003b0000-55fc-7a41-3c0a-5c3924d1dedf	5	2	Hotelske in restavra. storitve v državi in tujini	hotelske in restavra. storitve v državi in tujini
003b0000-55fc-7a41-c9f9-ce65b63b310a	5	3	Stroški prevoza v državi in tujini	stroški prevoza v državi in tujini
003b0000-55fc-7a41-d7aa-1cdcec4bab75	5	4	Drugi izdatki za službena potovanja	drugi izdatki za službena potovanja (navedite)
003b0000-55fc-7a41-56d6-e419382c7e78	6	0	NAJEMNINE IN ZAKUPNINE	NAJEMNINE IN ZAKUPNINE
003b0000-55fc-7a41-16ae-af4a620930a2	6	1	Druge najemnine, zakupnine in licenčnine	druge najemnine, zakupnine in licenčnine (npr. najem notnega materiala, instrumentov - navedite)
003b0000-55fc-7a41-b8e4-318c6a35e85c	7	0	DRUGI OPERATIVNI ODHODKI	DRUGI OPERATIVNI ODHODKI
003b0000-55fc-7a41-ccfc-cc8e9f1292f3	7	1	Izdatki za strok. izobraževanje zap.	izdatki za strok. izobraževanje zap.(vezani na program. enote)  
\.


--
-- TOC entry 3311 (class 0 OID 1346551)
-- Dependencies: 243
-- Data for Name: vrstazapisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstazapisa (id, oznaka, naziv, aktiven, znacka, ikona, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3312 (class 0 OID 1346563)
-- Dependencies: 244
-- Data for Name: zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapis (id, vrsta_id, datoteka_id, mapa_id, avtor_id, zaklenil_id, tip, zaklenjen, datumzaklepanja, identifier, subject, title, description, coverage, creator, language, date, publisher, relation, rights, source, upor, datknj, standard, lokacija) FROM stdin;
\.


--
-- TOC entry 3313 (class 0 OID 1346591)
-- Dependencies: 245
-- Data for Name: zapislastnik; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapislastnik (id, zapis_id, lastnik, classlastnika, datum, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3296 (class 0 OID 1346319)
-- Dependencies: 228
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, sifra, status, delovnomesto, zacetek, konec, tip, delovnaobveza, malica, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci) FROM stdin;
\.


--
-- TOC entry 3269 (class 0 OID 1346030)
-- Dependencies: 201
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id, oseba_id) FROM stdin;
\.


--
-- TOC entry 3297 (class 0 OID 1346329)
-- Dependencies: 229
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, sifra, naziv, opis) FROM stdin;
00140000-55fc-7a41-8589-81e6ca6a3ff7	01	Drama	drama (SURS 01)
00140000-55fc-7a41-ca5e-125882d2c42c	02	Opera	opera (SURS 02)
00140000-55fc-7a41-f76e-31e2e9c3dc48	03	Balet	balet (SURS 03)
00140000-55fc-7a41-386e-9bdcae5a1f3f	04	Plesne prireditve	plesne prireditve (SURS 04)
00140000-55fc-7a41-c81b-7e94c353b46c	05	Lutkovno gledališče	lutkovno gledališče (SURS 05)
00140000-55fc-7a41-495a-647b9bfeb916	06	Raziskovalno gledališče	raziskovalno gledališče (SURS 06)
00140000-55fc-7a41-7cda-a062b4b035b9	07	Drugo	drugo (SURS 07)
\.


--
-- TOC entry 3298 (class 0 OID 1346339)
-- Dependencies: 230
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, sifra, naziv, opis) FROM stdin;
\.


--
-- TOC entry 2771 (class 2606 OID 1345790)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2907 (class 2606 OID 1346161)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2914 (class 2606 OID 1346181)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2918 (class 2606 OID 1346188)
-- Name: avtorbesedila_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT avtorbesedila_pkey PRIMARY KEY (id);


--
-- TOC entry 2922 (class 2606 OID 1346205)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2999 (class 2606 OID 1346521)
-- Name: datoteka_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT datoteka_pkey PRIMARY KEY (id);


--
-- TOC entry 2824 (class 2606 OID 1345973)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2836 (class 2606 OID 1345988)
-- Name: dogodeksplosni_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodeksplosni
    ADD CONSTRAINT dogodeksplosni_pkey PRIMARY KEY (id);


--
-- TOC entry 2970 (class 2606 OID 1346354)
-- Name: drugivir_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT drugivir_pkey PRIMARY KEY (id);


--
-- TOC entry 2773 (class 2606 OID 1345803)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2973 (class 2606 OID 1346405)
-- Name: enotaprograma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT enotaprograma_pkey PRIMARY KEY (id);


--
-- TOC entry 2925 (class 2606 OID 1346218)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2838 (class 2606 OID 1345998)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2819 (class 2606 OID 1345942)
-- Name: job_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY job
    ADD CONSTRAINT job_pkey PRIMARY KEY (id);


--
-- TOC entry 2781 (class 2606 OID 1345817)
-- Name: kontaktnaoseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT kontaktnaoseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2859 (class 2606 OID 1346053)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 3004 (class 2606 OID 1346532)
-- Name: mapa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT mapa_pkey PRIMARY KEY (id);


--
-- TOC entry 3008 (class 2606 OID 1346539)
-- Name: mapa_zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT mapa_zapis_pkey PRIMARY KEY (mapa_id, zapis_id);


--
-- TOC entry 3012 (class 2606 OID 1346548)
-- Name: mapaacl_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT mapaacl_pkey PRIMARY KEY (id);


--
-- TOC entry 2862 (class 2606 OID 1346061)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2783 (class 2606 OID 1345830)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2788 (class 2606 OID 1345840)
-- Name: optionvalue_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT optionvalue_pkey PRIMARY KEY (id);


--
-- TOC entry 2791 (class 2606 OID 1345864)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2763 (class 2606 OID 1345759)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2754 (class 2606 OID 1345733)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2865 (class 2606 OID 1346067)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2867 (class 2606 OID 1346076)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2933 (class 2606 OID 1346233)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2796 (class 2606 OID 1345884)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2799 (class 2606 OID 1345893)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2981 (class 2606 OID 1346423)
-- Name: postavkacdve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkacdve
    ADD CONSTRAINT postavkacdve_pkey PRIMARY KEY (id);


--
-- TOC entry 2870 (class 2606 OID 1346081)
-- Name: postavkaracuna_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT postavkaracuna_pkey PRIMARY KEY (id);


--
-- TOC entry 2805 (class 2606 OID 1345906)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2843 (class 2606 OID 1346007)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2874 (class 2606 OID 1346087)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2985 (class 2606 OID 1346432)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2987 (class 2606 OID 1346440)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2991 (class 2606 OID 1346485)
-- Name: programdela_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT programdela_pkey PRIMARY KEY (id);


--
-- TOC entry 2994 (class 2606 OID 1346494)
-- Name: programskaenotasklopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT programskaenotasklopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2878 (class 2606 OID 1346098)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2886 (class 2606 OID 1346107)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2892 (class 2606 OID 1346117)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2936 (class 2606 OID 1346248)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2940 (class 2606 OID 1346256)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2822 (class 2606 OID 1345956)
-- Name: report_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY report
    ADD CONSTRAINT report_pkey PRIMARY KEY (id);


--
-- TOC entry 2756 (class 2606 OID 1345744)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2895 (class 2606 OID 1346126)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2769 (class 2606 OID 1345779)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2758 (class 2606 OID 1345753)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2900 (class 2606 OID 1346136)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2902 (class 2606 OID 1346145)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2845 (class 2606 OID 1346018)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2745 (class 2606 OID 1345710)
-- Name: stevilcenje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenje
    ADD CONSTRAINT stevilcenje_pkey PRIMARY KEY (id);


--
-- TOC entry 2749 (class 2606 OID 1345717)
-- Name: stevilcenjekonfig_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT stevilcenjekonfig_pkey PRIMARY KEY (id);


--
-- TOC entry 2752 (class 2606 OID 1345724)
-- Name: stevilcenjestanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjestanje
    ADD CONSTRAINT stevilcenjestanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2945 (class 2606 OID 1346269)
-- Name: strosekuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT strosekuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2809 (class 2606 OID 1345915)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2857 (class 2606 OID 1346045)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2947 (class 2606 OID 1346282)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2996 (class 2606 OID 1346506)
-- Name: tipprogramskeenote_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipprogramskeenote
    ADD CONSTRAINT tipprogramskeenote_pkey PRIMARY KEY (id);


--
-- TOC entry 2813 (class 2606 OID 1345929)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2765 (class 2606 OID 1345774)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2957 (class 2606 OID 1346303)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2849 (class 2606 OID 1346028)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2905 (class 2606 OID 1346152)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2959 (class 2606 OID 1346318)
-- Name: vrstastroska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstastroska
    ADD CONSTRAINT vrstastroska_pkey PRIMARY KEY (id);


--
-- TOC entry 3015 (class 2606 OID 1346561)
-- Name: vrstazapisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstazapisa
    ADD CONSTRAINT vrstazapisa_pkey PRIMARY KEY (id);


--
-- TOC entry 3022 (class 2606 OID 1346585)
-- Name: zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT zapis_pkey PRIMARY KEY (id);


--
-- TOC entry 3025 (class 2606 OID 1346597)
-- Name: zapislastnik_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT zapislastnik_pkey PRIMARY KEY (id);


--
-- TOC entry 2962 (class 2606 OID 1346327)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2852 (class 2606 OID 1346034)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2965 (class 2606 OID 1346337)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2968 (class 2606 OID 1346347)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2825 (class 1259 OID 1345982)
-- Name: dogodki_konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_konec ON dogodek USING btree (konec);


--
-- TOC entry 2826 (class 1259 OID 1345983)
-- Name: dogodki_razred; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_razred ON dogodek USING btree (razred);


--
-- TOC entry 2827 (class 1259 OID 1345981)
-- Name: dogodki_zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2828 (class 1259 OID 1345980)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2829 (class 1259 OID 1345979)
-- Name: idx_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2941 (class 1259 OID 1346270)
-- Name: idx_11ffe6e05c75296c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e05c75296c ON strosekuprizoritve USING btree (vrstastroska_id);


--
-- TOC entry 2942 (class 1259 OID 1346271)
-- Name: idx_11ffe6e062b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e062b4ffca ON strosekuprizoritve USING btree (uprizoritev_id);


--
-- TOC entry 2943 (class 1259 OID 1346272)
-- Name: idx_11ffe6e06beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e06beede51 ON strosekuprizoritve USING btree (popa_id);


--
-- TOC entry 3001 (class 1259 OID 1346534)
-- Name: idx_14a5d6d3727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d3727aca70 ON mapa USING btree (parent_id);


--
-- TOC entry 3002 (class 1259 OID 1346533)
-- Name: idx_14a5d6d38a4a6c12; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d38a4a6c12 ON mapa USING btree (lastnik_id);


--
-- TOC entry 2794 (class 1259 OID 1345886)
-- Name: idx_1c7adba5ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba5ee4b985a ON popa USING btree (drzava_id);


--
-- TOC entry 2863 (class 1259 OID 1346068)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 3016 (class 1259 OID 1346589)
-- Name: idx_1ed92829253c4123; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829253c4123 ON zapis USING btree (avtor_id);


--
-- TOC entry 3017 (class 1259 OID 1346588)
-- Name: idx_1ed9282957ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282957ed422f ON zapis USING btree (mapa_id);


--
-- TOC entry 3018 (class 1259 OID 1346590)
-- Name: idx_1ed9282987ff3295; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282987ff3295 ON zapis USING btree (zaklenil_id);


--
-- TOC entry 3019 (class 1259 OID 1346587)
-- Name: idx_1ed92829a54dbb1f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829a54dbb1f ON zapis USING btree (datoteka_id);


--
-- TOC entry 3020 (class 1259 OID 1346586)
-- Name: idx_1ed92829ef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829ef943358 ON zapis USING btree (vrsta_id);


--
-- TOC entry 2871 (class 1259 OID 1346089)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2872 (class 1259 OID 1346088)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2847 (class 1259 OID 1346029)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2926 (class 1259 OID 1346219)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2927 (class 1259 OID 1346221)
-- Name: idx_23aeb9586b361365; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9586b361365 ON funkcija USING btree (tipfunkcije_id);


--
-- TOC entry 2928 (class 1259 OID 1346220)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2778 (class 1259 OID 1345819)
-- Name: idx_2942b10710389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b10710389148 ON kontaktnaoseba USING btree (oseba_id);


--
-- TOC entry 2779 (class 1259 OID 1345818)
-- Name: idx_2942b1076beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b1076beede51 ON kontaktnaoseba USING btree (popa_id);


--
-- TOC entry 2992 (class 1259 OID 1346495)
-- Name: idx_2d901816d6bc69d6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2d901816d6bc69d6 ON programskaenotasklopa USING btree (programrazno_id);


--
-- TOC entry 2929 (class 1259 OID 1346235)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2930 (class 1259 OID 1346236)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2931 (class 1259 OID 1346237)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 3023 (class 1259 OID 1346598)
-- Name: idx_2eaff9dcaf91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2eaff9dcaf91ecd ON zapislastnik USING btree (zapis_id);


--
-- TOC entry 2950 (class 1259 OID 1346308)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2951 (class 1259 OID 1346305)
-- Name: idx_344a77a7c3b0d59; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a7c3b0d59 ON uprizoritev USING btree (maticnioder_id);


--
-- TOC entry 2952 (class 1259 OID 1346309)
-- Name: idx_344a77a853a965c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a853a965c ON uprizoritev USING btree (producent_id);


--
-- TOC entry 2953 (class 1259 OID 1346307)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2954 (class 1259 OID 1346306)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2810 (class 1259 OID 1345931)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2811 (class 1259 OID 1345930)
-- Name: idx_37f6541a6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a6beede51 ON trr USING btree (popa_id);


--
-- TOC entry 2789 (class 1259 OID 1345867)
-- Name: idx_466966d769e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_466966d769e8d4 ON oseba USING btree (naslov_id);


--
-- TOC entry 2893 (class 1259 OID 1346127)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2760 (class 1259 OID 1345760)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2761 (class 1259 OID 1345761)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2896 (class 1259 OID 1346139)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2897 (class 1259 OID 1346138)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2898 (class 1259 OID 1346137)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2840 (class 1259 OID 1346008)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2841 (class 1259 OID 1346009)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2747 (class 1259 OID 1345719)
-- Name: idx_6054e804ff55f926; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_6054e804ff55f926 ON stevilcenjekonfig USING btree (stevilcenje_id);


--
-- TOC entry 2887 (class 1259 OID 1346121)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2888 (class 1259 OID 1346119)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2889 (class 1259 OID 1346118)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2890 (class 1259 OID 1346120)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2766 (class 1259 OID 1345780)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2767 (class 1259 OID 1345781)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2903 (class 1259 OID 1346153)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 3000 (class 1259 OID 1346522)
-- Name: idx_781826c67e3c61f9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_781826c67e3c61f9 ON datoteka USING btree (owner_id);


--
-- TOC entry 2919 (class 1259 OID 1346190)
-- Name: idx_7ab77b7910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7ab77b7910389148 ON avtorbesedila USING btree (oseba_id);


--
-- TOC entry 2920 (class 1259 OID 1346189)
-- Name: idx_7ab77b79f35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7ab77b79f35157b1 ON avtorbesedila USING btree (besedilo_id);


--
-- TOC entry 3009 (class 1259 OID 1346549)
-- Name: idx_7adc957157ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc957157ed422f ON mapaacl USING btree (mapa_id);


--
-- TOC entry 3010 (class 1259 OID 1346550)
-- Name: idx_7adc9571fa6311ef; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc9571fa6311ef ON mapaacl USING btree (perm_id);


--
-- TOC entry 2868 (class 1259 OID 1346082)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2937 (class 1259 OID 1346257)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2938 (class 1259 OID 1346258)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2974 (class 1259 OID 1346410)
-- Name: idx_8787a0e54ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e54ae1cd1c ON enotaprograma USING btree (gostitelj_id);


--
-- TOC entry 2975 (class 1259 OID 1346409)
-- Name: idx_8787a0e55d0da56c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e55d0da56c ON enotaprograma USING btree (drzavagostovanja_id);


--
-- TOC entry 2976 (class 1259 OID 1346406)
-- Name: idx_8787a0e562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e562b4ffca ON enotaprograma USING btree (uprizoritev_id);


--
-- TOC entry 2977 (class 1259 OID 1346407)
-- Name: idx_8787a0e57222d84b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e57222d84b ON enotaprograma USING btree (tipprogramskeenote_id);


--
-- TOC entry 2978 (class 1259 OID 1346408)
-- Name: idx_8787a0e5771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e5771ec7bd ON enotaprograma USING btree (program_dela_id);


--
-- TOC entry 2801 (class 1259 OID 1345908)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2802 (class 1259 OID 1345907)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2803 (class 1259 OID 1345909)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2875 (class 1259 OID 1346102)
-- Name: idx_952dd21969e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd21969e8d4 ON prostor USING btree (naslov_id);


--
-- TOC entry 2876 (class 1259 OID 1346101)
-- Name: idx_952dd2196beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd2196beede51 ON prostor USING btree (popa_id);


--
-- TOC entry 2982 (class 1259 OID 1346433)
-- Name: idx_97af082e38c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e38c06eb ON produkcijadelitev USING btree (enotaprograma_id);


--
-- TOC entry 2983 (class 1259 OID 1346434)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2908 (class 1259 OID 1346165)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2909 (class 1259 OID 1346166)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2910 (class 1259 OID 1346163)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2911 (class 1259 OID 1346164)
-- Name: idx_a4b7244fa4976613; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fa4976613 ON alternacija USING btree (zaposlitev_id);


--
-- TOC entry 2960 (class 1259 OID 1346328)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2881 (class 1259 OID 1346111)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2882 (class 1259 OID 1346110)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2883 (class 1259 OID 1346108)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2884 (class 1259 OID 1346109)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2915 (class 1259 OID 1346183)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2916 (class 1259 OID 1346182)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2820 (class 1259 OID 1345957)
-- Name: idx_c38372b2be04ea9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c38372b2be04ea9 ON report USING btree (job_id);


--
-- TOC entry 2814 (class 1259 OID 1345945)
-- Name: idx_c395a6181bb9e62c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a6181bb9e62c ON job USING btree (datum);


--
-- TOC entry 2815 (class 1259 OID 1345944)
-- Name: idx_c395a618941027cc; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618941027cc ON job USING btree (casizvedbe);


--
-- TOC entry 2816 (class 1259 OID 1345943)
-- Name: idx_c395a618a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618a76ed395 ON job USING btree (user_id);


--
-- TOC entry 2817 (class 1259 OID 1345946)
-- Name: idx_c395a618aecf5af0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618aecf5af0 ON job USING btree (izveden);


--
-- TOC entry 2839 (class 1259 OID 1345999)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2979 (class 1259 OID 1346424)
-- Name: idx_dba42fe79e3adf2c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_dba42fe79e3adf2c ON postavkacdve USING btree (programdela_id);


--
-- TOC entry 2971 (class 1259 OID 1346355)
-- Name: idx_e7d4cf2638c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e7d4cf2638c06eb ON drugivir USING btree (enotaprograma_id);


--
-- TOC entry 3005 (class 1259 OID 1346540)
-- Name: idx_e9f8ee8257ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee8257ed422f ON mapa_zapis USING btree (mapa_id);


--
-- TOC entry 3006 (class 1259 OID 1346541)
-- Name: idx_e9f8ee82af91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee82af91ecd ON mapa_zapis USING btree (zapis_id);


--
-- TOC entry 2785 (class 1259 OID 1345842)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2786 (class 1259 OID 1345841)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2806 (class 1259 OID 1345916)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2807 (class 1259 OID 1345917)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2850 (class 1259 OID 1346035)
-- Name: idx_f44a386d10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_f44a386d10389148 ON zasedenost USING btree (oseba_id);


--
-- TOC entry 2853 (class 1259 OID 1346048)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2854 (class 1259 OID 1346047)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2855 (class 1259 OID 1346046)
-- Name: idx_fef7d84ba81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84ba81ccef6 ON terminstoritve USING btree (dogodek_id);


--
-- TOC entry 2830 (class 1259 OID 1345975)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2831 (class 1259 OID 1345976)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2832 (class 1259 OID 1345974)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2833 (class 1259 OID 1345978)
-- Name: uniq_11e93b5dbbc7a989; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dbbc7a989 ON dogodek USING btree (dogodek_splosni_id);


--
-- TOC entry 2834 (class 1259 OID 1345977)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2797 (class 1259 OID 1345885)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2774 (class 1259 OID 1345804)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2775 (class 1259 OID 1345806)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2776 (class 1259 OID 1345805)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2777 (class 1259 OID 1345807)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2860 (class 1259 OID 1346054)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2934 (class 1259 OID 1346234)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2955 (class 1259 OID 1346304)
-- Name: uniq_344a77a559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_344a77a559828a3 ON uprizoritev USING btree (sifra);


--
-- TOC entry 2948 (class 1259 OID 1346283)
-- Name: uniq_3f50510d559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d559828a3 ON tipfunkcije USING btree (sifra);


--
-- TOC entry 2949 (class 1259 OID 1346284)
-- Name: uniq_3f50510d55cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d55cca980 ON tipfunkcije USING btree (ime);


--
-- TOC entry 2792 (class 1259 OID 1345865)
-- Name: uniq_466966d7559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7559828a3 ON oseba USING btree (sifra);


--
-- TOC entry 2793 (class 1259 OID 1345866)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2966 (class 1259 OID 1346348)
-- Name: uniq_5216fcb0559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5216fcb0559828a3 ON zvrstuprizoritve USING btree (sifra);


--
-- TOC entry 2746 (class 1259 OID 1345711)
-- Name: uniq_5a434fbc559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5a434fbc559828a3 ON stevilcenje USING btree (sifra);


--
-- TOC entry 2784 (class 1259 OID 1345831)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2750 (class 1259 OID 1345718)
-- Name: uniq_6054e804889a7556; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_6054e804889a7556 ON stevilcenjekonfig USING btree (dok);


--
-- TOC entry 2997 (class 1259 OID 1346507)
-- Name: uniq_7d834df4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_7d834df4559828a3 ON tipprogramskeenote USING btree (sifra);


--
-- TOC entry 2879 (class 1259 OID 1346100)
-- Name: uniq_952dd21937854736; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21937854736 ON prostor USING btree (naziv);


--
-- TOC entry 2880 (class 1259 OID 1346099)
-- Name: uniq_952dd219559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd219559828a3 ON prostor USING btree (sifra);


--
-- TOC entry 2912 (class 1259 OID 1346162)
-- Name: uniq_a4b7244f559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a4b7244f559828a3 ON alternacija USING btree (sifra);


--
-- TOC entry 2800 (class 1259 OID 1345894)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2963 (class 1259 OID 1346338)
-- Name: uniq_cede8e36559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_cede8e36559828a3 ON zvrstsurs USING btree (sifra);


--
-- TOC entry 3013 (class 1259 OID 1346562)
-- Name: uniq_de1c8aa1d55226c7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_de1c8aa1d55226c7 ON vrstazapisa USING btree (oznaka);


--
-- TOC entry 2988 (class 1259 OID 1346441)
-- Name: uniq_e6fc2028559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc2028559828a3 ON produkcijskahisa USING btree (sifra);


--
-- TOC entry 2989 (class 1259 OID 1346442)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2923 (class 1259 OID 1346206)
-- Name: uniq_ec773670ca2e5fcb; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ec773670ca2e5fcb ON besedilo USING btree (stevilka);


--
-- TOC entry 2846 (class 1259 OID 1346019)
-- Name: uniq_ecc8f8c5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ecc8f8c5559828a3 ON sezona USING btree (sifra);


--
-- TOC entry 2759 (class 1259 OID 1345754)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 3052 (class 2606 OID 1346709)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 3051 (class 2606 OID 1346714)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 3047 (class 2606 OID 1346734)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 3053 (class 2606 OID 1346704)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 3049 (class 2606 OID 1346724)
-- Name: fk_11e93b5dbbc7a989; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dbbc7a989 FOREIGN KEY (dogodek_splosni_id) REFERENCES dogodeksplosni(id);


--
-- TOC entry 3048 (class 2606 OID 1346729)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 3050 (class 2606 OID 1346719)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 3100 (class 2606 OID 1346959)
-- Name: fk_11ffe6e05c75296c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e05c75296c FOREIGN KEY (vrstastroska_id) REFERENCES vrstastroska(id);


--
-- TOC entry 3099 (class 2606 OID 1346964)
-- Name: fk_11ffe6e062b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e062b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 3098 (class 2606 OID 1346969)
-- Name: fk_11ffe6e06beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e06beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 3119 (class 2606 OID 1347069)
-- Name: fk_14a5d6d3727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d3727aca70 FOREIGN KEY (parent_id) REFERENCES mapa(id);


--
-- TOC entry 3120 (class 2606 OID 1347064)
-- Name: fk_14a5d6d38a4a6c12; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d38a4a6c12 FOREIGN KEY (lastnik_id) REFERENCES uporabniki(id);


--
-- TOC entry 3037 (class 2606 OID 1346654)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 3063 (class 2606 OID 1346784)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 3126 (class 2606 OID 1347109)
-- Name: fk_1ed92829253c4123; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829253c4123 FOREIGN KEY (avtor_id) REFERENCES uporabniki(id);


--
-- TOC entry 3127 (class 2606 OID 1347104)
-- Name: fk_1ed9282957ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282957ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 3125 (class 2606 OID 1347114)
-- Name: fk_1ed9282987ff3295; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282987ff3295 FOREIGN KEY (zaklenil_id) REFERENCES uporabniki(id);


--
-- TOC entry 3128 (class 2606 OID 1347099)
-- Name: fk_1ed92829a54dbb1f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829a54dbb1f FOREIGN KEY (datoteka_id) REFERENCES datoteka(id);


--
-- TOC entry 3129 (class 2606 OID 1347094)
-- Name: fk_1ed92829ef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829ef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstazapisa(id);


--
-- TOC entry 3065 (class 2606 OID 1346799)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 3066 (class 2606 OID 1346794)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 3057 (class 2606 OID 1346754)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 3092 (class 2606 OID 1346919)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 3090 (class 2606 OID 1346929)
-- Name: fk_23aeb9586b361365; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9586b361365 FOREIGN KEY (tipfunkcije_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 3091 (class 2606 OID 1346924)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 3031 (class 2606 OID 1346629)
-- Name: fk_2942b10710389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b10710389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 3032 (class 2606 OID 1346624)
-- Name: fk_2942b1076beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b1076beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 3062 (class 2606 OID 1346779)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 3117 (class 2606 OID 1347054)
-- Name: fk_2d901816d6bc69d6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT fk_2d901816d6bc69d6 FOREIGN KEY (programrazno_id) REFERENCES enotaprograma(id);


--
-- TOC entry 3095 (class 2606 OID 1346934)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 3094 (class 2606 OID 1346939)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 3093 (class 2606 OID 1346944)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 3130 (class 2606 OID 1347119)
-- Name: fk_2eaff9dcaf91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT fk_2eaff9dcaf91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id);


--
-- TOC entry 3102 (class 2606 OID 1346989)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 3105 (class 2606 OID 1346974)
-- Name: fk_344a77a7c3b0d59; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a7c3b0d59 FOREIGN KEY (maticnioder_id) REFERENCES prostor(id);


--
-- TOC entry 3101 (class 2606 OID 1346994)
-- Name: fk_344a77a853a965c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a853a965c FOREIGN KEY (producent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 3103 (class 2606 OID 1346984)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 3104 (class 2606 OID 1346979)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 3043 (class 2606 OID 1346689)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 3044 (class 2606 OID 1346684)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 3035 (class 2606 OID 1346649)
-- Name: fk_466966d769e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d769e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 3036 (class 2606 OID 1346644)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 3077 (class 2606 OID 1346854)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 3028 (class 2606 OID 1346604)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 3027 (class 2606 OID 1346609)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 3078 (class 2606 OID 1346869)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 3079 (class 2606 OID 1346864)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 3080 (class 2606 OID 1346859)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 3056 (class 2606 OID 1346744)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 3055 (class 2606 OID 1346749)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 3026 (class 2606 OID 1346599)
-- Name: fk_6054e804ff55f926; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT fk_6054e804ff55f926 FOREIGN KEY (stevilcenje_id) REFERENCES stevilcenje(id);


--
-- TOC entry 3073 (class 2606 OID 1346849)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 3075 (class 2606 OID 1346839)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 3076 (class 2606 OID 1346834)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 3074 (class 2606 OID 1346844)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 3030 (class 2606 OID 1346614)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 3029 (class 2606 OID 1346619)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 3081 (class 2606 OID 1346874)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 3118 (class 2606 OID 1347059)
-- Name: fk_781826c67e3c61f9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT fk_781826c67e3c61f9 FOREIGN KEY (owner_id) REFERENCES uporabniki(id);


--
-- TOC entry 3088 (class 2606 OID 1346914)
-- Name: fk_7ab77b7910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT fk_7ab77b7910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 3089 (class 2606 OID 1346909)
-- Name: fk_7ab77b79f35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT fk_7ab77b79f35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 3124 (class 2606 OID 1347084)
-- Name: fk_7adc957157ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc957157ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 3123 (class 2606 OID 1347089)
-- Name: fk_7adc9571fa6311ef; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc9571fa6311ef FOREIGN KEY (perm_id) REFERENCES permission(id);


--
-- TOC entry 3064 (class 2606 OID 1346789)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 3097 (class 2606 OID 1346949)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 3096 (class 2606 OID 1346954)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 3108 (class 2606 OID 1347029)
-- Name: fk_8787a0e54ae1cd1c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e54ae1cd1c FOREIGN KEY (gostitelj_id) REFERENCES popa(id);


--
-- TOC entry 3109 (class 2606 OID 1347024)
-- Name: fk_8787a0e55d0da56c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e55d0da56c FOREIGN KEY (drzavagostovanja_id) REFERENCES drza(id);


--
-- TOC entry 3112 (class 2606 OID 1347009)
-- Name: fk_8787a0e562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 3111 (class 2606 OID 1347014)
-- Name: fk_8787a0e57222d84b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e57222d84b FOREIGN KEY (tipprogramskeenote_id) REFERENCES tipprogramskeenote(id);


--
-- TOC entry 3110 (class 2606 OID 1347019)
-- Name: fk_8787a0e5771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e5771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 3039 (class 2606 OID 1346664)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 3040 (class 2606 OID 1346659)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 3038 (class 2606 OID 1346669)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 3067 (class 2606 OID 1346809)
-- Name: fk_952dd21969e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd21969e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 3068 (class 2606 OID 1346804)
-- Name: fk_952dd2196beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd2196beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 3115 (class 2606 OID 1347039)
-- Name: fk_97af082e38c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e38c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 3114 (class 2606 OID 1347044)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 3083 (class 2606 OID 1346889)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 3082 (class 2606 OID 1346894)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 3085 (class 2606 OID 1346879)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 3084 (class 2606 OID 1346884)
-- Name: fk_a4b7244fa4976613; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fa4976613 FOREIGN KEY (zaposlitev_id) REFERENCES zaposlitev(id);


--
-- TOC entry 3106 (class 2606 OID 1346999)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 3069 (class 2606 OID 1346829)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 3070 (class 2606 OID 1346824)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 3072 (class 2606 OID 1346814)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 3071 (class 2606 OID 1346819)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 3086 (class 2606 OID 1346904)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 3087 (class 2606 OID 1346899)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 3046 (class 2606 OID 1346699)
-- Name: fk_c38372b2be04ea9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY report
    ADD CONSTRAINT fk_c38372b2be04ea9 FOREIGN KEY (job_id) REFERENCES job(id);


--
-- TOC entry 3045 (class 2606 OID 1346694)
-- Name: fk_c395a618a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY job
    ADD CONSTRAINT fk_c395a618a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 3054 (class 2606 OID 1346739)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 3113 (class 2606 OID 1347034)
-- Name: fk_dba42fe79e3adf2c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkacdve
    ADD CONSTRAINT fk_dba42fe79e3adf2c FOREIGN KEY (programdela_id) REFERENCES programdela(id);


--
-- TOC entry 3116 (class 2606 OID 1347049)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 3107 (class 2606 OID 1347004)
-- Name: fk_e7d4cf2638c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT fk_e7d4cf2638c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 3122 (class 2606 OID 1347074)
-- Name: fk_e9f8ee8257ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee8257ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id) ON DELETE CASCADE;


--
-- TOC entry 3121 (class 2606 OID 1347079)
-- Name: fk_e9f8ee82af91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee82af91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id) ON DELETE CASCADE;


--
-- TOC entry 3033 (class 2606 OID 1346639)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 3034 (class 2606 OID 1346634)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 3042 (class 2606 OID 1346674)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 3041 (class 2606 OID 1346679)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 3058 (class 2606 OID 1346759)
-- Name: fk_f44a386d10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT fk_f44a386d10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 3059 (class 2606 OID 1346774)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 3060 (class 2606 OID 1346769)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 3061 (class 2606 OID 1346764)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- Completed on 2015-09-18 22:55:39 CEST

--
-- PostgreSQL database dump complete
--

