--
-- PostgreSQL database dump
--

-- Dumped from database version 9.4.0
-- Dumped by pg_dump version 9.4.0
-- Started on 2015-08-31 21:33:05 CEST

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

SET search_path = public, pg_catalog;

SET default_with_oids = false;

--
-- TOC entry 179 (class 1259 OID 1076733)
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
-- TOC entry 211 (class 1259 OID 1077075)
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
-- TOC entry 212 (class 1259 OID 1077088)
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
-- TOC entry 213 (class 1259 OID 1077105)
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
-- TOC entry 235 (class 1259 OID 1077429)
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
-- TOC entry 190 (class 1259 OID 1076883)
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
    allday boolean DEFAULT false NOT NULL,
    zacetek timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    konec timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    status character varying(20) DEFAULT NULL::character varying,
    razred character varying(10) DEFAULT NULL::character varying,
    termin character varying(255) DEFAULT NULL::character varying,
    title character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 191 (class 1259 OID 1076909)
-- Name: dogodeksplosni; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodeksplosni (
    id uuid NOT NULL
);


--
-- TOC entry 225 (class 1259 OID 1077260)
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
-- TOC entry 180 (class 1259 OID 1076742)
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
-- TOC entry 226 (class 1259 OID 1077267)
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
-- TOC entry 214 (class 1259 OID 1077122)
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
-- TOC entry 192 (class 1259 OID 1076914)
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
-- TOC entry 181 (class 1259 OID 1076759)
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
-- TOC entry 198 (class 1259 OID 1076970)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 236 (class 1259 OID 1077444)
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
-- TOC entry 237 (class 1259 OID 1077456)
-- Name: mapa_zapis; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE mapa_zapis (
    mapa_id uuid NOT NULL,
    zapis_id uuid NOT NULL
);


--
-- TOC entry 238 (class 1259 OID 1077463)
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
-- TOC entry 199 (class 1259 OID 1076976)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 182 (class 1259 OID 1076771)
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
-- TOC entry 183 (class 1259 OID 1076783)
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
-- TOC entry 184 (class 1259 OID 1076794)
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
    email character varying(40) DEFAULT NULL::character varying,
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
-- TOC entry 172 (class 1259 OID 1076676)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 176 (class 1259 OID 1076706)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 200 (class 1259 OID 1076983)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 201 (class 1259 OID 1076990)
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
-- TOC entry 215 (class 1259 OID 1077137)
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
-- TOC entry 185 (class 1259 OID 1076819)
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
-- TOC entry 186 (class 1259 OID 1076838)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 202 (class 1259 OID 1076998)
-- Name: postavkaracuna; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE postavkaracuna (
    id uuid NOT NULL,
    racun_id uuid
);


--
-- TOC entry 187 (class 1259 OID 1076846)
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
-- TOC entry 193 (class 1259 OID 1076925)
-- Name: predstava; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE predstava (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    gostovanje_id uuid
);


--
-- TOC entry 203 (class 1259 OID 1077004)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 227 (class 1259 OID 1077322)
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
-- TOC entry 228 (class 1259 OID 1077332)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    sifra character varying(4) NOT NULL,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 229 (class 1259 OID 1077340)
-- Name: programdela; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE programdela (
    id uuid NOT NULL,
    sezona_id uuid,
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
-- TOC entry 230 (class 1259 OID 1077384)
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
-- TOC entry 204 (class 1259 OID 1077011)
-- Name: prostor; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prostor (
    id uuid NOT NULL,
    popa_id uuid,
    naslov_id uuid,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) NOT NULL,
    jeprizorisce boolean,
    seplanira boolean DEFAULT false NOT NULL,
    kapaciteta integer,
    opis text
);


--
-- TOC entry 205 (class 1259 OID 1077024)
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
-- TOC entry 206 (class 1259 OID 1077033)
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
-- TOC entry 216 (class 1259 OID 1077153)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying,
    status character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 217 (class 1259 OID 1077164)
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
-- TOC entry 174 (class 1259 OID 1076687)
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
-- TOC entry 173 (class 1259 OID 1076685)
-- Name: revizije_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE revizije_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3261 (class 0 OID 0)
-- Dependencies: 173
-- Name: revizije_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE revizije_id_seq OWNED BY revizije.id;


--
-- TOC entry 207 (class 1259 OID 1077043)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 175 (class 1259 OID 1076696)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 178 (class 1259 OID 1076726)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 208 (class 1259 OID 1077049)
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
-- TOC entry 209 (class 1259 OID 1077061)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 194 (class 1259 OID 1076932)
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
-- TOC entry 232 (class 1259 OID 1077405)
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
-- TOC entry 233 (class 1259 OID 1077416)
-- Name: stevilcenjekonfig; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjekonfig (
    id uuid NOT NULL,
    stevilcenje_id uuid,
    dok character varying(100) DEFAULT NULL::character varying
);


--
-- TOC entry 234 (class 1259 OID 1077424)
-- Name: stevilcenjestanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjestanje (
    id uuid NOT NULL,
    objid uuid NOT NULL,
    leto integer NOT NULL,
    stevilka integer
);


--
-- TOC entry 218 (class 1259 OID 1077174)
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
-- TOC entry 188 (class 1259 OID 1076861)
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
-- TOC entry 197 (class 1259 OID 1076957)
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
-- TOC entry 219 (class 1259 OID 1077188)
-- Name: tipfunkcije; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tipfunkcije (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    opis text,
    imezenski character varying(255) DEFAULT NULL::character varying,
    podrocje character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 231 (class 1259 OID 1077394)
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
-- TOC entry 189 (class 1259 OID 1076869)
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
-- TOC entry 177 (class 1259 OID 1076713)
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
-- TOC entry 220 (class 1259 OID 1077199)
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
-- TOC entry 195 (class 1259 OID 1076942)
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
-- TOC entry 210 (class 1259 OID 1077067)
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
-- TOC entry 221 (class 1259 OID 1077224)
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
-- TOC entry 239 (class 1259 OID 1077472)
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
-- TOC entry 240 (class 1259 OID 1077484)
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
-- TOC entry 241 (class 1259 OID 1077512)
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
-- TOC entry 222 (class 1259 OID 1077233)
-- Name: zaposlitev; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zaposlitev (
    id uuid NOT NULL,
    oseba_id uuid,
    sifra character varying(10) NOT NULL,
    status character varying(10) NOT NULL,
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
-- TOC entry 196 (class 1259 OID 1076952)
-- Name: zasedenost; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zasedenost (
    id uuid NOT NULL
);


--
-- TOC entry 223 (class 1259 OID 1077240)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 224 (class 1259 OID 1077250)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 2456 (class 2604 OID 1076690)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 3192 (class 0 OID 1076733)
-- Dependencies: 179
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
\.


--
-- TOC entry 3224 (class 0 OID 1077075)
-- Dependencies: 211
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, zaposlitev_id, oseba_id, pogodba_id, sifra, zaposlen, zacetek, konec, opomba, sort, privzeti, aktivna, imapogodbo, pomembna) FROM stdin;
000c0000-55e4-ab40-fb96-c73f5c0ac09e	000d0000-55e4-ab40-92df-838f78c568bd	\N	00090000-55e4-ab40-f568-f191ebf85478	000b0000-55e4-ab40-b36f-66da62de9525	0001	f	\N	\N	\N	3	\N	\N	t	t
000c0000-55e4-ab40-aa06-f6e066f6dd11	000d0000-55e4-ab40-20ec-7df6fe7a91d7	00100000-55e4-ab40-5588-9ba3b3d9f2b2	00090000-55e4-ab40-e663-da322e20b628	\N	0002	t	2016-01-01	\N	\N	8	\N	\N	f	f
000c0000-55e4-ab40-9f68-be6ef1117a26	000d0000-55e4-ab40-491a-0bb4d641966e	00100000-55e4-ab40-c729-84247e6e49ea	00090000-55e4-ab40-ecc8-1e5ebdeb2800	\N	0003	t	\N	2015-08-31	\N	2	\N	\N	f	f
000c0000-55e4-ab40-534d-29af0895f2c3	000d0000-55e4-ab40-5802-66f20a848caa	\N	00090000-55e4-ab40-caab-e041e1498303	\N	0004	f	2016-01-01	2016-01-01	\N	26	\N	\N	f	f
000c0000-55e4-ab40-98ff-4aa696809151	000d0000-55e4-ab40-d676-d81b723b4045	\N	00090000-55e4-ab40-36e6-e47a29d9598f	\N	0005	f	2016-01-01	2016-01-01	\N	7	\N	\N	f	f
000c0000-55e4-ab40-e900-dd684864a9e7	000d0000-55e4-ab40-9c72-27ada9034087	\N	00090000-55e4-ab40-0271-3548b7b91265	000b0000-55e4-ab40-5140-92df8be4c20b	0006	f	2016-01-01	2016-01-01	\N	1	\N	\N	t	t
000c0000-55e4-ab40-96d4-3f39364e5ed3	000d0000-55e4-ab40-d352-563602e30b74	00100000-55e4-ab40-1124-26bceb9afe6e	00090000-55e4-ab40-d218-40d0980e93ad	\N	0007	t	2016-01-01	2016-01-01	\N	14	\N	\N	f	t
000c0000-55e4-ab40-66b9-4022545d293e	000d0000-55e4-ab40-13bf-e9fed6e94cfc	\N	00090000-55e4-ab40-1f61-5f624514522f	000b0000-55e4-ab40-990d-de8901056eb0	0008	f	2016-01-01	2016-01-01	\N	12	\N	\N	t	t
000c0000-55e4-ab40-32a8-0913725e8562	000d0000-55e4-ab40-d352-563602e30b74	00100000-55e4-ab40-b3a8-940f6096606d	00090000-55e4-ab40-c970-58eff1098124	\N	0009	t	2017-01-01	2017-01-01	\N	15	\N	\N	f	t
000c0000-55e4-ab40-ea41-c4830a27dfcf	000d0000-55e4-ab40-d352-563602e30b74	00100000-55e4-ab40-1e1f-5910af92f0b9	00090000-55e4-ab40-fca9-454c53fe792c	\N	0010	t	\N	2015-08-31	\N	16	\N	\N	f	t
000c0000-55e4-ab40-8f5b-9dff1228e34f	000d0000-55e4-ab40-d352-563602e30b74	00100000-55e4-ab40-ed5c-5e5b5304a79f	00090000-55e4-ab40-07c8-e0d175507196	\N	0011	t	2017-01-01	\N	\N	17	\N	\N	f	t
\.


--
-- TOC entry 3225 (class 0 OID 1077088)
-- Dependencies: 212
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 3226 (class 0 OID 1077105)
-- Dependencies: 213
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, stevilka, naslov, avtor, podnaslov, jezik, naslovizvirnika, internacionalninaslov, datumprejema, moskevloge, zenskevloge, prevajalec, povzetekvsebine, letoizida, krajizida, zaloznik) FROM stdin;
00160000-55e4-ab40-9ef8-596734c5de1f	0001	Sen kresne noči	William Shakespeare		slovenščina	A Midsummer Night's Dream	\N	2015-04-26	5	5	Milan Jesih	Nastopajo Titanija, Hipolita, Oberon, ...	\N	\N	\N
00160000-55e4-ab40-37a2-aa735b2f0742	0002	Bratje Karamazovi	Fjodor Mihajlovič Dostojevski		slovenščina	Bratja Karamazjovji	\N	2015-12-04	4	1	Vladimir Levstik	Svetovna uspešnica	\N	\N	\N
00160000-55e4-ab40-a4fb-77754cd157e7	0003	Smoletov Vrt	Berta Hočevar		slovenščina		\N	2015-05-26	2	8			\N	\N	\N
\.


--
-- TOC entry 3248 (class 0 OID 1077429)
-- Dependencies: 235
-- Data for Name: datoteka; Type: TABLE DATA; Schema: public; Owner: -
--

COPY datoteka (id, owner_id, filename, transfers, size, format, hash, createdat, uploadedat, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3203 (class 0 OID 1076883)
-- Dependencies: 190
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_splosni_id, prostor_id, sezona_id, planiranzacetek, allday, zacetek, konec, status, razred, termin, title) FROM stdin;
00180000-55e4-ab40-d5ec-a5f6361b98d3	\N	\N	00200000-55e4-ab40-b1da-ef18d8fcee05	\N	\N	\N	\N	2015-06-26 10:00:00	f	2015-06-26 10:00:00	2015-06-26 12:00:00	3			
00180000-55e4-ab40-66b2-de18f6056d54	\N	\N	00200000-55e4-ab40-7bca-85b4c7ef7ff6	\N	\N	\N	\N	2015-06-27 10:00:00	f	2015-06-27 10:00:00	2015-06-27 12:00:00	4			
00180000-55e4-ab40-efa4-3baf41ffb081	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	f	2015-08-01 20:00:00	2015-08-01 23:00:00	5			
00180000-55e4-ab40-eadb-f5025a2cc45f	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	f	2015-08-01 20:00:00	2015-08-01 23:00:00	2			
00180000-55e4-ab40-fc38-6a3fdaf27e79	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	f	2015-08-01 20:00:00	2015-08-01 23:00:00	7			
\.


--
-- TOC entry 3204 (class 0 OID 1076909)
-- Dependencies: 191
-- Data for Name: dogodeksplosni; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodeksplosni (id) FROM stdin;
\.


--
-- TOC entry 3238 (class 0 OID 1077260)
-- Dependencies: 225
-- Data for Name: drugivir; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drugivir (id, znesek, opis, mednarodni, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 3193 (class 0 OID 1076742)
-- Dependencies: 180
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-55e4-ab3e-7597-ec2def1dbaf1	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-55e4-ab3e-ea43-ea2ef2985d1b	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-55e4-ab3e-1cd3-8cf9500098c3	AL	ALB	008	Albania 	Albanija	\N
00040000-55e4-ab3e-7077-f43c4bcceb68	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-55e4-ab3e-d0ef-f95e5d57c38d	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-55e4-ab3e-fe31-e28fe0337341	AD	AND	020	Andorra 	Andora	\N
00040000-55e4-ab3e-db53-ed5cd151e847	AO	AGO	024	Angola 	Angola	\N
00040000-55e4-ab3e-05e2-b3e97e53a500	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-55e4-ab3e-b4da-942457577205	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-55e4-ab3e-5d33-3006eee71475	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-55e4-ab3e-4f91-03edb285e30a	AR	ARG	032	Argentina 	Argenitna	\N
00040000-55e4-ab3e-4622-bfa7c02d6a8d	AM	ARM	051	Armenia 	Armenija	\N
00040000-55e4-ab3e-f6e8-9164eae36695	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-55e4-ab3e-3ae3-6066d3883759	AU	AUS	036	Australia 	Avstralija	\N
00040000-55e4-ab3e-a623-7582cba26d5c	AT	AUT	040	Austria 	Avstrija	\N
00040000-55e4-ab3e-3ca2-ff30143538e9	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-55e4-ab3e-ee2c-855702b8b6b5	BS	BHS	044	Bahamas 	Bahami	\N
00040000-55e4-ab3e-89b3-5efa6e9b7edd	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-55e4-ab3e-13d2-5c20f058807e	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-55e4-ab3e-9ae9-854986959b16	BB	BRB	052	Barbados 	Barbados	\N
00040000-55e4-ab3e-e3f3-ba26b3f20c76	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-55e4-ab3e-7328-f7feb441cd56	BE	BEL	056	Belgium 	Belgija	\N
00040000-55e4-ab3e-2e14-95ed2c04e3bb	BZ	BLZ	084	Belize 	Belize	\N
00040000-55e4-ab3e-9930-5fe2d6c68ae0	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-55e4-ab3e-8737-3c84d29e33c2	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-55e4-ab3e-d0b2-66b0349c7bff	BT	BTN	064	Bhutan 	Butan	\N
00040000-55e4-ab3e-de33-61670cf230fd	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-55e4-ab3e-bc94-74384cc2a26e	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-55e4-ab3e-71a1-2c30ee07801e	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-55e4-ab3e-4cfe-e0f4c7004815	BW	BWA	072	Botswana 	Bocvana	\N
00040000-55e4-ab3e-e9d1-17c59ea2c11e	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-55e4-ab3e-4286-14e008fac002	BR	BRA	076	Brazil 	Brazilija	\N
00040000-55e4-ab3e-a49f-d136d5b9a794	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-55e4-ab3e-262a-95f7b2328cb9	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-55e4-ab3e-1656-c40b7c1a6856	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-55e4-ab3e-8a63-c2ff055794f7	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-55e4-ab3e-b73b-d0f60deec6ca	BI	BDI	108	Burundi 	Burundi 	\N
00040000-55e4-ab3e-3f4c-eaca0482a89e	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-55e4-ab3e-51c2-52bd41c080fc	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-55e4-ab3e-2e66-f89338083bcc	CA	CAN	124	Canada 	Kanada	\N
00040000-55e4-ab3e-19f3-ef932afa5096	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-55e4-ab3e-5f2a-521dd9bb99b0	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-55e4-ab3e-5098-114e9302ed9f	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-55e4-ab3e-0673-f1f18cdb32d4	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-55e4-ab3e-ad40-e3a65366f21b	CL	CHL	152	Chile 	Čile	\N
00040000-55e4-ab3e-ab6b-0fb2c1fbb249	CN	CHN	156	China 	Kitajska	\N
00040000-55e4-ab3e-9965-f62f86036ed5	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-55e4-ab3e-fee0-dd91744b9531	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-55e4-ab3e-a90e-8b07d659b6b4	CO	COL	170	Colombia 	Kolumbija	\N
00040000-55e4-ab3e-b502-198380af5cca	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-55e4-ab3e-5a08-117f50e439c8	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-55e4-ab3e-5ab5-340e478cb47e	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-55e4-ab3e-7abe-654eddea8d21	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-55e4-ab3e-1a10-71230f3febff	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-55e4-ab3e-cee3-1a47bc81c925	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-55e4-ab3e-6125-e3c5b1867139	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-55e4-ab3e-38a8-7aa06c8999ce	CU	CUB	192	Cuba 	Kuba	\N
00040000-55e4-ab3e-7413-d4df39e9a0af	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-55e4-ab3e-f755-0063e1c36a50	CY	CYP	196	Cyprus 	Ciper	\N
00040000-55e4-ab3e-6e9a-335133e91ff4	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-55e4-ab3e-dc89-8f8956be789b	DK	DNK	208	Denmark 	Danska	\N
00040000-55e4-ab3e-44ca-535b93443354	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-55e4-ab3e-d132-e59811a8546f	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-55e4-ab3e-cd50-ed5ae659e7dc	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-55e4-ab3e-bd16-455f1f20a2e5	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-55e4-ab3e-d4b6-32b606c84f04	EG	EGY	818	Egypt 	Egipt	\N
00040000-55e4-ab3e-a96b-37aebbe57887	SV	SLV	222	El Salvador 	Salvador	\N
00040000-55e4-ab3e-e199-cd6d711c29e1	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-55e4-ab3e-3dd5-147ca3128aa8	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-55e4-ab3e-08b0-493d2ed16805	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-55e4-ab3e-12d9-33b31d5f7718	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-55e4-ab3e-dc68-058ffb5de42c	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-55e4-ab3e-71f7-a7af295f6a71	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-55e4-ab3e-af8e-4ce56847608c	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-55e4-ab3e-dfb4-9a42fafb8151	FI	FIN	246	Finland 	Finska	\N
00040000-55e4-ab3e-271e-84b4759c6bee	FR	FRA	250	France 	Francija	\N
00040000-55e4-ab3e-79ee-41b6a27d89a3	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-55e4-ab3e-5e1e-795f4719f0bd	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-55e4-ab3e-6e34-6a941e20e119	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-55e4-ab3e-af5f-92ef18feef80	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-55e4-ab3e-7aec-330f05d1001b	GA	GAB	266	Gabon 	Gabon	\N
00040000-55e4-ab3e-619c-780e958166fc	GM	GMB	270	Gambia 	Gambija	\N
00040000-55e4-ab3e-e9b6-c8f37324d3c7	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-55e4-ab3e-70e9-4c174da84537	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-55e4-ab3e-2835-6b42b1b95d2c	GH	GHA	288	Ghana 	Gana	\N
00040000-55e4-ab3e-e904-ca97b3b00ead	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-55e4-ab3e-d3ff-ef94c0f1c193	GR	GRC	300	Greece 	Grčija	\N
00040000-55e4-ab3e-59e1-c92283008109	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-55e4-ab3e-0012-4da4c156542a	GD	GRD	308	Grenada 	Grenada	\N
00040000-55e4-ab3e-0e09-ce77457af126	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-55e4-ab3e-4b0f-a6dc342549ef	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-55e4-ab3e-ac10-6d4c67461f80	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-55e4-ab3e-718a-51e3a18ebb85	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-55e4-ab3e-d1c9-d4f331df6ce3	GN	GIN	324	Guinea 	Gvineja	\N
00040000-55e4-ab3e-ae74-1766cd4394d2	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-55e4-ab3e-d3f9-884420abaf5f	GY	GUY	328	Guyana 	Gvajana	\N
00040000-55e4-ab3e-2acc-b22cb7120b8f	HT	HTI	332	Haiti 	Haiti	\N
00040000-55e4-ab3e-919d-38d936e8fb26	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-55e4-ab3e-96c5-de54323287ae	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-55e4-ab3e-70d4-882173028cf0	HN	HND	340	Honduras 	Honduras	\N
00040000-55e4-ab3e-fa62-1e31924d1d9f	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-55e4-ab3e-73d8-c3890726ad49	HU	HUN	348	Hungary 	Madžarska	\N
00040000-55e4-ab3e-53f0-6f2400d0e0e6	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-55e4-ab3e-c8bf-082fa568a0f8	IN	IND	356	India 	Indija	\N
00040000-55e4-ab3e-2fad-8eeb35563826	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-55e4-ab3e-fc88-856b4cfca984	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-55e4-ab3e-fc76-ba5143dd2837	IQ	IRQ	368	Iraq 	Irak	\N
00040000-55e4-ab3e-b109-6918e8a892e6	IE	IRL	372	Ireland 	Irska	\N
00040000-55e4-ab3e-3010-b1bf15aa60c6	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-55e4-ab3e-c8d6-76be0b459a18	IL	ISR	376	Israel 	Izrael	\N
00040000-55e4-ab3e-5b73-9b9fca6f8829	IT	ITA	380	Italy 	Italija	\N
00040000-55e4-ab3e-37da-dfe8efaac797	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-55e4-ab3e-0957-e8df14a94873	JP	JPN	392	Japan 	Japonska	\N
00040000-55e4-ab3e-8067-be528b2d0b19	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-55e4-ab3e-08bf-1afd91f312e3	JO	JOR	400	Jordan 	Jordanija	\N
00040000-55e4-ab3e-fd59-79f5252e277c	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-55e4-ab3e-ec82-e42c799ee8d3	KE	KEN	404	Kenya 	Kenija	\N
00040000-55e4-ab3e-6af2-c6b0b0ae00f4	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-55e4-ab3e-c8e7-dc9d807691b4	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-55e4-ab3e-1494-0a2b1bd083d0	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-55e4-ab3e-ab60-fe62c1702162	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-55e4-ab3e-5145-19a52a578e3a	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-55e4-ab3e-2285-6aebb79f2b73	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-55e4-ab3e-c2a0-dd9bb7624d7b	LV	LVA	428	Latvia 	Latvija	\N
00040000-55e4-ab3e-f29c-d76b40174ba2	LB	LBN	422	Lebanon 	Libanon	\N
00040000-55e4-ab3e-2114-2717c0f81f6a	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-55e4-ab3e-8fd9-179fc515a92e	LR	LBR	430	Liberia 	Liberija	\N
00040000-55e4-ab3e-701a-e5cfa3a4c1c8	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-55e4-ab3e-28d4-288855f2cb49	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-55e4-ab3e-2d1d-c2ff6509037b	LT	LTU	440	Lithuania 	Litva	\N
00040000-55e4-ab3e-2625-284914203456	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-55e4-ab3e-3cf1-b9f7740d7253	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-55e4-ab3e-28ee-1bc4b819ee90	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-55e4-ab3e-0a73-513fb397c495	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-55e4-ab3e-1119-919690aab053	MW	MWI	454	Malawi 	Malavi	\N
00040000-55e4-ab3e-9ac7-78df57b8a820	MY	MYS	458	Malaysia 	Malezija	\N
00040000-55e4-ab3e-190e-f5e23eb9f5cf	MV	MDV	462	Maldives 	Maldivi	\N
00040000-55e4-ab3e-7b25-9701bcb7cb7f	ML	MLI	466	Mali 	Mali	\N
00040000-55e4-ab3e-2393-aa1ea12650ec	MT	MLT	470	Malta 	Malta	\N
00040000-55e4-ab3e-63d9-6723171deb6b	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-55e4-ab3e-6a31-444ac752529a	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-55e4-ab3e-9748-f87995dd1106	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-55e4-ab3e-72c5-a139f71e3abe	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-55e4-ab3e-b8aa-d72bde040a28	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-55e4-ab3e-7dd6-638e591f7fd9	MX	MEX	484	Mexico 	Mehika	\N
00040000-55e4-ab3e-624b-7b78dc04ced6	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-55e4-ab3e-7d38-8bc13e3c7c12	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-55e4-ab3e-7256-73d99018d11c	MC	MCO	492	Monaco 	Monako	\N
00040000-55e4-ab3e-9281-6b0eb2f90ab0	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-55e4-ab3e-fd41-f3e3ef7b5ef9	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-55e4-ab3e-a547-10b4def20e33	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-55e4-ab3e-add7-6a1343c98e0b	MA	MAR	504	Morocco 	Maroko	\N
00040000-55e4-ab3e-d0ab-7839caaa7c3b	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-55e4-ab3e-822a-36e6f9a76ea1	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-55e4-ab3e-cec5-088847d72034	NA	NAM	516	Namibia 	Namibija	\N
00040000-55e4-ab3e-c0ee-181f2bf08505	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-55e4-ab3e-ec6b-6fd9f58b39db	NP	NPL	524	Nepal 	Nepal	\N
00040000-55e4-ab3e-57d7-9bf530ce7213	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-55e4-ab3e-de27-594341b8656d	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-55e4-ab3e-13fc-7e7fe9e15457	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-55e4-ab3e-ae16-0275bcd70354	NE	NER	562	Niger 	Niger 	\N
00040000-55e4-ab3e-1bd1-eaa36fe742cb	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-55e4-ab3e-d8e1-230efced3c02	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-55e4-ab3e-754c-bff2b536441d	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-55e4-ab3e-ef7f-6a1e9f6e7fac	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-55e4-ab3e-d59a-cd4868bb3863	NO	NOR	578	Norway 	Norveška	\N
00040000-55e4-ab3e-aad8-31bbf7630f86	OM	OMN	512	Oman 	Oman	\N
00040000-55e4-ab3e-7478-9e803838309b	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-55e4-ab3e-dbc5-ee394014d3ad	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-55e4-ab3e-1ed4-15671c6ba9a9	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-55e4-ab3e-726a-43a32ab74a06	PA	PAN	591	Panama 	Panama	\N
00040000-55e4-ab3e-665e-30f4b3ba2aa3	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-55e4-ab3e-f621-6c2fa54c652c	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-55e4-ab3e-7b97-c88ab1859e89	PE	PER	604	Peru 	Peru	\N
00040000-55e4-ab3e-4b41-7f14b58504f3	PH	PHL	608	Philippines 	Filipini	\N
00040000-55e4-ab3e-6f65-75b81193f2bd	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-55e4-ab3e-290e-9cf96d306c7f	PL	POL	616	Poland 	Poljska	\N
00040000-55e4-ab3e-6fd2-38b6e0ba027c	PT	PRT	620	Portugal 	Portugalska	\N
00040000-55e4-ab3e-d083-f31e5253f212	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-55e4-ab3e-fd6f-61e9f987420e	QA	QAT	634	Qatar 	Katar	\N
00040000-55e4-ab3e-f823-ca35c7002dfb	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-55e4-ab3e-b433-09dcaa298e73	RO	ROU	642	Romania 	Romunija	\N
00040000-55e4-ab3e-8c0e-a7ffcb6c64c3	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-55e4-ab3e-6d14-f5255421f8ba	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-55e4-ab3e-123e-2700ec34c875	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-55e4-ab3e-da37-711479c10808	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-55e4-ab3e-170f-cf1fccfad9d3	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-55e4-ab3e-020f-8466fc2c3dea	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-55e4-ab3e-cba8-40ddc51eb7ec	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-55e4-ab3e-7674-eb096a63100b	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-55e4-ab3e-7122-59584cb319d8	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-55e4-ab3e-3414-a6c9d4bc52fd	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-55e4-ab3e-86e4-068f0ac35b07	SM	SMR	674	San Marino 	San Marino	\N
00040000-55e4-ab3e-ba90-5a275c1a2d68	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-55e4-ab3e-1136-551f891276b2	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-55e4-ab3e-a467-534cfdf8d886	SN	SEN	686	Senegal 	Senegal	\N
00040000-55e4-ab3e-a26c-fd02bf668ff0	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-55e4-ab3e-4e0d-e0849b618069	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-55e4-ab3e-b116-679e3b31f06c	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-55e4-ab3e-ae2a-e9cc2ff4fb3d	SG	SGP	702	Singapore 	Singapur	\N
00040000-55e4-ab3e-1fd3-2725ab68b0bd	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-55e4-ab3e-922c-a119f9f950ab	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-55e4-ab3e-47e7-638e4c3c8064	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-55e4-ab3e-e58f-8eb7e6f45a0a	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-55e4-ab3e-313b-947abf467fdb	SO	SOM	706	Somalia 	Somalija	\N
00040000-55e4-ab3e-bc16-9a5c64b07345	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-55e4-ab3e-3a59-b22aa1330f45	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-55e4-ab3e-cbd3-d1a15cdb1b43	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-55e4-ab3e-3205-824a3de17420	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-55e4-ab3e-c56f-885e7fac0bbe	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-55e4-ab3e-c306-2bbc8822370f	SD	SDN	729	Sudan 	Sudan	\N
00040000-55e4-ab3e-0274-c3a59657ac5b	SR	SUR	740	Suriname 	Surinam	\N
00040000-55e4-ab3e-aafc-db76f6fdaff1	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-55e4-ab3e-7960-7d95b53427c8	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-55e4-ab3e-4eb0-887255bbac9b	SE	SWE	752	Sweden 	Švedska	\N
00040000-55e4-ab3e-c691-361baaead121	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-55e4-ab3e-e1e4-93b010359246	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-55e4-ab3e-46d2-402629d61ba0	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-55e4-ab3e-382b-de74eac9b3b9	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-55e4-ab3e-7e0f-d6a440b88d46	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-55e4-ab3e-90d6-6c7d4cf66aa2	TH	THA	764	Thailand 	Tajska	\N
00040000-55e4-ab3e-cd3c-81442c0994e8	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-55e4-ab3e-3a90-db8ee739bc73	TG	TGO	768	Togo 	Togo	\N
00040000-55e4-ab3e-77da-edac6c17e018	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-55e4-ab3e-309b-eff6c5a9d7cd	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-55e4-ab3e-0707-ad3f1899f26f	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-55e4-ab3e-85f7-5620016f3aab	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-55e4-ab3e-d494-ec30b93a09a6	TR	TUR	792	Turkey 	Turčija	\N
00040000-55e4-ab3e-1453-44906a1e8403	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-55e4-ab3e-f1e1-f5c47464d48f	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-55e4-ab3e-dd3b-15c8f58ec42c	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-55e4-ab3e-cf09-d2f2fe139f35	UG	UGA	800	Uganda 	Uganda	\N
00040000-55e4-ab3e-349b-b148949787cd	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-55e4-ab3e-34b8-b42fdd7b40f9	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-55e4-ab3e-f317-32a0ed585359	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-55e4-ab3e-cee3-c5b2aecb1aeb	US	USA	840	United States 	Združene države Amerike	\N
00040000-55e4-ab3e-36b5-ae6555ecf9b5	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-55e4-ab3e-24eb-e463a0318313	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-55e4-ab3e-b7b3-a19982af32ea	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-55e4-ab3e-0052-97afdf67a348	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-55e4-ab3e-d9c0-7ccb1ddd4286	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-55e4-ab3e-531f-08133c1b2c71	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-55e4-ab3e-a735-ff0cdc3d4c96	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-55e4-ab3e-5b9e-be9792b54342	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-55e4-ab3e-2d3f-b07914500d64	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-55e4-ab3e-6e44-58ff76c8613b	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-55e4-ab3e-9053-192b8a343d33	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-55e4-ab3e-a014-fa26d8915cf6	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-55e4-ab3e-07fa-2a2b38ed882d	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 3239 (class 0 OID 1077267)
-- Dependencies: 226
-- Data for Name: enotaprograma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY enotaprograma (id, uprizoritev_id, program_dela_id, gostitelj_id, celotnavrednost, nasdelez, celotnavrednostmat, celotnavrednostgostovsz, zaproseno, lastnasredstva, avtorskihonorarji, avtorskihonorarjisamoz, tantieme, avtorskepravice, materialni, imakoprodukcije, vlozekgostitelja, drugijavni, stzaposlenih, stzaposumet, stzaposdrug, sthonorarnih, sthonorarnihigr, sthonorarnihigrtujjz, sthonorarnihigrsamoz, obiskdoma, obiskkopr, obiskgost, obiskzamejo, obiskint, obiskkoprint, ponovidoma, ponovikopr, ponovizamejo, ponovigost, ponovikoprint, ponoviint, naziv, kpe, sort, tipprogramskeenote_id, tip, strosekodkpred, stroskiostali, krajgostovanja, ustanova, datumgostovanja, transportnistroski, dnevprvzad, drzavagostovanja_id, stpe, zvrst, stpredstav, stokroglihmiz, stpredstavitev, stdelavnic, stdrugidogodki, stprodukcij, caspriprave, casizvedbe, prizorisca, umetvodja, programskotelo, sttujihselektorjev) FROM stdin;
002f0000-55e4-ab40-1e5a-0f717f27dc38	000e0000-55e4-ab40-3a4a-74b66fa8412f	\N	\N	9000.30	9000.30	9000.30	0.00	3600.12	5299.98	4000.40	1000.40	200.20	200.30	4599.40	\N	0.00	100.20	0	2	2	2	2	2	\N	40	0	0	0	0	0	1	0	0	0	0	0		0.00	\N	002b0000-55e4-ab3e-6c07-1185f5204422	premiera	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-55e4-ab40-d42f-c5443cdc405e	000e0000-55e4-ab40-5ff0-4a6c45a8b255	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	\N	60	0	0	0	0	0	1	0	0	0	0	0		0.00	\N	002b0000-55e4-ab3e-cd64-494ed7ae1779	premiera	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-55e4-ab40-b66b-4f065a8a0d32	000e0000-55e4-ab40-0741-9024e238c535	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	\N	60	0	0	0	0	0	1	0	0	0	0	0		0.00	\N	002b0000-55e4-ab3e-6c07-1185f5204422	premiera	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-55e4-ab40-5bc9-799653ef54a8	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-54.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	54.20	5	0	0	3	0	0	\N	22	0	0	0	0	0	0	0	0	0	0	0	Urejanje portala	0.00	10	\N	razno	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-55e4-ab40-0006-89ea1d32378d	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-31.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	31.20	5	0	0	3	0	0	\N	202	0	0	0	0	0	0	0	0	0	0	0	Delavnice otroci	0.00	8	\N	razno	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 3227 (class 0 OID 1077122)
-- Dependencies: 214
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, podrocje, vodjaekipe, naziv, komentar, velikost, pomembna, sort, seplanira, dovoliprekrivanje, maxprekrivanj, tipfunkcije_id) FROM stdin;
000d0000-55e4-ab40-d352-563602e30b74	000e0000-55e4-ab40-5ff0-4a6c45a8b255	\N	igralec	\N	Hipolita	glavna vloga	velika	t	6	t	t	\N	000f0000-55e4-ab3e-e83b-a247230ca657
000d0000-55e4-ab40-92df-838f78c568bd	000e0000-55e4-ab40-5ff0-4a6c45a8b255	\N	igralec	\N	Tezej	glavna vloga	velika	t	5	t	t	\N	000f0000-55e4-ab3e-e83b-a247230ca657
000d0000-55e4-ab40-20ec-7df6fe7a91d7	000e0000-55e4-ab40-5ff0-4a6c45a8b255	\N	umetnik	\N	Režija		velika	t	8	t	t	\N	000f0000-55e4-ab3e-c945-c232e7dcb170
000d0000-55e4-ab40-491a-0bb4d641966e	000e0000-55e4-ab40-5ff0-4a6c45a8b255	\N	inspicient	t	Inšpicient			t	8	t	t	\N	000f0000-55e4-ab3e-e2f5-9836bff3ad5f
000d0000-55e4-ab40-5802-66f20a848caa	000e0000-55e4-ab40-5ff0-4a6c45a8b255	\N	tehnik	t	Tehnični vodja			t	8	t	t	\N	000f0000-55e4-ab3e-3c94-af9877c9eeb3
000d0000-55e4-ab40-d676-d81b723b4045	000e0000-55e4-ab40-5ff0-4a6c45a8b255	\N	tehnik	\N	Razsvetljava			t	3	t	t	\N	000f0000-55e4-ab3e-3c94-af9877c9eeb3
000d0000-55e4-ab40-9c72-27ada9034087	000e0000-55e4-ab40-5ff0-4a6c45a8b255	\N	igralec	\N	Helena	glavna vloga	velika	t	5	t	t	\N	000f0000-55e4-ab3e-e83b-a247230ca657
000d0000-55e4-ab40-13bf-e9fed6e94cfc	000e0000-55e4-ab40-5ff0-4a6c45a8b255	\N	umetnik	\N	Lektoriranje			t	22	t	t	\N	000f0000-55e4-ab3e-9823-3595d006b2dd
\.


