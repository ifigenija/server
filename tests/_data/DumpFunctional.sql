--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.9
-- Dumped by pg_dump version 9.3.9
-- Started on 2015-08-26 10:17:51 CEST

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
-- TOC entry 2975 (class 0 OID 0)
-- Dependencies: 241
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_with_oids = false;

--
-- TOC entry 177 (class 1259 OID 15563461)
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
-- TOC entry 223 (class 1259 OID 15563973)
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
-- TOC entry 222 (class 1259 OID 15563956)
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
-- TOC entry 216 (class 1259 OID 15563868)
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
-- TOC entry 239 (class 1259 OID 15564222)
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
-- TOC entry 191 (class 1259 OID 15563639)
-- Name: dogodek; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodek (
    id uuid NOT NULL,
    predstava_id uuid,
    zasedenost_id uuid,
    vaja_id uuid,
    gostovanje_id uuid,
    dogodek_izven_id uuid,
    prostor_id uuid,
    sezona_id uuid,
    planiranzacetek timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    zacetek timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    konec timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    status integer,
    razred character varying(10) DEFAULT NULL::character varying,
    termin character varying(255) DEFAULT NULL::character varying,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 194 (class 1259 OID 15563673)
-- Name: dogodekizven; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodekizven (
    id uuid NOT NULL
);


--
-- TOC entry 230 (class 1259 OID 15564124)
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
-- TOC entry 186 (class 1259 OID 15563582)
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
-- TOC entry 224 (class 1259 OID 15563986)
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
-- TOC entry 210 (class 1259 OID 15563803)
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
-- TOC entry 189 (class 1259 OID 15563619)
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
-- TOC entry 193 (class 1259 OID 15563667)
-- Name: gostujoca; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE gostujoca (
    id uuid NOT NULL,
    uprizoritev_id uuid
);


--
-- TOC entry 187 (class 1259 OID 15563599)
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
-- TOC entry 199 (class 1259 OID 15563720)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 237 (class 1259 OID 15564203)
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
-- TOC entry 238 (class 1259 OID 15564215)
-- Name: mapa_zapis; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE mapa_zapis (
    mapa_id uuid NOT NULL,
    zapis_id uuid NOT NULL
);


--
-- TOC entry 240 (class 1259 OID 15564237)
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
-- TOC entry 203 (class 1259 OID 15563745)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 184 (class 1259 OID 15563556)
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
-- TOC entry 178 (class 1259 OID 15563470)
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
-- TOC entry 179 (class 1259 OID 15563481)
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
-- TOC entry 174 (class 1259 OID 15563435)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 176 (class 1259 OID 15563454)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 204 (class 1259 OID 15563752)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 208 (class 1259 OID 15563783)
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
-- TOC entry 219 (class 1259 OID 15563907)
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
-- TOC entry 181 (class 1259 OID 15563514)
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
-- TOC entry 183 (class 1259 OID 15563548)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 200 (class 1259 OID 15563726)
-- Name: postavkaracuna; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE postavkaracuna (
    id uuid NOT NULL,
    racun_id uuid
);


--
-- TOC entry 182 (class 1259 OID 15563533)
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
-- TOC entry 188 (class 1259 OID 15563611)
-- Name: predstava; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE predstava (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    gostovanje_id uuid,
    gostujoc_id uuid
);


--
-- TOC entry 202 (class 1259 OID 15563738)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 226 (class 1259 OID 15564085)
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
-- TOC entry 227 (class 1259 OID 15564095)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    sifra character varying(4) NOT NULL,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 225 (class 1259 OID 15564041)
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
-- TOC entry 228 (class 1259 OID 15564103)
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
-- TOC entry 206 (class 1259 OID 15563767)
-- Name: prostor; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prostor (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) NOT NULL,
    jeprizorisce boolean,
    kapaciteta integer,
    opis text
);


--
-- TOC entry 198 (class 1259 OID 15563711)
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
-- TOC entry 197 (class 1259 OID 15563701)
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
-- TOC entry 218 (class 1259 OID 15563896)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying,
    status character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 213 (class 1259 OID 15563835)
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
-- TOC entry 171 (class 1259 OID 15563406)
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
-- TOC entry 170 (class 1259 OID 15563404)
-- Name: revizije_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE revizije_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2976 (class 0 OID 0)
-- Dependencies: 170
-- Name: revizije_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE revizije_id_seq OWNED BY revizije.id;


--
-- TOC entry 207 (class 1259 OID 15563777)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 175 (class 1259 OID 15563444)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 173 (class 1259 OID 15563428)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 209 (class 1259 OID 15563791)
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
-- TOC entry 201 (class 1259 OID 15563732)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 195 (class 1259 OID 15563678)
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
-- TOC entry 233 (class 1259 OID 15564144)
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
-- TOC entry 232 (class 1259 OID 15564136)
-- Name: stevilcenjekonfig; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjekonfig (
    id uuid NOT NULL,
    stevilcenje_id uuid,
    dok character varying(100) DEFAULT NULL::character varying
);


--
-- TOC entry 231 (class 1259 OID 15564131)
-- Name: stevilcenjestanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjestanje (
    id uuid NOT NULL,
    objid uuid NOT NULL,
    leto integer NOT NULL,
    stevilka integer
);


--
-- TOC entry 214 (class 1259 OID 15563845)
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
-- TOC entry 180 (class 1259 OID 15563506)
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
-- TOC entry 196 (class 1259 OID 15563688)
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
-- TOC entry 217 (class 1259 OID 15563885)
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
-- TOC entry 229 (class 1259 OID 15564113)
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
-- TOC entry 185 (class 1259 OID 15563568)
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
-- TOC entry 172 (class 1259 OID 15563415)
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
-- TOC entry 221 (class 1259 OID 15563933)
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
    kratkinaslov character varying(255) DEFAULT NULL::character varying,
    maticnioder_id uuid
);


--
-- TOC entry 190 (class 1259 OID 15563630)
-- Name: vaja; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE vaja (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    zaporedna integer,
    porocilo text
);


--
-- TOC entry 205 (class 1259 OID 15563759)
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
-- TOC entry 215 (class 1259 OID 15563859)
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
-- TOC entry 235 (class 1259 OID 15564183)
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
-- TOC entry 234 (class 1259 OID 15564155)
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
-- TOC entry 236 (class 1259 OID 15564195)
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
-- TOC entry 212 (class 1259 OID 15563828)
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
-- TOC entry 192 (class 1259 OID 15563662)
-- Name: zasedenost; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zasedenost (
    id uuid NOT NULL
);


--
-- TOC entry 220 (class 1259 OID 15563923)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 211 (class 1259 OID 15563818)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 2175 (class 2604 OID 15563409)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 2905 (class 0 OID 15563461)
-- Dependencies: 177
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
\.


--
-- TOC entry 2951 (class 0 OID 15563973)
-- Dependencies: 223
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, zaposlitev_id, oseba_id, pogodba_id, sifra, zaposlen, zacetek, konec, opomba, sort, privzeti, aktivna, imapogodbo, pomembna) FROM stdin;
000c0000-55dd-762d-4e3a-a653fec73e3f	000d0000-55dd-762d-96ef-bd1a972bfc95	\N	00090000-55dd-762d-e4e6-76ae4e668750	000b0000-55dd-762d-110b-759f797739ff	0001	f	\N	\N	\N	3	\N	\N	t	t
000c0000-55dd-762d-a2cc-f17ac5f78a3c	000d0000-55dd-762d-5946-7aa1aafdd767	00100000-55dd-762d-afb0-e18b6a8cb1db	00090000-55dd-762d-94cd-a3afc67b9bcb	\N	0002	t	2016-01-01	\N	\N	8	\N	\N	f	f
000c0000-55dd-762d-391b-222af9bba9ac	000d0000-55dd-762d-1cb7-9cd4d84750b7	00100000-55dd-762d-a557-0eff2c22acf7	00090000-55dd-762d-e62e-1f3bfa94aaa9	\N	0003	t	\N	2015-08-26	\N	2	\N	\N	f	f
000c0000-55dd-762d-b758-bdd706c92f3b	000d0000-55dd-762d-3760-f2f82000a0ed	\N	00090000-55dd-762d-29e1-0ccd97530dc0	\N	0004	f	2016-01-01	2016-01-01	\N	26	\N	\N	f	f
000c0000-55dd-762d-c144-4fb6e1a1b22a	000d0000-55dd-762d-3487-c6f8cf2864bd	\N	00090000-55dd-762d-b93e-1c4d8dda330f	\N	0005	f	2016-01-01	2016-01-01	\N	7	\N	\N	f	f
000c0000-55dd-762d-ff2e-ebeea61e3ccc	000d0000-55dd-762d-e04e-dcbfc230ab06	\N	00090000-55dd-762d-97aa-d5597c68e245	000b0000-55dd-762d-6834-e9a957a48bd2	0006	f	2016-01-01	2016-01-01	\N	1	\N	\N	t	t
000c0000-55dd-762d-7a5c-df0f9f008f87	000d0000-55dd-762d-9a4a-18061768ce3d	00100000-55dd-762d-296f-239996d71fb9	00090000-55dd-762d-acff-27e4c706ee9c	\N	0007	t	2016-01-01	2016-01-01	\N	14	\N	\N	f	t
000c0000-55dd-762d-80c1-174a6eb37ede	000d0000-55dd-762d-b973-1fa5330cefbc	\N	00090000-55dd-762d-415e-3ce258fe93f6	000b0000-55dd-762d-4fe9-984ba6aa4278	0008	f	2016-01-01	2016-01-01	\N	12	\N	\N	t	t
000c0000-55dd-762d-221e-edb58bf6a343	000d0000-55dd-762d-9a4a-18061768ce3d	00100000-55dd-762d-f168-151bb8f56df3	00090000-55dd-762d-a37b-c17e0aa885bb	\N	0009	t	2017-01-01	2017-01-01	\N	15	\N	\N	f	t
000c0000-55dd-762d-0af3-e8da4331f2ec	000d0000-55dd-762d-9a4a-18061768ce3d	00100000-55dd-762d-bdf9-69f027aba5fc	00090000-55dd-762d-c9ae-0e9ab658ed7c	\N	0010	t	\N	2015-08-26	\N	16	\N	\N	f	t
000c0000-55dd-762d-2252-44a26ae6037b	000d0000-55dd-762d-9a4a-18061768ce3d	00100000-55dd-762d-8fa6-5cfd16a29e3e	00090000-55dd-762d-3350-e7f406b0df02	\N	0011	t	2017-01-01	\N	\N	17	\N	\N	f	t
\.


--
-- TOC entry 2950 (class 0 OID 15563956)
-- Dependencies: 222
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 2944 (class 0 OID 15563868)
-- Dependencies: 216
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, stevilka, naslov, avtor, podnaslov, jezik, naslovizvirnika, internacionalninaslov, datumprejema, moskevloge, zenskevloge, prevajalec, povzetekvsebine, letoizida, krajizida, zaloznik) FROM stdin;
00160000-55dd-762d-2978-1ab08e05e896	0001	Sen kresne noči	William Shakespeare		slovenščina	A Midsummer Night's Dream	\N	2015-04-26	5	5	Milan Jesih	Nastopajo Titanija, Hipolita, Oberon, ...	\N	\N	\N
00160000-55dd-762d-087e-d1c4623d792c	0002	Bratje Karamazovi	Fjodor Mihajlovič Dostojevski		slovenščina	Bratja Karamazjovji	\N	2015-12-04	4	1	Vladimir Levstik	Svetovna uspešnica	\N	\N	\N
00160000-55dd-762d-9afd-ca8ef6a3f5d3	0003	Smoletov Vrt	Berta Hočevar		slovenščina		\N	2015-05-26	2	8			\N	\N	\N
\.


--
-- TOC entry 2967 (class 0 OID 15564222)
-- Dependencies: 239
-- Data for Name: datoteka; Type: TABLE DATA; Schema: public; Owner: -
--

COPY datoteka (id, owner_id, filename, transfers, size, format, hash, createdat, uploadedat, upor, datknj) FROM stdin;
\.


--
-- TOC entry 2919 (class 0 OID 15563639)
-- Dependencies: 191
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_izven_id, prostor_id, sezona_id, planiranzacetek, zacetek, konec, status, razred, termin, ime) FROM stdin;
00180000-55dd-762d-fe11-9cc48d5ecdf7	\N	\N	00200000-55dd-762d-8fe8-05400694031e	\N	\N	\N	\N	2015-06-26 10:00:00	2015-06-26 10:00:00	2015-06-26 12:00:00	3			
00180000-55dd-762d-a6bf-5ea3df6c9bf6	\N	\N	00200000-55dd-762d-9727-1aa5329581d5	\N	\N	\N	\N	2015-06-27 10:00:00	2015-06-27 10:00:00	2015-06-27 12:00:00	4			
00180000-55dd-762d-2582-5979fe968509	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	5			
00180000-55dd-762d-e12f-df9a94debd5f	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	2			
00180000-55dd-762d-a635-895047a771dd	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	7			
\.


--
-- TOC entry 2922 (class 0 OID 15563673)
-- Dependencies: 194
-- Data for Name: dogodekizven; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodekizven (id) FROM stdin;
\.


--
-- TOC entry 2958 (class 0 OID 15564124)
-- Dependencies: 230
-- Data for Name: drugivir; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drugivir (id, znesek, opis, mednarodni, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 2914 (class 0 OID 15563582)
-- Dependencies: 186
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-55dd-762c-4932-038180c5191c	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-55dd-762c-f149-7ea4afb26aff	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-55dd-762c-2928-246869cf107a	AL	ALB	008	Albania 	Albanija	\N
00040000-55dd-762c-b3c2-01beed29abd8	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-55dd-762c-5c4a-d802fa2a87da	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-55dd-762c-9365-3316ac4c5531	AD	AND	020	Andorra 	Andora	\N
00040000-55dd-762c-48e9-a6bb0c1ea29f	AO	AGO	024	Angola 	Angola	\N
00040000-55dd-762c-7263-ecba77468af2	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-55dd-762c-f7aa-27f79e03675d	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-55dd-762c-a8a3-e7383648c968	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-55dd-762c-6323-86bc4513d6bf	AR	ARG	032	Argentina 	Argenitna	\N
00040000-55dd-762c-7247-7af1dd8e1249	AM	ARM	051	Armenia 	Armenija	\N
00040000-55dd-762c-2df2-f7abe31b074f	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-55dd-762c-5727-cda09e14097a	AU	AUS	036	Australia 	Avstralija	\N
00040000-55dd-762c-4fb5-eb7ac8a389d7	AT	AUT	040	Austria 	Avstrija	\N
00040000-55dd-762c-ee14-f840236daac7	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-55dd-762c-6620-cfbc7e60fd7f	BS	BHS	044	Bahamas 	Bahami	\N
00040000-55dd-762c-37af-78729c43e59b	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-55dd-762c-210d-31bbb0586813	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-55dd-762c-4165-7c7803cbba8f	BB	BRB	052	Barbados 	Barbados	\N
00040000-55dd-762c-9cb1-5ab1a6af9f08	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-55dd-762c-3d24-352718fe7613	BE	BEL	056	Belgium 	Belgija	\N
00040000-55dd-762c-8d94-1b1ff6d6de4b	BZ	BLZ	084	Belize 	Belize	\N
00040000-55dd-762c-3b48-a9691eba1463	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-55dd-762c-f504-3e4e74e0d67c	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-55dd-762c-a472-8564d47dc183	BT	BTN	064	Bhutan 	Butan	\N
00040000-55dd-762c-3f85-5e07af5fac98	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-55dd-762c-8cfe-011f1812358d	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-55dd-762c-6637-bd2770069210	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-55dd-762c-e9d9-300e3481c613	BW	BWA	072	Botswana 	Bocvana	\N
00040000-55dd-762c-4954-67e4d7cd53f1	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-55dd-762c-0c4d-5f00ec7ae6be	BR	BRA	076	Brazil 	Brazilija	\N
00040000-55dd-762c-c700-6f1a2fdee581	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-55dd-762c-e6c6-d191824d0ec9	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-55dd-762c-f60e-a513d5ec4a89	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-55dd-762c-d128-ab11ce5fa4bf	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-55dd-762c-94de-398e1917094f	BI	BDI	108	Burundi 	Burundi 	\N
00040000-55dd-762c-3218-45469587d4eb	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-55dd-762c-1819-d9638c72b550	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-55dd-762c-60f0-26283d270e66	CA	CAN	124	Canada 	Kanada	\N
00040000-55dd-762c-201b-2da87b5b466b	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-55dd-762c-10b2-fb257bc4fd96	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-55dd-762c-46af-4477a8284a85	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-55dd-762c-8d06-1e7afae3fd3b	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-55dd-762c-8d5f-271b858ffc96	CL	CHL	152	Chile 	Čile	\N
00040000-55dd-762c-8b07-5780f55ccd6f	CN	CHN	156	China 	Kitajska	\N
00040000-55dd-762c-5923-947e95277e44	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-55dd-762c-e5ea-cf7410f6b1d9	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-55dd-762c-132c-1d06169299bc	CO	COL	170	Colombia 	Kolumbija	\N
00040000-55dd-762c-ac31-63dc9ed40865	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-55dd-762c-397d-8ec8023b5081	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-55dd-762c-49d9-d6d249e96251	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-55dd-762c-dcd3-62a1e08a75e0	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-55dd-762c-4851-2ce29bf65463	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-55dd-762c-2eb6-2facbc613ce4	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-55dd-762c-3d0b-c111eecd18c1	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-55dd-762c-3a29-0e578c0219ba	CU	CUB	192	Cuba 	Kuba	\N
00040000-55dd-762c-fff2-5bf592c608d1	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-55dd-762c-d411-376c047f0a92	CY	CYP	196	Cyprus 	Ciper	\N
00040000-55dd-762c-adba-95df9bec590c	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-55dd-762c-e853-7ad76d09a183	DK	DNK	208	Denmark 	Danska	\N
00040000-55dd-762c-d650-c4f1d5a6b958	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-55dd-762c-c5a7-c57e05dc2da9	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-55dd-762c-8ed7-d2fcd11c0d0f	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-55dd-762c-c1ec-21c7b80429c7	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-55dd-762c-e987-fec42b23e2fd	EG	EGY	818	Egypt 	Egipt	\N
00040000-55dd-762c-db55-975bd155759f	SV	SLV	222	El Salvador 	Salvador	\N
00040000-55dd-762c-df5a-12bd01dacd47	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-55dd-762c-7773-9f6d8c4af9a0	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-55dd-762c-89a3-0e31df0bb677	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-55dd-762c-ddcf-41d5787a6e07	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-55dd-762c-abad-c6fd7391b272	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-55dd-762c-6afb-6984f0b2ece2	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-55dd-762c-698f-21fb937f60ae	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-55dd-762c-580b-cd5f99161f23	FI	FIN	246	Finland 	Finska	\N
00040000-55dd-762c-4a6e-aeeeec6de5fe	FR	FRA	250	France 	Francija	\N
00040000-55dd-762c-2ca8-db347ef63f6d	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-55dd-762c-aa57-ea7c6c5c186e	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-55dd-762c-4fae-71b708555b5c	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-55dd-762c-6d5b-1c32d4bffb66	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-55dd-762c-5fe7-064ab4b04bf0	GA	GAB	266	Gabon 	Gabon	\N
00040000-55dd-762c-5f33-a7fb4ba26b96	GM	GMB	270	Gambia 	Gambija	\N
00040000-55dd-762c-0f95-27d821fea2c6	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-55dd-762c-219c-fe571085f745	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-55dd-762c-01a2-acd2ca5a65a6	GH	GHA	288	Ghana 	Gana	\N
00040000-55dd-762c-f55c-43ba873b13d5	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-55dd-762c-a271-493d7137ff4e	GR	GRC	300	Greece 	Grčija	\N
00040000-55dd-762c-9eae-0b32f4789d61	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-55dd-762c-5655-75f9a8dc26bd	GD	GRD	308	Grenada 	Grenada	\N
00040000-55dd-762c-99cc-3f6e24ea2e19	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-55dd-762c-9a57-a2ff2ec9d896	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-55dd-762c-7159-d8e6b26513e2	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-55dd-762c-2dd9-385263be164f	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-55dd-762c-f1ef-3b3dd6dc0105	GN	GIN	324	Guinea 	Gvineja	\N
00040000-55dd-762c-f20c-bacf8f1025ba	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-55dd-762c-bf27-6910e207a391	GY	GUY	328	Guyana 	Gvajana	\N
00040000-55dd-762c-9256-d23e26a4f398	HT	HTI	332	Haiti 	Haiti	\N
00040000-55dd-762c-6e9c-ddc2ac6a947d	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-55dd-762c-1196-53996bf81503	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-55dd-762c-f9ff-1a101cd1789e	HN	HND	340	Honduras 	Honduras	\N
00040000-55dd-762c-a399-409ce08824a4	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-55dd-762c-8ebf-005bd7d457b6	HU	HUN	348	Hungary 	Madžarska	\N
00040000-55dd-762c-42ab-5c0173cee431	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-55dd-762c-5e7b-c0c151f4b42a	IN	IND	356	India 	Indija	\N
00040000-55dd-762c-4253-025f96dbf1d9	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-55dd-762c-7a5f-f9c2044ec7ce	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-55dd-762c-9381-83839453733d	IQ	IRQ	368	Iraq 	Irak	\N
00040000-55dd-762c-a774-71be50d73fa3	IE	IRL	372	Ireland 	Irska	\N
00040000-55dd-762c-722a-060917dea7fc	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-55dd-762c-1ee4-0418c491ccf6	IL	ISR	376	Israel 	Izrael	\N
00040000-55dd-762c-14cb-361349df932c	IT	ITA	380	Italy 	Italija	\N
00040000-55dd-762c-5968-e402884f493c	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-55dd-762c-2151-427b87d5c62e	JP	JPN	392	Japan 	Japonska	\N
00040000-55dd-762c-b861-840e88bef053	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-55dd-762c-021f-097e0ccdf25f	JO	JOR	400	Jordan 	Jordanija	\N
00040000-55dd-762c-dca6-33eb2f125517	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-55dd-762c-c2cf-33de031e3fa6	KE	KEN	404	Kenya 	Kenija	\N
00040000-55dd-762c-459b-866db78ddc31	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-55dd-762c-2a5d-39f9aa318378	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-55dd-762c-2ee1-5196036fed28	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-55dd-762c-8963-c0897981cfa6	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-55dd-762c-7592-005b2809ed81	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-55dd-762c-d4ec-7933482b09dc	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-55dd-762c-d60f-b3f541601b42	LV	LVA	428	Latvia 	Latvija	\N
00040000-55dd-762c-673c-16c8388389c4	LB	LBN	422	Lebanon 	Libanon	\N
00040000-55dd-762c-fb7b-e9f1427b6942	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-55dd-762c-4a02-22c9cfdd2da4	LR	LBR	430	Liberia 	Liberija	\N
00040000-55dd-762c-ce1c-19989ef8681b	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-55dd-762c-3af0-fa5eb6aeaf52	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-55dd-762c-cede-9b709aaed285	LT	LTU	440	Lithuania 	Litva	\N
00040000-55dd-762c-f9fa-b39ddcc9fc41	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-55dd-762c-632c-cd213e94bb56	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-55dd-762c-846b-e6166027502b	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-55dd-762c-d3f1-01870b2b172e	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-55dd-762c-56e2-97e379727e99	MW	MWI	454	Malawi 	Malavi	\N
00040000-55dd-762c-2e8d-314518fb44ee	MY	MYS	458	Malaysia 	Malezija	\N
00040000-55dd-762c-a395-a37f5460ae3e	MV	MDV	462	Maldives 	Maldivi	\N
00040000-55dd-762c-07bc-403ae6096b19	ML	MLI	466	Mali 	Mali	\N
00040000-55dd-762c-7ed8-2ff052908ee5	MT	MLT	470	Malta 	Malta	\N
00040000-55dd-762c-c406-d496f6242894	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-55dd-762c-64e3-16d0f5b11b1b	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-55dd-762c-d7b3-fc8069eb197b	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-55dd-762c-1db5-a13d18df5ca0	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-55dd-762c-a05d-22e2963dad99	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-55dd-762c-f6f8-13e9a15d3060	MX	MEX	484	Mexico 	Mehika	\N
00040000-55dd-762c-92f1-0cda747663f8	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-55dd-762c-9fd8-b62384e92380	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-55dd-762c-ec58-44a7466e91eb	MC	MCO	492	Monaco 	Monako	\N
00040000-55dd-762c-33b2-66a495ecf4fa	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-55dd-762c-e5f4-b89e686806c5	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-55dd-762c-cadd-28ced9ceacce	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-55dd-762c-029e-a6f3fb735825	MA	MAR	504	Morocco 	Maroko	\N
00040000-55dd-762c-4d40-029f1ff91048	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-55dd-762c-d309-fa4cec020648	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-55dd-762c-926b-ed04cd949995	NA	NAM	516	Namibia 	Namibija	\N
00040000-55dd-762c-e405-60e0841bf99e	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-55dd-762c-caa9-36a60b5e6a72	NP	NPL	524	Nepal 	Nepal	\N
00040000-55dd-762c-e738-9707f986f01f	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-55dd-762c-a374-468dc3f824c1	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-55dd-762c-4ab9-8947243ed2bb	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-55dd-762c-b4d3-4e86449469a5	NE	NER	562	Niger 	Niger 	\N
00040000-55dd-762c-fc2b-70cc158d0045	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-55dd-762c-c023-0fea6d19247d	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-55dd-762c-b5fa-54faba9f9f11	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-55dd-762c-f405-9dbc15fdc929	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-55dd-762c-4055-6a050f7f53f0	NO	NOR	578	Norway 	Norveška	\N
00040000-55dd-762c-71d4-a684fbfe33eb	OM	OMN	512	Oman 	Oman	\N
00040000-55dd-762c-67cc-c3acba0028d2	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-55dd-762c-2846-357d4bf68293	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-55dd-762c-e2de-df6c99aefbe7	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-55dd-762c-9637-9f5eeab96f3b	PA	PAN	591	Panama 	Panama	\N
00040000-55dd-762c-da49-7dbd03631e08	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-55dd-762c-95fc-350511af4210	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-55dd-762c-a11f-958886f49d2f	PE	PER	604	Peru 	Peru	\N
00040000-55dd-762c-29ad-46115d5ab9f0	PH	PHL	608	Philippines 	Filipini	\N
00040000-55dd-762c-f528-2f27d0766f02	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-55dd-762c-bdbf-a2276fc906da	PL	POL	616	Poland 	Poljska	\N
00040000-55dd-762c-afed-21a0c25440c2	PT	PRT	620	Portugal 	Portugalska	\N
00040000-55dd-762c-8f22-43e359a534a5	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-55dd-762c-7204-c119c3951068	QA	QAT	634	Qatar 	Katar	\N
00040000-55dd-762c-2f92-b05937795300	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-55dd-762c-ad9a-2253bb51437c	RO	ROU	642	Romania 	Romunija	\N
00040000-55dd-762c-6994-466c70f63978	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-55dd-762c-7710-b2669812c14b	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-55dd-762c-1a8b-b6ca16d43dcd	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-55dd-762c-b540-ddf93c865b37	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-55dd-762c-fddb-9a6a751314b9	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-55dd-762c-804a-57290f32c378	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-55dd-762c-3a2e-e40addae783e	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-55dd-762c-3163-d89ecd3baa7c	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-55dd-762c-dd59-2bf91d3a03e2	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-55dd-762c-2e79-9349cb2ac9ec	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-55dd-762c-f9c5-1a4deb1f7b1a	SM	SMR	674	San Marino 	San Marino	\N
00040000-55dd-762c-c636-03978e0da64e	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-55dd-762c-f7d3-4db6c1d4bc34	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-55dd-762c-069a-dfcb7cb519ba	SN	SEN	686	Senegal 	Senegal	\N
00040000-55dd-762c-68f3-c1eeb9b1bf0a	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-55dd-762c-7548-865ba8ee329a	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-55dd-762c-d2af-7c53587ed554	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-55dd-762c-afb2-b6bf1d4c4845	SG	SGP	702	Singapore 	Singapur	\N
00040000-55dd-762c-4eed-d3b381bb2208	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-55dd-762c-3883-a20b4ef2eae9	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-55dd-762c-ed3c-26c2deff6ca5	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-55dd-762c-358e-3585cbd3ebb0	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-55dd-762c-2484-cb3b4eda6634	SO	SOM	706	Somalia 	Somalija	\N
00040000-55dd-762c-e3f7-155e0f173f0c	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-55dd-762c-42e5-9196c906ff3f	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-55dd-762c-0e62-771f153ac1b0	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-55dd-762c-c4b6-8987b1c5e3f8	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-55dd-762c-ad01-a1a6e38b056b	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-55dd-762c-b219-27ad1ec4f80a	SD	SDN	729	Sudan 	Sudan	\N
00040000-55dd-762c-e396-d244a1677004	SR	SUR	740	Suriname 	Surinam	\N
00040000-55dd-762c-d8bc-58773bbd53c9	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-55dd-762c-f393-c8064b00a65e	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-55dd-762c-d9e2-b22a192775aa	SE	SWE	752	Sweden 	Švedska	\N
00040000-55dd-762c-79e0-dc9db9a6a8e4	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-55dd-762c-0f74-7885635fb978	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-55dd-762c-f842-ce57096825f1	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-55dd-762c-0c7b-9bc82c52d611	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-55dd-762c-886b-1d5703d6e4b3	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-55dd-762c-49b6-71b92e166d45	TH	THA	764	Thailand 	Tajska	\N
00040000-55dd-762c-892c-96777c34d184	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-55dd-762c-e25c-c556aeebf10e	TG	TGO	768	Togo 	Togo	\N
00040000-55dd-762c-7b41-159b90a01caa	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-55dd-762c-e610-d45a1906b148	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-55dd-762c-652e-52767f1c4b8b	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-55dd-762c-cce1-f691ae958c71	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-55dd-762c-dbc4-eed864183479	TR	TUR	792	Turkey 	Turčija	\N
00040000-55dd-762c-2eb3-e75de537166a	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-55dd-762c-ff15-405827328d0f	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-55dd-762c-fad1-ad4c234dcdb7	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-55dd-762c-239d-843bd3e26fff	UG	UGA	800	Uganda 	Uganda	\N
00040000-55dd-762c-bfdd-3bf834b6c7ce	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-55dd-762c-08f6-8863df8e2043	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-55dd-762c-ca20-f46d0f357527	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-55dd-762c-f5fb-4db4479bc829	US	USA	840	United States 	Združene države Amerike	\N
00040000-55dd-762c-9d3d-5e275578bdde	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-55dd-762c-9458-f7f940efeace	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-55dd-762c-9d93-4766dcd9b43f	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-55dd-762c-fc58-e17decf8be95	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-55dd-762c-6165-9f35e9b81682	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-55dd-762c-4cce-b6d37ad4f3e5	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-55dd-762c-cd75-9047140d8ac4	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-55dd-762c-2bae-db0b34f9bcd3	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-55dd-762c-9d57-7c5dfc606689	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-55dd-762c-b37c-96e5b1d22317	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-55dd-762c-f19e-0e643ee1307a	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-55dd-762c-b6c3-de9d4862e20f	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-55dd-762c-924d-614b30e2c857	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 2952 (class 0 OID 15563986)
-- Dependencies: 224
-- Data for Name: enotaprograma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY enotaprograma (id, uprizoritev_id, program_dela_id, gostitelj_id, celotnavrednost, nasdelez, celotnavrednostmat, celotnavrednostgostovsz, zaproseno, lastnasredstva, avtorskihonorarji, avtorskihonorarjisamoz, tantieme, avtorskepravice, materialni, imakoprodukcije, vlozekgostitelja, drugijavni, stzaposlenih, stzaposumet, stzaposdrug, sthonorarnih, sthonorarnihigr, sthonorarnihigrtujjz, sthonorarnihigrsamoz, obiskdoma, obiskkopr, obiskgost, obiskzamejo, obiskint, obiskkoprint, ponovidoma, ponovikopr, ponovizamejo, ponovigost, ponovikoprint, ponoviint, naziv, kpe, sort, tipprogramskeenote_id, tip, strosekodkpred, stroskiostali, krajgostovanja, ustanova, datumgostovanja, transportnistroski, dnevprvzad, drzavagostovanja_id, stpe, zvrst, stpredstav, stokroglihmiz, stpredstavitev, stdelavnic, stdrugidogodki, stprodukcij, caspriprave, casizvedbe, prizorisca, umetvodja, programskotelo, sttujihselektorjev) FROM stdin;
002f0000-55dd-762d-8c3e-87370604420d	000e0000-55dd-762d-80a8-db4275cfec8e	\N	\N	9000.30	9000.30	9000.30	0.00	3600.12	5299.98	4000.40	1000.40	200.20	200.30	4599.40	\N	0.00	100.20	0	2	2	2	2	2	\N	40	0	0	0	0	0	1	0	0	0	0	0		0.00	\N	002b0000-55dd-762c-2f83-442180f02b5b	premiera	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-55dd-762d-d3f6-a266d876c633	000e0000-55dd-762d-5dbb-ddcb9eb8dfcf	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	\N	60	0	0	0	0	0	1	0	0	0	0	0		0.00	\N	002b0000-55dd-762c-e4c9-4d61395fdcf7	premiera	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-55dd-762d-f171-e1aaad6c0a33	000e0000-55dd-762d-2ede-eb0141fdcb03	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	\N	60	0	0	0	0	0	1	0	0	0	0	0		0.00	\N	002b0000-55dd-762c-2f83-442180f02b5b	premiera	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-55dd-762d-db13-d70474f9e16a	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-54.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	54.20	5	0	0	3	0	0	\N	22	0	0	0	0	0	0	0	0	0	0	0	Urejanje portala	0.00	10	\N	razno	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-55dd-762d-5a8e-afc556be8f94	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-31.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	31.20	5	0	0	3	0	0	\N	202	0	0	0	0	0	0	0	0	0	0	0	Delavnice otroci	0.00	8	\N	razno	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 2938 (class 0 OID 15563803)
-- Dependencies: 210
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, podrocje, vodjaekipe, naziv, komentar, velikost, pomembna, sort, seplanira, dovoliprekrivanje, maxprekrivanj, tipfunkcije_id) FROM stdin;
000d0000-55dd-762d-9a4a-18061768ce3d	000e0000-55dd-762d-5dbb-ddcb9eb8dfcf	\N	igralec	\N	Hipolita	glavna vloga	velika	t	6	t	t	\N	000f0000-55dd-762c-1aee-e318c68247f9
000d0000-55dd-762d-96ef-bd1a972bfc95	000e0000-55dd-762d-5dbb-ddcb9eb8dfcf	\N	igralec	\N	Tezej	glavna vloga	velika	t	5	t	t	\N	000f0000-55dd-762c-1aee-e318c68247f9
000d0000-55dd-762d-5946-7aa1aafdd767	000e0000-55dd-762d-5dbb-ddcb9eb8dfcf	\N	umetnik	\N	Režija		velika	t	8	t	t	\N	000f0000-55dd-762c-b976-e15b92042b23
000d0000-55dd-762d-1cb7-9cd4d84750b7	000e0000-55dd-762d-5dbb-ddcb9eb8dfcf	\N	inspicient	t	Inšpicient			t	8	t	t	\N	000f0000-55dd-762c-8173-19bbedce476d
000d0000-55dd-762d-3760-f2f82000a0ed	000e0000-55dd-762d-5dbb-ddcb9eb8dfcf	\N	tehnik	t	Tehnični vodja			t	8	t	t	\N	000f0000-55dd-762c-4219-ceb957865a83
000d0000-55dd-762d-3487-c6f8cf2864bd	000e0000-55dd-762d-5dbb-ddcb9eb8dfcf	\N	tehnik	\N	Razsvetljava			t	3	t	t	\N	000f0000-55dd-762c-4219-ceb957865a83
000d0000-55dd-762d-e04e-dcbfc230ab06	000e0000-55dd-762d-5dbb-ddcb9eb8dfcf	\N	igralec	\N	Helena	glavna vloga	velika	t	5	t	t	\N	000f0000-55dd-762c-1aee-e318c68247f9
000d0000-55dd-762d-b973-1fa5330cefbc	000e0000-55dd-762d-5dbb-ddcb9eb8dfcf	\N	umetnik	\N	Lektoriranje			t	22	t	t	\N	000f0000-55dd-762c-9dd0-07f1db650889
\.


