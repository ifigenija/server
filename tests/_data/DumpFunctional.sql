--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.9
-- Dumped by pg_dump version 9.3.9
-- Started on 2015-09-19 10:19:02 CEST

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
-- TOC entry 181 (class 1259 OID 20185997)
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
-- TOC entry 227 (class 1259 OID 20186525)
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
-- TOC entry 226 (class 1259 OID 20186508)
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
-- TOC entry 217 (class 1259 OID 20186388)
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
-- TOC entry 220 (class 1259 OID 20186418)
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
-- TOC entry 241 (class 1259 OID 20186764)
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
-- TOC entry 195 (class 1259 OID 20186178)
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
-- TOC entry 197 (class 1259 OID 20186210)
-- Name: dogodeksplosni; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodeksplosni (
    id uuid NOT NULL
);


--
-- TOC entry 235 (class 1259 OID 20186690)
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
-- TOC entry 190 (class 1259 OID 20186118)
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
-- TOC entry 228 (class 1259 OID 20186538)
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
-- TOC entry 213 (class 1259 OID 20186343)
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
-- TOC entry 193 (class 1259 OID 20186157)
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
-- TOC entry 191 (class 1259 OID 20186135)
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
-- TOC entry 202 (class 1259 OID 20186257)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 239 (class 1259 OID 20186745)
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
-- TOC entry 240 (class 1259 OID 20186757)
-- Name: mapa_zapis; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE mapa_zapis (
    mapa_id uuid NOT NULL,
    zapis_id uuid NOT NULL
);


--
-- TOC entry 242 (class 1259 OID 20186779)
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
-- TOC entry 206 (class 1259 OID 20186282)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 188 (class 1259 OID 20186092)
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
-- TOC entry 182 (class 1259 OID 20186006)
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
-- TOC entry 183 (class 1259 OID 20186017)
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
-- TOC entry 178 (class 1259 OID 20185971)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 180 (class 1259 OID 20185990)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 207 (class 1259 OID 20186289)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 211 (class 1259 OID 20186323)
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
-- TOC entry 223 (class 1259 OID 20186457)
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
-- TOC entry 185 (class 1259 OID 20186050)
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
-- TOC entry 187 (class 1259 OID 20186084)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 230 (class 1259 OID 20186636)
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
-- TOC entry 203 (class 1259 OID 20186263)
-- Name: postavkaracuna; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE postavkaracuna (
    id uuid NOT NULL,
    racun_id uuid
);


--
-- TOC entry 186 (class 1259 OID 20186069)
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
-- TOC entry 192 (class 1259 OID 20186147)
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
-- TOC entry 205 (class 1259 OID 20186275)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 231 (class 1259 OID 20186650)
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
-- TOC entry 232 (class 1259 OID 20186660)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    sifra character varying(4) NOT NULL,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 229 (class 1259 OID 20186593)
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
-- TOC entry 233 (class 1259 OID 20186668)
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
-- TOC entry 209 (class 1259 OID 20186304)
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
-- TOC entry 201 (class 1259 OID 20186248)
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
-- TOC entry 200 (class 1259 OID 20186238)
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
-- TOC entry 222 (class 1259 OID 20186446)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying,
    status character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 216 (class 1259 OID 20186378)
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
-- TOC entry 175 (class 1259 OID 20185942)
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
-- TOC entry 174 (class 1259 OID 20185940)
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
-- TOC entry 210 (class 1259 OID 20186317)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 179 (class 1259 OID 20185980)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 177 (class 1259 OID 20185964)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 212 (class 1259 OID 20186331)
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
-- TOC entry 204 (class 1259 OID 20186269)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 198 (class 1259 OID 20186215)
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
-- TOC entry 173 (class 1259 OID 20185929)
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
-- TOC entry 172 (class 1259 OID 20185921)
-- Name: stevilcenjekonfig; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjekonfig (
    id uuid NOT NULL,
    stevilcenje_id uuid,
    dok character varying(100) DEFAULT NULL::character varying
);


--
-- TOC entry 171 (class 1259 OID 20185916)
-- Name: stevilcenjestanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjestanje (
    id uuid NOT NULL,
    objid uuid NOT NULL,
    leto integer NOT NULL,
    stevilka integer
);


--
-- TOC entry 218 (class 1259 OID 20186395)
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
-- TOC entry 184 (class 1259 OID 20186042)
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
-- TOC entry 199 (class 1259 OID 20186225)
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
-- TOC entry 221 (class 1259 OID 20186434)
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
-- TOC entry 234 (class 1259 OID 20186678)
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
-- TOC entry 189 (class 1259 OID 20186104)
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
-- TOC entry 176 (class 1259 OID 20185951)
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
-- TOC entry 225 (class 1259 OID 20186483)
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
-- TOC entry 194 (class 1259 OID 20186168)
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
-- TOC entry 208 (class 1259 OID 20186296)
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
-- TOC entry 219 (class 1259 OID 20186409)
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
-- TOC entry 237 (class 1259 OID 20186725)
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
-- TOC entry 236 (class 1259 OID 20186697)
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
-- TOC entry 238 (class 1259 OID 20186737)
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
-- TOC entry 215 (class 1259 OID 20186368)
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
-- TOC entry 196 (class 1259 OID 20186204)
-- Name: zasedenost; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zasedenost (
    id uuid NOT NULL,
    oseba_id uuid
);


--
-- TOC entry 224 (class 1259 OID 20186473)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 214 (class 1259 OID 20186358)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 2191 (class 2604 OID 20185945)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 2945 (class 0 OID 20185997)
-- Dependencies: 181
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
\.


--
-- TOC entry 2991 (class 0 OID 20186525)
-- Dependencies: 227
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, zaposlitev_id, oseba_id, pogodba_id, sifra, zaposlen, zacetek, konec, opomba, sort, privzeti, aktivna, imapogodbo, pomembna) FROM stdin;
000c0000-55fd-1a74-de68-7574b4c01212	000d0000-55fd-1a74-2f13-97bc4b4af07d	\N	00090000-55fd-1a74-e2b9-bb2ea155c991	000b0000-55fd-1a74-2b7a-e352f800ced6	0001	f	\N	\N	\N	3	t	\N	t	t
000c0000-55fd-1a74-805b-65f07544dcff	000d0000-55fd-1a74-9532-bb16ca07ba12	00100000-55fd-1a74-8bf8-cab8f8eff9da	00090000-55fd-1a74-b958-9b09e173e528	\N	0002	t	2016-01-01	\N	\N	8	t	\N	f	f
000c0000-55fd-1a74-68ad-e2deda5aef7f	000d0000-55fd-1a74-2128-ea6475e8d18f	00100000-55fd-1a74-4709-53410cbb825e	00090000-55fd-1a74-15d6-abdfb0c600f3	\N	0003	t	\N	2015-09-19	\N	2	t	\N	f	f
000c0000-55fd-1a74-c954-98e07ee1a496	000d0000-55fd-1a74-ed87-bc82bd8f2b0e	\N	00090000-55fd-1a74-474e-874566b72d5d	\N	0004	f	2016-01-01	2016-01-01	\N	26	t	\N	f	f
000c0000-55fd-1a74-d018-0e45d12385d3	000d0000-55fd-1a74-ba2a-0a3793fc5c88	\N	00090000-55fd-1a74-2150-7ca5096d1ca9	\N	0005	f	2016-01-01	2016-01-01	\N	7	t	\N	f	f
000c0000-55fd-1a74-fc43-2608a2a1a5d1	000d0000-55fd-1a74-fa25-1362d5bda1ce	\N	00090000-55fd-1a74-058b-baa9aef68685	000b0000-55fd-1a74-cab4-63241003bc74	0006	f	2016-01-01	2016-01-01	\N	1	t	\N	t	t
000c0000-55fd-1a74-94df-66b3d3d343a0	000d0000-55fd-1a74-e484-4f35a8c31db3	00100000-55fd-1a74-87ac-5c71cd3291bc	00090000-55fd-1a74-3b7e-fde114d3e1ee	\N	0007	t	2016-01-01	2016-01-01	\N	14	t	\N	f	t
000c0000-55fd-1a74-09fb-ada3e3da2421	000d0000-55fd-1a74-d5b0-7365fe60bd69	\N	00090000-55fd-1a74-756b-5382b344ff86	000b0000-55fd-1a74-8594-a5f9d983fee7	0008	f	2016-01-01	2016-01-01	\N	12	t	\N	t	t
000c0000-55fd-1a74-0f53-15c06df51a58	000d0000-55fd-1a74-e484-4f35a8c31db3	00100000-55fd-1a74-7eb9-26a291fd9b5f	00090000-55fd-1a74-5a48-58b8d0c3bcd1	\N	0009	t	2017-01-01	2017-01-01	\N	15	t	\N	f	t
000c0000-55fd-1a74-3ba4-7f8b2ee5a2c9	000d0000-55fd-1a74-e484-4f35a8c31db3	00100000-55fd-1a74-2744-f943d35c38b7	00090000-55fd-1a74-2346-90a9e0ea33dd	\N	0010	t	\N	2015-09-19	\N	16	f	\N	f	t
000c0000-55fd-1a74-dee6-2075521ad4dd	000d0000-55fd-1a74-e484-4f35a8c31db3	00100000-55fd-1a74-3f0f-b0d62d96823f	00090000-55fd-1a74-58b1-ed85aedf62b7	\N	0011	t	2017-01-01	\N	\N	17	f	\N	f	t
000c0000-55fd-1a74-e003-0e8e642b599d	000d0000-55fd-1a74-f5a0-3c1615717f35	\N	00090000-55fd-1a74-b958-9b09e173e528	000b0000-55fd-1a74-b1ae-1f5dc1a5c0fc	0012	f	\N	\N	\N	2	t	\N	t	t
\.


--
-- TOC entry 2990 (class 0 OID 20186508)
-- Dependencies: 226
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 2981 (class 0 OID 20186388)
-- Dependencies: 217
-- Data for Name: avtorbesedila; Type: TABLE DATA; Schema: public; Owner: -
--

COPY avtorbesedila (id, besedilo_id, oseba_id, tipavtorja, zaporedna, alivnaslovu) FROM stdin;
003d0000-55fd-1a74-a7bd-73d3e5485952	00160000-55fd-1a74-6b7d-5264cfc2f9a5	00090000-55fd-1a74-5a0d-840bea959ae8	Avtor originala	10	t
003d0000-55fd-1a74-3329-6d7b5401965b	00160000-55fd-1a74-6b7d-5264cfc2f9a5	00090000-55fd-1a74-4238-4ed7b572247a	Predelava	14	t
003d0000-55fd-1a74-e449-9cdbe5913426	00160000-55fd-1a74-4010-47bc7591b091	00090000-55fd-1a74-9d4e-17dee59bf149	Avtor originala	11	t
003d0000-55fd-1a74-e4c5-3276c67f2b3e	00160000-55fd-1a74-90a0-a3479fb61e0f	00090000-55fd-1a74-24ab-2092f63fadb1	Avtor originala	12	t
003d0000-55fd-1a74-13d8-7f1dd0f702d8	00160000-55fd-1a74-6b7d-5264cfc2f9a5	00090000-55fd-1a74-823b-21eb76cedd2e	Predelava	18	f
\.


--
-- TOC entry 2984 (class 0 OID 20186418)
-- Dependencies: 220
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, stevilka, naslov, podnaslov, jezik, naslovizvirnika, internacionalninaslov, datumprejema, moskevloge, zenskevloge, povzetekvsebine, letoizida, krajizida, zaloznik) FROM stdin;
00160000-55fd-1a74-6b7d-5264cfc2f9a5	0001	Sen kresne noči		slovenščina	A Midsummer Night's Dream	\N	2015-04-26	5	5	Nastopajo Titanija, Hipolita, Oberon, ...	\N	\N	\N
00160000-55fd-1a74-4010-47bc7591b091	0002	Bratje Karamazovi		slovenščina	Bratja Karamazjovji	\N	2015-12-04	4	1	Svetovna uspešnica	\N	\N	\N
00160000-55fd-1a74-90a0-a3479fb61e0f	0003	Smoletov Vrt		slovenščina		\N	2015-05-26	2	8		\N	\N	\N
\.


--
-- TOC entry 3005 (class 0 OID 20186764)
-- Dependencies: 241
-- Data for Name: datoteka; Type: TABLE DATA; Schema: public; Owner: -
--

COPY datoteka (id, owner_id, filename, transfers, size, format, hash, createdat, uploadedat, upor, datknj) FROM stdin;
\.


--
-- TOC entry 2959 (class 0 OID 20186178)
-- Dependencies: 195
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_splosni_id, prostor_id, sezona_id, planiranzacetek, allday, zacetek, konec, status, razred, termin, title) FROM stdin;
00180000-55fd-1a74-acc6-83dcf1b72b73	\N	\N	00200000-55fd-1a74-3c39-3eb59454b0a1	\N	\N	\N	\N	2015-06-26 10:00:00	f	2015-06-26 10:00:00	2015-06-26 12:00:00	200s	200s		dogodek 1
00180000-55fd-1a74-f6ba-0a8a0a5edbe1	\N	\N	00200000-55fd-1a74-0300-118c48a3b92b	\N	\N	\N	\N	2015-06-27 10:00:00	f	2015-06-27 10:00:00	2015-06-27 12:00:00	300s	200s		dogodek 2
00180000-55fd-1a74-f231-b3fcf158206f	\N	\N	00200000-55fd-1a74-7c02-2f9bfa3fab5b	\N	\N	\N	\N	2015-08-01 20:00:00	f	2015-08-01 20:00:00	2015-08-01 23:00:00	400s	200s		dogodek 3
00180000-55fd-1a74-c8ca-6e77f3491ead	\N	\N	00200000-55fd-1a74-f348-bdf791f6e418	\N	\N	\N	\N	2015-08-01 20:00:00	f	2015-08-01 20:00:00	2015-08-01 23:00:00	100s	200s		dogodek 4
00180000-55fd-1a74-acca-f7db99f0c181	\N	\N	00200000-55fd-1a74-0b1a-7d49fea8c603	\N	\N	\N	\N	2015-08-01 20:00:00	f	2015-08-01 20:00:00	2015-08-01 23:00:00	500s	200s		dogodek 5
\.


--
-- TOC entry 2961 (class 0 OID 20186210)
-- Dependencies: 197
-- Data for Name: dogodeksplosni; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodeksplosni (id) FROM stdin;
\.


