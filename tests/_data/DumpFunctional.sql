--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.9
-- Dumped by pg_dump version 9.3.9
-- Started on 2015-08-26 13:55:06 CEST

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
-- TOC entry 2979 (class 0 OID 0)
-- Dependencies: 241
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_with_oids = false;

--
-- TOC entry 177 (class 1259 OID 15628702)
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
-- TOC entry 223 (class 1259 OID 15629217)
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
-- TOC entry 222 (class 1259 OID 15629200)
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
-- TOC entry 216 (class 1259 OID 15629112)
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
-- TOC entry 239 (class 1259 OID 15629466)
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
-- TOC entry 191 (class 1259 OID 15628880)
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
-- TOC entry 194 (class 1259 OID 15628914)
-- Name: dogodekizven; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodekizven (
    id uuid NOT NULL
);


--
-- TOC entry 230 (class 1259 OID 15629368)
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
-- TOC entry 186 (class 1259 OID 15628823)
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
-- TOC entry 224 (class 1259 OID 15629230)
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
-- TOC entry 210 (class 1259 OID 15629047)
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
-- TOC entry 189 (class 1259 OID 15628860)
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
-- TOC entry 193 (class 1259 OID 15628908)
-- Name: gostujoca; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE gostujoca (
    id uuid NOT NULL,
    uprizoritev_id uuid
);


--
-- TOC entry 187 (class 1259 OID 15628840)
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
-- TOC entry 199 (class 1259 OID 15628962)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 237 (class 1259 OID 15629447)
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
-- TOC entry 238 (class 1259 OID 15629459)
-- Name: mapa_zapis; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE mapa_zapis (
    mapa_id uuid NOT NULL,
    zapis_id uuid NOT NULL
);


--
-- TOC entry 240 (class 1259 OID 15629481)
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
-- TOC entry 203 (class 1259 OID 15628987)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 184 (class 1259 OID 15628797)
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
-- TOC entry 178 (class 1259 OID 15628711)
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
-- TOC entry 179 (class 1259 OID 15628722)
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
-- TOC entry 174 (class 1259 OID 15628676)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 176 (class 1259 OID 15628695)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 204 (class 1259 OID 15628994)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 208 (class 1259 OID 15629027)
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
-- TOC entry 219 (class 1259 OID 15629151)
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
-- TOC entry 181 (class 1259 OID 15628755)
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
-- TOC entry 183 (class 1259 OID 15628789)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 200 (class 1259 OID 15628968)
-- Name: postavkaracuna; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE postavkaracuna (
    id uuid NOT NULL,
    racun_id uuid
);


--
-- TOC entry 182 (class 1259 OID 15628774)
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
-- TOC entry 188 (class 1259 OID 15628852)
-- Name: predstava; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE predstava (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    gostovanje_id uuid,
    gostujoc_id uuid
);


--
-- TOC entry 202 (class 1259 OID 15628980)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 226 (class 1259 OID 15629329)
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
-- TOC entry 227 (class 1259 OID 15629339)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    sifra character varying(4) NOT NULL,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 225 (class 1259 OID 15629285)
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
-- TOC entry 228 (class 1259 OID 15629347)
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
-- TOC entry 206 (class 1259 OID 15629009)
-- Name: prostor; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prostor (
    id uuid NOT NULL,
    popa_id uuid,
    naslov_id uuid,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) NOT NULL,
    jeprizorisce boolean,
    kapaciteta integer,
    opis text
);


--
-- TOC entry 198 (class 1259 OID 15628953)
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
-- TOC entry 197 (class 1259 OID 15628943)
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
-- TOC entry 218 (class 1259 OID 15629140)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying,
    status character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 213 (class 1259 OID 15629079)
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
-- TOC entry 171 (class 1259 OID 15628647)
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
-- TOC entry 170 (class 1259 OID 15628645)
-- Name: revizije_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE revizije_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2980 (class 0 OID 0)
-- Dependencies: 170
-- Name: revizije_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE revizije_id_seq OWNED BY revizije.id;


--
-- TOC entry 207 (class 1259 OID 15629021)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 175 (class 1259 OID 15628685)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 173 (class 1259 OID 15628669)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 209 (class 1259 OID 15629035)
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
-- TOC entry 201 (class 1259 OID 15628974)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 195 (class 1259 OID 15628919)
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
-- TOC entry 233 (class 1259 OID 15629388)
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
-- TOC entry 232 (class 1259 OID 15629380)
-- Name: stevilcenjekonfig; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjekonfig (
    id uuid NOT NULL,
    stevilcenje_id uuid,
    dok character varying(100) DEFAULT NULL::character varying
);


--
-- TOC entry 231 (class 1259 OID 15629375)
-- Name: stevilcenjestanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjestanje (
    id uuid NOT NULL,
    objid uuid NOT NULL,
    leto integer NOT NULL,
    stevilka integer
);


--
-- TOC entry 214 (class 1259 OID 15629089)
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
-- TOC entry 180 (class 1259 OID 15628747)
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
-- TOC entry 196 (class 1259 OID 15628929)
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
-- TOC entry 217 (class 1259 OID 15629129)
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
-- TOC entry 229 (class 1259 OID 15629357)
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
-- TOC entry 185 (class 1259 OID 15628809)
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
-- TOC entry 172 (class 1259 OID 15628656)
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
-- TOC entry 221 (class 1259 OID 15629177)
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
-- TOC entry 190 (class 1259 OID 15628871)
-- Name: vaja; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE vaja (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    zaporedna integer,
    porocilo text
);


--
-- TOC entry 205 (class 1259 OID 15629001)
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
-- TOC entry 215 (class 1259 OID 15629103)
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
-- TOC entry 235 (class 1259 OID 15629427)
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
-- TOC entry 234 (class 1259 OID 15629399)
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
-- TOC entry 236 (class 1259 OID 15629439)
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
-- TOC entry 212 (class 1259 OID 15629072)
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
-- TOC entry 192 (class 1259 OID 15628903)
-- Name: zasedenost; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zasedenost (
    id uuid NOT NULL
);


--
-- TOC entry 220 (class 1259 OID 15629167)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 211 (class 1259 OID 15629062)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 2175 (class 2604 OID 15628650)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 2909 (class 0 OID 15628702)
-- Dependencies: 177
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
\.


--
-- TOC entry 2955 (class 0 OID 15629217)
-- Dependencies: 223
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, zaposlitev_id, oseba_id, pogodba_id, sifra, zaposlen, zacetek, konec, opomba, sort, privzeti, aktivna, imapogodbo, pomembna) FROM stdin;
000c0000-55dd-a918-86ec-690481d7c5a4	000d0000-55dd-a918-fb76-e524bc54134b	\N	00090000-55dd-a918-4035-df2a75e3f5d2	000b0000-55dd-a918-160e-91ee6ac81396	0001	f	\N	\N	\N	3	\N	\N	t	t
000c0000-55dd-a918-13c5-c500c914d144	000d0000-55dd-a918-a516-f6d868d6c38d	00100000-55dd-a918-5d85-658c66f7634a	00090000-55dd-a918-cbdb-fcf7d436bbdd	\N	0002	t	2016-01-01	\N	\N	8	\N	\N	f	f
000c0000-55dd-a918-024e-241628c4fe35	000d0000-55dd-a918-b16d-1d12d8f722aa	00100000-55dd-a918-d47f-a8860ec5af43	00090000-55dd-a918-d803-e026c723e945	\N	0003	t	\N	2015-08-26	\N	2	\N	\N	f	f
000c0000-55dd-a918-e349-00e9b03e066d	000d0000-55dd-a918-e809-88e3d08e4836	\N	00090000-55dd-a918-e2a7-08ade7d43278	\N	0004	f	2016-01-01	2016-01-01	\N	26	\N	\N	f	f
000c0000-55dd-a918-bc3f-661cbf0f4bb8	000d0000-55dd-a918-792d-42e06e5f68b6	\N	00090000-55dd-a918-084a-5e42addb69db	\N	0005	f	2016-01-01	2016-01-01	\N	7	\N	\N	f	f
000c0000-55dd-a918-4375-3169c99b141f	000d0000-55dd-a918-40c1-9a044d1b4620	\N	00090000-55dd-a918-69d3-c3e49503a711	000b0000-55dd-a918-aa61-46c2b4df196f	0006	f	2016-01-01	2016-01-01	\N	1	\N	\N	t	t
000c0000-55dd-a918-b208-52dfbb4a7742	000d0000-55dd-a918-63fb-20be37d778da	00100000-55dd-a918-d617-31b9f7328168	00090000-55dd-a918-4757-5e5e841123be	\N	0007	t	2016-01-01	2016-01-01	\N	14	\N	\N	f	t
000c0000-55dd-a918-168a-ae96d6309f7a	000d0000-55dd-a918-4d10-04ae51b4505e	\N	00090000-55dd-a918-ffd5-fabdde1f707c	000b0000-55dd-a918-59c8-4de3fa181866	0008	f	2016-01-01	2016-01-01	\N	12	\N	\N	t	t
000c0000-55dd-a918-66a4-30e991b538bf	000d0000-55dd-a918-63fb-20be37d778da	00100000-55dd-a918-cc0b-c47b209fbaa7	00090000-55dd-a918-e62c-3f86c7496681	\N	0009	t	2017-01-01	2017-01-01	\N	15	\N	\N	f	t
000c0000-55dd-a918-48c7-bafa26f768a6	000d0000-55dd-a918-63fb-20be37d778da	00100000-55dd-a918-3dfe-ac27ff3691ec	00090000-55dd-a918-1d48-b5db5ab80890	\N	0010	t	\N	2015-08-26	\N	16	\N	\N	f	t
000c0000-55dd-a918-33ce-b5977a5c772b	000d0000-55dd-a918-63fb-20be37d778da	00100000-55dd-a918-4ba7-7b25e37a6fcd	00090000-55dd-a918-7f4f-fad684bf99e8	\N	0011	t	2017-01-01	\N	\N	17	\N	\N	f	t
\.


--
-- TOC entry 2954 (class 0 OID 15629200)
-- Dependencies: 222
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 2948 (class 0 OID 15629112)
-- Dependencies: 216
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, stevilka, naslov, avtor, podnaslov, jezik, naslovizvirnika, internacionalninaslov, datumprejema, moskevloge, zenskevloge, prevajalec, povzetekvsebine, letoizida, krajizida, zaloznik) FROM stdin;
00160000-55dd-a918-7eef-5f5f55a9378c	0001	Sen kresne noči	William Shakespeare		slovenščina	A Midsummer Night's Dream	\N	2015-04-26	5	5	Milan Jesih	Nastopajo Titanija, Hipolita, Oberon, ...	\N	\N	\N
00160000-55dd-a918-db18-a38982fcb8c3	0002	Bratje Karamazovi	Fjodor Mihajlovič Dostojevski		slovenščina	Bratja Karamazjovji	\N	2015-12-04	4	1	Vladimir Levstik	Svetovna uspešnica	\N	\N	\N
00160000-55dd-a918-9a8b-aa1627068783	0003	Smoletov Vrt	Berta Hočevar		slovenščina		\N	2015-05-26	2	8			\N	\N	\N
\.


--
-- TOC entry 2971 (class 0 OID 15629466)
-- Dependencies: 239
-- Data for Name: datoteka; Type: TABLE DATA; Schema: public; Owner: -
--

COPY datoteka (id, owner_id, filename, transfers, size, format, hash, createdat, uploadedat, upor, datknj) FROM stdin;
\.


--
-- TOC entry 2923 (class 0 OID 15628880)
-- Dependencies: 191
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_izven_id, prostor_id, sezona_id, planiranzacetek, zacetek, konec, status, razred, termin, ime) FROM stdin;
00180000-55dd-a918-be34-7d3449b630f3	\N	\N	00200000-55dd-a918-b723-797563e51853	\N	\N	\N	\N	2015-06-26 10:00:00	2015-06-26 10:00:00	2015-06-26 12:00:00	3			
00180000-55dd-a918-83dd-1147dea8b911	\N	\N	00200000-55dd-a918-7c00-c87ef8e0ff8b	\N	\N	\N	\N	2015-06-27 10:00:00	2015-06-27 10:00:00	2015-06-27 12:00:00	4			
00180000-55dd-a918-8bff-ccdf63c574f9	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	5			
00180000-55dd-a918-59c6-faaef2b86e70	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	2			
00180000-55dd-a918-b093-616f43a3ac05	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	7			
\.


--
-- TOC entry 2926 (class 0 OID 15628914)
-- Dependencies: 194
-- Data for Name: dogodekizven; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodekizven (id) FROM stdin;
\.


--
-- TOC entry 2962 (class 0 OID 15629368)
-- Dependencies: 230
-- Data for Name: drugivir; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drugivir (id, znesek, opis, mednarodni, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 2918 (class 0 OID 15628823)
-- Dependencies: 186
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-55dd-a916-9816-0e2a3db163ba	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-55dd-a916-fc20-5b3cde486eda	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-55dd-a916-2fde-f84b834e1db2	AL	ALB	008	Albania 	Albanija	\N
00040000-55dd-a916-cfa8-c38d8bcba688	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-55dd-a916-241c-db97de386de4	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-55dd-a916-882f-754685ca19f1	AD	AND	020	Andorra 	Andora	\N
00040000-55dd-a916-c989-0e54967469a8	AO	AGO	024	Angola 	Angola	\N
00040000-55dd-a916-db94-749baa5dfa1c	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-55dd-a916-f03a-77836e194723	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-55dd-a916-a148-d296d3915685	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-55dd-a916-d795-4a4758b81d1a	AR	ARG	032	Argentina 	Argenitna	\N
00040000-55dd-a916-5566-6970ae36e3ec	AM	ARM	051	Armenia 	Armenija	\N
00040000-55dd-a916-ffd8-1f3c69bd4012	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-55dd-a916-1602-8b1766cd4dff	AU	AUS	036	Australia 	Avstralija	\N
00040000-55dd-a916-bcef-3f06b6d56c03	AT	AUT	040	Austria 	Avstrija	\N
00040000-55dd-a916-f29f-69fd7d294c9f	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-55dd-a916-c355-67069de2af7d	BS	BHS	044	Bahamas 	Bahami	\N
00040000-55dd-a916-2a74-f60c10ce5fcd	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-55dd-a916-dc03-d5927458a1a9	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-55dd-a916-0e47-bccdf155e4aa	BB	BRB	052	Barbados 	Barbados	\N
00040000-55dd-a916-1bfb-ff3e9521ba4a	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-55dd-a916-3fce-2d0fa1d63686	BE	BEL	056	Belgium 	Belgija	\N
00040000-55dd-a916-1c3a-f49f49dbbc57	BZ	BLZ	084	Belize 	Belize	\N
00040000-55dd-a916-515f-3c12a6bf0f34	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-55dd-a916-f549-520093601905	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-55dd-a916-9817-491a8d5dbd4e	BT	BTN	064	Bhutan 	Butan	\N
00040000-55dd-a916-da0f-3fb78a412fb2	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-55dd-a916-85f6-43709ead92de	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-55dd-a916-32f8-e6747b67cab1	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-55dd-a916-ca35-ca37e1440b6e	BW	BWA	072	Botswana 	Bocvana	\N
00040000-55dd-a916-eccd-c1589c55afa0	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-55dd-a916-d821-ad09a5f7163d	BR	BRA	076	Brazil 	Brazilija	\N
00040000-55dd-a916-7b6e-314d2a002998	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-55dd-a916-1600-58a51888d898	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-55dd-a916-fc32-00853e6ddaf0	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-55dd-a916-312b-f22b20e886b9	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-55dd-a916-1f92-7321d4ff6b2c	BI	BDI	108	Burundi 	Burundi 	\N
00040000-55dd-a916-845a-76b4dbf0e87d	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-55dd-a916-652f-bfe70dc6f82d	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-55dd-a916-3cd4-2ff5c1cdc67c	CA	CAN	124	Canada 	Kanada	\N
00040000-55dd-a916-1679-11e7fd443f71	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-55dd-a916-7c8e-c682b9c4d479	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-55dd-a916-317e-d92f1a2f4a8e	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-55dd-a916-06ab-0731c260355b	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-55dd-a916-b006-d917176de5bd	CL	CHL	152	Chile 	Čile	\N
00040000-55dd-a916-d9ef-cefa563a0de7	CN	CHN	156	China 	Kitajska	\N
00040000-55dd-a916-3fed-33b8f461cbcd	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-55dd-a916-b02d-84689cfd0942	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-55dd-a916-56b7-9fe811de387a	CO	COL	170	Colombia 	Kolumbija	\N
00040000-55dd-a916-d440-5183a68b32b9	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-55dd-a916-6e1b-a62b0df6c707	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-55dd-a916-200e-35bc348b2ac9	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-55dd-a916-f89a-8fd514fd8354	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-55dd-a916-57ab-1b0c495b230e	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-55dd-a916-a40f-bf2a905b2e39	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-55dd-a916-e7c3-798bc67ff39a	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-55dd-a916-38d2-0cb1a450a0c6	CU	CUB	192	Cuba 	Kuba	\N
00040000-55dd-a916-a8e8-15a3a741ee10	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-55dd-a916-0636-fbe663db5012	CY	CYP	196	Cyprus 	Ciper	\N
00040000-55dd-a916-9b0a-9d194fa1e433	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-55dd-a916-3feb-2f395b767e38	DK	DNK	208	Denmark 	Danska	\N
00040000-55dd-a916-dc3a-0dc49ddc4036	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-55dd-a916-4ec1-dbc72de3a446	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-55dd-a916-d3f2-abc880573615	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-55dd-a916-936c-50e293583b0a	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-55dd-a916-3240-2837ee8b76e2	EG	EGY	818	Egypt 	Egipt	\N
00040000-55dd-a916-0e87-2ca499b45113	SV	SLV	222	El Salvador 	Salvador	\N
00040000-55dd-a916-b21c-44e4ccb63a68	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-55dd-a916-0a7a-a13525e98e75	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-55dd-a916-8042-e3ebc6ba129a	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-55dd-a916-3ec8-550b6275270f	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-55dd-a916-7370-82036e8e9d39	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-55dd-a916-a654-ece01f63e132	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-55dd-a916-d6f1-b849b5d49fe9	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-55dd-a916-0dd3-4780d05df11b	FI	FIN	246	Finland 	Finska	\N
00040000-55dd-a916-091a-116df77a86b8	FR	FRA	250	France 	Francija	\N
00040000-55dd-a916-e948-61bf66588361	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-55dd-a916-fea3-d82f5cc5494a	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-55dd-a916-650d-0b5ea3651a1b	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-55dd-a916-f03b-93faa3f562de	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-55dd-a916-2faa-187dc4f08df0	GA	GAB	266	Gabon 	Gabon	\N
00040000-55dd-a916-0abf-0f3c0b7d7802	GM	GMB	270	Gambia 	Gambija	\N
00040000-55dd-a916-b313-83ca4209ef97	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-55dd-a916-213c-0a1d2856804b	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-55dd-a916-0d66-eca124113d85	GH	GHA	288	Ghana 	Gana	\N
00040000-55dd-a916-83cd-b5039c43b61e	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-55dd-a916-3e5f-8f3fb6b2db85	GR	GRC	300	Greece 	Grčija	\N
00040000-55dd-a916-de4e-6b8177b06049	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-55dd-a916-bc69-514f1651ce62	GD	GRD	308	Grenada 	Grenada	\N
00040000-55dd-a916-3670-2a8c8e2b7fd1	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-55dd-a916-9b77-1c86f34ca49f	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-55dd-a916-3229-055bb14a0945	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-55dd-a916-7d85-4d27922f08c0	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-55dd-a916-5de6-e713b40fa100	GN	GIN	324	Guinea 	Gvineja	\N
00040000-55dd-a916-d901-4e919df5b60d	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-55dd-a916-9e02-26d966134aa0	GY	GUY	328	Guyana 	Gvajana	\N
00040000-55dd-a916-4f9f-56e7d52b1fd4	HT	HTI	332	Haiti 	Haiti	\N
00040000-55dd-a916-6929-39e6a90b993f	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-55dd-a916-f64b-c51387f26061	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-55dd-a916-f747-c8df18d77297	HN	HND	340	Honduras 	Honduras	\N
00040000-55dd-a916-a7e4-17c681e1d847	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-55dd-a916-d6c3-d6a6dd5b97f0	HU	HUN	348	Hungary 	Madžarska	\N
00040000-55dd-a916-e61b-a876b02bfca7	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-55dd-a916-68fa-9a7214cb6dc1	IN	IND	356	India 	Indija	\N
00040000-55dd-a916-9ef3-1f6e76ade940	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-55dd-a916-84d8-9aca2f566d2b	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-55dd-a916-230e-95e081d76db3	IQ	IRQ	368	Iraq 	Irak	\N
00040000-55dd-a916-1764-fce56b009664	IE	IRL	372	Ireland 	Irska	\N
00040000-55dd-a916-2093-5b53ca07fcce	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-55dd-a916-4062-9a28814bbe26	IL	ISR	376	Israel 	Izrael	\N
00040000-55dd-a916-8e20-340b2186f10e	IT	ITA	380	Italy 	Italija	\N
00040000-55dd-a916-cf09-211906227ff0	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-55dd-a916-1667-3605e27b2182	JP	JPN	392	Japan 	Japonska	\N
00040000-55dd-a916-bfef-43873f2957b2	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-55dd-a916-ff31-59e518a92f36	JO	JOR	400	Jordan 	Jordanija	\N
00040000-55dd-a916-5d96-cc3d9d600287	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-55dd-a916-546c-f9c19194113c	KE	KEN	404	Kenya 	Kenija	\N
00040000-55dd-a916-fa0b-526709ce41d1	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-55dd-a916-667d-2b5e3683053d	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-55dd-a916-522b-c91ef58042e3	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-55dd-a916-9215-cb1195fc2e33	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-55dd-a916-6402-46fded24daf6	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-55dd-a916-5492-0213341cc812	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-55dd-a916-5e95-26a7ed8607be	LV	LVA	428	Latvia 	Latvija	\N
00040000-55dd-a916-316c-89ae91c5a97c	LB	LBN	422	Lebanon 	Libanon	\N
00040000-55dd-a916-65fd-3df83970fc2d	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-55dd-a916-9d85-9fd9d92ea42f	LR	LBR	430	Liberia 	Liberija	\N
00040000-55dd-a916-4f3b-8886635afb2f	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-55dd-a916-ba41-a13bc06da9f8	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-55dd-a916-3153-3077393120cc	LT	LTU	440	Lithuania 	Litva	\N
00040000-55dd-a916-846c-674dec843d2a	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-55dd-a916-b460-26fc17eecace	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-55dd-a916-2b90-29fbff9859fb	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-55dd-a916-6079-d3cc54e089f2	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-55dd-a916-a4e4-2df3cfef7149	MW	MWI	454	Malawi 	Malavi	\N
00040000-55dd-a916-ca3f-b965054ea680	MY	MYS	458	Malaysia 	Malezija	\N
00040000-55dd-a916-287f-5d9874334883	MV	MDV	462	Maldives 	Maldivi	\N
00040000-55dd-a916-65d8-02fcdfc78447	ML	MLI	466	Mali 	Mali	\N
00040000-55dd-a916-bda2-8746d1b9ffc7	MT	MLT	470	Malta 	Malta	\N
00040000-55dd-a916-3f7a-c81049d2f16f	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-55dd-a916-a4f4-c3a522b96da9	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-55dd-a916-d402-97ea7251a760	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-55dd-a916-6c5a-b9dea89510e1	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-55dd-a916-bc15-c1e777e863fe	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-55dd-a916-02c8-05f9fb6f3c83	MX	MEX	484	Mexico 	Mehika	\N
00040000-55dd-a916-741c-676da5b555d2	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-55dd-a916-a679-aadcf8804a08	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-55dd-a916-8a09-592913b1721d	MC	MCO	492	Monaco 	Monako	\N
00040000-55dd-a916-f718-b39eb90e337b	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-55dd-a916-0559-8a578def43db	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-55dd-a916-6f69-967ff70fbe2a	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-55dd-a916-1c7c-111650189942	MA	MAR	504	Morocco 	Maroko	\N
00040000-55dd-a916-9108-34301ae93de7	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-55dd-a916-e04f-f69e0c91e65b	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-55dd-a916-d1c0-7ae5e1bb4752	NA	NAM	516	Namibia 	Namibija	\N
00040000-55dd-a916-57ec-e6f9f63baa52	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-55dd-a916-11b4-22790e86fd23	NP	NPL	524	Nepal 	Nepal	\N
00040000-55dd-a916-2d93-0e5d89a326c8	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-55dd-a916-571f-4b7dd5876cf0	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-55dd-a916-545a-7b80dfd543c2	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-55dd-a916-4db0-44f264e5aff5	NE	NER	562	Niger 	Niger 	\N
00040000-55dd-a916-1e6d-9082a5653014	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-55dd-a916-eea2-b60df21e3cdf	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-55dd-a916-7304-e4ecb2256061	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-55dd-a916-261a-ca9eba652fb2	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-55dd-a916-0ec5-099e1df98f6c	NO	NOR	578	Norway 	Norveška	\N
00040000-55dd-a916-1ff9-57f421f2f3ff	OM	OMN	512	Oman 	Oman	\N
00040000-55dd-a916-2b7c-303a6db297f4	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-55dd-a916-321e-d39788acd649	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-55dd-a916-1c61-ed18c7129afa	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-55dd-a916-9704-975ae180b3db	PA	PAN	591	Panama 	Panama	\N
00040000-55dd-a916-7d0c-b055b31d2efb	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-55dd-a916-a194-e1e0e234d915	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-55dd-a916-8def-563ed36985fb	PE	PER	604	Peru 	Peru	\N
00040000-55dd-a916-2f9d-67868a2d242a	PH	PHL	608	Philippines 	Filipini	\N
00040000-55dd-a916-72ae-ec711c7fd942	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-55dd-a916-2b48-e278b45caa6c	PL	POL	616	Poland 	Poljska	\N
00040000-55dd-a916-d2d6-1521d327114e	PT	PRT	620	Portugal 	Portugalska	\N
00040000-55dd-a916-6f19-9073178d7152	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-55dd-a916-4842-0ba565609431	QA	QAT	634	Qatar 	Katar	\N
00040000-55dd-a916-f77a-fcbd711192b9	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-55dd-a916-6737-a4ebe7cdf663	RO	ROU	642	Romania 	Romunija	\N
00040000-55dd-a916-945a-12260c8c896f	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-55dd-a916-7a38-53463ee9ce25	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-55dd-a916-31cf-5d250f0698e9	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-55dd-a916-044c-9b9e616d8a62	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-55dd-a916-b4ee-cbac926e7296	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-55dd-a916-9829-d8c9a6997fb9	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-55dd-a916-6a60-b6dcdd749050	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-55dd-a916-cae5-87d0e8e4b736	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-55dd-a916-461f-6ffe0f39fa82	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-55dd-a916-9e2f-2d5888dc0be9	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-55dd-a916-f9c9-203978c85998	SM	SMR	674	San Marino 	San Marino	\N
00040000-55dd-a916-2cb1-40f9821cda73	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-55dd-a916-85ec-26e7f0ea1638	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-55dd-a916-69ee-287acad2f39e	SN	SEN	686	Senegal 	Senegal	\N
00040000-55dd-a916-99d2-9c0067507ec7	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-55dd-a916-26a1-19cbb9a568ae	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-55dd-a916-316d-b03d4d7304a6	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-55dd-a916-5354-76132e556113	SG	SGP	702	Singapore 	Singapur	\N
00040000-55dd-a916-3ebf-428924d80249	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-55dd-a916-eff9-cfd2be50e105	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-55dd-a916-443c-bd20c44582ab	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-55dd-a916-2318-5010c377397b	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-55dd-a916-ecea-a0bc47d1fa97	SO	SOM	706	Somalia 	Somalija	\N
00040000-55dd-a916-6e5f-c415aff38574	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-55dd-a916-863b-fd9da46c093c	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-55dd-a916-07ff-91368b16c783	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-55dd-a916-5f06-cf01536cdb58	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-55dd-a916-98fd-a4fddbb4c59b	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-55dd-a916-c452-8a6b372932e6	SD	SDN	729	Sudan 	Sudan	\N
00040000-55dd-a916-231f-41488f7a009c	SR	SUR	740	Suriname 	Surinam	\N
00040000-55dd-a916-1825-24ebcc79ef3b	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-55dd-a916-024b-bf40a5e73bc6	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-55dd-a916-7557-53b9ae66b6be	SE	SWE	752	Sweden 	Švedska	\N
00040000-55dd-a916-0037-551ff451950c	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-55dd-a916-5631-2121628a477b	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-55dd-a916-5373-90d4010fe7c6	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-55dd-a916-4f14-37c84ca8c0e8	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-55dd-a916-c6b2-f41d27bd7e09	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-55dd-a916-b708-f706109c89aa	TH	THA	764	Thailand 	Tajska	\N
00040000-55dd-a916-7dd5-2da5e06270dc	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-55dd-a916-3bfe-722a8257c7f7	TG	TGO	768	Togo 	Togo	\N
00040000-55dd-a916-7dc0-a3497aeddfd8	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-55dd-a916-bb5a-989f688691c0	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-55dd-a916-8483-e0708c7453c5	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-55dd-a916-7edc-d71ed765eaf0	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-55dd-a916-97d5-9a42ab56d588	TR	TUR	792	Turkey 	Turčija	\N
00040000-55dd-a916-028c-9e1e58bf3491	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-55dd-a916-4355-32e4b644b87a	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-55dd-a916-3fe9-abc959dcc45f	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-55dd-a916-6902-f7d745534a2b	UG	UGA	800	Uganda 	Uganda	\N
00040000-55dd-a916-2191-f12ba9fa8d2a	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-55dd-a916-6c19-c916d2c6dd44	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-55dd-a916-4b66-f68f85b602b1	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-55dd-a916-713f-1e37eaee6d64	US	USA	840	United States 	Združene države Amerike	\N
00040000-55dd-a916-0594-1aa0915ebdca	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-55dd-a916-a2b5-7dcf8913f04c	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-55dd-a916-5aaf-f98e4ce092aa	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-55dd-a916-03e7-387e6c9b5b2f	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-55dd-a916-cb3b-2ee29d20f963	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-55dd-a916-86c7-b4cbbeaa7d6e	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-55dd-a916-b083-5a381fbfd876	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-55dd-a916-4a34-2b4b936cd942	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-55dd-a916-cb40-b8020bbf1974	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-55dd-a916-faba-b91a5d6761c6	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-55dd-a916-f111-cc3903878812	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-55dd-a916-566b-eaa5b47a02c4	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-55dd-a916-101d-a4041ed85034	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 2956 (class 0 OID 15629230)
-- Dependencies: 224
-- Data for Name: enotaprograma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY enotaprograma (id, uprizoritev_id, program_dela_id, gostitelj_id, celotnavrednost, nasdelez, celotnavrednostmat, celotnavrednostgostovsz, zaproseno, lastnasredstva, avtorskihonorarji, avtorskihonorarjisamoz, tantieme, avtorskepravice, materialni, imakoprodukcije, vlozekgostitelja, drugijavni, stzaposlenih, stzaposumet, stzaposdrug, sthonorarnih, sthonorarnihigr, sthonorarnihigrtujjz, sthonorarnihigrsamoz, obiskdoma, obiskkopr, obiskgost, obiskzamejo, obiskint, obiskkoprint, ponovidoma, ponovikopr, ponovizamejo, ponovigost, ponovikoprint, ponoviint, naziv, kpe, sort, tipprogramskeenote_id, tip, strosekodkpred, stroskiostali, krajgostovanja, ustanova, datumgostovanja, transportnistroski, dnevprvzad, drzavagostovanja_id, stpe, zvrst, stpredstav, stokroglihmiz, stpredstavitev, stdelavnic, stdrugidogodki, stprodukcij, caspriprave, casizvedbe, prizorisca, umetvodja, programskotelo, sttujihselektorjev) FROM stdin;
002f0000-55dd-a918-bded-c837ebd7b8bc	000e0000-55dd-a918-e1e2-95eceb14f6fa	\N	\N	9000.30	9000.30	9000.30	0.00	3600.12	5299.98	4000.40	1000.40	200.20	200.30	4599.40	\N	0.00	100.20	0	2	2	2	2	2	\N	40	0	0	0	0	0	1	0	0	0	0	0		0.00	\N	002b0000-55dd-a916-326c-5383ee85c596	premiera	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-55dd-a918-1908-37eff6411263	000e0000-55dd-a918-5f96-d2c003315781	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	\N	60	0	0	0	0	0	1	0	0	0	0	0		0.00	\N	002b0000-55dd-a916-cd22-4797e82e3e86	premiera	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-55dd-a918-16db-573f42487329	000e0000-55dd-a918-46d7-58e2ef06661d	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	\N	60	0	0	0	0	0	1	0	0	0	0	0		0.00	\N	002b0000-55dd-a916-326c-5383ee85c596	premiera	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-55dd-a918-b163-1d1de9c78056	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-54.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	54.20	5	0	0	3	0	0	\N	22	0	0	0	0	0	0	0	0	0	0	0	Urejanje portala	0.00	10	\N	razno	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-55dd-a918-370b-55ebb1591eec	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-31.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	31.20	5	0	0	3	0	0	\N	202	0	0	0	0	0	0	0	0	0	0	0	Delavnice otroci	0.00	8	\N	razno	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 2942 (class 0 OID 15629047)
-- Dependencies: 210
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, podrocje, vodjaekipe, naziv, komentar, velikost, pomembna, sort, seplanira, dovoliprekrivanje, maxprekrivanj, tipfunkcije_id) FROM stdin;
000d0000-55dd-a918-63fb-20be37d778da	000e0000-55dd-a918-5f96-d2c003315781	\N	igralec	\N	Hipolita	glavna vloga	velika	t	6	t	t	\N	000f0000-55dd-a916-3eb3-28bff80f4bce
000d0000-55dd-a918-fb76-e524bc54134b	000e0000-55dd-a918-5f96-d2c003315781	\N	igralec	\N	Tezej	glavna vloga	velika	t	5	t	t	\N	000f0000-55dd-a916-3eb3-28bff80f4bce
000d0000-55dd-a918-a516-f6d868d6c38d	000e0000-55dd-a918-5f96-d2c003315781	\N	umetnik	\N	Režija		velika	t	8	t	t	\N	000f0000-55dd-a916-3b8b-347b95838d6c
000d0000-55dd-a918-b16d-1d12d8f722aa	000e0000-55dd-a918-5f96-d2c003315781	\N	inspicient	t	Inšpicient			t	8	t	t	\N	000f0000-55dd-a916-4d82-419b65b46b28
000d0000-55dd-a918-e809-88e3d08e4836	000e0000-55dd-a918-5f96-d2c003315781	\N	tehnik	t	Tehnični vodja			t	8	t	t	\N	000f0000-55dd-a916-dc36-6a06ecb97bae
000d0000-55dd-a918-792d-42e06e5f68b6	000e0000-55dd-a918-5f96-d2c003315781	\N	tehnik	\N	Razsvetljava			t	3	t	t	\N	000f0000-55dd-a916-dc36-6a06ecb97bae
000d0000-55dd-a918-40c1-9a044d1b4620	000e0000-55dd-a918-5f96-d2c003315781	\N	igralec	\N	Helena	glavna vloga	velika	t	5	t	t	\N	000f0000-55dd-a916-3eb3-28bff80f4bce
000d0000-55dd-a918-4d10-04ae51b4505e	000e0000-55dd-a918-5f96-d2c003315781	\N	umetnik	\N	Lektoriranje			t	22	t	t	\N	000f0000-55dd-a916-e12d-61804da07f20
\.