--
-- TOC entry 2917 (class 0 OID 15563619)
-- Dependencies: 189
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta, zamejstvo, kraj) FROM stdin;
\.


--
-- TOC entry 2921 (class 0 OID 15563667)
-- Dependencies: 193
-- Data for Name: gostujoca; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostujoca (id, uprizoritev_id) FROM stdin;
\.


--
-- TOC entry 2915 (class 0 OID 15563599)
-- Dependencies: 187
-- Data for Name: kontaktnaoseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kontaktnaoseba (id, popa_id, oseba_id, status, funkcija, opis) FROM stdin;
00260000-55dd-762d-ffb5-9f9a60509ed6	00080000-55dd-762d-9177-919a4cd77672	00090000-55dd-762d-c9ae-0e9ab658ed7c	AK		
\.


--
-- TOC entry 2927 (class 0 OID 15563720)
-- Dependencies: 199
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 2965 (class 0 OID 15564203)
-- Dependencies: 237
-- Data for Name: mapa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa (id, lastnik_id, parent_id, ime, komentar, caskreiranja, casspremembe, javnidostop, upor, datknj) FROM stdin;
\.


--
-- TOC entry 2966 (class 0 OID 15564215)
-- Dependencies: 238
-- Data for Name: mapa_zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa_zapis (mapa_id, zapis_id) FROM stdin;
\.


--
-- TOC entry 2968 (class 0 OID 15564237)
-- Dependencies: 240
-- Data for Name: mapaacl; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapaacl (id, mapa_id, perm_id, dostop, upor, datknj) FROM stdin;
\.


--
-- TOC entry 2931 (class 0 OID 15563745)
-- Dependencies: 203
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 2912 (class 0 OID 15563556)
-- Dependencies: 184
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-55dd-762c-ae72-11ce582cb770	popa.stakli	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-55dd-762c-1270-bd811473e142	oseba.spol	array	a:2:{s:1:"M";a:1:{s:5:"label";s:6:"Moški";}s:1:"Z";a:1:{s:5:"label";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-55dd-762c-4eb0-9702ef111774	telefonska.vrsta	array	a:3:{s:7:"mobilna";a:1:{s:5:"label";s:7:"Mobilni";}s:6:"domaca";a:1:{s:5:"label";s:6:"Domač";}s:6:"fiksna";a:1:{s:5:"label";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-55dd-762c-cf98-e1492f9f77fb	kontaktnaoseba.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status kontaktne osebe
00000000-55dd-762c-c9ce-c37c3a0e4ccb	dogodek.status	array	a:2:{s:7:"osnutek";a:1:{s:5:"label";s:11:"Dolgoročno";}s:8:"planiran";a:1:{s:5:"label";s:8:"Planiran";}}	f	f	t	\N	Tabela statusa dogodkov
00000000-55dd-762c-2cab-2f12168ca0e7	uprizoritev.faza	array	a:6:{s:20:"predprodukcija-ideja";a:1:{s:5:"label";s:16:"Dolgoročni plan";}s:20:"predprodukcija-poziv";a:1:{s:5:"label";s:29:"Predprodukcija, v fazi poziva";}s:30:"predprodukcija-potrjen_program";a:1:{s:5:"label";s:34:"Predprodukcija, program je potrjen";}s:10:"produkcija";a:1:{s:5:"label";s:10:"Produkcija";}s:14:"postprodukcija";a:1:{s:5:"label";s:14:"Postprodukcija";}s:5:"arhiv";a:1:{s:5:"label";s:10:"Arhivirana";}}	f	t	f	\N	Faza uprizoritve
00000000-55dd-762c-b996-07461d075b84	funkcija.podrocje	array	a:4:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}}	f	t	f	\N	Področje funkcije
00000000-55dd-762c-f36e-c2d6335523dc	tipfunkcije.podrocje	array	a:3:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}}	f	t	f	\N	Področje funkcije
00000000-55dd-762c-92be-3d5f23f5c41b	funkcija.velikost	array	a:4:{s:7:"stataza";a:1:{s:5:"label";s:8:"Stataža";}s:4:"mala";a:1:{s:5:"label";s:21:"Mala vloga / funkcija";}s:7:"srednja";a:1:{s:5:"label";s:24:"Srednja vloga / funkcija";}s:6:"velika";a:1:{s:5:"label";s:23:"Velika vloga / funkcija";}}	f	t	f	\N	Velikost funkcije
00000000-55dd-762c-09f8-fdde4e33cc24	zaposlitev.status	array	a:2:{s:1:"A";a:1:{s:5:"label";s:7:"Aktivna";}s:1:"N";a:1:{s:5:"label";s:9:"Neaktivna";}}	f	t	f	\N	Status zaposlitve
00000000-55dd-762c-977d-fa6eefcb6bde	produkcijskahisa.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktivna";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktivna";}}	f	t	f	\N	Status produkcijske hiše
00000000-55dd-762c-fccb-0ad1a76a0b16	strosekuprizoritve.tipstroska	array	a:2:{s:10:"materialni";a:1:{s:5:"label";s:19:"Materialni strošek";}s:9:"avtorprav";a:1:{s:5:"label";s:32:"Strošek odkupa avtorskih pravic";}}	f	t	f	\N	Tip stroška
00000000-55dd-762c-6226-dcac07820694	fsacl.dostop	array	a:4:{s:1:"X";a:1:{s:5:"label";s:12:"Brez dostopa";}s:1:"R";a:1:{s:5:"label";s:11:"Samo branje";}s:2:"RW";a:1:{s:5:"label";s:17:"Branje in pisanje";}s:3:"RWD";a:1:{s:5:"label";s:26:"Branje pisanje in brisanje";}}	f	t	f	\N	ACL Javni dostop
00000000-55dd-762d-a815-cb734fd96e62	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-55dd-762d-fd32-c7c1bd1f5f6c	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-55dd-762d-041c-8eb32a886057	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-55dd-762d-f252-7313cc0d7a05	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-55dd-762d-50a0-60b24430468c	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
00000000-55dd-762e-da35-60b57e3c6b63	application.tenant.maticnopodjetje	string	s:4:"1001";	f	t	f		Šifra matičnega podjetja v Popa in ProdukcijskaHisa
\.


--
-- TOC entry 2906 (class 0 OID 15563470)
-- Dependencies: 178
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-55dd-762d-1652-04c181ecc2e4	00000000-55dd-762d-a815-cb734fd96e62	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-55dd-762d-ca5b-c27d929eb27c	00000000-55dd-762d-a815-cb734fd96e62	00010000-55dd-762c-dbaa-49ebde405548	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-55dd-762d-125a-ff828e9296f1	00000000-55dd-762d-fd32-c7c1bd1f5f6c	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 2907 (class 0 OID 15563481)
-- Dependencies: 179
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naslov_id, sifra, naziv, ime, priimek, funkcija, srednjeime, polnoime, psevdonim, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
00090000-55dd-762d-e4e6-76ae4e668750	\N	\N	0001	g.	Janez	Novak	a	Peter	Janez Peter Novak	Jani	jani.novak@xxx.xx	1958-01-06	0601958000000	123456789	M	Jani Janez	Slovenija	Slovenija	Ljubljana
00090000-55dd-762d-29e1-0ccd97530dc0	00010000-55dd-762d-12d6-a95127bb66c3	\N	0002	dr.	Anton	Horvat	b		Anton  Horvat	Tona	anton.horvat@xxx.xx	1968-02-12	1202968111111	234567890	M		Slovenija	Slovenija	Maribor
00090000-55dd-762d-e62e-1f3bfa94aaa9	00010000-55dd-762d-0c64-4827697f113f	\N	0003		Ivan	Kovačič	c		Ivan  Kovačič	Ivo	ivan.kovacic@xxx.xx	1975-03-26	2603976222222	345678901	M		Slovenija	Slovenija	Celje
00090000-55dd-762d-a37b-c17e0aa885bb	00010000-55dd-762d-6845-47f9a7db6c4f	\N	0004	prof.	Jožef	Krajnc	d		Jožef  Krajnc	Joža	jozef.krajnc@xxx.xx	1971-04-30	3004971333333	456789012	M		Slovenija	Slovenija	Kranj
00090000-55dd-762d-dc42-3aada023bbfb	\N	\N	0005		Marko	Zupančič	e		Marko  Zupančič		marko.zupancic@xxx.xx	1984-05-07	0705984444444	567890123	M		Slovenija	Slovenija	Koper
00090000-55dd-762d-97aa-d5597c68e245	\N	\N	0006	ga.	Marija	Kovač	f		Marija  Kovač		marija.kovac@xxx.xx	1962-06-19	1906962444444	678901234	Z		Slovenija	Slovenija	Murska Sobota
00090000-55dd-762d-3350-e7f406b0df02	\N	\N	0007	ga.	Ana	Potočnik	g		Ana  Potočnik		ana.potocnik@xxx.xx	1975-07-24	2407975555555	789012345	Z		Slovenija	Slovenija	Novo Mesto
00090000-55dd-762d-acff-27e4c706ee9c	\N	\N	0008	ga.	Maja	Mlakar	h		Maja  Mlakar		maja.mlakar@xxx.xx	1986-08-02	0208986666666	890123456	Z		Slovenija	Slovenija	Nova Gorica
00090000-55dd-762d-c9ae-0e9ab658ed7c	00010000-55dd-762d-8ea9-03fdd0c90cde	\N	0009		Irena	Kos	i		Irena  Kos		irena.kos@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Ptuj
00090000-55dd-762d-94cd-a3afc67b9bcb	\N	\N	0010		Mojca	Vidmar	J		Mojca  Vidmar		mojca.vidmar@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Idrija
00090000-55dd-762d-8005-34734fb8b82d	\N	\N	0011		xx	write protected12345	a		xx  write protected12345		xx@xxx.xx	\N	\N	\N	Z		\N	\N	\N
00090000-55dd-762d-b93e-1c4d8dda330f	\N	\N	0012		Luka	Golob	luč	a	Luka a Golob		luka.golob@xxx.xx	\N	\N	\N	M		\N	\N	\N
00090000-55dd-762d-415e-3ce258fe93f6	00010000-55dd-762d-cd81-1683800f3502	\N	0013		Tatjana	Božič	tajnica	a	Tatjana a Božič		tatjana.bozic@xxx.xx	\N	\N	\N	Z		\N	\N	\N
\.


