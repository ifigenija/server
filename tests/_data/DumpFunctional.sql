--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.9
-- Dumped by pg_dump version 9.3.9
-- Started on 2015-09-18 11:30:26 CEST

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- TOC entry 243 (class 3079 OID 11789)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 3011 (class 0 OID 0)
-- Dependencies: 243
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_with_oids = false;

--
-- TOC entry 181 (class 1259 OID 20002866)
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
-- TOC entry 227 (class 1259 OID 20003393)
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
-- TOC entry 226 (class 1259 OID 20003376)
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
-- TOC entry 217 (class 1259 OID 20003257)
-- Name: avtorbesedila; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE avtorbesedila (
    id uuid NOT NULL,
    besedilo_id uuid,
    tipavtorja character varying(255) NOT NULL,
    zaporedna integer,
    alivnaslovu boolean
);


--
-- TOC entry 220 (class 1259 OID 20003286)
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
-- TOC entry 241 (class 1259 OID 20003632)
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
-- TOC entry 195 (class 1259 OID 20003047)
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
-- TOC entry 197 (class 1259 OID 20003079)
-- Name: dogodeksplosni; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodeksplosni (
    id uuid NOT NULL
);


--
-- TOC entry 235 (class 1259 OID 20003558)
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
-- TOC entry 190 (class 1259 OID 20002987)
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
-- TOC entry 228 (class 1259 OID 20003406)
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
-- TOC entry 213 (class 1259 OID 20003212)
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
-- TOC entry 193 (class 1259 OID 20003026)
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
-- TOC entry 191 (class 1259 OID 20003004)
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
-- TOC entry 202 (class 1259 OID 20003126)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 239 (class 1259 OID 20003613)
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
-- TOC entry 240 (class 1259 OID 20003625)
-- Name: mapa_zapis; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE mapa_zapis (
    mapa_id uuid NOT NULL,
    zapis_id uuid NOT NULL
);


--
-- TOC entry 242 (class 1259 OID 20003647)
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
-- TOC entry 206 (class 1259 OID 20003151)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 188 (class 1259 OID 20002961)
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
-- TOC entry 182 (class 1259 OID 20002875)
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
-- TOC entry 183 (class 1259 OID 20002886)
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
-- TOC entry 178 (class 1259 OID 20002840)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 180 (class 1259 OID 20002859)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 207 (class 1259 OID 20003158)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 211 (class 1259 OID 20003192)
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
-- TOC entry 223 (class 1259 OID 20003325)
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
-- TOC entry 185 (class 1259 OID 20002919)
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
-- TOC entry 187 (class 1259 OID 20002953)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 230 (class 1259 OID 20003504)
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
-- TOC entry 203 (class 1259 OID 20003132)
-- Name: postavkaracuna; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE postavkaracuna (
    id uuid NOT NULL,
    racun_id uuid
);


--
-- TOC entry 186 (class 1259 OID 20002938)
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
-- TOC entry 192 (class 1259 OID 20003016)
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
-- TOC entry 205 (class 1259 OID 20003144)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 231 (class 1259 OID 20003518)
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
-- TOC entry 232 (class 1259 OID 20003528)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    sifra character varying(4) NOT NULL,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 229 (class 1259 OID 20003461)
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
-- TOC entry 233 (class 1259 OID 20003536)
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
-- TOC entry 209 (class 1259 OID 20003173)
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
-- TOC entry 201 (class 1259 OID 20003117)
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
-- TOC entry 200 (class 1259 OID 20003107)
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
-- TOC entry 222 (class 1259 OID 20003314)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying,
    status character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 216 (class 1259 OID 20003247)
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
-- TOC entry 175 (class 1259 OID 20002811)
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
-- TOC entry 174 (class 1259 OID 20002809)
-- Name: revizije_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE revizije_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3012 (class 0 OID 0)
-- Dependencies: 174
-- Name: revizije_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE revizije_id_seq OWNED BY revizije.id;


--
-- TOC entry 210 (class 1259 OID 20003186)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 179 (class 1259 OID 20002849)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 177 (class 1259 OID 20002833)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 212 (class 1259 OID 20003200)
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
-- TOC entry 204 (class 1259 OID 20003138)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 198 (class 1259 OID 20003084)
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
-- TOC entry 173 (class 1259 OID 20002798)
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
-- TOC entry 172 (class 1259 OID 20002790)
-- Name: stevilcenjekonfig; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjekonfig (
    id uuid NOT NULL,
    stevilcenje_id uuid,
    dok character varying(100) DEFAULT NULL::character varying
);


--
-- TOC entry 171 (class 1259 OID 20002785)
-- Name: stevilcenjestanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjestanje (
    id uuid NOT NULL,
    objid uuid NOT NULL,
    leto integer NOT NULL,
    stevilka integer
);


--
-- TOC entry 218 (class 1259 OID 20003263)
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
-- TOC entry 184 (class 1259 OID 20002911)
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
-- TOC entry 199 (class 1259 OID 20003094)
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
-- TOC entry 221 (class 1259 OID 20003302)
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
-- TOC entry 234 (class 1259 OID 20003546)
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
-- TOC entry 189 (class 1259 OID 20002973)
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
-- TOC entry 176 (class 1259 OID 20002820)
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
-- TOC entry 225 (class 1259 OID 20003351)
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
-- TOC entry 194 (class 1259 OID 20003037)
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
-- TOC entry 208 (class 1259 OID 20003165)
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
-- TOC entry 219 (class 1259 OID 20003277)
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
-- TOC entry 237 (class 1259 OID 20003593)
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
-- TOC entry 236 (class 1259 OID 20003565)
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
-- TOC entry 238 (class 1259 OID 20003605)
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
-- TOC entry 215 (class 1259 OID 20003237)
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
-- TOC entry 196 (class 1259 OID 20003073)
-- Name: zasedenost; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zasedenost (
    id uuid NOT NULL,
    oseba_id uuid
);


--
-- TOC entry 224 (class 1259 OID 20003341)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 214 (class 1259 OID 20003227)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 2191 (class 2604 OID 20002814)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 2943 (class 0 OID 20002866)
-- Dependencies: 181
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
\.


--
-- TOC entry 2989 (class 0 OID 20003393)
-- Dependencies: 227
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, zaposlitev_id, oseba_id, pogodba_id, sifra, zaposlen, zacetek, konec, opomba, sort, privzeti, aktivna, imapogodbo, pomembna) FROM stdin;
000c0000-55fb-d9b1-b5d0-e0a750c31b17	000d0000-55fb-d9b1-abb3-5b0309843035	\N	00090000-55fb-d9b0-147b-462c84aa1287	000b0000-55fb-d9b1-90c1-436c164e1638	0001	f	\N	\N	\N	3	t	\N	t	t
000c0000-55fb-d9b1-ab3a-2d57641dc668	000d0000-55fb-d9b1-8822-714e854b0792	00100000-55fb-d9b1-4eb7-3d59a0cc0a58	00090000-55fb-d9b0-193f-3770d3561d3c	\N	0002	t	2016-01-01	\N	\N	8	t	\N	f	f
000c0000-55fb-d9b1-f1c2-665233052a61	000d0000-55fb-d9b1-0bdd-5e2948c47f80	00100000-55fb-d9b1-c717-856f12e9ddd2	00090000-55fb-d9b0-cf7c-dbff8c852638	\N	0003	t	\N	2015-09-18	\N	2	t	\N	f	f
000c0000-55fb-d9b1-4cc2-e1abc8496e88	000d0000-55fb-d9b1-7cef-cf63b8a861ec	\N	00090000-55fb-d9b0-34d3-b31547c68534	\N	0004	f	2016-01-01	2016-01-01	\N	26	t	\N	f	f
000c0000-55fb-d9b1-042d-6ba3f8908e44	000d0000-55fb-d9b1-91b5-474bedf1eae5	\N	00090000-55fb-d9b0-f05c-59a88ad20cbd	\N	0005	f	2016-01-01	2016-01-01	\N	7	t	\N	f	f
000c0000-55fb-d9b1-4043-a1428e9cba47	000d0000-55fb-d9b1-7739-d903e42ec9f7	\N	00090000-55fb-d9b0-72ae-752644267552	000b0000-55fb-d9b1-f2dc-9c2050cd1bba	0006	f	2016-01-01	2016-01-01	\N	1	t	\N	t	t
000c0000-55fb-d9b1-088a-525c6226748b	000d0000-55fb-d9b1-4087-5be87ac74c66	00100000-55fb-d9b1-d74e-b1a8131cdd9f	00090000-55fb-d9b0-f460-4cceab9bfa12	\N	0007	t	2016-01-01	2016-01-01	\N	14	t	\N	f	t
000c0000-55fb-d9b1-c93b-550c368b6691	000d0000-55fb-d9b1-2874-64eab69b95a5	\N	00090000-55fb-d9b0-2495-dedc7aa80311	000b0000-55fb-d9b1-35b0-8b5016d7ed1e	0008	f	2016-01-01	2016-01-01	\N	12	t	\N	t	t
000c0000-55fb-d9b1-4c77-81717dd4d8c6	000d0000-55fb-d9b1-4087-5be87ac74c66	00100000-55fb-d9b1-a684-e4714582b27d	00090000-55fb-d9b0-a235-84aa66bd6903	\N	0009	t	2017-01-01	2017-01-01	\N	15	t	\N	f	t
000c0000-55fb-d9b1-288d-afe7a3d58e26	000d0000-55fb-d9b1-4087-5be87ac74c66	00100000-55fb-d9b1-7fe6-fe725843e883	00090000-55fb-d9b0-f675-0fb0ae4cbe89	\N	0010	t	\N	2015-09-18	\N	16	f	\N	f	t
000c0000-55fb-d9b1-771e-7a294b8e8a00	000d0000-55fb-d9b1-4087-5be87ac74c66	00100000-55fb-d9b1-4ed4-178bdd249ec0	00090000-55fb-d9b0-d525-75db46f60d5d	\N	0011	t	2017-01-01	\N	\N	17	f	\N	f	t
000c0000-55fb-d9b1-3177-a1477c8e9553	000d0000-55fb-d9b1-997d-05269e1a72b0	\N	00090000-55fb-d9b0-193f-3770d3561d3c	000b0000-55fb-d9b1-29c4-19800191fef6	0012	f	\N	\N	\N	2	t	\N	t	t
\.


--
-- TOC entry 2988 (class 0 OID 20003376)
-- Dependencies: 226
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 2979 (class 0 OID 20003257)
-- Dependencies: 217
-- Data for Name: avtorbesedila; Type: TABLE DATA; Schema: public; Owner: -
--

COPY avtorbesedila (id, besedilo_id, tipavtorja, zaporedna, alivnaslovu) FROM stdin;
\.


--
-- TOC entry 2982 (class 0 OID 20003286)
-- Dependencies: 220
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, stevilka, naslov, podnaslov, jezik, naslovizvirnika, internacionalninaslov, datumprejema, moskevloge, zenskevloge, povzetekvsebine, letoizida, krajizida, zaloznik) FROM stdin;
00160000-55fb-d9b0-9ba8-db51e40c5f7f	0001	Sen kresne noči		slovenščina	A Midsummer Night's Dream	\N	2015-04-26	5	5	Nastopajo Titanija, Hipolita, Oberon, ...	\N	\N	\N
00160000-55fb-d9b0-68cf-293d4fb38bd5	0002	Bratje Karamazovi		slovenščina	Bratja Karamazjovji	\N	2015-12-04	4	1	Svetovna uspešnica	\N	\N	\N
00160000-55fb-d9b0-54e1-7c839808bc77	0003	Smoletov Vrt		slovenščina		\N	2015-05-26	2	8		\N	\N	\N
\.


--
-- TOC entry 3003 (class 0 OID 20003632)
-- Dependencies: 241
-- Data for Name: datoteka; Type: TABLE DATA; Schema: public; Owner: -
--

COPY datoteka (id, owner_id, filename, transfers, size, format, hash, createdat, uploadedat, upor, datknj) FROM stdin;
\.


--
-- TOC entry 2957 (class 0 OID 20003047)
-- Dependencies: 195
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_splosni_id, prostor_id, sezona_id, planiranzacetek, allday, zacetek, konec, status, razred, termin, title) FROM stdin;
00180000-55fb-d9b1-e93c-77abec9085b8	\N	\N	00200000-55fb-d9b1-fac8-7e82ddac40eb	\N	\N	\N	\N	2015-06-26 10:00:00	f	2015-06-26 10:00:00	2015-06-26 12:00:00	200s	200s		dogodek 1
00180000-55fb-d9b1-40fc-4c15b6b07e31	\N	\N	00200000-55fb-d9b1-4106-b75a2e04c8e6	\N	\N	\N	\N	2015-06-27 10:00:00	f	2015-06-27 10:00:00	2015-06-27 12:00:00	300s	200s		dogodek 2
00180000-55fb-d9b1-4c24-cdfeb216dee9	\N	\N	00200000-55fb-d9b1-2ad5-7f3e402bd760	\N	\N	\N	\N	2015-08-01 20:00:00	f	2015-08-01 20:00:00	2015-08-01 23:00:00	400s	200s		dogodek 3
00180000-55fb-d9b1-022f-60380a6e7dbd	\N	\N	00200000-55fb-d9b1-abe3-9d33561bdcce	\N	\N	\N	\N	2015-08-01 20:00:00	f	2015-08-01 20:00:00	2015-08-01 23:00:00	100s	200s		dogodek 4
00180000-55fb-d9b1-e65c-4d153a76c69d	\N	\N	00200000-55fb-d9b1-6f8c-b5e16cc11059	\N	\N	\N	\N	2015-08-01 20:00:00	f	2015-08-01 20:00:00	2015-08-01 23:00:00	500s	200s		dogodek 5
\.


--
-- TOC entry 2959 (class 0 OID 20003079)
-- Dependencies: 197
-- Data for Name: dogodeksplosni; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodeksplosni (id) FROM stdin;
\.


--
-- TOC entry 2997 (class 0 OID 20003558)
-- Dependencies: 235
-- Data for Name: drugivir; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drugivir (id, znesek, opis, mednarodni, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 2952 (class 0 OID 20002987)
-- Dependencies: 190
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-55fb-d9af-4812-2cbc6fc92e9f	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-55fb-d9af-423f-ffeffbc22d60	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-55fb-d9af-a151-d4a4a2d443ae	AL	ALB	008	Albania 	Albanija	\N
00040000-55fb-d9af-9e17-5158184617cd	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-55fb-d9af-786d-60be72d1417e	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-55fb-d9af-f440-db46dee9de0a	AD	AND	020	Andorra 	Andora	\N
00040000-55fb-d9af-6940-69cca484d49b	AO	AGO	024	Angola 	Angola	\N
00040000-55fb-d9af-0eed-e69c243b670c	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-55fb-d9af-26d2-6f32100bc6a5	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-55fb-d9af-d843-4c84410dad51	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-55fb-d9af-5d57-408d5606c95d	AR	ARG	032	Argentina 	Argenitna	\N
00040000-55fb-d9af-6238-3f8b6fa96c92	AM	ARM	051	Armenia 	Armenija	\N
00040000-55fb-d9af-b9db-04596c0f99a5	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-55fb-d9af-3ad9-b3d18422776b	AU	AUS	036	Australia 	Avstralija	\N
00040000-55fb-d9af-da66-9b9c9cec3e1a	AT	AUT	040	Austria 	Avstrija	\N
00040000-55fb-d9af-5ad4-e7b836d57446	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-55fb-d9af-3e95-86d7d43bbf64	BS	BHS	044	Bahamas 	Bahami	\N
00040000-55fb-d9af-7094-755de2c1136a	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-55fb-d9af-ef07-b9694c3132f0	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-55fb-d9af-8a2b-35de75b8c63b	BB	BRB	052	Barbados 	Barbados	\N
00040000-55fb-d9af-ace4-9bec90b40b89	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-55fb-d9af-5f1d-f57e66039ec5	BE	BEL	056	Belgium 	Belgija	\N
00040000-55fb-d9af-4987-cb8545b235f9	BZ	BLZ	084	Belize 	Belize	\N
00040000-55fb-d9af-acec-a78d86e510cc	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-55fb-d9af-4a27-279998b7e623	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-55fb-d9af-b1a0-4bcea14d5b0e	BT	BTN	064	Bhutan 	Butan	\N
00040000-55fb-d9af-e479-13ce2f5982ec	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-55fb-d9af-467b-902910f756c6	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-55fb-d9af-8f3b-e4a896809571	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-55fb-d9af-46ed-056e0d66cd21	BW	BWA	072	Botswana 	Bocvana	\N
00040000-55fb-d9af-5566-ac0c2ffd19c2	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-55fb-d9af-d536-951c4e224f1e	BR	BRA	076	Brazil 	Brazilija	\N
00040000-55fb-d9af-83a3-955ff8c0e467	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-55fb-d9af-4bd1-552ea9204998	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-55fb-d9af-0e29-cea86aec8037	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-55fb-d9af-df12-802b0d591b47	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-55fb-d9af-fad0-1d23f9819097	BI	BDI	108	Burundi 	Burundi 	\N
00040000-55fb-d9af-6ecc-f973fba242b6	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-55fb-d9af-3660-69c24713aef4	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-55fb-d9af-55f8-05ba71b3a583	CA	CAN	124	Canada 	Kanada	\N
00040000-55fb-d9af-b8c8-0718201760c8	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-55fb-d9af-d591-abf44c3ca007	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-55fb-d9af-a745-b6a04f590885	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-55fb-d9af-a619-9e14a0c9391b	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-55fb-d9af-6add-a92bb1939988	CL	CHL	152	Chile 	Čile	\N
00040000-55fb-d9af-d45d-f0c5f446b1ec	CN	CHN	156	China 	Kitajska	\N
00040000-55fb-d9af-2fd3-dffe3c6e950e	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-55fb-d9af-8e6f-2b371c3f66b5	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-55fb-d9af-b6c6-29399ba7b5c9	CO	COL	170	Colombia 	Kolumbija	\N
00040000-55fb-d9af-156b-1747279adf80	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-55fb-d9af-0539-bc8759c73a11	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-55fb-d9af-57d2-f76ae8421e58	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-55fb-d9af-8c39-66e390459b56	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-55fb-d9af-e374-4ee8b5ef2593	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-55fb-d9af-c0af-52c1365cf823	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-55fb-d9af-e567-471b0160d6b4	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-55fb-d9af-c199-ca6af800a271	CU	CUB	192	Cuba 	Kuba	\N
00040000-55fb-d9af-df85-f5843ff3ebf7	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-55fb-d9af-8b70-289bc537907a	CY	CYP	196	Cyprus 	Ciper	\N
00040000-55fb-d9af-7b16-c13989dc9152	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-55fb-d9af-377a-6ec469024586	DK	DNK	208	Denmark 	Danska	\N
00040000-55fb-d9af-6c99-38565d3d39f0	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-55fb-d9af-7dab-67e2a6262786	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-55fb-d9af-a477-4faa82bfc142	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-55fb-d9af-f42b-805e321d3629	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-55fb-d9af-9977-0a9f26cc3e3f	EG	EGY	818	Egypt 	Egipt	\N
00040000-55fb-d9af-0c2c-d56bfe490468	SV	SLV	222	El Salvador 	Salvador	\N
00040000-55fb-d9af-ed67-81366b6c1c3f	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-55fb-d9af-be52-63f24f0bb749	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-55fb-d9af-6de9-4c4a79ab861a	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-55fb-d9af-0609-a5b4c581a930	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-55fb-d9af-49aa-da23c287bb1f	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-55fb-d9af-cc55-e16e93bc1847	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-55fb-d9af-d2c0-155a79e075ee	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-55fb-d9af-3729-0bcb56c4b9d7	FI	FIN	246	Finland 	Finska	\N
00040000-55fb-d9af-c486-79f378bc16c2	FR	FRA	250	France 	Francija	\N
00040000-55fb-d9af-4705-6ca73b3a36ae	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-55fb-d9af-aefb-0479547182c2	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-55fb-d9af-ed97-3f899eecf120	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-55fb-d9af-8fbe-a9bd6b7bea5d	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-55fb-d9af-3e27-fc58cce981df	GA	GAB	266	Gabon 	Gabon	\N
00040000-55fb-d9af-ac81-7b713fc633b2	GM	GMB	270	Gambia 	Gambija	\N
00040000-55fb-d9af-d3eb-d47f89488532	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-55fb-d9af-ffaa-2db085ab3431	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-55fb-d9af-456b-3acb7810b66c	GH	GHA	288	Ghana 	Gana	\N
00040000-55fb-d9af-1b82-9ac330f204ec	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-55fb-d9af-5e45-0932a9f78032	GR	GRC	300	Greece 	Grčija	\N
00040000-55fb-d9af-b057-1a0647758e70	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-55fb-d9af-8ce4-0a93db292535	GD	GRD	308	Grenada 	Grenada	\N
00040000-55fb-d9af-9c74-fbab542baf3b	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-55fb-d9af-861c-fdf638871bf5	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-55fb-d9af-dc66-7d199c96871d	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-55fb-d9af-545c-d22537d869a5	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-55fb-d9af-1781-5e0827e16b6e	GN	GIN	324	Guinea 	Gvineja	\N
00040000-55fb-d9af-b6f3-bb13e7b39bf5	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-55fb-d9af-5a1f-c91cfcb37bad	GY	GUY	328	Guyana 	Gvajana	\N
00040000-55fb-d9af-01ca-d060f8d0a18e	HT	HTI	332	Haiti 	Haiti	\N
00040000-55fb-d9af-c7eb-ed23a4a43b17	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-55fb-d9af-c28a-d9932640930f	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-55fb-d9af-8a6a-a37238310fdf	HN	HND	340	Honduras 	Honduras	\N
00040000-55fb-d9af-7a52-8811c1917654	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-55fb-d9af-804d-dc1b150da955	HU	HUN	348	Hungary 	Madžarska	\N
00040000-55fb-d9af-dcdd-2148c7b95df3	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-55fb-d9af-61ec-5f50deab1732	IN	IND	356	India 	Indija	\N
00040000-55fb-d9af-0d78-befc822570ce	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-55fb-d9af-995f-3d71cf62f6da	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-55fb-d9af-3b99-8eff6f8f04f0	IQ	IRQ	368	Iraq 	Irak	\N
00040000-55fb-d9af-8899-21fe74e16214	IE	IRL	372	Ireland 	Irska	\N
00040000-55fb-d9af-e5ec-10039c25baeb	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-55fb-d9af-f0ee-af419cd0892c	IL	ISR	376	Israel 	Izrael	\N
00040000-55fb-d9af-1567-9fb36a837a80	IT	ITA	380	Italy 	Italija	\N
00040000-55fb-d9af-8fe6-2c5c196bd997	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-55fb-d9af-2d54-242ef9464338	JP	JPN	392	Japan 	Japonska	\N
00040000-55fb-d9af-582b-afd60fb6dbb3	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-55fb-d9af-4d30-7de8413ab406	JO	JOR	400	Jordan 	Jordanija	\N
00040000-55fb-d9af-c44e-ca1ef5359a0b	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-55fb-d9af-7576-729debf6d445	KE	KEN	404	Kenya 	Kenija	\N
00040000-55fb-d9af-025d-72cbc4068ae4	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-55fb-d9af-76e3-9529eed87afa	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-55fb-d9af-4bfe-7e148f78e43f	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-55fb-d9af-c40e-eef168dd5b74	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-55fb-d9af-782d-0aeb1d3c2e02	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-55fb-d9af-35bd-19200847f995	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-55fb-d9af-fe7a-f457498821e0	LV	LVA	428	Latvia 	Latvija	\N
00040000-55fb-d9af-14de-e6e6b1637a9a	LB	LBN	422	Lebanon 	Libanon	\N
00040000-55fb-d9af-58ed-e62b5dead633	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-55fb-d9af-b3d7-216fe6d9ef93	LR	LBR	430	Liberia 	Liberija	\N
00040000-55fb-d9af-33c4-ea2593802890	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-55fb-d9af-9c41-169fab71401e	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-55fb-d9af-8931-ba60e76af6cd	LT	LTU	440	Lithuania 	Litva	\N
00040000-55fb-d9af-101f-99f9119ab6dc	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-55fb-d9af-658d-81e481c76701	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-55fb-d9af-266a-10abae41a75b	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-55fb-d9af-56a0-ce12140153f5	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-55fb-d9af-9028-d580e8c60306	MW	MWI	454	Malawi 	Malavi	\N
00040000-55fb-d9af-088f-1028dfd2d351	MY	MYS	458	Malaysia 	Malezija	\N
00040000-55fb-d9af-77e1-3a13de164dc6	MV	MDV	462	Maldives 	Maldivi	\N
00040000-55fb-d9af-fc35-ffc016b43d12	ML	MLI	466	Mali 	Mali	\N
00040000-55fb-d9af-c768-b6b571d33b88	MT	MLT	470	Malta 	Malta	\N
00040000-55fb-d9af-cc62-794957158711	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-55fb-d9af-8c10-60de8d3bedf7	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-55fb-d9af-26fd-63b0cc825eae	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-55fb-d9af-034f-94df4a801651	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-55fb-d9af-f506-e12e9f755ac1	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-55fb-d9af-81c8-209075167d52	MX	MEX	484	Mexico 	Mehika	\N
00040000-55fb-d9af-09ba-f0527396b7a2	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-55fb-d9af-ec9b-056cbea09945	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-55fb-d9af-b11c-bce26b10b457	MC	MCO	492	Monaco 	Monako	\N
00040000-55fb-d9af-c4d7-a4dadab5d3e2	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-55fb-d9af-a00e-41e40601935b	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-55fb-d9af-2322-549c4960af6e	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-55fb-d9af-9ada-4c7f2c805aba	MA	MAR	504	Morocco 	Maroko	\N
00040000-55fb-d9af-befd-91c5ee7ac784	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-55fb-d9af-b452-b68c1ca94969	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-55fb-d9af-287f-dede65902b77	NA	NAM	516	Namibia 	Namibija	\N
00040000-55fb-d9af-596b-92bfa93c7a38	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-55fb-d9af-9df3-6c929de29a00	NP	NPL	524	Nepal 	Nepal	\N
00040000-55fb-d9af-7e1d-0cb8cfae7f2a	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-55fb-d9af-e886-c3d69c38d7be	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-55fb-d9af-b12e-346d6aaca449	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-55fb-d9af-edca-5dc673d01dca	NE	NER	562	Niger 	Niger 	\N
00040000-55fb-d9af-17eb-41d05e3fe719	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-55fb-d9af-25df-c518e5359615	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-55fb-d9af-f79e-aa5901c54ceb	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-55fb-d9af-810f-e6cd4abd8dd0	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-55fb-d9af-e1df-944eaeea200f	NO	NOR	578	Norway 	Norveška	\N
00040000-55fb-d9af-1ef7-1953204ae504	OM	OMN	512	Oman 	Oman	\N
00040000-55fb-d9af-f5bb-4f3f5c905825	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-55fb-d9af-217b-e2df8f1f11a8	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-55fb-d9af-98e8-4718df9a6b0f	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-55fb-d9af-ffee-5f9cf0ac28f7	PA	PAN	591	Panama 	Panama	\N
00040000-55fb-d9af-cc3c-b8995b9437ea	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-55fb-d9af-3758-0e9cda182dc3	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-55fb-d9af-6586-797479f7ca3a	PE	PER	604	Peru 	Peru	\N
00040000-55fb-d9af-c18c-a291c0cc458c	PH	PHL	608	Philippines 	Filipini	\N
00040000-55fb-d9af-117f-989a5523fb4a	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-55fb-d9af-b796-fe4166dc1546	PL	POL	616	Poland 	Poljska	\N
00040000-55fb-d9af-53a9-799278f0bf40	PT	PRT	620	Portugal 	Portugalska	\N
00040000-55fb-d9af-2664-6af0237b046d	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-55fb-d9af-51ae-f22873d70e41	QA	QAT	634	Qatar 	Katar	\N
00040000-55fb-d9af-716d-c4071fd7fa5a	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-55fb-d9af-4035-33fd63bc04d3	RO	ROU	642	Romania 	Romunija	\N
00040000-55fb-d9af-73e7-77b6b3352e8d	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-55fb-d9af-7c65-6ac11ac60838	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-55fb-d9af-cf62-1ebc3148a4b9	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-55fb-d9af-42fd-2c14adc0d226	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-55fb-d9af-8f47-94a84b3f3297	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-55fb-d9af-2508-e76601737315	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-55fb-d9af-0efb-938bf8b986dd	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-55fb-d9af-84bf-0d170f69c756	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-55fb-d9af-f7f5-4a7ee6a29023	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-55fb-d9af-5473-1ce830c6fb4d	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-55fb-d9af-e7ac-36dd363304b3	SM	SMR	674	San Marino 	San Marino	\N
00040000-55fb-d9af-cf17-308deac849e1	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-55fb-d9af-f75d-36d582584d83	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-55fb-d9af-b605-4970a7ddea0c	SN	SEN	686	Senegal 	Senegal	\N
00040000-55fb-d9af-7bb5-dd65e45452de	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-55fb-d9af-f30b-b1b063db88ea	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-55fb-d9af-7bd3-076f2d9186bc	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-55fb-d9af-1bab-556b07c1a124	SG	SGP	702	Singapore 	Singapur	\N
00040000-55fb-d9af-6817-bf535ca46a2f	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-55fb-d9af-11dc-7ef78dc04687	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-55fb-d9af-e524-870a6a6e811b	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-55fb-d9af-5a52-94ad2c60732d	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-55fb-d9af-737b-94a786615175	SO	SOM	706	Somalia 	Somalija	\N
00040000-55fb-d9af-f665-35b8157167b5	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-55fb-d9af-617f-0530f8a01cd6	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-55fb-d9af-85c2-e0dcf5a50911	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-55fb-d9af-3e74-a0aa4c8fec2b	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-55fb-d9af-7e4c-b7ffd7bd1153	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-55fb-d9af-6cfd-22ab41641da0	SD	SDN	729	Sudan 	Sudan	\N
00040000-55fb-d9af-c3a6-a07dd56da492	SR	SUR	740	Suriname 	Surinam	\N
00040000-55fb-d9af-1bf0-41d3c867ad39	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-55fb-d9af-f345-d2f98e681bd2	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-55fb-d9af-a4d4-e9024ca51ce8	SE	SWE	752	Sweden 	Švedska	\N
00040000-55fb-d9af-1d08-7b341ff71d0a	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-55fb-d9af-91f5-54c04e288a17	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-55fb-d9af-aa94-944186e1ba44	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-55fb-d9af-bae0-67f8bc7fc594	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-55fb-d9af-a1b8-2d0796746d28	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-55fb-d9af-0311-b7d59d19d886	TH	THA	764	Thailand 	Tajska	\N
00040000-55fb-d9af-d64c-4b49870b30db	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-55fb-d9af-c3b8-c79516ee77bb	TG	TGO	768	Togo 	Togo	\N
00040000-55fb-d9af-58b0-9fd6256c071f	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-55fb-d9af-dd27-a7c1896f407b	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-55fb-d9af-a16c-7766bfe4cbca	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-55fb-d9af-c58b-c6f6a72f3fe4	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-55fb-d9af-dcb9-2d06bc480b3e	TR	TUR	792	Turkey 	Turčija	\N
00040000-55fb-d9af-1cad-aca1e4a82f3e	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-55fb-d9af-9d44-920fc2bbaee8	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-55fb-d9af-beec-15591b18d58f	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-55fb-d9af-e3ab-bd4890f42f85	UG	UGA	800	Uganda 	Uganda	\N
00040000-55fb-d9af-deb7-2df69a6b7478	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-55fb-d9af-608d-39b80a26c62f	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-55fb-d9af-8aac-f25cebccdf48	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-55fb-d9af-5c26-5758e2ebddf4	US	USA	840	United States 	Združene države Amerike	\N
00040000-55fb-d9af-a22c-df4402000fe9	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-55fb-d9af-55a6-4068e506c85f	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-55fb-d9af-a9b7-dc5ef577b7fa	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-55fb-d9af-0909-5868e50b6cff	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-55fb-d9af-fa24-58e4ddd40072	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-55fb-d9af-1f5c-20616cced0f1	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-55fb-d9af-d720-180d96436397	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-55fb-d9af-ccc1-f21c1462be01	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-55fb-d9af-18bf-ae762430b71d	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-55fb-d9af-97a6-2ed1d93310b0	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-55fb-d9af-b996-aa102ed12681	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-55fb-d9af-eb87-71ef8df7621a	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-55fb-d9af-752a-ec91e8776716	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 2990 (class 0 OID 20003406)
-- Dependencies: 228
-- Data for Name: enotaprograma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY enotaprograma (id, uprizoritev_id, program_dela_id, gostitelj_id, celotnavrednost, nasdelez, celotnavrednostmat, celotnavrednostgostovsz, zaproseno, lastnasredstva, avtorskihonorarji, avtorskihonorarjisamoz, tantieme, avtorskepravice, materialni, imakoprodukcije, vlozekgostitelja, drugijavni, stzaposlenih, stzaposumet, stzaposdrug, sthonorarnih, sthonorarnihigr, sthonorarnihigrtujjz, sthonorarnihigrsamoz, obiskdoma, obiskkopr, obiskgost, obiskzamejo, obiskint, obiskkoprint, ponovidoma, ponovikopr, ponovizamejo, ponovigost, ponovikoprint, ponoviint, naziv, kpe, sort, tipprogramskeenote_id, tip, prikoproducentu, strosekodkpred, stroskiostali, krajgostovanja, ustanova, datumgostovanja, transportnistroski, dnevprvzad, drzavagostovanja_id, stpe, zvrst, stpredstav, stokroglihmiz, stpredstavitev, stdelavnic, stdrugidogodki, stprodukcij, caspriprave, casizvedbe, prizorisca, umetvodja, programskotelo, sttujihselektorjev) FROM stdin;
002f0000-55fb-d9b1-174f-c881d5629ab2	000e0000-55fb-d9b1-5cf8-793c31e06505	\N	\N	9000.30	9000.30	9000.30	0.00	3600.12	5299.98	4000.40	1000.40	200.20	200.30	4599.40	\N	0.00	100.20	0	2	2	2	2	2	\N	40	0	0	0	0	0	1	0	0	0	0	0		0.00	\N	002b0000-55fb-d9af-0235-6b9dcc4fb3f3	premiera	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-55fb-d9b1-a37a-417c8d7a3c38	000e0000-55fb-d9b1-e27d-c4e9ec4f7075	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	\N	60	0	0	0	0	0	1	0	0	0	0	0		0.00	\N	002b0000-55fb-d9af-a5d1-e6e1511cce58	premiera	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-55fb-d9b1-2894-418a49f1471c	000e0000-55fb-d9b1-ba3e-4813731f826f	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	\N	60	0	0	0	0	0	1	0	0	0	0	0		0.00	\N	002b0000-55fb-d9af-0235-6b9dcc4fb3f3	premiera	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-55fb-d9b1-f414-a8da46eb8b1a	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-54.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	54.20	5	0	0	3	0	0	\N	22	0	0	0	0	0	0	0	0	0	0	0	Urejanje portala	0.00	10	\N	razno	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-55fb-d9b1-ba85-7d499c51b2a4	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-31.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	31.20	5	0	0	3	0	0	\N	202	0	0	0	0	0	0	0	0	0	0	0	Delavnice otroci	0.00	8	\N	razno	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 2975 (class 0 OID 20003212)
-- Dependencies: 213
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, podrocje, vodjaekipe, naziv, komentar, velikost, pomembna, sort, seplanira, dovoliprekrivanje, maxprekrivanj, tipfunkcije_id) FROM stdin;
000d0000-55fb-d9b1-abb3-5b0309843035	000e0000-55fb-d9b1-e27d-c4e9ec4f7075	000c0000-55fb-d9b1-b5d0-e0a750c31b17	igralec	\N	Tezej	glavna vloga	velika	t	5	t	t	\N	000f0000-55fb-d9af-88a6-ac22774d241e
000d0000-55fb-d9b1-8822-714e854b0792	000e0000-55fb-d9b1-e27d-c4e9ec4f7075	000c0000-55fb-d9b1-ab3a-2d57641dc668	umetnik	\N	Režija		velika	t	8	t	t	\N	000f0000-55fb-d9af-781a-f099d2591e8b
000d0000-55fb-d9b1-0bdd-5e2948c47f80	000e0000-55fb-d9b1-e27d-c4e9ec4f7075	000c0000-55fb-d9b1-f1c2-665233052a61	inspicient	t	Inšpicient			t	8	t	t	\N	000f0000-55fb-d9af-4e7d-c56ba91deae7
000d0000-55fb-d9b1-7cef-cf63b8a861ec	000e0000-55fb-d9b1-e27d-c4e9ec4f7075	000c0000-55fb-d9b1-4cc2-e1abc8496e88	tehnik	t	Tehnični vodja			t	8	t	t	\N	000f0000-55fb-d9af-91b1-0c86325d9ac4
000d0000-55fb-d9b1-91b5-474bedf1eae5	000e0000-55fb-d9b1-e27d-c4e9ec4f7075	000c0000-55fb-d9b1-042d-6ba3f8908e44	tehnik	\N	Razsvetljava			t	3	t	t	\N	000f0000-55fb-d9af-91b1-0c86325d9ac4
000d0000-55fb-d9b1-7739-d903e42ec9f7	000e0000-55fb-d9b1-e27d-c4e9ec4f7075	000c0000-55fb-d9b1-4043-a1428e9cba47	igralec	\N	Helena	glavna vloga	velika	t	5	t	t	\N	000f0000-55fb-d9af-88a6-ac22774d241e
000d0000-55fb-d9b1-4087-5be87ac74c66	000e0000-55fb-d9b1-e27d-c4e9ec4f7075	000c0000-55fb-d9b1-4c77-81717dd4d8c6	igralec	\N	Hipolita	glavna vloga	velika	t	6	t	t	\N	000f0000-55fb-d9af-88a6-ac22774d241e
000d0000-55fb-d9b1-2874-64eab69b95a5	000e0000-55fb-d9b1-e27d-c4e9ec4f7075	000c0000-55fb-d9b1-c93b-550c368b6691	umetnik	\N	Lektoriranje			t	22	t	t	\N	000f0000-55fb-d9af-5ed9-7bd71ecf626b
000d0000-55fb-d9b1-997d-05269e1a72b0	000e0000-55fb-d9b1-e27d-c4e9ec4f7075	000c0000-55fb-d9b1-3177-a1477c8e9553	umetnik	\N	Avtor	Avtor besedila		t	2	t	f	\N	000f0000-55fb-d9af-63f9-fc34d6ea7216
\.