--
-- TOC entry 3205 (class 0 OID 1076914)
-- Dependencies: 192
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta, zamejstvo, kraj) FROM stdin;
\.


--
-- TOC entry 3194 (class 0 OID 1076759)
-- Dependencies: 181
-- Data for Name: kontaktnaoseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kontaktnaoseba (id, popa_id, oseba_id, status, funkcija, opis) FROM stdin;
00260000-55e4-ab40-f663-e348e48b2c36	00080000-55e4-ab40-b653-e7941cffe97f	00090000-55e4-ab40-fca9-454c53fe792c	AK		
\.


--
-- TOC entry 3211 (class 0 OID 1076970)
-- Dependencies: 198
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 3249 (class 0 OID 1077444)
-- Dependencies: 236
-- Data for Name: mapa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa (id, lastnik_id, parent_id, ime, komentar, caskreiranja, casspremembe, javnidostop, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3250 (class 0 OID 1077456)
-- Dependencies: 237
-- Data for Name: mapa_zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa_zapis (mapa_id, zapis_id) FROM stdin;
\.


--
-- TOC entry 3251 (class 0 OID 1077463)
-- Dependencies: 238
-- Data for Name: mapaacl; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapaacl (id, mapa_id, perm_id, dostop, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3212 (class 0 OID 1076976)
-- Dependencies: 199
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 3195 (class 0 OID 1076771)
-- Dependencies: 182
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-55e4-ab3e-10d1-dc359d4531e1	popa.stakli	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-55e4-ab3e-9d16-96d796d016cf	oseba.spol	array	a:2:{s:1:"M";a:1:{s:5:"label";s:6:"Moški";}s:1:"Z";a:1:{s:5:"label";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-55e4-ab3e-33a4-e927d87bd3ee	telefonska.vrsta	array	a:3:{s:7:"mobilna";a:1:{s:5:"label";s:7:"Mobilni";}s:6:"domaca";a:1:{s:5:"label";s:6:"Domač";}s:6:"fiksna";a:1:{s:5:"label";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-55e4-ab3e-127c-03a23e752569	kontaktnaoseba.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status kontaktne osebe
00000000-55e4-ab3e-1454-90531daf69a3	dogodek.status	array	a:7:{i:100;a:1:{s:5:"label";s:11:"Dolgoročno";}i:200;a:1:{s:5:"label";s:9:"Planirano";}i:300;a:1:{s:5:"label";s:8:"Fiksiran";}i:400;a:1:{s:5:"label";s:17:"Potrjen - interno";}i:500;a:1:{s:5:"label";s:15:"Potrjen - javno";}i:600;a:1:{s:5:"label";s:10:"Zaključen";}i:700;a:1:{s:5:"label";s:7:"Obdelan";}}	f	t	t	\N	Tabela statusa dogodkov
00000000-55e4-ab3e-8df4-7de55910c227	dogodek.razred	array	a:5:{i:100;a:2:{s:5:"label";s:9:"Predstava";s:4:"type";s:9:"predstava";}i:200;a:2:{s:5:"label";s:4:"Vaja";s:4:"type";s:4:"vaja";}i:300;a:2:{s:5:"label";s:10:"Gostovanje";s:4:"type";s:10:"gostovanje";}i:400;a:2:{s:5:"label";s:10:"Zasedenost";s:4:"type";s:10:"zasedenost";}i:500;a:2:{s:5:"label";s:16:"Splošni dogodek";s:4:"type";s:8:"splošni";}}	f	t	t	\N	Tabela razredov dogodkov, ki jih aplikacija podpira
00000000-55e4-ab3e-0d61-615a2d89430f	uprizoritev.faza	array	a:6:{s:20:"predprodukcija-ideja";a:1:{s:5:"label";s:16:"Dolgoročni plan";}s:20:"predprodukcija-poziv";a:1:{s:5:"label";s:29:"Predprodukcija, v fazi poziva";}s:30:"predprodukcija-potrjen_program";a:1:{s:5:"label";s:34:"Predprodukcija, program je potrjen";}s:10:"produkcija";a:1:{s:5:"label";s:10:"Produkcija";}s:14:"postprodukcija";a:1:{s:5:"label";s:14:"Postprodukcija";}s:5:"arhiv";a:1:{s:5:"label";s:10:"Arhivirana";}}	f	t	f	\N	Faza uprizoritve
00000000-55e4-ab3e-b53e-98fdb9e73b3a	funkcija.podrocje	array	a:4:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}}	f	t	f	\N	Področje funkcije
00000000-55e4-ab3e-a539-bf1e27f08dce	tipfunkcije.podrocje	array	a:3:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}}	f	t	f	\N	Področje funkcije
00000000-55e4-ab3e-7e58-c706de4635c5	funkcija.velikost	array	a:4:{s:7:"stataza";a:1:{s:5:"label";s:8:"Stataža";}s:4:"mala";a:1:{s:5:"label";s:21:"Mala vloga / funkcija";}s:7:"srednja";a:1:{s:5:"label";s:24:"Srednja vloga / funkcija";}s:6:"velika";a:1:{s:5:"label";s:23:"Velika vloga / funkcija";}}	f	t	f	\N	Velikost funkcije
00000000-55e4-ab3e-698c-c51ad3ec13d9	zaposlitev.status	array	a:2:{s:1:"A";a:1:{s:5:"label";s:7:"Aktivna";}s:1:"N";a:1:{s:5:"label";s:9:"Neaktivna";}}	f	t	f	\N	Status zaposlitve
00000000-55e4-ab3e-3117-49975b962fe7	produkcijskahisa.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktivna";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktivna";}}	f	t	f	\N	Status produkcijske hiše
00000000-55e4-ab3e-9d5a-3433df767396	strosekuprizoritve.tipstroska	array	a:2:{s:10:"materialni";a:1:{s:5:"label";s:19:"Materialni strošek";}s:9:"avtorprav";a:1:{s:5:"label";s:32:"Strošek odkupa avtorskih pravic";}}	f	t	f	\N	Tip stroška
00000000-55e4-ab3e-cebe-602807dc1c1e	fsacl.dostop	array	a:4:{s:1:"X";a:1:{s:5:"label";s:12:"Brez dostopa";}s:1:"R";a:1:{s:5:"label";s:11:"Samo branje";}s:2:"RW";a:1:{s:5:"label";s:17:"Branje in pisanje";}s:3:"RWD";a:1:{s:5:"label";s:26:"Branje pisanje in brisanje";}}	f	t	f	\N	ACL Javni dostop
00000000-55e4-ab40-7721-ac751a7b2458	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-55e4-ab40-ab9c-5e3b03def7d3	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-55e4-ab40-e838-0ddedd132d4c	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-55e4-ab40-8ca4-f7571f7aa333	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-55e4-ab40-7b74-ce411f1270ee	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
\.


--
-- TOC entry 3196 (class 0 OID 1076783)
-- Dependencies: 183
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-55e4-ab40-4b2e-61178e92e2d2	00000000-55e4-ab40-7721-ac751a7b2458	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-55e4-ab40-5e7f-38b780f5773f	00000000-55e4-ab40-7721-ac751a7b2458	00010000-55e4-ab3e-8dc4-22a73117ccd5	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-55e4-ab40-71e0-9de72b8ab672	00000000-55e4-ab40-ab9c-5e3b03def7d3	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 3197 (class 0 OID 1076794)
-- Dependencies: 184
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naslov_id, sifra, naziv, ime, priimek, funkcija, srednjeime, polnoime, psevdonim, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
00090000-55e4-ab40-f568-f191ebf85478	\N	\N	0001	g.	Janez	Novak	a	Peter	Janez Peter Novak	Jani	jani.novak@xxx.xx	1958-01-06	0601958000000	123456789	M	Jani Janez	Slovenija	Slovenija	Ljubljana
00090000-55e4-ab40-caab-e041e1498303	00010000-55e4-ab40-2c6e-077abe98f0eb	\N	0002	dr.	Anton	Horvat	b		Anton  Horvat	Tona	anton.horvat@xxx.xx	1968-02-12	1202968111111	234567890	M		Slovenija	Slovenija	Maribor
00090000-55e4-ab40-ecc8-1e5ebdeb2800	00010000-55e4-ab40-8bca-bb2094814295	\N	0003		Ivan	Kovačič	c		Ivan  Kovačič	Ivo	ivan.kovacic@xxx.xx	1975-03-26	2603976222222	345678901	M		Slovenija	Slovenija	Celje
00090000-55e4-ab40-c970-58eff1098124	00010000-55e4-ab40-37ea-284ee20d269d	\N	0004	prof.	Jožef	Krajnc	d		Jožef  Krajnc	Joža	jozef.krajnc@xxx.xx	1971-04-30	3004971333333	456789012	M		Slovenija	Slovenija	Kranj
00090000-55e4-ab40-9b4e-d8f421569468	\N	\N	0005		Marko	Zupančič	e		Marko  Zupančič		marko.zupancic@xxx.xx	1984-05-07	0705984444444	567890123	M		Slovenija	Slovenija	Koper
00090000-55e4-ab40-0271-3548b7b91265	\N	\N	0006	ga.	Marija	Kovač	f		Marija  Kovač		marija.kovac@xxx.xx	1962-06-19	1906962444444	678901234	Z		Slovenija	Slovenija	Murska Sobota
00090000-55e4-ab40-07c8-e0d175507196	\N	\N	0007	ga.	Ana	Potočnik	g		Ana  Potočnik		ana.potocnik@xxx.xx	1975-07-24	2407975555555	789012345	Z		Slovenija	Slovenija	Novo Mesto
00090000-55e4-ab40-d218-40d0980e93ad	\N	\N	0008	ga.	Maja	Mlakar	h		Maja  Mlakar		maja.mlakar@xxx.xx	1986-08-02	0208986666666	890123456	Z		Slovenija	Slovenija	Nova Gorica
00090000-55e4-ab40-fca9-454c53fe792c	00010000-55e4-ab40-3596-bc3c477b15ff	\N	0009		Irena	Kos	i		Irena  Kos		irena.kos@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Ptuj
00090000-55e4-ab40-e663-da322e20b628	\N	\N	0010		Mojca	Vidmar	J		Mojca  Vidmar		mojca.vidmar@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Idrija
00090000-55e4-ab40-4e8d-4113bbac0ece	\N	\N	0011		xx	write protected12345	a		xx  write protected12345		xx@xxx.xx	\N	\N	\N	Z		\N	\N	\N
00090000-55e4-ab40-36e6-e47a29d9598f	\N	\N	0012		Luka	Golob	luč	a	Luka a Golob		luka.golob@xxx.xx	\N	\N	\N	M		\N	\N	\N
00090000-55e4-ab40-1f61-5f624514522f	00010000-55e4-ab40-431e-275702425402	\N	0013		Tatjana	Božič	tajnica	a	Tatjana a Božič		tatjana.bozic@xxx.xx	\N	\N	\N	Z		\N	\N	\N
\.