--
-- TOC entry 2902 (class 0 OID 15563435)
-- Dependencies: 174
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-55dd-762c-493b-189144d517bf	Aaa-read	Aaa (User,Role,Permission) - branje	f
00030000-55dd-762c-587f-be92e3e8a5de	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	f
00030000-55dd-762c-3fa6-0f9c6319197a	TerminStoritve-vse	TerminStoritve - spreminjanje vseh zapisov	f
00030000-55dd-762c-6023-aa80a74827cb	Dogodek-readVse	Dogodek - branje vseh, ne glede na status dogodka	f
00030000-55dd-762c-0617-91c4371037fe	Oseba-vse	Oseba - vse - za testiranje assert	f
00030000-55dd-762c-0b3d-096a3ce2f4b7	ProgramDela-lock	ProgramDela - zaklepanje	f
00030000-55dd-762c-88f9-23f2bec0a7a4	Abonma-read	Abonma - branje	f
00030000-55dd-762c-85ea-12d17fafd5b8	Abonma-write	Abonma - spreminjanje	f
00030000-55dd-762c-d696-907f7762b5a4	Alternacija-read	Alternacija - branje	f
00030000-55dd-762c-73ff-ba9a005edb78	Alternacija-write	Alternacija - spreminjanje	f
00030000-55dd-762c-71b6-c5d04ab51523	Arhivalija-read	Arhivalija - branje	f
00030000-55dd-762c-4322-947784f45c16	Arhivalija-write	Arhivalija - spreminjanje	f
00030000-55dd-762c-7f73-7ccc469c3186	Besedilo-read	Besedilo - branje	f
00030000-55dd-762c-0ce4-184b486bda61	Besedilo-write	Besedilo - spreminjanje	f
00030000-55dd-762c-c93f-3ae2416553e5	DogodekIzven-read	DogodekIzven - branje	f
00030000-55dd-762c-9317-93e116f2ad2c	DogodekIzven-write	DogodekIzven - spreminjanje	f
00030000-55dd-762c-3305-48e0f1bebf84	Dogodek-read	Dogodek - branje	f
00030000-55dd-762c-d2aa-ee5e099fa83d	Dogodek-write	Dogodek - spreminjanje	f
00030000-55dd-762c-48c1-b12b3763354b	DrugiVir-read	DrugiVir - branje	f
00030000-55dd-762c-4d4c-7a674029cd18	DrugiVir-write	DrugiVir - spreminjanje	f
00030000-55dd-762c-0c34-6f4770283559	Drzava-read	Drzava - branje	f
00030000-55dd-762c-c4c8-402600d95d19	Drzava-write	Drzava - spreminjanje	f
00030000-55dd-762c-8289-48d318b73375	EnotaPrograma-read	EnotaPrograma - branje	f
00030000-55dd-762c-18d3-f7ec2c1351e0	EnotaPrograma-write	EnotaPrograma - spreminjanje	f
00030000-55dd-762c-b5e8-48823ce331f5	Funkcija-read	Funkcija - branje	f
00030000-55dd-762c-be63-879ea7ea02ca	Funkcija-write	Funkcija - spreminjanje	f
00030000-55dd-762c-dedf-a4003fbfd9eb	Gostovanje-read	Gostovanje - branje	f
00030000-55dd-762c-3550-616a31e8d7c7	Gostovanje-write	Gostovanje - spreminjanje	f
00030000-55dd-762c-7767-32fab778e044	Gostujoca-read	Gostujoca - branje	f
00030000-55dd-762c-0a20-9082e2d80a61	Gostujoca-write	Gostujoca - spreminjanje	f
00030000-55dd-762c-8bbc-1d044417aa38	KontaktnaOseba-read	KontaktnaOseba - branje	f
00030000-55dd-762c-5d85-2877fbb92c93	KontaktnaOseba-write	KontaktnaOseba - spreminjanje	f
00030000-55dd-762c-8ab5-0f7bcf28a90c	Kupec-read	Kupec - branje	f
00030000-55dd-762c-864d-bae2d0033d59	Kupec-write	Kupec - spreminjanje	f
00030000-55dd-762c-70c2-10ff1ce2ab1e	NacinPlacina-read	NacinPlacina - branje	f
00030000-55dd-762c-5e6d-25eef3f19163	NacinPlacina-write	NacinPlacina - spreminjanje	f
00030000-55dd-762c-5519-fbec0648bb52	Option-read	Option - branje	f
00030000-55dd-762c-ec9d-78c680a9ebb2	Option-write	Option - spreminjanje	f
00030000-55dd-762c-7484-4f7d300cdcfc	OptionValue-read	OptionValue - branje	f
00030000-55dd-762c-33ea-5a8b1c23ab54	OptionValue-write	OptionValue - spreminjanje	f
00030000-55dd-762c-8e71-21437a187cd9	Oseba-read	Oseba - branje	f
00030000-55dd-762c-0839-33646ed67d7d	Oseba-write	Oseba - spreminjanje	f
00030000-55dd-762c-3078-5a9de581cb53	PlacilniInstrument-read	PlacilniInstrument - branje	f
00030000-55dd-762c-1c83-91bcbdf0df04	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	f
00030000-55dd-762c-e7ff-e021622681bb	PodrocjeSedenja-read	PodrocjeSedenja - branje	f
00030000-55dd-762c-3e1b-e02647244449	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	f
00030000-55dd-762c-b738-5032a454656c	Pogodba-read	Pogodba - branje	f
00030000-55dd-762c-56b6-339495a576a2	Pogodba-write	Pogodba - spreminjanje	f
00030000-55dd-762c-5c12-661780ac6eee	Popa-read	Popa - branje	f
00030000-55dd-762c-26ec-1fe4c9f2d21e	Popa-write	Popa - spreminjanje	f
00030000-55dd-762c-4993-e5e13db0e43f	Posta-read	Posta - branje	f
00030000-55dd-762c-5b31-4e629676d7a7	Posta-write	Posta - spreminjanje	f
00030000-55dd-762c-eef5-1a37d3e915dd	PostavkaRacuna-read	PostavkaRacuna - branje	f
00030000-55dd-762c-2b51-c20c7b5a4c99	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	f
00030000-55dd-762c-4fb3-814c9f9356ca	PostniNaslov-read	PostniNaslov - branje	f
00030000-55dd-762c-a2e6-b59215e91c8f	PostniNaslov-write	PostniNaslov - spreminjanje	f
00030000-55dd-762c-87fb-27cd28add852	Predstava-read	Predstava - branje	f
00030000-55dd-762c-d06b-577c70d417d4	Predstava-write	Predstava - spreminjanje	f
00030000-55dd-762c-6c05-3fd05f9c8ac0	ProdajaPredstave-read	ProdajaPredstave - branje	f
00030000-55dd-762c-7fc9-4734678fc517	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	f
00030000-55dd-762c-9e23-8647fd517ca2	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	f
00030000-55dd-762c-1596-2f032444f1ce	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	f
00030000-55dd-762c-cad9-f166340f2b79	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	f
00030000-55dd-762c-85ef-a4cd2621f29b	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	f
00030000-55dd-762c-ea96-929f7853b804	ProgramDela-read	ProgramDela - branje	f
00030000-55dd-762c-f32e-8be0c4a64faa	ProgramDela-write	ProgramDela - spreminjanje	f
00030000-55dd-762c-32a4-17ac5f91989a	ProgramFestival-read	ProgramFestival - branje	f
00030000-55dd-762c-c7b8-15cbdadecd60	ProgramFestival-write	ProgramFestival - spreminjanje	f
00030000-55dd-762c-5851-d79d83a9b102	ProgramGostovanje-read	ProgramGostovanje - branje	f
00030000-55dd-762c-9b0d-6e945cddc377	ProgramGostovanje-write	ProgramGostovanje - spreminjanje	f
00030000-55dd-762c-4c76-a6212d7b33a0	ProgramGostujoca-read	ProgramGostujoca - branje	f
00030000-55dd-762c-567e-a904b56a177b	ProgramGostujoca-write	ProgramGostujoca - spreminjanje	f
00030000-55dd-762c-8f11-44a6d8c91019	ProgramIzjemni-read	ProgramIzjemni - branje	f
00030000-55dd-762c-2032-e20ac661e18c	ProgramIzjemni-write	ProgramIzjemni - spreminjanje	f
00030000-55dd-762c-8f82-655d1471ab82	ProgramPonovitevPrejsnjih-read	ProgramPonovitevPrejsnjih - branje	f
00030000-55dd-762c-789c-be96ef5bb1c8	ProgramPonovitevPrejsnjih-write	ProgramPonovitevPrejsnjih - spreminjanje	f
00030000-55dd-762c-6fed-ff2c6d902e20	ProgramPonovitevPremiere-read	ProgramPonovitevPremiere - branje	f
00030000-55dd-762c-8be7-68c54ef8def0	ProgramPonovitevPremiere-write	ProgramPonovitevPremiere - spreminjanje	f
00030000-55dd-762c-e476-e98c70dcd5f7	ProgramPremiera-read	ProgramPremiera - branje	f
00030000-55dd-762c-22f3-88828a148d32	ProgramPremiera-write	ProgramPremiera - spreminjanje	f
00030000-55dd-762c-ca0a-9ca4c0200a93	ProgramRazno-read	ProgramRazno - branje	f
00030000-55dd-762c-c791-712e99e6065c	ProgramRazno-write	ProgramRazno - spreminjanje	f
00030000-55dd-762c-0c45-9ace1efbe7bd	ProgramskaEnotaSklopa-read	ProgramskaEnotaSklopa - branje	f
00030000-55dd-762c-95e8-fd3861be4a21	ProgramskaEnotaSklopa-write	ProgramskaEnotaSklopa - spreminjanje	f
00030000-55dd-762c-1bd0-1427a5691701	Prostor-read	Prostor - branje	f
00030000-55dd-762c-bf63-4a4814e43f76	Prostor-write	Prostor - spreminjanje	f
00030000-55dd-762c-7d02-e6c742d94538	Racun-read	Racun - branje	f
00030000-55dd-762c-4c04-8d25cf63a395	Racun-write	Racun - spreminjanje	f
00030000-55dd-762c-66fb-8eb0f55f0f9a	RazpisanSedez-read	RazpisanSedez - branje	f
00030000-55dd-762c-fd5d-de58295d919e	RazpisanSedez-write	RazpisanSedez - spreminjanje	f
00030000-55dd-762c-3d91-e3680b31564d	Rekviziterstvo-read	Rekviziterstvo - branje	f
00030000-55dd-762c-4ef4-085c0fbd6e42	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	f
00030000-55dd-762c-3366-de10417bdbf8	Rekvizit-read	Rekvizit - branje	f
00030000-55dd-762c-7f49-91cf7eb44d65	Rekvizit-write	Rekvizit - spreminjanje	f
00030000-55dd-762c-c084-92ace5b3735d	Revizija-read	Revizija - branje	f
00030000-55dd-762c-0317-8a18a1f4942f	Revizija-write	Revizija - spreminjanje	f
00030000-55dd-762c-3aff-25357bf5c783	Rezervacija-read	Rezervacija - branje	f
00030000-55dd-762c-09a8-1274c4e39870	Rezervacija-write	Rezervacija - spreminjanje	f
00030000-55dd-762c-ac4f-225dcd3086ab	SedezniRed-read	SedezniRed - branje	f
00030000-55dd-762c-7eaf-899e64a3a5d6	SedezniRed-write	SedezniRed - spreminjanje	f
00030000-55dd-762c-c258-3b582868b52d	Sedez-read	Sedez - branje	f
00030000-55dd-762c-ebaf-04199ad587cc	Sedez-write	Sedez - spreminjanje	f
00030000-55dd-762c-5255-e584494d41f9	Sezona-read	Sezona - branje	f
00030000-55dd-762c-8bd1-7274ce636298	Sezona-write	Sezona - spreminjanje	f
00030000-55dd-762c-d059-b0dc062b3867	StevilcenjeKonfig-read	StevilcenjeKonfig - branje	f
00030000-55dd-762c-654a-3457fc878697	StevilcenjeKonfig-write	StevilcenjeKonfig - spreminjanje	f
00030000-55dd-762c-d001-d2f5d7958412	Stevilcenje-read	Stevilcenje - branje	f
00030000-55dd-762c-d138-4023c6cc537f	Stevilcenje-write	Stevilcenje - spreminjanje	f
00030000-55dd-762c-0f03-93db2c941ade	StevilcenjeStanje-read	StevilcenjeStanje - branje	f
00030000-55dd-762c-06c0-befc0201bf5a	StevilcenjeStanje-write	StevilcenjeStanje - spreminjanje	f
00030000-55dd-762c-efeb-d212826627ac	StrosekUprizoritve-read	StrosekUprizoritve - branje	f
00030000-55dd-762c-95ea-cbefb4288536	StrosekUprizoritve-write	StrosekUprizoritve - spreminjanje	f
00030000-55dd-762c-4817-21e92a83067a	Telefonska-read	Telefonska - branje	f
00030000-55dd-762c-5c39-71084ab7f713	Telefonska-write	Telefonska - spreminjanje	f
00030000-55dd-762c-7c99-dfd037925267	TerminStoritve-read	TerminStoritve - branje	f
00030000-55dd-762c-f3d4-40a1af088f00	TerminStoritve-write	TerminStoritve - spreminjanje	f
00030000-55dd-762c-0b07-ed9377f8fb21	TipFunkcije-read	TipFunkcije - branje	f
00030000-55dd-762c-9f92-14fc3806ef73	TipFunkcije-write	TipFunkcije - spreminjanje	f
00030000-55dd-762c-eef1-4c02af1864a6	TipProgramskeEnote-read	TipProgramskeEnote - branje	f
00030000-55dd-762c-b6bf-f6ec722e3dfc	TipProgramskeEnote-write	TipProgramskeEnote - spreminjanje	f
00030000-55dd-762c-edb5-aecaf19b95ea	Trr-read	Trr - branje	f
00030000-55dd-762c-70d8-3528beaee462	Trr-write	Trr - spreminjanje	f
00030000-55dd-762c-720a-7eed64448b17	Uprizoritev-read	Uprizoritev - branje	f
00030000-55dd-762c-7772-d74e9bdfe1bb	Uprizoritev-write	Uprizoritev - spreminjanje	f
00030000-55dd-762c-d515-011062cc7bac	Vaja-read	Vaja - branje	f
00030000-55dd-762c-cc30-a762510f0d94	Vaja-write	Vaja - spreminjanje	f
00030000-55dd-762c-3509-83b99573c101	VrstaSedezev-read	VrstaSedezev - branje	f
00030000-55dd-762c-8127-446e5a5d7e7a	VrstaSedezev-write	VrstaSedezev - spreminjanje	f
00030000-55dd-762c-19ae-0cf7e3c3e545	VrstaStroska-read	VrstaStroska - branje	f
00030000-55dd-762c-0780-12977dac1cfc	VrstaStroska-write	VrstaStroska - spreminjanje	f
00030000-55dd-762c-73a9-a1bbe656a820	Zaposlitev-read	Zaposlitev - branje	f
00030000-55dd-762c-fd75-6bfab9dc4b87	Zaposlitev-write	Zaposlitev - spreminjanje	f
00030000-55dd-762c-f60d-20f49f526429	Zasedenost-read	Zasedenost - branje	f
00030000-55dd-762c-f82e-2b0c72ab7672	Zasedenost-write	Zasedenost - spreminjanje	f
00030000-55dd-762c-bf6e-8ff645f82bb3	ZvrstSurs-read	ZvrstSurs - branje	f
00030000-55dd-762c-dd54-0003254974c6	ZvrstSurs-write	ZvrstSurs - spreminjanje	f
00030000-55dd-762c-2b42-9170a1986899	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	f
00030000-55dd-762c-d7a7-096ca8ea4e06	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	f
00030000-55dd-762c-e789-7ff83174f61c	Mapa-write	Mapa - osnovno dovoljenje za pisanje	f
00030000-55dd-762c-89be-672455a71fb2	Mapa-read	Mapa - osnovno dovoljenje za branje	f
00030000-55dd-762c-78cf-2b1370189624	MapaAcl-write	MapaAcl - dovoljenje za dostop pisanje ACL-jev mape	f
00030000-55dd-762c-63ab-b7f3c952c6b7	MapaAcl-read	MapaAcl - dovoljenje za dostop branje ACL-jev mape	f
00030000-55dd-762c-5658-e1398c3883f0	Zapis-write	Zapis - dovoljenje za pisanje zapisov	f
00030000-55dd-762c-d7d9-32355978eb89	Zapis-read	Zapis - dovoljenje za pisanje zapisov	f
00030000-55dd-762c-c37f-47d04c9877b0	ZapisLastnik-write	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	f
00030000-55dd-762c-08db-a155b8a4bbf9	ZapisLastnik-read	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	f
00030000-55dd-762c-e47e-c42c250915bb	VrstaZapisa-write	Šifrant vrst zapisa - spreminjanje	f
00030000-55dd-762c-a9b5-d911afd5eb3e	VrstaZapisa-read	Šifrant vrst zapisa - branje	f
00030000-55dd-762c-cc09-11a14fe2627d	Datoteka-write	Datoteka - spreminjanje	f
00030000-55dd-762c-de87-c7e17b301355	Datoteka-read	Datoteke - branje	f
\.