--
-- TOC entry 2955 (class 0 OID 20003026)
-- Dependencies: 193
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta, zamejstvo, kraj) FROM stdin;
\.


--
-- TOC entry 2953 (class 0 OID 20003004)
-- Dependencies: 191
-- Data for Name: kontaktnaoseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kontaktnaoseba (id, popa_id, oseba_id, status, funkcija, opis) FROM stdin;
00260000-55fb-d9b1-dfb3-9915dda341e8	00080000-55fb-d9b0-8844-52f504a2e874	00090000-55fb-d9b0-f675-0fb0ae4cbe89	AK		igralka
\.


--
-- TOC entry 2964 (class 0 OID 20003126)
-- Dependencies: 202
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 3001 (class 0 OID 20003613)
-- Dependencies: 239
-- Data for Name: mapa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa (id, lastnik_id, parent_id, ime, komentar, caskreiranja, casspremembe, javnidostop, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3002 (class 0 OID 20003625)
-- Dependencies: 240
-- Data for Name: mapa_zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa_zapis (mapa_id, zapis_id) FROM stdin;
\.


--
-- TOC entry 3004 (class 0 OID 20003647)
-- Dependencies: 242
-- Data for Name: mapaacl; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapaacl (id, mapa_id, perm_id, dostop, upor, datknj) FROM stdin;
\.


--
-- TOC entry 2932 (class 0 OID 19946838)
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
-- TOC entry 2968 (class 0 OID 20003151)
-- Dependencies: 206
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 2950 (class 0 OID 20002961)
-- Dependencies: 188
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-55fb-d9af-3536-f42778003c2c	popa.stakli	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-55fb-d9af-f308-e4730c04098c	oseba.spol	array	a:2:{s:1:"M";a:1:{s:5:"label";s:6:"Moški";}s:1:"Z";a:1:{s:5:"label";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-55fb-d9af-9e4b-73ff5994d1b8	telefonska.vrsta	array	a:3:{s:7:"mobilna";a:1:{s:5:"label";s:7:"Mobilni";}s:6:"domaca";a:1:{s:5:"label";s:6:"Domač";}s:6:"fiksna";a:1:{s:5:"label";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-55fb-d9af-91f2-7502f4bc2d18	kontaktnaoseba.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status kontaktne osebe
00000000-55fb-d9af-3212-82f14f0c0299	dogodek.status	array	a:7:{s:4:"100s";a:1:{s:5:"label";s:11:"Dolgoročno";}s:4:"200s";a:1:{s:5:"label";s:9:"Planirano";}s:4:"300s";a:1:{s:5:"label";s:8:"Fiksiran";}s:4:"400s";a:1:{s:5:"label";s:17:"Potrjen - interno";}s:4:"500s";a:1:{s:5:"label";s:15:"Potrjen - javno";}s:4:"600s";a:1:{s:5:"label";s:10:"Zaključen";}s:4:"700s";a:1:{s:5:"label";s:7:"Obdelan";}}	f	t	t	\N	Tabela statusa dogodkov
00000000-55fb-d9af-ae0e-f37b5b5221a4	dogodek.razred	array	a:5:{s:4:"100s";a:2:{s:5:"label";s:9:"Predstava";s:4:"type";s:9:"predstava";}s:4:"200s";a:2:{s:5:"label";s:4:"Vaja";s:4:"type";s:4:"vaja";}s:4:"300s";a:2:{s:5:"label";s:10:"Gostovanje";s:4:"type";s:10:"gostovanje";}s:4:"400s";a:2:{s:5:"label";s:16:"Splošni dogodek";s:4:"type";s:8:"splošni";}s:4:"500s";a:2:{s:5:"label";s:10:"Zasedenost";s:4:"type";s:10:"zasedenost";}}	f	t	t	\N	Tabela razredov dogodkov, ki jih aplikacija podpira
00000000-55fb-d9af-842e-dfe8322ce0d4	uprizoritev.faza	array	a:6:{s:20:"predprodukcija-ideja";a:1:{s:5:"label";s:16:"Dolgoročni plan";}s:20:"predprodukcija-poziv";a:1:{s:5:"label";s:29:"Predprodukcija, v fazi poziva";}s:30:"predprodukcija-potrjen_program";a:1:{s:5:"label";s:34:"Predprodukcija, program je potrjen";}s:10:"produkcija";a:1:{s:5:"label";s:10:"Produkcija";}s:14:"postprodukcija";a:1:{s:5:"label";s:14:"Postprodukcija";}s:5:"arhiv";a:1:{s:5:"label";s:10:"Arhivirana";}}	f	t	f	\N	Faza uprizoritve
00000000-55fb-d9af-d398-9c90059c8160	funkcija.podrocje	array	a:4:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}}	f	t	f	\N	Področje funkcije
00000000-55fb-d9af-504d-d299b09fe62a	tipfunkcije.podrocje	array	a:4:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}}	f	t	f	\N	Področje funkcije
00000000-55fb-d9af-b588-b0e9a2920ba0	funkcija.velikost	array	a:4:{s:7:"stataza";a:1:{s:5:"label";s:8:"Stataža";}s:4:"mala";a:1:{s:5:"label";s:21:"Mala vloga / funkcija";}s:7:"srednja";a:1:{s:5:"label";s:24:"Srednja vloga / funkcija";}s:6:"velika";a:1:{s:5:"label";s:23:"Velika vloga / funkcija";}}	f	t	f	\N	Velikost funkcije
00000000-55fb-d9af-adb8-1d1e9456952a	zaposlitev.status	array	a:2:{s:1:"A";a:1:{s:5:"label";s:7:"Aktivna";}s:1:"N";a:1:{s:5:"label";s:9:"Neaktivna";}}	f	t	f	\N	Status zaposlitve
00000000-55fb-d9af-e38c-6b0b957a63d8	produkcijskahisa.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktivna";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktivna";}}	f	t	f	\N	Status produkcijske hiše
00000000-55fb-d9af-0a5f-3f29ff0672f7	strosekuprizoritve.tipstroska	array	a:1:{s:10:"materialni";a:1:{s:5:"label";s:19:"Materialni strošek";}}	f	t	f	\N	Tip stroška
00000000-55fb-d9af-e748-d2b34c961aa8	fsacl.dostop	array	a:4:{s:1:"X";a:1:{s:5:"label";s:12:"Brez dostopa";}s:1:"R";a:1:{s:5:"label";s:11:"Samo branje";}s:2:"RW";a:1:{s:5:"label";s:17:"Branje in pisanje";}s:3:"RWD";a:1:{s:5:"label";s:26:"Branje pisanje in brisanje";}}	f	t	f	\N	ACL Javni dostop
00000000-55fb-d9b0-f19a-509c51315e44	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-55fb-d9b0-5956-372a8aacb1a7	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-55fb-d9b0-92a1-4c210f11a3fe	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-55fb-d9b0-7db1-fcf6ea52016b	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-55fb-d9b0-198f-7f169e31274e	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
00000000-55fb-d9b2-42eb-e456867f386f	application.tenant.maticnopodjetje	string	s:4:"1001";	f	t	f		Šifra matičnega podjetja v Popa in ProdukcijskaHisa
\.


--
-- TOC entry 2944 (class 0 OID 20002875)
-- Dependencies: 182
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-55fb-d9b0-5b92-367c57a31d4b	00000000-55fb-d9b0-f19a-509c51315e44	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-55fb-d9b0-b136-7ca5c571588b	00000000-55fb-d9b0-f19a-509c51315e44	00010000-55fb-d9af-93ee-e0ee08360ffc	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-55fb-d9b0-c65d-ca4b690c727d	00000000-55fb-d9b0-5956-372a8aacb1a7	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 2945 (class 0 OID 20002886)
-- Dependencies: 183
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naslov_id, sifra, naziv, ime, priimek, funkcija, srednjeime, polnoime, psevdonim, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
00090000-55fb-d9b0-147b-462c84aa1287	\N	\N	0001	g.	Janez	Novak	a	Peter	Janez Peter Novak	Jani	jani.novak@xxx.xx	1958-01-06	0601958000000	123456789	M	Jani Janez	Slovenija	Slovenija	Ljubljana
00090000-55fb-d9b0-34d3-b31547c68534	00010000-55fb-d9b0-7601-82dc8b456c15	\N	0002	dr.	Anton	Horvat	b		Anton  Horvat	Tona	anton.horvat@xxx.xx	1968-02-12	1202968111111	234567890	M		Slovenija	Slovenija	Maribor
00090000-55fb-d9b0-cf7c-dbff8c852638	00010000-55fb-d9b0-1bfa-c05aa63b6066	\N	0003		Ivan	Kovačič	c		Ivan  Kovačič	Ivo	ivan.kovacic@xxx.xx	1975-03-26	2603976222222	345678901	M		Slovenija	Slovenija	Celje
00090000-55fb-d9b0-a235-84aa66bd6903	00010000-55fb-d9b0-68d6-48ee6613bbd8	\N	0004	prof.	Jožef	Krajnc	d		Jožef  Krajnc	Joža	jozef.krajnc@xxx.xx	1971-04-30	3004971333333	456789012	M		Slovenija	Slovenija	Kranj
00090000-55fb-d9b0-9ae6-06a45f024161	\N	\N	0005		Marko	Zupančič	e		Marko  Zupančič		marko.zupancic@xxx.xx	1984-05-07	0705984444444	567890123	M		Slovenija	Slovenija	Koper
00090000-55fb-d9b0-72ae-752644267552	\N	\N	0006	ga.	Marija	Kovač	f		Marija  Kovač		marija.kovac@xxx.xx	1962-06-19	1906962444444	678901234	Z		Slovenija	Slovenija	Murska Sobota
00090000-55fb-d9b0-d525-75db46f60d5d	\N	\N	0007	ga.	Ana	Potočnik	g		Ana  Potočnik		ana.potocnik@xxx.xx	1975-07-24	2407975555555	789012345	Z		Slovenija	Slovenija	Novo Mesto
00090000-55fb-d9b0-f460-4cceab9bfa12	\N	\N	0008	ga.	Maja	Mlakar	h		Maja  Mlakar		maja.mlakar@xxx.xx	1986-08-02	0208986666666	890123456	Z		Slovenija	Slovenija	Nova Gorica
00090000-55fb-d9b0-f675-0fb0ae4cbe89	00010000-55fb-d9b0-fd95-662da719b033	\N	0009		Irena	Kos	i		Irena  Kos		irena.kos@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Ptuj
00090000-55fb-d9b0-193f-3770d3561d3c	\N	\N	0010		Mojca	Vidmar	J		Mojca  Vidmar		mojca.vidmar@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Idrija
00090000-55fb-d9b0-05ff-02f668b1ed81	\N	\N	0011		xx	write protected12345	a		xx  write protected12345		xx@xxx.xx	\N	\N	\N	Z		\N	\N	\N
00090000-55fb-d9b0-f05c-59a88ad20cbd	\N	\N	0012		Luka	Golob	luč	a	Luka a Golob		luka.golob@xxx.xx	\N	\N	\N	M		\N	\N	\N
00090000-55fb-d9b0-2495-dedc7aa80311	00010000-55fb-d9b0-4f4d-bde4dd35054f	\N	0013		Tatjana	Božič	tajnica	a	Tatjana a Božič		tatjana.bozic@xxx.xx	\N	\N	\N	Z		\N	\N	\N
\.


