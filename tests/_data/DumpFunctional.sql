--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.9
-- Dumped by pg_dump version 9.3.9
-- Started on 2015-09-02 15:09:59 CEST

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
-- TOC entry 178 (class 1259 OID 16878917)
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
-- TOC entry 223 (class 1259 OID 16879431)
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
-- TOC entry 222 (class 1259 OID 16879414)
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
-- TOC entry 216 (class 1259 OID 16879324)
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
-- TOC entry 239 (class 1259 OID 16879680)
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
-- TOC entry 192 (class 1259 OID 16879095)
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
-- TOC entry 194 (class 1259 OID 16879126)
-- Name: dogodeksplosni; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodeksplosni (
    id uuid NOT NULL
);


--
-- TOC entry 230 (class 1259 OID 16879582)
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
-- TOC entry 187 (class 1259 OID 16879038)
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
-- TOC entry 224 (class 1259 OID 16879444)
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
-- TOC entry 210 (class 1259 OID 16879259)
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
-- TOC entry 190 (class 1259 OID 16879074)
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
-- TOC entry 188 (class 1259 OID 16879055)
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
-- TOC entry 199 (class 1259 OID 16879173)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 237 (class 1259 OID 16879661)
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
-- TOC entry 238 (class 1259 OID 16879673)
-- Name: mapa_zapis; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE mapa_zapis (
    mapa_id uuid NOT NULL,
    zapis_id uuid NOT NULL
);


--
-- TOC entry 240 (class 1259 OID 16879695)
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
-- TOC entry 203 (class 1259 OID 16879198)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 185 (class 1259 OID 16879012)
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
-- TOC entry 179 (class 1259 OID 16878926)
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
-- TOC entry 180 (class 1259 OID 16878937)
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
-- TOC entry 175 (class 1259 OID 16878891)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 177 (class 1259 OID 16878910)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 204 (class 1259 OID 16879205)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 208 (class 1259 OID 16879239)
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
-- TOC entry 219 (class 1259 OID 16879363)
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
-- TOC entry 182 (class 1259 OID 16878970)
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
-- TOC entry 184 (class 1259 OID 16879004)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 200 (class 1259 OID 16879179)
-- Name: postavkaracuna; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE postavkaracuna (
    id uuid NOT NULL,
    racun_id uuid
);


--
-- TOC entry 183 (class 1259 OID 16878989)
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
-- TOC entry 189 (class 1259 OID 16879067)
-- Name: predstava; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE predstava (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    gostovanje_id uuid
);


--
-- TOC entry 202 (class 1259 OID 16879191)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 226 (class 1259 OID 16879543)
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
-- TOC entry 227 (class 1259 OID 16879553)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    sifra character varying(4) NOT NULL,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 225 (class 1259 OID 16879499)
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
-- TOC entry 228 (class 1259 OID 16879561)
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
-- TOC entry 206 (class 1259 OID 16879220)
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
-- TOC entry 198 (class 1259 OID 16879164)
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
-- TOC entry 197 (class 1259 OID 16879154)
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
-- TOC entry 218 (class 1259 OID 16879352)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying,
    status character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 213 (class 1259 OID 16879291)
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
-- TOC entry 172 (class 1259 OID 16878862)
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
-- TOC entry 171 (class 1259 OID 16878860)
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
-- TOC entry 207 (class 1259 OID 16879233)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 176 (class 1259 OID 16878900)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 174 (class 1259 OID 16878884)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 209 (class 1259 OID 16879247)
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
-- TOC entry 201 (class 1259 OID 16879185)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 195 (class 1259 OID 16879131)
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
-- TOC entry 233 (class 1259 OID 16879602)
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
-- TOC entry 232 (class 1259 OID 16879594)
-- Name: stevilcenjekonfig; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjekonfig (
    id uuid NOT NULL,
    stevilcenje_id uuid,
    dok character varying(100) DEFAULT NULL::character varying
);


--
-- TOC entry 231 (class 1259 OID 16879589)
-- Name: stevilcenjestanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjestanje (
    id uuid NOT NULL,
    objid uuid NOT NULL,
    leto integer NOT NULL,
    stevilka integer
);


--
-- TOC entry 214 (class 1259 OID 16879301)
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
-- TOC entry 181 (class 1259 OID 16878962)
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
-- TOC entry 196 (class 1259 OID 16879141)
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
-- TOC entry 217 (class 1259 OID 16879341)
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
-- TOC entry 229 (class 1259 OID 16879571)
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
-- TOC entry 186 (class 1259 OID 16879024)
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
-- TOC entry 173 (class 1259 OID 16878871)
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
-- TOC entry 221 (class 1259 OID 16879389)
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
-- TOC entry 191 (class 1259 OID 16879085)
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
-- TOC entry 205 (class 1259 OID 16879212)
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
-- TOC entry 215 (class 1259 OID 16879315)
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
-- TOC entry 235 (class 1259 OID 16879641)
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
-- TOC entry 234 (class 1259 OID 16879613)
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
-- TOC entry 236 (class 1259 OID 16879653)
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
-- TOC entry 212 (class 1259 OID 16879284)
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
-- TOC entry 193 (class 1259 OID 16879121)
-- Name: zasedenost; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zasedenost (
    id uuid NOT NULL
);


--
-- TOC entry 220 (class 1259 OID 16879379)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 211 (class 1259 OID 16879274)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 2175 (class 2604 OID 16878865)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 2913 (class 0 OID 16878917)
-- Dependencies: 178
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
\.


--
-- TOC entry 2958 (class 0 OID 16879431)
-- Dependencies: 223
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, zaposlitev_id, oseba_id, pogodba_id, sifra, zaposlen, zacetek, konec, opomba, sort, privzeti, aktivna, imapogodbo, pomembna) FROM stdin;
000c0000-55e6-f525-fac2-719e79cec865	000d0000-55e6-f525-4bf5-5fa23b1df912	\N	00090000-55e6-f525-490f-3d192febd5f1	000b0000-55e6-f525-7a3f-fd99ae148004	0001	f	\N	\N	\N	3	\N	\N	t	t
000c0000-55e6-f525-98e9-84e8099703e0	000d0000-55e6-f525-d77c-3f5a303e9c3a	00100000-55e6-f525-6a92-63d8b6afb8c3	00090000-55e6-f525-9a99-7a097ccc5ebb	\N	0002	t	2016-01-01	\N	\N	8	\N	\N	f	f
000c0000-55e6-f525-2a92-287208e98961	000d0000-55e6-f525-34cd-dc44d9a2c10f	00100000-55e6-f525-8f16-dac9b28ea36b	00090000-55e6-f525-dbf0-0e731104ef48	\N	0003	t	\N	2015-09-02	\N	2	\N	\N	f	f
000c0000-55e6-f525-e90c-3f3626e66829	000d0000-55e6-f525-74e5-f85356e48a6c	\N	00090000-55e6-f525-351e-30187713e7ad	\N	0004	f	2016-01-01	2016-01-01	\N	26	\N	\N	f	f
000c0000-55e6-f525-24c3-d2cea8e36a97	000d0000-55e6-f525-e744-1d5d93a01e05	\N	00090000-55e6-f525-b4cc-3c19d967aa49	\N	0005	f	2016-01-01	2016-01-01	\N	7	\N	\N	f	f
000c0000-55e6-f525-ce51-2af4cdfaf8fd	000d0000-55e6-f525-3345-3e7ca79031d1	\N	00090000-55e6-f525-84db-08c7f67885c1	000b0000-55e6-f525-de01-b7708545f214	0006	f	2016-01-01	2016-01-01	\N	1	\N	\N	t	t
000c0000-55e6-f525-91d2-5f57acdfab1a	000d0000-55e6-f525-c61c-8e0fe1837767	00100000-55e6-f525-5de6-5af81aecc0cb	00090000-55e6-f525-4479-0d36853d14af	\N	0007	t	2016-01-01	2016-01-01	\N	14	\N	\N	f	t
000c0000-55e6-f525-b998-6c83401b40d5	000d0000-55e6-f525-ad2b-a331cae50c41	\N	00090000-55e6-f525-0d81-67bf9f7fdc21	000b0000-55e6-f525-2597-bd6e957d0ae0	0008	f	2016-01-01	2016-01-01	\N	12	\N	\N	t	t
000c0000-55e6-f525-e359-89dd66339fa6	000d0000-55e6-f525-c61c-8e0fe1837767	00100000-55e6-f525-7b75-375ebf88b6bd	00090000-55e6-f525-2a7f-9ff6a329234e	\N	0009	t	2017-01-01	2017-01-01	\N	15	\N	\N	f	t
000c0000-55e6-f525-1025-f0cf718f98a1	000d0000-55e6-f525-c61c-8e0fe1837767	00100000-55e6-f525-e3cc-6f1e3817221c	00090000-55e6-f525-2cfd-8ef5ed9076cf	\N	0010	t	\N	2015-09-02	\N	16	\N	\N	f	t
000c0000-55e6-f525-c3e0-8cf74cddc1bd	000d0000-55e6-f525-c61c-8e0fe1837767	00100000-55e6-f525-c27c-0e7ec9065165	00090000-55e6-f525-beb0-daabb3418c05	\N	0011	t	2017-01-01	\N	\N	17	\N	\N	f	t
\.


--
-- TOC entry 2957 (class 0 OID 16879414)
-- Dependencies: 222
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 2951 (class 0 OID 16879324)
-- Dependencies: 216
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, stevilka, naslov, avtor, podnaslov, jezik, naslovizvirnika, internacionalninaslov, datumprejema, moskevloge, zenskevloge, prevajalec, povzetekvsebine, letoizida, krajizida, zaloznik) FROM stdin;
00160000-55e6-f524-04ff-7f9c43759b42	0001	Sen kresne noči	William Shakespeare		slovenščina	A Midsummer Night's Dream	\N	2015-04-26	5	5	Milan Jesih	Nastopajo Titanija, Hipolita, Oberon, ...	\N	\N	\N
00160000-55e6-f524-37d7-8c7f3e28cf8d	0002	Bratje Karamazovi	Fjodor Mihajlovič Dostojevski		slovenščina	Bratja Karamazjovji	\N	2015-12-04	4	1	Vladimir Levstik	Svetovna uspešnica	\N	\N	\N
00160000-55e6-f524-7e3a-a966764a3abb	0003	Smoletov Vrt	Berta Hočevar		slovenščina		\N	2015-05-26	2	8			\N	\N	\N
\.


--
-- TOC entry 2974 (class 0 OID 16879680)
-- Dependencies: 239
-- Data for Name: datoteka; Type: TABLE DATA; Schema: public; Owner: -
--

COPY datoteka (id, owner_id, filename, transfers, size, format, hash, createdat, uploadedat, upor, datknj) FROM stdin;
\.


--
-- TOC entry 2927 (class 0 OID 16879095)
-- Dependencies: 192
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_splosni_id, prostor_id, sezona_id, planiranzacetek, allday, zacetek, konec, status, razred, termin, title) FROM stdin;
00180000-55e6-f525-b8f7-2be33a2b7060	\N	\N	00200000-55e6-f525-776a-8819f1129926	\N	\N	\N	\N	2015-06-26 10:00:00	f	2015-06-26 10:00:00	2015-06-26 12:00:00	3			
00180000-55e6-f525-c41a-1e6654900e33	\N	\N	00200000-55e6-f525-4ec0-2ad4d5e97fd5	\N	\N	\N	\N	2015-06-27 10:00:00	f	2015-06-27 10:00:00	2015-06-27 12:00:00	4			
00180000-55e6-f525-5147-8589e2007cd6	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	f	2015-08-01 20:00:00	2015-08-01 23:00:00	5			
00180000-55e6-f525-deca-e31ba5c577d0	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	f	2015-08-01 20:00:00	2015-08-01 23:00:00	2			
00180000-55e6-f525-0d61-d9fe9297001d	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	f	2015-08-01 20:00:00	2015-08-01 23:00:00	7			
\.


--
-- TOC entry 2929 (class 0 OID 16879126)
-- Dependencies: 194
-- Data for Name: dogodeksplosni; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodeksplosni (id) FROM stdin;
\.


--
-- TOC entry 2965 (class 0 OID 16879582)
-- Dependencies: 230
-- Data for Name: drugivir; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drugivir (id, znesek, opis, mednarodni, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 2922 (class 0 OID 16879038)
-- Dependencies: 187
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-55e6-f523-05c8-9a50a8b0d43b	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-55e6-f523-d21e-9aaea6ed0b5f	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-55e6-f523-09f1-6f8aa381ce8c	AL	ALB	008	Albania 	Albanija	\N
00040000-55e6-f523-9e9c-c78a79b5b84e	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-55e6-f523-0974-9f66fb264f63	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-55e6-f523-fe54-28ea7b661790	AD	AND	020	Andorra 	Andora	\N
00040000-55e6-f523-8a4f-71d9c1c3f15a	AO	AGO	024	Angola 	Angola	\N
00040000-55e6-f523-eafc-5cb35ed0c998	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-55e6-f523-a10c-a8f07298eeff	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-55e6-f523-0a12-b628e060106d	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-55e6-f523-bb17-ef27f1182111	AR	ARG	032	Argentina 	Argenitna	\N
00040000-55e6-f523-3852-7b1eb8db5bec	AM	ARM	051	Armenia 	Armenija	\N
00040000-55e6-f523-3792-7ac04d1f946e	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-55e6-f523-e7c2-d94b047a88fa	AU	AUS	036	Australia 	Avstralija	\N
00040000-55e6-f523-30a6-794e6c4cae79	AT	AUT	040	Austria 	Avstrija	\N
00040000-55e6-f523-7e65-306522638899	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-55e6-f523-8143-4bc65dfc2c34	BS	BHS	044	Bahamas 	Bahami	\N
00040000-55e6-f523-c714-bd78e7f903ca	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-55e6-f523-6889-7a86b5efaee7	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-55e6-f523-d3f9-0236ad49bc4c	BB	BRB	052	Barbados 	Barbados	\N
00040000-55e6-f523-48f8-98db0e8c02d3	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-55e6-f523-09a1-63743c3617b0	BE	BEL	056	Belgium 	Belgija	\N
00040000-55e6-f523-6e8f-4c0de1f1188f	BZ	BLZ	084	Belize 	Belize	\N
00040000-55e6-f523-a4c3-fc754a24fc8c	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-55e6-f523-a6ae-38c9b7b357a8	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-55e6-f523-de57-9bf848aa28ad	BT	BTN	064	Bhutan 	Butan	\N
00040000-55e6-f523-02d9-bd4c70174c3c	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-55e6-f523-20a0-5a55a8c77156	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-55e6-f523-9c78-df7ce33d922d	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-55e6-f523-f975-44c78c6c074d	BW	BWA	072	Botswana 	Bocvana	\N
00040000-55e6-f523-dd81-e7209cf4e2ac	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-55e6-f523-143a-48a9ab332424	BR	BRA	076	Brazil 	Brazilija	\N
00040000-55e6-f523-6a8c-260487c6de2b	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-55e6-f523-2373-7664bacabb62	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-55e6-f523-17c8-074dc72c0301	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-55e6-f523-9baf-99faa17ca0fe	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-55e6-f523-909c-aa2d9e018c0c	BI	BDI	108	Burundi 	Burundi 	\N
00040000-55e6-f523-8f7e-6a7c80206e2b	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-55e6-f523-2c7d-e94afc64bbb8	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-55e6-f523-48f1-b1b9353d4fc4	CA	CAN	124	Canada 	Kanada	\N
00040000-55e6-f523-1acc-32f51cb70797	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-55e6-f523-ca08-aa0615b046aa	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-55e6-f523-efe9-3676b73868bc	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-55e6-f523-3c87-cc5fd9575bcc	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-55e6-f523-22a7-20c2276e914b	CL	CHL	152	Chile 	Čile	\N
00040000-55e6-f523-43e4-9d12abf2d3d2	CN	CHN	156	China 	Kitajska	\N
00040000-55e6-f523-3256-8a4b5532e890	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-55e6-f523-7062-e62ad9b3dd05	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-55e6-f523-63b4-367cb2e0388b	CO	COL	170	Colombia 	Kolumbija	\N
00040000-55e6-f523-d5e8-dd431bf61e54	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-55e6-f523-97db-4eb7beb4e1a0	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-55e6-f523-b193-8a043894ec6d	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-55e6-f523-d29f-db59a4796014	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-55e6-f523-0b15-c64bb0a9793c	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-55e6-f523-e80c-c8bee482a655	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-55e6-f523-8734-23f94463db63	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-55e6-f523-43c0-03032e7f261b	CU	CUB	192	Cuba 	Kuba	\N
00040000-55e6-f523-c343-d82f97879c13	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-55e6-f523-ae22-7198cc8c125d	CY	CYP	196	Cyprus 	Ciper	\N
00040000-55e6-f523-edc3-58142528f932	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-55e6-f523-a349-69f804c7c5de	DK	DNK	208	Denmark 	Danska	\N
00040000-55e6-f523-aaa3-b6f0f073c230	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-55e6-f523-fa31-ebe48e51cafd	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-55e6-f523-29ff-a6a03e48d709	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-55e6-f523-5b81-31ec64cc89f9	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-55e6-f523-58fe-84ca3a3c5d15	EG	EGY	818	Egypt 	Egipt	\N
00040000-55e6-f523-81a4-beb05008fe3d	SV	SLV	222	El Salvador 	Salvador	\N
00040000-55e6-f523-6545-86e89a44ed21	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-55e6-f523-657d-dcd2d71d373e	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-55e6-f523-556e-7b20a48a6d28	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-55e6-f523-7769-0de825ab64db	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-55e6-f523-79bd-612a3c7170fe	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-55e6-f523-b6c7-6f4604da4d2f	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-55e6-f523-4749-025c24266d47	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-55e6-f523-cb31-ac7697641064	FI	FIN	246	Finland 	Finska	\N
00040000-55e6-f523-8cb6-28bb1ded93f1	FR	FRA	250	France 	Francija	\N
00040000-55e6-f523-69a4-ba7dd301ac8f	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-55e6-f523-7f2c-b14e4056ffd5	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-55e6-f523-2b5d-0c51945137ce	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-55e6-f523-bbb0-49e7a28dc314	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-55e6-f523-7dc7-e0530cdfef29	GA	GAB	266	Gabon 	Gabon	\N
00040000-55e6-f523-49e5-9c9cf2016e49	GM	GMB	270	Gambia 	Gambija	\N
00040000-55e6-f523-0a48-fabe639a460b	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-55e6-f523-0a97-140fa8df5bc5	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-55e6-f523-3278-609b2022f87a	GH	GHA	288	Ghana 	Gana	\N
00040000-55e6-f523-d12a-22f9301d1a10	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-55e6-f523-7c4c-f99729e6c2d6	GR	GRC	300	Greece 	Grčija	\N
00040000-55e6-f523-b7e9-bdaeb30692d4	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-55e6-f523-d352-a069f1cf12b4	GD	GRD	308	Grenada 	Grenada	\N
00040000-55e6-f523-5ca1-9139bbe934d4	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-55e6-f523-fa37-7278a0822455	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-55e6-f523-386b-df42793bf077	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-55e6-f523-5bee-d2ff1b07a74a	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-55e6-f523-0545-ecb439f467bb	GN	GIN	324	Guinea 	Gvineja	\N
00040000-55e6-f523-6c90-3ff7e79d6457	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-55e6-f523-1093-59c5810a01fa	GY	GUY	328	Guyana 	Gvajana	\N
00040000-55e6-f523-2a04-b4156abfe1e8	HT	HTI	332	Haiti 	Haiti	\N
00040000-55e6-f523-e167-5d5267acd56e	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-55e6-f523-acdf-02e5637d5bd0	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-55e6-f523-9421-1ee837af0ea4	HN	HND	340	Honduras 	Honduras	\N
00040000-55e6-f523-745f-3fa839eda9c1	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-55e6-f523-dd30-9a7ba6b85854	HU	HUN	348	Hungary 	Madžarska	\N
00040000-55e6-f523-8933-3633d9f8d613	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-55e6-f523-e689-db20ab6476f3	IN	IND	356	India 	Indija	\N
00040000-55e6-f523-ac20-795044e30170	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-55e6-f523-07c8-5301ec276225	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-55e6-f523-1399-a63b8922b28b	IQ	IRQ	368	Iraq 	Irak	\N
00040000-55e6-f523-467a-251ffc2ba99c	IE	IRL	372	Ireland 	Irska	\N
00040000-55e6-f523-6995-3a0c15f46ae9	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-55e6-f523-5134-585aff9a89cd	IL	ISR	376	Israel 	Izrael	\N
00040000-55e6-f523-3188-b68bce0784bb	IT	ITA	380	Italy 	Italija	\N
00040000-55e6-f523-3281-3883c2bf4861	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-55e6-f523-00d9-51d4dbdec119	JP	JPN	392	Japan 	Japonska	\N
00040000-55e6-f523-c1f9-705cb03d773d	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-55e6-f523-d498-d05e2b67ad71	JO	JOR	400	Jordan 	Jordanija	\N
00040000-55e6-f523-6e2c-2ef622fdec8c	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-55e6-f523-b683-402c9adcb801	KE	KEN	404	Kenya 	Kenija	\N
00040000-55e6-f523-c5a3-8f93f5978eca	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-55e6-f523-e1bb-cb77b1f686e1	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-55e6-f523-77aa-0202208fbe0f	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-55e6-f523-639d-88e3cd4e4d80	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-55e6-f523-5eb6-4da9f6da7057	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-55e6-f523-50ff-c98310d60abd	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-55e6-f523-a924-dcd4ca0dc5a7	LV	LVA	428	Latvia 	Latvija	\N
00040000-55e6-f523-628d-5bbb028faafc	LB	LBN	422	Lebanon 	Libanon	\N
00040000-55e6-f523-f3df-a4a95e521ee8	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-55e6-f523-ffa8-4af709713cf8	LR	LBR	430	Liberia 	Liberija	\N
00040000-55e6-f523-4ec5-666a908e9e49	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-55e6-f523-a419-0ce8850a8be6	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-55e6-f523-37a0-016e99f7d43a	LT	LTU	440	Lithuania 	Litva	\N
00040000-55e6-f523-dca8-5e2964eecc71	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-55e6-f523-b0b5-1e5f34ea612d	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-55e6-f523-afd9-d3596a228422	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-55e6-f523-1a9f-e28f9c761491	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-55e6-f523-bfdc-4d5b47bfe869	MW	MWI	454	Malawi 	Malavi	\N
00040000-55e6-f523-7088-c85e4cbc9581	MY	MYS	458	Malaysia 	Malezija	\N
00040000-55e6-f523-87a7-2709beefbd0d	MV	MDV	462	Maldives 	Maldivi	\N
00040000-55e6-f523-65c6-9e56d49eda8a	ML	MLI	466	Mali 	Mali	\N
00040000-55e6-f523-7aba-e7fe0ae2b071	MT	MLT	470	Malta 	Malta	\N
00040000-55e6-f523-67c1-f108a0bc5fd9	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-55e6-f523-2b78-0c3faea1ebb0	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-55e6-f523-1242-40a9fd60fda0	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-55e6-f523-6b64-e5eac7226298	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-55e6-f523-abf8-841505284279	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-55e6-f523-54e1-ca2e140f6e23	MX	MEX	484	Mexico 	Mehika	\N
00040000-55e6-f523-ed62-a319bdccbbdf	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-55e6-f523-1a9b-2fc0493271f3	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-55e6-f523-69ce-5dd467aea455	MC	MCO	492	Monaco 	Monako	\N
00040000-55e6-f523-ac69-d72bc04409d5	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-55e6-f523-f5ac-b8dfe9b79724	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-55e6-f523-0e8d-46bbe4967cce	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-55e6-f523-1992-9599fb530801	MA	MAR	504	Morocco 	Maroko	\N
00040000-55e6-f523-74e0-9d40ef55a2f1	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-55e6-f523-9021-889103653ffa	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-55e6-f523-a93f-8fec6452802d	NA	NAM	516	Namibia 	Namibija	\N
00040000-55e6-f523-eb4c-b8acd3985c6c	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-55e6-f523-4305-f51e9e691a86	NP	NPL	524	Nepal 	Nepal	\N
00040000-55e6-f523-57d7-37cdf94ef460	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-55e6-f523-a3ed-acff26c4fc75	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-55e6-f523-fd02-3b0731431655	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-55e6-f523-f001-53979b93914a	NE	NER	562	Niger 	Niger 	\N
00040000-55e6-f523-cada-1a7ed05adc9a	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-55e6-f523-c108-50edf98ce3cb	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-55e6-f523-85ac-7d6742876d9b	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-55e6-f523-40b5-36ff062f1bf1	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-55e6-f523-8875-2d0be3ab5769	NO	NOR	578	Norway 	Norveška	\N
00040000-55e6-f523-c454-9263f77829bc	OM	OMN	512	Oman 	Oman	\N
00040000-55e6-f523-a2d1-124c618bd26e	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-55e6-f523-69a8-e2ce30819e5b	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-55e6-f523-18f8-fa33d246a0de	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-55e6-f523-4f9e-b9961d3a1709	PA	PAN	591	Panama 	Panama	\N
00040000-55e6-f523-c457-dc363462cbbb	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-55e6-f523-464b-346c82c014fa	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-55e6-f523-b1b4-05078e2c7727	PE	PER	604	Peru 	Peru	\N
00040000-55e6-f523-ae3c-a74288554176	PH	PHL	608	Philippines 	Filipini	\N
00040000-55e6-f523-e535-a8611a8ca1c1	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-55e6-f523-268d-7231da0c1f35	PL	POL	616	Poland 	Poljska	\N
00040000-55e6-f523-8069-40d9847cf561	PT	PRT	620	Portugal 	Portugalska	\N
00040000-55e6-f523-e76c-2ffd803a9c1f	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-55e6-f523-2e8c-cf35fc2070ff	QA	QAT	634	Qatar 	Katar	\N
00040000-55e6-f523-0e4c-8ace0661fb5c	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-55e6-f523-64e9-a3a074203b6f	RO	ROU	642	Romania 	Romunija	\N
00040000-55e6-f523-ab46-f696269c74ec	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-55e6-f523-4ce9-feb0a81007e3	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-55e6-f523-2d93-de7824825020	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-55e6-f523-9e80-72d352ecb80b	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-55e6-f523-26f0-6027066e573d	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-55e6-f523-fd12-9c5bc8abbcfc	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-55e6-f523-6cf8-8535c9680720	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-55e6-f523-1948-469be9b3cc4a	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-55e6-f523-0f2b-a5d4799a80fb	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-55e6-f523-4c8d-c35db66bf724	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-55e6-f523-920f-ab3624978dc8	SM	SMR	674	San Marino 	San Marino	\N
00040000-55e6-f523-ead3-9e7e8ef3d2ce	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-55e6-f523-291b-f81cebb313fc	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-55e6-f523-eef4-d5958964f5dc	SN	SEN	686	Senegal 	Senegal	\N
00040000-55e6-f523-06a5-bdc97dd6af9a	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-55e6-f523-2a64-1f749766ed1c	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-55e6-f523-f801-fa3adc22d3a5	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-55e6-f523-21f9-f2754c3691c6	SG	SGP	702	Singapore 	Singapur	\N
00040000-55e6-f523-2cb5-bc20e989a202	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-55e6-f523-63c6-facac014ad9f	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-55e6-f523-d880-cc58e1f91db0	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-55e6-f523-e52f-59293809b202	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-55e6-f523-4bb8-9240c35f4cdd	SO	SOM	706	Somalia 	Somalija	\N
00040000-55e6-f523-53d7-6f71feb10c0f	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-55e6-f523-2c65-06f5bfa78290	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-55e6-f523-5548-122ecbb59cd1	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-55e6-f523-8287-1d5448c6c177	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-55e6-f523-579f-204368163766	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-55e6-f523-5672-8611833f07ee	SD	SDN	729	Sudan 	Sudan	\N
00040000-55e6-f523-318d-e5bd72396595	SR	SUR	740	Suriname 	Surinam	\N
00040000-55e6-f523-61f7-d5ab1c167238	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-55e6-f523-4f71-9396f345255d	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-55e6-f523-cb09-9b51939f2e8a	SE	SWE	752	Sweden 	Švedska	\N
00040000-55e6-f523-df1d-0339adc93d36	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-55e6-f523-fdc9-fcd30f2c08c4	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-55e6-f523-b962-8cf1f2e89c5f	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-55e6-f523-ea95-e7026459e4d3	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-55e6-f523-edd1-50f9b15080c2	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-55e6-f523-a8d2-499a281f8ec7	TH	THA	764	Thailand 	Tajska	\N
00040000-55e6-f523-ea55-1ebabbc82b86	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-55e6-f523-7e1b-76879c6e004a	TG	TGO	768	Togo 	Togo	\N
00040000-55e6-f523-1be9-d60e7446bad7	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-55e6-f523-0aa5-6450034c602c	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-55e6-f523-cde9-b295af6a0a55	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-55e6-f523-50df-3f2764679e82	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-55e6-f523-dd1f-5aa3997dbf7b	TR	TUR	792	Turkey 	Turčija	\N
00040000-55e6-f523-a5de-ee182a63f309	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-55e6-f523-fc05-cdf94a61acf6	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-55e6-f523-d2d7-a48aed21c7b4	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-55e6-f523-6d2b-209a0017828f	UG	UGA	800	Uganda 	Uganda	\N
00040000-55e6-f523-8fe1-ebb0c6df7f87	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-55e6-f523-eec8-976721ec0bd6	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-55e6-f523-c671-4947b1dff7eb	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-55e6-f523-f2f5-14270fd76d08	US	USA	840	United States 	Združene države Amerike	\N
00040000-55e6-f523-2de3-28de82aeb3e7	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-55e6-f523-ebb1-62f0988f5e70	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-55e6-f523-3b0c-1dd78e0e302f	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-55e6-f523-7681-25a0d87627af	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-55e6-f523-20a2-ce8435ca9ca8	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-55e6-f523-dec9-09439961b593	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-55e6-f523-4b86-bd074b6e100f	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-55e6-f523-55f8-08884f551d73	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-55e6-f523-e7bb-a20d6c8e1499	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-55e6-f523-a1b3-a3ce553d1b5e	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-55e6-f523-0baf-1d679805db9f	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-55e6-f523-367f-46f61d7d90f6	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-55e6-f523-05ae-bfb39461d959	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 2959 (class 0 OID 16879444)
-- Dependencies: 224
-- Data for Name: enotaprograma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY enotaprograma (id, uprizoritev_id, program_dela_id, gostitelj_id, celotnavrednost, nasdelez, celotnavrednostmat, celotnavrednostgostovsz, zaproseno, lastnasredstva, avtorskihonorarji, avtorskihonorarjisamoz, tantieme, avtorskepravice, materialni, imakoprodukcije, vlozekgostitelja, drugijavni, stzaposlenih, stzaposumet, stzaposdrug, sthonorarnih, sthonorarnihigr, sthonorarnihigrtujjz, sthonorarnihigrsamoz, obiskdoma, obiskkopr, obiskgost, obiskzamejo, obiskint, obiskkoprint, ponovidoma, ponovikopr, ponovizamejo, ponovigost, ponovikoprint, ponoviint, naziv, kpe, sort, tipprogramskeenote_id, tip, strosekodkpred, stroskiostali, krajgostovanja, ustanova, datumgostovanja, transportnistroski, dnevprvzad, drzavagostovanja_id, stpe, zvrst, stpredstav, stokroglihmiz, stpredstavitev, stdelavnic, stdrugidogodki, stprodukcij, caspriprave, casizvedbe, prizorisca, umetvodja, programskotelo, sttujihselektorjev) FROM stdin;
002f0000-55e6-f525-cd63-636aacd4022e	000e0000-55e6-f525-711f-c44a29152be1	\N	\N	9000.30	9000.30	9000.30	0.00	3600.12	5299.98	4000.40	1000.40	200.20	200.30	4599.40	\N	0.00	100.20	0	2	2	2	2	2	\N	40	0	0	0	0	0	1	0	0	0	0	0		0.00	\N	002b0000-55e6-f523-0cae-c58bf9f63793	premiera	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-55e6-f525-ee08-e901a092fafa	000e0000-55e6-f525-5fa2-0d9ec1503c76	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	\N	60	0	0	0	0	0	1	0	0	0	0	0		0.00	\N	002b0000-55e6-f523-2356-53d898faf499	premiera	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-55e6-f525-a098-c3f424dad4cf	000e0000-55e6-f525-2ac8-0b56769fb8fb	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	\N	60	0	0	0	0	0	1	0	0	0	0	0		0.00	\N	002b0000-55e6-f523-0cae-c58bf9f63793	premiera	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-55e6-f525-7f72-33af56f5b2fb	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-54.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	54.20	5	0	0	3	0	0	\N	22	0	0	0	0	0	0	0	0	0	0	0	Urejanje portala	0.00	10	\N	razno	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-55e6-f525-fe41-3faaac347850	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-31.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	31.20	5	0	0	3	0	0	\N	202	0	0	0	0	0	0	0	0	0	0	0	Delavnice otroci	0.00	8	\N	razno	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 2945 (class 0 OID 16879259)
-- Dependencies: 210
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, podrocje, vodjaekipe, naziv, komentar, velikost, pomembna, sort, seplanira, dovoliprekrivanje, maxprekrivanj, tipfunkcije_id) FROM stdin;
000d0000-55e6-f525-c61c-8e0fe1837767	000e0000-55e6-f525-5fa2-0d9ec1503c76	\N	igralec	\N	Hipolita	glavna vloga	velika	t	6	t	t	\N	000f0000-55e6-f523-099c-08b82640a464
000d0000-55e6-f525-4bf5-5fa23b1df912	000e0000-55e6-f525-5fa2-0d9ec1503c76	\N	igralec	\N	Tezej	glavna vloga	velika	t	5	t	t	\N	000f0000-55e6-f523-099c-08b82640a464
000d0000-55e6-f525-d77c-3f5a303e9c3a	000e0000-55e6-f525-5fa2-0d9ec1503c76	\N	umetnik	\N	Režija		velika	t	8	t	t	\N	000f0000-55e6-f523-4866-8193616878da
000d0000-55e6-f525-34cd-dc44d9a2c10f	000e0000-55e6-f525-5fa2-0d9ec1503c76	\N	inspicient	t	Inšpicient			t	8	t	t	\N	000f0000-55e6-f523-edcc-6126dbe7805b
000d0000-55e6-f525-74e5-f85356e48a6c	000e0000-55e6-f525-5fa2-0d9ec1503c76	\N	tehnik	t	Tehnični vodja			t	8	t	t	\N	000f0000-55e6-f523-8e90-3d4711ecc559
000d0000-55e6-f525-e744-1d5d93a01e05	000e0000-55e6-f525-5fa2-0d9ec1503c76	\N	tehnik	\N	Razsvetljava			t	3	t	t	\N	000f0000-55e6-f523-8e90-3d4711ecc559
000d0000-55e6-f525-3345-3e7ca79031d1	000e0000-55e6-f525-5fa2-0d9ec1503c76	\N	igralec	\N	Helena	glavna vloga	velika	t	5	t	t	\N	000f0000-55e6-f523-099c-08b82640a464
000d0000-55e6-f525-ad2b-a331cae50c41	000e0000-55e6-f525-5fa2-0d9ec1503c76	\N	umetnik	\N	Lektoriranje			t	22	t	t	\N	000f0000-55e6-f523-f688-1ba068fe4343
\.