--
-- TOC entry 2904 (class 0 OID 15563454)
-- Dependencies: 176
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-55dd-762c-21e1-03685ce0aae0	00030000-55dd-762c-587f-be92e3e8a5de
00020000-55dd-762c-f4c7-10f7efdde3eb	00030000-55dd-762c-0c34-6f4770283559
00020000-55dd-762c-15c5-bd68bc3d0189	00030000-55dd-762c-88f9-23f2bec0a7a4
00020000-55dd-762c-15c5-bd68bc3d0189	00030000-55dd-762c-85ea-12d17fafd5b8
00020000-55dd-762c-15c5-bd68bc3d0189	00030000-55dd-762c-d696-907f7762b5a4
00020000-55dd-762c-15c5-bd68bc3d0189	00030000-55dd-762c-73ff-ba9a005edb78
00020000-55dd-762c-15c5-bd68bc3d0189	00030000-55dd-762c-71b6-c5d04ab51523
00020000-55dd-762c-15c5-bd68bc3d0189	00030000-55dd-762c-3305-48e0f1bebf84
00020000-55dd-762c-15c5-bd68bc3d0189	00030000-55dd-762c-6023-aa80a74827cb
00020000-55dd-762c-15c5-bd68bc3d0189	00030000-55dd-762c-d2aa-ee5e099fa83d
00020000-55dd-762c-15c5-bd68bc3d0189	00030000-55dd-762c-0c34-6f4770283559
00020000-55dd-762c-15c5-bd68bc3d0189	00030000-55dd-762c-c4c8-402600d95d19
00020000-55dd-762c-15c5-bd68bc3d0189	00030000-55dd-762c-b5e8-48823ce331f5
00020000-55dd-762c-15c5-bd68bc3d0189	00030000-55dd-762c-be63-879ea7ea02ca
00020000-55dd-762c-15c5-bd68bc3d0189	00030000-55dd-762c-dedf-a4003fbfd9eb
00020000-55dd-762c-15c5-bd68bc3d0189	00030000-55dd-762c-3550-616a31e8d7c7
00020000-55dd-762c-15c5-bd68bc3d0189	00030000-55dd-762c-7767-32fab778e044
00020000-55dd-762c-15c5-bd68bc3d0189	00030000-55dd-762c-0a20-9082e2d80a61
00020000-55dd-762c-15c5-bd68bc3d0189	00030000-55dd-762c-8bbc-1d044417aa38
00020000-55dd-762c-15c5-bd68bc3d0189	00030000-55dd-762c-5d85-2877fbb92c93
00020000-55dd-762c-15c5-bd68bc3d0189	00030000-55dd-762c-5519-fbec0648bb52
00020000-55dd-762c-15c5-bd68bc3d0189	00030000-55dd-762c-7484-4f7d300cdcfc
00020000-55dd-762c-15c5-bd68bc3d0189	00030000-55dd-762c-8e71-21437a187cd9
00020000-55dd-762c-15c5-bd68bc3d0189	00030000-55dd-762c-0839-33646ed67d7d
00020000-55dd-762c-15c5-bd68bc3d0189	00030000-55dd-762c-5c12-661780ac6eee
00020000-55dd-762c-15c5-bd68bc3d0189	00030000-55dd-762c-26ec-1fe4c9f2d21e
00020000-55dd-762c-15c5-bd68bc3d0189	00030000-55dd-762c-4993-e5e13db0e43f
00020000-55dd-762c-15c5-bd68bc3d0189	00030000-55dd-762c-5b31-4e629676d7a7
00020000-55dd-762c-15c5-bd68bc3d0189	00030000-55dd-762c-4fb3-814c9f9356ca
00020000-55dd-762c-15c5-bd68bc3d0189	00030000-55dd-762c-a2e6-b59215e91c8f
00020000-55dd-762c-15c5-bd68bc3d0189	00030000-55dd-762c-87fb-27cd28add852
00020000-55dd-762c-15c5-bd68bc3d0189	00030000-55dd-762c-d06b-577c70d417d4
00020000-55dd-762c-15c5-bd68bc3d0189	00030000-55dd-762c-cad9-f166340f2b79
00020000-55dd-762c-15c5-bd68bc3d0189	00030000-55dd-762c-85ef-a4cd2621f29b
00020000-55dd-762c-15c5-bd68bc3d0189	00030000-55dd-762c-1bd0-1427a5691701
00020000-55dd-762c-15c5-bd68bc3d0189	00030000-55dd-762c-bf63-4a4814e43f76
00020000-55dd-762c-15c5-bd68bc3d0189	00030000-55dd-762c-3d91-e3680b31564d
00020000-55dd-762c-15c5-bd68bc3d0189	00030000-55dd-762c-4ef4-085c0fbd6e42
00020000-55dd-762c-15c5-bd68bc3d0189	00030000-55dd-762c-3366-de10417bdbf8
00020000-55dd-762c-15c5-bd68bc3d0189	00030000-55dd-762c-7f49-91cf7eb44d65
00020000-55dd-762c-15c5-bd68bc3d0189	00030000-55dd-762c-5255-e584494d41f9
00020000-55dd-762c-15c5-bd68bc3d0189	00030000-55dd-762c-8bd1-7274ce636298
00020000-55dd-762c-15c5-bd68bc3d0189	00030000-55dd-762c-0b07-ed9377f8fb21
00020000-55dd-762c-15c5-bd68bc3d0189	00030000-55dd-762c-720a-7eed64448b17
00020000-55dd-762c-15c5-bd68bc3d0189	00030000-55dd-762c-7772-d74e9bdfe1bb
00020000-55dd-762c-15c5-bd68bc3d0189	00030000-55dd-762c-d515-011062cc7bac
00020000-55dd-762c-15c5-bd68bc3d0189	00030000-55dd-762c-cc30-a762510f0d94
00020000-55dd-762c-15c5-bd68bc3d0189	00030000-55dd-762c-f60d-20f49f526429
00020000-55dd-762c-15c5-bd68bc3d0189	00030000-55dd-762c-f82e-2b0c72ab7672
00020000-55dd-762c-15c5-bd68bc3d0189	00030000-55dd-762c-bf6e-8ff645f82bb3
00020000-55dd-762c-15c5-bd68bc3d0189	00030000-55dd-762c-2b42-9170a1986899
00020000-55dd-762c-c5f0-f3cbe7063aec	00030000-55dd-762c-88f9-23f2bec0a7a4
00020000-55dd-762c-c5f0-f3cbe7063aec	00030000-55dd-762c-71b6-c5d04ab51523
00020000-55dd-762c-c5f0-f3cbe7063aec	00030000-55dd-762c-3305-48e0f1bebf84
00020000-55dd-762c-c5f0-f3cbe7063aec	00030000-55dd-762c-0c34-6f4770283559
00020000-55dd-762c-c5f0-f3cbe7063aec	00030000-55dd-762c-dedf-a4003fbfd9eb
00020000-55dd-762c-c5f0-f3cbe7063aec	00030000-55dd-762c-7767-32fab778e044
00020000-55dd-762c-c5f0-f3cbe7063aec	00030000-55dd-762c-8bbc-1d044417aa38
00020000-55dd-762c-c5f0-f3cbe7063aec	00030000-55dd-762c-5d85-2877fbb92c93
00020000-55dd-762c-c5f0-f3cbe7063aec	00030000-55dd-762c-5519-fbec0648bb52
00020000-55dd-762c-c5f0-f3cbe7063aec	00030000-55dd-762c-7484-4f7d300cdcfc
00020000-55dd-762c-c5f0-f3cbe7063aec	00030000-55dd-762c-8e71-21437a187cd9
00020000-55dd-762c-c5f0-f3cbe7063aec	00030000-55dd-762c-0839-33646ed67d7d
00020000-55dd-762c-c5f0-f3cbe7063aec	00030000-55dd-762c-5c12-661780ac6eee
00020000-55dd-762c-c5f0-f3cbe7063aec	00030000-55dd-762c-4993-e5e13db0e43f
00020000-55dd-762c-c5f0-f3cbe7063aec	00030000-55dd-762c-4fb3-814c9f9356ca
00020000-55dd-762c-c5f0-f3cbe7063aec	00030000-55dd-762c-a2e6-b59215e91c8f
00020000-55dd-762c-c5f0-f3cbe7063aec	00030000-55dd-762c-87fb-27cd28add852
00020000-55dd-762c-c5f0-f3cbe7063aec	00030000-55dd-762c-1bd0-1427a5691701
00020000-55dd-762c-c5f0-f3cbe7063aec	00030000-55dd-762c-3d91-e3680b31564d
00020000-55dd-762c-c5f0-f3cbe7063aec	00030000-55dd-762c-3366-de10417bdbf8
00020000-55dd-762c-c5f0-f3cbe7063aec	00030000-55dd-762c-5255-e584494d41f9
00020000-55dd-762c-c5f0-f3cbe7063aec	00030000-55dd-762c-4817-21e92a83067a
00020000-55dd-762c-c5f0-f3cbe7063aec	00030000-55dd-762c-5c39-71084ab7f713
00020000-55dd-762c-c5f0-f3cbe7063aec	00030000-55dd-762c-edb5-aecaf19b95ea
00020000-55dd-762c-c5f0-f3cbe7063aec	00030000-55dd-762c-70d8-3528beaee462
00020000-55dd-762c-c5f0-f3cbe7063aec	00030000-55dd-762c-73a9-a1bbe656a820
00020000-55dd-762c-c5f0-f3cbe7063aec	00030000-55dd-762c-fd75-6bfab9dc4b87
00020000-55dd-762c-c5f0-f3cbe7063aec	00030000-55dd-762c-bf6e-8ff645f82bb3
00020000-55dd-762c-c5f0-f3cbe7063aec	00030000-55dd-762c-2b42-9170a1986899
00020000-55dd-762c-549e-cdf36e7e3571	00030000-55dd-762c-88f9-23f2bec0a7a4
00020000-55dd-762c-549e-cdf36e7e3571	00030000-55dd-762c-d696-907f7762b5a4
00020000-55dd-762c-549e-cdf36e7e3571	00030000-55dd-762c-71b6-c5d04ab51523
00020000-55dd-762c-549e-cdf36e7e3571	00030000-55dd-762c-4322-947784f45c16
00020000-55dd-762c-549e-cdf36e7e3571	00030000-55dd-762c-7f73-7ccc469c3186
00020000-55dd-762c-549e-cdf36e7e3571	00030000-55dd-762c-c93f-3ae2416553e5
00020000-55dd-762c-549e-cdf36e7e3571	00030000-55dd-762c-3305-48e0f1bebf84
00020000-55dd-762c-549e-cdf36e7e3571	00030000-55dd-762c-0c34-6f4770283559
00020000-55dd-762c-549e-cdf36e7e3571	00030000-55dd-762c-b5e8-48823ce331f5
00020000-55dd-762c-549e-cdf36e7e3571	00030000-55dd-762c-dedf-a4003fbfd9eb
00020000-55dd-762c-549e-cdf36e7e3571	00030000-55dd-762c-7767-32fab778e044
00020000-55dd-762c-549e-cdf36e7e3571	00030000-55dd-762c-8bbc-1d044417aa38
00020000-55dd-762c-549e-cdf36e7e3571	00030000-55dd-762c-5519-fbec0648bb52
00020000-55dd-762c-549e-cdf36e7e3571	00030000-55dd-762c-7484-4f7d300cdcfc
00020000-55dd-762c-549e-cdf36e7e3571	00030000-55dd-762c-8e71-21437a187cd9
00020000-55dd-762c-549e-cdf36e7e3571	00030000-55dd-762c-5c12-661780ac6eee
00020000-55dd-762c-549e-cdf36e7e3571	00030000-55dd-762c-4993-e5e13db0e43f
00020000-55dd-762c-549e-cdf36e7e3571	00030000-55dd-762c-87fb-27cd28add852
00020000-55dd-762c-549e-cdf36e7e3571	00030000-55dd-762c-cad9-f166340f2b79
00020000-55dd-762c-549e-cdf36e7e3571	00030000-55dd-762c-1bd0-1427a5691701
00020000-55dd-762c-549e-cdf36e7e3571	00030000-55dd-762c-3d91-e3680b31564d
00020000-55dd-762c-549e-cdf36e7e3571	00030000-55dd-762c-3366-de10417bdbf8
00020000-55dd-762c-549e-cdf36e7e3571	00030000-55dd-762c-5255-e584494d41f9
00020000-55dd-762c-549e-cdf36e7e3571	00030000-55dd-762c-0b07-ed9377f8fb21
00020000-55dd-762c-549e-cdf36e7e3571	00030000-55dd-762c-d515-011062cc7bac
00020000-55dd-762c-549e-cdf36e7e3571	00030000-55dd-762c-f60d-20f49f526429
00020000-55dd-762c-549e-cdf36e7e3571	00030000-55dd-762c-bf6e-8ff645f82bb3
00020000-55dd-762c-549e-cdf36e7e3571	00030000-55dd-762c-2b42-9170a1986899
00020000-55dd-762c-a8bf-23a212fc08b9	00030000-55dd-762c-88f9-23f2bec0a7a4
00020000-55dd-762c-a8bf-23a212fc08b9	00030000-55dd-762c-85ea-12d17fafd5b8
00020000-55dd-762c-a8bf-23a212fc08b9	00030000-55dd-762c-73ff-ba9a005edb78
00020000-55dd-762c-a8bf-23a212fc08b9	00030000-55dd-762c-71b6-c5d04ab51523
00020000-55dd-762c-a8bf-23a212fc08b9	00030000-55dd-762c-3305-48e0f1bebf84
00020000-55dd-762c-a8bf-23a212fc08b9	00030000-55dd-762c-0c34-6f4770283559
00020000-55dd-762c-a8bf-23a212fc08b9	00030000-55dd-762c-dedf-a4003fbfd9eb
00020000-55dd-762c-a8bf-23a212fc08b9	00030000-55dd-762c-7767-32fab778e044
00020000-55dd-762c-a8bf-23a212fc08b9	00030000-55dd-762c-5519-fbec0648bb52
00020000-55dd-762c-a8bf-23a212fc08b9	00030000-55dd-762c-7484-4f7d300cdcfc
00020000-55dd-762c-a8bf-23a212fc08b9	00030000-55dd-762c-5c12-661780ac6eee
00020000-55dd-762c-a8bf-23a212fc08b9	00030000-55dd-762c-4993-e5e13db0e43f
00020000-55dd-762c-a8bf-23a212fc08b9	00030000-55dd-762c-87fb-27cd28add852
00020000-55dd-762c-a8bf-23a212fc08b9	00030000-55dd-762c-1bd0-1427a5691701
00020000-55dd-762c-a8bf-23a212fc08b9	00030000-55dd-762c-3d91-e3680b31564d
00020000-55dd-762c-a8bf-23a212fc08b9	00030000-55dd-762c-3366-de10417bdbf8
00020000-55dd-762c-a8bf-23a212fc08b9	00030000-55dd-762c-5255-e584494d41f9
00020000-55dd-762c-a8bf-23a212fc08b9	00030000-55dd-762c-0b07-ed9377f8fb21
00020000-55dd-762c-a8bf-23a212fc08b9	00030000-55dd-762c-bf6e-8ff645f82bb3
00020000-55dd-762c-a8bf-23a212fc08b9	00030000-55dd-762c-2b42-9170a1986899
00020000-55dd-762c-6d61-c0d23f0b56a6	00030000-55dd-762c-88f9-23f2bec0a7a4
00020000-55dd-762c-6d61-c0d23f0b56a6	00030000-55dd-762c-71b6-c5d04ab51523
00020000-55dd-762c-6d61-c0d23f0b56a6	00030000-55dd-762c-3305-48e0f1bebf84
00020000-55dd-762c-6d61-c0d23f0b56a6	00030000-55dd-762c-0c34-6f4770283559
00020000-55dd-762c-6d61-c0d23f0b56a6	00030000-55dd-762c-dedf-a4003fbfd9eb
00020000-55dd-762c-6d61-c0d23f0b56a6	00030000-55dd-762c-7767-32fab778e044
00020000-55dd-762c-6d61-c0d23f0b56a6	00030000-55dd-762c-5519-fbec0648bb52
00020000-55dd-762c-6d61-c0d23f0b56a6	00030000-55dd-762c-7484-4f7d300cdcfc
00020000-55dd-762c-6d61-c0d23f0b56a6	00030000-55dd-762c-5c12-661780ac6eee
00020000-55dd-762c-6d61-c0d23f0b56a6	00030000-55dd-762c-4993-e5e13db0e43f
00020000-55dd-762c-6d61-c0d23f0b56a6	00030000-55dd-762c-87fb-27cd28add852
00020000-55dd-762c-6d61-c0d23f0b56a6	00030000-55dd-762c-1bd0-1427a5691701
00020000-55dd-762c-6d61-c0d23f0b56a6	00030000-55dd-762c-3d91-e3680b31564d
00020000-55dd-762c-6d61-c0d23f0b56a6	00030000-55dd-762c-3366-de10417bdbf8
00020000-55dd-762c-6d61-c0d23f0b56a6	00030000-55dd-762c-5255-e584494d41f9
00020000-55dd-762c-6d61-c0d23f0b56a6	00030000-55dd-762c-7c99-dfd037925267
00020000-55dd-762c-6d61-c0d23f0b56a6	00030000-55dd-762c-3fa6-0f9c6319197a
00020000-55dd-762c-6d61-c0d23f0b56a6	00030000-55dd-762c-0b07-ed9377f8fb21
00020000-55dd-762c-6d61-c0d23f0b56a6	00030000-55dd-762c-bf6e-8ff645f82bb3
00020000-55dd-762c-6d61-c0d23f0b56a6	00030000-55dd-762c-2b42-9170a1986899
00020000-55dd-762d-c950-b90affa86f9b	00030000-55dd-762c-493b-189144d517bf
00020000-55dd-762d-c950-b90affa86f9b	00030000-55dd-762c-587f-be92e3e8a5de
00020000-55dd-762d-c950-b90affa86f9b	00030000-55dd-762c-3fa6-0f9c6319197a
00020000-55dd-762d-c950-b90affa86f9b	00030000-55dd-762c-6023-aa80a74827cb
00020000-55dd-762d-c950-b90affa86f9b	00030000-55dd-762c-0617-91c4371037fe
00020000-55dd-762d-c950-b90affa86f9b	00030000-55dd-762c-0b3d-096a3ce2f4b7
00020000-55dd-762d-c950-b90affa86f9b	00030000-55dd-762c-88f9-23f2bec0a7a4
00020000-55dd-762d-c950-b90affa86f9b	00030000-55dd-762c-85ea-12d17fafd5b8
00020000-55dd-762d-c950-b90affa86f9b	00030000-55dd-762c-d696-907f7762b5a4
00020000-55dd-762d-c950-b90affa86f9b	00030000-55dd-762c-73ff-ba9a005edb78
00020000-55dd-762d-c950-b90affa86f9b	00030000-55dd-762c-71b6-c5d04ab51523
00020000-55dd-762d-c950-b90affa86f9b	00030000-55dd-762c-4322-947784f45c16
00020000-55dd-762d-c950-b90affa86f9b	00030000-55dd-762c-7f73-7ccc469c3186
00020000-55dd-762d-c950-b90affa86f9b	00030000-55dd-762c-0ce4-184b486bda61
00020000-55dd-762d-c950-b90affa86f9b	00030000-55dd-762c-c93f-3ae2416553e5
00020000-55dd-762d-c950-b90affa86f9b	00030000-55dd-762c-9317-93e116f2ad2c
00020000-55dd-762d-c950-b90affa86f9b	00030000-55dd-762c-3305-48e0f1bebf84
00020000-55dd-762d-c950-b90affa86f9b	00030000-55dd-762c-d2aa-ee5e099fa83d
00020000-55dd-762d-c950-b90affa86f9b	00030000-55dd-762c-0c34-6f4770283559
00020000-55dd-762d-c950-b90affa86f9b	00030000-55dd-762c-c4c8-402600d95d19
00020000-55dd-762d-c950-b90affa86f9b	00030000-55dd-762c-48c1-b12b3763354b
00020000-55dd-762d-c950-b90affa86f9b	00030000-55dd-762c-4d4c-7a674029cd18
00020000-55dd-762d-c950-b90affa86f9b	00030000-55dd-762c-8289-48d318b73375
00020000-55dd-762d-c950-b90affa86f9b	00030000-55dd-762c-18d3-f7ec2c1351e0
00020000-55dd-762d-c950-b90affa86f9b	00030000-55dd-762c-b5e8-48823ce331f5
00020000-55dd-762d-c950-b90affa86f9b	00030000-55dd-762c-be63-879ea7ea02ca
00020000-55dd-762d-c950-b90affa86f9b	00030000-55dd-762c-dedf-a4003fbfd9eb
00020000-55dd-762d-c950-b90affa86f9b	00030000-55dd-762c-3550-616a31e8d7c7
00020000-55dd-762d-c950-b90affa86f9b	00030000-55dd-762c-7767-32fab778e044
00020000-55dd-762d-c950-b90affa86f9b	00030000-55dd-762c-0a20-9082e2d80a61
00020000-55dd-762d-c950-b90affa86f9b	00030000-55dd-762c-8bbc-1d044417aa38
00020000-55dd-762d-c950-b90affa86f9b	00030000-55dd-762c-5d85-2877fbb92c93
00020000-55dd-762d-c950-b90affa86f9b	00030000-55dd-762c-8ab5-0f7bcf28a90c
00020000-55dd-762d-c950-b90affa86f9b	00030000-55dd-762c-864d-bae2d0033d59
00020000-55dd-762d-c950-b90affa86f9b	00030000-55dd-762c-70c2-10ff1ce2ab1e
00020000-55dd-762d-c950-b90affa86f9b	00030000-55dd-762c-5e6d-25eef3f19163
00020000-55dd-762d-c950-b90affa86f9b	00030000-55dd-762c-5519-fbec0648bb52
00020000-55dd-762d-c950-b90affa86f9b	00030000-55dd-762c-ec9d-78c680a9ebb2
00020000-55dd-762d-c950-b90affa86f9b	00030000-55dd-762c-7484-4f7d300cdcfc
00020000-55dd-762d-c950-b90affa86f9b	00030000-55dd-762c-33ea-5a8b1c23ab54
00020000-55dd-762d-c950-b90affa86f9b	00030000-55dd-762c-8e71-21437a187cd9
00020000-55dd-762d-c950-b90affa86f9b	00030000-55dd-762c-0839-33646ed67d7d
00020000-55dd-762d-c950-b90affa86f9b	00030000-55dd-762c-3078-5a9de581cb53
00020000-55dd-762d-c950-b90affa86f9b	00030000-55dd-762c-1c83-91bcbdf0df04
00020000-55dd-762d-c950-b90affa86f9b	00030000-55dd-762c-e7ff-e021622681bb
00020000-55dd-762d-c950-b90affa86f9b	00030000-55dd-762c-3e1b-e02647244449
00020000-55dd-762d-c950-b90affa86f9b	00030000-55dd-762c-b738-5032a454656c
00020000-55dd-762d-c950-b90affa86f9b	00030000-55dd-762c-56b6-339495a576a2
00020000-55dd-762d-c950-b90affa86f9b	00030000-55dd-762c-5c12-661780ac6eee
00020000-55dd-762d-c950-b90affa86f9b	00030000-55dd-762c-26ec-1fe4c9f2d21e
00020000-55dd-762d-c950-b90affa86f9b	00030000-55dd-762c-4993-e5e13db0e43f
00020000-55dd-762d-c950-b90affa86f9b	00030000-55dd-762c-5b31-4e629676d7a7
00020000-55dd-762d-c950-b90affa86f9b	00030000-55dd-762c-eef5-1a37d3e915dd
00020000-55dd-762d-c950-b90affa86f9b	00030000-55dd-762c-2b51-c20c7b5a4c99
00020000-55dd-762d-c950-b90affa86f9b	00030000-55dd-762c-4fb3-814c9f9356ca
00020000-55dd-762d-c950-b90affa86f9b	00030000-55dd-762c-a2e6-b59215e91c8f
00020000-55dd-762d-c950-b90affa86f9b	00030000-55dd-762c-87fb-27cd28add852
00020000-55dd-762d-c950-b90affa86f9b	00030000-55dd-762c-d06b-577c70d417d4
00020000-55dd-762d-c950-b90affa86f9b	00030000-55dd-762c-6c05-3fd05f9c8ac0
00020000-55dd-762d-c950-b90affa86f9b	00030000-55dd-762c-7fc9-4734678fc517
00020000-55dd-762d-c950-b90affa86f9b	00030000-55dd-762c-9e23-8647fd517ca2
00020000-55dd-762d-c950-b90affa86f9b	00030000-55dd-762c-1596-2f032444f1ce
00020000-55dd-762d-c950-b90affa86f9b	00030000-55dd-762c-cad9-f166340f2b79
00020000-55dd-762d-c950-b90affa86f9b	00030000-55dd-762c-85ef-a4cd2621f29b
00020000-55dd-762d-c950-b90affa86f9b	00030000-55dd-762c-ea96-929f7853b804
00020000-55dd-762d-c950-b90affa86f9b	00030000-55dd-762c-f32e-8be0c4a64faa
00020000-55dd-762d-c950-b90affa86f9b	00030000-55dd-762c-32a4-17ac5f91989a
00020000-55dd-762d-c950-b90affa86f9b	00030000-55dd-762c-c7b8-15cbdadecd60
00020000-55dd-762d-c950-b90affa86f9b	00030000-55dd-762c-5851-d79d83a9b102
00020000-55dd-762d-c950-b90affa86f9b	00030000-55dd-762c-9b0d-6e945cddc377
00020000-55dd-762d-c950-b90affa86f9b	00030000-55dd-762c-4c76-a6212d7b33a0
00020000-55dd-762d-c950-b90affa86f9b	00030000-55dd-762c-567e-a904b56a177b
00020000-55dd-762d-c950-b90affa86f9b	00030000-55dd-762c-8f11-44a6d8c91019
00020000-55dd-762d-c950-b90affa86f9b	00030000-55dd-762c-2032-e20ac661e18c
00020000-55dd-762d-c950-b90affa86f9b	00030000-55dd-762c-8f82-655d1471ab82
00020000-55dd-762d-c950-b90affa86f9b	00030000-55dd-762c-789c-be96ef5bb1c8
00020000-55dd-762d-c950-b90affa86f9b	00030000-55dd-762c-6fed-ff2c6d902e20
00020000-55dd-762d-c950-b90affa86f9b	00030000-55dd-762c-8be7-68c54ef8def0
00020000-55dd-762d-c950-b90affa86f9b	00030000-55dd-762c-e476-e98c70dcd5f7
00020000-55dd-762d-c950-b90affa86f9b	00030000-55dd-762c-22f3-88828a148d32
00020000-55dd-762d-c950-b90affa86f9b	00030000-55dd-762c-ca0a-9ca4c0200a93
00020000-55dd-762d-c950-b90affa86f9b	00030000-55dd-762c-c791-712e99e6065c
00020000-55dd-762d-c950-b90affa86f9b	00030000-55dd-762c-0c45-9ace1efbe7bd
00020000-55dd-762d-c950-b90affa86f9b	00030000-55dd-762c-95e8-fd3861be4a21
00020000-55dd-762d-c950-b90affa86f9b	00030000-55dd-762c-1bd0-1427a5691701
00020000-55dd-762d-c950-b90affa86f9b	00030000-55dd-762c-bf63-4a4814e43f76
00020000-55dd-762d-c950-b90affa86f9b	00030000-55dd-762c-7d02-e6c742d94538
00020000-55dd-762d-c950-b90affa86f9b	00030000-55dd-762c-4c04-8d25cf63a395
00020000-55dd-762d-c950-b90affa86f9b	00030000-55dd-762c-66fb-8eb0f55f0f9a
00020000-55dd-762d-c950-b90affa86f9b	00030000-55dd-762c-fd5d-de58295d919e
00020000-55dd-762d-c950-b90affa86f9b	00030000-55dd-762c-3d91-e3680b31564d
00020000-55dd-762d-c950-b90affa86f9b	00030000-55dd-762c-4ef4-085c0fbd6e42
00020000-55dd-762d-c950-b90affa86f9b	00030000-55dd-762c-3366-de10417bdbf8
00020000-55dd-762d-c950-b90affa86f9b	00030000-55dd-762c-7f49-91cf7eb44d65
00020000-55dd-762d-c950-b90affa86f9b	00030000-55dd-762c-c084-92ace5b3735d
00020000-55dd-762d-c950-b90affa86f9b	00030000-55dd-762c-0317-8a18a1f4942f
00020000-55dd-762d-c950-b90affa86f9b	00030000-55dd-762c-3aff-25357bf5c783
00020000-55dd-762d-c950-b90affa86f9b	00030000-55dd-762c-09a8-1274c4e39870
00020000-55dd-762d-c950-b90affa86f9b	00030000-55dd-762c-ac4f-225dcd3086ab
00020000-55dd-762d-c950-b90affa86f9b	00030000-55dd-762c-7eaf-899e64a3a5d6
00020000-55dd-762d-c950-b90affa86f9b	00030000-55dd-762c-c258-3b582868b52d
00020000-55dd-762d-c950-b90affa86f9b	00030000-55dd-762c-ebaf-04199ad587cc
00020000-55dd-762d-c950-b90affa86f9b	00030000-55dd-762c-5255-e584494d41f9
00020000-55dd-762d-c950-b90affa86f9b	00030000-55dd-762c-8bd1-7274ce636298
00020000-55dd-762d-c950-b90affa86f9b	00030000-55dd-762c-d059-b0dc062b3867
00020000-55dd-762d-c950-b90affa86f9b	00030000-55dd-762c-654a-3457fc878697
00020000-55dd-762d-c950-b90affa86f9b	00030000-55dd-762c-d001-d2f5d7958412
00020000-55dd-762d-c950-b90affa86f9b	00030000-55dd-762c-d138-4023c6cc537f
00020000-55dd-762d-c950-b90affa86f9b	00030000-55dd-762c-0f03-93db2c941ade
00020000-55dd-762d-c950-b90affa86f9b	00030000-55dd-762c-06c0-befc0201bf5a
00020000-55dd-762d-c950-b90affa86f9b	00030000-55dd-762c-efeb-d212826627ac
00020000-55dd-762d-c950-b90affa86f9b	00030000-55dd-762c-95ea-cbefb4288536
00020000-55dd-762d-c950-b90affa86f9b	00030000-55dd-762c-4817-21e92a83067a
00020000-55dd-762d-c950-b90affa86f9b	00030000-55dd-762c-5c39-71084ab7f713
00020000-55dd-762d-c950-b90affa86f9b	00030000-55dd-762c-7c99-dfd037925267
00020000-55dd-762d-c950-b90affa86f9b	00030000-55dd-762c-f3d4-40a1af088f00
00020000-55dd-762d-c950-b90affa86f9b	00030000-55dd-762c-0b07-ed9377f8fb21
00020000-55dd-762d-c950-b90affa86f9b	00030000-55dd-762c-9f92-14fc3806ef73
00020000-55dd-762d-c950-b90affa86f9b	00030000-55dd-762c-eef1-4c02af1864a6
00020000-55dd-762d-c950-b90affa86f9b	00030000-55dd-762c-b6bf-f6ec722e3dfc
00020000-55dd-762d-c950-b90affa86f9b	00030000-55dd-762c-edb5-aecaf19b95ea
00020000-55dd-762d-c950-b90affa86f9b	00030000-55dd-762c-70d8-3528beaee462
00020000-55dd-762d-c950-b90affa86f9b	00030000-55dd-762c-720a-7eed64448b17
00020000-55dd-762d-c950-b90affa86f9b	00030000-55dd-762c-7772-d74e9bdfe1bb
00020000-55dd-762d-c950-b90affa86f9b	00030000-55dd-762c-d515-011062cc7bac
00020000-55dd-762d-c950-b90affa86f9b	00030000-55dd-762c-cc30-a762510f0d94
00020000-55dd-762d-c950-b90affa86f9b	00030000-55dd-762c-3509-83b99573c101
00020000-55dd-762d-c950-b90affa86f9b	00030000-55dd-762c-8127-446e5a5d7e7a
00020000-55dd-762d-c950-b90affa86f9b	00030000-55dd-762c-73a9-a1bbe656a820
00020000-55dd-762d-c950-b90affa86f9b	00030000-55dd-762c-fd75-6bfab9dc4b87
00020000-55dd-762d-c950-b90affa86f9b	00030000-55dd-762c-f60d-20f49f526429
00020000-55dd-762d-c950-b90affa86f9b	00030000-55dd-762c-f82e-2b0c72ab7672
00020000-55dd-762d-c950-b90affa86f9b	00030000-55dd-762c-bf6e-8ff645f82bb3
00020000-55dd-762d-c950-b90affa86f9b	00030000-55dd-762c-dd54-0003254974c6
00020000-55dd-762d-c950-b90affa86f9b	00030000-55dd-762c-2b42-9170a1986899
00020000-55dd-762d-c950-b90affa86f9b	00030000-55dd-762c-d7a7-096ca8ea4e06
\.


--
-- TOC entry 2932 (class 0 OID 15563752)
-- Dependencies: 204
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 2936 (class 0 OID 15563783)
-- Dependencies: 208
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 2947 (class 0 OID 15563907)
-- Dependencies: 219
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, zacetek, konec, placilonavajo, vrednostvaje, planiranostevilovaj, vrednostvaj, vrednostpredstave, vrednostdopremiere, aktivna, zaposlenvdrjz, samozaposlen, igralec, opis) FROM stdin;
000b0000-55dd-762d-110b-759f797739ff	00090000-55dd-762d-e4e6-76ae4e668750	\N	\N	0001	\N	\N	f	10.00	3	10.00	30.00	10.00	t	t	f	t	Pogodba o sodelovanju
000b0000-55dd-762d-6834-e9a957a48bd2	00090000-55dd-762d-97aa-d5597c68e245	\N	\N	0002	\N	\N	t	11.00	10	11.00	31.00	110.00	t	f	t	t	Pogodba za vlogo Helena
000b0000-55dd-762d-4fe9-984ba6aa4278	00090000-55dd-762d-415e-3ce258fe93f6	\N	\N	0003	\N	\N	f	12.00	4	12.00	32.00	12.00	t	f	t	f	Pogodba za lektoriranje
\.


--
-- TOC entry 2909 (class 0 OID 15563514)
-- Dependencies: 181
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, drzava_id, sifra, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo, nvo) FROM stdin;
00080000-55dd-762d-9177-919a4cd77672	00040000-55dd-762c-ed3c-26c2deff6ca5	0988	AK	Juhuhu d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55dd-762d-ffd6-696ffc4a0b40	00040000-55dd-762c-ed3c-26c2deff6ca5	0989	AK	Hopsasa d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	t
00080000-55dd-762d-4ddf-0b256b6467ac	00040000-55dd-762c-ed3c-26c2deff6ca5	0987	AK	Gledališče Šrum d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55dd-762d-4e4e-8b6177c88d2d	00040000-55dd-762c-ed3c-26c2deff6ca5	0986	AK	Lutkovni Direndaj d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55dd-762d-664b-9aecf4d9be62	00040000-55dd-762c-ed3c-26c2deff6ca5	0985	AK	Tatjana Stanič, Lektoriranje, s.p.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55dd-762d-bb16-4cc8f7c0b385	00040000-55dd-762c-6323-86bc4513d6bf	0984	AK	Gledališče Lepote tvoje		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55dd-762d-473a-f7548c51532a	00040000-55dd-762c-3d0b-c111eecd18c1	0983	AK	Sunce naše		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55dd-762d-d93e-137beb14eccf	00040000-55dd-762c-4fb5-eb7ac8a389d7	0982	AK	Theater Amadeus		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55dd-762e-fa2a-4c138c70de9d	00040000-55dd-762c-ed3c-26c2deff6ca5	1001	AK	Gledališče Matica		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
\.