--
-- TOC entry 2940 (class 0 OID 20002840)
-- Dependencies: 178
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-55fb-d9af-58a4-a61eff1a57d5	Aaa-read	Aaa (User,Role,Permission) - branje	f
00030000-55fb-d9af-e464-e5be680a75b0	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	f
00030000-55fb-d9af-6642-bf054c995abd	TerminStoritve-vse	TerminStoritve - spreminjanje vseh zapisov	f
00030000-55fb-d9af-7bab-ceff5c25ccbe	Dogodek-readVse	Dogodek - branje vseh, ne glede na status dogodka	f
00030000-55fb-d9af-284e-4fcaafc4b8fa	Oseba-vse	Oseba - vse - za testiranje assert	f
00030000-55fb-d9af-1a4f-3babaa62dea4	ProgramDela-lock	ProgramDela - zaklepanje	f
00030000-55fb-d9af-3a20-5ed4c033a62f	ProgramDela-unlock	ProgramDela - odklepanje	f
00030000-55fb-d9af-6e60-491dcc10842a	Abonma-read	Abonma - branje	f
00030000-55fb-d9af-3ba3-f699f3820857	Abonma-write	Abonma - spreminjanje	f
00030000-55fb-d9af-3eaa-ea0c1565f31e	Alternacija-read	Alternacija - branje	f
00030000-55fb-d9af-738f-d503b03711d8	Alternacija-write	Alternacija - spreminjanje	f
00030000-55fb-d9af-72a0-47a8ed04ba99	Arhivalija-read	Arhivalija - branje	f
00030000-55fb-d9af-05f2-e51109b1f590	Arhivalija-write	Arhivalija - spreminjanje	f
00030000-55fb-d9af-2319-747a2ded4140	AvtorBesedila-read	AvtorBesedila - branje	f
00030000-55fb-d9af-3162-6aa86bae63e2	AvtorBesedila-write	AvtorBesedila - spreminjanje	f
00030000-55fb-d9af-88a2-c7cb1a717802	Besedilo-read	Besedilo - branje	f
00030000-55fb-d9af-43d4-3d90176d0f85	Besedilo-write	Besedilo - spreminjanje	f
00030000-55fb-d9af-cd69-9883c98cc0e8	DogodekIzven-read	DogodekIzven - branje	f
00030000-55fb-d9af-25bb-d767338fd3c8	DogodekIzven-write	DogodekIzven - spreminjanje	f
00030000-55fb-d9af-70b2-98d5479fc23d	Dogodek-read	Dogodek - branje	f
00030000-55fb-d9af-df2f-13ee8d34d827	Dogodek-write	Dogodek - spreminjanje	f
00030000-55fb-d9af-99fc-ff95879fd228	DrugiVir-read	DrugiVir - branje	f
00030000-55fb-d9af-c64c-fff35cc8cef1	DrugiVir-write	DrugiVir - spreminjanje	f
00030000-55fb-d9af-9633-774e586987a0	Drzava-read	Drzava - branje	f
00030000-55fb-d9af-698f-72a07fa23f3b	Drzava-write	Drzava - spreminjanje	f
00030000-55fb-d9af-f79a-1aaf8a839ac7	EnotaPrograma-read	EnotaPrograma - branje	f
00030000-55fb-d9af-66c5-e81f33126ad3	EnotaPrograma-write	EnotaPrograma - spreminjanje	f
00030000-55fb-d9af-338a-a2e35deaeb99	Funkcija-read	Funkcija - branje	f
00030000-55fb-d9af-973a-417128215976	Funkcija-write	Funkcija - spreminjanje	f
00030000-55fb-d9af-e8f3-c82d651d4f33	Gostovanje-read	Gostovanje - branje	f
00030000-55fb-d9af-f948-06350894ae8a	Gostovanje-write	Gostovanje - spreminjanje	f
00030000-55fb-d9af-8cf2-ae3fe09af0a5	Gostujoca-read	Gostujoca - branje	f
00030000-55fb-d9af-08c4-9161e1497862	Gostujoca-write	Gostujoca - spreminjanje	f
00030000-55fb-d9af-ea65-1b415e67746f	KontaktnaOseba-read	KontaktnaOseba - branje	f
00030000-55fb-d9af-de20-f0a105c1896d	KontaktnaOseba-write	KontaktnaOseba - spreminjanje	f
00030000-55fb-d9af-df6f-a95f257c8431	Kupec-read	Kupec - branje	f
00030000-55fb-d9af-1ec7-92901b009f59	Kupec-write	Kupec - spreminjanje	f
00030000-55fb-d9af-6b5d-b7365450283c	NacinPlacina-read	NacinPlacina - branje	f
00030000-55fb-d9af-3ced-5bf1f05a9d00	NacinPlacina-write	NacinPlacina - spreminjanje	f
00030000-55fb-d9af-b686-1def40b628f0	Option-read	Option - branje	f
00030000-55fb-d9af-b843-2af1a78c59c2	Option-write	Option - spreminjanje	f
00030000-55fb-d9af-782f-ceaeb3ee9d36	OptionValue-read	OptionValue - branje	f
00030000-55fb-d9af-0b5d-9f35c5ab2f55	OptionValue-write	OptionValue - spreminjanje	f
00030000-55fb-d9af-3f21-e6cecc7178c6	Oseba-read	Oseba - branje	f
00030000-55fb-d9af-8d79-0d40dd14a81b	Oseba-write	Oseba - spreminjanje	f
00030000-55fb-d9af-bb8c-0b6ea34134e4	PlacilniInstrument-read	PlacilniInstrument - branje	f
00030000-55fb-d9af-464e-7b9e8bc7e54c	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	f
00030000-55fb-d9af-c922-2caa0c6c4f16	PodrocjeSedenja-read	PodrocjeSedenja - branje	f
00030000-55fb-d9af-7b7c-fc99d02a0539	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	f
00030000-55fb-d9af-3bc2-973575a69029	Pogodba-read	Pogodba - branje	f
00030000-55fb-d9af-2a70-37bd7243394f	Pogodba-write	Pogodba - spreminjanje	f
00030000-55fb-d9af-241c-1af8e222fcac	Popa-read	Popa - branje	f
00030000-55fb-d9af-057c-12b3e6c74ee0	Popa-write	Popa - spreminjanje	f
00030000-55fb-d9af-e9e1-771b73a92a4c	Posta-read	Posta - branje	f
00030000-55fb-d9af-b4bc-b9efd461f352	Posta-write	Posta - spreminjanje	f
00030000-55fb-d9af-4748-3678b31c6760	PostavkaCDve-read	PostavkaCDve - branje	f
00030000-55fb-d9af-f854-66b86ea9601a	PostavkaCDve-write	PostavkaCDve - spreminjanje	f
00030000-55fb-d9af-e12b-71c1259033ef	PostavkaRacuna-read	PostavkaRacuna - branje	f
00030000-55fb-d9af-6425-56b63c63c302	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	f
00030000-55fb-d9af-8f52-3ddf3fa55bb2	PostniNaslov-read	PostniNaslov - branje	f
00030000-55fb-d9af-f5ff-ff8164014024	PostniNaslov-write	PostniNaslov - spreminjanje	f
00030000-55fb-d9af-dad7-525ccd38f0c7	Predstava-read	Predstava - branje	f
00030000-55fb-d9af-cd08-3b66d5a81f38	Predstava-write	Predstava - spreminjanje	f
00030000-55fb-d9af-0bf0-c5b6942e76b6	ProdajaPredstave-read	ProdajaPredstave - branje	f
00030000-55fb-d9af-909e-c5a21199c1a3	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	f
00030000-55fb-d9af-e278-f7a1c231d7ee	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	f
00030000-55fb-d9af-b9e2-163d0177af2d	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	f
00030000-55fb-d9af-e3bb-4a09ae9b62fa	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	f
00030000-55fb-d9af-4fb4-815ac99b628f	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	f
00030000-55fb-d9af-b141-757e5cfbceda	ProgramDela-read	ProgramDela - branje	f
00030000-55fb-d9af-88cd-c5240d33486a	ProgramDela-write	ProgramDela - spreminjanje	f
00030000-55fb-d9af-6544-723cdf9462e9	ProgramFestival-read	ProgramFestival - branje	f
00030000-55fb-d9af-e0d8-916939e31d98	ProgramFestival-write	ProgramFestival - spreminjanje	f
00030000-55fb-d9af-e448-8e76a9b6b506	ProgramGostovanje-read	ProgramGostovanje - branje	f
00030000-55fb-d9af-8a2c-503847b9c0c8	ProgramGostovanje-write	ProgramGostovanje - spreminjanje	f
00030000-55fb-d9af-ec59-32a64c01164a	ProgramGostujoca-read	ProgramGostujoca - branje	f
00030000-55fb-d9af-c504-77bc800baaff	ProgramGostujoca-write	ProgramGostujoca - spreminjanje	f
00030000-55fb-d9af-34c2-b6d43bc6e28e	ProgramIzjemni-read	ProgramIzjemni - branje	f
00030000-55fb-d9af-1440-c100e33082a8	ProgramIzjemni-write	ProgramIzjemni - spreminjanje	f
00030000-55fb-d9af-4fce-b751c9a27183	ProgramPonovitevPrejsnjih-read	ProgramPonovitevPrejsnjih - branje	f
00030000-55fb-d9af-fb0f-114132513609	ProgramPonovitevPrejsnjih-write	ProgramPonovitevPrejsnjih - spreminjanje	f
00030000-55fb-d9af-2a1f-733c96ef3414	ProgramPonovitevPremiere-read	ProgramPonovitevPremiere - branje	f
00030000-55fb-d9af-5cf2-7a5fde014fab	ProgramPonovitevPremiere-write	ProgramPonovitevPremiere - spreminjanje	f
00030000-55fb-d9af-e68d-0411d51ff6ed	ProgramPremiera-read	ProgramPremiera - branje	f
00030000-55fb-d9af-65f9-6f41140f17f6	ProgramPremiera-write	ProgramPremiera - spreminjanje	f
00030000-55fb-d9af-a484-de318c07fe1e	ProgramRazno-read	ProgramRazno - branje	f
00030000-55fb-d9af-8cf8-f170b41cb866	ProgramRazno-write	ProgramRazno - spreminjanje	f
00030000-55fb-d9af-9469-7cd80d0dc920	ProgramskaEnotaSklopa-read	ProgramskaEnotaSklopa - branje	f
00030000-55fb-d9af-389e-943736f7e663	ProgramskaEnotaSklopa-write	ProgramskaEnotaSklopa - spreminjanje	f
00030000-55fb-d9af-cbcf-fe84c8eb2e9a	Prostor-read	Prostor - branje	f
00030000-55fb-d9af-992d-f90d26b63bb0	Prostor-write	Prostor - spreminjanje	f
00030000-55fb-d9af-eb35-0c898aaf04ef	Racun-read	Racun - branje	f
00030000-55fb-d9af-ac18-1f2ca41204ad	Racun-write	Racun - spreminjanje	f
00030000-55fb-d9af-6ede-da3ece945e30	RazpisanSedez-read	RazpisanSedez - branje	f
00030000-55fb-d9af-d5da-ca411c3d9988	RazpisanSedez-write	RazpisanSedez - spreminjanje	f
00030000-55fb-d9af-6eb5-f36856cfad37	Rekviziterstvo-read	Rekviziterstvo - branje	f
00030000-55fb-d9af-1587-2eb5188f1686	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	f
00030000-55fb-d9af-d7e2-41ea7875ae33	Rekvizit-read	Rekvizit - branje	f
00030000-55fb-d9af-bb91-4204a2d466d9	Rekvizit-write	Rekvizit - spreminjanje	f
00030000-55fb-d9af-8881-ced141314094	Revizija-read	Revizija - branje	f
00030000-55fb-d9af-aca0-9236c8aecf4a	Revizija-write	Revizija - spreminjanje	f
00030000-55fb-d9af-c511-aec4488447ef	Rezervacija-read	Rezervacija - branje	f
00030000-55fb-d9af-2fbe-e6dededbfd4a	Rezervacija-write	Rezervacija - spreminjanje	f
00030000-55fb-d9af-bd01-e26cbe3e10e0	SedezniRed-read	SedezniRed - branje	f
00030000-55fb-d9af-ba6e-483ef0a95d36	SedezniRed-write	SedezniRed - spreminjanje	f
00030000-55fb-d9af-b861-12b15d2312e5	Sedez-read	Sedez - branje	f
00030000-55fb-d9af-6102-90354df02bbf	Sedez-write	Sedez - spreminjanje	f
00030000-55fb-d9af-4f69-22f9079b0e42	Sezona-read	Sezona - branje	f
00030000-55fb-d9af-fb8b-5015c548b3c7	Sezona-write	Sezona - spreminjanje	f
00030000-55fb-d9af-013c-d23b256ba09e	StevilcenjeKonfig-read	StevilcenjeKonfig - branje	f
00030000-55fb-d9af-936f-dda14ebae43f	StevilcenjeKonfig-write	StevilcenjeKonfig - spreminjanje	f
00030000-55fb-d9af-0765-0b4c1b4c8528	Stevilcenje-read	Stevilcenje - branje	f
00030000-55fb-d9af-1da3-ce0ee3fb4584	Stevilcenje-write	Stevilcenje - spreminjanje	f
00030000-55fb-d9af-8bb9-866326231100	StevilcenjeStanje-read	StevilcenjeStanje - branje	f
00030000-55fb-d9af-f5cc-1fa1e17ddcf6	StevilcenjeStanje-write	StevilcenjeStanje - spreminjanje	f
00030000-55fb-d9af-d780-d781ac9f29c6	StrosekUprizoritve-read	StrosekUprizoritve - branje	f
00030000-55fb-d9af-be9a-e064f5643d81	StrosekUprizoritve-write	StrosekUprizoritve - spreminjanje	f
00030000-55fb-d9af-fac6-b63ccfcb77ae	Telefonska-read	Telefonska - branje	f
00030000-55fb-d9af-b084-c774a23404f2	Telefonska-write	Telefonska - spreminjanje	f
00030000-55fb-d9af-90cd-6985a33b248b	TerminStoritve-read	TerminStoritve - branje	f
00030000-55fb-d9af-3621-f9f2b54b9eb2	TerminStoritve-write	TerminStoritve - spreminjanje	f
00030000-55fb-d9af-0425-32e2523f8056	TipFunkcije-read	TipFunkcije - branje	f
00030000-55fb-d9af-3a30-865719e0b583	TipFunkcije-write	TipFunkcije - spreminjanje	f
00030000-55fb-d9af-3485-902d9e3bc111	TipProgramskeEnote-read	TipProgramskeEnote - branje	f
00030000-55fb-d9af-50a7-549a5edc1d05	TipProgramskeEnote-write	TipProgramskeEnote - spreminjanje	f
00030000-55fb-d9af-6a45-7300d4d229ec	Trr-read	Trr - branje	f
00030000-55fb-d9af-5c8b-2e75a4ba0a65	Trr-write	Trr - spreminjanje	f
00030000-55fb-d9af-bd7b-d8a126fd0148	Uprizoritev-read	Uprizoritev - branje	f
00030000-55fb-d9af-71e5-5246f6b1976f	Uprizoritev-write	Uprizoritev - spreminjanje	f
00030000-55fb-d9af-3696-2e3aabc2ea70	Vaja-read	Vaja - branje	f
00030000-55fb-d9af-b25c-cf36469ad101	Vaja-write	Vaja - spreminjanje	f
00030000-55fb-d9af-0603-9514563a0523	VrstaSedezev-read	VrstaSedezev - branje	f
00030000-55fb-d9af-50d0-246132f82092	VrstaSedezev-write	VrstaSedezev - spreminjanje	f
00030000-55fb-d9af-d6ef-7e062b950606	VrstaStroska-read	VrstaStroska - branje	f
00030000-55fb-d9af-55e2-8341b28b30a2	VrstaStroska-write	VrstaStroska - spreminjanje	f
00030000-55fb-d9af-1ae8-ac4d3582c2dd	Zaposlitev-read	Zaposlitev - branje	f
00030000-55fb-d9af-7b26-53c4c9da7d90	Zaposlitev-write	Zaposlitev - spreminjanje	f
00030000-55fb-d9af-6849-4f10cdac819b	Zasedenost-read	Zasedenost - branje	f
00030000-55fb-d9af-a477-a3990b8bfd1b	Zasedenost-write	Zasedenost - spreminjanje	f
00030000-55fb-d9af-4f68-3603bbe65745	ZvrstSurs-read	ZvrstSurs - branje	f
00030000-55fb-d9af-420b-d5830ff67e0f	ZvrstSurs-write	ZvrstSurs - spreminjanje	f
00030000-55fb-d9af-ee7b-c7dbdf939821	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	f
00030000-55fb-d9af-53da-57794f65b9d9	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	f
00030000-55fb-d9af-e451-16015ca020ba	Mapa-write	Mapa - osnovno dovoljenje za pisanje	f
00030000-55fb-d9af-1eea-f2aa0af45d63	Mapa-read	Mapa - osnovno dovoljenje za branje	f
00030000-55fb-d9af-57d3-deddd6683c84	MapaAcl-write	MapaAcl - dovoljenje za dostop pisanje ACL-jev mape	f
00030000-55fb-d9af-cd87-e0ff3235fc5b	MapaAcl-read	MapaAcl - dovoljenje za dostop branje ACL-jev mape	f
00030000-55fb-d9af-af4e-02c99d6965d6	Zapis-write	Zapis - dovoljenje za pisanje zapisov	f
00030000-55fb-d9af-1910-8bd60639f321	Zapis-read	Zapis - dovoljenje za pisanje zapisov	f
00030000-55fb-d9af-1780-cd4b948e228d	ZapisLastnik-write	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	f
00030000-55fb-d9af-264e-6c96f1ece22a	ZapisLastnik-read	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	f
00030000-55fb-d9af-bc21-156002067e9a	VrstaZapisa-write	Šifrant vrst zapisa - spreminjanje	f
00030000-55fb-d9af-9325-046307837a7c	VrstaZapisa-read	Šifrant vrst zapisa - branje	f
00030000-55fb-d9af-45fa-60952a6d83df	Datoteka-write	Datoteka - spreminjanje	f
00030000-55fb-d9af-f942-b257de9032b0	Datoteka-read	Datoteke - branje	f
\.


