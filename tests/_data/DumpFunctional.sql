--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.9
-- Dumped by pg_dump version 9.3.9
-- Started on 2015-09-18 20:53:38 CEST

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
-- TOC entry 3013 (class 0 OID 0)
-- Dependencies: 243
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_with_oids = false;

--
-- TOC entry 181 (class 1259 OID 20127504)
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
-- TOC entry 227 (class 1259 OID 20128032)
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
-- TOC entry 226 (class 1259 OID 20128015)
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
-- TOC entry 217 (class 1259 OID 20127895)
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
-- TOC entry 220 (class 1259 OID 20127925)
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
-- TOC entry 241 (class 1259 OID 20128271)
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
-- TOC entry 195 (class 1259 OID 20127685)
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
-- TOC entry 197 (class 1259 OID 20127717)
-- Name: dogodeksplosni; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodeksplosni (
    id uuid NOT NULL
);


--
-- TOC entry 235 (class 1259 OID 20128197)
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
-- TOC entry 190 (class 1259 OID 20127625)
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
-- TOC entry 228 (class 1259 OID 20128045)
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
-- TOC entry 213 (class 1259 OID 20127850)
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
-- TOC entry 193 (class 1259 OID 20127664)
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
-- TOC entry 191 (class 1259 OID 20127642)
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
-- TOC entry 202 (class 1259 OID 20127764)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 239 (class 1259 OID 20128252)
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
-- TOC entry 240 (class 1259 OID 20128264)
-- Name: mapa_zapis; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE mapa_zapis (
    mapa_id uuid NOT NULL,
    zapis_id uuid NOT NULL
);


--
-- TOC entry 242 (class 1259 OID 20128286)
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
-- TOC entry 206 (class 1259 OID 20127789)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 188 (class 1259 OID 20127599)
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
-- TOC entry 182 (class 1259 OID 20127513)
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
-- TOC entry 183 (class 1259 OID 20127524)
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
-- TOC entry 178 (class 1259 OID 20127478)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 180 (class 1259 OID 20127497)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 207 (class 1259 OID 20127796)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 211 (class 1259 OID 20127830)
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
-- TOC entry 223 (class 1259 OID 20127964)
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
-- TOC entry 185 (class 1259 OID 20127557)
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
-- TOC entry 187 (class 1259 OID 20127591)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 230 (class 1259 OID 20128143)
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
-- TOC entry 203 (class 1259 OID 20127770)
-- Name: postavkaracuna; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE postavkaracuna (
    id uuid NOT NULL,
    racun_id uuid
);


--
-- TOC entry 186 (class 1259 OID 20127576)
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
-- TOC entry 192 (class 1259 OID 20127654)
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
-- TOC entry 205 (class 1259 OID 20127782)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 231 (class 1259 OID 20128157)
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
-- TOC entry 232 (class 1259 OID 20128167)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    sifra character varying(4) NOT NULL,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 229 (class 1259 OID 20128100)
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
-- TOC entry 233 (class 1259 OID 20128175)
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
-- TOC entry 209 (class 1259 OID 20127811)
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
-- TOC entry 201 (class 1259 OID 20127755)
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
-- TOC entry 200 (class 1259 OID 20127745)
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
-- TOC entry 222 (class 1259 OID 20127953)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying,
    status character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 216 (class 1259 OID 20127885)
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
-- TOC entry 175 (class 1259 OID 20127449)
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
-- TOC entry 174 (class 1259 OID 20127447)
-- Name: revizije_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE revizije_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3014 (class 0 OID 0)
-- Dependencies: 174
-- Name: revizije_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE revizije_id_seq OWNED BY revizije.id;


--
-- TOC entry 210 (class 1259 OID 20127824)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 179 (class 1259 OID 20127487)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 177 (class 1259 OID 20127471)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 212 (class 1259 OID 20127838)
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
-- TOC entry 204 (class 1259 OID 20127776)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 198 (class 1259 OID 20127722)
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
-- TOC entry 173 (class 1259 OID 20127436)
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
-- TOC entry 172 (class 1259 OID 20127428)
-- Name: stevilcenjekonfig; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjekonfig (
    id uuid NOT NULL,
    stevilcenje_id uuid,
    dok character varying(100) DEFAULT NULL::character varying
);


--
-- TOC entry 171 (class 1259 OID 20127423)
-- Name: stevilcenjestanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjestanje (
    id uuid NOT NULL,
    objid uuid NOT NULL,
    leto integer NOT NULL,
    stevilka integer
);


--
-- TOC entry 218 (class 1259 OID 20127902)
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
-- TOC entry 184 (class 1259 OID 20127549)
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
-- TOC entry 199 (class 1259 OID 20127732)
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
-- TOC entry 221 (class 1259 OID 20127941)
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
-- TOC entry 234 (class 1259 OID 20128185)
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
-- TOC entry 189 (class 1259 OID 20127611)
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
-- TOC entry 176 (class 1259 OID 20127458)
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
-- TOC entry 225 (class 1259 OID 20127990)
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
-- TOC entry 194 (class 1259 OID 20127675)
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
-- TOC entry 208 (class 1259 OID 20127803)
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
-- TOC entry 219 (class 1259 OID 20127916)
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
-- TOC entry 237 (class 1259 OID 20128232)
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
-- TOC entry 236 (class 1259 OID 20128204)
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
-- TOC entry 238 (class 1259 OID 20128244)
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
-- TOC entry 215 (class 1259 OID 20127875)
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
-- TOC entry 196 (class 1259 OID 20127711)
-- Name: zasedenost; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zasedenost (
    id uuid NOT NULL,
    oseba_id uuid
);


--
-- TOC entry 224 (class 1259 OID 20127980)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 214 (class 1259 OID 20127865)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 2191 (class 2604 OID 20127452)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 2945 (class 0 OID 20127504)
-- Dependencies: 181
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
\.


--
-- TOC entry 2991 (class 0 OID 20128032)
-- Dependencies: 227
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, zaposlitev_id, oseba_id, pogodba_id, sifra, zaposlen, zacetek, konec, opomba, sort, privzeti, aktivna, imapogodbo, pomembna) FROM stdin;
000c0000-55fc-5db0-d605-0b202d0972dd	000d0000-55fc-5db0-a2c6-e5051d3d99b8	\N	00090000-55fc-5db0-e8aa-36dd7ba759a9	000b0000-55fc-5db0-7631-f249a11374c1	0001	f	\N	\N	\N	3	t	\N	t	t
000c0000-55fc-5db0-96fe-d6ddfea0e3c5	000d0000-55fc-5db0-51ae-3f0e4e533f43	00100000-55fc-5db0-036d-deeb58069f77	00090000-55fc-5db0-edd2-568929ab35f4	\N	0002	t	2016-01-01	\N	\N	8	t	\N	f	f
000c0000-55fc-5db0-61eb-0f6e2925cc0f	000d0000-55fc-5db0-ce1f-05af90fe0d7a	00100000-55fc-5db0-4208-6488c9b8233b	00090000-55fc-5db0-c850-6814cd039ec6	\N	0003	t	\N	2015-09-18	\N	2	t	\N	f	f
000c0000-55fc-5db0-3b05-2608e9426ceb	000d0000-55fc-5db0-4ae2-8c10bc1fd0b0	\N	00090000-55fc-5db0-0eb6-5ba1be92afcb	\N	0004	f	2016-01-01	2016-01-01	\N	26	t	\N	f	f
000c0000-55fc-5db0-0d49-7a369f3d814f	000d0000-55fc-5db0-5a0f-98c1d61afdc6	\N	00090000-55fc-5db0-5975-0649c041a92c	\N	0005	f	2016-01-01	2016-01-01	\N	7	t	\N	f	f
000c0000-55fc-5db0-298c-8c97b3d7e043	000d0000-55fc-5db0-5410-3fef8c226395	\N	00090000-55fc-5db0-908d-e6c2bd94dc48	000b0000-55fc-5db0-9199-989ba95f179b	0006	f	2016-01-01	2016-01-01	\N	1	t	\N	t	t
000c0000-55fc-5db0-9ee8-34a89d35cbad	000d0000-55fc-5db0-f814-bb7f2acdd3a3	00100000-55fc-5db0-b5e5-6032c7d44ec0	00090000-55fc-5db0-5737-afeb8b02dec7	\N	0007	t	2016-01-01	2016-01-01	\N	14	t	\N	f	t
000c0000-55fc-5db0-2f5d-60ae92b970ed	000d0000-55fc-5db0-d2c2-84d28d710831	\N	00090000-55fc-5db0-0c1a-258effc64388	000b0000-55fc-5db0-75f6-fa87079e4722	0008	f	2016-01-01	2016-01-01	\N	12	t	\N	t	t
000c0000-55fc-5db0-631c-77ecdece98dc	000d0000-55fc-5db0-f814-bb7f2acdd3a3	00100000-55fc-5db0-e3f2-de93e704b1c4	00090000-55fc-5db0-84e0-6ef6cf519f47	\N	0009	t	2017-01-01	2017-01-01	\N	15	t	\N	f	t
000c0000-55fc-5db0-bb92-327560940ff2	000d0000-55fc-5db0-f814-bb7f2acdd3a3	00100000-55fc-5db0-d518-37cd83c32844	00090000-55fc-5db0-dbe1-fea25e57c945	\N	0010	t	\N	2015-09-18	\N	16	f	\N	f	t
000c0000-55fc-5db0-9f34-de38be1af7a5	000d0000-55fc-5db0-f814-bb7f2acdd3a3	00100000-55fc-5db0-7d66-ca893f8db932	00090000-55fc-5db0-bddd-6b2a2df344f2	\N	0011	t	2017-01-01	\N	\N	17	f	\N	f	t
000c0000-55fc-5db0-8df9-92fce03ea2db	000d0000-55fc-5db0-27d2-58dd1cfc3868	\N	00090000-55fc-5db0-edd2-568929ab35f4	000b0000-55fc-5db0-9a12-86d075437ed4	0012	f	\N	\N	\N	2	t	\N	t	t
\.


--
-- TOC entry 2990 (class 0 OID 20128015)
-- Dependencies: 226
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 2981 (class 0 OID 20127895)
-- Dependencies: 217
-- Data for Name: avtorbesedila; Type: TABLE DATA; Schema: public; Owner: -
--

COPY avtorbesedila (id, besedilo_id, oseba_id, tipavtorja, zaporedna, alivnaslovu) FROM stdin;
003d0000-55fc-5db0-0b70-4c87d41a263e	00160000-55fc-5db0-cc52-28be33d903e2	00090000-55fc-5db0-fe47-ff611b9fef7d	Avtor originala	10	t
003d0000-55fc-5db0-e26d-d644faf1ccd8	00160000-55fc-5db0-cc52-28be33d903e2	00090000-55fc-5db0-3e7b-c069e2124947	Predelava	14	t
003d0000-55fc-5db0-8197-f6f74f27954c	00160000-55fc-5db0-3a5f-2b0d63a390b2	00090000-55fc-5db0-2cfb-5b72b521576b	Avtor originala	11	t
003d0000-55fc-5db0-5bd3-790339dccf2e	00160000-55fc-5db0-2201-c11490b86d25	00090000-55fc-5db0-2e0d-c013db8d82a7	Avtor originala	12	t
003d0000-55fc-5db0-0efe-480c60af144f	00160000-55fc-5db0-cc52-28be33d903e2	00090000-55fc-5db0-a8e2-dcb867c102df	Predelava	18	f
\.


--
-- TOC entry 2984 (class 0 OID 20127925)
-- Dependencies: 220
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, stevilka, naslov, podnaslov, jezik, naslovizvirnika, internacionalninaslov, datumprejema, moskevloge, zenskevloge, povzetekvsebine, letoizida, krajizida, zaloznik) FROM stdin;
00160000-55fc-5db0-cc52-28be33d903e2	0001	Sen kresne noči		slovenščina	A Midsummer Night's Dream	\N	2015-04-26	5	5	Nastopajo Titanija, Hipolita, Oberon, ...	\N	\N	\N
00160000-55fc-5db0-3a5f-2b0d63a390b2	0002	Bratje Karamazovi		slovenščina	Bratja Karamazjovji	\N	2015-12-04	4	1	Svetovna uspešnica	\N	\N	\N
00160000-55fc-5db0-2201-c11490b86d25	0003	Smoletov Vrt		slovenščina		\N	2015-05-26	2	8		\N	\N	\N
\.


--
-- TOC entry 3005 (class 0 OID 20128271)
-- Dependencies: 241
-- Data for Name: datoteka; Type: TABLE DATA; Schema: public; Owner: -
--

COPY datoteka (id, owner_id, filename, transfers, size, format, hash, createdat, uploadedat, upor, datknj) FROM stdin;
\.


--
-- TOC entry 2959 (class 0 OID 20127685)
-- Dependencies: 195
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_splosni_id, prostor_id, sezona_id, planiranzacetek, allday, zacetek, konec, status, razred, termin, title) FROM stdin;
00180000-55fc-5db0-277b-57bd0b273181	\N	\N	00200000-55fc-5db0-fc21-828fec94313b	\N	\N	\N	\N	2015-06-26 10:00:00	f	2015-06-26 10:00:00	2015-06-26 12:00:00	200s	200s		dogodek 1
00180000-55fc-5db0-40b5-64bba7b64aae	\N	\N	00200000-55fc-5db0-0a80-22cf9b75710e	\N	\N	\N	\N	2015-06-27 10:00:00	f	2015-06-27 10:00:00	2015-06-27 12:00:00	300s	200s		dogodek 2
00180000-55fc-5db0-9d52-f0fe63d94220	\N	\N	00200000-55fc-5db0-b3c3-e0c31548bcd5	\N	\N	\N	\N	2015-08-01 20:00:00	f	2015-08-01 20:00:00	2015-08-01 23:00:00	400s	200s		dogodek 3
00180000-55fc-5db0-a150-224c26d2c9ab	\N	\N	00200000-55fc-5db0-3030-bf774a1dd284	\N	\N	\N	\N	2015-08-01 20:00:00	f	2015-08-01 20:00:00	2015-08-01 23:00:00	100s	200s		dogodek 4
00180000-55fc-5db0-1ce6-7a200951e34c	\N	\N	00200000-55fc-5db0-8c98-b6eca34cf64a	\N	\N	\N	\N	2015-08-01 20:00:00	f	2015-08-01 20:00:00	2015-08-01 23:00:00	500s	200s		dogodek 5
\.


--
-- TOC entry 2961 (class 0 OID 20127717)
-- Dependencies: 197
-- Data for Name: dogodeksplosni; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodeksplosni (id) FROM stdin;
\.