--
-- TOC entry 3185 (class 0 OID 1076676)
-- Dependencies: 172
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-55e4-ab3e-58c6-28e08843891e	Aaa-read	Aaa (User,Role,Permission) - branje	f
00030000-55e4-ab3e-fcef-32da555d342b	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	f
00030000-55e4-ab3e-030d-fec76a7d77a3	TerminStoritve-vse	TerminStoritve - spreminjanje vseh zapisov	f
00030000-55e4-ab3e-6299-649bccfdca04	Dogodek-readVse	Dogodek - branje vseh, ne glede na status dogodka	f
00030000-55e4-ab3e-ec75-a4d0732439e9	Oseba-vse	Oseba - vse - za testiranje assert	f
00030000-55e4-ab3e-5a79-89fd8bdf70cf	ProgramDela-lock	ProgramDela - zaklepanje	f
00030000-55e4-ab3e-740b-c1c4a611b65d	ProgramDela-unlock	ProgramDela - odklepanje	f
00030000-55e4-ab3e-7acc-85e77d6c0fb1	Abonma-read	Abonma - branje	f
00030000-55e4-ab3e-6123-7f58911c355b	Abonma-write	Abonma - spreminjanje	f
00030000-55e4-ab3e-1566-ddf00cfa894f	Alternacija-read	Alternacija - branje	f
00030000-55e4-ab3e-51e4-b52227dfe87b	Alternacija-write	Alternacija - spreminjanje	f
00030000-55e4-ab3e-e024-073b20aee6a2	Arhivalija-read	Arhivalija - branje	f
00030000-55e4-ab3e-63f7-d13091ae79c7	Arhivalija-write	Arhivalija - spreminjanje	f
00030000-55e4-ab3e-d468-10fa1996b317	Besedilo-read	Besedilo - branje	f
00030000-55e4-ab3e-f33d-4e95d1fa0e16	Besedilo-write	Besedilo - spreminjanje	f
00030000-55e4-ab3e-2f3e-b0722916c793	DogodekIzven-read	DogodekIzven - branje	f
00030000-55e4-ab3e-40b7-e872bb04b280	DogodekIzven-write	DogodekIzven - spreminjanje	f
00030000-55e4-ab3e-25e1-9ed191c44d2d	Dogodek-read	Dogodek - branje	f
00030000-55e4-ab3e-048b-5aa5cabcbce4	Dogodek-write	Dogodek - spreminjanje	f
00030000-55e4-ab3e-4ecd-1084dd45c4c9	DrugiVir-read	DrugiVir - branje	f
00030000-55e4-ab3e-8ed6-c9ababbc00f2	DrugiVir-write	DrugiVir - spreminjanje	f
00030000-55e4-ab3e-e726-527884b6f263	Drzava-read	Drzava - branje	f
00030000-55e4-ab3e-740f-7db55fab5bab	Drzava-write	Drzava - spreminjanje	f
00030000-55e4-ab3e-5c0e-40731acbbd00	EnotaPrograma-read	EnotaPrograma - branje	f
00030000-55e4-ab3e-0a24-5ddd4f7366e1	EnotaPrograma-write	EnotaPrograma - spreminjanje	f
00030000-55e4-ab3e-2a98-f753fa6a4d1f	Funkcija-read	Funkcija - branje	f
00030000-55e4-ab3e-fe81-79119e5c8cf0	Funkcija-write	Funkcija - spreminjanje	f
00030000-55e4-ab3e-f19a-afa876ef486a	Gostovanje-read	Gostovanje - branje	f
00030000-55e4-ab3e-93a5-bb1364cec76c	Gostovanje-write	Gostovanje - spreminjanje	f
00030000-55e4-ab3e-d36b-701e3d2c762a	Gostujoca-read	Gostujoca - branje	f
00030000-55e4-ab3e-160d-b4cb1c2158fa	Gostujoca-write	Gostujoca - spreminjanje	f
00030000-55e4-ab3e-aecd-0d71d17d4805	KontaktnaOseba-read	KontaktnaOseba - branje	f
00030000-55e4-ab3e-a6bf-9516b3780a84	KontaktnaOseba-write	KontaktnaOseba - spreminjanje	f
00030000-55e4-ab3e-832a-7cd8e57d22cc	Kupec-read	Kupec - branje	f
00030000-55e4-ab3e-f736-2fbab7ece682	Kupec-write	Kupec - spreminjanje	f
00030000-55e4-ab3e-c5b6-4f1d19e5fd6a	NacinPlacina-read	NacinPlacina - branje	f
00030000-55e4-ab3e-45ce-f5dd6295c34f	NacinPlacina-write	NacinPlacina - spreminjanje	f
00030000-55e4-ab3e-cdf3-f766079b8ca5	Option-read	Option - branje	f
00030000-55e4-ab3e-059e-06c3a714cd7e	Option-write	Option - spreminjanje	f
00030000-55e4-ab3e-15e2-30d82aaa58c6	OptionValue-read	OptionValue - branje	f
00030000-55e4-ab3e-eab6-b3b7feb84cc6	OptionValue-write	OptionValue - spreminjanje	f
00030000-55e4-ab3e-f565-5bf2dd4eba37	Oseba-read	Oseba - branje	f
00030000-55e4-ab3e-6336-b99a819fac03	Oseba-write	Oseba - spreminjanje	f
00030000-55e4-ab3e-6598-2853d8ccda5b	PlacilniInstrument-read	PlacilniInstrument - branje	f
00030000-55e4-ab3e-0040-596e09a37093	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	f
00030000-55e4-ab3e-c17d-9516eb5b2df9	PodrocjeSedenja-read	PodrocjeSedenja - branje	f
00030000-55e4-ab3e-1cf4-b70889fbc2c2	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	f
00030000-55e4-ab3e-602e-cacbb6de6b49	Pogodba-read	Pogodba - branje	f
00030000-55e4-ab3e-8077-65f983dc90a2	Pogodba-write	Pogodba - spreminjanje	f
00030000-55e4-ab3e-760b-5fde1a9132a9	Popa-read	Popa - branje	f
00030000-55e4-ab3e-0bf7-150c377c03aa	Popa-write	Popa - spreminjanje	f
00030000-55e4-ab3e-a9c0-69169eda90bd	Posta-read	Posta - branje	f
00030000-55e4-ab3e-198a-1af4838e5600	Posta-write	Posta - spreminjanje	f
00030000-55e4-ab3e-4594-5d1c27807828	PostavkaRacuna-read	PostavkaRacuna - branje	f
00030000-55e4-ab3e-ef06-de9e63254213	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	f
00030000-55e4-ab3e-8f7b-d5b746ee0e1a	PostniNaslov-read	PostniNaslov - branje	f
00030000-55e4-ab3e-101f-0a62cd06afd8	PostniNaslov-write	PostniNaslov - spreminjanje	f
00030000-55e4-ab3e-59b4-f59a86aa92f4	Predstava-read	Predstava - branje	f
00030000-55e4-ab3e-0aea-f2396dccaf82	Predstava-write	Predstava - spreminjanje	f
00030000-55e4-ab3e-e50c-0d17f11dac9f	ProdajaPredstave-read	ProdajaPredstave - branje	f
00030000-55e4-ab3e-c4c7-a9b49b304c6d	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	f
00030000-55e4-ab3e-77d7-94f0ed416790	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	f
00030000-55e4-ab3e-560f-8e240a2b82b8	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	f
00030000-55e4-ab3e-cd04-b86fb6e8db92	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	f
00030000-55e4-ab3e-edf8-bf650263e31d	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	f
00030000-55e4-ab3e-07f6-255eb00d5b07	ProgramDela-read	ProgramDela - branje	f
00030000-55e4-ab3e-0f9d-91a0c39ccb5b	ProgramDela-write	ProgramDela - spreminjanje	f
00030000-55e4-ab3e-857e-485fe813c7fe	ProgramFestival-read	ProgramFestival - branje	f
00030000-55e4-ab3e-4447-ed7c1cf0f772	ProgramFestival-write	ProgramFestival - spreminjanje	f
00030000-55e4-ab3e-d5b2-cf2fa60e4829	ProgramGostovanje-read	ProgramGostovanje - branje	f
00030000-55e4-ab3e-8da4-0d84e16e0b99	ProgramGostovanje-write	ProgramGostovanje - spreminjanje	f
00030000-55e4-ab3e-f70f-b27daffbd1f3	ProgramGostujoca-read	ProgramGostujoca - branje	f
00030000-55e4-ab3e-ae1d-954a1400773c	ProgramGostujoca-write	ProgramGostujoca - spreminjanje	f
00030000-55e4-ab3e-14b3-6438d200c72f	ProgramIzjemni-read	ProgramIzjemni - branje	f
00030000-55e4-ab3e-c118-ad30f630fd7e	ProgramIzjemni-write	ProgramIzjemni - spreminjanje	f
00030000-55e4-ab3e-ecd3-44eea0e73e82	ProgramPonovitevPrejsnjih-read	ProgramPonovitevPrejsnjih - branje	f
00030000-55e4-ab3e-f689-1087abf403cc	ProgramPonovitevPrejsnjih-write	ProgramPonovitevPrejsnjih - spreminjanje	f
00030000-55e4-ab3e-5167-c138b5bfd385	ProgramPonovitevPremiere-read	ProgramPonovitevPremiere - branje	f
00030000-55e4-ab3e-1d20-f0884b25399a	ProgramPonovitevPremiere-write	ProgramPonovitevPremiere - spreminjanje	f
00030000-55e4-ab3e-1a9f-d52a9c6cf230	ProgramPremiera-read	ProgramPremiera - branje	f
00030000-55e4-ab3e-7820-93b460da6e73	ProgramPremiera-write	ProgramPremiera - spreminjanje	f
00030000-55e4-ab3e-785a-1f839097735b	ProgramRazno-read	ProgramRazno - branje	f
00030000-55e4-ab3e-9fe2-cf4d8d34457f	ProgramRazno-write	ProgramRazno - spreminjanje	f
00030000-55e4-ab3e-fd5b-59a0887fe01d	ProgramskaEnotaSklopa-read	ProgramskaEnotaSklopa - branje	f
00030000-55e4-ab3e-d83e-10f7e3f48e4b	ProgramskaEnotaSklopa-write	ProgramskaEnotaSklopa - spreminjanje	f
00030000-55e4-ab3e-73de-65c3b6e7fb13	Prostor-read	Prostor - branje	f
00030000-55e4-ab3e-6253-0099c1c8e464	Prostor-write	Prostor - spreminjanje	f
00030000-55e4-ab3e-dd51-8a9e118ae114	Racun-read	Racun - branje	f
00030000-55e4-ab3e-994c-a8ef3a5b380b	Racun-write	Racun - spreminjanje	f
00030000-55e4-ab3e-130c-56a654d9f869	RazpisanSedez-read	RazpisanSedez - branje	f
00030000-55e4-ab3e-9747-95fbd41dc334	RazpisanSedez-write	RazpisanSedez - spreminjanje	f
00030000-55e4-ab3e-13d4-7549552add4c	Rekviziterstvo-read	Rekviziterstvo - branje	f
00030000-55e4-ab3e-8783-0225d0f30cf3	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	f
00030000-55e4-ab3e-462f-dbe98988d636	Rekvizit-read	Rekvizit - branje	f
00030000-55e4-ab3e-fb09-1d327986431f	Rekvizit-write	Rekvizit - spreminjanje	f
00030000-55e4-ab3e-5cd5-fce78cf518d3	Revizija-read	Revizija - branje	f
00030000-55e4-ab3e-7ed7-0dcbc8a2dfeb	Revizija-write	Revizija - spreminjanje	f
00030000-55e4-ab3e-c396-1f77dd0e85f4	Rezervacija-read	Rezervacija - branje	f
00030000-55e4-ab3e-02a9-6cfc414bea7e	Rezervacija-write	Rezervacija - spreminjanje	f
00030000-55e4-ab3e-d972-b89cad33bc20	SedezniRed-read	SedezniRed - branje	f
00030000-55e4-ab3e-ec97-46b36b14f0e3	SedezniRed-write	SedezniRed - spreminjanje	f
00030000-55e4-ab3e-41e7-383fa071d4c8	Sedez-read	Sedez - branje	f
00030000-55e4-ab3e-3ebb-c8b1f9dc368e	Sedez-write	Sedez - spreminjanje	f
00030000-55e4-ab3e-1f15-f9e2d7921dd1	Sezona-read	Sezona - branje	f
00030000-55e4-ab3e-16e0-55fcf3e3db57	Sezona-write	Sezona - spreminjanje	f
00030000-55e4-ab3e-1dc9-c532ade7d62a	StevilcenjeKonfig-read	StevilcenjeKonfig - branje	f
00030000-55e4-ab3e-df03-6e2165bbe5c9	StevilcenjeKonfig-write	StevilcenjeKonfig - spreminjanje	f
00030000-55e4-ab3e-6404-0a1d21046154	Stevilcenje-read	Stevilcenje - branje	f
00030000-55e4-ab3e-f1ce-6b421bdef3f7	Stevilcenje-write	Stevilcenje - spreminjanje	f
00030000-55e4-ab3e-2a3a-06db74634f24	StevilcenjeStanje-read	StevilcenjeStanje - branje	f
00030000-55e4-ab3e-f237-52b200476cd5	StevilcenjeStanje-write	StevilcenjeStanje - spreminjanje	f
00030000-55e4-ab3e-8021-1c5b9178fda7	StrosekUprizoritve-read	StrosekUprizoritve - branje	f
00030000-55e4-ab3e-cb7e-8dde2a5cd3b4	StrosekUprizoritve-write	StrosekUprizoritve - spreminjanje	f
00030000-55e4-ab3e-f176-f0b9b8cdaad8	Telefonska-read	Telefonska - branje	f
00030000-55e4-ab3e-4c97-e0d2650fa393	Telefonska-write	Telefonska - spreminjanje	f
00030000-55e4-ab3e-38e3-d3583309e940	TerminStoritve-read	TerminStoritve - branje	f
00030000-55e4-ab3e-0974-79fcedaf1228	TerminStoritve-write	TerminStoritve - spreminjanje	f
00030000-55e4-ab3e-30c8-fe78f5b0a914	TipFunkcije-read	TipFunkcije - branje	f
00030000-55e4-ab3e-5506-6a232d060016	TipFunkcije-write	TipFunkcije - spreminjanje	f
00030000-55e4-ab3e-84e0-aee60b1d037b	TipProgramskeEnote-read	TipProgramskeEnote - branje	f
00030000-55e4-ab3e-aee5-a44835c49d07	TipProgramskeEnote-write	TipProgramskeEnote - spreminjanje	f
00030000-55e4-ab3e-31a6-c150a91413a0	Trr-read	Trr - branje	f
00030000-55e4-ab3e-a66d-7c74f029cee3	Trr-write	Trr - spreminjanje	f
00030000-55e4-ab3e-0aee-387d173d355d	Uprizoritev-read	Uprizoritev - branje	f
00030000-55e4-ab3e-afd6-663f74bc96b6	Uprizoritev-write	Uprizoritev - spreminjanje	f
00030000-55e4-ab3e-4aca-60284f7178e9	Vaja-read	Vaja - branje	f
00030000-55e4-ab3e-79a8-5112971f8435	Vaja-write	Vaja - spreminjanje	f
00030000-55e4-ab3e-bd09-fae3d4460a4d	VrstaSedezev-read	VrstaSedezev - branje	f
00030000-55e4-ab3e-6b3f-469ece328954	VrstaSedezev-write	VrstaSedezev - spreminjanje	f
00030000-55e4-ab3e-416f-ca6cc1b0c76b	VrstaStroska-read	VrstaStroska - branje	f
00030000-55e4-ab3e-50e6-519db4912556	VrstaStroska-write	VrstaStroska - spreminjanje	f
00030000-55e4-ab3e-0b8f-664af8e53412	Zaposlitev-read	Zaposlitev - branje	f
00030000-55e4-ab3e-9e31-b10a83394ff6	Zaposlitev-write	Zaposlitev - spreminjanje	f
00030000-55e4-ab3e-cd99-57002ba0368f	Zasedenost-read	Zasedenost - branje	f
00030000-55e4-ab3e-0ee5-8d7ca440d25a	Zasedenost-write	Zasedenost - spreminjanje	f
00030000-55e4-ab3e-bec5-10661830f780	ZvrstSurs-read	ZvrstSurs - branje	f
00030000-55e4-ab3e-6d48-75ed353c3832	ZvrstSurs-write	ZvrstSurs - spreminjanje	f
00030000-55e4-ab3e-879e-c7af0aff0499	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	f
00030000-55e4-ab3e-f549-6bcb83411df9	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	f
00030000-55e4-ab3e-0e85-9fb7753bf710	Mapa-write	Mapa - osnovno dovoljenje za pisanje	f
00030000-55e4-ab3e-c252-d0523723a08f	Mapa-read	Mapa - osnovno dovoljenje za branje	f
00030000-55e4-ab3e-0c05-17f14ec4ae21	MapaAcl-write	MapaAcl - dovoljenje za dostop pisanje ACL-jev mape	f
00030000-55e4-ab3e-7d79-6bf15d6fda7b	MapaAcl-read	MapaAcl - dovoljenje za dostop branje ACL-jev mape	f
00030000-55e4-ab3e-fbef-62b482d509ed	Zapis-write	Zapis - dovoljenje za pisanje zapisov	f
00030000-55e4-ab3e-b3a3-d87d543bea95	Zapis-read	Zapis - dovoljenje za pisanje zapisov	f
00030000-55e4-ab3e-130b-067122398f37	ZapisLastnik-write	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	f
00030000-55e4-ab3e-bed2-56a2cdbb4605	ZapisLastnik-read	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	f
00030000-55e4-ab3e-90a9-f7852da4dbe5	VrstaZapisa-write	Šifrant vrst zapisa - spreminjanje	f
00030000-55e4-ab3e-d48a-90e8754b9df7	VrstaZapisa-read	Šifrant vrst zapisa - branje	f
00030000-55e4-ab3e-ca2d-e51eae35faf6	Datoteka-write	Datoteka - spreminjanje	f
00030000-55e4-ab3e-ee4b-e3d0db2c37bf	Datoteka-read	Datoteke - branje	f
\.


