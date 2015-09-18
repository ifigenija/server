--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.9
-- Dumped by pg_dump version 9.3.9
-- Started on 2015-09-17 17:48:20 CEST

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- TOC entry 242 (class 3079 OID 11789)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 3002 (class 0 OID 0)
-- Dependencies: 242
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_with_oids = false;

--
-- TOC entry 181 (class 1259 OID 19945551)
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
-- TOC entry 226 (class 1259 OID 19946073)
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
-- TOC entry 225 (class 1259 OID 19946056)
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
-- TOC entry 219 (class 1259 OID 19945964)
-- Name: besedilo; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE besedilo (
    id uuid NOT NULL,
    stevilka character varying(255) NOT NULL,
    naslov character varying(255) DEFAULT NULL::character varying,
    avtor character varying(255) DEFAULT NULL::character varying,
    podnaslov character varying(255) DEFAULT NULL::character varying,
    jezik character varying(255) DEFAULT NULL::character varying,
    naslovizvirnika character varying(255) DEFAULT NULL::character varying,
    internacionalninaslov character varying(255) DEFAULT NULL::character varying,
    datumprejema date,
    moskevloge integer,
    zenskevloge integer,
    prevajalec character varying(255) DEFAULT NULL::character varying,
    povzetekvsebine text,
    letoizida integer,
    krajizida character varying(255) DEFAULT NULL::character varying,
    zaloznik character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 240 (class 1259 OID 19946312)
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
-- TOC entry 195 (class 1259 OID 19945732)
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
-- TOC entry 197 (class 1259 OID 19945763)
-- Name: dogodeksplosni; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodeksplosni (
    id uuid NOT NULL
);


--
-- TOC entry 234 (class 1259 OID 19946238)
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
-- TOC entry 190 (class 1259 OID 19945672)
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
-- TOC entry 227 (class 1259 OID 19946086)
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
-- TOC entry 213 (class 1259 OID 19945896)
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
-- TOC entry 193 (class 1259 OID 19945711)
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
-- TOC entry 191 (class 1259 OID 19945689)
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
-- TOC entry 202 (class 1259 OID 19945810)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 238 (class 1259 OID 19946293)
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
-- TOC entry 239 (class 1259 OID 19946305)
-- Name: mapa_zapis; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE mapa_zapis (
    mapa_id uuid NOT NULL,
    zapis_id uuid NOT NULL
);


--
-- TOC entry 241 (class 1259 OID 19946327)
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
-- TOC entry 170 (class 1259 OID 19921951)
-- Name: migrations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE migrations (
    version character varying(255) NOT NULL
);


--
-- TOC entry 206 (class 1259 OID 19945835)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 188 (class 1259 OID 19945646)
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
-- TOC entry 182 (class 1259 OID 19945560)
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
-- TOC entry 183 (class 1259 OID 19945571)
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
-- TOC entry 178 (class 1259 OID 19945525)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 180 (class 1259 OID 19945544)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 207 (class 1259 OID 19945842)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 211 (class 1259 OID 19945876)
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
-- TOC entry 222 (class 1259 OID 19946005)
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
-- TOC entry 185 (class 1259 OID 19945604)
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
-- TOC entry 187 (class 1259 OID 19945638)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 229 (class 1259 OID 19946184)
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
-- TOC entry 203 (class 1259 OID 19945816)
-- Name: postavkaracuna; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE postavkaracuna (
    id uuid NOT NULL,
    racun_id uuid
);


--
-- TOC entry 186 (class 1259 OID 19945623)
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
-- TOC entry 192 (class 1259 OID 19945701)
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
-- TOC entry 205 (class 1259 OID 19945828)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 230 (class 1259 OID 19946198)
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
-- TOC entry 231 (class 1259 OID 19946208)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    sifra character varying(4) NOT NULL,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 228 (class 1259 OID 19946141)
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
-- TOC entry 232 (class 1259 OID 19946216)
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
-- TOC entry 209 (class 1259 OID 19945857)
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
-- TOC entry 201 (class 1259 OID 19945801)
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
-- TOC entry 200 (class 1259 OID 19945791)
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
-- TOC entry 221 (class 1259 OID 19945994)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying,
    status character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 216 (class 1259 OID 19945931)
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
-- TOC entry 175 (class 1259 OID 19945496)
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
-- TOC entry 174 (class 1259 OID 19945494)
-- Name: revizije_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE revizije_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3003 (class 0 OID 0)
-- Dependencies: 174
-- Name: revizije_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE revizije_id_seq OWNED BY revizije.id;


--
-- TOC entry 210 (class 1259 OID 19945870)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 179 (class 1259 OID 19945534)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 177 (class 1259 OID 19945518)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 212 (class 1259 OID 19945884)
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
-- TOC entry 204 (class 1259 OID 19945822)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 198 (class 1259 OID 19945768)
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
-- TOC entry 173 (class 1259 OID 19945483)
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
-- TOC entry 172 (class 1259 OID 19945475)
-- Name: stevilcenjekonfig; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjekonfig (
    id uuid NOT NULL,
    stevilcenje_id uuid,
    dok character varying(100) DEFAULT NULL::character varying
);


--
-- TOC entry 171 (class 1259 OID 19945470)
-- Name: stevilcenjestanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjestanje (
    id uuid NOT NULL,
    objid uuid NOT NULL,
    leto integer NOT NULL,
    stevilka integer
);


--
-- TOC entry 217 (class 1259 OID 19945941)
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
-- TOC entry 184 (class 1259 OID 19945596)
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
-- TOC entry 199 (class 1259 OID 19945778)
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
-- TOC entry 220 (class 1259 OID 19945982)
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
-- TOC entry 233 (class 1259 OID 19946226)
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
-- TOC entry 189 (class 1259 OID 19945658)
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
-- TOC entry 176 (class 1259 OID 19945505)
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
-- TOC entry 224 (class 1259 OID 19946031)
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
-- TOC entry 194 (class 1259 OID 19945722)
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
-- TOC entry 208 (class 1259 OID 19945849)
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
-- TOC entry 218 (class 1259 OID 19945955)
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
-- TOC entry 236 (class 1259 OID 19946273)
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
-- TOC entry 235 (class 1259 OID 19946245)
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
-- TOC entry 237 (class 1259 OID 19946285)
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
-- TOC entry 215 (class 1259 OID 19945921)
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
-- TOC entry 196 (class 1259 OID 19945758)
-- Name: zasedenost; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zasedenost (
    id uuid NOT NULL
);


--
-- TOC entry 223 (class 1259 OID 19946021)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 214 (class 1259 OID 19945911)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 2187 (class 2604 OID 19945499)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 2935 (class 0 OID 19945551)
-- Dependencies: 181
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
\.


--
-- TOC entry 2980 (class 0 OID 19946073)
-- Dependencies: 226
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, zaposlitev_id, oseba_id, pogodba_id, sifra, zaposlen, zacetek, konec, opomba, sort, privzeti, aktivna, imapogodbo, pomembna) FROM stdin;
000c0000-55fa-e0c3-fbe5-e786ee6c438c	000d0000-55fa-e0c2-66d6-95c0daa0ddb8	\N	00090000-55fa-e0c2-9c47-50bf5654b0ad	000b0000-55fa-e0c2-8587-30568d5c2329	0001	f	\N	\N	\N	3	t	\N	t	t
000c0000-55fa-e0c3-44eb-e30f0e8ef262	000d0000-55fa-e0c2-3a58-c9f83ef58577	00100000-55fa-e0c3-b83b-f16e88cd9214	00090000-55fa-e0c2-9cd1-b1af0e9d3d15	\N	0002	t	2016-01-01	\N	\N	8	t	\N	f	f
000c0000-55fa-e0c3-e7c4-f2e1cd8d592b	000d0000-55fa-e0c2-5e32-5b46c23d8d63	00100000-55fa-e0c3-fee5-ba4d1a805df5	00090000-55fa-e0c2-b49d-93d7d37cbf5e	\N	0003	t	\N	2015-09-17	\N	2	t	\N	f	f
000c0000-55fa-e0c3-4180-bc8a66799870	000d0000-55fa-e0c2-399e-6739f9b0c22b	\N	00090000-55fa-e0c2-2442-9e9036861591	\N	0004	f	2016-01-01	2016-01-01	\N	26	t	\N	f	f
000c0000-55fa-e0c3-98dd-0439a3326965	000d0000-55fa-e0c2-bfed-4e4eff832512	\N	00090000-55fa-e0c2-3c65-2c3ff28c04cc	\N	0005	f	2016-01-01	2016-01-01	\N	7	t	\N	f	f
000c0000-55fa-e0c3-2a63-c817b08660e1	000d0000-55fa-e0c2-1a8a-c6521516bfd1	\N	00090000-55fa-e0c2-6aeb-88b5fd3c2b23	000b0000-55fa-e0c2-a78e-e1f7700bd491	0006	f	2016-01-01	2016-01-01	\N	1	t	\N	t	t
000c0000-55fa-e0c3-7211-d1a0aab5e68d	000d0000-55fa-e0c2-9f1e-6c52b2a1d422	00100000-55fa-e0c3-5617-f11cc0d7c099	00090000-55fa-e0c2-331d-a0bb54667647	\N	0007	t	2016-01-01	2016-01-01	\N	14	t	\N	f	t
000c0000-55fa-e0c3-c679-49d40efc8aad	000d0000-55fa-e0c2-df12-db6909a3cfe7	\N	00090000-55fa-e0c2-a094-e1a18d488ca7	000b0000-55fa-e0c2-eb45-17ba1dd19c00	0008	f	2016-01-01	2016-01-01	\N	12	t	\N	t	t
000c0000-55fa-e0c3-f967-a3c334712501	000d0000-55fa-e0c2-9f1e-6c52b2a1d422	00100000-55fa-e0c3-db20-2b417087e34a	00090000-55fa-e0c2-b217-96bfc64e03d3	\N	0009	t	2017-01-01	2017-01-01	\N	15	t	\N	f	t
000c0000-55fa-e0c3-402e-58e2477a1fd5	000d0000-55fa-e0c2-9f1e-6c52b2a1d422	00100000-55fa-e0c3-7fc8-c6e1066009e5	00090000-55fa-e0c2-1e10-f909562f011e	\N	0010	t	\N	2015-09-17	\N	16	f	\N	f	t
000c0000-55fa-e0c3-4ef3-70abb89493f1	000d0000-55fa-e0c2-9f1e-6c52b2a1d422	00100000-55fa-e0c3-0ad0-ac592a4c1c6a	00090000-55fa-e0c2-4785-1d207f903b21	\N	0011	t	2017-01-01	\N	\N	17	f	\N	f	t
000c0000-55fa-e0c3-59ef-62bfafeb9d82	000d0000-55fa-e0c2-dcf5-d85170ce4672	\N	00090000-55fa-e0c2-9cd1-b1af0e9d3d15	000b0000-55fa-e0c2-51c4-a6ed94262dd3	0012	f	\N	\N	\N	2	t	\N	t	t
\.


--
-- TOC entry 2979 (class 0 OID 19946056)
-- Dependencies: 225
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 2973 (class 0 OID 19945964)
-- Dependencies: 219
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, stevilka, naslov, avtor, podnaslov, jezik, naslovizvirnika, internacionalninaslov, datumprejema, moskevloge, zenskevloge, prevajalec, povzetekvsebine, letoizida, krajizida, zaloznik) FROM stdin;
00160000-55fa-e0c2-8a4f-12f6077c7141	0001	Sen kresne noči	William Shakespeare		slovenščina	A Midsummer Night's Dream	\N	2015-04-26	5	5	Milan Jesih	Nastopajo Titanija, Hipolita, Oberon, ...	\N	\N	\N
00160000-55fa-e0c2-fbc5-481a68a26d82	0002	Bratje Karamazovi	Fjodor Mihajlovič Dostojevski		slovenščina	Bratja Karamazjovji	\N	2015-12-04	4	1	Vladimir Levstik	Svetovna uspešnica	\N	\N	\N
00160000-55fa-e0c2-1711-382673ec8835	0003	Smoletov Vrt	Berta Hočevar		slovenščina		\N	2015-05-26	2	8			\N	\N	\N
\.


--
-- TOC entry 2994 (class 0 OID 19946312)
-- Dependencies: 240
-- Data for Name: datoteka; Type: TABLE DATA; Schema: public; Owner: -
--

COPY datoteka (id, owner_id, filename, transfers, size, format, hash, createdat, uploadedat, upor, datknj) FROM stdin;
\.


--
-- TOC entry 2949 (class 0 OID 19945732)
-- Dependencies: 195
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_splosni_id, prostor_id, sezona_id, planiranzacetek, allday, zacetek, konec, status, razred, termin, title) FROM stdin;
00180000-55fa-e0c2-495b-2edb8039b52e	\N	\N	00200000-55fa-e0c2-0d77-c9792227aa04	\N	\N	\N	\N	2015-06-26 10:00:00	f	2015-06-26 10:00:00	2015-06-26 12:00:00	200s	200s		dogodek 1
00180000-55fa-e0c2-87db-9772a2d01513	\N	\N	00200000-55fa-e0c2-1867-eac19275de0e	\N	\N	\N	\N	2015-06-27 10:00:00	f	2015-06-27 10:00:00	2015-06-27 12:00:00	300s	200s		dogodek 2
00180000-55fa-e0c2-89c2-8c1d2d9f63ea	\N	\N	00200000-55fa-e0c2-d313-5ddd46766265	\N	\N	\N	\N	2015-08-01 20:00:00	f	2015-08-01 20:00:00	2015-08-01 23:00:00	400s	200s		dogodek 3
00180000-55fa-e0c2-9f06-62758238f5d9	\N	\N	00200000-55fa-e0c2-876e-aa3b876e3dfa	\N	\N	\N	\N	2015-08-01 20:00:00	f	2015-08-01 20:00:00	2015-08-01 23:00:00	100s	200s		dogodek 4
00180000-55fa-e0c2-3557-ce151fcf1eee	\N	\N	00200000-55fa-e0c2-d91c-d6a0cab35df7	\N	\N	\N	\N	2015-08-01 20:00:00	f	2015-08-01 20:00:00	2015-08-01 23:00:00	500s	200s		dogodek 5
\.


--
-- TOC entry 2951 (class 0 OID 19945763)
-- Dependencies: 197
-- Data for Name: dogodeksplosni; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodeksplosni (id) FROM stdin;
\.


