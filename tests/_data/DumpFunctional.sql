--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.9
-- Dumped by pg_dump version 9.3.9
-- Started on 2015-09-17 12:10:33 CEST

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
-- TOC entry 181 (class 1259 OID 19923615)
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
-- TOC entry 226 (class 1259 OID 19924137)
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
-- TOC entry 225 (class 1259 OID 19924120)
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
-- TOC entry 219 (class 1259 OID 19924028)
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
-- TOC entry 240 (class 1259 OID 19924376)
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
-- TOC entry 195 (class 1259 OID 19923796)
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
-- TOC entry 197 (class 1259 OID 19923827)
-- Name: dogodeksplosni; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodeksplosni (
    id uuid NOT NULL
);


--
-- TOC entry 234 (class 1259 OID 19924302)
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
-- TOC entry 190 (class 1259 OID 19923736)
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
-- TOC entry 227 (class 1259 OID 19924150)
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
-- TOC entry 213 (class 1259 OID 19923960)
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
-- TOC entry 193 (class 1259 OID 19923775)
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
-- TOC entry 191 (class 1259 OID 19923753)
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
-- TOC entry 202 (class 1259 OID 19923874)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 238 (class 1259 OID 19924357)
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
-- TOC entry 239 (class 1259 OID 19924369)
-- Name: mapa_zapis; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE mapa_zapis (
    mapa_id uuid NOT NULL,
    zapis_id uuid NOT NULL
);


--
-- TOC entry 241 (class 1259 OID 19924391)
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
-- TOC entry 206 (class 1259 OID 19923899)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 188 (class 1259 OID 19923710)
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
-- TOC entry 182 (class 1259 OID 19923624)
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
-- TOC entry 183 (class 1259 OID 19923635)
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
-- TOC entry 178 (class 1259 OID 19923589)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 180 (class 1259 OID 19923608)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 207 (class 1259 OID 19923906)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 211 (class 1259 OID 19923940)
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
-- TOC entry 222 (class 1259 OID 19924069)
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
-- TOC entry 185 (class 1259 OID 19923668)
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
-- TOC entry 187 (class 1259 OID 19923702)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 229 (class 1259 OID 19924248)
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
-- TOC entry 203 (class 1259 OID 19923880)
-- Name: postavkaracuna; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE postavkaracuna (
    id uuid NOT NULL,
    racun_id uuid
);


--
-- TOC entry 186 (class 1259 OID 19923687)
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
-- TOC entry 192 (class 1259 OID 19923765)
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
-- TOC entry 205 (class 1259 OID 19923892)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 230 (class 1259 OID 19924262)
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
-- TOC entry 231 (class 1259 OID 19924272)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    sifra character varying(4) NOT NULL,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 228 (class 1259 OID 19924205)
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
-- TOC entry 232 (class 1259 OID 19924280)
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
-- TOC entry 209 (class 1259 OID 19923921)
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
-- TOC entry 201 (class 1259 OID 19923865)
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
-- TOC entry 200 (class 1259 OID 19923855)
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
-- TOC entry 221 (class 1259 OID 19924058)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying,
    status character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 216 (class 1259 OID 19923995)
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
-- TOC entry 175 (class 1259 OID 19923560)
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
-- TOC entry 174 (class 1259 OID 19923558)
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
-- TOC entry 210 (class 1259 OID 19923934)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 179 (class 1259 OID 19923598)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 177 (class 1259 OID 19923582)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 212 (class 1259 OID 19923948)
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
-- TOC entry 204 (class 1259 OID 19923886)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 198 (class 1259 OID 19923832)
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
-- TOC entry 173 (class 1259 OID 19923547)
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
-- TOC entry 172 (class 1259 OID 19923539)
-- Name: stevilcenjekonfig; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjekonfig (
    id uuid NOT NULL,
    stevilcenje_id uuid,
    dok character varying(100) DEFAULT NULL::character varying
);


--
-- TOC entry 171 (class 1259 OID 19923534)
-- Name: stevilcenjestanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjestanje (
    id uuid NOT NULL,
    objid uuid NOT NULL,
    leto integer NOT NULL,
    stevilka integer
);


--
-- TOC entry 217 (class 1259 OID 19924005)
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
-- TOC entry 184 (class 1259 OID 19923660)
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
-- TOC entry 199 (class 1259 OID 19923842)
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
-- TOC entry 220 (class 1259 OID 19924046)
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
-- TOC entry 233 (class 1259 OID 19924290)
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
-- TOC entry 189 (class 1259 OID 19923722)
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
-- TOC entry 176 (class 1259 OID 19923569)
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
-- TOC entry 224 (class 1259 OID 19924095)
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
-- TOC entry 194 (class 1259 OID 19923786)
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
-- TOC entry 208 (class 1259 OID 19923913)
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
-- TOC entry 218 (class 1259 OID 19924019)
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
-- TOC entry 236 (class 1259 OID 19924337)
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
-- TOC entry 235 (class 1259 OID 19924309)
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
-- TOC entry 237 (class 1259 OID 19924349)
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
-- TOC entry 215 (class 1259 OID 19923985)
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
-- TOC entry 196 (class 1259 OID 19923822)
-- Name: zasedenost; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zasedenost (
    id uuid NOT NULL
);


--
-- TOC entry 223 (class 1259 OID 19924085)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 214 (class 1259 OID 19923975)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 2187 (class 2604 OID 19923563)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 2935 (class 0 OID 19923615)
-- Dependencies: 181
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
\.


--
-- TOC entry 2980 (class 0 OID 19924137)
-- Dependencies: 226
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, zaposlitev_id, oseba_id, pogodba_id, sifra, zaposlen, zacetek, konec, opomba, sort, privzeti, aktivna, imapogodbo, pomembna) FROM stdin;
000c0000-55fa-9197-668f-569c1a935f79	000d0000-55fa-9197-19fa-631236497d53	\N	00090000-55fa-9197-f35a-b4f66c9e6f3e	000b0000-55fa-9197-45f4-98711bdc01e3	0001	f	\N	\N	\N	3	t	\N	t	t
000c0000-55fa-9197-b7a2-26597b9df1d9	000d0000-55fa-9197-ebed-bd3476845477	00100000-55fa-9197-229d-8e004cc8b2d8	00090000-55fa-9197-c038-bc91633aa30d	\N	0002	t	2016-01-01	\N	\N	8	t	\N	f	f
000c0000-55fa-9197-c96a-f863c1637ad6	000d0000-55fa-9197-e88f-d1d003e8ab85	00100000-55fa-9197-8fca-d669444108b7	00090000-55fa-9197-76dc-1d2eaa6bc8ee	\N	0003	t	\N	2015-09-17	\N	2	t	\N	f	f
000c0000-55fa-9197-e3bf-aa75eeae9989	000d0000-55fa-9197-b60d-7ac3dc48d221	\N	00090000-55fa-9197-fc93-40e7c61ea015	\N	0004	f	2016-01-01	2016-01-01	\N	26	t	\N	f	f
000c0000-55fa-9197-6dc6-d70543bfbe87	000d0000-55fa-9197-fc16-11be06310663	\N	00090000-55fa-9197-5609-c6ce2e20baa0	\N	0005	f	2016-01-01	2016-01-01	\N	7	t	\N	f	f
000c0000-55fa-9197-b866-00ffd70ac8ba	000d0000-55fa-9197-35d4-950aca62d2b0	\N	00090000-55fa-9197-4da9-91f6fbccd317	000b0000-55fa-9197-31a5-371017923faa	0006	f	2016-01-01	2016-01-01	\N	1	t	\N	t	t
000c0000-55fa-9197-769d-53c112ff0fba	000d0000-55fa-9197-477d-07fecfd918d6	00100000-55fa-9197-d2e7-8f99c7aab92e	00090000-55fa-9197-c768-f9b91d144670	\N	0007	t	2016-01-01	2016-01-01	\N	14	t	\N	f	t
000c0000-55fa-9197-e5cd-14a7222d9c1a	000d0000-55fa-9197-8e1b-66a70d608544	\N	00090000-55fa-9197-d992-613a3c072cc9	000b0000-55fa-9197-3323-8332a2f9352a	0008	f	2016-01-01	2016-01-01	\N	12	t	\N	t	t
000c0000-55fa-9197-0e34-7e21d6d32f7b	000d0000-55fa-9197-477d-07fecfd918d6	00100000-55fa-9197-ffb2-4134f17da066	00090000-55fa-9197-613d-e8b869c72314	\N	0009	t	2017-01-01	2017-01-01	\N	15	t	\N	f	t
000c0000-55fa-9197-e99a-d2d1a02c7800	000d0000-55fa-9197-477d-07fecfd918d6	00100000-55fa-9197-115d-9481f65e946d	00090000-55fa-9197-2477-10d1d339769b	\N	0010	t	\N	2015-09-17	\N	16	f	\N	f	t
000c0000-55fa-9197-3386-d8a8721c429f	000d0000-55fa-9197-477d-07fecfd918d6	00100000-55fa-9197-b262-b74b7b5ea276	00090000-55fa-9197-ec1c-5fb054a7021e	\N	0011	t	2017-01-01	\N	\N	17	f	\N	f	t
000c0000-55fa-9197-97b3-c74739c3f132	000d0000-55fa-9197-2540-25cf31dd08d4	\N	00090000-55fa-9197-c038-bc91633aa30d	000b0000-55fa-9197-63a5-052d44498fb5	0012	f	\N	\N	\N	2	t	\N	t	t
\.


--
-- TOC entry 2979 (class 0 OID 19924120)
-- Dependencies: 225
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 2973 (class 0 OID 19924028)
-- Dependencies: 219
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, stevilka, naslov, avtor, podnaslov, jezik, naslovizvirnika, internacionalninaslov, datumprejema, moskevloge, zenskevloge, prevajalec, povzetekvsebine, letoizida, krajizida, zaloznik) FROM stdin;
00160000-55fa-9197-b5af-e16534c21ea2	0001	Sen kresne noči	William Shakespeare		slovenščina	A Midsummer Night's Dream	\N	2015-04-26	5	5	Milan Jesih	Nastopajo Titanija, Hipolita, Oberon, ...	\N	\N	\N
00160000-55fa-9197-e3a1-0b181fe5faf6	0002	Bratje Karamazovi	Fjodor Mihajlovič Dostojevski		slovenščina	Bratja Karamazjovji	\N	2015-12-04	4	1	Vladimir Levstik	Svetovna uspešnica	\N	\N	\N
00160000-55fa-9197-f78d-9753c2360f25	0003	Smoletov Vrt	Berta Hočevar		slovenščina		\N	2015-05-26	2	8			\N	\N	\N
\.


--
-- TOC entry 2994 (class 0 OID 19924376)
-- Dependencies: 240
-- Data for Name: datoteka; Type: TABLE DATA; Schema: public; Owner: -
--

COPY datoteka (id, owner_id, filename, transfers, size, format, hash, createdat, uploadedat, upor, datknj) FROM stdin;
\.


--
-- TOC entry 2949 (class 0 OID 19923796)
-- Dependencies: 195
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_splosni_id, prostor_id, sezona_id, planiranzacetek, allday, zacetek, konec, status, razred, termin, title) FROM stdin;
00180000-55fa-9197-4834-70e725f67b83	\N	\N	00200000-55fa-9197-cbcf-1378c6518a92	\N	\N	\N	\N	2015-06-26 10:00:00	f	2015-06-26 10:00:00	2015-06-26 12:00:00	200s	200s		dogodek 1
00180000-55fa-9197-e1ad-8444f0d74127	\N	\N	00200000-55fa-9197-8eb7-038dd28b8967	\N	\N	\N	\N	2015-06-27 10:00:00	f	2015-06-27 10:00:00	2015-06-27 12:00:00	300s	200s		dogodek 2
00180000-55fa-9197-065d-35ae0b70f550	\N	\N	00200000-55fa-9197-f72f-2c35339303ad	\N	\N	\N	\N	2015-08-01 20:00:00	f	2015-08-01 20:00:00	2015-08-01 23:00:00	400s	200s		dogodek 3
00180000-55fa-9197-39c0-cac4ca195d38	\N	\N	00200000-55fa-9197-05dd-1a0ea29250cb	\N	\N	\N	\N	2015-08-01 20:00:00	f	2015-08-01 20:00:00	2015-08-01 23:00:00	100s	200s		dogodek 4
00180000-55fa-9197-de05-d8af76623721	\N	\N	00200000-55fa-9197-f5b8-8d5b5044d9a2	\N	\N	\N	\N	2015-08-01 20:00:00	f	2015-08-01 20:00:00	2015-08-01 23:00:00	500s	200s		dogodek 5
\.


--
-- TOC entry 2951 (class 0 OID 19923827)
-- Dependencies: 197
-- Data for Name: dogodeksplosni; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodeksplosni (id) FROM stdin;
\.


--
-- TOC entry 2988 (class 0 OID 19924302)
-- Dependencies: 234
-- Data for Name: drugivir; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drugivir (id, znesek, opis, mednarodni, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 2944 (class 0 OID 19923736)
-- Dependencies: 190
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-55fa-9195-82b8-b6e15cf52826	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-55fa-9195-460d-d07ca0759bb2	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-55fa-9195-fdba-87169353aec1	AL	ALB	008	Albania 	Albanija	\N
00040000-55fa-9195-1ee1-f80874fb0d6f	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-55fa-9195-bbb9-00e1fb97f75a	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-55fa-9195-979d-50c418f0afc6	AD	AND	020	Andorra 	Andora	\N
00040000-55fa-9195-c116-372e8160b88a	AO	AGO	024	Angola 	Angola	\N
00040000-55fa-9195-0492-992e988faa15	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-55fa-9195-921d-0dc22e97e79b	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-55fa-9195-df7c-66e6651942ff	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-55fa-9195-3636-49c4cc900380	AR	ARG	032	Argentina 	Argenitna	\N
00040000-55fa-9195-d245-357ec110c244	AM	ARM	051	Armenia 	Armenija	\N
00040000-55fa-9195-d410-7ce61b71fb54	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-55fa-9195-51bd-f3053b6ad175	AU	AUS	036	Australia 	Avstralija	\N
00040000-55fa-9195-d051-037ad7e2121c	AT	AUT	040	Austria 	Avstrija	\N
00040000-55fa-9195-0ea6-33bf97f52770	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-55fa-9195-c72c-ace110ba9227	BS	BHS	044	Bahamas 	Bahami	\N
00040000-55fa-9195-89ad-6770732a0a32	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-55fa-9195-f030-3963d867472d	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-55fa-9195-7bd1-a10f3ab28653	BB	BRB	052	Barbados 	Barbados	\N
00040000-55fa-9195-bc3f-0197f3b11ee6	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-55fa-9195-0a71-90797cba806d	BE	BEL	056	Belgium 	Belgija	\N
00040000-55fa-9195-06a4-ba10f238a603	BZ	BLZ	084	Belize 	Belize	\N
00040000-55fa-9195-0d0b-bce5f4535263	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-55fa-9195-41ab-a5a903f3f621	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-55fa-9195-9f7d-d41a99a1d550	BT	BTN	064	Bhutan 	Butan	\N
00040000-55fa-9195-a35a-81f6157c18f9	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-55fa-9195-1b64-f843173f84d7	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-55fa-9195-73fe-d1183a10ffcb	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-55fa-9195-eb6b-c441660fc8b1	BW	BWA	072	Botswana 	Bocvana	\N
00040000-55fa-9195-fb3c-b9e641044477	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-55fa-9195-885d-5e305d688dbf	BR	BRA	076	Brazil 	Brazilija	\N
00040000-55fa-9195-5799-e30ee51fedbf	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-55fa-9195-4711-42aa171ff0ea	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-55fa-9195-650f-c89e51076c76	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-55fa-9195-6323-08e139e0312e	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-55fa-9195-5707-a7b4ea463250	BI	BDI	108	Burundi 	Burundi 	\N
00040000-55fa-9195-d14e-19c49f741c4d	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-55fa-9195-c19e-e915e686317d	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-55fa-9195-055d-62c8d13f9ecc	CA	CAN	124	Canada 	Kanada	\N
00040000-55fa-9195-9133-b7aff6dc6933	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-55fa-9195-154e-963b3fbf8195	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-55fa-9195-b5c0-32de0b6edf79	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-55fa-9195-463d-537f6753e656	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-55fa-9195-a8f4-4e964fd3f524	CL	CHL	152	Chile 	Čile	\N
00040000-55fa-9195-33fa-c0990eb1d937	CN	CHN	156	China 	Kitajska	\N
00040000-55fa-9195-4ae6-567d263a0cc1	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-55fa-9195-036d-4c9db9563483	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-55fa-9195-3816-b5cf26bfb61d	CO	COL	170	Colombia 	Kolumbija	\N
00040000-55fa-9195-2018-958603b8312e	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-55fa-9195-63a7-1d06fe2e9f33	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-55fa-9195-d746-b347b13c1f25	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-55fa-9195-25b1-f1ff11725952	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-55fa-9195-f256-3b08feadbf3c	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-55fa-9195-b296-5cbce79f3718	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-55fa-9195-d0de-6175b9d55f24	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-55fa-9195-3604-ebfb1b9bd489	CU	CUB	192	Cuba 	Kuba	\N
00040000-55fa-9195-78fc-69eb57dc276c	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-55fa-9195-b409-443e4e4fb8ee	CY	CYP	196	Cyprus 	Ciper	\N
00040000-55fa-9195-92c2-71e6eab36baf	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-55fa-9195-885b-fa6368fe54e2	DK	DNK	208	Denmark 	Danska	\N
00040000-55fa-9195-835f-9971e1da0f06	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-55fa-9195-d10c-b9c4d9f3ad61	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-55fa-9195-4a4c-2d26df397aaf	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-55fa-9195-8d8f-53a7aa184a3a	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-55fa-9195-f103-f8212e2ee9a4	EG	EGY	818	Egypt 	Egipt	\N
00040000-55fa-9195-a688-9e9d1c66dc6e	SV	SLV	222	El Salvador 	Salvador	\N
00040000-55fa-9195-fa63-c76275798ebf	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-55fa-9195-519f-598bc3edb304	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-55fa-9195-559a-9b28ee93147c	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-55fa-9195-0670-7b1e499c0eb6	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-55fa-9195-1b4d-c82ea1c7fa31	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-55fa-9195-3331-72e1885bf0cf	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-55fa-9195-d327-2e139b7b7ba8	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-55fa-9195-6060-86cbc9cef0e8	FI	FIN	246	Finland 	Finska	\N
00040000-55fa-9195-ae7a-a0922e87d5d1	FR	FRA	250	France 	Francija	\N
00040000-55fa-9195-ba4c-d84f1e603e91	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-55fa-9195-1b9c-ae94e204f417	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-55fa-9195-a1e3-712ad72b3592	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-55fa-9195-de10-d93037a06163	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-55fa-9195-76a3-f4b5fe38b958	GA	GAB	266	Gabon 	Gabon	\N
00040000-55fa-9195-4cbb-bbeaefbe7961	GM	GMB	270	Gambia 	Gambija	\N
00040000-55fa-9195-3ae9-a3f9931d1d7a	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-55fa-9195-5975-732fdb6af459	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-55fa-9195-ad9e-f9e58a5f4b8d	GH	GHA	288	Ghana 	Gana	\N
00040000-55fa-9195-c07e-bc3305a5b3e9	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-55fa-9195-c897-70e94eb34173	GR	GRC	300	Greece 	Grčija	\N
00040000-55fa-9195-35ef-7fa5868f7132	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-55fa-9195-f4d9-baf8199213b3	GD	GRD	308	Grenada 	Grenada	\N
00040000-55fa-9195-e2a6-23adb8fd3fea	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-55fa-9195-a758-e1c2ea5f9fce	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-55fa-9195-e899-fe71bb685740	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-55fa-9195-341e-828e430094d6	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-55fa-9195-11b8-56e18c775238	GN	GIN	324	Guinea 	Gvineja	\N
00040000-55fa-9195-28a2-c65784933e92	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-55fa-9195-5ae2-6392705b50d3	GY	GUY	328	Guyana 	Gvajana	\N
00040000-55fa-9195-c25e-fd855e6ae039	HT	HTI	332	Haiti 	Haiti	\N
00040000-55fa-9195-1e89-8563539ae383	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-55fa-9195-800d-018fda16c59d	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-55fa-9195-b615-b039404c7fe5	HN	HND	340	Honduras 	Honduras	\N
00040000-55fa-9195-356e-4d450e55405c	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-55fa-9195-7f0c-93a62ddfd2fc	HU	HUN	348	Hungary 	Madžarska	\N
00040000-55fa-9195-cdcf-1a122f1c7276	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-55fa-9195-7365-656a989cca9b	IN	IND	356	India 	Indija	\N
00040000-55fa-9195-17d3-22717cabbdaa	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-55fa-9195-43d7-89a61b87796f	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-55fa-9195-16fa-ffc772a96fed	IQ	IRQ	368	Iraq 	Irak	\N
00040000-55fa-9195-96e6-13a8b557b7bd	IE	IRL	372	Ireland 	Irska	\N
00040000-55fa-9195-bf1f-8abb22eab82d	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-55fa-9195-fdb4-3d30090c5b5b	IL	ISR	376	Israel 	Izrael	\N
00040000-55fa-9195-4873-fdb0464fa360	IT	ITA	380	Italy 	Italija	\N
00040000-55fa-9195-345f-906b49b8c671	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-55fa-9195-aae8-ba13bfda8132	JP	JPN	392	Japan 	Japonska	\N
00040000-55fa-9195-f894-b1590e141247	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-55fa-9195-2853-4fb04a305666	JO	JOR	400	Jordan 	Jordanija	\N
00040000-55fa-9195-a25c-eddd557d4faf	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-55fa-9195-a4ff-a72217f6dec0	KE	KEN	404	Kenya 	Kenija	\N
00040000-55fa-9195-99d5-66b1c3dffcae	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-55fa-9195-210f-20d738a66868	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-55fa-9195-f889-31d4cda3a4f8	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-55fa-9195-8284-a5ce04f3f224	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-55fa-9195-fdde-e1c18e36dd16	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-55fa-9195-10ea-40c7fcb51ce0	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-55fa-9195-bd6a-72170b12ee89	LV	LVA	428	Latvia 	Latvija	\N
00040000-55fa-9195-2e79-39d281684029	LB	LBN	422	Lebanon 	Libanon	\N
00040000-55fa-9195-61d6-759367b6f887	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-55fa-9195-1915-35109863d192	LR	LBR	430	Liberia 	Liberija	\N
00040000-55fa-9195-6e2b-832bfad48e81	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-55fa-9195-1732-f75f78558c79	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-55fa-9195-d741-5baccc832a81	LT	LTU	440	Lithuania 	Litva	\N
00040000-55fa-9195-1c9a-3f8646eb2f91	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-55fa-9195-bd5a-e17251baf8b8	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-55fa-9195-e6ac-4d891303e3c4	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-55fa-9195-287a-a0632648ecc2	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-55fa-9195-18cf-2e8283dfa67e	MW	MWI	454	Malawi 	Malavi	\N
00040000-55fa-9195-134f-e7822829aef6	MY	MYS	458	Malaysia 	Malezija	\N
00040000-55fa-9195-74d4-9957cea2dc25	MV	MDV	462	Maldives 	Maldivi	\N
00040000-55fa-9195-ea65-cba9d99d8e3e	ML	MLI	466	Mali 	Mali	\N
00040000-55fa-9195-8182-afce8208aa90	MT	MLT	470	Malta 	Malta	\N
00040000-55fa-9195-8a74-344548cf2894	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-55fa-9195-2da9-9e6ee8f919e6	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-55fa-9195-438e-7f55111bfde6	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-55fa-9195-7480-422fe31330a0	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-55fa-9195-6cfe-48b947b78043	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-55fa-9195-03f5-fc7854bf3ed1	MX	MEX	484	Mexico 	Mehika	\N
00040000-55fa-9195-3867-16a4aba37011	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-55fa-9195-198c-b47b4bfe17ef	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-55fa-9195-17e1-60cc95c9a669	MC	MCO	492	Monaco 	Monako	\N
00040000-55fa-9195-08e7-3486cb918bc2	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-55fa-9195-297c-e2a288a6ac61	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-55fa-9195-6cfc-323a9de967f8	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-55fa-9195-c7f2-79af0833bb6e	MA	MAR	504	Morocco 	Maroko	\N
00040000-55fa-9195-49ef-ce659e970355	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-55fa-9195-8efa-b8e1bdb2d761	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-55fa-9195-4dcb-fa2888c0dc11	NA	NAM	516	Namibia 	Namibija	\N
00040000-55fa-9195-da1c-59aa950ae0f3	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-55fa-9195-5fbc-33835fb2b518	NP	NPL	524	Nepal 	Nepal	\N
00040000-55fa-9195-5902-63739414bf09	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-55fa-9195-4701-1919ade0a100	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-55fa-9195-cfca-19dcdb3131d8	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-55fa-9195-eaff-59e914eb67a2	NE	NER	562	Niger 	Niger 	\N
00040000-55fa-9195-dab0-137327e5d783	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-55fa-9195-02b3-a478c615c2b8	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-55fa-9195-92bb-1107ad2d5c04	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-55fa-9195-88e2-648d334ab226	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-55fa-9195-4c9f-73d9cca5688c	NO	NOR	578	Norway 	Norveška	\N
00040000-55fa-9195-2d13-531faaab562e	OM	OMN	512	Oman 	Oman	\N
00040000-55fa-9195-6234-7ecb883c77fa	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-55fa-9195-4a71-174b4ce7fe22	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-55fa-9195-8670-f7f0e3147495	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-55fa-9195-40c8-e99837778188	PA	PAN	591	Panama 	Panama	\N
00040000-55fa-9195-3a3b-e3fd0666c4e8	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-55fa-9195-de58-86a84e3e72d9	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-55fa-9195-706d-75fccaff44b7	PE	PER	604	Peru 	Peru	\N
00040000-55fa-9195-b127-51b1c1e7ea6a	PH	PHL	608	Philippines 	Filipini	\N
00040000-55fa-9195-b9c2-57954f367b28	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-55fa-9195-6667-0a0191f2e6ab	PL	POL	616	Poland 	Poljska	\N
00040000-55fa-9195-3346-6bac83ba0d5a	PT	PRT	620	Portugal 	Portugalska	\N
00040000-55fa-9195-8873-fcd024e9d7b1	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-55fa-9195-57e0-7cd804f533c4	QA	QAT	634	Qatar 	Katar	\N
00040000-55fa-9195-bd7a-0bf59ef82d20	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-55fa-9195-0acc-2baa13b9dac5	RO	ROU	642	Romania 	Romunija	\N
00040000-55fa-9195-26f8-953021180577	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-55fa-9195-2ca1-a515fbfd3d71	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-55fa-9195-f22d-d75a7219da91	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-55fa-9195-fad0-f646fa4726d3	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-55fa-9195-3731-994f3599d29a	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-55fa-9195-221a-b2d9a112e14b	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-55fa-9195-5cbe-70fb84310836	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-55fa-9195-db49-43a37e71caf5	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-55fa-9195-1746-29ae5b0dde5c	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-55fa-9195-ce6b-0827468ab41e	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-55fa-9195-3bdf-1f9429d3b92e	SM	SMR	674	San Marino 	San Marino	\N
00040000-55fa-9195-5434-30e5ac2e0390	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-55fa-9195-50f7-22ccc60add5a	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-55fa-9195-a78a-7679ce5dbf41	SN	SEN	686	Senegal 	Senegal	\N
00040000-55fa-9195-93c4-163f7807c52d	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-55fa-9195-2e09-42fc949a5d57	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-55fa-9195-0d9b-27d2050a39fd	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-55fa-9195-6d9c-c40a314ef939	SG	SGP	702	Singapore 	Singapur	\N
00040000-55fa-9195-533f-f903d9aecf1e	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-55fa-9195-4dbf-641bbeaf6df2	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-55fa-9195-2560-b72a1a454e65	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-55fa-9195-9c61-05d32ca43e79	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-55fa-9195-27c2-de686a8f0536	SO	SOM	706	Somalia 	Somalija	\N
00040000-55fa-9195-e0a2-2c780774b92f	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-55fa-9195-e851-9c77ec1fc221	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-55fa-9195-a85e-51d383c90fa5	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-55fa-9195-2140-ef541b2aed86	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-55fa-9195-d6c6-191a17d2c6be	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-55fa-9195-43f3-42c183c6eaf4	SD	SDN	729	Sudan 	Sudan	\N
00040000-55fa-9195-d384-7d29fc72af25	SR	SUR	740	Suriname 	Surinam	\N
00040000-55fa-9195-f1a0-4051f72be9ea	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-55fa-9195-011d-e27ee68466d9	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-55fa-9195-815f-f840b09f2638	SE	SWE	752	Sweden 	Švedska	\N
00040000-55fa-9195-8872-fc8d00169dc4	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-55fa-9195-39bc-0d831ef6c4e0	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-55fa-9195-15fd-da5fd4d19158	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-55fa-9195-683e-378878075f4a	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-55fa-9195-468e-fd428428c679	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-55fa-9195-af9c-6e5f910b6db2	TH	THA	764	Thailand 	Tajska	\N
00040000-55fa-9195-41eb-4ecd449c16c9	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-55fa-9195-4a7d-3e36126d5bf5	TG	TGO	768	Togo 	Togo	\N
00040000-55fa-9195-4172-4fc7e05af3ae	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-55fa-9195-0964-375c7973424d	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-55fa-9195-5d45-ace4df797cb0	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-55fa-9195-b22f-403053feb427	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-55fa-9195-081f-f40646a97296	TR	TUR	792	Turkey 	Turčija	\N
00040000-55fa-9195-40d3-9c48c0db327f	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-55fa-9195-9f8b-53a05a33d435	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-55fa-9195-bf3c-45a8e9d7ce49	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-55fa-9195-42aa-eaebb777c62a	UG	UGA	800	Uganda 	Uganda	\N
00040000-55fa-9195-afa7-3307360f16f5	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-55fa-9195-be9e-568e7fd9cba5	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-55fa-9195-8946-eeeeed762ea3	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-55fa-9195-4659-0f36b1992ac9	US	USA	840	United States 	Združene države Amerike	\N
00040000-55fa-9195-2d42-e25fd9034bf8	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-55fa-9195-c6ff-583f9feb2809	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-55fa-9195-64f3-c61a5e80b405	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-55fa-9195-0aa8-90561d3b19db	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-55fa-9195-d099-18a052d0eeb7	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-55fa-9195-f1a0-c2eb24782320	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-55fa-9195-6cb5-466b28c78336	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-55fa-9195-4428-12b05ce32d60	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-55fa-9195-9bc7-2257d47cc31d	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-55fa-9195-f76a-7321b5998485	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-55fa-9195-57a3-487747ca6620	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-55fa-9195-fd08-bd8b84d24342	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-55fa-9195-99a3-e4241756ee22	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 2981 (class 0 OID 19924150)
-- Dependencies: 227
-- Data for Name: enotaprograma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY enotaprograma (id, uprizoritev_id, program_dela_id, gostitelj_id, celotnavrednost, nasdelez, celotnavrednostmat, celotnavrednostgostovsz, zaproseno, lastnasredstva, avtorskihonorarji, avtorskihonorarjisamoz, tantieme, avtorskepravice, materialni, imakoprodukcije, vlozekgostitelja, drugijavni, stzaposlenih, stzaposumet, stzaposdrug, sthonorarnih, sthonorarnihigr, sthonorarnihigrtujjz, sthonorarnihigrsamoz, obiskdoma, obiskkopr, obiskgost, obiskzamejo, obiskint, obiskkoprint, ponovidoma, ponovikopr, ponovizamejo, ponovigost, ponovikoprint, ponoviint, naziv, kpe, sort, tipprogramskeenote_id, tip, prikoproducentu, strosekodkpred, stroskiostali, krajgostovanja, ustanova, datumgostovanja, transportnistroski, dnevprvzad, drzavagostovanja_id, stpe, zvrst, stpredstav, stokroglihmiz, stpredstavitev, stdelavnic, stdrugidogodki, stprodukcij, caspriprave, casizvedbe, prizorisca, umetvodja, programskotelo, sttujihselektorjev) FROM stdin;
002f0000-55fa-9197-f3b2-f78a91e39c77	000e0000-55fa-9197-12f5-5672d9757abe	\N	\N	9000.30	9000.30	9000.30	0.00	3600.12	5299.98	4000.40	1000.40	200.20	200.30	4599.40	\N	0.00	100.20	0	2	2	2	2	2	\N	40	0	0	0	0	0	1	0	0	0	0	0		0.00	\N	002b0000-55fa-9195-da37-9f78260e4230	premiera	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-55fa-9197-f377-70c333082730	000e0000-55fa-9197-8c3a-c7ae0414a57d	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	\N	60	0	0	0	0	0	1	0	0	0	0	0		0.00	\N	002b0000-55fa-9195-69aa-ce8c3fe4fe20	premiera	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-55fa-9197-2ae5-7b02ebdabfc9	000e0000-55fa-9197-b365-92ea5a43a2c1	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	\N	60	0	0	0	0	0	1	0	0	0	0	0		0.00	\N	002b0000-55fa-9195-da37-9f78260e4230	premiera	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-55fa-9197-db05-62712d59d744	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-54.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	54.20	5	0	0	3	0	0	\N	22	0	0	0	0	0	0	0	0	0	0	0	Urejanje portala	0.00	10	\N	razno	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-55fa-9197-acda-9b2ac858ebbc	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-31.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	31.20	5	0	0	3	0	0	\N	202	0	0	0	0	0	0	0	0	0	0	0	Delavnice otroci	0.00	8	\N	razno	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 2967 (class 0 OID 19923960)
-- Dependencies: 213
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, podrocje, vodjaekipe, naziv, komentar, velikost, pomembna, sort, seplanira, dovoliprekrivanje, maxprekrivanj, tipfunkcije_id) FROM stdin;
000d0000-55fa-9197-19fa-631236497d53	000e0000-55fa-9197-8c3a-c7ae0414a57d	000c0000-55fa-9197-668f-569c1a935f79	igralec	\N	Tezej	glavna vloga	velika	t	5	t	t	\N	000f0000-55fa-9195-4275-3805219d30fb
000d0000-55fa-9197-ebed-bd3476845477	000e0000-55fa-9197-8c3a-c7ae0414a57d	000c0000-55fa-9197-b7a2-26597b9df1d9	umetnik	\N	Režija		velika	t	8	t	t	\N	000f0000-55fa-9195-ef52-dcdcdc87717f
000d0000-55fa-9197-e88f-d1d003e8ab85	000e0000-55fa-9197-8c3a-c7ae0414a57d	000c0000-55fa-9197-c96a-f863c1637ad6	inspicient	t	Inšpicient			t	8	t	t	\N	000f0000-55fa-9195-8966-bd523377d949
000d0000-55fa-9197-b60d-7ac3dc48d221	000e0000-55fa-9197-8c3a-c7ae0414a57d	000c0000-55fa-9197-e3bf-aa75eeae9989	tehnik	t	Tehnični vodja			t	8	t	t	\N	000f0000-55fa-9195-7b6c-e15dd9445275
000d0000-55fa-9197-fc16-11be06310663	000e0000-55fa-9197-8c3a-c7ae0414a57d	000c0000-55fa-9197-6dc6-d70543bfbe87	tehnik	\N	Razsvetljava			t	3	t	t	\N	000f0000-55fa-9195-7b6c-e15dd9445275
000d0000-55fa-9197-35d4-950aca62d2b0	000e0000-55fa-9197-8c3a-c7ae0414a57d	000c0000-55fa-9197-b866-00ffd70ac8ba	igralec	\N	Helena	glavna vloga	velika	t	5	t	t	\N	000f0000-55fa-9195-4275-3805219d30fb
000d0000-55fa-9197-477d-07fecfd918d6	000e0000-55fa-9197-8c3a-c7ae0414a57d	000c0000-55fa-9197-0e34-7e21d6d32f7b	igralec	\N	Hipolita	glavna vloga	velika	t	6	t	t	\N	000f0000-55fa-9195-4275-3805219d30fb
000d0000-55fa-9197-8e1b-66a70d608544	000e0000-55fa-9197-8c3a-c7ae0414a57d	000c0000-55fa-9197-e5cd-14a7222d9c1a	umetnik	\N	Lektoriranje			t	22	t	t	\N	000f0000-55fa-9195-f762-c8cc3619b6e4
000d0000-55fa-9197-2540-25cf31dd08d4	000e0000-55fa-9197-8c3a-c7ae0414a57d	000c0000-55fa-9197-97b3-c74739c3f132	umetnik	\N	Avtor	Avtor besedila		t	2	t	f	\N	000f0000-55fa-9195-13dd-d0b2a1417876
\.


