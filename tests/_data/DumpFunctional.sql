--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.9
-- Dumped by pg_dump version 9.3.9
-- Started on 2015-09-03 11:39:26 CEST

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- TOC entry 241 (class 3079 OID 11789)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 2982 (class 0 OID 0)
-- Dependencies: 241
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_with_oids = false;

--
-- TOC entry 178 (class 1259 OID 17158721)
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
-- TOC entry 223 (class 1259 OID 17159235)
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
-- TOC entry 222 (class 1259 OID 17159218)
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
-- TOC entry 216 (class 1259 OID 17159128)
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
-- TOC entry 239 (class 1259 OID 17159484)
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
-- TOC entry 192 (class 1259 OID 17158899)
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
-- TOC entry 194 (class 1259 OID 17158930)
-- Name: dogodeksplosni; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodeksplosni (
    id uuid NOT NULL
);


--
-- TOC entry 230 (class 1259 OID 17159386)
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
-- TOC entry 187 (class 1259 OID 17158842)
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
-- TOC entry 224 (class 1259 OID 17159248)
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
-- TOC entry 210 (class 1259 OID 17159063)
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
-- TOC entry 190 (class 1259 OID 17158878)
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
-- TOC entry 188 (class 1259 OID 17158859)
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
-- TOC entry 199 (class 1259 OID 17158977)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 237 (class 1259 OID 17159465)
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
-- TOC entry 238 (class 1259 OID 17159477)
-- Name: mapa_zapis; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE mapa_zapis (
    mapa_id uuid NOT NULL,
    zapis_id uuid NOT NULL
);


--
-- TOC entry 240 (class 1259 OID 17159499)
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
-- TOC entry 170 (class 1259 OID 16867877)
-- Name: migrations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE migrations (
    version character varying(255) NOT NULL
);


--
-- TOC entry 203 (class 1259 OID 17159002)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 185 (class 1259 OID 17158816)
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
-- TOC entry 179 (class 1259 OID 17158730)
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
-- TOC entry 180 (class 1259 OID 17158741)
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
-- TOC entry 175 (class 1259 OID 17158695)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 177 (class 1259 OID 17158714)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 204 (class 1259 OID 17159009)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 208 (class 1259 OID 17159043)
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
-- TOC entry 219 (class 1259 OID 17159167)
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
-- TOC entry 182 (class 1259 OID 17158774)
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
-- TOC entry 184 (class 1259 OID 17158808)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 200 (class 1259 OID 17158983)
-- Name: postavkaracuna; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE postavkaracuna (
    id uuid NOT NULL,
    racun_id uuid
);


--
-- TOC entry 183 (class 1259 OID 17158793)
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
-- TOC entry 189 (class 1259 OID 17158871)
-- Name: predstava; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE predstava (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    gostovanje_id uuid
);


--
-- TOC entry 202 (class 1259 OID 17158995)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 226 (class 1259 OID 17159347)
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
-- TOC entry 227 (class 1259 OID 17159357)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    sifra character varying(4) NOT NULL,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 225 (class 1259 OID 17159303)
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
-- TOC entry 228 (class 1259 OID 17159365)
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
-- TOC entry 206 (class 1259 OID 17159024)
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
-- TOC entry 198 (class 1259 OID 17158968)
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
-- TOC entry 197 (class 1259 OID 17158958)
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
-- TOC entry 218 (class 1259 OID 17159156)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying,
    status character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 213 (class 1259 OID 17159095)
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
-- TOC entry 172 (class 1259 OID 17158666)
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
-- TOC entry 171 (class 1259 OID 17158664)
-- Name: revizije_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE revizije_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2983 (class 0 OID 0)
-- Dependencies: 171
-- Name: revizije_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE revizije_id_seq OWNED BY revizije.id;


--
-- TOC entry 207 (class 1259 OID 17159037)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 176 (class 1259 OID 17158704)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 174 (class 1259 OID 17158688)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 209 (class 1259 OID 17159051)
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
-- TOC entry 201 (class 1259 OID 17158989)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 195 (class 1259 OID 17158935)
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
-- TOC entry 233 (class 1259 OID 17159406)
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
-- TOC entry 232 (class 1259 OID 17159398)
-- Name: stevilcenjekonfig; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjekonfig (
    id uuid NOT NULL,
    stevilcenje_id uuid,
    dok character varying(100) DEFAULT NULL::character varying
);


--
-- TOC entry 231 (class 1259 OID 17159393)
-- Name: stevilcenjestanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjestanje (
    id uuid NOT NULL,
    objid uuid NOT NULL,
    leto integer NOT NULL,
    stevilka integer
);


--
-- TOC entry 214 (class 1259 OID 17159105)
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
-- TOC entry 181 (class 1259 OID 17158766)
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
-- TOC entry 196 (class 1259 OID 17158945)
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
-- TOC entry 217 (class 1259 OID 17159145)
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
-- TOC entry 229 (class 1259 OID 17159375)
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
-- TOC entry 186 (class 1259 OID 17158828)
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
-- TOC entry 173 (class 1259 OID 17158675)
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
-- TOC entry 221 (class 1259 OID 17159193)
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
-- TOC entry 191 (class 1259 OID 17158889)
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
-- TOC entry 205 (class 1259 OID 17159016)
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
-- TOC entry 215 (class 1259 OID 17159119)
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
-- TOC entry 235 (class 1259 OID 17159445)
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
-- TOC entry 234 (class 1259 OID 17159417)
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
-- TOC entry 236 (class 1259 OID 17159457)
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
-- TOC entry 212 (class 1259 OID 17159088)
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
-- TOC entry 193 (class 1259 OID 17158925)
-- Name: zasedenost; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zasedenost (
    id uuid NOT NULL
);


--
-- TOC entry 220 (class 1259 OID 17159183)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 211 (class 1259 OID 17159078)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 2175 (class 2604 OID 17158669)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 2913 (class 0 OID 17158721)
-- Dependencies: 178
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
\.


--
-- TOC entry 2958 (class 0 OID 17159235)
-- Dependencies: 223
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, zaposlitev_id, oseba_id, pogodba_id, sifra, zaposlen, zacetek, konec, opomba, sort, privzeti, aktivna, imapogodbo, pomembna) FROM stdin;
000c0000-55e8-154c-94b4-44d9532d417a	000d0000-55e8-154c-8a6d-6942c330d703	\N	00090000-55e8-154c-df65-a991201c28a2	000b0000-55e8-154c-dd71-99e967d59954	0001	f	\N	\N	\N	3	\N	\N	t	t
000c0000-55e8-154c-a2d7-821a59c37693	000d0000-55e8-154c-46bf-e298acefb244	00100000-55e8-154c-598f-b7e55b8c723f	00090000-55e8-154c-f4a9-299cbc45680d	\N	0002	t	2016-01-01	\N	\N	8	\N	\N	f	f
000c0000-55e8-154c-c8db-9f93f9c0e3e8	000d0000-55e8-154c-af54-09bd36d24a64	00100000-55e8-154c-d1f8-0a10ff75b804	00090000-55e8-154c-62b5-06db238b5e4c	\N	0003	t	\N	2015-09-03	\N	2	\N	\N	f	f
000c0000-55e8-154c-96c4-7cc3d7caadc3	000d0000-55e8-154c-13fc-dfd47f679195	\N	00090000-55e8-154c-3216-5a430ee18164	\N	0004	f	2016-01-01	2016-01-01	\N	26	\N	\N	f	f
000c0000-55e8-154c-ebe8-25e5c16f3360	000d0000-55e8-154c-af64-6b8998c7aab6	\N	00090000-55e8-154c-add4-98677e89ad0b	\N	0005	f	2016-01-01	2016-01-01	\N	7	\N	\N	f	f
000c0000-55e8-154c-4624-d2fbf612d303	000d0000-55e8-154c-9284-6d042e9b3975	\N	00090000-55e8-154c-8ffd-2e33be6e85b4	000b0000-55e8-154c-0baa-5f859a0afb5d	0006	f	2016-01-01	2016-01-01	\N	1	\N	\N	t	t
000c0000-55e8-154c-4273-1713f52d1a2b	000d0000-55e8-154c-dc24-f24d3ecdb433	00100000-55e8-154c-36ef-c0fbeaa7ecac	00090000-55e8-154c-a214-c350f90e739c	\N	0007	t	2016-01-01	2016-01-01	\N	14	\N	\N	f	t
000c0000-55e8-154c-f936-7527b442caea	000d0000-55e8-154c-bf7d-62041fe88a24	\N	00090000-55e8-154c-bd63-6d7bdd81be68	000b0000-55e8-154c-d3ad-d74eac4173a1	0008	f	2016-01-01	2016-01-01	\N	12	\N	\N	t	t
000c0000-55e8-154c-e3ba-c551ab27010c	000d0000-55e8-154c-dc24-f24d3ecdb433	00100000-55e8-154c-edc8-7873a22f6505	00090000-55e8-154c-162a-281a4242c709	\N	0009	t	2017-01-01	2017-01-01	\N	15	\N	\N	f	t
000c0000-55e8-154c-b1b9-d4cd2bb779e1	000d0000-55e8-154c-dc24-f24d3ecdb433	00100000-55e8-154c-a369-30cf2c8f1c36	00090000-55e8-154c-896b-15dd0a6d30f4	\N	0010	t	\N	2015-09-03	\N	16	\N	\N	f	t
000c0000-55e8-154c-8938-438b14a12197	000d0000-55e8-154c-dc24-f24d3ecdb433	00100000-55e8-154c-04e9-922a8171e365	00090000-55e8-154c-550c-a7c5a9e06f96	\N	0011	t	2017-01-01	\N	\N	17	\N	\N	f	t
\.


--
-- TOC entry 2957 (class 0 OID 17159218)
-- Dependencies: 222
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 2951 (class 0 OID 17159128)
-- Dependencies: 216
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, stevilka, naslov, avtor, podnaslov, jezik, naslovizvirnika, internacionalninaslov, datumprejema, moskevloge, zenskevloge, prevajalec, povzetekvsebine, letoizida, krajizida, zaloznik) FROM stdin;
00160000-55e8-154b-9ed6-0b69f6e39112	0001	Sen kresne noči	William Shakespeare		slovenščina	A Midsummer Night's Dream	\N	2015-04-26	5	5	Milan Jesih	Nastopajo Titanija, Hipolita, Oberon, ...	\N	\N	\N
00160000-55e8-154b-3786-13ae801f9038	0002	Bratje Karamazovi	Fjodor Mihajlovič Dostojevski		slovenščina	Bratja Karamazjovji	\N	2015-12-04	4	1	Vladimir Levstik	Svetovna uspešnica	\N	\N	\N
00160000-55e8-154b-5005-b25007799285	0003	Smoletov Vrt	Berta Hočevar		slovenščina		\N	2015-05-26	2	8			\N	\N	\N
\.


--
-- TOC entry 2974 (class 0 OID 17159484)
-- Dependencies: 239
-- Data for Name: datoteka; Type: TABLE DATA; Schema: public; Owner: -
--

COPY datoteka (id, owner_id, filename, transfers, size, format, hash, createdat, uploadedat, upor, datknj) FROM stdin;
\.


--
-- TOC entry 2927 (class 0 OID 17158899)
-- Dependencies: 192
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_splosni_id, prostor_id, sezona_id, planiranzacetek, allday, zacetek, konec, status, razred, termin, title) FROM stdin;
00180000-55e8-154c-14ed-9ee58573ce97	\N	\N	00200000-55e8-154c-d960-072037d502c3	\N	\N	\N	\N	2015-06-26 10:00:00	f	2015-06-26 10:00:00	2015-06-26 12:00:00	3			
00180000-55e8-154c-7196-8ea6bc309b1f	\N	\N	00200000-55e8-154c-fbb8-8d11c4a4bd46	\N	\N	\N	\N	2015-06-27 10:00:00	f	2015-06-27 10:00:00	2015-06-27 12:00:00	4			
00180000-55e8-154c-b826-4abef064eb70	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	f	2015-08-01 20:00:00	2015-08-01 23:00:00	5			
00180000-55e8-154c-08b9-5c349e75d8e3	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	f	2015-08-01 20:00:00	2015-08-01 23:00:00	2			
00180000-55e8-154c-7bd4-8f8846ce9fb5	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	f	2015-08-01 20:00:00	2015-08-01 23:00:00	7			
\.


--
-- TOC entry 2929 (class 0 OID 17158930)
-- Dependencies: 194
-- Data for Name: dogodeksplosni; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodeksplosni (id) FROM stdin;
\.


--
-- TOC entry 2965 (class 0 OID 17159386)
-- Dependencies: 230
-- Data for Name: drugivir; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drugivir (id, znesek, opis, mednarodni, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 2922 (class 0 OID 17158842)
-- Dependencies: 187
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-55e8-154a-3a96-171431294f53	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-55e8-154a-371e-d9503b0a9ebd	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-55e8-154a-3a56-4cb020cf1714	AL	ALB	008	Albania 	Albanija	\N
00040000-55e8-154a-0f42-6aaf77a733a7	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-55e8-154a-0097-3f14e7ea46b7	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-55e8-154a-82c5-405ae3942665	AD	AND	020	Andorra 	Andora	\N
00040000-55e8-154a-db40-ea1d732e7156	AO	AGO	024	Angola 	Angola	\N
00040000-55e8-154a-faf9-3c41e6f35312	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-55e8-154a-f819-98e508ee75ae	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-55e8-154a-41b1-3b916b7a85fa	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-55e8-154a-9471-2a0a28ce351b	AR	ARG	032	Argentina 	Argenitna	\N
00040000-55e8-154a-4b2e-c091d1f4e30b	AM	ARM	051	Armenia 	Armenija	\N
00040000-55e8-154a-9909-19352a2fcbb4	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-55e8-154a-31cd-27627b13da9d	AU	AUS	036	Australia 	Avstralija	\N
00040000-55e8-154a-44a2-fc42be255078	AT	AUT	040	Austria 	Avstrija	\N
00040000-55e8-154a-5238-c75259fef2cf	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-55e8-154a-bb57-65c9a7e27b95	BS	BHS	044	Bahamas 	Bahami	\N
00040000-55e8-154a-650a-8fd429d7fd44	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-55e8-154a-eeb7-a8f7bf745098	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-55e8-154a-8e18-ea07d5e7aa21	BB	BRB	052	Barbados 	Barbados	\N
00040000-55e8-154a-65c1-b7f6a25fc4ed	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-55e8-154a-5909-b697bc4ee641	BE	BEL	056	Belgium 	Belgija	\N
00040000-55e8-154a-0108-aeb961b8ae54	BZ	BLZ	084	Belize 	Belize	\N
00040000-55e8-154a-fd5b-63ca1acef326	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-55e8-154a-0b73-0af1d2661f72	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-55e8-154a-275f-21a06cde6e17	BT	BTN	064	Bhutan 	Butan	\N
00040000-55e8-154a-d202-2f59c35e6682	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-55e8-154a-6885-9eb52097e993	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-55e8-154a-df97-10c529a63c04	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-55e8-154a-4c45-82bd7d479ae5	BW	BWA	072	Botswana 	Bocvana	\N
00040000-55e8-154a-4c82-3159232c48df	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-55e8-154a-b74b-242857c637c3	BR	BRA	076	Brazil 	Brazilija	\N
00040000-55e8-154a-256e-0ea065d7b155	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-55e8-154a-93d4-d2a47eef1ed6	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-55e8-154a-6e95-524015e8ea77	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-55e8-154a-4f4a-4a54a9a73ff9	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-55e8-154a-4b9d-64f4befbc94f	BI	BDI	108	Burundi 	Burundi 	\N
00040000-55e8-154a-8f71-5feada9ef13d	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-55e8-154a-85de-a9eefcd47a0b	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-55e8-154a-0ed5-b417a68ec4b3	CA	CAN	124	Canada 	Kanada	\N
00040000-55e8-154a-d764-277cbf96230b	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-55e8-154a-1ca6-2f803abe0d15	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-55e8-154a-c384-a0eb229fbf1b	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-55e8-154a-479b-466ce8052295	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-55e8-154a-b383-b140d8c1e3f5	CL	CHL	152	Chile 	Čile	\N
00040000-55e8-154a-a924-5d2faedad5f9	CN	CHN	156	China 	Kitajska	\N
00040000-55e8-154a-5710-9e479de72805	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-55e8-154a-6d1a-691e7f0a179a	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-55e8-154a-0592-072179ac54cc	CO	COL	170	Colombia 	Kolumbija	\N
00040000-55e8-154a-4243-3cbe970d86e4	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-55e8-154a-cc63-c381d929f107	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-55e8-154a-747f-c36c06c99b63	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-55e8-154a-ff17-a6cd861399c2	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-55e8-154a-7a9c-bac06ef87b5c	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-55e8-154a-d1ff-508980426bd3	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-55e8-154a-aefb-be9ad50388dd	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-55e8-154a-47d7-3a50f8877f4e	CU	CUB	192	Cuba 	Kuba	\N
00040000-55e8-154a-ba92-cd998867a894	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-55e8-154a-d8cc-9d39d70febd5	CY	CYP	196	Cyprus 	Ciper	\N
00040000-55e8-154a-06e7-5cf18259e7e0	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-55e8-154a-7a48-2b021fcf27a8	DK	DNK	208	Denmark 	Danska	\N
00040000-55e8-154a-23c0-3ce78dd6b348	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-55e8-154a-07cc-2a8786e7de5c	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-55e8-154a-4913-e5df84d4ef89	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-55e8-154a-d62d-64cd71af3f84	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-55e8-154a-c58b-9b1b185b2d7a	EG	EGY	818	Egypt 	Egipt	\N
00040000-55e8-154a-fbcd-82ef902c7ec5	SV	SLV	222	El Salvador 	Salvador	\N
00040000-55e8-154a-b05b-a95ebcd7af4e	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-55e8-154a-dffc-0c3ee1e28ce0	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-55e8-154a-e747-43e10623b681	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-55e8-154a-80b2-8e922d606a08	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-55e8-154a-e8b3-d5f2de0cff13	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-55e8-154a-67be-d901b62aa986	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-55e8-154a-8382-359cf465a67f	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-55e8-154a-914e-ce7a21f08498	FI	FIN	246	Finland 	Finska	\N
00040000-55e8-154a-5691-9c64ee3e9b90	FR	FRA	250	France 	Francija	\N
00040000-55e8-154a-34c7-464b2042a0ac	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-55e8-154a-156f-5e8257cf8fea	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-55e8-154a-1cbd-8e77e711ceca	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-55e8-154a-069c-478ff93fb441	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-55e8-154a-dcdf-b6fac40a5690	GA	GAB	266	Gabon 	Gabon	\N
00040000-55e8-154a-980e-0585611cef6d	GM	GMB	270	Gambia 	Gambija	\N
00040000-55e8-154a-f2d7-e093138185ff	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-55e8-154a-cc3b-077bc094549a	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-55e8-154a-caa9-d25f11d8f599	GH	GHA	288	Ghana 	Gana	\N
00040000-55e8-154a-2175-146aafbd1099	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-55e8-154a-6a81-45c59062d70c	GR	GRC	300	Greece 	Grčija	\N
00040000-55e8-154a-3c1b-34785a2fe63a	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-55e8-154a-2eae-ce82520f6366	GD	GRD	308	Grenada 	Grenada	\N
00040000-55e8-154a-8288-3ee2a4229811	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-55e8-154a-fc6c-77b1a86a41fd	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-55e8-154a-1f8c-17b63ef1a655	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-55e8-154a-84dc-278ba98e9d63	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-55e8-154a-1509-156de0bbf533	GN	GIN	324	Guinea 	Gvineja	\N
00040000-55e8-154a-954e-d68e1879aeb5	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-55e8-154a-a1d5-deadbdfcfb3a	GY	GUY	328	Guyana 	Gvajana	\N
00040000-55e8-154a-daed-fb75e7c68d5b	HT	HTI	332	Haiti 	Haiti	\N
00040000-55e8-154a-0081-9f8d6fcf8d30	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-55e8-154a-f2d2-bd76251a7cc8	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-55e8-154a-fe86-bb099186cc4a	HN	HND	340	Honduras 	Honduras	\N
00040000-55e8-154a-6c8e-709f1156549d	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-55e8-154a-96bc-bef8d8fb9392	HU	HUN	348	Hungary 	Madžarska	\N
00040000-55e8-154a-89af-563615d15d80	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-55e8-154a-368f-712afbf1fd76	IN	IND	356	India 	Indija	\N
00040000-55e8-154a-ff46-5b7209411f56	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-55e8-154a-0c05-1c7f164917e4	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-55e8-154a-6130-4fd736cdade2	IQ	IRQ	368	Iraq 	Irak	\N
00040000-55e8-154a-7b4e-4f2c8236217f	IE	IRL	372	Ireland 	Irska	\N
00040000-55e8-154a-1b72-abc55ebcbeb0	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-55e8-154a-8ac2-273bbdfedffe	IL	ISR	376	Israel 	Izrael	\N
00040000-55e8-154a-7509-813b12cefb38	IT	ITA	380	Italy 	Italija	\N
00040000-55e8-154a-d227-5f1e66996988	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-55e8-154a-809b-a229f62756fc	JP	JPN	392	Japan 	Japonska	\N
00040000-55e8-154a-371d-31dd52b5e88a	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-55e8-154a-4b24-9177d7521c4e	JO	JOR	400	Jordan 	Jordanija	\N
00040000-55e8-154a-6ba8-1097d99a1a6a	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-55e8-154a-699f-fc72e9332320	KE	KEN	404	Kenya 	Kenija	\N
00040000-55e8-154a-fb2d-9dc52984dd87	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-55e8-154a-d32e-184eb24083e5	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-55e8-154a-e408-3316b3930a6a	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-55e8-154a-4e58-2d466e02cc09	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-55e8-154a-283b-d62b7a2d2d7f	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-55e8-154a-19cb-371769521a60	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-55e8-154a-92c6-bfc64bde70a8	LV	LVA	428	Latvia 	Latvija	\N
00040000-55e8-154a-de75-6b4e0efc3278	LB	LBN	422	Lebanon 	Libanon	\N
00040000-55e8-154a-7215-28f8c7f41df1	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-55e8-154a-61f3-e6d710113e41	LR	LBR	430	Liberia 	Liberija	\N
00040000-55e8-154a-fee2-ef77b06769d4	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-55e8-154a-1848-693334d87434	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-55e8-154a-501f-594f0832d1c8	LT	LTU	440	Lithuania 	Litva	\N
00040000-55e8-154a-0b9a-2113ae46acc1	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-55e8-154a-b157-c9b2a67236b7	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-55e8-154a-f6be-389fae9764e0	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-55e8-154a-b717-706421a9d21e	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-55e8-154a-afbd-c9b08153d6b7	MW	MWI	454	Malawi 	Malavi	\N
00040000-55e8-154a-39e4-21708912976a	MY	MYS	458	Malaysia 	Malezija	\N
00040000-55e8-154a-2c45-a806da4fc5b3	MV	MDV	462	Maldives 	Maldivi	\N
00040000-55e8-154a-98c6-4ac57ceffddc	ML	MLI	466	Mali 	Mali	\N
00040000-55e8-154a-35d4-3afd964df2d3	MT	MLT	470	Malta 	Malta	\N
00040000-55e8-154a-82a9-cd1917ca7cc8	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-55e8-154a-e34e-7dfcc44a7c84	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-55e8-154a-5c0a-9f880a0980e0	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-55e8-154a-0fda-6475c1286f60	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-55e8-154a-1ad2-1a0ac20d2cc2	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-55e8-154a-9463-9b3daccbbe08	MX	MEX	484	Mexico 	Mehika	\N
00040000-55e8-154a-d63c-52131ade527d	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-55e8-154a-06e9-68af7ebe4435	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-55e8-154a-fb53-55b37800e73b	MC	MCO	492	Monaco 	Monako	\N
00040000-55e8-154a-da75-021f1b44a722	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-55e8-154a-4664-36696ef7f53d	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-55e8-154a-a1a7-2a26e6ddeec5	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-55e8-154a-53fc-8d2aaba237cf	MA	MAR	504	Morocco 	Maroko	\N
00040000-55e8-154a-92a9-cd88c4b8b829	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-55e8-154a-cdfd-d0642f573feb	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-55e8-154a-4432-dc75a68190d6	NA	NAM	516	Namibia 	Namibija	\N
00040000-55e8-154a-b817-8d9ef1f23075	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-55e8-154a-348f-f479f0d4e75a	NP	NPL	524	Nepal 	Nepal	\N
00040000-55e8-154a-3bb7-e0ef06b8ea2a	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-55e8-154a-e230-3fb60750e730	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-55e8-154a-cb3b-3662b80b0e8b	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-55e8-154a-ac6b-2ee359571506	NE	NER	562	Niger 	Niger 	\N
00040000-55e8-154a-2cff-b284130f6bbd	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-55e8-154a-65cc-a5d6639566f6	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-55e8-154a-fb0d-a10797d2fd2a	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-55e8-154a-68f0-ec798310e428	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-55e8-154a-0594-4cb92e174633	NO	NOR	578	Norway 	Norveška	\N
00040000-55e8-154a-599e-501ce1b38384	OM	OMN	512	Oman 	Oman	\N
00040000-55e8-154a-0841-812517e2343b	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-55e8-154a-d650-368703e6a7aa	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-55e8-154a-abb1-bf312413af1a	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-55e8-154a-991f-cd912b8948bf	PA	PAN	591	Panama 	Panama	\N
00040000-55e8-154a-8a75-3a245f327347	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-55e8-154a-d79e-b30eb796099a	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-55e8-154a-10f1-28613785713c	PE	PER	604	Peru 	Peru	\N
00040000-55e8-154a-661d-060fc415a5c6	PH	PHL	608	Philippines 	Filipini	\N
00040000-55e8-154a-0b25-6fe5bf0d660c	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-55e8-154a-26c8-61fa0c7a04c2	PL	POL	616	Poland 	Poljska	\N
00040000-55e8-154a-0b10-d630c8d7aa84	PT	PRT	620	Portugal 	Portugalska	\N
00040000-55e8-154a-617f-f31070d33e83	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-55e8-154a-0d17-2f04bd8c2364	QA	QAT	634	Qatar 	Katar	\N
00040000-55e8-154a-89d7-0ad17957be7c	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-55e8-154a-ebf0-1fbcfd1ce9df	RO	ROU	642	Romania 	Romunija	\N
00040000-55e8-154a-f1d5-924c68f5aa58	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-55e8-154a-f8b0-d9370d30a9d1	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-55e8-154a-afda-f6d58b35725d	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-55e8-154a-fb53-b10ad4d3265d	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-55e8-154a-399d-e54fa7d5dce2	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-55e8-154a-10fb-7203989ebeb0	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-55e8-154a-7181-5a60bc7494ac	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-55e8-154a-3c8a-1c4028100242	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-55e8-154a-c63e-87e8e3ebaf66	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-55e8-154a-7e18-20575e5f24b5	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-55e8-154a-66c3-aaf5c1dccfc4	SM	SMR	674	San Marino 	San Marino	\N
00040000-55e8-154a-4ff8-6569f9d94fca	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-55e8-154a-2ec7-634b24b57115	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-55e8-154a-9990-ac62f2fc7208	SN	SEN	686	Senegal 	Senegal	\N
00040000-55e8-154a-5703-2959453cacf4	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-55e8-154a-e785-c4f749d53cd9	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-55e8-154a-a38d-31a62d602043	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-55e8-154a-7d22-4fd51a921b20	SG	SGP	702	Singapore 	Singapur	\N
00040000-55e8-154a-9de7-57bfc5a31d51	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-55e8-154a-479f-75fe6328064b	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-55e8-154a-4f83-8c49c8e91f9b	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-55e8-154a-6a83-58a6efb8d3ac	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-55e8-154a-08c1-5696342ac2d3	SO	SOM	706	Somalia 	Somalija	\N
00040000-55e8-154a-f7f5-7c5c55e369c2	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-55e8-154a-a5f8-020a5f87adf6	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-55e8-154a-00bf-f60b5923051c	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-55e8-154a-9255-df2101b9c0ed	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-55e8-154a-2e33-44200803455a	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-55e8-154a-ceaf-9fe396f4e5b8	SD	SDN	729	Sudan 	Sudan	\N
00040000-55e8-154a-4094-e9a71879fea8	SR	SUR	740	Suriname 	Surinam	\N
00040000-55e8-154a-49ca-5d82b3502a21	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-55e8-154a-016b-05d474cf3ae9	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-55e8-154a-ddc4-b3c9d9868f18	SE	SWE	752	Sweden 	Švedska	\N
00040000-55e8-154a-8f40-1e823787912a	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-55e8-154a-483d-3d226130a07d	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-55e8-154a-7b6f-7345046c445a	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-55e8-154a-2e3d-e0766c4672b4	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-55e8-154a-ecaa-1aa4cc82391d	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-55e8-154a-e971-7fdb0ff6a7d6	TH	THA	764	Thailand 	Tajska	\N
00040000-55e8-154a-fd9a-fb905f1e6490	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-55e8-154a-a0a5-b5eadbb6d794	TG	TGO	768	Togo 	Togo	\N
00040000-55e8-154a-face-25af839d7206	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-55e8-154a-8505-439461194c98	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-55e8-154a-9ba8-c7e0291526e6	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-55e8-154a-c88e-d39aeca1ac15	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-55e8-154a-e242-4471813b09ee	TR	TUR	792	Turkey 	Turčija	\N
00040000-55e8-154a-3917-9cb405ada316	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-55e8-154a-ba87-5db47ce78356	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-55e8-154a-2b9b-9a49a9d16ea8	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-55e8-154a-ce47-3c92660a466d	UG	UGA	800	Uganda 	Uganda	\N
00040000-55e8-154a-367f-098a953360ad	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-55e8-154a-0277-d9d109d98cf1	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-55e8-154a-a348-d1269b715218	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-55e8-154a-2800-9f1fd26148c1	US	USA	840	United States 	Združene države Amerike	\N
00040000-55e8-154a-6f28-9d6f34e79959	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-55e8-154a-a9cc-e07cb9676af4	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-55e8-154a-1e46-4002c5091807	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-55e8-154a-5011-d5944be2ebf1	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-55e8-154a-9dbd-923c6737f46a	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-55e8-154a-546e-308ee2227c76	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-55e8-154a-5327-10327d1115ea	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-55e8-154a-6223-e72d9e6836f3	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-55e8-154a-e31b-c67868280bfc	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-55e8-154a-ea96-c039f494b93a	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-55e8-154a-13ce-6e4b17336bb0	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-55e8-154a-3c09-506727eaa0f1	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-55e8-154a-bf52-6055acb3e24e	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 2959 (class 0 OID 17159248)
-- Dependencies: 224
-- Data for Name: enotaprograma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY enotaprograma (id, uprizoritev_id, program_dela_id, gostitelj_id, celotnavrednost, nasdelez, celotnavrednostmat, celotnavrednostgostovsz, zaproseno, lastnasredstva, avtorskihonorarji, avtorskihonorarjisamoz, tantieme, avtorskepravice, materialni, imakoprodukcije, vlozekgostitelja, drugijavni, stzaposlenih, stzaposumet, stzaposdrug, sthonorarnih, sthonorarnihigr, sthonorarnihigrtujjz, sthonorarnihigrsamoz, obiskdoma, obiskkopr, obiskgost, obiskzamejo, obiskint, obiskkoprint, ponovidoma, ponovikopr, ponovizamejo, ponovigost, ponovikoprint, ponoviint, naziv, kpe, sort, tipprogramskeenote_id, tip, strosekodkpred, stroskiostali, krajgostovanja, ustanova, datumgostovanja, transportnistroski, dnevprvzad, drzavagostovanja_id, stpe, zvrst, stpredstav, stokroglihmiz, stpredstavitev, stdelavnic, stdrugidogodki, stprodukcij, caspriprave, casizvedbe, prizorisca, umetvodja, programskotelo, sttujihselektorjev) FROM stdin;
002f0000-55e8-154c-e0c8-5e026628f382	000e0000-55e8-154c-169c-b72e840fc45a	\N	\N	9000.30	9000.30	9000.30	0.00	3600.12	5299.98	4000.40	1000.40	200.20	200.30	4599.40	\N	0.00	100.20	0	2	2	2	2	2	\N	40	0	0	0	0	0	1	0	0	0	0	0		0.00	\N	002b0000-55e8-1549-7a49-b27816a80438	premiera	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-55e8-154c-8135-6ed3092b246a	000e0000-55e8-154c-b9d1-a66976c52d49	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	\N	60	0	0	0	0	0	1	0	0	0	0	0		0.00	\N	002b0000-55e8-1549-b968-dc7ed53a1e57	premiera	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-55e8-154c-5296-ef90ae453e4c	000e0000-55e8-154c-5055-5a399ef9fe83	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	\N	60	0	0	0	0	0	1	0	0	0	0	0		0.00	\N	002b0000-55e8-1549-7a49-b27816a80438	premiera	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-55e8-154c-c740-ddba15b6699d	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-54.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	54.20	5	0	0	3	0	0	\N	22	0	0	0	0	0	0	0	0	0	0	0	Urejanje portala	0.00	10	\N	razno	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-55e8-154c-2f49-6929dab2dbab	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-31.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	31.20	5	0	0	3	0	0	\N	202	0	0	0	0	0	0	0	0	0	0	0	Delavnice otroci	0.00	8	\N	razno	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 2945 (class 0 OID 17159063)
-- Dependencies: 210
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, podrocje, vodjaekipe, naziv, komentar, velikost, pomembna, sort, seplanira, dovoliprekrivanje, maxprekrivanj, tipfunkcije_id) FROM stdin;
000d0000-55e8-154c-dc24-f24d3ecdb433	000e0000-55e8-154c-b9d1-a66976c52d49	\N	igralec	\N	Hipolita	glavna vloga	velika	t	6	t	t	\N	000f0000-55e8-1549-16b0-99341fc30ea0
000d0000-55e8-154c-8a6d-6942c330d703	000e0000-55e8-154c-b9d1-a66976c52d49	\N	igralec	\N	Tezej	glavna vloga	velika	t	5	t	t	\N	000f0000-55e8-1549-16b0-99341fc30ea0
000d0000-55e8-154c-46bf-e298acefb244	000e0000-55e8-154c-b9d1-a66976c52d49	\N	umetnik	\N	Režija		velika	t	8	t	t	\N	000f0000-55e8-1549-cb8e-e8da7d44d78a
000d0000-55e8-154c-af54-09bd36d24a64	000e0000-55e8-154c-b9d1-a66976c52d49	\N	inspicient	t	Inšpicient			t	8	t	t	\N	000f0000-55e8-1549-0966-6581279a852e
000d0000-55e8-154c-13fc-dfd47f679195	000e0000-55e8-154c-b9d1-a66976c52d49	\N	tehnik	t	Tehnični vodja			t	8	t	t	\N	000f0000-55e8-1549-899a-0e5239827ffd
000d0000-55e8-154c-af64-6b8998c7aab6	000e0000-55e8-154c-b9d1-a66976c52d49	\N	tehnik	\N	Razsvetljava			t	3	t	t	\N	000f0000-55e8-1549-899a-0e5239827ffd
000d0000-55e8-154c-9284-6d042e9b3975	000e0000-55e8-154c-b9d1-a66976c52d49	\N	igralec	\N	Helena	glavna vloga	velika	t	5	t	t	\N	000f0000-55e8-1549-16b0-99341fc30ea0
000d0000-55e8-154c-bf7d-62041fe88a24	000e0000-55e8-154c-b9d1-a66976c52d49	\N	umetnik	\N	Lektoriranje			t	22	t	t	\N	000f0000-55e8-1549-afa9-6d405646f5c9
\.