--
-- TOC entry 2911 (class 0 OID 15563548)
-- Dependencies: 183
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-55dd-762b-29a7-83da65b74d12	8341	Adlešiči
00050000-55dd-762b-a192-03ffe83af38e	5270	Ajdovščina
00050000-55dd-762b-73c0-e3acb10245e3	6280	Ankaran/Ancarano
00050000-55dd-762b-2213-8bb93d737901	9253	Apače
00050000-55dd-762b-e565-5109da10fafe	8253	Artiče
00050000-55dd-762b-5393-43fbe1ddfa11	4275	Begunje na Gorenjskem
00050000-55dd-762b-e7a5-450460984ccd	1382	Begunje pri Cerknici
00050000-55dd-762b-dc34-f8a13f5e2d3d	9231	Beltinci
00050000-55dd-762b-0678-3743aa178936	2234	Benedikt
00050000-55dd-762b-fc29-2ec10599f2d0	2345	Bistrica ob Dravi
00050000-55dd-762b-9fa6-c62ff74890fc	3256	Bistrica ob Sotli
00050000-55dd-762b-88bc-d27e8df76df6	8259	Bizeljsko
00050000-55dd-762b-fca2-118b1c92abe5	1223	Blagovica
00050000-55dd-762b-64bd-55e5ca9e0a09	8283	Blanca
00050000-55dd-762b-4100-16507950b18a	4260	Bled
00050000-55dd-762b-1171-1dd83ce1a9f1	4273	Blejska Dobrava
00050000-55dd-762b-b799-e98e83284eec	9265	Bodonci
00050000-55dd-762b-e769-756dbf020526	9222	Bogojina
00050000-55dd-762b-6641-34cfcf70f7d2	4263	Bohinjska Bela
00050000-55dd-762b-80d7-7ccaa6256db4	4264	Bohinjska Bistrica
00050000-55dd-762b-091d-e2a24c1d6287	4265	Bohinjsko jezero
00050000-55dd-762b-abd6-91d8a411b211	1353	Borovnica
00050000-55dd-762b-2653-d3fcc108ed1e	8294	Boštanj
00050000-55dd-762b-bf9d-86ea39bed6b6	5230	Bovec
00050000-55dd-762b-d434-1be2a8a799fa	5295	Branik
00050000-55dd-762b-768b-0eec245c2858	3314	Braslovče
00050000-55dd-762b-9172-95591f85ae43	5223	Breginj
00050000-55dd-762b-a4a8-4a55db252724	8280	Brestanica
00050000-55dd-762b-0acb-fb4a3fe0e0d3	2354	Bresternica
00050000-55dd-762b-ee20-c2ef0ed5a991	4243	Brezje
00050000-55dd-762b-2b56-be0598baf2a8	1351	Brezovica pri Ljubljani
00050000-55dd-762b-a32d-2e81645374fb	8250	Brežice
00050000-55dd-762b-4f66-853198303200	4210	Brnik - Aerodrom
00050000-55dd-762b-007b-c3f29af0aa2f	8321	Brusnice
00050000-55dd-762b-c304-40e20558239f	3255	Buče
00050000-55dd-762b-e37b-2a3d29ee51b7	8276	Bučka 
00050000-55dd-762b-2b2b-b6fdfe4d8552	9261	Cankova
00050000-55dd-762b-6b4f-48eb101953da	3000	Celje 
00050000-55dd-762b-571a-8987655774dd	3001	Celje - poštni predali
00050000-55dd-762b-6b32-e3e58c2bc445	4207	Cerklje na Gorenjskem
00050000-55dd-762b-d78e-838e82e05878	8263	Cerklje ob Krki
00050000-55dd-762b-9459-c63f56d58734	1380	Cerknica
00050000-55dd-762b-7a65-2dbd6a800ae1	5282	Cerkno
00050000-55dd-762b-a8a5-e0d6574339f0	2236	Cerkvenjak
00050000-55dd-762b-3149-51547a4fba4e	2215	Ceršak
00050000-55dd-762b-5f27-417c604ab087	2326	Cirkovce
00050000-55dd-762b-c5a2-2b8ed098c722	2282	Cirkulane
00050000-55dd-762b-00dd-00c6fc9ab90c	5273	Col
00050000-55dd-762b-2cfd-94f8ae76ba17	8251	Čatež ob Savi
00050000-55dd-762b-9953-88a036a6b3cf	1413	Čemšenik
00050000-55dd-762b-87a5-49c35a0fd207	5253	Čepovan
00050000-55dd-762b-68c1-acf56c27aaf4	9232	Črenšovci
00050000-55dd-762b-8d71-e00b61356dba	2393	Črna na Koroškem
00050000-55dd-762b-979e-621cd5f8ef48	6275	Črni Kal
00050000-55dd-762b-3dc4-bbf2f10aa27d	5274	Črni Vrh nad Idrijo
00050000-55dd-762b-b703-3d5dbd96ffd3	5262	Črniče
00050000-55dd-762b-8a91-75fa36a62b01	8340	Črnomelj
00050000-55dd-762b-13e9-bdca41cd7c93	6271	Dekani
00050000-55dd-762b-81be-d907b56e29de	5210	Deskle
00050000-55dd-762b-df48-6928897e7c49	2253	Destrnik
00050000-55dd-762b-527d-9044527a8fb6	6215	Divača
00050000-55dd-762b-df5a-3d3cac7df8b7	1233	Dob
00050000-55dd-762b-43f1-423e74b00efe	3224	Dobje pri Planini
00050000-55dd-762b-ed28-3c21f469422a	8257	Dobova
00050000-55dd-762b-a3c7-956330f65f1d	1423	Dobovec
00050000-55dd-762b-2f17-43ac3134672e	5263	Dobravlje
00050000-55dd-762b-d7ea-0f08918f939c	3204	Dobrna
00050000-55dd-762b-55d4-c5dd1cf0f647	8211	Dobrnič
00050000-55dd-762b-2b92-4180e9a5a75a	1356	Dobrova
00050000-55dd-762b-7670-6c689317664b	9223	Dobrovnik/Dobronak 
00050000-55dd-762b-99bf-fe416e7466ec	5212	Dobrovo v Brdih
00050000-55dd-762b-38ba-d7c7d4c2e741	1431	Dol pri Hrastniku
00050000-55dd-762b-7e29-1db6454b0788	1262	Dol pri Ljubljani
00050000-55dd-762b-11a4-29644bdccfab	1273	Dole pri Litiji
00050000-55dd-762b-403f-137b9106f8b1	1331	Dolenja vas
00050000-55dd-762b-2944-96de5b2fc4d4	8350	Dolenjske Toplice
00050000-55dd-762b-fa1f-392005f63b57	1230	Domžale
00050000-55dd-762b-45d9-609e8546fd89	2252	Dornava
00050000-55dd-762b-97a4-cdbb2251d568	5294	Dornberk
00050000-55dd-762b-a0ea-2339ba499c97	1319	Draga
00050000-55dd-762b-52d4-a718b621481f	8343	Dragatuš
00050000-55dd-762b-c6cd-ba648c2c5c7d	3222	Dramlje
00050000-55dd-762b-7e51-4774065edd1d	2370	Dravograd
00050000-55dd-762b-2973-b9c6f2c649a8	4203	Duplje
00050000-55dd-762b-708d-0bc12aa78bb1	6221	Dutovlje
00050000-55dd-762b-8837-fa6af4e98470	8361	Dvor
00050000-55dd-762b-f3f9-1bdf63318637	2343	Fala
00050000-55dd-762b-3f89-59b818926396	9208	Fokovci
00050000-55dd-762b-0e2f-942cd9499ee6	2313	Fram
00050000-55dd-762b-7daa-d9623986cb7e	3213	Frankolovo
00050000-55dd-762b-5115-243ad392c2ec	1274	Gabrovka
00050000-55dd-762b-e31a-0ecfb680e6d1	8254	Globoko
00050000-55dd-762b-513a-ec48af6b4cd2	5275	Godovič
00050000-55dd-762b-5f9c-2532084057b2	4204	Golnik
00050000-55dd-762b-f7d0-3a947d520f7b	3303	Gomilsko
00050000-55dd-762b-faee-cd498872758a	4224	Gorenja vas
00050000-55dd-762b-f432-8cbeb0ef9d8b	3263	Gorica pri Slivnici
00050000-55dd-762b-17b5-a11872d8d27b	2272	Gorišnica
00050000-55dd-762b-a57b-5f43c17611f1	9250	Gornja Radgona
00050000-55dd-762b-ca3f-cebfffc67a2c	3342	Gornji Grad
00050000-55dd-762b-0e4e-890e34bd0d20	4282	Gozd Martuljek
00050000-55dd-762b-d46b-eacda153137b	6272	Gračišče
00050000-55dd-762b-eda5-eac675ed787a	9264	Grad
00050000-55dd-762b-c59f-3c50a6b6bd19	8332	Gradac
00050000-55dd-762b-759f-ca7aa6b8d9d2	1384	Grahovo
00050000-55dd-762b-a01b-b366adc89c77	5242	Grahovo ob Bači
00050000-55dd-762b-aed8-66fadeb23880	5251	Grgar
00050000-55dd-762b-bd14-d27f6319e3e0	3302	Griže
00050000-55dd-762b-ae4b-fddac96cfc03	3231	Grobelno
00050000-55dd-762b-9236-343f238368a5	1290	Grosuplje
00050000-55dd-762b-e9e8-0611693d86e5	2288	Hajdina
00050000-55dd-762b-efbb-adcc84e3ce27	8362	Hinje
00050000-55dd-762b-5e3f-b29c5a488b71	2311	Hoče
00050000-55dd-762b-9992-bb5d8dc26016	9205	Hodoš/Hodos
00050000-55dd-762b-a62f-25e3dbacadad	1354	Horjul
00050000-55dd-762b-3df6-d59aa3d5aee5	1372	Hotedršica
00050000-55dd-762b-b85e-cb476ed5a7b4	1430	Hrastnik
00050000-55dd-762b-6ac5-5f461c987723	6225	Hruševje
00050000-55dd-762b-dc50-8149ba5eff13	4276	Hrušica
00050000-55dd-762b-85d2-b62c5db72a6b	5280	Idrija
00050000-55dd-762b-2c96-1c29a2da5ed5	1292	Ig
00050000-55dd-762b-3655-083ee3cddf4d	6250	Ilirska Bistrica
00050000-55dd-762b-61f8-6dffb670ad24	6251	Ilirska Bistrica-Trnovo
00050000-55dd-762b-fefd-c8d0f772c10c	1295	Ivančna Gorica
00050000-55dd-762b-1f53-885ec768d3ca	2259	Ivanjkovci
00050000-55dd-762b-35b2-8c5398c08cfd	1411	Izlake
00050000-55dd-762b-b277-41f851e3ceb4	6310	Izola/Isola
00050000-55dd-762b-dcc5-ce7556fbc46d	2222	Jakobski Dol
00050000-55dd-762b-0316-71b86a4ac34d	2221	Jarenina
00050000-55dd-762b-a648-8cb07087ebc7	6254	Jelšane
00050000-55dd-762b-712b-9ea048f41770	4270	Jesenice
00050000-55dd-762b-9235-912255ca2020	8261	Jesenice na Dolenjskem
00050000-55dd-762b-d8ca-6910d3d9ff1a	3273	Jurklošter
00050000-55dd-762b-69f8-62692c87ac0b	2223	Jurovski Dol
00050000-55dd-762b-a73e-d41b57d2112d	2256	Juršinci
00050000-55dd-762b-bfc8-54871b809a33	5214	Kal nad Kanalom
00050000-55dd-762b-a37e-c62c0251947d	3233	Kalobje
00050000-55dd-762b-8696-552454a0fc5d	4246	Kamna Gorica
00050000-55dd-762b-89db-ae337ce551f0	2351	Kamnica
00050000-55dd-762b-0a53-348a6013fd58	1241	Kamnik
00050000-55dd-762b-8c31-a742b478f167	5213	Kanal
00050000-55dd-762b-8cac-dbb149708a29	8258	Kapele
00050000-55dd-762b-ca8a-18254e0cdcad	2362	Kapla
00050000-55dd-762b-acdc-133e4cc6ef02	2325	Kidričevo
00050000-55dd-762b-5d2c-e8c606d3c89c	1412	Kisovec
00050000-55dd-762b-204e-8e40dcc4322c	6253	Knežak
00050000-55dd-762b-ce74-9a6e68797760	5222	Kobarid
00050000-55dd-762b-34ab-b5981498005c	9227	Kobilje
00050000-55dd-762b-ef9b-74dc5b9a9535	1330	Kočevje
00050000-55dd-762b-969b-480f5de66c96	1338	Kočevska Reka
00050000-55dd-762b-4c4e-3061a27c312b	2276	Kog
00050000-55dd-762b-54fc-4f8a3eabd917	5211	Kojsko
00050000-55dd-762b-52fe-f8737ad2d7ec	6223	Komen
00050000-55dd-762b-8435-de2c34044a11	1218	Komenda
00050000-55dd-762b-826c-f034e99a60c6	6000	Koper/Capodistria 
00050000-55dd-762b-02dc-64dfd1c7064d	6001	Koper/Capodistria - poštni predali
00050000-55dd-762b-2826-69dc59ee7cf1	8282	Koprivnica
00050000-55dd-762b-005e-03b6aa903b67	5296	Kostanjevica na Krasu
00050000-55dd-762b-5117-05a9e64b6ca6	8311	Kostanjevica na Krki
00050000-55dd-762b-7a23-7b591e750491	1336	Kostel
00050000-55dd-762b-03a9-f89c08a3dfc4	6256	Košana
00050000-55dd-762b-d757-c869e30acd57	2394	Kotlje
00050000-55dd-762b-7151-f3eef1814eb0	6240	Kozina
00050000-55dd-762b-9822-7ae533fdc312	3260	Kozje
00050000-55dd-762b-036a-298e29c4d89f	4000	Kranj 
00050000-55dd-762b-ba9c-659c19292d60	4001	Kranj - poštni predali
00050000-55dd-762b-fb7f-911a3770bbc9	4280	Kranjska Gora
00050000-55dd-762b-c554-74e7db64feed	1281	Kresnice
00050000-55dd-762b-14e7-92a62adf430b	4294	Križe
00050000-55dd-762b-3210-e81ddaac2fd8	9206	Križevci
00050000-55dd-762b-0b64-4dce87bbff8a	9242	Križevci pri Ljutomeru
00050000-55dd-762b-32c1-c93d21b02e4c	1301	Krka
00050000-55dd-762b-9602-9e86c61f1cc1	8296	Krmelj
00050000-55dd-762b-833e-47be6ac54d0a	4245	Kropa
00050000-55dd-762b-3e9a-5178d0cdfc21	8262	Krška vas
00050000-55dd-762b-8618-4ae3b5d65468	8270	Krško
00050000-55dd-762b-7331-9a6834c85779	9263	Kuzma
00050000-55dd-762b-3835-0f9384cd6a7e	2318	Laporje
00050000-55dd-762b-dd47-551153355e52	3270	Laško
00050000-55dd-762b-e2f5-f1b05c640c02	1219	Laze v Tuhinju
00050000-55dd-762b-2f8e-d9516e89cd5a	2230	Lenart v Slovenskih goricah
00050000-55dd-762b-4a97-e8d02786c270	9220	Lendava/Lendva
00050000-55dd-762b-02e3-1e0566df0e38	4248	Lesce
00050000-55dd-762b-4a64-f36896e75778	3261	Lesično
00050000-55dd-762b-9996-a6c1aaf2db8d	8273	Leskovec pri Krškem
00050000-55dd-762b-bbda-d9db4a05e0a4	2372	Libeliče
00050000-55dd-762b-af53-a4cceb43affe	2341	Limbuš
00050000-55dd-762b-0ded-b612efa937a1	1270	Litija
00050000-55dd-762b-9f1e-934d11c3d768	3202	Ljubečna
00050000-55dd-762b-c1b6-a29679f67e39	1000	Ljubljana 
00050000-55dd-762b-6975-b35e4eb4ff61	1001	Ljubljana - poštni predali
00050000-55dd-762b-806e-fa62466826d7	1231	Ljubljana - Črnuče
00050000-55dd-762b-3240-9d6ce3622999	1261	Ljubljana - Dobrunje
00050000-55dd-762b-888e-fb2cb38fcfda	1260	Ljubljana - Polje
00050000-55dd-762b-44ca-c78aedf56000	1210	Ljubljana - Šentvid
00050000-55dd-762b-e2cf-0f8498e1fb58	1211	Ljubljana - Šmartno
00050000-55dd-762b-f5d7-9c5c13198de9	3333	Ljubno ob Savinji
00050000-55dd-762b-642a-5a4144934da6	9240	Ljutomer
00050000-55dd-762b-a062-5bdaf0faf494	3215	Loče
00050000-55dd-762b-66aa-0560bf305010	5231	Log pod Mangartom
00050000-55dd-762b-6a52-77eeb847aff5	1358	Log pri Brezovici
00050000-55dd-762b-3fae-8e459de5aa33	1370	Logatec
00050000-55dd-762b-f27a-40e31a76806f	1371	Logatec
00050000-55dd-762b-1996-75a146d3afa2	1434	Loka pri Zidanem Mostu
00050000-55dd-762b-3e71-802bf76f480a	3223	Loka pri Žusmu
00050000-55dd-762b-3cc5-e5e7204bbd9e	6219	Lokev
00050000-55dd-762b-d4a2-0cac4cc98f2b	1318	Loški Potok
00050000-55dd-762b-77af-0f1a2b060416	2324	Lovrenc na Dravskem polju
00050000-55dd-762b-ca63-10e2a481b155	2344	Lovrenc na Pohorju
00050000-55dd-762b-1bf0-0540e970bb5e	3334	Luče
00050000-55dd-762b-8610-3c2b25fec6b9	1225	Lukovica
00050000-55dd-762b-a8ad-5e8e39140726	9202	Mačkovci
00050000-55dd-762b-fffe-1d1c09297a4b	2322	Majšperk
00050000-55dd-762b-f230-e093799fb4ef	2321	Makole
00050000-55dd-762b-999f-03f90cf428c6	9243	Mala Nedelja
00050000-55dd-762b-bf90-462e6cce988b	2229	Malečnik
00050000-55dd-762b-b463-1fb86ea3e5ac	6273	Marezige
00050000-55dd-762b-515a-acba43c300ad	2000	Maribor 
00050000-55dd-762b-1586-339e29b07e92	2001	Maribor - poštni predali
00050000-55dd-762b-3a05-14c69c3624bb	2206	Marjeta na Dravskem polju
00050000-55dd-762b-a61e-54b14ad47310	2281	Markovci
00050000-55dd-762b-cbde-ca61553186f9	9221	Martjanci
00050000-55dd-762b-1dee-05e82c4f2afd	6242	Materija
00050000-55dd-762b-9184-32d4d0f6a889	4211	Mavčiče
00050000-55dd-762b-b20b-995de3a8ce3e	1215	Medvode
00050000-55dd-762b-936d-814929a6b6e2	1234	Mengeš
00050000-55dd-762b-8e22-75efada6b534	8330	Metlika
00050000-55dd-762b-b3bf-bceafa11f3e6	2392	Mežica
00050000-55dd-762b-ef5c-ecfee4efd32b	2204	Miklavž na Dravskem polju
00050000-55dd-762b-bbd2-f12b643eefaa	2275	Miklavž pri Ormožu
00050000-55dd-762b-453c-92c6dd16c71e	5291	Miren
00050000-55dd-762b-75ce-0f3e9713d83f	8233	Mirna
00050000-55dd-762b-9d7b-51d7e7290c6d	8216	Mirna Peč
00050000-55dd-762b-ec3d-8d4842c46d20	2382	Mislinja
00050000-55dd-762b-55ac-ad7c1d5c05a9	4281	Mojstrana
00050000-55dd-762b-4177-ead0507b3214	8230	Mokronog
00050000-55dd-762b-5aa1-e2d4c151ecce	1251	Moravče
00050000-55dd-762b-f000-3ad1b574611a	9226	Moravske Toplice
00050000-55dd-762b-3d28-5e0bb0fa659c	5216	Most na Soči
00050000-55dd-762b-bb9e-6dc902b4b3d8	1221	Motnik
00050000-55dd-762b-9dba-2adfc6d8050f	3330	Mozirje
00050000-55dd-762b-b568-83981123436c	9000	Murska Sobota 
00050000-55dd-762b-de87-81c70f753e6d	9001	Murska Sobota - poštni predali
00050000-55dd-762b-3aa1-22c1eb21f739	2366	Muta
00050000-55dd-762b-d17e-c2b71dbbdb38	4202	Naklo
00050000-55dd-762b-915f-93a9a6accdc1	3331	Nazarje
00050000-55dd-762b-345f-eb245f3e404c	1357	Notranje Gorice
00050000-55dd-762b-3474-944f8fade461	3203	Nova Cerkev
00050000-55dd-762b-83aa-6370114b5318	5000	Nova Gorica 
00050000-55dd-762b-29f4-8d67d79f281f	5001	Nova Gorica - poštni predali
00050000-55dd-762b-7560-2cfb858e4559	1385	Nova vas
00050000-55dd-762b-6959-0e3ae2cbfa0f	8000	Novo mesto
00050000-55dd-762b-a093-b36dbaef81fe	8001	Novo mesto - poštni predali
00050000-55dd-762b-a106-fb3b5083764e	6243	Obrov
00050000-55dd-762b-5c57-f1b893f342c4	9233	Odranci
00050000-55dd-762b-6c0c-4c9dcf6d40b7	2317	Oplotnica
00050000-55dd-762b-4c74-df9d32baaed3	2312	Orehova vas
00050000-55dd-762b-f7aa-fd9721b36fed	2270	Ormož
00050000-55dd-762b-6d3d-dd4ebf69dace	1316	Ortnek
00050000-55dd-762b-3416-fbddc6fe27ab	1337	Osilnica
00050000-55dd-762b-7846-582f05dc38e1	8222	Otočec
00050000-55dd-762b-cf6d-574ba4b27799	2361	Ožbalt
00050000-55dd-762b-ff0d-b6174837d973	2231	Pernica
00050000-55dd-762b-28d3-b325c32a211a	2211	Pesnica pri Mariboru
00050000-55dd-762b-fbc3-f9bda29ade80	9203	Petrovci
00050000-55dd-762b-4664-1ef7b9b83fe8	3301	Petrovče
00050000-55dd-762b-3614-5a165e545c8e	6330	Piran/Pirano
00050000-55dd-762b-12c3-6ff1d16131cf	8255	Pišece
00050000-55dd-762b-969f-df7d6a12a0e1	6257	Pivka
00050000-55dd-762b-5a46-d5be18cd642c	6232	Planina
00050000-55dd-762b-84fe-3fc653679d2f	3225	Planina pri Sevnici
00050000-55dd-762b-28ab-3219db728bfa	6276	Pobegi
00050000-55dd-762b-31b4-1df5cdd59689	8312	Podbočje
00050000-55dd-762b-b2c4-f36b8f2774fe	5243	Podbrdo
00050000-55dd-762b-4ae8-fe52b827fedc	3254	Podčetrtek
00050000-55dd-762b-974e-bdb1893fb836	2273	Podgorci
00050000-55dd-762b-cddc-ea1d4acb31d1	6216	Podgorje
00050000-55dd-762b-cbdd-316347edfe5e	2381	Podgorje pri Slovenj Gradcu
00050000-55dd-762b-eec6-3839b78d5b06	6244	Podgrad
00050000-55dd-762b-44db-de3182793318	1414	Podkum
00050000-55dd-762b-7d01-9c7a13110ee7	2286	Podlehnik
00050000-55dd-762b-feae-2e9462b7a8e3	5272	Podnanos
00050000-55dd-762b-6d1d-d51ae70c15f6	4244	Podnart
00050000-55dd-762b-b236-b5c0dbaf7eef	3241	Podplat
00050000-55dd-762b-ff6f-43c2760c08de	3257	Podsreda
00050000-55dd-762b-1c27-673a130a4ea8	2363	Podvelka
00050000-55dd-762b-ac4f-9fd1bf590e48	2208	Pohorje
00050000-55dd-762b-0f95-e0da3a5c9700	2257	Polenšak
00050000-55dd-762b-268b-1dcc849b4399	1355	Polhov Gradec
00050000-55dd-762b-b0ee-df8a77b458ad	4223	Poljane nad Škofjo Loko
00050000-55dd-762b-cb69-ccaf742eeee1	2319	Poljčane
00050000-55dd-762b-ed48-b0541908694b	1272	Polšnik
00050000-55dd-762b-5367-ec8380aa8acd	3313	Polzela
00050000-55dd-762b-437b-7c8804971c86	3232	Ponikva
00050000-55dd-762b-8b01-71483cfa8fcb	6320	Portorož/Portorose
00050000-55dd-762b-07bb-648d1a0151a8	6230	Postojna
00050000-55dd-762b-3bb7-1b82f495ae24	2331	Pragersko
00050000-55dd-762b-6c65-41505974211e	3312	Prebold
00050000-55dd-762b-0fa8-d0e15e05121c	4205	Preddvor
00050000-55dd-762b-a3df-fec54459adfb	6255	Prem
00050000-55dd-762b-698a-2337bb1177ac	1352	Preserje
00050000-55dd-762b-cfe5-d652ef3f58c1	6258	Prestranek
00050000-55dd-762b-0685-b94f13db4b68	2391	Prevalje
00050000-55dd-762b-3f95-e23eb329eb46	3262	Prevorje
00050000-55dd-762b-195e-d98388aace5d	1276	Primskovo 
00050000-55dd-762b-7248-1547d155a580	3253	Pristava pri Mestinju
00050000-55dd-762b-a0e5-4a64f8d803db	9207	Prosenjakovci/Partosfalva
00050000-55dd-762b-e29e-ad7c3a62ce6b	5297	Prvačina
00050000-55dd-762b-f2d2-dff1ef8164c7	2250	Ptuj
00050000-55dd-762b-d9af-b7c9d9c7e759	2323	Ptujska Gora
00050000-55dd-762b-c5cd-b056431c84bc	9201	Puconci
00050000-55dd-762b-0bee-9543eea26a5f	2327	Rače
00050000-55dd-762b-370a-b3570ba2b027	1433	Radeče
00050000-55dd-762b-08ed-7b78f13a029c	9252	Radenci
00050000-55dd-762b-24a6-622203483254	2360	Radlje ob Dravi
00050000-55dd-762b-b18c-fb0faa381bdf	1235	Radomlje
00050000-55dd-762b-8ad5-2157df110b1d	4240	Radovljica
00050000-55dd-762b-91c5-bf905aa27e15	8274	Raka
00050000-55dd-762b-bde1-2d8b3b4063f8	1381	Rakek
00050000-55dd-762b-bde0-68262303c00e	4283	Rateče - Planica
00050000-55dd-762b-a52a-2275e496ed06	2390	Ravne na Koroškem
00050000-55dd-762b-8570-78b5c82f42e8	9246	Razkrižje
00050000-55dd-762b-209c-77bb6005b128	3332	Rečica ob Savinji
00050000-55dd-762b-0c32-8ecc4c12b116	5292	Renče
00050000-55dd-762b-9f08-a0c8bf129077	1310	Ribnica
00050000-55dd-762b-0bf1-eb5ca3259e73	2364	Ribnica na Pohorju
00050000-55dd-762b-b44c-56c51f021274	3272	Rimske Toplice
00050000-55dd-762b-eace-05fa9150102b	1314	Rob
00050000-55dd-762b-2dd1-4e64a6330a21	5215	Ročinj
00050000-55dd-762b-1977-139778065613	3250	Rogaška Slatina
00050000-55dd-762b-6359-894aef231e66	9262	Rogašovci
00050000-55dd-762b-fb81-7a2ac260c247	3252	Rogatec
00050000-55dd-762b-3cf8-90fe6f165e9b	1373	Rovte
00050000-55dd-762b-1fe9-d00f176bb9a3	2342	Ruše
00050000-55dd-762b-9a9e-89f5313d8ccf	1282	Sava
00050000-55dd-762b-00c7-494e0b2bfeba	6333	Sečovlje/Sicciole
00050000-55dd-762b-c2a4-1e7be77ff233	4227	Selca
00050000-55dd-762b-68dd-2e36d2e231a6	2352	Selnica ob Dravi
00050000-55dd-762b-95a9-71badc2834ca	8333	Semič
00050000-55dd-762b-e596-8def10fc9ac8	8281	Senovo
00050000-55dd-762b-24e7-22eef0454d48	6224	Senožeče
00050000-55dd-762b-156f-d9ad4491b130	8290	Sevnica
00050000-55dd-762b-d91a-f9ac0be17578	6210	Sežana
00050000-55dd-762b-ca9a-25e063f7d4a3	2214	Sladki Vrh
00050000-55dd-762b-b242-5f7306e95645	5283	Slap ob Idrijci
00050000-55dd-762b-48c4-84931f5e2ece	2380	Slovenj Gradec
00050000-55dd-762b-9b33-844c3c2f0bb2	2310	Slovenska Bistrica
00050000-55dd-762b-ed0c-b8049b841417	3210	Slovenske Konjice
00050000-55dd-762b-28c7-6c91ed721562	1216	Smlednik
00050000-55dd-762b-aaaa-4fe0255bf194	5232	Soča
00050000-55dd-762b-ba18-8cfb64152923	1317	Sodražica
00050000-55dd-762b-a53f-78c5c51e5438	3335	Solčava
00050000-55dd-762b-5533-f655a938975c	5250	Solkan
00050000-55dd-762b-89ed-b5368fa20471	4229	Sorica
00050000-55dd-762b-404e-93ed20590af9	4225	Sovodenj
00050000-55dd-762b-3df3-74741850d080	5281	Spodnja Idrija
00050000-55dd-762b-f0da-fe316716a3a0	2241	Spodnji Duplek
00050000-55dd-762b-c50a-93e92be91ff1	9245	Spodnji Ivanjci
00050000-55dd-762b-01e8-f6e7c29dd189	2277	Središče ob Dravi
00050000-55dd-762b-a23b-4067920121d8	4267	Srednja vas v Bohinju
00050000-55dd-762b-1c6e-5a882ceebe3f	8256	Sromlje 
00050000-55dd-762b-e7e1-5a8aad90d45d	5224	Srpenica
00050000-55dd-762b-da52-56f09a0f197b	1242	Stahovica
00050000-55dd-762b-b1a9-e3fbc08e553e	1332	Stara Cerkev
00050000-55dd-762b-f7b1-042f4b50dfe6	8342	Stari trg ob Kolpi
00050000-55dd-762b-662d-d95e3504e618	1386	Stari trg pri Ložu
00050000-55dd-762b-80c8-63a1a5383596	2205	Starše
00050000-55dd-762b-bac1-e3394ed9a5aa	2289	Stoperce
00050000-55dd-762b-b08b-5537be89f1f2	8322	Stopiče
00050000-55dd-762b-efe5-9c9977653304	3206	Stranice
00050000-55dd-762b-e601-95526524be8c	8351	Straža
00050000-55dd-762b-4314-1368848073d6	1313	Struge
00050000-55dd-762b-0316-119487949821	8293	Studenec
00050000-55dd-762b-9ab4-ee462230e8c4	8331	Suhor
00050000-55dd-762b-4d50-53b1a1403821	2233	Sv. Ana v Slovenskih goricah
00050000-55dd-762b-b9d1-0da141aad133	2235	Sv. Trojica v Slovenskih goricah
00050000-55dd-762b-0fa5-9839a11058d8	2353	Sveti Duh na Ostrem Vrhu
00050000-55dd-762b-ec89-eef6b473add8	9244	Sveti Jurij ob Ščavnici
00050000-55dd-762b-5900-2a2e4fb81501	3264	Sveti Štefan
00050000-55dd-762b-5781-1f95691edddb	2258	Sveti Tomaž
00050000-55dd-762b-3c6f-77008f28d193	9204	Šalovci
00050000-55dd-762b-48b9-fe25c1d50f07	5261	Šempas
00050000-55dd-762b-51dd-6fefa1caa630	5290	Šempeter pri Gorici
00050000-55dd-762b-b3be-37b543a09059	3311	Šempeter v Savinjski dolini
00050000-55dd-762b-7220-d98a7c03c5ed	4208	Šenčur
00050000-55dd-762b-450a-94683d07d488	2212	Šentilj v Slovenskih goricah
00050000-55dd-762b-1bfa-d5362d255cf8	8297	Šentjanž
00050000-55dd-762b-36bf-e1501a3e6e02	2373	Šentjanž pri Dravogradu
00050000-55dd-762b-99ae-be4a6609a3de	8310	Šentjernej
00050000-55dd-762b-1246-139d6ff0d7ad	3230	Šentjur
00050000-55dd-762b-0c1e-a312277d1f8b	3271	Šentrupert
00050000-55dd-762b-6534-0990c49e1690	8232	Šentrupert
00050000-55dd-762b-141e-b0d9b0731cc9	1296	Šentvid pri Stični
00050000-55dd-762b-8073-36b20df08d1f	8275	Škocjan
00050000-55dd-762b-2274-fc8093a5cc84	6281	Škofije
00050000-55dd-762b-f12b-00345989cd66	4220	Škofja Loka
00050000-55dd-762b-13b7-aba5565eca2e	3211	Škofja vas
00050000-55dd-762b-5fb4-dc667b3d9587	1291	Škofljica
00050000-55dd-762b-bec1-a1858364cf29	6274	Šmarje
00050000-55dd-762b-4323-1d3c81d9fcfb	1293	Šmarje - Sap
00050000-55dd-762b-7fba-a75b06d438a3	3240	Šmarje pri Jelšah
00050000-55dd-762b-b0be-33c98102e91f	8220	Šmarješke Toplice
00050000-55dd-762b-fcce-996ebdedf19b	2315	Šmartno na Pohorju
00050000-55dd-762b-ee58-d8309b6a38ba	3341	Šmartno ob Dreti
00050000-55dd-762b-aaec-4e44033ce723	3327	Šmartno ob Paki
00050000-55dd-762b-1672-a9257ec30f33	1275	Šmartno pri Litiji
00050000-55dd-762b-e6dc-6927b83348af	2383	Šmartno pri Slovenj Gradcu
00050000-55dd-762b-ab6b-e813e027c283	3201	Šmartno v Rožni dolini
00050000-55dd-762b-e84d-065e3c8db3f1	3325	Šoštanj
00050000-55dd-762b-c5a8-4eb5c0d72157	6222	Štanjel
00050000-55dd-762b-3298-f13bee41f84c	3220	Štore
00050000-55dd-762b-03d3-1c56acc0ae3c	3304	Tabor
00050000-55dd-762b-6ff9-ab6fbd02c4e0	3221	Teharje
00050000-55dd-762b-042e-958be0a28f1f	9251	Tišina
00050000-55dd-762b-33b3-ee802caa7629	5220	Tolmin
00050000-55dd-762b-d47d-34e57d81b7b4	3326	Topolšica
00050000-55dd-762b-ea74-8696ce2431e7	2371	Trbonje
00050000-55dd-762b-7ae9-f0d39cead70a	1420	Trbovlje
00050000-55dd-762b-30b6-a6128154c3ab	8231	Trebelno 
00050000-55dd-762b-27af-931f590b74c4	8210	Trebnje
00050000-55dd-762b-eb7a-25ebcec4c453	5252	Trnovo pri Gorici
00050000-55dd-762b-e102-ad12cf34b16d	2254	Trnovska vas
00050000-55dd-762b-2d7c-c76654474981	1222	Trojane
00050000-55dd-762b-1d0e-665e59d2e9b8	1236	Trzin
00050000-55dd-762b-805b-11713ac1b434	4290	Tržič
00050000-55dd-762b-f419-35d1aa26d5e2	8295	Tržišče
00050000-55dd-762b-48a8-20514b11c782	1311	Turjak
00050000-55dd-762b-4c9e-a835e51fa44d	9224	Turnišče
00050000-55dd-762b-f885-46ac1d8599c5	8323	Uršna sela
00050000-55dd-762b-481d-8e6fe64bc098	1252	Vače
00050000-55dd-762b-3c6e-fc68881f0baa	3320	Velenje 
00050000-55dd-762b-0d03-accf8283f3b8	3322	Velenje - poštni predali
00050000-55dd-762b-9601-b6f12106a8a0	8212	Velika Loka
00050000-55dd-762b-659a-a72d6c404bfe	2274	Velika Nedelja
00050000-55dd-762b-9f34-6ffce54040e8	9225	Velika Polana
00050000-55dd-762b-3c71-d2a8665bef60	1315	Velike Lašče
00050000-55dd-762b-03e9-664c1ce63391	8213	Veliki Gaber
00050000-55dd-762b-53a3-1beef81a5422	9241	Veržej
00050000-55dd-762b-5e53-9ae74d5d040e	1312	Videm - Dobrepolje
00050000-55dd-762b-f087-be967680f6dd	2284	Videm pri Ptuju
00050000-55dd-762b-a6c5-5da75affea2e	8344	Vinica
00050000-55dd-762b-6a38-621e663b2a4d	5271	Vipava
00050000-55dd-762b-bdce-ff21b2cdb519	4212	Visoko
00050000-55dd-762b-0f67-f4a145ff3e5c	1294	Višnja Gora
00050000-55dd-762b-e317-8b14d0c06d55	3205	Vitanje
00050000-55dd-762b-9d82-38828a82aaa3	2255	Vitomarci
00050000-55dd-762b-0a18-caf766e35eb7	1217	Vodice
00050000-55dd-762b-8725-f75194f7c4ae	3212	Vojnik\t
00050000-55dd-762b-ff21-7f4ecefdb7da	5293	Volčja Draga
00050000-55dd-762b-fec1-fac46e5163f9	2232	Voličina
00050000-55dd-762b-2fd2-b679940afc02	3305	Vransko
00050000-55dd-762b-5ba4-f2b8f3a6716f	6217	Vremski Britof
00050000-55dd-762b-e723-6155f69e5518	1360	Vrhnika
00050000-55dd-762b-3013-5131c8f42a5d	2365	Vuhred
00050000-55dd-762b-5e72-313c031b4849	2367	Vuzenica
00050000-55dd-762b-7736-e5e2a9f1d7e6	8292	Zabukovje 
00050000-55dd-762b-17f8-2c6015bb7875	1410	Zagorje ob Savi
00050000-55dd-762b-8823-4c463e794361	1303	Zagradec
00050000-55dd-762b-e928-71321f3336a9	2283	Zavrč
00050000-55dd-762b-df5a-d43937538418	8272	Zdole 
00050000-55dd-762b-9cec-babfc8cde117	4201	Zgornja Besnica
00050000-55dd-762b-1751-02c50d6b0095	2242	Zgornja Korena
00050000-55dd-762b-a4b0-5754945b48e9	2201	Zgornja Kungota
00050000-55dd-762b-4167-573043a0065c	2316	Zgornja Ložnica
00050000-55dd-762b-12a7-64717d8620da	2314	Zgornja Polskava
00050000-55dd-762b-7b96-a07dcf6f174d	2213	Zgornja Velka
00050000-55dd-762b-4b82-4f7044969428	4247	Zgornje Gorje
00050000-55dd-762b-dbcd-c1feba81bbc2	4206	Zgornje Jezersko
00050000-55dd-762b-97b1-ca04fe160a86	2285	Zgornji Leskovec
00050000-55dd-762b-9075-04b08ba3542c	1432	Zidani Most
00050000-55dd-762b-a95d-275d0bc58887	3214	Zreče
00050000-55dd-762b-f9c1-e7c1385a99c5	4209	Žabnica
00050000-55dd-762b-8866-7e7e8f8c3df8	3310	Žalec
00050000-55dd-762b-ea4e-2aeb5c1951ed	4228	Železniki
00050000-55dd-762b-4ed1-ddfa8a3605e1	2287	Žetale
00050000-55dd-762b-36b0-74951e7a2ad9	4226	Žiri
00050000-55dd-762b-e50b-934559cfb246	4274	Žirovnica
00050000-55dd-762b-78b2-efba2d7ebf95	8360	Žužemberk
\.