--
-- TOC entry 2925 (class 0 OID 16879074)
-- Dependencies: 190
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta, zamejstvo, kraj) FROM stdin;
\.


--
-- TOC entry 2923 (class 0 OID 16879055)
-- Dependencies: 188
-- Data for Name: kontaktnaoseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kontaktnaoseba (id, popa_id, oseba_id, status, funkcija, opis) FROM stdin;
00260000-55e6-f525-3983-8e9dcc94087a	00080000-55e6-f524-fc94-a0ca1bf6df2c	00090000-55e6-f525-2cfd-8ef5ed9076cf	AK		
\.


--
-- TOC entry 2934 (class 0 OID 16879173)
-- Dependencies: 199
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 2972 (class 0 OID 16879661)
-- Dependencies: 237
-- Data for Name: mapa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa (id, lastnik_id, parent_id, ime, komentar, caskreiranja, casspremembe, javnidostop, upor, datknj) FROM stdin;
\.


--
-- TOC entry 2973 (class 0 OID 16879673)
-- Dependencies: 238
-- Data for Name: mapa_zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa_zapis (mapa_id, zapis_id) FROM stdin;
\.


--
-- TOC entry 2975 (class 0 OID 16879695)
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
-- TOC entry 2938 (class 0 OID 16879198)
-- Dependencies: 203
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 2920 (class 0 OID 16879012)
-- Dependencies: 185
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-55e6-f524-14a6-b070c0a432ae	popa.stakli	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-55e6-f524-cac3-6d755ce18c05	oseba.spol	array	a:2:{s:1:"M";a:1:{s:5:"label";s:6:"Moški";}s:1:"Z";a:1:{s:5:"label";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-55e6-f524-e3a8-38f26e173edc	telefonska.vrsta	array	a:3:{s:7:"mobilna";a:1:{s:5:"label";s:7:"Mobilni";}s:6:"domaca";a:1:{s:5:"label";s:6:"Domač";}s:6:"fiksna";a:1:{s:5:"label";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-55e6-f524-ad01-9f0c1e2be9f8	kontaktnaoseba.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status kontaktne osebe
00000000-55e6-f524-61f4-a51451c3ca8f	dogodek.status	array	a:7:{i:100;a:1:{s:5:"label";s:11:"Dolgoročno";}i:200;a:1:{s:5:"label";s:9:"Planirano";}i:300;a:1:{s:5:"label";s:8:"Fiksiran";}i:400;a:1:{s:5:"label";s:17:"Potrjen - interno";}i:500;a:1:{s:5:"label";s:15:"Potrjen - javno";}i:600;a:1:{s:5:"label";s:10:"Zaključen";}i:700;a:1:{s:5:"label";s:7:"Obdelan";}}	f	t	t	\N	Tabela statusa dogodkov
00000000-55e6-f524-f037-8c5a58de36f1	dogodek.razred	array	a:5:{i:100;a:2:{s:5:"label";s:9:"Predstava";s:4:"type";s:9:"predstava";}i:200;a:2:{s:5:"label";s:4:"Vaja";s:4:"type";s:4:"vaja";}i:300;a:2:{s:5:"label";s:10:"Gostovanje";s:4:"type";s:10:"gostovanje";}i:400;a:2:{s:5:"label";s:10:"Zasedenost";s:4:"type";s:10:"zasedenost";}i:500;a:2:{s:5:"label";s:16:"Splošni dogodek";s:4:"type";s:8:"splošni";}}	f	t	t	\N	Tabela razredov dogodkov, ki jih aplikacija podpira
00000000-55e6-f524-4368-d8e666687f29	uprizoritev.faza	array	a:6:{s:20:"predprodukcija-ideja";a:1:{s:5:"label";s:16:"Dolgoročni plan";}s:20:"predprodukcija-poziv";a:1:{s:5:"label";s:29:"Predprodukcija, v fazi poziva";}s:30:"predprodukcija-potrjen_program";a:1:{s:5:"label";s:34:"Predprodukcija, program je potrjen";}s:10:"produkcija";a:1:{s:5:"label";s:10:"Produkcija";}s:14:"postprodukcija";a:1:{s:5:"label";s:14:"Postprodukcija";}s:5:"arhiv";a:1:{s:5:"label";s:10:"Arhivirana";}}	f	t	f	\N	Faza uprizoritve
00000000-55e6-f524-ddb9-685902e6efc5	funkcija.podrocje	array	a:4:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}}	f	t	f	\N	Področje funkcije
00000000-55e6-f524-9107-267900e0bde2	tipfunkcije.podrocje	array	a:3:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}}	f	t	f	\N	Področje funkcije
00000000-55e6-f524-43fe-d37bde5d83b6	funkcija.velikost	array	a:4:{s:7:"stataza";a:1:{s:5:"label";s:8:"Stataža";}s:4:"mala";a:1:{s:5:"label";s:21:"Mala vloga / funkcija";}s:7:"srednja";a:1:{s:5:"label";s:24:"Srednja vloga / funkcija";}s:6:"velika";a:1:{s:5:"label";s:23:"Velika vloga / funkcija";}}	f	t	f	\N	Velikost funkcije
00000000-55e6-f524-3a47-51a243b47a0e	zaposlitev.status	array	a:2:{s:1:"A";a:1:{s:5:"label";s:7:"Aktivna";}s:1:"N";a:1:{s:5:"label";s:9:"Neaktivna";}}	f	t	f	\N	Status zaposlitve
00000000-55e6-f524-c20a-16c36ece2eef	produkcijskahisa.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktivna";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktivna";}}	f	t	f	\N	Status produkcijske hiše
00000000-55e6-f524-ec73-ac4d7297230a	strosekuprizoritve.tipstroska	array	a:2:{s:10:"materialni";a:1:{s:5:"label";s:19:"Materialni strošek";}s:9:"avtorprav";a:1:{s:5:"label";s:32:"Strošek odkupa avtorskih pravic";}}	f	t	f	\N	Tip stroška
00000000-55e6-f524-2e23-868eb4196302	fsacl.dostop	array	a:4:{s:1:"X";a:1:{s:5:"label";s:12:"Brez dostopa";}s:1:"R";a:1:{s:5:"label";s:11:"Samo branje";}s:2:"RW";a:1:{s:5:"label";s:17:"Branje in pisanje";}s:3:"RWD";a:1:{s:5:"label";s:26:"Branje pisanje in brisanje";}}	f	t	f	\N	ACL Javni dostop
00000000-55e6-f524-bb42-e7bddea43d36	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-55e6-f524-a550-5095676b5b8a	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-55e6-f524-a5e8-681b4af09bc7	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-55e6-f524-cc43-82909291fee1	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-55e6-f524-ca06-0d59284c78c1	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
00000000-55e6-f526-1230-0de9cebffec0	application.tenant.maticnopodjetje	string	s:4:"1001";	f	t	f		Šifra matičnega podjetja v Popa in ProdukcijskaHisa
\.


--
-- TOC entry 2914 (class 0 OID 16878926)
-- Dependencies: 179
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-55e6-f524-92ac-01c41727a7d7	00000000-55e6-f524-bb42-e7bddea43d36	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-55e6-f524-bd67-3b1b25abf426	00000000-55e6-f524-bb42-e7bddea43d36	00010000-55e6-f524-4b9e-a19ae472051a	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-55e6-f524-37d1-95258729cd7b	00000000-55e6-f524-a550-5095676b5b8a	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 2915 (class 0 OID 16878937)
-- Dependencies: 180
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naslov_id, sifra, naziv, ime, priimek, funkcija, srednjeime, polnoime, psevdonim, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
00090000-55e6-f525-490f-3d192febd5f1	\N	\N	0001	g.	Janez	Novak	a	Peter	Janez Peter Novak	Jani	jani.novak@xxx.xx	1958-01-06	0601958000000	123456789	M	Jani Janez	Slovenija	Slovenija	Ljubljana
00090000-55e6-f525-351e-30187713e7ad	00010000-55e6-f525-a5ca-60713ddb933a	\N	0002	dr.	Anton	Horvat	b		Anton  Horvat	Tona	anton.horvat@xxx.xx	1968-02-12	1202968111111	234567890	M		Slovenija	Slovenija	Maribor
00090000-55e6-f525-dbf0-0e731104ef48	00010000-55e6-f525-463c-2dc6f6d90f89	\N	0003		Ivan	Kovačič	c		Ivan  Kovačič	Ivo	ivan.kovacic@xxx.xx	1975-03-26	2603976222222	345678901	M		Slovenija	Slovenija	Celje
00090000-55e6-f525-2a7f-9ff6a329234e	00010000-55e6-f525-63cd-8e950f811a71	\N	0004	prof.	Jožef	Krajnc	d		Jožef  Krajnc	Joža	jozef.krajnc@xxx.xx	1971-04-30	3004971333333	456789012	M		Slovenija	Slovenija	Kranj
00090000-55e6-f525-fa2d-7e5480f9244b	\N	\N	0005		Marko	Zupančič	e		Marko  Zupančič		marko.zupancic@xxx.xx	1984-05-07	0705984444444	567890123	M		Slovenija	Slovenija	Koper
00090000-55e6-f525-84db-08c7f67885c1	\N	\N	0006	ga.	Marija	Kovač	f		Marija  Kovač		marija.kovac@xxx.xx	1962-06-19	1906962444444	678901234	Z		Slovenija	Slovenija	Murska Sobota
00090000-55e6-f525-beb0-daabb3418c05	\N	\N	0007	ga.	Ana	Potočnik	g		Ana  Potočnik		ana.potocnik@xxx.xx	1975-07-24	2407975555555	789012345	Z		Slovenija	Slovenija	Novo Mesto
00090000-55e6-f525-4479-0d36853d14af	\N	\N	0008	ga.	Maja	Mlakar	h		Maja  Mlakar		maja.mlakar@xxx.xx	1986-08-02	0208986666666	890123456	Z		Slovenija	Slovenija	Nova Gorica
00090000-55e6-f525-2cfd-8ef5ed9076cf	00010000-55e6-f525-9d93-2d73de6c2cba	\N	0009		Irena	Kos	i		Irena  Kos		irena.kos@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Ptuj
00090000-55e6-f525-9a99-7a097ccc5ebb	\N	\N	0010		Mojca	Vidmar	J		Mojca  Vidmar		mojca.vidmar@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Idrija
00090000-55e6-f525-03c8-bd5f88c8bde4	\N	\N	0011		xx	write protected12345	a		xx  write protected12345		xx@xxx.xx	\N	\N	\N	Z		\N	\N	\N
00090000-55e6-f525-b4cc-3c19d967aa49	\N	\N	0012		Luka	Golob	luč	a	Luka a Golob		luka.golob@xxx.xx	\N	\N	\N	M		\N	\N	\N
00090000-55e6-f525-0d81-67bf9f7fdc21	00010000-55e6-f525-a4fe-86be98efe13f	\N	0013		Tatjana	Božič	tajnica	a	Tatjana a Božič		tatjana.bozic@xxx.xx	\N	\N	\N	Z		\N	\N	\N
\.