--
-- TOC entry 2999 (class 0 OID 20186690)
-- Dependencies: 235
-- Data for Name: drugivir; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drugivir (id, znesek, opis, mednarodni, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 2954 (class 0 OID 20186118)
-- Dependencies: 190
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-55fd-1a72-bb8b-95306dea5426	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-55fd-1a72-0189-5c18a602cbd8	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-55fd-1a72-3040-4b790372c60e	AL	ALB	008	Albania 	Albanija	\N
00040000-55fd-1a72-4948-6236712ce1f4	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-55fd-1a72-802b-7ba123108fd1	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-55fd-1a72-6f9d-a68af0e54ef7	AD	AND	020	Andorra 	Andora	\N
00040000-55fd-1a72-11d9-ad3eff163d7a	AO	AGO	024	Angola 	Angola	\N
00040000-55fd-1a72-e5f3-bf5c9b40f0ee	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-55fd-1a72-51fb-8b05628dcf0e	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-55fd-1a72-658d-403e4152cc7e	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-55fd-1a72-48ad-ff33b1633928	AR	ARG	032	Argentina 	Argenitna	\N
00040000-55fd-1a72-2d63-3ca6de028297	AM	ARM	051	Armenia 	Armenija	\N
00040000-55fd-1a72-bc1e-7f8d5e5a2790	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-55fd-1a72-17f9-c6ae304cd11e	AU	AUS	036	Australia 	Avstralija	\N
00040000-55fd-1a72-6c39-a94617f3e8e3	AT	AUT	040	Austria 	Avstrija	\N
00040000-55fd-1a72-2277-0199bd3d1e0a	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-55fd-1a72-255b-aff2b48b617b	BS	BHS	044	Bahamas 	Bahami	\N
00040000-55fd-1a72-162f-e8e9daab52f1	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-55fd-1a72-df5e-a06e4ec72bda	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-55fd-1a72-811e-5d605a7065b8	BB	BRB	052	Barbados 	Barbados	\N
00040000-55fd-1a72-465d-fb4922a390aa	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-55fd-1a72-c17a-1c7056c58260	BE	BEL	056	Belgium 	Belgija	\N
00040000-55fd-1a72-c482-6cf2595f60d0	BZ	BLZ	084	Belize 	Belize	\N
00040000-55fd-1a72-aee9-74fdb7a07328	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-55fd-1a72-10d0-4b1c6874a4d8	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-55fd-1a72-4780-6df2cc8d15d8	BT	BTN	064	Bhutan 	Butan	\N
00040000-55fd-1a72-a79e-eb1acf8c2653	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-55fd-1a72-cac2-496a4252d488	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-55fd-1a72-97c6-33f23ae4b726	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-55fd-1a72-4f8f-80d5ad27754f	BW	BWA	072	Botswana 	Bocvana	\N
00040000-55fd-1a72-fdb0-90de8aa73724	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-55fd-1a72-5ed4-58923dfa2bc7	BR	BRA	076	Brazil 	Brazilija	\N
00040000-55fd-1a72-8d97-313b9c0c8324	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-55fd-1a72-1549-48c88fd5bd1b	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-55fd-1a72-36a1-630b3291ecf6	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-55fd-1a72-33af-833ec235d24f	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-55fd-1a72-35d0-74a2fb9062da	BI	BDI	108	Burundi 	Burundi 	\N
00040000-55fd-1a72-4b1a-74bcce492ade	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-55fd-1a72-c05e-b8fd05c89947	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-55fd-1a72-6d13-f00fa8f0e798	CA	CAN	124	Canada 	Kanada	\N
00040000-55fd-1a72-9052-703b9dd6c6aa	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-55fd-1a72-2cda-8980fccb4972	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-55fd-1a72-571d-16c9231efc0f	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-55fd-1a72-1897-7348e039d5ea	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-55fd-1a72-3dca-675df32ba4e5	CL	CHL	152	Chile 	Čile	\N
00040000-55fd-1a72-a919-d346b30f74c3	CN	CHN	156	China 	Kitajska	\N
00040000-55fd-1a72-e16f-8b3b0e1dfd6d	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-55fd-1a72-9166-d1f356e97b54	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-55fd-1a72-7f18-9538e93dbf0d	CO	COL	170	Colombia 	Kolumbija	\N
00040000-55fd-1a72-fa95-dc52a19209fa	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-55fd-1a72-82ac-102f00798e0f	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-55fd-1a72-716b-8bf397d4293e	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-55fd-1a72-9fd9-55b787388ddd	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-55fd-1a72-cc49-8c5c83d268a6	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-55fd-1a72-0733-645c4f74d605	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-55fd-1a72-0153-3663178107bb	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-55fd-1a72-bcb9-773f1fabda2b	CU	CUB	192	Cuba 	Kuba	\N
00040000-55fd-1a72-ca4f-5c9a0ac1a3df	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-55fd-1a72-ccaf-3eb736301bc6	CY	CYP	196	Cyprus 	Ciper	\N
00040000-55fd-1a72-0288-c79c0c5d14a3	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-55fd-1a72-0004-b17bfdf21c7c	DK	DNK	208	Denmark 	Danska	\N
00040000-55fd-1a72-532f-8b612f4ad4d7	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-55fd-1a72-9df0-956fc5c1a916	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-55fd-1a72-baa6-7be4990731b7	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-55fd-1a72-9f93-80b43a0e011e	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-55fd-1a72-6c89-01ffa32a067e	EG	EGY	818	Egypt 	Egipt	\N
00040000-55fd-1a72-468a-09bae400221c	SV	SLV	222	El Salvador 	Salvador	\N
00040000-55fd-1a72-e228-e4521d0f6b56	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-55fd-1a72-b4ea-ee23c6418466	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-55fd-1a72-2aed-782d6540ae2b	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-55fd-1a72-1a9b-dc04cc200ae0	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-55fd-1a72-f399-fc2cf9834fb4	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-55fd-1a72-004f-bd4dc889016d	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-55fd-1a72-43a0-6bf3598433ad	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-55fd-1a72-783f-d4a60b004210	FI	FIN	246	Finland 	Finska	\N
00040000-55fd-1a72-09a1-0f5c93f2cc6f	FR	FRA	250	France 	Francija	\N
00040000-55fd-1a72-db58-ab71de40ced5	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-55fd-1a72-e94a-da2dbe09baef	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-55fd-1a72-fea8-686993e3e04f	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-55fd-1a72-2879-8e4ffc936787	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-55fd-1a72-4a4d-7d106886dc48	GA	GAB	266	Gabon 	Gabon	\N
00040000-55fd-1a72-e61a-395e24287feb	GM	GMB	270	Gambia 	Gambija	\N
00040000-55fd-1a72-c7b8-59f01ff0524c	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-55fd-1a72-aca7-6828c79dd5d5	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-55fd-1a72-4ecc-bb241ab61bfd	GH	GHA	288	Ghana 	Gana	\N
00040000-55fd-1a72-cbd6-f55859ed0872	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-55fd-1a72-6439-949b75e56fd8	GR	GRC	300	Greece 	Grčija	\N
00040000-55fd-1a72-b353-011ff35d1a14	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-55fd-1a72-fa48-f8c1d43f9069	GD	GRD	308	Grenada 	Grenada	\N
00040000-55fd-1a72-d4c1-8f09df9091fc	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-55fd-1a72-4bca-020602a0f7d5	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-55fd-1a72-6c90-d8dde9e8c903	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-55fd-1a72-c910-4994ab0210ac	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-55fd-1a72-b672-114dbe892379	GN	GIN	324	Guinea 	Gvineja	\N
00040000-55fd-1a72-91bc-60f58b8df036	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-55fd-1a72-decb-670809f409c5	GY	GUY	328	Guyana 	Gvajana	\N
00040000-55fd-1a72-6856-d18efe9f2e6a	HT	HTI	332	Haiti 	Haiti	\N
00040000-55fd-1a72-5d17-ad51f92da06d	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-55fd-1a72-4840-6f4bdd274d6e	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-55fd-1a72-5a7d-85c70a04e6cc	HN	HND	340	Honduras 	Honduras	\N
00040000-55fd-1a72-99eb-e31b8bfd6104	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-55fd-1a72-e124-cf68e13e58cd	HU	HUN	348	Hungary 	Madžarska	\N
00040000-55fd-1a72-58e1-bb921bbcf057	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-55fd-1a72-d965-853ed2e80270	IN	IND	356	India 	Indija	\N
00040000-55fd-1a72-f79d-54c61e8f40aa	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-55fd-1a72-46a4-96fd0a78095b	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-55fd-1a72-f91c-476e99cda545	IQ	IRQ	368	Iraq 	Irak	\N
00040000-55fd-1a72-1d63-6d3d665fe6a0	IE	IRL	372	Ireland 	Irska	\N
00040000-55fd-1a72-268f-10e8d8f2776a	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-55fd-1a72-cc8f-d490abb52af7	IL	ISR	376	Israel 	Izrael	\N
00040000-55fd-1a72-d923-c67d16c4a9f6	IT	ITA	380	Italy 	Italija	\N
00040000-55fd-1a72-ae4e-e4f2cf7e42e6	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-55fd-1a72-36b2-40096c121953	JP	JPN	392	Japan 	Japonska	\N
00040000-55fd-1a72-17e7-22034e890192	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-55fd-1a72-ac0f-421e2debbaa4	JO	JOR	400	Jordan 	Jordanija	\N
00040000-55fd-1a72-fda5-7ee8361cd5a9	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-55fd-1a72-52f5-143365366ede	KE	KEN	404	Kenya 	Kenija	\N
00040000-55fd-1a72-ba8b-e14a325d4a95	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-55fd-1a72-aca1-3857ea2fba54	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-55fd-1a72-93ce-55916393b681	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-55fd-1a72-af49-b8ed6386e73f	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-55fd-1a72-555e-b90dcbe007b1	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-55fd-1a72-aaf3-56b0061781c8	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-55fd-1a72-0764-62c6e6ceb4c1	LV	LVA	428	Latvia 	Latvija	\N
00040000-55fd-1a72-c569-d3fbf5f0f17c	LB	LBN	422	Lebanon 	Libanon	\N
00040000-55fd-1a72-26d8-4f6ada84a030	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-55fd-1a72-c276-56c66443dd9d	LR	LBR	430	Liberia 	Liberija	\N
00040000-55fd-1a72-c265-fb3eb07b81e4	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-55fd-1a72-c8c9-bdb77e5f646b	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-55fd-1a72-2c69-c07e752006ff	LT	LTU	440	Lithuania 	Litva	\N
00040000-55fd-1a72-6eeb-b6559e77d742	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-55fd-1a72-56ca-b3391585af72	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-55fd-1a72-90c2-c8add11cfbc9	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-55fd-1a72-b7c3-dc449fe49691	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-55fd-1a72-0c8c-957c4e12b215	MW	MWI	454	Malawi 	Malavi	\N
00040000-55fd-1a72-a9e9-86f982085b93	MY	MYS	458	Malaysia 	Malezija	\N
00040000-55fd-1a72-a5f7-9a33f268d2dc	MV	MDV	462	Maldives 	Maldivi	\N
00040000-55fd-1a72-6d43-ad7e056ff897	ML	MLI	466	Mali 	Mali	\N
00040000-55fd-1a72-5a28-d3361b0c74f6	MT	MLT	470	Malta 	Malta	\N
00040000-55fd-1a72-d7ed-d24a59c30ccd	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-55fd-1a72-3faf-68ec532ce635	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-55fd-1a72-23d3-a23c7278e7b7	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-55fd-1a72-ca22-2c0bc38542a4	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-55fd-1a72-bc68-7d36424f744c	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-55fd-1a72-07cb-840b1753de89	MX	MEX	484	Mexico 	Mehika	\N
00040000-55fd-1a72-c4fb-128a99404b70	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-55fd-1a72-e6fc-d5de6b247987	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-55fd-1a72-41c8-fc4ebf48f530	MC	MCO	492	Monaco 	Monako	\N
00040000-55fd-1a72-e3ec-cd6556029b13	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-55fd-1a72-5470-5f76d1e40cef	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-55fd-1a72-13fc-1d44691a9201	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-55fd-1a72-3dbe-4a8f2036c42b	MA	MAR	504	Morocco 	Maroko	\N
00040000-55fd-1a72-e21b-b7817c4734f6	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-55fd-1a72-cf62-fb4d8b1d12dd	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-55fd-1a72-d4e4-7686fae7e599	NA	NAM	516	Namibia 	Namibija	\N
00040000-55fd-1a72-8714-53e9ef050881	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-55fd-1a72-de9a-1e6e9c6db550	NP	NPL	524	Nepal 	Nepal	\N
00040000-55fd-1a72-3209-042be7b25220	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-55fd-1a72-aa2f-d8ae9d1af006	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-55fd-1a72-6145-d5267ba2f59c	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-55fd-1a72-61f4-d3b9ed2abf2a	NE	NER	562	Niger 	Niger 	\N
00040000-55fd-1a72-e6f4-fbc81318d28b	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-55fd-1a72-a288-030a117ce623	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-55fd-1a72-eb9e-17582587ed98	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-55fd-1a72-b887-2c74b9ce4584	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-55fd-1a72-4a95-04f8a1f65c7f	NO	NOR	578	Norway 	Norveška	\N
00040000-55fd-1a72-c494-7c4b0713debc	OM	OMN	512	Oman 	Oman	\N
00040000-55fd-1a72-ec2f-94afb1f0d37d	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-55fd-1a72-3683-c49601235b7d	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-55fd-1a72-3ec3-8018ba627d9d	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-55fd-1a72-6d8c-7ad91739c469	PA	PAN	591	Panama 	Panama	\N
00040000-55fd-1a72-fcd5-a35cc492629e	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-55fd-1a72-7540-7e1d5e4bd69e	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-55fd-1a72-b3a0-929bc8fb52a1	PE	PER	604	Peru 	Peru	\N
00040000-55fd-1a72-f49e-e94e845a8fd1	PH	PHL	608	Philippines 	Filipini	\N
00040000-55fd-1a72-8344-0f4299da3d7b	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-55fd-1a72-1fb1-b8d6120d5ec9	PL	POL	616	Poland 	Poljska	\N
00040000-55fd-1a72-77af-3cde916562f0	PT	PRT	620	Portugal 	Portugalska	\N
00040000-55fd-1a72-e02b-1518ee3052c6	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-55fd-1a72-4cda-b90a13de2e92	QA	QAT	634	Qatar 	Katar	\N
00040000-55fd-1a72-e800-a034669d7967	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-55fd-1a72-3474-980545843492	RO	ROU	642	Romania 	Romunija	\N
00040000-55fd-1a72-fa29-1eaeef02f62b	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-55fd-1a72-6c17-1b99c9afa7b5	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-55fd-1a72-e7f0-81f3c2e6053c	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-55fd-1a72-fd6b-3826b7d14470	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-55fd-1a72-4e92-a5b32b03ad36	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-55fd-1a72-ecba-7724a1868c09	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-55fd-1a72-2a6b-ed109b09e1a0	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-55fd-1a72-15db-71a98423b3a3	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-55fd-1a72-3770-4e06675672cc	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-55fd-1a72-7153-a3f822b535e9	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-55fd-1a72-0e99-acc764f69721	SM	SMR	674	San Marino 	San Marino	\N
00040000-55fd-1a72-1863-42f628ca485a	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-55fd-1a72-86f9-d529164d3cd7	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-55fd-1a72-f76f-dfc3f9619e17	SN	SEN	686	Senegal 	Senegal	\N
00040000-55fd-1a72-d844-1cbc5fc0b131	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-55fd-1a72-a538-53fbaa8aa203	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-55fd-1a72-f411-5e7a9263edf4	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-55fd-1a72-59b5-b3dc9c5ab34a	SG	SGP	702	Singapore 	Singapur	\N
00040000-55fd-1a72-32bc-35d1965b1175	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-55fd-1a72-51da-7c78f4e65bff	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-55fd-1a72-aab1-4ea07023de65	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-55fd-1a72-9b07-4d10c890538b	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-55fd-1a72-aaad-4bbb3aa8b763	SO	SOM	706	Somalia 	Somalija	\N
00040000-55fd-1a72-3ab3-ef14a11aeade	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-55fd-1a72-ea18-3e07e2298a3e	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-55fd-1a72-5d47-faa38e256ba1	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-55fd-1a72-4c7a-b353608b9f40	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-55fd-1a72-79d4-c2d3d7f9fc7c	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-55fd-1a72-37e0-5a3b8899ebfc	SD	SDN	729	Sudan 	Sudan	\N
00040000-55fd-1a72-0916-e3b88f24c081	SR	SUR	740	Suriname 	Surinam	\N
00040000-55fd-1a72-159d-6a32dc90d285	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-55fd-1a72-1646-7386959cea84	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-55fd-1a72-c32a-29ab787a1794	SE	SWE	752	Sweden 	Švedska	\N
00040000-55fd-1a72-52bc-fab31c964e3a	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-55fd-1a72-f7a8-4675c5db2726	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-55fd-1a72-f8d1-6cc00c21c64b	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-55fd-1a72-a3fc-7958aab9e32a	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-55fd-1a72-4dfb-5d0a98a16d2e	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-55fd-1a72-c800-2c0eb2c62cbd	TH	THA	764	Thailand 	Tajska	\N
00040000-55fd-1a72-4633-60d558a5ba96	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-55fd-1a72-c53c-5276dc7b695d	TG	TGO	768	Togo 	Togo	\N
00040000-55fd-1a72-6518-6e9a935b8b57	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-55fd-1a72-1ebd-e9ded9b3fb29	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-55fd-1a72-be65-f1d07747b133	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-55fd-1a72-a704-36dd5865322e	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-55fd-1a72-ea5b-93868a760bbc	TR	TUR	792	Turkey 	Turčija	\N
00040000-55fd-1a72-7b5a-f10dada3f13a	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-55fd-1a72-2222-61b04bc58ee8	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-55fd-1a72-acf9-f27b678a0e22	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-55fd-1a72-3491-def2af505e9b	UG	UGA	800	Uganda 	Uganda	\N
00040000-55fd-1a72-8bc1-744c8a548c6b	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-55fd-1a72-6f1c-ca0c0d06554f	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-55fd-1a72-57c5-92c58ffeb825	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-55fd-1a72-1127-53e571a4f46f	US	USA	840	United States 	Združene države Amerike	\N
00040000-55fd-1a72-9bcd-542073bfcfbb	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-55fd-1a72-4b91-544b2e35a21e	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-55fd-1a72-2529-faab67b90c9f	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-55fd-1a72-42b5-bcd3165451e3	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-55fd-1a72-f6f8-017ae10bf100	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-55fd-1a72-f85e-24527cda75ab	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-55fd-1a72-ba58-9ae2f17873fd	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-55fd-1a72-fda6-a3a9cf960372	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-55fd-1a72-6d2e-904f89c04a94	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-55fd-1a72-3ac8-cb14e49da36e	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-55fd-1a72-ef18-1ceb664f1347	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-55fd-1a72-5bdd-521a3cdd1c3a	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-55fd-1a72-8c36-ecc7b26359dc	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 2992 (class 0 OID 20186538)
-- Dependencies: 228
-- Data for Name: enotaprograma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY enotaprograma (id, uprizoritev_id, program_dela_id, gostitelj_id, celotnavrednost, nasdelez, celotnavrednostmat, celotnavrednostgostovsz, zaproseno, lastnasredstva, avtorskihonorarji, avtorskihonorarjisamoz, tantieme, avtorskepravice, materialni, imakoprodukcije, vlozekgostitelja, drugijavni, stzaposlenih, stzaposumet, stzaposdrug, sthonorarnih, sthonorarnihigr, sthonorarnihigrtujjz, sthonorarnihigrsamoz, obiskdoma, obiskkopr, obiskgost, obiskzamejo, obiskint, obiskkoprint, ponovidoma, ponovikopr, ponovizamejo, ponovigost, ponovikoprint, ponoviint, naziv, kpe, sort, tipprogramskeenote_id, tip, prikoproducentu, strosekodkpred, stroskiostali, krajgostovanja, ustanova, datumgostovanja, transportnistroski, dnevprvzad, drzavagostovanja_id, stpe, zvrst, stpredstav, stokroglihmiz, stpredstavitev, stdelavnic, stdrugidogodki, stprodukcij, caspriprave, casizvedbe, prizorisca, umetvodja, programskotelo, sttujihselektorjev) FROM stdin;
002f0000-55fd-1a74-ff8d-0a141726094b	000e0000-55fd-1a74-8a35-f48c34141221	\N	\N	9000.30	9000.30	9000.30	0.00	3600.12	5299.98	4000.40	1000.40	200.20	200.30	4599.40	\N	0.00	100.20	0	2	2	2	2	2	\N	40	0	0	0	0	0	1	0	0	0	0	0		0.00	\N	002b0000-55fd-1a72-cd32-d2a92b922eab	premiera	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-55fd-1a74-cbb3-9078002071c7	000e0000-55fd-1a74-3e72-4780de6da502	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	\N	60	0	0	0	0	0	1	0	0	0	0	0		0.00	\N	002b0000-55fd-1a72-dc25-133fee5dc9a1	premiera	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-55fd-1a74-b8c5-d02a80823eb3	000e0000-55fd-1a74-5ebf-5cf37d0290db	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	\N	60	0	0	0	0	0	1	0	0	0	0	0		0.00	\N	002b0000-55fd-1a72-cd32-d2a92b922eab	premiera	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-55fd-1a74-97a0-c4f9de08a436	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-54.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	54.20	5	0	0	3	0	0	\N	22	0	0	0	0	0	0	0	0	0	0	0	Urejanje portala	0.00	10	\N	razno	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-55fd-1a74-8232-81c6b5a23449	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-31.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	31.20	5	0	0	3	0	0	\N	202	0	0	0	0	0	0	0	0	0	0	0	Delavnice otroci	0.00	8	\N	razno	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 2977 (class 0 OID 20186343)
-- Dependencies: 213
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, podrocje, vodjaekipe, naziv, komentar, velikost, pomembna, sort, seplanira, dovoliprekrivanje, maxprekrivanj, tipfunkcije_id) FROM stdin;
000d0000-55fd-1a74-2f13-97bc4b4af07d	000e0000-55fd-1a74-3e72-4780de6da502	000c0000-55fd-1a74-de68-7574b4c01212	igralec	\N	Tezej	glavna vloga	velika	t	5	t	t	\N	000f0000-55fd-1a72-6972-f3e443655bdb
000d0000-55fd-1a74-9532-bb16ca07ba12	000e0000-55fd-1a74-3e72-4780de6da502	000c0000-55fd-1a74-805b-65f07544dcff	umetnik	\N	Režija		velika	t	8	t	t	\N	000f0000-55fd-1a72-7812-e6e2055208f8
000d0000-55fd-1a74-2128-ea6475e8d18f	000e0000-55fd-1a74-3e72-4780de6da502	000c0000-55fd-1a74-68ad-e2deda5aef7f	inspicient	t	Inšpicient			t	8	t	t	\N	000f0000-55fd-1a72-898d-fb4a39ce059b
000d0000-55fd-1a74-ed87-bc82bd8f2b0e	000e0000-55fd-1a74-3e72-4780de6da502	000c0000-55fd-1a74-c954-98e07ee1a496	tehnik	t	Tehnični vodja			t	8	t	t	\N	000f0000-55fd-1a72-6ffd-f73bb16496c7
000d0000-55fd-1a74-ba2a-0a3793fc5c88	000e0000-55fd-1a74-3e72-4780de6da502	000c0000-55fd-1a74-d018-0e45d12385d3	tehnik	\N	Razsvetljava			t	3	t	t	\N	000f0000-55fd-1a72-6ffd-f73bb16496c7
000d0000-55fd-1a74-fa25-1362d5bda1ce	000e0000-55fd-1a74-3e72-4780de6da502	000c0000-55fd-1a74-fc43-2608a2a1a5d1	igralec	\N	Helena	glavna vloga	velika	t	5	t	t	\N	000f0000-55fd-1a72-6972-f3e443655bdb
000d0000-55fd-1a74-e484-4f35a8c31db3	000e0000-55fd-1a74-3e72-4780de6da502	000c0000-55fd-1a74-0f53-15c06df51a58	igralec	\N	Hipolita	glavna vloga	velika	t	6	t	t	\N	000f0000-55fd-1a72-6972-f3e443655bdb
000d0000-55fd-1a74-d5b0-7365fe60bd69	000e0000-55fd-1a74-3e72-4780de6da502	000c0000-55fd-1a74-09fb-ada3e3da2421	umetnik	\N	Lektoriranje			t	22	t	t	\N	000f0000-55fd-1a72-f8aa-04f2898549c4
000d0000-55fd-1a74-f5a0-3c1615717f35	000e0000-55fd-1a74-3e72-4780de6da502	000c0000-55fd-1a74-e003-0e8e642b599d	umetnik	\N	Avtor	Avtor besedila		t	2	t	f	\N	000f0000-55fd-1a72-8e3b-a76eec79730e
\.


--
-- TOC entry 2957 (class 0 OID 20186157)
-- Dependencies: 193
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta, zamejstvo, kraj) FROM stdin;
\.


--
-- TOC entry 2955 (class 0 OID 20186135)
-- Dependencies: 191
-- Data for Name: kontaktnaoseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kontaktnaoseba (id, popa_id, oseba_id, status, funkcija, opis) FROM stdin;
00260000-55fd-1a74-dea4-d9284985b080	00080000-55fd-1a74-41eb-55abd57905f2	00090000-55fd-1a74-2346-90a9e0ea33dd	AK		igralka
\.


--
-- TOC entry 2966 (class 0 OID 20186257)
-- Dependencies: 202
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 3003 (class 0 OID 20186745)
-- Dependencies: 239
-- Data for Name: mapa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa (id, lastnik_id, parent_id, ime, komentar, caskreiranja, casspremembe, javnidostop, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3004 (class 0 OID 20186757)
-- Dependencies: 240
-- Data for Name: mapa_zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa_zapis (mapa_id, zapis_id) FROM stdin;
\.


--
-- TOC entry 3006 (class 0 OID 20186779)
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
-- TOC entry 2970 (class 0 OID 20186282)
-- Dependencies: 206
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 2952 (class 0 OID 20186092)
-- Dependencies: 188
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-55fd-1a73-ec56-64be3461579b	popa.stakli	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-55fd-1a73-42c6-deca231fea20	oseba.spol	array	a:2:{s:1:"M";a:1:{s:5:"label";s:6:"Moški";}s:1:"Z";a:1:{s:5:"label";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-55fd-1a73-b86e-2d9529933744	telefonska.vrsta	array	a:3:{s:7:"mobilna";a:1:{s:5:"label";s:7:"Mobilni";}s:6:"domaca";a:1:{s:5:"label";s:6:"Domač";}s:6:"fiksna";a:1:{s:5:"label";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-55fd-1a73-9522-4394b89ca0fd	kontaktnaoseba.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status kontaktne osebe
00000000-55fd-1a73-e2eb-4892f0f88cdb	dogodek.status	array	a:7:{s:4:"100s";a:1:{s:5:"label";s:11:"Dolgoročno";}s:4:"200s";a:1:{s:5:"label";s:9:"Planirano";}s:4:"300s";a:1:{s:5:"label";s:8:"Fiksiran";}s:4:"400s";a:1:{s:5:"label";s:17:"Potrjen - interno";}s:4:"500s";a:1:{s:5:"label";s:15:"Potrjen - javno";}s:4:"600s";a:1:{s:5:"label";s:10:"Zaključen";}s:4:"700s";a:1:{s:5:"label";s:7:"Obdelan";}}	f	t	t	\N	Tabela statusa dogodkov
00000000-55fd-1a73-736b-b0b4acb86778	dogodek.razred	array	a:5:{s:4:"100s";a:2:{s:5:"label";s:9:"Predstava";s:4:"type";s:9:"predstava";}s:4:"200s";a:2:{s:5:"label";s:4:"Vaja";s:4:"type";s:4:"vaja";}s:4:"300s";a:2:{s:5:"label";s:10:"Gostovanje";s:4:"type";s:10:"gostovanje";}s:4:"400s";a:2:{s:5:"label";s:16:"Splošni dogodek";s:4:"type";s:8:"splošni";}s:4:"500s";a:2:{s:5:"label";s:10:"Zasedenost";s:4:"type";s:10:"zasedenost";}}	f	t	t	\N	Tabela razredov dogodkov, ki jih aplikacija podpira
00000000-55fd-1a73-66b9-3487e633a117	uprizoritev.faza	array	a:6:{s:20:"predprodukcija-ideja";a:1:{s:5:"label";s:16:"Dolgoročni plan";}s:20:"predprodukcija-poziv";a:1:{s:5:"label";s:29:"Predprodukcija, v fazi poziva";}s:30:"predprodukcija-potrjen_program";a:1:{s:5:"label";s:34:"Predprodukcija, program je potrjen";}s:10:"produkcija";a:1:{s:5:"label";s:10:"Produkcija";}s:14:"postprodukcija";a:1:{s:5:"label";s:14:"Postprodukcija";}s:5:"arhiv";a:1:{s:5:"label";s:10:"Arhivirana";}}	f	t	f	\N	Faza uprizoritve
00000000-55fd-1a73-0d8f-1d87b3cbfaec	funkcija.podrocje	array	a:4:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}}	f	t	f	\N	Področje funkcije
00000000-55fd-1a73-8a43-d14570902825	tipfunkcije.podrocje	array	a:4:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}}	f	t	f	\N	Področje funkcije
00000000-55fd-1a73-73c2-e953626c0efc	funkcija.velikost	array	a:4:{s:7:"stataza";a:1:{s:5:"label";s:8:"Stataža";}s:4:"mala";a:1:{s:5:"label";s:21:"Mala vloga / funkcija";}s:7:"srednja";a:1:{s:5:"label";s:24:"Srednja vloga / funkcija";}s:6:"velika";a:1:{s:5:"label";s:23:"Velika vloga / funkcija";}}	f	t	f	\N	Velikost funkcije
00000000-55fd-1a73-e20e-af7ee9e61e9f	zaposlitev.status	array	a:2:{s:1:"A";a:1:{s:5:"label";s:7:"Aktivna";}s:1:"N";a:1:{s:5:"label";s:9:"Neaktivna";}}	f	t	f	\N	Status zaposlitve
00000000-55fd-1a73-5700-0922fe6d79a0	produkcijskahisa.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktivna";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktivna";}}	f	t	f	\N	Status produkcijske hiše
00000000-55fd-1a73-379c-232c023ee5af	strosekuprizoritve.tipstroska	array	a:1:{s:10:"materialni";a:1:{s:5:"label";s:19:"Materialni strošek";}}	f	t	f	\N	Tip stroška
00000000-55fd-1a73-5a9b-e351f7776b9e	fsacl.dostop	array	a:4:{s:1:"X";a:1:{s:5:"label";s:12:"Brez dostopa";}s:1:"R";a:1:{s:5:"label";s:11:"Samo branje";}s:2:"RW";a:1:{s:5:"label";s:17:"Branje in pisanje";}s:3:"RWD";a:1:{s:5:"label";s:26:"Branje pisanje in brisanje";}}	f	t	f	\N	ACL Javni dostop
00000000-55fd-1a74-693c-b66a163e7d62	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-55fd-1a74-35ee-b6440d385baa	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-55fd-1a74-0d19-90e40134d32b	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-55fd-1a74-8e18-71d8b7f0b220	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-55fd-1a74-e18c-3dc1a4c1c900	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
00000000-55fd-1a75-c43b-1ae9e910b39c	application.tenant.maticnopodjetje	string	s:4:"1001";	f	t	f		Šifra matičnega podjetja v Popa in ProdukcijskaHisa
\.


--
-- TOC entry 2946 (class 0 OID 20186006)
-- Dependencies: 182
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-55fd-1a74-4acb-b6c137838b36	00000000-55fd-1a74-693c-b66a163e7d62	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-55fd-1a74-9098-5395cebee84d	00000000-55fd-1a74-693c-b66a163e7d62	00010000-55fd-1a73-9ea8-f50a3d62c39c	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-55fd-1a74-add7-a3697533a46d	00000000-55fd-1a74-35ee-b6440d385baa	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 2947 (class 0 OID 20186017)
-- Dependencies: 183
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naslov_id, sifra, naziv, ime, priimek, funkcija, srednjeime, polnoime, psevdonim, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
00090000-55fd-1a74-e2b9-bb2ea155c991	\N	\N	0001	g.	Janez	Novak	a	Peter	Janez Peter Novak	Jani	jani.novak@xxx.xx	1958-01-06	0601958000000	123456789	M	Jani Janez	Slovenija	Slovenija	Ljubljana
00090000-55fd-1a74-474e-874566b72d5d	00010000-55fd-1a74-5180-48595e88c099	\N	0002	dr.	Anton	Horvat	b		Anton  Horvat	Tona	anton.horvat@xxx.xx	1968-02-12	1202968111111	234567890	M		Slovenija	Slovenija	Maribor
00090000-55fd-1a74-15d6-abdfb0c600f3	00010000-55fd-1a74-566d-d46c270f9483	\N	0003		Ivan	Kovačič	c		Ivan  Kovačič	Ivo	ivan.kovacic@xxx.xx	1975-03-26	2603976222222	345678901	M		Slovenija	Slovenija	Celje
00090000-55fd-1a74-5a48-58b8d0c3bcd1	00010000-55fd-1a74-984c-ebde3ef818c8	\N	0004	prof.	Jožef	Krajnc	d		Jožef  Krajnc	Joža	jozef.krajnc@xxx.xx	1971-04-30	3004971333333	456789012	M		Slovenija	Slovenija	Kranj
00090000-55fd-1a74-aa93-4da6fa4246ba	\N	\N	0005		Marko	Zupančič	e		Marko  Zupančič		marko.zupancic@xxx.xx	1984-05-07	0705984444444	567890123	M		Slovenija	Slovenija	Koper
00090000-55fd-1a74-058b-baa9aef68685	\N	\N	0006	ga.	Marija	Kovač	f		Marija  Kovač		marija.kovac@xxx.xx	1962-06-19	1906962444444	678901234	Z		Slovenija	Slovenija	Murska Sobota
00090000-55fd-1a74-58b1-ed85aedf62b7	\N	\N	0007	ga.	Ana	Potočnik	g		Ana  Potočnik		ana.potocnik@xxx.xx	1975-07-24	2407975555555	789012345	Z		Slovenija	Slovenija	Novo Mesto
00090000-55fd-1a74-3b7e-fde114d3e1ee	\N	\N	0008	ga.	Maja	Mlakar	h		Maja  Mlakar		maja.mlakar@xxx.xx	1986-08-02	0208986666666	890123456	Z		Slovenija	Slovenija	Nova Gorica
00090000-55fd-1a74-2346-90a9e0ea33dd	00010000-55fd-1a74-0fe2-b5b6075c9ec5	\N	0009		Irena	Kos	i		Irena  Kos		irena.kos@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Ptuj
00090000-55fd-1a74-b958-9b09e173e528	\N	\N	0010		Mojca	Vidmar	J		Mojca  Vidmar		mojca.vidmar@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Idrija
00090000-55fd-1a74-a03d-c90738fbe2c2	\N	\N	0011		xx	write protected12345	a		xx  write protected12345		xx@xxx.xx	\N	\N	\N	Z		\N	\N	\N
00090000-55fd-1a74-2150-7ca5096d1ca9	\N	\N	0012		Luka	Golob	luč	a	Luka a Golob		luka.golob@xxx.xx	\N	\N	\N	M		\N	\N	\N
00090000-55fd-1a74-756b-5382b344ff86	00010000-55fd-1a74-040c-1a9df34d2d78	\N	0013		Tatjana	Božič	tajnica	a	Tatjana a Božič		tatjana.bozic@xxx.xx	\N	\N	\N	Z		\N	\N	\N
00090000-55fd-1a74-5a0d-840bea959ae8	\N	\N	0014		William	Shakespeare	avtor		William  Shakespeare		\N	\N	\N	\N	M		\N	\N	\N
00090000-55fd-1a74-4238-4ed7b572247a	\N	\N	0015		Nebojša	Kavader	avtor		Nebojša  Kavader		\N	\N	\N	\N	M		\N	\N	\N
00090000-55fd-1a74-9d4e-17dee59bf149	\N	\N	0016		Fjodor	Dostojevski	avtor	Mihajlovič	Fjodor Mihajlovič Dostojevski		\N	\N	\N	\N	M		\N	\N	\N
00090000-55fd-1a74-24ab-2092f63fadb1	\N	\N	0017		Berta 	Hočevar	avtorica		Berta   Hočevar		\N	\N	\N	\N	Z		\N	\N	\N
00090000-55fd-1a74-823b-21eb76cedd2e	\N	\N	0018		Katarina	Podbevšek	lektorica		Katarina  Podbevšek		\N	\N	\N	\N	Z		\N	\N	\N
\.