--
-- TOC entry 2925 (class 0 OID 17158878)
-- Dependencies: 190
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta, zamejstvo, kraj) FROM stdin;
\.


--
-- TOC entry 2923 (class 0 OID 17158859)
-- Dependencies: 188
-- Data for Name: kontaktnaoseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kontaktnaoseba (id, popa_id, oseba_id, status, funkcija, opis) FROM stdin;
00260000-55e8-154c-aede-4a1be28de567	00080000-55e8-154b-2056-e4fef69ec416	00090000-55e8-154c-896b-15dd0a6d30f4	AK		
\.


--
-- TOC entry 2934 (class 0 OID 17158977)
-- Dependencies: 199
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 2972 (class 0 OID 17159465)
-- Dependencies: 237
-- Data for Name: mapa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa (id, lastnik_id, parent_id, ime, komentar, caskreiranja, casspremembe, javnidostop, upor, datknj) FROM stdin;
\.


--
-- TOC entry 2973 (class 0 OID 17159477)
-- Dependencies: 238
-- Data for Name: mapa_zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa_zapis (mapa_id, zapis_id) FROM stdin;
\.


--
-- TOC entry 2975 (class 0 OID 17159499)
-- Dependencies: 240
-- Data for Name: mapaacl; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapaacl (id, mapa_id, perm_id, dostop, upor, datknj) FROM stdin;
\.


--
-- TOC entry 2905 (class 0 OID 16867877)
-- Dependencies: 170
-- Data for Name: migrations; Type: TABLE DATA; Schema: public; Owner: -
--

COPY migrations (version) FROM stdin;
20150824004401
20150826210511
20150827174118
20150831215248
\.


--
-- TOC entry 2938 (class 0 OID 17159002)
-- Dependencies: 203
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 2920 (class 0 OID 17158816)
-- Dependencies: 185
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-55e8-154a-8d39-b17918f30fef	popa.stakli	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-55e8-154a-b047-c2b6e4479a4e	oseba.spol	array	a:2:{s:1:"M";a:1:{s:5:"label";s:6:"Moški";}s:1:"Z";a:1:{s:5:"label";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-55e8-154a-4aed-d6423847841c	telefonska.vrsta	array	a:3:{s:7:"mobilna";a:1:{s:5:"label";s:7:"Mobilni";}s:6:"domaca";a:1:{s:5:"label";s:6:"Domač";}s:6:"fiksna";a:1:{s:5:"label";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-55e8-154a-b6b0-9fbc666eb687	kontaktnaoseba.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status kontaktne osebe
00000000-55e8-154a-3e7b-139dae00e5ac	dogodek.status	array	a:7:{i:100;a:1:{s:5:"label";s:11:"Dolgoročno";}i:200;a:1:{s:5:"label";s:9:"Planirano";}i:300;a:1:{s:5:"label";s:8:"Fiksiran";}i:400;a:1:{s:5:"label";s:17:"Potrjen - interno";}i:500;a:1:{s:5:"label";s:15:"Potrjen - javno";}i:600;a:1:{s:5:"label";s:10:"Zaključen";}i:700;a:1:{s:5:"label";s:7:"Obdelan";}}	f	t	t	\N	Tabela statusa dogodkov
00000000-55e8-154a-51c4-f2d625df1f7a	dogodek.razred	array	a:5:{i:100;a:2:{s:5:"label";s:9:"Predstava";s:4:"type";s:9:"predstava";}i:200;a:2:{s:5:"label";s:4:"Vaja";s:4:"type";s:4:"vaja";}i:300;a:2:{s:5:"label";s:10:"Gostovanje";s:4:"type";s:10:"gostovanje";}i:400;a:2:{s:5:"label";s:10:"Zasedenost";s:4:"type";s:10:"zasedenost";}i:500;a:2:{s:5:"label";s:16:"Splošni dogodek";s:4:"type";s:8:"splošni";}}	f	t	t	\N	Tabela razredov dogodkov, ki jih aplikacija podpira
00000000-55e8-154a-f5df-7f1c48415dd0	uprizoritev.faza	array	a:6:{s:20:"predprodukcija-ideja";a:1:{s:5:"label";s:16:"Dolgoročni plan";}s:20:"predprodukcija-poziv";a:1:{s:5:"label";s:29:"Predprodukcija, v fazi poziva";}s:30:"predprodukcija-potrjen_program";a:1:{s:5:"label";s:34:"Predprodukcija, program je potrjen";}s:10:"produkcija";a:1:{s:5:"label";s:10:"Produkcija";}s:14:"postprodukcija";a:1:{s:5:"label";s:14:"Postprodukcija";}s:5:"arhiv";a:1:{s:5:"label";s:10:"Arhivirana";}}	f	t	f	\N	Faza uprizoritve
00000000-55e8-154a-43d6-2ad1f7d2b0ed	funkcija.podrocje	array	a:4:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}}	f	t	f	\N	Področje funkcije
00000000-55e8-154a-9643-fc432ac308bf	tipfunkcije.podrocje	array	a:4:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}}	f	t	f	\N	Področje funkcije
00000000-55e8-154a-c7a8-146dc4989ded	funkcija.velikost	array	a:4:{s:7:"stataza";a:1:{s:5:"label";s:8:"Stataža";}s:4:"mala";a:1:{s:5:"label";s:21:"Mala vloga / funkcija";}s:7:"srednja";a:1:{s:5:"label";s:24:"Srednja vloga / funkcija";}s:6:"velika";a:1:{s:5:"label";s:23:"Velika vloga / funkcija";}}	f	t	f	\N	Velikost funkcije
00000000-55e8-154a-f166-1a291e57f21a	zaposlitev.status	array	a:2:{s:1:"A";a:1:{s:5:"label";s:7:"Aktivna";}s:1:"N";a:1:{s:5:"label";s:9:"Neaktivna";}}	f	t	f	\N	Status zaposlitve
00000000-55e8-154a-d46b-0405f2bcc1ad	produkcijskahisa.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktivna";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktivna";}}	f	t	f	\N	Status produkcijske hiše
00000000-55e8-154a-e819-c8a906de61d1	strosekuprizoritve.tipstroska	array	a:2:{s:10:"materialni";a:1:{s:5:"label";s:19:"Materialni strošek";}s:9:"avtorprav";a:1:{s:5:"label";s:32:"Strošek odkupa avtorskih pravic";}}	f	t	f	\N	Tip stroška
00000000-55e8-154a-e99b-a08df82fe486	fsacl.dostop	array	a:4:{s:1:"X";a:1:{s:5:"label";s:12:"Brez dostopa";}s:1:"R";a:1:{s:5:"label";s:11:"Samo branje";}s:2:"RW";a:1:{s:5:"label";s:17:"Branje in pisanje";}s:3:"RWD";a:1:{s:5:"label";s:26:"Branje pisanje in brisanje";}}	f	t	f	\N	ACL Javni dostop
00000000-55e8-154b-5742-fee77af1826d	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-55e8-154b-39db-8b735a105fb7	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-55e8-154b-870e-3a9b637fb84c	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-55e8-154b-76d3-e8abc8d59079	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-55e8-154c-0c79-b0c8e5e6eb92	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
00000000-55e8-154d-42ce-a981e23e0fbf	application.tenant.maticnopodjetje	string	s:4:"1001";	f	t	f		Šifra matičnega podjetja v Popa in ProdukcijskaHisa
\.


--
-- TOC entry 2914 (class 0 OID 17158730)
-- Dependencies: 179
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-55e8-154b-2db3-46d10c38b626	00000000-55e8-154b-5742-fee77af1826d	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-55e8-154b-1603-39dc59662c0a	00000000-55e8-154b-5742-fee77af1826d	00010000-55e8-154a-b4fc-326a1aadc7ea	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-55e8-154b-892d-7bbe5911c2df	00000000-55e8-154b-39db-8b735a105fb7	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 2915 (class 0 OID 17158741)
-- Dependencies: 180
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naslov_id, sifra, naziv, ime, priimek, funkcija, srednjeime, polnoime, psevdonim, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
00090000-55e8-154c-df65-a991201c28a2	\N	\N	0001	g.	Janez	Novak	a	Peter	Janez Peter Novak	Jani	jani.novak@xxx.xx	1958-01-06	0601958000000	123456789	M	Jani Janez	Slovenija	Slovenija	Ljubljana
00090000-55e8-154c-3216-5a430ee18164	00010000-55e8-154c-928e-77db39b38cfa	\N	0002	dr.	Anton	Horvat	b		Anton  Horvat	Tona	anton.horvat@xxx.xx	1968-02-12	1202968111111	234567890	M		Slovenija	Slovenija	Maribor
00090000-55e8-154c-62b5-06db238b5e4c	00010000-55e8-154c-31a5-268b00fbe7a4	\N	0003		Ivan	Kovačič	c		Ivan  Kovačič	Ivo	ivan.kovacic@xxx.xx	1975-03-26	2603976222222	345678901	M		Slovenija	Slovenija	Celje
00090000-55e8-154c-162a-281a4242c709	00010000-55e8-154c-cb9c-3552e2c1eb67	\N	0004	prof.	Jožef	Krajnc	d		Jožef  Krajnc	Joža	jozef.krajnc@xxx.xx	1971-04-30	3004971333333	456789012	M		Slovenija	Slovenija	Kranj
00090000-55e8-154c-bd77-0a0d1b49819b	\N	\N	0005		Marko	Zupančič	e		Marko  Zupančič		marko.zupancic@xxx.xx	1984-05-07	0705984444444	567890123	M		Slovenija	Slovenija	Koper
00090000-55e8-154c-8ffd-2e33be6e85b4	\N	\N	0006	ga.	Marija	Kovač	f		Marija  Kovač		marija.kovac@xxx.xx	1962-06-19	1906962444444	678901234	Z		Slovenija	Slovenija	Murska Sobota
00090000-55e8-154c-550c-a7c5a9e06f96	\N	\N	0007	ga.	Ana	Potočnik	g		Ana  Potočnik		ana.potocnik@xxx.xx	1975-07-24	2407975555555	789012345	Z		Slovenija	Slovenija	Novo Mesto
00090000-55e8-154c-a214-c350f90e739c	\N	\N	0008	ga.	Maja	Mlakar	h		Maja  Mlakar		maja.mlakar@xxx.xx	1986-08-02	0208986666666	890123456	Z		Slovenija	Slovenija	Nova Gorica
00090000-55e8-154c-896b-15dd0a6d30f4	00010000-55e8-154c-38fa-5ce6df50dd02	\N	0009		Irena	Kos	i		Irena  Kos		irena.kos@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Ptuj
00090000-55e8-154c-f4a9-299cbc45680d	\N	\N	0010		Mojca	Vidmar	J		Mojca  Vidmar		mojca.vidmar@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Idrija
00090000-55e8-154c-1ce6-393a86e23d9d	\N	\N	0011		xx	write protected12345	a		xx  write protected12345		xx@xxx.xx	\N	\N	\N	Z		\N	\N	\N
00090000-55e8-154c-add4-98677e89ad0b	\N	\N	0012		Luka	Golob	luč	a	Luka a Golob		luka.golob@xxx.xx	\N	\N	\N	M		\N	\N	\N
00090000-55e8-154c-bd63-6d7bdd81be68	00010000-55e8-154c-4dd1-ff33eee556c2	\N	0013		Tatjana	Božič	tajnica	a	Tatjana a Božič		tatjana.bozic@xxx.xx	\N	\N	\N	Z		\N	\N	\N
\.