--
-- TOC entry 2999 (class 0 OID 20128197)
-- Dependencies: 235
-- Data for Name: drugivir; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drugivir (id, znesek, opis, mednarodni, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 2954 (class 0 OID 20127625)
-- Dependencies: 190
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-55fc-5dae-6307-0bf61db0af23	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-55fc-5dae-f8c2-356e6f5b4309	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-55fc-5dae-c250-9f62ec1a139b	AL	ALB	008	Albania 	Albanija	\N
00040000-55fc-5dae-3f22-8f6941ea34f8	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-55fc-5dae-bfd9-7764fba695e1	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-55fc-5dae-33bb-d1dfc0271d1d	AD	AND	020	Andorra 	Andora	\N
00040000-55fc-5dae-6757-db6b7f10d141	AO	AGO	024	Angola 	Angola	\N
00040000-55fc-5dae-c80a-e1132e0d9eaa	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-55fc-5dae-d310-1957a7f49f75	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-55fc-5dae-bf51-7422ed503424	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-55fc-5dae-2a1e-57d054602325	AR	ARG	032	Argentina 	Argenitna	\N
00040000-55fc-5dae-9ceb-388583bc502f	AM	ARM	051	Armenia 	Armenija	\N
00040000-55fc-5dae-c7ff-15d4b6f5048d	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-55fc-5dae-d197-ab0e2a43c848	AU	AUS	036	Australia 	Avstralija	\N
00040000-55fc-5dae-2070-7d4370550409	AT	AUT	040	Austria 	Avstrija	\N
00040000-55fc-5dae-623f-c31fc5861044	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-55fc-5dae-f734-d8c8fbacd3f5	BS	BHS	044	Bahamas 	Bahami	\N
00040000-55fc-5dae-3ac8-4d1f621d37fb	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-55fc-5dae-7d63-d216a7e9c137	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-55fc-5dae-b731-8a3ce624883c	BB	BRB	052	Barbados 	Barbados	\N
00040000-55fc-5dae-e870-ba0b5c88d873	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-55fc-5dae-e78f-77c42fa5acc1	BE	BEL	056	Belgium 	Belgija	\N
00040000-55fc-5dae-9f6d-fbabdebcdc33	BZ	BLZ	084	Belize 	Belize	\N
00040000-55fc-5dae-ac4f-c09797f2e4b8	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-55fc-5dae-ff7d-17c86a08d84f	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-55fc-5dae-fd17-9c36f36ea9da	BT	BTN	064	Bhutan 	Butan	\N
00040000-55fc-5dae-a67d-6619cea47f2f	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-55fc-5dae-f4cd-86ca5b56941e	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-55fc-5dae-ed35-b7a94e5c2c0e	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-55fc-5dae-9ffb-15787b518a51	BW	BWA	072	Botswana 	Bocvana	\N
00040000-55fc-5dae-0453-db3e7acf8e5b	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-55fc-5dae-6eff-4af8b78fe605	BR	BRA	076	Brazil 	Brazilija	\N
00040000-55fc-5dae-f529-b872c3cbb673	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-55fc-5dae-63a8-c5f8142ef465	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-55fc-5dae-3b98-89827c81f49e	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-55fc-5dae-b8c1-72ac1d089bd6	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-55fc-5dae-a04d-5f49bc461a9b	BI	BDI	108	Burundi 	Burundi 	\N
00040000-55fc-5dae-5d9c-1133b552a530	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-55fc-5dae-f432-8472676768e4	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-55fc-5dae-e20b-4bff5d9ff023	CA	CAN	124	Canada 	Kanada	\N
00040000-55fc-5dae-4a86-0fbc8e5fb5f2	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-55fc-5dae-f502-282efb0ba7c8	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-55fc-5dae-d1b7-434c06e84e16	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-55fc-5dae-8c64-753ffc39ad56	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-55fc-5dae-4766-df13c6544132	CL	CHL	152	Chile 	Čile	\N
00040000-55fc-5dae-27b9-52f3eab67194	CN	CHN	156	China 	Kitajska	\N
00040000-55fc-5dae-bfe6-35d1c5bc1b22	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-55fc-5dae-1a51-8ccff788a6b8	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-55fc-5dae-7cd4-88a3398420df	CO	COL	170	Colombia 	Kolumbija	\N
00040000-55fc-5dae-98b9-fde24f88a918	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-55fc-5dae-b851-5f1b7d2883de	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-55fc-5dae-a2c8-59e141650a68	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-55fc-5dae-04a6-4410d41664aa	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-55fc-5dae-877e-b28562f73564	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-55fc-5dae-7e20-9fc2d07c642d	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-55fc-5dae-a50b-c949c860429d	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-55fc-5dae-21c3-fae50d257370	CU	CUB	192	Cuba 	Kuba	\N
00040000-55fc-5dae-7359-6d01d1d8e4e5	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-55fc-5dae-4741-916b65d53447	CY	CYP	196	Cyprus 	Ciper	\N
00040000-55fc-5dae-ad14-a60e53185d51	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-55fc-5dae-e87b-a06b197744bb	DK	DNK	208	Denmark 	Danska	\N
00040000-55fc-5dae-4a57-2a3c06d2065d	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-55fc-5dae-3df1-763dcb072a02	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-55fc-5dae-7718-4a61c8385f3a	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-55fc-5dae-c3ae-7f0b3ce64d1b	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-55fc-5dae-df04-4b8ca581e38c	EG	EGY	818	Egypt 	Egipt	\N
00040000-55fc-5dae-026d-afd6b21748ce	SV	SLV	222	El Salvador 	Salvador	\N
00040000-55fc-5dae-9f2c-1f286b5ba0ce	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-55fc-5dae-aa84-ecc1758056eb	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-55fc-5dae-5a74-84b728f46b2f	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-55fc-5dae-f791-701df2895a45	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-55fc-5dae-1d0a-8e3a07fa0ff9	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-55fc-5dae-f276-7cadf0076da2	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-55fc-5dae-b331-b143c61fb6a3	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-55fc-5dae-13cc-344928335cfb	FI	FIN	246	Finland 	Finska	\N
00040000-55fc-5dae-8c7d-d57a5989e3b1	FR	FRA	250	France 	Francija	\N
00040000-55fc-5dae-ec9b-9827ef21674f	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-55fc-5daf-8430-61ffaaac36c9	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-55fc-5dae-c0a9-fcd74cd5ea99	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-55fc-5dae-2faf-55d5d8963e86	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-55fc-5dae-0a95-231ac24a720b	GA	GAB	266	Gabon 	Gabon	\N
00040000-55fc-5dae-ba2f-5068300e7452	GM	GMB	270	Gambia 	Gambija	\N
00040000-55fc-5daf-620a-276a820915ae	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-55fc-5daf-e6d9-8bca2d21fa58	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-55fc-5daf-46e8-1a62cc7338a6	GH	GHA	288	Ghana 	Gana	\N
00040000-55fc-5daf-05d9-0a6a283af9aa	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-55fc-5daf-d611-39665f7e5678	GR	GRC	300	Greece 	Grčija	\N
00040000-55fc-5daf-cdcc-cad72e8546ba	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-55fc-5daf-6a7b-c015aa43bcc1	GD	GRD	308	Grenada 	Grenada	\N
00040000-55fc-5daf-2669-9a380f561a4c	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-55fc-5daf-27c5-beff3f139d60	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-55fc-5daf-295d-c9b8d35cebf9	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-55fc-5daf-71cc-fb9366fbdc41	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-55fc-5daf-cf6c-662a0f1c2595	GN	GIN	324	Guinea 	Gvineja	\N
00040000-55fc-5daf-171f-8e886d41525f	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-55fc-5daf-2acc-63b7a08416fc	GY	GUY	328	Guyana 	Gvajana	\N
00040000-55fc-5daf-f3ca-90a6ab0f5af2	HT	HTI	332	Haiti 	Haiti	\N
00040000-55fc-5daf-6608-e57ffd51327d	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-55fc-5daf-6376-da57f85cf4ac	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-55fc-5daf-fe92-29bc22dba09c	HN	HND	340	Honduras 	Honduras	\N
00040000-55fc-5daf-6372-801cd8af410c	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-55fc-5daf-71c1-2feadbe2f252	HU	HUN	348	Hungary 	Madžarska	\N
00040000-55fc-5daf-f6e4-3f2e08628ded	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-55fc-5daf-d080-f59de4b44ae9	IN	IND	356	India 	Indija	\N
00040000-55fc-5daf-2015-d67cf8fa2aba	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-55fc-5daf-8d18-093e4c449740	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-55fc-5daf-772e-9bc023c9ce3f	IQ	IRQ	368	Iraq 	Irak	\N
00040000-55fc-5daf-d67a-2d5e89252baa	IE	IRL	372	Ireland 	Irska	\N
00040000-55fc-5daf-c5bf-3b3943464380	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-55fc-5daf-818b-9d5b2cb01349	IL	ISR	376	Israel 	Izrael	\N
00040000-55fc-5daf-3e07-c2d5885fcacd	IT	ITA	380	Italy 	Italija	\N
00040000-55fc-5daf-8bd3-bc317545f9e8	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-55fc-5daf-ff7c-40301a194814	JP	JPN	392	Japan 	Japonska	\N
00040000-55fc-5daf-6bc7-cacd6f322da7	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-55fc-5daf-49c8-e9a4daf0ab39	JO	JOR	400	Jordan 	Jordanija	\N
00040000-55fc-5daf-1368-6ba86094e42f	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-55fc-5daf-865e-85c8941029a8	KE	KEN	404	Kenya 	Kenija	\N
00040000-55fc-5daf-d9af-e1252a12fa7b	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-55fc-5daf-620a-b9fffc9ed9c7	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-55fc-5daf-d501-75b32b812098	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-55fc-5daf-a1bb-6d23338d2918	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-55fc-5daf-62f5-9b105bb4ff6f	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-55fc-5daf-0b9c-3b8e78553d25	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-55fc-5daf-21eb-fe16cca9ce60	LV	LVA	428	Latvia 	Latvija	\N
00040000-55fc-5daf-a883-b1316adf8cff	LB	LBN	422	Lebanon 	Libanon	\N
00040000-55fc-5daf-172c-8a2dc67180e2	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-55fc-5daf-637e-e73cb6117b6b	LR	LBR	430	Liberia 	Liberija	\N
00040000-55fc-5daf-2d2a-0c3d7d8c246f	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-55fc-5daf-b989-97a3a5ae788b	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-55fc-5daf-744e-9f3f1c80258e	LT	LTU	440	Lithuania 	Litva	\N
00040000-55fc-5daf-0e9b-daf344c571c4	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-55fc-5daf-e9e1-1f1dfcca0ffe	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-55fc-5daf-704f-a829ad67f39b	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-55fc-5daf-41e8-fd9d81dcdb5d	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-55fc-5daf-df9e-77c092cb842a	MW	MWI	454	Malawi 	Malavi	\N
00040000-55fc-5daf-82c2-c556a28ef13a	MY	MYS	458	Malaysia 	Malezija	\N
00040000-55fc-5daf-3d88-9653b1f73228	MV	MDV	462	Maldives 	Maldivi	\N
00040000-55fc-5daf-b3a1-6c297faaa8b3	ML	MLI	466	Mali 	Mali	\N
00040000-55fc-5daf-634f-969dfc8cc3b6	MT	MLT	470	Malta 	Malta	\N
00040000-55fc-5daf-9683-ed13fe2677a7	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-55fc-5daf-d56e-08dd8c87a3db	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-55fc-5daf-4d13-0e8fc857ade4	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-55fc-5daf-fb4e-d0145425b882	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-55fc-5daf-1322-656344d2e751	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-55fc-5daf-5cef-9716d8a8402c	MX	MEX	484	Mexico 	Mehika	\N
00040000-55fc-5daf-b8c6-273a030eed0a	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-55fc-5daf-91a7-f6a6b7fbb376	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-55fc-5daf-c29c-950a25b9490a	MC	MCO	492	Monaco 	Monako	\N
00040000-55fc-5daf-1508-dd15f8ff06a1	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-55fc-5daf-c031-1786bfc436a7	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-55fc-5daf-0083-f63c956bd1bf	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-55fc-5daf-c643-4ec7399b4f17	MA	MAR	504	Morocco 	Maroko	\N
00040000-55fc-5daf-a0f2-680cef7ed5e4	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-55fc-5daf-5530-f3d50aa8db8f	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-55fc-5daf-0700-150d4cb272a0	NA	NAM	516	Namibia 	Namibija	\N
00040000-55fc-5daf-eef2-86454b910b30	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-55fc-5daf-2254-7f6f26a95517	NP	NPL	524	Nepal 	Nepal	\N
00040000-55fc-5daf-231a-2358e2f1396e	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-55fc-5daf-f1fa-73022ad0e417	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-55fc-5daf-e175-cccc40b58b9c	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-55fc-5daf-5a2e-ea17209c9320	NE	NER	562	Niger 	Niger 	\N
00040000-55fc-5daf-7376-5a0dea8c2f68	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-55fc-5daf-5b83-1f5da81ff505	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-55fc-5daf-3263-9ab45cf0a677	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-55fc-5daf-f29f-d04c4e0fdcac	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-55fc-5daf-a64c-630c7cf5eb94	NO	NOR	578	Norway 	Norveška	\N
00040000-55fc-5daf-86d0-5d69848facaa	OM	OMN	512	Oman 	Oman	\N
00040000-55fc-5daf-1a80-fb67249cfd73	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-55fc-5daf-a522-401a2817fb56	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-55fc-5daf-15a0-c6550e1a49ea	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-55fc-5daf-03ad-036645b389a0	PA	PAN	591	Panama 	Panama	\N
00040000-55fc-5daf-37ad-3c9041b4bba2	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-55fc-5daf-1ba8-015c622d52d9	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-55fc-5daf-173e-aed0577e2022	PE	PER	604	Peru 	Peru	\N
00040000-55fc-5daf-12ef-0c2df803c1a3	PH	PHL	608	Philippines 	Filipini	\N
00040000-55fc-5daf-17e7-4392c32afcc4	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-55fc-5daf-8764-36e009f1bebd	PL	POL	616	Poland 	Poljska	\N
00040000-55fc-5daf-d6e1-0ca01f0fabf0	PT	PRT	620	Portugal 	Portugalska	\N
00040000-55fc-5daf-c541-b4538a15221e	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-55fc-5daf-3dee-f7f0440147c3	QA	QAT	634	Qatar 	Katar	\N
00040000-55fc-5daf-be9e-fa1060f218dc	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-55fc-5daf-c4ad-686b10cd8273	RO	ROU	642	Romania 	Romunija	\N
00040000-55fc-5daf-6fcf-dffa74b642e5	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-55fc-5daf-86c8-596f5759f256	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-55fc-5daf-929a-c1306b67159b	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-55fc-5daf-446b-c8f7acc909b6	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-55fc-5daf-5c53-ca3ccd0cf3d2	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-55fc-5daf-ef58-da08d4f9d6ce	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-55fc-5daf-607f-8ca010c21959	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-55fc-5daf-c37e-a34cae82d6ca	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-55fc-5daf-b12e-8831693e7aad	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-55fc-5daf-43b5-ac3811a82cbc	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-55fc-5daf-ff45-86bbb40820ae	SM	SMR	674	San Marino 	San Marino	\N
00040000-55fc-5daf-0498-e7cf3dde4580	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-55fc-5daf-eb78-b892e9522c7d	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-55fc-5daf-7f6d-61d78f240fbb	SN	SEN	686	Senegal 	Senegal	\N
00040000-55fc-5daf-d6b7-e851df25a635	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-55fc-5daf-345b-29b2282c6d63	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-55fc-5daf-af1f-deb03acbc9a8	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-55fc-5daf-8f73-60cbb27ffbe7	SG	SGP	702	Singapore 	Singapur	\N
00040000-55fc-5daf-085a-08a4d21cabbb	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-55fc-5daf-be4b-832516d1c5b4	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-55fc-5daf-b629-3022bb037896	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-55fc-5daf-b3fe-b79383891e36	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-55fc-5daf-717b-df7bca598e0c	SO	SOM	706	Somalia 	Somalija	\N
00040000-55fc-5daf-0a1a-820de4c83711	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-55fc-5daf-9ba4-354925c680eb	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-55fc-5daf-7d9d-a39fb86daf62	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-55fc-5daf-88dd-95104d48f0c6	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-55fc-5daf-6d80-84fa6c92b891	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-55fc-5daf-6677-ab44a8448b90	SD	SDN	729	Sudan 	Sudan	\N
00040000-55fc-5daf-6b27-30690571f8fc	SR	SUR	740	Suriname 	Surinam	\N
00040000-55fc-5daf-a071-388b4b5dfe89	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-55fc-5daf-2351-161f9890f209	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-55fc-5daf-266b-1fc05599d761	SE	SWE	752	Sweden 	Švedska	\N
00040000-55fc-5daf-bc02-3cc8528a9cdf	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-55fc-5daf-e7ab-501e6d8359da	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-55fc-5daf-f42c-20b869ab1073	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-55fc-5daf-eca3-2d7b184a474d	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-55fc-5daf-7f97-81ab0f9094e9	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-55fc-5daf-edc0-643854ccf5b3	TH	THA	764	Thailand 	Tajska	\N
00040000-55fc-5daf-6a71-c16b90731864	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-55fc-5daf-397a-45151cd60840	TG	TGO	768	Togo 	Togo	\N
00040000-55fc-5daf-5a0c-a1e026ba2256	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-55fc-5daf-cc0a-ca1b2a2f1fe6	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-55fc-5daf-f9ea-7197b59b1f4c	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-55fc-5daf-7387-d9fee1adf678	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-55fc-5daf-cdbe-8f75379d959d	TR	TUR	792	Turkey 	Turčija	\N
00040000-55fc-5daf-25c2-7a946e6eb9da	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-55fc-5daf-bc28-4a5ca1162a82	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-55fc-5daf-4a0c-6d2d99e2e570	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-55fc-5daf-e081-6d7e922b8d40	UG	UGA	800	Uganda 	Uganda	\N
00040000-55fc-5daf-daa1-cc098774da03	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-55fc-5daf-0c8f-2ec9723b2d28	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-55fc-5daf-0142-c85449c4a42d	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-55fc-5daf-31e9-df74d23c50a4	US	USA	840	United States 	Združene države Amerike	\N
00040000-55fc-5daf-88fd-daecac22b9db	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-55fc-5daf-5e96-17e27943d009	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-55fc-5daf-6181-28b85bc06e26	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-55fc-5daf-9411-4658dfff5912	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-55fc-5daf-d417-95d38f55c1f8	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-55fc-5daf-d3c1-c4c2a2f4f145	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-55fc-5daf-84cd-f7d1f29f4112	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-55fc-5daf-f270-9720440ca018	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-55fc-5daf-d553-425ad3a3c1cc	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-55fc-5daf-07ae-9bfda22c1e23	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-55fc-5daf-7d8d-8123f3abc00a	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-55fc-5daf-6722-a5708ef63163	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-55fc-5daf-6194-b471729e7034	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 2992 (class 0 OID 20128045)
-- Dependencies: 228
-- Data for Name: enotaprograma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY enotaprograma (id, uprizoritev_id, program_dela_id, gostitelj_id, celotnavrednost, nasdelez, celotnavrednostmat, celotnavrednostgostovsz, zaproseno, lastnasredstva, avtorskihonorarji, avtorskihonorarjisamoz, tantieme, avtorskepravice, materialni, imakoprodukcije, vlozekgostitelja, drugijavni, stzaposlenih, stzaposumet, stzaposdrug, sthonorarnih, sthonorarnihigr, sthonorarnihigrtujjz, sthonorarnihigrsamoz, obiskdoma, obiskkopr, obiskgost, obiskzamejo, obiskint, obiskkoprint, ponovidoma, ponovikopr, ponovizamejo, ponovigost, ponovikoprint, ponoviint, naziv, kpe, sort, tipprogramskeenote_id, tip, prikoproducentu, strosekodkpred, stroskiostali, krajgostovanja, ustanova, datumgostovanja, transportnistroski, dnevprvzad, drzavagostovanja_id, stpe, zvrst, stpredstav, stokroglihmiz, stpredstavitev, stdelavnic, stdrugidogodki, stprodukcij, caspriprave, casizvedbe, prizorisca, umetvodja, programskotelo, sttujihselektorjev) FROM stdin;
002f0000-55fc-5db0-1996-eeecac89105b	000e0000-55fc-5db0-100e-e2795d143dd0	\N	\N	9000.30	9000.30	9000.30	0.00	3600.12	5299.98	4000.40	1000.40	200.20	200.30	4599.40	\N	0.00	100.20	0	2	2	2	2	2	\N	40	0	0	0	0	0	1	0	0	0	0	0		0.00	\N	002b0000-55fc-5dae-9f01-846d23ecae60	premiera	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-55fc-5db0-baae-412fcf45f785	000e0000-55fc-5db0-9dff-68e2f510862c	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	\N	60	0	0	0	0	0	1	0	0	0	0	0		0.00	\N	002b0000-55fc-5dae-5242-7a0709ec2386	premiera	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-55fc-5db0-1c2c-1e2a6c322fc3	000e0000-55fc-5db0-bd39-d1daafafd252	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	\N	60	0	0	0	0	0	1	0	0	0	0	0		0.00	\N	002b0000-55fc-5dae-9f01-846d23ecae60	premiera	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-55fc-5db0-9c5f-3c2fbf27aef0	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-54.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	54.20	5	0	0	3	0	0	\N	22	0	0	0	0	0	0	0	0	0	0	0	Urejanje portala	0.00	10	\N	razno	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-55fc-5db0-75b0-5377ea00417f	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-31.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	31.20	5	0	0	3	0	0	\N	202	0	0	0	0	0	0	0	0	0	0	0	Delavnice otroci	0.00	8	\N	razno	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 2977 (class 0 OID 20127850)
-- Dependencies: 213
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, podrocje, vodjaekipe, naziv, komentar, velikost, pomembna, sort, seplanira, dovoliprekrivanje, maxprekrivanj, tipfunkcije_id) FROM stdin;
000d0000-55fc-5db0-a2c6-e5051d3d99b8	000e0000-55fc-5db0-9dff-68e2f510862c	000c0000-55fc-5db0-d605-0b202d0972dd	igralec	\N	Tezej	glavna vloga	velika	t	5	t	t	\N	000f0000-55fc-5dae-e97e-bef985cf8481
000d0000-55fc-5db0-51ae-3f0e4e533f43	000e0000-55fc-5db0-9dff-68e2f510862c	000c0000-55fc-5db0-96fe-d6ddfea0e3c5	umetnik	\N	Režija		velika	t	8	t	t	\N	000f0000-55fc-5dae-af41-8000aaf6e1b1
000d0000-55fc-5db0-ce1f-05af90fe0d7a	000e0000-55fc-5db0-9dff-68e2f510862c	000c0000-55fc-5db0-61eb-0f6e2925cc0f	inspicient	t	Inšpicient			t	8	t	t	\N	000f0000-55fc-5dae-3c3c-e4118351e555
000d0000-55fc-5db0-4ae2-8c10bc1fd0b0	000e0000-55fc-5db0-9dff-68e2f510862c	000c0000-55fc-5db0-3b05-2608e9426ceb	tehnik	t	Tehnični vodja			t	8	t	t	\N	000f0000-55fc-5dae-3b92-592c8d1bfdc0
000d0000-55fc-5db0-5a0f-98c1d61afdc6	000e0000-55fc-5db0-9dff-68e2f510862c	000c0000-55fc-5db0-0d49-7a369f3d814f	tehnik	\N	Razsvetljava			t	3	t	t	\N	000f0000-55fc-5dae-3b92-592c8d1bfdc0
000d0000-55fc-5db0-5410-3fef8c226395	000e0000-55fc-5db0-9dff-68e2f510862c	000c0000-55fc-5db0-298c-8c97b3d7e043	igralec	\N	Helena	glavna vloga	velika	t	5	t	t	\N	000f0000-55fc-5dae-e97e-bef985cf8481
000d0000-55fc-5db0-f814-bb7f2acdd3a3	000e0000-55fc-5db0-9dff-68e2f510862c	000c0000-55fc-5db0-631c-77ecdece98dc	igralec	\N	Hipolita	glavna vloga	velika	t	6	t	t	\N	000f0000-55fc-5dae-e97e-bef985cf8481
000d0000-55fc-5db0-d2c2-84d28d710831	000e0000-55fc-5db0-9dff-68e2f510862c	000c0000-55fc-5db0-2f5d-60ae92b970ed	umetnik	\N	Lektoriranje			t	22	t	t	\N	000f0000-55fc-5dae-b5be-ddbc638f876d
000d0000-55fc-5db0-27d2-58dd1cfc3868	000e0000-55fc-5db0-9dff-68e2f510862c	000c0000-55fc-5db0-8df9-92fce03ea2db	umetnik	\N	Avtor	Avtor besedila		t	2	t	f	\N	000f0000-55fc-5dae-3bfe-20b02ceb9262
\.


--
-- TOC entry 2957 (class 0 OID 20127664)
-- Dependencies: 193
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta, zamejstvo, kraj) FROM stdin;
\.


--
-- TOC entry 2955 (class 0 OID 20127642)
-- Dependencies: 191
-- Data for Name: kontaktnaoseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kontaktnaoseba (id, popa_id, oseba_id, status, funkcija, opis) FROM stdin;
00260000-55fc-5db0-145b-5f461127dd4a	00080000-55fc-5db0-cffd-eb999c47f5f0	00090000-55fc-5db0-dbe1-fea25e57c945	AK		igralka
\.


--
-- TOC entry 2966 (class 0 OID 20127764)
-- Dependencies: 202
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 3003 (class 0 OID 20128252)
-- Dependencies: 239
-- Data for Name: mapa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa (id, lastnik_id, parent_id, ime, komentar, caskreiranja, casspremembe, javnidostop, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3004 (class 0 OID 20128264)
-- Dependencies: 240
-- Data for Name: mapa_zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa_zapis (mapa_id, zapis_id) FROM stdin;
\.


--
-- TOC entry 3006 (class 0 OID 20128286)
-- Dependencies: 242
-- Data for Name: mapaacl; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapaacl (id, mapa_id, perm_id, dostop, upor, datknj) FROM stdin;
\.


--
-- TOC entry 2934 (class 0 OID 19946838)
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
-- TOC entry 2970 (class 0 OID 20127789)
-- Dependencies: 206
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 2952 (class 0 OID 20127599)
-- Dependencies: 188
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-55fc-5daf-50cb-8d559a7d53f6	popa.stakli	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-55fc-5daf-5924-9ba31521ef38	oseba.spol	array	a:2:{s:1:"M";a:1:{s:5:"label";s:6:"Moški";}s:1:"Z";a:1:{s:5:"label";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-55fc-5daf-d58b-fea62f811fb3	telefonska.vrsta	array	a:3:{s:7:"mobilna";a:1:{s:5:"label";s:7:"Mobilni";}s:6:"domaca";a:1:{s:5:"label";s:6:"Domač";}s:6:"fiksna";a:1:{s:5:"label";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-55fc-5daf-f46e-ad7223420196	kontaktnaoseba.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status kontaktne osebe
00000000-55fc-5daf-424a-7b060b8e418b	dogodek.status	array	a:7:{s:4:"100s";a:1:{s:5:"label";s:11:"Dolgoročno";}s:4:"200s";a:1:{s:5:"label";s:9:"Planirano";}s:4:"300s";a:1:{s:5:"label";s:8:"Fiksiran";}s:4:"400s";a:1:{s:5:"label";s:17:"Potrjen - interno";}s:4:"500s";a:1:{s:5:"label";s:15:"Potrjen - javno";}s:4:"600s";a:1:{s:5:"label";s:10:"Zaključen";}s:4:"700s";a:1:{s:5:"label";s:7:"Obdelan";}}	f	t	t	\N	Tabela statusa dogodkov
00000000-55fc-5daf-b10e-82b5899fe9f2	dogodek.razred	array	a:5:{s:4:"100s";a:2:{s:5:"label";s:9:"Predstava";s:4:"type";s:9:"predstava";}s:4:"200s";a:2:{s:5:"label";s:4:"Vaja";s:4:"type";s:4:"vaja";}s:4:"300s";a:2:{s:5:"label";s:10:"Gostovanje";s:4:"type";s:10:"gostovanje";}s:4:"400s";a:2:{s:5:"label";s:16:"Splošni dogodek";s:4:"type";s:8:"splošni";}s:4:"500s";a:2:{s:5:"label";s:10:"Zasedenost";s:4:"type";s:10:"zasedenost";}}	f	t	t	\N	Tabela razredov dogodkov, ki jih aplikacija podpira
00000000-55fc-5daf-c6c6-65590bc0d125	uprizoritev.faza	array	a:6:{s:20:"predprodukcija-ideja";a:1:{s:5:"label";s:16:"Dolgoročni plan";}s:20:"predprodukcija-poziv";a:1:{s:5:"label";s:29:"Predprodukcija, v fazi poziva";}s:30:"predprodukcija-potrjen_program";a:1:{s:5:"label";s:34:"Predprodukcija, program je potrjen";}s:10:"produkcija";a:1:{s:5:"label";s:10:"Produkcija";}s:14:"postprodukcija";a:1:{s:5:"label";s:14:"Postprodukcija";}s:5:"arhiv";a:1:{s:5:"label";s:10:"Arhivirana";}}	f	t	f	\N	Faza uprizoritve
00000000-55fc-5daf-f6b0-8ec6e0638a5b	funkcija.podrocje	array	a:4:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}}	f	t	f	\N	Področje funkcije
00000000-55fc-5daf-0e34-beb90a48bb9c	tipfunkcije.podrocje	array	a:4:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}}	f	t	f	\N	Področje funkcije
00000000-55fc-5daf-c6e2-b6c31080f596	funkcija.velikost	array	a:4:{s:7:"stataza";a:1:{s:5:"label";s:8:"Stataža";}s:4:"mala";a:1:{s:5:"label";s:21:"Mala vloga / funkcija";}s:7:"srednja";a:1:{s:5:"label";s:24:"Srednja vloga / funkcija";}s:6:"velika";a:1:{s:5:"label";s:23:"Velika vloga / funkcija";}}	f	t	f	\N	Velikost funkcije
00000000-55fc-5daf-98e4-a2453db1cec6	zaposlitev.status	array	a:2:{s:1:"A";a:1:{s:5:"label";s:7:"Aktivna";}s:1:"N";a:1:{s:5:"label";s:9:"Neaktivna";}}	f	t	f	\N	Status zaposlitve
00000000-55fc-5daf-fd78-ce0d478f73f4	produkcijskahisa.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktivna";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktivna";}}	f	t	f	\N	Status produkcijske hiše
00000000-55fc-5daf-b78f-8db818cc8fa2	strosekuprizoritve.tipstroska	array	a:1:{s:10:"materialni";a:1:{s:5:"label";s:19:"Materialni strošek";}}	f	t	f	\N	Tip stroška
00000000-55fc-5daf-5fb9-54dd08be51be	fsacl.dostop	array	a:4:{s:1:"X";a:1:{s:5:"label";s:12:"Brez dostopa";}s:1:"R";a:1:{s:5:"label";s:11:"Samo branje";}s:2:"RW";a:1:{s:5:"label";s:17:"Branje in pisanje";}s:3:"RWD";a:1:{s:5:"label";s:26:"Branje pisanje in brisanje";}}	f	t	f	\N	ACL Javni dostop
00000000-55fc-5db0-f270-7288b23d862f	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-55fc-5db0-009e-67c318a56c96	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-55fc-5db0-9fe9-9f2938718003	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-55fc-5db0-7d89-f848cb129da2	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-55fc-5db0-5fd0-4706fa780ce1	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
00000000-55fc-5db1-0b41-0e91d2749028	application.tenant.maticnopodjetje	string	s:4:"1001";	f	t	f		Šifra matičnega podjetja v Popa in ProdukcijskaHisa
\.


--
-- TOC entry 2946 (class 0 OID 20127513)
-- Dependencies: 182
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-55fc-5db0-aa72-869bd80c5096	00000000-55fc-5db0-f270-7288b23d862f	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-55fc-5db0-7ba5-5571dab79dc0	00000000-55fc-5db0-f270-7288b23d862f	00010000-55fc-5daf-2a2e-ba3ec1393f58	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-55fc-5db0-5b80-f8292eb6f52e	00000000-55fc-5db0-009e-67c318a56c96	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 2947 (class 0 OID 20127524)
-- Dependencies: 183
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naslov_id, sifra, naziv, ime, priimek, funkcija, srednjeime, polnoime, psevdonim, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
00090000-55fc-5db0-e8aa-36dd7ba759a9	\N	\N	0001	g.	Janez	Novak	a	Peter	Janez Peter Novak	Jani	jani.novak@xxx.xx	1958-01-06	0601958000000	123456789	M	Jani Janez	Slovenija	Slovenija	Ljubljana
00090000-55fc-5db0-0eb6-5ba1be92afcb	00010000-55fc-5db0-c7a6-c724ab4f81a3	\N	0002	dr.	Anton	Horvat	b		Anton  Horvat	Tona	anton.horvat@xxx.xx	1968-02-12	1202968111111	234567890	M		Slovenija	Slovenija	Maribor
00090000-55fc-5db0-c850-6814cd039ec6	00010000-55fc-5db0-2e7f-f472305176fb	\N	0003		Ivan	Kovačič	c		Ivan  Kovačič	Ivo	ivan.kovacic@xxx.xx	1975-03-26	2603976222222	345678901	M		Slovenija	Slovenija	Celje
00090000-55fc-5db0-84e0-6ef6cf519f47	00010000-55fc-5db0-7cc4-24dafa4507dc	\N	0004	prof.	Jožef	Krajnc	d		Jožef  Krajnc	Joža	jozef.krajnc@xxx.xx	1971-04-30	3004971333333	456789012	M		Slovenija	Slovenija	Kranj
00090000-55fc-5db0-e7f2-7547771f2fc7	\N	\N	0005		Marko	Zupančič	e		Marko  Zupančič		marko.zupancic@xxx.xx	1984-05-07	0705984444444	567890123	M		Slovenija	Slovenija	Koper
00090000-55fc-5db0-908d-e6c2bd94dc48	\N	\N	0006	ga.	Marija	Kovač	f		Marija  Kovač		marija.kovac@xxx.xx	1962-06-19	1906962444444	678901234	Z		Slovenija	Slovenija	Murska Sobota
00090000-55fc-5db0-bddd-6b2a2df344f2	\N	\N	0007	ga.	Ana	Potočnik	g		Ana  Potočnik		ana.potocnik@xxx.xx	1975-07-24	2407975555555	789012345	Z		Slovenija	Slovenija	Novo Mesto
00090000-55fc-5db0-5737-afeb8b02dec7	\N	\N	0008	ga.	Maja	Mlakar	h		Maja  Mlakar		maja.mlakar@xxx.xx	1986-08-02	0208986666666	890123456	Z		Slovenija	Slovenija	Nova Gorica
00090000-55fc-5db0-dbe1-fea25e57c945	00010000-55fc-5db0-89e1-7dd81e36dd4b	\N	0009		Irena	Kos	i		Irena  Kos		irena.kos@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Ptuj
00090000-55fc-5db0-edd2-568929ab35f4	\N	\N	0010		Mojca	Vidmar	J		Mojca  Vidmar		mojca.vidmar@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Idrija
00090000-55fc-5db0-6ae5-1d2f256a93c8	\N	\N	0011		xx	write protected12345	a		xx  write protected12345		xx@xxx.xx	\N	\N	\N	Z		\N	\N	\N
00090000-55fc-5db0-5975-0649c041a92c	\N	\N	0012		Luka	Golob	luč	a	Luka a Golob		luka.golob@xxx.xx	\N	\N	\N	M		\N	\N	\N
00090000-55fc-5db0-0c1a-258effc64388	00010000-55fc-5db0-3b2e-770a1f86209f	\N	0013		Tatjana	Božič	tajnica	a	Tatjana a Božič		tatjana.bozic@xxx.xx	\N	\N	\N	Z		\N	\N	\N
00090000-55fc-5db0-fe47-ff611b9fef7d	\N	\N	0014		William	Shakespeare	avtor		William  Shakespeare		\N	\N	\N	\N	M		\N	\N	\N
00090000-55fc-5db0-3e7b-c069e2124947	\N	\N	0015		Nebojša	Kavader	avtor		Nebojša  Kavader		\N	\N	\N	\N	M		\N	\N	\N
00090000-55fc-5db0-2cfb-5b72b521576b	\N	\N	0016		Fjodor	Dostojevski	avtor	Mihajlovič	Fjodor Mihajlovič Dostojevski		\N	\N	\N	\N	M		\N	\N	\N
00090000-55fc-5db0-2e0d-c013db8d82a7	\N	\N	0017		Berta 	Hočevar	avtorica		Berta   Hočevar		\N	\N	\N	\N	Z		\N	\N	\N
00090000-55fc-5db0-a8e2-dcb867c102df	\N	\N	0018		Katarina	Podbevšek	lektorica		Katarina  Podbevšek		\N	\N	\N	\N	Z		\N	\N	\N
\.