--
-- TOC entry 2942 (class 0 OID 20002859)
-- Dependencies: 180
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-55fb-d9af-b91c-759784d8e99b	00030000-55fb-d9af-e464-e5be680a75b0
00020000-55fb-d9af-a062-a419ebdb9c2e	00030000-55fb-d9af-9633-774e586987a0
00020000-55fb-d9af-6bf2-53e10a405fac	00030000-55fb-d9af-6e60-491dcc10842a
00020000-55fb-d9af-6bf2-53e10a405fac	00030000-55fb-d9af-3ba3-f699f3820857
00020000-55fb-d9af-6bf2-53e10a405fac	00030000-55fb-d9af-3eaa-ea0c1565f31e
00020000-55fb-d9af-6bf2-53e10a405fac	00030000-55fb-d9af-738f-d503b03711d8
00020000-55fb-d9af-6bf2-53e10a405fac	00030000-55fb-d9af-72a0-47a8ed04ba99
00020000-55fb-d9af-6bf2-53e10a405fac	00030000-55fb-d9af-70b2-98d5479fc23d
00020000-55fb-d9af-6bf2-53e10a405fac	00030000-55fb-d9af-7bab-ceff5c25ccbe
00020000-55fb-d9af-6bf2-53e10a405fac	00030000-55fb-d9af-df2f-13ee8d34d827
00020000-55fb-d9af-6bf2-53e10a405fac	00030000-55fb-d9af-9633-774e586987a0
00020000-55fb-d9af-6bf2-53e10a405fac	00030000-55fb-d9af-698f-72a07fa23f3b
00020000-55fb-d9af-6bf2-53e10a405fac	00030000-55fb-d9af-338a-a2e35deaeb99
00020000-55fb-d9af-6bf2-53e10a405fac	00030000-55fb-d9af-973a-417128215976
00020000-55fb-d9af-6bf2-53e10a405fac	00030000-55fb-d9af-e8f3-c82d651d4f33
00020000-55fb-d9af-6bf2-53e10a405fac	00030000-55fb-d9af-f948-06350894ae8a
00020000-55fb-d9af-6bf2-53e10a405fac	00030000-55fb-d9af-8cf2-ae3fe09af0a5
00020000-55fb-d9af-6bf2-53e10a405fac	00030000-55fb-d9af-08c4-9161e1497862
00020000-55fb-d9af-6bf2-53e10a405fac	00030000-55fb-d9af-ea65-1b415e67746f
00020000-55fb-d9af-6bf2-53e10a405fac	00030000-55fb-d9af-de20-f0a105c1896d
00020000-55fb-d9af-6bf2-53e10a405fac	00030000-55fb-d9af-b686-1def40b628f0
00020000-55fb-d9af-6bf2-53e10a405fac	00030000-55fb-d9af-782f-ceaeb3ee9d36
00020000-55fb-d9af-6bf2-53e10a405fac	00030000-55fb-d9af-3f21-e6cecc7178c6
00020000-55fb-d9af-6bf2-53e10a405fac	00030000-55fb-d9af-8d79-0d40dd14a81b
00020000-55fb-d9af-6bf2-53e10a405fac	00030000-55fb-d9af-241c-1af8e222fcac
00020000-55fb-d9af-6bf2-53e10a405fac	00030000-55fb-d9af-057c-12b3e6c74ee0
00020000-55fb-d9af-6bf2-53e10a405fac	00030000-55fb-d9af-e9e1-771b73a92a4c
00020000-55fb-d9af-6bf2-53e10a405fac	00030000-55fb-d9af-b4bc-b9efd461f352
00020000-55fb-d9af-6bf2-53e10a405fac	00030000-55fb-d9af-8f52-3ddf3fa55bb2
00020000-55fb-d9af-6bf2-53e10a405fac	00030000-55fb-d9af-f5ff-ff8164014024
00020000-55fb-d9af-6bf2-53e10a405fac	00030000-55fb-d9af-dad7-525ccd38f0c7
00020000-55fb-d9af-6bf2-53e10a405fac	00030000-55fb-d9af-cd08-3b66d5a81f38
00020000-55fb-d9af-6bf2-53e10a405fac	00030000-55fb-d9af-e3bb-4a09ae9b62fa
00020000-55fb-d9af-6bf2-53e10a405fac	00030000-55fb-d9af-4fb4-815ac99b628f
00020000-55fb-d9af-6bf2-53e10a405fac	00030000-55fb-d9af-cbcf-fe84c8eb2e9a
00020000-55fb-d9af-6bf2-53e10a405fac	00030000-55fb-d9af-992d-f90d26b63bb0
00020000-55fb-d9af-6bf2-53e10a405fac	00030000-55fb-d9af-6eb5-f36856cfad37
00020000-55fb-d9af-6bf2-53e10a405fac	00030000-55fb-d9af-1587-2eb5188f1686
00020000-55fb-d9af-6bf2-53e10a405fac	00030000-55fb-d9af-d7e2-41ea7875ae33
00020000-55fb-d9af-6bf2-53e10a405fac	00030000-55fb-d9af-bb91-4204a2d466d9
00020000-55fb-d9af-6bf2-53e10a405fac	00030000-55fb-d9af-4f69-22f9079b0e42
00020000-55fb-d9af-6bf2-53e10a405fac	00030000-55fb-d9af-fb8b-5015c548b3c7
00020000-55fb-d9af-6bf2-53e10a405fac	00030000-55fb-d9af-0425-32e2523f8056
00020000-55fb-d9af-6bf2-53e10a405fac	00030000-55fb-d9af-bd7b-d8a126fd0148
00020000-55fb-d9af-6bf2-53e10a405fac	00030000-55fb-d9af-71e5-5246f6b1976f
00020000-55fb-d9af-6bf2-53e10a405fac	00030000-55fb-d9af-3696-2e3aabc2ea70
00020000-55fb-d9af-6bf2-53e10a405fac	00030000-55fb-d9af-b25c-cf36469ad101
00020000-55fb-d9af-6bf2-53e10a405fac	00030000-55fb-d9af-6849-4f10cdac819b
00020000-55fb-d9af-6bf2-53e10a405fac	00030000-55fb-d9af-a477-a3990b8bfd1b
00020000-55fb-d9af-6bf2-53e10a405fac	00030000-55fb-d9af-4f68-3603bbe65745
00020000-55fb-d9af-6bf2-53e10a405fac	00030000-55fb-d9af-ee7b-c7dbdf939821
00020000-55fb-d9af-b0af-6d41cedd18d5	00030000-55fb-d9af-6e60-491dcc10842a
00020000-55fb-d9af-b0af-6d41cedd18d5	00030000-55fb-d9af-72a0-47a8ed04ba99
00020000-55fb-d9af-b0af-6d41cedd18d5	00030000-55fb-d9af-70b2-98d5479fc23d
00020000-55fb-d9af-b0af-6d41cedd18d5	00030000-55fb-d9af-9633-774e586987a0
00020000-55fb-d9af-b0af-6d41cedd18d5	00030000-55fb-d9af-e8f3-c82d651d4f33
00020000-55fb-d9af-b0af-6d41cedd18d5	00030000-55fb-d9af-8cf2-ae3fe09af0a5
00020000-55fb-d9af-b0af-6d41cedd18d5	00030000-55fb-d9af-ea65-1b415e67746f
00020000-55fb-d9af-b0af-6d41cedd18d5	00030000-55fb-d9af-de20-f0a105c1896d
00020000-55fb-d9af-b0af-6d41cedd18d5	00030000-55fb-d9af-b686-1def40b628f0
00020000-55fb-d9af-b0af-6d41cedd18d5	00030000-55fb-d9af-782f-ceaeb3ee9d36
00020000-55fb-d9af-b0af-6d41cedd18d5	00030000-55fb-d9af-3f21-e6cecc7178c6
00020000-55fb-d9af-b0af-6d41cedd18d5	00030000-55fb-d9af-8d79-0d40dd14a81b
00020000-55fb-d9af-b0af-6d41cedd18d5	00030000-55fb-d9af-241c-1af8e222fcac
00020000-55fb-d9af-b0af-6d41cedd18d5	00030000-55fb-d9af-e9e1-771b73a92a4c
00020000-55fb-d9af-b0af-6d41cedd18d5	00030000-55fb-d9af-8f52-3ddf3fa55bb2
00020000-55fb-d9af-b0af-6d41cedd18d5	00030000-55fb-d9af-f5ff-ff8164014024
00020000-55fb-d9af-b0af-6d41cedd18d5	00030000-55fb-d9af-dad7-525ccd38f0c7
00020000-55fb-d9af-b0af-6d41cedd18d5	00030000-55fb-d9af-cbcf-fe84c8eb2e9a
00020000-55fb-d9af-b0af-6d41cedd18d5	00030000-55fb-d9af-6eb5-f36856cfad37
00020000-55fb-d9af-b0af-6d41cedd18d5	00030000-55fb-d9af-d7e2-41ea7875ae33
00020000-55fb-d9af-b0af-6d41cedd18d5	00030000-55fb-d9af-4f69-22f9079b0e42
00020000-55fb-d9af-b0af-6d41cedd18d5	00030000-55fb-d9af-fac6-b63ccfcb77ae
00020000-55fb-d9af-b0af-6d41cedd18d5	00030000-55fb-d9af-b084-c774a23404f2
00020000-55fb-d9af-b0af-6d41cedd18d5	00030000-55fb-d9af-6a45-7300d4d229ec
00020000-55fb-d9af-b0af-6d41cedd18d5	00030000-55fb-d9af-5c8b-2e75a4ba0a65
00020000-55fb-d9af-b0af-6d41cedd18d5	00030000-55fb-d9af-1ae8-ac4d3582c2dd
00020000-55fb-d9af-b0af-6d41cedd18d5	00030000-55fb-d9af-7b26-53c4c9da7d90
00020000-55fb-d9af-b0af-6d41cedd18d5	00030000-55fb-d9af-4f68-3603bbe65745
00020000-55fb-d9af-b0af-6d41cedd18d5	00030000-55fb-d9af-ee7b-c7dbdf939821
00020000-55fb-d9af-f1dc-a79e8f96a1a9	00030000-55fb-d9af-6e60-491dcc10842a
00020000-55fb-d9af-f1dc-a79e8f96a1a9	00030000-55fb-d9af-3eaa-ea0c1565f31e
00020000-55fb-d9af-f1dc-a79e8f96a1a9	00030000-55fb-d9af-72a0-47a8ed04ba99
00020000-55fb-d9af-f1dc-a79e8f96a1a9	00030000-55fb-d9af-05f2-e51109b1f590
00020000-55fb-d9af-f1dc-a79e8f96a1a9	00030000-55fb-d9af-88a2-c7cb1a717802
00020000-55fb-d9af-f1dc-a79e8f96a1a9	00030000-55fb-d9af-cd69-9883c98cc0e8
00020000-55fb-d9af-f1dc-a79e8f96a1a9	00030000-55fb-d9af-70b2-98d5479fc23d
00020000-55fb-d9af-f1dc-a79e8f96a1a9	00030000-55fb-d9af-9633-774e586987a0
00020000-55fb-d9af-f1dc-a79e8f96a1a9	00030000-55fb-d9af-338a-a2e35deaeb99
00020000-55fb-d9af-f1dc-a79e8f96a1a9	00030000-55fb-d9af-e8f3-c82d651d4f33
00020000-55fb-d9af-f1dc-a79e8f96a1a9	00030000-55fb-d9af-8cf2-ae3fe09af0a5
00020000-55fb-d9af-f1dc-a79e8f96a1a9	00030000-55fb-d9af-ea65-1b415e67746f
00020000-55fb-d9af-f1dc-a79e8f96a1a9	00030000-55fb-d9af-b686-1def40b628f0
00020000-55fb-d9af-f1dc-a79e8f96a1a9	00030000-55fb-d9af-782f-ceaeb3ee9d36
00020000-55fb-d9af-f1dc-a79e8f96a1a9	00030000-55fb-d9af-3f21-e6cecc7178c6
00020000-55fb-d9af-f1dc-a79e8f96a1a9	00030000-55fb-d9af-241c-1af8e222fcac
00020000-55fb-d9af-f1dc-a79e8f96a1a9	00030000-55fb-d9af-e9e1-771b73a92a4c
00020000-55fb-d9af-f1dc-a79e8f96a1a9	00030000-55fb-d9af-dad7-525ccd38f0c7
00020000-55fb-d9af-f1dc-a79e8f96a1a9	00030000-55fb-d9af-e3bb-4a09ae9b62fa
00020000-55fb-d9af-f1dc-a79e8f96a1a9	00030000-55fb-d9af-cbcf-fe84c8eb2e9a
00020000-55fb-d9af-f1dc-a79e8f96a1a9	00030000-55fb-d9af-6eb5-f36856cfad37
00020000-55fb-d9af-f1dc-a79e8f96a1a9	00030000-55fb-d9af-d7e2-41ea7875ae33
00020000-55fb-d9af-f1dc-a79e8f96a1a9	00030000-55fb-d9af-4f69-22f9079b0e42
00020000-55fb-d9af-f1dc-a79e8f96a1a9	00030000-55fb-d9af-0425-32e2523f8056
00020000-55fb-d9af-f1dc-a79e8f96a1a9	00030000-55fb-d9af-3696-2e3aabc2ea70
00020000-55fb-d9af-f1dc-a79e8f96a1a9	00030000-55fb-d9af-6849-4f10cdac819b
00020000-55fb-d9af-f1dc-a79e8f96a1a9	00030000-55fb-d9af-4f68-3603bbe65745
00020000-55fb-d9af-f1dc-a79e8f96a1a9	00030000-55fb-d9af-ee7b-c7dbdf939821
00020000-55fb-d9af-3c26-577a749fd6ac	00030000-55fb-d9af-6e60-491dcc10842a
00020000-55fb-d9af-3c26-577a749fd6ac	00030000-55fb-d9af-3ba3-f699f3820857
00020000-55fb-d9af-3c26-577a749fd6ac	00030000-55fb-d9af-738f-d503b03711d8
00020000-55fb-d9af-3c26-577a749fd6ac	00030000-55fb-d9af-72a0-47a8ed04ba99
00020000-55fb-d9af-3c26-577a749fd6ac	00030000-55fb-d9af-70b2-98d5479fc23d
00020000-55fb-d9af-3c26-577a749fd6ac	00030000-55fb-d9af-9633-774e586987a0
00020000-55fb-d9af-3c26-577a749fd6ac	00030000-55fb-d9af-e8f3-c82d651d4f33
00020000-55fb-d9af-3c26-577a749fd6ac	00030000-55fb-d9af-8cf2-ae3fe09af0a5
00020000-55fb-d9af-3c26-577a749fd6ac	00030000-55fb-d9af-b686-1def40b628f0
00020000-55fb-d9af-3c26-577a749fd6ac	00030000-55fb-d9af-782f-ceaeb3ee9d36
00020000-55fb-d9af-3c26-577a749fd6ac	00030000-55fb-d9af-241c-1af8e222fcac
00020000-55fb-d9af-3c26-577a749fd6ac	00030000-55fb-d9af-e9e1-771b73a92a4c
00020000-55fb-d9af-3c26-577a749fd6ac	00030000-55fb-d9af-dad7-525ccd38f0c7
00020000-55fb-d9af-3c26-577a749fd6ac	00030000-55fb-d9af-cbcf-fe84c8eb2e9a
00020000-55fb-d9af-3c26-577a749fd6ac	00030000-55fb-d9af-6eb5-f36856cfad37
00020000-55fb-d9af-3c26-577a749fd6ac	00030000-55fb-d9af-d7e2-41ea7875ae33
00020000-55fb-d9af-3c26-577a749fd6ac	00030000-55fb-d9af-4f69-22f9079b0e42
00020000-55fb-d9af-3c26-577a749fd6ac	00030000-55fb-d9af-0425-32e2523f8056
00020000-55fb-d9af-3c26-577a749fd6ac	00030000-55fb-d9af-4f68-3603bbe65745
00020000-55fb-d9af-3c26-577a749fd6ac	00030000-55fb-d9af-ee7b-c7dbdf939821
00020000-55fb-d9af-ceab-e39a6c94d074	00030000-55fb-d9af-6e60-491dcc10842a
00020000-55fb-d9af-ceab-e39a6c94d074	00030000-55fb-d9af-72a0-47a8ed04ba99
00020000-55fb-d9af-ceab-e39a6c94d074	00030000-55fb-d9af-70b2-98d5479fc23d
00020000-55fb-d9af-ceab-e39a6c94d074	00030000-55fb-d9af-9633-774e586987a0
00020000-55fb-d9af-ceab-e39a6c94d074	00030000-55fb-d9af-e8f3-c82d651d4f33
00020000-55fb-d9af-ceab-e39a6c94d074	00030000-55fb-d9af-8cf2-ae3fe09af0a5
00020000-55fb-d9af-ceab-e39a6c94d074	00030000-55fb-d9af-b686-1def40b628f0
00020000-55fb-d9af-ceab-e39a6c94d074	00030000-55fb-d9af-782f-ceaeb3ee9d36
00020000-55fb-d9af-ceab-e39a6c94d074	00030000-55fb-d9af-241c-1af8e222fcac
00020000-55fb-d9af-ceab-e39a6c94d074	00030000-55fb-d9af-e9e1-771b73a92a4c
00020000-55fb-d9af-ceab-e39a6c94d074	00030000-55fb-d9af-dad7-525ccd38f0c7
00020000-55fb-d9af-ceab-e39a6c94d074	00030000-55fb-d9af-cbcf-fe84c8eb2e9a
00020000-55fb-d9af-ceab-e39a6c94d074	00030000-55fb-d9af-6eb5-f36856cfad37
00020000-55fb-d9af-ceab-e39a6c94d074	00030000-55fb-d9af-d7e2-41ea7875ae33
00020000-55fb-d9af-ceab-e39a6c94d074	00030000-55fb-d9af-4f69-22f9079b0e42
00020000-55fb-d9af-ceab-e39a6c94d074	00030000-55fb-d9af-90cd-6985a33b248b
00020000-55fb-d9af-ceab-e39a6c94d074	00030000-55fb-d9af-6642-bf054c995abd
00020000-55fb-d9af-ceab-e39a6c94d074	00030000-55fb-d9af-0425-32e2523f8056
00020000-55fb-d9af-ceab-e39a6c94d074	00030000-55fb-d9af-4f68-3603bbe65745
00020000-55fb-d9af-ceab-e39a6c94d074	00030000-55fb-d9af-ee7b-c7dbdf939821
00020000-55fb-d9b0-4c79-66d876b6d9da	00030000-55fb-d9af-58a4-a61eff1a57d5
00020000-55fb-d9b0-4c79-66d876b6d9da	00030000-55fb-d9af-e464-e5be680a75b0
00020000-55fb-d9b0-4c79-66d876b6d9da	00030000-55fb-d9af-6642-bf054c995abd
00020000-55fb-d9b0-4c79-66d876b6d9da	00030000-55fb-d9af-7bab-ceff5c25ccbe
00020000-55fb-d9b0-4c79-66d876b6d9da	00030000-55fb-d9af-284e-4fcaafc4b8fa
00020000-55fb-d9b0-4c79-66d876b6d9da	00030000-55fb-d9af-1a4f-3babaa62dea4
00020000-55fb-d9b0-4c79-66d876b6d9da	00030000-55fb-d9af-3a20-5ed4c033a62f
00020000-55fb-d9b0-4c79-66d876b6d9da	00030000-55fb-d9af-6e60-491dcc10842a
00020000-55fb-d9b0-4c79-66d876b6d9da	00030000-55fb-d9af-3ba3-f699f3820857
00020000-55fb-d9b0-4c79-66d876b6d9da	00030000-55fb-d9af-3eaa-ea0c1565f31e
00020000-55fb-d9b0-4c79-66d876b6d9da	00030000-55fb-d9af-738f-d503b03711d8
00020000-55fb-d9b0-4c79-66d876b6d9da	00030000-55fb-d9af-72a0-47a8ed04ba99
00020000-55fb-d9b0-4c79-66d876b6d9da	00030000-55fb-d9af-05f2-e51109b1f590
00020000-55fb-d9b0-4c79-66d876b6d9da	00030000-55fb-d9af-88a2-c7cb1a717802
00020000-55fb-d9b0-4c79-66d876b6d9da	00030000-55fb-d9af-43d4-3d90176d0f85
00020000-55fb-d9b0-4c79-66d876b6d9da	00030000-55fb-d9af-cd69-9883c98cc0e8
00020000-55fb-d9b0-4c79-66d876b6d9da	00030000-55fb-d9af-25bb-d767338fd3c8
00020000-55fb-d9b0-4c79-66d876b6d9da	00030000-55fb-d9af-70b2-98d5479fc23d
00020000-55fb-d9b0-4c79-66d876b6d9da	00030000-55fb-d9af-df2f-13ee8d34d827
00020000-55fb-d9b0-4c79-66d876b6d9da	00030000-55fb-d9af-9633-774e586987a0
00020000-55fb-d9b0-4c79-66d876b6d9da	00030000-55fb-d9af-698f-72a07fa23f3b
00020000-55fb-d9b0-4c79-66d876b6d9da	00030000-55fb-d9af-99fc-ff95879fd228
00020000-55fb-d9b0-4c79-66d876b6d9da	00030000-55fb-d9af-c64c-fff35cc8cef1
00020000-55fb-d9b0-4c79-66d876b6d9da	00030000-55fb-d9af-f79a-1aaf8a839ac7
00020000-55fb-d9b0-4c79-66d876b6d9da	00030000-55fb-d9af-66c5-e81f33126ad3
00020000-55fb-d9b0-4c79-66d876b6d9da	00030000-55fb-d9af-338a-a2e35deaeb99
00020000-55fb-d9b0-4c79-66d876b6d9da	00030000-55fb-d9af-973a-417128215976
00020000-55fb-d9b0-4c79-66d876b6d9da	00030000-55fb-d9af-e8f3-c82d651d4f33
00020000-55fb-d9b0-4c79-66d876b6d9da	00030000-55fb-d9af-f948-06350894ae8a
00020000-55fb-d9b0-4c79-66d876b6d9da	00030000-55fb-d9af-8cf2-ae3fe09af0a5
00020000-55fb-d9b0-4c79-66d876b6d9da	00030000-55fb-d9af-08c4-9161e1497862
00020000-55fb-d9b0-4c79-66d876b6d9da	00030000-55fb-d9af-ea65-1b415e67746f
00020000-55fb-d9b0-4c79-66d876b6d9da	00030000-55fb-d9af-de20-f0a105c1896d
00020000-55fb-d9b0-4c79-66d876b6d9da	00030000-55fb-d9af-df6f-a95f257c8431
00020000-55fb-d9b0-4c79-66d876b6d9da	00030000-55fb-d9af-1ec7-92901b009f59
00020000-55fb-d9b0-4c79-66d876b6d9da	00030000-55fb-d9af-6b5d-b7365450283c
00020000-55fb-d9b0-4c79-66d876b6d9da	00030000-55fb-d9af-3ced-5bf1f05a9d00
00020000-55fb-d9b0-4c79-66d876b6d9da	00030000-55fb-d9af-b686-1def40b628f0
00020000-55fb-d9b0-4c79-66d876b6d9da	00030000-55fb-d9af-b843-2af1a78c59c2
00020000-55fb-d9b0-4c79-66d876b6d9da	00030000-55fb-d9af-782f-ceaeb3ee9d36
00020000-55fb-d9b0-4c79-66d876b6d9da	00030000-55fb-d9af-0b5d-9f35c5ab2f55
00020000-55fb-d9b0-4c79-66d876b6d9da	00030000-55fb-d9af-3f21-e6cecc7178c6
00020000-55fb-d9b0-4c79-66d876b6d9da	00030000-55fb-d9af-8d79-0d40dd14a81b
00020000-55fb-d9b0-4c79-66d876b6d9da	00030000-55fb-d9af-bb8c-0b6ea34134e4
00020000-55fb-d9b0-4c79-66d876b6d9da	00030000-55fb-d9af-464e-7b9e8bc7e54c
00020000-55fb-d9b0-4c79-66d876b6d9da	00030000-55fb-d9af-c922-2caa0c6c4f16
00020000-55fb-d9b0-4c79-66d876b6d9da	00030000-55fb-d9af-7b7c-fc99d02a0539
00020000-55fb-d9b0-4c79-66d876b6d9da	00030000-55fb-d9af-3bc2-973575a69029
00020000-55fb-d9b0-4c79-66d876b6d9da	00030000-55fb-d9af-2a70-37bd7243394f
00020000-55fb-d9b0-4c79-66d876b6d9da	00030000-55fb-d9af-241c-1af8e222fcac
00020000-55fb-d9b0-4c79-66d876b6d9da	00030000-55fb-d9af-057c-12b3e6c74ee0
00020000-55fb-d9b0-4c79-66d876b6d9da	00030000-55fb-d9af-e9e1-771b73a92a4c
00020000-55fb-d9b0-4c79-66d876b6d9da	00030000-55fb-d9af-b4bc-b9efd461f352
00020000-55fb-d9b0-4c79-66d876b6d9da	00030000-55fb-d9af-4748-3678b31c6760
00020000-55fb-d9b0-4c79-66d876b6d9da	00030000-55fb-d9af-f854-66b86ea9601a
00020000-55fb-d9b0-4c79-66d876b6d9da	00030000-55fb-d9af-e12b-71c1259033ef
00020000-55fb-d9b0-4c79-66d876b6d9da	00030000-55fb-d9af-6425-56b63c63c302
00020000-55fb-d9b0-4c79-66d876b6d9da	00030000-55fb-d9af-8f52-3ddf3fa55bb2
00020000-55fb-d9b0-4c79-66d876b6d9da	00030000-55fb-d9af-f5ff-ff8164014024
00020000-55fb-d9b0-4c79-66d876b6d9da	00030000-55fb-d9af-dad7-525ccd38f0c7
00020000-55fb-d9b0-4c79-66d876b6d9da	00030000-55fb-d9af-cd08-3b66d5a81f38
00020000-55fb-d9b0-4c79-66d876b6d9da	00030000-55fb-d9af-0bf0-c5b6942e76b6
00020000-55fb-d9b0-4c79-66d876b6d9da	00030000-55fb-d9af-909e-c5a21199c1a3
00020000-55fb-d9b0-4c79-66d876b6d9da	00030000-55fb-d9af-e278-f7a1c231d7ee
00020000-55fb-d9b0-4c79-66d876b6d9da	00030000-55fb-d9af-b9e2-163d0177af2d
00020000-55fb-d9b0-4c79-66d876b6d9da	00030000-55fb-d9af-e3bb-4a09ae9b62fa
00020000-55fb-d9b0-4c79-66d876b6d9da	00030000-55fb-d9af-4fb4-815ac99b628f
00020000-55fb-d9b0-4c79-66d876b6d9da	00030000-55fb-d9af-b141-757e5cfbceda
00020000-55fb-d9b0-4c79-66d876b6d9da	00030000-55fb-d9af-88cd-c5240d33486a
00020000-55fb-d9b0-4c79-66d876b6d9da	00030000-55fb-d9af-6544-723cdf9462e9
00020000-55fb-d9b0-4c79-66d876b6d9da	00030000-55fb-d9af-e0d8-916939e31d98
00020000-55fb-d9b0-4c79-66d876b6d9da	00030000-55fb-d9af-e448-8e76a9b6b506
00020000-55fb-d9b0-4c79-66d876b6d9da	00030000-55fb-d9af-8a2c-503847b9c0c8
00020000-55fb-d9b0-4c79-66d876b6d9da	00030000-55fb-d9af-ec59-32a64c01164a
00020000-55fb-d9b0-4c79-66d876b6d9da	00030000-55fb-d9af-c504-77bc800baaff
00020000-55fb-d9b0-4c79-66d876b6d9da	00030000-55fb-d9af-34c2-b6d43bc6e28e
00020000-55fb-d9b0-4c79-66d876b6d9da	00030000-55fb-d9af-1440-c100e33082a8
00020000-55fb-d9b0-4c79-66d876b6d9da	00030000-55fb-d9af-4fce-b751c9a27183
00020000-55fb-d9b0-4c79-66d876b6d9da	00030000-55fb-d9af-fb0f-114132513609
00020000-55fb-d9b0-4c79-66d876b6d9da	00030000-55fb-d9af-2a1f-733c96ef3414
00020000-55fb-d9b0-4c79-66d876b6d9da	00030000-55fb-d9af-5cf2-7a5fde014fab
00020000-55fb-d9b0-4c79-66d876b6d9da	00030000-55fb-d9af-e68d-0411d51ff6ed
00020000-55fb-d9b0-4c79-66d876b6d9da	00030000-55fb-d9af-65f9-6f41140f17f6
00020000-55fb-d9b0-4c79-66d876b6d9da	00030000-55fb-d9af-a484-de318c07fe1e
00020000-55fb-d9b0-4c79-66d876b6d9da	00030000-55fb-d9af-8cf8-f170b41cb866
00020000-55fb-d9b0-4c79-66d876b6d9da	00030000-55fb-d9af-9469-7cd80d0dc920
00020000-55fb-d9b0-4c79-66d876b6d9da	00030000-55fb-d9af-389e-943736f7e663
00020000-55fb-d9b0-4c79-66d876b6d9da	00030000-55fb-d9af-cbcf-fe84c8eb2e9a
00020000-55fb-d9b0-4c79-66d876b6d9da	00030000-55fb-d9af-992d-f90d26b63bb0
00020000-55fb-d9b0-4c79-66d876b6d9da	00030000-55fb-d9af-eb35-0c898aaf04ef
00020000-55fb-d9b0-4c79-66d876b6d9da	00030000-55fb-d9af-ac18-1f2ca41204ad
00020000-55fb-d9b0-4c79-66d876b6d9da	00030000-55fb-d9af-6ede-da3ece945e30
00020000-55fb-d9b0-4c79-66d876b6d9da	00030000-55fb-d9af-d5da-ca411c3d9988
00020000-55fb-d9b0-4c79-66d876b6d9da	00030000-55fb-d9af-6eb5-f36856cfad37
00020000-55fb-d9b0-4c79-66d876b6d9da	00030000-55fb-d9af-1587-2eb5188f1686
00020000-55fb-d9b0-4c79-66d876b6d9da	00030000-55fb-d9af-d7e2-41ea7875ae33
00020000-55fb-d9b0-4c79-66d876b6d9da	00030000-55fb-d9af-bb91-4204a2d466d9
00020000-55fb-d9b0-4c79-66d876b6d9da	00030000-55fb-d9af-8881-ced141314094
00020000-55fb-d9b0-4c79-66d876b6d9da	00030000-55fb-d9af-aca0-9236c8aecf4a
00020000-55fb-d9b0-4c79-66d876b6d9da	00030000-55fb-d9af-c511-aec4488447ef
00020000-55fb-d9b0-4c79-66d876b6d9da	00030000-55fb-d9af-2fbe-e6dededbfd4a
00020000-55fb-d9b0-4c79-66d876b6d9da	00030000-55fb-d9af-bd01-e26cbe3e10e0
00020000-55fb-d9b0-4c79-66d876b6d9da	00030000-55fb-d9af-ba6e-483ef0a95d36
00020000-55fb-d9b0-4c79-66d876b6d9da	00030000-55fb-d9af-b861-12b15d2312e5
00020000-55fb-d9b0-4c79-66d876b6d9da	00030000-55fb-d9af-6102-90354df02bbf
00020000-55fb-d9b0-4c79-66d876b6d9da	00030000-55fb-d9af-4f69-22f9079b0e42
00020000-55fb-d9b0-4c79-66d876b6d9da	00030000-55fb-d9af-fb8b-5015c548b3c7
00020000-55fb-d9b0-4c79-66d876b6d9da	00030000-55fb-d9af-013c-d23b256ba09e
00020000-55fb-d9b0-4c79-66d876b6d9da	00030000-55fb-d9af-936f-dda14ebae43f
00020000-55fb-d9b0-4c79-66d876b6d9da	00030000-55fb-d9af-0765-0b4c1b4c8528
00020000-55fb-d9b0-4c79-66d876b6d9da	00030000-55fb-d9af-1da3-ce0ee3fb4584
00020000-55fb-d9b0-4c79-66d876b6d9da	00030000-55fb-d9af-8bb9-866326231100
00020000-55fb-d9b0-4c79-66d876b6d9da	00030000-55fb-d9af-f5cc-1fa1e17ddcf6
00020000-55fb-d9b0-4c79-66d876b6d9da	00030000-55fb-d9af-d780-d781ac9f29c6
00020000-55fb-d9b0-4c79-66d876b6d9da	00030000-55fb-d9af-be9a-e064f5643d81
00020000-55fb-d9b0-4c79-66d876b6d9da	00030000-55fb-d9af-fac6-b63ccfcb77ae
00020000-55fb-d9b0-4c79-66d876b6d9da	00030000-55fb-d9af-b084-c774a23404f2
00020000-55fb-d9b0-4c79-66d876b6d9da	00030000-55fb-d9af-90cd-6985a33b248b
00020000-55fb-d9b0-4c79-66d876b6d9da	00030000-55fb-d9af-3621-f9f2b54b9eb2
00020000-55fb-d9b0-4c79-66d876b6d9da	00030000-55fb-d9af-0425-32e2523f8056
00020000-55fb-d9b0-4c79-66d876b6d9da	00030000-55fb-d9af-3a30-865719e0b583
00020000-55fb-d9b0-4c79-66d876b6d9da	00030000-55fb-d9af-3485-902d9e3bc111
00020000-55fb-d9b0-4c79-66d876b6d9da	00030000-55fb-d9af-50a7-549a5edc1d05
00020000-55fb-d9b0-4c79-66d876b6d9da	00030000-55fb-d9af-6a45-7300d4d229ec
00020000-55fb-d9b0-4c79-66d876b6d9da	00030000-55fb-d9af-5c8b-2e75a4ba0a65
00020000-55fb-d9b0-4c79-66d876b6d9da	00030000-55fb-d9af-bd7b-d8a126fd0148
00020000-55fb-d9b0-4c79-66d876b6d9da	00030000-55fb-d9af-71e5-5246f6b1976f
00020000-55fb-d9b0-4c79-66d876b6d9da	00030000-55fb-d9af-3696-2e3aabc2ea70
00020000-55fb-d9b0-4c79-66d876b6d9da	00030000-55fb-d9af-b25c-cf36469ad101
00020000-55fb-d9b0-4c79-66d876b6d9da	00030000-55fb-d9af-0603-9514563a0523
00020000-55fb-d9b0-4c79-66d876b6d9da	00030000-55fb-d9af-50d0-246132f82092
00020000-55fb-d9b0-4c79-66d876b6d9da	00030000-55fb-d9af-d6ef-7e062b950606
00020000-55fb-d9b0-4c79-66d876b6d9da	00030000-55fb-d9af-55e2-8341b28b30a2
00020000-55fb-d9b0-4c79-66d876b6d9da	00030000-55fb-d9af-1ae8-ac4d3582c2dd
00020000-55fb-d9b0-4c79-66d876b6d9da	00030000-55fb-d9af-7b26-53c4c9da7d90
00020000-55fb-d9b0-4c79-66d876b6d9da	00030000-55fb-d9af-6849-4f10cdac819b
00020000-55fb-d9b0-4c79-66d876b6d9da	00030000-55fb-d9af-a477-a3990b8bfd1b
00020000-55fb-d9b0-4c79-66d876b6d9da	00030000-55fb-d9af-4f68-3603bbe65745
00020000-55fb-d9b0-4c79-66d876b6d9da	00030000-55fb-d9af-420b-d5830ff67e0f
00020000-55fb-d9b0-4c79-66d876b6d9da	00030000-55fb-d9af-ee7b-c7dbdf939821
00020000-55fb-d9b0-4c79-66d876b6d9da	00030000-55fb-d9af-53da-57794f65b9d9
\.


--
-- TOC entry 2969 (class 0 OID 20003158)
-- Dependencies: 207
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 2973 (class 0 OID 20003192)
-- Dependencies: 211
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 2985 (class 0 OID 20003325)
-- Dependencies: 223
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, zacetek, konec, jeavtorskepravice, placilonavajo, vrednostvaje, planiranostevilovaj, vrednostvaj, vrednostpredstave, vrednostdopremiere, aktivna, zaposlenvdrjz, samozaposlen, igralec, opis) FROM stdin;
000b0000-55fb-d9b1-90c1-436c164e1638	00090000-55fb-d9b0-147b-462c84aa1287	\N	\N	0001	\N	\N	f	f	10.00	3	10.00	30.00	10.00	t	t	f	t	Pogodba o sodelovanju
000b0000-55fb-d9b1-f2dc-9c2050cd1bba	00090000-55fb-d9b0-72ae-752644267552	\N	\N	0002	\N	\N	f	t	11.00	10	11.00	31.00	110.00	t	f	t	t	Pogodba za vlogo Helena
000b0000-55fb-d9b1-35b0-8b5016d7ed1e	00090000-55fb-d9b0-2495-dedc7aa80311	\N	\N	0003	\N	\N	f	f	12.00	4	12.00	32.00	12.00	t	f	t	f	Pogodba za lektoriranje
000b0000-55fb-d9b1-29c4-19800191fef6	00090000-55fb-d9b0-193f-3770d3561d3c	\N	\N	0004	\N	\N	t	f	0.00	2	300.00	30.00	300.00	t	f	t	f	Pogodba za avtorske pravice
\.