--
-- TOC entry 2910 (class 0 OID 17158695)
-- Dependencies: 175
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-55e8-154a-faec-761b78768ac6	Aaa-read	Aaa (User,Role,Permission) - branje	f
00030000-55e8-154a-0ca4-c73ee2098353	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	f
00030000-55e8-154a-bf16-34af06c607f5	TerminStoritve-vse	TerminStoritve - spreminjanje vseh zapisov	f
00030000-55e8-154a-8a53-baaec82101e0	Dogodek-readVse	Dogodek - branje vseh, ne glede na status dogodka	f
00030000-55e8-154a-7a49-d53f6c906c7b	Oseba-vse	Oseba - vse - za testiranje assert	f
00030000-55e8-154a-d92f-aa4c632823ef	ProgramDela-lock	ProgramDela - zaklepanje	f
00030000-55e8-154a-7390-88325606371f	ProgramDela-unlock	ProgramDela - odklepanje	f
00030000-55e8-154a-142a-a88ec6abffe1	Abonma-read	Abonma - branje	f
00030000-55e8-154a-2981-113ca1b1a82b	Abonma-write	Abonma - spreminjanje	f
00030000-55e8-154a-aa16-8c98c3479e52	Alternacija-read	Alternacija - branje	f
00030000-55e8-154a-be84-bb287b9d2b06	Alternacija-write	Alternacija - spreminjanje	f
00030000-55e8-154a-cd1b-9453515ebcbb	Arhivalija-read	Arhivalija - branje	f
00030000-55e8-154a-a96a-5c7e574dd7ba	Arhivalija-write	Arhivalija - spreminjanje	f
00030000-55e8-154a-02ac-d44b375ca0b4	Besedilo-read	Besedilo - branje	f
00030000-55e8-154a-8047-5abb28cb3e93	Besedilo-write	Besedilo - spreminjanje	f
00030000-55e8-154a-b775-e12fc3db482d	DogodekIzven-read	DogodekIzven - branje	f
00030000-55e8-154a-148b-55605865bc18	DogodekIzven-write	DogodekIzven - spreminjanje	f
00030000-55e8-154a-74cb-d40eba630cdf	Dogodek-read	Dogodek - branje	f
00030000-55e8-154a-083e-83f19794982c	Dogodek-write	Dogodek - spreminjanje	f
00030000-55e8-154a-b11a-bbe6288d3b88	DrugiVir-read	DrugiVir - branje	f
00030000-55e8-154a-acec-5ed721451803	DrugiVir-write	DrugiVir - spreminjanje	f
00030000-55e8-154a-08d3-ea3089b3ca6b	Drzava-read	Drzava - branje	f
00030000-55e8-154a-1e34-240fbaa89a17	Drzava-write	Drzava - spreminjanje	f
00030000-55e8-154a-386f-552aae98628a	EnotaPrograma-read	EnotaPrograma - branje	f
00030000-55e8-154a-17fe-6db46deaac7b	EnotaPrograma-write	EnotaPrograma - spreminjanje	f
00030000-55e8-154a-c21e-cc68d753d735	Funkcija-read	Funkcija - branje	f
00030000-55e8-154a-867d-e27252575d83	Funkcija-write	Funkcija - spreminjanje	f
00030000-55e8-154a-e570-58ea42d4786f	Gostovanje-read	Gostovanje - branje	f
00030000-55e8-154a-af36-aa9c34445c57	Gostovanje-write	Gostovanje - spreminjanje	f
00030000-55e8-154a-3bfb-40e2c1cfba2e	Gostujoca-read	Gostujoca - branje	f
00030000-55e8-154a-8c20-4755b84109c8	Gostujoca-write	Gostujoca - spreminjanje	f
00030000-55e8-154a-f1b3-745b4c6aa77f	KontaktnaOseba-read	KontaktnaOseba - branje	f
00030000-55e8-154a-ad82-5dae8c60af30	KontaktnaOseba-write	KontaktnaOseba - spreminjanje	f
00030000-55e8-154a-e16a-1f8a06860ebe	Kupec-read	Kupec - branje	f
00030000-55e8-154a-e972-ca4c9ca048d3	Kupec-write	Kupec - spreminjanje	f
00030000-55e8-154a-c30c-e78452645876	NacinPlacina-read	NacinPlacina - branje	f
00030000-55e8-154a-027c-bf2ea682ad82	NacinPlacina-write	NacinPlacina - spreminjanje	f
00030000-55e8-154a-1150-de1cff0f76a8	Option-read	Option - branje	f
00030000-55e8-154a-b098-0bcbb4763b7b	Option-write	Option - spreminjanje	f
00030000-55e8-154a-da1f-a4eb8458efa6	OptionValue-read	OptionValue - branje	f
00030000-55e8-154a-3c89-1e42b3fe75e6	OptionValue-write	OptionValue - spreminjanje	f
00030000-55e8-154a-a797-bd716e58ad85	Oseba-read	Oseba - branje	f
00030000-55e8-154a-be2a-dec8dcd665c5	Oseba-write	Oseba - spreminjanje	f
00030000-55e8-154a-01dd-1d08acee8ba8	PlacilniInstrument-read	PlacilniInstrument - branje	f
00030000-55e8-154a-5fbc-439297d7dbf3	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	f
00030000-55e8-154a-e08c-065cb102b1c8	PodrocjeSedenja-read	PodrocjeSedenja - branje	f
00030000-55e8-154a-3bec-54ad49efa969	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	f
00030000-55e8-154a-69d1-c1f5b28fb769	Pogodba-read	Pogodba - branje	f
00030000-55e8-154a-898c-8553ebee36a9	Pogodba-write	Pogodba - spreminjanje	f
00030000-55e8-154a-4a33-6ee0cdba9e24	Popa-read	Popa - branje	f
00030000-55e8-154a-08bd-534001aeca04	Popa-write	Popa - spreminjanje	f
00030000-55e8-154a-2dbb-7c6af2c18cee	Posta-read	Posta - branje	f
00030000-55e8-154a-b61f-5ae32da9bdd5	Posta-write	Posta - spreminjanje	f
00030000-55e8-154a-b301-6fe768e7133a	PostavkaRacuna-read	PostavkaRacuna - branje	f
00030000-55e8-154a-c08e-130654f97480	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	f
00030000-55e8-154a-697f-ae4af119a364	PostniNaslov-read	PostniNaslov - branje	f
00030000-55e8-154a-bd7e-be258bd8b7da	PostniNaslov-write	PostniNaslov - spreminjanje	f
00030000-55e8-154a-7aaa-44ad2637c431	Predstava-read	Predstava - branje	f
00030000-55e8-154a-3893-6568c8390303	Predstava-write	Predstava - spreminjanje	f
00030000-55e8-154a-5ed2-7b80de7a0945	ProdajaPredstave-read	ProdajaPredstave - branje	f
00030000-55e8-154a-0915-1cee5eb6a3e9	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	f
00030000-55e8-154a-fb22-e49db91d3936	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	f
00030000-55e8-154a-4ba9-f3bf45152152	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	f
00030000-55e8-154a-6f93-6be4976100d9	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	f
00030000-55e8-154a-6c5f-b921e760f0d3	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	f
00030000-55e8-154a-1ea1-813f7d9bb3f4	ProgramDela-read	ProgramDela - branje	f
00030000-55e8-154a-39e0-24e0c0d28c63	ProgramDela-write	ProgramDela - spreminjanje	f
00030000-55e8-154a-5b46-c747fec6291a	ProgramFestival-read	ProgramFestival - branje	f
00030000-55e8-154a-825f-f2e99e301e26	ProgramFestival-write	ProgramFestival - spreminjanje	f
00030000-55e8-154a-d714-4d00549b6bf8	ProgramGostovanje-read	ProgramGostovanje - branje	f
00030000-55e8-154a-1ce3-13fd7e31077f	ProgramGostovanje-write	ProgramGostovanje - spreminjanje	f
00030000-55e8-154a-9941-249cffee8089	ProgramGostujoca-read	ProgramGostujoca - branje	f
00030000-55e8-154a-3cf2-b6ccb4f00e97	ProgramGostujoca-write	ProgramGostujoca - spreminjanje	f
00030000-55e8-154a-1cc4-2fcf51757306	ProgramIzjemni-read	ProgramIzjemni - branje	f
00030000-55e8-154a-db74-a64eea254ba3	ProgramIzjemni-write	ProgramIzjemni - spreminjanje	f
00030000-55e8-154a-6e88-a1c27c009786	ProgramPonovitevPrejsnjih-read	ProgramPonovitevPrejsnjih - branje	f
00030000-55e8-154a-ddd2-f1c42d96a528	ProgramPonovitevPrejsnjih-write	ProgramPonovitevPrejsnjih - spreminjanje	f
00030000-55e8-154a-cd92-5c0fbe7ed40a	ProgramPonovitevPremiere-read	ProgramPonovitevPremiere - branje	f
00030000-55e8-154a-f8a6-b659f5b218f0	ProgramPonovitevPremiere-write	ProgramPonovitevPremiere - spreminjanje	f
00030000-55e8-154a-d286-2963cb2a5668	ProgramPremiera-read	ProgramPremiera - branje	f
00030000-55e8-154a-2872-47f26a6770fd	ProgramPremiera-write	ProgramPremiera - spreminjanje	f
00030000-55e8-154a-6e8d-b65226ddb5e6	ProgramRazno-read	ProgramRazno - branje	f
00030000-55e8-154a-15c1-27846af316be	ProgramRazno-write	ProgramRazno - spreminjanje	f
00030000-55e8-154a-146e-47212b4b6dcc	ProgramskaEnotaSklopa-read	ProgramskaEnotaSklopa - branje	f
00030000-55e8-154a-f74f-8c6b2101953b	ProgramskaEnotaSklopa-write	ProgramskaEnotaSklopa - spreminjanje	f
00030000-55e8-154a-460f-463fa29b68ec	Prostor-read	Prostor - branje	f
00030000-55e8-154a-7b28-68207028ebcf	Prostor-write	Prostor - spreminjanje	f
00030000-55e8-154a-2951-531e65d56af7	Racun-read	Racun - branje	f
00030000-55e8-154a-18ff-6fe04d327edb	Racun-write	Racun - spreminjanje	f
00030000-55e8-154a-f44e-fb01eb1a47c8	RazpisanSedez-read	RazpisanSedez - branje	f
00030000-55e8-154a-a50e-229975d5d075	RazpisanSedez-write	RazpisanSedez - spreminjanje	f
00030000-55e8-154a-2004-ca60be908fad	Rekviziterstvo-read	Rekviziterstvo - branje	f
00030000-55e8-154a-e40a-fa1d811bd206	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	f
00030000-55e8-154a-e596-0d07a6f3642d	Rekvizit-read	Rekvizit - branje	f
00030000-55e8-154a-0de9-ac24ad1472e3	Rekvizit-write	Rekvizit - spreminjanje	f
00030000-55e8-154a-c0b2-29a7a62a76ba	Revizija-read	Revizija - branje	f
00030000-55e8-154a-526f-becf0f07a60b	Revizija-write	Revizija - spreminjanje	f
00030000-55e8-154a-a455-3f2b9d9eb6b8	Rezervacija-read	Rezervacija - branje	f
00030000-55e8-154a-0a1f-71c5c84f66d8	Rezervacija-write	Rezervacija - spreminjanje	f
00030000-55e8-154a-c298-4f864c7440b2	SedezniRed-read	SedezniRed - branje	f
00030000-55e8-154a-40e6-221c775aa800	SedezniRed-write	SedezniRed - spreminjanje	f
00030000-55e8-154a-c1ba-9fc24ca293b1	Sedez-read	Sedez - branje	f
00030000-55e8-154a-85c4-51bee7d71c4b	Sedez-write	Sedez - spreminjanje	f
00030000-55e8-154a-8194-b250898f3659	Sezona-read	Sezona - branje	f
00030000-55e8-154a-e210-1031e9498796	Sezona-write	Sezona - spreminjanje	f
00030000-55e8-154a-bc51-ed21472a4f37	StevilcenjeKonfig-read	StevilcenjeKonfig - branje	f
00030000-55e8-154a-cc52-fcae31662095	StevilcenjeKonfig-write	StevilcenjeKonfig - spreminjanje	f
00030000-55e8-154a-a034-1465775b2964	Stevilcenje-read	Stevilcenje - branje	f
00030000-55e8-154a-9f32-b0c6f32c1655	Stevilcenje-write	Stevilcenje - spreminjanje	f
00030000-55e8-154a-c83c-88d86f5b9592	StevilcenjeStanje-read	StevilcenjeStanje - branje	f
00030000-55e8-154a-0acc-ecc706775902	StevilcenjeStanje-write	StevilcenjeStanje - spreminjanje	f
00030000-55e8-154a-d033-9182ec79f07a	StrosekUprizoritve-read	StrosekUprizoritve - branje	f
00030000-55e8-154a-de63-154b695468e7	StrosekUprizoritve-write	StrosekUprizoritve - spreminjanje	f
00030000-55e8-154a-f1c2-f93effa41cba	Telefonska-read	Telefonska - branje	f
00030000-55e8-154a-15eb-ad60ceadd779	Telefonska-write	Telefonska - spreminjanje	f
00030000-55e8-154a-7595-37cc7a20ef6d	TerminStoritve-read	TerminStoritve - branje	f
00030000-55e8-154a-8edb-95f007c91a4a	TerminStoritve-write	TerminStoritve - spreminjanje	f
00030000-55e8-154a-af08-60c5afc7a1f2	TipFunkcije-read	TipFunkcije - branje	f
00030000-55e8-154a-770c-b634fd12eaca	TipFunkcije-write	TipFunkcije - spreminjanje	f
00030000-55e8-154a-b072-93e353ac1dba	TipProgramskeEnote-read	TipProgramskeEnote - branje	f
00030000-55e8-154a-b26d-d2b91dc2e169	TipProgramskeEnote-write	TipProgramskeEnote - spreminjanje	f
00030000-55e8-154a-29f2-585c60c07fa1	Trr-read	Trr - branje	f
00030000-55e8-154a-b23b-b4c17709a737	Trr-write	Trr - spreminjanje	f
00030000-55e8-154a-f944-32616f5325e7	Uprizoritev-read	Uprizoritev - branje	f
00030000-55e8-154a-ef67-8ec493e548ad	Uprizoritev-write	Uprizoritev - spreminjanje	f
00030000-55e8-154a-0a18-bdca26788a40	Vaja-read	Vaja - branje	f
00030000-55e8-154a-9197-c75a3684df74	Vaja-write	Vaja - spreminjanje	f
00030000-55e8-154a-2a58-30e1abd39281	VrstaSedezev-read	VrstaSedezev - branje	f
00030000-55e8-154a-7d6b-9b60e566791b	VrstaSedezev-write	VrstaSedezev - spreminjanje	f
00030000-55e8-154a-8959-842552411cec	VrstaStroska-read	VrstaStroska - branje	f
00030000-55e8-154a-5c35-b4ef6a72da37	VrstaStroska-write	VrstaStroska - spreminjanje	f
00030000-55e8-154a-5e37-526a637f2dfb	Zaposlitev-read	Zaposlitev - branje	f
00030000-55e8-154a-a7a6-2f71d40ab1c8	Zaposlitev-write	Zaposlitev - spreminjanje	f
00030000-55e8-154a-6019-f5b69043e98c	Zasedenost-read	Zasedenost - branje	f
00030000-55e8-154a-1088-51350200949a	Zasedenost-write	Zasedenost - spreminjanje	f
00030000-55e8-154a-ab5f-4697dbfe5ed4	ZvrstSurs-read	ZvrstSurs - branje	f
00030000-55e8-154a-2a89-8efa1521d477	ZvrstSurs-write	ZvrstSurs - spreminjanje	f
00030000-55e8-154a-17f6-c23cc878ebd3	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	f
00030000-55e8-154a-d5fe-a2a3dd0a939c	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	f
00030000-55e8-154a-7bad-467dcadd1377	Mapa-write	Mapa - osnovno dovoljenje za pisanje	f
00030000-55e8-154a-41e9-0025e2807214	Mapa-read	Mapa - osnovno dovoljenje za branje	f
00030000-55e8-154a-1550-e91aeb9b4bcb	MapaAcl-write	MapaAcl - dovoljenje za dostop pisanje ACL-jev mape	f
00030000-55e8-154a-77ee-47184eb5e494	MapaAcl-read	MapaAcl - dovoljenje za dostop branje ACL-jev mape	f
00030000-55e8-154a-913f-62791b90ff6d	Zapis-write	Zapis - dovoljenje za pisanje zapisov	f
00030000-55e8-154a-48e8-306e48ab5519	Zapis-read	Zapis - dovoljenje za pisanje zapisov	f
00030000-55e8-154a-8122-036b294174cb	ZapisLastnik-write	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	f
00030000-55e8-154a-c0c2-f9db34d766a5	ZapisLastnik-read	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	f
00030000-55e8-154a-5262-5926c343c798	VrstaZapisa-write	Šifrant vrst zapisa - spreminjanje	f
00030000-55e8-154a-692f-68150e2da326	VrstaZapisa-read	Šifrant vrst zapisa - branje	f
00030000-55e8-154a-897e-5384a04bc0cc	Datoteka-write	Datoteka - spreminjanje	f
00030000-55e8-154a-5273-c3a2ba74d660	Datoteka-read	Datoteke - branje	f
\.