--
-- TOC entry 3189 (class 0 OID 1076706)
-- Dependencies: 176
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-55e4-ab3e-5a9e-5a3150644ebf	00030000-55e4-ab3e-fcef-32da555d342b
00020000-55e4-ab3e-f51e-f9c2367da1d2	00030000-55e4-ab3e-e726-527884b6f263
00020000-55e4-ab3e-7717-0bc78152280d	00030000-55e4-ab3e-7acc-85e77d6c0fb1
00020000-55e4-ab3e-7717-0bc78152280d	00030000-55e4-ab3e-6123-7f58911c355b
00020000-55e4-ab3e-7717-0bc78152280d	00030000-55e4-ab3e-1566-ddf00cfa894f
00020000-55e4-ab3e-7717-0bc78152280d	00030000-55e4-ab3e-51e4-b52227dfe87b
00020000-55e4-ab3e-7717-0bc78152280d	00030000-55e4-ab3e-e024-073b20aee6a2
00020000-55e4-ab3e-7717-0bc78152280d	00030000-55e4-ab3e-25e1-9ed191c44d2d
00020000-55e4-ab3e-7717-0bc78152280d	00030000-55e4-ab3e-6299-649bccfdca04
00020000-55e4-ab3e-7717-0bc78152280d	00030000-55e4-ab3e-048b-5aa5cabcbce4
00020000-55e4-ab3e-7717-0bc78152280d	00030000-55e4-ab3e-e726-527884b6f263
00020000-55e4-ab3e-7717-0bc78152280d	00030000-55e4-ab3e-740f-7db55fab5bab
00020000-55e4-ab3e-7717-0bc78152280d	00030000-55e4-ab3e-2a98-f753fa6a4d1f
00020000-55e4-ab3e-7717-0bc78152280d	00030000-55e4-ab3e-fe81-79119e5c8cf0
00020000-55e4-ab3e-7717-0bc78152280d	00030000-55e4-ab3e-f19a-afa876ef486a
00020000-55e4-ab3e-7717-0bc78152280d	00030000-55e4-ab3e-93a5-bb1364cec76c
00020000-55e4-ab3e-7717-0bc78152280d	00030000-55e4-ab3e-d36b-701e3d2c762a
00020000-55e4-ab3e-7717-0bc78152280d	00030000-55e4-ab3e-160d-b4cb1c2158fa
00020000-55e4-ab3e-7717-0bc78152280d	00030000-55e4-ab3e-aecd-0d71d17d4805
00020000-55e4-ab3e-7717-0bc78152280d	00030000-55e4-ab3e-a6bf-9516b3780a84
00020000-55e4-ab3e-7717-0bc78152280d	00030000-55e4-ab3e-cdf3-f766079b8ca5
00020000-55e4-ab3e-7717-0bc78152280d	00030000-55e4-ab3e-15e2-30d82aaa58c6
00020000-55e4-ab3e-7717-0bc78152280d	00030000-55e4-ab3e-f565-5bf2dd4eba37
00020000-55e4-ab3e-7717-0bc78152280d	00030000-55e4-ab3e-6336-b99a819fac03
00020000-55e4-ab3e-7717-0bc78152280d	00030000-55e4-ab3e-760b-5fde1a9132a9
00020000-55e4-ab3e-7717-0bc78152280d	00030000-55e4-ab3e-0bf7-150c377c03aa
00020000-55e4-ab3e-7717-0bc78152280d	00030000-55e4-ab3e-a9c0-69169eda90bd
00020000-55e4-ab3e-7717-0bc78152280d	00030000-55e4-ab3e-198a-1af4838e5600
00020000-55e4-ab3e-7717-0bc78152280d	00030000-55e4-ab3e-8f7b-d5b746ee0e1a
00020000-55e4-ab3e-7717-0bc78152280d	00030000-55e4-ab3e-101f-0a62cd06afd8
00020000-55e4-ab3e-7717-0bc78152280d	00030000-55e4-ab3e-59b4-f59a86aa92f4
00020000-55e4-ab3e-7717-0bc78152280d	00030000-55e4-ab3e-0aea-f2396dccaf82
00020000-55e4-ab3e-7717-0bc78152280d	00030000-55e4-ab3e-cd04-b86fb6e8db92
00020000-55e4-ab3e-7717-0bc78152280d	00030000-55e4-ab3e-edf8-bf650263e31d
00020000-55e4-ab3e-7717-0bc78152280d	00030000-55e4-ab3e-73de-65c3b6e7fb13
00020000-55e4-ab3e-7717-0bc78152280d	00030000-55e4-ab3e-6253-0099c1c8e464
00020000-55e4-ab3e-7717-0bc78152280d	00030000-55e4-ab3e-13d4-7549552add4c
00020000-55e4-ab3e-7717-0bc78152280d	00030000-55e4-ab3e-8783-0225d0f30cf3
00020000-55e4-ab3e-7717-0bc78152280d	00030000-55e4-ab3e-462f-dbe98988d636
00020000-55e4-ab3e-7717-0bc78152280d	00030000-55e4-ab3e-fb09-1d327986431f
00020000-55e4-ab3e-7717-0bc78152280d	00030000-55e4-ab3e-1f15-f9e2d7921dd1
00020000-55e4-ab3e-7717-0bc78152280d	00030000-55e4-ab3e-16e0-55fcf3e3db57
00020000-55e4-ab3e-7717-0bc78152280d	00030000-55e4-ab3e-30c8-fe78f5b0a914
00020000-55e4-ab3e-7717-0bc78152280d	00030000-55e4-ab3e-0aee-387d173d355d
00020000-55e4-ab3e-7717-0bc78152280d	00030000-55e4-ab3e-afd6-663f74bc96b6
00020000-55e4-ab3e-7717-0bc78152280d	00030000-55e4-ab3e-4aca-60284f7178e9
00020000-55e4-ab3e-7717-0bc78152280d	00030000-55e4-ab3e-79a8-5112971f8435
00020000-55e4-ab3e-7717-0bc78152280d	00030000-55e4-ab3e-cd99-57002ba0368f
00020000-55e4-ab3e-7717-0bc78152280d	00030000-55e4-ab3e-0ee5-8d7ca440d25a
00020000-55e4-ab3e-7717-0bc78152280d	00030000-55e4-ab3e-bec5-10661830f780
00020000-55e4-ab3e-7717-0bc78152280d	00030000-55e4-ab3e-879e-c7af0aff0499
00020000-55e4-ab3e-4a5b-aceace21909a	00030000-55e4-ab3e-7acc-85e77d6c0fb1
00020000-55e4-ab3e-4a5b-aceace21909a	00030000-55e4-ab3e-e024-073b20aee6a2
00020000-55e4-ab3e-4a5b-aceace21909a	00030000-55e4-ab3e-25e1-9ed191c44d2d
00020000-55e4-ab3e-4a5b-aceace21909a	00030000-55e4-ab3e-e726-527884b6f263
00020000-55e4-ab3e-4a5b-aceace21909a	00030000-55e4-ab3e-f19a-afa876ef486a
00020000-55e4-ab3e-4a5b-aceace21909a	00030000-55e4-ab3e-d36b-701e3d2c762a
00020000-55e4-ab3e-4a5b-aceace21909a	00030000-55e4-ab3e-aecd-0d71d17d4805
00020000-55e4-ab3e-4a5b-aceace21909a	00030000-55e4-ab3e-a6bf-9516b3780a84
00020000-55e4-ab3e-4a5b-aceace21909a	00030000-55e4-ab3e-cdf3-f766079b8ca5
00020000-55e4-ab3e-4a5b-aceace21909a	00030000-55e4-ab3e-15e2-30d82aaa58c6
00020000-55e4-ab3e-4a5b-aceace21909a	00030000-55e4-ab3e-f565-5bf2dd4eba37
00020000-55e4-ab3e-4a5b-aceace21909a	00030000-55e4-ab3e-6336-b99a819fac03
00020000-55e4-ab3e-4a5b-aceace21909a	00030000-55e4-ab3e-760b-5fde1a9132a9
00020000-55e4-ab3e-4a5b-aceace21909a	00030000-55e4-ab3e-a9c0-69169eda90bd
00020000-55e4-ab3e-4a5b-aceace21909a	00030000-55e4-ab3e-8f7b-d5b746ee0e1a
00020000-55e4-ab3e-4a5b-aceace21909a	00030000-55e4-ab3e-101f-0a62cd06afd8
00020000-55e4-ab3e-4a5b-aceace21909a	00030000-55e4-ab3e-59b4-f59a86aa92f4
00020000-55e4-ab3e-4a5b-aceace21909a	00030000-55e4-ab3e-73de-65c3b6e7fb13
00020000-55e4-ab3e-4a5b-aceace21909a	00030000-55e4-ab3e-13d4-7549552add4c
00020000-55e4-ab3e-4a5b-aceace21909a	00030000-55e4-ab3e-462f-dbe98988d636
00020000-55e4-ab3e-4a5b-aceace21909a	00030000-55e4-ab3e-1f15-f9e2d7921dd1
00020000-55e4-ab3e-4a5b-aceace21909a	00030000-55e4-ab3e-f176-f0b9b8cdaad8
00020000-55e4-ab3e-4a5b-aceace21909a	00030000-55e4-ab3e-4c97-e0d2650fa393
00020000-55e4-ab3e-4a5b-aceace21909a	00030000-55e4-ab3e-31a6-c150a91413a0
00020000-55e4-ab3e-4a5b-aceace21909a	00030000-55e4-ab3e-a66d-7c74f029cee3
00020000-55e4-ab3e-4a5b-aceace21909a	00030000-55e4-ab3e-0b8f-664af8e53412
00020000-55e4-ab3e-4a5b-aceace21909a	00030000-55e4-ab3e-9e31-b10a83394ff6
00020000-55e4-ab3e-4a5b-aceace21909a	00030000-55e4-ab3e-bec5-10661830f780
00020000-55e4-ab3e-4a5b-aceace21909a	00030000-55e4-ab3e-879e-c7af0aff0499
00020000-55e4-ab3e-ef19-03a0a8d384a7	00030000-55e4-ab3e-7acc-85e77d6c0fb1
00020000-55e4-ab3e-ef19-03a0a8d384a7	00030000-55e4-ab3e-1566-ddf00cfa894f
00020000-55e4-ab3e-ef19-03a0a8d384a7	00030000-55e4-ab3e-e024-073b20aee6a2
00020000-55e4-ab3e-ef19-03a0a8d384a7	00030000-55e4-ab3e-63f7-d13091ae79c7
00020000-55e4-ab3e-ef19-03a0a8d384a7	00030000-55e4-ab3e-d468-10fa1996b317
00020000-55e4-ab3e-ef19-03a0a8d384a7	00030000-55e4-ab3e-2f3e-b0722916c793
00020000-55e4-ab3e-ef19-03a0a8d384a7	00030000-55e4-ab3e-25e1-9ed191c44d2d
00020000-55e4-ab3e-ef19-03a0a8d384a7	00030000-55e4-ab3e-e726-527884b6f263
00020000-55e4-ab3e-ef19-03a0a8d384a7	00030000-55e4-ab3e-2a98-f753fa6a4d1f
00020000-55e4-ab3e-ef19-03a0a8d384a7	00030000-55e4-ab3e-f19a-afa876ef486a
00020000-55e4-ab3e-ef19-03a0a8d384a7	00030000-55e4-ab3e-d36b-701e3d2c762a
00020000-55e4-ab3e-ef19-03a0a8d384a7	00030000-55e4-ab3e-aecd-0d71d17d4805
00020000-55e4-ab3e-ef19-03a0a8d384a7	00030000-55e4-ab3e-cdf3-f766079b8ca5
00020000-55e4-ab3e-ef19-03a0a8d384a7	00030000-55e4-ab3e-15e2-30d82aaa58c6
00020000-55e4-ab3e-ef19-03a0a8d384a7	00030000-55e4-ab3e-f565-5bf2dd4eba37
00020000-55e4-ab3e-ef19-03a0a8d384a7	00030000-55e4-ab3e-760b-5fde1a9132a9
00020000-55e4-ab3e-ef19-03a0a8d384a7	00030000-55e4-ab3e-a9c0-69169eda90bd
00020000-55e4-ab3e-ef19-03a0a8d384a7	00030000-55e4-ab3e-59b4-f59a86aa92f4
00020000-55e4-ab3e-ef19-03a0a8d384a7	00030000-55e4-ab3e-cd04-b86fb6e8db92
00020000-55e4-ab3e-ef19-03a0a8d384a7	00030000-55e4-ab3e-73de-65c3b6e7fb13
00020000-55e4-ab3e-ef19-03a0a8d384a7	00030000-55e4-ab3e-13d4-7549552add4c
00020000-55e4-ab3e-ef19-03a0a8d384a7	00030000-55e4-ab3e-462f-dbe98988d636
00020000-55e4-ab3e-ef19-03a0a8d384a7	00030000-55e4-ab3e-1f15-f9e2d7921dd1
00020000-55e4-ab3e-ef19-03a0a8d384a7	00030000-55e4-ab3e-30c8-fe78f5b0a914
00020000-55e4-ab3e-ef19-03a0a8d384a7	00030000-55e4-ab3e-4aca-60284f7178e9
00020000-55e4-ab3e-ef19-03a0a8d384a7	00030000-55e4-ab3e-cd99-57002ba0368f
00020000-55e4-ab3e-ef19-03a0a8d384a7	00030000-55e4-ab3e-bec5-10661830f780
00020000-55e4-ab3e-ef19-03a0a8d384a7	00030000-55e4-ab3e-879e-c7af0aff0499
00020000-55e4-ab3e-3497-383bd9d772d8	00030000-55e4-ab3e-7acc-85e77d6c0fb1
00020000-55e4-ab3e-3497-383bd9d772d8	00030000-55e4-ab3e-6123-7f58911c355b
00020000-55e4-ab3e-3497-383bd9d772d8	00030000-55e4-ab3e-51e4-b52227dfe87b
00020000-55e4-ab3e-3497-383bd9d772d8	00030000-55e4-ab3e-e024-073b20aee6a2
00020000-55e4-ab3e-3497-383bd9d772d8	00030000-55e4-ab3e-25e1-9ed191c44d2d
00020000-55e4-ab3e-3497-383bd9d772d8	00030000-55e4-ab3e-e726-527884b6f263
00020000-55e4-ab3e-3497-383bd9d772d8	00030000-55e4-ab3e-f19a-afa876ef486a
00020000-55e4-ab3e-3497-383bd9d772d8	00030000-55e4-ab3e-d36b-701e3d2c762a
00020000-55e4-ab3e-3497-383bd9d772d8	00030000-55e4-ab3e-cdf3-f766079b8ca5
00020000-55e4-ab3e-3497-383bd9d772d8	00030000-55e4-ab3e-15e2-30d82aaa58c6
00020000-55e4-ab3e-3497-383bd9d772d8	00030000-55e4-ab3e-760b-5fde1a9132a9
00020000-55e4-ab3e-3497-383bd9d772d8	00030000-55e4-ab3e-a9c0-69169eda90bd
00020000-55e4-ab3e-3497-383bd9d772d8	00030000-55e4-ab3e-59b4-f59a86aa92f4
00020000-55e4-ab3e-3497-383bd9d772d8	00030000-55e4-ab3e-73de-65c3b6e7fb13
00020000-55e4-ab3e-3497-383bd9d772d8	00030000-55e4-ab3e-13d4-7549552add4c
00020000-55e4-ab3e-3497-383bd9d772d8	00030000-55e4-ab3e-462f-dbe98988d636
00020000-55e4-ab3e-3497-383bd9d772d8	00030000-55e4-ab3e-1f15-f9e2d7921dd1
00020000-55e4-ab3e-3497-383bd9d772d8	00030000-55e4-ab3e-30c8-fe78f5b0a914
00020000-55e4-ab3e-3497-383bd9d772d8	00030000-55e4-ab3e-bec5-10661830f780
00020000-55e4-ab3e-3497-383bd9d772d8	00030000-55e4-ab3e-879e-c7af0aff0499
00020000-55e4-ab3e-3da4-7e53159f2182	00030000-55e4-ab3e-7acc-85e77d6c0fb1
00020000-55e4-ab3e-3da4-7e53159f2182	00030000-55e4-ab3e-e024-073b20aee6a2
00020000-55e4-ab3e-3da4-7e53159f2182	00030000-55e4-ab3e-25e1-9ed191c44d2d
00020000-55e4-ab3e-3da4-7e53159f2182	00030000-55e4-ab3e-e726-527884b6f263
00020000-55e4-ab3e-3da4-7e53159f2182	00030000-55e4-ab3e-f19a-afa876ef486a
00020000-55e4-ab3e-3da4-7e53159f2182	00030000-55e4-ab3e-d36b-701e3d2c762a
00020000-55e4-ab3e-3da4-7e53159f2182	00030000-55e4-ab3e-cdf3-f766079b8ca5
00020000-55e4-ab3e-3da4-7e53159f2182	00030000-55e4-ab3e-15e2-30d82aaa58c6
00020000-55e4-ab3e-3da4-7e53159f2182	00030000-55e4-ab3e-760b-5fde1a9132a9
00020000-55e4-ab3e-3da4-7e53159f2182	00030000-55e4-ab3e-a9c0-69169eda90bd
00020000-55e4-ab3e-3da4-7e53159f2182	00030000-55e4-ab3e-59b4-f59a86aa92f4
00020000-55e4-ab3e-3da4-7e53159f2182	00030000-55e4-ab3e-73de-65c3b6e7fb13
00020000-55e4-ab3e-3da4-7e53159f2182	00030000-55e4-ab3e-13d4-7549552add4c
00020000-55e4-ab3e-3da4-7e53159f2182	00030000-55e4-ab3e-462f-dbe98988d636
00020000-55e4-ab3e-3da4-7e53159f2182	00030000-55e4-ab3e-1f15-f9e2d7921dd1
00020000-55e4-ab3e-3da4-7e53159f2182	00030000-55e4-ab3e-38e3-d3583309e940
00020000-55e4-ab3e-3da4-7e53159f2182	00030000-55e4-ab3e-030d-fec76a7d77a3
00020000-55e4-ab3e-3da4-7e53159f2182	00030000-55e4-ab3e-30c8-fe78f5b0a914
00020000-55e4-ab3e-3da4-7e53159f2182	00030000-55e4-ab3e-bec5-10661830f780
00020000-55e4-ab3e-3da4-7e53159f2182	00030000-55e4-ab3e-879e-c7af0aff0499
00020000-55e4-ab40-a725-c3e74a0a337d	00030000-55e4-ab3e-58c6-28e08843891e
00020000-55e4-ab40-a725-c3e74a0a337d	00030000-55e4-ab3e-fcef-32da555d342b
00020000-55e4-ab40-a725-c3e74a0a337d	00030000-55e4-ab3e-030d-fec76a7d77a3
00020000-55e4-ab40-a725-c3e74a0a337d	00030000-55e4-ab3e-6299-649bccfdca04
00020000-55e4-ab40-a725-c3e74a0a337d	00030000-55e4-ab3e-ec75-a4d0732439e9
00020000-55e4-ab40-a725-c3e74a0a337d	00030000-55e4-ab3e-5a79-89fd8bdf70cf
00020000-55e4-ab40-a725-c3e74a0a337d	00030000-55e4-ab3e-740b-c1c4a611b65d
00020000-55e4-ab40-a725-c3e74a0a337d	00030000-55e4-ab3e-7acc-85e77d6c0fb1
00020000-55e4-ab40-a725-c3e74a0a337d	00030000-55e4-ab3e-6123-7f58911c355b
00020000-55e4-ab40-a725-c3e74a0a337d	00030000-55e4-ab3e-1566-ddf00cfa894f
00020000-55e4-ab40-a725-c3e74a0a337d	00030000-55e4-ab3e-51e4-b52227dfe87b
00020000-55e4-ab40-a725-c3e74a0a337d	00030000-55e4-ab3e-e024-073b20aee6a2
00020000-55e4-ab40-a725-c3e74a0a337d	00030000-55e4-ab3e-63f7-d13091ae79c7
00020000-55e4-ab40-a725-c3e74a0a337d	00030000-55e4-ab3e-d468-10fa1996b317
00020000-55e4-ab40-a725-c3e74a0a337d	00030000-55e4-ab3e-f33d-4e95d1fa0e16
00020000-55e4-ab40-a725-c3e74a0a337d	00030000-55e4-ab3e-2f3e-b0722916c793
00020000-55e4-ab40-a725-c3e74a0a337d	00030000-55e4-ab3e-40b7-e872bb04b280
00020000-55e4-ab40-a725-c3e74a0a337d	00030000-55e4-ab3e-25e1-9ed191c44d2d
00020000-55e4-ab40-a725-c3e74a0a337d	00030000-55e4-ab3e-048b-5aa5cabcbce4
00020000-55e4-ab40-a725-c3e74a0a337d	00030000-55e4-ab3e-e726-527884b6f263
00020000-55e4-ab40-a725-c3e74a0a337d	00030000-55e4-ab3e-740f-7db55fab5bab
00020000-55e4-ab40-a725-c3e74a0a337d	00030000-55e4-ab3e-4ecd-1084dd45c4c9
00020000-55e4-ab40-a725-c3e74a0a337d	00030000-55e4-ab3e-8ed6-c9ababbc00f2
00020000-55e4-ab40-a725-c3e74a0a337d	00030000-55e4-ab3e-5c0e-40731acbbd00
00020000-55e4-ab40-a725-c3e74a0a337d	00030000-55e4-ab3e-0a24-5ddd4f7366e1
00020000-55e4-ab40-a725-c3e74a0a337d	00030000-55e4-ab3e-2a98-f753fa6a4d1f
00020000-55e4-ab40-a725-c3e74a0a337d	00030000-55e4-ab3e-fe81-79119e5c8cf0
00020000-55e4-ab40-a725-c3e74a0a337d	00030000-55e4-ab3e-f19a-afa876ef486a
00020000-55e4-ab40-a725-c3e74a0a337d	00030000-55e4-ab3e-93a5-bb1364cec76c
00020000-55e4-ab40-a725-c3e74a0a337d	00030000-55e4-ab3e-d36b-701e3d2c762a
00020000-55e4-ab40-a725-c3e74a0a337d	00030000-55e4-ab3e-160d-b4cb1c2158fa
00020000-55e4-ab40-a725-c3e74a0a337d	00030000-55e4-ab3e-aecd-0d71d17d4805
00020000-55e4-ab40-a725-c3e74a0a337d	00030000-55e4-ab3e-a6bf-9516b3780a84
00020000-55e4-ab40-a725-c3e74a0a337d	00030000-55e4-ab3e-832a-7cd8e57d22cc
00020000-55e4-ab40-a725-c3e74a0a337d	00030000-55e4-ab3e-f736-2fbab7ece682
00020000-55e4-ab40-a725-c3e74a0a337d	00030000-55e4-ab3e-c5b6-4f1d19e5fd6a
00020000-55e4-ab40-a725-c3e74a0a337d	00030000-55e4-ab3e-45ce-f5dd6295c34f
00020000-55e4-ab40-a725-c3e74a0a337d	00030000-55e4-ab3e-cdf3-f766079b8ca5
00020000-55e4-ab40-a725-c3e74a0a337d	00030000-55e4-ab3e-059e-06c3a714cd7e
00020000-55e4-ab40-a725-c3e74a0a337d	00030000-55e4-ab3e-15e2-30d82aaa58c6
00020000-55e4-ab40-a725-c3e74a0a337d	00030000-55e4-ab3e-eab6-b3b7feb84cc6
00020000-55e4-ab40-a725-c3e74a0a337d	00030000-55e4-ab3e-f565-5bf2dd4eba37
00020000-55e4-ab40-a725-c3e74a0a337d	00030000-55e4-ab3e-6336-b99a819fac03
00020000-55e4-ab40-a725-c3e74a0a337d	00030000-55e4-ab3e-6598-2853d8ccda5b
00020000-55e4-ab40-a725-c3e74a0a337d	00030000-55e4-ab3e-0040-596e09a37093
00020000-55e4-ab40-a725-c3e74a0a337d	00030000-55e4-ab3e-c17d-9516eb5b2df9
00020000-55e4-ab40-a725-c3e74a0a337d	00030000-55e4-ab3e-1cf4-b70889fbc2c2
00020000-55e4-ab40-a725-c3e74a0a337d	00030000-55e4-ab3e-602e-cacbb6de6b49
00020000-55e4-ab40-a725-c3e74a0a337d	00030000-55e4-ab3e-8077-65f983dc90a2
00020000-55e4-ab40-a725-c3e74a0a337d	00030000-55e4-ab3e-760b-5fde1a9132a9
00020000-55e4-ab40-a725-c3e74a0a337d	00030000-55e4-ab3e-0bf7-150c377c03aa
00020000-55e4-ab40-a725-c3e74a0a337d	00030000-55e4-ab3e-a9c0-69169eda90bd
00020000-55e4-ab40-a725-c3e74a0a337d	00030000-55e4-ab3e-198a-1af4838e5600
00020000-55e4-ab40-a725-c3e74a0a337d	00030000-55e4-ab3e-4594-5d1c27807828
00020000-55e4-ab40-a725-c3e74a0a337d	00030000-55e4-ab3e-ef06-de9e63254213
00020000-55e4-ab40-a725-c3e74a0a337d	00030000-55e4-ab3e-8f7b-d5b746ee0e1a
00020000-55e4-ab40-a725-c3e74a0a337d	00030000-55e4-ab3e-101f-0a62cd06afd8
00020000-55e4-ab40-a725-c3e74a0a337d	00030000-55e4-ab3e-59b4-f59a86aa92f4
00020000-55e4-ab40-a725-c3e74a0a337d	00030000-55e4-ab3e-0aea-f2396dccaf82
00020000-55e4-ab40-a725-c3e74a0a337d	00030000-55e4-ab3e-e50c-0d17f11dac9f
00020000-55e4-ab40-a725-c3e74a0a337d	00030000-55e4-ab3e-c4c7-a9b49b304c6d
00020000-55e4-ab40-a725-c3e74a0a337d	00030000-55e4-ab3e-77d7-94f0ed416790
00020000-55e4-ab40-a725-c3e74a0a337d	00030000-55e4-ab3e-560f-8e240a2b82b8
00020000-55e4-ab40-a725-c3e74a0a337d	00030000-55e4-ab3e-cd04-b86fb6e8db92
00020000-55e4-ab40-a725-c3e74a0a337d	00030000-55e4-ab3e-edf8-bf650263e31d
00020000-55e4-ab40-a725-c3e74a0a337d	00030000-55e4-ab3e-07f6-255eb00d5b07
00020000-55e4-ab40-a725-c3e74a0a337d	00030000-55e4-ab3e-0f9d-91a0c39ccb5b
00020000-55e4-ab40-a725-c3e74a0a337d	00030000-55e4-ab3e-857e-485fe813c7fe
00020000-55e4-ab40-a725-c3e74a0a337d	00030000-55e4-ab3e-4447-ed7c1cf0f772
00020000-55e4-ab40-a725-c3e74a0a337d	00030000-55e4-ab3e-d5b2-cf2fa60e4829
00020000-55e4-ab40-a725-c3e74a0a337d	00030000-55e4-ab3e-8da4-0d84e16e0b99
00020000-55e4-ab40-a725-c3e74a0a337d	00030000-55e4-ab3e-f70f-b27daffbd1f3
00020000-55e4-ab40-a725-c3e74a0a337d	00030000-55e4-ab3e-ae1d-954a1400773c
00020000-55e4-ab40-a725-c3e74a0a337d	00030000-55e4-ab3e-14b3-6438d200c72f
00020000-55e4-ab40-a725-c3e74a0a337d	00030000-55e4-ab3e-c118-ad30f630fd7e
00020000-55e4-ab40-a725-c3e74a0a337d	00030000-55e4-ab3e-ecd3-44eea0e73e82
00020000-55e4-ab40-a725-c3e74a0a337d	00030000-55e4-ab3e-f689-1087abf403cc
00020000-55e4-ab40-a725-c3e74a0a337d	00030000-55e4-ab3e-5167-c138b5bfd385
00020000-55e4-ab40-a725-c3e74a0a337d	00030000-55e4-ab3e-1d20-f0884b25399a
00020000-55e4-ab40-a725-c3e74a0a337d	00030000-55e4-ab3e-1a9f-d52a9c6cf230
00020000-55e4-ab40-a725-c3e74a0a337d	00030000-55e4-ab3e-7820-93b460da6e73
00020000-55e4-ab40-a725-c3e74a0a337d	00030000-55e4-ab3e-785a-1f839097735b
00020000-55e4-ab40-a725-c3e74a0a337d	00030000-55e4-ab3e-9fe2-cf4d8d34457f
00020000-55e4-ab40-a725-c3e74a0a337d	00030000-55e4-ab3e-fd5b-59a0887fe01d
00020000-55e4-ab40-a725-c3e74a0a337d	00030000-55e4-ab3e-d83e-10f7e3f48e4b
00020000-55e4-ab40-a725-c3e74a0a337d	00030000-55e4-ab3e-73de-65c3b6e7fb13
00020000-55e4-ab40-a725-c3e74a0a337d	00030000-55e4-ab3e-6253-0099c1c8e464
00020000-55e4-ab40-a725-c3e74a0a337d	00030000-55e4-ab3e-dd51-8a9e118ae114
00020000-55e4-ab40-a725-c3e74a0a337d	00030000-55e4-ab3e-994c-a8ef3a5b380b
00020000-55e4-ab40-a725-c3e74a0a337d	00030000-55e4-ab3e-130c-56a654d9f869
00020000-55e4-ab40-a725-c3e74a0a337d	00030000-55e4-ab3e-9747-95fbd41dc334
00020000-55e4-ab40-a725-c3e74a0a337d	00030000-55e4-ab3e-13d4-7549552add4c
00020000-55e4-ab40-a725-c3e74a0a337d	00030000-55e4-ab3e-8783-0225d0f30cf3
00020000-55e4-ab40-a725-c3e74a0a337d	00030000-55e4-ab3e-462f-dbe98988d636
00020000-55e4-ab40-a725-c3e74a0a337d	00030000-55e4-ab3e-fb09-1d327986431f
00020000-55e4-ab40-a725-c3e74a0a337d	00030000-55e4-ab3e-5cd5-fce78cf518d3
00020000-55e4-ab40-a725-c3e74a0a337d	00030000-55e4-ab3e-7ed7-0dcbc8a2dfeb
00020000-55e4-ab40-a725-c3e74a0a337d	00030000-55e4-ab3e-c396-1f77dd0e85f4
00020000-55e4-ab40-a725-c3e74a0a337d	00030000-55e4-ab3e-02a9-6cfc414bea7e
00020000-55e4-ab40-a725-c3e74a0a337d	00030000-55e4-ab3e-d972-b89cad33bc20
00020000-55e4-ab40-a725-c3e74a0a337d	00030000-55e4-ab3e-ec97-46b36b14f0e3
00020000-55e4-ab40-a725-c3e74a0a337d	00030000-55e4-ab3e-41e7-383fa071d4c8
00020000-55e4-ab40-a725-c3e74a0a337d	00030000-55e4-ab3e-3ebb-c8b1f9dc368e
00020000-55e4-ab40-a725-c3e74a0a337d	00030000-55e4-ab3e-1f15-f9e2d7921dd1
00020000-55e4-ab40-a725-c3e74a0a337d	00030000-55e4-ab3e-16e0-55fcf3e3db57
00020000-55e4-ab40-a725-c3e74a0a337d	00030000-55e4-ab3e-1dc9-c532ade7d62a
00020000-55e4-ab40-a725-c3e74a0a337d	00030000-55e4-ab3e-df03-6e2165bbe5c9
00020000-55e4-ab40-a725-c3e74a0a337d	00030000-55e4-ab3e-6404-0a1d21046154
00020000-55e4-ab40-a725-c3e74a0a337d	00030000-55e4-ab3e-f1ce-6b421bdef3f7
00020000-55e4-ab40-a725-c3e74a0a337d	00030000-55e4-ab3e-2a3a-06db74634f24
00020000-55e4-ab40-a725-c3e74a0a337d	00030000-55e4-ab3e-f237-52b200476cd5
00020000-55e4-ab40-a725-c3e74a0a337d	00030000-55e4-ab3e-8021-1c5b9178fda7
00020000-55e4-ab40-a725-c3e74a0a337d	00030000-55e4-ab3e-cb7e-8dde2a5cd3b4
00020000-55e4-ab40-a725-c3e74a0a337d	00030000-55e4-ab3e-f176-f0b9b8cdaad8
00020000-55e4-ab40-a725-c3e74a0a337d	00030000-55e4-ab3e-4c97-e0d2650fa393
00020000-55e4-ab40-a725-c3e74a0a337d	00030000-55e4-ab3e-38e3-d3583309e940
00020000-55e4-ab40-a725-c3e74a0a337d	00030000-55e4-ab3e-0974-79fcedaf1228
00020000-55e4-ab40-a725-c3e74a0a337d	00030000-55e4-ab3e-30c8-fe78f5b0a914
00020000-55e4-ab40-a725-c3e74a0a337d	00030000-55e4-ab3e-5506-6a232d060016
00020000-55e4-ab40-a725-c3e74a0a337d	00030000-55e4-ab3e-84e0-aee60b1d037b
00020000-55e4-ab40-a725-c3e74a0a337d	00030000-55e4-ab3e-aee5-a44835c49d07
00020000-55e4-ab40-a725-c3e74a0a337d	00030000-55e4-ab3e-31a6-c150a91413a0
00020000-55e4-ab40-a725-c3e74a0a337d	00030000-55e4-ab3e-a66d-7c74f029cee3
00020000-55e4-ab40-a725-c3e74a0a337d	00030000-55e4-ab3e-0aee-387d173d355d
00020000-55e4-ab40-a725-c3e74a0a337d	00030000-55e4-ab3e-afd6-663f74bc96b6
00020000-55e4-ab40-a725-c3e74a0a337d	00030000-55e4-ab3e-4aca-60284f7178e9
00020000-55e4-ab40-a725-c3e74a0a337d	00030000-55e4-ab3e-79a8-5112971f8435
00020000-55e4-ab40-a725-c3e74a0a337d	00030000-55e4-ab3e-bd09-fae3d4460a4d
00020000-55e4-ab40-a725-c3e74a0a337d	00030000-55e4-ab3e-6b3f-469ece328954
00020000-55e4-ab40-a725-c3e74a0a337d	00030000-55e4-ab3e-416f-ca6cc1b0c76b
00020000-55e4-ab40-a725-c3e74a0a337d	00030000-55e4-ab3e-50e6-519db4912556
00020000-55e4-ab40-a725-c3e74a0a337d	00030000-55e4-ab3e-0b8f-664af8e53412
00020000-55e4-ab40-a725-c3e74a0a337d	00030000-55e4-ab3e-9e31-b10a83394ff6
00020000-55e4-ab40-a725-c3e74a0a337d	00030000-55e4-ab3e-cd99-57002ba0368f
00020000-55e4-ab40-a725-c3e74a0a337d	00030000-55e4-ab3e-0ee5-8d7ca440d25a
00020000-55e4-ab40-a725-c3e74a0a337d	00030000-55e4-ab3e-bec5-10661830f780
00020000-55e4-ab40-a725-c3e74a0a337d	00030000-55e4-ab3e-6d48-75ed353c3832
00020000-55e4-ab40-a725-c3e74a0a337d	00030000-55e4-ab3e-879e-c7af0aff0499
00020000-55e4-ab40-a725-c3e74a0a337d	00030000-55e4-ab3e-f549-6bcb83411df9
\.


--
-- TOC entry 3213 (class 0 OID 1076983)
-- Dependencies: 200
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 3214 (class 0 OID 1076990)
-- Dependencies: 201
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 3228 (class 0 OID 1077137)
-- Dependencies: 215
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, zacetek, konec, placilonavajo, vrednostvaje, planiranostevilovaj, vrednostvaj, vrednostpredstave, vrednostdopremiere, aktivna, zaposlenvdrjz, samozaposlen, igralec, opis) FROM stdin;
000b0000-55e4-ab40-b36f-66da62de9525	00090000-55e4-ab40-f568-f191ebf85478	\N	\N	0001	\N	\N	f	10.00	3	10.00	30.00	10.00	t	t	f	t	Pogodba o sodelovanju
000b0000-55e4-ab40-5140-92df8be4c20b	00090000-55e4-ab40-0271-3548b7b91265	\N	\N	0002	\N	\N	t	11.00	10	11.00	31.00	110.00	t	f	t	t	Pogodba za vlogo Helena
000b0000-55e4-ab40-990d-de8901056eb0	00090000-55e4-ab40-1f61-5f624514522f	\N	\N	0003	\N	\N	f	12.00	4	12.00	32.00	12.00	t	f	t	f	Pogodba za lektoriranje
\.