--
-- TOC entry 2910 (class 0 OID 16878891)
-- Dependencies: 175
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-55e6-f523-cfaa-bebdf27ce261	Aaa-read	Aaa (User,Role,Permission) - branje	f
00030000-55e6-f523-34f3-2a47b6315e23	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	f
00030000-55e6-f523-886f-7b9d5beacf6b	TerminStoritve-vse	TerminStoritve - spreminjanje vseh zapisov	f
00030000-55e6-f523-53bc-fcfd4eaae01e	Dogodek-readVse	Dogodek - branje vseh, ne glede na status dogodka	f
00030000-55e6-f523-bf84-f942f5dcc4e9	Oseba-vse	Oseba - vse - za testiranje assert	f
00030000-55e6-f523-dcde-1246812c3970	ProgramDela-lock	ProgramDela - zaklepanje	f
00030000-55e6-f523-4f2c-37a706a3af3b	ProgramDela-unlock	ProgramDela - odklepanje	f
00030000-55e6-f523-5fed-5a713c03d8e9	Abonma-read	Abonma - branje	f
00030000-55e6-f523-eb57-9d18588fcae8	Abonma-write	Abonma - spreminjanje	f
00030000-55e6-f523-08d7-de0ff00575d2	Alternacija-read	Alternacija - branje	f
00030000-55e6-f523-99cf-d6dbe9e49809	Alternacija-write	Alternacija - spreminjanje	f
00030000-55e6-f523-9b0d-47efc17e2587	Arhivalija-read	Arhivalija - branje	f
00030000-55e6-f523-28ba-4c53b50ece29	Arhivalija-write	Arhivalija - spreminjanje	f
00030000-55e6-f523-d628-444dca1add5d	Besedilo-read	Besedilo - branje	f
00030000-55e6-f523-a7a4-e16419c8cf2b	Besedilo-write	Besedilo - spreminjanje	f
00030000-55e6-f523-e17e-5b2e12a71fd1	DogodekIzven-read	DogodekIzven - branje	f
00030000-55e6-f523-6df8-0c57a87a00ad	DogodekIzven-write	DogodekIzven - spreminjanje	f
00030000-55e6-f523-33f0-9783d49f125d	Dogodek-read	Dogodek - branje	f
00030000-55e6-f523-3749-45b2596c5029	Dogodek-write	Dogodek - spreminjanje	f
00030000-55e6-f523-9d2e-b6b58b33d65a	DrugiVir-read	DrugiVir - branje	f
00030000-55e6-f523-d2b2-02f0a347fed0	DrugiVir-write	DrugiVir - spreminjanje	f
00030000-55e6-f523-35bf-5cbe7f9f82a1	Drzava-read	Drzava - branje	f
00030000-55e6-f523-cc96-fc9888c7107d	Drzava-write	Drzava - spreminjanje	f
00030000-55e6-f523-70cc-c76381ed6267	EnotaPrograma-read	EnotaPrograma - branje	f
00030000-55e6-f523-c0e9-af34bb8d170c	EnotaPrograma-write	EnotaPrograma - spreminjanje	f
00030000-55e6-f523-620d-37ea5810f60c	Funkcija-read	Funkcija - branje	f
00030000-55e6-f523-1e92-8ecb145f620e	Funkcija-write	Funkcija - spreminjanje	f
00030000-55e6-f523-d855-47283f119535	Gostovanje-read	Gostovanje - branje	f
00030000-55e6-f523-378c-216ce99554bf	Gostovanje-write	Gostovanje - spreminjanje	f
00030000-55e6-f523-ca2e-da8d0e9bfdc6	Gostujoca-read	Gostujoca - branje	f
00030000-55e6-f523-601e-2363f3937219	Gostujoca-write	Gostujoca - spreminjanje	f
00030000-55e6-f523-f699-0e4ba6d54f55	KontaktnaOseba-read	KontaktnaOseba - branje	f
00030000-55e6-f523-4489-e73c69fdfdcd	KontaktnaOseba-write	KontaktnaOseba - spreminjanje	f
00030000-55e6-f523-11f3-eaa0b61f98c6	Kupec-read	Kupec - branje	f
00030000-55e6-f523-1239-bd1ea015f72e	Kupec-write	Kupec - spreminjanje	f
00030000-55e6-f523-be50-dcd6dfae8e4e	NacinPlacina-read	NacinPlacina - branje	f
00030000-55e6-f523-5b6b-e601be1e776b	NacinPlacina-write	NacinPlacina - spreminjanje	f
00030000-55e6-f523-c8b4-31ec48798e27	Option-read	Option - branje	f
00030000-55e6-f523-9cb9-ee04f7386fde	Option-write	Option - spreminjanje	f
00030000-55e6-f523-5e13-fa3cbc8738db	OptionValue-read	OptionValue - branje	f
00030000-55e6-f523-0481-cc92ba5043dd	OptionValue-write	OptionValue - spreminjanje	f
00030000-55e6-f523-9ce0-1c61c0ade6a3	Oseba-read	Oseba - branje	f
00030000-55e6-f523-94a4-792db62b5425	Oseba-write	Oseba - spreminjanje	f
00030000-55e6-f523-34c9-cd984e98a962	PlacilniInstrument-read	PlacilniInstrument - branje	f
00030000-55e6-f523-33da-60477a816d63	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	f
00030000-55e6-f523-1ebf-a1ef78daf5bc	PodrocjeSedenja-read	PodrocjeSedenja - branje	f
00030000-55e6-f523-c755-6289ea5103ab	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	f
00030000-55e6-f523-0fc8-4dd22cc85557	Pogodba-read	Pogodba - branje	f
00030000-55e6-f523-c73b-3a46a46270d2	Pogodba-write	Pogodba - spreminjanje	f
00030000-55e6-f523-6ce8-f2efdb0cf3cd	Popa-read	Popa - branje	f
00030000-55e6-f523-6f82-575b33d0be55	Popa-write	Popa - spreminjanje	f
00030000-55e6-f523-1fe3-47e774a2c40f	Posta-read	Posta - branje	f
00030000-55e6-f523-c38e-f7412ff2243d	Posta-write	Posta - spreminjanje	f
00030000-55e6-f523-b4ee-a0427daa3919	PostavkaRacuna-read	PostavkaRacuna - branje	f
00030000-55e6-f523-d795-943f1a93fbb1	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	f
00030000-55e6-f523-d311-0dc2bbd8e605	PostniNaslov-read	PostniNaslov - branje	f
00030000-55e6-f523-64a9-79d7ffc89e7b	PostniNaslov-write	PostniNaslov - spreminjanje	f
00030000-55e6-f523-821d-fe8aa733679a	Predstava-read	Predstava - branje	f
00030000-55e6-f523-f7f7-2a73a2bf925c	Predstava-write	Predstava - spreminjanje	f
00030000-55e6-f523-0769-c565fe2aeb72	ProdajaPredstave-read	ProdajaPredstave - branje	f
00030000-55e6-f523-65e0-c37feeeacafb	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	f
00030000-55e6-f523-e82b-9387ef30ce63	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	f
00030000-55e6-f523-3e52-cacc64f3b730	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	f
00030000-55e6-f523-3730-249761f00015	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	f
00030000-55e6-f523-dc57-ba9a4e48d590	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	f
00030000-55e6-f523-cf08-d3de882f75a5	ProgramDela-read	ProgramDela - branje	f
00030000-55e6-f523-74ea-2253068a03fc	ProgramDela-write	ProgramDela - spreminjanje	f
00030000-55e6-f523-2faa-f1bb9c99ea5c	ProgramFestival-read	ProgramFestival - branje	f
00030000-55e6-f523-166c-ca604c26f7c0	ProgramFestival-write	ProgramFestival - spreminjanje	f
00030000-55e6-f523-8ccc-092c43f6cade	ProgramGostovanje-read	ProgramGostovanje - branje	f
00030000-55e6-f523-c4fc-90d9ef27edd4	ProgramGostovanje-write	ProgramGostovanje - spreminjanje	f
00030000-55e6-f523-e638-9df5c595beec	ProgramGostujoca-read	ProgramGostujoca - branje	f
00030000-55e6-f523-2953-5f5a3e76c2f9	ProgramGostujoca-write	ProgramGostujoca - spreminjanje	f
00030000-55e6-f523-d82f-4a851ef98abc	ProgramIzjemni-read	ProgramIzjemni - branje	f
00030000-55e6-f523-8086-4069b53a5755	ProgramIzjemni-write	ProgramIzjemni - spreminjanje	f
00030000-55e6-f523-a519-0c75c910fc48	ProgramPonovitevPrejsnjih-read	ProgramPonovitevPrejsnjih - branje	f
00030000-55e6-f523-d62f-fe1aa6dac9d2	ProgramPonovitevPrejsnjih-write	ProgramPonovitevPrejsnjih - spreminjanje	f
00030000-55e6-f523-bb25-d10b062168e8	ProgramPonovitevPremiere-read	ProgramPonovitevPremiere - branje	f
00030000-55e6-f523-2e45-3196eed74f5e	ProgramPonovitevPremiere-write	ProgramPonovitevPremiere - spreminjanje	f
00030000-55e6-f523-86c1-cffec7bcfa84	ProgramPremiera-read	ProgramPremiera - branje	f
00030000-55e6-f523-74b4-574408102701	ProgramPremiera-write	ProgramPremiera - spreminjanje	f
00030000-55e6-f523-c17a-528e7eb92b09	ProgramRazno-read	ProgramRazno - branje	f
00030000-55e6-f523-bca2-71012d39fd32	ProgramRazno-write	ProgramRazno - spreminjanje	f
00030000-55e6-f523-bbb5-5c09b052151b	ProgramskaEnotaSklopa-read	ProgramskaEnotaSklopa - branje	f
00030000-55e6-f523-b897-729a85e57f36	ProgramskaEnotaSklopa-write	ProgramskaEnotaSklopa - spreminjanje	f
00030000-55e6-f523-d1b8-b9c79814c4a3	Prostor-read	Prostor - branje	f
00030000-55e6-f523-b5e3-0a239366738b	Prostor-write	Prostor - spreminjanje	f
00030000-55e6-f523-b890-14b3f436cd00	Racun-read	Racun - branje	f
00030000-55e6-f523-fea0-99ce4b5454ed	Racun-write	Racun - spreminjanje	f
00030000-55e6-f523-d589-133354cef753	RazpisanSedez-read	RazpisanSedez - branje	f
00030000-55e6-f523-9fbb-531949dca7d9	RazpisanSedez-write	RazpisanSedez - spreminjanje	f
00030000-55e6-f523-40dc-56e141f1796f	Rekviziterstvo-read	Rekviziterstvo - branje	f
00030000-55e6-f523-f18d-dcdbf9394103	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	f
00030000-55e6-f523-bb96-7f4727b83c13	Rekvizit-read	Rekvizit - branje	f
00030000-55e6-f523-39a6-b4f3a4d9b588	Rekvizit-write	Rekvizit - spreminjanje	f
00030000-55e6-f523-d197-208241d77f04	Revizija-read	Revizija - branje	f
00030000-55e6-f523-6b16-b7dc0ac03ebc	Revizija-write	Revizija - spreminjanje	f
00030000-55e6-f523-d694-6eda51cc8525	Rezervacija-read	Rezervacija - branje	f
00030000-55e6-f523-9dbb-d8845764cc87	Rezervacija-write	Rezervacija - spreminjanje	f
00030000-55e6-f523-3a94-5e1a1034a499	SedezniRed-read	SedezniRed - branje	f
00030000-55e6-f523-8c45-9d04cf907c4e	SedezniRed-write	SedezniRed - spreminjanje	f
00030000-55e6-f523-00cb-87d56a9e66fa	Sedez-read	Sedez - branje	f
00030000-55e6-f523-ce0d-5e8f57b95250	Sedez-write	Sedez - spreminjanje	f
00030000-55e6-f523-52e1-568b9a56028a	Sezona-read	Sezona - branje	f
00030000-55e6-f523-1d6e-efdb6e5c3c3d	Sezona-write	Sezona - spreminjanje	f
00030000-55e6-f523-3c6c-f81be1cebef0	StevilcenjeKonfig-read	StevilcenjeKonfig - branje	f
00030000-55e6-f523-9179-024cde68193e	StevilcenjeKonfig-write	StevilcenjeKonfig - spreminjanje	f
00030000-55e6-f523-c533-cca531106ce1	Stevilcenje-read	Stevilcenje - branje	f
00030000-55e6-f523-a800-e4726313bb33	Stevilcenje-write	Stevilcenje - spreminjanje	f
00030000-55e6-f523-715a-ff94f415d675	StevilcenjeStanje-read	StevilcenjeStanje - branje	f
00030000-55e6-f523-fbed-9ee33ef1a9f9	StevilcenjeStanje-write	StevilcenjeStanje - spreminjanje	f
00030000-55e6-f523-2679-4bc255f5b7c9	StrosekUprizoritve-read	StrosekUprizoritve - branje	f
00030000-55e6-f523-26e7-3caa05e9b364	StrosekUprizoritve-write	StrosekUprizoritve - spreminjanje	f
00030000-55e6-f523-c1ee-6c163d1da2b2	Telefonska-read	Telefonska - branje	f
00030000-55e6-f523-95b4-94b5071c5945	Telefonska-write	Telefonska - spreminjanje	f
00030000-55e6-f523-993e-02cd1d8d957f	TerminStoritve-read	TerminStoritve - branje	f
00030000-55e6-f523-58d2-5f07555869df	TerminStoritve-write	TerminStoritve - spreminjanje	f
00030000-55e6-f523-92cf-f80c42c52bb3	TipFunkcije-read	TipFunkcije - branje	f
00030000-55e6-f523-385a-a1794c91cf4a	TipFunkcije-write	TipFunkcije - spreminjanje	f
00030000-55e6-f523-51bc-df9c1d7f0d05	TipProgramskeEnote-read	TipProgramskeEnote - branje	f
00030000-55e6-f523-c2b4-2df6c7c88f61	TipProgramskeEnote-write	TipProgramskeEnote - spreminjanje	f
00030000-55e6-f523-e020-91b4b8d54bcb	Trr-read	Trr - branje	f
00030000-55e6-f523-46e3-90ddb91e5dc4	Trr-write	Trr - spreminjanje	f
00030000-55e6-f523-b479-98f7c1a77edc	Uprizoritev-read	Uprizoritev - branje	f
00030000-55e6-f523-eefd-acfa7f35ad15	Uprizoritev-write	Uprizoritev - spreminjanje	f
00030000-55e6-f523-3784-9a46a06d5725	Vaja-read	Vaja - branje	f
00030000-55e6-f523-2ed8-776acb93fd88	Vaja-write	Vaja - spreminjanje	f
00030000-55e6-f523-aaeb-c8469fa582ba	VrstaSedezev-read	VrstaSedezev - branje	f
00030000-55e6-f523-48f0-a1eb909426de	VrstaSedezev-write	VrstaSedezev - spreminjanje	f
00030000-55e6-f523-5afe-3c1d5c2f931c	VrstaStroska-read	VrstaStroska - branje	f
00030000-55e6-f523-d2f7-44b19c321426	VrstaStroska-write	VrstaStroska - spreminjanje	f
00030000-55e6-f523-dc9a-9538e985f237	Zaposlitev-read	Zaposlitev - branje	f
00030000-55e6-f523-d00e-1955315d2215	Zaposlitev-write	Zaposlitev - spreminjanje	f
00030000-55e6-f523-2e6a-4ea1f8136fd7	Zasedenost-read	Zasedenost - branje	f
00030000-55e6-f523-27b3-efc40f846930	Zasedenost-write	Zasedenost - spreminjanje	f
00030000-55e6-f523-6a2f-389aee529ee2	ZvrstSurs-read	ZvrstSurs - branje	f
00030000-55e6-f523-b90e-880abf272642	ZvrstSurs-write	ZvrstSurs - spreminjanje	f
00030000-55e6-f523-b77b-38099dc47231	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	f
00030000-55e6-f523-5738-358f21063525	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	f
00030000-55e6-f523-2173-aec7e54f7005	Mapa-write	Mapa - osnovno dovoljenje za pisanje	f
00030000-55e6-f523-fe2c-8475a3657699	Mapa-read	Mapa - osnovno dovoljenje za branje	f
00030000-55e6-f523-2791-1088ecc9cf89	MapaAcl-write	MapaAcl - dovoljenje za dostop pisanje ACL-jev mape	f
00030000-55e6-f523-b810-2a1eddc542bf	MapaAcl-read	MapaAcl - dovoljenje za dostop branje ACL-jev mape	f
00030000-55e6-f523-2156-425e75ebaeaa	Zapis-write	Zapis - dovoljenje za pisanje zapisov	f
00030000-55e6-f523-cf0b-c2d6902e48f5	Zapis-read	Zapis - dovoljenje za pisanje zapisov	f
00030000-55e6-f523-e499-abdbac3a645e	ZapisLastnik-write	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	f
00030000-55e6-f523-69f0-af4e14db26ef	ZapisLastnik-read	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	f
00030000-55e6-f523-8892-9cfd13596b5e	VrstaZapisa-write	Šifrant vrst zapisa - spreminjanje	f
00030000-55e6-f523-15ad-80bdf3db7b0a	VrstaZapisa-read	Šifrant vrst zapisa - branje	f
00030000-55e6-f523-cf98-a8b720248408	Datoteka-write	Datoteka - spreminjanje	f
00030000-55e6-f523-62eb-fe2ce7c40f13	Datoteka-read	Datoteke - branje	f
\.