--
-- TOC entry 2942 (class 0 OID 20185971)
-- Dependencies: 178
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-55fd-1a72-d27e-6ab7bb73e503	Aaa-read	Aaa (User,Role,Permission) - branje	f
00030000-55fd-1a72-021b-cbf4b221731b	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	f
00030000-55fd-1a72-15dd-e845db1c530e	TerminStoritve-vse	TerminStoritve - spreminjanje vseh zapisov	f
00030000-55fd-1a72-9475-a7d0d24d848d	Dogodek-readVse	Dogodek - branje vseh, ne glede na status dogodka	f
00030000-55fd-1a72-a9bd-97917e4060e8	Oseba-vse	Oseba - vse - za testiranje assert	f
00030000-55fd-1a72-dcf1-9606343fa881	ProgramDela-lock	ProgramDela - zaklepanje	f
00030000-55fd-1a72-8222-2cbe39f889c2	ProgramDela-unlock	ProgramDela - odklepanje	f
00030000-55fd-1a72-fa90-3edf438373a8	Abonma-read	Abonma - branje	f
00030000-55fd-1a72-404a-08c370db2d95	Abonma-write	Abonma - spreminjanje	f
00030000-55fd-1a72-24ef-2e371530dff8	Alternacija-read	Alternacija - branje	f
00030000-55fd-1a72-47ac-f43b6d4b278d	Alternacija-write	Alternacija - spreminjanje	f
00030000-55fd-1a72-5c55-94c7b0ed5b94	Arhivalija-read	Arhivalija - branje	f
00030000-55fd-1a72-744c-2b6e1b51d28d	Arhivalija-write	Arhivalija - spreminjanje	f
00030000-55fd-1a72-3981-69ab61f077ca	AvtorBesedila-read	AvtorBesedila - branje	f
00030000-55fd-1a72-7f84-9006dbe4f7d2	AvtorBesedila-write	AvtorBesedila - spreminjanje	f
00030000-55fd-1a72-def7-8fa2af1ad950	Besedilo-read	Besedilo - branje	f
00030000-55fd-1a72-0ab4-e26de3b09365	Besedilo-write	Besedilo - spreminjanje	f
00030000-55fd-1a72-5d4d-96149df14eb9	DogodekIzven-read	DogodekIzven - branje	f
00030000-55fd-1a72-12de-2ad28e1901be	DogodekIzven-write	DogodekIzven - spreminjanje	f
00030000-55fd-1a72-b63a-f9ea4e982fe6	Dogodek-read	Dogodek - branje	f
00030000-55fd-1a72-b336-4aa77372b794	Dogodek-write	Dogodek - spreminjanje	f
00030000-55fd-1a72-c35f-7b4d4ea403b0	DrugiVir-read	DrugiVir - branje	f
00030000-55fd-1a72-81d7-7b32bf4c3ed6	DrugiVir-write	DrugiVir - spreminjanje	f
00030000-55fd-1a72-bd5b-500747c3c3de	Drzava-read	Drzava - branje	f
00030000-55fd-1a72-7be4-4a8fe92f5eb5	Drzava-write	Drzava - spreminjanje	f
00030000-55fd-1a72-46ab-14c9bc0d1f44	EnotaPrograma-read	EnotaPrograma - branje	f
00030000-55fd-1a72-02c8-c6076ad7d471	EnotaPrograma-write	EnotaPrograma - spreminjanje	f
00030000-55fd-1a72-f4e6-3594b28b363c	Funkcija-read	Funkcija - branje	f
00030000-55fd-1a72-ef62-8623c6006cff	Funkcija-write	Funkcija - spreminjanje	f
00030000-55fd-1a72-34e7-5b580f7f12e8	Gostovanje-read	Gostovanje - branje	f
00030000-55fd-1a72-a06f-18ac2c83266a	Gostovanje-write	Gostovanje - spreminjanje	f
00030000-55fd-1a72-dbd8-a7d55171ad47	Gostujoca-read	Gostujoca - branje	f
00030000-55fd-1a72-a258-86a01d0b724b	Gostujoca-write	Gostujoca - spreminjanje	f
00030000-55fd-1a72-7290-d925131061c7	KontaktnaOseba-read	KontaktnaOseba - branje	f
00030000-55fd-1a72-86c6-83f7dd3213ec	KontaktnaOseba-write	KontaktnaOseba - spreminjanje	f
00030000-55fd-1a72-3a26-27874cbed71b	Kupec-read	Kupec - branje	f
00030000-55fd-1a72-70bd-49f64c740151	Kupec-write	Kupec - spreminjanje	f
00030000-55fd-1a72-ac05-16313c413c2b	NacinPlacina-read	NacinPlacina - branje	f
00030000-55fd-1a72-4216-f1921d594262	NacinPlacina-write	NacinPlacina - spreminjanje	f
00030000-55fd-1a72-3f6e-5d0caa553556	Option-read	Option - branje	f
00030000-55fd-1a72-8410-566f28822c46	Option-write	Option - spreminjanje	f
00030000-55fd-1a72-ba14-d9c2157ad112	OptionValue-read	OptionValue - branje	f
00030000-55fd-1a72-fe2b-f2989abcb310	OptionValue-write	OptionValue - spreminjanje	f
00030000-55fd-1a72-e432-8bd54979ecc4	Oseba-read	Oseba - branje	f
00030000-55fd-1a72-c33d-c1dec44c04cc	Oseba-write	Oseba - spreminjanje	f
00030000-55fd-1a72-f11c-f7e1de0b2622	PlacilniInstrument-read	PlacilniInstrument - branje	f
00030000-55fd-1a72-f69a-f34b6c0cf0fe	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	f
00030000-55fd-1a72-1d9a-709efbd58d20	PodrocjeSedenja-read	PodrocjeSedenja - branje	f
00030000-55fd-1a72-88f4-51c8d58f2058	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	f
00030000-55fd-1a72-a7c0-9d48f7596702	Pogodba-read	Pogodba - branje	f
00030000-55fd-1a72-6d7e-cccb33330e36	Pogodba-write	Pogodba - spreminjanje	f
00030000-55fd-1a72-c6bd-21a59579ff83	Popa-read	Popa - branje	f
00030000-55fd-1a72-a084-5185dff93729	Popa-write	Popa - spreminjanje	f
00030000-55fd-1a72-50bd-ebe940c2c86b	Posta-read	Posta - branje	f
00030000-55fd-1a72-0eee-1ee8abe63138	Posta-write	Posta - spreminjanje	f
00030000-55fd-1a72-9cad-062e254ee618	PostavkaCDve-read	PostavkaCDve - branje	f
00030000-55fd-1a72-e8ad-06b7b35825ee	PostavkaCDve-write	PostavkaCDve - spreminjanje	f
00030000-55fd-1a72-cad1-e4983834cd52	PostavkaRacuna-read	PostavkaRacuna - branje	f
00030000-55fd-1a72-bade-f69d477691fb	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	f
00030000-55fd-1a72-7dc3-2d2223977ee3	PostniNaslov-read	PostniNaslov - branje	f
00030000-55fd-1a72-8fad-be1b737e33d1	PostniNaslov-write	PostniNaslov - spreminjanje	f
00030000-55fd-1a72-4a9a-81ec0dc17a67	Predstava-read	Predstava - branje	f
00030000-55fd-1a72-7541-d9e5f143b7e5	Predstava-write	Predstava - spreminjanje	f
00030000-55fd-1a72-116d-e09d6dd5aef0	ProdajaPredstave-read	ProdajaPredstave - branje	f
00030000-55fd-1a72-8419-becf12f6b3cd	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	f
00030000-55fd-1a72-f49e-9c10200ce9ef	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	f
00030000-55fd-1a72-1bdc-2f314bf198b8	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	f
00030000-55fd-1a72-b4a0-f8ccec241e3d	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	f
00030000-55fd-1a72-9f7c-70f117a1703b	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	f
00030000-55fd-1a72-ad41-a7a28119f963	ProgramDela-read	ProgramDela - branje	f
00030000-55fd-1a72-c3b7-fbf5e7bd5b43	ProgramDela-write	ProgramDela - spreminjanje	f
00030000-55fd-1a72-c279-75048a7b380a	ProgramFestival-read	ProgramFestival - branje	f
00030000-55fd-1a72-2361-1a80c07226f3	ProgramFestival-write	ProgramFestival - spreminjanje	f
00030000-55fd-1a72-fa82-bbb786f810bb	ProgramGostovanje-read	ProgramGostovanje - branje	f
00030000-55fd-1a72-1494-636f87888f14	ProgramGostovanje-write	ProgramGostovanje - spreminjanje	f
00030000-55fd-1a72-c65d-016d2c92d9b2	ProgramGostujoca-read	ProgramGostujoca - branje	f
00030000-55fd-1a72-840b-fed920da1776	ProgramGostujoca-write	ProgramGostujoca - spreminjanje	f
00030000-55fd-1a72-719d-face55cf0344	ProgramIzjemni-read	ProgramIzjemni - branje	f
00030000-55fd-1a72-93b6-8c59645f8d5b	ProgramIzjemni-write	ProgramIzjemni - spreminjanje	f
00030000-55fd-1a72-1e15-dcf98ddf45c8	ProgramPonovitevPrejsnjih-read	ProgramPonovitevPrejsnjih - branje	f
00030000-55fd-1a72-24d5-c9f0ce90f041	ProgramPonovitevPrejsnjih-write	ProgramPonovitevPrejsnjih - spreminjanje	f
00030000-55fd-1a72-2843-f7d499c5e997	ProgramPonovitevPremiere-read	ProgramPonovitevPremiere - branje	f
00030000-55fd-1a72-6490-c92d969a288d	ProgramPonovitevPremiere-write	ProgramPonovitevPremiere - spreminjanje	f
00030000-55fd-1a72-a7d2-03d6979ffc4e	ProgramPremiera-read	ProgramPremiera - branje	f
00030000-55fd-1a72-7419-62299fb18eca	ProgramPremiera-write	ProgramPremiera - spreminjanje	f
00030000-55fd-1a72-8894-ebdeeba90417	ProgramRazno-read	ProgramRazno - branje	f
00030000-55fd-1a72-4e2c-6df54a27b79a	ProgramRazno-write	ProgramRazno - spreminjanje	f
00030000-55fd-1a72-cd6d-ffe56fc606e4	ProgramskaEnotaSklopa-read	ProgramskaEnotaSklopa - branje	f
00030000-55fd-1a72-02b0-bbea22be1e70	ProgramskaEnotaSklopa-write	ProgramskaEnotaSklopa - spreminjanje	f
00030000-55fd-1a72-1403-8202e050005c	Prostor-read	Prostor - branje	f
00030000-55fd-1a72-c9fa-70c3fc87dc0c	Prostor-write	Prostor - spreminjanje	f
00030000-55fd-1a72-8748-baef69b9344f	Racun-read	Racun - branje	f
00030000-55fd-1a72-71be-c8c45d8bf8ff	Racun-write	Racun - spreminjanje	f
00030000-55fd-1a72-5973-5248e1d6fac1	RazpisanSedez-read	RazpisanSedez - branje	f
00030000-55fd-1a72-bfc1-e9042ace2e5e	RazpisanSedez-write	RazpisanSedez - spreminjanje	f
00030000-55fd-1a72-0986-574916eb4bdd	Rekviziterstvo-read	Rekviziterstvo - branje	f
00030000-55fd-1a72-48e2-3abc8e07433c	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	f
00030000-55fd-1a72-e164-7a15f5c3ab2e	Rekvizit-read	Rekvizit - branje	f
00030000-55fd-1a72-b7a1-51b0c432eae3	Rekvizit-write	Rekvizit - spreminjanje	f
00030000-55fd-1a72-1da9-ef254f6ab7f0	Revizija-read	Revizija - branje	f
00030000-55fd-1a72-16c3-1e39ec0c04e5	Revizija-write	Revizija - spreminjanje	f
00030000-55fd-1a72-9f7f-cf071fc1ad90	Rezervacija-read	Rezervacija - branje	f
00030000-55fd-1a72-5f61-0bf3c34bfbe1	Rezervacija-write	Rezervacija - spreminjanje	f
00030000-55fd-1a72-2c32-ea7b82b1cb76	SedezniRed-read	SedezniRed - branje	f
00030000-55fd-1a72-7abc-c603842e21ef	SedezniRed-write	SedezniRed - spreminjanje	f
00030000-55fd-1a72-c400-aaa8caf12cfb	Sedez-read	Sedez - branje	f
00030000-55fd-1a72-ae03-76a837a08e1b	Sedez-write	Sedez - spreminjanje	f
00030000-55fd-1a72-b961-1fa8b8ca0019	Sezona-read	Sezona - branje	f
00030000-55fd-1a72-6c4f-90ebcfa0a7e2	Sezona-write	Sezona - spreminjanje	f
00030000-55fd-1a72-86c2-72e6c5a44d57	StevilcenjeKonfig-read	StevilcenjeKonfig - branje	f
00030000-55fd-1a72-37d8-9b71acf393c8	StevilcenjeKonfig-write	StevilcenjeKonfig - spreminjanje	f
00030000-55fd-1a72-4c19-1e8f06e4386e	Stevilcenje-read	Stevilcenje - branje	f
00030000-55fd-1a72-9508-ab1817f7419d	Stevilcenje-write	Stevilcenje - spreminjanje	f
00030000-55fd-1a72-efb0-3c1c68eb2210	StevilcenjeStanje-read	StevilcenjeStanje - branje	f
00030000-55fd-1a72-ea0d-c30617cb2753	StevilcenjeStanje-write	StevilcenjeStanje - spreminjanje	f
00030000-55fd-1a72-6335-7cbd05763dee	StrosekUprizoritve-read	StrosekUprizoritve - branje	f
00030000-55fd-1a72-c7c5-8cbbf56b93c2	StrosekUprizoritve-write	StrosekUprizoritve - spreminjanje	f
00030000-55fd-1a72-d3cb-4d360896cb92	Telefonska-read	Telefonska - branje	f
00030000-55fd-1a72-52b6-9c54678f909c	Telefonska-write	Telefonska - spreminjanje	f
00030000-55fd-1a72-a21f-db8c943ba741	TerminStoritve-read	TerminStoritve - branje	f
00030000-55fd-1a72-4737-f627827732a2	TerminStoritve-write	TerminStoritve - spreminjanje	f
00030000-55fd-1a72-6635-a3045499d3a3	TipFunkcije-read	TipFunkcije - branje	f
00030000-55fd-1a72-e655-189a6d779a5c	TipFunkcije-write	TipFunkcije - spreminjanje	f
00030000-55fd-1a72-0c8a-0851db9b8ca1	TipProgramskeEnote-read	TipProgramskeEnote - branje	f
00030000-55fd-1a72-1c22-a3b996bbc72f	TipProgramskeEnote-write	TipProgramskeEnote - spreminjanje	f
00030000-55fd-1a72-57b9-6444a74261f4	Trr-read	Trr - branje	f
00030000-55fd-1a72-80b1-dd70bcfddf63	Trr-write	Trr - spreminjanje	f
00030000-55fd-1a72-7365-1e235ba9b9a6	Uprizoritev-read	Uprizoritev - branje	f
00030000-55fd-1a72-2278-26eb920c7f15	Uprizoritev-write	Uprizoritev - spreminjanje	f
00030000-55fd-1a72-47a0-b245cfaaebba	Vaja-read	Vaja - branje	f
00030000-55fd-1a72-cd18-f6f9f4f4c7a5	Vaja-write	Vaja - spreminjanje	f
00030000-55fd-1a72-ef20-ca6b749b66b6	VrstaSedezev-read	VrstaSedezev - branje	f
00030000-55fd-1a72-2607-6072301ac67a	VrstaSedezev-write	VrstaSedezev - spreminjanje	f
00030000-55fd-1a72-6eff-9cdd2ca09dd9	VrstaStroska-read	VrstaStroska - branje	f
00030000-55fd-1a72-a1bd-524d20845801	VrstaStroska-write	VrstaStroska - spreminjanje	f
00030000-55fd-1a72-d229-a39a21ba3ea1	Zaposlitev-read	Zaposlitev - branje	f
00030000-55fd-1a72-367d-17b54a750504	Zaposlitev-write	Zaposlitev - spreminjanje	f
00030000-55fd-1a72-6702-3e65166e50fb	Zasedenost-read	Zasedenost - branje	f
00030000-55fd-1a72-db0f-5dfda5c8cd9b	Zasedenost-write	Zasedenost - spreminjanje	f
00030000-55fd-1a72-f6ff-cc812b66f028	ZvrstSurs-read	ZvrstSurs - branje	f
00030000-55fd-1a72-654c-5f75ee1c0af2	ZvrstSurs-write	ZvrstSurs - spreminjanje	f
00030000-55fd-1a72-e984-27cef0e8e7a6	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	f
00030000-55fd-1a72-bb7a-2eeb8e1c5ddf	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	f
00030000-55fd-1a72-2aca-3ee1a4096092	Mapa-write	Mapa - osnovno dovoljenje za pisanje	f
00030000-55fd-1a72-379e-ad892b6ad627	Mapa-read	Mapa - osnovno dovoljenje za branje	f
00030000-55fd-1a72-e9ac-50d5e0ec1561	MapaAcl-write	MapaAcl - dovoljenje za dostop pisanje ACL-jev mape	f
00030000-55fd-1a72-e124-e12543b38d3f	MapaAcl-read	MapaAcl - dovoljenje za dostop branje ACL-jev mape	f
00030000-55fd-1a72-c98b-96e6bd8e3419	Zapis-write	Zapis - dovoljenje za pisanje zapisov	f
00030000-55fd-1a72-465b-da0915edcd20	Zapis-read	Zapis - dovoljenje za pisanje zapisov	f
00030000-55fd-1a72-6372-d3b82253fe11	ZapisLastnik-write	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	f
00030000-55fd-1a72-bca9-0a5c3722b1cc	ZapisLastnik-read	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	f
00030000-55fd-1a72-82c4-ce89be98cef1	VrstaZapisa-write	Šifrant vrst zapisa - spreminjanje	f
00030000-55fd-1a72-0825-bd08d2dcfe4c	VrstaZapisa-read	Šifrant vrst zapisa - branje	f
00030000-55fd-1a72-4074-b0097723084c	Datoteka-write	Datoteka - spreminjanje	f
00030000-55fd-1a72-16a4-95a3d14df40a	Datoteka-read	Datoteke - branje	f
\.


