--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.9
-- Dumped by pg_dump version 9.3.9
-- Started on 2015-09-18 09:50:45 CEST

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

SET search_path = public, pg_catalog;

SET default_with_oids = false;

--
-- TOC entry 180 (class 1259 OID 4193919)
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
-- TOC entry 222 (class 1259 OID 4194399)
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
-- TOC entry 218 (class 1259 OID 4194337)
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
-- TOC entry 223 (class 1259 OID 4194412)
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
-- TOC entry 234 (class 1259 OID 4194614)
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
-- TOC entry 196 (class 1259 OID 4194116)
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
-- TOC entry 197 (class 1259 OID 4194142)
-- Name: dogodeksplosni; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodeksplosni (
    id uuid NOT NULL
);


--
-- TOC entry 231 (class 1259 OID 4194589)
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
-- TOC entry 187 (class 1259 OID 4194018)
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
-- TOC entry 228 (class 1259 OID 4194510)
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
-- TOC entry 225 (class 1259 OID 4194440)
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
-- TOC entry 191 (class 1259 OID 4194069)
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
-- TOC entry 190 (class 1259 OID 4194057)
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
-- TOC entry 208 (class 1259 OID 4194238)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 235 (class 1259 OID 4194629)
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
-- TOC entry 236 (class 1259 OID 4194641)
-- Name: mapa_zapis; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE mapa_zapis (
    mapa_id uuid NOT NULL,
    zapis_id uuid NOT NULL
);


--
-- TOC entry 237 (class 1259 OID 4194648)
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
-- TOC entry 211 (class 1259 OID 4194258)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 184 (class 1259 OID 4193973)
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
-- TOC entry 183 (class 1259 OID 4193962)
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
-- TOC entry 185 (class 1259 OID 4193985)
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
-- TOC entry 179 (class 1259 OID 4193910)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 178 (class 1259 OID 4193903)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 206 (class 1259 OID 4194221)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 202 (class 1259 OID 4194179)
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
-- TOC entry 217 (class 1259 OID 4194321)
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
-- TOC entry 181 (class 1259 OID 4193928)
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
-- TOC entry 189 (class 1259 OID 4194049)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 230 (class 1259 OID 4194575)
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
-- TOC entry 201 (class 1259 OID 4194173)
-- Name: postavkaracuna; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE postavkaracuna (
    id uuid NOT NULL,
    racun_id uuid
);


--
-- TOC entry 182 (class 1259 OID 4193947)
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
-- TOC entry 195 (class 1259 OID 4194106)
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
-- TOC entry 199 (class 1259 OID 4194160)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 233 (class 1259 OID 4194604)
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
-- TOC entry 232 (class 1259 OID 4194596)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    sifra character varying(4) NOT NULL,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 227 (class 1259 OID 4194467)
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
-- TOC entry 229 (class 1259 OID 4194565)
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
-- TOC entry 204 (class 1259 OID 4194196)
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
-- TOC entry 203 (class 1259 OID 4194187)
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
-- TOC entry 207 (class 1259 OID 4194228)
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
-- TOC entry 213 (class 1259 OID 4194279)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying,
    status character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 216 (class 1259 OID 4194311)
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
-- TOC entry 176 (class 1259 OID 4193884)
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
-- TOC entry 175 (class 1259 OID 4193882)
-- Name: revizije_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE revizije_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2998 (class 0 OID 0)
-- Dependencies: 175
-- Name: revizije_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE revizije_id_seq OWNED BY revizije.id;


--
-- TOC entry 210 (class 1259 OID 4194252)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 177 (class 1259 OID 4193893)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 174 (class 1259 OID 4193875)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 205 (class 1259 OID 4194209)
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
-- TOC entry 200 (class 1259 OID 4194167)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 193 (class 1259 OID 4194090)
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
-- TOC entry 170 (class 1259 OID 4193838)
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
-- TOC entry 171 (class 1259 OID 4193849)
-- Name: stevilcenjekonfig; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjekonfig (
    id uuid NOT NULL,
    stevilcenje_id uuid,
    dok character varying(100) DEFAULT NULL::character varying
);


--
-- TOC entry 172 (class 1259 OID 4193857)
-- Name: stevilcenjestanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjestanje (
    id uuid NOT NULL,
    objid uuid NOT NULL,
    leto integer NOT NULL,
    stevilka integer
);


--
-- TOC entry 212 (class 1259 OID 4194265)
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
-- TOC entry 186 (class 1259 OID 4194010)
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
-- TOC entry 198 (class 1259 OID 4194147)
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
-- TOC entry 215 (class 1259 OID 4194299)
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
-- TOC entry 226 (class 1259 OID 4194455)
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
-- TOC entry 188 (class 1259 OID 4194035)
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
-- TOC entry 173 (class 1259 OID 4193862)
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
-- TOC entry 220 (class 1259 OID 4194364)
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
-- TOC entry 192 (class 1259 OID 4194080)
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
-- TOC entry 209 (class 1259 OID 4194244)
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
-- TOC entry 214 (class 1259 OID 4194290)
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
-- TOC entry 239 (class 1259 OID 4194685)
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
-- TOC entry 238 (class 1259 OID 4194657)
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
-- TOC entry 240 (class 1259 OID 4194697)
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
-- TOC entry 221 (class 1259 OID 4194389)
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
-- TOC entry 194 (class 1259 OID 4194100)
-- Name: zasedenost; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zasedenost (
    id uuid NOT NULL,
    oseba_id uuid
);


--
-- TOC entry 219 (class 1259 OID 4194354)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 224 (class 1259 OID 4194430)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 2188 (class 2604 OID 4193887)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 2930 (class 0 OID 4193919)
-- Dependencies: 180
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
\.


--
-- TOC entry 2972 (class 0 OID 4194399)
-- Dependencies: 222
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, zaposlitev_id, oseba_id, pogodba_id, sifra, zaposlen, zacetek, konec, opomba, sort, privzeti, aktivna, imapogodbo, pomembna) FROM stdin;
000c0000-55fb-beee-ec80-4272bf6ba7da	000d0000-55fb-beee-78e6-96ca6c1983ba	\N	00090000-55fb-beee-5c42-55d8c6dcf886	000b0000-55fb-beee-3468-73d143a24fed	0001	f	\N	\N	\N	3	t	\N	t	t
000c0000-55fb-beee-be0a-636a87e77e8c	000d0000-55fb-beee-e9ac-71d6aa1a166a	00100000-55fb-beee-05c6-7b8d2612ba80	00090000-55fb-beee-1ad4-d4a6f82dfe6a	\N	0002	t	2016-01-01	\N	\N	8	t	\N	f	f
000c0000-55fb-beee-db14-762057c0615a	000d0000-55fb-beee-d1de-caaffba93591	00100000-55fb-beee-79eb-34b1a3407d14	00090000-55fb-beee-046a-aaceff18e209	\N	0003	t	\N	2015-09-18	\N	2	t	\N	f	f
000c0000-55fb-beee-4fd5-9c34b5f08186	000d0000-55fb-beee-cb8f-080f1fb3f7a2	\N	00090000-55fb-beee-1e00-8a6645cd8d76	\N	0004	f	2016-01-01	2016-01-01	\N	26	t	\N	f	f
000c0000-55fb-beee-157f-e2bd4d9b8389	000d0000-55fb-beee-c421-fbef44b9f63e	\N	00090000-55fb-beee-c535-07e18c3a8d47	\N	0005	f	2016-01-01	2016-01-01	\N	7	t	\N	f	f
000c0000-55fb-beee-5720-168592f287b8	000d0000-55fb-beee-80b9-3923af44b259	\N	00090000-55fb-beee-4b24-525728da2693	000b0000-55fb-beee-165e-bf143b1f7633	0006	f	2016-01-01	2016-01-01	\N	1	t	\N	t	t
000c0000-55fb-beee-7eba-a18b5a68b550	000d0000-55fb-beee-7983-1d521db8ece4	00100000-55fb-beee-8149-ad3e7d28b2cf	00090000-55fb-beee-d53f-55bccc7d461a	\N	0007	t	2016-01-01	2016-01-01	\N	14	t	\N	f	t
000c0000-55fb-beee-8145-c1a75b8b54c8	000d0000-55fb-beee-638c-1752bc75c345	\N	00090000-55fb-beee-ccb2-8a444c48f7bf	000b0000-55fb-beee-40cd-533e9076bde1	0008	f	2016-01-01	2016-01-01	\N	12	t	\N	t	t
000c0000-55fb-beee-3479-8b10e070ae66	000d0000-55fb-beee-7983-1d521db8ece4	00100000-55fb-beee-be63-2ddd7d43f495	00090000-55fb-beee-fcf1-050ea6a34f05	\N	0009	t	2017-01-01	2017-01-01	\N	15	t	\N	f	t
000c0000-55fb-beee-7499-04c38be73418	000d0000-55fb-beee-7983-1d521db8ece4	00100000-55fb-beee-bee8-deca1d43553b	00090000-55fb-beee-c3c0-c1aab7c9a2f0	\N	0010	t	\N	2015-09-18	\N	16	f	\N	f	t
000c0000-55fb-beee-0f5e-36fee4b1ab51	000d0000-55fb-beee-7983-1d521db8ece4	00100000-55fb-beee-863a-bf3f0b8f24da	00090000-55fb-beee-eefc-a978aca29971	\N	0011	t	2017-01-01	\N	\N	17	f	\N	f	t
000c0000-55fb-beee-f93a-e99e9fc22b05	000d0000-55fb-beee-a8e3-9c91e64cb419	\N	00090000-55fb-beee-1ad4-d4a6f82dfe6a	000b0000-55fb-beee-d188-8d89a6fc11e1	0012	f	\N	\N	\N	2	t	\N	t	t
\.


--
-- TOC entry 2968 (class 0 OID 4194337)
-- Dependencies: 218
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 2973 (class 0 OID 4194412)
-- Dependencies: 223
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, stevilka, naslov, avtor, podnaslov, jezik, naslovizvirnika, internacionalninaslov, datumprejema, moskevloge, zenskevloge, prevajalec, povzetekvsebine, letoizida, krajizida, zaloznik) FROM stdin;
00160000-55fb-beed-54b3-923f59f4f232	0001	Sen kresne noči	William Shakespeare		slovenščina	A Midsummer Night's Dream	\N	2015-04-26	5	5	Milan Jesih	Nastopajo Titanija, Hipolita, Oberon, ...	\N	\N	\N
00160000-55fb-beed-ac99-328412c3e8e8	0002	Bratje Karamazovi	Fjodor Mihajlovič Dostojevski		slovenščina	Bratja Karamazjovji	\N	2015-12-04	4	1	Vladimir Levstik	Svetovna uspešnica	\N	\N	\N
00160000-55fb-beed-9bd6-965908d0a30c	0003	Smoletov Vrt	Berta Hočevar		slovenščina		\N	2015-05-26	2	8			\N	\N	\N
\.


--
-- TOC entry 2984 (class 0 OID 4194614)
-- Dependencies: 234
-- Data for Name: datoteka; Type: TABLE DATA; Schema: public; Owner: -
--

COPY datoteka (id, owner_id, filename, transfers, size, format, hash, createdat, uploadedat, upor, datknj) FROM stdin;
\.


--
-- TOC entry 2946 (class 0 OID 4194116)
-- Dependencies: 196
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_splosni_id, prostor_id, sezona_id, planiranzacetek, allday, zacetek, konec, status, razred, termin, title) FROM stdin;
00180000-55fb-beee-e5b9-332e02f35cfe	\N	\N	00200000-55fb-beee-d736-4c05f3f10498	\N	\N	\N	\N	2015-06-26 10:00:00	f	2015-06-26 10:00:00	2015-06-26 12:00:00	200s	200s		dogodek 1
00180000-55fb-beee-2ac1-fd1042f55110	\N	\N	00200000-55fb-beee-4f28-3701e006784f	\N	\N	\N	\N	2015-06-27 10:00:00	f	2015-06-27 10:00:00	2015-06-27 12:00:00	300s	200s		dogodek 2
00180000-55fb-beee-fae9-99b5481f6b6c	\N	\N	00200000-55fb-beee-a207-b29796c640fa	\N	\N	\N	\N	2015-08-01 20:00:00	f	2015-08-01 20:00:00	2015-08-01 23:00:00	400s	200s		dogodek 3
00180000-55fb-beee-e140-ccd8d17de2e7	\N	\N	00200000-55fb-beee-66a1-42bd097b2e09	\N	\N	\N	\N	2015-08-01 20:00:00	f	2015-08-01 20:00:00	2015-08-01 23:00:00	100s	200s		dogodek 4
00180000-55fb-beee-694e-33d668dae32e	\N	\N	00200000-55fb-beee-ffe5-d4c7db44dba6	\N	\N	\N	\N	2015-08-01 20:00:00	f	2015-08-01 20:00:00	2015-08-01 23:00:00	500s	200s		dogodek 5
\.


--
-- TOC entry 2947 (class 0 OID 4194142)
-- Dependencies: 197
-- Data for Name: dogodeksplosni; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodeksplosni (id) FROM stdin;
\.


--
-- TOC entry 2981 (class 0 OID 4194589)
-- Dependencies: 231
-- Data for Name: drugivir; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drugivir (id, znesek, opis, mednarodni, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 2937 (class 0 OID 4194018)
-- Dependencies: 187
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-55fb-beec-4c2b-9ba43725cec2	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-55fb-beec-f4aa-068480f2ca9d	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-55fb-beec-e5ed-d310c2567ce5	AL	ALB	008	Albania 	Albanija	\N
00040000-55fb-beec-3a0f-5f835dbf93ce	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-55fb-beec-2937-b01109618217	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-55fb-beec-5b61-c379031cdd56	AD	AND	020	Andorra 	Andora	\N
00040000-55fb-beec-0b72-436aaaacf1be	AO	AGO	024	Angola 	Angola	\N
00040000-55fb-beec-be8e-9e87c710d630	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-55fb-beec-2726-680243d60e68	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-55fb-beec-c621-4706a51e337f	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-55fb-beec-c102-65a7b67dc122	AR	ARG	032	Argentina 	Argenitna	\N
00040000-55fb-beec-ce9e-ea227c1aec98	AM	ARM	051	Armenia 	Armenija	\N
00040000-55fb-beec-9303-76376f29b798	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-55fb-beec-4ccd-6adfb157f6f3	AU	AUS	036	Australia 	Avstralija	\N
00040000-55fb-beec-ff5f-528172f3703f	AT	AUT	040	Austria 	Avstrija	\N
00040000-55fb-beec-c58c-6152a73629d6	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-55fb-beec-ad23-e6f549e39a8b	BS	BHS	044	Bahamas 	Bahami	\N
00040000-55fb-beec-7a4e-5595ff39a54d	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-55fb-beec-e2ef-49d75259a572	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-55fb-beec-4b98-aedf7f752f7e	BB	BRB	052	Barbados 	Barbados	\N
00040000-55fb-beec-5c85-fd390655571b	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-55fb-beec-a36f-73f784ff7969	BE	BEL	056	Belgium 	Belgija	\N
00040000-55fb-beec-8fcf-3f3ae26cc93b	BZ	BLZ	084	Belize 	Belize	\N
00040000-55fb-beec-55e4-d5c0e8777d1c	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-55fb-beec-b751-3ddca593f3d1	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-55fb-beec-3089-315981bf359d	BT	BTN	064	Bhutan 	Butan	\N
00040000-55fb-beec-5a62-9aad6d213eba	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-55fb-beec-8980-db7e420efaf6	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-55fb-beec-a6f4-8aed4e798628	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-55fb-beec-e9dc-b243e2515267	BW	BWA	072	Botswana 	Bocvana	\N
00040000-55fb-beec-7377-feb3fbe393f3	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-55fb-beec-3a07-82a996074f40	BR	BRA	076	Brazil 	Brazilija	\N
00040000-55fb-beec-e7ca-7455ac94a90e	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-55fb-beec-65ed-cd82de61005f	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-55fb-beec-c700-ba8cd28dcc61	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-55fb-beec-1624-738b6c348cc4	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-55fb-beec-640c-3f82a3dcf071	BI	BDI	108	Burundi 	Burundi 	\N
00040000-55fb-beec-6789-aa80a39272d6	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-55fb-beec-d82e-2c7d31b5b3e8	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-55fb-beec-f716-9585a9e377b1	CA	CAN	124	Canada 	Kanada	\N
00040000-55fb-beec-2539-36ca79daa843	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-55fb-beec-fb34-d6880f13c014	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-55fb-beec-5b7a-374ae046d4bd	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-55fb-beec-4c33-bc27146fee09	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-55fb-beec-54ca-bae0d7cfa650	CL	CHL	152	Chile 	Čile	\N
00040000-55fb-beec-3216-e02e684bd845	CN	CHN	156	China 	Kitajska	\N
00040000-55fb-beec-495c-d0e2d3fc108d	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-55fb-beec-e0e9-cf7cf8770e35	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-55fb-beec-a01a-ee6db0d3233e	CO	COL	170	Colombia 	Kolumbija	\N
00040000-55fb-beec-9314-a83d38cd5989	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-55fb-beec-bc8a-58662148497c	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-55fb-beec-d472-d4a67c7ad698	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-55fb-beec-b7b3-0edc7df1f8e2	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-55fb-beec-5b5b-ca930b6122a6	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-55fb-beec-19fc-7d063e9b2988	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-55fb-beec-1146-f1d28c642d98	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-55fb-beec-6abb-ca2004c322ad	CU	CUB	192	Cuba 	Kuba	\N
00040000-55fb-beec-6c5a-eb0a62cdbd2a	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-55fb-beec-e24a-3f57c6314e77	CY	CYP	196	Cyprus 	Ciper	\N
00040000-55fb-beec-be9e-5545177f109d	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-55fb-beec-e3ad-484605184dd8	DK	DNK	208	Denmark 	Danska	\N
00040000-55fb-beec-3c35-3141a9d62665	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-55fb-beec-4e28-023fff01281e	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-55fb-beec-6d3f-25ba77d90574	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-55fb-beec-72e9-d2205dfb6f8e	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-55fb-beec-12ea-4d703aa4645f	EG	EGY	818	Egypt 	Egipt	\N
00040000-55fb-beec-ef67-d80f5b52ea18	SV	SLV	222	El Salvador 	Salvador	\N
00040000-55fb-beec-85a0-01dc596c27ad	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-55fb-beec-e884-fbb03caeb097	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-55fb-beec-1f78-860b698cf957	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-55fb-beec-cd55-2119469e7c8a	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-55fb-beec-296c-6a54cf3d1ce3	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-55fb-beec-b09c-8449cb81ac34	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-55fb-beec-231f-d4d07c13f326	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-55fb-beec-c025-bb49b0b9645c	FI	FIN	246	Finland 	Finska	\N
00040000-55fb-beec-076b-0be3cc9a3550	FR	FRA	250	France 	Francija	\N
00040000-55fb-beec-6592-caf797aed375	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-55fb-beec-9126-ae11ac54e769	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-55fb-beec-3c13-c7c80296589f	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-55fb-beec-bbe7-6465e9b4b7d8	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-55fb-beec-4fe0-36659159a62a	GA	GAB	266	Gabon 	Gabon	\N
00040000-55fb-beec-2e34-6f86a2d536e5	GM	GMB	270	Gambia 	Gambija	\N
00040000-55fb-beec-10c5-920fbae8082e	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-55fb-beec-37ac-a5a6f747e96e	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-55fb-beec-fb1d-ce9f1d68ba4b	GH	GHA	288	Ghana 	Gana	\N
00040000-55fb-beec-208c-d3461f724d07	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-55fb-beec-81e9-39713bdddab2	GR	GRC	300	Greece 	Grčija	\N
00040000-55fb-beec-40b4-ed56a36ab8d4	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-55fb-beec-32f0-8a05af10111a	GD	GRD	308	Grenada 	Grenada	\N
00040000-55fb-beec-d160-0658d5840750	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-55fb-beec-3a6c-ab62cc791c83	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-55fb-beec-1c1b-fb522b81325f	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-55fb-beec-73cc-890111f303e8	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-55fb-beec-455f-ff5c2e2926e2	GN	GIN	324	Guinea 	Gvineja	\N
00040000-55fb-beec-62fe-89d93c8b1180	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-55fb-beec-2b03-cb82aa8e9581	GY	GUY	328	Guyana 	Gvajana	\N
00040000-55fb-beec-28d9-9dfabf3d0ffe	HT	HTI	332	Haiti 	Haiti	\N
00040000-55fb-beec-b495-9eed1fdb260b	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-55fb-beec-8033-27c772e00b4a	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-55fb-beec-b36a-6a459feb9e5e	HN	HND	340	Honduras 	Honduras	\N
00040000-55fb-beec-a62e-f5bb6b036fba	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-55fb-beec-167b-a50c5e888c39	HU	HUN	348	Hungary 	Madžarska	\N
00040000-55fb-beec-6adc-9ca12bd3652f	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-55fb-beec-7b7f-1f7d594a342f	IN	IND	356	India 	Indija	\N
00040000-55fb-beec-5d9f-a4ffd8468d11	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-55fb-beec-6692-5c5482f835ce	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-55fb-beec-72b9-0b564635fbc4	IQ	IRQ	368	Iraq 	Irak	\N
00040000-55fb-beec-9da8-e074e4a5c74e	IE	IRL	372	Ireland 	Irska	\N
00040000-55fb-beec-6ff4-192789d75cdd	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-55fb-beec-9766-f8c9e2cf148a	IL	ISR	376	Israel 	Izrael	\N
00040000-55fb-beec-3be7-79981c0e7733	IT	ITA	380	Italy 	Italija	\N
00040000-55fb-beec-31da-77b53bc05c9a	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-55fb-beec-3178-0879a8d2f4f2	JP	JPN	392	Japan 	Japonska	\N
00040000-55fb-beec-750f-db23ac470a56	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-55fb-beec-73de-c0cdf0d6f7fe	JO	JOR	400	Jordan 	Jordanija	\N
00040000-55fb-beec-215e-56775e4e215d	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-55fb-beec-2fd8-27cf4b575528	KE	KEN	404	Kenya 	Kenija	\N
00040000-55fb-beec-fd05-5acd4a2369f6	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-55fb-beec-3878-f3611aca41dc	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-55fb-beec-e2df-2e24a3d8e208	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-55fb-beec-c404-5e1385b5c748	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-55fb-beec-1716-049f2a72a03d	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-55fb-beec-68ec-9a4e87129ebd	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-55fb-beec-b2f4-ea676daf1464	LV	LVA	428	Latvia 	Latvija	\N
00040000-55fb-beec-cba5-c738f6ee212e	LB	LBN	422	Lebanon 	Libanon	\N
00040000-55fb-beec-8b34-295b4245cb08	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-55fb-beec-bc6e-350b7b875c88	LR	LBR	430	Liberia 	Liberija	\N
00040000-55fb-beec-5116-958760859e86	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-55fb-beec-3eeb-7c7448ac5655	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-55fb-beec-9b92-a3b4e102e70e	LT	LTU	440	Lithuania 	Litva	\N
00040000-55fb-beec-c0af-173c192292bc	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-55fb-beec-80bf-ea3a76da41fb	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-55fb-beec-9836-e1462a3b33b8	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-55fb-beec-887c-fb36d204c752	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-55fb-beec-9110-2920df99b8e3	MW	MWI	454	Malawi 	Malavi	\N
00040000-55fb-beec-f272-053f149c89d7	MY	MYS	458	Malaysia 	Malezija	\N
00040000-55fb-beec-ab09-2f2cd94b64a2	MV	MDV	462	Maldives 	Maldivi	\N
00040000-55fb-beec-7e43-86be81329f97	ML	MLI	466	Mali 	Mali	\N
00040000-55fb-beec-c861-f33963eefdf5	MT	MLT	470	Malta 	Malta	\N
00040000-55fb-beec-ef48-4681a6909cac	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-55fb-beec-fadf-478d18700b2a	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-55fb-beec-842b-1fae27451d92	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-55fb-beec-9258-fda25c14f82d	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-55fb-beec-1fbe-a36ae439466d	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-55fb-beec-998a-39a103d274af	MX	MEX	484	Mexico 	Mehika	\N
00040000-55fb-beec-7b56-e4e2a913c4a0	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-55fb-beec-6067-f540de0131c0	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-55fb-beec-8fdc-c267b4296f41	MC	MCO	492	Monaco 	Monako	\N
00040000-55fb-beec-f02c-1cbd6bc79884	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-55fb-beec-69de-0a261bd0b11a	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-55fb-beec-0982-daafeb59aa71	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-55fb-beec-e1af-7045a1142c8c	MA	MAR	504	Morocco 	Maroko	\N
00040000-55fb-beec-0785-0fa64930a8f6	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-55fb-beec-a3a2-a882f64a744d	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-55fb-beec-869c-ae2dd7807ef6	NA	NAM	516	Namibia 	Namibija	\N
00040000-55fb-beec-7ee6-54ea2d3516d2	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-55fb-beec-882e-c65af28d6248	NP	NPL	524	Nepal 	Nepal	\N
00040000-55fb-beec-4c64-ca94e01621f5	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-55fb-beec-3353-5c286c521e49	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-55fb-beec-dbbd-6271f195899d	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-55fb-beec-fd22-8ac1daca3184	NE	NER	562	Niger 	Niger 	\N
00040000-55fb-beec-d31e-7282551f7964	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-55fb-beec-0114-5c72443e6cc9	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-55fb-beec-cfd8-0271ae807562	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-55fb-beec-781e-e6b3a4adc71d	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-55fb-beec-960e-66f38f37457a	NO	NOR	578	Norway 	Norveška	\N
00040000-55fb-beec-a082-bb970a9a731e	OM	OMN	512	Oman 	Oman	\N
00040000-55fb-beec-3df8-701766788d30	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-55fb-beec-b755-fc98a04b5596	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-55fb-beec-6250-4352021a3360	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-55fb-beec-adbc-9a29a1ff9f4b	PA	PAN	591	Panama 	Panama	\N
00040000-55fb-beec-bda1-bb57c98a638d	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-55fb-beec-932e-c08a40d8b780	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-55fb-beec-f706-692461253633	PE	PER	604	Peru 	Peru	\N
00040000-55fb-beec-e51a-01a467140e53	PH	PHL	608	Philippines 	Filipini	\N
00040000-55fb-beec-0db6-a2bcd11c1922	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-55fb-beec-b8b7-d39e4e6d052f	PL	POL	616	Poland 	Poljska	\N
00040000-55fb-beec-12bc-611a4d7a65d7	PT	PRT	620	Portugal 	Portugalska	\N
00040000-55fb-beec-bd4e-4b925e8c905a	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-55fb-beec-bba1-207c0baf8a62	QA	QAT	634	Qatar 	Katar	\N
00040000-55fb-beec-86a5-78b74a419432	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-55fb-beec-fb96-3bd07a62e995	RO	ROU	642	Romania 	Romunija	\N
00040000-55fb-beec-8e4e-902264306c53	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-55fb-beec-158a-80260bc9bec5	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-55fb-beec-af9b-d16f69be00b2	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-55fb-beec-9e14-ea0eb72da114	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-55fb-beec-53f8-e669e3495e96	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-55fb-beec-cf7b-0116afece22d	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-55fb-beec-cc84-02e0d102277d	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-55fb-beec-b986-e10097bb9ed3	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-55fb-beec-3de4-05ab8268ad19	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-55fb-beec-f45b-97b7762841b5	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-55fb-beec-0d18-f6e86f4ace6c	SM	SMR	674	San Marino 	San Marino	\N
00040000-55fb-beec-f095-1f2e643f574a	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-55fb-beec-4ac5-99d276c478e9	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-55fb-beec-13be-fa860a9a2b60	SN	SEN	686	Senegal 	Senegal	\N
00040000-55fb-beec-daec-b6a37bcac57b	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-55fb-beec-96c0-5e6bd7af848f	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-55fb-beec-cf5b-5813dfe1a24d	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-55fb-beec-2203-1da4d4d18a41	SG	SGP	702	Singapore 	Singapur	\N
00040000-55fb-beec-307c-ac0d077bafb5	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-55fb-beec-cf5f-58786541011c	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-55fb-beec-a750-0aaac95e8b71	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-55fb-beec-974a-b7e61ef10a2f	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-55fb-beec-fbab-08f3672cbba7	SO	SOM	706	Somalia 	Somalija	\N
00040000-55fb-beec-798c-9b3712f3bc6e	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-55fb-beec-0dc6-f8ee6f13e244	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-55fb-beec-07eb-d403d313517e	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-55fb-beec-0963-25fce274db0c	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-55fb-beec-494e-541b2bbe8f68	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-55fb-beec-26f7-7b95df171fac	SD	SDN	729	Sudan 	Sudan	\N
00040000-55fb-beec-a581-ad1f28ec75ae	SR	SUR	740	Suriname 	Surinam	\N
00040000-55fb-beec-e400-277e9c533815	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-55fb-beec-bd96-0ec0ae9951f4	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-55fb-beec-6523-c32c7721bca4	SE	SWE	752	Sweden 	Švedska	\N
00040000-55fb-beec-d0c9-6ef58fbc8646	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-55fb-beec-059f-d21f0ab514d6	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-55fb-beec-9ac6-0c343b680f13	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-55fb-beec-533c-37054739737a	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-55fb-beec-8893-8fe641dee57e	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-55fb-beec-6c86-1114c39e592b	TH	THA	764	Thailand 	Tajska	\N
00040000-55fb-beec-4eba-e632a1481c0a	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-55fb-beec-3903-01c51822c248	TG	TGO	768	Togo 	Togo	\N
00040000-55fb-beec-76a9-9b5ccd04e408	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-55fb-beec-4060-1b0a75fe69c5	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-55fb-beec-c909-8fd9d8056ad4	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-55fb-beec-ead5-a351e0d54471	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-55fb-beec-6a33-14e59d87097a	TR	TUR	792	Turkey 	Turčija	\N
00040000-55fb-beec-aa94-51af2bd208b7	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-55fb-beec-87f8-4d007caf392f	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-55fb-beec-ff3c-24dd56df24a5	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-55fb-beec-4752-5a2f9d84cbb2	UG	UGA	800	Uganda 	Uganda	\N
00040000-55fb-beec-e2cf-8fc4c4dac080	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-55fb-beec-9625-e88e2bb2f995	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-55fb-beec-f4d3-c8ecd39e9e64	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-55fb-beec-1734-07baff1fe067	US	USA	840	United States 	Združene države Amerike	\N
00040000-55fb-beec-16e5-e24a742a8a36	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-55fb-beec-e388-7ebcf84e087c	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-55fb-beec-596f-bce7c2d5c619	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-55fb-beec-fcbc-c19b095b32fc	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-55fb-beec-ca22-35b0d4d50e65	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-55fb-beec-467c-3d3f4ed6ba16	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-55fb-beec-bc34-77c757168a4a	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-55fb-beec-b9cf-af1d7adba8e3	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-55fb-beec-825b-d80c729629d5	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-55fb-beec-02a8-15738e3a54bb	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-55fb-beec-176f-e312e50e0fa0	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-55fb-beec-2134-70ac62a978a0	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-55fb-beec-461a-cc5d22fc1c6d	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 2978 (class 0 OID 4194510)
-- Dependencies: 228
-- Data for Name: enotaprograma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY enotaprograma (id, uprizoritev_id, program_dela_id, gostitelj_id, celotnavrednost, nasdelez, celotnavrednostmat, celotnavrednostgostovsz, zaproseno, lastnasredstva, avtorskihonorarji, avtorskihonorarjisamoz, tantieme, avtorskepravice, materialni, imakoprodukcije, vlozekgostitelja, drugijavni, stzaposlenih, stzaposumet, stzaposdrug, sthonorarnih, sthonorarnihigr, sthonorarnihigrtujjz, sthonorarnihigrsamoz, obiskdoma, obiskkopr, obiskgost, obiskzamejo, obiskint, obiskkoprint, ponovidoma, ponovikopr, ponovizamejo, ponovigost, ponovikoprint, ponoviint, naziv, kpe, sort, tipprogramskeenote_id, tip, prikoproducentu, strosekodkpred, stroskiostali, krajgostovanja, ustanova, datumgostovanja, transportnistroski, dnevprvzad, drzavagostovanja_id, stpe, zvrst, stpredstav, stokroglihmiz, stpredstavitev, stdelavnic, stdrugidogodki, stprodukcij, caspriprave, casizvedbe, prizorisca, umetvodja, programskotelo, sttujihselektorjev) FROM stdin;
00310000-55fb-beee-faa2-80717253755c	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-54.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	54.20	5	0	0	3	0	0	\N	22	0	0	0	0	0	0	0	0	0	0	0	Urejanje portala	0.00	10	\N	razno	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-55fb-beee-e975-36736abbc257	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-31.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	31.20	5	0	0	3	0	0	\N	202	0	0	0	0	0	0	0	0	0	0	0	Delavnice otroci	0.00	8	\N	razno	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-55fb-beee-b727-c2d4d4e7289b	000e0000-55fb-beee-73e7-49ee3e3241cb	\N	\N	9000.30	9000.30	9000.30	0.00	3600.12	5299.98	4000.40	1000.40	200.20	200.30	4599.40	\N	0.00	100.20	0	2	2	2	2	2	\N	40	0	0	0	0	0	1	0	0	0	0	0		0.00	\N	002b0000-55fb-beec-b812-80a7c775814f	premiera	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-55fb-beee-2e75-069b3689e491	000e0000-55fb-beee-e0d6-4b391b032730	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	\N	60	0	0	0	0	0	1	0	0	0	0	0		0.00	\N	002b0000-55fb-beec-d395-64108953af8c	premiera	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-55fb-beee-2a54-ac9df5818370	000e0000-55fb-beee-2c79-2efdb4843b2c	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	\N	60	0	0	0	0	0	1	0	0	0	0	0		0.00	\N	002b0000-55fb-beec-b812-80a7c775814f	premiera	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 2975 (class 0 OID 4194440)
-- Dependencies: 225
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, podrocje, vodjaekipe, naziv, komentar, velikost, pomembna, sort, seplanira, dovoliprekrivanje, maxprekrivanj, tipfunkcije_id) FROM stdin;
000d0000-55fb-beee-78e6-96ca6c1983ba	000e0000-55fb-beee-e0d6-4b391b032730	000c0000-55fb-beee-ec80-4272bf6ba7da	igralec	\N	Tezej	glavna vloga	velika	t	5	t	t	\N	000f0000-55fb-beec-1124-7ff703fc9b23
000d0000-55fb-beee-e9ac-71d6aa1a166a	000e0000-55fb-beee-e0d6-4b391b032730	000c0000-55fb-beee-be0a-636a87e77e8c	umetnik	\N	Režija		velika	t	8	t	t	\N	000f0000-55fb-beec-0062-9f6c8c87d150
000d0000-55fb-beee-d1de-caaffba93591	000e0000-55fb-beee-e0d6-4b391b032730	000c0000-55fb-beee-db14-762057c0615a	inspicient	t	Inšpicient			t	8	t	t	\N	000f0000-55fb-beec-e027-96477401c836
000d0000-55fb-beee-cb8f-080f1fb3f7a2	000e0000-55fb-beee-e0d6-4b391b032730	000c0000-55fb-beee-4fd5-9c34b5f08186	tehnik	t	Tehnični vodja			t	8	t	t	\N	000f0000-55fb-beec-4201-dbbb6f9c5a4f
000d0000-55fb-beee-c421-fbef44b9f63e	000e0000-55fb-beee-e0d6-4b391b032730	000c0000-55fb-beee-157f-e2bd4d9b8389	tehnik	\N	Razsvetljava			t	3	t	t	\N	000f0000-55fb-beec-4201-dbbb6f9c5a4f
000d0000-55fb-beee-80b9-3923af44b259	000e0000-55fb-beee-e0d6-4b391b032730	000c0000-55fb-beee-5720-168592f287b8	igralec	\N	Helena	glavna vloga	velika	t	5	t	t	\N	000f0000-55fb-beec-1124-7ff703fc9b23
000d0000-55fb-beee-7983-1d521db8ece4	000e0000-55fb-beee-e0d6-4b391b032730	000c0000-55fb-beee-3479-8b10e070ae66	igralec	\N	Hipolita	glavna vloga	velika	t	6	t	t	\N	000f0000-55fb-beec-1124-7ff703fc9b23
000d0000-55fb-beee-638c-1752bc75c345	000e0000-55fb-beee-e0d6-4b391b032730	000c0000-55fb-beee-8145-c1a75b8b54c8	umetnik	\N	Lektoriranje			t	22	t	t	\N	000f0000-55fb-beec-6eca-28d710faf19e
000d0000-55fb-beee-a8e3-9c91e64cb419	000e0000-55fb-beee-e0d6-4b391b032730	000c0000-55fb-beee-f93a-e99e9fc22b05	umetnik	\N	Avtor	Avtor besedila		t	2	t	f	\N	000f0000-55fb-beec-aac7-ed884f7173f1
\.