--
-- TOC entry 2947 (class 0 OID 19923775)
-- Dependencies: 193
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta, zamejstvo, kraj) FROM stdin;
\.


--
-- TOC entry 2945 (class 0 OID 19923753)
-- Dependencies: 191
-- Data for Name: kontaktnaoseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kontaktnaoseba (id, popa_id, oseba_id, status, funkcija, opis) FROM stdin;
00260000-55fa-9197-d139-c0e20077d950	00080000-55fa-9197-5016-04b13dcb418b	00090000-55fa-9197-2477-10d1d339769b	AK		igralka
\.


--
-- TOC entry 2956 (class 0 OID 19923874)
-- Dependencies: 202
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 2992 (class 0 OID 19924357)
-- Dependencies: 238
-- Data for Name: mapa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa (id, lastnik_id, parent_id, ime, komentar, caskreiranja, casspremembe, javnidostop, upor, datknj) FROM stdin;
\.


--
-- TOC entry 2993 (class 0 OID 19924369)
-- Dependencies: 239
-- Data for Name: mapa_zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa_zapis (mapa_id, zapis_id) FROM stdin;
\.


--
-- TOC entry 2995 (class 0 OID 19924391)
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
-- TOC entry 2960 (class 0 OID 19923899)
-- Dependencies: 206
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 2942 (class 0 OID 19923710)
-- Dependencies: 188
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-55fa-9196-4e46-a1bc7e94ad14	popa.stakli	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-55fa-9196-942c-37511a06e49b	oseba.spol	array	a:2:{s:1:"M";a:1:{s:5:"label";s:6:"Moški";}s:1:"Z";a:1:{s:5:"label";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-55fa-9196-f0d1-38cec5fcc218	telefonska.vrsta	array	a:3:{s:7:"mobilna";a:1:{s:5:"label";s:7:"Mobilni";}s:6:"domaca";a:1:{s:5:"label";s:6:"Domač";}s:6:"fiksna";a:1:{s:5:"label";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-55fa-9196-ab4a-d2a501682d90	kontaktnaoseba.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status kontaktne osebe
00000000-55fa-9196-1847-da206915b02d	dogodek.status	array	a:7:{s:4:"100s";a:1:{s:5:"label";s:11:"Dolgoročno";}s:4:"200s";a:1:{s:5:"label";s:9:"Planirano";}s:4:"300s";a:1:{s:5:"label";s:8:"Fiksiran";}s:4:"400s";a:1:{s:5:"label";s:17:"Potrjen - interno";}s:4:"500s";a:1:{s:5:"label";s:15:"Potrjen - javno";}s:4:"600s";a:1:{s:5:"label";s:10:"Zaključen";}s:4:"700s";a:1:{s:5:"label";s:7:"Obdelan";}}	f	t	t	\N	Tabela statusa dogodkov
00000000-55fa-9196-7733-f3e0fad543da	dogodek.razred	array	a:5:{s:4:"100s";a:2:{s:5:"label";s:9:"Predstava";s:4:"type";s:9:"predstava";}s:4:"200s";a:2:{s:5:"label";s:4:"Vaja";s:4:"type";s:4:"vaja";}s:4:"300s";a:2:{s:5:"label";s:10:"Gostovanje";s:4:"type";s:10:"gostovanje";}s:4:"400s";a:2:{s:5:"label";s:16:"Splošni dogodek";s:4:"type";s:8:"splošni";}s:4:"500s";a:2:{s:5:"label";s:10:"Zasedenost";s:4:"type";s:10:"zasedenost";}}	f	t	t	\N	Tabela razredov dogodkov, ki jih aplikacija podpira
00000000-55fa-9196-8306-51bb8efb6aed	uprizoritev.faza	array	a:6:{s:20:"predprodukcija-ideja";a:1:{s:5:"label";s:16:"Dolgoročni plan";}s:20:"predprodukcija-poziv";a:1:{s:5:"label";s:29:"Predprodukcija, v fazi poziva";}s:30:"predprodukcija-potrjen_program";a:1:{s:5:"label";s:34:"Predprodukcija, program je potrjen";}s:10:"produkcija";a:1:{s:5:"label";s:10:"Produkcija";}s:14:"postprodukcija";a:1:{s:5:"label";s:14:"Postprodukcija";}s:5:"arhiv";a:1:{s:5:"label";s:10:"Arhivirana";}}	f	t	f	\N	Faza uprizoritve
00000000-55fa-9196-30ec-0adddd185d46	funkcija.podrocje	array	a:4:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}}	f	t	f	\N	Področje funkcije
00000000-55fa-9196-d528-b2cc9ab0f854	tipfunkcije.podrocje	array	a:4:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}}	f	t	f	\N	Področje funkcije
00000000-55fa-9196-85f6-b0c8d168e32c	funkcija.velikost	array	a:4:{s:7:"stataza";a:1:{s:5:"label";s:8:"Stataža";}s:4:"mala";a:1:{s:5:"label";s:21:"Mala vloga / funkcija";}s:7:"srednja";a:1:{s:5:"label";s:24:"Srednja vloga / funkcija";}s:6:"velika";a:1:{s:5:"label";s:23:"Velika vloga / funkcija";}}	f	t	f	\N	Velikost funkcije
00000000-55fa-9196-8014-c111370930fd	zaposlitev.status	array	a:2:{s:1:"A";a:1:{s:5:"label";s:7:"Aktivna";}s:1:"N";a:1:{s:5:"label";s:9:"Neaktivna";}}	f	t	f	\N	Status zaposlitve
00000000-55fa-9196-c6bd-403643bf0fb1	produkcijskahisa.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktivna";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktivna";}}	f	t	f	\N	Status produkcijske hiše
00000000-55fa-9196-e342-f0616415890c	strosekuprizoritve.tipstroska	array	a:2:{s:10:"materialni";a:1:{s:5:"label";s:19:"Materialni strošek";}s:9:"avtorprav";a:1:{s:5:"label";s:32:"Strošek odkupa avtorskih pravic";}}	f	t	f	\N	Tip stroška
00000000-55fa-9196-ac2f-3bb3441b1a54	fsacl.dostop	array	a:4:{s:1:"X";a:1:{s:5:"label";s:12:"Brez dostopa";}s:1:"R";a:1:{s:5:"label";s:11:"Samo branje";}s:2:"RW";a:1:{s:5:"label";s:17:"Branje in pisanje";}s:3:"RWD";a:1:{s:5:"label";s:26:"Branje pisanje in brisanje";}}	f	t	f	\N	ACL Javni dostop
00000000-55fa-9197-8e8f-ca4485ac855b	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-55fa-9197-1de3-7af7ccb2c873	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-55fa-9197-3069-57ad25d04b8a	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-55fa-9197-d371-92398ce02b75	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-55fa-9197-6e7f-76dedae9f1d4	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
00000000-55fa-9198-f485-a0f0f05eea65	application.tenant.maticnopodjetje	string	s:4:"1001";	f	t	f		Šifra matičnega podjetja v Popa in ProdukcijskaHisa
\.


--
-- TOC entry 2936 (class 0 OID 19923624)
-- Dependencies: 182
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-55fa-9197-5575-78422c7f9e03	00000000-55fa-9197-8e8f-ca4485ac855b	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-55fa-9197-e032-8fd1bec0672e	00000000-55fa-9197-8e8f-ca4485ac855b	00010000-55fa-9196-5d44-c29762855ac5	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-55fa-9197-6788-f81d8ab14139	00000000-55fa-9197-1de3-7af7ccb2c873	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 2937 (class 0 OID 19923635)
-- Dependencies: 183
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naslov_id, sifra, naziv, ime, priimek, funkcija, srednjeime, polnoime, psevdonim, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
00090000-55fa-9197-f35a-b4f66c9e6f3e	\N	\N	0001	g.	Janez	Novak	a	Peter	Janez Peter Novak	Jani	jani.novak@xxx.xx	1958-01-06	0601958000000	123456789	M	Jani Janez	Slovenija	Slovenija	Ljubljana
00090000-55fa-9197-fc93-40e7c61ea015	00010000-55fa-9197-b50d-25a342966b37	\N	0002	dr.	Anton	Horvat	b		Anton  Horvat	Tona	anton.horvat@xxx.xx	1968-02-12	1202968111111	234567890	M		Slovenija	Slovenija	Maribor
00090000-55fa-9197-76dc-1d2eaa6bc8ee	00010000-55fa-9197-4f06-dc7d488bf86d	\N	0003		Ivan	Kovačič	c		Ivan  Kovačič	Ivo	ivan.kovacic@xxx.xx	1975-03-26	2603976222222	345678901	M		Slovenija	Slovenija	Celje
00090000-55fa-9197-613d-e8b869c72314	00010000-55fa-9197-f409-0d3ad5b9ccd9	\N	0004	prof.	Jožef	Krajnc	d		Jožef  Krajnc	Joža	jozef.krajnc@xxx.xx	1971-04-30	3004971333333	456789012	M		Slovenija	Slovenija	Kranj
00090000-55fa-9197-adf5-6fd816e119f4	\N	\N	0005		Marko	Zupančič	e		Marko  Zupančič		marko.zupancic@xxx.xx	1984-05-07	0705984444444	567890123	M		Slovenija	Slovenija	Koper
00090000-55fa-9197-4da9-91f6fbccd317	\N	\N	0006	ga.	Marija	Kovač	f		Marija  Kovač		marija.kovac@xxx.xx	1962-06-19	1906962444444	678901234	Z		Slovenija	Slovenija	Murska Sobota
00090000-55fa-9197-ec1c-5fb054a7021e	\N	\N	0007	ga.	Ana	Potočnik	g		Ana  Potočnik		ana.potocnik@xxx.xx	1975-07-24	2407975555555	789012345	Z		Slovenija	Slovenija	Novo Mesto
00090000-55fa-9197-c768-f9b91d144670	\N	\N	0008	ga.	Maja	Mlakar	h		Maja  Mlakar		maja.mlakar@xxx.xx	1986-08-02	0208986666666	890123456	Z		Slovenija	Slovenija	Nova Gorica
00090000-55fa-9197-2477-10d1d339769b	00010000-55fa-9197-4c35-ec25012c272c	\N	0009		Irena	Kos	i		Irena  Kos		irena.kos@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Ptuj
00090000-55fa-9197-c038-bc91633aa30d	\N	\N	0010		Mojca	Vidmar	J		Mojca  Vidmar		mojca.vidmar@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Idrija
00090000-55fa-9197-c120-4e56c72f970c	\N	\N	0011		xx	write protected12345	a		xx  write protected12345		xx@xxx.xx	\N	\N	\N	Z		\N	\N	\N
00090000-55fa-9197-5609-c6ce2e20baa0	\N	\N	0012		Luka	Golob	luč	a	Luka a Golob		luka.golob@xxx.xx	\N	\N	\N	M		\N	\N	\N
00090000-55fa-9197-d992-613a3c072cc9	00010000-55fa-9197-18e0-c3cab9912d01	\N	0013		Tatjana	Božič	tajnica	a	Tatjana a Božič		tatjana.bozic@xxx.xx	\N	\N	\N	Z		\N	\N	\N
\.