--
-- TOC entry 2942 (class 0 OID 20127478)
-- Dependencies: 178
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-55fc-5daf-36d2-3b8bd204d366	Aaa-read	Aaa (User,Role,Permission) - branje	f
00030000-55fc-5daf-fe34-13be392d7128	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	f
00030000-55fc-5daf-75a4-48b9ccd90f4b	TerminStoritve-vse	TerminStoritve - spreminjanje vseh zapisov	f
00030000-55fc-5daf-f49a-486c544a73d7	Dogodek-readVse	Dogodek - branje vseh, ne glede na status dogodka	f
00030000-55fc-5daf-e628-c45b0133c362	Oseba-vse	Oseba - vse - za testiranje assert	f
00030000-55fc-5daf-e6af-0c1ce8d6a312	ProgramDela-lock	ProgramDela - zaklepanje	f
00030000-55fc-5daf-8c4c-fb1743388fb2	ProgramDela-unlock	ProgramDela - odklepanje	f
00030000-55fc-5daf-b61b-4cbf7f2d0cab	Abonma-read	Abonma - branje	f
00030000-55fc-5daf-0474-c180ce602840	Abonma-write	Abonma - spreminjanje	f
00030000-55fc-5daf-e5ab-24aeffaf444f	Alternacija-read	Alternacija - branje	f
00030000-55fc-5daf-7d1d-050d0058f603	Alternacija-write	Alternacija - spreminjanje	f
00030000-55fc-5daf-920a-4db77b9b1885	Arhivalija-read	Arhivalija - branje	f
00030000-55fc-5daf-7c3f-dfc9db8d7925	Arhivalija-write	Arhivalija - spreminjanje	f
00030000-55fc-5daf-8414-52f304c07cb1	AvtorBesedila-read	AvtorBesedila - branje	f
00030000-55fc-5daf-b77b-1e9640dfefa1	AvtorBesedila-write	AvtorBesedila - spreminjanje	f
00030000-55fc-5daf-dbe8-0865791b6349	Besedilo-read	Besedilo - branje	f
00030000-55fc-5daf-57c1-b6a79b9da69d	Besedilo-write	Besedilo - spreminjanje	f
00030000-55fc-5daf-cf61-a00243d4c31e	DogodekIzven-read	DogodekIzven - branje	f
00030000-55fc-5daf-51ac-361b970818ba	DogodekIzven-write	DogodekIzven - spreminjanje	f
00030000-55fc-5daf-6687-88768f37a12c	Dogodek-read	Dogodek - branje	f
00030000-55fc-5daf-013e-683498ce5126	Dogodek-write	Dogodek - spreminjanje	f
00030000-55fc-5daf-a33b-8b9d02e07753	DrugiVir-read	DrugiVir - branje	f
00030000-55fc-5daf-6580-c8a325b500d5	DrugiVir-write	DrugiVir - spreminjanje	f
00030000-55fc-5daf-6e9a-776cae6ac8fd	Drzava-read	Drzava - branje	f
00030000-55fc-5daf-f763-f1bf7c8eacfd	Drzava-write	Drzava - spreminjanje	f
00030000-55fc-5daf-448e-5f53be8eee89	EnotaPrograma-read	EnotaPrograma - branje	f
00030000-55fc-5daf-8877-bf82ab6f73d6	EnotaPrograma-write	EnotaPrograma - spreminjanje	f
00030000-55fc-5daf-dab0-b42e91c7444e	Funkcija-read	Funkcija - branje	f
00030000-55fc-5daf-c525-e04f64f5d187	Funkcija-write	Funkcija - spreminjanje	f
00030000-55fc-5daf-90e4-254bc63aecd9	Gostovanje-read	Gostovanje - branje	f
00030000-55fc-5daf-35fe-5bce6a038e37	Gostovanje-write	Gostovanje - spreminjanje	f
00030000-55fc-5daf-c234-e3213bad0329	Gostujoca-read	Gostujoca - branje	f
00030000-55fc-5daf-75e3-1e800935b87f	Gostujoca-write	Gostujoca - spreminjanje	f
00030000-55fc-5daf-3d0f-2ce82f8e36ec	KontaktnaOseba-read	KontaktnaOseba - branje	f
00030000-55fc-5daf-e752-b5e460b3854e	KontaktnaOseba-write	KontaktnaOseba - spreminjanje	f
00030000-55fc-5daf-6d86-ecfa1b6a3098	Kupec-read	Kupec - branje	f
00030000-55fc-5daf-6e91-8cedc4eae2f0	Kupec-write	Kupec - spreminjanje	f
00030000-55fc-5daf-3680-c7868e7213c1	NacinPlacina-read	NacinPlacina - branje	f
00030000-55fc-5daf-9bad-800be299735f	NacinPlacina-write	NacinPlacina - spreminjanje	f
00030000-55fc-5daf-5e96-8c57a22eee42	Option-read	Option - branje	f
00030000-55fc-5daf-d7c6-916e67a820e6	Option-write	Option - spreminjanje	f
00030000-55fc-5daf-d61e-027f7ed3e715	OptionValue-read	OptionValue - branje	f
00030000-55fc-5daf-c0be-dd04517a2c39	OptionValue-write	OptionValue - spreminjanje	f
00030000-55fc-5daf-0c20-18dd35ba8bdb	Oseba-read	Oseba - branje	f
00030000-55fc-5daf-be13-8bda0591d316	Oseba-write	Oseba - spreminjanje	f
00030000-55fc-5daf-63f8-12bff370b281	PlacilniInstrument-read	PlacilniInstrument - branje	f
00030000-55fc-5daf-a760-3e9693510016	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	f
00030000-55fc-5daf-9785-5362ad06d074	PodrocjeSedenja-read	PodrocjeSedenja - branje	f
00030000-55fc-5daf-bcb3-08b17af1dfbf	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	f
00030000-55fc-5daf-5059-3e0496c5aa89	Pogodba-read	Pogodba - branje	f
00030000-55fc-5daf-b0c6-f0ee8a2efa41	Pogodba-write	Pogodba - spreminjanje	f
00030000-55fc-5daf-1dd3-a6444cb38aeb	Popa-read	Popa - branje	f
00030000-55fc-5daf-690e-af6da670901a	Popa-write	Popa - spreminjanje	f
00030000-55fc-5daf-17a7-c222abcb7210	Posta-read	Posta - branje	f
00030000-55fc-5daf-b464-67da49d6213a	Posta-write	Posta - spreminjanje	f
00030000-55fc-5daf-bb81-272101778aaa	PostavkaCDve-read	PostavkaCDve - branje	f
00030000-55fc-5daf-7fce-0d403c0dc2aa	PostavkaCDve-write	PostavkaCDve - spreminjanje	f
00030000-55fc-5daf-7bdc-3e8cd19843cc	PostavkaRacuna-read	PostavkaRacuna - branje	f
00030000-55fc-5daf-8968-4a388d83a2be	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	f
00030000-55fc-5daf-a4b5-54ba6d53c0e4	PostniNaslov-read	PostniNaslov - branje	f
00030000-55fc-5daf-9f71-3461d143e25a	PostniNaslov-write	PostniNaslov - spreminjanje	f
00030000-55fc-5daf-efcf-2463062548ea	Predstava-read	Predstava - branje	f
00030000-55fc-5daf-590b-aee7ff86e7f6	Predstava-write	Predstava - spreminjanje	f
00030000-55fc-5daf-c2a0-29f58001dcb5	ProdajaPredstave-read	ProdajaPredstave - branje	f
00030000-55fc-5daf-9a11-7672fb32f975	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	f
00030000-55fc-5daf-4101-6b5e9a5310aa	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	f
00030000-55fc-5daf-1df6-22ce2a346cb4	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	f
00030000-55fc-5daf-09eb-76a1e9844545	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	f
00030000-55fc-5daf-fc90-03a96cdb27f2	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	f
00030000-55fc-5daf-264e-85a90f733180	ProgramDela-read	ProgramDela - branje	f
00030000-55fc-5daf-e774-5f6b837c89b0	ProgramDela-write	ProgramDela - spreminjanje	f
00030000-55fc-5daf-2368-8bb0f662f565	ProgramFestival-read	ProgramFestival - branje	f
00030000-55fc-5daf-b6a5-c0b9d0bea017	ProgramFestival-write	ProgramFestival - spreminjanje	f
00030000-55fc-5daf-9cfd-d47768aed58a	ProgramGostovanje-read	ProgramGostovanje - branje	f
00030000-55fc-5daf-29e7-6ced36c28040	ProgramGostovanje-write	ProgramGostovanje - spreminjanje	f
00030000-55fc-5daf-6ccc-7cfdd85ca6e5	ProgramGostujoca-read	ProgramGostujoca - branje	f
00030000-55fc-5daf-855a-a5fc17392a47	ProgramGostujoca-write	ProgramGostujoca - spreminjanje	f
00030000-55fc-5daf-6cb6-b61720443ea6	ProgramIzjemni-read	ProgramIzjemni - branje	f
00030000-55fc-5daf-468a-0b81ad11cb05	ProgramIzjemni-write	ProgramIzjemni - spreminjanje	f
00030000-55fc-5daf-923b-29ef09f985c1	ProgramPonovitevPrejsnjih-read	ProgramPonovitevPrejsnjih - branje	f
00030000-55fc-5daf-c0d8-6cb016ecda5b	ProgramPonovitevPrejsnjih-write	ProgramPonovitevPrejsnjih - spreminjanje	f
00030000-55fc-5daf-993a-b2c58b3d88dd	ProgramPonovitevPremiere-read	ProgramPonovitevPremiere - branje	f
00030000-55fc-5daf-786f-ca50b5849e9a	ProgramPonovitevPremiere-write	ProgramPonovitevPremiere - spreminjanje	f
00030000-55fc-5daf-66f7-159d41efabbe	ProgramPremiera-read	ProgramPremiera - branje	f
00030000-55fc-5daf-d2cf-61f44f196c8a	ProgramPremiera-write	ProgramPremiera - spreminjanje	f
00030000-55fc-5daf-f6ca-05be320ec1e0	ProgramRazno-read	ProgramRazno - branje	f
00030000-55fc-5daf-fd53-080af143f751	ProgramRazno-write	ProgramRazno - spreminjanje	f
00030000-55fc-5daf-67f6-20ac56649e96	ProgramskaEnotaSklopa-read	ProgramskaEnotaSklopa - branje	f
00030000-55fc-5daf-ac95-a6913a1dbcf8	ProgramskaEnotaSklopa-write	ProgramskaEnotaSklopa - spreminjanje	f
00030000-55fc-5daf-3323-677952d5ac83	Prostor-read	Prostor - branje	f
00030000-55fc-5daf-988f-ee40b97124f9	Prostor-write	Prostor - spreminjanje	f
00030000-55fc-5daf-eceb-1bc98259350d	Racun-read	Racun - branje	f
00030000-55fc-5daf-f7f4-262d0e6cf71f	Racun-write	Racun - spreminjanje	f
00030000-55fc-5daf-30cc-5c07f6530980	RazpisanSedez-read	RazpisanSedez - branje	f
00030000-55fc-5daf-cfbe-d02847ff512e	RazpisanSedez-write	RazpisanSedez - spreminjanje	f
00030000-55fc-5daf-c360-a549a94cd4da	Rekviziterstvo-read	Rekviziterstvo - branje	f
00030000-55fc-5daf-6559-d1fe86e8c1b5	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	f
00030000-55fc-5daf-de7d-94bc5d3ebd32	Rekvizit-read	Rekvizit - branje	f
00030000-55fc-5daf-7878-739a493432d1	Rekvizit-write	Rekvizit - spreminjanje	f
00030000-55fc-5daf-e4bf-9de4dade91a8	Revizija-read	Revizija - branje	f
00030000-55fc-5daf-a2c0-ef38c2542f3a	Revizija-write	Revizija - spreminjanje	f
00030000-55fc-5daf-a12e-1b2318a50c9e	Rezervacija-read	Rezervacija - branje	f
00030000-55fc-5daf-2a3a-356eb358be09	Rezervacija-write	Rezervacija - spreminjanje	f
00030000-55fc-5daf-b591-a315afddbecf	SedezniRed-read	SedezniRed - branje	f
00030000-55fc-5daf-8a52-87cccc3b4178	SedezniRed-write	SedezniRed - spreminjanje	f
00030000-55fc-5daf-9b31-3b438d33b242	Sedez-read	Sedez - branje	f
00030000-55fc-5daf-5b61-c70a019d6735	Sedez-write	Sedez - spreminjanje	f
00030000-55fc-5daf-8376-dc55c17fada1	Sezona-read	Sezona - branje	f
00030000-55fc-5daf-2b37-65ea3d5909bf	Sezona-write	Sezona - spreminjanje	f
00030000-55fc-5daf-ee90-94d21d8dd315	StevilcenjeKonfig-read	StevilcenjeKonfig - branje	f
00030000-55fc-5daf-7d23-5bccd158ee53	StevilcenjeKonfig-write	StevilcenjeKonfig - spreminjanje	f
00030000-55fc-5daf-5316-1c046e82161f	Stevilcenje-read	Stevilcenje - branje	f
00030000-55fc-5daf-d22a-5dcf8ddfda2c	Stevilcenje-write	Stevilcenje - spreminjanje	f
00030000-55fc-5daf-98e1-9c73477ef24d	StevilcenjeStanje-read	StevilcenjeStanje - branje	f
00030000-55fc-5daf-73e9-32da29253b69	StevilcenjeStanje-write	StevilcenjeStanje - spreminjanje	f
00030000-55fc-5daf-7d7b-fc6e6bc0394f	StrosekUprizoritve-read	StrosekUprizoritve - branje	f
00030000-55fc-5daf-5fd0-de41cd33e192	StrosekUprizoritve-write	StrosekUprizoritve - spreminjanje	f
00030000-55fc-5daf-14de-62aa906c149e	Telefonska-read	Telefonska - branje	f
00030000-55fc-5daf-998b-555eacf25502	Telefonska-write	Telefonska - spreminjanje	f
00030000-55fc-5daf-e3d3-96a88358b51c	TerminStoritve-read	TerminStoritve - branje	f
00030000-55fc-5daf-72b9-4e713179a403	TerminStoritve-write	TerminStoritve - spreminjanje	f
00030000-55fc-5daf-c222-6e4281a5aebc	TipFunkcije-read	TipFunkcije - branje	f
00030000-55fc-5daf-7d52-56684f881b73	TipFunkcije-write	TipFunkcije - spreminjanje	f
00030000-55fc-5daf-863f-f687203bac04	TipProgramskeEnote-read	TipProgramskeEnote - branje	f
00030000-55fc-5daf-66e7-de3c503578b1	TipProgramskeEnote-write	TipProgramskeEnote - spreminjanje	f
00030000-55fc-5daf-5e9a-338ff2542950	Trr-read	Trr - branje	f
00030000-55fc-5daf-32a0-eacf97d94b5d	Trr-write	Trr - spreminjanje	f
00030000-55fc-5daf-b6e5-25f739c78262	Uprizoritev-read	Uprizoritev - branje	f
00030000-55fc-5daf-1df2-c7bbb58c699f	Uprizoritev-write	Uprizoritev - spreminjanje	f
00030000-55fc-5daf-35b3-3a18bf0bfab1	Vaja-read	Vaja - branje	f
00030000-55fc-5daf-b113-e47b50837113	Vaja-write	Vaja - spreminjanje	f
00030000-55fc-5daf-a425-2f177178221b	VrstaSedezev-read	VrstaSedezev - branje	f
00030000-55fc-5daf-0e42-dd63ba0ca1d1	VrstaSedezev-write	VrstaSedezev - spreminjanje	f
00030000-55fc-5daf-0b29-efa510ee8ff5	VrstaStroska-read	VrstaStroska - branje	f
00030000-55fc-5daf-0da6-7dd3685d0c8b	VrstaStroska-write	VrstaStroska - spreminjanje	f
00030000-55fc-5daf-a74a-283659898e9b	Zaposlitev-read	Zaposlitev - branje	f
00030000-55fc-5daf-9aac-0c4e88f741bc	Zaposlitev-write	Zaposlitev - spreminjanje	f
00030000-55fc-5daf-eb3d-04294ea56b6a	Zasedenost-read	Zasedenost - branje	f
00030000-55fc-5daf-2f96-74d890e0a00b	Zasedenost-write	Zasedenost - spreminjanje	f
00030000-55fc-5daf-0418-539789aa5dea	ZvrstSurs-read	ZvrstSurs - branje	f
00030000-55fc-5daf-7f5b-488fc4606944	ZvrstSurs-write	ZvrstSurs - spreminjanje	f
00030000-55fc-5daf-3e99-3f2e0bf34412	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	f
00030000-55fc-5daf-f33d-4e9334a25cff	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	f
00030000-55fc-5daf-4b32-7f130efdbfca	Mapa-write	Mapa - osnovno dovoljenje za pisanje	f
00030000-55fc-5daf-4bcc-178e3c2a19e3	Mapa-read	Mapa - osnovno dovoljenje za branje	f
00030000-55fc-5daf-12a1-9dc4ab0cd113	MapaAcl-write	MapaAcl - dovoljenje za dostop pisanje ACL-jev mape	f
00030000-55fc-5daf-d446-fe1651828f03	MapaAcl-read	MapaAcl - dovoljenje za dostop branje ACL-jev mape	f
00030000-55fc-5daf-bef5-055e3a69dda8	Zapis-write	Zapis - dovoljenje za pisanje zapisov	f
00030000-55fc-5daf-09a3-48e7a1bf6ca9	Zapis-read	Zapis - dovoljenje za pisanje zapisov	f
00030000-55fc-5daf-e999-cb172ade6b65	ZapisLastnik-write	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	f
00030000-55fc-5daf-aaf3-1048cefb83f5	ZapisLastnik-read	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	f
00030000-55fc-5daf-abc4-2c6180eb6a0d	VrstaZapisa-write	Šifrant vrst zapisa - spreminjanje	f
00030000-55fc-5daf-6642-fbee6cb055be	VrstaZapisa-read	Šifrant vrst zapisa - branje	f
00030000-55fc-5daf-bcee-f042527e990d	Datoteka-write	Datoteka - spreminjanje	f
00030000-55fc-5daf-8ca7-613a33a70674	Datoteka-read	Datoteke - branje	f
\.