--
-- TOC entry 2941 (class 0 OID 4194069)
-- Dependencies: 191
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta, zamejstvo, kraj) FROM stdin;
\.


--
-- TOC entry 2940 (class 0 OID 4194057)
-- Dependencies: 190
-- Data for Name: kontaktnaoseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kontaktnaoseba (id, popa_id, oseba_id, status, funkcija, opis) FROM stdin;
00260000-55fb-beee-9e85-7299b00b00fc	00080000-55fb-beee-518d-07eea551af6a	00090000-55fb-beee-c3c0-c1aab7c9a2f0	AK		igralka
\.


--
-- TOC entry 2958 (class 0 OID 4194238)
-- Dependencies: 208
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 2985 (class 0 OID 4194629)
-- Dependencies: 235
-- Data for Name: mapa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa (id, lastnik_id, parent_id, ime, komentar, caskreiranja, casspremembe, javnidostop, upor, datknj) FROM stdin;
\.


--
-- TOC entry 2986 (class 0 OID 4194641)
-- Dependencies: 236
-- Data for Name: mapa_zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa_zapis (mapa_id, zapis_id) FROM stdin;
\.


--
-- TOC entry 2987 (class 0 OID 4194648)
-- Dependencies: 237
-- Data for Name: mapaacl; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapaacl (id, mapa_id, perm_id, dostop, upor, datknj) FROM stdin;
\.


--
-- TOC entry 2961 (class 0 OID 4194258)
-- Dependencies: 211
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 2934 (class 0 OID 4193973)
-- Dependencies: 184
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-55fb-beed-41a2-1d93e8abb9e9	popa.stakli	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-55fb-beed-8580-d1c968eccd94	oseba.spol	array	a:2:{s:1:"M";a:1:{s:5:"label";s:6:"Moški";}s:1:"Z";a:1:{s:5:"label";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-55fb-beed-8bf6-8ae0713217b2	telefonska.vrsta	array	a:3:{s:7:"mobilna";a:1:{s:5:"label";s:7:"Mobilni";}s:6:"domaca";a:1:{s:5:"label";s:6:"Domač";}s:6:"fiksna";a:1:{s:5:"label";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-55fb-beed-4e36-2842401d47de	kontaktnaoseba.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status kontaktne osebe
00000000-55fb-beed-adb8-d74c7fa57f1c	dogodek.status	array	a:7:{s:4:"100s";a:1:{s:5:"label";s:11:"Dolgoročno";}s:4:"200s";a:1:{s:5:"label";s:9:"Planirano";}s:4:"300s";a:1:{s:5:"label";s:8:"Fiksiran";}s:4:"400s";a:1:{s:5:"label";s:17:"Potrjen - interno";}s:4:"500s";a:1:{s:5:"label";s:15:"Potrjen - javno";}s:4:"600s";a:1:{s:5:"label";s:10:"Zaključen";}s:4:"700s";a:1:{s:5:"label";s:7:"Obdelan";}}	f	t	t	\N	Tabela statusa dogodkov
00000000-55fb-beed-c761-db6406a1be45	dogodek.razred	array	a:5:{s:4:"100s";a:2:{s:5:"label";s:9:"Predstava";s:4:"type";s:9:"predstava";}s:4:"200s";a:2:{s:5:"label";s:4:"Vaja";s:4:"type";s:4:"vaja";}s:4:"300s";a:2:{s:5:"label";s:10:"Gostovanje";s:4:"type";s:10:"gostovanje";}s:4:"400s";a:2:{s:5:"label";s:16:"Splošni dogodek";s:4:"type";s:8:"splošni";}s:4:"500s";a:2:{s:5:"label";s:10:"Zasedenost";s:4:"type";s:10:"zasedenost";}}	f	t	t	\N	Tabela razredov dogodkov, ki jih aplikacija podpira
00000000-55fb-beed-3c2e-6980f71b525e	uprizoritev.faza	array	a:6:{s:20:"predprodukcija-ideja";a:1:{s:5:"label";s:16:"Dolgoročni plan";}s:20:"predprodukcija-poziv";a:1:{s:5:"label";s:29:"Predprodukcija, v fazi poziva";}s:30:"predprodukcija-potrjen_program";a:1:{s:5:"label";s:34:"Predprodukcija, program je potrjen";}s:10:"produkcija";a:1:{s:5:"label";s:10:"Produkcija";}s:14:"postprodukcija";a:1:{s:5:"label";s:14:"Postprodukcija";}s:5:"arhiv";a:1:{s:5:"label";s:10:"Arhivirana";}}	f	t	f	\N	Faza uprizoritve
00000000-55fb-beed-0f7d-19e6e6f6a86c	funkcija.podrocje	array	a:4:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}}	f	t	f	\N	Področje funkcije
00000000-55fb-beed-7f72-9d77893b666c	tipfunkcije.podrocje	array	a:4:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}}	f	t	f	\N	Področje funkcije
00000000-55fb-beed-ecf6-a2a21734410e	funkcija.velikost	array	a:4:{s:7:"stataza";a:1:{s:5:"label";s:8:"Stataža";}s:4:"mala";a:1:{s:5:"label";s:21:"Mala vloga / funkcija";}s:7:"srednja";a:1:{s:5:"label";s:24:"Srednja vloga / funkcija";}s:6:"velika";a:1:{s:5:"label";s:23:"Velika vloga / funkcija";}}	f	t	f	\N	Velikost funkcije
00000000-55fb-beed-1aa5-63fb6c06a285	zaposlitev.status	array	a:2:{s:1:"A";a:1:{s:5:"label";s:7:"Aktivna";}s:1:"N";a:1:{s:5:"label";s:9:"Neaktivna";}}	f	t	f	\N	Status zaposlitve
00000000-55fb-beed-3961-91fd6a001d60	produkcijskahisa.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktivna";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktivna";}}	f	t	f	\N	Status produkcijske hiše
00000000-55fb-beed-4c73-29250c0051b8	strosekuprizoritve.tipstroska	array	a:1:{s:10:"materialni";a:1:{s:5:"label";s:19:"Materialni strošek";}}	f	t	f	\N	Tip stroška
00000000-55fb-beed-6585-483c4c8cedd5	fsacl.dostop	array	a:4:{s:1:"X";a:1:{s:5:"label";s:12:"Brez dostopa";}s:1:"R";a:1:{s:5:"label";s:11:"Samo branje";}s:2:"RW";a:1:{s:5:"label";s:17:"Branje in pisanje";}s:3:"RWD";a:1:{s:5:"label";s:26:"Branje pisanje in brisanje";}}	f	t	f	\N	ACL Javni dostop
00000000-55fb-beee-fa17-ca7b8a66ae8c	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-55fb-beee-27f6-1d3a28ee11f9	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-55fb-beee-17d3-860a375cff9b	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-55fb-beee-d5a0-a5a3fed6a6da	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-55fb-beee-1427-b4f6a39aa58b	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
00000000-55fb-bef0-b030-204a15c2d13b	application.tenant.maticnopodjetje	string	s:4:"1001";	f	t	f		Šifra matičnega podjetja v Popa in ProdukcijskaHisa
\.


--
-- TOC entry 2933 (class 0 OID 4193962)
-- Dependencies: 183
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-55fb-beee-4402-80d29ee54386	00000000-55fb-beee-fa17-ca7b8a66ae8c	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-55fb-beee-8923-b67b1fee5cc9	00000000-55fb-beee-fa17-ca7b8a66ae8c	00010000-55fb-beed-d7a4-ef9e08f686c8	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-55fb-beee-29a3-e9d802b8835c	00000000-55fb-beee-27f6-1d3a28ee11f9	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 2935 (class 0 OID 4193985)
-- Dependencies: 185
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naslov_id, sifra, naziv, ime, priimek, funkcija, srednjeime, polnoime, psevdonim, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
00090000-55fb-beee-5c42-55d8c6dcf886	\N	\N	0001	g.	Janez	Novak	a	Peter	Janez Peter Novak	Jani	jani.novak@xxx.xx	1958-01-06	0601958000000	123456789	M	Jani Janez	Slovenija	Slovenija	Ljubljana
00090000-55fb-beee-1e00-8a6645cd8d76	00010000-55fb-beee-3dbe-e89a3c13a10a	\N	0002	dr.	Anton	Horvat	b		Anton  Horvat	Tona	anton.horvat@xxx.xx	1968-02-12	1202968111111	234567890	M		Slovenija	Slovenija	Maribor
00090000-55fb-beee-046a-aaceff18e209	00010000-55fb-beee-bdb0-6fff91aea67d	\N	0003		Ivan	Kovačič	c		Ivan  Kovačič	Ivo	ivan.kovacic@xxx.xx	1975-03-26	2603976222222	345678901	M		Slovenija	Slovenija	Celje
00090000-55fb-beee-fcf1-050ea6a34f05	00010000-55fb-beee-1041-e66e0892f4df	\N	0004	prof.	Jožef	Krajnc	d		Jožef  Krajnc	Joža	jozef.krajnc@xxx.xx	1971-04-30	3004971333333	456789012	M		Slovenija	Slovenija	Kranj
00090000-55fb-beee-83cc-020f321b2adc	\N	\N	0005		Marko	Zupančič	e		Marko  Zupančič		marko.zupancic@xxx.xx	1984-05-07	0705984444444	567890123	M		Slovenija	Slovenija	Koper
00090000-55fb-beee-4b24-525728da2693	\N	\N	0006	ga.	Marija	Kovač	f		Marija  Kovač		marija.kovac@xxx.xx	1962-06-19	1906962444444	678901234	Z		Slovenija	Slovenija	Murska Sobota
00090000-55fb-beee-eefc-a978aca29971	\N	\N	0007	ga.	Ana	Potočnik	g		Ana  Potočnik		ana.potocnik@xxx.xx	1975-07-24	2407975555555	789012345	Z		Slovenija	Slovenija	Novo Mesto
00090000-55fb-beee-d53f-55bccc7d461a	\N	\N	0008	ga.	Maja	Mlakar	h		Maja  Mlakar		maja.mlakar@xxx.xx	1986-08-02	0208986666666	890123456	Z		Slovenija	Slovenija	Nova Gorica
00090000-55fb-beee-c3c0-c1aab7c9a2f0	00010000-55fb-beee-b2ec-ea8129465b1a	\N	0009		Irena	Kos	i		Irena  Kos		irena.kos@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Ptuj
00090000-55fb-beee-1ad4-d4a6f82dfe6a	\N	\N	0010		Mojca	Vidmar	J		Mojca  Vidmar		mojca.vidmar@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Idrija
00090000-55fb-beee-131a-da7e74acf810	\N	\N	0011		xx	write protected12345	a		xx  write protected12345		xx@xxx.xx	\N	\N	\N	Z		\N	\N	\N
00090000-55fb-beee-c535-07e18c3a8d47	\N	\N	0012		Luka	Golob	luč	a	Luka a Golob		luka.golob@xxx.xx	\N	\N	\N	M		\N	\N	\N
00090000-55fb-beee-ccb2-8a444c48f7bf	00010000-55fb-beee-efb7-903d4774827c	\N	0013		Tatjana	Božič	tajnica	a	Tatjana a Božič		tatjana.bozic@xxx.xx	\N	\N	\N	Z		\N	\N	\N
\.