--
-- TOC entry 2912 (class 0 OID 17158714)
-- Dependencies: 177
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-55e8-154a-bbd9-1c3dad28ef4a	00030000-55e8-154a-0ca4-c73ee2098353
00020000-55e8-154a-c102-020032b34378	00030000-55e8-154a-08d3-ea3089b3ca6b
00020000-55e8-154a-cfcc-4c9e4d0f8265	00030000-55e8-154a-142a-a88ec6abffe1
00020000-55e8-154a-cfcc-4c9e4d0f8265	00030000-55e8-154a-2981-113ca1b1a82b
00020000-55e8-154a-cfcc-4c9e4d0f8265	00030000-55e8-154a-aa16-8c98c3479e52
00020000-55e8-154a-cfcc-4c9e4d0f8265	00030000-55e8-154a-be84-bb287b9d2b06
00020000-55e8-154a-cfcc-4c9e4d0f8265	00030000-55e8-154a-cd1b-9453515ebcbb
00020000-55e8-154a-cfcc-4c9e4d0f8265	00030000-55e8-154a-74cb-d40eba630cdf
00020000-55e8-154a-cfcc-4c9e4d0f8265	00030000-55e8-154a-8a53-baaec82101e0
00020000-55e8-154a-cfcc-4c9e4d0f8265	00030000-55e8-154a-083e-83f19794982c
00020000-55e8-154a-cfcc-4c9e4d0f8265	00030000-55e8-154a-08d3-ea3089b3ca6b
00020000-55e8-154a-cfcc-4c9e4d0f8265	00030000-55e8-154a-1e34-240fbaa89a17
00020000-55e8-154a-cfcc-4c9e4d0f8265	00030000-55e8-154a-c21e-cc68d753d735
00020000-55e8-154a-cfcc-4c9e4d0f8265	00030000-55e8-154a-867d-e27252575d83
00020000-55e8-154a-cfcc-4c9e4d0f8265	00030000-55e8-154a-e570-58ea42d4786f
00020000-55e8-154a-cfcc-4c9e4d0f8265	00030000-55e8-154a-af36-aa9c34445c57
00020000-55e8-154a-cfcc-4c9e4d0f8265	00030000-55e8-154a-3bfb-40e2c1cfba2e
00020000-55e8-154a-cfcc-4c9e4d0f8265	00030000-55e8-154a-8c20-4755b84109c8
00020000-55e8-154a-cfcc-4c9e4d0f8265	00030000-55e8-154a-f1b3-745b4c6aa77f
00020000-55e8-154a-cfcc-4c9e4d0f8265	00030000-55e8-154a-ad82-5dae8c60af30
00020000-55e8-154a-cfcc-4c9e4d0f8265	00030000-55e8-154a-1150-de1cff0f76a8
00020000-55e8-154a-cfcc-4c9e4d0f8265	00030000-55e8-154a-da1f-a4eb8458efa6
00020000-55e8-154a-cfcc-4c9e4d0f8265	00030000-55e8-154a-a797-bd716e58ad85
00020000-55e8-154a-cfcc-4c9e4d0f8265	00030000-55e8-154a-be2a-dec8dcd665c5
00020000-55e8-154a-cfcc-4c9e4d0f8265	00030000-55e8-154a-4a33-6ee0cdba9e24
00020000-55e8-154a-cfcc-4c9e4d0f8265	00030000-55e8-154a-08bd-534001aeca04
00020000-55e8-154a-cfcc-4c9e4d0f8265	00030000-55e8-154a-2dbb-7c6af2c18cee
00020000-55e8-154a-cfcc-4c9e4d0f8265	00030000-55e8-154a-b61f-5ae32da9bdd5
00020000-55e8-154a-cfcc-4c9e4d0f8265	00030000-55e8-154a-697f-ae4af119a364
00020000-55e8-154a-cfcc-4c9e4d0f8265	00030000-55e8-154a-bd7e-be258bd8b7da
00020000-55e8-154a-cfcc-4c9e4d0f8265	00030000-55e8-154a-7aaa-44ad2637c431
00020000-55e8-154a-cfcc-4c9e4d0f8265	00030000-55e8-154a-3893-6568c8390303
00020000-55e8-154a-cfcc-4c9e4d0f8265	00030000-55e8-154a-6f93-6be4976100d9
00020000-55e8-154a-cfcc-4c9e4d0f8265	00030000-55e8-154a-6c5f-b921e760f0d3
00020000-55e8-154a-cfcc-4c9e4d0f8265	00030000-55e8-154a-460f-463fa29b68ec
00020000-55e8-154a-cfcc-4c9e4d0f8265	00030000-55e8-154a-7b28-68207028ebcf
00020000-55e8-154a-cfcc-4c9e4d0f8265	00030000-55e8-154a-2004-ca60be908fad
00020000-55e8-154a-cfcc-4c9e4d0f8265	00030000-55e8-154a-e40a-fa1d811bd206
00020000-55e8-154a-cfcc-4c9e4d0f8265	00030000-55e8-154a-e596-0d07a6f3642d
00020000-55e8-154a-cfcc-4c9e4d0f8265	00030000-55e8-154a-0de9-ac24ad1472e3
00020000-55e8-154a-cfcc-4c9e4d0f8265	00030000-55e8-154a-8194-b250898f3659
00020000-55e8-154a-cfcc-4c9e4d0f8265	00030000-55e8-154a-e210-1031e9498796
00020000-55e8-154a-cfcc-4c9e4d0f8265	00030000-55e8-154a-af08-60c5afc7a1f2
00020000-55e8-154a-cfcc-4c9e4d0f8265	00030000-55e8-154a-f944-32616f5325e7
00020000-55e8-154a-cfcc-4c9e4d0f8265	00030000-55e8-154a-ef67-8ec493e548ad
00020000-55e8-154a-cfcc-4c9e4d0f8265	00030000-55e8-154a-0a18-bdca26788a40
00020000-55e8-154a-cfcc-4c9e4d0f8265	00030000-55e8-154a-9197-c75a3684df74
00020000-55e8-154a-cfcc-4c9e4d0f8265	00030000-55e8-154a-6019-f5b69043e98c
00020000-55e8-154a-cfcc-4c9e4d0f8265	00030000-55e8-154a-1088-51350200949a
00020000-55e8-154a-cfcc-4c9e4d0f8265	00030000-55e8-154a-ab5f-4697dbfe5ed4
00020000-55e8-154a-cfcc-4c9e4d0f8265	00030000-55e8-154a-17f6-c23cc878ebd3
00020000-55e8-154a-9d42-bf5216d1dbd4	00030000-55e8-154a-142a-a88ec6abffe1
00020000-55e8-154a-9d42-bf5216d1dbd4	00030000-55e8-154a-cd1b-9453515ebcbb
00020000-55e8-154a-9d42-bf5216d1dbd4	00030000-55e8-154a-74cb-d40eba630cdf
00020000-55e8-154a-9d42-bf5216d1dbd4	00030000-55e8-154a-08d3-ea3089b3ca6b
00020000-55e8-154a-9d42-bf5216d1dbd4	00030000-55e8-154a-e570-58ea42d4786f
00020000-55e8-154a-9d42-bf5216d1dbd4	00030000-55e8-154a-3bfb-40e2c1cfba2e
00020000-55e8-154a-9d42-bf5216d1dbd4	00030000-55e8-154a-f1b3-745b4c6aa77f
00020000-55e8-154a-9d42-bf5216d1dbd4	00030000-55e8-154a-ad82-5dae8c60af30
00020000-55e8-154a-9d42-bf5216d1dbd4	00030000-55e8-154a-1150-de1cff0f76a8
00020000-55e8-154a-9d42-bf5216d1dbd4	00030000-55e8-154a-da1f-a4eb8458efa6
00020000-55e8-154a-9d42-bf5216d1dbd4	00030000-55e8-154a-a797-bd716e58ad85
00020000-55e8-154a-9d42-bf5216d1dbd4	00030000-55e8-154a-be2a-dec8dcd665c5
00020000-55e8-154a-9d42-bf5216d1dbd4	00030000-55e8-154a-4a33-6ee0cdba9e24
00020000-55e8-154a-9d42-bf5216d1dbd4	00030000-55e8-154a-2dbb-7c6af2c18cee
00020000-55e8-154a-9d42-bf5216d1dbd4	00030000-55e8-154a-697f-ae4af119a364
00020000-55e8-154a-9d42-bf5216d1dbd4	00030000-55e8-154a-bd7e-be258bd8b7da
00020000-55e8-154a-9d42-bf5216d1dbd4	00030000-55e8-154a-7aaa-44ad2637c431
00020000-55e8-154a-9d42-bf5216d1dbd4	00030000-55e8-154a-460f-463fa29b68ec
00020000-55e8-154a-9d42-bf5216d1dbd4	00030000-55e8-154a-2004-ca60be908fad
00020000-55e8-154a-9d42-bf5216d1dbd4	00030000-55e8-154a-e596-0d07a6f3642d
00020000-55e8-154a-9d42-bf5216d1dbd4	00030000-55e8-154a-8194-b250898f3659
00020000-55e8-154a-9d42-bf5216d1dbd4	00030000-55e8-154a-f1c2-f93effa41cba
00020000-55e8-154a-9d42-bf5216d1dbd4	00030000-55e8-154a-15eb-ad60ceadd779
00020000-55e8-154a-9d42-bf5216d1dbd4	00030000-55e8-154a-29f2-585c60c07fa1
00020000-55e8-154a-9d42-bf5216d1dbd4	00030000-55e8-154a-b23b-b4c17709a737
00020000-55e8-154a-9d42-bf5216d1dbd4	00030000-55e8-154a-5e37-526a637f2dfb
00020000-55e8-154a-9d42-bf5216d1dbd4	00030000-55e8-154a-a7a6-2f71d40ab1c8
00020000-55e8-154a-9d42-bf5216d1dbd4	00030000-55e8-154a-ab5f-4697dbfe5ed4
00020000-55e8-154a-9d42-bf5216d1dbd4	00030000-55e8-154a-17f6-c23cc878ebd3
00020000-55e8-154a-0daf-0064178991ec	00030000-55e8-154a-142a-a88ec6abffe1
00020000-55e8-154a-0daf-0064178991ec	00030000-55e8-154a-aa16-8c98c3479e52
00020000-55e8-154a-0daf-0064178991ec	00030000-55e8-154a-cd1b-9453515ebcbb
00020000-55e8-154a-0daf-0064178991ec	00030000-55e8-154a-a96a-5c7e574dd7ba
00020000-55e8-154a-0daf-0064178991ec	00030000-55e8-154a-02ac-d44b375ca0b4
00020000-55e8-154a-0daf-0064178991ec	00030000-55e8-154a-b775-e12fc3db482d
00020000-55e8-154a-0daf-0064178991ec	00030000-55e8-154a-74cb-d40eba630cdf
00020000-55e8-154a-0daf-0064178991ec	00030000-55e8-154a-08d3-ea3089b3ca6b
00020000-55e8-154a-0daf-0064178991ec	00030000-55e8-154a-c21e-cc68d753d735
00020000-55e8-154a-0daf-0064178991ec	00030000-55e8-154a-e570-58ea42d4786f
00020000-55e8-154a-0daf-0064178991ec	00030000-55e8-154a-3bfb-40e2c1cfba2e
00020000-55e8-154a-0daf-0064178991ec	00030000-55e8-154a-f1b3-745b4c6aa77f
00020000-55e8-154a-0daf-0064178991ec	00030000-55e8-154a-1150-de1cff0f76a8
00020000-55e8-154a-0daf-0064178991ec	00030000-55e8-154a-da1f-a4eb8458efa6
00020000-55e8-154a-0daf-0064178991ec	00030000-55e8-154a-a797-bd716e58ad85
00020000-55e8-154a-0daf-0064178991ec	00030000-55e8-154a-4a33-6ee0cdba9e24
00020000-55e8-154a-0daf-0064178991ec	00030000-55e8-154a-2dbb-7c6af2c18cee
00020000-55e8-154a-0daf-0064178991ec	00030000-55e8-154a-7aaa-44ad2637c431
00020000-55e8-154a-0daf-0064178991ec	00030000-55e8-154a-6f93-6be4976100d9
00020000-55e8-154a-0daf-0064178991ec	00030000-55e8-154a-460f-463fa29b68ec
00020000-55e8-154a-0daf-0064178991ec	00030000-55e8-154a-2004-ca60be908fad
00020000-55e8-154a-0daf-0064178991ec	00030000-55e8-154a-e596-0d07a6f3642d
00020000-55e8-154a-0daf-0064178991ec	00030000-55e8-154a-8194-b250898f3659
00020000-55e8-154a-0daf-0064178991ec	00030000-55e8-154a-af08-60c5afc7a1f2
00020000-55e8-154a-0daf-0064178991ec	00030000-55e8-154a-0a18-bdca26788a40
00020000-55e8-154a-0daf-0064178991ec	00030000-55e8-154a-6019-f5b69043e98c
00020000-55e8-154a-0daf-0064178991ec	00030000-55e8-154a-ab5f-4697dbfe5ed4
00020000-55e8-154a-0daf-0064178991ec	00030000-55e8-154a-17f6-c23cc878ebd3
00020000-55e8-154a-1313-0a68747f0ed6	00030000-55e8-154a-142a-a88ec6abffe1
00020000-55e8-154a-1313-0a68747f0ed6	00030000-55e8-154a-2981-113ca1b1a82b
00020000-55e8-154a-1313-0a68747f0ed6	00030000-55e8-154a-be84-bb287b9d2b06
00020000-55e8-154a-1313-0a68747f0ed6	00030000-55e8-154a-cd1b-9453515ebcbb
00020000-55e8-154a-1313-0a68747f0ed6	00030000-55e8-154a-74cb-d40eba630cdf
00020000-55e8-154a-1313-0a68747f0ed6	00030000-55e8-154a-08d3-ea3089b3ca6b
00020000-55e8-154a-1313-0a68747f0ed6	00030000-55e8-154a-e570-58ea42d4786f
00020000-55e8-154a-1313-0a68747f0ed6	00030000-55e8-154a-3bfb-40e2c1cfba2e
00020000-55e8-154a-1313-0a68747f0ed6	00030000-55e8-154a-1150-de1cff0f76a8
00020000-55e8-154a-1313-0a68747f0ed6	00030000-55e8-154a-da1f-a4eb8458efa6
00020000-55e8-154a-1313-0a68747f0ed6	00030000-55e8-154a-4a33-6ee0cdba9e24
00020000-55e8-154a-1313-0a68747f0ed6	00030000-55e8-154a-2dbb-7c6af2c18cee
00020000-55e8-154a-1313-0a68747f0ed6	00030000-55e8-154a-7aaa-44ad2637c431
00020000-55e8-154a-1313-0a68747f0ed6	00030000-55e8-154a-460f-463fa29b68ec
00020000-55e8-154a-1313-0a68747f0ed6	00030000-55e8-154a-2004-ca60be908fad
00020000-55e8-154a-1313-0a68747f0ed6	00030000-55e8-154a-e596-0d07a6f3642d
00020000-55e8-154a-1313-0a68747f0ed6	00030000-55e8-154a-8194-b250898f3659
00020000-55e8-154a-1313-0a68747f0ed6	00030000-55e8-154a-af08-60c5afc7a1f2
00020000-55e8-154a-1313-0a68747f0ed6	00030000-55e8-154a-ab5f-4697dbfe5ed4
00020000-55e8-154a-1313-0a68747f0ed6	00030000-55e8-154a-17f6-c23cc878ebd3
00020000-55e8-154a-9621-ebfe84c9bce4	00030000-55e8-154a-142a-a88ec6abffe1
00020000-55e8-154a-9621-ebfe84c9bce4	00030000-55e8-154a-cd1b-9453515ebcbb
00020000-55e8-154a-9621-ebfe84c9bce4	00030000-55e8-154a-74cb-d40eba630cdf
00020000-55e8-154a-9621-ebfe84c9bce4	00030000-55e8-154a-08d3-ea3089b3ca6b
00020000-55e8-154a-9621-ebfe84c9bce4	00030000-55e8-154a-e570-58ea42d4786f
00020000-55e8-154a-9621-ebfe84c9bce4	00030000-55e8-154a-3bfb-40e2c1cfba2e
00020000-55e8-154a-9621-ebfe84c9bce4	00030000-55e8-154a-1150-de1cff0f76a8
00020000-55e8-154a-9621-ebfe84c9bce4	00030000-55e8-154a-da1f-a4eb8458efa6
00020000-55e8-154a-9621-ebfe84c9bce4	00030000-55e8-154a-4a33-6ee0cdba9e24
00020000-55e8-154a-9621-ebfe84c9bce4	00030000-55e8-154a-2dbb-7c6af2c18cee
00020000-55e8-154a-9621-ebfe84c9bce4	00030000-55e8-154a-7aaa-44ad2637c431
00020000-55e8-154a-9621-ebfe84c9bce4	00030000-55e8-154a-460f-463fa29b68ec
00020000-55e8-154a-9621-ebfe84c9bce4	00030000-55e8-154a-2004-ca60be908fad
00020000-55e8-154a-9621-ebfe84c9bce4	00030000-55e8-154a-e596-0d07a6f3642d
00020000-55e8-154a-9621-ebfe84c9bce4	00030000-55e8-154a-8194-b250898f3659
00020000-55e8-154a-9621-ebfe84c9bce4	00030000-55e8-154a-7595-37cc7a20ef6d
00020000-55e8-154a-9621-ebfe84c9bce4	00030000-55e8-154a-bf16-34af06c607f5
00020000-55e8-154a-9621-ebfe84c9bce4	00030000-55e8-154a-af08-60c5afc7a1f2
00020000-55e8-154a-9621-ebfe84c9bce4	00030000-55e8-154a-ab5f-4697dbfe5ed4
00020000-55e8-154a-9621-ebfe84c9bce4	00030000-55e8-154a-17f6-c23cc878ebd3
00020000-55e8-154b-f407-886b1cbd3333	00030000-55e8-154a-faec-761b78768ac6
00020000-55e8-154b-f407-886b1cbd3333	00030000-55e8-154a-0ca4-c73ee2098353
00020000-55e8-154b-f407-886b1cbd3333	00030000-55e8-154a-bf16-34af06c607f5
00020000-55e8-154b-f407-886b1cbd3333	00030000-55e8-154a-8a53-baaec82101e0
00020000-55e8-154b-f407-886b1cbd3333	00030000-55e8-154a-7a49-d53f6c906c7b
00020000-55e8-154b-f407-886b1cbd3333	00030000-55e8-154a-d92f-aa4c632823ef
00020000-55e8-154b-f407-886b1cbd3333	00030000-55e8-154a-7390-88325606371f
00020000-55e8-154b-f407-886b1cbd3333	00030000-55e8-154a-142a-a88ec6abffe1
00020000-55e8-154b-f407-886b1cbd3333	00030000-55e8-154a-2981-113ca1b1a82b
00020000-55e8-154b-f407-886b1cbd3333	00030000-55e8-154a-aa16-8c98c3479e52
00020000-55e8-154b-f407-886b1cbd3333	00030000-55e8-154a-be84-bb287b9d2b06
00020000-55e8-154b-f407-886b1cbd3333	00030000-55e8-154a-cd1b-9453515ebcbb
00020000-55e8-154b-f407-886b1cbd3333	00030000-55e8-154a-a96a-5c7e574dd7ba
00020000-55e8-154b-f407-886b1cbd3333	00030000-55e8-154a-02ac-d44b375ca0b4
00020000-55e8-154b-f407-886b1cbd3333	00030000-55e8-154a-8047-5abb28cb3e93
00020000-55e8-154b-f407-886b1cbd3333	00030000-55e8-154a-b775-e12fc3db482d
00020000-55e8-154b-f407-886b1cbd3333	00030000-55e8-154a-148b-55605865bc18
00020000-55e8-154b-f407-886b1cbd3333	00030000-55e8-154a-74cb-d40eba630cdf
00020000-55e8-154b-f407-886b1cbd3333	00030000-55e8-154a-083e-83f19794982c
00020000-55e8-154b-f407-886b1cbd3333	00030000-55e8-154a-08d3-ea3089b3ca6b
00020000-55e8-154b-f407-886b1cbd3333	00030000-55e8-154a-1e34-240fbaa89a17
00020000-55e8-154b-f407-886b1cbd3333	00030000-55e8-154a-b11a-bbe6288d3b88
00020000-55e8-154b-f407-886b1cbd3333	00030000-55e8-154a-acec-5ed721451803
00020000-55e8-154b-f407-886b1cbd3333	00030000-55e8-154a-386f-552aae98628a
00020000-55e8-154b-f407-886b1cbd3333	00030000-55e8-154a-17fe-6db46deaac7b
00020000-55e8-154b-f407-886b1cbd3333	00030000-55e8-154a-c21e-cc68d753d735
00020000-55e8-154b-f407-886b1cbd3333	00030000-55e8-154a-867d-e27252575d83
00020000-55e8-154b-f407-886b1cbd3333	00030000-55e8-154a-e570-58ea42d4786f
00020000-55e8-154b-f407-886b1cbd3333	00030000-55e8-154a-af36-aa9c34445c57
00020000-55e8-154b-f407-886b1cbd3333	00030000-55e8-154a-3bfb-40e2c1cfba2e
00020000-55e8-154b-f407-886b1cbd3333	00030000-55e8-154a-8c20-4755b84109c8
00020000-55e8-154b-f407-886b1cbd3333	00030000-55e8-154a-f1b3-745b4c6aa77f
00020000-55e8-154b-f407-886b1cbd3333	00030000-55e8-154a-ad82-5dae8c60af30
00020000-55e8-154b-f407-886b1cbd3333	00030000-55e8-154a-e16a-1f8a06860ebe
00020000-55e8-154b-f407-886b1cbd3333	00030000-55e8-154a-e972-ca4c9ca048d3
00020000-55e8-154b-f407-886b1cbd3333	00030000-55e8-154a-c30c-e78452645876
00020000-55e8-154b-f407-886b1cbd3333	00030000-55e8-154a-027c-bf2ea682ad82
00020000-55e8-154b-f407-886b1cbd3333	00030000-55e8-154a-1150-de1cff0f76a8
00020000-55e8-154b-f407-886b1cbd3333	00030000-55e8-154a-b098-0bcbb4763b7b
00020000-55e8-154b-f407-886b1cbd3333	00030000-55e8-154a-da1f-a4eb8458efa6
00020000-55e8-154b-f407-886b1cbd3333	00030000-55e8-154a-3c89-1e42b3fe75e6
00020000-55e8-154b-f407-886b1cbd3333	00030000-55e8-154a-a797-bd716e58ad85
00020000-55e8-154b-f407-886b1cbd3333	00030000-55e8-154a-be2a-dec8dcd665c5
00020000-55e8-154b-f407-886b1cbd3333	00030000-55e8-154a-01dd-1d08acee8ba8
00020000-55e8-154b-f407-886b1cbd3333	00030000-55e8-154a-5fbc-439297d7dbf3
00020000-55e8-154b-f407-886b1cbd3333	00030000-55e8-154a-e08c-065cb102b1c8
00020000-55e8-154b-f407-886b1cbd3333	00030000-55e8-154a-3bec-54ad49efa969
00020000-55e8-154b-f407-886b1cbd3333	00030000-55e8-154a-69d1-c1f5b28fb769
00020000-55e8-154b-f407-886b1cbd3333	00030000-55e8-154a-898c-8553ebee36a9
00020000-55e8-154b-f407-886b1cbd3333	00030000-55e8-154a-4a33-6ee0cdba9e24
00020000-55e8-154b-f407-886b1cbd3333	00030000-55e8-154a-08bd-534001aeca04
00020000-55e8-154b-f407-886b1cbd3333	00030000-55e8-154a-2dbb-7c6af2c18cee
00020000-55e8-154b-f407-886b1cbd3333	00030000-55e8-154a-b61f-5ae32da9bdd5
00020000-55e8-154b-f407-886b1cbd3333	00030000-55e8-154a-b301-6fe768e7133a
00020000-55e8-154b-f407-886b1cbd3333	00030000-55e8-154a-c08e-130654f97480
00020000-55e8-154b-f407-886b1cbd3333	00030000-55e8-154a-697f-ae4af119a364
00020000-55e8-154b-f407-886b1cbd3333	00030000-55e8-154a-bd7e-be258bd8b7da
00020000-55e8-154b-f407-886b1cbd3333	00030000-55e8-154a-7aaa-44ad2637c431
00020000-55e8-154b-f407-886b1cbd3333	00030000-55e8-154a-3893-6568c8390303
00020000-55e8-154b-f407-886b1cbd3333	00030000-55e8-154a-5ed2-7b80de7a0945
00020000-55e8-154b-f407-886b1cbd3333	00030000-55e8-154a-0915-1cee5eb6a3e9
00020000-55e8-154b-f407-886b1cbd3333	00030000-55e8-154a-fb22-e49db91d3936
00020000-55e8-154b-f407-886b1cbd3333	00030000-55e8-154a-4ba9-f3bf45152152
00020000-55e8-154b-f407-886b1cbd3333	00030000-55e8-154a-6f93-6be4976100d9
00020000-55e8-154b-f407-886b1cbd3333	00030000-55e8-154a-6c5f-b921e760f0d3
00020000-55e8-154b-f407-886b1cbd3333	00030000-55e8-154a-1ea1-813f7d9bb3f4
00020000-55e8-154b-f407-886b1cbd3333	00030000-55e8-154a-39e0-24e0c0d28c63
00020000-55e8-154b-f407-886b1cbd3333	00030000-55e8-154a-5b46-c747fec6291a
00020000-55e8-154b-f407-886b1cbd3333	00030000-55e8-154a-825f-f2e99e301e26
00020000-55e8-154b-f407-886b1cbd3333	00030000-55e8-154a-d714-4d00549b6bf8
00020000-55e8-154b-f407-886b1cbd3333	00030000-55e8-154a-1ce3-13fd7e31077f
00020000-55e8-154b-f407-886b1cbd3333	00030000-55e8-154a-9941-249cffee8089
00020000-55e8-154b-f407-886b1cbd3333	00030000-55e8-154a-3cf2-b6ccb4f00e97
00020000-55e8-154b-f407-886b1cbd3333	00030000-55e8-154a-1cc4-2fcf51757306
00020000-55e8-154b-f407-886b1cbd3333	00030000-55e8-154a-db74-a64eea254ba3
00020000-55e8-154b-f407-886b1cbd3333	00030000-55e8-154a-6e88-a1c27c009786
00020000-55e8-154b-f407-886b1cbd3333	00030000-55e8-154a-ddd2-f1c42d96a528
00020000-55e8-154b-f407-886b1cbd3333	00030000-55e8-154a-cd92-5c0fbe7ed40a
00020000-55e8-154b-f407-886b1cbd3333	00030000-55e8-154a-f8a6-b659f5b218f0
00020000-55e8-154b-f407-886b1cbd3333	00030000-55e8-154a-d286-2963cb2a5668
00020000-55e8-154b-f407-886b1cbd3333	00030000-55e8-154a-2872-47f26a6770fd
00020000-55e8-154b-f407-886b1cbd3333	00030000-55e8-154a-6e8d-b65226ddb5e6
00020000-55e8-154b-f407-886b1cbd3333	00030000-55e8-154a-15c1-27846af316be
00020000-55e8-154b-f407-886b1cbd3333	00030000-55e8-154a-146e-47212b4b6dcc
00020000-55e8-154b-f407-886b1cbd3333	00030000-55e8-154a-f74f-8c6b2101953b
00020000-55e8-154b-f407-886b1cbd3333	00030000-55e8-154a-460f-463fa29b68ec
00020000-55e8-154b-f407-886b1cbd3333	00030000-55e8-154a-7b28-68207028ebcf
00020000-55e8-154b-f407-886b1cbd3333	00030000-55e8-154a-2951-531e65d56af7
00020000-55e8-154b-f407-886b1cbd3333	00030000-55e8-154a-18ff-6fe04d327edb
00020000-55e8-154b-f407-886b1cbd3333	00030000-55e8-154a-f44e-fb01eb1a47c8
00020000-55e8-154b-f407-886b1cbd3333	00030000-55e8-154a-a50e-229975d5d075
00020000-55e8-154b-f407-886b1cbd3333	00030000-55e8-154a-2004-ca60be908fad
00020000-55e8-154b-f407-886b1cbd3333	00030000-55e8-154a-e40a-fa1d811bd206
00020000-55e8-154b-f407-886b1cbd3333	00030000-55e8-154a-e596-0d07a6f3642d
00020000-55e8-154b-f407-886b1cbd3333	00030000-55e8-154a-0de9-ac24ad1472e3
00020000-55e8-154b-f407-886b1cbd3333	00030000-55e8-154a-c0b2-29a7a62a76ba
00020000-55e8-154b-f407-886b1cbd3333	00030000-55e8-154a-526f-becf0f07a60b
00020000-55e8-154b-f407-886b1cbd3333	00030000-55e8-154a-a455-3f2b9d9eb6b8
00020000-55e8-154b-f407-886b1cbd3333	00030000-55e8-154a-0a1f-71c5c84f66d8
00020000-55e8-154b-f407-886b1cbd3333	00030000-55e8-154a-c298-4f864c7440b2
00020000-55e8-154b-f407-886b1cbd3333	00030000-55e8-154a-40e6-221c775aa800
00020000-55e8-154b-f407-886b1cbd3333	00030000-55e8-154a-c1ba-9fc24ca293b1
00020000-55e8-154b-f407-886b1cbd3333	00030000-55e8-154a-85c4-51bee7d71c4b
00020000-55e8-154b-f407-886b1cbd3333	00030000-55e8-154a-8194-b250898f3659
00020000-55e8-154b-f407-886b1cbd3333	00030000-55e8-154a-e210-1031e9498796
00020000-55e8-154b-f407-886b1cbd3333	00030000-55e8-154a-bc51-ed21472a4f37
00020000-55e8-154b-f407-886b1cbd3333	00030000-55e8-154a-cc52-fcae31662095
00020000-55e8-154b-f407-886b1cbd3333	00030000-55e8-154a-a034-1465775b2964
00020000-55e8-154b-f407-886b1cbd3333	00030000-55e8-154a-9f32-b0c6f32c1655
00020000-55e8-154b-f407-886b1cbd3333	00030000-55e8-154a-c83c-88d86f5b9592
00020000-55e8-154b-f407-886b1cbd3333	00030000-55e8-154a-0acc-ecc706775902
00020000-55e8-154b-f407-886b1cbd3333	00030000-55e8-154a-d033-9182ec79f07a
00020000-55e8-154b-f407-886b1cbd3333	00030000-55e8-154a-de63-154b695468e7
00020000-55e8-154b-f407-886b1cbd3333	00030000-55e8-154a-f1c2-f93effa41cba
00020000-55e8-154b-f407-886b1cbd3333	00030000-55e8-154a-15eb-ad60ceadd779
00020000-55e8-154b-f407-886b1cbd3333	00030000-55e8-154a-7595-37cc7a20ef6d
00020000-55e8-154b-f407-886b1cbd3333	00030000-55e8-154a-8edb-95f007c91a4a
00020000-55e8-154b-f407-886b1cbd3333	00030000-55e8-154a-af08-60c5afc7a1f2
00020000-55e8-154b-f407-886b1cbd3333	00030000-55e8-154a-770c-b634fd12eaca
00020000-55e8-154b-f407-886b1cbd3333	00030000-55e8-154a-b072-93e353ac1dba
00020000-55e8-154b-f407-886b1cbd3333	00030000-55e8-154a-b26d-d2b91dc2e169
00020000-55e8-154b-f407-886b1cbd3333	00030000-55e8-154a-29f2-585c60c07fa1
00020000-55e8-154b-f407-886b1cbd3333	00030000-55e8-154a-b23b-b4c17709a737
00020000-55e8-154b-f407-886b1cbd3333	00030000-55e8-154a-f944-32616f5325e7
00020000-55e8-154b-f407-886b1cbd3333	00030000-55e8-154a-ef67-8ec493e548ad
00020000-55e8-154b-f407-886b1cbd3333	00030000-55e8-154a-0a18-bdca26788a40
00020000-55e8-154b-f407-886b1cbd3333	00030000-55e8-154a-9197-c75a3684df74
00020000-55e8-154b-f407-886b1cbd3333	00030000-55e8-154a-2a58-30e1abd39281
00020000-55e8-154b-f407-886b1cbd3333	00030000-55e8-154a-7d6b-9b60e566791b
00020000-55e8-154b-f407-886b1cbd3333	00030000-55e8-154a-8959-842552411cec
00020000-55e8-154b-f407-886b1cbd3333	00030000-55e8-154a-5c35-b4ef6a72da37
00020000-55e8-154b-f407-886b1cbd3333	00030000-55e8-154a-5e37-526a637f2dfb
00020000-55e8-154b-f407-886b1cbd3333	00030000-55e8-154a-a7a6-2f71d40ab1c8
00020000-55e8-154b-f407-886b1cbd3333	00030000-55e8-154a-6019-f5b69043e98c
00020000-55e8-154b-f407-886b1cbd3333	00030000-55e8-154a-1088-51350200949a
00020000-55e8-154b-f407-886b1cbd3333	00030000-55e8-154a-ab5f-4697dbfe5ed4
00020000-55e8-154b-f407-886b1cbd3333	00030000-55e8-154a-2a89-8efa1521d477
00020000-55e8-154b-f407-886b1cbd3333	00030000-55e8-154a-17f6-c23cc878ebd3
00020000-55e8-154b-f407-886b1cbd3333	00030000-55e8-154a-d5fe-a2a3dd0a939c
\.


--
-- TOC entry 2939 (class 0 OID 17159009)
-- Dependencies: 204
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 2943 (class 0 OID 17159043)
-- Dependencies: 208
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 2954 (class 0 OID 17159167)
-- Dependencies: 219
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, zacetek, konec, placilonavajo, vrednostvaje, planiranostevilovaj, vrednostvaj, vrednostpredstave, vrednostdopremiere, aktivna, zaposlenvdrjz, samozaposlen, igralec, opis) FROM stdin;
000b0000-55e8-154c-dd71-99e967d59954	00090000-55e8-154c-df65-a991201c28a2	\N	\N	0001	\N	\N	f	10.00	3	10.00	30.00	10.00	t	t	f	t	Pogodba o sodelovanju
000b0000-55e8-154c-0baa-5f859a0afb5d	00090000-55e8-154c-8ffd-2e33be6e85b4	\N	\N	0002	\N	\N	t	11.00	10	11.00	31.00	110.00	t	f	t	t	Pogodba za vlogo Helena
000b0000-55e8-154c-d3ad-d74eac4173a1	00090000-55e8-154c-bd63-6d7bdd81be68	\N	\N	0003	\N	\N	f	12.00	4	12.00	32.00	12.00	t	f	t	f	Pogodba za lektoriranje
\.


--
-- TOC entry 2917 (class 0 OID 17158774)
-- Dependencies: 182
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, drzava_id, sifra, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo, nvo) FROM stdin;
00080000-55e8-154b-2056-e4fef69ec416	00040000-55e8-154a-4f83-8c49c8e91f9b	0988	AK	Juhuhu d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55e8-154b-0013-05d1ef0de420	00040000-55e8-154a-4f83-8c49c8e91f9b	0989	AK	Hopsasa d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	t
00080000-55e8-154b-4fe3-7510a3257b0e	00040000-55e8-154a-4f83-8c49c8e91f9b	0987	AK	Gledališče Šrum d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55e8-154b-22f1-0ca9a4c27350	00040000-55e8-154a-4f83-8c49c8e91f9b	0986	AK	Lutkovni Direndaj d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55e8-154b-59c6-2d21f1978b17	00040000-55e8-154a-4f83-8c49c8e91f9b	0985	AK	Tatjana Stanič, Lektoriranje, s.p.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55e8-154b-2493-3f9d922afdae	00040000-55e8-154a-9471-2a0a28ce351b	0984	AK	Gledališče Lepote tvoje		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55e8-154b-9115-7707ffe52160	00040000-55e8-154a-aefb-be9ad50388dd	0983	AK	Sunce naše		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55e8-154b-5f9f-5cbbecc1a4cb	00040000-55e8-154a-44a2-fc42be255078	0982	AK	Theater Amadeus		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55e8-154d-0b00-f6ca712b826b	00040000-55e8-154a-4f83-8c49c8e91f9b	1001	AK	Gledališče Matica		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
\.