--
-- TOC entry 2944 (class 0 OID 20185990)
-- Dependencies: 180
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-55fd-1a72-c491-f6dc40e3e1b5	00030000-55fd-1a72-021b-cbf4b221731b
00020000-55fd-1a72-2749-477f335884fd	00030000-55fd-1a72-bd5b-500747c3c3de
00020000-55fd-1a72-68e3-48274ca07e91	00030000-55fd-1a72-fa90-3edf438373a8
00020000-55fd-1a72-68e3-48274ca07e91	00030000-55fd-1a72-404a-08c370db2d95
00020000-55fd-1a72-68e3-48274ca07e91	00030000-55fd-1a72-24ef-2e371530dff8
00020000-55fd-1a72-68e3-48274ca07e91	00030000-55fd-1a72-47ac-f43b6d4b278d
00020000-55fd-1a72-68e3-48274ca07e91	00030000-55fd-1a72-5c55-94c7b0ed5b94
00020000-55fd-1a72-68e3-48274ca07e91	00030000-55fd-1a72-b63a-f9ea4e982fe6
00020000-55fd-1a72-68e3-48274ca07e91	00030000-55fd-1a72-9475-a7d0d24d848d
00020000-55fd-1a72-68e3-48274ca07e91	00030000-55fd-1a72-b336-4aa77372b794
00020000-55fd-1a72-68e3-48274ca07e91	00030000-55fd-1a72-bd5b-500747c3c3de
00020000-55fd-1a72-68e3-48274ca07e91	00030000-55fd-1a72-7be4-4a8fe92f5eb5
00020000-55fd-1a72-68e3-48274ca07e91	00030000-55fd-1a72-f4e6-3594b28b363c
00020000-55fd-1a72-68e3-48274ca07e91	00030000-55fd-1a72-ef62-8623c6006cff
00020000-55fd-1a72-68e3-48274ca07e91	00030000-55fd-1a72-34e7-5b580f7f12e8
00020000-55fd-1a72-68e3-48274ca07e91	00030000-55fd-1a72-a06f-18ac2c83266a
00020000-55fd-1a72-68e3-48274ca07e91	00030000-55fd-1a72-dbd8-a7d55171ad47
00020000-55fd-1a72-68e3-48274ca07e91	00030000-55fd-1a72-a258-86a01d0b724b
00020000-55fd-1a72-68e3-48274ca07e91	00030000-55fd-1a72-7290-d925131061c7
00020000-55fd-1a72-68e3-48274ca07e91	00030000-55fd-1a72-86c6-83f7dd3213ec
00020000-55fd-1a72-68e3-48274ca07e91	00030000-55fd-1a72-3f6e-5d0caa553556
00020000-55fd-1a72-68e3-48274ca07e91	00030000-55fd-1a72-ba14-d9c2157ad112
00020000-55fd-1a72-68e3-48274ca07e91	00030000-55fd-1a72-e432-8bd54979ecc4
00020000-55fd-1a72-68e3-48274ca07e91	00030000-55fd-1a72-c33d-c1dec44c04cc
00020000-55fd-1a72-68e3-48274ca07e91	00030000-55fd-1a72-c6bd-21a59579ff83
00020000-55fd-1a72-68e3-48274ca07e91	00030000-55fd-1a72-a084-5185dff93729
00020000-55fd-1a72-68e3-48274ca07e91	00030000-55fd-1a72-50bd-ebe940c2c86b
00020000-55fd-1a72-68e3-48274ca07e91	00030000-55fd-1a72-0eee-1ee8abe63138
00020000-55fd-1a72-68e3-48274ca07e91	00030000-55fd-1a72-7dc3-2d2223977ee3
00020000-55fd-1a72-68e3-48274ca07e91	00030000-55fd-1a72-8fad-be1b737e33d1
00020000-55fd-1a72-68e3-48274ca07e91	00030000-55fd-1a72-4a9a-81ec0dc17a67
00020000-55fd-1a72-68e3-48274ca07e91	00030000-55fd-1a72-7541-d9e5f143b7e5
00020000-55fd-1a72-68e3-48274ca07e91	00030000-55fd-1a72-b4a0-f8ccec241e3d
00020000-55fd-1a72-68e3-48274ca07e91	00030000-55fd-1a72-9f7c-70f117a1703b
00020000-55fd-1a72-68e3-48274ca07e91	00030000-55fd-1a72-1403-8202e050005c
00020000-55fd-1a72-68e3-48274ca07e91	00030000-55fd-1a72-c9fa-70c3fc87dc0c
00020000-55fd-1a72-68e3-48274ca07e91	00030000-55fd-1a72-0986-574916eb4bdd
00020000-55fd-1a72-68e3-48274ca07e91	00030000-55fd-1a72-48e2-3abc8e07433c
00020000-55fd-1a72-68e3-48274ca07e91	00030000-55fd-1a72-e164-7a15f5c3ab2e
00020000-55fd-1a72-68e3-48274ca07e91	00030000-55fd-1a72-b7a1-51b0c432eae3
00020000-55fd-1a72-68e3-48274ca07e91	00030000-55fd-1a72-b961-1fa8b8ca0019
00020000-55fd-1a72-68e3-48274ca07e91	00030000-55fd-1a72-6c4f-90ebcfa0a7e2
00020000-55fd-1a72-68e3-48274ca07e91	00030000-55fd-1a72-6635-a3045499d3a3
00020000-55fd-1a72-68e3-48274ca07e91	00030000-55fd-1a72-7365-1e235ba9b9a6
00020000-55fd-1a72-68e3-48274ca07e91	00030000-55fd-1a72-2278-26eb920c7f15
00020000-55fd-1a72-68e3-48274ca07e91	00030000-55fd-1a72-47a0-b245cfaaebba
00020000-55fd-1a72-68e3-48274ca07e91	00030000-55fd-1a72-cd18-f6f9f4f4c7a5
00020000-55fd-1a72-68e3-48274ca07e91	00030000-55fd-1a72-6702-3e65166e50fb
00020000-55fd-1a72-68e3-48274ca07e91	00030000-55fd-1a72-db0f-5dfda5c8cd9b
00020000-55fd-1a72-68e3-48274ca07e91	00030000-55fd-1a72-f6ff-cc812b66f028
00020000-55fd-1a72-68e3-48274ca07e91	00030000-55fd-1a72-e984-27cef0e8e7a6
00020000-55fd-1a72-c306-a2d7ee5f878d	00030000-55fd-1a72-fa90-3edf438373a8
00020000-55fd-1a72-c306-a2d7ee5f878d	00030000-55fd-1a72-5c55-94c7b0ed5b94
00020000-55fd-1a72-c306-a2d7ee5f878d	00030000-55fd-1a72-b63a-f9ea4e982fe6
00020000-55fd-1a72-c306-a2d7ee5f878d	00030000-55fd-1a72-bd5b-500747c3c3de
00020000-55fd-1a72-c306-a2d7ee5f878d	00030000-55fd-1a72-34e7-5b580f7f12e8
00020000-55fd-1a72-c306-a2d7ee5f878d	00030000-55fd-1a72-dbd8-a7d55171ad47
00020000-55fd-1a72-c306-a2d7ee5f878d	00030000-55fd-1a72-7290-d925131061c7
00020000-55fd-1a72-c306-a2d7ee5f878d	00030000-55fd-1a72-86c6-83f7dd3213ec
00020000-55fd-1a72-c306-a2d7ee5f878d	00030000-55fd-1a72-3f6e-5d0caa553556
00020000-55fd-1a72-c306-a2d7ee5f878d	00030000-55fd-1a72-ba14-d9c2157ad112
00020000-55fd-1a72-c306-a2d7ee5f878d	00030000-55fd-1a72-e432-8bd54979ecc4
00020000-55fd-1a72-c306-a2d7ee5f878d	00030000-55fd-1a72-c33d-c1dec44c04cc
00020000-55fd-1a72-c306-a2d7ee5f878d	00030000-55fd-1a72-c6bd-21a59579ff83
00020000-55fd-1a72-c306-a2d7ee5f878d	00030000-55fd-1a72-50bd-ebe940c2c86b
00020000-55fd-1a72-c306-a2d7ee5f878d	00030000-55fd-1a72-7dc3-2d2223977ee3
00020000-55fd-1a72-c306-a2d7ee5f878d	00030000-55fd-1a72-8fad-be1b737e33d1
00020000-55fd-1a72-c306-a2d7ee5f878d	00030000-55fd-1a72-4a9a-81ec0dc17a67
00020000-55fd-1a72-c306-a2d7ee5f878d	00030000-55fd-1a72-1403-8202e050005c
00020000-55fd-1a72-c306-a2d7ee5f878d	00030000-55fd-1a72-0986-574916eb4bdd
00020000-55fd-1a72-c306-a2d7ee5f878d	00030000-55fd-1a72-e164-7a15f5c3ab2e
00020000-55fd-1a72-c306-a2d7ee5f878d	00030000-55fd-1a72-b961-1fa8b8ca0019
00020000-55fd-1a72-c306-a2d7ee5f878d	00030000-55fd-1a72-d3cb-4d360896cb92
00020000-55fd-1a72-c306-a2d7ee5f878d	00030000-55fd-1a72-52b6-9c54678f909c
00020000-55fd-1a72-c306-a2d7ee5f878d	00030000-55fd-1a72-57b9-6444a74261f4
00020000-55fd-1a72-c306-a2d7ee5f878d	00030000-55fd-1a72-80b1-dd70bcfddf63
00020000-55fd-1a72-c306-a2d7ee5f878d	00030000-55fd-1a72-d229-a39a21ba3ea1
00020000-55fd-1a72-c306-a2d7ee5f878d	00030000-55fd-1a72-367d-17b54a750504
00020000-55fd-1a72-c306-a2d7ee5f878d	00030000-55fd-1a72-f6ff-cc812b66f028
00020000-55fd-1a72-c306-a2d7ee5f878d	00030000-55fd-1a72-e984-27cef0e8e7a6
00020000-55fd-1a73-a809-70d0489d1fec	00030000-55fd-1a72-fa90-3edf438373a8
00020000-55fd-1a73-a809-70d0489d1fec	00030000-55fd-1a72-24ef-2e371530dff8
00020000-55fd-1a73-a809-70d0489d1fec	00030000-55fd-1a72-5c55-94c7b0ed5b94
00020000-55fd-1a73-a809-70d0489d1fec	00030000-55fd-1a72-744c-2b6e1b51d28d
00020000-55fd-1a73-a809-70d0489d1fec	00030000-55fd-1a72-def7-8fa2af1ad950
00020000-55fd-1a73-a809-70d0489d1fec	00030000-55fd-1a72-5d4d-96149df14eb9
00020000-55fd-1a73-a809-70d0489d1fec	00030000-55fd-1a72-b63a-f9ea4e982fe6
00020000-55fd-1a73-a809-70d0489d1fec	00030000-55fd-1a72-bd5b-500747c3c3de
00020000-55fd-1a73-a809-70d0489d1fec	00030000-55fd-1a72-f4e6-3594b28b363c
00020000-55fd-1a73-a809-70d0489d1fec	00030000-55fd-1a72-34e7-5b580f7f12e8
00020000-55fd-1a73-a809-70d0489d1fec	00030000-55fd-1a72-dbd8-a7d55171ad47
00020000-55fd-1a73-a809-70d0489d1fec	00030000-55fd-1a72-7290-d925131061c7
00020000-55fd-1a73-a809-70d0489d1fec	00030000-55fd-1a72-3f6e-5d0caa553556
00020000-55fd-1a73-a809-70d0489d1fec	00030000-55fd-1a72-ba14-d9c2157ad112
00020000-55fd-1a73-a809-70d0489d1fec	00030000-55fd-1a72-e432-8bd54979ecc4
00020000-55fd-1a73-a809-70d0489d1fec	00030000-55fd-1a72-c6bd-21a59579ff83
00020000-55fd-1a73-a809-70d0489d1fec	00030000-55fd-1a72-50bd-ebe940c2c86b
00020000-55fd-1a73-a809-70d0489d1fec	00030000-55fd-1a72-4a9a-81ec0dc17a67
00020000-55fd-1a73-a809-70d0489d1fec	00030000-55fd-1a72-b4a0-f8ccec241e3d
00020000-55fd-1a73-a809-70d0489d1fec	00030000-55fd-1a72-1403-8202e050005c
00020000-55fd-1a73-a809-70d0489d1fec	00030000-55fd-1a72-0986-574916eb4bdd
00020000-55fd-1a73-a809-70d0489d1fec	00030000-55fd-1a72-e164-7a15f5c3ab2e
00020000-55fd-1a73-a809-70d0489d1fec	00030000-55fd-1a72-b961-1fa8b8ca0019
00020000-55fd-1a73-a809-70d0489d1fec	00030000-55fd-1a72-6635-a3045499d3a3
00020000-55fd-1a73-a809-70d0489d1fec	00030000-55fd-1a72-47a0-b245cfaaebba
00020000-55fd-1a73-a809-70d0489d1fec	00030000-55fd-1a72-6702-3e65166e50fb
00020000-55fd-1a73-a809-70d0489d1fec	00030000-55fd-1a72-f6ff-cc812b66f028
00020000-55fd-1a73-a809-70d0489d1fec	00030000-55fd-1a72-e984-27cef0e8e7a6
00020000-55fd-1a73-c964-8951b39fa1db	00030000-55fd-1a72-fa90-3edf438373a8
00020000-55fd-1a73-c964-8951b39fa1db	00030000-55fd-1a72-404a-08c370db2d95
00020000-55fd-1a73-c964-8951b39fa1db	00030000-55fd-1a72-47ac-f43b6d4b278d
00020000-55fd-1a73-c964-8951b39fa1db	00030000-55fd-1a72-5c55-94c7b0ed5b94
00020000-55fd-1a73-c964-8951b39fa1db	00030000-55fd-1a72-b63a-f9ea4e982fe6
00020000-55fd-1a73-c964-8951b39fa1db	00030000-55fd-1a72-bd5b-500747c3c3de
00020000-55fd-1a73-c964-8951b39fa1db	00030000-55fd-1a72-34e7-5b580f7f12e8
00020000-55fd-1a73-c964-8951b39fa1db	00030000-55fd-1a72-dbd8-a7d55171ad47
00020000-55fd-1a73-c964-8951b39fa1db	00030000-55fd-1a72-3f6e-5d0caa553556
00020000-55fd-1a73-c964-8951b39fa1db	00030000-55fd-1a72-ba14-d9c2157ad112
00020000-55fd-1a73-c964-8951b39fa1db	00030000-55fd-1a72-c6bd-21a59579ff83
00020000-55fd-1a73-c964-8951b39fa1db	00030000-55fd-1a72-50bd-ebe940c2c86b
00020000-55fd-1a73-c964-8951b39fa1db	00030000-55fd-1a72-4a9a-81ec0dc17a67
00020000-55fd-1a73-c964-8951b39fa1db	00030000-55fd-1a72-1403-8202e050005c
00020000-55fd-1a73-c964-8951b39fa1db	00030000-55fd-1a72-0986-574916eb4bdd
00020000-55fd-1a73-c964-8951b39fa1db	00030000-55fd-1a72-e164-7a15f5c3ab2e
00020000-55fd-1a73-c964-8951b39fa1db	00030000-55fd-1a72-b961-1fa8b8ca0019
00020000-55fd-1a73-c964-8951b39fa1db	00030000-55fd-1a72-6635-a3045499d3a3
00020000-55fd-1a73-c964-8951b39fa1db	00030000-55fd-1a72-f6ff-cc812b66f028
00020000-55fd-1a73-c964-8951b39fa1db	00030000-55fd-1a72-e984-27cef0e8e7a6
00020000-55fd-1a73-00c8-6a5f9bc9ec1a	00030000-55fd-1a72-fa90-3edf438373a8
00020000-55fd-1a73-00c8-6a5f9bc9ec1a	00030000-55fd-1a72-5c55-94c7b0ed5b94
00020000-55fd-1a73-00c8-6a5f9bc9ec1a	00030000-55fd-1a72-b63a-f9ea4e982fe6
00020000-55fd-1a73-00c8-6a5f9bc9ec1a	00030000-55fd-1a72-bd5b-500747c3c3de
00020000-55fd-1a73-00c8-6a5f9bc9ec1a	00030000-55fd-1a72-34e7-5b580f7f12e8
00020000-55fd-1a73-00c8-6a5f9bc9ec1a	00030000-55fd-1a72-dbd8-a7d55171ad47
00020000-55fd-1a73-00c8-6a5f9bc9ec1a	00030000-55fd-1a72-3f6e-5d0caa553556
00020000-55fd-1a73-00c8-6a5f9bc9ec1a	00030000-55fd-1a72-ba14-d9c2157ad112
00020000-55fd-1a73-00c8-6a5f9bc9ec1a	00030000-55fd-1a72-c6bd-21a59579ff83
00020000-55fd-1a73-00c8-6a5f9bc9ec1a	00030000-55fd-1a72-50bd-ebe940c2c86b
00020000-55fd-1a73-00c8-6a5f9bc9ec1a	00030000-55fd-1a72-4a9a-81ec0dc17a67
00020000-55fd-1a73-00c8-6a5f9bc9ec1a	00030000-55fd-1a72-1403-8202e050005c
00020000-55fd-1a73-00c8-6a5f9bc9ec1a	00030000-55fd-1a72-0986-574916eb4bdd
00020000-55fd-1a73-00c8-6a5f9bc9ec1a	00030000-55fd-1a72-e164-7a15f5c3ab2e
00020000-55fd-1a73-00c8-6a5f9bc9ec1a	00030000-55fd-1a72-b961-1fa8b8ca0019
00020000-55fd-1a73-00c8-6a5f9bc9ec1a	00030000-55fd-1a72-a21f-db8c943ba741
00020000-55fd-1a73-00c8-6a5f9bc9ec1a	00030000-55fd-1a72-15dd-e845db1c530e
00020000-55fd-1a73-00c8-6a5f9bc9ec1a	00030000-55fd-1a72-6635-a3045499d3a3
00020000-55fd-1a73-00c8-6a5f9bc9ec1a	00030000-55fd-1a72-f6ff-cc812b66f028
00020000-55fd-1a73-00c8-6a5f9bc9ec1a	00030000-55fd-1a72-e984-27cef0e8e7a6
00020000-55fd-1a74-7804-f337ae921da8	00030000-55fd-1a72-d27e-6ab7bb73e503
00020000-55fd-1a74-7804-f337ae921da8	00030000-55fd-1a72-021b-cbf4b221731b
00020000-55fd-1a74-7804-f337ae921da8	00030000-55fd-1a72-15dd-e845db1c530e
00020000-55fd-1a74-7804-f337ae921da8	00030000-55fd-1a72-9475-a7d0d24d848d
00020000-55fd-1a74-7804-f337ae921da8	00030000-55fd-1a72-a9bd-97917e4060e8
00020000-55fd-1a74-7804-f337ae921da8	00030000-55fd-1a72-dcf1-9606343fa881
00020000-55fd-1a74-7804-f337ae921da8	00030000-55fd-1a72-8222-2cbe39f889c2
00020000-55fd-1a74-7804-f337ae921da8	00030000-55fd-1a72-fa90-3edf438373a8
00020000-55fd-1a74-7804-f337ae921da8	00030000-55fd-1a72-404a-08c370db2d95
00020000-55fd-1a74-7804-f337ae921da8	00030000-55fd-1a72-24ef-2e371530dff8
00020000-55fd-1a74-7804-f337ae921da8	00030000-55fd-1a72-47ac-f43b6d4b278d
00020000-55fd-1a74-7804-f337ae921da8	00030000-55fd-1a72-5c55-94c7b0ed5b94
00020000-55fd-1a74-7804-f337ae921da8	00030000-55fd-1a72-744c-2b6e1b51d28d
00020000-55fd-1a74-7804-f337ae921da8	00030000-55fd-1a72-def7-8fa2af1ad950
00020000-55fd-1a74-7804-f337ae921da8	00030000-55fd-1a72-0ab4-e26de3b09365
00020000-55fd-1a74-7804-f337ae921da8	00030000-55fd-1a72-5d4d-96149df14eb9
00020000-55fd-1a74-7804-f337ae921da8	00030000-55fd-1a72-12de-2ad28e1901be
00020000-55fd-1a74-7804-f337ae921da8	00030000-55fd-1a72-b63a-f9ea4e982fe6
00020000-55fd-1a74-7804-f337ae921da8	00030000-55fd-1a72-b336-4aa77372b794
00020000-55fd-1a74-7804-f337ae921da8	00030000-55fd-1a72-bd5b-500747c3c3de
00020000-55fd-1a74-7804-f337ae921da8	00030000-55fd-1a72-7be4-4a8fe92f5eb5
00020000-55fd-1a74-7804-f337ae921da8	00030000-55fd-1a72-c35f-7b4d4ea403b0
00020000-55fd-1a74-7804-f337ae921da8	00030000-55fd-1a72-81d7-7b32bf4c3ed6
00020000-55fd-1a74-7804-f337ae921da8	00030000-55fd-1a72-46ab-14c9bc0d1f44
00020000-55fd-1a74-7804-f337ae921da8	00030000-55fd-1a72-02c8-c6076ad7d471
00020000-55fd-1a74-7804-f337ae921da8	00030000-55fd-1a72-f4e6-3594b28b363c
00020000-55fd-1a74-7804-f337ae921da8	00030000-55fd-1a72-ef62-8623c6006cff
00020000-55fd-1a74-7804-f337ae921da8	00030000-55fd-1a72-34e7-5b580f7f12e8
00020000-55fd-1a74-7804-f337ae921da8	00030000-55fd-1a72-a06f-18ac2c83266a
00020000-55fd-1a74-7804-f337ae921da8	00030000-55fd-1a72-dbd8-a7d55171ad47
00020000-55fd-1a74-7804-f337ae921da8	00030000-55fd-1a72-a258-86a01d0b724b
00020000-55fd-1a74-7804-f337ae921da8	00030000-55fd-1a72-7290-d925131061c7
00020000-55fd-1a74-7804-f337ae921da8	00030000-55fd-1a72-86c6-83f7dd3213ec
00020000-55fd-1a74-7804-f337ae921da8	00030000-55fd-1a72-3a26-27874cbed71b
00020000-55fd-1a74-7804-f337ae921da8	00030000-55fd-1a72-70bd-49f64c740151
00020000-55fd-1a74-7804-f337ae921da8	00030000-55fd-1a72-ac05-16313c413c2b
00020000-55fd-1a74-7804-f337ae921da8	00030000-55fd-1a72-4216-f1921d594262
00020000-55fd-1a74-7804-f337ae921da8	00030000-55fd-1a72-3f6e-5d0caa553556
00020000-55fd-1a74-7804-f337ae921da8	00030000-55fd-1a72-8410-566f28822c46
00020000-55fd-1a74-7804-f337ae921da8	00030000-55fd-1a72-ba14-d9c2157ad112
00020000-55fd-1a74-7804-f337ae921da8	00030000-55fd-1a72-fe2b-f2989abcb310
00020000-55fd-1a74-7804-f337ae921da8	00030000-55fd-1a72-e432-8bd54979ecc4
00020000-55fd-1a74-7804-f337ae921da8	00030000-55fd-1a72-c33d-c1dec44c04cc
00020000-55fd-1a74-7804-f337ae921da8	00030000-55fd-1a72-f11c-f7e1de0b2622
00020000-55fd-1a74-7804-f337ae921da8	00030000-55fd-1a72-f69a-f34b6c0cf0fe
00020000-55fd-1a74-7804-f337ae921da8	00030000-55fd-1a72-1d9a-709efbd58d20
00020000-55fd-1a74-7804-f337ae921da8	00030000-55fd-1a72-88f4-51c8d58f2058
00020000-55fd-1a74-7804-f337ae921da8	00030000-55fd-1a72-a7c0-9d48f7596702
00020000-55fd-1a74-7804-f337ae921da8	00030000-55fd-1a72-6d7e-cccb33330e36
00020000-55fd-1a74-7804-f337ae921da8	00030000-55fd-1a72-c6bd-21a59579ff83
00020000-55fd-1a74-7804-f337ae921da8	00030000-55fd-1a72-a084-5185dff93729
00020000-55fd-1a74-7804-f337ae921da8	00030000-55fd-1a72-50bd-ebe940c2c86b
00020000-55fd-1a74-7804-f337ae921da8	00030000-55fd-1a72-0eee-1ee8abe63138
00020000-55fd-1a74-7804-f337ae921da8	00030000-55fd-1a72-9cad-062e254ee618
00020000-55fd-1a74-7804-f337ae921da8	00030000-55fd-1a72-e8ad-06b7b35825ee
00020000-55fd-1a74-7804-f337ae921da8	00030000-55fd-1a72-cad1-e4983834cd52
00020000-55fd-1a74-7804-f337ae921da8	00030000-55fd-1a72-bade-f69d477691fb
00020000-55fd-1a74-7804-f337ae921da8	00030000-55fd-1a72-7dc3-2d2223977ee3
00020000-55fd-1a74-7804-f337ae921da8	00030000-55fd-1a72-8fad-be1b737e33d1
00020000-55fd-1a74-7804-f337ae921da8	00030000-55fd-1a72-4a9a-81ec0dc17a67
00020000-55fd-1a74-7804-f337ae921da8	00030000-55fd-1a72-7541-d9e5f143b7e5
00020000-55fd-1a74-7804-f337ae921da8	00030000-55fd-1a72-116d-e09d6dd5aef0
00020000-55fd-1a74-7804-f337ae921da8	00030000-55fd-1a72-8419-becf12f6b3cd
00020000-55fd-1a74-7804-f337ae921da8	00030000-55fd-1a72-f49e-9c10200ce9ef
00020000-55fd-1a74-7804-f337ae921da8	00030000-55fd-1a72-1bdc-2f314bf198b8
00020000-55fd-1a74-7804-f337ae921da8	00030000-55fd-1a72-b4a0-f8ccec241e3d
00020000-55fd-1a74-7804-f337ae921da8	00030000-55fd-1a72-9f7c-70f117a1703b
00020000-55fd-1a74-7804-f337ae921da8	00030000-55fd-1a72-ad41-a7a28119f963
00020000-55fd-1a74-7804-f337ae921da8	00030000-55fd-1a72-c3b7-fbf5e7bd5b43
00020000-55fd-1a74-7804-f337ae921da8	00030000-55fd-1a72-c279-75048a7b380a
00020000-55fd-1a74-7804-f337ae921da8	00030000-55fd-1a72-2361-1a80c07226f3
00020000-55fd-1a74-7804-f337ae921da8	00030000-55fd-1a72-fa82-bbb786f810bb
00020000-55fd-1a74-7804-f337ae921da8	00030000-55fd-1a72-1494-636f87888f14
00020000-55fd-1a74-7804-f337ae921da8	00030000-55fd-1a72-c65d-016d2c92d9b2
00020000-55fd-1a74-7804-f337ae921da8	00030000-55fd-1a72-840b-fed920da1776
00020000-55fd-1a74-7804-f337ae921da8	00030000-55fd-1a72-719d-face55cf0344
00020000-55fd-1a74-7804-f337ae921da8	00030000-55fd-1a72-93b6-8c59645f8d5b
00020000-55fd-1a74-7804-f337ae921da8	00030000-55fd-1a72-1e15-dcf98ddf45c8
00020000-55fd-1a74-7804-f337ae921da8	00030000-55fd-1a72-24d5-c9f0ce90f041
00020000-55fd-1a74-7804-f337ae921da8	00030000-55fd-1a72-2843-f7d499c5e997
00020000-55fd-1a74-7804-f337ae921da8	00030000-55fd-1a72-6490-c92d969a288d
00020000-55fd-1a74-7804-f337ae921da8	00030000-55fd-1a72-a7d2-03d6979ffc4e
00020000-55fd-1a74-7804-f337ae921da8	00030000-55fd-1a72-7419-62299fb18eca
00020000-55fd-1a74-7804-f337ae921da8	00030000-55fd-1a72-8894-ebdeeba90417
00020000-55fd-1a74-7804-f337ae921da8	00030000-55fd-1a72-4e2c-6df54a27b79a
00020000-55fd-1a74-7804-f337ae921da8	00030000-55fd-1a72-cd6d-ffe56fc606e4
00020000-55fd-1a74-7804-f337ae921da8	00030000-55fd-1a72-02b0-bbea22be1e70
00020000-55fd-1a74-7804-f337ae921da8	00030000-55fd-1a72-1403-8202e050005c
00020000-55fd-1a74-7804-f337ae921da8	00030000-55fd-1a72-c9fa-70c3fc87dc0c
00020000-55fd-1a74-7804-f337ae921da8	00030000-55fd-1a72-8748-baef69b9344f
00020000-55fd-1a74-7804-f337ae921da8	00030000-55fd-1a72-71be-c8c45d8bf8ff
00020000-55fd-1a74-7804-f337ae921da8	00030000-55fd-1a72-5973-5248e1d6fac1
00020000-55fd-1a74-7804-f337ae921da8	00030000-55fd-1a72-bfc1-e9042ace2e5e
00020000-55fd-1a74-7804-f337ae921da8	00030000-55fd-1a72-0986-574916eb4bdd
00020000-55fd-1a74-7804-f337ae921da8	00030000-55fd-1a72-48e2-3abc8e07433c
00020000-55fd-1a74-7804-f337ae921da8	00030000-55fd-1a72-e164-7a15f5c3ab2e
00020000-55fd-1a74-7804-f337ae921da8	00030000-55fd-1a72-b7a1-51b0c432eae3
00020000-55fd-1a74-7804-f337ae921da8	00030000-55fd-1a72-1da9-ef254f6ab7f0
00020000-55fd-1a74-7804-f337ae921da8	00030000-55fd-1a72-16c3-1e39ec0c04e5
00020000-55fd-1a74-7804-f337ae921da8	00030000-55fd-1a72-9f7f-cf071fc1ad90
00020000-55fd-1a74-7804-f337ae921da8	00030000-55fd-1a72-5f61-0bf3c34bfbe1
00020000-55fd-1a74-7804-f337ae921da8	00030000-55fd-1a72-2c32-ea7b82b1cb76
00020000-55fd-1a74-7804-f337ae921da8	00030000-55fd-1a72-7abc-c603842e21ef
00020000-55fd-1a74-7804-f337ae921da8	00030000-55fd-1a72-c400-aaa8caf12cfb
00020000-55fd-1a74-7804-f337ae921da8	00030000-55fd-1a72-ae03-76a837a08e1b
00020000-55fd-1a74-7804-f337ae921da8	00030000-55fd-1a72-b961-1fa8b8ca0019
00020000-55fd-1a74-7804-f337ae921da8	00030000-55fd-1a72-6c4f-90ebcfa0a7e2
00020000-55fd-1a74-7804-f337ae921da8	00030000-55fd-1a72-86c2-72e6c5a44d57
00020000-55fd-1a74-7804-f337ae921da8	00030000-55fd-1a72-37d8-9b71acf393c8
00020000-55fd-1a74-7804-f337ae921da8	00030000-55fd-1a72-4c19-1e8f06e4386e
00020000-55fd-1a74-7804-f337ae921da8	00030000-55fd-1a72-9508-ab1817f7419d
00020000-55fd-1a74-7804-f337ae921da8	00030000-55fd-1a72-efb0-3c1c68eb2210
00020000-55fd-1a74-7804-f337ae921da8	00030000-55fd-1a72-ea0d-c30617cb2753
00020000-55fd-1a74-7804-f337ae921da8	00030000-55fd-1a72-6335-7cbd05763dee
00020000-55fd-1a74-7804-f337ae921da8	00030000-55fd-1a72-c7c5-8cbbf56b93c2
00020000-55fd-1a74-7804-f337ae921da8	00030000-55fd-1a72-d3cb-4d360896cb92
00020000-55fd-1a74-7804-f337ae921da8	00030000-55fd-1a72-52b6-9c54678f909c
00020000-55fd-1a74-7804-f337ae921da8	00030000-55fd-1a72-a21f-db8c943ba741
00020000-55fd-1a74-7804-f337ae921da8	00030000-55fd-1a72-4737-f627827732a2
00020000-55fd-1a74-7804-f337ae921da8	00030000-55fd-1a72-6635-a3045499d3a3
00020000-55fd-1a74-7804-f337ae921da8	00030000-55fd-1a72-e655-189a6d779a5c
00020000-55fd-1a74-7804-f337ae921da8	00030000-55fd-1a72-0c8a-0851db9b8ca1
00020000-55fd-1a74-7804-f337ae921da8	00030000-55fd-1a72-1c22-a3b996bbc72f
00020000-55fd-1a74-7804-f337ae921da8	00030000-55fd-1a72-57b9-6444a74261f4
00020000-55fd-1a74-7804-f337ae921da8	00030000-55fd-1a72-80b1-dd70bcfddf63
00020000-55fd-1a74-7804-f337ae921da8	00030000-55fd-1a72-7365-1e235ba9b9a6
00020000-55fd-1a74-7804-f337ae921da8	00030000-55fd-1a72-2278-26eb920c7f15
00020000-55fd-1a74-7804-f337ae921da8	00030000-55fd-1a72-47a0-b245cfaaebba
00020000-55fd-1a74-7804-f337ae921da8	00030000-55fd-1a72-cd18-f6f9f4f4c7a5
00020000-55fd-1a74-7804-f337ae921da8	00030000-55fd-1a72-ef20-ca6b749b66b6
00020000-55fd-1a74-7804-f337ae921da8	00030000-55fd-1a72-2607-6072301ac67a
00020000-55fd-1a74-7804-f337ae921da8	00030000-55fd-1a72-6eff-9cdd2ca09dd9
00020000-55fd-1a74-7804-f337ae921da8	00030000-55fd-1a72-a1bd-524d20845801
00020000-55fd-1a74-7804-f337ae921da8	00030000-55fd-1a72-d229-a39a21ba3ea1
00020000-55fd-1a74-7804-f337ae921da8	00030000-55fd-1a72-367d-17b54a750504
00020000-55fd-1a74-7804-f337ae921da8	00030000-55fd-1a72-6702-3e65166e50fb
00020000-55fd-1a74-7804-f337ae921da8	00030000-55fd-1a72-db0f-5dfda5c8cd9b
00020000-55fd-1a74-7804-f337ae921da8	00030000-55fd-1a72-f6ff-cc812b66f028
00020000-55fd-1a74-7804-f337ae921da8	00030000-55fd-1a72-654c-5f75ee1c0af2
00020000-55fd-1a74-7804-f337ae921da8	00030000-55fd-1a72-e984-27cef0e8e7a6
00020000-55fd-1a74-7804-f337ae921da8	00030000-55fd-1a72-bb7a-2eeb8e1c5ddf
\.


--
-- TOC entry 2971 (class 0 OID 20186289)
-- Dependencies: 207
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 2975 (class 0 OID 20186323)
-- Dependencies: 211
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 2987 (class 0 OID 20186457)
-- Dependencies: 223
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, zacetek, konec, jeavtorskepravice, placilonavajo, vrednostvaje, planiranostevilovaj, vrednostvaj, vrednostpredstave, vrednostdopremiere, aktivna, zaposlenvdrjz, samozaposlen, igralec, opis) FROM stdin;
000b0000-55fd-1a74-2b7a-e352f800ced6	00090000-55fd-1a74-e2b9-bb2ea155c991	\N	\N	0001	\N	\N	f	f	10.00	3	10.00	30.00	10.00	t	t	f	t	Pogodba o sodelovanju
000b0000-55fd-1a74-cab4-63241003bc74	00090000-55fd-1a74-058b-baa9aef68685	\N	\N	0002	\N	\N	f	t	11.00	10	11.00	31.00	110.00	t	f	t	t	Pogodba za vlogo Helena
000b0000-55fd-1a74-8594-a5f9d983fee7	00090000-55fd-1a74-756b-5382b344ff86	\N	\N	0003	\N	\N	f	f	12.00	4	12.00	32.00	12.00	t	f	t	f	Pogodba za lektoriranje
000b0000-55fd-1a74-b1ae-1f5dc1a5c0fc	00090000-55fd-1a74-b958-9b09e173e528	\N	\N	0004	\N	\N	t	f	0.00	2	300.00	30.00	300.00	t	f	t	f	Pogodba za avtorske pravice
\.