--
-- TOC entry 2944 (class 0 OID 20127497)
-- Dependencies: 180
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-55fc-5daf-8f58-0c3d3c671afa	00030000-55fc-5daf-fe34-13be392d7128
00020000-55fc-5daf-e815-24b75c196888	00030000-55fc-5daf-6e9a-776cae6ac8fd
00020000-55fc-5daf-0f4b-c7825770fe87	00030000-55fc-5daf-b61b-4cbf7f2d0cab
00020000-55fc-5daf-0f4b-c7825770fe87	00030000-55fc-5daf-0474-c180ce602840
00020000-55fc-5daf-0f4b-c7825770fe87	00030000-55fc-5daf-e5ab-24aeffaf444f
00020000-55fc-5daf-0f4b-c7825770fe87	00030000-55fc-5daf-7d1d-050d0058f603
00020000-55fc-5daf-0f4b-c7825770fe87	00030000-55fc-5daf-920a-4db77b9b1885
00020000-55fc-5daf-0f4b-c7825770fe87	00030000-55fc-5daf-6687-88768f37a12c
00020000-55fc-5daf-0f4b-c7825770fe87	00030000-55fc-5daf-f49a-486c544a73d7
00020000-55fc-5daf-0f4b-c7825770fe87	00030000-55fc-5daf-013e-683498ce5126
00020000-55fc-5daf-0f4b-c7825770fe87	00030000-55fc-5daf-6e9a-776cae6ac8fd
00020000-55fc-5daf-0f4b-c7825770fe87	00030000-55fc-5daf-f763-f1bf7c8eacfd
00020000-55fc-5daf-0f4b-c7825770fe87	00030000-55fc-5daf-dab0-b42e91c7444e
00020000-55fc-5daf-0f4b-c7825770fe87	00030000-55fc-5daf-c525-e04f64f5d187
00020000-55fc-5daf-0f4b-c7825770fe87	00030000-55fc-5daf-90e4-254bc63aecd9
00020000-55fc-5daf-0f4b-c7825770fe87	00030000-55fc-5daf-35fe-5bce6a038e37
00020000-55fc-5daf-0f4b-c7825770fe87	00030000-55fc-5daf-c234-e3213bad0329
00020000-55fc-5daf-0f4b-c7825770fe87	00030000-55fc-5daf-75e3-1e800935b87f
00020000-55fc-5daf-0f4b-c7825770fe87	00030000-55fc-5daf-3d0f-2ce82f8e36ec
00020000-55fc-5daf-0f4b-c7825770fe87	00030000-55fc-5daf-e752-b5e460b3854e
00020000-55fc-5daf-0f4b-c7825770fe87	00030000-55fc-5daf-5e96-8c57a22eee42
00020000-55fc-5daf-0f4b-c7825770fe87	00030000-55fc-5daf-d61e-027f7ed3e715
00020000-55fc-5daf-0f4b-c7825770fe87	00030000-55fc-5daf-0c20-18dd35ba8bdb
00020000-55fc-5daf-0f4b-c7825770fe87	00030000-55fc-5daf-be13-8bda0591d316
00020000-55fc-5daf-0f4b-c7825770fe87	00030000-55fc-5daf-1dd3-a6444cb38aeb
00020000-55fc-5daf-0f4b-c7825770fe87	00030000-55fc-5daf-690e-af6da670901a
00020000-55fc-5daf-0f4b-c7825770fe87	00030000-55fc-5daf-17a7-c222abcb7210
00020000-55fc-5daf-0f4b-c7825770fe87	00030000-55fc-5daf-b464-67da49d6213a
00020000-55fc-5daf-0f4b-c7825770fe87	00030000-55fc-5daf-a4b5-54ba6d53c0e4
00020000-55fc-5daf-0f4b-c7825770fe87	00030000-55fc-5daf-9f71-3461d143e25a
00020000-55fc-5daf-0f4b-c7825770fe87	00030000-55fc-5daf-efcf-2463062548ea
00020000-55fc-5daf-0f4b-c7825770fe87	00030000-55fc-5daf-590b-aee7ff86e7f6
00020000-55fc-5daf-0f4b-c7825770fe87	00030000-55fc-5daf-09eb-76a1e9844545
00020000-55fc-5daf-0f4b-c7825770fe87	00030000-55fc-5daf-fc90-03a96cdb27f2
00020000-55fc-5daf-0f4b-c7825770fe87	00030000-55fc-5daf-3323-677952d5ac83
00020000-55fc-5daf-0f4b-c7825770fe87	00030000-55fc-5daf-988f-ee40b97124f9
00020000-55fc-5daf-0f4b-c7825770fe87	00030000-55fc-5daf-c360-a549a94cd4da
00020000-55fc-5daf-0f4b-c7825770fe87	00030000-55fc-5daf-6559-d1fe86e8c1b5
00020000-55fc-5daf-0f4b-c7825770fe87	00030000-55fc-5daf-de7d-94bc5d3ebd32
00020000-55fc-5daf-0f4b-c7825770fe87	00030000-55fc-5daf-7878-739a493432d1
00020000-55fc-5daf-0f4b-c7825770fe87	00030000-55fc-5daf-8376-dc55c17fada1
00020000-55fc-5daf-0f4b-c7825770fe87	00030000-55fc-5daf-2b37-65ea3d5909bf
00020000-55fc-5daf-0f4b-c7825770fe87	00030000-55fc-5daf-c222-6e4281a5aebc
00020000-55fc-5daf-0f4b-c7825770fe87	00030000-55fc-5daf-b6e5-25f739c78262
00020000-55fc-5daf-0f4b-c7825770fe87	00030000-55fc-5daf-1df2-c7bbb58c699f
00020000-55fc-5daf-0f4b-c7825770fe87	00030000-55fc-5daf-35b3-3a18bf0bfab1
00020000-55fc-5daf-0f4b-c7825770fe87	00030000-55fc-5daf-b113-e47b50837113
00020000-55fc-5daf-0f4b-c7825770fe87	00030000-55fc-5daf-eb3d-04294ea56b6a
00020000-55fc-5daf-0f4b-c7825770fe87	00030000-55fc-5daf-2f96-74d890e0a00b
00020000-55fc-5daf-0f4b-c7825770fe87	00030000-55fc-5daf-0418-539789aa5dea
00020000-55fc-5daf-0f4b-c7825770fe87	00030000-55fc-5daf-3e99-3f2e0bf34412
00020000-55fc-5daf-9bdb-9c9bdde0dd54	00030000-55fc-5daf-b61b-4cbf7f2d0cab
00020000-55fc-5daf-9bdb-9c9bdde0dd54	00030000-55fc-5daf-920a-4db77b9b1885
00020000-55fc-5daf-9bdb-9c9bdde0dd54	00030000-55fc-5daf-6687-88768f37a12c
00020000-55fc-5daf-9bdb-9c9bdde0dd54	00030000-55fc-5daf-6e9a-776cae6ac8fd
00020000-55fc-5daf-9bdb-9c9bdde0dd54	00030000-55fc-5daf-90e4-254bc63aecd9
00020000-55fc-5daf-9bdb-9c9bdde0dd54	00030000-55fc-5daf-c234-e3213bad0329
00020000-55fc-5daf-9bdb-9c9bdde0dd54	00030000-55fc-5daf-3d0f-2ce82f8e36ec
00020000-55fc-5daf-9bdb-9c9bdde0dd54	00030000-55fc-5daf-e752-b5e460b3854e
00020000-55fc-5daf-9bdb-9c9bdde0dd54	00030000-55fc-5daf-5e96-8c57a22eee42
00020000-55fc-5daf-9bdb-9c9bdde0dd54	00030000-55fc-5daf-d61e-027f7ed3e715
00020000-55fc-5daf-9bdb-9c9bdde0dd54	00030000-55fc-5daf-0c20-18dd35ba8bdb
00020000-55fc-5daf-9bdb-9c9bdde0dd54	00030000-55fc-5daf-be13-8bda0591d316
00020000-55fc-5daf-9bdb-9c9bdde0dd54	00030000-55fc-5daf-1dd3-a6444cb38aeb
00020000-55fc-5daf-9bdb-9c9bdde0dd54	00030000-55fc-5daf-17a7-c222abcb7210
00020000-55fc-5daf-9bdb-9c9bdde0dd54	00030000-55fc-5daf-a4b5-54ba6d53c0e4
00020000-55fc-5daf-9bdb-9c9bdde0dd54	00030000-55fc-5daf-9f71-3461d143e25a
00020000-55fc-5daf-9bdb-9c9bdde0dd54	00030000-55fc-5daf-efcf-2463062548ea
00020000-55fc-5daf-9bdb-9c9bdde0dd54	00030000-55fc-5daf-3323-677952d5ac83
00020000-55fc-5daf-9bdb-9c9bdde0dd54	00030000-55fc-5daf-c360-a549a94cd4da
00020000-55fc-5daf-9bdb-9c9bdde0dd54	00030000-55fc-5daf-de7d-94bc5d3ebd32
00020000-55fc-5daf-9bdb-9c9bdde0dd54	00030000-55fc-5daf-8376-dc55c17fada1
00020000-55fc-5daf-9bdb-9c9bdde0dd54	00030000-55fc-5daf-14de-62aa906c149e
00020000-55fc-5daf-9bdb-9c9bdde0dd54	00030000-55fc-5daf-998b-555eacf25502
00020000-55fc-5daf-9bdb-9c9bdde0dd54	00030000-55fc-5daf-5e9a-338ff2542950
00020000-55fc-5daf-9bdb-9c9bdde0dd54	00030000-55fc-5daf-32a0-eacf97d94b5d
00020000-55fc-5daf-9bdb-9c9bdde0dd54	00030000-55fc-5daf-a74a-283659898e9b
00020000-55fc-5daf-9bdb-9c9bdde0dd54	00030000-55fc-5daf-9aac-0c4e88f741bc
00020000-55fc-5daf-9bdb-9c9bdde0dd54	00030000-55fc-5daf-0418-539789aa5dea
00020000-55fc-5daf-9bdb-9c9bdde0dd54	00030000-55fc-5daf-3e99-3f2e0bf34412
00020000-55fc-5daf-4221-746d3824436d	00030000-55fc-5daf-b61b-4cbf7f2d0cab
00020000-55fc-5daf-4221-746d3824436d	00030000-55fc-5daf-e5ab-24aeffaf444f
00020000-55fc-5daf-4221-746d3824436d	00030000-55fc-5daf-920a-4db77b9b1885
00020000-55fc-5daf-4221-746d3824436d	00030000-55fc-5daf-7c3f-dfc9db8d7925
00020000-55fc-5daf-4221-746d3824436d	00030000-55fc-5daf-dbe8-0865791b6349
00020000-55fc-5daf-4221-746d3824436d	00030000-55fc-5daf-cf61-a00243d4c31e
00020000-55fc-5daf-4221-746d3824436d	00030000-55fc-5daf-6687-88768f37a12c
00020000-55fc-5daf-4221-746d3824436d	00030000-55fc-5daf-6e9a-776cae6ac8fd
00020000-55fc-5daf-4221-746d3824436d	00030000-55fc-5daf-dab0-b42e91c7444e
00020000-55fc-5daf-4221-746d3824436d	00030000-55fc-5daf-90e4-254bc63aecd9
00020000-55fc-5daf-4221-746d3824436d	00030000-55fc-5daf-c234-e3213bad0329
00020000-55fc-5daf-4221-746d3824436d	00030000-55fc-5daf-3d0f-2ce82f8e36ec
00020000-55fc-5daf-4221-746d3824436d	00030000-55fc-5daf-5e96-8c57a22eee42
00020000-55fc-5daf-4221-746d3824436d	00030000-55fc-5daf-d61e-027f7ed3e715
00020000-55fc-5daf-4221-746d3824436d	00030000-55fc-5daf-0c20-18dd35ba8bdb
00020000-55fc-5daf-4221-746d3824436d	00030000-55fc-5daf-1dd3-a6444cb38aeb
00020000-55fc-5daf-4221-746d3824436d	00030000-55fc-5daf-17a7-c222abcb7210
00020000-55fc-5daf-4221-746d3824436d	00030000-55fc-5daf-efcf-2463062548ea
00020000-55fc-5daf-4221-746d3824436d	00030000-55fc-5daf-09eb-76a1e9844545
00020000-55fc-5daf-4221-746d3824436d	00030000-55fc-5daf-3323-677952d5ac83
00020000-55fc-5daf-4221-746d3824436d	00030000-55fc-5daf-c360-a549a94cd4da
00020000-55fc-5daf-4221-746d3824436d	00030000-55fc-5daf-de7d-94bc5d3ebd32
00020000-55fc-5daf-4221-746d3824436d	00030000-55fc-5daf-8376-dc55c17fada1
00020000-55fc-5daf-4221-746d3824436d	00030000-55fc-5daf-c222-6e4281a5aebc
00020000-55fc-5daf-4221-746d3824436d	00030000-55fc-5daf-35b3-3a18bf0bfab1
00020000-55fc-5daf-4221-746d3824436d	00030000-55fc-5daf-eb3d-04294ea56b6a
00020000-55fc-5daf-4221-746d3824436d	00030000-55fc-5daf-0418-539789aa5dea
00020000-55fc-5daf-4221-746d3824436d	00030000-55fc-5daf-3e99-3f2e0bf34412
00020000-55fc-5daf-d883-a433f7e35f46	00030000-55fc-5daf-b61b-4cbf7f2d0cab
00020000-55fc-5daf-d883-a433f7e35f46	00030000-55fc-5daf-0474-c180ce602840
00020000-55fc-5daf-d883-a433f7e35f46	00030000-55fc-5daf-7d1d-050d0058f603
00020000-55fc-5daf-d883-a433f7e35f46	00030000-55fc-5daf-920a-4db77b9b1885
00020000-55fc-5daf-d883-a433f7e35f46	00030000-55fc-5daf-6687-88768f37a12c
00020000-55fc-5daf-d883-a433f7e35f46	00030000-55fc-5daf-6e9a-776cae6ac8fd
00020000-55fc-5daf-d883-a433f7e35f46	00030000-55fc-5daf-90e4-254bc63aecd9
00020000-55fc-5daf-d883-a433f7e35f46	00030000-55fc-5daf-c234-e3213bad0329
00020000-55fc-5daf-d883-a433f7e35f46	00030000-55fc-5daf-5e96-8c57a22eee42
00020000-55fc-5daf-d883-a433f7e35f46	00030000-55fc-5daf-d61e-027f7ed3e715
00020000-55fc-5daf-d883-a433f7e35f46	00030000-55fc-5daf-1dd3-a6444cb38aeb
00020000-55fc-5daf-d883-a433f7e35f46	00030000-55fc-5daf-17a7-c222abcb7210
00020000-55fc-5daf-d883-a433f7e35f46	00030000-55fc-5daf-efcf-2463062548ea
00020000-55fc-5daf-d883-a433f7e35f46	00030000-55fc-5daf-3323-677952d5ac83
00020000-55fc-5daf-d883-a433f7e35f46	00030000-55fc-5daf-c360-a549a94cd4da
00020000-55fc-5daf-d883-a433f7e35f46	00030000-55fc-5daf-de7d-94bc5d3ebd32
00020000-55fc-5daf-d883-a433f7e35f46	00030000-55fc-5daf-8376-dc55c17fada1
00020000-55fc-5daf-d883-a433f7e35f46	00030000-55fc-5daf-c222-6e4281a5aebc
00020000-55fc-5daf-d883-a433f7e35f46	00030000-55fc-5daf-0418-539789aa5dea
00020000-55fc-5daf-d883-a433f7e35f46	00030000-55fc-5daf-3e99-3f2e0bf34412
00020000-55fc-5daf-3dd4-c44bf2ae5a7a	00030000-55fc-5daf-b61b-4cbf7f2d0cab
00020000-55fc-5daf-3dd4-c44bf2ae5a7a	00030000-55fc-5daf-920a-4db77b9b1885
00020000-55fc-5daf-3dd4-c44bf2ae5a7a	00030000-55fc-5daf-6687-88768f37a12c
00020000-55fc-5daf-3dd4-c44bf2ae5a7a	00030000-55fc-5daf-6e9a-776cae6ac8fd
00020000-55fc-5daf-3dd4-c44bf2ae5a7a	00030000-55fc-5daf-90e4-254bc63aecd9
00020000-55fc-5daf-3dd4-c44bf2ae5a7a	00030000-55fc-5daf-c234-e3213bad0329
00020000-55fc-5daf-3dd4-c44bf2ae5a7a	00030000-55fc-5daf-5e96-8c57a22eee42
00020000-55fc-5daf-3dd4-c44bf2ae5a7a	00030000-55fc-5daf-d61e-027f7ed3e715
00020000-55fc-5daf-3dd4-c44bf2ae5a7a	00030000-55fc-5daf-1dd3-a6444cb38aeb
00020000-55fc-5daf-3dd4-c44bf2ae5a7a	00030000-55fc-5daf-17a7-c222abcb7210
00020000-55fc-5daf-3dd4-c44bf2ae5a7a	00030000-55fc-5daf-efcf-2463062548ea
00020000-55fc-5daf-3dd4-c44bf2ae5a7a	00030000-55fc-5daf-3323-677952d5ac83
00020000-55fc-5daf-3dd4-c44bf2ae5a7a	00030000-55fc-5daf-c360-a549a94cd4da
00020000-55fc-5daf-3dd4-c44bf2ae5a7a	00030000-55fc-5daf-de7d-94bc5d3ebd32
00020000-55fc-5daf-3dd4-c44bf2ae5a7a	00030000-55fc-5daf-8376-dc55c17fada1
00020000-55fc-5daf-3dd4-c44bf2ae5a7a	00030000-55fc-5daf-e3d3-96a88358b51c
00020000-55fc-5daf-3dd4-c44bf2ae5a7a	00030000-55fc-5daf-75a4-48b9ccd90f4b
00020000-55fc-5daf-3dd4-c44bf2ae5a7a	00030000-55fc-5daf-c222-6e4281a5aebc
00020000-55fc-5daf-3dd4-c44bf2ae5a7a	00030000-55fc-5daf-0418-539789aa5dea
00020000-55fc-5daf-3dd4-c44bf2ae5a7a	00030000-55fc-5daf-3e99-3f2e0bf34412
00020000-55fc-5db0-18ee-4246785ea359	00030000-55fc-5daf-36d2-3b8bd204d366
00020000-55fc-5db0-18ee-4246785ea359	00030000-55fc-5daf-fe34-13be392d7128
00020000-55fc-5db0-18ee-4246785ea359	00030000-55fc-5daf-75a4-48b9ccd90f4b
00020000-55fc-5db0-18ee-4246785ea359	00030000-55fc-5daf-f49a-486c544a73d7
00020000-55fc-5db0-18ee-4246785ea359	00030000-55fc-5daf-e628-c45b0133c362
00020000-55fc-5db0-18ee-4246785ea359	00030000-55fc-5daf-e6af-0c1ce8d6a312
00020000-55fc-5db0-18ee-4246785ea359	00030000-55fc-5daf-8c4c-fb1743388fb2
00020000-55fc-5db0-18ee-4246785ea359	00030000-55fc-5daf-b61b-4cbf7f2d0cab
00020000-55fc-5db0-18ee-4246785ea359	00030000-55fc-5daf-0474-c180ce602840
00020000-55fc-5db0-18ee-4246785ea359	00030000-55fc-5daf-e5ab-24aeffaf444f
00020000-55fc-5db0-18ee-4246785ea359	00030000-55fc-5daf-7d1d-050d0058f603
00020000-55fc-5db0-18ee-4246785ea359	00030000-55fc-5daf-920a-4db77b9b1885
00020000-55fc-5db0-18ee-4246785ea359	00030000-55fc-5daf-7c3f-dfc9db8d7925
00020000-55fc-5db0-18ee-4246785ea359	00030000-55fc-5daf-dbe8-0865791b6349
00020000-55fc-5db0-18ee-4246785ea359	00030000-55fc-5daf-57c1-b6a79b9da69d
00020000-55fc-5db0-18ee-4246785ea359	00030000-55fc-5daf-cf61-a00243d4c31e
00020000-55fc-5db0-18ee-4246785ea359	00030000-55fc-5daf-51ac-361b970818ba
00020000-55fc-5db0-18ee-4246785ea359	00030000-55fc-5daf-6687-88768f37a12c
00020000-55fc-5db0-18ee-4246785ea359	00030000-55fc-5daf-013e-683498ce5126
00020000-55fc-5db0-18ee-4246785ea359	00030000-55fc-5daf-6e9a-776cae6ac8fd
00020000-55fc-5db0-18ee-4246785ea359	00030000-55fc-5daf-f763-f1bf7c8eacfd
00020000-55fc-5db0-18ee-4246785ea359	00030000-55fc-5daf-a33b-8b9d02e07753
00020000-55fc-5db0-18ee-4246785ea359	00030000-55fc-5daf-6580-c8a325b500d5
00020000-55fc-5db0-18ee-4246785ea359	00030000-55fc-5daf-448e-5f53be8eee89
00020000-55fc-5db0-18ee-4246785ea359	00030000-55fc-5daf-8877-bf82ab6f73d6
00020000-55fc-5db0-18ee-4246785ea359	00030000-55fc-5daf-dab0-b42e91c7444e
00020000-55fc-5db0-18ee-4246785ea359	00030000-55fc-5daf-c525-e04f64f5d187
00020000-55fc-5db0-18ee-4246785ea359	00030000-55fc-5daf-90e4-254bc63aecd9
00020000-55fc-5db0-18ee-4246785ea359	00030000-55fc-5daf-35fe-5bce6a038e37
00020000-55fc-5db0-18ee-4246785ea359	00030000-55fc-5daf-c234-e3213bad0329
00020000-55fc-5db0-18ee-4246785ea359	00030000-55fc-5daf-75e3-1e800935b87f
00020000-55fc-5db0-18ee-4246785ea359	00030000-55fc-5daf-3d0f-2ce82f8e36ec
00020000-55fc-5db0-18ee-4246785ea359	00030000-55fc-5daf-e752-b5e460b3854e
00020000-55fc-5db0-18ee-4246785ea359	00030000-55fc-5daf-6d86-ecfa1b6a3098
00020000-55fc-5db0-18ee-4246785ea359	00030000-55fc-5daf-6e91-8cedc4eae2f0
00020000-55fc-5db0-18ee-4246785ea359	00030000-55fc-5daf-3680-c7868e7213c1
00020000-55fc-5db0-18ee-4246785ea359	00030000-55fc-5daf-9bad-800be299735f
00020000-55fc-5db0-18ee-4246785ea359	00030000-55fc-5daf-5e96-8c57a22eee42
00020000-55fc-5db0-18ee-4246785ea359	00030000-55fc-5daf-d7c6-916e67a820e6
00020000-55fc-5db0-18ee-4246785ea359	00030000-55fc-5daf-d61e-027f7ed3e715
00020000-55fc-5db0-18ee-4246785ea359	00030000-55fc-5daf-c0be-dd04517a2c39
00020000-55fc-5db0-18ee-4246785ea359	00030000-55fc-5daf-0c20-18dd35ba8bdb
00020000-55fc-5db0-18ee-4246785ea359	00030000-55fc-5daf-be13-8bda0591d316
00020000-55fc-5db0-18ee-4246785ea359	00030000-55fc-5daf-63f8-12bff370b281
00020000-55fc-5db0-18ee-4246785ea359	00030000-55fc-5daf-a760-3e9693510016
00020000-55fc-5db0-18ee-4246785ea359	00030000-55fc-5daf-9785-5362ad06d074
00020000-55fc-5db0-18ee-4246785ea359	00030000-55fc-5daf-bcb3-08b17af1dfbf
00020000-55fc-5db0-18ee-4246785ea359	00030000-55fc-5daf-5059-3e0496c5aa89
00020000-55fc-5db0-18ee-4246785ea359	00030000-55fc-5daf-b0c6-f0ee8a2efa41
00020000-55fc-5db0-18ee-4246785ea359	00030000-55fc-5daf-1dd3-a6444cb38aeb
00020000-55fc-5db0-18ee-4246785ea359	00030000-55fc-5daf-690e-af6da670901a
00020000-55fc-5db0-18ee-4246785ea359	00030000-55fc-5daf-17a7-c222abcb7210
00020000-55fc-5db0-18ee-4246785ea359	00030000-55fc-5daf-b464-67da49d6213a
00020000-55fc-5db0-18ee-4246785ea359	00030000-55fc-5daf-bb81-272101778aaa
00020000-55fc-5db0-18ee-4246785ea359	00030000-55fc-5daf-7fce-0d403c0dc2aa
00020000-55fc-5db0-18ee-4246785ea359	00030000-55fc-5daf-7bdc-3e8cd19843cc
00020000-55fc-5db0-18ee-4246785ea359	00030000-55fc-5daf-8968-4a388d83a2be
00020000-55fc-5db0-18ee-4246785ea359	00030000-55fc-5daf-a4b5-54ba6d53c0e4
00020000-55fc-5db0-18ee-4246785ea359	00030000-55fc-5daf-9f71-3461d143e25a
00020000-55fc-5db0-18ee-4246785ea359	00030000-55fc-5daf-efcf-2463062548ea
00020000-55fc-5db0-18ee-4246785ea359	00030000-55fc-5daf-590b-aee7ff86e7f6
00020000-55fc-5db0-18ee-4246785ea359	00030000-55fc-5daf-c2a0-29f58001dcb5
00020000-55fc-5db0-18ee-4246785ea359	00030000-55fc-5daf-9a11-7672fb32f975
00020000-55fc-5db0-18ee-4246785ea359	00030000-55fc-5daf-4101-6b5e9a5310aa
00020000-55fc-5db0-18ee-4246785ea359	00030000-55fc-5daf-1df6-22ce2a346cb4
00020000-55fc-5db0-18ee-4246785ea359	00030000-55fc-5daf-09eb-76a1e9844545
00020000-55fc-5db0-18ee-4246785ea359	00030000-55fc-5daf-fc90-03a96cdb27f2
00020000-55fc-5db0-18ee-4246785ea359	00030000-55fc-5daf-264e-85a90f733180
00020000-55fc-5db0-18ee-4246785ea359	00030000-55fc-5daf-e774-5f6b837c89b0
00020000-55fc-5db0-18ee-4246785ea359	00030000-55fc-5daf-2368-8bb0f662f565
00020000-55fc-5db0-18ee-4246785ea359	00030000-55fc-5daf-b6a5-c0b9d0bea017
00020000-55fc-5db0-18ee-4246785ea359	00030000-55fc-5daf-9cfd-d47768aed58a
00020000-55fc-5db0-18ee-4246785ea359	00030000-55fc-5daf-29e7-6ced36c28040
00020000-55fc-5db0-18ee-4246785ea359	00030000-55fc-5daf-6ccc-7cfdd85ca6e5
00020000-55fc-5db0-18ee-4246785ea359	00030000-55fc-5daf-855a-a5fc17392a47
00020000-55fc-5db0-18ee-4246785ea359	00030000-55fc-5daf-6cb6-b61720443ea6
00020000-55fc-5db0-18ee-4246785ea359	00030000-55fc-5daf-468a-0b81ad11cb05
00020000-55fc-5db0-18ee-4246785ea359	00030000-55fc-5daf-923b-29ef09f985c1
00020000-55fc-5db0-18ee-4246785ea359	00030000-55fc-5daf-c0d8-6cb016ecda5b
00020000-55fc-5db0-18ee-4246785ea359	00030000-55fc-5daf-993a-b2c58b3d88dd
00020000-55fc-5db0-18ee-4246785ea359	00030000-55fc-5daf-786f-ca50b5849e9a
00020000-55fc-5db0-18ee-4246785ea359	00030000-55fc-5daf-66f7-159d41efabbe
00020000-55fc-5db0-18ee-4246785ea359	00030000-55fc-5daf-d2cf-61f44f196c8a
00020000-55fc-5db0-18ee-4246785ea359	00030000-55fc-5daf-f6ca-05be320ec1e0
00020000-55fc-5db0-18ee-4246785ea359	00030000-55fc-5daf-fd53-080af143f751
00020000-55fc-5db0-18ee-4246785ea359	00030000-55fc-5daf-67f6-20ac56649e96
00020000-55fc-5db0-18ee-4246785ea359	00030000-55fc-5daf-ac95-a6913a1dbcf8
00020000-55fc-5db0-18ee-4246785ea359	00030000-55fc-5daf-3323-677952d5ac83
00020000-55fc-5db0-18ee-4246785ea359	00030000-55fc-5daf-988f-ee40b97124f9
00020000-55fc-5db0-18ee-4246785ea359	00030000-55fc-5daf-eceb-1bc98259350d
00020000-55fc-5db0-18ee-4246785ea359	00030000-55fc-5daf-f7f4-262d0e6cf71f
00020000-55fc-5db0-18ee-4246785ea359	00030000-55fc-5daf-30cc-5c07f6530980
00020000-55fc-5db0-18ee-4246785ea359	00030000-55fc-5daf-cfbe-d02847ff512e
00020000-55fc-5db0-18ee-4246785ea359	00030000-55fc-5daf-c360-a549a94cd4da
00020000-55fc-5db0-18ee-4246785ea359	00030000-55fc-5daf-6559-d1fe86e8c1b5
00020000-55fc-5db0-18ee-4246785ea359	00030000-55fc-5daf-de7d-94bc5d3ebd32
00020000-55fc-5db0-18ee-4246785ea359	00030000-55fc-5daf-7878-739a493432d1
00020000-55fc-5db0-18ee-4246785ea359	00030000-55fc-5daf-e4bf-9de4dade91a8
00020000-55fc-5db0-18ee-4246785ea359	00030000-55fc-5daf-a2c0-ef38c2542f3a
00020000-55fc-5db0-18ee-4246785ea359	00030000-55fc-5daf-a12e-1b2318a50c9e
00020000-55fc-5db0-18ee-4246785ea359	00030000-55fc-5daf-2a3a-356eb358be09
00020000-55fc-5db0-18ee-4246785ea359	00030000-55fc-5daf-b591-a315afddbecf
00020000-55fc-5db0-18ee-4246785ea359	00030000-55fc-5daf-8a52-87cccc3b4178
00020000-55fc-5db0-18ee-4246785ea359	00030000-55fc-5daf-9b31-3b438d33b242
00020000-55fc-5db0-18ee-4246785ea359	00030000-55fc-5daf-5b61-c70a019d6735
00020000-55fc-5db0-18ee-4246785ea359	00030000-55fc-5daf-8376-dc55c17fada1
00020000-55fc-5db0-18ee-4246785ea359	00030000-55fc-5daf-2b37-65ea3d5909bf
00020000-55fc-5db0-18ee-4246785ea359	00030000-55fc-5daf-ee90-94d21d8dd315
00020000-55fc-5db0-18ee-4246785ea359	00030000-55fc-5daf-7d23-5bccd158ee53
00020000-55fc-5db0-18ee-4246785ea359	00030000-55fc-5daf-5316-1c046e82161f
00020000-55fc-5db0-18ee-4246785ea359	00030000-55fc-5daf-d22a-5dcf8ddfda2c
00020000-55fc-5db0-18ee-4246785ea359	00030000-55fc-5daf-98e1-9c73477ef24d
00020000-55fc-5db0-18ee-4246785ea359	00030000-55fc-5daf-73e9-32da29253b69
00020000-55fc-5db0-18ee-4246785ea359	00030000-55fc-5daf-7d7b-fc6e6bc0394f
00020000-55fc-5db0-18ee-4246785ea359	00030000-55fc-5daf-5fd0-de41cd33e192
00020000-55fc-5db0-18ee-4246785ea359	00030000-55fc-5daf-14de-62aa906c149e
00020000-55fc-5db0-18ee-4246785ea359	00030000-55fc-5daf-998b-555eacf25502
00020000-55fc-5db0-18ee-4246785ea359	00030000-55fc-5daf-e3d3-96a88358b51c
00020000-55fc-5db0-18ee-4246785ea359	00030000-55fc-5daf-72b9-4e713179a403
00020000-55fc-5db0-18ee-4246785ea359	00030000-55fc-5daf-c222-6e4281a5aebc
00020000-55fc-5db0-18ee-4246785ea359	00030000-55fc-5daf-7d52-56684f881b73
00020000-55fc-5db0-18ee-4246785ea359	00030000-55fc-5daf-863f-f687203bac04
00020000-55fc-5db0-18ee-4246785ea359	00030000-55fc-5daf-66e7-de3c503578b1
00020000-55fc-5db0-18ee-4246785ea359	00030000-55fc-5daf-5e9a-338ff2542950
00020000-55fc-5db0-18ee-4246785ea359	00030000-55fc-5daf-32a0-eacf97d94b5d
00020000-55fc-5db0-18ee-4246785ea359	00030000-55fc-5daf-b6e5-25f739c78262
00020000-55fc-5db0-18ee-4246785ea359	00030000-55fc-5daf-1df2-c7bbb58c699f
00020000-55fc-5db0-18ee-4246785ea359	00030000-55fc-5daf-35b3-3a18bf0bfab1
00020000-55fc-5db0-18ee-4246785ea359	00030000-55fc-5daf-b113-e47b50837113
00020000-55fc-5db0-18ee-4246785ea359	00030000-55fc-5daf-a425-2f177178221b
00020000-55fc-5db0-18ee-4246785ea359	00030000-55fc-5daf-0e42-dd63ba0ca1d1
00020000-55fc-5db0-18ee-4246785ea359	00030000-55fc-5daf-0b29-efa510ee8ff5
00020000-55fc-5db0-18ee-4246785ea359	00030000-55fc-5daf-0da6-7dd3685d0c8b
00020000-55fc-5db0-18ee-4246785ea359	00030000-55fc-5daf-a74a-283659898e9b
00020000-55fc-5db0-18ee-4246785ea359	00030000-55fc-5daf-9aac-0c4e88f741bc
00020000-55fc-5db0-18ee-4246785ea359	00030000-55fc-5daf-eb3d-04294ea56b6a
00020000-55fc-5db0-18ee-4246785ea359	00030000-55fc-5daf-2f96-74d890e0a00b
00020000-55fc-5db0-18ee-4246785ea359	00030000-55fc-5daf-0418-539789aa5dea
00020000-55fc-5db0-18ee-4246785ea359	00030000-55fc-5daf-7f5b-488fc4606944
00020000-55fc-5db0-18ee-4246785ea359	00030000-55fc-5daf-3e99-3f2e0bf34412
00020000-55fc-5db0-18ee-4246785ea359	00030000-55fc-5daf-f33d-4e9334a25cff
\.


--
-- TOC entry 2971 (class 0 OID 20127796)
-- Dependencies: 207
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 2975 (class 0 OID 20127830)
-- Dependencies: 211
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 2987 (class 0 OID 20127964)
-- Dependencies: 223
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, zacetek, konec, jeavtorskepravice, placilonavajo, vrednostvaje, planiranostevilovaj, vrednostvaj, vrednostpredstave, vrednostdopremiere, aktivna, zaposlenvdrjz, samozaposlen, igralec, opis) FROM stdin;
000b0000-55fc-5db0-7631-f249a11374c1	00090000-55fc-5db0-e8aa-36dd7ba759a9	\N	\N	0001	\N	\N	f	f	10.00	3	10.00	30.00	10.00	t	t	f	t	Pogodba o sodelovanju
000b0000-55fc-5db0-9199-989ba95f179b	00090000-55fc-5db0-908d-e6c2bd94dc48	\N	\N	0002	\N	\N	f	t	11.00	10	11.00	31.00	110.00	t	f	t	t	Pogodba za vlogo Helena
000b0000-55fc-5db0-75f6-fa87079e4722	00090000-55fc-5db0-0c1a-258effc64388	\N	\N	0003	\N	\N	f	f	12.00	4	12.00	32.00	12.00	t	f	t	f	Pogodba za lektoriranje
000b0000-55fc-5db0-9a12-86d075437ed4	00090000-55fc-5db0-edd2-568929ab35f4	\N	\N	0004	\N	\N	t	f	0.00	2	300.00	30.00	300.00	t	f	t	f	Pogodba za avtorske pravice
\.