--
-- TOC entry 2921 (class 0 OID 15628860)
-- Dependencies: 189
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta, zamejstvo, kraj) FROM stdin;
\.


--
-- TOC entry 2925 (class 0 OID 15628908)
-- Dependencies: 193
-- Data for Name: gostujoca; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostujoca (id, uprizoritev_id) FROM stdin;
\.


--
-- TOC entry 2919 (class 0 OID 15628840)
-- Dependencies: 187
-- Data for Name: kontaktnaoseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kontaktnaoseba (id, popa_id, oseba_id, status, funkcija, opis) FROM stdin;
00260000-55dd-a918-fba6-afe72e12497f	00080000-55dd-a918-9913-4f942e6b3d4a	00090000-55dd-a918-1d48-b5db5ab80890	AK		
\.


--
-- TOC entry 2931 (class 0 OID 15628962)
-- Dependencies: 199
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 2969 (class 0 OID 15629447)
-- Dependencies: 237
-- Data for Name: mapa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa (id, lastnik_id, parent_id, ime, komentar, caskreiranja, casspremembe, javnidostop, upor, datknj) FROM stdin;
\.


--
-- TOC entry 2970 (class 0 OID 15629459)
-- Dependencies: 238
-- Data for Name: mapa_zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa_zapis (mapa_id, zapis_id) FROM stdin;
\.


--
-- TOC entry 2972 (class 0 OID 15629481)
-- Dependencies: 240
-- Data for Name: mapaacl; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapaacl (id, mapa_id, perm_id, dostop, upor, datknj) FROM stdin;
\.


--
-- TOC entry 2935 (class 0 OID 15628987)
-- Dependencies: 203
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 2916 (class 0 OID 15628797)
-- Dependencies: 184
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-55dd-a917-fc2a-3e6511f2bf31	popa.stakli	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-55dd-a917-6bad-05e3641c2052	oseba.spol	array	a:2:{s:1:"M";a:1:{s:5:"label";s:6:"Moški";}s:1:"Z";a:1:{s:5:"label";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-55dd-a917-eb04-9f42ad0dde77	telefonska.vrsta	array	a:3:{s:7:"mobilna";a:1:{s:5:"label";s:7:"Mobilni";}s:6:"domaca";a:1:{s:5:"label";s:6:"Domač";}s:6:"fiksna";a:1:{s:5:"label";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-55dd-a917-6c56-d12c5ae95603	kontaktnaoseba.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status kontaktne osebe
00000000-55dd-a917-eafa-c9eb256e62ea	dogodek.status	array	a:2:{s:7:"osnutek";a:1:{s:5:"label";s:11:"Dolgoročno";}s:8:"planiran";a:1:{s:5:"label";s:8:"Planiran";}}	f	f	t	\N	Tabela statusa dogodkov
00000000-55dd-a917-8725-a0ea1f565287	uprizoritev.faza	array	a:6:{s:20:"predprodukcija-ideja";a:1:{s:5:"label";s:16:"Dolgoročni plan";}s:20:"predprodukcija-poziv";a:1:{s:5:"label";s:29:"Predprodukcija, v fazi poziva";}s:30:"predprodukcija-potrjen_program";a:1:{s:5:"label";s:34:"Predprodukcija, program je potrjen";}s:10:"produkcija";a:1:{s:5:"label";s:10:"Produkcija";}s:14:"postprodukcija";a:1:{s:5:"label";s:14:"Postprodukcija";}s:5:"arhiv";a:1:{s:5:"label";s:10:"Arhivirana";}}	f	t	f	\N	Faza uprizoritve
00000000-55dd-a917-a2ac-90fb6493399a	funkcija.podrocje	array	a:4:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}}	f	t	f	\N	Področje funkcije
00000000-55dd-a917-80aa-8a21a9356d0c	tipfunkcije.podrocje	array	a:3:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}}	f	t	f	\N	Področje funkcije
00000000-55dd-a917-56c2-83ea33268c64	funkcija.velikost	array	a:4:{s:7:"stataza";a:1:{s:5:"label";s:8:"Stataža";}s:4:"mala";a:1:{s:5:"label";s:21:"Mala vloga / funkcija";}s:7:"srednja";a:1:{s:5:"label";s:24:"Srednja vloga / funkcija";}s:6:"velika";a:1:{s:5:"label";s:23:"Velika vloga / funkcija";}}	f	t	f	\N	Velikost funkcije
00000000-55dd-a917-8c93-e8575e7c074e	zaposlitev.status	array	a:2:{s:1:"A";a:1:{s:5:"label";s:7:"Aktivna";}s:1:"N";a:1:{s:5:"label";s:9:"Neaktivna";}}	f	t	f	\N	Status zaposlitve
00000000-55dd-a917-4a2e-3d333ef7b181	produkcijskahisa.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktivna";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktivna";}}	f	t	f	\N	Status produkcijske hiše
00000000-55dd-a917-3ef9-7bb0cc054bf7	strosekuprizoritve.tipstroska	array	a:2:{s:10:"materialni";a:1:{s:5:"label";s:19:"Materialni strošek";}s:9:"avtorprav";a:1:{s:5:"label";s:32:"Strošek odkupa avtorskih pravic";}}	f	t	f	\N	Tip stroška
00000000-55dd-a917-8200-74707010e2a1	fsacl.dostop	array	a:4:{s:1:"X";a:1:{s:5:"label";s:12:"Brez dostopa";}s:1:"R";a:1:{s:5:"label";s:11:"Samo branje";}s:2:"RW";a:1:{s:5:"label";s:17:"Branje in pisanje";}s:3:"RWD";a:1:{s:5:"label";s:26:"Branje pisanje in brisanje";}}	f	t	f	\N	ACL Javni dostop
00000000-55dd-a918-b6b4-2ca819477321	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-55dd-a918-044e-d5e21ad353d3	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-55dd-a918-e4ba-95cfa498b120	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-55dd-a918-97fb-bc9f9235eefc	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-55dd-a918-fab6-6e77d3aa669c	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
00000000-55dd-a919-9bb0-6ae70321c131	application.tenant.maticnopodjetje	string	s:4:"1001";	f	t	f		Šifra matičnega podjetja v Popa in ProdukcijskaHisa
\.


--
-- TOC entry 2910 (class 0 OID 15628711)
-- Dependencies: 178
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-55dd-a918-40ec-d395a3e52a55	00000000-55dd-a918-b6b4-2ca819477321	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-55dd-a918-0fb4-ce457c4dcf7b	00000000-55dd-a918-b6b4-2ca819477321	00010000-55dd-a917-9016-20c688431dfd	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-55dd-a918-9118-48ab18e24690	00000000-55dd-a918-044e-d5e21ad353d3	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 2911 (class 0 OID 15628722)
-- Dependencies: 179
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naslov_id, sifra, naziv, ime, priimek, funkcija, srednjeime, polnoime, psevdonim, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
00090000-55dd-a918-4035-df2a75e3f5d2	\N	\N	0001	g.	Janez	Novak	a	Peter	Janez Peter Novak	Jani	jani.novak@xxx.xx	1958-01-06	0601958000000	123456789	M	Jani Janez	Slovenija	Slovenija	Ljubljana
00090000-55dd-a918-e2a7-08ade7d43278	00010000-55dd-a918-48d1-93fe89f4fe38	\N	0002	dr.	Anton	Horvat	b		Anton  Horvat	Tona	anton.horvat@xxx.xx	1968-02-12	1202968111111	234567890	M		Slovenija	Slovenija	Maribor
00090000-55dd-a918-d803-e026c723e945	00010000-55dd-a918-c99b-05e83381d33b	\N	0003		Ivan	Kovačič	c		Ivan  Kovačič	Ivo	ivan.kovacic@xxx.xx	1975-03-26	2603976222222	345678901	M		Slovenija	Slovenija	Celje
00090000-55dd-a918-e62c-3f86c7496681	00010000-55dd-a918-a864-274df5427c80	\N	0004	prof.	Jožef	Krajnc	d		Jožef  Krajnc	Joža	jozef.krajnc@xxx.xx	1971-04-30	3004971333333	456789012	M		Slovenija	Slovenija	Kranj
00090000-55dd-a918-0a0b-56150ec766c2	\N	\N	0005		Marko	Zupančič	e		Marko  Zupančič		marko.zupancic@xxx.xx	1984-05-07	0705984444444	567890123	M		Slovenija	Slovenija	Koper
00090000-55dd-a918-69d3-c3e49503a711	\N	\N	0006	ga.	Marija	Kovač	f		Marija  Kovač		marija.kovac@xxx.xx	1962-06-19	1906962444444	678901234	Z		Slovenija	Slovenija	Murska Sobota
00090000-55dd-a918-7f4f-fad684bf99e8	\N	\N	0007	ga.	Ana	Potočnik	g		Ana  Potočnik		ana.potocnik@xxx.xx	1975-07-24	2407975555555	789012345	Z		Slovenija	Slovenija	Novo Mesto
00090000-55dd-a918-4757-5e5e841123be	\N	\N	0008	ga.	Maja	Mlakar	h		Maja  Mlakar		maja.mlakar@xxx.xx	1986-08-02	0208986666666	890123456	Z		Slovenija	Slovenija	Nova Gorica
00090000-55dd-a918-1d48-b5db5ab80890	00010000-55dd-a918-3ae3-43b0acefa01c	\N	0009		Irena	Kos	i		Irena  Kos		irena.kos@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Ptuj
00090000-55dd-a918-cbdb-fcf7d436bbdd	\N	\N	0010		Mojca	Vidmar	J		Mojca  Vidmar		mojca.vidmar@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Idrija
00090000-55dd-a918-194d-b876f444d707	\N	\N	0011		xx	write protected12345	a		xx  write protected12345		xx@xxx.xx	\N	\N	\N	Z		\N	\N	\N
00090000-55dd-a918-084a-5e42addb69db	\N	\N	0012		Luka	Golob	luč	a	Luka a Golob		luka.golob@xxx.xx	\N	\N	\N	M		\N	\N	\N
00090000-55dd-a918-ffd5-fabdde1f707c	00010000-55dd-a918-964b-d8b05ccf4ef0	\N	0013		Tatjana	Božič	tajnica	a	Tatjana a Božič		tatjana.bozic@xxx.xx	\N	\N	\N	Z		\N	\N	\N
\.