--
-- TOC entry 2929 (class 0 OID 4193910)
-- Dependencies: 179
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-55fb-beec-4c2d-d2ffc4a0b1bb	Aaa-read	Aaa (User,Role,Permission) - branje	f
00030000-55fb-beec-913d-420bb98c3a56	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	f
00030000-55fb-beec-f425-12a49b628bc7	TerminStoritve-vse	TerminStoritve - spreminjanje vseh zapisov	f
00030000-55fb-beec-3256-c8848a430af6	Dogodek-readVse	Dogodek - branje vseh, ne glede na status dogodka	f
00030000-55fb-beec-3e3e-6f04fae6ea0e	Oseba-vse	Oseba - vse - za testiranje assert	f
00030000-55fb-beec-7e46-29749072eed2	ProgramDela-lock	ProgramDela - zaklepanje	f
00030000-55fb-beec-e65a-e1bfda054205	ProgramDela-unlock	ProgramDela - odklepanje	f
00030000-55fb-beec-d6ef-b81db1760274	Abonma-read	Abonma - branje	f
00030000-55fb-beec-3a61-0862550c5220	Abonma-write	Abonma - spreminjanje	f
00030000-55fb-beec-6b72-b1e451974ab2	Alternacija-read	Alternacija - branje	f
00030000-55fb-beec-db72-a60555af9b3f	Alternacija-write	Alternacija - spreminjanje	f
00030000-55fb-beec-1781-02f719a35258	Arhivalija-read	Arhivalija - branje	f
00030000-55fb-beec-b74b-fd1591f40721	Arhivalija-write	Arhivalija - spreminjanje	f
00030000-55fb-beec-841b-5ff0181c40be	Besedilo-read	Besedilo - branje	f
00030000-55fb-beec-2d17-b887b2c0809e	Besedilo-write	Besedilo - spreminjanje	f
00030000-55fb-beec-ac27-6edcbf08e258	DogodekIzven-read	DogodekIzven - branje	f
00030000-55fb-beec-746a-68d8bab98df7	DogodekIzven-write	DogodekIzven - spreminjanje	f
00030000-55fb-beec-0a4e-74a2fe6a1ef3	Dogodek-read	Dogodek - branje	f
00030000-55fb-beec-e846-b5c486b4ab9e	Dogodek-write	Dogodek - spreminjanje	f
00030000-55fb-beec-22d9-7cab63277784	DrugiVir-read	DrugiVir - branje	f
00030000-55fb-beec-d63e-28774116784d	DrugiVir-write	DrugiVir - spreminjanje	f
00030000-55fb-beec-440a-2a8194733219	Drzava-read	Drzava - branje	f
00030000-55fb-beec-6b72-cdbaa72e9cfd	Drzava-write	Drzava - spreminjanje	f
00030000-55fb-beec-51cc-8e47c66bcdcf	EnotaPrograma-read	EnotaPrograma - branje	f
00030000-55fb-beec-6c80-0d99e5e6cea2	EnotaPrograma-write	EnotaPrograma - spreminjanje	f
00030000-55fb-beec-7ff0-04b924ad830f	Funkcija-read	Funkcija - branje	f
00030000-55fb-beec-d655-cd48f4c5908e	Funkcija-write	Funkcija - spreminjanje	f
00030000-55fb-beec-444b-216803abf019	Gostovanje-read	Gostovanje - branje	f
00030000-55fb-beec-00a8-62e1b4968761	Gostovanje-write	Gostovanje - spreminjanje	f
00030000-55fb-beec-cdae-4c68b3bdbf46	Gostujoca-read	Gostujoca - branje	f
00030000-55fb-beec-686b-0ec0181ba617	Gostujoca-write	Gostujoca - spreminjanje	f
00030000-55fb-beec-f1ce-987250cc6b34	KontaktnaOseba-read	KontaktnaOseba - branje	f
00030000-55fb-beec-acc0-8e3f6e8af910	KontaktnaOseba-write	KontaktnaOseba - spreminjanje	f
00030000-55fb-beec-87b0-e02d262c1eea	Kupec-read	Kupec - branje	f
00030000-55fb-beec-4ad0-4505a66d8ee4	Kupec-write	Kupec - spreminjanje	f
00030000-55fb-beec-dae3-b771e5e98cd9	NacinPlacina-read	NacinPlacina - branje	f
00030000-55fb-beec-5d33-f9e6a7dc66c1	NacinPlacina-write	NacinPlacina - spreminjanje	f
00030000-55fb-beec-2b35-418039eda82f	Option-read	Option - branje	f
00030000-55fb-beec-a44a-cfc2cd58e942	Option-write	Option - spreminjanje	f
00030000-55fb-beec-dfec-36cb27dea9ac	OptionValue-read	OptionValue - branje	f
00030000-55fb-beec-3cfd-789d172274a4	OptionValue-write	OptionValue - spreminjanje	f
00030000-55fb-beec-d6c5-8023df393629	Oseba-read	Oseba - branje	f
00030000-55fb-beec-d319-467024c98c22	Oseba-write	Oseba - spreminjanje	f
00030000-55fb-beec-4340-1305e22f4efe	PlacilniInstrument-read	PlacilniInstrument - branje	f
00030000-55fb-beec-c765-9f2f36d3b6a8	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	f
00030000-55fb-beec-687e-1a1a9c16040d	PodrocjeSedenja-read	PodrocjeSedenja - branje	f
00030000-55fb-beec-73e0-3ce582087abe	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	f
00030000-55fb-beec-409b-f0ea3039753b	Pogodba-read	Pogodba - branje	f
00030000-55fb-beec-d1a3-7505668b9164	Pogodba-write	Pogodba - spreminjanje	f
00030000-55fb-beec-8dff-c0ae90094384	Popa-read	Popa - branje	f
00030000-55fb-beec-83fa-2c3e20d088e7	Popa-write	Popa - spreminjanje	f
00030000-55fb-beec-158b-ebeb86df83af	Posta-read	Posta - branje	f
00030000-55fb-beec-d099-971a6acbf96b	Posta-write	Posta - spreminjanje	f
00030000-55fb-beec-a1ab-05f9ff39b11c	PostavkaCDve-read	PostavkaCDve - branje	f
00030000-55fb-beec-0ad3-97366096e052	PostavkaCDve-write	PostavkaCDve - spreminjanje	f
00030000-55fb-beec-4187-6633fe205ace	PostavkaRacuna-read	PostavkaRacuna - branje	f
00030000-55fb-beec-c8a3-1c404598b00e	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	f
00030000-55fb-beec-ab7e-8961dd058d68	PostniNaslov-read	PostniNaslov - branje	f
00030000-55fb-beec-0a99-f0935a444316	PostniNaslov-write	PostniNaslov - spreminjanje	f
00030000-55fb-beec-c024-e8113bce2937	Predstava-read	Predstava - branje	f
00030000-55fb-beec-6479-a0ac2f45d149	Predstava-write	Predstava - spreminjanje	f
00030000-55fb-beec-a91b-b07cc13fe5e4	ProdajaPredstave-read	ProdajaPredstave - branje	f
00030000-55fb-beec-f02e-79cc6012d0d8	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	f
00030000-55fb-beec-1096-00fe176ce9c5	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	f
00030000-55fb-beec-bbc1-58814938d440	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	f
00030000-55fb-beec-eabc-4d5e657ceb26	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	f
00030000-55fb-beec-6419-14b841720ede	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	f
00030000-55fb-beec-d76c-908a15e454d5	ProgramDela-read	ProgramDela - branje	f
00030000-55fb-beec-5679-7512bd037e8a	ProgramDela-write	ProgramDela - spreminjanje	f
00030000-55fb-beec-4ab5-2844d8f7487c	ProgramFestival-read	ProgramFestival - branje	f
00030000-55fb-beec-85a9-b60521a4445e	ProgramFestival-write	ProgramFestival - spreminjanje	f
00030000-55fb-beec-15cb-10c20831dfac	ProgramGostovanje-read	ProgramGostovanje - branje	f
00030000-55fb-beec-ab50-913809e5a02a	ProgramGostovanje-write	ProgramGostovanje - spreminjanje	f
00030000-55fb-beec-3dec-e6c470be8ecc	ProgramGostujoca-read	ProgramGostujoca - branje	f
00030000-55fb-beec-d77b-0a7323e13b41	ProgramGostujoca-write	ProgramGostujoca - spreminjanje	f
00030000-55fb-beec-d0e3-6e5a8843d22d	ProgramIzjemni-read	ProgramIzjemni - branje	f
00030000-55fb-beec-1020-47278138b936	ProgramIzjemni-write	ProgramIzjemni - spreminjanje	f
00030000-55fb-beec-3e6f-4f930db777e4	ProgramPonovitevPrejsnjih-read	ProgramPonovitevPrejsnjih - branje	f
00030000-55fb-beec-5d45-f0d075a9e6e2	ProgramPonovitevPrejsnjih-write	ProgramPonovitevPrejsnjih - spreminjanje	f
00030000-55fb-beec-cc46-cd0e5d21ff2d	ProgramPonovitevPremiere-read	ProgramPonovitevPremiere - branje	f
00030000-55fb-beec-c407-489adade0d86	ProgramPonovitevPremiere-write	ProgramPonovitevPremiere - spreminjanje	f
00030000-55fb-beec-d548-95141782b5b5	ProgramPremiera-read	ProgramPremiera - branje	f
00030000-55fb-beec-f9cd-e508b9f024a6	ProgramPremiera-write	ProgramPremiera - spreminjanje	f
00030000-55fb-beec-977d-ce457b676793	ProgramRazno-read	ProgramRazno - branje	f
00030000-55fb-beec-7d95-cf3a7774dfe7	ProgramRazno-write	ProgramRazno - spreminjanje	f
00030000-55fb-beec-6c30-0e6dd0180817	ProgramskaEnotaSklopa-read	ProgramskaEnotaSklopa - branje	f
00030000-55fb-beec-ad72-0ac8a252ddf0	ProgramskaEnotaSklopa-write	ProgramskaEnotaSklopa - spreminjanje	f
00030000-55fb-beec-dce6-8f253d341e9e	Prostor-read	Prostor - branje	f
00030000-55fb-beec-9c9a-d091f7730865	Prostor-write	Prostor - spreminjanje	f
00030000-55fb-beec-cb97-cec5ae543f4e	Racun-read	Racun - branje	f
00030000-55fb-beec-b1f6-3ae02c5edd32	Racun-write	Racun - spreminjanje	f
00030000-55fb-beec-32c5-d33fbf837c26	RazpisanSedez-read	RazpisanSedez - branje	f
00030000-55fb-beec-79d9-84873e4cff24	RazpisanSedez-write	RazpisanSedez - spreminjanje	f
00030000-55fb-beec-f49f-829e39406e4a	Rekviziterstvo-read	Rekviziterstvo - branje	f
00030000-55fb-beec-5cb3-9ba288913f58	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	f
00030000-55fb-beec-5e04-72d5e0a5f978	Rekvizit-read	Rekvizit - branje	f
00030000-55fb-beec-a9a8-b754874fc186	Rekvizit-write	Rekvizit - spreminjanje	f
00030000-55fb-beec-26b5-5a560aa78852	Revizija-read	Revizija - branje	f
00030000-55fb-beec-ae47-a653a8d8c95b	Revizija-write	Revizija - spreminjanje	f
00030000-55fb-beec-8c07-ea10eb339233	Rezervacija-read	Rezervacija - branje	f
00030000-55fb-beec-6e2a-5751fac6eb26	Rezervacija-write	Rezervacija - spreminjanje	f
00030000-55fb-beec-a60d-78bf97edf7fe	SedezniRed-read	SedezniRed - branje	f
00030000-55fb-beec-2118-675e0dbac2be	SedezniRed-write	SedezniRed - spreminjanje	f
00030000-55fb-beec-c003-6e2b5ff92d82	Sedez-read	Sedez - branje	f
00030000-55fb-beec-4c0e-f80471ad9967	Sedez-write	Sedez - spreminjanje	f
00030000-55fb-beec-8cdb-cfd8e0a5680a	Sezona-read	Sezona - branje	f
00030000-55fb-beec-f0e4-9b1aa295fa7b	Sezona-write	Sezona - spreminjanje	f
00030000-55fb-beec-3c80-c178f0b1bfb2	StevilcenjeKonfig-read	StevilcenjeKonfig - branje	f
00030000-55fb-beec-9618-253f3bcc20a8	StevilcenjeKonfig-write	StevilcenjeKonfig - spreminjanje	f
00030000-55fb-beec-43f3-8a1133ffba4d	Stevilcenje-read	Stevilcenje - branje	f
00030000-55fb-beec-829d-422ed95735f2	Stevilcenje-write	Stevilcenje - spreminjanje	f
00030000-55fb-beec-3890-781a6b7414f8	StevilcenjeStanje-read	StevilcenjeStanje - branje	f
00030000-55fb-beec-4966-34cd0d772447	StevilcenjeStanje-write	StevilcenjeStanje - spreminjanje	f
00030000-55fb-beec-5e39-444e8e8b3ee3	StrosekUprizoritve-read	StrosekUprizoritve - branje	f
00030000-55fb-beec-5c07-4e6493d261c3	StrosekUprizoritve-write	StrosekUprizoritve - spreminjanje	f
00030000-55fb-beec-1588-e603dfaf867d	Telefonska-read	Telefonska - branje	f
00030000-55fb-beec-f33b-6b098baa0e1b	Telefonska-write	Telefonska - spreminjanje	f
00030000-55fb-beec-6931-6e4e99fcf509	TerminStoritve-read	TerminStoritve - branje	f
00030000-55fb-beec-4d2d-941265b863aa	TerminStoritve-write	TerminStoritve - spreminjanje	f
00030000-55fb-beec-0c81-3c048b7c1ad8	TipFunkcije-read	TipFunkcije - branje	f
00030000-55fb-beec-637a-875312e559e2	TipFunkcije-write	TipFunkcije - spreminjanje	f
00030000-55fb-beec-ea4b-84c7aaedbce6	TipProgramskeEnote-read	TipProgramskeEnote - branje	f
00030000-55fb-beec-154d-248fcd544873	TipProgramskeEnote-write	TipProgramskeEnote - spreminjanje	f
00030000-55fb-beec-a69c-4fec9cfbc579	Trr-read	Trr - branje	f
00030000-55fb-beec-1082-137fc741c507	Trr-write	Trr - spreminjanje	f
00030000-55fb-beec-6601-117348e89641	Uprizoritev-read	Uprizoritev - branje	f
00030000-55fb-beec-89e2-de51b454f2d8	Uprizoritev-write	Uprizoritev - spreminjanje	f
00030000-55fb-beec-c789-a40162c36683	Vaja-read	Vaja - branje	f
00030000-55fb-beec-6f50-445f43a4fc8b	Vaja-write	Vaja - spreminjanje	f
00030000-55fb-beec-fe4a-ce428aaca901	VrstaSedezev-read	VrstaSedezev - branje	f
00030000-55fb-beec-d19c-4412d4fee70f	VrstaSedezev-write	VrstaSedezev - spreminjanje	f
00030000-55fb-beec-dc76-47257ce40ffb	VrstaStroska-read	VrstaStroska - branje	f
00030000-55fb-beec-89a4-5d70be3dc300	VrstaStroska-write	VrstaStroska - spreminjanje	f
00030000-55fb-beec-b3c3-9264415b7d89	Zaposlitev-read	Zaposlitev - branje	f
00030000-55fb-beec-f685-52be9440f887	Zaposlitev-write	Zaposlitev - spreminjanje	f
00030000-55fb-beec-8851-10431bd64210	Zasedenost-read	Zasedenost - branje	f
00030000-55fb-beec-9ea7-ace7466b3996	Zasedenost-write	Zasedenost - spreminjanje	f
00030000-55fb-beec-de47-43b63cc030da	ZvrstSurs-read	ZvrstSurs - branje	f
00030000-55fb-beec-27ac-4ebb8eb6b4f3	ZvrstSurs-write	ZvrstSurs - spreminjanje	f
00030000-55fb-beec-abd4-35bce78e9855	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	f
00030000-55fb-beec-9e8d-d34a2e525d21	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	f
00030000-55fb-beec-eea6-1d21da6a9789	Mapa-write	Mapa - osnovno dovoljenje za pisanje	f
00030000-55fb-beec-c4ec-f3c15c8d19ec	Mapa-read	Mapa - osnovno dovoljenje za branje	f
00030000-55fb-beec-3109-5307f9310595	MapaAcl-write	MapaAcl - dovoljenje za dostop pisanje ACL-jev mape	f
00030000-55fb-beec-006e-44d2484d9c97	MapaAcl-read	MapaAcl - dovoljenje za dostop branje ACL-jev mape	f
00030000-55fb-beec-9b4c-4573d9983a7f	Zapis-write	Zapis - dovoljenje za pisanje zapisov	f
00030000-55fb-beec-76ec-fe886e85763f	Zapis-read	Zapis - dovoljenje za pisanje zapisov	f
00030000-55fb-beec-19a5-117bcc51ad78	ZapisLastnik-write	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	f
00030000-55fb-beec-1772-95e3e60846db	ZapisLastnik-read	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	f
00030000-55fb-beec-8a1e-e7f0551fa314	VrstaZapisa-write	Šifrant vrst zapisa - spreminjanje	f
00030000-55fb-beec-6f5b-acc08a71275c	VrstaZapisa-read	Šifrant vrst zapisa - branje	f
00030000-55fb-beec-a7bb-3ffed7fbd8ae	Datoteka-write	Datoteka - spreminjanje	f
00030000-55fb-beec-dde9-47e7de6a0835	Datoteka-read	Datoteke - branje	f
\.