--
-- TOC entry 2949 (class 0 OID 20127557)
-- Dependencies: 185
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, drzava_id, sifra, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo, nvo) FROM stdin;
00080000-55fc-5db0-cffd-eb999c47f5f0	00040000-55fc-5daf-b629-3022bb037896	0988	AK	Juhuhu d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55fc-5db0-4f6e-14d22d5864f5	00040000-55fc-5daf-b629-3022bb037896	0989	AK	Hopsasa d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	t
00080000-55fc-5db0-b804-376e741a2898	00040000-55fc-5daf-b629-3022bb037896	0987	AK	Gledališče Šrum d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55fc-5db0-59d5-7bbe11256ff1	00040000-55fc-5daf-b629-3022bb037896	0986	AK	Lutkovni Direndaj d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55fc-5db0-bfd8-54e81677e913	00040000-55fc-5daf-b629-3022bb037896	0985	AK	Tatjana Stanič, Lektoriranje, s.p.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55fc-5db0-abc1-0f50040c3665	00040000-55fc-5dae-2a1e-57d054602325	0984	AK	Gledališče Lepote tvoje		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55fc-5db0-8923-162f03b9b046	00040000-55fc-5dae-a50b-c949c860429d	0983	AK	Sunce naše		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55fc-5db0-a947-9b7eab9f83e2	00040000-55fc-5dae-2070-7d4370550409	0982	AK	Theater Amadeus		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55fc-5db0-c401-4ee5e1008861	00040000-55fc-5daf-e6d9-8bca2d21fa58	9999	AK	Fuchs		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55fc-5db1-5648-f28ccb4eb6f9	00040000-55fc-5daf-b629-3022bb037896	1001	AK	Gledališče Matica		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
\.


--
-- TOC entry 2951 (class 0 OID 20127591)
-- Dependencies: 187
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-55fc-5dae-97ad-d8c45303a90f	8341	Adlešiči
00050000-55fc-5dae-b245-fabcf5f49bf9	5270	Ajdovščina
00050000-55fc-5dae-bd72-5419fe1bf7f8	6280	Ankaran/Ancarano
00050000-55fc-5dae-1b97-504176846e7f	9253	Apače
00050000-55fc-5dae-0c1f-119a5d4f581c	8253	Artiče
00050000-55fc-5dae-307e-da2416fad3be	4275	Begunje na Gorenjskem
00050000-55fc-5dae-866f-0d0b6072da7f	1382	Begunje pri Cerknici
00050000-55fc-5dae-46dc-cb72e93b0eb6	9231	Beltinci
00050000-55fc-5dae-6968-0a45883bac20	2234	Benedikt
00050000-55fc-5dae-dd33-247f738abe08	2345	Bistrica ob Dravi
00050000-55fc-5dae-a53c-fafb9da581c4	3256	Bistrica ob Sotli
00050000-55fc-5dae-41d9-f34470bade1b	8259	Bizeljsko
00050000-55fc-5dae-afb1-1c6e8ff262b5	1223	Blagovica
00050000-55fc-5dae-f823-212b0df41376	8283	Blanca
00050000-55fc-5dae-80d0-ce55138af844	4260	Bled
00050000-55fc-5dae-7b86-8ffef0848108	4273	Blejska Dobrava
00050000-55fc-5dae-2bad-618a9cdb3d45	9265	Bodonci
00050000-55fc-5dae-9cbb-573e94553d26	9222	Bogojina
00050000-55fc-5dae-8392-56aa48f0d4d8	4263	Bohinjska Bela
00050000-55fc-5dae-3196-ae492e7ea87b	4264	Bohinjska Bistrica
00050000-55fc-5dae-b4f9-fd4d383581b1	4265	Bohinjsko jezero
00050000-55fc-5dae-d07b-1faf63e29f0d	1353	Borovnica
00050000-55fc-5dae-99e6-48e524dc5d74	8294	Boštanj
00050000-55fc-5dae-9c97-7ddef425c671	5230	Bovec
00050000-55fc-5dae-a144-05fe2347c8d9	5295	Branik
00050000-55fc-5dae-437b-e384153e9224	3314	Braslovče
00050000-55fc-5dae-b448-f66c39678ee8	5223	Breginj
00050000-55fc-5dae-b944-669064d06b62	8280	Brestanica
00050000-55fc-5dae-7d12-9cdc00e14262	2354	Bresternica
00050000-55fc-5dae-7462-c0ac87f7aedb	4243	Brezje
00050000-55fc-5dae-4d91-9efe45b39ed7	1351	Brezovica pri Ljubljani
00050000-55fc-5dae-dcc8-236b3baee9c4	8250	Brežice
00050000-55fc-5dae-4450-b1e6bbc7be84	4210	Brnik - Aerodrom
00050000-55fc-5dae-6c51-01ba0c791806	8321	Brusnice
00050000-55fc-5dae-65ed-1da99c9aa5ef	3255	Buče
00050000-55fc-5dae-a220-3f8fef5d14fd	8276	Bučka 
00050000-55fc-5dae-fd60-5a2786f85149	9261	Cankova
00050000-55fc-5dae-19ba-e57849f2a77d	3000	Celje 
00050000-55fc-5dae-22cd-a57e35fe520f	3001	Celje - poštni predali
00050000-55fc-5dae-7eb8-9329416283bc	4207	Cerklje na Gorenjskem
00050000-55fc-5dae-c975-3342cdb0b467	8263	Cerklje ob Krki
00050000-55fc-5dae-3ba6-3a1517ce5040	1380	Cerknica
00050000-55fc-5dae-a018-74dcc935fb54	5282	Cerkno
00050000-55fc-5dae-8640-472357993057	2236	Cerkvenjak
00050000-55fc-5dae-10d4-6749fcd1c9f1	2215	Ceršak
00050000-55fc-5dae-65c1-6f30b8267901	2326	Cirkovce
00050000-55fc-5dae-5cf4-df732d77b883	2282	Cirkulane
00050000-55fc-5dae-ed9d-0221d2b7ac22	5273	Col
00050000-55fc-5dae-c9da-262ba178f042	8251	Čatež ob Savi
00050000-55fc-5dae-4838-c89af48c23ba	1413	Čemšenik
00050000-55fc-5dae-ea80-d6e01d5d0743	5253	Čepovan
00050000-55fc-5dae-bd0d-1d821450512c	9232	Črenšovci
00050000-55fc-5dae-bda5-9b0e255ce026	2393	Črna na Koroškem
00050000-55fc-5dae-35d9-1b69d8d9a350	6275	Črni Kal
00050000-55fc-5dae-95a5-937c7e3d2d26	5274	Črni Vrh nad Idrijo
00050000-55fc-5dae-bf61-512430db3f46	5262	Črniče
00050000-55fc-5dae-da9b-3c158df77595	8340	Črnomelj
00050000-55fc-5dae-c252-916abb0a0b06	6271	Dekani
00050000-55fc-5dae-a49f-22e1c19902b8	5210	Deskle
00050000-55fc-5dae-6fe0-de79ad71da1f	2253	Destrnik
00050000-55fc-5dae-e8a2-b97267963de6	6215	Divača
00050000-55fc-5dae-ca6a-f1e65bc11d2b	1233	Dob
00050000-55fc-5dae-b9a0-d3861eb4531a	3224	Dobje pri Planini
00050000-55fc-5dae-b818-8d2a24aef6ce	8257	Dobova
00050000-55fc-5dae-3856-d4aa19ebbff5	1423	Dobovec
00050000-55fc-5dae-4be8-bb8902b80a58	5263	Dobravlje
00050000-55fc-5dae-68a5-ae64ac6a3528	3204	Dobrna
00050000-55fc-5dae-1586-c3b43ec187e4	8211	Dobrnič
00050000-55fc-5dae-9514-d727406e191c	1356	Dobrova
00050000-55fc-5dae-48a9-599aedbca29b	9223	Dobrovnik/Dobronak 
00050000-55fc-5dae-5ec3-48c7a3167845	5212	Dobrovo v Brdih
00050000-55fc-5dae-37fc-b513632cbec7	1431	Dol pri Hrastniku
00050000-55fc-5dae-82f1-fd5db7efaf47	1262	Dol pri Ljubljani
00050000-55fc-5dae-d1d8-24b8f7fc5cea	1273	Dole pri Litiji
00050000-55fc-5dae-c13f-9073aec8086b	1331	Dolenja vas
00050000-55fc-5dae-9a54-f9c719cdac55	8350	Dolenjske Toplice
00050000-55fc-5dae-5f48-b68df5fc5908	1230	Domžale
00050000-55fc-5dae-c937-c32fe9ad21ca	2252	Dornava
00050000-55fc-5dae-e9b2-030d90b563e5	5294	Dornberk
00050000-55fc-5dae-aab3-8822f7a4eefd	1319	Draga
00050000-55fc-5dae-42e5-b29705e081af	8343	Dragatuš
00050000-55fc-5dae-656d-3da16dc5b31e	3222	Dramlje
00050000-55fc-5dae-e158-bdb1d610b208	2370	Dravograd
00050000-55fc-5dae-38bc-973d58169efb	4203	Duplje
00050000-55fc-5dae-5248-94cee4b973ec	6221	Dutovlje
00050000-55fc-5dae-f903-7c3c3fd4fd1b	8361	Dvor
00050000-55fc-5dae-f8a2-4e71fe596c99	2343	Fala
00050000-55fc-5dae-3d8c-52a787eb96af	9208	Fokovci
00050000-55fc-5dae-9bb5-1faf742dcb45	2313	Fram
00050000-55fc-5dae-9dd2-77c39647d77a	3213	Frankolovo
00050000-55fc-5dae-d404-87d5eb9e489c	1274	Gabrovka
00050000-55fc-5dae-ac3b-6643c5d92afb	8254	Globoko
00050000-55fc-5dae-6c13-442054c60e25	5275	Godovič
00050000-55fc-5dae-fd65-51e91140c9c4	4204	Golnik
00050000-55fc-5dae-48e5-0a5e509b1d07	3303	Gomilsko
00050000-55fc-5dae-ac79-d73257f2e37d	4224	Gorenja vas
00050000-55fc-5dae-8677-f2156e8e92a0	3263	Gorica pri Slivnici
00050000-55fc-5dae-57a0-25e1763fe94d	2272	Gorišnica
00050000-55fc-5dae-5daa-f4dfb0ff76ab	9250	Gornja Radgona
00050000-55fc-5dae-46cd-696826e91629	3342	Gornji Grad
00050000-55fc-5dae-9c30-4f66b72a5f17	4282	Gozd Martuljek
00050000-55fc-5dae-53bc-1d8135a7c0dd	6272	Gračišče
00050000-55fc-5dae-f9fa-abacd565b948	9264	Grad
00050000-55fc-5dae-a5f4-02b3007f2438	8332	Gradac
00050000-55fc-5dae-5cd0-eb09f6de62ca	1384	Grahovo
00050000-55fc-5dae-3928-35aa45f53483	5242	Grahovo ob Bači
00050000-55fc-5dae-f9f0-1e53b56c5a64	5251	Grgar
00050000-55fc-5dae-a46b-aa5479b7835a	3302	Griže
00050000-55fc-5dae-0fc4-5ae3a1a54549	3231	Grobelno
00050000-55fc-5dae-ee4d-7a0fc22c8423	1290	Grosuplje
00050000-55fc-5dae-6d9c-3353bd75bfed	2288	Hajdina
00050000-55fc-5dae-1e62-078141a9c91e	8362	Hinje
00050000-55fc-5dae-ce69-80e3c837d38c	2311	Hoče
00050000-55fc-5dae-78eb-674728192911	9205	Hodoš/Hodos
00050000-55fc-5dae-7af7-d6a5c5d04ca9	1354	Horjul
00050000-55fc-5dae-4539-9803b48c2bd2	1372	Hotedršica
00050000-55fc-5dae-fa93-d76a725e1d04	1430	Hrastnik
00050000-55fc-5dae-9226-e63d9977a7ec	6225	Hruševje
00050000-55fc-5dae-7714-fdaebd09cf43	4276	Hrušica
00050000-55fc-5dae-5e19-f63013bddf2b	5280	Idrija
00050000-55fc-5dae-e80b-8cda85e78f8d	1292	Ig
00050000-55fc-5dae-92d2-aaf1e4fc0417	6250	Ilirska Bistrica
00050000-55fc-5dae-9e5b-486d3705897a	6251	Ilirska Bistrica-Trnovo
00050000-55fc-5dae-d384-c94e73b0fa6c	1295	Ivančna Gorica
00050000-55fc-5dae-9829-72cd4c437d75	2259	Ivanjkovci
00050000-55fc-5dae-a309-8bc64ab699ac	1411	Izlake
00050000-55fc-5dae-7f17-09192b93f763	6310	Izola/Isola
00050000-55fc-5dae-1ff6-8e9de596e0cb	2222	Jakobski Dol
00050000-55fc-5dae-732a-63bc49c00c43	2221	Jarenina
00050000-55fc-5dae-d8bd-915bb0d09fde	6254	Jelšane
00050000-55fc-5dae-7d2c-4348f8088cd6	4270	Jesenice
00050000-55fc-5dae-4471-7acd9d1abb44	8261	Jesenice na Dolenjskem
00050000-55fc-5dae-ba43-92a2e7727327	3273	Jurklošter
00050000-55fc-5dae-2206-c6862705b640	2223	Jurovski Dol
00050000-55fc-5dae-675b-4d93881a1b13	2256	Juršinci
00050000-55fc-5dae-8c2a-f330b49cb98c	5214	Kal nad Kanalom
00050000-55fc-5dae-492e-6098765c0b77	3233	Kalobje
00050000-55fc-5dae-6d21-59571690d729	4246	Kamna Gorica
00050000-55fc-5dae-421d-7cffad3023f2	2351	Kamnica
00050000-55fc-5dae-d458-7b9e3c8fe6b4	1241	Kamnik
00050000-55fc-5dae-5fb4-be07c1a1b83a	5213	Kanal
00050000-55fc-5dae-5938-046b6f9c313e	8258	Kapele
00050000-55fc-5dae-f4fc-74aa728fce9c	2362	Kapla
00050000-55fc-5dae-5dae-6432245d9b0d	2325	Kidričevo
00050000-55fc-5dae-aa9f-5bbdd1a5138f	1412	Kisovec
00050000-55fc-5dae-2306-0b801201da54	6253	Knežak
00050000-55fc-5dae-f4eb-bb9502685b84	5222	Kobarid
00050000-55fc-5dae-3988-22405ca86751	9227	Kobilje
00050000-55fc-5dae-ae2e-516d938c85db	1330	Kočevje
00050000-55fc-5dae-8127-26d882930587	1338	Kočevska Reka
00050000-55fc-5dae-dfec-1c83b5b3e217	2276	Kog
00050000-55fc-5dae-3b12-003d3372a9d5	5211	Kojsko
00050000-55fc-5dae-b42e-865bc341ac37	6223	Komen
00050000-55fc-5dae-e0a2-761486e33554	1218	Komenda
00050000-55fc-5dae-7d2e-e1bc223538ab	6000	Koper/Capodistria 
00050000-55fc-5dae-6c1f-0d966b33adbf	6001	Koper/Capodistria - poštni predali
00050000-55fc-5dae-877a-002154237bce	8282	Koprivnica
00050000-55fc-5dae-0742-d796b7b5e3db	5296	Kostanjevica na Krasu
00050000-55fc-5dae-f587-d29323cb6488	8311	Kostanjevica na Krki
00050000-55fc-5dae-45da-e6afb173da20	1336	Kostel
00050000-55fc-5dae-a858-415c7d680265	6256	Košana
00050000-55fc-5dae-0997-46dd55f740fc	2394	Kotlje
00050000-55fc-5dae-1a1f-16bcbfd63b52	6240	Kozina
00050000-55fc-5dae-aeba-ea61529e4c3d	3260	Kozje
00050000-55fc-5dae-6204-cc1d0fb8bb0f	4000	Kranj 
00050000-55fc-5dae-002f-323a497f0609	4001	Kranj - poštni predali
00050000-55fc-5dae-7cb2-26c613530f72	4280	Kranjska Gora
00050000-55fc-5dae-e24f-bfdf855cfed5	1281	Kresnice
00050000-55fc-5dae-2a51-bd3769906ffc	4294	Križe
00050000-55fc-5dae-97a1-5c8e6ac728bd	9206	Križevci
00050000-55fc-5dae-fafc-3b8c3b9b0646	9242	Križevci pri Ljutomeru
00050000-55fc-5dae-1211-4eea943b2079	1301	Krka
00050000-55fc-5dae-3fec-37c3a9f2ed37	8296	Krmelj
00050000-55fc-5dae-b6ef-87b335eb7225	4245	Kropa
00050000-55fc-5dae-b0ea-502d3fe2cf95	8262	Krška vas
00050000-55fc-5dae-eaa2-4dfbedf76cd1	8270	Krško
00050000-55fc-5dae-d5d0-0e48cd423ca0	9263	Kuzma
00050000-55fc-5dae-b919-7b11ee129cf3	2318	Laporje
00050000-55fc-5dae-3b4f-2eaebdbe3daf	3270	Laško
00050000-55fc-5dae-0638-6f6ff4d92543	1219	Laze v Tuhinju
00050000-55fc-5dae-e151-324e2fcd82d1	2230	Lenart v Slovenskih goricah
00050000-55fc-5dae-e6c8-c1dd99086076	9220	Lendava/Lendva
00050000-55fc-5dae-e7bd-853466f42600	4248	Lesce
00050000-55fc-5dae-dcfe-e748e2d07ec5	3261	Lesično
00050000-55fc-5dae-138f-57e61ea0e53b	8273	Leskovec pri Krškem
00050000-55fc-5dae-8898-4aa2160ed708	2372	Libeliče
00050000-55fc-5dae-45fa-f52597adda59	2341	Limbuš
00050000-55fc-5dae-689f-e7bb8edc8124	1270	Litija
00050000-55fc-5dae-9c32-d25eaf2ed112	3202	Ljubečna
00050000-55fc-5dae-087a-dcc5617030b4	1000	Ljubljana 
00050000-55fc-5dae-917c-ddb2b54a3744	1001	Ljubljana - poštni predali
00050000-55fc-5dae-b984-a84e56058ab2	1231	Ljubljana - Črnuče
00050000-55fc-5dae-125a-b02064a65594	1261	Ljubljana - Dobrunje
00050000-55fc-5dae-9571-3b94014e72bd	1260	Ljubljana - Polje
00050000-55fc-5dae-701f-1effdb1ff018	1210	Ljubljana - Šentvid
00050000-55fc-5dae-cc08-8f35a7f6bb3c	1211	Ljubljana - Šmartno
00050000-55fc-5dae-2f8b-39209d40466c	3333	Ljubno ob Savinji
00050000-55fc-5dae-032e-42fe9746864b	9240	Ljutomer
00050000-55fc-5dae-7375-e70443cc5ddc	3215	Loče
00050000-55fc-5dae-48ad-8418406b55c7	5231	Log pod Mangartom
00050000-55fc-5dae-b387-3b9e3a3c89ee	1358	Log pri Brezovici
00050000-55fc-5dae-a72c-919779cb85c0	1370	Logatec
00050000-55fc-5dae-0a4b-243f6485e3a0	1371	Logatec
00050000-55fc-5dae-86c6-cbc93363bc75	1434	Loka pri Zidanem Mostu
00050000-55fc-5dae-62af-c979d9ff9f11	3223	Loka pri Žusmu
00050000-55fc-5dae-a171-a18988716b56	6219	Lokev
00050000-55fc-5dae-aaae-53941f3b5e2c	1318	Loški Potok
00050000-55fc-5dae-e1bf-eeeae1010c98	2324	Lovrenc na Dravskem polju
00050000-55fc-5dae-20cd-cfc59acbf67f	2344	Lovrenc na Pohorju
00050000-55fc-5dae-1fc5-ba681b9c3dd3	3334	Luče
00050000-55fc-5dae-3046-82d301779f65	1225	Lukovica
00050000-55fc-5dae-d76c-51c08f3a3e3f	9202	Mačkovci
00050000-55fc-5dae-1f66-5db6e088c8d0	2322	Majšperk
00050000-55fc-5dae-0a9c-b2920d94dbed	2321	Makole
00050000-55fc-5dae-269a-7e64edeca21d	9243	Mala Nedelja
00050000-55fc-5dae-4779-d5c2a62edfbe	2229	Malečnik
00050000-55fc-5dae-ee87-43b285f35c0a	6273	Marezige
00050000-55fc-5dae-cd09-8b8b1c0913de	2000	Maribor 
00050000-55fc-5dae-53e0-47f284e57507	2001	Maribor - poštni predali
00050000-55fc-5dae-04d6-c340a0404d42	2206	Marjeta na Dravskem polju
00050000-55fc-5dae-2bb6-2d43206aae02	2281	Markovci
00050000-55fc-5dae-99e3-faa7074a2b62	9221	Martjanci
00050000-55fc-5dae-3cd6-b76d861113fe	6242	Materija
00050000-55fc-5dae-f78d-3fb8fbecd8fc	4211	Mavčiče
00050000-55fc-5dae-a127-6424a946d2f9	1215	Medvode
00050000-55fc-5dae-b249-c8c7fd89cc82	1234	Mengeš
00050000-55fc-5dae-994b-d237d23985c3	8330	Metlika
00050000-55fc-5dae-2887-ae568f39c290	2392	Mežica
00050000-55fc-5dae-7ada-cc354fc1ae04	2204	Miklavž na Dravskem polju
00050000-55fc-5dae-ec4f-4b2e7c02a95f	2275	Miklavž pri Ormožu
00050000-55fc-5dae-0081-3c3ab7c0b652	5291	Miren
00050000-55fc-5dae-ff83-95948eb94439	8233	Mirna
00050000-55fc-5dae-bd63-52ea6345aede	8216	Mirna Peč
00050000-55fc-5dae-7bf2-7d15f97b2892	2382	Mislinja
00050000-55fc-5dae-6b28-23275060ae3c	4281	Mojstrana
00050000-55fc-5dae-e96a-ffa7cf92a499	8230	Mokronog
00050000-55fc-5dae-6104-059f35d7e7f0	1251	Moravče
00050000-55fc-5dae-aa80-41b582ecfa19	9226	Moravske Toplice
00050000-55fc-5dae-f68d-2e0c3915a8d2	5216	Most na Soči
00050000-55fc-5dae-0d3c-830747915e9a	1221	Motnik
00050000-55fc-5dae-e477-f96accbb96dc	3330	Mozirje
00050000-55fc-5dae-0f22-714452f2f09c	9000	Murska Sobota 
00050000-55fc-5dae-404e-df1ef0bca797	9001	Murska Sobota - poštni predali
00050000-55fc-5dae-b6ed-290b4a0c0faf	2366	Muta
00050000-55fc-5dae-d077-7281ccd4a17a	4202	Naklo
00050000-55fc-5dae-ba61-c953eb0c799f	3331	Nazarje
00050000-55fc-5dae-d42f-a6b2672019f2	1357	Notranje Gorice
00050000-55fc-5dae-928b-a70989f7ce93	3203	Nova Cerkev
00050000-55fc-5dae-66d1-7137b121fee1	5000	Nova Gorica 
00050000-55fc-5dae-e0c6-406fa4bf6942	5001	Nova Gorica - poštni predali
00050000-55fc-5dae-e8c9-ec4de0cc2e9c	1385	Nova vas
00050000-55fc-5dae-4f3d-9b8649ef3d8b	8000	Novo mesto
00050000-55fc-5dae-9339-01e3ab0e8fa0	8001	Novo mesto - poštni predali
00050000-55fc-5dae-66f2-60c6fc006fc0	6243	Obrov
00050000-55fc-5dae-fed9-d2474f4d01fa	9233	Odranci
00050000-55fc-5dae-b947-18a7656ffb55	2317	Oplotnica
00050000-55fc-5dae-a23f-ef8a4c7d8733	2312	Orehova vas
00050000-55fc-5dae-8cc8-d2277dd976a4	2270	Ormož
00050000-55fc-5dae-e8c6-d89844cd9908	1316	Ortnek
00050000-55fc-5dae-56e7-6f45043436f1	1337	Osilnica
00050000-55fc-5dae-aa60-552cc131775b	8222	Otočec
00050000-55fc-5dae-5f99-89315c30476e	2361	Ožbalt
00050000-55fc-5dae-de76-9df9e81715c7	2231	Pernica
00050000-55fc-5dae-9d4b-a8d25f5677a7	2211	Pesnica pri Mariboru
00050000-55fc-5dae-a93b-cf84e48971d9	9203	Petrovci
00050000-55fc-5dae-ad2f-39b2fd7d73fd	3301	Petrovče
00050000-55fc-5dae-ae4a-6d60a88c1cf2	6330	Piran/Pirano
00050000-55fc-5dae-4bff-d112249976ba	8255	Pišece
00050000-55fc-5dae-ed16-c185779b4532	6257	Pivka
00050000-55fc-5dae-91ad-af24a5b03ab4	6232	Planina
00050000-55fc-5dae-9f92-ebc72a05fe93	3225	Planina pri Sevnici
00050000-55fc-5dae-c301-e1c4e79157fb	6276	Pobegi
00050000-55fc-5dae-af1a-c82825bfc5dd	8312	Podbočje
00050000-55fc-5dae-f9e0-d0cd469f818d	5243	Podbrdo
00050000-55fc-5dae-0d39-41b27aafb212	3254	Podčetrtek
00050000-55fc-5dae-63b3-4df8e3603698	2273	Podgorci
00050000-55fc-5dae-ada4-0919d290c262	6216	Podgorje
00050000-55fc-5dae-ea3c-120131ee0a7f	2381	Podgorje pri Slovenj Gradcu
00050000-55fc-5dae-968f-c89c152db7f0	6244	Podgrad
00050000-55fc-5dae-c008-75e2c05a34cb	1414	Podkum
00050000-55fc-5dae-871f-a4356fa3c8f9	2286	Podlehnik
00050000-55fc-5dae-b9f6-f01db398ac2c	5272	Podnanos
00050000-55fc-5dae-16b8-0cfdfedd25ea	4244	Podnart
00050000-55fc-5dae-e747-d20eab3cc9b1	3241	Podplat
00050000-55fc-5dae-9c98-3d3f66977cff	3257	Podsreda
00050000-55fc-5dae-daa7-de400ea32e2d	2363	Podvelka
00050000-55fc-5dae-367c-d3edfacacbef	2208	Pohorje
00050000-55fc-5dae-5ec8-01eff146edaf	2257	Polenšak
00050000-55fc-5dae-3a86-71ca3fa7bcad	1355	Polhov Gradec
00050000-55fc-5dae-d2b7-2983a8f8f3bf	4223	Poljane nad Škofjo Loko
00050000-55fc-5dae-6cc1-236f86997861	2319	Poljčane
00050000-55fc-5dae-3376-6b06b4fa33b2	1272	Polšnik
00050000-55fc-5dae-a8ca-5bbd550eaf2d	3313	Polzela
00050000-55fc-5dae-4bf1-f2f8728d0a3f	3232	Ponikva
00050000-55fc-5dae-cc32-eab3184a5fb5	6320	Portorož/Portorose
00050000-55fc-5dae-b8fc-9c08737d13ab	6230	Postojna
00050000-55fc-5dae-fd20-2e1a4de26a6d	2331	Pragersko
00050000-55fc-5dae-e30a-f36b65de246c	3312	Prebold
00050000-55fc-5dae-9608-b93ecc63dd7c	4205	Preddvor
00050000-55fc-5dae-12d6-b2dd6475e8cd	6255	Prem
00050000-55fc-5dae-1380-498213fb6975	1352	Preserje
00050000-55fc-5dae-c3c8-95a969f1afa6	6258	Prestranek
00050000-55fc-5dae-7eea-dfb76a67dd17	2391	Prevalje
00050000-55fc-5dae-4ad2-08eb000a22ed	3262	Prevorje
00050000-55fc-5dae-c183-8f5ac2302dae	1276	Primskovo 
00050000-55fc-5dae-d8c4-611ea4944cef	3253	Pristava pri Mestinju
00050000-55fc-5dae-6fed-ce3c71e04882	9207	Prosenjakovci/Partosfalva
00050000-55fc-5dae-6852-b383d5a9a00c	5297	Prvačina
00050000-55fc-5dae-29a6-e4f32c2495e9	2250	Ptuj
00050000-55fc-5dae-565c-9e51e8ae360d	2323	Ptujska Gora
00050000-55fc-5dae-331a-dd6c248ab7e6	9201	Puconci
00050000-55fc-5dae-d42e-4385919f39ba	2327	Rače
00050000-55fc-5dae-a52d-12328f3df00d	1433	Radeče
00050000-55fc-5dae-6211-dc3a3dae8c38	9252	Radenci
00050000-55fc-5dae-879d-0c1839f7cea2	2360	Radlje ob Dravi
00050000-55fc-5dae-3a79-4f81dfc6392f	1235	Radomlje
00050000-55fc-5dae-b409-7a15c09c4c43	4240	Radovljica
00050000-55fc-5dae-b9b1-8ed7f32582ed	8274	Raka
00050000-55fc-5dae-e71d-75454fe9cf1e	1381	Rakek
00050000-55fc-5dae-4271-2c7a006729ad	4283	Rateče - Planica
00050000-55fc-5dae-60a1-3720401ca5ca	2390	Ravne na Koroškem
00050000-55fc-5dae-9516-89848ba6e3a6	9246	Razkrižje
00050000-55fc-5dae-53b6-a41e711b5d1e	3332	Rečica ob Savinji
00050000-55fc-5dae-cc0e-d9b2ece9d2ff	5292	Renče
00050000-55fc-5dae-573a-02662a0e823c	1310	Ribnica
00050000-55fc-5dae-7604-aa9014d200e1	2364	Ribnica na Pohorju
00050000-55fc-5dae-6027-0a6b00b0dbe4	3272	Rimske Toplice
00050000-55fc-5dae-459f-da2d0567d24e	1314	Rob
00050000-55fc-5dae-9237-ed703eecccde	5215	Ročinj
00050000-55fc-5dae-0cf0-5909d41e48e8	3250	Rogaška Slatina
00050000-55fc-5dae-4f69-cf88e99b86a0	9262	Rogašovci
00050000-55fc-5dae-d621-5d53af4a291b	3252	Rogatec
00050000-55fc-5dae-ab8e-fb140f06ebf8	1373	Rovte
00050000-55fc-5dae-0b25-bccfb30bf8ec	2342	Ruše
00050000-55fc-5dae-46d6-111a77d17934	1282	Sava
00050000-55fc-5dae-e457-3a8ee3fbd0e7	6333	Sečovlje/Sicciole
00050000-55fc-5dae-edf7-0616ea5c5437	4227	Selca
00050000-55fc-5dae-30ba-658da6f514ff	2352	Selnica ob Dravi
00050000-55fc-5dae-b728-72feed49340b	8333	Semič
00050000-55fc-5dae-5642-a42056c72097	8281	Senovo
00050000-55fc-5dae-8090-ab9e91e6a462	6224	Senožeče
00050000-55fc-5dae-1465-5147c263144e	8290	Sevnica
00050000-55fc-5dae-c3f8-23dec7b63f35	6210	Sežana
00050000-55fc-5dae-6725-85173e7a4da5	2214	Sladki Vrh
00050000-55fc-5dae-541a-e3628662547c	5283	Slap ob Idrijci
00050000-55fc-5dae-23ed-6fe21300aa34	2380	Slovenj Gradec
00050000-55fc-5dae-d406-0a83aa2b4c21	2310	Slovenska Bistrica
00050000-55fc-5dae-129e-1912dc50f78d	3210	Slovenske Konjice
00050000-55fc-5dae-41c1-53605e0ccd30	1216	Smlednik
00050000-55fc-5dae-4f5a-b2a9298bfb78	5232	Soča
00050000-55fc-5dae-84ee-bde79bf1dfaf	1317	Sodražica
00050000-55fc-5dae-1165-fc7159fcfd92	3335	Solčava
00050000-55fc-5dae-078d-66d87946c948	5250	Solkan
00050000-55fc-5dae-6822-fb1d65a7f64b	4229	Sorica
00050000-55fc-5dae-aa74-448812949dff	4225	Sovodenj
00050000-55fc-5dae-8d63-49f978bdc01d	5281	Spodnja Idrija
00050000-55fc-5dae-19d8-3f07bf65528b	2241	Spodnji Duplek
00050000-55fc-5dae-8606-7cd45e41e782	9245	Spodnji Ivanjci
00050000-55fc-5dae-6697-4b1cb0c27913	2277	Središče ob Dravi
00050000-55fc-5dae-0de0-cde618bb79d2	4267	Srednja vas v Bohinju
00050000-55fc-5dae-ce2a-6ee7cad251ab	8256	Sromlje 
00050000-55fc-5dae-7a0c-2b697cbae9ac	5224	Srpenica
00050000-55fc-5dae-6407-1a8dd4be52a8	1242	Stahovica
00050000-55fc-5dae-1ded-bbab593bbdaa	1332	Stara Cerkev
00050000-55fc-5dae-d372-5d016130bf65	8342	Stari trg ob Kolpi
00050000-55fc-5dae-c2b9-4bbde2b7f225	1386	Stari trg pri Ložu
00050000-55fc-5dae-5309-e00e916a1080	2205	Starše
00050000-55fc-5dae-baf7-3875e9709f6e	2289	Stoperce
00050000-55fc-5dae-25fb-27c009eac4b8	8322	Stopiče
00050000-55fc-5dae-e255-8dbe176a6226	3206	Stranice
00050000-55fc-5dae-03cc-7dc88f902cbf	8351	Straža
00050000-55fc-5dae-325b-e0a8295ea0d8	1313	Struge
00050000-55fc-5dae-83f9-74ab6ff4b0c6	8293	Studenec
00050000-55fc-5dae-3034-bd8d444b68b4	8331	Suhor
00050000-55fc-5dae-ad48-d6fd38ad03ed	2233	Sv. Ana v Slovenskih goricah
00050000-55fc-5dae-9339-adecc84a3625	2235	Sv. Trojica v Slovenskih goricah
00050000-55fc-5dae-babd-2d65fb8f429a	2353	Sveti Duh na Ostrem Vrhu
00050000-55fc-5dae-b91a-87c218673b1f	9244	Sveti Jurij ob Ščavnici
00050000-55fc-5dae-0e28-730d3375852c	3264	Sveti Štefan
00050000-55fc-5dae-d693-e9ad8b6d32bb	2258	Sveti Tomaž
00050000-55fc-5dae-6518-5f7e0e712d49	9204	Šalovci
00050000-55fc-5dae-c5a7-ae7704ecb4ef	5261	Šempas
00050000-55fc-5dae-b768-aa1d1eac381d	5290	Šempeter pri Gorici
00050000-55fc-5dae-5108-2270ff55b7a8	3311	Šempeter v Savinjski dolini
00050000-55fc-5dae-1541-fd46664bce68	4208	Šenčur
00050000-55fc-5dae-d263-8435324f2a0e	2212	Šentilj v Slovenskih goricah
00050000-55fc-5dae-51c7-4f2861f6c110	8297	Šentjanž
00050000-55fc-5dae-bc64-65365bb8f990	2373	Šentjanž pri Dravogradu
00050000-55fc-5dae-dd1f-367e105bc481	8310	Šentjernej
00050000-55fc-5dae-fde1-9bb05b3356a6	3230	Šentjur
00050000-55fc-5dae-6d45-dc48ece20f11	3271	Šentrupert
00050000-55fc-5dae-1e61-51b9b04634d5	8232	Šentrupert
00050000-55fc-5dae-e16b-6fa1829ba9af	1296	Šentvid pri Stični
00050000-55fc-5dae-2d98-e841aebca5c9	8275	Škocjan
00050000-55fc-5dae-253b-533e371aa4f4	6281	Škofije
00050000-55fc-5dae-d552-8a45269f7999	4220	Škofja Loka
00050000-55fc-5dae-427e-b79f17dd7731	3211	Škofja vas
00050000-55fc-5dae-73f0-db86a13e1fbc	1291	Škofljica
00050000-55fc-5dae-748e-717b132d4c61	6274	Šmarje
00050000-55fc-5dae-51dc-0b6fb018840c	1293	Šmarje - Sap
00050000-55fc-5dae-812f-bfa8fb0f1beb	3240	Šmarje pri Jelšah
00050000-55fc-5dae-8506-e0fd0cc36c96	8220	Šmarješke Toplice
00050000-55fc-5dae-0af0-a6b0e182f852	2315	Šmartno na Pohorju
00050000-55fc-5dae-f0c6-d24c24a17109	3341	Šmartno ob Dreti
00050000-55fc-5dae-c3b5-ff20c2473179	3327	Šmartno ob Paki
00050000-55fc-5dae-3a4d-ed86a61a0f7e	1275	Šmartno pri Litiji
00050000-55fc-5dae-1cd1-bc01759f1d8f	2383	Šmartno pri Slovenj Gradcu
00050000-55fc-5dae-2b1c-3c0ba76c45b2	3201	Šmartno v Rožni dolini
00050000-55fc-5dae-c72a-fd97e5429fda	3325	Šoštanj
00050000-55fc-5dae-b6c4-0dccc454e352	6222	Štanjel
00050000-55fc-5dae-c222-9b5a2851b25b	3220	Štore
00050000-55fc-5dae-130d-2a31c3a803ab	3304	Tabor
00050000-55fc-5dae-6a59-84237ca37a2e	3221	Teharje
00050000-55fc-5dae-8f54-9e09c0dbb084	9251	Tišina
00050000-55fc-5dae-8acd-d3fd0a6f310d	5220	Tolmin
00050000-55fc-5dae-94c9-a00e6a041017	3326	Topolšica
00050000-55fc-5dae-3583-a1be8c073086	2371	Trbonje
00050000-55fc-5dae-2c7f-633d58202f16	1420	Trbovlje
00050000-55fc-5dae-ac7c-95d7fa9fc4c4	8231	Trebelno 
00050000-55fc-5dae-ca91-1fa70a0e40ca	8210	Trebnje
00050000-55fc-5dae-4659-6a26615bfea7	5252	Trnovo pri Gorici
00050000-55fc-5dae-3067-312061c9608d	2254	Trnovska vas
00050000-55fc-5dae-b878-2075eeecd405	1222	Trojane
00050000-55fc-5dae-dc8b-004016ba5a4b	1236	Trzin
00050000-55fc-5dae-afd7-cdb15e01ee0a	4290	Tržič
00050000-55fc-5dae-812d-fd62e92dcfa0	8295	Tržišče
00050000-55fc-5dae-1a1f-4c1cf016cff6	1311	Turjak
00050000-55fc-5dae-b703-c75a01a352c7	9224	Turnišče
00050000-55fc-5dae-a9ea-c98f18dd6fb3	8323	Uršna sela
00050000-55fc-5dae-143c-3a95f8e99e4b	1252	Vače
00050000-55fc-5dae-a024-ed6695860d84	3320	Velenje 
00050000-55fc-5dae-15ac-ebff332942ca	3322	Velenje - poštni predali
00050000-55fc-5dae-d4d1-23c91b6223b3	8212	Velika Loka
00050000-55fc-5dae-a018-e59bd915d68b	2274	Velika Nedelja
00050000-55fc-5dae-6c78-e9709841c988	9225	Velika Polana
00050000-55fc-5dae-2b1f-cd0d5716964d	1315	Velike Lašče
00050000-55fc-5dae-ac41-b13614421d50	8213	Veliki Gaber
00050000-55fc-5dae-2e2b-6d6b4b33b856	9241	Veržej
00050000-55fc-5dae-3161-1c162f1ae62e	1312	Videm - Dobrepolje
00050000-55fc-5dae-20c3-a2b436fcfa17	2284	Videm pri Ptuju
00050000-55fc-5dae-71d0-c13fa37eb35d	8344	Vinica
00050000-55fc-5dae-4d0c-4bd00641ac3d	5271	Vipava
00050000-55fc-5dae-6621-06a0c46e0c18	4212	Visoko
00050000-55fc-5dae-eda2-d72fbc539f8b	1294	Višnja Gora
00050000-55fc-5dae-da8f-4d481b29a505	3205	Vitanje
00050000-55fc-5dae-5bb3-298aa20afff6	2255	Vitomarci
00050000-55fc-5dae-e319-7b77dde9e068	1217	Vodice
00050000-55fc-5dae-cc02-808d133ac542	3212	Vojnik\t
00050000-55fc-5dae-8c36-42aa7342a9c3	5293	Volčja Draga
00050000-55fc-5dae-019f-77ef5f1b61e6	2232	Voličina
00050000-55fc-5dae-6070-e2a0d4bea658	3305	Vransko
00050000-55fc-5dae-7f98-d42927ad902e	6217	Vremski Britof
00050000-55fc-5dae-d158-b9859bb5c005	1360	Vrhnika
00050000-55fc-5dae-64bc-797fafbd8a22	2365	Vuhred
00050000-55fc-5dae-c17c-870394a5dee8	2367	Vuzenica
00050000-55fc-5dae-fa84-c1abdefe7cca	8292	Zabukovje 
00050000-55fc-5dae-b05e-e9f343512901	1410	Zagorje ob Savi
00050000-55fc-5dae-b386-9d45abfaa7d4	1303	Zagradec
00050000-55fc-5dae-778a-e825fe8e9fdb	2283	Zavrč
00050000-55fc-5dae-7d7c-337d953f7f61	8272	Zdole 
00050000-55fc-5dae-949f-22b2613aa9c2	4201	Zgornja Besnica
00050000-55fc-5dae-910b-a91683eb4ede	2242	Zgornja Korena
00050000-55fc-5dae-db36-cd2ac968f041	2201	Zgornja Kungota
00050000-55fc-5dae-1812-74596299917c	2316	Zgornja Ložnica
00050000-55fc-5dae-989f-014f896b5493	2314	Zgornja Polskava
00050000-55fc-5dae-518b-17fe343ea00f	2213	Zgornja Velka
00050000-55fc-5dae-72ca-04c1f97800a6	4247	Zgornje Gorje
00050000-55fc-5dae-3f6c-475d8bfdc60f	4206	Zgornje Jezersko
00050000-55fc-5dae-48e7-4292fa2512ea	2285	Zgornji Leskovec
00050000-55fc-5dae-6e2b-0080e0b727bc	1432	Zidani Most
00050000-55fc-5dae-9857-72d209721889	3214	Zreče
00050000-55fc-5dae-2b3d-2abf8b3d5b71	4209	Žabnica
00050000-55fc-5dae-92d7-7850e55686b0	3310	Žalec
00050000-55fc-5dae-f2cf-e5c1901899e2	4228	Železniki
00050000-55fc-5dae-8e40-903b402cf5ee	2287	Žetale
00050000-55fc-5dae-56e6-eba9059baa43	4226	Žiri
00050000-55fc-5dae-17f3-49a7309952a3	4274	Žirovnica
00050000-55fc-5dae-ef11-baececbd9b92	8360	Žužemberk
\.