--
-- TOC entry 2949 (class 0 OID 20186050)
-- Dependencies: 185
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, drzava_id, sifra, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo, nvo) FROM stdin;
00080000-55fd-1a74-41eb-55abd57905f2	00040000-55fd-1a72-aab1-4ea07023de65	0988	AK	Juhuhu d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55fd-1a74-b4c9-941cbf725a23	00040000-55fd-1a72-aab1-4ea07023de65	0989	AK	Hopsasa d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	t
00080000-55fd-1a74-8696-62d2b0a64f3d	00040000-55fd-1a72-aab1-4ea07023de65	0987	AK	Gledališče Šrum d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55fd-1a74-daba-003b7bdf1bb5	00040000-55fd-1a72-aab1-4ea07023de65	0986	AK	Lutkovni Direndaj d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55fd-1a74-b5b9-3a27bf1f0949	00040000-55fd-1a72-aab1-4ea07023de65	0985	AK	Tatjana Stanič, Lektoriranje, s.p.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55fd-1a74-187e-a40343a12751	00040000-55fd-1a72-48ad-ff33b1633928	0984	AK	Gledališče Lepote tvoje		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55fd-1a74-c283-9cf850e6311c	00040000-55fd-1a72-0153-3663178107bb	0983	AK	Sunce naše		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55fd-1a74-986b-7f4822cd286c	00040000-55fd-1a72-6c39-a94617f3e8e3	0982	AK	Theater Amadeus		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55fd-1a74-563b-b5758bb23a54	00040000-55fd-1a72-aca7-6828c79dd5d5	9999	AK	Fuchs		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55fd-1a75-a2ba-a57b4638b161	00040000-55fd-1a72-aab1-4ea07023de65	1001	AK	Gledališče Matica		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
\.


--
-- TOC entry 2951 (class 0 OID 20186084)
-- Dependencies: 187
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-55fd-1a72-e9f0-90d6450d5894	8341	Adlešiči
00050000-55fd-1a72-9102-2b534cb7ad7d	5270	Ajdovščina
00050000-55fd-1a72-83fa-42daba36a343	6280	Ankaran/Ancarano
00050000-55fd-1a72-2ec7-8f748a9255d3	9253	Apače
00050000-55fd-1a72-6d8a-7f48cceb8b29	8253	Artiče
00050000-55fd-1a72-6256-e8dab77763a0	4275	Begunje na Gorenjskem
00050000-55fd-1a72-02a4-d36acc4516bc	1382	Begunje pri Cerknici
00050000-55fd-1a72-42eb-1ee6fd617274	9231	Beltinci
00050000-55fd-1a72-77b6-bb162b10d05f	2234	Benedikt
00050000-55fd-1a72-6cf5-0e43a1fd5450	2345	Bistrica ob Dravi
00050000-55fd-1a72-15a8-4dcda5838e64	3256	Bistrica ob Sotli
00050000-55fd-1a72-e73f-0c101320f23a	8259	Bizeljsko
00050000-55fd-1a72-b2eb-8e8b11a071c7	1223	Blagovica
00050000-55fd-1a72-743d-c27155ef1eaa	8283	Blanca
00050000-55fd-1a72-1ba2-76e1c012b2d3	4260	Bled
00050000-55fd-1a72-3aec-4d20fc4a324d	4273	Blejska Dobrava
00050000-55fd-1a72-8336-6b1e285ad2d6	9265	Bodonci
00050000-55fd-1a72-1b91-17c311d5876e	9222	Bogojina
00050000-55fd-1a72-3c6f-4a4766b9e84d	4263	Bohinjska Bela
00050000-55fd-1a72-aba8-2a1ec8dfe479	4264	Bohinjska Bistrica
00050000-55fd-1a72-03b7-3c3aa2a2b173	4265	Bohinjsko jezero
00050000-55fd-1a72-41c4-f13c26a1c3e3	1353	Borovnica
00050000-55fd-1a72-ed8b-94be0945309b	8294	Boštanj
00050000-55fd-1a72-c826-157aed99e1d8	5230	Bovec
00050000-55fd-1a72-228c-a8fec3c473b3	5295	Branik
00050000-55fd-1a72-2af4-e8f22c916f69	3314	Braslovče
00050000-55fd-1a72-8389-ada0e802ed54	5223	Breginj
00050000-55fd-1a72-6f60-2bbc4f0f5cdd	8280	Brestanica
00050000-55fd-1a72-b2c3-4e5f137cba08	2354	Bresternica
00050000-55fd-1a72-fc46-b3244e573c2b	4243	Brezje
00050000-55fd-1a72-9406-1116aadb4307	1351	Brezovica pri Ljubljani
00050000-55fd-1a72-0ba2-33d862185357	8250	Brežice
00050000-55fd-1a72-fa97-f61fcd7533af	4210	Brnik - Aerodrom
00050000-55fd-1a72-80f3-0d43a4ebc2b8	8321	Brusnice
00050000-55fd-1a72-b495-8255b54a91cd	3255	Buče
00050000-55fd-1a72-c477-8d42a7a73581	8276	Bučka 
00050000-55fd-1a72-c493-406701bde260	9261	Cankova
00050000-55fd-1a72-ed4a-79a0b16e40c0	3000	Celje 
00050000-55fd-1a72-6ee0-dc8468c30f14	3001	Celje - poštni predali
00050000-55fd-1a72-e49e-1c44557c4975	4207	Cerklje na Gorenjskem
00050000-55fd-1a72-ecf2-fa7f56fa5a88	8263	Cerklje ob Krki
00050000-55fd-1a72-6088-61719dc9411d	1380	Cerknica
00050000-55fd-1a72-8893-153367772bd2	5282	Cerkno
00050000-55fd-1a72-dbe2-e32bc414a13b	2236	Cerkvenjak
00050000-55fd-1a72-7214-ccdbb1ea2661	2215	Ceršak
00050000-55fd-1a72-eb17-2632b55a1200	2326	Cirkovce
00050000-55fd-1a72-85eb-a63e52acd70e	2282	Cirkulane
00050000-55fd-1a72-71cf-927f95f19787	5273	Col
00050000-55fd-1a72-1fb6-6e30045e3ee9	8251	Čatež ob Savi
00050000-55fd-1a72-4e1e-4a72a1b28fc0	1413	Čemšenik
00050000-55fd-1a72-0581-0883e39b0714	5253	Čepovan
00050000-55fd-1a72-f53b-3849d9a2ef41	9232	Črenšovci
00050000-55fd-1a72-2c6f-4fa46d24fb75	2393	Črna na Koroškem
00050000-55fd-1a72-531e-dd1a6f977122	6275	Črni Kal
00050000-55fd-1a72-26c5-ab04dfd988b1	5274	Črni Vrh nad Idrijo
00050000-55fd-1a72-f440-dc9f0f8fe51d	5262	Črniče
00050000-55fd-1a72-fc94-2d0541281230	8340	Črnomelj
00050000-55fd-1a72-5e81-d73c5511872c	6271	Dekani
00050000-55fd-1a72-8f02-feab046fb630	5210	Deskle
00050000-55fd-1a72-662b-6747a75eef02	2253	Destrnik
00050000-55fd-1a72-c64e-967db937400c	6215	Divača
00050000-55fd-1a72-8c70-846dc7f6ace8	1233	Dob
00050000-55fd-1a72-b338-d84e218888b4	3224	Dobje pri Planini
00050000-55fd-1a72-8e46-5c5b187fb65a	8257	Dobova
00050000-55fd-1a72-4838-0ee40b6c31df	1423	Dobovec
00050000-55fd-1a72-3d48-42174e7ed453	5263	Dobravlje
00050000-55fd-1a72-18ea-7dce75090900	3204	Dobrna
00050000-55fd-1a72-422a-54f4c87719d7	8211	Dobrnič
00050000-55fd-1a72-500d-a8844c177b5c	1356	Dobrova
00050000-55fd-1a72-02d2-9c1e29f81d9b	9223	Dobrovnik/Dobronak 
00050000-55fd-1a72-ea8e-69fd5cf33c90	5212	Dobrovo v Brdih
00050000-55fd-1a72-4f4b-ba45574f9441	1431	Dol pri Hrastniku
00050000-55fd-1a72-a1b0-763e0682e2af	1262	Dol pri Ljubljani
00050000-55fd-1a72-caeb-83c48d34cb0f	1273	Dole pri Litiji
00050000-55fd-1a72-5566-35683788277d	1331	Dolenja vas
00050000-55fd-1a72-86fc-52f8042673d9	8350	Dolenjske Toplice
00050000-55fd-1a72-8f08-01e16f5fe9b5	1230	Domžale
00050000-55fd-1a72-513b-66295ff69eea	2252	Dornava
00050000-55fd-1a72-ea6e-cb3d15765579	5294	Dornberk
00050000-55fd-1a72-30b3-b8f273e3cc34	1319	Draga
00050000-55fd-1a72-ffdc-1893eca32f06	8343	Dragatuš
00050000-55fd-1a72-037a-221f7d629dec	3222	Dramlje
00050000-55fd-1a72-7260-3c0c88d1b12a	2370	Dravograd
00050000-55fd-1a72-98cc-f8532ccb973b	4203	Duplje
00050000-55fd-1a72-0cda-6bbb0d7a9606	6221	Dutovlje
00050000-55fd-1a72-c5ac-d96b7a063593	8361	Dvor
00050000-55fd-1a72-4c50-62c7ec7c966c	2343	Fala
00050000-55fd-1a72-3cd2-e433a3577757	9208	Fokovci
00050000-55fd-1a72-cd66-d134a3240ea9	2313	Fram
00050000-55fd-1a72-51ca-bd3c4d20498f	3213	Frankolovo
00050000-55fd-1a72-f9a1-d0ce18d4ed72	1274	Gabrovka
00050000-55fd-1a72-f650-e4c737b708a5	8254	Globoko
00050000-55fd-1a72-0013-fb09f0e074f7	5275	Godovič
00050000-55fd-1a72-5051-60480e54d21d	4204	Golnik
00050000-55fd-1a72-08da-4ae292082c3d	3303	Gomilsko
00050000-55fd-1a72-7640-2f3edb341c18	4224	Gorenja vas
00050000-55fd-1a72-93e9-1e56c7f0bccb	3263	Gorica pri Slivnici
00050000-55fd-1a72-c5f1-6c075d0ebff2	2272	Gorišnica
00050000-55fd-1a72-fb54-ed87d9d0b83a	9250	Gornja Radgona
00050000-55fd-1a72-bbfd-f65d6b7aaeaa	3342	Gornji Grad
00050000-55fd-1a72-bb0d-72ee4afb1980	4282	Gozd Martuljek
00050000-55fd-1a72-52c6-635a6ec35663	6272	Gračišče
00050000-55fd-1a72-6625-c86274dca126	9264	Grad
00050000-55fd-1a72-543b-f18471cf0c8f	8332	Gradac
00050000-55fd-1a72-52b3-647e0947cc06	1384	Grahovo
00050000-55fd-1a72-f67c-ead6f0b3d274	5242	Grahovo ob Bači
00050000-55fd-1a72-cc29-23c8fcb2b55a	5251	Grgar
00050000-55fd-1a72-c081-d3e5a4b396fe	3302	Griže
00050000-55fd-1a72-a9d1-473077b88c91	3231	Grobelno
00050000-55fd-1a72-d0bc-67639f3a8300	1290	Grosuplje
00050000-55fd-1a72-ecb7-73505196d321	2288	Hajdina
00050000-55fd-1a72-13c4-e1ae7c717187	8362	Hinje
00050000-55fd-1a72-d990-a618743aeb44	2311	Hoče
00050000-55fd-1a72-a6f7-479d5280a87e	9205	Hodoš/Hodos
00050000-55fd-1a72-ee02-5ba12241148a	1354	Horjul
00050000-55fd-1a72-e2da-038c5bc63855	1372	Hotedršica
00050000-55fd-1a72-5583-2dc55b356dff	1430	Hrastnik
00050000-55fd-1a72-d81a-110199d239bb	6225	Hruševje
00050000-55fd-1a72-e4d5-dab71c569c27	4276	Hrušica
00050000-55fd-1a72-ee40-403ee09c5196	5280	Idrija
00050000-55fd-1a72-361f-295d090fe9f8	1292	Ig
00050000-55fd-1a72-c38b-0ee857a2b697	6250	Ilirska Bistrica
00050000-55fd-1a72-39d0-1e19adb7d298	6251	Ilirska Bistrica-Trnovo
00050000-55fd-1a72-5fd3-f3d65c32f69c	1295	Ivančna Gorica
00050000-55fd-1a72-9d95-31867531390d	2259	Ivanjkovci
00050000-55fd-1a72-5fc3-e63f484a770e	1411	Izlake
00050000-55fd-1a72-2916-2068fd3557aa	6310	Izola/Isola
00050000-55fd-1a72-a296-12dd799c76ed	2222	Jakobski Dol
00050000-55fd-1a72-405d-4a2423b91777	2221	Jarenina
00050000-55fd-1a72-fe71-24e1672ab01f	6254	Jelšane
00050000-55fd-1a72-6294-16a9b82a18c0	4270	Jesenice
00050000-55fd-1a72-a336-e81f000916a0	8261	Jesenice na Dolenjskem
00050000-55fd-1a72-9c6e-1b0d3e3027ec	3273	Jurklošter
00050000-55fd-1a72-7620-e95511a64a23	2223	Jurovski Dol
00050000-55fd-1a72-6ce6-17e435abf652	2256	Juršinci
00050000-55fd-1a72-8a2f-6cae722a9949	5214	Kal nad Kanalom
00050000-55fd-1a72-41e2-5b5ec12acd54	3233	Kalobje
00050000-55fd-1a72-6edd-9baf807ddb50	4246	Kamna Gorica
00050000-55fd-1a72-f5ed-dbb1d85c7dab	2351	Kamnica
00050000-55fd-1a72-fe45-a1f4a86e99b2	1241	Kamnik
00050000-55fd-1a72-74f5-07cad958b4a0	5213	Kanal
00050000-55fd-1a72-20c3-e121b6bfc9d3	8258	Kapele
00050000-55fd-1a72-95f4-c36fbd467b51	2362	Kapla
00050000-55fd-1a72-1b10-58ccb2657ab4	2325	Kidričevo
00050000-55fd-1a72-5707-2f01a9c59174	1412	Kisovec
00050000-55fd-1a72-ac42-c474cf2a8915	6253	Knežak
00050000-55fd-1a72-7447-6876cde4a2ca	5222	Kobarid
00050000-55fd-1a72-099b-231f1233733d	9227	Kobilje
00050000-55fd-1a72-7c80-521f34947b62	1330	Kočevje
00050000-55fd-1a72-dc3d-97a0c46b854d	1338	Kočevska Reka
00050000-55fd-1a72-cf2b-43d1b35d9c94	2276	Kog
00050000-55fd-1a72-3753-2c52cf7b7fdd	5211	Kojsko
00050000-55fd-1a72-7ca8-d9d83fc6ed2d	6223	Komen
00050000-55fd-1a72-4751-146c7dac1a33	1218	Komenda
00050000-55fd-1a72-6455-229554a48d66	6000	Koper/Capodistria 
00050000-55fd-1a72-1dc7-2e35f6b5f8f3	6001	Koper/Capodistria - poštni predali
00050000-55fd-1a72-7594-7c399d4e8040	8282	Koprivnica
00050000-55fd-1a72-aeda-4050da594df9	5296	Kostanjevica na Krasu
00050000-55fd-1a72-6ed8-502b5960dafb	8311	Kostanjevica na Krki
00050000-55fd-1a72-fa55-ab8663157dff	1336	Kostel
00050000-55fd-1a72-7db4-5dca264967a4	6256	Košana
00050000-55fd-1a72-fbbe-5e79a471b03e	2394	Kotlje
00050000-55fd-1a72-e037-7266505223fc	6240	Kozina
00050000-55fd-1a72-38eb-618c2640721e	3260	Kozje
00050000-55fd-1a72-7ae8-aa6ff6285c67	4000	Kranj 
00050000-55fd-1a72-ddf0-fe5d3863a337	4001	Kranj - poštni predali
00050000-55fd-1a72-1b87-475e59680121	4280	Kranjska Gora
00050000-55fd-1a72-b23b-203ed5d24f2e	1281	Kresnice
00050000-55fd-1a72-5a94-84d6f087795e	4294	Križe
00050000-55fd-1a72-68e6-465fc85c5290	9206	Križevci
00050000-55fd-1a72-840c-43279c0884e0	9242	Križevci pri Ljutomeru
00050000-55fd-1a72-bc23-9f0e5e3904c0	1301	Krka
00050000-55fd-1a72-e8a6-e4488eaf2930	8296	Krmelj
00050000-55fd-1a72-3338-d02c4cace8e3	4245	Kropa
00050000-55fd-1a72-3fe0-23c6d88d5da3	8262	Krška vas
00050000-55fd-1a72-1d28-f2c13cea8b4c	8270	Krško
00050000-55fd-1a72-b732-ed70319fa457	9263	Kuzma
00050000-55fd-1a72-e8c6-f1620c9b206c	2318	Laporje
00050000-55fd-1a72-e555-70819bb43a51	3270	Laško
00050000-55fd-1a72-cce4-b97fc04bc307	1219	Laze v Tuhinju
00050000-55fd-1a72-8333-ec9a50714f45	2230	Lenart v Slovenskih goricah
00050000-55fd-1a72-5034-dd3a021236ea	9220	Lendava/Lendva
00050000-55fd-1a72-6799-992aacf2da5b	4248	Lesce
00050000-55fd-1a72-b09a-6b9d7edefce1	3261	Lesično
00050000-55fd-1a72-76fb-100c6ecd1f70	8273	Leskovec pri Krškem
00050000-55fd-1a72-d476-aac25e8c893b	2372	Libeliče
00050000-55fd-1a72-cb70-39887d5063c2	2341	Limbuš
00050000-55fd-1a72-07f7-d65d3f91350c	1270	Litija
00050000-55fd-1a72-a198-6ec1a8868876	3202	Ljubečna
00050000-55fd-1a72-7725-d26ee834a922	1000	Ljubljana 
00050000-55fd-1a72-87a9-ac914f7074f4	1001	Ljubljana - poštni predali
00050000-55fd-1a72-5d5e-4fd770aa08cf	1231	Ljubljana - Črnuče
00050000-55fd-1a72-7fdc-dbfd7916722c	1261	Ljubljana - Dobrunje
00050000-55fd-1a72-f453-0fd54923558d	1260	Ljubljana - Polje
00050000-55fd-1a72-3811-6a59cbf26a9d	1210	Ljubljana - Šentvid
00050000-55fd-1a72-1871-a7e9baaf0f0a	1211	Ljubljana - Šmartno
00050000-55fd-1a72-ac8b-939822922958	3333	Ljubno ob Savinji
00050000-55fd-1a72-32b4-63b728b1e0b8	9240	Ljutomer
00050000-55fd-1a72-1f4a-4a947ebef72a	3215	Loče
00050000-55fd-1a72-294e-731d8d5dc8d8	5231	Log pod Mangartom
00050000-55fd-1a72-2be3-19d2f31ccb54	1358	Log pri Brezovici
00050000-55fd-1a72-b74b-4367a6483fa9	1370	Logatec
00050000-55fd-1a72-a2b6-bd77ce16b924	1371	Logatec
00050000-55fd-1a72-0d55-4b51f821889b	1434	Loka pri Zidanem Mostu
00050000-55fd-1a72-1121-9c9e5f10d54e	3223	Loka pri Žusmu
00050000-55fd-1a72-11e5-73ced6ad8307	6219	Lokev
00050000-55fd-1a72-7ea0-e5ff61dee958	1318	Loški Potok
00050000-55fd-1a72-07d4-a9c88ff0163e	2324	Lovrenc na Dravskem polju
00050000-55fd-1a72-7ce8-c4a0d116b0b7	2344	Lovrenc na Pohorju
00050000-55fd-1a72-c066-60211b3d704d	3334	Luče
00050000-55fd-1a72-9537-e22d3234a42d	1225	Lukovica
00050000-55fd-1a72-5bd8-53f168b91e7b	9202	Mačkovci
00050000-55fd-1a72-7be9-93c49636a23e	2322	Majšperk
00050000-55fd-1a72-4c69-8d9962e4df04	2321	Makole
00050000-55fd-1a72-ef7b-cbe00ac80c24	9243	Mala Nedelja
00050000-55fd-1a72-bfec-3cc56dc12fbc	2229	Malečnik
00050000-55fd-1a72-8b61-77a4992676be	6273	Marezige
00050000-55fd-1a72-4914-8a48a9447584	2000	Maribor 
00050000-55fd-1a72-63ef-32a14c347c0e	2001	Maribor - poštni predali
00050000-55fd-1a72-afb1-375010b9f85d	2206	Marjeta na Dravskem polju
00050000-55fd-1a72-a9f7-85584492effa	2281	Markovci
00050000-55fd-1a72-4a12-87ab42c9a488	9221	Martjanci
00050000-55fd-1a72-48bf-5f0cef38a81c	6242	Materija
00050000-55fd-1a72-b7e2-66debc372931	4211	Mavčiče
00050000-55fd-1a72-9737-497bfea7de4e	1215	Medvode
00050000-55fd-1a72-6bcc-57e217119ed9	1234	Mengeš
00050000-55fd-1a72-0a54-45b31f5899c7	8330	Metlika
00050000-55fd-1a72-bfda-4297372e73f2	2392	Mežica
00050000-55fd-1a72-55f9-b1fe51bdf570	2204	Miklavž na Dravskem polju
00050000-55fd-1a72-7923-936b1eba713b	2275	Miklavž pri Ormožu
00050000-55fd-1a72-c797-94e5b4248790	5291	Miren
00050000-55fd-1a72-13b7-741916e46b70	8233	Mirna
00050000-55fd-1a72-6847-4bfeb18a0a97	8216	Mirna Peč
00050000-55fd-1a72-0586-712bfdfc69cb	2382	Mislinja
00050000-55fd-1a72-39ef-ede1008091fd	4281	Mojstrana
00050000-55fd-1a72-89bf-56569f10b970	8230	Mokronog
00050000-55fd-1a72-3904-366687cf4b7f	1251	Moravče
00050000-55fd-1a72-7b92-ace9d27cd5f0	9226	Moravske Toplice
00050000-55fd-1a72-0658-51cfacc631d7	5216	Most na Soči
00050000-55fd-1a72-9d96-b23aed559279	1221	Motnik
00050000-55fd-1a72-44bd-57f3a7f91d86	3330	Mozirje
00050000-55fd-1a72-2672-66fc50939ed7	9000	Murska Sobota 
00050000-55fd-1a72-4294-6139664fda90	9001	Murska Sobota - poštni predali
00050000-55fd-1a72-5162-71bcf81b9403	2366	Muta
00050000-55fd-1a72-bdcf-39bd663ed4a9	4202	Naklo
00050000-55fd-1a72-a0ff-15b3401e7079	3331	Nazarje
00050000-55fd-1a72-7fc9-66f9569001b7	1357	Notranje Gorice
00050000-55fd-1a72-85ba-c98606b577af	3203	Nova Cerkev
00050000-55fd-1a72-4b29-f6689f438b4d	5000	Nova Gorica 
00050000-55fd-1a72-186f-ede7624ce77d	5001	Nova Gorica - poštni predali
00050000-55fd-1a72-bfe8-ce1f11fd0194	1385	Nova vas
00050000-55fd-1a72-48e5-862184dc2698	8000	Novo mesto
00050000-55fd-1a72-6d19-182395aabcee	8001	Novo mesto - poštni predali
00050000-55fd-1a72-33df-ac454eafc071	6243	Obrov
00050000-55fd-1a72-8153-7e864f72749c	9233	Odranci
00050000-55fd-1a72-5775-52dc651a78a3	2317	Oplotnica
00050000-55fd-1a72-c343-f7d0c3b1e3ae	2312	Orehova vas
00050000-55fd-1a72-249c-98b32ed016ba	2270	Ormož
00050000-55fd-1a72-a681-88254b74e241	1316	Ortnek
00050000-55fd-1a72-7d10-b44201d501ef	1337	Osilnica
00050000-55fd-1a72-b0d0-03cea5bebea5	8222	Otočec
00050000-55fd-1a72-db12-a24fd523195c	2361	Ožbalt
00050000-55fd-1a72-3a3d-9d7e217a315e	2231	Pernica
00050000-55fd-1a72-7d4e-e78a5453adba	2211	Pesnica pri Mariboru
00050000-55fd-1a72-8d66-36c948be2fe9	9203	Petrovci
00050000-55fd-1a72-3819-f9f7903757c6	3301	Petrovče
00050000-55fd-1a72-3ecd-31186324626c	6330	Piran/Pirano
00050000-55fd-1a72-8962-a43dd8b763a3	8255	Pišece
00050000-55fd-1a72-d137-cf78e1cb5674	6257	Pivka
00050000-55fd-1a72-fb45-aa2ecc0f5140	6232	Planina
00050000-55fd-1a72-b114-0ea6b6a3e16a	3225	Planina pri Sevnici
00050000-55fd-1a72-0caa-90c704ed1920	6276	Pobegi
00050000-55fd-1a72-9797-b79b76842367	8312	Podbočje
00050000-55fd-1a72-2b71-25507e56c973	5243	Podbrdo
00050000-55fd-1a72-9398-a5a090560ce9	3254	Podčetrtek
00050000-55fd-1a72-82ba-78be8831088e	2273	Podgorci
00050000-55fd-1a72-fea7-13313fe48639	6216	Podgorje
00050000-55fd-1a72-b05c-893d60ef09d1	2381	Podgorje pri Slovenj Gradcu
00050000-55fd-1a72-efb7-d2ee2169cf1d	6244	Podgrad
00050000-55fd-1a72-5653-c91194776355	1414	Podkum
00050000-55fd-1a72-5a3a-3f969be79d89	2286	Podlehnik
00050000-55fd-1a72-b94d-ec5e0ebcee09	5272	Podnanos
00050000-55fd-1a72-343e-2dc78edeab2b	4244	Podnart
00050000-55fd-1a72-a3d4-ca62099dce28	3241	Podplat
00050000-55fd-1a72-6b38-a294792d0d62	3257	Podsreda
00050000-55fd-1a72-193b-6c8a987bba29	2363	Podvelka
00050000-55fd-1a72-ae7c-ec8aa52468f4	2208	Pohorje
00050000-55fd-1a72-a125-4bf7c8a78150	2257	Polenšak
00050000-55fd-1a72-e9ea-c74265f809d7	1355	Polhov Gradec
00050000-55fd-1a72-1b6d-590c25785d2b	4223	Poljane nad Škofjo Loko
00050000-55fd-1a72-57de-4b01d6ac8cdd	2319	Poljčane
00050000-55fd-1a72-3b60-190b58b2fb47	1272	Polšnik
00050000-55fd-1a72-a854-b78f4eab8014	3313	Polzela
00050000-55fd-1a72-2453-77f2ad73b93f	3232	Ponikva
00050000-55fd-1a72-1546-0d42df56d265	6320	Portorož/Portorose
00050000-55fd-1a72-5d15-0b7ad5be2c53	6230	Postojna
00050000-55fd-1a72-92bf-0cf7a873bff5	2331	Pragersko
00050000-55fd-1a72-256c-86784d7d6f62	3312	Prebold
00050000-55fd-1a72-e095-60208d104bc1	4205	Preddvor
00050000-55fd-1a72-41f8-9472c432ee7c	6255	Prem
00050000-55fd-1a72-2c8f-6d742f12036d	1352	Preserje
00050000-55fd-1a72-d369-20af3610650a	6258	Prestranek
00050000-55fd-1a72-8057-746f82889f26	2391	Prevalje
00050000-55fd-1a72-602e-72579f708a18	3262	Prevorje
00050000-55fd-1a72-ecb1-e1fc6a83aec3	1276	Primskovo 
00050000-55fd-1a72-aff0-453c47fba369	3253	Pristava pri Mestinju
00050000-55fd-1a72-4f76-2f0f46115b32	9207	Prosenjakovci/Partosfalva
00050000-55fd-1a72-48b8-d892fe12d17e	5297	Prvačina
00050000-55fd-1a72-1631-613061e3a43d	2250	Ptuj
00050000-55fd-1a72-79cf-5ebea6905d42	2323	Ptujska Gora
00050000-55fd-1a72-c804-ef2985bb86e1	9201	Puconci
00050000-55fd-1a72-c702-94794a1c3efc	2327	Rače
00050000-55fd-1a72-b2aa-8e947a664a78	1433	Radeče
00050000-55fd-1a72-ae36-66f6af4e2ed6	9252	Radenci
00050000-55fd-1a72-a5a0-45f57f6bb3cb	2360	Radlje ob Dravi
00050000-55fd-1a72-e263-1c05dfd3159a	1235	Radomlje
00050000-55fd-1a72-e545-77f3de00745d	4240	Radovljica
00050000-55fd-1a72-38de-a3b445865db4	8274	Raka
00050000-55fd-1a72-17ce-74682bb84624	1381	Rakek
00050000-55fd-1a72-00ff-93b29c1c22c0	4283	Rateče - Planica
00050000-55fd-1a72-c899-397b0bdacee5	2390	Ravne na Koroškem
00050000-55fd-1a72-27fe-9dad64f99165	9246	Razkrižje
00050000-55fd-1a72-a3c7-e139119a6d7a	3332	Rečica ob Savinji
00050000-55fd-1a72-1fd5-d535e229be9b	5292	Renče
00050000-55fd-1a72-e533-9cc88ee0d2f0	1310	Ribnica
00050000-55fd-1a72-61a9-34e616ff9caa	2364	Ribnica na Pohorju
00050000-55fd-1a72-e3d8-318e5d789c5f	3272	Rimske Toplice
00050000-55fd-1a72-29a6-a87d670ffeb6	1314	Rob
00050000-55fd-1a72-4c78-fc00cf4d0a46	5215	Ročinj
00050000-55fd-1a72-cf4b-591d1fbc6b50	3250	Rogaška Slatina
00050000-55fd-1a72-b22b-06083dcafc95	9262	Rogašovci
00050000-55fd-1a72-7596-1eefc2881f09	3252	Rogatec
00050000-55fd-1a72-8594-26067565fef6	1373	Rovte
00050000-55fd-1a72-aa51-2c55a4703299	2342	Ruše
00050000-55fd-1a72-2e84-58822a727cb6	1282	Sava
00050000-55fd-1a72-baa3-a199a618fb5c	6333	Sečovlje/Sicciole
00050000-55fd-1a72-05ca-6712bd4326eb	4227	Selca
00050000-55fd-1a72-49c1-6218d41d798b	2352	Selnica ob Dravi
00050000-55fd-1a72-4813-a6a3e3c62617	8333	Semič
00050000-55fd-1a72-d3d2-35c1b1114a8a	8281	Senovo
00050000-55fd-1a72-4cbc-4045d13e3e51	6224	Senožeče
00050000-55fd-1a72-0a71-2b164ccd2f44	8290	Sevnica
00050000-55fd-1a72-1836-cee7b0dc3d0a	6210	Sežana
00050000-55fd-1a72-8c65-f90edb3583bf	2214	Sladki Vrh
00050000-55fd-1a72-67cb-41ecf73d1353	5283	Slap ob Idrijci
00050000-55fd-1a72-b75f-14e7d5c95cfc	2380	Slovenj Gradec
00050000-55fd-1a72-98a5-b100a89612e6	2310	Slovenska Bistrica
00050000-55fd-1a72-b98d-3e1c7c4cf1fb	3210	Slovenske Konjice
00050000-55fd-1a72-5c36-92a726fbcdf0	1216	Smlednik
00050000-55fd-1a72-2b87-5a3b683b72c5	5232	Soča
00050000-55fd-1a72-2a47-9eb4bf814375	1317	Sodražica
00050000-55fd-1a72-8b6e-22bd7cb9bf09	3335	Solčava
00050000-55fd-1a72-3d61-2671bfc5714a	5250	Solkan
00050000-55fd-1a72-def9-27fb12f3b2f4	4229	Sorica
00050000-55fd-1a72-6c52-ba970d8c114c	4225	Sovodenj
00050000-55fd-1a72-71f0-249d9eb402f2	5281	Spodnja Idrija
00050000-55fd-1a72-0cca-49a0077c6e32	2241	Spodnji Duplek
00050000-55fd-1a72-06f6-372e0b441d8f	9245	Spodnji Ivanjci
00050000-55fd-1a72-a651-6a1e2f59deea	2277	Središče ob Dravi
00050000-55fd-1a72-b88d-db6a54b888f7	4267	Srednja vas v Bohinju
00050000-55fd-1a72-ff43-185b6e2b073b	8256	Sromlje 
00050000-55fd-1a72-664d-0dbde67d24c4	5224	Srpenica
00050000-55fd-1a72-270d-de65d6c76104	1242	Stahovica
00050000-55fd-1a72-c7c4-4f3346ad11c8	1332	Stara Cerkev
00050000-55fd-1a72-42c0-452b8e44bb57	8342	Stari trg ob Kolpi
00050000-55fd-1a72-7a76-00491f2e5e36	1386	Stari trg pri Ložu
00050000-55fd-1a72-7f95-27950af91f04	2205	Starše
00050000-55fd-1a72-83b4-274667448c79	2289	Stoperce
00050000-55fd-1a72-c06d-317d005c721d	8322	Stopiče
00050000-55fd-1a72-5b80-c5defd345d95	3206	Stranice
00050000-55fd-1a72-6b46-dae12db5f496	8351	Straža
00050000-55fd-1a72-957b-a765d667857c	1313	Struge
00050000-55fd-1a72-ff41-fb1c668699fd	8293	Studenec
00050000-55fd-1a72-dc65-f94139953740	8331	Suhor
00050000-55fd-1a72-5e5b-86395ed34587	2233	Sv. Ana v Slovenskih goricah
00050000-55fd-1a72-742d-aaa5200f1e9d	2235	Sv. Trojica v Slovenskih goricah
00050000-55fd-1a72-a291-4f356187b665	2353	Sveti Duh na Ostrem Vrhu
00050000-55fd-1a72-fc05-e1a98aee6434	9244	Sveti Jurij ob Ščavnici
00050000-55fd-1a72-2f01-1c606fd8254f	3264	Sveti Štefan
00050000-55fd-1a72-5114-4eb783dee3cb	2258	Sveti Tomaž
00050000-55fd-1a72-b666-1fecbbc3e29e	9204	Šalovci
00050000-55fd-1a72-2aa2-620f5d5662d9	5261	Šempas
00050000-55fd-1a72-9b3f-c3c6d55af3e1	5290	Šempeter pri Gorici
00050000-55fd-1a72-1b00-114c4d346d5f	3311	Šempeter v Savinjski dolini
00050000-55fd-1a72-a870-c310241d0661	4208	Šenčur
00050000-55fd-1a72-3ab9-e4d0cca42915	2212	Šentilj v Slovenskih goricah
00050000-55fd-1a72-06b6-88c07bfd88ae	8297	Šentjanž
00050000-55fd-1a72-94eb-61d76de47466	2373	Šentjanž pri Dravogradu
00050000-55fd-1a72-b1a2-dbb48a81ff8b	8310	Šentjernej
00050000-55fd-1a72-9ef0-e86be2c93334	3230	Šentjur
00050000-55fd-1a72-a09b-7bc470e3dea2	3271	Šentrupert
00050000-55fd-1a72-849a-1c164251022f	8232	Šentrupert
00050000-55fd-1a72-e9ab-56d4ac026aa6	1296	Šentvid pri Stični
00050000-55fd-1a72-19b7-13707d0c031c	8275	Škocjan
00050000-55fd-1a72-a0b2-a34c0beb97dd	6281	Škofije
00050000-55fd-1a72-28a8-1bc2e4fe1409	4220	Škofja Loka
00050000-55fd-1a72-a9f2-5c2d0670ac84	3211	Škofja vas
00050000-55fd-1a72-817a-8bb328d2399f	1291	Škofljica
00050000-55fd-1a72-d8f9-b655561be724	6274	Šmarje
00050000-55fd-1a72-2b0f-9db4c89c5c4e	1293	Šmarje - Sap
00050000-55fd-1a72-72f9-8af4d084fa2a	3240	Šmarje pri Jelšah
00050000-55fd-1a72-24b2-c2386200732b	8220	Šmarješke Toplice
00050000-55fd-1a72-7a08-161469d4944e	2315	Šmartno na Pohorju
00050000-55fd-1a72-052f-6759571baf53	3341	Šmartno ob Dreti
00050000-55fd-1a72-1ca0-08eb45156021	3327	Šmartno ob Paki
00050000-55fd-1a72-41ec-145e0062a8ff	1275	Šmartno pri Litiji
00050000-55fd-1a72-5ca6-a02af084b286	2383	Šmartno pri Slovenj Gradcu
00050000-55fd-1a72-a953-e95fdc7d7ec4	3201	Šmartno v Rožni dolini
00050000-55fd-1a72-87a8-06f2932a9985	3325	Šoštanj
00050000-55fd-1a72-8490-5ac569377c25	6222	Štanjel
00050000-55fd-1a72-25ec-00554b85f4ab	3220	Štore
00050000-55fd-1a72-463f-37c95a39fc8c	3304	Tabor
00050000-55fd-1a72-8d57-1d63fca0b4ad	3221	Teharje
00050000-55fd-1a72-2262-bc55c9749661	9251	Tišina
00050000-55fd-1a72-7072-6e409a3cfd2a	5220	Tolmin
00050000-55fd-1a72-bcd9-f1eb4079f431	3326	Topolšica
00050000-55fd-1a72-558e-11f817bf514e	2371	Trbonje
00050000-55fd-1a72-9aaf-397dc87dccd4	1420	Trbovlje
00050000-55fd-1a72-695d-65e37c516119	8231	Trebelno 
00050000-55fd-1a72-8b71-0d3a8299f5d8	8210	Trebnje
00050000-55fd-1a72-a8ba-44a87f7b1dac	5252	Trnovo pri Gorici
00050000-55fd-1a72-10a3-df84650f1cd0	2254	Trnovska vas
00050000-55fd-1a72-b2c1-64b61753880e	1222	Trojane
00050000-55fd-1a72-8d5b-a30050b9d626	1236	Trzin
00050000-55fd-1a72-1f7a-6aa44f6b94fd	4290	Tržič
00050000-55fd-1a72-2cba-df87a1518d95	8295	Tržišče
00050000-55fd-1a72-a060-3f3ba3f71f89	1311	Turjak
00050000-55fd-1a72-20d5-14340f7a0689	9224	Turnišče
00050000-55fd-1a72-2ba9-bdab46e643be	8323	Uršna sela
00050000-55fd-1a72-f603-4a54b138c35b	1252	Vače
00050000-55fd-1a72-ee02-39c57c49a6fa	3320	Velenje 
00050000-55fd-1a72-a23b-f2080e0ccc45	3322	Velenje - poštni predali
00050000-55fd-1a72-185a-092034b82aa7	8212	Velika Loka
00050000-55fd-1a72-3284-769ab635906c	2274	Velika Nedelja
00050000-55fd-1a72-19c3-19206a83fc32	9225	Velika Polana
00050000-55fd-1a72-4b23-ab8e5f51ec78	1315	Velike Lašče
00050000-55fd-1a72-d08c-092f31253287	8213	Veliki Gaber
00050000-55fd-1a72-d143-70fea62ce87e	9241	Veržej
00050000-55fd-1a72-f600-a37f686bdc9e	1312	Videm - Dobrepolje
00050000-55fd-1a72-0fbb-3e9a127b5c5c	2284	Videm pri Ptuju
00050000-55fd-1a72-e8ab-76e33464341a	8344	Vinica
00050000-55fd-1a72-ce0d-b1f274f1057a	5271	Vipava
00050000-55fd-1a72-12e5-39aefbf63a2b	4212	Visoko
00050000-55fd-1a72-a069-29b7a764cd3c	1294	Višnja Gora
00050000-55fd-1a72-d346-9ce47819f0e4	3205	Vitanje
00050000-55fd-1a72-8dd6-bc6f295db48c	2255	Vitomarci
00050000-55fd-1a72-66db-ba2c59504886	1217	Vodice
00050000-55fd-1a72-0f9f-ba2ed2f39559	3212	Vojnik\t
00050000-55fd-1a72-306c-8f3c50a29d05	5293	Volčja Draga
00050000-55fd-1a72-4454-7e1e2cea2a0a	2232	Voličina
00050000-55fd-1a72-53f7-c795ef9e8667	3305	Vransko
00050000-55fd-1a72-9831-d714aec9cd3a	6217	Vremski Britof
00050000-55fd-1a72-fc18-338f35e36ee4	1360	Vrhnika
00050000-55fd-1a72-fbfb-9e2b374e8fd1	2365	Vuhred
00050000-55fd-1a72-481a-8b4fe3e0046b	2367	Vuzenica
00050000-55fd-1a72-a309-c95d544eff53	8292	Zabukovje 
00050000-55fd-1a72-6957-9fa8dbdda194	1410	Zagorje ob Savi
00050000-55fd-1a72-7501-79229b0cd841	1303	Zagradec
00050000-55fd-1a72-ca85-9608b579ccce	2283	Zavrč
00050000-55fd-1a72-9c9b-c8e423a55dfa	8272	Zdole 
00050000-55fd-1a72-f9cc-b51e8da76bfa	4201	Zgornja Besnica
00050000-55fd-1a72-e316-7e86774a1223	2242	Zgornja Korena
00050000-55fd-1a72-3f59-e7e818550474	2201	Zgornja Kungota
00050000-55fd-1a72-7fb6-ff81068e67e9	2316	Zgornja Ložnica
00050000-55fd-1a72-33c9-d16555b59198	2314	Zgornja Polskava
00050000-55fd-1a72-9779-faab718fee9f	2213	Zgornja Velka
00050000-55fd-1a72-97ff-82088db57768	4247	Zgornje Gorje
00050000-55fd-1a72-6b14-c469d966d5be	4206	Zgornje Jezersko
00050000-55fd-1a72-ec6b-3c13b70c3d22	2285	Zgornji Leskovec
00050000-55fd-1a72-f04f-a698eadcacc8	1432	Zidani Most
00050000-55fd-1a72-acee-d7e2cc759ce9	3214	Zreče
00050000-55fd-1a72-41c3-9b5a3124ff9a	4209	Žabnica
00050000-55fd-1a72-7c4f-96e60e168fce	3310	Žalec
00050000-55fd-1a72-4304-779d80c13e04	4228	Železniki
00050000-55fd-1a72-347f-27ebb9206aa3	2287	Žetale
00050000-55fd-1a72-0dda-f7d98f8913a1	4226	Žiri
00050000-55fd-1a72-0651-8cbab446d0f2	4274	Žirovnica
00050000-55fd-1a72-fa42-5f2eafb791c9	8360	Žužemberk
\.