--
-- TOC entry 2988 (class 0 OID 19946238)
-- Dependencies: 234
-- Data for Name: drugivir; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drugivir (id, znesek, opis, mednarodni, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 2944 (class 0 OID 19945672)
-- Dependencies: 190
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-55fa-e0c1-39e9-e59880b84d32	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-55fa-e0c1-be5a-a428b85af65f	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-55fa-e0c1-d92f-6325d86e7b94	AL	ALB	008	Albania 	Albanija	\N
00040000-55fa-e0c1-1450-84e49cc33eb6	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-55fa-e0c1-13f5-dc1fdf916150	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-55fa-e0c1-b23e-d175455ac72f	AD	AND	020	Andorra 	Andora	\N
00040000-55fa-e0c1-40e3-331d8393caab	AO	AGO	024	Angola 	Angola	\N
00040000-55fa-e0c1-d953-c6d4944ff10d	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-55fa-e0c1-0f8b-26647a7ebd33	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-55fa-e0c1-1220-554395b913bf	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-55fa-e0c1-db9d-46e30f41f3d4	AR	ARG	032	Argentina 	Argenitna	\N
00040000-55fa-e0c1-ab25-b96bd3b81a3f	AM	ARM	051	Armenia 	Armenija	\N
00040000-55fa-e0c1-f05d-bf6a49c8219f	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-55fa-e0c1-a3c3-042211e2e8ad	AU	AUS	036	Australia 	Avstralija	\N
00040000-55fa-e0c1-7d93-d4e04fdf4024	AT	AUT	040	Austria 	Avstrija	\N
00040000-55fa-e0c1-1d74-5f15376593cd	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-55fa-e0c1-5fd5-68dd802c70bc	BS	BHS	044	Bahamas 	Bahami	\N
00040000-55fa-e0c1-695b-d20b42d1e3f5	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-55fa-e0c1-372a-01a266cd1746	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-55fa-e0c1-3d9f-4bbea11c8b42	BB	BRB	052	Barbados 	Barbados	\N
00040000-55fa-e0c1-5305-666e3fac883e	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-55fa-e0c1-ab26-058c65cd649d	BE	BEL	056	Belgium 	Belgija	\N
00040000-55fa-e0c1-ce84-58f88f0bbdba	BZ	BLZ	084	Belize 	Belize	\N
00040000-55fa-e0c1-6437-a1097d801e54	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-55fa-e0c1-7e26-8ba524c026a3	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-55fa-e0c1-69ee-4740a3eaf5ca	BT	BTN	064	Bhutan 	Butan	\N
00040000-55fa-e0c1-5873-187c2b0e9727	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-55fa-e0c1-98d2-993c1364ee7c	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-55fa-e0c1-91b5-d1d336dc995f	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-55fa-e0c1-192d-260eb467c2b7	BW	BWA	072	Botswana 	Bocvana	\N
00040000-55fa-e0c1-9f33-fd8bcde8551b	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-55fa-e0c1-1a2e-ed049dce50d7	BR	BRA	076	Brazil 	Brazilija	\N
00040000-55fa-e0c1-90c8-88dba4568026	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-55fa-e0c1-3ef6-d9e530e6af56	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-55fa-e0c1-f65a-ed5868dde68a	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-55fa-e0c1-c1ee-02bd136a5fc3	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-55fa-e0c1-d6b2-e0cae3a0c4b1	BI	BDI	108	Burundi 	Burundi 	\N
00040000-55fa-e0c1-676f-e8f015e42181	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-55fa-e0c1-643b-6e1c1a4dd696	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-55fa-e0c1-3957-11e9b7e484a8	CA	CAN	124	Canada 	Kanada	\N
00040000-55fa-e0c1-2d05-81e1e2a661b3	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-55fa-e0c1-6f3e-8caf1ee9397b	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-55fa-e0c1-1ea6-9de78a539179	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-55fa-e0c1-cba4-2eacb4781932	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-55fa-e0c1-75f8-082800ef5c6b	CL	CHL	152	Chile 	Čile	\N
00040000-55fa-e0c1-f6de-5e4cf37e57a6	CN	CHN	156	China 	Kitajska	\N
00040000-55fa-e0c1-2e7e-1b538a321fe2	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-55fa-e0c1-d734-99ac1a37f2d2	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-55fa-e0c1-878a-6f3bc5a63774	CO	COL	170	Colombia 	Kolumbija	\N
00040000-55fa-e0c1-5bfc-8c0721b19730	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-55fa-e0c1-80ed-04264da6b997	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-55fa-e0c1-1d19-d9afe38720ce	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-55fa-e0c1-25e1-1d8329b5f283	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-55fa-e0c1-e41e-d5f21b4f457b	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-55fa-e0c1-9844-60fe0156a118	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-55fa-e0c1-f2d8-5c9ac5c711e6	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-55fa-e0c1-8135-d542bc4e4ed1	CU	CUB	192	Cuba 	Kuba	\N
00040000-55fa-e0c1-36cd-e74a2f428746	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-55fa-e0c1-afc4-0ec2adbd3e37	CY	CYP	196	Cyprus 	Ciper	\N
00040000-55fa-e0c1-87a6-949f9a108473	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-55fa-e0c1-e9ff-32a635125315	DK	DNK	208	Denmark 	Danska	\N
00040000-55fa-e0c1-a379-6c9cf8ed91f1	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-55fa-e0c1-c4e1-6ec87712c79d	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-55fa-e0c1-29a3-1b02a45195fe	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-55fa-e0c1-f0d2-608734b5ccab	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-55fa-e0c1-b82d-d7d5ad415762	EG	EGY	818	Egypt 	Egipt	\N
00040000-55fa-e0c1-7ef4-045ff3972073	SV	SLV	222	El Salvador 	Salvador	\N
00040000-55fa-e0c1-2ca0-6cdacd87798a	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-55fa-e0c1-caad-3c5ffd653030	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-55fa-e0c1-41dd-f6b8e95b9a66	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-55fa-e0c1-29ba-162daf519f54	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-55fa-e0c1-cd14-2a9313f3a123	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-55fa-e0c1-51b1-143821b4daa4	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-55fa-e0c1-5d03-6ebd34afc0fd	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-55fa-e0c1-aca4-b87fc54a51ff	FI	FIN	246	Finland 	Finska	\N
00040000-55fa-e0c1-9be5-62e5b3e528dc	FR	FRA	250	France 	Francija	\N
00040000-55fa-e0c1-52d1-6c8f8dea94d1	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-55fa-e0c1-c69e-c104f629abcd	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-55fa-e0c1-0025-cc5d0255a03c	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-55fa-e0c1-acbc-90f5987a290a	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-55fa-e0c1-83a1-4430b90c691d	GA	GAB	266	Gabon 	Gabon	\N
00040000-55fa-e0c1-8d7b-a69cc144f84f	GM	GMB	270	Gambia 	Gambija	\N
00040000-55fa-e0c1-ab56-830b64de6e92	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-55fa-e0c1-c2b7-3ec5c98ff7ea	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-55fa-e0c1-6ecf-364b1c3146e4	GH	GHA	288	Ghana 	Gana	\N
00040000-55fa-e0c1-4126-6fd7afda4235	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-55fa-e0c1-2a5e-3571e0bc1ec3	GR	GRC	300	Greece 	Grčija	\N
00040000-55fa-e0c1-ef05-291864bac90d	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-55fa-e0c1-93ab-1447e68658b2	GD	GRD	308	Grenada 	Grenada	\N
00040000-55fa-e0c1-56d0-35d87b08b40a	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-55fa-e0c1-84b1-77d77abcfd38	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-55fa-e0c1-bc4a-6c37ae277d73	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-55fa-e0c1-c786-f2e99e1cd113	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-55fa-e0c1-9c66-96574e0064ee	GN	GIN	324	Guinea 	Gvineja	\N
00040000-55fa-e0c1-b421-8e2f2e66d06f	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-55fa-e0c1-2791-31642af9927b	GY	GUY	328	Guyana 	Gvajana	\N
00040000-55fa-e0c1-1d94-b764c68d0110	HT	HTI	332	Haiti 	Haiti	\N
00040000-55fa-e0c1-5123-04e909858953	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-55fa-e0c1-27f7-55376195b87f	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-55fa-e0c1-8461-071a8268041e	HN	HND	340	Honduras 	Honduras	\N
00040000-55fa-e0c1-034a-16c7bf715fe0	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-55fa-e0c1-395f-18082ffb55cf	HU	HUN	348	Hungary 	Madžarska	\N
00040000-55fa-e0c1-b10a-416be9da2e86	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-55fa-e0c1-20a5-3412d24bb601	IN	IND	356	India 	Indija	\N
00040000-55fa-e0c1-69a6-0c4992986133	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-55fa-e0c1-5311-f85d13f57171	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-55fa-e0c1-1539-6be11da78773	IQ	IRQ	368	Iraq 	Irak	\N
00040000-55fa-e0c1-d35b-ee34050600b2	IE	IRL	372	Ireland 	Irska	\N
00040000-55fa-e0c1-9cc5-23a6ec17c8aa	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-55fa-e0c1-0ade-6f4993af0af4	IL	ISR	376	Israel 	Izrael	\N
00040000-55fa-e0c1-5c97-7bb5f3f48628	IT	ITA	380	Italy 	Italija	\N
00040000-55fa-e0c1-a55d-f021bfad2c5b	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-55fa-e0c1-e86e-b906609b0340	JP	JPN	392	Japan 	Japonska	\N
00040000-55fa-e0c1-a1f1-ce7c86cac16c	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-55fa-e0c1-7d37-3bda7ffd684b	JO	JOR	400	Jordan 	Jordanija	\N
00040000-55fa-e0c1-8175-f1fb72ca87f6	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-55fa-e0c1-3fb1-cfa362b5254f	KE	KEN	404	Kenya 	Kenija	\N
00040000-55fa-e0c1-3053-f0c63fab00cd	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-55fa-e0c1-a64f-2e56b784c356	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-55fa-e0c1-19f0-5c1cce5cbd51	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-55fa-e0c1-5fb4-15d9a11948d7	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-55fa-e0c1-a2a6-f239ede193ad	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-55fa-e0c1-7790-2157ab2eb982	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-55fa-e0c1-10a3-631f2b103b6d	LV	LVA	428	Latvia 	Latvija	\N
00040000-55fa-e0c1-65d9-51e9956c62db	LB	LBN	422	Lebanon 	Libanon	\N
00040000-55fa-e0c1-f772-b32c724b198e	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-55fa-e0c1-f51e-47b2d7996f42	LR	LBR	430	Liberia 	Liberija	\N
00040000-55fa-e0c1-a955-b278877c402f	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-55fa-e0c1-e20e-ba95cbde2b54	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-55fa-e0c1-31da-50b145bd4f8c	LT	LTU	440	Lithuania 	Litva	\N
00040000-55fa-e0c1-f19b-2e597617a3e5	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-55fa-e0c1-5b0e-bc6b6e20ec80	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-55fa-e0c1-491a-928186a76e0c	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-55fa-e0c1-e451-c47ed05a634b	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-55fa-e0c1-17a6-b4dfe2287a5d	MW	MWI	454	Malawi 	Malavi	\N
00040000-55fa-e0c1-034b-4b59d19e5539	MY	MYS	458	Malaysia 	Malezija	\N
00040000-55fa-e0c1-2a2e-0f7f65522056	MV	MDV	462	Maldives 	Maldivi	\N
00040000-55fa-e0c1-0a32-a66fb19918b3	ML	MLI	466	Mali 	Mali	\N
00040000-55fa-e0c1-181b-d4981d538a58	MT	MLT	470	Malta 	Malta	\N
00040000-55fa-e0c1-4822-8d7105fb5327	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-55fa-e0c1-b19b-704786eefde7	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-55fa-e0c1-4c0c-ddf4a8ac4a8b	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-55fa-e0c1-97ab-60802d7a538b	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-55fa-e0c1-fd85-a2b87231088b	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-55fa-e0c1-6700-947c3f0970e9	MX	MEX	484	Mexico 	Mehika	\N
00040000-55fa-e0c1-04ea-74d1b43ae204	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-55fa-e0c1-f42b-8550f471b8b2	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-55fa-e0c1-70e1-20be1e0b141a	MC	MCO	492	Monaco 	Monako	\N
00040000-55fa-e0c1-b183-0efb76e516f3	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-55fa-e0c1-3d2b-33eb5208851b	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-55fa-e0c1-a7bf-a1b8f627310a	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-55fa-e0c1-dee2-44c8a47cc302	MA	MAR	504	Morocco 	Maroko	\N
00040000-55fa-e0c1-98b3-b706e0cdb3ea	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-55fa-e0c1-5e84-6571b6395954	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-55fa-e0c1-c926-3c19268e4a05	NA	NAM	516	Namibia 	Namibija	\N
00040000-55fa-e0c1-8f0c-bd807634f0ea	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-55fa-e0c1-b0ae-cf8d05815677	NP	NPL	524	Nepal 	Nepal	\N
00040000-55fa-e0c1-3d85-0ae79e45956f	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-55fa-e0c1-9114-6f22026c6ffb	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-55fa-e0c1-f287-13d8f7ec8e16	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-55fa-e0c1-2072-306859579fd8	NE	NER	562	Niger 	Niger 	\N
00040000-55fa-e0c1-157c-898ad40cf263	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-55fa-e0c1-8c71-857abba01ba3	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-55fa-e0c1-5b52-8b0ccaa3674b	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-55fa-e0c1-c7d5-27e54a3947e7	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-55fa-e0c1-c36f-e699b3984b4f	NO	NOR	578	Norway 	Norveška	\N
00040000-55fa-e0c1-5649-aa76ec175605	OM	OMN	512	Oman 	Oman	\N
00040000-55fa-e0c1-e750-a4858b534c43	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-55fa-e0c1-4950-abd598eb8968	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-55fa-e0c1-32c8-cd79acf4851a	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-55fa-e0c1-120f-a369e74b1e53	PA	PAN	591	Panama 	Panama	\N
00040000-55fa-e0c1-4fbb-e30f1e93e82a	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-55fa-e0c1-5123-17eb12720a3f	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-55fa-e0c1-636c-27dc813e457d	PE	PER	604	Peru 	Peru	\N
00040000-55fa-e0c1-f344-f42d1bafa069	PH	PHL	608	Philippines 	Filipini	\N
00040000-55fa-e0c1-87c9-a9891c3fd880	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-55fa-e0c1-dbd8-02338c36ad7e	PL	POL	616	Poland 	Poljska	\N
00040000-55fa-e0c1-7901-94fdcb234733	PT	PRT	620	Portugal 	Portugalska	\N
00040000-55fa-e0c1-8776-78949d8606e1	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-55fa-e0c1-e5b9-5850293b3e3b	QA	QAT	634	Qatar 	Katar	\N
00040000-55fa-e0c1-56d7-732f3efa3a61	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-55fa-e0c1-a3f2-4ec3e262c294	RO	ROU	642	Romania 	Romunija	\N
00040000-55fa-e0c1-8b7d-798d6e23e40d	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-55fa-e0c1-caee-11bfd601cafa	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-55fa-e0c1-e1ab-e2bf95563f1f	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-55fa-e0c1-ce2f-3c9eb8b356c2	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-55fa-e0c1-bd45-2e5e82a64c80	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-55fa-e0c1-51b8-5a688fe035d4	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-55fa-e0c1-7eb1-9b88a74876b4	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-55fa-e0c1-18f4-d0ae1df8fc1e	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-55fa-e0c1-11e6-c82b46ac2667	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-55fa-e0c1-25ce-48d435a682f2	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-55fa-e0c1-6166-a50417c365a1	SM	SMR	674	San Marino 	San Marino	\N
00040000-55fa-e0c1-be66-43715216f9d5	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-55fa-e0c1-fed2-c90d927217b1	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-55fa-e0c1-bec5-1c05072798f8	SN	SEN	686	Senegal 	Senegal	\N
00040000-55fa-e0c1-8f66-663d922f1bd3	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-55fa-e0c1-42c2-658e412ef4d1	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-55fa-e0c1-4961-21f12c41a353	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-55fa-e0c1-eb14-12a454975a84	SG	SGP	702	Singapore 	Singapur	\N
00040000-55fa-e0c1-4198-47f228634f25	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-55fa-e0c1-fd50-b26eb79dbbd3	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-55fa-e0c1-f632-c16a9667dc65	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-55fa-e0c1-86d3-54fa4420b671	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-55fa-e0c1-97e9-f5e5b958fcfd	SO	SOM	706	Somalia 	Somalija	\N
00040000-55fa-e0c1-3d34-674aceff2a7c	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-55fa-e0c1-8e2b-bca3f27a6490	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-55fa-e0c1-7788-c7dfec792e40	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-55fa-e0c1-8637-cb81742e209b	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-55fa-e0c1-92b5-8d0dd3264f5e	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-55fa-e0c1-bd86-d2ef005428b8	SD	SDN	729	Sudan 	Sudan	\N
00040000-55fa-e0c1-d31f-c75a5a333f61	SR	SUR	740	Suriname 	Surinam	\N
00040000-55fa-e0c1-5af9-ad6b0c548de8	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-55fa-e0c1-96f9-cc85025a3676	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-55fa-e0c1-204f-ac95f911c3c8	SE	SWE	752	Sweden 	Švedska	\N
00040000-55fa-e0c1-b94c-230036bdb0f5	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-55fa-e0c1-e7e9-c349498407dc	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-55fa-e0c1-cd11-50a691ed5a0d	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-55fa-e0c1-e26d-e07a531e3d94	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-55fa-e0c1-0537-6bb21239daca	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-55fa-e0c1-bc84-fe683d6acc28	TH	THA	764	Thailand 	Tajska	\N
00040000-55fa-e0c1-3ae4-9e778d89c4ce	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-55fa-e0c1-ad0a-f990ee31e91e	TG	TGO	768	Togo 	Togo	\N
00040000-55fa-e0c1-caf9-ee28f70caa13	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-55fa-e0c1-2ac0-84abe9918efd	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-55fa-e0c1-12fd-c1ced6cc9e83	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-55fa-e0c1-1d5c-6a22429292cd	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-55fa-e0c1-6f2e-dbfe501d232a	TR	TUR	792	Turkey 	Turčija	\N
00040000-55fa-e0c1-7a6d-c95024d3e7ef	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-55fa-e0c1-eb83-56bb2d513273	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-55fa-e0c1-3580-0bd063fd75ba	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-55fa-e0c1-94ee-e69f97c83e3f	UG	UGA	800	Uganda 	Uganda	\N
00040000-55fa-e0c1-1cf8-c2e3bba59f74	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-55fa-e0c1-c760-50481e055ec3	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-55fa-e0c1-112d-28df46e8043a	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-55fa-e0c1-eaea-dc340ecb2034	US	USA	840	United States 	Združene države Amerike	\N
00040000-55fa-e0c1-d669-e75c257d9880	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-55fa-e0c1-39a8-415981217e48	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-55fa-e0c1-d892-901db044cd43	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-55fa-e0c1-d115-059a8bf633b0	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-55fa-e0c1-3f4f-f74179b26770	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-55fa-e0c1-8329-c9a2fa0b7beb	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-55fa-e0c1-867c-3b99dd39a7e8	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-55fa-e0c1-d1a0-73975435ab05	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-55fa-e0c1-0efe-eb5e586cc4e9	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-55fa-e0c1-5cde-e841d795fd0d	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-55fa-e0c1-27e7-4f80eb9d70e9	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-55fa-e0c1-c954-85c4ad5c2761	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-55fa-e0c1-a87b-3bd948c6fdac	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 2981 (class 0 OID 19946086)
-- Dependencies: 227
-- Data for Name: enotaprograma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY enotaprograma (id, uprizoritev_id, program_dela_id, gostitelj_id, celotnavrednost, nasdelez, celotnavrednostmat, celotnavrednostgostovsz, zaproseno, lastnasredstva, avtorskihonorarji, avtorskihonorarjisamoz, tantieme, avtorskepravice, materialni, imakoprodukcije, vlozekgostitelja, drugijavni, stzaposlenih, stzaposumet, stzaposdrug, sthonorarnih, sthonorarnihigr, sthonorarnihigrtujjz, sthonorarnihigrsamoz, obiskdoma, obiskkopr, obiskgost, obiskzamejo, obiskint, obiskkoprint, ponovidoma, ponovikopr, ponovizamejo, ponovigost, ponovikoprint, ponoviint, naziv, kpe, sort, tipprogramskeenote_id, tip, prikoproducentu, strosekodkpred, stroskiostali, krajgostovanja, ustanova, datumgostovanja, transportnistroski, dnevprvzad, drzavagostovanja_id, stpe, zvrst, stpredstav, stokroglihmiz, stpredstavitev, stdelavnic, stdrugidogodki, stprodukcij, caspriprave, casizvedbe, prizorisca, umetvodja, programskotelo, sttujihselektorjev) FROM stdin;
002f0000-55fa-e0c2-257c-e23b20f7dd36	000e0000-55fa-e0c2-8eb2-8adb5b35b64c	\N	\N	9000.30	9000.30	9000.30	0.00	3600.12	5299.98	4000.40	1000.40	200.20	200.30	4599.40	\N	0.00	100.20	0	2	2	2	2	2	\N	40	0	0	0	0	0	1	0	0	0	0	0		0.00	\N	002b0000-55fa-e0c1-19bd-b85a96572c4b	premiera	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-55fa-e0c2-0591-221a2d1bb460	000e0000-55fa-e0c2-0353-554124a51f5e	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	\N	60	0	0	0	0	0	1	0	0	0	0	0		0.00	\N	002b0000-55fa-e0c1-e2ff-391b1bd01136	premiera	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-55fa-e0c2-c490-31da9150932d	000e0000-55fa-e0c2-321b-a96a841f84ad	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	\N	60	0	0	0	0	0	1	0	0	0	0	0		0.00	\N	002b0000-55fa-e0c1-19bd-b85a96572c4b	premiera	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-55fa-e0c3-2ab1-5517f79689f0	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-54.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	54.20	5	0	0	3	0	0	\N	22	0	0	0	0	0	0	0	0	0	0	0	Urejanje portala	0.00	10	\N	razno	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-55fa-e0c3-1829-10ad94898bf5	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-31.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	31.20	5	0	0	3	0	0	\N	202	0	0	0	0	0	0	0	0	0	0	0	Delavnice otroci	0.00	8	\N	razno	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 2967 (class 0 OID 19945896)
-- Dependencies: 213
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, podrocje, vodjaekipe, naziv, komentar, velikost, pomembna, sort, seplanira, dovoliprekrivanje, maxprekrivanj, tipfunkcije_id) FROM stdin;
000d0000-55fa-e0c2-66d6-95c0daa0ddb8	000e0000-55fa-e0c2-0353-554124a51f5e	000c0000-55fa-e0c3-fbe5-e786ee6c438c	igralec	\N	Tezej	glavna vloga	velika	t	5	t	t	\N	000f0000-55fa-e0c1-b67d-0c67306d474b
000d0000-55fa-e0c2-3a58-c9f83ef58577	000e0000-55fa-e0c2-0353-554124a51f5e	000c0000-55fa-e0c3-44eb-e30f0e8ef262	umetnik	\N	Režija		velika	t	8	t	t	\N	000f0000-55fa-e0c1-8278-2bb96aece2b3
000d0000-55fa-e0c2-5e32-5b46c23d8d63	000e0000-55fa-e0c2-0353-554124a51f5e	000c0000-55fa-e0c3-e7c4-f2e1cd8d592b	inspicient	t	Inšpicient			t	8	t	t	\N	000f0000-55fa-e0c1-1145-a320a7ce2f1d
000d0000-55fa-e0c2-399e-6739f9b0c22b	000e0000-55fa-e0c2-0353-554124a51f5e	000c0000-55fa-e0c3-4180-bc8a66799870	tehnik	t	Tehnični vodja			t	8	t	t	\N	000f0000-55fa-e0c1-ea0b-87670cecc79d
000d0000-55fa-e0c2-bfed-4e4eff832512	000e0000-55fa-e0c2-0353-554124a51f5e	000c0000-55fa-e0c3-98dd-0439a3326965	tehnik	\N	Razsvetljava			t	3	t	t	\N	000f0000-55fa-e0c1-ea0b-87670cecc79d
000d0000-55fa-e0c2-1a8a-c6521516bfd1	000e0000-55fa-e0c2-0353-554124a51f5e	000c0000-55fa-e0c3-2a63-c817b08660e1	igralec	\N	Helena	glavna vloga	velika	t	5	t	t	\N	000f0000-55fa-e0c1-b67d-0c67306d474b
000d0000-55fa-e0c2-9f1e-6c52b2a1d422	000e0000-55fa-e0c2-0353-554124a51f5e	000c0000-55fa-e0c3-f967-a3c334712501	igralec	\N	Hipolita	glavna vloga	velika	t	6	t	t	\N	000f0000-55fa-e0c1-b67d-0c67306d474b
000d0000-55fa-e0c2-df12-db6909a3cfe7	000e0000-55fa-e0c2-0353-554124a51f5e	000c0000-55fa-e0c3-c679-49d40efc8aad	umetnik	\N	Lektoriranje			t	22	t	t	\N	000f0000-55fa-e0c1-eed8-789b121462ce
000d0000-55fa-e0c2-dcf5-d85170ce4672	000e0000-55fa-e0c2-0353-554124a51f5e	000c0000-55fa-e0c3-59ef-62bfafeb9d82	umetnik	\N	Avtor	Avtor besedila		t	2	t	f	\N	000f0000-55fa-e0c1-e7c5-977d88ff74a5
\.


--
-- TOC entry 2947 (class 0 OID 19945711)
-- Dependencies: 193
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta, zamejstvo, kraj) FROM stdin;
\.


--
-- TOC entry 2945 (class 0 OID 19945689)
-- Dependencies: 191
-- Data for Name: kontaktnaoseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kontaktnaoseba (id, popa_id, oseba_id, status, funkcija, opis) FROM stdin;
00260000-55fa-e0c2-022b-def43e1528c1	00080000-55fa-e0c2-7259-ea96a8ba40d0	00090000-55fa-e0c2-1e10-f909562f011e	AK		igralka
\.


--
-- TOC entry 2956 (class 0 OID 19945810)
-- Dependencies: 202
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 2992 (class 0 OID 19946293)
-- Dependencies: 238
-- Data for Name: mapa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa (id, lastnik_id, parent_id, ime, komentar, caskreiranja, casspremembe, javnidostop, upor, datknj) FROM stdin;
\.


--
-- TOC entry 2993 (class 0 OID 19946305)
-- Dependencies: 239
-- Data for Name: mapa_zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa_zapis (mapa_id, zapis_id) FROM stdin;
\.


--
-- TOC entry 2995 (class 0 OID 19946327)
-- Dependencies: 241
-- Data for Name: mapaacl; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapaacl (id, mapa_id, perm_id, dostop, upor, datknj) FROM stdin;
\.


--
-- TOC entry 2924 (class 0 OID 19921951)
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
\.


--
-- TOC entry 2960 (class 0 OID 19945835)
-- Dependencies: 206
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 2942 (class 0 OID 19945646)
-- Dependencies: 188
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-55fa-e0c1-dbe9-4e14db7ebdf8	popa.stakli	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-55fa-e0c1-4800-31dd6b001a3b	oseba.spol	array	a:2:{s:1:"M";a:1:{s:5:"label";s:6:"Moški";}s:1:"Z";a:1:{s:5:"label";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-55fa-e0c1-dae1-f45e3b884794	telefonska.vrsta	array	a:3:{s:7:"mobilna";a:1:{s:5:"label";s:7:"Mobilni";}s:6:"domaca";a:1:{s:5:"label";s:6:"Domač";}s:6:"fiksna";a:1:{s:5:"label";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-55fa-e0c1-0a6a-9698b415d08b	kontaktnaoseba.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status kontaktne osebe
00000000-55fa-e0c1-c3b6-a75707a0742c	dogodek.status	array	a:7:{s:4:"100s";a:1:{s:5:"label";s:11:"Dolgoročno";}s:4:"200s";a:1:{s:5:"label";s:9:"Planirano";}s:4:"300s";a:1:{s:5:"label";s:8:"Fiksiran";}s:4:"400s";a:1:{s:5:"label";s:17:"Potrjen - interno";}s:4:"500s";a:1:{s:5:"label";s:15:"Potrjen - javno";}s:4:"600s";a:1:{s:5:"label";s:10:"Zaključen";}s:4:"700s";a:1:{s:5:"label";s:7:"Obdelan";}}	f	t	t	\N	Tabela statusa dogodkov
00000000-55fa-e0c1-aadd-90e86f67393e	dogodek.razred	array	a:5:{s:4:"100s";a:2:{s:5:"label";s:9:"Predstava";s:4:"type";s:9:"predstava";}s:4:"200s";a:2:{s:5:"label";s:4:"Vaja";s:4:"type";s:4:"vaja";}s:4:"300s";a:2:{s:5:"label";s:10:"Gostovanje";s:4:"type";s:10:"gostovanje";}s:4:"400s";a:2:{s:5:"label";s:16:"Splošni dogodek";s:4:"type";s:8:"splošni";}s:4:"500s";a:2:{s:5:"label";s:10:"Zasedenost";s:4:"type";s:10:"zasedenost";}}	f	t	t	\N	Tabela razredov dogodkov, ki jih aplikacija podpira
00000000-55fa-e0c1-65ec-73ef4be1ad43	uprizoritev.faza	array	a:6:{s:20:"predprodukcija-ideja";a:1:{s:5:"label";s:16:"Dolgoročni plan";}s:20:"predprodukcija-poziv";a:1:{s:5:"label";s:29:"Predprodukcija, v fazi poziva";}s:30:"predprodukcija-potrjen_program";a:1:{s:5:"label";s:34:"Predprodukcija, program je potrjen";}s:10:"produkcija";a:1:{s:5:"label";s:10:"Produkcija";}s:14:"postprodukcija";a:1:{s:5:"label";s:14:"Postprodukcija";}s:5:"arhiv";a:1:{s:5:"label";s:10:"Arhivirana";}}	f	t	f	\N	Faza uprizoritve
00000000-55fa-e0c1-a2f0-b1162a7b4562	funkcija.podrocje	array	a:4:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}}	f	t	f	\N	Področje funkcije
00000000-55fa-e0c1-33af-96e167f8a696	tipfunkcije.podrocje	array	a:4:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}}	f	t	f	\N	Področje funkcije
00000000-55fa-e0c1-5e6e-749c2b36a027	funkcija.velikost	array	a:4:{s:7:"stataza";a:1:{s:5:"label";s:8:"Stataža";}s:4:"mala";a:1:{s:5:"label";s:21:"Mala vloga / funkcija";}s:7:"srednja";a:1:{s:5:"label";s:24:"Srednja vloga / funkcija";}s:6:"velika";a:1:{s:5:"label";s:23:"Velika vloga / funkcija";}}	f	t	f	\N	Velikost funkcije
00000000-55fa-e0c1-8353-f7f0ca21ff72	zaposlitev.status	array	a:2:{s:1:"A";a:1:{s:5:"label";s:7:"Aktivna";}s:1:"N";a:1:{s:5:"label";s:9:"Neaktivna";}}	f	t	f	\N	Status zaposlitve
00000000-55fa-e0c1-7df9-9bd7589ae2da	produkcijskahisa.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktivna";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktivna";}}	f	t	f	\N	Status produkcijske hiše
00000000-55fa-e0c1-04d4-b7914faf2277	strosekuprizoritve.tipstroska	array	a:1:{s:10:"materialni";a:1:{s:5:"label";s:19:"Materialni strošek";}}	f	t	f	\N	Tip stroška
00000000-55fa-e0c1-a9fc-44fae390f249	fsacl.dostop	array	a:4:{s:1:"X";a:1:{s:5:"label";s:12:"Brez dostopa";}s:1:"R";a:1:{s:5:"label";s:11:"Samo branje";}s:2:"RW";a:1:{s:5:"label";s:17:"Branje in pisanje";}s:3:"RWD";a:1:{s:5:"label";s:26:"Branje pisanje in brisanje";}}	f	t	f	\N	ACL Javni dostop
00000000-55fa-e0c2-3a8b-da55e7b2d9c8	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-55fa-e0c2-10be-f6118ea55077	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-55fa-e0c2-03b9-a76a06907635	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-55fa-e0c2-9122-e555b9c19798	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-55fa-e0c2-f37a-8f7c10115ec9	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
00000000-55fa-e0c3-a742-bd85bd51bb60	application.tenant.maticnopodjetje	string	s:4:"1001";	f	t	f		Šifra matičnega podjetja v Popa in ProdukcijskaHisa
\.


--
-- TOC entry 2936 (class 0 OID 19945560)
-- Dependencies: 182
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-55fa-e0c2-5551-a42b524b8ef5	00000000-55fa-e0c2-3a8b-da55e7b2d9c8	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-55fa-e0c2-bd59-23eaa8639d23	00000000-55fa-e0c2-3a8b-da55e7b2d9c8	00010000-55fa-e0c1-ba0d-272b00b1090c	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-55fa-e0c2-83f1-e53a98281393	00000000-55fa-e0c2-10be-f6118ea55077	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 2937 (class 0 OID 19945571)
-- Dependencies: 183
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naslov_id, sifra, naziv, ime, priimek, funkcija, srednjeime, polnoime, psevdonim, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
00090000-55fa-e0c2-9c47-50bf5654b0ad	\N	\N	0001	g.	Janez	Novak	a	Peter	Janez Peter Novak	Jani	jani.novak@xxx.xx	1958-01-06	0601958000000	123456789	M	Jani Janez	Slovenija	Slovenija	Ljubljana
00090000-55fa-e0c2-2442-9e9036861591	00010000-55fa-e0c2-9458-9b2b7ca839d1	\N	0002	dr.	Anton	Horvat	b		Anton  Horvat	Tona	anton.horvat@xxx.xx	1968-02-12	1202968111111	234567890	M		Slovenija	Slovenija	Maribor
00090000-55fa-e0c2-b49d-93d7d37cbf5e	00010000-55fa-e0c2-8a75-06bd2f01c2ba	\N	0003		Ivan	Kovačič	c		Ivan  Kovačič	Ivo	ivan.kovacic@xxx.xx	1975-03-26	2603976222222	345678901	M		Slovenija	Slovenija	Celje
00090000-55fa-e0c2-b217-96bfc64e03d3	00010000-55fa-e0c2-8fe8-c50707a0e2df	\N	0004	prof.	Jožef	Krajnc	d		Jožef  Krajnc	Joža	jozef.krajnc@xxx.xx	1971-04-30	3004971333333	456789012	M		Slovenija	Slovenija	Kranj
00090000-55fa-e0c2-fa85-a93a88974a78	\N	\N	0005		Marko	Zupančič	e		Marko  Zupančič		marko.zupancic@xxx.xx	1984-05-07	0705984444444	567890123	M		Slovenija	Slovenija	Koper
00090000-55fa-e0c2-6aeb-88b5fd3c2b23	\N	\N	0006	ga.	Marija	Kovač	f		Marija  Kovač		marija.kovac@xxx.xx	1962-06-19	1906962444444	678901234	Z		Slovenija	Slovenija	Murska Sobota
00090000-55fa-e0c2-4785-1d207f903b21	\N	\N	0007	ga.	Ana	Potočnik	g		Ana  Potočnik		ana.potocnik@xxx.xx	1975-07-24	2407975555555	789012345	Z		Slovenija	Slovenija	Novo Mesto
00090000-55fa-e0c2-331d-a0bb54667647	\N	\N	0008	ga.	Maja	Mlakar	h		Maja  Mlakar		maja.mlakar@xxx.xx	1986-08-02	0208986666666	890123456	Z		Slovenija	Slovenija	Nova Gorica
00090000-55fa-e0c2-1e10-f909562f011e	00010000-55fa-e0c2-7866-1dbc5f830eee	\N	0009		Irena	Kos	i		Irena  Kos		irena.kos@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Ptuj
00090000-55fa-e0c2-9cd1-b1af0e9d3d15	\N	\N	0010		Mojca	Vidmar	J		Mojca  Vidmar		mojca.vidmar@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Idrija
00090000-55fa-e0c2-1bb1-52445835c794	\N	\N	0011		xx	write protected12345	a		xx  write protected12345		xx@xxx.xx	\N	\N	\N	Z		\N	\N	\N
00090000-55fa-e0c2-3c65-2c3ff28c04cc	\N	\N	0012		Luka	Golob	luč	a	Luka a Golob		luka.golob@xxx.xx	\N	\N	\N	M		\N	\N	\N
00090000-55fa-e0c2-a094-e1a18d488ca7	00010000-55fa-e0c2-4082-ed9804c4c877	\N	0013		Tatjana	Božič	tajnica	a	Tatjana a Božič		tatjana.bozic@xxx.xx	\N	\N	\N	Z		\N	\N	\N
\.