--
-- TOC entry 2994 (class 0 OID 20128143)
-- Dependencies: 230
-- Data for Name: postavkacdve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkacdve (id, skupina, podskupina, naziv, vrpremiere, vrponovitvepremier, vrponovitveprejsnjih, vrgostovanjazamejstvo, vrfestivali, vrgostovanjaint, vrostalo, programdela_id) FROM stdin;
\.


--
-- TOC entry 2967 (class 0 OID 20127770)
-- Dependencies: 203
-- Data for Name: postavkaracuna; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkaracuna (id, racun_id) FROM stdin;
\.


--
-- TOC entry 2950 (class 0 OID 20127576)
-- Dependencies: 186
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
00060000-55fc-5db0-31d0-12100fcc35e8	00080000-55fc-5db0-cffd-eb999c47f5f0	\N	00040000-55fc-5daf-b629-3022bb037896	Narodni dom	\N	Koroška 15	\N	9231	Beltinci	\N	f	t
00060000-55fc-5db0-5359-eceb22ad0ce5	00080000-55fc-5db0-cffd-eb999c47f5f0	\N	00040000-55fc-5daf-b629-3022bb037896	Korotan	\N	Koroška 22	\N	9231	Beltinci	\N	f	f
00060000-55fc-5db0-749f-f36b2773fd30	00080000-55fc-5db0-4f6e-14d22d5864f5	\N	00040000-55fc-5daf-b629-3022bb037896	Rimljan	\N	Rimska ploščad 7	\N	9231	Beltinci	\N	f	t
\.


--
-- TOC entry 2956 (class 0 OID 20127654)
-- Dependencies: 192
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, zaporedna, porocilo) FROM stdin;
\.


--
-- TOC entry 2969 (class 0 OID 20127782)
-- Dependencies: 205
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 2995 (class 0 OID 20128157)
-- Dependencies: 231
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, koproducent_id, odstotekfinanciranja, delez, maticnikop, kpe, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 2996 (class 0 OID 20128167)
-- Dependencies: 232
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, sifra, status) FROM stdin;
00190000-55fc-5db0-fae0-9e4081893021	00080000-55fc-5db0-b804-376e741a2898	0987	AK
00190000-55fc-5db0-f45a-67958cabcb57	00080000-55fc-5db0-4f6e-14d22d5864f5	0989	AK
00190000-55fc-5db0-7e5d-8475affb5499	00080000-55fc-5db0-59d5-7bbe11256ff1	0986	AK
00190000-55fc-5db0-193f-ffc36886d85c	00080000-55fc-5db0-abc1-0f50040c3665	0984	AK
00190000-55fc-5db0-33b6-3ae41a539961	00080000-55fc-5db0-8923-162f03b9b046	0983	AK
00190000-55fc-5db0-500d-05470c9a3144	00080000-55fc-5db0-a947-9b7eab9f83e2	0982	AK
00190000-55fc-5db1-6b20-d033d0deca26	00080000-55fc-5db1-5648-f28ccb4eb6f9	1001	AK
\.


--
-- TOC entry 2993 (class 0 OID 20128100)
-- Dependencies: 229
-- Data for Name: programdela; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programdela (id, sifra, naziv, zacetek, konec, zakljuceno, potrjenprogram, stpremier, stint, stfest, strazno, stizjem, stponprem, stponprej, stponprejvelikih, stponprejmalih, stponprejmalihkopr, stponprejsredkopr, stponprejvelikihkopr, stgostujo, vrps1, vrps1do, vrps1mat, vrps1gostovsz, stizvnekomerc, stizvprem, stizvpremdoma, stizvpremkopr, stizvponprem, stizvponpremdoma, stizvponpremzamejo, stizvponpremgost, stizvponpremkopr, stizvponpremint, stizvponpremkoprint, stizvponprej, stizvponprejdoma, stizvponprejzamejo, stizvponprejgost, stizvponprejkopr, stizvponprejint, stizvponprejkoprint, stizvgostuj, stizvostalihnek, stizvgostovanjslo, stizvgostovanjzam, stizvgostovanjint, stobisknekom, stobisknekommat, stobisknekomgostslo, stobisknekomgostzam, stobisknekomgostint, stobiskprem, stobiskpremdoma, stobiskpremkopr, stobiskponprem, stobiskponpremdoma, stobiskponpremkopr, stobiskponpremkoprint, stobiskponpremgost, stobiskponpremzamejo, stobiskponpremint, avgobiskprired, avgzaseddvoran, avgcenavstopnice, stprodvstopnic, stkoprodukcij, stkoprodukcijint, stkoprodukcijnvo, stzaposlenih, stzaposigralcev, avgstnastopovigr, sthonorarnih, sthonorarnihigr, sthonorarnihigrtujjz, sthonorarnihigrsamoz, sredstvaint, sredstvaavt, sredstvazaprosenoprem, sredstvazaprosenoponprem, sredstvazaprosenoponprej, sredstvazaprosenogostujo, sredstvazaprosenoint, sredstvazaprosenofest, sredstvazaprosenorazno, sredstvazaprosenoizjem, sredstvadrugijavniprem, sredstvadrugijavniponprem, sredstvadrugijavniponprej, sredstvadrugijavnigostujo, sredstvadrugijavniint, sredstvadrugijavnifest, sredstvadrugijavnirazno, sredstvadrugijavniizjem, sredstvadrugiviriprem, sredstvadrugiviriponprem, sredstvadrugiviriponprej, sredstvadrugivirigostujo, sredstvadrugiviriint, sredstvadrugivirifest, sredstvadrugivirirazno, sredstvadrugiviriizjem, sredstvaavtsamoz) FROM stdin;
00290000-55fc-5db0-73e8-4950b3c8a768	0001	Testni program dela	2016-02-01	2017-02-01	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 2997 (class 0 OID 20128175)
-- Dependencies: 233
-- Data for Name: programskaenotasklopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programskaenotasklopa (id, naslovpe, avtorpe, obsegpe, mesecpe, vrednostpe, programrazno_id) FROM stdin;
\.


--
-- TOC entry 2973 (class 0 OID 20127811)
-- Dependencies: 209
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, popa_id, naslov_id, sifra, naziv, jeprizorisce, jematicnioder, seplanira, kapaciteta, opis) FROM stdin;
00220000-55fc-5db0-181a-6353f2a6ca17	\N	\N	0001	Poskusna 1	f	\N	t	8	Poskusna učilnica v prvem
00220000-55fc-5db0-8ca4-39f433037432	\N	\N	0002	Poskusna 3	f	\N	f	34	Poskusna učilnica v tretjem
00220000-55fc-5db0-747c-7602d35b4f12	\N	\N	0003	Kazinska	t	\N	t	84	Kazinska dvorana
00220000-55fc-5db0-4d2f-ea9db4e24a10	\N	\N	0004	Mali oder	t	\N	t	24	Mali oder 
00220000-55fc-5db0-26f2-a51dea955fb1	\N	\N	0005	Komorni oder	t	\N	t	15	Komorni oder
00220000-55fc-5db0-b888-515e61a7affe	\N	\N	0006	Stara dvorana	t	\N	t	96	Stara dvorana ali dvorana Franceta Prešerna
00220000-55fc-5db0-482a-4c4b8c4db039	\N	\N	0007	Velika dvorana	t	\N	t	160	Velika, glavna dvorana
\.


--
-- TOC entry 2965 (class 0 OID 20127755)
-- Dependencies: 201
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 2964 (class 0 OID 20127745)
-- Dependencies: 200
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 2986 (class 0 OID 20127953)
-- Dependencies: 222
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta, status) FROM stdin;
\.


--
-- TOC entry 2980 (class 0 OID 20127885)
-- Dependencies: 216
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 2939 (class 0 OID 20127449)
-- Dependencies: 175
-- Data for Name: revizije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY revizije (id, razred, objectid, upor, datum, tip, data) FROM stdin;
1	App\\Entity\\Popa	00080000-55fc-5db1-5648-f28ccb4eb6f9	00010000-55fc-5daf-84b7-775128d992ca	2015-09-18 20:53:37	INS	a:0:{}
2	App\\Entity\\Option	00000000-55fc-5db1-0b41-0e91d2749028	00010000-55fc-5daf-84b7-775128d992ca	2015-09-18 20:53:37	INS	a:0:{}
3	ProgramDela\\Entity\\ProdukcijskaHisa	00190000-55fc-5db1-6b20-d033d0deca26	00010000-55fc-5daf-84b7-775128d992ca	2015-09-18 20:53:37	INS	a:0:{}
\.


--
-- TOC entry 3015 (class 0 OID 0)
-- Dependencies: 174
-- Name: revizije_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('revizije_id_seq', 3, true);


--
-- TOC entry 2974 (class 0 OID 20127824)
-- Dependencies: 210
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 2943 (class 0 OID 20127487)
-- Dependencies: 179
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-55fc-5daf-8f58-0c3d3c671afa	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-55fc-5daf-e815-24b75c196888	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-55fc-5daf-165e-7a9a3492635d	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-55fc-5daf-27e2-21d7f0743b08	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-55fc-5daf-0f4b-c7825770fe87	planer	Planer dogodkov v koledarju	t
00020000-55fc-5daf-9bdb-9c9bdde0dd54	kadrovska	Kadrovska služba	t
00020000-55fc-5daf-4221-746d3824436d	arhivar	Ažuriranje arhivalij	t
00020000-55fc-5daf-d883-a433f7e35f46	igralec	Igralec	t
00020000-55fc-5daf-3dd4-c44bf2ae5a7a	prisotnost	Vnašalec prisotnosti, tudi za tiste izven uprizoritev	t
00020000-55fc-5db0-18ee-4246785ea359	vsadovoljenja	Vloga z vsemi posameznimi dovoljenji	t
\.