--
-- TOC entry 2919 (class 0 OID 17158808)
-- Dependencies: 184
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-55e8-1549-0de4-f744afa3f4c9	8341	Adlešiči
00050000-55e8-1549-8bdd-48ad74943a4f	5270	Ajdovščina
00050000-55e8-1549-3366-e4cd566af169	6280	Ankaran/Ancarano
00050000-55e8-1549-cbc3-29afbff602e1	9253	Apače
00050000-55e8-1549-c2e5-508f7ab5f025	8253	Artiče
00050000-55e8-1549-0abb-00b5df150704	4275	Begunje na Gorenjskem
00050000-55e8-1549-db88-55573278b0b3	1382	Begunje pri Cerknici
00050000-55e8-1549-d183-c6b71b74acdf	9231	Beltinci
00050000-55e8-1549-3478-396b546273b6	2234	Benedikt
00050000-55e8-1549-9fdd-1ee9dcb2a969	2345	Bistrica ob Dravi
00050000-55e8-1549-b31f-0baa4b0c8d2b	3256	Bistrica ob Sotli
00050000-55e8-1549-47fc-64500f44065c	8259	Bizeljsko
00050000-55e8-1549-b99c-93a68306c693	1223	Blagovica
00050000-55e8-1549-49a3-eb72fdd8cdf9	8283	Blanca
00050000-55e8-1549-0a00-e82a0026715f	4260	Bled
00050000-55e8-1549-f6e5-b31930de7fa5	4273	Blejska Dobrava
00050000-55e8-1549-3515-813344591271	9265	Bodonci
00050000-55e8-1549-53c4-2730c70b45cc	9222	Bogojina
00050000-55e8-1549-0544-4c2d6ef7b3da	4263	Bohinjska Bela
00050000-55e8-1549-ac0b-2bb128db7064	4264	Bohinjska Bistrica
00050000-55e8-1549-253d-cf569018cfea	4265	Bohinjsko jezero
00050000-55e8-1549-3bd4-5364c2477450	1353	Borovnica
00050000-55e8-1549-61d4-06654c2345ef	8294	Boštanj
00050000-55e8-1549-20dc-5556a7449e9d	5230	Bovec
00050000-55e8-1549-1dbd-d9cef83d1506	5295	Branik
00050000-55e8-1549-6404-40575cb16156	3314	Braslovče
00050000-55e8-1549-23f9-2fd72c956bc5	5223	Breginj
00050000-55e8-1549-ee18-3d7681643432	8280	Brestanica
00050000-55e8-1549-1f18-c8fe2a7578a5	2354	Bresternica
00050000-55e8-1549-8eba-5a64a36bd127	4243	Brezje
00050000-55e8-1549-06c5-60c5ec7c4728	1351	Brezovica pri Ljubljani
00050000-55e8-1549-8a82-bac350570da6	8250	Brežice
00050000-55e8-1549-2ec7-e88f370f4a73	4210	Brnik - Aerodrom
00050000-55e8-1549-0e27-5ca82415aca0	8321	Brusnice
00050000-55e8-1549-f639-7650fb3f02b1	3255	Buče
00050000-55e8-1549-9373-4e2ef93f2117	8276	Bučka 
00050000-55e8-1549-b6ff-eabc53c11737	9261	Cankova
00050000-55e8-1549-fedd-ae1cdf5f2439	3000	Celje 
00050000-55e8-1549-2c6f-0c966383ae7e	3001	Celje - poštni predali
00050000-55e8-1549-e647-09f56c457c17	4207	Cerklje na Gorenjskem
00050000-55e8-1549-e739-b18205bf9a40	8263	Cerklje ob Krki
00050000-55e8-1549-3f5c-0e5d0040b13f	1380	Cerknica
00050000-55e8-1549-cfbe-e7a23100baf9	5282	Cerkno
00050000-55e8-1549-4205-016fb79425c6	2236	Cerkvenjak
00050000-55e8-1549-4f2f-ee53f35bb958	2215	Ceršak
00050000-55e8-1549-7eb5-7260596bf670	2326	Cirkovce
00050000-55e8-1549-9476-36411a80c0e2	2282	Cirkulane
00050000-55e8-1549-f3b4-fa773be5066d	5273	Col
00050000-55e8-1549-5891-7cc7e3365071	8251	Čatež ob Savi
00050000-55e8-1549-f264-d93ba64b2d4a	1413	Čemšenik
00050000-55e8-1549-2f8f-fb58169c28f4	5253	Čepovan
00050000-55e8-1549-7474-d770d400e300	9232	Črenšovci
00050000-55e8-1549-b718-fc6312198f8e	2393	Črna na Koroškem
00050000-55e8-1549-3ba5-fc546b636e99	6275	Črni Kal
00050000-55e8-1549-4734-821f9dcafaba	5274	Črni Vrh nad Idrijo
00050000-55e8-1549-053a-835ae7b7bde6	5262	Črniče
00050000-55e8-1549-e413-958b8f4c15f0	8340	Črnomelj
00050000-55e8-1549-5281-7187f3c7d031	6271	Dekani
00050000-55e8-1549-cb6e-cedbe90914ef	5210	Deskle
00050000-55e8-1549-5909-a096fbe732ee	2253	Destrnik
00050000-55e8-1549-e70d-c7c7a50f86dd	6215	Divača
00050000-55e8-1549-a719-23982d9bf29c	1233	Dob
00050000-55e8-1549-ec25-6272885a1a4a	3224	Dobje pri Planini
00050000-55e8-1549-366e-25390cc0bc27	8257	Dobova
00050000-55e8-1549-d8e8-41d850147e26	1423	Dobovec
00050000-55e8-1549-f228-ecf4e7f78f2f	5263	Dobravlje
00050000-55e8-1549-01ef-43c829ec75c5	3204	Dobrna
00050000-55e8-1549-d9f1-96934aa3be65	8211	Dobrnič
00050000-55e8-1549-27b3-c89de3f93ffb	1356	Dobrova
00050000-55e8-1549-ef2e-74e113b8ece1	9223	Dobrovnik/Dobronak 
00050000-55e8-1549-4c65-882ec2c33fd2	5212	Dobrovo v Brdih
00050000-55e8-1549-ba6e-06c82868ea1f	1431	Dol pri Hrastniku
00050000-55e8-1549-f316-b35bb4870a76	1262	Dol pri Ljubljani
00050000-55e8-1549-9af3-ba0b2de66c85	1273	Dole pri Litiji
00050000-55e8-1549-fdeb-8eb5a31f552d	1331	Dolenja vas
00050000-55e8-1549-b83f-8066d52a6959	8350	Dolenjske Toplice
00050000-55e8-1549-6444-232604427059	1230	Domžale
00050000-55e8-1549-3883-9eeacab00c97	2252	Dornava
00050000-55e8-1549-82cf-58b9eaae731e	5294	Dornberk
00050000-55e8-1549-026c-4a926a633c6c	1319	Draga
00050000-55e8-1549-8acc-4aa6b4f22df0	8343	Dragatuš
00050000-55e8-1549-37c6-5dbc80aaa2b3	3222	Dramlje
00050000-55e8-1549-f1da-d1a0e52f00af	2370	Dravograd
00050000-55e8-1549-7751-5eed364d566b	4203	Duplje
00050000-55e8-1549-a7af-b61136aaa4bf	6221	Dutovlje
00050000-55e8-1549-83bd-7392756c98bd	8361	Dvor
00050000-55e8-1549-73f3-9586b3426337	2343	Fala
00050000-55e8-1549-e3cf-70df4b6df8b4	9208	Fokovci
00050000-55e8-1549-2f8f-e4d51857cd20	2313	Fram
00050000-55e8-1549-d986-e9805461c6d6	3213	Frankolovo
00050000-55e8-1549-aec8-0d5369a9488a	1274	Gabrovka
00050000-55e8-1549-f75e-a30101034e6f	8254	Globoko
00050000-55e8-1549-9f78-d4130f6decae	5275	Godovič
00050000-55e8-1549-4fb2-5e3d3e899d0e	4204	Golnik
00050000-55e8-1549-b59b-4c46fad75946	3303	Gomilsko
00050000-55e8-1549-2ae5-1005024eb589	4224	Gorenja vas
00050000-55e8-1549-85d4-485cecefe117	3263	Gorica pri Slivnici
00050000-55e8-1549-c973-cf58a60cbe7e	2272	Gorišnica
00050000-55e8-1549-c201-abb92c7d12bd	9250	Gornja Radgona
00050000-55e8-1549-3975-6555c4b4eaa6	3342	Gornji Grad
00050000-55e8-1549-92f4-f1033497522e	4282	Gozd Martuljek
00050000-55e8-1549-c7e2-1a70be9d5ca8	6272	Gračišče
00050000-55e8-1549-3824-087271062edb	9264	Grad
00050000-55e8-1549-cb78-149b005bec12	8332	Gradac
00050000-55e8-1549-7f33-65e72dd48c8d	1384	Grahovo
00050000-55e8-1549-d401-7a1b98727835	5242	Grahovo ob Bači
00050000-55e8-1549-892a-5f44adc2474d	5251	Grgar
00050000-55e8-1549-ccb2-dd682743c62e	3302	Griže
00050000-55e8-1549-7ebe-10141f6a4559	3231	Grobelno
00050000-55e8-1549-ac35-333241a58b03	1290	Grosuplje
00050000-55e8-1549-3c3e-21bcb3fa7ac4	2288	Hajdina
00050000-55e8-1549-029a-bd6e61419945	8362	Hinje
00050000-55e8-1549-ec07-5c7a6de5f19b	2311	Hoče
00050000-55e8-1549-21b5-ca386f2e5ea2	9205	Hodoš/Hodos
00050000-55e8-1549-8f39-5c33480f775a	1354	Horjul
00050000-55e8-1549-f846-24ad580c1cd3	1372	Hotedršica
00050000-55e8-1549-bce8-66adfcf815fd	1430	Hrastnik
00050000-55e8-1549-bef8-8c52322c0a5a	6225	Hruševje
00050000-55e8-1549-8569-2f38378726b3	4276	Hrušica
00050000-55e8-1549-ab0b-c040c9d49b84	5280	Idrija
00050000-55e8-1549-2562-c2068bf28d56	1292	Ig
00050000-55e8-1549-c46f-059390ae8468	6250	Ilirska Bistrica
00050000-55e8-1549-78be-2920ea6431c9	6251	Ilirska Bistrica-Trnovo
00050000-55e8-1549-5d7b-cc988f6cba63	1295	Ivančna Gorica
00050000-55e8-1549-8e2e-cab3120e3c0e	2259	Ivanjkovci
00050000-55e8-1549-c331-3ae30ff26bad	1411	Izlake
00050000-55e8-1549-b4eb-af6b080251fc	6310	Izola/Isola
00050000-55e8-1549-39a5-85aaec9ccfd6	2222	Jakobski Dol
00050000-55e8-1549-da42-7fce0949ab4b	2221	Jarenina
00050000-55e8-1549-64b5-77b0d80e2451	6254	Jelšane
00050000-55e8-1549-ea1d-9a20b9e6855f	4270	Jesenice
00050000-55e8-1549-6e23-adac911b975d	8261	Jesenice na Dolenjskem
00050000-55e8-1549-0d2b-a621f13462e4	3273	Jurklošter
00050000-55e8-1549-c5ee-2d9dff8562c0	2223	Jurovski Dol
00050000-55e8-1549-69c8-fd7b9ff89b06	2256	Juršinci
00050000-55e8-1549-a720-d1a0e483ad6b	5214	Kal nad Kanalom
00050000-55e8-1549-d455-9a9f8ce0f5d8	3233	Kalobje
00050000-55e8-1549-262c-95c0cd25321d	4246	Kamna Gorica
00050000-55e8-1549-d1da-4ff60114e5f7	2351	Kamnica
00050000-55e8-1549-cdc3-c1621d6fe561	1241	Kamnik
00050000-55e8-1549-cd1e-e527e7c1c795	5213	Kanal
00050000-55e8-1549-4891-7393c468f78f	8258	Kapele
00050000-55e8-1549-6675-8bbb20563550	2362	Kapla
00050000-55e8-1549-9c76-0bdf889b7c7b	2325	Kidričevo
00050000-55e8-1549-0950-2e6d172a65bd	1412	Kisovec
00050000-55e8-1549-66af-7d237af4d703	6253	Knežak
00050000-55e8-1549-b5f9-39eae3010c7c	5222	Kobarid
00050000-55e8-1549-c483-97ad8f475e94	9227	Kobilje
00050000-55e8-1549-13c1-837d81cc4eed	1330	Kočevje
00050000-55e8-1549-8356-1cbab37a149f	1338	Kočevska Reka
00050000-55e8-1549-2e75-b21697aaeebb	2276	Kog
00050000-55e8-1549-529d-4e5ca0f53acd	5211	Kojsko
00050000-55e8-1549-3409-f26ff6736774	6223	Komen
00050000-55e8-1549-72e3-65a8a1cdd38a	1218	Komenda
00050000-55e8-1549-8478-17e9a9888344	6000	Koper/Capodistria 
00050000-55e8-1549-4a44-8bc7cf34d2a8	6001	Koper/Capodistria - poštni predali
00050000-55e8-1549-760d-4a804a34fcf9	8282	Koprivnica
00050000-55e8-1549-cd24-d8b2e768354b	5296	Kostanjevica na Krasu
00050000-55e8-1549-9720-d044a4091541	8311	Kostanjevica na Krki
00050000-55e8-1549-ed46-ad47259ecfe8	1336	Kostel
00050000-55e8-1549-9bee-11acd4fe7871	6256	Košana
00050000-55e8-1549-9181-65b6675f7d4a	2394	Kotlje
00050000-55e8-1549-0b0d-de9820f4ca54	6240	Kozina
00050000-55e8-1549-e3e3-e0ae830dc6c5	3260	Kozje
00050000-55e8-1549-5116-6a1da99dda7c	4000	Kranj 
00050000-55e8-1549-d324-1715ffacbf04	4001	Kranj - poštni predali
00050000-55e8-1549-928d-d11073ce675d	4280	Kranjska Gora
00050000-55e8-1549-4946-3d53c1ee6e2f	1281	Kresnice
00050000-55e8-1549-8aaa-8ee0163dad49	4294	Križe
00050000-55e8-1549-f24a-22dcfa64fbaf	9206	Križevci
00050000-55e8-1549-48e5-e5cef2dde965	9242	Križevci pri Ljutomeru
00050000-55e8-1549-d892-ef4557f5b13c	1301	Krka
00050000-55e8-1549-9391-dddd6354d6a9	8296	Krmelj
00050000-55e8-1549-7eea-9e30ed6762e0	4245	Kropa
00050000-55e8-1549-6127-d0ceb75dc722	8262	Krška vas
00050000-55e8-1549-ee54-68cb637824da	8270	Krško
00050000-55e8-1549-c069-f6bf553c8f85	9263	Kuzma
00050000-55e8-1549-2390-c5c557981c96	2318	Laporje
00050000-55e8-1549-7fc6-b467ca1f12af	3270	Laško
00050000-55e8-1549-9f4f-cac09d9998e4	1219	Laze v Tuhinju
00050000-55e8-1549-d7a2-91146ce758da	2230	Lenart v Slovenskih goricah
00050000-55e8-1549-aa4f-3479be20f23b	9220	Lendava/Lendva
00050000-55e8-1549-4b81-f880e3a4a057	4248	Lesce
00050000-55e8-1549-c8c3-58efe2fea500	3261	Lesično
00050000-55e8-1549-3d77-960e9bd0ebd2	8273	Leskovec pri Krškem
00050000-55e8-1549-bda9-8f1d69c97672	2372	Libeliče
00050000-55e8-1549-6898-3c4af6a88939	2341	Limbuš
00050000-55e8-1549-1d59-aaadd906bf02	1270	Litija
00050000-55e8-1549-2731-6d6e420fa19e	3202	Ljubečna
00050000-55e8-1549-95f0-7a2b2f52a320	1000	Ljubljana 
00050000-55e8-1549-ef19-b77208fea362	1001	Ljubljana - poštni predali
00050000-55e8-1549-b6e8-1971aaa3e19d	1231	Ljubljana - Črnuče
00050000-55e8-1549-dc53-4d242d4b8028	1261	Ljubljana - Dobrunje
00050000-55e8-1549-757d-1157298c965a	1260	Ljubljana - Polje
00050000-55e8-1549-9441-1b852442ca9d	1210	Ljubljana - Šentvid
00050000-55e8-1549-5c66-1be83929929f	1211	Ljubljana - Šmartno
00050000-55e8-1549-eb76-04dd2b833a28	3333	Ljubno ob Savinji
00050000-55e8-1549-9cac-1c90b995060a	9240	Ljutomer
00050000-55e8-1549-3732-c635968d2566	3215	Loče
00050000-55e8-1549-b367-9dc0fb32610b	5231	Log pod Mangartom
00050000-55e8-1549-61a9-48477ac3651c	1358	Log pri Brezovici
00050000-55e8-1549-eaf7-01ea777201cd	1370	Logatec
00050000-55e8-1549-3caf-06bbaf7c3d5d	1371	Logatec
00050000-55e8-1549-e0ae-3ab5165e89f2	1434	Loka pri Zidanem Mostu
00050000-55e8-1549-f7bd-2943a6a5d2c4	3223	Loka pri Žusmu
00050000-55e8-1549-9c2f-bff7acbd9e19	6219	Lokev
00050000-55e8-1549-9efa-d07e3876b55a	1318	Loški Potok
00050000-55e8-1549-f64b-c2e3564299ec	2324	Lovrenc na Dravskem polju
00050000-55e8-1549-3fce-1e8dca5b1ac1	2344	Lovrenc na Pohorju
00050000-55e8-1549-b103-4421aee55466	3334	Luče
00050000-55e8-1549-cf85-8fa4614189be	1225	Lukovica
00050000-55e8-1549-5331-1e5019d4f176	9202	Mačkovci
00050000-55e8-1549-843e-c9b57096dd19	2322	Majšperk
00050000-55e8-1549-e65c-14ecae981e78	2321	Makole
00050000-55e8-1549-6bfd-1257aca9148d	9243	Mala Nedelja
00050000-55e8-1549-dc06-19463c0354f5	2229	Malečnik
00050000-55e8-1549-206e-67ec9c77f450	6273	Marezige
00050000-55e8-1549-361b-8aee94d39245	2000	Maribor 
00050000-55e8-1549-83b1-a58d52414e86	2001	Maribor - poštni predali
00050000-55e8-1549-7a27-768d36374569	2206	Marjeta na Dravskem polju
00050000-55e8-1549-983e-006ae91a0b90	2281	Markovci
00050000-55e8-1549-95a7-b62ed17e585f	9221	Martjanci
00050000-55e8-1549-dee0-d2075a6b7ba4	6242	Materija
00050000-55e8-1549-88dc-80b099a8c0bb	4211	Mavčiče
00050000-55e8-1549-4648-72eb9d538b18	1215	Medvode
00050000-55e8-1549-3617-fd7421433f17	1234	Mengeš
00050000-55e8-1549-941f-0cbff4363d2c	8330	Metlika
00050000-55e8-1549-f74d-8d6feef6f2f5	2392	Mežica
00050000-55e8-1549-8a2f-1040d5f7a233	2204	Miklavž na Dravskem polju
00050000-55e8-1549-1523-ae82ebdd9ee6	2275	Miklavž pri Ormožu
00050000-55e8-1549-7a79-6f303add5a65	5291	Miren
00050000-55e8-1549-462b-ab01616c8e0f	8233	Mirna
00050000-55e8-1549-2735-58b0c1e8473c	8216	Mirna Peč
00050000-55e8-1549-ba9e-0ba0cbedcb1b	2382	Mislinja
00050000-55e8-1549-a3d7-316d176bc044	4281	Mojstrana
00050000-55e8-1549-542f-d56f53000956	8230	Mokronog
00050000-55e8-1549-d705-bddb0f6d8a84	1251	Moravče
00050000-55e8-1549-732d-59af5dacfa9c	9226	Moravske Toplice
00050000-55e8-1549-3757-c2e0342e669a	5216	Most na Soči
00050000-55e8-1549-59c3-d2475069ae37	1221	Motnik
00050000-55e8-1549-a804-bfdfcc89a30a	3330	Mozirje
00050000-55e8-1549-f795-77de8273d33a	9000	Murska Sobota 
00050000-55e8-1549-aab1-c842184c1031	9001	Murska Sobota - poštni predali
00050000-55e8-1549-c0a0-ac1bf822b1b7	2366	Muta
00050000-55e8-1549-f5fe-220ba0f46e90	4202	Naklo
00050000-55e8-1549-474a-cec36033e812	3331	Nazarje
00050000-55e8-1549-2a04-79081a4b3f62	1357	Notranje Gorice
00050000-55e8-1549-0671-96d34a11db21	3203	Nova Cerkev
00050000-55e8-1549-bd92-d41516617b6c	5000	Nova Gorica 
00050000-55e8-1549-dc45-27cafe33571c	5001	Nova Gorica - poštni predali
00050000-55e8-1549-dd1d-201a7f7da90e	1385	Nova vas
00050000-55e8-1549-a1c9-167783c114e3	8000	Novo mesto
00050000-55e8-1549-be79-a310cf0a3bc5	8001	Novo mesto - poštni predali
00050000-55e8-1549-7bc4-aad075242396	6243	Obrov
00050000-55e8-1549-3a68-02eb4043f3e4	9233	Odranci
00050000-55e8-1549-324f-f02101ae37d7	2317	Oplotnica
00050000-55e8-1549-6e19-8827776f3c6a	2312	Orehova vas
00050000-55e8-1549-8dce-1b0cb7f49a89	2270	Ormož
00050000-55e8-1549-639a-5dc62af80bda	1316	Ortnek
00050000-55e8-1549-3792-9296e3f6302e	1337	Osilnica
00050000-55e8-1549-efa1-8055d5987bf3	8222	Otočec
00050000-55e8-1549-ec9e-90cfbc6cf6c9	2361	Ožbalt
00050000-55e8-1549-7999-d26035936387	2231	Pernica
00050000-55e8-1549-8a76-ac3bee967fe6	2211	Pesnica pri Mariboru
00050000-55e8-1549-a7df-c0f32316ef26	9203	Petrovci
00050000-55e8-1549-ef3a-e43046a56379	3301	Petrovče
00050000-55e8-1549-043d-e1c674f3d93f	6330	Piran/Pirano
00050000-55e8-1549-d6ea-1932c3b01484	8255	Pišece
00050000-55e8-1549-73bb-daede6d46ce1	6257	Pivka
00050000-55e8-1549-3013-a615bfcb2e66	6232	Planina
00050000-55e8-1549-6d4a-d066e6b0c344	3225	Planina pri Sevnici
00050000-55e8-1549-9698-96a64133949f	6276	Pobegi
00050000-55e8-1549-36d3-e0d93050ee8a	8312	Podbočje
00050000-55e8-1549-52cf-36beab6985c8	5243	Podbrdo
00050000-55e8-1549-03d9-e63ba9a98e1b	3254	Podčetrtek
00050000-55e8-1549-65a0-bcc893294cc0	2273	Podgorci
00050000-55e8-1549-3a50-f780058b1081	6216	Podgorje
00050000-55e8-1549-7f6f-d5551ffc1d40	2381	Podgorje pri Slovenj Gradcu
00050000-55e8-1549-4dc7-edbb553a058d	6244	Podgrad
00050000-55e8-1549-0e37-8c2d153d6af0	1414	Podkum
00050000-55e8-1549-96ca-ff899c45818f	2286	Podlehnik
00050000-55e8-1549-91b1-b78142299419	5272	Podnanos
00050000-55e8-1549-eef6-dcf98b4728db	4244	Podnart
00050000-55e8-1549-f559-4232809f2857	3241	Podplat
00050000-55e8-1549-b5f6-13a34bbdc371	3257	Podsreda
00050000-55e8-1549-6713-3813f41a4bf8	2363	Podvelka
00050000-55e8-1549-a2ad-c0f9c75cef20	2208	Pohorje
00050000-55e8-1549-6171-e9f39a443d2e	2257	Polenšak
00050000-55e8-1549-e22d-3bb4263ace42	1355	Polhov Gradec
00050000-55e8-1549-468f-0b61c3c09cce	4223	Poljane nad Škofjo Loko
00050000-55e8-1549-bef4-aca2856ae5ca	2319	Poljčane
00050000-55e8-1549-46d8-0e559407937d	1272	Polšnik
00050000-55e8-1549-983c-121d922624b0	3313	Polzela
00050000-55e8-1549-6988-e24b995def70	3232	Ponikva
00050000-55e8-1549-af22-8dc1152f6684	6320	Portorož/Portorose
00050000-55e8-1549-147a-1523beaae15d	6230	Postojna
00050000-55e8-1549-031b-68ad24ce0920	2331	Pragersko
00050000-55e8-1549-3fc5-35fbb9c6f426	3312	Prebold
00050000-55e8-1549-bc37-a0cf1496521c	4205	Preddvor
00050000-55e8-1549-2210-aa0dc19df70f	6255	Prem
00050000-55e8-1549-98c1-650792f542cc	1352	Preserje
00050000-55e8-1549-63e6-71b30a28b769	6258	Prestranek
00050000-55e8-1549-60c9-9df6619a3f23	2391	Prevalje
00050000-55e8-1549-6518-2093f920e2f6	3262	Prevorje
00050000-55e8-1549-813f-74928c538102	1276	Primskovo 
00050000-55e8-1549-3d3c-8307d176314b	3253	Pristava pri Mestinju
00050000-55e8-1549-255c-0fc115fcc9e7	9207	Prosenjakovci/Partosfalva
00050000-55e8-1549-bcc1-6e284d46b124	5297	Prvačina
00050000-55e8-1549-4cdb-74384c4d5acd	2250	Ptuj
00050000-55e8-1549-dceb-72ea141291e1	2323	Ptujska Gora
00050000-55e8-1549-73f0-e50132e7955c	9201	Puconci
00050000-55e8-1549-b63c-36bc49ab2143	2327	Rače
00050000-55e8-1549-5cc8-c372c1ca7597	1433	Radeče
00050000-55e8-1549-63d7-571e2718b4e8	9252	Radenci
00050000-55e8-1549-4809-72a725633f07	2360	Radlje ob Dravi
00050000-55e8-1549-1649-6c13e21048c6	1235	Radomlje
00050000-55e8-1549-321d-beeb19b9d505	4240	Radovljica
00050000-55e8-1549-711b-820d809c81bf	8274	Raka
00050000-55e8-1549-b13b-d49467dbd52c	1381	Rakek
00050000-55e8-1549-b560-f212bd2e6e96	4283	Rateče - Planica
00050000-55e8-1549-8858-1f7d70231efc	2390	Ravne na Koroškem
00050000-55e8-1549-028d-0ffadc7c0213	9246	Razkrižje
00050000-55e8-1549-d872-59ca9b1683ba	3332	Rečica ob Savinji
00050000-55e8-1549-1de8-7246e912067b	5292	Renče
00050000-55e8-1549-4dfa-5e138050d49c	1310	Ribnica
00050000-55e8-1549-1fc7-8ac0c03ee158	2364	Ribnica na Pohorju
00050000-55e8-1549-6498-afadf2414fc9	3272	Rimske Toplice
00050000-55e8-1549-098e-c67cdc8fd190	1314	Rob
00050000-55e8-1549-20f8-495db6bba3c0	5215	Ročinj
00050000-55e8-1549-3aec-6e8873ae8688	3250	Rogaška Slatina
00050000-55e8-1549-477d-dcd7e8fe89bc	9262	Rogašovci
00050000-55e8-1549-c44d-d4b28d102a39	3252	Rogatec
00050000-55e8-1549-2d32-06591d3bc3c5	1373	Rovte
00050000-55e8-1549-2d66-5d43f4b16c37	2342	Ruše
00050000-55e8-1549-5cf7-f6288076f0ae	1282	Sava
00050000-55e8-1549-6509-22efd5784d50	6333	Sečovlje/Sicciole
00050000-55e8-1549-c361-1172a272251f	4227	Selca
00050000-55e8-1549-7574-c34d83b6cd02	2352	Selnica ob Dravi
00050000-55e8-1549-7ee5-d92819bee617	8333	Semič
00050000-55e8-1549-d6c0-a82fc793e8d3	8281	Senovo
00050000-55e8-1549-dcb8-fe9c4fd75a80	6224	Senožeče
00050000-55e8-1549-de89-84b932f7d8eb	8290	Sevnica
00050000-55e8-1549-68fd-8c8d16a0d6ce	6210	Sežana
00050000-55e8-1549-e583-eb4799aab7d9	2214	Sladki Vrh
00050000-55e8-1549-b559-ee68e068837e	5283	Slap ob Idrijci
00050000-55e8-1549-2d82-eeb2f085a298	2380	Slovenj Gradec
00050000-55e8-1549-496c-ca08e2e3ef47	2310	Slovenska Bistrica
00050000-55e8-1549-d061-50970c9232b7	3210	Slovenske Konjice
00050000-55e8-1549-2663-09bcc7dff15a	1216	Smlednik
00050000-55e8-1549-760f-a4f71219a830	5232	Soča
00050000-55e8-1549-e998-ab504b6473fb	1317	Sodražica
00050000-55e8-1549-2d3e-c881908e4d2d	3335	Solčava
00050000-55e8-1549-c4e7-7a8380aa4e18	5250	Solkan
00050000-55e8-1549-7896-f3fe488cd84e	4229	Sorica
00050000-55e8-1549-cd96-30b9c940f397	4225	Sovodenj
00050000-55e8-1549-8ebe-804daf9c2a75	5281	Spodnja Idrija
00050000-55e8-1549-c600-aff8b2385230	2241	Spodnji Duplek
00050000-55e8-1549-69e6-49d4784de6b0	9245	Spodnji Ivanjci
00050000-55e8-1549-1b2d-d5eeac0ff34e	2277	Središče ob Dravi
00050000-55e8-1549-d164-ba38cee1fa1f	4267	Srednja vas v Bohinju
00050000-55e8-1549-878b-590e6b998b8c	8256	Sromlje 
00050000-55e8-1549-cc46-63cafa84abf0	5224	Srpenica
00050000-55e8-1549-af7e-8f315e3055e0	1242	Stahovica
00050000-55e8-1549-67cc-658e711fa1ae	1332	Stara Cerkev
00050000-55e8-1549-3afd-d84fa929cc51	8342	Stari trg ob Kolpi
00050000-55e8-1549-ffa9-e414946c8fc5	1386	Stari trg pri Ložu
00050000-55e8-1549-1f81-4a3a488a230b	2205	Starše
00050000-55e8-1549-c862-9264e144b667	2289	Stoperce
00050000-55e8-1549-84c9-4d3d57c1d570	8322	Stopiče
00050000-55e8-1549-c9c4-5b069260e576	3206	Stranice
00050000-55e8-1549-7557-baeee75deb3a	8351	Straža
00050000-55e8-1549-fe77-2784f7a062f7	1313	Struge
00050000-55e8-1549-2e0c-32089e5df480	8293	Studenec
00050000-55e8-1549-0121-039e89316914	8331	Suhor
00050000-55e8-1549-1416-808058cc85d2	2233	Sv. Ana v Slovenskih goricah
00050000-55e8-1549-859f-4f8170adf38b	2235	Sv. Trojica v Slovenskih goricah
00050000-55e8-1549-e6f0-19cb36d8279c	2353	Sveti Duh na Ostrem Vrhu
00050000-55e8-1549-71b3-ff057ac08477	9244	Sveti Jurij ob Ščavnici
00050000-55e8-1549-8688-79b7ad3d12ba	3264	Sveti Štefan
00050000-55e8-1549-1f3d-83ae6429a20a	2258	Sveti Tomaž
00050000-55e8-1549-4cfb-24dbbe0211f5	9204	Šalovci
00050000-55e8-1549-2aa0-35b1b5748907	5261	Šempas
00050000-55e8-1549-e094-a1402ff7dae5	5290	Šempeter pri Gorici
00050000-55e8-1549-dcf9-03289ed919a1	3311	Šempeter v Savinjski dolini
00050000-55e8-1549-9661-cd3e22b07290	4208	Šenčur
00050000-55e8-1549-7749-9087fb1ea5b2	2212	Šentilj v Slovenskih goricah
00050000-55e8-1549-b874-d512615a5d6f	8297	Šentjanž
00050000-55e8-1549-7494-892fc084eb74	2373	Šentjanž pri Dravogradu
00050000-55e8-1549-2693-1d2e8a665039	8310	Šentjernej
00050000-55e8-1549-b4a8-635823adb489	3230	Šentjur
00050000-55e8-1549-3967-b8a506582179	3271	Šentrupert
00050000-55e8-1549-17fc-6c917ea844e0	8232	Šentrupert
00050000-55e8-1549-0c36-e2bba6555414	1296	Šentvid pri Stični
00050000-55e8-1549-60bd-31f18553aacb	8275	Škocjan
00050000-55e8-1549-0eb1-99d8068af744	6281	Škofije
00050000-55e8-1549-a27a-073c039625b0	4220	Škofja Loka
00050000-55e8-1549-cd33-58ab27573e9c	3211	Škofja vas
00050000-55e8-1549-d14c-8db7cdf311ea	1291	Škofljica
00050000-55e8-1549-3d07-d601b607db8b	6274	Šmarje
00050000-55e8-1549-dd06-9b852d4fc780	1293	Šmarje - Sap
00050000-55e8-1549-869e-5fc6d572641b	3240	Šmarje pri Jelšah
00050000-55e8-1549-7257-07f42eadf58d	8220	Šmarješke Toplice
00050000-55e8-1549-91c1-8ba9bea319f7	2315	Šmartno na Pohorju
00050000-55e8-1549-2c7d-6ea52e52adc7	3341	Šmartno ob Dreti
00050000-55e8-1549-82a7-4673aae08408	3327	Šmartno ob Paki
00050000-55e8-1549-80d4-a5d1388f01ba	1275	Šmartno pri Litiji
00050000-55e8-1549-a98d-7ba5587395ca	2383	Šmartno pri Slovenj Gradcu
00050000-55e8-1549-693b-c43d5b8f7411	3201	Šmartno v Rožni dolini
00050000-55e8-1549-ab4e-239b88efef3d	3325	Šoštanj
00050000-55e8-1549-0af0-c0c085b61745	6222	Štanjel
00050000-55e8-1549-ef44-a0fcaa392a18	3220	Štore
00050000-55e8-1549-47f3-649070889475	3304	Tabor
00050000-55e8-1549-2a7a-8e2a8713605f	3221	Teharje
00050000-55e8-1549-c4e6-9d1e6b7513af	9251	Tišina
00050000-55e8-1549-8939-d731d76589ca	5220	Tolmin
00050000-55e8-1549-f531-ee8d23107d05	3326	Topolšica
00050000-55e8-1549-52a8-e1b9798e7043	2371	Trbonje
00050000-55e8-1549-131c-7856094b8a6a	1420	Trbovlje
00050000-55e8-1549-74d9-2bfd65c60ff1	8231	Trebelno 
00050000-55e8-1549-3fda-f6640a156ee7	8210	Trebnje
00050000-55e8-1549-cbe0-371bcf7d691d	5252	Trnovo pri Gorici
00050000-55e8-1549-edc1-c64d605658da	2254	Trnovska vas
00050000-55e8-1549-05ec-472e79c33f26	1222	Trojane
00050000-55e8-1549-0a30-1c9d512d014e	1236	Trzin
00050000-55e8-1549-f15f-14a119986432	4290	Tržič
00050000-55e8-1549-0d9c-3c7106b5c1d2	8295	Tržišče
00050000-55e8-1549-7f7c-8542f58f02c1	1311	Turjak
00050000-55e8-1549-5755-08ffa26691f1	9224	Turnišče
00050000-55e8-1549-ab67-76b6ede6656d	8323	Uršna sela
00050000-55e8-1549-d366-b79ed88b53e0	1252	Vače
00050000-55e8-1549-d4d1-8fa59cf92b71	3320	Velenje 
00050000-55e8-1549-c0ba-bc0c9705977e	3322	Velenje - poštni predali
00050000-55e8-1549-ec65-6e7498b2ee24	8212	Velika Loka
00050000-55e8-1549-d1f7-f9133a078f41	2274	Velika Nedelja
00050000-55e8-1549-59ec-be642f18697b	9225	Velika Polana
00050000-55e8-1549-cfb0-04444f5e8d68	1315	Velike Lašče
00050000-55e8-1549-70ef-c02018655079	8213	Veliki Gaber
00050000-55e8-1549-c645-1ddeeecc8476	9241	Veržej
00050000-55e8-1549-e27d-1962b6245519	1312	Videm - Dobrepolje
00050000-55e8-1549-8d12-46fce8202993	2284	Videm pri Ptuju
00050000-55e8-1549-aa5a-768213a19951	8344	Vinica
00050000-55e8-1549-5c85-2ef4fd3e000f	5271	Vipava
00050000-55e8-1549-4bf7-4321dbbc3a3e	4212	Visoko
00050000-55e8-1549-4342-78baae6f447d	1294	Višnja Gora
00050000-55e8-1549-da84-9256eff5d3a4	3205	Vitanje
00050000-55e8-1549-d0ba-d1baaccadfbe	2255	Vitomarci
00050000-55e8-1549-92a1-b34dd56e1677	1217	Vodice
00050000-55e8-1549-7083-a41243e6376d	3212	Vojnik\t
00050000-55e8-1549-4c02-4e6e60fc8740	5293	Volčja Draga
00050000-55e8-1549-bf0a-ceabf169bfcd	2232	Voličina
00050000-55e8-1549-5fe8-0e1f765a6939	3305	Vransko
00050000-55e8-1549-9435-22ca273e0dfb	6217	Vremski Britof
00050000-55e8-1549-09ed-dba5c345504d	1360	Vrhnika
00050000-55e8-1549-bd0b-59a38d6e1188	2365	Vuhred
00050000-55e8-1549-84fd-1ad64070e7d9	2367	Vuzenica
00050000-55e8-1549-9903-dffff74d7c90	8292	Zabukovje 
00050000-55e8-1549-e1a1-68825311fdd1	1410	Zagorje ob Savi
00050000-55e8-1549-1cfe-e038616d21ae	1303	Zagradec
00050000-55e8-1549-05d8-2fe4477fd067	2283	Zavrč
00050000-55e8-1549-d14a-d31588cdfce6	8272	Zdole 
00050000-55e8-1549-5df2-d17bd2058ec6	4201	Zgornja Besnica
00050000-55e8-1549-f2d6-04161ce264b8	2242	Zgornja Korena
00050000-55e8-1549-fb80-dff845afb01d	2201	Zgornja Kungota
00050000-55e8-1549-734b-2315b8eb91d0	2316	Zgornja Ložnica
00050000-55e8-1549-460f-9387caa0522f	2314	Zgornja Polskava
00050000-55e8-1549-efec-211e8100d65c	2213	Zgornja Velka
00050000-55e8-1549-6014-0816418ba45e	4247	Zgornje Gorje
00050000-55e8-1549-0e8a-04b53a85d2dd	4206	Zgornje Jezersko
00050000-55e8-1549-62f1-42c3d24488f2	2285	Zgornji Leskovec
00050000-55e8-1549-ef82-721c2cf84c90	1432	Zidani Most
00050000-55e8-1549-98dc-d7752bd1296b	3214	Zreče
00050000-55e8-1549-bc73-425501f33462	4209	Žabnica
00050000-55e8-1549-0d46-a4bd66894ec0	3310	Žalec
00050000-55e8-1549-6ff7-6d06ec1efe26	4228	Železniki
00050000-55e8-1549-5b0f-eba05bd9c0ff	2287	Žetale
00050000-55e8-1549-a5b9-9c17a3a4445b	4226	Žiri
00050000-55e8-1549-c592-3d1f77c9a362	4274	Žirovnica
00050000-55e8-1549-0a7c-f0582b11980d	8360	Žužemberk
\.