--
-- TOC entry 2906 (class 0 OID 15628676)
-- Dependencies: 174
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-55dd-a916-836f-a53141b6a49a	Aaa-read	Aaa (User,Role,Permission) - branje	f
00030000-55dd-a916-10d6-28c8ad908213	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	f
00030000-55dd-a916-2b13-4102b53e410a	TerminStoritve-vse	TerminStoritve - spreminjanje vseh zapisov	f
00030000-55dd-a916-9d48-2fc18ebb7a9a	Dogodek-readVse	Dogodek - branje vseh, ne glede na status dogodka	f
00030000-55dd-a916-4011-7d57d125f110	Oseba-vse	Oseba - vse - za testiranje assert	f
00030000-55dd-a916-75db-41f59f5533d4	ProgramDela-lock	ProgramDela - zaklepanje	f
00030000-55dd-a916-a226-418f1f398562	Abonma-read	Abonma - branje	f
00030000-55dd-a916-47f3-1f2854286951	Abonma-write	Abonma - spreminjanje	f
00030000-55dd-a916-e66c-cd933cd7d2a6	Alternacija-read	Alternacija - branje	f
00030000-55dd-a916-300f-ecec502faaa5	Alternacija-write	Alternacija - spreminjanje	f
00030000-55dd-a916-678b-e99400731b37	Arhivalija-read	Arhivalija - branje	f
00030000-55dd-a916-8f54-b005003cd5c7	Arhivalija-write	Arhivalija - spreminjanje	f
00030000-55dd-a916-c814-0ca20eac804f	Besedilo-read	Besedilo - branje	f
00030000-55dd-a916-a76b-1922244f5d11	Besedilo-write	Besedilo - spreminjanje	f
00030000-55dd-a916-e9ca-d8d5125b65a2	DogodekIzven-read	DogodekIzven - branje	f
00030000-55dd-a916-8c97-1935afc76eda	DogodekIzven-write	DogodekIzven - spreminjanje	f
00030000-55dd-a916-22e3-328477368586	Dogodek-read	Dogodek - branje	f
00030000-55dd-a916-3e68-854aa63b0b38	Dogodek-write	Dogodek - spreminjanje	f
00030000-55dd-a916-abc1-0e5ddcb6793b	DrugiVir-read	DrugiVir - branje	f
00030000-55dd-a916-5a92-dac5316d1c5b	DrugiVir-write	DrugiVir - spreminjanje	f
00030000-55dd-a916-9d73-2d6aaa933e02	Drzava-read	Drzava - branje	f
00030000-55dd-a916-2a54-6a0577f6a0ee	Drzava-write	Drzava - spreminjanje	f
00030000-55dd-a916-759f-4d54b31b7ffd	EnotaPrograma-read	EnotaPrograma - branje	f
00030000-55dd-a916-9aaf-811520d4e0ab	EnotaPrograma-write	EnotaPrograma - spreminjanje	f
00030000-55dd-a916-8420-e57db078bdbf	Funkcija-read	Funkcija - branje	f
00030000-55dd-a916-c3cc-1c8da2609f5c	Funkcija-write	Funkcija - spreminjanje	f
00030000-55dd-a916-c9db-652d76399dc5	Gostovanje-read	Gostovanje - branje	f
00030000-55dd-a916-9622-353da6f4b1c1	Gostovanje-write	Gostovanje - spreminjanje	f
00030000-55dd-a916-be1f-8dddd8ce021d	Gostujoca-read	Gostujoca - branje	f
00030000-55dd-a916-dc80-08bef70ad6bd	Gostujoca-write	Gostujoca - spreminjanje	f
00030000-55dd-a916-22ee-52d8aeb6fc8f	KontaktnaOseba-read	KontaktnaOseba - branje	f
00030000-55dd-a916-3131-53df17830cbc	KontaktnaOseba-write	KontaktnaOseba - spreminjanje	f
00030000-55dd-a916-2999-9d2fcc4baf04	Kupec-read	Kupec - branje	f
00030000-55dd-a916-fdd0-e4bb85236d6a	Kupec-write	Kupec - spreminjanje	f
00030000-55dd-a916-2205-f417af4b7018	NacinPlacina-read	NacinPlacina - branje	f
00030000-55dd-a916-546b-5d1f913af31a	NacinPlacina-write	NacinPlacina - spreminjanje	f
00030000-55dd-a916-0a10-2590fadf8470	Option-read	Option - branje	f
00030000-55dd-a916-8abd-ee3529e6ea68	Option-write	Option - spreminjanje	f
00030000-55dd-a916-2599-397654af3d41	OptionValue-read	OptionValue - branje	f
00030000-55dd-a916-8924-6de9ae378013	OptionValue-write	OptionValue - spreminjanje	f
00030000-55dd-a916-4d79-31c30a01dd63	Oseba-read	Oseba - branje	f
00030000-55dd-a916-eca6-b7826933bab8	Oseba-write	Oseba - spreminjanje	f
00030000-55dd-a916-1d7e-0a8782ebda45	PlacilniInstrument-read	PlacilniInstrument - branje	f
00030000-55dd-a916-7584-70302f45262c	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	f
00030000-55dd-a916-5038-9a3d8b806980	PodrocjeSedenja-read	PodrocjeSedenja - branje	f
00030000-55dd-a916-dce8-c80078fef463	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	f
00030000-55dd-a916-8750-e2ae4700ac0f	Pogodba-read	Pogodba - branje	f
00030000-55dd-a916-d82e-90a818938ce4	Pogodba-write	Pogodba - spreminjanje	f
00030000-55dd-a916-02a4-714539e9292f	Popa-read	Popa - branje	f
00030000-55dd-a916-fed2-fa1bb6a96b59	Popa-write	Popa - spreminjanje	f
00030000-55dd-a916-0e84-cade1adfe6f1	Posta-read	Posta - branje	f
00030000-55dd-a916-ad6f-81e6bda2bebc	Posta-write	Posta - spreminjanje	f
00030000-55dd-a916-7d84-f27016421578	PostavkaRacuna-read	PostavkaRacuna - branje	f
00030000-55dd-a916-8da7-cb20f809e857	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	f
00030000-55dd-a916-3a45-7bc960779b9a	PostniNaslov-read	PostniNaslov - branje	f
00030000-55dd-a916-0038-1a77bb923729	PostniNaslov-write	PostniNaslov - spreminjanje	f
00030000-55dd-a916-6b69-93699a873c35	Predstava-read	Predstava - branje	f
00030000-55dd-a916-37f2-0c3236bc20ef	Predstava-write	Predstava - spreminjanje	f
00030000-55dd-a916-f901-5eca3b1e1150	ProdajaPredstave-read	ProdajaPredstave - branje	f
00030000-55dd-a916-e471-123e77c82abb	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	f
00030000-55dd-a916-922e-bfff0a971797	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	f
00030000-55dd-a916-5e83-5ddfe564ff5a	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	f
00030000-55dd-a916-c80d-46be14df4db7	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	f
00030000-55dd-a916-1431-e0da1c4a8bf2	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	f
00030000-55dd-a916-7ec2-339b9ff3b711	ProgramDela-read	ProgramDela - branje	f
00030000-55dd-a916-ae28-22dd76e7dbaf	ProgramDela-write	ProgramDela - spreminjanje	f
00030000-55dd-a916-af5f-a766fcc19fb7	ProgramFestival-read	ProgramFestival - branje	f
00030000-55dd-a916-3da5-d36a1d670ea2	ProgramFestival-write	ProgramFestival - spreminjanje	f
00030000-55dd-a916-bac8-b205f920d12d	ProgramGostovanje-read	ProgramGostovanje - branje	f
00030000-55dd-a916-e52a-d0cb5e4591f8	ProgramGostovanje-write	ProgramGostovanje - spreminjanje	f
00030000-55dd-a916-bece-b126d8d0806d	ProgramGostujoca-read	ProgramGostujoca - branje	f
00030000-55dd-a916-10db-18ff4ee2ad2e	ProgramGostujoca-write	ProgramGostujoca - spreminjanje	f
00030000-55dd-a916-3c63-b09d722ff489	ProgramIzjemni-read	ProgramIzjemni - branje	f
00030000-55dd-a916-2bad-811534100431	ProgramIzjemni-write	ProgramIzjemni - spreminjanje	f
00030000-55dd-a916-2252-e67d01b462bb	ProgramPonovitevPrejsnjih-read	ProgramPonovitevPrejsnjih - branje	f
00030000-55dd-a916-a196-31257197cec5	ProgramPonovitevPrejsnjih-write	ProgramPonovitevPrejsnjih - spreminjanje	f
00030000-55dd-a916-7fa5-a62597afbff7	ProgramPonovitevPremiere-read	ProgramPonovitevPremiere - branje	f
00030000-55dd-a916-4b03-8586f1211f36	ProgramPonovitevPremiere-write	ProgramPonovitevPremiere - spreminjanje	f
00030000-55dd-a916-20c2-a78176184293	ProgramPremiera-read	ProgramPremiera - branje	f
00030000-55dd-a916-c567-cb87ae00f50d	ProgramPremiera-write	ProgramPremiera - spreminjanje	f
00030000-55dd-a916-06d4-9472c7f9b177	ProgramRazno-read	ProgramRazno - branje	f
00030000-55dd-a916-8c86-4a6388bb5b72	ProgramRazno-write	ProgramRazno - spreminjanje	f
00030000-55dd-a916-5ac3-f740527b0dd8	ProgramskaEnotaSklopa-read	ProgramskaEnotaSklopa - branje	f
00030000-55dd-a916-e066-0acd8eb140d3	ProgramskaEnotaSklopa-write	ProgramskaEnotaSklopa - spreminjanje	f
00030000-55dd-a916-ba33-8e224a165f55	Prostor-read	Prostor - branje	f
00030000-55dd-a916-64b6-9b5e2f0b856a	Prostor-write	Prostor - spreminjanje	f
00030000-55dd-a916-f73c-07abbeed3bd8	Racun-read	Racun - branje	f
00030000-55dd-a916-54eb-c5b288f8aeed	Racun-write	Racun - spreminjanje	f
00030000-55dd-a916-a06c-21f9a3eabba1	RazpisanSedez-read	RazpisanSedez - branje	f
00030000-55dd-a916-21ae-b4fd0e85a141	RazpisanSedez-write	RazpisanSedez - spreminjanje	f
00030000-55dd-a916-5838-ed294b191fc2	Rekviziterstvo-read	Rekviziterstvo - branje	f
00030000-55dd-a916-0c6e-f5e00f1b0faf	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	f
00030000-55dd-a916-4c1b-e0eb2aad3679	Rekvizit-read	Rekvizit - branje	f
00030000-55dd-a916-9903-43a4b2c8834d	Rekvizit-write	Rekvizit - spreminjanje	f
00030000-55dd-a916-bfc2-05859ed48450	Revizija-read	Revizija - branje	f
00030000-55dd-a916-e799-864f64286a36	Revizija-write	Revizija - spreminjanje	f
00030000-55dd-a916-cdb2-941cbdcd5930	Rezervacija-read	Rezervacija - branje	f
00030000-55dd-a916-ee28-cf44a7a1d23b	Rezervacija-write	Rezervacija - spreminjanje	f
00030000-55dd-a916-b449-e9b6074c77d2	SedezniRed-read	SedezniRed - branje	f
00030000-55dd-a916-d398-53a4c805dd71	SedezniRed-write	SedezniRed - spreminjanje	f
00030000-55dd-a916-8a9f-ac0a31a62271	Sedez-read	Sedez - branje	f
00030000-55dd-a916-3fe0-36e12b1d9b5d	Sedez-write	Sedez - spreminjanje	f
00030000-55dd-a916-49d1-6d04116f79f7	Sezona-read	Sezona - branje	f
00030000-55dd-a916-81e2-5781cc7c9ca5	Sezona-write	Sezona - spreminjanje	f
00030000-55dd-a916-c28b-d5a0990610cd	StevilcenjeKonfig-read	StevilcenjeKonfig - branje	f
00030000-55dd-a916-29c0-601dbf1ea3fc	StevilcenjeKonfig-write	StevilcenjeKonfig - spreminjanje	f
00030000-55dd-a916-8edd-f16c781122d0	Stevilcenje-read	Stevilcenje - branje	f
00030000-55dd-a916-12a2-1e694209f46e	Stevilcenje-write	Stevilcenje - spreminjanje	f
00030000-55dd-a916-37eb-707968a8f2fa	StevilcenjeStanje-read	StevilcenjeStanje - branje	f
00030000-55dd-a916-d221-7e0e9b908736	StevilcenjeStanje-write	StevilcenjeStanje - spreminjanje	f
00030000-55dd-a916-fa9a-6f58bbdbfe1e	StrosekUprizoritve-read	StrosekUprizoritve - branje	f
00030000-55dd-a916-9422-5c5e6abd9bce	StrosekUprizoritve-write	StrosekUprizoritve - spreminjanje	f
00030000-55dd-a916-06b2-37d8c3e46f79	Telefonska-read	Telefonska - branje	f
00030000-55dd-a916-033a-98d0a2091fc4	Telefonska-write	Telefonska - spreminjanje	f
00030000-55dd-a916-43ed-3658904149b7	TerminStoritve-read	TerminStoritve - branje	f
00030000-55dd-a916-ca0a-e0d9ed65928a	TerminStoritve-write	TerminStoritve - spreminjanje	f
00030000-55dd-a916-8567-848768d0dd6e	TipFunkcije-read	TipFunkcije - branje	f
00030000-55dd-a916-cec0-2f0cd6ca09d2	TipFunkcije-write	TipFunkcije - spreminjanje	f
00030000-55dd-a916-20ac-2de1937545f5	TipProgramskeEnote-read	TipProgramskeEnote - branje	f
00030000-55dd-a916-5283-26232acf7267	TipProgramskeEnote-write	TipProgramskeEnote - spreminjanje	f
00030000-55dd-a916-f52a-a29c2a76f337	Trr-read	Trr - branje	f
00030000-55dd-a916-a8ef-fc9bc12584f6	Trr-write	Trr - spreminjanje	f
00030000-55dd-a916-01db-d6da5c3e74c6	Uprizoritev-read	Uprizoritev - branje	f
00030000-55dd-a916-654f-4bffc433f1e9	Uprizoritev-write	Uprizoritev - spreminjanje	f
00030000-55dd-a916-f420-b3265d5f5119	Vaja-read	Vaja - branje	f
00030000-55dd-a916-1a9d-690ffc84fd6e	Vaja-write	Vaja - spreminjanje	f
00030000-55dd-a916-76f1-f9d26035d6c5	VrstaSedezev-read	VrstaSedezev - branje	f
00030000-55dd-a916-c02d-d9c31c0c90e5	VrstaSedezev-write	VrstaSedezev - spreminjanje	f
00030000-55dd-a916-1404-e6f805d55f34	VrstaStroska-read	VrstaStroska - branje	f
00030000-55dd-a916-83ea-2e551251ac36	VrstaStroska-write	VrstaStroska - spreminjanje	f
00030000-55dd-a916-a3b6-37a129ebc173	Zaposlitev-read	Zaposlitev - branje	f
00030000-55dd-a916-40ae-3d2fac68622a	Zaposlitev-write	Zaposlitev - spreminjanje	f
00030000-55dd-a916-e347-d84662454e30	Zasedenost-read	Zasedenost - branje	f
00030000-55dd-a916-1733-bc145e7cb2de	Zasedenost-write	Zasedenost - spreminjanje	f
00030000-55dd-a916-5c58-9a41aca88a37	ZvrstSurs-read	ZvrstSurs - branje	f
00030000-55dd-a916-68f9-10a7c93d2858	ZvrstSurs-write	ZvrstSurs - spreminjanje	f
00030000-55dd-a916-acc5-b90ed0a592d5	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	f
00030000-55dd-a916-8a86-2caad49e31d8	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	f
00030000-55dd-a916-c35d-bcb167e9c0bb	Mapa-write	Mapa - osnovno dovoljenje za pisanje	f
00030000-55dd-a916-7647-8a57721322d8	Mapa-read	Mapa - osnovno dovoljenje za branje	f
00030000-55dd-a916-0997-e344d7da449f	MapaAcl-write	MapaAcl - dovoljenje za dostop pisanje ACL-jev mape	f
00030000-55dd-a916-e291-a4538462b0e5	MapaAcl-read	MapaAcl - dovoljenje za dostop branje ACL-jev mape	f
00030000-55dd-a916-658e-7223d9ad83e5	Zapis-write	Zapis - dovoljenje za pisanje zapisov	f
00030000-55dd-a916-984b-45a9173e5759	Zapis-read	Zapis - dovoljenje za pisanje zapisov	f
00030000-55dd-a916-d484-1d31494012c5	ZapisLastnik-write	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	f
00030000-55dd-a916-42d1-c26a3d257d8c	ZapisLastnik-read	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	f
00030000-55dd-a916-c7b2-43220d9f5a25	VrstaZapisa-write	Šifrant vrst zapisa - spreminjanje	f
00030000-55dd-a916-c7c6-00c534c0b6ef	VrstaZapisa-read	Šifrant vrst zapisa - branje	f
00030000-55dd-a916-4066-59db0f91d237	Datoteka-write	Datoteka - spreminjanje	f
00030000-55dd-a916-d3b1-d400dc3d7166	Datoteka-read	Datoteke - branje	f
\.