--
-- TOC entry 2928 (class 0 OID 4193903)
-- Dependencies: 178
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-55fb-beed-f8ff-5546c661ff8f	00030000-55fb-beec-913d-420bb98c3a56
00020000-55fb-beed-195c-e5aaf53a5441	00030000-55fb-beec-440a-2a8194733219
00020000-55fb-beed-950b-5ee2f5b8ea93	00030000-55fb-beec-d6ef-b81db1760274
00020000-55fb-beed-950b-5ee2f5b8ea93	00030000-55fb-beec-3a61-0862550c5220
00020000-55fb-beed-950b-5ee2f5b8ea93	00030000-55fb-beec-6b72-b1e451974ab2
00020000-55fb-beed-950b-5ee2f5b8ea93	00030000-55fb-beec-db72-a60555af9b3f
00020000-55fb-beed-950b-5ee2f5b8ea93	00030000-55fb-beec-1781-02f719a35258
00020000-55fb-beed-950b-5ee2f5b8ea93	00030000-55fb-beec-0a4e-74a2fe6a1ef3
00020000-55fb-beed-950b-5ee2f5b8ea93	00030000-55fb-beec-3256-c8848a430af6
00020000-55fb-beed-950b-5ee2f5b8ea93	00030000-55fb-beec-e846-b5c486b4ab9e
00020000-55fb-beed-950b-5ee2f5b8ea93	00030000-55fb-beec-440a-2a8194733219
00020000-55fb-beed-950b-5ee2f5b8ea93	00030000-55fb-beec-6b72-cdbaa72e9cfd
00020000-55fb-beed-950b-5ee2f5b8ea93	00030000-55fb-beec-7ff0-04b924ad830f
00020000-55fb-beed-950b-5ee2f5b8ea93	00030000-55fb-beec-d655-cd48f4c5908e
00020000-55fb-beed-950b-5ee2f5b8ea93	00030000-55fb-beec-444b-216803abf019
00020000-55fb-beed-950b-5ee2f5b8ea93	00030000-55fb-beec-00a8-62e1b4968761
00020000-55fb-beed-950b-5ee2f5b8ea93	00030000-55fb-beec-cdae-4c68b3bdbf46
00020000-55fb-beed-950b-5ee2f5b8ea93	00030000-55fb-beec-686b-0ec0181ba617
00020000-55fb-beed-950b-5ee2f5b8ea93	00030000-55fb-beec-f1ce-987250cc6b34
00020000-55fb-beed-950b-5ee2f5b8ea93	00030000-55fb-beec-acc0-8e3f6e8af910
00020000-55fb-beed-950b-5ee2f5b8ea93	00030000-55fb-beec-2b35-418039eda82f
00020000-55fb-beed-950b-5ee2f5b8ea93	00030000-55fb-beec-dfec-36cb27dea9ac
00020000-55fb-beed-950b-5ee2f5b8ea93	00030000-55fb-beec-d6c5-8023df393629
00020000-55fb-beed-950b-5ee2f5b8ea93	00030000-55fb-beec-d319-467024c98c22
00020000-55fb-beed-950b-5ee2f5b8ea93	00030000-55fb-beec-8dff-c0ae90094384
00020000-55fb-beed-950b-5ee2f5b8ea93	00030000-55fb-beec-83fa-2c3e20d088e7
00020000-55fb-beed-950b-5ee2f5b8ea93	00030000-55fb-beec-158b-ebeb86df83af
00020000-55fb-beed-950b-5ee2f5b8ea93	00030000-55fb-beec-d099-971a6acbf96b
00020000-55fb-beed-950b-5ee2f5b8ea93	00030000-55fb-beec-ab7e-8961dd058d68
00020000-55fb-beed-950b-5ee2f5b8ea93	00030000-55fb-beec-0a99-f0935a444316
00020000-55fb-beed-950b-5ee2f5b8ea93	00030000-55fb-beec-c024-e8113bce2937
00020000-55fb-beed-950b-5ee2f5b8ea93	00030000-55fb-beec-6479-a0ac2f45d149
00020000-55fb-beed-950b-5ee2f5b8ea93	00030000-55fb-beec-eabc-4d5e657ceb26
00020000-55fb-beed-950b-5ee2f5b8ea93	00030000-55fb-beec-6419-14b841720ede
00020000-55fb-beed-950b-5ee2f5b8ea93	00030000-55fb-beec-dce6-8f253d341e9e
00020000-55fb-beed-950b-5ee2f5b8ea93	00030000-55fb-beec-9c9a-d091f7730865
00020000-55fb-beed-950b-5ee2f5b8ea93	00030000-55fb-beec-f49f-829e39406e4a
00020000-55fb-beed-950b-5ee2f5b8ea93	00030000-55fb-beec-5cb3-9ba288913f58
00020000-55fb-beed-950b-5ee2f5b8ea93	00030000-55fb-beec-5e04-72d5e0a5f978
00020000-55fb-beed-950b-5ee2f5b8ea93	00030000-55fb-beec-a9a8-b754874fc186
00020000-55fb-beed-950b-5ee2f5b8ea93	00030000-55fb-beec-8cdb-cfd8e0a5680a
00020000-55fb-beed-950b-5ee2f5b8ea93	00030000-55fb-beec-f0e4-9b1aa295fa7b
00020000-55fb-beed-950b-5ee2f5b8ea93	00030000-55fb-beec-0c81-3c048b7c1ad8
00020000-55fb-beed-950b-5ee2f5b8ea93	00030000-55fb-beec-6601-117348e89641
00020000-55fb-beed-950b-5ee2f5b8ea93	00030000-55fb-beec-89e2-de51b454f2d8
00020000-55fb-beed-950b-5ee2f5b8ea93	00030000-55fb-beec-c789-a40162c36683
00020000-55fb-beed-950b-5ee2f5b8ea93	00030000-55fb-beec-6f50-445f43a4fc8b
00020000-55fb-beed-950b-5ee2f5b8ea93	00030000-55fb-beec-8851-10431bd64210
00020000-55fb-beed-950b-5ee2f5b8ea93	00030000-55fb-beec-9ea7-ace7466b3996
00020000-55fb-beed-950b-5ee2f5b8ea93	00030000-55fb-beec-de47-43b63cc030da
00020000-55fb-beed-950b-5ee2f5b8ea93	00030000-55fb-beec-abd4-35bce78e9855
00020000-55fb-beed-c844-c7e124fad815	00030000-55fb-beec-d6ef-b81db1760274
00020000-55fb-beed-c844-c7e124fad815	00030000-55fb-beec-1781-02f719a35258
00020000-55fb-beed-c844-c7e124fad815	00030000-55fb-beec-0a4e-74a2fe6a1ef3
00020000-55fb-beed-c844-c7e124fad815	00030000-55fb-beec-440a-2a8194733219
00020000-55fb-beed-c844-c7e124fad815	00030000-55fb-beec-444b-216803abf019
00020000-55fb-beed-c844-c7e124fad815	00030000-55fb-beec-cdae-4c68b3bdbf46
00020000-55fb-beed-c844-c7e124fad815	00030000-55fb-beec-f1ce-987250cc6b34
00020000-55fb-beed-c844-c7e124fad815	00030000-55fb-beec-acc0-8e3f6e8af910
00020000-55fb-beed-c844-c7e124fad815	00030000-55fb-beec-2b35-418039eda82f
00020000-55fb-beed-c844-c7e124fad815	00030000-55fb-beec-dfec-36cb27dea9ac
00020000-55fb-beed-c844-c7e124fad815	00030000-55fb-beec-d6c5-8023df393629
00020000-55fb-beed-c844-c7e124fad815	00030000-55fb-beec-d319-467024c98c22
00020000-55fb-beed-c844-c7e124fad815	00030000-55fb-beec-8dff-c0ae90094384
00020000-55fb-beed-c844-c7e124fad815	00030000-55fb-beec-158b-ebeb86df83af
00020000-55fb-beed-c844-c7e124fad815	00030000-55fb-beec-ab7e-8961dd058d68
00020000-55fb-beed-c844-c7e124fad815	00030000-55fb-beec-0a99-f0935a444316
00020000-55fb-beed-c844-c7e124fad815	00030000-55fb-beec-c024-e8113bce2937
00020000-55fb-beed-c844-c7e124fad815	00030000-55fb-beec-dce6-8f253d341e9e
00020000-55fb-beed-c844-c7e124fad815	00030000-55fb-beec-f49f-829e39406e4a
00020000-55fb-beed-c844-c7e124fad815	00030000-55fb-beec-5e04-72d5e0a5f978
00020000-55fb-beed-c844-c7e124fad815	00030000-55fb-beec-8cdb-cfd8e0a5680a
00020000-55fb-beed-c844-c7e124fad815	00030000-55fb-beec-1588-e603dfaf867d
00020000-55fb-beed-c844-c7e124fad815	00030000-55fb-beec-f33b-6b098baa0e1b
00020000-55fb-beed-c844-c7e124fad815	00030000-55fb-beec-a69c-4fec9cfbc579
00020000-55fb-beed-c844-c7e124fad815	00030000-55fb-beec-1082-137fc741c507
00020000-55fb-beed-c844-c7e124fad815	00030000-55fb-beec-b3c3-9264415b7d89
00020000-55fb-beed-c844-c7e124fad815	00030000-55fb-beec-f685-52be9440f887
00020000-55fb-beed-c844-c7e124fad815	00030000-55fb-beec-de47-43b63cc030da
00020000-55fb-beed-c844-c7e124fad815	00030000-55fb-beec-abd4-35bce78e9855
00020000-55fb-beed-32f2-4a1f9575df71	00030000-55fb-beec-d6ef-b81db1760274
00020000-55fb-beed-32f2-4a1f9575df71	00030000-55fb-beec-6b72-b1e451974ab2
00020000-55fb-beed-32f2-4a1f9575df71	00030000-55fb-beec-1781-02f719a35258
00020000-55fb-beed-32f2-4a1f9575df71	00030000-55fb-beec-b74b-fd1591f40721
00020000-55fb-beed-32f2-4a1f9575df71	00030000-55fb-beec-841b-5ff0181c40be
00020000-55fb-beed-32f2-4a1f9575df71	00030000-55fb-beec-ac27-6edcbf08e258
00020000-55fb-beed-32f2-4a1f9575df71	00030000-55fb-beec-0a4e-74a2fe6a1ef3
00020000-55fb-beed-32f2-4a1f9575df71	00030000-55fb-beec-440a-2a8194733219
00020000-55fb-beed-32f2-4a1f9575df71	00030000-55fb-beec-7ff0-04b924ad830f
00020000-55fb-beed-32f2-4a1f9575df71	00030000-55fb-beec-444b-216803abf019
00020000-55fb-beed-32f2-4a1f9575df71	00030000-55fb-beec-cdae-4c68b3bdbf46
00020000-55fb-beed-32f2-4a1f9575df71	00030000-55fb-beec-f1ce-987250cc6b34
00020000-55fb-beed-32f2-4a1f9575df71	00030000-55fb-beec-2b35-418039eda82f
00020000-55fb-beed-32f2-4a1f9575df71	00030000-55fb-beec-dfec-36cb27dea9ac
00020000-55fb-beed-32f2-4a1f9575df71	00030000-55fb-beec-d6c5-8023df393629
00020000-55fb-beed-32f2-4a1f9575df71	00030000-55fb-beec-8dff-c0ae90094384
00020000-55fb-beed-32f2-4a1f9575df71	00030000-55fb-beec-158b-ebeb86df83af
00020000-55fb-beed-32f2-4a1f9575df71	00030000-55fb-beec-c024-e8113bce2937
00020000-55fb-beed-32f2-4a1f9575df71	00030000-55fb-beec-eabc-4d5e657ceb26
00020000-55fb-beed-32f2-4a1f9575df71	00030000-55fb-beec-dce6-8f253d341e9e
00020000-55fb-beed-32f2-4a1f9575df71	00030000-55fb-beec-f49f-829e39406e4a
00020000-55fb-beed-32f2-4a1f9575df71	00030000-55fb-beec-5e04-72d5e0a5f978
00020000-55fb-beed-32f2-4a1f9575df71	00030000-55fb-beec-8cdb-cfd8e0a5680a
00020000-55fb-beed-32f2-4a1f9575df71	00030000-55fb-beec-0c81-3c048b7c1ad8
00020000-55fb-beed-32f2-4a1f9575df71	00030000-55fb-beec-c789-a40162c36683
00020000-55fb-beed-32f2-4a1f9575df71	00030000-55fb-beec-8851-10431bd64210
00020000-55fb-beed-32f2-4a1f9575df71	00030000-55fb-beec-de47-43b63cc030da
00020000-55fb-beed-32f2-4a1f9575df71	00030000-55fb-beec-abd4-35bce78e9855
00020000-55fb-beed-7029-d60cc19d02b5	00030000-55fb-beec-d6ef-b81db1760274
00020000-55fb-beed-7029-d60cc19d02b5	00030000-55fb-beec-3a61-0862550c5220
00020000-55fb-beed-7029-d60cc19d02b5	00030000-55fb-beec-db72-a60555af9b3f
00020000-55fb-beed-7029-d60cc19d02b5	00030000-55fb-beec-1781-02f719a35258
00020000-55fb-beed-7029-d60cc19d02b5	00030000-55fb-beec-0a4e-74a2fe6a1ef3
00020000-55fb-beed-7029-d60cc19d02b5	00030000-55fb-beec-440a-2a8194733219
00020000-55fb-beed-7029-d60cc19d02b5	00030000-55fb-beec-444b-216803abf019
00020000-55fb-beed-7029-d60cc19d02b5	00030000-55fb-beec-cdae-4c68b3bdbf46
00020000-55fb-beed-7029-d60cc19d02b5	00030000-55fb-beec-2b35-418039eda82f
00020000-55fb-beed-7029-d60cc19d02b5	00030000-55fb-beec-dfec-36cb27dea9ac
00020000-55fb-beed-7029-d60cc19d02b5	00030000-55fb-beec-8dff-c0ae90094384
00020000-55fb-beed-7029-d60cc19d02b5	00030000-55fb-beec-158b-ebeb86df83af
00020000-55fb-beed-7029-d60cc19d02b5	00030000-55fb-beec-c024-e8113bce2937
00020000-55fb-beed-7029-d60cc19d02b5	00030000-55fb-beec-dce6-8f253d341e9e
00020000-55fb-beed-7029-d60cc19d02b5	00030000-55fb-beec-f49f-829e39406e4a
00020000-55fb-beed-7029-d60cc19d02b5	00030000-55fb-beec-5e04-72d5e0a5f978
00020000-55fb-beed-7029-d60cc19d02b5	00030000-55fb-beec-8cdb-cfd8e0a5680a
00020000-55fb-beed-7029-d60cc19d02b5	00030000-55fb-beec-0c81-3c048b7c1ad8
00020000-55fb-beed-7029-d60cc19d02b5	00030000-55fb-beec-de47-43b63cc030da
00020000-55fb-beed-7029-d60cc19d02b5	00030000-55fb-beec-abd4-35bce78e9855
00020000-55fb-beed-384c-23ef0e7454ee	00030000-55fb-beec-d6ef-b81db1760274
00020000-55fb-beed-384c-23ef0e7454ee	00030000-55fb-beec-1781-02f719a35258
00020000-55fb-beed-384c-23ef0e7454ee	00030000-55fb-beec-0a4e-74a2fe6a1ef3
00020000-55fb-beed-384c-23ef0e7454ee	00030000-55fb-beec-440a-2a8194733219
00020000-55fb-beed-384c-23ef0e7454ee	00030000-55fb-beec-444b-216803abf019
00020000-55fb-beed-384c-23ef0e7454ee	00030000-55fb-beec-cdae-4c68b3bdbf46
00020000-55fb-beed-384c-23ef0e7454ee	00030000-55fb-beec-2b35-418039eda82f
00020000-55fb-beed-384c-23ef0e7454ee	00030000-55fb-beec-dfec-36cb27dea9ac
00020000-55fb-beed-384c-23ef0e7454ee	00030000-55fb-beec-8dff-c0ae90094384
00020000-55fb-beed-384c-23ef0e7454ee	00030000-55fb-beec-158b-ebeb86df83af
00020000-55fb-beed-384c-23ef0e7454ee	00030000-55fb-beec-c024-e8113bce2937
00020000-55fb-beed-384c-23ef0e7454ee	00030000-55fb-beec-dce6-8f253d341e9e
00020000-55fb-beed-384c-23ef0e7454ee	00030000-55fb-beec-f49f-829e39406e4a
00020000-55fb-beed-384c-23ef0e7454ee	00030000-55fb-beec-5e04-72d5e0a5f978
00020000-55fb-beed-384c-23ef0e7454ee	00030000-55fb-beec-8cdb-cfd8e0a5680a
00020000-55fb-beed-384c-23ef0e7454ee	00030000-55fb-beec-6931-6e4e99fcf509
00020000-55fb-beed-384c-23ef0e7454ee	00030000-55fb-beec-f425-12a49b628bc7
00020000-55fb-beed-384c-23ef0e7454ee	00030000-55fb-beec-0c81-3c048b7c1ad8
00020000-55fb-beed-384c-23ef0e7454ee	00030000-55fb-beec-de47-43b63cc030da
00020000-55fb-beed-384c-23ef0e7454ee	00030000-55fb-beec-abd4-35bce78e9855
00020000-55fb-beee-8045-44a5ced5b03a	00030000-55fb-beec-4c2d-d2ffc4a0b1bb
00020000-55fb-beee-8045-44a5ced5b03a	00030000-55fb-beec-913d-420bb98c3a56
00020000-55fb-beee-8045-44a5ced5b03a	00030000-55fb-beec-f425-12a49b628bc7
00020000-55fb-beee-8045-44a5ced5b03a	00030000-55fb-beec-3256-c8848a430af6
00020000-55fb-beee-8045-44a5ced5b03a	00030000-55fb-beec-3e3e-6f04fae6ea0e
00020000-55fb-beee-8045-44a5ced5b03a	00030000-55fb-beec-7e46-29749072eed2
00020000-55fb-beee-8045-44a5ced5b03a	00030000-55fb-beec-e65a-e1bfda054205
00020000-55fb-beee-8045-44a5ced5b03a	00030000-55fb-beec-d6ef-b81db1760274
00020000-55fb-beee-8045-44a5ced5b03a	00030000-55fb-beec-3a61-0862550c5220
00020000-55fb-beee-8045-44a5ced5b03a	00030000-55fb-beec-6b72-b1e451974ab2
00020000-55fb-beee-8045-44a5ced5b03a	00030000-55fb-beec-db72-a60555af9b3f
00020000-55fb-beee-8045-44a5ced5b03a	00030000-55fb-beec-1781-02f719a35258
00020000-55fb-beee-8045-44a5ced5b03a	00030000-55fb-beec-b74b-fd1591f40721
00020000-55fb-beee-8045-44a5ced5b03a	00030000-55fb-beec-841b-5ff0181c40be
00020000-55fb-beee-8045-44a5ced5b03a	00030000-55fb-beec-2d17-b887b2c0809e
00020000-55fb-beee-8045-44a5ced5b03a	00030000-55fb-beec-ac27-6edcbf08e258
00020000-55fb-beee-8045-44a5ced5b03a	00030000-55fb-beec-746a-68d8bab98df7
00020000-55fb-beee-8045-44a5ced5b03a	00030000-55fb-beec-0a4e-74a2fe6a1ef3
00020000-55fb-beee-8045-44a5ced5b03a	00030000-55fb-beec-e846-b5c486b4ab9e
00020000-55fb-beee-8045-44a5ced5b03a	00030000-55fb-beec-440a-2a8194733219
00020000-55fb-beee-8045-44a5ced5b03a	00030000-55fb-beec-6b72-cdbaa72e9cfd
00020000-55fb-beee-8045-44a5ced5b03a	00030000-55fb-beec-22d9-7cab63277784
00020000-55fb-beee-8045-44a5ced5b03a	00030000-55fb-beec-d63e-28774116784d
00020000-55fb-beee-8045-44a5ced5b03a	00030000-55fb-beec-51cc-8e47c66bcdcf
00020000-55fb-beee-8045-44a5ced5b03a	00030000-55fb-beec-6c80-0d99e5e6cea2
00020000-55fb-beee-8045-44a5ced5b03a	00030000-55fb-beec-7ff0-04b924ad830f
00020000-55fb-beee-8045-44a5ced5b03a	00030000-55fb-beec-d655-cd48f4c5908e
00020000-55fb-beee-8045-44a5ced5b03a	00030000-55fb-beec-444b-216803abf019
00020000-55fb-beee-8045-44a5ced5b03a	00030000-55fb-beec-00a8-62e1b4968761
00020000-55fb-beee-8045-44a5ced5b03a	00030000-55fb-beec-cdae-4c68b3bdbf46
00020000-55fb-beee-8045-44a5ced5b03a	00030000-55fb-beec-686b-0ec0181ba617
00020000-55fb-beee-8045-44a5ced5b03a	00030000-55fb-beec-f1ce-987250cc6b34
00020000-55fb-beee-8045-44a5ced5b03a	00030000-55fb-beec-acc0-8e3f6e8af910
00020000-55fb-beee-8045-44a5ced5b03a	00030000-55fb-beec-87b0-e02d262c1eea
00020000-55fb-beee-8045-44a5ced5b03a	00030000-55fb-beec-4ad0-4505a66d8ee4
00020000-55fb-beee-8045-44a5ced5b03a	00030000-55fb-beec-dae3-b771e5e98cd9
00020000-55fb-beee-8045-44a5ced5b03a	00030000-55fb-beec-5d33-f9e6a7dc66c1
00020000-55fb-beee-8045-44a5ced5b03a	00030000-55fb-beec-2b35-418039eda82f
00020000-55fb-beee-8045-44a5ced5b03a	00030000-55fb-beec-a44a-cfc2cd58e942
00020000-55fb-beee-8045-44a5ced5b03a	00030000-55fb-beec-dfec-36cb27dea9ac
00020000-55fb-beee-8045-44a5ced5b03a	00030000-55fb-beec-3cfd-789d172274a4
00020000-55fb-beee-8045-44a5ced5b03a	00030000-55fb-beec-d6c5-8023df393629
00020000-55fb-beee-8045-44a5ced5b03a	00030000-55fb-beec-d319-467024c98c22
00020000-55fb-beee-8045-44a5ced5b03a	00030000-55fb-beec-4340-1305e22f4efe
00020000-55fb-beee-8045-44a5ced5b03a	00030000-55fb-beec-c765-9f2f36d3b6a8
00020000-55fb-beee-8045-44a5ced5b03a	00030000-55fb-beec-687e-1a1a9c16040d
00020000-55fb-beee-8045-44a5ced5b03a	00030000-55fb-beec-73e0-3ce582087abe
00020000-55fb-beee-8045-44a5ced5b03a	00030000-55fb-beec-409b-f0ea3039753b
00020000-55fb-beee-8045-44a5ced5b03a	00030000-55fb-beec-d1a3-7505668b9164
00020000-55fb-beee-8045-44a5ced5b03a	00030000-55fb-beec-8dff-c0ae90094384
00020000-55fb-beee-8045-44a5ced5b03a	00030000-55fb-beec-83fa-2c3e20d088e7
00020000-55fb-beee-8045-44a5ced5b03a	00030000-55fb-beec-158b-ebeb86df83af
00020000-55fb-beee-8045-44a5ced5b03a	00030000-55fb-beec-d099-971a6acbf96b
00020000-55fb-beee-8045-44a5ced5b03a	00030000-55fb-beec-a1ab-05f9ff39b11c
00020000-55fb-beee-8045-44a5ced5b03a	00030000-55fb-beec-0ad3-97366096e052
00020000-55fb-beee-8045-44a5ced5b03a	00030000-55fb-beec-4187-6633fe205ace
00020000-55fb-beee-8045-44a5ced5b03a	00030000-55fb-beec-c8a3-1c404598b00e
00020000-55fb-beee-8045-44a5ced5b03a	00030000-55fb-beec-ab7e-8961dd058d68
00020000-55fb-beee-8045-44a5ced5b03a	00030000-55fb-beec-0a99-f0935a444316
00020000-55fb-beee-8045-44a5ced5b03a	00030000-55fb-beec-c024-e8113bce2937
00020000-55fb-beee-8045-44a5ced5b03a	00030000-55fb-beec-6479-a0ac2f45d149
00020000-55fb-beee-8045-44a5ced5b03a	00030000-55fb-beec-a91b-b07cc13fe5e4
00020000-55fb-beee-8045-44a5ced5b03a	00030000-55fb-beec-f02e-79cc6012d0d8
00020000-55fb-beee-8045-44a5ced5b03a	00030000-55fb-beec-1096-00fe176ce9c5
00020000-55fb-beee-8045-44a5ced5b03a	00030000-55fb-beec-bbc1-58814938d440
00020000-55fb-beee-8045-44a5ced5b03a	00030000-55fb-beec-eabc-4d5e657ceb26
00020000-55fb-beee-8045-44a5ced5b03a	00030000-55fb-beec-6419-14b841720ede
00020000-55fb-beee-8045-44a5ced5b03a	00030000-55fb-beec-d76c-908a15e454d5
00020000-55fb-beee-8045-44a5ced5b03a	00030000-55fb-beec-5679-7512bd037e8a
00020000-55fb-beee-8045-44a5ced5b03a	00030000-55fb-beec-4ab5-2844d8f7487c
00020000-55fb-beee-8045-44a5ced5b03a	00030000-55fb-beec-85a9-b60521a4445e
00020000-55fb-beee-8045-44a5ced5b03a	00030000-55fb-beec-15cb-10c20831dfac
00020000-55fb-beee-8045-44a5ced5b03a	00030000-55fb-beec-ab50-913809e5a02a
00020000-55fb-beee-8045-44a5ced5b03a	00030000-55fb-beec-3dec-e6c470be8ecc
00020000-55fb-beee-8045-44a5ced5b03a	00030000-55fb-beec-d77b-0a7323e13b41
00020000-55fb-beee-8045-44a5ced5b03a	00030000-55fb-beec-d0e3-6e5a8843d22d
00020000-55fb-beee-8045-44a5ced5b03a	00030000-55fb-beec-1020-47278138b936
00020000-55fb-beee-8045-44a5ced5b03a	00030000-55fb-beec-3e6f-4f930db777e4
00020000-55fb-beee-8045-44a5ced5b03a	00030000-55fb-beec-5d45-f0d075a9e6e2
00020000-55fb-beee-8045-44a5ced5b03a	00030000-55fb-beec-cc46-cd0e5d21ff2d
00020000-55fb-beee-8045-44a5ced5b03a	00030000-55fb-beec-c407-489adade0d86
00020000-55fb-beee-8045-44a5ced5b03a	00030000-55fb-beec-d548-95141782b5b5
00020000-55fb-beee-8045-44a5ced5b03a	00030000-55fb-beec-f9cd-e508b9f024a6
00020000-55fb-beee-8045-44a5ced5b03a	00030000-55fb-beec-977d-ce457b676793
00020000-55fb-beee-8045-44a5ced5b03a	00030000-55fb-beec-7d95-cf3a7774dfe7
00020000-55fb-beee-8045-44a5ced5b03a	00030000-55fb-beec-6c30-0e6dd0180817
00020000-55fb-beee-8045-44a5ced5b03a	00030000-55fb-beec-ad72-0ac8a252ddf0
00020000-55fb-beee-8045-44a5ced5b03a	00030000-55fb-beec-dce6-8f253d341e9e
00020000-55fb-beee-8045-44a5ced5b03a	00030000-55fb-beec-9c9a-d091f7730865
00020000-55fb-beee-8045-44a5ced5b03a	00030000-55fb-beec-cb97-cec5ae543f4e
00020000-55fb-beee-8045-44a5ced5b03a	00030000-55fb-beec-b1f6-3ae02c5edd32
00020000-55fb-beee-8045-44a5ced5b03a	00030000-55fb-beec-32c5-d33fbf837c26
00020000-55fb-beee-8045-44a5ced5b03a	00030000-55fb-beec-79d9-84873e4cff24
00020000-55fb-beee-8045-44a5ced5b03a	00030000-55fb-beec-f49f-829e39406e4a
00020000-55fb-beee-8045-44a5ced5b03a	00030000-55fb-beec-5cb3-9ba288913f58
00020000-55fb-beee-8045-44a5ced5b03a	00030000-55fb-beec-5e04-72d5e0a5f978
00020000-55fb-beee-8045-44a5ced5b03a	00030000-55fb-beec-a9a8-b754874fc186
00020000-55fb-beee-8045-44a5ced5b03a	00030000-55fb-beec-26b5-5a560aa78852
00020000-55fb-beee-8045-44a5ced5b03a	00030000-55fb-beec-ae47-a653a8d8c95b
00020000-55fb-beee-8045-44a5ced5b03a	00030000-55fb-beec-8c07-ea10eb339233
00020000-55fb-beee-8045-44a5ced5b03a	00030000-55fb-beec-6e2a-5751fac6eb26
00020000-55fb-beee-8045-44a5ced5b03a	00030000-55fb-beec-a60d-78bf97edf7fe
00020000-55fb-beee-8045-44a5ced5b03a	00030000-55fb-beec-2118-675e0dbac2be
00020000-55fb-beee-8045-44a5ced5b03a	00030000-55fb-beec-c003-6e2b5ff92d82
00020000-55fb-beee-8045-44a5ced5b03a	00030000-55fb-beec-4c0e-f80471ad9967
00020000-55fb-beee-8045-44a5ced5b03a	00030000-55fb-beec-8cdb-cfd8e0a5680a
00020000-55fb-beee-8045-44a5ced5b03a	00030000-55fb-beec-f0e4-9b1aa295fa7b
00020000-55fb-beee-8045-44a5ced5b03a	00030000-55fb-beec-3c80-c178f0b1bfb2
00020000-55fb-beee-8045-44a5ced5b03a	00030000-55fb-beec-9618-253f3bcc20a8
00020000-55fb-beee-8045-44a5ced5b03a	00030000-55fb-beec-43f3-8a1133ffba4d
00020000-55fb-beee-8045-44a5ced5b03a	00030000-55fb-beec-829d-422ed95735f2
00020000-55fb-beee-8045-44a5ced5b03a	00030000-55fb-beec-3890-781a6b7414f8
00020000-55fb-beee-8045-44a5ced5b03a	00030000-55fb-beec-4966-34cd0d772447
00020000-55fb-beee-8045-44a5ced5b03a	00030000-55fb-beec-5e39-444e8e8b3ee3
00020000-55fb-beee-8045-44a5ced5b03a	00030000-55fb-beec-5c07-4e6493d261c3
00020000-55fb-beee-8045-44a5ced5b03a	00030000-55fb-beec-1588-e603dfaf867d
00020000-55fb-beee-8045-44a5ced5b03a	00030000-55fb-beec-f33b-6b098baa0e1b
00020000-55fb-beee-8045-44a5ced5b03a	00030000-55fb-beec-6931-6e4e99fcf509
00020000-55fb-beee-8045-44a5ced5b03a	00030000-55fb-beec-4d2d-941265b863aa
00020000-55fb-beee-8045-44a5ced5b03a	00030000-55fb-beec-0c81-3c048b7c1ad8
00020000-55fb-beee-8045-44a5ced5b03a	00030000-55fb-beec-637a-875312e559e2
00020000-55fb-beee-8045-44a5ced5b03a	00030000-55fb-beec-ea4b-84c7aaedbce6
00020000-55fb-beee-8045-44a5ced5b03a	00030000-55fb-beec-154d-248fcd544873
00020000-55fb-beee-8045-44a5ced5b03a	00030000-55fb-beec-a69c-4fec9cfbc579
00020000-55fb-beee-8045-44a5ced5b03a	00030000-55fb-beec-1082-137fc741c507
00020000-55fb-beee-8045-44a5ced5b03a	00030000-55fb-beec-6601-117348e89641
00020000-55fb-beee-8045-44a5ced5b03a	00030000-55fb-beec-89e2-de51b454f2d8
00020000-55fb-beee-8045-44a5ced5b03a	00030000-55fb-beec-c789-a40162c36683
00020000-55fb-beee-8045-44a5ced5b03a	00030000-55fb-beec-6f50-445f43a4fc8b
00020000-55fb-beee-8045-44a5ced5b03a	00030000-55fb-beec-fe4a-ce428aaca901
00020000-55fb-beee-8045-44a5ced5b03a	00030000-55fb-beec-d19c-4412d4fee70f
00020000-55fb-beee-8045-44a5ced5b03a	00030000-55fb-beec-dc76-47257ce40ffb
00020000-55fb-beee-8045-44a5ced5b03a	00030000-55fb-beec-89a4-5d70be3dc300
00020000-55fb-beee-8045-44a5ced5b03a	00030000-55fb-beec-b3c3-9264415b7d89
00020000-55fb-beee-8045-44a5ced5b03a	00030000-55fb-beec-f685-52be9440f887
00020000-55fb-beee-8045-44a5ced5b03a	00030000-55fb-beec-8851-10431bd64210
00020000-55fb-beee-8045-44a5ced5b03a	00030000-55fb-beec-9ea7-ace7466b3996
00020000-55fb-beee-8045-44a5ced5b03a	00030000-55fb-beec-de47-43b63cc030da
00020000-55fb-beee-8045-44a5ced5b03a	00030000-55fb-beec-27ac-4ebb8eb6b4f3
00020000-55fb-beee-8045-44a5ced5b03a	00030000-55fb-beec-abd4-35bce78e9855
00020000-55fb-beee-8045-44a5ced5b03a	00030000-55fb-beec-9e8d-d34a2e525d21
\.


--
-- TOC entry 2956 (class 0 OID 4194221)
-- Dependencies: 206
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 2952 (class 0 OID 4194179)
-- Dependencies: 202
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 2967 (class 0 OID 4194321)
-- Dependencies: 217
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, zacetek, konec, jeavtorskepravice, placilonavajo, vrednostvaje, planiranostevilovaj, vrednostvaj, vrednostpredstave, vrednostdopremiere, aktivna, zaposlenvdrjz, samozaposlen, igralec, opis) FROM stdin;
000b0000-55fb-beee-3468-73d143a24fed	00090000-55fb-beee-5c42-55d8c6dcf886	\N	\N	0001	\N	\N	f	f	10.00	3	10.00	30.00	10.00	t	t	f	t	Pogodba o sodelovanju
000b0000-55fb-beee-165e-bf143b1f7633	00090000-55fb-beee-4b24-525728da2693	\N	\N	0002	\N	\N	f	t	11.00	10	11.00	31.00	110.00	t	f	t	t	Pogodba za vlogo Helena
000b0000-55fb-beee-40cd-533e9076bde1	00090000-55fb-beee-ccb2-8a444c48f7bf	\N	\N	0003	\N	\N	f	f	12.00	4	12.00	32.00	12.00	t	f	t	f	Pogodba za lektoriranje
000b0000-55fb-beee-d188-8d89a6fc11e1	00090000-55fb-beee-1ad4-d4a6f82dfe6a	\N	\N	0004	\N	\N	t	f	0.00	2	300.00	30.00	300.00	t	f	t	f	Pogodba za avtorske pravice
\.


--
-- TOC entry 2931 (class 0 OID 4193928)
-- Dependencies: 181
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, drzava_id, sifra, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo, nvo) FROM stdin;
00080000-55fb-beee-518d-07eea551af6a	00040000-55fb-beec-a750-0aaac95e8b71	0988	AK	Juhuhu d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55fb-beee-28ee-0773e70d7efa	00040000-55fb-beec-a750-0aaac95e8b71	0989	AK	Hopsasa d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	t
00080000-55fb-beee-6ec0-b38c513a7398	00040000-55fb-beec-a750-0aaac95e8b71	0987	AK	Gledališče Šrum d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55fb-beee-8722-18d10ec787b7	00040000-55fb-beec-a750-0aaac95e8b71	0986	AK	Lutkovni Direndaj d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55fb-beee-a7d1-2d2a9bfe9fed	00040000-55fb-beec-a750-0aaac95e8b71	0985	AK	Tatjana Stanič, Lektoriranje, s.p.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55fb-beee-ad94-36226cf4ed26	00040000-55fb-beec-c102-65a7b67dc122	0984	AK	Gledališče Lepote tvoje		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55fb-beee-8aae-62a49b96b6dc	00040000-55fb-beec-1146-f1d28c642d98	0983	AK	Sunce naše		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55fb-beee-c10c-fca34eda04d8	00040000-55fb-beec-ff5f-528172f3703f	0982	AK	Theater Amadeus		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55fb-beee-b1d2-aa18d74870fd	00040000-55fb-beec-37ac-a5a6f747e96e	9999	AK	Fuchs		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55fb-bef0-aefd-38eb99506a2e	00040000-55fb-beec-a750-0aaac95e8b71	1001	AK	Mestno gledališče XYZ		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
\.