--
-- TOC entry 2928 (class 0 OID 15563726)
-- Dependencies: 200
-- Data for Name: postavkaracuna; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkaracuna (id, racun_id) FROM stdin;
\.


--
-- TOC entry 2910 (class 0 OID 15563533)
-- Dependencies: 182
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
\.


--
-- TOC entry 2916 (class 0 OID 15563611)
-- Dependencies: 188
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, gostujoc_id) FROM stdin;
\.


--
-- TOC entry 2930 (class 0 OID 15563738)
-- Dependencies: 202
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 2954 (class 0 OID 15564085)
-- Dependencies: 226
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, koproducent_id, odstotekfinanciranja, delez, maticnikop, kpe, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 2955 (class 0 OID 15564095)
-- Dependencies: 227
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, sifra, status) FROM stdin;
00190000-55dd-762d-f43b-09243b101057	00080000-55dd-762d-4ddf-0b256b6467ac	0987	AK
00190000-55dd-762d-b770-bc98ddad806f	00080000-55dd-762d-ffd6-696ffc4a0b40	0989	AK
00190000-55dd-762d-b19f-55036777c30b	00080000-55dd-762d-4e4e-8b6177c88d2d	0986	AK
00190000-55dd-762d-a9de-020ee9f430ad	00080000-55dd-762d-bb16-4cc8f7c0b385	0984	AK
00190000-55dd-762d-37ff-1090f9d135f5	00080000-55dd-762d-473a-f7548c51532a	0983	AK
00190000-55dd-762d-6c4a-68f3763cf2e8	00080000-55dd-762d-d93e-137beb14eccf	0982	AK
00190000-55dd-762e-cd3a-daa9b6806e9d	00080000-55dd-762e-fa2a-4c138c70de9d	1001	AK
\.


--
-- TOC entry 2953 (class 0 OID 15564041)
-- Dependencies: 225
-- Data for Name: programdela; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programdela (id, sezona_id, sifra, naziv, zacetek, konec, zakljuceno, potrjenprogram, stpremier, stint, stfest, strazno, stizjem, stponprem, stponprej, stponprejvelikih, stponprejmalih, stponprejmalihkopr, stponprejsredkopr, stponprejvelikihkopr, stgostujo, vrps1, vrps1do, vrps1mat, vrps1gostovsz, stizvnekomerc, stizvprem, stizvponprem, stizvponpremdoma, stizvponpremzamejo, stizvponpremgost, stizvponpremkopr, stizvponpremint, stizvponpremkoprint, stizvponprej, stizvponprejdoma, stizvponprejzamejo, stizvponprejgost, stizvponprejkopr, stizvponprejint, stizvponprejkoprint, stizvgostuj, stizvostalihnek, stizvgostovanjslo, stizvgostovanjzam, stizvgostovanjint, stobisknekom, stobisknekommat, stobisknekomgostslo, stobisknekomgostzam, stobisknekomgostint, stobiskprem, stobiskponprem, stobiskponpremdoma, stobiskponpremkopr, stobiskponpremkoprint, avgobiskprired, avgzaseddvoran, avgcenavstopnice, stprodvstopnic, stkoprodukcij, stkoprodukcijint, stkoprodukcijnvo, stzaposlenih, stzaposigralcev, avgstnastopovigr, sthonorarnih, sthonorarnihigr, sthonorarnihigrtujjz, sthonorarnihigrsamoz, sredstvaint, sredstvaavt, sredstvazaprosenoprem, sredstvazaprosenoponprem, sredstvazaprosenoponprej, sredstvazaprosenogostujo, sredstvazaprosenoint, sredstvazaprosenofest, sredstvazaprosenorazno, sredstvazaprosenoizjem, sredstvadrugijavniprem, sredstvadrugijavniponprem, sredstvadrugijavniponprej, sredstvadrugijavnigostujo, sredstvadrugijavniint, sredstvadrugijavnifest, sredstvadrugijavnirazno, sredstvadrugijavniizjem, sredstvadrugiviriprem, sredstvadrugiviriponprem, sredstvadrugiviriponprej, sredstvadrugivirigostujo, sredstvadrugiviriint, sredstvadrugivirifest, sredstvadrugivirirazno, sredstvadrugiviriizjem, sredstvaavtsamoz) FROM stdin;
00290000-55dd-762d-ff7e-62dab70acc2b	\N	0001	Testni program dela	2016-02-01	2017-02-01	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 2956 (class 0 OID 15564103)
-- Dependencies: 228
-- Data for Name: programskaenotasklopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programskaenotasklopa (id, naslovpe, avtorpe, obsegpe, mesecpe, vrednostpe, programrazno_id) FROM stdin;
\.


--
-- TOC entry 2934 (class 0 OID 15563767)
-- Dependencies: 206
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, sifra, naziv, jeprizorisce, kapaciteta, opis) FROM stdin;
00220000-55dd-762d-787c-011906034386	0001	Poskusna 1	f	8	Poskusna učilnica v prvem
00220000-55dd-762d-d0c9-6be76add8402	0002	Poskusna 3	f	34	Poskusna učilnica v tretjem
00220000-55dd-762d-1d5e-82ad4b7cf4e7	0003	Kazinska	t	84	Kazinska dvorana
00220000-55dd-762d-a636-154f2afee12f	0004	Mali oder	t	24	Mali oder 
00220000-55dd-762d-c3bc-8736accb4512	0005	Komorni oder	t	15	Komorni oder
00220000-55dd-762d-80c5-6bbe37b5e51d	0006	Stara dvorana	t	96	Stara dvorana ali dvorana Franceta Prešerna
00220000-55dd-762d-3980-6259f225c252	0007	Velika dvorana	t	160	Velika, glavna dvorana
\.


--
-- TOC entry 2926 (class 0 OID 15563711)
-- Dependencies: 198
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 2925 (class 0 OID 15563701)
-- Dependencies: 197
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 2946 (class 0 OID 15563896)
-- Dependencies: 218
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta, status) FROM stdin;
\.


--
-- TOC entry 2941 (class 0 OID 15563835)
-- Dependencies: 213
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 2899 (class 0 OID 15563406)
-- Dependencies: 171
-- Data for Name: revizije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY revizije (id, razred, objectid, upor, datum, tip, data) FROM stdin;
1	App\\Entity\\Popa	00080000-55dd-762e-fa2a-4c138c70de9d	00010000-55dd-762c-ef63-3d5b4498c34e	2015-08-26 10:17:50	INS	a:0:{}
2	App\\Entity\\Option	00000000-55dd-762e-da35-60b57e3c6b63	00010000-55dd-762c-ef63-3d5b4498c34e	2015-08-26 10:17:50	INS	a:0:{}
3	ProgramDela\\Entity\\ProdukcijskaHisa	00190000-55dd-762e-cd3a-daa9b6806e9d	00010000-55dd-762c-ef63-3d5b4498c34e	2015-08-26 10:17:50	INS	a:0:{}
\.


--
-- TOC entry 2977 (class 0 OID 0)
-- Dependencies: 170
-- Name: revizije_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('revizije_id_seq', 3, true);


--
-- TOC entry 2935 (class 0 OID 15563777)
-- Dependencies: 207
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 2903 (class 0 OID 15563444)
-- Dependencies: 175
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-55dd-762c-21e1-03685ce0aae0	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-55dd-762c-f4c7-10f7efdde3eb	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-55dd-762c-babf-70d5d5cf1626	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-55dd-762c-4e1e-a185e2ee9152	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-55dd-762c-15c5-bd68bc3d0189	planer	Planer dogodkov v koledarju	t
00020000-55dd-762c-c5f0-f3cbe7063aec	kadrovska	Kadrovska služba	t
00020000-55dd-762c-549e-cdf36e7e3571	arhivar	Ažuriranje arhivalij	t
00020000-55dd-762c-a8bf-23a212fc08b9	igralec	Igralec	t
00020000-55dd-762c-6d61-c0d23f0b56a6	prisotnost	Vnašalec prisotnosti, tudi za tiste izven uprizoritev	t
00020000-55dd-762d-c950-b90affa86f9b	vsadovoljenja	Vloga z vsemi posameznimi dovoljenji	t
\.


--
-- TOC entry 2901 (class 0 OID 15563428)
-- Dependencies: 173
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-55dd-762c-dbaa-49ebde405548	00020000-55dd-762c-babf-70d5d5cf1626
00010000-55dd-762c-ef63-3d5b4498c34e	00020000-55dd-762c-babf-70d5d5cf1626
00010000-55dd-762d-c00a-722f2930a8e6	00020000-55dd-762d-c950-b90affa86f9b
\.


--
-- TOC entry 2937 (class 0 OID 15563791)
-- Dependencies: 209
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 2929 (class 0 OID 15563732)
-- Dependencies: 201
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 2923 (class 0 OID 15563678)
-- Dependencies: 195
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, sifra, ime, zacetek, konec, aktivna) FROM stdin;
\.


--
-- TOC entry 2961 (class 0 OID 15564144)
-- Dependencies: 233
-- Data for Name: stevilcenje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenje (id, sifra, naziv, prefix, suffix, zacetek, dolzina, format, globalno, poletih) FROM stdin;
00230000-55dd-762c-0aa3-6314a19e5f68	pri	Privzeto številčenje po letih YYYY-N	\N	\N	1	1	%l-%n	f	t
00230000-55dd-762c-a25c-f61b23d29735	123	Privzeto številčenje kratkih šifer	\N	\N	100	3	%n	f	f
00230000-55dd-762c-252d-9ea528b38075	bcd	Globalno številčenje črtnih kod	\N	\N	1	9	%n	t	f
00230000-55dd-762c-63cd-fca329a979ec	sif	Številčenje šifrant	\N	\N	1000	4	%n	t	f
00230000-55dd-762c-70ce-5ba55c0a0336	tmp	Globalno številčenje začasnih številk	tmp	\N	1000	5	%l%n	t	t
\.