--
-- TOC entry 2908 (class 0 OID 15628695)
-- Dependencies: 176
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-55dd-a917-c692-1ed284b8ef3a	00030000-55dd-a916-10d6-28c8ad908213
00020000-55dd-a917-10e8-fec7d7e37851	00030000-55dd-a916-9d73-2d6aaa933e02
00020000-55dd-a917-7ced-a861a830e973	00030000-55dd-a916-a226-418f1f398562
00020000-55dd-a917-7ced-a861a830e973	00030000-55dd-a916-47f3-1f2854286951
00020000-55dd-a917-7ced-a861a830e973	00030000-55dd-a916-e66c-cd933cd7d2a6
00020000-55dd-a917-7ced-a861a830e973	00030000-55dd-a916-300f-ecec502faaa5
00020000-55dd-a917-7ced-a861a830e973	00030000-55dd-a916-678b-e99400731b37
00020000-55dd-a917-7ced-a861a830e973	00030000-55dd-a916-22e3-328477368586
00020000-55dd-a917-7ced-a861a830e973	00030000-55dd-a916-9d48-2fc18ebb7a9a
00020000-55dd-a917-7ced-a861a830e973	00030000-55dd-a916-3e68-854aa63b0b38
00020000-55dd-a917-7ced-a861a830e973	00030000-55dd-a916-9d73-2d6aaa933e02
00020000-55dd-a917-7ced-a861a830e973	00030000-55dd-a916-2a54-6a0577f6a0ee
00020000-55dd-a917-7ced-a861a830e973	00030000-55dd-a916-8420-e57db078bdbf
00020000-55dd-a917-7ced-a861a830e973	00030000-55dd-a916-c3cc-1c8da2609f5c
00020000-55dd-a917-7ced-a861a830e973	00030000-55dd-a916-c9db-652d76399dc5
00020000-55dd-a917-7ced-a861a830e973	00030000-55dd-a916-9622-353da6f4b1c1
00020000-55dd-a917-7ced-a861a830e973	00030000-55dd-a916-be1f-8dddd8ce021d
00020000-55dd-a917-7ced-a861a830e973	00030000-55dd-a916-dc80-08bef70ad6bd
00020000-55dd-a917-7ced-a861a830e973	00030000-55dd-a916-22ee-52d8aeb6fc8f
00020000-55dd-a917-7ced-a861a830e973	00030000-55dd-a916-3131-53df17830cbc
00020000-55dd-a917-7ced-a861a830e973	00030000-55dd-a916-0a10-2590fadf8470
00020000-55dd-a917-7ced-a861a830e973	00030000-55dd-a916-2599-397654af3d41
00020000-55dd-a917-7ced-a861a830e973	00030000-55dd-a916-4d79-31c30a01dd63
00020000-55dd-a917-7ced-a861a830e973	00030000-55dd-a916-eca6-b7826933bab8
00020000-55dd-a917-7ced-a861a830e973	00030000-55dd-a916-02a4-714539e9292f
00020000-55dd-a917-7ced-a861a830e973	00030000-55dd-a916-fed2-fa1bb6a96b59
00020000-55dd-a917-7ced-a861a830e973	00030000-55dd-a916-0e84-cade1adfe6f1
00020000-55dd-a917-7ced-a861a830e973	00030000-55dd-a916-ad6f-81e6bda2bebc
00020000-55dd-a917-7ced-a861a830e973	00030000-55dd-a916-3a45-7bc960779b9a
00020000-55dd-a917-7ced-a861a830e973	00030000-55dd-a916-0038-1a77bb923729
00020000-55dd-a917-7ced-a861a830e973	00030000-55dd-a916-6b69-93699a873c35
00020000-55dd-a917-7ced-a861a830e973	00030000-55dd-a916-37f2-0c3236bc20ef
00020000-55dd-a917-7ced-a861a830e973	00030000-55dd-a916-c80d-46be14df4db7
00020000-55dd-a917-7ced-a861a830e973	00030000-55dd-a916-1431-e0da1c4a8bf2
00020000-55dd-a917-7ced-a861a830e973	00030000-55dd-a916-ba33-8e224a165f55
00020000-55dd-a917-7ced-a861a830e973	00030000-55dd-a916-64b6-9b5e2f0b856a
00020000-55dd-a917-7ced-a861a830e973	00030000-55dd-a916-5838-ed294b191fc2
00020000-55dd-a917-7ced-a861a830e973	00030000-55dd-a916-0c6e-f5e00f1b0faf
00020000-55dd-a917-7ced-a861a830e973	00030000-55dd-a916-4c1b-e0eb2aad3679
00020000-55dd-a917-7ced-a861a830e973	00030000-55dd-a916-9903-43a4b2c8834d
00020000-55dd-a917-7ced-a861a830e973	00030000-55dd-a916-49d1-6d04116f79f7
00020000-55dd-a917-7ced-a861a830e973	00030000-55dd-a916-81e2-5781cc7c9ca5
00020000-55dd-a917-7ced-a861a830e973	00030000-55dd-a916-8567-848768d0dd6e
00020000-55dd-a917-7ced-a861a830e973	00030000-55dd-a916-01db-d6da5c3e74c6
00020000-55dd-a917-7ced-a861a830e973	00030000-55dd-a916-654f-4bffc433f1e9
00020000-55dd-a917-7ced-a861a830e973	00030000-55dd-a916-f420-b3265d5f5119
00020000-55dd-a917-7ced-a861a830e973	00030000-55dd-a916-1a9d-690ffc84fd6e
00020000-55dd-a917-7ced-a861a830e973	00030000-55dd-a916-e347-d84662454e30
00020000-55dd-a917-7ced-a861a830e973	00030000-55dd-a916-1733-bc145e7cb2de
00020000-55dd-a917-7ced-a861a830e973	00030000-55dd-a916-5c58-9a41aca88a37
00020000-55dd-a917-7ced-a861a830e973	00030000-55dd-a916-acc5-b90ed0a592d5
00020000-55dd-a917-6f9b-26e0b096ecf3	00030000-55dd-a916-a226-418f1f398562
00020000-55dd-a917-6f9b-26e0b096ecf3	00030000-55dd-a916-678b-e99400731b37
00020000-55dd-a917-6f9b-26e0b096ecf3	00030000-55dd-a916-22e3-328477368586
00020000-55dd-a917-6f9b-26e0b096ecf3	00030000-55dd-a916-9d73-2d6aaa933e02
00020000-55dd-a917-6f9b-26e0b096ecf3	00030000-55dd-a916-c9db-652d76399dc5
00020000-55dd-a917-6f9b-26e0b096ecf3	00030000-55dd-a916-be1f-8dddd8ce021d
00020000-55dd-a917-6f9b-26e0b096ecf3	00030000-55dd-a916-22ee-52d8aeb6fc8f
00020000-55dd-a917-6f9b-26e0b096ecf3	00030000-55dd-a916-3131-53df17830cbc
00020000-55dd-a917-6f9b-26e0b096ecf3	00030000-55dd-a916-0a10-2590fadf8470
00020000-55dd-a917-6f9b-26e0b096ecf3	00030000-55dd-a916-2599-397654af3d41
00020000-55dd-a917-6f9b-26e0b096ecf3	00030000-55dd-a916-4d79-31c30a01dd63
00020000-55dd-a917-6f9b-26e0b096ecf3	00030000-55dd-a916-eca6-b7826933bab8
00020000-55dd-a917-6f9b-26e0b096ecf3	00030000-55dd-a916-02a4-714539e9292f
00020000-55dd-a917-6f9b-26e0b096ecf3	00030000-55dd-a916-0e84-cade1adfe6f1
00020000-55dd-a917-6f9b-26e0b096ecf3	00030000-55dd-a916-3a45-7bc960779b9a
00020000-55dd-a917-6f9b-26e0b096ecf3	00030000-55dd-a916-0038-1a77bb923729
00020000-55dd-a917-6f9b-26e0b096ecf3	00030000-55dd-a916-6b69-93699a873c35
00020000-55dd-a917-6f9b-26e0b096ecf3	00030000-55dd-a916-ba33-8e224a165f55
00020000-55dd-a917-6f9b-26e0b096ecf3	00030000-55dd-a916-5838-ed294b191fc2
00020000-55dd-a917-6f9b-26e0b096ecf3	00030000-55dd-a916-4c1b-e0eb2aad3679
00020000-55dd-a917-6f9b-26e0b096ecf3	00030000-55dd-a916-49d1-6d04116f79f7
00020000-55dd-a917-6f9b-26e0b096ecf3	00030000-55dd-a916-06b2-37d8c3e46f79
00020000-55dd-a917-6f9b-26e0b096ecf3	00030000-55dd-a916-033a-98d0a2091fc4
00020000-55dd-a917-6f9b-26e0b096ecf3	00030000-55dd-a916-f52a-a29c2a76f337
00020000-55dd-a917-6f9b-26e0b096ecf3	00030000-55dd-a916-a8ef-fc9bc12584f6
00020000-55dd-a917-6f9b-26e0b096ecf3	00030000-55dd-a916-a3b6-37a129ebc173
00020000-55dd-a917-6f9b-26e0b096ecf3	00030000-55dd-a916-40ae-3d2fac68622a
00020000-55dd-a917-6f9b-26e0b096ecf3	00030000-55dd-a916-5c58-9a41aca88a37
00020000-55dd-a917-6f9b-26e0b096ecf3	00030000-55dd-a916-acc5-b90ed0a592d5
00020000-55dd-a917-d7bf-9d69146ed5d4	00030000-55dd-a916-a226-418f1f398562
00020000-55dd-a917-d7bf-9d69146ed5d4	00030000-55dd-a916-e66c-cd933cd7d2a6
00020000-55dd-a917-d7bf-9d69146ed5d4	00030000-55dd-a916-678b-e99400731b37
00020000-55dd-a917-d7bf-9d69146ed5d4	00030000-55dd-a916-8f54-b005003cd5c7
00020000-55dd-a917-d7bf-9d69146ed5d4	00030000-55dd-a916-c814-0ca20eac804f
00020000-55dd-a917-d7bf-9d69146ed5d4	00030000-55dd-a916-e9ca-d8d5125b65a2
00020000-55dd-a917-d7bf-9d69146ed5d4	00030000-55dd-a916-22e3-328477368586
00020000-55dd-a917-d7bf-9d69146ed5d4	00030000-55dd-a916-9d73-2d6aaa933e02
00020000-55dd-a917-d7bf-9d69146ed5d4	00030000-55dd-a916-8420-e57db078bdbf
00020000-55dd-a917-d7bf-9d69146ed5d4	00030000-55dd-a916-c9db-652d76399dc5
00020000-55dd-a917-d7bf-9d69146ed5d4	00030000-55dd-a916-be1f-8dddd8ce021d
00020000-55dd-a917-d7bf-9d69146ed5d4	00030000-55dd-a916-22ee-52d8aeb6fc8f
00020000-55dd-a917-d7bf-9d69146ed5d4	00030000-55dd-a916-0a10-2590fadf8470
00020000-55dd-a917-d7bf-9d69146ed5d4	00030000-55dd-a916-2599-397654af3d41
00020000-55dd-a917-d7bf-9d69146ed5d4	00030000-55dd-a916-4d79-31c30a01dd63
00020000-55dd-a917-d7bf-9d69146ed5d4	00030000-55dd-a916-02a4-714539e9292f
00020000-55dd-a917-d7bf-9d69146ed5d4	00030000-55dd-a916-0e84-cade1adfe6f1
00020000-55dd-a917-d7bf-9d69146ed5d4	00030000-55dd-a916-6b69-93699a873c35
00020000-55dd-a917-d7bf-9d69146ed5d4	00030000-55dd-a916-c80d-46be14df4db7
00020000-55dd-a917-d7bf-9d69146ed5d4	00030000-55dd-a916-ba33-8e224a165f55
00020000-55dd-a917-d7bf-9d69146ed5d4	00030000-55dd-a916-5838-ed294b191fc2
00020000-55dd-a917-d7bf-9d69146ed5d4	00030000-55dd-a916-4c1b-e0eb2aad3679
00020000-55dd-a917-d7bf-9d69146ed5d4	00030000-55dd-a916-49d1-6d04116f79f7
00020000-55dd-a917-d7bf-9d69146ed5d4	00030000-55dd-a916-8567-848768d0dd6e
00020000-55dd-a917-d7bf-9d69146ed5d4	00030000-55dd-a916-f420-b3265d5f5119
00020000-55dd-a917-d7bf-9d69146ed5d4	00030000-55dd-a916-e347-d84662454e30
00020000-55dd-a917-d7bf-9d69146ed5d4	00030000-55dd-a916-5c58-9a41aca88a37
00020000-55dd-a917-d7bf-9d69146ed5d4	00030000-55dd-a916-acc5-b90ed0a592d5
00020000-55dd-a917-21e5-c501d350183b	00030000-55dd-a916-a226-418f1f398562
00020000-55dd-a917-21e5-c501d350183b	00030000-55dd-a916-47f3-1f2854286951
00020000-55dd-a917-21e5-c501d350183b	00030000-55dd-a916-300f-ecec502faaa5
00020000-55dd-a917-21e5-c501d350183b	00030000-55dd-a916-678b-e99400731b37
00020000-55dd-a917-21e5-c501d350183b	00030000-55dd-a916-22e3-328477368586
00020000-55dd-a917-21e5-c501d350183b	00030000-55dd-a916-9d73-2d6aaa933e02
00020000-55dd-a917-21e5-c501d350183b	00030000-55dd-a916-c9db-652d76399dc5
00020000-55dd-a917-21e5-c501d350183b	00030000-55dd-a916-be1f-8dddd8ce021d
00020000-55dd-a917-21e5-c501d350183b	00030000-55dd-a916-0a10-2590fadf8470
00020000-55dd-a917-21e5-c501d350183b	00030000-55dd-a916-2599-397654af3d41
00020000-55dd-a917-21e5-c501d350183b	00030000-55dd-a916-02a4-714539e9292f
00020000-55dd-a917-21e5-c501d350183b	00030000-55dd-a916-0e84-cade1adfe6f1
00020000-55dd-a917-21e5-c501d350183b	00030000-55dd-a916-6b69-93699a873c35
00020000-55dd-a917-21e5-c501d350183b	00030000-55dd-a916-ba33-8e224a165f55
00020000-55dd-a917-21e5-c501d350183b	00030000-55dd-a916-5838-ed294b191fc2
00020000-55dd-a917-21e5-c501d350183b	00030000-55dd-a916-4c1b-e0eb2aad3679
00020000-55dd-a917-21e5-c501d350183b	00030000-55dd-a916-49d1-6d04116f79f7
00020000-55dd-a917-21e5-c501d350183b	00030000-55dd-a916-8567-848768d0dd6e
00020000-55dd-a917-21e5-c501d350183b	00030000-55dd-a916-5c58-9a41aca88a37
00020000-55dd-a917-21e5-c501d350183b	00030000-55dd-a916-acc5-b90ed0a592d5
00020000-55dd-a917-8deb-b30de149cd49	00030000-55dd-a916-a226-418f1f398562
00020000-55dd-a917-8deb-b30de149cd49	00030000-55dd-a916-678b-e99400731b37
00020000-55dd-a917-8deb-b30de149cd49	00030000-55dd-a916-22e3-328477368586
00020000-55dd-a917-8deb-b30de149cd49	00030000-55dd-a916-9d73-2d6aaa933e02
00020000-55dd-a917-8deb-b30de149cd49	00030000-55dd-a916-c9db-652d76399dc5
00020000-55dd-a917-8deb-b30de149cd49	00030000-55dd-a916-be1f-8dddd8ce021d
00020000-55dd-a917-8deb-b30de149cd49	00030000-55dd-a916-0a10-2590fadf8470
00020000-55dd-a917-8deb-b30de149cd49	00030000-55dd-a916-2599-397654af3d41
00020000-55dd-a917-8deb-b30de149cd49	00030000-55dd-a916-02a4-714539e9292f
00020000-55dd-a917-8deb-b30de149cd49	00030000-55dd-a916-0e84-cade1adfe6f1
00020000-55dd-a917-8deb-b30de149cd49	00030000-55dd-a916-6b69-93699a873c35
00020000-55dd-a917-8deb-b30de149cd49	00030000-55dd-a916-ba33-8e224a165f55
00020000-55dd-a917-8deb-b30de149cd49	00030000-55dd-a916-5838-ed294b191fc2
00020000-55dd-a917-8deb-b30de149cd49	00030000-55dd-a916-4c1b-e0eb2aad3679
00020000-55dd-a917-8deb-b30de149cd49	00030000-55dd-a916-49d1-6d04116f79f7
00020000-55dd-a917-8deb-b30de149cd49	00030000-55dd-a916-43ed-3658904149b7
00020000-55dd-a917-8deb-b30de149cd49	00030000-55dd-a916-2b13-4102b53e410a
00020000-55dd-a917-8deb-b30de149cd49	00030000-55dd-a916-8567-848768d0dd6e
00020000-55dd-a917-8deb-b30de149cd49	00030000-55dd-a916-5c58-9a41aca88a37
00020000-55dd-a917-8deb-b30de149cd49	00030000-55dd-a916-acc5-b90ed0a592d5
00020000-55dd-a918-45a9-7b6edc9cc6ab	00030000-55dd-a916-836f-a53141b6a49a
00020000-55dd-a918-45a9-7b6edc9cc6ab	00030000-55dd-a916-10d6-28c8ad908213
00020000-55dd-a918-45a9-7b6edc9cc6ab	00030000-55dd-a916-2b13-4102b53e410a
00020000-55dd-a918-45a9-7b6edc9cc6ab	00030000-55dd-a916-9d48-2fc18ebb7a9a
00020000-55dd-a918-45a9-7b6edc9cc6ab	00030000-55dd-a916-4011-7d57d125f110
00020000-55dd-a918-45a9-7b6edc9cc6ab	00030000-55dd-a916-75db-41f59f5533d4
00020000-55dd-a918-45a9-7b6edc9cc6ab	00030000-55dd-a916-a226-418f1f398562
00020000-55dd-a918-45a9-7b6edc9cc6ab	00030000-55dd-a916-47f3-1f2854286951
00020000-55dd-a918-45a9-7b6edc9cc6ab	00030000-55dd-a916-e66c-cd933cd7d2a6
00020000-55dd-a918-45a9-7b6edc9cc6ab	00030000-55dd-a916-300f-ecec502faaa5
00020000-55dd-a918-45a9-7b6edc9cc6ab	00030000-55dd-a916-678b-e99400731b37
00020000-55dd-a918-45a9-7b6edc9cc6ab	00030000-55dd-a916-8f54-b005003cd5c7
00020000-55dd-a918-45a9-7b6edc9cc6ab	00030000-55dd-a916-c814-0ca20eac804f
00020000-55dd-a918-45a9-7b6edc9cc6ab	00030000-55dd-a916-a76b-1922244f5d11
00020000-55dd-a918-45a9-7b6edc9cc6ab	00030000-55dd-a916-e9ca-d8d5125b65a2
00020000-55dd-a918-45a9-7b6edc9cc6ab	00030000-55dd-a916-8c97-1935afc76eda
00020000-55dd-a918-45a9-7b6edc9cc6ab	00030000-55dd-a916-22e3-328477368586
00020000-55dd-a918-45a9-7b6edc9cc6ab	00030000-55dd-a916-3e68-854aa63b0b38
00020000-55dd-a918-45a9-7b6edc9cc6ab	00030000-55dd-a916-9d73-2d6aaa933e02
00020000-55dd-a918-45a9-7b6edc9cc6ab	00030000-55dd-a916-2a54-6a0577f6a0ee
00020000-55dd-a918-45a9-7b6edc9cc6ab	00030000-55dd-a916-abc1-0e5ddcb6793b
00020000-55dd-a918-45a9-7b6edc9cc6ab	00030000-55dd-a916-5a92-dac5316d1c5b
00020000-55dd-a918-45a9-7b6edc9cc6ab	00030000-55dd-a916-759f-4d54b31b7ffd
00020000-55dd-a918-45a9-7b6edc9cc6ab	00030000-55dd-a916-9aaf-811520d4e0ab
00020000-55dd-a918-45a9-7b6edc9cc6ab	00030000-55dd-a916-8420-e57db078bdbf
00020000-55dd-a918-45a9-7b6edc9cc6ab	00030000-55dd-a916-c3cc-1c8da2609f5c
00020000-55dd-a918-45a9-7b6edc9cc6ab	00030000-55dd-a916-c9db-652d76399dc5
00020000-55dd-a918-45a9-7b6edc9cc6ab	00030000-55dd-a916-9622-353da6f4b1c1
00020000-55dd-a918-45a9-7b6edc9cc6ab	00030000-55dd-a916-be1f-8dddd8ce021d
00020000-55dd-a918-45a9-7b6edc9cc6ab	00030000-55dd-a916-dc80-08bef70ad6bd
00020000-55dd-a918-45a9-7b6edc9cc6ab	00030000-55dd-a916-22ee-52d8aeb6fc8f
00020000-55dd-a918-45a9-7b6edc9cc6ab	00030000-55dd-a916-3131-53df17830cbc
00020000-55dd-a918-45a9-7b6edc9cc6ab	00030000-55dd-a916-2999-9d2fcc4baf04
00020000-55dd-a918-45a9-7b6edc9cc6ab	00030000-55dd-a916-fdd0-e4bb85236d6a
00020000-55dd-a918-45a9-7b6edc9cc6ab	00030000-55dd-a916-2205-f417af4b7018
00020000-55dd-a918-45a9-7b6edc9cc6ab	00030000-55dd-a916-546b-5d1f913af31a
00020000-55dd-a918-45a9-7b6edc9cc6ab	00030000-55dd-a916-0a10-2590fadf8470
00020000-55dd-a918-45a9-7b6edc9cc6ab	00030000-55dd-a916-8abd-ee3529e6ea68
00020000-55dd-a918-45a9-7b6edc9cc6ab	00030000-55dd-a916-2599-397654af3d41
00020000-55dd-a918-45a9-7b6edc9cc6ab	00030000-55dd-a916-8924-6de9ae378013
00020000-55dd-a918-45a9-7b6edc9cc6ab	00030000-55dd-a916-4d79-31c30a01dd63
00020000-55dd-a918-45a9-7b6edc9cc6ab	00030000-55dd-a916-eca6-b7826933bab8
00020000-55dd-a918-45a9-7b6edc9cc6ab	00030000-55dd-a916-1d7e-0a8782ebda45
00020000-55dd-a918-45a9-7b6edc9cc6ab	00030000-55dd-a916-7584-70302f45262c
00020000-55dd-a918-45a9-7b6edc9cc6ab	00030000-55dd-a916-5038-9a3d8b806980
00020000-55dd-a918-45a9-7b6edc9cc6ab	00030000-55dd-a916-dce8-c80078fef463
00020000-55dd-a918-45a9-7b6edc9cc6ab	00030000-55dd-a916-8750-e2ae4700ac0f
00020000-55dd-a918-45a9-7b6edc9cc6ab	00030000-55dd-a916-d82e-90a818938ce4
00020000-55dd-a918-45a9-7b6edc9cc6ab	00030000-55dd-a916-02a4-714539e9292f
00020000-55dd-a918-45a9-7b6edc9cc6ab	00030000-55dd-a916-fed2-fa1bb6a96b59
00020000-55dd-a918-45a9-7b6edc9cc6ab	00030000-55dd-a916-0e84-cade1adfe6f1
00020000-55dd-a918-45a9-7b6edc9cc6ab	00030000-55dd-a916-ad6f-81e6bda2bebc
00020000-55dd-a918-45a9-7b6edc9cc6ab	00030000-55dd-a916-7d84-f27016421578
00020000-55dd-a918-45a9-7b6edc9cc6ab	00030000-55dd-a916-8da7-cb20f809e857
00020000-55dd-a918-45a9-7b6edc9cc6ab	00030000-55dd-a916-3a45-7bc960779b9a
00020000-55dd-a918-45a9-7b6edc9cc6ab	00030000-55dd-a916-0038-1a77bb923729
00020000-55dd-a918-45a9-7b6edc9cc6ab	00030000-55dd-a916-6b69-93699a873c35
00020000-55dd-a918-45a9-7b6edc9cc6ab	00030000-55dd-a916-37f2-0c3236bc20ef
00020000-55dd-a918-45a9-7b6edc9cc6ab	00030000-55dd-a916-f901-5eca3b1e1150
00020000-55dd-a918-45a9-7b6edc9cc6ab	00030000-55dd-a916-e471-123e77c82abb
00020000-55dd-a918-45a9-7b6edc9cc6ab	00030000-55dd-a916-922e-bfff0a971797
00020000-55dd-a918-45a9-7b6edc9cc6ab	00030000-55dd-a916-5e83-5ddfe564ff5a
00020000-55dd-a918-45a9-7b6edc9cc6ab	00030000-55dd-a916-c80d-46be14df4db7
00020000-55dd-a918-45a9-7b6edc9cc6ab	00030000-55dd-a916-1431-e0da1c4a8bf2
00020000-55dd-a918-45a9-7b6edc9cc6ab	00030000-55dd-a916-7ec2-339b9ff3b711
00020000-55dd-a918-45a9-7b6edc9cc6ab	00030000-55dd-a916-ae28-22dd76e7dbaf
00020000-55dd-a918-45a9-7b6edc9cc6ab	00030000-55dd-a916-af5f-a766fcc19fb7
00020000-55dd-a918-45a9-7b6edc9cc6ab	00030000-55dd-a916-3da5-d36a1d670ea2
00020000-55dd-a918-45a9-7b6edc9cc6ab	00030000-55dd-a916-bac8-b205f920d12d
00020000-55dd-a918-45a9-7b6edc9cc6ab	00030000-55dd-a916-e52a-d0cb5e4591f8
00020000-55dd-a918-45a9-7b6edc9cc6ab	00030000-55dd-a916-bece-b126d8d0806d
00020000-55dd-a918-45a9-7b6edc9cc6ab	00030000-55dd-a916-10db-18ff4ee2ad2e
00020000-55dd-a918-45a9-7b6edc9cc6ab	00030000-55dd-a916-3c63-b09d722ff489
00020000-55dd-a918-45a9-7b6edc9cc6ab	00030000-55dd-a916-2bad-811534100431
00020000-55dd-a918-45a9-7b6edc9cc6ab	00030000-55dd-a916-2252-e67d01b462bb
00020000-55dd-a918-45a9-7b6edc9cc6ab	00030000-55dd-a916-a196-31257197cec5
00020000-55dd-a918-45a9-7b6edc9cc6ab	00030000-55dd-a916-7fa5-a62597afbff7
00020000-55dd-a918-45a9-7b6edc9cc6ab	00030000-55dd-a916-4b03-8586f1211f36
00020000-55dd-a918-45a9-7b6edc9cc6ab	00030000-55dd-a916-20c2-a78176184293
00020000-55dd-a918-45a9-7b6edc9cc6ab	00030000-55dd-a916-c567-cb87ae00f50d
00020000-55dd-a918-45a9-7b6edc9cc6ab	00030000-55dd-a916-06d4-9472c7f9b177
00020000-55dd-a918-45a9-7b6edc9cc6ab	00030000-55dd-a916-8c86-4a6388bb5b72
00020000-55dd-a918-45a9-7b6edc9cc6ab	00030000-55dd-a916-5ac3-f740527b0dd8
00020000-55dd-a918-45a9-7b6edc9cc6ab	00030000-55dd-a916-e066-0acd8eb140d3
00020000-55dd-a918-45a9-7b6edc9cc6ab	00030000-55dd-a916-ba33-8e224a165f55
00020000-55dd-a918-45a9-7b6edc9cc6ab	00030000-55dd-a916-64b6-9b5e2f0b856a
00020000-55dd-a918-45a9-7b6edc9cc6ab	00030000-55dd-a916-f73c-07abbeed3bd8
00020000-55dd-a918-45a9-7b6edc9cc6ab	00030000-55dd-a916-54eb-c5b288f8aeed
00020000-55dd-a918-45a9-7b6edc9cc6ab	00030000-55dd-a916-a06c-21f9a3eabba1
00020000-55dd-a918-45a9-7b6edc9cc6ab	00030000-55dd-a916-21ae-b4fd0e85a141
00020000-55dd-a918-45a9-7b6edc9cc6ab	00030000-55dd-a916-5838-ed294b191fc2
00020000-55dd-a918-45a9-7b6edc9cc6ab	00030000-55dd-a916-0c6e-f5e00f1b0faf
00020000-55dd-a918-45a9-7b6edc9cc6ab	00030000-55dd-a916-4c1b-e0eb2aad3679
00020000-55dd-a918-45a9-7b6edc9cc6ab	00030000-55dd-a916-9903-43a4b2c8834d
00020000-55dd-a918-45a9-7b6edc9cc6ab	00030000-55dd-a916-bfc2-05859ed48450
00020000-55dd-a918-45a9-7b6edc9cc6ab	00030000-55dd-a916-e799-864f64286a36
00020000-55dd-a918-45a9-7b6edc9cc6ab	00030000-55dd-a916-cdb2-941cbdcd5930
00020000-55dd-a918-45a9-7b6edc9cc6ab	00030000-55dd-a916-ee28-cf44a7a1d23b
00020000-55dd-a918-45a9-7b6edc9cc6ab	00030000-55dd-a916-b449-e9b6074c77d2
00020000-55dd-a918-45a9-7b6edc9cc6ab	00030000-55dd-a916-d398-53a4c805dd71
00020000-55dd-a918-45a9-7b6edc9cc6ab	00030000-55dd-a916-8a9f-ac0a31a62271
00020000-55dd-a918-45a9-7b6edc9cc6ab	00030000-55dd-a916-3fe0-36e12b1d9b5d
00020000-55dd-a918-45a9-7b6edc9cc6ab	00030000-55dd-a916-49d1-6d04116f79f7
00020000-55dd-a918-45a9-7b6edc9cc6ab	00030000-55dd-a916-81e2-5781cc7c9ca5
00020000-55dd-a918-45a9-7b6edc9cc6ab	00030000-55dd-a916-c28b-d5a0990610cd
00020000-55dd-a918-45a9-7b6edc9cc6ab	00030000-55dd-a916-29c0-601dbf1ea3fc
00020000-55dd-a918-45a9-7b6edc9cc6ab	00030000-55dd-a916-8edd-f16c781122d0
00020000-55dd-a918-45a9-7b6edc9cc6ab	00030000-55dd-a916-12a2-1e694209f46e
00020000-55dd-a918-45a9-7b6edc9cc6ab	00030000-55dd-a916-37eb-707968a8f2fa
00020000-55dd-a918-45a9-7b6edc9cc6ab	00030000-55dd-a916-d221-7e0e9b908736
00020000-55dd-a918-45a9-7b6edc9cc6ab	00030000-55dd-a916-fa9a-6f58bbdbfe1e
00020000-55dd-a918-45a9-7b6edc9cc6ab	00030000-55dd-a916-9422-5c5e6abd9bce
00020000-55dd-a918-45a9-7b6edc9cc6ab	00030000-55dd-a916-06b2-37d8c3e46f79
00020000-55dd-a918-45a9-7b6edc9cc6ab	00030000-55dd-a916-033a-98d0a2091fc4
00020000-55dd-a918-45a9-7b6edc9cc6ab	00030000-55dd-a916-43ed-3658904149b7
00020000-55dd-a918-45a9-7b6edc9cc6ab	00030000-55dd-a916-ca0a-e0d9ed65928a
00020000-55dd-a918-45a9-7b6edc9cc6ab	00030000-55dd-a916-8567-848768d0dd6e
00020000-55dd-a918-45a9-7b6edc9cc6ab	00030000-55dd-a916-cec0-2f0cd6ca09d2
00020000-55dd-a918-45a9-7b6edc9cc6ab	00030000-55dd-a916-20ac-2de1937545f5
00020000-55dd-a918-45a9-7b6edc9cc6ab	00030000-55dd-a916-5283-26232acf7267
00020000-55dd-a918-45a9-7b6edc9cc6ab	00030000-55dd-a916-f52a-a29c2a76f337
00020000-55dd-a918-45a9-7b6edc9cc6ab	00030000-55dd-a916-a8ef-fc9bc12584f6
00020000-55dd-a918-45a9-7b6edc9cc6ab	00030000-55dd-a916-01db-d6da5c3e74c6
00020000-55dd-a918-45a9-7b6edc9cc6ab	00030000-55dd-a916-654f-4bffc433f1e9
00020000-55dd-a918-45a9-7b6edc9cc6ab	00030000-55dd-a916-f420-b3265d5f5119
00020000-55dd-a918-45a9-7b6edc9cc6ab	00030000-55dd-a916-1a9d-690ffc84fd6e
00020000-55dd-a918-45a9-7b6edc9cc6ab	00030000-55dd-a916-76f1-f9d26035d6c5
00020000-55dd-a918-45a9-7b6edc9cc6ab	00030000-55dd-a916-c02d-d9c31c0c90e5
00020000-55dd-a918-45a9-7b6edc9cc6ab	00030000-55dd-a916-a3b6-37a129ebc173
00020000-55dd-a918-45a9-7b6edc9cc6ab	00030000-55dd-a916-40ae-3d2fac68622a
00020000-55dd-a918-45a9-7b6edc9cc6ab	00030000-55dd-a916-e347-d84662454e30
00020000-55dd-a918-45a9-7b6edc9cc6ab	00030000-55dd-a916-1733-bc145e7cb2de
00020000-55dd-a918-45a9-7b6edc9cc6ab	00030000-55dd-a916-5c58-9a41aca88a37
00020000-55dd-a918-45a9-7b6edc9cc6ab	00030000-55dd-a916-68f9-10a7c93d2858
00020000-55dd-a918-45a9-7b6edc9cc6ab	00030000-55dd-a916-acc5-b90ed0a592d5
00020000-55dd-a918-45a9-7b6edc9cc6ab	00030000-55dd-a916-8a86-2caad49e31d8
\.


--
-- TOC entry 2936 (class 0 OID 15628994)
-- Dependencies: 204
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 2940 (class 0 OID 15629027)
-- Dependencies: 208
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 2951 (class 0 OID 15629151)
-- Dependencies: 219
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, zacetek, konec, placilonavajo, vrednostvaje, planiranostevilovaj, vrednostvaj, vrednostpredstave, vrednostdopremiere, aktivna, zaposlenvdrjz, samozaposlen, igralec, opis) FROM stdin;
000b0000-55dd-a918-160e-91ee6ac81396	00090000-55dd-a918-4035-df2a75e3f5d2	\N	\N	0001	\N	\N	f	10.00	3	10.00	30.00	10.00	t	t	f	t	Pogodba o sodelovanju
000b0000-55dd-a918-aa61-46c2b4df196f	00090000-55dd-a918-69d3-c3e49503a711	\N	\N	0002	\N	\N	t	11.00	10	11.00	31.00	110.00	t	f	t	t	Pogodba za vlogo Helena
000b0000-55dd-a918-59c8-4de3fa181866	00090000-55dd-a918-ffd5-fabdde1f707c	\N	\N	0003	\N	\N	f	12.00	4	12.00	32.00	12.00	t	f	t	f	Pogodba za lektoriranje
\.


--
-- TOC entry 2913 (class 0 OID 15628755)
-- Dependencies: 181
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, drzava_id, sifra, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo, nvo) FROM stdin;
00080000-55dd-a918-9913-4f942e6b3d4a	00040000-55dd-a916-443c-bd20c44582ab	0988	AK	Juhuhu d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55dd-a918-641c-2d7bf52c8465	00040000-55dd-a916-443c-bd20c44582ab	0989	AK	Hopsasa d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	t
00080000-55dd-a918-93af-9a6ab1819202	00040000-55dd-a916-443c-bd20c44582ab	0987	AK	Gledališče Šrum d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55dd-a918-0015-14e87f3238af	00040000-55dd-a916-443c-bd20c44582ab	0986	AK	Lutkovni Direndaj d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55dd-a918-e7ca-0707dc406eec	00040000-55dd-a916-443c-bd20c44582ab	0985	AK	Tatjana Stanič, Lektoriranje, s.p.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55dd-a918-ac52-4376348e350f	00040000-55dd-a916-d795-4a4758b81d1a	0984	AK	Gledališče Lepote tvoje		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55dd-a918-1a81-bcccdabf40ee	00040000-55dd-a916-e7c3-798bc67ff39a	0983	AK	Sunce naše		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55dd-a918-63f9-b9889764c627	00040000-55dd-a916-bcef-3f06b6d56c03	0982	AK	Theater Amadeus		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55dd-a919-a9e7-82bae995a14e	00040000-55dd-a916-443c-bd20c44582ab	1001	AK	Gledališče Matica		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
\.