--
-- TOC entry 3198 (class 0 OID 1076819)
-- Dependencies: 185
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, drzava_id, sifra, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo, nvo) FROM stdin;
00080000-55e4-ab40-b653-e7941cffe97f	00040000-55e4-ab3e-47e7-638e4c3c8064	0988	AK	Juhuhu d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55e4-ab40-823d-89c73f23226e	00040000-55e4-ab3e-47e7-638e4c3c8064	0989	AK	Hopsasa d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	t
00080000-55e4-ab40-be50-5f4a23bd8b1c	00040000-55e4-ab3e-47e7-638e4c3c8064	0987	AK	Gledališče Šrum d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55e4-ab40-4216-54184b22c243	00040000-55e4-ab3e-47e7-638e4c3c8064	0986	AK	Lutkovni Direndaj d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55e4-ab40-551b-9687983ce6ee	00040000-55e4-ab3e-47e7-638e4c3c8064	0985	AK	Tatjana Stanič, Lektoriranje, s.p.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55e4-ab40-3ae3-0b9dbb295926	00040000-55e4-ab3e-4f91-03edb285e30a	0984	AK	Gledališče Lepote tvoje		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55e4-ab40-42f8-e16c9aa39cd5	00040000-55e4-ab3e-6125-e3c5b1867139	0983	AK	Sunce naše		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55e4-ab40-4b40-939f953daf73	00040000-55e4-ab3e-a623-7582cba26d5c	0982	AK	Theater Amadeus		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
\.


--
-- TOC entry 3199 (class 0 OID 1076838)
-- Dependencies: 186
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-55e4-ab3e-6d12-71154a4bba82	8341	Adlešiči
00050000-55e4-ab3e-3649-a198a43d5f4a	5270	Ajdovščina
00050000-55e4-ab3e-a8ec-46bb836107be	6280	Ankaran/Ancarano
00050000-55e4-ab3e-ba80-881c3f6619bb	9253	Apače
00050000-55e4-ab3e-7980-b4cc93cfa3a2	8253	Artiče
00050000-55e4-ab3e-d992-3972bfd0b7ff	4275	Begunje na Gorenjskem
00050000-55e4-ab3e-96e5-d3c82c2d6dcd	1382	Begunje pri Cerknici
00050000-55e4-ab3e-af90-debc004d2f01	9231	Beltinci
00050000-55e4-ab3e-d0ad-18fc8853bc46	2234	Benedikt
00050000-55e4-ab3e-41b5-03319d14be72	2345	Bistrica ob Dravi
00050000-55e4-ab3e-50d6-aa06a48f25f6	3256	Bistrica ob Sotli
00050000-55e4-ab3e-c870-e3dbaf7656a3	8259	Bizeljsko
00050000-55e4-ab3e-87c9-283a3bebad33	1223	Blagovica
00050000-55e4-ab3e-4454-6c88a1057565	8283	Blanca
00050000-55e4-ab3e-00a4-8cf862bf00af	4260	Bled
00050000-55e4-ab3e-731f-575e0bbf7e58	4273	Blejska Dobrava
00050000-55e4-ab3e-6fa1-3ca42a16ca5d	9265	Bodonci
00050000-55e4-ab3e-f259-3253d9be8ede	9222	Bogojina
00050000-55e4-ab3e-662e-b727e3591d46	4263	Bohinjska Bela
00050000-55e4-ab3e-46a7-1b358bc1705b	4264	Bohinjska Bistrica
00050000-55e4-ab3e-dda3-0562246ec59a	4265	Bohinjsko jezero
00050000-55e4-ab3e-ace5-6cc840f9afe4	1353	Borovnica
00050000-55e4-ab3e-b033-718859cc9622	8294	Boštanj
00050000-55e4-ab3e-3de1-08b6d8e354ba	5230	Bovec
00050000-55e4-ab3e-4159-d69f5e26846d	5295	Branik
00050000-55e4-ab3e-c65d-0328e2e80cf4	3314	Braslovče
00050000-55e4-ab3e-b6d3-4d931e5c37cf	5223	Breginj
00050000-55e4-ab3e-3d4c-8d45f4337e02	8280	Brestanica
00050000-55e4-ab3e-1aba-32257fea9b23	2354	Bresternica
00050000-55e4-ab3e-3509-d39296697419	4243	Brezje
00050000-55e4-ab3e-7095-8ecafa271da8	1351	Brezovica pri Ljubljani
00050000-55e4-ab3e-c53b-3b5e9c0c3966	8250	Brežice
00050000-55e4-ab3e-3c90-8c4b706a3c26	4210	Brnik - Aerodrom
00050000-55e4-ab3e-2ebb-c3bed20b7f3d	8321	Brusnice
00050000-55e4-ab3e-d3f4-77cfc245fded	3255	Buče
00050000-55e4-ab3e-664b-776b833f3fca	8276	Bučka 
00050000-55e4-ab3e-7732-0efbe0ef05fe	9261	Cankova
00050000-55e4-ab3e-43f4-d32c23b7df1b	3000	Celje 
00050000-55e4-ab3e-3efd-4c67ccf4c126	3001	Celje - poštni predali
00050000-55e4-ab3e-694b-19611343e549	4207	Cerklje na Gorenjskem
00050000-55e4-ab3e-bac5-2c3597b2f9fc	8263	Cerklje ob Krki
00050000-55e4-ab3e-3f16-38e89cf1f8a7	1380	Cerknica
00050000-55e4-ab3e-50e4-646fe0ee27c0	5282	Cerkno
00050000-55e4-ab3e-2df4-504796be07fd	2236	Cerkvenjak
00050000-55e4-ab3e-b010-ae00988d0165	2215	Ceršak
00050000-55e4-ab3e-f67c-09467298cf11	2326	Cirkovce
00050000-55e4-ab3e-f5d6-cf63d9ab7464	2282	Cirkulane
00050000-55e4-ab3e-6e29-c1ae8ac9dc41	5273	Col
00050000-55e4-ab3e-c853-cea3d240f3d3	8251	Čatež ob Savi
00050000-55e4-ab3e-909a-a5548b71a0f4	1413	Čemšenik
00050000-55e4-ab3e-7302-83c35361aa78	5253	Čepovan
00050000-55e4-ab3e-a893-c645e0f6702b	9232	Črenšovci
00050000-55e4-ab3e-a6f4-adf1cb37434b	2393	Črna na Koroškem
00050000-55e4-ab3e-2468-554c1919d2d1	6275	Črni Kal
00050000-55e4-ab3e-b637-43a598a0ef6f	5274	Črni Vrh nad Idrijo
00050000-55e4-ab3e-33a5-a6f744f6ae11	5262	Črniče
00050000-55e4-ab3e-5623-fff3f40479c4	8340	Črnomelj
00050000-55e4-ab3e-b040-0f12d5be110c	6271	Dekani
00050000-55e4-ab3e-8a42-91d4884a4f92	5210	Deskle
00050000-55e4-ab3e-b787-595ec5e5ddef	2253	Destrnik
00050000-55e4-ab3e-b882-a00417e4fb4d	6215	Divača
00050000-55e4-ab3e-554d-369e49937295	1233	Dob
00050000-55e4-ab3e-6111-b75cf02d9edf	3224	Dobje pri Planini
00050000-55e4-ab3e-c9c7-a1fa85e5336c	8257	Dobova
00050000-55e4-ab3e-5aaf-d227d42b01c9	1423	Dobovec
00050000-55e4-ab3e-e71c-bd028a8e81e6	5263	Dobravlje
00050000-55e4-ab3e-47e2-2d895063879b	3204	Dobrna
00050000-55e4-ab3e-4915-5951d1366318	8211	Dobrnič
00050000-55e4-ab3e-091f-30035a827832	1356	Dobrova
00050000-55e4-ab3e-75f6-8fc8e93dd497	9223	Dobrovnik/Dobronak 
00050000-55e4-ab3e-39bd-36b87d0e01a8	5212	Dobrovo v Brdih
00050000-55e4-ab3e-894d-ad7dec311290	1431	Dol pri Hrastniku
00050000-55e4-ab3e-a82c-9496014f8a7b	1262	Dol pri Ljubljani
00050000-55e4-ab3e-22c9-8d6add711538	1273	Dole pri Litiji
00050000-55e4-ab3e-dc0a-c5fdbea5ad5d	1331	Dolenja vas
00050000-55e4-ab3e-fa31-bb6f206e5e29	8350	Dolenjske Toplice
00050000-55e4-ab3e-4d02-a4b5186c194a	1230	Domžale
00050000-55e4-ab3e-80ba-e4359db38236	2252	Dornava
00050000-55e4-ab3e-c49d-c94968c194c1	5294	Dornberk
00050000-55e4-ab3e-64d5-3ac89fc76deb	1319	Draga
00050000-55e4-ab3e-5bf0-d5ffe607ff8f	8343	Dragatuš
00050000-55e4-ab3e-99bd-dd3f82907974	3222	Dramlje
00050000-55e4-ab3e-c6ef-5f23ef96ef60	2370	Dravograd
00050000-55e4-ab3e-3efb-fe2a034acd05	4203	Duplje
00050000-55e4-ab3e-b5cd-3698b1ac568b	6221	Dutovlje
00050000-55e4-ab3e-cba9-77e571c479b9	8361	Dvor
00050000-55e4-ab3e-df47-697327c12817	2343	Fala
00050000-55e4-ab3e-74bf-c09f741a21a7	9208	Fokovci
00050000-55e4-ab3e-67b4-291067120b6c	2313	Fram
00050000-55e4-ab3e-8c3d-f86314f3afcc	3213	Frankolovo
00050000-55e4-ab3e-7542-753442895412	1274	Gabrovka
00050000-55e4-ab3e-6ac6-32de0c221a21	8254	Globoko
00050000-55e4-ab3e-a914-079ae7cf34f9	5275	Godovič
00050000-55e4-ab3e-02ec-8cdd4f5b9440	4204	Golnik
00050000-55e4-ab3e-75a5-7164b2b55ab8	3303	Gomilsko
00050000-55e4-ab3e-0853-28ef0e774b4c	4224	Gorenja vas
00050000-55e4-ab3e-559a-781b811736e1	3263	Gorica pri Slivnici
00050000-55e4-ab3e-34a0-e94e0550a3ce	2272	Gorišnica
00050000-55e4-ab3e-9af8-9c40c3a91b11	9250	Gornja Radgona
00050000-55e4-ab3e-a28e-1c6f768a764e	3342	Gornji Grad
00050000-55e4-ab3e-0fcf-208adcada770	4282	Gozd Martuljek
00050000-55e4-ab3e-d74e-2b910fa829c9	6272	Gračišče
00050000-55e4-ab3e-0f7d-9a37888f1bd3	9264	Grad
00050000-55e4-ab3e-c132-27c4023c6d94	8332	Gradac
00050000-55e4-ab3e-6079-a870e57c5453	1384	Grahovo
00050000-55e4-ab3e-6b1a-efa86b2f3418	5242	Grahovo ob Bači
00050000-55e4-ab3e-e0a6-0fe07e3af4a2	5251	Grgar
00050000-55e4-ab3e-f8f2-cd4017f3a4c2	3302	Griže
00050000-55e4-ab3e-5438-d59705a1ff70	3231	Grobelno
00050000-55e4-ab3e-03fd-f360edfdfc1e	1290	Grosuplje
00050000-55e4-ab3e-b597-5ae66fd62e04	2288	Hajdina
00050000-55e4-ab3e-ccd0-d330c5cd71b8	8362	Hinje
00050000-55e4-ab3e-a266-728b86d26430	2311	Hoče
00050000-55e4-ab3e-c8cc-a97021804b3d	9205	Hodoš/Hodos
00050000-55e4-ab3e-988c-74827d447e7f	1354	Horjul
00050000-55e4-ab3e-0a66-deaa245b1601	1372	Hotedršica
00050000-55e4-ab3e-7161-458951ff09b1	1430	Hrastnik
00050000-55e4-ab3e-dc90-7cd533a0cc6a	6225	Hruševje
00050000-55e4-ab3e-6054-427ff431caae	4276	Hrušica
00050000-55e4-ab3e-4c85-e980788246a8	5280	Idrija
00050000-55e4-ab3e-18dc-6a97e132d748	1292	Ig
00050000-55e4-ab3e-cd00-150d4b03f019	6250	Ilirska Bistrica
00050000-55e4-ab3e-4969-d47e5c474bae	6251	Ilirska Bistrica-Trnovo
00050000-55e4-ab3e-cb7c-3d48bcedb49e	1295	Ivančna Gorica
00050000-55e4-ab3e-80a6-1f159e5cdd9b	2259	Ivanjkovci
00050000-55e4-ab3e-acf8-0c9b0086e616	1411	Izlake
00050000-55e4-ab3e-c18e-49478721d779	6310	Izola/Isola
00050000-55e4-ab3e-b48d-cda548f41ae7	2222	Jakobski Dol
00050000-55e4-ab3e-1e02-d60fc8722914	2221	Jarenina
00050000-55e4-ab3e-a418-eee51e9cdaad	6254	Jelšane
00050000-55e4-ab3e-80b8-b8e2530e20b3	4270	Jesenice
00050000-55e4-ab3e-b86a-234dac913b5f	8261	Jesenice na Dolenjskem
00050000-55e4-ab3e-98b0-22c543c033f6	3273	Jurklošter
00050000-55e4-ab3e-9379-ad1fe94bdafc	2223	Jurovski Dol
00050000-55e4-ab3e-b67e-9680e0a8d97a	2256	Juršinci
00050000-55e4-ab3e-5725-feb872ea8935	5214	Kal nad Kanalom
00050000-55e4-ab3e-b3c4-d1340c0c1a7e	3233	Kalobje
00050000-55e4-ab3e-38bf-6ba0a046acc1	4246	Kamna Gorica
00050000-55e4-ab3e-cb91-ef0b8d391fb2	2351	Kamnica
00050000-55e4-ab3e-6fa7-4206c70b9f6d	1241	Kamnik
00050000-55e4-ab3e-9e95-853fcbd3b618	5213	Kanal
00050000-55e4-ab3e-2f0b-f26c8f2e6c2b	8258	Kapele
00050000-55e4-ab3e-86f4-a2d0596d7120	2362	Kapla
00050000-55e4-ab3e-6b30-94873dd17758	2325	Kidričevo
00050000-55e4-ab3e-dcbb-5dc120a8b528	1412	Kisovec
00050000-55e4-ab3e-62d9-cdaec193abd4	6253	Knežak
00050000-55e4-ab3e-6fee-657c6b4b6ee3	5222	Kobarid
00050000-55e4-ab3e-d4d6-0853588895f2	9227	Kobilje
00050000-55e4-ab3e-e991-0caec9941bda	1330	Kočevje
00050000-55e4-ab3e-7a28-996c8b6e3f72	1338	Kočevska Reka
00050000-55e4-ab3e-27ed-4655a699d040	2276	Kog
00050000-55e4-ab3e-2091-7f43f4a7562f	5211	Kojsko
00050000-55e4-ab3e-2391-9fd3010e8b31	6223	Komen
00050000-55e4-ab3e-ac08-697af95af76b	1218	Komenda
00050000-55e4-ab3e-efb1-b5f28859a135	6000	Koper/Capodistria 
00050000-55e4-ab3e-fccd-f931c9a03a5d	6001	Koper/Capodistria - poštni predali
00050000-55e4-ab3e-8686-416e28937168	8282	Koprivnica
00050000-55e4-ab3e-e500-14ccfcb4adfe	5296	Kostanjevica na Krasu
00050000-55e4-ab3e-0f14-8e58edc34f71	8311	Kostanjevica na Krki
00050000-55e4-ab3e-c58c-adc6f9afe05e	1336	Kostel
00050000-55e4-ab3e-bbbd-6f581d59ec38	6256	Košana
00050000-55e4-ab3e-724e-7f0a30b3c96a	2394	Kotlje
00050000-55e4-ab3e-f993-c3ddfa98a132	6240	Kozina
00050000-55e4-ab3e-5a97-f8b729f75a88	3260	Kozje
00050000-55e4-ab3e-e0e3-955ba9180041	4000	Kranj 
00050000-55e4-ab3e-c08e-0a47f7c579df	4001	Kranj - poštni predali
00050000-55e4-ab3e-3ccb-f334d63afe76	4280	Kranjska Gora
00050000-55e4-ab3e-844e-9f92b52133d6	1281	Kresnice
00050000-55e4-ab3e-34dc-234ebb093d1b	4294	Križe
00050000-55e4-ab3e-aff6-e8bcb1bc7d0c	9206	Križevci
00050000-55e4-ab3e-8685-5b7e5f5148a3	9242	Križevci pri Ljutomeru
00050000-55e4-ab3e-d09f-891caf43ae66	1301	Krka
00050000-55e4-ab3e-1e8b-c7a725f38ef6	8296	Krmelj
00050000-55e4-ab3e-9861-129272f13bae	4245	Kropa
00050000-55e4-ab3e-b48e-f2d4cbfc2912	8262	Krška vas
00050000-55e4-ab3e-5465-5d489dcf5316	8270	Krško
00050000-55e4-ab3e-3d98-d50ec521bd16	9263	Kuzma
00050000-55e4-ab3e-d437-6f4ae28210f2	2318	Laporje
00050000-55e4-ab3e-319f-dc8dd7c9688c	3270	Laško
00050000-55e4-ab3e-d68d-67c6ce7185f4	1219	Laze v Tuhinju
00050000-55e4-ab3e-baf5-eb65bd7b8424	2230	Lenart v Slovenskih goricah
00050000-55e4-ab3e-a0fd-69c9b6be184b	9220	Lendava/Lendva
00050000-55e4-ab3e-d8cc-4196eba83d23	4248	Lesce
00050000-55e4-ab3e-765e-bd684093bc7f	3261	Lesično
00050000-55e4-ab3e-7939-4d4c021112e8	8273	Leskovec pri Krškem
00050000-55e4-ab3e-7b8b-fc0641e104b6	2372	Libeliče
00050000-55e4-ab3e-db3a-dbb39c2e4567	2341	Limbuš
00050000-55e4-ab3e-8c35-7cc4471ba03a	1270	Litija
00050000-55e4-ab3e-15f2-29e49f6cb004	3202	Ljubečna
00050000-55e4-ab3e-015d-2650ad99b08a	1000	Ljubljana 
00050000-55e4-ab3e-df0d-5ba3602cb154	1001	Ljubljana - poštni predali
00050000-55e4-ab3e-7b29-0d0433cb68d4	1231	Ljubljana - Črnuče
00050000-55e4-ab3e-dca6-c2ff0c3ffc35	1261	Ljubljana - Dobrunje
00050000-55e4-ab3e-9f76-2ddb5a44b4f7	1260	Ljubljana - Polje
00050000-55e4-ab3e-0558-36855ad8d68d	1210	Ljubljana - Šentvid
00050000-55e4-ab3e-a66d-1d51418ae212	1211	Ljubljana - Šmartno
00050000-55e4-ab3e-be16-62025972fbd0	3333	Ljubno ob Savinji
00050000-55e4-ab3e-3d7c-1d9eaa1fb87f	9240	Ljutomer
00050000-55e4-ab3e-44f6-1f8b0f1f932f	3215	Loče
00050000-55e4-ab3e-9de4-1db033248131	5231	Log pod Mangartom
00050000-55e4-ab3e-9ca0-fdb2c6ef5681	1358	Log pri Brezovici
00050000-55e4-ab3e-3b09-12921b1080ef	1370	Logatec
00050000-55e4-ab3e-89ed-3c83f9d36ad4	1371	Logatec
00050000-55e4-ab3e-786c-29eb273854e3	1434	Loka pri Zidanem Mostu
00050000-55e4-ab3e-3f6e-0a3878dea453	3223	Loka pri Žusmu
00050000-55e4-ab3e-b258-2d8f4494fb57	6219	Lokev
00050000-55e4-ab3e-fb9d-25c5684f90b7	1318	Loški Potok
00050000-55e4-ab3e-52e3-ba7b0ec804ec	2324	Lovrenc na Dravskem polju
00050000-55e4-ab3e-ce5a-5b419f0adcf1	2344	Lovrenc na Pohorju
00050000-55e4-ab3e-f642-5e029110f846	3334	Luče
00050000-55e4-ab3e-6ada-beb4453f7d7f	1225	Lukovica
00050000-55e4-ab3e-2e32-97e55bee84d3	9202	Mačkovci
00050000-55e4-ab3e-9d33-8a576e455b31	2322	Majšperk
00050000-55e4-ab3e-29b0-99d3071d8f2b	2321	Makole
00050000-55e4-ab3e-735d-dd7f61ee5f02	9243	Mala Nedelja
00050000-55e4-ab3e-de9d-08b75d3d0cb2	2229	Malečnik
00050000-55e4-ab3e-6fe7-480973fbf205	6273	Marezige
00050000-55e4-ab3e-8026-5c9d358aca49	2000	Maribor 
00050000-55e4-ab3e-4a94-e78a0bb47f32	2001	Maribor - poštni predali
00050000-55e4-ab3e-56ba-0b1476c09374	2206	Marjeta na Dravskem polju
00050000-55e4-ab3e-3f85-96995cf69fae	2281	Markovci
00050000-55e4-ab3e-2453-8631c90323c7	9221	Martjanci
00050000-55e4-ab3e-343e-5e929f347932	6242	Materija
00050000-55e4-ab3e-c5de-ee7f11704f72	4211	Mavčiče
00050000-55e4-ab3e-67fd-9de7a8112ff9	1215	Medvode
00050000-55e4-ab3e-431b-adbc36d864b6	1234	Mengeš
00050000-55e4-ab3e-e85e-0c69bb95ab07	8330	Metlika
00050000-55e4-ab3e-2bd9-7e49f7be22ce	2392	Mežica
00050000-55e4-ab3e-0225-713db5ec4cb8	2204	Miklavž na Dravskem polju
00050000-55e4-ab3e-d620-b4e15d2be44f	2275	Miklavž pri Ormožu
00050000-55e4-ab3e-0027-bcc372af4f44	5291	Miren
00050000-55e4-ab3e-6683-f1b31cee4acb	8233	Mirna
00050000-55e4-ab3e-013e-a28855e0c969	8216	Mirna Peč
00050000-55e4-ab3e-e852-82434496fb4c	2382	Mislinja
00050000-55e4-ab3e-bc58-cc8bb4a236df	4281	Mojstrana
00050000-55e4-ab3e-86ef-d5aacd98a8eb	8230	Mokronog
00050000-55e4-ab3e-899b-ae41808372aa	1251	Moravče
00050000-55e4-ab3e-ebf6-b6dadb0b0416	9226	Moravske Toplice
00050000-55e4-ab3e-d068-ba89e7f8fc3a	5216	Most na Soči
00050000-55e4-ab3e-0059-b9f334b9c14b	1221	Motnik
00050000-55e4-ab3e-967c-717298f0c1eb	3330	Mozirje
00050000-55e4-ab3e-39bf-0d3ccedace2f	9000	Murska Sobota 
00050000-55e4-ab3e-20b6-4e31d403751d	9001	Murska Sobota - poštni predali
00050000-55e4-ab3e-d95a-72c366aee791	2366	Muta
00050000-55e4-ab3e-8b05-988b47d36a01	4202	Naklo
00050000-55e4-ab3e-852a-69821215f6b5	3331	Nazarje
00050000-55e4-ab3e-3fbd-55c8fbe40a0b	1357	Notranje Gorice
00050000-55e4-ab3e-1e1f-191f42da67bc	3203	Nova Cerkev
00050000-55e4-ab3e-4b80-9b3ee18385a0	5000	Nova Gorica 
00050000-55e4-ab3e-acd6-668d21ed845c	5001	Nova Gorica - poštni predali
00050000-55e4-ab3e-8c72-553c500c9598	1385	Nova vas
00050000-55e4-ab3e-76c0-9effb3d7ea1d	8000	Novo mesto
00050000-55e4-ab3e-2396-c72b48543a32	8001	Novo mesto - poštni predali
00050000-55e4-ab3e-cb13-b33919826916	6243	Obrov
00050000-55e4-ab3e-470b-501ac7f6ce31	9233	Odranci
00050000-55e4-ab3e-93d8-90fca2c31ec5	2317	Oplotnica
00050000-55e4-ab3e-cc6c-71775b701bf0	2312	Orehova vas
00050000-55e4-ab3e-72a5-778646d55ae0	2270	Ormož
00050000-55e4-ab3e-b90a-3e3f4025f81d	1316	Ortnek
00050000-55e4-ab3e-172a-440b48274000	1337	Osilnica
00050000-55e4-ab3e-7558-ae2a5a9642f4	8222	Otočec
00050000-55e4-ab3e-cedb-01cff5b13bfb	2361	Ožbalt
00050000-55e4-ab3e-acaf-e982d7f9bcf9	2231	Pernica
00050000-55e4-ab3e-defb-fa81783f6af1	2211	Pesnica pri Mariboru
00050000-55e4-ab3e-4d9a-efd21c6a49bf	9203	Petrovci
00050000-55e4-ab3e-856d-bd17a8fc4628	3301	Petrovče
00050000-55e4-ab3e-a1d4-cffb4d3f16a6	6330	Piran/Pirano
00050000-55e4-ab3e-8293-a3b34be8da2d	8255	Pišece
00050000-55e4-ab3e-b23d-5d945b9d855a	6257	Pivka
00050000-55e4-ab3e-70c6-ac3b718f9286	6232	Planina
00050000-55e4-ab3e-6b92-bf352c4185ce	3225	Planina pri Sevnici
00050000-55e4-ab3e-b57b-1aa130e19ab5	6276	Pobegi
00050000-55e4-ab3e-b681-86008188a58b	8312	Podbočje
00050000-55e4-ab3e-8f41-d160ce7aa120	5243	Podbrdo
00050000-55e4-ab3e-756a-69084092b90a	3254	Podčetrtek
00050000-55e4-ab3e-b744-abdd0c22af97	2273	Podgorci
00050000-55e4-ab3e-bde8-74ce4ad0c5e5	6216	Podgorje
00050000-55e4-ab3e-6e94-189b68906b9d	2381	Podgorje pri Slovenj Gradcu
00050000-55e4-ab3e-a4b8-e8d82b4447d3	6244	Podgrad
00050000-55e4-ab3e-1588-926f83b164da	1414	Podkum
00050000-55e4-ab3e-d81b-af3c34fdb8fb	2286	Podlehnik
00050000-55e4-ab3e-f0d9-8dbb9248abd7	5272	Podnanos
00050000-55e4-ab3e-5632-45c8966f89e4	4244	Podnart
00050000-55e4-ab3e-c056-2c16906770cb	3241	Podplat
00050000-55e4-ab3e-28cd-e41e5ab41ffc	3257	Podsreda
00050000-55e4-ab3e-a3a0-ee9c476b3b6b	2363	Podvelka
00050000-55e4-ab3e-0203-72d39996342e	2208	Pohorje
00050000-55e4-ab3e-3212-70db38f87d5f	2257	Polenšak
00050000-55e4-ab3e-80a0-ca45ea1cff4a	1355	Polhov Gradec
00050000-55e4-ab3e-80da-2c7ead976675	4223	Poljane nad Škofjo Loko
00050000-55e4-ab3e-a43e-685aa0dbb7d9	2319	Poljčane
00050000-55e4-ab3e-7577-dbac33c996cc	1272	Polšnik
00050000-55e4-ab3e-b8af-c5d33950d58f	3313	Polzela
00050000-55e4-ab3e-b5f8-5397f10e5671	3232	Ponikva
00050000-55e4-ab3e-ba8e-a6a92f33f322	6320	Portorož/Portorose
00050000-55e4-ab3e-890d-60fd45498ed3	6230	Postojna
00050000-55e4-ab3e-c033-c51ff5c5350d	2331	Pragersko
00050000-55e4-ab3e-ac7a-eafb6221aae7	3312	Prebold
00050000-55e4-ab3e-6f17-164a5ff1697c	4205	Preddvor
00050000-55e4-ab3e-8a1a-41c7f0f053b8	6255	Prem
00050000-55e4-ab3e-70ed-624be0fe21c8	1352	Preserje
00050000-55e4-ab3e-cb24-8a5689868aea	6258	Prestranek
00050000-55e4-ab3e-c7dc-809d9d49a443	2391	Prevalje
00050000-55e4-ab3e-9959-e28c077832d5	3262	Prevorje
00050000-55e4-ab3e-f791-7dbc436b7dd1	1276	Primskovo 
00050000-55e4-ab3e-81a5-f4a9125455c5	3253	Pristava pri Mestinju
00050000-55e4-ab3e-01ac-7ab4bae4bf2b	9207	Prosenjakovci/Partosfalva
00050000-55e4-ab3e-a05a-68c17b71c028	5297	Prvačina
00050000-55e4-ab3e-2753-fbc81608806a	2250	Ptuj
00050000-55e4-ab3e-b8f3-f5a9805cfde5	2323	Ptujska Gora
00050000-55e4-ab3e-e1e3-7bb134664158	9201	Puconci
00050000-55e4-ab3e-1534-1f1c3bdac302	2327	Rače
00050000-55e4-ab3e-532a-b6dfa6a3e6dd	1433	Radeče
00050000-55e4-ab3e-4d4e-16d0b12046e5	9252	Radenci
00050000-55e4-ab3e-ce17-a2eddabb1557	2360	Radlje ob Dravi
00050000-55e4-ab3e-7a21-d606860d08f9	1235	Radomlje
00050000-55e4-ab3e-5527-e94b96f7ac31	4240	Radovljica
00050000-55e4-ab3e-27c8-a29128c87fba	8274	Raka
00050000-55e4-ab3e-a65d-98b8d02968c1	1381	Rakek
00050000-55e4-ab3e-34f7-45f8689c7c99	4283	Rateče - Planica
00050000-55e4-ab3e-7ee6-c12384ca8cde	2390	Ravne na Koroškem
00050000-55e4-ab3e-da81-44b350e92788	9246	Razkrižje
00050000-55e4-ab3e-81c9-a43eb6ac5ffb	3332	Rečica ob Savinji
00050000-55e4-ab3e-4d73-a8af3fb3ca03	5292	Renče
00050000-55e4-ab3e-1a91-f05a1cdfa6b5	1310	Ribnica
00050000-55e4-ab3e-622d-4c146b3c8f97	2364	Ribnica na Pohorju
00050000-55e4-ab3e-f645-11abb33dd6c0	3272	Rimske Toplice
00050000-55e4-ab3e-a274-ae9d0a90b09e	1314	Rob
00050000-55e4-ab3e-12df-5635d4f24e0b	5215	Ročinj
00050000-55e4-ab3e-7b35-802396e23f3d	3250	Rogaška Slatina
00050000-55e4-ab3e-652e-dedea682346f	9262	Rogašovci
00050000-55e4-ab3e-edb4-59972b337c5b	3252	Rogatec
00050000-55e4-ab3e-f49c-47216f1bbbae	1373	Rovte
00050000-55e4-ab3e-0df6-62adc32f5dfa	2342	Ruše
00050000-55e4-ab3e-6eb1-d09166e846db	1282	Sava
00050000-55e4-ab3e-b3d8-b20b2b681972	6333	Sečovlje/Sicciole
00050000-55e4-ab3e-989c-fe5b49c3978d	4227	Selca
00050000-55e4-ab3e-3308-47a7000ef551	2352	Selnica ob Dravi
00050000-55e4-ab3e-8c93-ec2dd02194ab	8333	Semič
00050000-55e4-ab3e-432e-fd1d49f347e6	8281	Senovo
00050000-55e4-ab3e-4152-74f34f23d5b8	6224	Senožeče
00050000-55e4-ab3e-f03e-5dad373b30f0	8290	Sevnica
00050000-55e4-ab3e-66b5-e608bd3e384d	6210	Sežana
00050000-55e4-ab3e-6190-22bd611de317	2214	Sladki Vrh
00050000-55e4-ab3e-9e47-8a349fa498cb	5283	Slap ob Idrijci
00050000-55e4-ab3e-33d5-2743719b3659	2380	Slovenj Gradec
00050000-55e4-ab3e-c5c6-3f3986d4f863	2310	Slovenska Bistrica
00050000-55e4-ab3e-68c0-4d50f94ac7b8	3210	Slovenske Konjice
00050000-55e4-ab3e-30f7-ba2f22e2a6c7	1216	Smlednik
00050000-55e4-ab3e-a82a-82b33190b579	5232	Soča
00050000-55e4-ab3e-9bd9-42a883b411b2	1317	Sodražica
00050000-55e4-ab3e-1776-d2c00d22850c	3335	Solčava
00050000-55e4-ab3e-8072-0ca5c660ee2f	5250	Solkan
00050000-55e4-ab3e-40f5-0ea6ebef71ce	4229	Sorica
00050000-55e4-ab3e-50b8-e92e8498048a	4225	Sovodenj
00050000-55e4-ab3e-ddb9-97f45c5fb4f6	5281	Spodnja Idrija
00050000-55e4-ab3e-17c3-ce877fe79227	2241	Spodnji Duplek
00050000-55e4-ab3e-db86-2c62c9f91d87	9245	Spodnji Ivanjci
00050000-55e4-ab3e-a299-26e9bf20e45b	2277	Središče ob Dravi
00050000-55e4-ab3e-4790-037840634f19	4267	Srednja vas v Bohinju
00050000-55e4-ab3e-655d-d5c74fb9d578	8256	Sromlje 
00050000-55e4-ab3e-e4d5-420cc8371d9f	5224	Srpenica
00050000-55e4-ab3e-a3a7-a7fd34f4fc90	1242	Stahovica
00050000-55e4-ab3e-95fe-b54676399482	1332	Stara Cerkev
00050000-55e4-ab3e-216b-4393fe6d6a7c	8342	Stari trg ob Kolpi
00050000-55e4-ab3e-79a2-d4663d38614a	1386	Stari trg pri Ložu
00050000-55e4-ab3e-476a-3bc06acc6e32	2205	Starše
00050000-55e4-ab3e-e198-80d29fbd25c9	2289	Stoperce
00050000-55e4-ab3e-d505-c6ffdc17b295	8322	Stopiče
00050000-55e4-ab3e-4420-72f66296cbec	3206	Stranice
00050000-55e4-ab3e-a815-b2a74e669bb3	8351	Straža
00050000-55e4-ab3e-6490-ef03f8bdd8e6	1313	Struge
00050000-55e4-ab3e-36ec-7c08597acf0a	8293	Studenec
00050000-55e4-ab3e-f758-dcaea0620bd7	8331	Suhor
00050000-55e4-ab3e-c5da-4f65a4ec33fa	2233	Sv. Ana v Slovenskih goricah
00050000-55e4-ab3e-555a-c4366fc7498d	2235	Sv. Trojica v Slovenskih goricah
00050000-55e4-ab3e-1acd-d4262fe1397e	2353	Sveti Duh na Ostrem Vrhu
00050000-55e4-ab3e-bffc-9e904ab56774	9244	Sveti Jurij ob Ščavnici
00050000-55e4-ab3e-990a-4b1795e4a5e5	3264	Sveti Štefan
00050000-55e4-ab3e-dbf4-707b492b923e	2258	Sveti Tomaž
00050000-55e4-ab3e-4815-7fc9c81a4ca5	9204	Šalovci
00050000-55e4-ab3e-4bfa-6fcb83e79b22	5261	Šempas
00050000-55e4-ab3e-4803-4aefa1043b26	5290	Šempeter pri Gorici
00050000-55e4-ab3e-0aa7-0fd76e6baa56	3311	Šempeter v Savinjski dolini
00050000-55e4-ab3e-c0bf-de77262bb338	4208	Šenčur
00050000-55e4-ab3e-41a7-9d341916b934	2212	Šentilj v Slovenskih goricah
00050000-55e4-ab3e-8a05-613901e17bc1	8297	Šentjanž
00050000-55e4-ab3e-0695-ca977500838e	2373	Šentjanž pri Dravogradu
00050000-55e4-ab3e-cc6a-bfcdc2872d62	8310	Šentjernej
00050000-55e4-ab3e-77f8-dfb8b13e810b	3230	Šentjur
00050000-55e4-ab3e-c09e-1e5417b6173c	3271	Šentrupert
00050000-55e4-ab3e-1705-22d59d46095b	8232	Šentrupert
00050000-55e4-ab3e-3262-8a7e750102e8	1296	Šentvid pri Stični
00050000-55e4-ab3e-155a-0f7b0a5be087	8275	Škocjan
00050000-55e4-ab3e-c6e5-0d64d1625ec1	6281	Škofije
00050000-55e4-ab3e-d7cf-08908b928a40	4220	Škofja Loka
00050000-55e4-ab3e-6fe2-f037679f0b0a	3211	Škofja vas
00050000-55e4-ab3e-f1f1-cfad98a1ac5b	1291	Škofljica
00050000-55e4-ab3e-65fb-841f8aea8f75	6274	Šmarje
00050000-55e4-ab3e-72b8-c3c51e64ccf3	1293	Šmarje - Sap
00050000-55e4-ab3e-dce4-691f38c90b7b	3240	Šmarje pri Jelšah
00050000-55e4-ab3e-b244-fdcc23fb8e75	8220	Šmarješke Toplice
00050000-55e4-ab3e-b34d-3fedb544fac2	2315	Šmartno na Pohorju
00050000-55e4-ab3e-046e-85764bb191ad	3341	Šmartno ob Dreti
00050000-55e4-ab3e-4f56-4e1da7dce94b	3327	Šmartno ob Paki
00050000-55e4-ab3e-e5aa-7b52c5cf33c5	1275	Šmartno pri Litiji
00050000-55e4-ab3e-2bce-346333534749	2383	Šmartno pri Slovenj Gradcu
00050000-55e4-ab3e-f5ec-892c9a4704d8	3201	Šmartno v Rožni dolini
00050000-55e4-ab3e-9383-6110fbb48368	3325	Šoštanj
00050000-55e4-ab3e-1afc-7b08a71d71dd	6222	Štanjel
00050000-55e4-ab3e-2340-9d93f499e283	3220	Štore
00050000-55e4-ab3e-d27d-2765530496fb	3304	Tabor
00050000-55e4-ab3e-310d-2e60946190d4	3221	Teharje
00050000-55e4-ab3e-7673-db76687bac52	9251	Tišina
00050000-55e4-ab3e-029a-4500c7776949	5220	Tolmin
00050000-55e4-ab3e-48a8-17420f734854	3326	Topolšica
00050000-55e4-ab3e-e32b-820a1693501b	2371	Trbonje
00050000-55e4-ab3e-a243-b8d347c4b0c0	1420	Trbovlje
00050000-55e4-ab3e-6cef-2173003ba6e5	8231	Trebelno 
00050000-55e4-ab3e-9217-38cf2f3267a3	8210	Trebnje
00050000-55e4-ab3e-1115-4fd81c471f38	5252	Trnovo pri Gorici
00050000-55e4-ab3e-80f3-93f05cbd1e61	2254	Trnovska vas
00050000-55e4-ab3e-b11f-2f80f642fcb2	1222	Trojane
00050000-55e4-ab3e-3f83-69dc880b8e29	1236	Trzin
00050000-55e4-ab3e-5955-d5eab0f7e736	4290	Tržič
00050000-55e4-ab3e-a23d-7d727d3d9129	8295	Tržišče
00050000-55e4-ab3e-837f-446bb92ebdee	1311	Turjak
00050000-55e4-ab3e-1e68-b12b9e4639b3	9224	Turnišče
00050000-55e4-ab3e-a68b-ff8c3e2dad24	8323	Uršna sela
00050000-55e4-ab3e-5296-fb36d4bd71b4	1252	Vače
00050000-55e4-ab3e-1168-03e6574b07ce	3320	Velenje 
00050000-55e4-ab3e-bc3a-dd9dea8c85bb	3322	Velenje - poštni predali
00050000-55e4-ab3e-b944-bfa065352270	8212	Velika Loka
00050000-55e4-ab3e-8506-2c2dc0b92b7b	2274	Velika Nedelja
00050000-55e4-ab3e-6fb9-cf561c80bc74	9225	Velika Polana
00050000-55e4-ab3e-6eae-7558cad6c862	1315	Velike Lašče
00050000-55e4-ab3e-9d12-4c784ac54b0e	8213	Veliki Gaber
00050000-55e4-ab3e-312d-e3426c733334	9241	Veržej
00050000-55e4-ab3e-fd1e-f613b498deb7	1312	Videm - Dobrepolje
00050000-55e4-ab3e-a9f9-ed347bdbd0a6	2284	Videm pri Ptuju
00050000-55e4-ab3e-a792-d23184aa9ce9	8344	Vinica
00050000-55e4-ab3e-ea38-15766f0d6cbb	5271	Vipava
00050000-55e4-ab3e-87b6-dcfea84c539b	4212	Visoko
00050000-55e4-ab3e-a2f6-3bee5e1b0825	1294	Višnja Gora
00050000-55e4-ab3e-bc96-6fe35d71394b	3205	Vitanje
00050000-55e4-ab3e-3943-5e78df5829fb	2255	Vitomarci
00050000-55e4-ab3e-89a5-2b88caf19591	1217	Vodice
00050000-55e4-ab3e-419f-289a349e4f01	3212	Vojnik\t
00050000-55e4-ab3e-1ab5-8f873fd1fe0e	5293	Volčja Draga
00050000-55e4-ab3e-2afe-dbee67038f8b	2232	Voličina
00050000-55e4-ab3e-d598-fb1598442cb6	3305	Vransko
00050000-55e4-ab3e-dd9e-235a378816fb	6217	Vremski Britof
00050000-55e4-ab3e-57ef-0192b335cca5	1360	Vrhnika
00050000-55e4-ab3e-41cd-bb4cb07d4cb7	2365	Vuhred
00050000-55e4-ab3e-707f-be56a6c1147a	2367	Vuzenica
00050000-55e4-ab3e-8973-95c1da0d70e9	8292	Zabukovje 
00050000-55e4-ab3e-a15f-895d7fdacb2a	1410	Zagorje ob Savi
00050000-55e4-ab3e-5aa5-f209ea1d41f5	1303	Zagradec
00050000-55e4-ab3e-44ea-e24badc0bdb4	2283	Zavrč
00050000-55e4-ab3e-6a0a-71724d026622	8272	Zdole 
00050000-55e4-ab3e-1ba2-367c0d140eda	4201	Zgornja Besnica
00050000-55e4-ab3e-9495-d765a8d4b9c3	2242	Zgornja Korena
00050000-55e4-ab3e-7c22-e85764465642	2201	Zgornja Kungota
00050000-55e4-ab3e-a34d-0f83633924cc	2316	Zgornja Ložnica
00050000-55e4-ab3e-7daf-b23948dedd81	2314	Zgornja Polskava
00050000-55e4-ab3e-adba-70f9b8bf3b5c	2213	Zgornja Velka
00050000-55e4-ab3e-bd3d-e0c7848a83ee	4247	Zgornje Gorje
00050000-55e4-ab3e-292f-ac8fbd03e150	4206	Zgornje Jezersko
00050000-55e4-ab3e-5585-26dc50b1dfa6	2285	Zgornji Leskovec
00050000-55e4-ab3e-59c5-54a776adb4ff	1432	Zidani Most
00050000-55e4-ab3e-04a9-393aac2e300b	3214	Zreče
00050000-55e4-ab3e-8257-b680591c331a	4209	Žabnica
00050000-55e4-ab3e-a869-d5aeb0ea4913	3310	Žalec
00050000-55e4-ab3e-9901-b54b9dd82c16	4228	Železniki
00050000-55e4-ab3e-78ce-5f126bea217f	2287	Žetale
00050000-55e4-ab3e-36b6-014d69ab0843	4226	Žiri
00050000-55e4-ab3e-6683-fc5a8d6a6d9c	4274	Žirovnica
00050000-55e4-ab3e-5702-f270049ca2cd	8360	Žužemberk
\.