--
-- TOC entry 2947 (class 0 OID 20002919)
-- Dependencies: 185
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, drzava_id, sifra, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo, nvo) FROM stdin;
00080000-55fb-d9b0-8844-52f504a2e874	00040000-55fb-d9af-e524-870a6a6e811b	0988	AK	Juhuhu d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55fb-d9b0-a043-c8ee7ca254ef	00040000-55fb-d9af-e524-870a6a6e811b	0989	AK	Hopsasa d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	t
00080000-55fb-d9b0-c35b-a080546b2ad6	00040000-55fb-d9af-e524-870a6a6e811b	0987	AK	Gledališče Šrum d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55fb-d9b0-a2b8-23ceb358e535	00040000-55fb-d9af-e524-870a6a6e811b	0986	AK	Lutkovni Direndaj d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55fb-d9b0-0a99-82472f1e62c4	00040000-55fb-d9af-e524-870a6a6e811b	0985	AK	Tatjana Stanič, Lektoriranje, s.p.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55fb-d9b0-d191-25526529891b	00040000-55fb-d9af-5d57-408d5606c95d	0984	AK	Gledališče Lepote tvoje		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55fb-d9b0-ba2e-9eb1a633ce03	00040000-55fb-d9af-e567-471b0160d6b4	0983	AK	Sunce naše		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55fb-d9b0-9612-71f0a3d09636	00040000-55fb-d9af-da66-9b9c9cec3e1a	0982	AK	Theater Amadeus		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55fb-d9b0-0e83-db5890f81291	00040000-55fb-d9af-ffaa-2db085ab3431	9999	AK	Fuchs		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55fb-d9b1-af1b-25cb04f11e62	00040000-55fb-d9af-e524-870a6a6e811b	1001	AK	Gledališče Matica		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
\.


--
-- TOC entry 2949 (class 0 OID 20002953)
-- Dependencies: 187
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-55fb-d9ae-5864-cc051eda54de	8341	Adlešiči
00050000-55fb-d9ae-5b37-6967f318907f	5270	Ajdovščina
00050000-55fb-d9ae-352a-fc1869707923	6280	Ankaran/Ancarano
00050000-55fb-d9ae-2f2d-de279f45b9ae	9253	Apače
00050000-55fb-d9ae-939b-d8ed33b22c5a	8253	Artiče
00050000-55fb-d9ae-afa8-c73928efe75a	4275	Begunje na Gorenjskem
00050000-55fb-d9ae-8973-f39891093ccf	1382	Begunje pri Cerknici
00050000-55fb-d9ae-3f6c-4bb7ac2d718d	9231	Beltinci
00050000-55fb-d9ae-167f-6ff36bd43d04	2234	Benedikt
00050000-55fb-d9ae-de2b-eaa3c7c079a0	2345	Bistrica ob Dravi
00050000-55fb-d9ae-ee32-9ef44e874afb	3256	Bistrica ob Sotli
00050000-55fb-d9ae-b9e9-97a363c2bc68	8259	Bizeljsko
00050000-55fb-d9ae-0421-82a71ad4e1bd	1223	Blagovica
00050000-55fb-d9ae-686d-ae157f657fc1	8283	Blanca
00050000-55fb-d9ae-c6f7-b39e4cc6d097	4260	Bled
00050000-55fb-d9ae-acdc-394a350f6d3a	4273	Blejska Dobrava
00050000-55fb-d9ae-ee43-079a25a663e4	9265	Bodonci
00050000-55fb-d9ae-7707-b53ca41b2c61	9222	Bogojina
00050000-55fb-d9ae-55c2-200bcc11cf84	4263	Bohinjska Bela
00050000-55fb-d9ae-e681-3b00f3fcc3e4	4264	Bohinjska Bistrica
00050000-55fb-d9ae-9b0b-93e1478abdb6	4265	Bohinjsko jezero
00050000-55fb-d9ae-b81f-57359ec424ea	1353	Borovnica
00050000-55fb-d9ae-6667-85925736b6e4	8294	Boštanj
00050000-55fb-d9ae-63f1-c8830c162dce	5230	Bovec
00050000-55fb-d9ae-00e3-de5f51b7b035	5295	Branik
00050000-55fb-d9ae-a595-0979d7e39b7c	3314	Braslovče
00050000-55fb-d9ae-ca64-d9e9984e2fea	5223	Breginj
00050000-55fb-d9ae-5f7f-dc866541660b	8280	Brestanica
00050000-55fb-d9ae-426f-b3e02972a4c4	2354	Bresternica
00050000-55fb-d9ae-b85d-17c8c09c7dfc	4243	Brezje
00050000-55fb-d9ae-5bf5-bc94fb1f7e15	1351	Brezovica pri Ljubljani
00050000-55fb-d9ae-2ef2-10d23269bb4e	8250	Brežice
00050000-55fb-d9ae-6c7a-6a0c65756ef8	4210	Brnik - Aerodrom
00050000-55fb-d9ae-920e-a092d29fcb87	8321	Brusnice
00050000-55fb-d9ae-b6d5-046f5d3c21dd	3255	Buče
00050000-55fb-d9ae-be73-5a73d435c20a	8276	Bučka 
00050000-55fb-d9ae-f89f-20113095f347	9261	Cankova
00050000-55fb-d9ae-57ab-005def04d696	3000	Celje 
00050000-55fb-d9ae-bcb8-9a839362f706	3001	Celje - poštni predali
00050000-55fb-d9ae-8ca4-7b4f36cd1170	4207	Cerklje na Gorenjskem
00050000-55fb-d9ae-c842-6ededbf85f68	8263	Cerklje ob Krki
00050000-55fb-d9ae-2083-4848cf187053	1380	Cerknica
00050000-55fb-d9ae-1aeb-6a78733fdcff	5282	Cerkno
00050000-55fb-d9ae-ffb0-c06f298df0ef	2236	Cerkvenjak
00050000-55fb-d9ae-8500-5176a33121a0	2215	Ceršak
00050000-55fb-d9ae-b1be-75a002270d5c	2326	Cirkovce
00050000-55fb-d9ae-3d64-790cfa53487e	2282	Cirkulane
00050000-55fb-d9ae-941a-035563bb3d25	5273	Col
00050000-55fb-d9ae-b978-74230fd0d3e4	8251	Čatež ob Savi
00050000-55fb-d9ae-872d-98904191d49c	1413	Čemšenik
00050000-55fb-d9ae-6568-6ea99e6ebec0	5253	Čepovan
00050000-55fb-d9ae-26c9-e3d3d7988ddb	9232	Črenšovci
00050000-55fb-d9ae-fb57-b2c55efb67ff	2393	Črna na Koroškem
00050000-55fb-d9ae-ac8e-6bb32d67f3f9	6275	Črni Kal
00050000-55fb-d9ae-2fe3-0141467dab54	5274	Črni Vrh nad Idrijo
00050000-55fb-d9ae-6b66-722f86338881	5262	Črniče
00050000-55fb-d9ae-b2d9-91b2eeb6afdf	8340	Črnomelj
00050000-55fb-d9ae-fe65-c1dc271c8b62	6271	Dekani
00050000-55fb-d9ae-6b88-bab5598ac097	5210	Deskle
00050000-55fb-d9ae-cccd-64284df2dd01	2253	Destrnik
00050000-55fb-d9ae-2918-473af294c20f	6215	Divača
00050000-55fb-d9ae-8ebf-3b372f9926d4	1233	Dob
00050000-55fb-d9ae-bb8a-147d7ea8873b	3224	Dobje pri Planini
00050000-55fb-d9ae-debc-ac1bde34bd68	8257	Dobova
00050000-55fb-d9ae-df74-d488219c77a2	1423	Dobovec
00050000-55fb-d9ae-a97d-a8dfa770b7c2	5263	Dobravlje
00050000-55fb-d9ae-846a-83a8a8875268	3204	Dobrna
00050000-55fb-d9ae-9815-b7c1c86dab91	8211	Dobrnič
00050000-55fb-d9ae-a7a7-12d6be0624fa	1356	Dobrova
00050000-55fb-d9ae-85ed-18fb8d0a1fec	9223	Dobrovnik/Dobronak 
00050000-55fb-d9ae-ec4f-bea945bd09ee	5212	Dobrovo v Brdih
00050000-55fb-d9ae-a55c-8c84d1d5d139	1431	Dol pri Hrastniku
00050000-55fb-d9ae-43e0-0350e4cdbcf3	1262	Dol pri Ljubljani
00050000-55fb-d9ae-aa82-57b9c8e755a7	1273	Dole pri Litiji
00050000-55fb-d9ae-f8a0-83f4e5d7fa0e	1331	Dolenja vas
00050000-55fb-d9ae-4225-8d640a2d1447	8350	Dolenjske Toplice
00050000-55fb-d9ae-73fc-e60c2d813ca5	1230	Domžale
00050000-55fb-d9ae-efae-8d7fcd756693	2252	Dornava
00050000-55fb-d9ae-6dbd-e219d8ac0b3a	5294	Dornberk
00050000-55fb-d9ae-c350-750d72829f81	1319	Draga
00050000-55fb-d9ae-f436-3df1847c53bd	8343	Dragatuš
00050000-55fb-d9ae-0def-922f62b29f76	3222	Dramlje
00050000-55fb-d9ae-00fb-36aa179001b7	2370	Dravograd
00050000-55fb-d9ae-bbf8-227737947464	4203	Duplje
00050000-55fb-d9ae-92e1-84feb842ead2	6221	Dutovlje
00050000-55fb-d9ae-80e4-babb8f44a7c2	8361	Dvor
00050000-55fb-d9ae-5beb-73ae0a1aedc1	2343	Fala
00050000-55fb-d9ae-1739-4eca9c851d44	9208	Fokovci
00050000-55fb-d9ae-8365-db9d6e813fd2	2313	Fram
00050000-55fb-d9ae-d685-9508020c717b	3213	Frankolovo
00050000-55fb-d9ae-f589-6de2f288ac05	1274	Gabrovka
00050000-55fb-d9ae-41cb-b3d572c8bc5f	8254	Globoko
00050000-55fb-d9ae-bb41-97dc73fd4e59	5275	Godovič
00050000-55fb-d9ae-8a33-9b1cd872bc6c	4204	Golnik
00050000-55fb-d9ae-1eae-bfcd5bb86ec1	3303	Gomilsko
00050000-55fb-d9ae-3692-f8ded1abcaed	4224	Gorenja vas
00050000-55fb-d9ae-4e4b-5335c6851638	3263	Gorica pri Slivnici
00050000-55fb-d9ae-4665-30f189259990	2272	Gorišnica
00050000-55fb-d9ae-5723-72f4f2a3cb50	9250	Gornja Radgona
00050000-55fb-d9ae-5f8e-62f2d05682aa	3342	Gornji Grad
00050000-55fb-d9ae-260b-7846a1b122cf	4282	Gozd Martuljek
00050000-55fb-d9ae-ebf6-05a60ead6a1e	6272	Gračišče
00050000-55fb-d9ae-4f8c-4cfe2aa48eb4	9264	Grad
00050000-55fb-d9ae-06eb-23ff8a687368	8332	Gradac
00050000-55fb-d9ae-4757-2a16f61d2b4d	1384	Grahovo
00050000-55fb-d9ae-9e90-9259a5a63c12	5242	Grahovo ob Bači
00050000-55fb-d9ae-4ab5-d4a7938eee11	5251	Grgar
00050000-55fb-d9ae-5985-1dce86097f81	3302	Griže
00050000-55fb-d9ae-1d75-ea41652508b9	3231	Grobelno
00050000-55fb-d9ae-5b3a-931933afd678	1290	Grosuplje
00050000-55fb-d9ae-5b68-434e367f4710	2288	Hajdina
00050000-55fb-d9ae-e2ee-6eaa9f5f77c4	8362	Hinje
00050000-55fb-d9ae-3ff0-7c549c53f96d	2311	Hoče
00050000-55fb-d9ae-7373-07abc042a33e	9205	Hodoš/Hodos
00050000-55fb-d9ae-2750-63570388f45f	1354	Horjul
00050000-55fb-d9ae-35b4-eadac1757f44	1372	Hotedršica
00050000-55fb-d9ae-1f25-d9dd9eb3f660	1430	Hrastnik
00050000-55fb-d9ae-10bb-c4b021c2d2a6	6225	Hruševje
00050000-55fb-d9ae-9041-76a21c98d086	4276	Hrušica
00050000-55fb-d9ae-2c11-6720bbdbb2d2	5280	Idrija
00050000-55fb-d9ae-cf3b-2738379c8b96	1292	Ig
00050000-55fb-d9ae-8b0e-18990f04acf4	6250	Ilirska Bistrica
00050000-55fb-d9ae-6294-4656dfda18b5	6251	Ilirska Bistrica-Trnovo
00050000-55fb-d9ae-80a4-99cd9939af2e	1295	Ivančna Gorica
00050000-55fb-d9ae-1664-57fd4c7480af	2259	Ivanjkovci
00050000-55fb-d9ae-4db6-48f8c9dd3e65	1411	Izlake
00050000-55fb-d9ae-33b2-c119254b8dfa	6310	Izola/Isola
00050000-55fb-d9ae-7ab2-14bac8f183b7	2222	Jakobski Dol
00050000-55fb-d9ae-2f58-04882c67d655	2221	Jarenina
00050000-55fb-d9ae-9422-b9b7f0ac57cc	6254	Jelšane
00050000-55fb-d9ae-f64d-fbd267c5b419	4270	Jesenice
00050000-55fb-d9ae-4736-1af8b65af26e	8261	Jesenice na Dolenjskem
00050000-55fb-d9ae-fb78-13e7357fa380	3273	Jurklošter
00050000-55fb-d9ae-76d9-f3393c697048	2223	Jurovski Dol
00050000-55fb-d9ae-a60e-6bdc84635800	2256	Juršinci
00050000-55fb-d9ae-bf63-7182aa2396ef	5214	Kal nad Kanalom
00050000-55fb-d9ae-22c8-90f8bfbfdc90	3233	Kalobje
00050000-55fb-d9ae-e112-afe4119f5b1f	4246	Kamna Gorica
00050000-55fb-d9ae-4ceb-63199c16f171	2351	Kamnica
00050000-55fb-d9ae-d0d2-4fbaca3c2d20	1241	Kamnik
00050000-55fb-d9ae-9cae-d5638d1c3a91	5213	Kanal
00050000-55fb-d9ae-b54e-e6481446df93	8258	Kapele
00050000-55fb-d9ae-e0bd-037f30bde57e	2362	Kapla
00050000-55fb-d9ae-7c61-c7d3215ef818	2325	Kidričevo
00050000-55fb-d9ae-2f94-b94106c03fc9	1412	Kisovec
00050000-55fb-d9ae-9afc-b4a79aec5625	6253	Knežak
00050000-55fb-d9ae-49d9-52fe7cd04168	5222	Kobarid
00050000-55fb-d9ae-e89a-2398695b700e	9227	Kobilje
00050000-55fb-d9ae-5d66-d913078a660c	1330	Kočevje
00050000-55fb-d9ae-c5cf-2aab02d1ed80	1338	Kočevska Reka
00050000-55fb-d9ae-fad2-b32088f81b5a	2276	Kog
00050000-55fb-d9ae-ac2b-a641f7034c8c	5211	Kojsko
00050000-55fb-d9ae-487a-012b84200462	6223	Komen
00050000-55fb-d9ae-beaa-2fedd2157beb	1218	Komenda
00050000-55fb-d9ae-8e69-98b1a4a2fd09	6000	Koper/Capodistria 
00050000-55fb-d9ae-078d-4c633445823b	6001	Koper/Capodistria - poštni predali
00050000-55fb-d9ae-c1f5-b2efaa8557b5	8282	Koprivnica
00050000-55fb-d9ae-151d-e7e417cfeb6e	5296	Kostanjevica na Krasu
00050000-55fb-d9ae-0bcd-e94ce6985337	8311	Kostanjevica na Krki
00050000-55fb-d9ae-e3f6-2f32e735d380	1336	Kostel
00050000-55fb-d9ae-9db3-edbab3a2dce6	6256	Košana
00050000-55fb-d9ae-779a-a8331f263e42	2394	Kotlje
00050000-55fb-d9ae-ba3e-657d76bab0af	6240	Kozina
00050000-55fb-d9ae-3a8f-a9f20d73b0e4	3260	Kozje
00050000-55fb-d9ae-f541-d1c62e986e3b	4000	Kranj 
00050000-55fb-d9ae-0982-ab03e441c15b	4001	Kranj - poštni predali
00050000-55fb-d9ae-3830-603bd0214e6f	4280	Kranjska Gora
00050000-55fb-d9ae-a272-0ddeb0b6da86	1281	Kresnice
00050000-55fb-d9ae-0b74-2255f3cc3584	4294	Križe
00050000-55fb-d9ae-d79f-c68fddb6be37	9206	Križevci
00050000-55fb-d9ae-10f7-b421b67b480d	9242	Križevci pri Ljutomeru
00050000-55fb-d9ae-c17c-12d5b4eeab9f	1301	Krka
00050000-55fb-d9ae-38c3-fa6bf2f0bdd2	8296	Krmelj
00050000-55fb-d9ae-4dfc-dc2c9c525f90	4245	Kropa
00050000-55fb-d9ae-8361-1a00b8b52fe8	8262	Krška vas
00050000-55fb-d9ae-229c-57e4d8177801	8270	Krško
00050000-55fb-d9ae-ab9a-ad124fa9df6b	9263	Kuzma
00050000-55fb-d9ae-f637-95e02104819e	2318	Laporje
00050000-55fb-d9ae-fce5-8fd74925b988	3270	Laško
00050000-55fb-d9ae-c821-6032cacb6116	1219	Laze v Tuhinju
00050000-55fb-d9ae-e273-4e7424e197e6	2230	Lenart v Slovenskih goricah
00050000-55fb-d9ae-dec1-93384d35aca9	9220	Lendava/Lendva
00050000-55fb-d9ae-4fc2-e4301db22b8a	4248	Lesce
00050000-55fb-d9ae-af2e-3d5f5914ef19	3261	Lesično
00050000-55fb-d9ae-0f70-4b235896b67c	8273	Leskovec pri Krškem
00050000-55fb-d9ae-b537-febdf7f60096	2372	Libeliče
00050000-55fb-d9ae-be14-adbfecdb6b32	2341	Limbuš
00050000-55fb-d9ae-577e-e73e6efadbcc	1270	Litija
00050000-55fb-d9ae-8d27-d0f1e8f4ea6d	3202	Ljubečna
00050000-55fb-d9ae-bf9c-43397fb37761	1000	Ljubljana 
00050000-55fb-d9ae-cd59-69c70b4558e4	1001	Ljubljana - poštni predali
00050000-55fb-d9ae-e728-9ab11f846535	1231	Ljubljana - Črnuče
00050000-55fb-d9ae-a521-659a2db09a32	1261	Ljubljana - Dobrunje
00050000-55fb-d9ae-6d95-ea33a2c62173	1260	Ljubljana - Polje
00050000-55fb-d9ae-dd73-2f024a198b1f	1210	Ljubljana - Šentvid
00050000-55fb-d9ae-2a29-66749fb3608b	1211	Ljubljana - Šmartno
00050000-55fb-d9ae-a7f4-080e69bdd194	3333	Ljubno ob Savinji
00050000-55fb-d9ae-68d1-f41c863d4d61	9240	Ljutomer
00050000-55fb-d9ae-28a6-b550c4a30fd8	3215	Loče
00050000-55fb-d9ae-fdfe-f8a6f0620e56	5231	Log pod Mangartom
00050000-55fb-d9ae-1559-8152baa92cfd	1358	Log pri Brezovici
00050000-55fb-d9ae-a33c-858d728bc1f7	1370	Logatec
00050000-55fb-d9ae-1478-c1d632d240d8	1371	Logatec
00050000-55fb-d9ae-2acc-857ada62efe9	1434	Loka pri Zidanem Mostu
00050000-55fb-d9ae-1718-3bb07971371b	3223	Loka pri Žusmu
00050000-55fb-d9ae-dfe2-62e6a35ac1d9	6219	Lokev
00050000-55fb-d9ae-5aae-eb695552a843	1318	Loški Potok
00050000-55fb-d9ae-7556-d7a5201adb97	2324	Lovrenc na Dravskem polju
00050000-55fb-d9ae-93b0-78010ab83fdd	2344	Lovrenc na Pohorju
00050000-55fb-d9ae-01b8-6e2adcfe226c	3334	Luče
00050000-55fb-d9ae-876e-97314257914c	1225	Lukovica
00050000-55fb-d9ae-558b-b82d41601133	9202	Mačkovci
00050000-55fb-d9ae-1157-aa29ce3c7ef4	2322	Majšperk
00050000-55fb-d9ae-f3dc-ce7d64910038	2321	Makole
00050000-55fb-d9ae-d056-869d2d87cfab	9243	Mala Nedelja
00050000-55fb-d9ae-ea8b-56458d8cd960	2229	Malečnik
00050000-55fb-d9ae-a8a6-43992685b93e	6273	Marezige
00050000-55fb-d9ae-3fd2-24cd0091150c	2000	Maribor 
00050000-55fb-d9ae-d104-b2d90caf90e7	2001	Maribor - poštni predali
00050000-55fb-d9ae-7ddb-7d007dedccb4	2206	Marjeta na Dravskem polju
00050000-55fb-d9ae-b1fa-bcb2262ab80c	2281	Markovci
00050000-55fb-d9ae-44ea-1c64f42a8a07	9221	Martjanci
00050000-55fb-d9ae-492e-33784a1e5148	6242	Materija
00050000-55fb-d9ae-44c1-a20eb405a755	4211	Mavčiče
00050000-55fb-d9ae-5f0b-198feba55aa6	1215	Medvode
00050000-55fb-d9ae-375b-89515b4c7b1e	1234	Mengeš
00050000-55fb-d9ae-e2cd-dadc4389f549	8330	Metlika
00050000-55fb-d9ae-9f51-435f73f0c3db	2392	Mežica
00050000-55fb-d9ae-a81a-54a916b8816f	2204	Miklavž na Dravskem polju
00050000-55fb-d9ae-510d-b4536c68363e	2275	Miklavž pri Ormožu
00050000-55fb-d9ae-3a67-a32045a76a6d	5291	Miren
00050000-55fb-d9ae-699b-a221903846b1	8233	Mirna
00050000-55fb-d9ae-35ea-d955ddc41cfb	8216	Mirna Peč
00050000-55fb-d9ae-06c4-557cb57f4b39	2382	Mislinja
00050000-55fb-d9ae-2579-a63efacbe0fb	4281	Mojstrana
00050000-55fb-d9ae-93bd-d2fb857a7656	8230	Mokronog
00050000-55fb-d9ae-da0e-145cbc61d0c5	1251	Moravče
00050000-55fb-d9ae-0600-7501bec06e86	9226	Moravske Toplice
00050000-55fb-d9ae-2bce-523a08d6adc5	5216	Most na Soči
00050000-55fb-d9ae-16ee-0894b852130d	1221	Motnik
00050000-55fb-d9ae-5537-8bdfd8e6ae18	3330	Mozirje
00050000-55fb-d9ae-b2be-331d540ad7b2	9000	Murska Sobota 
00050000-55fb-d9ae-238b-e27ffabfe1a3	9001	Murska Sobota - poštni predali
00050000-55fb-d9ae-cf59-ff7caa613670	2366	Muta
00050000-55fb-d9ae-a85f-735b4e46d1fc	4202	Naklo
00050000-55fb-d9ae-fb12-c7b4aeba7b8e	3331	Nazarje
00050000-55fb-d9ae-47ee-77d6c4e60220	1357	Notranje Gorice
00050000-55fb-d9ae-10db-dbc51e83a6f5	3203	Nova Cerkev
00050000-55fb-d9ae-9194-a77ec20443cf	5000	Nova Gorica 
00050000-55fb-d9ae-d3b1-15ca9e4efaba	5001	Nova Gorica - poštni predali
00050000-55fb-d9ae-f64e-98eb298e2103	1385	Nova vas
00050000-55fb-d9ae-7777-cff0c267afaf	8000	Novo mesto
00050000-55fb-d9ae-1fae-df2db1c4f981	8001	Novo mesto - poštni predali
00050000-55fb-d9ae-cbb0-2e35a58e2d90	6243	Obrov
00050000-55fb-d9ae-c81f-2c65dd55371b	9233	Odranci
00050000-55fb-d9ae-e1da-3ddf2b58856a	2317	Oplotnica
00050000-55fb-d9ae-3b05-5260a9295523	2312	Orehova vas
00050000-55fb-d9ae-aefe-9ceda047d139	2270	Ormož
00050000-55fb-d9ae-b214-e4ffe37d3d86	1316	Ortnek
00050000-55fb-d9ae-0922-b7d9adeba24c	1337	Osilnica
00050000-55fb-d9ae-df71-4014395f840c	8222	Otočec
00050000-55fb-d9ae-90fd-33fc2a03f584	2361	Ožbalt
00050000-55fb-d9ae-4078-d38046c178e5	2231	Pernica
00050000-55fb-d9ae-5317-4d54fb596026	2211	Pesnica pri Mariboru
00050000-55fb-d9ae-4ade-64b5ecd608a3	9203	Petrovci
00050000-55fb-d9ae-8bea-0ee8c53044a7	3301	Petrovče
00050000-55fb-d9ae-ad85-eba40c354320	6330	Piran/Pirano
00050000-55fb-d9ae-0462-265d9aeaa562	8255	Pišece
00050000-55fb-d9ae-c5be-26aaba5cc4d6	6257	Pivka
00050000-55fb-d9ae-c0e5-0395444d71c6	6232	Planina
00050000-55fb-d9ae-0e59-db63ee174b4c	3225	Planina pri Sevnici
00050000-55fb-d9ae-c26b-f1d90435f8bd	6276	Pobegi
00050000-55fb-d9ae-aa81-db62764851eb	8312	Podbočje
00050000-55fb-d9ae-da24-18eb0f2a5292	5243	Podbrdo
00050000-55fb-d9ae-4943-5c22502c0abd	3254	Podčetrtek
00050000-55fb-d9ae-662c-cbb25b6710e4	2273	Podgorci
00050000-55fb-d9ae-b8c5-da4955dd97d1	6216	Podgorje
00050000-55fb-d9ae-cb48-36141831a91f	2381	Podgorje pri Slovenj Gradcu
00050000-55fb-d9ae-fac5-4e9cd799cf96	6244	Podgrad
00050000-55fb-d9ae-e914-4192deb6749f	1414	Podkum
00050000-55fb-d9ae-3f9d-e1ce9ef443a9	2286	Podlehnik
00050000-55fb-d9ae-a97b-bfdc3df1b1a5	5272	Podnanos
00050000-55fb-d9ae-61af-57053c722253	4244	Podnart
00050000-55fb-d9ae-5186-daa1ed2305cc	3241	Podplat
00050000-55fb-d9ae-cf09-db76d25de7fd	3257	Podsreda
00050000-55fb-d9ae-5285-eb230486d281	2363	Podvelka
00050000-55fb-d9ae-783e-e206aebd520f	2208	Pohorje
00050000-55fb-d9ae-4db8-a45603cce64d	2257	Polenšak
00050000-55fb-d9ae-a0f2-118465f90004	1355	Polhov Gradec
00050000-55fb-d9ae-1218-40604c3e15d1	4223	Poljane nad Škofjo Loko
00050000-55fb-d9ae-b8c5-dc3508f2b23c	2319	Poljčane
00050000-55fb-d9ae-50f6-cee70a36f82c	1272	Polšnik
00050000-55fb-d9ae-0eb1-1a20edb93353	3313	Polzela
00050000-55fb-d9ae-f454-58e7d45729e5	3232	Ponikva
00050000-55fb-d9ae-d9ca-cdb4de4a7c1a	6320	Portorož/Portorose
00050000-55fb-d9ae-3135-67078b5b4a48	6230	Postojna
00050000-55fb-d9ae-241f-25061ca30794	2331	Pragersko
00050000-55fb-d9ae-eaa5-32e83e0aa81d	3312	Prebold
00050000-55fb-d9ae-705b-2ae23d2c8cc1	4205	Preddvor
00050000-55fb-d9ae-7c09-38cf2be84538	6255	Prem
00050000-55fb-d9ae-a08d-d52601dd3b5e	1352	Preserje
00050000-55fb-d9ae-6067-cf8a82099da9	6258	Prestranek
00050000-55fb-d9ae-7f6d-c216ba9dfd3f	2391	Prevalje
00050000-55fb-d9ae-0681-980b3c25ecb5	3262	Prevorje
00050000-55fb-d9ae-6f75-4f833ab3fac9	1276	Primskovo 
00050000-55fb-d9ae-b846-7a906ac10856	3253	Pristava pri Mestinju
00050000-55fb-d9ae-800a-b8bbb556b932	9207	Prosenjakovci/Partosfalva
00050000-55fb-d9ae-9d0f-2d68a9f41aed	5297	Prvačina
00050000-55fb-d9ae-05e0-c29bbf80574a	2250	Ptuj
00050000-55fb-d9ae-6f80-17a3215502dd	2323	Ptujska Gora
00050000-55fb-d9ae-db6a-9f368772435d	9201	Puconci
00050000-55fb-d9ae-d743-1cd4cb4e033d	2327	Rače
00050000-55fb-d9ae-d665-8ebc089f8404	1433	Radeče
00050000-55fb-d9ae-54d7-edd21389e32d	9252	Radenci
00050000-55fb-d9ae-f226-1734a58f44a7	2360	Radlje ob Dravi
00050000-55fb-d9ae-8cf5-3e7fede3215b	1235	Radomlje
00050000-55fb-d9ae-ea1a-eed16060baa4	4240	Radovljica
00050000-55fb-d9ae-a66a-597297d50908	8274	Raka
00050000-55fb-d9ae-7cdd-638c750e6c32	1381	Rakek
00050000-55fb-d9ae-72c5-8a1874799168	4283	Rateče - Planica
00050000-55fb-d9ae-4c58-f7c1e8e0d9e3	2390	Ravne na Koroškem
00050000-55fb-d9ae-0cce-a5f3044b51d1	9246	Razkrižje
00050000-55fb-d9ae-468b-c6a7f52b584f	3332	Rečica ob Savinji
00050000-55fb-d9ae-d6da-03dbe26cec8e	5292	Renče
00050000-55fb-d9ae-a0d4-40b2d11e5168	1310	Ribnica
00050000-55fb-d9ae-0b25-9c3333f8c8d3	2364	Ribnica na Pohorju
00050000-55fb-d9ae-534c-c5088482c75c	3272	Rimske Toplice
00050000-55fb-d9ae-1122-2a94678aca23	1314	Rob
00050000-55fb-d9ae-a1ca-e667122b6452	5215	Ročinj
00050000-55fb-d9ae-64e7-106fb3344cf9	3250	Rogaška Slatina
00050000-55fb-d9ae-83a5-4811961fcb05	9262	Rogašovci
00050000-55fb-d9ae-a4c5-010d08f28e04	3252	Rogatec
00050000-55fb-d9ae-c8ab-15f4be690d80	1373	Rovte
00050000-55fb-d9ae-ed63-a6bffe74f067	2342	Ruše
00050000-55fb-d9ae-d180-c34ce98a6d0c	1282	Sava
00050000-55fb-d9ae-3583-21e3790750df	6333	Sečovlje/Sicciole
00050000-55fb-d9ae-e322-92364519fc75	4227	Selca
00050000-55fb-d9ae-0266-c49e8c47ec62	2352	Selnica ob Dravi
00050000-55fb-d9ae-d15c-ff383d8bd7a4	8333	Semič
00050000-55fb-d9ae-4184-c0162b911821	8281	Senovo
00050000-55fb-d9ae-dfc3-58a083f054de	6224	Senožeče
00050000-55fb-d9ae-b6f4-3d7ff7e409c9	8290	Sevnica
00050000-55fb-d9ae-87a4-279cebe5b9cc	6210	Sežana
00050000-55fb-d9ae-bd90-63237ad5a7d0	2214	Sladki Vrh
00050000-55fb-d9ae-ce03-62e11fd1ca6b	5283	Slap ob Idrijci
00050000-55fb-d9ae-e2b6-069f74feefd7	2380	Slovenj Gradec
00050000-55fb-d9ae-34b3-24da0dc24071	2310	Slovenska Bistrica
00050000-55fb-d9ae-dc65-97874b5d34c7	3210	Slovenske Konjice
00050000-55fb-d9ae-6005-1f56f5f0e826	1216	Smlednik
00050000-55fb-d9ae-510f-2675526c77bf	5232	Soča
00050000-55fb-d9ae-9fcc-de28ca3b2ecd	1317	Sodražica
00050000-55fb-d9ae-e0e2-5c68af085103	3335	Solčava
00050000-55fb-d9ae-9f97-0ae2cc6dfb9c	5250	Solkan
00050000-55fb-d9ae-5c9d-06b2ed487b69	4229	Sorica
00050000-55fb-d9ae-a282-5837589c9a6f	4225	Sovodenj
00050000-55fb-d9ae-611c-9b16af36288c	5281	Spodnja Idrija
00050000-55fb-d9ae-89eb-71957a65a371	2241	Spodnji Duplek
00050000-55fb-d9ae-e515-a0b98f4b71c7	9245	Spodnji Ivanjci
00050000-55fb-d9ae-4241-f13ca9d4d3ff	2277	Središče ob Dravi
00050000-55fb-d9ae-3b68-38fe4ae816e0	4267	Srednja vas v Bohinju
00050000-55fb-d9ae-dbd0-35ae675c892d	8256	Sromlje 
00050000-55fb-d9ae-615f-51fa0c7beaba	5224	Srpenica
00050000-55fb-d9ae-d8be-645d9d7e6635	1242	Stahovica
00050000-55fb-d9ae-65df-fcd077b92812	1332	Stara Cerkev
00050000-55fb-d9ae-cdab-28e510229b48	8342	Stari trg ob Kolpi
00050000-55fb-d9ae-ff20-cf55b164b136	1386	Stari trg pri Ložu
00050000-55fb-d9ae-c0cd-16e6341e79af	2205	Starše
00050000-55fb-d9ae-c5ea-7ff0529d4b80	2289	Stoperce
00050000-55fb-d9ae-07de-5403ba3656cf	8322	Stopiče
00050000-55fb-d9ae-07b0-7c179b13a657	3206	Stranice
00050000-55fb-d9ae-6274-0f5157cf5d91	8351	Straža
00050000-55fb-d9ae-f6e3-20324c718d81	1313	Struge
00050000-55fb-d9ae-0851-5fe8d6d6cd35	8293	Studenec
00050000-55fb-d9ae-f0ee-94b79f2405d4	8331	Suhor
00050000-55fb-d9ae-28a7-699f5e0e14c5	2233	Sv. Ana v Slovenskih goricah
00050000-55fb-d9ae-ab2a-d15549e83f9e	2235	Sv. Trojica v Slovenskih goricah
00050000-55fb-d9ae-8d44-7029952409cc	2353	Sveti Duh na Ostrem Vrhu
00050000-55fb-d9ae-d3bb-e3901307e23c	9244	Sveti Jurij ob Ščavnici
00050000-55fb-d9ae-b49f-76d68b6f330f	3264	Sveti Štefan
00050000-55fb-d9ae-f949-cc41ff1480d7	2258	Sveti Tomaž
00050000-55fb-d9ae-3155-cd6248310255	9204	Šalovci
00050000-55fb-d9ae-fb44-db3787cc5292	5261	Šempas
00050000-55fb-d9af-eeb7-3a82339a7293	5290	Šempeter pri Gorici
00050000-55fb-d9af-c78d-b1e289554e43	3311	Šempeter v Savinjski dolini
00050000-55fb-d9af-9fc5-7db5ff64ca84	4208	Šenčur
00050000-55fb-d9af-bec3-55c350a3f1f0	2212	Šentilj v Slovenskih goricah
00050000-55fb-d9af-eb82-c59a51138d41	8297	Šentjanž
00050000-55fb-d9af-5f83-9f0b1b7bff3c	2373	Šentjanž pri Dravogradu
00050000-55fb-d9af-85f9-905bc09c3469	8310	Šentjernej
00050000-55fb-d9af-25f4-7473a300f521	3230	Šentjur
00050000-55fb-d9af-96de-437f7ca8c2cb	3271	Šentrupert
00050000-55fb-d9af-3fac-befc7a9f3ee9	8232	Šentrupert
00050000-55fb-d9af-405c-3b34f46601b6	1296	Šentvid pri Stični
00050000-55fb-d9af-8822-cce12ff742de	8275	Škocjan
00050000-55fb-d9af-60c1-168a97769ac8	6281	Škofije
00050000-55fb-d9af-8792-74156d5e8f9d	4220	Škofja Loka
00050000-55fb-d9af-e82b-e325838cb24d	3211	Škofja vas
00050000-55fb-d9af-2213-db8a7f84b736	1291	Škofljica
00050000-55fb-d9af-179d-0cfc41a59a05	6274	Šmarje
00050000-55fb-d9af-ead6-bb18b97f4bbd	1293	Šmarje - Sap
00050000-55fb-d9af-6bc1-9b642ad542f8	3240	Šmarje pri Jelšah
00050000-55fb-d9af-b66e-da430e9e3b07	8220	Šmarješke Toplice
00050000-55fb-d9af-cdb0-0cc3afa79d02	2315	Šmartno na Pohorju
00050000-55fb-d9af-3926-5abf13699780	3341	Šmartno ob Dreti
00050000-55fb-d9af-95b0-2c4f6d6d0355	3327	Šmartno ob Paki
00050000-55fb-d9af-feb7-ddb9274bc7a9	1275	Šmartno pri Litiji
00050000-55fb-d9af-170c-312d034e2229	2383	Šmartno pri Slovenj Gradcu
00050000-55fb-d9af-1f64-6e415ecc214b	3201	Šmartno v Rožni dolini
00050000-55fb-d9af-047f-3ddfbbeba29e	3325	Šoštanj
00050000-55fb-d9af-51ac-201ec31e096c	6222	Štanjel
00050000-55fb-d9af-38bd-5eecfd2c686d	3220	Štore
00050000-55fb-d9af-4f0d-f5080bdb9606	3304	Tabor
00050000-55fb-d9af-3bd3-00aa88d82413	3221	Teharje
00050000-55fb-d9af-c8cd-9a1ab52a1744	9251	Tišina
00050000-55fb-d9af-2ef2-f44577c6f5c2	5220	Tolmin
00050000-55fb-d9af-a14d-f8b02c23c2cc	3326	Topolšica
00050000-55fb-d9af-0797-394b1221b45e	2371	Trbonje
00050000-55fb-d9af-ec18-eba858758d8c	1420	Trbovlje
00050000-55fb-d9af-c9f0-2b51ac46114e	8231	Trebelno 
00050000-55fb-d9af-5372-07373f7f3ee3	8210	Trebnje
00050000-55fb-d9af-6dd8-a64aa2b6ce6a	5252	Trnovo pri Gorici
00050000-55fb-d9af-f63a-8b22b3c15aa0	2254	Trnovska vas
00050000-55fb-d9af-1706-4c5265876371	1222	Trojane
00050000-55fb-d9af-498a-0a991a75b0f7	1236	Trzin
00050000-55fb-d9af-b0f8-25673755b323	4290	Tržič
00050000-55fb-d9af-a530-9e9015b94de5	8295	Tržišče
00050000-55fb-d9af-9ddd-a576d930bd4b	1311	Turjak
00050000-55fb-d9af-66c3-57d654ce35fb	9224	Turnišče
00050000-55fb-d9af-b912-c92b7a1dd22e	8323	Uršna sela
00050000-55fb-d9af-f6aa-08652683e2ff	1252	Vače
00050000-55fb-d9af-2897-28af55114151	3320	Velenje 
00050000-55fb-d9af-5747-b7ae5f702806	3322	Velenje - poštni predali
00050000-55fb-d9af-b05d-8c9257e1972a	8212	Velika Loka
00050000-55fb-d9af-d434-ad2ad92a4c9c	2274	Velika Nedelja
00050000-55fb-d9af-4900-7e649a6e0d2b	9225	Velika Polana
00050000-55fb-d9af-ba3f-da9c3628089d	1315	Velike Lašče
00050000-55fb-d9af-0045-33393d8243fa	8213	Veliki Gaber
00050000-55fb-d9af-cb51-cada7db95ccd	9241	Veržej
00050000-55fb-d9af-1d3c-7085aebcba1b	1312	Videm - Dobrepolje
00050000-55fb-d9af-31de-b08dc4da8e3d	2284	Videm pri Ptuju
00050000-55fb-d9af-e49f-b7d8fff0a3de	8344	Vinica
00050000-55fb-d9af-06f6-f6b942d8f37e	5271	Vipava
00050000-55fb-d9af-5058-802ee123a161	4212	Visoko
00050000-55fb-d9af-25ce-dba28bcf148f	1294	Višnja Gora
00050000-55fb-d9af-e1e9-2fdab559411d	3205	Vitanje
00050000-55fb-d9af-c354-aa7d33e1cedf	2255	Vitomarci
00050000-55fb-d9af-8777-417d05403ed8	1217	Vodice
00050000-55fb-d9af-a574-750252d4b0ec	3212	Vojnik\t
00050000-55fb-d9af-3341-ffcfc88d1aa9	5293	Volčja Draga
00050000-55fb-d9af-0bea-21172a745583	2232	Voličina
00050000-55fb-d9af-8f2a-d98689f1b9a2	3305	Vransko
00050000-55fb-d9af-971f-3282eae22283	6217	Vremski Britof
00050000-55fb-d9af-aec6-f0384d0d940c	1360	Vrhnika
00050000-55fb-d9af-2f34-49caa02ca6d6	2365	Vuhred
00050000-55fb-d9af-d64c-799c9746e50d	2367	Vuzenica
00050000-55fb-d9af-9631-fc3bb807e7a4	8292	Zabukovje 
00050000-55fb-d9af-33b1-80eb546eb928	1410	Zagorje ob Savi
00050000-55fb-d9af-7af7-1b019d0a7b1b	1303	Zagradec
00050000-55fb-d9af-6d65-675f154fdc9e	2283	Zavrč
00050000-55fb-d9af-9e70-390bd671d63c	8272	Zdole 
00050000-55fb-d9af-e53c-374139e0a80c	4201	Zgornja Besnica
00050000-55fb-d9af-daf2-f6b9c94f379e	2242	Zgornja Korena
00050000-55fb-d9af-d33c-14f9d82ccade	2201	Zgornja Kungota
00050000-55fb-d9af-6035-60744ecde356	2316	Zgornja Ložnica
00050000-55fb-d9af-90a7-e8892bc5c5c4	2314	Zgornja Polskava
00050000-55fb-d9af-aa68-05f852e21118	2213	Zgornja Velka
00050000-55fb-d9af-8bf2-b7fba64b8e05	4247	Zgornje Gorje
00050000-55fb-d9af-1221-23ba4f97a79e	4206	Zgornje Jezersko
00050000-55fb-d9af-4f2d-665a1b8cd510	2285	Zgornji Leskovec
00050000-55fb-d9af-dbb4-c36e1ae7f480	1432	Zidani Most
00050000-55fb-d9af-b815-721a152403cd	3214	Zreče
00050000-55fb-d9af-ac14-44cfb1e0dfb1	4209	Žabnica
00050000-55fb-d9af-0731-a77500c703fa	3310	Žalec
00050000-55fb-d9af-e8cf-03b7d98f4336	4228	Železniki
00050000-55fb-d9af-3a9d-d2225aff5c7b	2287	Žetale
00050000-55fb-d9af-bbd7-9f8f96b45313	4226	Žiri
00050000-55fb-d9af-8d4c-cd31a27c8a41	4274	Žirovnica
00050000-55fb-d9af-176a-51c4d56985ab	8360	Žužemberk
\.