--
-- TOC entry 2915 (class 0 OID 15628789)
-- Dependencies: 183
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-55dd-a916-8a68-775d900a99b2	8341	Adlešiči
00050000-55dd-a916-9509-3a26c92971c2	5270	Ajdovščina
00050000-55dd-a916-40f1-caf801f8eb97	6280	Ankaran/Ancarano
00050000-55dd-a916-d020-f25587d34bbc	9253	Apače
00050000-55dd-a916-a41c-e51b68a64dc8	8253	Artiče
00050000-55dd-a916-dba9-31cfb3c4b581	4275	Begunje na Gorenjskem
00050000-55dd-a916-2a86-16267526fcf1	1382	Begunje pri Cerknici
00050000-55dd-a916-01aa-6256d7021835	9231	Beltinci
00050000-55dd-a916-01df-485156d29e63	2234	Benedikt
00050000-55dd-a916-284c-896ea0d6ad99	2345	Bistrica ob Dravi
00050000-55dd-a916-7bc2-a0e55a8eb7ab	3256	Bistrica ob Sotli
00050000-55dd-a916-5fae-a0c5439dfac5	8259	Bizeljsko
00050000-55dd-a916-14e7-af7ac5987ea2	1223	Blagovica
00050000-55dd-a916-c120-89b95d823cf0	8283	Blanca
00050000-55dd-a916-f913-65350a15d419	4260	Bled
00050000-55dd-a916-7cdd-2cb987afe9c2	4273	Blejska Dobrava
00050000-55dd-a916-dab0-96679dd37142	9265	Bodonci
00050000-55dd-a916-641b-bf3f25dbcd7f	9222	Bogojina
00050000-55dd-a916-760a-4a4f35fc2bf7	4263	Bohinjska Bela
00050000-55dd-a916-4a01-6d4ecb471813	4264	Bohinjska Bistrica
00050000-55dd-a916-ab49-dcbcc6932cea	4265	Bohinjsko jezero
00050000-55dd-a916-a3d3-5538a38941c8	1353	Borovnica
00050000-55dd-a916-0ea2-a9e4b0c6f425	8294	Boštanj
00050000-55dd-a916-7c31-78d2ec78c8b7	5230	Bovec
00050000-55dd-a916-c431-03f99696c5dd	5295	Branik
00050000-55dd-a916-f7a9-58f2f1b1579a	3314	Braslovče
00050000-55dd-a916-5730-72b035dfaae4	5223	Breginj
00050000-55dd-a916-195f-a9eba2f96dc9	8280	Brestanica
00050000-55dd-a916-bf2b-4feffb2178b2	2354	Bresternica
00050000-55dd-a916-af7a-d07ca1be3ad2	4243	Brezje
00050000-55dd-a916-13b0-a13289d19c9b	1351	Brezovica pri Ljubljani
00050000-55dd-a916-3500-0e1df2cfb5d6	8250	Brežice
00050000-55dd-a916-17a1-019be65ff269	4210	Brnik - Aerodrom
00050000-55dd-a916-0371-ecc1237256b9	8321	Brusnice
00050000-55dd-a916-3600-cd17fc40359e	3255	Buče
00050000-55dd-a916-9fd3-13f6efa4b4ab	8276	Bučka 
00050000-55dd-a916-be4e-b057f71fc38c	9261	Cankova
00050000-55dd-a916-bf22-ce0dbc850f6a	3000	Celje 
00050000-55dd-a916-5af0-791e3eac46a6	3001	Celje - poštni predali
00050000-55dd-a916-b279-ada9f5198c07	4207	Cerklje na Gorenjskem
00050000-55dd-a916-ad4f-c54be6c51e66	8263	Cerklje ob Krki
00050000-55dd-a916-9ea3-62e0eff808a7	1380	Cerknica
00050000-55dd-a916-53ec-fafa76de00dc	5282	Cerkno
00050000-55dd-a916-90d4-e195d54e3922	2236	Cerkvenjak
00050000-55dd-a916-09b6-7f7e4bf9b069	2215	Ceršak
00050000-55dd-a916-5e3f-6d57543d5711	2326	Cirkovce
00050000-55dd-a916-060a-5d751cc5c569	2282	Cirkulane
00050000-55dd-a916-fd2c-550a032451ab	5273	Col
00050000-55dd-a916-92ab-3f73c331f021	8251	Čatež ob Savi
00050000-55dd-a916-5bd6-6a4eff6b4b68	1413	Čemšenik
00050000-55dd-a916-cf28-ead4018c1865	5253	Čepovan
00050000-55dd-a916-c1e3-8ebd9acafd53	9232	Črenšovci
00050000-55dd-a916-b681-625c4dab8ea1	2393	Črna na Koroškem
00050000-55dd-a916-e156-76faa5e119e3	6275	Črni Kal
00050000-55dd-a916-c506-4790f6188626	5274	Črni Vrh nad Idrijo
00050000-55dd-a916-d8f9-a947c824e75d	5262	Črniče
00050000-55dd-a916-1227-841d5ef7ad16	8340	Črnomelj
00050000-55dd-a916-2748-00bea8cd5618	6271	Dekani
00050000-55dd-a916-9f0b-760746dfe071	5210	Deskle
00050000-55dd-a916-e51a-8f97babde42b	2253	Destrnik
00050000-55dd-a916-abaf-41f5d36d38a9	6215	Divača
00050000-55dd-a916-ffcf-c86b208a2672	1233	Dob
00050000-55dd-a916-191e-4449388ed0d1	3224	Dobje pri Planini
00050000-55dd-a916-bb49-3dd430d4ab7c	8257	Dobova
00050000-55dd-a916-bbec-ab2b3650e3c2	1423	Dobovec
00050000-55dd-a916-1c81-b4e8e2f8c075	5263	Dobravlje
00050000-55dd-a916-fb24-e7d03f8f6b10	3204	Dobrna
00050000-55dd-a916-0749-06c77efd91e3	8211	Dobrnič
00050000-55dd-a916-851a-a29a1b416833	1356	Dobrova
00050000-55dd-a916-61e3-06cf0a5730e2	9223	Dobrovnik/Dobronak 
00050000-55dd-a916-dcf4-07b6e0e78a1b	5212	Dobrovo v Brdih
00050000-55dd-a916-4041-23d3205e39ff	1431	Dol pri Hrastniku
00050000-55dd-a916-c768-892745c77e00	1262	Dol pri Ljubljani
00050000-55dd-a916-4fea-7f64a7973cb5	1273	Dole pri Litiji
00050000-55dd-a916-f959-071a847abb5b	1331	Dolenja vas
00050000-55dd-a916-a212-82eea7c91072	8350	Dolenjske Toplice
00050000-55dd-a916-b9de-46c0b88aaf0b	1230	Domžale
00050000-55dd-a916-0ea5-b953af011a4c	2252	Dornava
00050000-55dd-a916-7ea5-9790cc4db727	5294	Dornberk
00050000-55dd-a916-d287-297d5ac8375a	1319	Draga
00050000-55dd-a916-a532-bedbffadfb5c	8343	Dragatuš
00050000-55dd-a916-6880-979eb843a938	3222	Dramlje
00050000-55dd-a916-5647-e2c08fd36d59	2370	Dravograd
00050000-55dd-a916-6836-a04afeaaa6b9	4203	Duplje
00050000-55dd-a916-9285-8d6a068bd966	6221	Dutovlje
00050000-55dd-a916-4dc8-bf6d679791f1	8361	Dvor
00050000-55dd-a916-72d6-ffa437589e97	2343	Fala
00050000-55dd-a916-83fd-b1c46555a3fc	9208	Fokovci
00050000-55dd-a916-010e-191857907fd1	2313	Fram
00050000-55dd-a916-9acf-b008bb3601cb	3213	Frankolovo
00050000-55dd-a916-958c-30b38e8943db	1274	Gabrovka
00050000-55dd-a916-dbef-c8c0ef0a10fe	8254	Globoko
00050000-55dd-a916-e860-e778a8405f72	5275	Godovič
00050000-55dd-a916-25f8-09b1bc5451e3	4204	Golnik
00050000-55dd-a916-150e-80992f416932	3303	Gomilsko
00050000-55dd-a916-e5dc-a2559c31675d	4224	Gorenja vas
00050000-55dd-a916-7cd0-914681ada086	3263	Gorica pri Slivnici
00050000-55dd-a916-fb50-34e623c0e4f4	2272	Gorišnica
00050000-55dd-a916-3d7e-864786595247	9250	Gornja Radgona
00050000-55dd-a916-f313-9f09d29977e9	3342	Gornji Grad
00050000-55dd-a916-b7f1-177a40cac096	4282	Gozd Martuljek
00050000-55dd-a916-550e-b8be32398e5d	6272	Gračišče
00050000-55dd-a916-901e-eefbac9ba648	9264	Grad
00050000-55dd-a916-6065-40af89f9308d	8332	Gradac
00050000-55dd-a916-f3f1-6ba49a6d312b	1384	Grahovo
00050000-55dd-a916-f225-d7bc08d7aa81	5242	Grahovo ob Bači
00050000-55dd-a916-ab1e-7709e044cdd0	5251	Grgar
00050000-55dd-a916-f71e-43eba87e5e25	3302	Griže
00050000-55dd-a916-f48c-0057ce762b4c	3231	Grobelno
00050000-55dd-a916-70b9-a9074abadc41	1290	Grosuplje
00050000-55dd-a916-01e6-09bb6e1976d0	2288	Hajdina
00050000-55dd-a916-9363-007499266611	8362	Hinje
00050000-55dd-a916-d373-546a07b05be1	2311	Hoče
00050000-55dd-a916-e8aa-f17d93977f32	9205	Hodoš/Hodos
00050000-55dd-a916-b0c1-3041e41269e2	1354	Horjul
00050000-55dd-a916-29f7-5daf1878c4a9	1372	Hotedršica
00050000-55dd-a916-42e5-e776c72533f9	1430	Hrastnik
00050000-55dd-a916-41cf-df2e75b54bcb	6225	Hruševje
00050000-55dd-a916-86e9-b575ac7963c0	4276	Hrušica
00050000-55dd-a916-47dc-7ff81f4628fe	5280	Idrija
00050000-55dd-a916-1f31-684a71dd2714	1292	Ig
00050000-55dd-a916-7394-f83c9bc5581c	6250	Ilirska Bistrica
00050000-55dd-a916-cff6-044bbc032968	6251	Ilirska Bistrica-Trnovo
00050000-55dd-a916-542d-0dfe08cd26e3	1295	Ivančna Gorica
00050000-55dd-a916-3ded-7de2e26411cd	2259	Ivanjkovci
00050000-55dd-a916-9270-ecdd0a4b9d36	1411	Izlake
00050000-55dd-a916-d230-aff711902e23	6310	Izola/Isola
00050000-55dd-a916-0ffb-9b918ff691fb	2222	Jakobski Dol
00050000-55dd-a916-c8b1-a6d3b7aff248	2221	Jarenina
00050000-55dd-a916-8943-72226a7064a4	6254	Jelšane
00050000-55dd-a916-cb16-7117f9a0643b	4270	Jesenice
00050000-55dd-a916-dbfb-4fd25b6d3f9f	8261	Jesenice na Dolenjskem
00050000-55dd-a916-e437-8469e6420c0b	3273	Jurklošter
00050000-55dd-a916-0241-2431d962c092	2223	Jurovski Dol
00050000-55dd-a916-6f47-9285c246c0fd	2256	Juršinci
00050000-55dd-a916-89a6-e0091204d9c4	5214	Kal nad Kanalom
00050000-55dd-a916-abb8-e99f3acf5865	3233	Kalobje
00050000-55dd-a916-32ff-7963fc4e1640	4246	Kamna Gorica
00050000-55dd-a916-6baf-a7fc377ada5e	2351	Kamnica
00050000-55dd-a916-992a-fa5730427a6e	1241	Kamnik
00050000-55dd-a916-baac-8661c7ff4408	5213	Kanal
00050000-55dd-a916-aa88-00caaa6bc24d	8258	Kapele
00050000-55dd-a916-749d-057830032ee1	2362	Kapla
00050000-55dd-a916-8038-bfb148121af2	2325	Kidričevo
00050000-55dd-a916-d1c2-5380f8e3b98a	1412	Kisovec
00050000-55dd-a916-2a71-a6c9b4971b65	6253	Knežak
00050000-55dd-a916-4b24-99e95a150a0b	5222	Kobarid
00050000-55dd-a916-ada1-f322588fb199	9227	Kobilje
00050000-55dd-a916-fca4-583107c370bf	1330	Kočevje
00050000-55dd-a916-c37b-ce06eef46755	1338	Kočevska Reka
00050000-55dd-a916-6103-2c7cb536c20b	2276	Kog
00050000-55dd-a916-07b7-d01cc5416029	5211	Kojsko
00050000-55dd-a916-27f8-57a47065d90d	6223	Komen
00050000-55dd-a916-894d-d8f581291daf	1218	Komenda
00050000-55dd-a916-c05b-c19ffa8eb36e	6000	Koper/Capodistria 
00050000-55dd-a916-e467-33aa5910be3a	6001	Koper/Capodistria - poštni predali
00050000-55dd-a916-e0be-426206e56662	8282	Koprivnica
00050000-55dd-a916-1a28-814c1ea9c744	5296	Kostanjevica na Krasu
00050000-55dd-a916-0bd0-f20f057cf0f9	8311	Kostanjevica na Krki
00050000-55dd-a916-1134-a203b0d04203	1336	Kostel
00050000-55dd-a916-b2ed-853bb3da8a4e	6256	Košana
00050000-55dd-a916-1306-229babf7e820	2394	Kotlje
00050000-55dd-a916-7df0-55fb53e06885	6240	Kozina
00050000-55dd-a916-e686-5684326a4d13	3260	Kozje
00050000-55dd-a916-1afd-031a5da0144a	4000	Kranj 
00050000-55dd-a916-c8ea-b91b17e30969	4001	Kranj - poštni predali
00050000-55dd-a916-0235-b69be4dc2d8c	4280	Kranjska Gora
00050000-55dd-a916-e6c7-b2549ff4335c	1281	Kresnice
00050000-55dd-a916-9e5c-2413b4a0c992	4294	Križe
00050000-55dd-a916-6b73-7cc5a4d5764f	9206	Križevci
00050000-55dd-a916-c1cb-fd8130c13fe7	9242	Križevci pri Ljutomeru
00050000-55dd-a916-0861-0279bf6b0282	1301	Krka
00050000-55dd-a916-fd8c-bdb0a8790665	8296	Krmelj
00050000-55dd-a916-094a-97e5926e8ef2	4245	Kropa
00050000-55dd-a916-3fc1-6ffa08f3a72e	8262	Krška vas
00050000-55dd-a916-c70f-329772877ef9	8270	Krško
00050000-55dd-a916-a67d-890e2a6cc92c	9263	Kuzma
00050000-55dd-a916-c4a1-03c365f9e63b	2318	Laporje
00050000-55dd-a916-ab2d-98077a48a2e7	3270	Laško
00050000-55dd-a916-1d69-f68a453e21af	1219	Laze v Tuhinju
00050000-55dd-a916-ba13-16e9741b13d6	2230	Lenart v Slovenskih goricah
00050000-55dd-a916-1bb8-89e82e985005	9220	Lendava/Lendva
00050000-55dd-a916-1d14-510ab896fd0a	4248	Lesce
00050000-55dd-a916-47c6-cf38f757734d	3261	Lesično
00050000-55dd-a916-6c56-7c8618d097e0	8273	Leskovec pri Krškem
00050000-55dd-a916-19f4-3b470f20c975	2372	Libeliče
00050000-55dd-a916-255f-41b4a5162ac3	2341	Limbuš
00050000-55dd-a916-9c89-c5574e77345d	1270	Litija
00050000-55dd-a916-2cc2-629816c9e734	3202	Ljubečna
00050000-55dd-a916-c675-94f867edcc55	1000	Ljubljana 
00050000-55dd-a916-dc8f-0f32985941f9	1001	Ljubljana - poštni predali
00050000-55dd-a916-7ccf-0f7e66400d9a	1231	Ljubljana - Črnuče
00050000-55dd-a916-ad18-5347a81d844a	1261	Ljubljana - Dobrunje
00050000-55dd-a916-a4dd-34e9fc55a1c3	1260	Ljubljana - Polje
00050000-55dd-a916-1e4d-2775017d1f90	1210	Ljubljana - Šentvid
00050000-55dd-a916-32a7-4b618b15be94	1211	Ljubljana - Šmartno
00050000-55dd-a916-8614-3aaa4db80a24	3333	Ljubno ob Savinji
00050000-55dd-a916-a80c-c6dc859ba79f	9240	Ljutomer
00050000-55dd-a916-53de-dde307c7b2d7	3215	Loče
00050000-55dd-a916-9a87-41b2f469b7ff	5231	Log pod Mangartom
00050000-55dd-a916-a61b-e6a5f903f0a5	1358	Log pri Brezovici
00050000-55dd-a916-5d89-c352a68215a0	1370	Logatec
00050000-55dd-a916-e2fb-5198189530be	1371	Logatec
00050000-55dd-a916-7f7c-fc7a3d599af5	1434	Loka pri Zidanem Mostu
00050000-55dd-a916-d413-6057424146ed	3223	Loka pri Žusmu
00050000-55dd-a916-0f5c-c5883200f858	6219	Lokev
00050000-55dd-a916-ed4f-edded7ab99d0	1318	Loški Potok
00050000-55dd-a916-d5dd-08cda82e6d87	2324	Lovrenc na Dravskem polju
00050000-55dd-a916-639e-2b06c035757f	2344	Lovrenc na Pohorju
00050000-55dd-a916-74d7-8ffa3fb4c423	3334	Luče
00050000-55dd-a916-7f19-571a7a629e4a	1225	Lukovica
00050000-55dd-a916-1117-ae43d05b658f	9202	Mačkovci
00050000-55dd-a916-f750-4c8c30f699af	2322	Majšperk
00050000-55dd-a916-0231-3ab23d185dc6	2321	Makole
00050000-55dd-a916-ad1c-ca3c15ddbfb9	9243	Mala Nedelja
00050000-55dd-a916-3037-8703e74cc8ae	2229	Malečnik
00050000-55dd-a916-277f-fb52df57ab5b	6273	Marezige
00050000-55dd-a916-10e7-e49b760c37ee	2000	Maribor 
00050000-55dd-a916-6c6c-71ec8b463628	2001	Maribor - poštni predali
00050000-55dd-a916-9f40-7ed2c38ab0e2	2206	Marjeta na Dravskem polju
00050000-55dd-a916-52d2-6d010d82d558	2281	Markovci
00050000-55dd-a916-5ff0-0de967ff5cf0	9221	Martjanci
00050000-55dd-a916-b7e8-79c170bde29d	6242	Materija
00050000-55dd-a916-a077-1425bda582ed	4211	Mavčiče
00050000-55dd-a916-d325-4f9ffbc47782	1215	Medvode
00050000-55dd-a916-45c4-18c9a3ba6af8	1234	Mengeš
00050000-55dd-a916-c6bd-eef2b585175e	8330	Metlika
00050000-55dd-a916-685f-1de612e8074e	2392	Mežica
00050000-55dd-a916-766a-faa8b5c6e084	2204	Miklavž na Dravskem polju
00050000-55dd-a916-32bb-5e1a42729004	2275	Miklavž pri Ormožu
00050000-55dd-a916-985f-6a4273488101	5291	Miren
00050000-55dd-a916-6306-7f0fc0f6dc54	8233	Mirna
00050000-55dd-a916-b082-97195877d2a8	8216	Mirna Peč
00050000-55dd-a916-fd8f-3364e7886b8d	2382	Mislinja
00050000-55dd-a916-7008-42881c1de776	4281	Mojstrana
00050000-55dd-a916-b6b5-910b8aa667c2	8230	Mokronog
00050000-55dd-a916-1ab6-40033e72a0e0	1251	Moravče
00050000-55dd-a916-4567-68e04ef47369	9226	Moravske Toplice
00050000-55dd-a916-1773-66cad846dcd8	5216	Most na Soči
00050000-55dd-a916-5a79-bedd2cd623a0	1221	Motnik
00050000-55dd-a916-e1ac-95340a33965f	3330	Mozirje
00050000-55dd-a916-ad84-31cd87f9d76b	9000	Murska Sobota 
00050000-55dd-a916-9547-8cee6ff12a3f	9001	Murska Sobota - poštni predali
00050000-55dd-a916-07af-e436bce84ad6	2366	Muta
00050000-55dd-a916-268a-7667899cd6b4	4202	Naklo
00050000-55dd-a916-66d5-e359eaaa5402	3331	Nazarje
00050000-55dd-a916-0485-d6a9ca53768a	1357	Notranje Gorice
00050000-55dd-a916-0cea-ab44e7a98dee	3203	Nova Cerkev
00050000-55dd-a916-74ee-1af375675b75	5000	Nova Gorica 
00050000-55dd-a916-7563-5915992367f7	5001	Nova Gorica - poštni predali
00050000-55dd-a916-bb57-19e671d26a29	1385	Nova vas
00050000-55dd-a916-7df2-41bc9b0f840b	8000	Novo mesto
00050000-55dd-a916-f941-6450e83366b5	8001	Novo mesto - poštni predali
00050000-55dd-a916-cbe5-d39d115203a5	6243	Obrov
00050000-55dd-a916-3f8e-3ff7c48f106f	9233	Odranci
00050000-55dd-a916-14e3-15a89b7a149a	2317	Oplotnica
00050000-55dd-a916-cc3a-20c81b11e40f	2312	Orehova vas
00050000-55dd-a916-952f-3b0da48c210c	2270	Ormož
00050000-55dd-a916-0684-df638e610df7	1316	Ortnek
00050000-55dd-a916-503c-76dafab984d9	1337	Osilnica
00050000-55dd-a916-20c9-93073ab7a8e0	8222	Otočec
00050000-55dd-a916-9159-ddf9168f6745	2361	Ožbalt
00050000-55dd-a916-308c-d0a8e7601873	2231	Pernica
00050000-55dd-a916-ac4f-3a30ac606d29	2211	Pesnica pri Mariboru
00050000-55dd-a916-300d-578f03802013	9203	Petrovci
00050000-55dd-a916-3ff0-ba4eddc4dd35	3301	Petrovče
00050000-55dd-a916-13d9-63b999458785	6330	Piran/Pirano
00050000-55dd-a916-6903-9361a41ace79	8255	Pišece
00050000-55dd-a916-5a26-7bd928679b5b	6257	Pivka
00050000-55dd-a916-e8c9-db12881b15de	6232	Planina
00050000-55dd-a916-3622-f4af38a1bd56	3225	Planina pri Sevnici
00050000-55dd-a916-5a1f-f9ae6ec54c7a	6276	Pobegi
00050000-55dd-a916-b2e4-d0935c570e0c	8312	Podbočje
00050000-55dd-a916-b57f-3658704833b4	5243	Podbrdo
00050000-55dd-a916-7aeb-0f9f0f8d0c0a	3254	Podčetrtek
00050000-55dd-a916-0297-5c79fcd0a164	2273	Podgorci
00050000-55dd-a916-6cc9-daa0d4a865fa	6216	Podgorje
00050000-55dd-a916-7824-791589676adf	2381	Podgorje pri Slovenj Gradcu
00050000-55dd-a916-8d74-feb0e46ebbe2	6244	Podgrad
00050000-55dd-a916-9e6f-31b520bb74b2	1414	Podkum
00050000-55dd-a916-889e-65a563864cce	2286	Podlehnik
00050000-55dd-a916-8d29-4a63b7bd372f	5272	Podnanos
00050000-55dd-a916-6cb7-78418ee65c63	4244	Podnart
00050000-55dd-a916-e49b-394beee4550a	3241	Podplat
00050000-55dd-a916-8563-af8d48b60916	3257	Podsreda
00050000-55dd-a916-47cc-45f3456d14ec	2363	Podvelka
00050000-55dd-a916-34b2-c8844849a281	2208	Pohorje
00050000-55dd-a916-2ced-7dbb4f03239c	2257	Polenšak
00050000-55dd-a916-1999-62959f900ff6	1355	Polhov Gradec
00050000-55dd-a916-8682-709b3260010e	4223	Poljane nad Škofjo Loko
00050000-55dd-a916-9662-0281ee41bed9	2319	Poljčane
00050000-55dd-a916-e9fa-3f6e8c89edeb	1272	Polšnik
00050000-55dd-a916-621d-1083bfeff7e3	3313	Polzela
00050000-55dd-a916-fcf2-bd36bef0d64c	3232	Ponikva
00050000-55dd-a916-626f-dffa9d7062b6	6320	Portorož/Portorose
00050000-55dd-a916-dc35-cfc26505ea0c	6230	Postojna
00050000-55dd-a916-482b-8dbd82a4758e	2331	Pragersko
00050000-55dd-a916-f9f6-7f068cf6b746	3312	Prebold
00050000-55dd-a916-da52-f50c5d37c2f4	4205	Preddvor
00050000-55dd-a916-ec2c-2634643a9746	6255	Prem
00050000-55dd-a916-4e4e-44d94e3b73eb	1352	Preserje
00050000-55dd-a916-4ded-ae28f43ba432	6258	Prestranek
00050000-55dd-a916-ea83-f657de3c88fb	2391	Prevalje
00050000-55dd-a916-8178-9980c6fc03ea	3262	Prevorje
00050000-55dd-a916-f2a8-730a68067a34	1276	Primskovo 
00050000-55dd-a916-91cf-c4dc9b76d3ab	3253	Pristava pri Mestinju
00050000-55dd-a916-aef1-ebb8d34cce84	9207	Prosenjakovci/Partosfalva
00050000-55dd-a916-818a-e0cfcd4d7cb7	5297	Prvačina
00050000-55dd-a916-d7e1-699647ad8b71	2250	Ptuj
00050000-55dd-a916-8290-c6e3adad4f21	2323	Ptujska Gora
00050000-55dd-a916-2150-ea87bea330a7	9201	Puconci
00050000-55dd-a916-644c-7d5d7e8136c7	2327	Rače
00050000-55dd-a916-9480-4d8d7aa0a52c	1433	Radeče
00050000-55dd-a916-68bf-666d6e263008	9252	Radenci
00050000-55dd-a916-8d6d-1a880c40d429	2360	Radlje ob Dravi
00050000-55dd-a916-2749-60e7554b09ff	1235	Radomlje
00050000-55dd-a916-e09e-f7ba2bffab0c	4240	Radovljica
00050000-55dd-a916-be03-7c26a7611c67	8274	Raka
00050000-55dd-a916-4431-59a54a76b077	1381	Rakek
00050000-55dd-a916-0f50-56cdd775aa58	4283	Rateče - Planica
00050000-55dd-a916-f50e-a72021eb545f	2390	Ravne na Koroškem
00050000-55dd-a916-6563-d42dbffc95a6	9246	Razkrižje
00050000-55dd-a916-2751-d04dc4b78e4d	3332	Rečica ob Savinji
00050000-55dd-a916-6184-4138616569dc	5292	Renče
00050000-55dd-a916-a5d0-910b27baa57a	1310	Ribnica
00050000-55dd-a916-42f6-d902a243826a	2364	Ribnica na Pohorju
00050000-55dd-a916-8171-1d684f189a88	3272	Rimske Toplice
00050000-55dd-a916-c9b1-b3c580eae165	1314	Rob
00050000-55dd-a916-fc27-09673cbe165a	5215	Ročinj
00050000-55dd-a916-551f-719c92827dbf	3250	Rogaška Slatina
00050000-55dd-a916-0cea-e79989159247	9262	Rogašovci
00050000-55dd-a916-2f59-82866af54c3e	3252	Rogatec
00050000-55dd-a916-32fd-d09c6443244c	1373	Rovte
00050000-55dd-a916-4778-d26f34bcbfbb	2342	Ruše
00050000-55dd-a916-8f3a-4d74a21fef7a	1282	Sava
00050000-55dd-a916-9919-73e2d4ca31f4	6333	Sečovlje/Sicciole
00050000-55dd-a916-5e89-c276e8fb7c96	4227	Selca
00050000-55dd-a916-7662-59593109abe9	2352	Selnica ob Dravi
00050000-55dd-a916-27ce-3b885e18dff1	8333	Semič
00050000-55dd-a916-e623-6b85a56b9f70	8281	Senovo
00050000-55dd-a916-6f66-2f1a825ca53a	6224	Senožeče
00050000-55dd-a916-1591-8940a58abbbc	8290	Sevnica
00050000-55dd-a916-f2a2-4487a89f5f19	6210	Sežana
00050000-55dd-a916-002c-2650d2a4d1b5	2214	Sladki Vrh
00050000-55dd-a916-a4ba-e7ba1529fbb0	5283	Slap ob Idrijci
00050000-55dd-a916-7e18-8341609fc179	2380	Slovenj Gradec
00050000-55dd-a916-8f4b-1c0bb9634db3	2310	Slovenska Bistrica
00050000-55dd-a916-bac0-f6ed7b0a6074	3210	Slovenske Konjice
00050000-55dd-a916-8e03-5c454b5b5305	1216	Smlednik
00050000-55dd-a916-66a5-832e3b38aac3	5232	Soča
00050000-55dd-a916-6c0a-683977b69afe	1317	Sodražica
00050000-55dd-a916-445b-22846c3b5264	3335	Solčava
00050000-55dd-a916-6566-8afc03c147b2	5250	Solkan
00050000-55dd-a916-b25e-a9f1b9b17db3	4229	Sorica
00050000-55dd-a916-2218-b17f473edeea	4225	Sovodenj
00050000-55dd-a916-737f-cbaffad65c99	5281	Spodnja Idrija
00050000-55dd-a916-c762-f3f5e85f33a9	2241	Spodnji Duplek
00050000-55dd-a916-1093-b91bd0e573ac	9245	Spodnji Ivanjci
00050000-55dd-a916-b3e7-a0fac0881a4c	2277	Središče ob Dravi
00050000-55dd-a916-a59b-2951b42a5b29	4267	Srednja vas v Bohinju
00050000-55dd-a916-a6a9-9ca38cc1ddb7	8256	Sromlje 
00050000-55dd-a916-ed2c-63557c74121d	5224	Srpenica
00050000-55dd-a916-e401-56632761a365	1242	Stahovica
00050000-55dd-a916-8e6f-0fd344f5cc72	1332	Stara Cerkev
00050000-55dd-a916-acc1-7016c0d6354a	8342	Stari trg ob Kolpi
00050000-55dd-a916-51ad-4620ad2e72b4	1386	Stari trg pri Ložu
00050000-55dd-a916-92d6-68ce780c49fc	2205	Starše
00050000-55dd-a916-1e27-fe8f2dad63c7	2289	Stoperce
00050000-55dd-a916-b429-72bdb84c8a59	8322	Stopiče
00050000-55dd-a916-4b05-7c29d34f49e2	3206	Stranice
00050000-55dd-a916-146a-c4d73b25be48	8351	Straža
00050000-55dd-a916-d057-9e468dcd3097	1313	Struge
00050000-55dd-a916-15b0-af6a534b76dc	8293	Studenec
00050000-55dd-a916-edcc-d36f9727aada	8331	Suhor
00050000-55dd-a916-ebcf-217c58380c4d	2233	Sv. Ana v Slovenskih goricah
00050000-55dd-a916-a88e-6de9307940de	2235	Sv. Trojica v Slovenskih goricah
00050000-55dd-a916-8434-32f4e4109c04	2353	Sveti Duh na Ostrem Vrhu
00050000-55dd-a916-8b35-02d7d2f92295	9244	Sveti Jurij ob Ščavnici
00050000-55dd-a916-a175-5f5427a39e4f	3264	Sveti Štefan
00050000-55dd-a916-099a-e121153f8878	2258	Sveti Tomaž
00050000-55dd-a916-9bed-31162ed8ae1b	9204	Šalovci
00050000-55dd-a916-d45a-1e6ec7749088	5261	Šempas
00050000-55dd-a916-558c-84e2859e56dc	5290	Šempeter pri Gorici
00050000-55dd-a916-2a63-9dfb570be62b	3311	Šempeter v Savinjski dolini
00050000-55dd-a916-2310-1949e8d52683	4208	Šenčur
00050000-55dd-a916-abff-94b08aa4cc4d	2212	Šentilj v Slovenskih goricah
00050000-55dd-a916-3760-add611c7cce6	8297	Šentjanž
00050000-55dd-a916-c9ac-c79c795ffbda	2373	Šentjanž pri Dravogradu
00050000-55dd-a916-218c-87ce94f14c60	8310	Šentjernej
00050000-55dd-a916-7dac-95cd54ca6333	3230	Šentjur
00050000-55dd-a916-8a5d-13a0b8c010d7	3271	Šentrupert
00050000-55dd-a916-6a05-28ec2c4ef519	8232	Šentrupert
00050000-55dd-a916-9d4a-69dfe0a8084f	1296	Šentvid pri Stični
00050000-55dd-a916-64c4-1f799df1ad67	8275	Škocjan
00050000-55dd-a916-1249-14499e1ffdb2	6281	Škofije
00050000-55dd-a916-a16d-64b8df993dab	4220	Škofja Loka
00050000-55dd-a916-aa0a-0736b6bafb38	3211	Škofja vas
00050000-55dd-a916-3af9-2f173ea8ea72	1291	Škofljica
00050000-55dd-a916-1fee-2d33c817f548	6274	Šmarje
00050000-55dd-a916-c824-935a4aaf42b0	1293	Šmarje - Sap
00050000-55dd-a916-e33f-719c0e4b51f3	3240	Šmarje pri Jelšah
00050000-55dd-a916-fffe-a15352a7e5c0	8220	Šmarješke Toplice
00050000-55dd-a916-e02e-99119e1a6a09	2315	Šmartno na Pohorju
00050000-55dd-a916-537b-5482c630384d	3341	Šmartno ob Dreti
00050000-55dd-a916-0cb4-5048b868849a	3327	Šmartno ob Paki
00050000-55dd-a916-0bb5-3552ce4cba95	1275	Šmartno pri Litiji
00050000-55dd-a916-34e1-87dba902e05f	2383	Šmartno pri Slovenj Gradcu
00050000-55dd-a916-8b93-79c7b4dd6503	3201	Šmartno v Rožni dolini
00050000-55dd-a916-55ca-6f582824938c	3325	Šoštanj
00050000-55dd-a916-fc2b-2409ea103625	6222	Štanjel
00050000-55dd-a916-032e-b7aea9eeb5fd	3220	Štore
00050000-55dd-a916-d08e-eacc305ac14c	3304	Tabor
00050000-55dd-a916-22e8-8bc7e94c972b	3221	Teharje
00050000-55dd-a916-f285-5b3546b9c1e3	9251	Tišina
00050000-55dd-a916-2ec8-d1bdcedd9691	5220	Tolmin
00050000-55dd-a916-8094-24e8950d1cde	3326	Topolšica
00050000-55dd-a916-0a34-953359940860	2371	Trbonje
00050000-55dd-a916-0677-ebecf51e847a	1420	Trbovlje
00050000-55dd-a916-2c19-d16b9c820571	8231	Trebelno 
00050000-55dd-a916-4490-9e97a159ff37	8210	Trebnje
00050000-55dd-a916-aa90-802651fbe9a5	5252	Trnovo pri Gorici
00050000-55dd-a916-e8ab-f74cf5225402	2254	Trnovska vas
00050000-55dd-a916-aaee-67f09fccec95	1222	Trojane
00050000-55dd-a916-4390-9283709d9fcc	1236	Trzin
00050000-55dd-a916-2374-f4cc23b5d778	4290	Tržič
00050000-55dd-a916-817e-de205759cf37	8295	Tržišče
00050000-55dd-a916-f8db-809270775e54	1311	Turjak
00050000-55dd-a916-0bca-8db77430fc93	9224	Turnišče
00050000-55dd-a916-fae7-a33088df754d	8323	Uršna sela
00050000-55dd-a916-1755-bad53ce2d8d7	1252	Vače
00050000-55dd-a916-7d2a-a3a4bb6a1680	3320	Velenje 
00050000-55dd-a916-57ea-6fded079de5e	3322	Velenje - poštni predali
00050000-55dd-a916-290e-9d1abf2c94bb	8212	Velika Loka
00050000-55dd-a916-acc0-dab83934fe52	2274	Velika Nedelja
00050000-55dd-a916-fb8d-742cc1edcd75	9225	Velika Polana
00050000-55dd-a916-5061-913e46c0ed41	1315	Velike Lašče
00050000-55dd-a916-a896-09ea43c3b891	8213	Veliki Gaber
00050000-55dd-a916-df39-a142531ad1f8	9241	Veržej
00050000-55dd-a916-c19d-2ff461b5ed08	1312	Videm - Dobrepolje
00050000-55dd-a916-c6a1-9f9d46375b3b	2284	Videm pri Ptuju
00050000-55dd-a916-8ea2-b32ff0ed0e4c	8344	Vinica
00050000-55dd-a916-89af-761869a8d587	5271	Vipava
00050000-55dd-a916-35fb-5105bdc9a797	4212	Visoko
00050000-55dd-a916-1d15-03f92360c610	1294	Višnja Gora
00050000-55dd-a916-30dd-2f790adbe5f8	3205	Vitanje
00050000-55dd-a916-7b37-12029f5cf333	2255	Vitomarci
00050000-55dd-a916-a086-5af8bbcc8350	1217	Vodice
00050000-55dd-a916-ccca-ae1b79c2dbac	3212	Vojnik\t
00050000-55dd-a916-444d-c42e5fe4ab44	5293	Volčja Draga
00050000-55dd-a916-d5f1-b27a2db781cb	2232	Voličina
00050000-55dd-a916-9922-21c416450a21	3305	Vransko
00050000-55dd-a916-7a09-51217d87f597	6217	Vremski Britof
00050000-55dd-a916-328d-4e7271965211	1360	Vrhnika
00050000-55dd-a916-c3b2-a62a1ddfbc3b	2365	Vuhred
00050000-55dd-a916-d30a-07276acb0624	2367	Vuzenica
00050000-55dd-a916-02ec-8041c6ab38fd	8292	Zabukovje 
00050000-55dd-a916-bace-453400dc58f2	1410	Zagorje ob Savi
00050000-55dd-a916-6a8e-223eb19248e7	1303	Zagradec
00050000-55dd-a916-36ee-e78924dbdd65	2283	Zavrč
00050000-55dd-a916-3577-ad1bae59c314	8272	Zdole 
00050000-55dd-a916-527e-48a5539dcad7	4201	Zgornja Besnica
00050000-55dd-a916-4e7d-01695e7c9df1	2242	Zgornja Korena
00050000-55dd-a916-2279-2c7b158a9785	2201	Zgornja Kungota
00050000-55dd-a916-b529-00e3e522b2aa	2316	Zgornja Ložnica
00050000-55dd-a916-b956-0a32298f5683	2314	Zgornja Polskava
00050000-55dd-a916-1d79-822e63621e78	2213	Zgornja Velka
00050000-55dd-a916-d3bc-9d597f92ca45	4247	Zgornje Gorje
00050000-55dd-a916-0f7f-0e89cab0d1de	4206	Zgornje Jezersko
00050000-55dd-a916-096d-036a855f933a	2285	Zgornji Leskovec
00050000-55dd-a916-8974-99b93cfc96cb	1432	Zidani Most
00050000-55dd-a916-932e-c138e79d998f	3214	Zreče
00050000-55dd-a916-d1f9-c02246ba990d	4209	Žabnica
00050000-55dd-a916-9fa8-907bf697917b	3310	Žalec
00050000-55dd-a916-043c-9b5862ff38c6	4228	Železniki
00050000-55dd-a916-2215-67fa38fb8c47	2287	Žetale
00050000-55dd-a916-5090-2a48acda5c31	4226	Žiri
00050000-55dd-a916-00a9-ffff9dc22d0f	4274	Žirovnica
00050000-55dd-a916-5070-80c2f9c99b55	8360	Žužemberk
\.