--
-- TOC entry 2932 (class 0 OID 19923589)
-- Dependencies: 178
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-55fa-9196-1af0-8ba3f3626bd4	Aaa-read	Aaa (User,Role,Permission) - branje	f
00030000-55fa-9196-6d29-c439c08c8d8e	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	f
00030000-55fa-9196-31c2-14fdf2d2d505	TerminStoritve-vse	TerminStoritve - spreminjanje vseh zapisov	f
00030000-55fa-9196-fb96-2139dd10c3ca	Dogodek-readVse	Dogodek - branje vseh, ne glede na status dogodka	f
00030000-55fa-9196-0b3c-a3543064379d	Oseba-vse	Oseba - vse - za testiranje assert	f
00030000-55fa-9196-1181-3f9fe869cd60	ProgramDela-lock	ProgramDela - zaklepanje	f
00030000-55fa-9196-2edc-60134a230111	ProgramDela-unlock	ProgramDela - odklepanje	f
00030000-55fa-9196-a1f8-f32ea26cf645	Abonma-read	Abonma - branje	f
00030000-55fa-9196-c9e9-3283a9f9e2a8	Abonma-write	Abonma - spreminjanje	f
00030000-55fa-9196-7f1b-fe1ca90df41a	Alternacija-read	Alternacija - branje	f
00030000-55fa-9196-c0fd-2f0ba9a6706f	Alternacija-write	Alternacija - spreminjanje	f
00030000-55fa-9196-cb0c-be8fc5be6371	Arhivalija-read	Arhivalija - branje	f
00030000-55fa-9196-0882-561f3f3bec2e	Arhivalija-write	Arhivalija - spreminjanje	f
00030000-55fa-9196-376c-43966caa4cc3	Besedilo-read	Besedilo - branje	f
00030000-55fa-9196-9a81-c0fed5568d67	Besedilo-write	Besedilo - spreminjanje	f
00030000-55fa-9196-ea21-15d889e86f63	DogodekIzven-read	DogodekIzven - branje	f
00030000-55fa-9196-e05c-ebb21f5a4fc0	DogodekIzven-write	DogodekIzven - spreminjanje	f
00030000-55fa-9196-4c42-5ad29a90c931	Dogodek-read	Dogodek - branje	f
00030000-55fa-9196-5fc3-0aecf58e77ae	Dogodek-write	Dogodek - spreminjanje	f
00030000-55fa-9196-8c55-69142335a296	DrugiVir-read	DrugiVir - branje	f
00030000-55fa-9196-27c8-1c12e97b7518	DrugiVir-write	DrugiVir - spreminjanje	f
00030000-55fa-9196-5bc2-3fe8df4ef613	Drzava-read	Drzava - branje	f
00030000-55fa-9196-0f7c-da07e6c1e031	Drzava-write	Drzava - spreminjanje	f
00030000-55fa-9196-50bb-29ffde20a39a	EnotaPrograma-read	EnotaPrograma - branje	f
00030000-55fa-9196-9255-be86d6a17ce0	EnotaPrograma-write	EnotaPrograma - spreminjanje	f
00030000-55fa-9196-94e3-29a14d7675ea	Funkcija-read	Funkcija - branje	f
00030000-55fa-9196-bc0b-5a7f7e13feb7	Funkcija-write	Funkcija - spreminjanje	f
00030000-55fa-9196-566d-db13eb7e8567	Gostovanje-read	Gostovanje - branje	f
00030000-55fa-9196-1f89-166fcd97ff48	Gostovanje-write	Gostovanje - spreminjanje	f
00030000-55fa-9196-b405-e50a6f039c2a	Gostujoca-read	Gostujoca - branje	f
00030000-55fa-9196-e30e-4233dc95c577	Gostujoca-write	Gostujoca - spreminjanje	f
00030000-55fa-9196-923a-cf2140d3bb9c	KontaktnaOseba-read	KontaktnaOseba - branje	f
00030000-55fa-9196-2aff-473f0769397f	KontaktnaOseba-write	KontaktnaOseba - spreminjanje	f
00030000-55fa-9196-872d-fee183fad724	Kupec-read	Kupec - branje	f
00030000-55fa-9196-c6be-5a5fb5a9728a	Kupec-write	Kupec - spreminjanje	f
00030000-55fa-9196-52ca-4bcab74324a6	NacinPlacina-read	NacinPlacina - branje	f
00030000-55fa-9196-04fa-914b12cada0d	NacinPlacina-write	NacinPlacina - spreminjanje	f
00030000-55fa-9196-cc2e-bf881569670c	Option-read	Option - branje	f
00030000-55fa-9196-368e-c913fe41f6ab	Option-write	Option - spreminjanje	f
00030000-55fa-9196-b48e-5260e357d4d8	OptionValue-read	OptionValue - branje	f
00030000-55fa-9196-7f0e-7195116f4b96	OptionValue-write	OptionValue - spreminjanje	f
00030000-55fa-9196-8e85-06a7c205e9fa	Oseba-read	Oseba - branje	f
00030000-55fa-9196-1051-59153d987743	Oseba-write	Oseba - spreminjanje	f
00030000-55fa-9196-ee4c-e9094eb1772e	PlacilniInstrument-read	PlacilniInstrument - branje	f
00030000-55fa-9196-40fd-898b73bba9d4	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	f
00030000-55fa-9196-503e-ff25f026c6b6	PodrocjeSedenja-read	PodrocjeSedenja - branje	f
00030000-55fa-9196-3f47-e7d544d0517e	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	f
00030000-55fa-9196-2fd3-5dc3b3e9c309	Pogodba-read	Pogodba - branje	f
00030000-55fa-9196-7c00-d7965cbacd00	Pogodba-write	Pogodba - spreminjanje	f
00030000-55fa-9196-4ed2-da06790286a2	Popa-read	Popa - branje	f
00030000-55fa-9196-df76-d7c458c1bf77	Popa-write	Popa - spreminjanje	f
00030000-55fa-9196-7030-739d2288f46b	Posta-read	Posta - branje	f
00030000-55fa-9196-8f1a-3b2925bffb77	Posta-write	Posta - spreminjanje	f
00030000-55fa-9196-e301-1341fd5a1438	PostavkaCDve-read	PostavkaCDve - branje	f
00030000-55fa-9196-37e8-4754a7361b9d	PostavkaCDve-write	PostavkaCDve - spreminjanje	f
00030000-55fa-9196-4877-9fc1f5e7692a	PostavkaRacuna-read	PostavkaRacuna - branje	f
00030000-55fa-9196-741f-1cc15e3be5d0	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	f
00030000-55fa-9196-c9ed-7a63e7627cbb	PostniNaslov-read	PostniNaslov - branje	f
00030000-55fa-9196-a3a1-6560004aca60	PostniNaslov-write	PostniNaslov - spreminjanje	f
00030000-55fa-9196-13e4-5ea194914a00	Predstava-read	Predstava - branje	f
00030000-55fa-9196-031f-4761b028c1be	Predstava-write	Predstava - spreminjanje	f
00030000-55fa-9196-5761-37ec782172cb	ProdajaPredstave-read	ProdajaPredstave - branje	f
00030000-55fa-9196-eb57-789d1988ff44	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	f
00030000-55fa-9196-ca90-f4f1715194a9	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	f
00030000-55fa-9196-415f-4f2fb7423ff9	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	f
00030000-55fa-9196-77b7-dbe518825893	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	f
00030000-55fa-9196-102f-46f45a93e71b	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	f
00030000-55fa-9196-cb27-bd5e24c0c94b	ProgramDela-read	ProgramDela - branje	f
00030000-55fa-9196-e7fb-b17fab73ed31	ProgramDela-write	ProgramDela - spreminjanje	f
00030000-55fa-9196-4e39-ebbb2a8a4af1	ProgramFestival-read	ProgramFestival - branje	f
00030000-55fa-9196-180c-1fd1da07df3c	ProgramFestival-write	ProgramFestival - spreminjanje	f
00030000-55fa-9196-98c0-558e39e59a16	ProgramGostovanje-read	ProgramGostovanje - branje	f
00030000-55fa-9196-1862-3a46c01306e9	ProgramGostovanje-write	ProgramGostovanje - spreminjanje	f
00030000-55fa-9196-ebbf-36b31b0c8ae7	ProgramGostujoca-read	ProgramGostujoca - branje	f
00030000-55fa-9196-7118-1e4186903a5d	ProgramGostujoca-write	ProgramGostujoca - spreminjanje	f
00030000-55fa-9196-e3ab-2ca5eca6dbe5	ProgramIzjemni-read	ProgramIzjemni - branje	f
00030000-55fa-9196-66bd-e22782010e12	ProgramIzjemni-write	ProgramIzjemni - spreminjanje	f
00030000-55fa-9196-a5d8-7442ed7d2443	ProgramPonovitevPrejsnjih-read	ProgramPonovitevPrejsnjih - branje	f
00030000-55fa-9196-ac7a-09efada65202	ProgramPonovitevPrejsnjih-write	ProgramPonovitevPrejsnjih - spreminjanje	f
00030000-55fa-9196-ec0c-3b3663bebb44	ProgramPonovitevPremiere-read	ProgramPonovitevPremiere - branje	f
00030000-55fa-9196-cd6a-68a73ae4a011	ProgramPonovitevPremiere-write	ProgramPonovitevPremiere - spreminjanje	f
00030000-55fa-9196-5747-cc0fd10970e1	ProgramPremiera-read	ProgramPremiera - branje	f
00030000-55fa-9196-f955-c0d556110b21	ProgramPremiera-write	ProgramPremiera - spreminjanje	f
00030000-55fa-9196-1114-99e6e6a890fb	ProgramRazno-read	ProgramRazno - branje	f
00030000-55fa-9196-be0b-5d6a370d4fb8	ProgramRazno-write	ProgramRazno - spreminjanje	f
00030000-55fa-9196-e2eb-d4986cbbb84b	ProgramskaEnotaSklopa-read	ProgramskaEnotaSklopa - branje	f
00030000-55fa-9196-8e7c-c1957f126e80	ProgramskaEnotaSklopa-write	ProgramskaEnotaSklopa - spreminjanje	f
00030000-55fa-9196-cea0-558e78931979	Prostor-read	Prostor - branje	f
00030000-55fa-9196-29cd-922af80dab5c	Prostor-write	Prostor - spreminjanje	f
00030000-55fa-9196-06a9-341d37a7daa8	Racun-read	Racun - branje	f
00030000-55fa-9196-0593-9af161c1310c	Racun-write	Racun - spreminjanje	f
00030000-55fa-9196-e5b1-9b624428caa0	RazpisanSedez-read	RazpisanSedez - branje	f
00030000-55fa-9196-8568-f613fa5cb159	RazpisanSedez-write	RazpisanSedez - spreminjanje	f
00030000-55fa-9196-b356-f591cdc1a7fd	Rekviziterstvo-read	Rekviziterstvo - branje	f
00030000-55fa-9196-737a-d735e9856de5	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	f
00030000-55fa-9196-9595-e6147f1f1b93	Rekvizit-read	Rekvizit - branje	f
00030000-55fa-9196-d921-b248882b7160	Rekvizit-write	Rekvizit - spreminjanje	f
00030000-55fa-9196-0836-6954c2260f31	Revizija-read	Revizija - branje	f
00030000-55fa-9196-ff59-f31fb02bf5d1	Revizija-write	Revizija - spreminjanje	f
00030000-55fa-9196-6b4d-07cf10792eb7	Rezervacija-read	Rezervacija - branje	f
00030000-55fa-9196-9074-ac316fb43af7	Rezervacija-write	Rezervacija - spreminjanje	f
00030000-55fa-9196-ed59-239b9cf888e4	SedezniRed-read	SedezniRed - branje	f
00030000-55fa-9196-6a8e-8a477de0f265	SedezniRed-write	SedezniRed - spreminjanje	f
00030000-55fa-9196-22a9-891a4bff8fe2	Sedez-read	Sedez - branje	f
00030000-55fa-9196-fb89-5397c5d136f5	Sedez-write	Sedez - spreminjanje	f
00030000-55fa-9196-b785-6b9073c01745	Sezona-read	Sezona - branje	f
00030000-55fa-9196-7350-3e9219576085	Sezona-write	Sezona - spreminjanje	f
00030000-55fa-9196-fdf4-1462cde80989	StevilcenjeKonfig-read	StevilcenjeKonfig - branje	f
00030000-55fa-9196-acc5-5ee1cad2eee3	StevilcenjeKonfig-write	StevilcenjeKonfig - spreminjanje	f
00030000-55fa-9196-b4fa-5e24990d7946	Stevilcenje-read	Stevilcenje - branje	f
00030000-55fa-9196-e512-bae705dcca1b	Stevilcenje-write	Stevilcenje - spreminjanje	f
00030000-55fa-9196-23d9-e6898d0d4051	StevilcenjeStanje-read	StevilcenjeStanje - branje	f
00030000-55fa-9196-2dc5-25bdef5cdaf0	StevilcenjeStanje-write	StevilcenjeStanje - spreminjanje	f
00030000-55fa-9196-b7c3-e621ed6e2e79	StrosekUprizoritve-read	StrosekUprizoritve - branje	f
00030000-55fa-9196-fe23-16bb6def55cb	StrosekUprizoritve-write	StrosekUprizoritve - spreminjanje	f
00030000-55fa-9196-347c-0a3cc8eb67ac	Telefonska-read	Telefonska - branje	f
00030000-55fa-9196-c869-f72f72a40e34	Telefonska-write	Telefonska - spreminjanje	f
00030000-55fa-9196-78be-0a036a0941a7	TerminStoritve-read	TerminStoritve - branje	f
00030000-55fa-9196-3061-8f628406bd8b	TerminStoritve-write	TerminStoritve - spreminjanje	f
00030000-55fa-9196-4652-1645026c330f	TipFunkcije-read	TipFunkcije - branje	f
00030000-55fa-9196-23b4-cb2e612ee49f	TipFunkcije-write	TipFunkcije - spreminjanje	f
00030000-55fa-9196-bf5a-7ba0dcb8e6ff	TipProgramskeEnote-read	TipProgramskeEnote - branje	f
00030000-55fa-9196-d97a-bcb3df005cee	TipProgramskeEnote-write	TipProgramskeEnote - spreminjanje	f
00030000-55fa-9196-31ce-d587dc7a5f99	Trr-read	Trr - branje	f
00030000-55fa-9196-7819-a9f341214b9c	Trr-write	Trr - spreminjanje	f
00030000-55fa-9196-5340-85dd352f8aa2	Uprizoritev-read	Uprizoritev - branje	f
00030000-55fa-9196-e87b-e29a8243a735	Uprizoritev-write	Uprizoritev - spreminjanje	f
00030000-55fa-9196-f2b9-6759ed7ceaee	Vaja-read	Vaja - branje	f
00030000-55fa-9196-325f-19571676b979	Vaja-write	Vaja - spreminjanje	f
00030000-55fa-9196-31e5-2e4285b694b2	VrstaSedezev-read	VrstaSedezev - branje	f
00030000-55fa-9196-2bfc-814442d7b603	VrstaSedezev-write	VrstaSedezev - spreminjanje	f
00030000-55fa-9196-2467-2e2965fad418	VrstaStroska-read	VrstaStroska - branje	f
00030000-55fa-9196-1e77-44ceb2d317da	VrstaStroska-write	VrstaStroska - spreminjanje	f
00030000-55fa-9196-6a41-a38f4ec490a2	Zaposlitev-read	Zaposlitev - branje	f
00030000-55fa-9196-520c-a33593ef3713	Zaposlitev-write	Zaposlitev - spreminjanje	f
00030000-55fa-9196-a58c-f92c41805c64	Zasedenost-read	Zasedenost - branje	f
00030000-55fa-9196-057d-22eda081798b	Zasedenost-write	Zasedenost - spreminjanje	f
00030000-55fa-9196-ecae-e41e75bd64eb	ZvrstSurs-read	ZvrstSurs - branje	f
00030000-55fa-9196-ec8c-6c93e3a82f25	ZvrstSurs-write	ZvrstSurs - spreminjanje	f
00030000-55fa-9196-f5e5-b17eb736205a	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	f
00030000-55fa-9196-6a45-669a054588ff	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	f
00030000-55fa-9196-6f49-3ccef6ac32ae	Mapa-write	Mapa - osnovno dovoljenje za pisanje	f
00030000-55fa-9196-fda8-750d34fac19c	Mapa-read	Mapa - osnovno dovoljenje za branje	f
00030000-55fa-9196-a2b8-269e920961e0	MapaAcl-write	MapaAcl - dovoljenje za dostop pisanje ACL-jev mape	f
00030000-55fa-9196-12a1-7c5574262866	MapaAcl-read	MapaAcl - dovoljenje za dostop branje ACL-jev mape	f
00030000-55fa-9196-e634-bfbcb3def2e2	Zapis-write	Zapis - dovoljenje za pisanje zapisov	f
00030000-55fa-9196-95d9-f3c26943a34e	Zapis-read	Zapis - dovoljenje za pisanje zapisov	f
00030000-55fa-9196-0cc1-28dcf1cfed3b	ZapisLastnik-write	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	f
00030000-55fa-9196-832e-222de69fa91e	ZapisLastnik-read	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	f
00030000-55fa-9196-3207-e048056fe630	VrstaZapisa-write	Šifrant vrst zapisa - spreminjanje	f
00030000-55fa-9196-978d-edc2a9a9ce35	VrstaZapisa-read	Šifrant vrst zapisa - branje	f
00030000-55fa-9196-f443-7d23ac2fee81	Datoteka-write	Datoteka - spreminjanje	f
00030000-55fa-9196-4087-ee8c0da52a6d	Datoteka-read	Datoteke - branje	f
\.