--
-- TOC entry 3215 (class 0 OID 1076998)
-- Dependencies: 202
-- Data for Name: postavkaracuna; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkaracuna (id, racun_id) FROM stdin;
\.


--
-- TOC entry 3200 (class 0 OID 1076846)
-- Dependencies: 187
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
00060000-55e4-ab40-26bd-352e027e2b21	00080000-55e4-ab40-b653-e7941cffe97f	\N	00040000-55e4-ab3e-47e7-638e4c3c8064	Narodni dom	\N	Koroška 15	\N	9231	Beltinci	\N	f	t
00060000-55e4-ab40-2aae-c8c06b95db7b	00080000-55e4-ab40-b653-e7941cffe97f	\N	00040000-55e4-ab3e-47e7-638e4c3c8064		\N	Koroška 22	\N	9231	Beltinci	\N	f	f
00060000-55e4-ab40-99ad-f1c28a51bceb	00080000-55e4-ab40-823d-89c73f23226e	\N	00040000-55e4-ab3e-47e7-638e4c3c8064		\N	Rimska ploščad 7	\N	9231	Beltinci	\N	f	t
\.


--
-- TOC entry 3206 (class 0 OID 1076925)
-- Dependencies: 193
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id) FROM stdin;
\.


--
-- TOC entry 3216 (class 0 OID 1077004)
-- Dependencies: 203
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 3240 (class 0 OID 1077322)
-- Dependencies: 227
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, koproducent_id, odstotekfinanciranja, delez, maticnikop, kpe, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 3241 (class 0 OID 1077332)
-- Dependencies: 228
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, sifra, status) FROM stdin;
00190000-55e4-ab40-9af9-f733062890c5	00080000-55e4-ab40-be50-5f4a23bd8b1c	0987	AK
00190000-55e4-ab40-22ce-3e8356a646ac	00080000-55e4-ab40-823d-89c73f23226e	0989	AK
00190000-55e4-ab40-c9d4-a9af62b6d9bd	00080000-55e4-ab40-4216-54184b22c243	0986	AK
00190000-55e4-ab40-52d6-92c9937e7fd3	00080000-55e4-ab40-3ae3-0b9dbb295926	0984	AK
00190000-55e4-ab40-9d63-05b2d53c5fc7	00080000-55e4-ab40-42f8-e16c9aa39cd5	0983	AK
00190000-55e4-ab40-562f-d49df1d8ff26	00080000-55e4-ab40-4b40-939f953daf73	0982	AK
\.


--
-- TOC entry 3242 (class 0 OID 1077340)
-- Dependencies: 229
-- Data for Name: programdela; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programdela (id, sezona_id, sifra, naziv, zacetek, konec, zakljuceno, potrjenprogram, stpremier, stint, stfest, strazno, stizjem, stponprem, stponprej, stponprejvelikih, stponprejmalih, stponprejmalihkopr, stponprejsredkopr, stponprejvelikihkopr, stgostujo, vrps1, vrps1do, vrps1mat, vrps1gostovsz, stizvnekomerc, stizvprem, stizvponprem, stizvponpremdoma, stizvponpremzamejo, stizvponpremgost, stizvponpremkopr, stizvponpremint, stizvponpremkoprint, stizvponprej, stizvponprejdoma, stizvponprejzamejo, stizvponprejgost, stizvponprejkopr, stizvponprejint, stizvponprejkoprint, stizvgostuj, stizvostalihnek, stizvgostovanjslo, stizvgostovanjzam, stizvgostovanjint, stobisknekom, stobisknekommat, stobisknekomgostslo, stobisknekomgostzam, stobisknekomgostint, stobiskprem, stobiskponprem, stobiskponpremdoma, stobiskponpremkopr, stobiskponpremkoprint, stobiskponpremgost, stobiskponpremzamejo, stobiskponpremint, avgobiskprired, avgzaseddvoran, avgcenavstopnice, stprodvstopnic, stkoprodukcij, stkoprodukcijint, stkoprodukcijnvo, stzaposlenih, stzaposigralcev, avgstnastopovigr, sthonorarnih, sthonorarnihigr, sthonorarnihigrtujjz, sthonorarnihigrsamoz, sredstvaint, sredstvaavt, sredstvazaprosenoprem, sredstvazaprosenoponprem, sredstvazaprosenoponprej, sredstvazaprosenogostujo, sredstvazaprosenoint, sredstvazaprosenofest, sredstvazaprosenorazno, sredstvazaprosenoizjem, sredstvadrugijavniprem, sredstvadrugijavniponprem, sredstvadrugijavniponprej, sredstvadrugijavnigostujo, sredstvadrugijavniint, sredstvadrugijavnifest, sredstvadrugijavnirazno, sredstvadrugijavniizjem, sredstvadrugiviriprem, sredstvadrugiviriponprem, sredstvadrugiviriponprej, sredstvadrugivirigostujo, sredstvadrugiviriint, sredstvadrugivirifest, sredstvadrugivirirazno, sredstvadrugiviriizjem, sredstvaavtsamoz) FROM stdin;
00290000-55e4-ab40-fb8b-9bd5b3dd3f75	\N	0001	Testni program dela	2016-02-01	2017-02-01	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 3243 (class 0 OID 1077384)
-- Dependencies: 230
-- Data for Name: programskaenotasklopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programskaenotasklopa (id, naslovpe, avtorpe, obsegpe, mesecpe, vrednostpe, programrazno_id) FROM stdin;
\.


--
-- TOC entry 3217 (class 0 OID 1077011)
-- Dependencies: 204
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, popa_id, naslov_id, sifra, naziv, jeprizorisce, seplanira, kapaciteta, opis) FROM stdin;
00220000-55e4-ab40-118f-d64290a1f14d	\N	\N	0001	Poskusna 1	f	t	8	Poskusna učilnica v prvem
00220000-55e4-ab40-26e7-f3377bf44c61	\N	\N	0002	Poskusna 3	f	f	34	Poskusna učilnica v tretjem
00220000-55e4-ab40-20c7-6ca4acb89e5a	\N	\N	0003	Kazinska	t	t	84	Kazinska dvorana
00220000-55e4-ab40-c678-6817047af1a2	\N	\N	0004	Mali oder	t	t	24	Mali oder 
00220000-55e4-ab40-eb0b-71210f76a3f7	\N	\N	0005	Komorni oder	t	t	15	Komorni oder
00220000-55e4-ab40-4285-1a02f2b3db8b	\N	\N	0006	Stara dvorana	t	t	96	Stara dvorana ali dvorana Franceta Prešerna
00220000-55e4-ab40-07c3-57699257d225	\N	\N	0007	Velika dvorana	t	t	160	Velika, glavna dvorana
\.


--
-- TOC entry 3218 (class 0 OID 1077024)
-- Dependencies: 205
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 3219 (class 0 OID 1077033)
-- Dependencies: 206
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 3229 (class 0 OID 1077153)
-- Dependencies: 216
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta, status) FROM stdin;
\.


--
-- TOC entry 3230 (class 0 OID 1077164)
-- Dependencies: 217
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 3187 (class 0 OID 1076687)
-- Dependencies: 174
-- Data for Name: revizije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY revizije (id, razred, objectid, upor, datum, tip, data) FROM stdin;
\.


--
-- TOC entry 3262 (class 0 OID 0)
-- Dependencies: 173
-- Name: revizije_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('revizije_id_seq', 1, false);