--
-- TOC entry 2932 (class 0 OID 15628968)
-- Dependencies: 200
-- Data for Name: postavkaracuna; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkaracuna (id, racun_id) FROM stdin;
\.


--
-- TOC entry 2914 (class 0 OID 15628774)
-- Dependencies: 182
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
00060000-55dd-a918-f7ed-1317d673f32f	00080000-55dd-a918-9913-4f942e6b3d4a	\N	00040000-55dd-a916-443c-bd20c44582ab	Narodni dom	\N	Koroška 15	\N	9231	Beltinci	\N	f	t
00060000-55dd-a918-026b-710dbfcd5375	00080000-55dd-a918-9913-4f942e6b3d4a	\N	00040000-55dd-a916-443c-bd20c44582ab		\N	Koroška 22	\N	9231	Beltinci	\N	f	f
00060000-55dd-a918-1352-e2d7cc472a27	00080000-55dd-a918-641c-2d7bf52c8465	\N	00040000-55dd-a916-443c-bd20c44582ab		\N	Rimska ploščad 7	\N	9231	Beltinci	\N	f	t
\.


--
-- TOC entry 2920 (class 0 OID 15628852)
-- Dependencies: 188
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, gostujoc_id) FROM stdin;
\.


--
-- TOC entry 2934 (class 0 OID 15628980)
-- Dependencies: 202
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 2958 (class 0 OID 15629329)
-- Dependencies: 226
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, koproducent_id, odstotekfinanciranja, delez, maticnikop, kpe, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 2959 (class 0 OID 15629339)
-- Dependencies: 227
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, sifra, status) FROM stdin;
00190000-55dd-a918-a8a0-51b77bebe3b2	00080000-55dd-a918-93af-9a6ab1819202	0987	AK
00190000-55dd-a918-50d1-2b9d3a712f89	00080000-55dd-a918-641c-2d7bf52c8465	0989	AK
00190000-55dd-a918-da2f-c1583c1060e8	00080000-55dd-a918-0015-14e87f3238af	0986	AK
00190000-55dd-a918-505f-19fbb56f447c	00080000-55dd-a918-ac52-4376348e350f	0984	AK
00190000-55dd-a918-72bc-46e08dbec508	00080000-55dd-a918-1a81-bcccdabf40ee	0983	AK
00190000-55dd-a918-66c6-d56569d4a284	00080000-55dd-a918-63f9-b9889764c627	0982	AK
00190000-55dd-a919-8065-55088299d402	00080000-55dd-a919-a9e7-82bae995a14e	1001	AK
\.


--
-- TOC entry 2957 (class 0 OID 15629285)
-- Dependencies: 225
-- Data for Name: programdela; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programdela (id, sezona_id, sifra, naziv, zacetek, konec, zakljuceno, potrjenprogram, stpremier, stint, stfest, strazno, stizjem, stponprem, stponprej, stponprejvelikih, stponprejmalih, stponprejmalihkopr, stponprejsredkopr, stponprejvelikihkopr, stgostujo, vrps1, vrps1do, vrps1mat, vrps1gostovsz, stizvnekomerc, stizvprem, stizvponprem, stizvponpremdoma, stizvponpremzamejo, stizvponpremgost, stizvponpremkopr, stizvponpremint, stizvponpremkoprint, stizvponprej, stizvponprejdoma, stizvponprejzamejo, stizvponprejgost, stizvponprejkopr, stizvponprejint, stizvponprejkoprint, stizvgostuj, stizvostalihnek, stizvgostovanjslo, stizvgostovanjzam, stizvgostovanjint, stobisknekom, stobisknekommat, stobisknekomgostslo, stobisknekomgostzam, stobisknekomgostint, stobiskprem, stobiskponprem, stobiskponpremdoma, stobiskponpremkopr, stobiskponpremkoprint, avgobiskprired, avgzaseddvoran, avgcenavstopnice, stprodvstopnic, stkoprodukcij, stkoprodukcijint, stkoprodukcijnvo, stzaposlenih, stzaposigralcev, avgstnastopovigr, sthonorarnih, sthonorarnihigr, sthonorarnihigrtujjz, sthonorarnihigrsamoz, sredstvaint, sredstvaavt, sredstvazaprosenoprem, sredstvazaprosenoponprem, sredstvazaprosenoponprej, sredstvazaprosenogostujo, sredstvazaprosenoint, sredstvazaprosenofest, sredstvazaprosenorazno, sredstvazaprosenoizjem, sredstvadrugijavniprem, sredstvadrugijavniponprem, sredstvadrugijavniponprej, sredstvadrugijavnigostujo, sredstvadrugijavniint, sredstvadrugijavnifest, sredstvadrugijavnirazno, sredstvadrugijavniizjem, sredstvadrugiviriprem, sredstvadrugiviriponprem, sredstvadrugiviriponprej, sredstvadrugivirigostujo, sredstvadrugiviriint, sredstvadrugivirifest, sredstvadrugivirirazno, sredstvadrugiviriizjem, sredstvaavtsamoz) FROM stdin;
00290000-55dd-a918-534a-1e27ac14ac23	\N	0001	Testni program dela	2016-02-01	2017-02-01	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 2960 (class 0 OID 15629347)
-- Dependencies: 228
-- Data for Name: programskaenotasklopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programskaenotasklopa (id, naslovpe, avtorpe, obsegpe, mesecpe, vrednostpe, programrazno_id) FROM stdin;
\.


--
-- TOC entry 2938 (class 0 OID 15629009)
-- Dependencies: 206
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, popa_id, naslov_id, sifra, naziv, jeprizorisce, kapaciteta, opis) FROM stdin;
00220000-55dd-a918-ca3c-598bd7eae290	\N	\N	0001	Poskusna 1	f	8	Poskusna učilnica v prvem
00220000-55dd-a918-ee29-133dfd9718cf	\N	\N	0002	Poskusna 3	f	34	Poskusna učilnica v tretjem
00220000-55dd-a918-f9b1-a78878ea641e	\N	\N	0003	Kazinska	t	84	Kazinska dvorana
00220000-55dd-a918-ac7c-0e12603bd181	\N	\N	0004	Mali oder	t	24	Mali oder 
00220000-55dd-a918-82a1-b8036a8a6024	\N	\N	0005	Komorni oder	t	15	Komorni oder
00220000-55dd-a918-ee73-41742b36a4f6	\N	\N	0006	Stara dvorana	t	96	Stara dvorana ali dvorana Franceta Prešerna
00220000-55dd-a918-19a0-7b4ce24eceef	\N	\N	0007	Velika dvorana	t	160	Velika, glavna dvorana
\.


--
-- TOC entry 2930 (class 0 OID 15628953)
-- Dependencies: 198
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 2929 (class 0 OID 15628943)
-- Dependencies: 197
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 2950 (class 0 OID 15629140)
-- Dependencies: 218
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta, status) FROM stdin;
\.


--
-- TOC entry 2945 (class 0 OID 15629079)
-- Dependencies: 213
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 2903 (class 0 OID 15628647)
-- Dependencies: 171
-- Data for Name: revizije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY revizije (id, razred, objectid, upor, datum, tip, data) FROM stdin;
1	App\\Entity\\Popa	00080000-55dd-a919-a9e7-82bae995a14e	00010000-55dd-a917-97fd-6b64245ce82a	2015-08-26 13:55:05	INS	a:0:{}
2	App\\Entity\\Option	00000000-55dd-a919-9bb0-6ae70321c131	00010000-55dd-a917-97fd-6b64245ce82a	2015-08-26 13:55:05	INS	a:0:{}
3	ProgramDela\\Entity\\ProdukcijskaHisa	00190000-55dd-a919-8065-55088299d402	00010000-55dd-a917-97fd-6b64245ce82a	2015-08-26 13:55:05	INS	a:0:{}
\.


--
-- TOC entry 2981 (class 0 OID 0)
-- Dependencies: 170
-- Name: revizije_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('revizije_id_seq', 3, true);


--
-- TOC entry 2939 (class 0 OID 15629021)
-- Dependencies: 207
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 2907 (class 0 OID 15628685)
-- Dependencies: 175
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-55dd-a917-c692-1ed284b8ef3a	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-55dd-a917-10e8-fec7d7e37851	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-55dd-a917-fb30-ae947b626498	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-55dd-a917-4721-0849cc9d31f4	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-55dd-a917-7ced-a861a830e973	planer	Planer dogodkov v koledarju	t
00020000-55dd-a917-6f9b-26e0b096ecf3	kadrovska	Kadrovska služba	t
00020000-55dd-a917-d7bf-9d69146ed5d4	arhivar	Ažuriranje arhivalij	t
00020000-55dd-a917-21e5-c501d350183b	igralec	Igralec	t
00020000-55dd-a917-8deb-b30de149cd49	prisotnost	Vnašalec prisotnosti, tudi za tiste izven uprizoritev	t
00020000-55dd-a918-45a9-7b6edc9cc6ab	vsadovoljenja	Vloga z vsemi posameznimi dovoljenji	t
\.


--
-- TOC entry 2905 (class 0 OID 15628669)
-- Dependencies: 173
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-55dd-a917-9016-20c688431dfd	00020000-55dd-a917-fb30-ae947b626498
00010000-55dd-a917-97fd-6b64245ce82a	00020000-55dd-a917-fb30-ae947b626498
00010000-55dd-a918-a02e-ef50b932f939	00020000-55dd-a918-45a9-7b6edc9cc6ab
\.


--
-- TOC entry 2941 (class 0 OID 15629035)
-- Dependencies: 209
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 2933 (class 0 OID 15628974)
-- Dependencies: 201
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 2927 (class 0 OID 15628919)
-- Dependencies: 195
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, sifra, ime, zacetek, konec, aktivna) FROM stdin;
\.


--
-- TOC entry 2965 (class 0 OID 15629388)
-- Dependencies: 233
-- Data for Name: stevilcenje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenje (id, sifra, naziv, prefix, suffix, zacetek, dolzina, format, globalno, poletih) FROM stdin;
00230000-55dd-a916-e72a-ec63606d7f81	pri	Privzeto številčenje po letih YYYY-N	\N	\N	1	1	%l-%n	f	t
00230000-55dd-a916-2889-4cf4fce24a7d	123	Privzeto številčenje kratkih šifer	\N	\N	100	3	%n	f	f
00230000-55dd-a916-eda4-132753673fef	bcd	Globalno številčenje črtnih kod	\N	\N	1	9	%n	t	f
00230000-55dd-a916-4546-36714ccd3d5f	sif	Številčenje šifrant	\N	\N	1000	4	%n	t	f
00230000-55dd-a916-d66a-097f7477d173	tmp	Globalno številčenje začasnih številk	tmp	\N	1000	5	%l%n	t	t
\.