--
-- TOC entry 2935 (class 0 OID 17158983)
-- Dependencies: 200
-- Data for Name: postavkaracuna; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkaracuna (id, racun_id) FROM stdin;
\.


--
-- TOC entry 2918 (class 0 OID 17158793)
-- Dependencies: 183
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
00060000-55e8-154c-4436-e8385d52e535	00080000-55e8-154b-2056-e4fef69ec416	\N	00040000-55e8-154a-4f83-8c49c8e91f9b	Narodni dom	\N	Koroška 15	\N	9231	Beltinci	\N	f	t
00060000-55e8-154c-e1a3-6ede14b72724	00080000-55e8-154b-2056-e4fef69ec416	\N	00040000-55e8-154a-4f83-8c49c8e91f9b		\N	Koroška 22	\N	9231	Beltinci	\N	f	f
00060000-55e8-154c-7dc4-2f5728fb0f96	00080000-55e8-154b-0013-05d1ef0de420	\N	00040000-55e8-154a-4f83-8c49c8e91f9b		\N	Rimska ploščad 7	\N	9231	Beltinci	\N	f	t
\.


--
-- TOC entry 2924 (class 0 OID 17158871)
-- Dependencies: 189
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id) FROM stdin;
\.


--
-- TOC entry 2937 (class 0 OID 17158995)
-- Dependencies: 202
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 2961 (class 0 OID 17159347)
-- Dependencies: 226
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, koproducent_id, odstotekfinanciranja, delez, maticnikop, kpe, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 2962 (class 0 OID 17159357)
-- Dependencies: 227
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, sifra, status) FROM stdin;
00190000-55e8-154c-271b-8014e013f11a	00080000-55e8-154b-4fe3-7510a3257b0e	0987	AK
00190000-55e8-154c-30a0-b76091317213	00080000-55e8-154b-0013-05d1ef0de420	0989	AK
00190000-55e8-154c-9bfe-ba1d1abedafc	00080000-55e8-154b-22f1-0ca9a4c27350	0986	AK
00190000-55e8-154c-5f30-6f25f6a37c2b	00080000-55e8-154b-2493-3f9d922afdae	0984	AK
00190000-55e8-154c-80ec-2dc0ebbf0336	00080000-55e8-154b-9115-7707ffe52160	0983	AK
00190000-55e8-154c-3d88-a2060fc460a7	00080000-55e8-154b-5f9f-5cbbecc1a4cb	0982	AK
00190000-55e8-154d-8b04-4e2b08432cb8	00080000-55e8-154d-0b00-f6ca712b826b	1001	AK
\.


--
-- TOC entry 2960 (class 0 OID 17159303)
-- Dependencies: 225
-- Data for Name: programdela; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programdela (id, sezona_id, sifra, naziv, zacetek, konec, zakljuceno, potrjenprogram, stpremier, stint, stfest, strazno, stizjem, stponprem, stponprej, stponprejvelikih, stponprejmalih, stponprejmalihkopr, stponprejsredkopr, stponprejvelikihkopr, stgostujo, vrps1, vrps1do, vrps1mat, vrps1gostovsz, stizvnekomerc, stizvprem, stizvponprem, stizvponpremdoma, stizvponpremzamejo, stizvponpremgost, stizvponpremkopr, stizvponpremint, stizvponpremkoprint, stizvponprej, stizvponprejdoma, stizvponprejzamejo, stizvponprejgost, stizvponprejkopr, stizvponprejint, stizvponprejkoprint, stizvgostuj, stizvostalihnek, stizvgostovanjslo, stizvgostovanjzam, stizvgostovanjint, stobisknekom, stobisknekommat, stobisknekomgostslo, stobisknekomgostzam, stobisknekomgostint, stobiskprem, stobiskponprem, stobiskponpremdoma, stobiskponpremkopr, stobiskponpremkoprint, stobiskponpremgost, stobiskponpremzamejo, stobiskponpremint, avgobiskprired, avgzaseddvoran, avgcenavstopnice, stprodvstopnic, stkoprodukcij, stkoprodukcijint, stkoprodukcijnvo, stzaposlenih, stzaposigralcev, avgstnastopovigr, sthonorarnih, sthonorarnihigr, sthonorarnihigrtujjz, sthonorarnihigrsamoz, sredstvaint, sredstvaavt, sredstvazaprosenoprem, sredstvazaprosenoponprem, sredstvazaprosenoponprej, sredstvazaprosenogostujo, sredstvazaprosenoint, sredstvazaprosenofest, sredstvazaprosenorazno, sredstvazaprosenoizjem, sredstvadrugijavniprem, sredstvadrugijavniponprem, sredstvadrugijavniponprej, sredstvadrugijavnigostujo, sredstvadrugijavniint, sredstvadrugijavnifest, sredstvadrugijavnirazno, sredstvadrugijavniizjem, sredstvadrugiviriprem, sredstvadrugiviriponprem, sredstvadrugiviriponprej, sredstvadrugivirigostujo, sredstvadrugiviriint, sredstvadrugivirifest, sredstvadrugivirirazno, sredstvadrugiviriizjem, sredstvaavtsamoz) FROM stdin;
00290000-55e8-154c-31d2-28f4c6110175	\N	0001	Testni program dela	2016-02-01	2017-02-01	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 2963 (class 0 OID 17159365)
-- Dependencies: 228
-- Data for Name: programskaenotasklopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programskaenotasklopa (id, naslovpe, avtorpe, obsegpe, mesecpe, vrednostpe, programrazno_id) FROM stdin;
\.


--
-- TOC entry 2941 (class 0 OID 17159024)
-- Dependencies: 206
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, popa_id, naslov_id, sifra, naziv, jeprizorisce, seplanira, kapaciteta, opis) FROM stdin;
00220000-55e8-154b-bad0-56ee5e827649	\N	\N	0001	Poskusna 1	f	t	8	Poskusna učilnica v prvem
00220000-55e8-154b-d0f1-b702dd395359	\N	\N	0002	Poskusna 3	f	f	34	Poskusna učilnica v tretjem
00220000-55e8-154b-b3de-5acc91913709	\N	\N	0003	Kazinska	t	t	84	Kazinska dvorana
00220000-55e8-154b-2325-242d295e2729	\N	\N	0004	Mali oder	t	t	24	Mali oder 
00220000-55e8-154b-4441-ef012b5c05a6	\N	\N	0005	Komorni oder	t	t	15	Komorni oder
00220000-55e8-154b-4e8b-dbcfdb24da5b	\N	\N	0006	Stara dvorana	t	t	96	Stara dvorana ali dvorana Franceta Prešerna
00220000-55e8-154b-1954-cc9ff3ed3bd0	\N	\N	0007	Velika dvorana	t	t	160	Velika, glavna dvorana
\.


--
-- TOC entry 2933 (class 0 OID 17158968)
-- Dependencies: 198
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 2932 (class 0 OID 17158958)
-- Dependencies: 197
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 2953 (class 0 OID 17159156)
-- Dependencies: 218
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta, status) FROM stdin;
\.


--
-- TOC entry 2948 (class 0 OID 17159095)
-- Dependencies: 213
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 2907 (class 0 OID 17158666)
-- Dependencies: 172
-- Data for Name: revizije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY revizije (id, razred, objectid, upor, datum, tip, data) FROM stdin;
1	App\\Entity\\Popa	00080000-55e8-154d-0b00-f6ca712b826b	00010000-55e8-154a-f4fe-ca24a8ecc728	2015-09-03 11:39:25	INS	a:0:{}
2	App\\Entity\\Option	00000000-55e8-154d-42ce-a981e23e0fbf	00010000-55e8-154a-f4fe-ca24a8ecc728	2015-09-03 11:39:25	INS	a:0:{}
3	ProgramDela\\Entity\\ProdukcijskaHisa	00190000-55e8-154d-8b04-4e2b08432cb8	00010000-55e8-154a-f4fe-ca24a8ecc728	2015-09-03 11:39:25	INS	a:0:{}
\.


--
-- TOC entry 2984 (class 0 OID 0)
-- Dependencies: 171
-- Name: revizije_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('revizije_id_seq', 3, true);


--
-- TOC entry 2942 (class 0 OID 17159037)
-- Dependencies: 207
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 2911 (class 0 OID 17158704)
-- Dependencies: 176
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-55e8-154a-bbd9-1c3dad28ef4a	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-55e8-154a-c102-020032b34378	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-55e8-154a-bebc-b4fa4ceb6b35	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-55e8-154a-d5c5-9f36d684f4ae	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-55e8-154a-cfcc-4c9e4d0f8265	planer	Planer dogodkov v koledarju	t
00020000-55e8-154a-9d42-bf5216d1dbd4	kadrovska	Kadrovska služba	t
00020000-55e8-154a-0daf-0064178991ec	arhivar	Ažuriranje arhivalij	t
00020000-55e8-154a-1313-0a68747f0ed6	igralec	Igralec	t
00020000-55e8-154a-9621-ebfe84c9bce4	prisotnost	Vnašalec prisotnosti, tudi za tiste izven uprizoritev	t
00020000-55e8-154b-f407-886b1cbd3333	vsadovoljenja	Vloga z vsemi posameznimi dovoljenji	t
\.


--
-- TOC entry 2909 (class 0 OID 17158688)
-- Dependencies: 174
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-55e8-154a-b4fc-326a1aadc7ea	00020000-55e8-154a-bebc-b4fa4ceb6b35
00010000-55e8-154a-f4fe-ca24a8ecc728	00020000-55e8-154a-bebc-b4fa4ceb6b35
00010000-55e8-154c-1124-34fa147510fe	00020000-55e8-154b-f407-886b1cbd3333
\.