--
-- TOC entry 2992 (class 0 OID 20003504)
-- Dependencies: 230
-- Data for Name: postavkacdve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkacdve (id, skupina, podskupina, naziv, vrpremiere, vrponovitvepremier, vrponovitveprejsnjih, vrgostovanjazamejstvo, vrfestivali, vrgostovanjaint, vrostalo, programdela_id) FROM stdin;
\.


--
-- TOC entry 2965 (class 0 OID 20003132)
-- Dependencies: 203
-- Data for Name: postavkaracuna; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkaracuna (id, racun_id) FROM stdin;
\.


--
-- TOC entry 2948 (class 0 OID 20002938)
-- Dependencies: 186
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
00060000-55fb-d9b0-23d5-e97c08e9c689	00080000-55fb-d9b0-8844-52f504a2e874	\N	00040000-55fb-d9af-e524-870a6a6e811b	Narodni dom	\N	Koroška 15	\N	9231	Beltinci	\N	f	t
00060000-55fb-d9b0-a960-fe622b27dc67	00080000-55fb-d9b0-8844-52f504a2e874	\N	00040000-55fb-d9af-e524-870a6a6e811b	Korotan	\N	Koroška 22	\N	9231	Beltinci	\N	f	f
00060000-55fb-d9b0-ec4f-d95a93040b38	00080000-55fb-d9b0-a043-c8ee7ca254ef	\N	00040000-55fb-d9af-e524-870a6a6e811b	Rimljan	\N	Rimska ploščad 7	\N	9231	Beltinci	\N	f	t
\.


--
-- TOC entry 2954 (class 0 OID 20003016)
-- Dependencies: 192
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, zaporedna, porocilo) FROM stdin;
\.


--
-- TOC entry 2967 (class 0 OID 20003144)
-- Dependencies: 205
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 2993 (class 0 OID 20003518)
-- Dependencies: 231
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, koproducent_id, odstotekfinanciranja, delez, maticnikop, kpe, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 2994 (class 0 OID 20003528)
-- Dependencies: 232
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, sifra, status) FROM stdin;
00190000-55fb-d9b0-26da-647a5eee8738	00080000-55fb-d9b0-c35b-a080546b2ad6	0987	AK
00190000-55fb-d9b0-31ac-147cd29b7bd4	00080000-55fb-d9b0-a043-c8ee7ca254ef	0989	AK
00190000-55fb-d9b0-14d3-7d4b0e84ab91	00080000-55fb-d9b0-a2b8-23ceb358e535	0986	AK
00190000-55fb-d9b0-2903-ae56be00dde3	00080000-55fb-d9b0-d191-25526529891b	0984	AK
00190000-55fb-d9b0-91b4-b6b35fbee871	00080000-55fb-d9b0-ba2e-9eb1a633ce03	0983	AK
00190000-55fb-d9b0-e7c3-6ad49de3084c	00080000-55fb-d9b0-9612-71f0a3d09636	0982	AK
00190000-55fb-d9b2-5d14-a6a5133f6834	00080000-55fb-d9b1-af1b-25cb04f11e62	1001	AK
\.


--
-- TOC entry 2991 (class 0 OID 20003461)
-- Dependencies: 229
-- Data for Name: programdela; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programdela (id, sifra, naziv, zacetek, konec, zakljuceno, potrjenprogram, stpremier, stint, stfest, strazno, stizjem, stponprem, stponprej, stponprejvelikih, stponprejmalih, stponprejmalihkopr, stponprejsredkopr, stponprejvelikihkopr, stgostujo, vrps1, vrps1do, vrps1mat, vrps1gostovsz, stizvnekomerc, stizvprem, stizvpremdoma, stizvpremkopr, stizvponprem, stizvponpremdoma, stizvponpremzamejo, stizvponpremgost, stizvponpremkopr, stizvponpremint, stizvponpremkoprint, stizvponprej, stizvponprejdoma, stizvponprejzamejo, stizvponprejgost, stizvponprejkopr, stizvponprejint, stizvponprejkoprint, stizvgostuj, stizvostalihnek, stizvgostovanjslo, stizvgostovanjzam, stizvgostovanjint, stobisknekom, stobisknekommat, stobisknekomgostslo, stobisknekomgostzam, stobisknekomgostint, stobiskprem, stobiskpremdoma, stobiskpremkopr, stobiskponprem, stobiskponpremdoma, stobiskponpremkopr, stobiskponpremkoprint, stobiskponpremgost, stobiskponpremzamejo, stobiskponpremint, avgobiskprired, avgzaseddvoran, avgcenavstopnice, stprodvstopnic, stkoprodukcij, stkoprodukcijint, stkoprodukcijnvo, stzaposlenih, stzaposigralcev, avgstnastopovigr, sthonorarnih, sthonorarnihigr, sthonorarnihigrtujjz, sthonorarnihigrsamoz, sredstvaint, sredstvaavt, sredstvazaprosenoprem, sredstvazaprosenoponprem, sredstvazaprosenoponprej, sredstvazaprosenogostujo, sredstvazaprosenoint, sredstvazaprosenofest, sredstvazaprosenorazno, sredstvazaprosenoizjem, sredstvadrugijavniprem, sredstvadrugijavniponprem, sredstvadrugijavniponprej, sredstvadrugijavnigostujo, sredstvadrugijavniint, sredstvadrugijavnifest, sredstvadrugijavnirazno, sredstvadrugijavniizjem, sredstvadrugiviriprem, sredstvadrugiviriponprem, sredstvadrugiviriponprej, sredstvadrugivirigostujo, sredstvadrugiviriint, sredstvadrugivirifest, sredstvadrugivirirazno, sredstvadrugiviriizjem, sredstvaavtsamoz) FROM stdin;
00290000-55fb-d9b1-a18b-de5a24ada1fb	0001	Testni program dela	2016-02-01	2017-02-01	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 2995 (class 0 OID 20003536)
-- Dependencies: 233
-- Data for Name: programskaenotasklopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programskaenotasklopa (id, naslovpe, avtorpe, obsegpe, mesecpe, vrednostpe, programrazno_id) FROM stdin;
\.


--
-- TOC entry 2971 (class 0 OID 20003173)
-- Dependencies: 209
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, popa_id, naslov_id, sifra, naziv, jeprizorisce, jematicnioder, seplanira, kapaciteta, opis) FROM stdin;
00220000-55fb-d9b0-5734-42180292b22d	\N	\N	0001	Poskusna 1	f	\N	t	8	Poskusna učilnica v prvem
00220000-55fb-d9b0-af38-a07b73c23d94	\N	\N	0002	Poskusna 3	f	\N	f	34	Poskusna učilnica v tretjem
00220000-55fb-d9b0-d081-7f09fb72e328	\N	\N	0003	Kazinska	t	\N	t	84	Kazinska dvorana
00220000-55fb-d9b0-255a-2ce1f6053732	\N	\N	0004	Mali oder	t	\N	t	24	Mali oder 
00220000-55fb-d9b0-ccb0-87f931bde493	\N	\N	0005	Komorni oder	t	\N	t	15	Komorni oder
00220000-55fb-d9b0-12b0-cc7850c200d3	\N	\N	0006	Stara dvorana	t	\N	t	96	Stara dvorana ali dvorana Franceta Prešerna
00220000-55fb-d9b0-4d56-d1499ea5baca	\N	\N	0007	Velika dvorana	t	\N	t	160	Velika, glavna dvorana
\.


--
-- TOC entry 2963 (class 0 OID 20003117)
-- Dependencies: 201
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 2962 (class 0 OID 20003107)
-- Dependencies: 200
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 2984 (class 0 OID 20003314)
-- Dependencies: 222
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta, status) FROM stdin;
\.


--
-- TOC entry 2978 (class 0 OID 20003247)
-- Dependencies: 216
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 2937 (class 0 OID 20002811)
-- Dependencies: 175
-- Data for Name: revizije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY revizije (id, razred, objectid, upor, datum, tip, data) FROM stdin;
1	App\\Entity\\Popa	00080000-55fb-d9b1-af1b-25cb04f11e62	00010000-55fb-d9af-3f93-c400fff12e0d	2015-09-18 11:30:26	INS	a:0:{}
2	App\\Entity\\Option	00000000-55fb-d9b2-42eb-e456867f386f	00010000-55fb-d9af-3f93-c400fff12e0d	2015-09-18 11:30:26	INS	a:0:{}
3	ProgramDela\\Entity\\ProdukcijskaHisa	00190000-55fb-d9b2-5d14-a6a5133f6834	00010000-55fb-d9af-3f93-c400fff12e0d	2015-09-18 11:30:26	INS	a:0:{}
\.


--
-- TOC entry 3013 (class 0 OID 0)
-- Dependencies: 174
-- Name: revizije_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('revizije_id_seq', 3, true);


--
-- TOC entry 2972 (class 0 OID 20003186)
-- Dependencies: 210
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 2941 (class 0 OID 20002849)
-- Dependencies: 179
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-55fb-d9af-b91c-759784d8e99b	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-55fb-d9af-a062-a419ebdb9c2e	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-55fb-d9af-9cd8-00eee1ef67a5	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-55fb-d9af-7f8f-453053791483	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-55fb-d9af-6bf2-53e10a405fac	planer	Planer dogodkov v koledarju	t
00020000-55fb-d9af-b0af-6d41cedd18d5	kadrovska	Kadrovska služba	t
00020000-55fb-d9af-f1dc-a79e8f96a1a9	arhivar	Ažuriranje arhivalij	t
00020000-55fb-d9af-3c26-577a749fd6ac	igralec	Igralec	t
00020000-55fb-d9af-ceab-e39a6c94d074	prisotnost	Vnašalec prisotnosti, tudi za tiste izven uprizoritev	t
00020000-55fb-d9b0-4c79-66d876b6d9da	vsadovoljenja	Vloga z vsemi posameznimi dovoljenji	t
\.


--
-- TOC entry 2939 (class 0 OID 20002833)
-- Dependencies: 177
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-55fb-d9af-93ee-e0ee08360ffc	00020000-55fb-d9af-9cd8-00eee1ef67a5
00010000-55fb-d9af-3f93-c400fff12e0d	00020000-55fb-d9af-9cd8-00eee1ef67a5
00010000-55fb-d9b0-5269-0aa7843417a5	00020000-55fb-d9b0-4c79-66d876b6d9da
\.