--
-- TOC entry 2932 (class 0 OID 19945525)
-- Dependencies: 178
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-55fa-e0c1-0b73-10bcd815255c	Aaa-read	Aaa (User,Role,Permission) - branje	f
00030000-55fa-e0c1-adb6-b4d4084c7807	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	f
00030000-55fa-e0c1-278e-f9c0e07d2272	TerminStoritve-vse	TerminStoritve - spreminjanje vseh zapisov	f
00030000-55fa-e0c1-38e5-d33a7a54eb29	Dogodek-readVse	Dogodek - branje vseh, ne glede na status dogodka	f
00030000-55fa-e0c1-82fe-bcc784139930	Oseba-vse	Oseba - vse - za testiranje assert	f
00030000-55fa-e0c1-6184-57b97734e735	ProgramDela-lock	ProgramDela - zaklepanje	f
00030000-55fa-e0c1-879e-a46423b682cd	ProgramDela-unlock	ProgramDela - odklepanje	f
00030000-55fa-e0c1-aff5-630792886f2b	Abonma-read	Abonma - branje	f
00030000-55fa-e0c1-9da1-fcb5c6c08895	Abonma-write	Abonma - spreminjanje	f
00030000-55fa-e0c1-342a-22d92e801ef4	Alternacija-read	Alternacija - branje	f
00030000-55fa-e0c1-e963-11ecb577fa31	Alternacija-write	Alternacija - spreminjanje	f
00030000-55fa-e0c1-5972-a383dcdaf7e8	Arhivalija-read	Arhivalija - branje	f
00030000-55fa-e0c1-a934-5351dde75fc4	Arhivalija-write	Arhivalija - spreminjanje	f
00030000-55fa-e0c1-b5a4-a1dc2fa60391	Besedilo-read	Besedilo - branje	f
00030000-55fa-e0c1-4897-36e7e6ebc56b	Besedilo-write	Besedilo - spreminjanje	f
00030000-55fa-e0c1-475e-d31268e0a885	DogodekIzven-read	DogodekIzven - branje	f
00030000-55fa-e0c1-d6e8-0bbeea041ea0	DogodekIzven-write	DogodekIzven - spreminjanje	f
00030000-55fa-e0c1-bf3d-d8943348b850	Dogodek-read	Dogodek - branje	f
00030000-55fa-e0c1-5e40-265ae8caaa9a	Dogodek-write	Dogodek - spreminjanje	f
00030000-55fa-e0c1-3bef-5a3eab7faa15	DrugiVir-read	DrugiVir - branje	f
00030000-55fa-e0c1-92dc-948010869e91	DrugiVir-write	DrugiVir - spreminjanje	f
00030000-55fa-e0c1-47b1-98027a3f6430	Drzava-read	Drzava - branje	f
00030000-55fa-e0c1-1073-6e6b97746d5b	Drzava-write	Drzava - spreminjanje	f
00030000-55fa-e0c1-3469-12175d88333d	EnotaPrograma-read	EnotaPrograma - branje	f
00030000-55fa-e0c1-91d0-6cac662150f4	EnotaPrograma-write	EnotaPrograma - spreminjanje	f
00030000-55fa-e0c1-c505-7e355bd051b6	Funkcija-read	Funkcija - branje	f
00030000-55fa-e0c1-6f9c-cf030eccacd7	Funkcija-write	Funkcija - spreminjanje	f
00030000-55fa-e0c1-6993-6d066a8e3031	Gostovanje-read	Gostovanje - branje	f
00030000-55fa-e0c1-d9f2-3f51e1ec8cbe	Gostovanje-write	Gostovanje - spreminjanje	f
00030000-55fa-e0c1-d8cb-8115c7c364a3	Gostujoca-read	Gostujoca - branje	f
00030000-55fa-e0c1-c2b0-59e5dffc8d54	Gostujoca-write	Gostujoca - spreminjanje	f
00030000-55fa-e0c1-1628-21caf8514f23	KontaktnaOseba-read	KontaktnaOseba - branje	f
00030000-55fa-e0c1-1149-d335b4dfe73b	KontaktnaOseba-write	KontaktnaOseba - spreminjanje	f
00030000-55fa-e0c1-a2b0-deae13169c03	Kupec-read	Kupec - branje	f
00030000-55fa-e0c1-ff40-780fcbf57569	Kupec-write	Kupec - spreminjanje	f
00030000-55fa-e0c1-6090-46d9839dff4a	NacinPlacina-read	NacinPlacina - branje	f
00030000-55fa-e0c1-46ac-348c4137166e	NacinPlacina-write	NacinPlacina - spreminjanje	f
00030000-55fa-e0c1-01d2-314321c24a17	Option-read	Option - branje	f
00030000-55fa-e0c1-6651-15ba225b318d	Option-write	Option - spreminjanje	f
00030000-55fa-e0c1-3dbd-9db70d92dcc1	OptionValue-read	OptionValue - branje	f
00030000-55fa-e0c1-7788-ad4ce1640a2b	OptionValue-write	OptionValue - spreminjanje	f
00030000-55fa-e0c1-e64c-632cdbf28d74	Oseba-read	Oseba - branje	f
00030000-55fa-e0c1-1cd9-ab63c5563144	Oseba-write	Oseba - spreminjanje	f
00030000-55fa-e0c1-09d7-dfba6348db29	PlacilniInstrument-read	PlacilniInstrument - branje	f
00030000-55fa-e0c1-f703-1a23f556bd88	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	f
00030000-55fa-e0c1-29df-2dbad872c839	PodrocjeSedenja-read	PodrocjeSedenja - branje	f
00030000-55fa-e0c1-e0e9-92c90ffe2f83	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	f
00030000-55fa-e0c1-a612-b7b2b1a4f9ef	Pogodba-read	Pogodba - branje	f
00030000-55fa-e0c1-548e-0662fee7c195	Pogodba-write	Pogodba - spreminjanje	f
00030000-55fa-e0c1-8fb9-8bcc0aa1eb6a	Popa-read	Popa - branje	f
00030000-55fa-e0c1-f06b-1c649163e331	Popa-write	Popa - spreminjanje	f
00030000-55fa-e0c1-3524-dfa0293e4c91	Posta-read	Posta - branje	f
00030000-55fa-e0c1-f15c-004a6b8135a3	Posta-write	Posta - spreminjanje	f
00030000-55fa-e0c1-a971-fc4155bf6c31	PostavkaCDve-read	PostavkaCDve - branje	f
00030000-55fa-e0c1-3756-657db9390689	PostavkaCDve-write	PostavkaCDve - spreminjanje	f
00030000-55fa-e0c1-dbdc-ca53c56b1b5a	PostavkaRacuna-read	PostavkaRacuna - branje	f
00030000-55fa-e0c1-73e3-9561c1fd2989	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	f
00030000-55fa-e0c1-419c-b97a5ffefe8d	PostniNaslov-read	PostniNaslov - branje	f
00030000-55fa-e0c1-aa79-c2c03622d2cf	PostniNaslov-write	PostniNaslov - spreminjanje	f
00030000-55fa-e0c1-e3fd-10540f6b884c	Predstava-read	Predstava - branje	f
00030000-55fa-e0c1-ee44-1d68e6f336e5	Predstava-write	Predstava - spreminjanje	f
00030000-55fa-e0c1-0bee-b9d4aa4957a9	ProdajaPredstave-read	ProdajaPredstave - branje	f
00030000-55fa-e0c1-aa53-832a3220b3d2	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	f
00030000-55fa-e0c1-dad3-5d982d002cec	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	f
00030000-55fa-e0c1-73c4-246dcbe9d6b5	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	f
00030000-55fa-e0c1-c6d8-b3476d89a9bc	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	f
00030000-55fa-e0c1-2b13-4a66fd19346a	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	f
00030000-55fa-e0c1-af30-b82ea09bec63	ProgramDela-read	ProgramDela - branje	f
00030000-55fa-e0c1-4477-7f8fa8e39a61	ProgramDela-write	ProgramDela - spreminjanje	f
00030000-55fa-e0c1-68f8-2194d78dc421	ProgramFestival-read	ProgramFestival - branje	f
00030000-55fa-e0c1-99c2-56d64b1a933f	ProgramFestival-write	ProgramFestival - spreminjanje	f
00030000-55fa-e0c1-75bb-74792448c470	ProgramGostovanje-read	ProgramGostovanje - branje	f
00030000-55fa-e0c1-e514-5126f556995a	ProgramGostovanje-write	ProgramGostovanje - spreminjanje	f
00030000-55fa-e0c1-7d4b-17123d96eb29	ProgramGostujoca-read	ProgramGostujoca - branje	f
00030000-55fa-e0c1-cbcc-0ce5e1136a28	ProgramGostujoca-write	ProgramGostujoca - spreminjanje	f
00030000-55fa-e0c1-3ca5-0d1e4c34ac09	ProgramIzjemni-read	ProgramIzjemni - branje	f
00030000-55fa-e0c1-3763-9d9dd84af0e7	ProgramIzjemni-write	ProgramIzjemni - spreminjanje	f
00030000-55fa-e0c1-a7cc-543fca714e1d	ProgramPonovitevPrejsnjih-read	ProgramPonovitevPrejsnjih - branje	f
00030000-55fa-e0c1-e978-782ccb14a105	ProgramPonovitevPrejsnjih-write	ProgramPonovitevPrejsnjih - spreminjanje	f
00030000-55fa-e0c1-6cdd-a16616f4e7f7	ProgramPonovitevPremiere-read	ProgramPonovitevPremiere - branje	f
00030000-55fa-e0c1-ba52-569ece6e318b	ProgramPonovitevPremiere-write	ProgramPonovitevPremiere - spreminjanje	f
00030000-55fa-e0c1-6692-8c7e481a965e	ProgramPremiera-read	ProgramPremiera - branje	f
00030000-55fa-e0c1-63f2-df993509c545	ProgramPremiera-write	ProgramPremiera - spreminjanje	f
00030000-55fa-e0c1-5a54-5d421f9f19b3	ProgramRazno-read	ProgramRazno - branje	f
00030000-55fa-e0c1-af20-55a5d123e83b	ProgramRazno-write	ProgramRazno - spreminjanje	f
00030000-55fa-e0c1-2c08-1163d17b09d3	ProgramskaEnotaSklopa-read	ProgramskaEnotaSklopa - branje	f
00030000-55fa-e0c1-23a9-fc376ebcde5d	ProgramskaEnotaSklopa-write	ProgramskaEnotaSklopa - spreminjanje	f
00030000-55fa-e0c1-dc43-2df900ef185e	Prostor-read	Prostor - branje	f
00030000-55fa-e0c1-d4e8-fdeb92bce9a2	Prostor-write	Prostor - spreminjanje	f
00030000-55fa-e0c1-e502-0e5c91940d11	Racun-read	Racun - branje	f
00030000-55fa-e0c1-50b4-003af11cd6a1	Racun-write	Racun - spreminjanje	f
00030000-55fa-e0c1-58f3-cf342ac657be	RazpisanSedez-read	RazpisanSedez - branje	f
00030000-55fa-e0c1-a3ef-176c383a157a	RazpisanSedez-write	RazpisanSedez - spreminjanje	f
00030000-55fa-e0c1-ed43-ce4a6d2f507a	Rekviziterstvo-read	Rekviziterstvo - branje	f
00030000-55fa-e0c1-cb2c-ed81b4b70d2b	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	f
00030000-55fa-e0c1-aada-9afd4e147443	Rekvizit-read	Rekvizit - branje	f
00030000-55fa-e0c1-64d8-ecba07393574	Rekvizit-write	Rekvizit - spreminjanje	f
00030000-55fa-e0c1-c6f1-2e5e33fa3673	Revizija-read	Revizija - branje	f
00030000-55fa-e0c1-60e1-1ceca8e20bbf	Revizija-write	Revizija - spreminjanje	f
00030000-55fa-e0c1-db4d-5e53b0ad3028	Rezervacija-read	Rezervacija - branje	f
00030000-55fa-e0c1-d904-2b309e9920f5	Rezervacija-write	Rezervacija - spreminjanje	f
00030000-55fa-e0c1-fbdb-936e2f8f9ff3	SedezniRed-read	SedezniRed - branje	f
00030000-55fa-e0c1-425c-58af7754852e	SedezniRed-write	SedezniRed - spreminjanje	f
00030000-55fa-e0c1-2aa8-0ddf48798428	Sedez-read	Sedez - branje	f
00030000-55fa-e0c1-5cc0-2696446c53bf	Sedez-write	Sedez - spreminjanje	f
00030000-55fa-e0c1-d04c-484046f1ba6e	Sezona-read	Sezona - branje	f
00030000-55fa-e0c1-a38e-e29c6c9496c5	Sezona-write	Sezona - spreminjanje	f
00030000-55fa-e0c1-2680-d705b68b73c1	StevilcenjeKonfig-read	StevilcenjeKonfig - branje	f
00030000-55fa-e0c1-e1b1-14ef3e56d3d2	StevilcenjeKonfig-write	StevilcenjeKonfig - spreminjanje	f
00030000-55fa-e0c1-e313-de3262777240	Stevilcenje-read	Stevilcenje - branje	f
00030000-55fa-e0c1-2c4d-f7403727bcad	Stevilcenje-write	Stevilcenje - spreminjanje	f
00030000-55fa-e0c1-df22-43a5d666f635	StevilcenjeStanje-read	StevilcenjeStanje - branje	f
00030000-55fa-e0c1-c753-fbc742a927dc	StevilcenjeStanje-write	StevilcenjeStanje - spreminjanje	f
00030000-55fa-e0c1-4f31-42feb4271c8b	StrosekUprizoritve-read	StrosekUprizoritve - branje	f
00030000-55fa-e0c1-05d3-b08dda979abd	StrosekUprizoritve-write	StrosekUprizoritve - spreminjanje	f
00030000-55fa-e0c1-51ff-06098e05f7f1	Telefonska-read	Telefonska - branje	f
00030000-55fa-e0c1-5a10-a3c7bc46cef8	Telefonska-write	Telefonska - spreminjanje	f
00030000-55fa-e0c1-6a51-95c607c1c0c8	TerminStoritve-read	TerminStoritve - branje	f
00030000-55fa-e0c1-f5db-c2c6ea52c2ed	TerminStoritve-write	TerminStoritve - spreminjanje	f
00030000-55fa-e0c1-4569-371876491e2f	TipFunkcije-read	TipFunkcije - branje	f
00030000-55fa-e0c1-5f3c-86c5cd0b1472	TipFunkcije-write	TipFunkcije - spreminjanje	f
00030000-55fa-e0c1-5617-26b30b2c18bc	TipProgramskeEnote-read	TipProgramskeEnote - branje	f
00030000-55fa-e0c1-e9a0-d346d64e3bb0	TipProgramskeEnote-write	TipProgramskeEnote - spreminjanje	f
00030000-55fa-e0c1-1c55-e8c0765b379c	Trr-read	Trr - branje	f
00030000-55fa-e0c1-962e-baaba90ab4fc	Trr-write	Trr - spreminjanje	f
00030000-55fa-e0c1-d57d-b07ff78da32d	Uprizoritev-read	Uprizoritev - branje	f
00030000-55fa-e0c1-8fe0-7350e76c019c	Uprizoritev-write	Uprizoritev - spreminjanje	f
00030000-55fa-e0c1-9fc4-dc1bad205060	Vaja-read	Vaja - branje	f
00030000-55fa-e0c1-3885-399038941c7f	Vaja-write	Vaja - spreminjanje	f
00030000-55fa-e0c1-454f-0d26b85739a5	VrstaSedezev-read	VrstaSedezev - branje	f
00030000-55fa-e0c1-094e-dda5a831397f	VrstaSedezev-write	VrstaSedezev - spreminjanje	f
00030000-55fa-e0c1-92a3-eeb5e5615b86	VrstaStroska-read	VrstaStroska - branje	f
00030000-55fa-e0c1-5e1c-56f341726878	VrstaStroska-write	VrstaStroska - spreminjanje	f
00030000-55fa-e0c1-b1a5-4029b47fa1a3	Zaposlitev-read	Zaposlitev - branje	f
00030000-55fa-e0c1-384e-f6a400aad6d5	Zaposlitev-write	Zaposlitev - spreminjanje	f
00030000-55fa-e0c1-1f84-7dc3e223ddc3	Zasedenost-read	Zasedenost - branje	f
00030000-55fa-e0c1-802d-67b13961b580	Zasedenost-write	Zasedenost - spreminjanje	f
00030000-55fa-e0c1-5f4f-e44131830198	ZvrstSurs-read	ZvrstSurs - branje	f
00030000-55fa-e0c1-7934-bb7f4f746c08	ZvrstSurs-write	ZvrstSurs - spreminjanje	f
00030000-55fa-e0c1-20ee-20829bb9bb5b	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	f
00030000-55fa-e0c1-567a-cbb2c60fbfbc	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	f
00030000-55fa-e0c1-bf67-c37c7cfaf473	Mapa-write	Mapa - osnovno dovoljenje za pisanje	f
00030000-55fa-e0c1-e8ec-2ad8dbc3d9d6	Mapa-read	Mapa - osnovno dovoljenje za branje	f
00030000-55fa-e0c1-7c91-1bbb4ae9a8b4	MapaAcl-write	MapaAcl - dovoljenje za dostop pisanje ACL-jev mape	f
00030000-55fa-e0c1-fd81-49bbaa880790	MapaAcl-read	MapaAcl - dovoljenje za dostop branje ACL-jev mape	f
00030000-55fa-e0c1-c45b-3569ddadc00d	Zapis-write	Zapis - dovoljenje za pisanje zapisov	f
00030000-55fa-e0c1-e6aa-4472f3a01e0e	Zapis-read	Zapis - dovoljenje za pisanje zapisov	f
00030000-55fa-e0c1-f07e-7f6fd46e2fff	ZapisLastnik-write	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	f
00030000-55fa-e0c1-365a-3f4547b18783	ZapisLastnik-read	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	f
00030000-55fa-e0c1-6ab6-63f5abeb50ac	VrstaZapisa-write	Šifrant vrst zapisa - spreminjanje	f
00030000-55fa-e0c1-b2c9-bfe60365cee1	VrstaZapisa-read	Šifrant vrst zapisa - branje	f
00030000-55fa-e0c1-e49b-1cb5528b5d30	Datoteka-write	Datoteka - spreminjanje	f
00030000-55fa-e0c1-64e2-f2a896ea44a8	Datoteka-read	Datoteke - branje	f
\.