--
-- TOC entry 2960 (class 0 OID 15564136)
-- Dependencies: 232
-- Data for Name: stevilcenjekonfig; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjekonfig (id, stevilcenje_id, dok) FROM stdin;
00240000-55dd-762c-b65f-dc324b312c88	00230000-55dd-762c-63cd-fca329a979ec	popa
00240000-55dd-762c-064a-bb74386efece	00230000-55dd-762c-63cd-fca329a979ec	oseba
00240000-55dd-762c-16d0-44086aaa80ec	00230000-55dd-762c-63cd-fca329a979ec	sezona
00240000-55dd-762c-21b9-f90198a7ac9a	00230000-55dd-762c-a25c-f61b23d29735	prostor
00240000-55dd-762c-19da-b31f2a401d74	00230000-55dd-762c-63cd-fca329a979ec	besedilo
00240000-55dd-762c-a1e6-11529bf179c8	00230000-55dd-762c-63cd-fca329a979ec	uprizoritev
00240000-55dd-762c-5e4d-285ad36a0c69	00230000-55dd-762c-63cd-fca329a979ec	funkcija
00240000-55dd-762c-9f70-1e20b0c0de69	00230000-55dd-762c-63cd-fca329a979ec	tipfunkcije
00240000-55dd-762c-8e83-9ce081dae08c	00230000-55dd-762c-63cd-fca329a979ec	alternacija
00240000-55dd-762c-86b9-5525160e0415	00230000-55dd-762c-0aa3-6314a19e5f68	pogodba
00240000-55dd-762c-562a-5c21c88108a4	00230000-55dd-762c-63cd-fca329a979ec	zaposlitev
00240000-55dd-762c-3c81-e35993e3a1c4	00230000-55dd-762c-0aa3-6314a19e5f68	programdela
00240000-55dd-762c-3c97-053a7ad74fef	00230000-55dd-762c-63cd-fca329a979ec	zapis
\.


--
-- TOC entry 2959 (class 0 OID 15564131)
-- Dependencies: 231
-- Data for Name: stevilcenjestanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjestanje (id, objid, leto, stevilka) FROM stdin;
cb5975b4-c15b-4005-9ef5-e759268f2957	00230000-55dd-762c-63cd-fca329a979ec	0	1001
\.


--
-- TOC entry 2942 (class 0 OID 15563845)
-- Dependencies: 214
-- Data for Name: strosekuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY strosekuprizoritve (id, uprizoritev_id, popa_id, naziv, vrednostdo, vrednostna, opis, tipstroska, sort, vrstastroska_id) FROM stdin;
00270000-55dd-762d-afad-181b5bf8a689	000e0000-55dd-762d-5dbb-ddcb9eb8dfcf	00080000-55dd-762d-9177-919a4cd77672	Nabava kostumov	600.50	20.00	Krila in maske	materialni	1	003b0000-55dd-762c-7391-2bd9047766f6
00270000-55dd-762d-3c04-e626dba5e022	000e0000-55dd-762d-5dbb-ddcb9eb8dfcf	00080000-55dd-762d-9177-919a4cd77672	Zavese	125.70	3.10	Modra in zelena zavesa	materialni	2	003b0000-55dd-762c-7391-2bd9047766f6
00270000-55dd-762d-7229-c29c5c8be24c	000e0000-55dd-762d-5dbb-ddcb9eb8dfcf	00080000-55dd-762d-664b-9aecf4d9be62	Avtorske pravice	300.00	30.00	Odkup avtorskih pravic	avtorprav	4	\N
\.


--
-- TOC entry 2908 (class 0 OID 15563506)
-- Dependencies: 180
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 2924 (class 0 OID 15563688)
-- Dependencies: 196
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja) FROM stdin;
001a0000-55dd-762d-3fdd-aacd6528c71f	00180000-55dd-762d-fe11-9cc48d5ecdf7	000c0000-55dd-762d-4e3a-a653fec73e3f	00090000-55dd-762d-c9ae-0e9ab658ed7c	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55dd-762d-6378-58d4e79412b2	00180000-55dd-762d-fe11-9cc48d5ecdf7	000c0000-55dd-762d-a2cc-f17ac5f78a3c	00090000-55dd-762d-94cd-a3afc67b9bcb	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55dd-762d-1a31-8efc637c151c	00180000-55dd-762d-fe11-9cc48d5ecdf7	000c0000-55dd-762d-391b-222af9bba9ac	00090000-55dd-762d-e62e-1f3bfa94aaa9	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55dd-762d-e6ed-8941f3fc9539	00180000-55dd-762d-fe11-9cc48d5ecdf7	000c0000-55dd-762d-b758-bdd706c92f3b	00090000-55dd-762d-29e1-0ccd97530dc0	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55dd-762d-dd30-65606b44927c	00180000-55dd-762d-fe11-9cc48d5ecdf7	000c0000-55dd-762d-c144-4fb6e1a1b22a	00090000-55dd-762d-b93e-1c4d8dda330f	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55dd-762d-f7f9-74cb98fff2fb	00180000-55dd-762d-2582-5979fe968509	\N	00090000-55dd-762d-b93e-1c4d8dda330f	2015-08-01 20:00:00	2015-08-01 23:00:00	\N	\N	2.00
\.


--
-- TOC entry 2945 (class 0 OID 15563885)
-- Dependencies: 217
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, ime, opis, imezenski, podrocje) FROM stdin;
000f0000-55dd-762c-56bf-2178b0108126	Avtor	Avtorji	Avtorka	umetnik
000f0000-55dd-762c-c117-45db772d1905	Priredba	Priredba	Priredba	umetnik
000f0000-55dd-762c-8fdc-d70ed4b1a30d	Prevod	Prevod	Prevod	umetnik
000f0000-55dd-762c-b976-e15b92042b23	Režija	Režija	Režija	umetnik
000f0000-55dd-762c-9322-7631702d2ac6	Dramaturgija	Dramaturgija	Dramaturgija	umetnik
000f0000-55dd-762c-0293-8c567bc12ffd	Scenografija	Scenografija	Scenografija	umetnik
000f0000-55dd-762c-fe6a-ed5fe9f91546	Kostumografija	Kostumografija	Kostumografija	umetnik
000f0000-55dd-762c-3bbc-22ae15090742	Koreografija	Koreografija	Koreografija	umetnik
000f0000-55dd-762c-fb5b-a15e2d66831b	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	umetnik
000f0000-55dd-762c-ad77-a2827b4b06b2	Oblikovanje maske	Oblikovanje maske	Oblikovanje maske	umetnik
000f0000-55dd-762c-9dd0-07f1db650889	Lektorstvo	Lektorstvo	Lektorstvo	umetnik
000f0000-55dd-762c-1283-90044dfde69b	Glasbeni soustvarjalec	Glasbeni soustvarjalci	Glasbena soustvarjalka	umetnik
000f0000-55dd-762c-f0a7-3baf5140eb29	Intermedijski ustvarjalec	Intermedijski ustvarjalci	Intermedijski ustvarjalka	umetnik
000f0000-55dd-762c-af7e-f475a1f56fe3	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	umetnik
000f0000-55dd-762c-1aee-e318c68247f9	Vloga	Intermedijski ustvarjalci	Intermedijska ustvarjalka	igralec
000f0000-55dd-762c-2d14-94698b6b6397	Produkcija, mentorstvo	Produkcija, mentorstvo	Produkcija, mentorstvo	umetnik
000f0000-55dd-762c-4219-ceb957865a83	Tehnična podpora	Tehnična podpora	Tehnična podpora	tehnik
000f0000-55dd-762c-8173-19bbedce476d	Inšpicient	Inšpicienti	Inšpicientka	inspicient
\.


--
-- TOC entry 2957 (class 0 OID 15564113)
-- Dependencies: 229
-- Data for Name: tipprogramskeenote; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipprogramskeenote (id, sifra, naziv, koprodukcija, maxfaktor, maxvsi) FROM stdin;
002b0000-55dd-762c-2b4a-65a542ce0f8d	01	Velika predstava	f	1.00	1.00
002b0000-55dd-762c-6bae-f1007b19f33e	02	Mala predstava	f	0.50	0.50
002b0000-55dd-762c-cd0b-c4a7fbb62e68	03	Mala koprodukcija	t	0.40	1.00
002b0000-55dd-762c-2f83-442180f02b5b	04	Srednja koprodukcija	t	0.70	2.00
002b0000-55dd-762c-e4c9-4d61395fdcf7	05	Velika koprodukcija	t	1.00	3.00
\.


--
-- TOC entry 2913 (class 0 OID 15563568)
-- Dependencies: 185
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 2900 (class 0 OID 15563415)
-- Dependencies: 172
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-55dd-762c-ef63-3d5b4498c34e	Konzolni	$2y$05$NS4xMjkyMTcwMzExMjAxROrdUPCoU9qky.3Vt2/YYgWAmK2rJJwaG	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-55dd-762d-0c64-4827697f113f	testni uporabnik za inšpicienta	$2y$05$NS4xMjkyMTcwMzExMjAxROxkJ1B6xAXex6EZLIwJfWzRJ8DpfecFO	t	\N	\N	\N	ivo@ifigenija.si	\N	\N	\N
00010000-55dd-762d-12d6-a95127bb66c3	testni uporabnik za Tehničnega vodjo	$2y$05$NS4xMjkyMTcwMzExMjAxROu/kXWR9sP9oamkesKuxXLbxkCb387.G	t	\N	\N	\N	tona@ifigenija.si	\N	\N	\N
00010000-55dd-762d-8ea9-03fdd0c90cde	testni uporabnik za igralca	$2y$05$NS4xMjkyMTcwMzExMjAxRO/hLCgClfERRsfCAFYwxNCcFIVjP2982	t	\N	\N	\N	irena@ifigenija.si	\N	\N	\N
00010000-55dd-762d-cd81-1683800f3502	testni uporabnik vnašalca termina storitev (TerminStoritve-vse)	$2y$05$NS4xMjkyMTcwMzExMjAxROT6.kTHqEq4.wa2SOnf124/N14m9qeP.	t	\N	\N	\N	tatjana@ifigenija.si	\N	\N	\N
00010000-55dd-762d-6845-47f9a7db6c4f	testni uporabnik, ki je inšpicient brez zapisov v TerminStoritve	$2y$05$NS4xMjkyMTcwMzExMjAxROHau47Dtb7CME5.nlWwBVM.nusFP.ra2	t	\N	\N	\N	joze@ifigenija.si	\N	\N	\N
00010000-55dd-762d-2ed5-ac2e25917648	testna uporabnica, ki je planerka	$2y$05$NS4xMjkyMTcwMzExMjAxRO.B/uJO3C7QRNhdX9Q2hTLQsSupj1V1S	t	\N	\N	\N	petra@ifigenija.si	\N	\N	\N
00010000-55dd-762d-4fb2-e6db8954f1d2	testni uporabnik, ki dobi ifi-all vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROv2d7jqhaV/Mz3EIsKoi7UoFR.SDSMBm	t	\N	\N	\N	ali@ifigenija.si	\N	\N	\N
00010000-55dd-762d-6713-a1f529e0e09f	testni uporabnik, ki dobi ifi-readall vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROYB9g.gnkufr1l/gWK6mkx.ySqrOWnJC	t	\N	\N	\N	berta@ifigenija.si	\N	\N	\N
00010000-55dd-762d-6779-96cd5ff8d9a4	testni uporabnik, ki dobi aaa-write dovoljenje	$2y$05$NS4xMjkyMTcwMzExMjAxRORujYObKX.DzpXVYbePkiJkHqg0/Ylya	t	\N	\N	\N	aaron@ifigenija.si	\N	\N	\N
00010000-55dd-762d-c00a-722f2930a8e6	testni uporabnik ki dobi vsa posamezna dovoljenja	$2y$05$NS4xMjkyMTcwMzExMjAxRO2ymwxVXTr7U4Ncdn.bN49E8rLw9Jg0O	t	\N	\N	\N	vesna@ifigenija.si	\N	\N	\N
00010000-55dd-762c-dbaa-49ebde405548	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 2949 (class 0 OID 15563933)
-- Dependencies: 221
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, producent_id, sifra, faza, naslov, podnaslov, delovninaslov, internacionalninaslov, datumzacstudija, stevilovaj, planiranostevilovaj, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, kratkinaslov, maticnioder_id) FROM stdin;
000e0000-55dd-762d-80a8-db4275cfec8e	00160000-55dd-762d-2978-1ab08e05e896	00150000-55dd-762c-da2b-eec4d04a3279	00140000-55dd-762c-998a-55b33249b7d9	\N	0001	produkcija	Sen kresne noči		Sanje	\N	2016-02-01	\N	\N	2016-06-01	1	William Shakespeare	f	2				\N	f		00220000-55dd-762d-c3bc-8736accb4512
000e0000-55dd-762d-5dbb-ddcb9eb8dfcf	00160000-55dd-762d-9afd-ca8ef6a3f5d3	00150000-55dd-762c-0b21-5ee0ca2153d5	00140000-55dd-762c-d538-c692423e51dc	\N	0002	predprodukcija-ideja	Smoletov vrt			\N	2016-01-01	\N	\N	2016-04-20	2	B. Hočevar	f	2				\N	f		00220000-55dd-762d-80c5-6bbe37b5e51d
000e0000-55dd-762d-2ede-eb0141fdcb03	\N	00150000-55dd-762c-0b21-5ee0ca2153d5	00140000-55dd-762c-d538-c692423e51dc	00190000-55dd-762d-f43b-09243b101057	0003	postprodukcija	Kisli maček			\N	2016-02-01	\N	\N	2016-04-20	2	Caryl Churchill	t	2				\N	f		00220000-55dd-762d-c3bc-8736accb4512
000e0000-55dd-762d-bcc2-e3584e486085	\N	00150000-55dd-762c-0b21-5ee0ca2153d5	00140000-55dd-762c-d538-c692423e51dc	00190000-55dd-762d-f43b-09243b101057	0004	postprodukcija	Vladimir			\N	2017-03-01	\N	\N	2017-04-20	2	Matjaž Zupančič	t	2				\N	f		00220000-55dd-762d-c3bc-8736accb4512
000e0000-55dd-762d-29aa-ad2f96002b95	\N	00150000-55dd-762c-0b21-5ee0ca2153d5	00140000-55dd-762c-d538-c692423e51dc	00190000-55dd-762d-f43b-09243b101057	0005	postprodukcija	Španska princesa			\N	2017-04-01	\N	\N	2017-05-20	1	Nina Kokelj	f	1				\N	f		00220000-55dd-762d-787c-011906034386
000e0000-55dd-762d-f9e1-fd3ebea7251c	\N	00150000-55dd-762c-0b21-5ee0ca2153d5	00140000-55dd-762c-d538-c692423e51dc	00190000-55dd-762d-f43b-09243b101057	0006	postprodukcija	Ne vemo datumov			\N	\N	\N	\N	\N	1	Nandi Frafar	f	1				\N	f		00220000-55dd-762d-787c-011906034386
\.


--
-- TOC entry 2918 (class 0 OID 15563630)
-- Dependencies: 190
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, uprizoritev_id, zaporedna, porocilo) FROM stdin;
00200000-55dd-762d-8fe8-05400694031e	000e0000-55dd-762d-5dbb-ddcb9eb8dfcf	1	
00200000-55dd-762d-9727-1aa5329581d5	000e0000-55dd-762d-5dbb-ddcb9eb8dfcf	2	
\.


--
-- TOC entry 2933 (class 0 OID 15563759)
-- Dependencies: 205
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 2943 (class 0 OID 15563859)
-- Dependencies: 215
-- Data for Name: vrstastroska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstastroska (id, skupina, podskupina, naziv, opis) FROM stdin;
003b0000-55dd-762c-e643-4aeded7f36b3	1	0	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE
003b0000-55dd-762c-2e17-d8a56e6724fb	1	1	Storitve varovanja zgradb in prostorov	storitve varovanja zgradb in prostorov (npr. gasilci na predstavah)
003b0000-55dd-762c-43cc-3a35468335e4	1	2	Založniške in tiskarske storitve	založniške in tiskarske storitve
003b0000-55dd-762c-48d2-f0592e9e8ca5	1	3	Časopisi, revije, knjige in strokovna literatura	časopisi, revije, knjige in strokovna literatura
003b0000-55dd-762c-6f81-5233c77d026a	1	4	Stroški prevajalskih storitev	stroški prevajalskih storitev
003b0000-55dd-762c-3976-cc46e65c922c	1	5	Stroški oglaševalskih storitev	stroški oglaševalskih storitev
003b0000-55dd-762c-e587-350f68f8782e	1	6	Izdatki za reprezentanco	izdatki za reprezentanco
003b0000-55dd-762c-0b75-1e8aba05d476	2	0	POSEBNI MATERIAL IN STORITVE	POSEBNI MATERIAL IN STORITVE
003b0000-55dd-762c-7391-2bd9047766f6	2	1	Drugi posebni material in storitve	drugi posebni material in storitve (npr. za instrumete - navedite)
003b0000-55dd-762c-02dc-44d25c31847e	3	0	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE
003b0000-55dd-762c-1d5f-ebc363dd3b60	3	1	Poštnina in kurirske storitve	poštnina in kurirske storitve
003b0000-55dd-762c-4f81-5c3dec82bbbe	4	0	PREVOZNI STROŠKI IN STORITVE	PREVOZNI STROŠKI IN STORITVE
003b0000-55dd-762c-09da-1c1b088c778c	4	1	Goriva in maziva za prevozna sredstva	goriva in maziva za prevozna sredstva
003b0000-55dd-762c-0a4e-98302cc62141	4	2	Najem vozil in selitveni stroški	najem vozil in selitveni stroški
003b0000-55dd-762c-f486-718aae3ae08b	4	3	Drugi prevozni in transportni stroški 	drugi prevozni in transportni stroški (navedite)
003b0000-55dd-762c-3838-46501f5d1a58	5	0	IZDATKI ZA SLUŽBENA POTOVANJA	IZDATKI ZA SLUŽBENA POTOVANJA
003b0000-55dd-762c-aee6-fec15a1f99c0	5	1	Dnevnice za službena potovanja v državi in tujini	dnevnice za službena potovanja v državi in tujini
003b0000-55dd-762c-9f7e-3bc8a90e2fc2	5	2	Hotelske in restavra. storitve v državi in tujini	hotelske in restavra. storitve v državi in tujini
003b0000-55dd-762c-4d91-f017b9c02d9d	5	3	Stroški prevoza v državi in tujini	stroški prevoza v državi in tujini
003b0000-55dd-762c-ad94-b3ea3809ede7	5	4	Drugi izdatki za službena potovanja	drugi izdatki za službena potovanja (navedite)
003b0000-55dd-762c-8e40-1b7f6dd7dc55	6	0	NAJEMNINE IN ZAKUPNINE	NAJEMNINE IN ZAKUPNINE
003b0000-55dd-762c-b1f3-327520d83f1c	6	1	Druge najemnine, zakupnine in licenčnine	druge najemnine, zakupnine in licenčnine (npr. najem notnega materiala, instrumentov - navedite)
003b0000-55dd-762c-1cc5-1cf7f0a94cc9	7	0	DRUGI OPERATIVNI ODHODKI	DRUGI OPERATIVNI ODHODKI
003b0000-55dd-762c-c9ae-16d30e5896cd	7	1	Izdatki za strok. izobraževanje zap.	izdatki za strok. izobraževanje zap.(vezani na program. enote)  
\.


--
-- TOC entry 2963 (class 0 OID 15564183)
-- Dependencies: 235
-- Data for Name: vrstazapisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstazapisa (id, oznaka, naziv, aktiven, znacka, ikona, upor, datknj) FROM stdin;
\.


--
-- TOC entry 2962 (class 0 OID 15564155)
-- Dependencies: 234
-- Data for Name: zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapis (id, vrsta_id, datoteka_id, mapa_id, avtor_id, zaklenil_id, tip, zaklenjen, datumzaklepanja, identifier, subject, title, description, coverage, creator, language, date, publisher, relation, rights, source, upor, datknj, standard, lokacija) FROM stdin;
\.


--
-- TOC entry 2964 (class 0 OID 15564195)
-- Dependencies: 236
-- Data for Name: zapislastnik; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapislastnik (id, zapis_id, lastnik, classlastnika, datum, upor, datknj) FROM stdin;
\.


--
-- TOC entry 2940 (class 0 OID 15563828)
-- Dependencies: 212
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, sifra, status, zacetek, konec, tip, delovnaobveza, malica, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci) FROM stdin;
00100000-55dd-762d-afb0-e18b6a8cb1db	00090000-55dd-762d-94cd-a3afc67b9bcb	01	A	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55dd-762d-a557-0eff2c22acf7	00090000-55dd-762d-e62e-1f3bfa94aaa9	02	A	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55dd-762d-296f-239996d71fb9	00090000-55dd-762d-acff-27e4c706ee9c	03	A	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55dd-762d-f168-151bb8f56df3	00090000-55dd-762d-a37b-c17e0aa885bb	04	A	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55dd-762d-bdf9-69f027aba5fc	00090000-55dd-762d-c9ae-0e9ab658ed7c	05	A	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55dd-762d-8fa6-5cfd16a29e3e	00090000-55dd-762d-3350-e7f406b0df02	06	A	2010-02-01	2010-02-01	1	2		t	f	f	t
\.


--
-- TOC entry 2920 (class 0 OID 15563662)
-- Dependencies: 192
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id) FROM stdin;
\.


--
-- TOC entry 2948 (class 0 OID 15563923)
-- Dependencies: 220
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, sifra, naziv, opis) FROM stdin;
00140000-55dd-762c-998a-55b33249b7d9	01	Drama	drama (SURS 01)
00140000-55dd-762c-557e-0a6d0441b29e	02	Opera	opera (SURS 02)
00140000-55dd-762c-be4e-6b1233a6b46c	03	Balet	balet (SURS 03)
00140000-55dd-762c-da12-5f50c6040f83	04	Plesne prireditve	plesne prireditve (SURS 04)
00140000-55dd-762c-8f18-e57e2e0b6067	05	Lutkovno gledališče	lutkovno gledališče (SURS 05)
00140000-55dd-762c-d538-c692423e51dc	06	Raziskovalno gledališče	raziskovalno gledališče (SURS 06)
00140000-55dd-762c-4ee7-a611ec472bfb	07	Drugo	drugo (SURS 07)
\.


--
-- TOC entry 2939 (class 0 OID 15563818)
-- Dependencies: 211
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, sifra, naziv, opis) FROM stdin;
00150000-55dd-762c-565f-756c824e217f	01	Opera	opera
00150000-55dd-762c-5761-0fb55ebee97f	02	Opereta	opereta
00150000-55dd-762c-c4c8-a313e8df3b34	03	Balet	balet
00150000-55dd-762c-20c9-fec95387f5da	04	Plesne prireditve	plesne prireditve
00150000-55dd-762c-74dc-ee96bdf0b7ce	05	Lutkovno gledališče	lutkovno gledališče
00150000-55dd-762c-92d4-f4d395a59ee6	06	Raziskovalno gledališče	raziskovalno gledališče
00150000-55dd-762c-8cb0-ebe59f248b39	07	Biografska drama	biografska drama
00150000-55dd-762c-da2b-eec4d04a3279	08	Komedija	komedija
00150000-55dd-762c-617d-62ed2fb95826	09	Črna komedija	črna komedija
00150000-55dd-762c-dc14-075c53d136f2	10	E-igra	E-igra
00150000-55dd-762c-0b21-5ee0ca2153d5	11	Kriminalka	kriminalka
00150000-55dd-762c-24a7-3cb4efc67e9c	12	Musical	musical
\.


--
-- TOC entry 2446 (class 2606 OID 15563469)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2622 (class 2606 OID 15563980)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2618 (class 2606 OID 15563970)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2595 (class 2606 OID 15563884)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2685 (class 2606 OID 15564235)
-- Name: datoteka_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT datoteka_pkey PRIMARY KEY (id);


--
-- TOC entry 2501 (class 2606 OID 15563652)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2517 (class 2606 OID 15563677)
-- Name: dogodekizven_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodekizven
    ADD CONSTRAINT dogodekizven_pkey PRIMARY KEY (id);


--
-- TOC entry 2652 (class 2606 OID 15564129)
-- Name: drugivir_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT drugivir_pkey PRIMARY KEY (id);


--
-- TOC entry 2480 (class 2606 OID 15563594)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2629 (class 2606 OID 15564035)
-- Name: enotaprograma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT enotaprograma_pkey PRIMARY KEY (id);