--
-- TOC entry 2974 (class 0 OID 20003200)
-- Dependencies: 212
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 2966 (class 0 OID 20003138)
-- Dependencies: 204
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 2960 (class 0 OID 20003084)
-- Dependencies: 198
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, sifra, ime, zacetek, konec, aktivna) FROM stdin;
\.


--
-- TOC entry 2935 (class 0 OID 20002798)
-- Dependencies: 173
-- Data for Name: stevilcenje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenje (id, sifra, naziv, prefix, suffix, zacetek, dolzina, format, globalno, poletih) FROM stdin;
00230000-55fb-d9af-21b8-d6d7f0da085d	pri	Privzeto številčenje po letih YYYY-N	\N	\N	1	1	%l-%n	f	t
00230000-55fb-d9af-d946-b8365228dc6e	123	Privzeto številčenje kratkih šifer	\N	\N	100	3	%n	f	f
00230000-55fb-d9af-b322-ce8793cd8996	bcd	Globalno številčenje črtnih kod	\N	\N	1	9	%n	t	f
00230000-55fb-d9af-5fdd-034f6f388924	sif	Številčenje šifrant	\N	\N	1000	4	%n	f	f
00230000-55fb-d9af-61b2-0b7381542038	tmp	Globalno številčenje začasnih številk	tmp	\N	1000	5	%l%n	t	t
\.


--
-- TOC entry 2934 (class 0 OID 20002790)
-- Dependencies: 172
-- Data for Name: stevilcenjekonfig; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjekonfig (id, stevilcenje_id, dok) FROM stdin;
00240000-55fb-d9af-3cb5-85f59660887c	00230000-55fb-d9af-5fdd-034f6f388924	popa
00240000-55fb-d9af-68bd-4ffc16138721	00230000-55fb-d9af-5fdd-034f6f388924	oseba
00240000-55fb-d9af-9858-af4cd56f7a5b	00230000-55fb-d9af-5fdd-034f6f388924	sezona
00240000-55fb-d9af-95ac-a1e56b966ce6	00230000-55fb-d9af-d946-b8365228dc6e	prostor
00240000-55fb-d9af-9bd9-6cd5036fae16	00230000-55fb-d9af-5fdd-034f6f388924	besedilo
00240000-55fb-d9af-430f-69cd8a2c2b1d	00230000-55fb-d9af-5fdd-034f6f388924	uprizoritev
00240000-55fb-d9af-0fea-897b169f8528	00230000-55fb-d9af-5fdd-034f6f388924	funkcija
00240000-55fb-d9af-f5f6-68b98fc8ffeb	00230000-55fb-d9af-5fdd-034f6f388924	tipfunkcije
00240000-55fb-d9af-1d0a-8e03adea43b3	00230000-55fb-d9af-5fdd-034f6f388924	alternacija
00240000-55fb-d9af-c874-d280afb634e1	00230000-55fb-d9af-21b8-d6d7f0da085d	pogodba
00240000-55fb-d9af-ffba-09309cc0b517	00230000-55fb-d9af-5fdd-034f6f388924	zaposlitev
00240000-55fb-d9af-b25c-dad5f53896a5	00230000-55fb-d9af-5fdd-034f6f388924	zvrstuprizoritve
00240000-55fb-d9af-1b04-edf9f43f37c5	00230000-55fb-d9af-21b8-d6d7f0da085d	programdela
00240000-55fb-d9af-5552-5d9c9c9987d0	00230000-55fb-d9af-5fdd-034f6f388924	zapis
\.


--
-- TOC entry 2933 (class 0 OID 20002785)
-- Dependencies: 171
-- Data for Name: stevilcenjestanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjestanje (id, objid, leto, stevilka) FROM stdin;
5e639da6-7095-43c0-800c-a903945d8f16	00240000-55fb-d9af-3cb5-85f59660887c	0	1001
\.


--
-- TOC entry 2980 (class 0 OID 20003263)
-- Dependencies: 218
-- Data for Name: strosekuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY strosekuprizoritve (id, uprizoritev_id, popa_id, naziv, vrednostdo, vrednostna, opis, tipstroska, sort, vrstastroska_id) FROM stdin;
00270000-55fb-d9b1-02dd-d918f3391ce1	000e0000-55fb-d9b1-e27d-c4e9ec4f7075	00080000-55fb-d9b0-8844-52f504a2e874	Nabava kostumov	600.50	20.00	Krila in maske	materialni	1	003b0000-55fb-d9af-19c2-44ea790c2ace
00270000-55fb-d9b1-3416-85235185c8e0	000e0000-55fb-d9b1-e27d-c4e9ec4f7075	00080000-55fb-d9b0-8844-52f504a2e874	Zavese	125.70	3.10	Modra in zelena zavesa	materialni	2	003b0000-55fb-d9af-19c2-44ea790c2ace
\.


--
-- TOC entry 2946 (class 0 OID 20002911)
-- Dependencies: 184
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 2961 (class 0 OID 20003094)
-- Dependencies: 199
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja) FROM stdin;
001a0000-55fb-d9b1-a1a9-9b15e76f31ed	00180000-55fb-d9b1-e93c-77abec9085b8	000c0000-55fb-d9b1-b5d0-e0a750c31b17	00090000-55fb-d9b0-f675-0fb0ae4cbe89	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55fb-d9b1-d035-d5328540e994	00180000-55fb-d9b1-e93c-77abec9085b8	000c0000-55fb-d9b1-ab3a-2d57641dc668	00090000-55fb-d9b0-193f-3770d3561d3c	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55fb-d9b1-2990-38d980d0ea4c	00180000-55fb-d9b1-e93c-77abec9085b8	000c0000-55fb-d9b1-f1c2-665233052a61	00090000-55fb-d9b0-cf7c-dbff8c852638	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55fb-d9b1-e1fe-124ac3a8c271	00180000-55fb-d9b1-e93c-77abec9085b8	000c0000-55fb-d9b1-4cc2-e1abc8496e88	00090000-55fb-d9b0-34d3-b31547c68534	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55fb-d9b1-a98c-9e2786781513	00180000-55fb-d9b1-e93c-77abec9085b8	000c0000-55fb-d9b1-042d-6ba3f8908e44	00090000-55fb-d9b0-f05c-59a88ad20cbd	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55fb-d9b1-9068-02a00d5adfac	00180000-55fb-d9b1-4c24-cdfeb216dee9	\N	00090000-55fb-d9b0-f05c-59a88ad20cbd	2015-08-01 20:00:00	2015-08-01 23:00:00	\N	\N	2.00
\.


--
-- TOC entry 2983 (class 0 OID 20003302)
-- Dependencies: 221
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, sifra, ime, opis, imezenski, podrocje) FROM stdin;
000f0000-55fb-d9af-63f9-fc34d6ea7216	01	Avtor	Avtorji	Avtorka	umetnik
000f0000-55fb-d9af-63ff-d944c663fbea	02	Priredba	Priredba	Priredba	umetnik
000f0000-55fb-d9af-1a1f-ad28e97e227d	03	Prevod	Prevod	Prevod	umetnik
000f0000-55fb-d9af-781a-f099d2591e8b	04	Režija	Režija	Režija	umetnik
000f0000-55fb-d9af-3963-74892df2fe89	05	Dramaturgija	Dramaturgija	Dramaturgija	umetnik
000f0000-55fb-d9af-2ca7-897a7f5ace82	06	Scenografija	Scenografija	Scenografija	umetnik
000f0000-55fb-d9af-cb11-c7812b15224b	07	Kostumografija	Kostumografija	Kostumografija	umetnik
000f0000-55fb-d9af-aeb2-2ff45be60e51	08	Koreografija	Koreografija	Koreografija	umetnik
000f0000-55fb-d9af-508d-f027d46c1d49	09	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	umetnik
000f0000-55fb-d9af-de7c-25cff0738fa7	10	Oblikovanje maske	Oblikovanje maske	Oblikovanje maske	umetnik
000f0000-55fb-d9af-5ed9-7bd71ecf626b	11	Lektorstvo	Lektorstvo	Lektorstvo	umetnik
000f0000-55fb-d9af-c914-b62ffb7efd85	12	Glasbeni soustvarjalec	Glasbeni soustvarjalci	Glasbena soustvarjalka	umetnik
000f0000-55fb-d9af-ce95-1adc7c3e8cce	13	Intermedijski ustvarjalec	Intermedijski ustvarjalci	Intermedijski ustvarjalka	umetnik
000f0000-55fb-d9af-cbeb-cd9ae73255f5	14	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	umetnik
000f0000-55fb-d9af-88a6-ac22774d241e	15	Vloga	Intermedijski ustvarjalci	Intermedijska ustvarjalka	igralec
000f0000-55fb-d9af-45ef-034024bc6c21	16	Produkcija, mentorstvo	Produkcija, mentorstvo	Produkcija, mentorstvo	umetnik
000f0000-55fb-d9af-91b1-0c86325d9ac4	17	Tehnična podpora	Tehnična podpora	Tehnična podpora	tehnik
000f0000-55fb-d9af-4e7d-c56ba91deae7	18	Inšpicient	Inšpicienti	Inšpicientka	inspicient
\.


--
-- TOC entry 2996 (class 0 OID 20003546)
-- Dependencies: 234
-- Data for Name: tipprogramskeenote; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipprogramskeenote (id, sifra, naziv, koprodukcija, maxfaktor, maxvsi) FROM stdin;
002b0000-55fb-d9af-0560-967d591c4602	01	Velika predstava	f	1.00	1.00
002b0000-55fb-d9af-025b-5c0401a82a07	02	Mala predstava	f	0.50	0.50
002b0000-55fb-d9af-9fd3-eb771e145abe	03	Mala koprodukcija	t	0.40	1.00
002b0000-55fb-d9af-0235-6b9dcc4fb3f3	04	Srednja koprodukcija	t	0.70	2.00
002b0000-55fb-d9af-a5d1-e6e1511cce58	05	Velika koprodukcija	t	1.00	3.00
\.


--
-- TOC entry 2951 (class 0 OID 20002973)
-- Dependencies: 189
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 2938 (class 0 OID 20002820)
-- Dependencies: 176
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-55fb-d9af-3f93-c400fff12e0d	Konzolni	$2y$05$NS4xMjkyMTcwMzExMjAxROjzgyWuDtwGp16z5EUgZI8qqNFglObAy	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-55fb-d9b0-1bfa-c05aa63b6066	testni uporabnik za inšpicienta	$2y$05$NS4xMjkyMTcwMzExMjAxROxkJ1B6xAXex6EZLIwJfWzRJ8DpfecFO	t	\N	\N	\N	ivo@ifigenija.si	\N	\N	\N
00010000-55fb-d9b0-7601-82dc8b456c15	testni uporabnik za Tehničnega vodjo	$2y$05$NS4xMjkyMTcwMzExMjAxROu/kXWR9sP9oamkesKuxXLbxkCb387.G	t	\N	\N	\N	tona@ifigenija.si	\N	\N	\N
00010000-55fb-d9b0-fd95-662da719b033	testni uporabnik za igralca	$2y$05$NS4xMjkyMTcwMzExMjAxRO/hLCgClfERRsfCAFYwxNCcFIVjP2982	t	\N	\N	\N	irena@ifigenija.si	\N	\N	\N
00010000-55fb-d9b0-4f4d-bde4dd35054f	testni uporabnik vnašalca termina storitev (TerminStoritve-vse)	$2y$05$NS4xMjkyMTcwMzExMjAxROT6.kTHqEq4.wa2SOnf124/N14m9qeP.	t	\N	\N	\N	tatjana@ifigenija.si	\N	\N	\N
00010000-55fb-d9b0-68d6-48ee6613bbd8	testni uporabnik, ki je inšpicient brez zapisov v TerminStoritve	$2y$05$NS4xMjkyMTcwMzExMjAxROHau47Dtb7CME5.nlWwBVM.nusFP.ra2	t	\N	\N	\N	joze@ifigenija.si	\N	\N	\N
00010000-55fb-d9b0-5731-1c137796db7d	testna uporabnica, ki je planerka	$2y$05$NS4xMjkyMTcwMzExMjAxRO.B/uJO3C7QRNhdX9Q2hTLQsSupj1V1S	t	\N	\N	\N	petra@ifigenija.si	\N	\N	\N
00010000-55fb-d9b0-9ace-0fdf85ccd9a9	testni uporabnik, ki dobi ifi-all vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROv2d7jqhaV/Mz3EIsKoi7UoFR.SDSMBm	t	\N	\N	\N	ali@ifigenija.si	\N	\N	\N
00010000-55fb-d9b0-834d-5610c79114cd	testni uporabnik, ki dobi ifi-readall vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROYB9g.gnkufr1l/gWK6mkx.ySqrOWnJC	t	\N	\N	\N	berta@ifigenija.si	\N	\N	\N
00010000-55fb-d9b0-4883-a52793c1eae7	testni uporabnik, ki dobi aaa-write dovoljenje	$2y$05$NS4xMjkyMTcwMzExMjAxRORujYObKX.DzpXVYbePkiJkHqg0/Ylya	t	\N	\N	\N	aaron@ifigenija.si	\N	\N	\N
00010000-55fb-d9b0-5269-0aa7843417a5	testni uporabnik ki dobi vsa posamezna dovoljenja	$2y$05$NS4xMjkyMTcwMzExMjAxRO2ymwxVXTr7U4Ncdn.bN49E8rLw9Jg0O	t	\N	\N	\N	vesna@ifigenija.si	\N	\N	\N
00010000-55fb-d9af-93ee-e0ee08360ffc	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 2987 (class 0 OID 20003351)
-- Dependencies: 225
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, producent_id, sifra, faza, naslov, podnaslov, delovninaslov, internacionalninaslov, naslovizvirnika, podnaslovizvirnika, datumzacstudija, stevilovaj, planiranostevilovaj, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, krstna, prvaslovenska, kratkinaslov, maticnioder_id) FROM stdin;
000e0000-55fb-d9b1-5cf8-793c31e06505	00160000-55fb-d9b0-9ba8-db51e40c5f7f	\N	00140000-55fb-d9af-4839-7bac3c0ec28c	\N	0001	produkcija	Sen kresne noči		Sanje	\N	\N	\N	2016-02-01	\N	\N	2016-06-01	1	William Shakespeare	f	2				\N	f	\N	\N		00220000-55fb-d9b0-ccb0-87f931bde493
000e0000-55fb-d9b1-e27d-c4e9ec4f7075	00160000-55fb-d9b0-54e1-7c839808bc77	\N	00140000-55fb-d9af-d25f-ced20dd5493c	\N	0002	predprodukcija-ideja	Smoletov vrt			\N	\N	\N	2016-01-01	\N	\N	2016-04-20	2	B. Hočevar	f	2				\N	f	\N	\N		00220000-55fb-d9b0-12b0-cc7850c200d3
000e0000-55fb-d9b1-ba3e-4813731f826f	\N	\N	00140000-55fb-d9af-d25f-ced20dd5493c	00190000-55fb-d9b0-26da-647a5eee8738	0003	postprodukcija	Kisli maček			\N	\N	\N	2016-02-01	\N	\N	2016-04-20	2	Caryl Churchill	t	2				\N	f	\N	\N		00220000-55fb-d9b0-ccb0-87f931bde493
000e0000-55fb-d9b1-d976-5f04308aff5a	\N	\N	00140000-55fb-d9af-d25f-ced20dd5493c	00190000-55fb-d9b0-26da-647a5eee8738	0004	postprodukcija	Vladimir			\N	\N	\N	2017-03-01	\N	\N	2017-04-20	2	Matjaž Zupančič	t	2				\N	f	\N	\N		00220000-55fb-d9b0-ccb0-87f931bde493
000e0000-55fb-d9b1-5c8c-fb1b0faff16e	\N	\N	00140000-55fb-d9af-d25f-ced20dd5493c	00190000-55fb-d9b0-26da-647a5eee8738	0005	postprodukcija	Španska princesa			\N	\N	\N	2017-04-01	\N	\N	2017-05-20	1	Nina Kokelj	f	1				\N	f	\N	\N		00220000-55fb-d9b0-5734-42180292b22d
000e0000-55fb-d9b1-7c60-6f99307c955f	\N	\N	00140000-55fb-d9af-d25f-ced20dd5493c	00190000-55fb-d9b0-26da-647a5eee8738	0006	postprodukcija	Ne vemo datumov			\N	\N	\N	\N	\N	\N	\N	1	Nandi Frafar	f	1				\N	f	\N	\N		00220000-55fb-d9b0-5734-42180292b22d
\.


--
-- TOC entry 2956 (class 0 OID 20003037)
-- Dependencies: 194
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, uprizoritev_id, vrsta, zaporedna, porocilo) FROM stdin;
00200000-55fb-d9b1-fac8-7e82ddac40eb	000e0000-55fb-d9b1-e27d-c4e9ec4f7075	\N	1	
00200000-55fb-d9b1-4106-b75a2e04c8e6	000e0000-55fb-d9b1-e27d-c4e9ec4f7075	\N	2	
00200000-55fb-d9b1-2ad5-7f3e402bd760	000e0000-55fb-d9b1-e27d-c4e9ec4f7075	\N	3	
00200000-55fb-d9b1-abe3-9d33561bdcce	000e0000-55fb-d9b1-e27d-c4e9ec4f7075	\N	4	
00200000-55fb-d9b1-6f8c-b5e16cc11059	000e0000-55fb-d9b1-e27d-c4e9ec4f7075	\N	5	
\.


--
-- TOC entry 2970 (class 0 OID 20003165)
-- Dependencies: 208
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 2981 (class 0 OID 20003277)
-- Dependencies: 219
-- Data for Name: vrstastroska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstastroska (id, skupina, podskupina, naziv, opis) FROM stdin;
003b0000-55fb-d9af-a0d9-97b5a9461e8b	1	0	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE
003b0000-55fb-d9af-b980-e325844edcd2	1	1	Storitve varovanja zgradb in prostorov	storitve varovanja zgradb in prostorov (npr. gasilci na predstavah)
003b0000-55fb-d9af-b9b2-b336937c7cf1	1	2	Založniške in tiskarske storitve	založniške in tiskarske storitve
003b0000-55fb-d9af-5273-902f6b18b06f	1	3	Časopisi, revije, knjige in strokovna literatura	časopisi, revije, knjige in strokovna literatura
003b0000-55fb-d9af-2bff-6a9755b5a17e	1	4	Stroški prevajalskih storitev	stroški prevajalskih storitev
003b0000-55fb-d9af-7922-2e34ed49b1e1	1	5	Stroški oglaševalskih storitev	stroški oglaševalskih storitev
003b0000-55fb-d9af-df48-0c0b03dfc7c8	1	6	Izdatki za reprezentanco	izdatki za reprezentanco
003b0000-55fb-d9af-6ba5-ca0f7e3c92ca	2	0	POSEBNI MATERIAL IN STORITVE	POSEBNI MATERIAL IN STORITVE
003b0000-55fb-d9af-19c2-44ea790c2ace	2	1	Drugi posebni material in storitve	drugi posebni material in storitve (npr. za instrumete - navedite)
003b0000-55fb-d9af-4dc1-c4a8ff685cdf	2	2	Oprema predstave – stroški rekvizitov	Oprema predstave – stroški rekvizitov
003b0000-55fb-d9af-d59c-d909fbb5ee8f	2	3	Oprema predstave – stroški kostumov	Oprema predstave – stroški kostumov
003b0000-55fb-d9af-cd1e-f772339c519a	2	4	Oprema predstave – stroški scenske opreme	Oprema predstave – stroški scenske opreme
003b0000-55fb-d9af-0faa-2ad62a964a38	2	5	Oprema predstave – stroški avdio in video opreme	Oprema predstave – stroški avdio in video opreme
003b0000-55fb-d9af-bf5c-fd69cf9edaee	3	0	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE
003b0000-55fb-d9af-6985-f9e9d380dc50	3	1	Poštnina in kurirske storitve	poštnina in kurirske storitve
003b0000-55fb-d9af-35b6-4e06a8f8243e	4	0	PREVOZNI STROŠKI IN STORITVE	PREVOZNI STROŠKI IN STORITVE
003b0000-55fb-d9af-aa77-5f7497fbdae1	4	1	Goriva in maziva za prevozna sredstva	goriva in maziva za prevozna sredstva
003b0000-55fb-d9af-2ee2-ff15d3b10498	4	2	Najem vozil in selitveni stroški	najem vozil in selitveni stroški
003b0000-55fb-d9af-c0fc-e40ea3e58999	4	3	Drugi prevozni in transportni stroški 	drugi prevozni in transportni stroški (navedite)
003b0000-55fb-d9af-da16-829eb49366e0	5	0	IZDATKI ZA SLUŽBENA POTOVANJA	IZDATKI ZA SLUŽBENA POTOVANJA
003b0000-55fb-d9af-32f7-abb9dfbd8202	5	1	Dnevnice za službena potovanja v državi in tujini	dnevnice za službena potovanja v državi in tujini
003b0000-55fb-d9af-ca7e-7d64d7719250	5	2	Hotelske in restavra. storitve v državi in tujini	hotelske in restavra. storitve v državi in tujini
003b0000-55fb-d9af-c216-5a010a990cf4	5	3	Stroški prevoza v državi in tujini	stroški prevoza v državi in tujini
003b0000-55fb-d9af-0aa6-d408bb051a72	5	4	Drugi izdatki za službena potovanja	drugi izdatki za službena potovanja (navedite)
003b0000-55fb-d9af-40ac-e8ff7554729d	6	0	NAJEMNINE IN ZAKUPNINE	NAJEMNINE IN ZAKUPNINE
003b0000-55fb-d9af-3743-d8d58b45e108	6	1	Druge najemnine, zakupnine in licenčnine	druge najemnine, zakupnine in licenčnine (npr. najem notnega materiala, instrumentov - navedite)
003b0000-55fb-d9af-e720-04f2221bdaf4	7	0	DRUGI OPERATIVNI ODHODKI	DRUGI OPERATIVNI ODHODKI
003b0000-55fb-d9af-7c0b-2de6057c04fc	7	1	Izdatki za strok. izobraževanje zap.	izdatki za strok. izobraževanje zap.(vezani na program. enote)  
\.


--
-- TOC entry 2999 (class 0 OID 20003593)
-- Dependencies: 237
-- Data for Name: vrstazapisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstazapisa (id, oznaka, naziv, aktiven, znacka, ikona, upor, datknj) FROM stdin;
\.


--
-- TOC entry 2998 (class 0 OID 20003565)
-- Dependencies: 236
-- Data for Name: zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapis (id, vrsta_id, datoteka_id, mapa_id, avtor_id, zaklenil_id, tip, zaklenjen, datumzaklepanja, identifier, subject, title, description, coverage, creator, language, date, publisher, relation, rights, source, upor, datknj, standard, lokacija) FROM stdin;
\.


--
-- TOC entry 3000 (class 0 OID 20003605)
-- Dependencies: 238
-- Data for Name: zapislastnik; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapislastnik (id, zapis_id, lastnik, classlastnika, datum, upor, datknj) FROM stdin;
\.


--
-- TOC entry 2977 (class 0 OID 20003237)
-- Dependencies: 215
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, sifra, status, delovnomesto, zacetek, konec, tip, delovnaobveza, malica, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci) FROM stdin;
00100000-55fb-d9b1-4eb7-3d59a0cc0a58	00090000-55fb-d9b0-193f-3770d3561d3c	01	A	Mojster	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55fb-d9b1-c717-856f12e9ddd2	00090000-55fb-d9b0-cf7c-dbff8c852638	02	A	Igralec	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55fb-d9b1-d74e-b1a8131cdd9f	00090000-55fb-d9b0-f460-4cceab9bfa12	03	A	Natakar	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55fb-d9b1-a684-e4714582b27d	00090000-55fb-d9b0-a235-84aa66bd6903	04	A	Mizar	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55fb-d9b1-7fe6-fe725843e883	00090000-55fb-d9b0-f675-0fb0ae4cbe89	05	A	Šivilja	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55fb-d9b1-4ed4-178bdd249ec0	00090000-55fb-d9b0-d525-75db46f60d5d	06	A	Inšpicient	2010-02-01	2010-02-01	1	2		t	f	f	t
\.


--
-- TOC entry 2958 (class 0 OID 20003073)
-- Dependencies: 196
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id, oseba_id) FROM stdin;
\.


--
-- TOC entry 2986 (class 0 OID 20003341)
-- Dependencies: 224
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, sifra, naziv, opis) FROM stdin;
00140000-55fb-d9af-4839-7bac3c0ec28c	01	Drama	drama (SURS 01)
00140000-55fb-d9af-7925-f773ff24012d	02	Opera	opera (SURS 02)
00140000-55fb-d9af-2591-11bf5e3a5e39	03	Balet	balet (SURS 03)
00140000-55fb-d9af-f55d-9b80ec976f5d	04	Plesne prireditve	plesne prireditve (SURS 04)
00140000-55fb-d9af-7a47-db909a5baa15	05	Lutkovno gledališče	lutkovno gledališče (SURS 05)
00140000-55fb-d9af-d25f-ced20dd5493c	06	Raziskovalno gledališče	raziskovalno gledališče (SURS 06)
00140000-55fb-d9af-bd04-e6d1d6876269	07	Drugo	drugo (SURS 07)
\.


--
-- TOC entry 2976 (class 0 OID 20003227)
-- Dependencies: 214
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, sifra, naziv, opis) FROM stdin;
\.


--
-- TOC entry 2478 (class 2606 OID 20002874)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2660 (class 2606 OID 20003400)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2656 (class 2606 OID 20003390)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2620 (class 2606 OID 20003261)
-- Name: avtorbesedila_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT avtorbesedila_pkey PRIMARY KEY (id);


--
-- TOC entry 2630 (class 2606 OID 20003300)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2717 (class 2606 OID 20003645)
-- Name: datoteka_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT datoteka_pkey PRIMARY KEY (id);


--
-- TOC entry 2532 (class 2606 OID 20003062)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2547 (class 2606 OID 20003083)
-- Name: dogodeksplosni_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodeksplosni
    ADD CONSTRAINT dogodeksplosni_pkey PRIMARY KEY (id);


--
-- TOC entry 2693 (class 2606 OID 20003563)
-- Name: drugivir_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT drugivir_pkey PRIMARY KEY (id);


--
-- TOC entry 2512 (class 2606 OID 20002999)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2667 (class 2606 OID 20003455)
-- Name: enotaprograma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT enotaprograma_pkey PRIMARY KEY (id);