--
-- TOC entry 3220 (class 0 OID 1077043)
-- Dependencies: 207
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 3188 (class 0 OID 1076696)
-- Dependencies: 175
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-55e4-ab3e-5a9e-5a3150644ebf	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-55e4-ab3e-f51e-f9c2367da1d2	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-55e4-ab3e-5838-0760063d3472	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-55e4-ab3e-560c-2e0907258850	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-55e4-ab3e-7717-0bc78152280d	planer	Planer dogodkov v koledarju	t
00020000-55e4-ab3e-4a5b-aceace21909a	kadrovska	Kadrovska služba	t
00020000-55e4-ab3e-ef19-03a0a8d384a7	arhivar	Ažuriranje arhivalij	t
00020000-55e4-ab3e-3497-383bd9d772d8	igralec	Igralec	t
00020000-55e4-ab3e-3da4-7e53159f2182	prisotnost	Vnašalec prisotnosti, tudi za tiste izven uprizoritev	t
00020000-55e4-ab40-a725-c3e74a0a337d	vsadovoljenja	Vloga z vsemi posameznimi dovoljenji	t
\.


--
-- TOC entry 3191 (class 0 OID 1076726)
-- Dependencies: 178
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-55e4-ab3e-8dc4-22a73117ccd5	00020000-55e4-ab3e-5838-0760063d3472
00010000-55e4-ab3e-fa0e-d816ae882ce4	00020000-55e4-ab3e-5838-0760063d3472
00010000-55e4-ab40-f226-00d1ce6cbdb5	00020000-55e4-ab40-a725-c3e74a0a337d
\.


--
-- TOC entry 3221 (class 0 OID 1077049)
-- Dependencies: 208
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 3222 (class 0 OID 1077061)
-- Dependencies: 209
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 3207 (class 0 OID 1076932)
-- Dependencies: 194
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, sifra, ime, zacetek, konec, aktivna) FROM stdin;
\.


--
-- TOC entry 3245 (class 0 OID 1077405)
-- Dependencies: 232
-- Data for Name: stevilcenje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenje (id, sifra, naziv, prefix, suffix, zacetek, dolzina, format, globalno, poletih) FROM stdin;
00230000-55e4-ab3e-354d-b4c75ed25bd8	pri	Privzeto številčenje po letih YYYY-N	\N	\N	1	1	%l-%n	f	t
00230000-55e4-ab3e-0e04-7c08cd18c3ba	123	Privzeto številčenje kratkih šifer	\N	\N	100	3	%n	f	f
00230000-55e4-ab3e-4c33-551ecc55e744	bcd	Globalno številčenje črtnih kod	\N	\N	1	9	%n	t	f
00230000-55e4-ab3e-b5f3-b705e080d25d	sif	Številčenje šifrant	\N	\N	1000	4	%n	t	f
00230000-55e4-ab3e-2373-d7fee85a032a	tmp	Globalno številčenje začasnih številk	tmp	\N	1000	5	%l%n	t	t
\.


--
-- TOC entry 3246 (class 0 OID 1077416)
-- Dependencies: 233
-- Data for Name: stevilcenjekonfig; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjekonfig (id, stevilcenje_id, dok) FROM stdin;
00240000-55e4-ab3e-0b4f-49ce18cc2e86	00230000-55e4-ab3e-b5f3-b705e080d25d	popa
00240000-55e4-ab3e-c317-5d36ad72bece	00230000-55e4-ab3e-b5f3-b705e080d25d	oseba
00240000-55e4-ab3e-62b0-1488a9c71aca	00230000-55e4-ab3e-b5f3-b705e080d25d	sezona
00240000-55e4-ab3e-db12-8c1ad1477bc4	00230000-55e4-ab3e-0e04-7c08cd18c3ba	prostor
00240000-55e4-ab3e-0405-2b23eb3515a2	00230000-55e4-ab3e-b5f3-b705e080d25d	besedilo
00240000-55e4-ab3e-497c-e1a55b4cf4f6	00230000-55e4-ab3e-b5f3-b705e080d25d	uprizoritev
00240000-55e4-ab3e-c2d4-a86c9a88be00	00230000-55e4-ab3e-b5f3-b705e080d25d	funkcija
00240000-55e4-ab3e-7c6f-c2acfad8a4a6	00230000-55e4-ab3e-b5f3-b705e080d25d	tipfunkcije
00240000-55e4-ab3e-34ae-de538c37a24e	00230000-55e4-ab3e-b5f3-b705e080d25d	alternacija
00240000-55e4-ab3e-7deb-b62bcaf87afe	00230000-55e4-ab3e-354d-b4c75ed25bd8	pogodba
00240000-55e4-ab3e-6923-ad14234fede9	00230000-55e4-ab3e-b5f3-b705e080d25d	zaposlitev
00240000-55e4-ab3e-7e72-41b9c684eed0	00230000-55e4-ab3e-354d-b4c75ed25bd8	programdela
00240000-55e4-ab3e-35f6-e513150b6960	00230000-55e4-ab3e-b5f3-b705e080d25d	zapis
\.


--
-- TOC entry 3247 (class 0 OID 1077424)
-- Dependencies: 234
-- Data for Name: stevilcenjestanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjestanje (id, objid, leto, stevilka) FROM stdin;
\.


--
-- TOC entry 3231 (class 0 OID 1077174)
-- Dependencies: 218
-- Data for Name: strosekuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY strosekuprizoritve (id, uprizoritev_id, popa_id, naziv, vrednostdo, vrednostna, opis, tipstroska, sort, vrstastroska_id) FROM stdin;
00270000-55e4-ab40-7647-8ed07488b72a	000e0000-55e4-ab40-5ff0-4a6c45a8b255	00080000-55e4-ab40-b653-e7941cffe97f	Nabava kostumov	600.50	20.00	Krila in maske	materialni	1	003b0000-55e4-ab3e-9e61-680d733e034c
00270000-55e4-ab40-4076-3d1c63926cb0	000e0000-55e4-ab40-5ff0-4a6c45a8b255	00080000-55e4-ab40-b653-e7941cffe97f	Zavese	125.70	3.10	Modra in zelena zavesa	materialni	2	003b0000-55e4-ab3e-9e61-680d733e034c
00270000-55e4-ab40-0275-b1add3fdbb32	000e0000-55e4-ab40-5ff0-4a6c45a8b255	00080000-55e4-ab40-551b-9687983ce6ee	Avtorske pravice	300.00	30.00	Odkup avtorskih pravic	avtorprav	4	\N
\.


--
-- TOC entry 3201 (class 0 OID 1076861)
-- Dependencies: 188
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 3210 (class 0 OID 1076957)
-- Dependencies: 197
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja) FROM stdin;
001a0000-55e4-ab40-4826-f80ad6c17c24	00180000-55e4-ab40-d5ec-a5f6361b98d3	000c0000-55e4-ab40-fb96-c73f5c0ac09e	00090000-55e4-ab40-fca9-454c53fe792c	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55e4-ab40-4b58-c7e59ee711d4	00180000-55e4-ab40-d5ec-a5f6361b98d3	000c0000-55e4-ab40-aa06-f6e066f6dd11	00090000-55e4-ab40-e663-da322e20b628	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55e4-ab40-5f22-5a87a790caff	00180000-55e4-ab40-d5ec-a5f6361b98d3	000c0000-55e4-ab40-9f68-be6ef1117a26	00090000-55e4-ab40-ecc8-1e5ebdeb2800	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55e4-ab40-0001-7e5b75b41c90	00180000-55e4-ab40-d5ec-a5f6361b98d3	000c0000-55e4-ab40-534d-29af0895f2c3	00090000-55e4-ab40-caab-e041e1498303	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55e4-ab40-25c4-9bca7a30d230	00180000-55e4-ab40-d5ec-a5f6361b98d3	000c0000-55e4-ab40-98ff-4aa696809151	00090000-55e4-ab40-36e6-e47a29d9598f	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55e4-ab40-1c1c-b491527b6103	00180000-55e4-ab40-efa4-3baf41ffb081	\N	00090000-55e4-ab40-36e6-e47a29d9598f	2015-08-01 20:00:00	2015-08-01 23:00:00	\N	\N	2.00
\.


--
-- TOC entry 3232 (class 0 OID 1077188)
-- Dependencies: 219
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, ime, opis, imezenski, podrocje) FROM stdin;
000f0000-55e4-ab3e-aee9-491970f0211f	Avtor	Avtorji	Avtorka	umetnik
000f0000-55e4-ab3e-5d22-473da5ecc3e0	Priredba	Priredba	Priredba	umetnik
000f0000-55e4-ab3e-1cce-56ad6200b8ff	Prevod	Prevod	Prevod	umetnik
000f0000-55e4-ab3e-c945-c232e7dcb170	Režija	Režija	Režija	umetnik
000f0000-55e4-ab3e-8bb7-f18cb281f426	Dramaturgija	Dramaturgija	Dramaturgija	umetnik
000f0000-55e4-ab3e-115e-d135e8497c13	Scenografija	Scenografija	Scenografija	umetnik
000f0000-55e4-ab3e-7cae-0a26f314a48f	Kostumografija	Kostumografija	Kostumografija	umetnik
000f0000-55e4-ab3e-5ed3-a422c719ea25	Koreografija	Koreografija	Koreografija	umetnik
000f0000-55e4-ab3e-8f92-4870d5ea9aae	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	umetnik
000f0000-55e4-ab3e-acd8-451b84df176d	Oblikovanje maske	Oblikovanje maske	Oblikovanje maske	umetnik
000f0000-55e4-ab3e-9823-3595d006b2dd	Lektorstvo	Lektorstvo	Lektorstvo	umetnik
000f0000-55e4-ab3e-a633-3fead49a2d6a	Glasbeni soustvarjalec	Glasbeni soustvarjalci	Glasbena soustvarjalka	umetnik
000f0000-55e4-ab3e-9318-d9979c2f1ac1	Intermedijski ustvarjalec	Intermedijski ustvarjalci	Intermedijski ustvarjalka	umetnik
000f0000-55e4-ab3e-2e9a-8ea514d3e892	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	umetnik
000f0000-55e4-ab3e-e83b-a247230ca657	Vloga	Intermedijski ustvarjalci	Intermedijska ustvarjalka	igralec
000f0000-55e4-ab3e-3a25-ba7d5851901e	Produkcija, mentorstvo	Produkcija, mentorstvo	Produkcija, mentorstvo	umetnik
000f0000-55e4-ab3e-3c94-af9877c9eeb3	Tehnična podpora	Tehnična podpora	Tehnična podpora	tehnik
000f0000-55e4-ab3e-e2f5-9836bff3ad5f	Inšpicient	Inšpicienti	Inšpicientka	inspicient
\.


--
-- TOC entry 3244 (class 0 OID 1077394)
-- Dependencies: 231
-- Data for Name: tipprogramskeenote; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipprogramskeenote (id, sifra, naziv, koprodukcija, maxfaktor, maxvsi) FROM stdin;
002b0000-55e4-ab3e-a724-a757e81d4e28	01	Velika predstava	f	1.00	1.00
002b0000-55e4-ab3e-8a97-0c213c71b262	02	Mala predstava	f	0.50	0.50
002b0000-55e4-ab3e-c50d-181669535495	03	Mala koprodukcija	t	0.40	1.00
002b0000-55e4-ab3e-6c07-1185f5204422	04	Srednja koprodukcija	t	0.70	2.00
002b0000-55e4-ab3e-cd64-494ed7ae1779	05	Velika koprodukcija	t	1.00	3.00
\.


--
-- TOC entry 3202 (class 0 OID 1076869)
-- Dependencies: 189
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 3190 (class 0 OID 1076713)
-- Dependencies: 177
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-55e4-ab3e-fa0e-d816ae882ce4	Konzolni	$2y$05$NS4xMjkyMTcwMzExMjAxROyIq3bzT7vSBb/zRtw5oo6OgIIaNVCXa	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-55e4-ab3e-8dc4-22a73117ccd5	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
00010000-55e4-ab40-8bca-bb2094814295	testni uporabnik za inšpicienta	$2y$05$NS4xMjkyMTcwMzExMjAxROxkJ1B6xAXex6EZLIwJfWzRJ8DpfecFO	t	\N	\N	\N	ivo@ifigenija.si	\N	\N	\N
00010000-55e4-ab40-2c6e-077abe98f0eb	testni uporabnik za Tehničnega vodjo	$2y$05$NS4xMjkyMTcwMzExMjAxROu/kXWR9sP9oamkesKuxXLbxkCb387.G	t	\N	\N	\N	tona@ifigenija.si	\N	\N	\N
00010000-55e4-ab40-3596-bc3c477b15ff	testni uporabnik za igralca	$2y$05$NS4xMjkyMTcwMzExMjAxRO/hLCgClfERRsfCAFYwxNCcFIVjP2982	t	\N	\N	\N	irena@ifigenija.si	\N	\N	\N
00010000-55e4-ab40-431e-275702425402	testni uporabnik vnašalca termina storitev (TerminStoritve-vse)	$2y$05$NS4xMjkyMTcwMzExMjAxROT6.kTHqEq4.wa2SOnf124/N14m9qeP.	t	\N	\N	\N	tatjana@ifigenija.si	\N	\N	\N
00010000-55e4-ab40-37ea-284ee20d269d	testni uporabnik, ki je inšpicient brez zapisov v TerminStoritve	$2y$05$NS4xMjkyMTcwMzExMjAxROHau47Dtb7CME5.nlWwBVM.nusFP.ra2	t	\N	\N	\N	joze@ifigenija.si	\N	\N	\N
00010000-55e4-ab40-ea7a-51c6c031b775	testna uporabnica, ki je planerka	$2y$05$NS4xMjkyMTcwMzExMjAxRO.B/uJO3C7QRNhdX9Q2hTLQsSupj1V1S	t	\N	\N	\N	petra@ifigenija.si	\N	\N	\N
00010000-55e4-ab40-a385-5818f0ba9fad	testni uporabnik, ki dobi ifi-all vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROv2d7jqhaV/Mz3EIsKoi7UoFR.SDSMBm	t	\N	\N	\N	ali@ifigenija.si	\N	\N	\N
00010000-55e4-ab40-c77e-29a18067ebe9	testni uporabnik, ki dobi ifi-readall vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROYB9g.gnkufr1l/gWK6mkx.ySqrOWnJC	t	\N	\N	\N	berta@ifigenija.si	\N	\N	\N
00010000-55e4-ab40-cdc8-94b87f0647f4	testni uporabnik, ki dobi aaa-write dovoljenje	$2y$05$NS4xMjkyMTcwMzExMjAxRORujYObKX.DzpXVYbePkiJkHqg0/Ylya	t	\N	\N	\N	aaron@ifigenija.si	\N	\N	\N
00010000-55e4-ab40-f226-00d1ce6cbdb5	testni uporabnik ki dobi vsa posamezna dovoljenja	$2y$05$NS4xMjkyMTcwMzExMjAxRO2ymwxVXTr7U4Ncdn.bN49E8rLw9Jg0O	t	\N	\N	\N	vesna@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 3233 (class 0 OID 1077199)
-- Dependencies: 220
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, producent_id, sifra, faza, naslov, podnaslov, delovninaslov, internacionalninaslov, naslovizvirnika, podnaslovizvirnika, datumzacstudija, stevilovaj, planiranostevilovaj, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, krstna, prvaslovenska, kratkinaslov, maticnioder_id) FROM stdin;
000e0000-55e4-ab40-3a4a-74b66fa8412f	00160000-55e4-ab40-9ef8-596734c5de1f	\N	00140000-55e4-ab3e-0dad-735e133bf9ec	\N	0001	produkcija	Sen kresne noči		Sanje	\N	\N	\N	2016-02-01	\N	\N	2016-06-01	1	William Shakespeare	f	2				\N	f	\N	\N		00220000-55e4-ab40-eb0b-71210f76a3f7
000e0000-55e4-ab40-5ff0-4a6c45a8b255	00160000-55e4-ab40-a4fb-77754cd157e7	\N	00140000-55e4-ab3e-1671-f746b7e5b0bb	\N	0002	predprodukcija-ideja	Smoletov vrt			\N	\N	\N	2016-01-01	\N	\N	2016-04-20	2	B. Hočevar	f	2				\N	f	\N	\N		00220000-55e4-ab40-4285-1a02f2b3db8b
000e0000-55e4-ab40-0741-9024e238c535	\N	\N	00140000-55e4-ab3e-1671-f746b7e5b0bb	00190000-55e4-ab40-9af9-f733062890c5	0003	postprodukcija	Kisli maček			\N	\N	\N	2016-02-01	\N	\N	2016-04-20	2	Caryl Churchill	t	2				\N	f	\N	\N		00220000-55e4-ab40-eb0b-71210f76a3f7
000e0000-55e4-ab40-fe52-8edf5702b93d	\N	\N	00140000-55e4-ab3e-1671-f746b7e5b0bb	00190000-55e4-ab40-9af9-f733062890c5	0004	postprodukcija	Vladimir			\N	\N	\N	2017-03-01	\N	\N	2017-04-20	2	Matjaž Zupančič	t	2				\N	f	\N	\N		00220000-55e4-ab40-eb0b-71210f76a3f7
000e0000-55e4-ab40-023e-fa838e731cd4	\N	\N	00140000-55e4-ab3e-1671-f746b7e5b0bb	00190000-55e4-ab40-9af9-f733062890c5	0005	postprodukcija	Španska princesa			\N	\N	\N	2017-04-01	\N	\N	2017-05-20	1	Nina Kokelj	f	1				\N	f	\N	\N		00220000-55e4-ab40-118f-d64290a1f14d
000e0000-55e4-ab40-ee9e-5c032474e087	\N	\N	00140000-55e4-ab3e-1671-f746b7e5b0bb	00190000-55e4-ab40-9af9-f733062890c5	0006	postprodukcija	Ne vemo datumov			\N	\N	\N	\N	\N	\N	\N	1	Nandi Frafar	f	1				\N	f	\N	\N		00220000-55e4-ab40-118f-d64290a1f14d
\.


--
-- TOC entry 3208 (class 0 OID 1076942)
-- Dependencies: 195
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, uprizoritev_id, vrsta, zaporedna, porocilo) FROM stdin;
00200000-55e4-ab40-b1da-ef18d8fcee05	000e0000-55e4-ab40-5ff0-4a6c45a8b255	\N	1	
00200000-55e4-ab40-7bca-85b4c7ef7ff6	000e0000-55e4-ab40-5ff0-4a6c45a8b255	\N	2	
\.


--
-- TOC entry 3223 (class 0 OID 1077067)
-- Dependencies: 210
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 3234 (class 0 OID 1077224)
-- Dependencies: 221
-- Data for Name: vrstastroska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstastroska (id, skupina, podskupina, naziv, opis) FROM stdin;
003b0000-55e4-ab3e-b6a9-05d4f93d1e67	1	0	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE
003b0000-55e4-ab3e-8f89-d13cf946fee7	1	1	Storitve varovanja zgradb in prostorov	storitve varovanja zgradb in prostorov (npr. gasilci na predstavah)
003b0000-55e4-ab3e-b821-55b596947a1f	1	2	Založniške in tiskarske storitve	založniške in tiskarske storitve
003b0000-55e4-ab3e-233f-e136da95c10f	1	3	Časopisi, revije, knjige in strokovna literatura	časopisi, revije, knjige in strokovna literatura
003b0000-55e4-ab3e-5654-153897a7d04a	1	4	Stroški prevajalskih storitev	stroški prevajalskih storitev
003b0000-55e4-ab3e-5bf3-ec76433cafa1	1	5	Stroški oglaševalskih storitev	stroški oglaševalskih storitev
003b0000-55e4-ab3e-c112-9a4cb397e236	1	6	Izdatki za reprezentanco	izdatki za reprezentanco
003b0000-55e4-ab3e-032c-ae351c1a92db	2	0	POSEBNI MATERIAL IN STORITVE	POSEBNI MATERIAL IN STORITVE
003b0000-55e4-ab3e-9e61-680d733e034c	2	1	Drugi posebni material in storitve	drugi posebni material in storitve (npr. za instrumete - navedite)
003b0000-55e4-ab3e-ef83-6ec7e2114a69	2	2	Oprema predstave – stroški rekvizitov	Oprema predstave – stroški rekvizitov
003b0000-55e4-ab3e-ac87-919a38dbe657	2	3	Oprema predstave – stroški kostumov	Oprema predstave – stroški kostumov
003b0000-55e4-ab3e-ac5b-c0f6f279e711	2	4	Oprema predstave – stroški scenske opreme	Oprema predstave – stroški scenske opreme
003b0000-55e4-ab3e-6af3-5370b517eb2f	2	5	Oprema predstave – stroški avdio in video opreme	Oprema predstave – stroški avdio in video opreme
003b0000-55e4-ab3e-046a-7e1595d6d9b0	3	0	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE
003b0000-55e4-ab3e-a336-ede30013d7f1	3	1	Poštnina in kurirske storitve	poštnina in kurirske storitve
003b0000-55e4-ab3e-7a26-121cfbe4e110	4	0	PREVOZNI STROŠKI IN STORITVE	PREVOZNI STROŠKI IN STORITVE
003b0000-55e4-ab3e-ebb2-2bad57910f00	4	1	Goriva in maziva za prevozna sredstva	goriva in maziva za prevozna sredstva
003b0000-55e4-ab3e-6de3-355fb2f0f1af	4	2	Najem vozil in selitveni stroški	najem vozil in selitveni stroški
003b0000-55e4-ab3e-1e06-f956e2b38455	4	3	Drugi prevozni in transportni stroški 	drugi prevozni in transportni stroški (navedite)
003b0000-55e4-ab3e-02b4-ca7c5711264b	5	0	IZDATKI ZA SLUŽBENA POTOVANJA	IZDATKI ZA SLUŽBENA POTOVANJA
003b0000-55e4-ab3e-2dcb-8da29af908c2	5	1	Dnevnice za službena potovanja v državi in tujini	dnevnice za službena potovanja v državi in tujini
003b0000-55e4-ab3e-a524-77ad3d310cc1	5	2	Hotelske in restavra. storitve v državi in tujini	hotelske in restavra. storitve v državi in tujini
003b0000-55e4-ab3e-fa95-a3e7e91ad780	5	3	Stroški prevoza v državi in tujini	stroški prevoza v državi in tujini
003b0000-55e4-ab3e-b548-8d45eed100ff	5	4	Drugi izdatki za službena potovanja	drugi izdatki za službena potovanja (navedite)
003b0000-55e4-ab3e-87a3-46949f5201a9	6	0	NAJEMNINE IN ZAKUPNINE	NAJEMNINE IN ZAKUPNINE
003b0000-55e4-ab3e-cb82-d2a9eab317ab	6	1	Druge najemnine, zakupnine in licenčnine	druge najemnine, zakupnine in licenčnine (npr. najem notnega materiala, instrumentov - navedite)
003b0000-55e4-ab3e-9a11-9a08e07cad8b	7	0	DRUGI OPERATIVNI ODHODKI	DRUGI OPERATIVNI ODHODKI
003b0000-55e4-ab3e-0e97-a64f0b0add2d	7	1	Izdatki za strok. izobraževanje zap.	izdatki za strok. izobraževanje zap.(vezani na program. enote)  
\.


--
-- TOC entry 3252 (class 0 OID 1077472)
-- Dependencies: 239
-- Data for Name: vrstazapisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstazapisa (id, oznaka, naziv, aktiven, znacka, ikona, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3253 (class 0 OID 1077484)
-- Dependencies: 240
-- Data for Name: zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapis (id, vrsta_id, datoteka_id, mapa_id, avtor_id, zaklenil_id, tip, zaklenjen, datumzaklepanja, identifier, subject, title, description, coverage, creator, language, date, publisher, relation, rights, source, upor, datknj, standard, lokacija) FROM stdin;
\.


--
-- TOC entry 3254 (class 0 OID 1077512)
-- Dependencies: 241
-- Data for Name: zapislastnik; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapislastnik (id, zapis_id, lastnik, classlastnika, datum, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3235 (class 0 OID 1077233)
-- Dependencies: 222
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, sifra, status, zacetek, konec, tip, delovnaobveza, malica, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci) FROM stdin;
00100000-55e4-ab40-5588-9ba3b3d9f2b2	00090000-55e4-ab40-e663-da322e20b628	01	A	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55e4-ab40-c729-84247e6e49ea	00090000-55e4-ab40-ecc8-1e5ebdeb2800	02	A	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55e4-ab40-1124-26bceb9afe6e	00090000-55e4-ab40-d218-40d0980e93ad	03	A	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55e4-ab40-b3a8-940f6096606d	00090000-55e4-ab40-c970-58eff1098124	04	A	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55e4-ab40-1e1f-5910af92f0b9	00090000-55e4-ab40-fca9-454c53fe792c	05	A	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55e4-ab40-ed5c-5e5b5304a79f	00090000-55e4-ab40-07c8-e0d175507196	06	A	2010-02-01	2010-02-01	1	2		t	f	f	t
\.


--
-- TOC entry 3209 (class 0 OID 1076952)
-- Dependencies: 196
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id) FROM stdin;
\.


--
-- TOC entry 3236 (class 0 OID 1077240)
-- Dependencies: 223
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, sifra, naziv, opis) FROM stdin;
00140000-55e4-ab3e-0dad-735e133bf9ec	01	Drama	drama (SURS 01)
00140000-55e4-ab3e-c7ba-872a5cacd042	02	Opera	opera (SURS 02)
00140000-55e4-ab3e-cffe-d9a96fc36b19	03	Balet	balet (SURS 03)
00140000-55e4-ab3e-510e-f1e7601c1d13	04	Plesne prireditve	plesne prireditve (SURS 04)
00140000-55e4-ab3e-e0e6-ba73eddb7521	05	Lutkovno gledališče	lutkovno gledališče (SURS 05)
00140000-55e4-ab3e-1671-f746b7e5b0bb	06	Raziskovalno gledališče	raziskovalno gledališče (SURS 06)
00140000-55e4-ab3e-8bf3-74e94baffc79	07	Drugo	drugo (SURS 07)
\.


--
-- TOC entry 3237 (class 0 OID 1077250)
-- Dependencies: 224
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, sifra, naziv, opis) FROM stdin;
\.