--
-- TOC entry 2934 (class 0 OID 19945544)
-- Dependencies: 180
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-55fa-e0c1-e0af-0c1811aa6453	00030000-55fa-e0c1-adb6-b4d4084c7807
00020000-55fa-e0c1-b1fc-cacc68832730	00030000-55fa-e0c1-47b1-98027a3f6430
00020000-55fa-e0c1-eae1-6a5b04b5a457	00030000-55fa-e0c1-aff5-630792886f2b
00020000-55fa-e0c1-eae1-6a5b04b5a457	00030000-55fa-e0c1-9da1-fcb5c6c08895
00020000-55fa-e0c1-eae1-6a5b04b5a457	00030000-55fa-e0c1-342a-22d92e801ef4
00020000-55fa-e0c1-eae1-6a5b04b5a457	00030000-55fa-e0c1-e963-11ecb577fa31
00020000-55fa-e0c1-eae1-6a5b04b5a457	00030000-55fa-e0c1-5972-a383dcdaf7e8
00020000-55fa-e0c1-eae1-6a5b04b5a457	00030000-55fa-e0c1-bf3d-d8943348b850
00020000-55fa-e0c1-eae1-6a5b04b5a457	00030000-55fa-e0c1-38e5-d33a7a54eb29
00020000-55fa-e0c1-eae1-6a5b04b5a457	00030000-55fa-e0c1-5e40-265ae8caaa9a
00020000-55fa-e0c1-eae1-6a5b04b5a457	00030000-55fa-e0c1-47b1-98027a3f6430
00020000-55fa-e0c1-eae1-6a5b04b5a457	00030000-55fa-e0c1-1073-6e6b97746d5b
00020000-55fa-e0c1-eae1-6a5b04b5a457	00030000-55fa-e0c1-c505-7e355bd051b6
00020000-55fa-e0c1-eae1-6a5b04b5a457	00030000-55fa-e0c1-6f9c-cf030eccacd7
00020000-55fa-e0c1-eae1-6a5b04b5a457	00030000-55fa-e0c1-6993-6d066a8e3031
00020000-55fa-e0c1-eae1-6a5b04b5a457	00030000-55fa-e0c1-d9f2-3f51e1ec8cbe
00020000-55fa-e0c1-eae1-6a5b04b5a457	00030000-55fa-e0c1-d8cb-8115c7c364a3
00020000-55fa-e0c1-eae1-6a5b04b5a457	00030000-55fa-e0c1-c2b0-59e5dffc8d54
00020000-55fa-e0c1-eae1-6a5b04b5a457	00030000-55fa-e0c1-1628-21caf8514f23
00020000-55fa-e0c1-eae1-6a5b04b5a457	00030000-55fa-e0c1-1149-d335b4dfe73b
00020000-55fa-e0c1-eae1-6a5b04b5a457	00030000-55fa-e0c1-01d2-314321c24a17
00020000-55fa-e0c1-eae1-6a5b04b5a457	00030000-55fa-e0c1-3dbd-9db70d92dcc1
00020000-55fa-e0c1-eae1-6a5b04b5a457	00030000-55fa-e0c1-e64c-632cdbf28d74
00020000-55fa-e0c1-eae1-6a5b04b5a457	00030000-55fa-e0c1-1cd9-ab63c5563144
00020000-55fa-e0c1-eae1-6a5b04b5a457	00030000-55fa-e0c1-8fb9-8bcc0aa1eb6a
00020000-55fa-e0c1-eae1-6a5b04b5a457	00030000-55fa-e0c1-f06b-1c649163e331
00020000-55fa-e0c1-eae1-6a5b04b5a457	00030000-55fa-e0c1-3524-dfa0293e4c91
00020000-55fa-e0c1-eae1-6a5b04b5a457	00030000-55fa-e0c1-f15c-004a6b8135a3
00020000-55fa-e0c1-eae1-6a5b04b5a457	00030000-55fa-e0c1-419c-b97a5ffefe8d
00020000-55fa-e0c1-eae1-6a5b04b5a457	00030000-55fa-e0c1-aa79-c2c03622d2cf
00020000-55fa-e0c1-eae1-6a5b04b5a457	00030000-55fa-e0c1-e3fd-10540f6b884c
00020000-55fa-e0c1-eae1-6a5b04b5a457	00030000-55fa-e0c1-ee44-1d68e6f336e5
00020000-55fa-e0c1-eae1-6a5b04b5a457	00030000-55fa-e0c1-c6d8-b3476d89a9bc
00020000-55fa-e0c1-eae1-6a5b04b5a457	00030000-55fa-e0c1-2b13-4a66fd19346a
00020000-55fa-e0c1-eae1-6a5b04b5a457	00030000-55fa-e0c1-dc43-2df900ef185e
00020000-55fa-e0c1-eae1-6a5b04b5a457	00030000-55fa-e0c1-d4e8-fdeb92bce9a2
00020000-55fa-e0c1-eae1-6a5b04b5a457	00030000-55fa-e0c1-ed43-ce4a6d2f507a
00020000-55fa-e0c1-eae1-6a5b04b5a457	00030000-55fa-e0c1-cb2c-ed81b4b70d2b
00020000-55fa-e0c1-eae1-6a5b04b5a457	00030000-55fa-e0c1-aada-9afd4e147443
00020000-55fa-e0c1-eae1-6a5b04b5a457	00030000-55fa-e0c1-64d8-ecba07393574
00020000-55fa-e0c1-eae1-6a5b04b5a457	00030000-55fa-e0c1-d04c-484046f1ba6e
00020000-55fa-e0c1-eae1-6a5b04b5a457	00030000-55fa-e0c1-a38e-e29c6c9496c5
00020000-55fa-e0c1-eae1-6a5b04b5a457	00030000-55fa-e0c1-4569-371876491e2f
00020000-55fa-e0c1-eae1-6a5b04b5a457	00030000-55fa-e0c1-d57d-b07ff78da32d
00020000-55fa-e0c1-eae1-6a5b04b5a457	00030000-55fa-e0c1-8fe0-7350e76c019c
00020000-55fa-e0c1-eae1-6a5b04b5a457	00030000-55fa-e0c1-9fc4-dc1bad205060
00020000-55fa-e0c1-eae1-6a5b04b5a457	00030000-55fa-e0c1-3885-399038941c7f
00020000-55fa-e0c1-eae1-6a5b04b5a457	00030000-55fa-e0c1-1f84-7dc3e223ddc3
00020000-55fa-e0c1-eae1-6a5b04b5a457	00030000-55fa-e0c1-802d-67b13961b580
00020000-55fa-e0c1-eae1-6a5b04b5a457	00030000-55fa-e0c1-5f4f-e44131830198
00020000-55fa-e0c1-eae1-6a5b04b5a457	00030000-55fa-e0c1-20ee-20829bb9bb5b
00020000-55fa-e0c1-1b44-246a3e49633a	00030000-55fa-e0c1-aff5-630792886f2b
00020000-55fa-e0c1-1b44-246a3e49633a	00030000-55fa-e0c1-5972-a383dcdaf7e8
00020000-55fa-e0c1-1b44-246a3e49633a	00030000-55fa-e0c1-bf3d-d8943348b850
00020000-55fa-e0c1-1b44-246a3e49633a	00030000-55fa-e0c1-47b1-98027a3f6430
00020000-55fa-e0c1-1b44-246a3e49633a	00030000-55fa-e0c1-6993-6d066a8e3031
00020000-55fa-e0c1-1b44-246a3e49633a	00030000-55fa-e0c1-d8cb-8115c7c364a3
00020000-55fa-e0c1-1b44-246a3e49633a	00030000-55fa-e0c1-1628-21caf8514f23
00020000-55fa-e0c1-1b44-246a3e49633a	00030000-55fa-e0c1-1149-d335b4dfe73b
00020000-55fa-e0c1-1b44-246a3e49633a	00030000-55fa-e0c1-01d2-314321c24a17
00020000-55fa-e0c1-1b44-246a3e49633a	00030000-55fa-e0c1-3dbd-9db70d92dcc1
00020000-55fa-e0c1-1b44-246a3e49633a	00030000-55fa-e0c1-e64c-632cdbf28d74
00020000-55fa-e0c1-1b44-246a3e49633a	00030000-55fa-e0c1-1cd9-ab63c5563144
00020000-55fa-e0c1-1b44-246a3e49633a	00030000-55fa-e0c1-8fb9-8bcc0aa1eb6a
00020000-55fa-e0c1-1b44-246a3e49633a	00030000-55fa-e0c1-3524-dfa0293e4c91
00020000-55fa-e0c1-1b44-246a3e49633a	00030000-55fa-e0c1-419c-b97a5ffefe8d
00020000-55fa-e0c1-1b44-246a3e49633a	00030000-55fa-e0c1-aa79-c2c03622d2cf
00020000-55fa-e0c1-1b44-246a3e49633a	00030000-55fa-e0c1-e3fd-10540f6b884c
00020000-55fa-e0c1-1b44-246a3e49633a	00030000-55fa-e0c1-dc43-2df900ef185e
00020000-55fa-e0c1-1b44-246a3e49633a	00030000-55fa-e0c1-ed43-ce4a6d2f507a
00020000-55fa-e0c1-1b44-246a3e49633a	00030000-55fa-e0c1-aada-9afd4e147443
00020000-55fa-e0c1-1b44-246a3e49633a	00030000-55fa-e0c1-d04c-484046f1ba6e
00020000-55fa-e0c1-1b44-246a3e49633a	00030000-55fa-e0c1-51ff-06098e05f7f1
00020000-55fa-e0c1-1b44-246a3e49633a	00030000-55fa-e0c1-5a10-a3c7bc46cef8
00020000-55fa-e0c1-1b44-246a3e49633a	00030000-55fa-e0c1-1c55-e8c0765b379c
00020000-55fa-e0c1-1b44-246a3e49633a	00030000-55fa-e0c1-962e-baaba90ab4fc
00020000-55fa-e0c1-1b44-246a3e49633a	00030000-55fa-e0c1-b1a5-4029b47fa1a3
00020000-55fa-e0c1-1b44-246a3e49633a	00030000-55fa-e0c1-384e-f6a400aad6d5
00020000-55fa-e0c1-1b44-246a3e49633a	00030000-55fa-e0c1-5f4f-e44131830198
00020000-55fa-e0c1-1b44-246a3e49633a	00030000-55fa-e0c1-20ee-20829bb9bb5b
00020000-55fa-e0c1-2651-0006165bc24f	00030000-55fa-e0c1-aff5-630792886f2b
00020000-55fa-e0c1-2651-0006165bc24f	00030000-55fa-e0c1-342a-22d92e801ef4
00020000-55fa-e0c1-2651-0006165bc24f	00030000-55fa-e0c1-5972-a383dcdaf7e8
00020000-55fa-e0c1-2651-0006165bc24f	00030000-55fa-e0c1-a934-5351dde75fc4
00020000-55fa-e0c1-2651-0006165bc24f	00030000-55fa-e0c1-b5a4-a1dc2fa60391
00020000-55fa-e0c1-2651-0006165bc24f	00030000-55fa-e0c1-475e-d31268e0a885
00020000-55fa-e0c1-2651-0006165bc24f	00030000-55fa-e0c1-bf3d-d8943348b850
00020000-55fa-e0c1-2651-0006165bc24f	00030000-55fa-e0c1-47b1-98027a3f6430
00020000-55fa-e0c1-2651-0006165bc24f	00030000-55fa-e0c1-c505-7e355bd051b6
00020000-55fa-e0c1-2651-0006165bc24f	00030000-55fa-e0c1-6993-6d066a8e3031
00020000-55fa-e0c1-2651-0006165bc24f	00030000-55fa-e0c1-d8cb-8115c7c364a3
00020000-55fa-e0c1-2651-0006165bc24f	00030000-55fa-e0c1-1628-21caf8514f23
00020000-55fa-e0c1-2651-0006165bc24f	00030000-55fa-e0c1-01d2-314321c24a17
00020000-55fa-e0c1-2651-0006165bc24f	00030000-55fa-e0c1-3dbd-9db70d92dcc1
00020000-55fa-e0c1-2651-0006165bc24f	00030000-55fa-e0c1-e64c-632cdbf28d74
00020000-55fa-e0c1-2651-0006165bc24f	00030000-55fa-e0c1-8fb9-8bcc0aa1eb6a
00020000-55fa-e0c1-2651-0006165bc24f	00030000-55fa-e0c1-3524-dfa0293e4c91
00020000-55fa-e0c1-2651-0006165bc24f	00030000-55fa-e0c1-e3fd-10540f6b884c
00020000-55fa-e0c1-2651-0006165bc24f	00030000-55fa-e0c1-c6d8-b3476d89a9bc
00020000-55fa-e0c1-2651-0006165bc24f	00030000-55fa-e0c1-dc43-2df900ef185e
00020000-55fa-e0c1-2651-0006165bc24f	00030000-55fa-e0c1-ed43-ce4a6d2f507a
00020000-55fa-e0c1-2651-0006165bc24f	00030000-55fa-e0c1-aada-9afd4e147443
00020000-55fa-e0c1-2651-0006165bc24f	00030000-55fa-e0c1-d04c-484046f1ba6e
00020000-55fa-e0c1-2651-0006165bc24f	00030000-55fa-e0c1-4569-371876491e2f
00020000-55fa-e0c1-2651-0006165bc24f	00030000-55fa-e0c1-9fc4-dc1bad205060
00020000-55fa-e0c1-2651-0006165bc24f	00030000-55fa-e0c1-1f84-7dc3e223ddc3
00020000-55fa-e0c1-2651-0006165bc24f	00030000-55fa-e0c1-5f4f-e44131830198
00020000-55fa-e0c1-2651-0006165bc24f	00030000-55fa-e0c1-20ee-20829bb9bb5b
00020000-55fa-e0c1-6a1a-656f693aca9c	00030000-55fa-e0c1-aff5-630792886f2b
00020000-55fa-e0c1-6a1a-656f693aca9c	00030000-55fa-e0c1-9da1-fcb5c6c08895
00020000-55fa-e0c1-6a1a-656f693aca9c	00030000-55fa-e0c1-e963-11ecb577fa31
00020000-55fa-e0c1-6a1a-656f693aca9c	00030000-55fa-e0c1-5972-a383dcdaf7e8
00020000-55fa-e0c1-6a1a-656f693aca9c	00030000-55fa-e0c1-bf3d-d8943348b850
00020000-55fa-e0c1-6a1a-656f693aca9c	00030000-55fa-e0c1-47b1-98027a3f6430
00020000-55fa-e0c1-6a1a-656f693aca9c	00030000-55fa-e0c1-6993-6d066a8e3031
00020000-55fa-e0c1-6a1a-656f693aca9c	00030000-55fa-e0c1-d8cb-8115c7c364a3
00020000-55fa-e0c1-6a1a-656f693aca9c	00030000-55fa-e0c1-01d2-314321c24a17
00020000-55fa-e0c1-6a1a-656f693aca9c	00030000-55fa-e0c1-3dbd-9db70d92dcc1
00020000-55fa-e0c1-6a1a-656f693aca9c	00030000-55fa-e0c1-8fb9-8bcc0aa1eb6a
00020000-55fa-e0c1-6a1a-656f693aca9c	00030000-55fa-e0c1-3524-dfa0293e4c91
00020000-55fa-e0c1-6a1a-656f693aca9c	00030000-55fa-e0c1-e3fd-10540f6b884c
00020000-55fa-e0c1-6a1a-656f693aca9c	00030000-55fa-e0c1-dc43-2df900ef185e
00020000-55fa-e0c1-6a1a-656f693aca9c	00030000-55fa-e0c1-ed43-ce4a6d2f507a
00020000-55fa-e0c1-6a1a-656f693aca9c	00030000-55fa-e0c1-aada-9afd4e147443
00020000-55fa-e0c1-6a1a-656f693aca9c	00030000-55fa-e0c1-d04c-484046f1ba6e
00020000-55fa-e0c1-6a1a-656f693aca9c	00030000-55fa-e0c1-4569-371876491e2f
00020000-55fa-e0c1-6a1a-656f693aca9c	00030000-55fa-e0c1-5f4f-e44131830198
00020000-55fa-e0c1-6a1a-656f693aca9c	00030000-55fa-e0c1-20ee-20829bb9bb5b
00020000-55fa-e0c1-4a3f-bb09cb4f53df	00030000-55fa-e0c1-aff5-630792886f2b
00020000-55fa-e0c1-4a3f-bb09cb4f53df	00030000-55fa-e0c1-5972-a383dcdaf7e8
00020000-55fa-e0c1-4a3f-bb09cb4f53df	00030000-55fa-e0c1-bf3d-d8943348b850
00020000-55fa-e0c1-4a3f-bb09cb4f53df	00030000-55fa-e0c1-47b1-98027a3f6430
00020000-55fa-e0c1-4a3f-bb09cb4f53df	00030000-55fa-e0c1-6993-6d066a8e3031
00020000-55fa-e0c1-4a3f-bb09cb4f53df	00030000-55fa-e0c1-d8cb-8115c7c364a3
00020000-55fa-e0c1-4a3f-bb09cb4f53df	00030000-55fa-e0c1-01d2-314321c24a17
00020000-55fa-e0c1-4a3f-bb09cb4f53df	00030000-55fa-e0c1-3dbd-9db70d92dcc1
00020000-55fa-e0c1-4a3f-bb09cb4f53df	00030000-55fa-e0c1-8fb9-8bcc0aa1eb6a
00020000-55fa-e0c1-4a3f-bb09cb4f53df	00030000-55fa-e0c1-3524-dfa0293e4c91
00020000-55fa-e0c1-4a3f-bb09cb4f53df	00030000-55fa-e0c1-e3fd-10540f6b884c
00020000-55fa-e0c1-4a3f-bb09cb4f53df	00030000-55fa-e0c1-dc43-2df900ef185e
00020000-55fa-e0c1-4a3f-bb09cb4f53df	00030000-55fa-e0c1-ed43-ce4a6d2f507a
00020000-55fa-e0c1-4a3f-bb09cb4f53df	00030000-55fa-e0c1-aada-9afd4e147443
00020000-55fa-e0c1-4a3f-bb09cb4f53df	00030000-55fa-e0c1-d04c-484046f1ba6e
00020000-55fa-e0c1-4a3f-bb09cb4f53df	00030000-55fa-e0c1-6a51-95c607c1c0c8
00020000-55fa-e0c1-4a3f-bb09cb4f53df	00030000-55fa-e0c1-278e-f9c0e07d2272
00020000-55fa-e0c1-4a3f-bb09cb4f53df	00030000-55fa-e0c1-4569-371876491e2f
00020000-55fa-e0c1-4a3f-bb09cb4f53df	00030000-55fa-e0c1-5f4f-e44131830198
00020000-55fa-e0c1-4a3f-bb09cb4f53df	00030000-55fa-e0c1-20ee-20829bb9bb5b
00020000-55fa-e0c2-9568-f4bfa77dc5c2	00030000-55fa-e0c1-0b73-10bcd815255c
00020000-55fa-e0c2-9568-f4bfa77dc5c2	00030000-55fa-e0c1-adb6-b4d4084c7807
00020000-55fa-e0c2-9568-f4bfa77dc5c2	00030000-55fa-e0c1-278e-f9c0e07d2272
00020000-55fa-e0c2-9568-f4bfa77dc5c2	00030000-55fa-e0c1-38e5-d33a7a54eb29
00020000-55fa-e0c2-9568-f4bfa77dc5c2	00030000-55fa-e0c1-82fe-bcc784139930
00020000-55fa-e0c2-9568-f4bfa77dc5c2	00030000-55fa-e0c1-6184-57b97734e735
00020000-55fa-e0c2-9568-f4bfa77dc5c2	00030000-55fa-e0c1-879e-a46423b682cd
00020000-55fa-e0c2-9568-f4bfa77dc5c2	00030000-55fa-e0c1-aff5-630792886f2b
00020000-55fa-e0c2-9568-f4bfa77dc5c2	00030000-55fa-e0c1-9da1-fcb5c6c08895
00020000-55fa-e0c2-9568-f4bfa77dc5c2	00030000-55fa-e0c1-342a-22d92e801ef4
00020000-55fa-e0c2-9568-f4bfa77dc5c2	00030000-55fa-e0c1-e963-11ecb577fa31
00020000-55fa-e0c2-9568-f4bfa77dc5c2	00030000-55fa-e0c1-5972-a383dcdaf7e8
00020000-55fa-e0c2-9568-f4bfa77dc5c2	00030000-55fa-e0c1-a934-5351dde75fc4
00020000-55fa-e0c2-9568-f4bfa77dc5c2	00030000-55fa-e0c1-b5a4-a1dc2fa60391
00020000-55fa-e0c2-9568-f4bfa77dc5c2	00030000-55fa-e0c1-4897-36e7e6ebc56b
00020000-55fa-e0c2-9568-f4bfa77dc5c2	00030000-55fa-e0c1-475e-d31268e0a885
00020000-55fa-e0c2-9568-f4bfa77dc5c2	00030000-55fa-e0c1-d6e8-0bbeea041ea0
00020000-55fa-e0c2-9568-f4bfa77dc5c2	00030000-55fa-e0c1-bf3d-d8943348b850
00020000-55fa-e0c2-9568-f4bfa77dc5c2	00030000-55fa-e0c1-5e40-265ae8caaa9a
00020000-55fa-e0c2-9568-f4bfa77dc5c2	00030000-55fa-e0c1-47b1-98027a3f6430
00020000-55fa-e0c2-9568-f4bfa77dc5c2	00030000-55fa-e0c1-1073-6e6b97746d5b
00020000-55fa-e0c2-9568-f4bfa77dc5c2	00030000-55fa-e0c1-3bef-5a3eab7faa15
00020000-55fa-e0c2-9568-f4bfa77dc5c2	00030000-55fa-e0c1-92dc-948010869e91
00020000-55fa-e0c2-9568-f4bfa77dc5c2	00030000-55fa-e0c1-3469-12175d88333d
00020000-55fa-e0c2-9568-f4bfa77dc5c2	00030000-55fa-e0c1-91d0-6cac662150f4
00020000-55fa-e0c2-9568-f4bfa77dc5c2	00030000-55fa-e0c1-c505-7e355bd051b6
00020000-55fa-e0c2-9568-f4bfa77dc5c2	00030000-55fa-e0c1-6f9c-cf030eccacd7
00020000-55fa-e0c2-9568-f4bfa77dc5c2	00030000-55fa-e0c1-6993-6d066a8e3031
00020000-55fa-e0c2-9568-f4bfa77dc5c2	00030000-55fa-e0c1-d9f2-3f51e1ec8cbe
00020000-55fa-e0c2-9568-f4bfa77dc5c2	00030000-55fa-e0c1-d8cb-8115c7c364a3
00020000-55fa-e0c2-9568-f4bfa77dc5c2	00030000-55fa-e0c1-c2b0-59e5dffc8d54
00020000-55fa-e0c2-9568-f4bfa77dc5c2	00030000-55fa-e0c1-1628-21caf8514f23
00020000-55fa-e0c2-9568-f4bfa77dc5c2	00030000-55fa-e0c1-1149-d335b4dfe73b
00020000-55fa-e0c2-9568-f4bfa77dc5c2	00030000-55fa-e0c1-a2b0-deae13169c03
00020000-55fa-e0c2-9568-f4bfa77dc5c2	00030000-55fa-e0c1-ff40-780fcbf57569
00020000-55fa-e0c2-9568-f4bfa77dc5c2	00030000-55fa-e0c1-6090-46d9839dff4a
00020000-55fa-e0c2-9568-f4bfa77dc5c2	00030000-55fa-e0c1-46ac-348c4137166e
00020000-55fa-e0c2-9568-f4bfa77dc5c2	00030000-55fa-e0c1-01d2-314321c24a17
00020000-55fa-e0c2-9568-f4bfa77dc5c2	00030000-55fa-e0c1-6651-15ba225b318d
00020000-55fa-e0c2-9568-f4bfa77dc5c2	00030000-55fa-e0c1-3dbd-9db70d92dcc1
00020000-55fa-e0c2-9568-f4bfa77dc5c2	00030000-55fa-e0c1-7788-ad4ce1640a2b
00020000-55fa-e0c2-9568-f4bfa77dc5c2	00030000-55fa-e0c1-e64c-632cdbf28d74
00020000-55fa-e0c2-9568-f4bfa77dc5c2	00030000-55fa-e0c1-1cd9-ab63c5563144
00020000-55fa-e0c2-9568-f4bfa77dc5c2	00030000-55fa-e0c1-09d7-dfba6348db29
00020000-55fa-e0c2-9568-f4bfa77dc5c2	00030000-55fa-e0c1-f703-1a23f556bd88
00020000-55fa-e0c2-9568-f4bfa77dc5c2	00030000-55fa-e0c1-29df-2dbad872c839
00020000-55fa-e0c2-9568-f4bfa77dc5c2	00030000-55fa-e0c1-e0e9-92c90ffe2f83
00020000-55fa-e0c2-9568-f4bfa77dc5c2	00030000-55fa-e0c1-a612-b7b2b1a4f9ef
00020000-55fa-e0c2-9568-f4bfa77dc5c2	00030000-55fa-e0c1-548e-0662fee7c195
00020000-55fa-e0c2-9568-f4bfa77dc5c2	00030000-55fa-e0c1-8fb9-8bcc0aa1eb6a
00020000-55fa-e0c2-9568-f4bfa77dc5c2	00030000-55fa-e0c1-f06b-1c649163e331
00020000-55fa-e0c2-9568-f4bfa77dc5c2	00030000-55fa-e0c1-3524-dfa0293e4c91
00020000-55fa-e0c2-9568-f4bfa77dc5c2	00030000-55fa-e0c1-f15c-004a6b8135a3
00020000-55fa-e0c2-9568-f4bfa77dc5c2	00030000-55fa-e0c1-a971-fc4155bf6c31
00020000-55fa-e0c2-9568-f4bfa77dc5c2	00030000-55fa-e0c1-3756-657db9390689
00020000-55fa-e0c2-9568-f4bfa77dc5c2	00030000-55fa-e0c1-dbdc-ca53c56b1b5a
00020000-55fa-e0c2-9568-f4bfa77dc5c2	00030000-55fa-e0c1-73e3-9561c1fd2989
00020000-55fa-e0c2-9568-f4bfa77dc5c2	00030000-55fa-e0c1-419c-b97a5ffefe8d
00020000-55fa-e0c2-9568-f4bfa77dc5c2	00030000-55fa-e0c1-aa79-c2c03622d2cf
00020000-55fa-e0c2-9568-f4bfa77dc5c2	00030000-55fa-e0c1-e3fd-10540f6b884c
00020000-55fa-e0c2-9568-f4bfa77dc5c2	00030000-55fa-e0c1-ee44-1d68e6f336e5
00020000-55fa-e0c2-9568-f4bfa77dc5c2	00030000-55fa-e0c1-0bee-b9d4aa4957a9
00020000-55fa-e0c2-9568-f4bfa77dc5c2	00030000-55fa-e0c1-aa53-832a3220b3d2
00020000-55fa-e0c2-9568-f4bfa77dc5c2	00030000-55fa-e0c1-dad3-5d982d002cec
00020000-55fa-e0c2-9568-f4bfa77dc5c2	00030000-55fa-e0c1-73c4-246dcbe9d6b5
00020000-55fa-e0c2-9568-f4bfa77dc5c2	00030000-55fa-e0c1-c6d8-b3476d89a9bc
00020000-55fa-e0c2-9568-f4bfa77dc5c2	00030000-55fa-e0c1-2b13-4a66fd19346a
00020000-55fa-e0c2-9568-f4bfa77dc5c2	00030000-55fa-e0c1-af30-b82ea09bec63
00020000-55fa-e0c2-9568-f4bfa77dc5c2	00030000-55fa-e0c1-4477-7f8fa8e39a61
00020000-55fa-e0c2-9568-f4bfa77dc5c2	00030000-55fa-e0c1-68f8-2194d78dc421
00020000-55fa-e0c2-9568-f4bfa77dc5c2	00030000-55fa-e0c1-99c2-56d64b1a933f
00020000-55fa-e0c2-9568-f4bfa77dc5c2	00030000-55fa-e0c1-75bb-74792448c470
00020000-55fa-e0c2-9568-f4bfa77dc5c2	00030000-55fa-e0c1-e514-5126f556995a
00020000-55fa-e0c2-9568-f4bfa77dc5c2	00030000-55fa-e0c1-7d4b-17123d96eb29
00020000-55fa-e0c2-9568-f4bfa77dc5c2	00030000-55fa-e0c1-cbcc-0ce5e1136a28
00020000-55fa-e0c2-9568-f4bfa77dc5c2	00030000-55fa-e0c1-3ca5-0d1e4c34ac09
00020000-55fa-e0c2-9568-f4bfa77dc5c2	00030000-55fa-e0c1-3763-9d9dd84af0e7
00020000-55fa-e0c2-9568-f4bfa77dc5c2	00030000-55fa-e0c1-a7cc-543fca714e1d
00020000-55fa-e0c2-9568-f4bfa77dc5c2	00030000-55fa-e0c1-e978-782ccb14a105
00020000-55fa-e0c2-9568-f4bfa77dc5c2	00030000-55fa-e0c1-6cdd-a16616f4e7f7
00020000-55fa-e0c2-9568-f4bfa77dc5c2	00030000-55fa-e0c1-ba52-569ece6e318b
00020000-55fa-e0c2-9568-f4bfa77dc5c2	00030000-55fa-e0c1-6692-8c7e481a965e
00020000-55fa-e0c2-9568-f4bfa77dc5c2	00030000-55fa-e0c1-63f2-df993509c545
00020000-55fa-e0c2-9568-f4bfa77dc5c2	00030000-55fa-e0c1-5a54-5d421f9f19b3
00020000-55fa-e0c2-9568-f4bfa77dc5c2	00030000-55fa-e0c1-af20-55a5d123e83b
00020000-55fa-e0c2-9568-f4bfa77dc5c2	00030000-55fa-e0c1-2c08-1163d17b09d3
00020000-55fa-e0c2-9568-f4bfa77dc5c2	00030000-55fa-e0c1-23a9-fc376ebcde5d
00020000-55fa-e0c2-9568-f4bfa77dc5c2	00030000-55fa-e0c1-dc43-2df900ef185e
00020000-55fa-e0c2-9568-f4bfa77dc5c2	00030000-55fa-e0c1-d4e8-fdeb92bce9a2
00020000-55fa-e0c2-9568-f4bfa77dc5c2	00030000-55fa-e0c1-e502-0e5c91940d11
00020000-55fa-e0c2-9568-f4bfa77dc5c2	00030000-55fa-e0c1-50b4-003af11cd6a1
00020000-55fa-e0c2-9568-f4bfa77dc5c2	00030000-55fa-e0c1-58f3-cf342ac657be
00020000-55fa-e0c2-9568-f4bfa77dc5c2	00030000-55fa-e0c1-a3ef-176c383a157a
00020000-55fa-e0c2-9568-f4bfa77dc5c2	00030000-55fa-e0c1-ed43-ce4a6d2f507a
00020000-55fa-e0c2-9568-f4bfa77dc5c2	00030000-55fa-e0c1-cb2c-ed81b4b70d2b
00020000-55fa-e0c2-9568-f4bfa77dc5c2	00030000-55fa-e0c1-aada-9afd4e147443
00020000-55fa-e0c2-9568-f4bfa77dc5c2	00030000-55fa-e0c1-64d8-ecba07393574
00020000-55fa-e0c2-9568-f4bfa77dc5c2	00030000-55fa-e0c1-c6f1-2e5e33fa3673
00020000-55fa-e0c2-9568-f4bfa77dc5c2	00030000-55fa-e0c1-60e1-1ceca8e20bbf
00020000-55fa-e0c2-9568-f4bfa77dc5c2	00030000-55fa-e0c1-db4d-5e53b0ad3028
00020000-55fa-e0c2-9568-f4bfa77dc5c2	00030000-55fa-e0c1-d904-2b309e9920f5
00020000-55fa-e0c2-9568-f4bfa77dc5c2	00030000-55fa-e0c1-fbdb-936e2f8f9ff3
00020000-55fa-e0c2-9568-f4bfa77dc5c2	00030000-55fa-e0c1-425c-58af7754852e
00020000-55fa-e0c2-9568-f4bfa77dc5c2	00030000-55fa-e0c1-2aa8-0ddf48798428
00020000-55fa-e0c2-9568-f4bfa77dc5c2	00030000-55fa-e0c1-5cc0-2696446c53bf
00020000-55fa-e0c2-9568-f4bfa77dc5c2	00030000-55fa-e0c1-d04c-484046f1ba6e
00020000-55fa-e0c2-9568-f4bfa77dc5c2	00030000-55fa-e0c1-a38e-e29c6c9496c5
00020000-55fa-e0c2-9568-f4bfa77dc5c2	00030000-55fa-e0c1-2680-d705b68b73c1
00020000-55fa-e0c2-9568-f4bfa77dc5c2	00030000-55fa-e0c1-e1b1-14ef3e56d3d2
00020000-55fa-e0c2-9568-f4bfa77dc5c2	00030000-55fa-e0c1-e313-de3262777240
00020000-55fa-e0c2-9568-f4bfa77dc5c2	00030000-55fa-e0c1-2c4d-f7403727bcad
00020000-55fa-e0c2-9568-f4bfa77dc5c2	00030000-55fa-e0c1-df22-43a5d666f635
00020000-55fa-e0c2-9568-f4bfa77dc5c2	00030000-55fa-e0c1-c753-fbc742a927dc
00020000-55fa-e0c2-9568-f4bfa77dc5c2	00030000-55fa-e0c1-4f31-42feb4271c8b
00020000-55fa-e0c2-9568-f4bfa77dc5c2	00030000-55fa-e0c1-05d3-b08dda979abd
00020000-55fa-e0c2-9568-f4bfa77dc5c2	00030000-55fa-e0c1-51ff-06098e05f7f1
00020000-55fa-e0c2-9568-f4bfa77dc5c2	00030000-55fa-e0c1-5a10-a3c7bc46cef8
00020000-55fa-e0c2-9568-f4bfa77dc5c2	00030000-55fa-e0c1-6a51-95c607c1c0c8
00020000-55fa-e0c2-9568-f4bfa77dc5c2	00030000-55fa-e0c1-f5db-c2c6ea52c2ed
00020000-55fa-e0c2-9568-f4bfa77dc5c2	00030000-55fa-e0c1-4569-371876491e2f
00020000-55fa-e0c2-9568-f4bfa77dc5c2	00030000-55fa-e0c1-5f3c-86c5cd0b1472
00020000-55fa-e0c2-9568-f4bfa77dc5c2	00030000-55fa-e0c1-5617-26b30b2c18bc
00020000-55fa-e0c2-9568-f4bfa77dc5c2	00030000-55fa-e0c1-e9a0-d346d64e3bb0
00020000-55fa-e0c2-9568-f4bfa77dc5c2	00030000-55fa-e0c1-1c55-e8c0765b379c
00020000-55fa-e0c2-9568-f4bfa77dc5c2	00030000-55fa-e0c1-962e-baaba90ab4fc
00020000-55fa-e0c2-9568-f4bfa77dc5c2	00030000-55fa-e0c1-d57d-b07ff78da32d
00020000-55fa-e0c2-9568-f4bfa77dc5c2	00030000-55fa-e0c1-8fe0-7350e76c019c
00020000-55fa-e0c2-9568-f4bfa77dc5c2	00030000-55fa-e0c1-9fc4-dc1bad205060
00020000-55fa-e0c2-9568-f4bfa77dc5c2	00030000-55fa-e0c1-3885-399038941c7f
00020000-55fa-e0c2-9568-f4bfa77dc5c2	00030000-55fa-e0c1-454f-0d26b85739a5
00020000-55fa-e0c2-9568-f4bfa77dc5c2	00030000-55fa-e0c1-094e-dda5a831397f
00020000-55fa-e0c2-9568-f4bfa77dc5c2	00030000-55fa-e0c1-92a3-eeb5e5615b86
00020000-55fa-e0c2-9568-f4bfa77dc5c2	00030000-55fa-e0c1-5e1c-56f341726878
00020000-55fa-e0c2-9568-f4bfa77dc5c2	00030000-55fa-e0c1-b1a5-4029b47fa1a3
00020000-55fa-e0c2-9568-f4bfa77dc5c2	00030000-55fa-e0c1-384e-f6a400aad6d5
00020000-55fa-e0c2-9568-f4bfa77dc5c2	00030000-55fa-e0c1-1f84-7dc3e223ddc3
00020000-55fa-e0c2-9568-f4bfa77dc5c2	00030000-55fa-e0c1-802d-67b13961b580
00020000-55fa-e0c2-9568-f4bfa77dc5c2	00030000-55fa-e0c1-5f4f-e44131830198
00020000-55fa-e0c2-9568-f4bfa77dc5c2	00030000-55fa-e0c1-7934-bb7f4f746c08
00020000-55fa-e0c2-9568-f4bfa77dc5c2	00030000-55fa-e0c1-20ee-20829bb9bb5b
00020000-55fa-e0c2-9568-f4bfa77dc5c2	00030000-55fa-e0c1-567a-cbb2c60fbfbc
\.


--
-- TOC entry 2961 (class 0 OID 19945842)
-- Dependencies: 207
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 2965 (class 0 OID 19945876)
-- Dependencies: 211
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 2976 (class 0 OID 19946005)
-- Dependencies: 222
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, zacetek, konec, jeavtorskepravice, placilonavajo, vrednostvaje, planiranostevilovaj, vrednostvaj, vrednostpredstave, vrednostdopremiere, aktivna, zaposlenvdrjz, samozaposlen, igralec, opis) FROM stdin;
000b0000-55fa-e0c2-8587-30568d5c2329	00090000-55fa-e0c2-9c47-50bf5654b0ad	\N	\N	0001	\N	\N	f	f	10.00	3	10.00	30.00	10.00	t	t	f	t	Pogodba o sodelovanju
000b0000-55fa-e0c2-a78e-e1f7700bd491	00090000-55fa-e0c2-6aeb-88b5fd3c2b23	\N	\N	0002	\N	\N	f	t	11.00	10	11.00	31.00	110.00	t	f	t	t	Pogodba za vlogo Helena
000b0000-55fa-e0c2-eb45-17ba1dd19c00	00090000-55fa-e0c2-a094-e1a18d488ca7	\N	\N	0003	\N	\N	f	f	12.00	4	12.00	32.00	12.00	t	f	t	f	Pogodba za lektoriranje
000b0000-55fa-e0c2-51c4-a6ed94262dd3	00090000-55fa-e0c2-9cd1-b1af0e9d3d15	\N	\N	0004	\N	\N	t	f	0.00	2	300.00	30.00	300.00	t	f	t	f	Pogodba za avtorske pravice
\.