--
-- TOC entry 2944 (class 0 OID 17159051)
-- Dependencies: 209
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 2936 (class 0 OID 17158989)
-- Dependencies: 201
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 2930 (class 0 OID 17158935)
-- Dependencies: 195
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, sifra, ime, zacetek, konec, aktivna) FROM stdin;
\.


--
-- TOC entry 2968 (class 0 OID 17159406)
-- Dependencies: 233
-- Data for Name: stevilcenje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenje (id, sifra, naziv, prefix, suffix, zacetek, dolzina, format, globalno, poletih) FROM stdin;
00230000-55e8-1549-fb4d-34506b358b3f	pri	Privzeto številčenje po letih YYYY-N	\N	\N	1	1	%l-%n	f	t
00230000-55e8-1549-f94c-7f912e40294f	123	Privzeto številčenje kratkih šifer	\N	\N	100	3	%n	f	f
00230000-55e8-1549-d075-3759cf0b94f5	bcd	Globalno številčenje črtnih kod	\N	\N	1	9	%n	t	f
00230000-55e8-1549-9462-867bcc9ec4ca	sif	Številčenje šifrant	\N	\N	1000	4	%n	t	f
00230000-55e8-1549-6b3d-40024b13ae22	tmp	Globalno številčenje začasnih številk	tmp	\N	1000	5	%l%n	t	t
\.


--
-- TOC entry 2967 (class 0 OID 17159398)
-- Dependencies: 232
-- Data for Name: stevilcenjekonfig; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjekonfig (id, stevilcenje_id, dok) FROM stdin;
00240000-55e8-154a-ca34-341d4150bdef	00230000-55e8-1549-9462-867bcc9ec4ca	popa
00240000-55e8-154a-7dbd-c3faa79544cd	00230000-55e8-1549-9462-867bcc9ec4ca	oseba
00240000-55e8-154a-7210-1539529a184d	00230000-55e8-1549-9462-867bcc9ec4ca	sezona
00240000-55e8-154a-7dd7-96bd821e3c4f	00230000-55e8-1549-f94c-7f912e40294f	prostor
00240000-55e8-154a-8492-f470fda7f02d	00230000-55e8-1549-9462-867bcc9ec4ca	besedilo
00240000-55e8-154a-ed43-780625260bff	00230000-55e8-1549-9462-867bcc9ec4ca	uprizoritev
00240000-55e8-154a-c7da-96268ff2ac2b	00230000-55e8-1549-9462-867bcc9ec4ca	funkcija
00240000-55e8-154a-4c78-fc3129907ae0	00230000-55e8-1549-9462-867bcc9ec4ca	tipfunkcije
00240000-55e8-154a-642e-4d7b4a1071ef	00230000-55e8-1549-9462-867bcc9ec4ca	alternacija
00240000-55e8-154a-64b1-c1c53ae4c976	00230000-55e8-1549-fb4d-34506b358b3f	pogodba
00240000-55e8-154a-a608-3a30b812f2cb	00230000-55e8-1549-9462-867bcc9ec4ca	zaposlitev
00240000-55e8-154a-12b2-0a4df786353a	00230000-55e8-1549-fb4d-34506b358b3f	programdela
00240000-55e8-154a-55a4-74b235e7d49d	00230000-55e8-1549-9462-867bcc9ec4ca	zapis
\.


--
-- TOC entry 2966 (class 0 OID 17159393)
-- Dependencies: 231
-- Data for Name: stevilcenjestanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjestanje (id, objid, leto, stevilka) FROM stdin;
007c6238-9ca0-4a9b-8493-dfb2c6fb5438	00230000-55e8-1549-9462-867bcc9ec4ca	0	1001
\.


--
-- TOC entry 2949 (class 0 OID 17159105)
-- Dependencies: 214
-- Data for Name: strosekuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY strosekuprizoritve (id, uprizoritev_id, popa_id, naziv, vrednostdo, vrednostna, opis, tipstroska, sort, vrstastroska_id) FROM stdin;
00270000-55e8-154c-1265-f5d690b01320	000e0000-55e8-154c-b9d1-a66976c52d49	00080000-55e8-154b-2056-e4fef69ec416	Nabava kostumov	600.50	20.00	Krila in maske	materialni	1	003b0000-55e8-154a-3f48-38bebc47de30
00270000-55e8-154c-ed84-aa18d33e885c	000e0000-55e8-154c-b9d1-a66976c52d49	00080000-55e8-154b-2056-e4fef69ec416	Zavese	125.70	3.10	Modra in zelena zavesa	materialni	2	003b0000-55e8-154a-3f48-38bebc47de30
00270000-55e8-154c-149d-81038fa6bfc1	000e0000-55e8-154c-b9d1-a66976c52d49	00080000-55e8-154b-59c6-2d21f1978b17	Avtorske pravice	300.00	30.00	Odkup avtorskih pravic	avtorprav	4	\N
\.


--
-- TOC entry 2916 (class 0 OID 17158766)
-- Dependencies: 181
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 2931 (class 0 OID 17158945)
-- Dependencies: 196
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja) FROM stdin;
001a0000-55e8-154c-60d7-2831a76bbde5	00180000-55e8-154c-14ed-9ee58573ce97	000c0000-55e8-154c-94b4-44d9532d417a	00090000-55e8-154c-896b-15dd0a6d30f4	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55e8-154c-bc93-0e9c29c4ddae	00180000-55e8-154c-14ed-9ee58573ce97	000c0000-55e8-154c-a2d7-821a59c37693	00090000-55e8-154c-f4a9-299cbc45680d	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55e8-154c-703b-83c74de82791	00180000-55e8-154c-14ed-9ee58573ce97	000c0000-55e8-154c-c8db-9f93f9c0e3e8	00090000-55e8-154c-62b5-06db238b5e4c	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55e8-154c-bcda-d94b383d8914	00180000-55e8-154c-14ed-9ee58573ce97	000c0000-55e8-154c-96c4-7cc3d7caadc3	00090000-55e8-154c-3216-5a430ee18164	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55e8-154c-1df2-455a43ca3198	00180000-55e8-154c-14ed-9ee58573ce97	000c0000-55e8-154c-ebe8-25e5c16f3360	00090000-55e8-154c-add4-98677e89ad0b	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55e8-154c-89bb-739c03519278	00180000-55e8-154c-b826-4abef064eb70	\N	00090000-55e8-154c-add4-98677e89ad0b	2015-08-01 20:00:00	2015-08-01 23:00:00	\N	\N	2.00
\.


--
-- TOC entry 2952 (class 0 OID 17159145)
-- Dependencies: 217
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, ime, opis, imezenski, podrocje) FROM stdin;
000f0000-55e8-1549-f6ac-f0eed794a9a4	Avtor	Avtorji	Avtorka	umetnik
000f0000-55e8-1549-90a5-64ac76bf93c1	Priredba	Priredba	Priredba	umetnik
000f0000-55e8-1549-0a6a-af73db94adfa	Prevod	Prevod	Prevod	umetnik
000f0000-55e8-1549-cb8e-e8da7d44d78a	Režija	Režija	Režija	umetnik
000f0000-55e8-1549-7ca7-5f6ca5d052b6	Dramaturgija	Dramaturgija	Dramaturgija	umetnik
000f0000-55e8-1549-38a5-5c4b560b6b65	Scenografija	Scenografija	Scenografija	umetnik
000f0000-55e8-1549-9c79-b40b852cb8f4	Kostumografija	Kostumografija	Kostumografija	umetnik
000f0000-55e8-1549-44fb-3791a9aa1716	Koreografija	Koreografija	Koreografija	umetnik
000f0000-55e8-1549-99ee-298d1a9c88f6	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	umetnik
000f0000-55e8-1549-dd4d-67369f6870d3	Oblikovanje maske	Oblikovanje maske	Oblikovanje maske	umetnik
000f0000-55e8-1549-afa9-6d405646f5c9	Lektorstvo	Lektorstvo	Lektorstvo	umetnik
000f0000-55e8-1549-100a-0a98b257e2da	Glasbeni soustvarjalec	Glasbeni soustvarjalci	Glasbena soustvarjalka	umetnik
000f0000-55e8-1549-5ed3-d8fb21e69b5e	Intermedijski ustvarjalec	Intermedijski ustvarjalci	Intermedijski ustvarjalka	umetnik
000f0000-55e8-1549-e761-060ee90a39d4	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	umetnik
000f0000-55e8-1549-16b0-99341fc30ea0	Vloga	Intermedijski ustvarjalci	Intermedijska ustvarjalka	igralec
000f0000-55e8-1549-9ddd-3f60bd51a920	Produkcija, mentorstvo	Produkcija, mentorstvo	Produkcija, mentorstvo	umetnik
000f0000-55e8-1549-899a-0e5239827ffd	Tehnična podpora	Tehnična podpora	Tehnična podpora	tehnik
000f0000-55e8-1549-0966-6581279a852e	Inšpicient	Inšpicienti	Inšpicientka	inspicient
\.


--
-- TOC entry 2964 (class 0 OID 17159375)
-- Dependencies: 229
-- Data for Name: tipprogramskeenote; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipprogramskeenote (id, sifra, naziv, koprodukcija, maxfaktor, maxvsi) FROM stdin;
002b0000-55e8-1549-ffb0-2fe3b2146e59	01	Velika predstava	f	1.00	1.00
002b0000-55e8-1549-3ef4-76202ce0f500	02	Mala predstava	f	0.50	0.50
002b0000-55e8-1549-f2fd-8ae66ab65d4c	03	Mala koprodukcija	t	0.40	1.00
002b0000-55e8-1549-7a49-b27816a80438	04	Srednja koprodukcija	t	0.70	2.00
002b0000-55e8-1549-b968-dc7ed53a1e57	05	Velika koprodukcija	t	1.00	3.00
\.


--
-- TOC entry 2921 (class 0 OID 17158828)
-- Dependencies: 186
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 2908 (class 0 OID 17158675)
-- Dependencies: 173
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-55e8-154a-f4fe-ca24a8ecc728	Konzolni	$2y$05$NS4xMjkyMTcwMzExMjAxROjMUHyf.CGETAqoC1Ef9I4wcafpQT0G.	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-55e8-154c-31a5-268b00fbe7a4	testni uporabnik za inšpicienta	$2y$05$NS4xMjkyMTcwMzExMjAxROxkJ1B6xAXex6EZLIwJfWzRJ8DpfecFO	t	\N	\N	\N	ivo@ifigenija.si	\N	\N	\N
00010000-55e8-154c-928e-77db39b38cfa	testni uporabnik za Tehničnega vodjo	$2y$05$NS4xMjkyMTcwMzExMjAxROu/kXWR9sP9oamkesKuxXLbxkCb387.G	t	\N	\N	\N	tona@ifigenija.si	\N	\N	\N
00010000-55e8-154c-38fa-5ce6df50dd02	testni uporabnik za igralca	$2y$05$NS4xMjkyMTcwMzExMjAxRO/hLCgClfERRsfCAFYwxNCcFIVjP2982	t	\N	\N	\N	irena@ifigenija.si	\N	\N	\N
00010000-55e8-154c-4dd1-ff33eee556c2	testni uporabnik vnašalca termina storitev (TerminStoritve-vse)	$2y$05$NS4xMjkyMTcwMzExMjAxROT6.kTHqEq4.wa2SOnf124/N14m9qeP.	t	\N	\N	\N	tatjana@ifigenija.si	\N	\N	\N
00010000-55e8-154c-cb9c-3552e2c1eb67	testni uporabnik, ki je inšpicient brez zapisov v TerminStoritve	$2y$05$NS4xMjkyMTcwMzExMjAxROHau47Dtb7CME5.nlWwBVM.nusFP.ra2	t	\N	\N	\N	joze@ifigenija.si	\N	\N	\N
00010000-55e8-154c-e2fd-9405f2d526c6	testna uporabnica, ki je planerka	$2y$05$NS4xMjkyMTcwMzExMjAxRO.B/uJO3C7QRNhdX9Q2hTLQsSupj1V1S	t	\N	\N	\N	petra@ifigenija.si	\N	\N	\N
00010000-55e8-154c-49c8-5f7421140d3f	testni uporabnik, ki dobi ifi-all vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROv2d7jqhaV/Mz3EIsKoi7UoFR.SDSMBm	t	\N	\N	\N	ali@ifigenija.si	\N	\N	\N
00010000-55e8-154c-1fd0-43c19b9d1348	testni uporabnik, ki dobi ifi-readall vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROYB9g.gnkufr1l/gWK6mkx.ySqrOWnJC	t	\N	\N	\N	berta@ifigenija.si	\N	\N	\N
00010000-55e8-154c-630d-96288d376eac	testni uporabnik, ki dobi aaa-write dovoljenje	$2y$05$NS4xMjkyMTcwMzExMjAxRORujYObKX.DzpXVYbePkiJkHqg0/Ylya	t	\N	\N	\N	aaron@ifigenija.si	\N	\N	\N
00010000-55e8-154c-1124-34fa147510fe	testni uporabnik ki dobi vsa posamezna dovoljenja	$2y$05$NS4xMjkyMTcwMzExMjAxRO2ymwxVXTr7U4Ncdn.bN49E8rLw9Jg0O	t	\N	\N	\N	vesna@ifigenija.si	\N	\N	\N
00010000-55e8-154a-b4fc-326a1aadc7ea	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 2956 (class 0 OID 17159193)
-- Dependencies: 221
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, producent_id, sifra, faza, naslov, podnaslov, delovninaslov, internacionalninaslov, naslovizvirnika, podnaslovizvirnika, datumzacstudija, stevilovaj, planiranostevilovaj, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, krstna, prvaslovenska, kratkinaslov, maticnioder_id) FROM stdin;
000e0000-55e8-154c-169c-b72e840fc45a	00160000-55e8-154b-9ed6-0b69f6e39112	\N	00140000-55e8-154a-af86-4eeac6affe60	\N	0001	produkcija	Sen kresne noči		Sanje	\N	\N	\N	2016-02-01	\N	\N	2016-06-01	1	William Shakespeare	f	2				\N	f	\N	\N		00220000-55e8-154b-4441-ef012b5c05a6
000e0000-55e8-154c-b9d1-a66976c52d49	00160000-55e8-154b-5005-b25007799285	\N	00140000-55e8-154a-ab22-86ec6d50ad25	\N	0002	predprodukcija-ideja	Smoletov vrt			\N	\N	\N	2016-01-01	\N	\N	2016-04-20	2	B. Hočevar	f	2				\N	f	\N	\N		00220000-55e8-154b-4e8b-dbcfdb24da5b
000e0000-55e8-154c-5055-5a399ef9fe83	\N	\N	00140000-55e8-154a-ab22-86ec6d50ad25	00190000-55e8-154c-271b-8014e013f11a	0003	postprodukcija	Kisli maček			\N	\N	\N	2016-02-01	\N	\N	2016-04-20	2	Caryl Churchill	t	2				\N	f	\N	\N		00220000-55e8-154b-4441-ef012b5c05a6
000e0000-55e8-154c-12bb-cd9d54a3e15c	\N	\N	00140000-55e8-154a-ab22-86ec6d50ad25	00190000-55e8-154c-271b-8014e013f11a	0004	postprodukcija	Vladimir			\N	\N	\N	2017-03-01	\N	\N	2017-04-20	2	Matjaž Zupančič	t	2				\N	f	\N	\N		00220000-55e8-154b-4441-ef012b5c05a6
000e0000-55e8-154c-4483-ed44ef130406	\N	\N	00140000-55e8-154a-ab22-86ec6d50ad25	00190000-55e8-154c-271b-8014e013f11a	0005	postprodukcija	Španska princesa			\N	\N	\N	2017-04-01	\N	\N	2017-05-20	1	Nina Kokelj	f	1				\N	f	\N	\N		00220000-55e8-154b-bad0-56ee5e827649
000e0000-55e8-154c-7b39-59a38847e84f	\N	\N	00140000-55e8-154a-ab22-86ec6d50ad25	00190000-55e8-154c-271b-8014e013f11a	0006	postprodukcija	Ne vemo datumov			\N	\N	\N	\N	\N	\N	\N	1	Nandi Frafar	f	1				\N	f	\N	\N		00220000-55e8-154b-bad0-56ee5e827649
\.


--
-- TOC entry 2926 (class 0 OID 17158889)
-- Dependencies: 191
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, uprizoritev_id, vrsta, zaporedna, porocilo) FROM stdin;
00200000-55e8-154c-d960-072037d502c3	000e0000-55e8-154c-b9d1-a66976c52d49	\N	1	
00200000-55e8-154c-fbb8-8d11c4a4bd46	000e0000-55e8-154c-b9d1-a66976c52d49	\N	2	
\.


--
-- TOC entry 2940 (class 0 OID 17159016)
-- Dependencies: 205
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 2950 (class 0 OID 17159119)
-- Dependencies: 215
-- Data for Name: vrstastroska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstastroska (id, skupina, podskupina, naziv, opis) FROM stdin;
003b0000-55e8-154a-4eb5-d05cafef45f1	1	0	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE
003b0000-55e8-154a-f8a1-c202b6adc1da	1	1	Storitve varovanja zgradb in prostorov	storitve varovanja zgradb in prostorov (npr. gasilci na predstavah)
003b0000-55e8-154a-fade-e3b37987e622	1	2	Založniške in tiskarske storitve	založniške in tiskarske storitve
003b0000-55e8-154a-cedb-c36c5ef50ffe	1	3	Časopisi, revije, knjige in strokovna literatura	časopisi, revije, knjige in strokovna literatura
003b0000-55e8-154a-2254-77fffb93a6bd	1	4	Stroški prevajalskih storitev	stroški prevajalskih storitev
003b0000-55e8-154a-9770-3404b98b848f	1	5	Stroški oglaševalskih storitev	stroški oglaševalskih storitev
003b0000-55e8-154a-0797-2f042af50151	1	6	Izdatki za reprezentanco	izdatki za reprezentanco
003b0000-55e8-154a-d59d-dc9fdd288cd5	2	0	POSEBNI MATERIAL IN STORITVE	POSEBNI MATERIAL IN STORITVE
003b0000-55e8-154a-3f48-38bebc47de30	2	1	Drugi posebni material in storitve	drugi posebni material in storitve (npr. za instrumete - navedite)
003b0000-55e8-154a-9ce4-2d4482343328	2	2	Oprema predstave – stroški rekvizitov	Oprema predstave – stroški rekvizitov
003b0000-55e8-154a-cd49-6ebacbbf5109	2	3	Oprema predstave – stroški kostumov	Oprema predstave – stroški kostumov
003b0000-55e8-154a-c49b-2ec9f9ac0752	2	4	Oprema predstave – stroški scenske opreme	Oprema predstave – stroški scenske opreme
003b0000-55e8-154a-ed55-47cc41c86295	2	5	Oprema predstave – stroški avdio in video opreme	Oprema predstave – stroški avdio in video opreme
003b0000-55e8-154a-b05e-89fdb78041c3	3	0	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE
003b0000-55e8-154a-1386-39834b7d6df2	3	1	Poštnina in kurirske storitve	poštnina in kurirske storitve
003b0000-55e8-154a-f18b-06b3417c6bba	4	0	PREVOZNI STROŠKI IN STORITVE	PREVOZNI STROŠKI IN STORITVE
003b0000-55e8-154a-558e-1cdd0f4ce3a5	4	1	Goriva in maziva za prevozna sredstva	goriva in maziva za prevozna sredstva
003b0000-55e8-154a-74fc-645c12c753f8	4	2	Najem vozil in selitveni stroški	najem vozil in selitveni stroški
003b0000-55e8-154a-ca58-2b48cc2110e9	4	3	Drugi prevozni in transportni stroški 	drugi prevozni in transportni stroški (navedite)
003b0000-55e8-154a-94be-0bcaffe8c4c1	5	0	IZDATKI ZA SLUŽBENA POTOVANJA	IZDATKI ZA SLUŽBENA POTOVANJA
003b0000-55e8-154a-3f2e-dc13e048e6e2	5	1	Dnevnice za službena potovanja v državi in tujini	dnevnice za službena potovanja v državi in tujini
003b0000-55e8-154a-fde4-601ccd304431	5	2	Hotelske in restavra. storitve v državi in tujini	hotelske in restavra. storitve v državi in tujini
003b0000-55e8-154a-7980-6d5ce8096b09	5	3	Stroški prevoza v državi in tujini	stroški prevoza v državi in tujini
003b0000-55e8-154a-ef36-c275e3f51d3c	5	4	Drugi izdatki za službena potovanja	drugi izdatki za službena potovanja (navedite)
003b0000-55e8-154a-a3a6-9417cf13e135	6	0	NAJEMNINE IN ZAKUPNINE	NAJEMNINE IN ZAKUPNINE
003b0000-55e8-154a-f562-390c0dd1375e	6	1	Druge najemnine, zakupnine in licenčnine	druge najemnine, zakupnine in licenčnine (npr. najem notnega materiala, instrumentov - navedite)
003b0000-55e8-154a-53a6-38a221654b18	7	0	DRUGI OPERATIVNI ODHODKI	DRUGI OPERATIVNI ODHODKI
003b0000-55e8-154a-dfb9-c6ba005ac1f0	7	1	Izdatki za strok. izobraževanje zap.	izdatki za strok. izobraževanje zap.(vezani na program. enote)  
\.


--
-- TOC entry 2970 (class 0 OID 17159445)
-- Dependencies: 235
-- Data for Name: vrstazapisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstazapisa (id, oznaka, naziv, aktiven, znacka, ikona, upor, datknj) FROM stdin;
\.


--
-- TOC entry 2969 (class 0 OID 17159417)
-- Dependencies: 234
-- Data for Name: zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapis (id, vrsta_id, datoteka_id, mapa_id, avtor_id, zaklenil_id, tip, zaklenjen, datumzaklepanja, identifier, subject, title, description, coverage, creator, language, date, publisher, relation, rights, source, upor, datknj, standard, lokacija) FROM stdin;
\.


--
-- TOC entry 2971 (class 0 OID 17159457)
-- Dependencies: 236
-- Data for Name: zapislastnik; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapislastnik (id, zapis_id, lastnik, classlastnika, datum, upor, datknj) FROM stdin;
\.


--
-- TOC entry 2947 (class 0 OID 17159088)
-- Dependencies: 212
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, sifra, status, zacetek, konec, tip, delovnaobveza, malica, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci) FROM stdin;
00100000-55e8-154c-598f-b7e55b8c723f	00090000-55e8-154c-f4a9-299cbc45680d	01	A	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55e8-154c-d1f8-0a10ff75b804	00090000-55e8-154c-62b5-06db238b5e4c	02	A	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55e8-154c-36ef-c0fbeaa7ecac	00090000-55e8-154c-a214-c350f90e739c	03	A	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55e8-154c-edc8-7873a22f6505	00090000-55e8-154c-162a-281a4242c709	04	A	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55e8-154c-a369-30cf2c8f1c36	00090000-55e8-154c-896b-15dd0a6d30f4	05	A	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55e8-154c-04e9-922a8171e365	00090000-55e8-154c-550c-a7c5a9e06f96	06	A	2010-02-01	2010-02-01	1	2		t	f	f	t
\.


--
-- TOC entry 2928 (class 0 OID 17158925)
-- Dependencies: 193
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id) FROM stdin;
\.


--
-- TOC entry 2955 (class 0 OID 17159183)
-- Dependencies: 220
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, sifra, naziv, opis) FROM stdin;
00140000-55e8-154a-af86-4eeac6affe60	01	Drama	drama (SURS 01)
00140000-55e8-154a-0f39-40002f4deded	02	Opera	opera (SURS 02)
00140000-55e8-154a-966b-ffea7fa81c8c	03	Balet	balet (SURS 03)
00140000-55e8-154a-9e37-ee1882ea01a2	04	Plesne prireditve	plesne prireditve (SURS 04)
00140000-55e8-154a-27b1-4f8a198b39ef	05	Lutkovno gledališče	lutkovno gledališče (SURS 05)
00140000-55e8-154a-ab22-86ec6d50ad25	06	Raziskovalno gledališče	raziskovalno gledališče (SURS 06)
00140000-55e8-154a-c737-bd04c1da6868	07	Drugo	drugo (SURS 07)
\.


--
-- TOC entry 2946 (class 0 OID 17159078)
-- Dependencies: 211
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, sifra, naziv, opis) FROM stdin;
\.


--
-- TOC entry 2454 (class 2606 OID 17158729)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2629 (class 2606 OID 17159242)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2625 (class 2606 OID 17159232)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2602 (class 2606 OID 17159144)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2692 (class 2606 OID 17159497)
-- Name: datoteka_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT datoteka_pkey PRIMARY KEY (id);


--
-- TOC entry 2508 (class 2606 OID 17158914)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2522 (class 2606 OID 17158934)
-- Name: dogodeksplosni_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodeksplosni
    ADD CONSTRAINT dogodeksplosni_pkey PRIMARY KEY (id);


--
-- TOC entry 2659 (class 2606 OID 17159391)
-- Name: drugivir_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT drugivir_pkey PRIMARY KEY (id);


--
-- TOC entry 2488 (class 2606 OID 17158854)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2636 (class 2606 OID 17159297)
-- Name: enotaprograma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT enotaprograma_pkey PRIMARY KEY (id);