--
-- TOC entry 2912 (class 0 OID 16878910)
-- Dependencies: 177
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-55e6-f523-28e7-b8a7653cf790	00030000-55e6-f523-34f3-2a47b6315e23
00020000-55e6-f523-9e73-1200d172532f	00030000-55e6-f523-35bf-5cbe7f9f82a1
00020000-55e6-f523-d373-10baab725dc4	00030000-55e6-f523-5fed-5a713c03d8e9
00020000-55e6-f523-d373-10baab725dc4	00030000-55e6-f523-eb57-9d18588fcae8
00020000-55e6-f523-d373-10baab725dc4	00030000-55e6-f523-08d7-de0ff00575d2
00020000-55e6-f523-d373-10baab725dc4	00030000-55e6-f523-99cf-d6dbe9e49809
00020000-55e6-f523-d373-10baab725dc4	00030000-55e6-f523-9b0d-47efc17e2587
00020000-55e6-f523-d373-10baab725dc4	00030000-55e6-f523-33f0-9783d49f125d
00020000-55e6-f523-d373-10baab725dc4	00030000-55e6-f523-53bc-fcfd4eaae01e
00020000-55e6-f523-d373-10baab725dc4	00030000-55e6-f523-3749-45b2596c5029
00020000-55e6-f523-d373-10baab725dc4	00030000-55e6-f523-35bf-5cbe7f9f82a1
00020000-55e6-f523-d373-10baab725dc4	00030000-55e6-f523-cc96-fc9888c7107d
00020000-55e6-f523-d373-10baab725dc4	00030000-55e6-f523-620d-37ea5810f60c
00020000-55e6-f523-d373-10baab725dc4	00030000-55e6-f523-1e92-8ecb145f620e
00020000-55e6-f523-d373-10baab725dc4	00030000-55e6-f523-d855-47283f119535
00020000-55e6-f523-d373-10baab725dc4	00030000-55e6-f523-378c-216ce99554bf
00020000-55e6-f523-d373-10baab725dc4	00030000-55e6-f523-ca2e-da8d0e9bfdc6
00020000-55e6-f523-d373-10baab725dc4	00030000-55e6-f523-601e-2363f3937219
00020000-55e6-f523-d373-10baab725dc4	00030000-55e6-f523-f699-0e4ba6d54f55
00020000-55e6-f523-d373-10baab725dc4	00030000-55e6-f523-4489-e73c69fdfdcd
00020000-55e6-f523-d373-10baab725dc4	00030000-55e6-f523-c8b4-31ec48798e27
00020000-55e6-f523-d373-10baab725dc4	00030000-55e6-f523-5e13-fa3cbc8738db
00020000-55e6-f523-d373-10baab725dc4	00030000-55e6-f523-9ce0-1c61c0ade6a3
00020000-55e6-f523-d373-10baab725dc4	00030000-55e6-f523-94a4-792db62b5425
00020000-55e6-f523-d373-10baab725dc4	00030000-55e6-f523-6ce8-f2efdb0cf3cd
00020000-55e6-f523-d373-10baab725dc4	00030000-55e6-f523-6f82-575b33d0be55
00020000-55e6-f523-d373-10baab725dc4	00030000-55e6-f523-1fe3-47e774a2c40f
00020000-55e6-f523-d373-10baab725dc4	00030000-55e6-f523-c38e-f7412ff2243d
00020000-55e6-f523-d373-10baab725dc4	00030000-55e6-f523-d311-0dc2bbd8e605
00020000-55e6-f523-d373-10baab725dc4	00030000-55e6-f523-64a9-79d7ffc89e7b
00020000-55e6-f523-d373-10baab725dc4	00030000-55e6-f523-821d-fe8aa733679a
00020000-55e6-f523-d373-10baab725dc4	00030000-55e6-f523-f7f7-2a73a2bf925c
00020000-55e6-f523-d373-10baab725dc4	00030000-55e6-f523-3730-249761f00015
00020000-55e6-f523-d373-10baab725dc4	00030000-55e6-f523-dc57-ba9a4e48d590
00020000-55e6-f523-d373-10baab725dc4	00030000-55e6-f523-d1b8-b9c79814c4a3
00020000-55e6-f523-d373-10baab725dc4	00030000-55e6-f523-b5e3-0a239366738b
00020000-55e6-f523-d373-10baab725dc4	00030000-55e6-f523-40dc-56e141f1796f
00020000-55e6-f523-d373-10baab725dc4	00030000-55e6-f523-f18d-dcdbf9394103
00020000-55e6-f523-d373-10baab725dc4	00030000-55e6-f523-bb96-7f4727b83c13
00020000-55e6-f523-d373-10baab725dc4	00030000-55e6-f523-39a6-b4f3a4d9b588
00020000-55e6-f523-d373-10baab725dc4	00030000-55e6-f523-52e1-568b9a56028a
00020000-55e6-f523-d373-10baab725dc4	00030000-55e6-f523-1d6e-efdb6e5c3c3d
00020000-55e6-f523-d373-10baab725dc4	00030000-55e6-f523-92cf-f80c42c52bb3
00020000-55e6-f523-d373-10baab725dc4	00030000-55e6-f523-b479-98f7c1a77edc
00020000-55e6-f523-d373-10baab725dc4	00030000-55e6-f523-eefd-acfa7f35ad15
00020000-55e6-f523-d373-10baab725dc4	00030000-55e6-f523-3784-9a46a06d5725
00020000-55e6-f523-d373-10baab725dc4	00030000-55e6-f523-2ed8-776acb93fd88
00020000-55e6-f523-d373-10baab725dc4	00030000-55e6-f523-2e6a-4ea1f8136fd7
00020000-55e6-f523-d373-10baab725dc4	00030000-55e6-f523-27b3-efc40f846930
00020000-55e6-f523-d373-10baab725dc4	00030000-55e6-f523-6a2f-389aee529ee2
00020000-55e6-f523-d373-10baab725dc4	00030000-55e6-f523-b77b-38099dc47231
00020000-55e6-f523-2899-f34ab90b0a77	00030000-55e6-f523-5fed-5a713c03d8e9
00020000-55e6-f523-2899-f34ab90b0a77	00030000-55e6-f523-9b0d-47efc17e2587
00020000-55e6-f523-2899-f34ab90b0a77	00030000-55e6-f523-33f0-9783d49f125d
00020000-55e6-f523-2899-f34ab90b0a77	00030000-55e6-f523-35bf-5cbe7f9f82a1
00020000-55e6-f523-2899-f34ab90b0a77	00030000-55e6-f523-d855-47283f119535
00020000-55e6-f523-2899-f34ab90b0a77	00030000-55e6-f523-ca2e-da8d0e9bfdc6
00020000-55e6-f523-2899-f34ab90b0a77	00030000-55e6-f523-f699-0e4ba6d54f55
00020000-55e6-f523-2899-f34ab90b0a77	00030000-55e6-f523-4489-e73c69fdfdcd
00020000-55e6-f523-2899-f34ab90b0a77	00030000-55e6-f523-c8b4-31ec48798e27
00020000-55e6-f523-2899-f34ab90b0a77	00030000-55e6-f523-5e13-fa3cbc8738db
00020000-55e6-f523-2899-f34ab90b0a77	00030000-55e6-f523-9ce0-1c61c0ade6a3
00020000-55e6-f523-2899-f34ab90b0a77	00030000-55e6-f523-94a4-792db62b5425
00020000-55e6-f523-2899-f34ab90b0a77	00030000-55e6-f523-6ce8-f2efdb0cf3cd
00020000-55e6-f523-2899-f34ab90b0a77	00030000-55e6-f523-1fe3-47e774a2c40f
00020000-55e6-f523-2899-f34ab90b0a77	00030000-55e6-f523-d311-0dc2bbd8e605
00020000-55e6-f523-2899-f34ab90b0a77	00030000-55e6-f523-64a9-79d7ffc89e7b
00020000-55e6-f523-2899-f34ab90b0a77	00030000-55e6-f523-821d-fe8aa733679a
00020000-55e6-f523-2899-f34ab90b0a77	00030000-55e6-f523-d1b8-b9c79814c4a3
00020000-55e6-f523-2899-f34ab90b0a77	00030000-55e6-f523-40dc-56e141f1796f
00020000-55e6-f523-2899-f34ab90b0a77	00030000-55e6-f523-bb96-7f4727b83c13
00020000-55e6-f523-2899-f34ab90b0a77	00030000-55e6-f523-52e1-568b9a56028a
00020000-55e6-f523-2899-f34ab90b0a77	00030000-55e6-f523-c1ee-6c163d1da2b2
00020000-55e6-f523-2899-f34ab90b0a77	00030000-55e6-f523-95b4-94b5071c5945
00020000-55e6-f523-2899-f34ab90b0a77	00030000-55e6-f523-e020-91b4b8d54bcb
00020000-55e6-f523-2899-f34ab90b0a77	00030000-55e6-f523-46e3-90ddb91e5dc4
00020000-55e6-f523-2899-f34ab90b0a77	00030000-55e6-f523-dc9a-9538e985f237
00020000-55e6-f523-2899-f34ab90b0a77	00030000-55e6-f523-d00e-1955315d2215
00020000-55e6-f523-2899-f34ab90b0a77	00030000-55e6-f523-6a2f-389aee529ee2
00020000-55e6-f523-2899-f34ab90b0a77	00030000-55e6-f523-b77b-38099dc47231
00020000-55e6-f523-de5a-b9441440d919	00030000-55e6-f523-5fed-5a713c03d8e9
00020000-55e6-f523-de5a-b9441440d919	00030000-55e6-f523-08d7-de0ff00575d2
00020000-55e6-f523-de5a-b9441440d919	00030000-55e6-f523-9b0d-47efc17e2587
00020000-55e6-f523-de5a-b9441440d919	00030000-55e6-f523-28ba-4c53b50ece29
00020000-55e6-f523-de5a-b9441440d919	00030000-55e6-f523-d628-444dca1add5d
00020000-55e6-f523-de5a-b9441440d919	00030000-55e6-f523-e17e-5b2e12a71fd1
00020000-55e6-f523-de5a-b9441440d919	00030000-55e6-f523-33f0-9783d49f125d
00020000-55e6-f523-de5a-b9441440d919	00030000-55e6-f523-35bf-5cbe7f9f82a1
00020000-55e6-f523-de5a-b9441440d919	00030000-55e6-f523-620d-37ea5810f60c
00020000-55e6-f523-de5a-b9441440d919	00030000-55e6-f523-d855-47283f119535
00020000-55e6-f523-de5a-b9441440d919	00030000-55e6-f523-ca2e-da8d0e9bfdc6
00020000-55e6-f523-de5a-b9441440d919	00030000-55e6-f523-f699-0e4ba6d54f55
00020000-55e6-f523-de5a-b9441440d919	00030000-55e6-f523-c8b4-31ec48798e27
00020000-55e6-f523-de5a-b9441440d919	00030000-55e6-f523-5e13-fa3cbc8738db
00020000-55e6-f523-de5a-b9441440d919	00030000-55e6-f523-9ce0-1c61c0ade6a3
00020000-55e6-f523-de5a-b9441440d919	00030000-55e6-f523-6ce8-f2efdb0cf3cd
00020000-55e6-f523-de5a-b9441440d919	00030000-55e6-f523-1fe3-47e774a2c40f
00020000-55e6-f523-de5a-b9441440d919	00030000-55e6-f523-821d-fe8aa733679a
00020000-55e6-f523-de5a-b9441440d919	00030000-55e6-f523-3730-249761f00015
00020000-55e6-f523-de5a-b9441440d919	00030000-55e6-f523-d1b8-b9c79814c4a3
00020000-55e6-f523-de5a-b9441440d919	00030000-55e6-f523-40dc-56e141f1796f
00020000-55e6-f523-de5a-b9441440d919	00030000-55e6-f523-bb96-7f4727b83c13
00020000-55e6-f523-de5a-b9441440d919	00030000-55e6-f523-52e1-568b9a56028a
00020000-55e6-f523-de5a-b9441440d919	00030000-55e6-f523-92cf-f80c42c52bb3
00020000-55e6-f523-de5a-b9441440d919	00030000-55e6-f523-3784-9a46a06d5725
00020000-55e6-f523-de5a-b9441440d919	00030000-55e6-f523-2e6a-4ea1f8136fd7
00020000-55e6-f523-de5a-b9441440d919	00030000-55e6-f523-6a2f-389aee529ee2
00020000-55e6-f523-de5a-b9441440d919	00030000-55e6-f523-b77b-38099dc47231
00020000-55e6-f523-4fef-124bb3d4bb6a	00030000-55e6-f523-5fed-5a713c03d8e9
00020000-55e6-f523-4fef-124bb3d4bb6a	00030000-55e6-f523-eb57-9d18588fcae8
00020000-55e6-f523-4fef-124bb3d4bb6a	00030000-55e6-f523-99cf-d6dbe9e49809
00020000-55e6-f523-4fef-124bb3d4bb6a	00030000-55e6-f523-9b0d-47efc17e2587
00020000-55e6-f523-4fef-124bb3d4bb6a	00030000-55e6-f523-33f0-9783d49f125d
00020000-55e6-f523-4fef-124bb3d4bb6a	00030000-55e6-f523-35bf-5cbe7f9f82a1
00020000-55e6-f523-4fef-124bb3d4bb6a	00030000-55e6-f523-d855-47283f119535
00020000-55e6-f523-4fef-124bb3d4bb6a	00030000-55e6-f523-ca2e-da8d0e9bfdc6
00020000-55e6-f523-4fef-124bb3d4bb6a	00030000-55e6-f523-c8b4-31ec48798e27
00020000-55e6-f523-4fef-124bb3d4bb6a	00030000-55e6-f523-5e13-fa3cbc8738db
00020000-55e6-f523-4fef-124bb3d4bb6a	00030000-55e6-f523-6ce8-f2efdb0cf3cd
00020000-55e6-f523-4fef-124bb3d4bb6a	00030000-55e6-f523-1fe3-47e774a2c40f
00020000-55e6-f523-4fef-124bb3d4bb6a	00030000-55e6-f523-821d-fe8aa733679a
00020000-55e6-f523-4fef-124bb3d4bb6a	00030000-55e6-f523-d1b8-b9c79814c4a3
00020000-55e6-f523-4fef-124bb3d4bb6a	00030000-55e6-f523-40dc-56e141f1796f
00020000-55e6-f523-4fef-124bb3d4bb6a	00030000-55e6-f523-bb96-7f4727b83c13
00020000-55e6-f523-4fef-124bb3d4bb6a	00030000-55e6-f523-52e1-568b9a56028a
00020000-55e6-f523-4fef-124bb3d4bb6a	00030000-55e6-f523-92cf-f80c42c52bb3
00020000-55e6-f523-4fef-124bb3d4bb6a	00030000-55e6-f523-6a2f-389aee529ee2
00020000-55e6-f523-4fef-124bb3d4bb6a	00030000-55e6-f523-b77b-38099dc47231
00020000-55e6-f523-8bb2-26f3b9f8f323	00030000-55e6-f523-5fed-5a713c03d8e9
00020000-55e6-f523-8bb2-26f3b9f8f323	00030000-55e6-f523-9b0d-47efc17e2587
00020000-55e6-f523-8bb2-26f3b9f8f323	00030000-55e6-f523-33f0-9783d49f125d
00020000-55e6-f523-8bb2-26f3b9f8f323	00030000-55e6-f523-35bf-5cbe7f9f82a1
00020000-55e6-f523-8bb2-26f3b9f8f323	00030000-55e6-f523-d855-47283f119535
00020000-55e6-f523-8bb2-26f3b9f8f323	00030000-55e6-f523-ca2e-da8d0e9bfdc6
00020000-55e6-f523-8bb2-26f3b9f8f323	00030000-55e6-f523-c8b4-31ec48798e27
00020000-55e6-f523-8bb2-26f3b9f8f323	00030000-55e6-f523-5e13-fa3cbc8738db
00020000-55e6-f523-8bb2-26f3b9f8f323	00030000-55e6-f523-6ce8-f2efdb0cf3cd
00020000-55e6-f523-8bb2-26f3b9f8f323	00030000-55e6-f523-1fe3-47e774a2c40f
00020000-55e6-f523-8bb2-26f3b9f8f323	00030000-55e6-f523-821d-fe8aa733679a
00020000-55e6-f523-8bb2-26f3b9f8f323	00030000-55e6-f523-d1b8-b9c79814c4a3
00020000-55e6-f523-8bb2-26f3b9f8f323	00030000-55e6-f523-40dc-56e141f1796f
00020000-55e6-f523-8bb2-26f3b9f8f323	00030000-55e6-f523-bb96-7f4727b83c13
00020000-55e6-f523-8bb2-26f3b9f8f323	00030000-55e6-f523-52e1-568b9a56028a
00020000-55e6-f523-8bb2-26f3b9f8f323	00030000-55e6-f523-993e-02cd1d8d957f
00020000-55e6-f523-8bb2-26f3b9f8f323	00030000-55e6-f523-886f-7b9d5beacf6b
00020000-55e6-f523-8bb2-26f3b9f8f323	00030000-55e6-f523-92cf-f80c42c52bb3
00020000-55e6-f523-8bb2-26f3b9f8f323	00030000-55e6-f523-6a2f-389aee529ee2
00020000-55e6-f523-8bb2-26f3b9f8f323	00030000-55e6-f523-b77b-38099dc47231
00020000-55e6-f524-75c7-1ac6b90426b0	00030000-55e6-f523-cfaa-bebdf27ce261
00020000-55e6-f524-75c7-1ac6b90426b0	00030000-55e6-f523-34f3-2a47b6315e23
00020000-55e6-f524-75c7-1ac6b90426b0	00030000-55e6-f523-886f-7b9d5beacf6b
00020000-55e6-f524-75c7-1ac6b90426b0	00030000-55e6-f523-53bc-fcfd4eaae01e
00020000-55e6-f524-75c7-1ac6b90426b0	00030000-55e6-f523-bf84-f942f5dcc4e9
00020000-55e6-f524-75c7-1ac6b90426b0	00030000-55e6-f523-dcde-1246812c3970
00020000-55e6-f524-75c7-1ac6b90426b0	00030000-55e6-f523-4f2c-37a706a3af3b
00020000-55e6-f524-75c7-1ac6b90426b0	00030000-55e6-f523-5fed-5a713c03d8e9
00020000-55e6-f524-75c7-1ac6b90426b0	00030000-55e6-f523-eb57-9d18588fcae8
00020000-55e6-f524-75c7-1ac6b90426b0	00030000-55e6-f523-08d7-de0ff00575d2
00020000-55e6-f524-75c7-1ac6b90426b0	00030000-55e6-f523-99cf-d6dbe9e49809
00020000-55e6-f524-75c7-1ac6b90426b0	00030000-55e6-f523-9b0d-47efc17e2587
00020000-55e6-f524-75c7-1ac6b90426b0	00030000-55e6-f523-28ba-4c53b50ece29
00020000-55e6-f524-75c7-1ac6b90426b0	00030000-55e6-f523-d628-444dca1add5d
00020000-55e6-f524-75c7-1ac6b90426b0	00030000-55e6-f523-a7a4-e16419c8cf2b
00020000-55e6-f524-75c7-1ac6b90426b0	00030000-55e6-f523-e17e-5b2e12a71fd1
00020000-55e6-f524-75c7-1ac6b90426b0	00030000-55e6-f523-6df8-0c57a87a00ad
00020000-55e6-f524-75c7-1ac6b90426b0	00030000-55e6-f523-33f0-9783d49f125d
00020000-55e6-f524-75c7-1ac6b90426b0	00030000-55e6-f523-3749-45b2596c5029
00020000-55e6-f524-75c7-1ac6b90426b0	00030000-55e6-f523-35bf-5cbe7f9f82a1
00020000-55e6-f524-75c7-1ac6b90426b0	00030000-55e6-f523-cc96-fc9888c7107d
00020000-55e6-f524-75c7-1ac6b90426b0	00030000-55e6-f523-9d2e-b6b58b33d65a
00020000-55e6-f524-75c7-1ac6b90426b0	00030000-55e6-f523-d2b2-02f0a347fed0
00020000-55e6-f524-75c7-1ac6b90426b0	00030000-55e6-f523-70cc-c76381ed6267
00020000-55e6-f524-75c7-1ac6b90426b0	00030000-55e6-f523-c0e9-af34bb8d170c
00020000-55e6-f524-75c7-1ac6b90426b0	00030000-55e6-f523-620d-37ea5810f60c
00020000-55e6-f524-75c7-1ac6b90426b0	00030000-55e6-f523-1e92-8ecb145f620e
00020000-55e6-f524-75c7-1ac6b90426b0	00030000-55e6-f523-d855-47283f119535
00020000-55e6-f524-75c7-1ac6b90426b0	00030000-55e6-f523-378c-216ce99554bf
00020000-55e6-f524-75c7-1ac6b90426b0	00030000-55e6-f523-ca2e-da8d0e9bfdc6
00020000-55e6-f524-75c7-1ac6b90426b0	00030000-55e6-f523-601e-2363f3937219
00020000-55e6-f524-75c7-1ac6b90426b0	00030000-55e6-f523-f699-0e4ba6d54f55
00020000-55e6-f524-75c7-1ac6b90426b0	00030000-55e6-f523-4489-e73c69fdfdcd
00020000-55e6-f524-75c7-1ac6b90426b0	00030000-55e6-f523-11f3-eaa0b61f98c6
00020000-55e6-f524-75c7-1ac6b90426b0	00030000-55e6-f523-1239-bd1ea015f72e
00020000-55e6-f524-75c7-1ac6b90426b0	00030000-55e6-f523-be50-dcd6dfae8e4e
00020000-55e6-f524-75c7-1ac6b90426b0	00030000-55e6-f523-5b6b-e601be1e776b
00020000-55e6-f524-75c7-1ac6b90426b0	00030000-55e6-f523-c8b4-31ec48798e27
00020000-55e6-f524-75c7-1ac6b90426b0	00030000-55e6-f523-9cb9-ee04f7386fde
00020000-55e6-f524-75c7-1ac6b90426b0	00030000-55e6-f523-5e13-fa3cbc8738db
00020000-55e6-f524-75c7-1ac6b90426b0	00030000-55e6-f523-0481-cc92ba5043dd
00020000-55e6-f524-75c7-1ac6b90426b0	00030000-55e6-f523-9ce0-1c61c0ade6a3
00020000-55e6-f524-75c7-1ac6b90426b0	00030000-55e6-f523-94a4-792db62b5425
00020000-55e6-f524-75c7-1ac6b90426b0	00030000-55e6-f523-34c9-cd984e98a962
00020000-55e6-f524-75c7-1ac6b90426b0	00030000-55e6-f523-33da-60477a816d63
00020000-55e6-f524-75c7-1ac6b90426b0	00030000-55e6-f523-1ebf-a1ef78daf5bc
00020000-55e6-f524-75c7-1ac6b90426b0	00030000-55e6-f523-c755-6289ea5103ab
00020000-55e6-f524-75c7-1ac6b90426b0	00030000-55e6-f523-0fc8-4dd22cc85557
00020000-55e6-f524-75c7-1ac6b90426b0	00030000-55e6-f523-c73b-3a46a46270d2
00020000-55e6-f524-75c7-1ac6b90426b0	00030000-55e6-f523-6ce8-f2efdb0cf3cd
00020000-55e6-f524-75c7-1ac6b90426b0	00030000-55e6-f523-6f82-575b33d0be55
00020000-55e6-f524-75c7-1ac6b90426b0	00030000-55e6-f523-1fe3-47e774a2c40f
00020000-55e6-f524-75c7-1ac6b90426b0	00030000-55e6-f523-c38e-f7412ff2243d
00020000-55e6-f524-75c7-1ac6b90426b0	00030000-55e6-f523-b4ee-a0427daa3919
00020000-55e6-f524-75c7-1ac6b90426b0	00030000-55e6-f523-d795-943f1a93fbb1
00020000-55e6-f524-75c7-1ac6b90426b0	00030000-55e6-f523-d311-0dc2bbd8e605
00020000-55e6-f524-75c7-1ac6b90426b0	00030000-55e6-f523-64a9-79d7ffc89e7b
00020000-55e6-f524-75c7-1ac6b90426b0	00030000-55e6-f523-821d-fe8aa733679a
00020000-55e6-f524-75c7-1ac6b90426b0	00030000-55e6-f523-f7f7-2a73a2bf925c
00020000-55e6-f524-75c7-1ac6b90426b0	00030000-55e6-f523-0769-c565fe2aeb72
00020000-55e6-f524-75c7-1ac6b90426b0	00030000-55e6-f523-65e0-c37feeeacafb
00020000-55e6-f524-75c7-1ac6b90426b0	00030000-55e6-f523-e82b-9387ef30ce63
00020000-55e6-f524-75c7-1ac6b90426b0	00030000-55e6-f523-3e52-cacc64f3b730
00020000-55e6-f524-75c7-1ac6b90426b0	00030000-55e6-f523-3730-249761f00015
00020000-55e6-f524-75c7-1ac6b90426b0	00030000-55e6-f523-dc57-ba9a4e48d590
00020000-55e6-f524-75c7-1ac6b90426b0	00030000-55e6-f523-cf08-d3de882f75a5
00020000-55e6-f524-75c7-1ac6b90426b0	00030000-55e6-f523-74ea-2253068a03fc
00020000-55e6-f524-75c7-1ac6b90426b0	00030000-55e6-f523-2faa-f1bb9c99ea5c
00020000-55e6-f524-75c7-1ac6b90426b0	00030000-55e6-f523-166c-ca604c26f7c0
00020000-55e6-f524-75c7-1ac6b90426b0	00030000-55e6-f523-8ccc-092c43f6cade
00020000-55e6-f524-75c7-1ac6b90426b0	00030000-55e6-f523-c4fc-90d9ef27edd4
00020000-55e6-f524-75c7-1ac6b90426b0	00030000-55e6-f523-e638-9df5c595beec
00020000-55e6-f524-75c7-1ac6b90426b0	00030000-55e6-f523-2953-5f5a3e76c2f9
00020000-55e6-f524-75c7-1ac6b90426b0	00030000-55e6-f523-d82f-4a851ef98abc
00020000-55e6-f524-75c7-1ac6b90426b0	00030000-55e6-f523-8086-4069b53a5755
00020000-55e6-f524-75c7-1ac6b90426b0	00030000-55e6-f523-a519-0c75c910fc48
00020000-55e6-f524-75c7-1ac6b90426b0	00030000-55e6-f523-d62f-fe1aa6dac9d2
00020000-55e6-f524-75c7-1ac6b90426b0	00030000-55e6-f523-bb25-d10b062168e8
00020000-55e6-f524-75c7-1ac6b90426b0	00030000-55e6-f523-2e45-3196eed74f5e
00020000-55e6-f524-75c7-1ac6b90426b0	00030000-55e6-f523-86c1-cffec7bcfa84
00020000-55e6-f524-75c7-1ac6b90426b0	00030000-55e6-f523-74b4-574408102701
00020000-55e6-f524-75c7-1ac6b90426b0	00030000-55e6-f523-c17a-528e7eb92b09
00020000-55e6-f524-75c7-1ac6b90426b0	00030000-55e6-f523-bca2-71012d39fd32
00020000-55e6-f524-75c7-1ac6b90426b0	00030000-55e6-f523-bbb5-5c09b052151b
00020000-55e6-f524-75c7-1ac6b90426b0	00030000-55e6-f523-b897-729a85e57f36
00020000-55e6-f524-75c7-1ac6b90426b0	00030000-55e6-f523-d1b8-b9c79814c4a3
00020000-55e6-f524-75c7-1ac6b90426b0	00030000-55e6-f523-b5e3-0a239366738b
00020000-55e6-f524-75c7-1ac6b90426b0	00030000-55e6-f523-b890-14b3f436cd00
00020000-55e6-f524-75c7-1ac6b90426b0	00030000-55e6-f523-fea0-99ce4b5454ed
00020000-55e6-f524-75c7-1ac6b90426b0	00030000-55e6-f523-d589-133354cef753
00020000-55e6-f524-75c7-1ac6b90426b0	00030000-55e6-f523-9fbb-531949dca7d9
00020000-55e6-f524-75c7-1ac6b90426b0	00030000-55e6-f523-40dc-56e141f1796f
00020000-55e6-f524-75c7-1ac6b90426b0	00030000-55e6-f523-f18d-dcdbf9394103
00020000-55e6-f524-75c7-1ac6b90426b0	00030000-55e6-f523-bb96-7f4727b83c13
00020000-55e6-f524-75c7-1ac6b90426b0	00030000-55e6-f523-39a6-b4f3a4d9b588
00020000-55e6-f524-75c7-1ac6b90426b0	00030000-55e6-f523-d197-208241d77f04
00020000-55e6-f524-75c7-1ac6b90426b0	00030000-55e6-f523-6b16-b7dc0ac03ebc
00020000-55e6-f524-75c7-1ac6b90426b0	00030000-55e6-f523-d694-6eda51cc8525
00020000-55e6-f524-75c7-1ac6b90426b0	00030000-55e6-f523-9dbb-d8845764cc87
00020000-55e6-f524-75c7-1ac6b90426b0	00030000-55e6-f523-3a94-5e1a1034a499
00020000-55e6-f524-75c7-1ac6b90426b0	00030000-55e6-f523-8c45-9d04cf907c4e
00020000-55e6-f524-75c7-1ac6b90426b0	00030000-55e6-f523-00cb-87d56a9e66fa
00020000-55e6-f524-75c7-1ac6b90426b0	00030000-55e6-f523-ce0d-5e8f57b95250
00020000-55e6-f524-75c7-1ac6b90426b0	00030000-55e6-f523-52e1-568b9a56028a
00020000-55e6-f524-75c7-1ac6b90426b0	00030000-55e6-f523-1d6e-efdb6e5c3c3d
00020000-55e6-f524-75c7-1ac6b90426b0	00030000-55e6-f523-3c6c-f81be1cebef0
00020000-55e6-f524-75c7-1ac6b90426b0	00030000-55e6-f523-9179-024cde68193e
00020000-55e6-f524-75c7-1ac6b90426b0	00030000-55e6-f523-c533-cca531106ce1
00020000-55e6-f524-75c7-1ac6b90426b0	00030000-55e6-f523-a800-e4726313bb33
00020000-55e6-f524-75c7-1ac6b90426b0	00030000-55e6-f523-715a-ff94f415d675
00020000-55e6-f524-75c7-1ac6b90426b0	00030000-55e6-f523-fbed-9ee33ef1a9f9
00020000-55e6-f524-75c7-1ac6b90426b0	00030000-55e6-f523-2679-4bc255f5b7c9
00020000-55e6-f524-75c7-1ac6b90426b0	00030000-55e6-f523-26e7-3caa05e9b364
00020000-55e6-f524-75c7-1ac6b90426b0	00030000-55e6-f523-c1ee-6c163d1da2b2
00020000-55e6-f524-75c7-1ac6b90426b0	00030000-55e6-f523-95b4-94b5071c5945
00020000-55e6-f524-75c7-1ac6b90426b0	00030000-55e6-f523-993e-02cd1d8d957f
00020000-55e6-f524-75c7-1ac6b90426b0	00030000-55e6-f523-58d2-5f07555869df
00020000-55e6-f524-75c7-1ac6b90426b0	00030000-55e6-f523-92cf-f80c42c52bb3
00020000-55e6-f524-75c7-1ac6b90426b0	00030000-55e6-f523-385a-a1794c91cf4a
00020000-55e6-f524-75c7-1ac6b90426b0	00030000-55e6-f523-51bc-df9c1d7f0d05
00020000-55e6-f524-75c7-1ac6b90426b0	00030000-55e6-f523-c2b4-2df6c7c88f61
00020000-55e6-f524-75c7-1ac6b90426b0	00030000-55e6-f523-e020-91b4b8d54bcb
00020000-55e6-f524-75c7-1ac6b90426b0	00030000-55e6-f523-46e3-90ddb91e5dc4
00020000-55e6-f524-75c7-1ac6b90426b0	00030000-55e6-f523-b479-98f7c1a77edc
00020000-55e6-f524-75c7-1ac6b90426b0	00030000-55e6-f523-eefd-acfa7f35ad15
00020000-55e6-f524-75c7-1ac6b90426b0	00030000-55e6-f523-3784-9a46a06d5725
00020000-55e6-f524-75c7-1ac6b90426b0	00030000-55e6-f523-2ed8-776acb93fd88
00020000-55e6-f524-75c7-1ac6b90426b0	00030000-55e6-f523-aaeb-c8469fa582ba
00020000-55e6-f524-75c7-1ac6b90426b0	00030000-55e6-f523-48f0-a1eb909426de
00020000-55e6-f524-75c7-1ac6b90426b0	00030000-55e6-f523-5afe-3c1d5c2f931c
00020000-55e6-f524-75c7-1ac6b90426b0	00030000-55e6-f523-d2f7-44b19c321426
00020000-55e6-f524-75c7-1ac6b90426b0	00030000-55e6-f523-dc9a-9538e985f237
00020000-55e6-f524-75c7-1ac6b90426b0	00030000-55e6-f523-d00e-1955315d2215
00020000-55e6-f524-75c7-1ac6b90426b0	00030000-55e6-f523-2e6a-4ea1f8136fd7
00020000-55e6-f524-75c7-1ac6b90426b0	00030000-55e6-f523-27b3-efc40f846930
00020000-55e6-f524-75c7-1ac6b90426b0	00030000-55e6-f523-6a2f-389aee529ee2
00020000-55e6-f524-75c7-1ac6b90426b0	00030000-55e6-f523-b90e-880abf272642
00020000-55e6-f524-75c7-1ac6b90426b0	00030000-55e6-f523-b77b-38099dc47231
00020000-55e6-f524-75c7-1ac6b90426b0	00030000-55e6-f523-5738-358f21063525
\.


--
-- TOC entry 2939 (class 0 OID 16879205)
-- Dependencies: 204
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 2943 (class 0 OID 16879239)
-- Dependencies: 208
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 2954 (class 0 OID 16879363)
-- Dependencies: 219
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, zacetek, konec, placilonavajo, vrednostvaje, planiranostevilovaj, vrednostvaj, vrednostpredstave, vrednostdopremiere, aktivna, zaposlenvdrjz, samozaposlen, igralec, opis) FROM stdin;
000b0000-55e6-f525-7a3f-fd99ae148004	00090000-55e6-f525-490f-3d192febd5f1	\N	\N	0001	\N	\N	f	10.00	3	10.00	30.00	10.00	t	t	f	t	Pogodba o sodelovanju
000b0000-55e6-f525-de01-b7708545f214	00090000-55e6-f525-84db-08c7f67885c1	\N	\N	0002	\N	\N	t	11.00	10	11.00	31.00	110.00	t	f	t	t	Pogodba za vlogo Helena
000b0000-55e6-f525-2597-bd6e957d0ae0	00090000-55e6-f525-0d81-67bf9f7fdc21	\N	\N	0003	\N	\N	f	12.00	4	12.00	32.00	12.00	t	f	t	f	Pogodba za lektoriranje
\.


--
-- TOC entry 2917 (class 0 OID 16878970)
-- Dependencies: 182
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, drzava_id, sifra, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo, nvo) FROM stdin;
00080000-55e6-f524-fc94-a0ca1bf6df2c	00040000-55e6-f523-d880-cc58e1f91db0	0988	AK	Juhuhu d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55e6-f524-19aa-d81eb8fb3137	00040000-55e6-f523-d880-cc58e1f91db0	0989	AK	Hopsasa d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	t
00080000-55e6-f524-6e01-0d2a45d9fa5d	00040000-55e6-f523-d880-cc58e1f91db0	0987	AK	Gledališče Šrum d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55e6-f524-0fb5-6923b438caf9	00040000-55e6-f523-d880-cc58e1f91db0	0986	AK	Lutkovni Direndaj d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55e6-f524-db7e-92255418b06e	00040000-55e6-f523-d880-cc58e1f91db0	0985	AK	Tatjana Stanič, Lektoriranje, s.p.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55e6-f524-66d1-8431d0898f2b	00040000-55e6-f523-bb17-ef27f1182111	0984	AK	Gledališče Lepote tvoje		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55e6-f524-f496-4fb6d0bc1f21	00040000-55e6-f523-8734-23f94463db63	0983	AK	Sunce naše		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55e6-f524-9472-02488c19602a	00040000-55e6-f523-30a6-794e6c4cae79	0982	AK	Theater Amadeus		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55e6-f526-6494-a6b18e606067	00040000-55e6-f523-d880-cc58e1f91db0	1001	AK	Gledališče Matica		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
\.