--
-- TOC entry 2573 (class 2606 OID 15563814)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2495 (class 2606 OID 15563628)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2514 (class 2606 OID 15563671)
-- Name: gostujoca_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT gostujoca_pkey PRIMARY KEY (id);


--
-- TOC entry 2488 (class 2606 OID 15563608)
-- Name: kontaktnaoseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT kontaktnaoseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2539 (class 2606 OID 15563724)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2679 (class 2606 OID 15564212)
-- Name: mapa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT mapa_pkey PRIMARY KEY (id);


--
-- TOC entry 2683 (class 2606 OID 15564219)
-- Name: mapa_zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT mapa_zapis_pkey PRIMARY KEY (mapa_id, zapis_id);


--
-- TOC entry 2690 (class 2606 OID 15564243)
-- Name: mapaacl_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT mapaacl_pkey PRIMARY KEY (id);


--
-- TOC entry 2551 (class 2606 OID 15563751)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2473 (class 2606 OID 15563566)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2450 (class 2606 OID 15563478)
-- Name: optionvalue_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT optionvalue_pkey PRIMARY KEY (id);


--
-- TOC entry 2453 (class 2606 OID 15563502)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2444 (class 2606 OID 15563458)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2437 (class 2606 OID 15563443)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2554 (class 2606 OID 15563757)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2566 (class 2606 OID 15563790)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2604 (class 2606 OID 15563918)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2462 (class 2606 OID 15563530)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2470 (class 2606 OID 15563554)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2543 (class 2606 OID 15563730)
-- Name: postavkaracuna_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT postavkaracuna_pkey PRIMARY KEY (id);


--
-- TOC entry 2468 (class 2606 OID 15563544)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2493 (class 2606 OID 15563615)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2549 (class 2606 OID 15563742)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2641 (class 2606 OID 15564092)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2643 (class 2606 OID 15564100)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2637 (class 2606 OID 15564083)
-- Name: programdela_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT programdela_pkey PRIMARY KEY (id);


--
-- TOC entry 2648 (class 2606 OID 15564111)
-- Name: programskaenotasklopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT programskaenotasklopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2559 (class 2606 OID 15563774)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2537 (class 2606 OID 15563715)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2531 (class 2606 OID 15563706)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2599 (class 2606 OID 15563906)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2586 (class 2606 OID 15563842)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2429 (class 2606 OID 15563414)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2564 (class 2606 OID 15563781)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2435 (class 2606 OID 15563432)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2439 (class 2606 OID 15563452)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2571 (class 2606 OID 15563799)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2545 (class 2606 OID 15563737)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2519 (class 2606 OID 15563686)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2661 (class 2606 OID 15564153)
-- Name: stevilcenje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenje
    ADD CONSTRAINT stevilcenje_pkey PRIMARY KEY (id);


--
-- TOC entry 2658 (class 2606 OID 15564141)
-- Name: stevilcenjekonfig_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT stevilcenjekonfig_pkey PRIMARY KEY (id);


--
-- TOC entry 2655 (class 2606 OID 15564135)
-- Name: stevilcenjestanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjestanje
    ADD CONSTRAINT stevilcenjestanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2591 (class 2606 OID 15563855)
-- Name: strosekuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT strosekuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2459 (class 2606 OID 15563511)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2525 (class 2606 OID 15563697)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2597 (class 2606 OID 15563895)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2650 (class 2606 OID 15564123)
-- Name: tipprogramskeenote_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipprogramskeenote
    ADD CONSTRAINT tipprogramskeenote_pkey PRIMARY KEY (id);


--
-- TOC entry 2478 (class 2606 OID 15563579)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2431 (class 2606 OID 15563427)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2616 (class 2606 OID 15563949)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2499 (class 2606 OID 15563637)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2557 (class 2606 OID 15563765)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2593 (class 2606 OID 15563867)
-- Name: vrstastroska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstastroska
    ADD CONSTRAINT vrstastroska_pkey PRIMARY KEY (id);


--
-- TOC entry 2672 (class 2606 OID 15564193)
-- Name: vrstazapisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstazapisa
    ADD CONSTRAINT vrstazapisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2669 (class 2606 OID 15564177)
-- Name: zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT zapis_pkey PRIMARY KEY (id);


--
-- TOC entry 2675 (class 2606 OID 15564201)
-- Name: zapislastnik_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT zapislastnik_pkey PRIMARY KEY (id);


--
-- TOC entry 2582 (class 2606 OID 15563833)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2512 (class 2606 OID 15563666)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2608 (class 2606 OID 15563931)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2579 (class 2606 OID 15563826)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2502 (class 1259 OID 15563659)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2587 (class 1259 OID 15563856)
-- Name: idx_11ffe6e05c75296c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e05c75296c ON strosekuprizoritve USING btree (vrstastroska_id);


--
-- TOC entry 2588 (class 1259 OID 15563857)
-- Name: idx_11ffe6e062b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e062b4ffca ON strosekuprizoritve USING btree (uprizoritev_id);


--
-- TOC entry 2589 (class 1259 OID 15563858)
-- Name: idx_11ffe6e06beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e06beede51 ON strosekuprizoritve USING btree (popa_id);


--
-- TOC entry 2676 (class 1259 OID 15564214)
-- Name: idx_14a5d6d3727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d3727aca70 ON mapa USING btree (parent_id);


--
-- TOC entry 2677 (class 1259 OID 15564213)
-- Name: idx_14a5d6d38a4a6c12; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d38a4a6c12 ON mapa USING btree (lastnik_id);


--
-- TOC entry 2460 (class 1259 OID 15563532)
-- Name: idx_1c7adba5ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba5ee4b985a ON popa USING btree (drzava_id);


--
-- TOC entry 2552 (class 1259 OID 15563758)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2663 (class 1259 OID 15564181)
-- Name: idx_1ed92829253c4123; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829253c4123 ON zapis USING btree (avtor_id);


--
-- TOC entry 2664 (class 1259 OID 15564180)
-- Name: idx_1ed9282957ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282957ed422f ON zapis USING btree (mapa_id);


--
-- TOC entry 2665 (class 1259 OID 15564182)
-- Name: idx_1ed9282987ff3295; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282987ff3295 ON zapis USING btree (zaklenil_id);


--
-- TOC entry 2666 (class 1259 OID 15564179)
-- Name: idx_1ed92829a54dbb1f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829a54dbb1f ON zapis USING btree (datoteka_id);


--
-- TOC entry 2667 (class 1259 OID 15564178)
-- Name: idx_1ed92829ef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829ef943358 ON zapis USING btree (vrsta_id);


--
-- TOC entry 2546 (class 1259 OID 15563744)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2547 (class 1259 OID 15563743)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2497 (class 1259 OID 15563638)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2574 (class 1259 OID 15563815)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2575 (class 1259 OID 15563817)
-- Name: idx_23aeb9586b361365; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9586b361365 ON funkcija USING btree (tipfunkcije_id);


--
-- TOC entry 2576 (class 1259 OID 15563816)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2485 (class 1259 OID 15563610)
-- Name: idx_2942b10710389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b10710389148 ON kontaktnaoseba USING btree (oseba_id);


--
-- TOC entry 2486 (class 1259 OID 15563609)
-- Name: idx_2942b1076beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b1076beede51 ON kontaktnaoseba USING btree (popa_id);


--
-- TOC entry 2646 (class 1259 OID 15564112)
-- Name: idx_2d901816d6bc69d6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2d901816d6bc69d6 ON programskaenotasklopa USING btree (programrazno_id);


--
-- TOC entry 2600 (class 1259 OID 15563920)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2601 (class 1259 OID 15563921)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2602 (class 1259 OID 15563922)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2673 (class 1259 OID 15564202)
-- Name: idx_2eaff9dcaf91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2eaff9dcaf91ecd ON zapislastnik USING btree (zapis_id);


--
-- TOC entry 2609 (class 1259 OID 15563954)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2610 (class 1259 OID 15563951)
-- Name: idx_344a77a7c3b0d59; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a7c3b0d59 ON uprizoritev USING btree (maticnioder_id);


--
-- TOC entry 2611 (class 1259 OID 15563955)
-- Name: idx_344a77a853a965c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a853a965c ON uprizoritev USING btree (producent_id);


--
-- TOC entry 2612 (class 1259 OID 15563953)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2613 (class 1259 OID 15563952)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2475 (class 1259 OID 15563581)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2476 (class 1259 OID 15563580)
-- Name: idx_37f6541a6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a6beede51 ON trr USING btree (popa_id);


--
-- TOC entry 2451 (class 1259 OID 15563505)
-- Name: idx_466966d769e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_466966d769e8d4 ON oseba USING btree (naslov_id);


--
-- TOC entry 2562 (class 1259 OID 15563782)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2515 (class 1259 OID 15563672)
-- Name: idx_4a45d07962b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4a45d07962b4ffca ON gostujoca USING btree (uprizoritev_id);


--
-- TOC entry 2441 (class 1259 OID 15563459)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2442 (class 1259 OID 15563460)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2567 (class 1259 OID 15563802)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2568 (class 1259 OID 15563801)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2569 (class 1259 OID 15563800)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2489 (class 1259 OID 15563616)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2490 (class 1259 OID 15563618)
-- Name: idx_602f6e466f7e7a33; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e466f7e7a33 ON predstava USING btree (gostujoc_id);


--
-- TOC entry 2491 (class 1259 OID 15563617)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2656 (class 1259 OID 15564143)
-- Name: idx_6054e804ff55f926; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_6054e804ff55f926 ON stevilcenjekonfig USING btree (stevilcenje_id);


--
-- TOC entry 2526 (class 1259 OID 15563710)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2527 (class 1259 OID 15563708)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2528 (class 1259 OID 15563707)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2529 (class 1259 OID 15563709)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2432 (class 1259 OID 15563433)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2433 (class 1259 OID 15563434)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2555 (class 1259 OID 15563766)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2686 (class 1259 OID 15564236)
-- Name: idx_781826c67e3c61f9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_781826c67e3c61f9 ON datoteka USING btree (owner_id);


--
-- TOC entry 2687 (class 1259 OID 15564244)
-- Name: idx_7adc957157ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc957157ed422f ON mapaacl USING btree (mapa_id);


--
-- TOC entry 2688 (class 1259 OID 15564245)
-- Name: idx_7adc9571fa6311ef; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc9571fa6311ef ON mapaacl USING btree (perm_id);


--
-- TOC entry 2541 (class 1259 OID 15563731)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2583 (class 1259 OID 15563843)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2584 (class 1259 OID 15563844)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2630 (class 1259 OID 15564040)
-- Name: idx_8787a0e54ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e54ae1cd1c ON enotaprograma USING btree (gostitelj_id);


--
-- TOC entry 2631 (class 1259 OID 15564039)
-- Name: idx_8787a0e55d0da56c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e55d0da56c ON enotaprograma USING btree (drzavagostovanja_id);


--
-- TOC entry 2632 (class 1259 OID 15564036)
-- Name: idx_8787a0e562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e562b4ffca ON enotaprograma USING btree (uprizoritev_id);


--
-- TOC entry 2633 (class 1259 OID 15564037)
-- Name: idx_8787a0e57222d84b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e57222d84b ON enotaprograma USING btree (tipprogramskeenote_id);


--
-- TOC entry 2634 (class 1259 OID 15564038)
-- Name: idx_8787a0e5771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e5771ec7bd ON enotaprograma USING btree (program_dela_id);


--
-- TOC entry 2464 (class 1259 OID 15563546)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2465 (class 1259 OID 15563545)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2466 (class 1259 OID 15563547)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2638 (class 1259 OID 15564093)
-- Name: idx_97af082e38c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e38c06eb ON produkcijadelitev USING btree (enotaprograma_id);


--
-- TOC entry 2639 (class 1259 OID 15564094)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2623 (class 1259 OID 15563984)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2624 (class 1259 OID 15563985)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2625 (class 1259 OID 15563982)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2626 (class 1259 OID 15563983)
-- Name: idx_a4b7244fa4976613; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fa4976613 ON alternacija USING btree (zaposlitev_id);


--
-- TOC entry 2580 (class 1259 OID 15563834)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2532 (class 1259 OID 15563719)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2533 (class 1259 OID 15563718)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2534 (class 1259 OID 15563716)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2535 (class 1259 OID 15563717)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2619 (class 1259 OID 15563972)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2620 (class 1259 OID 15563971)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2635 (class 1259 OID 15564084)
-- Name: idx_c81bc37f3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c81bc37f3a0e32e3 ON programdela USING btree (sezona_id);


--
-- TOC entry 2496 (class 1259 OID 15563629)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2653 (class 1259 OID 15564130)
-- Name: idx_e7d4cf2638c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e7d4cf2638c06eb ON drugivir USING btree (enotaprograma_id);


--
-- TOC entry 2680 (class 1259 OID 15564220)
-- Name: idx_e9f8ee8257ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee8257ed422f ON mapa_zapis USING btree (mapa_id);


--
-- TOC entry 2681 (class 1259 OID 15564221)
-- Name: idx_e9f8ee82af91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee82af91ecd ON mapa_zapis USING btree (zapis_id);


--
-- TOC entry 2447 (class 1259 OID 15563480)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2448 (class 1259 OID 15563479)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2456 (class 1259 OID 15563512)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2457 (class 1259 OID 15563513)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2521 (class 1259 OID 15563700)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2522 (class 1259 OID 15563699)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2523 (class 1259 OID 15563698)
-- Name: idx_fef7d84ba81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84ba81ccef6 ON terminstoritve USING btree (dogodek_id);


--
-- TOC entry 2503 (class 1259 OID 15563661)
-- Name: konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX konec ON dogodek USING btree (konec);


--
-- TOC entry 2504 (class 1259 OID 15563657)
-- Name: uniq_11e93b5d10398482; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d10398482 ON dogodek USING btree (dogodek_izven_id);


--
-- TOC entry 2505 (class 1259 OID 15563654)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2506 (class 1259 OID 15563655)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2507 (class 1259 OID 15563653)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2508 (class 1259 OID 15563658)
-- Name: uniq_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2509 (class 1259 OID 15563656)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2463 (class 1259 OID 15563531)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2481 (class 1259 OID 15563595)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2482 (class 1259 OID 15563597)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2483 (class 1259 OID 15563596)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2484 (class 1259 OID 15563598)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2540 (class 1259 OID 15563725)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2605 (class 1259 OID 15563919)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2614 (class 1259 OID 15563950)
-- Name: uniq_344a77a559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_344a77a559828a3 ON uprizoritev USING btree (sifra);


--
-- TOC entry 2454 (class 1259 OID 15563503)
-- Name: uniq_466966d7559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7559828a3 ON oseba USING btree (sifra);


--
-- TOC entry 2455 (class 1259 OID 15563504)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2577 (class 1259 OID 15563827)
-- Name: uniq_5216fcb0559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5216fcb0559828a3 ON zvrstuprizoritve USING btree (sifra);


--
-- TOC entry 2662 (class 1259 OID 15564154)
-- Name: uniq_5a434fbc559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5a434fbc559828a3 ON stevilcenje USING btree (sifra);


--
-- TOC entry 2474 (class 1259 OID 15563567)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2659 (class 1259 OID 15564142)
-- Name: uniq_6054e804889a7556; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_6054e804889a7556 ON stevilcenjekonfig USING btree (dok);


--
-- TOC entry 2560 (class 1259 OID 15563776)
-- Name: uniq_952dd21937854736; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21937854736 ON prostor USING btree (naziv);


--
-- TOC entry 2561 (class 1259 OID 15563775)
-- Name: uniq_952dd219559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd219559828a3 ON prostor USING btree (sifra);


--
-- TOC entry 2627 (class 1259 OID 15563981)
-- Name: uniq_a4b7244f559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a4b7244f559828a3 ON alternacija USING btree (sifra);


--
-- TOC entry 2471 (class 1259 OID 15563555)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2606 (class 1259 OID 15563932)
-- Name: uniq_cede8e36559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_cede8e36559828a3 ON zvrstsurs USING btree (sifra);


--
-- TOC entry 2670 (class 1259 OID 15564194)
-- Name: uniq_de1c8aa1d55226c7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_de1c8aa1d55226c7 ON vrstazapisa USING btree (oznaka);


--
-- TOC entry 2644 (class 1259 OID 15564101)
-- Name: uniq_e6fc2028559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc2028559828a3 ON produkcijskahisa USING btree (sifra);


--
-- TOC entry 2645 (class 1259 OID 15564102)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2520 (class 1259 OID 15563687)
-- Name: uniq_ecc8f8c5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ecc8f8c5559828a3 ON sezona USING btree (sifra);


--
-- TOC entry 2440 (class 1259 OID 15563453)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2510 (class 1259 OID 15563660)
-- Name: zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2718 (class 2606 OID 15564381)
-- Name: fk_11e93b5d10398482; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d10398482 FOREIGN KEY (dogodek_izven_id) REFERENCES dogodekizven(id);


--
-- TOC entry 2715 (class 2606 OID 15564366)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2716 (class 2606 OID 15564371)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2720 (class 2606 OID 15564391)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2714 (class 2606 OID 15564361)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2719 (class 2606 OID 15564386)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2717 (class 2606 OID 15564376)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2749 (class 2606 OID 15564536)
-- Name: fk_11ffe6e05c75296c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e05c75296c FOREIGN KEY (vrstastroska_id) REFERENCES vrstastroska(id);


--
-- TOC entry 2750 (class 2606 OID 15564541)
-- Name: fk_11ffe6e062b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e062b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2751 (class 2606 OID 15564546)
-- Name: fk_11ffe6e06beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e06beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2785 (class 2606 OID 15564716)
-- Name: fk_14a5d6d3727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d3727aca70 FOREIGN KEY (parent_id) REFERENCES mapa(id);


--
-- TOC entry 2784 (class 2606 OID 15564711)
-- Name: fk_14a5d6d38a4a6c12; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d38a4a6c12 FOREIGN KEY (lastnik_id) REFERENCES uporabniki(id);


--
-- TOC entry 2701 (class 2606 OID 15564296)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2737 (class 2606 OID 15564476)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2781 (class 2606 OID 15564696)
-- Name: fk_1ed92829253c4123; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829253c4123 FOREIGN KEY (avtor_id) REFERENCES uporabniki(id);


--
-- TOC entry 2780 (class 2606 OID 15564691)
-- Name: fk_1ed9282957ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282957ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2782 (class 2606 OID 15564701)
-- Name: fk_1ed9282987ff3295; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282987ff3295 FOREIGN KEY (zaklenil_id) REFERENCES uporabniki(id);


--
-- TOC entry 2779 (class 2606 OID 15564686)
-- Name: fk_1ed92829a54dbb1f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829a54dbb1f FOREIGN KEY (datoteka_id) REFERENCES datoteka(id);


--
-- TOC entry 2778 (class 2606 OID 15564681)
-- Name: fk_1ed92829ef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829ef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstazapisa(id);


--
-- TOC entry 2736 (class 2606 OID 15564471)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2735 (class 2606 OID 15564466)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2713 (class 2606 OID 15564356)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2743 (class 2606 OID 15564506)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2745 (class 2606 OID 15564516)
-- Name: fk_23aeb9586b361365; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9586b361365 FOREIGN KEY (tipfunkcije_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2744 (class 2606 OID 15564511)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2708 (class 2606 OID 15564331)
-- Name: fk_2942b10710389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b10710389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2707 (class 2606 OID 15564326)
-- Name: fk_2942b1076beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b1076beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2733 (class 2606 OID 15564456)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2775 (class 2606 OID 15564666)
-- Name: fk_2d901816d6bc69d6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT fk_2d901816d6bc69d6 FOREIGN KEY (programrazno_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2752 (class 2606 OID 15564551)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2753 (class 2606 OID 15564556)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2754 (class 2606 OID 15564561)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 2783 (class 2606 OID 15564706)
-- Name: fk_2eaff9dcaf91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT fk_2eaff9dcaf91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id);


--
-- TOC entry 2758 (class 2606 OID 15564581)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2755 (class 2606 OID 15564566)
-- Name: fk_344a77a7c3b0d59; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a7c3b0d59 FOREIGN KEY (maticnioder_id) REFERENCES prostor(id);


--
-- TOC entry 2759 (class 2606 OID 15564586)
-- Name: fk_344a77a853a965c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a853a965c FOREIGN KEY (producent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2757 (class 2606 OID 15564576)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2756 (class 2606 OID 15564571)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2706 (class 2606 OID 15564321)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2705 (class 2606 OID 15564316)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2698 (class 2606 OID 15564281)
-- Name: fk_466966d769e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d769e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2697 (class 2606 OID 15564276)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2739 (class 2606 OID 15564486)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2721 (class 2606 OID 15564396)
-- Name: fk_4a45d07962b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT fk_4a45d07962b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2693 (class 2606 OID 15564256)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2694 (class 2606 OID 15564261)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2742 (class 2606 OID 15564501)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2741 (class 2606 OID 15564496)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2740 (class 2606 OID 15564491)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2709 (class 2606 OID 15564336)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2711 (class 2606 OID 15564346)
-- Name: fk_602f6e466f7e7a33; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e466f7e7a33 FOREIGN KEY (gostujoc_id) REFERENCES gostujoca(id);


--
-- TOC entry 2710 (class 2606 OID 15564341)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2777 (class 2606 OID 15564676)
-- Name: fk_6054e804ff55f926; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT fk_6054e804ff55f926 FOREIGN KEY (stevilcenje_id) REFERENCES stevilcenje(id);


--
-- TOC entry 2728 (class 2606 OID 15564431)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2726 (class 2606 OID 15564421)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2725 (class 2606 OID 15564416)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2727 (class 2606 OID 15564426)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2691 (class 2606 OID 15564246)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2692 (class 2606 OID 15564251)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2738 (class 2606 OID 15564481)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2788 (class 2606 OID 15564731)
-- Name: fk_781826c67e3c61f9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT fk_781826c67e3c61f9 FOREIGN KEY (owner_id) REFERENCES uporabniki(id);


--
-- TOC entry 2789 (class 2606 OID 15564736)
-- Name: fk_7adc957157ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc957157ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2790 (class 2606 OID 15564741)
-- Name: fk_7adc9571fa6311ef; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc9571fa6311ef FOREIGN KEY (perm_id) REFERENCES permission(id);


--
-- TOC entry 2734 (class 2606 OID 15564461)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2747 (class 2606 OID 15564526)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2748 (class 2606 OID 15564531)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2770 (class 2606 OID 15564641)
-- Name: fk_8787a0e54ae1cd1c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e54ae1cd1c FOREIGN KEY (gostitelj_id) REFERENCES popa(id);


--
-- TOC entry 2769 (class 2606 OID 15564636)
-- Name: fk_8787a0e55d0da56c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e55d0da56c FOREIGN KEY (drzavagostovanja_id) REFERENCES drza(id);


--
-- TOC entry 2766 (class 2606 OID 15564621)
-- Name: fk_8787a0e562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2767 (class 2606 OID 15564626)
-- Name: fk_8787a0e57222d84b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e57222d84b FOREIGN KEY (tipprogramskeenote_id) REFERENCES tipprogramskeenote(id);


--
-- TOC entry 2768 (class 2606 OID 15564631)
-- Name: fk_8787a0e5771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e5771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2703 (class 2606 OID 15564306)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2702 (class 2606 OID 15564301)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2704 (class 2606 OID 15564311)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2772 (class 2606 OID 15564651)
-- Name: fk_97af082e38c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e38c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2773 (class 2606 OID 15564656)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2764 (class 2606 OID 15564611)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2765 (class 2606 OID 15564616)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2762 (class 2606 OID 15564601)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 2763 (class 2606 OID 15564606)
-- Name: fk_a4b7244fa4976613; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fa4976613 FOREIGN KEY (zaposlitev_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2746 (class 2606 OID 15564521)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2732 (class 2606 OID 15564451)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2731 (class 2606 OID 15564446)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2729 (class 2606 OID 15564436)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2730 (class 2606 OID 15564441)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2761 (class 2606 OID 15564596)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2760 (class 2606 OID 15564591)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2771 (class 2606 OID 15564646)
-- Name: fk_c81bc37f3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT fk_c81bc37f3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2712 (class 2606 OID 15564351)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2774 (class 2606 OID 15564661)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2776 (class 2606 OID 15564671)
-- Name: fk_e7d4cf2638c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT fk_e7d4cf2638c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2786 (class 2606 OID 15564721)
-- Name: fk_e9f8ee8257ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee8257ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id) ON DELETE CASCADE;


--
-- TOC entry 2787 (class 2606 OID 15564726)
-- Name: fk_e9f8ee82af91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee82af91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id) ON DELETE CASCADE;


--
-- TOC entry 2696 (class 2606 OID 15564271)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2695 (class 2606 OID 15564266)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2699 (class 2606 OID 15564286)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2700 (class 2606 OID 15564291)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2724 (class 2606 OID 15564411)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2723 (class 2606 OID 15564406)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2722 (class 2606 OID 15564401)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- Completed on 2015-08-26 10:17:51 CEST

--
-- PostgreSQL database dump complete
--