--
-- TOC entry 2939 (class 0 OID 19945604)
-- Dependencies: 185
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, drzava_id, sifra, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo, nvo) FROM stdin;
00080000-55fa-e0c2-7259-ea96a8ba40d0	00040000-55fa-e0c1-f632-c16a9667dc65	0988	AK	Juhuhu d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55fa-e0c2-e448-3f18acf51040	00040000-55fa-e0c1-f632-c16a9667dc65	0989	AK	Hopsasa d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	t
00080000-55fa-e0c2-d56a-e8ffb5b5c36e	00040000-55fa-e0c1-f632-c16a9667dc65	0987	AK	Gledališče Šrum d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55fa-e0c2-a804-167be1e4f771	00040000-55fa-e0c1-f632-c16a9667dc65	0986	AK	Lutkovni Direndaj d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55fa-e0c2-845a-bc80ac1a02b7	00040000-55fa-e0c1-f632-c16a9667dc65	0985	AK	Tatjana Stanič, Lektoriranje, s.p.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55fa-e0c2-ebfd-e8cbb25f8c5e	00040000-55fa-e0c1-db9d-46e30f41f3d4	0984	AK	Gledališče Lepote tvoje		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55fa-e0c2-45f5-fa36ed58260e	00040000-55fa-e0c1-f2d8-5c9ac5c711e6	0983	AK	Sunce naše		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55fa-e0c2-525d-47604066f495	00040000-55fa-e0c1-7d93-d4e04fdf4024	0982	AK	Theater Amadeus		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55fa-e0c2-51f1-43cf47059ba8	00040000-55fa-e0c1-c2b7-3ec5c98ff7ea	9999	AK	Fuchs		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55fa-e0c3-dd77-a6c27847c3f5	00040000-55fa-e0c1-f632-c16a9667dc65	1001	AK	Gledališče Matica		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
\.


--
-- TOC entry 2941 (class 0 OID 19945638)
-- Dependencies: 187
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-55fa-e0c0-9849-9dac7b6d20c3	8341	Adlešiči
00050000-55fa-e0c0-35e7-84e74da241e4	5270	Ajdovščina
00050000-55fa-e0c0-e6cb-4c841b667a19	6280	Ankaran/Ancarano
00050000-55fa-e0c0-791e-0919deb2b093	9253	Apače
00050000-55fa-e0c0-a570-06dc94c1ca28	8253	Artiče
00050000-55fa-e0c0-e295-a557f79d4f33	4275	Begunje na Gorenjskem
00050000-55fa-e0c0-99b3-ff7e71a64101	1382	Begunje pri Cerknici
00050000-55fa-e0c0-c41d-e7737f8b83e1	9231	Beltinci
00050000-55fa-e0c0-93f3-ce528b69072d	2234	Benedikt
00050000-55fa-e0c0-30bf-5f61e3d1913a	2345	Bistrica ob Dravi
00050000-55fa-e0c0-58b5-2de92c615727	3256	Bistrica ob Sotli
00050000-55fa-e0c0-3793-002dc96dc3af	8259	Bizeljsko
00050000-55fa-e0c0-ded3-d2cd773f7981	1223	Blagovica
00050000-55fa-e0c0-79ef-bfd89bc3b124	8283	Blanca
00050000-55fa-e0c0-417a-32d3bd7c6792	4260	Bled
00050000-55fa-e0c0-4243-dd6022468dde	4273	Blejska Dobrava
00050000-55fa-e0c0-3c74-866354febd22	9265	Bodonci
00050000-55fa-e0c0-4d97-613732b40bd2	9222	Bogojina
00050000-55fa-e0c0-642f-79e6e2e862d0	4263	Bohinjska Bela
00050000-55fa-e0c0-9bf0-1d207a33e895	4264	Bohinjska Bistrica
00050000-55fa-e0c0-214d-16de7694954c	4265	Bohinjsko jezero
00050000-55fa-e0c0-e9b0-46fe641167ed	1353	Borovnica
00050000-55fa-e0c0-1f6f-579c37ac70fd	8294	Boštanj
00050000-55fa-e0c0-9564-00e67297a48b	5230	Bovec
00050000-55fa-e0c0-123d-e8128583e4eb	5295	Branik
00050000-55fa-e0c0-a285-665713a47a74	3314	Braslovče
00050000-55fa-e0c0-6848-d266109cdb7d	5223	Breginj
00050000-55fa-e0c0-9233-f0bd96f03ad8	8280	Brestanica
00050000-55fa-e0c0-03d2-6ff5dad3b5a1	2354	Bresternica
00050000-55fa-e0c0-d36b-ec444dbf992d	4243	Brezje
00050000-55fa-e0c0-95d7-80454053db75	1351	Brezovica pri Ljubljani
00050000-55fa-e0c0-92f7-941946062397	8250	Brežice
00050000-55fa-e0c0-14e4-2e877e99bc06	4210	Brnik - Aerodrom
00050000-55fa-e0c0-6622-ef8f8946c14c	8321	Brusnice
00050000-55fa-e0c0-4ba0-0df900314bff	3255	Buče
00050000-55fa-e0c0-0832-011205c748aa	8276	Bučka 
00050000-55fa-e0c0-1320-377dfde58e65	9261	Cankova
00050000-55fa-e0c0-411b-49c789aff1eb	3000	Celje 
00050000-55fa-e0c0-817d-a71f2e0a8912	3001	Celje - poštni predali
00050000-55fa-e0c0-ce4f-3a99407dde30	4207	Cerklje na Gorenjskem
00050000-55fa-e0c0-5e44-182c4d56dd16	8263	Cerklje ob Krki
00050000-55fa-e0c0-68b9-5d86d4a2dcfe	1380	Cerknica
00050000-55fa-e0c0-51f1-6b6ef4d215ae	5282	Cerkno
00050000-55fa-e0c0-9587-b5de62a7c089	2236	Cerkvenjak
00050000-55fa-e0c0-7c40-78dcab46369f	2215	Ceršak
00050000-55fa-e0c0-3ff1-5392030614cb	2326	Cirkovce
00050000-55fa-e0c0-9073-0419997ea01d	2282	Cirkulane
00050000-55fa-e0c0-04ce-20bf635aa05e	5273	Col
00050000-55fa-e0c0-dbbc-7c835fc0beb0	8251	Čatež ob Savi
00050000-55fa-e0c0-6f34-4d35d0b594d9	1413	Čemšenik
00050000-55fa-e0c0-cd39-8787cc266518	5253	Čepovan
00050000-55fa-e0c0-e5cb-6d7af82fcd0e	9232	Črenšovci
00050000-55fa-e0c0-b146-f6714b3a6c3f	2393	Črna na Koroškem
00050000-55fa-e0c0-a60e-6fe8cb769fdb	6275	Črni Kal
00050000-55fa-e0c0-92cb-a0943f671ec3	5274	Črni Vrh nad Idrijo
00050000-55fa-e0c0-2fad-28954bd7306d	5262	Črniče
00050000-55fa-e0c0-bc2c-dff2b9bf8ca7	8340	Črnomelj
00050000-55fa-e0c0-8a38-4513d7023b78	6271	Dekani
00050000-55fa-e0c0-153b-3d07f110b97e	5210	Deskle
00050000-55fa-e0c0-b850-ae32679d771f	2253	Destrnik
00050000-55fa-e0c0-0bc8-a5181e74f5f7	6215	Divača
00050000-55fa-e0c0-d87f-90099e8fcae8	1233	Dob
00050000-55fa-e0c0-973b-d31f8ba53945	3224	Dobje pri Planini
00050000-55fa-e0c0-68a0-9f57bb0d6d46	8257	Dobova
00050000-55fa-e0c0-ffcd-9e1050a42a41	1423	Dobovec
00050000-55fa-e0c0-2bbb-68e0ceba4195	5263	Dobravlje
00050000-55fa-e0c0-2a96-926bec87dff8	3204	Dobrna
00050000-55fa-e0c0-b3e1-54a3702d48d6	8211	Dobrnič
00050000-55fa-e0c0-6169-de7a99f28a07	1356	Dobrova
00050000-55fa-e0c0-6ef7-7ee32289f2ea	9223	Dobrovnik/Dobronak 
00050000-55fa-e0c0-e0a7-b3fecba63ded	5212	Dobrovo v Brdih
00050000-55fa-e0c0-16ee-33dfc59e97ab	1431	Dol pri Hrastniku
00050000-55fa-e0c0-a480-bd02f1317dad	1262	Dol pri Ljubljani
00050000-55fa-e0c0-c9a4-03f0cc0598fa	1273	Dole pri Litiji
00050000-55fa-e0c0-4d3c-673af40de8be	1331	Dolenja vas
00050000-55fa-e0c0-9074-4f5180178a07	8350	Dolenjske Toplice
00050000-55fa-e0c0-06ee-89b226144df0	1230	Domžale
00050000-55fa-e0c0-3b49-67eb14ed60be	2252	Dornava
00050000-55fa-e0c0-c792-2805e24b4317	5294	Dornberk
00050000-55fa-e0c0-7cfa-316571cf30eb	1319	Draga
00050000-55fa-e0c0-a236-f788afc42aca	8343	Dragatuš
00050000-55fa-e0c0-6621-9ebdd621b729	3222	Dramlje
00050000-55fa-e0c0-4cfb-d09adec6a0c1	2370	Dravograd
00050000-55fa-e0c0-2965-f91cce238ae8	4203	Duplje
00050000-55fa-e0c0-96b9-5cb843dbc2a0	6221	Dutovlje
00050000-55fa-e0c0-59cd-cd437dc5b57f	8361	Dvor
00050000-55fa-e0c0-805a-4ddfb01b7369	2343	Fala
00050000-55fa-e0c0-1340-0d940375ecee	9208	Fokovci
00050000-55fa-e0c0-cb95-449290d529dd	2313	Fram
00050000-55fa-e0c0-3cc6-dc9df5a6620a	3213	Frankolovo
00050000-55fa-e0c0-0b45-572dbdd0dec3	1274	Gabrovka
00050000-55fa-e0c0-0dd6-5712912bf5ee	8254	Globoko
00050000-55fa-e0c0-132d-f2bcf3acf8d7	5275	Godovič
00050000-55fa-e0c0-e07f-855c23424913	4204	Golnik
00050000-55fa-e0c0-c8c9-8344c9d70771	3303	Gomilsko
00050000-55fa-e0c0-73f9-93796672faba	4224	Gorenja vas
00050000-55fa-e0c0-2f72-c57c1c2b99e5	3263	Gorica pri Slivnici
00050000-55fa-e0c0-355f-db188f3f76e9	2272	Gorišnica
00050000-55fa-e0c0-2c47-959a096c5d37	9250	Gornja Radgona
00050000-55fa-e0c0-d4a7-959efee3e333	3342	Gornji Grad
00050000-55fa-e0c0-e201-f106152cbc1c	4282	Gozd Martuljek
00050000-55fa-e0c0-267a-beebb0275f5d	6272	Gračišče
00050000-55fa-e0c0-de2f-2115de710cd4	9264	Grad
00050000-55fa-e0c0-cd73-b0765bdfbb92	8332	Gradac
00050000-55fa-e0c0-d800-ba8a8669a7af	1384	Grahovo
00050000-55fa-e0c0-6d08-40bc431c68cc	5242	Grahovo ob Bači
00050000-55fa-e0c0-c98f-9d602be7cea4	5251	Grgar
00050000-55fa-e0c0-0f72-e331b06e10bc	3302	Griže
00050000-55fa-e0c0-2b5d-7ea49c3b4be1	3231	Grobelno
00050000-55fa-e0c0-6543-1dda8001332e	1290	Grosuplje
00050000-55fa-e0c0-9091-a4ed0e651104	2288	Hajdina
00050000-55fa-e0c0-56da-a77085e198a7	8362	Hinje
00050000-55fa-e0c0-3795-93e4406bde52	2311	Hoče
00050000-55fa-e0c0-65ce-e01ace5600c3	9205	Hodoš/Hodos
00050000-55fa-e0c0-8976-80427c8cb712	1354	Horjul
00050000-55fa-e0c0-5373-794f10fb47eb	1372	Hotedršica
00050000-55fa-e0c0-5f48-ce7a38758638	1430	Hrastnik
00050000-55fa-e0c0-2287-6a23923937ec	6225	Hruševje
00050000-55fa-e0c0-33d1-825e6c63245f	4276	Hrušica
00050000-55fa-e0c0-ddd8-c73d6719d778	5280	Idrija
00050000-55fa-e0c0-b957-0250ebb80944	1292	Ig
00050000-55fa-e0c0-8940-a8dae8ceda09	6250	Ilirska Bistrica
00050000-55fa-e0c0-03fb-3394afd6bece	6251	Ilirska Bistrica-Trnovo
00050000-55fa-e0c0-422b-7df8e2884bfc	1295	Ivančna Gorica
00050000-55fa-e0c0-c7ff-b4a1bac77a16	2259	Ivanjkovci
00050000-55fa-e0c0-915d-5f44d0042935	1411	Izlake
00050000-55fa-e0c0-a697-4db4850d2d03	6310	Izola/Isola
00050000-55fa-e0c0-ba8d-a0ab553bd772	2222	Jakobski Dol
00050000-55fa-e0c0-0219-5546e8fb18de	2221	Jarenina
00050000-55fa-e0c0-0245-53ba8b8c5ded	6254	Jelšane
00050000-55fa-e0c0-42e1-dd72811fdb24	4270	Jesenice
00050000-55fa-e0c0-adcb-833556915d0f	8261	Jesenice na Dolenjskem
00050000-55fa-e0c0-30f2-5f1d6c868d02	3273	Jurklošter
00050000-55fa-e0c0-cb5e-bfe54a216750	2223	Jurovski Dol
00050000-55fa-e0c0-8451-5d2315322891	2256	Juršinci
00050000-55fa-e0c0-95f3-58188bb9755f	5214	Kal nad Kanalom
00050000-55fa-e0c0-1711-6d0ff9807599	3233	Kalobje
00050000-55fa-e0c0-7513-73987ba80104	4246	Kamna Gorica
00050000-55fa-e0c0-a250-bb58d737f2ad	2351	Kamnica
00050000-55fa-e0c0-8845-329a069e3e6f	1241	Kamnik
00050000-55fa-e0c0-d27e-5a0975fd7407	5213	Kanal
00050000-55fa-e0c0-a473-9b6538a3b80b	8258	Kapele
00050000-55fa-e0c0-dcd7-9f038152aee4	2362	Kapla
00050000-55fa-e0c0-9779-f62cf851d2bd	2325	Kidričevo
00050000-55fa-e0c0-0a13-a7d79356a8b3	1412	Kisovec
00050000-55fa-e0c0-b3cf-85fcf0089dee	6253	Knežak
00050000-55fa-e0c0-91bc-c2f0deeb90b5	5222	Kobarid
00050000-55fa-e0c0-9dcb-4af1143c8510	9227	Kobilje
00050000-55fa-e0c0-7827-cfdbc39198be	1330	Kočevje
00050000-55fa-e0c0-6c3e-b8db3e650eeb	1338	Kočevska Reka
00050000-55fa-e0c0-ac83-5b715c739c0a	2276	Kog
00050000-55fa-e0c0-0c93-416c55e71870	5211	Kojsko
00050000-55fa-e0c0-ed69-7a1fd95b9adc	6223	Komen
00050000-55fa-e0c0-a2c7-ec8111aee4a3	1218	Komenda
00050000-55fa-e0c0-a2ae-253697d20cdc	6000	Koper/Capodistria 
00050000-55fa-e0c0-bc9f-1a1a8ab2fce0	6001	Koper/Capodistria - poštni predali
00050000-55fa-e0c0-350e-82622a527634	8282	Koprivnica
00050000-55fa-e0c0-e200-a89fe2de65d8	5296	Kostanjevica na Krasu
00050000-55fa-e0c0-1944-20d0e012c6b0	8311	Kostanjevica na Krki
00050000-55fa-e0c0-37eb-e924441ee88c	1336	Kostel
00050000-55fa-e0c0-d6bb-1825b4560032	6256	Košana
00050000-55fa-e0c0-339c-5ed1f871b3e7	2394	Kotlje
00050000-55fa-e0c0-fb01-529ec49e231f	6240	Kozina
00050000-55fa-e0c0-8f93-81afce4dc209	3260	Kozje
00050000-55fa-e0c0-8a09-2b06dda1231a	4000	Kranj 
00050000-55fa-e0c0-ee2f-d777d605df3f	4001	Kranj - poštni predali
00050000-55fa-e0c0-121b-4960ee0a6a7f	4280	Kranjska Gora
00050000-55fa-e0c0-5c8f-bcdfb1ed657b	1281	Kresnice
00050000-55fa-e0c0-887c-b3ea189916c6	4294	Križe
00050000-55fa-e0c0-e2a9-4667b162d139	9206	Križevci
00050000-55fa-e0c0-59d4-6d53f10f0985	9242	Križevci pri Ljutomeru
00050000-55fa-e0c0-6511-03d4d60be669	1301	Krka
00050000-55fa-e0c0-0d3c-107bf3868751	8296	Krmelj
00050000-55fa-e0c0-b33c-bd7f72c8c8e7	4245	Kropa
00050000-55fa-e0c0-000f-3b14d71100f3	8262	Krška vas
00050000-55fa-e0c0-534c-c4a2a6c4c46b	8270	Krško
00050000-55fa-e0c0-321e-a94928318330	9263	Kuzma
00050000-55fa-e0c0-3bfb-62bc1da8597b	2318	Laporje
00050000-55fa-e0c0-97fe-238af14d52fc	3270	Laško
00050000-55fa-e0c0-a4f7-27d8e02ce783	1219	Laze v Tuhinju
00050000-55fa-e0c0-f42a-f361fb7c7322	2230	Lenart v Slovenskih goricah
00050000-55fa-e0c0-f0bd-cf18ba9c32b9	9220	Lendava/Lendva
00050000-55fa-e0c0-ef24-a830010fab46	4248	Lesce
00050000-55fa-e0c0-3abb-562b038368f6	3261	Lesično
00050000-55fa-e0c0-560b-34c66fbe9fe3	8273	Leskovec pri Krškem
00050000-55fa-e0c0-e7ff-235f8ce38d47	2372	Libeliče
00050000-55fa-e0c0-46d1-5f11b8f9f0d1	2341	Limbuš
00050000-55fa-e0c0-ded1-45e0eaa2f4f1	1270	Litija
00050000-55fa-e0c0-1811-2e079e119679	3202	Ljubečna
00050000-55fa-e0c0-e37b-418950a66b07	1000	Ljubljana 
00050000-55fa-e0c0-6d1c-dd8315f7fc86	1001	Ljubljana - poštni predali
00050000-55fa-e0c0-8eda-6f76b0c63bcc	1231	Ljubljana - Črnuče
00050000-55fa-e0c0-8c81-2446927775fc	1261	Ljubljana - Dobrunje
00050000-55fa-e0c0-0837-46521399fc59	1260	Ljubljana - Polje
00050000-55fa-e0c0-9df6-8ad659d34faa	1210	Ljubljana - Šentvid
00050000-55fa-e0c0-f48c-38c09e76af34	1211	Ljubljana - Šmartno
00050000-55fa-e0c0-e478-e8f3ba307a92	3333	Ljubno ob Savinji
00050000-55fa-e0c0-7edc-c0021f97a9ed	9240	Ljutomer
00050000-55fa-e0c0-90b0-1e35ea0375d2	3215	Loče
00050000-55fa-e0c0-8281-5c922c586a16	5231	Log pod Mangartom
00050000-55fa-e0c0-18d9-21e3bdf92ff3	1358	Log pri Brezovici
00050000-55fa-e0c0-d48e-def7e06d6bc1	1370	Logatec
00050000-55fa-e0c0-a039-9738cb688ebb	1371	Logatec
00050000-55fa-e0c0-8aa7-0d0f0cb288f8	1434	Loka pri Zidanem Mostu
00050000-55fa-e0c0-b900-bf769860ee0d	3223	Loka pri Žusmu
00050000-55fa-e0c0-fbad-427c68521052	6219	Lokev
00050000-55fa-e0c0-ab43-91e395741d85	1318	Loški Potok
00050000-55fa-e0c0-5eed-a2992cfb6ce6	2324	Lovrenc na Dravskem polju
00050000-55fa-e0c0-1c6a-8aefb8364bd5	2344	Lovrenc na Pohorju
00050000-55fa-e0c0-c500-f0b64f5e2b86	3334	Luče
00050000-55fa-e0c0-aa2c-06b1a0838917	1225	Lukovica
00050000-55fa-e0c0-4a0c-ac870f4c01ff	9202	Mačkovci
00050000-55fa-e0c0-1d5a-334598a2d6ea	2322	Majšperk
00050000-55fa-e0c0-cc9b-d23fedad49f1	2321	Makole
00050000-55fa-e0c0-7a02-4cd08203a9a8	9243	Mala Nedelja
00050000-55fa-e0c0-0f0d-e62c65e7a7cd	2229	Malečnik
00050000-55fa-e0c0-79f3-b848f747e1d0	6273	Marezige
00050000-55fa-e0c0-e9e4-4ef7f8263bc7	2000	Maribor 
00050000-55fa-e0c0-da07-c68ef967e857	2001	Maribor - poštni predali
00050000-55fa-e0c0-8b96-6c999688cbcb	2206	Marjeta na Dravskem polju
00050000-55fa-e0c0-e8a6-5e9097f1dd74	2281	Markovci
00050000-55fa-e0c0-f58f-ba92d9b82af5	9221	Martjanci
00050000-55fa-e0c0-1994-211ea8885006	6242	Materija
00050000-55fa-e0c0-0d2e-7bcf6d223c9a	4211	Mavčiče
00050000-55fa-e0c0-30ea-0e0e46744d6d	1215	Medvode
00050000-55fa-e0c0-ecb1-4e6764c50fea	1234	Mengeš
00050000-55fa-e0c0-2c23-82a510c8750f	8330	Metlika
00050000-55fa-e0c0-5ce3-9f4cb90dad22	2392	Mežica
00050000-55fa-e0c0-68f3-c02344bef819	2204	Miklavž na Dravskem polju
00050000-55fa-e0c0-ee49-b1d614726699	2275	Miklavž pri Ormožu
00050000-55fa-e0c0-0d43-8cf1ac03ab08	5291	Miren
00050000-55fa-e0c0-81df-1a9d0d190aab	8233	Mirna
00050000-55fa-e0c0-f849-4e997980d20b	8216	Mirna Peč
00050000-55fa-e0c0-6a83-4df8feaba5ba	2382	Mislinja
00050000-55fa-e0c0-54b0-da433fd843e4	4281	Mojstrana
00050000-55fa-e0c0-2a09-b634fdae993f	8230	Mokronog
00050000-55fa-e0c0-93f6-850144cd1559	1251	Moravče
00050000-55fa-e0c0-497c-344a050db05c	9226	Moravske Toplice
00050000-55fa-e0c0-7c9e-4f633a6be487	5216	Most na Soči
00050000-55fa-e0c0-d109-1ab422be138a	1221	Motnik
00050000-55fa-e0c0-0322-b2c67e09a9fb	3330	Mozirje
00050000-55fa-e0c0-1663-61be0fd3e99c	9000	Murska Sobota 
00050000-55fa-e0c0-9e31-770a41f4c3bf	9001	Murska Sobota - poštni predali
00050000-55fa-e0c0-da88-579bb55375a1	2366	Muta
00050000-55fa-e0c0-5c57-bd50a8b90da4	4202	Naklo
00050000-55fa-e0c0-68c4-78814109af4d	3331	Nazarje
00050000-55fa-e0c0-6202-b868bef314fe	1357	Notranje Gorice
00050000-55fa-e0c0-ac0f-4322d031c9bc	3203	Nova Cerkev
00050000-55fa-e0c0-14d4-a799f20d2ced	5000	Nova Gorica 
00050000-55fa-e0c0-abe5-752cf4f989a6	5001	Nova Gorica - poštni predali
00050000-55fa-e0c0-e090-b74488e3be28	1385	Nova vas
00050000-55fa-e0c0-f818-f1c4f66f5ff9	8000	Novo mesto
00050000-55fa-e0c0-c552-8c7fb4b34884	8001	Novo mesto - poštni predali
00050000-55fa-e0c0-f6e5-d257df0deaf7	6243	Obrov
00050000-55fa-e0c0-8d54-183c334e8a94	9233	Odranci
00050000-55fa-e0c0-dffc-195071df287d	2317	Oplotnica
00050000-55fa-e0c0-2246-9deb6c46733b	2312	Orehova vas
00050000-55fa-e0c0-13cf-1a3d923c5e34	2270	Ormož
00050000-55fa-e0c0-26b7-245bb47967a0	1316	Ortnek
00050000-55fa-e0c0-ad4e-67ca6862390b	1337	Osilnica
00050000-55fa-e0c0-02a9-15f5b2db82f2	8222	Otočec
00050000-55fa-e0c0-4c1d-0c3c5e1201da	2361	Ožbalt
00050000-55fa-e0c0-6391-f19d6780bb35	2231	Pernica
00050000-55fa-e0c0-c473-6ac21fec1fcb	2211	Pesnica pri Mariboru
00050000-55fa-e0c0-ac5a-06bdec34c4e0	9203	Petrovci
00050000-55fa-e0c0-91fe-8630cdaf4a8a	3301	Petrovče
00050000-55fa-e0c0-2c16-78edb3adab46	6330	Piran/Pirano
00050000-55fa-e0c0-d215-ca925f07c734	8255	Pišece
00050000-55fa-e0c0-7886-d2d7b831b258	6257	Pivka
00050000-55fa-e0c0-bc6c-f5e1d43e7c6d	6232	Planina
00050000-55fa-e0c0-4fbc-c70ee4557ae9	3225	Planina pri Sevnici
00050000-55fa-e0c0-c692-c7da7a933c0e	6276	Pobegi
00050000-55fa-e0c0-8adb-e72ddc3b6273	8312	Podbočje
00050000-55fa-e0c0-a6a2-2a726be5b507	5243	Podbrdo
00050000-55fa-e0c0-8aa5-08d2425429e8	3254	Podčetrtek
00050000-55fa-e0c0-33a4-5b0aa3079f9b	2273	Podgorci
00050000-55fa-e0c0-65d5-0d8a13778d91	6216	Podgorje
00050000-55fa-e0c0-8423-1441df745471	2381	Podgorje pri Slovenj Gradcu
00050000-55fa-e0c0-fa5d-36d5c4ddcd39	6244	Podgrad
00050000-55fa-e0c0-68f0-5ff11d36ce80	1414	Podkum
00050000-55fa-e0c0-7f60-34b5ba601aa5	2286	Podlehnik
00050000-55fa-e0c0-eac4-1f549749e406	5272	Podnanos
00050000-55fa-e0c0-9f0f-e941b695bd8a	4244	Podnart
00050000-55fa-e0c0-afca-a7564c7aa3d0	3241	Podplat
00050000-55fa-e0c0-1bf4-6a8ae01b9019	3257	Podsreda
00050000-55fa-e0c0-c07b-5bea0faa8f16	2363	Podvelka
00050000-55fa-e0c0-0bb9-31bba1d7977a	2208	Pohorje
00050000-55fa-e0c0-37fb-9479c39ab5c6	2257	Polenšak
00050000-55fa-e0c0-1ba1-f6721d246e09	1355	Polhov Gradec
00050000-55fa-e0c0-71aa-cf6cb910244f	4223	Poljane nad Škofjo Loko
00050000-55fa-e0c0-d7d3-a7ebfdf0b021	2319	Poljčane
00050000-55fa-e0c0-4c3d-a869a42f35c1	1272	Polšnik
00050000-55fa-e0c0-829a-affb46b3d943	3313	Polzela
00050000-55fa-e0c0-3100-72a9c7294804	3232	Ponikva
00050000-55fa-e0c0-b854-2c34fea5d87f	6320	Portorož/Portorose
00050000-55fa-e0c0-64af-9936e01666ba	6230	Postojna
00050000-55fa-e0c0-d60a-f4d3673f1f0f	2331	Pragersko
00050000-55fa-e0c0-3671-7f24e492d6c9	3312	Prebold
00050000-55fa-e0c0-726b-e8fcf028d7e4	4205	Preddvor
00050000-55fa-e0c0-7b63-2bb015359eb1	6255	Prem
00050000-55fa-e0c0-9837-7d82960fd211	1352	Preserje
00050000-55fa-e0c0-c6dd-3f799c27b0cd	6258	Prestranek
00050000-55fa-e0c0-266b-a3499ba0161c	2391	Prevalje
00050000-55fa-e0c0-bac1-a9c1c63505ee	3262	Prevorje
00050000-55fa-e0c0-8491-a029a0c3f216	1276	Primskovo 
00050000-55fa-e0c0-cfe5-e0002a062ba0	3253	Pristava pri Mestinju
00050000-55fa-e0c0-051e-55db60979f3b	9207	Prosenjakovci/Partosfalva
00050000-55fa-e0c0-fbb1-8fc1ea55442e	5297	Prvačina
00050000-55fa-e0c0-07e2-936a2b27466d	2250	Ptuj
00050000-55fa-e0c0-cafe-96f3e044a058	2323	Ptujska Gora
00050000-55fa-e0c0-2a5e-689c36a25615	9201	Puconci
00050000-55fa-e0c0-2c97-f5d1bce7fefc	2327	Rače
00050000-55fa-e0c0-312e-95064804e08a	1433	Radeče
00050000-55fa-e0c0-cdf9-5c534a6a1914	9252	Radenci
00050000-55fa-e0c0-58fe-379d76bcaa19	2360	Radlje ob Dravi
00050000-55fa-e0c0-6a13-b14d94856078	1235	Radomlje
00050000-55fa-e0c0-d8e7-a28f5c1ae1ef	4240	Radovljica
00050000-55fa-e0c0-bec1-18b1ee047864	8274	Raka
00050000-55fa-e0c0-92a7-d077c313d5ec	1381	Rakek
00050000-55fa-e0c0-be0b-0eccabcc7ef3	4283	Rateče - Planica
00050000-55fa-e0c0-1410-90364c3c9d0a	2390	Ravne na Koroškem
00050000-55fa-e0c1-2718-9236cd68b2e5	9246	Razkrižje
00050000-55fa-e0c1-855e-7b1f1173efa5	3332	Rečica ob Savinji
00050000-55fa-e0c1-74a0-0c0dc1772633	5292	Renče
00050000-55fa-e0c1-5a2e-96f67d1d2b93	1310	Ribnica
00050000-55fa-e0c1-dc07-b9118fdb4079	2364	Ribnica na Pohorju
00050000-55fa-e0c1-8b99-341522c19531	3272	Rimske Toplice
00050000-55fa-e0c1-a106-2ff9c329391e	1314	Rob
00050000-55fa-e0c1-1286-5b96c63fe151	5215	Ročinj
00050000-55fa-e0c1-63df-1f9d85d6bdb9	3250	Rogaška Slatina
00050000-55fa-e0c1-8bab-683389a301a1	9262	Rogašovci
00050000-55fa-e0c1-86c0-11a3db3a18d9	3252	Rogatec
00050000-55fa-e0c1-026e-94e73e21187c	1373	Rovte
00050000-55fa-e0c1-7e8c-24238619a7e2	2342	Ruše
00050000-55fa-e0c1-2487-2fe36302b2e4	1282	Sava
00050000-55fa-e0c1-b210-e679e89e97a4	6333	Sečovlje/Sicciole
00050000-55fa-e0c1-790e-a0102ad96346	4227	Selca
00050000-55fa-e0c1-12b1-62b590f7b88d	2352	Selnica ob Dravi
00050000-55fa-e0c1-4aef-7c85ce51e2af	8333	Semič
00050000-55fa-e0c1-defd-706b8e8827fc	8281	Senovo
00050000-55fa-e0c1-e10c-d96541babc11	6224	Senožeče
00050000-55fa-e0c1-4ce9-1717f9391046	8290	Sevnica
00050000-55fa-e0c1-7d6d-ddf0cee8b3be	6210	Sežana
00050000-55fa-e0c1-009d-c5e8f470f4f3	2214	Sladki Vrh
00050000-55fa-e0c1-2b1a-6d14fa9d855a	5283	Slap ob Idrijci
00050000-55fa-e0c1-b8bf-1a4e32718c1e	2380	Slovenj Gradec
00050000-55fa-e0c1-3d29-2c1e6773e9fd	2310	Slovenska Bistrica
00050000-55fa-e0c1-1ec7-b9e4bb85aaf3	3210	Slovenske Konjice
00050000-55fa-e0c1-3f46-406c3aa91a6e	1216	Smlednik
00050000-55fa-e0c1-4ec0-0eee6619145f	5232	Soča
00050000-55fa-e0c1-057d-24d0b746bccd	1317	Sodražica
00050000-55fa-e0c1-d5ec-6f097f568a6f	3335	Solčava
00050000-55fa-e0c1-9a63-0021fd00348f	5250	Solkan
00050000-55fa-e0c1-6c4e-edb0ac5bcc69	4229	Sorica
00050000-55fa-e0c1-94a1-df10f2c0914f	4225	Sovodenj
00050000-55fa-e0c1-15f0-79bbd2fdc1fa	5281	Spodnja Idrija
00050000-55fa-e0c1-f52e-a40641ed53be	2241	Spodnji Duplek
00050000-55fa-e0c1-75d2-a42b916dfc19	9245	Spodnji Ivanjci
00050000-55fa-e0c1-d54a-b3074dac90c7	2277	Središče ob Dravi
00050000-55fa-e0c1-b7f2-ad942d945936	4267	Srednja vas v Bohinju
00050000-55fa-e0c1-4f15-bbdfb9f35542	8256	Sromlje 
00050000-55fa-e0c1-b942-540065b338c7	5224	Srpenica
00050000-55fa-e0c1-3c1c-1d5b9ab6d0d2	1242	Stahovica
00050000-55fa-e0c1-61cc-fba5edbc5fc9	1332	Stara Cerkev
00050000-55fa-e0c1-4b8e-8b93eba28eed	8342	Stari trg ob Kolpi
00050000-55fa-e0c1-256d-07a2a218f193	1386	Stari trg pri Ložu
00050000-55fa-e0c1-ba97-011596d610e3	2205	Starše
00050000-55fa-e0c1-269f-09ce99604f73	2289	Stoperce
00050000-55fa-e0c1-ff62-1fb0eddc9e5d	8322	Stopiče
00050000-55fa-e0c1-69c4-bb602a5903c6	3206	Stranice
00050000-55fa-e0c1-7d1a-fe1d3071f84e	8351	Straža
00050000-55fa-e0c1-6b5b-d90c30537542	1313	Struge
00050000-55fa-e0c1-6651-088c00386202	8293	Studenec
00050000-55fa-e0c1-5e0b-65b13e958331	8331	Suhor
00050000-55fa-e0c1-e3ff-b484b195a9de	2233	Sv. Ana v Slovenskih goricah
00050000-55fa-e0c1-5211-0fd4b5eb26f0	2235	Sv. Trojica v Slovenskih goricah
00050000-55fa-e0c1-26c9-331fae725a1e	2353	Sveti Duh na Ostrem Vrhu
00050000-55fa-e0c1-9f89-d115ce6c89c1	9244	Sveti Jurij ob Ščavnici
00050000-55fa-e0c1-b374-d1c0a663c693	3264	Sveti Štefan
00050000-55fa-e0c1-f16b-89c700331b0c	2258	Sveti Tomaž
00050000-55fa-e0c1-cd38-729a9d75e5f3	9204	Šalovci
00050000-55fa-e0c1-a38d-1c510241da13	5261	Šempas
00050000-55fa-e0c1-f70e-fe58dca72497	5290	Šempeter pri Gorici
00050000-55fa-e0c1-3411-8e84fa466ba8	3311	Šempeter v Savinjski dolini
00050000-55fa-e0c1-4e1e-f5691d2edb8f	4208	Šenčur
00050000-55fa-e0c1-218b-757479fb92f5	2212	Šentilj v Slovenskih goricah
00050000-55fa-e0c1-105f-c24f71cd1950	8297	Šentjanž
00050000-55fa-e0c1-2ac7-5db4155816cc	2373	Šentjanž pri Dravogradu
00050000-55fa-e0c1-e02f-64d3c5b4936b	8310	Šentjernej
00050000-55fa-e0c1-37e1-6a692ec4ae98	3230	Šentjur
00050000-55fa-e0c1-14a6-01a02e238074	3271	Šentrupert
00050000-55fa-e0c1-8ec7-97cce67e0327	8232	Šentrupert
00050000-55fa-e0c1-f242-6da5c1969e9c	1296	Šentvid pri Stični
00050000-55fa-e0c1-8d3e-2b18df066c05	8275	Škocjan
00050000-55fa-e0c1-4c02-70a30e700053	6281	Škofije
00050000-55fa-e0c1-9c19-ad3cd77abd8e	4220	Škofja Loka
00050000-55fa-e0c1-e805-f450c411cd67	3211	Škofja vas
00050000-55fa-e0c1-fd84-3b353ab09bc1	1291	Škofljica
00050000-55fa-e0c1-d14b-b70723bd5251	6274	Šmarje
00050000-55fa-e0c1-5f66-0b86176ab7f4	1293	Šmarje - Sap
00050000-55fa-e0c1-7552-c6274783d098	3240	Šmarje pri Jelšah
00050000-55fa-e0c1-bafb-e4799aca24d1	8220	Šmarješke Toplice
00050000-55fa-e0c1-2df2-e8abf4e8cf24	2315	Šmartno na Pohorju
00050000-55fa-e0c1-1123-f37b0ba40a4f	3341	Šmartno ob Dreti
00050000-55fa-e0c1-b374-acccce040670	3327	Šmartno ob Paki
00050000-55fa-e0c1-f80d-b2c7f96a0583	1275	Šmartno pri Litiji
00050000-55fa-e0c1-c925-8294235a26e5	2383	Šmartno pri Slovenj Gradcu
00050000-55fa-e0c1-0de3-5cf0d0fcf8f8	3201	Šmartno v Rožni dolini
00050000-55fa-e0c1-4e4b-6f7cdfec69dc	3325	Šoštanj
00050000-55fa-e0c1-bf06-a7e5d9e5592f	6222	Štanjel
00050000-55fa-e0c1-76b7-201100d3e19a	3220	Štore
00050000-55fa-e0c1-e7c3-3b4bcf49e730	3304	Tabor
00050000-55fa-e0c1-368c-43f017c81c88	3221	Teharje
00050000-55fa-e0c1-54a2-eb97ec390954	9251	Tišina
00050000-55fa-e0c1-7a9c-9922eb4da25d	5220	Tolmin
00050000-55fa-e0c1-c1fb-acc30b76cd67	3326	Topolšica
00050000-55fa-e0c1-7aca-2c364a179c29	2371	Trbonje
00050000-55fa-e0c1-d055-f19188800405	1420	Trbovlje
00050000-55fa-e0c1-6fce-0533f9a5345f	8231	Trebelno 
00050000-55fa-e0c1-e4aa-2e4d297f848c	8210	Trebnje
00050000-55fa-e0c1-1902-0f595a662778	5252	Trnovo pri Gorici
00050000-55fa-e0c1-7fd7-23729df02dea	2254	Trnovska vas
00050000-55fa-e0c1-66f1-8463a0e52a33	1222	Trojane
00050000-55fa-e0c1-2979-38cc37168e3b	1236	Trzin
00050000-55fa-e0c1-8ff3-a49066710223	4290	Tržič
00050000-55fa-e0c1-99ac-93e646444bd8	8295	Tržišče
00050000-55fa-e0c1-1ef5-227515ea3399	1311	Turjak
00050000-55fa-e0c1-db24-07ab40680a4a	9224	Turnišče
00050000-55fa-e0c1-0c94-e528f01ed551	8323	Uršna sela
00050000-55fa-e0c1-3cfa-47c710ed5388	1252	Vače
00050000-55fa-e0c1-54bb-453f6be0aeda	3320	Velenje 
00050000-55fa-e0c1-37ab-0a859f8f8960	3322	Velenje - poštni predali
00050000-55fa-e0c1-5648-9ab0b7bcbb36	8212	Velika Loka
00050000-55fa-e0c1-7ad8-e5e0aa6d4d1c	2274	Velika Nedelja
00050000-55fa-e0c1-90bc-699d4dcabf7d	9225	Velika Polana
00050000-55fa-e0c1-948e-a32ca8ac47d8	1315	Velike Lašče
00050000-55fa-e0c1-8a3f-358568b0e3d2	8213	Veliki Gaber
00050000-55fa-e0c1-edc6-6ddf6cf1833c	9241	Veržej
00050000-55fa-e0c1-de75-d984bfd2a965	1312	Videm - Dobrepolje
00050000-55fa-e0c1-aa38-186c964c9176	2284	Videm pri Ptuju
00050000-55fa-e0c1-baa6-a2524d9a40a8	8344	Vinica
00050000-55fa-e0c1-e5ca-758857caa70e	5271	Vipava
00050000-55fa-e0c1-3dab-923675c3a1c2	4212	Visoko
00050000-55fa-e0c1-d659-234a736d776b	1294	Višnja Gora
00050000-55fa-e0c1-785c-f12a193c3809	3205	Vitanje
00050000-55fa-e0c1-f68f-ed4374439b77	2255	Vitomarci
00050000-55fa-e0c1-6779-a4f8d7344899	1217	Vodice
00050000-55fa-e0c1-c393-8f411dfcce97	3212	Vojnik\t
00050000-55fa-e0c1-6809-f519f815d951	5293	Volčja Draga
00050000-55fa-e0c1-beec-0d7c23865a57	2232	Voličina
00050000-55fa-e0c1-77e8-c0bb427bac3f	3305	Vransko
00050000-55fa-e0c1-fb26-d06dcb228092	6217	Vremski Britof
00050000-55fa-e0c1-d170-2c46288647ce	1360	Vrhnika
00050000-55fa-e0c1-2fd7-f2875e3193d0	2365	Vuhred
00050000-55fa-e0c1-7e81-4439535b09fb	2367	Vuzenica
00050000-55fa-e0c1-029c-497fc1151f29	8292	Zabukovje 
00050000-55fa-e0c1-0673-2c1ec2cde0e2	1410	Zagorje ob Savi
00050000-55fa-e0c1-49d2-1452cebcbf96	1303	Zagradec
00050000-55fa-e0c1-f20e-58a8b9d6aca7	2283	Zavrč
00050000-55fa-e0c1-d860-cf9aad533ebc	8272	Zdole 
00050000-55fa-e0c1-6ba8-55ad80c04b56	4201	Zgornja Besnica
00050000-55fa-e0c1-5363-16ad3786f60f	2242	Zgornja Korena
00050000-55fa-e0c1-579b-f613dfa90055	2201	Zgornja Kungota
00050000-55fa-e0c1-9de3-0390ba96646a	2316	Zgornja Ložnica
00050000-55fa-e0c1-03ef-eeca0e24e460	2314	Zgornja Polskava
00050000-55fa-e0c1-6487-7df24e18c31f	2213	Zgornja Velka
00050000-55fa-e0c1-0e81-4362fe1d96ce	4247	Zgornje Gorje
00050000-55fa-e0c1-3f37-b381cac152a8	4206	Zgornje Jezersko
00050000-55fa-e0c1-a82a-e21494c6a822	2285	Zgornji Leskovec
00050000-55fa-e0c1-d081-39d74bb4eae1	1432	Zidani Most
00050000-55fa-e0c1-ef24-dc80d683c25c	3214	Zreče
00050000-55fa-e0c1-1440-bc6146615247	4209	Žabnica
00050000-55fa-e0c1-497b-762f932ef918	3310	Žalec
00050000-55fa-e0c1-e7b9-50da2faaca97	4228	Železniki
00050000-55fa-e0c1-f6a2-acef157fb6c9	2287	Žetale
00050000-55fa-e0c1-8e09-a310c30677b1	4226	Žiri
00050000-55fa-e0c1-9740-9ed5c9e8cd02	4274	Žirovnica
00050000-55fa-e0c1-9c11-6b06ccc1ccf1	8360	Žužemberk
\.