--
-- TOC entry 2919 (class 0 OID 16879004)
-- Dependencies: 184
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-55e6-f523-372e-e09b10dd1024	8341	Adlešiči
00050000-55e6-f523-4edb-f2f9b39f4454	5270	Ajdovščina
00050000-55e6-f523-842f-843d8fbbd577	6280	Ankaran/Ancarano
00050000-55e6-f523-69a2-e545396c9f9b	9253	Apače
00050000-55e6-f523-8bf9-a1cfa1aa18c4	8253	Artiče
00050000-55e6-f523-ab32-9b4906325dec	4275	Begunje na Gorenjskem
00050000-55e6-f523-ec78-82b8be75109c	1382	Begunje pri Cerknici
00050000-55e6-f523-2218-79cef73caaba	9231	Beltinci
00050000-55e6-f523-3877-6860ae67c028	2234	Benedikt
00050000-55e6-f523-0693-d2e894237a05	2345	Bistrica ob Dravi
00050000-55e6-f523-e6d3-e7e23686b9d0	3256	Bistrica ob Sotli
00050000-55e6-f523-14a8-504c958d1eb5	8259	Bizeljsko
00050000-55e6-f523-772b-361dfa4e3501	1223	Blagovica
00050000-55e6-f523-ba52-9a0c161c2904	8283	Blanca
00050000-55e6-f523-cdfa-f31b6c7d0b7d	4260	Bled
00050000-55e6-f523-d50b-f1b4aa190ac2	4273	Blejska Dobrava
00050000-55e6-f523-69f3-1d3e0121b95c	9265	Bodonci
00050000-55e6-f523-651b-7c4dfcde802c	9222	Bogojina
00050000-55e6-f523-7b0d-1b4fd57a35a5	4263	Bohinjska Bela
00050000-55e6-f523-8382-bda6f2b1b006	4264	Bohinjska Bistrica
00050000-55e6-f523-2c09-7c957512902f	4265	Bohinjsko jezero
00050000-55e6-f523-7acd-82c46c4ae9af	1353	Borovnica
00050000-55e6-f523-30a0-22fa260ed604	8294	Boštanj
00050000-55e6-f523-7ddf-82ad8c3e46b5	5230	Bovec
00050000-55e6-f523-bb83-383ec24825af	5295	Branik
00050000-55e6-f523-f7ee-bc70215104ee	3314	Braslovče
00050000-55e6-f523-eef0-1b07a831cca8	5223	Breginj
00050000-55e6-f523-bdae-f9fd12d66e23	8280	Brestanica
00050000-55e6-f523-0090-ad3096096a33	2354	Bresternica
00050000-55e6-f523-2c47-aded15ff73c9	4243	Brezje
00050000-55e6-f523-ba17-02eb578dc1d0	1351	Brezovica pri Ljubljani
00050000-55e6-f523-ed30-d915f85625ab	8250	Brežice
00050000-55e6-f523-39a7-d26242573772	4210	Brnik - Aerodrom
00050000-55e6-f523-e26e-176a9d7b9f5f	8321	Brusnice
00050000-55e6-f523-985c-92184f8caedc	3255	Buče
00050000-55e6-f523-691d-8f2fe6fc33ec	8276	Bučka 
00050000-55e6-f523-a835-2664d1071eba	9261	Cankova
00050000-55e6-f523-0920-7442ea8bd34a	3000	Celje 
00050000-55e6-f523-30c1-261c5484c490	3001	Celje - poštni predali
00050000-55e6-f523-42e5-dc170bea48ae	4207	Cerklje na Gorenjskem
00050000-55e6-f523-c0b6-d53c5e00f288	8263	Cerklje ob Krki
00050000-55e6-f523-c7f7-682c60726a5f	1380	Cerknica
00050000-55e6-f523-efad-80733f65db00	5282	Cerkno
00050000-55e6-f523-c02b-c10a407cc003	2236	Cerkvenjak
00050000-55e6-f523-3b3f-d6f927e4f5f3	2215	Ceršak
00050000-55e6-f523-c2ce-f4ec825244a2	2326	Cirkovce
00050000-55e6-f523-12e1-f48b5c5a42f7	2282	Cirkulane
00050000-55e6-f523-9de4-558f5b9f5ff0	5273	Col
00050000-55e6-f523-ffd8-5e0ee983a55c	8251	Čatež ob Savi
00050000-55e6-f523-1249-f38b8a46ea30	1413	Čemšenik
00050000-55e6-f523-bd41-649dff4a68db	5253	Čepovan
00050000-55e6-f523-c931-fa89447ee41b	9232	Črenšovci
00050000-55e6-f523-735a-ad2e83ee66cb	2393	Črna na Koroškem
00050000-55e6-f523-a2bb-a45d355378d9	6275	Črni Kal
00050000-55e6-f523-f0b9-d75cd5eef944	5274	Črni Vrh nad Idrijo
00050000-55e6-f523-0636-a8a130c43f45	5262	Črniče
00050000-55e6-f523-1cb9-561bff3f8e04	8340	Črnomelj
00050000-55e6-f523-00c6-f36507d83abb	6271	Dekani
00050000-55e6-f523-9645-d98dea50776d	5210	Deskle
00050000-55e6-f523-ad0d-dc5f65c2b861	2253	Destrnik
00050000-55e6-f523-615b-2bfb44d46c65	6215	Divača
00050000-55e6-f523-4d3d-bf993721b0ef	1233	Dob
00050000-55e6-f523-63cc-3904d9105529	3224	Dobje pri Planini
00050000-55e6-f523-05f6-5be3675fe49f	8257	Dobova
00050000-55e6-f523-a957-78799acb4686	1423	Dobovec
00050000-55e6-f523-0292-d093f1f75465	5263	Dobravlje
00050000-55e6-f523-01a3-fe3c0b0d6323	3204	Dobrna
00050000-55e6-f523-6e26-f269280fd173	8211	Dobrnič
00050000-55e6-f523-93aa-dea067334437	1356	Dobrova
00050000-55e6-f523-f915-e1d78ddd3e8b	9223	Dobrovnik/Dobronak 
00050000-55e6-f523-b849-396f93e38c8d	5212	Dobrovo v Brdih
00050000-55e6-f523-5b82-9b68601cc018	1431	Dol pri Hrastniku
00050000-55e6-f523-2d7b-34cbae5c1ee2	1262	Dol pri Ljubljani
00050000-55e6-f523-bfe2-0413e49f60f1	1273	Dole pri Litiji
00050000-55e6-f523-9b41-fc24d11ca94e	1331	Dolenja vas
00050000-55e6-f523-4e42-18eb9cd5e2be	8350	Dolenjske Toplice
00050000-55e6-f523-63e6-982615fc1374	1230	Domžale
00050000-55e6-f523-95f5-6b10aa752730	2252	Dornava
00050000-55e6-f523-e2ed-3ad0d95583d7	5294	Dornberk
00050000-55e6-f523-c869-8fcd5584a764	1319	Draga
00050000-55e6-f523-c7e6-9cb0fb68824f	8343	Dragatuš
00050000-55e6-f523-15f3-a7166e181766	3222	Dramlje
00050000-55e6-f523-f4cf-0c9cc48a4bfb	2370	Dravograd
00050000-55e6-f523-9421-4d507240e63d	4203	Duplje
00050000-55e6-f523-ab02-c44bc0ffb860	6221	Dutovlje
00050000-55e6-f523-01f9-96357f7352da	8361	Dvor
00050000-55e6-f523-f590-f06f75d90b22	2343	Fala
00050000-55e6-f523-a550-139faf2131ca	9208	Fokovci
00050000-55e6-f523-7b64-794468649cab	2313	Fram
00050000-55e6-f523-1511-72e1141de3e3	3213	Frankolovo
00050000-55e6-f523-31d0-2b297fe6fe09	1274	Gabrovka
00050000-55e6-f523-d265-3b1e385ed134	8254	Globoko
00050000-55e6-f523-7c94-06c5651bd8db	5275	Godovič
00050000-55e6-f523-7bf6-e49085b75cd8	4204	Golnik
00050000-55e6-f523-acc8-1612eb3582db	3303	Gomilsko
00050000-55e6-f523-0753-02247991c7bd	4224	Gorenja vas
00050000-55e6-f523-a016-a7a8785001d0	3263	Gorica pri Slivnici
00050000-55e6-f523-5a05-9fa5ef2c4574	2272	Gorišnica
00050000-55e6-f523-4809-5dc42a664a4b	9250	Gornja Radgona
00050000-55e6-f523-3447-5bde7c2a4514	3342	Gornji Grad
00050000-55e6-f523-5aa5-b93444d2ac5a	4282	Gozd Martuljek
00050000-55e6-f523-bcb2-b7517a5f4071	6272	Gračišče
00050000-55e6-f523-6206-7a7013fa8708	9264	Grad
00050000-55e6-f523-4fae-1371d8898aa2	8332	Gradac
00050000-55e6-f523-4fb8-5b71fb9d953f	1384	Grahovo
00050000-55e6-f523-0335-680b816dafaf	5242	Grahovo ob Bači
00050000-55e6-f523-9c31-75c138427b35	5251	Grgar
00050000-55e6-f523-b2a4-6b240f91d86a	3302	Griže
00050000-55e6-f523-c5cb-1f1eb638dad2	3231	Grobelno
00050000-55e6-f523-34da-c8e299a91e0c	1290	Grosuplje
00050000-55e6-f523-69f2-6fadea6a9062	2288	Hajdina
00050000-55e6-f523-28f2-8611c7845b6c	8362	Hinje
00050000-55e6-f523-b2c3-fd29a7013622	2311	Hoče
00050000-55e6-f523-8f19-8b5030841812	9205	Hodoš/Hodos
00050000-55e6-f523-5b1e-6432c06b4db5	1354	Horjul
00050000-55e6-f523-eede-6089072762aa	1372	Hotedršica
00050000-55e6-f523-c71e-fe08fe3ca82d	1430	Hrastnik
00050000-55e6-f523-aaa4-f02e4f7eb26a	6225	Hruševje
00050000-55e6-f523-0fb1-067502ea922e	4276	Hrušica
00050000-55e6-f523-e305-cb2b55f99703	5280	Idrija
00050000-55e6-f523-2601-dcb193ea0011	1292	Ig
00050000-55e6-f523-e71b-a6ac01eea537	6250	Ilirska Bistrica
00050000-55e6-f523-378c-6b4fb590c56a	6251	Ilirska Bistrica-Trnovo
00050000-55e6-f523-ba69-62306b012656	1295	Ivančna Gorica
00050000-55e6-f523-dd97-6685b8b2680a	2259	Ivanjkovci
00050000-55e6-f523-e2a2-704e1ce8cf40	1411	Izlake
00050000-55e6-f523-71a7-24733542873e	6310	Izola/Isola
00050000-55e6-f523-d0ac-c9054d3ef7d8	2222	Jakobski Dol
00050000-55e6-f523-06a5-b806c5aa126a	2221	Jarenina
00050000-55e6-f523-0542-056206a3485c	6254	Jelšane
00050000-55e6-f523-8d86-9f100f30e516	4270	Jesenice
00050000-55e6-f523-806b-100934bb2581	8261	Jesenice na Dolenjskem
00050000-55e6-f523-7be6-17c2399b96ce	3273	Jurklošter
00050000-55e6-f523-b4be-8babebfa31bd	2223	Jurovski Dol
00050000-55e6-f523-f99a-574c4f9d1b17	2256	Juršinci
00050000-55e6-f523-bbf4-2f6682037224	5214	Kal nad Kanalom
00050000-55e6-f523-859c-7e28b4e93ac1	3233	Kalobje
00050000-55e6-f523-0afe-588e996b47ef	4246	Kamna Gorica
00050000-55e6-f523-10a2-82bb27588fd5	2351	Kamnica
00050000-55e6-f523-6f85-1ec974b894e6	1241	Kamnik
00050000-55e6-f523-df9d-4f80c45da8b0	5213	Kanal
00050000-55e6-f523-4387-615eefbc1354	8258	Kapele
00050000-55e6-f523-18cb-cfa165df23d7	2362	Kapla
00050000-55e6-f523-5be2-b2a87685e99f	2325	Kidričevo
00050000-55e6-f523-d2e9-595059899c63	1412	Kisovec
00050000-55e6-f523-83bd-94b100cacd86	6253	Knežak
00050000-55e6-f523-52bf-8fcfbda0fc40	5222	Kobarid
00050000-55e6-f523-0e90-527b5ef4e908	9227	Kobilje
00050000-55e6-f523-4087-521a684bd317	1330	Kočevje
00050000-55e6-f523-36ef-da6e95d69fb6	1338	Kočevska Reka
00050000-55e6-f523-ec7c-d7477849223e	2276	Kog
00050000-55e6-f523-4dde-4666755f4521	5211	Kojsko
00050000-55e6-f523-ceba-43fee30da0e7	6223	Komen
00050000-55e6-f523-fba5-7b4c1a313b2f	1218	Komenda
00050000-55e6-f523-6d1c-9834a155b304	6000	Koper/Capodistria 
00050000-55e6-f523-53a5-3a70428ae179	6001	Koper/Capodistria - poštni predali
00050000-55e6-f523-3af7-fbb5243b34e1	8282	Koprivnica
00050000-55e6-f523-9a0d-391d8433f562	5296	Kostanjevica na Krasu
00050000-55e6-f523-9530-2e143fa3612c	8311	Kostanjevica na Krki
00050000-55e6-f523-0500-7f920a3afb79	1336	Kostel
00050000-55e6-f523-58ab-30700afce1a3	6256	Košana
00050000-55e6-f523-a496-7b64cc2a675c	2394	Kotlje
00050000-55e6-f523-8323-703257f43971	6240	Kozina
00050000-55e6-f523-35b4-22719413f1e7	3260	Kozje
00050000-55e6-f523-55aa-01816b8725db	4000	Kranj 
00050000-55e6-f523-260a-7bddf82a9d69	4001	Kranj - poštni predali
00050000-55e6-f523-72c9-fd53e4170d7b	4280	Kranjska Gora
00050000-55e6-f523-79de-da3b817490ef	1281	Kresnice
00050000-55e6-f523-15c3-fd99197aae10	4294	Križe
00050000-55e6-f523-b9ab-ee30a5ab009a	9206	Križevci
00050000-55e6-f523-7e86-5cf72cc7f74c	9242	Križevci pri Ljutomeru
00050000-55e6-f523-02af-67378b77da43	1301	Krka
00050000-55e6-f523-5e62-37572982bc16	8296	Krmelj
00050000-55e6-f523-f9ab-791f60919c60	4245	Kropa
00050000-55e6-f523-10ea-514c35e11c7f	8262	Krška vas
00050000-55e6-f523-dcfa-642fefbaff0e	8270	Krško
00050000-55e6-f523-7fed-4a387bf77769	9263	Kuzma
00050000-55e6-f523-65c3-3afe80d65ef7	2318	Laporje
00050000-55e6-f523-2e2f-189429868f0e	3270	Laško
00050000-55e6-f523-8cd1-cae94c27ac9d	1219	Laze v Tuhinju
00050000-55e6-f523-a826-1cbe044a103b	2230	Lenart v Slovenskih goricah
00050000-55e6-f523-a6fa-0e2f67f914f0	9220	Lendava/Lendva
00050000-55e6-f523-fe1a-961c54904b88	4248	Lesce
00050000-55e6-f523-e155-8f4e7b58db88	3261	Lesično
00050000-55e6-f523-0e48-4222cda2fd1d	8273	Leskovec pri Krškem
00050000-55e6-f523-74a1-4c7ecb1c399e	2372	Libeliče
00050000-55e6-f523-6d44-cc4624fb101a	2341	Limbuš
00050000-55e6-f523-ca64-1c23aae9f43c	1270	Litija
00050000-55e6-f523-4b46-1e3284e00d8a	3202	Ljubečna
00050000-55e6-f523-b520-3ae5d0473d14	1000	Ljubljana 
00050000-55e6-f523-45a8-73fe8aed8e86	1001	Ljubljana - poštni predali
00050000-55e6-f523-a37c-a2d4d3ac9f82	1231	Ljubljana - Črnuče
00050000-55e6-f523-2e03-9776ce68039f	1261	Ljubljana - Dobrunje
00050000-55e6-f523-b391-93aea60f43aa	1260	Ljubljana - Polje
00050000-55e6-f523-601d-fec4afede413	1210	Ljubljana - Šentvid
00050000-55e6-f523-c9fb-bcd7c174bde0	1211	Ljubljana - Šmartno
00050000-55e6-f523-805d-a84823e04067	3333	Ljubno ob Savinji
00050000-55e6-f523-b152-5d340a0dfb47	9240	Ljutomer
00050000-55e6-f523-7cb5-d12758448407	3215	Loče
00050000-55e6-f523-cc57-303d43c406c9	5231	Log pod Mangartom
00050000-55e6-f523-5780-67cfed06a23e	1358	Log pri Brezovici
00050000-55e6-f523-5a28-886974043f95	1370	Logatec
00050000-55e6-f523-e86e-0510b83537f7	1371	Logatec
00050000-55e6-f523-ccb3-c2c97074d7d7	1434	Loka pri Zidanem Mostu
00050000-55e6-f523-67b6-d7ce45d23ade	3223	Loka pri Žusmu
00050000-55e6-f523-cf01-b65e58cf2ec4	6219	Lokev
00050000-55e6-f523-44e8-2de3c8e57060	1318	Loški Potok
00050000-55e6-f523-41b9-0259545c67b3	2324	Lovrenc na Dravskem polju
00050000-55e6-f523-5c6f-8af193e556bc	2344	Lovrenc na Pohorju
00050000-55e6-f523-b33c-0bb575616f35	3334	Luče
00050000-55e6-f523-4f56-636317410c0f	1225	Lukovica
00050000-55e6-f523-06c9-abb9908e8aa6	9202	Mačkovci
00050000-55e6-f523-c8d6-fdc9f779a778	2322	Majšperk
00050000-55e6-f523-4ca3-619657a4557f	2321	Makole
00050000-55e6-f523-0167-2a85cca6de88	9243	Mala Nedelja
00050000-55e6-f523-1a81-04a70211fc68	2229	Malečnik
00050000-55e6-f523-d110-de8c74a0d3fb	6273	Marezige
00050000-55e6-f523-589c-88d9f256df2e	2000	Maribor 
00050000-55e6-f523-1692-b2bdfa3cecef	2001	Maribor - poštni predali
00050000-55e6-f523-57d1-3b498df79a9f	2206	Marjeta na Dravskem polju
00050000-55e6-f523-5f34-380bf0104c96	2281	Markovci
00050000-55e6-f523-aefa-7e10606a12b3	9221	Martjanci
00050000-55e6-f523-427e-b7eee19d2c21	6242	Materija
00050000-55e6-f523-899e-dd2089b46edf	4211	Mavčiče
00050000-55e6-f523-82f9-d30da64b8a4d	1215	Medvode
00050000-55e6-f523-45a0-6fd8ee7c4a12	1234	Mengeš
00050000-55e6-f523-5739-47a571e3fa3b	8330	Metlika
00050000-55e6-f523-db61-2c6fe9ebd553	2392	Mežica
00050000-55e6-f523-6f63-0abc5965c6a4	2204	Miklavž na Dravskem polju
00050000-55e6-f523-286d-727545e04547	2275	Miklavž pri Ormožu
00050000-55e6-f523-2d91-73a59efc1e19	5291	Miren
00050000-55e6-f523-b033-bc55476938f5	8233	Mirna
00050000-55e6-f523-4828-cfb9b8378e00	8216	Mirna Peč
00050000-55e6-f523-c85c-ee7e509e652d	2382	Mislinja
00050000-55e6-f523-ade4-e12e6f9e2b4a	4281	Mojstrana
00050000-55e6-f523-5857-c60add969439	8230	Mokronog
00050000-55e6-f523-1667-c50f3657533e	1251	Moravče
00050000-55e6-f523-ce61-a976b7d87362	9226	Moravske Toplice
00050000-55e6-f523-a76e-9dbeedc9ccc6	5216	Most na Soči
00050000-55e6-f523-dff7-a9684519f5f7	1221	Motnik
00050000-55e6-f523-a28a-b2a26c14b016	3330	Mozirje
00050000-55e6-f523-6fee-afac99be8fab	9000	Murska Sobota 
00050000-55e6-f523-4d17-fecb6107a072	9001	Murska Sobota - poštni predali
00050000-55e6-f523-5cc5-2b627daa84a4	2366	Muta
00050000-55e6-f523-306d-9b366f107e2e	4202	Naklo
00050000-55e6-f523-28d2-16681b763784	3331	Nazarje
00050000-55e6-f523-7e01-f1744ed055c0	1357	Notranje Gorice
00050000-55e6-f523-36bb-5a5b31a868df	3203	Nova Cerkev
00050000-55e6-f523-b076-c55f9c4ecc76	5000	Nova Gorica 
00050000-55e6-f523-eb41-37026ddbfd52	5001	Nova Gorica - poštni predali
00050000-55e6-f523-7ef9-1350794ecf4b	1385	Nova vas
00050000-55e6-f523-fb0c-80d0f4c1912a	8000	Novo mesto
00050000-55e6-f523-9ab9-38129511b921	8001	Novo mesto - poštni predali
00050000-55e6-f523-5727-dce9a9d88d0d	6243	Obrov
00050000-55e6-f523-872a-ed76a42d3632	9233	Odranci
00050000-55e6-f523-0854-137ae16f02f4	2317	Oplotnica
00050000-55e6-f523-16cb-707299d15675	2312	Orehova vas
00050000-55e6-f523-c84f-e728d8ae975b	2270	Ormož
00050000-55e6-f523-44be-1cdae00dbd63	1316	Ortnek
00050000-55e6-f523-20ce-d781c9e7a545	1337	Osilnica
00050000-55e6-f523-3eab-5015b9036bd6	8222	Otočec
00050000-55e6-f523-9856-fe0f8c63db6e	2361	Ožbalt
00050000-55e6-f523-58de-76748b215de2	2231	Pernica
00050000-55e6-f523-0b4d-15d8ef705afb	2211	Pesnica pri Mariboru
00050000-55e6-f523-3609-8af00b433662	9203	Petrovci
00050000-55e6-f523-40e5-f64b0fdd1a13	3301	Petrovče
00050000-55e6-f523-921c-05bc2fb83e3b	6330	Piran/Pirano
00050000-55e6-f523-bc5b-d7554d73cec3	8255	Pišece
00050000-55e6-f523-6739-b06d6908aeb4	6257	Pivka
00050000-55e6-f523-7322-d2716f74787c	6232	Planina
00050000-55e6-f523-929a-ebdd1f569d37	3225	Planina pri Sevnici
00050000-55e6-f523-3153-b115b654c2c2	6276	Pobegi
00050000-55e6-f523-159f-b1f39d5bd602	8312	Podbočje
00050000-55e6-f523-b6f9-7122328114fe	5243	Podbrdo
00050000-55e6-f523-097f-b4a437473842	3254	Podčetrtek
00050000-55e6-f523-4567-e1e0d8a7adfb	2273	Podgorci
00050000-55e6-f523-93c2-b96a3f2ef91f	6216	Podgorje
00050000-55e6-f523-d1d6-72034126a97c	2381	Podgorje pri Slovenj Gradcu
00050000-55e6-f523-ab7a-9d219b675477	6244	Podgrad
00050000-55e6-f523-98b3-47ae56f6a54a	1414	Podkum
00050000-55e6-f523-2197-8d6997342ac5	2286	Podlehnik
00050000-55e6-f523-7a3c-ceec65033823	5272	Podnanos
00050000-55e6-f523-2752-c120e042bb3b	4244	Podnart
00050000-55e6-f523-9e93-76c215c316e6	3241	Podplat
00050000-55e6-f523-2501-16b35eef4437	3257	Podsreda
00050000-55e6-f523-9449-80b9f771722d	2363	Podvelka
00050000-55e6-f523-a94b-cd3de448dab9	2208	Pohorje
00050000-55e6-f523-55b7-db3d4ca9bcfe	2257	Polenšak
00050000-55e6-f523-2946-c082122f4d0e	1355	Polhov Gradec
00050000-55e6-f523-3ef0-bf84cb7b1f98	4223	Poljane nad Škofjo Loko
00050000-55e6-f523-19ba-fed65220e540	2319	Poljčane
00050000-55e6-f523-b176-3ffc84e271c0	1272	Polšnik
00050000-55e6-f523-b968-e28579de3c35	3313	Polzela
00050000-55e6-f523-8076-b2287566574f	3232	Ponikva
00050000-55e6-f523-a075-98eee1ad1416	6320	Portorož/Portorose
00050000-55e6-f523-c99d-525963618126	6230	Postojna
00050000-55e6-f523-82e4-14c4f040d30d	2331	Pragersko
00050000-55e6-f523-799c-076c8896680c	3312	Prebold
00050000-55e6-f523-5547-8dfcd5847fb5	4205	Preddvor
00050000-55e6-f523-7f09-443470da82fe	6255	Prem
00050000-55e6-f523-458b-913c8b3a4979	1352	Preserje
00050000-55e6-f523-d277-8a4cf919e922	6258	Prestranek
00050000-55e6-f523-3ea6-3b77db880cf0	2391	Prevalje
00050000-55e6-f523-86df-c82581b47d66	3262	Prevorje
00050000-55e6-f523-4b94-5d5f418cf171	1276	Primskovo 
00050000-55e6-f523-617a-ac91347dba7a	3253	Pristava pri Mestinju
00050000-55e6-f523-d1f4-4eb5217568c6	9207	Prosenjakovci/Partosfalva
00050000-55e6-f523-ba9c-051b7de94787	5297	Prvačina
00050000-55e6-f523-4e0d-65a73218c043	2250	Ptuj
00050000-55e6-f523-ce5b-f172909d774b	2323	Ptujska Gora
00050000-55e6-f523-a388-78c14fa6c32b	9201	Puconci
00050000-55e6-f523-576b-e9fa39e7a6f3	2327	Rače
00050000-55e6-f523-661e-8162f95313eb	1433	Radeče
00050000-55e6-f523-ff62-7f10eb3fa583	9252	Radenci
00050000-55e6-f523-398d-bd424af82d9d	2360	Radlje ob Dravi
00050000-55e6-f523-c9e6-5bdf52506ad1	1235	Radomlje
00050000-55e6-f523-1134-e05f341c9cdb	4240	Radovljica
00050000-55e6-f523-9b2b-94592d77d854	8274	Raka
00050000-55e6-f523-858c-d91e6cb1604a	1381	Rakek
00050000-55e6-f523-48f0-a4409e0dda74	4283	Rateče - Planica
00050000-55e6-f523-2bd5-40a2680462f9	2390	Ravne na Koroškem
00050000-55e6-f523-fe24-2706e321b5df	9246	Razkrižje
00050000-55e6-f523-1672-ecbc277b1a5b	3332	Rečica ob Savinji
00050000-55e6-f523-fbd5-5db4aa6d4552	5292	Renče
00050000-55e6-f523-7f88-d0e6f4975ebe	1310	Ribnica
00050000-55e6-f523-a240-beb64a5dd123	2364	Ribnica na Pohorju
00050000-55e6-f523-5b9f-cb6186d2aebc	3272	Rimske Toplice
00050000-55e6-f523-ef22-dbc8e47ae0b7	1314	Rob
00050000-55e6-f523-a0f3-974622ebeee7	5215	Ročinj
00050000-55e6-f523-44ce-c6fad5ec1a4f	3250	Rogaška Slatina
00050000-55e6-f523-40c7-4c75d9fb64ff	9262	Rogašovci
00050000-55e6-f523-ab93-f8147c70f0a9	3252	Rogatec
00050000-55e6-f523-2717-34fba2e62f4d	1373	Rovte
00050000-55e6-f523-1a61-903ac8274169	2342	Ruše
00050000-55e6-f523-4403-49f84e2554a4	1282	Sava
00050000-55e6-f523-b609-3841e528adea	6333	Sečovlje/Sicciole
00050000-55e6-f523-edc6-59510c450365	4227	Selca
00050000-55e6-f523-2825-4c31d1c716ed	2352	Selnica ob Dravi
00050000-55e6-f523-49e3-b65ede24efa4	8333	Semič
00050000-55e6-f523-8566-76377215a339	8281	Senovo
00050000-55e6-f523-b04f-bc0228f89972	6224	Senožeče
00050000-55e6-f523-ce21-d3a950e9f083	8290	Sevnica
00050000-55e6-f523-c458-4b93e2011536	6210	Sežana
00050000-55e6-f523-a71d-e057be21604d	2214	Sladki Vrh
00050000-55e6-f523-0c97-ab24eebe1226	5283	Slap ob Idrijci
00050000-55e6-f523-ae18-4cd52924e876	2380	Slovenj Gradec
00050000-55e6-f523-59f6-bc1f5caa2c39	2310	Slovenska Bistrica
00050000-55e6-f523-3a74-0c803c786377	3210	Slovenske Konjice
00050000-55e6-f523-648c-60d776c0a172	1216	Smlednik
00050000-55e6-f523-a3d5-3a46957db7fd	5232	Soča
00050000-55e6-f523-8e2f-4e0368ae64ee	1317	Sodražica
00050000-55e6-f523-adef-e8347021c2ca	3335	Solčava
00050000-55e6-f523-72ff-5a7f6c9ac2eb	5250	Solkan
00050000-55e6-f523-f3e9-599c28c5e0cb	4229	Sorica
00050000-55e6-f523-cd0a-fc6637fed559	4225	Sovodenj
00050000-55e6-f523-e68a-3752cc237455	5281	Spodnja Idrija
00050000-55e6-f523-96ff-b741e4383ffb	2241	Spodnji Duplek
00050000-55e6-f523-573e-26c826cfac63	9245	Spodnji Ivanjci
00050000-55e6-f523-2db0-eee53b182d12	2277	Središče ob Dravi
00050000-55e6-f523-0c73-3bde158d62be	4267	Srednja vas v Bohinju
00050000-55e6-f523-a232-29a5257fe1f8	8256	Sromlje 
00050000-55e6-f523-b87d-a86cc14ee871	5224	Srpenica
00050000-55e6-f523-0b55-9d04d887c9a8	1242	Stahovica
00050000-55e6-f523-b3ca-03ff8a611bdf	1332	Stara Cerkev
00050000-55e6-f523-dd01-4cf12f138cd8	8342	Stari trg ob Kolpi
00050000-55e6-f523-490d-f902519c844b	1386	Stari trg pri Ložu
00050000-55e6-f523-13f5-06e47440c3ae	2205	Starše
00050000-55e6-f523-8a64-a8d6b1e29444	2289	Stoperce
00050000-55e6-f523-1e86-6ba46525c482	8322	Stopiče
00050000-55e6-f523-c6c5-c60bfff72924	3206	Stranice
00050000-55e6-f523-06d8-9383142d124e	8351	Straža
00050000-55e6-f523-485f-8207b1ccffa3	1313	Struge
00050000-55e6-f523-2a96-c024500e0eea	8293	Studenec
00050000-55e6-f523-19df-d31165ca81e3	8331	Suhor
00050000-55e6-f523-b212-4f1c28153e8b	2233	Sv. Ana v Slovenskih goricah
00050000-55e6-f523-8b5d-90e014ddb68d	2235	Sv. Trojica v Slovenskih goricah
00050000-55e6-f523-8011-233b9ce86901	2353	Sveti Duh na Ostrem Vrhu
00050000-55e6-f523-fc44-7f3d0a38ec20	9244	Sveti Jurij ob Ščavnici
00050000-55e6-f523-b73a-c98da3d03a23	3264	Sveti Štefan
00050000-55e6-f523-a985-2996453ddca1	2258	Sveti Tomaž
00050000-55e6-f523-ea2e-8007cf8befd2	9204	Šalovci
00050000-55e6-f523-6587-93423e7013f8	5261	Šempas
00050000-55e6-f523-ae60-82c4fab1ac27	5290	Šempeter pri Gorici
00050000-55e6-f523-6455-a4001df9bec6	3311	Šempeter v Savinjski dolini
00050000-55e6-f523-5d8e-77061932a8ae	4208	Šenčur
00050000-55e6-f523-9939-ab496ec6c9db	2212	Šentilj v Slovenskih goricah
00050000-55e6-f523-bd32-6ece2514374a	8297	Šentjanž
00050000-55e6-f523-208c-e2edfe4995ce	2373	Šentjanž pri Dravogradu
00050000-55e6-f523-a5c4-02d515437096	8310	Šentjernej
00050000-55e6-f523-6446-1fcfd1fd07c3	3230	Šentjur
00050000-55e6-f523-f94c-ed3c071be207	3271	Šentrupert
00050000-55e6-f523-79d7-c2b6ba343f01	8232	Šentrupert
00050000-55e6-f523-5482-4f4b874e43b9	1296	Šentvid pri Stični
00050000-55e6-f523-276c-4c77e52c49ae	8275	Škocjan
00050000-55e6-f523-2056-a7557e313944	6281	Škofije
00050000-55e6-f523-8311-d8f0b709289b	4220	Škofja Loka
00050000-55e6-f523-39fc-2c850ef30c55	3211	Škofja vas
00050000-55e6-f523-6926-2780a271a767	1291	Škofljica
00050000-55e6-f523-55e4-74bc5e03a331	6274	Šmarje
00050000-55e6-f523-58d1-5be9a5af986b	1293	Šmarje - Sap
00050000-55e6-f523-d318-8d3d40fe6da8	3240	Šmarje pri Jelšah
00050000-55e6-f523-9e80-4598462c7aeb	8220	Šmarješke Toplice
00050000-55e6-f523-7115-04284af57704	2315	Šmartno na Pohorju
00050000-55e6-f523-ebef-52451ce255cd	3341	Šmartno ob Dreti
00050000-55e6-f523-e4bd-adfbf0499b89	3327	Šmartno ob Paki
00050000-55e6-f523-1389-2a734b9d3a79	1275	Šmartno pri Litiji
00050000-55e6-f523-c8eb-6e1e1632fc36	2383	Šmartno pri Slovenj Gradcu
00050000-55e6-f523-1e6f-1dbc88b2ebb5	3201	Šmartno v Rožni dolini
00050000-55e6-f523-f633-4612ca3d3474	3325	Šoštanj
00050000-55e6-f523-2b63-bf3170042e11	6222	Štanjel
00050000-55e6-f523-6e27-ea958be71cfb	3220	Štore
00050000-55e6-f523-23ba-23d663a5d80e	3304	Tabor
00050000-55e6-f523-dfb1-25b64ffa1d73	3221	Teharje
00050000-55e6-f523-86cf-9a4a977514c8	9251	Tišina
00050000-55e6-f523-1b79-f7261de95b83	5220	Tolmin
00050000-55e6-f523-1d1c-9b20cfc0d108	3326	Topolšica
00050000-55e6-f523-8c13-a9320238f939	2371	Trbonje
00050000-55e6-f523-713f-b64a47660e8c	1420	Trbovlje
00050000-55e6-f523-0f6e-a4cd41463f4a	8231	Trebelno 
00050000-55e6-f523-c4fe-71cc9989ded6	8210	Trebnje
00050000-55e6-f523-d4ea-7e6cbb4a4218	5252	Trnovo pri Gorici
00050000-55e6-f523-f11f-3545b320f59a	2254	Trnovska vas
00050000-55e6-f523-f441-3d1b4110e05d	1222	Trojane
00050000-55e6-f523-10db-4b3d35939687	1236	Trzin
00050000-55e6-f523-0625-959067ab7d75	4290	Tržič
00050000-55e6-f523-2976-c9653c0577f2	8295	Tržišče
00050000-55e6-f523-b2a5-d859f5ef69ad	1311	Turjak
00050000-55e6-f523-fe3c-55b6633add73	9224	Turnišče
00050000-55e6-f523-56f5-e45f8d5b5d01	8323	Uršna sela
00050000-55e6-f523-a633-0be444f61e6c	1252	Vače
00050000-55e6-f523-6daf-71a747442b22	3320	Velenje 
00050000-55e6-f523-5e92-ab94f69ef642	3322	Velenje - poštni predali
00050000-55e6-f523-0226-d686a4da419b	8212	Velika Loka
00050000-55e6-f523-8baf-1319343e2171	2274	Velika Nedelja
00050000-55e6-f523-0b16-69887547825b	9225	Velika Polana
00050000-55e6-f523-c314-cdb5fca63ae5	1315	Velike Lašče
00050000-55e6-f523-820b-f51a107a3eeb	8213	Veliki Gaber
00050000-55e6-f523-31be-5d88c38c3f40	9241	Veržej
00050000-55e6-f523-8af1-aa5407ec81e2	1312	Videm - Dobrepolje
00050000-55e6-f523-7ef8-31547d53846d	2284	Videm pri Ptuju
00050000-55e6-f523-5a27-f8b543d75942	8344	Vinica
00050000-55e6-f523-30f8-42f0eb8bed94	5271	Vipava
00050000-55e6-f523-f87f-4e73d1403370	4212	Visoko
00050000-55e6-f523-af23-970bb7db3bdc	1294	Višnja Gora
00050000-55e6-f523-627e-9c660cad67a0	3205	Vitanje
00050000-55e6-f523-996f-f7b9895a6133	2255	Vitomarci
00050000-55e6-f523-b6a2-40546d9b79f6	1217	Vodice
00050000-55e6-f523-c883-c77d058b3967	3212	Vojnik\t
00050000-55e6-f523-c4cf-fd4685084d0a	5293	Volčja Draga
00050000-55e6-f523-538c-b1b39e6d8087	2232	Voličina
00050000-55e6-f523-6f3c-abf81ff01469	3305	Vransko
00050000-55e6-f523-89ec-86a801d2acaa	6217	Vremski Britof
00050000-55e6-f523-5371-56c0eefcf2cb	1360	Vrhnika
00050000-55e6-f523-1c7f-17d34ddf579f	2365	Vuhred
00050000-55e6-f523-749d-886648cb441b	2367	Vuzenica
00050000-55e6-f523-af20-137523389381	8292	Zabukovje 
00050000-55e6-f523-60c5-f19cf3735794	1410	Zagorje ob Savi
00050000-55e6-f523-12b5-20c32f3f20d6	1303	Zagradec
00050000-55e6-f523-edad-d03cf348d3a3	2283	Zavrč
00050000-55e6-f523-a3fb-588c968e5a7b	8272	Zdole 
00050000-55e6-f523-6cd9-5e19b1bc06d4	4201	Zgornja Besnica
00050000-55e6-f523-7064-c2f41ce7cc27	2242	Zgornja Korena
00050000-55e6-f523-9cef-b12dc0de16d8	2201	Zgornja Kungota
00050000-55e6-f523-8cd8-54964ec0729a	2316	Zgornja Ložnica
00050000-55e6-f523-24e3-ce4ffb1c65b1	2314	Zgornja Polskava
00050000-55e6-f523-6cf0-7c0397a0000b	2213	Zgornja Velka
00050000-55e6-f523-c8ad-de645542027c	4247	Zgornje Gorje
00050000-55e6-f523-2616-50d334e10b3c	4206	Zgornje Jezersko
00050000-55e6-f523-18bd-23aab1260eb4	2285	Zgornji Leskovec
00050000-55e6-f523-b9e0-710aa410c711	1432	Zidani Most
00050000-55e6-f523-cc5c-26dafc8bd212	3214	Zreče
00050000-55e6-f523-5162-93cbc9d43b35	4209	Žabnica
00050000-55e6-f523-668d-73303f6270bd	3310	Žalec
00050000-55e6-f523-2918-64875848effa	4228	Železniki
00050000-55e6-f523-8963-fcfb9237d9f1	2287	Žetale
00050000-55e6-f523-0c15-55532bd6f033	4226	Žiri
00050000-55e6-f523-f85f-e2050d460fba	4274	Žirovnica
00050000-55e6-f523-c42c-b5ed981905d7	8360	Žužemberk
\.