--
-- TOC entry 2941 (class 0 OID 20127471)
-- Dependencies: 177
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-55fc-5daf-2a2e-ba3ec1393f58	00020000-55fc-5daf-165e-7a9a3492635d
00010000-55fc-5daf-84b7-775128d992ca	00020000-55fc-5daf-165e-7a9a3492635d
00010000-55fc-5db0-34f1-8515fc9d7914	00020000-55fc-5db0-18ee-4246785ea359
\.


--
-- TOC entry 2976 (class 0 OID 20127838)
-- Dependencies: 212
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 2968 (class 0 OID 20127776)
-- Dependencies: 204
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 2962 (class 0 OID 20127722)
-- Dependencies: 198
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, sifra, ime, zacetek, konec, aktivna) FROM stdin;
\.


--
-- TOC entry 2937 (class 0 OID 20127436)
-- Dependencies: 173
-- Data for Name: stevilcenje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenje (id, sifra, naziv, prefix, suffix, zacetek, dolzina, format, globalno, poletih) FROM stdin;
00230000-55fc-5dae-8091-0cc1902ca057	pri	Privzeto številčenje po letih YYYY-N	\N	\N	1	1	%l-%n	f	t
00230000-55fc-5dae-98f3-d45763a55055	123	Privzeto številčenje kratkih šifer	\N	\N	100	3	%n	f	f
00230000-55fc-5dae-b662-3065201bcf30	bcd	Globalno številčenje črtnih kod	\N	\N	1	9	%n	t	f
00230000-55fc-5dae-9dd3-0566192ade9f	sif	Številčenje šifrant	\N	\N	1000	4	%n	f	f
00230000-55fc-5dae-f874-a8f424906219	tmp	Globalno številčenje začasnih številk	tmp	\N	1000	5	%l%n	t	t
\.


--
-- TOC entry 2936 (class 0 OID 20127428)
-- Dependencies: 172
-- Data for Name: stevilcenjekonfig; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjekonfig (id, stevilcenje_id, dok) FROM stdin;
00240000-55fc-5dae-cfc1-7108dcf78411	00230000-55fc-5dae-9dd3-0566192ade9f	popa
00240000-55fc-5dae-b3b0-dcc7ee755a36	00230000-55fc-5dae-9dd3-0566192ade9f	oseba
00240000-55fc-5dae-7989-71bc14339d4f	00230000-55fc-5dae-9dd3-0566192ade9f	sezona
00240000-55fc-5dae-9233-7b325e7013a0	00230000-55fc-5dae-98f3-d45763a55055	prostor
00240000-55fc-5dae-a133-9f4dc71dc8e8	00230000-55fc-5dae-9dd3-0566192ade9f	besedilo
00240000-55fc-5dae-3823-90ad641059f1	00230000-55fc-5dae-9dd3-0566192ade9f	uprizoritev
00240000-55fc-5dae-c8a0-7b8b134cb636	00230000-55fc-5dae-9dd3-0566192ade9f	funkcija
00240000-55fc-5dae-0a13-38d846a3e4ac	00230000-55fc-5dae-9dd3-0566192ade9f	tipfunkcije
00240000-55fc-5dae-5742-622ca0eaf8cc	00230000-55fc-5dae-9dd3-0566192ade9f	alternacija
00240000-55fc-5dae-b854-a030ef676531	00230000-55fc-5dae-8091-0cc1902ca057	pogodba
00240000-55fc-5dae-630e-b24f6434b230	00230000-55fc-5dae-9dd3-0566192ade9f	zaposlitev
00240000-55fc-5dae-52e3-7cedcc3845bd	00230000-55fc-5dae-9dd3-0566192ade9f	zvrstuprizoritve
00240000-55fc-5dae-90c1-2d85aa57b74a	00230000-55fc-5dae-8091-0cc1902ca057	programdela
00240000-55fc-5dae-fa99-e5071fce698d	00230000-55fc-5dae-9dd3-0566192ade9f	zapis
\.


--
-- TOC entry 2935 (class 0 OID 20127423)
-- Dependencies: 171
-- Data for Name: stevilcenjestanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjestanje (id, objid, leto, stevilka) FROM stdin;
9dc42557-7692-40d4-b554-277a14022174	00240000-55fc-5dae-cfc1-7108dcf78411	0	1001
\.


--
-- TOC entry 2982 (class 0 OID 20127902)
-- Dependencies: 218
-- Data for Name: strosekuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY strosekuprizoritve (id, uprizoritev_id, popa_id, naziv, vrednostdo, vrednostna, opis, tipstroska, sort, vrstastroska_id) FROM stdin;
00270000-55fc-5db0-1984-1b528ebb2dd2	000e0000-55fc-5db0-9dff-68e2f510862c	00080000-55fc-5db0-cffd-eb999c47f5f0	Nabava kostumov	600.50	20.00	Krila in maske	materialni	1	003b0000-55fc-5daf-37e7-4b9224c0dc10
00270000-55fc-5db0-accc-eae7cb001763	000e0000-55fc-5db0-9dff-68e2f510862c	00080000-55fc-5db0-cffd-eb999c47f5f0	Zavese	125.70	3.10	Modra in zelena zavesa	materialni	2	003b0000-55fc-5daf-37e7-4b9224c0dc10
\.


--
-- TOC entry 2948 (class 0 OID 20127549)
-- Dependencies: 184
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 2963 (class 0 OID 20127732)
-- Dependencies: 199
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja) FROM stdin;
001a0000-55fc-5db0-15d6-f5576575de19	00180000-55fc-5db0-277b-57bd0b273181	000c0000-55fc-5db0-d605-0b202d0972dd	00090000-55fc-5db0-dbe1-fea25e57c945	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55fc-5db0-bdec-a196061bd87e	00180000-55fc-5db0-277b-57bd0b273181	000c0000-55fc-5db0-96fe-d6ddfea0e3c5	00090000-55fc-5db0-edd2-568929ab35f4	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55fc-5db0-7c92-09035618b190	00180000-55fc-5db0-277b-57bd0b273181	000c0000-55fc-5db0-61eb-0f6e2925cc0f	00090000-55fc-5db0-c850-6814cd039ec6	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55fc-5db0-6d37-f3ff81cf75e0	00180000-55fc-5db0-277b-57bd0b273181	000c0000-55fc-5db0-3b05-2608e9426ceb	00090000-55fc-5db0-0eb6-5ba1be92afcb	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55fc-5db0-e37c-590ad5d78292	00180000-55fc-5db0-277b-57bd0b273181	000c0000-55fc-5db0-0d49-7a369f3d814f	00090000-55fc-5db0-5975-0649c041a92c	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55fc-5db0-108a-764323fcff90	00180000-55fc-5db0-9d52-f0fe63d94220	\N	00090000-55fc-5db0-5975-0649c041a92c	2015-08-01 20:00:00	2015-08-01 23:00:00	\N	\N	2.00
\.


--
-- TOC entry 2985 (class 0 OID 20127941)
-- Dependencies: 221
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, sifra, ime, opis, imezenski, podrocje) FROM stdin;
000f0000-55fc-5dae-3bfe-20b02ceb9262	01	Avtor	Avtorji	Avtorka	umetnik
000f0000-55fc-5dae-13b7-0c8803e7bd71	02	Priredba	Priredba	Priredba	umetnik
000f0000-55fc-5dae-c4b9-7a1efa7d4abe	03	Prevod	Prevod	Prevod	umetnik
000f0000-55fc-5dae-af41-8000aaf6e1b1	04	Režija	Režija	Režija	umetnik
000f0000-55fc-5dae-f218-b51bcc8b97df	05	Dramaturgija	Dramaturgija	Dramaturgija	umetnik
000f0000-55fc-5dae-5058-81f391c1ba35	06	Scenografija	Scenografija	Scenografija	umetnik
000f0000-55fc-5dae-0601-8bd73b448a96	07	Kostumografija	Kostumografija	Kostumografija	umetnik
000f0000-55fc-5dae-ac53-b1ecc9f86be7	08	Koreografija	Koreografija	Koreografija	umetnik
000f0000-55fc-5dae-362f-96b1b32be9ce	09	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	umetnik
000f0000-55fc-5dae-3eba-bef6a60f5d8a	10	Oblikovanje maske	Oblikovanje maske	Oblikovanje maske	umetnik
000f0000-55fc-5dae-b5be-ddbc638f876d	11	Lektorstvo	Lektorstvo	Lektorstvo	umetnik
000f0000-55fc-5dae-22f4-c99f57c857d6	12	Glasbeni soustvarjalec	Glasbeni soustvarjalci	Glasbena soustvarjalka	umetnik
000f0000-55fc-5dae-e7be-1633e8384ad9	13	Intermedijski ustvarjalec	Intermedijski ustvarjalci	Intermedijski ustvarjalka	umetnik
000f0000-55fc-5dae-711a-490c689df451	14	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	umetnik
000f0000-55fc-5dae-e97e-bef985cf8481	15	Vloga	Intermedijski ustvarjalci	Intermedijska ustvarjalka	igralec
000f0000-55fc-5dae-9bf0-d3117f8fe263	16	Produkcija, mentorstvo	Produkcija, mentorstvo	Produkcija, mentorstvo	umetnik
000f0000-55fc-5dae-3b92-592c8d1bfdc0	17	Tehnična podpora	Tehnična podpora	Tehnična podpora	tehnik
000f0000-55fc-5dae-3c3c-e4118351e555	18	Inšpicient	Inšpicienti	Inšpicientka	inspicient
\.


--
-- TOC entry 2998 (class 0 OID 20128185)
-- Dependencies: 234
-- Data for Name: tipprogramskeenote; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipprogramskeenote (id, sifra, naziv, koprodukcija, maxfaktor, maxvsi) FROM stdin;
002b0000-55fc-5dae-d31c-5d2a8e16f054	01	Velika predstava	f	1.00	1.00
002b0000-55fc-5dae-71d5-817db92ae176	02	Mala predstava	f	0.50	0.50
002b0000-55fc-5dae-54d8-db4c7919d81f	03	Mala koprodukcija	t	0.40	1.00
002b0000-55fc-5dae-9f01-846d23ecae60	04	Srednja koprodukcija	t	0.70	2.00
002b0000-55fc-5dae-5242-7a0709ec2386	05	Velika koprodukcija	t	1.00	3.00
\.


--
-- TOC entry 2953 (class 0 OID 20127611)
-- Dependencies: 189
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 2940 (class 0 OID 20127458)
-- Dependencies: 176
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-55fc-5daf-84b7-775128d992ca	Konzolni	$2y$05$NS4xMjkyMTcwMzExMjAxROYWB0cS355/ed2/qPnzwiRi4HdTeq73u	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-55fc-5db0-2e7f-f472305176fb	testni uporabnik za inšpicienta	$2y$05$NS4xMjkyMTcwMzExMjAxROxkJ1B6xAXex6EZLIwJfWzRJ8DpfecFO	t	\N	\N	\N	ivo@ifigenija.si	\N	\N	\N
00010000-55fc-5db0-c7a6-c724ab4f81a3	testni uporabnik za Tehničnega vodjo	$2y$05$NS4xMjkyMTcwMzExMjAxROu/kXWR9sP9oamkesKuxXLbxkCb387.G	t	\N	\N	\N	tona@ifigenija.si	\N	\N	\N
00010000-55fc-5db0-89e1-7dd81e36dd4b	testni uporabnik za igralca	$2y$05$NS4xMjkyMTcwMzExMjAxRO/hLCgClfERRsfCAFYwxNCcFIVjP2982	t	\N	\N	\N	irena@ifigenija.si	\N	\N	\N
00010000-55fc-5db0-3b2e-770a1f86209f	testni uporabnik vnašalca termina storitev (TerminStoritve-vse)	$2y$05$NS4xMjkyMTcwMzExMjAxROT6.kTHqEq4.wa2SOnf124/N14m9qeP.	t	\N	\N	\N	tatjana@ifigenija.si	\N	\N	\N
00010000-55fc-5db0-7cc4-24dafa4507dc	testni uporabnik, ki je inšpicient brez zapisov v TerminStoritve	$2y$05$NS4xMjkyMTcwMzExMjAxROHau47Dtb7CME5.nlWwBVM.nusFP.ra2	t	\N	\N	\N	joze@ifigenija.si	\N	\N	\N
00010000-55fc-5db0-fc9f-6a986858e703	testna uporabnica, ki je planerka	$2y$05$NS4xMjkyMTcwMzExMjAxRO.B/uJO3C7QRNhdX9Q2hTLQsSupj1V1S	t	\N	\N	\N	petra@ifigenija.si	\N	\N	\N
00010000-55fc-5db0-7b19-d9063d7f3c25	testni uporabnik, ki dobi ifi-all vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROv2d7jqhaV/Mz3EIsKoi7UoFR.SDSMBm	t	\N	\N	\N	ali@ifigenija.si	\N	\N	\N
00010000-55fc-5db0-6ed1-09d8dc5bdee0	testni uporabnik, ki dobi ifi-readall vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROYB9g.gnkufr1l/gWK6mkx.ySqrOWnJC	t	\N	\N	\N	berta@ifigenija.si	\N	\N	\N
00010000-55fc-5db0-81a9-02162858fc5c	testni uporabnik, ki dobi aaa-write dovoljenje	$2y$05$NS4xMjkyMTcwMzExMjAxRORujYObKX.DzpXVYbePkiJkHqg0/Ylya	t	\N	\N	\N	aaron@ifigenija.si	\N	\N	\N
00010000-55fc-5db0-34f1-8515fc9d7914	testni uporabnik ki dobi vsa posamezna dovoljenja	$2y$05$NS4xMjkyMTcwMzExMjAxRO2ymwxVXTr7U4Ncdn.bN49E8rLw9Jg0O	t	\N	\N	\N	vesna@ifigenija.si	\N	\N	\N
00010000-55fc-5daf-2a2e-ba3ec1393f58	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 2989 (class 0 OID 20127990)
-- Dependencies: 225
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, producent_id, sifra, faza, naslov, podnaslov, delovninaslov, internacionalninaslov, naslovizvirnika, podnaslovizvirnika, datumzacstudija, stevilovaj, planiranostevilovaj, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, krstna, prvaslovenska, kratkinaslov, maticnioder_id) FROM stdin;
000e0000-55fc-5db0-100e-e2795d143dd0	00160000-55fc-5db0-cc52-28be33d903e2	\N	00140000-55fc-5dae-769e-9204c206dd37	\N	0001	produkcija	Sen kresne noči		Sanje	\N	\N	\N	2016-02-01	\N	\N	2016-06-01	1	William  Shakespeare, Nebojša  Kavader	f	2				\N	f	\N	\N		00220000-55fc-5db0-26f2-a51dea955fb1
000e0000-55fc-5db0-9dff-68e2f510862c	00160000-55fc-5db0-2201-c11490b86d25	\N	00140000-55fc-5dae-b087-c5a49334d616	\N	0002	predprodukcija-ideja	Smoletov vrt			\N	\N	\N	2016-01-01	\N	\N	2016-04-20	2	Berta   Hočevar	f	2				\N	f	\N	\N		00220000-55fc-5db0-b888-515e61a7affe
000e0000-55fc-5db0-bd39-d1daafafd252	\N	\N	00140000-55fc-5dae-b087-c5a49334d616	00190000-55fc-5db0-fae0-9e4081893021	0003	postprodukcija	Kisli maček			\N	\N	\N	2016-02-01	\N	\N	2016-04-20	2	\N	t	2				\N	f	\N	\N		00220000-55fc-5db0-26f2-a51dea955fb1
000e0000-55fc-5db0-d1f7-c56ffd14e5ad	\N	\N	00140000-55fc-5dae-b087-c5a49334d616	00190000-55fc-5db0-fae0-9e4081893021	0004	postprodukcija	Vladimir			\N	\N	\N	2017-03-01	\N	\N	2017-04-20	2	\N	t	2				\N	f	\N	\N		00220000-55fc-5db0-26f2-a51dea955fb1
000e0000-55fc-5db0-2c49-dbd26baea2eb	\N	\N	00140000-55fc-5dae-b087-c5a49334d616	00190000-55fc-5db0-fae0-9e4081893021	0005	postprodukcija	Španska princesa			\N	\N	\N	2017-04-01	\N	\N	2017-05-20	1	\N	f	1				\N	f	\N	\N		00220000-55fc-5db0-181a-6353f2a6ca17
000e0000-55fc-5db0-b72b-355cf89b6420	\N	\N	00140000-55fc-5dae-b087-c5a49334d616	00190000-55fc-5db0-fae0-9e4081893021	0006	postprodukcija	Ne vemo datumov			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		00220000-55fc-5db0-181a-6353f2a6ca17
\.


--
-- TOC entry 2958 (class 0 OID 20127675)
-- Dependencies: 194
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, uprizoritev_id, vrsta, zaporedna, porocilo) FROM stdin;
00200000-55fc-5db0-fc21-828fec94313b	000e0000-55fc-5db0-9dff-68e2f510862c	\N	1	
00200000-55fc-5db0-0a80-22cf9b75710e	000e0000-55fc-5db0-9dff-68e2f510862c	\N	2	
00200000-55fc-5db0-b3c3-e0c31548bcd5	000e0000-55fc-5db0-9dff-68e2f510862c	\N	3	
00200000-55fc-5db0-3030-bf774a1dd284	000e0000-55fc-5db0-9dff-68e2f510862c	\N	4	
00200000-55fc-5db0-8c98-b6eca34cf64a	000e0000-55fc-5db0-9dff-68e2f510862c	\N	5	
\.


--
-- TOC entry 2972 (class 0 OID 20127803)
-- Dependencies: 208
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 2983 (class 0 OID 20127916)
-- Dependencies: 219
-- Data for Name: vrstastroska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstastroska (id, skupina, podskupina, naziv, opis) FROM stdin;
003b0000-55fc-5daf-8f28-d121340009af	1	0	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE
003b0000-55fc-5daf-be79-a806357f6dae	1	1	Storitve varovanja zgradb in prostorov	storitve varovanja zgradb in prostorov (npr. gasilci na predstavah)
003b0000-55fc-5daf-9f98-9bcd58ac74a2	1	2	Založniške in tiskarske storitve	založniške in tiskarske storitve
003b0000-55fc-5daf-a9c8-f7a43d3de8ff	1	3	Časopisi, revije, knjige in strokovna literatura	časopisi, revije, knjige in strokovna literatura
003b0000-55fc-5daf-7c19-e574288afd2f	1	4	Stroški prevajalskih storitev	stroški prevajalskih storitev
003b0000-55fc-5daf-ffa1-a5489595c52b	1	5	Stroški oglaševalskih storitev	stroški oglaševalskih storitev
003b0000-55fc-5daf-d7e1-755a80544b65	1	6	Izdatki za reprezentanco	izdatki za reprezentanco
003b0000-55fc-5daf-19ec-5e2a7b4a124e	2	0	POSEBNI MATERIAL IN STORITVE	POSEBNI MATERIAL IN STORITVE
003b0000-55fc-5daf-37e7-4b9224c0dc10	2	1	Drugi posebni material in storitve	drugi posebni material in storitve (npr. za instrumete - navedite)
003b0000-55fc-5daf-3045-8960ffd1928c	2	2	Oprema predstave – stroški rekvizitov	Oprema predstave – stroški rekvizitov
003b0000-55fc-5daf-9a41-3101b5f85736	2	3	Oprema predstave – stroški kostumov	Oprema predstave – stroški kostumov
003b0000-55fc-5daf-f8cb-a6051ff5ce97	2	4	Oprema predstave – stroški scenske opreme	Oprema predstave – stroški scenske opreme
003b0000-55fc-5daf-12d1-a38e526bb419	2	5	Oprema predstave – stroški avdio in video opreme	Oprema predstave – stroški avdio in video opreme
003b0000-55fc-5daf-6241-1fbe6bb1abc6	3	0	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE
003b0000-55fc-5daf-0427-0f925a0c77b1	3	1	Poštnina in kurirske storitve	poštnina in kurirske storitve
003b0000-55fc-5daf-39c8-83df0faab015	4	0	PREVOZNI STROŠKI IN STORITVE	PREVOZNI STROŠKI IN STORITVE
003b0000-55fc-5daf-7ee0-eb13a616bc49	4	1	Goriva in maziva za prevozna sredstva	goriva in maziva za prevozna sredstva
003b0000-55fc-5daf-3247-e2434125fc2f	4	2	Najem vozil in selitveni stroški	najem vozil in selitveni stroški
003b0000-55fc-5daf-0c58-2fef44791dce	4	3	Drugi prevozni in transportni stroški 	drugi prevozni in transportni stroški (navedite)
003b0000-55fc-5daf-2252-88db851d0caa	5	0	IZDATKI ZA SLUŽBENA POTOVANJA	IZDATKI ZA SLUŽBENA POTOVANJA
003b0000-55fc-5daf-7681-4a533a0ac62e	5	1	Dnevnice za službena potovanja v državi in tujini	dnevnice za službena potovanja v državi in tujini
003b0000-55fc-5daf-df9b-ff91f9577010	5	2	Hotelske in restavra. storitve v državi in tujini	hotelske in restavra. storitve v državi in tujini
003b0000-55fc-5daf-23ad-06ef1bd6e98e	5	3	Stroški prevoza v državi in tujini	stroški prevoza v državi in tujini
003b0000-55fc-5daf-4f1a-3cace2570ec2	5	4	Drugi izdatki za službena potovanja	drugi izdatki za službena potovanja (navedite)
003b0000-55fc-5daf-58c1-a052d39b47a9	6	0	NAJEMNINE IN ZAKUPNINE	NAJEMNINE IN ZAKUPNINE
003b0000-55fc-5daf-b8b8-302b60071a7a	6	1	Druge najemnine, zakupnine in licenčnine	druge najemnine, zakupnine in licenčnine (npr. najem notnega materiala, instrumentov - navedite)
003b0000-55fc-5daf-4ae7-804907a7716b	7	0	DRUGI OPERATIVNI ODHODKI	DRUGI OPERATIVNI ODHODKI
003b0000-55fc-5daf-0f6a-1947223408ec	7	1	Izdatki za strok. izobraževanje zap.	izdatki za strok. izobraževanje zap.(vezani na program. enote)  
\.


--
-- TOC entry 3001 (class 0 OID 20128232)
-- Dependencies: 237
-- Data for Name: vrstazapisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstazapisa (id, oznaka, naziv, aktiven, znacka, ikona, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3000 (class 0 OID 20128204)
-- Dependencies: 236
-- Data for Name: zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapis (id, vrsta_id, datoteka_id, mapa_id, avtor_id, zaklenil_id, tip, zaklenjen, datumzaklepanja, identifier, subject, title, description, coverage, creator, language, date, publisher, relation, rights, source, upor, datknj, standard, lokacija) FROM stdin;
\.


--
-- TOC entry 3002 (class 0 OID 20128244)
-- Dependencies: 238
-- Data for Name: zapislastnik; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapislastnik (id, zapis_id, lastnik, classlastnika, datum, upor, datknj) FROM stdin;
\.


--
-- TOC entry 2979 (class 0 OID 20127875)
-- Dependencies: 215
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, sifra, status, delovnomesto, zacetek, konec, tip, delovnaobveza, malica, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci) FROM stdin;
00100000-55fc-5db0-036d-deeb58069f77	00090000-55fc-5db0-edd2-568929ab35f4	01	A	Mojster	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55fc-5db0-4208-6488c9b8233b	00090000-55fc-5db0-c850-6814cd039ec6	02	A	Igralec	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55fc-5db0-b5e5-6032c7d44ec0	00090000-55fc-5db0-5737-afeb8b02dec7	03	A	Natakar	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55fc-5db0-e3f2-de93e704b1c4	00090000-55fc-5db0-84e0-6ef6cf519f47	04	A	Mizar	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55fc-5db0-d518-37cd83c32844	00090000-55fc-5db0-dbe1-fea25e57c945	05	A	Šivilja	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55fc-5db0-7d66-ca893f8db932	00090000-55fc-5db0-bddd-6b2a2df344f2	06	A	Inšpicient	2010-02-01	2010-02-01	1	2		t	f	f	t
\.


--
-- TOC entry 2960 (class 0 OID 20127711)
-- Dependencies: 196
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id, oseba_id) FROM stdin;
\.


--
-- TOC entry 2988 (class 0 OID 20127980)
-- Dependencies: 224
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, sifra, naziv, opis) FROM stdin;
00140000-55fc-5dae-769e-9204c206dd37	01	Drama	drama (SURS 01)
00140000-55fc-5dae-9879-6dd3c1d89f1e	02	Opera	opera (SURS 02)
00140000-55fc-5dae-c1a0-95cf2003edef	03	Balet	balet (SURS 03)
00140000-55fc-5dae-675d-546023695525	04	Plesne prireditve	plesne prireditve (SURS 04)
00140000-55fc-5dae-44b3-68e8395ba5fd	05	Lutkovno gledališče	lutkovno gledališče (SURS 05)
00140000-55fc-5dae-b087-c5a49334d616	06	Raziskovalno gledališče	raziskovalno gledališče (SURS 06)
00140000-55fc-5dae-c5e7-958583a6bfa5	07	Drugo	drugo (SURS 07)
\.


--
-- TOC entry 2978 (class 0 OID 20127865)
-- Dependencies: 214
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, sifra, naziv, opis) FROM stdin;
\.


--
-- TOC entry 2478 (class 2606 OID 20127512)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2661 (class 2606 OID 20128039)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2657 (class 2606 OID 20128029)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2620 (class 2606 OID 20127899)
-- Name: avtorbesedila_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT avtorbesedila_pkey PRIMARY KEY (id);


--
-- TOC entry 2631 (class 2606 OID 20127939)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2718 (class 2606 OID 20128284)
-- Name: datoteka_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT datoteka_pkey PRIMARY KEY (id);


--
-- TOC entry 2532 (class 2606 OID 20127700)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2547 (class 2606 OID 20127721)
-- Name: dogodeksplosni_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodeksplosni
    ADD CONSTRAINT dogodeksplosni_pkey PRIMARY KEY (id);


--
-- TOC entry 2694 (class 2606 OID 20128202)
-- Name: drugivir_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT drugivir_pkey PRIMARY KEY (id);


--
-- TOC entry 2512 (class 2606 OID 20127637)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2668 (class 2606 OID 20128094)
-- Name: enotaprograma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT enotaprograma_pkey PRIMARY KEY (id);


--
-- TOC entry 2605 (class 2606 OID 20127861)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2526 (class 2606 OID 20127673)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2520 (class 2606 OID 20127651)
-- Name: kontaktnaoseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT kontaktnaoseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2569 (class 2606 OID 20127768)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2712 (class 2606 OID 20128261)
-- Name: mapa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT mapa_pkey PRIMARY KEY (id);