--
-- TOC entry 2939 (class 0 OID 4194049)
-- Dependencies: 189
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-55fb-beec-3337-09e509eea416	8341	Adlešiči
00050000-55fb-beec-70ac-373f380b8009	5270	Ajdovščina
00050000-55fb-beec-6790-8985684614c5	6280	Ankaran/Ancarano
00050000-55fb-beec-207f-80e114a05459	9253	Apače
00050000-55fb-beec-af09-c9ee541b0021	8253	Artiče
00050000-55fb-beec-f505-d09809bd6319	4275	Begunje na Gorenjskem
00050000-55fb-beec-6e62-b83da55b17f5	1382	Begunje pri Cerknici
00050000-55fb-beec-2a88-c287501cf101	9231	Beltinci
00050000-55fb-beec-16a5-705bfd5fa9b6	2234	Benedikt
00050000-55fb-beec-a38f-3687c11b1ff8	2345	Bistrica ob Dravi
00050000-55fb-beec-d3d5-44adb707c556	3256	Bistrica ob Sotli
00050000-55fb-beec-cd34-07c398c7f46c	8259	Bizeljsko
00050000-55fb-beec-670d-c1a3b3ac8fa2	1223	Blagovica
00050000-55fb-beec-7553-a9d63afd3e30	8283	Blanca
00050000-55fb-beec-e252-9fad6d5891c8	4260	Bled
00050000-55fb-beec-0a8f-9d9ae4c568b7	4273	Blejska Dobrava
00050000-55fb-beec-9c2b-65942b8b0124	9265	Bodonci
00050000-55fb-beec-2ec1-cf635123a40a	9222	Bogojina
00050000-55fb-beec-e202-3b9c4bb27e13	4263	Bohinjska Bela
00050000-55fb-beec-e8b3-693ca8181dcb	4264	Bohinjska Bistrica
00050000-55fb-beec-bf1a-1f1cf26f402b	4265	Bohinjsko jezero
00050000-55fb-beec-0205-2f5a2586c3a2	1353	Borovnica
00050000-55fb-beec-4c90-a1d20cd9a2ee	8294	Boštanj
00050000-55fb-beec-cbfc-5ff17c29ae7d	5230	Bovec
00050000-55fb-beec-3b46-f7d11f1c9342	5295	Branik
00050000-55fb-beec-067e-f8e847107c7d	3314	Braslovče
00050000-55fb-beec-4c85-4556a4d7b733	5223	Breginj
00050000-55fb-beec-a660-a69fed8fb603	8280	Brestanica
00050000-55fb-beec-e91f-9d3c4711efa2	2354	Bresternica
00050000-55fb-beec-b2f2-21b2be5f99ba	4243	Brezje
00050000-55fb-beec-0ff0-6558d4fd53df	1351	Brezovica pri Ljubljani
00050000-55fb-beec-fc0d-5859f374a8f5	8250	Brežice
00050000-55fb-beec-17ba-7f2a81469a23	4210	Brnik - Aerodrom
00050000-55fb-beec-3de0-e0bcaece29fa	8321	Brusnice
00050000-55fb-beec-d98e-4d67d9464cb8	3255	Buče
00050000-55fb-beec-1b26-ac7adfe9a70c	8276	Bučka 
00050000-55fb-beec-362c-17cff1b2b09f	9261	Cankova
00050000-55fb-beec-c98b-428583b0b2e1	3000	Celje 
00050000-55fb-beec-05be-25eb4825a75e	3001	Celje - poštni predali
00050000-55fb-beec-ad8c-8226979d1513	4207	Cerklje na Gorenjskem
00050000-55fb-beec-0420-fd6096cca32d	8263	Cerklje ob Krki
00050000-55fb-beec-6174-41d064e1f2a4	1380	Cerknica
00050000-55fb-beec-f854-e6c14600abe3	5282	Cerkno
00050000-55fb-beec-64d5-b6c2ce2a4926	2236	Cerkvenjak
00050000-55fb-beec-5350-c08c059a0c8e	2215	Ceršak
00050000-55fb-beec-0b28-dfc91717177e	2326	Cirkovce
00050000-55fb-beec-d2c4-59c06323b18e	2282	Cirkulane
00050000-55fb-beec-d439-8cda7281dc01	5273	Col
00050000-55fb-beec-6a5c-9244b7e1656d	8251	Čatež ob Savi
00050000-55fb-beec-5065-e2053689865d	1413	Čemšenik
00050000-55fb-beec-621b-f8965af381c0	5253	Čepovan
00050000-55fb-beec-4da6-ad9932ccde7e	9232	Črenšovci
00050000-55fb-beec-7884-2db51e5b9eee	2393	Črna na Koroškem
00050000-55fb-beec-e13a-7584afade1d0	6275	Črni Kal
00050000-55fb-beec-1d3f-19ea6a7685f5	5274	Črni Vrh nad Idrijo
00050000-55fb-beec-87ec-c753139cdf5f	5262	Črniče
00050000-55fb-beec-5ef8-2b3c04b57298	8340	Črnomelj
00050000-55fb-beec-407b-75a07e9cf217	6271	Dekani
00050000-55fb-beec-e3d9-7a0823ff7d93	5210	Deskle
00050000-55fb-beec-f8c0-4f66ca726df3	2253	Destrnik
00050000-55fb-beec-a357-5969bd1d91a4	6215	Divača
00050000-55fb-beec-bdf7-a74c38f6c057	1233	Dob
00050000-55fb-beec-7ad6-603e74c4df16	3224	Dobje pri Planini
00050000-55fb-beec-e28a-a2c664be32bd	8257	Dobova
00050000-55fb-beec-957f-fc0fae5730d0	1423	Dobovec
00050000-55fb-beec-dd29-655ef15a8306	5263	Dobravlje
00050000-55fb-beec-2fd3-a869cbb4514e	3204	Dobrna
00050000-55fb-beec-6ef8-75071c118626	8211	Dobrnič
00050000-55fb-beec-978e-9330ca28ab97	1356	Dobrova
00050000-55fb-beec-c750-ce5a5743ab1c	9223	Dobrovnik/Dobronak 
00050000-55fb-beec-a0b2-be610b9180a1	5212	Dobrovo v Brdih
00050000-55fb-beec-bcfd-3af894a3f204	1431	Dol pri Hrastniku
00050000-55fb-beec-2c59-1fd5307ce48b	1262	Dol pri Ljubljani
00050000-55fb-beec-14a9-a90bbc4749f6	1273	Dole pri Litiji
00050000-55fb-beec-86d3-dd5e082de13c	1331	Dolenja vas
00050000-55fb-beec-c352-cf141541e2d1	8350	Dolenjske Toplice
00050000-55fb-beec-f1e4-b90729cad135	1230	Domžale
00050000-55fb-beec-390f-3dc994ab870d	2252	Dornava
00050000-55fb-beec-d3b8-8c7535964ae1	5294	Dornberk
00050000-55fb-beec-d083-7f2cd8294b75	1319	Draga
00050000-55fb-beec-e291-d07fec75b036	8343	Dragatuš
00050000-55fb-beec-e224-bfbb7eabda83	3222	Dramlje
00050000-55fb-beec-f524-56f74d0f40fa	2370	Dravograd
00050000-55fb-beec-ce4b-20f80b2b23ce	4203	Duplje
00050000-55fb-beec-4b46-29ddea8cef7b	6221	Dutovlje
00050000-55fb-beec-9c31-16b8a4c5b0f2	8361	Dvor
00050000-55fb-beec-6d01-f02f4f3582f1	2343	Fala
00050000-55fb-beec-fb32-f3dc6c25517e	9208	Fokovci
00050000-55fb-beec-613b-b276108341f0	2313	Fram
00050000-55fb-beec-9f53-974dbe896d7b	3213	Frankolovo
00050000-55fb-beec-a1d4-9b895ee1690a	1274	Gabrovka
00050000-55fb-beec-2a05-12932be94479	8254	Globoko
00050000-55fb-beec-5086-0b3172360d8c	5275	Godovič
00050000-55fb-beec-65d8-eb1ad7052a67	4204	Golnik
00050000-55fb-beec-f43f-81380d028bfb	3303	Gomilsko
00050000-55fb-beec-4f14-a1dd7bd28962	4224	Gorenja vas
00050000-55fb-beec-2da3-5e51797885e4	3263	Gorica pri Slivnici
00050000-55fb-beec-3d61-9b7927610ad9	2272	Gorišnica
00050000-55fb-beec-6acb-f952534dec36	9250	Gornja Radgona
00050000-55fb-beec-9488-a8fee42d8161	3342	Gornji Grad
00050000-55fb-beec-7868-c6d10f1c9bc8	4282	Gozd Martuljek
00050000-55fb-beec-8759-6d062aa6a831	6272	Gračišče
00050000-55fb-beec-9f9e-cc03424c5814	9264	Grad
00050000-55fb-beec-636e-88157c453c85	8332	Gradac
00050000-55fb-beec-2d1d-271dfc0ba998	1384	Grahovo
00050000-55fb-beec-6d38-c1f55b0b76d1	5242	Grahovo ob Bači
00050000-55fb-beec-7b11-6b85ac7db82e	5251	Grgar
00050000-55fb-beec-e21b-dcf3dd91a151	3302	Griže
00050000-55fb-beec-a1bb-649c49c0da88	3231	Grobelno
00050000-55fb-beec-7117-e3e722ddacc4	1290	Grosuplje
00050000-55fb-beec-f9ee-e5349c802026	2288	Hajdina
00050000-55fb-beec-ac2b-2ed09f2ab1be	8362	Hinje
00050000-55fb-beec-4474-eb2fc58d36a7	2311	Hoče
00050000-55fb-beec-6060-21119c46a5d8	9205	Hodoš/Hodos
00050000-55fb-beec-9e37-ab6f2daf74d0	1354	Horjul
00050000-55fb-beec-ec59-78005770aa8a	1372	Hotedršica
00050000-55fb-beec-2e48-62303c86bf02	1430	Hrastnik
00050000-55fb-beec-4f49-a957277c93cf	6225	Hruševje
00050000-55fb-beec-a112-eb6304957e03	4276	Hrušica
00050000-55fb-beec-68fa-92e692204495	5280	Idrija
00050000-55fb-beec-87c2-7d37ff344011	1292	Ig
00050000-55fb-beec-0b2c-cd180556b949	6250	Ilirska Bistrica
00050000-55fb-beec-4064-41ed0eabad94	6251	Ilirska Bistrica-Trnovo
00050000-55fb-beec-29ed-49bbd5c47d00	1295	Ivančna Gorica
00050000-55fb-beec-347b-4ff54e53c348	2259	Ivanjkovci
00050000-55fb-beec-0b33-e413aaed1f88	1411	Izlake
00050000-55fb-beec-ed44-d59c43428004	6310	Izola/Isola
00050000-55fb-beec-b5aa-0bcfda879eae	2222	Jakobski Dol
00050000-55fb-beec-203d-a2b140ceae1d	2221	Jarenina
00050000-55fb-beec-9ab4-639ca5f3cfe0	6254	Jelšane
00050000-55fb-beec-3779-435f8ada7ed7	4270	Jesenice
00050000-55fb-beec-2335-b535bcdccf5e	8261	Jesenice na Dolenjskem
00050000-55fb-beec-f8c1-5c84566af1ba	3273	Jurklošter
00050000-55fb-beec-426b-2e16c1b3451e	2223	Jurovski Dol
00050000-55fb-beec-5600-d0acc1d48324	2256	Juršinci
00050000-55fb-beec-16aa-4b6455b0a058	5214	Kal nad Kanalom
00050000-55fb-beec-a15e-01535931e097	3233	Kalobje
00050000-55fb-beec-c52e-b3f544f2a017	4246	Kamna Gorica
00050000-55fb-beec-41e5-7fc8183a1014	2351	Kamnica
00050000-55fb-beec-3b64-742e2c5687df	1241	Kamnik
00050000-55fb-beec-f614-09e6c4dafb51	5213	Kanal
00050000-55fb-beec-6e5d-7017926ad59e	8258	Kapele
00050000-55fb-beec-2579-9cd42870ba9a	2362	Kapla
00050000-55fb-beec-b1b6-aa0c4b31c537	2325	Kidričevo
00050000-55fb-beec-46a9-7b6d5ada08c4	1412	Kisovec
00050000-55fb-beec-ef78-eb26f32e5c22	6253	Knežak
00050000-55fb-beec-476d-2db6bb7ce1db	5222	Kobarid
00050000-55fb-beec-1574-1e9af1f753ce	9227	Kobilje
00050000-55fb-beec-82c8-ddb66596298a	1330	Kočevje
00050000-55fb-beec-b0a2-911588054cf4	1338	Kočevska Reka
00050000-55fb-beec-b1ec-78241bc343c2	2276	Kog
00050000-55fb-beec-3251-1bf598d593b2	5211	Kojsko
00050000-55fb-beec-42f8-93bf1c46713a	6223	Komen
00050000-55fb-beec-972f-b146a056086b	1218	Komenda
00050000-55fb-beec-85a3-e2cf617026ed	6000	Koper/Capodistria 
00050000-55fb-beec-ed2f-cdee7e85144b	6001	Koper/Capodistria - poštni predali
00050000-55fb-beec-19e0-1f84fcf2d8bd	8282	Koprivnica
00050000-55fb-beec-c302-a619874fc2cb	5296	Kostanjevica na Krasu
00050000-55fb-beec-cd17-992838715312	8311	Kostanjevica na Krki
00050000-55fb-beec-f119-d16db9be4483	1336	Kostel
00050000-55fb-beec-4497-1e5edfb4c7f0	6256	Košana
00050000-55fb-beec-f30e-a291c0794ac7	2394	Kotlje
00050000-55fb-beec-7a81-e6bef36b5be5	6240	Kozina
00050000-55fb-beec-fd10-a5b696cfbd3c	3260	Kozje
00050000-55fb-beec-588a-95196890108d	4000	Kranj 
00050000-55fb-beec-662d-c39d1ccf6864	4001	Kranj - poštni predali
00050000-55fb-beec-6ab5-92391722b00d	4280	Kranjska Gora
00050000-55fb-beec-161e-5db5f5db4c81	1281	Kresnice
00050000-55fb-beec-d086-d1ea1abe2c55	4294	Križe
00050000-55fb-beec-8dd2-ed7cd80b8c57	9206	Križevci
00050000-55fb-beec-e158-9f2111f2fb87	9242	Križevci pri Ljutomeru
00050000-55fb-beec-8170-2650d834a8b2	1301	Krka
00050000-55fb-beec-317a-51ba8f38ba38	8296	Krmelj
00050000-55fb-beec-7be4-6fb50141d792	4245	Kropa
00050000-55fb-beec-eb42-45b8833c9a1e	8262	Krška vas
00050000-55fb-beec-535d-51537f647a81	8270	Krško
00050000-55fb-beec-5d01-09c79c2a3895	9263	Kuzma
00050000-55fb-beec-a6dc-4fff25663b59	2318	Laporje
00050000-55fb-beec-485e-e35421078415	3270	Laško
00050000-55fb-beec-9e06-7823c86e7e5b	1219	Laze v Tuhinju
00050000-55fb-beec-4fbe-648232db5e8a	2230	Lenart v Slovenskih goricah
00050000-55fb-beec-fd64-b55480ccdc03	9220	Lendava/Lendva
00050000-55fb-beec-bca5-222fcca1eff2	4248	Lesce
00050000-55fb-beec-5d2b-7eee4876471a	3261	Lesično
00050000-55fb-beec-2ada-5c300a61ce66	8273	Leskovec pri Krškem
00050000-55fb-beec-0a4c-b8f784c77cf9	2372	Libeliče
00050000-55fb-beec-c04f-f098f9d8f203	2341	Limbuš
00050000-55fb-beec-1f00-299239b1afaa	1270	Litija
00050000-55fb-beec-a5c0-d7d377ba9a34	3202	Ljubečna
00050000-55fb-beec-2797-196f14327341	1000	Ljubljana 
00050000-55fb-beec-76fe-477b171e9bfb	1001	Ljubljana - poštni predali
00050000-55fb-beec-d53f-1fa1e49e3cda	1231	Ljubljana - Črnuče
00050000-55fb-beec-2439-8c2d8ef9d6cd	1261	Ljubljana - Dobrunje
00050000-55fb-beec-2c1e-79f25f40046a	1260	Ljubljana - Polje
00050000-55fb-beec-b679-21e4889f7ba0	1210	Ljubljana - Šentvid
00050000-55fb-beec-6017-7438b854c93c	1211	Ljubljana - Šmartno
00050000-55fb-beec-a7da-b5665e5d5a8e	3333	Ljubno ob Savinji
00050000-55fb-beec-5da3-ba1b81e0013d	9240	Ljutomer
00050000-55fb-beec-a4bd-737002de3376	3215	Loče
00050000-55fb-beec-51c6-90df45dc79cd	5231	Log pod Mangartom
00050000-55fb-beec-9bc5-0897cc63d9c0	1358	Log pri Brezovici
00050000-55fb-beec-ea78-cb0fd6ca2aea	1370	Logatec
00050000-55fb-beec-9544-6298f9fea3ad	1371	Logatec
00050000-55fb-beec-f5a0-6bda2c84c7c6	1434	Loka pri Zidanem Mostu
00050000-55fb-beec-b51b-e52d6c02f568	3223	Loka pri Žusmu
00050000-55fb-beec-4502-d5bfa50fd67b	6219	Lokev
00050000-55fb-beec-c0f1-39fa044d7475	1318	Loški Potok
00050000-55fb-beec-6376-eaafb972dc76	2324	Lovrenc na Dravskem polju
00050000-55fb-beec-84d5-603b34655f2e	2344	Lovrenc na Pohorju
00050000-55fb-beec-6055-5b1f77e36b31	3334	Luče
00050000-55fb-beec-d638-cafce6cf0349	1225	Lukovica
00050000-55fb-beec-15ae-003afbed272d	9202	Mačkovci
00050000-55fb-beec-1c0a-680ed23fc9e2	2322	Majšperk
00050000-55fb-beec-2bc0-094f7de1d43f	2321	Makole
00050000-55fb-beec-d938-42cf67e2ec55	9243	Mala Nedelja
00050000-55fb-beec-8cb8-05fc60211706	2229	Malečnik
00050000-55fb-beec-6bd2-8638a39ca2e9	6273	Marezige
00050000-55fb-beec-16c6-58cd3621e095	2000	Maribor 
00050000-55fb-beec-5d56-0d63b0cd5382	2001	Maribor - poštni predali
00050000-55fb-beec-9954-246393e09985	2206	Marjeta na Dravskem polju
00050000-55fb-beec-5823-536caf977efc	2281	Markovci
00050000-55fb-beec-b8e2-7e6fde2deb14	9221	Martjanci
00050000-55fb-beec-3d13-e05656a2860b	6242	Materija
00050000-55fb-beec-bdcf-b9fc9e84a870	4211	Mavčiče
00050000-55fb-beec-590f-35f608607b3c	1215	Medvode
00050000-55fb-beec-3825-a95e1b6fde08	1234	Mengeš
00050000-55fb-beec-ebaf-b7358f2d8288	8330	Metlika
00050000-55fb-beec-3a55-1fc36c5f7831	2392	Mežica
00050000-55fb-beec-0073-e4f86ac2fb37	2204	Miklavž na Dravskem polju
00050000-55fb-beec-e257-870939d304a9	2275	Miklavž pri Ormožu
00050000-55fb-beec-256e-cfa9e3a78a6b	5291	Miren
00050000-55fb-beec-1d57-522de5229f84	8233	Mirna
00050000-55fb-beec-aacc-0cb027f8a125	8216	Mirna Peč
00050000-55fb-beec-b47a-12ff9293677c	2382	Mislinja
00050000-55fb-beec-581c-6ed83a2b9cfc	4281	Mojstrana
00050000-55fb-beec-dd2b-4f57c7d11b2d	8230	Mokronog
00050000-55fb-beec-21c9-eaa0d304a816	1251	Moravče
00050000-55fb-beec-a357-1cc6bec37bc3	9226	Moravske Toplice
00050000-55fb-beec-c06a-23a2d6faf299	5216	Most na Soči
00050000-55fb-beec-83b5-ed45c77d1893	1221	Motnik
00050000-55fb-beec-e527-90302865c25f	3330	Mozirje
00050000-55fb-beec-8840-18e094e8cff7	9000	Murska Sobota 
00050000-55fb-beec-3b99-e9d2576e05a4	9001	Murska Sobota - poštni predali
00050000-55fb-beec-e19a-b65e734d318d	2366	Muta
00050000-55fb-beec-70fb-5199f1bd47d3	4202	Naklo
00050000-55fb-beec-9738-bc6b5ee5e293	3331	Nazarje
00050000-55fb-beec-1ed0-b851198e29f6	1357	Notranje Gorice
00050000-55fb-beec-0d39-4bc888dbfaad	3203	Nova Cerkev
00050000-55fb-beec-49bf-09607958681e	5000	Nova Gorica 
00050000-55fb-beec-2e70-057c10b3eba8	5001	Nova Gorica - poštni predali
00050000-55fb-beec-1b40-99fc736608a8	1385	Nova vas
00050000-55fb-beec-b03a-15e7ce2038d4	8000	Novo mesto
00050000-55fb-beec-27e1-d37d3f147eb7	8001	Novo mesto - poštni predali
00050000-55fb-beec-8e1c-2423276a084d	6243	Obrov
00050000-55fb-beec-7626-d5c4ac1de066	9233	Odranci
00050000-55fb-beec-f33d-02bb08728087	2317	Oplotnica
00050000-55fb-beec-8ea6-54ec7511f135	2312	Orehova vas
00050000-55fb-beec-5598-a6257fb034ad	2270	Ormož
00050000-55fb-beec-44e6-c285946a4914	1316	Ortnek
00050000-55fb-beec-f558-9238e1e46047	1337	Osilnica
00050000-55fb-beec-c000-ebe3fcad11a7	8222	Otočec
00050000-55fb-beec-c534-d9c633dfb9df	2361	Ožbalt
00050000-55fb-beec-3339-ed0ad6fcca74	2231	Pernica
00050000-55fb-beec-ace7-19ea3c56f717	2211	Pesnica pri Mariboru
00050000-55fb-beec-6001-099da021d850	9203	Petrovci
00050000-55fb-beec-a815-65b15920a4cf	3301	Petrovče
00050000-55fb-beec-411a-0eaf38ab4dbf	6330	Piran/Pirano
00050000-55fb-beec-25ad-397600dbebfd	8255	Pišece
00050000-55fb-beec-0b89-eae2e92e5f70	6257	Pivka
00050000-55fb-beec-be7a-c1d1c75033f9	6232	Planina
00050000-55fb-beec-dc70-bf5fc1a592a3	3225	Planina pri Sevnici
00050000-55fb-beec-56bb-6540d2e57499	6276	Pobegi
00050000-55fb-beec-69a4-1099a5ccf790	8312	Podbočje
00050000-55fb-beec-6465-8049f5e63131	5243	Podbrdo
00050000-55fb-beec-155e-2b37b1f2f9d7	3254	Podčetrtek
00050000-55fb-beec-5777-e979e892643c	2273	Podgorci
00050000-55fb-beec-d92f-abe787dcd0b9	6216	Podgorje
00050000-55fb-beec-dc69-e33e6b055684	2381	Podgorje pri Slovenj Gradcu
00050000-55fb-beec-5b98-9edcb1ad590d	6244	Podgrad
00050000-55fb-beec-f110-47d6b2841aa2	1414	Podkum
00050000-55fb-beec-737f-26a976705e84	2286	Podlehnik
00050000-55fb-beec-3de8-0ff5c0862d31	5272	Podnanos
00050000-55fb-beec-c02d-7797c9e38b7b	4244	Podnart
00050000-55fb-beec-72de-400a4f23cfd3	3241	Podplat
00050000-55fb-beec-4282-292baa129453	3257	Podsreda
00050000-55fb-beec-5424-39124d92ec68	2363	Podvelka
00050000-55fb-beec-68f4-db85f2fcf681	2208	Pohorje
00050000-55fb-beec-713d-1bf4c117c410	2257	Polenšak
00050000-55fb-beec-927b-f0712ef48813	1355	Polhov Gradec
00050000-55fb-beec-10ca-0c020bf2b823	4223	Poljane nad Škofjo Loko
00050000-55fb-beec-36b0-718e4bf02ddb	2319	Poljčane
00050000-55fb-beec-f5b8-591ceadd0232	1272	Polšnik
00050000-55fb-beec-4731-28f46169def8	3313	Polzela
00050000-55fb-beec-5ece-80f7dc17a0af	3232	Ponikva
00050000-55fb-beec-7b62-4e88a8fdaa4e	6320	Portorož/Portorose
00050000-55fb-beec-e22e-e7bd32956821	6230	Postojna
00050000-55fb-beec-058f-70bf5bf4257c	2331	Pragersko
00050000-55fb-beec-f3ec-ece8dcd412ad	3312	Prebold
00050000-55fb-beec-b64e-20692d86151f	4205	Preddvor
00050000-55fb-beec-269a-5afa5aee497e	6255	Prem
00050000-55fb-beec-1ced-d40691346790	1352	Preserje
00050000-55fb-beec-a66a-6c06ad014ca7	6258	Prestranek
00050000-55fb-beec-590e-fccfe86b2b5f	2391	Prevalje
00050000-55fb-beec-6bc4-53a82a2ef3cd	3262	Prevorje
00050000-55fb-beec-e7fe-2e87ab170027	1276	Primskovo 
00050000-55fb-beec-4792-c70a22cc91c8	3253	Pristava pri Mestinju
00050000-55fb-beec-db2a-77ffd2c81a31	9207	Prosenjakovci/Partosfalva
00050000-55fb-beec-b487-a53ce2d941e2	5297	Prvačina
00050000-55fb-beec-41e1-a8060aa6edd3	2250	Ptuj
00050000-55fb-beec-5f21-a0e515a60676	2323	Ptujska Gora
00050000-55fb-beec-44fb-5468e49ae9d2	9201	Puconci
00050000-55fb-beec-7a0e-fd4b3a19fe83	2327	Rače
00050000-55fb-beec-3d4c-a819a9af16ec	1433	Radeče
00050000-55fb-beec-f704-f130ba18c2a6	9252	Radenci
00050000-55fb-beec-f5eb-70d664542da5	2360	Radlje ob Dravi
00050000-55fb-beec-51a0-a4d8c45b1bc6	1235	Radomlje
00050000-55fb-beec-9994-a76e1980240a	4240	Radovljica
00050000-55fb-beec-fbcd-cee199d469a6	8274	Raka
00050000-55fb-beec-af94-68bd29853e47	1381	Rakek
00050000-55fb-beec-14e8-62419cad143c	4283	Rateče - Planica
00050000-55fb-beec-4016-78d1f9991ffe	2390	Ravne na Koroškem
00050000-55fb-beec-7f70-25cab6fc080c	9246	Razkrižje
00050000-55fb-beec-4aa0-b572cd6694e8	3332	Rečica ob Savinji
00050000-55fb-beec-62a0-a050a6c7b1a1	5292	Renče
00050000-55fb-beec-3923-b895b80b17ae	1310	Ribnica
00050000-55fb-beec-6e9d-ff0da3c6109f	2364	Ribnica na Pohorju
00050000-55fb-beec-6307-56bca2ff8a48	3272	Rimske Toplice
00050000-55fb-beec-a585-6fbc93c6f98d	1314	Rob
00050000-55fb-beec-caaf-2c34c538af27	5215	Ročinj
00050000-55fb-beec-cc36-fbe37b2f760a	3250	Rogaška Slatina
00050000-55fb-beec-56fa-5da54dcb000c	9262	Rogašovci
00050000-55fb-beec-94be-c79efb4402f4	3252	Rogatec
00050000-55fb-beec-4883-834af406c862	1373	Rovte
00050000-55fb-beec-6cec-6e228c450a8e	2342	Ruše
00050000-55fb-beec-1723-28c731f6635f	1282	Sava
00050000-55fb-beec-cc14-331388cb4a7a	6333	Sečovlje/Sicciole
00050000-55fb-beec-0fdd-960087befa83	4227	Selca
00050000-55fb-beec-e61a-b7739ea66982	2352	Selnica ob Dravi
00050000-55fb-beec-8979-a09410a9e016	8333	Semič
00050000-55fb-beec-08b9-8fb612c44c00	8281	Senovo
00050000-55fb-beec-5b27-48069c877645	6224	Senožeče
00050000-55fb-beec-1296-b5e252f42066	8290	Sevnica
00050000-55fb-beec-ce2a-36e726c7814e	6210	Sežana
00050000-55fb-beec-f59b-c9ae84475c9b	2214	Sladki Vrh
00050000-55fb-beec-4a98-73f19dcc7fc5	5283	Slap ob Idrijci
00050000-55fb-beec-4840-3cd307368bff	2380	Slovenj Gradec
00050000-55fb-beec-b714-33a210f4402f	2310	Slovenska Bistrica
00050000-55fb-beec-2338-f587aaa22f78	3210	Slovenske Konjice
00050000-55fb-beec-9720-1b82ae2d8c1c	1216	Smlednik
00050000-55fb-beec-9948-da524e3e99f9	5232	Soča
00050000-55fb-beec-b831-e4f3985ac717	1317	Sodražica
00050000-55fb-beec-4aa6-2c89b3c1815b	3335	Solčava
00050000-55fb-beec-0ccf-9d76a16d2e40	5250	Solkan
00050000-55fb-beec-80af-6a66f73bb586	4229	Sorica
00050000-55fb-beec-dd6f-a206f6a48dd3	4225	Sovodenj
00050000-55fb-beec-55a8-60a89fba7c3e	5281	Spodnja Idrija
00050000-55fb-beec-4681-9c99188aade5	2241	Spodnji Duplek
00050000-55fb-beec-bf71-a8dfaa6dd5f1	9245	Spodnji Ivanjci
00050000-55fb-beec-80ec-230fb39859c4	2277	Središče ob Dravi
00050000-55fb-beec-a34d-5cccb77680ae	4267	Srednja vas v Bohinju
00050000-55fb-beec-444d-941fbd976447	8256	Sromlje 
00050000-55fb-beec-a8a0-95dfd2d098f5	5224	Srpenica
00050000-55fb-beec-ea97-102e71ea7120	1242	Stahovica
00050000-55fb-beec-32a8-0d2260a63c20	1332	Stara Cerkev
00050000-55fb-beec-0afd-ebe470c58e0d	8342	Stari trg ob Kolpi
00050000-55fb-beec-c22a-4059f0acbfa5	1386	Stari trg pri Ložu
00050000-55fb-beec-2b8b-0e5c0af52500	2205	Starše
00050000-55fb-beec-76ac-50937ebbab8b	2289	Stoperce
00050000-55fb-beec-53c4-b679c4b0385b	8322	Stopiče
00050000-55fb-beec-7f0e-d33a2c1db9a1	3206	Stranice
00050000-55fb-beec-9c5f-54aea12eef59	8351	Straža
00050000-55fb-beec-d660-3333837146a8	1313	Struge
00050000-55fb-beec-b13f-800a732bdcfc	8293	Studenec
00050000-55fb-beec-c79d-72aee6d18dbc	8331	Suhor
00050000-55fb-beec-8329-2466844125c8	2233	Sv. Ana v Slovenskih goricah
00050000-55fb-beec-ffd4-7d0d12b10876	2235	Sv. Trojica v Slovenskih goricah
00050000-55fb-beec-b78a-4e043d811ff4	2353	Sveti Duh na Ostrem Vrhu
00050000-55fb-beec-2aed-37599318d981	9244	Sveti Jurij ob Ščavnici
00050000-55fb-beec-4283-78970330bdd9	3264	Sveti Štefan
00050000-55fb-beec-81b9-cb39965cdae5	2258	Sveti Tomaž
00050000-55fb-beec-cec2-0dafa062d420	9204	Šalovci
00050000-55fb-beec-4fad-4801f1aa291a	5261	Šempas
00050000-55fb-beec-eac2-41e0a2d68541	5290	Šempeter pri Gorici
00050000-55fb-beec-c88a-73423a281c78	3311	Šempeter v Savinjski dolini
00050000-55fb-beec-ed07-0c0dc3ff1bc6	4208	Šenčur
00050000-55fb-beec-7d8a-9e08a5dafaa7	2212	Šentilj v Slovenskih goricah
00050000-55fb-beec-66ef-6d91a46ed0ea	8297	Šentjanž
00050000-55fb-beec-2444-9428cd56fc25	2373	Šentjanž pri Dravogradu
00050000-55fb-beec-35ab-c747a12b12de	8310	Šentjernej
00050000-55fb-beec-ff5d-59ec3aeb280c	3230	Šentjur
00050000-55fb-beec-9f37-cc0e64d95a35	3271	Šentrupert
00050000-55fb-beec-1827-cf5e95fc7746	8232	Šentrupert
00050000-55fb-beec-a514-6e7d4b1428d0	1296	Šentvid pri Stični
00050000-55fb-beec-b1d0-4e6da95898b6	8275	Škocjan
00050000-55fb-beec-111d-19cec47fece1	6281	Škofije
00050000-55fb-beec-54c4-6f2a26c0b48b	4220	Škofja Loka
00050000-55fb-beec-5762-38c49295dcbe	3211	Škofja vas
00050000-55fb-beec-1a72-28613d850525	1291	Škofljica
00050000-55fb-beec-b6a1-27343e86ee4f	6274	Šmarje
00050000-55fb-beec-5115-361d5c4c6d50	1293	Šmarje - Sap
00050000-55fb-beec-4c46-ab95223791c0	3240	Šmarje pri Jelšah
00050000-55fb-beec-afd6-8684830008e8	8220	Šmarješke Toplice
00050000-55fb-beec-5d3b-de8480f77417	2315	Šmartno na Pohorju
00050000-55fb-beec-5137-12bec804a6e3	3341	Šmartno ob Dreti
00050000-55fb-beec-b8e0-23acf4acbf84	3327	Šmartno ob Paki
00050000-55fb-beec-d0ca-918cdab78b1a	1275	Šmartno pri Litiji
00050000-55fb-beec-6728-dc99694cc021	2383	Šmartno pri Slovenj Gradcu
00050000-55fb-beec-ecc7-1a530a76e351	3201	Šmartno v Rožni dolini
00050000-55fb-beec-096b-3198161bf479	3325	Šoštanj
00050000-55fb-beec-b4c2-ea0f3530730c	6222	Štanjel
00050000-55fb-beec-67a4-40ee0d90789d	3220	Štore
00050000-55fb-beec-4592-b767433c4308	3304	Tabor
00050000-55fb-beec-2d41-3de584df28c9	3221	Teharje
00050000-55fb-beec-23e7-8578275ae3cf	9251	Tišina
00050000-55fb-beec-69c1-8110a98cfca4	5220	Tolmin
00050000-55fb-beec-5b3d-77eb5aba200c	3326	Topolšica
00050000-55fb-beec-272f-fcc2f81581a1	2371	Trbonje
00050000-55fb-beec-54d7-d131c6c39d54	1420	Trbovlje
00050000-55fb-beec-4679-6aefd3424163	8231	Trebelno 
00050000-55fb-beec-4060-a1fa702e36ed	8210	Trebnje
00050000-55fb-beec-dd74-7cd0cb82e8dd	5252	Trnovo pri Gorici
00050000-55fb-beec-4858-235e30bbd4a4	2254	Trnovska vas
00050000-55fb-beec-743d-c1dc6adbb7b6	1222	Trojane
00050000-55fb-beec-4b3b-e91015bcd9e4	1236	Trzin
00050000-55fb-beec-59a4-2695a22908bb	4290	Tržič
00050000-55fb-beec-1287-6877603248ae	8295	Tržišče
00050000-55fb-beec-d0e5-bb65f75ccc9f	1311	Turjak
00050000-55fb-beec-ef76-9b26a79cf2cf	9224	Turnišče
00050000-55fb-beec-39d1-ba55a76ee745	8323	Uršna sela
00050000-55fb-beec-a3e3-2947fea6196b	1252	Vače
00050000-55fb-beec-ad08-6e4d52add3df	3320	Velenje 
00050000-55fb-beec-5c55-4ca8be5236d1	3322	Velenje - poštni predali
00050000-55fb-beec-9f98-9c09f1a213e1	8212	Velika Loka
00050000-55fb-beec-27b6-f506bf0f4a5f	2274	Velika Nedelja
00050000-55fb-beec-bfd2-4ece598975af	9225	Velika Polana
00050000-55fb-beec-e0b9-3682356c6250	1315	Velike Lašče
00050000-55fb-beec-4397-41827683185c	8213	Veliki Gaber
00050000-55fb-beec-7697-63ed6146583c	9241	Veržej
00050000-55fb-beec-4c43-f5632bce7414	1312	Videm - Dobrepolje
00050000-55fb-beec-562e-686e379c6c78	2284	Videm pri Ptuju
00050000-55fb-beec-6ce8-cc329dbc79cd	8344	Vinica
00050000-55fb-beec-980e-913be780f818	5271	Vipava
00050000-55fb-beec-d731-b76fcf048728	4212	Visoko
00050000-55fb-beec-93e9-8569730c35b4	1294	Višnja Gora
00050000-55fb-beec-1da4-a57e86d6ac9f	3205	Vitanje
00050000-55fb-beec-2112-a57dd5f81d35	2255	Vitomarci
00050000-55fb-beec-a7a4-3d0789a268cd	1217	Vodice
00050000-55fb-beec-70f2-c76764b0d9a0	3212	Vojnik\t
00050000-55fb-beec-d848-b8502a1200eb	5293	Volčja Draga
00050000-55fb-beec-d51d-843b11adeb63	2232	Voličina
00050000-55fb-beec-38c0-1598e5642443	3305	Vransko
00050000-55fb-beec-2857-06dd3bec14d6	6217	Vremski Britof
00050000-55fb-beec-7680-f3861c627292	1360	Vrhnika
00050000-55fb-beec-340a-d41202847497	2365	Vuhred
00050000-55fb-beec-b0e6-219c8bd2a0fb	2367	Vuzenica
00050000-55fb-beec-d338-1b3f6b207bc7	8292	Zabukovje 
00050000-55fb-beec-2d33-1b13bb3953ad	1410	Zagorje ob Savi
00050000-55fb-beec-3172-ed9c7507af7a	1303	Zagradec
00050000-55fb-beec-3c36-00aeb8e017a4	2283	Zavrč
00050000-55fb-beec-f64f-c8bf2d89c740	8272	Zdole 
00050000-55fb-beec-9a94-e35fc3895b75	4201	Zgornja Besnica
00050000-55fb-beec-2434-5466eee7302c	2242	Zgornja Korena
00050000-55fb-beec-b5db-b8f8193b40ec	2201	Zgornja Kungota
00050000-55fb-beec-82a4-d7e6cd1ff4b1	2316	Zgornja Ložnica
00050000-55fb-beec-5068-10c5fe4f05c9	2314	Zgornja Polskava
00050000-55fb-beec-4902-6291c90d0863	2213	Zgornja Velka
00050000-55fb-beec-cda0-6931537f5a85	4247	Zgornje Gorje
00050000-55fb-beec-f786-e8733a0a1685	4206	Zgornje Jezersko
00050000-55fb-beec-ddcc-5856695d7e2d	2285	Zgornji Leskovec
00050000-55fb-beec-3385-564a4c5b06c2	1432	Zidani Most
00050000-55fb-beec-c322-b1561459f2ca	3214	Zreče
00050000-55fb-beec-9d3f-8b08fe74cc1c	4209	Žabnica
00050000-55fb-beec-40d2-e1797c0bef59	3310	Žalec
00050000-55fb-beec-dfcb-8cd906d156af	4228	Železniki
00050000-55fb-beec-ba42-1c385cde5a9d	2287	Žetale
00050000-55fb-beec-392c-967a6ff0614e	4226	Žiri
00050000-55fb-beec-c2b8-91ab97d9bf2d	4274	Žirovnica
00050000-55fb-beec-d872-9f3f06bc982a	8360	Žužemberk
\.