--
-- TOC entry 2732 (class 2606 OID 1076741)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2858 (class 2606 OID 1077082)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2865 (class 2606 OID 1077102)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2869 (class 2606 OID 1077121)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2949 (class 2606 OID 1077442)
-- Name: datoteka_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT datoteka_pkey PRIMARY KEY (id);


--
-- TOC entry 2776 (class 2606 OID 1076898)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2788 (class 2606 OID 1076913)
-- Name: dogodeksplosni_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodeksplosni
    ADD CONSTRAINT dogodeksplosni_pkey PRIMARY KEY (id);


--
-- TOC entry 2914 (class 2606 OID 1077265)
-- Name: drugivir_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT drugivir_pkey PRIMARY KEY (id);


--
-- TOC entry 2734 (class 2606 OID 1076754)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2917 (class 2606 OID 1077316)
-- Name: enotaprograma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT enotaprograma_pkey PRIMARY KEY (id);


--
-- TOC entry 2871 (class 2606 OID 1077133)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2790 (class 2606 OID 1076923)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2742 (class 2606 OID 1076768)
-- Name: kontaktnaoseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT kontaktnaoseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2810 (class 2606 OID 1076974)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2954 (class 2606 OID 1077453)
-- Name: mapa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT mapa_pkey PRIMARY KEY (id);


--
-- TOC entry 2958 (class 2606 OID 1077460)
-- Name: mapa_zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT mapa_zapis_pkey PRIMARY KEY (mapa_id, zapis_id);


--
-- TOC entry 2962 (class 2606 OID 1077469)
-- Name: mapaacl_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT mapaacl_pkey PRIMARY KEY (id);


--
-- TOC entry 2813 (class 2606 OID 1076982)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2744 (class 2606 OID 1076781)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2749 (class 2606 OID 1076791)
-- Name: optionvalue_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT optionvalue_pkey PRIMARY KEY (id);


--
-- TOC entry 2752 (class 2606 OID 1076815)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2724 (class 2606 OID 1076710)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2715 (class 2606 OID 1076684)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2816 (class 2606 OID 1076988)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2818 (class 2606 OID 1076997)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2879 (class 2606 OID 1077148)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2757 (class 2606 OID 1076835)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2760 (class 2606 OID 1076844)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2821 (class 2606 OID 1077002)
-- Name: postavkaracuna_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT postavkaracuna_pkey PRIMARY KEY (id);


--
-- TOC entry 2766 (class 2606 OID 1076857)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2795 (class 2606 OID 1076929)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2825 (class 2606 OID 1077008)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2926 (class 2606 OID 1077329)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2928 (class 2606 OID 1077337)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2933 (class 2606 OID 1077382)
-- Name: programdela_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT programdela_pkey PRIMARY KEY (id);


--
-- TOC entry 2936 (class 2606 OID 1077392)
-- Name: programskaenotasklopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT programskaenotasklopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2829 (class 2606 OID 1077019)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2837 (class 2606 OID 1077028)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2843 (class 2606 OID 1077038)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2882 (class 2606 OID 1077163)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2886 (class 2606 OID 1077171)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2717 (class 2606 OID 1076695)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2846 (class 2606 OID 1077047)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2730 (class 2606 OID 1076730)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2719 (class 2606 OID 1076704)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2851 (class 2606 OID 1077057)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2853 (class 2606 OID 1077066)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2797 (class 2606 OID 1076940)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2940 (class 2606 OID 1077414)
-- Name: stevilcenje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenje
    ADD CONSTRAINT stevilcenje_pkey PRIMARY KEY (id);


--
-- TOC entry 2944 (class 2606 OID 1077421)
-- Name: stevilcenjekonfig_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT stevilcenjekonfig_pkey PRIMARY KEY (id);


--
-- TOC entry 2947 (class 2606 OID 1077428)
-- Name: stevilcenjestanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjestanje
    ADD CONSTRAINT stevilcenjestanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2891 (class 2606 OID 1077184)
-- Name: strosekuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT strosekuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2770 (class 2606 OID 1076866)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2808 (class 2606 OID 1076966)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2893 (class 2606 OID 1077198)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2938 (class 2606 OID 1077404)
-- Name: tipprogramskeenote_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipprogramskeenote
    ADD CONSTRAINT tipprogramskeenote_pkey PRIMARY KEY (id);


--
-- TOC entry 2774 (class 2606 OID 1076880)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2726 (class 2606 OID 1076725)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2901 (class 2606 OID 1077217)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2801 (class 2606 OID 1076950)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2856 (class 2606 OID 1077073)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2903 (class 2606 OID 1077232)
-- Name: vrstastroska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstastroska
    ADD CONSTRAINT vrstastroska_pkey PRIMARY KEY (id);


--
-- TOC entry 2965 (class 2606 OID 1077482)
-- Name: vrstazapisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstazapisa
    ADD CONSTRAINT vrstazapisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2972 (class 2606 OID 1077506)
-- Name: zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT zapis_pkey PRIMARY KEY (id);


--
-- TOC entry 2975 (class 2606 OID 1077518)
-- Name: zapislastnik_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT zapislastnik_pkey PRIMARY KEY (id);


--
-- TOC entry 2906 (class 2606 OID 1077238)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2803 (class 2606 OID 1076956)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2909 (class 2606 OID 1077248)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2912 (class 2606 OID 1077258)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2777 (class 1259 OID 1076907)
-- Name: dogodki_konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_konec ON dogodek USING btree (konec);


--
-- TOC entry 2778 (class 1259 OID 1076908)
-- Name: dogodki_razred; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_razred ON dogodek USING btree (razred);


--
-- TOC entry 2779 (class 1259 OID 1076906)
-- Name: dogodki_zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2780 (class 1259 OID 1076905)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2887 (class 1259 OID 1077185)
-- Name: idx_11ffe6e05c75296c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e05c75296c ON strosekuprizoritve USING btree (vrstastroska_id);


--
-- TOC entry 2888 (class 1259 OID 1077186)
-- Name: idx_11ffe6e062b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e062b4ffca ON strosekuprizoritve USING btree (uprizoritev_id);


--
-- TOC entry 2889 (class 1259 OID 1077187)
-- Name: idx_11ffe6e06beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e06beede51 ON strosekuprizoritve USING btree (popa_id);


--
-- TOC entry 2951 (class 1259 OID 1077455)
-- Name: idx_14a5d6d3727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d3727aca70 ON mapa USING btree (parent_id);


--
-- TOC entry 2952 (class 1259 OID 1077454)
-- Name: idx_14a5d6d38a4a6c12; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d38a4a6c12 ON mapa USING btree (lastnik_id);


--
-- TOC entry 2755 (class 1259 OID 1076837)
-- Name: idx_1c7adba5ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba5ee4b985a ON popa USING btree (drzava_id);


--
-- TOC entry 2814 (class 1259 OID 1076989)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2966 (class 1259 OID 1077510)
-- Name: idx_1ed92829253c4123; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829253c4123 ON zapis USING btree (avtor_id);


--
-- TOC entry 2967 (class 1259 OID 1077509)
-- Name: idx_1ed9282957ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282957ed422f ON zapis USING btree (mapa_id);


--
-- TOC entry 2968 (class 1259 OID 1077511)
-- Name: idx_1ed9282987ff3295; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282987ff3295 ON zapis USING btree (zaklenil_id);


--
-- TOC entry 2969 (class 1259 OID 1077508)
-- Name: idx_1ed92829a54dbb1f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829a54dbb1f ON zapis USING btree (datoteka_id);


--
-- TOC entry 2970 (class 1259 OID 1077507)
-- Name: idx_1ed92829ef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829ef943358 ON zapis USING btree (vrsta_id);


--
-- TOC entry 2822 (class 1259 OID 1077010)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2823 (class 1259 OID 1077009)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2799 (class 1259 OID 1076951)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2872 (class 1259 OID 1077134)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2873 (class 1259 OID 1077136)
-- Name: idx_23aeb9586b361365; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9586b361365 ON funkcija USING btree (tipfunkcije_id);


--
-- TOC entry 2874 (class 1259 OID 1077135)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2739 (class 1259 OID 1076770)
-- Name: idx_2942b10710389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b10710389148 ON kontaktnaoseba USING btree (oseba_id);


--
-- TOC entry 2740 (class 1259 OID 1076769)
-- Name: idx_2942b1076beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b1076beede51 ON kontaktnaoseba USING btree (popa_id);


--
-- TOC entry 2934 (class 1259 OID 1077393)
-- Name: idx_2d901816d6bc69d6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2d901816d6bc69d6 ON programskaenotasklopa USING btree (programrazno_id);


--
-- TOC entry 2875 (class 1259 OID 1077150)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2876 (class 1259 OID 1077151)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2877 (class 1259 OID 1077152)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2973 (class 1259 OID 1077519)
-- Name: idx_2eaff9dcaf91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2eaff9dcaf91ecd ON zapislastnik USING btree (zapis_id);


--
-- TOC entry 2894 (class 1259 OID 1077222)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2895 (class 1259 OID 1077219)
-- Name: idx_344a77a7c3b0d59; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a7c3b0d59 ON uprizoritev USING btree (maticnioder_id);


--
-- TOC entry 2896 (class 1259 OID 1077223)
-- Name: idx_344a77a853a965c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a853a965c ON uprizoritev USING btree (producent_id);


--
-- TOC entry 2897 (class 1259 OID 1077221)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2898 (class 1259 OID 1077220)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2771 (class 1259 OID 1076882)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2772 (class 1259 OID 1076881)
-- Name: idx_37f6541a6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a6beede51 ON trr USING btree (popa_id);


--
-- TOC entry 2750 (class 1259 OID 1076818)
-- Name: idx_466966d769e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_466966d769e8d4 ON oseba USING btree (naslov_id);


--
-- TOC entry 2844 (class 1259 OID 1077048)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2721 (class 1259 OID 1076711)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2722 (class 1259 OID 1076712)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2847 (class 1259 OID 1077060)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2848 (class 1259 OID 1077059)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2849 (class 1259 OID 1077058)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2792 (class 1259 OID 1076930)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2793 (class 1259 OID 1076931)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2942 (class 1259 OID 1077423)
-- Name: idx_6054e804ff55f926; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_6054e804ff55f926 ON stevilcenjekonfig USING btree (stevilcenje_id);


--
-- TOC entry 2838 (class 1259 OID 1077042)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2839 (class 1259 OID 1077040)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2840 (class 1259 OID 1077039)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2841 (class 1259 OID 1077041)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2727 (class 1259 OID 1076731)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2728 (class 1259 OID 1076732)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2854 (class 1259 OID 1077074)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2950 (class 1259 OID 1077443)
-- Name: idx_781826c67e3c61f9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_781826c67e3c61f9 ON datoteka USING btree (owner_id);


--
-- TOC entry 2959 (class 1259 OID 1077470)
-- Name: idx_7adc957157ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc957157ed422f ON mapaacl USING btree (mapa_id);


--
-- TOC entry 2960 (class 1259 OID 1077471)
-- Name: idx_7adc9571fa6311ef; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc9571fa6311ef ON mapaacl USING btree (perm_id);


--
-- TOC entry 2819 (class 1259 OID 1077003)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2883 (class 1259 OID 1077172)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2884 (class 1259 OID 1077173)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2918 (class 1259 OID 1077321)
-- Name: idx_8787a0e54ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e54ae1cd1c ON enotaprograma USING btree (gostitelj_id);


--
-- TOC entry 2919 (class 1259 OID 1077320)
-- Name: idx_8787a0e55d0da56c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e55d0da56c ON enotaprograma USING btree (drzavagostovanja_id);


--
-- TOC entry 2920 (class 1259 OID 1077317)
-- Name: idx_8787a0e562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e562b4ffca ON enotaprograma USING btree (uprizoritev_id);


--
-- TOC entry 2921 (class 1259 OID 1077318)
-- Name: idx_8787a0e57222d84b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e57222d84b ON enotaprograma USING btree (tipprogramskeenote_id);


--
-- TOC entry 2922 (class 1259 OID 1077319)
-- Name: idx_8787a0e5771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e5771ec7bd ON enotaprograma USING btree (program_dela_id);


--
-- TOC entry 2762 (class 1259 OID 1076859)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2763 (class 1259 OID 1076858)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2764 (class 1259 OID 1076860)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2826 (class 1259 OID 1077023)
-- Name: idx_952dd21969e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd21969e8d4 ON prostor USING btree (naslov_id);


--
-- TOC entry 2827 (class 1259 OID 1077022)
-- Name: idx_952dd2196beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd2196beede51 ON prostor USING btree (popa_id);


--
-- TOC entry 2923 (class 1259 OID 1077330)
-- Name: idx_97af082e38c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e38c06eb ON produkcijadelitev USING btree (enotaprograma_id);


--
-- TOC entry 2924 (class 1259 OID 1077331)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2859 (class 1259 OID 1077086)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2860 (class 1259 OID 1077087)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2861 (class 1259 OID 1077084)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2862 (class 1259 OID 1077085)
-- Name: idx_a4b7244fa4976613; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fa4976613 ON alternacija USING btree (zaposlitev_id);


--
-- TOC entry 2904 (class 1259 OID 1077239)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2832 (class 1259 OID 1077032)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2833 (class 1259 OID 1077031)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2834 (class 1259 OID 1077029)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2835 (class 1259 OID 1077030)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2866 (class 1259 OID 1077104)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2867 (class 1259 OID 1077103)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2931 (class 1259 OID 1077383)
-- Name: idx_c81bc37f3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c81bc37f3a0e32e3 ON programdela USING btree (sezona_id);


--
-- TOC entry 2791 (class 1259 OID 1076924)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2915 (class 1259 OID 1077266)
-- Name: idx_e7d4cf2638c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e7d4cf2638c06eb ON drugivir USING btree (enotaprograma_id);


--
-- TOC entry 2955 (class 1259 OID 1077461)
-- Name: idx_e9f8ee8257ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee8257ed422f ON mapa_zapis USING btree (mapa_id);


--
-- TOC entry 2956 (class 1259 OID 1077462)
-- Name: idx_e9f8ee82af91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee82af91ecd ON mapa_zapis USING btree (zapis_id);


--
-- TOC entry 2746 (class 1259 OID 1076793)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2747 (class 1259 OID 1076792)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2767 (class 1259 OID 1076867)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2768 (class 1259 OID 1076868)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2804 (class 1259 OID 1076969)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2805 (class 1259 OID 1076968)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2806 (class 1259 OID 1076967)
-- Name: idx_fef7d84ba81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84ba81ccef6 ON terminstoritve USING btree (dogodek_id);


--
-- TOC entry 2781 (class 1259 OID 1076900)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2782 (class 1259 OID 1076901)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2783 (class 1259 OID 1076899)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2784 (class 1259 OID 1076903)
-- Name: uniq_11e93b5dbbc7a989; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dbbc7a989 ON dogodek USING btree (dogodek_splosni_id);


--
-- TOC entry 2785 (class 1259 OID 1076904)
-- Name: uniq_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2786 (class 1259 OID 1076902)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2758 (class 1259 OID 1076836)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2735 (class 1259 OID 1076755)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2736 (class 1259 OID 1076757)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2737 (class 1259 OID 1076756)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2738 (class 1259 OID 1076758)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2811 (class 1259 OID 1076975)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2880 (class 1259 OID 1077149)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2899 (class 1259 OID 1077218)
-- Name: uniq_344a77a559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_344a77a559828a3 ON uprizoritev USING btree (sifra);


--
-- TOC entry 2753 (class 1259 OID 1076816)
-- Name: uniq_466966d7559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7559828a3 ON oseba USING btree (sifra);


--
-- TOC entry 2754 (class 1259 OID 1076817)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2910 (class 1259 OID 1077259)
-- Name: uniq_5216fcb0559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5216fcb0559828a3 ON zvrstuprizoritve USING btree (sifra);


--
-- TOC entry 2941 (class 1259 OID 1077415)
-- Name: uniq_5a434fbc559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5a434fbc559828a3 ON stevilcenje USING btree (sifra);


--
-- TOC entry 2745 (class 1259 OID 1076782)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2945 (class 1259 OID 1077422)
-- Name: uniq_6054e804889a7556; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_6054e804889a7556 ON stevilcenjekonfig USING btree (dok);


--
-- TOC entry 2830 (class 1259 OID 1077021)
-- Name: uniq_952dd21937854736; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21937854736 ON prostor USING btree (naziv);


--
-- TOC entry 2831 (class 1259 OID 1077020)
-- Name: uniq_952dd219559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd219559828a3 ON prostor USING btree (sifra);


--
-- TOC entry 2863 (class 1259 OID 1077083)
-- Name: uniq_a4b7244f559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a4b7244f559828a3 ON alternacija USING btree (sifra);


--
-- TOC entry 2761 (class 1259 OID 1076845)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2907 (class 1259 OID 1077249)
-- Name: uniq_cede8e36559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_cede8e36559828a3 ON zvrstsurs USING btree (sifra);


--
-- TOC entry 2963 (class 1259 OID 1077483)
-- Name: uniq_de1c8aa1d55226c7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_de1c8aa1d55226c7 ON vrstazapisa USING btree (oznaka);


--
-- TOC entry 2929 (class 1259 OID 1077338)
-- Name: uniq_e6fc2028559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc2028559828a3 ON produkcijskahisa USING btree (sifra);


--
-- TOC entry 2930 (class 1259 OID 1077339)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2798 (class 1259 OID 1076941)
-- Name: uniq_ecc8f8c5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ecc8f8c5559828a3 ON sezona USING btree (sifra);


--
-- TOC entry 2720 (class 1259 OID 1076705)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2995 (class 2606 OID 1077615)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2996 (class 2606 OID 1077620)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 3000 (class 2606 OID 1077640)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2994 (class 2606 OID 1077610)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2998 (class 2606 OID 1077630)
-- Name: fk_11e93b5dbbc7a989; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dbbc7a989 FOREIGN KEY (dogodek_splosni_id) REFERENCES dogodeksplosni(id);


--
-- TOC entry 2999 (class 2606 OID 1077635)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2997 (class 2606 OID 1077625)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 3042 (class 2606 OID 1077850)
-- Name: fk_11ffe6e05c75296c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e05c75296c FOREIGN KEY (vrstastroska_id) REFERENCES vrstastroska(id);


--
-- TOC entry 3043 (class 2606 OID 1077855)
-- Name: fk_11ffe6e062b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e062b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 3044 (class 2606 OID 1077860)
-- Name: fk_11ffe6e06beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e06beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 3065 (class 2606 OID 1077965)
-- Name: fk_14a5d6d3727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d3727aca70 FOREIGN KEY (parent_id) REFERENCES mapa(id);


--
-- TOC entry 3064 (class 2606 OID 1077960)
-- Name: fk_14a5d6d38a4a6c12; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d38a4a6c12 FOREIGN KEY (lastnik_id) REFERENCES uporabniki(id);


--
-- TOC entry 2986 (class 2606 OID 1077570)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 3009 (class 2606 OID 1077685)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 3073 (class 2606 OID 1078005)
-- Name: fk_1ed92829253c4123; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829253c4123 FOREIGN KEY (avtor_id) REFERENCES uporabniki(id);


--
-- TOC entry 3072 (class 2606 OID 1078000)
-- Name: fk_1ed9282957ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282957ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 3074 (class 2606 OID 1078010)
-- Name: fk_1ed9282987ff3295; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282987ff3295 FOREIGN KEY (zaklenil_id) REFERENCES uporabniki(id);


--
-- TOC entry 3071 (class 2606 OID 1077995)
-- Name: fk_1ed92829a54dbb1f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829a54dbb1f FOREIGN KEY (datoteka_id) REFERENCES datoteka(id);


--
-- TOC entry 3070 (class 2606 OID 1077990)
-- Name: fk_1ed92829ef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829ef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstazapisa(id);


--
-- TOC entry 3012 (class 2606 OID 1077700)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 3011 (class 2606 OID 1077695)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 3004 (class 2606 OID 1077660)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 3034 (class 2606 OID 1077810)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 3036 (class 2606 OID 1077820)
-- Name: fk_23aeb9586b361365; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9586b361365 FOREIGN KEY (tipfunkcije_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 3035 (class 2606 OID 1077815)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2981 (class 2606 OID 1077545)
-- Name: fk_2942b10710389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b10710389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2980 (class 2606 OID 1077540)
-- Name: fk_2942b1076beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b1076beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 3008 (class 2606 OID 1077680)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 3061 (class 2606 OID 1077945)
-- Name: fk_2d901816d6bc69d6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT fk_2d901816d6bc69d6 FOREIGN KEY (programrazno_id) REFERENCES enotaprograma(id);


--
-- TOC entry 3037 (class 2606 OID 1077825)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 3038 (class 2606 OID 1077830)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 3039 (class 2606 OID 1077835)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 3075 (class 2606 OID 1078015)
-- Name: fk_2eaff9dcaf91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT fk_2eaff9dcaf91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id);


--
-- TOC entry 3048 (class 2606 OID 1077880)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 3045 (class 2606 OID 1077865)
-- Name: fk_344a77a7c3b0d59; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a7c3b0d59 FOREIGN KEY (maticnioder_id) REFERENCES prostor(id);


--
-- TOC entry 3049 (class 2606 OID 1077885)
-- Name: fk_344a77a853a965c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a853a965c FOREIGN KEY (producent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 3047 (class 2606 OID 1077875)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 3046 (class 2606 OID 1077870)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2993 (class 2606 OID 1077605)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2992 (class 2606 OID 1077600)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2985 (class 2606 OID 1077565)
-- Name: fk_466966d769e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d769e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2984 (class 2606 OID 1077560)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 3023 (class 2606 OID 1077755)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2976 (class 2606 OID 1077520)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2977 (class 2606 OID 1077525)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 3026 (class 2606 OID 1077770)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 3025 (class 2606 OID 1077765)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 3024 (class 2606 OID 1077760)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 3002 (class 2606 OID 1077650)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 3003 (class 2606 OID 1077655)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 3062 (class 2606 OID 1077950)
-- Name: fk_6054e804ff55f926; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT fk_6054e804ff55f926 FOREIGN KEY (stevilcenje_id) REFERENCES stevilcenje(id);


--
-- TOC entry 3022 (class 2606 OID 1077750)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 3020 (class 2606 OID 1077740)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 3019 (class 2606 OID 1077735)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 3021 (class 2606 OID 1077745)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2978 (class 2606 OID 1077530)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2979 (class 2606 OID 1077535)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 3027 (class 2606 OID 1077775)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 3063 (class 2606 OID 1077955)
-- Name: fk_781826c67e3c61f9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT fk_781826c67e3c61f9 FOREIGN KEY (owner_id) REFERENCES uporabniki(id);


--
-- TOC entry 3068 (class 2606 OID 1077980)
-- Name: fk_7adc957157ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc957157ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 3069 (class 2606 OID 1077985)
-- Name: fk_7adc9571fa6311ef; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc9571fa6311ef FOREIGN KEY (perm_id) REFERENCES permission(id);


--
-- TOC entry 3010 (class 2606 OID 1077690)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 3040 (class 2606 OID 1077840)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 3041 (class 2606 OID 1077845)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 3056 (class 2606 OID 1077920)
-- Name: fk_8787a0e54ae1cd1c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e54ae1cd1c FOREIGN KEY (gostitelj_id) REFERENCES popa(id);


--
-- TOC entry 3055 (class 2606 OID 1077915)
-- Name: fk_8787a0e55d0da56c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e55d0da56c FOREIGN KEY (drzavagostovanja_id) REFERENCES drza(id);


--
-- TOC entry 3052 (class 2606 OID 1077900)
-- Name: fk_8787a0e562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 3053 (class 2606 OID 1077905)
-- Name: fk_8787a0e57222d84b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e57222d84b FOREIGN KEY (tipprogramskeenote_id) REFERENCES tipprogramskeenote(id);


--
-- TOC entry 3054 (class 2606 OID 1077910)
-- Name: fk_8787a0e5771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e5771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2988 (class 2606 OID 1077580)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2987 (class 2606 OID 1077575)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2989 (class 2606 OID 1077585)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 3014 (class 2606 OID 1077710)
-- Name: fk_952dd21969e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd21969e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 3013 (class 2606 OID 1077705)
-- Name: fk_952dd2196beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd2196beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 3057 (class 2606 OID 1077925)
-- Name: fk_97af082e38c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e38c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 3058 (class 2606 OID 1077930)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 3030 (class 2606 OID 1077790)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 3031 (class 2606 OID 1077795)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 3028 (class 2606 OID 1077780)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 3029 (class 2606 OID 1077785)
-- Name: fk_a4b7244fa4976613; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fa4976613 FOREIGN KEY (zaposlitev_id) REFERENCES zaposlitev(id);


--
-- TOC entry 3050 (class 2606 OID 1077890)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 3018 (class 2606 OID 1077730)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 3017 (class 2606 OID 1077725)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 3015 (class 2606 OID 1077715)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 3016 (class 2606 OID 1077720)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 3033 (class 2606 OID 1077805)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 3032 (class 2606 OID 1077800)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 3060 (class 2606 OID 1077940)
-- Name: fk_c81bc37f3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT fk_c81bc37f3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 3001 (class 2606 OID 1077645)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 3059 (class 2606 OID 1077935)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 3051 (class 2606 OID 1077895)
-- Name: fk_e7d4cf2638c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT fk_e7d4cf2638c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 3066 (class 2606 OID 1077970)
-- Name: fk_e9f8ee8257ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee8257ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id) ON DELETE CASCADE;


--
-- TOC entry 3067 (class 2606 OID 1077975)
-- Name: fk_e9f8ee82af91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee82af91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id) ON DELETE CASCADE;


--
-- TOC entry 2983 (class 2606 OID 1077555)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2982 (class 2606 OID 1077550)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2990 (class 2606 OID 1077590)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2991 (class 2606 OID 1077595)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 3007 (class 2606 OID 1077675)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 3006 (class 2606 OID 1077670)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 3005 (class 2606 OID 1077665)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- Completed on 2015-08-31 21:33:05 CEST

--
-- PostgreSQL database dump complete
--