--
-- TOC entry 2983 (class 0 OID 19946184)
-- Dependencies: 229
-- Data for Name: postavkacdve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkacdve (id, skupina, podskupina, naziv, vrpremiere, vrponovitvepremier, vrponovitveprejsnjih, vrgostovanjazamejstvo, vrfestivali, vrgostovanjaint, vrostalo, programdela_id) FROM stdin;
\.


--
-- TOC entry 2957 (class 0 OID 19945816)
-- Dependencies: 203
-- Data for Name: postavkaracuna; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkaracuna (id, racun_id) FROM stdin;
\.


--
-- TOC entry 2940 (class 0 OID 19945623)
-- Dependencies: 186
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
00060000-55fa-e0c2-2310-5c28cbf98e2f	00080000-55fa-e0c2-7259-ea96a8ba40d0	\N	00040000-55fa-e0c1-f632-c16a9667dc65	Narodni dom	\N	Koroška 15	\N	9231	Beltinci	\N	f	t
00060000-55fa-e0c2-46ff-bfffa38368b8	00080000-55fa-e0c2-7259-ea96a8ba40d0	\N	00040000-55fa-e0c1-f632-c16a9667dc65	Korotan	\N	Koroška 22	\N	9231	Beltinci	\N	f	f
00060000-55fa-e0c2-faa0-fb7004aaa24d	00080000-55fa-e0c2-e448-3f18acf51040	\N	00040000-55fa-e0c1-f632-c16a9667dc65	Rimljan	\N	Rimska ploščad 7	\N	9231	Beltinci	\N	f	t
\.


--
-- TOC entry 2946 (class 0 OID 19945701)
-- Dependencies: 192
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, zaporedna, porocilo) FROM stdin;
\.


--
-- TOC entry 2959 (class 0 OID 19945828)
-- Dependencies: 205
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 2984 (class 0 OID 19946198)
-- Dependencies: 230
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, koproducent_id, odstotekfinanciranja, delez, maticnikop, kpe, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 2985 (class 0 OID 19946208)
-- Dependencies: 231
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, sifra, status) FROM stdin;
00190000-55fa-e0c2-3acc-26743553a912	00080000-55fa-e0c2-d56a-e8ffb5b5c36e	0987	AK
00190000-55fa-e0c2-4c1a-676783e83547	00080000-55fa-e0c2-e448-3f18acf51040	0989	AK
00190000-55fa-e0c2-e54b-663ec31fa632	00080000-55fa-e0c2-a804-167be1e4f771	0986	AK
00190000-55fa-e0c2-4d10-542eeaf40513	00080000-55fa-e0c2-ebfd-e8cbb25f8c5e	0984	AK
00190000-55fa-e0c2-0c91-081cbb1d8cfa	00080000-55fa-e0c2-45f5-fa36ed58260e	0983	AK
00190000-55fa-e0c2-c231-36edde81fb7b	00080000-55fa-e0c2-525d-47604066f495	0982	AK
00190000-55fa-e0c3-d649-99c3ab92241c	00080000-55fa-e0c3-dd77-a6c27847c3f5	1001	AK
\.


--
-- TOC entry 2982 (class 0 OID 19946141)
-- Dependencies: 228
-- Data for Name: programdela; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programdela (id, sifra, naziv, zacetek, konec, zakljuceno, potrjenprogram, stpremier, stint, stfest, strazno, stizjem, stponprem, stponprej, stponprejvelikih, stponprejmalih, stponprejmalihkopr, stponprejsredkopr, stponprejvelikihkopr, stgostujo, vrps1, vrps1do, vrps1mat, vrps1gostovsz, stizvnekomerc, stizvprem, stizvponprem, stizvponpremdoma, stizvponpremzamejo, stizvponpremgost, stizvponpremkopr, stizvponpremint, stizvponpremkoprint, stizvponprej, stizvponprejdoma, stizvponprejzamejo, stizvponprejgost, stizvponprejkopr, stizvponprejint, stizvponprejkoprint, stizvgostuj, stizvostalihnek, stizvgostovanjslo, stizvgostovanjzam, stizvgostovanjint, stobisknekom, stobisknekommat, stobisknekomgostslo, stobisknekomgostzam, stobisknekomgostint, stobiskprem, stobiskponprem, stobiskponpremdoma, stobiskponpremkopr, stobiskponpremkoprint, stobiskponpremgost, stobiskponpremzamejo, stobiskponpremint, avgobiskprired, avgzaseddvoran, avgcenavstopnice, stprodvstopnic, stkoprodukcij, stkoprodukcijint, stkoprodukcijnvo, stzaposlenih, stzaposigralcev, avgstnastopovigr, sthonorarnih, sthonorarnihigr, sthonorarnihigrtujjz, sthonorarnihigrsamoz, sredstvaint, sredstvaavt, sredstvazaprosenoprem, sredstvazaprosenoponprem, sredstvazaprosenoponprej, sredstvazaprosenogostujo, sredstvazaprosenoint, sredstvazaprosenofest, sredstvazaprosenorazno, sredstvazaprosenoizjem, sredstvadrugijavniprem, sredstvadrugijavniponprem, sredstvadrugijavniponprej, sredstvadrugijavnigostujo, sredstvadrugijavniint, sredstvadrugijavnifest, sredstvadrugijavnirazno, sredstvadrugijavniizjem, sredstvadrugiviriprem, sredstvadrugiviriponprem, sredstvadrugiviriponprej, sredstvadrugivirigostujo, sredstvadrugiviriint, sredstvadrugivirifest, sredstvadrugivirirazno, sredstvadrugiviriizjem, sredstvaavtsamoz) FROM stdin;
00290000-55fa-e0c2-9518-8022a9ac1180	0001	Testni program dela	2016-02-01	2017-02-01	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 2986 (class 0 OID 19946216)
-- Dependencies: 232
-- Data for Name: programskaenotasklopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programskaenotasklopa (id, naslovpe, avtorpe, obsegpe, mesecpe, vrednostpe, programrazno_id) FROM stdin;
\.


--
-- TOC entry 2963 (class 0 OID 19945857)
-- Dependencies: 209
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, popa_id, naslov_id, sifra, naziv, jeprizorisce, jematicnioder, seplanira, kapaciteta, opis) FROM stdin;
00220000-55fa-e0c2-c4b1-d41339ab31c7	\N	\N	0001	Poskusna 1	f	\N	t	8	Poskusna učilnica v prvem
00220000-55fa-e0c2-4c2c-b566fab98ecc	\N	\N	0002	Poskusna 3	f	\N	f	34	Poskusna učilnica v tretjem
00220000-55fa-e0c2-bb35-7be4b04a45f6	\N	\N	0003	Kazinska	t	\N	t	84	Kazinska dvorana
00220000-55fa-e0c2-32b7-bf17598ff5e5	\N	\N	0004	Mali oder	t	\N	t	24	Mali oder 
00220000-55fa-e0c2-1d67-f3f30eb470b8	\N	\N	0005	Komorni oder	t	\N	t	15	Komorni oder
00220000-55fa-e0c2-9c32-4e1b0cd4f0a6	\N	\N	0006	Stara dvorana	t	\N	t	96	Stara dvorana ali dvorana Franceta Prešerna
00220000-55fa-e0c2-9c8e-f99c4bc8eaac	\N	\N	0007	Velika dvorana	t	\N	t	160	Velika, glavna dvorana
\.


--
-- TOC entry 2955 (class 0 OID 19945801)
-- Dependencies: 201
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 2954 (class 0 OID 19945791)
-- Dependencies: 200
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 2975 (class 0 OID 19945994)
-- Dependencies: 221
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta, status) FROM stdin;
\.


--
-- TOC entry 2970 (class 0 OID 19945931)
-- Dependencies: 216
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 2929 (class 0 OID 19945496)
-- Dependencies: 175
-- Data for Name: revizije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY revizije (id, razred, objectid, upor, datum, tip, data) FROM stdin;
1	App\\Entity\\Popa	00080000-55fa-e0c3-dd77-a6c27847c3f5	00010000-55fa-e0c1-b8e9-21103499ae95	2015-09-17 17:48:19	INS	a:0:{}
2	App\\Entity\\Option	00000000-55fa-e0c3-a742-bd85bd51bb60	00010000-55fa-e0c1-b8e9-21103499ae95	2015-09-17 17:48:19	INS	a:0:{}
3	ProgramDela\\Entity\\ProdukcijskaHisa	00190000-55fa-e0c3-d649-99c3ab92241c	00010000-55fa-e0c1-b8e9-21103499ae95	2015-09-17 17:48:19	INS	a:0:{}
\.


--
-- TOC entry 3004 (class 0 OID 0)
-- Dependencies: 174
-- Name: revizije_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('revizije_id_seq', 3, true);