--
-- TOC entry 2980 (class 0 OID 4194575)
-- Dependencies: 230
-- Data for Name: postavkacdve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkacdve (id, skupina, podskupina, naziv, vrpremiere, vrponovitvepremier, vrponovitveprejsnjih, vrgostovanjazamejstvo, vrfestivali, vrgostovanjaint, vrostalo, programdela_id) FROM stdin;
\.


--
-- TOC entry 2951 (class 0 OID 4194173)
-- Dependencies: 201
-- Data for Name: postavkaracuna; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkaracuna (id, racun_id) FROM stdin;
\.


--
-- TOC entry 2932 (class 0 OID 4193947)
-- Dependencies: 182
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
00060000-55fb-beee-5d32-4dec45dba750	00080000-55fb-beee-518d-07eea551af6a	\N	00040000-55fb-beec-a750-0aaac95e8b71	Narodni dom	\N	Koroška 15	\N	9231	Beltinci	\N	f	t
00060000-55fb-beee-69f3-d0c1c568ddee	00080000-55fb-beee-518d-07eea551af6a	\N	00040000-55fb-beec-a750-0aaac95e8b71	Korotan	\N	Koroška 22	\N	9231	Beltinci	\N	f	f
00060000-55fb-beee-a7b2-9c24f715e381	00080000-55fb-beee-28ee-0773e70d7efa	\N	00040000-55fb-beec-a750-0aaac95e8b71	Rimljan	\N	Rimska ploščad 7	\N	9231	Beltinci	\N	f	t
\.


--
-- TOC entry 2945 (class 0 OID 4194106)
-- Dependencies: 195
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, zaporedna, porocilo) FROM stdin;
\.


--
-- TOC entry 2949 (class 0 OID 4194160)
-- Dependencies: 199
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 2983 (class 0 OID 4194604)
-- Dependencies: 233
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, koproducent_id, odstotekfinanciranja, delez, maticnikop, kpe, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 2982 (class 0 OID 4194596)
-- Dependencies: 232
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, sifra, status) FROM stdin;
00190000-55fb-beee-3a1e-3a51dc5162d3	00080000-55fb-beee-6ec0-b38c513a7398	0987	AK
00190000-55fb-beee-dd26-5d57b7c970b9	00080000-55fb-beee-28ee-0773e70d7efa	0989	AK
00190000-55fb-beee-d4f9-6d236d720690	00080000-55fb-beee-8722-18d10ec787b7	0986	AK
00190000-55fb-beee-9aac-b884adc5893e	00080000-55fb-beee-ad94-36226cf4ed26	0984	AK
00190000-55fb-beee-0c30-e7a6a7b6896a	00080000-55fb-beee-8aae-62a49b96b6dc	0983	AK
00190000-55fb-beee-65f1-2c2ec4c55e4c	00080000-55fb-beee-c10c-fca34eda04d8	0982	AK
00190000-55fb-bef0-cc81-7605cd766cb7	00080000-55fb-bef0-aefd-38eb99506a2e	1001	AK
\.


--
-- TOC entry 2977 (class 0 OID 4194467)
-- Dependencies: 227
-- Data for Name: programdela; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programdela (id, sifra, naziv, zacetek, konec, zakljuceno, potrjenprogram, stpremier, stint, stfest, strazno, stizjem, stponprem, stponprej, stponprejvelikih, stponprejmalih, stponprejmalihkopr, stponprejsredkopr, stponprejvelikihkopr, stgostujo, vrps1, vrps1do, vrps1mat, vrps1gostovsz, stizvnekomerc, stizvprem, stizvponprem, stizvponpremdoma, stizvponpremzamejo, stizvponpremgost, stizvponpremkopr, stizvponpremint, stizvponpremkoprint, stizvponprej, stizvponprejdoma, stizvponprejzamejo, stizvponprejgost, stizvponprejkopr, stizvponprejint, stizvponprejkoprint, stizvgostuj, stizvostalihnek, stizvgostovanjslo, stizvgostovanjzam, stizvgostovanjint, stobisknekom, stobisknekommat, stobisknekomgostslo, stobisknekomgostzam, stobisknekomgostint, stobiskprem, stobiskponprem, stobiskponpremdoma, stobiskponpremkopr, stobiskponpremkoprint, stobiskponpremgost, stobiskponpremzamejo, stobiskponpremint, avgobiskprired, avgzaseddvoran, avgcenavstopnice, stprodvstopnic, stkoprodukcij, stkoprodukcijint, stkoprodukcijnvo, stzaposlenih, stzaposigralcev, avgstnastopovigr, sthonorarnih, sthonorarnihigr, sthonorarnihigrtujjz, sthonorarnihigrsamoz, sredstvaint, sredstvaavt, sredstvazaprosenoprem, sredstvazaprosenoponprem, sredstvazaprosenoponprej, sredstvazaprosenogostujo, sredstvazaprosenoint, sredstvazaprosenofest, sredstvazaprosenorazno, sredstvazaprosenoizjem, sredstvadrugijavniprem, sredstvadrugijavniponprem, sredstvadrugijavniponprej, sredstvadrugijavnigostujo, sredstvadrugijavniint, sredstvadrugijavnifest, sredstvadrugijavnirazno, sredstvadrugijavniizjem, sredstvadrugiviriprem, sredstvadrugiviriponprem, sredstvadrugiviriponprej, sredstvadrugivirigostujo, sredstvadrugiviriint, sredstvadrugivirifest, sredstvadrugivirirazno, sredstvadrugiviriizjem, sredstvaavtsamoz) FROM stdin;
00290000-55fb-beee-322e-0099c833da85	0001	Testni program dela	2016-02-01	2017-02-01	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 2979 (class 0 OID 4194565)
-- Dependencies: 229
-- Data for Name: programskaenotasklopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programskaenotasklopa (id, naslovpe, avtorpe, obsegpe, mesecpe, vrednostpe, programrazno_id) FROM stdin;
\.


--
-- TOC entry 2954 (class 0 OID 4194196)
-- Dependencies: 204
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, popa_id, naslov_id, sifra, naziv, jeprizorisce, jematicnioder, seplanira, kapaciteta, opis) FROM stdin;
00220000-55fb-beee-ddfd-3a0a68c7d160	\N	\N	0001	Poskusna 1	f	\N	t	8	Poskusna učilnica v prvem
00220000-55fb-beee-c17f-d6a43daaad8f	\N	\N	0002	Poskusna 3	f	\N	f	34	Poskusna učilnica v tretjem
00220000-55fb-beee-13dc-b21c9779e2fe	\N	\N	0003	Kazinska	t	\N	t	84	Kazinska dvorana
00220000-55fb-beee-4882-321a4361face	\N	\N	0004	Mali oder	t	\N	t	24	Mali oder 
00220000-55fb-beee-1572-b829bb6f6730	\N	\N	0005	Komorni oder	t	\N	t	15	Komorni oder
00220000-55fb-beee-ebd1-3d58368dd531	\N	\N	0006	Stara dvorana	t	\N	t	96	Stara dvorana ali dvorana Franceta Prešerna
00220000-55fb-beee-96e6-af91fb5d4f38	\N	\N	0007	Velika dvorana	t	\N	t	160	Velika, glavna dvorana
\.


--
-- TOC entry 2953 (class 0 OID 4194187)
-- Dependencies: 203
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 2957 (class 0 OID 4194228)
-- Dependencies: 207
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 2963 (class 0 OID 4194279)
-- Dependencies: 213
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta, status) FROM stdin;
\.


--
-- TOC entry 2966 (class 0 OID 4194311)
-- Dependencies: 216
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 2926 (class 0 OID 4193884)
-- Dependencies: 176
-- Data for Name: revizije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY revizije (id, razred, objectid, upor, datum, tip, data) FROM stdin;
1	App\\Entity\\Popa	00080000-55fb-bef0-aefd-38eb99506a2e	00010000-55fb-beed-7693-2781d394f8bd	2015-09-18 09:36:16	INS	a:0:{}
2	App\\Entity\\Option	00000000-55fb-bef0-b030-204a15c2d13b	00010000-55fb-beed-7693-2781d394f8bd	2015-09-18 09:36:16	INS	a:0:{}
3	ProgramDela\\Entity\\ProdukcijskaHisa	00190000-55fb-bef0-cc81-7605cd766cb7	00010000-55fb-beed-7693-2781d394f8bd	2015-09-18 09:36:16	INS	a:0:{}
\.


--
-- TOC entry 2999 (class 0 OID 0)
-- Dependencies: 175
-- Name: revizije_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('revizije_id_seq', 3, true);


--
-- TOC entry 2960 (class 0 OID 4194252)
-- Dependencies: 210
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 2927 (class 0 OID 4193893)
-- Dependencies: 177
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-55fb-beed-f8ff-5546c661ff8f	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-55fb-beed-195c-e5aaf53a5441	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-55fb-beed-a80f-ef57d47adedd	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-55fb-beed-cec1-bca7ee1e3511	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-55fb-beed-950b-5ee2f5b8ea93	planer	Planer dogodkov v koledarju	t
00020000-55fb-beed-c844-c7e124fad815	kadrovska	Kadrovska služba	t
00020000-55fb-beed-32f2-4a1f9575df71	arhivar	Ažuriranje arhivalij	t
00020000-55fb-beed-7029-d60cc19d02b5	igralec	Igralec	t
00020000-55fb-beed-384c-23ef0e7454ee	prisotnost	Vnašalec prisotnosti, tudi za tiste izven uprizoritev	t
00020000-55fb-beee-8045-44a5ced5b03a	vsadovoljenja	Vloga z vsemi posameznimi dovoljenji	t
\.


--
-- TOC entry 2924 (class 0 OID 4193875)
-- Dependencies: 174
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-55fb-beed-d7a4-ef9e08f686c8	00020000-55fb-beed-a80f-ef57d47adedd
00010000-55fb-beed-7693-2781d394f8bd	00020000-55fb-beed-a80f-ef57d47adedd
00010000-55fb-beee-a934-a780f14befd1	00020000-55fb-beee-8045-44a5ced5b03a
\.


--
-- TOC entry 2955 (class 0 OID 4194209)
-- Dependencies: 205
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 2950 (class 0 OID 4194167)
-- Dependencies: 200
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 2943 (class 0 OID 4194090)
-- Dependencies: 193
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, sifra, ime, zacetek, konec, aktivna) FROM stdin;
\.