--
-- TOC entry 2935 (class 0 OID 16879179)
-- Dependencies: 200
-- Data for Name: postavkaracuna; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkaracuna (id, racun_id) FROM stdin;
\.


--
-- TOC entry 2918 (class 0 OID 16878989)
-- Dependencies: 183
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
00060000-55e6-f525-d298-d5a1685efed0	00080000-55e6-f524-fc94-a0ca1bf6df2c	\N	00040000-55e6-f523-d880-cc58e1f91db0	Narodni dom	\N	Koroška 15	\N	9231	Beltinci	\N	f	t
00060000-55e6-f525-1427-ca173e91bef5	00080000-55e6-f524-fc94-a0ca1bf6df2c	\N	00040000-55e6-f523-d880-cc58e1f91db0		\N	Koroška 22	\N	9231	Beltinci	\N	f	f
00060000-55e6-f525-b482-77e977de0de2	00080000-55e6-f524-19aa-d81eb8fb3137	\N	00040000-55e6-f523-d880-cc58e1f91db0		\N	Rimska ploščad 7	\N	9231	Beltinci	\N	f	t
\.


--
-- TOC entry 2924 (class 0 OID 16879067)
-- Dependencies: 189
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id) FROM stdin;
\.


--
-- TOC entry 2937 (class 0 OID 16879191)
-- Dependencies: 202
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 2961 (class 0 OID 16879543)
-- Dependencies: 226
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, koproducent_id, odstotekfinanciranja, delez, maticnikop, kpe, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 2962 (class 0 OID 16879553)
-- Dependencies: 227
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, sifra, status) FROM stdin;
00190000-55e6-f525-c536-f94c9f1e2ca0	00080000-55e6-f524-6e01-0d2a45d9fa5d	0987	AK
00190000-55e6-f525-d847-d2bc8f324df7	00080000-55e6-f524-19aa-d81eb8fb3137	0989	AK
00190000-55e6-f525-90f5-01b32a2d21e2	00080000-55e6-f524-0fb5-6923b438caf9	0986	AK
00190000-55e6-f525-94ba-3c907c20159b	00080000-55e6-f524-66d1-8431d0898f2b	0984	AK
00190000-55e6-f525-25b9-f3d3193368e4	00080000-55e6-f524-f496-4fb6d0bc1f21	0983	AK
00190000-55e6-f525-1448-1a09fba112ca	00080000-55e6-f524-9472-02488c19602a	0982	AK
00190000-55e6-f526-cd80-4bda6f46cbef	00080000-55e6-f526-6494-a6b18e606067	1001	AK
\.


--
-- TOC entry 2960 (class 0 OID 16879499)
-- Dependencies: 225
-- Data for Name: programdela; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programdela (id, sezona_id, sifra, naziv, zacetek, konec, zakljuceno, potrjenprogram, stpremier, stint, stfest, strazno, stizjem, stponprem, stponprej, stponprejvelikih, stponprejmalih, stponprejmalihkopr, stponprejsredkopr, stponprejvelikihkopr, stgostujo, vrps1, vrps1do, vrps1mat, vrps1gostovsz, stizvnekomerc, stizvprem, stizvponprem, stizvponpremdoma, stizvponpremzamejo, stizvponpremgost, stizvponpremkopr, stizvponpremint, stizvponpremkoprint, stizvponprej, stizvponprejdoma, stizvponprejzamejo, stizvponprejgost, stizvponprejkopr, stizvponprejint, stizvponprejkoprint, stizvgostuj, stizvostalihnek, stizvgostovanjslo, stizvgostovanjzam, stizvgostovanjint, stobisknekom, stobisknekommat, stobisknekomgostslo, stobisknekomgostzam, stobisknekomgostint, stobiskprem, stobiskponprem, stobiskponpremdoma, stobiskponpremkopr, stobiskponpremkoprint, stobiskponpremgost, stobiskponpremzamejo, stobiskponpremint, avgobiskprired, avgzaseddvoran, avgcenavstopnice, stprodvstopnic, stkoprodukcij, stkoprodukcijint, stkoprodukcijnvo, stzaposlenih, stzaposigralcev, avgstnastopovigr, sthonorarnih, sthonorarnihigr, sthonorarnihigrtujjz, sthonorarnihigrsamoz, sredstvaint, sredstvaavt, sredstvazaprosenoprem, sredstvazaprosenoponprem, sredstvazaprosenoponprej, sredstvazaprosenogostujo, sredstvazaprosenoint, sredstvazaprosenofest, sredstvazaprosenorazno, sredstvazaprosenoizjem, sredstvadrugijavniprem, sredstvadrugijavniponprem, sredstvadrugijavniponprej, sredstvadrugijavnigostujo, sredstvadrugijavniint, sredstvadrugijavnifest, sredstvadrugijavnirazno, sredstvadrugijavniizjem, sredstvadrugiviriprem, sredstvadrugiviriponprem, sredstvadrugiviriponprej, sredstvadrugivirigostujo, sredstvadrugiviriint, sredstvadrugivirifest, sredstvadrugivirirazno, sredstvadrugiviriizjem, sredstvaavtsamoz) FROM stdin;
00290000-55e6-f525-2a1f-5d5d17c5b7bf	\N	0001	Testni program dela	2016-02-01	2017-02-01	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 2963 (class 0 OID 16879561)
-- Dependencies: 228
-- Data for Name: programskaenotasklopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programskaenotasklopa (id, naslovpe, avtorpe, obsegpe, mesecpe, vrednostpe, programrazno_id) FROM stdin;
\.


--
-- TOC entry 2941 (class 0 OID 16879220)
-- Dependencies: 206
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, popa_id, naslov_id, sifra, naziv, jeprizorisce, seplanira, kapaciteta, opis) FROM stdin;
00220000-55e6-f524-d192-2b91f1bb6805	\N	\N	0001	Poskusna 1	f	t	8	Poskusna učilnica v prvem
00220000-55e6-f524-0f64-ec2d48c8e2f9	\N	\N	0002	Poskusna 3	f	f	34	Poskusna učilnica v tretjem
00220000-55e6-f524-0999-fae7677a509a	\N	\N	0003	Kazinska	t	t	84	Kazinska dvorana
00220000-55e6-f524-f0c3-8545c8756e79	\N	\N	0004	Mali oder	t	t	24	Mali oder 
00220000-55e6-f524-9037-790a7ed9ad25	\N	\N	0005	Komorni oder	t	t	15	Komorni oder
00220000-55e6-f524-7d24-affa213923b6	\N	\N	0006	Stara dvorana	t	t	96	Stara dvorana ali dvorana Franceta Prešerna
00220000-55e6-f524-fae0-5f3e063f0cd5	\N	\N	0007	Velika dvorana	t	t	160	Velika, glavna dvorana
\.


--
-- TOC entry 2933 (class 0 OID 16879164)
-- Dependencies: 198
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 2932 (class 0 OID 16879154)
-- Dependencies: 197
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 2953 (class 0 OID 16879352)
-- Dependencies: 218
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta, status) FROM stdin;
\.


--
-- TOC entry 2948 (class 0 OID 16879291)
-- Dependencies: 213
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 2907 (class 0 OID 16878862)
-- Dependencies: 172
-- Data for Name: revizije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY revizije (id, razred, objectid, upor, datum, tip, data) FROM stdin;
1	App\\Entity\\Popa	00080000-55e6-f526-6494-a6b18e606067	00010000-55e6-f524-8ec3-7baf5afefa07	2015-09-02 15:09:58	INS	a:0:{}
2	App\\Entity\\Option	00000000-55e6-f526-1230-0de9cebffec0	00010000-55e6-f524-8ec3-7baf5afefa07	2015-09-02 15:09:58	INS	a:0:{}
3	ProgramDela\\Entity\\ProdukcijskaHisa	00190000-55e6-f526-cd80-4bda6f46cbef	00010000-55e6-f524-8ec3-7baf5afefa07	2015-09-02 15:09:58	INS	a:0:{}
\.


--
-- TOC entry 2984 (class 0 OID 0)
-- Dependencies: 171
-- Name: revizije_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('revizije_id_seq', 3, true);


--
-- TOC entry 2942 (class 0 OID 16879233)
-- Dependencies: 207
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 2911 (class 0 OID 16878900)
-- Dependencies: 176
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-55e6-f523-28e7-b8a7653cf790	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-55e6-f523-9e73-1200d172532f	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-55e6-f523-a661-9b837573d3a9	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-55e6-f523-3a76-5cc343146a86	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-55e6-f523-d373-10baab725dc4	planer	Planer dogodkov v koledarju	t
00020000-55e6-f523-2899-f34ab90b0a77	kadrovska	Kadrovska služba	t
00020000-55e6-f523-de5a-b9441440d919	arhivar	Ažuriranje arhivalij	t
00020000-55e6-f523-4fef-124bb3d4bb6a	igralec	Igralec	t
00020000-55e6-f523-8bb2-26f3b9f8f323	prisotnost	Vnašalec prisotnosti, tudi za tiste izven uprizoritev	t
00020000-55e6-f524-75c7-1ac6b90426b0	vsadovoljenja	Vloga z vsemi posameznimi dovoljenji	t
\.


--
-- TOC entry 2909 (class 0 OID 16878884)
-- Dependencies: 174
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-55e6-f524-4b9e-a19ae472051a	00020000-55e6-f523-a661-9b837573d3a9
00010000-55e6-f524-8ec3-7baf5afefa07	00020000-55e6-f523-a661-9b837573d3a9
00010000-55e6-f525-3821-7a86cc3e65fa	00020000-55e6-f524-75c7-1ac6b90426b0
\.