--
-- TOC entry 2964 (class 0 OID 19945870)
-- Dependencies: 210
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 2933 (class 0 OID 19945534)
-- Dependencies: 179
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-55fa-e0c1-e0af-0c1811aa6453	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-55fa-e0c1-b1fc-cacc68832730	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-55fa-e0c1-32f1-f7c5879af7e9	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-55fa-e0c1-35a8-5cebf3cfd29e	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-55fa-e0c1-eae1-6a5b04b5a457	planer	Planer dogodkov v koledarju	t
00020000-55fa-e0c1-1b44-246a3e49633a	kadrovska	Kadrovska služba	t
00020000-55fa-e0c1-2651-0006165bc24f	arhivar	Ažuriranje arhivalij	t
00020000-55fa-e0c1-6a1a-656f693aca9c	igralec	Igralec	t
00020000-55fa-e0c1-4a3f-bb09cb4f53df	prisotnost	Vnašalec prisotnosti, tudi za tiste izven uprizoritev	t
00020000-55fa-e0c2-9568-f4bfa77dc5c2	vsadovoljenja	Vloga z vsemi posameznimi dovoljenji	t
\.


--
-- TOC entry 2931 (class 0 OID 19945518)
-- Dependencies: 177
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-55fa-e0c1-ba0d-272b00b1090c	00020000-55fa-e0c1-32f1-f7c5879af7e9
00010000-55fa-e0c1-b8e9-21103499ae95	00020000-55fa-e0c1-32f1-f7c5879af7e9
00010000-55fa-e0c2-bc7a-4b6cf21187f0	00020000-55fa-e0c2-9568-f4bfa77dc5c2
\.


--
-- TOC entry 2966 (class 0 OID 19945884)
-- Dependencies: 212
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 2958 (class 0 OID 19945822)
-- Dependencies: 204
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 2952 (class 0 OID 19945768)
-- Dependencies: 198
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, sifra, ime, zacetek, konec, aktivna) FROM stdin;
\.


--
-- TOC entry 2927 (class 0 OID 19945483)
-- Dependencies: 173
-- Data for Name: stevilcenje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenje (id, sifra, naziv, prefix, suffix, zacetek, dolzina, format, globalno, poletih) FROM stdin;
00230000-55fa-e0c1-0152-9612e9e83ec3	pri	Privzeto številčenje po letih YYYY-N	\N	\N	1	1	%l-%n	f	t
00230000-55fa-e0c1-f7fb-b5fbd66d26ab	123	Privzeto številčenje kratkih šifer	\N	\N	100	3	%n	f	f
00230000-55fa-e0c1-3bf5-1ee5ba174f6b	bcd	Globalno številčenje črtnih kod	\N	\N	1	9	%n	t	f
00230000-55fa-e0c1-5674-e2a0c3f7589b	sif	Številčenje šifrant	\N	\N	1000	4	%n	f	f
00230000-55fa-e0c1-bae1-471e54cef037	tmp	Globalno številčenje začasnih številk	tmp	\N	1000	5	%l%n	t	t
\.


--
-- TOC entry 2926 (class 0 OID 19945475)
-- Dependencies: 172
-- Data for Name: stevilcenjekonfig; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjekonfig (id, stevilcenje_id, dok) FROM stdin;
00240000-55fa-e0c1-9d00-58fc27faed84	00230000-55fa-e0c1-5674-e2a0c3f7589b	popa
00240000-55fa-e0c1-b390-09b8c0843bc2	00230000-55fa-e0c1-5674-e2a0c3f7589b	oseba
00240000-55fa-e0c1-8791-34414579cad7	00230000-55fa-e0c1-5674-e2a0c3f7589b	sezona
00240000-55fa-e0c1-13fe-a1ef0a032c89	00230000-55fa-e0c1-f7fb-b5fbd66d26ab	prostor
00240000-55fa-e0c1-a62b-7cd22aa1cd14	00230000-55fa-e0c1-5674-e2a0c3f7589b	besedilo
00240000-55fa-e0c1-a2fa-e5ab02a75ac4	00230000-55fa-e0c1-5674-e2a0c3f7589b	uprizoritev
00240000-55fa-e0c1-b78f-32812ba7c82f	00230000-55fa-e0c1-5674-e2a0c3f7589b	funkcija
00240000-55fa-e0c1-85df-b4078745ec97	00230000-55fa-e0c1-5674-e2a0c3f7589b	tipfunkcije
00240000-55fa-e0c1-eed3-b6f8334ff849	00230000-55fa-e0c1-5674-e2a0c3f7589b	alternacija
00240000-55fa-e0c1-1c48-d15702d9d8d7	00230000-55fa-e0c1-0152-9612e9e83ec3	pogodba
00240000-55fa-e0c1-404b-d04fce0f1c03	00230000-55fa-e0c1-5674-e2a0c3f7589b	zaposlitev
00240000-55fa-e0c1-d360-071f99362190	00230000-55fa-e0c1-5674-e2a0c3f7589b	zvrstuprizoritve
00240000-55fa-e0c1-4a2b-ae89d929a43e	00230000-55fa-e0c1-0152-9612e9e83ec3	programdela
00240000-55fa-e0c1-f976-33779d89e6d3	00230000-55fa-e0c1-5674-e2a0c3f7589b	zapis
\.


--
-- TOC entry 2925 (class 0 OID 19945470)
-- Dependencies: 171
-- Data for Name: stevilcenjestanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjestanje (id, objid, leto, stevilka) FROM stdin;
efdcc240-0b5b-465e-b78e-1a0e00e2d7ed	00240000-55fa-e0c1-9d00-58fc27faed84	0	1001
\.


--
-- TOC entry 2971 (class 0 OID 19945941)
-- Dependencies: 217
-- Data for Name: strosekuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY strosekuprizoritve (id, uprizoritev_id, popa_id, naziv, vrednostdo, vrednostna, opis, tipstroska, sort, vrstastroska_id) FROM stdin;
00270000-55fa-e0c3-4bac-cbed1f82d65a	000e0000-55fa-e0c2-0353-554124a51f5e	00080000-55fa-e0c2-7259-ea96a8ba40d0	Nabava kostumov	600.50	20.00	Krila in maske	materialni	1	003b0000-55fa-e0c1-294b-a7f31690b92c
00270000-55fa-e0c3-0e18-64559bef6db6	000e0000-55fa-e0c2-0353-554124a51f5e	00080000-55fa-e0c2-7259-ea96a8ba40d0	Zavese	125.70	3.10	Modra in zelena zavesa	materialni	2	003b0000-55fa-e0c1-294b-a7f31690b92c
\.


--
-- TOC entry 2938 (class 0 OID 19945596)
-- Dependencies: 184
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 2953 (class 0 OID 19945778)
-- Dependencies: 199
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja) FROM stdin;
001a0000-55fa-e0c3-833b-ddf422ec2727	00180000-55fa-e0c2-495b-2edb8039b52e	000c0000-55fa-e0c3-fbe5-e786ee6c438c	00090000-55fa-e0c2-1e10-f909562f011e	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55fa-e0c3-9768-de5406e96ce4	00180000-55fa-e0c2-495b-2edb8039b52e	000c0000-55fa-e0c3-44eb-e30f0e8ef262	00090000-55fa-e0c2-9cd1-b1af0e9d3d15	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55fa-e0c3-4e82-a4a51bffb965	00180000-55fa-e0c2-495b-2edb8039b52e	000c0000-55fa-e0c3-e7c4-f2e1cd8d592b	00090000-55fa-e0c2-b49d-93d7d37cbf5e	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55fa-e0c3-9a09-0b1ca5d6ac8e	00180000-55fa-e0c2-495b-2edb8039b52e	000c0000-55fa-e0c3-4180-bc8a66799870	00090000-55fa-e0c2-2442-9e9036861591	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55fa-e0c3-4a5d-4170a041fe7f	00180000-55fa-e0c2-495b-2edb8039b52e	000c0000-55fa-e0c3-98dd-0439a3326965	00090000-55fa-e0c2-3c65-2c3ff28c04cc	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55fa-e0c3-5ea8-1d10b9b85724	00180000-55fa-e0c2-89c2-8c1d2d9f63ea	\N	00090000-55fa-e0c2-3c65-2c3ff28c04cc	2015-08-01 20:00:00	2015-08-01 23:00:00	\N	\N	2.00
\.


--
-- TOC entry 2974 (class 0 OID 19945982)
-- Dependencies: 220
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, sifra, ime, opis, imezenski, podrocje) FROM stdin;
000f0000-55fa-e0c1-e7c5-977d88ff74a5	01	Avtor	Avtorji	Avtorka	umetnik
000f0000-55fa-e0c1-25cd-51ddf2be71e3	02	Priredba	Priredba	Priredba	umetnik
000f0000-55fa-e0c1-685c-9c168b2372a7	03	Prevod	Prevod	Prevod	umetnik
000f0000-55fa-e0c1-8278-2bb96aece2b3	04	Režija	Režija	Režija	umetnik
000f0000-55fa-e0c1-e47f-73957b9b4678	05	Dramaturgija	Dramaturgija	Dramaturgija	umetnik
000f0000-55fa-e0c1-e913-b529793f3b61	06	Scenografija	Scenografija	Scenografija	umetnik
000f0000-55fa-e0c1-be33-2da5885c4bd7	07	Kostumografija	Kostumografija	Kostumografija	umetnik
000f0000-55fa-e0c1-484d-f7e74cd7ecb1	08	Koreografija	Koreografija	Koreografija	umetnik
000f0000-55fa-e0c1-34e0-a5cac6e0dc63	09	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	umetnik
000f0000-55fa-e0c1-58a9-bc152550a887	10	Oblikovanje maske	Oblikovanje maske	Oblikovanje maske	umetnik
000f0000-55fa-e0c1-eed8-789b121462ce	11	Lektorstvo	Lektorstvo	Lektorstvo	umetnik
000f0000-55fa-e0c1-79bb-424c2631436e	12	Glasbeni soustvarjalec	Glasbeni soustvarjalci	Glasbena soustvarjalka	umetnik
000f0000-55fa-e0c1-e910-78a26817ed62	13	Intermedijski ustvarjalec	Intermedijski ustvarjalci	Intermedijski ustvarjalka	umetnik
000f0000-55fa-e0c1-3f36-69e9678c1d1b	14	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	umetnik
000f0000-55fa-e0c1-b67d-0c67306d474b	15	Vloga	Intermedijski ustvarjalci	Intermedijska ustvarjalka	igralec
000f0000-55fa-e0c1-6227-7cbf7bd3f11e	16	Produkcija, mentorstvo	Produkcija, mentorstvo	Produkcija, mentorstvo	umetnik
000f0000-55fa-e0c1-ea0b-87670cecc79d	17	Tehnična podpora	Tehnična podpora	Tehnična podpora	tehnik
000f0000-55fa-e0c1-1145-a320a7ce2f1d	18	Inšpicient	Inšpicienti	Inšpicientka	inspicient
\.


--
-- TOC entry 2987 (class 0 OID 19946226)
-- Dependencies: 233
-- Data for Name: tipprogramskeenote; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipprogramskeenote (id, sifra, naziv, koprodukcija, maxfaktor, maxvsi) FROM stdin;
002b0000-55fa-e0c1-3dbb-77273d9f1072	01	Velika predstava	f	1.00	1.00
002b0000-55fa-e0c1-397c-9bbf9e3fa16d	02	Mala predstava	f	0.50	0.50
002b0000-55fa-e0c1-6599-6f3840ee7250	03	Mala koprodukcija	t	0.40	1.00
002b0000-55fa-e0c1-19bd-b85a96572c4b	04	Srednja koprodukcija	t	0.70	2.00
002b0000-55fa-e0c1-e2ff-391b1bd01136	05	Velika koprodukcija	t	1.00	3.00
\.


--
-- TOC entry 2943 (class 0 OID 19945658)
-- Dependencies: 189
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 2930 (class 0 OID 19945505)
-- Dependencies: 176
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-55fa-e0c1-b8e9-21103499ae95	Konzolni	$2y$05$NS4xMjkyMTcwMzExMjAxRO6DhADBDe.Rqn4QbnYKuzXY/GeJ.eR7e	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-55fa-e0c2-8a75-06bd2f01c2ba	testni uporabnik za inšpicienta	$2y$05$NS4xMjkyMTcwMzExMjAxROxkJ1B6xAXex6EZLIwJfWzRJ8DpfecFO	t	\N	\N	\N	ivo@ifigenija.si	\N	\N	\N
00010000-55fa-e0c2-9458-9b2b7ca839d1	testni uporabnik za Tehničnega vodjo	$2y$05$NS4xMjkyMTcwMzExMjAxROu/kXWR9sP9oamkesKuxXLbxkCb387.G	t	\N	\N	\N	tona@ifigenija.si	\N	\N	\N
00010000-55fa-e0c2-7866-1dbc5f830eee	testni uporabnik za igralca	$2y$05$NS4xMjkyMTcwMzExMjAxRO/hLCgClfERRsfCAFYwxNCcFIVjP2982	t	\N	\N	\N	irena@ifigenija.si	\N	\N	\N
00010000-55fa-e0c2-4082-ed9804c4c877	testni uporabnik vnašalca termina storitev (TerminStoritve-vse)	$2y$05$NS4xMjkyMTcwMzExMjAxROT6.kTHqEq4.wa2SOnf124/N14m9qeP.	t	\N	\N	\N	tatjana@ifigenija.si	\N	\N	\N
00010000-55fa-e0c2-8fe8-c50707a0e2df	testni uporabnik, ki je inšpicient brez zapisov v TerminStoritve	$2y$05$NS4xMjkyMTcwMzExMjAxROHau47Dtb7CME5.nlWwBVM.nusFP.ra2	t	\N	\N	\N	joze@ifigenija.si	\N	\N	\N
00010000-55fa-e0c2-c656-57a87c9a391d	testna uporabnica, ki je planerka	$2y$05$NS4xMjkyMTcwMzExMjAxRO.B/uJO3C7QRNhdX9Q2hTLQsSupj1V1S	t	\N	\N	\N	petra@ifigenija.si	\N	\N	\N
00010000-55fa-e0c2-eefa-6e020f8ee3f3	testni uporabnik, ki dobi ifi-all vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROv2d7jqhaV/Mz3EIsKoi7UoFR.SDSMBm	t	\N	\N	\N	ali@ifigenija.si	\N	\N	\N
00010000-55fa-e0c2-31a0-3ffc61ea0960	testni uporabnik, ki dobi ifi-readall vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROYB9g.gnkufr1l/gWK6mkx.ySqrOWnJC	t	\N	\N	\N	berta@ifigenija.si	\N	\N	\N
00010000-55fa-e0c2-f6be-4444cd50b3c1	testni uporabnik, ki dobi aaa-write dovoljenje	$2y$05$NS4xMjkyMTcwMzExMjAxRORujYObKX.DzpXVYbePkiJkHqg0/Ylya	t	\N	\N	\N	aaron@ifigenija.si	\N	\N	\N
00010000-55fa-e0c2-bc7a-4b6cf21187f0	testni uporabnik ki dobi vsa posamezna dovoljenja	$2y$05$NS4xMjkyMTcwMzExMjAxRO2ymwxVXTr7U4Ncdn.bN49E8rLw9Jg0O	t	\N	\N	\N	vesna@ifigenija.si	\N	\N	\N
00010000-55fa-e0c1-ba0d-272b00b1090c	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 2978 (class 0 OID 19946031)
-- Dependencies: 224
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, producent_id, sifra, faza, naslov, podnaslov, delovninaslov, internacionalninaslov, naslovizvirnika, podnaslovizvirnika, datumzacstudija, stevilovaj, planiranostevilovaj, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, krstna, prvaslovenska, kratkinaslov, maticnioder_id) FROM stdin;
000e0000-55fa-e0c2-8eb2-8adb5b35b64c	00160000-55fa-e0c2-8a4f-12f6077c7141	\N	00140000-55fa-e0c1-7e7f-61a4c1d1a594	\N	0001	produkcija	Sen kresne noči		Sanje	\N	\N	\N	2016-02-01	\N	\N	2016-06-01	1	William Shakespeare	f	2				\N	f	\N	\N		00220000-55fa-e0c2-1d67-f3f30eb470b8
000e0000-55fa-e0c2-0353-554124a51f5e	00160000-55fa-e0c2-1711-382673ec8835	\N	00140000-55fa-e0c1-8602-cf86a3f9388c	\N	0002	predprodukcija-ideja	Smoletov vrt			\N	\N	\N	2016-01-01	\N	\N	2016-04-20	2	B. Hočevar	f	2				\N	f	\N	\N		00220000-55fa-e0c2-9c32-4e1b0cd4f0a6
000e0000-55fa-e0c2-321b-a96a841f84ad	\N	\N	00140000-55fa-e0c1-8602-cf86a3f9388c	00190000-55fa-e0c2-3acc-26743553a912	0003	postprodukcija	Kisli maček			\N	\N	\N	2016-02-01	\N	\N	2016-04-20	2	Caryl Churchill	t	2				\N	f	\N	\N		00220000-55fa-e0c2-1d67-f3f30eb470b8
000e0000-55fa-e0c2-43a0-92cc8569ba83	\N	\N	00140000-55fa-e0c1-8602-cf86a3f9388c	00190000-55fa-e0c2-3acc-26743553a912	0004	postprodukcija	Vladimir			\N	\N	\N	2017-03-01	\N	\N	2017-04-20	2	Matjaž Zupančič	t	2				\N	f	\N	\N		00220000-55fa-e0c2-1d67-f3f30eb470b8
000e0000-55fa-e0c2-577d-74faff3a18f2	\N	\N	00140000-55fa-e0c1-8602-cf86a3f9388c	00190000-55fa-e0c2-3acc-26743553a912	0005	postprodukcija	Španska princesa			\N	\N	\N	2017-04-01	\N	\N	2017-05-20	1	Nina Kokelj	f	1				\N	f	\N	\N		00220000-55fa-e0c2-c4b1-d41339ab31c7
000e0000-55fa-e0c2-4d2c-6b77a2fc6f21	\N	\N	00140000-55fa-e0c1-8602-cf86a3f9388c	00190000-55fa-e0c2-3acc-26743553a912	0006	postprodukcija	Ne vemo datumov			\N	\N	\N	\N	\N	\N	\N	1	Nandi Frafar	f	1				\N	f	\N	\N		00220000-55fa-e0c2-c4b1-d41339ab31c7
\.


--
-- TOC entry 2948 (class 0 OID 19945722)
-- Dependencies: 194
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, uprizoritev_id, vrsta, zaporedna, porocilo) FROM stdin;
00200000-55fa-e0c2-0d77-c9792227aa04	000e0000-55fa-e0c2-0353-554124a51f5e	\N	1	
00200000-55fa-e0c2-1867-eac19275de0e	000e0000-55fa-e0c2-0353-554124a51f5e	\N	2	
00200000-55fa-e0c2-d313-5ddd46766265	000e0000-55fa-e0c2-0353-554124a51f5e	\N	3	
00200000-55fa-e0c2-876e-aa3b876e3dfa	000e0000-55fa-e0c2-0353-554124a51f5e	\N	4	
00200000-55fa-e0c2-d91c-d6a0cab35df7	000e0000-55fa-e0c2-0353-554124a51f5e	\N	5	
\.


--
-- TOC entry 2962 (class 0 OID 19945849)
-- Dependencies: 208
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 2972 (class 0 OID 19945955)
-- Dependencies: 218
-- Data for Name: vrstastroska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstastroska (id, skupina, podskupina, naziv, opis) FROM stdin;
003b0000-55fa-e0c1-45be-6a14d3beabee	1	0	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE
003b0000-55fa-e0c1-ad8f-35eee5ad7457	1	1	Storitve varovanja zgradb in prostorov	storitve varovanja zgradb in prostorov (npr. gasilci na predstavah)
003b0000-55fa-e0c1-d33a-342d9626b1b0	1	2	Založniške in tiskarske storitve	založniške in tiskarske storitve
003b0000-55fa-e0c1-b8aa-37eb0722755f	1	3	Časopisi, revije, knjige in strokovna literatura	časopisi, revije, knjige in strokovna literatura
003b0000-55fa-e0c1-7f3f-2cfd8274b6b6	1	4	Stroški prevajalskih storitev	stroški prevajalskih storitev
003b0000-55fa-e0c1-b4bc-04c1d251ec56	1	5	Stroški oglaševalskih storitev	stroški oglaševalskih storitev
003b0000-55fa-e0c1-5951-9e1f9f048f57	1	6	Izdatki za reprezentanco	izdatki za reprezentanco
003b0000-55fa-e0c1-5191-e0f89fb8ced4	2	0	POSEBNI MATERIAL IN STORITVE	POSEBNI MATERIAL IN STORITVE
003b0000-55fa-e0c1-294b-a7f31690b92c	2	1	Drugi posebni material in storitve	drugi posebni material in storitve (npr. za instrumete - navedite)
003b0000-55fa-e0c1-3bd6-a3e0f672be30	2	2	Oprema predstave – stroški rekvizitov	Oprema predstave – stroški rekvizitov
003b0000-55fa-e0c1-445e-6e278320fbb9	2	3	Oprema predstave – stroški kostumov	Oprema predstave – stroški kostumov
003b0000-55fa-e0c1-22dc-7e15102e134a	2	4	Oprema predstave – stroški scenske opreme	Oprema predstave – stroški scenske opreme
003b0000-55fa-e0c1-c2cd-cfedeb47e015	2	5	Oprema predstave – stroški avdio in video opreme	Oprema predstave – stroški avdio in video opreme
003b0000-55fa-e0c1-b0ec-7daf462192a1	3	0	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE
003b0000-55fa-e0c1-e0dc-75009bff8142	3	1	Poštnina in kurirske storitve	poštnina in kurirske storitve
003b0000-55fa-e0c1-05d7-7c0b5dac2862	4	0	PREVOZNI STROŠKI IN STORITVE	PREVOZNI STROŠKI IN STORITVE
003b0000-55fa-e0c1-e34d-909618e80b1e	4	1	Goriva in maziva za prevozna sredstva	goriva in maziva za prevozna sredstva
003b0000-55fa-e0c1-843c-d84ff56d3be3	4	2	Najem vozil in selitveni stroški	najem vozil in selitveni stroški
003b0000-55fa-e0c1-eed2-dc0162c69518	4	3	Drugi prevozni in transportni stroški 	drugi prevozni in transportni stroški (navedite)
003b0000-55fa-e0c1-15f0-1ec4f8a96980	5	0	IZDATKI ZA SLUŽBENA POTOVANJA	IZDATKI ZA SLUŽBENA POTOVANJA
003b0000-55fa-e0c1-7f03-8d39bcbe136e	5	1	Dnevnice za službena potovanja v državi in tujini	dnevnice za službena potovanja v državi in tujini
003b0000-55fa-e0c1-f00f-38da7cabbd5d	5	2	Hotelske in restavra. storitve v državi in tujini	hotelske in restavra. storitve v državi in tujini
003b0000-55fa-e0c1-f0e2-afc6a5ef26e4	5	3	Stroški prevoza v državi in tujini	stroški prevoza v državi in tujini
003b0000-55fa-e0c1-82be-ebf95869d3e2	5	4	Drugi izdatki za službena potovanja	drugi izdatki za službena potovanja (navedite)
003b0000-55fa-e0c1-5b27-4c0b1a3b241d	6	0	NAJEMNINE IN ZAKUPNINE	NAJEMNINE IN ZAKUPNINE
003b0000-55fa-e0c1-702a-12632453d148	6	1	Druge najemnine, zakupnine in licenčnine	druge najemnine, zakupnine in licenčnine (npr. najem notnega materiala, instrumentov - navedite)
003b0000-55fa-e0c1-ef5f-28e932752cbc	7	0	DRUGI OPERATIVNI ODHODKI	DRUGI OPERATIVNI ODHODKI
003b0000-55fa-e0c1-2436-7d48f105a1ee	7	1	Izdatki za strok. izobraževanje zap.	izdatki za strok. izobraževanje zap.(vezani na program. enote)  
\.


--
-- TOC entry 2990 (class 0 OID 19946273)
-- Dependencies: 236
-- Data for Name: vrstazapisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstazapisa (id, oznaka, naziv, aktiven, znacka, ikona, upor, datknj) FROM stdin;
\.


--
-- TOC entry 2989 (class 0 OID 19946245)
-- Dependencies: 235
-- Data for Name: zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapis (id, vrsta_id, datoteka_id, mapa_id, avtor_id, zaklenil_id, tip, zaklenjen, datumzaklepanja, identifier, subject, title, description, coverage, creator, language, date, publisher, relation, rights, source, upor, datknj, standard, lokacija) FROM stdin;
\.


--
-- TOC entry 2991 (class 0 OID 19946285)
-- Dependencies: 237
-- Data for Name: zapislastnik; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapislastnik (id, zapis_id, lastnik, classlastnika, datum, upor, datknj) FROM stdin;
\.


--
-- TOC entry 2969 (class 0 OID 19945921)
-- Dependencies: 215
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, sifra, status, delovnomesto, zacetek, konec, tip, delovnaobveza, malica, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci) FROM stdin;
00100000-55fa-e0c3-b83b-f16e88cd9214	00090000-55fa-e0c2-9cd1-b1af0e9d3d15	01	A	Mojster	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55fa-e0c3-fee5-ba4d1a805df5	00090000-55fa-e0c2-b49d-93d7d37cbf5e	02	A	Igralec	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55fa-e0c3-5617-f11cc0d7c099	00090000-55fa-e0c2-331d-a0bb54667647	03	A	Natakar	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55fa-e0c3-db20-2b417087e34a	00090000-55fa-e0c2-b217-96bfc64e03d3	04	A	Mizar	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55fa-e0c3-7fc8-c6e1066009e5	00090000-55fa-e0c2-1e10-f909562f011e	05	A	Šivilja	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55fa-e0c3-0ad0-ac592a4c1c6a	00090000-55fa-e0c2-4785-1d207f903b21	06	A	Inšpicient	2010-02-01	2010-02-01	1	2		t	f	f	t
\.


--
-- TOC entry 2950 (class 0 OID 19945758)
-- Dependencies: 196
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id) FROM stdin;
\.


--
-- TOC entry 2977 (class 0 OID 19946021)
-- Dependencies: 223
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, sifra, naziv, opis) FROM stdin;
00140000-55fa-e0c1-7e7f-61a4c1d1a594	01	Drama	drama (SURS 01)
00140000-55fa-e0c1-c9e2-5be5fa327953	02	Opera	opera (SURS 02)
00140000-55fa-e0c1-230c-3003cbcf3038	03	Balet	balet (SURS 03)
00140000-55fa-e0c1-8e08-3d2fbdc4e62d	04	Plesne prireditve	plesne prireditve (SURS 04)
00140000-55fa-e0c1-b11e-8d0b0108ae6d	05	Lutkovno gledališče	lutkovno gledališče (SURS 05)
00140000-55fa-e0c1-8602-cf86a3f9388c	06	Raziskovalno gledališče	raziskovalno gledališče (SURS 06)
00140000-55fa-e0c1-fa1c-748f706e4a2d	07	Drugo	drugo (SURS 07)
\.


--
-- TOC entry 2968 (class 0 OID 19945911)
-- Dependencies: 214
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, sifra, naziv, opis) FROM stdin;
\.