--
-- TOC entry 2934 (class 0 OID 19923608)
-- Dependencies: 180
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-55fa-9196-7d8b-93ee3dc7436a	00030000-55fa-9196-6d29-c439c08c8d8e
00020000-55fa-9196-7cd5-9b03f99b84df	00030000-55fa-9196-5bc2-3fe8df4ef613
00020000-55fa-9196-c932-8ac46a178ef6	00030000-55fa-9196-a1f8-f32ea26cf645
00020000-55fa-9196-c932-8ac46a178ef6	00030000-55fa-9196-c9e9-3283a9f9e2a8
00020000-55fa-9196-c932-8ac46a178ef6	00030000-55fa-9196-7f1b-fe1ca90df41a
00020000-55fa-9196-c932-8ac46a178ef6	00030000-55fa-9196-c0fd-2f0ba9a6706f
00020000-55fa-9196-c932-8ac46a178ef6	00030000-55fa-9196-cb0c-be8fc5be6371
00020000-55fa-9196-c932-8ac46a178ef6	00030000-55fa-9196-4c42-5ad29a90c931
00020000-55fa-9196-c932-8ac46a178ef6	00030000-55fa-9196-fb96-2139dd10c3ca
00020000-55fa-9196-c932-8ac46a178ef6	00030000-55fa-9196-5fc3-0aecf58e77ae
00020000-55fa-9196-c932-8ac46a178ef6	00030000-55fa-9196-5bc2-3fe8df4ef613
00020000-55fa-9196-c932-8ac46a178ef6	00030000-55fa-9196-0f7c-da07e6c1e031
00020000-55fa-9196-c932-8ac46a178ef6	00030000-55fa-9196-94e3-29a14d7675ea
00020000-55fa-9196-c932-8ac46a178ef6	00030000-55fa-9196-bc0b-5a7f7e13feb7
00020000-55fa-9196-c932-8ac46a178ef6	00030000-55fa-9196-566d-db13eb7e8567
00020000-55fa-9196-c932-8ac46a178ef6	00030000-55fa-9196-1f89-166fcd97ff48
00020000-55fa-9196-c932-8ac46a178ef6	00030000-55fa-9196-b405-e50a6f039c2a
00020000-55fa-9196-c932-8ac46a178ef6	00030000-55fa-9196-e30e-4233dc95c577
00020000-55fa-9196-c932-8ac46a178ef6	00030000-55fa-9196-923a-cf2140d3bb9c
00020000-55fa-9196-c932-8ac46a178ef6	00030000-55fa-9196-2aff-473f0769397f
00020000-55fa-9196-c932-8ac46a178ef6	00030000-55fa-9196-cc2e-bf881569670c
00020000-55fa-9196-c932-8ac46a178ef6	00030000-55fa-9196-b48e-5260e357d4d8
00020000-55fa-9196-c932-8ac46a178ef6	00030000-55fa-9196-8e85-06a7c205e9fa
00020000-55fa-9196-c932-8ac46a178ef6	00030000-55fa-9196-1051-59153d987743
00020000-55fa-9196-c932-8ac46a178ef6	00030000-55fa-9196-4ed2-da06790286a2
00020000-55fa-9196-c932-8ac46a178ef6	00030000-55fa-9196-df76-d7c458c1bf77
00020000-55fa-9196-c932-8ac46a178ef6	00030000-55fa-9196-7030-739d2288f46b
00020000-55fa-9196-c932-8ac46a178ef6	00030000-55fa-9196-8f1a-3b2925bffb77
00020000-55fa-9196-c932-8ac46a178ef6	00030000-55fa-9196-c9ed-7a63e7627cbb
00020000-55fa-9196-c932-8ac46a178ef6	00030000-55fa-9196-a3a1-6560004aca60
00020000-55fa-9196-c932-8ac46a178ef6	00030000-55fa-9196-13e4-5ea194914a00
00020000-55fa-9196-c932-8ac46a178ef6	00030000-55fa-9196-031f-4761b028c1be
00020000-55fa-9196-c932-8ac46a178ef6	00030000-55fa-9196-77b7-dbe518825893
00020000-55fa-9196-c932-8ac46a178ef6	00030000-55fa-9196-102f-46f45a93e71b
00020000-55fa-9196-c932-8ac46a178ef6	00030000-55fa-9196-cea0-558e78931979
00020000-55fa-9196-c932-8ac46a178ef6	00030000-55fa-9196-29cd-922af80dab5c
00020000-55fa-9196-c932-8ac46a178ef6	00030000-55fa-9196-b356-f591cdc1a7fd
00020000-55fa-9196-c932-8ac46a178ef6	00030000-55fa-9196-737a-d735e9856de5
00020000-55fa-9196-c932-8ac46a178ef6	00030000-55fa-9196-9595-e6147f1f1b93
00020000-55fa-9196-c932-8ac46a178ef6	00030000-55fa-9196-d921-b248882b7160
00020000-55fa-9196-c932-8ac46a178ef6	00030000-55fa-9196-b785-6b9073c01745
00020000-55fa-9196-c932-8ac46a178ef6	00030000-55fa-9196-7350-3e9219576085
00020000-55fa-9196-c932-8ac46a178ef6	00030000-55fa-9196-4652-1645026c330f
00020000-55fa-9196-c932-8ac46a178ef6	00030000-55fa-9196-5340-85dd352f8aa2
00020000-55fa-9196-c932-8ac46a178ef6	00030000-55fa-9196-e87b-e29a8243a735
00020000-55fa-9196-c932-8ac46a178ef6	00030000-55fa-9196-f2b9-6759ed7ceaee
00020000-55fa-9196-c932-8ac46a178ef6	00030000-55fa-9196-325f-19571676b979
00020000-55fa-9196-c932-8ac46a178ef6	00030000-55fa-9196-a58c-f92c41805c64
00020000-55fa-9196-c932-8ac46a178ef6	00030000-55fa-9196-057d-22eda081798b
00020000-55fa-9196-c932-8ac46a178ef6	00030000-55fa-9196-ecae-e41e75bd64eb
00020000-55fa-9196-c932-8ac46a178ef6	00030000-55fa-9196-f5e5-b17eb736205a
00020000-55fa-9196-f47e-332e452952a4	00030000-55fa-9196-a1f8-f32ea26cf645
00020000-55fa-9196-f47e-332e452952a4	00030000-55fa-9196-cb0c-be8fc5be6371
00020000-55fa-9196-f47e-332e452952a4	00030000-55fa-9196-4c42-5ad29a90c931
00020000-55fa-9196-f47e-332e452952a4	00030000-55fa-9196-5bc2-3fe8df4ef613
00020000-55fa-9196-f47e-332e452952a4	00030000-55fa-9196-566d-db13eb7e8567
00020000-55fa-9196-f47e-332e452952a4	00030000-55fa-9196-b405-e50a6f039c2a
00020000-55fa-9196-f47e-332e452952a4	00030000-55fa-9196-923a-cf2140d3bb9c
00020000-55fa-9196-f47e-332e452952a4	00030000-55fa-9196-2aff-473f0769397f
00020000-55fa-9196-f47e-332e452952a4	00030000-55fa-9196-cc2e-bf881569670c
00020000-55fa-9196-f47e-332e452952a4	00030000-55fa-9196-b48e-5260e357d4d8
00020000-55fa-9196-f47e-332e452952a4	00030000-55fa-9196-8e85-06a7c205e9fa
00020000-55fa-9196-f47e-332e452952a4	00030000-55fa-9196-1051-59153d987743
00020000-55fa-9196-f47e-332e452952a4	00030000-55fa-9196-4ed2-da06790286a2
00020000-55fa-9196-f47e-332e452952a4	00030000-55fa-9196-7030-739d2288f46b
00020000-55fa-9196-f47e-332e452952a4	00030000-55fa-9196-c9ed-7a63e7627cbb
00020000-55fa-9196-f47e-332e452952a4	00030000-55fa-9196-a3a1-6560004aca60
00020000-55fa-9196-f47e-332e452952a4	00030000-55fa-9196-13e4-5ea194914a00
00020000-55fa-9196-f47e-332e452952a4	00030000-55fa-9196-cea0-558e78931979
00020000-55fa-9196-f47e-332e452952a4	00030000-55fa-9196-b356-f591cdc1a7fd
00020000-55fa-9196-f47e-332e452952a4	00030000-55fa-9196-9595-e6147f1f1b93
00020000-55fa-9196-f47e-332e452952a4	00030000-55fa-9196-b785-6b9073c01745
00020000-55fa-9196-f47e-332e452952a4	00030000-55fa-9196-347c-0a3cc8eb67ac
00020000-55fa-9196-f47e-332e452952a4	00030000-55fa-9196-c869-f72f72a40e34
00020000-55fa-9196-f47e-332e452952a4	00030000-55fa-9196-31ce-d587dc7a5f99
00020000-55fa-9196-f47e-332e452952a4	00030000-55fa-9196-7819-a9f341214b9c
00020000-55fa-9196-f47e-332e452952a4	00030000-55fa-9196-6a41-a38f4ec490a2
00020000-55fa-9196-f47e-332e452952a4	00030000-55fa-9196-520c-a33593ef3713
00020000-55fa-9196-f47e-332e452952a4	00030000-55fa-9196-ecae-e41e75bd64eb
00020000-55fa-9196-f47e-332e452952a4	00030000-55fa-9196-f5e5-b17eb736205a
00020000-55fa-9196-bf2c-07a336b1dcb6	00030000-55fa-9196-a1f8-f32ea26cf645
00020000-55fa-9196-bf2c-07a336b1dcb6	00030000-55fa-9196-7f1b-fe1ca90df41a
00020000-55fa-9196-bf2c-07a336b1dcb6	00030000-55fa-9196-cb0c-be8fc5be6371
00020000-55fa-9196-bf2c-07a336b1dcb6	00030000-55fa-9196-0882-561f3f3bec2e
00020000-55fa-9196-bf2c-07a336b1dcb6	00030000-55fa-9196-376c-43966caa4cc3
00020000-55fa-9196-bf2c-07a336b1dcb6	00030000-55fa-9196-ea21-15d889e86f63
00020000-55fa-9196-bf2c-07a336b1dcb6	00030000-55fa-9196-4c42-5ad29a90c931
00020000-55fa-9196-bf2c-07a336b1dcb6	00030000-55fa-9196-5bc2-3fe8df4ef613
00020000-55fa-9196-bf2c-07a336b1dcb6	00030000-55fa-9196-94e3-29a14d7675ea
00020000-55fa-9196-bf2c-07a336b1dcb6	00030000-55fa-9196-566d-db13eb7e8567
00020000-55fa-9196-bf2c-07a336b1dcb6	00030000-55fa-9196-b405-e50a6f039c2a
00020000-55fa-9196-bf2c-07a336b1dcb6	00030000-55fa-9196-923a-cf2140d3bb9c
00020000-55fa-9196-bf2c-07a336b1dcb6	00030000-55fa-9196-cc2e-bf881569670c
00020000-55fa-9196-bf2c-07a336b1dcb6	00030000-55fa-9196-b48e-5260e357d4d8
00020000-55fa-9196-bf2c-07a336b1dcb6	00030000-55fa-9196-8e85-06a7c205e9fa
00020000-55fa-9196-bf2c-07a336b1dcb6	00030000-55fa-9196-4ed2-da06790286a2
00020000-55fa-9196-bf2c-07a336b1dcb6	00030000-55fa-9196-7030-739d2288f46b
00020000-55fa-9196-bf2c-07a336b1dcb6	00030000-55fa-9196-13e4-5ea194914a00
00020000-55fa-9196-bf2c-07a336b1dcb6	00030000-55fa-9196-77b7-dbe518825893
00020000-55fa-9196-bf2c-07a336b1dcb6	00030000-55fa-9196-cea0-558e78931979
00020000-55fa-9196-bf2c-07a336b1dcb6	00030000-55fa-9196-b356-f591cdc1a7fd
00020000-55fa-9196-bf2c-07a336b1dcb6	00030000-55fa-9196-9595-e6147f1f1b93
00020000-55fa-9196-bf2c-07a336b1dcb6	00030000-55fa-9196-b785-6b9073c01745
00020000-55fa-9196-bf2c-07a336b1dcb6	00030000-55fa-9196-4652-1645026c330f
00020000-55fa-9196-bf2c-07a336b1dcb6	00030000-55fa-9196-f2b9-6759ed7ceaee
00020000-55fa-9196-bf2c-07a336b1dcb6	00030000-55fa-9196-a58c-f92c41805c64
00020000-55fa-9196-bf2c-07a336b1dcb6	00030000-55fa-9196-ecae-e41e75bd64eb
00020000-55fa-9196-bf2c-07a336b1dcb6	00030000-55fa-9196-f5e5-b17eb736205a
00020000-55fa-9196-21b4-df445379ffcc	00030000-55fa-9196-a1f8-f32ea26cf645
00020000-55fa-9196-21b4-df445379ffcc	00030000-55fa-9196-c9e9-3283a9f9e2a8
00020000-55fa-9196-21b4-df445379ffcc	00030000-55fa-9196-c0fd-2f0ba9a6706f
00020000-55fa-9196-21b4-df445379ffcc	00030000-55fa-9196-cb0c-be8fc5be6371
00020000-55fa-9196-21b4-df445379ffcc	00030000-55fa-9196-4c42-5ad29a90c931
00020000-55fa-9196-21b4-df445379ffcc	00030000-55fa-9196-5bc2-3fe8df4ef613
00020000-55fa-9196-21b4-df445379ffcc	00030000-55fa-9196-566d-db13eb7e8567
00020000-55fa-9196-21b4-df445379ffcc	00030000-55fa-9196-b405-e50a6f039c2a
00020000-55fa-9196-21b4-df445379ffcc	00030000-55fa-9196-cc2e-bf881569670c
00020000-55fa-9196-21b4-df445379ffcc	00030000-55fa-9196-b48e-5260e357d4d8
00020000-55fa-9196-21b4-df445379ffcc	00030000-55fa-9196-4ed2-da06790286a2
00020000-55fa-9196-21b4-df445379ffcc	00030000-55fa-9196-7030-739d2288f46b
00020000-55fa-9196-21b4-df445379ffcc	00030000-55fa-9196-13e4-5ea194914a00
00020000-55fa-9196-21b4-df445379ffcc	00030000-55fa-9196-cea0-558e78931979
00020000-55fa-9196-21b4-df445379ffcc	00030000-55fa-9196-b356-f591cdc1a7fd
00020000-55fa-9196-21b4-df445379ffcc	00030000-55fa-9196-9595-e6147f1f1b93
00020000-55fa-9196-21b4-df445379ffcc	00030000-55fa-9196-b785-6b9073c01745
00020000-55fa-9196-21b4-df445379ffcc	00030000-55fa-9196-4652-1645026c330f
00020000-55fa-9196-21b4-df445379ffcc	00030000-55fa-9196-ecae-e41e75bd64eb
00020000-55fa-9196-21b4-df445379ffcc	00030000-55fa-9196-f5e5-b17eb736205a
00020000-55fa-9196-64de-5c57ee20aa71	00030000-55fa-9196-a1f8-f32ea26cf645
00020000-55fa-9196-64de-5c57ee20aa71	00030000-55fa-9196-cb0c-be8fc5be6371
00020000-55fa-9196-64de-5c57ee20aa71	00030000-55fa-9196-4c42-5ad29a90c931
00020000-55fa-9196-64de-5c57ee20aa71	00030000-55fa-9196-5bc2-3fe8df4ef613
00020000-55fa-9196-64de-5c57ee20aa71	00030000-55fa-9196-566d-db13eb7e8567
00020000-55fa-9196-64de-5c57ee20aa71	00030000-55fa-9196-b405-e50a6f039c2a
00020000-55fa-9196-64de-5c57ee20aa71	00030000-55fa-9196-cc2e-bf881569670c
00020000-55fa-9196-64de-5c57ee20aa71	00030000-55fa-9196-b48e-5260e357d4d8
00020000-55fa-9196-64de-5c57ee20aa71	00030000-55fa-9196-4ed2-da06790286a2
00020000-55fa-9196-64de-5c57ee20aa71	00030000-55fa-9196-7030-739d2288f46b
00020000-55fa-9196-64de-5c57ee20aa71	00030000-55fa-9196-13e4-5ea194914a00
00020000-55fa-9196-64de-5c57ee20aa71	00030000-55fa-9196-cea0-558e78931979
00020000-55fa-9196-64de-5c57ee20aa71	00030000-55fa-9196-b356-f591cdc1a7fd
00020000-55fa-9196-64de-5c57ee20aa71	00030000-55fa-9196-9595-e6147f1f1b93
00020000-55fa-9196-64de-5c57ee20aa71	00030000-55fa-9196-b785-6b9073c01745
00020000-55fa-9196-64de-5c57ee20aa71	00030000-55fa-9196-78be-0a036a0941a7
00020000-55fa-9196-64de-5c57ee20aa71	00030000-55fa-9196-31c2-14fdf2d2d505
00020000-55fa-9196-64de-5c57ee20aa71	00030000-55fa-9196-4652-1645026c330f
00020000-55fa-9196-64de-5c57ee20aa71	00030000-55fa-9196-ecae-e41e75bd64eb
00020000-55fa-9196-64de-5c57ee20aa71	00030000-55fa-9196-f5e5-b17eb736205a
00020000-55fa-9197-6c0f-80db5db66ba5	00030000-55fa-9196-1af0-8ba3f3626bd4
00020000-55fa-9197-6c0f-80db5db66ba5	00030000-55fa-9196-6d29-c439c08c8d8e
00020000-55fa-9197-6c0f-80db5db66ba5	00030000-55fa-9196-31c2-14fdf2d2d505
00020000-55fa-9197-6c0f-80db5db66ba5	00030000-55fa-9196-fb96-2139dd10c3ca
00020000-55fa-9197-6c0f-80db5db66ba5	00030000-55fa-9196-0b3c-a3543064379d
00020000-55fa-9197-6c0f-80db5db66ba5	00030000-55fa-9196-1181-3f9fe869cd60
00020000-55fa-9197-6c0f-80db5db66ba5	00030000-55fa-9196-2edc-60134a230111
00020000-55fa-9197-6c0f-80db5db66ba5	00030000-55fa-9196-a1f8-f32ea26cf645
00020000-55fa-9197-6c0f-80db5db66ba5	00030000-55fa-9196-c9e9-3283a9f9e2a8
00020000-55fa-9197-6c0f-80db5db66ba5	00030000-55fa-9196-7f1b-fe1ca90df41a
00020000-55fa-9197-6c0f-80db5db66ba5	00030000-55fa-9196-c0fd-2f0ba9a6706f
00020000-55fa-9197-6c0f-80db5db66ba5	00030000-55fa-9196-cb0c-be8fc5be6371
00020000-55fa-9197-6c0f-80db5db66ba5	00030000-55fa-9196-0882-561f3f3bec2e
00020000-55fa-9197-6c0f-80db5db66ba5	00030000-55fa-9196-376c-43966caa4cc3
00020000-55fa-9197-6c0f-80db5db66ba5	00030000-55fa-9196-9a81-c0fed5568d67
00020000-55fa-9197-6c0f-80db5db66ba5	00030000-55fa-9196-ea21-15d889e86f63
00020000-55fa-9197-6c0f-80db5db66ba5	00030000-55fa-9196-e05c-ebb21f5a4fc0
00020000-55fa-9197-6c0f-80db5db66ba5	00030000-55fa-9196-4c42-5ad29a90c931
00020000-55fa-9197-6c0f-80db5db66ba5	00030000-55fa-9196-5fc3-0aecf58e77ae
00020000-55fa-9197-6c0f-80db5db66ba5	00030000-55fa-9196-5bc2-3fe8df4ef613
00020000-55fa-9197-6c0f-80db5db66ba5	00030000-55fa-9196-0f7c-da07e6c1e031
00020000-55fa-9197-6c0f-80db5db66ba5	00030000-55fa-9196-8c55-69142335a296
00020000-55fa-9197-6c0f-80db5db66ba5	00030000-55fa-9196-27c8-1c12e97b7518
00020000-55fa-9197-6c0f-80db5db66ba5	00030000-55fa-9196-50bb-29ffde20a39a
00020000-55fa-9197-6c0f-80db5db66ba5	00030000-55fa-9196-9255-be86d6a17ce0
00020000-55fa-9197-6c0f-80db5db66ba5	00030000-55fa-9196-94e3-29a14d7675ea
00020000-55fa-9197-6c0f-80db5db66ba5	00030000-55fa-9196-bc0b-5a7f7e13feb7
00020000-55fa-9197-6c0f-80db5db66ba5	00030000-55fa-9196-566d-db13eb7e8567
00020000-55fa-9197-6c0f-80db5db66ba5	00030000-55fa-9196-1f89-166fcd97ff48
00020000-55fa-9197-6c0f-80db5db66ba5	00030000-55fa-9196-b405-e50a6f039c2a
00020000-55fa-9197-6c0f-80db5db66ba5	00030000-55fa-9196-e30e-4233dc95c577
00020000-55fa-9197-6c0f-80db5db66ba5	00030000-55fa-9196-923a-cf2140d3bb9c
00020000-55fa-9197-6c0f-80db5db66ba5	00030000-55fa-9196-2aff-473f0769397f
00020000-55fa-9197-6c0f-80db5db66ba5	00030000-55fa-9196-872d-fee183fad724
00020000-55fa-9197-6c0f-80db5db66ba5	00030000-55fa-9196-c6be-5a5fb5a9728a
00020000-55fa-9197-6c0f-80db5db66ba5	00030000-55fa-9196-52ca-4bcab74324a6
00020000-55fa-9197-6c0f-80db5db66ba5	00030000-55fa-9196-04fa-914b12cada0d
00020000-55fa-9197-6c0f-80db5db66ba5	00030000-55fa-9196-cc2e-bf881569670c
00020000-55fa-9197-6c0f-80db5db66ba5	00030000-55fa-9196-368e-c913fe41f6ab
00020000-55fa-9197-6c0f-80db5db66ba5	00030000-55fa-9196-b48e-5260e357d4d8
00020000-55fa-9197-6c0f-80db5db66ba5	00030000-55fa-9196-7f0e-7195116f4b96
00020000-55fa-9197-6c0f-80db5db66ba5	00030000-55fa-9196-8e85-06a7c205e9fa
00020000-55fa-9197-6c0f-80db5db66ba5	00030000-55fa-9196-1051-59153d987743
00020000-55fa-9197-6c0f-80db5db66ba5	00030000-55fa-9196-ee4c-e9094eb1772e
00020000-55fa-9197-6c0f-80db5db66ba5	00030000-55fa-9196-40fd-898b73bba9d4
00020000-55fa-9197-6c0f-80db5db66ba5	00030000-55fa-9196-503e-ff25f026c6b6
00020000-55fa-9197-6c0f-80db5db66ba5	00030000-55fa-9196-3f47-e7d544d0517e
00020000-55fa-9197-6c0f-80db5db66ba5	00030000-55fa-9196-2fd3-5dc3b3e9c309
00020000-55fa-9197-6c0f-80db5db66ba5	00030000-55fa-9196-7c00-d7965cbacd00
00020000-55fa-9197-6c0f-80db5db66ba5	00030000-55fa-9196-4ed2-da06790286a2
00020000-55fa-9197-6c0f-80db5db66ba5	00030000-55fa-9196-df76-d7c458c1bf77
00020000-55fa-9197-6c0f-80db5db66ba5	00030000-55fa-9196-7030-739d2288f46b
00020000-55fa-9197-6c0f-80db5db66ba5	00030000-55fa-9196-8f1a-3b2925bffb77
00020000-55fa-9197-6c0f-80db5db66ba5	00030000-55fa-9196-e301-1341fd5a1438
00020000-55fa-9197-6c0f-80db5db66ba5	00030000-55fa-9196-37e8-4754a7361b9d
00020000-55fa-9197-6c0f-80db5db66ba5	00030000-55fa-9196-4877-9fc1f5e7692a
00020000-55fa-9197-6c0f-80db5db66ba5	00030000-55fa-9196-741f-1cc15e3be5d0
00020000-55fa-9197-6c0f-80db5db66ba5	00030000-55fa-9196-c9ed-7a63e7627cbb
00020000-55fa-9197-6c0f-80db5db66ba5	00030000-55fa-9196-a3a1-6560004aca60
00020000-55fa-9197-6c0f-80db5db66ba5	00030000-55fa-9196-13e4-5ea194914a00
00020000-55fa-9197-6c0f-80db5db66ba5	00030000-55fa-9196-031f-4761b028c1be
00020000-55fa-9197-6c0f-80db5db66ba5	00030000-55fa-9196-5761-37ec782172cb
00020000-55fa-9197-6c0f-80db5db66ba5	00030000-55fa-9196-eb57-789d1988ff44
00020000-55fa-9197-6c0f-80db5db66ba5	00030000-55fa-9196-ca90-f4f1715194a9
00020000-55fa-9197-6c0f-80db5db66ba5	00030000-55fa-9196-415f-4f2fb7423ff9
00020000-55fa-9197-6c0f-80db5db66ba5	00030000-55fa-9196-77b7-dbe518825893
00020000-55fa-9197-6c0f-80db5db66ba5	00030000-55fa-9196-102f-46f45a93e71b
00020000-55fa-9197-6c0f-80db5db66ba5	00030000-55fa-9196-cb27-bd5e24c0c94b
00020000-55fa-9197-6c0f-80db5db66ba5	00030000-55fa-9196-e7fb-b17fab73ed31
00020000-55fa-9197-6c0f-80db5db66ba5	00030000-55fa-9196-4e39-ebbb2a8a4af1
00020000-55fa-9197-6c0f-80db5db66ba5	00030000-55fa-9196-180c-1fd1da07df3c
00020000-55fa-9197-6c0f-80db5db66ba5	00030000-55fa-9196-98c0-558e39e59a16
00020000-55fa-9197-6c0f-80db5db66ba5	00030000-55fa-9196-1862-3a46c01306e9
00020000-55fa-9197-6c0f-80db5db66ba5	00030000-55fa-9196-ebbf-36b31b0c8ae7
00020000-55fa-9197-6c0f-80db5db66ba5	00030000-55fa-9196-7118-1e4186903a5d
00020000-55fa-9197-6c0f-80db5db66ba5	00030000-55fa-9196-e3ab-2ca5eca6dbe5
00020000-55fa-9197-6c0f-80db5db66ba5	00030000-55fa-9196-66bd-e22782010e12
00020000-55fa-9197-6c0f-80db5db66ba5	00030000-55fa-9196-a5d8-7442ed7d2443
00020000-55fa-9197-6c0f-80db5db66ba5	00030000-55fa-9196-ac7a-09efada65202
00020000-55fa-9197-6c0f-80db5db66ba5	00030000-55fa-9196-ec0c-3b3663bebb44
00020000-55fa-9197-6c0f-80db5db66ba5	00030000-55fa-9196-cd6a-68a73ae4a011
00020000-55fa-9197-6c0f-80db5db66ba5	00030000-55fa-9196-5747-cc0fd10970e1
00020000-55fa-9197-6c0f-80db5db66ba5	00030000-55fa-9196-f955-c0d556110b21
00020000-55fa-9197-6c0f-80db5db66ba5	00030000-55fa-9196-1114-99e6e6a890fb
00020000-55fa-9197-6c0f-80db5db66ba5	00030000-55fa-9196-be0b-5d6a370d4fb8
00020000-55fa-9197-6c0f-80db5db66ba5	00030000-55fa-9196-e2eb-d4986cbbb84b
00020000-55fa-9197-6c0f-80db5db66ba5	00030000-55fa-9196-8e7c-c1957f126e80
00020000-55fa-9197-6c0f-80db5db66ba5	00030000-55fa-9196-cea0-558e78931979
00020000-55fa-9197-6c0f-80db5db66ba5	00030000-55fa-9196-29cd-922af80dab5c
00020000-55fa-9197-6c0f-80db5db66ba5	00030000-55fa-9196-06a9-341d37a7daa8
00020000-55fa-9197-6c0f-80db5db66ba5	00030000-55fa-9196-0593-9af161c1310c
00020000-55fa-9197-6c0f-80db5db66ba5	00030000-55fa-9196-e5b1-9b624428caa0
00020000-55fa-9197-6c0f-80db5db66ba5	00030000-55fa-9196-8568-f613fa5cb159
00020000-55fa-9197-6c0f-80db5db66ba5	00030000-55fa-9196-b356-f591cdc1a7fd
00020000-55fa-9197-6c0f-80db5db66ba5	00030000-55fa-9196-737a-d735e9856de5
00020000-55fa-9197-6c0f-80db5db66ba5	00030000-55fa-9196-9595-e6147f1f1b93
00020000-55fa-9197-6c0f-80db5db66ba5	00030000-55fa-9196-d921-b248882b7160
00020000-55fa-9197-6c0f-80db5db66ba5	00030000-55fa-9196-0836-6954c2260f31
00020000-55fa-9197-6c0f-80db5db66ba5	00030000-55fa-9196-ff59-f31fb02bf5d1
00020000-55fa-9197-6c0f-80db5db66ba5	00030000-55fa-9196-6b4d-07cf10792eb7
00020000-55fa-9197-6c0f-80db5db66ba5	00030000-55fa-9196-9074-ac316fb43af7
00020000-55fa-9197-6c0f-80db5db66ba5	00030000-55fa-9196-ed59-239b9cf888e4
00020000-55fa-9197-6c0f-80db5db66ba5	00030000-55fa-9196-6a8e-8a477de0f265
00020000-55fa-9197-6c0f-80db5db66ba5	00030000-55fa-9196-22a9-891a4bff8fe2
00020000-55fa-9197-6c0f-80db5db66ba5	00030000-55fa-9196-fb89-5397c5d136f5
00020000-55fa-9197-6c0f-80db5db66ba5	00030000-55fa-9196-b785-6b9073c01745
00020000-55fa-9197-6c0f-80db5db66ba5	00030000-55fa-9196-7350-3e9219576085
00020000-55fa-9197-6c0f-80db5db66ba5	00030000-55fa-9196-fdf4-1462cde80989
00020000-55fa-9197-6c0f-80db5db66ba5	00030000-55fa-9196-acc5-5ee1cad2eee3
00020000-55fa-9197-6c0f-80db5db66ba5	00030000-55fa-9196-b4fa-5e24990d7946
00020000-55fa-9197-6c0f-80db5db66ba5	00030000-55fa-9196-e512-bae705dcca1b
00020000-55fa-9197-6c0f-80db5db66ba5	00030000-55fa-9196-23d9-e6898d0d4051
00020000-55fa-9197-6c0f-80db5db66ba5	00030000-55fa-9196-2dc5-25bdef5cdaf0
00020000-55fa-9197-6c0f-80db5db66ba5	00030000-55fa-9196-b7c3-e621ed6e2e79
00020000-55fa-9197-6c0f-80db5db66ba5	00030000-55fa-9196-fe23-16bb6def55cb
00020000-55fa-9197-6c0f-80db5db66ba5	00030000-55fa-9196-347c-0a3cc8eb67ac
00020000-55fa-9197-6c0f-80db5db66ba5	00030000-55fa-9196-c869-f72f72a40e34
00020000-55fa-9197-6c0f-80db5db66ba5	00030000-55fa-9196-78be-0a036a0941a7
00020000-55fa-9197-6c0f-80db5db66ba5	00030000-55fa-9196-3061-8f628406bd8b
00020000-55fa-9197-6c0f-80db5db66ba5	00030000-55fa-9196-4652-1645026c330f
00020000-55fa-9197-6c0f-80db5db66ba5	00030000-55fa-9196-23b4-cb2e612ee49f
00020000-55fa-9197-6c0f-80db5db66ba5	00030000-55fa-9196-bf5a-7ba0dcb8e6ff
00020000-55fa-9197-6c0f-80db5db66ba5	00030000-55fa-9196-d97a-bcb3df005cee
00020000-55fa-9197-6c0f-80db5db66ba5	00030000-55fa-9196-31ce-d587dc7a5f99
00020000-55fa-9197-6c0f-80db5db66ba5	00030000-55fa-9196-7819-a9f341214b9c
00020000-55fa-9197-6c0f-80db5db66ba5	00030000-55fa-9196-5340-85dd352f8aa2
00020000-55fa-9197-6c0f-80db5db66ba5	00030000-55fa-9196-e87b-e29a8243a735
00020000-55fa-9197-6c0f-80db5db66ba5	00030000-55fa-9196-f2b9-6759ed7ceaee
00020000-55fa-9197-6c0f-80db5db66ba5	00030000-55fa-9196-325f-19571676b979
00020000-55fa-9197-6c0f-80db5db66ba5	00030000-55fa-9196-31e5-2e4285b694b2
00020000-55fa-9197-6c0f-80db5db66ba5	00030000-55fa-9196-2bfc-814442d7b603
00020000-55fa-9197-6c0f-80db5db66ba5	00030000-55fa-9196-2467-2e2965fad418
00020000-55fa-9197-6c0f-80db5db66ba5	00030000-55fa-9196-1e77-44ceb2d317da
00020000-55fa-9197-6c0f-80db5db66ba5	00030000-55fa-9196-6a41-a38f4ec490a2
00020000-55fa-9197-6c0f-80db5db66ba5	00030000-55fa-9196-520c-a33593ef3713
00020000-55fa-9197-6c0f-80db5db66ba5	00030000-55fa-9196-a58c-f92c41805c64
00020000-55fa-9197-6c0f-80db5db66ba5	00030000-55fa-9196-057d-22eda081798b
00020000-55fa-9197-6c0f-80db5db66ba5	00030000-55fa-9196-ecae-e41e75bd64eb
00020000-55fa-9197-6c0f-80db5db66ba5	00030000-55fa-9196-ec8c-6c93e3a82f25
00020000-55fa-9197-6c0f-80db5db66ba5	00030000-55fa-9196-f5e5-b17eb736205a
00020000-55fa-9197-6c0f-80db5db66ba5	00030000-55fa-9196-6a45-669a054588ff
\.


--
-- TOC entry 2961 (class 0 OID 19923906)
-- Dependencies: 207
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 2965 (class 0 OID 19923940)
-- Dependencies: 211
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 2976 (class 0 OID 19924069)
-- Dependencies: 222
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, zacetek, konec, jeavtorskepravice, placilonavajo, vrednostvaje, planiranostevilovaj, vrednostvaj, vrednostpredstave, vrednostdopremiere, aktivna, zaposlenvdrjz, samozaposlen, igralec, opis) FROM stdin;
000b0000-55fa-9197-45f4-98711bdc01e3	00090000-55fa-9197-f35a-b4f66c9e6f3e	\N	\N	0001	\N	\N	f	f	10.00	3	10.00	30.00	10.00	t	t	f	t	Pogodba o sodelovanju
000b0000-55fa-9197-31a5-371017923faa	00090000-55fa-9197-4da9-91f6fbccd317	\N	\N	0002	\N	\N	f	t	11.00	10	11.00	31.00	110.00	t	f	t	t	Pogodba za vlogo Helena
000b0000-55fa-9197-3323-8332a2f9352a	00090000-55fa-9197-d992-613a3c072cc9	\N	\N	0003	\N	\N	f	f	12.00	4	12.00	32.00	12.00	t	f	t	f	Pogodba za lektoriranje
000b0000-55fa-9197-63a5-052d44498fb5	00090000-55fa-9197-c038-bc91633aa30d	\N	\N	0004	\N	\N	t	f	0.00	2	300.00	30.00	300.00	t	f	t	f	Pogodba za avtorske pravice
\.


--
-- TOC entry 2939 (class 0 OID 19923668)
-- Dependencies: 185
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, drzava_id, sifra, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo, nvo) FROM stdin;
00080000-55fa-9197-5016-04b13dcb418b	00040000-55fa-9195-2560-b72a1a454e65	0988	AK	Juhuhu d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55fa-9197-0ecb-2bcfe6afde4c	00040000-55fa-9195-2560-b72a1a454e65	0989	AK	Hopsasa d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	t
00080000-55fa-9197-688a-dae659149b69	00040000-55fa-9195-2560-b72a1a454e65	0987	AK	Gledališče Šrum d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55fa-9197-7752-d264afa5354e	00040000-55fa-9195-2560-b72a1a454e65	0986	AK	Lutkovni Direndaj d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55fa-9197-8a0a-57ebb7054433	00040000-55fa-9195-2560-b72a1a454e65	0985	AK	Tatjana Stanič, Lektoriranje, s.p.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55fa-9197-5bff-90223e403c50	00040000-55fa-9195-3636-49c4cc900380	0984	AK	Gledališče Lepote tvoje		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55fa-9197-8da2-ba3b4ce92cf5	00040000-55fa-9195-d0de-6175b9d55f24	0983	AK	Sunce naše		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55fa-9197-0b42-32c3ba9c80ec	00040000-55fa-9195-d051-037ad7e2121c	0982	AK	Theater Amadeus		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55fa-9197-e70c-71284d6631d4	00040000-55fa-9195-5975-732fdb6af459	9999	AK	Fuchs		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55fa-9198-7d68-704d2ef418ce	00040000-55fa-9195-2560-b72a1a454e65	1001	AK	Gledališče Matica		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
\.