--
-- TOC entry 2920 (class 0 OID 4193838)
-- Dependencies: 170
-- Data for Name: stevilcenje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenje (id, sifra, naziv, prefix, suffix, zacetek, dolzina, format, globalno, poletih) FROM stdin;
00230000-55fb-beed-419d-66b7ed971133	pri	Privzeto številčenje po letih YYYY-N	\N	\N	1	1	%l-%n	f	t
00230000-55fb-beed-6a06-4885c9cc9307	123	Privzeto številčenje kratkih šifer	\N	\N	100	3	%n	f	f
00230000-55fb-beed-9407-9d9aa4766b4d	bcd	Globalno številčenje črtnih kod	\N	\N	1	9	%n	t	f
00230000-55fb-beed-7332-c4ccbd4ff061	sif	Številčenje šifrant	\N	\N	1000	4	%n	f	f
00230000-55fb-beed-9378-b38af16cf062	tmp	Globalno številčenje začasnih številk	tmp	\N	1000	5	%l%n	t	t
\.


--
-- TOC entry 2921 (class 0 OID 4193849)
-- Dependencies: 171
-- Data for Name: stevilcenjekonfig; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjekonfig (id, stevilcenje_id, dok) FROM stdin;
00240000-55fb-beed-2baa-0f546337af7a	00230000-55fb-beed-7332-c4ccbd4ff061	popa
00240000-55fb-beed-5d7d-4030b764ad91	00230000-55fb-beed-7332-c4ccbd4ff061	oseba
00240000-55fb-beed-6cd6-972ef56b851a	00230000-55fb-beed-7332-c4ccbd4ff061	sezona
00240000-55fb-beed-ad83-7f4b23e0d516	00230000-55fb-beed-6a06-4885c9cc9307	prostor
00240000-55fb-beed-2e79-15679f4209be	00230000-55fb-beed-7332-c4ccbd4ff061	besedilo
00240000-55fb-beed-4f57-2150a4947566	00230000-55fb-beed-7332-c4ccbd4ff061	uprizoritev
00240000-55fb-beed-23a7-420639433f3d	00230000-55fb-beed-7332-c4ccbd4ff061	funkcija
00240000-55fb-beed-10b2-9350a374a257	00230000-55fb-beed-7332-c4ccbd4ff061	tipfunkcije
00240000-55fb-beed-808e-eeab1e3cef70	00230000-55fb-beed-7332-c4ccbd4ff061	alternacija
00240000-55fb-beed-dd81-95356f587435	00230000-55fb-beed-419d-66b7ed971133	pogodba
00240000-55fb-beed-c796-76ac036f8179	00230000-55fb-beed-7332-c4ccbd4ff061	zaposlitev
00240000-55fb-beed-a5e1-01d1d96ac5ea	00230000-55fb-beed-7332-c4ccbd4ff061	zvrstuprizoritve
00240000-55fb-beed-a72a-7b7127a43446	00230000-55fb-beed-419d-66b7ed971133	programdela
00240000-55fb-beed-6e40-8518f06a6ccd	00230000-55fb-beed-7332-c4ccbd4ff061	zapis
\.


--
-- TOC entry 2922 (class 0 OID 4193857)
-- Dependencies: 172
-- Data for Name: stevilcenjestanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjestanje (id, objid, leto, stevilka) FROM stdin;
e8341e36-f52d-485d-b3a2-298b1d6c28bb	00240000-55fb-beed-2baa-0f546337af7a	0	1001
\.


--
-- TOC entry 2962 (class 0 OID 4194265)
-- Dependencies: 212
-- Data for Name: strosekuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY strosekuprizoritve (id, uprizoritev_id, popa_id, naziv, vrednostdo, vrednostna, opis, tipstroska, sort, vrstastroska_id) FROM stdin;
00270000-55fb-beee-5d0f-005de66c4c58	000e0000-55fb-beee-e0d6-4b391b032730	00080000-55fb-beee-518d-07eea551af6a	Nabava kostumov	600.50	20.00	Krila in maske	materialni	1	003b0000-55fb-beec-ca10-a1456ccc7000
00270000-55fb-beee-ab9f-772397ed672a	000e0000-55fb-beee-e0d6-4b391b032730	00080000-55fb-beee-518d-07eea551af6a	Zavese	125.70	3.10	Modra in zelena zavesa	materialni	2	003b0000-55fb-beec-ca10-a1456ccc7000
\.


--
-- TOC entry 2936 (class 0 OID 4194010)
-- Dependencies: 186
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 2948 (class 0 OID 4194147)
-- Dependencies: 198
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja) FROM stdin;
001a0000-55fb-beee-a3b2-ccf45eccd823	00180000-55fb-beee-e5b9-332e02f35cfe	000c0000-55fb-beee-ec80-4272bf6ba7da	00090000-55fb-beee-c3c0-c1aab7c9a2f0	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55fb-beee-118c-c1f0c55430dd	00180000-55fb-beee-e5b9-332e02f35cfe	000c0000-55fb-beee-be0a-636a87e77e8c	00090000-55fb-beee-1ad4-d4a6f82dfe6a	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55fb-beee-3ba6-e170bad6fad3	00180000-55fb-beee-e5b9-332e02f35cfe	000c0000-55fb-beee-db14-762057c0615a	00090000-55fb-beee-046a-aaceff18e209	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55fb-beee-09d6-bf649936bf2c	00180000-55fb-beee-e5b9-332e02f35cfe	000c0000-55fb-beee-4fd5-9c34b5f08186	00090000-55fb-beee-1e00-8a6645cd8d76	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55fb-beee-8b0c-eca646cf1638	00180000-55fb-beee-e5b9-332e02f35cfe	000c0000-55fb-beee-157f-e2bd4d9b8389	00090000-55fb-beee-c535-07e18c3a8d47	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55fb-beee-8a9c-38fde2143889	00180000-55fb-beee-fae9-99b5481f6b6c	\N	00090000-55fb-beee-c535-07e18c3a8d47	2015-08-01 20:00:00	2015-08-01 23:00:00	\N	\N	2.00
\.


--
-- TOC entry 2965 (class 0 OID 4194299)
-- Dependencies: 215
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, sifra, ime, opis, imezenski, podrocje) FROM stdin;
000f0000-55fb-beec-aac7-ed884f7173f1	01	Avtor	Avtorji	Avtorka	umetnik
000f0000-55fb-beec-5ec4-6f01160acc2b	02	Priredba	Priredba	Priredba	umetnik
000f0000-55fb-beec-cea9-03bc3967c6b6	03	Prevod	Prevod	Prevod	umetnik
000f0000-55fb-beec-0062-9f6c8c87d150	04	Režija	Režija	Režija	umetnik
000f0000-55fb-beec-31db-cf64577a1f19	05	Dramaturgija	Dramaturgija	Dramaturgija	umetnik
000f0000-55fb-beec-b931-94e6509f6f89	06	Scenografija	Scenografija	Scenografija	umetnik
000f0000-55fb-beec-6441-29321d0cdb20	07	Kostumografija	Kostumografija	Kostumografija	umetnik
000f0000-55fb-beec-b831-e83610961962	08	Koreografija	Koreografija	Koreografija	umetnik
000f0000-55fb-beec-e866-a3ca4b7c677e	09	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	umetnik
000f0000-55fb-beec-8db7-bb3bc345fe3c	10	Oblikovanje maske	Oblikovanje maske	Oblikovanje maske	umetnik
000f0000-55fb-beec-6eca-28d710faf19e	11	Lektorstvo	Lektorstvo	Lektorstvo	umetnik
000f0000-55fb-beec-1a3f-29c8ecd8e6ba	12	Glasbeni soustvarjalec	Glasbeni soustvarjalci	Glasbena soustvarjalka	umetnik
000f0000-55fb-beec-f628-e7bd06e8be28	13	Intermedijski ustvarjalec	Intermedijski ustvarjalci	Intermedijski ustvarjalka	umetnik
000f0000-55fb-beec-9688-6a3fec3457cb	14	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	umetnik
000f0000-55fb-beec-1124-7ff703fc9b23	15	Vloga	Intermedijski ustvarjalci	Intermedijska ustvarjalka	igralec
000f0000-55fb-beec-f42b-23e2ef526eac	16	Produkcija, mentorstvo	Produkcija, mentorstvo	Produkcija, mentorstvo	umetnik
000f0000-55fb-beec-4201-dbbb6f9c5a4f	17	Tehnična podpora	Tehnična podpora	Tehnična podpora	tehnik
000f0000-55fb-beec-e027-96477401c836	18	Inšpicient	Inšpicienti	Inšpicientka	inspicient
\.


--
-- TOC entry 2976 (class 0 OID 4194455)
-- Dependencies: 226
-- Data for Name: tipprogramskeenote; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipprogramskeenote (id, sifra, naziv, koprodukcija, maxfaktor, maxvsi) FROM stdin;
002b0000-55fb-beec-05a3-b17ad6a18ddf	01	Velika predstava	f	1.00	1.00
002b0000-55fb-beec-6ecf-7c9bf68df624	02	Mala predstava	f	0.50	0.50
002b0000-55fb-beec-8c0a-eceb98530626	03	Mala koprodukcija	t	0.40	1.00
002b0000-55fb-beec-b812-80a7c775814f	04	Srednja koprodukcija	t	0.70	2.00
002b0000-55fb-beec-d395-64108953af8c	05	Velika koprodukcija	t	1.00	3.00
\.


--
-- TOC entry 2938 (class 0 OID 4194035)
-- Dependencies: 188
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 2923 (class 0 OID 4193862)
-- Dependencies: 173
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-55fb-beed-7693-2781d394f8bd	Konzolni	$2y$05$NS4xMjkyMTcwMzExMjAxROqao10JnyYLO5GAcED5kRSaDOPG3TvR6	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-55fb-beee-bdb0-6fff91aea67d	testni uporabnik za inšpicienta	$2y$05$NS4xMjkyMTcwMzExMjAxROxkJ1B6xAXex6EZLIwJfWzRJ8DpfecFO	t	\N	\N	\N	ivo@ifigenija.si	\N	\N	\N
00010000-55fb-beee-3dbe-e89a3c13a10a	testni uporabnik za Tehničnega vodjo	$2y$05$NS4xMjkyMTcwMzExMjAxROu/kXWR9sP9oamkesKuxXLbxkCb387.G	t	\N	\N	\N	tona@ifigenija.si	\N	\N	\N
00010000-55fb-beee-b2ec-ea8129465b1a	testni uporabnik za igralca	$2y$05$NS4xMjkyMTcwMzExMjAxRO/hLCgClfERRsfCAFYwxNCcFIVjP2982	t	\N	\N	\N	irena@ifigenija.si	\N	\N	\N
00010000-55fb-beee-efb7-903d4774827c	testni uporabnik vnašalca termina storitev (TerminStoritve-vse)	$2y$05$NS4xMjkyMTcwMzExMjAxROT6.kTHqEq4.wa2SOnf124/N14m9qeP.	t	\N	\N	\N	tatjana@ifigenija.si	\N	\N	\N
00010000-55fb-beee-1041-e66e0892f4df	testni uporabnik, ki je inšpicient brez zapisov v TerminStoritve	$2y$05$NS4xMjkyMTcwMzExMjAxROHau47Dtb7CME5.nlWwBVM.nusFP.ra2	t	\N	\N	\N	joze@ifigenija.si	\N	\N	\N
00010000-55fb-beee-3186-250c245f43fa	testna uporabnica, ki je planerka	$2y$05$NS4xMjkyMTcwMzExMjAxRO.B/uJO3C7QRNhdX9Q2hTLQsSupj1V1S	t	\N	\N	\N	petra@ifigenija.si	\N	\N	\N
00010000-55fb-beee-e75a-358c89c04c8f	testni uporabnik, ki dobi ifi-all vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROv2d7jqhaV/Mz3EIsKoi7UoFR.SDSMBm	t	\N	\N	\N	ali@ifigenija.si	\N	\N	\N
00010000-55fb-beee-0979-505f50b2bf52	testni uporabnik, ki dobi ifi-readall vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROYB9g.gnkufr1l/gWK6mkx.ySqrOWnJC	t	\N	\N	\N	berta@ifigenija.si	\N	\N	\N
00010000-55fb-beee-3180-a3ed0e429177	testni uporabnik, ki dobi aaa-write dovoljenje	$2y$05$NS4xMjkyMTcwMzExMjAxRORujYObKX.DzpXVYbePkiJkHqg0/Ylya	t	\N	\N	\N	aaron@ifigenija.si	\N	\N	\N
00010000-55fb-beee-a934-a780f14befd1	testni uporabnik ki dobi vsa posamezna dovoljenja	$2y$05$NS4xMjkyMTcwMzExMjAxRO2ymwxVXTr7U4Ncdn.bN49E8rLw9Jg0O	t	\N	\N	\N	vesna@ifigenija.si	\N	\N	\N
00010000-55fb-beed-d7a4-ef9e08f686c8	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 2970 (class 0 OID 4194364)
-- Dependencies: 220
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, producent_id, sifra, faza, naslov, podnaslov, delovninaslov, internacionalninaslov, naslovizvirnika, podnaslovizvirnika, datumzacstudija, stevilovaj, planiranostevilovaj, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, krstna, prvaslovenska, kratkinaslov, maticnioder_id) FROM stdin;
000e0000-55fb-beee-73e7-49ee3e3241cb	00160000-55fb-beed-54b3-923f59f4f232	\N	00140000-55fb-beec-5a32-e584c3cbfd1b	\N	0001	produkcija	Sen kresne noči		Sanje	\N	\N	\N	2016-02-01	\N	\N	2016-06-01	1	William Shakespeare	f	2				\N	f	\N	\N		00220000-55fb-beee-1572-b829bb6f6730
000e0000-55fb-beee-e0d6-4b391b032730	00160000-55fb-beed-9bd6-965908d0a30c	\N	00140000-55fb-beec-7837-43ca6ab6af34	\N	0002	predprodukcija-ideja	Smoletov vrt			\N	\N	\N	2016-01-01	\N	\N	2016-04-20	2	B. Hočevar	f	2				\N	f	\N	\N		00220000-55fb-beee-ebd1-3d58368dd531
000e0000-55fb-beee-2c79-2efdb4843b2c	\N	\N	00140000-55fb-beec-7837-43ca6ab6af34	00190000-55fb-beee-3a1e-3a51dc5162d3	0003	postprodukcija	Kisli maček			\N	\N	\N	2016-02-01	\N	\N	2016-04-20	2	Caryl Churchill	t	2				\N	f	\N	\N		00220000-55fb-beee-1572-b829bb6f6730
000e0000-55fb-beee-afdb-62275e63f5a8	\N	\N	00140000-55fb-beec-7837-43ca6ab6af34	00190000-55fb-beee-3a1e-3a51dc5162d3	0004	postprodukcija	Vladimir			\N	\N	\N	2017-03-01	\N	\N	2017-04-20	2	Matjaž Zupančič	t	2				\N	f	\N	\N		00220000-55fb-beee-1572-b829bb6f6730
000e0000-55fb-beee-860a-220674128294	\N	\N	00140000-55fb-beec-7837-43ca6ab6af34	00190000-55fb-beee-3a1e-3a51dc5162d3	0005	postprodukcija	Španska princesa			\N	\N	\N	2017-04-01	\N	\N	2017-05-20	1	Nina Kokelj	f	1				\N	f	\N	\N		00220000-55fb-beee-ddfd-3a0a68c7d160
000e0000-55fb-beee-50ca-6dba77498322	\N	\N	00140000-55fb-beec-7837-43ca6ab6af34	00190000-55fb-beee-3a1e-3a51dc5162d3	0006	postprodukcija	Ne vemo datumov			\N	\N	\N	\N	\N	\N	\N	1	Nandi Frafar	f	1				\N	f	\N	\N		00220000-55fb-beee-ddfd-3a0a68c7d160
\.


--
-- TOC entry 2942 (class 0 OID 4194080)
-- Dependencies: 192
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, uprizoritev_id, vrsta, zaporedna, porocilo) FROM stdin;
00200000-55fb-beee-d736-4c05f3f10498	000e0000-55fb-beee-e0d6-4b391b032730	\N	1	
00200000-55fb-beee-4f28-3701e006784f	000e0000-55fb-beee-e0d6-4b391b032730	\N	2	
00200000-55fb-beee-a207-b29796c640fa	000e0000-55fb-beee-e0d6-4b391b032730	\N	3	
00200000-55fb-beee-66a1-42bd097b2e09	000e0000-55fb-beee-e0d6-4b391b032730	\N	4	
00200000-55fb-beee-ffe5-d4c7db44dba6	000e0000-55fb-beee-e0d6-4b391b032730	\N	5	
\.


--
-- TOC entry 2959 (class 0 OID 4194244)
-- Dependencies: 209
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 2964 (class 0 OID 4194290)
-- Dependencies: 214
-- Data for Name: vrstastroska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstastroska (id, skupina, podskupina, naziv, opis) FROM stdin;
003b0000-55fb-beec-652a-914ad2a388c6	1	0	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE
003b0000-55fb-beec-ca07-36bfe80d1a58	1	1	Storitve varovanja zgradb in prostorov	storitve varovanja zgradb in prostorov (npr. gasilci na predstavah)
003b0000-55fb-beec-40ee-2fab72023d3c	1	2	Založniške in tiskarske storitve	založniške in tiskarske storitve
003b0000-55fb-beec-e564-731147515e23	1	3	Časopisi, revije, knjige in strokovna literatura	časopisi, revije, knjige in strokovna literatura
003b0000-55fb-beec-2dcf-ff23d945d621	1	4	Stroški prevajalskih storitev	stroški prevajalskih storitev
003b0000-55fb-beec-c6c8-26ca763c7407	1	5	Stroški oglaševalskih storitev	stroški oglaševalskih storitev
003b0000-55fb-beec-cf98-16b02e607f98	1	6	Izdatki za reprezentanco	izdatki za reprezentanco
003b0000-55fb-beec-8051-c83250077e96	2	0	POSEBNI MATERIAL IN STORITVE	POSEBNI MATERIAL IN STORITVE
003b0000-55fb-beec-ca10-a1456ccc7000	2	1	Drugi posebni material in storitve	drugi posebni material in storitve (npr. za instrumete - navedite)
003b0000-55fb-beec-7e16-0756b8329e16	2	2	Oprema predstave – stroški rekvizitov	Oprema predstave – stroški rekvizitov
003b0000-55fb-beec-52e0-155c0432cba6	2	3	Oprema predstave – stroški kostumov	Oprema predstave – stroški kostumov
003b0000-55fb-beec-e85c-d41f7f7cb914	2	4	Oprema predstave – stroški scenske opreme	Oprema predstave – stroški scenske opreme
003b0000-55fb-beec-bb7c-64e9641a8543	2	5	Oprema predstave – stroški avdio in video opreme	Oprema predstave – stroški avdio in video opreme
003b0000-55fb-beec-e335-8e104afb57d7	3	0	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE
003b0000-55fb-beec-f50d-a24e9dd988ab	3	1	Poštnina in kurirske storitve	poštnina in kurirske storitve
003b0000-55fb-beec-19aa-79629d509d90	4	0	PREVOZNI STROŠKI IN STORITVE	PREVOZNI STROŠKI IN STORITVE
003b0000-55fb-beec-27e8-135c939c1dbf	4	1	Goriva in maziva za prevozna sredstva	goriva in maziva za prevozna sredstva
003b0000-55fb-beec-9a5e-8a35e0cab10d	4	2	Najem vozil in selitveni stroški	najem vozil in selitveni stroški
003b0000-55fb-beec-cd28-2bfca8e19436	4	3	Drugi prevozni in transportni stroški 	drugi prevozni in transportni stroški (navedite)
003b0000-55fb-beec-5d2a-bb0230be2d35	5	0	IZDATKI ZA SLUŽBENA POTOVANJA	IZDATKI ZA SLUŽBENA POTOVANJA
003b0000-55fb-beec-6dda-dc9a047b17ce	5	1	Dnevnice za službena potovanja v državi in tujini	dnevnice za službena potovanja v državi in tujini
003b0000-55fb-beec-fb37-e3e05c2709f4	5	2	Hotelske in restavra. storitve v državi in tujini	hotelske in restavra. storitve v državi in tujini
003b0000-55fb-beec-0b86-856bf23b69bb	5	3	Stroški prevoza v državi in tujini	stroški prevoza v državi in tujini
003b0000-55fb-beec-ed18-0f3dece9a833	5	4	Drugi izdatki za službena potovanja	drugi izdatki za službena potovanja (navedite)
003b0000-55fb-beec-cddf-b8e5866bf9aa	6	0	NAJEMNINE IN ZAKUPNINE	NAJEMNINE IN ZAKUPNINE
003b0000-55fb-beec-138d-88f41f8159ad	6	1	Druge najemnine, zakupnine in licenčnine	druge najemnine, zakupnine in licenčnine (npr. najem notnega materiala, instrumentov - navedite)
003b0000-55fb-beec-4730-87e2d5e7603d	7	0	DRUGI OPERATIVNI ODHODKI	DRUGI OPERATIVNI ODHODKI
003b0000-55fb-beec-6072-92c438ff1d26	7	1	Izdatki za strok. izobraževanje zap.	izdatki za strok. izobraževanje zap.(vezani na program. enote)  
\.


--
-- TOC entry 2989 (class 0 OID 4194685)
-- Dependencies: 239
-- Data for Name: vrstazapisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstazapisa (id, oznaka, naziv, aktiven, znacka, ikona, upor, datknj) FROM stdin;
\.


--
-- TOC entry 2988 (class 0 OID 4194657)
-- Dependencies: 238
-- Data for Name: zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapis (id, vrsta_id, datoteka_id, mapa_id, avtor_id, zaklenil_id, tip, zaklenjen, datumzaklepanja, identifier, subject, title, description, coverage, creator, language, date, publisher, relation, rights, source, upor, datknj, standard, lokacija) FROM stdin;
\.


--
-- TOC entry 2990 (class 0 OID 4194697)
-- Dependencies: 240
-- Data for Name: zapislastnik; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapislastnik (id, zapis_id, lastnik, classlastnika, datum, upor, datknj) FROM stdin;
\.


--
-- TOC entry 2971 (class 0 OID 4194389)
-- Dependencies: 221
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, sifra, status, delovnomesto, zacetek, konec, tip, delovnaobveza, malica, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci) FROM stdin;
00100000-55fb-beee-05c6-7b8d2612ba80	00090000-55fb-beee-1ad4-d4a6f82dfe6a	01	A	Mojster	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55fb-beee-79eb-34b1a3407d14	00090000-55fb-beee-046a-aaceff18e209	02	A	Igralec	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55fb-beee-8149-ad3e7d28b2cf	00090000-55fb-beee-d53f-55bccc7d461a	03	A	Natakar	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55fb-beee-be63-2ddd7d43f495	00090000-55fb-beee-fcf1-050ea6a34f05	04	A	Mizar	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55fb-beee-bee8-deca1d43553b	00090000-55fb-beee-c3c0-c1aab7c9a2f0	05	A	Šivilja	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55fb-beee-863a-bf3f0b8f24da	00090000-55fb-beee-eefc-a978aca29971	06	A	Inšpicient	2010-02-01	2010-02-01	1	2		t	f	f	t
\.


--
-- TOC entry 2944 (class 0 OID 4194100)
-- Dependencies: 194
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id, oseba_id) FROM stdin;
\.


--
-- TOC entry 2969 (class 0 OID 4194354)
-- Dependencies: 219
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, sifra, naziv, opis) FROM stdin;
00140000-55fb-beec-5a32-e584c3cbfd1b	01	Drama	drama (SURS 01)
00140000-55fb-beec-b182-65318e7d7d9b	02	Opera	opera (SURS 02)
00140000-55fb-beec-b7d3-8dce9591a664	03	Balet	balet (SURS 03)
00140000-55fb-beec-d985-0d7d77f094fe	04	Plesne prireditve	plesne prireditve (SURS 04)
00140000-55fb-beec-b532-382b3f4d83f6	05	Lutkovno gledališče	lutkovno gledališče (SURS 05)
00140000-55fb-beec-7837-43ca6ab6af34	06	Raziskovalno gledališče	raziskovalno gledališče (SURS 06)
00140000-55fb-beec-80e7-8b76ce622b14	07	Drugo	drugo (SURS 07)
\.


--
-- TOC entry 2974 (class 0 OID 4194430)
-- Dependencies: 224
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, sifra, naziv, opis) FROM stdin;
\.


--
-- TOC entry 2470 (class 2606 OID 4193927)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2638 (class 2606 OID 4194406)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2620 (class 2606 OID 4194351)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2645 (class 2606 OID 4194428)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2685 (class 2606 OID 4194627)
-- Name: datoteka_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT datoteka_pkey PRIMARY KEY (id);


--
-- TOC entry 2530 (class 2606 OID 4194131)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2542 (class 2606 OID 4194146)
-- Name: dogodeksplosni_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodeksplosni
    ADD CONSTRAINT dogodeksplosni_pkey PRIMARY KEY (id);


--
-- TOC entry 2674 (class 2606 OID 4194594)
-- Name: drugivir_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT drugivir_pkey PRIMARY KEY (id);


--
-- TOC entry 2497 (class 2606 OID 4194030)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2661 (class 2606 OID 4194559)
-- Name: enotaprograma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT enotaprograma_pkey PRIMARY KEY (id);


--
-- TOC entry 2651 (class 2606 OID 4194451)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2514 (class 2606 OID 4194078)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2512 (class 2606 OID 4194066)
-- Name: kontaktnaoseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT kontaktnaoseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2586 (class 2606 OID 4194242)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2690 (class 2606 OID 4194638)
-- Name: mapa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT mapa_pkey PRIMARY KEY (id);


--
-- TOC entry 2694 (class 2606 OID 4194645)
-- Name: mapa_zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT mapa_zapis_pkey PRIMARY KEY (mapa_id, zapis_id);


--
-- TOC entry 2698 (class 2606 OID 4194654)
-- Name: mapaacl_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT mapaacl_pkey PRIMARY KEY (id);