--
-- TOC entry 2944 (class 0 OID 16879247)
-- Dependencies: 209
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 2936 (class 0 OID 16879185)
-- Dependencies: 201
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 2930 (class 0 OID 16879131)
-- Dependencies: 195
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, sifra, ime, zacetek, konec, aktivna) FROM stdin;
\.


--
-- TOC entry 2968 (class 0 OID 16879602)
-- Dependencies: 233
-- Data for Name: stevilcenje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenje (id, sifra, naziv, prefix, suffix, zacetek, dolzina, format, globalno, poletih) FROM stdin;
00230000-55e6-f523-2ac3-72bec810bd3e	pri	Privzeto številčenje po letih YYYY-N	\N	\N	1	1	%l-%n	f	t
00230000-55e6-f523-3ff9-e3b7e77263ec	123	Privzeto številčenje kratkih šifer	\N	\N	100	3	%n	f	f
00230000-55e6-f523-88aa-3c3164ab82ec	bcd	Globalno številčenje črtnih kod	\N	\N	1	9	%n	t	f
00230000-55e6-f523-02d7-51c5b5948f42	sif	Številčenje šifrant	\N	\N	1000	4	%n	t	f
00230000-55e6-f523-d017-baed79639b37	tmp	Globalno številčenje začasnih številk	tmp	\N	1000	5	%l%n	t	t
\.


--
-- TOC entry 2967 (class 0 OID 16879594)
-- Dependencies: 232
-- Data for Name: stevilcenjekonfig; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjekonfig (id, stevilcenje_id, dok) FROM stdin;
00240000-55e6-f523-e8e3-aed39c56b71e	00230000-55e6-f523-02d7-51c5b5948f42	popa
00240000-55e6-f523-fb99-ddb2e4bafb73	00230000-55e6-f523-02d7-51c5b5948f42	oseba
00240000-55e6-f523-3b64-fce1360652ef	00230000-55e6-f523-02d7-51c5b5948f42	sezona
00240000-55e6-f523-af17-a0f3019f194f	00230000-55e6-f523-3ff9-e3b7e77263ec	prostor
00240000-55e6-f523-80e6-bfff1f26ab00	00230000-55e6-f523-02d7-51c5b5948f42	besedilo
00240000-55e6-f523-3f86-6cd1293d3e97	00230000-55e6-f523-02d7-51c5b5948f42	uprizoritev
00240000-55e6-f523-593f-0701e3cadc47	00230000-55e6-f523-02d7-51c5b5948f42	funkcija
00240000-55e6-f523-fa2e-fc13c1076bd4	00230000-55e6-f523-02d7-51c5b5948f42	tipfunkcije
00240000-55e6-f523-93c3-e4ee023de51e	00230000-55e6-f523-02d7-51c5b5948f42	alternacija
00240000-55e6-f523-dda4-1c4d362a458d	00230000-55e6-f523-2ac3-72bec810bd3e	pogodba
00240000-55e6-f523-eb50-7ce73983947e	00230000-55e6-f523-02d7-51c5b5948f42	zaposlitev
00240000-55e6-f523-ef6f-f599ce651313	00230000-55e6-f523-2ac3-72bec810bd3e	programdela
00240000-55e6-f523-000b-3c558b7f6eb8	00230000-55e6-f523-02d7-51c5b5948f42	zapis
\.


--
-- TOC entry 2966 (class 0 OID 16879589)
-- Dependencies: 231
-- Data for Name: stevilcenjestanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjestanje (id, objid, leto, stevilka) FROM stdin;
a9eff282-5f12-4026-813c-4342f9a777fb	00230000-55e6-f523-02d7-51c5b5948f42	0	1001
\.


--
-- TOC entry 2949 (class 0 OID 16879301)
-- Dependencies: 214
-- Data for Name: strosekuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY strosekuprizoritve (id, uprizoritev_id, popa_id, naziv, vrednostdo, vrednostna, opis, tipstroska, sort, vrstastroska_id) FROM stdin;
00270000-55e6-f525-174b-305709c3bd30	000e0000-55e6-f525-5fa2-0d9ec1503c76	00080000-55e6-f524-fc94-a0ca1bf6df2c	Nabava kostumov	600.50	20.00	Krila in maske	materialni	1	003b0000-55e6-f523-ad97-2c119005bd1b
00270000-55e6-f525-d804-4a53014fd5b0	000e0000-55e6-f525-5fa2-0d9ec1503c76	00080000-55e6-f524-fc94-a0ca1bf6df2c	Zavese	125.70	3.10	Modra in zelena zavesa	materialni	2	003b0000-55e6-f523-ad97-2c119005bd1b
00270000-55e6-f525-d968-976f3c05be53	000e0000-55e6-f525-5fa2-0d9ec1503c76	00080000-55e6-f524-db7e-92255418b06e	Avtorske pravice	300.00	30.00	Odkup avtorskih pravic	avtorprav	4	\N
\.


--
-- TOC entry 2916 (class 0 OID 16878962)
-- Dependencies: 181
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 2931 (class 0 OID 16879141)
-- Dependencies: 196
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja) FROM stdin;
001a0000-55e6-f525-7f7f-d4f0e3616669	00180000-55e6-f525-b8f7-2be33a2b7060	000c0000-55e6-f525-fac2-719e79cec865	00090000-55e6-f525-2cfd-8ef5ed9076cf	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55e6-f525-a3d8-b15eb37ecd05	00180000-55e6-f525-b8f7-2be33a2b7060	000c0000-55e6-f525-98e9-84e8099703e0	00090000-55e6-f525-9a99-7a097ccc5ebb	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55e6-f525-99bb-809964fd7d18	00180000-55e6-f525-b8f7-2be33a2b7060	000c0000-55e6-f525-2a92-287208e98961	00090000-55e6-f525-dbf0-0e731104ef48	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55e6-f525-f1c8-9790008550b8	00180000-55e6-f525-b8f7-2be33a2b7060	000c0000-55e6-f525-e90c-3f3626e66829	00090000-55e6-f525-351e-30187713e7ad	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55e6-f525-5197-fcf69fb0d4f3	00180000-55e6-f525-b8f7-2be33a2b7060	000c0000-55e6-f525-24c3-d2cea8e36a97	00090000-55e6-f525-b4cc-3c19d967aa49	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55e6-f525-e15c-77f03b72c61b	00180000-55e6-f525-5147-8589e2007cd6	\N	00090000-55e6-f525-b4cc-3c19d967aa49	2015-08-01 20:00:00	2015-08-01 23:00:00	\N	\N	2.00
\.


--
-- TOC entry 2952 (class 0 OID 16879341)
-- Dependencies: 217
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, ime, opis, imezenski, podrocje) FROM stdin;
000f0000-55e6-f523-9207-484ed07a19e4	Avtor	Avtorji	Avtorka	umetnik
000f0000-55e6-f523-a4f7-29aeb79cf2b6	Priredba	Priredba	Priredba	umetnik
000f0000-55e6-f523-11bd-bda3da12bcb5	Prevod	Prevod	Prevod	umetnik
000f0000-55e6-f523-4866-8193616878da	Režija	Režija	Režija	umetnik
000f0000-55e6-f523-ddca-bf00a5487565	Dramaturgija	Dramaturgija	Dramaturgija	umetnik
000f0000-55e6-f523-e150-c706b7d6b1b7	Scenografija	Scenografija	Scenografija	umetnik
000f0000-55e6-f523-7b43-8d99e1611f2d	Kostumografija	Kostumografija	Kostumografija	umetnik
000f0000-55e6-f523-0b1d-c3bdd474ce3c	Koreografija	Koreografija	Koreografija	umetnik
000f0000-55e6-f523-6283-bfdce1c2159c	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	umetnik
000f0000-55e6-f523-0e8d-baecf304aa19	Oblikovanje maske	Oblikovanje maske	Oblikovanje maske	umetnik
000f0000-55e6-f523-f688-1ba068fe4343	Lektorstvo	Lektorstvo	Lektorstvo	umetnik
000f0000-55e6-f523-dbcd-e3e3825bce16	Glasbeni soustvarjalec	Glasbeni soustvarjalci	Glasbena soustvarjalka	umetnik
000f0000-55e6-f523-8cc5-f9a1fc4b23a7	Intermedijski ustvarjalec	Intermedijski ustvarjalci	Intermedijski ustvarjalka	umetnik
000f0000-55e6-f523-cb98-41ca1b1418be	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	umetnik
000f0000-55e6-f523-099c-08b82640a464	Vloga	Intermedijski ustvarjalci	Intermedijska ustvarjalka	igralec
000f0000-55e6-f523-d90b-543ce0ef1c40	Produkcija, mentorstvo	Produkcija, mentorstvo	Produkcija, mentorstvo	umetnik
000f0000-55e6-f523-8e90-3d4711ecc559	Tehnična podpora	Tehnična podpora	Tehnična podpora	tehnik
000f0000-55e6-f523-edcc-6126dbe7805b	Inšpicient	Inšpicienti	Inšpicientka	inspicient
\.


--
-- TOC entry 2964 (class 0 OID 16879571)
-- Dependencies: 229
-- Data for Name: tipprogramskeenote; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipprogramskeenote (id, sifra, naziv, koprodukcija, maxfaktor, maxvsi) FROM stdin;
002b0000-55e6-f523-1670-0a9cd30af6fb	01	Velika predstava	f	1.00	1.00
002b0000-55e6-f523-96ff-224db25e53f6	02	Mala predstava	f	0.50	0.50
002b0000-55e6-f523-664f-c51412cb30b3	03	Mala koprodukcija	t	0.40	1.00
002b0000-55e6-f523-0cae-c58bf9f63793	04	Srednja koprodukcija	t	0.70	2.00
002b0000-55e6-f523-2356-53d898faf499	05	Velika koprodukcija	t	1.00	3.00
\.


--
-- TOC entry 2921 (class 0 OID 16879024)
-- Dependencies: 186
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 2908 (class 0 OID 16878871)
-- Dependencies: 173
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-55e6-f524-8ec3-7baf5afefa07	Konzolni	$2y$05$NS4xMjkyMTcwMzExMjAxRO06znFNbsFlO3xJbBg3xixSA6TwUmKGq	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-55e6-f525-463c-2dc6f6d90f89	testni uporabnik za inšpicienta	$2y$05$NS4xMjkyMTcwMzExMjAxROxkJ1B6xAXex6EZLIwJfWzRJ8DpfecFO	t	\N	\N	\N	ivo@ifigenija.si	\N	\N	\N
00010000-55e6-f525-a5ca-60713ddb933a	testni uporabnik za Tehničnega vodjo	$2y$05$NS4xMjkyMTcwMzExMjAxROu/kXWR9sP9oamkesKuxXLbxkCb387.G	t	\N	\N	\N	tona@ifigenija.si	\N	\N	\N
00010000-55e6-f525-9d93-2d73de6c2cba	testni uporabnik za igralca	$2y$05$NS4xMjkyMTcwMzExMjAxRO/hLCgClfERRsfCAFYwxNCcFIVjP2982	t	\N	\N	\N	irena@ifigenija.si	\N	\N	\N
00010000-55e6-f525-a4fe-86be98efe13f	testni uporabnik vnašalca termina storitev (TerminStoritve-vse)	$2y$05$NS4xMjkyMTcwMzExMjAxROT6.kTHqEq4.wa2SOnf124/N14m9qeP.	t	\N	\N	\N	tatjana@ifigenija.si	\N	\N	\N
00010000-55e6-f525-63cd-8e950f811a71	testni uporabnik, ki je inšpicient brez zapisov v TerminStoritve	$2y$05$NS4xMjkyMTcwMzExMjAxROHau47Dtb7CME5.nlWwBVM.nusFP.ra2	t	\N	\N	\N	joze@ifigenija.si	\N	\N	\N
00010000-55e6-f525-e99d-25754593e638	testna uporabnica, ki je planerka	$2y$05$NS4xMjkyMTcwMzExMjAxRO.B/uJO3C7QRNhdX9Q2hTLQsSupj1V1S	t	\N	\N	\N	petra@ifigenija.si	\N	\N	\N
00010000-55e6-f525-6ee9-076bb6476e0d	testni uporabnik, ki dobi ifi-all vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROv2d7jqhaV/Mz3EIsKoi7UoFR.SDSMBm	t	\N	\N	\N	ali@ifigenija.si	\N	\N	\N
00010000-55e6-f525-0b33-972ba673b0ae	testni uporabnik, ki dobi ifi-readall vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROYB9g.gnkufr1l/gWK6mkx.ySqrOWnJC	t	\N	\N	\N	berta@ifigenija.si	\N	\N	\N
00010000-55e6-f525-3d3a-66b049239c95	testni uporabnik, ki dobi aaa-write dovoljenje	$2y$05$NS4xMjkyMTcwMzExMjAxRORujYObKX.DzpXVYbePkiJkHqg0/Ylya	t	\N	\N	\N	aaron@ifigenija.si	\N	\N	\N
00010000-55e6-f525-3821-7a86cc3e65fa	testni uporabnik ki dobi vsa posamezna dovoljenja	$2y$05$NS4xMjkyMTcwMzExMjAxRO2ymwxVXTr7U4Ncdn.bN49E8rLw9Jg0O	t	\N	\N	\N	vesna@ifigenija.si	\N	\N	\N
00010000-55e6-f524-4b9e-a19ae472051a	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 2956 (class 0 OID 16879389)
-- Dependencies: 221
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, producent_id, sifra, faza, naslov, podnaslov, delovninaslov, internacionalninaslov, naslovizvirnika, podnaslovizvirnika, datumzacstudija, stevilovaj, planiranostevilovaj, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, krstna, prvaslovenska, kratkinaslov, maticnioder_id) FROM stdin;
000e0000-55e6-f525-711f-c44a29152be1	00160000-55e6-f524-04ff-7f9c43759b42	\N	00140000-55e6-f523-ab9b-0ce90c0e1a9f	\N	0001	produkcija	Sen kresne noči		Sanje	\N	\N	\N	2016-02-01	\N	\N	2016-06-01	1	William Shakespeare	f	2				\N	f	\N	\N		00220000-55e6-f524-9037-790a7ed9ad25
000e0000-55e6-f525-5fa2-0d9ec1503c76	00160000-55e6-f524-7e3a-a966764a3abb	\N	00140000-55e6-f523-9563-4fab39a63e57	\N	0002	predprodukcija-ideja	Smoletov vrt			\N	\N	\N	2016-01-01	\N	\N	2016-04-20	2	B. Hočevar	f	2				\N	f	\N	\N		00220000-55e6-f524-7d24-affa213923b6
000e0000-55e6-f525-2ac8-0b56769fb8fb	\N	\N	00140000-55e6-f523-9563-4fab39a63e57	00190000-55e6-f525-c536-f94c9f1e2ca0	0003	postprodukcija	Kisli maček			\N	\N	\N	2016-02-01	\N	\N	2016-04-20	2	Caryl Churchill	t	2				\N	f	\N	\N		00220000-55e6-f524-9037-790a7ed9ad25
000e0000-55e6-f525-677e-1b8c9bb18600	\N	\N	00140000-55e6-f523-9563-4fab39a63e57	00190000-55e6-f525-c536-f94c9f1e2ca0	0004	postprodukcija	Vladimir			\N	\N	\N	2017-03-01	\N	\N	2017-04-20	2	Matjaž Zupančič	t	2				\N	f	\N	\N		00220000-55e6-f524-9037-790a7ed9ad25
000e0000-55e6-f525-3c3a-5f97e5c156e0	\N	\N	00140000-55e6-f523-9563-4fab39a63e57	00190000-55e6-f525-c536-f94c9f1e2ca0	0005	postprodukcija	Španska princesa			\N	\N	\N	2017-04-01	\N	\N	2017-05-20	1	Nina Kokelj	f	1				\N	f	\N	\N		00220000-55e6-f524-d192-2b91f1bb6805
000e0000-55e6-f525-45df-063a542839ce	\N	\N	00140000-55e6-f523-9563-4fab39a63e57	00190000-55e6-f525-c536-f94c9f1e2ca0	0006	postprodukcija	Ne vemo datumov			\N	\N	\N	\N	\N	\N	\N	1	Nandi Frafar	f	1				\N	f	\N	\N		00220000-55e6-f524-d192-2b91f1bb6805
\.


--
-- TOC entry 2926 (class 0 OID 16879085)
-- Dependencies: 191
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, uprizoritev_id, vrsta, zaporedna, porocilo) FROM stdin;
00200000-55e6-f525-776a-8819f1129926	000e0000-55e6-f525-5fa2-0d9ec1503c76	\N	1	
00200000-55e6-f525-4ec0-2ad4d5e97fd5	000e0000-55e6-f525-5fa2-0d9ec1503c76	\N	2	
\.


--
-- TOC entry 2940 (class 0 OID 16879212)
-- Dependencies: 205
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 2950 (class 0 OID 16879315)
-- Dependencies: 215
-- Data for Name: vrstastroska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstastroska (id, skupina, podskupina, naziv, opis) FROM stdin;
003b0000-55e6-f523-bccc-7460d2bd472c	1	0	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE
003b0000-55e6-f523-0c3a-4b95e2dcbdf6	1	1	Storitve varovanja zgradb in prostorov	storitve varovanja zgradb in prostorov (npr. gasilci na predstavah)
003b0000-55e6-f523-4157-9c0d1e93ffb2	1	2	Založniške in tiskarske storitve	založniške in tiskarske storitve
003b0000-55e6-f523-8036-1e77b0781e9c	1	3	Časopisi, revije, knjige in strokovna literatura	časopisi, revije, knjige in strokovna literatura
003b0000-55e6-f523-f725-10ce8fde22b9	1	4	Stroški prevajalskih storitev	stroški prevajalskih storitev
003b0000-55e6-f523-8f3c-9d6aea7b0653	1	5	Stroški oglaševalskih storitev	stroški oglaševalskih storitev
003b0000-55e6-f523-f825-b39488507f76	1	6	Izdatki za reprezentanco	izdatki za reprezentanco
003b0000-55e6-f523-9807-95f05c764f87	2	0	POSEBNI MATERIAL IN STORITVE	POSEBNI MATERIAL IN STORITVE
003b0000-55e6-f523-ad97-2c119005bd1b	2	1	Drugi posebni material in storitve	drugi posebni material in storitve (npr. za instrumete - navedite)
003b0000-55e6-f523-68b5-13ddf8003c92	2	2	Oprema predstave – stroški rekvizitov	Oprema predstave – stroški rekvizitov
003b0000-55e6-f523-f42d-6bdf43931f48	2	3	Oprema predstave – stroški kostumov	Oprema predstave – stroški kostumov
003b0000-55e6-f523-4911-5a8abd830302	2	4	Oprema predstave – stroški scenske opreme	Oprema predstave – stroški scenske opreme
003b0000-55e6-f523-aa6b-7da734da9801	2	5	Oprema predstave – stroški avdio in video opreme	Oprema predstave – stroški avdio in video opreme
003b0000-55e6-f523-be96-3eb119c6d2c3	3	0	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE
003b0000-55e6-f523-fb28-1aa4168ecaac	3	1	Poštnina in kurirske storitve	poštnina in kurirske storitve
003b0000-55e6-f523-0100-1f71887a528d	4	0	PREVOZNI STROŠKI IN STORITVE	PREVOZNI STROŠKI IN STORITVE
003b0000-55e6-f523-ce49-dc4ad3b6bf57	4	1	Goriva in maziva za prevozna sredstva	goriva in maziva za prevozna sredstva
003b0000-55e6-f523-8ef1-898972643256	4	2	Najem vozil in selitveni stroški	najem vozil in selitveni stroški
003b0000-55e6-f523-693f-5f0ad04337de	4	3	Drugi prevozni in transportni stroški 	drugi prevozni in transportni stroški (navedite)
003b0000-55e6-f523-89ca-8b759a54c8ea	5	0	IZDATKI ZA SLUŽBENA POTOVANJA	IZDATKI ZA SLUŽBENA POTOVANJA
003b0000-55e6-f523-f136-13f18899645f	5	1	Dnevnice za službena potovanja v državi in tujini	dnevnice za službena potovanja v državi in tujini
003b0000-55e6-f523-36c5-c2f1179eccc0	5	2	Hotelske in restavra. storitve v državi in tujini	hotelske in restavra. storitve v državi in tujini
003b0000-55e6-f523-717f-c7b89f5f5bff	5	3	Stroški prevoza v državi in tujini	stroški prevoza v državi in tujini
003b0000-55e6-f523-69c5-56b60b24c60a	5	4	Drugi izdatki za službena potovanja	drugi izdatki za službena potovanja (navedite)
003b0000-55e6-f523-ed8e-b72ac45fd47e	6	0	NAJEMNINE IN ZAKUPNINE	NAJEMNINE IN ZAKUPNINE
003b0000-55e6-f523-9e05-dae5f390ee7d	6	1	Druge najemnine, zakupnine in licenčnine	druge najemnine, zakupnine in licenčnine (npr. najem notnega materiala, instrumentov - navedite)
003b0000-55e6-f523-948c-b2a2299840aa	7	0	DRUGI OPERATIVNI ODHODKI	DRUGI OPERATIVNI ODHODKI
003b0000-55e6-f523-94db-a50f4ca25bf3	7	1	Izdatki za strok. izobraževanje zap.	izdatki za strok. izobraževanje zap.(vezani na program. enote)  
\.


--
-- TOC entry 2970 (class 0 OID 16879641)
-- Dependencies: 235
-- Data for Name: vrstazapisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstazapisa (id, oznaka, naziv, aktiven, znacka, ikona, upor, datknj) FROM stdin;
\.


--
-- TOC entry 2969 (class 0 OID 16879613)
-- Dependencies: 234
-- Data for Name: zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapis (id, vrsta_id, datoteka_id, mapa_id, avtor_id, zaklenil_id, tip, zaklenjen, datumzaklepanja, identifier, subject, title, description, coverage, creator, language, date, publisher, relation, rights, source, upor, datknj, standard, lokacija) FROM stdin;
\.


--
-- TOC entry 2971 (class 0 OID 16879653)
-- Dependencies: 236
-- Data for Name: zapislastnik; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapislastnik (id, zapis_id, lastnik, classlastnika, datum, upor, datknj) FROM stdin;
\.


--
-- TOC entry 2947 (class 0 OID 16879284)
-- Dependencies: 212
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, sifra, status, zacetek, konec, tip, delovnaobveza, malica, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci) FROM stdin;
00100000-55e6-f525-6a92-63d8b6afb8c3	00090000-55e6-f525-9a99-7a097ccc5ebb	01	A	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55e6-f525-8f16-dac9b28ea36b	00090000-55e6-f525-dbf0-0e731104ef48	02	A	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55e6-f525-5de6-5af81aecc0cb	00090000-55e6-f525-4479-0d36853d14af	03	A	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55e6-f525-7b75-375ebf88b6bd	00090000-55e6-f525-2a7f-9ff6a329234e	04	A	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55e6-f525-e3cc-6f1e3817221c	00090000-55e6-f525-2cfd-8ef5ed9076cf	05	A	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55e6-f525-c27c-0e7ec9065165	00090000-55e6-f525-beb0-daabb3418c05	06	A	2010-02-01	2010-02-01	1	2		t	f	f	t
\.


--
-- TOC entry 2928 (class 0 OID 16879121)
-- Dependencies: 193
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id) FROM stdin;
\.


--
-- TOC entry 2955 (class 0 OID 16879379)
-- Dependencies: 220
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, sifra, naziv, opis) FROM stdin;
00140000-55e6-f523-ab9b-0ce90c0e1a9f	01	Drama	drama (SURS 01)
00140000-55e6-f523-9ecb-7183906c53c6	02	Opera	opera (SURS 02)
00140000-55e6-f523-cf6d-b9207356d52f	03	Balet	balet (SURS 03)
00140000-55e6-f523-f701-609f7ec81d89	04	Plesne prireditve	plesne prireditve (SURS 04)
00140000-55e6-f523-b705-76c17de25bca	05	Lutkovno gledališče	lutkovno gledališče (SURS 05)
00140000-55e6-f523-9563-4fab39a63e57	06	Raziskovalno gledališče	raziskovalno gledališče (SURS 06)
00140000-55e6-f523-d4c3-f5fbfa5b4584	07	Drugo	drugo (SURS 07)
\.


--
-- TOC entry 2946 (class 0 OID 16879274)
-- Dependencies: 211
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, sifra, naziv, opis) FROM stdin;
\.


--
-- TOC entry 2454 (class 2606 OID 16878925)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2629 (class 2606 OID 16879438)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2625 (class 2606 OID 16879428)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2602 (class 2606 OID 16879340)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2692 (class 2606 OID 16879693)
-- Name: datoteka_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT datoteka_pkey PRIMARY KEY (id);


--
-- TOC entry 2508 (class 2606 OID 16879110)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2522 (class 2606 OID 16879130)
-- Name: dogodeksplosni_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodeksplosni
    ADD CONSTRAINT dogodeksplosni_pkey PRIMARY KEY (id);


--
-- TOC entry 2659 (class 2606 OID 16879587)
-- Name: drugivir_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT drugivir_pkey PRIMARY KEY (id);