--
-- TOC entry 2941 (class 0 OID 19923702)
-- Dependencies: 187
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-55fa-9195-df42-b59f091c6ab8	8341	Adlešiči
00050000-55fa-9195-6b38-eaa507ba45c5	5270	Ajdovščina
00050000-55fa-9195-649e-ad78d33d62a1	6280	Ankaran/Ancarano
00050000-55fa-9195-a708-e9e34a253e5a	9253	Apače
00050000-55fa-9195-dd18-2f606b5bf3a0	8253	Artiče
00050000-55fa-9195-5a61-a2de1ec155fe	4275	Begunje na Gorenjskem
00050000-55fa-9195-0a1b-4fd39d52e843	1382	Begunje pri Cerknici
00050000-55fa-9195-0e3f-0d3a642b4f64	9231	Beltinci
00050000-55fa-9195-2f9d-995248fb1eaf	2234	Benedikt
00050000-55fa-9195-822a-e9c83cd5f237	2345	Bistrica ob Dravi
00050000-55fa-9195-1602-ec6dd580c7fb	3256	Bistrica ob Sotli
00050000-55fa-9195-7833-186c05517c10	8259	Bizeljsko
00050000-55fa-9195-c1db-ac64f3c98db3	1223	Blagovica
00050000-55fa-9195-7bc6-97a9df98d586	8283	Blanca
00050000-55fa-9195-eebd-17914225f108	4260	Bled
00050000-55fa-9195-b67c-5d5fc61fe252	4273	Blejska Dobrava
00050000-55fa-9195-c8a2-9b14941387b1	9265	Bodonci
00050000-55fa-9195-f453-88e02c7bca7e	9222	Bogojina
00050000-55fa-9195-bdb9-bc0b9d1246cd	4263	Bohinjska Bela
00050000-55fa-9195-508c-a0f390d78cba	4264	Bohinjska Bistrica
00050000-55fa-9195-8c91-cce9bb7c39a4	4265	Bohinjsko jezero
00050000-55fa-9195-8dd1-ce42009d8532	1353	Borovnica
00050000-55fa-9195-bc15-78e26e3386c9	8294	Boštanj
00050000-55fa-9195-30c2-b83439271cf2	5230	Bovec
00050000-55fa-9195-0745-773c6d885143	5295	Branik
00050000-55fa-9195-493f-539ea953ede8	3314	Braslovče
00050000-55fa-9195-e2f6-4263a25aa627	5223	Breginj
00050000-55fa-9195-1d14-49e9b2efecf5	8280	Brestanica
00050000-55fa-9195-59bd-dac2bc2b5e9e	2354	Bresternica
00050000-55fa-9195-9de1-585520737cc4	4243	Brezje
00050000-55fa-9195-868a-176260d1abab	1351	Brezovica pri Ljubljani
00050000-55fa-9195-7306-425baffbf98e	8250	Brežice
00050000-55fa-9195-9b9a-5254c1ea19ea	4210	Brnik - Aerodrom
00050000-55fa-9195-dac6-a7f81997468a	8321	Brusnice
00050000-55fa-9195-cf8b-39267a7bfd8d	3255	Buče
00050000-55fa-9195-21be-69f22ae2f1aa	8276	Bučka 
00050000-55fa-9195-d0b2-66678185be7f	9261	Cankova
00050000-55fa-9195-92ee-1252b0589a68	3000	Celje 
00050000-55fa-9195-74b6-8af7e9050db4	3001	Celje - poštni predali
00050000-55fa-9195-5ae1-384d6315ca71	4207	Cerklje na Gorenjskem
00050000-55fa-9195-be82-5e61cda7f711	8263	Cerklje ob Krki
00050000-55fa-9195-b480-a75e1752a291	1380	Cerknica
00050000-55fa-9195-8b62-d722d94079fa	5282	Cerkno
00050000-55fa-9195-dd3e-bcbaa3908046	2236	Cerkvenjak
00050000-55fa-9195-d3aa-272dd69b313e	2215	Ceršak
00050000-55fa-9195-4a94-c571af14e784	2326	Cirkovce
00050000-55fa-9195-8c77-189b211287e9	2282	Cirkulane
00050000-55fa-9195-9a07-fa38a9570ab1	5273	Col
00050000-55fa-9195-9c6c-206946249e56	8251	Čatež ob Savi
00050000-55fa-9195-02cb-6ebb047bf7da	1413	Čemšenik
00050000-55fa-9195-c792-06ea8cee1987	5253	Čepovan
00050000-55fa-9195-1c73-8f3d27db9bb5	9232	Črenšovci
00050000-55fa-9195-aa14-171aac3ca6d7	2393	Črna na Koroškem
00050000-55fa-9195-88a0-06a2a7159979	6275	Črni Kal
00050000-55fa-9195-e845-086bd1f2c8b8	5274	Črni Vrh nad Idrijo
00050000-55fa-9195-bf7e-e767a22562ac	5262	Črniče
00050000-55fa-9195-bd4a-93189a297a7f	8340	Črnomelj
00050000-55fa-9195-c6a7-54ebd688d981	6271	Dekani
00050000-55fa-9195-0685-806e6d112bf2	5210	Deskle
00050000-55fa-9195-381a-49f1a4a49790	2253	Destrnik
00050000-55fa-9195-146f-639eaff9cf1f	6215	Divača
00050000-55fa-9195-1d6b-cb5cdce183e0	1233	Dob
00050000-55fa-9195-dee1-4ada6057422b	3224	Dobje pri Planini
00050000-55fa-9195-82b1-1a3de4d6d6ea	8257	Dobova
00050000-55fa-9195-3007-df1b1a313d1f	1423	Dobovec
00050000-55fa-9195-f013-b98679664bee	5263	Dobravlje
00050000-55fa-9195-25ab-28a6e69c3ed3	3204	Dobrna
00050000-55fa-9195-7db8-74d167c75b85	8211	Dobrnič
00050000-55fa-9195-c1f8-edc8a08942bb	1356	Dobrova
00050000-55fa-9195-4e29-1f0fad5ab726	9223	Dobrovnik/Dobronak 
00050000-55fa-9195-15dd-7da866fef246	5212	Dobrovo v Brdih
00050000-55fa-9195-3682-4292f1e1f04f	1431	Dol pri Hrastniku
00050000-55fa-9195-dc8c-b4f23848ff29	1262	Dol pri Ljubljani
00050000-55fa-9195-4e7c-b8b55f3cfb9b	1273	Dole pri Litiji
00050000-55fa-9195-ea52-fc9cce0b0946	1331	Dolenja vas
00050000-55fa-9195-d3f4-c5646e97a369	8350	Dolenjske Toplice
00050000-55fa-9195-7bc2-56b0f5c406d3	1230	Domžale
00050000-55fa-9195-3fb5-32300ce76954	2252	Dornava
00050000-55fa-9195-0edc-0219942e88fa	5294	Dornberk
00050000-55fa-9195-ed17-fb7eaa7eb70e	1319	Draga
00050000-55fa-9195-b92a-0b4e9f5699c6	8343	Dragatuš
00050000-55fa-9195-1abd-25e912809cfc	3222	Dramlje
00050000-55fa-9195-83b7-04443316ee71	2370	Dravograd
00050000-55fa-9195-3215-d953a57a3a7c	4203	Duplje
00050000-55fa-9195-753f-9582a669fc57	6221	Dutovlje
00050000-55fa-9195-7d01-f01ef32ec102	8361	Dvor
00050000-55fa-9195-85b9-cd4ba3e5e17f	2343	Fala
00050000-55fa-9195-32c2-93573d2a5f59	9208	Fokovci
00050000-55fa-9195-38d0-8dc66fc88a50	2313	Fram
00050000-55fa-9195-7933-7f6959beb9a6	3213	Frankolovo
00050000-55fa-9195-9947-5a5cae2556d0	1274	Gabrovka
00050000-55fa-9195-d6e4-08c4f0217fed	8254	Globoko
00050000-55fa-9195-9c97-fb84cd84d642	5275	Godovič
00050000-55fa-9195-65d7-407aabce2869	4204	Golnik
00050000-55fa-9195-85e2-9e391b62b37d	3303	Gomilsko
00050000-55fa-9195-9d04-4b3900a574fe	4224	Gorenja vas
00050000-55fa-9195-b709-08cdc359ba44	3263	Gorica pri Slivnici
00050000-55fa-9195-82d9-c869117d6971	2272	Gorišnica
00050000-55fa-9195-17be-b0aa51e34136	9250	Gornja Radgona
00050000-55fa-9195-032a-5ea83a8b7a3b	3342	Gornji Grad
00050000-55fa-9195-fbc4-a8c537d43d62	4282	Gozd Martuljek
00050000-55fa-9195-e7dd-a7cb44db0bc0	6272	Gračišče
00050000-55fa-9195-04c8-4f82e7b1ce1f	9264	Grad
00050000-55fa-9195-7a54-08b482e68d20	8332	Gradac
00050000-55fa-9195-2564-433e4de5a8ea	1384	Grahovo
00050000-55fa-9195-4895-16be7838538f	5242	Grahovo ob Bači
00050000-55fa-9195-2f8e-59b13a960dc4	5251	Grgar
00050000-55fa-9195-7ab4-30a5baae59ce	3302	Griže
00050000-55fa-9195-4e03-8484dcce4844	3231	Grobelno
00050000-55fa-9195-78e9-22ffecaf2250	1290	Grosuplje
00050000-55fa-9195-2fcf-1dc0d5c1ec96	2288	Hajdina
00050000-55fa-9195-8821-999b0d41da72	8362	Hinje
00050000-55fa-9195-dac3-6a105bdcc649	2311	Hoče
00050000-55fa-9195-673b-4c863218bffa	9205	Hodoš/Hodos
00050000-55fa-9195-0630-5a53cc5577c9	1354	Horjul
00050000-55fa-9195-b14d-874e8b1b8165	1372	Hotedršica
00050000-55fa-9195-b9b2-2a10467d381f	1430	Hrastnik
00050000-55fa-9195-753e-bf3418d32c29	6225	Hruševje
00050000-55fa-9195-8ae3-2af21077729c	4276	Hrušica
00050000-55fa-9195-e866-43e4c4f4fc33	5280	Idrija
00050000-55fa-9195-8986-cbb8026b65d6	1292	Ig
00050000-55fa-9195-d0ac-f3ee7b524d9b	6250	Ilirska Bistrica
00050000-55fa-9195-8ea8-8969e01bad7a	6251	Ilirska Bistrica-Trnovo
00050000-55fa-9195-5e63-aa349b2b2a34	1295	Ivančna Gorica
00050000-55fa-9195-ac6a-04ff74fd0de9	2259	Ivanjkovci
00050000-55fa-9195-1426-a110450a6266	1411	Izlake
00050000-55fa-9195-c270-bd3a4dc61292	6310	Izola/Isola
00050000-55fa-9195-42ed-236fc5ad7ac6	2222	Jakobski Dol
00050000-55fa-9195-853e-23f6c6b1d098	2221	Jarenina
00050000-55fa-9195-3482-d020513562d0	6254	Jelšane
00050000-55fa-9195-7571-1f6d5661c16a	4270	Jesenice
00050000-55fa-9195-20d5-14fc4f9eb1ad	8261	Jesenice na Dolenjskem
00050000-55fa-9195-7194-3ce093dffdf4	3273	Jurklošter
00050000-55fa-9195-97ef-d9d6ecb1118e	2223	Jurovski Dol
00050000-55fa-9195-fc2d-7d2c4c118ab5	2256	Juršinci
00050000-55fa-9195-9980-f76c52f9789f	5214	Kal nad Kanalom
00050000-55fa-9195-5096-99dfb8ad1a1b	3233	Kalobje
00050000-55fa-9195-b704-5de73f7d4d87	4246	Kamna Gorica
00050000-55fa-9195-694e-3ea9e1f26750	2351	Kamnica
00050000-55fa-9195-8222-8d97b88c85b8	1241	Kamnik
00050000-55fa-9195-b61d-6438a39cefbf	5213	Kanal
00050000-55fa-9195-1b83-3bde262d706f	8258	Kapele
00050000-55fa-9195-05fb-85ed5a6b7d06	2362	Kapla
00050000-55fa-9195-abe5-375735e06e65	2325	Kidričevo
00050000-55fa-9195-208c-cc8e4de9f0e8	1412	Kisovec
00050000-55fa-9195-27c6-2521aaf585cb	6253	Knežak
00050000-55fa-9195-ef61-3ecaeb8446eb	5222	Kobarid
00050000-55fa-9195-c3fd-94356584771d	9227	Kobilje
00050000-55fa-9195-0aee-03f20233ea96	1330	Kočevje
00050000-55fa-9195-5369-cf84dc7825a9	1338	Kočevska Reka
00050000-55fa-9195-43b8-1cb46f6c7452	2276	Kog
00050000-55fa-9195-adfe-b759cd43859e	5211	Kojsko
00050000-55fa-9195-f88e-ff1463148c48	6223	Komen
00050000-55fa-9195-5255-aff1114bc636	1218	Komenda
00050000-55fa-9195-4762-d87cd7d2bc8c	6000	Koper/Capodistria 
00050000-55fa-9195-1a3e-6337c5001b43	6001	Koper/Capodistria - poštni predali
00050000-55fa-9195-fa1a-9ff912e0aabf	8282	Koprivnica
00050000-55fa-9195-5d73-1037f8e28a01	5296	Kostanjevica na Krasu
00050000-55fa-9195-c4cb-73aed1a54562	8311	Kostanjevica na Krki
00050000-55fa-9195-f9f5-c081bf86bb67	1336	Kostel
00050000-55fa-9195-6cc8-9a7d522f986e	6256	Košana
00050000-55fa-9195-fe31-99ab0707ac78	2394	Kotlje
00050000-55fa-9195-0703-1f439cb9074e	6240	Kozina
00050000-55fa-9195-856c-2b2fdc15a5b6	3260	Kozje
00050000-55fa-9195-c4ed-7dee350b7c25	4000	Kranj 
00050000-55fa-9195-7a2e-350fef41ed78	4001	Kranj - poštni predali
00050000-55fa-9195-f553-526a609ab843	4280	Kranjska Gora
00050000-55fa-9195-282a-6518e798e526	1281	Kresnice
00050000-55fa-9195-41bd-80c371441f1a	4294	Križe
00050000-55fa-9195-bf3b-2060dfcf0385	9206	Križevci
00050000-55fa-9195-d972-9b539399fb57	9242	Križevci pri Ljutomeru
00050000-55fa-9195-acfd-e87baa2cc2f1	1301	Krka
00050000-55fa-9195-f783-2cdb78068585	8296	Krmelj
00050000-55fa-9195-9198-ccb9007ba4a9	4245	Kropa
00050000-55fa-9195-692a-ffd27d66ae02	8262	Krška vas
00050000-55fa-9195-0808-5e2ba3d7bda7	8270	Krško
00050000-55fa-9195-17e5-22665c2a1dc4	9263	Kuzma
00050000-55fa-9195-e39d-40a15c95723e	2318	Laporje
00050000-55fa-9195-5437-b43321f62c85	3270	Laško
00050000-55fa-9195-91f0-d7d83f53d492	1219	Laze v Tuhinju
00050000-55fa-9195-e730-af366d1ec455	2230	Lenart v Slovenskih goricah
00050000-55fa-9195-ca75-e98b5ca0306e	9220	Lendava/Lendva
00050000-55fa-9195-52f2-76f2bd76d334	4248	Lesce
00050000-55fa-9195-e4d2-4223ff79ce9f	3261	Lesično
00050000-55fa-9195-d78b-e8c3cb8765a9	8273	Leskovec pri Krškem
00050000-55fa-9195-3f7d-0b15880dc154	2372	Libeliče
00050000-55fa-9195-f4fd-096169058aa2	2341	Limbuš
00050000-55fa-9195-3b79-3d6954357bcd	1270	Litija
00050000-55fa-9195-f158-1099d5c1d24e	3202	Ljubečna
00050000-55fa-9195-2a9c-2f0ade01f604	1000	Ljubljana 
00050000-55fa-9195-c709-9dbd62f653d1	1001	Ljubljana - poštni predali
00050000-55fa-9195-9810-936d92fb9f59	1231	Ljubljana - Črnuče
00050000-55fa-9195-4dec-17f0335e9b2d	1261	Ljubljana - Dobrunje
00050000-55fa-9195-02a6-8d98f171da86	1260	Ljubljana - Polje
00050000-55fa-9195-8d0e-69c7ea8b1d7b	1210	Ljubljana - Šentvid
00050000-55fa-9195-2ee5-6d18b45d246b	1211	Ljubljana - Šmartno
00050000-55fa-9195-26f8-697484c53263	3333	Ljubno ob Savinji
00050000-55fa-9195-9965-1c04145ac2f5	9240	Ljutomer
00050000-55fa-9195-8849-0b1cd05b2a30	3215	Loče
00050000-55fa-9195-ce4e-f473f92840d3	5231	Log pod Mangartom
00050000-55fa-9195-66de-e31eda0c1777	1358	Log pri Brezovici
00050000-55fa-9195-1647-da42fadcc650	1370	Logatec
00050000-55fa-9195-a2a3-6e509bca7075	1371	Logatec
00050000-55fa-9195-62ff-3bc1404e0671	1434	Loka pri Zidanem Mostu
00050000-55fa-9195-38ec-6c8226cbd47b	3223	Loka pri Žusmu
00050000-55fa-9195-0764-ae2a350fb0ba	6219	Lokev
00050000-55fa-9195-76ec-010cddc0c225	1318	Loški Potok
00050000-55fa-9195-c280-fe047b90e7c1	2324	Lovrenc na Dravskem polju
00050000-55fa-9195-9e1c-2218b22cc4b4	2344	Lovrenc na Pohorju
00050000-55fa-9195-f561-357229d5c671	3334	Luče
00050000-55fa-9195-01c7-dbaf29aa1b60	1225	Lukovica
00050000-55fa-9195-26a6-33f778214931	9202	Mačkovci
00050000-55fa-9195-50ad-c391fef8e88b	2322	Majšperk
00050000-55fa-9195-d067-7517abc51bdc	2321	Makole
00050000-55fa-9195-7fc0-5946e49b68a0	9243	Mala Nedelja
00050000-55fa-9195-6814-ad2a4f15fde6	2229	Malečnik
00050000-55fa-9195-4771-385ad5d31dc1	6273	Marezige
00050000-55fa-9195-9665-f168fc369c8a	2000	Maribor 
00050000-55fa-9195-21d8-129c99da07b9	2001	Maribor - poštni predali
00050000-55fa-9195-2e03-43be48cf0154	2206	Marjeta na Dravskem polju
00050000-55fa-9195-3b0b-2910cb5320f4	2281	Markovci
00050000-55fa-9195-eed8-050b718f185a	9221	Martjanci
00050000-55fa-9195-5b30-db7bd231fc13	6242	Materija
00050000-55fa-9195-a85f-5bcee638fb5d	4211	Mavčiče
00050000-55fa-9195-bc71-dbb36003c34b	1215	Medvode
00050000-55fa-9195-7a05-5b23ba1404b5	1234	Mengeš
00050000-55fa-9195-ec40-92cd1f64419e	8330	Metlika
00050000-55fa-9195-f974-9c404b151a99	2392	Mežica
00050000-55fa-9195-8642-2033a127aad4	2204	Miklavž na Dravskem polju
00050000-55fa-9195-e61f-e1cc3c661a6a	2275	Miklavž pri Ormožu
00050000-55fa-9195-a8d7-c827df4752dd	5291	Miren
00050000-55fa-9195-f287-7ff69be64b80	8233	Mirna
00050000-55fa-9195-1a7b-69e7095b94b9	8216	Mirna Peč
00050000-55fa-9195-250c-c82b6015fec9	2382	Mislinja
00050000-55fa-9195-620b-9f53ad8f4425	4281	Mojstrana
00050000-55fa-9195-41bf-3181e7562fad	8230	Mokronog
00050000-55fa-9195-c1ec-8cda24c4a93b	1251	Moravče
00050000-55fa-9195-80d0-6581aed8f3f1	9226	Moravske Toplice
00050000-55fa-9195-3162-fc0675b75ae4	5216	Most na Soči
00050000-55fa-9195-78d0-6b1b0ed15629	1221	Motnik
00050000-55fa-9195-08b0-6a792a5cd47d	3330	Mozirje
00050000-55fa-9195-9505-e14cfc4b9f17	9000	Murska Sobota 
00050000-55fa-9195-1df9-66a027f55fef	9001	Murska Sobota - poštni predali
00050000-55fa-9195-824a-6d1eac205b6b	2366	Muta
00050000-55fa-9195-e44e-577e61d57834	4202	Naklo
00050000-55fa-9195-8838-408d8f78b7e8	3331	Nazarje
00050000-55fa-9195-9d61-b4919dbfe18e	1357	Notranje Gorice
00050000-55fa-9195-6355-fe95e3c0f920	3203	Nova Cerkev
00050000-55fa-9195-4b70-ec33d3a106dd	5000	Nova Gorica 
00050000-55fa-9195-b828-1659e915b161	5001	Nova Gorica - poštni predali
00050000-55fa-9195-c2e1-f6c9dfc16016	1385	Nova vas
00050000-55fa-9195-19b0-2c1f7365845f	8000	Novo mesto
00050000-55fa-9195-d276-2554159ed700	8001	Novo mesto - poštni predali
00050000-55fa-9195-4dfd-6815a99096b4	6243	Obrov
00050000-55fa-9195-49aa-ae730ad07bb6	9233	Odranci
00050000-55fa-9195-a09a-5ff1b26be404	2317	Oplotnica
00050000-55fa-9195-7021-994c80616c70	2312	Orehova vas
00050000-55fa-9195-b00b-7ce4993bd6af	2270	Ormož
00050000-55fa-9195-26bd-fc06cd561cf6	1316	Ortnek
00050000-55fa-9195-9b05-d15c1be087da	1337	Osilnica
00050000-55fa-9195-3c19-a32a1a460e29	8222	Otočec
00050000-55fa-9195-6348-b3a853d6ffb3	2361	Ožbalt
00050000-55fa-9195-5b47-d6178e24cce1	2231	Pernica
00050000-55fa-9195-5953-04a9fef52d60	2211	Pesnica pri Mariboru
00050000-55fa-9195-a76b-c2b702190159	9203	Petrovci
00050000-55fa-9195-8ecc-98a35d744042	3301	Petrovče
00050000-55fa-9195-73a6-fb4eb6a9c0bf	6330	Piran/Pirano
00050000-55fa-9195-ca28-1aaf0c2f3f65	8255	Pišece
00050000-55fa-9195-5d5d-181b260369da	6257	Pivka
00050000-55fa-9195-7658-86895c6188f4	6232	Planina
00050000-55fa-9195-78e9-e7cfa15a6dd2	3225	Planina pri Sevnici
00050000-55fa-9195-2d9f-9298ac6e6d17	6276	Pobegi
00050000-55fa-9195-062c-cbe52e92f8ad	8312	Podbočje
00050000-55fa-9195-975f-9605682a23d9	5243	Podbrdo
00050000-55fa-9195-7029-0b598572c6e8	3254	Podčetrtek
00050000-55fa-9195-7244-4ec3db18fa4d	2273	Podgorci
00050000-55fa-9195-709b-e6bb2bfee027	6216	Podgorje
00050000-55fa-9195-771c-07e6c8b6fc42	2381	Podgorje pri Slovenj Gradcu
00050000-55fa-9195-809a-30f0722fcaee	6244	Podgrad
00050000-55fa-9195-97af-9ec38ebf94d3	1414	Podkum
00050000-55fa-9195-7bd6-69b59988284e	2286	Podlehnik
00050000-55fa-9195-5e53-fce73af3c02a	5272	Podnanos
00050000-55fa-9195-bf56-55726a53fb39	4244	Podnart
00050000-55fa-9195-a029-0c03bbb98d4d	3241	Podplat
00050000-55fa-9195-3280-a0b5d5631d02	3257	Podsreda
00050000-55fa-9195-22a9-87bd229ec96c	2363	Podvelka
00050000-55fa-9195-95e2-a0c4cc3f2075	2208	Pohorje
00050000-55fa-9195-6aeb-352fb6437dfd	2257	Polenšak
00050000-55fa-9195-4f6b-043b695eff3f	1355	Polhov Gradec
00050000-55fa-9195-76ca-432658cede7e	4223	Poljane nad Škofjo Loko
00050000-55fa-9195-7e8e-8aa02739ef3b	2319	Poljčane
00050000-55fa-9195-bc98-bb978d175aa2	1272	Polšnik
00050000-55fa-9195-6162-4d566bb77f3f	3313	Polzela
00050000-55fa-9195-9184-6cfa6d4d6625	3232	Ponikva
00050000-55fa-9195-f059-c7edb64c13f5	6320	Portorož/Portorose
00050000-55fa-9195-88e6-2778b23cf05f	6230	Postojna
00050000-55fa-9195-0231-1f69139ba8e1	2331	Pragersko
00050000-55fa-9195-901a-27ec2e919b51	3312	Prebold
00050000-55fa-9195-f190-932eb8b85169	4205	Preddvor
00050000-55fa-9195-b121-574005ebb39a	6255	Prem
00050000-55fa-9195-3794-dae0169bcfb3	1352	Preserje
00050000-55fa-9195-655b-5fa1607b5f20	6258	Prestranek
00050000-55fa-9195-ff98-af848d9d6e19	2391	Prevalje
00050000-55fa-9195-7920-dae2065f437e	3262	Prevorje
00050000-55fa-9195-1be9-a977e6060382	1276	Primskovo 
00050000-55fa-9195-3e9b-4cda50271866	3253	Pristava pri Mestinju
00050000-55fa-9195-1d9d-ba9a9cda55d5	9207	Prosenjakovci/Partosfalva
00050000-55fa-9195-b584-12d9e5ff9698	5297	Prvačina
00050000-55fa-9195-229e-e46758edb321	2250	Ptuj
00050000-55fa-9195-ca00-770d49b793f5	2323	Ptujska Gora
00050000-55fa-9195-d780-3890927f88bc	9201	Puconci
00050000-55fa-9195-87df-dbe19ded7b6c	2327	Rače
00050000-55fa-9195-9d23-b7d421e81b76	1433	Radeče
00050000-55fa-9195-b9aa-113869798971	9252	Radenci
00050000-55fa-9195-2a28-58970a01df5f	2360	Radlje ob Dravi
00050000-55fa-9195-1ef1-f83162811432	1235	Radomlje
00050000-55fa-9195-1e56-3ff1525c4580	4240	Radovljica
00050000-55fa-9195-b2c5-1b4e84b166b6	8274	Raka
00050000-55fa-9195-7971-c76d35e025b2	1381	Rakek
00050000-55fa-9195-f35f-5314bc2e6970	4283	Rateče - Planica
00050000-55fa-9195-447a-23c5522ec36d	2390	Ravne na Koroškem
00050000-55fa-9195-e0f1-96b583c65703	9246	Razkrižje
00050000-55fa-9195-9604-e65c1ce6d8cd	3332	Rečica ob Savinji
00050000-55fa-9195-22cf-34c743c69fb6	5292	Renče
00050000-55fa-9195-2cde-f59ec82327f0	1310	Ribnica
00050000-55fa-9195-4f4e-8bf043b8255f	2364	Ribnica na Pohorju
00050000-55fa-9195-5403-538d1986c4f2	3272	Rimske Toplice
00050000-55fa-9195-bee8-98200eec8c67	1314	Rob
00050000-55fa-9195-1199-939bb47cdfac	5215	Ročinj
00050000-55fa-9195-a631-d5fa7e723beb	3250	Rogaška Slatina
00050000-55fa-9195-3ae9-8a24d3045159	9262	Rogašovci
00050000-55fa-9195-b9b2-da6fa41298ea	3252	Rogatec
00050000-55fa-9195-1821-d9b02d4f4de4	1373	Rovte
00050000-55fa-9195-3350-3277740dc574	2342	Ruše
00050000-55fa-9195-1a8a-b59b879b7fcd	1282	Sava
00050000-55fa-9195-479d-57a8ca1da213	6333	Sečovlje/Sicciole
00050000-55fa-9195-3389-2858f0e71e8b	4227	Selca
00050000-55fa-9195-3b55-91d720d64106	2352	Selnica ob Dravi
00050000-55fa-9195-57b1-3c65b2dbfa41	8333	Semič
00050000-55fa-9195-eeca-2f7c25b1fdf0	8281	Senovo
00050000-55fa-9195-387a-4961e3c22e06	6224	Senožeče
00050000-55fa-9195-ce27-8e49bddb4419	8290	Sevnica
00050000-55fa-9195-621f-a6d888931bf4	6210	Sežana
00050000-55fa-9195-b601-22ec5fb61925	2214	Sladki Vrh
00050000-55fa-9195-95d7-9a02b226588e	5283	Slap ob Idrijci
00050000-55fa-9195-8ecb-24fb646c7664	2380	Slovenj Gradec
00050000-55fa-9195-9f69-24e20d4da9da	2310	Slovenska Bistrica
00050000-55fa-9195-a129-fc9a6ed2d8ed	3210	Slovenske Konjice
00050000-55fa-9195-cd0f-ecc5fe460dd1	1216	Smlednik
00050000-55fa-9195-6dbf-9497b0503204	5232	Soča
00050000-55fa-9195-6091-a5e7b7951136	1317	Sodražica
00050000-55fa-9195-280d-b63f94b57a66	3335	Solčava
00050000-55fa-9195-665d-36e8286e6e2e	5250	Solkan
00050000-55fa-9195-9124-9b417ff48e74	4229	Sorica
00050000-55fa-9195-7a53-b40d8f9a13be	4225	Sovodenj
00050000-55fa-9195-e60d-5e9aaf180a0e	5281	Spodnja Idrija
00050000-55fa-9195-46d3-d2447e3df20a	2241	Spodnji Duplek
00050000-55fa-9195-4930-672b885dbcee	9245	Spodnji Ivanjci
00050000-55fa-9195-4853-1ab37f93d8e8	2277	Središče ob Dravi
00050000-55fa-9195-fa4c-7ab6f2f325c4	4267	Srednja vas v Bohinju
00050000-55fa-9195-6589-a30bd191ff2a	8256	Sromlje 
00050000-55fa-9195-e708-d3ada2cece33	5224	Srpenica
00050000-55fa-9195-7a90-4a66dcc38b25	1242	Stahovica
00050000-55fa-9195-c15c-393b1f26816f	1332	Stara Cerkev
00050000-55fa-9195-3fbc-db366dbf22e4	8342	Stari trg ob Kolpi
00050000-55fa-9195-a19d-0ccad56217db	1386	Stari trg pri Ložu
00050000-55fa-9195-9c4e-9fb6392e9f6a	2205	Starše
00050000-55fa-9195-fa42-eefcc2a7c782	2289	Stoperce
00050000-55fa-9195-e5ae-084155f7085f	8322	Stopiče
00050000-55fa-9195-d70a-966cf8fd7bac	3206	Stranice
00050000-55fa-9195-8882-c8ae91f2bc83	8351	Straža
00050000-55fa-9195-59e0-1a90aa4ad95a	1313	Struge
00050000-55fa-9195-f615-95865715403c	8293	Studenec
00050000-55fa-9195-e336-2f829bdd1ad2	8331	Suhor
00050000-55fa-9195-4a98-f59675c4c228	2233	Sv. Ana v Slovenskih goricah
00050000-55fa-9195-b992-d36329f11f4c	2235	Sv. Trojica v Slovenskih goricah
00050000-55fa-9195-9d6f-95e491bdf7d6	2353	Sveti Duh na Ostrem Vrhu
00050000-55fa-9195-44bd-863d849c53eb	9244	Sveti Jurij ob Ščavnici
00050000-55fa-9195-8225-3e3bde1a5c78	3264	Sveti Štefan
00050000-55fa-9195-2b23-16e40727c5c4	2258	Sveti Tomaž
00050000-55fa-9195-55d2-50d131bc83f4	9204	Šalovci
00050000-55fa-9195-c304-5d9cb8bba654	5261	Šempas
00050000-55fa-9195-cc00-71b7466f3bfc	5290	Šempeter pri Gorici
00050000-55fa-9195-7cd6-fbc6ed463092	3311	Šempeter v Savinjski dolini
00050000-55fa-9195-5107-56ba70e51f97	4208	Šenčur
00050000-55fa-9195-aa8b-fa81849108d4	2212	Šentilj v Slovenskih goricah
00050000-55fa-9195-7b17-33d3bc69a028	8297	Šentjanž
00050000-55fa-9195-8917-e996386de04a	2373	Šentjanž pri Dravogradu
00050000-55fa-9195-5ab4-6a50c69914c1	8310	Šentjernej
00050000-55fa-9195-0443-004703be2faa	3230	Šentjur
00050000-55fa-9195-72ef-25cc8049973b	3271	Šentrupert
00050000-55fa-9195-82f5-dc5fc02b9ea7	8232	Šentrupert
00050000-55fa-9195-178a-eba180e3c129	1296	Šentvid pri Stični
00050000-55fa-9195-95cc-43111023d4ea	8275	Škocjan
00050000-55fa-9195-de74-0d9def6d32b2	6281	Škofije
00050000-55fa-9195-fdef-10f7a5f7b65c	4220	Škofja Loka
00050000-55fa-9195-a2f1-7848867c7081	3211	Škofja vas
00050000-55fa-9195-5233-cd257463a57b	1291	Škofljica
00050000-55fa-9195-0ec3-1cbebc210987	6274	Šmarje
00050000-55fa-9195-b283-071a1d662464	1293	Šmarje - Sap
00050000-55fa-9195-063e-786a89b591b3	3240	Šmarje pri Jelšah
00050000-55fa-9195-9e9a-ac032219fdec	8220	Šmarješke Toplice
00050000-55fa-9195-e652-3ed5e22edbbe	2315	Šmartno na Pohorju
00050000-55fa-9195-2289-0470e1b739b8	3341	Šmartno ob Dreti
00050000-55fa-9195-6455-a48b8daeee9b	3327	Šmartno ob Paki
00050000-55fa-9195-e717-71ac2d7abf31	1275	Šmartno pri Litiji
00050000-55fa-9195-2bff-8799f26a5c5a	2383	Šmartno pri Slovenj Gradcu
00050000-55fa-9195-945a-a1945a131349	3201	Šmartno v Rožni dolini
00050000-55fa-9195-41c9-ce9badcc9c09	3325	Šoštanj
00050000-55fa-9195-e17c-14403e0faddf	6222	Štanjel
00050000-55fa-9195-2512-3d4ae0356cdd	3220	Štore
00050000-55fa-9195-031c-a41eb76ec9a2	3304	Tabor
00050000-55fa-9195-f479-beae245f8ac4	3221	Teharje
00050000-55fa-9195-c97c-d67b01387c4e	9251	Tišina
00050000-55fa-9195-0bf9-42a2440464ff	5220	Tolmin
00050000-55fa-9195-1757-b19923369ee4	3326	Topolšica
00050000-55fa-9195-0dda-d4f80ee84e45	2371	Trbonje
00050000-55fa-9195-39b1-0bc946e0acf3	1420	Trbovlje
00050000-55fa-9195-9e89-795e73f08d06	8231	Trebelno 
00050000-55fa-9195-2fce-898820a6206a	8210	Trebnje
00050000-55fa-9195-812b-335951f024e4	5252	Trnovo pri Gorici
00050000-55fa-9195-ccb0-768a5a33f603	2254	Trnovska vas
00050000-55fa-9195-2d4d-e09064b9e99a	1222	Trojane
00050000-55fa-9195-35ac-1a8661e8a012	1236	Trzin
00050000-55fa-9195-1514-508474e16695	4290	Tržič
00050000-55fa-9195-d68c-ebb24c66045b	8295	Tržišče
00050000-55fa-9195-c2ed-8aa35ada5791	1311	Turjak
00050000-55fa-9195-a665-0c994a11dda1	9224	Turnišče
00050000-55fa-9195-5698-cd6233b25090	8323	Uršna sela
00050000-55fa-9195-338a-2cff2b754b08	1252	Vače
00050000-55fa-9195-079d-3a0d484785bc	3320	Velenje 
00050000-55fa-9195-b5fb-fd7fce9527c2	3322	Velenje - poštni predali
00050000-55fa-9195-7df6-f24b0fc831cc	8212	Velika Loka
00050000-55fa-9195-0b9d-0dba7ac62464	2274	Velika Nedelja
00050000-55fa-9195-186e-94de18680fbd	9225	Velika Polana
00050000-55fa-9195-5c36-eca22ba52ae0	1315	Velike Lašče
00050000-55fa-9195-8f12-5bed1893ca0e	8213	Veliki Gaber
00050000-55fa-9195-bc32-53366b1584a4	9241	Veržej
00050000-55fa-9195-4252-0c67aea0f539	1312	Videm - Dobrepolje
00050000-55fa-9195-569c-54266a31cdc7	2284	Videm pri Ptuju
00050000-55fa-9195-3880-93f829d31214	8344	Vinica
00050000-55fa-9195-d80a-6875d6a5a6da	5271	Vipava
00050000-55fa-9195-377d-479e9cb086fb	4212	Visoko
00050000-55fa-9195-e898-e99004afd6e0	1294	Višnja Gora
00050000-55fa-9195-170c-e72e044ca7f8	3205	Vitanje
00050000-55fa-9195-0ef9-1ecdb60c743b	2255	Vitomarci
00050000-55fa-9195-9fa9-43f23b2f1267	1217	Vodice
00050000-55fa-9195-05a1-fc54dfc7e695	3212	Vojnik\t
00050000-55fa-9195-922a-f67962245dd7	5293	Volčja Draga
00050000-55fa-9195-5be7-64f9698e2458	2232	Voličina
00050000-55fa-9195-cb46-26aab02dee23	3305	Vransko
00050000-55fa-9195-4cba-45c372c0ce76	6217	Vremski Britof
00050000-55fa-9195-7bbc-462e74f7d2ff	1360	Vrhnika
00050000-55fa-9195-cb9d-535549b1dc2f	2365	Vuhred
00050000-55fa-9195-ebba-6a9d4af5cdf8	2367	Vuzenica
00050000-55fa-9195-39cd-9487e38bc844	8292	Zabukovje 
00050000-55fa-9195-544c-fcef1a8cc47a	1410	Zagorje ob Savi
00050000-55fa-9195-2695-eca3ec99e34c	1303	Zagradec
00050000-55fa-9195-694f-1dc651183f0d	2283	Zavrč
00050000-55fa-9195-b277-125b1e2231a1	8272	Zdole 
00050000-55fa-9195-a035-88c98a7b5fdf	4201	Zgornja Besnica
00050000-55fa-9195-fc38-50210170b075	2242	Zgornja Korena
00050000-55fa-9195-7162-629202d589b5	2201	Zgornja Kungota
00050000-55fa-9195-6f8b-d8b2030f14da	2316	Zgornja Ložnica
00050000-55fa-9195-d365-6fa97de6aad2	2314	Zgornja Polskava
00050000-55fa-9195-cfa9-d49763340cb5	2213	Zgornja Velka
00050000-55fa-9195-63b0-b8d9e5252227	4247	Zgornje Gorje
00050000-55fa-9195-1cdd-24efb8e698d4	4206	Zgornje Jezersko
00050000-55fa-9195-1c74-39bd9224fd12	2285	Zgornji Leskovec
00050000-55fa-9195-9b43-14f6c2d10612	1432	Zidani Most
00050000-55fa-9195-a3c8-eef557f6446f	3214	Zreče
00050000-55fa-9195-ccc0-4b758312278d	4209	Žabnica
00050000-55fa-9195-4068-1ae94d309621	3310	Žalec
00050000-55fa-9195-331d-c75a01e26eb4	4228	Železniki
00050000-55fa-9195-23d1-853440a30ee2	2287	Žetale
00050000-55fa-9195-934d-10bcea56626a	4226	Žiri
00050000-55fa-9195-62ab-ef9f53c40674	4274	Žirovnica
00050000-55fa-9195-c3e2-1254fdaa4fd5	8360	Žužemberk
\.