--
-- TOC entry 2605 (class 2606 OID 20003223)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2526 (class 2606 OID 20003035)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2520 (class 2606 OID 20003013)
-- Name: kontaktnaoseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT kontaktnaoseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2569 (class 2606 OID 20003130)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2711 (class 2606 OID 20003622)
-- Name: mapa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT mapa_pkey PRIMARY KEY (id);


--
-- TOC entry 2715 (class 2606 OID 20003629)
-- Name: mapa_zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT mapa_zapis_pkey PRIMARY KEY (mapa_id, zapis_id);


--
-- TOC entry 2722 (class 2606 OID 20003653)
-- Name: mapaacl_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT mapaacl_pkey PRIMARY KEY (id);


--
-- TOC entry 2450 (class 2606 OID 19946842)
-- Name: migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY migrations
    ADD CONSTRAINT migrations_pkey PRIMARY KEY (version);


--
-- TOC entry 2581 (class 2606 OID 20003157)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2505 (class 2606 OID 20002971)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2482 (class 2606 OID 20002883)
-- Name: optionvalue_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT optionvalue_pkey PRIMARY KEY (id);


--
-- TOC entry 2485 (class 2606 OID 20002907)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2476 (class 2606 OID 20002863)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2469 (class 2606 OID 20002848)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2584 (class 2606 OID 20003163)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2598 (class 2606 OID 20003199)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2642 (class 2606 OID 20003336)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2494 (class 2606 OID 20002935)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2502 (class 2606 OID 20002959)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2677 (class 2606 OID 20003516)
-- Name: postavkacdve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkacdve
    ADD CONSTRAINT postavkacdve_pkey PRIMARY KEY (id);


--
-- TOC entry 2573 (class 2606 OID 20003136)
-- Name: postavkaracuna_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT postavkaracuna_pkey PRIMARY KEY (id);


--
-- TOC entry 2500 (class 2606 OID 20002949)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2524 (class 2606 OID 20003023)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2579 (class 2606 OID 20003148)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2681 (class 2606 OID 20003525)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2683 (class 2606 OID 20003533)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2674 (class 2606 OID 20003503)
-- Name: programdela_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT programdela_pkey PRIMARY KEY (id);


--
-- TOC entry 2688 (class 2606 OID 20003544)
-- Name: programskaenotasklopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT programskaenotasklopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2591 (class 2606 OID 20003181)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2567 (class 2606 OID 20003121)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2561 (class 2606 OID 20003112)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2637 (class 2606 OID 20003324)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2618 (class 2606 OID 20003254)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2461 (class 2606 OID 20002819)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2596 (class 2606 OID 20003190)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2467 (class 2606 OID 20002837)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2471 (class 2606 OID 20002857)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2603 (class 2606 OID 20003208)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2575 (class 2606 OID 20003143)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2549 (class 2606 OID 20003092)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2458 (class 2606 OID 20002807)
-- Name: stevilcenje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenje
    ADD CONSTRAINT stevilcenje_pkey PRIMARY KEY (id);


--
-- TOC entry 2455 (class 2606 OID 20002795)
-- Name: stevilcenjekonfig_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT stevilcenjekonfig_pkey PRIMARY KEY (id);


--
-- TOC entry 2452 (class 2606 OID 20002789)
-- Name: stevilcenjestanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjestanje
    ADD CONSTRAINT stevilcenjestanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2626 (class 2606 OID 20003273)
-- Name: strosekuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT strosekuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2491 (class 2606 OID 20002916)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2555 (class 2606 OID 20003103)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2633 (class 2606 OID 20003311)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2690 (class 2606 OID 20003556)
-- Name: tipprogramskeenote_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipprogramskeenote
    ADD CONSTRAINT tipprogramskeenote_pkey PRIMARY KEY (id);


--
-- TOC entry 2510 (class 2606 OID 20002984)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2463 (class 2606 OID 20002832)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2654 (class 2606 OID 20003369)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2530 (class 2606 OID 20003045)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2587 (class 2606 OID 20003171)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2628 (class 2606 OID 20003285)
-- Name: vrstastroska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstastroska
    ADD CONSTRAINT vrstastroska_pkey PRIMARY KEY (id);


--
-- TOC entry 2704 (class 2606 OID 20003603)
-- Name: vrstazapisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstazapisa
    ADD CONSTRAINT vrstazapisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2701 (class 2606 OID 20003587)
-- Name: zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT zapis_pkey PRIMARY KEY (id);


--
-- TOC entry 2707 (class 2606 OID 20003611)
-- Name: zapislastnik_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT zapislastnik_pkey PRIMARY KEY (id);


--
-- TOC entry 2614 (class 2606 OID 20003245)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2545 (class 2606 OID 20003077)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2646 (class 2606 OID 20003349)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2611 (class 2606 OID 20003235)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2533 (class 1259 OID 20003071)
-- Name: dogodki_konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_konec ON dogodek USING btree (konec);


--
-- TOC entry 2534 (class 1259 OID 20003072)
-- Name: dogodki_razred; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_razred ON dogodek USING btree (razred);


--
-- TOC entry 2535 (class 1259 OID 20003070)
-- Name: dogodki_zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2536 (class 1259 OID 20003069)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2537 (class 1259 OID 20003068)
-- Name: idx_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2622 (class 1259 OID 20003274)
-- Name: idx_11ffe6e05c75296c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e05c75296c ON strosekuprizoritve USING btree (vrstastroska_id);


--
-- TOC entry 2623 (class 1259 OID 20003275)
-- Name: idx_11ffe6e062b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e062b4ffca ON strosekuprizoritve USING btree (uprizoritev_id);


--
-- TOC entry 2624 (class 1259 OID 20003276)
-- Name: idx_11ffe6e06beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e06beede51 ON strosekuprizoritve USING btree (popa_id);


--
-- TOC entry 2708 (class 1259 OID 20003624)
-- Name: idx_14a5d6d3727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d3727aca70 ON mapa USING btree (parent_id);


--
-- TOC entry 2709 (class 1259 OID 20003623)
-- Name: idx_14a5d6d38a4a6c12; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d38a4a6c12 ON mapa USING btree (lastnik_id);


--
-- TOC entry 2492 (class 1259 OID 20002937)
-- Name: idx_1c7adba5ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba5ee4b985a ON popa USING btree (drzava_id);


--
-- TOC entry 2582 (class 1259 OID 20003164)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2695 (class 1259 OID 20003591)
-- Name: idx_1ed92829253c4123; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829253c4123 ON zapis USING btree (avtor_id);


--
-- TOC entry 2696 (class 1259 OID 20003590)
-- Name: idx_1ed9282957ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282957ed422f ON zapis USING btree (mapa_id);


--
-- TOC entry 2697 (class 1259 OID 20003592)
-- Name: idx_1ed9282987ff3295; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282987ff3295 ON zapis USING btree (zaklenil_id);


--
-- TOC entry 2698 (class 1259 OID 20003589)
-- Name: idx_1ed92829a54dbb1f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829a54dbb1f ON zapis USING btree (datoteka_id);


--
-- TOC entry 2699 (class 1259 OID 20003588)
-- Name: idx_1ed92829ef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829ef943358 ON zapis USING btree (vrsta_id);


--
-- TOC entry 2576 (class 1259 OID 20003150)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2577 (class 1259 OID 20003149)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2528 (class 1259 OID 20003046)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2606 (class 1259 OID 20003224)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2607 (class 1259 OID 20003226)
-- Name: idx_23aeb9586b361365; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9586b361365 ON funkcija USING btree (tipfunkcije_id);


--
-- TOC entry 2608 (class 1259 OID 20003225)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2517 (class 1259 OID 20003015)
-- Name: idx_2942b10710389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b10710389148 ON kontaktnaoseba USING btree (oseba_id);


--
-- TOC entry 2518 (class 1259 OID 20003014)
-- Name: idx_2942b1076beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b1076beede51 ON kontaktnaoseba USING btree (popa_id);


--
-- TOC entry 2686 (class 1259 OID 20003545)
-- Name: idx_2d901816d6bc69d6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2d901816d6bc69d6 ON programskaenotasklopa USING btree (programrazno_id);


--
-- TOC entry 2638 (class 1259 OID 20003338)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2639 (class 1259 OID 20003339)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2640 (class 1259 OID 20003340)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2705 (class 1259 OID 20003612)
-- Name: idx_2eaff9dcaf91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2eaff9dcaf91ecd ON zapislastnik USING btree (zapis_id);


--
-- TOC entry 2647 (class 1259 OID 20003374)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2648 (class 1259 OID 20003371)
-- Name: idx_344a77a7c3b0d59; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a7c3b0d59 ON uprizoritev USING btree (maticnioder_id);


--
-- TOC entry 2649 (class 1259 OID 20003375)
-- Name: idx_344a77a853a965c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a853a965c ON uprizoritev USING btree (producent_id);


--
-- TOC entry 2650 (class 1259 OID 20003373)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2651 (class 1259 OID 20003372)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2507 (class 1259 OID 20002986)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2508 (class 1259 OID 20002985)
-- Name: idx_37f6541a6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a6beede51 ON trr USING btree (popa_id);


--
-- TOC entry 2483 (class 1259 OID 20002910)
-- Name: idx_466966d769e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_466966d769e8d4 ON oseba USING btree (naslov_id);


--
-- TOC entry 2594 (class 1259 OID 20003191)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2473 (class 1259 OID 20002864)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2474 (class 1259 OID 20002865)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2599 (class 1259 OID 20003211)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2600 (class 1259 OID 20003210)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2601 (class 1259 OID 20003209)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2521 (class 1259 OID 20003024)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2522 (class 1259 OID 20003025)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2453 (class 1259 OID 20002797)
-- Name: idx_6054e804ff55f926; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_6054e804ff55f926 ON stevilcenjekonfig USING btree (stevilcenje_id);


--
-- TOC entry 2556 (class 1259 OID 20003116)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2557 (class 1259 OID 20003114)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2558 (class 1259 OID 20003113)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2559 (class 1259 OID 20003115)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2464 (class 1259 OID 20002838)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2465 (class 1259 OID 20002839)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2585 (class 1259 OID 20003172)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2718 (class 1259 OID 20003646)
-- Name: idx_781826c67e3c61f9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_781826c67e3c61f9 ON datoteka USING btree (owner_id);


--
-- TOC entry 2621 (class 1259 OID 20003262)
-- Name: idx_7ab77b79f35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7ab77b79f35157b1 ON avtorbesedila USING btree (besedilo_id);


--
-- TOC entry 2719 (class 1259 OID 20003654)
-- Name: idx_7adc957157ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc957157ed422f ON mapaacl USING btree (mapa_id);


--
-- TOC entry 2720 (class 1259 OID 20003655)
-- Name: idx_7adc9571fa6311ef; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc9571fa6311ef ON mapaacl USING btree (perm_id);


--
-- TOC entry 2571 (class 1259 OID 20003137)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2615 (class 1259 OID 20003255)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2616 (class 1259 OID 20003256)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2668 (class 1259 OID 20003460)
-- Name: idx_8787a0e54ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e54ae1cd1c ON enotaprograma USING btree (gostitelj_id);


--
-- TOC entry 2669 (class 1259 OID 20003459)
-- Name: idx_8787a0e55d0da56c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e55d0da56c ON enotaprograma USING btree (drzavagostovanja_id);


--
-- TOC entry 2670 (class 1259 OID 20003456)
-- Name: idx_8787a0e562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e562b4ffca ON enotaprograma USING btree (uprizoritev_id);


--
-- TOC entry 2671 (class 1259 OID 20003457)
-- Name: idx_8787a0e57222d84b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e57222d84b ON enotaprograma USING btree (tipprogramskeenote_id);


--
-- TOC entry 2672 (class 1259 OID 20003458)
-- Name: idx_8787a0e5771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e5771ec7bd ON enotaprograma USING btree (program_dela_id);


--
-- TOC entry 2496 (class 1259 OID 20002951)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2497 (class 1259 OID 20002950)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2498 (class 1259 OID 20002952)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2588 (class 1259 OID 20003185)
-- Name: idx_952dd21969e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd21969e8d4 ON prostor USING btree (naslov_id);


--
-- TOC entry 2589 (class 1259 OID 20003184)
-- Name: idx_952dd2196beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd2196beede51 ON prostor USING btree (popa_id);


--
-- TOC entry 2678 (class 1259 OID 20003526)
-- Name: idx_97af082e38c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e38c06eb ON produkcijadelitev USING btree (enotaprograma_id);


--
-- TOC entry 2679 (class 1259 OID 20003527)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2661 (class 1259 OID 20003404)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2662 (class 1259 OID 20003405)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2663 (class 1259 OID 20003402)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2664 (class 1259 OID 20003403)
-- Name: idx_a4b7244fa4976613; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fa4976613 ON alternacija USING btree (zaposlitev_id);


--
-- TOC entry 2612 (class 1259 OID 20003246)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2562 (class 1259 OID 20003125)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2563 (class 1259 OID 20003124)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2564 (class 1259 OID 20003122)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2565 (class 1259 OID 20003123)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2657 (class 1259 OID 20003392)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2658 (class 1259 OID 20003391)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2527 (class 1259 OID 20003036)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2675 (class 1259 OID 20003517)
-- Name: idx_dba42fe79e3adf2c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_dba42fe79e3adf2c ON postavkacdve USING btree (programdela_id);


--
-- TOC entry 2694 (class 1259 OID 20003564)
-- Name: idx_e7d4cf2638c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e7d4cf2638c06eb ON drugivir USING btree (enotaprograma_id);


--
-- TOC entry 2712 (class 1259 OID 20003630)
-- Name: idx_e9f8ee8257ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee8257ed422f ON mapa_zapis USING btree (mapa_id);


--
-- TOC entry 2713 (class 1259 OID 20003631)
-- Name: idx_e9f8ee82af91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee82af91ecd ON mapa_zapis USING btree (zapis_id);


--
-- TOC entry 2479 (class 1259 OID 20002885)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2480 (class 1259 OID 20002884)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2488 (class 1259 OID 20002917)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2489 (class 1259 OID 20002918)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2543 (class 1259 OID 20003078)
-- Name: idx_f44a386d10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_f44a386d10389148 ON zasedenost USING btree (oseba_id);


--
-- TOC entry 2551 (class 1259 OID 20003106)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2552 (class 1259 OID 20003105)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2553 (class 1259 OID 20003104)
-- Name: idx_fef7d84ba81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84ba81ccef6 ON terminstoritve USING btree (dogodek_id);


--
-- TOC entry 2538 (class 1259 OID 20003064)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2539 (class 1259 OID 20003065)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2540 (class 1259 OID 20003063)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2541 (class 1259 OID 20003067)
-- Name: uniq_11e93b5dbbc7a989; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dbbc7a989 ON dogodek USING btree (dogodek_splosni_id);


--
-- TOC entry 2542 (class 1259 OID 20003066)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2495 (class 1259 OID 20002936)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2513 (class 1259 OID 20003000)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2514 (class 1259 OID 20003002)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2515 (class 1259 OID 20003001)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2516 (class 1259 OID 20003003)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2570 (class 1259 OID 20003131)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2643 (class 1259 OID 20003337)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2652 (class 1259 OID 20003370)
-- Name: uniq_344a77a559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_344a77a559828a3 ON uprizoritev USING btree (sifra);


--
-- TOC entry 2634 (class 1259 OID 20003312)
-- Name: uniq_3f50510d559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d559828a3 ON tipfunkcije USING btree (sifra);


--
-- TOC entry 2635 (class 1259 OID 20003313)
-- Name: uniq_3f50510d55cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d55cca980 ON tipfunkcije USING btree (ime);


--
-- TOC entry 2486 (class 1259 OID 20002908)
-- Name: uniq_466966d7559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7559828a3 ON oseba USING btree (sifra);


--
-- TOC entry 2487 (class 1259 OID 20002909)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2609 (class 1259 OID 20003236)
-- Name: uniq_5216fcb0559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5216fcb0559828a3 ON zvrstuprizoritve USING btree (sifra);


--
-- TOC entry 2459 (class 1259 OID 20002808)
-- Name: uniq_5a434fbc559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5a434fbc559828a3 ON stevilcenje USING btree (sifra);


--
-- TOC entry 2506 (class 1259 OID 20002972)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2456 (class 1259 OID 20002796)
-- Name: uniq_6054e804889a7556; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_6054e804889a7556 ON stevilcenjekonfig USING btree (dok);


--
-- TOC entry 2691 (class 1259 OID 20003557)
-- Name: uniq_7d834df4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_7d834df4559828a3 ON tipprogramskeenote USING btree (sifra);


--
-- TOC entry 2592 (class 1259 OID 20003183)
-- Name: uniq_952dd21937854736; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21937854736 ON prostor USING btree (naziv);


--
-- TOC entry 2593 (class 1259 OID 20003182)
-- Name: uniq_952dd219559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd219559828a3 ON prostor USING btree (sifra);


--
-- TOC entry 2665 (class 1259 OID 20003401)
-- Name: uniq_a4b7244f559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a4b7244f559828a3 ON alternacija USING btree (sifra);


--
-- TOC entry 2503 (class 1259 OID 20002960)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2644 (class 1259 OID 20003350)
-- Name: uniq_cede8e36559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_cede8e36559828a3 ON zvrstsurs USING btree (sifra);


--
-- TOC entry 2702 (class 1259 OID 20003604)
-- Name: uniq_de1c8aa1d55226c7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_de1c8aa1d55226c7 ON vrstazapisa USING btree (oznaka);


--
-- TOC entry 2684 (class 1259 OID 20003534)
-- Name: uniq_e6fc2028559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc2028559828a3 ON produkcijskahisa USING btree (sifra);


--
-- TOC entry 2685 (class 1259 OID 20003535)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2631 (class 1259 OID 20003301)
-- Name: uniq_ec773670ca2e5fcb; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ec773670ca2e5fcb ON besedilo USING btree (stevilka);


--
-- TOC entry 2550 (class 1259 OID 20003093)
-- Name: uniq_ecc8f8c5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ecc8f8c5559828a3 ON sezona USING btree (sifra);


--
-- TOC entry 2472 (class 1259 OID 20002858)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2751 (class 2606 OID 20003776)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2750 (class 2606 OID 20003781)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2746 (class 2606 OID 20003801)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2752 (class 2606 OID 20003771)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2748 (class 2606 OID 20003791)
-- Name: fk_11e93b5dbbc7a989; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dbbc7a989 FOREIGN KEY (dogodek_splosni_id) REFERENCES dogodeksplosni(id);


--
-- TOC entry 2747 (class 2606 OID 20003796)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2749 (class 2606 OID 20003786)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2786 (class 2606 OID 20003961)
-- Name: fk_11ffe6e05c75296c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e05c75296c FOREIGN KEY (vrstastroska_id) REFERENCES vrstastroska(id);


--
-- TOC entry 2785 (class 2606 OID 20003966)
-- Name: fk_11ffe6e062b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e062b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2784 (class 2606 OID 20003971)
-- Name: fk_11ffe6e06beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e06beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2818 (class 2606 OID 20004136)
-- Name: fk_14a5d6d3727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d3727aca70 FOREIGN KEY (parent_id) REFERENCES mapa(id);


--
-- TOC entry 2819 (class 2606 OID 20004131)
-- Name: fk_14a5d6d38a4a6c12; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d38a4a6c12 FOREIGN KEY (lastnik_id) REFERENCES uporabniki(id);


--
-- TOC entry 2734 (class 2606 OID 20003711)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2769 (class 2606 OID 20003886)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2813 (class 2606 OID 20004116)
-- Name: fk_1ed92829253c4123; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829253c4123 FOREIGN KEY (avtor_id) REFERENCES uporabniki(id);


--
-- TOC entry 2814 (class 2606 OID 20004111)
-- Name: fk_1ed9282957ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282957ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2812 (class 2606 OID 20004121)
-- Name: fk_1ed9282987ff3295; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282987ff3295 FOREIGN KEY (zaklenil_id) REFERENCES uporabniki(id);


--
-- TOC entry 2815 (class 2606 OID 20004106)
-- Name: fk_1ed92829a54dbb1f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829a54dbb1f FOREIGN KEY (datoteka_id) REFERENCES datoteka(id);


--
-- TOC entry 2816 (class 2606 OID 20004101)
-- Name: fk_1ed92829ef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829ef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstazapisa(id);


--
-- TOC entry 2767 (class 2606 OID 20003881)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2768 (class 2606 OID 20003876)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2745 (class 2606 OID 20003766)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2779 (class 2606 OID 20003926)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2777 (class 2606 OID 20003936)
-- Name: fk_23aeb9586b361365; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9586b361365 FOREIGN KEY (tipfunkcije_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2778 (class 2606 OID 20003931)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2740 (class 2606 OID 20003746)
-- Name: fk_2942b10710389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b10710389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2741 (class 2606 OID 20003741)
-- Name: fk_2942b1076beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b1076beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2765 (class 2606 OID 20003866)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2810 (class 2606 OID 20004091)
-- Name: fk_2d901816d6bc69d6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT fk_2d901816d6bc69d6 FOREIGN KEY (programrazno_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2789 (class 2606 OID 20003976)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2788 (class 2606 OID 20003981)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2787 (class 2606 OID 20003986)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 2817 (class 2606 OID 20004126)
-- Name: fk_2eaff9dcaf91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT fk_2eaff9dcaf91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id);


--
-- TOC entry 2791 (class 2606 OID 20004006)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2794 (class 2606 OID 20003991)
-- Name: fk_344a77a7c3b0d59; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a7c3b0d59 FOREIGN KEY (maticnioder_id) REFERENCES prostor(id);


--
-- TOC entry 2790 (class 2606 OID 20004011)
-- Name: fk_344a77a853a965c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a853a965c FOREIGN KEY (producent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2792 (class 2606 OID 20004001)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2793 (class 2606 OID 20003996)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2738 (class 2606 OID 20003736)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2739 (class 2606 OID 20003731)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2730 (class 2606 OID 20003696)
-- Name: fk_466966d769e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d769e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2731 (class 2606 OID 20003691)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2773 (class 2606 OID 20003906)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2727 (class 2606 OID 20003671)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2726 (class 2606 OID 20003676)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2774 (class 2606 OID 20003921)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2775 (class 2606 OID 20003916)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2776 (class 2606 OID 20003911)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2743 (class 2606 OID 20003751)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2742 (class 2606 OID 20003756)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2723 (class 2606 OID 20003656)
-- Name: fk_6054e804ff55f926; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT fk_6054e804ff55f926 FOREIGN KEY (stevilcenje_id) REFERENCES stevilcenje(id);


--
-- TOC entry 2757 (class 2606 OID 20003841)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2759 (class 2606 OID 20003831)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2760 (class 2606 OID 20003826)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2758 (class 2606 OID 20003836)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2725 (class 2606 OID 20003661)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2724 (class 2606 OID 20003666)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2770 (class 2606 OID 20003891)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2822 (class 2606 OID 20004151)
-- Name: fk_781826c67e3c61f9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT fk_781826c67e3c61f9 FOREIGN KEY (owner_id) REFERENCES uporabniki(id);


--
-- TOC entry 2783 (class 2606 OID 20003956)
-- Name: fk_7ab77b79f35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT fk_7ab77b79f35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2824 (class 2606 OID 20004156)
-- Name: fk_7adc957157ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc957157ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2823 (class 2606 OID 20004161)
-- Name: fk_7adc9571fa6311ef; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc9571fa6311ef FOREIGN KEY (perm_id) REFERENCES permission(id);


--
-- TOC entry 2766 (class 2606 OID 20003871)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2782 (class 2606 OID 20003946)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2781 (class 2606 OID 20003951)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2801 (class 2606 OID 20004066)
-- Name: fk_8787a0e54ae1cd1c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e54ae1cd1c FOREIGN KEY (gostitelj_id) REFERENCES popa(id);


--
-- TOC entry 2802 (class 2606 OID 20004061)
-- Name: fk_8787a0e55d0da56c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e55d0da56c FOREIGN KEY (drzavagostovanja_id) REFERENCES drza(id);


--
-- TOC entry 2805 (class 2606 OID 20004046)
-- Name: fk_8787a0e562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2804 (class 2606 OID 20004051)
-- Name: fk_8787a0e57222d84b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e57222d84b FOREIGN KEY (tipprogramskeenote_id) REFERENCES tipprogramskeenote(id);


--
-- TOC entry 2803 (class 2606 OID 20004056)
-- Name: fk_8787a0e5771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e5771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2736 (class 2606 OID 20003721)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2737 (class 2606 OID 20003716)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2735 (class 2606 OID 20003726)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2771 (class 2606 OID 20003901)
-- Name: fk_952dd21969e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd21969e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2772 (class 2606 OID 20003896)
-- Name: fk_952dd2196beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd2196beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2808 (class 2606 OID 20004076)
-- Name: fk_97af082e38c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e38c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2807 (class 2606 OID 20004081)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2798 (class 2606 OID 20004036)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2797 (class 2606 OID 20004041)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2800 (class 2606 OID 20004026)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 2799 (class 2606 OID 20004031)
-- Name: fk_a4b7244fa4976613; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fa4976613 FOREIGN KEY (zaposlitev_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2780 (class 2606 OID 20003941)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2761 (class 2606 OID 20003861)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2762 (class 2606 OID 20003856)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2764 (class 2606 OID 20003846)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2763 (class 2606 OID 20003851)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2795 (class 2606 OID 20004021)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2796 (class 2606 OID 20004016)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2744 (class 2606 OID 20003761)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2806 (class 2606 OID 20004071)
-- Name: fk_dba42fe79e3adf2c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkacdve
    ADD CONSTRAINT fk_dba42fe79e3adf2c FOREIGN KEY (programdela_id) REFERENCES programdela(id);


--
-- TOC entry 2809 (class 2606 OID 20004086)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2811 (class 2606 OID 20004096)
-- Name: fk_e7d4cf2638c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT fk_e7d4cf2638c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2821 (class 2606 OID 20004141)
-- Name: fk_e9f8ee8257ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee8257ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id) ON DELETE CASCADE;


--
-- TOC entry 2820 (class 2606 OID 20004146)
-- Name: fk_e9f8ee82af91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee82af91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id) ON DELETE CASCADE;


--
-- TOC entry 2728 (class 2606 OID 20003686)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2729 (class 2606 OID 20003681)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2733 (class 2606 OID 20003701)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2732 (class 2606 OID 20003706)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2753 (class 2606 OID 20003806)
-- Name: fk_f44a386d10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT fk_f44a386d10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2754 (class 2606 OID 20003821)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2755 (class 2606 OID 20003816)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2756 (class 2606 OID 20003811)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- Completed on 2015-09-18 11:30:27 CEST

--
-- PostgreSQL database dump complete
--