--
-- TOC entry 2716 (class 2606 OID 20128268)
-- Name: mapa_zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT mapa_zapis_pkey PRIMARY KEY (mapa_id, zapis_id);


--
-- TOC entry 2723 (class 2606 OID 20128292)
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
-- TOC entry 2581 (class 2606 OID 20127795)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2505 (class 2606 OID 20127609)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2482 (class 2606 OID 20127521)
-- Name: optionvalue_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT optionvalue_pkey PRIMARY KEY (id);


--
-- TOC entry 2485 (class 2606 OID 20127545)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2476 (class 2606 OID 20127501)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2469 (class 2606 OID 20127486)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2584 (class 2606 OID 20127801)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2598 (class 2606 OID 20127837)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2643 (class 2606 OID 20127975)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2494 (class 2606 OID 20127573)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2502 (class 2606 OID 20127597)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2678 (class 2606 OID 20128155)
-- Name: postavkacdve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkacdve
    ADD CONSTRAINT postavkacdve_pkey PRIMARY KEY (id);


--
-- TOC entry 2573 (class 2606 OID 20127774)
-- Name: postavkaracuna_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT postavkaracuna_pkey PRIMARY KEY (id);


--
-- TOC entry 2500 (class 2606 OID 20127587)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2524 (class 2606 OID 20127661)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2579 (class 2606 OID 20127786)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2682 (class 2606 OID 20128164)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2684 (class 2606 OID 20128172)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2675 (class 2606 OID 20128142)
-- Name: programdela_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT programdela_pkey PRIMARY KEY (id);


--
-- TOC entry 2689 (class 2606 OID 20128183)
-- Name: programskaenotasklopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT programskaenotasklopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2591 (class 2606 OID 20127819)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2567 (class 2606 OID 20127759)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2561 (class 2606 OID 20127750)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2638 (class 2606 OID 20127963)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2618 (class 2606 OID 20127892)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2461 (class 2606 OID 20127457)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2596 (class 2606 OID 20127828)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2467 (class 2606 OID 20127475)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2471 (class 2606 OID 20127495)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2603 (class 2606 OID 20127846)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2575 (class 2606 OID 20127781)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2549 (class 2606 OID 20127730)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2458 (class 2606 OID 20127445)
-- Name: stevilcenje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenje
    ADD CONSTRAINT stevilcenje_pkey PRIMARY KEY (id);


--
-- TOC entry 2455 (class 2606 OID 20127433)
-- Name: stevilcenjekonfig_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT stevilcenjekonfig_pkey PRIMARY KEY (id);


--
-- TOC entry 2452 (class 2606 OID 20127427)
-- Name: stevilcenjestanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjestanje
    ADD CONSTRAINT stevilcenjestanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2627 (class 2606 OID 20127912)
-- Name: strosekuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT strosekuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2491 (class 2606 OID 20127554)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2555 (class 2606 OID 20127741)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2634 (class 2606 OID 20127950)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2691 (class 2606 OID 20128195)
-- Name: tipprogramskeenote_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipprogramskeenote
    ADD CONSTRAINT tipprogramskeenote_pkey PRIMARY KEY (id);


--
-- TOC entry 2510 (class 2606 OID 20127622)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2463 (class 2606 OID 20127470)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2655 (class 2606 OID 20128008)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2530 (class 2606 OID 20127683)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2587 (class 2606 OID 20127809)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2629 (class 2606 OID 20127924)
-- Name: vrstastroska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstastroska
    ADD CONSTRAINT vrstastroska_pkey PRIMARY KEY (id);


--
-- TOC entry 2705 (class 2606 OID 20128242)
-- Name: vrstazapisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstazapisa
    ADD CONSTRAINT vrstazapisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2702 (class 2606 OID 20128226)
-- Name: zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT zapis_pkey PRIMARY KEY (id);


--
-- TOC entry 2708 (class 2606 OID 20128250)
-- Name: zapislastnik_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT zapislastnik_pkey PRIMARY KEY (id);


--
-- TOC entry 2614 (class 2606 OID 20127883)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2545 (class 2606 OID 20127715)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2647 (class 2606 OID 20127988)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2611 (class 2606 OID 20127873)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2533 (class 1259 OID 20127709)
-- Name: dogodki_konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_konec ON dogodek USING btree (konec);


--
-- TOC entry 2534 (class 1259 OID 20127710)
-- Name: dogodki_razred; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_razred ON dogodek USING btree (razred);


--
-- TOC entry 2535 (class 1259 OID 20127708)
-- Name: dogodki_zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2536 (class 1259 OID 20127707)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2537 (class 1259 OID 20127706)
-- Name: idx_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2623 (class 1259 OID 20127913)
-- Name: idx_11ffe6e05c75296c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e05c75296c ON strosekuprizoritve USING btree (vrstastroska_id);


--
-- TOC entry 2624 (class 1259 OID 20127914)
-- Name: idx_11ffe6e062b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e062b4ffca ON strosekuprizoritve USING btree (uprizoritev_id);


--
-- TOC entry 2625 (class 1259 OID 20127915)
-- Name: idx_11ffe6e06beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e06beede51 ON strosekuprizoritve USING btree (popa_id);


--
-- TOC entry 2709 (class 1259 OID 20128263)
-- Name: idx_14a5d6d3727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d3727aca70 ON mapa USING btree (parent_id);


--
-- TOC entry 2710 (class 1259 OID 20128262)
-- Name: idx_14a5d6d38a4a6c12; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d38a4a6c12 ON mapa USING btree (lastnik_id);


--
-- TOC entry 2492 (class 1259 OID 20127575)
-- Name: idx_1c7adba5ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba5ee4b985a ON popa USING btree (drzava_id);


--
-- TOC entry 2582 (class 1259 OID 20127802)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2696 (class 1259 OID 20128230)
-- Name: idx_1ed92829253c4123; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829253c4123 ON zapis USING btree (avtor_id);


--
-- TOC entry 2697 (class 1259 OID 20128229)
-- Name: idx_1ed9282957ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282957ed422f ON zapis USING btree (mapa_id);


--
-- TOC entry 2698 (class 1259 OID 20128231)
-- Name: idx_1ed9282987ff3295; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282987ff3295 ON zapis USING btree (zaklenil_id);


--
-- TOC entry 2699 (class 1259 OID 20128228)
-- Name: idx_1ed92829a54dbb1f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829a54dbb1f ON zapis USING btree (datoteka_id);


--
-- TOC entry 2700 (class 1259 OID 20128227)
-- Name: idx_1ed92829ef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829ef943358 ON zapis USING btree (vrsta_id);


--
-- TOC entry 2576 (class 1259 OID 20127788)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2577 (class 1259 OID 20127787)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2528 (class 1259 OID 20127684)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2606 (class 1259 OID 20127862)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2607 (class 1259 OID 20127864)
-- Name: idx_23aeb9586b361365; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9586b361365 ON funkcija USING btree (tipfunkcije_id);


--
-- TOC entry 2608 (class 1259 OID 20127863)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2517 (class 1259 OID 20127653)
-- Name: idx_2942b10710389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b10710389148 ON kontaktnaoseba USING btree (oseba_id);


--
-- TOC entry 2518 (class 1259 OID 20127652)
-- Name: idx_2942b1076beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b1076beede51 ON kontaktnaoseba USING btree (popa_id);


--
-- TOC entry 2687 (class 1259 OID 20128184)
-- Name: idx_2d901816d6bc69d6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2d901816d6bc69d6 ON programskaenotasklopa USING btree (programrazno_id);


--
-- TOC entry 2639 (class 1259 OID 20127977)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2640 (class 1259 OID 20127978)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2641 (class 1259 OID 20127979)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2706 (class 1259 OID 20128251)
-- Name: idx_2eaff9dcaf91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2eaff9dcaf91ecd ON zapislastnik USING btree (zapis_id);


--
-- TOC entry 2648 (class 1259 OID 20128013)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2649 (class 1259 OID 20128010)
-- Name: idx_344a77a7c3b0d59; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a7c3b0d59 ON uprizoritev USING btree (maticnioder_id);


--
-- TOC entry 2650 (class 1259 OID 20128014)
-- Name: idx_344a77a853a965c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a853a965c ON uprizoritev USING btree (producent_id);


--
-- TOC entry 2651 (class 1259 OID 20128012)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2652 (class 1259 OID 20128011)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2507 (class 1259 OID 20127624)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2508 (class 1259 OID 20127623)
-- Name: idx_37f6541a6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a6beede51 ON trr USING btree (popa_id);


--
-- TOC entry 2483 (class 1259 OID 20127548)
-- Name: idx_466966d769e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_466966d769e8d4 ON oseba USING btree (naslov_id);


--
-- TOC entry 2594 (class 1259 OID 20127829)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2473 (class 1259 OID 20127502)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2474 (class 1259 OID 20127503)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2599 (class 1259 OID 20127849)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2600 (class 1259 OID 20127848)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2601 (class 1259 OID 20127847)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2521 (class 1259 OID 20127662)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2522 (class 1259 OID 20127663)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2453 (class 1259 OID 20127435)
-- Name: idx_6054e804ff55f926; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_6054e804ff55f926 ON stevilcenjekonfig USING btree (stevilcenje_id);


--
-- TOC entry 2556 (class 1259 OID 20127754)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2557 (class 1259 OID 20127752)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2558 (class 1259 OID 20127751)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2559 (class 1259 OID 20127753)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2464 (class 1259 OID 20127476)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2465 (class 1259 OID 20127477)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2585 (class 1259 OID 20127810)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2719 (class 1259 OID 20128285)
-- Name: idx_781826c67e3c61f9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_781826c67e3c61f9 ON datoteka USING btree (owner_id);


--
-- TOC entry 2621 (class 1259 OID 20127901)
-- Name: idx_7ab77b7910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7ab77b7910389148 ON avtorbesedila USING btree (oseba_id);


--
-- TOC entry 2622 (class 1259 OID 20127900)
-- Name: idx_7ab77b79f35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7ab77b79f35157b1 ON avtorbesedila USING btree (besedilo_id);


--
-- TOC entry 2720 (class 1259 OID 20128293)
-- Name: idx_7adc957157ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc957157ed422f ON mapaacl USING btree (mapa_id);


--
-- TOC entry 2721 (class 1259 OID 20128294)
-- Name: idx_7adc9571fa6311ef; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc9571fa6311ef ON mapaacl USING btree (perm_id);


--
-- TOC entry 2571 (class 1259 OID 20127775)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2615 (class 1259 OID 20127893)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2616 (class 1259 OID 20127894)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2669 (class 1259 OID 20128099)
-- Name: idx_8787a0e54ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e54ae1cd1c ON enotaprograma USING btree (gostitelj_id);


--
-- TOC entry 2670 (class 1259 OID 20128098)
-- Name: idx_8787a0e55d0da56c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e55d0da56c ON enotaprograma USING btree (drzavagostovanja_id);


--
-- TOC entry 2671 (class 1259 OID 20128095)
-- Name: idx_8787a0e562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e562b4ffca ON enotaprograma USING btree (uprizoritev_id);


--
-- TOC entry 2672 (class 1259 OID 20128096)
-- Name: idx_8787a0e57222d84b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e57222d84b ON enotaprograma USING btree (tipprogramskeenote_id);


--
-- TOC entry 2673 (class 1259 OID 20128097)
-- Name: idx_8787a0e5771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e5771ec7bd ON enotaprograma USING btree (program_dela_id);


--
-- TOC entry 2496 (class 1259 OID 20127589)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2497 (class 1259 OID 20127588)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2498 (class 1259 OID 20127590)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2588 (class 1259 OID 20127823)
-- Name: idx_952dd21969e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd21969e8d4 ON prostor USING btree (naslov_id);


--
-- TOC entry 2589 (class 1259 OID 20127822)
-- Name: idx_952dd2196beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd2196beede51 ON prostor USING btree (popa_id);


--
-- TOC entry 2679 (class 1259 OID 20128165)
-- Name: idx_97af082e38c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e38c06eb ON produkcijadelitev USING btree (enotaprograma_id);


--
-- TOC entry 2680 (class 1259 OID 20128166)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2662 (class 1259 OID 20128043)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2663 (class 1259 OID 20128044)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2664 (class 1259 OID 20128041)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2665 (class 1259 OID 20128042)
-- Name: idx_a4b7244fa4976613; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fa4976613 ON alternacija USING btree (zaposlitev_id);


--
-- TOC entry 2612 (class 1259 OID 20127884)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2562 (class 1259 OID 20127763)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2563 (class 1259 OID 20127762)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2564 (class 1259 OID 20127760)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2565 (class 1259 OID 20127761)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2658 (class 1259 OID 20128031)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2659 (class 1259 OID 20128030)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2527 (class 1259 OID 20127674)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2676 (class 1259 OID 20128156)
-- Name: idx_dba42fe79e3adf2c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_dba42fe79e3adf2c ON postavkacdve USING btree (programdela_id);


--
-- TOC entry 2695 (class 1259 OID 20128203)
-- Name: idx_e7d4cf2638c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e7d4cf2638c06eb ON drugivir USING btree (enotaprograma_id);


--
-- TOC entry 2713 (class 1259 OID 20128269)
-- Name: idx_e9f8ee8257ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee8257ed422f ON mapa_zapis USING btree (mapa_id);


--
-- TOC entry 2714 (class 1259 OID 20128270)
-- Name: idx_e9f8ee82af91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee82af91ecd ON mapa_zapis USING btree (zapis_id);


--
-- TOC entry 2479 (class 1259 OID 20127523)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2480 (class 1259 OID 20127522)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2488 (class 1259 OID 20127555)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2489 (class 1259 OID 20127556)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2543 (class 1259 OID 20127716)
-- Name: idx_f44a386d10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_f44a386d10389148 ON zasedenost USING btree (oseba_id);


--
-- TOC entry 2551 (class 1259 OID 20127744)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2552 (class 1259 OID 20127743)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2553 (class 1259 OID 20127742)
-- Name: idx_fef7d84ba81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84ba81ccef6 ON terminstoritve USING btree (dogodek_id);


--
-- TOC entry 2538 (class 1259 OID 20127702)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2539 (class 1259 OID 20127703)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2540 (class 1259 OID 20127701)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2541 (class 1259 OID 20127705)
-- Name: uniq_11e93b5dbbc7a989; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dbbc7a989 ON dogodek USING btree (dogodek_splosni_id);


--
-- TOC entry 2542 (class 1259 OID 20127704)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2495 (class 1259 OID 20127574)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2513 (class 1259 OID 20127638)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2514 (class 1259 OID 20127640)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2515 (class 1259 OID 20127639)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2516 (class 1259 OID 20127641)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2570 (class 1259 OID 20127769)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2644 (class 1259 OID 20127976)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2653 (class 1259 OID 20128009)
-- Name: uniq_344a77a559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_344a77a559828a3 ON uprizoritev USING btree (sifra);


--
-- TOC entry 2635 (class 1259 OID 20127951)
-- Name: uniq_3f50510d559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d559828a3 ON tipfunkcije USING btree (sifra);


--
-- TOC entry 2636 (class 1259 OID 20127952)
-- Name: uniq_3f50510d55cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d55cca980 ON tipfunkcije USING btree (ime);


--
-- TOC entry 2486 (class 1259 OID 20127546)
-- Name: uniq_466966d7559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7559828a3 ON oseba USING btree (sifra);


--
-- TOC entry 2487 (class 1259 OID 20127547)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2609 (class 1259 OID 20127874)
-- Name: uniq_5216fcb0559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5216fcb0559828a3 ON zvrstuprizoritve USING btree (sifra);


--
-- TOC entry 2459 (class 1259 OID 20127446)
-- Name: uniq_5a434fbc559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5a434fbc559828a3 ON stevilcenje USING btree (sifra);


--
-- TOC entry 2506 (class 1259 OID 20127610)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2456 (class 1259 OID 20127434)
-- Name: uniq_6054e804889a7556; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_6054e804889a7556 ON stevilcenjekonfig USING btree (dok);


--
-- TOC entry 2692 (class 1259 OID 20128196)
-- Name: uniq_7d834df4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_7d834df4559828a3 ON tipprogramskeenote USING btree (sifra);


--
-- TOC entry 2592 (class 1259 OID 20127821)
-- Name: uniq_952dd21937854736; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21937854736 ON prostor USING btree (naziv);


--
-- TOC entry 2593 (class 1259 OID 20127820)
-- Name: uniq_952dd219559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd219559828a3 ON prostor USING btree (sifra);


--
-- TOC entry 2666 (class 1259 OID 20128040)
-- Name: uniq_a4b7244f559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a4b7244f559828a3 ON alternacija USING btree (sifra);


--
-- TOC entry 2503 (class 1259 OID 20127598)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2645 (class 1259 OID 20127989)
-- Name: uniq_cede8e36559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_cede8e36559828a3 ON zvrstsurs USING btree (sifra);


--
-- TOC entry 2703 (class 1259 OID 20128243)
-- Name: uniq_de1c8aa1d55226c7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_de1c8aa1d55226c7 ON vrstazapisa USING btree (oznaka);


--
-- TOC entry 2685 (class 1259 OID 20128173)
-- Name: uniq_e6fc2028559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc2028559828a3 ON produkcijskahisa USING btree (sifra);


--
-- TOC entry 2686 (class 1259 OID 20128174)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2632 (class 1259 OID 20127940)
-- Name: uniq_ec773670ca2e5fcb; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ec773670ca2e5fcb ON besedilo USING btree (stevilka);


--
-- TOC entry 2550 (class 1259 OID 20127731)
-- Name: uniq_ecc8f8c5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ecc8f8c5559828a3 ON sezona USING btree (sifra);


--
-- TOC entry 2472 (class 1259 OID 20127496)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2752 (class 2606 OID 20128415)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2751 (class 2606 OID 20128420)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2747 (class 2606 OID 20128440)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2753 (class 2606 OID 20128410)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2749 (class 2606 OID 20128430)
-- Name: fk_11e93b5dbbc7a989; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dbbc7a989 FOREIGN KEY (dogodek_splosni_id) REFERENCES dogodeksplosni(id);


--
-- TOC entry 2748 (class 2606 OID 20128435)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2750 (class 2606 OID 20128425)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2788 (class 2606 OID 20128605)
-- Name: fk_11ffe6e05c75296c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e05c75296c FOREIGN KEY (vrstastroska_id) REFERENCES vrstastroska(id);


--
-- TOC entry 2787 (class 2606 OID 20128610)
-- Name: fk_11ffe6e062b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e062b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2786 (class 2606 OID 20128615)
-- Name: fk_11ffe6e06beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e06beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2820 (class 2606 OID 20128780)
-- Name: fk_14a5d6d3727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d3727aca70 FOREIGN KEY (parent_id) REFERENCES mapa(id);


--
-- TOC entry 2821 (class 2606 OID 20128775)
-- Name: fk_14a5d6d38a4a6c12; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d38a4a6c12 FOREIGN KEY (lastnik_id) REFERENCES uporabniki(id);


--
-- TOC entry 2735 (class 2606 OID 20128350)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2770 (class 2606 OID 20128525)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2815 (class 2606 OID 20128760)
-- Name: fk_1ed92829253c4123; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829253c4123 FOREIGN KEY (avtor_id) REFERENCES uporabniki(id);


--
-- TOC entry 2816 (class 2606 OID 20128755)
-- Name: fk_1ed9282957ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282957ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2814 (class 2606 OID 20128765)
-- Name: fk_1ed9282987ff3295; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282987ff3295 FOREIGN KEY (zaklenil_id) REFERENCES uporabniki(id);


--
-- TOC entry 2817 (class 2606 OID 20128750)
-- Name: fk_1ed92829a54dbb1f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829a54dbb1f FOREIGN KEY (datoteka_id) REFERENCES datoteka(id);


--
-- TOC entry 2818 (class 2606 OID 20128745)
-- Name: fk_1ed92829ef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829ef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstazapisa(id);


--
-- TOC entry 2768 (class 2606 OID 20128520)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2769 (class 2606 OID 20128515)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2746 (class 2606 OID 20128405)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2780 (class 2606 OID 20128565)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2778 (class 2606 OID 20128575)
-- Name: fk_23aeb9586b361365; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9586b361365 FOREIGN KEY (tipfunkcije_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2779 (class 2606 OID 20128570)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2741 (class 2606 OID 20128385)
-- Name: fk_2942b10710389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b10710389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2742 (class 2606 OID 20128380)
-- Name: fk_2942b1076beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b1076beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2766 (class 2606 OID 20128505)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2812 (class 2606 OID 20128735)
-- Name: fk_2d901816d6bc69d6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT fk_2d901816d6bc69d6 FOREIGN KEY (programrazno_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2791 (class 2606 OID 20128620)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2790 (class 2606 OID 20128625)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2789 (class 2606 OID 20128630)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 2819 (class 2606 OID 20128770)
-- Name: fk_2eaff9dcaf91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT fk_2eaff9dcaf91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id);


--
-- TOC entry 2793 (class 2606 OID 20128650)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2796 (class 2606 OID 20128635)
-- Name: fk_344a77a7c3b0d59; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a7c3b0d59 FOREIGN KEY (maticnioder_id) REFERENCES prostor(id);


--
-- TOC entry 2792 (class 2606 OID 20128655)
-- Name: fk_344a77a853a965c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a853a965c FOREIGN KEY (producent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2794 (class 2606 OID 20128645)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2795 (class 2606 OID 20128640)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2739 (class 2606 OID 20128375)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2740 (class 2606 OID 20128370)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2731 (class 2606 OID 20128335)
-- Name: fk_466966d769e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d769e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2732 (class 2606 OID 20128330)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2774 (class 2606 OID 20128545)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2728 (class 2606 OID 20128310)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2727 (class 2606 OID 20128315)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2775 (class 2606 OID 20128560)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2776 (class 2606 OID 20128555)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2777 (class 2606 OID 20128550)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2744 (class 2606 OID 20128390)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2743 (class 2606 OID 20128395)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2724 (class 2606 OID 20128295)
-- Name: fk_6054e804ff55f926; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT fk_6054e804ff55f926 FOREIGN KEY (stevilcenje_id) REFERENCES stevilcenje(id);


--
-- TOC entry 2758 (class 2606 OID 20128480)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2760 (class 2606 OID 20128470)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2761 (class 2606 OID 20128465)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2759 (class 2606 OID 20128475)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2726 (class 2606 OID 20128300)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2725 (class 2606 OID 20128305)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2771 (class 2606 OID 20128530)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2824 (class 2606 OID 20128795)
-- Name: fk_781826c67e3c61f9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT fk_781826c67e3c61f9 FOREIGN KEY (owner_id) REFERENCES uporabniki(id);


--
-- TOC entry 2784 (class 2606 OID 20128600)
-- Name: fk_7ab77b7910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT fk_7ab77b7910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2785 (class 2606 OID 20128595)
-- Name: fk_7ab77b79f35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT fk_7ab77b79f35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2826 (class 2606 OID 20128800)
-- Name: fk_7adc957157ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc957157ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2825 (class 2606 OID 20128805)
-- Name: fk_7adc9571fa6311ef; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc9571fa6311ef FOREIGN KEY (perm_id) REFERENCES permission(id);


--
-- TOC entry 2767 (class 2606 OID 20128510)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2783 (class 2606 OID 20128585)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2782 (class 2606 OID 20128590)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2803 (class 2606 OID 20128710)
-- Name: fk_8787a0e54ae1cd1c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e54ae1cd1c FOREIGN KEY (gostitelj_id) REFERENCES popa(id);


--
-- TOC entry 2804 (class 2606 OID 20128705)
-- Name: fk_8787a0e55d0da56c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e55d0da56c FOREIGN KEY (drzavagostovanja_id) REFERENCES drza(id);


--
-- TOC entry 2807 (class 2606 OID 20128690)
-- Name: fk_8787a0e562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2806 (class 2606 OID 20128695)
-- Name: fk_8787a0e57222d84b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e57222d84b FOREIGN KEY (tipprogramskeenote_id) REFERENCES tipprogramskeenote(id);


--
-- TOC entry 2805 (class 2606 OID 20128700)
-- Name: fk_8787a0e5771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e5771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2737 (class 2606 OID 20128360)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2738 (class 2606 OID 20128355)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2736 (class 2606 OID 20128365)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2772 (class 2606 OID 20128540)
-- Name: fk_952dd21969e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd21969e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2773 (class 2606 OID 20128535)
-- Name: fk_952dd2196beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd2196beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2810 (class 2606 OID 20128720)
-- Name: fk_97af082e38c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e38c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2809 (class 2606 OID 20128725)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2800 (class 2606 OID 20128680)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2799 (class 2606 OID 20128685)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2802 (class 2606 OID 20128670)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 2801 (class 2606 OID 20128675)
-- Name: fk_a4b7244fa4976613; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fa4976613 FOREIGN KEY (zaposlitev_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2781 (class 2606 OID 20128580)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2762 (class 2606 OID 20128500)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2763 (class 2606 OID 20128495)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2765 (class 2606 OID 20128485)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2764 (class 2606 OID 20128490)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2797 (class 2606 OID 20128665)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2798 (class 2606 OID 20128660)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2745 (class 2606 OID 20128400)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2808 (class 2606 OID 20128715)
-- Name: fk_dba42fe79e3adf2c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkacdve
    ADD CONSTRAINT fk_dba42fe79e3adf2c FOREIGN KEY (programdela_id) REFERENCES programdela(id);


--
-- TOC entry 2811 (class 2606 OID 20128730)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2813 (class 2606 OID 20128740)
-- Name: fk_e7d4cf2638c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT fk_e7d4cf2638c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2823 (class 2606 OID 20128785)
-- Name: fk_e9f8ee8257ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee8257ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id) ON DELETE CASCADE;


--
-- TOC entry 2822 (class 2606 OID 20128790)
-- Name: fk_e9f8ee82af91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee82af91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id) ON DELETE CASCADE;


--
-- TOC entry 2729 (class 2606 OID 20128325)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2730 (class 2606 OID 20128320)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2734 (class 2606 OID 20128340)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2733 (class 2606 OID 20128345)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2754 (class 2606 OID 20128445)
-- Name: fk_f44a386d10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT fk_f44a386d10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2755 (class 2606 OID 20128460)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2756 (class 2606 OID 20128455)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2757 (class 2606 OID 20128450)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- Completed on 2015-09-18 20:53:38 CEST

--
-- PostgreSQL database dump complete
--