--
-- TOC entry 2983 (class 0 OID 19924248)
-- Dependencies: 229
-- Data for Name: postavkacdve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkacdve (id, skupina, podskupina, naziv, vrpremiere, vrponovitvepremier, vrponovitveprejsnjih, vrgostovanjazamejstvo, vrfestivali, vrgostovanjaint, vrostalo, programdela_id) FROM stdin;
\.


--
-- TOC entry 2957 (class 0 OID 19923880)
-- Dependencies: 203
-- Data for Name: postavkaracuna; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkaracuna (id, racun_id) FROM stdin;
\.


--
-- TOC entry 2940 (class 0 OID 19923687)
-- Dependencies: 186
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
00060000-55fa-9197-b36d-2f1d561b6bcc	00080000-55fa-9197-5016-04b13dcb418b	\N	00040000-55fa-9195-2560-b72a1a454e65	Narodni dom	\N	Koroška 15	\N	9231	Beltinci	\N	f	t
00060000-55fa-9197-3f5b-c329b35af0e9	00080000-55fa-9197-5016-04b13dcb418b	\N	00040000-55fa-9195-2560-b72a1a454e65	Korotan	\N	Koroška 22	\N	9231	Beltinci	\N	f	f
00060000-55fa-9197-40a9-492e9c3b0060	00080000-55fa-9197-0ecb-2bcfe6afde4c	\N	00040000-55fa-9195-2560-b72a1a454e65	Rimljan	\N	Rimska ploščad 7	\N	9231	Beltinci	\N	f	t
\.


--
-- TOC entry 2946 (class 0 OID 19923765)
-- Dependencies: 192
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, zaporedna, porocilo) FROM stdin;
\.


--
-- TOC entry 2959 (class 0 OID 19923892)
-- Dependencies: 205
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 2984 (class 0 OID 19924262)
-- Dependencies: 230
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, koproducent_id, odstotekfinanciranja, delez, maticnikop, kpe, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 2985 (class 0 OID 19924272)
-- Dependencies: 231
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, sifra, status) FROM stdin;
00190000-55fa-9197-6838-b9b818c3128c	00080000-55fa-9197-688a-dae659149b69	0987	AK
00190000-55fa-9197-18d9-faef388998d5	00080000-55fa-9197-0ecb-2bcfe6afde4c	0989	AK
00190000-55fa-9197-9727-d9d5b16b8d39	00080000-55fa-9197-7752-d264afa5354e	0986	AK
00190000-55fa-9197-1f2a-29fe5d53c886	00080000-55fa-9197-5bff-90223e403c50	0984	AK
00190000-55fa-9197-e489-580270a6098e	00080000-55fa-9197-8da2-ba3b4ce92cf5	0983	AK
00190000-55fa-9197-07c8-aacd7557c9f5	00080000-55fa-9197-0b42-32c3ba9c80ec	0982	AK
00190000-55fa-9198-7e5e-fb19277b087f	00080000-55fa-9198-7d68-704d2ef418ce	1001	AK
\.


--
-- TOC entry 2982 (class 0 OID 19924205)
-- Dependencies: 228
-- Data for Name: programdela; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programdela (id, sifra, naziv, zacetek, konec, zakljuceno, potrjenprogram, stpremier, stint, stfest, strazno, stizjem, stponprem, stponprej, stponprejvelikih, stponprejmalih, stponprejmalihkopr, stponprejsredkopr, stponprejvelikihkopr, stgostujo, vrps1, vrps1do, vrps1mat, vrps1gostovsz, stizvnekomerc, stizvprem, stizvponprem, stizvponpremdoma, stizvponpremzamejo, stizvponpremgost, stizvponpremkopr, stizvponpremint, stizvponpremkoprint, stizvponprej, stizvponprejdoma, stizvponprejzamejo, stizvponprejgost, stizvponprejkopr, stizvponprejint, stizvponprejkoprint, stizvgostuj, stizvostalihnek, stizvgostovanjslo, stizvgostovanjzam, stizvgostovanjint, stobisknekom, stobisknekommat, stobisknekomgostslo, stobisknekomgostzam, stobisknekomgostint, stobiskprem, stobiskponprem, stobiskponpremdoma, stobiskponpremkopr, stobiskponpremkoprint, stobiskponpremgost, stobiskponpremzamejo, stobiskponpremint, avgobiskprired, avgzaseddvoran, avgcenavstopnice, stprodvstopnic, stkoprodukcij, stkoprodukcijint, stkoprodukcijnvo, stzaposlenih, stzaposigralcev, avgstnastopovigr, sthonorarnih, sthonorarnihigr, sthonorarnihigrtujjz, sthonorarnihigrsamoz, sredstvaint, sredstvaavt, sredstvazaprosenoprem, sredstvazaprosenoponprem, sredstvazaprosenoponprej, sredstvazaprosenogostujo, sredstvazaprosenoint, sredstvazaprosenofest, sredstvazaprosenorazno, sredstvazaprosenoizjem, sredstvadrugijavniprem, sredstvadrugijavniponprem, sredstvadrugijavniponprej, sredstvadrugijavnigostujo, sredstvadrugijavniint, sredstvadrugijavnifest, sredstvadrugijavnirazno, sredstvadrugijavniizjem, sredstvadrugiviriprem, sredstvadrugiviriponprem, sredstvadrugiviriponprej, sredstvadrugivirigostujo, sredstvadrugiviriint, sredstvadrugivirifest, sredstvadrugivirirazno, sredstvadrugiviriizjem, sredstvaavtsamoz) FROM stdin;
00290000-55fa-9197-6e80-166b288680d1	0001	Testni program dela	2016-02-01	2017-02-01	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 2986 (class 0 OID 19924280)
-- Dependencies: 232
-- Data for Name: programskaenotasklopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programskaenotasklopa (id, naslovpe, avtorpe, obsegpe, mesecpe, vrednostpe, programrazno_id) FROM stdin;
\.


--
-- TOC entry 2963 (class 0 OID 19923921)
-- Dependencies: 209
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, popa_id, naslov_id, sifra, naziv, jeprizorisce, jematicnioder, seplanira, kapaciteta, opis) FROM stdin;
00220000-55fa-9197-40a0-b557c97c95a5	\N	\N	0001	Poskusna 1	f	\N	t	8	Poskusna učilnica v prvem
00220000-55fa-9197-eeb2-840e275ec16f	\N	\N	0002	Poskusna 3	f	\N	f	34	Poskusna učilnica v tretjem
00220000-55fa-9197-2f30-dcd0179cf1e9	\N	\N	0003	Kazinska	t	\N	t	84	Kazinska dvorana
00220000-55fa-9197-4059-6f5291b65a7c	\N	\N	0004	Mali oder	t	\N	t	24	Mali oder 
00220000-55fa-9197-28bb-021cee5be3bc	\N	\N	0005	Komorni oder	t	\N	t	15	Komorni oder
00220000-55fa-9197-0886-49d264fcd900	\N	\N	0006	Stara dvorana	t	\N	t	96	Stara dvorana ali dvorana Franceta Prešerna
00220000-55fa-9197-6cbb-1996054141f3	\N	\N	0007	Velika dvorana	t	\N	t	160	Velika, glavna dvorana
\.


--
-- TOC entry 2955 (class 0 OID 19923865)
-- Dependencies: 201
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 2954 (class 0 OID 19923855)
-- Dependencies: 200
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 2975 (class 0 OID 19924058)
-- Dependencies: 221
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta, status) FROM stdin;
\.


--
-- TOC entry 2970 (class 0 OID 19923995)
-- Dependencies: 216
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 2929 (class 0 OID 19923560)
-- Dependencies: 175
-- Data for Name: revizije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY revizije (id, razred, objectid, upor, datum, tip, data) FROM stdin;
1	App\\Entity\\Popa	00080000-55fa-9198-7d68-704d2ef418ce	00010000-55fa-9196-5dc6-a43244693477	2015-09-17 12:10:32	INS	a:0:{}
2	App\\Entity\\Option	00000000-55fa-9198-f485-a0f0f05eea65	00010000-55fa-9196-5dc6-a43244693477	2015-09-17 12:10:32	INS	a:0:{}
3	ProgramDela\\Entity\\ProdukcijskaHisa	00190000-55fa-9198-7e5e-fb19277b087f	00010000-55fa-9196-5dc6-a43244693477	2015-09-17 12:10:32	INS	a:0:{}
\.


--
-- TOC entry 3004 (class 0 OID 0)
-- Dependencies: 174
-- Name: revizije_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('revizije_id_seq', 3, true);


--
-- TOC entry 2964 (class 0 OID 19923934)
-- Dependencies: 210
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 2933 (class 0 OID 19923598)
-- Dependencies: 179
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-55fa-9196-7d8b-93ee3dc7436a	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-55fa-9196-7cd5-9b03f99b84df	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-55fa-9196-bc3e-f855969e4a52	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-55fa-9196-da26-76e5036f5abb	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-55fa-9196-c932-8ac46a178ef6	planer	Planer dogodkov v koledarju	t
00020000-55fa-9196-f47e-332e452952a4	kadrovska	Kadrovska služba	t
00020000-55fa-9196-bf2c-07a336b1dcb6	arhivar	Ažuriranje arhivalij	t
00020000-55fa-9196-21b4-df445379ffcc	igralec	Igralec	t
00020000-55fa-9196-64de-5c57ee20aa71	prisotnost	Vnašalec prisotnosti, tudi za tiste izven uprizoritev	t
00020000-55fa-9197-6c0f-80db5db66ba5	vsadovoljenja	Vloga z vsemi posameznimi dovoljenji	t
\.


--
-- TOC entry 2931 (class 0 OID 19923582)
-- Dependencies: 177
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-55fa-9196-5d44-c29762855ac5	00020000-55fa-9196-bc3e-f855969e4a52
00010000-55fa-9196-5dc6-a43244693477	00020000-55fa-9196-bc3e-f855969e4a52
00010000-55fa-9197-d9dc-72c450d0074d	00020000-55fa-9197-6c0f-80db5db66ba5
\.


--
-- TOC entry 2966 (class 0 OID 19923948)
-- Dependencies: 212
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 2958 (class 0 OID 19923886)
-- Dependencies: 204
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 2952 (class 0 OID 19923832)
-- Dependencies: 198
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, sifra, ime, zacetek, konec, aktivna) FROM stdin;
\.