--
-- TOC entry 2994 (class 0 OID 20186636)
-- Dependencies: 230
-- Data for Name: postavkacdve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkacdve (id, skupina, podskupina, naziv, vrpremiere, vrponovitvepremier, vrponovitveprejsnjih, vrgostovanjazamejstvo, vrfestivali, vrgostovanjaint, vrostalo, programdela_id) FROM stdin;
\.


--
-- TOC entry 2967 (class 0 OID 20186263)
-- Dependencies: 203
-- Data for Name: postavkaracuna; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkaracuna (id, racun_id) FROM stdin;
\.


--
-- TOC entry 2950 (class 0 OID 20186069)
-- Dependencies: 186
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
00060000-55fd-1a74-654d-ef468d7a4a5a	00080000-55fd-1a74-41eb-55abd57905f2	\N	00040000-55fd-1a72-aab1-4ea07023de65	Narodni dom	\N	Koroška 15	\N	9231	Beltinci	\N	f	t
00060000-55fd-1a74-7f93-514639351609	00080000-55fd-1a74-41eb-55abd57905f2	\N	00040000-55fd-1a72-aab1-4ea07023de65	Korotan	\N	Koroška 22	\N	9231	Beltinci	\N	f	f
00060000-55fd-1a74-85a6-f2ee8a7e996c	00080000-55fd-1a74-b4c9-941cbf725a23	\N	00040000-55fd-1a72-aab1-4ea07023de65	Rimljan	\N	Rimska ploščad 7	\N	9231	Beltinci	\N	f	t
\.


--
-- TOC entry 2956 (class 0 OID 20186147)
-- Dependencies: 192
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, zaporedna, porocilo) FROM stdin;
\.


--
-- TOC entry 2969 (class 0 OID 20186275)
-- Dependencies: 205
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 2995 (class 0 OID 20186650)
-- Dependencies: 231
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, koproducent_id, odstotekfinanciranja, delez, maticnikop, kpe, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 2996 (class 0 OID 20186660)
-- Dependencies: 232
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, sifra, status) FROM stdin;
00190000-55fd-1a74-8df3-69fc61c4a1c5	00080000-55fd-1a74-8696-62d2b0a64f3d	0987	AK
00190000-55fd-1a74-44dc-d7d42da05bd8	00080000-55fd-1a74-b4c9-941cbf725a23	0989	AK
00190000-55fd-1a74-55d1-65185e684dae	00080000-55fd-1a74-daba-003b7bdf1bb5	0986	AK
00190000-55fd-1a74-1a19-912306c349a9	00080000-55fd-1a74-187e-a40343a12751	0984	AK
00190000-55fd-1a74-9140-9734179f3d72	00080000-55fd-1a74-c283-9cf850e6311c	0983	AK
00190000-55fd-1a74-0946-9025cd85c0da	00080000-55fd-1a74-986b-7f4822cd286c	0982	AK
00190000-55fd-1a75-bde8-c79c006ebc0d	00080000-55fd-1a75-a2ba-a57b4638b161	1001	AK
\.


--
-- TOC entry 2993 (class 0 OID 20186593)
-- Dependencies: 229
-- Data for Name: programdela; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programdela (id, sifra, naziv, zacetek, konec, zakljuceno, potrjenprogram, stpremier, stint, stfest, strazno, stizjem, stponprem, stponprej, stponprejvelikih, stponprejmalih, stponprejmalihkopr, stponprejsredkopr, stponprejvelikihkopr, stgostujo, vrps1, vrps1do, vrps1mat, vrps1gostovsz, stizvnekomerc, stizvprem, stizvpremdoma, stizvpremkopr, stizvponprem, stizvponpremdoma, stizvponpremzamejo, stizvponpremgost, stizvponpremkopr, stizvponpremint, stizvponpremkoprint, stizvponprej, stizvponprejdoma, stizvponprejzamejo, stizvponprejgost, stizvponprejkopr, stizvponprejint, stizvponprejkoprint, stizvgostuj, stizvostalihnek, stizvgostovanjslo, stizvgostovanjzam, stizvgostovanjint, stobisknekom, stobisknekommat, stobisknekomgostslo, stobisknekomgostzam, stobisknekomgostint, stobiskprem, stobiskpremdoma, stobiskpremkopr, stobiskponprem, stobiskponpremdoma, stobiskponpremkopr, stobiskponpremkoprint, stobiskponpremgost, stobiskponpremzamejo, stobiskponpremint, avgobiskprired, avgzaseddvoran, avgcenavstopnice, stprodvstopnic, stkoprodukcij, stkoprodukcijint, stkoprodukcijnvo, stzaposlenih, stzaposigralcev, avgstnastopovigr, sthonorarnih, sthonorarnihigr, sthonorarnihigrtujjz, sthonorarnihigrsamoz, sredstvaint, sredstvaavt, sredstvazaprosenoprem, sredstvazaprosenoponprem, sredstvazaprosenoponprej, sredstvazaprosenogostujo, sredstvazaprosenoint, sredstvazaprosenofest, sredstvazaprosenorazno, sredstvazaprosenoizjem, sredstvadrugijavniprem, sredstvadrugijavniponprem, sredstvadrugijavniponprej, sredstvadrugijavnigostujo, sredstvadrugijavniint, sredstvadrugijavnifest, sredstvadrugijavnirazno, sredstvadrugijavniizjem, sredstvadrugiviriprem, sredstvadrugiviriponprem, sredstvadrugiviriponprej, sredstvadrugivirigostujo, sredstvadrugiviriint, sredstvadrugivirifest, sredstvadrugivirirazno, sredstvadrugiviriizjem, sredstvaavtsamoz) FROM stdin;
00290000-55fd-1a74-9936-01716a5c6312	0001	Testni program dela	2016-02-01	2017-02-01	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 2997 (class 0 OID 20186668)
-- Dependencies: 233
-- Data for Name: programskaenotasklopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programskaenotasklopa (id, naslovpe, avtorpe, obsegpe, mesecpe, vrednostpe, programrazno_id) FROM stdin;
\.


--
-- TOC entry 2973 (class 0 OID 20186304)
-- Dependencies: 209
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, popa_id, naslov_id, sifra, naziv, jeprizorisce, jematicnioder, seplanira, kapaciteta, opis) FROM stdin;
00220000-55fd-1a74-a475-cb75c089e480	\N	\N	0001	Poskusna 1	f	\N	t	8	Poskusna učilnica v prvem
00220000-55fd-1a74-e09f-f9f1fd566b13	\N	\N	0002	Poskusna 3	f	\N	f	34	Poskusna učilnica v tretjem
00220000-55fd-1a74-5949-d63b73be1672	\N	\N	0003	Kazinska	t	\N	t	84	Kazinska dvorana
00220000-55fd-1a74-d322-83f01a49bbff	\N	\N	0004	Mali oder	t	\N	t	24	Mali oder 
00220000-55fd-1a74-e77b-d1e735b8b2aa	\N	\N	0005	Komorni oder	t	\N	t	15	Komorni oder
00220000-55fd-1a74-91b0-858fb0937f22	\N	\N	0006	Stara dvorana	t	\N	t	96	Stara dvorana ali dvorana Franceta Prešerna
00220000-55fd-1a74-f958-d5475e6db727	\N	\N	0007	Velika dvorana	t	\N	t	160	Velika, glavna dvorana
\.


--
-- TOC entry 2965 (class 0 OID 20186248)
-- Dependencies: 201
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 2964 (class 0 OID 20186238)
-- Dependencies: 200
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 2986 (class 0 OID 20186446)
-- Dependencies: 222
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta, status) FROM stdin;
\.


--
-- TOC entry 2980 (class 0 OID 20186378)
-- Dependencies: 216
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 2939 (class 0 OID 20185942)
-- Dependencies: 175
-- Data for Name: revizije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY revizije (id, razred, objectid, upor, datum, tip, data) FROM stdin;
1	App\\Entity\\Popa	00080000-55fd-1a75-a2ba-a57b4638b161	00010000-55fd-1a73-4012-84cd4edde7c1	2015-09-19 10:19:01	INS	a:0:{}
2	App\\Entity\\Option	00000000-55fd-1a75-c43b-1ae9e910b39c	00010000-55fd-1a73-4012-84cd4edde7c1	2015-09-19 10:19:01	INS	a:0:{}
3	ProgramDela\\Entity\\ProdukcijskaHisa	00190000-55fd-1a75-bde8-c79c006ebc0d	00010000-55fd-1a73-4012-84cd4edde7c1	2015-09-19 10:19:01	INS	a:0:{}
\.


--
-- TOC entry 3015 (class 0 OID 0)
-- Dependencies: 174
-- Name: revizije_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('revizije_id_seq', 3, true);


--
-- TOC entry 2974 (class 0 OID 20186317)
-- Dependencies: 210
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 2943 (class 0 OID 20185980)
-- Dependencies: 179
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-55fd-1a72-c491-f6dc40e3e1b5	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-55fd-1a72-2749-477f335884fd	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-55fd-1a72-433f-d40bf298947e	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-55fd-1a72-8eab-afcf3a910469	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-55fd-1a72-68e3-48274ca07e91	planer	Planer dogodkov v koledarju	t
00020000-55fd-1a72-c306-a2d7ee5f878d	kadrovska	Kadrovska služba	t
00020000-55fd-1a73-a809-70d0489d1fec	arhivar	Ažuriranje arhivalij	t
00020000-55fd-1a73-c964-8951b39fa1db	igralec	Igralec	t
00020000-55fd-1a73-00c8-6a5f9bc9ec1a	prisotnost	Vnašalec prisotnosti, tudi za tiste izven uprizoritev	t
00020000-55fd-1a74-7804-f337ae921da8	vsadovoljenja	Vloga z vsemi posameznimi dovoljenji	t
\.


--
-- TOC entry 2941 (class 0 OID 20185964)
-- Dependencies: 177
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-55fd-1a73-9ea8-f50a3d62c39c	00020000-55fd-1a72-433f-d40bf298947e
00010000-55fd-1a73-4012-84cd4edde7c1	00020000-55fd-1a72-433f-d40bf298947e
00010000-55fd-1a74-b099-fd8042494101	00020000-55fd-1a74-7804-f337ae921da8
\.