--
-- TOC entry 2488 (class 2606 OID 16879050)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2636 (class 2606 OID 16879493)
-- Name: enotaprograma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT enotaprograma_pkey PRIMARY KEY (id);


--
-- TOC entry 2580 (class 2606 OID 16879270)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2502 (class 2606 OID 16879083)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2496 (class 2606 OID 16879064)
-- Name: kontaktnaoseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT kontaktnaoseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2544 (class 2606 OID 16879177)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2686 (class 2606 OID 16879670)
-- Name: mapa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT mapa_pkey PRIMARY KEY (id);


--
-- TOC entry 2690 (class 2606 OID 16879677)
-- Name: mapa_zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT mapa_zapis_pkey PRIMARY KEY (mapa_id, zapis_id);


--
-- TOC entry 2697 (class 2606 OID 16879701)
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
-- TOC entry 2556 (class 2606 OID 16879204)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2481 (class 2606 OID 16879022)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2458 (class 2606 OID 16878934)
-- Name: optionvalue_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT optionvalue_pkey PRIMARY KEY (id);


--
-- TOC entry 2461 (class 2606 OID 16878958)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2452 (class 2606 OID 16878914)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2445 (class 2606 OID 16878899)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2559 (class 2606 OID 16879210)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2573 (class 2606 OID 16879246)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2611 (class 2606 OID 16879374)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2470 (class 2606 OID 16878986)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2478 (class 2606 OID 16879010)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2548 (class 2606 OID 16879183)
-- Name: postavkaracuna_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT postavkaracuna_pkey PRIMARY KEY (id);


--
-- TOC entry 2476 (class 2606 OID 16879000)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2500 (class 2606 OID 16879071)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2554 (class 2606 OID 16879195)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2648 (class 2606 OID 16879550)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2650 (class 2606 OID 16879558)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2644 (class 2606 OID 16879541)
-- Name: programdela_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT programdela_pkey PRIMARY KEY (id);


--
-- TOC entry 2655 (class 2606 OID 16879569)
-- Name: programskaenotasklopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT programskaenotasklopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2566 (class 2606 OID 16879228)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2542 (class 2606 OID 16879168)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2536 (class 2606 OID 16879159)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2606 (class 2606 OID 16879362)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2593 (class 2606 OID 16879298)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2437 (class 2606 OID 16878870)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2571 (class 2606 OID 16879237)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2443 (class 2606 OID 16878888)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2447 (class 2606 OID 16878908)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2578 (class 2606 OID 16879255)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2550 (class 2606 OID 16879190)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2524 (class 2606 OID 16879139)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2668 (class 2606 OID 16879611)
-- Name: stevilcenje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenje
    ADD CONSTRAINT stevilcenje_pkey PRIMARY KEY (id);


--
-- TOC entry 2665 (class 2606 OID 16879599)
-- Name: stevilcenjekonfig_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT stevilcenjekonfig_pkey PRIMARY KEY (id);


--
-- TOC entry 2662 (class 2606 OID 16879593)
-- Name: stevilcenjestanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjestanje
    ADD CONSTRAINT stevilcenjestanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2598 (class 2606 OID 16879311)
-- Name: strosekuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT strosekuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2467 (class 2606 OID 16878967)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2530 (class 2606 OID 16879150)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2604 (class 2606 OID 16879351)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2657 (class 2606 OID 16879581)
-- Name: tipprogramskeenote_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipprogramskeenote
    ADD CONSTRAINT tipprogramskeenote_pkey PRIMARY KEY (id);


--
-- TOC entry 2486 (class 2606 OID 16879035)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2439 (class 2606 OID 16878883)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2623 (class 2606 OID 16879407)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2506 (class 2606 OID 16879093)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2562 (class 2606 OID 16879218)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2600 (class 2606 OID 16879323)
-- Name: vrstastroska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstastroska
    ADD CONSTRAINT vrstastroska_pkey PRIMARY KEY (id);


--
-- TOC entry 2679 (class 2606 OID 16879651)
-- Name: vrstazapisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstazapisa
    ADD CONSTRAINT vrstazapisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2676 (class 2606 OID 16879635)
-- Name: zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT zapis_pkey PRIMARY KEY (id);


--
-- TOC entry 2682 (class 2606 OID 16879659)
-- Name: zapislastnik_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT zapislastnik_pkey PRIMARY KEY (id);


--
-- TOC entry 2589 (class 2606 OID 16879289)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2520 (class 2606 OID 16879125)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2615 (class 2606 OID 16879387)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2586 (class 2606 OID 16879282)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2509 (class 1259 OID 16879119)
-- Name: dogodki_konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_konec ON dogodek USING btree (konec);


--
-- TOC entry 2510 (class 1259 OID 16879120)
-- Name: dogodki_razred; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_razred ON dogodek USING btree (razred);


--
-- TOC entry 2511 (class 1259 OID 16879118)
-- Name: dogodki_zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2512 (class 1259 OID 16879117)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2594 (class 1259 OID 16879312)
-- Name: idx_11ffe6e05c75296c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e05c75296c ON strosekuprizoritve USING btree (vrstastroska_id);


--
-- TOC entry 2595 (class 1259 OID 16879313)
-- Name: idx_11ffe6e062b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e062b4ffca ON strosekuprizoritve USING btree (uprizoritev_id);


--
-- TOC entry 2596 (class 1259 OID 16879314)
-- Name: idx_11ffe6e06beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e06beede51 ON strosekuprizoritve USING btree (popa_id);


--
-- TOC entry 2683 (class 1259 OID 16879672)
-- Name: idx_14a5d6d3727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d3727aca70 ON mapa USING btree (parent_id);


--
-- TOC entry 2684 (class 1259 OID 16879671)
-- Name: idx_14a5d6d38a4a6c12; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d38a4a6c12 ON mapa USING btree (lastnik_id);


--
-- TOC entry 2468 (class 1259 OID 16878988)
-- Name: idx_1c7adba5ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba5ee4b985a ON popa USING btree (drzava_id);


--
-- TOC entry 2557 (class 1259 OID 16879211)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2670 (class 1259 OID 16879639)
-- Name: idx_1ed92829253c4123; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829253c4123 ON zapis USING btree (avtor_id);


--
-- TOC entry 2671 (class 1259 OID 16879638)
-- Name: idx_1ed9282957ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282957ed422f ON zapis USING btree (mapa_id);


--
-- TOC entry 2672 (class 1259 OID 16879640)
-- Name: idx_1ed9282987ff3295; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282987ff3295 ON zapis USING btree (zaklenil_id);


--
-- TOC entry 2673 (class 1259 OID 16879637)
-- Name: idx_1ed92829a54dbb1f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829a54dbb1f ON zapis USING btree (datoteka_id);


--
-- TOC entry 2674 (class 1259 OID 16879636)
-- Name: idx_1ed92829ef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829ef943358 ON zapis USING btree (vrsta_id);


--
-- TOC entry 2551 (class 1259 OID 16879197)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2552 (class 1259 OID 16879196)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2504 (class 1259 OID 16879094)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2581 (class 1259 OID 16879271)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2582 (class 1259 OID 16879273)
-- Name: idx_23aeb9586b361365; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9586b361365 ON funkcija USING btree (tipfunkcije_id);


--
-- TOC entry 2583 (class 1259 OID 16879272)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2493 (class 1259 OID 16879066)
-- Name: idx_2942b10710389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b10710389148 ON kontaktnaoseba USING btree (oseba_id);


--
-- TOC entry 2494 (class 1259 OID 16879065)
-- Name: idx_2942b1076beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b1076beede51 ON kontaktnaoseba USING btree (popa_id);


--
-- TOC entry 2653 (class 1259 OID 16879570)
-- Name: idx_2d901816d6bc69d6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2d901816d6bc69d6 ON programskaenotasklopa USING btree (programrazno_id);


--
-- TOC entry 2607 (class 1259 OID 16879376)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2608 (class 1259 OID 16879377)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2609 (class 1259 OID 16879378)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2680 (class 1259 OID 16879660)
-- Name: idx_2eaff9dcaf91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2eaff9dcaf91ecd ON zapislastnik USING btree (zapis_id);


--
-- TOC entry 2616 (class 1259 OID 16879412)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2617 (class 1259 OID 16879409)
-- Name: idx_344a77a7c3b0d59; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a7c3b0d59 ON uprizoritev USING btree (maticnioder_id);


--
-- TOC entry 2618 (class 1259 OID 16879413)
-- Name: idx_344a77a853a965c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a853a965c ON uprizoritev USING btree (producent_id);


--
-- TOC entry 2619 (class 1259 OID 16879411)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2620 (class 1259 OID 16879410)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2483 (class 1259 OID 16879037)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2484 (class 1259 OID 16879036)
-- Name: idx_37f6541a6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a6beede51 ON trr USING btree (popa_id);


--
-- TOC entry 2459 (class 1259 OID 16878961)
-- Name: idx_466966d769e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_466966d769e8d4 ON oseba USING btree (naslov_id);


--
-- TOC entry 2569 (class 1259 OID 16879238)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2449 (class 1259 OID 16878915)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2450 (class 1259 OID 16878916)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2574 (class 1259 OID 16879258)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2575 (class 1259 OID 16879257)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2576 (class 1259 OID 16879256)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2497 (class 1259 OID 16879072)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2498 (class 1259 OID 16879073)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2663 (class 1259 OID 16879601)
-- Name: idx_6054e804ff55f926; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_6054e804ff55f926 ON stevilcenjekonfig USING btree (stevilcenje_id);


--
-- TOC entry 2531 (class 1259 OID 16879163)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2532 (class 1259 OID 16879161)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2533 (class 1259 OID 16879160)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2534 (class 1259 OID 16879162)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2440 (class 1259 OID 16878889)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2441 (class 1259 OID 16878890)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2560 (class 1259 OID 16879219)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2693 (class 1259 OID 16879694)
-- Name: idx_781826c67e3c61f9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_781826c67e3c61f9 ON datoteka USING btree (owner_id);


--
-- TOC entry 2694 (class 1259 OID 16879702)
-- Name: idx_7adc957157ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc957157ed422f ON mapaacl USING btree (mapa_id);


--
-- TOC entry 2695 (class 1259 OID 16879703)
-- Name: idx_7adc9571fa6311ef; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc9571fa6311ef ON mapaacl USING btree (perm_id);


--
-- TOC entry 2546 (class 1259 OID 16879184)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2590 (class 1259 OID 16879299)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2591 (class 1259 OID 16879300)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2637 (class 1259 OID 16879498)
-- Name: idx_8787a0e54ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e54ae1cd1c ON enotaprograma USING btree (gostitelj_id);


--
-- TOC entry 2638 (class 1259 OID 16879497)
-- Name: idx_8787a0e55d0da56c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e55d0da56c ON enotaprograma USING btree (drzavagostovanja_id);


--
-- TOC entry 2639 (class 1259 OID 16879494)
-- Name: idx_8787a0e562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e562b4ffca ON enotaprograma USING btree (uprizoritev_id);


--
-- TOC entry 2640 (class 1259 OID 16879495)
-- Name: idx_8787a0e57222d84b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e57222d84b ON enotaprograma USING btree (tipprogramskeenote_id);


--
-- TOC entry 2641 (class 1259 OID 16879496)
-- Name: idx_8787a0e5771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e5771ec7bd ON enotaprograma USING btree (program_dela_id);


--
-- TOC entry 2472 (class 1259 OID 16879002)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2473 (class 1259 OID 16879001)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2474 (class 1259 OID 16879003)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2563 (class 1259 OID 16879232)
-- Name: idx_952dd21969e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd21969e8d4 ON prostor USING btree (naslov_id);


--
-- TOC entry 2564 (class 1259 OID 16879231)
-- Name: idx_952dd2196beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd2196beede51 ON prostor USING btree (popa_id);


--
-- TOC entry 2645 (class 1259 OID 16879551)
-- Name: idx_97af082e38c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e38c06eb ON produkcijadelitev USING btree (enotaprograma_id);


--
-- TOC entry 2646 (class 1259 OID 16879552)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2630 (class 1259 OID 16879442)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2631 (class 1259 OID 16879443)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2632 (class 1259 OID 16879440)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2633 (class 1259 OID 16879441)
-- Name: idx_a4b7244fa4976613; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fa4976613 ON alternacija USING btree (zaposlitev_id);


--
-- TOC entry 2587 (class 1259 OID 16879290)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2537 (class 1259 OID 16879172)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2538 (class 1259 OID 16879171)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2539 (class 1259 OID 16879169)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2540 (class 1259 OID 16879170)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2626 (class 1259 OID 16879430)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2627 (class 1259 OID 16879429)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2642 (class 1259 OID 16879542)
-- Name: idx_c81bc37f3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c81bc37f3a0e32e3 ON programdela USING btree (sezona_id);


--
-- TOC entry 2503 (class 1259 OID 16879084)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2660 (class 1259 OID 16879588)
-- Name: idx_e7d4cf2638c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e7d4cf2638c06eb ON drugivir USING btree (enotaprograma_id);


--
-- TOC entry 2687 (class 1259 OID 16879678)
-- Name: idx_e9f8ee8257ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee8257ed422f ON mapa_zapis USING btree (mapa_id);


--
-- TOC entry 2688 (class 1259 OID 16879679)
-- Name: idx_e9f8ee82af91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee82af91ecd ON mapa_zapis USING btree (zapis_id);


--
-- TOC entry 2455 (class 1259 OID 16878936)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2456 (class 1259 OID 16878935)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2464 (class 1259 OID 16878968)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2465 (class 1259 OID 16878969)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2526 (class 1259 OID 16879153)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2527 (class 1259 OID 16879152)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2528 (class 1259 OID 16879151)
-- Name: idx_fef7d84ba81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84ba81ccef6 ON terminstoritve USING btree (dogodek_id);


--
-- TOC entry 2513 (class 1259 OID 16879112)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2514 (class 1259 OID 16879113)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2515 (class 1259 OID 16879111)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2516 (class 1259 OID 16879115)
-- Name: uniq_11e93b5dbbc7a989; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dbbc7a989 ON dogodek USING btree (dogodek_splosni_id);


--
-- TOC entry 2517 (class 1259 OID 16879116)
-- Name: uniq_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2518 (class 1259 OID 16879114)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2471 (class 1259 OID 16878987)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2489 (class 1259 OID 16879051)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2490 (class 1259 OID 16879053)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2491 (class 1259 OID 16879052)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2492 (class 1259 OID 16879054)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2545 (class 1259 OID 16879178)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2612 (class 1259 OID 16879375)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2621 (class 1259 OID 16879408)
-- Name: uniq_344a77a559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_344a77a559828a3 ON uprizoritev USING btree (sifra);


--
-- TOC entry 2462 (class 1259 OID 16878959)
-- Name: uniq_466966d7559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7559828a3 ON oseba USING btree (sifra);


--
-- TOC entry 2463 (class 1259 OID 16878960)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2584 (class 1259 OID 16879283)
-- Name: uniq_5216fcb0559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5216fcb0559828a3 ON zvrstuprizoritve USING btree (sifra);


--
-- TOC entry 2669 (class 1259 OID 16879612)
-- Name: uniq_5a434fbc559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5a434fbc559828a3 ON stevilcenje USING btree (sifra);


--
-- TOC entry 2482 (class 1259 OID 16879023)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2666 (class 1259 OID 16879600)
-- Name: uniq_6054e804889a7556; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_6054e804889a7556 ON stevilcenjekonfig USING btree (dok);


--
-- TOC entry 2567 (class 1259 OID 16879230)
-- Name: uniq_952dd21937854736; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21937854736 ON prostor USING btree (naziv);


--
-- TOC entry 2568 (class 1259 OID 16879229)
-- Name: uniq_952dd219559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd219559828a3 ON prostor USING btree (sifra);


--
-- TOC entry 2634 (class 1259 OID 16879439)
-- Name: uniq_a4b7244f559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a4b7244f559828a3 ON alternacija USING btree (sifra);


--
-- TOC entry 2479 (class 1259 OID 16879011)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2613 (class 1259 OID 16879388)
-- Name: uniq_cede8e36559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_cede8e36559828a3 ON zvrstsurs USING btree (sifra);


--
-- TOC entry 2677 (class 1259 OID 16879652)
-- Name: uniq_de1c8aa1d55226c7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_de1c8aa1d55226c7 ON vrstazapisa USING btree (oznaka);


--
-- TOC entry 2651 (class 1259 OID 16879559)
-- Name: uniq_e6fc2028559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc2028559828a3 ON produkcijskahisa USING btree (sifra);


--
-- TOC entry 2652 (class 1259 OID 16879560)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2525 (class 1259 OID 16879140)
-- Name: uniq_ecc8f8c5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ecc8f8c5559828a3 ON sezona USING btree (sifra);


--
-- TOC entry 2448 (class 1259 OID 16878909)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2725 (class 2606 OID 16879819)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2724 (class 2606 OID 16879824)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2720 (class 2606 OID 16879844)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2726 (class 2606 OID 16879814)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2722 (class 2606 OID 16879834)
-- Name: fk_11e93b5dbbc7a989; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dbbc7a989 FOREIGN KEY (dogodek_splosni_id) REFERENCES dogodeksplosni(id);


--
-- TOC entry 2721 (class 2606 OID 16879839)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2723 (class 2606 OID 16879829)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2758 (class 2606 OID 16879994)
-- Name: fk_11ffe6e05c75296c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e05c75296c FOREIGN KEY (vrstastroska_id) REFERENCES vrstastroska(id);


--
-- TOC entry 2757 (class 2606 OID 16879999)
-- Name: fk_11ffe6e062b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e062b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2756 (class 2606 OID 16880004)
-- Name: fk_11ffe6e06beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e06beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2791 (class 2606 OID 16880174)
-- Name: fk_14a5d6d3727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d3727aca70 FOREIGN KEY (parent_id) REFERENCES mapa(id);


--
-- TOC entry 2792 (class 2606 OID 16880169)
-- Name: fk_14a5d6d38a4a6c12; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d38a4a6c12 FOREIGN KEY (lastnik_id) REFERENCES uporabniki(id);


--
-- TOC entry 2708 (class 2606 OID 16879754)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2742 (class 2606 OID 16879924)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2786 (class 2606 OID 16880154)
-- Name: fk_1ed92829253c4123; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829253c4123 FOREIGN KEY (avtor_id) REFERENCES uporabniki(id);


--
-- TOC entry 2787 (class 2606 OID 16880149)
-- Name: fk_1ed9282957ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282957ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2785 (class 2606 OID 16880159)
-- Name: fk_1ed9282987ff3295; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282987ff3295 FOREIGN KEY (zaklenil_id) REFERENCES uporabniki(id);


--
-- TOC entry 2788 (class 2606 OID 16880144)
-- Name: fk_1ed92829a54dbb1f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829a54dbb1f FOREIGN KEY (datoteka_id) REFERENCES datoteka(id);


--
-- TOC entry 2789 (class 2606 OID 16880139)
-- Name: fk_1ed92829ef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829ef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstazapisa(id);


--
-- TOC entry 2740 (class 2606 OID 16879919)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2741 (class 2606 OID 16879914)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2719 (class 2606 OID 16879809)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2752 (class 2606 OID 16879964)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2750 (class 2606 OID 16879974)
-- Name: fk_23aeb9586b361365; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9586b361365 FOREIGN KEY (tipfunkcije_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2751 (class 2606 OID 16879969)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2714 (class 2606 OID 16879789)
-- Name: fk_2942b10710389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b10710389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2715 (class 2606 OID 16879784)
-- Name: fk_2942b1076beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b1076beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2738 (class 2606 OID 16879904)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2782 (class 2606 OID 16880124)
-- Name: fk_2d901816d6bc69d6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT fk_2d901816d6bc69d6 FOREIGN KEY (programrazno_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2761 (class 2606 OID 16880009)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2760 (class 2606 OID 16880014)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2759 (class 2606 OID 16880019)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 2790 (class 2606 OID 16880164)
-- Name: fk_2eaff9dcaf91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT fk_2eaff9dcaf91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id);


--
-- TOC entry 2763 (class 2606 OID 16880039)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2766 (class 2606 OID 16880024)
-- Name: fk_344a77a7c3b0d59; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a7c3b0d59 FOREIGN KEY (maticnioder_id) REFERENCES prostor(id);


--
-- TOC entry 2762 (class 2606 OID 16880044)
-- Name: fk_344a77a853a965c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a853a965c FOREIGN KEY (producent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2764 (class 2606 OID 16880034)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2765 (class 2606 OID 16880029)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2712 (class 2606 OID 16879779)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2713 (class 2606 OID 16879774)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2704 (class 2606 OID 16879739)
-- Name: fk_466966d769e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d769e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2705 (class 2606 OID 16879734)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2746 (class 2606 OID 16879944)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2701 (class 2606 OID 16879714)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2700 (class 2606 OID 16879719)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2747 (class 2606 OID 16879959)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2748 (class 2606 OID 16879954)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2749 (class 2606 OID 16879949)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2717 (class 2606 OID 16879794)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2716 (class 2606 OID 16879799)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2784 (class 2606 OID 16880134)
-- Name: fk_6054e804ff55f926; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT fk_6054e804ff55f926 FOREIGN KEY (stevilcenje_id) REFERENCES stevilcenje(id);


--
-- TOC entry 2730 (class 2606 OID 16879879)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2732 (class 2606 OID 16879869)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2733 (class 2606 OID 16879864)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2731 (class 2606 OID 16879874)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2699 (class 2606 OID 16879704)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2698 (class 2606 OID 16879709)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2743 (class 2606 OID 16879929)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2795 (class 2606 OID 16880189)
-- Name: fk_781826c67e3c61f9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT fk_781826c67e3c61f9 FOREIGN KEY (owner_id) REFERENCES uporabniki(id);


--
-- TOC entry 2797 (class 2606 OID 16880194)
-- Name: fk_7adc957157ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc957157ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2796 (class 2606 OID 16880199)
-- Name: fk_7adc9571fa6311ef; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc9571fa6311ef FOREIGN KEY (perm_id) REFERENCES permission(id);


--
-- TOC entry 2739 (class 2606 OID 16879909)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2755 (class 2606 OID 16879984)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2754 (class 2606 OID 16879989)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2773 (class 2606 OID 16880099)
-- Name: fk_8787a0e54ae1cd1c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e54ae1cd1c FOREIGN KEY (gostitelj_id) REFERENCES popa(id);


--
-- TOC entry 2774 (class 2606 OID 16880094)
-- Name: fk_8787a0e55d0da56c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e55d0da56c FOREIGN KEY (drzavagostovanja_id) REFERENCES drza(id);


--
-- TOC entry 2777 (class 2606 OID 16880079)
-- Name: fk_8787a0e562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2776 (class 2606 OID 16880084)
-- Name: fk_8787a0e57222d84b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e57222d84b FOREIGN KEY (tipprogramskeenote_id) REFERENCES tipprogramskeenote(id);


--
-- TOC entry 2775 (class 2606 OID 16880089)
-- Name: fk_8787a0e5771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e5771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2710 (class 2606 OID 16879764)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2711 (class 2606 OID 16879759)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2709 (class 2606 OID 16879769)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2744 (class 2606 OID 16879939)
-- Name: fk_952dd21969e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd21969e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2745 (class 2606 OID 16879934)
-- Name: fk_952dd2196beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd2196beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2780 (class 2606 OID 16880109)
-- Name: fk_97af082e38c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e38c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2779 (class 2606 OID 16880114)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2770 (class 2606 OID 16880069)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2769 (class 2606 OID 16880074)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2772 (class 2606 OID 16880059)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 2771 (class 2606 OID 16880064)
-- Name: fk_a4b7244fa4976613; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fa4976613 FOREIGN KEY (zaposlitev_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2753 (class 2606 OID 16879979)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2734 (class 2606 OID 16879899)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2735 (class 2606 OID 16879894)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2737 (class 2606 OID 16879884)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2736 (class 2606 OID 16879889)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2767 (class 2606 OID 16880054)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2768 (class 2606 OID 16880049)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2778 (class 2606 OID 16880104)
-- Name: fk_c81bc37f3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT fk_c81bc37f3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2718 (class 2606 OID 16879804)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2781 (class 2606 OID 16880119)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2783 (class 2606 OID 16880129)
-- Name: fk_e7d4cf2638c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT fk_e7d4cf2638c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2794 (class 2606 OID 16880179)
-- Name: fk_e9f8ee8257ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee8257ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id) ON DELETE CASCADE;


--
-- TOC entry 2793 (class 2606 OID 16880184)
-- Name: fk_e9f8ee82af91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee82af91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id) ON DELETE CASCADE;


--
-- TOC entry 2702 (class 2606 OID 16879729)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2703 (class 2606 OID 16879724)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2707 (class 2606 OID 16879744)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2706 (class 2606 OID 16879749)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2727 (class 2606 OID 16879859)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2728 (class 2606 OID 16879854)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2729 (class 2606 OID 16879849)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- Completed on 2015-09-02 15:09:59 CEST

--
-- PostgreSQL database dump complete
--