--
-- TOC entry 2927 (class 0 OID 19923547)
-- Dependencies: 173
-- Data for Name: stevilcenje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenje (id, sifra, naziv, prefix, suffix, zacetek, dolzina, format, globalno, poletih) FROM stdin;
00230000-55fa-9195-5821-8ba14f73f548	pri	Privzeto številčenje po letih YYYY-N	\N	\N	1	1	%l-%n	f	t
00230000-55fa-9195-eb3e-c469e1c8134a	123	Privzeto številčenje kratkih šifer	\N	\N	100	3	%n	f	f
00230000-55fa-9195-e4f0-219badd4840e	bcd	Globalno številčenje črtnih kod	\N	\N	1	9	%n	t	f
00230000-55fa-9195-d1bf-d57aa8abcede	sif	Številčenje šifrant	\N	\N	1000	4	%n	f	f
00230000-55fa-9195-0052-537f71623b9e	tmp	Globalno številčenje začasnih številk	tmp	\N	1000	5	%l%n	t	t
\.


--
-- TOC entry 2926 (class 0 OID 19923539)
-- Dependencies: 172
-- Data for Name: stevilcenjekonfig; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjekonfig (id, stevilcenje_id, dok) FROM stdin;
00240000-55fa-9195-3356-0340cd2df7c0	00230000-55fa-9195-d1bf-d57aa8abcede	popa
00240000-55fa-9195-3052-7452fae75aaa	00230000-55fa-9195-d1bf-d57aa8abcede	oseba
00240000-55fa-9195-b772-7c515e6a8eab	00230000-55fa-9195-d1bf-d57aa8abcede	sezona
00240000-55fa-9195-9b61-7da672d0f6db	00230000-55fa-9195-eb3e-c469e1c8134a	prostor
00240000-55fa-9195-feed-f2dac33c10c4	00230000-55fa-9195-d1bf-d57aa8abcede	besedilo
00240000-55fa-9195-6d27-e1b7b9ba6510	00230000-55fa-9195-d1bf-d57aa8abcede	uprizoritev
00240000-55fa-9195-d8c9-4d2756a981bc	00230000-55fa-9195-d1bf-d57aa8abcede	funkcija
00240000-55fa-9195-d240-da59497db7cc	00230000-55fa-9195-d1bf-d57aa8abcede	tipfunkcije
00240000-55fa-9195-7efb-71c17519d2cf	00230000-55fa-9195-d1bf-d57aa8abcede	alternacija
00240000-55fa-9195-29c8-44dd0063a9a9	00230000-55fa-9195-5821-8ba14f73f548	pogodba
00240000-55fa-9195-4516-c87a11a5352f	00230000-55fa-9195-d1bf-d57aa8abcede	zaposlitev
00240000-55fa-9195-d9bd-c73c6af423e3	00230000-55fa-9195-d1bf-d57aa8abcede	zvrstuprizoritve
00240000-55fa-9195-f030-4bdbb31d03b5	00230000-55fa-9195-5821-8ba14f73f548	programdela
00240000-55fa-9195-09c2-b4137b1957e6	00230000-55fa-9195-d1bf-d57aa8abcede	zapis
\.


--
-- TOC entry 2925 (class 0 OID 19923534)
-- Dependencies: 171
-- Data for Name: stevilcenjestanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjestanje (id, objid, leto, stevilka) FROM stdin;
f84143a4-ae8d-4792-a4f5-4282185be94e	00240000-55fa-9195-3356-0340cd2df7c0	0	1001
\.


--
-- TOC entry 2971 (class 0 OID 19924005)
-- Dependencies: 217
-- Data for Name: strosekuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY strosekuprizoritve (id, uprizoritev_id, popa_id, naziv, vrednostdo, vrednostna, opis, tipstroska, sort, vrstastroska_id) FROM stdin;
00270000-55fa-9197-1834-fa1babd9f03a	000e0000-55fa-9197-8c3a-c7ae0414a57d	00080000-55fa-9197-5016-04b13dcb418b	Nabava kostumov	600.50	20.00	Krila in maske	materialni	1	003b0000-55fa-9196-9510-e97baa9767e6
00270000-55fa-9197-7a03-b64073aa66d4	000e0000-55fa-9197-8c3a-c7ae0414a57d	00080000-55fa-9197-5016-04b13dcb418b	Zavese	125.70	3.10	Modra in zelena zavesa	materialni	2	003b0000-55fa-9196-9510-e97baa9767e6
\.


--
-- TOC entry 2938 (class 0 OID 19923660)
-- Dependencies: 184
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 2953 (class 0 OID 19923842)
-- Dependencies: 199
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja) FROM stdin;
001a0000-55fa-9197-455a-e32b65847332	00180000-55fa-9197-4834-70e725f67b83	000c0000-55fa-9197-668f-569c1a935f79	00090000-55fa-9197-2477-10d1d339769b	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55fa-9197-8308-8071737b121e	00180000-55fa-9197-4834-70e725f67b83	000c0000-55fa-9197-b7a2-26597b9df1d9	00090000-55fa-9197-c038-bc91633aa30d	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55fa-9197-9593-e0b0af3fa274	00180000-55fa-9197-4834-70e725f67b83	000c0000-55fa-9197-c96a-f863c1637ad6	00090000-55fa-9197-76dc-1d2eaa6bc8ee	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55fa-9197-c453-61f5b5f2c0b9	00180000-55fa-9197-4834-70e725f67b83	000c0000-55fa-9197-e3bf-aa75eeae9989	00090000-55fa-9197-fc93-40e7c61ea015	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55fa-9197-b9af-51ffec650dd4	00180000-55fa-9197-4834-70e725f67b83	000c0000-55fa-9197-6dc6-d70543bfbe87	00090000-55fa-9197-5609-c6ce2e20baa0	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55fa-9197-fdf2-b200400a85c0	00180000-55fa-9197-065d-35ae0b70f550	\N	00090000-55fa-9197-5609-c6ce2e20baa0	2015-08-01 20:00:00	2015-08-01 23:00:00	\N	\N	2.00
\.


--
-- TOC entry 2974 (class 0 OID 19924046)
-- Dependencies: 220
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, sifra, ime, opis, imezenski, podrocje) FROM stdin;
000f0000-55fa-9195-13dd-d0b2a1417876	01	Avtor	Avtorji	Avtorka	umetnik
000f0000-55fa-9195-862d-97160e09af1e	02	Priredba	Priredba	Priredba	umetnik
000f0000-55fa-9195-9f4b-2a0cb0401b6b	03	Prevod	Prevod	Prevod	umetnik
000f0000-55fa-9195-ef52-dcdcdc87717f	04	Režija	Režija	Režija	umetnik
000f0000-55fa-9195-bacc-953b9a79e91d	05	Dramaturgija	Dramaturgija	Dramaturgija	umetnik
000f0000-55fa-9195-47ec-1bdb8b8bff13	06	Scenografija	Scenografija	Scenografija	umetnik
000f0000-55fa-9195-0c1b-48fc08c905d1	07	Kostumografija	Kostumografija	Kostumografija	umetnik
000f0000-55fa-9195-f0ab-0c364baf0590	08	Koreografija	Koreografija	Koreografija	umetnik
000f0000-55fa-9195-8893-2ab6f6783b41	09	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	umetnik
000f0000-55fa-9195-d90c-264666db1193	10	Oblikovanje maske	Oblikovanje maske	Oblikovanje maske	umetnik
000f0000-55fa-9195-f762-c8cc3619b6e4	11	Lektorstvo	Lektorstvo	Lektorstvo	umetnik
000f0000-55fa-9195-5569-c774315243ad	12	Glasbeni soustvarjalec	Glasbeni soustvarjalci	Glasbena soustvarjalka	umetnik
000f0000-55fa-9195-b733-30faf634a16d	13	Intermedijski ustvarjalec	Intermedijski ustvarjalci	Intermedijski ustvarjalka	umetnik
000f0000-55fa-9195-6eb2-2e680faed715	14	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	umetnik
000f0000-55fa-9195-4275-3805219d30fb	15	Vloga	Intermedijski ustvarjalci	Intermedijska ustvarjalka	igralec
000f0000-55fa-9195-11b3-c664366149b1	16	Produkcija, mentorstvo	Produkcija, mentorstvo	Produkcija, mentorstvo	umetnik
000f0000-55fa-9195-7b6c-e15dd9445275	17	Tehnična podpora	Tehnična podpora	Tehnična podpora	tehnik
000f0000-55fa-9195-8966-bd523377d949	18	Inšpicient	Inšpicienti	Inšpicientka	inspicient
\.


--
-- TOC entry 2987 (class 0 OID 19924290)
-- Dependencies: 233
-- Data for Name: tipprogramskeenote; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipprogramskeenote (id, sifra, naziv, koprodukcija, maxfaktor, maxvsi) FROM stdin;
002b0000-55fa-9195-049e-235f2064c0e6	01	Velika predstava	f	1.00	1.00
002b0000-55fa-9195-72b6-50e92e277bd1	02	Mala predstava	f	0.50	0.50
002b0000-55fa-9195-f720-961a79d9473f	03	Mala koprodukcija	t	0.40	1.00
002b0000-55fa-9195-da37-9f78260e4230	04	Srednja koprodukcija	t	0.70	2.00
002b0000-55fa-9195-69aa-ce8c3fe4fe20	05	Velika koprodukcija	t	1.00	3.00
\.


--
-- TOC entry 2943 (class 0 OID 19923722)
-- Dependencies: 189
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 2930 (class 0 OID 19923569)
-- Dependencies: 176
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-55fa-9196-5dc6-a43244693477	Konzolni	$2y$05$NS4xMjkyMTcwMzExMjAxROYVcSFXmCCegm7477sWh8St0yMKB/u8K	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-55fa-9197-4f06-dc7d488bf86d	testni uporabnik za inšpicienta	$2y$05$NS4xMjkyMTcwMzExMjAxROxkJ1B6xAXex6EZLIwJfWzRJ8DpfecFO	t	\N	\N	\N	ivo@ifigenija.si	\N	\N	\N
00010000-55fa-9197-b50d-25a342966b37	testni uporabnik za Tehničnega vodjo	$2y$05$NS4xMjkyMTcwMzExMjAxROu/kXWR9sP9oamkesKuxXLbxkCb387.G	t	\N	\N	\N	tona@ifigenija.si	\N	\N	\N
00010000-55fa-9197-4c35-ec25012c272c	testni uporabnik za igralca	$2y$05$NS4xMjkyMTcwMzExMjAxRO/hLCgClfERRsfCAFYwxNCcFIVjP2982	t	\N	\N	\N	irena@ifigenija.si	\N	\N	\N
00010000-55fa-9197-18e0-c3cab9912d01	testni uporabnik vnašalca termina storitev (TerminStoritve-vse)	$2y$05$NS4xMjkyMTcwMzExMjAxROT6.kTHqEq4.wa2SOnf124/N14m9qeP.	t	\N	\N	\N	tatjana@ifigenija.si	\N	\N	\N
00010000-55fa-9197-f409-0d3ad5b9ccd9	testni uporabnik, ki je inšpicient brez zapisov v TerminStoritve	$2y$05$NS4xMjkyMTcwMzExMjAxROHau47Dtb7CME5.nlWwBVM.nusFP.ra2	t	\N	\N	\N	joze@ifigenija.si	\N	\N	\N
00010000-55fa-9197-0490-68c05940d29a	testna uporabnica, ki je planerka	$2y$05$NS4xMjkyMTcwMzExMjAxRO.B/uJO3C7QRNhdX9Q2hTLQsSupj1V1S	t	\N	\N	\N	petra@ifigenija.si	\N	\N	\N
00010000-55fa-9197-280d-d46ff045848f	testni uporabnik, ki dobi ifi-all vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROv2d7jqhaV/Mz3EIsKoi7UoFR.SDSMBm	t	\N	\N	\N	ali@ifigenija.si	\N	\N	\N
00010000-55fa-9197-64b6-baecd73383f4	testni uporabnik, ki dobi ifi-readall vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROYB9g.gnkufr1l/gWK6mkx.ySqrOWnJC	t	\N	\N	\N	berta@ifigenija.si	\N	\N	\N
00010000-55fa-9197-2287-c9c347bfe25a	testni uporabnik, ki dobi aaa-write dovoljenje	$2y$05$NS4xMjkyMTcwMzExMjAxRORujYObKX.DzpXVYbePkiJkHqg0/Ylya	t	\N	\N	\N	aaron@ifigenija.si	\N	\N	\N
00010000-55fa-9197-d9dc-72c450d0074d	testni uporabnik ki dobi vsa posamezna dovoljenja	$2y$05$NS4xMjkyMTcwMzExMjAxRO2ymwxVXTr7U4Ncdn.bN49E8rLw9Jg0O	t	\N	\N	\N	vesna@ifigenija.si	\N	\N	\N
00010000-55fa-9196-5d44-c29762855ac5	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 2978 (class 0 OID 19924095)
-- Dependencies: 224
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, producent_id, sifra, faza, naslov, podnaslov, delovninaslov, internacionalninaslov, naslovizvirnika, podnaslovizvirnika, datumzacstudija, stevilovaj, planiranostevilovaj, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, krstna, prvaslovenska, kratkinaslov, maticnioder_id) FROM stdin;
000e0000-55fa-9197-12f5-5672d9757abe	00160000-55fa-9197-b5af-e16534c21ea2	\N	00140000-55fa-9195-7d83-2cb8fb162851	\N	0001	produkcija	Sen kresne noči		Sanje	\N	\N	\N	2016-02-01	\N	\N	2016-06-01	1	William Shakespeare	f	2				\N	f	\N	\N		00220000-55fa-9197-28bb-021cee5be3bc
000e0000-55fa-9197-8c3a-c7ae0414a57d	00160000-55fa-9197-f78d-9753c2360f25	\N	00140000-55fa-9195-8613-7633e6ad78c2	\N	0002	predprodukcija-ideja	Smoletov vrt			\N	\N	\N	2016-01-01	\N	\N	2016-04-20	2	B. Hočevar	f	2				\N	f	\N	\N		00220000-55fa-9197-0886-49d264fcd900
000e0000-55fa-9197-b365-92ea5a43a2c1	\N	\N	00140000-55fa-9195-8613-7633e6ad78c2	00190000-55fa-9197-6838-b9b818c3128c	0003	postprodukcija	Kisli maček			\N	\N	\N	2016-02-01	\N	\N	2016-04-20	2	Caryl Churchill	t	2				\N	f	\N	\N		00220000-55fa-9197-28bb-021cee5be3bc
000e0000-55fa-9197-f4c0-1b06cc5d4fec	\N	\N	00140000-55fa-9195-8613-7633e6ad78c2	00190000-55fa-9197-6838-b9b818c3128c	0004	postprodukcija	Vladimir			\N	\N	\N	2017-03-01	\N	\N	2017-04-20	2	Matjaž Zupančič	t	2				\N	f	\N	\N		00220000-55fa-9197-28bb-021cee5be3bc
000e0000-55fa-9197-605f-6bf765ffab28	\N	\N	00140000-55fa-9195-8613-7633e6ad78c2	00190000-55fa-9197-6838-b9b818c3128c	0005	postprodukcija	Španska princesa			\N	\N	\N	2017-04-01	\N	\N	2017-05-20	1	Nina Kokelj	f	1				\N	f	\N	\N		00220000-55fa-9197-40a0-b557c97c95a5
000e0000-55fa-9197-a672-3176b5e4c870	\N	\N	00140000-55fa-9195-8613-7633e6ad78c2	00190000-55fa-9197-6838-b9b818c3128c	0006	postprodukcija	Ne vemo datumov			\N	\N	\N	\N	\N	\N	\N	1	Nandi Frafar	f	1				\N	f	\N	\N		00220000-55fa-9197-40a0-b557c97c95a5
\.


--
-- TOC entry 2948 (class 0 OID 19923786)
-- Dependencies: 194
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, uprizoritev_id, vrsta, zaporedna, porocilo) FROM stdin;
00200000-55fa-9197-cbcf-1378c6518a92	000e0000-55fa-9197-8c3a-c7ae0414a57d	\N	1	
00200000-55fa-9197-8eb7-038dd28b8967	000e0000-55fa-9197-8c3a-c7ae0414a57d	\N	2	
00200000-55fa-9197-f72f-2c35339303ad	000e0000-55fa-9197-8c3a-c7ae0414a57d	\N	3	
00200000-55fa-9197-05dd-1a0ea29250cb	000e0000-55fa-9197-8c3a-c7ae0414a57d	\N	4	
00200000-55fa-9197-f5b8-8d5b5044d9a2	000e0000-55fa-9197-8c3a-c7ae0414a57d	\N	5	
\.


--
-- TOC entry 2962 (class 0 OID 19923913)
-- Dependencies: 208
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 2972 (class 0 OID 19924019)
-- Dependencies: 218
-- Data for Name: vrstastroska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstastroska (id, skupina, podskupina, naziv, opis) FROM stdin;
003b0000-55fa-9196-5d90-ee71af2a419d	1	0	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE
003b0000-55fa-9196-8e4c-3680949c5c36	1	1	Storitve varovanja zgradb in prostorov	storitve varovanja zgradb in prostorov (npr. gasilci na predstavah)
003b0000-55fa-9196-1987-5d401d5c703a	1	2	Založniške in tiskarske storitve	založniške in tiskarske storitve
003b0000-55fa-9196-c56d-61a91884858a	1	3	Časopisi, revije, knjige in strokovna literatura	časopisi, revije, knjige in strokovna literatura
003b0000-55fa-9196-2083-33e0cbb94745	1	4	Stroški prevajalskih storitev	stroški prevajalskih storitev
003b0000-55fa-9196-30b3-00bb2ca61f8e	1	5	Stroški oglaševalskih storitev	stroški oglaševalskih storitev
003b0000-55fa-9196-0615-d7a93521a405	1	6	Izdatki za reprezentanco	izdatki za reprezentanco
003b0000-55fa-9196-9218-e25c0eeb4935	2	0	POSEBNI MATERIAL IN STORITVE	POSEBNI MATERIAL IN STORITVE
003b0000-55fa-9196-9510-e97baa9767e6	2	1	Drugi posebni material in storitve	drugi posebni material in storitve (npr. za instrumete - navedite)
003b0000-55fa-9196-3ba1-93c10280c638	2	2	Oprema predstave – stroški rekvizitov	Oprema predstave – stroški rekvizitov
003b0000-55fa-9196-af13-487dddfdeff7	2	3	Oprema predstave – stroški kostumov	Oprema predstave – stroški kostumov
003b0000-55fa-9196-bdc8-e865b106290e	2	4	Oprema predstave – stroški scenske opreme	Oprema predstave – stroški scenske opreme
003b0000-55fa-9196-85c7-49c01cffb428	2	5	Oprema predstave – stroški avdio in video opreme	Oprema predstave – stroški avdio in video opreme
003b0000-55fa-9196-2ef8-c55348d0efb6	3	0	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE
003b0000-55fa-9196-cc90-6719f30ecc48	3	1	Poštnina in kurirske storitve	poštnina in kurirske storitve
003b0000-55fa-9196-1496-a740a02a3f44	4	0	PREVOZNI STROŠKI IN STORITVE	PREVOZNI STROŠKI IN STORITVE
003b0000-55fa-9196-75d4-a65a17e3b5f4	4	1	Goriva in maziva za prevozna sredstva	goriva in maziva za prevozna sredstva
003b0000-55fa-9196-e41b-aefcff7a0511	4	2	Najem vozil in selitveni stroški	najem vozil in selitveni stroški
003b0000-55fa-9196-b22e-c7bfde57bf67	4	3	Drugi prevozni in transportni stroški 	drugi prevozni in transportni stroški (navedite)
003b0000-55fa-9196-247a-0ad8b1e8ead5	5	0	IZDATKI ZA SLUŽBENA POTOVANJA	IZDATKI ZA SLUŽBENA POTOVANJA
003b0000-55fa-9196-f149-078b6544c658	5	1	Dnevnice za službena potovanja v državi in tujini	dnevnice za službena potovanja v državi in tujini
003b0000-55fa-9196-427e-3b08e5438d8b	5	2	Hotelske in restavra. storitve v državi in tujini	hotelske in restavra. storitve v državi in tujini
003b0000-55fa-9196-12da-026da2334787	5	3	Stroški prevoza v državi in tujini	stroški prevoza v državi in tujini
003b0000-55fa-9196-284d-9865386e6389	5	4	Drugi izdatki za službena potovanja	drugi izdatki za službena potovanja (navedite)
003b0000-55fa-9196-42a7-2dbfc52c845d	6	0	NAJEMNINE IN ZAKUPNINE	NAJEMNINE IN ZAKUPNINE
003b0000-55fa-9196-20e4-e72584be92df	6	1	Druge najemnine, zakupnine in licenčnine	druge najemnine, zakupnine in licenčnine (npr. najem notnega materiala, instrumentov - navedite)
003b0000-55fa-9196-35e0-16472692c859	7	0	DRUGI OPERATIVNI ODHODKI	DRUGI OPERATIVNI ODHODKI
003b0000-55fa-9196-a28a-a6260b081351	7	1	Izdatki za strok. izobraževanje zap.	izdatki za strok. izobraževanje zap.(vezani na program. enote)  
\.


--
-- TOC entry 2990 (class 0 OID 19924337)
-- Dependencies: 236
-- Data for Name: vrstazapisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstazapisa (id, oznaka, naziv, aktiven, znacka, ikona, upor, datknj) FROM stdin;
\.


--
-- TOC entry 2989 (class 0 OID 19924309)
-- Dependencies: 235
-- Data for Name: zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapis (id, vrsta_id, datoteka_id, mapa_id, avtor_id, zaklenil_id, tip, zaklenjen, datumzaklepanja, identifier, subject, title, description, coverage, creator, language, date, publisher, relation, rights, source, upor, datknj, standard, lokacija) FROM stdin;
\.


--
-- TOC entry 2991 (class 0 OID 19924349)
-- Dependencies: 237
-- Data for Name: zapislastnik; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapislastnik (id, zapis_id, lastnik, classlastnika, datum, upor, datknj) FROM stdin;
\.


--
-- TOC entry 2969 (class 0 OID 19923985)
-- Dependencies: 215
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, sifra, status, delovnomesto, zacetek, konec, tip, delovnaobveza, malica, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci) FROM stdin;
00100000-55fa-9197-229d-8e004cc8b2d8	00090000-55fa-9197-c038-bc91633aa30d	01	A	Mojster	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55fa-9197-8fca-d669444108b7	00090000-55fa-9197-76dc-1d2eaa6bc8ee	02	A	Igralec	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55fa-9197-d2e7-8f99c7aab92e	00090000-55fa-9197-c768-f9b91d144670	03	A	Natakar	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55fa-9197-ffb2-4134f17da066	00090000-55fa-9197-613d-e8b869c72314	04	A	Mizar	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55fa-9197-115d-9481f65e946d	00090000-55fa-9197-2477-10d1d339769b	05	A	Šivilja	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55fa-9197-b262-b74b7b5ea276	00090000-55fa-9197-ec1c-5fb054a7021e	06	A	Inšpicient	2010-02-01	2010-02-01	1	2		t	f	f	t
\.


--
-- TOC entry 2950 (class 0 OID 19923822)
-- Dependencies: 196
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id) FROM stdin;
\.


--
-- TOC entry 2977 (class 0 OID 19924085)
-- Dependencies: 223
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, sifra, naziv, opis) FROM stdin;
00140000-55fa-9195-7d83-2cb8fb162851	01	Drama	drama (SURS 01)
00140000-55fa-9195-c79a-7a3f5f5e2f1e	02	Opera	opera (SURS 02)
00140000-55fa-9195-caf2-b431aa541e8e	03	Balet	balet (SURS 03)
00140000-55fa-9195-b4ea-bd5cb176b45f	04	Plesne prireditve	plesne prireditve (SURS 04)
00140000-55fa-9195-7f31-3d8040138872	05	Lutkovno gledališče	lutkovno gledališče (SURS 05)
00140000-55fa-9195-8613-7633e6ad78c2	06	Raziskovalno gledališče	raziskovalno gledališče (SURS 06)
00140000-55fa-9195-d183-be9a8714cd78	07	Drugo	drugo (SURS 07)
\.


--
-- TOC entry 2968 (class 0 OID 19923975)
-- Dependencies: 214
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, sifra, naziv, opis) FROM stdin;
\.


--
-- TOC entry 2476 (class 2606 OID 19923623)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2654 (class 2606 OID 19924144)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2650 (class 2606 OID 19924134)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2624 (class 2606 OID 19924044)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2711 (class 2606 OID 19924389)
-- Name: datoteka_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT datoteka_pkey PRIMARY KEY (id);


--
-- TOC entry 2530 (class 2606 OID 19923811)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2544 (class 2606 OID 19923831)
-- Name: dogodeksplosni_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodeksplosni
    ADD CONSTRAINT dogodeksplosni_pkey PRIMARY KEY (id);


--
-- TOC entry 2687 (class 2606 OID 19924307)
-- Name: drugivir_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT drugivir_pkey PRIMARY KEY (id);


--
-- TOC entry 2510 (class 2606 OID 19923748)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2661 (class 2606 OID 19924199)
-- Name: enotaprograma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT enotaprograma_pkey PRIMARY KEY (id);


--
-- TOC entry 2602 (class 2606 OID 19923971)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2524 (class 2606 OID 19923784)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2518 (class 2606 OID 19923762)
-- Name: kontaktnaoseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT kontaktnaoseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2566 (class 2606 OID 19923878)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2705 (class 2606 OID 19924366)
-- Name: mapa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT mapa_pkey PRIMARY KEY (id);