--
-- TOC entry 2580 (class 2606 OID 17159074)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2502 (class 2606 OID 17158887)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2496 (class 2606 OID 17158868)
-- Name: kontaktnaoseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT kontaktnaoseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2544 (class 2606 OID 17158981)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2686 (class 2606 OID 17159474)
-- Name: mapa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT mapa_pkey PRIMARY KEY (id);


--
-- TOC entry 2690 (class 2606 OID 17159481)
-- Name: mapa_zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT mapa_zapis_pkey PRIMARY KEY (mapa_id, zapis_id);


--
-- TOC entry 2697 (class 2606 OID 17159505)
-- Name: mapaacl_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT mapaacl_pkey PRIMARY KEY (id);


--
-- TOC entry 2435 (class 2606 OID 16867881)
-- Name: migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY migrations
    ADD CONSTRAINT migrations_pkey PRIMARY KEY (version);


--
-- TOC entry 2556 (class 2606 OID 17159008)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2481 (class 2606 OID 17158826)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2458 (class 2606 OID 17158738)
-- Name: optionvalue_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT optionvalue_pkey PRIMARY KEY (id);


--
-- TOC entry 2461 (class 2606 OID 17158762)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2452 (class 2606 OID 17158718)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2445 (class 2606 OID 17158703)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2559 (class 2606 OID 17159014)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2573 (class 2606 OID 17159050)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2611 (class 2606 OID 17159178)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2470 (class 2606 OID 17158790)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2478 (class 2606 OID 17158814)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2548 (class 2606 OID 17158987)
-- Name: postavkaracuna_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT postavkaracuna_pkey PRIMARY KEY (id);


--
-- TOC entry 2476 (class 2606 OID 17158804)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2500 (class 2606 OID 17158875)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2554 (class 2606 OID 17158999)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2648 (class 2606 OID 17159354)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2650 (class 2606 OID 17159362)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2644 (class 2606 OID 17159345)
-- Name: programdela_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT programdela_pkey PRIMARY KEY (id);


--
-- TOC entry 2655 (class 2606 OID 17159373)
-- Name: programskaenotasklopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT programskaenotasklopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2566 (class 2606 OID 17159032)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2542 (class 2606 OID 17158972)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2536 (class 2606 OID 17158963)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2606 (class 2606 OID 17159166)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2593 (class 2606 OID 17159102)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2437 (class 2606 OID 17158674)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2571 (class 2606 OID 17159041)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2443 (class 2606 OID 17158692)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2447 (class 2606 OID 17158712)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2578 (class 2606 OID 17159059)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2550 (class 2606 OID 17158994)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2524 (class 2606 OID 17158943)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2668 (class 2606 OID 17159415)
-- Name: stevilcenje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenje
    ADD CONSTRAINT stevilcenje_pkey PRIMARY KEY (id);


--
-- TOC entry 2665 (class 2606 OID 17159403)
-- Name: stevilcenjekonfig_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT stevilcenjekonfig_pkey PRIMARY KEY (id);


--
-- TOC entry 2662 (class 2606 OID 17159397)
-- Name: stevilcenjestanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjestanje
    ADD CONSTRAINT stevilcenjestanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2598 (class 2606 OID 17159115)
-- Name: strosekuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT strosekuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2467 (class 2606 OID 17158771)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2530 (class 2606 OID 17158954)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2604 (class 2606 OID 17159155)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2657 (class 2606 OID 17159385)
-- Name: tipprogramskeenote_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipprogramskeenote
    ADD CONSTRAINT tipprogramskeenote_pkey PRIMARY KEY (id);


--
-- TOC entry 2486 (class 2606 OID 17158839)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2439 (class 2606 OID 17158687)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2623 (class 2606 OID 17159211)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2506 (class 2606 OID 17158897)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2562 (class 2606 OID 17159022)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2600 (class 2606 OID 17159127)
-- Name: vrstastroska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstastroska
    ADD CONSTRAINT vrstastroska_pkey PRIMARY KEY (id);


--
-- TOC entry 2679 (class 2606 OID 17159455)
-- Name: vrstazapisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstazapisa
    ADD CONSTRAINT vrstazapisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2676 (class 2606 OID 17159439)
-- Name: zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT zapis_pkey PRIMARY KEY (id);


--
-- TOC entry 2682 (class 2606 OID 17159463)
-- Name: zapislastnik_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT zapislastnik_pkey PRIMARY KEY (id);


--
-- TOC entry 2589 (class 2606 OID 17159093)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2520 (class 2606 OID 17158929)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2615 (class 2606 OID 17159191)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2586 (class 2606 OID 17159086)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2509 (class 1259 OID 17158923)
-- Name: dogodki_konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_konec ON dogodek USING btree (konec);


--
-- TOC entry 2510 (class 1259 OID 17158924)
-- Name: dogodki_razred; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_razred ON dogodek USING btree (razred);


--
-- TOC entry 2511 (class 1259 OID 17158922)
-- Name: dogodki_zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2512 (class 1259 OID 17158921)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2594 (class 1259 OID 17159116)
-- Name: idx_11ffe6e05c75296c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e05c75296c ON strosekuprizoritve USING btree (vrstastroska_id);


--
-- TOC entry 2595 (class 1259 OID 17159117)
-- Name: idx_11ffe6e062b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e062b4ffca ON strosekuprizoritve USING btree (uprizoritev_id);


--
-- TOC entry 2596 (class 1259 OID 17159118)
-- Name: idx_11ffe6e06beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e06beede51 ON strosekuprizoritve USING btree (popa_id);


--
-- TOC entry 2683 (class 1259 OID 17159476)
-- Name: idx_14a5d6d3727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d3727aca70 ON mapa USING btree (parent_id);


--
-- TOC entry 2684 (class 1259 OID 17159475)
-- Name: idx_14a5d6d38a4a6c12; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d38a4a6c12 ON mapa USING btree (lastnik_id);


--
-- TOC entry 2468 (class 1259 OID 17158792)
-- Name: idx_1c7adba5ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba5ee4b985a ON popa USING btree (drzava_id);


--
-- TOC entry 2557 (class 1259 OID 17159015)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2670 (class 1259 OID 17159443)
-- Name: idx_1ed92829253c4123; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829253c4123 ON zapis USING btree (avtor_id);


--
-- TOC entry 2671 (class 1259 OID 17159442)
-- Name: idx_1ed9282957ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282957ed422f ON zapis USING btree (mapa_id);


--
-- TOC entry 2672 (class 1259 OID 17159444)
-- Name: idx_1ed9282987ff3295; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282987ff3295 ON zapis USING btree (zaklenil_id);


--
-- TOC entry 2673 (class 1259 OID 17159441)
-- Name: idx_1ed92829a54dbb1f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829a54dbb1f ON zapis USING btree (datoteka_id);


--
-- TOC entry 2674 (class 1259 OID 17159440)
-- Name: idx_1ed92829ef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829ef943358 ON zapis USING btree (vrsta_id);


--
-- TOC entry 2551 (class 1259 OID 17159001)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2552 (class 1259 OID 17159000)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2504 (class 1259 OID 17158898)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2581 (class 1259 OID 17159075)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2582 (class 1259 OID 17159077)
-- Name: idx_23aeb9586b361365; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9586b361365 ON funkcija USING btree (tipfunkcije_id);


--
-- TOC entry 2583 (class 1259 OID 17159076)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2493 (class 1259 OID 17158870)
-- Name: idx_2942b10710389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b10710389148 ON kontaktnaoseba USING btree (oseba_id);


--
-- TOC entry 2494 (class 1259 OID 17158869)
-- Name: idx_2942b1076beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b1076beede51 ON kontaktnaoseba USING btree (popa_id);


--
-- TOC entry 2653 (class 1259 OID 17159374)
-- Name: idx_2d901816d6bc69d6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2d901816d6bc69d6 ON programskaenotasklopa USING btree (programrazno_id);


--
-- TOC entry 2607 (class 1259 OID 17159180)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2608 (class 1259 OID 17159181)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2609 (class 1259 OID 17159182)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2680 (class 1259 OID 17159464)
-- Name: idx_2eaff9dcaf91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2eaff9dcaf91ecd ON zapislastnik USING btree (zapis_id);


--
-- TOC entry 2616 (class 1259 OID 17159216)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2617 (class 1259 OID 17159213)
-- Name: idx_344a77a7c3b0d59; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a7c3b0d59 ON uprizoritev USING btree (maticnioder_id);


--
-- TOC entry 2618 (class 1259 OID 17159217)
-- Name: idx_344a77a853a965c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a853a965c ON uprizoritev USING btree (producent_id);


--
-- TOC entry 2619 (class 1259 OID 17159215)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2620 (class 1259 OID 17159214)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2483 (class 1259 OID 17158841)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2484 (class 1259 OID 17158840)
-- Name: idx_37f6541a6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a6beede51 ON trr USING btree (popa_id);


--
-- TOC entry 2459 (class 1259 OID 17158765)
-- Name: idx_466966d769e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_466966d769e8d4 ON oseba USING btree (naslov_id);


--
-- TOC entry 2569 (class 1259 OID 17159042)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2449 (class 1259 OID 17158719)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2450 (class 1259 OID 17158720)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2574 (class 1259 OID 17159062)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2575 (class 1259 OID 17159061)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2576 (class 1259 OID 17159060)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2497 (class 1259 OID 17158876)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2498 (class 1259 OID 17158877)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2663 (class 1259 OID 17159405)
-- Name: idx_6054e804ff55f926; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_6054e804ff55f926 ON stevilcenjekonfig USING btree (stevilcenje_id);


--
-- TOC entry 2531 (class 1259 OID 17158967)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2532 (class 1259 OID 17158965)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2533 (class 1259 OID 17158964)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2534 (class 1259 OID 17158966)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2440 (class 1259 OID 17158693)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2441 (class 1259 OID 17158694)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2560 (class 1259 OID 17159023)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2693 (class 1259 OID 17159498)
-- Name: idx_781826c67e3c61f9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_781826c67e3c61f9 ON datoteka USING btree (owner_id);


--
-- TOC entry 2694 (class 1259 OID 17159506)
-- Name: idx_7adc957157ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc957157ed422f ON mapaacl USING btree (mapa_id);


--
-- TOC entry 2695 (class 1259 OID 17159507)
-- Name: idx_7adc9571fa6311ef; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc9571fa6311ef ON mapaacl USING btree (perm_id);


--
-- TOC entry 2546 (class 1259 OID 17158988)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2590 (class 1259 OID 17159103)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2591 (class 1259 OID 17159104)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2637 (class 1259 OID 17159302)
-- Name: idx_8787a0e54ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e54ae1cd1c ON enotaprograma USING btree (gostitelj_id);


--
-- TOC entry 2638 (class 1259 OID 17159301)
-- Name: idx_8787a0e55d0da56c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e55d0da56c ON enotaprograma USING btree (drzavagostovanja_id);


--
-- TOC entry 2639 (class 1259 OID 17159298)
-- Name: idx_8787a0e562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e562b4ffca ON enotaprograma USING btree (uprizoritev_id);


--
-- TOC entry 2640 (class 1259 OID 17159299)
-- Name: idx_8787a0e57222d84b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e57222d84b ON enotaprograma USING btree (tipprogramskeenote_id);


--
-- TOC entry 2641 (class 1259 OID 17159300)
-- Name: idx_8787a0e5771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e5771ec7bd ON enotaprograma USING btree (program_dela_id);


--
-- TOC entry 2472 (class 1259 OID 17158806)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2473 (class 1259 OID 17158805)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2474 (class 1259 OID 17158807)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2563 (class 1259 OID 17159036)
-- Name: idx_952dd21969e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd21969e8d4 ON prostor USING btree (naslov_id);


--
-- TOC entry 2564 (class 1259 OID 17159035)
-- Name: idx_952dd2196beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd2196beede51 ON prostor USING btree (popa_id);


--
-- TOC entry 2645 (class 1259 OID 17159355)
-- Name: idx_97af082e38c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e38c06eb ON produkcijadelitev USING btree (enotaprograma_id);


--
-- TOC entry 2646 (class 1259 OID 17159356)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2630 (class 1259 OID 17159246)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2631 (class 1259 OID 17159247)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2632 (class 1259 OID 17159244)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2633 (class 1259 OID 17159245)
-- Name: idx_a4b7244fa4976613; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fa4976613 ON alternacija USING btree (zaposlitev_id);


--
-- TOC entry 2587 (class 1259 OID 17159094)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2537 (class 1259 OID 17158976)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2538 (class 1259 OID 17158975)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2539 (class 1259 OID 17158973)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2540 (class 1259 OID 17158974)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2626 (class 1259 OID 17159234)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2627 (class 1259 OID 17159233)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2642 (class 1259 OID 17159346)
-- Name: idx_c81bc37f3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c81bc37f3a0e32e3 ON programdela USING btree (sezona_id);


--
-- TOC entry 2503 (class 1259 OID 17158888)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2660 (class 1259 OID 17159392)
-- Name: idx_e7d4cf2638c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e7d4cf2638c06eb ON drugivir USING btree (enotaprograma_id);


--
-- TOC entry 2687 (class 1259 OID 17159482)
-- Name: idx_e9f8ee8257ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee8257ed422f ON mapa_zapis USING btree (mapa_id);


--
-- TOC entry 2688 (class 1259 OID 17159483)
-- Name: idx_e9f8ee82af91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee82af91ecd ON mapa_zapis USING btree (zapis_id);


--
-- TOC entry 2455 (class 1259 OID 17158740)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2456 (class 1259 OID 17158739)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2464 (class 1259 OID 17158772)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2465 (class 1259 OID 17158773)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2526 (class 1259 OID 17158957)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2527 (class 1259 OID 17158956)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2528 (class 1259 OID 17158955)
-- Name: idx_fef7d84ba81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84ba81ccef6 ON terminstoritve USING btree (dogodek_id);


--
-- TOC entry 2513 (class 1259 OID 17158916)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2514 (class 1259 OID 17158917)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2515 (class 1259 OID 17158915)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2516 (class 1259 OID 17158919)
-- Name: uniq_11e93b5dbbc7a989; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dbbc7a989 ON dogodek USING btree (dogodek_splosni_id);


--
-- TOC entry 2517 (class 1259 OID 17158920)
-- Name: uniq_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2518 (class 1259 OID 17158918)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2471 (class 1259 OID 17158791)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2489 (class 1259 OID 17158855)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2490 (class 1259 OID 17158857)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2491 (class 1259 OID 17158856)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2492 (class 1259 OID 17158858)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2545 (class 1259 OID 17158982)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2612 (class 1259 OID 17159179)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2621 (class 1259 OID 17159212)
-- Name: uniq_344a77a559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_344a77a559828a3 ON uprizoritev USING btree (sifra);


--
-- TOC entry 2462 (class 1259 OID 17158763)
-- Name: uniq_466966d7559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7559828a3 ON oseba USING btree (sifra);


--
-- TOC entry 2463 (class 1259 OID 17158764)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2584 (class 1259 OID 17159087)
-- Name: uniq_5216fcb0559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5216fcb0559828a3 ON zvrstuprizoritve USING btree (sifra);


--
-- TOC entry 2669 (class 1259 OID 17159416)
-- Name: uniq_5a434fbc559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5a434fbc559828a3 ON stevilcenje USING btree (sifra);


--
-- TOC entry 2482 (class 1259 OID 17158827)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2666 (class 1259 OID 17159404)
-- Name: uniq_6054e804889a7556; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_6054e804889a7556 ON stevilcenjekonfig USING btree (dok);


--
-- TOC entry 2567 (class 1259 OID 17159034)
-- Name: uniq_952dd21937854736; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21937854736 ON prostor USING btree (naziv);


--
-- TOC entry 2568 (class 1259 OID 17159033)
-- Name: uniq_952dd219559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd219559828a3 ON prostor USING btree (sifra);


--
-- TOC entry 2634 (class 1259 OID 17159243)
-- Name: uniq_a4b7244f559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a4b7244f559828a3 ON alternacija USING btree (sifra);


--
-- TOC entry 2479 (class 1259 OID 17158815)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2613 (class 1259 OID 17159192)
-- Name: uniq_cede8e36559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_cede8e36559828a3 ON zvrstsurs USING btree (sifra);


--
-- TOC entry 2677 (class 1259 OID 17159456)
-- Name: uniq_de1c8aa1d55226c7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_de1c8aa1d55226c7 ON vrstazapisa USING btree (oznaka);


--
-- TOC entry 2651 (class 1259 OID 17159363)
-- Name: uniq_e6fc2028559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc2028559828a3 ON produkcijskahisa USING btree (sifra);


--
-- TOC entry 2652 (class 1259 OID 17159364)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2525 (class 1259 OID 17158944)
-- Name: uniq_ecc8f8c5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ecc8f8c5559828a3 ON sezona USING btree (sifra);


--
-- TOC entry 2448 (class 1259 OID 17158713)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2725 (class 2606 OID 17159623)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2724 (class 2606 OID 17159628)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2720 (class 2606 OID 17159648)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2726 (class 2606 OID 17159618)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2722 (class 2606 OID 17159638)
-- Name: fk_11e93b5dbbc7a989; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dbbc7a989 FOREIGN KEY (dogodek_splosni_id) REFERENCES dogodeksplosni(id);


--
-- TOC entry 2721 (class 2606 OID 17159643)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2723 (class 2606 OID 17159633)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2758 (class 2606 OID 17159798)
-- Name: fk_11ffe6e05c75296c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e05c75296c FOREIGN KEY (vrstastroska_id) REFERENCES vrstastroska(id);


--
-- TOC entry 2757 (class 2606 OID 17159803)
-- Name: fk_11ffe6e062b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e062b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2756 (class 2606 OID 17159808)
-- Name: fk_11ffe6e06beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e06beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2791 (class 2606 OID 17159978)
-- Name: fk_14a5d6d3727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d3727aca70 FOREIGN KEY (parent_id) REFERENCES mapa(id);


--
-- TOC entry 2792 (class 2606 OID 17159973)
-- Name: fk_14a5d6d38a4a6c12; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d38a4a6c12 FOREIGN KEY (lastnik_id) REFERENCES uporabniki(id);


--
-- TOC entry 2708 (class 2606 OID 17159558)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2742 (class 2606 OID 17159728)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2786 (class 2606 OID 17159958)
-- Name: fk_1ed92829253c4123; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829253c4123 FOREIGN KEY (avtor_id) REFERENCES uporabniki(id);


--
-- TOC entry 2787 (class 2606 OID 17159953)
-- Name: fk_1ed9282957ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282957ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2785 (class 2606 OID 17159963)
-- Name: fk_1ed9282987ff3295; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282987ff3295 FOREIGN KEY (zaklenil_id) REFERENCES uporabniki(id);


--
-- TOC entry 2788 (class 2606 OID 17159948)
-- Name: fk_1ed92829a54dbb1f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829a54dbb1f FOREIGN KEY (datoteka_id) REFERENCES datoteka(id);


--
-- TOC entry 2789 (class 2606 OID 17159943)
-- Name: fk_1ed92829ef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829ef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstazapisa(id);


--
-- TOC entry 2740 (class 2606 OID 17159723)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2741 (class 2606 OID 17159718)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2719 (class 2606 OID 17159613)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2752 (class 2606 OID 17159768)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2750 (class 2606 OID 17159778)
-- Name: fk_23aeb9586b361365; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9586b361365 FOREIGN KEY (tipfunkcije_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2751 (class 2606 OID 17159773)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2714 (class 2606 OID 17159593)
-- Name: fk_2942b10710389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b10710389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2715 (class 2606 OID 17159588)
-- Name: fk_2942b1076beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b1076beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2738 (class 2606 OID 17159708)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2782 (class 2606 OID 17159928)
-- Name: fk_2d901816d6bc69d6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT fk_2d901816d6bc69d6 FOREIGN KEY (programrazno_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2761 (class 2606 OID 17159813)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2760 (class 2606 OID 17159818)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2759 (class 2606 OID 17159823)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 2790 (class 2606 OID 17159968)
-- Name: fk_2eaff9dcaf91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT fk_2eaff9dcaf91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id);


--
-- TOC entry 2763 (class 2606 OID 17159843)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2766 (class 2606 OID 17159828)
-- Name: fk_344a77a7c3b0d59; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a7c3b0d59 FOREIGN KEY (maticnioder_id) REFERENCES prostor(id);


--
-- TOC entry 2762 (class 2606 OID 17159848)
-- Name: fk_344a77a853a965c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a853a965c FOREIGN KEY (producent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2764 (class 2606 OID 17159838)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2765 (class 2606 OID 17159833)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2712 (class 2606 OID 17159583)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2713 (class 2606 OID 17159578)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2704 (class 2606 OID 17159543)
-- Name: fk_466966d769e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d769e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2705 (class 2606 OID 17159538)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2746 (class 2606 OID 17159748)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2701 (class 2606 OID 17159518)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2700 (class 2606 OID 17159523)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2747 (class 2606 OID 17159763)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2748 (class 2606 OID 17159758)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2749 (class 2606 OID 17159753)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2717 (class 2606 OID 17159598)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2716 (class 2606 OID 17159603)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2784 (class 2606 OID 17159938)
-- Name: fk_6054e804ff55f926; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT fk_6054e804ff55f926 FOREIGN KEY (stevilcenje_id) REFERENCES stevilcenje(id);


--
-- TOC entry 2730 (class 2606 OID 17159683)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2732 (class 2606 OID 17159673)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2733 (class 2606 OID 17159668)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2731 (class 2606 OID 17159678)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2699 (class 2606 OID 17159508)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2698 (class 2606 OID 17159513)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2743 (class 2606 OID 17159733)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2795 (class 2606 OID 17159993)
-- Name: fk_781826c67e3c61f9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT fk_781826c67e3c61f9 FOREIGN KEY (owner_id) REFERENCES uporabniki(id);


--
-- TOC entry 2797 (class 2606 OID 17159998)
-- Name: fk_7adc957157ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc957157ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2796 (class 2606 OID 17160003)
-- Name: fk_7adc9571fa6311ef; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc9571fa6311ef FOREIGN KEY (perm_id) REFERENCES permission(id);


--
-- TOC entry 2739 (class 2606 OID 17159713)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2755 (class 2606 OID 17159788)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2754 (class 2606 OID 17159793)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2773 (class 2606 OID 17159903)
-- Name: fk_8787a0e54ae1cd1c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e54ae1cd1c FOREIGN KEY (gostitelj_id) REFERENCES popa(id);


--
-- TOC entry 2774 (class 2606 OID 17159898)
-- Name: fk_8787a0e55d0da56c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e55d0da56c FOREIGN KEY (drzavagostovanja_id) REFERENCES drza(id);


--
-- TOC entry 2777 (class 2606 OID 17159883)
-- Name: fk_8787a0e562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2776 (class 2606 OID 17159888)
-- Name: fk_8787a0e57222d84b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e57222d84b FOREIGN KEY (tipprogramskeenote_id) REFERENCES tipprogramskeenote(id);


--
-- TOC entry 2775 (class 2606 OID 17159893)
-- Name: fk_8787a0e5771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e5771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2710 (class 2606 OID 17159568)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2711 (class 2606 OID 17159563)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2709 (class 2606 OID 17159573)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2744 (class 2606 OID 17159743)
-- Name: fk_952dd21969e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd21969e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2745 (class 2606 OID 17159738)
-- Name: fk_952dd2196beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd2196beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2780 (class 2606 OID 17159913)
-- Name: fk_97af082e38c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e38c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2779 (class 2606 OID 17159918)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2770 (class 2606 OID 17159873)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2769 (class 2606 OID 17159878)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2772 (class 2606 OID 17159863)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 2771 (class 2606 OID 17159868)
-- Name: fk_a4b7244fa4976613; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fa4976613 FOREIGN KEY (zaposlitev_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2753 (class 2606 OID 17159783)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2734 (class 2606 OID 17159703)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2735 (class 2606 OID 17159698)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2737 (class 2606 OID 17159688)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2736 (class 2606 OID 17159693)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2767 (class 2606 OID 17159858)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2768 (class 2606 OID 17159853)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2778 (class 2606 OID 17159908)
-- Name: fk_c81bc37f3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT fk_c81bc37f3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2718 (class 2606 OID 17159608)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2781 (class 2606 OID 17159923)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2783 (class 2606 OID 17159933)
-- Name: fk_e7d4cf2638c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT fk_e7d4cf2638c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2794 (class 2606 OID 17159983)
-- Name: fk_e9f8ee8257ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee8257ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id) ON DELETE CASCADE;


--
-- TOC entry 2793 (class 2606 OID 17159988)
-- Name: fk_e9f8ee82af91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee82af91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id) ON DELETE CASCADE;


--
-- TOC entry 2702 (class 2606 OID 17159533)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2703 (class 2606 OID 17159528)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2707 (class 2606 OID 17159548)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2706 (class 2606 OID 17159553)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2727 (class 2606 OID 17159663)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2728 (class 2606 OID 17159658)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2729 (class 2606 OID 17159653)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- Completed on 2015-09-03 11:39:26 CEST

--
-- PostgreSQL database dump complete
--