--
-- TOC entry 2476 (class 2606 OID 19945559)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2654 (class 2606 OID 19946080)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2650 (class 2606 OID 19946070)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2624 (class 2606 OID 19945980)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2711 (class 2606 OID 19946325)
-- Name: datoteka_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT datoteka_pkey PRIMARY KEY (id);


--
-- TOC entry 2530 (class 2606 OID 19945747)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2544 (class 2606 OID 19945767)
-- Name: dogodeksplosni_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodeksplosni
    ADD CONSTRAINT dogodeksplosni_pkey PRIMARY KEY (id);


--
-- TOC entry 2687 (class 2606 OID 19946243)
-- Name: drugivir_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT drugivir_pkey PRIMARY KEY (id);


--
-- TOC entry 2510 (class 2606 OID 19945684)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2661 (class 2606 OID 19946135)
-- Name: enotaprograma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT enotaprograma_pkey PRIMARY KEY (id);


--
-- TOC entry 2602 (class 2606 OID 19945907)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2524 (class 2606 OID 19945720)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2518 (class 2606 OID 19945698)
-- Name: kontaktnaoseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT kontaktnaoseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2566 (class 2606 OID 19945814)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2705 (class 2606 OID 19946302)
-- Name: mapa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT mapa_pkey PRIMARY KEY (id);


--
-- TOC entry 2709 (class 2606 OID 19946309)
-- Name: mapa_zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT mapa_zapis_pkey PRIMARY KEY (mapa_id, zapis_id);


--
-- TOC entry 2716 (class 2606 OID 19946333)
-- Name: mapaacl_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT mapaacl_pkey PRIMARY KEY (id);


--
-- TOC entry 2448 (class 2606 OID 19921955)
-- Name: migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY migrations
    ADD CONSTRAINT migrations_pkey PRIMARY KEY (version);


--
-- TOC entry 2578 (class 2606 OID 19945841)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2503 (class 2606 OID 19945656)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2480 (class 2606 OID 19945568)
-- Name: optionvalue_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT optionvalue_pkey PRIMARY KEY (id);


--
-- TOC entry 2483 (class 2606 OID 19945592)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2474 (class 2606 OID 19945548)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2467 (class 2606 OID 19945533)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2581 (class 2606 OID 19945847)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2595 (class 2606 OID 19945883)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2636 (class 2606 OID 19946016)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2492 (class 2606 OID 19945620)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2500 (class 2606 OID 19945644)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2671 (class 2606 OID 19946196)
-- Name: postavkacdve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkacdve
    ADD CONSTRAINT postavkacdve_pkey PRIMARY KEY (id);


--
-- TOC entry 2570 (class 2606 OID 19945820)
-- Name: postavkaracuna_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT postavkaracuna_pkey PRIMARY KEY (id);


--
-- TOC entry 2498 (class 2606 OID 19945634)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2522 (class 2606 OID 19945708)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2576 (class 2606 OID 19945832)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2675 (class 2606 OID 19946205)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2677 (class 2606 OID 19946213)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2668 (class 2606 OID 19946183)
-- Name: programdela_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT programdela_pkey PRIMARY KEY (id);


--
-- TOC entry 2682 (class 2606 OID 19946224)
-- Name: programskaenotasklopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT programskaenotasklopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2588 (class 2606 OID 19945865)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2564 (class 2606 OID 19945805)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2558 (class 2606 OID 19945796)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2631 (class 2606 OID 19946004)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2615 (class 2606 OID 19945938)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2459 (class 2606 OID 19945504)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2593 (class 2606 OID 19945874)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2465 (class 2606 OID 19945522)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2469 (class 2606 OID 19945542)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2600 (class 2606 OID 19945892)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2572 (class 2606 OID 19945827)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2546 (class 2606 OID 19945776)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2456 (class 2606 OID 19945492)
-- Name: stevilcenje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenje
    ADD CONSTRAINT stevilcenje_pkey PRIMARY KEY (id);


--
-- TOC entry 2453 (class 2606 OID 19945480)
-- Name: stevilcenjekonfig_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT stevilcenjekonfig_pkey PRIMARY KEY (id);


--
-- TOC entry 2450 (class 2606 OID 19945474)
-- Name: stevilcenjestanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjestanje
    ADD CONSTRAINT stevilcenjestanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2620 (class 2606 OID 19945951)
-- Name: strosekuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT strosekuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2489 (class 2606 OID 19945601)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2552 (class 2606 OID 19945787)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2627 (class 2606 OID 19945991)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2684 (class 2606 OID 19946236)
-- Name: tipprogramskeenote_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipprogramskeenote
    ADD CONSTRAINT tipprogramskeenote_pkey PRIMARY KEY (id);


--
-- TOC entry 2508 (class 2606 OID 19945669)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2461 (class 2606 OID 19945517)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2648 (class 2606 OID 19946049)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2528 (class 2606 OID 19945730)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2584 (class 2606 OID 19945855)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2622 (class 2606 OID 19945963)
-- Name: vrstastroska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstastroska
    ADD CONSTRAINT vrstastroska_pkey PRIMARY KEY (id);


--
-- TOC entry 2698 (class 2606 OID 19946283)
-- Name: vrstazapisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstazapisa
    ADD CONSTRAINT vrstazapisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2695 (class 2606 OID 19946267)
-- Name: zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT zapis_pkey PRIMARY KEY (id);


--
-- TOC entry 2701 (class 2606 OID 19946291)
-- Name: zapislastnik_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT zapislastnik_pkey PRIMARY KEY (id);


--
-- TOC entry 2611 (class 2606 OID 19945929)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2542 (class 2606 OID 19945762)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2640 (class 2606 OID 19946029)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2608 (class 2606 OID 19945919)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2531 (class 1259 OID 19945756)
-- Name: dogodki_konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_konec ON dogodek USING btree (konec);


--
-- TOC entry 2532 (class 1259 OID 19945757)
-- Name: dogodki_razred; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_razred ON dogodek USING btree (razred);


--
-- TOC entry 2533 (class 1259 OID 19945755)
-- Name: dogodki_zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2534 (class 1259 OID 19945754)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2535 (class 1259 OID 19945753)
-- Name: idx_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2616 (class 1259 OID 19945952)
-- Name: idx_11ffe6e05c75296c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e05c75296c ON strosekuprizoritve USING btree (vrstastroska_id);


--
-- TOC entry 2617 (class 1259 OID 19945953)
-- Name: idx_11ffe6e062b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e062b4ffca ON strosekuprizoritve USING btree (uprizoritev_id);


--
-- TOC entry 2618 (class 1259 OID 19945954)
-- Name: idx_11ffe6e06beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e06beede51 ON strosekuprizoritve USING btree (popa_id);


--
-- TOC entry 2702 (class 1259 OID 19946304)
-- Name: idx_14a5d6d3727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d3727aca70 ON mapa USING btree (parent_id);


--
-- TOC entry 2703 (class 1259 OID 19946303)
-- Name: idx_14a5d6d38a4a6c12; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d38a4a6c12 ON mapa USING btree (lastnik_id);


--
-- TOC entry 2490 (class 1259 OID 19945622)
-- Name: idx_1c7adba5ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba5ee4b985a ON popa USING btree (drzava_id);


--
-- TOC entry 2579 (class 1259 OID 19945848)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2689 (class 1259 OID 19946271)
-- Name: idx_1ed92829253c4123; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829253c4123 ON zapis USING btree (avtor_id);


--
-- TOC entry 2690 (class 1259 OID 19946270)
-- Name: idx_1ed9282957ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282957ed422f ON zapis USING btree (mapa_id);


--
-- TOC entry 2691 (class 1259 OID 19946272)
-- Name: idx_1ed9282987ff3295; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282987ff3295 ON zapis USING btree (zaklenil_id);


--
-- TOC entry 2692 (class 1259 OID 19946269)
-- Name: idx_1ed92829a54dbb1f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829a54dbb1f ON zapis USING btree (datoteka_id);


--
-- TOC entry 2693 (class 1259 OID 19946268)
-- Name: idx_1ed92829ef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829ef943358 ON zapis USING btree (vrsta_id);


--
-- TOC entry 2573 (class 1259 OID 19945834)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2574 (class 1259 OID 19945833)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2526 (class 1259 OID 19945731)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2603 (class 1259 OID 19945908)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2604 (class 1259 OID 19945910)
-- Name: idx_23aeb9586b361365; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9586b361365 ON funkcija USING btree (tipfunkcije_id);


--
-- TOC entry 2605 (class 1259 OID 19945909)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2515 (class 1259 OID 19945700)
-- Name: idx_2942b10710389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b10710389148 ON kontaktnaoseba USING btree (oseba_id);


--
-- TOC entry 2516 (class 1259 OID 19945699)
-- Name: idx_2942b1076beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b1076beede51 ON kontaktnaoseba USING btree (popa_id);


--
-- TOC entry 2680 (class 1259 OID 19946225)
-- Name: idx_2d901816d6bc69d6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2d901816d6bc69d6 ON programskaenotasklopa USING btree (programrazno_id);


--
-- TOC entry 2632 (class 1259 OID 19946018)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2633 (class 1259 OID 19946019)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2634 (class 1259 OID 19946020)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2699 (class 1259 OID 19946292)
-- Name: idx_2eaff9dcaf91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2eaff9dcaf91ecd ON zapislastnik USING btree (zapis_id);


--
-- TOC entry 2641 (class 1259 OID 19946054)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2642 (class 1259 OID 19946051)
-- Name: idx_344a77a7c3b0d59; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a7c3b0d59 ON uprizoritev USING btree (maticnioder_id);


--
-- TOC entry 2643 (class 1259 OID 19946055)
-- Name: idx_344a77a853a965c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a853a965c ON uprizoritev USING btree (producent_id);


--
-- TOC entry 2644 (class 1259 OID 19946053)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2645 (class 1259 OID 19946052)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2505 (class 1259 OID 19945671)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2506 (class 1259 OID 19945670)
-- Name: idx_37f6541a6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a6beede51 ON trr USING btree (popa_id);


--
-- TOC entry 2481 (class 1259 OID 19945595)
-- Name: idx_466966d769e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_466966d769e8d4 ON oseba USING btree (naslov_id);


--
-- TOC entry 2591 (class 1259 OID 19945875)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2471 (class 1259 OID 19945549)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2472 (class 1259 OID 19945550)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2596 (class 1259 OID 19945895)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2597 (class 1259 OID 19945894)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2598 (class 1259 OID 19945893)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2519 (class 1259 OID 19945709)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2520 (class 1259 OID 19945710)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2451 (class 1259 OID 19945482)
-- Name: idx_6054e804ff55f926; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_6054e804ff55f926 ON stevilcenjekonfig USING btree (stevilcenje_id);


--
-- TOC entry 2553 (class 1259 OID 19945800)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2554 (class 1259 OID 19945798)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2555 (class 1259 OID 19945797)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2556 (class 1259 OID 19945799)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2462 (class 1259 OID 19945523)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2463 (class 1259 OID 19945524)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2582 (class 1259 OID 19945856)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2712 (class 1259 OID 19946326)
-- Name: idx_781826c67e3c61f9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_781826c67e3c61f9 ON datoteka USING btree (owner_id);


--
-- TOC entry 2713 (class 1259 OID 19946334)
-- Name: idx_7adc957157ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc957157ed422f ON mapaacl USING btree (mapa_id);


--
-- TOC entry 2714 (class 1259 OID 19946335)
-- Name: idx_7adc9571fa6311ef; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc9571fa6311ef ON mapaacl USING btree (perm_id);


--
-- TOC entry 2568 (class 1259 OID 19945821)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2612 (class 1259 OID 19945939)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2613 (class 1259 OID 19945940)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2662 (class 1259 OID 19946140)
-- Name: idx_8787a0e54ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e54ae1cd1c ON enotaprograma USING btree (gostitelj_id);


--
-- TOC entry 2663 (class 1259 OID 19946139)
-- Name: idx_8787a0e55d0da56c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e55d0da56c ON enotaprograma USING btree (drzavagostovanja_id);


--
-- TOC entry 2664 (class 1259 OID 19946136)
-- Name: idx_8787a0e562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e562b4ffca ON enotaprograma USING btree (uprizoritev_id);


--
-- TOC entry 2665 (class 1259 OID 19946137)
-- Name: idx_8787a0e57222d84b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e57222d84b ON enotaprograma USING btree (tipprogramskeenote_id);


--
-- TOC entry 2666 (class 1259 OID 19946138)
-- Name: idx_8787a0e5771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e5771ec7bd ON enotaprograma USING btree (program_dela_id);


--
-- TOC entry 2494 (class 1259 OID 19945636)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2495 (class 1259 OID 19945635)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2496 (class 1259 OID 19945637)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2585 (class 1259 OID 19945869)
-- Name: idx_952dd21969e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd21969e8d4 ON prostor USING btree (naslov_id);


--
-- TOC entry 2586 (class 1259 OID 19945868)
-- Name: idx_952dd2196beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd2196beede51 ON prostor USING btree (popa_id);


--
-- TOC entry 2672 (class 1259 OID 19946206)
-- Name: idx_97af082e38c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e38c06eb ON produkcijadelitev USING btree (enotaprograma_id);


--
-- TOC entry 2673 (class 1259 OID 19946207)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2655 (class 1259 OID 19946084)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2656 (class 1259 OID 19946085)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2657 (class 1259 OID 19946082)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2658 (class 1259 OID 19946083)
-- Name: idx_a4b7244fa4976613; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fa4976613 ON alternacija USING btree (zaposlitev_id);


--
-- TOC entry 2609 (class 1259 OID 19945930)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2559 (class 1259 OID 19945809)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2560 (class 1259 OID 19945808)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2561 (class 1259 OID 19945806)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2562 (class 1259 OID 19945807)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2651 (class 1259 OID 19946072)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2652 (class 1259 OID 19946071)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2525 (class 1259 OID 19945721)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2669 (class 1259 OID 19946197)
-- Name: idx_dba42fe79e3adf2c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_dba42fe79e3adf2c ON postavkacdve USING btree (programdela_id);


--
-- TOC entry 2688 (class 1259 OID 19946244)
-- Name: idx_e7d4cf2638c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e7d4cf2638c06eb ON drugivir USING btree (enotaprograma_id);


--
-- TOC entry 2706 (class 1259 OID 19946310)
-- Name: idx_e9f8ee8257ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee8257ed422f ON mapa_zapis USING btree (mapa_id);


--
-- TOC entry 2707 (class 1259 OID 19946311)
-- Name: idx_e9f8ee82af91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee82af91ecd ON mapa_zapis USING btree (zapis_id);


--
-- TOC entry 2477 (class 1259 OID 19945570)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2478 (class 1259 OID 19945569)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2486 (class 1259 OID 19945602)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2487 (class 1259 OID 19945603)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2548 (class 1259 OID 19945790)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2549 (class 1259 OID 19945789)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2550 (class 1259 OID 19945788)
-- Name: idx_fef7d84ba81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84ba81ccef6 ON terminstoritve USING btree (dogodek_id);


--
-- TOC entry 2536 (class 1259 OID 19945749)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2537 (class 1259 OID 19945750)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2538 (class 1259 OID 19945748)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2539 (class 1259 OID 19945752)
-- Name: uniq_11e93b5dbbc7a989; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dbbc7a989 ON dogodek USING btree (dogodek_splosni_id);


--
-- TOC entry 2540 (class 1259 OID 19945751)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2493 (class 1259 OID 19945621)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2511 (class 1259 OID 19945685)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2512 (class 1259 OID 19945687)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2513 (class 1259 OID 19945686)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2514 (class 1259 OID 19945688)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2567 (class 1259 OID 19945815)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2637 (class 1259 OID 19946017)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2646 (class 1259 OID 19946050)
-- Name: uniq_344a77a559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_344a77a559828a3 ON uprizoritev USING btree (sifra);


--
-- TOC entry 2628 (class 1259 OID 19945992)
-- Name: uniq_3f50510d559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d559828a3 ON tipfunkcije USING btree (sifra);


--
-- TOC entry 2629 (class 1259 OID 19945993)
-- Name: uniq_3f50510d55cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d55cca980 ON tipfunkcije USING btree (ime);


--
-- TOC entry 2484 (class 1259 OID 19945593)
-- Name: uniq_466966d7559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7559828a3 ON oseba USING btree (sifra);


--
-- TOC entry 2485 (class 1259 OID 19945594)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2606 (class 1259 OID 19945920)
-- Name: uniq_5216fcb0559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5216fcb0559828a3 ON zvrstuprizoritve USING btree (sifra);


--
-- TOC entry 2457 (class 1259 OID 19945493)
-- Name: uniq_5a434fbc559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5a434fbc559828a3 ON stevilcenje USING btree (sifra);


--
-- TOC entry 2504 (class 1259 OID 19945657)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2454 (class 1259 OID 19945481)
-- Name: uniq_6054e804889a7556; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_6054e804889a7556 ON stevilcenjekonfig USING btree (dok);


--
-- TOC entry 2685 (class 1259 OID 19946237)
-- Name: uniq_7d834df4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_7d834df4559828a3 ON tipprogramskeenote USING btree (sifra);


--
-- TOC entry 2589 (class 1259 OID 19945867)
-- Name: uniq_952dd21937854736; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21937854736 ON prostor USING btree (naziv);


--
-- TOC entry 2590 (class 1259 OID 19945866)
-- Name: uniq_952dd219559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd219559828a3 ON prostor USING btree (sifra);


--
-- TOC entry 2659 (class 1259 OID 19946081)
-- Name: uniq_a4b7244f559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a4b7244f559828a3 ON alternacija USING btree (sifra);


--
-- TOC entry 2501 (class 1259 OID 19945645)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2638 (class 1259 OID 19946030)
-- Name: uniq_cede8e36559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_cede8e36559828a3 ON zvrstsurs USING btree (sifra);


--
-- TOC entry 2696 (class 1259 OID 19946284)
-- Name: uniq_de1c8aa1d55226c7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_de1c8aa1d55226c7 ON vrstazapisa USING btree (oznaka);


--
-- TOC entry 2678 (class 1259 OID 19946214)
-- Name: uniq_e6fc2028559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc2028559828a3 ON produkcijskahisa USING btree (sifra);


--
-- TOC entry 2679 (class 1259 OID 19946215)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2625 (class 1259 OID 19945981)
-- Name: uniq_ec773670ca2e5fcb; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ec773670ca2e5fcb ON besedilo USING btree (stevilka);


--
-- TOC entry 2547 (class 1259 OID 19945777)
-- Name: uniq_ecc8f8c5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ecc8f8c5559828a3 ON sezona USING btree (sifra);


--
-- TOC entry 2470 (class 1259 OID 19945543)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2745 (class 2606 OID 19946456)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2744 (class 2606 OID 19946461)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2740 (class 2606 OID 19946481)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2746 (class 2606 OID 19946451)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2742 (class 2606 OID 19946471)
-- Name: fk_11e93b5dbbc7a989; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dbbc7a989 FOREIGN KEY (dogodek_splosni_id) REFERENCES dogodeksplosni(id);


--
-- TOC entry 2741 (class 2606 OID 19946476)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2743 (class 2606 OID 19946466)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2778 (class 2606 OID 19946631)
-- Name: fk_11ffe6e05c75296c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e05c75296c FOREIGN KEY (vrstastroska_id) REFERENCES vrstastroska(id);


--
-- TOC entry 2777 (class 2606 OID 19946636)
-- Name: fk_11ffe6e062b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e062b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2776 (class 2606 OID 19946641)
-- Name: fk_11ffe6e06beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e06beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2810 (class 2606 OID 19946806)
-- Name: fk_14a5d6d3727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d3727aca70 FOREIGN KEY (parent_id) REFERENCES mapa(id);


--
-- TOC entry 2811 (class 2606 OID 19946801)
-- Name: fk_14a5d6d38a4a6c12; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d38a4a6c12 FOREIGN KEY (lastnik_id) REFERENCES uporabniki(id);


--
-- TOC entry 2728 (class 2606 OID 19946391)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2762 (class 2606 OID 19946561)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2805 (class 2606 OID 19946786)
-- Name: fk_1ed92829253c4123; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829253c4123 FOREIGN KEY (avtor_id) REFERENCES uporabniki(id);


--
-- TOC entry 2806 (class 2606 OID 19946781)
-- Name: fk_1ed9282957ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282957ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2804 (class 2606 OID 19946791)
-- Name: fk_1ed9282987ff3295; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282987ff3295 FOREIGN KEY (zaklenil_id) REFERENCES uporabniki(id);


--
-- TOC entry 2807 (class 2606 OID 19946776)
-- Name: fk_1ed92829a54dbb1f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829a54dbb1f FOREIGN KEY (datoteka_id) REFERENCES datoteka(id);


--
-- TOC entry 2808 (class 2606 OID 19946771)
-- Name: fk_1ed92829ef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829ef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstazapisa(id);


--
-- TOC entry 2760 (class 2606 OID 19946556)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2761 (class 2606 OID 19946551)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2739 (class 2606 OID 19946446)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2772 (class 2606 OID 19946601)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2770 (class 2606 OID 19946611)
-- Name: fk_23aeb9586b361365; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9586b361365 FOREIGN KEY (tipfunkcije_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2771 (class 2606 OID 19946606)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2734 (class 2606 OID 19946426)
-- Name: fk_2942b10710389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b10710389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2735 (class 2606 OID 19946421)
-- Name: fk_2942b1076beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b1076beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2758 (class 2606 OID 19946541)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2802 (class 2606 OID 19946761)
-- Name: fk_2d901816d6bc69d6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT fk_2d901816d6bc69d6 FOREIGN KEY (programrazno_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2781 (class 2606 OID 19946646)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2780 (class 2606 OID 19946651)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2779 (class 2606 OID 19946656)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 2809 (class 2606 OID 19946796)
-- Name: fk_2eaff9dcaf91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT fk_2eaff9dcaf91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id);


--
-- TOC entry 2783 (class 2606 OID 19946676)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2786 (class 2606 OID 19946661)
-- Name: fk_344a77a7c3b0d59; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a7c3b0d59 FOREIGN KEY (maticnioder_id) REFERENCES prostor(id);


--
-- TOC entry 2782 (class 2606 OID 19946681)
-- Name: fk_344a77a853a965c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a853a965c FOREIGN KEY (producent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2784 (class 2606 OID 19946671)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2785 (class 2606 OID 19946666)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2732 (class 2606 OID 19946416)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2733 (class 2606 OID 19946411)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2724 (class 2606 OID 19946376)
-- Name: fk_466966d769e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d769e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2725 (class 2606 OID 19946371)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2766 (class 2606 OID 19946581)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2721 (class 2606 OID 19946351)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2720 (class 2606 OID 19946356)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2767 (class 2606 OID 19946596)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2768 (class 2606 OID 19946591)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2769 (class 2606 OID 19946586)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2737 (class 2606 OID 19946431)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2736 (class 2606 OID 19946436)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2717 (class 2606 OID 19946336)
-- Name: fk_6054e804ff55f926; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT fk_6054e804ff55f926 FOREIGN KEY (stevilcenje_id) REFERENCES stevilcenje(id);


--
-- TOC entry 2750 (class 2606 OID 19946516)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2752 (class 2606 OID 19946506)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2753 (class 2606 OID 19946501)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2751 (class 2606 OID 19946511)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2719 (class 2606 OID 19946341)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2718 (class 2606 OID 19946346)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2763 (class 2606 OID 19946566)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2814 (class 2606 OID 19946821)
-- Name: fk_781826c67e3c61f9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT fk_781826c67e3c61f9 FOREIGN KEY (owner_id) REFERENCES uporabniki(id);


--
-- TOC entry 2816 (class 2606 OID 19946826)
-- Name: fk_7adc957157ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc957157ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2815 (class 2606 OID 19946831)
-- Name: fk_7adc9571fa6311ef; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc9571fa6311ef FOREIGN KEY (perm_id) REFERENCES permission(id);


--
-- TOC entry 2759 (class 2606 OID 19946546)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2775 (class 2606 OID 19946621)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2774 (class 2606 OID 19946626)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2793 (class 2606 OID 19946736)
-- Name: fk_8787a0e54ae1cd1c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e54ae1cd1c FOREIGN KEY (gostitelj_id) REFERENCES popa(id);


--
-- TOC entry 2794 (class 2606 OID 19946731)
-- Name: fk_8787a0e55d0da56c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e55d0da56c FOREIGN KEY (drzavagostovanja_id) REFERENCES drza(id);


--
-- TOC entry 2797 (class 2606 OID 19946716)
-- Name: fk_8787a0e562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2796 (class 2606 OID 19946721)
-- Name: fk_8787a0e57222d84b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e57222d84b FOREIGN KEY (tipprogramskeenote_id) REFERENCES tipprogramskeenote(id);


--
-- TOC entry 2795 (class 2606 OID 19946726)
-- Name: fk_8787a0e5771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e5771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2730 (class 2606 OID 19946401)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2731 (class 2606 OID 19946396)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2729 (class 2606 OID 19946406)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2764 (class 2606 OID 19946576)
-- Name: fk_952dd21969e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd21969e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2765 (class 2606 OID 19946571)
-- Name: fk_952dd2196beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd2196beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2800 (class 2606 OID 19946746)
-- Name: fk_97af082e38c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e38c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2799 (class 2606 OID 19946751)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2790 (class 2606 OID 19946706)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2789 (class 2606 OID 19946711)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2792 (class 2606 OID 19946696)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 2791 (class 2606 OID 19946701)
-- Name: fk_a4b7244fa4976613; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fa4976613 FOREIGN KEY (zaposlitev_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2773 (class 2606 OID 19946616)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2754 (class 2606 OID 19946536)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2755 (class 2606 OID 19946531)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2757 (class 2606 OID 19946521)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2756 (class 2606 OID 19946526)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2787 (class 2606 OID 19946691)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2788 (class 2606 OID 19946686)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2738 (class 2606 OID 19946441)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2798 (class 2606 OID 19946741)
-- Name: fk_dba42fe79e3adf2c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkacdve
    ADD CONSTRAINT fk_dba42fe79e3adf2c FOREIGN KEY (programdela_id) REFERENCES programdela(id);


--
-- TOC entry 2801 (class 2606 OID 19946756)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2803 (class 2606 OID 19946766)
-- Name: fk_e7d4cf2638c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT fk_e7d4cf2638c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2813 (class 2606 OID 19946811)
-- Name: fk_e9f8ee8257ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee8257ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id) ON DELETE CASCADE;


--
-- TOC entry 2812 (class 2606 OID 19946816)
-- Name: fk_e9f8ee82af91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee82af91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id) ON DELETE CASCADE;


--
-- TOC entry 2722 (class 2606 OID 19946366)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2723 (class 2606 OID 19946361)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2727 (class 2606 OID 19946381)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2726 (class 2606 OID 19946386)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2747 (class 2606 OID 19946496)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2748 (class 2606 OID 19946491)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2749 (class 2606 OID 19946486)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- Completed on 2015-09-17 17:48:20 CEST

--
-- PostgreSQL database dump complete
--