--
-- TOC entry 2709 (class 2606 OID 19924373)
-- Name: mapa_zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT mapa_zapis_pkey PRIMARY KEY (mapa_id, zapis_id);


--
-- TOC entry 2716 (class 2606 OID 19924397)
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
-- TOC entry 2578 (class 2606 OID 19923905)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2503 (class 2606 OID 19923720)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2480 (class 2606 OID 19923632)
-- Name: optionvalue_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT optionvalue_pkey PRIMARY KEY (id);


--
-- TOC entry 2483 (class 2606 OID 19923656)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2474 (class 2606 OID 19923612)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2467 (class 2606 OID 19923597)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2581 (class 2606 OID 19923911)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2595 (class 2606 OID 19923947)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2636 (class 2606 OID 19924080)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2492 (class 2606 OID 19923684)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2500 (class 2606 OID 19923708)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2671 (class 2606 OID 19924260)
-- Name: postavkacdve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkacdve
    ADD CONSTRAINT postavkacdve_pkey PRIMARY KEY (id);


--
-- TOC entry 2570 (class 2606 OID 19923884)
-- Name: postavkaracuna_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT postavkaracuna_pkey PRIMARY KEY (id);


--
-- TOC entry 2498 (class 2606 OID 19923698)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2522 (class 2606 OID 19923772)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2576 (class 2606 OID 19923896)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2675 (class 2606 OID 19924269)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2677 (class 2606 OID 19924277)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2668 (class 2606 OID 19924247)
-- Name: programdela_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT programdela_pkey PRIMARY KEY (id);


--
-- TOC entry 2682 (class 2606 OID 19924288)
-- Name: programskaenotasklopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT programskaenotasklopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2588 (class 2606 OID 19923929)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2564 (class 2606 OID 19923869)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2558 (class 2606 OID 19923860)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2631 (class 2606 OID 19924068)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2615 (class 2606 OID 19924002)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2459 (class 2606 OID 19923568)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2593 (class 2606 OID 19923938)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2465 (class 2606 OID 19923586)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2469 (class 2606 OID 19923606)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2600 (class 2606 OID 19923956)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2572 (class 2606 OID 19923891)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2546 (class 2606 OID 19923840)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2456 (class 2606 OID 19923556)
-- Name: stevilcenje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenje
    ADD CONSTRAINT stevilcenje_pkey PRIMARY KEY (id);


--
-- TOC entry 2453 (class 2606 OID 19923544)
-- Name: stevilcenjekonfig_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT stevilcenjekonfig_pkey PRIMARY KEY (id);


--
-- TOC entry 2450 (class 2606 OID 19923538)
-- Name: stevilcenjestanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjestanje
    ADD CONSTRAINT stevilcenjestanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2620 (class 2606 OID 19924015)
-- Name: strosekuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT strosekuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2489 (class 2606 OID 19923665)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2552 (class 2606 OID 19923851)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2627 (class 2606 OID 19924055)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2684 (class 2606 OID 19924300)
-- Name: tipprogramskeenote_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipprogramskeenote
    ADD CONSTRAINT tipprogramskeenote_pkey PRIMARY KEY (id);


--
-- TOC entry 2508 (class 2606 OID 19923733)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2461 (class 2606 OID 19923581)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2648 (class 2606 OID 19924113)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2528 (class 2606 OID 19923794)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2584 (class 2606 OID 19923919)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2622 (class 2606 OID 19924027)
-- Name: vrstastroska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstastroska
    ADD CONSTRAINT vrstastroska_pkey PRIMARY KEY (id);


--
-- TOC entry 2698 (class 2606 OID 19924347)
-- Name: vrstazapisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstazapisa
    ADD CONSTRAINT vrstazapisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2695 (class 2606 OID 19924331)
-- Name: zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT zapis_pkey PRIMARY KEY (id);


--
-- TOC entry 2701 (class 2606 OID 19924355)
-- Name: zapislastnik_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT zapislastnik_pkey PRIMARY KEY (id);


--
-- TOC entry 2611 (class 2606 OID 19923993)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2542 (class 2606 OID 19923826)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2640 (class 2606 OID 19924093)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2608 (class 2606 OID 19923983)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2531 (class 1259 OID 19923820)
-- Name: dogodki_konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_konec ON dogodek USING btree (konec);


--
-- TOC entry 2532 (class 1259 OID 19923821)
-- Name: dogodki_razred; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_razred ON dogodek USING btree (razred);


--
-- TOC entry 2533 (class 1259 OID 19923819)
-- Name: dogodki_zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2534 (class 1259 OID 19923818)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2535 (class 1259 OID 19923817)
-- Name: idx_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2616 (class 1259 OID 19924016)
-- Name: idx_11ffe6e05c75296c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e05c75296c ON strosekuprizoritve USING btree (vrstastroska_id);


--
-- TOC entry 2617 (class 1259 OID 19924017)
-- Name: idx_11ffe6e062b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e062b4ffca ON strosekuprizoritve USING btree (uprizoritev_id);


--
-- TOC entry 2618 (class 1259 OID 19924018)
-- Name: idx_11ffe6e06beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e06beede51 ON strosekuprizoritve USING btree (popa_id);


--
-- TOC entry 2702 (class 1259 OID 19924368)
-- Name: idx_14a5d6d3727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d3727aca70 ON mapa USING btree (parent_id);


--
-- TOC entry 2703 (class 1259 OID 19924367)
-- Name: idx_14a5d6d38a4a6c12; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d38a4a6c12 ON mapa USING btree (lastnik_id);


--
-- TOC entry 2490 (class 1259 OID 19923686)
-- Name: idx_1c7adba5ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba5ee4b985a ON popa USING btree (drzava_id);


--
-- TOC entry 2579 (class 1259 OID 19923912)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2689 (class 1259 OID 19924335)
-- Name: idx_1ed92829253c4123; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829253c4123 ON zapis USING btree (avtor_id);


--
-- TOC entry 2690 (class 1259 OID 19924334)
-- Name: idx_1ed9282957ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282957ed422f ON zapis USING btree (mapa_id);


--
-- TOC entry 2691 (class 1259 OID 19924336)
-- Name: idx_1ed9282987ff3295; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282987ff3295 ON zapis USING btree (zaklenil_id);


--
-- TOC entry 2692 (class 1259 OID 19924333)
-- Name: idx_1ed92829a54dbb1f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829a54dbb1f ON zapis USING btree (datoteka_id);


--
-- TOC entry 2693 (class 1259 OID 19924332)
-- Name: idx_1ed92829ef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829ef943358 ON zapis USING btree (vrsta_id);


--
-- TOC entry 2573 (class 1259 OID 19923898)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2574 (class 1259 OID 19923897)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2526 (class 1259 OID 19923795)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2603 (class 1259 OID 19923972)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2604 (class 1259 OID 19923974)
-- Name: idx_23aeb9586b361365; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9586b361365 ON funkcija USING btree (tipfunkcije_id);


--
-- TOC entry 2605 (class 1259 OID 19923973)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2515 (class 1259 OID 19923764)
-- Name: idx_2942b10710389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b10710389148 ON kontaktnaoseba USING btree (oseba_id);


--
-- TOC entry 2516 (class 1259 OID 19923763)
-- Name: idx_2942b1076beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b1076beede51 ON kontaktnaoseba USING btree (popa_id);


--
-- TOC entry 2680 (class 1259 OID 19924289)
-- Name: idx_2d901816d6bc69d6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2d901816d6bc69d6 ON programskaenotasklopa USING btree (programrazno_id);


--
-- TOC entry 2632 (class 1259 OID 19924082)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2633 (class 1259 OID 19924083)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2634 (class 1259 OID 19924084)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2699 (class 1259 OID 19924356)
-- Name: idx_2eaff9dcaf91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2eaff9dcaf91ecd ON zapislastnik USING btree (zapis_id);


--
-- TOC entry 2641 (class 1259 OID 19924118)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2642 (class 1259 OID 19924115)
-- Name: idx_344a77a7c3b0d59; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a7c3b0d59 ON uprizoritev USING btree (maticnioder_id);


--
-- TOC entry 2643 (class 1259 OID 19924119)
-- Name: idx_344a77a853a965c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a853a965c ON uprizoritev USING btree (producent_id);


--
-- TOC entry 2644 (class 1259 OID 19924117)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2645 (class 1259 OID 19924116)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2505 (class 1259 OID 19923735)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2506 (class 1259 OID 19923734)
-- Name: idx_37f6541a6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a6beede51 ON trr USING btree (popa_id);


--
-- TOC entry 2481 (class 1259 OID 19923659)
-- Name: idx_466966d769e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_466966d769e8d4 ON oseba USING btree (naslov_id);


--
-- TOC entry 2591 (class 1259 OID 19923939)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2471 (class 1259 OID 19923613)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2472 (class 1259 OID 19923614)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2596 (class 1259 OID 19923959)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2597 (class 1259 OID 19923958)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2598 (class 1259 OID 19923957)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2519 (class 1259 OID 19923773)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2520 (class 1259 OID 19923774)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2451 (class 1259 OID 19923546)
-- Name: idx_6054e804ff55f926; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_6054e804ff55f926 ON stevilcenjekonfig USING btree (stevilcenje_id);


--
-- TOC entry 2553 (class 1259 OID 19923864)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2554 (class 1259 OID 19923862)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2555 (class 1259 OID 19923861)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2556 (class 1259 OID 19923863)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2462 (class 1259 OID 19923587)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2463 (class 1259 OID 19923588)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2582 (class 1259 OID 19923920)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2712 (class 1259 OID 19924390)
-- Name: idx_781826c67e3c61f9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_781826c67e3c61f9 ON datoteka USING btree (owner_id);


--
-- TOC entry 2713 (class 1259 OID 19924398)
-- Name: idx_7adc957157ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc957157ed422f ON mapaacl USING btree (mapa_id);


--
-- TOC entry 2714 (class 1259 OID 19924399)
-- Name: idx_7adc9571fa6311ef; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc9571fa6311ef ON mapaacl USING btree (perm_id);


--
-- TOC entry 2568 (class 1259 OID 19923885)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2612 (class 1259 OID 19924003)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2613 (class 1259 OID 19924004)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2662 (class 1259 OID 19924204)
-- Name: idx_8787a0e54ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e54ae1cd1c ON enotaprograma USING btree (gostitelj_id);


--
-- TOC entry 2663 (class 1259 OID 19924203)
-- Name: idx_8787a0e55d0da56c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e55d0da56c ON enotaprograma USING btree (drzavagostovanja_id);


--
-- TOC entry 2664 (class 1259 OID 19924200)
-- Name: idx_8787a0e562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e562b4ffca ON enotaprograma USING btree (uprizoritev_id);


--
-- TOC entry 2665 (class 1259 OID 19924201)
-- Name: idx_8787a0e57222d84b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e57222d84b ON enotaprograma USING btree (tipprogramskeenote_id);


--
-- TOC entry 2666 (class 1259 OID 19924202)
-- Name: idx_8787a0e5771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e5771ec7bd ON enotaprograma USING btree (program_dela_id);


--
-- TOC entry 2494 (class 1259 OID 19923700)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2495 (class 1259 OID 19923699)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2496 (class 1259 OID 19923701)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2585 (class 1259 OID 19923933)
-- Name: idx_952dd21969e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd21969e8d4 ON prostor USING btree (naslov_id);


--
-- TOC entry 2586 (class 1259 OID 19923932)
-- Name: idx_952dd2196beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd2196beede51 ON prostor USING btree (popa_id);


--
-- TOC entry 2672 (class 1259 OID 19924270)
-- Name: idx_97af082e38c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e38c06eb ON produkcijadelitev USING btree (enotaprograma_id);


--
-- TOC entry 2673 (class 1259 OID 19924271)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2655 (class 1259 OID 19924148)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2656 (class 1259 OID 19924149)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2657 (class 1259 OID 19924146)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2658 (class 1259 OID 19924147)
-- Name: idx_a4b7244fa4976613; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fa4976613 ON alternacija USING btree (zaposlitev_id);


--
-- TOC entry 2609 (class 1259 OID 19923994)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2559 (class 1259 OID 19923873)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2560 (class 1259 OID 19923872)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2561 (class 1259 OID 19923870)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2562 (class 1259 OID 19923871)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2651 (class 1259 OID 19924136)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2652 (class 1259 OID 19924135)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2525 (class 1259 OID 19923785)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2669 (class 1259 OID 19924261)
-- Name: idx_dba42fe79e3adf2c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_dba42fe79e3adf2c ON postavkacdve USING btree (programdela_id);


--
-- TOC entry 2688 (class 1259 OID 19924308)
-- Name: idx_e7d4cf2638c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e7d4cf2638c06eb ON drugivir USING btree (enotaprograma_id);


--
-- TOC entry 2706 (class 1259 OID 19924374)
-- Name: idx_e9f8ee8257ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee8257ed422f ON mapa_zapis USING btree (mapa_id);


--
-- TOC entry 2707 (class 1259 OID 19924375)
-- Name: idx_e9f8ee82af91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee82af91ecd ON mapa_zapis USING btree (zapis_id);


--
-- TOC entry 2477 (class 1259 OID 19923634)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2478 (class 1259 OID 19923633)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2486 (class 1259 OID 19923666)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2487 (class 1259 OID 19923667)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2548 (class 1259 OID 19923854)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2549 (class 1259 OID 19923853)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2550 (class 1259 OID 19923852)
-- Name: idx_fef7d84ba81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84ba81ccef6 ON terminstoritve USING btree (dogodek_id);


--
-- TOC entry 2536 (class 1259 OID 19923813)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2537 (class 1259 OID 19923814)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2538 (class 1259 OID 19923812)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2539 (class 1259 OID 19923816)
-- Name: uniq_11e93b5dbbc7a989; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dbbc7a989 ON dogodek USING btree (dogodek_splosni_id);


--
-- TOC entry 2540 (class 1259 OID 19923815)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2493 (class 1259 OID 19923685)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2511 (class 1259 OID 19923749)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2512 (class 1259 OID 19923751)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2513 (class 1259 OID 19923750)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2514 (class 1259 OID 19923752)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2567 (class 1259 OID 19923879)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2637 (class 1259 OID 19924081)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2646 (class 1259 OID 19924114)
-- Name: uniq_344a77a559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_344a77a559828a3 ON uprizoritev USING btree (sifra);


--
-- TOC entry 2628 (class 1259 OID 19924056)
-- Name: uniq_3f50510d559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d559828a3 ON tipfunkcije USING btree (sifra);


--
-- TOC entry 2629 (class 1259 OID 19924057)
-- Name: uniq_3f50510d55cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d55cca980 ON tipfunkcije USING btree (ime);


--
-- TOC entry 2484 (class 1259 OID 19923657)
-- Name: uniq_466966d7559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7559828a3 ON oseba USING btree (sifra);


--
-- TOC entry 2485 (class 1259 OID 19923658)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2606 (class 1259 OID 19923984)
-- Name: uniq_5216fcb0559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5216fcb0559828a3 ON zvrstuprizoritve USING btree (sifra);


--
-- TOC entry 2457 (class 1259 OID 19923557)
-- Name: uniq_5a434fbc559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5a434fbc559828a3 ON stevilcenje USING btree (sifra);


--
-- TOC entry 2504 (class 1259 OID 19923721)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2454 (class 1259 OID 19923545)
-- Name: uniq_6054e804889a7556; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_6054e804889a7556 ON stevilcenjekonfig USING btree (dok);


--
-- TOC entry 2685 (class 1259 OID 19924301)
-- Name: uniq_7d834df4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_7d834df4559828a3 ON tipprogramskeenote USING btree (sifra);


--
-- TOC entry 2589 (class 1259 OID 19923931)
-- Name: uniq_952dd21937854736; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21937854736 ON prostor USING btree (naziv);


--
-- TOC entry 2590 (class 1259 OID 19923930)
-- Name: uniq_952dd219559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd219559828a3 ON prostor USING btree (sifra);


--
-- TOC entry 2659 (class 1259 OID 19924145)
-- Name: uniq_a4b7244f559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a4b7244f559828a3 ON alternacija USING btree (sifra);


--
-- TOC entry 2501 (class 1259 OID 19923709)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2638 (class 1259 OID 19924094)
-- Name: uniq_cede8e36559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_cede8e36559828a3 ON zvrstsurs USING btree (sifra);


--
-- TOC entry 2696 (class 1259 OID 19924348)
-- Name: uniq_de1c8aa1d55226c7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_de1c8aa1d55226c7 ON vrstazapisa USING btree (oznaka);


--
-- TOC entry 2678 (class 1259 OID 19924278)
-- Name: uniq_e6fc2028559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc2028559828a3 ON produkcijskahisa USING btree (sifra);


--
-- TOC entry 2679 (class 1259 OID 19924279)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2625 (class 1259 OID 19924045)
-- Name: uniq_ec773670ca2e5fcb; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ec773670ca2e5fcb ON besedilo USING btree (stevilka);


--
-- TOC entry 2547 (class 1259 OID 19923841)
-- Name: uniq_ecc8f8c5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ecc8f8c5559828a3 ON sezona USING btree (sifra);


--
-- TOC entry 2470 (class 1259 OID 19923607)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2745 (class 2606 OID 19924520)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2744 (class 2606 OID 19924525)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2740 (class 2606 OID 19924545)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2746 (class 2606 OID 19924515)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2742 (class 2606 OID 19924535)
-- Name: fk_11e93b5dbbc7a989; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dbbc7a989 FOREIGN KEY (dogodek_splosni_id) REFERENCES dogodeksplosni(id);


--
-- TOC entry 2741 (class 2606 OID 19924540)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2743 (class 2606 OID 19924530)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2778 (class 2606 OID 19924695)
-- Name: fk_11ffe6e05c75296c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e05c75296c FOREIGN KEY (vrstastroska_id) REFERENCES vrstastroska(id);


--
-- TOC entry 2777 (class 2606 OID 19924700)
-- Name: fk_11ffe6e062b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e062b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2776 (class 2606 OID 19924705)
-- Name: fk_11ffe6e06beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e06beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2810 (class 2606 OID 19924870)
-- Name: fk_14a5d6d3727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d3727aca70 FOREIGN KEY (parent_id) REFERENCES mapa(id);


--
-- TOC entry 2811 (class 2606 OID 19924865)
-- Name: fk_14a5d6d38a4a6c12; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d38a4a6c12 FOREIGN KEY (lastnik_id) REFERENCES uporabniki(id);


--
-- TOC entry 2728 (class 2606 OID 19924455)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2762 (class 2606 OID 19924625)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2805 (class 2606 OID 19924850)
-- Name: fk_1ed92829253c4123; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829253c4123 FOREIGN KEY (avtor_id) REFERENCES uporabniki(id);


--
-- TOC entry 2806 (class 2606 OID 19924845)
-- Name: fk_1ed9282957ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282957ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2804 (class 2606 OID 19924855)
-- Name: fk_1ed9282987ff3295; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282987ff3295 FOREIGN KEY (zaklenil_id) REFERENCES uporabniki(id);


--
-- TOC entry 2807 (class 2606 OID 19924840)
-- Name: fk_1ed92829a54dbb1f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829a54dbb1f FOREIGN KEY (datoteka_id) REFERENCES datoteka(id);


--
-- TOC entry 2808 (class 2606 OID 19924835)
-- Name: fk_1ed92829ef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829ef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstazapisa(id);


--
-- TOC entry 2760 (class 2606 OID 19924620)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2761 (class 2606 OID 19924615)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2739 (class 2606 OID 19924510)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2772 (class 2606 OID 19924665)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2770 (class 2606 OID 19924675)
-- Name: fk_23aeb9586b361365; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9586b361365 FOREIGN KEY (tipfunkcije_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2771 (class 2606 OID 19924670)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2734 (class 2606 OID 19924490)
-- Name: fk_2942b10710389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b10710389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2735 (class 2606 OID 19924485)
-- Name: fk_2942b1076beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b1076beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2758 (class 2606 OID 19924605)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2802 (class 2606 OID 19924825)
-- Name: fk_2d901816d6bc69d6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT fk_2d901816d6bc69d6 FOREIGN KEY (programrazno_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2781 (class 2606 OID 19924710)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2780 (class 2606 OID 19924715)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2779 (class 2606 OID 19924720)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 2809 (class 2606 OID 19924860)
-- Name: fk_2eaff9dcaf91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT fk_2eaff9dcaf91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id);


--
-- TOC entry 2783 (class 2606 OID 19924740)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2786 (class 2606 OID 19924725)
-- Name: fk_344a77a7c3b0d59; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a7c3b0d59 FOREIGN KEY (maticnioder_id) REFERENCES prostor(id);


--
-- TOC entry 2782 (class 2606 OID 19924745)
-- Name: fk_344a77a853a965c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a853a965c FOREIGN KEY (producent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2784 (class 2606 OID 19924735)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2785 (class 2606 OID 19924730)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2732 (class 2606 OID 19924480)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2733 (class 2606 OID 19924475)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2724 (class 2606 OID 19924440)
-- Name: fk_466966d769e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d769e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2725 (class 2606 OID 19924435)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2766 (class 2606 OID 19924645)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2721 (class 2606 OID 19924415)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2720 (class 2606 OID 19924420)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2767 (class 2606 OID 19924660)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2768 (class 2606 OID 19924655)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2769 (class 2606 OID 19924650)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2737 (class 2606 OID 19924495)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2736 (class 2606 OID 19924500)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2717 (class 2606 OID 19924400)
-- Name: fk_6054e804ff55f926; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT fk_6054e804ff55f926 FOREIGN KEY (stevilcenje_id) REFERENCES stevilcenje(id);


--
-- TOC entry 2750 (class 2606 OID 19924580)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2752 (class 2606 OID 19924570)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2753 (class 2606 OID 19924565)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2751 (class 2606 OID 19924575)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2719 (class 2606 OID 19924405)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2718 (class 2606 OID 19924410)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2763 (class 2606 OID 19924630)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2814 (class 2606 OID 19924885)
-- Name: fk_781826c67e3c61f9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT fk_781826c67e3c61f9 FOREIGN KEY (owner_id) REFERENCES uporabniki(id);


--
-- TOC entry 2816 (class 2606 OID 19924890)
-- Name: fk_7adc957157ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc957157ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2815 (class 2606 OID 19924895)
-- Name: fk_7adc9571fa6311ef; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc9571fa6311ef FOREIGN KEY (perm_id) REFERENCES permission(id);


--
-- TOC entry 2759 (class 2606 OID 19924610)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2775 (class 2606 OID 19924685)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2774 (class 2606 OID 19924690)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2793 (class 2606 OID 19924800)
-- Name: fk_8787a0e54ae1cd1c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e54ae1cd1c FOREIGN KEY (gostitelj_id) REFERENCES popa(id);


--
-- TOC entry 2794 (class 2606 OID 19924795)
-- Name: fk_8787a0e55d0da56c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e55d0da56c FOREIGN KEY (drzavagostovanja_id) REFERENCES drza(id);


--
-- TOC entry 2797 (class 2606 OID 19924780)
-- Name: fk_8787a0e562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2796 (class 2606 OID 19924785)
-- Name: fk_8787a0e57222d84b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e57222d84b FOREIGN KEY (tipprogramskeenote_id) REFERENCES tipprogramskeenote(id);


--
-- TOC entry 2795 (class 2606 OID 19924790)
-- Name: fk_8787a0e5771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e5771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2730 (class 2606 OID 19924465)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2731 (class 2606 OID 19924460)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2729 (class 2606 OID 19924470)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2764 (class 2606 OID 19924640)
-- Name: fk_952dd21969e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd21969e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2765 (class 2606 OID 19924635)
-- Name: fk_952dd2196beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd2196beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2800 (class 2606 OID 19924810)
-- Name: fk_97af082e38c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e38c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2799 (class 2606 OID 19924815)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2790 (class 2606 OID 19924770)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2789 (class 2606 OID 19924775)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2792 (class 2606 OID 19924760)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 2791 (class 2606 OID 19924765)
-- Name: fk_a4b7244fa4976613; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fa4976613 FOREIGN KEY (zaposlitev_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2773 (class 2606 OID 19924680)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2754 (class 2606 OID 19924600)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2755 (class 2606 OID 19924595)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2757 (class 2606 OID 19924585)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2756 (class 2606 OID 19924590)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2787 (class 2606 OID 19924755)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2788 (class 2606 OID 19924750)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2738 (class 2606 OID 19924505)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2798 (class 2606 OID 19924805)
-- Name: fk_dba42fe79e3adf2c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkacdve
    ADD CONSTRAINT fk_dba42fe79e3adf2c FOREIGN KEY (programdela_id) REFERENCES programdela(id);


--
-- TOC entry 2801 (class 2606 OID 19924820)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2803 (class 2606 OID 19924830)
-- Name: fk_e7d4cf2638c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT fk_e7d4cf2638c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2813 (class 2606 OID 19924875)
-- Name: fk_e9f8ee8257ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee8257ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id) ON DELETE CASCADE;


--
-- TOC entry 2812 (class 2606 OID 19924880)
-- Name: fk_e9f8ee82af91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee82af91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id) ON DELETE CASCADE;


--
-- TOC entry 2722 (class 2606 OID 19924430)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2723 (class 2606 OID 19924425)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2727 (class 2606 OID 19924445)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2726 (class 2606 OID 19924450)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2747 (class 2606 OID 19924560)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2748 (class 2606 OID 19924555)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2749 (class 2606 OID 19924550)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- Completed on 2015-09-17 12:10:33 CEST

--
-- PostgreSQL database dump complete
--