--
-- TOC entry 2964 (class 0 OID 15629380)
-- Dependencies: 232
-- Data for Name: stevilcenjekonfig; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjekonfig (id, stevilcenje_id, dok) FROM stdin;
00240000-55dd-a916-535d-e6d9185201b1	00230000-55dd-a916-4546-36714ccd3d5f	popa
00240000-55dd-a916-3a1f-2b220b20d406	00230000-55dd-a916-4546-36714ccd3d5f	oseba
00240000-55dd-a916-bdec-68f27457915c	00230000-55dd-a916-4546-36714ccd3d5f	sezona
00240000-55dd-a916-c877-9dfab0b0c463	00230000-55dd-a916-2889-4cf4fce24a7d	prostor
00240000-55dd-a916-1cda-04658b66cf06	00230000-55dd-a916-4546-36714ccd3d5f	besedilo
00240000-55dd-a916-ec11-4a4a701a52ae	00230000-55dd-a916-4546-36714ccd3d5f	uprizoritev
00240000-55dd-a916-aad7-74f9387f92eb	00230000-55dd-a916-4546-36714ccd3d5f	funkcija
00240000-55dd-a916-9edd-0efc95d9bb00	00230000-55dd-a916-4546-36714ccd3d5f	tipfunkcije
00240000-55dd-a916-3f68-4aa617d0950a	00230000-55dd-a916-4546-36714ccd3d5f	alternacija
00240000-55dd-a916-1b55-a3626f36d0a1	00230000-55dd-a916-e72a-ec63606d7f81	pogodba
00240000-55dd-a916-0bfc-9ef778077f45	00230000-55dd-a916-4546-36714ccd3d5f	zaposlitev
00240000-55dd-a916-bb84-c2de684b5e37	00230000-55dd-a916-e72a-ec63606d7f81	programdela
00240000-55dd-a916-fc10-7dbffaa69810	00230000-55dd-a916-4546-36714ccd3d5f	zapis
\.


--
-- TOC entry 2963 (class 0 OID 15629375)
-- Dependencies: 231
-- Data for Name: stevilcenjestanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjestanje (id, objid, leto, stevilka) FROM stdin;
1002b596-a7b8-4d31-bafc-40bb6ffc1292	00230000-55dd-a916-4546-36714ccd3d5f	0	1001
\.


--
-- TOC entry 2946 (class 0 OID 15629089)
-- Dependencies: 214
-- Data for Name: strosekuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY strosekuprizoritve (id, uprizoritev_id, popa_id, naziv, vrednostdo, vrednostna, opis, tipstroska, sort, vrstastroska_id) FROM stdin;
00270000-55dd-a918-6d86-a23479bc8b2f	000e0000-55dd-a918-5f96-d2c003315781	00080000-55dd-a918-9913-4f942e6b3d4a	Nabava kostumov	600.50	20.00	Krila in maske	materialni	1	003b0000-55dd-a916-7404-7cc0b9bd8ae8
00270000-55dd-a918-5a7b-dd6cdada9fbd	000e0000-55dd-a918-5f96-d2c003315781	00080000-55dd-a918-9913-4f942e6b3d4a	Zavese	125.70	3.10	Modra in zelena zavesa	materialni	2	003b0000-55dd-a916-7404-7cc0b9bd8ae8
00270000-55dd-a918-7e86-856ceb3dbf56	000e0000-55dd-a918-5f96-d2c003315781	00080000-55dd-a918-e7ca-0707dc406eec	Avtorske pravice	300.00	30.00	Odkup avtorskih pravic	avtorprav	4	\N
\.


--
-- TOC entry 2912 (class 0 OID 15628747)
-- Dependencies: 180
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 2928 (class 0 OID 15628929)
-- Dependencies: 196
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja) FROM stdin;
001a0000-55dd-a918-d9a9-bb5bd696f6f9	00180000-55dd-a918-be34-7d3449b630f3	000c0000-55dd-a918-86ec-690481d7c5a4	00090000-55dd-a918-1d48-b5db5ab80890	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55dd-a918-3d38-beefcdb2d38d	00180000-55dd-a918-be34-7d3449b630f3	000c0000-55dd-a918-13c5-c500c914d144	00090000-55dd-a918-cbdb-fcf7d436bbdd	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55dd-a918-ae9d-b17f2bc49ab5	00180000-55dd-a918-be34-7d3449b630f3	000c0000-55dd-a918-024e-241628c4fe35	00090000-55dd-a918-d803-e026c723e945	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55dd-a918-5432-8a9436239263	00180000-55dd-a918-be34-7d3449b630f3	000c0000-55dd-a918-e349-00e9b03e066d	00090000-55dd-a918-e2a7-08ade7d43278	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55dd-a918-31b4-478f4daa40c8	00180000-55dd-a918-be34-7d3449b630f3	000c0000-55dd-a918-bc3f-661cbf0f4bb8	00090000-55dd-a918-084a-5e42addb69db	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55dd-a918-1841-6085a43d8c73	00180000-55dd-a918-8bff-ccdf63c574f9	\N	00090000-55dd-a918-084a-5e42addb69db	2015-08-01 20:00:00	2015-08-01 23:00:00	\N	\N	2.00
\.


--
-- TOC entry 2949 (class 0 OID 15629129)
-- Dependencies: 217
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, ime, opis, imezenski, podrocje) FROM stdin;
000f0000-55dd-a916-d44e-a1795cc19824	Avtor	Avtorji	Avtorka	umetnik
000f0000-55dd-a916-4ca2-aaa98276daa0	Priredba	Priredba	Priredba	umetnik
000f0000-55dd-a916-83c2-2dd4f7c51174	Prevod	Prevod	Prevod	umetnik
000f0000-55dd-a916-3b8b-347b95838d6c	Režija	Režija	Režija	umetnik
000f0000-55dd-a916-13d0-5b174a61f49d	Dramaturgija	Dramaturgija	Dramaturgija	umetnik
000f0000-55dd-a916-b722-def3f052a0f3	Scenografija	Scenografija	Scenografija	umetnik
000f0000-55dd-a916-e17c-e4a81d7e2627	Kostumografija	Kostumografija	Kostumografija	umetnik
000f0000-55dd-a916-092b-d0fe5f517df6	Koreografija	Koreografija	Koreografija	umetnik
000f0000-55dd-a916-9a6b-059ae3125204	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	umetnik
000f0000-55dd-a916-24e1-70ff02213540	Oblikovanje maske	Oblikovanje maske	Oblikovanje maske	umetnik
000f0000-55dd-a916-e12d-61804da07f20	Lektorstvo	Lektorstvo	Lektorstvo	umetnik
000f0000-55dd-a916-478a-bd0dca2e0b70	Glasbeni soustvarjalec	Glasbeni soustvarjalci	Glasbena soustvarjalka	umetnik
000f0000-55dd-a916-1833-fd134f93f0d5	Intermedijski ustvarjalec	Intermedijski ustvarjalci	Intermedijski ustvarjalka	umetnik
000f0000-55dd-a916-ac31-60cc7c20a056	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	umetnik
000f0000-55dd-a916-3eb3-28bff80f4bce	Vloga	Intermedijski ustvarjalci	Intermedijska ustvarjalka	igralec
000f0000-55dd-a916-a19e-b11058f06999	Produkcija, mentorstvo	Produkcija, mentorstvo	Produkcija, mentorstvo	umetnik
000f0000-55dd-a916-dc36-6a06ecb97bae	Tehnična podpora	Tehnična podpora	Tehnična podpora	tehnik
000f0000-55dd-a916-4d82-419b65b46b28	Inšpicient	Inšpicienti	Inšpicientka	inspicient
\.


--
-- TOC entry 2961 (class 0 OID 15629357)
-- Dependencies: 229
-- Data for Name: tipprogramskeenote; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipprogramskeenote (id, sifra, naziv, koprodukcija, maxfaktor, maxvsi) FROM stdin;
002b0000-55dd-a916-b56a-468e566f1e3f	01	Velika predstava	f	1.00	1.00
002b0000-55dd-a916-6511-4762c127d6ec	02	Mala predstava	f	0.50	0.50
002b0000-55dd-a916-c0d7-c86eda55b585	03	Mala koprodukcija	t	0.40	1.00
002b0000-55dd-a916-326c-5383ee85c596	04	Srednja koprodukcija	t	0.70	2.00
002b0000-55dd-a916-cd22-4797e82e3e86	05	Velika koprodukcija	t	1.00	3.00
\.


--
-- TOC entry 2917 (class 0 OID 15628809)
-- Dependencies: 185
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 2904 (class 0 OID 15628656)
-- Dependencies: 172
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-55dd-a917-97fd-6b64245ce82a	Konzolni	$2y$05$NS4xMjkyMTcwMzExMjAxRORQROC0Pi/38VivinA6tBA2vV0NNNl8u	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-55dd-a918-c99b-05e83381d33b	testni uporabnik za inšpicienta	$2y$05$NS4xMjkyMTcwMzExMjAxROxkJ1B6xAXex6EZLIwJfWzRJ8DpfecFO	t	\N	\N	\N	ivo@ifigenija.si	\N	\N	\N
00010000-55dd-a918-48d1-93fe89f4fe38	testni uporabnik za Tehničnega vodjo	$2y$05$NS4xMjkyMTcwMzExMjAxROu/kXWR9sP9oamkesKuxXLbxkCb387.G	t	\N	\N	\N	tona@ifigenija.si	\N	\N	\N
00010000-55dd-a918-3ae3-43b0acefa01c	testni uporabnik za igralca	$2y$05$NS4xMjkyMTcwMzExMjAxRO/hLCgClfERRsfCAFYwxNCcFIVjP2982	t	\N	\N	\N	irena@ifigenija.si	\N	\N	\N
00010000-55dd-a918-964b-d8b05ccf4ef0	testni uporabnik vnašalca termina storitev (TerminStoritve-vse)	$2y$05$NS4xMjkyMTcwMzExMjAxROT6.kTHqEq4.wa2SOnf124/N14m9qeP.	t	\N	\N	\N	tatjana@ifigenija.si	\N	\N	\N
00010000-55dd-a918-a864-274df5427c80	testni uporabnik, ki je inšpicient brez zapisov v TerminStoritve	$2y$05$NS4xMjkyMTcwMzExMjAxROHau47Dtb7CME5.nlWwBVM.nusFP.ra2	t	\N	\N	\N	joze@ifigenija.si	\N	\N	\N
00010000-55dd-a918-131c-76e00470bf57	testna uporabnica, ki je planerka	$2y$05$NS4xMjkyMTcwMzExMjAxRO.B/uJO3C7QRNhdX9Q2hTLQsSupj1V1S	t	\N	\N	\N	petra@ifigenija.si	\N	\N	\N
00010000-55dd-a918-bc62-51ec0a08f16e	testni uporabnik, ki dobi ifi-all vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROv2d7jqhaV/Mz3EIsKoi7UoFR.SDSMBm	t	\N	\N	\N	ali@ifigenija.si	\N	\N	\N
00010000-55dd-a918-8aba-188730af9d93	testni uporabnik, ki dobi ifi-readall vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROYB9g.gnkufr1l/gWK6mkx.ySqrOWnJC	t	\N	\N	\N	berta@ifigenija.si	\N	\N	\N
00010000-55dd-a918-cad4-8085e249d05d	testni uporabnik, ki dobi aaa-write dovoljenje	$2y$05$NS4xMjkyMTcwMzExMjAxRORujYObKX.DzpXVYbePkiJkHqg0/Ylya	t	\N	\N	\N	aaron@ifigenija.si	\N	\N	\N
00010000-55dd-a918-a02e-ef50b932f939	testni uporabnik ki dobi vsa posamezna dovoljenja	$2y$05$NS4xMjkyMTcwMzExMjAxRO2ymwxVXTr7U4Ncdn.bN49E8rLw9Jg0O	t	\N	\N	\N	vesna@ifigenija.si	\N	\N	\N
00010000-55dd-a917-9016-20c688431dfd	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 2953 (class 0 OID 15629177)
-- Dependencies: 221
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, producent_id, sifra, faza, naslov, podnaslov, delovninaslov, internacionalninaslov, datumzacstudija, stevilovaj, planiranostevilovaj, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, kratkinaslov, maticnioder_id) FROM stdin;
000e0000-55dd-a918-e1e2-95eceb14f6fa	00160000-55dd-a918-7eef-5f5f55a9378c	00150000-55dd-a916-5ca5-a03896e3bb92	00140000-55dd-a916-3ba6-d1cb0580d0fc	\N	0001	produkcija	Sen kresne noči		Sanje	\N	2016-02-01	\N	\N	2016-06-01	1	William Shakespeare	f	2				\N	f		00220000-55dd-a918-82a1-b8036a8a6024
000e0000-55dd-a918-5f96-d2c003315781	00160000-55dd-a918-9a8b-aa1627068783	00150000-55dd-a916-e49a-0ce230fdf7b7	00140000-55dd-a916-c7c7-884d2e85f956	\N	0002	predprodukcija-ideja	Smoletov vrt			\N	2016-01-01	\N	\N	2016-04-20	2	B. Hočevar	f	2				\N	f		00220000-55dd-a918-ee73-41742b36a4f6
000e0000-55dd-a918-46d7-58e2ef06661d	\N	00150000-55dd-a916-e49a-0ce230fdf7b7	00140000-55dd-a916-c7c7-884d2e85f956	00190000-55dd-a918-a8a0-51b77bebe3b2	0003	postprodukcija	Kisli maček			\N	2016-02-01	\N	\N	2016-04-20	2	Caryl Churchill	t	2				\N	f		00220000-55dd-a918-82a1-b8036a8a6024
000e0000-55dd-a918-0dfd-0fe5222a51dd	\N	00150000-55dd-a916-e49a-0ce230fdf7b7	00140000-55dd-a916-c7c7-884d2e85f956	00190000-55dd-a918-a8a0-51b77bebe3b2	0004	postprodukcija	Vladimir			\N	2017-03-01	\N	\N	2017-04-20	2	Matjaž Zupančič	t	2				\N	f		00220000-55dd-a918-82a1-b8036a8a6024
000e0000-55dd-a918-34ef-91f252bd26ea	\N	00150000-55dd-a916-e49a-0ce230fdf7b7	00140000-55dd-a916-c7c7-884d2e85f956	00190000-55dd-a918-a8a0-51b77bebe3b2	0005	postprodukcija	Španska princesa			\N	2017-04-01	\N	\N	2017-05-20	1	Nina Kokelj	f	1				\N	f		00220000-55dd-a918-ca3c-598bd7eae290
000e0000-55dd-a918-ecc4-36328919dcc1	\N	00150000-55dd-a916-e49a-0ce230fdf7b7	00140000-55dd-a916-c7c7-884d2e85f956	00190000-55dd-a918-a8a0-51b77bebe3b2	0006	postprodukcija	Ne vemo datumov			\N	\N	\N	\N	\N	1	Nandi Frafar	f	1				\N	f		00220000-55dd-a918-ca3c-598bd7eae290
\.


--
-- TOC entry 2922 (class 0 OID 15628871)
-- Dependencies: 190
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, uprizoritev_id, zaporedna, porocilo) FROM stdin;
00200000-55dd-a918-b723-797563e51853	000e0000-55dd-a918-5f96-d2c003315781	1	
00200000-55dd-a918-7c00-c87ef8e0ff8b	000e0000-55dd-a918-5f96-d2c003315781	2	
\.


--
-- TOC entry 2937 (class 0 OID 15629001)
-- Dependencies: 205
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 2947 (class 0 OID 15629103)
-- Dependencies: 215
-- Data for Name: vrstastroska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstastroska (id, skupina, podskupina, naziv, opis) FROM stdin;
003b0000-55dd-a916-6d96-c9e287bdb326	1	0	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE
003b0000-55dd-a916-6848-1ba3c6f8fb5b	1	1	Storitve varovanja zgradb in prostorov	storitve varovanja zgradb in prostorov (npr. gasilci na predstavah)
003b0000-55dd-a916-7607-3a8af6e498ca	1	2	Založniške in tiskarske storitve	založniške in tiskarske storitve
003b0000-55dd-a916-70c1-a9d94e886de8	1	3	Časopisi, revije, knjige in strokovna literatura	časopisi, revije, knjige in strokovna literatura
003b0000-55dd-a916-c519-47ba4b2424fe	1	4	Stroški prevajalskih storitev	stroški prevajalskih storitev
003b0000-55dd-a916-2270-fc644f7ee4d8	1	5	Stroški oglaševalskih storitev	stroški oglaševalskih storitev
003b0000-55dd-a916-2b88-2a768d22d04a	1	6	Izdatki za reprezentanco	izdatki za reprezentanco
003b0000-55dd-a916-979d-93561348f8e0	2	0	POSEBNI MATERIAL IN STORITVE	POSEBNI MATERIAL IN STORITVE
003b0000-55dd-a916-7404-7cc0b9bd8ae8	2	1	Drugi posebni material in storitve	drugi posebni material in storitve (npr. za instrumete - navedite)
003b0000-55dd-a916-a416-41cbc2d675b1	3	0	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE
003b0000-55dd-a916-0ced-2ed0d288769c	3	1	Poštnina in kurirske storitve	poštnina in kurirske storitve
003b0000-55dd-a916-eef1-839de766bc48	4	0	PREVOZNI STROŠKI IN STORITVE	PREVOZNI STROŠKI IN STORITVE
003b0000-55dd-a916-4f75-e1d8bb3654ab	4	1	Goriva in maziva za prevozna sredstva	goriva in maziva za prevozna sredstva
003b0000-55dd-a916-3f75-42e7c2e3f5b9	4	2	Najem vozil in selitveni stroški	najem vozil in selitveni stroški
003b0000-55dd-a916-d654-94e362b4703c	4	3	Drugi prevozni in transportni stroški 	drugi prevozni in transportni stroški (navedite)
003b0000-55dd-a916-4a62-955a69cbc88b	5	0	IZDATKI ZA SLUŽBENA POTOVANJA	IZDATKI ZA SLUŽBENA POTOVANJA
003b0000-55dd-a916-cb08-cd43b1823ce3	5	1	Dnevnice za službena potovanja v državi in tujini	dnevnice za službena potovanja v državi in tujini
003b0000-55dd-a916-f83c-902a871001fe	5	2	Hotelske in restavra. storitve v državi in tujini	hotelske in restavra. storitve v državi in tujini
003b0000-55dd-a916-4f3e-70947647f88c	5	3	Stroški prevoza v državi in tujini	stroški prevoza v državi in tujini
003b0000-55dd-a916-b305-79a5e3b33b39	5	4	Drugi izdatki za službena potovanja	drugi izdatki za službena potovanja (navedite)
003b0000-55dd-a916-6c44-5ac32e29ccf5	6	0	NAJEMNINE IN ZAKUPNINE	NAJEMNINE IN ZAKUPNINE
003b0000-55dd-a916-0ded-bbece1a77b00	6	1	Druge najemnine, zakupnine in licenčnine	druge najemnine, zakupnine in licenčnine (npr. najem notnega materiala, instrumentov - navedite)
003b0000-55dd-a916-42c0-bf1e274f5d61	7	0	DRUGI OPERATIVNI ODHODKI	DRUGI OPERATIVNI ODHODKI
003b0000-55dd-a916-f74e-add4ea8c265c	7	1	Izdatki za strok. izobraževanje zap.	izdatki za strok. izobraževanje zap.(vezani na program. enote)  
\.


--
-- TOC entry 2967 (class 0 OID 15629427)
-- Dependencies: 235
-- Data for Name: vrstazapisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstazapisa (id, oznaka, naziv, aktiven, znacka, ikona, upor, datknj) FROM stdin;
\.


--
-- TOC entry 2966 (class 0 OID 15629399)
-- Dependencies: 234
-- Data for Name: zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapis (id, vrsta_id, datoteka_id, mapa_id, avtor_id, zaklenil_id, tip, zaklenjen, datumzaklepanja, identifier, subject, title, description, coverage, creator, language, date, publisher, relation, rights, source, upor, datknj, standard, lokacija) FROM stdin;
\.


--
-- TOC entry 2968 (class 0 OID 15629439)
-- Dependencies: 236
-- Data for Name: zapislastnik; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapislastnik (id, zapis_id, lastnik, classlastnika, datum, upor, datknj) FROM stdin;
\.


--
-- TOC entry 2944 (class 0 OID 15629072)
-- Dependencies: 212
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, sifra, status, zacetek, konec, tip, delovnaobveza, malica, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci) FROM stdin;
00100000-55dd-a918-5d85-658c66f7634a	00090000-55dd-a918-cbdb-fcf7d436bbdd	01	A	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55dd-a918-d47f-a8860ec5af43	00090000-55dd-a918-d803-e026c723e945	02	A	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55dd-a918-d617-31b9f7328168	00090000-55dd-a918-4757-5e5e841123be	03	A	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55dd-a918-cc0b-c47b209fbaa7	00090000-55dd-a918-e62c-3f86c7496681	04	A	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55dd-a918-3dfe-ac27ff3691ec	00090000-55dd-a918-1d48-b5db5ab80890	05	A	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55dd-a918-4ba7-7b25e37a6fcd	00090000-55dd-a918-7f4f-fad684bf99e8	06	A	2010-02-01	2010-02-01	1	2		t	f	f	t
\.


--
-- TOC entry 2924 (class 0 OID 15628903)
-- Dependencies: 192
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id) FROM stdin;
\.


--
-- TOC entry 2952 (class 0 OID 15629167)
-- Dependencies: 220
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, sifra, naziv, opis) FROM stdin;
00140000-55dd-a916-3ba6-d1cb0580d0fc	01	Drama	drama (SURS 01)
00140000-55dd-a916-4f04-4f0cade77323	02	Opera	opera (SURS 02)
00140000-55dd-a916-000a-912de3f43ae6	03	Balet	balet (SURS 03)
00140000-55dd-a916-e46d-67eadfb7e72a	04	Plesne prireditve	plesne prireditve (SURS 04)
00140000-55dd-a916-59c6-af9b8f069ec4	05	Lutkovno gledališče	lutkovno gledališče (SURS 05)
00140000-55dd-a916-c7c7-884d2e85f956	06	Raziskovalno gledališče	raziskovalno gledališče (SURS 06)
00140000-55dd-a916-a8d7-89fc18c9b6d0	07	Drugo	drugo (SURS 07)
\.


--
-- TOC entry 2943 (class 0 OID 15629062)
-- Dependencies: 211
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, sifra, naziv, opis) FROM stdin;
00150000-55dd-a916-4a1c-6f218b88dfe0	01	Opera	opera
00150000-55dd-a916-5d04-e34c81970101	02	Opereta	opereta
00150000-55dd-a916-7344-3ddc8142664f	03	Balet	balet
00150000-55dd-a916-cb5e-7770ef319783	04	Plesne prireditve	plesne prireditve
00150000-55dd-a916-b001-de02bd804cae	05	Lutkovno gledališče	lutkovno gledališče
00150000-55dd-a916-50b7-c076ba0a9ff3	06	Raziskovalno gledališče	raziskovalno gledališče
00150000-55dd-a916-f8bc-7a4e02bef690	07	Biografska drama	biografska drama
00150000-55dd-a916-5ca5-a03896e3bb92	08	Komedija	komedija
00150000-55dd-a916-7b98-0ef0623198c2	09	Črna komedija	črna komedija
00150000-55dd-a916-3dc1-c59de1af4713	10	E-igra	E-igra
00150000-55dd-a916-e49a-0ce230fdf7b7	11	Kriminalka	kriminalka
00150000-55dd-a916-ed5a-1d522a166137	12	Musical	musical
\.


--
-- TOC entry 2446 (class 2606 OID 15628710)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2624 (class 2606 OID 15629224)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2620 (class 2606 OID 15629214)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2597 (class 2606 OID 15629128)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2687 (class 2606 OID 15629479)
-- Name: datoteka_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT datoteka_pkey PRIMARY KEY (id);


--
-- TOC entry 2501 (class 2606 OID 15628893)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2517 (class 2606 OID 15628918)
-- Name: dogodekizven_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodekizven
    ADD CONSTRAINT dogodekizven_pkey PRIMARY KEY (id);


--
-- TOC entry 2654 (class 2606 OID 15629373)
-- Name: drugivir_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT drugivir_pkey PRIMARY KEY (id);


--
-- TOC entry 2480 (class 2606 OID 15628835)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2631 (class 2606 OID 15629279)
-- Name: enotaprograma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT enotaprograma_pkey PRIMARY KEY (id);


--
-- TOC entry 2575 (class 2606 OID 15629058)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2495 (class 2606 OID 15628869)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2514 (class 2606 OID 15628912)
-- Name: gostujoca_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT gostujoca_pkey PRIMARY KEY (id);


--
-- TOC entry 2488 (class 2606 OID 15628849)
-- Name: kontaktnaoseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT kontaktnaoseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2539 (class 2606 OID 15628966)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2681 (class 2606 OID 15629456)
-- Name: mapa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT mapa_pkey PRIMARY KEY (id);