--
-- TOC entry 2976 (class 0 OID 20186331)
-- Dependencies: 212
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 2968 (class 0 OID 20186269)
-- Dependencies: 204
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 2962 (class 0 OID 20186215)
-- Dependencies: 198
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, sifra, ime, zacetek, konec, aktivna) FROM stdin;
\.


--
-- TOC entry 2937 (class 0 OID 20185929)
-- Dependencies: 173
-- Data for Name: stevilcenje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenje (id, sifra, naziv, prefix, suffix, zacetek, dolzina, format, globalno, poletih) FROM stdin;
00230000-55fd-1a72-ae32-992923ad3a62	pri	Privzeto številčenje po letih YYYY-N	\N	\N	1	1	%l-%n	f	t
00230000-55fd-1a72-b570-b7ee4e1ff82f	123	Privzeto številčenje kratkih šifer	\N	\N	100	3	%n	f	f
00230000-55fd-1a72-d96a-7454a28d49ea	bcd	Globalno številčenje črtnih kod	\N	\N	1	9	%n	t	f
00230000-55fd-1a72-d9c9-a898d2252544	sif	Številčenje šifrant	\N	\N	1000	4	%n	f	f
00230000-55fd-1a72-d697-d93334045e19	tmp	Globalno številčenje začasnih številk	tmp	\N	1000	5	%l%n	t	t
\.


--
-- TOC entry 2936 (class 0 OID 20185921)
-- Dependencies: 172
-- Data for Name: stevilcenjekonfig; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjekonfig (id, stevilcenje_id, dok) FROM stdin;
00240000-55fd-1a72-3925-d08bf3c2f0ab	00230000-55fd-1a72-d9c9-a898d2252544	popa
00240000-55fd-1a72-38fb-1c6c8508b0c2	00230000-55fd-1a72-d9c9-a898d2252544	oseba
00240000-55fd-1a72-98b1-3b9afb77c425	00230000-55fd-1a72-d9c9-a898d2252544	sezona
00240000-55fd-1a72-0af3-a4bf45a40886	00230000-55fd-1a72-b570-b7ee4e1ff82f	prostor
00240000-55fd-1a72-e0cf-f3cb2ed2e47b	00230000-55fd-1a72-d9c9-a898d2252544	besedilo
00240000-55fd-1a72-7951-1fdd043078a3	00230000-55fd-1a72-d9c9-a898d2252544	uprizoritev
00240000-55fd-1a72-8167-b9761e379b50	00230000-55fd-1a72-d9c9-a898d2252544	funkcija
00240000-55fd-1a72-d714-1a547bdd588a	00230000-55fd-1a72-d9c9-a898d2252544	tipfunkcije
00240000-55fd-1a72-9c3e-9e3e909e347a	00230000-55fd-1a72-d9c9-a898d2252544	alternacija
00240000-55fd-1a72-701c-a720361017b2	00230000-55fd-1a72-ae32-992923ad3a62	pogodba
00240000-55fd-1a72-48fd-ee53e7c386ce	00230000-55fd-1a72-d9c9-a898d2252544	zaposlitev
00240000-55fd-1a72-9e0f-5020b0a3d2e7	00230000-55fd-1a72-d9c9-a898d2252544	zvrstuprizoritve
00240000-55fd-1a72-d745-347c80ab1fd6	00230000-55fd-1a72-ae32-992923ad3a62	programdela
00240000-55fd-1a72-b10d-493e6e3d6f35	00230000-55fd-1a72-d9c9-a898d2252544	zapis
\.


--
-- TOC entry 2935 (class 0 OID 20185916)
-- Dependencies: 171
-- Data for Name: stevilcenjestanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjestanje (id, objid, leto, stevilka) FROM stdin;
1c8ba22d-c375-48a1-bb85-017f0b423595	00240000-55fd-1a72-3925-d08bf3c2f0ab	0	1001
\.


--
-- TOC entry 2982 (class 0 OID 20186395)
-- Dependencies: 218
-- Data for Name: strosekuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY strosekuprizoritve (id, uprizoritev_id, popa_id, naziv, vrednostdo, vrednostna, opis, tipstroska, sort, vrstastroska_id) FROM stdin;
00270000-55fd-1a74-5e19-f909a2cbef35	000e0000-55fd-1a74-3e72-4780de6da502	00080000-55fd-1a74-41eb-55abd57905f2	Nabava kostumov	600.50	20.00	Krila in maske	materialni	1	003b0000-55fd-1a72-4214-de8a698a76b5
00270000-55fd-1a74-e93f-0f61503c69e4	000e0000-55fd-1a74-3e72-4780de6da502	00080000-55fd-1a74-41eb-55abd57905f2	Zavese	125.70	3.10	Modra in zelena zavesa	materialni	2	003b0000-55fd-1a72-4214-de8a698a76b5
\.


--
-- TOC entry 2948 (class 0 OID 20186042)
-- Dependencies: 184
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 2963 (class 0 OID 20186225)
-- Dependencies: 199
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja) FROM stdin;
001a0000-55fd-1a74-70d9-27987868b6bb	00180000-55fd-1a74-acc6-83dcf1b72b73	000c0000-55fd-1a74-de68-7574b4c01212	00090000-55fd-1a74-2346-90a9e0ea33dd	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55fd-1a74-aab4-b69bd5675272	00180000-55fd-1a74-acc6-83dcf1b72b73	000c0000-55fd-1a74-805b-65f07544dcff	00090000-55fd-1a74-b958-9b09e173e528	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55fd-1a74-2b72-8a6a8d77e5ba	00180000-55fd-1a74-acc6-83dcf1b72b73	000c0000-55fd-1a74-68ad-e2deda5aef7f	00090000-55fd-1a74-15d6-abdfb0c600f3	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55fd-1a74-74e1-de9ef4700d06	00180000-55fd-1a74-acc6-83dcf1b72b73	000c0000-55fd-1a74-c954-98e07ee1a496	00090000-55fd-1a74-474e-874566b72d5d	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55fd-1a74-c1b2-06489a2e8e11	00180000-55fd-1a74-acc6-83dcf1b72b73	000c0000-55fd-1a74-d018-0e45d12385d3	00090000-55fd-1a74-2150-7ca5096d1ca9	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55fd-1a74-c50f-79c3c62d2dbd	00180000-55fd-1a74-f231-b3fcf158206f	\N	00090000-55fd-1a74-2150-7ca5096d1ca9	2015-08-01 20:00:00	2015-08-01 23:00:00	\N	\N	2.00
\.


--
-- TOC entry 2985 (class 0 OID 20186434)
-- Dependencies: 221
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, sifra, ime, opis, imezenski, podrocje) FROM stdin;
000f0000-55fd-1a72-8e3b-a76eec79730e	01	Avtor	Avtorji	Avtorka	umetnik
000f0000-55fd-1a72-c041-9d9ddc7858fb	02	Priredba	Priredba	Priredba	umetnik
000f0000-55fd-1a72-3a10-33acfefc8da1	03	Prevod	Prevod	Prevod	umetnik
000f0000-55fd-1a72-7812-e6e2055208f8	04	Režija	Režija	Režija	umetnik
000f0000-55fd-1a72-4be9-5042cd4c01e8	05	Dramaturgija	Dramaturgija	Dramaturgija	umetnik
000f0000-55fd-1a72-1aee-54577cef6660	06	Scenografija	Scenografija	Scenografija	umetnik
000f0000-55fd-1a72-1e59-e7f7b602dd60	07	Kostumografija	Kostumografija	Kostumografija	umetnik
000f0000-55fd-1a72-2200-54b94bc0c732	08	Koreografija	Koreografija	Koreografija	umetnik
000f0000-55fd-1a72-c17d-2980a29e78b2	09	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	umetnik
000f0000-55fd-1a72-76a0-5508eb4185a0	10	Oblikovanje maske	Oblikovanje maske	Oblikovanje maske	umetnik
000f0000-55fd-1a72-f8aa-04f2898549c4	11	Lektorstvo	Lektorstvo	Lektorstvo	umetnik
000f0000-55fd-1a72-1d9b-84558b562496	12	Glasbeni soustvarjalec	Glasbeni soustvarjalci	Glasbena soustvarjalka	umetnik
000f0000-55fd-1a72-fc2b-ebfec2b3f1ce	13	Intermedijski ustvarjalec	Intermedijski ustvarjalci	Intermedijski ustvarjalka	umetnik
000f0000-55fd-1a72-6162-c527fe61d492	14	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	umetnik
000f0000-55fd-1a72-6972-f3e443655bdb	15	Vloga	Intermedijski ustvarjalci	Intermedijska ustvarjalka	igralec
000f0000-55fd-1a72-1069-df6760e90b22	16	Produkcija, mentorstvo	Produkcija, mentorstvo	Produkcija, mentorstvo	umetnik
000f0000-55fd-1a72-6ffd-f73bb16496c7	17	Tehnična podpora	Tehnična podpora	Tehnična podpora	tehnik
000f0000-55fd-1a72-898d-fb4a39ce059b	18	Inšpicient	Inšpicienti	Inšpicientka	inspicient
\.


--
-- TOC entry 2998 (class 0 OID 20186678)
-- Dependencies: 234
-- Data for Name: tipprogramskeenote; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipprogramskeenote (id, sifra, naziv, koprodukcija, maxfaktor, maxvsi) FROM stdin;
002b0000-55fd-1a72-769b-08b382936233	01	Velika predstava	f	1.00	1.00
002b0000-55fd-1a72-e41a-210d07625dab	02	Mala predstava	f	0.50	0.50
002b0000-55fd-1a72-8f04-d89eba784933	03	Mala koprodukcija	t	0.40	1.00
002b0000-55fd-1a72-cd32-d2a92b922eab	04	Srednja koprodukcija	t	0.70	2.00
002b0000-55fd-1a72-dc25-133fee5dc9a1	05	Velika koprodukcija	t	1.00	3.00
\.


--
-- TOC entry 2953 (class 0 OID 20186104)
-- Dependencies: 189
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 2940 (class 0 OID 20185951)
-- Dependencies: 176
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-55fd-1a73-4012-84cd4edde7c1	Konzolni	$2y$05$NS4xMjkyMTcwMzExMjAxROnLwuRdBriCiT9bDo9adH1vFSdcwv4BW	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-55fd-1a74-566d-d46c270f9483	testni uporabnik za inšpicienta	$2y$05$NS4xMjkyMTcwMzExMjAxROxkJ1B6xAXex6EZLIwJfWzRJ8DpfecFO	t	\N	\N	\N	ivo@ifigenija.si	\N	\N	\N
00010000-55fd-1a74-5180-48595e88c099	testni uporabnik za Tehničnega vodjo	$2y$05$NS4xMjkyMTcwMzExMjAxROu/kXWR9sP9oamkesKuxXLbxkCb387.G	t	\N	\N	\N	tona@ifigenija.si	\N	\N	\N
00010000-55fd-1a74-0fe2-b5b6075c9ec5	testni uporabnik za igralca	$2y$05$NS4xMjkyMTcwMzExMjAxRO/hLCgClfERRsfCAFYwxNCcFIVjP2982	t	\N	\N	\N	irena@ifigenija.si	\N	\N	\N
00010000-55fd-1a74-040c-1a9df34d2d78	testni uporabnik vnašalca termina storitev (TerminStoritve-vse)	$2y$05$NS4xMjkyMTcwMzExMjAxROT6.kTHqEq4.wa2SOnf124/N14m9qeP.	t	\N	\N	\N	tatjana@ifigenija.si	\N	\N	\N
00010000-55fd-1a74-984c-ebde3ef818c8	testni uporabnik, ki je inšpicient brez zapisov v TerminStoritve	$2y$05$NS4xMjkyMTcwMzExMjAxROHau47Dtb7CME5.nlWwBVM.nusFP.ra2	t	\N	\N	\N	joze@ifigenija.si	\N	\N	\N
00010000-55fd-1a74-fe64-62a2741424f3	testna uporabnica, ki je planerka	$2y$05$NS4xMjkyMTcwMzExMjAxRO.B/uJO3C7QRNhdX9Q2hTLQsSupj1V1S	t	\N	\N	\N	petra@ifigenija.si	\N	\N	\N
00010000-55fd-1a74-7438-869effdeefcb	testni uporabnik, ki dobi ifi-all vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROv2d7jqhaV/Mz3EIsKoi7UoFR.SDSMBm	t	\N	\N	\N	ali@ifigenija.si	\N	\N	\N
00010000-55fd-1a74-d2d6-a92e1b628705	testni uporabnik, ki dobi ifi-readall vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROYB9g.gnkufr1l/gWK6mkx.ySqrOWnJC	t	\N	\N	\N	berta@ifigenija.si	\N	\N	\N
00010000-55fd-1a74-8159-cd2c3350e836	testni uporabnik, ki dobi aaa-write dovoljenje	$2y$05$NS4xMjkyMTcwMzExMjAxRORujYObKX.DzpXVYbePkiJkHqg0/Ylya	t	\N	\N	\N	aaron@ifigenija.si	\N	\N	\N
00010000-55fd-1a74-b099-fd8042494101	testni uporabnik ki dobi vsa posamezna dovoljenja	$2y$05$NS4xMjkyMTcwMzExMjAxRO2ymwxVXTr7U4Ncdn.bN49E8rLw9Jg0O	t	\N	\N	\N	vesna@ifigenija.si	\N	\N	\N
00010000-55fd-1a73-9ea8-f50a3d62c39c	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 2989 (class 0 OID 20186483)
-- Dependencies: 225
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, producent_id, sifra, faza, naslov, podnaslov, delovninaslov, internacionalninaslov, naslovizvirnika, podnaslovizvirnika, datumzacstudija, stevilovaj, planiranostevilovaj, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, krstna, prvaslovenska, kratkinaslov, maticnioder_id) FROM stdin;
000e0000-55fd-1a74-8a35-f48c34141221	00160000-55fd-1a74-6b7d-5264cfc2f9a5	\N	00140000-55fd-1a72-3207-521f1ad48058	\N	0001	produkcija	Sen kresne noči		Sanje	\N	\N	\N	2016-02-01	\N	\N	2016-06-01	1	William  Shakespeare - Nebojša  Kavader	f	2				\N	f	\N	\N		00220000-55fd-1a74-e77b-d1e735b8b2aa
000e0000-55fd-1a74-3e72-4780de6da502	00160000-55fd-1a74-90a0-a3479fb61e0f	\N	00140000-55fd-1a72-129e-c4d211725ba3	\N	0002	predprodukcija-ideja	Smoletov vrt			\N	\N	\N	2016-01-01	\N	\N	2016-04-20	2	Berta   Hočevar	f	2				\N	f	\N	\N		00220000-55fd-1a74-91b0-858fb0937f22
000e0000-55fd-1a74-5ebf-5cf37d0290db	\N	\N	00140000-55fd-1a72-129e-c4d211725ba3	00190000-55fd-1a74-8df3-69fc61c4a1c5	0003	postprodukcija	Kisli maček			\N	\N	\N	2016-02-01	\N	\N	2016-04-20	2	\N	t	2				\N	f	\N	\N		00220000-55fd-1a74-e77b-d1e735b8b2aa
000e0000-55fd-1a74-f0da-17c5d8ee8ccc	\N	\N	00140000-55fd-1a72-129e-c4d211725ba3	00190000-55fd-1a74-8df3-69fc61c4a1c5	0004	postprodukcija	Vladimir			\N	\N	\N	2017-03-01	\N	\N	2017-04-20	2	\N	t	2				\N	f	\N	\N		00220000-55fd-1a74-e77b-d1e735b8b2aa
000e0000-55fd-1a74-6891-2483077b1fe3	\N	\N	00140000-55fd-1a72-129e-c4d211725ba3	00190000-55fd-1a74-8df3-69fc61c4a1c5	0005	postprodukcija	Španska princesa			\N	\N	\N	2017-04-01	\N	\N	2017-05-20	1	\N	f	1				\N	f	\N	\N		00220000-55fd-1a74-a475-cb75c089e480
000e0000-55fd-1a74-82e6-ecec10d7ae27	\N	\N	00140000-55fd-1a72-129e-c4d211725ba3	00190000-55fd-1a74-8df3-69fc61c4a1c5	0006	postprodukcija	Ne vemo datumov			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		00220000-55fd-1a74-a475-cb75c089e480
\.


--
-- TOC entry 2958 (class 0 OID 20186168)
-- Dependencies: 194
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, uprizoritev_id, vrsta, zaporedna, porocilo) FROM stdin;
00200000-55fd-1a74-3c39-3eb59454b0a1	000e0000-55fd-1a74-3e72-4780de6da502	\N	1	
00200000-55fd-1a74-0300-118c48a3b92b	000e0000-55fd-1a74-3e72-4780de6da502	\N	2	
00200000-55fd-1a74-7c02-2f9bfa3fab5b	000e0000-55fd-1a74-3e72-4780de6da502	\N	3	
00200000-55fd-1a74-f348-bdf791f6e418	000e0000-55fd-1a74-3e72-4780de6da502	\N	4	
00200000-55fd-1a74-0b1a-7d49fea8c603	000e0000-55fd-1a74-3e72-4780de6da502	\N	5	
\.


--
-- TOC entry 2972 (class 0 OID 20186296)
-- Dependencies: 208
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 2983 (class 0 OID 20186409)
-- Dependencies: 219
-- Data for Name: vrstastroska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstastroska (id, skupina, podskupina, naziv, opis) FROM stdin;
003b0000-55fd-1a72-224b-3a4758051ba8	1	0	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE
003b0000-55fd-1a72-4e65-3211c43fa86d	1	1	Storitve varovanja zgradb in prostorov	storitve varovanja zgradb in prostorov (npr. gasilci na predstavah)
003b0000-55fd-1a72-c3db-cab565d95c7e	1	2	Založniške in tiskarske storitve	založniške in tiskarske storitve
003b0000-55fd-1a72-d9e8-e15fa448ed37	1	3	Časopisi, revije, knjige in strokovna literatura	časopisi, revije, knjige in strokovna literatura
003b0000-55fd-1a72-2886-18bd8dfd834e	1	4	Stroški prevajalskih storitev	stroški prevajalskih storitev
003b0000-55fd-1a72-9ed0-960100edefc0	1	5	Stroški oglaševalskih storitev	stroški oglaševalskih storitev
003b0000-55fd-1a72-7d58-820f94703169	1	6	Izdatki za reprezentanco	izdatki za reprezentanco
003b0000-55fd-1a72-5072-6fa56e266c9f	2	0	POSEBNI MATERIAL IN STORITVE	POSEBNI MATERIAL IN STORITVE
003b0000-55fd-1a72-4214-de8a698a76b5	2	1	Drugi posebni material in storitve	drugi posebni material in storitve (npr. za instrumete - navedite)
003b0000-55fd-1a72-efad-24917723983c	2	2	Oprema predstave – stroški rekvizitov	Oprema predstave – stroški rekvizitov
003b0000-55fd-1a72-a725-4389c02e31e4	2	3	Oprema predstave – stroški kostumov	Oprema predstave – stroški kostumov
003b0000-55fd-1a72-9e85-2cc57021f47e	2	4	Oprema predstave – stroški scenske opreme	Oprema predstave – stroški scenske opreme
003b0000-55fd-1a72-0578-7931dad2f74f	2	5	Oprema predstave – stroški avdio in video opreme	Oprema predstave – stroški avdio in video opreme
003b0000-55fd-1a72-957a-3844526ded66	3	0	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE
003b0000-55fd-1a72-9b5f-555e7bcf5cf6	3	1	Poštnina in kurirske storitve	poštnina in kurirske storitve
003b0000-55fd-1a72-a675-2282eae3b91a	4	0	PREVOZNI STROŠKI IN STORITVE	PREVOZNI STROŠKI IN STORITVE
003b0000-55fd-1a72-0c9b-50791b6c82de	4	1	Goriva in maziva za prevozna sredstva	goriva in maziva za prevozna sredstva
003b0000-55fd-1a72-f158-3c713a3a2c74	4	2	Najem vozil in selitveni stroški	najem vozil in selitveni stroški
003b0000-55fd-1a72-05a8-c885f332649d	4	3	Drugi prevozni in transportni stroški 	drugi prevozni in transportni stroški (navedite)
003b0000-55fd-1a72-ddb0-2f7e446c32ba	5	0	IZDATKI ZA SLUŽBENA POTOVANJA	IZDATKI ZA SLUŽBENA POTOVANJA
003b0000-55fd-1a72-219b-ae4489baf62c	5	1	Dnevnice za službena potovanja v državi in tujini	dnevnice za službena potovanja v državi in tujini
003b0000-55fd-1a72-1e7e-1773b73d4199	5	2	Hotelske in restavra. storitve v državi in tujini	hotelske in restavra. storitve v državi in tujini
003b0000-55fd-1a72-ec0a-8dbc067879e6	5	3	Stroški prevoza v državi in tujini	stroški prevoza v državi in tujini
003b0000-55fd-1a72-fc93-a4c0162ab0a6	5	4	Drugi izdatki za službena potovanja	drugi izdatki za službena potovanja (navedite)
003b0000-55fd-1a72-ceda-f6c2db216b90	6	0	NAJEMNINE IN ZAKUPNINE	NAJEMNINE IN ZAKUPNINE
003b0000-55fd-1a72-9640-1de24e1a32d3	6	1	Druge najemnine, zakupnine in licenčnine	druge najemnine, zakupnine in licenčnine (npr. najem notnega materiala, instrumentov - navedite)
003b0000-55fd-1a72-4a6e-4768c38ee75f	7	0	DRUGI OPERATIVNI ODHODKI	DRUGI OPERATIVNI ODHODKI
003b0000-55fd-1a72-36e8-a557609e56d9	7	1	Izdatki za strok. izobraževanje zap.	izdatki za strok. izobraževanje zap.(vezani na program. enote)  
\.


--
-- TOC entry 3001 (class 0 OID 20186725)
-- Dependencies: 237
-- Data for Name: vrstazapisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstazapisa (id, oznaka, naziv, aktiven, znacka, ikona, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3000 (class 0 OID 20186697)
-- Dependencies: 236
-- Data for Name: zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapis (id, vrsta_id, datoteka_id, mapa_id, avtor_id, zaklenil_id, tip, zaklenjen, datumzaklepanja, identifier, subject, title, description, coverage, creator, language, date, publisher, relation, rights, source, upor, datknj, standard, lokacija) FROM stdin;
\.


--
-- TOC entry 3002 (class 0 OID 20186737)
-- Dependencies: 238
-- Data for Name: zapislastnik; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapislastnik (id, zapis_id, lastnik, classlastnika, datum, upor, datknj) FROM stdin;
\.


--
-- TOC entry 2979 (class 0 OID 20186368)
-- Dependencies: 215
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, sifra, status, delovnomesto, zacetek, konec, tip, delovnaobveza, malica, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci) FROM stdin;
00100000-55fd-1a74-8bf8-cab8f8eff9da	00090000-55fd-1a74-b958-9b09e173e528	01	A	Mojster	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55fd-1a74-4709-53410cbb825e	00090000-55fd-1a74-15d6-abdfb0c600f3	02	A	Igralec	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55fd-1a74-87ac-5c71cd3291bc	00090000-55fd-1a74-3b7e-fde114d3e1ee	03	A	Natakar	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55fd-1a74-7eb9-26a291fd9b5f	00090000-55fd-1a74-5a48-58b8d0c3bcd1	04	A	Mizar	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55fd-1a74-2744-f943d35c38b7	00090000-55fd-1a74-2346-90a9e0ea33dd	05	A	Šivilja	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55fd-1a74-3f0f-b0d62d96823f	00090000-55fd-1a74-58b1-ed85aedf62b7	06	A	Inšpicient	2010-02-01	2010-02-01	1	2		t	f	f	t
\.


--
-- TOC entry 2960 (class 0 OID 20186204)
-- Dependencies: 196
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id, oseba_id) FROM stdin;
\.


--
-- TOC entry 2988 (class 0 OID 20186473)
-- Dependencies: 224
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, sifra, naziv, opis) FROM stdin;
00140000-55fd-1a72-3207-521f1ad48058	01	Drama	drama (SURS 01)
00140000-55fd-1a72-4521-6124aab78b92	02	Opera	opera (SURS 02)
00140000-55fd-1a72-fce6-af7af94f79c4	03	Balet	balet (SURS 03)
00140000-55fd-1a72-5fef-9b601c403faa	04	Plesne prireditve	plesne prireditve (SURS 04)
00140000-55fd-1a72-a2f7-839885f40890	05	Lutkovno gledališče	lutkovno gledališče (SURS 05)
00140000-55fd-1a72-129e-c4d211725ba3	06	Raziskovalno gledališče	raziskovalno gledališče (SURS 06)
00140000-55fd-1a72-c476-a3e8ff8a6aca	07	Drugo	drugo (SURS 07)
\.


--
-- TOC entry 2978 (class 0 OID 20186358)
-- Dependencies: 214
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, sifra, naziv, opis) FROM stdin;
\.


--
-- TOC entry 2478 (class 2606 OID 20186005)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2661 (class 2606 OID 20186532)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2657 (class 2606 OID 20186522)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2620 (class 2606 OID 20186392)
-- Name: avtorbesedila_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT avtorbesedila_pkey PRIMARY KEY (id);


--
-- TOC entry 2631 (class 2606 OID 20186432)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2718 (class 2606 OID 20186777)
-- Name: datoteka_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT datoteka_pkey PRIMARY KEY (id);


--
-- TOC entry 2532 (class 2606 OID 20186193)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2547 (class 2606 OID 20186214)
-- Name: dogodeksplosni_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodeksplosni
    ADD CONSTRAINT dogodeksplosni_pkey PRIMARY KEY (id);


--
-- TOC entry 2694 (class 2606 OID 20186695)
-- Name: drugivir_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT drugivir_pkey PRIMARY KEY (id);


--
-- TOC entry 2512 (class 2606 OID 20186130)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2668 (class 2606 OID 20186587)
-- Name: enotaprograma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT enotaprograma_pkey PRIMARY KEY (id);


--
-- TOC entry 2605 (class 2606 OID 20186354)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2526 (class 2606 OID 20186166)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2520 (class 2606 OID 20186144)
-- Name: kontaktnaoseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT kontaktnaoseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2569 (class 2606 OID 20186261)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2712 (class 2606 OID 20186754)
-- Name: mapa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT mapa_pkey PRIMARY KEY (id);