--
-- TOC entry 2595 (class 2606 OID 4194264)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2485 (class 2606 OID 4193983)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2483 (class 2606 OID 4193970)
-- Name: optionvalue_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT optionvalue_pkey PRIMARY KEY (id);


--
-- TOC entry 2489 (class 2606 OID 4194006)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2466 (class 2606 OID 4193907)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2468 (class 2606 OID 4193918)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2578 (class 2606 OID 4194226)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2558 (class 2606 OID 4194186)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2617 (class 2606 OID 4194332)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2473 (class 2606 OID 4193944)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2507 (class 2606 OID 4194055)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2672 (class 2606 OID 4194587)
-- Name: postavkacdve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkacdve
    ADD CONSTRAINT postavkacdve_pkey PRIMARY KEY (id);


--
-- TOC entry 2556 (class 2606 OID 4194177)
-- Name: postavkaracuna_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT postavkaracuna_pkey PRIMARY KEY (id);


--
-- TOC entry 2479 (class 2606 OID 4193958)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2528 (class 2606 OID 4194113)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2551 (class 2606 OID 4194164)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2683 (class 2606 OID 4194611)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2677 (class 2606 OID 4194601)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2659 (class 2606 OID 4194509)
-- Name: programdela_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT programdela_pkey PRIMARY KEY (id);


--
-- TOC entry 2669 (class 2606 OID 4194573)
-- Name: programskaenotasklopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT programskaenotasklopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2568 (class 2606 OID 4194204)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2564 (class 2606 OID 4194191)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2584 (class 2606 OID 4194233)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2602 (class 2606 OID 4194289)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2612 (class 2606 OID 4194318)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2459 (class 2606 OID 4193892)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2593 (class 2606 OID 4194256)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2457 (class 2606 OID 4193879)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2461 (class 2606 OID 4193901)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2575 (class 2606 OID 4194217)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2553 (class 2606 OID 4194172)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2520 (class 2606 OID 4194098)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2444 (class 2606 OID 4193847)
-- Name: stevilcenje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenje
    ADD CONSTRAINT stevilcenje_pkey PRIMARY KEY (id);


--
-- TOC entry 2448 (class 2606 OID 4193854)
-- Name: stevilcenjekonfig_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT stevilcenjekonfig_pkey PRIMARY KEY (id);


--
-- TOC entry 2451 (class 2606 OID 4193861)
-- Name: stevilcenjestanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjestanje
    ADD CONSTRAINT stevilcenjestanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2600 (class 2606 OID 4194275)
-- Name: strosekuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT strosekuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2495 (class 2606 OID 4194015)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2547 (class 2606 OID 4194156)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2606 (class 2606 OID 4194308)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2656 (class 2606 OID 4194465)
-- Name: tipprogramskeenote_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipprogramskeenote
    ADD CONSTRAINT tipprogramskeenote_pkey PRIMARY KEY (id);


--
-- TOC entry 2505 (class 2606 OID 4194046)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2453 (class 2606 OID 4193874)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2633 (class 2606 OID 4194382)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2518 (class 2606 OID 4194088)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2590 (class 2606 OID 4194250)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2604 (class 2606 OID 4194298)
-- Name: vrstastroska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstastroska
    ADD CONSTRAINT vrstastroska_pkey PRIMARY KEY (id);


--
-- TOC entry 2708 (class 2606 OID 4194695)
-- Name: vrstazapisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstazapisa
    ADD CONSTRAINT vrstazapisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2705 (class 2606 OID 4194679)
-- Name: zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT zapis_pkey PRIMARY KEY (id);


--
-- TOC entry 2711 (class 2606 OID 4194703)
-- Name: zapislastnik_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT zapislastnik_pkey PRIMARY KEY (id);


--
-- TOC entry 2636 (class 2606 OID 4194397)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2524 (class 2606 OID 4194104)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2625 (class 2606 OID 4194362)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2649 (class 2606 OID 4194438)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2531 (class 1259 OID 4194140)
-- Name: dogodki_konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_konec ON dogodek USING btree (konec);


--
-- TOC entry 2532 (class 1259 OID 4194141)
-- Name: dogodki_razred; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_razred ON dogodek USING btree (razred);


--
-- TOC entry 2533 (class 1259 OID 4194139)
-- Name: dogodki_zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2534 (class 1259 OID 4194138)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2535 (class 1259 OID 4194137)
-- Name: idx_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2596 (class 1259 OID 4194276)
-- Name: idx_11ffe6e05c75296c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e05c75296c ON strosekuprizoritve USING btree (vrstastroska_id);


--
-- TOC entry 2597 (class 1259 OID 4194277)
-- Name: idx_11ffe6e062b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e062b4ffca ON strosekuprizoritve USING btree (uprizoritev_id);


--
-- TOC entry 2598 (class 1259 OID 4194278)
-- Name: idx_11ffe6e06beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e06beede51 ON strosekuprizoritve USING btree (popa_id);


--
-- TOC entry 2687 (class 1259 OID 4194640)
-- Name: idx_14a5d6d3727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d3727aca70 ON mapa USING btree (parent_id);


--
-- TOC entry 2688 (class 1259 OID 4194639)
-- Name: idx_14a5d6d38a4a6c12; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d38a4a6c12 ON mapa USING btree (lastnik_id);


--
-- TOC entry 2471 (class 1259 OID 4193946)
-- Name: idx_1c7adba5ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba5ee4b985a ON popa USING btree (drzava_id);


--
-- TOC entry 2576 (class 1259 OID 4194227)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2699 (class 1259 OID 4194683)
-- Name: idx_1ed92829253c4123; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829253c4123 ON zapis USING btree (avtor_id);


--
-- TOC entry 2700 (class 1259 OID 4194682)
-- Name: idx_1ed9282957ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282957ed422f ON zapis USING btree (mapa_id);


--
-- TOC entry 2701 (class 1259 OID 4194684)
-- Name: idx_1ed9282987ff3295; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282987ff3295 ON zapis USING btree (zaklenil_id);


--
-- TOC entry 2702 (class 1259 OID 4194681)
-- Name: idx_1ed92829a54dbb1f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829a54dbb1f ON zapis USING btree (datoteka_id);


--
-- TOC entry 2703 (class 1259 OID 4194680)
-- Name: idx_1ed92829ef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829ef943358 ON zapis USING btree (vrsta_id);


--
-- TOC entry 2548 (class 1259 OID 4194166)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2549 (class 1259 OID 4194165)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2516 (class 1259 OID 4194089)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2652 (class 1259 OID 4194452)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2653 (class 1259 OID 4194454)
-- Name: idx_23aeb9586b361365; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9586b361365 ON funkcija USING btree (tipfunkcije_id);


--
-- TOC entry 2654 (class 1259 OID 4194453)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2509 (class 1259 OID 4194068)
-- Name: idx_2942b10710389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b10710389148 ON kontaktnaoseba USING btree (oseba_id);


--
-- TOC entry 2510 (class 1259 OID 4194067)
-- Name: idx_2942b1076beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b1076beede51 ON kontaktnaoseba USING btree (popa_id);


--
-- TOC entry 2667 (class 1259 OID 4194574)
-- Name: idx_2d901816d6bc69d6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2d901816d6bc69d6 ON programskaenotasklopa USING btree (programrazno_id);


--
-- TOC entry 2613 (class 1259 OID 4194334)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2614 (class 1259 OID 4194335)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2615 (class 1259 OID 4194336)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2709 (class 1259 OID 4194704)
-- Name: idx_2eaff9dcaf91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2eaff9dcaf91ecd ON zapislastnik USING btree (zapis_id);


--
-- TOC entry 2626 (class 1259 OID 4194387)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2627 (class 1259 OID 4194384)
-- Name: idx_344a77a7c3b0d59; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a7c3b0d59 ON uprizoritev USING btree (maticnioder_id);


--
-- TOC entry 2628 (class 1259 OID 4194388)
-- Name: idx_344a77a853a965c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a853a965c ON uprizoritev USING btree (producent_id);


--
-- TOC entry 2629 (class 1259 OID 4194386)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2630 (class 1259 OID 4194385)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2502 (class 1259 OID 4194048)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2503 (class 1259 OID 4194047)
-- Name: idx_37f6541a6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a6beede51 ON trr USING btree (popa_id);


--
-- TOC entry 2487 (class 1259 OID 4194009)
-- Name: idx_466966d769e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_466966d769e8d4 ON oseba USING btree (naslov_id);


--
-- TOC entry 2591 (class 1259 OID 4194257)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2463 (class 1259 OID 4193908)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2464 (class 1259 OID 4193909)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2571 (class 1259 OID 4194220)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2572 (class 1259 OID 4194219)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2573 (class 1259 OID 4194218)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2525 (class 1259 OID 4194114)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2526 (class 1259 OID 4194115)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2446 (class 1259 OID 4193856)
-- Name: idx_6054e804ff55f926; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_6054e804ff55f926 ON stevilcenjekonfig USING btree (stevilcenje_id);


--
-- TOC entry 2579 (class 1259 OID 4194237)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2580 (class 1259 OID 4194235)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2581 (class 1259 OID 4194234)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2582 (class 1259 OID 4194236)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2454 (class 1259 OID 4193880)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2455 (class 1259 OID 4193881)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2588 (class 1259 OID 4194251)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2686 (class 1259 OID 4194628)
-- Name: idx_781826c67e3c61f9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_781826c67e3c61f9 ON datoteka USING btree (owner_id);


--
-- TOC entry 2695 (class 1259 OID 4194655)
-- Name: idx_7adc957157ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc957157ed422f ON mapaacl USING btree (mapa_id);


--
-- TOC entry 2696 (class 1259 OID 4194656)
-- Name: idx_7adc9571fa6311ef; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc9571fa6311ef ON mapaacl USING btree (perm_id);


--
-- TOC entry 2554 (class 1259 OID 4194178)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2609 (class 1259 OID 4194319)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2610 (class 1259 OID 4194320)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2662 (class 1259 OID 4194564)
-- Name: idx_8787a0e54ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e54ae1cd1c ON enotaprograma USING btree (gostitelj_id);


--
-- TOC entry 2663 (class 1259 OID 4194563)
-- Name: idx_8787a0e55d0da56c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e55d0da56c ON enotaprograma USING btree (drzavagostovanja_id);


--
-- TOC entry 2664 (class 1259 OID 4194560)
-- Name: idx_8787a0e562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e562b4ffca ON enotaprograma USING btree (uprizoritev_id);


--
-- TOC entry 2665 (class 1259 OID 4194561)
-- Name: idx_8787a0e57222d84b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e57222d84b ON enotaprograma USING btree (tipprogramskeenote_id);


--
-- TOC entry 2666 (class 1259 OID 4194562)
-- Name: idx_8787a0e5771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e5771ec7bd ON enotaprograma USING btree (program_dela_id);


--
-- TOC entry 2475 (class 1259 OID 4193960)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2476 (class 1259 OID 4193959)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2477 (class 1259 OID 4193961)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2565 (class 1259 OID 4194208)
-- Name: idx_952dd21969e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd21969e8d4 ON prostor USING btree (naslov_id);


--
-- TOC entry 2566 (class 1259 OID 4194207)
-- Name: idx_952dd2196beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd2196beede51 ON prostor USING btree (popa_id);


--
-- TOC entry 2680 (class 1259 OID 4194612)
-- Name: idx_97af082e38c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e38c06eb ON produkcijadelitev USING btree (enotaprograma_id);


--
-- TOC entry 2681 (class 1259 OID 4194613)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2639 (class 1259 OID 4194410)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2640 (class 1259 OID 4194411)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2641 (class 1259 OID 4194408)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2642 (class 1259 OID 4194409)
-- Name: idx_a4b7244fa4976613; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fa4976613 ON alternacija USING btree (zaposlitev_id);


--
-- TOC entry 2634 (class 1259 OID 4194398)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2559 (class 1259 OID 4194195)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2560 (class 1259 OID 4194194)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2561 (class 1259 OID 4194192)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2562 (class 1259 OID 4194193)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2621 (class 1259 OID 4194353)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2622 (class 1259 OID 4194352)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2515 (class 1259 OID 4194079)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2670 (class 1259 OID 4194588)
-- Name: idx_dba42fe79e3adf2c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_dba42fe79e3adf2c ON postavkacdve USING btree (programdela_id);


--
-- TOC entry 2675 (class 1259 OID 4194595)
-- Name: idx_e7d4cf2638c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e7d4cf2638c06eb ON drugivir USING btree (enotaprograma_id);


--
-- TOC entry 2691 (class 1259 OID 4194646)
-- Name: idx_e9f8ee8257ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee8257ed422f ON mapa_zapis USING btree (mapa_id);


--
-- TOC entry 2692 (class 1259 OID 4194647)
-- Name: idx_e9f8ee82af91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee82af91ecd ON mapa_zapis USING btree (zapis_id);


--
-- TOC entry 2480 (class 1259 OID 4193972)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2481 (class 1259 OID 4193971)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2492 (class 1259 OID 4194016)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2493 (class 1259 OID 4194017)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2522 (class 1259 OID 4194105)
-- Name: idx_f44a386d10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_f44a386d10389148 ON zasedenost USING btree (oseba_id);


--
-- TOC entry 2543 (class 1259 OID 4194159)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2544 (class 1259 OID 4194158)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2545 (class 1259 OID 4194157)
-- Name: idx_fef7d84ba81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84ba81ccef6 ON terminstoritve USING btree (dogodek_id);


--
-- TOC entry 2536 (class 1259 OID 4194133)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2537 (class 1259 OID 4194134)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2538 (class 1259 OID 4194132)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2539 (class 1259 OID 4194136)
-- Name: uniq_11e93b5dbbc7a989; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dbbc7a989 ON dogodek USING btree (dogodek_splosni_id);


--
-- TOC entry 2540 (class 1259 OID 4194135)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2474 (class 1259 OID 4193945)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2498 (class 1259 OID 4194031)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2499 (class 1259 OID 4194033)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2500 (class 1259 OID 4194032)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2501 (class 1259 OID 4194034)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2587 (class 1259 OID 4194243)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2618 (class 1259 OID 4194333)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2631 (class 1259 OID 4194383)
-- Name: uniq_344a77a559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_344a77a559828a3 ON uprizoritev USING btree (sifra);


--
-- TOC entry 2607 (class 1259 OID 4194309)
-- Name: uniq_3f50510d559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d559828a3 ON tipfunkcije USING btree (sifra);


--
-- TOC entry 2608 (class 1259 OID 4194310)
-- Name: uniq_3f50510d55cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d55cca980 ON tipfunkcije USING btree (ime);


--
-- TOC entry 2490 (class 1259 OID 4194007)
-- Name: uniq_466966d7559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7559828a3 ON oseba USING btree (sifra);


--
-- TOC entry 2491 (class 1259 OID 4194008)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2647 (class 1259 OID 4194439)
-- Name: uniq_5216fcb0559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5216fcb0559828a3 ON zvrstuprizoritve USING btree (sifra);


--
-- TOC entry 2445 (class 1259 OID 4193848)
-- Name: uniq_5a434fbc559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5a434fbc559828a3 ON stevilcenje USING btree (sifra);


--
-- TOC entry 2486 (class 1259 OID 4193984)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2449 (class 1259 OID 4193855)
-- Name: uniq_6054e804889a7556; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_6054e804889a7556 ON stevilcenjekonfig USING btree (dok);


--
-- TOC entry 2657 (class 1259 OID 4194466)
-- Name: uniq_7d834df4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_7d834df4559828a3 ON tipprogramskeenote USING btree (sifra);


--
-- TOC entry 2569 (class 1259 OID 4194206)
-- Name: uniq_952dd21937854736; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21937854736 ON prostor USING btree (naziv);


--
-- TOC entry 2570 (class 1259 OID 4194205)
-- Name: uniq_952dd219559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd219559828a3 ON prostor USING btree (sifra);


--
-- TOC entry 2643 (class 1259 OID 4194407)
-- Name: uniq_a4b7244f559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a4b7244f559828a3 ON alternacija USING btree (sifra);


--
-- TOC entry 2508 (class 1259 OID 4194056)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2623 (class 1259 OID 4194363)
-- Name: uniq_cede8e36559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_cede8e36559828a3 ON zvrstsurs USING btree (sifra);


--
-- TOC entry 2706 (class 1259 OID 4194696)
-- Name: uniq_de1c8aa1d55226c7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_de1c8aa1d55226c7 ON vrstazapisa USING btree (oznaka);


--
-- TOC entry 2678 (class 1259 OID 4194602)
-- Name: uniq_e6fc2028559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc2028559828a3 ON produkcijskahisa USING btree (sifra);


--
-- TOC entry 2679 (class 1259 OID 4194603)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2646 (class 1259 OID 4194429)
-- Name: uniq_ec773670ca2e5fcb; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ec773670ca2e5fcb ON besedilo USING btree (stevilka);


--
-- TOC entry 2521 (class 1259 OID 4194099)
-- Name: uniq_ecc8f8c5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ecc8f8c5559828a3 ON sezona USING btree (sifra);


--
-- TOC entry 2462 (class 1259 OID 4193902)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2737 (class 2606 OID 4194830)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2738 (class 2606 OID 4194835)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2742 (class 2606 OID 4194855)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2736 (class 2606 OID 4194825)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2740 (class 2606 OID 4194845)
-- Name: fk_11e93b5dbbc7a989; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dbbc7a989 FOREIGN KEY (dogodek_splosni_id) REFERENCES dogodeksplosni(id);


--
-- TOC entry 2741 (class 2606 OID 4194850)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2739 (class 2606 OID 4194840)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2766 (class 2606 OID 4194975)
-- Name: fk_11ffe6e05c75296c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e05c75296c FOREIGN KEY (vrstastroska_id) REFERENCES vrstastroska(id);


--
-- TOC entry 2767 (class 2606 OID 4194980)
-- Name: fk_11ffe6e062b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e062b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2768 (class 2606 OID 4194985)
-- Name: fk_11ffe6e06beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e06beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2802 (class 2606 OID 4195155)
-- Name: fk_14a5d6d3727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d3727aca70 FOREIGN KEY (parent_id) REFERENCES mapa(id);


--
-- TOC entry 2801 (class 2606 OID 4195150)
-- Name: fk_14a5d6d38a4a6c12; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d38a4a6c12 FOREIGN KEY (lastnik_id) REFERENCES uporabniki(id);


--
-- TOC entry 2717 (class 2606 OID 4194730)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2758 (class 2606 OID 4194935)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2810 (class 2606 OID 4195195)
-- Name: fk_1ed92829253c4123; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829253c4123 FOREIGN KEY (avtor_id) REFERENCES uporabniki(id);


--
-- TOC entry 2809 (class 2606 OID 4195190)
-- Name: fk_1ed9282957ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282957ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2811 (class 2606 OID 4195200)
-- Name: fk_1ed9282987ff3295; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282987ff3295 FOREIGN KEY (zaklenil_id) REFERENCES uporabniki(id);


--
-- TOC entry 2808 (class 2606 OID 4195185)
-- Name: fk_1ed92829a54dbb1f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829a54dbb1f FOREIGN KEY (datoteka_id) REFERENCES datoteka(id);


--
-- TOC entry 2807 (class 2606 OID 4195180)
-- Name: fk_1ed92829ef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829ef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstazapisa(id);


--
-- TOC entry 2747 (class 2606 OID 4194880)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2746 (class 2606 OID 4194875)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2732 (class 2606 OID 4194805)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2786 (class 2606 OID 4195075)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2788 (class 2606 OID 4195085)
-- Name: fk_23aeb9586b361365; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9586b361365 FOREIGN KEY (tipfunkcije_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2787 (class 2606 OID 4195080)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2730 (class 2606 OID 4194795)
-- Name: fk_2942b10710389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b10710389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2729 (class 2606 OID 4194790)
-- Name: fk_2942b1076beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b1076beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2763 (class 2606 OID 4194960)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2794 (class 2606 OID 4195115)
-- Name: fk_2d901816d6bc69d6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT fk_2d901816d6bc69d6 FOREIGN KEY (programrazno_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2771 (class 2606 OID 4195000)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2772 (class 2606 OID 4195005)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2773 (class 2606 OID 4195010)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 2812 (class 2606 OID 4195205)
-- Name: fk_2eaff9dcaf91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT fk_2eaff9dcaf91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id);


--
-- TOC entry 2779 (class 2606 OID 4195040)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2776 (class 2606 OID 4195025)
-- Name: fk_344a77a7c3b0d59; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a7c3b0d59 FOREIGN KEY (maticnioder_id) REFERENCES prostor(id);


--
-- TOC entry 2780 (class 2606 OID 4195045)
-- Name: fk_344a77a853a965c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a853a965c FOREIGN KEY (producent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2778 (class 2606 OID 4195035)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2777 (class 2606 OID 4195030)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2728 (class 2606 OID 4194785)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2727 (class 2606 OID 4194780)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2724 (class 2606 OID 4194765)
-- Name: fk_466966d769e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d769e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2723 (class 2606 OID 4194760)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2765 (class 2606 OID 4194970)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2715 (class 2606 OID 4194720)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2716 (class 2606 OID 4194725)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2757 (class 2606 OID 4194930)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2756 (class 2606 OID 4194925)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2755 (class 2606 OID 4194920)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2734 (class 2606 OID 4194815)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2735 (class 2606 OID 4194820)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2712 (class 2606 OID 4194705)
-- Name: fk_6054e804ff55f926; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT fk_6054e804ff55f926 FOREIGN KEY (stevilcenje_id) REFERENCES stevilcenje(id);


--
-- TOC entry 2762 (class 2606 OID 4194955)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2760 (class 2606 OID 4194945)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2759 (class 2606 OID 4194940)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2761 (class 2606 OID 4194950)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2713 (class 2606 OID 4194710)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2714 (class 2606 OID 4194715)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2764 (class 2606 OID 4194965)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2800 (class 2606 OID 4195145)
-- Name: fk_781826c67e3c61f9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT fk_781826c67e3c61f9 FOREIGN KEY (owner_id) REFERENCES uporabniki(id);


--
-- TOC entry 2805 (class 2606 OID 4195170)
-- Name: fk_7adc957157ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc957157ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2806 (class 2606 OID 4195175)
-- Name: fk_7adc9571fa6311ef; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc9571fa6311ef FOREIGN KEY (perm_id) REFERENCES permission(id);


--
-- TOC entry 2748 (class 2606 OID 4194885)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2769 (class 2606 OID 4194990)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2770 (class 2606 OID 4194995)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2793 (class 2606 OID 4195110)
-- Name: fk_8787a0e54ae1cd1c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e54ae1cd1c FOREIGN KEY (gostitelj_id) REFERENCES popa(id);


--
-- TOC entry 2792 (class 2606 OID 4195105)
-- Name: fk_8787a0e55d0da56c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e55d0da56c FOREIGN KEY (drzavagostovanja_id) REFERENCES drza(id);


--
-- TOC entry 2789 (class 2606 OID 4195090)
-- Name: fk_8787a0e562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2790 (class 2606 OID 4195095)
-- Name: fk_8787a0e57222d84b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e57222d84b FOREIGN KEY (tipprogramskeenote_id) REFERENCES tipprogramskeenote(id);


--
-- TOC entry 2791 (class 2606 OID 4195100)
-- Name: fk_8787a0e5771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e5771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2719 (class 2606 OID 4194740)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2718 (class 2606 OID 4194735)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2720 (class 2606 OID 4194745)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2754 (class 2606 OID 4194915)
-- Name: fk_952dd21969e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd21969e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2753 (class 2606 OID 4194910)
-- Name: fk_952dd2196beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd2196beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2798 (class 2606 OID 4195135)
-- Name: fk_97af082e38c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e38c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2799 (class 2606 OID 4195140)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2784 (class 2606 OID 4195065)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2785 (class 2606 OID 4195070)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2782 (class 2606 OID 4195055)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 2783 (class 2606 OID 4195060)
-- Name: fk_a4b7244fa4976613; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fa4976613 FOREIGN KEY (zaposlitev_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2781 (class 2606 OID 4195050)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2752 (class 2606 OID 4194905)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2751 (class 2606 OID 4194900)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2749 (class 2606 OID 4194890)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2750 (class 2606 OID 4194895)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2775 (class 2606 OID 4195020)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2774 (class 2606 OID 4195015)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2731 (class 2606 OID 4194800)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2795 (class 2606 OID 4195120)
-- Name: fk_dba42fe79e3adf2c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkacdve
    ADD CONSTRAINT fk_dba42fe79e3adf2c FOREIGN KEY (programdela_id) REFERENCES programdela(id);


--
-- TOC entry 2797 (class 2606 OID 4195130)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2796 (class 2606 OID 4195125)
-- Name: fk_e7d4cf2638c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT fk_e7d4cf2638c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2803 (class 2606 OID 4195160)
-- Name: fk_e9f8ee8257ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee8257ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id) ON DELETE CASCADE;


--
-- TOC entry 2804 (class 2606 OID 4195165)
-- Name: fk_e9f8ee82af91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee82af91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id) ON DELETE CASCADE;


--
-- TOC entry 2722 (class 2606 OID 4194755)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2721 (class 2606 OID 4194750)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2725 (class 2606 OID 4194770)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2726 (class 2606 OID 4194775)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2733 (class 2606 OID 4194810)
-- Name: fk_f44a386d10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT fk_f44a386d10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2745 (class 2606 OID 4194870)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2744 (class 2606 OID 4194865)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2743 (class 2606 OID 4194860)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- Completed on 2015-09-18 09:50:45 CEST

--
-- PostgreSQL database dump complete
--