--
-- TOC entry 2685 (class 2606 OID 15629463)
-- Name: mapa_zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT mapa_zapis_pkey PRIMARY KEY (mapa_id, zapis_id);


--
-- TOC entry 2692 (class 2606 OID 15629487)
-- Name: mapaacl_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT mapaacl_pkey PRIMARY KEY (id);


--
-- TOC entry 2551 (class 2606 OID 15628993)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2473 (class 2606 OID 15628807)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2450 (class 2606 OID 15628719)
-- Name: optionvalue_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT optionvalue_pkey PRIMARY KEY (id);


--
-- TOC entry 2453 (class 2606 OID 15628743)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2444 (class 2606 OID 15628699)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2437 (class 2606 OID 15628684)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2554 (class 2606 OID 15628999)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2568 (class 2606 OID 15629034)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2606 (class 2606 OID 15629162)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2462 (class 2606 OID 15628771)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2470 (class 2606 OID 15628795)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2543 (class 2606 OID 15628972)
-- Name: postavkaracuna_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT postavkaracuna_pkey PRIMARY KEY (id);


--
-- TOC entry 2468 (class 2606 OID 15628785)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2493 (class 2606 OID 15628856)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2549 (class 2606 OID 15628984)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2643 (class 2606 OID 15629336)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2645 (class 2606 OID 15629344)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2639 (class 2606 OID 15629327)
-- Name: programdela_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT programdela_pkey PRIMARY KEY (id);


--
-- TOC entry 2650 (class 2606 OID 15629355)
-- Name: programskaenotasklopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT programskaenotasklopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2561 (class 2606 OID 15629016)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2537 (class 2606 OID 15628957)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2531 (class 2606 OID 15628948)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2601 (class 2606 OID 15629150)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2588 (class 2606 OID 15629086)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2429 (class 2606 OID 15628655)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2566 (class 2606 OID 15629025)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2435 (class 2606 OID 15628673)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2439 (class 2606 OID 15628693)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2573 (class 2606 OID 15629043)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2545 (class 2606 OID 15628979)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2519 (class 2606 OID 15628927)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2663 (class 2606 OID 15629397)
-- Name: stevilcenje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenje
    ADD CONSTRAINT stevilcenje_pkey PRIMARY KEY (id);


--
-- TOC entry 2660 (class 2606 OID 15629385)
-- Name: stevilcenjekonfig_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT stevilcenjekonfig_pkey PRIMARY KEY (id);


--
-- TOC entry 2657 (class 2606 OID 15629379)
-- Name: stevilcenjestanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjestanje
    ADD CONSTRAINT stevilcenjestanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2593 (class 2606 OID 15629099)
-- Name: strosekuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT strosekuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2459 (class 2606 OID 15628752)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2525 (class 2606 OID 15628938)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2599 (class 2606 OID 15629139)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2652 (class 2606 OID 15629367)
-- Name: tipprogramskeenote_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipprogramskeenote
    ADD CONSTRAINT tipprogramskeenote_pkey PRIMARY KEY (id);


--
-- TOC entry 2478 (class 2606 OID 15628820)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2431 (class 2606 OID 15628668)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2618 (class 2606 OID 15629193)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2499 (class 2606 OID 15628878)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2557 (class 2606 OID 15629007)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2595 (class 2606 OID 15629111)
-- Name: vrstastroska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstastroska
    ADD CONSTRAINT vrstastroska_pkey PRIMARY KEY (id);


--
-- TOC entry 2674 (class 2606 OID 15629437)
-- Name: vrstazapisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstazapisa
    ADD CONSTRAINT vrstazapisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2671 (class 2606 OID 15629421)
-- Name: zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT zapis_pkey PRIMARY KEY (id);


--
-- TOC entry 2677 (class 2606 OID 15629445)
-- Name: zapislastnik_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT zapislastnik_pkey PRIMARY KEY (id);


--
-- TOC entry 2584 (class 2606 OID 15629077)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2512 (class 2606 OID 15628907)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2610 (class 2606 OID 15629175)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2581 (class 2606 OID 15629070)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2502 (class 1259 OID 15628900)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2589 (class 1259 OID 15629100)
-- Name: idx_11ffe6e05c75296c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e05c75296c ON strosekuprizoritve USING btree (vrstastroska_id);


--
-- TOC entry 2590 (class 1259 OID 15629101)
-- Name: idx_11ffe6e062b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e062b4ffca ON strosekuprizoritve USING btree (uprizoritev_id);


--
-- TOC entry 2591 (class 1259 OID 15629102)
-- Name: idx_11ffe6e06beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e06beede51 ON strosekuprizoritve USING btree (popa_id);


--
-- TOC entry 2678 (class 1259 OID 15629458)
-- Name: idx_14a5d6d3727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d3727aca70 ON mapa USING btree (parent_id);


--
-- TOC entry 2679 (class 1259 OID 15629457)
-- Name: idx_14a5d6d38a4a6c12; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d38a4a6c12 ON mapa USING btree (lastnik_id);


--
-- TOC entry 2460 (class 1259 OID 15628773)
-- Name: idx_1c7adba5ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba5ee4b985a ON popa USING btree (drzava_id);


--
-- TOC entry 2552 (class 1259 OID 15629000)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2665 (class 1259 OID 15629425)
-- Name: idx_1ed92829253c4123; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829253c4123 ON zapis USING btree (avtor_id);


--
-- TOC entry 2666 (class 1259 OID 15629424)
-- Name: idx_1ed9282957ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282957ed422f ON zapis USING btree (mapa_id);


--
-- TOC entry 2667 (class 1259 OID 15629426)
-- Name: idx_1ed9282987ff3295; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282987ff3295 ON zapis USING btree (zaklenil_id);


--
-- TOC entry 2668 (class 1259 OID 15629423)
-- Name: idx_1ed92829a54dbb1f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829a54dbb1f ON zapis USING btree (datoteka_id);


--
-- TOC entry 2669 (class 1259 OID 15629422)
-- Name: idx_1ed92829ef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829ef943358 ON zapis USING btree (vrsta_id);


--
-- TOC entry 2546 (class 1259 OID 15628986)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2547 (class 1259 OID 15628985)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2497 (class 1259 OID 15628879)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2576 (class 1259 OID 15629059)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2577 (class 1259 OID 15629061)
-- Name: idx_23aeb9586b361365; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9586b361365 ON funkcija USING btree (tipfunkcije_id);


--
-- TOC entry 2578 (class 1259 OID 15629060)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2485 (class 1259 OID 15628851)
-- Name: idx_2942b10710389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b10710389148 ON kontaktnaoseba USING btree (oseba_id);


--
-- TOC entry 2486 (class 1259 OID 15628850)
-- Name: idx_2942b1076beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b1076beede51 ON kontaktnaoseba USING btree (popa_id);


--
-- TOC entry 2648 (class 1259 OID 15629356)
-- Name: idx_2d901816d6bc69d6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2d901816d6bc69d6 ON programskaenotasklopa USING btree (programrazno_id);


--
-- TOC entry 2602 (class 1259 OID 15629164)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2603 (class 1259 OID 15629165)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2604 (class 1259 OID 15629166)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2675 (class 1259 OID 15629446)
-- Name: idx_2eaff9dcaf91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2eaff9dcaf91ecd ON zapislastnik USING btree (zapis_id);


--
-- TOC entry 2611 (class 1259 OID 15629198)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2612 (class 1259 OID 15629195)
-- Name: idx_344a77a7c3b0d59; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a7c3b0d59 ON uprizoritev USING btree (maticnioder_id);


--
-- TOC entry 2613 (class 1259 OID 15629199)
-- Name: idx_344a77a853a965c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a853a965c ON uprizoritev USING btree (producent_id);


--
-- TOC entry 2614 (class 1259 OID 15629197)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2615 (class 1259 OID 15629196)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2475 (class 1259 OID 15628822)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2476 (class 1259 OID 15628821)
-- Name: idx_37f6541a6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a6beede51 ON trr USING btree (popa_id);


--
-- TOC entry 2451 (class 1259 OID 15628746)
-- Name: idx_466966d769e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_466966d769e8d4 ON oseba USING btree (naslov_id);


--
-- TOC entry 2564 (class 1259 OID 15629026)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2515 (class 1259 OID 15628913)
-- Name: idx_4a45d07962b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4a45d07962b4ffca ON gostujoca USING btree (uprizoritev_id);


--
-- TOC entry 2441 (class 1259 OID 15628700)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2442 (class 1259 OID 15628701)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2569 (class 1259 OID 15629046)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2570 (class 1259 OID 15629045)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2571 (class 1259 OID 15629044)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2489 (class 1259 OID 15628857)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2490 (class 1259 OID 15628859)
-- Name: idx_602f6e466f7e7a33; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e466f7e7a33 ON predstava USING btree (gostujoc_id);


--
-- TOC entry 2491 (class 1259 OID 15628858)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2658 (class 1259 OID 15629387)
-- Name: idx_6054e804ff55f926; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_6054e804ff55f926 ON stevilcenjekonfig USING btree (stevilcenje_id);


--
-- TOC entry 2526 (class 1259 OID 15628952)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2527 (class 1259 OID 15628950)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2528 (class 1259 OID 15628949)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2529 (class 1259 OID 15628951)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2432 (class 1259 OID 15628674)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2433 (class 1259 OID 15628675)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2555 (class 1259 OID 15629008)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2688 (class 1259 OID 15629480)
-- Name: idx_781826c67e3c61f9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_781826c67e3c61f9 ON datoteka USING btree (owner_id);


--
-- TOC entry 2689 (class 1259 OID 15629488)
-- Name: idx_7adc957157ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc957157ed422f ON mapaacl USING btree (mapa_id);


--
-- TOC entry 2690 (class 1259 OID 15629489)
-- Name: idx_7adc9571fa6311ef; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc9571fa6311ef ON mapaacl USING btree (perm_id);


--
-- TOC entry 2541 (class 1259 OID 15628973)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2585 (class 1259 OID 15629087)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2586 (class 1259 OID 15629088)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2632 (class 1259 OID 15629284)
-- Name: idx_8787a0e54ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e54ae1cd1c ON enotaprograma USING btree (gostitelj_id);


--
-- TOC entry 2633 (class 1259 OID 15629283)
-- Name: idx_8787a0e55d0da56c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e55d0da56c ON enotaprograma USING btree (drzavagostovanja_id);


--
-- TOC entry 2634 (class 1259 OID 15629280)
-- Name: idx_8787a0e562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e562b4ffca ON enotaprograma USING btree (uprizoritev_id);


--
-- TOC entry 2635 (class 1259 OID 15629281)
-- Name: idx_8787a0e57222d84b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e57222d84b ON enotaprograma USING btree (tipprogramskeenote_id);


--
-- TOC entry 2636 (class 1259 OID 15629282)
-- Name: idx_8787a0e5771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e5771ec7bd ON enotaprograma USING btree (program_dela_id);


--
-- TOC entry 2464 (class 1259 OID 15628787)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2465 (class 1259 OID 15628786)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2466 (class 1259 OID 15628788)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2558 (class 1259 OID 15629020)
-- Name: idx_952dd21969e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd21969e8d4 ON prostor USING btree (naslov_id);


--
-- TOC entry 2559 (class 1259 OID 15629019)
-- Name: idx_952dd2196beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd2196beede51 ON prostor USING btree (popa_id);


--
-- TOC entry 2640 (class 1259 OID 15629337)
-- Name: idx_97af082e38c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e38c06eb ON produkcijadelitev USING btree (enotaprograma_id);


--
-- TOC entry 2641 (class 1259 OID 15629338)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2625 (class 1259 OID 15629228)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2626 (class 1259 OID 15629229)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2627 (class 1259 OID 15629226)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2628 (class 1259 OID 15629227)
-- Name: idx_a4b7244fa4976613; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fa4976613 ON alternacija USING btree (zaposlitev_id);


--
-- TOC entry 2582 (class 1259 OID 15629078)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2532 (class 1259 OID 15628961)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2533 (class 1259 OID 15628960)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2534 (class 1259 OID 15628958)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2535 (class 1259 OID 15628959)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2621 (class 1259 OID 15629216)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2622 (class 1259 OID 15629215)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2637 (class 1259 OID 15629328)
-- Name: idx_c81bc37f3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c81bc37f3a0e32e3 ON programdela USING btree (sezona_id);


--
-- TOC entry 2496 (class 1259 OID 15628870)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2655 (class 1259 OID 15629374)
-- Name: idx_e7d4cf2638c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e7d4cf2638c06eb ON drugivir USING btree (enotaprograma_id);


--
-- TOC entry 2682 (class 1259 OID 15629464)
-- Name: idx_e9f8ee8257ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee8257ed422f ON mapa_zapis USING btree (mapa_id);


--
-- TOC entry 2683 (class 1259 OID 15629465)
-- Name: idx_e9f8ee82af91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee82af91ecd ON mapa_zapis USING btree (zapis_id);


--
-- TOC entry 2447 (class 1259 OID 15628721)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2448 (class 1259 OID 15628720)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2456 (class 1259 OID 15628753)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2457 (class 1259 OID 15628754)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2521 (class 1259 OID 15628942)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2522 (class 1259 OID 15628941)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2523 (class 1259 OID 15628939)
-- Name: idx_fef7d84ba81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84ba81ccef6 ON terminstoritve USING btree (dogodek_id);


--
-- TOC entry 2503 (class 1259 OID 15628902)
-- Name: konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX konec ON dogodek USING btree (konec);


--
-- TOC entry 2504 (class 1259 OID 15628898)
-- Name: uniq_11e93b5d10398482; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d10398482 ON dogodek USING btree (dogodek_izven_id);


--
-- TOC entry 2505 (class 1259 OID 15628895)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2506 (class 1259 OID 15628896)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2507 (class 1259 OID 15628894)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2508 (class 1259 OID 15628899)
-- Name: uniq_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2509 (class 1259 OID 15628897)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2463 (class 1259 OID 15628772)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2481 (class 1259 OID 15628836)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2482 (class 1259 OID 15628838)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2483 (class 1259 OID 15628837)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2484 (class 1259 OID 15628839)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2540 (class 1259 OID 15628967)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2607 (class 1259 OID 15629163)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2616 (class 1259 OID 15629194)
-- Name: uniq_344a77a559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_344a77a559828a3 ON uprizoritev USING btree (sifra);


--
-- TOC entry 2454 (class 1259 OID 15628744)
-- Name: uniq_466966d7559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7559828a3 ON oseba USING btree (sifra);


--
-- TOC entry 2455 (class 1259 OID 15628745)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2579 (class 1259 OID 15629071)
-- Name: uniq_5216fcb0559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5216fcb0559828a3 ON zvrstuprizoritve USING btree (sifra);


--
-- TOC entry 2664 (class 1259 OID 15629398)
-- Name: uniq_5a434fbc559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5a434fbc559828a3 ON stevilcenje USING btree (sifra);


--
-- TOC entry 2474 (class 1259 OID 15628808)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2661 (class 1259 OID 15629386)
-- Name: uniq_6054e804889a7556; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_6054e804889a7556 ON stevilcenjekonfig USING btree (dok);


--
-- TOC entry 2562 (class 1259 OID 15629018)
-- Name: uniq_952dd21937854736; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21937854736 ON prostor USING btree (naziv);


--
-- TOC entry 2563 (class 1259 OID 15629017)
-- Name: uniq_952dd219559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd219559828a3 ON prostor USING btree (sifra);


--
-- TOC entry 2629 (class 1259 OID 15629225)
-- Name: uniq_a4b7244f559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a4b7244f559828a3 ON alternacija USING btree (sifra);


--
-- TOC entry 2471 (class 1259 OID 15628796)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2608 (class 1259 OID 15629176)
-- Name: uniq_cede8e36559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_cede8e36559828a3 ON zvrstsurs USING btree (sifra);


--
-- TOC entry 2672 (class 1259 OID 15629438)
-- Name: uniq_de1c8aa1d55226c7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_de1c8aa1d55226c7 ON vrstazapisa USING btree (oznaka);


--
-- TOC entry 2646 (class 1259 OID 15629345)
-- Name: uniq_e6fc2028559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc2028559828a3 ON produkcijskahisa USING btree (sifra);


--
-- TOC entry 2647 (class 1259 OID 15629346)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2520 (class 1259 OID 15628928)
-- Name: uniq_ecc8f8c5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ecc8f8c5559828a3 ON sezona USING btree (sifra);


--
-- TOC entry 2440 (class 1259 OID 15628694)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2510 (class 1259 OID 15628901)
-- Name: zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2720 (class 2606 OID 15629625)
-- Name: fk_11e93b5d10398482; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d10398482 FOREIGN KEY (dogodek_izven_id) REFERENCES dogodekizven(id);


--
-- TOC entry 2717 (class 2606 OID 15629610)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2718 (class 2606 OID 15629615)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2722 (class 2606 OID 15629635)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2716 (class 2606 OID 15629605)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2721 (class 2606 OID 15629630)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2719 (class 2606 OID 15629620)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2753 (class 2606 OID 15629790)
-- Name: fk_11ffe6e05c75296c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e05c75296c FOREIGN KEY (vrstastroska_id) REFERENCES vrstastroska(id);


--
-- TOC entry 2754 (class 2606 OID 15629795)
-- Name: fk_11ffe6e062b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e062b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2755 (class 2606 OID 15629800)
-- Name: fk_11ffe6e06beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e06beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2789 (class 2606 OID 15629970)
-- Name: fk_14a5d6d3727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d3727aca70 FOREIGN KEY (parent_id) REFERENCES mapa(id);


--
-- TOC entry 2788 (class 2606 OID 15629965)
-- Name: fk_14a5d6d38a4a6c12; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d38a4a6c12 FOREIGN KEY (lastnik_id) REFERENCES uporabniki(id);


--
-- TOC entry 2703 (class 2606 OID 15629540)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2739 (class 2606 OID 15629720)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2785 (class 2606 OID 15629950)
-- Name: fk_1ed92829253c4123; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829253c4123 FOREIGN KEY (avtor_id) REFERENCES uporabniki(id);


--
-- TOC entry 2784 (class 2606 OID 15629945)
-- Name: fk_1ed9282957ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282957ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2786 (class 2606 OID 15629955)
-- Name: fk_1ed9282987ff3295; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282987ff3295 FOREIGN KEY (zaklenil_id) REFERENCES uporabniki(id);


--
-- TOC entry 2783 (class 2606 OID 15629940)
-- Name: fk_1ed92829a54dbb1f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829a54dbb1f FOREIGN KEY (datoteka_id) REFERENCES datoteka(id);


--
-- TOC entry 2782 (class 2606 OID 15629935)
-- Name: fk_1ed92829ef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829ef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstazapisa(id);


--
-- TOC entry 2738 (class 2606 OID 15629715)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2737 (class 2606 OID 15629710)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2715 (class 2606 OID 15629600)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2747 (class 2606 OID 15629760)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2749 (class 2606 OID 15629770)
-- Name: fk_23aeb9586b361365; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9586b361365 FOREIGN KEY (tipfunkcije_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2748 (class 2606 OID 15629765)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2710 (class 2606 OID 15629575)
-- Name: fk_2942b10710389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b10710389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2709 (class 2606 OID 15629570)
-- Name: fk_2942b1076beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b1076beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2735 (class 2606 OID 15629700)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2779 (class 2606 OID 15629920)
-- Name: fk_2d901816d6bc69d6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT fk_2d901816d6bc69d6 FOREIGN KEY (programrazno_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2756 (class 2606 OID 15629805)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2757 (class 2606 OID 15629810)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2758 (class 2606 OID 15629815)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 2787 (class 2606 OID 15629960)
-- Name: fk_2eaff9dcaf91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT fk_2eaff9dcaf91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id);


--
-- TOC entry 2762 (class 2606 OID 15629835)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2759 (class 2606 OID 15629820)
-- Name: fk_344a77a7c3b0d59; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a7c3b0d59 FOREIGN KEY (maticnioder_id) REFERENCES prostor(id);


--
-- TOC entry 2763 (class 2606 OID 15629840)
-- Name: fk_344a77a853a965c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a853a965c FOREIGN KEY (producent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2761 (class 2606 OID 15629830)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2760 (class 2606 OID 15629825)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2708 (class 2606 OID 15629565)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2707 (class 2606 OID 15629560)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2700 (class 2606 OID 15629525)
-- Name: fk_466966d769e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d769e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2699 (class 2606 OID 15629520)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2743 (class 2606 OID 15629740)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2723 (class 2606 OID 15629640)
-- Name: fk_4a45d07962b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT fk_4a45d07962b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2695 (class 2606 OID 15629500)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2696 (class 2606 OID 15629505)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2746 (class 2606 OID 15629755)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2745 (class 2606 OID 15629750)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2744 (class 2606 OID 15629745)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2711 (class 2606 OID 15629580)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2713 (class 2606 OID 15629590)
-- Name: fk_602f6e466f7e7a33; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e466f7e7a33 FOREIGN KEY (gostujoc_id) REFERENCES gostujoca(id);


--
-- TOC entry 2712 (class 2606 OID 15629585)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2781 (class 2606 OID 15629930)
-- Name: fk_6054e804ff55f926; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT fk_6054e804ff55f926 FOREIGN KEY (stevilcenje_id) REFERENCES stevilcenje(id);


--
-- TOC entry 2730 (class 2606 OID 15629675)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2728 (class 2606 OID 15629665)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2727 (class 2606 OID 15629660)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2729 (class 2606 OID 15629670)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2693 (class 2606 OID 15629490)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2694 (class 2606 OID 15629495)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2740 (class 2606 OID 15629725)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2792 (class 2606 OID 15629985)
-- Name: fk_781826c67e3c61f9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT fk_781826c67e3c61f9 FOREIGN KEY (owner_id) REFERENCES uporabniki(id);


--
-- TOC entry 2793 (class 2606 OID 15629990)
-- Name: fk_7adc957157ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc957157ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2794 (class 2606 OID 15629995)
-- Name: fk_7adc9571fa6311ef; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc9571fa6311ef FOREIGN KEY (perm_id) REFERENCES permission(id);


--
-- TOC entry 2736 (class 2606 OID 15629705)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2751 (class 2606 OID 15629780)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2752 (class 2606 OID 15629785)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2774 (class 2606 OID 15629895)
-- Name: fk_8787a0e54ae1cd1c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e54ae1cd1c FOREIGN KEY (gostitelj_id) REFERENCES popa(id);


--
-- TOC entry 2773 (class 2606 OID 15629890)
-- Name: fk_8787a0e55d0da56c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e55d0da56c FOREIGN KEY (drzavagostovanja_id) REFERENCES drza(id);


--
-- TOC entry 2770 (class 2606 OID 15629875)
-- Name: fk_8787a0e562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2771 (class 2606 OID 15629880)
-- Name: fk_8787a0e57222d84b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e57222d84b FOREIGN KEY (tipprogramskeenote_id) REFERENCES tipprogramskeenote(id);


--
-- TOC entry 2772 (class 2606 OID 15629885)
-- Name: fk_8787a0e5771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e5771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2705 (class 2606 OID 15629550)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2704 (class 2606 OID 15629545)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2706 (class 2606 OID 15629555)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2742 (class 2606 OID 15629735)
-- Name: fk_952dd21969e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd21969e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2741 (class 2606 OID 15629730)
-- Name: fk_952dd2196beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd2196beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2776 (class 2606 OID 15629905)
-- Name: fk_97af082e38c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e38c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2777 (class 2606 OID 15629910)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2768 (class 2606 OID 15629865)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2769 (class 2606 OID 15629870)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2766 (class 2606 OID 15629855)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 2767 (class 2606 OID 15629860)
-- Name: fk_a4b7244fa4976613; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fa4976613 FOREIGN KEY (zaposlitev_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2750 (class 2606 OID 15629775)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2734 (class 2606 OID 15629695)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2733 (class 2606 OID 15629690)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2731 (class 2606 OID 15629680)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2732 (class 2606 OID 15629685)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2765 (class 2606 OID 15629850)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2764 (class 2606 OID 15629845)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2775 (class 2606 OID 15629900)
-- Name: fk_c81bc37f3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT fk_c81bc37f3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2714 (class 2606 OID 15629595)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2778 (class 2606 OID 15629915)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2780 (class 2606 OID 15629925)
-- Name: fk_e7d4cf2638c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT fk_e7d4cf2638c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2790 (class 2606 OID 15629975)
-- Name: fk_e9f8ee8257ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee8257ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id) ON DELETE CASCADE;


--
-- TOC entry 2791 (class 2606 OID 15629980)
-- Name: fk_e9f8ee82af91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee82af91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id) ON DELETE CASCADE;


--
-- TOC entry 2698 (class 2606 OID 15629515)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2697 (class 2606 OID 15629510)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2701 (class 2606 OID 15629530)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2702 (class 2606 OID 15629535)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2726 (class 2606 OID 15629655)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2725 (class 2606 OID 15629650)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2724 (class 2606 OID 15629645)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- Completed on 2015-08-26 13:55:06 CEST

--
-- PostgreSQL database dump complete
--