--
-- TOC entry 2716 (class 2606 OID 20186761)
-- Name: mapa_zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT mapa_zapis_pkey PRIMARY KEY (mapa_id, zapis_id);


--
-- TOC entry 2723 (class 2606 OID 20186785)
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
-- TOC entry 2581 (class 2606 OID 20186288)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2505 (class 2606 OID 20186102)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2482 (class 2606 OID 20186014)
-- Name: optionvalue_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT optionvalue_pkey PRIMARY KEY (id);


--
-- TOC entry 2485 (class 2606 OID 20186038)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2476 (class 2606 OID 20185994)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2469 (class 2606 OID 20185979)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2584 (class 2606 OID 20186294)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2598 (class 2606 OID 20186330)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2643 (class 2606 OID 20186468)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2494 (class 2606 OID 20186066)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2502 (class 2606 OID 20186090)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2678 (class 2606 OID 20186648)
-- Name: postavkacdve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkacdve
    ADD CONSTRAINT postavkacdve_pkey PRIMARY KEY (id);


--
-- TOC entry 2573 (class 2606 OID 20186267)
-- Name: postavkaracuna_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT postavkaracuna_pkey PRIMARY KEY (id);


--
-- TOC entry 2500 (class 2606 OID 20186080)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2524 (class 2606 OID 20186154)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2579 (class 2606 OID 20186279)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2682 (class 2606 OID 20186657)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2684 (class 2606 OID 20186665)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2675 (class 2606 OID 20186635)
-- Name: programdela_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT programdela_pkey PRIMARY KEY (id);


--
-- TOC entry 2689 (class 2606 OID 20186676)
-- Name: programskaenotasklopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT programskaenotasklopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2591 (class 2606 OID 20186312)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2567 (class 2606 OID 20186252)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2561 (class 2606 OID 20186243)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2638 (class 2606 OID 20186456)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2618 (class 2606 OID 20186385)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2461 (class 2606 OID 20185950)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2596 (class 2606 OID 20186321)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2467 (class 2606 OID 20185968)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2471 (class 2606 OID 20185988)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2603 (class 2606 OID 20186339)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2575 (class 2606 OID 20186274)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2549 (class 2606 OID 20186223)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2458 (class 2606 OID 20185938)
-- Name: stevilcenje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenje
    ADD CONSTRAINT stevilcenje_pkey PRIMARY KEY (id);


--
-- TOC entry 2455 (class 2606 OID 20185926)
-- Name: stevilcenjekonfig_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT stevilcenjekonfig_pkey PRIMARY KEY (id);


--
-- TOC entry 2452 (class 2606 OID 20185920)
-- Name: stevilcenjestanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjestanje
    ADD CONSTRAINT stevilcenjestanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2627 (class 2606 OID 20186405)
-- Name: strosekuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT strosekuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2491 (class 2606 OID 20186047)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2555 (class 2606 OID 20186234)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2634 (class 2606 OID 20186443)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2691 (class 2606 OID 20186688)
-- Name: tipprogramskeenote_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipprogramskeenote
    ADD CONSTRAINT tipprogramskeenote_pkey PRIMARY KEY (id);


--
-- TOC entry 2510 (class 2606 OID 20186115)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2463 (class 2606 OID 20185963)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2655 (class 2606 OID 20186501)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2530 (class 2606 OID 20186176)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2587 (class 2606 OID 20186302)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2629 (class 2606 OID 20186417)
-- Name: vrstastroska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstastroska
    ADD CONSTRAINT vrstastroska_pkey PRIMARY KEY (id);


--
-- TOC entry 2705 (class 2606 OID 20186735)
-- Name: vrstazapisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstazapisa
    ADD CONSTRAINT vrstazapisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2702 (class 2606 OID 20186719)
-- Name: zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT zapis_pkey PRIMARY KEY (id);


--
-- TOC entry 2708 (class 2606 OID 20186743)
-- Name: zapislastnik_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT zapislastnik_pkey PRIMARY KEY (id);


--
-- TOC entry 2614 (class 2606 OID 20186376)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2545 (class 2606 OID 20186208)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2647 (class 2606 OID 20186481)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2611 (class 2606 OID 20186366)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2533 (class 1259 OID 20186202)
-- Name: dogodki_konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_konec ON dogodek USING btree (konec);


--
-- TOC entry 2534 (class 1259 OID 20186203)
-- Name: dogodki_razred; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_razred ON dogodek USING btree (razred);


--
-- TOC entry 2535 (class 1259 OID 20186201)
-- Name: dogodki_zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2536 (class 1259 OID 20186200)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2537 (class 1259 OID 20186199)
-- Name: idx_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2623 (class 1259 OID 20186406)
-- Name: idx_11ffe6e05c75296c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e05c75296c ON strosekuprizoritve USING btree (vrstastroska_id);


--
-- TOC entry 2624 (class 1259 OID 20186407)
-- Name: idx_11ffe6e062b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e062b4ffca ON strosekuprizoritve USING btree (uprizoritev_id);


--
-- TOC entry 2625 (class 1259 OID 20186408)
-- Name: idx_11ffe6e06beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e06beede51 ON strosekuprizoritve USING btree (popa_id);


--
-- TOC entry 2709 (class 1259 OID 20186756)
-- Name: idx_14a5d6d3727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d3727aca70 ON mapa USING btree (parent_id);


--
-- TOC entry 2710 (class 1259 OID 20186755)
-- Name: idx_14a5d6d38a4a6c12; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d38a4a6c12 ON mapa USING btree (lastnik_id);


--
-- TOC entry 2492 (class 1259 OID 20186068)
-- Name: idx_1c7adba5ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba5ee4b985a ON popa USING btree (drzava_id);


--
-- TOC entry 2582 (class 1259 OID 20186295)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2696 (class 1259 OID 20186723)
-- Name: idx_1ed92829253c4123; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829253c4123 ON zapis USING btree (avtor_id);


--
-- TOC entry 2697 (class 1259 OID 20186722)
-- Name: idx_1ed9282957ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282957ed422f ON zapis USING btree (mapa_id);


--
-- TOC entry 2698 (class 1259 OID 20186724)
-- Name: idx_1ed9282987ff3295; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282987ff3295 ON zapis USING btree (zaklenil_id);


--
-- TOC entry 2699 (class 1259 OID 20186721)
-- Name: idx_1ed92829a54dbb1f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829a54dbb1f ON zapis USING btree (datoteka_id);


--
-- TOC entry 2700 (class 1259 OID 20186720)
-- Name: idx_1ed92829ef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829ef943358 ON zapis USING btree (vrsta_id);


--
-- TOC entry 2576 (class 1259 OID 20186281)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2577 (class 1259 OID 20186280)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2528 (class 1259 OID 20186177)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2606 (class 1259 OID 20186355)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2607 (class 1259 OID 20186357)
-- Name: idx_23aeb9586b361365; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9586b361365 ON funkcija USING btree (tipfunkcije_id);


--
-- TOC entry 2608 (class 1259 OID 20186356)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2517 (class 1259 OID 20186146)
-- Name: idx_2942b10710389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b10710389148 ON kontaktnaoseba USING btree (oseba_id);


--
-- TOC entry 2518 (class 1259 OID 20186145)
-- Name: idx_2942b1076beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b1076beede51 ON kontaktnaoseba USING btree (popa_id);


--
-- TOC entry 2687 (class 1259 OID 20186677)
-- Name: idx_2d901816d6bc69d6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2d901816d6bc69d6 ON programskaenotasklopa USING btree (programrazno_id);


--
-- TOC entry 2639 (class 1259 OID 20186470)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2640 (class 1259 OID 20186471)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2641 (class 1259 OID 20186472)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2706 (class 1259 OID 20186744)
-- Name: idx_2eaff9dcaf91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2eaff9dcaf91ecd ON zapislastnik USING btree (zapis_id);


--
-- TOC entry 2648 (class 1259 OID 20186506)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2649 (class 1259 OID 20186503)
-- Name: idx_344a77a7c3b0d59; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a7c3b0d59 ON uprizoritev USING btree (maticnioder_id);


--
-- TOC entry 2650 (class 1259 OID 20186507)
-- Name: idx_344a77a853a965c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a853a965c ON uprizoritev USING btree (producent_id);


--
-- TOC entry 2651 (class 1259 OID 20186505)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2652 (class 1259 OID 20186504)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2507 (class 1259 OID 20186117)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2508 (class 1259 OID 20186116)
-- Name: idx_37f6541a6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a6beede51 ON trr USING btree (popa_id);


--
-- TOC entry 2483 (class 1259 OID 20186041)
-- Name: idx_466966d769e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_466966d769e8d4 ON oseba USING btree (naslov_id);


--
-- TOC entry 2594 (class 1259 OID 20186322)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2473 (class 1259 OID 20185995)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2474 (class 1259 OID 20185996)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2599 (class 1259 OID 20186342)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2600 (class 1259 OID 20186341)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2601 (class 1259 OID 20186340)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2521 (class 1259 OID 20186155)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2522 (class 1259 OID 20186156)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2453 (class 1259 OID 20185928)
-- Name: idx_6054e804ff55f926; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_6054e804ff55f926 ON stevilcenjekonfig USING btree (stevilcenje_id);


--
-- TOC entry 2556 (class 1259 OID 20186247)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2557 (class 1259 OID 20186245)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2558 (class 1259 OID 20186244)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2559 (class 1259 OID 20186246)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2464 (class 1259 OID 20185969)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2465 (class 1259 OID 20185970)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2585 (class 1259 OID 20186303)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2719 (class 1259 OID 20186778)
-- Name: idx_781826c67e3c61f9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_781826c67e3c61f9 ON datoteka USING btree (owner_id);


--
-- TOC entry 2621 (class 1259 OID 20186394)
-- Name: idx_7ab77b7910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7ab77b7910389148 ON avtorbesedila USING btree (oseba_id);


--
-- TOC entry 2622 (class 1259 OID 20186393)
-- Name: idx_7ab77b79f35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7ab77b79f35157b1 ON avtorbesedila USING btree (besedilo_id);


--
-- TOC entry 2720 (class 1259 OID 20186786)
-- Name: idx_7adc957157ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc957157ed422f ON mapaacl USING btree (mapa_id);


--
-- TOC entry 2721 (class 1259 OID 20186787)
-- Name: idx_7adc9571fa6311ef; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc9571fa6311ef ON mapaacl USING btree (perm_id);


--
-- TOC entry 2571 (class 1259 OID 20186268)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2615 (class 1259 OID 20186386)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2616 (class 1259 OID 20186387)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2669 (class 1259 OID 20186592)
-- Name: idx_8787a0e54ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e54ae1cd1c ON enotaprograma USING btree (gostitelj_id);


--
-- TOC entry 2670 (class 1259 OID 20186591)
-- Name: idx_8787a0e55d0da56c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e55d0da56c ON enotaprograma USING btree (drzavagostovanja_id);


--
-- TOC entry 2671 (class 1259 OID 20186588)
-- Name: idx_8787a0e562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e562b4ffca ON enotaprograma USING btree (uprizoritev_id);


--
-- TOC entry 2672 (class 1259 OID 20186589)
-- Name: idx_8787a0e57222d84b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e57222d84b ON enotaprograma USING btree (tipprogramskeenote_id);


--
-- TOC entry 2673 (class 1259 OID 20186590)
-- Name: idx_8787a0e5771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e5771ec7bd ON enotaprograma USING btree (program_dela_id);


--
-- TOC entry 2496 (class 1259 OID 20186082)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2497 (class 1259 OID 20186081)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2498 (class 1259 OID 20186083)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2588 (class 1259 OID 20186316)
-- Name: idx_952dd21969e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd21969e8d4 ON prostor USING btree (naslov_id);


--
-- TOC entry 2589 (class 1259 OID 20186315)
-- Name: idx_952dd2196beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd2196beede51 ON prostor USING btree (popa_id);


--
-- TOC entry 2679 (class 1259 OID 20186658)
-- Name: idx_97af082e38c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e38c06eb ON produkcijadelitev USING btree (enotaprograma_id);


--
-- TOC entry 2680 (class 1259 OID 20186659)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2662 (class 1259 OID 20186536)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2663 (class 1259 OID 20186537)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2664 (class 1259 OID 20186534)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2665 (class 1259 OID 20186535)
-- Name: idx_a4b7244fa4976613; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fa4976613 ON alternacija USING btree (zaposlitev_id);


--
-- TOC entry 2612 (class 1259 OID 20186377)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2562 (class 1259 OID 20186256)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2563 (class 1259 OID 20186255)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2564 (class 1259 OID 20186253)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2565 (class 1259 OID 20186254)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2658 (class 1259 OID 20186524)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2659 (class 1259 OID 20186523)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2527 (class 1259 OID 20186167)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2676 (class 1259 OID 20186649)
-- Name: idx_dba42fe79e3adf2c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_dba42fe79e3adf2c ON postavkacdve USING btree (programdela_id);


--
-- TOC entry 2695 (class 1259 OID 20186696)
-- Name: idx_e7d4cf2638c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e7d4cf2638c06eb ON drugivir USING btree (enotaprograma_id);


--
-- TOC entry 2713 (class 1259 OID 20186762)
-- Name: idx_e9f8ee8257ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee8257ed422f ON mapa_zapis USING btree (mapa_id);


--
-- TOC entry 2714 (class 1259 OID 20186763)
-- Name: idx_e9f8ee82af91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee82af91ecd ON mapa_zapis USING btree (zapis_id);


--
-- TOC entry 2479 (class 1259 OID 20186016)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2480 (class 1259 OID 20186015)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2488 (class 1259 OID 20186048)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2489 (class 1259 OID 20186049)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2543 (class 1259 OID 20186209)
-- Name: idx_f44a386d10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_f44a386d10389148 ON zasedenost USING btree (oseba_id);


--
-- TOC entry 2551 (class 1259 OID 20186237)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2552 (class 1259 OID 20186236)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2553 (class 1259 OID 20186235)
-- Name: idx_fef7d84ba81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84ba81ccef6 ON terminstoritve USING btree (dogodek_id);


--
-- TOC entry 2538 (class 1259 OID 20186195)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2539 (class 1259 OID 20186196)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2540 (class 1259 OID 20186194)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2541 (class 1259 OID 20186198)
-- Name: uniq_11e93b5dbbc7a989; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dbbc7a989 ON dogodek USING btree (dogodek_splosni_id);


--
-- TOC entry 2542 (class 1259 OID 20186197)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2495 (class 1259 OID 20186067)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2513 (class 1259 OID 20186131)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2514 (class 1259 OID 20186133)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2515 (class 1259 OID 20186132)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2516 (class 1259 OID 20186134)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2570 (class 1259 OID 20186262)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2644 (class 1259 OID 20186469)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2653 (class 1259 OID 20186502)
-- Name: uniq_344a77a559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_344a77a559828a3 ON uprizoritev USING btree (sifra);


--
-- TOC entry 2635 (class 1259 OID 20186444)
-- Name: uniq_3f50510d559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d559828a3 ON tipfunkcije USING btree (sifra);


--
-- TOC entry 2636 (class 1259 OID 20186445)
-- Name: uniq_3f50510d55cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d55cca980 ON tipfunkcije USING btree (ime);


--
-- TOC entry 2486 (class 1259 OID 20186039)
-- Name: uniq_466966d7559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7559828a3 ON oseba USING btree (sifra);


--
-- TOC entry 2487 (class 1259 OID 20186040)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2609 (class 1259 OID 20186367)
-- Name: uniq_5216fcb0559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5216fcb0559828a3 ON zvrstuprizoritve USING btree (sifra);


--
-- TOC entry 2459 (class 1259 OID 20185939)
-- Name: uniq_5a434fbc559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5a434fbc559828a3 ON stevilcenje USING btree (sifra);


--
-- TOC entry 2506 (class 1259 OID 20186103)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2456 (class 1259 OID 20185927)
-- Name: uniq_6054e804889a7556; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_6054e804889a7556 ON stevilcenjekonfig USING btree (dok);


--
-- TOC entry 2692 (class 1259 OID 20186689)
-- Name: uniq_7d834df4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_7d834df4559828a3 ON tipprogramskeenote USING btree (sifra);


--
-- TOC entry 2592 (class 1259 OID 20186314)
-- Name: uniq_952dd21937854736; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21937854736 ON prostor USING btree (naziv);


--
-- TOC entry 2593 (class 1259 OID 20186313)
-- Name: uniq_952dd219559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd219559828a3 ON prostor USING btree (sifra);


--
-- TOC entry 2666 (class 1259 OID 20186533)
-- Name: uniq_a4b7244f559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a4b7244f559828a3 ON alternacija USING btree (sifra);


--
-- TOC entry 2503 (class 1259 OID 20186091)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2645 (class 1259 OID 20186482)
-- Name: uniq_cede8e36559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_cede8e36559828a3 ON zvrstsurs USING btree (sifra);


--
-- TOC entry 2703 (class 1259 OID 20186736)
-- Name: uniq_de1c8aa1d55226c7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_de1c8aa1d55226c7 ON vrstazapisa USING btree (oznaka);


--
-- TOC entry 2685 (class 1259 OID 20186666)
-- Name: uniq_e6fc2028559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc2028559828a3 ON produkcijskahisa USING btree (sifra);


--
-- TOC entry 2686 (class 1259 OID 20186667)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2632 (class 1259 OID 20186433)
-- Name: uniq_ec773670ca2e5fcb; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ec773670ca2e5fcb ON besedilo USING btree (stevilka);


--
-- TOC entry 2550 (class 1259 OID 20186224)
-- Name: uniq_ecc8f8c5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ecc8f8c5559828a3 ON sezona USING btree (sifra);


--
-- TOC entry 2472 (class 1259 OID 20185989)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2752 (class 2606 OID 20186908)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2751 (class 2606 OID 20186913)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2747 (class 2606 OID 20186933)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2753 (class 2606 OID 20186903)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2749 (class 2606 OID 20186923)
-- Name: fk_11e93b5dbbc7a989; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dbbc7a989 FOREIGN KEY (dogodek_splosni_id) REFERENCES dogodeksplosni(id);


--
-- TOC entry 2748 (class 2606 OID 20186928)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2750 (class 2606 OID 20186918)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2788 (class 2606 OID 20187098)
-- Name: fk_11ffe6e05c75296c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e05c75296c FOREIGN KEY (vrstastroska_id) REFERENCES vrstastroska(id);


--
-- TOC entry 2787 (class 2606 OID 20187103)
-- Name: fk_11ffe6e062b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e062b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2786 (class 2606 OID 20187108)
-- Name: fk_11ffe6e06beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e06beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2820 (class 2606 OID 20187273)
-- Name: fk_14a5d6d3727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d3727aca70 FOREIGN KEY (parent_id) REFERENCES mapa(id);


--
-- TOC entry 2821 (class 2606 OID 20187268)
-- Name: fk_14a5d6d38a4a6c12; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d38a4a6c12 FOREIGN KEY (lastnik_id) REFERENCES uporabniki(id);


--
-- TOC entry 2735 (class 2606 OID 20186843)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2770 (class 2606 OID 20187018)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2815 (class 2606 OID 20187253)
-- Name: fk_1ed92829253c4123; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829253c4123 FOREIGN KEY (avtor_id) REFERENCES uporabniki(id);


--
-- TOC entry 2816 (class 2606 OID 20187248)
-- Name: fk_1ed9282957ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282957ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2814 (class 2606 OID 20187258)
-- Name: fk_1ed9282987ff3295; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282987ff3295 FOREIGN KEY (zaklenil_id) REFERENCES uporabniki(id);


--
-- TOC entry 2817 (class 2606 OID 20187243)
-- Name: fk_1ed92829a54dbb1f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829a54dbb1f FOREIGN KEY (datoteka_id) REFERENCES datoteka(id);


--
-- TOC entry 2818 (class 2606 OID 20187238)
-- Name: fk_1ed92829ef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829ef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstazapisa(id);


--
-- TOC entry 2768 (class 2606 OID 20187013)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2769 (class 2606 OID 20187008)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2746 (class 2606 OID 20186898)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2780 (class 2606 OID 20187058)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2778 (class 2606 OID 20187068)
-- Name: fk_23aeb9586b361365; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9586b361365 FOREIGN KEY (tipfunkcije_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2779 (class 2606 OID 20187063)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2741 (class 2606 OID 20186878)
-- Name: fk_2942b10710389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b10710389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2742 (class 2606 OID 20186873)
-- Name: fk_2942b1076beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b1076beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2766 (class 2606 OID 20186998)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2812 (class 2606 OID 20187228)
-- Name: fk_2d901816d6bc69d6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT fk_2d901816d6bc69d6 FOREIGN KEY (programrazno_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2791 (class 2606 OID 20187113)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2790 (class 2606 OID 20187118)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2789 (class 2606 OID 20187123)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 2819 (class 2606 OID 20187263)
-- Name: fk_2eaff9dcaf91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT fk_2eaff9dcaf91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id);


--
-- TOC entry 2793 (class 2606 OID 20187143)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2796 (class 2606 OID 20187128)
-- Name: fk_344a77a7c3b0d59; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a7c3b0d59 FOREIGN KEY (maticnioder_id) REFERENCES prostor(id);


--
-- TOC entry 2792 (class 2606 OID 20187148)
-- Name: fk_344a77a853a965c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a853a965c FOREIGN KEY (producent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2794 (class 2606 OID 20187138)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2795 (class 2606 OID 20187133)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2739 (class 2606 OID 20186868)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2740 (class 2606 OID 20186863)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2731 (class 2606 OID 20186828)
-- Name: fk_466966d769e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d769e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2732 (class 2606 OID 20186823)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2774 (class 2606 OID 20187038)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2728 (class 2606 OID 20186803)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2727 (class 2606 OID 20186808)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2775 (class 2606 OID 20187053)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2776 (class 2606 OID 20187048)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2777 (class 2606 OID 20187043)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2744 (class 2606 OID 20186883)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2743 (class 2606 OID 20186888)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2724 (class 2606 OID 20186788)
-- Name: fk_6054e804ff55f926; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT fk_6054e804ff55f926 FOREIGN KEY (stevilcenje_id) REFERENCES stevilcenje(id);


--
-- TOC entry 2758 (class 2606 OID 20186973)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2760 (class 2606 OID 20186963)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2761 (class 2606 OID 20186958)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2759 (class 2606 OID 20186968)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2726 (class 2606 OID 20186793)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2725 (class 2606 OID 20186798)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2771 (class 2606 OID 20187023)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2824 (class 2606 OID 20187288)
-- Name: fk_781826c67e3c61f9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT fk_781826c67e3c61f9 FOREIGN KEY (owner_id) REFERENCES uporabniki(id);


--
-- TOC entry 2784 (class 2606 OID 20187093)
-- Name: fk_7ab77b7910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT fk_7ab77b7910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2785 (class 2606 OID 20187088)
-- Name: fk_7ab77b79f35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT fk_7ab77b79f35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2826 (class 2606 OID 20187293)
-- Name: fk_7adc957157ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc957157ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2825 (class 2606 OID 20187298)
-- Name: fk_7adc9571fa6311ef; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc9571fa6311ef FOREIGN KEY (perm_id) REFERENCES permission(id);


--
-- TOC entry 2767 (class 2606 OID 20187003)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2783 (class 2606 OID 20187078)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2782 (class 2606 OID 20187083)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2803 (class 2606 OID 20187203)
-- Name: fk_8787a0e54ae1cd1c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e54ae1cd1c FOREIGN KEY (gostitelj_id) REFERENCES popa(id);


--
-- TOC entry 2804 (class 2606 OID 20187198)
-- Name: fk_8787a0e55d0da56c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e55d0da56c FOREIGN KEY (drzavagostovanja_id) REFERENCES drza(id);


--
-- TOC entry 2807 (class 2606 OID 20187183)
-- Name: fk_8787a0e562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2806 (class 2606 OID 20187188)
-- Name: fk_8787a0e57222d84b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e57222d84b FOREIGN KEY (tipprogramskeenote_id) REFERENCES tipprogramskeenote(id);


--
-- TOC entry 2805 (class 2606 OID 20187193)
-- Name: fk_8787a0e5771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e5771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2737 (class 2606 OID 20186853)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2738 (class 2606 OID 20186848)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2736 (class 2606 OID 20186858)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2772 (class 2606 OID 20187033)
-- Name: fk_952dd21969e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd21969e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2773 (class 2606 OID 20187028)
-- Name: fk_952dd2196beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd2196beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2810 (class 2606 OID 20187213)
-- Name: fk_97af082e38c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e38c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2809 (class 2606 OID 20187218)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2800 (class 2606 OID 20187173)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2799 (class 2606 OID 20187178)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2802 (class 2606 OID 20187163)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 2801 (class 2606 OID 20187168)
-- Name: fk_a4b7244fa4976613; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fa4976613 FOREIGN KEY (zaposlitev_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2781 (class 2606 OID 20187073)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2762 (class 2606 OID 20186993)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2763 (class 2606 OID 20186988)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2765 (class 2606 OID 20186978)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2764 (class 2606 OID 20186983)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2797 (class 2606 OID 20187158)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2798 (class 2606 OID 20187153)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2745 (class 2606 OID 20186893)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2808 (class 2606 OID 20187208)
-- Name: fk_dba42fe79e3adf2c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkacdve
    ADD CONSTRAINT fk_dba42fe79e3adf2c FOREIGN KEY (programdela_id) REFERENCES programdela(id);


--
-- TOC entry 2811 (class 2606 OID 20187223)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2813 (class 2606 OID 20187233)
-- Name: fk_e7d4cf2638c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT fk_e7d4cf2638c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2823 (class 2606 OID 20187278)
-- Name: fk_e9f8ee8257ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee8257ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id) ON DELETE CASCADE;


--
-- TOC entry 2822 (class 2606 OID 20187283)
-- Name: fk_e9f8ee82af91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee82af91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id) ON DELETE CASCADE;


--
-- TOC entry 2729 (class 2606 OID 20186818)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2730 (class 2606 OID 20186813)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2734 (class 2606 OID 20186833)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2733 (class 2606 OID 20186838)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2754 (class 2606 OID 20186938)
-- Name: fk_f44a386d10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT fk_f44a386d10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2755 (class 2606 OID 20186953)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2756 (class 2606 OID 20186948)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2757 (class 2606 OID 20186943)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- Completed on 2015-09-19 10:19:02 CEST

--
-- PostgreSQL database dump complete
--

